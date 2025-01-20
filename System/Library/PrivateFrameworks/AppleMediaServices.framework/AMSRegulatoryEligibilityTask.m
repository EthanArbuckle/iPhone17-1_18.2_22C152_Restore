@interface AMSRegulatoryEligibilityTask
+ (AMSRegulatoryEligibilityTask)sharedInstance;
+ (BOOL)setBillingCountry:(id)a3 withStatus:(unint64_t)a4 error:(id *)a5;
+ (id)fetchRegulatoryiTunesAccount;
+ (id)setRegulatoryPropertyOnAccount:(id)a3;
- (AMSRegulatoryEligibilityTask)init;
- (AMSRegulatoryEligibilityTask)initWithServerData:(id)a3;
- (BOOL)setForcedOverride:(id)a3 error:(id *)a4;
- (NSNumber)override;
- (NSObject)cachedServerDataService;
- (id)update;
- (os_unfair_lock_s)overrideLock;
- (void)handleCachedDataUpdate;
- (void)setCachedServerDataService:(id)a3;
- (void)setOverride:(id)a3;
- (void)updateAMSDefaults:(id)a3 country:(id)a4 override:(id)a5 result:(id)a6;
@end

@implementation AMSRegulatoryEligibilityTask

- (AMSRegulatoryEligibilityTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSRegulatoryEligibilityTask;
  v2 = [(AMSTask *)&v7 init];
  v3 = v2;
  if (v2 && !v2->_cachedServerDataService)
  {
    v4 = objc_alloc_init(NSClassFromString(&cfstr_Amsdaccountcac.isa));
    cachedServerDataService = v3->_cachedServerDataService;
    v3->_cachedServerDataService = v4;

    v3->_overrideLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (AMSRegulatoryEligibilityTask)initWithServerData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSRegulatoryEligibilityTask;
  v6 = [(AMSTask *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cachedServerDataService, a3);
  }

  return v7;
}

+ (AMSRegulatoryEligibilityTask)sharedInstance
{
  if (_MergedGlobals_1_16 != -1) {
    dispatch_once(&_MergedGlobals_1_16, &__block_literal_global_114);
  }
  v2 = (void *)qword_1EB38D1F8;
  return (AMSRegulatoryEligibilityTask *)v2;
}

uint64_t __46__AMSRegulatoryEligibilityTask_sharedInstance__block_invoke()
{
  qword_1EB38D1F8 = objc_alloc_init(AMSRegulatoryEligibilityTask);
  return MEMORY[0x1F41817F8]();
}

- (id)update
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v3 = (uint64_t (*)(void))off_1EB38D200;
  v24 = off_1EB38D200;
  if (!off_1EB38D200)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_1;
    v26 = &unk_1E559EC70;
    v27 = &v21;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_1((uint64_t)buf);
    v3 = (uint64_t (*)(void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  BOOL v4 = v3() == 0;
  uint64_t v5 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v6 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = AMSLogKey();
      v15 = NSString;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = v16;
      if (v14)
      {
        AMSLogKey();
        self = (AMSRegulatoryEligibilityTask *)objc_claimAutoreleasedReturnValue();
        [v15 stringWithFormat:@"%@: [%@] ", v17, self];
      }
      else
      {
        [v15 stringWithFormat:@"%@: ", v16];
      v18 = };
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@Skipping regulatory eligibility; process started before first device unlock",
        buf,
        0xCu);
      if (v14)
      {

        v18 = self;
      }
    }
    v10 = AMSError(119, @"Skipping regulatory eligibility", @"Device has not been unlocked", 0);
    v12 = +[AMSBinaryPromise promiseWithError:v10];
  }
  else
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    objc_super v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      objc_super v9 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting regulatory eligibility update.", buf, 0x16u);
    }
    v10 = [(id)objc_opt_class() fetchRegulatoryiTunesAccount];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __38__AMSRegulatoryEligibilityTask_update__block_invoke;
    v20[3] = &unk_1E559E6B0;
    v20[4] = self;
    v11 = [v10 continueWithBlock:v20];
    v12 = [v11 binaryPromiseAdapter];
  }
  return v12;
}

