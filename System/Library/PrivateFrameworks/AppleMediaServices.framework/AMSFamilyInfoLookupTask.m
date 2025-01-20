@interface AMSFamilyInfoLookupTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_processURLResult:(id)a3;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSFamilyInfoLookupTask)initWithAccount:(id)a3 bag:(id)a4;
- (AMSFamilyInfoLookupTask)initWithBag:(id)a3;
- (AMSFamilyInfoLookupTask)initWithBagContract:(id)a3;
- (NSString)logKey;
- (id)_cachedFamilyInfoLookupResultForAccount:(id)a3;
- (id)_currentCachedFamilyInfo;
- (id)_pathForCachedFamilyInfoLookupResult;
- (id)_performFamilyInfoRequestForAccount:(id)a3 error:(id *)a4;
- (id)fetchFamilyInfoLookupFromCache;
- (id)fetchFamilyInfoLookupFromServer;
- (id)performFamilyInfoLookup;
- (id)performFamilyInfoLookupWithCachePolicy:(int64_t)a3;
- (void)_cacheFamilyInfoLookupResult:(id)a3 forAccount:(id)a4;
- (void)setLogKey:(id)a3;
@end

@implementation AMSFamilyInfoLookupTask

- (AMSFamilyInfoLookupTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSFamilyInfoLookupTask;
  v9 = [(AMSTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
    uint64_t v11 = AMSGenerateLogCorrelationKey();
    logKey = v10->_logKey;
    v10->_logKey = (NSString *)v11;
  }
  return v10;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_9 != -1) {
    dispatch_once(&_MergedGlobals_1_9, &__block_literal_global_53);
  }
  v2 = (void *)qword_1EB38D128;
  return (NSString *)v2;
}

void __40__AMSFamilyInfoLookupTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D128;
  qword_1EB38D128 = @"AMSFamilyInfo";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D130 != -1) {
    dispatch_once(&qword_1EB38D130, &__block_literal_global_18);
  }
  v2 = (void *)qword_1EB38D138;
  return (NSString *)v2;
}

void __47__AMSFamilyInfoLookupTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D138;
  qword_1EB38D138 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (id)performFamilyInfoLookup
{
  return [(AMSFamilyInfoLookupTask *)self performFamilyInfoLookupWithCachePolicy:1];
}

- (id)performFamilyInfoLookupWithCachePolicy:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke;
  v5[3] = &unk_1E55A2988;
  v5[4] = self;
  v5[5] = a3;
  v3 = [(AMSTask *)self performTaskWithPromiseBlock:v5];
  return v3;
}

id __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 logKey];
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v15 = v4;
    __int16 v16 = 2114;
    v17 = v7;
    __int16 v18 = 2050;
    uint64_t v19 = v8;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing look up (cachePolicy: %{public}ld)", buf, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  switch(v9)
  {
    case 2:
      uint64_t v11 = [*(id *)(a1 + 32) fetchFamilyInfoLookupFromCache];
LABEL_11:
      v2 = (void *)v11;
      break;
    case 1:
      uint64_t v11 = [*(id *)(a1 + 32) fetchFamilyInfoLookupFromServer];
      goto LABEL_11;
    case 0:
      v10 = [*(id *)(a1 + 32) fetchFamilyInfoLookupFromCache];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke_23;
      v13[3] = &unk_1E55A2960;
      v13[4] = *(void *)(a1 + 32);
      v2 = [v10 continueWithBlock:v13];

      break;
  }
  return v2;
}

id __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke_23(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v2 = +[AMSPromise promiseWithResult:a2];
  }
  else
  {
    v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = objc_opt_class();
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      uint64_t v9 = [v7 logKey];
      int v11 = 138543618;
      v12 = v6;
      __int16 v13 = 2114;
      objc_super v14 = v9;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Failed to fetch cache, attempting to query server", (uint8_t *)&v11, 0x16u);
    }
    v2 = [*(id *)(a1 + 32) fetchFamilyInfoLookupFromServer];
  }
  return v2;
}

