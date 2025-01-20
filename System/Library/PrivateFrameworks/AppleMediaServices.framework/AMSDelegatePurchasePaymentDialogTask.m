@interface AMSDelegatePurchasePaymentDialogTask
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSDelegatePurchasePaymentDialogTask)initWithDelegatePurchaseRequest:(id)a3 bag:(id)a4 andDesignVersion:(id)a5;
- (AMSDelegatePurchaseRequest)currentRequest;
- (NSNumber)designVersion;
- (NSString)requestingPlatform;
- (NSString)targetPlatformVersion;
- (id)_encodedURLRequest;
- (id)_legacyUserAgentString;
- (id)_purchaseResultFromPurchaseResult:(id)a3 andPaymentSheetInfo:(id)a4;
- (id)performTask;
- (void)setCurrentRequest:(id)a3;
@end

@implementation AMSDelegatePurchasePaymentDialogTask

- (AMSDelegatePurchasePaymentDialogTask)initWithDelegatePurchaseRequest:(id)a3 bag:(id)a4 andDesignVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AMSDelegatePurchasePaymentDialogTask;
  v12 = [(AMSTask *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_currentRequest, a3);
    v14 = [v9 purchaseResult];
    v15 = [v14 purchase];
    uint64_t v16 = [v15 account];
    account = v13->_account;
    v13->_account = (ACAccount *)v16;

    objc_storeStrong((id *)&v13->_bag, a4);
    objc_storeStrong((id *)&v13->_designVersion, a5);
    if ([v11 isEqualToNumber:0x1EDD01648])
    {
      requestingPlatform = v13->_requestingPlatform;
      v13->_requestingPlatform = (NSString *)@"AppleTV";

      targetPlatformVersion = v13->_targetPlatformVersion;
      v13->_targetPlatformVersion = (NSString *)@"16.0";
    }
  }

  return v13;
}

- (id)performTask
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke;
  v5[3] = &unk_1E55A1AD8;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSTask *)self performTaskWithPromiseBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = AMSSetLogKeyIfNeeded();
  v3 = [WeakRetained designVersion];
  uint64_t v4 = [v3 integerValue];
  uint64_t v5 = [&unk_1EDD01648 integerValue];

  uint64_t v6 = +[AMSLogConfig sharedConfig];
  v7 = (void *)v6;
  if (v4 <= v5)
  {
    if (!v6)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v7 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2114;
      v24 = v2;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin requesting payment sheet for legacy device", buf, 0x16u);
    }

    v12 = objc_alloc_init(AMSMutablePromise);
    v13 = [WeakRetained _encodedURLRequest];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_12;
    v18[3] = &unk_1E55A1AB0;
    v18[4] = WeakRetained;
    id v14 = v2;
    id v19 = v14;
    v20 = v12;
    id v9 = v12;
    [v13 resultWithCompletion:v18];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_15;
    v16[3] = &unk_1E55A1248;
    v16[4] = WeakRetained;
    id v17 = v14;
    id v10 = [(AMSMutablePromise *)v9 continueWithBlock:v16];
  }
  else
  {
    if (!v6)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2114;
      v24 = v2;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Design version 1.0 is the only supported dialog style", buf, 0x16u);
    }

    AMSError(2, @"Unsupported Design Version", @"Design version 1.0 is the only supported dialog style", 0);
    id v9 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    id v10 = +[AMSPromise promiseWithError:v9];
  }

  return v10;
}

void __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
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
      int v14 = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy payment sheet URL failed with error: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithError:v6];
  }
  else
  {
    id v11 = +[AMSURLSession defaultSession];
    v12 = [*(id *)(a1 + 48) completionHandlerAdapter];
    v13 = [v11 dataTaskWithRequest:v5 completionHandler:v12];

    [v13 resume];
  }
}

id __51__AMSDelegatePurchasePaymentDialogTask_performTask__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      int v27 = 138543874;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      uint64_t v30 = v9;
      __int16 v31 = 2114;
      id v32 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy payment sheet URL failed with error: %{public}@", (uint8_t *)&v27, 0x20u);
    }

    uint64_t v10 = +[AMSPromise promiseWithError:v5];
  }
  else
  {
    id v11 = [a2 object];
    v12 = [v11 objectForKey:@"paymentSheetInfo"];

    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      int v14 = [v13 currentRequest];
      uint64_t v15 = [v14 purchaseResult];
      __int16 v16 = [v13 _purchaseResultFromPurchaseResult:v15 andPaymentSheetInfo:v11];

      uint64_t v17 = [AMSDelegatePurchaseRequest alloc];
      __int16 v18 = [*(id *)(a1 + 32) currentRequest];
      id v19 = [v18 challenge];
      uint64_t v20 = [*(id *)(a1 + 32) _legacyUserAgentString];
      objc_super v21 = [(AMSDelegatePurchaseRequest *)v17 initWithPurchaseResult:v16 challenge:v19 userAgent:v20];

      uint64_t v10 = +[AMSPromise promiseWithResult:v21];
    }
    else
    {
      uint64_t v22 = +[AMSLogConfig sharedConfig];
      if (!v22)
      {
        uint64_t v22 = +[AMSLogConfig sharedConfig];
      }
      __int16 v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = *(void *)(a1 + 40);
        int v27 = 138543618;
        uint64_t v28 = v24;
        __int16 v29 = 2114;
        uint64_t v30 = v25;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy payment sheet response missing payment sheet info", (uint8_t *)&v27, 0x16u);
      }

      __int16 v16 = AMSError(7, @"Missing payment sheet info", @"The legacy payment sheet response is missing payment sheet info", 0);
      uint64_t v10 = +[AMSPromise promiseWithError:v16];
    }
  }
  return v10;
}

