@interface AMSDelegatePurchaseTask
- (AMSBiometricsSignatureRequest)biometricsRequest;
- (AMSDelegatePaymentSheetTask)paymentSheetTask;
- (AMSDelegatePurchaseRequest)request;
- (AMSDelegatePurchaseTask)initWithDelegatePurchaseRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (AMSPaymentSheetResult)paymentSheetResult;
- (AMSURLResult)delegateAuthResult;
- (AMSURLTaskInfo)delegateAuthTaskInfo;
- (BOOL)_updateBiometricsTokenError:(id *)a3;
- (BOOL)cancel;
- (id)_fetchDelegateAuthResultWithRequest:(id)a3 error:(id *)a4;
- (id)_finishWithDelegateAuthenticateResult:(id)a3 resultError:(id)a4 outError:(id *)a5;
- (id)_performAuthenticateTaskWithPaymentSheet;
- (id)_performAuthenticateTaskWithPaymentSheetResult:(id)a3;
- (id)_performPaymentSheetTask;
- (id)_urlRequestForDelegateAuthError:(id *)a3;
- (id)_urlRequestParameters;
- (id)delegateAuthenticateUrl;
- (id)performDelegatePurchase;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)_parseBiometricsSignatureRequestFromTask:(id)a3;
- (void)setBiometricsRequest:(id)a3;
- (void)setDelegateAuthResult:(id)a3;
- (void)setDelegateAuthTaskInfo:(id)a3;
- (void)setPaymentSheetResult:(id)a3;
- (void)setPaymentSheetTask:(id)a3;
@end

@implementation AMSDelegatePurchaseTask

- (AMSDelegatePurchaseTask)initWithDelegatePurchaseRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSDelegatePurchaseTask;
  v10 = [(AMSDelegateAuthenticateTask *)&v13 initWithBag:a4 account:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_request, a3);
  }

  return v11;
}

- (BOOL)cancel
{
  v3 = [(AMSDelegatePurchaseTask *)self paymentSheetTask];
  [v3 cancel];

  v5.receiver = self;
  v5.super_class = (Class)AMSDelegatePurchaseTask;
  return [(AMSTask *)&v5 cancel];
}

