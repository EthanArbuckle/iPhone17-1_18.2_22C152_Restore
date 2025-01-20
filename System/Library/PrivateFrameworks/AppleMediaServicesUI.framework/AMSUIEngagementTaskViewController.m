@interface AMSUIEngagementTaskViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSEngagementRequest)request;
- (AMSEngagementResult)result;
- (AMSProcessInfo)clientInfo;
- (AMSPromise)childPromise;
- (AMSUIEngagementTaskViewController)initWithRequest:(id)a3 bag:(id)a4;
- (BOOL)_isURLTrusted:(id)a3 inDomains:(id)a4;
- (BOOL)dynamicViewControllerShouldDismiss:(id)a3;
- (BOOL)ignoresDismissDetection;
- (BOOL)presented;
- (NSError)error;
- (UIViewController)childController;
- (id)_isOriginatingURLTrusted;
- (id)_preloadChild;
- (id)_viewControllerForType:(id)a3;
- (id)canPresent;
- (id)dismissBlock;
- (id)startEngagement;
- (int64_t)_modalPresentationStyle;
- (void)_finishWithResultInfo:(id)a3 error:(id)a4;
- (void)_receivedCarrierLinkResult:(id)a3;
- (void)_receivedPurchaseResult:(id)a3;
- (void)_setup;
- (void)_updateChildViewController:(id)a3;
- (void)dealloc;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setBag:(id)a3;
- (void)setChildController:(id)a3;
- (void)setChildPromise:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDismissBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setIgnoresDismissDetection:(BOOL)a3;
- (void)setPresented:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setResult:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6;
@end

@implementation AMSUIEngagementTaskViewController

- (AMSUIEngagementTaskViewController)initWithRequest:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIEngagementTaskViewController;
  v9 = [(AMSUIEngagementTaskViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_request, a3);
    [(AMSUIEngagementTaskViewController *)v10 _setup];
  }

  return v10;
}

