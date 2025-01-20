@interface ACAccount
@end

@implementation ACAccount

id __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v25 = v5;
      v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      if (v9)
      {
        v12 = AMSLogKey();
        uint64_t v24 = NSStringFromSelector(*(SEL *)(a1 + 56));
        [v10 stringWithFormat:@"%@: [%@] %@ ", v11, v12, v24];
      }
      else
      {
        v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
        [v10 stringWithFormat:@"%@: %@ ", v11, v12];
      v13 = };
      v19 = [v6 description];
      v20 = [*(id *)(a1 + 40) name];
      v21 = [*(id *)(a1 + 40) value];
      *(_DWORD *)buf = 138544130;
      v29 = v13;
      __int16 v30 = 2114;
      v31 = v19;
      __int16 v32 = 2114;
      v33 = v20;
      __int16 v34 = 2114;
      v35 = v21;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to get globalCookieAllowlist key with error=%{public}@, skip allowlist feature and add cookie(name=%{public}@, value=%{public}@)", buf, 0x2Au);

      if (v9)
      {

        v13 = (void *)v24;
      }

      id v5 = v25;
    }

    id v16 = +[AMSOptional optionalWithValue:*(void *)(a1 + 40)];
    v18 = +[AMSPromise promiseWithResult:v16];
  }
  else
  {
    v14 = [*(id *)(a1 + 40) name];
    v15 = [v5 objectForKeyedSubscript:v14];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;

      if (v16)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_287;
        v26[3] = &unk_1E559E338;
        v26[4] = *(void *)(a1 + 32);
        id v27 = *(id *)(a1 + 48);
        if (objc_msgSend(v16, "ams_anyWithTest:", v26)) {
          +[AMSOptional optionalWithValue:*(void *)(a1 + 40)];
        }
        else {
        v23 = +[AMSOptional optionalWithNil];
        }
        v18 = +[AMSPromise promiseWithResult:v23];

        goto LABEL_18;
      }
    }
    else
    {
    }
    v17 = +[AMSOptional optionalWithValue:*(void *)(a1 + 40)];
    v18 = +[AMSPromise promiseWithResult:v17];

    id v16 = 0;
  }
LABEL_18:

  return v18;
}

id __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(v3, "ams_isExpired") & 1) != 0
    || (objc_msgSend(v3, "ams_matchesURL:", *(void *)(a1 + 32)) & 1) == 0)
  {
    uint64_t v10 = +[AMSOptional optionalWithNil];
  }
  else
  {
    if (*(unsigned char *)(a1 + 64))
    {
      v4 = [v3 domain];
      int v5 = [v4 isEqualToString:@".apple.com"];

      if (v5)
      {
        uint64_t v6 = objc_opt_class();
        v7 = AMSGlobalCookieAllowlistWithBag(v6, *(void **)(a1 + 48), *(void **)(a1 + 32));
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_2;
        v12[3] = &unk_1E559E360;
        uint64_t v8 = *(void *)(a1 + 56);
        v12[4] = *(void *)(a1 + 40);
        uint64_t v15 = v8;
        id v13 = v3;
        id v14 = *(id *)(a1 + 32);
        v9 = [v7 continueWithBlock:v12];

        goto LABEL_8;
      }
    }
    uint64_t v10 = +[AMSOptional optionalWithValue:v3];
  }
  v7 = (void *)v10;
  v9 = +[AMSPromise promiseWithResult:v10];
LABEL_8:

  return v9;
}

uint64_t __44__ACAccount_AppleMediaServices__ams_cookies__block_invoke_200(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "ams_isDeleted")) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = objc_msgSend(v2, "ams_isExpired") ^ 1;
  }

  return v3;
}

uint64_t __44__ACAccount_AppleMediaServices__ams_cookies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [a2 name];
  int v5 = [v4 isEqualToString:0x1EDCAAF88];

  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = AMSLogKey();
      v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        uint64_t v2 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      v12 = };
      id v13 = AMSHashIfNeeded(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543618;
      id v16 = v12;
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Found ITFE user cookie which will be ignored. ITFE enablement should not be configured using account cookies. account = %{public}@", buf, 0x16u);
      if (v8)
      {

        v12 = (void *)v2;
      }
    }
  }
  return v5 ^ 1u;
}

uint64_t __60__ACAccount_AppleMediaServices___cookiesMatchingProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 properties];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, (void)v15);
        uint64_t v11 = [v3 objectForKeyedSubscript:v9];
        int v12 = [v10 isEqual:v11];

        if (!v12)
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

uint64_t __98__ACAccount_AppleMediaServices___accountPropertyForKey_dataProtectionClass_expectedClasses_error___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __70__ACAccount_AppleMediaServices___ams_getAccountFlagsShimmedWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking account data cache due to old API access.", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = +[AMSAccountCachedServerData sharedInstance];
  uint64_t v8 = [v2 token];

  id v9 = (id)[v7 cancelUpdatesForToken:v8];
}

