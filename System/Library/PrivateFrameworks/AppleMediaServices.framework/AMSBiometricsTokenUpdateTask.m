@interface AMSBiometricsTokenUpdateTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSBiometricsTokenUpdateTask)initWithAccount:(id)a3;
- (AMSProcessInfo)clientInfo;
- (AMSRequestPresentationDelegate)presentationDelegate;
- (AMSURLSession)session;
- (BOOL)isUserInitiated;
- (BOOL)shouldGenerateKeysOnly;
- (BOOL)shouldPromptUser;
- (BOOL)shouldRequestConfirmation;
- (NSDictionary)additionalDialogMetrics;
- (id)_performBiometricsTokenUpdate;
- (id)performUpdate;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
- (void)setAdditionalDialogMetrics:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldGenerateKeysOnly:(BOOL)a3;
- (void)setShouldPromptUser:(BOOL)a3;
- (void)setShouldRequestConfirmation:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation AMSBiometricsTokenUpdateTask

- (AMSBiometricsTokenUpdateTask)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSBiometricsTokenUpdateTask;
  v6 = [(AMSTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)performUpdate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = AMSSetLogKeyIfNeeded();
  v4 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    __int16 v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting token update.", buf, 0x16u);
  }
  objc_super v9 = objc_alloc_init(AMSMutableBinaryPromise);
  if (+[AMSBiometrics type]
    && +[AMSBiometrics type] != 1)
  {
    v12 = [(AMSBiometricsTokenUpdateTask *)self _performBiometricsTokenUpdate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke;
    v17[3] = &unk_1E55A0778;
    v17[4] = self;
    v13 = v9;
    v18 = v13;
    [v12 addFinishBlock:v17];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke_7;
    v16[3] = &unk_1E559F028;
    v16[4] = self;
    [(AMSBinaryPromise *)v13 addErrorBlock:v16];
    v14 = v13;
  }
  else
  {
    v10 = AMSError(5, @"Token Update Error", @"Platform does not have LocalAuth", 0);
    [(AMSMutableBinaryPromise *)v9 finishWithError:v10];
    v11 = v9;
  }
  return v9;
}

void __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedBiometricsConfig];
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      v10 = AMSLogKey();
      int v16 = 138543874;
      v17 = v8;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2114;
      id v21 = v4;
      v11 = "%{public}@: [%{public}@] Completed with error: %{public}@";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_10:
      _os_log_impl(&dword_18D554000, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      id v9 = v15;
      v10 = AMSLogKey();
      int v16 = 138543618;
      v17 = v15;
      __int16 v18 = 2114;
      v19 = v10;
      v11 = "%{public}@: [%{public}@] Completed successfully";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }

  [*(id *)(a1 + 40) finishWithSuccess:v4 == 0 error:v4];
}

void __45__AMSBiometricsTokenUpdateTask_performUpdate__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  id v3 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    id v7 = (void *)v6;
    v8 = &stru_1EDCA7308;
    int v9 = 138543874;
    uint64_t v10 = v5;
    if (v2) {
      v8 = v2;
    }
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint32_t v14 = v8;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Biometrics token update failed. %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)_performBiometricsTokenUpdate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v5;
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending request to amsaccountsd", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint32_t v14 = __Block_byref_object_copy__13;
  uint64_t v15 = __Block_byref_object_dispose__13;
  int v16 = objc_alloc_init(AMSDaemonConnection);
  v8 = [*(id *)(*(void *)&buf[8] + 40) securityServiceProxyWithDelegate:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke;
  v12[3] = &unk_1E55A0668;
  v12[4] = self;
  v12[5] = buf;
  int v9 = [v8 thenWithBlock:v12];
  uint64_t v10 = [v9 binaryPromiseAdapter];

  _Block_object_dispose(buf, 8);
  return v10;
}