- (void)dealloc
{
  if (![(AMSUIEngagementTaskViewController *)self ignoresDismissDetection])
  {
    v3 = [(AMSUIEngagementTaskViewController *)self dismissBlock];

    if (v3)
    {
      v4 = [(AMSUIEngagementTaskViewController *)self dismissBlock];
      v4[2]();

      [(AMSUIEngagementTaskViewController *)self setDismissBlock:0];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementTaskViewController;
  [(AMSUICommonViewController *)&v5 dealloc];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementTaskViewController;
  [(AMSUICommonViewController *)&v5 loadView];
  [(AMSUIEngagementTaskViewController *)self setTransitioningDelegate:self];
  v3 = objc_msgSend(MEMORY[0x263F825C8], "ams_primaryBackground");
  v4 = [(AMSUICommonViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementTaskViewController;
  [(AMSUIEngagementTaskViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMSUIEngagementTaskViewController;
  [(AMSUIEngagementTaskViewController *)&v8 viewDidDisappear:a3];
  if (![(AMSUIEngagementTaskViewController *)self ignoresDismissDetection])
  {
    if (([(AMSUIEngagementTaskViewController *)self isBeingDismissed] & 1) == 0)
    {
      v4 = [(AMSUIEngagementTaskViewController *)self navigationController];
      if ([v4 isBeingDismissed])
      {
      }
      else
      {
        int v5 = [(AMSUIEngagementTaskViewController *)self isMovingFromParentViewController];

        if (!v5) {
          return;
        }
      }
    }
    v6 = [(AMSUIEngagementTaskViewController *)self dismissBlock];

    if (v6)
    {
      id v7 = [(AMSUIEngagementTaskViewController *)self dismissBlock];
      v7[2]();

      [(AMSUIEngagementTaskViewController *)self setDismissBlock:0];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementTaskViewController;
  [(AMSUIEngagementTaskViewController *)&v14 viewWillLayoutSubviews];
  objc_super v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(AMSUIEngagementTaskViewController *)self childController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (![(AMSUIEngagementTaskViewController *)self ignoresDismissDetection])
  {
    double v4 = [(AMSUIEngagementTaskViewController *)self dismissBlock];

    if (v4)
    {
      double v5 = [(AMSUIEngagementTaskViewController *)self dismissBlock];
      v5[2]();

      [(AMSUIEngagementTaskViewController *)self setDismissBlock:0];
    }
  }
}

- (id)canPresent
{
  id v3 = objc_alloc_init(MEMORY[0x263F27B58]);
  double v4 = [(AMSUIEngagementTaskViewController *)self _preloadChild];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__AMSUIEngagementTaskViewController_canPresent__block_invoke;
  v7[3] = &unk_2643E3A78;
  id v5 = v3;
  id v8 = v5;
  [v4 addFinishBlock:v7];

  return v5;
}

uint64_t __47__AMSUIEngagementTaskViewController_canPresent__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithSuccess];
  }
  else {
    return objc_msgSend(v2, "finishWithError:");
  }
}

- (id)startEngagement
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIEngagementTaskViewController *)self request];
  double v4 = [v3 logKey];
  id v5 = (id)AMSSetLogKey();

  double v6 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v6)
  {
    double v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    double v9 = AMSLogKey();
    double v10 = [(AMSUIEngagementTaskViewController *)self request];
    double v11 = [v10 URL];
    objc_super v12 = AMSLogableURL();
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v8;
    __int16 v26 = 2114;
    v27 = v9;
    __int16 v28 = 2114;
    v29 = v12;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting engagement task with URL: %{public}@", buf, 0x20u);
  }
  v13 = [(AMSUIEngagementTaskViewController *)self childPromise];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke;
    block[3] = &unk_2643E3118;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v15 = [(AMSUIEngagementTaskViewController *)self _preloadChild];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2;
  v22[3] = &unk_2643E3AA0;
  v22[4] = self;
  v16 = [v15 continueWithBlock:v22];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_35;
  v21[3] = &unk_2643E3A08;
  v21[4] = self;
  v17 = [v16 catchWithBlock:v21];

  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_39;
  v19[3] = &unk_2643E3AC8;
  objc_copyWeak(&v20, (id *)buf);
  [v17 addFinishBlock:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
  return v17;
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(AMSUICommonLoadingViewController);
  [v1 _updateChildViewController:v2];
}

id __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) request];
  uint64_t v8 = [v7 logKey];
  id v9 = (id)AMSSetLogKey();

  id v10 = objc_alloc_init(MEMORY[0x263F27E10]);
  [*(id *)(a1 + 32) setPresented:1];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3;
  v28[3] = &unk_2643E3598;
  objc_copyWeak(&v30, &location);
  id v11 = v10;
  id v29 = v11;
  [*(id *)(a1 + 32) setDismissBlock:v28];
  if (v6)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_30;
    v24 = &unk_2643E3360;
    uint64_t v25 = *(void *)(a1 + 32);
    id v12 = v6;
    id v26 = v12;
    id v13 = v11;
    id v27 = v13;
    dispatch_async(MEMORY[0x263EF83A0], &v21);
    objc_msgSend(*(id *)(a1 + 32), "setError:", v12, v21, v22, v23, v24, v25);
    id v14 = v13;
  }
  else
  {
    v15 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v15)
    {
      v15 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v17;
      __int16 v34 = 2114;
      v35 = v18;
      __int16 v36 = 2114;
      id v37 = v5;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) _updateChildViewController:v5];
    id v19 = v11;
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v11;
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained request];
  double v4 = [v3 logKey];
  id v5 = (id)AMSSetLogKey();

  id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    int v19 = 138543618;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v9;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismiss called on presented view controller", (uint8_t *)&v19, 0x16u);
  }
  id v10 = [WeakRetained error];

  if (!v10)
  {
    id v14 = [WeakRetained result];

    if (v14)
    {
      v15 = *(void **)(a1 + 32);
      id v13 = [WeakRetained result];
      v16 = v15;
LABEL_10:
      [v16 finishWithResult:v13];
      goto LABEL_11;
    }
    uint64_t v17 = [WeakRetained request];
    if ([v17 failOnDismiss])
    {
    }
    else
    {
      char v18 = [WeakRetained ignoresDismissDetection];

      if ((v18 & 1) == 0)
      {
        id v13 = objc_alloc_init(MEMORY[0x263F27C60]);
        v16 = *(void **)(a1 + 32);
        goto LABEL_10;
      }
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = AMSError();
    goto LABEL_7;
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [WeakRetained error];
LABEL_7:
  id v13 = (id)v12;
  [v11 finishWithError:v12];
LABEL_11:
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_30(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  id v3 = [AMSUICommonErrorViewController alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) request];
  id v6 = [v5 logKey];
  double v7 = [*(id *)(a1 + 32) bag];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_32;
  v10[3] = &unk_2643E3598;
  objc_copyWeak(&v12, &location);
  id v11 = *(id *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3_33;
  v9[3] = &unk_2643E3118;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v8 = [(AMSUICommonErrorViewController *)v3 initWithError:v4 logKey:v6 bag:v7 retryAction:v10 cancelAction:v9];
  [v2 _updateChildViewController:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_32(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained childController];
  [WeakRetained unsetChildViewController:v2];

  [WeakRetained setChildController:0];
  [WeakRetained setError:0];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [WeakRetained startEngagement];
  [v3 finishWithPromise:v4];
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3_33(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dismissBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) dismissBlock];
    v3[2]();

    uint64_t v4 = *(void **)(a1 + 32);
    [v4 setDismissBlock:0];
  }
}

id __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 userInfo];
  id v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v8 = v7;

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "presented"));
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F27858]];

  id v10 = [v3 domain];
  [v3 code];
  id v11 = objc_msgSend(v3, "ams_title");
  id v12 = objc_msgSend(v3, "ams_message");
  id v13 = objc_msgSend(v3, "ams_underlyingError");

  id v14 = AMSCustomError();

  [*(id *)(a1 + 32) setError:v14];
  v15 = [MEMORY[0x263F27E10] promiseWithError:v14];

  return v15;
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_39(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = [WeakRetained request];
  id v9 = [v8 logKey];
  id v10 = (id)AMSSetLogKey();

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  id v12 = (void *)v11;
  if (v6)
  {
    if (!v11)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      v16 = AMSLogableError();
      int v21 = 138543874;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      v24 = v15;
      __int16 v25 = 2114;
      id v26 = v16;
      uint64_t v17 = "%{public}@: [%{public}@] Task completed with error: %{public}@";
      char v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_21C134000, v18, v19, v17, (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    if (!v11)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v15 = AMSLogKey();
      v16 = [v5 userInfo];
      int v21 = 138543874;
      uint64_t v22 = v20;
      __int16 v23 = 2114;
      v24 = v15;
      __int16 v25 = 2112;
      id v26 = v16;
      uint64_t v17 = "%{public}@: [%{public}@] Task completed successfully. %@";
      char v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }
}

- (void)_setup
{
  [(AMSUIEngagementTaskViewController *)self setModalPresentationStyle:[(AMSUIEngagementTaskViewController *)self _modalPresentationStyle]];
  id v3 = [(AMSUIEngagementTaskViewController *)self request];
  uint64_t v4 = [v3 destinationStyle];

  if (v4 == 1)
  {
    id v5 = [AMSEngagementOfflineBag alloc];
    id v7 = [(AMSUIEngagementTaskViewController *)self bag];
    id v6 = [(AMSEngagementOfflineBag *)v5 initWithUnderlyingBag:v7];
    [(AMSUIEngagementTaskViewController *)self setBag:v6];
  }
}

- (void)_finishWithResultInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AMSUIEngagementTaskViewController *)self error];

  if (!v8)
  {
    if (v7)
    {
      [(AMSUIEngagementTaskViewController *)self setError:v7];
      [(AMSUIEngagementTaskViewController *)self setResult:0];
    }
    else
    {
      id v9 = [(AMSUIEngagementTaskViewController *)self result];
      id v10 = v9;
      if (v9) {
        id v11 = v9;
      }
      else {
        id v11 = objc_alloc_init(MEMORY[0x263F27C60]);
      }
      id v12 = v11;

      id v13 = [(AMSUIEngagementTaskViewController *)self result];
      uint64_t v14 = [v13 userInfo];
      v15 = (void *)[v14 mutableCopy];
      v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      char v18 = v17;

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __65__AMSUIEngagementTaskViewController__finishWithResultInfo_error___block_invoke;
      v20[3] = &unk_2643E3AF0;
      id v21 = v18;
      id v19 = v18;
      [v6 enumerateKeysAndObjectsUsingBlock:v20];
      [v12 setUserInfo:v19];
      [(AMSUIEngagementTaskViewController *)self setResult:v12];
    }
  }
}

