@interface AMSBagNetworkTask
+ (BOOL)_shouldReloadDataForOriginalCookies:(id)a3 newCookies:(id)a4;
+ (id)_URLCookieNamesForProfile:(id)a3;
+ (id)_bagDataByApplyingOverridesToBagData:(id)a3;
+ (id)_bagDataByApplyingOverridesToBagData:(id)a3 overrides:(id)a4 ignoredKeys:(id)a5 inserts:(id)a6;
+ (id)_cookiesForNames:(id)a3 clientInfo:(id)a4 account:(id)a5;
+ (id)_createURLSessionPromise;
+ (id)_defaultURLCookieNames;
+ (id)_queryItemsForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 cookieNames:(id)a6 account:(id)a7 storefront:(id)a8;
+ (id)_queryItemsForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 cookieNames:(id)a6 accountProvider:(id)a7;
+ (id)_requestIdentifierForQueryItems:(id)a3;
+ (id)_requestIdentifierForQueryItems:(id)a3 prefix:(id)a4;
+ (id)_setStorefrontFromURLResponse:(id)a3 bagData:(id)a4;
+ (id)_urlSessionPromise;
+ (id)requestPartialIdentifierForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5;
+ (void)_setURLCookieNames:(id)a3 forProfile:(id)a4;
- (AMSBagAccountProvider)accountProvider;
- (AMSBagNetworkTask)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 accountProvider:(id)a6;
- (AMSProcessInfo)clientInfo;
- (BOOL)_shouldRetryForResult:(id)a3 cookieNames:(id)a4 urlCookies:(id)a5 responseStorefront:(id)a6;
- (NSString)logKey;
- (NSString)profile;
- (NSString)profileVersion;
- (id)_createRequestWithQueryItems:(id)a3;
- (id)_performFetchWithAttemptedCount:(unint64_t)a3 account:(id)a4 storefront:(id)a5;
- (id)activity;
- (id)performFetch;
- (void)_updateStorefrontSuffixIfNecessaryWithBagData:(id)a3;
- (void)setActivity:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
@end

@implementation AMSBagNetworkTask

id __60__AMSBagNetworkTask__requestIdentifierForQueryItems_prefix___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 value];

  v4 = NSString;
  uint64_t v5 = [v2 name];
  v6 = (void *)v5;
  if (v3)
  {
    v7 = [v2 value];
    v8 = [v4 stringWithFormat:@"%@=%@", v6, v7];
  }
  else
  {
    v8 = [v4 stringWithFormat:@"%@", v5];
  }

  return v8;
}

id __33__AMSBagNetworkTask_performFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__AMSBagNetworkTask_performFetch__block_invoke_3;
  v8[3] = &unk_1E559F988;
  v4 = *(void **)(a1 + 32);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v3;
  id v5 = v3;
  v6 = [v4 continueWithBlock:v8];

  return v6;
}

uint64_t __57__AMSBagNetworkTask__cookiesForNames_clientInfo_account___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "ams_isCookieValidForBag"))
  {
    v4 = [v3 name];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_queryItemsForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 cookieNames:(id)a6 accountProvider:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v16 accountMediaType];
  v18 = [v12 bagAccountForAccountMediaType:v17];
  v19 = [v16 accountMediaType];
  v20 = [v12 bagStorefrontForAccountMediaType:v19];

  v21 = [a1 _queryItemsForClientInfo:v16 profile:v15 profileVersion:v14 cookieNames:v13 account:v18 storefront:v20];

  return v21;
}

+ (id)_bagDataByApplyingOverridesToBagData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AMSDefaults bagOverrides];
  v6 = +[AMSDefaults bagOverrideIgnoredKeys];
  v7 = +[AMSDefaults bagOverrideInserts];
  v8 = [a1 _bagDataByApplyingOverridesToBagData:v4 overrides:v5 ignoredKeys:v6 inserts:v7];

  return v8;
}

