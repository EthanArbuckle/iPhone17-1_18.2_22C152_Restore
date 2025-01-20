@interface ACAccount(AppleMediaServices)
+ (AMSStorageDatabase)_ams_storage;
+ (id)_defaultValueForAccountFlag:()AppleMediaServices;
+ (id)_getSetCookiesForResponse:()AppleMediaServices;
+ (id)_getSetGlobalCookiesForResponse:()AppleMediaServices;
+ (id)_globalCookieAllowlistWithBag:()AppleMediaServices forURL:;
+ (id)ams_createEphemeralAccount;
+ (id)ams_globalEphemeralAccountProperties;
+ (id)ams_globalEphemeralAccountPropertiesForAccount:()AppleMediaServices;
+ (uint64_t)_isAccountFlagValue:()AppleMediaServices validForAccountFlag:;
+ (uint64_t)_isAccountFlagWritable:()AppleMediaServices;
- (AMSAccountIdentity)ams_accountID;
- (BOOL)_ams_migrateCookieProperties:()AppleMediaServices intoCookies:error:;
- (BOOL)ams_didAgreeToTerms;
- (BOOL)ams_isHSA2;
- (BOOL)ams_isInGoodStanding;
- (BOOL)ams_isiCloudFamily;
- (BOOL)ams_requiresAuthKitUpdate;
- (id)_accountPropertyForKey:()AppleMediaServices dataProtectionClass:expectedClasses:error:;
- (id)_accountPropertyForKey:()AppleMediaServices expectedClass:;
- (id)_accountPropertyForKey:()AppleMediaServices expectedClassContainedInArray:;
- (id)_ams_getAccountFlagsShimmedWithError:()AppleMediaServices;
- (id)_cookiesMatchingProperties:()AppleMediaServices;
- (id)_ephemeralAccountPropertyForKey:()AppleMediaServices dataProtectionClass:expectedClasses:error:;
- (id)_hashedActiveState;
- (id)_hashedIdentifiers;
- (id)_hashedStorefront;
- (id)_updateCookiesWithCookiesToAdd:()AppleMediaServices cookiesToRemove:;
- (id)ams_DSID;
- (id)ams_accountFlagValueForAccountFlag:()AppleMediaServices;
- (id)ams_altDSID;
- (id)ams_asynchronouslyAddCookiesForResponse:()AppleMediaServices;
- (id)ams_asynchronouslyAddGlobalCookiesForResponse:()AppleMediaServices;
- (id)ams_cookies;
- (id)ams_cookiesForURL:()AppleMediaServices;
- (id)ams_cookiesForURL:()AppleMediaServices bag:cleanupGlobalCookies:;
- (id)ams_delta:()AppleMediaServices;
- (id)ams_fullName;
- (id)ams_homeID;
- (id)ams_homeIdentifier;
- (id)ams_homeUserID;
- (id)ams_iCloudPartition;
- (id)ams_isInRestrictedRegionWithBag:()AppleMediaServices waitForSync:;
- (id)ams_lastAuthenticationServerResponse;
- (id)ams_password;
- (id)ams_rawPassword;
- (id)ams_secureToken;
- (id)ams_storefrontForMediaType:()AppleMediaServices;
- (id)hashedDescription;
- (uint64_t)_accountPropertyBooleanForKey:()AppleMediaServices;
- (uint64_t)_ams_cookieProperties;
- (uint64_t)_ams_setCookieProperties:()AppleMediaServices;
- (uint64_t)_hashedMultiUserIdentifiers;
- (uint64_t)_hashedMultiUserIdentifiers:()AppleMediaServices;
- (uint64_t)_setAccountProperty:()AppleMediaServices forKey:expectedClass:;
- (uint64_t)_updateCookiesWithCookiesToAdd:()AppleMediaServices cookiesToRemove:error:;
- (uint64_t)ams_accountFlags;
- (uint64_t)ams_addCookies:()AppleMediaServices;
- (uint64_t)ams_addCookies:()AppleMediaServices error:;
- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices;
- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices error:;
- (uint64_t)ams_addCookiesForResult:()AppleMediaServices;
- (uint64_t)ams_addGlobalCookiesForResponse:()AppleMediaServices;
- (uint64_t)ams_addGlobalCookiesForResult:()AppleMediaServices;
- (uint64_t)ams_asynchronouslyAddCookies:()AppleMediaServices;
- (uint64_t)ams_automaticDownloadKinds;
- (uint64_t)ams_bundleOwner;
- (uint64_t)ams_cookiesForURL:()AppleMediaServices bag:;
- (uint64_t)ams_creditsString;
- (uint64_t)ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice;
- (uint64_t)ams_disableAccountFlagsSync;
- (uint64_t)ams_disablePrivacyAcknowledgementSync;
- (uint64_t)ams_encryptAccountFlags;
- (uint64_t)ams_firstName;
- (uint64_t)ams_freePasswordPromptSetting;
- (uint64_t)ams_homeUserIdentifiers;
- (uint64_t)ams_isActiveForMediaType:()AppleMediaServices;
- (uint64_t)ams_isDuplicate:()AppleMediaServices;
- (uint64_t)ams_isEphemeralAccount;
- (uint64_t)ams_isIDMSAccount;
- (uint64_t)ams_isInRestrictedRegionWithBag:()AppleMediaServices shouldWaitForSync:;
- (uint64_t)ams_isLocalAccount;
- (uint64_t)ams_isLocalOrSandboxAccount;
- (uint64_t)ams_isManagedAppleID;
- (uint64_t)ams_isPrivateListeningEnabled;
- (uint64_t)ams_isPrivateListeningEnabledForHomeUserIdentifier:()AppleMediaServices;
- (uint64_t)ams_isSandboxAccount;
- (uint64_t)ams_isSubjectToPerDeviceBundleHolderAcknowledgement;
- (uint64_t)ams_isValidPayment;
- (uint64_t)ams_isiCloudAccount;
- (uint64_t)ams_isiTunesAccount;
- (uint64_t)ams_lastName;
- (uint64_t)ams_mergePrivacyAcknowledgement:()AppleMediaServices;
- (uint64_t)ams_mergedPrivacyAcknowledgement;
- (uint64_t)ams_paidPasswordPromptSetting;
- (uint64_t)ams_postAccountFlagsWithBagContract:()AppleMediaServices;
- (uint64_t)ams_privacyAcknowledgement;
- (uint64_t)ams_pushRegistrationThrottleMap;
- (uint64_t)ams_registerSuccessCriteria;
- (uint64_t)ams_removeAllCookies;
- (uint64_t)ams_removeAllCookiesWithError:()AppleMediaServices;
- (uint64_t)ams_removeCookies:()AppleMediaServices;
- (uint64_t)ams_removeCookies:()AppleMediaServices error:;
- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices;
- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices error:;
- (uint64_t)ams_securityLevel;
- (uint64_t)ams_setDisableAccountFlagsSync:()AppleMediaServices;
- (uint64_t)ams_setDisablePrivacyAcknowledgementSync:()AppleMediaServices;
- (uint64_t)ams_setHomeUserID:()AppleMediaServices;
- (uint64_t)ams_setStorefront:()AppleMediaServices;
- (uint64_t)ams_storefront;
- (uint64_t)ams_valueForAccountFlag:()AppleMediaServices;
- (void)_ams_setAccountFlagsShimmed:()AppleMediaServices;
- (void)_setAccountProperty:()AppleMediaServices forKey:dataProtectionClass:expectedClass:;
- (void)_setEphemeralAccountProperty:()AppleMediaServices forKey:dataProtectionClass:expectedClass:;
- (void)ams_setAccountFlagValue:()AppleMediaServices forAccountFlag:;
- (void)ams_setActive:()AppleMediaServices forMediaType:;
- (void)ams_setAgreedToTerms:()AppleMediaServices;
- (void)ams_setAltDSID:()AppleMediaServices;
- (void)ams_setCreditsString:()AppleMediaServices;
- (void)ams_setDSID:()AppleMediaServices;
- (void)ams_setDidAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice:()AppleMediaServices;
- (void)ams_setFirstName:()AppleMediaServices;
- (void)ams_setFreePasswordPromptSetting:()AppleMediaServices;
- (void)ams_setHomeID:()AppleMediaServices;
- (void)ams_setHomeIdentifier:()AppleMediaServices;
- (void)ams_setInGoodStanding:()AppleMediaServices;
- (void)ams_setInUse:()AppleMediaServices;
- (void)ams_setLastName:()AppleMediaServices;
- (void)ams_setManagedAppleID:()AppleMediaServices;
- (void)ams_setMergedPrivacyAcknowledgement:()AppleMediaServices;
- (void)ams_setPaidPasswordPromptSetting:()AppleMediaServices;
- (void)ams_setPassword:()AppleMediaServices;
- (void)ams_setPushRegistrationThrottleMap:()AppleMediaServices;
- (void)ams_setRawPassword:()AppleMediaServices;
- (void)ams_setRegisterSuccessCriteria:()AppleMediaServices;
- (void)ams_setServerResponse:()AppleMediaServices;
- (void)ams_setStorefront:()AppleMediaServices forMediaType:;
- (void)ams_setValidPayment:()AppleMediaServices;
- (void)ams_setValue:()AppleMediaServices forAccountFlag:;
- (void)ams_setiCloudFamily:()AppleMediaServices;
@end

@implementation ACAccount(AppleMediaServices)

- (id)ams_cookiesForURL:()AppleMediaServices bag:cleanupGlobalCookies:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_msgSend(a1, "ams_cookies");
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    v13 = (void *)v11;
  }
  id v14 = v13;

  v15 = +[AMSLogConfig sharedConfig];
  if (!v15)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    char v39 = a5;
    v17 = AMSLogKey();
    v18 = NSString;
    uint64_t v19 = objc_opt_class();
    v40 = a2;
    if (v17)
    {
      AMSLogKey();
      v36 = v18;
      v20 = a1;
      v21 = v17;
      id v22 = v14;
      id v23 = v10;
      v25 = id v24 = v9;
      uint64_t v37 = NSStringFromSelector(a2);
      v38 = (void *)v25;
      uint64_t v35 = v25;
      id v9 = v24;
      id v10 = v23;
      id v14 = v22;
      v17 = v21;
      a1 = v20;
      [v36 stringWithFormat:@"%@: [%@] %@ ", v19, v35, v37];
    }
    else
    {
      v38 = NSStringFromSelector(a2);
      [v18 stringWithFormat:@"%@: %@ ", v19, v38];
    v26 = };
    uint64_t v27 = [v14 count];
    v28 = AMSHashIfNeeded(a1);
    *(_DWORD *)buf = 138543874;
    v48 = v26;
    __int16 v49 = 2048;
    uint64_t v50 = v27;
    __int16 v51 = 2114;
    v52 = v28;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched %lu cookies for account: %{public}@", buf, 0x20u);
    if (v17)
    {

      v26 = (void *)v37;
    }

    a2 = v40;
    a5 = v39;
  }

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke;
  v41[3] = &unk_1E559E388;
  char v46 = a5;
  id v42 = v9;
  v43 = a1;
  id v44 = v10;
  v45 = a2;
  id v29 = v10;
  id v30 = v9;
  v31 = objc_msgSend(v14, "ams_mapWithTransform:", v41);
  v32 = +[AMSPromise promiseWithSome:v31];
  v33 = +[AMSPromise unwrappedPromiseWithPromise:v32];

  return v33;
}

- (id)_updateCookiesWithCookiesToAdd:()AppleMediaServices cookiesToRemove:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    uint64_t v8 = +[AMSCookieStorage updateCookiesWithCookiesToAdd:v6 cookiesToRemove:v7 forAccount:a1];
  }
  else
  {
    uint64_t v8 = +[AMSBinaryPromise promiseWithSuccess];
  }
  id v9 = (void *)v8;

  return v9;
}

- (BOOL)ams_isHSA2
{
  return objc_msgSend(a1, "ams_securityLevel") == 4;
}

