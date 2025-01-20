@interface AMSDelegateAuthenticateTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSBiometricsSignatureResult)signatureResult;
- (AMSDelegateAuthenticateRequest)request;
- (AMSDelegateAuthenticateTask)initWithBag:(id)a3 account:(id)a4;
- (AMSDelegateAuthenticateTask)initWithDelegateAuthenticateRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (AMSURLSession)session;
- (NSDictionary)formData;
- (id)_delegateAuthenticateResultFromUrlResult:(id)a3;
- (id)_encodedURLRequestWithError:(id *)a3;
- (id)_parseFormDataAsStringFromResult:(id)a3;
- (id)_parseFormDataFromResult:(id)a3;
- (id)_performDelegateAuthenticationWithError:(id *)a3;
- (id)_urlRequestParameters;
- (id)delegateAuthenticateUrl;
- (id)performDelegateAuthentication;
- (void)_init;
- (void)setAccount:(id)a3;
- (void)setFormData:(id)a3;
- (void)setSignatureResult:(id)a3;
@end

@implementation AMSDelegateAuthenticateTask

- (AMSDelegateAuthenticateTask)initWithDelegateAuthenticateRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDelegateAuthenticateTask;
  v12 = [(AMSTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a5);
    objc_storeStrong((id *)&v13->_bag, a4);
    objc_storeStrong((id *)&v13->_request, a3);
    [(AMSDelegateAuthenticateTask *)v13 _init];
  }

  return v13;
}

- (AMSDelegateAuthenticateTask)initWithBag:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDelegateAuthenticateTask;
  id v9 = [(AMSTask *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a4);
    objc_storeStrong((id *)&v10->_bag, a3);
    [(AMSDelegateAuthenticateTask *)v10 _init];
  }

  return v10;
}

- (void)_init
{
  objc_msgSend(MEMORY[0x1E4F18DD0], "ams_configurationWithProcessInfo:bag:", 0, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [[AMSURLSession alloc] initWithConfiguration:v5 delegate:self delegateQueue:0];
  session = self->_session;
  self->_session = v3;
}

- (id)performDelegateAuthentication
{
  v3 = [AMSMutableLazyPromise alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__AMSDelegateAuthenticateTask_performDelegateAuthentication__block_invoke;
  v6[3] = &unk_1E55A0A90;
  v6[4] = self;
  v4 = [(AMSMutableLazyPromise *)v3 initWithBlock:v6];
  return v4;
}

void __60__AMSDelegateAuthenticateTask_performDelegateAuthentication__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AMSSetLogKeyIfNeeded();
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = objc_opt_class();
    __int16 v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting delegate authenticate task", buf, 0x16u);
  }

  id v7 = *(void **)(a1 + 32);
  id v23 = 0;
  id v8 = [v7 _performDelegateAuthenticationWithError:&v23];
  id v9 = v23;
  uint64_t v10 = +[AMSLogConfig sharedConfig];
  id v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    objc_super v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      v27 = v4;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate authenticate call failed with error: %{public}@", buf, 0x20u);
    }

    [v3 finishWithError:v9];
  }
  else
  {
    if (!v10)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate authenticate call succeeded", buf, 0x16u);
    }

    v16 = [*(id *)(a1 + 32) _delegateAuthenticateResultFromUrlResult:v8];
    v17 = [v16 token];

    if (v17)
    {
      [v3 finishWithResult:v16];
    }
    else
    {
      v18 = +[AMSLogConfig sharedConfigOversize];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = objc_opt_class();
        v21 = AMSHashIfNeeded(v8);
        *(_DWORD *)buf = 138543874;
        uint64_t v25 = v20;
        __int16 v26 = 2114;
        v27 = v4;
        __int16 v28 = 2114;
        id v29 = v21;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected response from server: %{public}@", buf, 0x20u);
      }
      v22 = AMSError(301, @"Delegate Authenticate Failed", @"Delegate authenticate call failed with an unexpected server response.", 0);
      [v3 finishWithError:v22];
    }
  }
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSDelegateAuthenticate";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  return 0;
}