+ (id)_queryItemsForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 cookieNames:(id)a6 account:(id)a7 storefront:(id)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v41 = a6;
  id v40 = a7;
  id v15 = a8;
  id v39 = a5;
  id v16 = a4;
  v17 = +[AMSDefaults storefrontSuffixes];
  v18 = [v14 bundleIdentifier];
  uint64_t v19 = [v17 objectForKeyedSubscript:v18];

  if (v15)
  {
    id v38 = a1;
    id v42 = 0;
    v20 = +[AMSStorefrontHeaderValueCreation combinedStorefrontFromStorefront:v15 suffix:v19 error:&v42];
    id v21 = v42;
    if (v21)
    {
      v22 = +[AMSLogConfig sharedBagConfig];
      if (!v22)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = AMSLogKey();
        v36 = NSString;
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = v25;
        v37 = (void *)v24;
        if (v24)
        {
          uint64_t v35 = AMSLogKey();
          [v36 stringWithFormat:@"%@: [%@] ", v26, v35];
        }
        else
        {
          [v36 stringWithFormat:@"%@: ", v25];
        v27 = };
        uint64_t v29 = AMSLogableError(v21);
        *(_DWORD *)buf = 138543618;
        v44 = v27;
        __int16 v45 = 2114;
        v30 = (void *)v29;
        uint64_t v46 = v29;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@An empty storefront was provided. Either a valid, non-empty storefront should be provided or nil should be passed instead. Defaulting to the nil-storefront case. error = %{public}@", buf, 0x16u);
        if (v37)
        {

          v27 = (void *)v35;
        }
      }
    }
    v28 = (void *)v19;

    a1 = v38;
  }
  else
  {
    v28 = (void *)v19;
    v20 = 0;
  }
  v31 = [a1 _cookiesForNames:v41 clientInfo:v14 account:v40];
  v32 = [[AMSBagURLQueryItemsBuilder alloc] initWithClientInfo:v14 profile:v16 profileVersion:v39];

  v33 = [(AMSBagURLQueryItemsBuilder *)v32 queryItemsWithCookies:v31 storefront:v20];

  return v33;
}

+ (id)_cookiesForNames:(id)a3 clientInfo:(id)a4 account:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  if (v7)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v14 = objc_msgSend(v7, "ams_cookies");
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __57__AMSBagNetworkTask__cookiesForNames_clientInfo_account___block_invoke;
          v18[3] = &unk_1E559E270;
          v18[4] = v13;
          id v15 = objc_msgSend(v14, "ams_firstObjectPassingTest:", v18);

          if (v15) {
            [v17 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

+ (id)_bagDataByApplyingOverridesToBagData:(id)a3 overrides:(id)a4 ignoredKeys:(id)a5 inserts:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count] || objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
  {
    id v14 = +[AMSLogConfig sharedBagConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v55 = (uint64_t)a1;
      __int16 v56 = 2114;
      v57 = v16;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Applying bag overrides", buf, 0x16u);
    }
    id v17 = (id)[v10 mutableCopy];
    if ([v11 count])
    {
      v18 = +[AMSLogConfig sharedBagConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      long long v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = v10;
        uint64_t v21 = objc_opt_class();
        AMSLogKey();
        id v43 = v12;
        v23 = id v22 = v13;
        uint64_t v24 = [v11 allKeys];
        *(_DWORD *)buf = 138543874;
        uint64_t v55 = v21;
        id v10 = v20;
        __int16 v56 = 2114;
        v57 = v23;
        __int16 v58 = 2114;
        id v59 = v24;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding the following keys: %{public}@", buf, 0x20u);

        id v13 = v22;
        id v12 = v43;
      }

      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke;
      v51[3] = &unk_1E559F9D8;
      id v52 = v17;
      [v11 enumerateKeysAndObjectsUsingBlock:v51];
    }
    if ([v13 count])
    {
      uint64_t v25 = +[AMSLogConfig sharedBagConfig];
      if (!v25)
      {
        uint64_t v25 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_opt_class();
        AMSLogKey();
        v28 = id v44 = v10;
        [v13 allKeys];
        id v29 = v11;
        id v30 = v12;
        v32 = id v31 = v13;
        *(_DWORD *)buf = 138543874;
        uint64_t v55 = v27;
        __int16 v56 = 2114;
        v57 = v28;
        __int16 v58 = 2114;
        id v59 = v32;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Inserting to the following keys: %{public}@", buf, 0x20u);

        id v13 = v31;
        id v12 = v30;
        id v11 = v29;

        id v10 = v44;
      }

      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke_99;
      v49[3] = &unk_1E559FA00;
      id v50 = v17;
      [v13 enumerateKeysAndObjectsUsingBlock:v49];
    }
    if ([v12 count])
    {
      v33 = +[AMSLogConfig sharedBagConfig];
      if (!v33)
      {
        v33 = +[AMSLogConfig sharedConfig];
      }
      v34 = [v33 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = objc_opt_class();
        v36 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v55 = v35;
        __int16 v56 = 2114;
        v57 = v36;
        __int16 v58 = 2114;
        id v59 = v12;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing the following keys: %{public}@", buf, 0x20u);
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v37 = v12;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v46 != v40) {
              objc_enumerationMutation(v37);
            }
            objc_msgSend(v17, "ams_deleteValueForKeyPath:", *(void *)(*((void *)&v45 + 1) + 8 * i));
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v39);
      }
    }
  }
  else
  {
    id v17 = v10;
  }

  return v17;
}

