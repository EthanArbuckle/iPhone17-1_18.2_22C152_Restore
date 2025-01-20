@interface ASOServiceContext
+ (OS_os_log)log;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (ASOServiceContextDelegate)delegate;
- (BOOL)hasPrivateEntitlement;
- (BOOL)isAppClip;
- (BOOL)isBetaApp;
- (BOOL)isDevelopmentApp;
- (LSApplicationRecord)appClipParentApplicationRecord;
- (LSApplicationRecord)applicationRecord;
- (NSString)hostAdamID;
- (NSString)hostBundleIdentifier;
- (id)appClipParentBundleIdentifier;
- (id)bundleIdentifierFromApplicationIdentifier:(id)a3;
- (id)hostContext;
- (void)dismissOverlayWithReply:(id)a3;
- (void)presentOverlayWithConfiguration:(id)a3 delegate:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ASOServiceContext

+ (OS_os_log)log
{
  if (qword_10002CAE0 != -1) {
    dispatch_once(&qword_10002CAE0, &stru_100024D70);
  }
  v2 = (void *)qword_10002CAE8;

  return (OS_os_log *)v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[ASOHostContext _extensionAuxiliaryHostProtocol];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[ASOHostContext _extensionAuxiliaryVendorProtocol];
}

- (id)hostContext
{
  v2 = [(ASOServiceContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (BOOL)isAppClip
{
  p_isAppClip = &self->_isAppClip;
  isAppClip = self->_isAppClip;
  if (!isAppClip)
  {
    v4 = [(ASOServiceContext *)self _auxiliaryConnection];
    v5 = [v4 valueForEntitlement:@"com.apple.developer.on-demand-install-capable"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)p_isAppClip, v5);
    }

    isAppClip = *p_isAppClip;
  }

  return [(NSNumber *)isAppClip BOOLValue];
}

- (NSString)hostAdamID
{
  hostAdamID = self->_hostAdamID;
  if (hostAdamID)
  {
    v3 = hostAdamID;
  }
  else
  {
    v5 = [(ASOServiceContext *)self applicationRecord];
    v6 = [v5 iTunesMetadata];
    v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 storeItemIdentifier]);

    if ([v7 longLongValue])
    {
      v8 = [v7 stringValue];
      v9 = self->_hostAdamID;
      self->_hostAdamID = v8;

      v3 = self->_hostAdamID;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (NSString)hostBundleIdentifier
{
  hostBundleIdentifier = self->_hostBundleIdentifier;
  if (hostBundleIdentifier)
  {
    v3 = hostBundleIdentifier;
  }
  else
  {
    CFErrorRef error = 0;
    v5 = [(ASOServiceContext *)self _auxiliaryConnection];
    v6 = v5;
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    v7 = SecTaskCreateWithAuditToken(0, &v15);

    v8 = (__CFString *)SecTaskCopySigningIdentifier(v7, &error);
    if (error)
    {
      v9 = +[ASOServiceContext log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [(__CFError *)error debugDescription];
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to get bundle id with error: %{public}@", buf, 0xCu);
      }
    }
    CFRelease(v7);
    v11 = +[ASOServiceContext log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found bundle ID for host app: %{public}@", buf, 0xCu);
    }

    v12 = self->_hostBundleIdentifier;
    self->_hostBundleIdentifier = &v8->isa;
    v13 = v8;

    v3 = self->_hostBundleIdentifier;
  }

  return v3;
}

- (id)appClipParentBundleIdentifier
{
  appClipParentBundleIdentifier = self->_appClipParentBundleIdentifier;
  if (appClipParentBundleIdentifier)
  {
    v3 = appClipParentBundleIdentifier;
  }
  else if ([(ASOServiceContext *)self isAppClip])
  {
    v5 = [(ASOServiceContext *)self _auxiliaryConnection];
    v6 = [v5 valueForEntitlement:@"com.apple.developer.parent-application-identifiers"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v9 = [v6 firstObject];
        v10 = [(ASOServiceContext *)self bundleIdentifierFromApplicationIdentifier:v9];
        v11 = self->_appClipParentBundleIdentifier;
        self->_appClipParentBundleIdentifier = v10;
      }
    }
    v3 = self->_appClipParentBundleIdentifier;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isBetaApp
{
  isBetaApp = self->_isBetaApp;
  if (!isBetaApp)
  {
    v4 = [(ASOServiceContext *)self applicationRecord];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isBeta]);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_isBetaApp;
    self->_isBetaApp = v5;

    isBetaApp = self->_isBetaApp;
  }

  return [(NSNumber *)isBetaApp BOOLValue];
}

- (BOOL)isDevelopmentApp
{
  isDevelopmentApp = self->_isDevelopmentApp;
  if (!isDevelopmentApp)
  {
    v4 = [(ASOServiceContext *)self applicationRecord];
    v5 = [v4 iTunesMetadata];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 storeItemIdentifier] == 0);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isDevelopmentApp;
    self->_isDevelopmentApp = v6;

    isDevelopmentApp = self->_isDevelopmentApp;
  }

  return [(NSNumber *)isDevelopmentApp BOOLValue];
}

