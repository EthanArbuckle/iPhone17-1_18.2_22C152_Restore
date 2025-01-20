@interface CertUIUtilities
+ (id)_certUIBundle;
+ (id)bundleIDFromAuditToken:(id *)a3;
+ (id)localizedAppTitleForBundleID:(id)a3;
@end

@implementation CertUIUtilities

+ (id)bundleIDFromAuditToken:(id *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  long long v12 = v3;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v4 = _CertUILogObjects;
    if (!os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_DEBUG))
    {
LABEL_5:
      v6 = (void *)cf;
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = 0;
    v5 = "Looked up bundle ID %@ from audit token using entitlement.";
LABEL_4:
    _os_log_impl(&dword_2152BF000, v4, OS_LOG_TYPE_DEBUG, v5, buf, 0xCu);
    goto LABEL_5;
  }
  CFTypeRef cf = (CFTypeRef)CPCopyBundleIdentifierFromAuditToken();
  if (cf)
  {
    v4 = _CertUILogObjects;
    if (!os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = cf;
    v5 = "Looked up bundle ID %@ from audit token using Info.plist.";
    goto LABEL_4;
  }
  v8 = _CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2152BF000, v8, OS_LOG_TYPE_ERROR, "Could not look up bundle identifier using audit token.", buf, 2u);
  }
  v6 = 0;
LABEL_11:

  return v6;
}

+ (id)localizedAppTitleForBundleID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isEqualToString:@"com.apple.SafariViewService"] & 1) != 0
    || [v4 hasPrefix:@"com.apple.webapp"])
  {
    v5 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.mobilesafari"];
    if (!v5)
    {
      v6 = _CertUILogObjects;
      if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138543362;
        id v19 = v4;
        _os_log_impl(&dword_2152BF000, v6, OS_LOG_TYPE_ERROR, "Could not retrieve localized app title for Safari for bundle ID: %{public}@", (uint8_t *)&v18, 0xCu);
      }
    }
    uint64_t v7 = [v5 localizedName];
    v8 = (__CFString *)v7;
    v9 = @"Safari";
    if (v7) {
      v9 = (__CFString *)v7;
    }
    v10 = v9;
LABEL_9:
    v11 = v10;

    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"com.apple.WebSheet"])
  {
    int v13 = MGGetBoolAnswer();
    v14 = @"WEBSHEET_LOCALIZED_NAME";
    if (v13) {
      v14 = @"WEBSHEET_LOCALIZED_NAME_CHINA";
    }
    v8 = v14;
    v5 = [a1 _certUIBundle];
    v10 = [v5 localizedStringForKey:v8 value:&stru_26C5E1660 table:0];
    goto LABEL_9;
  }
  v15 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
  v5 = v15;
  if (!v15
    || ([v15 localizedName], v16 = objc_claimAutoreleasedReturnValue(), v16, !v16))
  {
    v17 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543362;
      id v19 = v4;
      _os_log_impl(&dword_2152BF000, v17, OS_LOG_TYPE_ERROR, "Could not retrieve localized app title given bundle ID: %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }
  v11 = [v5 localizedName];
LABEL_10:

  return v11;
}

+ (id)_certUIBundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CertUIUtilities__certUIBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_certUIBundle_onceToken != -1) {
    dispatch_once(&_certUIBundle_onceToken, block);
  }
  v2 = (void *)_certUIBundle_certUIBundle;

  return v2;
}

uint64_t __32__CertUIUtilities__certUIBundle__block_invoke(uint64_t a1)
{
  _certUIBundle_certUIBundle = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

@end