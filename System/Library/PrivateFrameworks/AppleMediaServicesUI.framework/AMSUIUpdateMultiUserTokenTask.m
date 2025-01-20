@interface AMSUIUpdateMultiUserTokenTask
+ (BOOL)_errorIsRecoverable:(id)a3;
- (ACAccount)account;
- (AMSUIUpdateMultiUserTokenTask)initWithAccount:(id)a3 homeIdentifier:(id)a4 viewController:(id)a5;
- (NSUUID)homeIdentifier;
- (UIViewController)viewController;
- (id)performTask;
@end

@implementation AMSUIUpdateMultiUserTokenTask

- (AMSUIUpdateMultiUserTokenTask)initWithAccount:(id)a3 homeIdentifier:(id)a4 viewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIUpdateMultiUserTokenTask;
  v12 = [(AMSTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_homeIdentifier, a4);
    objc_storeStrong((id *)&v13->_viewController, a5);
  }

  return v13;
}

- (id)performTask
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__AMSUIUpdateMultiUserTokenTask_performTask__block_invoke;
  v4[3] = &unk_2643E3968;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithBlock:v4];
  return v2;
}

uint64_t __44__AMSUIUpdateMultiUserTokenTask_performTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F27CB8] sharedAccountsMultiUserConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    v8 = [*(id *)(a1 + 32) account];
    id v9 = AMSHashIfNeeded();
    id v10 = [*(id *)(a1 + 32) homeIdentifier];
    id v11 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v68 = v6;
    __int16 v69 = 2114;
    v70 = v7;
    __int16 v71 = 2114;
    v72 = v9;
    __int16 v73 = 2114;
    v74 = v11;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating a Multi-User token. account = %{public}@ | homeIdentifier = %{public}@", buf, 0x2Au);
  }
  v12 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v13 = [*(id *)(a1 + 32) account];
  v14 = [*(id *)(a1 + 32) homeIdentifier];
  objc_super v15 = objc_msgSend(v12, "ams_setiTunesAccount:forHomeWithIdentifier:", v13, v14);
  id v66 = 0;
  int v16 = [v15 resultWithError:&v66];
  id v17 = v66;

  if (v16)
  {
    v18 = [MEMORY[0x263F27CB8] sharedAccountsMultiUserConfig];
    if (!v18)
    {
      v18 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v68 = v20;
      __int16 v69 = 2114;
      v70 = v21;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully updated the account's Multi-User token.", buf, 0x16u);
    }
    uint64_t v22 = MEMORY[0x263EFFA88];
    goto LABEL_46;
  }
  char v23 = [(id)objc_opt_class() _errorIsRecoverable:v17];
  uint64_t v24 = [MEMORY[0x263F27CB8] sharedAccountsMultiUserConfig];
  v25 = (void *)v24;
  if (v23)
  {
    if (!v24)
    {
      v25 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_opt_class();
      v28 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v68 = v27;
      __int16 v69 = 2114;
      v70 = v28;
      _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We must authenticate the iCloud account in order to generate a new Multi-User token.", buf, 0x16u);
    }
    id v29 = objc_alloc_init(MEMORY[0x263F27B00]);
    [v29 setCanMakeAccountActive:0];
    [v29 setDebugReason:@"Updating a Multi-User Token"];
    v30 = [AMSUIAuthKitUpdateTask alloc];
    v31 = objc_msgSend(v12, "ams_activeiCloudAccount");
    v32 = [*(id *)(a1 + 32) viewController];
    v33 = [(AMSUIAuthKitUpdateTask *)v30 initWithAccount:v31 presentingViewController:v32 options:v29];

    v34 = [(AMSAuthKitUpdateTask *)v33 performAuthKitUpdate];
    id v65 = 0;
    v35 = [v34 resultWithError:&v65];
    id v36 = v65;

    if (v35)
    {
      v62 = v33;
      v63 = v35;
      v37 = [*(id *)(a1 + 32) account];
      v38 = [*(id *)(a1 + 32) homeIdentifier];
      v39 = objc_msgSend(v12, "ams_setiTunesAccount:forHomeWithIdentifier:", v37, v38);
      id v64 = v36;
      char v40 = [v39 resultWithError:&v64];
      id v17 = v64;

      uint64_t v41 = [MEMORY[0x263F27CB8] sharedAccountsMultiUserConfig];
      v42 = (void *)v41;
      if (v40)
      {
        if (!v41)
        {
          v42 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v43 = [v42 OSLogObject];
        v35 = v63;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v44 = objc_opt_class();
          v45 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v68 = v44;
          __int16 v69 = 2114;
          v70 = v45;
          _os_log_impl(&dword_21C134000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully updated the account's Multi-User token.", buf, 0x16u);
        }
        uint64_t v22 = MEMORY[0x263EFFA88];
        v33 = v62;
        goto LABEL_45;
      }
      if (!v41)
      {
        v42 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v57 = [v42 OSLogObject];
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        uint64_t v58 = objc_opt_class();
        v59 = AMSLogKey();
        v60 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v68 = v58;
        __int16 v69 = 2114;
        v70 = v59;
        __int16 v71 = 2114;
        v72 = v60;
        _os_log_impl(&dword_21C134000, v57, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update the account's Multi-User token. error = %{public}@", buf, 0x20u);
      }
      v33 = v62;
      v35 = v63;
      if (!a2)
      {
        uint64_t v22 = 0;
        goto LABEL_45;
      }
      v56 = v17;
    }
    else
    {
      v50 = [MEMORY[0x263F27CB8] sharedAccountsMultiUserConfig];
      if (!v50)
      {
        v50 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v51 = [v50 OSLogObject];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        uint64_t v52 = objc_opt_class();
        v53 = AMSLogKey();
        AMSHashIfNeeded();
        v55 = v54 = v33;
        *(_DWORD *)buf = 138543874;
        uint64_t v68 = v52;
        __int16 v69 = 2114;
        v70 = v53;
        __int16 v71 = 2114;
        v72 = v55;
        _os_log_impl(&dword_21C134000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to authenticate the iCloud account. error = %{public}@", buf, 0x20u);

        v33 = v54;
        v35 = 0;
      }
      if (!a2)
      {
        uint64_t v22 = 0;
        id v17 = v36;
        goto LABEL_45;
      }
      v56 = v36;
    }
    id v17 = v56;
    uint64_t v22 = 0;
    *a2 = v17;
LABEL_45:

    goto LABEL_46;
  }
  if (!v24)
  {
    v25 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v46 = [v25 OSLogObject];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    uint64_t v47 = objc_opt_class();
    v48 = AMSLogKey();
    v49 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v68 = v47;
    __int16 v69 = 2114;
    v70 = v48;
    __int16 v71 = 2114;
    v72 = v49;
    _os_log_impl(&dword_21C134000, v46, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update the account's Multi-User token. error = %{public}@", buf, 0x20u);
  }
  if (a2)
  {
    id v17 = v17;
    uint64_t v22 = 0;
    *a2 = v17;
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_46:

  return v22;
}

+ (BOOL)_errorIsRecoverable:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "ams_hasDomain:code:", *MEMORY[0x263F27850], 108)
    && (objc_msgSend(v3, "ams_underlyingErrorWithDomain:code:", *MEMORY[0x263F28F30], -7013),
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    char v5 = 1;
  }
  else
  {
    char v5 = objc_msgSend(v3, "ams_hasDomain:code:", @"AMSDCloudDataErrorDomain", 9);
  }

  return v5;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end