@interface NSURL(AppleMediaServices)
+ (id)ams_cachesDirectory;
+ (id)ams_dataVaultDirectory;
+ (id)ams_dynamicUIDirectory;
+ (id)ams_engagementDirectory;
+ (id)ams_unescapedStringForString:()AppleMediaServices;
- (id)ams_parameters;
- (id)ams_unmodifiedParameters;
- (uint64_t)ams_URLByReplaceingQueryParameters:()AppleMediaServices;
@end

@implementation NSURL(AppleMediaServices)

- (id)ams_unmodifiedParameters
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = objc_msgSend(v3, "percentEncodedQueryItems", 0);
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 name];
        if ([v13 length])
        {
          v14 = [v12 value];
          uint64_t v15 = [v14 length];

          if (!v15) {
            continue;
          }
          v13 = [v12 value];
          v16 = [v12 name];
          [v2 setObject:v13 forKeyedSubscript:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v2;
}

+ (id)ams_engagementDirectory
{
  v1 = objc_msgSend(a1, "ams_cachesDirectory");
  id v2 = [v1 URLByAppendingPathComponent:@"Engagement"];

  return v2;
}

+ (id)ams_dataVaultDirectory
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (+[AMSProcessInfo BOOLForEntitlement:@"com.apple.private.security.storage.AppleMediaServices"])
  {
    id v2 = objc_msgSend(a1, "ams_realHomeDirectory");
    v3 = [v2 stringByAppendingPathComponent:@"/Library/AppleMediaServices"];
    uint64_t v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      uint64_t v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = objc_opt_class();
      id v7 = AMSHashIfNeeded(v3);
      uint64_t v8 = AMSHashIfNeeded(v2);
      uint64_t v9 = AMSHashIfNeeded(@"/Library/AppleMediaServices");
      *(_DWORD *)buf = 138544130;
      uint64_t v27 = v6;
      __int16 v28 = 2114;
      v29 = v7;
      __int16 v30 = 2114;
      v31 = v8;
      __int16 v32 = 2114;
      v33 = v9;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: Computed data vault path is %{public}@. homeDirectory = %{public}@ | relativeDirectory = %{public}@", buf, 0x2Au);
    }
    if (v3)
    {
      id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
      v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      v12 = [v10 path];
      id v25 = 0;
      char v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v25];
      v14 = v25;

      uint64_t v15 = +[AMSLogConfig sharedConfig];
      v16 = (void *)v15;
      if (v13)
      {
        if (!v15)
        {
          v16 = +[AMSLogConfig sharedConfig];
        }
        v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = objc_opt_class();
          long long v19 = AMSHashIfNeeded(v10);
          *(_DWORD *)buf = 138543618;
          uint64_t v27 = v18;
          __int16 v28 = 2114;
          v29 = v19;
          _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_INFO, "%{public}@: Successfully created data vault directory (or it already exists). dataVaultURL = %{public}@", buf, 0x16u);
        }
        id v10 = v10;
        long long v20 = v10;
        goto LABEL_28;
      }
      if (!v15)
      {
        v16 = +[AMSLogConfig sharedConfig];
      }
      v22 = [v16 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v23;
        __int16 v28 = 2114;
        v29 = v14;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create data vault directory. %{public}@", buf, 0x16u);
      }
    }
    else
    {
      id v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v10 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v21;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Could not compute data vault path.", buf, 0xCu);
      }
    }
    long long v20 = 0;
LABEL_28:

    goto LABEL_29;
  }
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = objc_opt_class();
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Cannot access data vault. Current process does not have the correct entitlement.", buf, 0xCu);
  }
  long long v20 = 0;
LABEL_29:

  return v20;
}

+ (id)ams_cachesDirectory
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(a1, "ams_realHomeDirectory");
  v3 = [v2 stringByAppendingPathComponent:@"/Library/Caches/com.apple.AppleMediaServices"];

  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v3)
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
    if (v5)
    {
      id v26 = 0;
      int v6 = [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v26];
      id v7 = v26;
      if (!v6)
      {
LABEL_7:
        uint64_t v8 = +[AMSLogConfig sharedConfig];
        if (!v8)
        {
          uint64_t v8 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v9 = [v8 OSLogObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          uint64_t v28 = v10;
          __int16 v29 = 2114;
          id v30 = v7;
          _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create caches directory. %{public}@", buf, 0x16u);
        }

        goto LABEL_12;
      }
    }
    else
    {
      id v7 = 0;
    }
    if ([v4 isWritableFileAtPath:v3]) {
      goto LABEL_28;
    }
    goto LABEL_7;
  }
LABEL_12:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NSURL_AppleMediaServices__ams_cachesDirectory__block_invoke;
  block[3] = &unk_1E55A1998;
  id v25 = a1;
  id v11 = v3;
  id v24 = v11;
  if (ams_cachesDirectory_onceToken[0] != -1) {
    dispatch_once(ams_cachesDirectory_onceToken, block);
  }
  v12 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];
  v5 = [v12 URLByAppendingPathComponent:@"com.apple.AppleMediaServices"];

  if (v5)
  {
    id v22 = 0;
    char v13 = [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v14 = v22;
    if ((v13 & 1) == 0)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
      if (!v15)
      {
        uint64_t v15 = +[AMSLogConfig sharedConfig];
      }
      v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v17;
        __int16 v29 = 2114;
        id v30 = v14;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create caches directory. %{public}@", buf, 0x16u);
      }
    }
    id v18 = v5;
  }
  else
  {
    id v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    long long v19 = [v14 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      id v30 = v11;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Could not create caches URL from caches path: %{public}@", buf, 0x16u);
    }
  }
  id v7 = v24;
LABEL_28:

  return v5;
}

- (id)ams_parameters
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = objc_msgSend(v3, "queryItems", 0);
  v5 = (void *)v4;
  int v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    int v6 = (void *)v4;
  }
  id v7 = v6;

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = [v12 name];
        if ([v13 length])
        {
          id v14 = [v12 value];
          uint64_t v15 = [v14 length];

          if (!v15) {
            continue;
          }
          char v13 = [v12 value];
          v16 = [v12 name];
          [v2 setObject:v13 forKeyedSubscript:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v2;
}

+ (id)ams_dynamicUIDirectory
{
  v1 = objc_msgSend(a1, "ams_cachesDirectory");
  id v2 = [v1 URLByAppendingPathComponent:@"DynamicUI"];

  return v2;
}

+ (id)ams_unescapedStringForString:()AppleMediaServices
{
  id v3 = a3;
  uint64_t v4 = v3;
  if ([v3 length])
  {
    uint64_t v4 = [v3 stringByRemovingPercentEncoding];
  }
  return v4;
}

- (uint64_t)ams_URLByReplaceingQueryParameters:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_URLByReplaceingQueryParameters:withEncodedParameters:", a3, 0);
}

@end