+ (id)requestPartialIdentifierForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  id v6 = +[AMSBagNetworkTask _queryItemsForClientInfo:a3 profile:a4 profileVersion:a5 cookieNames:MEMORY[0x1E4F1CBF0] accountProvider:0];
  id v7 = [a1 _requestIdentifierForQueryItems:v6 prefix:@"com.apple.AppleMediaServices.AMSBagNetworkTask.partial-identifier"];

  return v7;
}

+ (id)_requestIdentifierForQueryItems:(id)a3 prefix:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_137);
  id v7 = NSString;
  id v8 = objc_msgSend(v6, "ams_nonEmptyComponentsJoinedByString:", @",");
  uint64_t v9 = [v7 stringWithFormat:@"%@_%@", v5, v8];

  return v9;
}

uint64_t __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_setValue:forKeyPath:", a3, a2);
}

uint64_t __33__AMSBagNetworkTask_performFetch__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performFetchWithAttemptedCount:0 account:*(void *)(a1 + 40) storefront:a2];
}

void __43__AMSBagNetworkTask__defaultURLCookieNames__block_invoke()
{
  v0 = (void *)qword_1EB38D3A0;
  qword_1EB38D3A0 = (uint64_t)&unk_1EDD01930;
}

- (id)performFetch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (+[AMSUnitTests isRunningUnitTests])
  {
    BOOL v3 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v4 = +[AMSLogConfig sharedBagConfig];
    id v5 = (void *)v4;
    if (v3)
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = objc_opt_class();
        id v8 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v7;
        __int16 v18 = 2114;
        long long v19 = v8;
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Running unit tests. We won't go to the network to fetch bags. Unit tests should use mocked bags.", buf, 0x16u);
      }
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v9 = +[AMSLogConfig sharedBagConfig];
      [v5 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v9 userInfo:0];
    }
    else
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v9 = [v5 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        uint64_t v11 = objc_opt_class();
        id v12 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v11;
        __int16 v18 = 2114;
        long long v19 = v12;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Running unit tests. We won't go to the network to fetch bags. Unit tests should use mocked bags.", buf, 0x16u);
      }
    }

    id v13 = AMSError(203, @"Bag Load Failed", @"Running unit test", 0);
    id v10 = +[AMSPromise promiseWithError:v13];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __33__AMSBagNetworkTask_performFetch__block_invoke;
    v15[3] = &unk_1E559EA38;
    v15[4] = self;
    id v10 = [(AMSTask *)self performTaskWithPromiseBlock:v15];
  }
  return v10;
}

