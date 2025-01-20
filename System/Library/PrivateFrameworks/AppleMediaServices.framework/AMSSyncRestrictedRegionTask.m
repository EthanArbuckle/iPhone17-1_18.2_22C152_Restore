@interface AMSSyncRestrictedRegionTask
+ (BOOL)didExceededSyncDuration:(double)a3 lastTimestamp:(double)a4 currentTimestamp:(double)a5;
+ (BOOL)hasCachedRestrictedRegionsValueFromAccount:(id)a3 cachedTimestamp:(double *)a4;
+ (BOOL)storefrontContainsRestrictedRegionsValueFromBag:(id)a3;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (double)checkRestrictedRegionDurationValueFromBag:(id)a3;
+ (double)durationOfSyncRestrictedRegionValueFromBag:(id)a3;
+ (id)createBagForSubProfile;
+ (id)createSyncAccountFlagsTaskForAccount:(id)a3 bag:(id)a4;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSSyncRestrictedRegionTask)initWithAccount:(id)a3;
- (AMSSyncRestrictedRegionTask)initWithAccount:(id)a3 bag:(id)a4;
- (id)performSync;
- (void)cacheRestrictedRegionSyncTimestamp:(double)a3;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
@end

@implementation AMSSyncRestrictedRegionTask

- (AMSSyncRestrictedRegionTask)initWithAccount:(id)a3
{
  return [(AMSSyncRestrictedRegionTask *)self initWithAccount:a3 bag:0];
}

- (AMSSyncRestrictedRegionTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSyncRestrictedRegionTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_3_5 != -1) {
    dispatch_once(&_MergedGlobals_3_5, &__block_literal_global_125);
  }
  v2 = (void *)qword_1EB38D400;
  return (NSString *)v2;
}

void __44__AMSSyncRestrictedRegionTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D400;
  qword_1EB38D400 = @"Accounts";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D408 != -1) {
    dispatch_once(&qword_1EB38D408, &__block_literal_global_3_5);
  }
  v2 = (void *)qword_1EB38D410;
  return (NSString *)v2;
}

void __51__AMSSyncRestrictedRegionTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D410;
  qword_1EB38D410 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (id)performSync
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__AMSSyncRestrictedRegionTask_performSync__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __42__AMSSyncRestrictedRegionTask_performSync__block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v2 = AMSSetLogKeyIfNeeded();
  v3 = [*(id *)(a1 + 32) bag];

  if (!v3)
  {
    v4 = +[AMSSyncRestrictedRegionTask createBagForSubProfile];
    [*(id *)(a1 + 32) setBag:v4];
  }
  v5 = objc_opt_class();
  v6 = [*(id *)(a1 + 32) bag];
  [v5 durationOfSyncRestrictedRegionValueFromBag:v6];
  id v8 = v7;

  if (*(double *)&v8 != -1.0)
  {
    double v51 = 0.0;
    v16 = objc_opt_class();
    v17 = [*(id *)(a1 + 32) account];
    LODWORD(v16) = [v16 hasCachedRestrictedRegionsValueFromAccount:v17 cachedTimestamp:&v51];

    if (v16)
    {
      v18 = [MEMORY[0x1E4F28F80] processInfo];
      [v18 systemUptime];
      double v20 = v19;

      v21 = +[AMSLogConfig sharedAccountsConfig];
      if (!v21)
      {
        v21 = +[AMSLogConfig sharedConfig];
      }
      v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = objc_opt_class();
        *(_DWORD *)buf = 138544386;
        uint64_t v53 = v23;
        __int16 v54 = 2114;
        v55 = v2;
        __int16 v56 = 2048;
        unint64_t v57 = (unint64_t)v51;
        __int16 v58 = 2048;
        unint64_t v59 = (unint64_t)*(double *)&v8;
        __int16 v60 = 2048;
        unint64_t v61 = (unint64_t)v20;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Has cached value, last timestamp = %lu, sync duration = %lu, current timestamp = %lu", buf, 0x34u);
      }

      if (([(id)objc_opt_class() didExceededSyncDuration:*(double *)&v8 lastTimestamp:v51 currentTimestamp:v20] & 1) == 0)
      {
        v24 = +[AMSLogConfig sharedAccountsConfig];
        if (!v24)
        {
          v24 = +[AMSLogConfig sharedConfig];
        }
        v25 = [v24 OSLogObject];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = objc_opt_class();
          v27 = [*(id *)(a1 + 32) account];
          v28 = AMSHashIfNeeded(v27);
          *(_DWORD *)buf = 138543874;
          uint64_t v53 = v26;
          __int16 v54 = 2114;
          v55 = v2;
          __int16 v56 = 2114;
          unint64_t v57 = (unint64_t)v28;
          _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Not exceeded sync duration, cancelling sync task for the account = %{public}@", buf, 0x20u);
        }
        v29 = AMSError(6, @"AMSSyncRestrictedRegionTask Error", @"Not exceeded sync duration, cancelling sync task for the account", 0);
        v15 = +[AMSPromise promiseWithError:v29];
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v30 = +[AMSLogConfig sharedAccountsConfig];
      if (!v30)
      {
        v30 = +[AMSLogConfig sharedConfig];
      }
      v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = objc_opt_class();
        v33 = [*(id *)(a1 + 32) account];
        v34 = AMSHashIfNeeded(v33);
        *(_DWORD *)buf = 138543874;
        uint64_t v53 = v32;
        __int16 v54 = 2114;
        v55 = v2;
        __int16 v56 = 2114;
        unint64_t v57 = (unint64_t)v34;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No cached value was found for the account = %{public}@", buf, 0x20u);
      }
    }
    v35 = +[AMSLogConfig sharedAccountsConfig];
    if (!v35)
    {
      v35 = +[AMSLogConfig sharedConfig];
    }
    v36 = [v35 OSLogObject];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = objc_opt_class();
      v38 = [*(id *)(a1 + 32) account];
      v39 = AMSHashIfNeeded(v38);
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v37;
      __int16 v54 = 2114;
      v55 = v2;
      __int16 v56 = 2114;
      unint64_t v57 = (unint64_t)v39;
      _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cached value expired, starting sync task for the account = %{public}@", buf, 0x20u);
    }
    v40 = objc_opt_class();
    v41 = [*(id *)(a1 + 32) account];
    v42 = [*(id *)(a1 + 32) bag];
    v29 = [v40 createSyncAccountFlagsTaskForAccount:v41 bag:v42];

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v43 = [v29 performSync];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_20;
    v47[3] = &unk_1E55A6E38;
    objc_copyWeak(v50, (id *)buf);
    id v44 = v2;
    v50[1] = v8;
    uint64_t v45 = *(void *)(a1 + 32);
    id v48 = v44;
    uint64_t v49 = v45;
    v15 = [v43 thenWithBlock:v47];

    objc_destroyWeak(v50);
    objc_destroyWeak((id *)buf);
    goto LABEL_30;
  }
  v9 = +[AMSLogConfig sharedAccountsConfig];
  if (!v9)
  {
    v9 = +[AMSLogConfig sharedConfig];
  }
  v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    objc_super v12 = [*(id *)(a1 + 32) account];
    v13 = AMSHashIfNeeded(v12);
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = v11;
    __int16 v54 = 2114;
    v55 = v2;
    __int16 v56 = 2114;
    unint64_t v57 = (unint64_t)v13;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Got an invalid sync duration value from the bag for the account = %{public}@", buf, 0x20u);
  }
  v14 = AMSError(200, @"AMSSyncRestrictedRegionTask Error", @"Got an invalid sync duration value from the bag", 0);
  v15 = +[AMSPromise promiseWithError:v14];

LABEL_31:
  return v15;
}

id __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = [WeakRetained account];
  v6 = objc_msgSend(v5, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = [v7 BOOLValue];
  v9 = [MEMORY[0x1E4F28F80] processInfo];
  [v9 systemUptime];
  double v11 = v10;

  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  [v12 cacheRestrictedRegionSyncTimestamp:v11];

  v13 = +[AMSLogConfig sharedAccountsConfig];
  if (!v13)
  {
    v13 = +[AMSLogConfig sharedConfig];
  }
  v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v16 = objc_opt_class();
    v17 = @"NO";
    uint64_t v18 = *(void *)(a1 + 32);
    unint64_t v19 = (unint64_t)*(double *)(a1 + 56);
    if (v8) {
      v17 = @"YES";
    }
    *(_DWORD *)buf = 138544386;
    uint64_t v34 = v16;
    __int16 v35 = 2114;
    uint64_t v36 = v18;
    __int16 v37 = 2114;
    v38 = v17;
    __int16 v39 = 2048;
    unint64_t v40 = (unint64_t)v11;
    __int16 v41 = 2048;
    unint64_t v42 = v19;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updated isInRestrictedRegion value = %{public}@, current timestamp=%lu, sync duration = %lu", buf, 0x34u);
  }
  double v20 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v21 = objc_loadWeakRetained((id *)(a1 + 48));
  v22 = [v21 account];
  uint64_t v23 = objc_msgSend(v20, "ams_saveAccount:verifyCredentials:", v22, 0);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_29;
  v29[3] = &unk_1E559E688;
  objc_copyWeak(&v32, (id *)(a1 + 48));
  id v24 = *(id *)(a1 + 32);
  uint64_t v25 = *(void *)(a1 + 40);
  id v30 = v24;
  uint64_t v31 = v25;
  [v23 addErrorBlock:v29];
  uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
  v27 = +[AMSPromise promiseWithResult:v26];

  objc_destroyWeak(&v32);
  return v27;
}