- (id)fetchFamilyInfoLookupFromCache
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSFamilyInfoLookupTask *)self account];
  v4 = [(AMSFamilyInfoLookupTask *)self _cachedFamilyInfoLookupResultForAccount:v3];

  uint64_t v5 = +[AMSLogConfig sharedConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      v10 = [(AMSFamilyInfoLookupTask *)self logKey];
      int v11 = [v4 dictionaryRepresentation];
      int v19 = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      v22 = v10;
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] returning cached result %{public}@", (uint8_t *)&v19, 0x20u);
    }
    v12 = +[AMSPromise promiseWithResult:v4];
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    __int16 v13 = [v6 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_super v14 = objc_opt_class();
      id v15 = v14;
      __int16 v16 = [(AMSFamilyInfoLookupTask *)self logKey];
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Cache not available", (uint8_t *)&v19, 0x16u);
    }
    v17 = AMSError(7, @"Family Info Lookup Failed", @"Cache not available", 0);
    v12 = +[AMSPromise promiseWithError:v17];
  }
  return v12;
}

- (id)fetchFamilyInfoLookupFromServer
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSFamilyInfoLookupTask *)self account];

  if (v3)
  {
    v4 = [(AMSFamilyInfoLookupTask *)self account];
    id v45 = 0;
    uint64_t v5 = [(AMSFamilyInfoLookupTask *)self _performFamilyInfoRequestForAccount:v4 error:&v45];
    id v6 = v45;

    uint64_t v7 = +[AMSFamilyInfoLookupTask _processURLResult:v5];
    id v8 = (void *)v7;
    if (v5 && v7)
    {
      id v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = objc_opt_class();
        id v12 = v11;
        __int16 v13 = [(AMSFamilyInfoLookupTask *)self logKey];
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = (uint64_t)v11;
        __int16 v48 = 2114;
        v49 = v13;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Successfully fetched family info from server", buf, 0x16u);
      }
      objc_super v14 = [(AMSFamilyInfoLookupTask *)self account];
      [(AMSFamilyInfoLookupTask *)self _cacheFamilyInfoLookupResult:v8 forAccount:v14];
    }
    else
    {
      if (!v5)
      {
        __int16 v21 = +[AMSLogConfig sharedConfig];
        if (!v21)
        {
          __int16 v21 = +[AMSLogConfig sharedConfig];
        }
        v22 = [v21 OSLogObject];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = objc_opt_class();
          v24 = [(AMSFamilyInfoLookupTask *)self logKey];
          uint64_t v25 = AMSLogableError(v6);
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = v23;
          __int16 v48 = 2114;
          v49 = v24;
          __int16 v50 = 2114;
          v51 = v25;
          _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load the family info because the network call failed. error = %{public}@", buf, 0x20u);
        }
      }
      v26 = [(AMSFamilyInfoLookupTask *)self account];
      uint64_t v27 = [(AMSFamilyInfoLookupTask *)self _cachedFamilyInfoLookupResultForAccount:v26];

      uint64_t v28 = +[AMSLogConfig sharedConfig];
      objc_super v14 = (void *)v28;
      if (!v27)
      {
        if (!v28)
        {
          objc_super v14 = +[AMSLogConfig sharedConfig];
        }
        v42 = [v14 OSLogObject];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = objc_opt_class();
          v44 = [(AMSFamilyInfoLookupTask *)self logKey];
          *(_DWORD *)buf = 138543618;
          uint64_t v47 = v43;
          __int16 v48 = 2114;
          v49 = v44;
          _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We failed to load the family info, and we have no cached family info to return.", buf, 0x16u);
        }
        id v8 = AMSError(0, @"Family Info Lookup Failed", @"We failed to load the family info for the active account.", v6);
        uint64_t v40 = +[AMSPromise promiseWithError:v8];
        goto LABEL_31;
      }
      if (!v28)
      {
        objc_super v14 = +[AMSLogConfig sharedConfig];
      }
      v29 = [v14 OSLogObject];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_opt_class();
        id v31 = v30;
        v32 = [(AMSFamilyInfoLookupTask *)self logKey];
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = (uint64_t)v30;
        __int16 v48 = 2114;
        v49 = v32;
        _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returning cached family info.", buf, 0x16u);
      }
      id v8 = (void *)v27;
    }

    v33 = +[AMSLogConfig sharedConfig];
    if (!v33)
    {
      v33 = +[AMSLogConfig sharedConfig];
    }
    v34 = [v33 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = objc_opt_class();
      id v36 = v35;
      v37 = [(AMSFamilyInfoLookupTask *)self logKey];
      v38 = [v8 dictionaryRepresentation];
      v39 = AMSHashIfNeeded(v38);
      *(_DWORD *)buf = 138543874;
      uint64_t v47 = (uint64_t)v35;
      __int16 v48 = 2114;
      v49 = v37;
      __int16 v50 = 2114;
      v51 = v39;
      _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] returning result %{public}@", buf, 0x20u);
    }
    uint64_t v40 = +[AMSPromise promiseWithResult:v8];
