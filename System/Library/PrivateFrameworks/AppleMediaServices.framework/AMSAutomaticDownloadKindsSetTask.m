@interface AMSAutomaticDownloadKindsSetTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5;
- (AMSAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5 presentationDelegate:(id)a6;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSRequestPresentationDelegate)presentationDelegate;
- (AMSURLSession)session;
- (NSArray)enabledMediaKinds;
- (id)perform;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)setClientInfo:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AMSAutomaticDownloadKindsSetTask

- (AMSAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5 presentationDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSAutomaticDownloadKindsSetTask;
  v14 = [(AMSTask *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_account, a4);
    uint64_t v16 = [v10 copy];
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v15->_enabledMediaKinds, v18);

    objc_storeStrong((id *)&v15->_bag, a5);
    uint64_t v19 = +[AMSProcessInfo currentProcess];
    clientInfo = v15->_clientInfo;
    v15->_clientInfo = (AMSProcessInfo *)v19;

    objc_storeWeak((id *)&v15->_presentationDelegate, v13);
  }

  return v15;
}

- (AMSAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AMSAutomaticDownloadKindsSetTask;
  id v11 = [(AMSTask *)&v19 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    uint64_t v13 = [v8 copy];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v12->_enabledMediaKinds, v15);

    objc_storeStrong((id *)&v12->_bag, a5);
    uint64_t v16 = +[AMSProcessInfo currentProcess];
    clientInfo = v12->_clientInfo;
    v12->_clientInfo = (AMSProcessInfo *)v16;
  }
  return v12;
}

- (id)perform
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSAutomaticDownloadKindsSetTask *)self account];

  if (!v3)
  {
    v6 = AMSError(2, @"Invalid Parameter", @"An account is required.", 0);
    uint64_t v7 = +[AMSPromise promiseWithError:v6];
    goto LABEL_5;
  }
  v4 = [(AMSAutomaticDownloadKindsSetTask *)self account];
  int v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (v5)
  {
    v6 = AMSError(2, @"Invalid Parameter", @"We cannot sync the local account's automatic download kinds.", 0);
    uint64_t v7 = +[AMSPromise promiseWithError:v6];
LABEL_5:
    id v8 = (void *)v7;

    goto LABEL_21;
  }
  id v9 = [(AMSAutomaticDownloadKindsSetTask *)self account];
  id v10 = [v9 objectForKeyedSubscript:0x1EDCA6D88];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v11 = 0;
LABEL_15:
    v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    objc_super v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      v25 = [(AMSAutomaticDownloadKindsSetTask *)self account];
      AMSHashIfNeeded(v25);
      v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v27 = [(AMSAutomaticDownloadKindsSetTask *)self enabledMediaKinds];
      v28 = AMSHashIfNeeded(v27);
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2114;
      v48 = v26;
      LOWORD(v49) = 2114;
      *(void *)((char *)&v49 + 2) = v28;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing automatic download kinds. account = %{public}@ | enabled media kinds = %{public}@", buf, 0x2Au);
    }
    v29 = [AMSURLRequestEncoder alloc];
    v30 = [(AMSAutomaticDownloadKindsSetTask *)self bag];
    v20 = [(AMSURLRequestEncoder *)v29 initWithBag:v30];

    v31 = [(AMSAutomaticDownloadKindsSetTask *)self account];
    [(AMSURLRequestEncoder *)v20 setAccount:v31];

    [(AMSURLRequestEncoder *)v20 setRequestEncoding:2];
    v32 = AMSLogKey();
    [(AMSURLRequestEncoder *)v20 setLogUUID:v32];

    v33 = [(AMSAutomaticDownloadKindsSetTask *)self clientInfo];
    [(AMSURLRequestEncoder *)v20 setClientInfo:v33];

    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v35 = [(AMSAutomaticDownloadKindsSetTask *)self enabledMediaKinds];
    [v34 setObject:v35 forKeyedSubscript:@"media-types"];

    v36 = +[AMSDevice deviceGUID];
    objc_msgSend(v34, "ams_setNullableObject:forKey:", v36, @"guid");

    v37 = [(AMSAutomaticDownloadKindsSetTask *)self bag];
    v38 = [v37 URLForKey:@"register-media-types-url"];

    v39 = [(AMSURLRequestEncoder *)v20 requestWithMethod:4 bagURL:v38 parameters:v34];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke;
    v46[3] = &unk_1E559E9C0;
    v46[4] = self;
    v40 = [v39 thenWithBlock:v46];
    objc_initWeak(&location, self);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_2;
    v43[3] = &unk_1E559F408;
    objc_copyWeak(&v44, &location);
    id v8 = [v40 thenWithBlock:v43];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v48 = __Block_byref_object_copy__6;
    *(void *)&long long v49 = __Block_byref_object_dispose__6;
    *((void *)&v49 + 1) = self;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_33;
    v42[3] = &unk_1E559F430;
    v42[4] = buf;
    [v8 addFinishBlock:v42];
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

    goto LABEL_20;
  }
  id v11 = v10;

  if (!v11) {
    goto LABEL_15;
  }
  id v12 = [(AMSAutomaticDownloadKindsSetTask *)self enabledMediaKinds];
  int v13 = [v11 isEqualToArray:v12];

  if (!v13) {
    goto LABEL_15;
  }
  v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = objc_opt_class();
    v17 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Enabled media kinds are the same as our currently set values, skipping network request.", buf, 0x16u);
  }
  v18 = [AMSAutomaticDownloadKindsResult alloc];
  objc_super v19 = [(AMSAutomaticDownloadKindsSetTask *)self account];
  v20 = [(AMSAutomaticDownloadKindsResult *)v18 initWithAccount:v19 andEnabledMediaKinds:v11];

  id v8 = +[AMSPromise promiseWithResult:v20];
