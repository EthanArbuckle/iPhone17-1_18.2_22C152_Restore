@interface AMSAuthenticateTaskCoordinator
+ (id)internalQueue;
+ (id)promiseStore;
- (id)_authenticateTaskForItem:(id)a3;
- (id)_authenticateTaskForItem:(id)a3 authenticationResults:(id)a4;
- (id)_enqueueItem:(id)a3 handleAuthenticationWithBlock:(id)a4;
- (id)_handleAuthenticateRequestWithItem:(id)a3 authenticationResults:(id)a4;
- (id)_promiseStorePairForRequest:(id)a3;
- (id)_promiseWithResultsForRequest:(id)a3;
- (id)enqueueAuthenticationRequest:(id)a3 handleAuthenticationWithBlock:(id)a4;
- (id)handleRequest:(id)a3;
- (id)handleRequestDictionary:(id)a3;
- (void)_addToStoreRequest:(id)a3 promise:(id)a4;
- (void)_removeFromPromiseStore:(id)a3;
@end

@implementation AMSAuthenticateTaskCoordinator

+ (id)promiseStore
{
  if (_MergedGlobals_83 != -1) {
    dispatch_once(&_MergedGlobals_83, &__block_literal_global_10);
  }
  v2 = (void *)qword_1EB38D668;
  return v2;
}

uint64_t __46__AMSAuthenticateTaskCoordinator_promiseStore__block_invoke()
{
  qword_1EB38D668 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

+ (id)internalQueue
{
  if (qword_1EB38D670 != -1) {
    dispatch_once(&qword_1EB38D670, &__block_literal_global_21_0);
  }
  v2 = (void *)qword_1EB38D678;
  return v2;
}

void __47__AMSAuthenticateTaskCoordinator_internalQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSAuthenticateTaskCoordinator", v2);
  v1 = (void *)qword_1EB38D678;
  qword_1EB38D678 = (uint64_t)v0;
}

- (id)handleRequest:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"AMSAuthenticateTaskCoordinatorItemKeyRequest";
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [(AMSAuthenticateTaskCoordinator *)self handleRequestDictionary:v6];

  return v7;
}

- (id)handleRequestDictionary:(id)a3
{
  return [(AMSAuthenticateTaskCoordinator *)self _enqueueItem:a3 handleAuthenticationWithBlock:0];
}

- (id)enqueueAuthenticationRequest:(id)a3 handleAuthenticationWithBlock:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      v10 = +[AMSLogConfig sharedAccountsConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = AMSLogKey();
        v13 = NSString;
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = v14;
        if (v12)
        {
          uint64_t v4 = AMSLogKey();
          [v13 stringWithFormat:@"%@: [%@] ", v15, v4];
        }
        else
        {
          [v13 stringWithFormat:@"%@: ", v14];
        v16 = };
        *(_DWORD *)buf = 138543362;
        v42 = v16;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Missing authentication handler block. Authentication will be processed by AMSAuthenticateTaskCoordinator.", buf, 0xCu);
        if (v12)
        {

          v16 = (void *)v4;
        }
      }
    }
    v32 = objc_alloc_init(AMSMutablePromise);
    v39 = @"AMSAuthenticateTaskCoordinatorItemKeyRequest";
    id v40 = v7;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v34 = [(AMSAuthenticateTaskCoordinator *)self _enqueueItem:v33 handleAuthenticationWithBlock:v9];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __93__AMSAuthenticateTaskCoordinator_enqueueAuthenticationRequest_handleAuthenticationWithBlock___block_invoke;
    v37[3] = &unk_1E559F168;
    v35 = v32;
    v38 = v35;
    [v34 addFinishBlock:v37];
  }
  else
  {
    BOOL v17 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v18 = +[AMSLogConfig sharedAccountsConfig];
    v19 = (void *)v18;
    if (v17)
    {
      if (!v18)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = AMSLogKey();
        v22 = NSString;
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = v23;
        if (v21)
        {
          AMSLogKey();
          self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
          [v22 stringWithFormat:@"%@: [%@] ", v24, self];
        }
        else
        {
          [v22 stringWithFormat:@"%@: ", v23];
        v25 = };
        *(_DWORD *)buf = 138543362;
        v42 = v25;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@ The provided AMSAuthenticateRequest is nil. Unable to continue.", buf, 0xCu);
        if (v21)
        {

          v25 = self;
        }
      }
      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v26 = +[AMSLogConfig sharedAccountsConfig];
      [v19 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v26 userInfo:0];
    }
    else
    {
      if (!v18)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v19 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        v27 = AMSLogKey();
        v28 = NSString;
        uint64_t v29 = objc_opt_class();
        uint64_t v30 = v29;
        if (v27)
        {
          AMSLogKey();
          self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
          [v28 stringWithFormat:@"%@: [%@] ", v30, self];
        }
        else
        {
          [v28 stringWithFormat:@"%@: ", v29];
        v31 = };
        *(_DWORD *)buf = 138543362;
        v42 = v31;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_FAULT, "%{public}@ The provided AMSAuthenticateRequest is nil. Unable to continue.", buf, 0xCu);
        if (v27)
        {

          v31 = self;
        }
      }
    }

    v33 = AMSError(2, @"Missing Request Parameter", @"There was no AMSAuthenticateRequest provided. Unable to continue.", 0);
    v35 = +[AMSPromise promiseWithError:v33];
  }

  return v35;
}