id __38__AMSRegulatoryEligibilityTask_update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_super v7 = objc_msgSend(v5, "ams_accountID");

    if (v7)
    {
      uint64_t v8 = objc_alloc_init(AMSMutablePromise);
      objc_super v9 = [*(id *)(a1 + 32) cachedServerDataService];
      v10 = objc_msgSend(v5, "ams_accountID");
      v35 = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __38__AMSRegulatoryEligibilityTask_update__block_invoke_41;
      v30[3] = &unk_1E55A6270;
      id v12 = v5;
      uint64_t v13 = *(void *)(a1 + 32);
      id v31 = v12;
      uint64_t v32 = v13;
      v14 = v8;
      v33 = v14;
      [v9 getDataForAccountIDs:v11 reply:v30];

      v15 = v33;
      uint64_t v16 = v14;

      uint64_t v17 = v16;
      goto LABEL_16;
    }
    v25 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
    if (!v25)
    {
      v25 = +[AMSLogConfig sharedConfig];
    }
    v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v27;
      __int16 v38 = 2114;
      v39 = v28;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot proceed with regulatory eligibility; account does not have an AMS account ID.",
        buf,
        0x16u);
    }
    AMSError(111, @"No account identifier", @"Account missing ams_accountID value", 0);
    uint64_t v16 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = AMSLogKey();
      v22 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v20;
      __int16 v38 = 2114;
      v39 = v21;
      __int16 v40 = 2114;
      v41 = v22;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch account for regulatory eligibility. error = %{public}@", buf, 0x20u);
    }
    id v34 = 0;
    int v23 = [(id)objc_opt_class() setBillingCountry:0 withStatus:7 error:&v34];
    uint64_t v16 = (AMSMutablePromise *)v34;
    if (v23)
    {
      v24 = +[AMSBinaryPromise promiseWithSuccess];
      uint64_t v17 = [v24 promiseAdapter];

      goto LABEL_16;
    }
  }
  uint64_t v17 = +[AMSPromise promiseWithError:v16];
LABEL_16:

  return v17;
}

