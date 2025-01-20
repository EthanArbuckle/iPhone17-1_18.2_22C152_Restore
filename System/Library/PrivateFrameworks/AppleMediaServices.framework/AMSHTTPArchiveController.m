@interface AMSHTTPArchiveController
+ (BOOL)_disabled;
+ (BOOL)_shouldAddRequest:(id)a3;
+ (BOOL)isRemoveDisabled;
+ (NSNumber)maxBufferSizeOverride;
+ (id)_harURLFilters;
+ (id)harURLFilters;
+ (void)_updateHarFileFilters;
+ (void)addHTTPArchive:(id)a3;
+ (void)initialize;
+ (void)setRemoveDisabled:(BOOL)a3;
@end

@implementation AMSHTTPArchiveController

+ (id)harURLFilters
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AMSHTTPArchiveController_harURLFilters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB38D970 != -1) {
    dispatch_once(&qword_1EB38D970, block);
  }
  v2 = (void *)qword_1EB38D968;
  return v2;
}

+ (BOOL)_disabled
{
  if (qword_1EB38D978 != -1) {
    dispatch_once(&qword_1EB38D978, &__block_literal_global_65);
  }
  return _MergedGlobals_113;
}

+ (void)initialize
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_AMSHTTPArchiveControllerUpdateHarURLFilters, @"AMSUpdateHARFiltersNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t __41__AMSHTTPArchiveController_harURLFilters__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHarFileFilters];
}

+ (BOOL)isRemoveDisabled
{
  id v2 = a1;
  objc_sync_enter(v2);
  char v3 = AMSHTTPArchiveControllerRemoveDisabled;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setRemoveDisabled:(BOOL)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  AMSHTTPArchiveControllerRemoveDisabled = a3;
  objc_sync_exit(obj);
}

+ (NSNumber)maxBufferSizeOverride
{
  return (NSNumber *)&unk_1EDD01348;
}

+ (void)addHTTPArchive:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AMSSetLogKeyIfNeeded();
  if (![a1 _disabled])
  {
    uint64_t v10 = [a1 harURLFilters];
    if (v10
      && (v11 = (void *)v10,
          [a1 harURLFilters],
          v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 count],
          v12,
          v11,
          v13))
    {
      if (![a1 _shouldAddRequest:v4]) {
        goto LABEL_25;
      }
      v14 = +[AMSLogConfig sharedConfig];
      if (!v14)
      {
        v14 = +[AMSLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = objc_opt_class();
        v17 = [v4 urlString];
        v18 = AMSHashIfNeeded(v17);
        v19 = [a1 harURLFilters];
        int v29 = 138544130;
        uint64_t v30 = v16;
        __int16 v31 = 2114;
        v32 = v5;
        __int16 v33 = 2114;
        v34 = v18;
        __int16 v35 = 2114;
        v36 = v19;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Write HTTP Archive to disk for URL string: %{public}@ with HAR URL Filters: %{public}@", (uint8_t *)&v29, 0x2Au);
      }
    }
    else
    {
      if (!+[AMSDefaults streamHARToDisk])
      {
        v20 = +[AMSProcessInfo currentProcess];
        v21 = [v20 executableName];
        char v22 = [v21 isEqualToString:@"amstoold"];

        if (v22)
        {
          v6 = +[AMSLogConfig sharedConfig];
          if (!v6)
          {
            v6 = +[AMSLogConfig sharedConfig];
          }
          v7 = [v6 OSLogObject];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = objc_opt_class();
            v24 = [v4 urlString];
            v25 = AMSHashIfNeeded(v24);
            int v29 = 138543874;
            uint64_t v30 = v23;
            __int16 v31 = 2114;
            v32 = v5;
            __int16 v33 = 2114;
            v34 = v25;
            _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Skipping HTTP Archive, we should not hit this path. URL: %{public}@", (uint8_t *)&v29, 0x20u);
          }
          goto LABEL_6;
        }
      }
      v14 = +[AMSLogConfig sharedConfig];
      if (!v14)
      {
        v14 = +[AMSLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_opt_class();
        v27 = [v4 urlString];
        v28 = AMSHashIfNeeded(v27);
        int v29 = 138543874;
        uint64_t v30 = v26;
        __int16 v31 = 2114;
        v32 = v5;
        __int16 v33 = 2114;
        v34 = v28;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Write HTTP Archive to disk for URL string: %{public}@", (uint8_t *)&v29, 0x20u);
      }
    }

    [v4 writeToDiskWithError:0 compressed:0];
    goto LABEL_25;
  }
  v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = AMSLogKey();
    int v29 = 138543618;
    uint64_t v30 = v8;
    __int16 v31 = 2114;
    v32 = v9;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error adding HAR, disabled", (uint8_t *)&v29, 0x16u);
  }
LABEL_6:

LABEL_25:
}

void __37__AMSHTTPArchiveController__disabled__block_invoke()
{
  if (+[AMSUnitTests isRunningUnitTests]
    || !os_variant_has_internal_content()
    || +[AMSDefaults disableHARLogging]
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        v0 = objc_claimAutoreleasedReturnValue(),
        +[AMSHTTPArchive directory],
        v1 = objc_claimAutoreleasedReturnValue(),
        char v2 = [v0 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:0],
        v1,
        v0,
        (v2 & 1) == 0))
  {
    _MergedGlobals_113 = 1;
  }
}

+ (id)_harURLFilters
{
  if ([a1 _disabled])
  {
    char v2 = 0;
    goto LABEL_12;
  }
  char v3 = +[AMSDefaults harURLFilters];
  id v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  v5 = [v3 objectForKeyedSubscript:@"*"];

  if (!v5)
  {
    v6 = +[AMSProcessInfo currentProcess];
    v7 = [v6 bundleIdentifier];

    if (v7)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:v7];

      if (v8)
      {
        char v2 = [v4 objectForKeyedSubscript:v7];

        goto LABEL_11;
      }
    }

LABEL_10:
    char v2 = 0;
    goto LABEL_11;
  }
  char v2 = [v4 objectForKeyedSubscript:@"*"];
LABEL_11:

LABEL_12:
  return v2;
}

+ (BOOL)_shouldAddRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 urlString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (id)qword_1EB38D968;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v11 = objc_msgSend(v3, "urlString", (void)v13);
          LOBYTE(v10) = [v11 containsString:v10];

          if (v10)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

+ (void)_updateHarFileFilters
{
  id obj = a1;
  objc_sync_enter(obj);
  uint64_t v2 = [obj _harURLFilters];
  id v3 = (void *)qword_1EB38D968;
  qword_1EB38D968 = v2;

  objc_sync_exit(obj);
}

@end