LABEL_20:

LABEL_21:
  return v8;
}

id __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[AMSURLSession defaultSession];
  int v5 = [v4 configuration];

  v6 = [[AMSURLSession alloc] initWithConfiguration:v5 delegate:*(void *)(a1 + 32) delegateQueue:0];
  [*(id *)(a1 + 32) setSession:v6];

  uint64_t v7 = [*(id *)(a1 + 32) session];
  id v8 = [v7 dataTaskPromiseWithRequest:v3];

  return v8;
}

id __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  int v5 = [v4 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6 && ![v6 integerValue])
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
      if (!v7)
      {
        uint64_t v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        uint64_t v10 = objc_opt_class();
        id v11 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v10;
        __int16 v37 = 2114;
        v38 = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully registered automatic media types.", buf, 0x16u);
      }
      id v12 = (id *)(a1 + 32);
      id v13 = objc_loadWeakRetained(v12);
      v14 = [v13 enabledMediaKinds];
      id v15 = objc_loadWeakRetained(v12);
      uint64_t v16 = [v15 account];
      [v16 setObject:v14 forKeyedSubscript:0x1EDCA6D88];

      v17 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      id v18 = objc_loadWeakRetained(v12);
      objc_super v19 = [v18 account];
      id v20 = (id)objc_msgSend(v17, "ams_saveAccount:verifyCredentials:", v19, 0);

      v21 = [AMSAutomaticDownloadKindsResult alloc];
      id v22 = objc_loadWeakRetained(v12);
      uint64_t v23 = [v22 account];
      id v24 = objc_loadWeakRetained(v12);
      v25 = [v24 enabledMediaKinds];
      v26 = [(AMSAutomaticDownloadKindsResult *)v21 initWithAccount:v23 andEnabledMediaKinds:v25];

      v27 = +[AMSPromise promiseWithResult:v26];
      goto LABEL_18;
    }
  }
  else
  {

    id v6 = 0;
  }
  v28 = +[AMSLogConfig sharedConfig];
  if (!v28)
  {
    v28 = +[AMSLogConfig sharedConfig];
  }
  v29 = [v28 OSLogObject];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v31 = objc_opt_class();
    v32 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v31;
    __int16 v37 = 2114;
    v38 = v32;
    __int16 v39 = 2048;
    uint64_t v40 = [v6 longValue];
    _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The server responded with invalid status: %ld", buf, 0x20u);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"The server responded with a non 0 status code: %ld", objc_msgSend(v6, "longValue"));
  v26 = (AMSAutomaticDownloadKindsResult *)objc_claimAutoreleasedReturnValue();
  v33 = AMSError(305, @"Invalid Server Response", v26, 0);
  v27 = +[AMSPromise promiseWithError:v33];

LABEL_18:
  return v27;
}

void __43__AMSAutomaticDownloadKindsSetTask_perform__block_invoke_33(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    int v5 = AMSLogKey();
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v9 = 138543874;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Releasing task: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v11 = a5;
  id v8 = (void (**)(id, void, void *))a6;
  int v9 = [(AMSAutomaticDownloadKindsSetTask *)self presentationDelegate];

  if (v9)
  {
    uint64_t v10 = [(AMSAutomaticDownloadKindsSetTask *)self presentationDelegate];
    [v10 handleAuthenticateRequest:v11 completion:v8];
  }
  else
  {
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v10 = AMSError(12, @"AMSAutomaticDownloadKindsSetTask failed", @"No presentation delegate to handle authentication request.", 0);
    v8[2](v8, 0, v10);
  }

LABEL_6:
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v11 = a5;
  id v8 = (void (**)(id, void, void *))a6;
  int v9 = [(AMSAutomaticDownloadKindsSetTask *)self presentationDelegate];

  if (v9)
  {
    uint64_t v10 = [(AMSAutomaticDownloadKindsSetTask *)self presentationDelegate];
    [v10 handleDialogRequest:v11 completion:v8];
  }
  else
  {
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v10 = AMSError(12, @"AMSAutomaticDownloadKindsSetTask failed", @"No presentation delegate to handle dialog request.", 0);
    v8[2](v8, 0, v10);
  }

LABEL_6:
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_3 != -1) {
    dispatch_once(&_MergedGlobals_1_3, &__block_literal_global_14);
  }
  v2 = (void *)qword_1EB38D078;
  return (NSString *)v2;
}

void __49__AMSAutomaticDownloadKindsSetTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D078;
  qword_1EB38D078 = @"AMSAutomaticDownloadKinds";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D080 != -1) {
    dispatch_once(&qword_1EB38D080, &__block_literal_global_49);
  }
  v2 = (void *)qword_1EB38D088;
  return (NSString *)v2;
}

void __56__AMSAutomaticDownloadKindsSetTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D088;
  qword_1EB38D088 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
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

- (NSArray)enabledMediaKinds
{
  return self->_enabledMediaKinds;
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (AMSRequestPresentationDelegate *)WeakRetained;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_enabledMediaKinds, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end