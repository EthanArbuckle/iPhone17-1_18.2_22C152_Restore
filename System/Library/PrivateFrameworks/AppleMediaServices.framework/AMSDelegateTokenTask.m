@interface AMSDelegateTokenTask
- (AMSDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 bag:(id)a4 processInfo:(id)a5 account:(id)a6;
- (AMSProcessInfo)processInfo;
- (AMSURLResult)urlResult;
- (AMSURLTaskInfo)taskInfo;
- (id)_parseBiometricsSignatureRequestFromTask:(id)a3;
- (id)_performFallbackAuthentication;
- (id)authenticateTaskWithRequest:(id)a3;
- (id)delegateAuthenticateUrl;
- (id)performRetrieveDelegateToken;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)setProcessInfo:(id)a3;
- (void)setTaskInfo:(id)a3;
- (void)setUrlResult:(id)a3;
@end

@implementation AMSDelegateTokenTask

- (AMSDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 bag:(id)a4 processInfo:(id)a5 account:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDelegateTokenTask;
  v12 = [(AMSDelegateAuthenticateTask *)&v15 initWithDelegateAuthenticateRequest:a3 bag:a4 account:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_processInfo, a5);
  }

  return v13;
}

- (id)performRetrieveDelegateToken
{
  v3 = [AMSMutableLazyPromise alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke;
  v6[3] = &unk_1E55A0A90;
  v6[4] = self;
  v4 = [(AMSMutableLazyPromise *)v3 initWithBlock:v6];
  return v4;
}

void __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AMSSetLogKeyIfNeeded();
  v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = objc_opt_class();
    __int16 v40 = 2114;
    v41 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin requesting delegate auth endpoint", buf, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  id v37 = 0;
  v8 = [v7 _encodedURLRequestWithError:&v37];
  id v9 = v37;
  if (v9)
  {
    id v10 = v9;
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v13;
      __int16 v40 = 2114;
      v41 = v4;
      __int16 v42 = 2114;
      id v43 = v10;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Encoding URL request failed with error: %{public}@", buf, 0x20u);
    }

    [v3 finishWithError:v10];
  }
  else
  {
    v14 = objc_alloc_init(AMSPromise);
    objc_super v15 = [*(id *)(a1 + 32) session];
    v16 = [(AMSPromise *)v14 completionHandlerAdapter];
    v17 = [v15 dataTaskWithRequest:v8 completionHandler:v16];

    v18 = +[AMSURLTaskInfo createTaskInfoForTask:v17];
    [*(id *)(a1 + 32) setTaskInfo:v18];

    [v17 resume];
    id v36 = 0;
    v19 = [(AMSPromise *)v14 resultWithError:&v36];
    id v10 = v36;
    if (v10)
    {
      v20 = +[AMSLogConfig sharedConfig];
      if (!v20)
      {
        v20 = +[AMSLogConfig sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v39 = v22;
        __int16 v40 = 2114;
        v41 = v4;
        __int16 v42 = 2114;
        id v43 = v10;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", buf, 0x20u);
      }

      [v3 finishWithError:v10];
    }
    else
    {
      v23 = [*(id *)(a1 + 32) _parseFormDataFromResult:v19];
      [*(id *)(a1 + 32) setFormData:v23];

      [*(id *)(a1 + 32) setUrlResult:v19];
      v24 = +[AMSLogConfig sharedConfig];
      if (!v24)
      {
        v24 = +[AMSLogConfig sharedConfig];
      }
      v25 = objc_msgSend(v24, "OSLogObject", v19);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v26;
        __int16 v40 = 2114;
        v41 = v4;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed requesting delegate auth endpoint", buf, 0x16u);
      }

      v27 = [*(id *)(a1 + 32) _parseBiometricsSignatureRequestFromTask:v17];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_4;
      v34[3] = &unk_1E55A1B78;
      v34[4] = *(void *)(a1 + 32);
      id v28 = v4;
      id v35 = v28;
      v29 = [v27 continueWithBlock:v34];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_2;
      v31[3] = &unk_1E55A1BA0;
      v31[4] = *(void *)(a1 + 32);
      id v32 = v28;
      id v33 = v3;
      [v29 resultWithCompletion:v31];

      v19 = v30;
    }
  }
}

id __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) setSignatureResult:a2];
    v6 = [*(id *)(a1 + 32) performDelegateAuthentication];
  }
  else
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Biometrics failed with error: %{public}@", buf, 0x20u);
    }

    if (objc_msgSend(v5, "ams_hasDomain:code:", @"AMSErrorDomain", 6))
    {
      id v11 = AMSError(100, @"Biometrics were canceled during authentication", 0, v5);
      uint64_t v12 = +[AMSPromise promiseWithError:v11];
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) _performFallbackAuthentication];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_5;
      v14[3] = &unk_1E55A1B50;
      v14[4] = *(void *)(a1 + 32);
      uint64_t v12 = [v11 continueWithBlock:v14];
    }
    v6 = (void *)v12;
  }
  return v6;
}

id __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:");
  }
  else {
  id v3 = [*(id *)(a1 + 32) performDelegateAuthentication];
  }
  return v3;
}