- (AMSBagNetworkTask)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 accountProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSBagNetworkTask;
  id v15 = [(AMSTask *)&v22 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountProvider, a6);
    objc_storeStrong((id *)&v16->_clientInfo, a3);
    objc_storeStrong((id *)&v16->_profile, a4);
    objc_storeStrong((id *)&v16->_profileVersion, a5);
    uint64_t v17 = AMSSetLogKeyIfNeeded();
    logKey = v16->_logKey;
    v16->_logKey = (NSString *)v17;

    long long v19 = [[AMSMetricsActivity alloc] initWithLabel:1];
    activity = v16->_activity;
    v16->_activity = v19;
  }
  return v16;
}

id __45__AMSBagNetworkTask__createURLSessionPromise__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTimeoutIntervalForResource:30.0];
  BOOL v3 = [[AMSURLSession alloc] initWithConfiguration:v2 delegate:0 delegateQueue:0];

  uint64_t v4 = +[AMSPromise promiseWithResult:v3];

  return v4;
}

void __45__AMSBagNetworkTask__createURLSessionPromise__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F18DD0];
  id v3 = a2;
  uint64_t v4 = +[AMSProcessInfo currentProcess];
  id v5 = objc_msgSend(v2, "ams_configurationWithClientInfo:bag:", v4, 0);
  id v6 = [v5 thenWithBlock:&__block_literal_global_109];

  [v3 finishWithPromise:v6];
}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  id v5 = v4;

  if (!v5)
  {
LABEL_9:
    id v15 = AMSError(203, @"Bag Load Failed", @"Network response object was not a dictionary.", 0);
    id v13 = +[AMSPromise promiseWithError:v15];

    goto LABEL_23;
  }
  id v6 = [v5 objectForKeyedSubscript:@"urlCookies"];
  uint64_t v7 = [*(id *)(a1 + 32) profile];
  +[AMSBagNetworkTask _setURLCookieNames:v6 forProfile:v7];

  [*(id *)(a1 + 32) _updateStorefrontSuffixIfNecessaryWithBagData:v5];
  id v8 = [v3 response];
  uint64_t v9 = +[AMSBagNetworkTask _setStorefrontFromURLResponse:v8 bagData:v5];

  id v10 = +[AMSBagURLQueryItemsBuilder storefrontFromQueryItems:*(void *)(a1 + 40)];
  id v11 = v10;
  if (v9)
  {
    id v11 = v9;
  }
  id v44 = v11;
  if ([*(id *)(a1 + 32) _shouldRetryForResult:v3 cookieNames:*(void *)(a1 + 48) urlCookies:v6 responseStorefront:v9])
  {
    if (*(void *)(a1 + 64) == 3)
    {
      id v12 = AMSError(203, @"Bag Load Failed", @"Maximum number of attempts exceeded.", 0);
      id v13 = +[AMSPromise promiseWithError:v12];

      id v14 = v44;
    }
    else
    {
      v34 = +[AMSLogConfig sharedBagConfig];
      if (!v34)
      {
        v34 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = objc_opt_class();
        id v43 = AMSLogKey();
        v36 = AMSHashIfNeeded(v10);
        AMSHashIfNeeded(v44);
        *(_DWORD *)buf = 138544130;
        uint64_t v46 = v41;
        __int16 v47 = 2114;
        long long v48 = v43;
        __int16 v49 = 2114;
        id v50 = v36;
        uint64_t v52 = v51 = 2114;
        id v37 = (void *)v52;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrying bag load. originalStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x2Au);
      }
      id v14 = v44;
      id v13 = [*(id *)(a1 + 32) _performFetchWithAttemptedCount:*(void *)(a1 + 64) + 1 account:*(void *)(a1 + 56) storefront:v44];
    }
  }
  else
  {
    uint64_t v40 = [(id)objc_opt_class() _bagDataByApplyingOverridesToBagData:v5];

    id v16 = [v3 response];
    objc_msgSend(v16, "ams_expirationInterval");
    double v18 = v17;

    double Current = CFAbsoluteTimeGetCurrent();
    double v20 = 60.0;
    if (v18 >= 60.0) {
      double v20 = v18;
    }
    uint64_t v39 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:Current + v20];
    uint64_t v21 = +[AMSLogConfig sharedBagConfig];
    if (!v21)
    {
      uint64_t v21 = +[AMSLogConfig sharedConfig];
    }
    id v42 = v6;
    objc_super v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v23;
      __int16 v47 = 2114;
      long long v48 = v24;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully loaded the bag data.", buf, 0x16u);
    }
    uint64_t v25 = [(id)objc_opt_class() _requestIdentifierForQueryItems:*(void *)(a1 + 40)];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = [*(id *)(a1 + 32) clientInfo];
    v28 = [*(id *)(a1 + 32) profile];
    id v29 = [*(id *)(a1 + 32) profileVersion];
    id v30 = [v26 requestPartialIdentifierForClientInfo:v27 profile:v28 profileVersion:v29];

    id v31 = [AMSBagNetworkTaskResult alloc];
    v32 = [*(id *)(a1 + 56) identifier];
    id v5 = (id)v40;
    id v14 = v44;
    v33 = [(AMSBagNetworkTaskResult *)v31 initWithData:v40 expirationDate:v39 loadedBagIdentifier:v25 loadedBagPartialIdentifier:v30 storefront:v44 accountIdentifier:v32];

    id v13 = +[AMSPromise promiseWithResult:v33];

    id v6 = v42;
  }