- (id)performDelegatePurchase
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AMSDelegatePurchaseTask_performDelegatePurchase__block_invoke;
  v5[3] = &unk_1E55A11F8;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSTask *)self performTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __50__AMSDelegatePurchaseTask_performDelegatePurchase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = AMSSetLogKeyIfNeeded();
  if ([WeakRetained isCancelled])
  {
    objc_super v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      objc_super v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v7;
      __int16 v45 = 2114;
      v46 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ending early due to cancelled task", buf, 0x16u);
    }
    id v9 = AMSError(6, @"Early Cancellation", @"The task was cancelled before it began.", 0);
    id v10 = v9;
    if (a2)
    {
      id v10 = v9;
      v11 = 0;
      *a2 = v10;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    id v42 = 0;
    v12 = [WeakRetained _urlRequestForDelegateAuthError:&v42];
    id v13 = v42;
    if (v13)
    {
      id v10 = v13;
      if (a2)
      {
        id v10 = v13;
        v11 = 0;
        *a2 = v10;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      id v41 = 0;
      v14 = [WeakRetained _fetchDelegateAuthResultWithRequest:v12 error:&v41];
      id v15 = v41;
      if (!v15 || v14)
      {
        v16 = [WeakRetained _delegateAuthenticateResultFromUrlResult:v14];
        v17 = [v16 token];

        if (v17)
        {
          v11 = [WeakRetained _finishWithDelegateAuthenticateResult:v16 resultError:0 outError:a2];
          id v10 = 0;
        }
        else
        {
          [WeakRetained setDelegateAuthResult:v14];
          v18 = [WeakRetained _parseFormDataFromResult:v14];
          [WeakRetained setFormData:v18];

          v19 = [WeakRetained paymentSheetResult];

          if (v19) {
            goto LABEL_19;
          }
          v28 = [v14 task];
          [WeakRetained _parseBiometricsSignatureRequestFromTask:v28];

          v29 = [WeakRetained _performAuthenticateTaskWithPaymentSheet];
          id v40 = 0;
          id v30 = (id)[v29 resultWithError:&v40];
          id v10 = v40;

          if (!v10)
          {
LABEL_19:
            v20 = +[AMSLogConfig sharedConfig];
            if (!v20)
            {
              v20 = +[AMSLogConfig sharedConfig];
            }
            v21 = [v20 OSLogObject];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              uint64_t v44 = v22;
              __int16 v45 = 2114;
              v46 = v4;
              _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin fetching delegate auth token", buf, 0x16u);
            }

            v23 = [WeakRetained performDelegateAuthentication];
            id v39 = 0;
            uint64_t v38 = [v23 resultWithError:&v39];
            id v10 = v39;

            uint64_t v24 = +[AMSLogConfig sharedConfig];
            v25 = (void *)v24;
            if (v10)
            {
              if (!v24)
              {
                v25 = +[AMSLogConfig sharedConfig];
              }
              v26 = [v25 OSLogObject];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                uint64_t v27 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                uint64_t v44 = v27;
                __int16 v45 = 2114;
                v46 = v4;
                __int16 v47 = 2114;
                id v48 = v10;
                _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate task failed with error: %{public}@", buf, 0x20u);
              }

              v11 = 0;
              if (a2) {
                *a2 = v10;
              }
              v36 = (void *)v38;
            }
            else
            {
              if (!v24)
              {
                v25 = +[AMSLogConfig sharedConfig];
              }
              v34 = [v25 OSLogObject];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v35 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                uint64_t v44 = v35;
                __int16 v45 = 2114;
                v46 = v4;
                _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed fetching delegate auth token", buf, 0x16u);
              }

              v36 = (void *)v38;
              v11 = [WeakRetained _finishWithDelegateAuthenticateResult:v38 resultError:0 outError:a2];
            }
          }
          else
          {
            v31 = +[AMSLogConfig sharedConfig];
            if (!v31)
            {
              v31 = +[AMSLogConfig sharedConfig];
            }
            v32 = [v31 OSLogObject];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              uint64_t v33 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              uint64_t v44 = v33;
              __int16 v45 = 2114;
              v46 = v4;
              __int16 v47 = 2114;
              id v48 = v10;
              _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate task failed with error: %{public}@", buf, 0x20u);
            }

            if (a2)
            {
              id v10 = v10;
              v11 = 0;
              *a2 = v10;
            }
            else
            {
              v11 = 0;
            }
          }
        }
      }
      else
      {
        v11 = [WeakRetained _finishWithDelegateAuthenticateResult:0 resultError:v15 outError:a2];
        id v10 = 0;
      }
    }
  }

  return v11;
}

- (id)delegateAuthenticateUrl
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = AMSSetLogKeyIfNeeded();
  v4 = [(AMSDelegateAuthenticateTask *)self bag];
  objc_super v5 = [v4 URLForKey:@"delegateAuthenticateBuy"];
  id v18 = 0;
  id v6 = [v5 valueWithError:&v18];
  id v7 = v18;

  if (objc_msgSend(v7, "ams_hasDomain:code:", @"AMSErrorDomain", 204)) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {

    id v9 = [(AMSDelegateAuthenticateTask *)self bag];
    id v10 = [v9 URLForKey:@"delegateAuthenticateAccount"];
    id v17 = 0;
    id v6 = [v10 valueWithError:&v17];
    id v7 = v17;
  }
  if (v7)
  {
    v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSHashIfNeeded(@"delegateAuthenticateAccount");
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      uint64_t v22 = v3;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);
    }
    id v15 = 0;
  }
  else
  {
    id v15 = v6;
  }

  return v15;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, id, AMSAuthenticateTask *))a6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v13 = +[AMSLogConfig sharedConfig];
  v14 = (void *)v13;
  if (isKindOfClass)
  {
    if (!v13)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      id v18 = AMSHashIfNeeded(v10);
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v16;
      __int16 v34 = 2114;
      uint64_t v35 = v17;
      __int16 v36 = 2114;
      v37 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling AMSDelegateAuthenticateRequest. authenticateRequest = %{public}@", buf, 0x20u);
    }
    [(AMSDelegatePurchaseTask *)self _parseBiometricsSignatureRequestFromTask:v9];
    v19 = [(AMSDelegatePurchaseTask *)self _performAuthenticateTaskWithPaymentSheet];
    id v31 = 0;
    uint64_t v20 = [v19 resultWithError:&v31];
    __int16 v21 = (AMSAuthenticateTask *)v31;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (!v13)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v22 = [v14 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = AMSLogKey();
      __int16 v25 = AMSHashIfNeeded(v10);
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v23;
      __int16 v34 = 2114;
      uint64_t v35 = v24;
      __int16 v36 = 2114;
      v37 = v25;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling AMSAuthenticateRequest. authenticateRequest = %{public}@", buf, 0x20u);
    }
    __int16 v21 = [[AMSAuthenticateTask alloc] initWithRequest:v10];
    id v26 = [(AMSAuthenticateTask *)v21 performAuthentication];
    id v30 = 0;
    uint64_t v27 = [v26 resultWithError:&v30];
    uint64_t v20 = (AMSAuthenticateTask *)v30;

    v28 = [v27 account];

    if (v28)
    {
      v29 = [v27 account];
      [(AMSDelegateAuthenticateTask *)self setAccount:v29];
    }
    v11[2](v11, v27, v20);
  }
}

- (id)_fetchDelegateAuthResultWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(AMSPromise);
  BOOL v8 = [(AMSDelegateAuthenticateTask *)self session];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__AMSDelegatePurchaseTask__fetchDelegateAuthResultWithRequest_error___block_invoke;
  v29[3] = &unk_1E55A1B00;
  v29[4] = self;
  id v9 = [(AMSPromise *)v7 completionHandlerAdapter];
  [v8 createDataTaskWithRequest:v6 activity:0 dataTaskCreationCompletionHandler:v29 requestCompletionHandler:v9];

  id v28 = 0;
  id v10 = [(AMSPromise *)v7 resultWithError:&v28];
  id v11 = v28;
  uint64_t v12 = +[AMSLogConfig sharedConfig];
  uint64_t v13 = (void *)v12;
  if (v11)
  {
    if (!v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = AMSLogKey();
      uint64_t v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        [v16 stringWithFormat:@"%@: [%@] ", v18, self];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      v19 = };
      *(_DWORD *)buf = 138543618;
      id v31 = v19;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@URL request failed with error: %{public}@", buf, 0x16u);
      if (v15)
      {

        v19 = self;
      }
    }
    id v26 = 0;
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    if (!v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = [v13 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = AMSLogKey();
      uint64_t v22 = NSString;
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = v23;
      if (v21)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        [v22 stringWithFormat:@"%@: [%@] ", v24, self];
      }
      else
      {
        [v22 stringWithFormat:@"%@: ", v23];
      __int16 v25 = };
      *(_DWORD *)buf = 138543362;
      id v31 = v25;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Completed requesting delegate auth endpoint", buf, 0xCu);
      if (v21)
      {

        __int16 v25 = self;
      }
    }
    id v26 = v10;
  }

  return v26;
}

void __69__AMSDelegatePurchaseTask__fetchDelegateAuthResultWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = +[AMSURLTaskInfo createTaskInfoForTask:v4];
  [*(id *)(a1 + 32) setDelegateAuthTaskInfo:v3];

  [v4 resume];
}

- (id)_finishWithDelegateAuthenticateResult:(id)a3 resultError:(id)a4 outError:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = AMSSetLogKeyIfNeeded();
  id v11 = [v9 serverResponse];

  uint64_t v12 = [(AMSDelegateAuthenticateResult *)[AMSDelegatePurchaseResult alloc] initWithServerResponse:v11];
  if (objc_msgSend(v8, "ams_hasDomain:code:", @"AMSErrorDomain", 6))
  {
    uint64_t v13 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v46 = v10;
      id v15 = AMSLogKey();
      uint64_t v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        [v16 stringWithFormat:@"%@: [%@] ", v18, self];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      v19 = };
      uint64_t v35 = AMSLogableError(v8);
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = (uint64_t)v19;
      __int16 v50 = 2114;
      v51 = v35;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@The purchase was canceled. error = %{public}@", buf, 0x16u);
      if (v15)
      {

        v19 = self;
      }

      id v10 = v46;
    }

    __int16 v32 = @"Purchase was cancelled";
    id v33 = @"The presented purchase was canceled.";
    uint64_t v34 = 6;