uint64_t __93__AMSAuthenticateTaskCoordinator_enqueueAuthenticationRequest_handleAuthenticationWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (id)_authenticateTaskForItem:(id)a3 authenticationResults:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKeyedSubscript:@"AMSAuthenticateTaskCoordinatorItemKeyRequest"];
  id v7 = [v6 options];
  id v8 = [[AMSAuthenticateTask alloc] initWithAuthenticationResults:v5 options:v7];

  return v8;
}

- (id)_authenticateTaskForItem:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"AMSAuthenticateTaskCoordinatorItemKeyRequest"];
  uint64_t v4 = [[AMSAuthenticateTask alloc] initWithRequest:v3];

  return v4;
}

- (id)_enqueueItem:(id)a3 handleAuthenticationWithBlock:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = off_1E559C000;
  v10 = +[AMSLogConfig sharedAccountsConfig];
  if (!v10)
  {
    v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  unint64_t v12 = 0x1E559B000;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v39 = v8;
    v13 = AMSLogKey();
    uint64_t v14 = NSString;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = v15;
    v38 = self;
    if (v13)
    {
      uint64_t v4 = AMSLogKey();
      [v14 stringWithFormat:@"%@: [%@] ", v16, v4];
    }
    else
    {
      [v14 stringWithFormat:@"%@: ", v15];
    BOOL v17 = };
    uint64_t v18 = +[AMSAuthenticateTaskCoordinator promiseStore];
    uint64_t v19 = [v18 count];
    v20 = AMSHashIfNeeded(v7);
    *(_DWORD *)buf = 138543874;
    v46 = v17;
    __int16 v47 = 2048;
    uint64_t v48 = v19;
    __int16 v49 = 2114;
    v50 = v20;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ Primary Request count in store: %lu. Adding Authenticate Request to coordinator: %{public}@", buf, 0x20u);

    if (v13)
    {

      BOOL v17 = (void *)v4;
    }

    self = v38;
    id v8 = v39;
    unint64_t v12 = 0x1E559B000uLL;
  }

  v21 = [v7 objectForKeyedSubscript:@"AMSAuthenticateTaskCoordinatorItemKeyRequest"];
  if (v21)
  {
    v22 = objc_alloc_init(AMSMutablePromise);
    uint64_t v23 = [*(id *)(v12 + 3312) internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke;
    block[3] = &unk_1E559F258;
    block[4] = self;
    id v41 = v21;
    id v44 = v8;
    uint64_t v24 = v22;
    v42 = v24;
    id v43 = v7;
    dispatch_async(v23, block);

    v25 = v43;
    v26 = v24;

    v27 = v26;
  }
  else
  {
    AMSError(2, @"Enqueue item missing AMSAuthenticateRequest", @"Unable to complete authenticate for request, enqueue item was passed a context that does not contain an AMSAuthenticateRequest", 0);
    v26 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    v28 = +[AMSLogConfig sharedAccountsConfig];
    if (!v28)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = v8;
      v31 = AMSLogKey();
      v32 = NSString;
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = v33;
      if (v31)
      {
        AMSLogKey();
        v9 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
        [v32 stringWithFormat:@"%@: [%@] ", v34, v9];
      }
      else
      {
        [v32 stringWithFormat:@"%@: ", v33];
      v35 = };
      v36 = AMSLogableError(v26);
      *(_DWORD *)buf = 138543618;
      v46 = v35;
      __int16 v47 = 2114;
      uint64_t v48 = (uint64_t)v36;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Error processing authenticate request: %{public}@", buf, 0x16u);
      if (v31)
      {

        v35 = v9;
      }

      id v8 = v30;
    }

    v27 = +[AMSPromise promiseWithError:v26];
  }

  return v27;
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _promiseWithResultsForRequest:*(void *)(a1 + 40)];
  uint64_t v3 = v2 == 0;
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = +[AMSLogConfig sharedAccountsOversizeConfig];
  v6 = (void *)v5;
  if (v2)
  {
    if (v4)
    {
      if (!v5)
      {
        v6 = +[AMSLogConfig sharedConfig];
      }
      id v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = AMSLogKey();
        v9 = NSString;
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
        unint64_t v12 = };
        uint64_t v31 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v53 = v12;
        __int16 v54 = 2114;
        uint64_t v55 = v31;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Will wait for another request to complete before running authHandler: %{public}@", buf, 0x16u);
        if (v8)
        {

          unint64_t v12 = (void *)v3;
        }
      }
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_54;
      v48[3] = &unk_1E559F190;
      v32 = *(void **)(a1 + 40);
      v48[4] = *(void *)(a1 + 32);
      id v49 = v32;
      id v51 = *(id *)(a1 + 64);
      id v50 = *(id *)(a1 + 48);
      [v2 addFinishBlock:v48];
    }
    else
    {
      if (!v5)
      {
        v6 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v19 = [v6 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = AMSLogKey();
        v21 = NSString;
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = v22;
        if (v20)
        {
          uint64_t v3 = AMSLogKey();
          [v21 stringWithFormat:@"%@: [%@] ", v23, v3];
        }
        else
        {
          [v21 stringWithFormat:@"%@: ", v22];
        uint64_t v24 = };
        uint64_t v35 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v53 = v24;
        __int16 v54 = 2114;
        uint64_t v55 = v35;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ The authenticate request will wait for another request to complete: %{public}@", buf, 0x16u);
        if (v20)
        {

          uint64_t v24 = (void *)v3;
        }
      }
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_55;
      v44[3] = &unk_1E559F1B8;
      v36 = *(void **)(a1 + 40);
      v44[4] = *(void *)(a1 + 32);
      id v45 = v36;
      id v46 = *(id *)(a1 + 56);
      id v47 = *(id *)(a1 + 48);
      [v2 addFinishBlock:v44];
    }
  }
  else if (v4)
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v6 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = AMSLogKey();
      uint64_t v15 = NSString;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = v16;
      if (v14)
      {
        uint64_t v3 = AMSLogKey();
        [v15 stringWithFormat:@"%@: [%@] ", v17, v3];
      }
      else
      {
        [v15 stringWithFormat:@"%@: ", v16];
      uint64_t v18 = };
      uint64_t v33 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v53 = v18;
      __int16 v54 = 2114;
      uint64_t v55 = v33;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ There are no matching authentication requests calling authHandler immediately for request = %{public}@", buf, 0x16u);
      if (v14)
      {

        uint64_t v18 = (void *)v3;
      }
    }
    uint64_t v34 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    objc_initWeak((id *)buf, v34);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_57;
    v42[3] = &unk_1E559F208;
    objc_copyWeak(&v43, (id *)buf);
    v42[4] = *(void *)(a1 + 32);
    [v34 addFinishBlock:v42];
    [*(id *)(a1 + 48) finishWithPromise:v34];
    [*(id *)(a1 + 32) _addToStoreRequest:*(void *)(a1 + 40) promise:v34];
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v25 = [v6 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = AMSLogKey();
      v27 = NSString;
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = v28;
      if (v26)
      {
        uint64_t v3 = AMSLogKey();
        [v27 stringWithFormat:@"%@: [%@] ", v29, v3];
      }
      else
      {
        [v27 stringWithFormat:@"%@: ", v28];
      id v30 = };
      uint64_t v37 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v53 = v30;
      __int16 v54 = 2114;
      uint64_t v55 = v37;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Using authenticate request to begin a new authentication: %{public}@", buf, 0x16u);
      if (v26)
      {

        id v30 = (void *)v3;
      }
    }
    v38 = [*(id *)(a1 + 32) _handleAuthenticateRequestWithItem:*(void *)(a1 + 56) authenticationResults:0];
    objc_initWeak((id *)buf, v38);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_58;
    v39[3] = &unk_1E559F230;
    objc_copyWeak(&v41, (id *)buf);
    v39[4] = *(void *)(a1 + 32);
    id v40 = *(id *)(a1 + 48);
    [v38 addFinishBlock:v39];
    [*(id *)(a1 + 32) _addToStoreRequest:*(void *)(a1 + 40) promise:v38];

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedAccountsOversizeConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = AMSLogKey();
    uint64_t v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = v11;
    v20 = (void *)v9;
    if (v9)
    {
      uint64_t v19 = AMSLogKey();
      [v10 stringWithFormat:@"%@: [%@] ", v12, v19];
    }
    else
    {
      [v10 stringWithFormat:@"%@: ", v11];
    v13 = };
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [v5 authenticationResults];
    uint64_t v16 = objc_msgSend(v15, "ak_redactedCopy");
    uint64_t v17 = AMSHashIfNeeded(v16);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Running authHandler for request. request = %{public}@ results = %{public}@", buf, 0x20u);

    if (v20)
    {

      v13 = (void *)v19;
    }
  }
  uint64_t v18 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  [*(id *)(a1 + 48) finishWithPromise:v18];
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedAccountsOversizeConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      uint64_t v19 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, v19];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [v3 authenticationResults];
    v13 = objc_msgSend(v12, "ak_redactedCopy");
    uint64_t v14 = AMSHashIfNeeded(v13);
    *(_DWORD *)buf = 138543874;
    __int16 v23 = v10;
    __int16 v24 = 2114;
    uint64_t v25 = v11;
    __int16 v26 = 2114;
    uint64_t v27 = v14;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Using Authenticate result to complete request. request = %{public}@ results = %{public}@", buf, 0x20u);

    if (v6)
    {

      uint64_t v10 = (void *)v19;
    }
  }
  uint64_t v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = [v3 authenticationResults];
  uint64_t v18 = [v15 _handleAuthenticateRequestWithItem:v16 authenticationResults:v17];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_56;
  v20[3] = &unk_1E559F168;
  id v21 = *(id *)(a1 + 56);
  [v18 addFinishBlock:v20];
}

