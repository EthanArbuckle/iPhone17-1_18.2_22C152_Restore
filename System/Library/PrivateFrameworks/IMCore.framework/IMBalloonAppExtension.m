@interface IMBalloonAppExtension
- (BOOL)canSendDataPayloads;
- (BOOL)isBetaPlugin;
- (BOOL)isLaunchProhibited;
- (BOOL)shouldBalloonHideAppIcon;
- (BOOL)shouldBreadcrumbHideAppIcon;
- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 appBundle:(id)a4;
- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 extension:(id)a4;
- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5;
- (LSPlugInKitProxy)proxy;
- (NSExtension)extension;
- (NSNumber)itemID;
- (NSUUID)requestIdentifier;
- (PKPlugIn)plugin;
- (id)_initWithPluginBundle:(id)a3 extension:(id)a4 pluginKitProxyClass:(Class)a5;
- (id)version;
- (void)setCanSendDataPayloads:(BOOL)a3;
- (void)setProxy:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation IMBalloonAppExtension

- (NSExtension)extension
{
  return self->_extension;
}

- (LSPlugInKitProxy)proxy
{
  return self->_proxy;
}

- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 extension:(id)a4
{
  sub_1A4CBD5E8(v4);
  id v8 = v7;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  v12 = (IMBalloonAppExtension *)objc_msgSend__initWithPluginBundle_extension_pluginKitProxyClass_(self, v11, (uint64_t)v9, (uint64_t)v8, v10);

  return v12;
}

- (id)_initWithPluginBundle:(id)a3 extension:(id)a4 pluginKitProxyClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v13 = v9;
  if (v9)
  {
    v14 = objc_msgSend_identifier(v9, v10, v11, v12);
    v17 = objc_msgSend_pluginKitProxyForIdentifier_(a5, v15, (uint64_t)v14, v16);
  }
  else
  {
    v17 = 0;
  }
  uint64_t v18 = objc_msgSend_initWithPluginBundle_pluginKitProxy_extension_(self, v10, (uint64_t)v8, (uint64_t)v17, v13);
  v19 = (id *)v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 152), a4);
    objc_storeStrong(v19 + 20, v17);
  }

  return v19;
}

- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v12 = objc_msgSend_appWithPluginBundle_pluginKitProxy_extension_(IMBalloonApp, v11, (uint64_t)v10, (uint64_t)v9, a5);
  v15.receiver = self;
  v15.super_class = (Class)IMBalloonAppExtension;
  v13 = [(IMBalloonPlugin *)&v15 initWithBundle:v10 app:v12];

  if (v13) {
    objc_storeStrong((id *)&v13->_proxy, a4);
  }

  return v13;
}

- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend_appWithPluginBundle_appBundle_(IMBalloonApp, v8, (uint64_t)v7, (uint64_t)v6);
  v38.receiver = self;
  v38.super_class = (Class)IMBalloonAppExtension;
  id v10 = [(IMBalloonPlugin *)&v38 initWithBundle:v7 app:v9];

  if (v10)
  {
    v14 = objc_msgSend_infoDictionary(v6, v11, v12, v13);
    uint64_t v18 = objc_msgSend_browserImageName(v10, v15, v16, v17);

    if (!v18)
    {
      v22 = objc_msgSend_objectForKey_(v14, v19, @"CKBrowserDisplayImageName", v21);
      if (objc_msgSend_length(v22, v23, v24, v25)) {
        objc_msgSend_setBrowserImageName_(v10, v26, (uint64_t)v22, v27);
      }
    }
    v28 = objc_msgSend_browserImagePath(v10, v19, v20, v21);

    if (!v28)
    {
      v31 = objc_msgSend_objectForKey_(v14, v29, @"kCKBrowserDisplayImagePath", v30);
      if (objc_msgSend_length(v31, v32, v33, v34)) {
        objc_msgSend_setBrowserImagePath_(v10, v35, (uint64_t)v31, v36);
      }
    }
  }

  return v10;
}

- (id)version
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  id v8 = objc_msgSend_version(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isBetaPlugin
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  char isBetaPlugin = objc_msgSend_isBetaPlugin(v4, v5, v6, v7);

  return isBetaPlugin;
}

- (PKPlugIn)plugin
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  id v8 = objc_msgSend_plugin(v4, v5, v6, v7);

  return (PKPlugIn *)v8;
}

- (BOOL)shouldBalloonHideAppIcon
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  char shouldBalloonHideAppIcon = objc_msgSend_shouldBalloonHideAppIcon(v4, v5, v6, v7);

  return shouldBalloonHideAppIcon;
}

- (BOOL)shouldBreadcrumbHideAppIcon
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  char shouldBreadcrumbHideAppIcon = objc_msgSend_shouldBreadcrumbHideAppIcon(v4, v5, v6, v7);

  return shouldBreadcrumbHideAppIcon;
}

- (BOOL)isLaunchProhibited
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  char isLaunchProhibited = objc_msgSend_isLaunchProhibited(v4, v5, v6, v7);

  return isLaunchProhibited;
}

- (NSNumber)itemID
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  id v8 = objc_msgSend_itemID(v4, v5, v6, v7);

  return (NSNumber *)v8;
}

- (BOOL)canSendDataPayloads
{
  double v4 = objc_msgSend_app(self, a2, v2, v3);
  char canSendDataPayloads = objc_msgSend_canSendDataPayloads(v4, v5, v6, v7);

  return canSendDataPayloads;
}

- (void)setProxy:(id)a3
{
}

- (void)setCanSendDataPayloads:(BOOL)a3
{
  self->_char canSendDataPayloads = a3;
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end