- (uint64_t)ams_securityLevel
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v3 = objc_msgSend(v2, "ams_IDMSAccountForAccount:", a1);

  if (v3)
  {
    v4 = [MEMORY[0x1E4F4EF40] sharedInstance];
    uint64_t v5 = [v4 securityLevelForAccount:v3];
  }
  else
  {
    id v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Security level check failed to find IDMS account", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)hashedDescription
{
  v2 = [a1 accountType];
  v3 = [v2 identifier];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"com.apple.account." withString:&stru_1EDCA7308];

  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  id v6 = [a1 identifier];
  id v7 = [v5 stringWithFormat:@"<ACAccount: %p type = %@ | backingID = %@", a1, v4, v6];

  uint64_t v8 = [a1 _hashedIdentifiers];
  objc_msgSend(v7, "ams_appendNullableString:", v8);

  int v9 = [a1 _hashedMultiUserIdentifiers];
  objc_msgSend(v7, "ams_appendNullableString:", v9);

  uint64_t v10 = [a1 _hashedActiveState];
  objc_msgSend(v7, "ams_appendNullableString:", v10);

  uint64_t v11 = [a1 _hashedStorefront];
  objc_msgSend(v7, "ams_appendNullableString:", v11);

  [v7 appendString:@">"];
  return v7;
}

- (uint64_t)_hashedMultiUserIdentifiers
{
  return 0;
}

- (id)_hashedIdentifiers
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" | username = "];
  int v3 = objc_msgSend(a1, "ams_isLocalAccount");
  v4 = [a1 username];
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = @"(null)";
    }
    [v2 appendString:v6];
  }
  else
  {
    id v7 = AMSHashIfNeededNonnull(v4);
    [v2 appendString:v7];

    uint64_t v8 = objc_msgSend(a1, "ams_altDSID");
    int v9 = AMSHashIfNeededNonnull(v8);
    [v2 appendFormat:@" | altDSID = %@", v9];

    uint64_t v5 = objc_msgSend(a1, "ams_DSID");
    uint64_t v10 = AMSHashIfNeededNonnull(v5);
    [v2 appendFormat:@" | DSID = %@", v10];
  }
  uint64_t v11 = (void *)[v2 copy];

  return v11;
}

- (id)_hashedStorefront
{
  if (objc_msgSend(a1, "ams_isiTunesAccount"))
  {
    v2 = NSString;
    int v3 = objc_msgSend(a1, "ams_storefront");
    v4 = AMSHashIfNeeded(v3);
    uint64_t v5 = [v2 stringWithFormat:@" | storefront = %@", v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)ams_storefrontForMediaType:()AppleMediaServices
{
  v4 = a3;
  uint64_t v5 = AMSAccountMediaTypeAppStoreSandbox;
  id v6 = AMSAccountMediaTypeAppStoreBeta;
  char v7 = objc_msgSend(a1, "ams_isSandboxAccount");
  if (v5 != v4 && v6 != v4)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    int v9 = 0;
    goto LABEL_10;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_9:
  int v9 = [a1 _accountPropertyForKey:@"storefrontID" expectedClass:objc_opt_class()];
LABEL_10:

  return v9;
}

- (uint64_t)ams_storefront
{
  return objc_msgSend(a1, "ams_storefrontForMediaType:", 0);
}

- (uint64_t)ams_isActiveForMediaType:()AppleMediaServices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 isEqualToString:AMSAccountMediaTypeAppStoreBeta])
  {
    int v12 = [v5 isEqualToString:AMSAccountMediaTypeAppStoreSandbox];
    int v13 = objc_msgSend(a1, "ams_isSandboxAccount");
    if (v12)
    {
      if (!v13)
      {
        id v6 = +[AMSLogConfig sharedAccountsConfig];
        if (!v6)
        {
          id v6 = +[AMSLogConfig sharedConfig];
        }
        char v7 = [v6 OSLogObject];
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        uint64_t v14 = objc_opt_class();
        int v9 = AMSLogKey();
        uint64_t v10 = NSStringFromSelector(a2);
        int v17 = 138543874;
        uint64_t v18 = v14;
        __int16 v19 = 2114;
        v20 = v9;
        __int16 v21 = 2114;
        id v22 = v10;
        uint64_t v11 = "%{public}@: [%{public}@] %{public}@ does not support AMSAccountMediaTypeAppStoreSandbox for non-sandbox accounts.";
        goto LABEL_12;
      }
    }
    else if (v13)
    {
      goto LABEL_14;
    }
    uint64_t v15 = [a1 isActive];
    goto LABEL_17;
  }
  id v6 = +[AMSLogConfig sharedAccountsConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  char v7 = [v6 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    goto LABEL_13;
  }
  uint64_t v8 = objc_opt_class();
  int v9 = AMSLogKey();
  uint64_t v10 = NSStringFromSelector(a2);
  int v17 = 138543874;
  uint64_t v18 = v8;
  __int16 v19 = 2114;
  v20 = v9;
  __int16 v21 = 2114;
  id v22 = v10;
  uint64_t v11 = "%{public}@: [%{public}@] %{public}@ does not support AMSAccountMediaTypeAppStoreBeta.";
LABEL_12:
  _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v17, 0x20u);

LABEL_13:
LABEL_14:
  uint64_t v15 = 0;
LABEL_17:

  return v15;
}

- (id)ams_fullName
{
  v2 = objc_msgSend(a1, "ams_firstName");
  if (v2)
  {

LABEL_4:
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    id v5 = objc_msgSend(a1, "ams_lastName");
    [v4 setFamilyName:v5];

    id v6 = objc_msgSend(a1, "ams_firstName");
    [v4 setGivenName:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    uint64_t v8 = [v7 stringFromPersonNameComponents:v4];

    goto LABEL_5;
  }
  int v3 = objc_msgSend(a1, "ams_lastName");

  if (v3) {
    goto LABEL_4;
  }
  uint64_t v8 = 0;
LABEL_5:
  return v8;
}

- (uint64_t)ams_firstName
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"firstName" expectedClass:v2];
}

- (uint64_t)ams_lastName
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"lastName" expectedClass:v2];
}

- (id)ams_altDSID
{
  if (objc_msgSend(a1, "ams_isIDMSAccount"))
  {
    uint64_t v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
    int v3 = [v2 altDSIDForAccount:a1];
  }
  else
  {
    int v3 = [a1 _accountPropertyForKey:@"altDSID" expectedClass:objc_opt_class()];
  }
  return v3;
}

- (id)ams_DSID
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "ams_isiCloudAccount"))
  {
    int v3 = [a1 objectForKeyedSubscript:@"personID"];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v5 = 0;
      goto LABEL_13;
    }
    id v4 = [a1 objectForKeyedSubscript:@"personID"];
    uint64_t v5 = [v4 longLongValue];
  }
  else
  {
    if (!objc_msgSend(a1, "ams_isIDMSAccount"))
    {
      if (objc_msgSend(a1, "ams_isiTunesAccount"))
      {
        uint64_t v8 = [a1 _accountPropertyForKey:@"dsid" expectedClass:objc_opt_class()];
        if (v8)
        {
          int v9 = v8;
          uint64_t v5 = [v8 longLongValue];
        }
        else
        {
          uint64_t v18 = [a1 _accountPropertyForKey:@"dsid" expectedClass:objc_opt_class()];
          if (v18)
          {
            __int16 v19 = off_1E559C000;
            v20 = +[AMSLogConfig sharedAccountsConfig];
            if (!v20)
            {
              v20 = +[AMSLogConfig sharedConfig];
            }
            __int16 v21 = [v20 OSLogObject];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = AMSLogKey();
              uint64_t v23 = NSString;
              uint64_t v24 = objc_opt_class();
              uint64_t v25 = v24;
              if (v22)
              {
                AMSLogKey();
                __int16 v19 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
                [v23 stringWithFormat:@"%@: [%@] ", v25, v19];
              }
              else
              {
                [v23 stringWithFormat:@"%@: ", v24];
              v26 = };
              id v30 = AMSHashIfNeeded(v18);
              *(_DWORD *)buf = 138543618;
              id v42 = v26;
              __int16 v43 = 2114;
              id v44 = v30;
              _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Found a DSID stored as a string. Fixing. dsid = %{public}@", buf, 0x16u);
              if (v22)
              {

                v26 = v19;
              }
            }
            id v31 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
            [v31 setAllowsFloats:0];
            [v31 setNumberStyle:1];
            [v31 setMaximumFractionDigits:0];
            int v9 = [v31 numberFromString:v18];
            if (v9)
            {
              [a1 _setAccountProperty:v9 forKey:@"dsid" expectedClass:objc_opt_class()];
              uint64_t v5 = [v9 longLongValue];
            }
            else
            {
              v32 = +[AMSLogConfig sharedAccountsConfig];
              if (!v32)
              {
                v32 = +[AMSLogConfig sharedConfig];
              }
              v33 = [v32 OSLogObject];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v34 = AMSLogKey();
                uint64_t v35 = NSString;
                uint64_t v36 = objc_opt_class();
                uint64_t v37 = v36;
                if (v34)
                {
                  uint64_t v40 = AMSLogKey();
                  [v35 stringWithFormat:@"%@: [%@] ", v37, v40];
                }
                else
                {
                  [v35 stringWithFormat:@"%@: ", v36];
                v38 = };
                *(_DWORD *)buf = 138543362;
                id v42 = v38;
                _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, "%{public}@Found DSID could not be converted into expected format.", buf, 0xCu);
                if (v34)
                {

                  v38 = (void *)v40;
                }
              }
              [a1 _setAccountProperty:0 forKey:@"dsid" expectedClass:objc_opt_class()];
              uint64_t v5 = 0;
            }
          }
          else
          {
            int v9 = 0;
            uint64_t v5 = 0;
          }
        }
        if (v5) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v11 = +[AMSLogConfig sharedAccountsConfig];
        if (!v11)
        {
          uint64_t v11 = +[AMSLogConfig sharedConfig];
        }
        int v12 = [v11 OSLogObject];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = AMSLogKey();
          uint64_t v14 = NSString;
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = v15;
          if (v13)
          {
            uint64_t v1 = AMSLogKey();
            [v14 stringWithFormat:@"%@: [%@] ", v16, v1];
          }
          else
          {
            [v14 stringWithFormat:@"%@: ", v15];
          int v17 = };
          uint64_t v27 = [a1 accountType];
          v28 = [v27 identifier];
          id v29 = AMSHashIfNeeded(v28);
          *(_DWORD *)buf = 138543618;
          id v42 = v17;
          __int16 v43 = 2114;
          id v44 = v29;
          _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected account type, cannot determine DSID. accountType = %{public}@", buf, 0x16u);

          if (v13)
          {

            int v17 = (void *)v1;
          }
        }
      }
      goto LABEL_51;
    }
    int v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
    id v4 = [v3 DSIDForAccount:a1];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [MEMORY[0x1E4F4EF40] sharedInstance];
      id v7 = [v6 DSIDForAccount:a1];
      uint64_t v5 = [v7 longLongValue];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

LABEL_13:
  if (v5)
  {
LABEL_14:
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v5];
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v10 = 0;
LABEL_52:
  return v10;
}

- (uint64_t)ams_isiCloudAccount
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17750]];

  return v3;
}

- (id)_hashedActiveState
{
  if (objc_msgSend(a1, "ams_isiTunesAccount") && (objc_msgSend(a1, "ams_isLocalAccount") & 1) == 0)
  {
    uint64_t v3 = NSString;
    int v4 = [a1 isActive];
    uint64_t v5 = @"false";
    if (v4) {
      uint64_t v5 = @"true";
    }
    uint64_t v2 = [v3 stringWithFormat:@" | active = %@", v5];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (uint64_t)ams_isLocalAccount
{
  uint64_t result = objc_msgSend(a1, "ams_isiTunesAccount");
  if (result)
  {
    if ([a1 _accountPropertyBooleanForKey:0x1EDCA8708])
    {
      return 1;
    }
    else
    {
      uint64_t v3 = [a1 identifier];
      uint64_t v4 = [v3 isEqualToString:@"iTunesLocal-421A04EA-479A-4E46-B49D-556F7144518D"];

      return v4;
    }
  }
  return result;
}

- (uint64_t)ams_isIDMSAccount
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F177E0]];

  return v3;
}