- (LSApplicationRecord)appClipParentApplicationRecord
{
  v2 = [(ASOServiceContext *)self appClipParentBundleIdentifier];
  if (v2) {
    id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v2 allowPlaceholder:1 error:0];
  }
  else {
    id v3 = 0;
  }

  return (LSApplicationRecord *)v3;
}

- (LSApplicationRecord)applicationRecord
{
  v2 = [(ASOServiceContext *)self hostBundleIdentifier];
  if (v2) {
    id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v2 allowPlaceholder:1 error:0];
  }
  else {
    id v3 = 0;
  }

  return (LSApplicationRecord *)v3;
}

- (BOOL)hasPrivateEntitlement
{
  p_hasPrivateEntitlement = &self->_hasPrivateEntitlement;
  hasPrivateEntitlement = self->_hasPrivateEntitlement;
  if (!hasPrivateEntitlement)
  {
    v4 = [(ASOServiceContext *)self _auxiliaryConnection];
    v5 = [v4 valueForEntitlement:@"com.apple.private.appstoreoverlays.private"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)p_hasPrivateEntitlement, v5);
    }

    hasPrivateEntitlement = *p_hasPrivateEntitlement;
  }

  return [(NSNumber *)hasPrivateEntitlement BOOLValue];
}

- (void)presentOverlayWithConfiguration:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = +[ASOServiceContext log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received presentOverlayWithConfiguration:", v17, 2u);
  }

  uint64_t v12 = [(ASOServiceContext *)self delegate];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(ASOServiceContext *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v16 = [(ASOServiceContext *)self delegate];
      [v16 serviceContext:self presentOverlayWithConfiguration:v8 delegate:v9];
    }
  }
  v10[2](v10, 0);
}

- (void)dismissOverlayWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[ASOServiceContext log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received dismissOverlayWithReply:", v11, 2u);
  }

  uint64_t v6 = [(ASOServiceContext *)self delegate];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(ASOServiceContext *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(ASOServiceContext *)self delegate];
      [v10 serviceContextDismissOverlay:self];
    }
  }
  v4[2](v4);
}

- (id)bundleIdentifierFromApplicationIdentifier:(id)a3
{
  CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();

  return 0;
}

- (ASOServiceContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASOServiceContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appClipParentBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hostAdamID, 0);
  objc_storeStrong((id *)&self->_isDevelopmentApp, 0);
  objc_storeStrong((id *)&self->_isBetaApp, 0);
  objc_storeStrong((id *)&self->_isAppClip, 0);

  objc_storeStrong((id *)&self->_hasPrivateEntitlement, 0);
}

@end