void __38__AMSRegulatoryEligibilityTask_update__block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 allAccountResults];
  objc_super v7 = objc_msgSend(*(id *)(a1 + 32), "ams_accountID");
  uint64_t v8 = [v6 objectForKey:v7];

  if (v8)
  {
    objc_super v9 = [v8 fields];
    v10 = v9;
    if (!v9)
    {
      __int16 v38 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
      if (!v38)
      {
        __int16 v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = objc_opt_class();
        v41 = AMSLogKey();
        uint64_t v42 = AMSHashIfNeeded(*(void **)(a1 + 32));
        [v8 error];
        v43 = id v52 = v5;
        v44 = AMSLogableError(v43);
        *(_DWORD *)buf = 138544130;
        uint64_t v60 = v40;
        __int16 v61 = 2114;
        v62 = v41;
        __int16 v63 = 2114;
        v64 = v42;
        __int16 v65 = 2114;
        v66 = v44;
        _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve data for account %{public}@. error = %{public}@", buf, 0x2Au);

        id v5 = v52;
      }

      v45 = *(void **)(a1 + 48);
      v11 = [v8 error];
      [v45 finishWithError:v11];
      goto LABEL_30;
    }
    v11 = [v9 iso2CountryCode];
    id v12 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      uint64_t v16 = AMSHashIfNeeded(*(void **)(a1 + 32));
      AMSHashIfNeeded(v11);
      v50 = v8;
      uint64_t v17 = v11;
      v18 = v10;
      uint64_t v20 = v19 = v5;
      *(_DWORD *)buf = 138544130;
      uint64_t v60 = v14;
      __int16 v61 = 2114;
      v62 = v15;
      __int16 v63 = 2114;
      v64 = v16;
      __int16 v65 = 2114;
      v66 = v20;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The billing country for %{public}@ is %{public}@.", buf, 0x2Au);

      id v5 = v19;
      v10 = v18;
      v11 = v17;
      uint64_t v8 = v50;
    }
    if (v11)
    {
      id v58 = 0;
      int v21 = [(id)objc_opt_class() setBillingCountry:v11 withStatus:0 error:&v58];
      id v22 = v58;
      if (v21)
      {
        int v23 = [*(id *)(a1 + 32) accountPropertyForKey:@"3PRegulatoryOverride"];
        if (v23)
        {
          v24 = *(void **)(a1 + 40);
          id v57 = 0;
          char v25 = [v24 setForcedOverride:v23 error:&v57];
          id v26 = v57;
          uint64_t v27 = v26;
          if ((v25 & 1) == 0)
          {
            [*(id *)(a1 + 48) finishWithError:v26];

            goto LABEL_29;
          }
        }
        uint64_t v28 = [(id)objc_opt_class() setRegulatoryPropertyOnAccount:*(void *)(a1 + 32)];
        [*(id *)(a1 + 48) finishWithPromise:v28];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __38__AMSRegulatoryEligibilityTask_update__block_invoke_48;
        v53[3] = &unk_1E55A6248;
        int8x16_t v51 = *(int8x16_t *)(a1 + 32);
        id v29 = (id)v51.i64[0];
        int8x16_t v54 = vextq_s8(v51, v51, 8uLL);
        id v55 = v11;
        id v56 = v23;
        id v30 = v23;
        id v31 = (id)[v28 thenWithBlock:v53];

LABEL_29:
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v46 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
      if (!v46)
      {
        v46 = +[AMSLogConfig sharedConfig];
      }
      v47 = objc_msgSend(v46, "OSLogObject", v50);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = objc_opt_class();
        v49 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v48;
        __int16 v61 = 2114;
        v62 = v49;
        _os_log_impl(&dword_18D554000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The billing country was null, so we won't update eligibility engine.", buf, 0x16u);
      }
      AMSError(119, @"Eligibility write failed", @"Exited early because of null account", 0);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v22, v50);
    goto LABEL_29;
  }
  uint64_t v32 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  if (!v32)
  {
    uint64_t v32 = +[AMSLogConfig sharedConfig];
  }
  v33 = [v32 OSLogObject];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = objc_opt_class();
    v35 = AMSLogKey();
    v36 = AMSHashIfNeeded(*(void **)(a1 + 32));
    uint64_t v37 = AMSLogableError(v5);
    *(_DWORD *)buf = 138544130;
    uint64_t v60 = v34;
    __int16 v61 = 2114;
    v62 = v35;
    __int16 v63 = 2114;
    v64 = v36;
    __int16 v65 = 2114;
    v66 = v37;
    _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No result found for account %{public}@. error = %{public}@", buf, 0x2Au);
  }
  [*(id *)(a1 + 48) finishWithError:v5];
LABEL_31:
}

AMSPromise *__38__AMSRegulatoryEligibilityTask_update__block_invoke_48(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  BOOL v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 username];
  [v3 updateAMSDefaults:v6 country:a1[6] override:a1[7] result:v5];

  uint64_t v7 = MEMORY[0x1E4F1CC38];
  return +[AMSPromise promiseWithResult:v7];
}

+ (id)fetchRegulatoryiTunesAccount
{
  v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeProduction);
  BOOL v4 = objc_msgSend(v3, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__AMSRegulatoryEligibilityTask_fetchRegulatoryiTunesAccount__block_invoke;
  v8[3] = &unk_1E55A6298;
  id v9 = v3;
  id v10 = a1;
  id v5 = v3;
  id v6 = [v4 continueWithBlock:v8];

  return v6;
}

id __60__AMSRegulatoryEligibilityTask_fetchRegulatoryiTunesAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    goto LABEL_2;
  }
  objc_msgSend(*(id *)(a1 + 32), "ams_activeiCloudAccount");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v10 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = AMSLogKey();
    int v18 = 138543618;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    int v21 = v13;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No active iCloud or iTunes account found", (uint8_t *)&v18, 0x16u);
    goto LABEL_14;
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "ams_iTunesAccountForAccount:", v5);
  if (v8)
  {
    id v9 = (void *)v8;

    id v5 = v9;
LABEL_2:
    uint64_t v7 = +[AMSPromise promiseWithResult:v5];
    goto LABEL_16;
  }
  id v10 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v13 = AMSLogKey();
    v15 = AMSHashIfNeeded(v5);
    int v18 = 138543874;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    int v21 = v13;
    __int16 v22 = 2114;
    int v23 = v15;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No iTunes account found associated with active iCloud account: %{public}@", (uint8_t *)&v18, 0x20u);

