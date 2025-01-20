@interface AMSMercuryCacheFetchTask
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)requestEncoderWithSharedProperties:(id)a3 task:(id)a4;
+ (id)sharedPropertiesFromTask:(id)a3;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSMercuryCacheFetchTask)initWithAccount:(id)a3 bag:(id)a4 cacheTypeIDs:(id)a5 clientIdentifier:(id)a6 clientVersion:(id)a7;
- (AMSProcessInfo)clientInfo;
- (NSSet)cacheTypeIDs;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)logKey;
- (id)_updateEndpointURLRequestWithError:(id *)a3;
- (id)perform;
- (void)setClientInfo:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation AMSMercuryCacheFetchTask

- (AMSMercuryCacheFetchTask)initWithAccount:(id)a3 bag:(id)a4 cacheTypeIDs:(id)a5 clientIdentifier:(id)a6 clientVersion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v20 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AMSMercuryCacheFetchTask;
  v17 = [(AMSTask *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_bag, a4);
    objc_storeStrong((id *)&v18->_cacheTypeIDs, a5);
    objc_storeStrong((id *)&v18->_clientIdentifier, a6);
    objc_storeStrong((id *)&v18->_clientVersion, a7);
  }

  return v18;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__AMSMercuryCacheFetchTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __35__AMSMercuryCacheFetchTask_perform__block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = [(id)objc_opt_class() sharedPropertiesFromTask:*(void *)(a1 + 32)];
  v4 = [(id)objc_opt_class() requestEncoderWithSharedProperties:v3 task:*(void *)(a1 + 32)];
  v5 = *(void **)(a1 + 32);
  id v63 = 0;
  v6 = [v5 _updateEndpointURLRequestWithError:&v63];
  id v7 = v63;
  v8 = [v4 requestByEncodingRequest:v6 parameters:0];

  if (v7)
  {
    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      v12 = *(void **)(a1 + 32);
      id v13 = v11;
      id v14 = [v12 logKey];
      *(_DWORD *)buf = 138543874;
      v65 = v11;
      __int16 v66 = 2114;
      v67 = v14;
      __int16 v68 = 2114;
      id v69 = v7;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating url request: %{public}@", buf, 0x20u);
    }
    [v2 finishWithError:v7];
    id v15 = v2;
  }
  else
  {
    id v62 = 0;
    id v16 = [v8 resultWithTimeout:&v62 error:60.0];
    id v17 = v62;
    if (v17)
    {
      id v7 = v17;
      v18 = +[AMSLogConfig sharedConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = v8;
        objc_super v21 = v16;
        v22 = objc_opt_class();
        v23 = *(void **)(a1 + 32);
        id v59 = v22;
        v24 = [v23 logKey];
        *(_DWORD *)buf = 138543874;
        v65 = v22;
        id v16 = v21;
        v8 = v20;
        __int16 v66 = 2114;
        v67 = v24;
        __int16 v68 = 2114;
        id v69 = v7;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);
      }
      [v2 finishWithError:v7];
      id v25 = v2;
    }
    else
    {
      v26 = [v3 session];
      v27 = [v26 dataTaskPromiseWithRequest:v16];

      v60 = v27;
      id v61 = 0;
      v28 = [v27 resultWithTimeout:&v61 error:60.0];
      id v29 = v61;
      v58 = v28;
      if (v29)
      {
        id v7 = v29;
        v56 = v16;
        v30 = +[AMSLogConfig sharedConfig];
        if (!v30)
        {
          v30 = +[AMSLogConfig sharedConfig];
        }
        v31 = [v30 OSLogObject];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = objc_opt_class();
          v33 = *(void **)(a1 + 32);
          id v34 = v32;
          v35 = [v33 logKey];
          *(_DWORD *)buf = 138543874;
          v65 = v32;
          __int16 v66 = 2114;
          v67 = v35;
          __int16 v68 = 2114;
          id v69 = v7;
          _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error performing data task: %{public}@", buf, 0x20u);
        }
        [v2 finishWithError:v7];
        id v36 = v2;
        id v16 = v56;
      }
      else
      {
        v37 = [v28 responseDictionary];
        v38 = [v28 responseHeaders];
        uint64_t v39 = objc_msgSend(v37, "ams_dictionaryByAddingEntriesFromDictionary:", v38);

        v55 = (void *)v39;
        if (v39)
        {
          v40 = +[AMSLogConfig sharedConfig];
          if (!v40)
          {
            v40 = +[AMSLogConfig sharedConfig];
          }
          v41 = [v40 OSLogObject];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = objc_opt_class();
            v43 = *(void **)(a1 + 32);
            id v44 = v42;
            v45 = [v43 logKey];
            *(_DWORD *)buf = 138543874;
            v65 = v42;
            __int16 v66 = 2114;
            v67 = v45;
            __int16 v68 = 2114;
            id v69 = v55;
            _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetch complete %{public}@", buf, 0x20u);
          }
          v46 = v55;
          [v2 finishWithResult:v55];
          id v7 = 0;
        }
        else
        {
          v57 = v16;
          AMSError(7, @"Sync response contains no data", @"Data expected is missing.", 0);
          id v7 = (id)objc_claimAutoreleasedReturnValue();
          v47 = +[AMSLogConfig sharedConfig];
          if (!v47)
          {
            v47 = +[AMSLogConfig sharedConfig];
          }
          v48 = [v47 OSLogObject];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = objc_opt_class();
            v50 = *(void **)(a1 + 32);
            id v51 = v49;
            v52 = [v50 logKey];
            *(_DWORD *)buf = 138543874;
            v65 = v49;
            __int16 v66 = 2114;
            v67 = v52;
            __int16 v68 = 2114;
            id v69 = v7;
            _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error performing fetching data: %{public}@", buf, 0x20u);
          }
          [v2 finishWithError:v7];
          v46 = 0;
          id v16 = v57;
        }
        id v53 = v2;
      }
    }
  }
  return v2;
}

