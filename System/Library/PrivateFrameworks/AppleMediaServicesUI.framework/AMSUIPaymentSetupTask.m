@interface AMSUIPaymentSetupTask
- (AMSBinaryPromise)resultPromise;
- (AMSBinaryPromise)setupControllerPromise;
- (AMSUIPaymentSetupTask)initWithReferrerIdentifier:(id)a3 presentingViewController:(id)a4;
- (BOOL)_didSucceed;
- (NSString)referrerIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (UIViewController)viewController;
- (id)_fetchPaymentSetupFeature;
- (id)present;
- (int64_t)paymentSetupFeatureState;
- (void)_presentPaymentSetupControllerWithPaymentSetupFeatures:(id)a3;
- (void)paymentSetupViewControllerDidDismiss;
- (void)setPaymentSetupFeatureState:(int64_t)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setResultPromise:(id)a3;
- (void)setSetupControllerPromise:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIPaymentSetupTask

- (AMSUIPaymentSetupTask)initWithReferrerIdentifier:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AMSUIPaymentSetupTask;
  v9 = [(AMSTask *)&v17 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.AppleMediaServicesUI.AMSUIPaymentSetupTask.dispatch", 0);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v10;

    v12 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x263F27B58]);
    resultPromise = v9->_resultPromise;
    v9->_resultPromise = v12;

    v14 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x263F27B58]);
    setupControllerPromise = v9->_setupControllerPromise;
    v9->_setupControllerPromise = v14;

    objc_storeStrong((id *)&v9->_referrerIdentifier, a3);
    objc_storeStrong((id *)&v9->_viewController, a4);
  }

  return v9;
}

- (id)present
{
  v3 = [(AMSUIPaymentSetupTask *)self _fetchPaymentSetupFeature];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __32__AMSUIPaymentSetupTask_present__block_invoke;
  v10[3] = &unk_2643E4318;
  v10[4] = self;
  [v3 addFinishBlock:v10];
  objc_initWeak(&location, self);
  v4 = [(AMSUIPaymentSetupTask *)self setupControllerPromise];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__AMSUIPaymentSetupTask_present__block_invoke_10;
  v7[3] = &unk_2643E4340;
  objc_copyWeak(&v8, &location);
  [v4 addFinishBlock:v7];

  v5 = [(AMSUIPaymentSetupTask *)self resultPromise];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __32__AMSUIPaymentSetupTask_present__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) resultPromise];
    [v7 finishWithError:v6];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (v5)
    {
      v9 = [v8 dispatchQueue];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __32__AMSUIPaymentSetupTask_present__block_invoke_2;
      objc_super v17 = &unk_2643E34D0;
      uint64_t v18 = *(void *)(a1 + 32);
      id v10 = v5;
      id v19 = v10;
      dispatch_sync(v9, &v14);

      v11 = *(void **)(a1 + 32);
      v20[0] = v10;
      v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v20, 1, v14, v15, v16, v17, v18);
      [v11 _presentPaymentSetupControllerWithPaymentSetupFeatures:v12];

      goto LABEL_6;
    }
    id v7 = [v8 resultPromise];
    v13 = AMSError();
    [v7 finishWithError:v13];
  }
LABEL_6:
}

uint64_t __32__AMSUIPaymentSetupTask_present__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = AMSLogKey();
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "state"));
    int v9 = 138543874;
    id v10 = v4;
    __int16 v11 = 2114;
    v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initial payment setup feature state: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setPaymentSetupFeatureState:", objc_msgSend(*(id *)(a1 + 40), "state"));
}

void __32__AMSUIPaymentSetupTask_present__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _fetchPaymentSetupFeature];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__AMSUIPaymentSetupTask_present__block_invoke_2_11;
  v3[3] = &unk_2643E4318;
  v3[4] = WeakRetained;
  [v2 addFinishBlock:v3];
}

void __32__AMSUIPaymentSetupTask_present__block_invoke_2_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v5)
  {
    id v8 = [v7 dispatchQueue];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    __int16 v13 = __32__AMSUIPaymentSetupTask_present__block_invoke_3;
    uint64_t v14 = &unk_2643E34D0;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v5;
    dispatch_sync(v8, &v11);

    int v9 = objc_msgSend(*(id *)(a1 + 32), "resultPromise", v11, v12, v13, v14, v15);
    objc_msgSend(v9, "finishWithSuccess:error:", objc_msgSend(*(id *)(a1 + 32), "_didSucceed"), 0);
  }
  else
  {
    id v10 = [v7 resultPromise];
    [v10 finishWithError:v6];
  }
}