void __73__ACAccount_AppleMediaServices___isAccountFlagValue_validForAccountFlag___block_invoke()
{
  v4[15] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = AMSAccountFlagAgeVerificationExpiration;
  v4[1] = AMSAccountFlagAutoPlay;
  v4[2] = AMSAccountFlagCanUseAppClips;
  v4[3] = AMSAccountFlagHasAgreedToAppClipTerms;
  v4[4] = AMSAccountFlagHasAgreedToTerms;
  v4[5] = AMSAccountFlagHasFamilySharingEnabled;
  v4[6] = AMSAccountFlagHasiCloudFamily;
  v4[7] = AMSAccountFlagIsRestrictedAccount;
  v4[8] = AMSAccountFlagIsDisabledAccount;
  v4[9] = AMSAccountFlagIsManagedAccount;
  v4[10] = AMSAccountFlagIsInRestrictedRegion;
  v4[11] = AMSAccountFlagIsInBadCredit;
  v4[12] = AMSAccountFlagPersonalization;
  v4[13] = AMSAccountFlagRetailDemo;
  v4[14] = AMSAccountFlagUnderThirteen;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:15];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_1EB38D548;
  qword_1EB38D548 = v2;
}

uint64_t __93__ACAccount_AppleMediaServices__ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

id __77__ACAccount_AppleMediaServices__ams_isInRestrictedRegionWithBag_waitForSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      AMSHashIfNeeded(*(void **)(a1 + 32));
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      __int16 v12 = AMSLogableError(v6);
      int v23 = 138544130;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      v28 = v11;
      __int16 v29 = 2114;
      __int16 v30 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSSyncRestrictedRegionTask has failed. account = %{public}@ | error = %{public}@", (uint8_t *)&v23, 0x2Au);
    }
    uint64_t v13 = +[AMSPromise promiseWithResult:*(void *)(a1 + 48)];
  }
  else
  {
    id v14 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    long long v16 = +[AMSLogConfig sharedAccountsConfig];
    if (!v16)
    {
      long long v16 = +[AMSLogConfig sharedConfig];
    }
    long long v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = *(void *)(a1 + 40);
      int v20 = [v15 BOOLValue];
      v21 = @"NO";
      int v23 = 138543874;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      if (v20) {
        v21 = @"YES";
      }
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: AMSSyncRestrictedRegionTask has finished, IsInRestrictedRegion = %{public}@", (uint8_t *)&v23, 0x20u);
    }

    uint64_t v13 = +[AMSPromise promiseWithResult:v15];
  }
  return v13;
}

void __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v5 = +[AMSLogConfig sharedPrivacyConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = AMSLogKey();
      uint64_t v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        a1 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, a1];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      __int16 v12 = };
      uint64_t v19 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v19);
      v21 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      __int16 v30 = v21;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected value in local privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v8)
      {

        __int16 v12 = (void *)a1;
      }
    }
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = +[AMSLogConfig sharedPrivacyConfig];
    [v6 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v13 userInfo:0];
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v6 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v14 = AMSLogKey();
      id v15 = NSString;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = v16;
      if (v14)
      {
        a1 = AMSLogKey();
        [v15 stringWithFormat:@"%@: [%@] ", v17, a1];
      }
      else
      {
        [v15 stringWithFormat:@"%@: ", v16];
      uint64_t v18 = };
      v22 = (objc_class *)objc_opt_class();
      int v23 = NSStringFromClass(v22);
      uint64_t v24 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      v28 = v23;
      __int16 v29 = 2114;
      __int16 v30 = v24;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_FAULT, "%{public}@Unexpected value in local privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v14)
      {

        uint64_t v18 = (void *)a1;
      }
    }
  }
}

void __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke_267(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v5 = +[AMSLogConfig sharedPrivacyConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = AMSLogKey();
      uint64_t v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        a1 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, a1];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      __int16 v12 = };
      uint64_t v19 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v19);
      v21 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      __int16 v30 = v21;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected value in remote privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v8)
      {

        __int16 v12 = (void *)a1;
      }
    }
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = +[AMSLogConfig sharedPrivacyConfig];
    [v6 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v13 userInfo:0];
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v6 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v14 = AMSLogKey();
      id v15 = NSString;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = v16;
      if (v14)
      {
        a1 = AMSLogKey();
        [v15 stringWithFormat:@"%@: [%@] ", v17, a1];
      }
      else
      {
        [v15 stringWithFormat:@"%@: ", v16];
      uint64_t v18 = };
      v22 = (objc_class *)objc_opt_class();
      int v23 = NSStringFromClass(v22);
      uint64_t v24 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      v28 = v23;
      __int16 v29 = 2114;
      __int16 v30 = v24;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_FAULT, "%{public}@Unexpected value in remote privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v14)
      {

        uint64_t v18 = (void *)a1;
      }
    }
  }
}