- (id)_updateEndpointURLRequestWithError:(id *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v5 = [(AMSMercuryCacheFetchTask *)self bag];
  v6 = [v5 stringForKey:@"mercury-sync-media-api-url"];
  id v7 = [v6 valuePromise];
  id v60 = 0;
  v8 = [v7 resultWithError:&v60];
  id v9 = v60;

  v10 = [(AMSMercuryCacheFetchTask *)self bag];
  v11 = [v10 stringForKey:@"countryCode"];
  v12 = [v11 valuePromise];
  id v59 = v9;
  id v13 = [v12 resultWithError:&v59];
  id v14 = v59;

  id v15 = [(AMSMercuryCacheFetchTask *)self bag];
  id v16 = [v15 stringForKey:@"language-tag"];
  id v17 = [v16 valuePromise];
  id v58 = v14;
  v18 = [v17 resultWithError:&v58];
  id v19 = v58;

  if (v19)
  {
    id v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    objc_super v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      id v23 = v22;
      v24 = [(AMSMercuryCacheFetchTask *)self logKey];
      *(_DWORD *)buf = 138543874;
      id v62 = v22;
      __int16 v63 = 2114;
      v64 = v24;
      __int16 v65 = 2114;
      id v66 = v19;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error fetching bag values for url generation %{public}@", buf, 0x20u);
    }
    if (a3)
    {
      id v19 = v19;
      id v25 = 0;
      *a3 = v19;
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    v26 = [(AMSMercuryCacheFetchTask *)self cacheTypeIDs];
    v27 = [v26 allObjects];
    v28 = [v27 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    uint64_t v29 = [v28 componentsJoinedByString:@","];

    v57 = v13;
    v55 = [v8 stringByReplacingOccurrencesOfString:@"{cc}" withString:v13];
    v54 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v54 resolvingAgainstBaseURL:1];
    v31 = objc_opt_new();
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"l" value:v18];
    [v31 addObject:v32];

    v56 = (void *)v29;
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"kinds" value:v29];
    [v31 addObject:v33];

    id v34 = +[AMSMediaURLBuilderUtility devicePlatform];
    if (v34)
    {
      v35 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"platform" value:v34];
      [v31 addObject:v35];
    }
    [v30 setQueryItems:v31];
    id v53 = v30;
    id v36 = [v30 URL];
    if (v36)
    {
      id v25 = [MEMORY[0x1E4F18D50] requestWithURL:v36];
      [v25 setHTTPMethod:@"GET"];
      v37 = +[AMSLogConfig sharedConfig];
      if (!v37)
      {
        v37 = +[AMSLogConfig sharedConfig];
      }
      v38 = [v37 OSLogObject];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = objc_opt_class();
        id v49 = v39;
        v40 = [(AMSMercuryCacheFetchTask *)self logKey];
        AMSLogableURLRequest((uint64_t)v25);
        id v51 = v18;
        v42 = v41 = v8;
        *(_DWORD *)buf = 138543874;
        id v62 = v39;
        __int16 v63 = 2114;
        v64 = v40;
        __int16 v65 = 2114;
        id v66 = v42;
        _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request generated %{public}@", buf, 0x20u);

        v8 = v41;
        v18 = v51;
      }
      id v19 = 0;
    }
    else
    {
      AMSError(12, @"URL was not generated from components", @"No URL generated", 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v43 = +[AMSLogConfig sharedConfig];
      if (!v43)
      {
        v43 = +[AMSLogConfig sharedConfig];
      }
      id v44 = [v43 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v52 = v18;
        v45 = v8;
        v46 = objc_opt_class();
        id v50 = v46;
        v47 = [(AMSMercuryCacheFetchTask *)self logKey];
        *(_DWORD *)buf = 138543874;
        id v62 = v46;
        v8 = v45;
        v18 = v52;
        __int16 v63 = 2114;
        v64 = v47;
        __int16 v65 = 2114;
        id v66 = v19;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error fetching bag values for url generation %{public}@", buf, 0x20u);
      }
      if (a3)
      {
        id v19 = v19;
        id v25 = 0;
        *a3 = v19;
      }
      else
      {
        id v25 = 0;
      }
    }

    id v13 = v57;
  }

  return v25;
}