uint64_t __65__AMSUIEngagementTaskViewController__finishWithResultInfo_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (id)_isOriginatingURLTrusted
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    id v7 = [(AMSUIEngagementTaskViewController *)self request];
    uint64_t v8 = [v7 originatingURL];
    id v9 = [(AMSUIEngagementTaskViewController *)self request];
    id v10 = [v9 URL];
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = v5;
    __int16 v31 = 2114;
    v32 = v6;
    __int16 v33 = 2114;
    __int16 v34 = v8;
    __int16 v35 = 2114;
    __int16 v36 = v10;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking if originating URL %{public}@ is trusted for request %{public}@", buf, 0x2Au);
  }
  id v11 = [(AMSUIEngagementTaskViewController *)self request];
  uint64_t v12 = [v11 originatingURL];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(AMSUIEngagementTaskViewController *)self request];
    uint64_t v15 = [v14 destinationStyle];

    if (!v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x263F27B58]);
      id v17 = +[AMSUIEngagementTask createBagForSubProfile];
      char v18 = [v17 arrayForKey:@"trustedEngagementReferrers"];
      id v19 = [v18 valuePromise];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke;
      v27[3] = &unk_2643E3570;
      id v20 = v16;
      id v28 = v20;
      [v19 addErrorBlock:v27];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke_2;
      v25[3] = &unk_2643E3B18;
      v25[4] = self;
      id v21 = v20;
      id v26 = v21;
      [v19 addSuccessBlock:v25];
      uint64_t v22 = v26;
      id v23 = v21;

      goto LABEL_10;
    }
  }
  else
  {
  }
  id v23 = [MEMORY[0x263F27B58] promiseWithSuccess];
