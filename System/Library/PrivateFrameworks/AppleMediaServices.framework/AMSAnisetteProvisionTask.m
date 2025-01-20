@interface AMSAnisetteProvisionTask
- (ACAccount)account;
- (AMSAnisetteProvisionTask)initWithData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6;
- (AMSBagProtocol)bag;
- (BOOL)_processFinishProvisioningResult:(id)a3 sessionID:(unsigned int)a4 error:(id *)a5;
- (NSData)data;
- (id)_createFinishProvisioningRequestWithClientData:(id)a3 error:(id *)a4;
- (id)_startProvisioningWithOutputSessionID:(unsigned int *)a3 error:(id *)a4;
- (id)performProvisioning;
- (int64_t)type;
@end

@implementation AMSAnisetteProvisionTask

- (AMSAnisetteProvisionTask)initWithData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSAnisetteProvisionTask;
  v14 = [(AMSTask *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    objc_storeStrong((id *)&v15->_account, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
    v15->_type = a4;
  }

  return v15;
}

- (id)performProvisioning
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AMSAnisetteProvisionTask_performProvisioning__block_invoke;
  v5[3] = &unk_1E559ED98;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = [(AMSTask *)self performBinaryTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

BOOL __47__AMSAnisetteProvisionTask_performProvisioning__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = +[AMSLogConfig sharedAnisetteConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    uint64_t v9 = [*(id *)(a1 + 32) type];
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v7;
    __int16 v37 = 2114;
    v38 = v8;
    __int16 v39 = 2048;
    uint64_t v40 = v9;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing provisioning. type: %ld", buf, 0x20u);
  }
  unsigned int v34 = 0;
  v10 = *(void **)(a1 + 32);
  id v33 = 0;
  uint64_t v11 = [v10 _startProvisioningWithOutputSessionID:&v34 error:&v33];
  uint64_t v12 = (uint64_t)v33;
  if (!(v12 | v11))
  {
    uint64_t v12 = AMSError(307, @"Anisette Provisioning Failed", @"Client data is nil", 0);
  }
  if (v12)
  {
    id v13 = 0;
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v14 = *(void **)(a1 + 32);
  id v32 = 0;
  id v13 = [v14 _createFinishProvisioningRequestWithClientData:v11 error:&v32];
  id v15 = v32;
  if (v15)
  {
    uint64_t v12 = (uint64_t)v15;
    goto LABEL_11;
  }
  v26 = +[AMSURLSession defaultSession];
  v27 = [v26 dataTaskPromiseWithRequest:v13];
  id v31 = 0;
  v16 = [v27 resultWithError:&v31];
  uint64_t v12 = (uint64_t)v31;

  if (!v12)
  {
    v28 = *(void **)(a1 + 32);
    id v30 = 0;
    char v29 = [v28 _processFinishProvisioningResult:v16 sessionID:v34 error:&v30];
    uint64_t v12 = (uint64_t)v30;
    if (!v12 && (v29 & 1) == 0)
    {
      uint64_t v12 = AMSError(307, @"Anisette Provisioning Failed", @"Provisioning finished without an error", 0);
    }
  }
LABEL_12:
  if (v34) {
    fy34trz2st();
  }
  if (v12)
  {
    id v17 = (id) v12;
    *a2 = v17;
    v18 = +[AMSLogConfig sharedAnisetteConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      v22 = AMSLogableError(v17);
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v20;
      __int16 v37 = 2114;
      v38 = v21;
      __int16 v39 = 2114;
      uint64_t v40 = (uint64_t)v22;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Provisioning failed. Error = %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v18 = +[AMSLogConfig sharedAnisetteConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v23;
      __int16 v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning succeeded.", buf, 0x16u);
    }
  }

  return v12 == 0;
}

- (id)_createFinishProvisioningRequestWithClientData:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(AMSAnisetteProvisionTask *)self account];
  v8 = [AMSURLRequestEncoder alloc];
  uint64_t v9 = [(AMSAnisetteProvisionTask *)self bag];
  v10 = [(AMSURLRequestEncoder *)v8 initWithBag:v9];

  [(AMSURLRequestEncoder *)v10 setAccount:v7];
  [(AMSURLRequestEncoder *)v10 setRequestEncoding:2];
  [(AMSURLRequestEncoder *)v10 setDialogOptions:1];
  uint64_t v11 = AMSLogKey();
  [(AMSURLRequestEncoder *)v10 setLogUUID:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = [v6 base64EncodedStringWithOptions:0];

  objc_msgSend(v12, "ams_setNullableObject:forKey:", v13, @"clientData");
  v14 = +[AMSDevice deviceGUID];
  objc_msgSend(v12, "ams_setNullableObject:forKey:", v14, @"guid");

  int64_t v15 = [(AMSAnisetteProvisionTask *)self type];
  if (v15 == 2)
  {
    v28 = [(AMSAnisetteProvisionTask *)self bag];
    v27 = [v28 URLForKey:@"amd-finish-provisioning"];

LABEL_11:
    char v29 = [(AMSURLRequestEncoder *)v10 requestWithMethod:4 bagURL:v27 parameters:v12];
    id v30 = [v29 resultWithError:a4];

    goto LABEL_24;
  }
  if (v15 == 1)
  {
    v16 = +[AMSKeybag sharedInstance];
    id v17 = objc_msgSend(v7, "ams_DSID");
    id v45 = 0;
    v18 = [v16 keybagSyncDataWithAccountID:v17 transactionType:1 error:&v45];
    id v19 = v45;

    objc_msgSend(v12, "ams_setNullableObject:forKey:", v18, @"kbsync");
    uint64_t v20 = objc_msgSend(v7, "ams_DSID");
    objc_msgSend(v12, "ams_setNullableObject:forKey:", v20, @"dsId");

    if (v19)
    {
      v21 = +[AMSLogConfig sharedAccountsConfig];
      if (!v21)
      {
        v21 = +[AMSLogConfig sharedConfig];
      }
      v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v44 = a4;
        uint64_t v23 = objc_opt_class();
        id v41 = v23;
        v24 = AMSLogKey();
        uint64_t v40 = objc_msgSend(v7, "ams_DSID");
        AMSHashIfNeeded(v40);
        v25 = v42 = v18;
        *(_DWORD *)buf = 138544130;
        v47 = v23;
        a4 = v44;
        __int16 v48 = 2114;
        uint64_t v49 = (uint64_t)v24;
        __int16 v50 = 2114;
        uint64_t v51 = (uint64_t)v25;
        __int16 v52 = 2114;
        int64_t v53 = (int64_t)v19;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch keybag data for account: %{public}@. Error: %{public}@", buf, 0x2Au);

        v18 = v42;
      }
    }
    v26 = [(AMSAnisetteProvisionTask *)self bag];
    v27 = [v26 URLForKey:@"md-finish-provisioning"];

    goto LABEL_11;
  }
  id v31 = +[AMSLogConfig sharedAccountsConfig];
  if (!v31)
  {
    id v31 = +[AMSLogConfig sharedConfig];
  }
  id v32 = [v31 OSLogObject];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    id v33 = a4;
    unsigned int v34 = AMSLogKey();
    v35 = NSString;
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = v36;
    if (v34)
    {
      uint64_t v43 = AMSLogKey();
      [v35 stringWithFormat:@"%@: [%@] ", v37, v43];
    }
    else
    {
      [v35 stringWithFormat:@"%@: ", v36];
    v38 = };
    *(_DWORD *)buf = 138544130;
    v47 = v38;
    __int16 v48 = 2048;
    uint64_t v49 = 1;
    __int16 v50 = 2048;
    uint64_t v51 = 2;
    __int16 v52 = 2048;
    int64_t v53 = [(AMSAnisetteProvisionTask *)self type];
    _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid type. Expected %ld or %ld, got %ld.", buf, 0x2Au);
    if (v34)
    {

      v38 = (void *)v43;
    }

    a4 = v33;
  }

  if (a4)
  {
    AMSError(2, @"Anisette Provisioning Error", @"Invalid type.", 0);
    id v30 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = 0;
  }
LABEL_24:

  return v30;
}