LABEL_24:
    __int16 v36 = AMSError(v34, v32, v33, 0);
    v37 = v36;
    if (a5) {
      *a5 = v36;
    }

    uint64_t v38 = 0;
    goto LABEL_37;
  }
  uint64_t v20 = [(AMSDelegateAuthenticateResult *)v12 token];

  if (!v20)
  {
    id v28 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v28)
    {
      id v28 = +[AMSLogConfig sharedConfig];
    }
    v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_opt_class();
      id v31 = AMSHashIfNeeded(v12);
      *(_DWORD *)buf = 138543874;
      uint64_t v49 = v30;
      __int16 v50 = 2114;
      v51 = v10;
      __int16 v52 = 2114;
      v53 = v31;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate result missing token: %{public}@", buf, 0x20u);
    }
    __int16 v32 = @"Missing Delegate Token";
    id v33 = @"The authentication result is missing a token.";
    uint64_t v34 = 7;
    goto LABEL_24;
  }
  if (v8)
  {
    __int16 v21 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v21)
    {
      __int16 v21 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v47 = v10;
      uint64_t v23 = AMSLogKey();
      uint64_t v24 = NSString;
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = v25;
      if (v23)
      {
        uint64_t v45 = AMSLogKey();
        [v24 stringWithFormat:@"%@: [%@] ", v26, v45];
      }
      else
      {
        [v24 stringWithFormat:@"%@: ", v25];
      uint64_t v27 = };
      id v39 = AMSLogableError(v8);
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = (uint64_t)v27;
      __int16 v50 = 2114;
      v51 = v39;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@Purchase returned an error but we have a result. error = %{public}@", buf, 0x16u);
      if (v23)
      {

        uint64_t v27 = (void *)v45;
      }

      id v10 = v47;
    }
  }
  id v40 = +[AMSLogConfig sharedConfig];
  if (!v40)
  {
    id v40 = +[AMSLogConfig sharedConfig];
  }
  id v41 = [v40 OSLogObject];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v49 = v42;
    __int16 v50 = 2114;
    v51 = v10;
    _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate purchase task completed successfully", buf, 0x16u);
  }

  v43 = [(AMSDelegatePurchaseTask *)self request];
  [(AMSDelegatePurchaseResult *)v12 setRequest:v43];

  uint64_t v38 = v12;
LABEL_37:

  return v38;
}

- (void)_parseBiometricsSignatureRequestFromTask:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = AMSSetLogKeyIfNeeded();
  id v6 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v6 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
  [(AMSKeychainOptions *)v6 setPurpose:0];
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2114;
    uint64_t v23 = v5;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proceeding with local authorization for delegate buy", buf, 0x16u);
  }

  id v9 = [v4 response];
  id v10 = [(AMSDelegateAuthenticateTask *)self account];
  id v11 = [(AMSDelegateAuthenticateTask *)self session];
  uint64_t v12 = +[AMSProcessInfo currentProcess];
  id v19 = 0;
  uint64_t v13 = +[AMSBiometricsSignatureRequest biometricsSignatureRequestForURLResponse:v9 account:v10 session:v11 task:v4 clientInfo:v12 options:v6 error:&v19];

  id v14 = v19;
  [(AMSDelegatePurchaseTask *)self setBiometricsRequest:v13];

  id v15 = [(AMSDelegatePurchaseTask *)self biometricsRequest];

  if (!v15)
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      uint64_t v23 = v5;
      __int16 v24 = 2114;
      id v25 = v14;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not create biometrics signature request. error: %{public}@", buf, 0x20u);
    }
  }
}

