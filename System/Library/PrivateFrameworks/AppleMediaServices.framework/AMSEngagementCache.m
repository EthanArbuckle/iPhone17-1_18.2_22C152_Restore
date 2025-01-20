@interface AMSEngagementCache
+ (id)sharedInstance;
- (AMSEngagementCache)initWithFileURL:(id)a3;
- (AMSEngagementCacheDatabase)database;
- (NSMutableDictionary)regexCache;
- (id)cachedResponseForEvent:(id)a3;
- (void)cacheResponse:(id)a3 filter:(id)a4 expiration:(id)a5;
- (void)dealloc;
- (void)setDatabase:(id)a3;
- (void)setRegexCache:(id)a3;
@end

@implementation AMSEngagementCache

+ (id)sharedInstance
{
  if (qword_1EB38D878 != -1) {
    dispatch_once(&qword_1EB38D878, &__block_literal_global_46);
  }
  v2 = (void *)_MergedGlobals_102;
  return v2;
}

void __36__AMSEngagementCache_sharedInstance__block_invoke()
{
  id v3 = +[AMSDatabaseHelper databaseFolderNameForType:3];
  v0 = +[AMSDatabaseHelper databaseURLForCachePath:v3 type:3];
  v1 = [[AMSEngagementCache alloc] initWithFileURL:v0];
  v2 = (void *)_MergedGlobals_102;
  _MergedGlobals_102 = (uint64_t)v1;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedEngagementConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v5;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Closing database", buf, 0x16u);
  }
  database = self->_database;
  id v18 = 0;
  BOOL v8 = [(AMSEngagementCacheDatabase *)database closeWithError:&v18];
  id v9 = v18;
  uint64_t v10 = +[AMSLogConfig sharedEngagementConfig];
  v11 = (void *)v10;
  if (v8)
  {
    if (!v10)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Database is closed", buf, 0x16u);
LABEL_14:
    }
  }
  else
  {
    if (!v10)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      v14 = AMSLogKey();
      v16 = AMSHashIfNeeded(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to close database: %{public}@", buf, 0x20u);

      goto LABEL_14;
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)AMSEngagementCache;
  [(AMSEngagementCache *)&v17 dealloc];
}

- (void)cacheResponse:(id)a3 filter:(id)a4 expiration:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v39 = a5;
  uint64_t v10 = +[AMSLogConfig sharedEngagementConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = AMSLogKey();
    v14 = AMSHashIfNeeded(v8);
    AMSHashIfNeeded(v9);
    v16 = id v15 = v9;
    *(_DWORD *)buf = 138544130;
    uint64_t v44 = v12;
    __int16 v45 = 2114;
    v46 = v13;
    __int16 v47 = 2114;
    v48 = v14;
    __int16 v49 = 2114;
    v50 = v16;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caching (response: %{public}@, filter: %{public}@)", buf, 0x2Au);

    id v9 = v15;
  }

  id v42 = 0;
  objc_super v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:&v42];
  id v18 = v42;
  if (v17)
  {
    id v41 = v18;
    id v38 = v9;
    v19 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:&v41];
    id v20 = v41;

    if (!v19)
    {
      uint64_t v25 = +[AMSLogConfig sharedEngagementConfig];
      if (!v25)
      {
        uint64_t v25 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = objc_opt_class();
        v34 = AMSLogKey();
        v35 = AMSHashIfNeeded(v20);
        *(_DWORD *)buf = 138543874;
        uint64_t v44 = v33;
        __int16 v45 = 2114;
        v46 = v34;
        __int16 v47 = 2114;
        v48 = v35;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode filter: %{public}@", buf, 0x20u);
      }
      goto LABEL_26;
    }
    __int16 v21 = [(AMSEngagementCache *)self database];
    id v40 = v20;
    int v22 = [v21 insertResponseData:v17 filterData:v19 expiration:v39 error:&v40];
    id v23 = v40;

    uint64_t v24 = +[AMSLogConfig sharedEngagementConfig];
    uint64_t v25 = v24;
    if (v22)
    {
      if (!v24)
      {
        uint64_t v25 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      uint64_t v27 = objc_opt_class();
      v28 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v27;
      __int16 v45 = 2114;
      v46 = v28;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caching complete", buf, 0x16u);
    }
    else
    {
      if (!v24)
      {
        uint64_t v25 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      uint64_t v36 = objc_opt_class();
      v28 = AMSLogKey();
      v37 = AMSHashIfNeeded(v23);
      *(_DWORD *)buf = 138543874;
      uint64_t v44 = v36;
      __int16 v45 = 2114;
      v46 = v28;
      __int16 v47 = 2114;
      v48 = v37;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to insert response: %{public}@", buf, 0x20u);
    }
LABEL_25:
    id v20 = v23;
LABEL_26:

    id v18 = v20;
    id v9 = v38;
    goto LABEL_27;
  }
  v19 = +[AMSLogConfig sharedEngagementConfig];
  if (!v19)
  {
    v19 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v25 = [v19 OSLogObject];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = objc_opt_class();
    v30 = AMSLogKey();
    AMSHashIfNeeded(v18);
    v32 = id v31 = v9;
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v29;
    __int16 v45 = 2114;
    v46 = v30;
    __int16 v47 = 2114;
    v48 = v32;
    _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode response: %{public}@", buf, 0x20u);

    id v9 = v31;
  }
LABEL_27:
}