uint64_t __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_287(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) host];
      id v6 = v5;
      if (v5 && ([v5 hasPrefix:@"."] & 1) == 0)
      {
        uint64_t v7 = [@"." stringByAppendingString:v6];

        id v6 = (void *)v7;
      }
      uint64_t v8 = [v6 hasSuffix:v4];

      goto LABEL_30;
    }
  }
  else
  {
  }
  BOOL v9 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v10 = +[AMSLogConfig sharedAccountsCookiesConfig];
  uint64_t v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    __int16 v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = AMSLogKey();
      id v14 = NSString;
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = v15;
      if (v13)
      {
        a1 = AMSLogKey();
        [v14 stringWithFormat:@"%@: [%@] ", v16, a1];
      }
      else
      {
        [v14 stringWithFormat:@"%@: ", v15];
      uint64_t v17 = };
      uint64_t v24 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v17;
      __int16 v30 = 2114;
      uint64_t v31 = v24;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected value in global cookie allowlist: %{public}@", buf, 0x16u);
      if (v13)
      {

        uint64_t v17 = (void *)a1;
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v25 = +[AMSLogConfig sharedAccountsCookiesConfig];
    [v11 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v25 userInfo:0];
  }
  else
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v11 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      uint64_t v19 = AMSLogKey();
      int v20 = NSString;
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = v21;
      if (v19)
      {
        a1 = AMSLogKey();
        [v20 stringWithFormat:@"%@: [%@] ", v22, a1];
      }
      else
      {
        [v20 stringWithFormat:@"%@: ", v21];
      int v23 = };
      uint64_t v26 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v23;
      __int16 v30 = 2114;
      uint64_t v31 = v26;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_FAULT, "%{public}@Unexpected value in global cookie allowlist: %{public}@", buf, 0x16u);
      if (v19)
      {

        int v23 = (void *)a1;
      }
    }
  }

  id v4 = 0;
  uint64_t v8 = 0;
LABEL_30:

  return v8;
}

uint64_t __80__ACAccount_AppleMediaServices___ams_migrateCookieProperties_intoCookies_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isEqualToCookie:");
}

void __61__ACAccount_AppleMediaServices___defaultValueForAccountFlag___block_invoke()
{
  v3[14] = *MEMORY[0x1E4F143B8];
  v2[0] = AMSAccountFlagAutoPlay;
  v2[1] = AMSAccountFlagCanUseAppClips;
  v3[0] = MEMORY[0x1E4F1CC38];
  v3[1] = MEMORY[0x1E4F1CC38];
  v2[2] = AMSAccountFlagHasAgreedToAppClipTerms;
  v2[3] = AMSAccountFlagHasAgreedToTerms;
  v3[2] = MEMORY[0x1E4F1CC38];
  v3[3] = MEMORY[0x1E4F1CC38];
  v2[4] = AMSAccountFlagHasFamilySharingEnabled;
  v2[5] = AMSAccountFlagHasiCloudFamily;
  v3[4] = MEMORY[0x1E4F1CC28];
  v3[5] = MEMORY[0x1E4F1CC28];
  v2[6] = AMSAccountFlagIsRestrictedAccount;
  v2[7] = AMSAccountFlagIsDisabledAccount;
  v3[6] = MEMORY[0x1E4F1CC28];
  v3[7] = MEMORY[0x1E4F1CC28];
  v2[8] = AMSAccountFlagIsManagedAccount;
  v2[9] = AMSAccountFlagIsInRestrictedRegion;
  v3[8] = MEMORY[0x1E4F1CC28];
  v3[9] = MEMORY[0x1E4F1CC28];
  v2[10] = AMSAccountFlagIsInBadCredit;
  v2[11] = AMSAccountFlagPersonalization;
  v3[10] = MEMORY[0x1E4F1CC28];
  v3[11] = MEMORY[0x1E4F1CC38];
  v2[12] = AMSAccountFlagRetailDemo;
  v2[13] = AMSAccountFlagUnderThirteen;
  v3[12] = MEMORY[0x1E4F1CC28];
  v3[13] = MEMORY[0x1E4F1CC28];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:14];
  v1 = (void *)qword_1EB38D538;
  qword_1EB38D538 = v0;
}

uint64_t __69__ACAccount_AppleMediaServices__ams_globalEphemeralAccountProperties__block_invoke()
{
  qword_1EB38D558 = objc_alloc_init(AMSThreadSafeDictionary);
  return MEMORY[0x1F41817F8]();
}

void __80__ACAccount_AppleMediaServices__ams_globalEphemeralAccountPropertiesForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = [v13 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    __int16 v12 = [v10 identifier];
    [v13 setObject:v11 forKeyedSubscript:v12];
  }
}

@end