LABEL_14:
  }
LABEL_15:

  uint64_t v7 = +[AMSPromise promiseWithError:v6];
LABEL_16:
  uint64_t v16 = (void *)v7;

  return v16;
}

+ (BOOL)setBillingCountry:(id)a3 withStatus:(unint64_t)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6) {
    xpc_object_t v8 = xpc_string_create((const char *)[v6 UTF8String]);
  }
  else {
    xpc_object_t v8 = 0;
  }
  id v9 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    AMSLogKey();
    v13 = uint64_t v12 = a5;
    AMSHashIfNeeded(v7);
    v15 = uint64_t v14 = v7;
    int v27 = 138543874;
    uint64_t v28 = v11;
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 2114;
    uint64_t v32 = v15;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reporting billing country %{public}@ to policy engine...", (uint8_t *)&v27, 0x20u);

    uint64_t v7 = v14;
    a5 = v12;
  }

  int v16 = os_eligibility_set_input();
  uint64_t v17 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  int v18 = (void *)v17;
  if (v16)
  {
    if (!v17)
    {
      int v18 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      int v21 = AMSLogKey();
      int v27 = 138543874;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      id v30 = v21;
      __int16 v31 = 1024;
      LODWORD(v32) = v16;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set billing country; status code %i",
        (uint8_t *)&v27,
        0x1Cu);
    }
    if (a5)
    {
      AMSError(119, @"Eligibility write failed", @"Failed to set account eligibility", 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!v17)
    {
      int v18 = +[AMSLogConfig sharedConfig];
    }
    __int16 v22 = [v18 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = AMSLogKey();
      char v25 = AMSHashIfNeeded(v7);
      int v27 = 138543874;
      uint64_t v28 = v23;
      __int16 v29 = 2114;
      id v30 = v24;
      __int16 v31 = 2114;
      uint64_t v32 = v25;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully set billing country to %{public}@.", (uint8_t *)&v27, 0x20u);
    }
  }

  return v16 == 0;
}

- (NSNumber)override
{
  p_overrideLock = &self->_overrideLock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_override;
  os_unfair_lock_unlock(p_overrideLock);
  return v4;
}

- (void)setOverride:(id)a3
{
  BOOL v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  override = self->_override;
  self->_override = v4;

  os_unfair_lock_unlock(&self->_overrideLock);
}

