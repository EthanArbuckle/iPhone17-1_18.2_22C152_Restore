@interface AMSUIEngagementViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSEngagementRequest)effectiveRequest;
- (AMSEngagementRequest)request;
- (AMSProcessInfo)clientInfo;
- (AMSPromise)loadVCPromise;
- (AMSUIEngagementViewController)initWithRequest:(id)a3 bag:(id)a4 delegate:(id)a5;
- (AMSUIEngagementViewControllerDelegate)delegate;
- (BOOL)_isURLTrusted:(id)a3 inDomains:(id)a4;
- (BOOL)dynamicViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5;
- (BOOL)dynamicViewControllerShouldDismiss:(id)a3;
- (BOOL)started;
- (NSDictionary)engagementMetrics;
- (UIViewController)childController;
- (id)_isOriginatingURLTrusted;
- (id)_preloadChildVC;
- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5;
- (id)requestIsSupported;
- (int64_t)_modalPresentationStyle;
- (void)_dismiss;
- (void)_enqueueDisplayEvent;
- (void)_receivedCarrierLinkResult:(id)a3;
- (void)_receivedPurchaseResult:(id)a3;
- (void)_setup;
- (void)_startEngagement;
- (void)_updateChildViewController:(id)a3;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)loadView;
- (void)resolveWithResult:(id)a3 error:(id)a4;
- (void)setBag:(id)a3;
- (void)setChildController:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEngagementMetrics:(id)a3;
- (void)setLoadVCPromise:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)updateEffectiveRequest:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6;
@end

@implementation AMSUIEngagementViewController

- (AMSUIEngagementViewController)initWithRequest:(id)a3 bag:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIEngagementViewController;
  v12 = [(AMSUIEngagementViewController *)&v15 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a4);
    objc_storeStrong((id *)&v13->_request, a3);
    objc_storeStrong((id *)&v13->_effectiveRequest, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    [(AMSUIEngagementViewController *)v13 _setup];
  }

  return v13;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementViewController;
  [(AMSUICommonViewController *)&v5 loadView];
  v3 = objc_msgSend(MEMORY[0x263F825C8], "ams_primaryBackground");
  v4 = [(AMSUICommonViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementViewController;
  [(AMSUIEngagementViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIEngagementViewController;
  [(AMSUIEngagementViewController *)&v4 viewWillAppear:a3];
  if (![(AMSUIEngagementViewController *)self started])
  {
    [(AMSUIEngagementViewController *)self setStarted:1];
    [(AMSUIEngagementViewController *)self _enqueueDisplayEvent];
    [(AMSUIEngagementViewController *)self _startEngagement];
  }
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementViewController;
  [(AMSUIEngagementViewController *)&v14 viewWillLayoutSubviews];
  objc_super v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUIEngagementViewController *)self childController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (id)requestIsSupported
{
  id v3 = objc_alloc_init(MEMORY[0x263F27B58]);
  double v4 = [(AMSUIEngagementViewController *)self _preloadChildVC];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__AMSUIEngagementViewController_requestIsSupported__block_invoke;
  v7[3] = &unk_2643E3A78;
  id v5 = v3;
  id v8 = v5;
  [v4 addFinishBlock:v7];

  return v5;
}

uint64_t __51__AMSUIEngagementViewController_requestIsSupported__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithSuccess];
  }
  else {
    return objc_msgSend(v2, "finishWithError:");
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

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a4;
  double v11 = [(AMSUIEngagementViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
  objc_super v14 = (void *)v13;
  if (v12)
  {
    if (!v13)
    {
      objc_super v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      id v23 = (id)objc_opt_class();
      id v16 = v23;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to request content view", (uint8_t *)&v22, 0xCu);
    }
    v17 = [(AMSUIEngagementViewController *)self delegate];
    v18 = objc_msgSend(v17, "engagementViewController:contentViewWithDictionary:frame:", self, v10, x, y, width, height);
  }
  else
  {
    if (!v13)
    {
      objc_super v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v14 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138543362;
      id v23 = (id)objc_opt_class();
      id v20 = v23;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Delegate does not implement contentViewWithDictionary", (uint8_t *)&v22, 0xCu);
    }
    v17 = AMSError();
    v18 = 0;
  }

  return v18;
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
  id v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI carrier link succeeded", (uint8_t *)&v18, 0x16u);
    }
    [(AMSUIEngagementViewController *)self _receivedCarrierLinkResult:v7];
  }
  else
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v14 = [v10 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      id v16 = AMSLogKey();
      v17 = AMSLogableError();
      int v18 = 138543874;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      v21 = v16;
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
  id v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI purchase succeeded", (uint8_t *)&v18, 0x16u);
    }
    [(AMSUIEngagementViewController *)self _receivedPurchaseResult:v7];
  }
  else
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v14 = [v10 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      id v16 = AMSLogKey();
      v17 = AMSLogableError();
      int v18 = 138543874;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      v21 = v16;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dynamic UI purchase failed with error: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI did resolve", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263F27C60]);
    [v13 setUserInfo:v7];
  }
  [(AMSUIEngagementViewController *)self resolveWithResult:v13 error:v8];
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v4 = objc_msgSend(MEMORY[0x263F27CB8], "sharedConfig", a3);
  if (!v4)
  {
    double v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI will dismiss", (uint8_t *)&v9, 0x16u);
  }
  [(AMSUIEngagementViewController *)self _dismiss];
  return 0;
}