- (uint64_t)_accountPropertyBooleanForKey:()AppleMediaServices
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [a1 _accountPropertyForKey:v5 dataProtectionClass:0 expectedClasses:v7 error:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v8 lowercaseString];
      if ([v10 isEqualToString:@"true"])
      {

LABEL_7:
        uint64_t v9 = 1;
        goto LABEL_12;
      }
      char v11 = [v8 isEqualToString:@"1"];

      if (v11) {
        goto LABEL_7;
      }
      int v12 = [v8 lowercaseString];
      if (([v12 isEqualToString:@"false"] & 1) == 0) {
        [v8 isEqualToString:@"0"];
      }
    }
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = [v8 BOOLValue];
LABEL_12:

  return v9;
}

- (id)_accountPropertyForKey:()AppleMediaServices expectedClass:
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  uint64_t v8 = [v6 setWithObject:a4];
  uint64_t v9 = [a1 _accountPropertyForKey:v7 dataProtectionClass:0 expectedClasses:v8 error:0];

  return v9;
}

- (id)_accountPropertyForKey:()AppleMediaServices dataProtectionClass:expectedClasses:error:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (objc_msgSend(a1, "ams_isEphemeralAccount"))
  {
    id v12 = [a1 _ephemeralAccountPropertyForKey:v10 dataProtectionClass:a4 expectedClasses:v11 error:a6];
    goto LABEL_31;
  }
  id v13 = [a1 objectForKeyedSubscript:v10];
  if (v13)
  {
    if (!a4)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __98__ACAccount_AppleMediaServices___accountPropertyForKey_dataProtectionClass_expectedClasses_error___block_invoke;
      v33[3] = &unk_1E559E3B0;
      id v13 = v13;
      id v34 = v13;
      if (objc_msgSend(v11, "ams_firstObjectPassingTest:", v33))
      {
        id v12 = v13;
      }
      else
      {
        v26 = +[AMSLogConfig sharedAccountsConfig];
        if (!v26)
        {
          v26 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v27 = [v26 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = objc_opt_class();
          id v29 = AMSLogKey();
          id v30 = objc_opt_class();
          *(_DWORD *)buf = 138544386;
          uint64_t v39 = v28;
          __int16 v40 = 2114;
          id v41 = v29;
          __int16 v42 = 2114;
          id v43 = v10;
          __int16 v44 = 2114;
          id v45 = v30;
          __int16 v46 = 2114;
          id v47 = v11;
          id v31 = v30;
          _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An account property was stored as the wrong type. key = %{public}@ | actualClass = %{public}@ | expectedClasses = %{public}@", buf, 0x34u);
        }
        if (a6)
        {
          AMSError(0, @"Account Property", @"Failed to retrieve an account property because it wasn't of the expected type.", 0);
          id v12 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v12 = 0;
        }
      }

      goto LABEL_30;
    }
    uint64_t v14 = +[AMSLogConfig sharedAccountsConfig];
    if (!v14)
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = objc_opt_class();
      int v17 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v39 = v16;
      __int16 v40 = 2114;
      id v41 = v17;
      __int16 v42 = 2114;
      id v43 = v10;
      __int16 v44 = 2048;
      id v45 = a4;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Decrypting an account property. key = %{public}@ | dataProtectionClass = %ld", buf, 0x2Au);
    }
    id v35 = 0;
    id v36 = 0;
    id v37 = 0;
    id v13 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v13;

      objc_msgSend(v18, "ams_encryptionResult");
    }
    else
    {

      id v18 = 0;
      id v35 = 0;
      id v36 = 0;
      id v37 = 0;
    }

    __int16 v19 = +[AMSLogConfig sharedAccountsConfig];
    if (!v19)
    {
      __int16 v19 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      AMSLogKey();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v13);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = objc_opt_class();
      *(_DWORD *)buf = 138544386;
      uint64_t v39 = v21;
      __int16 v40 = 2114;
      id v41 = v22;
      __int16 v42 = 2114;
      id v43 = v10;
      __int16 v44 = 2114;
      id v45 = v23;
      __int16 v46 = 2114;
      id v47 = v24;
      id v25 = v24;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decrypt an account property. key = %{public}@ | value = %{public}@ | value.class = %{public}@", buf, 0x34u);
    }
    if (a6)
    {
      AMSError(0, @"Account Property Encryption", @"Failed to retrieve an account property because its encrypted value was nil.", 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v12 = 0;
LABEL_30:

LABEL_31:
  return v12;
}

- (uint64_t)ams_isiTunesAccount
{
  uint64_t v2 = [a1 accountType];
  uint64_t v3 = [v2 identifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F17890]]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = objc_msgSend(a1, "ams_isSandboxAccount");
  }

  return v4;
}

- (uint64_t)ams_isEphemeralAccount
{
  uint64_t v1 = [a1 identifier];
  uint64_t v2 = [v1 isEqualToString:@"iTunes-Ephemeral"];

  return v2;
}

- (id)ams_asynchronouslyAddGlobalCookiesForResponse:()AppleMediaServices
{
  id v4 = a3;
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    id v5 = [MEMORY[0x1E4F179B0] _getSetGlobalCookiesForResponse:v4];
    objc_msgSend(a1, "ams_asynchronouslyAddCookies:", v5);
  }
  else
  {
    id v5 = AMSError(2, @"Attempted adding cookies to non-local account", 0, 0);
    +[AMSBinaryPromise promiseWithError:v5];
  uint64_t v6 = };

  return v6;
}

- (id)ams_asynchronouslyAddCookiesForResponse:()AppleMediaServices
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F179B0], "_getSetCookiesForResponse:");
  uint64_t v3 = objc_msgSend(a1, "ams_asynchronouslyAddCookies:", v2);

  return v3;
}

- (uint64_t)ams_asynchronouslyAddCookies:()AppleMediaServices
{
  return [a1 _updateCookiesWithCookiesToAdd:a3 cookiesToRemove:0];
}

+ (id)_getSetCookiesForResponse:()AppleMediaServices
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = 0x1E4F18000uLL;
  id v5 = (void *)MEMORY[0x1E4F18D28];
  uint64_t v6 = [v3 allHeaderFields];
  id v7 = [v3 URL];
  uint64_t v8 = [v5 cookiesWithResponseHeaderFields:v6 forURL:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = [v3 allHeaderFields];
  id v11 = [v10 objectForKey:@"X-Apple-Set-User-Cookie"];

  if ([v11 length])
  {
    id v12 = [v3 allHeaderFields];
    id v13 = (void *)[v12 mutableCopy];

    [v13 setObject:v11 forKeyedSubscript:@"Set-Cookie"];
    uint64_t v14 = (void *)MEMORY[0x1E4F18D28];
    uint64_t v15 = [v3 URL];
    uint64_t v16 = [v14 cookiesWithResponseHeaderFields:v13 forURL:v15];
    [v9 addObjectsFromArray:v16];
  }
  if (os_variant_has_internal_content()
    && !+[AMSUnitTests isRunningUnitTests])
  {
    uint64_t v39 = v11;
    int v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    id v18 = [v3 valueForHTTPHeaderField:@"X-Apple-Jingle-Correlation-Key"];
    id v40 = v3;
    __int16 v19 = [v3 URL];
    v20 = [v19 absoluteString];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v9;
    uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v51)
    {
      uint64_t v49 = *MEMORY[0x1E4F18BF8];
      uint64_t v50 = *(void *)v53;
      uint64_t v48 = *MEMORY[0x1E4F18C00];
      __int16 v42 = v20;
      id v43 = v18;
      id v41 = v17;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v53 != v50) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v23 = [v22 properties];
          uint64_t v24 = (void *)[v23 mutableCopy];

          if (v18) {
            [v24 setObject:v18 forKeyedSubscript:v49];
          }
          if (v20) {
            [v24 setObject:v20 forKeyedSubscript:v48];
          }
          id v25 = [*(id *)(v4 + 3368) cookieWithProperties:v24];
          if (v25)
          {
            v26 = +[AMSLogConfig sharedAccountsCookiesConfig];
            if (!v26)
            {
              v26 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v27 = [v26 OSLogObject];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v28 = v4;
              id v29 = AMSLogKey();
              id v30 = NSString;
              uint64_t v31 = objc_opt_class();
              uint64_t v32 = v31;
              if (v29)
              {
                uint64_t v45 = AMSLogKey();
                uint64_t v33 = [v30 stringWithFormat:@"%@: [%@] ", v32, v45];
                __int16 v44 = (void *)v33;
                id v34 = v46;
              }
              else
              {
                uint64_t v33 = [v30 stringWithFormat:@"%@: ", v31];
                id v34 = (void *)v33;
              }
              id v37 = AMSHashIfNeeded(v25);
              *(_DWORD *)buf = 138543618;
              uint64_t v57 = v33;
              __int16 v58 = 2114;
              v59 = v37;
              _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Adding modified cookie: %{public}@", buf, 0x16u);
              __int16 v46 = v34;
              if (v29)
              {

                id v34 = (void *)v45;
              }

              unint64_t v4 = v28;
              int v17 = v41;
              v20 = v42;
              id v18 = v43;
            }

            id v35 = v17;
            id v36 = v25;
          }
          else
          {
            id v35 = v17;
            id v36 = v22;
          }
          [v35 addObject:v36];
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v51);
    }

    uint64_t v9 = (void *)[v17 copy];
    id v11 = v39;
    id v3 = v40;
  }

  return v9;
}

+ (id)_getSetGlobalCookiesForResponse:()AppleMediaServices
{
  id v3 = a3;
  unint64_t v4 = [v3 allHeaderFields];
  id v5 = [v4 objectForKey:@"X-Apple-Set-Cookie"];

  if ([v5 length])
  {
    uint64_t v6 = [v3 allHeaderFields];
    id v7 = (void *)[v6 mutableCopy];

    [v7 setObject:v5 forKeyedSubscript:@"Set-Cookie"];
    uint64_t v8 = (void *)MEMORY[0x1E4F18D28];
    uint64_t v9 = [v3 URL];
    id v10 = [v8 cookiesWithResponseHeaderFields:v7 forURL:v9];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (uint64_t)ams_privacyAcknowledgement
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"privacyAcknowledgement" expectedClass:v2];
}

- (id)ams_cookies
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = AMSLogKey();
    uint64_t v9 = NSString;
    uint64_t v10 = objc_opt_class();
    if (v8)
    {
      uint64_t v2 = AMSLogKey();
      uint64_t v3 = NSStringFromSelector(a2);
      [v9 stringWithFormat:@"%@: [%@] %@ ", v10, v2, v3];
    }
    else
    {
      uint64_t v2 = NSStringFromSelector(a2);
      [v9 stringWithFormat:@"%@: %@ ", v10, v2];
    id v11 = };
    id v12 = AMSHashIfNeeded(a1);
    *(_DWORD *)buf = 138543618;
    id v41 = v11;
    __int16 v42 = 2114;
    uint64_t v43 = (uint64_t)v12;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching cookies from cookie storage for account: %{public}@", buf, 0x16u);
    if (v8)
    {

      id v11 = (void *)v3;
    }
  }
  id v39 = 0;
  id v13 = +[AMSCookieStorage cookiesForAccount:a1 error:&v39];
  id v14 = v39;
  if (v13)
  {
    uint64_t v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = v14;
      int v17 = AMSLogKey();
      id v18 = NSString;
      uint64_t v19 = objc_opt_class();
      if (v17)
      {
        v20 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        [v18 stringWithFormat:@"%@: [%@] %@ ", v19, v20, a2];
      }
      else
      {
        v20 = NSStringFromSelector(a2);
        [v18 stringWithFormat:@"%@: %@ ", v19, v20];
      uint64_t v21 = };
      uint64_t v29 = [v13 count];
      id v30 = AMSHashIfNeeded(a1);
      *(_DWORD *)buf = 138543874;
      id v41 = v21;
      __int16 v42 = 2048;
      uint64_t v43 = v29;
      __int16 v44 = 2114;
      uint64_t v45 = v30;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched %lu cookies from cookie storage for account: %{public}@", buf, 0x20u);
      if (v17)
      {

        uint64_t v21 = (void *)a2;
      }

      id v14 = v37;
    }

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __44__ACAccount_AppleMediaServices__ams_cookies__block_invoke;
    v38[3] = &unk_1E559E270;
    v38[4] = a1;
    id v22 = objc_msgSend(v13, "ams_filterUsingTest:", v38);

    uint64_t v31 = +[AMSFeatureEnabler cookie];
    if (v31)
    {
      uint64_t v32 = [v22 arrayByAddingObject:v31];

      id v22 = (void *)v32;
    }
    uint64_t v33 = objc_msgSend(v22, "ams_filterUsingTest:", &__block_literal_global);
  }
  else
  {
    id v22 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v22)
    {
      id v22 = +[AMSLogConfig sharedConfig];
    }
    id v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = AMSLogKey();
      id v25 = NSString;
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = v26;
      if (v24)
      {
        uint64_t v2 = AMSLogKey();
        [v25 stringWithFormat:@"%@: [%@] ", v27, v2];
      }
      else
      {
        [v25 stringWithFormat:@"%@: ", v26];
      unint64_t v28 = };
      id v34 = AMSHashIfNeeded(a1);
      id v35 = AMSLogableError(v14);
      *(_DWORD *)buf = 138543874;
      id v41 = v28;
      __int16 v42 = 2114;
      uint64_t v43 = (uint64_t)v34;
      __int16 v44 = 2114;
      uint64_t v45 = v35;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@An error occurred fetching cookies. account = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v24)
      {

        unint64_t v28 = v2;
      }
    }
    uint64_t v33 = 0;
  }

  return v33;
}

- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices error:
{
  uint64_t v2 = objc_msgSend(a1, "_cookiesMatchingProperties:");
  uint64_t v3 = objc_msgSend(a1, "ams_removeCookies:", v2);

  return v3;
}

- (uint64_t)ams_removeCookies:()AppleMediaServices error:
{
  return [a1 _updateCookiesWithCookiesToAdd:0 cookiesToRemove:a3 error:a4];
}

- (uint64_t)ams_removeCookies:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_removeCookies:error:", a3, 0);
}

- (uint64_t)_updateCookiesWithCookiesToAdd:()AppleMediaServices cookiesToRemove:error:
{
  uint64_t v6 = objc_msgSend(a1, "_updateCookiesWithCookiesToAdd:cookiesToRemove:");
  uint64_t v7 = [v6 resultWithError:a5];

  return v7;
}

- (id)_cookiesMatchingProperties:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "ams_cookies");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ACAccount_AppleMediaServices___cookiesMatchingProperties___block_invoke;
  v9[3] = &unk_1E559E270;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "ams_filterUsingTest:", v9);

  return v7;
}

- (id)ams_cookiesForURL:()AppleMediaServices
{
  uint64_t v3 = objc_msgSend(a1, "ams_cookiesForURL:bag:", a3, 0);
  id v4 = [v3 resultWithError:0];

  return v4;
}

- (uint64_t)ams_cookiesForURL:()AppleMediaServices bag:
{
  return objc_msgSend(a1, "ams_cookiesForURL:bag:cleanupGlobalCookies:", a3, a4, 0);
}

- (uint64_t)ams_mergePrivacyAcknowledgement:()AppleMediaServices
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = objc_msgSend(a1, "ams_privacyAcknowledgement");

    if (!v5)
    {
      uint64_t v15 = 0;
      goto LABEL_45;
    }
  }
  id v35 = a1;
  uint64_t v6 = objc_msgSend(a1, "ams_privacyAcknowledgement");
  uint64_t v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = [v9 allKeys];
  [v10 addObjectsFromArray:v11];

  if (v4)
  {
    id v12 = [v4 allKeys];
    [v10 addObjectsFromArray:v12];
  }
  else
  {
    [v10 addObjectsFromArray:MEMORY[0x1E4F1CBF0]];
  }
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v13)
  {
    uint64_t v15 = 0;
    goto LABEL_44;
  }
  uint64_t v14 = v13;
  uint64_t v15 = 0;
  uint64_t v37 = *(void *)v47;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v47 != v37) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v46 + 1) + 8 * v16);
      id v18 = [v9 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
      }
      else
      {
        v20 = [v9 objectForKeyedSubscript:v17];

        if (v20)
        {
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          uint64_t v43 = __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke;
          __int16 v44 = &unk_1E559E310;
          uint64_t v45 = v35;
          uint64_t v21 = [v9 objectForKeyedSubscript:v17];
          v43((uint64_t)v42, v21);
        }
        id v19 = 0;
      }

      id v22 = [v4 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
      }
      else
      {
        id v23 = [v4 objectForKeyedSubscript:v17];

        if (v23)
        {
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          id v39 = __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke_267;
          id v40 = &unk_1E559E310;
          id v41 = v35;
          uint64_t v24 = [v4 objectForKeyedSubscript:v17];
          v39((uint64_t)v38, v24);

          id v23 = 0;
        }
      }

      if (v19 && !v23)
      {
        uint64_t v25 = 4;
        uint64_t v26 = v19;
LABEL_28:
        v15 |= v25;
        id v27 = v26;
LABEL_29:
        [v36 setObject:v27 forKeyedSubscript:v17];

        goto LABEL_30;
      }
      if (!v19 && v23)
      {
        uint64_t v25 = 2;
        uint64_t v26 = v23;
        goto LABEL_28;
      }
      uint64_t v28 = [v19 unsignedIntegerValue];
      if (v28 == [v23 unsignedIntegerValue]) {
        goto LABEL_36;
      }
      if ([v23 unsignedIntegerValue])
      {
        unint64_t v29 = [v19 unsignedIntegerValue];
        if (v29 > [v23 unsignedIntegerValue])
        {
          v15 |= 4uLL;
LABEL_36:
          id v30 = v19;
          goto LABEL_39;
        }
        unint64_t v31 = [v19 unsignedIntegerValue];
        if (v31 >= [v23 unsignedIntegerValue]) {
          goto LABEL_30;
        }
      }
      v15 |= 2uLL;
      id v30 = v23;
LABEL_39:
      id v27 = v30;
      if (v27) {
        goto LABEL_29;
      }
LABEL_30:

      ++v16;
    }
    while (v14 != v16);
    uint64_t v32 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    uint64_t v14 = v32;
  }
  while (v32);
LABEL_44:

  [v35 _setAccountProperty:v36 forKey:@"privacyAcknowledgement" expectedClass:objc_opt_class()];
LABEL_45:

  return v15;
}

- (uint64_t)_setAccountProperty:()AppleMediaServices forKey:expectedClass:
{
  return [a1 _setAccountProperty:a3 forKey:a4 dataProtectionClass:0 expectedClass:a5];
}

- (void)_setAccountProperty:()AppleMediaServices forKey:dataProtectionClass:expectedClass:
{
  id v10 = a4;
  id v11 = a3;
  if (objc_msgSend(a1, "ams_isEphemeralAccount")) {
    [a1 _setEphemeralAccountProperty:v11 forKey:v10 dataProtectionClass:a5 expectedClass:a6];
  }
  else {
    AMSSetAccountProperty(a1, v11, v10, a5, a6);
  }
}

- (id)_ams_getAccountFlagsShimmedWithError:()AppleMediaServices
{
  if (_os_feature_enabled_impl() && (objc_msgSend(a1, "ams_isLocalOrSandboxAccount") & 1) == 0)
  {
    id v5 = +[AMSAccountCachedServerData sharedInstance];
    uint64_t v6 = objc_msgSend(a1, "ams_accountID");
    uint64_t v7 = [v5 stringForKey:0 accountID:v6 updateBlock:&__block_literal_global_335];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__ACAccount_AppleMediaServices___ams_getAccountFlagsShimmedWithError___block_invoke_2;
    v11[3] = &unk_1E559E418;
    v11[4] = a1;
    [v7 addFinishBlock:v11];
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
  id v9 = [a1 _accountPropertyForKey:@"accountFlags" dataProtectionClass:1 expectedClasses:v8 error:a3];

  return v9;
}

- (uint64_t)ams_isSandboxAccount
{
  uint64_t v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17898]];

  return v3;
}

- (uint64_t)ams_isLocalOrSandboxAccount
{
  if (objc_msgSend(a1, "ams_isLocalAccount")) {
    return 1;
  }
  return objc_msgSend(a1, "ams_isSandboxAccount");
}

- (AMSAccountIdentity)ams_accountID
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "ams_altDSID");
  if (v3
    && (id v4 = (void *)v3,
        objc_msgSend(a1, "ams_DSID"),
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [AMSAccountIdentity alloc];
    uint64_t v7 = objc_msgSend(a1, "ams_DSID");
    uint64_t v8 = objc_msgSend(a1, "ams_altDSID");
    id v9 = [(AMSAccountIdentity *)v6 initWithDSID:v7 altDSID:v8];
  }
  else
  {
    id v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = AMSLogKey();
      uint64_t v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v14;
      if (v12)
      {
        uint64_t v1 = AMSLogKey();
        [v13 stringWithFormat:@"%@: [%@] ", v15, v1];
      }
      else
      {
        [v13 stringWithFormat:@"%@: ", v14];
      uint64_t v16 = };
      uint64_t v17 = AMSHashIfNeeded(a1);
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      __int16 v21 = 2114;
      id v22 = v17;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Account is missing an identifier. account = %{public}@", buf, 0x16u);
      if (v12)
      {

        uint64_t v16 = (void *)v1;
      }
    }
    id v9 = 0;
  }
  return v9;
}

- (id)ams_accountFlagValueForAccountFlag:()AppleMediaServices
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "ams_accountFlagOverrideValueForAccountFlag:", v4);
  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [a1 hashedDescription];
      int v27 = 138543874;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      id v30 = v4;
      __int16 v31 = 2114;
      id v32 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: The account has overrode value for an account flag. accountFlag = %{public}@ | account = %{public}@", (uint8_t *)&v27, 0x20u);
    }
    id v11 = v5;
LABEL_7:
    id v12 = v11;
    goto LABEL_8;
  }
  uint64_t v14 = objc_msgSend(a1, "ams_accountFlags");
  id v12 = [v14 objectForKeyedSubscript:v4];

  if (!v12)
  {
    id v22 = +[AMSLogConfig sharedAccountsConfig];
    if (!v22)
    {
      id v22 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      id v25 = v24;
      uint64_t v26 = [a1 hashedDescription];
      int v27 = 138543874;
      uint64_t v28 = v24;
      __int16 v29 = 2114;
      id v30 = v4;
      __int16 v31 = 2114;
      id v32 = v26;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: The account has no value for an account flag. We'll return the default value. accountFlag = %{public}@ | account = %{public}@", (uint8_t *)&v27, 0x20u);
    }
    id v11 = [MEMORY[0x1E4F179B0] _defaultValueForAccountFlag:v4];
    goto LABEL_7;
  }
  if (([MEMORY[0x1E4F179B0] _isAccountFlagValue:v12 validForAccountFlag:v4] & 1) == 0)
  {
    uint64_t v15 = +[AMSLogConfig sharedAccountsConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v17;
      id v19 = [a1 hashedDescription];
      v20 = AMSHashIfNeeded(v12);
      int v27 = 138544386;
      uint64_t v28 = v17;
      __int16 v29 = 2114;
      id v30 = v19;
      __int16 v31 = 2114;
      id v32 = v4;
      __int16 v33 = 2114;
      id v34 = v20;
      __int16 v35 = 2114;
      id v36 = (id)objc_opt_class();
      id v21 = v36;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: An account flag was stored with an invalid value. account = %{public}@ | flag = %{public}@ | value = %{public}@ | value.class = %{public}@", (uint8_t *)&v27, 0x34u);
    }
    id v12 = 0;
  }
LABEL_8:

  return v12;
}

+ (uint64_t)_isAccountFlagValue:()AppleMediaServices validForAccountFlag:
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB38D540 != -1) {
    dispatch_once(&qword_1EB38D540, &__block_literal_global_359);
  }
  if ([(id)qword_1EB38D548 containsObject:v6])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (uint64_t)ams_accountFlags
{
  return objc_msgSend(a1, "_ams_getAccountFlagsShimmedWithError:", 0);
}

