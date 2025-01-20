@interface AMSMetricsTimingWindowStartTimeCleanUpMigrator
+ (void)cleanUpMetricsTimingWindowStartTimeUserDefaultWithOptions:(id)a3;
@end

@implementation AMSMetricsTimingWindowStartTimeCleanUpMigrator

+ (void)cleanUpMetricsTimingWindowStartTimeUserDefaultWithOptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a3 scenario] != 4)
  {
    v5 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    v8 = AMSLogKey();
    v9 = NSStringFromSelector(a2);
    int v11 = 138543874;
    id v12 = a1;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 2114;
    v16 = v9;
    v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
LABEL_20:
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0x20u);

    goto LABEL_21;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    v8 = AMSLogKey();
    v9 = NSStringFromSelector(a2);
    int v11 = 138543874;
    id v12 = a1;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 2114;
    v16 = v9;
    v10 = "%{public}@: [%{public}@] %{public}@ skipping. Per-host Load URL sampling feature is not enabled.";
    goto LABEL_20;
  }
  if (CFPreferencesCopyAppValue(@"AMSMetricsTimingWindowStartTime", @"com.apple.AppleMediaServices"))
  {
    CFPreferencesSetAppValue(@"AMSMetricsTimingWindowStartTime", 0, @"com.apple.AppleMediaServices");
    v5 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = AMSLogKey();
      int v11 = 138543618;
      id v12 = a1;
      __int16 v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deleted value for key AMSMetricsTimingWindowStartTime from user defaults.", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_21;
  }
  v5 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = AMSLogKey();
    v9 = NSStringFromSelector(a2);
    int v11 = 138543874;
    id v12 = a1;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 2114;
    v16 = v9;
    v10 = "%{public}@: [%{public}@] %{public}@ skipping. User default to be removed is not present.";
    goto LABEL_20;
  }
LABEL_21:
}

@end