AMSMutablePromise *__61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = [*(id *)(a1 + 32) account];
  id v6 = [*(id *)(a1 + 32) clientInfo];
  id v7 = [*(id *)(a1 + 32) additionalDialogMetrics];
  uint64_t v8 = [*(id *)(a1 + 32) shouldGenerateKeysOnly];
  if ([*(id *)(a1 + 32) shouldRequestConfirmation]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [*(id *)(a1 + 32) shouldPromptUser];
  }
  uint64_t v10 = [*(id *)(a1 + 32) isUserInitiated];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke_2;
  v14[3] = &unk_1E55A0580;
  __int16 v11 = v4;
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v15 = v11;
  uint64_t v16 = v12;
  [v3 performBiometricTokenUpdateWithAccount:v5 clientInfo:v6 additionalDialogMetrics:v7 shouldGenerateKeysOnly:v8 shouldRequestConfirmation:v9 userInitiated:v10 completion:v14];

  return v11;
}

void __61__AMSBiometricsTokenUpdateTask__performBiometricsTokenUpdate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v4, "finishWithError:");
  }
  else {
    [v4 finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = AMSLogKey();
    __int16 v13 = AMSHashIfNeeded(v6);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v10;
    __int16 v23 = 2114;
    v24 = v12;
    __int16 v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling authenticate request. Request: %{public}@", buf, 0x20u);
  }
  uint32_t v14 = [(AMSBiometricsTokenUpdateTask *)self presentationDelegate];

  if (v14)
  {
    uint64_t v15 = [v6 options];
    [v15 setAllowPasswordGeneration:2];

    uint64_t v16 = [(AMSBiometricsTokenUpdateTask *)self presentationDelegate];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__AMSBiometricsTokenUpdateTask_handleAuthenticateRequest_completion___block_invoke;
    v18[3] = &unk_1E55A07A0;
    v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    [v16 handleAuthenticateRequest:v19 completion:v18];
  }
  else
  {
    uint64_t v17 = AMSError(6, @"Token Update Error", @"Could not handle authenticate request, presentation delegate not set", 0);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);
  }
}

void __69__AMSBiometricsTokenUpdateTask_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v9;
    id v11 = AMSLogKey();
    uint64_t v12 = AMSHashIfNeeded(*(void **)(a1 + 40));
    int v13 = 138543874;
    uint32_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    __int16 v18 = v12;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate handled authenticate request. Request: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    id v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog request. Request: %{public}@", buf, 0x20u);
  }
  int v13 = [(AMSBiometricsTokenUpdateTask *)self presentationDelegate];

  if (v13)
  {
    uint32_t v14 = [(AMSBiometricsTokenUpdateTask *)self presentationDelegate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__AMSBiometricsTokenUpdateTask_handleDialogRequest_completion___block_invoke;
    v16[3] = &unk_1E55A07C8;
    v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [v14 handleDialogRequest:v17 completion:v16];
  }
  else
  {
    __int16 v15 = AMSError(6, @"Token Update Error", @"Could not handle dialog request, presentation delegate not set", 0);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
  }
}

void __63__AMSBiometricsTokenUpdateTask_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v9;
    id v11 = AMSLogKey();
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138543874;
    uint32_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate handled dialog request. Request: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

+ (NSString)bagSubProfile
{
  return +[AMSPurchaseQueue bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSPurchaseQueue bagSubProfileVersion];
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)additionalDialogMetrics
{
  return self->_additionalDialogMetrics;
}

- (void)setAdditionalDialogMetrics:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (AMSRequestPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)shouldGenerateKeysOnly
{
  return self->_shouldGenerateKeysOnly;
}

- (void)setShouldGenerateKeysOnly:(BOOL)a3
{
  self->_shouldGenerateKeysOnly = a3;
}

- (BOOL)shouldRequestConfirmation
{
  return self->_shouldRequestConfirmation;
}

- (void)setShouldRequestConfirmation:(BOOL)a3
{
  self->_shouldRequestConfirmation = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)shouldPromptUser
{
  return self->_shouldPromptUser;
}

- (void)setShouldPromptUser:(BOOL)a3
{
  self->_shouldPromptUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_additionalDialogMetrics, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end