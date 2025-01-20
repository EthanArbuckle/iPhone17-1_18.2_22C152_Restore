@interface ACAccount(AppleMediaServicesProject)
- (id)ams_accountFlagOverrideValueForAccountFlag:()AppleMediaServicesProject;
- (id)ams_allStorefronts;
- (id)ams_dataMigrationStoragePath;
- (uint64_t)ams_biometricsState;
- (uint64_t)ams_copyStorefrontFromAccount:()AppleMediaServicesProject;
- (uint64_t)ams_isBundleOwner;
- (uint64_t)ams_isDemoAccount;
- (uint64_t)ams_isRegulatoryAccount;
- (uint64_t)ams_lastAuthenticationCredentialSource;
- (uint64_t)ams_lastRestrictedRegionSyncTimestamp;
- (uint64_t)ams_migrateCookiePropertiesWithError:()AppleMediaServicesProject;
- (uint64_t)ams_setAccountFlagOverrideValue:()AppleMediaServicesProject forAccountFlag:;
- (void)ams_setBiometricsState:()AppleMediaServicesProject;
- (void)ams_setDemoAccount:()AppleMediaServicesProject;
- (void)ams_setIsBundleOwner:()AppleMediaServicesProject;
- (void)ams_setLastAuthenticationCredentialSource:()AppleMediaServicesProject;
- (void)ams_setLastRestrictedRegionSyncTimestamp:()AppleMediaServicesProject;
- (void)ams_setRegulatoryAccount:()AppleMediaServicesProject;
@end

@implementation ACAccount(AppleMediaServicesProject)

- (id)ams_allStorefronts
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = objc_msgSend(a1, "ams_storefront");
  objc_msgSend(v2, "ams_setNullableObject:forKey:", v3, AMSAccountMediaTypeProduction);

  return v2;
}

- (uint64_t)ams_copyStorefrontFromAccount:()AppleMediaServicesProject
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(a3, "ams_allStorefronts");
  if (![v4 count])
  {
    v5 = +[AMSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v20;
      __int16 v35 = 2114;
      v36 = v21;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] We can't update this account's storefront because the source account has no storefront.", buf, 0x16u);
    }
    goto LABEL_21;
  }
  v5 = objc_msgSend(a1, "ams_allStorefronts");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v6 = [v4 allKeys];
  uint64_t v28 = [v6 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (!v28)
  {
LABEL_21:
    char v8 = 0;
    goto LABEL_22;
  }
  char v8 = 0;
  uint64_t v27 = *(void *)v30;
  *(void *)&long long v7 = 138544130;
  long long v23 = v7;
  v25 = v4;
  v26 = v5;
  v24 = a1;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v30 != v27) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v10, v23);
      v12 = [v5 objectForKeyedSubscript:v10];
      if (!v12 || ([v11 isEqualToString:v12] & 1) == 0)
      {
        objc_msgSend(a1, "ams_setStorefront:forMediaType:", v11, v10);
        v13 = +[AMSLogConfig sharedAccountsConfig];
        if (!v13)
        {
          v13 = +[AMSLogConfig sharedConfig];
        }
        v14 = [v13 OSLogObject];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = v6;
          uint64_t v16 = objc_opt_class();
          v17 = AMSLogKey();
          v18 = AMSHashIfNeeded(v12);
          v19 = AMSHashIfNeeded(v11);
          *(_DWORD *)buf = v23;
          uint64_t v34 = v16;
          v6 = v15;
          a1 = v24;
          __int16 v35 = 2114;
          v36 = v17;
          __int16 v37 = 2114;
          v38 = v18;
          __int16 v39 = 2114;
          v40 = v19;
          _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Account storefront changed. old = %{public}@ | new = %{public}@", buf, 0x2Au);

          v4 = v25;
          v5 = v26;
        }

        char v8 = 1;
      }
    }
    uint64_t v28 = [v6 countByEnumeratingWithState:&v29 objects:v41 count:16];
  }
  while (v28);
LABEL_22:

  return v8 & 1;
}