- (BOOL)setForcedOverride:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_unfair_lock_lock(&self->_overrideLock);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__AMSRegulatoryEligibilityTask_setForcedOverride_error___block_invoke;
    aBlock[3] = &unk_1E559EA90;
    aBlock[4] = self;
    xpc_object_t v8 = (void (**)(void))_Block_copy(aBlock);
    p_override = &self->_override;
    if ([(NSNumber *)self->_override isEqualToNumber:v7])
    {
      id v10 = +[AMSLogConfig sharedAccountsConfig];
      if (!v10)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v12;
        __int16 v52 = 2114;
        v53 = v13;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The override on the account has not changed, so we will not set it", buf, 0x16u);
      }
      goto LABEL_8;
    }
    if ([v7 intValue])
    {
      uint64_t v19 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
      if (!v19)
      {
        uint64_t v19 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = objc_opt_class();
        __int16 v22 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v51 = v21;
        __int16 v52 = 2114;
        v53 = v22;
        __int16 v54 = 2112;
        id v55 = v7;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting forced override eligibility to %@.", buf, 0x20u);
      }
      if ([v7 intValue] != 1 && objc_msgSend(v7, "intValue") != 2)
      {
        uint64_t v42 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
        if (!v42)
        {
          uint64_t v42 = +[AMSLogConfig sharedConfig];
        }
        v43 = [v42 OSLogObject];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = objc_opt_class();
          v45 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v51 = v44;
          __int16 v52 = 2114;
          v53 = v45;
          _os_log_impl(&dword_18D554000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]Failed to set eligibility override because AK3PRegulatoryOverride was none of 0, 1, or 2", buf, 0x16u);
        }
        if (a4)
        {
          AMSError(119, @"Force override failed", @"Failed to set eligibility override because AK3PRegulatoryOverride was none of 0, 1, or 2", 0);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      int v33 = os_eligibility_force_domain_set_answers();
      if (v33)
      {
        uint64_t v34 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
        if (!v34)
        {
          uint64_t v34 = +[AMSLogConfig sharedConfig];
        }
        v35 = [v34 OSLogObject];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = objc_opt_class();
          uint64_t v37 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = v36;
          __int16 v52 = 2114;
          v53 = v37;
          __int16 v54 = 1024;
          LODWORD(v55) = v33;
          _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set forced override; status code %i",
            buf,
            0x1Cu);
        }
        if (a4)
        {
          AMSError(119, @"Force eligibility failed", @"Failed to set the eligibility override", 0);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      __int16 v38 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
      if (!v38)
      {
        __int16 v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = objc_opt_class();
        v41 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v40;
        __int16 v52 = 2114;
        v53 = v41;
        _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully set forced override", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v23 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
      if (!v23)
      {
        uint64_t v23 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_opt_class();
        id v26 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v25;
        __int16 v52 = 2114;
        v53 = v26;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Override value of 0 indicates it has been unset; resetting domain answer",
          buf,
          0x16u);
      }
      int v27 = os_eligibility_reset_all_domains();
      if (v27)
      {
        uint64_t v28 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
        if (!v28)
        {
          uint64_t v28 = +[AMSLogConfig sharedConfig];
        }
        __int16 v29 = [v28 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = objc_opt_class();
          __int16 v31 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = v30;
          __int16 v52 = 2114;
          v53 = v31;
          __int16 v54 = 1024;
          LODWORD(v55) = v27;
          _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to reset domain answer; status code %i",
            buf,
            0x1Cu);
        }
        if (a4)
        {
          AMSError(119, @"Reset domain failed", @"Failed to reset the domain answer", 0);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
          BOOL v14 = 0;
          *a4 = v32;
          goto LABEL_55;
        }
LABEL_54:
        BOOL v14 = 0;
        goto LABEL_55;
      }
      __int16 v38 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
      if (!v38)
      {
        __int16 v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = objc_opt_class();
        uint64_t v48 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v47;
        __int16 v52 = 2114;
        v53 = v48;
        _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully reset the domain answer", buf, 0x16u);
      }
    }

    objc_storeStrong((id *)p_override, a3);
LABEL_8:
    BOOL v14 = 1;
LABEL_55:
    v8[2](v8);

    goto LABEL_56;
  }
  v15 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  if (!v15)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  int v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = objc_opt_class();
    int v18 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = v17;
    __int16 v52 = 2114;
    v53 = v18;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set eligibility override because AK3PRegulatoryOverride was not a number", buf, 0x16u);
  }
  if (a4)
  {
    AMSError(119, @"Force override failed", @"Failed to set eligibility override because AK3PRegulatoryOverride was not a number", 0);
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_56:

  return v14;
}

void __56__AMSRegulatoryEligibilityTask_setForcedOverride_error___block_invoke(uint64_t a1)
{
}

+ (id)setRegulatoryPropertyOnAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F179C8];
  id v6 = AMSAccountMediaTypeProduction;
  id v7 = objc_msgSend(v5, "ams_sharedAccountStoreForMediaType:", v6);
  xpc_object_t v8 = objc_msgSend(v7, "ams_iTunesAccountsForMediaType:", v6);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke;
  v13[3] = &unk_1E55A62C0;
  id v15 = v7;
  id v16 = a1;
  id v14 = v4;
  id v9 = v7;
  id v10 = v4;
  uint64_t v11 = [v8 thenWithBlock:v13];

  return v11;
}

