@interface AMSPurchaseQueue
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSPurchaseQueue)initWithConfiguration:(id)a3;
- (AMSPurchaseQueueBatchList)batches;
- (AMSPurchaseQueueConfiguration)config;
- (AMSThreadSafeSet)preAuthenticatedDSIDs;
- (BOOL)isSuspended;
- (OS_dispatch_queue)dispatchQueue;
- (id)_createPurchasePromiseForTask:(id)a3 purchase:(id)a4;
- (id)_performPreauthenticateForPurchaseTask:(id)a3;
- (id)_processPurchase:(id)a3;
- (id)enquePurchases:(id)a3;
- (void)_handleNextPurchase;
- (void)_handleResult:(id)a3 error:(id)a4 forPurchase:(id)a5;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)setBatches:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreAuthenticatedDSIDs:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setSuspended:(BOOL)a3 logUUID:(id)a4;
@end

@implementation AMSPurchaseQueue

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (AMSPurchaseQueue)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSPurchaseQueue;
  v6 = [(AMSPurchaseQueue *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = objc_alloc_init(AMSPurchaseQueueBatchList);
    batches = v7->_batches;
    v7->_batches = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.ams.purchasequeue.dispatch", v10);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(AMSThreadSafeSet);
    preAuthenticatedDSIDs = v7->_preAuthenticatedDSIDs;
    v7->_preAuthenticatedDSIDs = v13;
  }
  return v7;
}

- (id)enquePurchases:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__AMSPurchaseQueue_enquePurchases___block_invoke;
  v9[3] = &unk_1E55A0A40;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  v7 = [(AMSMutableLazyPromise *)v5 initWithBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __35__AMSPurchaseQueue_enquePurchases___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    id v5 = [[AMSPurchaseBatch alloc] initWithPurchases:*(void *)(a1 + 32) weakPromise:v4];

    id v6 = [WeakRetained batches];
    [v6 appendBatch:v5];

    [WeakRetained _handleNextPurchase];
  }
  else
  {
    AMSError(0, @"Purchase Failed", @"Queue has vanished", 0);
    id v5 = (AMSPurchaseBatch *)objc_claimAutoreleasedReturnValue();
    [v4 finishWithError:v5];
  }
}

- (void)setSuspended:(BOOL)a3 logUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(AMSPurchaseQueue *)self batches];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(AMSPurchaseQueue *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__AMSPurchaseQueue_setSuspended_logUUID___block_invoke;
    block[3] = &unk_1E55A46F8;
    block[4] = self;
    BOOL v14 = a3;
    id v13 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring suspend request due to queue being empty", buf, 0x16u);
    }
  }
}

void __41__AMSPurchaseQueue_setSuspended_logUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setSuspended:*(unsigned __int8 *)(a1 + 48)];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = +[AMSLogConfig sharedPurchaseConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Suspending purchase queue", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v4 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resuming purchase queue", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 32) _handleNextPurchase];
  }
}

+ (NSString)bagSubProfile
{
  return +[AMSPurchaseBagConsumer bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSPurchaseBagConsumer bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSPurchaseBagConsumer createBagForSubProfile];
}