LABEL_31:
    uint64_t v20 = (void *)v40;

    goto LABEL_32;
  }
  id v15 = +[AMSLogConfig sharedConfig];
  if (!v15)
  {
    id v15 = +[AMSLogConfig sharedConfig];
  }
  __int16 v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = objc_opt_class();
    id v18 = v17;
    int v19 = [(AMSFamilyInfoLookupTask *)self logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v47 = (uint64_t)v17;
    __int16 v48 = 2114;
    v49 = v19;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed because there's no account.", buf, 0x16u);
  }
  AMSError(103, @"Family Info Lookup Failed", @"We cannot load the family circle if there's no account.", 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = +[AMSPromise promiseWithError:v6];
LABEL_32:

  return v20;
}

- (id)_performFamilyInfoRequestForAccount:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(AMSFamilyInfoLookupTask *)self bag];
  id v8 = [v7 URLForKey:@"family-info"];
  id v26 = 0;
  id v9 = [v8 valueWithError:&v26];
  id v10 = v26;

  if (v9)
  {
    int v11 = objc_alloc_init(AMSURLRequestEncoder);
    [(AMSURLRequestEncoder *)v11 setAccount:v6];
    id v12 = [(AMSFamilyInfoLookupTask *)self bag];
    [(AMSURLRequestEncoder *)v11 setBag:v12];

    __int16 v13 = [(AMSFamilyInfoLookupTask *)self logKey];
    [(AMSURLRequestEncoder *)v11 setLogUUID:v13];

    [(AMSURLRequestEncoder *)v11 setUrlKnownToBeTrusted:1];
    objc_super v14 = [(AMSURLRequestEncoder *)v11 requestWithMethod:2 URL:v9 parameters:0];
    id v15 = [v14 resultWithError:a4];

    __int16 v16 = objc_alloc_init(AMSPromise);
    v17 = +[AMSURLSession defaultSession];
    id v18 = [(AMSPromise *)v16 completionHandlerAdapter];
    int v19 = [v17 dataTaskWithRequest:v15 completionHandler:v18];

    [v19 resume];
    uint64_t v20 = [(AMSPromise *)v16 resultWithError:a4];
  }
  else
  {
    __int16 v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      __int16 v21 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      v24 = [(AMSFamilyInfoLookupTask *)self logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v23;
      __int16 v29 = 2114;
      v30 = v24;
      __int16 v31 = 2114;
      id v32 = v10;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed because the bag didn't give us the URL. error = %{public}@", buf, 0x20u);
    }
    if (a4)
    {
      AMSError(204, @"Family Info Lookup Failed", @"We were unable to get the family circle URL.", v10);
      uint64_t v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v20 = 0;
    }
  }

  return v20;
}

+ (id)_processURLResult:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  v3 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      uint64_t v5 = [v4 objectForKeyedSubscript:@"family"];

      if (v5) {
        uint64_t v5 = [[AMSFamilyInfoLookupResult alloc] initWithDictionaryRepresentation:v4 cached:0];
      }
      goto LABEL_9;
    }
  }
  else
  {

    id v4 = 0;
  }
  uint64_t v5 = 0;
LABEL_9:

LABEL_10:
  return v5;
}