LABEL_23:
  return v13;
}

id __50__AMSBagNetworkTask__createRequestWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[AMSBagURLQueryItemsBuilder storefrontFromQueryItems:*(void *)(a1 + 32)];
  if (v4) {
    [v3 setValue:v4 forHTTPHeaderField:@"X-Apple-Store-Front"];
  }
  id v5 = [*(id *)(a1 + 40) logKey];
  id v6 = [v3 properties];
  [v6 setLogUUID:v5];

  uint64_t v7 = +[AMSPromise promiseWithResult:v3];

  return v7;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (id)_performFetchWithAttemptedCount:(unint64_t)a3 account:(id)a4 storefront:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v10 = +[AMSLogConfig sharedBagConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v12;
      __int16 v43 = 2114;
      id v44 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempted a bag load but an account wasn't provided.", buf, 0x16u);
    }
  }
  if (a3 < 3)
  {
    uint64_t v21 = [(AMSBagNetworkTask *)self profile];
    objc_super v22 = +[AMSBagNetworkTask _URLCookieNamesForProfile:v21];

    uint64_t v23 = [(AMSBagNetworkTask *)self clientInfo];
    uint64_t v24 = [(AMSBagNetworkTask *)self profile];
    uint64_t v25 = [(AMSBagNetworkTask *)self profileVersion];
    uint64_t v26 = +[AMSBagNetworkTask _queryItemsForClientInfo:v23 profile:v24 profileVersion:v25 cookieNames:v22 account:v8 storefront:v9];

    uint64_t v27 = [(AMSBagNetworkTask *)self _createRequestWithQueryItems:v26];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke;
    v40[3] = &unk_1E559E9C0;
    v40[4] = self;
    v28 = [v27 thenWithBlock:v40];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_4;
    v35[3] = &unk_1E559F960;
    v35[4] = self;
    id v36 = v26;
    id v37 = v22;
    unint64_t v39 = a3;
    id v38 = v8;
    id v29 = v22;
    id v30 = v26;
    id v31 = [v28 thenWithBlock:v35];
  }
  else
  {
    BOOL v14 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v15 = +[AMSLogConfig sharedBagConfig];
    id v16 = (void *)v15;
    if (v14)
    {
      if (!v15)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      double v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        long long v19 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v18;
        __int16 v43 = 2114;
        id v44 = v19;
        __int16 v45 = 2050;
        unint64_t v46 = a3;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempt-count parameter exceeds the maximum. count = %{public}lu", buf, 0x20u);
      }
      id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v20 = +[AMSLogConfig sharedBagConfig];
      [v16 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v20 userInfo:0];
    }
    else
    {
      if (!v15)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      double v20 = [v16 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = objc_opt_class();
        v33 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v32;
        __int16 v43 = 2114;
        id v44 = v33;
        __int16 v45 = 2050;
        unint64_t v46 = a3;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Attempt-count parameter exceeds the maximum. count = %{public}lu", buf, 0x20u);
      }
    }

    uint64_t v27 = AMSError(203, @"Bag Load Failed", @"Invalid attempt count.", 0);
    id v31 = +[AMSPromise promiseWithError:v27];
  }

  return v31;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (id)_createRequestWithQueryItems:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSBagNetworkTask *)self clientInfo];
  id v6 = [v5 accountMediaType];
  uint64_t v7 = @"https://sandbox.itunes.apple.com/WebObjects/MZInit.woa/wa/initiateSession";
  if (([v6 isEqualToString:AMSAccountMediaTypeAppStoreSandbox] & 1) == 0)
  {
    id v8 = [(AMSBagNetworkTask *)self clientInfo];
    id v9 = [v8 accountMediaType];
    if (![v9 isEqualToString:AMSAccountMediaTypeAppStoreBeta]) {
      uint64_t v7 = @"https://bag.itunes.apple.com/bag.xml";
    }
  }
  id v10 = (objc_class *)MEMORY[0x1E4F29088];
  id v11 = v7;
  uint64_t v12 = (void *)[[v10 alloc] initWithString:v11];

  [v12 setPercentEncodedQueryItems:v4];
  id v13 = [v12 URL];
  if (v13)
  {
    BOOL v14 = objc_alloc_init(AMSURLRequestEncoder);
    uint64_t v15 = [(AMSBagNetworkTask *)self clientInfo];
    [(AMSURLRequestEncoder *)v14 setClientInfo:v15];

    id v16 = AMSLogKey();
    [(AMSURLRequestEncoder *)v14 setLogUUID:v16];

    [(AMSURLRequestEncoder *)v14 setUrlKnownToBeTrusted:1];
    [(AMSURLRequestEncoder *)v14 setIncludeClientVersions:0];
    [(AMSURLRequestEncoder *)v14 setPreserveQueryParameterEncoding:1];
    [(AMSURLRequestEncoder *)v14 setShouldSetStorefrontHeader:0];
    [(AMSURLRequestEncoder *)v14 setShouldSetCookieHeader:0];
    double v17 = [(AMSBagNetworkTask *)self accountProvider];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v19 = [(AMSBagNetworkTask *)self accountProvider];
      double v20 = [v19 account];
      [(AMSURLRequestEncoder *)v14 setAccount:v20];
    }
    uint64_t v21 = [(AMSURLRequestEncoder *)v14 requestWithMethod:2 URL:v13 parameters:0];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __50__AMSBagNetworkTask__createRequestWithQueryItems___block_invoke;
    uint64_t v32 = &unk_1E559FA68;
    id v33 = v4;
    v34 = self;
    objc_super v22 = [v21 thenWithBlock:&v29];
    uint64_t v23 = objc_msgSend(v22, "catchWithBlock:", &__block_literal_global_120, v29, v30, v31, v32);
  }
  else
  {
    BOOL v14 = +[AMSLogConfig sharedBagConfig];
    if (!v14)
    {
      BOOL v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [(AMSURLRequestEncoder *)v14 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = AMSLogKey();
      uint64_t v26 = objc_msgSend(v4, "ams_nonEmptyComponentsJoinedByString:", @",");
      uint64_t v27 = AMSHashIfNeeded(v26);
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v24;
      __int16 v37 = 2114;
      id v38 = v25;
      __int16 v39 = 2114;
      uint64_t v40 = v27;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to format bag URL. Query items = %{public}@", buf, 0x20u);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

id __33__AMSBagNetworkTask_performFetch__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accountProvider];
  id v3 = [*(id *)(a1 + 32) clientInfo];
  id v4 = [v3 accountMediaType];
  id v5 = [v2 bagAccountPromiseForAccountMediaType:v4];

  id v6 = [*(id *)(a1 + 32) accountProvider];
  uint64_t v7 = [*(id *)(a1 + 32) clientInfo];
  id v8 = [v7 accountMediaType];
  id v9 = [v6 bagStorefrontPromiseForAccountMediaType:v8];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__AMSBagNetworkTask_performFetch__block_invoke_2;
  v14[3] = &unk_1E559F9B0;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v9;
  uint64_t v16 = v10;
  id v11 = v9;
  uint64_t v12 = [v5 continueWithBlock:v14];

  return v12;
}

- (AMSBagAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)_updateStorefrontSuffixIfNecessaryWithBagData:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSBagNetworkTask *)self clientInfo];
  id v6 = [v5 bundleIdentifier];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28F80] processInfo];
    id v6 = [v7 processName];
  }
  if ([v6 length])
  {
    uint64_t v8 = +[AMSDefaults storefrontSuffixes];
    uint64_t v9 = [(id)v8 mutableCopy];
    if (!v9) {
      uint64_t v9 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v10 = [v4 objectForKeyedSubscript:@"storefront-header-suffix"];
    if ([v10 length]) {
      [(id)v9 setObject:v10 forKeyedSubscript:v6];
    }
    else {
      [(id)v9 removeObjectForKey:v6];
    }
    if (v8 | v9 && ([(id)v9 isEqual:v8] & 1) == 0)
    {
      id v13 = [(id)v8 objectForKeyedSubscript:v6];
      BOOL v14 = +[AMSLogConfig sharedAccountsStorefrontConfig];
      if (!v14)
      {
        BOOL v14 = +[AMSLogConfig sharedConfig];
      }
      id v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = objc_opt_class();
        id v19 = v16;
        AMSLogKey();
        v18 = double v17 = v13;
        *(_DWORD *)buf = 138544386;
        uint64_t v21 = v16;
        __int16 v22 = 2114;
        uint64_t v23 = v18;
        __int16 v24 = 2114;
        uint64_t v25 = v17;
        __int16 v26 = 2114;
        id v27 = v10;
        __int16 v28 = 2114;
        uint64_t v29 = v6;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating a storefront suffix. originalStorefontSuffix = %{public}@ | newStorefrontSuffix = %{public}@ | bundleID = %{public}@", buf, 0x34u);

        id v13 = v17;
      }

      +[AMSDefaults setStorefrontSuffixes:v9];
    }
    goto LABEL_20;
  }
  uint64_t v8 = +[AMSLogConfig sharedAccountsStorefrontConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [(id)v8 OSLogObject];
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = objc_opt_class();
    id v10 = v11;
    uint64_t v12 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_18D554000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to set a storefront suffix because we have no bundle identifier.", buf, 0x16u);

LABEL_20:
  }
}