uint64_t __32__AMSUIPaymentSetupTask_present__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = AMSLogKey();
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "state"));
    int v9 = 138543874;
    id v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Final payment setup feature state: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setPaymentSetupFeatureState:", objc_msgSend(*(id *)(a1 + 40), "state"));
}

- (id)_fetchPaymentSetupFeature
{
  id v3 = objc_alloc(MEMORY[0x263F27DF0]);
  v4 = [(AMSUIPaymentSetupTask *)self referrerIdentifier];
  id v5 = (void *)[v3 initWithIdentifier:v4];

  id v6 = [v5 performPaymentSetupFeatureLookup];

  return v6;
}

- (BOOL)_didSucceed
{
  return [(AMSUIPaymentSetupTask *)self paymentSetupFeatureState] == 3;
}

- (void)_presentPaymentSetupControllerWithPaymentSetupFeatures:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = (Class (__cdecl *)())getPKPaymentSetupConfigurationClass[0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4());
  id v7 = [(AMSUIPaymentSetupTask *)self referrerIdentifier];
  [v6 setReferrerIdentifier:v7];

  id v8 = objc_alloc_init((Class)getPKPaymentSetupRequestClass[0]());
  [v8 setConfiguration:v6];
  [v8 setPaymentSetupFeatures:v5];

  if (v8)
  {
    int v9 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v9)
    {
      int v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Preparing to display upsell view controller", buf, 0x16u);
    }
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke;
    id v19 = &unk_2643E34D0;
    id v20 = v8;
    v21 = self;
    dispatch_async(MEMORY[0x263EF83A0], &v16);
    __int16 v13 = [(AMSUIPaymentSetupTask *)self setupControllerPromise];
    [v13 addFinishBlock:&__block_literal_global_12];
  }
  else
  {
    uint64_t v14 = [(AMSUIPaymentSetupTask *)self resultPromise];
    uint64_t v15 = AMSError();
    [v14 finishWithError:v15];
  }
}

void __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke(uint64_t a1)
{
  v2 = [[AMSUIPaymentSetupViewController alloc] initWithPaymentSetupRequest:*(void *)(a1 + 32)];
  [(AMSUIPaymentSetupViewController *)v2 setDelegate:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 40) viewController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke_2;
  v4[3] = &unk_2643E3118;
  v4[4] = *(void *)(a1 + 40);
  [v3 presentViewController:v2 animated:1 completion:v4];
}

void __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke_2()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v0)
  {
    v0 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = objc_opt_class();
    id v3 = AMSLogKey();
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    id v7 = v3;
    _os_log_impl(&dword_21C134000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]: Did present upsell view controller", (uint8_t *)&v4, 0x16u);
  }
}

void __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke_18()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v0)
  {
    v0 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = AMSLogKey();
    int v3 = 138543362;
    int v4 = v2;
    _os_log_impl(&dword_21C134000, v1, OS_LOG_TYPE_DEFAULT, "AMSUIPaymentSetupTask: [%{public}@] Finishing upsell view controller operation", (uint8_t *)&v3, 0xCu);
  }
}

- (void)paymentSetupViewControllerDidDismiss
{
  id v3 = [(AMSUIPaymentSetupTask *)self setupControllerPromise];
  objc_msgSend(v3, "finishWithSuccess:error:", -[AMSUIPaymentSetupTask _didSucceed](self, "_didSucceed"), 0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (int64_t)paymentSetupFeatureState
{
  return self->_paymentSetupFeatureState;
}

- (void)setPaymentSetupFeatureState:(int64_t)a3
{
  self->_paymentSetupFeatureState = a3;
}

- (AMSBinaryPromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
}

- (AMSBinaryPromise)setupControllerPromise
{
  return self->_setupControllerPromise;
}

- (void)setSetupControllerPromise:(id)a3
{
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_setupControllerPromise, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end