- (BOOL)dynamicViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = [(AMSUIEngagementViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = objc_opt_class();
      id v15 = v14;
      __int16 v16 = [v7 identifier];
      *(_DWORD *)buf = 138543618;
      v35 = v14;
      __int16 v36 = 2114;
      v37 = v16;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to handle delegate action (identifier: %{public}@)", buf, 0x16u);
    }
    v17 = [(AMSUIEngagementViewController *)self delegate];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __94__AMSUIEngagementViewController_dynamicViewController_handleDelegateAction_completionHandler___block_invoke;
    v31[3] = &unk_2643E34F8;
    v31[4] = self;
    id v32 = v7;
    id v33 = v8;
    char v18 = [v17 engagementViewController:self handleDynamicDelegateAction:v32 completionHandler:v31];

    if (v18)
    {
      BOOL v19 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v20 = [v12 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      id v22 = v21;
      id v23 = [v7 identifier];
      *(_DWORD *)buf = 138543618;
      v35 = v21;
      __int16 v36 = 2114;
      v37 = v23;
      _os_log_impl(&dword_21C134000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Delegate does not implement handleDynamicDelegateAction (identifier: %{public}@)", buf, 0x16u);
    }
    uint64_t v24 = AMSError();
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v24);
  }
  v25 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v25)
  {
    v25 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_opt_class();
    id v28 = v27;
    v29 = [v7 identifier];
    *(_DWORD *)buf = 138543618;
    v35 = v27;
    __int16 v36 = 2114;
    v37 = v29;
    _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate action not handled (identifier: %{public}@)", buf, 0x16u);
  }
  (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x263EFFA80], 0);
  BOOL v19 = 0;
LABEL_18:

  return v19;
}

void __94__AMSUIEngagementViewController_dynamicViewController_handleDelegateAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (!v5)
    {
      uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v13)
      {
        uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      int v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v23 = objc_opt_class();
      uint64_t v24 = *(void **)(a1 + 40);
      id v17 = v23;
      char v18 = [v24 identifier];
      int v25 = 138543618;
      v26 = v23;
      __int16 v27 = 2114;
      id v28 = v18;
      BOOL v19 = "%{public}@: Delegate responded with neither an error or response (identifier: %{public}@)";
      __int16 v20 = v14;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 22;
      goto LABEL_13;
    }
LABEL_9:
    uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    id v15 = objc_opt_class();
    __int16 v16 = *(void **)(a1 + 40);
    id v17 = v15;
    char v18 = [v16 identifier];
    int v25 = 138543874;
    v26 = v15;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    id v30 = v5;
    BOOL v19 = "%{public}@: Delegate responded with a response (identifier: %{public}@, response: %{public}@)";
    __int16 v20 = v14;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    uint32_t v22 = 32;
LABEL_13:
    _os_log_impl(&dword_21C134000, v20, v21, v19, (uint8_t *)&v25, v22);

