@interface AMSServerDataCacheMigrator
+ (void)_primeCachedServerDataCacheUsingAccount:(id)a3;
+ (void)migrateDataCacheWithOptions:(id)a3;
@end

@implementation AMSServerDataCacheMigrator

+ (void)migrateDataCacheWithOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a3 scenario] == 4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v6 = objc_msgSend(v5, "ams_activeiTunesAccount");
    v7 = [v6 ams_DSID];
    if (v7)
    {
      v8 = objc_alloc_init(AMSServerDataCacheService);
      v9 = [(AMSServerDataCacheService *)v8 setUpCacheForAccountDSID:v7];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __58__AMSServerDataCacheMigrator_migrateDataCacheWithOptions___block_invoke;
      v15[3] = &__block_descriptor_48_e20_v20__0B8__NSError_12l;
      v15[4] = a1;
      v15[5] = a2;
      [v9 addFinishBlock:v15];

      [a1 _primeCachedServerDataCacheUsingAccount:v6];
LABEL_14:

      goto LABEL_15;
    }
    v11 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v11)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] skipping. No active itunes account with dsid to use for update.", buf, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  v5 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = objc_opt_class();
    v7 = AMSLogKey();
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    v19 = v7;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.", buf, 0x20u);
    goto LABEL_13;
  }
LABEL_15:
}

void __58__AMSServerDataCacheMigrator_migrateDataCacheWithOptions___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    v9 = AMSLogKey();
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v11 = (void *)v10;
    *(_DWORD *)uint64_t v17 = 138544386;
    v12 = @"false";
    *(void *)&v17[4] = v8;
    *(_WORD *)&v17[12] = 2114;
    if (a2) {
      v12 = @"true";
    }
    *(void *)&v17[14] = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ data cache set up complete. Success: %@ Error: %{public}@", v17, 0x34u);
  }
  if (v5 && ([v5 code] == 107 || objc_msgSend(v5, "code") == 2))
  {
    uint64_t v13 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      *(_DWORD *)uint64_t v17 = 138543618;
      *(void *)&v17[4] = v15;
      *(_WORD *)&v17[12] = 2114;
      *(void *)&v17[14] = v16;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Unrepairable error during cache set up", v17, 0x16u);
    }
  }
  else
  {
    +[AMSDefaults setDidSetUpServerDataCache:](AMSDefaults, "setDidSetUpServerDataCache:", 1, *(void *)v17, *(void *)&v17[8]);
  }
}

+ (void)_primeCachedServerDataCacheUsingAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSProcessInfo currentProcess];
  v6 = [v5 bundleIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.amsaccountsd"];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = +[AMSAccountCachedServerData sharedInstance];
    v9 = objc_msgSend(v4, "ams_accountID");
    uint64_t v10 = [v8 stringForKey:0 accountID:v9 updateBlock:&__block_literal_global_116];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__AMSServerDataCacheMigrator__primeCachedServerDataCacheUsingAccount___block_invoke_2;
    v11[3] = &__block_descriptor_40_e52_v24__0___AMSAccountCachedServerString__8__NSError_16l;
    v11[4] = a1;
    [v10 addFinishBlock:v11];
  }
}

void __70__AMSServerDataCacheMigrator__primeCachedServerDataCacheUsingAccount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Priming account data cache due to migration.", (uint8_t *)&v10, 0x16u);
  }
  char v7 = +[AMSAccountCachedServerData sharedInstance];
  uint64_t v8 = [v2 token];

  id v9 = (id)[v7 cancelUpdatesForToken:v8];
}

@end