LABEL_10:
  return v23;
}

void __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  AMSError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

void __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 request];
  id v6 = [v5 originatingURL];
  LODWORD(v3) = [v3 _isURLTrusted:v6 inDomains:v4];

  id v7 = *(void **)(a1 + 40);
  if (v3)
  {
    [v7 finishWithSuccess];
  }
  else
  {
    AMSError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 finishWithError:v8];
  }
}

- (BOOL)_isURLTrusted:(id)a3 inDomains:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [a3 host];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length", (void)v15))
        {
          if ([v12 hasPrefix:@"."])
          {
            if ([v6 hasSuffix:v12]) {
              goto LABEL_15;
            }
          }
          else if (![v6 caseInsensitiveCompare:v12])
          {
LABEL_15:
            BOOL v13 = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (int64_t)_modalPresentationStyle
{
  id v2 = [(AMSUIEngagementTaskViewController *)self request];
  uint64_t v3 = [v2 presentationStyle];

  if (v3 == 3) {
    return 1;
  }
  else {
    return 2 * (v3 != 2);
  }
}

- (id)_preloadChild
{
  uint64_t v3 = [(AMSUIEngagementTaskViewController *)self childPromise];

  if (!v3)
  {
    id v4 = [(AMSUIEngagementTaskViewController *)self _isOriginatingURLTrusted];
    id v5 = [v4 promiseAdapter];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke;
    v9[3] = &unk_2643E3B40;
    v9[4] = self;
    id v6 = [v5 thenWithBlock:v9];
    [(AMSUIEngagementTaskViewController *)self setChildPromise:v6];
  }
  id v7 = [(AMSUIEngagementTaskViewController *)self childPromise];
  return v7;
}

id __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F27E10]);
  uint64_t v3 = [*(id *)(a1 + 32) request];
  uint64_t v4 = [v3 destinationStyle];

  if (v4 == 1)
  {
    id v5 = &unk_26CC73598;
LABEL_5:
    [v2 finishWithResult:v5];
    goto LABEL_7;
  }
  id v6 = [*(id *)(a1 + 32) request];
  uint64_t v7 = [v6 destinationStyle];

  if (v7 == 2)
  {
    id v5 = &unk_26CC735B0;
    goto LABEL_5;
  }
  id v8 = objc_alloc(MEMORY[0x263F27EC8]);
  uint64_t v9 = [*(id *)(a1 + 32) bag];
  uint64_t v10 = (void *)[v8 initWithBag:v9];

  id v11 = [*(id *)(a1 + 32) request];
  uint64_t v12 = [v11 URL];
  uint64_t v13 = [v10 typeForURL:v12];

  id v2 = (id)v13;
LABEL_7:
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke_60;
  v16[3] = &unk_2643E3B40;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v14 = [v2 thenWithBlock:v16];

  return v14;
}

id __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) request];
  id v5 = [v4 logKey];
  id v6 = (id)AMSSetLogKey();

  uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    long long v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = [v3 longValue];
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determined URL type: %ld", (uint8_t *)&v13, 0x20u);
  }
  id v11 = [*(id *)(a1 + 32) _viewControllerForType:v3];

  return v11;
}

