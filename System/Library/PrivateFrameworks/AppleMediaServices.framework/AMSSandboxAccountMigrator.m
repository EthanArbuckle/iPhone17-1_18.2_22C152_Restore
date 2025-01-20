@interface AMSSandboxAccountMigrator
+ (void)migrateSandboxAccountsWithOptions:(id)a3;
@end

@implementation AMSSandboxAccountMigrator

+ (void)migrateSandboxAccountsWithOptions:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
  if (!CFPreferencesGetAppBooleanValue(@"AMSMigratedSandboxAccounts", @"com.apple.AppleMediaServices", 0))
  {
    v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeAppStoreSandbox);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    objc_msgSend(v3, "ams_iTunesAccounts");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v25;
      v8 = off_1E559C000;
      *(void *)&long long v5 = 138543874;
      long long v21 = v5;
      uint64_t v9 = MEMORY[0x1E4F1CC38];
      v22 = v3;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
          v12 = [(__objc2_class *)v8[17] sharedAccountsDaemonConfig];
          if (!v12)
          {
            v12 = [(__objc2_class *)v8[17] sharedConfig];
          }
          v13 = [v12 OSLogObject];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = v6;
            v15 = v8;
            uint64_t v16 = v7;
            uint64_t v17 = objc_opt_class();
            v18 = AMSLogKey();
            v19 = AMSHashIfNeeded(v11);
            *(_DWORD *)buf = v21;
            uint64_t v29 = v17;
            uint64_t v7 = v16;
            v8 = v15;
            uint64_t v6 = v14;
            uint64_t v9 = MEMORY[0x1E4F1CC38];
            __int16 v30 = 2114;
            v31 = v18;
            __int16 v32 = 2114;
            v33 = v19;
            _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forcing an account sync. account = %{public}@", buf, 0x20u);

            v3 = v22;
          }

          [v11 setObject:v9 forKeyedSubscript:@"sync"];
          [v11 setObject:0 forKeyedSubscript:@"sync"];
          id v20 = (id)objc_msgSend(v3, "ams_saveAccount:", v11);
          ++v10;
        }
        while (v6 != v10);
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v6);
    }

    CFPreferencesSetAppValue(@"AMSMigratedSandboxAccounts", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.AppleMediaServices");
    CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
  }
}

@end