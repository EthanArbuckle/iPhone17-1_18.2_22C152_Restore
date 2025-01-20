@interface HMBSQLFile
+ (NSHashTable)contexts;
+ (id)_openContextWithURL:(id)a3 usingSubclass:(Class)a4 error:(id *)a5;
+ (id)openContextWithURL:(id)a3 usingSubclass:(Class)a4 error:(id *)a5;
+ (void)_close:(id)a3;
+ (void)close:(id)a3;
+ (void)removeDatastoreAtURL:(id)a3;
@end

@implementation HMBSQLFile

+ (void)_close:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&contextLock);
  if ([v4 connection])
  {
    v5 = (void *)MEMORY[0x1D944CB30]();
    v6 = (os_unfair_lock_s *)v4;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v8;
      __int16 v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Closing SQL context: %@", buf, 0x16u);
    }
    v9 = [a1 contexts];
    [v9 removeObject:v6];

    os_unfair_lock_lock_with_options();
    [(os_unfair_lock_s *)v6 finalize];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v10 = objc_msgSend(a1, "contexts", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v15 = [v14 connection];
          if (v15 == [(os_unfair_lock_s *)v6 connection])
          {
            v26 = (void *)MEMORY[0x1D944CB30]();
            v27 = v6;
            HMFGetOSLogHandle();
            v28 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v35 = v29;
              __int16 v36 = 2112;
              v37 = v14;
              _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Found other context still using database: %@", buf, 0x16u);
            }

            goto LABEL_21;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v16 = (void *)MEMORY[0x1D944CB30]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v19;
      _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Closing database for SQL context", buf, 0xCu);
    }
    int v20 = sqlite3_close((sqlite3 *)[(os_unfair_lock_s *)v17 connection]);
    if (v20)
    {
      v21 = (void *)MEMORY[0x1D944CB30]();
      v22 = v17;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = sqlite3_errstr(v20);
        *(_DWORD *)buf = 138543874;
        id v35 = v24;
        __int16 v36 = 2080;
        v37 = (void *)v25;
        __int16 v38 = 1024;
        int v39 = v20;
        _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to close database: %s (%d)", buf, 0x1Cu);
      }
    }
LABEL_21:
    [(os_unfair_lock_s *)v6 setConnection:0];
    os_unfair_lock_unlock(v6 + 2);
  }
  else
  {
    [v4 setFinalized:1];
  }
}

+ (void)close:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [a1 _close:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);
}

+ (id)_openContextWithURL:(id)a3 usingSubclass:(Class)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&contextLock);
  if (_openContextWithURL_usingSubclass_error__dispatchOnce != -1) {
    dispatch_once(&_openContextWithURL_usingSubclass_error__dispatchOnce, &__block_literal_global_9);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v8 = [a1 contexts];
  uint64_t v9 = [(os_unfair_lock_s *)v8 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v13 = [v12 url];
        int v14 = [v13 isEqual:v7];

        if (v14)
        {
          if ((Class)objc_opt_class() != a4)
          {
            objc_opt_class();
            _HMFPreconditionFailureWithFormat();
            __break(1u);
          }
          long long v30 = (void *)MEMORY[0x1D944CB30]();
          long long v31 = v12;
          long long v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            long long v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v44 = v33;
            __int16 v45 = 2112;
            v46 = v31;
            _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Found existing SQL context: %@", buf, 0x16u);
          }
          v29 = v31;
          goto LABEL_26;
        }
      }
      uint64_t v9 = [(os_unfair_lock_s *)v8 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = [a4 alloc];
  v16 = [v7 absoluteURL];
  v17 = (void *)[v15 initWithURL:v16];

  v18 = (void *)MEMORY[0x1D944CB30]();
  v19 = v17;
  int v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v44 = v21;
    _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Opening SQL context", buf, 0xCu);
  }
  v22 = v19 + 2;
  os_unfair_lock_lock_with_options();
  id v38 = 0;
  int v23 = __open(v19, &v38);
  id v24 = v38;
  v25 = (void *)MEMORY[0x1D944CB30]();
  v8 = v19;
  if (v23)
  {
    HMFGetOSLogHandle();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      __int16 v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Opened SQL context with new sqlite database handle: %@", buf, 0x16u);
    }
    os_unfair_lock_unlock(v22);
    v28 = [a1 contexts];
    [v28 addObject:v8];

    v29 = v8;
  }
  else
  {
    HMFGetOSLogHandle();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v44 = v35;
      __int16 v45 = 2112;
      v46 = v8;
      __int16 v47 = 2112;
      id v48 = v24;
      _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to open context %@: %@", buf, 0x20u);
    }
    os_unfair_lock_unlock(v22);
    [a1 _close:v8];
    v29 = 0;
    if (a5) {
      *a5 = v24;
    }
  }

LABEL_26:
  return v29;
}

+ (id)openContextWithURL:(id)a3 usingSubclass:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [a1 _openContextWithURL:v8 usingSubclass:a4 error:a5];
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);

  return v9;
}

+ (void)removeDatastoreAtURL:(id)a3
{
}

+ (NSHashTable)contexts
{
  if (contexts_dispatchOnce != -1) {
    dispatch_once(&contexts_dispatchOnce, &__block_literal_global_7256);
  }
  v2 = (void *)contexts_contexts;
  return (NSHashTable *)v2;
}

uint64_t __22__HMBSQLFile_contexts__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v1 = contexts_contexts;
  contexts_contexts = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end