- (uint64_t)ams_automaticDownloadKinds
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"automaticDownloadKinds" expectedClass:v2];
}

- (uint64_t)ams_creditsString
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"accountCredits" expectedClass:v2];
}

- (BOOL)ams_didAgreeToTerms
{
  uint64_t v1 = [a1 _accountPropertyForKey:@"didAgreeToTerms" expectedClass:objc_opt_class()];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)ams_disableAccountFlagsSync
{
  uint64_t v1 = [a1 _accountPropertyForKey:@"disableAccountFlagsSync" expectedClass:objc_opt_class()];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)ams_disablePrivacyAcknowledgementSync
{
  uint64_t v1 = [a1 _accountPropertyForKey:@"disablePrivacyAcknowledgementSync" expectedClass:objc_opt_class()];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)ams_freePasswordPromptSetting
{
  uint64_t v1 = [a1 _accountPropertyForKey:@"freeDownloadsPasswordSetting" expectedClass:objc_opt_class()];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)ams_setFreePasswordPromptSetting:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"freeDownloadsPasswordSetting" expectedClass:objc_opt_class()];
}

- (BOOL)ams_isiCloudFamily
{
  uint64_t v1 = [a1 _accountPropertyForKey:@"iCloudFamily" expectedClass:objc_opt_class()];
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)ams_iCloudPartition
{
  uint64_t v1 = [a1 propertiesForDataclass:@"com.apple.Dataclass.Quota"];
  BOOL v2 = [v1 objectForKey:@"partition"];

  return v2;
}

- (BOOL)ams_isInGoodStanding
{
  uint64_t v1 = [a1 _accountPropertyForKey:@"inGoodStanding" expectedClass:objc_opt_class()];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)ams_isManagedAppleID
{
  return [a1 _accountPropertyBooleanForKey:@"isManagedAppleID"];
}

- (uint64_t)ams_isValidPayment
{
  return [a1 _accountPropertyBooleanForKey:@"validPayment"];
}

- (id)ams_lastAuthenticationServerResponse
{
  BOOL v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
  uint64_t v3 = [a1 _accountPropertyForKey:@"lastAuthenticationServerResponse" dataProtectionClass:1 expectedClasses:v2 error:0];

  return v3;
}

- (uint64_t)ams_mergedPrivacyAcknowledgement
{
  return [a1 _accountPropertyBooleanForKey:@"mergedPrivacyAcknowledgements"];
}

- (uint64_t)ams_paidPasswordPromptSetting
{
  uint64_t v1 = [a1 _accountPropertyForKey:@"paidPurchasesPasswordSetting" expectedClass:objc_opt_class()];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)ams_setPaidPasswordPromptSetting:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"paidPurchasesPasswordSetting" expectedClass:objc_opt_class()];
}

- (id)ams_password
{
  uint64_t v1 = [a1 credential];
  id v2 = [v1 password];

  return v2;
}

- (uint64_t)ams_pushRegistrationThrottleMap
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"pushRegistrationThrottleMap" expectedClass:v2];
}

- (id)ams_rawPassword
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 credential];
  uint64_t v3 = [v2 credentialItemForKey:*MEMORY[0x1E4F17970]];

  if (!v3)
  {
    if (!objc_msgSend(a1, "ams_isDemoAccount"))
    {
      uint64_t v3 = 0;
      goto LABEL_15;
    }
    uint64_t v3 = [a1 _accountPropertyForKey:@"demoAccountRawPassword" expectedClass:objc_opt_class()];
    uint64_t v4 = +[AMSLogConfig sharedAccountsConfig];
    id v5 = (void *)v4;
    if (v3)
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      id v9 = "%{public}@: [%{public}@] Using the demo password.";
      id v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      uint64_t v12 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      id v9 = "%{public}@: [%{public}@] The demo account is missing a raw password.";
      id v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_18D554000, v10, v11, v9, (uint8_t *)&v14, 0x16u);

LABEL_14:
  }
LABEL_15:
  return v3;
}

- (uint64_t)ams_registerSuccessCriteria
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"registerSuccessCriteria" expectedClass:v2];
}

- (BOOL)ams_requiresAuthKitUpdate
{
  uint64_t v2 = objc_msgSend(a1, "ams_DSID");
  if (v2)
  {
    uint64_t v3 = [a1 credential];
    uint64_t v4 = [v3 password];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)ams_setAgreedToTerms:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"didAgreeToTerms" expectedClass:objc_opt_class()];
}

- (void)ams_setAltDSID:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"altDSID" expectedClass:objc_opt_class()];
}

- (void)ams_setCreditsString:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"accountCredits" expectedClass:objc_opt_class()];
}

- (uint64_t)ams_setDisableAccountFlagsSync:()AppleMediaServices
{
  if (a3) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_opt_class();
  return [a1 _setAccountProperty:v4 forKey:@"disableAccountFlagsSync" expectedClass:v5];
}

- (uint64_t)ams_setDisablePrivacyAcknowledgementSync:()AppleMediaServices
{
  if (a3) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_opt_class();
  return [a1 _setAccountProperty:v4 forKey:@"disablePrivacyAcknowledgementSync" expectedClass:v5];
}

- (void)ams_setDSID:()AppleMediaServices
{
  id v5 = a3;
  if (objc_msgSend(a1, "ams_isiCloudAccount"))
  {
    uint64_t v4 = [v5 stringValue];
    [a1 _setAccountProperty:v4 forKey:@"personID" expectedClass:objc_opt_class()];
  }
  else if (objc_msgSend(a1, "ams_isiTunesAccount"))
  {
    [a1 _setAccountProperty:v5 forKey:@"dsid" expectedClass:objc_opt_class()];
  }
}

- (void)ams_setFirstName:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"firstName" expectedClass:objc_opt_class()];
}

- (void)ams_setiCloudFamily:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"iCloudFamily" expectedClass:objc_opt_class()];
}

- (void)ams_setInGoodStanding:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"inGoodStanding" expectedClass:objc_opt_class()];
}

- (void)ams_setLastName:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"lastName" expectedClass:objc_opt_class()];
}

- (void)ams_setManagedAppleID:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"isManagedAppleID" expectedClass:objc_opt_class()];
}

- (void)ams_setMergedPrivacyAcknowledgement:()AppleMediaServices
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
    [a1 _setAccountProperty:v9 forKey:@"mergedPrivacyAcknowledgements" expectedClass:objc_opt_class()];
  }
  else
  {
    id v5 = +[AMSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to set mergedPrivacyAcknowledgement on a non-local account.", buf, 0x16u);
    }
  }
}

- (void)ams_setPassword:()AppleMediaServices
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedAccountsConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = AMSLogKey();
    id v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v26 = a2;
    if (v9)
    {
      __int16 v12 = AMSLogKey();
      uint64_t v3 = NSStringFromSelector(a2);
      [v10 stringWithFormat:@"%@: [%@] %@ ", v11, v12, v3];
    }
    else
    {
      __int16 v12 = NSStringFromSelector(a2);
      [v10 stringWithFormat:@"%@: %@ ", v11, v12];
    uint64_t v13 = };
    uint64_t v14 = AMSHashIfNeeded(a1);
    uint64_t v15 = AMSHashAndLogCacheMisses(v6, 0);
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v13;
    __int16 v29 = 2114;
    id v30 = v14;
    __int16 v31 = 2114;
    id v32 = v15;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the password of an account. account = %{public}@ | password = %{public}@", buf, 0x20u);
    if (v9)
    {

      uint64_t v13 = (void *)v3;
    }

    a2 = v26;
  }

  id v16 = [a1 credential];
  if (!v16)
  {
    uint64_t v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = AMSLogKey();
      v20 = NSString;
      uint64_t v21 = objc_opt_class();
      if (v19)
      {
        id v22 = AMSLogKey();
        NSStringFromSelector(a2);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        [v20 stringWithFormat:@"%@: [%@] %@ ", v21, v22, v16];
      }
      else
      {
        id v22 = NSStringFromSelector(a2);
        [v20 stringWithFormat:@"%@: %@ ", v21, v22];
      uint64_t v23 = };
      uint64_t v24 = AMSHashIfNeeded(a1);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v23;
      __int16 v29 = 2114;
      id v30 = v24;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@The account did not have a credential, creating one. account = %{public}@", buf, 0x16u);
      if (v19)
      {

        uint64_t v23 = v16;
      }
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F179C0]);
    [a1 setCredential:v16];
  }
  id v25 = [a1 credential];
  [v25 setPassword:v6];
}

- (void)ams_setPushRegistrationThrottleMap:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"pushRegistrationThrottleMap" expectedClass:objc_opt_class()];
}

- (void)ams_setRawPassword:()AppleMediaServices
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 credential];
  if (!v7)
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = AMSLogKey();
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      if (v10)
      {
        uint64_t v13 = AMSLogKey();
        uint64_t v3 = NSStringFromSelector(a2);
        [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v13, v3];
      }
      else
      {
        uint64_t v13 = NSStringFromSelector(a2);
        [v11 stringWithFormat:@"%@: %@ ", v12, v13];
      uint64_t v14 = };
      uint64_t v15 = AMSHashIfNeeded(a1);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v15;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@The account did not have a credential, creating one. account = %{public}@", buf, 0x16u);
      if (v10)
      {

        uint64_t v14 = (void *)v3;
      }
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F179C0]);
    [a1 setCredential:v7];
  }
  id v16 = [a1 credential];
  [v16 setCredentialItem:v6 forKey:*MEMORY[0x1E4F17970]];

  if (objc_msgSend(a1, "ams_isDemoAccount"))
  {
    uint64_t v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = AMSLogKey();
      v20 = NSString;
      uint64_t v21 = objc_opt_class();
      if (v19)
      {
        id v22 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        [v20 stringWithFormat:@"%@: [%@] %@ ", v21, v22, a2];
      }
      else
      {
        id v22 = NSStringFromSelector(a2);
        [v20 stringWithFormat:@"%@: %@ ", v21, v22];
      uint64_t v23 = };
      uint64_t v24 = AMSHashIfNeeded(a1);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v23;
      __int16 v27 = 2114;
      uint64_t v28 = v24;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Setting the demo account's raw password. account = %{public}@", buf, 0x16u);
      if (v19)
      {

        uint64_t v23 = (void *)a2;
      }
    }
    [a1 _setAccountProperty:v6 forKey:@"demoAccountRawPassword" expectedClass:objc_opt_class()];
  }
}

- (void)ams_setRegisterSuccessCriteria:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"registerSuccessCriteria" expectedClass:objc_opt_class()];
}

- (void)ams_setServerResponse:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"lastAuthenticationServerResponse" dataProtectionClass:1 expectedClass:objc_opt_class()];
}

- (uint64_t)ams_setStorefront:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_setStorefront:forMediaType:", a3, 0);
}

- (void)ams_setValidPayment:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setAccountProperty:v2 forKey:@"validPayment" expectedClass:objc_opt_class()];
}

+ (id)ams_createEphemeralAccount
{
  id v0 = objc_alloc(MEMORY[0x1E4F179B0]);
  id v1 = objc_alloc(MEMORY[0x1E4F179D8]);
  id v2 = (void *)[v1 initWithIdentifier:*MEMORY[0x1E4F17890] description:@"Ephemeral Account"];
  uint64_t v3 = (void *)[v0 initWithAccountType:v2];

  [v3 setIdentifier:@"iTunes-Ephemeral"];
  [v3 setActive:0];
  [v3 setUsername:@"Ephemeral"];
  return v3;
}

+ (AMSStorageDatabase)_ams_storage
{
  id v0 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
  return v0;
}