+ (id)requestEncoderWithSharedProperties:(id)a3 task:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [AMSMediaRequestEncoder alloc];
  v8 = [v6 tokenService];

  id v9 = [v5 bag];
  v10 = [(AMSMediaRequestEncoder *)v7 initWithTokenService:v8 bag:v9];

  v11 = [v5 account];
  [(AMSMediaRequestEncoder *)v10 setAccount:v11];

  v12 = [v5 clientInfo];

  [(AMSMediaRequestEncoder *)v10 setClientInfo:v12];
  id v13 = objc_alloc_init(AMSMediaResponseDecoder);
  [(AMSMediaRequestEncoder *)v10 setResponseDecoder:v13];

  return v10;
}

+ (id)sharedPropertiesFromTask:(id)a3
{
  return +[AMSMediaSharedProperties propertiesForMercuryCacheFetchTask:a3];
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_13 != -1) {
    dispatch_once(&_MergedGlobals_1_13, &__block_literal_global_82);
  }
  v2 = (void *)qword_1EB38D1A8;
  return (NSString *)v2;
}

void __41__AMSMercuryCacheFetchTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D1A8;
  qword_1EB38D1A8 = @"AMSMercuryCache";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D1B0 != -1) {
    dispatch_once(&qword_1EB38D1B0, &__block_literal_global_46);
  }
  v2 = (void *)qword_1EB38D1B8;
  return (NSString *)v2;
}

void __48__AMSMercuryCacheFetchTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D1B8;
  qword_1EB38D1B8 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSSet)cacheTypeIDs
{
  return self->_cacheTypeIDs;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
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
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheTypeIDs, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end