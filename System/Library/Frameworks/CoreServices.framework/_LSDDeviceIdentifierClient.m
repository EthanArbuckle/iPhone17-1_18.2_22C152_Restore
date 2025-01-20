@interface _LSDDeviceIdentifierClient
- (BOOL)canAccessAdvertisingIdentifier;
- (BOOL)hasEntitlementToClearAllIdentifiersOfType:(int64_t)a3;
- (BOOL)hasUninstallEntitlement;
- (_LSDDeviceIdentifierClient)initWithXPCConnection:(id)a3;
- (unsigned)findAppBundleForExecutableURL:(id)a3 withContext:(LSContext *)a4;
- (void)clearAllIdentifiersOfType:(int64_t)a3;
- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)generateIdentifiersWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)getIdentifierOfType:(int64_t)a3 completionHandler:(id)a4;
- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)urlContainsDeviceIdentifierForAdvertising:(id)a3 completionHandler:(id)a4;
@end

@implementation _LSDDeviceIdentifierClient

- (void)getIdentifierOfType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___LSDDeviceIdentifierClient_getIdentifierOfType_completionHandler___block_invoke;
  v8[3] = &unk_1E522E7B8;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(_LSDDeviceIdentifierClient *)self getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:a3 completionHandler:v8];
}

- (void)getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 1
    && ([(_LSDClient *)self XPCConnection],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 _xpcConnection],
        v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = _LSCheckEntitlementForXPCConnectionQuiet(v8, @"com.apple.developer.exposure-notification"),
        v8,
        v7,
        v9))
  {
    int64_t v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = @"com.apple.developer.exposure-notification";
      _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, "Request for IDFA/IDFV from a process that has entitlement %{public}@; ignoring.",
        buf,
        0xCu);
    }

    (*((void (**)(id, void, void, uint64_t))v6 + 2))(v6, 0, 0, 1);
  }
  else
  {
    _LSServer_DatabaseExecutionContext();
    v11 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke;
    v12[3] = &unk_1E522E790;
    v12[4] = self;
    id v13 = v6;
    -[LSDBExecutionContext syncRead:](v11, v12);
  }
}

- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  if (!v10 || !v11)
  {
LABEL_8:
    v12[2](v12, 0);
    goto LABEL_9;
  }
  id v13 = [(_LSDClient *)self XPCConnection];
  v14 = [v13 _xpcConnection];
  int v15 = _LSCheckEntitlementForXPCConnection(v14, @"com.apple.lsapplicationproxy.deviceidentifierforvendor");

  if (!v15)
  {
    v20 = _LSDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(_LSDClient *)self XPCConnection];
      int v22 = 138412802;
      v23 = v21;
      __int16 v24 = 1024;
      int v25 = a3;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_182959000, v20, OS_LOG_TYPE_DEFAULT, "Unentitled request from XPC connection %@ for identifier type %i of vendor %@", (uint8_t *)&v22, 0x1Cu);
    }
    goto LABEL_8;
  }
  uint64_t v16 = +[_LSDeviceIdentifierManager sharedInstance];
  v17 = [(id)getUMUserManagerClass() sharedManager];
  v18 = [v17 currentPersona];
  v19 = [v16 cacheForPersona:v18];
  [v19 getIdentifierOfType:a3 vendorName:v10 bundleIdentifier:v11 completionHandler:v12];

LABEL_9:
}

- (unsigned)findAppBundleForExecutableURL:(id)a3 withContext:(LSContext *)a4
{
  id v5 = a3;
  unsigned int v11 = 0;
  id v6 = [[FSNode alloc] initWithURL:v5 flags:0 error:0];
  if (v6)
  {
    if (_LSBundleFindWithNode((uint64_t)a4, v6, &v11, 0))
    {
      int v10 = 0;
      uint64_t v7 = _LSPluginFindWithInfo(a4->db, 0, 0, 0, v6, &v10, 0);
      if (v7) {
        unsigned int v11 = *(_DWORD *)(v7 + 224);
      }
    }
  }

  unsigned int v8 = v11;
  return v8;
}

- (_LSDDeviceIdentifierClient)initWithXPCConnection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_LSDDeviceIdentifierClient;
  return [(_LSDClient *)&v4 initWithXPCConnection:a3];
}

