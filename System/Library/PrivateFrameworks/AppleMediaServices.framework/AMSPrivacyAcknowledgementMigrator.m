@interface AMSPrivacyAcknowledgementMigrator
+ (void)migratePrivacyAcknowledgementsWithOptions:(id)a3;
@end

@implementation AMSPrivacyAcknowledgementMigrator

+ (void)migratePrivacyAcknowledgementsWithOptions:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([a3 scenario] == 4)
  {
    if (!+[AMSDefaults migratedPrivacyAcknowledgements])
    {
      v12 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v5 = objc_msgSend(v12, "ams_activeiCloudAccount");

      if (v5)
      {
        v6 = [MEMORY[0x1E4F1C9C8] date];
        v13 = +[AMSLogConfig sharedDataMigrationConfig];
        if (!v13)
        {
          v13 = +[AMSLogConfig sharedConfig];
        }
        v14 = [v13 OSLogObject];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = objc_opt_class();
          AMSLogKey();
          v16 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
          v17 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          uint64_t v42 = v15;
          __int16 v43 = 2114;
          v44 = v16;
          __int16 v45 = 2114;
          v46 = v17;
          _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ started.", buf, 0x20u);
        }
        v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        [v8 setYear:2019];
        [v8 setMonth:9];
        [v8 setDay:19];
        v18 = [v5 creationDate];
        v19 = [v8 date];
        uint64_t v20 = [v18 compare:v19];

        if (v20 == -1)
        {
          v30 = +[AMSLogConfig sharedDataMigrationConfig];
          if (!v30)
          {
            v30 = +[AMSLogConfig sharedConfig];
          }
          v31 = [(AMSAcknowledgePrivacyTask *)v30 OSLogObject];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            uint64_t v34 = objc_opt_class();
            AMSLogKey();
            v35 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
            v36 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543874;
            uint64_t v42 = v34;
            __int16 v43 = 2114;
            v44 = v35;
            __int16 v45 = 2114;
            v46 = v36;
            _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. iCloud account was signed in before Apple ID grey text was updated.", buf, 0x20u);
          }
        }
        else
        {
          v21 = getOBPrivacyAppleIDIdentifier();
          BOOL v22 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:v21];

          if (!v22) {
            goto LABEL_34;
          }
          v23 = +[AMSLogConfig sharedDataMigrationConfig];
          if (!v23)
          {
            v23 = +[AMSLogConfig sharedConfig];
          }
          v24 = [v23 OSLogObject];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = objc_opt_class();
            AMSLogKey();
            v26 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
            v27 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543874;
            uint64_t v42 = v25;
            __int16 v43 = 2114;
            v44 = v26;
            __int16 v45 = 2114;
            v46 = v27;
            _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ Recording GDPR acknowledgement for Apple ID based on historical data.", buf, 0x20u);
          }
          v28 = [AMSAcknowledgePrivacyTask alloc];
          v29 = getOBPrivacyAppleIDIdentifier();
          v30 = [(AMSAcknowledgePrivacyTask *)v28 initWithPrivacyIdentifier:v29];

          v31 = [(AMSAcknowledgePrivacyTask *)v30 acknowledgePrivacy];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __79__AMSPrivacyAcknowledgementMigrator_migratePrivacyAcknowledgementsWithOptions___block_invoke;
          v37[3] = &unk_1E55A5550;
          id v39 = a1;
          SEL v40 = a2;
          v38 = v6;
          [v31 addFinishBlock:v37];
        }
      }
      else
      {
        v6 = +[AMSLogConfig sharedDataMigrationConfig];
        if (!v6)
        {
          v6 = +[AMSLogConfig sharedConfig];
        }
        v8 = [v6 OSLogObject];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          goto LABEL_34;
        }
        uint64_t v32 = objc_opt_class();
        AMSLogKey();
        v30 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
        v33 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v32;
        __int16 v43 = 2114;
        v44 = v30;
        __int16 v45 = 2114;
        v46 = v33;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. No iCloud account is signed in during upgrade.", buf, 0x20u);
      }
      goto LABEL_34;
    }
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
      uint64_t v42 = v7;
      __int16 v43 = 2114;
      v44 = (AMSAcknowledgePrivacyTask *)v8;
      __int16 v45 = 2114;
      v46 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.";
LABEL_11:
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, v10, buf, 0x20u);

LABEL_34:
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
      uint64_t v42 = v11;
      __int16 v43 = 2114;
      v44 = (AMSAcknowledgePrivacyTask *)v8;
      __int16 v45 = 2114;
      v46 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
      goto LABEL_11;
    }
  }
}

void __79__AMSPrivacyAcknowledgementMigrator_migratePrivacyAcknowledgementsWithOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = AMSLogableError(v4);
      int v18 = 138544130;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      v21 = v8;
      __int16 v22 = 2114;
      v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ Failed to recording Apple ID GDPR acknowledgement. error = %{public}@", (uint8_t *)&v18, 0x2Au);
    }
  }
  +[AMSDefaults setMigratedPrivacyAcknowledgements:1];
  uint64_t v11 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v11)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    v14 = AMSLogKey();
    uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v18 = 138544130;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    v21 = v14;
    __int16 v22 = 2114;
    v23 = v15;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ finished. executionTime = %f", (uint8_t *)&v18, 0x2Au);
  }
}

@end