- (id)ams_delta:()AppleMediaServices
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4
    || ([a1 identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 identifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [a1 accountProperties];
    uint64_t v11 = [(id)v10 allKeys];
    uint64_t v12 = [v9 setWithArray:v11];
    [v8 unionSet:v12];

    if (v4)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = [v4 accountProperties];
      uint64_t v14 = [(id)v10 allKeys];
      uint64_t v15 = [v13 setWithArray:v14];
      [v8 unionSet:v15];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v16 = v8;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v10 = [a1 objectForKeyedSubscript:v21];
          uint64_t v22 = [v4 objectForKeyedSubscript:v21];
          if (v10 | v22 && ([(id)v10 isEqual:v22] & 1) == 0)
          {
            uint64_t v23 = [[AMSPair alloc] initWithFirst:v10 second:v22];
            [v45 setObject:v23 forKeyedSubscript:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v18);
    }

    uint64_t v24 = [a1 accountType];
    if (v24 || ([v4 accountType], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v25 = [a1 accountType];
      uint64_t v26 = [v4 accountType];
      char v27 = [v25 isEqual:v26];

      if (v24)
      {

        if (v27) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }

      if ((v27 & 1) == 0)
      {
LABEL_19:
        uint64_t v28 = [AMSPair alloc];
        uint64_t v10 = [a1 accountType];
        uint64_t v29 = [v4 accountType];
        id v30 = [(AMSPair *)v28 initWithFirst:v10 second:v29];
        [v45 setObject:v30 forKeyedSubscript:@"accountType"];
      }
    }
LABEL_20:
    int v31 = [a1 isActive];
    if (v31 != [v4 isActive])
    {
      id v32 = [AMSPair alloc];
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "isActive"));
      uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "isActive"));
      id v34 = [(AMSPair *)v32 initWithFirst:v10 second:v33];
      [v45 setObject:v34 forKeyedSubscript:@"active"];
    }
    __int16 v35 = [a1 username];
    if (!v35)
    {
      uint64_t v10 = [v4 username];
      if (!v10) {
        goto LABEL_27;
      }
    }
    id v36 = [a1 username];
    uint64_t v37 = [v4 username];
    char v38 = [v36 isEqual:v37];

    if (v35)
    {

      if (v38)
      {
LABEL_27:
        uint64_t v43 = (void *)[v45 copy];

        goto LABEL_29;
      }
    }
    else
    {

      if (v38) {
        goto LABEL_27;
      }
    }
    id v39 = [AMSPair alloc];
    id v40 = [a1 username];
    id v41 = [v4 username];
    __int16 v42 = [(AMSPair *)v39 initWithFirst:v40 second:v41];
    [v45 setObject:v42 forKeyedSubscript:@"username"];

    goto LABEL_27;
  }
  uint64_t v43 = 0;
LABEL_29:

  return v43;
}

- (uint64_t)ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend((id)objc_opt_class(), "_ams_storage");
  id v23 = 0;
  uint64_t v3 = [v2 valueForKey:@"bundleHolderAcknowledgedAccounts" error:&v23];
  id v4 = v23;
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = objc_opt_class();
      id v8 = v7;
      id v9 = [a1 hashedDescription];
      uint64_t v10 = AMSLogableError(v4);
      *(_DWORD *)buf = 138543874;
      id v25 = v7;
      __int16 v26 = 2114;
      char v27 = v9;
      __int16 v28 = 2114;
      uint64_t v29 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not pull accounts acknowledged on device for holder %{public}@ %{public}@", buf, 0x20u);
    }
  }
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    uint64_t v11 = @"local";
  }
  else
  {
    uint64_t v12 = objc_msgSend(a1, "ams_DSID");
    uint64_t v11 = [v12 stringValue];

    if (!v11)
    {
      uint64_t v14 = 0;
      goto LABEL_18;
    }
  }
  if (v3)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__ACAccount_AppleMediaServices__ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice__block_invoke;
    v21[3] = &unk_1E559E2C0;
    uint64_t v22 = v11;
    uint64_t v13 = v11;
    uint64_t v14 = objc_msgSend(v3, "ams_anyWithTest:", v21);
    uint64_t v15 = v22;
  }
  else
  {
    uint64_t v15 = +[AMSLogConfig sharedAccountsConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v17;
      uint64_t v19 = [a1 hashedDescription];
      *(_DWORD *)buf = 138543618;
      id v25 = v17;
      __int16 v26 = 2114;
      char v27 = v19;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: No accounts acknowledged on device for holder found %{public}@", buf, 0x16u);
    }
    uint64_t v14 = 0;
  }

LABEL_18:
  return v14;
}

- (uint64_t)ams_encryptAccountFlags
{
  id v2 = [a1 accountPropertyForKey:@"accountFlags"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v3 = 0;
    goto LABEL_7;
  }
  id v3 = v2;

  if (!v3)
  {
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "ams_encryptionResult");
  uint64_t v4 = 1;
  objc_msgSend(a1, "ams_setAccountFlags:", v3);

LABEL_8:
  return v4;
}

- (uint64_t)ams_isDuplicate:()AppleMediaServices
{
  id v4 = a3;
  id v5 = [a1 identifier];
  id v6 = [v4 identifier];
  char v7 = [v5 isEqualToString:v6];

  if (v7) {
    goto LABEL_32;
  }
  id v8 = [a1 accountType];
  id v9 = [v8 identifier];
  uint64_t v10 = [v4 accountType];
  uint64_t v11 = [v10 identifier];
  int v12 = [v9 isEqualToString:v11];

  if (!v12) {
    goto LABEL_32;
  }
  uint64_t v13 = objc_msgSend(a1, "ams_altDSID");
  if (v13)
  {
    id v9 = objc_msgSend(a1, "ams_altDSID");
    if ([v9 isEqualToString:&stru_1EDCA7308])
    {

      goto LABEL_14;
    }
  }
  uint64_t v14 = objc_msgSend(v4, "ams_altDSID");
  if (v14
    && (objc_msgSend(v4, "ams_altDSID"),
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        ([(id)v11 isEqualToString:&stru_1EDCA7308] & 1) != 0))
  {
    char v15 = 0;
  }
  else
  {
    id v16 = objc_msgSend(a1, "ams_altDSID");
    uint64_t v17 = objc_msgSend(v4, "ams_altDSID");
    char v15 = [v16 isEqualToString:v17];

    if (!v14) {
      goto LABEL_11;
    }
  }

LABEL_11:
  if (v13)
  {
  }
  if (v15) {
    goto LABEL_29;
  }
LABEL_14:
  uint64_t v18 = objc_msgSend(v4, "ams_DSID");
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    v20 = objc_msgSend(a1, "ams_DSID");
    uint64_t v21 = objc_msgSend(v4, "ams_DSID");
    uint64_t v11 = [v20 isEqualToNumber:v21];

    if (v11) {
      goto LABEL_29;
    }
  }
  uint64_t v22 = [a1 username];
  if (v22)
  {
    id v23 = [a1 username];
    if ([v23 isEqualToString:&stru_1EDCA7308])
    {

      goto LABEL_30;
    }
    id v32 = v23;
  }
  uint64_t v24 = [v4 username];
  if (v24
    && ([v4 username],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        ([(id)v11 isEqualToString:&stru_1EDCA7308] & 1) != 0))
  {
    char v25 = 0;
  }
  else
  {
    __int16 v26 = [a1 username];
    char v27 = [v26 lowercaseString];
    __int16 v28 = [v4 username];
    uint64_t v29 = [v28 lowercaseString];
    char v25 = [v27 isEqualToString:v29];

    if (!v24) {
      goto LABEL_26;
    }
  }

LABEL_26:
  if (v22)
  {
  }
  if ((v25 & 1) == 0)
  {
LABEL_30:
    if (objc_msgSend(a1, "ams_isLocalAccount"))
    {
      uint64_t v30 = objc_msgSend(v4, "ams_isLocalAccount");
      goto LABEL_33;
    }
LABEL_32:
    uint64_t v30 = 0;
    goto LABEL_33;
  }
LABEL_29:
  uint64_t v30 = 1;
LABEL_33:

  return v30;
}

- (id)ams_isInRestrictedRegionWithBag:()AppleMediaServices waitForSync:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = AMSSetLogKeyIfNeeded();
  id v8 = objc_msgSend(a1, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (!v6)
  {
    id v16 = +[AMSLogConfig sharedAccountsConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v30 = (id)objc_opt_class();
      __int16 v31 = 2114;
      id v32 = v7;
      id v18 = v30;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load bag", buf, 0x16u);
    }
    AMSError(200, @"Bag Invalid Value Error", @"Bag Load Failed", 0);
    uint64_t v10 = (AMSSyncRestrictedRegionTask *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = +[AMSPromise promiseWithError:v10];
    goto LABEL_23;
  }
  uint64_t v10 = [[AMSSyncRestrictedRegionTask alloc] initWithAccount:a1 bag:v6];
  uint64_t v11 = +[AMSLogConfig sharedAccountsConfig];
  int v12 = (void *)v11;
  if (!a4)
  {
    if (!v11)
    {
      int v12 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v12 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_opt_class();
      int v22 = [v9 BOOLValue];
      id v23 = @"NO";
      *(_DWORD *)buf = 138543874;
      id v30 = v21;
      __int16 v31 = 2114;
      if (v22) {
        id v23 = @"YES";
      }
      id v32 = v7;
      __int16 v33 = 2114;
      id v34 = v23;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask but do not wait for the sync task to be finished, returning currentIsInRestrictedRegion = %{public}@", buf, 0x20u);
    }

    id v24 = [(AMSSyncRestrictedRegionTask *)v10 performSync];
    uint64_t v19 = +[AMSPromise promiseWithResult:v9];
LABEL_23:
    char v15 = (void *)v19;
    goto LABEL_24;
  }
  if (!v11)
  {
    int v12 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = (id)objc_opt_class();
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask and return the promise, which will be finished when the task is done.", buf, 0x16u);
  }

  uint64_t v14 = [(AMSSyncRestrictedRegionTask *)v10 performSync];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__ACAccount_AppleMediaServices__ams_isInRestrictedRegionWithBag_waitForSync___block_invoke;
  v26[3] = &unk_1E559E2E8;
  v26[4] = a1;
  id v27 = v7;
  id v28 = v9;
  char v15 = [v14 continueWithBlock:v26];

LABEL_24:
  return v15;
}

- (uint64_t)ams_isInRestrictedRegionWithBag:()AppleMediaServices shouldWaitForSync:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = AMSSetLogKeyIfNeeded();
  uint64_t v8 = objc_msgSend(a1, "ams_valueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
  id v9 = [[AMSSyncRestrictedRegionTask alloc] initWithAccount:a1 bag:v6];

  uint64_t v10 = +[AMSLogConfig sharedConfig];
  uint64_t v11 = (void *)v10;
  if (a4)
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    int v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = objc_opt_class();
      __int16 v33 = 2114;
      id v34 = v7;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask and wait until sync finishes.", buf, 0x16u);
    }

    uint64_t v13 = [(AMSSyncRestrictedRegionTask *)v9 performSync];
    id v30 = 0;
    id v14 = (id)[v13 resultWithError:&v30];
    id v15 = v30;

    if (v15)
    {
      id v16 = +[AMSLogConfig sharedAccountsConfig];
      if (!v16)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        AMSHashIfNeeded(a1);
        uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v20 = AMSLogableError(v15);
        *(_DWORD *)buf = 138544130;
        uint64_t v32 = v18;
        __int16 v33 = 2114;
        id v34 = v7;
        __int16 v35 = 2114;
        id v36 = v19;
        __int16 v37 = 2114;
        char v38 = v20;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSSyncRestrictedRegionTask has failed. account = %{public}@ | error = %{public}@", buf, 0x2Au);
      }
    }
    uint64_t v8 = objc_msgSend(a1, "ams_valueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
    uint64_t v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      uint64_t v21 = +[AMSLogConfig sharedConfig];
    }
    int v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = objc_opt_class();
      id v24 = @"NO";
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v23;
      __int16 v33 = 2114;
      if (v8) {
        id v24 = @"YES";
      }
      id v34 = v7;
      __int16 v35 = 2114;
      id v36 = v24;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: AMSSyncRestrictedRegionTask has finished, IsInRestrictedRegion = %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    char v25 = [v11 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = objc_opt_class();
      id v27 = @"NO";
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v26;
      __int16 v33 = 2114;
      if (v8) {
        id v27 = @"YES";
      }
      id v34 = v7;
      __int16 v35 = 2114;
      id v36 = v27;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask but not waiting for sync, returning currentIsInRestrictedRegion = %{public}@", buf, 0x20u);
    }

    id v28 = [(AMSSyncRestrictedRegionTask *)v9 performSync];
  }

  return v8;
}

