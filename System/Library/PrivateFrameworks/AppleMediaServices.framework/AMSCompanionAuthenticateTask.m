@interface AMSCompanionAuthenticateTask
- (id)_authenticateWithDelegateAuthToken:(id)a3;
- (id)_encodedAuthenticationRequestWithToken:(id)a3;
- (id)_performAuthenticationRequest:(id)a3;
- (id)performCompanionAuthentication;
@end

@implementation AMSCompanionAuthenticateTask

- (id)performCompanionAuthentication
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AMSCompanionAuthenticateTask_performCompanionAuthentication__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __62__AMSCompanionAuthenticateTask_performCompanionAuthentication__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = AMSSetLogKeyIfNeeded();
  v1 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v1)
  {
    v1 = +[AMSLogConfig sharedConfig];
  }
  v2 = [v1 OSLogObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = objc_opt_class();
    __int16 v8 = 2114;
    v9 = v0;
    _os_log_impl(&dword_18D554000, v2, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Platform not supported", (uint8_t *)&v6, 0x16u);
  }

  v3 = AMSError(5, @"Companion Auth Error", @"Platform not supported", 0);
  v4 = +[AMSPromise promiseWithError:v3];

  return v4;
}

- (id)_authenticateWithDelegateAuthToken:(id)a3
{
  id v4 = a3;
  v5 = AMSSetLogKeyIfNeeded();
  int v6 = [(AMSCompanionAuthenticateTask *)self _performAuthenticationRequest:v4];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AMSCompanionAuthenticateTask__authenticateWithDelegateAuthToken___block_invoke;
  v10[3] = &unk_1E55A1248;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  __int16 v8 = [v6 continueWithBlock:v10];

  return v8;
}

id __67__AMSCompanionAuthenticateTask__authenticateWithDelegateAuthToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    __int16 v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v26 = 138543874;
      uint64_t v27 = v9;
      __int16 v28 = 2114;
      uint64_t v29 = v10;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Companion authentication call failed with error: %{public}@", (uint8_t *)&v26, 0x20u);
    }

    id v11 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    v12 = [v5 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = *(void *)(a1 + 40);
      v18 = AMSHashIfNeeded(v13);
      int v26 = 138543874;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      uint64_t v29 = v17;
      __int16 v30 = 2114;
      id v31 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Companion authentication call finished with response = %{public}@", (uint8_t *)&v26, 0x20u);
    }
    if ([v5 responseStatusCode] == 200)
    {
      if (!v13) {
        id v13 = &unk_1EDD01A70;
      }
      id v11 = +[AMSPromise promiseWithResult:v13];
    }
    else
    {
      v19 = +[AMSLogConfig sharedConfigOversize];
      if (!v19)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = *(void *)(a1 + 40);
        v23 = AMSHashIfNeeded(v5);
        int v26 = 138543874;
        uint64_t v27 = v21;
        __int16 v28 = 2114;
        uint64_t v29 = v22;
        __int16 v30 = 2114;
        id v31 = v23;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected response from server: %{public}@", (uint8_t *)&v26, 0x20u);
      }
      v24 = AMSError(301, @"Companion authentication Failed", @"Companion authentication call failed with an unexpected server response.", 0);
      id v11 = +[AMSPromise promiseWithError:v24];
    }
  }

  return v11;
}

- (id)_encodedAuthenticationRequestWithToken:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  id v6 = +[AMSLogConfig sharedAccountsConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2114;
    uint64_t v21 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  __int16 v8 = [(AMSDelegateAuthenticateTask *)self bag];
  uint64_t v9 = [v8 URLForKey:@"companionAuthenticateUrl"];
  uint64_t v10 = [v9 valuePromise];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__AMSCompanionAuthenticateTask__encodedAuthenticationRequestWithToken___block_invoke;
  v15[3] = &unk_1E55A1270;
  v15[4] = self;
  id v16 = v5;
  id v17 = v4;
  id v11 = v4;
  id v12 = v5;
  id v13 = [v10 continueWithBlock:v15];

  return v13;
}

id __71__AMSCompanionAuthenticateTask__encodedAuthenticationRequestWithToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedAccountsConfig];
  __int16 v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      __int16 v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = AMSHashIfNeeded(@"companionAuthenticateUrl");
      int v25 = 138544130;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      __int16 v30 = v12;
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", (uint8_t *)&v25, 0x2Au);
    }
    id v13 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    if (!v7)
    {
      __int16 v8 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v8 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = *(void *)(a1 + 40);
      int v25 = 138543618;
      uint64_t v26 = v15;
      __int16 v27 = 2114;
      uint64_t v28 = v16;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed extracting URL endpoint from bag", (uint8_t *)&v25, 0x16u);
    }

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v17, "ams_setNullableObject:forKey:", *(void *)(a1 + 48), @"delegateAuthToken");
    v18 = +[AMSDevice deviceGUID];
    objc_msgSend(v17, "ams_setNullableObject:forKey:", v18, @"guid");

    uint64_t v19 = (void *)[v17 copy];
    __int16 v20 = objc_alloc_init(AMSKeychainOptions);
    [(AMSKeychainOptions *)v20 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
    [(AMSKeychainOptions *)v20 setPurpose:0];
    uint64_t v21 = objc_alloc_init(AMSURLRequestEncoder);
    uint64_t v22 = [*(id *)(a1 + 32) account];
    [(AMSURLRequestEncoder *)v21 setAccount:v22];

    v23 = [*(id *)(a1 + 32) bag];
    [(AMSURLRequestEncoder *)v21 setBag:v23];

    [(AMSURLRequestEncoder *)v21 setDialogOptions:2];
    [(AMSURLRequestEncoder *)v21 setLogUUID:*(void *)(a1 + 40)];
    [(AMSURLRequestEncoder *)v21 setKeychainOptions:v20];
    [(AMSURLRequestEncoder *)v21 setUrlKnownToBeTrusted:1];
    [(AMSURLRequestEncoder *)v21 setRequestEncoding:3];
    id v13 = [(AMSURLRequestEncoder *)v21 requestWithMethod:4 URL:v5 headers:0 parameters:v19];
  }
  return v13;
}

- (id)_performAuthenticationRequest:(id)a3
{
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  id v6 = [(AMSCompanionAuthenticateTask *)self _encodedAuthenticationRequestWithToken:v4];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__AMSCompanionAuthenticateTask__performAuthenticationRequest___block_invoke;
  v10[3] = &unk_1E55A1298;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  __int16 v8 = [v6 continueWithBlock:v10];

  return v8;
}

id __62__AMSCompanionAuthenticateTask__performAuthenticationRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    __int16 v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v14 = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    id v11 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) session];
    id v11 = [v12 dataTaskPromiseWithRequest:v5];
  }
  return v11;
}

@end