- (void)_receivedCarrierLinkResult:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AMSUIEngagementTaskViewController *)self result];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263F27C60]);
  }
  id v8 = v7;

  [v8 setCarrierLinkResult:v4];
  [(AMSUIEngagementTaskViewController *)self setResult:v8];
  uint64_t v10 = @"didCarrierLink";
  v11[0] = MEMORY[0x263EFFA88];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(AMSUIEngagementTaskViewController *)self _finishWithResultInfo:v9 error:0];
}

- (void)_receivedPurchaseResult:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AMSUIEngagementTaskViewController *)self result];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263F27C60]);
  }
  id v8 = v7;

  [v8 setPurchaseResult:v4];
  [(AMSUIEngagementTaskViewController *)self setResult:v8];
  uint64_t v10 = @"didPurchase";
  v11[0] = MEMORY[0x263EFFA88];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(AMSUIEngagementTaskViewController *)self _finishWithResultInfo:v9 error:0];
}

- (void)_updateChildViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__AMSUIEngagementTaskViewController__updateChildViewController___block_invoke;
  v6[3] = &unk_2643E34D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __64__AMSUIEngagementTaskViewController__updateChildViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) childController];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 childController];
    [v3 unsetChildViewController:v4];
  }
  [*(id *)(a1 + 32) setChildController:*(void *)(a1 + 40)];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 childController];
  [v5 setChildViewController:v6];
}

- (id)_viewControllerForType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F27E10]);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__AMSUIEngagementTaskViewController__viewControllerForType___block_invoke;
  block[3] = &unk_2643E3360;
  block[4] = self;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v8 = v13;
  id v9 = v6;

  return v9;
}

void __60__AMSUIEngagementTaskViewController__viewControllerForType___block_invoke(id *a1)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v2 = [a1[4] request];
  uint64_t v3 = [v2 clientData];
  id v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x263EFFA78];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v29 = @"engagementTask";
  v30[0] = MEMORY[0x263EFFA88];
  id v7 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v8 = objc_msgSend(v6, "ams_dictionaryByAddingEntriesFromDictionary:", v7);

  uint64_t v9 = [a1[5] integerValue];
  switch(v9)
  {
    case 0:
      uint64_t v20 = [AMSUIWebViewController alloc];
      id v21 = [a1[4] bag];
      uint64_t v14 = [(AMSUIWebViewController *)v20 initWithBag:v21 account:0 clientInfo:0];

      uint64_t v22 = [a1[4] request];
      id v23 = [v22 account];
      [(AMSUIWebViewController *)v14 setAccount:v23];

      v24 = [a1[4] clientInfo];
      [(AMSUIWebViewController *)v14 setClientInfo:v24];

      [(AMSUIWebViewController *)v14 setClientOptions:v8];
      [(AMSUIWebViewController *)v14 setDelegate:a1[4]];
      __int16 v25 = [a1[4] request];
      id v26 = [v25 metricsOverlay];
      [(AMSUIWebViewController *)v14 setMetricsOverlay:v26];

      uint64_t v18 = [a1[4] request];
      uint64_t v19 = [v18 URL];
      id v27 = [(AMSUIWebViewController *)v14 loadURL:v19];
      goto LABEL_8;
    case 1:
      id v28 = a1[6];
      AMSError();
      uint64_t v14 = (AMSUIWebViewController *)objc_claimAutoreleasedReturnValue();
      [v28 finishWithError:v14];
      goto LABEL_10;
    case 2:
      uint64_t v10 = [AMSUIDynamicViewController alloc];
      id v11 = [a1[4] bag];
      id v12 = [a1[4] request];
      id v13 = [v12 URL];
      uint64_t v14 = [(AMSUIDynamicViewController *)v10 initWithBag:v11 URL:v13];

      __int16 v15 = [a1[4] request];
      long long v16 = [v15 account];
      [(AMSUIWebViewController *)v14 setAccount:v16];

      __int16 v17 = [a1[4] clientInfo];
      [(AMSUIWebViewController *)v14 setClientInfo:v17];

      [(AMSUIWebViewController *)v14 setClientOptions:v8];
      [(AMSUIWebViewController *)v14 setDelegate:a1[4]];
      uint64_t v18 = [a1[4] request];
      uint64_t v19 = [v18 metricsOverlay];
      [(AMSUIWebViewController *)v14 setMetricsOverlay:v19];
LABEL_8:

      [a1[6] finishWithResult:v14];
LABEL_10:

      break;
  }
}

+ (AMSBagKeySet)bagKeySet
{
  return +[AMSUIWebViewController bagKeySet];
}