- (id)_legacyUserAgentString
{
  v2 = [(AMSDelegatePurchasePaymentDialogTask *)self currentRequest];
  v3 = [v2 userAgent];

  return v3;
}

- (id)_purchaseResultFromPurchaseResult:(id)a3 andPaymentSheetInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[v6 copy];
  uint64_t v8 = [v6 responseDictionary];

  uint64_t v9 = objc_msgSend(v8, "ams_dictionaryByAddingEntriesFromDictionary:", v5);

  [v7 setResponseDictionary:v9];
  return v7;
}

- (id)_encodedURLRequest
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = AMSSetLogKeyIfNeeded();
  uint64_t v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = objc_opt_class();
    __int16 v46 = 2114;
    v47 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Begin extracting URL endpoint from bag", buf, 0x16u);
  }

  id v6 = [(AMSDelegatePurchasePaymentDialogTask *)self bag];
  v7 = [v6 URLForKey:@"generatePaymentSheetUrl"];
  id v43 = 0;
  uint64_t v8 = [v7 valueWithError:&v43];
  id v9 = v43;

  uint64_t v10 = +[AMSLogConfig sharedConfig];
  id v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = AMSHashIfNeeded(@"generatePaymentSheetUrl");
      *(_DWORD *)buf = 138544130;
      uint64_t v45 = v13;
      __int16 v46 = 2114;
      v47 = v3;
      __int16 v48 = 2112;
      v49 = v14;
      __int16 v50 = 2114;
      id v51 = v9;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find key: %@, error: %{public}@", buf, 0x2Au);
    }
    uint64_t v15 = +[AMSPromise promiseWithError:v9];
  }
  else
  {
    if (!v10)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    __int16 v16 = [v11 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v17;
      __int16 v46 = 2114;
      v47 = v3;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Completed extracting URL endpoint from bag", buf, 0x16u);
    }

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v19 = [(AMSDelegatePurchasePaymentDialogTask *)self currentRequest];
    uint64_t v20 = [v19 userAgent];
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v20, @"requesterUserAgent");

    objc_super v21 = [(AMSDelegatePurchasePaymentDialogTask *)self targetPlatformVersion];
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v21, @"targetPlatformVersion");

    uint64_t v22 = [(AMSDelegatePurchasePaymentDialogTask *)self requestingPlatform];
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v22, @"requesterPlatform");

    __int16 v23 = [(AMSDelegatePurchasePaymentDialogTask *)self designVersion];
    uint64_t v24 = [v23 stringValue];
    objc_msgSend(v18, "ams_setNullableObject:forKey:", v24, @"designVersion");

    uint64_t v25 = [(AMSDelegatePurchasePaymentDialogTask *)self currentRequest];
    v26 = [v25 purchaseResult];
    int v27 = [v26 purchase];
    uint64_t v28 = [v27 buyParams];
    __int16 v29 = [v28 dictionary];
    [v18 addEntriesFromDictionary:v29];

    uint64_t v30 = (void *)[v18 copy];
    __int16 v31 = objc_alloc_init(AMSURLRequestEncoder);
    id v32 = [(AMSDelegatePurchasePaymentDialogTask *)self account];
    [(AMSURLRequestEncoder *)v31 setAccount:v32];

    uint64_t v33 = [(AMSDelegatePurchasePaymentDialogTask *)self bag];
    [(AMSURLRequestEncoder *)v31 setBag:v33];

    [(AMSURLRequestEncoder *)v31 setLogUUID:v3];
    [(AMSURLRequestEncoder *)v31 setUrlKnownToBeTrusted:1];
    v34 = [(AMSURLRequestEncoder *)v31 requestWithMethod:4 URL:v8 headers:0 parameters:v30];
    v35 = objc_alloc_init(AMSMutablePromise);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58__AMSDelegatePurchasePaymentDialogTask__encodedURLRequest__block_invoke;
    v39[3] = &unk_1E55A1A38;
    v39[4] = self;
    id v40 = v3;
    id v41 = v8;
    v36 = v35;
    v42 = v36;
    [v34 resultWithCompletion:v39];
    v37 = v42;
    uint64_t v15 = v36;
  }
  return v15;
}

void __58__AMSDelegatePurchasePaymentDialogTask__encodedURLRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = AMSHashIfNeeded(*(void **)(a1 + 48));
      int v11 = 138544130;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode request for URL: %@, error: %{public}@", (uint8_t *)&v11, 0x2Au);
    }
    [*(id *)(a1 + 56) finishWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithResult:a2];
  }
}

- (AMSDelegatePurchaseRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSNumber)designVersion
{
  return self->_designVersion;
}

- (NSString)requestingPlatform
{
  return self->_requestingPlatform;
}

- (NSString)targetPlatformVersion
{
  return self->_targetPlatformVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPlatformVersion, 0);
  objc_storeStrong((id *)&self->_requestingPlatform, 0);
  objc_storeStrong((id *)&self->_designVersion, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end