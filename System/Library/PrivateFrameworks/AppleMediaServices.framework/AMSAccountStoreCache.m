@interface AMSAccountStoreCache
+ (AMSThreadSafeDictionary)cache;
+ (id)accountStoreForMediaType:(id)a3;
+ (id)mediaTypeForAccountStore:(id)a3;
+ (void)_resetAccountStoreCache;
@end

@implementation AMSAccountStoreCache

+ (id)mediaTypeForAccountStore:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(a1, "cache", 0);
  v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      v12 = [a1 cache];
      id v13 = [v12 objectForKeyedSubscript:v11];

      if (v13 == v4) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v14 = +[AMSProcessInfo defaultMediaTypeForCurrentProcess];
LABEL_12:

  return v14;
}

+ (AMSThreadSafeDictionary)cache
{
  if (_MergedGlobals_78 != -1) {
    dispatch_once(&_MergedGlobals_78, &__block_literal_global_4);
  }
  v2 = (void *)qword_1EB38D5C8;
  return (AMSThreadSafeDictionary *)v2;
}

uint64_t __29__AMSAccountStoreCache_cache__block_invoke()
{
  qword_1EB38D5C8 = objc_alloc_init(AMSThreadSafeDictionary);
  return MEMORY[0x1F41817F8]();
}

+ (id)accountStoreForMediaType:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    id v25 = 0;
    v6 = [a1 cache];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__AMSAccountStoreCache_accountStoreForMediaType___block_invoke;
    v18[3] = &unk_1E559EB30;
    v20 = buf;
    id v19 = v5;
    id v21 = a1;
    [v6 readWrite:v18];

    id v7 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = AMSLogKey();
      v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        id v14 = AMSLogKey();
        v15 = [v11 stringWithFormat:@"%@: [%@] ", v13, v14];
      }
      else
      {
        v15 = [v11 stringWithFormat:@"%@: ", v12];
        id v14 = v15;
      }
      long long v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@%{public}@ was passed a nil media type. Returning an ACAccountStore that isn't associated with any media type.", buf, 0x16u);
      if (v10) {
    }
      }
    if (+[AMSUnitTests isRunningUnitTests]) {
      objc_msgSend(MEMORY[0x1E4F179C8], "_ams_newAccountStore");
    }
    else {
      objc_msgSend(MEMORY[0x1E4F179C8], "_ams_defaultAccountStore");
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __49__AMSAccountStoreCache_accountStoreForMediaType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v9 = +[AMSLogConfig sharedAccountsConfig];
  uint64_t v10 = (void *)v9;
  if (v8)
  {
    if (!v9)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = AMSLogKey();
      uint64_t v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v14;
      if (v12)
      {
        uint64_t v2 = AMSLogKey();
        [v13 stringWithFormat:@"%@: [%@] ", v15, v2];
      }
      else
      {
        [v13 stringWithFormat:@"%@: ", v14];
      long long v16 = };
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v30 = v16;
      __int16 v31 = 2114;
      uint64_t v32 = v23;
      __int16 v33 = 2114;
      uint64_t v34 = v24;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_INFO, "%{public}@Found an existing ACAccountStore for a media type. mediaType = %{public}@ | accountStore = %{public}@", buf, 0x20u);
      if (v12)
      {

        long long v16 = (void *)v2;
      }
    }
  }
  else
  {
    if (!v9)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    long long v17 = [v10 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = AMSLogKey();
      id v19 = NSString;
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = v20;
      if (v18)
      {
        uint64_t v2 = AMSLogKey();
        [v19 stringWithFormat:@"%@: [%@] ", v21, v2];
      }
      else
      {
        [v19 stringWithFormat:@"%@: ", v20];
      v22 = };
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      __int16 v31 = 2114;
      uint64_t v32 = v25;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Creating a new ACAccountStore for a media type. mediaType = %{public}@", buf, 0x16u);
      if (v18)
      {

        v22 = (void *)v2;
      }
    }
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F179C8], "_ams_newAccountStore");
    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    [v4 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

+ (void)_resetAccountStoreCache
{
  id v2 = [a1 cache];
  [v2 removeAllObjects];
}

@end