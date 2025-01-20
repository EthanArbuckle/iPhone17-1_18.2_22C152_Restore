@interface AMSDelegateAuthenticateRequestTask
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBag)bag;
- (AMSDelegateAuthenticateRequestTask)initWithAccount:(id)a3;
- (AMSDelegateAuthenticateRequestTask)initWithAccount:(id)a3 bag:(id)a4;
- (id)_encodedURLRequest;
- (id)perform;
@end

@implementation AMSDelegateAuthenticateRequestTask

- (AMSDelegateAuthenticateRequestTask)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = +[AMSDelegateAuthenticateRequestTask createBagForSubProfile];
  v6 = [(AMSDelegateAuthenticateRequestTask *)self initWithAccount:v4 bag:v5];

  return v6;
}

- (AMSDelegateAuthenticateRequestTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDelegateAuthenticateRequestTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

AMSMutablePromise *__45__AMSDelegateAuthenticateRequestTask_perform__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = AMSSetLogKeyIfNeeded();
  v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = objc_opt_class();
    __int16 v25 = 2114;
    v26 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin requesting delegate auth endpoint", buf, 0x16u);
  }

  v5 = objc_alloc_init(AMSPromise);
  v6 = objc_alloc_init(AMSMutablePromise);
  id v7 = [*(id *)(a1 + 32) _encodedURLRequest];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_4;
  v19[3] = &unk_1E55A1A38;
  v19[4] = *(void *)(a1 + 32);
  id v8 = v2;
  id v20 = v8;
  v9 = v6;
  v21 = v9;
  v22 = v5;
  v10 = v5;
  [v7 resultWithCompletion:v19];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_8;
  v16[3] = &unk_1E55A1018;
  v16[4] = *(void *)(a1 + 32);
  id v17 = v8;
  v11 = v9;
  v18 = v11;
  id v12 = v8;
  [(AMSPromise *)v10 addFinishBlock:v16];
  v13 = v18;
  v14 = v11;

  return v14;
}

void __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Encoding URL request failed with error: %{public}@", (uint8_t *)&v15, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithError:v6];
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F18DD0], "ams_configurationWithProcessInfo:bag:", 0, 0);
    id v12 = [[AMSURLSession alloc] initWithConfiguration:v11 delegate:*(void *)(a1 + 32) delegateQueue:0];
    v13 = [*(id *)(a1 + 56) completionHandlerAdapter];
    v14 = [(AMSURLSession *)v12 dataTaskWithRequest:v5 completionHandler:v13];

    [v14 resume];
  }
}

void __45__AMSDelegateAuthenticateRequestTask_perform__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL request failed with error: %{public}@", buf, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithError:v6];
  }
  else
  {
    v11 = [v5 object];
    id v12 = [v11 valueForKey:@"challenge"];

    v13 = +[AMSProcessInfo currentProcess];
    v14 = +[AMSUserAgent userAgentForProcessInfo:v13];

    if (v12)
    {
      int v15 = [[AMSDelegateAuthenticateRequest alloc] initWithChallenge:v12 userAgent:v14];
      [*(id *)(a1 + 48) finishWithResult:v15];
    }
    else
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
      if (!v16)
      {
        uint64_t v16 = +[AMSLogConfig sharedConfig];
      }
      __int16 v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        uint64_t v22 = *(void *)(a1 + 40);
        __int16 v19 = [v5 object];
        id v20 = AMSHashIfNeeded(v19);
        *(_DWORD *)buf = 138543874;
        uint64_t v24 = v18;
        __int16 v25 = 2114;
        uint64_t v26 = v22;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] challenge response did not contain a challenge. response = %{public}@", buf, 0x20u);
      }
      uint64_t v21 = *(void **)(a1 + 48);
      AMSError(116, @"Request for challenge failed", @"The request for a delegate challenge completed successfully but didn't contain a challenge", 0);
      int v15 = (AMSDelegateAuthenticateRequest *)objc_claimAutoreleasedReturnValue();
      [v21 finishWithError:v15];
    }
  }
}

- (id)_encodedURLRequest
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = AMSSetLogKeyIfNeeded();
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = objc_opt_class();
    __int16 v29 = 2114;
    v30 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  id v6 = [(AMSDelegateAuthenticateRequestTask *)self bag];
  id v7 = [v6 URLForKey:@"delegateChallengeTokenUrl"];
  id v26 = 0;
  id v8 = [v7 valueWithError:&v26];
  id v9 = v26;

  if (v9)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSHashIfNeeded(@"delegateAuthenticateAccount");
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = v12;
      __int16 v29 = 2114;
      v30 = v3;
      __int16 v31 = 2112;
      v32 = v13;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);
    }
    uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://auth.itunes.apple.com/auth/v1/companion/challenge"];

    id v8 = (void *)v14;
  }
  int v15 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v15 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
  [(AMSKeychainOptions *)v15 setPurpose:0];
  uint64_t v16 = objc_alloc_init(AMSURLRequestEncoder);
  __int16 v17 = [(AMSDelegateAuthenticateRequestTask *)self account];
  [(AMSURLRequestEncoder *)v16 setAccount:v17];

  uint64_t v18 = [(AMSDelegateAuthenticateRequestTask *)self bag];
  [(AMSURLRequestEncoder *)v16 setBag:v18];

  [(AMSURLRequestEncoder *)v16 setDialogOptions:2];
  [(AMSURLRequestEncoder *)v16 setLogUUID:v3];
  [(AMSURLRequestEncoder *)v16 setKeychainOptions:v15];
  [(AMSURLRequestEncoder *)v16 setUrlKnownToBeTrusted:1];
  __int16 v19 = [(AMSURLRequestEncoder *)v16 requestWithMethod:2 URL:v8 headers:0 parameters:0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__AMSDelegateAuthenticateRequestTask__encodedURLRequest__block_invoke;
  v23[3] = &unk_1E55A1A60;
  v23[4] = self;
  id v24 = v3;
  id v25 = v8;
  id v20 = v8;
  id v21 = v3;
  [v19 addErrorBlock:v23];

  return v19;
}

void __56__AMSDelegateAuthenticateRequestTask__encodedURLRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = AMSHashIfNeeded(*(void **)(a1 + 48));
    int v9 = 138544130;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode request for URL: %@, error: %{public}@", (uint8_t *)&v9, 0x2Au);
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
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end