- (void)_cacheFamilyInfoLookupResult:(id)a3 forAccount:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSFamilyInfoLookupTask *)self _pathForCachedFamilyInfoLookupResult];
  if (v8)
  {
    id v9 = objc_msgSend(v7, "ams_DSID");

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1E4F28F98];
      v39[0] = @"account";
      int v11 = objc_msgSend(v7, "ams_DSID");
      v40[0] = v11;
      v39[1] = @"circle";
      id v12 = [v6 dictionaryRepresentation];
      v40[1] = v12;
      v39[2] = @"timestamp";
      __int16 v13 = [MEMORY[0x1E4F1C9C8] date];
      v40[2] = v13;
      objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
      id v38 = 0;
      id v15 = [v10 dataWithPropertyList:v14 format:200 options:0 error:&v38];
      id v16 = v38;

      if (!v15)
      {
        uint64_t v20 = +[AMSLogConfig sharedConfig];
        if (!v20)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        __int16 v21 = [v20 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = objc_opt_class();
          v34 = [(AMSFamilyInfoLookupTask *)self logKey];
          v35 = AMSLogableError(v16);
          *(_DWORD *)buf = 138543874;
          uint64_t v42 = v33;
          __int16 v43 = 2114;
          v44 = v34;
          __int16 v45 = 2114;
          id v46 = v35;
          _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize the family info. error = %{public}@", buf, 0x20u);
        }
        goto LABEL_28;
      }
      id v37 = v16;
      char v17 = [v15 writeToFile:v8 options:1 error:&v37];
      id v18 = v37;

      uint64_t v19 = +[AMSLogConfig sharedConfig];
      uint64_t v20 = (void *)v19;
      if (v17)
      {
        if (!v19)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        __int16 v21 = [v20 OSLogObject];
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
          goto LABEL_27;
        }
        v22 = objc_opt_class();
        id v23 = v22;
        v24 = [(AMSFamilyInfoLookupTask *)self logKey];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = (uint64_t)v22;
        __int16 v43 = 2114;
        v44 = v24;
        uint64_t v25 = "%{public}@: [%{public}@] Successfully cached family info";
        id v26 = v21;
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
        uint32_t v28 = 22;
      }
      else
      {
        if (!v19)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        __int16 v21 = [v20 OSLogObject];
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        uint64_t v36 = objc_opt_class();
        v24 = [(AMSFamilyInfoLookupTask *)self logKey];
        AMSLogableError(v18);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v36;
        __int16 v43 = 2114;
        v44 = v24;
        __int16 v45 = 2114;
        id v46 = v23;
        uint64_t v25 = "%{public}@: [%{public}@] Failed to write the serialized family info to disk. error = %{public}@";
        id v26 = v21;
        os_log_type_t v27 = OS_LOG_TYPE_ERROR;
        uint32_t v28 = 32;
      }
      _os_log_impl(&dword_18D554000, v26, v27, v25, buf, v28);

LABEL_27:
      id v16 = v18;
LABEL_28:

      goto LABEL_29;
    }
    id v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v16 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = objc_opt_class();
      v30 = [(AMSFamilyInfoLookupTask *)self logKey];
      id v32 = [v7 hashedDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v31;
      __int16 v43 = 2114;
      v44 = v30;
      __int16 v45 = 2114;
      id v46 = v32;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to cache a family info lookup because the given account has no DSID. account = %{public}@", buf, 0x20u);

      goto LABEL_17;
    }
  }
  else
  {
    id v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v16 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_opt_class();
      v30 = [(AMSFamilyInfoLookupTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v29;
      __int16 v43 = 2114;
      v44 = v30;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to generate the path in order to cache a family info lookup.", buf, 0x16u);
LABEL_17:
    }
  }
LABEL_29:
}

- (id)_cachedFamilyInfoLookupResultForAccount:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "ams_DSID");

  if (!v5)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v7 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      int v11 = [(AMSFamilyInfoLookupTask *)self logKey];
      id v12 = [v4 hashedDescription];
      int v34 = 138543874;
      uint64_t v35 = v10;
      __int16 v36 = 2114;
      id v37 = v11;
      __int16 v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load cached family info because the account has no DSID. account = %{public}@", (uint8_t *)&v34, 0x20u);
    }
    __int16 v13 = 0;
    goto LABEL_36;
  }
  id v6 = [(AMSFamilyInfoLookupTask *)self _currentCachedFamilyInfo];
  id v7 = v6;
  if (!v6)
  {
    __int16 v13 = 0;
    goto LABEL_37;
  }
  id v8 = [v6 objectForKeyedSubscript:@"account"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  objc_super v14 = objc_msgSend(v4, "ams_DSID");
  char v15 = [v9 isEqualToNumber:v14];

  if ((v15 & 1) == 0)
  {
    id v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = [v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_opt_class();
      v22 = [(AMSFamilyInfoLookupTask *)self logKey];
      int v34 = 138543618;
      uint64_t v35 = v21;
      __int16 v36 = 2114;
      id v37 = v22;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Our cached family info isn't for the given account.", (uint8_t *)&v34, 0x16u);
    }
    goto LABEL_34;
  }
  id v16 = [v7 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = 0;
    double v19 = 2.22044605e-16;
    goto LABEL_21;
  }
  id v17 = v16;

  if (v17)
  {
    id v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceDate:v17];
    double v19 = v18;
LABEL_21:

    goto LABEL_22;
  }
  double v19 = 2.22044605e-16;