- (id)_encodedURLRequestWithError:(id *)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = AMSSetLogKeyIfNeeded();
  v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = objc_opt_class();
    __int16 v35 = 2114;
    v36 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  id v8 = [(AMSDelegateAuthenticateTask *)self delegateAuthenticateUrl];
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = objc_msgSend(v9, "OSLogObject", a3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v11;
      __int16 v35 = 2114;
      v36 = v5;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed extracting URL endpoint from bag", buf, 0x16u);
    }

    objc_super v12 = objc_alloc_init(AMSKeychainOptions);
    [(AMSKeychainOptions *)v12 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
    [(AMSKeychainOptions *)v12 setPurpose:0];
    uint64_t v13 = objc_alloc_init(AMSURLRequestEncoder);
    v14 = [(AMSDelegateAuthenticateTask *)self account];
    [(AMSURLRequestEncoder *)v13 setAccount:v14];

    uint64_t v15 = [(AMSDelegateAuthenticateTask *)self bag];
    [(AMSURLRequestEncoder *)v13 setBag:v15];

    [(AMSURLRequestEncoder *)v13 setDialogOptions:2];
    v31 = v5;
    [(AMSURLRequestEncoder *)v13 setLogUUID:v5];
    [(AMSURLRequestEncoder *)v13 setKeychainOptions:v12];
    [(AMSURLRequestEncoder *)v13 setUrlKnownToBeTrusted:1];
    v16 = [(AMSDelegateAuthenticateTask *)self formData];

    if (v16) {
      [(AMSURLRequestEncoder *)v13 setRequestEncoding:2];
    }
    v41 = @"X-Apple-TID-Action";
    v42[0] = 0x1EDCAC608;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    v18 = [(AMSDelegateAuthenticateTask *)self _urlRequestParameters];
    uint64_t v30 = v8;
    v19 = [(AMSURLRequestEncoder *)v13 requestWithMethod:4 URL:v8 headers:v17 parameters:v18];

    id v32 = 0;
    uint64_t v20 = [v19 resultWithError:&v32];
    id v21 = v32;
    if (v21)
    {
      v22 = +[AMSLogConfig sharedConfig];
      if (!v22)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      id v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = AMSHashIfNeeded(v30);
        *(_DWORD *)buf = 138544130;
        uint64_t v34 = v24;
        __int16 v35 = 2114;
        v36 = v31;
        __int16 v37 = 2112;
        v38 = v25;
        __int16 v39 = 2114;
        id v40 = v21;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode request for URL: %@, error: %{public}@", buf, 0x2Au);
      }
      id v26 = 0;
      if (v29) {
        *id v29 = v21;
      }
    }
    else
    {
      id v26 = v20;
    }

    id v8 = v30;
    id v5 = v31;
  }
  else
  {
    v27 = AMSError(100, @"Delegate Authentication Failed", @"Failed to create NSURL for delegate ", 0);
    id v21 = v27;
    if (a3)
    {
      id v21 = v27;
      id v26 = 0;
      *a3 = v21;
    }
    else
    {
      id v26 = 0;
    }
  }

  return v26;
}

