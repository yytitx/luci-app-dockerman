include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-docker-manager
PKG_VERSION:=v0.0.7-beta
PKG_RELEASE:=beta
PKG_MAINTAINER:=lisaac <https://github.com/lisaac/luci-app-docker>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION:=luci
    CATEGORY:=LuCI
    SUBMENU:=3. Applications
    TITLE:=LuCI Support for Docker Manager
    PKGARCH:=all
    DEPENDS:=+luci-lib-docker
endef

define Package/$(PKG_NAME)/description
    Docker Manager interface for LuCI
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
rm -fr /tmp/luci-indexcache /tmp/luci-modulecache
endef

define Package/$(PKG_NAME)/install
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci
    cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
    $(INSTALL_DIR) $(1)/
    cp -pR ./root/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))