- (BOOL)_shouldRetryForResult:(id)a3 cookieNames:(id)a4 urlCookies:(id)a5 responseStorefront:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[AMSBagNetworkTask _shouldReloadDataForOriginalCookies:v10 newCookies:v11])
  {
    id v13 = +[AMSLogConfig sharedBagConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    BOOL v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = AMSLogKey();
    *(_DWORD *)buf = 138544130;
    uint64_t v26 = v15;
    __int16 v27 = 2114;
    __int16 v28 = v16;
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2114;
    id v32 = v11;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to load the bag again due to urlCookies. originalCookies = %{public}@ | newCookies = %{public}@", buf, 0x2Au);
LABEL_13:

LABEL_14:
    BOOL v19 = 1;
    goto LABEL_15;
  }
  double v17 = [v9 task];
  uint64_t v18 = [v17 originalRequest];
  id v13 = [v18 valueForHTTPHeaderField:@"X-Apple-Store-Front"];

  if (v12 && ([v13 isEqualToString:v12] & 1) == 0)
  {
    BOOL v14 = +[AMSLogConfig sharedBagConfig];
    if (!v14)
    {
      BOOL v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v14 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      double v20 = AMSLogKey();
      uint64_t v21 = AMSHashIfNeeded(v13);
      __int16 v22 = AMSHashIfNeeded(v12);
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v24;
      __int16 v27 = 2114;
      __int16 v28 = v20;
      __int16 v29 = 2114;
      id v30 = v21;
      __int16 v31 = 2114;
      id v32 = v22;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to load the bag again because the response had a x-set-apple-store-front header. originalStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x2Au);
    }
    goto LABEL_13;
  }
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