+ (NSString)bagSubProfile
{
  return +[AMSUIWebViewController bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSUIWebViewController bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSUIWebViewController createBagForSubProfile];
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
  uint64_t v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI carrier link succeeded", (uint8_t *)&v18, 0x16u);
    }
    [(AMSUIEngagementTaskViewController *)self _receivedCarrierLinkResult:v7];
  }
  else
  {
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v14 = [v10 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      long long v16 = AMSLogKey();
      __int16 v17 = AMSLogableError();
      int v18 = 138543874;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      id v21 = v16;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dynamic UI carrier link failed with error: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
  uint64_t v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI purchase succeeded", (uint8_t *)&v18, 0x16u);
    }
    [(AMSUIEngagementTaskViewController *)self _receivedPurchaseResult:v7];
  }
  else
  {
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v14 = [v10 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      long long v16 = AMSLogKey();
      __int16 v17 = AMSLogableError();
      int v18 = 138543874;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      id v21 = v16;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dynamic UI purchase failed with error: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
  id v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      __int16 v20 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI purchase succeeded", (uint8_t *)&v17, 0x16u);
    }
    [(AMSUIEngagementTaskViewController *)self _receivedPurchaseResult:v6];
  }
  else
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v12 = [v8 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      __int16 v20 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI flow resolved and was dismissed", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v15 = [(AMSUIEngagementTaskViewController *)self dismissBlock];

    if (v15)
    {
      long long v16 = [(AMSUIEngagementTaskViewController *)self dismissBlock];
      v16[2]();

      [(AMSUIEngagementTaskViewController *)self setDismissBlock:0];
    }
  }
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F27CB8];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 sharedConfig];
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = AMSLogKey();
    int v16 = 138543618;
    uint64_t v17 = v12;
    __int16 v18 = 2114;
    __int16 v19 = v13;
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI did resolve", (uint8_t *)&v16, 0x16u);
  }
  [(AMSUIEngagementTaskViewController *)self _finishWithResultInfo:v9 error:v8];

  uint64_t v14 = [(AMSUIEngagementTaskViewController *)self dismissBlock];

  if (v14)
  {
    uint64_t v15 = [(AMSUIEngagementTaskViewController *)self dismissBlock];
    v15[2]();

    [(AMSUIEngagementTaskViewController *)self setDismissBlock:0];
  }
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F27CB8], "sharedConfig", a3);
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI will dismiss", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [(AMSUIEngagementTaskViewController *)self dismissBlock];

  if (v8)
  {
    id v9 = [(AMSUIEngagementTaskViewController *)self dismissBlock];
    v9[2]();

    [(AMSUIEngagementTaskViewController *)self setDismissBlock:0];
  }
  return [(AMSUIEngagementTaskViewController *)self ignoresDismissDetection];
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v6 = (void *)MEMORY[0x263F27CB8];
    id v7 = a4;
    id v8 = [v6 sharedConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      int v11 = AMSLogKey();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI purchase succeeded", (uint8_t *)&v12, 0x16u);
    }
    [(AMSUIEngagementTaskViewController *)self _receivedPurchaseResult:v7];
  }
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a6;
  uint64_t v10 = (void *)MEMORY[0x263F27CB8];
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [v10 sharedConfig];
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  __int16 v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = AMSLogKey();
    int v19 = 138543618;
    uint64_t v20 = v15;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI did resolve", (uint8_t *)&v19, 0x16u);
  }
  [(AMSUIEngagementTaskViewController *)self _finishWithResultInfo:v12 error:v11];

  if ([(AMSUIEngagementTaskViewController *)self ignoresDismissDetection])
  {
    uint64_t v17 = [(AMSUIEngagementTaskViewController *)self dismissBlock];

    if (v17)
    {
      __int16 v18 = [(AMSUIEngagementTaskViewController *)self dismissBlock];
      v18[2]();

      [(AMSUIEngagementTaskViewController *)self setDismissBlock:0];
    }
  }
  (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x263EFFA88], 0);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (UIViewController)childController
{
  return self->_childController;
}

- (void)setChildController:(id)a3
{
}

- (AMSPromise)childPromise
{
  return self->_childPromise;
}

- (void)setChildPromise:(id)a3
{
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)presented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (AMSEngagementResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (BOOL)ignoresDismissDetection
{
  return self->_ignoresDismissDetection;
}

- (void)setIgnoresDismissDetection:(BOOL)a3
{
  self->_ignoresDismissDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong((id *)&self->_childPromise, 0);
  objc_storeStrong((id *)&self->_childController, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end