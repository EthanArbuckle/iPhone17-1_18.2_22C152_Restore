@interface AMSDeviceOfferMigrator
+ (void)migrateDeviceOffersWithOptions:(id)a3;
@end

@implementation AMSDeviceOfferMigrator

+ (void)migrateDeviceOffersWithOptions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([a3 scenario] == 4)
  {
    if (+[AMSDefaults migratedDeviceOffers])
    {
      v5 = +[AMSLogConfig sharedDataMigrationConfig];
      if (!v5)
      {
        v5 = +[AMSLogConfig sharedConfig];
      }
      v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = objc_opt_class();
        v8 = AMSLogKey();
        v9 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543874;
        uint64_t v32 = v7;
        __int16 v33 = 2114;
        v34 = v8;
        __int16 v35 = 2114;
        v36 = v9;
        v10 = "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.";
LABEL_11:
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, v10, buf, 0x20u);
      }
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v5 = objc_msgSend(v12, "ams_activeiTunesAccount");

      if (v5)
      {
        v13 = [MEMORY[0x1E4F1C9C8] date];
        v14 = +[AMSLogConfig sharedDataMigrationConfig];
        if (!v14)
        {
          v14 = +[AMSLogConfig sharedConfig];
        }
        v15 = [v14 OSLogObject];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = objc_opt_class();
          v17 = AMSLogKey();
          v18 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          uint64_t v32 = v16;
          __int16 v33 = 2114;
          v34 = v17;
          __int16 v35 = 2114;
          v36 = v18;
          _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ started.", buf, 0x20u);
        }
        v19 = +[AMSDeviceOfferRegistrationTask bagSubProfile];
        v20 = +[AMSDeviceOfferRegistrationTask bagSubProfileVersion];
        v6 = +[AMSBag bagForProfile:v19 profileVersion:v20];

        v21 = [[AMSDeviceOfferRegistrationTask alloc] initWithAccount:v5 bag:v6];
        [(AMSDeviceOfferRegistrationTask *)v21 setLightweightCheckOnly:1];
        v22 = [(AMSDeviceOfferRegistrationTask *)v21 perform];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __57__AMSDeviceOfferMigrator_migrateDeviceOffersWithOptions___block_invoke;
        v27[3] = &unk_1E55A1F40;
        id v29 = a1;
        SEL v30 = a2;
        id v28 = v13;
        id v23 = v13;
        [v22 addFinishBlock:v27];
      }
      else
      {
        v6 = +[AMSLogConfig sharedDataMigrationConfig];
        if (!v6)
        {
          v6 = +[AMSLogConfig sharedConfig];
        }
        v21 = [v6 OSLogObject];
        if (os_log_type_enabled(&v21->super.super, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = objc_opt_class();
          v25 = AMSLogKey();
          v26 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          uint64_t v32 = v24;
          __int16 v33 = 2114;
          v34 = v25;
          __int16 v35 = 2114;
          v36 = v26;
          _os_log_impl(&dword_18D554000, &v21->super.super, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. No account is signed in during upgrade.", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    v5 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_opt_class();
      v8 = AMSLogKey();
      v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v11;
      __int16 v33 = 2114;
      v34 = v8;
      __int16 v35 = 2114;
      v36 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
      goto LABEL_11;
    }
  }
}

void __57__AMSDeviceOfferMigrator_migrateDeviceOffersWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138544130;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      v22 = v10;
      __int16 v23 = 2114;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ Error running the device offer registration. error = %{public}@.", (uint8_t *)&v19, 0x2Au);
    }
  }
  +[AMSDefaults setMigratedDeviceOffers:1];
  v12 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v12)
  {
    v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    v15 = AMSLogKey();
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v17 = [MEMORY[0x1E4F1C9C8] date];
    [v17 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v19 = 138544130;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    __int16 v25 = 2048;
    id v26 = v18;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ finished. executionTime = %f", (uint8_t *)&v19, 0x2Au);
  }
}

@end