+ (BOOL)_shouldReloadDataForOriginalCookies:(id)a3 newCookies:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CAD0];
    id v8 = a3;
    id v9 = (void *)[[v7 alloc] initWithArray:v8];

    id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
    char v11 = [v9 isEqualToSet:v10];
  }
  else
  {
    id v10 = a3;
    id v9 = [a1 _defaultURLCookieNames];
    char v11 = [v10 isEqualToArray:v9];
  }
  char v12 = v11;

  return v12 ^ 1;
}

+ (void)_setURLCookieNames:(id)a3 forProfile:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  id v5 = a4;
  uint64_t v6 = +[AMSStorage bagURLCookies];
  if (v8 | v6)
  {
    id v7 = (id)[(id)v6 mutableCopy];
    if (!v7) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if (v8) {
      [v7 setObject:v8 forKeyedSubscript:v5];
    }
    else {
      [v7 removeObjectForKey:v5];
    }
    if (([(id)v6 isEqualToDictionary:v7] & 1) == 0) {
      +[AMSStorage setBagURLCookies:v7];
    }
  }
}

+ (id)_URLCookieNamesForProfile:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSStorage bagURLCookies];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v6 = [a1 _defaultURLCookieNames];
  }

  return v6;
}

+ (id)_defaultURLCookieNames
{
  if (qword_1EB38D398 != -1) {
    dispatch_once(&qword_1EB38D398, &__block_literal_global_153);
  }
  id v2 = (void *)qword_1EB38D3A0;
  return v2;
}