LABEL_22:
  id v23 = [(AMSFamilyInfoLookupTask *)self bag];
  v24 = [v23 doubleForKey:@"family-info-max-cache-age"];
  uint64_t v25 = [v24 valueWithError:0];
  [v25 doubleValue];
  double v27 = v26;

  if (v19 > 2.22044605e-16)
  {
    double v28 = 604800.0;
    if (v27 != 0.0) {
      double v28 = v27;
    }
    if (v19 < v28)
    {
      uint64_t v29 = [v7 objectForKeyedSubscript:@"circle"];
      __int16 v13 = [v29 objectForKeyedSubscript:@"family"];

      if (v13) {
        __int16 v13 = [[AMSFamilyInfoLookupResult alloc] initWithDictionaryRepresentation:v29 cached:1];
      }

      goto LABEL_35;
    }
  }
  uint64_t v20 = +[AMSLogConfig sharedConfig];
  if (!v20)
  {
    uint64_t v20 = +[AMSLogConfig sharedConfig];
  }
  v30 = [v20 OSLogObject];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = objc_opt_class();
    id v32 = [(AMSFamilyInfoLookupTask *)self logKey];
    int v34 = 138543618;
    uint64_t v35 = v31;
    __int16 v36 = 2114;
    id v37 = v32;
    _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] We have cached family info for the account, but it's too old to return.", (uint8_t *)&v34, 0x16u);
  }
LABEL_34:

  __int16 v13 = 0;
LABEL_35:

LABEL_36:
LABEL_37:

  return v13;
}

- (id)_currentCachedFamilyInfo
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSFamilyInfoLookupTask *)self _pathForCachedFamilyInfoLookupResult];
  if (!v3)
  {
    id v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v4 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = [(AMSFamilyInfoLookupTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      double v19 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to generate the path in order to load cached family info.", buf, 0x16u);
    }
    goto LABEL_17;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3];
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_19;
  }
  id v15 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v15];
  id v6 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_12:
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    int v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      __int16 v13 = [(AMSFamilyInfoLookupTask *)self logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      double v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to deserialize the cached family info. error = %{public}@", buf, 0x20u);
    }
LABEL_17:
    id v7 = 0;
    goto LABEL_18;
  }
  id v7 = v5;

  if (!v7) {
    goto LABEL_12;
  }
LABEL_18:

LABEL_19:
  return v7;
}

- (id)_pathForCachedFamilyInfoLookupResult
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  if (v3)
  {
    id v4 = NSString;
    v13[0] = v3;
    v13[1] = @"com.apple.itunesstored";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v6 = [v4 pathWithComponents:v5];

    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v7 fileExistsAtPath:v6] & 1) != 0
      || (uint64_t v8 = 0,
          [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0]))
    {
      id v9 = NSString;
      v12[0] = v6;
      v12[1] = @"JFamilyCircle.plist";
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
      uint64_t v8 = [v9 pathWithComponents:v10];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (AMSFamilyInfoLookupTask)initWithBag:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F179C8];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "ams_sharedAccountStore");
  id v7 = objc_msgSend(v6, "ams_activeiTunesAccount");

  uint64_t v8 = [(AMSFamilyInfoLookupTask *)self initWithAccount:v7 bag:v5];
  return v8;
}

- (AMSFamilyInfoLookupTask)initWithBagContract:(id)a3
{
  id v4 = a3;
  id v5 = [[AMSContractBagShim alloc] initWithBagContract:v4];

  id v6 = [(AMSFamilyInfoLookupTask *)self initWithBag:v5];
  return v6;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end