LABEL_14:
    goto LABEL_15;
  }
  id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = objc_opt_class();
    char v10 = *(void **)(a1 + 40);
    id v11 = v9;
    uint64_t v12 = [v10 identifier];
    int v25 = 138543874;
    v26 = v9;
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2114;
    id v30 = v12;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Delegate responded with error (identifier: %{public}@, error: %{public}@)", (uint8_t *)&v25, 0x20u);
  }
  if (v5) {
    goto LABEL_9;
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v6 = (void *)MEMORY[0x263F27CB8];
    id v7 = a4;
    id v8 = [v6 sharedConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI purchase succeeded", (uint8_t *)&v12, 0x16u);
    }
    [(AMSUIEngagementViewController *)self _receivedPurchaseResult:v7];
  }
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F27CB8];
  id v12 = a6;
  uint64_t v13 = [v11 sharedConfig];
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  __int16 v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = AMSLogKey();
    int v18 = 138543618;
    uint64_t v19 = v15;
    __int16 v20 = 2114;
    os_log_type_t v21 = v16;
    _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI did resolve", (uint8_t *)&v18, 0x16u);
  }
  if (v10)
  {
    id v17 = 0;
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x263F27C60]);
    [v17 setUserInfo:v9];
  }
  [(AMSUIEngagementViewController *)self resolveWithResult:v17 error:v10];
  (*((void (**)(id, void, void))v12 + 2))(v12, MEMORY[0x263EFFA88], 0);
}

- (void)_dismiss
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIEngagementViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v9 = [(AMSUIEngagementViewController *)self delegate];
    [v9 engagementViewControllerShouldDismiss:self];
  }
  else
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v5)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caller not observing dismissals", buf, 0x16u);
    }
    [(AMSUIEngagementViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_enqueueDisplayEvent
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIEngagementViewController *)self effectiveRequest];
  char v4 = [v3 clientData];
  id v5 = [v4 objectForKeyedSubscript:@"engagementMetrics"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    [(AMSUIEngagementViewController *)self setEngagementMetrics:v6];
  }
  else
  {
    uint64_t v7 = [(AMSUIEngagementViewController *)self effectiveRequest];
    id v8 = [v7 clientData];
    id v9 = [v8 valueForKeyPath:@"engagementItem.meta.metrics.engagementMetrics"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    [(AMSUIEngagementViewController *)self setEngagementMetrics:v10];
  }

  uint64_t v11 = [(AMSUIEngagementViewController *)self engagementMetrics];

  if (v11)
  {
    __int16 v12 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v12)
    {
      __int16 v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v14;
      __int16 v26 = 2114;
      __int16 v27 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing display event.", buf, 0x16u);
    }
    uint64_t v16 = [(AMSUIEngagementViewController *)self engagementMetrics];
    v23[1] = v16;
    id v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:2];

    id v18 = objc_alloc(MEMORY[0x263F27C28]);
    uint64_t v19 = [(AMSUIEngagementViewController *)self bag];
    __int16 v20 = (void *)[v18 initWithBag:v19];
    id v21 = (id)[v20 enqueueData:v17];
  }
}

- (id)_isOriginatingURLTrusted
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  char v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    uint64_t v7 = [(AMSUIEngagementViewController *)self effectiveRequest];
    id v8 = [v7 originatingURL];
    id v9 = [(AMSUIEngagementViewController *)self effectiveRequest];
    id v10 = [v9 URL];
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = v5;
    __int16 v31 = 2114;
    id v32 = v6;
    __int16 v33 = 2114;
    v34 = v8;
    __int16 v35 = 2114;
    __int16 v36 = v10;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking if originating URL %{public}@ is trusted for request %{public}@", buf, 0x2Au);
  }
  uint64_t v11 = [(AMSUIEngagementViewController *)self effectiveRequest];
  uint64_t v12 = [v11 originatingURL];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(AMSUIEngagementViewController *)self effectiveRequest];
    uint64_t v15 = [v14 destinationStyle];

    if (!v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x263F27B58]);
      id v17 = +[AMSUIEngagementTask createBagForSubProfile];
      id v18 = [v17 arrayForKey:@"trustedEngagementReferrers"];
      uint64_t v19 = [v18 valuePromise];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke;
      v27[3] = &unk_2643E3570;
      id v20 = v16;
      id v28 = v20;
      [v19 addErrorBlock:v27];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke_2;
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

void __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  AMSError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

void __57__AMSUIEngagementViewController__isOriginatingURLTrusted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 effectiveRequest];
  id v6 = [v5 originatingURL];
  LODWORD(v3) = [v3 _isURLTrusted:v6 inDomains:v4];

  uint64_t v7 = *(void **)(a1 + 40);
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
  id v2 = [(AMSUIEngagementViewController *)self effectiveRequest];
  uint64_t v3 = [v2 presentationStyle];

  if (v3 == 3) {
    return 1;
  }
  else {
    return 2 * (v3 != 2);
  }
}