- (uint64_t)ams_isSubjectToPerDeviceBundleHolderAcknowledgement
{
  id v2 = objc_msgSend(a1, "ams_isBundleOwner");

  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(a1, "ams_isBundleOwner");
  if ([v3 BOOLValue]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(a1, "ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice") ^ 1;
  }

  return v4;
}

- (void)ams_setAccountFlagValue:()AppleMediaServices forAccountFlag:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = a4;
  if (([MEMORY[0x1E4F179B0] _isAccountFlagWritable:v7] & 1) == 0)
  {
    id v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v10 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_opt_class();
      id v15 = v14;
      id v16 = [a1 hashedDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = (uint64_t)v14;
      __int16 v49 = 2114;
      uint64_t v50 = v16;
      __int16 v51 = 2114;
      long long v52 = v7;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to modify a read-only account flag. account = %{public}@ | flag = %{public}@", buf, 0x20u);
    }
    goto LABEL_51;
  }
  if (([MEMORY[0x1E4F179B0] _isAccountFlagValue:v6 validForAccountFlag:v7] & 1) == 0)
  {
    id v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v10 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    uint64_t v17 = objc_opt_class();
    uint64_t v13 = v17;
    uint64_t v18 = [a1 hashedDescription];
    *(_DWORD *)buf = 138544130;
    uint64_t v48 = (uint64_t)v17;
    __int16 v49 = 2114;
    uint64_t v50 = v18;
    __int16 v51 = 2114;
    long long v52 = v7;
    __int16 v53 = 2114;
    id v54 = (id)objc_opt_class();
    id v19 = v54;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to set an account flag with an invalid value. account = %{public}@ | flag = %{public}@ value.class = %{public}@", buf, 0x2Au);

    goto LABEL_49;
  }
  if (!_os_feature_enabled_impl() || (objc_msgSend(a1, "ams_isLocalOrSandboxAccount") & 1) != 0)
  {
    id v46 = 0;
    uint64_t v8 = objc_msgSend(a1, "_ams_getAccountFlagsShimmedWithError:", &v46);
    id v9 = v46;
    id v10 = v9;
    if (v8 || !v9)
    {
LABEL_28:
      uint64_t v13 = [v8 mutableCopy];
      if (!v13) {
        uint64_t v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      [v13 setObject:v6 forKeyedSubscript:v7];
      if (([v8 isEqualToDictionary:v13] & 1) == 0) {
        objc_msgSend(a1, "_ams_setAccountFlagsShimmed:", v13);
      }
      goto LABEL_50;
    }
    uint64_t v11 = [v9 userInfo];
    int v12 = [v11 objectForKeyedSubscript:@"AMSCryptoErrorCode"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }

    if ([v13 integerValue] == -4308)
    {
      uint64_t v23 = +[AMSLogConfig sharedAccountsConfig];
      if (!v23)
      {
        uint64_t v23 = +[AMSLogConfig sharedConfig];
      }
      id v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = objc_opt_class();
        char v25 = [a1 hashedDescription];
        uint64_t v26 = AMSLogableError(v10);
        *(_DWORD *)buf = 138544130;
        uint64_t v48 = v45;
        __int16 v49 = 2114;
        uint64_t v50 = v13;
        __int16 v51 = 2114;
        long long v52 = v25;
        __int16 v53 = 2114;
        id v54 = v26;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: We failed to decrypt the original account flags with error code %{public}@. Will overwrite with new ones. account = %{public}@ | error = %{public}@", buf, 0x2Au);
      }
      goto LABEL_28;
    }
    uint64_t v27 = +[AMSLogConfig sharedAccountsConfig];
    id v19 = (id)v27;
    if (v13)
    {
      if (!v27)
      {
        id v19 = +[AMSLogConfig sharedConfig];
      }
      id v28 = [v19 OSLogObject];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      uint64_t v29 = objc_opt_class();
      id v30 = [a1 hashedDescription];
      __int16 v31 = AMSLogableError(v10);
      *(_DWORD *)buf = 138544130;
      uint64_t v48 = v29;
      __int16 v49 = 2114;
      uint64_t v50 = v13;
      __int16 v51 = 2114;
      long long v52 = v30;
      __int16 v53 = 2114;
      id v54 = v31;
      uint64_t v32 = "%{public}@: We failed to decrypt the original account flags with error code %{public}@. Refusing to add new "
            "flags. account = %{public}@ | error = %{public}@";
      __int16 v33 = v28;
      uint32_t v34 = 42;
    }
    else
    {
      if (!v27)
      {
        id v19 = +[AMSLogConfig sharedConfig];
      }
      id v28 = [v19 OSLogObject];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      uint64_t v41 = objc_opt_class();
      id v30 = [a1 hashedDescription];
      __int16 v31 = AMSLogableError(v10);
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v41;
      __int16 v49 = 2114;
      uint64_t v50 = v30;
      __int16 v51 = 2114;
      long long v52 = v31;
      uint64_t v32 = "%{public}@: We failed to decrypt the original account flags. Refusing to add new flags. account = %{public}@"
            " | error = %{public}@";
      __int16 v33 = v28;
      uint32_t v34 = 32;
    }
    _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);

LABEL_48:
LABEL_49:

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  id v20 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v20;

    if (v10)
    {
      if ([v7 isEqualToString:AMSAccountFlagAutoPlay])
      {
        uint64_t v8 = +[AMSAccountCachedServerData sharedInstance];
        uint64_t v21 = [v10 BOOLValue];
        int v22 = objc_msgSend(a1, "ams_accountID");
        [v8 setAutoPlay:v21 forAccountID:v22];
      }
      else
      {
        if (![v7 isEqualToString:AMSAccountFlagPersonalization])
        {
          uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
          if (!v8)
          {
            uint64_t v8 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v13 = [v8 OSLogObject];
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
          uint64_t v43 = objc_opt_class();
          id v19 = v43;
          __int16 v44 = [a1 hashedDescription];
          *(_DWORD *)buf = 138544130;
          uint64_t v48 = (uint64_t)v43;
          __int16 v49 = 2114;
          uint64_t v50 = v44;
          __int16 v51 = 2114;
          long long v52 = v7;
          __int16 v53 = 2114;
          id v54 = (id)objc_opt_class();
          id v28 = v54;
          _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to set an account flag that should not be set. account = %{public}@ | flag = %{public}@ value.class = %{public}@", buf, 0x2Au);

          goto LABEL_48;
        }
        uint64_t v8 = +[AMSAccountCachedServerData sharedInstance];
        uint64_t v42 = [v10 BOOLValue];
        int v22 = objc_msgSend(a1, "ams_accountID");
        [v8 setPersonalization:v42 forAccountID:v22];
      }

      goto LABEL_51;
    }
  }
  else
  {
  }
  __int16 v35 = +[AMSLogConfig sharedAccountsConfig];
  if (!v35)
  {
    __int16 v35 = +[AMSLogConfig sharedConfig];
  }
  id v36 = [v35 OSLogObject];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    __int16 v37 = objc_opt_class();
    id v38 = v37;
    uint64_t v39 = [a1 hashedDescription];
    *(_DWORD *)buf = 138544130;
    uint64_t v48 = (uint64_t)v37;
    __int16 v49 = 2114;
    uint64_t v50 = v39;
    __int16 v51 = 2114;
    long long v52 = v7;
    __int16 v53 = 2114;
    id v54 = (id)objc_opt_class();
    id v40 = v54;
    _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to set an account flag with a nil value. account = %{public}@ | flag = %{public}@ value.class = %{public}@", buf, 0x2Au);
  }
  id v10 = 0;
LABEL_52:
}

- (void)ams_setActive:()AppleMediaServices forMediaType:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    int v12 = NSStringFromSelector(a2);
    int v16 = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    uint64_t v13 = "%{public}@: [%{public}@] %{public}@ cannot set active on local account.";
LABEL_18:
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v16, 0x20u);

LABEL_19:
    goto LABEL_20;
  }
  if ([v7 isEqualToString:AMSAccountMediaTypeAppStoreBeta])
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    uint64_t v14 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    int v12 = NSStringFromSelector(a2);
    int v16 = 138543874;
    uint64_t v17 = v14;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    uint64_t v13 = "%{public}@: [%{public}@] %{public}@ does not support AMSAccountMediaTypeAppStoreBeta.";
    goto LABEL_18;
  }
  if ([v7 isEqualToString:AMSAccountMediaTypeAppStoreSandbox]
    && !objc_msgSend(a1, "ams_isSandboxAccount"))
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    uint64_t v15 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    int v12 = NSStringFromSelector(a2);
    int v16 = 138543874;
    uint64_t v17 = v15;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    uint64_t v13 = "%{public}@: [%{public}@] %{public}@ does not support AMSAccountMediaTypeAppStoreSandbox for non-sandbox accounts.";
    goto LABEL_18;
  }
  [a1 setActive:a3];
LABEL_20:
}

- (void)ams_setDidAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice:()AppleMediaServices
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [a1 hashedDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v7;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 1024;
    LODWORD(v32) = a3;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Will attempt to set new per device holder record. Setting  to %d", buf, 0x1Cu);
  }
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    id v9 = @"local";
LABEL_8:
    uint64_t v11 = objc_msgSend((id)objc_opt_class(), "_ams_storage");
    uint64_t v12 = [v11 valueForKey:@"bundleHolderAcknowledgedAccounts" error:0];
    uint64_t v13 = (void *)v12;
    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      uint64_t v14 = (void *)v12;
    }
    id v15 = v14;

    int v16 = [MEMORY[0x1E4F1CA80] setWithArray:v15];

    if (a3) {
      [v16 addObject:v9];
    }
    else {
      [v16 removeObject:v9];
    }
    uint64_t v17 = [v16 allObjects];
    id v26 = 0;
    [v11 setValue:v17 forKey:@"bundleHolderAcknowledgedAccounts" error:&v26];
    __int16 v18 = v26;

    if (v18)
    {
      id v19 = +[AMSLogConfig sharedAccountsConfig];
      if (!v19)
      {
        id v19 = +[AMSLogConfig sharedConfig];
      }
      __int16 v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = [a1 hashedDescription];
        uint64_t v23 = AMSLogableError(v18);
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v21;
        __int16 v29 = 2114;
        id v30 = v22;
        __int16 v31 = 2114;
        uint64_t v32 = v23;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot update acknowledgement record due to storage error %{public}@", buf, 0x20u);
      }
    }

    goto LABEL_20;
  }
  uint64_t v10 = objc_msgSend(a1, "ams_DSID");
  id v9 = [v10 stringValue];

  if (v9) {
    goto LABEL_8;
  }
  id v9 = +[AMSLogConfig sharedAccountsConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  __int16 v18 = [(__CFString *)v9 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = objc_opt_class();
    char v25 = [a1 hashedDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v24;
    __int16 v29 = 2114;
    id v30 = v25;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot update acknowledgement record for unidentifiable account", buf, 0x16u);
  }
LABEL_20:
}

- (void)ams_setInUse:()AppleMediaServices
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    if (a3) {
      id v9 = @"in";
    }
    else {
      id v9 = @"not in";
    }
    uint64_t v10 = AMSHashIfNeeded(a1);
    int v18 = 138544130;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    __int16 v24 = 2114;
    char v25 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Marking an account as %@ use for AKAppleIDServiceStore. account = %{public}@", (uint8_t *)&v18, 0x2Au);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  uint64_t v12 = objc_msgSend(a1, "ams_altDSID");

  if (v12)
  {
    uint64_t v13 = objc_msgSend(a1, "ams_altDSID");
    [v11 setAppleIDWithAltDSID:v13 inUse:a3 forService:2];
  }
  else
  {
    uint64_t v14 = objc_msgSend(a1, "ams_DSID");

    if (v14)
    {
      uint64_t v13 = objc_msgSend(a1, "ams_DSID");
      [v11 setAppleIDWithDSID:v13 inUse:a3 forService:2];
    }
    else
    {
      uint64_t v13 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      id v15 = [v13 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = AMSLogKey();
        int v18 = 138543618;
        uint64_t v19 = v16;
        __int16 v20 = 2114;
        uint64_t v21 = v17;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to mark the account as not in use. It has no altDSID or DSID.", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)ams_setStorefront:()AppleMediaServices forMediaType:
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"storefrontID" expectedClass:objc_opt_class()];
}

- (uint64_t)ams_addGlobalCookiesForResult:()AppleMediaServices
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    id v5 = [v4 response];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;

      if (v6)
      {
        uint64_t v7 = objc_msgSend(a1, "ams_addGlobalCookiesForResponse:", v6);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      uint64_t v12 = AMSHashIfNeeded(v4);
      int v14 = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set global cookies. The given AMSURLResult does not contain a NSHTTPURLResponse. uint64_t result = %{public}@", (uint8_t *)&v14, 0x20u);
    }
    id v6 = 0;
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = 0;
LABEL_13:

  return v7;
}

- (uint64_t)ams_removeAllCookies
{
  return objc_msgSend(a1, "ams_removeAllCookiesWithError:", 0);
}

- (uint64_t)ams_removeAllCookiesWithError:()AppleMediaServices
{
  id v5 = objc_msgSend(a1, "ams_cookies");
  uint64_t v6 = [a1 _updateCookiesWithCookiesToAdd:0 cookiesToRemove:v5 error:a3];

  return v6;
}

- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_removeCookiesMatchingProperties:error:", a3, 0);
}

