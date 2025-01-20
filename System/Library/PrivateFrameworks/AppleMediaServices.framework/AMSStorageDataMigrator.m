@interface AMSStorageDataMigrator
+ (void)_migrateDeviceOfferEligibilityWithDatabase:(id)a3;
+ (void)_migrateSharedStoreReviewWithDatabase:(id)a3;
+ (void)migrateStorageToDefaultsForNonAMSInternal:(id)a3;
@end

@implementation AMSStorageDataMigrator

+ (void)migrateStorageToDefaultsForNonAMSInternal:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal])
  {
    v4 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v4)
    {
      v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = objc_opt_class();
      v7 = AMSLogKey();
      v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      v13 = v7;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.", buf, 0x20u);
    }
  }
  else
  {
    v9 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
    [(id)objc_opt_class() _migrateDeviceOfferEligibilityWithDatabase:v9];
    [(id)objc_opt_class() _migrateSharedStoreReviewWithDatabase:v9];
    +[AMSDefaults setMigratedStorageToDefaultsForNonAMSInternal:1];
  }
}

+ (void)_migrateDeviceOfferEligibilityWithDatabase:(id)a3
{
  id v3 = a3;
  v4 = +[AMSStorage deviceOfferEligibility];
  v5 = [v4 allKeys];
  uint64_t v6 = [v5 count];

  if (v6) {
    +[AMSDefaults setDeviceOfferEligibility:v4];
  }
  id v14 = 0;
  v7 = [v3 valueForKey:@"deviceGroups" error:&v14];
  id v8 = v14;
  if (!v8 && [v7 count]) {
    +[AMSDefaults setDeviceGroups:v7];
  }
  id v13 = v8;
  v9 = [v3 valueForKey:@"deviceRegistrationBlacklist" error:&v13];
  id v10 = v13;

  if (!v10 && v9)
  {
    id v11 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    +[AMSDefaults setDeviceRegistrationDenyList:v12];
  }
}

+ (void)_migrateSharedStoreReviewWithDatabase:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 domain];
  id v29 = 0;
  uint64_t v6 = [v4 allKeysForDomain:v5 withError:&v29];
  id v7 = v29;

  if (v7)
  {
    id v8 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v10;
      __int16 v33 = 2114;
      v34 = v11;
      __int16 v35 = 2114;
      v36 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. No keys to migrate.", buf, 0x20u);
    }
  }
  else
  {
    id v8 = objc_msgSend(v6, "ams_filterUsingTest:", &__block_literal_global_121);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v13 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v23 = v6;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v8);
          }
          v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v24 = 0;
          v18 = [v4 valueForKey:v17 error:&v24];
          id v19 = v24;
          if (v19) {
            BOOL v20 = 1;
          }
          else {
            BOOL v20 = v18 == 0;
          }
          if (!v20)
          {
            v21 = [v17 componentsSeparatedByString:@"-"];
            v22 = [v21 lastObject];

            +[AMSDefaults setSharedStoreReviewMetrics:v18 forProcess:v22];
            [v4 deleteForKey:v17 error:0];
          }
        }
        uint64_t v14 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v14);
      id v7 = 0;
      uint64_t v6 = v23;
    }
  }
}

uint64_t __64__AMSStorageDataMigrator__migrateSharedStoreReviewWithDatabase___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"AMSSharedStoreReviewMetrics"];
}

@end