+ (id)_setStorefrontFromURLResponse:(id)a3 bagData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v8 = 0;
  if (v5 && (isKindOfClass & 1) != 0)
  {
    unint64_t v8 = [v5 valueForHTTPHeaderField:@"X-Set-Apple-Store-Front"];
    id v9 = [v6 objectForKeyedSubscript:@"storefront-header-suffix"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v9 length]
      && ([v8 containsString:v9] & 1) == 0)
    {
      uint64_t v10 = [v8 stringByAppendingString:v9];

      unint64_t v8 = (void *)v10;
    }
  }
  return v8;
}

+ (id)_requestIdentifierForQueryItems:(id)a3
{
  return (id)[a1 _requestIdentifierForQueryItems:a3 prefix:@"com.apple.AppleMediaServices.AMSBagNetworkTask"];
}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMSBagNetworkTask _urlSessionPromise];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_2;
  v9[3] = &unk_1E559F938;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  id v7 = [v4 thenWithBlock:v9];

  return v7;
}

+ (id)_urlSessionPromise
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AMSBagNetworkTask__urlSessionPromise__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_3_1 != -1) {
    dispatch_once(&_MergedGlobals_3_1, block);
  }
  id v2 = (void *)qword_1EB38D390;
  return v2;
}

uint64_t __39__AMSBagNetworkTask__urlSessionPromise__block_invoke(uint64_t a1)
{
  qword_1EB38D390 = [*(id *)(a1 + 32) _createURLSessionPromise];
  return MEMORY[0x1F41817F8]();
}

+ (id)_createURLSessionPromise
{
  id v2 = [[AMSMutableLazyPromise alloc] initWithBlock:&__block_literal_global_104];
  return v2;
}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 activity];
  id v6 = [v5 nwActivity];
  id v7 = [v4 dataTaskPromiseWithRequest:v2 activity:v6];

  unint64_t v8 = [v7 catchWithBlock:&__block_literal_global_17];

  return v8;
}

- (id)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = AMSError(203, @"Bag Load Failed", @"We failed to load the bag.", a2);
  id v3 = +[AMSPromise promiseWithError:v2];

  return v3;
}

uint64_t __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke_99(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_flatInsertValue:forKeyPath:", a3, a2);
}

id __50__AMSBagNetworkTask__createRequestWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = AMSError(203, @"Bag Load Failed", @"Failed to create URL request.", a2);
  id v3 = +[AMSPromise promiseWithError:v2];

  return v3;
}

- (void)setActivity:(id)a3
{
}

- (void)setClientInfo:(id)a3
{
}

- (void)setProfile:(id)a3
{
}

- (void)setProfileVersion:(id)a3
{
}

@end