- (id)_accountPropertyForKey:()AppleMediaServices expectedClassContainedInArray:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [a1 _accountPropertyForKey:v6 expectedClass:objc_opt_class()];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v13 = +[AMSLogConfig sharedAccountsConfig];
          if (!v13)
          {
            uint64_t v13 = +[AMSLogConfig sharedConfig];
          }
          int v14 = [v13 OSLogObject];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = objc_opt_class();
            __int16 v16 = AMSLogKey();
            uint64_t v17 = objc_opt_class();
            *(_DWORD *)buf = 138544386;
            uint64_t v25 = v15;
            __int16 v26 = 2114;
            uint64_t v27 = v16;
            __int16 v28 = 2114;
            id v29 = v6;
            __int16 v30 = 2114;
            __int16 v31 = v17;
            __int16 v32 = 2114;
            uint64_t v33 = a4;
            id v18 = v17;
            _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An account property inside an NSArray was stored as the wrong type. key = %{public}@ | actualClass = %{public}@ | expectedClass = %{public}@", buf, 0x34u);
          }
          id v12 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v12 = v7;
LABEL_15:

  return v12;
}

- (uint64_t)_ams_cookieProperties
{
  uint64_t v2 = objc_opt_class();
  return [a1 _accountPropertyForKey:@"cookies" expectedClassContainedInArray:v2];
}

- (uint64_t)_ams_setCookieProperties:()AppleMediaServices
{
  id v4 = a3;
  [a1 _setAccountProperty:v4 forKey:@"cookies" expectedClass:objc_opt_class()];

  return 1;
}

- (BOOL)_ams_migrateCookieProperties:()AppleMediaServices intoCookies:error:
{
  uint64_t v8 = (void *)MEMORY[0x1E4F18D28];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend(v8, "ams_propertiesForCookies:", v9);
  id v12 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_cookiesByMergingProperties:intoProperties:", v10, v11);

  uint64_t v13 = [v12 differenceFromArray:v9 withOptions:0 usingEquivalenceTest:&__block_literal_global_332];

  if ([v13 hasChanges])
  {
    int v14 = objc_msgSend(v13, "ams_insertedObjects");
    uint64_t v15 = objc_msgSend(v13, "ams_removedObjects");
    BOOL v16 = +[AMSCookieStorage updateCookiesWithCookiesToAdd:v14 cookiesToRemove:v15 forAccount:a1 error:a5];
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)_ams_setAccountFlagsShimmed:()AppleMediaServices
{
  id v6 = a3;
  if (_os_feature_enabled_impl() && (objc_msgSend(a1, "ams_isLocalOrSandboxAccount") & 1) == 0)
  {
    id v4 = +[AMSAccountCachedServerData sharedInstance];
    id v5 = objc_msgSend(a1, "ams_accountID");
    [v4 setAccountFlags:v6 forAccountID:v5];
  }
  [a1 _setAccountProperty:v6 forKey:@"accountFlags" dataProtectionClass:1 expectedClass:objc_opt_class()];
}

+ (id)_defaultValueForAccountFlag:()AppleMediaServices
{
  uint64_t v3 = _MergedGlobals_74;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_MergedGlobals_74, &__block_literal_global_338);
  }
  id v5 = [(id)qword_1EB38D538 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)_globalCookieAllowlistWithBag:()AppleMediaServices forURL:
{
  return AMSGlobalCookieAllowlistWithBag(a1, a3, a4);
}

- (uint64_t)_hashedMultiUserIdentifiers:()AppleMediaServices
{
  return 0;
}

+ (uint64_t)_isAccountFlagWritable:()AppleMediaServices
{
  id v3 = a3;
  if (([v3 isEqualToString:AMSAccountFlagAgeVerificationExpiration] & 1) != 0
    || ([v3 isEqualToString:AMSAccountFlagAutoPlay] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [v3 isEqualToString:AMSAccountFlagPersonalization];
  }

  return v4;
}

+ (id)ams_globalEphemeralAccountProperties
{
  if (qword_1EB38D550 != -1) {
    dispatch_once(&qword_1EB38D550, &__block_literal_global_361);
  }
  id v0 = (void *)qword_1EB38D558;
  return v0;
}

+ (id)ams_globalEphemeralAccountPropertiesForAccount:()AppleMediaServices
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__2;
  BOOL v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v5 = objc_msgSend(a1, "ams_globalEphemeralAccountProperties");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__ACAccount_AppleMediaServices__ams_globalEphemeralAccountPropertiesForAccount___block_invoke;
  v9[3] = &unk_1E559E440;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 readWrite:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_setEphemeralAccountProperty:()AppleMediaServices forKey:dataProtectionClass:expectedClass:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = AMSLogKey();
    uint64_t v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v11)
    {
      uint64_t v4 = AMSLogKey();
      [v12 stringWithFormat:@"%@: [%@] ", v14, v4];
    }
    else
    {
      [v12 stringWithFormat:@"%@: ", v13];
    uint64_t v15 = };
    BOOL v16 = AMSHashIfNeeded(v8);
    id v17 = AMSHashIfNeeded(v7);
    *(_DWORD *)buf = 138543874;
    long long v20 = v15;
    __int16 v21 = 2114;
    long long v22 = v16;
    __int16 v23 = 2114;
    __int16 v24 = v17;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ Adding ephemeral account property. Key: %{public}@, Value: %{public}@", buf, 0x20u);
    if (v11)
    {

      uint64_t v15 = (void *)v4;
    }
  }
  id v18 = objc_msgSend(MEMORY[0x1E4F179B0], "ams_globalEphemeralAccountPropertiesForAccount:", a1);
  [v18 setObject:v7 forKeyedSubscript:v8];
}

- (id)_ephemeralAccountPropertyForKey:()AppleMediaServices dataProtectionClass:expectedClasses:error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = AMSLogKey();
    id v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v3 = AMSLogKey();
      [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    uint64_t v12 = };
    uint64_t v13 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543618;
    id v18 = v12;
    __int16 v19 = 2114;
    long long v20 = v13;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ Reading ephemeral account property. Key: %{public}@", buf, 0x16u);
    if (v8)
    {

      uint64_t v12 = (void *)v3;
    }
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F179B0], "ams_globalEphemeralAccountPropertiesForAccount:", a1);
  uint64_t v15 = [v14 objectForKeyedSubscript:v5];

  return v15;
}

- (uint64_t)ams_bundleOwner
{
  id v1 = objc_msgSend(a1, "ams_isBundleOwner");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)ams_homeID
{
  id v1 = objc_msgSend(a1, "ams_homeIdentifier");
  uint64_t v2 = [v1 UUIDString];

  return v2;
}

- (id)ams_homeIdentifier
{
  if (+[AMSDevice deviceIsAudioAccessory])
  {
    uint64_t v2 = [a1 _accountPropertyForKey:@"homeIdentifier" expectedClass:objc_opt_class()];
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)ams_homeUserID
{
  id v1 = objc_msgSend(a1, "ams_homeUserIdentifiers");
  uint64_t v2 = [v1 firstObject];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (uint64_t)ams_homeUserIdentifiers
{
  return MEMORY[0x1E4F1CBF0];
}

- (id)ams_secureToken
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v3 = objc_msgSend(v2, "ams_secureTokenForAccount:", a1);

  return v3;
}

- (uint64_t)ams_postAccountFlagsWithBagContract:()AppleMediaServices
{
  return 0;
}

- (void)ams_setHomeID:()AppleMediaServices
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithUUIDString:v5];

  objc_msgSend(a1, "ams_setHomeIdentifier:", v6);
}

- (void)ams_setHomeIdentifier:()AppleMediaServices
{
  id v5 = a3;
  if (+[AMSDevice deviceIsAudioAccessory])
  {
    uint64_t v4 = [v5 UUIDString];
    [a1 _setAccountProperty:v4 forKey:@"homeIdentifier" expectedClass:objc_opt_class()];
  }
}

- (uint64_t)ams_setHomeUserID:()AppleMediaServices
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:&stru_1EDCA7308]) {
      goto LABEL_6;
    }
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    objc_msgSend(a1, "ams_addHomeUserIdentifier:", v5);
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:0];
    objc_msgSend(a1, "ams_removeHomeUserIdentifier:", v5);
  }

LABEL_6:
  return MEMORY[0x1F41817F8]();
}

- (uint64_t)ams_isPrivateListeningEnabled
{
  return 0;
}

- (uint64_t)ams_isPrivateListeningEnabledForHomeUserIdentifier:()AppleMediaServices
{
  return 0;
}

- (void)ams_setValue:()AppleMediaServices forAccountFlag:
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithBool:a3];
  objc_msgSend(a1, "ams_setAccountFlagValue:forAccountFlag:", v8, v7);
}

- (uint64_t)ams_valueForAccountFlag:()AppleMediaServices
{
  id v1 = objc_msgSend(a1, "ams_accountFlagValueForAccountFlag:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  uint64_t v3 = [v2 BOOLValue];
  return v3;
}

- (uint64_t)ams_addCookies:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_addCookies:error:", a3, 0);
}

- (uint64_t)ams_addCookies:()AppleMediaServices error:
{
  return [a1 _updateCookiesWithCookiesToAdd:a3 cookiesToRemove:0 error:a4];
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices error:
{
  id v6 = objc_msgSend(MEMORY[0x1E4F179B0], "_getSetCookiesForResponse:");
  id v7 = objc_msgSend(a1, "ams_asynchronouslyAddCookies:", v6);
  uint64_t v8 = [v7 resultWithError:a4];

  return v8;
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices
{
  id v1 = objc_msgSend(a1, "ams_asynchronouslyAddCookiesForResponse:");
  uint64_t v2 = [v1 resultWithError:0];

  return v2;
}

- (uint64_t)ams_addGlobalCookiesForResponse:()AppleMediaServices
{
  id v1 = objc_msgSend(a1, "ams_asynchronouslyAddGlobalCookiesForResponse:");
  uint64_t v2 = [v1 resultWithError:0];

  return v2;
}

- (uint64_t)ams_addCookiesForResult:()AppleMediaServices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      uint64_t v7 = objc_msgSend(a1, "ams_addCookiesForResponse:", v6);
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    uint64_t v12 = AMSHashIfNeeded(a1);
    uint64_t v13 = AMSHashIfNeeded(v4);
    int v15 = 138544130;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    id v18 = v11;
    __int16 v19 = 2114;
    long long v20 = v12;
    __int16 v21 = 2114;
    long long v22 = v13;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set cookies on an account. The given AMSURLResult does not contain a NSHTTPURLResponse. account = %{public}@ | uint64_t result = %{public}@", (uint8_t *)&v15, 0x2Au);
  }
  id v6 = 0;
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

@end