- (BOOL)_processFinishProvisioningResult:(id)a3 sessionID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v8 = [v7 objectForKeyedSubscript:@"transportKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = [v7 objectForKeyedSubscript:@"keybag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id v12 = [v7 objectForKeyedSubscript:@"settingInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;

    if (v9 && v13)
    {
      if ([v11 length])
      {
        v14 = +[AMSKeybag sharedInstance];
        id v31 = 0;
        char v15 = [v14 importKeybagWithData:v11 error:&v31];
        id v30 = v31;

        if ((v15 & 1) == 0)
        {
          if (a5)
          {
            v28 = v30;
            AMSError(307, @"Anisette Provisioning Failed", @"Failed to import key bag data.", v30);
            BOOL v16 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_32;
          }
          BOOL v16 = 0;
LABEL_31:
          v28 = v30;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        id v30 = 0;
      }
      if (![v11 length])
      {
        id v17 = +[AMSLogConfig sharedConfig];
        if (!v17)
        {
          id v17 = +[AMSLogConfig sharedConfig];
        }
        v18 = [v17 OSLogObject];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = v19;
          __int16 v36 = 2114;
          uint64_t v37 = v20;
          _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Anisette provisioning did not provide keybag data", buf, 0x16u);
        }
      }
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
      id v23 = v21;
      [v23 bytes];
      [v23 length];
      id v24 = v22;
      [v24 bytes];
      [v24 length];
      uv5t6nhkui();
      BOOL v16 = v25 == 0;
      if (a5 && v25)
      {
        id v32 = @"AMSAnisetteErrorCode";
        v26 = [MEMORY[0x1E4F28ED0] numberWithInt:v25];
        id v33 = v26;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        AMSCustomError(@"AMSErrorDomain", 307, @"Anisette Provisioning Failed", @"Failed to finish machine provisioning.", v27, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_31;
    }
  }
  else
  {

    id v13 = 0;
  }
  if (a5)
  {
    AMSError(307, @"Anisette Provisioning Failed", @"The finish provisioning request's response was invalid.", 0);
    BOOL v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_33:

  return v16;
}

- (id)_startProvisioningWithOutputSessionID:(unsigned int *)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(AMSAnisetteProvisionTask *)self data];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    int64_t v9 = [(AMSAnisetteProvisionTask *)self type];
    v10 = [(AMSAnisetteProvisionTask *)self account];
    uint64_t v11 = +[AMSAnisette _accountIDForType:v9 account:v10];

    uint64_t v23 = 0;
    unsigned int v22 = 0;
    id v12 = [(AMSAnisetteProvisionTask *)self data];
    uint64_t v13 = [v12 bytes];
    v14 = [(AMSAnisetteProvisionTask *)self data];
    rsegvyrt87(v11, v13, [v14 length], (uint64_t)&v23, (uint64_t)&v22, (uint64_t)a3);
    uint64_t v16 = v15;

    if (v16)
    {
      if (a4)
      {
        id v24 = @"AMSAnisetteErrorCode";
        id v17 = [MEMORY[0x1E4F28ED0] numberWithInt:v16];
        v25[0] = v17;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        AMSCustomError(@"AMSErrorDomain", 307, @"Anisette Provisioning Failed", @"We failed to start provisioning", v18, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v19 = 0;
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v19 = (void *)[v20 initWithBytes:v23 length:v22];
    }
    if (v23) {
      jk24uiwqrg(v23);
    }
  }
  else if (a4)
  {
    AMSError(307, @"Anisette Provisioning Failed", @"No data found", 0);
    uint64_t v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = 0;
  }
  return v19;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end