id __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v41;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v41 != v6) {
        objc_enumerationMutation(v3);
      }
      xpc_object_t v8 = *(void **)(*((void *)&v40 + 1) + 8 * v7);
      if (objc_msgSend(v8, "ams_isRegulatoryAccount")) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (!v9) {
      goto LABEL_17;
    }
    id v10 = [v9 identifier];
    uint64_t v11 = [*(id *)(a1 + 32) identifier];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_opt_class();
        id v16 = AMSLogKey();
        uint64_t v17 = AMSHashIfNeeded(*(void **)(a1 + 32));
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v15;
        __int16 v46 = 2114;
        uint64_t v47 = v16;
        __int16 v48 = 2114;
        v49 = v17;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ is already regulatory; not updating.",
          buf,
          0x20u);
      }
      uint64_t v18 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC28]];
      goto LABEL_22;
    }
    objc_msgSend(v9, "ams_setRegulatoryAccount:", 0);
    id v26 = objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", v9);
    int v27 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
    if (!v27)
    {
      int v27 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = AMSLogKey();
      __int16 v31 = AMSHashIfNeeded(v9);
      id v32 = AMSHashIfNeeded(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138544130;
      uint64_t v45 = v29;
      __int16 v46 = 2114;
      uint64_t v47 = v30;
      __int16 v48 = 2114;
      v49 = v31;
      __int16 v50 = 2114;
      uint64_t v51 = v32;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Replacing %{public}@ with %{public}@ as regulatory account.", buf, 0x2Au);
    }
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    uint64_t v36 = __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke_78;
    uint64_t v37 = &unk_1E559E888;
    id v38 = *(id *)(a1 + 32);
    id v39 = *(id *)(a1 + 40);
    int v33 = [v26 thenWithBlock:&v34];
    uint64_t v24 = objc_msgSend(v33, "promiseAdapter", v34, v35, v36, v37);
  }
  else
  {
LABEL_9:

LABEL_17:
    uint64_t v19 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
    if (!v19)
    {
      uint64_t v19 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_opt_class();
      __int16 v22 = AMSLogKey();
      uint64_t v23 = AMSHashIfNeeded(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v21;
      __int16 v46 = 2114;
      uint64_t v47 = v22;
      __int16 v48 = 2114;
      v49 = v23;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saving %{public}@ as regulatory account.", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "ams_setRegulatoryAccount:", 1);
    objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", *(void *)(a1 + 32));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v9 promiseAdapter];
LABEL_22:
    uint64_t v24 = (void *)v18;
  }

  return v24;
}

uint64_t __63__AMSRegulatoryEligibilityTask_setRegulatoryPropertyOnAccount___block_invoke_78(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_setRegulatoryAccount:", 1);
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return objc_msgSend(v2, "ams_saveAccount:", v3);
}

- (void)handleCachedDataUpdate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting eligibility flow from cached data update.", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(AMSRegulatoryEligibilityTask *)self update];
}

- (void)updateAMSDefaults:(id)a3 country:(id)a4 override:(id)a5 result:(id)a6
{
  v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (__CFString *)a3;
  __int16 v10 = (__CFString *)a4;
  id v11 = a5;
  id v12 = a6;
  if (os_variant_has_internal_content()
    && !+[AMSUnitTests isRunningUnitTests])
  {
    uint64_t v13 = @"N/A";
    if (v9) {
      id v14 = v9;
    }
    else {
      id v14 = @"N/A";
    }
    v18[0] = @"username";
    v18[1] = @"country";
    if (v10) {
      uint64_t v15 = v10;
    }
    else {
      uint64_t v15 = @"N/A";
    }
    v19[0] = v14;
    v19[1] = v15;
    v18[2] = @"override";
    if (v11)
    {
      uint64_t v13 = [v11 stringValue];
    }
    v18[3] = @"regulatory";
    id v16 = @"yes";
    if (!v12) {
      id v16 = @"no";
    }
    v19[2] = v13;
    v19[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    if (v11) {

    }
    +[AMSDefaults setRegulatoryEligibilityAttributes:v17];
  }
}

- (NSObject)cachedServerDataService
{
  return self->_cachedServerDataService;
}

- (void)setCachedServerDataService:(id)a3
{
}

- (os_unfair_lock_s)overrideLock
{
  return self->_overrideLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedServerDataService, 0);
  objc_storeStrong((id *)&self->_override, 0);
}

@end