void __52__AMSDelegateTokenTask_performRetrieveDelegateToken__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 serverResponse];
  v7 = [AMSDelegateAuthenticateResult alloc];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v6];
  uint64_t v9 = [(AMSDelegateAuthenticateResult *)v7 initWithServerResponse:v8];

  if (v5)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = *(void *)(a1 + 40);
      int v17 = 138543874;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An error occurred while attempting to get delegate token: %{public}@", (uint8_t *)&v17, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithError:v5];
  }
  else
  {
    v14 = [(AMSDelegateAuthenticateResult *)v9 token];

    objc_super v15 = *(void **)(a1 + 48);
    if (v14)
    {
      [v15 finishWithResult:v9];
    }
    else
    {
      uint64_t v16 = AMSError(100, @"Failed to retrieve a Delegate Token", 0, 0);
      [v15 finishWithError:v16];
    }
  }
}

- (id)_parseBiometricsSignatureRequestFromTask:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v4 = AMSSetLogKeyIfNeeded();
  id v5 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v5 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
  [(AMSKeychainOptions *)v5 setPurpose:0];
  v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2114;
    uint64_t v31 = v4;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proceeding with local authorization for delegate buy", buf, 0x16u);
  }
  v8 = (void *)v4;

  uint64_t v9 = [v25 response];
  uint64_t v10 = [(AMSDelegateAuthenticateTask *)self account];
  id v11 = [(AMSDelegateAuthenticateTask *)self session];
  uint64_t v12 = [(AMSDelegateTokenTask *)self processInfo];
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = +[AMSProcessInfo currentProcess];
  }
  id v27 = 0;
  v14 = +[AMSBiometricsSignatureRequest biometricsSignatureRequestForURLResponse:v9 account:v10 session:v11 task:v25 clientInfo:v13 options:v5 error:&v27];
  id v15 = v27;
  if (!v12) {

  }
  if (v14)
  {
    uint64_t v16 = objc_alloc_init(AMSMutablePromise);
    int v17 = [[AMSBiometricsSignatureTask alloc] initWithRequest:v14];

    uint64_t v18 = [(AMSBiometricsSignatureTask *)v17 performSignature];
    id v26 = 0;
    __int16 v19 = [v18 resultWithError:&v26];
    id v15 = v26;

    if (v19)
    {
      [(AMSMutablePromise *)v16 finishWithResult:v19];
    }
    else if (v15)
    {
      [(AMSMutablePromise *)v16 finishWithError:v15];
    }
    else
    {
      uint64_t v23 = AMSError(0, @"An unknown error with biometrics occurred", 0, 0);
      [(AMSMutablePromise *)v16 finishWithError:v23];
    }
  }
  else
  {
    uint64_t v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    __int16 v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      uint64_t v31 = (uint64_t)v8;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not create biometrics signature request. error: %{public}@", buf, 0x20u);
    }

    uint64_t v16 = +[AMSPromise promiseWithError:v15];
  }

  return v16;
}

- (id)_performFallbackAuthentication
{
  id v3 = [(AMSDelegateTokenTask *)self urlResult];
  uint64_t v4 = [v3 response];
  id v5 = [(AMSDelegateTokenTask *)self taskInfo];
  v6 = +[AMSFinanceAuthenticateResponse performAuthFromResponse:v4 taskInfo:v5];
  id v21 = 0;
  v7 = [v6 resultWithError:&v21];
  id v8 = v21;

  uint64_t v9 = [v7 value];
  uint64_t v10 = v9;
  if (!v9)
  {
    id v11 = @"Authentication failed";
LABEL_5:
    uint64_t v12 = v8;
    goto LABEL_6;
  }
  if ([v9 actionType] == 3)
  {
    id v11 = @"The Authentication Attempt was cancelled";
    uint64_t v12 = 0;
LABEL_6:
    uint64_t v13 = AMSError(100, v11, 0, v12);
    uint64_t v14 = +[AMSPromise promiseWithError:v13];
LABEL_7:
    id v15 = (void *)v14;
    goto LABEL_8;
  }
  int v17 = [v10 error];

  if (v17)
  {
    uint64_t v13 = [v10 error];
    uint64_t v18 = AMSError(100, @"The Authentication Attempt encountered an error", 0, v13);
    id v15 = +[AMSPromise promiseWithError:v18];

    goto LABEL_8;
  }
  if (v8)
  {
    id v11 = @"The Authentication Attempt encountered an error";
    goto LABEL_5;
  }
  uint64_t v19 = [v10 authenticateResult];
  if (v19)
  {
    uint64_t v13 = (void *)v19;
    uint64_t v14 = +[AMSPromise promiseWithResult:v19];
    goto LABEL_7;
  }
  uint64_t v20 = AMSError(100, @"The Authentication Attempt encountered an error", 0, 0);
  id v15 = +[AMSPromise promiseWithError:v20];

  uint64_t v13 = 0;
LABEL_8:

  return v15;
}

- (id)authenticateTaskWithRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[AMSAuthenticateTask alloc] initWithRequest:v3];

  return v4;
}

- (id)delegateAuthenticateUrl
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"https://amp-account.itunes.apple.com/account/delegate/auth"];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  uint64_t v9 = [(AMSDelegateTokenTask *)self authenticateTaskWithRequest:a5];
  uint64_t v10 = [v9 performAuthentication];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__AMSDelegateTokenTask_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke;
  v12[3] = &unk_1E55A1BC8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 resultWithCompletion:v12];
}

void __80__AMSDelegateTokenTask_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    id v11 = AMSHashIfNeeded(v5);
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    int v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling AMSAuthenticateRequest. authenticateRequest = %{public}@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v12 = [v5 account];

  if (v12)
  {
    id v13 = [v5 account];
    [*(id *)(a1 + 32) setAccount:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void)setProcessInfo:(id)a3
{
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
}

- (AMSURLResult)urlResult
{
  return self->_urlResult;
}

- (void)setUrlResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlResult, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
}

@end