void __42__AMSSyncRestrictedRegionTask_performSync__block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [*(id *)(a1 + 40) account];
    double v10 = AMSHashIfNeeded(v9);
    double v11 = AMSHashIfNeeded(v3);
    int v12 = 138544130;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    v17 = v10;
    __int16 v18 = 2114;
    unint64_t v19 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to save cached value for the account = %{public}@. error = %{public}@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)cacheRestrictedRegionSyncTimestamp:(double)a3
{
  id v5 = [(AMSSyncRestrictedRegionTask *)self account];
  v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  objc_msgSend(v5, "ams_setLastRestrictedRegionSyncTimestamp:", v4);
}

+ (BOOL)didExceededSyncDuration:(double)a3 lastTimestamp:(double)a4 currentTimestamp:(double)a5
{
  return a5 - a4 >= a3 && a3 >= 1.0;
}

+ (BOOL)hasCachedRestrictedRegionsValueFromAccount:(id)a3 cachedTimestamp:(double *)a4
{
  uint64_t v5 = objc_msgSend(a3, "ams_lastRestrictedRegionSyncTimestamp");
  v6 = (void *)v5;
  if (a4 && v5)
  {
    char v7 = objc_opt_respondsToSelector();
    uint64_t v8 = 0;
    if (v7) {
      objc_msgSend(v6, "doubleValue", 0.0);
    }
    *(void *)a4 = v8;
  }

  return v6 != 0;
}

+ (double)durationOfSyncRestrictedRegionValueFromBag:(id)a3
{
  id v3 = a3;
  double v4 = -1.0;
  if ([(id)objc_opt_class() storefrontContainsRestrictedRegionsValueFromBag:v3])
  {
    [(id)objc_opt_class() checkRestrictedRegionDurationValueFromBag:v3];
    if (v5 >= 1.0) {
      double v4 = v5;
    }
    else {
      double v4 = -1.0;
    }
  }

  return v4;
}

+ (BOOL)storefrontContainsRestrictedRegionsValueFromBag:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [v3 BOOLForKey:@"storefrontContainsRestrictedRegion"];
  id v18 = 0;
  double v5 = [v4 valueWithError:&v18];
  id v6 = v18;
  if (objc_opt_respondsToSelector())
  {
    char v7 = [v3 BOOLForKey:@"storefrontContainsRestrictedRegion"];
    id v17 = v6;
    uint64_t v8 = [v7 valueWithError:&v17];
    id v9 = v17;

    char v10 = [v8 BOOLValue];
    id v6 = v9;
  }
  else
  {
    char v10 = 0;
  }

  if (v6)
  {
    double v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      double v11 = +[AMSLogConfig sharedConfig];
    }
    int v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      __int16 v14 = AMSLogKey();
      uint64_t v15 = AMSHashIfNeeded(@"storefrontContainsRestrictedRegion");
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      v22 = v14;
      __int16 v23 = 2114;
      id v24 = v15;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    char v10 = 0;
  }

  return v10;
}

+ (double)checkRestrictedRegionDurationValueFromBag:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [v3 doubleForKey:@"checkRestrictedRegionDuration"];
  id v19 = 0;
  double v5 = [v4 valueWithError:&v19];
  id v6 = v19;
  double v7 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v3 doubleForKey:@"checkRestrictedRegionDuration"];
    id v18 = v6;
    id v9 = [v8 valueWithError:&v18];
    id v10 = v18;

    [v9 doubleValue];
    double v7 = v11;

    id v6 = v10;
  }

  if (v6)
  {
    int v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      int v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      __int16 v16 = AMSHashIfNeeded(@"checkRestrictedRegionDuration");
      *(_DWORD *)buf = 138544130;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      __int16 v24 = 2114;
      __int16 v25 = v16;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    double v7 = 0.0;
  }

  return v7;
}

+ (id)createSyncAccountFlagsTaskForAccount:(id)a3 bag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [[AMSSyncAccountFlagsTask alloc] initWithAccount:v6 bag:v5];

  [(AMSTask *)v7 setRunMode:1];
  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end