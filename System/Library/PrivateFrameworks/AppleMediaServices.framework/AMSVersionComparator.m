@interface AMSVersionComparator
+ (BOOL)isVersionSupported:(id)a3 requiredVersion:(id)a4;
+ (id)_sanitizedVersionStringForVersionString:(id)a3;
@end

@implementation AMSVersionComparator

+ (BOOL)isVersionSupported:(id)a3 requiredVersion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [a1 _sanitizedVersionStringForVersionString:v6];
    v10 = [a1 _sanitizedVersionStringForVersionString:v8];
    BOOL v11 = [v10 compare:v9 options:64] != 1;
  }
  else
  {
    v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%@: Comparing version strings with nil: candidate: %@, required: %@", (uint8_t *)&v15, 0x20u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

+ (id)_sanitizedVersionStringForVersionString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"."];
  if ((unint64_t)[v4 count] < 2)
  {
    id v7 = v3;
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__AMSVersionComparator__sanitizedVersionStringForVersionString___block_invoke;
    v12[3] = &unk_1E559EE28;
    id v13 = v5;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v12];
    id v7 = [v6 componentsJoinedByString:@"."];

    if (v7) {
      goto LABEL_10;
    }
  }
  v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to sanitize version string: %{public}@", buf, 0x16u);
  }

LABEL_10:
  return v7;
}

void __64__AMSVersionComparator__sanitizedVersionStringForVersionString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSString;
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  id v5 = [v3 stringWithFormat:@"%@", v4];

  [*(id *)(a1 + 32) addObject:v5];
}

@end