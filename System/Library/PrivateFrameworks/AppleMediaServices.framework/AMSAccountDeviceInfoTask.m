@interface AMSAccountDeviceInfoTask
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (ACAccountStore)accountStore;
- (AMSAccountDeviceInfoTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5;
- (AMSAccountDeviceInfoTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5 requestEncoder:(id)a6 session:(id)a7 serialNumber:(id)a8;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSURLRequestEncoder)requestEncoder;
- (AMSURLSession)session;
- (NSString)serialNumber;
- (id)_deviceInfoRequest;
- (id)_requestWithURL:(id)a3;
- (id)_updateAccountWithInfo:(id)a3;
- (id)perform;
- (void)setAccountStore:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setRequestEncoder:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AMSAccountDeviceInfoTask

- (AMSAccountDeviceInfoTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F18DD0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = +[AMSProcessInfo currentProcess];
  v13 = objc_msgSend(v8, "ams_configurationWithProcessInfo:bag:", v12, 0);

  v14 = [[AMSURLSession alloc] initWithConfiguration:v13 delegate:0 delegateQueue:0];
  v15 = [[AMSURLRequestEncoder alloc] initWithBag:v9];
  v16 = +[AMSDevice serialNumber];
  v17 = [(AMSAccountDeviceInfoTask *)self initWithAccount:v11 accountStore:v10 bag:v9 requestEncoder:v15 session:v14 serialNumber:v16];

  return v17;
}

- (AMSAccountDeviceInfoTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5 requestEncoder:(id)a6 session:(id)a7 serialNumber:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSAccountDeviceInfoTask;
  v18 = [(AMSTask *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_accountStore, a4);
    objc_storeStrong((id *)&v19->_bag, a5);
    objc_storeStrong((id *)&v19->_requestEncoder, a6);
    objc_storeStrong((id *)&v19->_session, a7);
    objc_storeStrong((id *)&v19->_serialNumber, a8);
  }

  return v19;
}

- (id)perform
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke;
  v5[3] = &unk_1E559EA38;
  v5[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v5];
  v3 = [v2 promiseWithTimeout:30.0];

  return v3;
}

id __35__AMSAccountDeviceInfoTask_perform__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) account];

  if (!v3)
  {
    v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    id v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      id v23 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v22;
      __int16 v36 = 2114;
      v37 = v23;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Aborting - missing account", buf, 0x16u);
    }
    objc_super v24 = @"Missing required account";
    v25 = @"Cannot perform account-device info lookup without account";
    goto LABEL_18;
  }
  v4 = [*(id *)(a1 + 32) serialNumber];

  uint64_t v5 = +[AMSLogConfig sharedConfig];
  v6 = (void *)v5;
  if (!v4)
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v26 = [v6 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_opt_class();
      v28 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v27;
      __int16 v36 = 2114;
      v37 = v28;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Aborting - missing serial number", buf, 0x16u);
    }
    objc_super v24 = @"Missing required serial number";
    v25 = @"Cannot perform account-device info lookup without serial number";
LABEL_18:
    AMSError(2, v24, v25, 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v19];
    goto LABEL_19;
  }
  if (!v5)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    id v10 = [*(id *)(a1 + 32) account];
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v8;
    __int16 v36 = 2114;
    v37 = v9;
    __int16 v38 = 2114;
    v39 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning account-device info task for account  %{public}@", buf, 0x20u);
  }
  id v11 = [*(id *)(a1 + 32) account];
  v12 = [*(id *)(a1 + 32) requestEncoder];
  [v12 setAccount:v11];

  v13 = [*(id *)(a1 + 32) requestEncoder];
  [v13 setUrlKnownToBeTrusted:1];

  v14 = [*(id *)(a1 + 32) _deviceInfoRequest];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_16;
  v33[3] = &unk_1E559E998;
  v33[4] = *(void *)(a1 + 32);
  id v15 = [v14 thenWithBlock:v33];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_2;
  v32[3] = &unk_1E559E9C0;
  v32[4] = *(void *)(a1 + 32);
  id v16 = [v15 thenWithBlock:v32];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_3;
  v30[3] = &unk_1E559EA10;
  v30[4] = *(void *)(a1 + 32);
  id v17 = v2;
  id v31 = v17;
  [v16 addFinishBlock:v30];
  v18 = v31;
  id v19 = v17;

LABEL_19:
  return v2;
}