uint64_t __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_56(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_57(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[AMSAuthenticateTaskCoordinator internalQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2;
  v5[3] = &unk_1E559F1E0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_async(v3, v5);
}

uint64_t __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeFromPromiseStore:*(void *)(a1 + 40)];
}

void __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = +[AMSAuthenticateTaskCoordinator internalQueue];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2_59;
  uint64_t v22 = &unk_1E559F1E0;
  uint64_t v23 = *(void *)(a1 + 32);
  id v10 = WeakRetained;
  id v24 = v10;
  dispatch_async(v9, &block);

  if (v7)
  {
    uint64_t v11 = +[AMSLogConfig sharedAccountsOversizeConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = AMSLogKey();
      uint64_t v14 = NSString;
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = v15;
      if (v13)
      {
        uint64_t v3 = AMSLogKey();
        [v14 stringWithFormat:@"%@: [%@] ", v16, v3, block, v20, v21, v22, v23];
      }
      else
      {
        [v14 stringWithFormat:@"%@: ", v15];
      uint64_t v17 = };
      uint64_t v18 = AMSLogableError(v7);
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v17;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Authentication returned an error: %{public}@", buf, 0x16u);
      if (v13)
      {

        uint64_t v17 = (void *)v3;
      }
    }
    [*(id *)(a1 + 40) finishWithError:v7];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithResult:v6 error:0];
  }
}

