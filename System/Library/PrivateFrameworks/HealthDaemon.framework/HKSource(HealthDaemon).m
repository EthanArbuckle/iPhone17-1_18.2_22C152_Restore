@interface HKSource(HealthDaemon)
+ (id)hd_currentDeviceSourceName;
+ (id)hd_getNameForSource:()HealthDaemon;
+ (id)hd_sourceForClient:()HealthDaemon;
+ (uint64_t)hd_isSpartanDeviceBundleIdentifier:()HealthDaemon;
@end

@implementation HKSource(HealthDaemon)

+ (id)hd_sourceForClient:()HealthDaemon
{
  id v4 = a3;
  v5 = [v4 sourceBundleIdentifier];
  v6 = [v4 defaultSourceBundleIdentifier];
  v7 = [v4 entitlements];
  v8 = [v4 process];

  v9 = [v8 name];
  v10 = [a1 _sourceWithBundleIdentifier:v5 defaultBundleIdentifier:v6 appEntitlements:v7 name:v9];

  v11 = objc_msgSend((id)objc_opt_class(), "hd_getNameForSource:", v10);
  if (v11) {
    [v10 _setName:v11];
  }

  return v10;
}

+ (id)hd_getNameForSource:()HealthDaemon
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 _isLocalDevice])
  {
    uint64_t v5 = objc_msgSend(a1, "hd_currentDeviceSourceName");
LABEL_5:
    v8 = (void *)v5;
    goto LABEL_34;
  }
  v6 = [v4 bundleIdentifier];
  int v7 = objc_msgSend(a1, "hd_isSpartanDeviceBundleIdentifier:", v6);

  if (v7)
  {
    uint64_t v5 = HKConnectedGymSourceName();
    goto LABEL_5;
  }
  if ([v4 _isResearchStudy])
  {
    id v9 = v4;
    self;
    id v26 = 0;
    v10 = [v9 _fetchBundleWithError:&v26];
    id v11 = v26;
    if (!v10)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch research study bundle for source %@: %@", buf, 0x16u);
      }
    }
    v13 = objc_msgSend(v10, "hk_displayName");
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      objc_msgSend(v10, "hk_name");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v15;
  }
  else
  {
    id v9 = [v4 bundleIdentifier];
    self;
    v16 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v9];
    v17 = v16;
    if (v16)
    {
      v18 = [v16 appState];
      if ([v18 isValid])
      {
        v8 = [v17 localizedName];
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v9;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't find application proxy for bundle identifier %@", buf, 0xCu);
      }
      v8 = 0;
    }

    if (!v8)
    {
      id v20 = v9;
      self;
      v21 = [MEMORY[0x1E4F223B8] applicationProxyForCompanionIdentifier:v20];
      v22 = v21;
      if (v21)
      {
        v23 = [v21 appState];
        if ([v23 isValid])
        {
          v8 = [v22 localizedName];
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        v24 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v20;
          _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "Couldn't find application proxy for companion bundle identifier %@", buf, 0xCu);
        }
        v8 = 0;
      }

      if (!v8)
      {
        v8 = [MEMORY[0x1E4F2B568] aliasNameForSource:v4];
      }
    }
  }

LABEL_34:

  return v8;
}

+ (id)hd_currentDeviceSourceName
{
  v0 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v1 = [v0 currentDeviceDisplayName];

  return v1;
}

+ (uint64_t)hd_isSpartanDeviceBundleIdentifier:()HealthDaemon
{
  return [a3 isEqualToString:*MEMORY[0x1E4F2BD18]];
}

@end