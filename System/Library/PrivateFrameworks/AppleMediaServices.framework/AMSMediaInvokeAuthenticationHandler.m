@interface AMSMediaInvokeAuthenticationHandler
+ (BOOL)isInvokeAuthenticationEnabled;
+ (id)_authenticateRequestWithAuthType:(unint64_t)a3 taskInfo:(id)a4;
+ (id)_performAuthRequest:(id)a3 redirectURL:(id)a4 taskInfo:(id)a5;
+ (id)_presentAuthRequest:(id)a3 taskInfo:(id)a4;
+ (id)performAuthFromResponse:(id)a3 taskInfo:(id)a4;
+ (unint64_t)_authenticationTypeForResponse:(id)a3;
@end

@implementation AMSMediaInvokeAuthenticationHandler

+ (id)performAuthFromResponse:(id)a3 taskInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _authenticationTypeForResponse:v6];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      id v12 = v11;
      v13 = AMSSetLogKeyIfNeeded();
      v14 = objc_msgSend(v6, "ams_valueForHTTPHeaderField:", @"X-Apple-Invoke-Auth");
      int v20 = 138543874;
      v21 = v11;
      __int16 v22 = 2114;
      v23 = v13;
      __int16 v24 = 2114;
      v25 = v14;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected invoke auth type: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    v15 = +[AMSOptional optionalWithNil];
    v16 = +[AMSPromise promiseWithResult:v15];
  }
  else
  {
    v15 = [a1 _authenticateRequestWithAuthType:v8 taskInfo:v7];
    v17 = objc_msgSend(v6, "ams_valueForHTTPHeaderField:", @"Location");
    if (v17)
    {
      v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    }
    else
    {
      v18 = 0;
    }
    v16 = [a1 _performAuthRequest:v15 redirectURL:v18 taskInfo:v7];
  }
  return v16;
}

+ (BOOL)isInvokeAuthenticationEnabled
{
  return _os_feature_enabled_impl();
}

+ (unint64_t)_authenticationTypeForResponse:(id)a3
{
  v3 = objc_msgSend(a3, "ams_valueForHTTPHeaderField:", @"X-Apple-Invoke-Auth");
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [v3 componentsSeparatedByString:@" "];
  id v6 = [v4 setWithArray:v5];

  int v7 = [v6 containsObject:@"loud"];
  int v8 = [v6 containsObject:@"silent"];
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8) {
    uint64_t v9 = 1;
  }
  uint64_t v10 = 2;
  if (v8) {
    uint64_t v10 = 0;
  }
  if (v7) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }

  return v11;
}

+ (id)_authenticateRequestWithAuthType:(unint64_t)a3 taskInfo:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v6 setAuthenticationType:a3];
  [(AMSAuthenticateOptions *)v6 setAllowServerDialogs:a3 != 1];
  [(AMSAuthenticateOptions *)v6 setAllowSecondaryCredentialSource:0];
  [(AMSAuthenticateOptions *)v6 setCanMakeAccountActive:0];
  int v7 = [v5 properties];
  int v8 = [v7 clientInfo];
  [(AMSAuthenticateOptions *)v6 setClientInfo:v8];

  uint64_t v9 = [v5 properties];
  uint64_t v10 = [v9 account];
  char v11 = objc_msgSend(v10, "ams_isLocalAccount");

  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    v13 = [v5 properties];
    id v12 = [v13 account];
  }
  v14 = [[AMSAuthenticateRequest alloc] initWithAccount:v12 options:v6];
  v15 = [v5 properties];
  v16 = [v15 logUUID];
  [(AMSAuthenticateRequest *)v14 setLogKey:v16];

  return v14;
}

+ (id)_performAuthRequest:(id)a3 redirectURL:(id)a4 taskInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 _presentAuthRequest:a3 taskInfo:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__AMSMediaInvokeAuthenticationHandler__performAuthRequest_redirectURL_taskInfo___block_invoke;
  v15[3] = &unk_1E55A3AD8;
  id v17 = v8;
  id v18 = a1;
  id v16 = v9;
  id v11 = v8;
  id v12 = v9;
  v13 = [v10 continueWithBlock:v15];

  return v13;
}

id __80__AMSMediaInvokeAuthenticationHandler__performAuthRequest_redirectURL_taskInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = +[AMSLogConfig sharedAccountsConfig];
  if (!v7)
  {
    int v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = v9;
    id v12 = [v10 properties];
    v13 = [v12 logUUID];
    *(_DWORD *)int v20 = 138543874;
    *(void *)&v20[4] = v9;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    __int16 v23 = 1024;
    BOOL v24 = v5 != 0;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication finished (success: %d)", v20, 0x1Cu);
  }
  if (!v6)
  {
    v15 = 0;
    goto LABEL_10;
  }
  v14 = +[AMSURLAction actionWithError:v6];
  v15 = v14;
  if (!v14 || ![v14 actionType])
  {
LABEL_10:
    if (*(void *)(a1 + 40)) {
      +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:");
    }
    else {
    uint64_t v16 = +[AMSURLAction retryAction];
    }

    v15 = (void *)v16;
  }
  objc_msgSend(v15, "setRetryIdentifier:", 0x1EDCAA288, *(void *)v20);
  [v15 setReason:@"authentication"];
  [v15 setAuthenticateResult:v5];
  id v17 = [[AMSOptional alloc] initWithValue:v15];
  id v18 = +[AMSPromise promiseWithResult:v17];

  return v18;
}

+ (id)_presentAuthRequest:(id)a3 taskInfo:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 session];
  id v8 = [v7 delegate];
  char v9 = objc_opt_respondsToSelector();
  char v10 = objc_opt_respondsToSelector();
  if (v9 & 1) != 0 || (v10)
  {
    id v18 = +[AMSLogConfig sharedAccountsConfig];
    if (!v18)
    {
      id v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = objc_opt_class();
      id v30 = v20;
      __int16 v21 = [v6 properties];
      __int16 v22 = [v21 logUUID];
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      __int16 v34 = 2114;
      v35 = v22;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing authentication", buf, 0x16u);
    }
    id v17 = objc_alloc_init(AMSPromise);
    if (v9)
    {
      uint64_t v16 = [v6 task];
      __int16 v23 = [(AMSPromise *)v17 completionHandlerAdapter];
      [v8 AMSURLSession:v7 task:v16 handleAuthenticateRequest:v5 completion:v23];
    }
    else
    {
      BOOL v24 = +[AMSLogConfig sharedAccountsConfig];
      if (!v24)
      {
        BOOL v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = objc_opt_class();
        id v31 = v26;
        v27 = [v6 properties];
        v28 = [v27 logUUID];
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        __int16 v34 = 2114;
        v35 = v28;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for authentication handling", buf, 0x16u);
      }
      uint64_t v16 = [(AMSPromise *)v17 completionHandlerAdapter];
      [v8 AMSURLSession:v7 handleAuthenticateRequest:v5 completion:v16];
    }
  }
  else
  {
    uint64_t v16 = AMSErrorWithFormat(2, @"Media Authentication Error", @"No delegate to perform authentication: %@", v11, v12, v13, v14, v15, (uint64_t)v5);
    id v17 = +[AMSPromise promiseWithError:v16];
  }

  return v17;
}

@end