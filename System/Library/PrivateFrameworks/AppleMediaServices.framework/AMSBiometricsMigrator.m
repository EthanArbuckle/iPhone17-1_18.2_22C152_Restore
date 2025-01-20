@interface AMSBiometricsMigrator
+ (void)migrateBiometricStateWithOptions:(id)a3;
@end

@implementation AMSBiometricsMigrator

+ (void)migrateBiometricStateWithOptions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = AMSSetLogKeyIfNeeded();
  if ([v3 scenario] != 4)
  {
    v6 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v6 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      v17 = (void *)MEMORY[0x1E4F28ED0];
      id v18 = v16;
      v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v3, "scenario"));
      int v31 = 138543874;
      id v32 = v16;
      __int16 v33 = 2114;
      v34 = v4;
      __int16 v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric state migration for no upgrade scenario: %{public}@", (uint8_t *)&v31, 0x20u);
    }
    goto LABEL_25;
  }
  CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  v5 = (void *)CFPreferencesCopyAppValue(@"AMSDeviceBiometricsState", @"com.apple.AppleMediaServices");
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v20 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138543618;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2114;
      v34 = v4;
      id v22 = v32;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric state migration for NULL AMS biometric state", (uint8_t *)&v31, 0x16u);
    }
    v6 = v5;
    goto LABEL_26;
  }
  v6 = (void *)CFPreferencesCopyAppValue(@"BiometricState", @"com.apple.itunesstored");

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v15 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138543618;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2114;
      v34 = v4;
      id v24 = v32;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric state migration for NULL iTunes biometric state", (uint8_t *)&v31, 0x16u);
    }
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v7 = [v6 integerValue];
  v8 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    v11 = (void *)MEMORY[0x1E4F28ED0];
    id v12 = v10;
    v13 = [v11 numberWithInteger:v7];
    int v31 = 138543874;
    id v32 = v10;
    __int16 v33 = 2114;
    v34 = v4;
    __int16 v35 = 2114;
    v36 = v13;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Migrating legacy StoreServices biometric state %{public}@ to AMS", (uint8_t *)&v31, 0x20u);
  }
  if (v7 == 1)
  {
    uint64_t v14 = 2;
  }
  else
  {
    if (v7 != 2) {
      goto LABEL_26;
    }
    uint64_t v14 = 1;
  }
  v25 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v25)
  {
    v25 = +[AMSLogConfig sharedConfig];
  }
  v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_opt_class();
    v28 = (void *)MEMORY[0x1E4F28ED0];
    id v29 = v27;
    v30 = [v28 numberWithInteger:v14];
    int v31 = 138543874;
    id v32 = v27;
    __int16 v33 = 2114;
    v34 = v4;
    __int16 v35 = 2114;
    v36 = v30;
    _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing new AMS biometric state: %{public}@", (uint8_t *)&v31, 0x20u);
  }
  CFPreferencesSetAppValue(@"AMSDeviceBiometricsState", (CFPropertyListRef)[MEMORY[0x1E4F28ED0] numberWithInteger:v14], @"com.apple.AppleMediaServices");
  CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
LABEL_26:
}

@end