- (id)_preloadChildVC
{
  uint64_t v3 = [(AMSUIEngagementViewController *)self loadVCPromise];

  if (!v3)
  {
    id v4 = [(AMSUIEngagementViewController *)self _isOriginatingURLTrusted];
    id v5 = [v4 promiseAdapter];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__AMSUIEngagementViewController__preloadChildVC__block_invoke;
    v9[3] = &unk_2643E3B40;
    v9[4] = self;
    id v6 = [v5 thenWithBlock:v9];
    [(AMSUIEngagementViewController *)self setLoadVCPromise:v6];
  }
  id v7 = [(AMSUIEngagementViewController *)self loadVCPromise];
  return v7;
}

id __48__AMSUIEngagementViewController__preloadChildVC__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) effectiveRequest];
  uint64_t v3 = [v2 loadViewControllerForEngagementController:*(void *)(a1 + 32)];

  return v3;
}

- (void)_receivedCarrierLinkResult:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F27C60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setCarrierLinkResult:v5];

  uint64_t v8 = @"didCarrierLink";
  v9[0] = MEMORY[0x263EFFA88];
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v6 setUserInfo:v7];

  [(AMSUIEngagementViewController *)self resolveWithResult:v6 error:0];
}

- (void)_receivedPurchaseResult:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F27C60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setPurchaseResult:v5];

  uint64_t v8 = @"didPurchase";
  v9[0] = MEMORY[0x263EFFA88];
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v6 setUserInfo:v7];

  [(AMSUIEngagementViewController *)self resolveWithResult:v6 error:0];
}

- (void)resolveWithResult:(id)a3 error:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  uint64_t v8 = (void *)v7;
  if (!(v6 | v7))
  {
    uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v9 = [(id)v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      int v28 = 138543618;
      uint64_t v29 = v10;
      __int16 v30 = 2114;
      __int16 v31 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot resolve without either a result or error", (uint8_t *)&v28, 0x16u);
LABEL_31:

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v6 && v7)
  {
    uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v12)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    BOOL v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      long long v15 = AMSLogKey();
      int v28 = 138543618;
      uint64_t v29 = v14;
      __int16 v30 = 2114;
      __int16 v31 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot resolve with both a result and error. Dropping result.", (uint8_t *)&v28, 0x16u);
    }
    goto LABEL_18;
  }
  if (!v6)
  {
LABEL_18:
    long long v16 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v16)
    {
      long long v16 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    long long v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      id v21 = AMSLogKey();
      int v28 = 138543874;
      uint64_t v29 = v20;
      __int16 v30 = 2114;
      __int16 v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = (uint64_t)v8;
      _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Resolving with an error: %{public}@", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v6 = 0;
    goto LABEL_23;
  }
  long long v16 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v16)
  {
    long long v16 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  long long v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = AMSLogKey();
    int v28 = 138543874;
    uint64_t v29 = v18;
    __int16 v30 = 2114;
    __int16 v31 = v19;
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resolving with a result: %@", (uint8_t *)&v28, 0x20u);
  }
LABEL_23:

  uint64_t v22 = [(AMSUIEngagementViewController *)self delegate];
  char v23 = objc_opt_respondsToSelector();

  uint64_t v24 = [(AMSUIEngagementViewController *)self delegate];
  uint64_t v9 = v24;
  if (v23)
  {
    [v24 engagementViewController:self didFinishWithResult:v6 error:v8];
  }
  else
  {
    char v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v9)
      {
        uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v11 = [v9 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_opt_class();
        __int16 v27 = AMSLogKey();
        int v28 = 138543618;
        uint64_t v29 = v26;
        __int16 v30 = 2114;
        __int16 v31 = v27;
        _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caller not observing resolutions", (uint8_t *)&v28, 0x16u);
      }
      goto LABEL_31;
    }
    uint64_t v9 = [(AMSUIEngagementViewController *)self delegate];
    [v9 engagementViewController:self didResolveWithResult:v6 error:v8];
  }
LABEL_32:
}

- (void)updateEffectiveRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = (AMSEngagementRequest *)a3;
  id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    BOOL v13 = v8;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Effective request updated", (uint8_t *)&v10, 0x16u);
  }
  effectiveRequest = self->_effectiveRequest;
  self->_effectiveRequest = v4;

  [(AMSUIEngagementViewController *)self _enqueueDisplayEvent];
}