- (id)_performAuthenticateTaskWithPaymentSheetResult:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = AMSSetLogKeyIfNeeded();
  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543618;
    uint64_t v22 = objc_opt_class();
    __int16 v23 = 2114;
    __int16 v24 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting authenticate task", (uint8_t *)&v21, 0x16u);
  }

  id v8 = [v4 passwordEquivalentToken];

  if (v8)
  {
    uint64_t v9 = 1;
  }
  else
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
      int v21 = 138543618;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v5;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Payment sheet result has no password, falling back to silent-preferred authentication.", (uint8_t *)&v21, 0x16u);
    }

    uint64_t v9 = 0;
  }
  uint64_t v13 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v13 setAllowServerDialogs:1];
  [(AMSAuthenticateOptions *)v13 setAuthenticationType:v9];
  [(AMSAuthenticateOptions *)v13 setCanMakeAccountActive:0];
  id v14 = +[AMSProcessInfo currentProcess];
  [(AMSAuthenticateOptions *)v13 setClientInfo:v14];

  [(AMSAuthenticateOptions *)v13 setCredentialSource:2];
  -[AMSAuthenticateOptions setDebugReason:](v13, "setDebugReason:", @"-[AMSDelegatePurchaseTask _performAuthenticateTaskWithPaymentSheetResult:]");
  id v15 = [AMSAuthenticateTask alloc];
  uint64_t v16 = [(AMSDelegateAuthenticateTask *)self account];
  uint64_t v17 = [(AMSAuthenticateTask *)v15 initWithAccount:v16 options:v13];

  uint64_t v18 = [v4 passwordEquivalentToken];
  [(AMSAuthenticateTask *)v17 setPassword:v18];

  id v19 = [(AMSAuthenticateTask *)v17 performAuthentication];

  return v19;
}

- (id)_performAuthenticateTaskWithPaymentSheet
{
  objc_initWeak(&location, self);
  v2 = [AMSMutableLazyPromise alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__AMSDelegatePurchaseTask__performAuthenticateTaskWithPaymentSheet__block_invoke;
  v5[3] = &unk_1E55A0DE8;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSMutableLazyPromise *)v2 initWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __67__AMSDelegatePurchaseTask__performAuthenticateTaskWithPaymentSheet__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    objc_super v5 = AMSError(0, 0, 0, 0);
    [v3 finishWithError:v5];
  }
  id v6 = AMSSetLogKeyIfNeeded();
  id v7 = [WeakRetained _performPaymentSheetTask];
  id v51 = 0;
  id v8 = [v7 resultWithError:&v51];
  uint64_t v9 = (AMSAuthenticateResult *)v51;
  [WeakRetained setPaymentSheetResult:v8];

  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [WeakRetained paymentSheetResult];
    AMSHashIfNeeded(v13);
    id v14 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = v12;
    __int16 v54 = 2114;
    v55 = v6;
    __int16 v56 = 2114;
    v57 = v14;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate payment sheet completed with result: %{public}@", buf, 0x20u);
  }
  uint64_t v15 = +[AMSLogConfig sharedConfig];
  uint64_t v16 = (void *)v15;
  if (v9)
  {
    if (!v15)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v18;
      __int16 v54 = 2114;
      v55 = v6;
      __int16 v56 = 2114;
      v57 = v9;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate payment sheet failed with error: %{public}@", buf, 0x20u);
    }

    [v3 finishWithError:v9];
    goto LABEL_34;
  }
  if (!v15)
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v49 = v6;
  id v19 = [v16 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    int v21 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v22 = [WeakRetained paymentSheetResult];
    __int16 v23 = [v22 signatureResult];
    [v21 numberWithInt:v23 != 0];
    __int16 v24 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    id v48 = v3;
    uint64_t v25 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v26 = [WeakRetained paymentSheetResult];
    uint64_t v27 = [v26 passwordEquivalentToken];
    id v28 = [v25 numberWithInt:v27 != 0];
    *(_DWORD *)buf = 138544130;
    uint64_t v53 = v20;
    __int16 v54 = 2114;
    v55 = v49;
    __int16 v56 = 2114;
    v57 = v24;
    __int16 v58 = 2114;
    v59 = v28;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate payment sheet completed with biometric signature: %{public}@, PET: %{public}@", buf, 0x2Au);

    id v3 = v48;
  }

  v29 = [WeakRetained paymentSheetResult];
  uint64_t v30 = [v29 signatureResult];

  id v31 = [WeakRetained paymentSheetResult];
  __int16 v32 = v31;
  if (v30)
  {
    id v33 = [v31 signatureResult];
    [WeakRetained setSignatureResult:v33];

    uint64_t v34 = [AMSAuthenticateResult alloc];
    uint64_t v35 = [WeakRetained account];
    uint64_t v9 = [(AMSAuthenticateResult *)v34 initWithAccount:v35];

    [v3 finishWithResult:v9];
LABEL_19:
    id v6 = v49;
    goto LABEL_34;
  }
  __int16 v36 = [v31 passwordEquivalentToken];

  if (!v36)
  {
    AMSError(0, @"Missing Authentication", @"The result had neither a signature result nor a PET.", 0);
    uint64_t v9 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    [v3 finishWithError:v9];
    goto LABEL_19;
  }
  v37 = [WeakRetained paymentSheetResult];
  uint64_t v38 = [WeakRetained _performAuthenticateTaskWithPaymentSheetResult:v37];
  id v50 = 0;
  id v39 = [v38 resultWithError:&v50];
  uint64_t v9 = (AMSAuthenticateResult *)v50;

  id v40 = +[AMSLogConfig sharedConfig];
  if (!v40)
  {
    id v40 = +[AMSLogConfig sharedConfig];
  }
  id v41 = [v40 OSLogObject];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = objc_opt_class();
    AMSHashIfNeeded(v39);
    v43 = (AMSAuthenticateResult *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = v42;
    __int16 v54 = 2114;
    v55 = v49;
    __int16 v56 = 2114;
    v57 = v43;
    _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication task completed with result: %{public}@", buf, 0x20u);
  }
  if (v9)
  {
    uint64_t v44 = +[AMSLogConfig sharedConfig];
    id v6 = v49;
    if (!v44)
    {
      uint64_t v44 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v45 = [v44 OSLogObject];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v46;
      __int16 v54 = 2114;
      v55 = v49;
      __int16 v56 = 2114;
      v57 = v9;
      _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Authentication task failed with error: %{public}@", buf, 0x20u);
    }

    [v3 finishWithError:v9];
  }
  else
  {
    __int16 v47 = [v39 account];
    [WeakRetained setAccount:v47];

    [v3 finishWithResult:v39];
    id v6 = v49;
  }