- (BOOL)hasUninstallEntitlement
{
  v2 = [(_LSDClient *)self XPCConnection];
  v3 = [v2 _xpcConnection];
  BOOL v4 = _LSCheckMIAllowedSPIForXPCConnection(v3, @"UninstallForLaunchServices") != 0;

  return v4;
}

- (BOOL)hasEntitlementToClearAllIdentifiersOfType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      BOOL v4 = [(_LSDClient *)self XPCConnection];
      id v5 = [v4 _xpcConnection];
      int v6 = _LSCheckEntitlementForXPCConnection(v5, @"com.apple.launchservices.clearadvertisingid");
LABEL_8:
      BOOL v7 = v6 != 0;

      return v7;
    }
    return 0;
  }
  else
  {
    if (![(_LSDDeviceIdentifierClient *)self hasUninstallEntitlement])
    {
      BOOL v4 = [(_LSDClient *)self XPCConnection];
      id v5 = [v4 _xpcConnection];
      int v6 = _LSCheckEntitlementForXPCConnection(v5, @"com.apple.launchservices.clearvendorid");
      goto LABEL_8;
    }
    return 1;
  }
}

- (BOOL)canAccessAdvertisingIdentifier
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = +[LSApplicationRestrictionsManager sharedInstance]();
  if ((-[LSApplicationRestrictionsManager isAdTrackingEnabled](v3) & 1) == 0)
  {
    BOOL v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned int v8 = [(_LSDClient *)self XPCConnection];
      buf.val[0] = 67109120;
      buf.val[1] = [v8 processIdentifier];
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because app tracking disabled by device management profile", (uint8_t *)&buf, 8u);
    }
LABEL_6:

    BOOL v9 = 0;
    goto LABEL_7;
  }
  CFStringRef v4 = (const __CFString *)getkTCCServiceUserTracking();
  id v5 = [(_LSDClient *)self XPCConnection];
  int v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(&v27[1], 0, 32);
  }
  audit_token_t buf = *(audit_token_t *)&v27[1];
  unsigned int v11 = softLinkTCCAccessPreflightWithAuditToken(v4, &buf, 0);

  if (v11)
  {
    if (v11 == 1)
    {
      BOOL v7 = _LSDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v18 = [(_LSDClient *)self XPCConnection];
        unsigned int v19 = [v18 processIdentifier];
        buf.val[0] = 67109120;
        buf.val[1] = v19;
        _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because because user denided kTCCServiceUserTracking", (uint8_t *)&buf, 8u);
      }
    }
    else
    {
      if (v11 == 2)
      {
        v27[0] = 0;
        if (+[LSATTrackingEnforcementManager shouldEnforceTrackingWithReasonCode:v27])
        {
          v12 = _LSDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = [(_LSDClient *)self XPCConnection];
            unsigned int v14 = [v13 processIdentifier];
            buf.val[0] = 67109120;
            buf.val[1] = v14;
            _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because because app has not requested kTCCServiceUserTracking", (uint8_t *)&buf, 8u);
          }
        }
        else
        {
          v20 = _LSDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            buf.val[0] = 134217984;
            *(void *)&buf.val[1] = v27[0];
            _os_log_impl(&dword_182959000, v20, OS_LOG_TYPE_INFO, "Advertising identifier: AppTrackingTransparency enforcement is off (ATEnforcementServiceReasonCode %ld)", (uint8_t *)&buf, 0xCu);
          }

          if (!-[LSApplicationRestrictionsManager isLimitAdTrackingForced]((uint64_t)v3))
          {
            v12 = _LSDefaultLog();
            BOOL v9 = 1;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              v23 = [(_LSDClient *)self XPCConnection];
              unsigned int v24 = [v23 processIdentifier];
              buf.val[0] = 67109120;
              buf.val[1] = v24;
              _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access permitted because AppTrackingTransparency enforcement is off and LimitAdTracking is off", (uint8_t *)&buf, 8u);

              BOOL v9 = 1;
            }
            goto LABEL_30;
          }
          v12 = _LSDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v21 = [(_LSDClient *)self XPCConnection];
            unsigned int v22 = [v21 processIdentifier];
            buf.val[0] = 67109120;
            buf.val[1] = v22;
            _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access denied because LimitAdTracking is on", (uint8_t *)&buf, 8u);
          }
        }
        BOOL v9 = 0;