- (void)_handleNextPurchase
{
  uint64_t v3 = [(AMSPurchaseQueue *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AMSPurchaseQueue__handleNextPurchase__block_invoke;
  block[3] = &unk_1E559EA90;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__AMSPurchaseQueue__handleNextPurchase__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) batches];
  uint64_t v3 = [v2 count];

  int v4 = [*(id *)(a1 + 32) isSuspended];
  if ((v4 & 1) != 0 || !v3)
  {
    uint64_t v8 = +[AMSLogConfig sharedPurchaseConfig];
    uint64_t v9 = (void *)v8;
    if (v4)
    {
      if (!v8)
      {
        uint64_t v9 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v10 = [v9 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      __int16 v13 = "%{public}@: [%{public}@]: Not handling next purchase due to queue being suspended";
    }
    else
    {
      if (!v8)
      {
        uint64_t v9 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v10 = [v9 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v14 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      __int16 v13 = "%{public}@: [%{public}@]: Queue empty";
    }
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

LABEL_18:
    return;
  }
  id v5 = [*(id *)(a1 + 32) batches];
  id v15 = [v5 nextPurchase];

  uint64_t v6 = v15;
  if (v15)
  {
    id v7 = (id)[*(id *)(a1 + 32) _processPurchase:v15];
    uint64_t v6 = v15;
  }
}

- (id)_processPurchase:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSPurchaseQueue *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 logUUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v8;
    __int16 v44 = 2114;
    v45 = v9;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing purchase", buf, 0x16u);
  }
  uint64_t v10 = [(AMSPurchaseQueue *)self config];
  uint64_t v11 = (objc_class *)[v10 purchaseTaskClass];
  if (!v11) {
    uint64_t v11 = (objc_class *)objc_opt_class();
  }

  id v12 = [v11 alloc];
  __int16 v13 = [(AMSPurchaseQueue *)self config];
  uint64_t v14 = [v13 bag];
  id v15 = (void *)[v12 initWithPurchase:v4 bag:v14];

  [v15 setDelegate:self];
  [v15 setRunMode:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__AMSPurchaseQueue__processPurchase___block_invoke;
  aBlock[3] = &unk_1E559E2E8;
  aBlock[4] = self;
  id v16 = v4;
  id v40 = v16;
  id v17 = v15;
  id v41 = v17;
  __int16 v18 = _Block_copy(aBlock);
  uint64_t v19 = [(AMSPurchaseQueue *)self preAuthenticatedDSIDs];
  uint64_t v20 = [v16 account];
  v21 = objc_msgSend(v20, "ams_DSID");
  int v22 = [v19 containsObject:v21];

  if (v22)
  {
    v23 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __37__AMSPurchaseQueue__processPurchase___block_invoke_2;
    v37[3] = &unk_1E55A5B20;
    v37[4] = self;
    id v38 = v17;
    [v23 addSuccessBlock:v37];
    v24 = [v23 continueWithBlock:v18];

    v25 = v38;
LABEL_11:

    goto LABEL_13;
  }
  v26 = [v17 purchaseInfo];
  BOOL v27 = +[AMSPurchaseTask shouldPreauthenticatePurchaseWithInfo:v26];

  if (v27)
  {
    v28 = [(AMSPurchaseQueue *)self _performPreauthenticateForPurchaseTask:v17];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __37__AMSPurchaseQueue__processPurchase___block_invoke_16;
    v33 = &unk_1E55A5B48;
    v34 = self;
    id v35 = v17;
    id v36 = v16;
    [v28 addSuccessBlock:&v30];
    v24 = objc_msgSend(v28, "continueWithBlock:", v18, v30, v31, v32, v33, v34);

    v25 = v35;
    goto LABEL_11;
  }
  v24 = [(AMSPurchaseQueue *)self _createPurchasePromiseForTask:v17 purchase:v16];
LABEL_13:

  return v24;
}

id __37__AMSPurchaseQueue__processPurchase___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)a1[4];
  if (v4)
  {
    [v5 _handleResult:0 error:v4 forPurchase:a1[5]];
    +[AMSPromise promiseWithError:v4];
  }
  else
  {
    [v5 _createPurchasePromiseForTask:a1[6] purchase:a1[5]];
  uint64_t v6 = };

  return v6;
}

void __37__AMSPurchaseQueue__processPurchase___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v2)
  {
    int v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] 'hasBeenAuthedForBuy' flag set for purchase, queue already authenticated for this account.", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [*(id *)(a1 + 40) purchaseInfo];
  [v6 setHasBeenAuthedForBuy:1];
}

void __37__AMSPurchaseQueue__processPurchase___block_invoke_16(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v2)
  {
    int v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    int v10 = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] 'hasBeenAuthedForBuy' flag set for purchase: Device Restrictions", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v6 = [a1[5] purchaseInfo];
  [v6 setHasBeenAuthedForBuy:1];

  int v7 = [a1[4] preAuthenticatedDSIDs];
  uint64_t v8 = [a1[6] account];
  __int16 v9 = objc_msgSend(v8, "ams_DSID");
  [v7 addObject:v9];
}

- (id)_createPurchasePromiseForTask:(id)a3 purchase:(id)a4
{
  id v6 = a4;
  int v7 = [a3 performPurchase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke;
  v10[3] = &unk_1E55A5B70;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  [v7 addFinishBlock:v10];

  return v7;
}

void __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) dispatchQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke_2;
  v11[3] = &unk_1E55A2280;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSuspended];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) _handleResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48) forPurchase:*(void *)(a1 + 56)];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _handleNextPurchase];
  }
  return result;
}