LABEL_34:
}

- (id)_performPaymentSheetTask
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = AMSSetLogKeyIfNeeded();
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  objc_super v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = objc_opt_class();
    __int16 v44 = 2114;
    uint64_t v45 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting payment sheet task", buf, 0x16u);
  }

  if (![(AMSTask *)self isCancelled])
  {
    uint64_t v13 = [(AMSDelegatePurchaseTask *)self delegateAuthResult];
    id v14 = [v13 object];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"dialog"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;

      if (v16)
      {
        uint64_t v17 = [(AMSDelegatePurchaseTask *)self delegateAuthResult];
        id v11 = [v17 object];
        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v18 = [(AMSDelegatePurchaseTask *)self request];
    id v19 = [v18 purchaseResult];
    uint64_t v20 = [v19 responseDictionary];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v20;

      if (v21)
      {
        id v40 = @"dialog";
        uint64_t v17 = [(AMSDelegatePurchaseTask *)self request];
        uint64_t v22 = [v17 purchaseResult];
        __int16 v23 = [v22 responseDictionary];
        id v41 = v23;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];

LABEL_18:
        if (v11)
        {
          __int16 v24 = [AMSFinancePaymentSheetResponse alloc];
          uint64_t v25 = [(AMSDelegatePurchaseTask *)self biometricsRequest];
          uint64_t v26 = [(AMSDelegatePurchaseTask *)self delegateAuthTaskInfo];
          uint64_t v27 = [(AMSFinancePaymentSheetResponse *)v24 initWithResponseDictionary:v11 confirmationOnly:0 delegateAuthenticationRequired:1 biometricSignatureRequired:v25 != 0 taskInfo:v26];

          id v28 = [AMSPaymentSheetTask alloc];
          v29 = [(AMSFinancePaymentSheetResponse *)v27 paymentSheetRequest];
          uint64_t v30 = [(AMSDelegateAuthenticateTask *)self bag];
          id v31 = [(AMSPaymentSheetTask *)v28 initWithRequest:v29 bag:v30];

          __int16 v32 = [(AMSPaymentSheetTask *)v31 _buildPaymentRequest];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __51__AMSDelegatePurchaseTask__performPaymentSheetTask__block_invoke;
          v38[3] = &unk_1E55A1B28;
          v38[4] = self;
          id v39 = v27;
          id v33 = v27;
          id v6 = [v32 thenWithBlock:v38];

          goto LABEL_27;
        }
      }
    }
    else
    {
    }
    uint64_t v34 = +[AMSLogConfig sharedConfig];
    if (!v34)
    {
      uint64_t v34 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v43 = v36;
      __int16 v44 = 2114;
      uint64_t v45 = v3;
      _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate purchase failed for null response dictionary", buf, 0x16u);
    }

    id v11 = AMSError(2, @"Delegate purchase failed", @"Did not receive a response dictionary", 0);
    uint64_t v12 = objc_alloc_init(AMSMutablePromise);
    id v6 = v12;
    goto LABEL_26;
  }
  id v6 = objc_alloc_init(AMSMutablePromise);
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v9;
    __int16 v44 = 2114;
    uint64_t v45 = v10;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ending early due to cancelled task", buf, 0x16u);
  }
  id v11 = AMSError(6, @"Interrupted Cancellation", @"The task was cancelled just before presenting the payment sheet.", 0);
  uint64_t v12 = v6;