- (void)_setup
{
  [(AMSUIEngagementViewController *)self setModalPresentationStyle:[(AMSUIEngagementViewController *)self _modalPresentationStyle]];
  uint64_t v3 = [(AMSUIEngagementViewController *)self effectiveRequest];
  uint64_t v4 = [v3 destinationStyle];

  if (v4 == 1)
  {
    id v5 = [AMSEngagementOfflineBag alloc];
    id v7 = [(AMSUIEngagementViewController *)self bag];
    uint64_t v6 = [(AMSEngagementOfflineBag *)v5 initWithUnderlyingBag:v7];
    [(AMSUIEngagementViewController *)self setBag:v6];
  }
}

- (void)_startEngagement
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AMSUIEngagementViewController *)self effectiveRequest];
  uint64_t v4 = [v3 logKey];
  id v5 = (id)AMSSetLogKey();

  uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    int v10 = [(AMSUIEngagementViewController *)self effectiveRequest];
    uint64_t v11 = [v10 URL];
    __int16 v12 = AMSLogableURL();
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    uint64_t v24 = v12;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting engagement task with URL: %{public}@", buf, 0x20u);
  }
  BOOL v13 = [(AMSUIEngagementViewController *)self _preloadChildVC];
  if (([v13 isFinished] & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke;
    block[3] = &unk_2643E3118;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_initWeak((id *)buf, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_2;
  v16[3] = &unk_2643E3B68;
  objc_copyWeak(&v17, (id *)buf);
  [v13 addErrorBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_6;
  v14[3] = &unk_2643E3B90;
  objc_copyWeak(&v15, (id *)buf);
  [v13 addSuccessBlock:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(AMSUICommonLoadingViewController);
  [v1 _updateChildViewController:v2];
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_3;
  v5[3] = &unk_2643E3598;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained effectiveRequest];
  id v5 = [v4 logKey];
  id v6 = (id)AMSSetLogKey();

  id v7 = [AMSUICommonErrorViewController alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [WeakRetained effectiveRequest];
  int v10 = [v9 logKey];
  uint64_t v11 = [WeakRetained bag];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_4;
  v19[3] = &unk_2643E37D0;
  objc_copyWeak(&v20, v2);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __49__AMSUIEngagementViewController__startEngagement__block_invoke_5;
  id v17 = &unk_2643E37D0;
  objc_copyWeak(&v18, v2);
  __int16 v12 = [(AMSUICommonErrorViewController *)v7 initWithError:v8 logKey:v10 bag:v11 retryAction:v19 cancelAction:&v14];

  BOOL v13 = objc_msgSend(WeakRetained, "engagementMetrics", v14, v15, v16, v17);
  [(AMSUICommonErrorViewController *)v12 setEngagementMetrics:v13];

  [WeakRetained _updateChildViewController:v12];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained childController];
  [WeakRetained unsetChildViewController:v1];

  [WeakRetained setChildController:0];
  [WeakRetained _startEngagement];
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIEngagementViewController__startEngagement__block_invoke_7;
  v5[3] = &unk_2643E3598;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __49__AMSUIEngagementViewController__startEngagement__block_invoke_7(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained effectiveRequest];
  id v4 = [v3 logKey];
  id v5 = (id)AMSSetLogKey();

  id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  [WeakRetained _updateChildViewController:*(void *)(a1 + 32)];
}

- (void)_updateChildViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__AMSUIEngagementViewController__updateChildViewController___block_invoke;
  v6[3] = &unk_2643E34D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __60__AMSUIEngagementViewController__updateChildViewController___block_invoke(uint64_t a1)
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

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSUIEngagementViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIEngagementViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (AMSEngagementRequest)effectiveRequest
{
  return self->_effectiveRequest;
}

- (UIViewController)childController
{
  return self->_childController;
}

- (void)setChildController:(id)a3
{
}

- (NSDictionary)engagementMetrics
{
  return self->_engagementMetrics;
}

- (void)setEngagementMetrics:(id)a3
{
}

- (AMSPromise)loadVCPromise
{
  return self->_loadVCPromise;
}

- (void)setLoadVCPromise:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_loadVCPromise, 0);
  objc_storeStrong((id *)&self->_engagementMetrics, 0);
  objc_storeStrong((id *)&self->_childController, 0);
  objc_storeStrong((id *)&self->_effectiveRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end