- (void)_handleResult:(id)a3 error:(id)a4 forPurchase:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AMSPurchaseQueue *)self batches];
  id v11 = [v10 batchForPurchase:v9];

  if (v11)
  {
    if (v8) {
      [v11 finishPurchase:v9 withError:v8];
    }
    else {
      [v11 finishPurchase:v9 withResult:v13];
    }
    if ([v11 isComplete])
    {
      id v12 = [(AMSPurchaseQueue *)self batches];
      [v12 popBatch:v11];
    }
  }
}

- (id)_performPreauthenticateForPurchaseTask:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSPurchaseQueue *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  int v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to pre-authenticate purchase queue for device restrictions", buf, 0x16u);
  }
  id v10 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v10 setAuthenticationType:2];
  [(AMSAuthenticateOptions *)v10 setCanMakeAccountActive:0];
  id v11 = [v4 purchaseInfo];
  id v12 = [v11 clientInfo];
  [(AMSAuthenticateOptions *)v10 setClientInfo:v12];

  [(AMSAuthenticateOptions *)v10 setDebugReason:@"Pre-authentication due to device restrictions around purchasing."];
  id v13 = [AMSAuthenticateRequest alloc];
  id v14 = [v4 purchaseInfo];
  id v15 = [v14 account];
  id v16 = [(AMSAuthenticateRequest *)v13 initWithAccount:v15 options:v10];

  id v17 = AMSLogKey();
  [(AMSAuthenticateRequest *)v16 setLogKey:v17];

  __int16 v18 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = objc_alloc_init(AMSPromise);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke;
    v25[3] = &unk_1E55A5B98;
    v25[4] = self;
    [(AMSPromise *)v19 addSuccessBlock:v25];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke_32;
    v24[3] = &unk_1E559F028;
    v24[4] = self;
    [(AMSPromise *)v19 addErrorBlock:v24];
    uint64_t v20 = [v4 purchaseInfo];
    v21 = [v20 purchase];
    int v22 = [(AMSPromise *)v19 completionHandlerAdapter];
    [v18 purchase:v21 handleAuthenticateRequest:v16 completion:v22];
  }
  else
  {
    uint64_t v20 = AMSError(12, @"Purchase Authentication Failed", @"Delegate does not respond to auth callback", 0);
    uint64_t v19 = +[AMSPromise promiseWithError:v20];
  }

  return v19;
}

void __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v0)
  {
    v0 = +[AMSLogConfig sharedConfig];
  }
  v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = AMSLogKey();
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    int v7 = v3;
    _os_log_impl(&dword_18D554000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Queue pre-authentication for device restrictions succeeded.", (uint8_t *)&v4, 0x16u);
  }
}

void __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  int v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    __int16 v6 = AMSLogKey();
    int v7 = AMSLogableError(v2);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Queue pre-authentication for device restrictions failed with error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (BOOL)isSuspended
{
  uint64_t v3 = [(AMSPurchaseQueue *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  uint64_t v5 = [(AMSPurchaseQueue *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  self->_suspended = a3;
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [(AMSPurchaseQueue *)self config];
  id v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(AMSPurchaseQueue *)self config];
    uint64_t v14 = [v13 delegate];
    [v14 handleAuthenticateRequest:v8 purchase:v15 purchaseQueue:self completion:v9];

    id v9 = v14;
  }
  else
  {
    id v13 = AMSError(12, @"Purchase Batch Failed", @"Delegate method for authentications not found", 0);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [(AMSPurchaseQueue *)self config];
  id v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(AMSPurchaseQueue *)self config];
    uint64_t v14 = [v13 delegate];
    [v14 handleDialogRequest:v8 purchase:v15 purchaseQueue:self completion:v9];

    id v9 = v14;
  }
  else
  {
    id v13 = AMSError(12, @"Purchase Batch Failed", @"Delegate method for dialogs not found", 0);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [(AMSPurchaseQueue *)self config];
  id v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(AMSPurchaseQueue *)self config];
    uint64_t v14 = [v13 delegate];
    [v14 handleEngagementRequest:v8 purchase:v15 purchaseQueue:self completion:v9];

    id v9 = v14;
  }
  else
  {
    id v13 = AMSError(12, @"Purchase Batch Failed", @"Delegate method for engagement not found", 0);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

- (AMSPurchaseQueueConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (AMSPurchaseQueueBatchList)batches
{
  return self->_batches;
}

- (void)setBatches:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (AMSThreadSafeSet)preAuthenticatedDSIDs
{
  return self->_preAuthenticatedDSIDs;
}

- (void)setPreAuthenticatedDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preAuthenticatedDSIDs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_batches, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end