LABEL_26:
  [(AMSMutablePromise *)v12 finishWithError:v11];
LABEL_27:

  return v6;
}

id __51__AMSDelegatePurchaseTask__performPaymentSheetTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) biometricsRequest];

  if (v4)
  {
    objc_super v5 = [*(id *)(a1 + 32) biometricsRequest];
    objc_msgSend(v3, "setAccesssControlRef:", objc_msgSend(v5, "localAuthAccessControlRef"));

    id v6 = [*(id *)(a1 + 32) biometricsRequest];
    id v7 = [v6 localAuthContext];
    id v8 = [v7 externalizedContext];
    [v3 setExternalizedContext:v8];
  }
  uint64_t v9 = [v3 appleIDAuthenticationContext];

  if (!v9)
  {
    id v10 = [*(id *)(a1 + 32) request];
    id v11 = [v10 purchaseResult];
    uint64_t v12 = [v11 purchase];
    uint64_t v13 = [*(id *)(a1 + 40) paymentSheetRequest];
    id v14 = [v12 authenticationContextForRequest:v13];
    [v3 setAppleIDAuthenticationContext:v14];
  }
  uint64_t v15 = objc_alloc_init(AMSDelegatePaymentSheetRequest);
  id v16 = [*(id *)(a1 + 32) account];
  [(AMSPaymentSheetRequest *)v15 setAccount:v16];

  uint64_t v17 = [*(id *)(a1 + 32) biometricsRequest];
  [(AMSPaymentSheetRequest *)v15 setBiometricsRequest:v17];

  uint64_t v18 = [*(id *)(a1 + 32) request];
  id v19 = [v18 challenge];
  [(AMSPaymentSheetRequest *)v15 setDelegateAuthenticateChallenge:v19];

  [(AMSDelegatePaymentSheetRequest *)v15 setPaymentRequest:v3];
  uint64_t v20 = [*(id *)(a1 + 32) request];
  id v21 = [v20 userAgent];
  [(AMSPaymentSheetRequest *)v15 setUserAgent:v21];

  uint64_t v22 = [AMSDelegatePaymentSheetTask alloc];
  __int16 v23 = [*(id *)(a1 + 32) bag];
  __int16 v24 = [(AMSDelegatePaymentSheetTask *)v22 initWithRequest:v15 bag:v23];

  [*(id *)(a1 + 32) setPaymentSheetTask:v24];
  uint64_t v25 = [(AMSDelegatePaymentSheetTask *)v24 perform];

  return v25;
}

- (BOOL)_updateBiometricsTokenError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [AMSBiometricsTokenUpdateTask alloc];
  id v6 = [(AMSDelegateAuthenticateTask *)self account];
  id v7 = [(AMSBiometricsTokenUpdateTask *)v5 initWithAccount:v6];

  [(AMSBiometricsTokenUpdateTask *)v7 setUserInitiated:1];
  [(AMSBiometricsTokenUpdateTask *)v7 setPresentationDelegate:self];
  id v8 = [(AMSBiometricsTokenUpdateTask *)v7 performUpdate];
  id v20 = 0;
  char v9 = [v8 resultWithError:&v20];
  id v10 = v20;

  if (v10)
  {
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = AMSLogKey();
      id v14 = NSString;
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = v15;
      if (v13)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        [v14 stringWithFormat:@"%@: [%@] ", v16, self];
      }
      else
      {
        [v14 stringWithFormat:@"%@: ", v15];
      uint64_t v17 = };
      uint64_t v18 = AMSLogableError(v10);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      __int16 v24 = v18;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@Updating biometric token failed with error: %{public}@", buf, 0x16u);
      if (v13)
      {

        uint64_t v17 = self;
      }
    }
    if (a3) {
      *a3 = v10;
    }
  }

  return v9;
}