LABEL_30:

        goto LABEL_7;
      }
      BOOL v7 = _LSDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v25 = [(_LSDClient *)self XPCConnection];
        unsigned int v26 = [v25 processIdentifier];
        buf.val[0] = 67109376;
        buf.val[1] = v26;
        LOWORD(buf.val[2]) = 1024;
        *(unsigned int *)((char *)&buf.val[2] + 2) = v11;
        _os_log_error_impl(&dword_182959000, v7, OS_LOG_TYPE_ERROR, "Advertising identifier: PID %d access denied because because kTCCServiceUserTracking has invalid state %u", (uint8_t *)&buf, 0xEu);
      }
    }
    goto LABEL_6;
  }
  int v15 = _LSDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [(_LSDClient *)self XPCConnection];
    unsigned int v17 = [v16 processIdentifier];
    buf.val[0] = 67109120;
    buf.val[1] = v17;
    _os_log_impl(&dword_182959000, v15, OS_LOG_TYPE_INFO, "Advertising identifier: PID %d access permitted because user granted kTCCServiceUserTracking", (uint8_t *)&buf, 8u);
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (void)urlContainsDeviceIdentifierForAdvertising:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90___LSDDeviceIdentifierClient_urlContainsDeviceIdentifierForAdvertising_completionHandler___block_invoke;
  v10[3] = &unk_1E522E7E0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(_LSDDeviceIdentifierClient *)self getIdentifierOfType:1 completionHandler:v10];
}

- (void)generateIdentifiersWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Generating identifiers for vendor %@", (uint8_t *)&v17, 0xCu);
    }

    id v9 = +[_LSDeviceIdentifierManager sharedInstance];
    int v10 = [(id)getUMUserManagerClass() sharedManager];
    id v11 = [v10 currentPersona];
    id v12 = [v9 cacheForPersona:v11];
    [v12 getIdentifierOfType:0 vendorName:v5 bundleIdentifier:v7 completionHandler:0];

    id v13 = +[_LSDeviceIdentifierManager sharedInstance];
    unsigned int v14 = [(id)getUMUserManagerClass() sharedManager];
    int v15 = [v14 currentPersona];
    uint64_t v16 = [v13 cacheForPersona:v15];
    [v16 getIdentifierOfType:1 vendorName:v5 bundleIdentifier:v7 completionHandler:0];
  }
}

- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if ([(_LSDDeviceIdentifierClient *)self hasUninstallEntitlement])
    {
      id v9 = _LSDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "Asking to clear identifiers for vendor %@/bundle %@", (uint8_t *)&v15, 0x16u);
      }

      int v10 = +[_LSDeviceIdentifierManager sharedInstance];
      id v11 = [(id)getUMUserManagerClass() sharedManager];
      id v12 = [v11 currentPersona];
      id v13 = [v10 cacheForPersona:v12];
      [v13 clearIdentifiersForUninstallationWithVendorName:v6 bundleIdentifier:v8];
    }
    else
    {
      int v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = [(_LSDClient *)self XPCConnection];
        int v15 = 138412802;
        id v16 = v14;
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, "Unentitled request from XPC connection %@ to clear identifiers for vendor %@/bundle %@", (uint8_t *)&v15, 0x20u);
      }
    }
  }
}

- (void)clearAllIdentifiersOfType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[_LSDDeviceIdentifierClient hasEntitlementToClearAllIdentifiersOfType:](self, "hasEntitlementToClearAllIdentifiersOfType:");
  id v6 = _LSDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v12 = 67109120;
      LODWORD(v13) = a3;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Asking to clear all identifiers of type %i", (uint8_t *)&v12, 8u);
    }

    id v6 = +[_LSDeviceIdentifierManager sharedInstance];
    id v8 = [(id)getUMUserManagerClass() sharedManager];
    id v9 = [v8 currentPersona];
    int v10 = [v6 cacheForPersona:v9];
    [v10 clearAllIdentifiersOfType:a3];
  }
  else if (v7)
  {
    id v11 = [(_LSDClient *)self XPCConnection];
    int v12 = 138412546;
    id v13 = v11;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Unentitled request from XPC connection %@ to clear all identifiers of type %i", (uint8_t *)&v12, 0x12u);
  }
}

@end