uint64_t __77__AMSAuthenticateTaskCoordinator__enqueueItem_handleAuthenticationWithBlock___block_invoke_2_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeFromPromiseStore:*(void *)(a1 + 40)];
}

- (id)_handleAuthenticateRequestWithItem:(id)a3 authenticationResults:(id)a4
{
  if (a4) {
    -[AMSAuthenticateTaskCoordinator _authenticateTaskForItem:authenticationResults:](self, "_authenticateTaskForItem:authenticationResults:", a3);
  }
  else {
  id v4 = [(AMSAuthenticateTaskCoordinator *)self _authenticateTaskForItem:a3];
  }
  id v5 = [v4 performAuthentication];

  return v5;
}

- (void)_addToStoreRequest:(id)a3 promise:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = AMSLogKey();
    uint64_t v11 = NSString;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = v12;
    if (v10)
    {
      AMSLogKey();
      self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@: [%@] ", v13, self];
    }
    else
    {
      [v11 stringWithFormat:@"%@: ", v12];
    uint64_t v14 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v14;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ Adding Request to store", buf, 0xCu);
    if (v10)
    {

      uint64_t v14 = self;
    }
  }
  uint64_t v15 = +[AMSAuthenticateTaskCoordinator promiseStore];
  uint64_t v16 = [[AMSPair alloc] initWithFirst:v7 second:v6];

  [v15 addObject:v16];
}