- (id)_urlRequestForDelegateAuthError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = AMSLogKey();
    char v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v3 = AMSLogKey();
      [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    uint64_t v12 = };
    *(_DWORD *)buf = 138543362;
    id v28 = v12;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Begin requesting delegate auth endpoint", buf, 0xCu);
    if (v8)
    {

      uint64_t v12 = (void *)v3;
    }
  }
  id v26 = 0;
  uint64_t v13 = [(AMSDelegateAuthenticateTask *)self _encodedURLRequestWithError:&v26];
  id v14 = v26;
  if (v14)
  {
    uint64_t v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = AMSLogKey();
      uint64_t v18 = NSString;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = v19;
      if (v17)
      {
        AMSLogKey();
        self = (AMSDelegatePurchaseTask *)objc_claimAutoreleasedReturnValue();
        [v18 stringWithFormat:@"%@: [%@] ", v20, self];
      }
      else
      {
        [v18 stringWithFormat:@"%@: ", v19];
      id v21 = };
      __int16 v24 = AMSLogableError(v14);
      *(_DWORD *)buf = 138543618;
      id v28 = v21;
      __int16 v29 = 2114;
      uint64_t v30 = v24;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@Encoding URL request failed with error: %{public}@", buf, 0x16u);
      if (v17)
      {

        id v21 = self;
      }
    }
    id v23 = 0;
    if (a3) {
      *a3 = v14;
    }
  }
  else
  {
    uint64_t v22 = [v13 properties];
    [v22 setDisableBiometricsResponseHandling:1];

    id v23 = v13;
  }

  return v23;
}

- (id)_urlRequestParameters
{
  uint64_t v3 = [(AMSDelegatePurchaseTask *)self request];
  id v4 = [v3 purchaseResult];
  objc_super v5 = [v4 purchase];
  id v6 = [v5 buyParams];
  id v7 = [v6 dictionary];

  id v8 = [(AMSDelegatePurchaseTask *)self request];
  char v9 = [v8 purchaseResult];
  uint64_t v10 = [v9 responseDictionary];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"delegateParams"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  uint64_t v13 = objc_msgSend(v7, "ams_dictionaryByAddingEntriesFromDictionary:", v12);
  v17.receiver = self;
  v17.super_class = (Class)AMSDelegatePurchaseTask;
  id v14 = [(AMSDelegateAuthenticateTask *)&v17 _urlRequestParameters];
  uint64_t v15 = objc_msgSend(v14, "ams_dictionaryByAddingEntriesFromDictionary:", v13);

  return v15;
}

- (AMSDelegatePurchaseRequest)request
{
  return self->_request;
}

- (AMSBiometricsSignatureRequest)biometricsRequest
{
  return self->_biometricsRequest;
}

- (void)setBiometricsRequest:(id)a3
{
}

- (AMSURLResult)delegateAuthResult
{
  return self->_delegateAuthResult;
}

- (void)setDelegateAuthResult:(id)a3
{
}

- (AMSURLTaskInfo)delegateAuthTaskInfo
{
  return self->_delegateAuthTaskInfo;
}

- (void)setDelegateAuthTaskInfo:(id)a3
{
}

- (AMSPaymentSheetResult)paymentSheetResult
{
  return self->_paymentSheetResult;
}

- (void)setPaymentSheetResult:(id)a3
{
}

- (AMSDelegatePaymentSheetTask)paymentSheetTask
{
  return self->_paymentSheetTask;
}

- (void)setPaymentSheetTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSheetTask, 0);
  objc_storeStrong((id *)&self->_paymentSheetResult, 0);
  objc_storeStrong((id *)&self->_delegateAuthTaskInfo, 0);
  objc_storeStrong((id *)&self->_delegateAuthResult, 0);
  objc_storeStrong((id *)&self->_biometricsRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end