- (id)_parseFormDataFromResult:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v26 = 138543618;
    uint64_t v27 = objc_opt_class();
    __int16 v28 = 2114;
    id v29 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Attempting to parse form-data from URL result.", (uint8_t *)&v26, 0x16u);
  }

  id v8 = [v4 object];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  id v9 = v8;

  if (!v9)
  {
LABEL_15:
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v11 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_opt_class();
      int v26 = 138543618;
      uint64_t v27 = v17;
      __int16 v28 = 2114;
      id v29 = v5;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find URL result object or it was not an NSDictionary.", (uint8_t *)&v26, 0x16u);
    }

    id v9 = 0;
    id v15 = 0;
    goto LABEL_34;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:@"dialog"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;

    if (v11)
    {
      objc_super v12 = [v11 objectForKeyedSubscript:@"okButtonAction"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;

        if (v13)
        {
          v14 = [v13 objectForKeyedSubscript:@"form-data"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;

            if (v15)
            {
LABEL_33:

              goto LABEL_34;
            }
          }
          else
          {
          }
          id v21 = +[AMSLogConfig sharedConfig];
          if (!v21)
          {
            id v21 = +[AMSLogConfig sharedConfig];
          }
          v22 = [v21 OSLogObject];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v25 = objc_opt_class();
            int v26 = 138543618;
            uint64_t v27 = v25;
            __int16 v28 = 2114;
            id v29 = v5;
            _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find formData or it was not an NSDictionary", (uint8_t *)&v26, 0x16u);
          }
LABEL_32:

          id v15 = 0;
          goto LABEL_33;
        }
      }
      else
      {
      }
      id v21 = +[AMSLogConfig sharedConfig];
      if (!v21)
      {
        id v21 = +[AMSLogConfig sharedConfig];
      }
      v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = objc_opt_class();
        int v26 = 138543618;
        uint64_t v27 = v23;
        __int16 v28 = 2114;
        id v29 = v5;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'okButtonAction' or it was not an NSDictionary.", (uint8_t *)&v26, 0x16u);
      }
      id v13 = 0;
      goto LABEL_32;
    }
  }
  else
  {
  }
  v18 = +[AMSLogConfig sharedConfig];
  if (!v18)
  {
    v18 = +[AMSLogConfig sharedConfig];
  }
  v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = objc_opt_class();
    int v26 = 138543618;
    uint64_t v27 = v20;
    __int16 v28 = 2114;
    id v29 = v5;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'dialog' or it was not an NSDictionary. Attempt to locate form data as string.", (uint8_t *)&v26, 0x16u);
  }

  id v15 = [(AMSDelegateAuthenticateTask *)self _parseFormDataAsStringFromResult:v9];
  id v11 = 0;
LABEL_34:

  return v15;
}

- (id)_parseFormDataAsStringFromResult:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = objc_opt_class();
    __int16 v34 = 2114;
    __int16 v35 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Attempting to parse form-data as string from URL result.", buf, 0x16u);
  }

  id v7 = [v3 objectForKeyedSubscript:@"okButtonAction"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;

    if (v8)
    {
      id v9 = [v8 objectForKeyedSubscript:@"form-data"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;

        if (v10)
        {
          id v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          objc_super v12 = [v10 stringByTrimmingCharactersInSet:v11];
          id v13 = [v12 mutableCopy];

          if (([v13 containsString:@"<dict>"] & 1) == 0) {
            [v13 insertString:@"<dict>" atIndex:0];
          }
          if (([v13 containsString:@"</dict>"] & 1) == 0) {
            [v13 appendString:@"</dict>"];
          }
          v14 = [v13 dataUsingEncoding:4];
          if (!v14)
          {
            id v21 = +[AMSLogConfig sharedConfig];
            if (!v21)
            {
              id v21 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v17 = [v21 OSLogObject];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              uint64_t v33 = v22;
              __int16 v34 = 2114;
              __int16 v35 = v4;
              _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not convert 'formData' from NSString to NSData.", buf, 0x16u);
            }
            v18 = 0;
            goto LABEL_47;
          }
          id v31 = 0;
          id v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:&v31];
          id v30 = v31;
          if (!v15)
          {
            v16 = +[AMSLogConfig sharedConfig];
            if (!v16)
            {
              v16 = +[AMSLogConfig sharedConfig];
            }
            log = [v16 OSLogObject];
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              uint64_t v27 = objc_opt_class();
              __int16 v28 = AMSLogableError(v30);
              *(_DWORD *)buf = 138543874;
              uint64_t v33 = v27;
              __int16 v34 = 2114;
              __int16 v35 = v4;
              __int16 v36 = 2114;
              __int16 v37 = v28;
              _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error parsing property list from data. error = %{public}@", buf, 0x20u);
            }
          }
          uint64_t v17 = v15;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = v17;

            if (v15)
            {
              uint64_t v17 = v18;
LABEL_46:
              id v21 = v30;
LABEL_47:

LABEL_48:
              goto LABEL_49;
            }
          }
          else
          {
          }
          uint64_t v23 = +[AMSLogConfig sharedConfig];
          if (!v23)
          {
            uint64_t v23 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v24 = [v23 OSLogObject];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            uint64_t v25 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            uint64_t v33 = v25;
            __int16 v34 = 2114;
            __int16 v35 = v4;
            _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Parsed formData was not an NSDictionary", buf, 0x16u);
          }

          v18 = 0;
          goto LABEL_46;
        }
      }
      else
      {
      }
      id v13 = +[AMSLogConfig sharedConfig];
      if (!v13)
      {
        id v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v20;
        __int16 v34 = 2114;
        __int16 v35 = v4;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'formData' or it was not an NSString.", buf, 0x16u);
      }
      id v10 = 0;
      v18 = 0;
      goto LABEL_48;
    }
  }
  else
  {
  }
  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v13 = [v10 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v19;
    __int16 v34 = 2114;
    __int16 v35 = v4;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did not find 'okButtonAction' or it was not an NSDictionary.", buf, 0x16u);
  }
  id v8 = 0;
  v18 = 0;