- (id)_promiseStorePairForRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[AMSAuthenticateTaskCoordinator promiseStore];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__AMSAuthenticateTaskCoordinator__promiseStorePairForRequest___block_invoke;
  v8[3] = &unk_1E559F280;
  id v9 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "ams_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __62__AMSAuthenticateTaskCoordinator__promiseStorePairForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 first];
  id v5 = [v3 second];

  if ([v5 isCancelled] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4))
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [v4 account];
    uint64_t v8 = [v7 identifier];
    id v9 = [*(id *)(a1 + 32) account];
    id v10 = [v9 identifier];
    uint64_t v6 = [v8 isEqual:v10];
  }
  return v6;
}

- (id)_promiseWithResultsForRequest:(id)a3
{
  id v3 = [(AMSAuthenticateTaskCoordinator *)self _promiseStorePairForRequest:a3];
  id v4 = [v3 second];

  return v4;
}

- (void)_removeFromPromiseStore:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AMSAuthenticateTaskCoordinator promiseStore];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__AMSAuthenticateTaskCoordinator__removeFromPromiseStore___block_invoke;
    v15[3] = &unk_1E559F280;
    id v16 = v4;
    uint64_t v6 = objc_msgSend(v5, "ams_firstObjectPassingTest:", v15);

    id v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = AMSLogKey();
      id v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        AMSLogKey();
        self = (AMSAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
        [v10 stringWithFormat:@"%@: [%@] ", v12, self];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      uint64_t v13 = };
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ Removing request from store. pair = %{public}@", buf, 0x16u);
      if (v9)
      {

        uint64_t v13 = self;
      }
    }
    uint64_t v14 = +[AMSAuthenticateTaskCoordinator promiseStore];
    [v14 removeObject:v6];
  }
}

uint64_t __58__AMSAuthenticateTaskCoordinator__removeFromPromiseStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 first];
  id v5 = [v3 second];

  uint64_t v6 = [*(id *)(a1 + 32) isEqual:v5];
  return v6;
}

@end