id __35__AMSAccountDeviceInfoTask_perform__block_invoke_16(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 requestEncoder];
  uint64_t v5 = [v4 requestByEncodingRequest:v3 parameters:0];

  return v5;
}

id __35__AMSAccountDeviceInfoTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 session];
  uint64_t v5 = [v4 dataTaskPromiseWithRequest:v3];

  return v5;
}

void __35__AMSAccountDeviceInfoTask_perform__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      v28 = v10;
      __int16 v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get account-device info. Error: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    id v11 = [AMSAccountDeviceInfoResult alloc];
    v12 = [*(id *)(a1 + 32) account];
    v13 = [v5 object];
    v14 = [(AMSAccountDeviceInfoResult *)v11 initWithAccount:v12 responseDictionary:v13];

    id v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      v28 = v18;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieved account-device info:  %{public}@", buf, 0x20u);
    }
    id v19 = [*(id *)(a1 + 32) _updateAccountWithInfo:v14];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __35__AMSAccountDeviceInfoTask_perform__block_invoke_20;
    v22[3] = &unk_1E559E9E8;
    v20 = *(void **)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    id v23 = v20;
    objc_super v24 = v14;
    id v21 = v14;
    [v19 addFinishBlock:v22];
  }
}

void __35__AMSAccountDeviceInfoTask_perform__block_invoke_20(id *a1, char a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      int v22 = 138543874;
      uint64_t v23 = v8;
      __int16 v24 = 2114;
      v25 = v9;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update account. Error: %{public}@", (uint8_t *)&v22, 0x20u);
    }
    [a1[5] finishWithError:v5];
  }
  if (a2)
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      v14 = [a1[4] account];
      id v15 = [v14 hashedDescription];
      id v16 = [a1[6] isBundleOwner];
      int v22 = 138544130;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      v25 = v13;
      __int16 v26 = 2114;
      id v27 = v15;
      __int16 v28 = 2114;
      __int16 v29 = v16;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished updating account %{public}@ with property %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    [a1[5] finishWithResult:a1[6]];
  }
  else
  {
    uint64_t v17 = AMSError(0, @"Failed to update account", @"And unknown error occurred", 0);
    v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    id v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      id v21 = AMSLogKey();
      int v22 = 138543618;
      uint64_t v23 = v20;
      __int16 v24 = 2114;
      v25 = v21;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update account - no error provided", (uint8_t *)&v22, 0x16u);
    }
    [a1[5] finishWithError:v17];
  }
}

- (id)_deviceInfoRequest
{
  id v3 = [(AMSAccountDeviceInfoTask *)self bag];
  v4 = [v3 URLForKey:@"hardwareAssetInfo"];

  objc_initWeak(&location, self);
  id v5 = [v4 valuePromise];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__AMSAccountDeviceInfoTask__deviceInfoRequest__block_invoke;
  v8[3] = &unk_1E559EA60;
  objc_copyWeak(&v9, &location);
  v6 = [v5 thenWithBlock:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __46__AMSAccountDeviceInfoTask__deviceInfoRequest__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _requestWithURL:v3];

  v6 = +[AMSPromise promiseWithResult:v5];

  return v6;
}

- (id)_requestWithURL:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithURL:v5 resolvingAgainstBaseURL:0];

  id v7 = objc_alloc(MEMORY[0x1E4F290C8]);
  uint64_t v8 = [(AMSAccountDeviceInfoTask *)self serialNumber];
  id v9 = (void *)[v7 initWithName:@"sn" value:v8];
  v16[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v6 setQueryItems:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F18D50]);
  uint64_t v12 = [v6 URL];
  v13 = (void *)[v11 initWithURL:v12];

  [v13 setHTTPMethod:@"POST"];
  v14 = (void *)[v13 copy];

  return v14;
}

- (id)_updateAccountWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAccountDeviceInfoTask *)self account];
  v6 = [v4 isBundleOwner];

  objc_msgSend(v5, "ams_setIsBundleOwner:", v6);
  id v7 = [(AMSAccountDeviceInfoTask *)self accountStore];
  uint64_t v8 = [(AMSAccountDeviceInfoTask *)self account];
  id v9 = objc_msgSend(v7, "ams_saveAccount:withOptions:", v8, 1);

  return v9;
}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSURLRequestEncoder createBagForSubProfile];
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (AMSURLRequestEncoder)requestEncoder
{
  return self->_requestEncoder;
}

- (void)setRequestEncoder:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end