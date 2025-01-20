@interface AMSSyncAccountFlagsTask
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4;
- (id)performSync;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
@end

@implementation AMSSyncAccountFlagsTask

- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSyncAccountFlagsTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)performSync
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AMSSyncAccountFlagsTask_performSync__block_invoke;
  v5[3] = &unk_1E55A6DB0;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)AMSSyncAccountFlagsTask;
  v2 = [(AMSTask *)&v4 performTaskWithBlock:v5];
  return v2;
}

AMSSyncAccountFlagsResult *__38__AMSSyncAccountFlagsTask_performSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [*(id *)(a1 + 32) account];
  int v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (v5)
  {
    AMSError(2, @"Invalid Parameter", @"We can't sync flags from the local account.", 0);
    v6 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v7 = +[AMSLogConfig sharedAccountsConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    v10 = AMSLogKey();
    [*(id *)(a1 + 32) account];
    v11 = v72 = a2;
    objc_super v12 = AMSHashIfNeeded(v11);
    v13 = [*(id *)(a1 + 32) account];
    v14 = objc_msgSend(v13, "ams_accountFlags");
    v15 = AMSHashIfNeeded(v14);
    *(_DWORD *)buf = 138544130;
    uint64_t v77 = v9;
    __int16 v78 = 2114;
    v79 = v10;
    __int16 v80 = 2114;
    v81 = v12;
    __int16 v82 = 2114;
    v83 = v15;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@", buf, 0x2Au);

    a2 = v72;
  }

  v16 = [AMSURLRequestEncoder alloc];
  v17 = [*(id *)(a1 + 32) bag];
  v18 = [(AMSURLRequestEncoder *)v16 initWithBag:v17];

  v19 = [*(id *)(a1 + 32) account];
  [(AMSURLRequestEncoder *)v18 setAccount:v19];

  [(AMSURLRequestEncoder *)v18 setRequestEncoding:3];
  v20 = AMSLogKey();
  [(AMSURLRequestEncoder *)v18 setLogUUID:v20];

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v22 = [*(id *)(a1 + 32) account];
  uint64_t v23 = objc_msgSend(v22, "ams_accountFlags");
  v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = MEMORY[0x1E4F1CC08];
  }
  [v21 setObject:v25 forKeyedSubscript:@"accountFlags"];

  v26 = +[AMSDevice deviceGUID];
  objc_msgSend(v21, "ams_setNullableObject:forKey:", v26, @"guid");

  v27 = [*(id *)(a1 + 32) bag];
  v28 = [v27 URLForKey:@"account-flags"];

  if (_os_feature_enabled_impl())
  {
    v29 = v18;
    uint64_t v30 = 2;
    v31 = v28;
    id v32 = 0;
  }
  else
  {
    v29 = v18;
    uint64_t v30 = 4;
    v31 = v28;
    id v32 = v21;
  }
  v33 = [(AMSURLRequestEncoder *)v29 requestWithMethod:v30 bagURL:v31 parameters:v32];
  id v75 = 0;
  v34 = [v33 resultWithError:&v75];
  id v35 = v75;
  if (v35)
  {
    id v36 = v35;
    v37 = 0;
  }
  else
  {
    v71 = v28;
    v38 = +[AMSURLSession defaultSession];
    v39 = v34;
    v40 = v38;
    v73 = v39;
    v41 = objc_msgSend(v38, "dataTaskPromiseWithRequest:");
    id v74 = 0;
    v37 = [v41 resultWithError:&v74];
    id v36 = v74;

    if (!v36)
    {
      v70 = v37;
      v44 = [v37 object];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v42 = v44;
      }
      else {
        id v42 = 0;
      }
      v34 = v73;

      uint64_t v45 = objc_msgSend(v42, "ams_accountFlags");
      uint64_t v46 = +[AMSLogConfig sharedAccountsConfig];
      v47 = (void *)v46;
      if (v45)
      {
        if (!v46)
        {
          v47 = +[AMSLogConfig sharedConfig];
        }
        v48 = [v47 OSLogObject];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v49 = objc_opt_class();
          v50 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v77 = v49;
          __int16 v78 = 2114;
          v79 = v50;
          _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the account flags.", buf, 0x16u);
        }
        v6 = [[AMSSyncAccountFlagsResult alloc] initWithAccountFlags:v45];
        v51 = [*(id *)(a1 + 32) account];
        uint64_t v52 = objc_msgSend(v51, "ams_accountFlags");
        v53 = (void *)v45;
        v54 = (void *)v52;
        v68 = v53;
        char v55 = [v53 isEqualToDictionary:v52];

        v37 = v70;
        v28 = v71;
        if ((v55 & 1) == 0)
        {
          v56 = +[AMSLogConfig sharedAccountsConfig];
          if (!v56)
          {
            v56 = +[AMSLogConfig sharedConfig];
          }
          v57 = [v56 OSLogObject];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            log = v57;
            uint64_t v58 = objc_opt_class();
            v59 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v77 = v58;
            v57 = log;
            __int16 v78 = 2114;
            v79 = v59;
            _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server provided updated account flags.", buf, 0x16u);

            v37 = v70;
          }

          v60 = [*(id *)(a1 + 32) account];
          objc_msgSend(v60, "ams_setAccountFlags:", v68);

          v61 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
          v62 = [*(id *)(a1 + 32) account];
          id v63 = (id)objc_msgSend(v61, "ams_saveAccount:verifyCredentials:", v62, 0);
        }
        v34 = v73;
      }
      else
      {
        if (!v46)
        {
          v47 = +[AMSLogConfig sharedConfig];
        }
        v64 = [v47 OSLogObject];
        v37 = v70;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = objc_opt_class();
          v65 = AMSLogKey();
          v66 = [v70 object];
          *(_DWORD *)buf = 138543874;
          uint64_t v77 = v69;
          __int16 v78 = 2114;
          v79 = v65;
          __int16 v80 = 2114;
          v81 = v66;
          _os_log_impl(&dword_18D554000, v64, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", buf, 0x20u);

          v34 = v73;
        }

        AMSError(301, @"Invalid Response", @"The request was successful, but the server's response was invalid.", 0);
        v6 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v71;
      }
      goto LABEL_18;
    }
    v34 = v73;
  }
  id v42 = v36;
  v6 = 0;
  *a2 = v42;
LABEL_18:

LABEL_19:
  return v6;
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