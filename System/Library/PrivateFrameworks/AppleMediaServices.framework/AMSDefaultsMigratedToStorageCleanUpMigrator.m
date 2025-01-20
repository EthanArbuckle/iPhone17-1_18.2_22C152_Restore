@interface AMSDefaultsMigratedToStorageCleanUpMigrator
+ (void)cleanUpUserDefaultsStorageWithOptions:(id)a3;
@end

@implementation AMSDefaultsMigratedToStorageCleanUpMigrator

+ (void)cleanUpUserDefaultsStorageWithOptions:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 scenario] == 4)
  {
    if (+[AMSDefaults cleanedUpUserDefaultsDataAfterMigrationToStorage])
    {
      v5 = +[AMSLogConfig sharedDataMigrationConfig];
      if (!v5)
      {
        v5 = +[AMSLogConfig sharedConfig];
      }
      v6 = [(AMSStorageDatabase *)v5 OSLogObject];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      NSStringFromSelector(a2);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v7;
      __int16 v60 = 2114;
      v61 = v8;
      __int16 v62 = 2114;
      CFStringRef v63 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. This migration has already been performed.";
      goto LABEL_11;
    }
    if (!+[AMSStorageDatabase isFeatureSupported])
    {
      v5 = +[AMSLogConfig sharedDataMigrationConfig];
      if (!v5)
      {
        v5 = +[AMSLogConfig sharedConfig];
      }
      v6 = [(AMSStorageDatabase *)v5 OSLogObject];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v47 = objc_opt_class();
      v8 = AMSLogKey();
      NSStringFromSelector(a2);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v47;
      __int16 v60 = 2114;
      v61 = v8;
      __int16 v62 = 2114;
      CFStringRef v63 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. AMSStorage database feature is not enabled.";
      v12 = v6;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_12;
    }
    v5 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
    v14 = off_1E559C000;
    v15 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    id v48 = v4;
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = v17;
      __int16 v60 = 2114;
      v61 = v18;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Deleting any leftover values from user defaults.", buf, 0x16u);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v51 = [&unk_1EDD01978 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (!v51)
    {
LABEL_55:
      +[AMSDefaults setCleanedUpUserDefaultsDataAfterMigrationToStorage:1];
      id v4 = v48;
      goto LABEL_14;
    }
    uint64_t v50 = *(void *)v55;
    v49 = v5;
LABEL_22:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v55 != v50) {
        objc_enumerationMutation(&unk_1EDD01978);
      }
      CFStringRef v20 = *(const __CFString **)(*((void *)&v54 + 1) + 8 * v19);
      v21 = (void *)MEMORY[0x192FA47D0]();
      v22 = (void *)CFPreferencesCopyAppValue(v20, @"com.apple.AppleMediaServices");
      if (!v22) {
        goto LABEL_53;
      }
      v23 = [(__objc2_class *)v14[17] sharedDataMigrationConfig];
      if (!v23)
      {
        v23 = [(__objc2_class *)v14[17] sharedConfig];
      }
      v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = objc_opt_class();
        v26 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v25;
        __int16 v60 = 2114;
        v61 = v26;
        __int16 v62 = 2112;
        CFStringRef v63 = v20;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Found value for key %@.", buf, 0x20u);
      }
      id v53 = 0;
      v27 = [(AMSStorageDatabase *)v5 valueForKey:v20 error:&v53];
      id v28 = v53;
      v29 = v28;
      if (!v27) {
        break;
      }
LABEL_48:
      CFPreferencesSetAppValue(v20, 0, @"com.apple.AppleMediaServices");
      v43 = [(__objc2_class *)v14[17] sharedDataMigrationConfig];
      if (!v43)
      {
        v43 = [(__objc2_class *)v14[17] sharedConfig];
      }
      v44 = [v43 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = objc_opt_class();
        v46 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v45;
        v5 = v49;
        __int16 v60 = 2114;
        v61 = v46;
        __int16 v62 = 2112;
        CFStringRef v63 = v20;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deleted value for key %@ from user defaults.", buf, 0x20u);

        v14 = off_1E559C000;
      }

LABEL_53:
      if (v51 == ++v19)
      {
        uint64_t v51 = [&unk_1EDD01978 countByEnumeratingWithState:&v54 objects:v66 count:16];
        if (!v51) {
          goto LABEL_55;
        }
        goto LABEL_22;
      }
    }
    int v30 = objc_msgSend(v28, "ams_hasDomain:code:", @"AMSErrorDomain", 7);
    uint64_t v31 = [(__objc2_class *)v14[17] sharedDataMigrationConfig];
    v32 = (void *)v31;
    if (v30)
    {
      if (!v31)
      {
        v32 = +[AMSLogConfig sharedConfig];
      }
      v33 = [v32 OSLogObject];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = objc_opt_class();
        v35 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v34;
        __int16 v60 = 2114;
        v61 = v35;
        __int16 v62 = 2112;
        CFStringRef v63 = v20;
        _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Value for key %@ not present in the AMSStorage database, saving to AMSStorage database prior to deleting from defaults.", buf, 0x20u);

        v5 = v49;
      }

      id v52 = v29;
      BOOL v36 = [(AMSStorageDatabase *)v5 setValue:v22 forKey:v20 error:&v52];
      id v37 = v52;

      if (v36) {
        goto LABEL_47;
      }
      v32 = +[AMSLogConfig sharedDataMigrationConfig];
      if (!v32)
      {
        v32 = +[AMSLogConfig sharedConfig];
      }
      v38 = [v32 OSLogObject];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = objc_opt_class();
        v40 = AMSLogKey();
        *(_DWORD *)buf = 138544130;
        uint64_t v59 = v39;
        v5 = v49;
        __int16 v60 = 2114;
        v61 = v40;
        __int16 v62 = 2112;
        CFStringRef v63 = v20;
        __int16 v64 = 2114;
        id v65 = v37;
        _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set value for key %@ in AMSStorage database, error = %{public}@. Proceeding to delete value from defaults regardless.", buf, 0x2Au);
      }
    }
    else
    {
      if (!v31)
      {
        v32 = +[AMSLogConfig sharedConfig];
      }
      v38 = [v32 OSLogObject];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = objc_opt_class();
        v42 = AMSLogKey();
        *(_DWORD *)buf = 138544130;
        uint64_t v59 = v41;
        __int16 v60 = 2114;
        v61 = v42;
        __int16 v62 = 2112;
        CFStringRef v63 = v20;
        __int16 v64 = 2114;
        id v65 = v29;
        _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verify presence of value for key %@ in AMSStorage database, error = %{public}@. Proceeding to delete value from defaults regardless.", buf, 0x2Au);

        v5 = v49;
      }
      id v37 = v29;
    }

LABEL_47:
    v29 = v37;
    v14 = off_1E559C000;
    goto LABEL_48;
  }
  v5 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [(AMSStorageDatabase *)v5 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_13;
  }
  uint64_t v11 = objc_opt_class();
  v8 = AMSLogKey();
  NSStringFromSelector(a2);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543874;
  uint64_t v59 = v11;
  __int16 v60 = 2114;
  v61 = v8;
  __int16 v62 = 2114;
  CFStringRef v63 = v9;
  v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
LABEL_11:
  v12 = v6;
  os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_12:
  _os_log_impl(&dword_18D554000, v12, v13, v10, buf, 0x20u);

LABEL_13:
LABEL_14:
}

@end