- (AMSEngagementCacheDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSMutableDictionary)regexCache
{
  return self->_regexCache;
}

- (void)setRegexCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexCache, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (AMSEngagementCache)initWithFileURL:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AMSEngagementCache;
  uint64_t v5 = [(AMSEngagementCache *)&v29 init];
  if (v5)
  {
    v6 = objc_alloc_init(AMSEngagementCacheDatabase);
    v7 = +[AMSLogConfig sharedEngagementConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      v11 = [v4 path];
      uint64_t v12 = AMSHashIfNeeded(v11);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v9;
      __int16 v32 = 2114;
      uint64_t v33 = v10;
      __int16 v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening database (path: %{public}@)", buf, 0x20u);
    }
    uint64_t v13 = [v4 path];
    id v28 = 0;
    BOOL v14 = [(AMSEngagementCacheDatabase *)v6 openAtPath:v13 error:&v28];
    id v15 = v28;

    uint64_t v16 = +[AMSLogConfig sharedEngagementConfig];
    objc_super v17 = (void *)v16;
    if (v14)
    {
      if (!v16)
      {
        objc_super v17 = +[AMSLogConfig sharedConfig];
      }
      id v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_opt_class();
        id v20 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v19;
        __int16 v32 = 2114;
        uint64_t v33 = v20;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Database is open", buf, 0x16u);
      }
      objc_storeStrong((id *)&v5->_database, v6);
      __int16 v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      regexCache = v5->_regexCache;
      v5->_regexCache = v21;
    }
    else
    {
      if (!v16)
      {
        objc_super v17 = +[AMSLogConfig sharedConfig];
      }
      id v23 = [v17 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = AMSLogKey();
        v26 = AMSHashIfNeeded(v15);
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v24;
        __int16 v32 = 2114;
        uint64_t v33 = v25;
        __int16 v34 = 2114;
        v35 = v26;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open database: %{public}@", buf, 0x20u);
      }
      regexCache = v5;
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (id)cachedResponseForEvent:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedEngagementConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Collecting garbage", buf, 0x16u);
  }
  uint64_t v9 = [(AMSEngagementCache *)self database];
  id v35 = 0;
  int v10 = [v9 collectGarbageWithError:&v35];
  id v11 = v35;

  uint64_t v12 = +[AMSLogConfig sharedEngagementConfig];
  uint64_t v13 = (void *)v12;
  if (v10)
  {
    if (!v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    BOOL v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Garbage collection is complete", buf, 0x16u);
    }
  }
  else
  {
    if (!v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    BOOL v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = AMSLogKey();
      AMSHashIfNeeded(v11);
      uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v37 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Failed to collect garbage: %{public}@", buf, 0x20u);
    }
  }

  id v20 = +[AMSLogConfig sharedEngagementConfig];
  if (!v20)
  {
    id v20 = +[AMSLogConfig sharedConfig];
  }
  __int16 v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = objc_opt_class();
    id v23 = AMSLogKey();
    AMSHashIfNeeded(v4);
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2114;
    v37 = v24;
    _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching cached response (event: %{public}@)", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__28;
  id v38 = __Block_byref_object_dispose__28;
  id v39 = 0;
  uint64_t v25 = [(AMSEngagementCache *)self database];
  v26 = [MEMORY[0x1E4F1C9C8] now];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __54__AMSEngagementCache_Project__cachedResponseForEvent___block_invoke;
  v32[3] = &unk_1E55A24C0;
  v32[4] = self;
  id v27 = v4;
  id v33 = v27;
  __int16 v34 = buf;
  id v31 = v11;
  [v25 selectWithExpirationDate:v26 handler:v32 error:&v31];
  id v28 = v31;

  id v29 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v29;
}

uint64_t __54__AMSEngagementCache_Project__cachedResponseForEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = 0;
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a2 options:0 error:&v26];
  id v7 = v26;
  if (v6)
  {
    id v25 = v7;
    id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v25];
    id v9 = v25;

    if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = [*(id *)(a1 + 32) regexCache];
      BOOL v12 = +[AMSEngagementAppEventFilterModel matchEvent:v10 toFilter:v8 withCache:v11];

      if (!v12)
      {
        uint64_t v23 = 1;
        goto LABEL_16;
      }
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = v6;
      uint64_t v15 = *(NSObject **)(v13 + 40);
      *(void *)(v13 + 40) = v14;
    }
    else
    {
      uint64_t v15 = +[AMSLogConfig sharedEngagementConfig];
      if (!v15)
      {
        uint64_t v15 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v19 = [v15 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = objc_opt_class();
        __int16 v21 = AMSLogKey();
        uint64_t v22 = AMSHashIfNeeded(v9);
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v20;
        __int16 v29 = 2114;
        v30 = v21;
        __int16 v31 = 2114;
        __int16 v32 = v22;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode filter: %{public}@", buf, 0x20u);
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = +[AMSLogConfig sharedEngagementConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v8 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = AMSLogKey();
      id v18 = AMSHashIfNeeded(v7);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v16;
      __int16 v29 = 2114;
      v30 = v17;
      __int16 v31 = 2114;
      __int16 v32 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode response: %{public}@", buf, 0x20u);
    }
    id v9 = v7;
  }

  uint64_t v23 = 0;
LABEL_16:

  return v23;
}

@end