LABEL_49:

  return v18;
}

- (id)_performDelegateAuthenticationWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  id v5 = [(AMSDelegateAuthenticateTask *)self _encodedURLRequestWithError:&v24];
  id v6 = v24;
  if (v6)
  {
    id v7 = v6;
    if (a3)
    {
      id v7 = v6;
      id v8 = 0;
      *a3 = v7;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v9 = [(AMSDelegateAuthenticateTask *)self signatureResult];

    if (v9)
    {
      id v10 = [(AMSDelegateAuthenticateTask *)self account];
      id v11 = [v5 properties];
      objc_super v12 = [v11 keychainOptions];
      id v13 = [(AMSDelegateAuthenticateTask *)self signatureResult];
      v14 = +[AMSBiometrics headersWithAccount:v10 options:v12 signatureResult:v13];
      objc_msgSend(v5, "ams_addHeaders:", v14);
    }
    id v15 = [(AMSDelegateAuthenticateTask *)self session];
    v16 = [v15 dataTaskPromiseWithRequest:v5];
    id v23 = 0;
    uint64_t v17 = [v16 resultWithError:&v23];
    id v7 = v23;

    if (v7)
    {
      v18 = +[AMSLogConfig sharedConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = objc_opt_class();
        id v21 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = v20;
        __int16 v27 = 2114;
        __int16 v28 = v21;
        __int16 v29 = 2114;
        id v30 = v7;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", buf, 0x20u);
      }
      id v8 = 0;
      if (a3) {
        *a3 = v7;
      }
    }
    else
    {
      id v8 = v17;
    }
  }
  return v8;
}

- (id)_urlRequestParameters
{
  id v3 = [(AMSDelegateAuthenticateTask *)self formData];

  if (v3)
  {
    id v4 = [(AMSDelegateAuthenticateTask *)self formData];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = [(AMSDelegateAuthenticateTask *)self request];
    id v7 = [v6 challenge];
    objc_msgSend(v5, "ams_setNullableObject:forKey:", v7, @"challenge");

    id v8 = [(AMSDelegateAuthenticateTask *)self request];
    id v9 = [v8 userAgent];
    objc_msgSend(v5, "ams_setNullableObject:forKey:", v9, @"requesterUserAgent");

    id v4 = (void *)[v5 copy];
  }
  return v4;
}

- (id)_delegateAuthenticateResultFromUrlResult:(id)a3
{
  id v3 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = 0;
LABEL_6:

    goto LABEL_7;
  }
  id v4 = v3;

  if (v4)
  {
    id v3 = [[AMSDelegateAuthenticateResult alloc] initWithServerResponse:v4];
    id v5 = [(AMSDelegateAuthenticateResult *)v3 token];

    if (v5) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
LABEL_7:
  id v3 = 0;
LABEL_8:

  return v3;
}

- (id)delegateAuthenticateUrl
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = AMSSetLogKeyIfNeeded();
  id v4 = [(AMSDelegateAuthenticateTask *)self bag];
  id v5 = [v4 URLForKey:@"delegateAuthenticateAccount"];
  id v14 = 0;
  id v6 = [v5 valueWithError:&v14];
  id v7 = v14;

  if (v7)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSHashIfNeeded(@"delegateAuthenticateAccount");
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = v6;
  }

  return v12;
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

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDictionary)formData
{
  return self->_formData;
}

- (void)setFormData:(id)a3
{
}

- (AMSDelegateAuthenticateRequest)request
{
  return self->_request;
}

- (AMSBiometricsSignatureResult)signatureResult
{
  return self->_signatureResult;
}

- (void)setSignatureResult:(id)a3
{
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_signatureResult, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_formData, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end