- (id)ams_accountFlagOverrideValueForAccountFlag:()AppleMediaServicesProject
{
  id v4 = a3;
  v5 = +[AMSDefaults accountFlagOverrides];
  v6 = v5;
  if (!v5 || ![v5 count])
  {
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  long long v7 = [a1 identifier];
  if (!v7)
  {
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  char v8 = [v6 objectForKeyedSubscript:v7];
  v9 = v8;
  if (!v8 || ![v8 count]) {
    goto LABEL_8;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:v4];
  if (([MEMORY[0x1E4F179B0] _isAccountFlagValue:v10 validForAccountFlag:v4] & 1) == 0)
  {

LABEL_8:
    uint64_t v10 = 0;
  }

LABEL_12:
LABEL_13:

  return v10;
}

- (uint64_t)ams_biometricsState
{
  v1 = [a1 _accountPropertyForKey:@"biometricsState" expectedClass:objc_opt_class()];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (id)ams_dataMigrationStoragePath
{
  uint64_t v2 = objc_msgSend(a1, "ams_DSID");
  uint64_t v3 = [v2 stringValue];
  if (v3)
  {
    id v4 = (void *)v3;

LABEL_4:
    v5 = [@"/var/mobile/Library/com.apple.AppleMediaServices.notbackedup" stringByAppendingPathComponent:v4];

    goto LABEL_5;
  }
  id v4 = objc_msgSend(a1, "ams_altDSID");

  if (v4) {
    goto LABEL_4;
  }
  v5 = 0;
LABEL_5:
  return v5;
}

- (uint64_t)ams_isBundleOwner
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"isBundleOwner" expectedClass:v2];
}

- (uint64_t)ams_isDemoAccount
{
  uint64_t result = objc_msgSend(a1, "ams_isiTunesAccount");
  if (result)
  {
    uint64_t v3 = [a1 _accountPropertyForKey:@"isDemoAccount" expectedClass:objc_opt_class()];
    uint64_t v4 = [v3 BOOLValue];

    return v4;
  }
  return result;
}

- (uint64_t)ams_isRegulatoryAccount
{
  v1 = [a1 _accountPropertyForKey:@"isRegulatoryAccount" expectedClass:objc_opt_class()];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)ams_lastAuthenticationCredentialSource
{
  v1 = [a1 _accountPropertyForKey:@"lastAuthenticateCredentialSource" expectedClass:objc_opt_class()];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)ams_setLastAuthenticationCredentialSource:()AppleMediaServicesProject
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"lastAuthenticateCredentialSource" expectedClass:objc_opt_class()];
}

- (uint64_t)ams_lastRestrictedRegionSyncTimestamp
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"lastRestrictedRegionSyncTimestamp" expectedClass:v2];
}

- (void)ams_setBiometricsState:()AppleMediaServicesProject
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"biometricsState" expectedClass:objc_opt_class()];
}

- (void)ams_setDemoAccount:()AppleMediaServicesProject
{
  if (objc_msgSend(a1, "ams_isiTunesAccount"))
  {
    id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
    [a1 _setAccountProperty:v5 forKey:@"isDemoAccount" expectedClass:objc_opt_class()];
  }
}

- (void)ams_setIsBundleOwner:()AppleMediaServicesProject
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"isBundleOwner" expectedClass:objc_opt_class()];
}

- (void)ams_setLastRestrictedRegionSyncTimestamp:()AppleMediaServicesProject
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"lastRestrictedRegionSyncTimestamp" expectedClass:objc_opt_class()];
}

- (void)ams_setRegulatoryAccount:()AppleMediaServicesProject
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"isRegulatoryAccount" expectedClass:objc_opt_class()];
}

- (uint64_t)ams_migrateCookiePropertiesWithError:()AppleMediaServicesProject
{
  id v5 = objc_msgSend(a1, "_ams_cookieProperties");
  v6 = v5;
  if (v5)
  {
    if ([v5 count])
    {
      id v15 = 0;
      long long v7 = +[AMSCookieStorage cookiesForAccount:a1 cookieDatabaseOnly:1 error:&v15];
      id v8 = v15;
      id v9 = v8;
      if (v7)
      {
        id v14 = v8;
        char v10 = objc_msgSend(a1, "_ams_migrateCookieProperties:intoCookies:error:", v6, v7, &v14);
        id v11 = v14;

        if (v10)
        {
          uint64_t v12 = 1;
LABEL_16:
          id v9 = v11;
          goto LABEL_17;
        }
        if (!a3)
        {
          uint64_t v12 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        if (!a3)
        {
          uint64_t v12 = 0;
          goto LABEL_17;
        }
        id v11 = v8;
      }
      id v9 = v11;
      uint64_t v12 = 0;
      *a3 = v9;
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v12 = 1;
  }
  else if (a3)
  {
    AMSError(7, @"Cannot Migrate Cookie Properties", @"There are no cookie properties to migrate.", 0);
    uint64_t v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_18:

  return v12;
}

- (uint64_t)ams_setAccountFlagOverrideValue:()AppleMediaServicesProject forAccountFlag:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 identifier];
  if (v8 && [MEMORY[0x1E4F179B0] _isAccountFlagValue:v6 validForAccountFlag:v7])
  {
    id v9 = +[AMSDefaults accountFlagOverrides];
    char v10 = (void *)[v9 mutableCopy];
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v14 = v12;

    id v15 = [v14 objectForKeyedSubscript:v8];
    uint64_t v16 = (void *)[v15 mutableCopy];
    v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v19 = v18;

    [v19 setObject:v6 forKeyedSubscript:v7];
    if (([v19 isEqualToDictionary:v15] & 1) == 0)
    {
      [v14 setObject:v19 forKeyedSubscript:v8];
      +[AMSDefaults setAccountFlagOverrides:v14];
    }

    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

@end