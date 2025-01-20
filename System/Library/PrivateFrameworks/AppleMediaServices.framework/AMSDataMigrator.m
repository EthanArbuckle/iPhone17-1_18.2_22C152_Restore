@interface AMSDataMigrator
+ (void)performMigrationWithOptions:(id)a3;
@end

@implementation AMSDataMigrator

+ (void)performMigrationWithOptions:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKey(0);
  unint64_t v5 = 0x1E4F1C000uLL;
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = +[AMSDefaults lastMigratedBuildVersion];
  v8 = [v3 currentBuildVersion];
  int v9 = [v8 isEqualToString:v7];

  uint64_t v10 = +[AMSLogConfig sharedDataMigrationConfig];
  v11 = (void *)v10;
  if (v9)
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
      v15 = [v3 currentBuildVersion];
      *(_DWORD *)buf = 138544130;
      uint64_t v30 = v13;
      __int16 v31 = 2114;
      v32 = v14;
      __int16 v33 = 2114;
      uint64_t v34 = (uint64_t)v15;
      __int16 v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Data migration has already occured for this build version. currentBuiltVersion = %{public}@ | lastMigratedBuildVersion = %{public}@", buf, 0x2Au);

      unint64_t v5 = 0x1E4F1C000;
    }
  }
  else
  {
    if (!v10)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v11 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      uint64_t v19 = [v3 scenario];
      [v3 previousBuildVersion];
      v21 = v20 = v6;
      v22 = [v3 currentBuildVersion];
      *(_DWORD *)buf = 138544386;
      uint64_t v30 = v17;
      unint64_t v5 = 0x1E4F1C000uLL;
      __int16 v31 = 2114;
      v32 = v18;
      __int16 v33 = 2048;
      uint64_t v34 = v19;
      __int16 v35 = 2114;
      v36 = v21;
      __int16 v37 = 2114;
      v38 = v22;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting AppleMediaServices data migration. scenario = %lu | previousVersion = %{public}@ | currentVersion = %{public}@", buf, 0x34u);

      v6 = v20;
    }

    +[AMSBiometricsMigrator migrateBiometricStateWithOptions:v3];
    +[AMSCommerceMigrator migrateCommerceAccountsWithOptions:v3];
    +[AMSDeviceOfferMigrator migrateDeviceOffersWithOptions:v3];
    +[AMSPrivacyAcknowledgementMigrator migratePrivacyAcknowledgementsWithOptions:v3];
    +[AMSSandboxAccountMigrator migrateSandboxAccountsWithOptions:v3];
    +[AMSServerDataCacheMigrator migrateDataCacheWithOptions:v3];
    +[AMSStorageDataMigrator migrateStorageToDefaultsForNonAMSInternal:v3];
    +[AMSDefaultsMigratedToStorageCleanUpMigrator cleanUpUserDefaultsStorageWithOptions:v3];
    +[AMSMetricsTimingWindowStartTimeCleanUpMigrator cleanUpMetricsTimingWindowStartTimeUserDefaultWithOptions:v3];
    +[AMSDefaults setLogHARData:0];
    v11 = [v3 currentBuildVersion];
    +[AMSDefaults setLastMigratedBuildVersion:v11];
  }

  CFPreferencesSetAppValue(@"AMSNewFeaturesEnabled", 0, @"com.apple.AppleMediaServices");
  CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
  v23 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v23)
  {
    v23 = +[AMSLogConfig sharedConfig];
  }
  v24 = [v23 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = objc_opt_class();
    v26 = AMSLogKey();
    v27 = [*(id *)(v5 + 2504) date];
    [v27 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v25;
    __int16 v31 = 2114;
    v32 = v26;
    __int16 v33 = 2048;
    uint64_t v34 = v28;
    _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished AppleMediaServices data migration. executionTime = %f", buf, 0x20u);
  }
}

@end