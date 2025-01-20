@interface SKStoreProductViewController
+ (id)_defaultIXStoreSheetDictionary;
+ (void)_validateURL:(id)a3 withSheetInfo:(id)a4 completionBlock:(id)a5;
+ (void)getCanLoadURL:(id)a3 completionBlock:(id)a4;
+ (void)getCanLoadURL:(id)a3 withURLBag:(id)a4 completionBlock:(id)a5;
- (BOOL)_isInvalidSubclass;
- (BOOL)_isPeeking;
- (BOOL)askToBuy;
- (BOOL)automaticallyDismisses;
- (BOOL)dismissRemoteViewControllerWithCompletion:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)showsRightBarButton;
- (BOOL)showsStoreButton;
- (NSDictionary)scriptContextDictionary;
- (NSString)additionalBuyParameters;
- (NSString)affiliateIdentifier;
- (NSString)cancelButtonTitle;
- (NSString)clientIdentifier;
- (NSString)hostBundleIdentifier;
- (NSString)promptString;
- (NSString)rightBarButtonTitle;
- (NSString)usageContext;
- (SKStoreProductViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_impressionDictFromImpression:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)delegate;
- (int)_preferredStatusBarVisibility;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)productPageStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addRemoteView;
- (void)_configureForFullScreenPresentationOrThrowException;
- (void)_didFinish;
- (void)_didFinishDismissal;
- (void)_didFinishWithResult:(int64_t)a3;
- (void)_fireLoadBlockBeforeFinishing;
- (void)_forceOrientationBackToSupportedOrientation;
- (void)_isInvalidSubclass;
- (void)_loadDidFinishWithResult:(BOOL)a3 error:(id)a4;
- (void)_presentPageWithRequest:(id)a3 animated:(BOOL)a4;
- (void)_requestRemoteViewController;
- (void)_resetRemoteViewController;
- (void)_setLoadBlock:(id)a3;
- (void)_throwUnsupportedPresentationException;
- (void)_userDidInteractWithProduct:(unint64_t)a3;
- (void)_viewTapped:(id)a3;
- (void)dealloc;
- (void)didChangeAlpha:(double)a3;
- (void)didChangeHidden;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)finishImmediately;
- (void)loadProductWithPageDictionary:(id)a3 completionBlock:(id)a4;
- (void)loadProductWithParameters:(NSDictionary *)parameters completionBlock:(void *)block;
- (void)loadProductWithParameters:(NSDictionary *)parameters impression:(SKAdImpression *)impression completionBlock:(void *)block;
- (void)loadProductWithRequest:(id)a3 completionBlock:(id)a4;
- (void)loadProductWithURL:(id)a3 completionBlock:(id)a4;
- (void)loadView;
- (void)setAdditionalBuyParameters:(id)a3;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAskToBuy:(BOOL)a3;
- (void)setAutomaticallyDismisses:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setHostBundleIdentifier:(id)a3;
- (void)setNoClippingIfNeeded;
- (void)setParentViewController:(id)a3;
- (void)setPresentationStyleIfNeeded;
- (void)setProductPageStyle:(int64_t)a3;
- (void)setPromptString:(id)a3;
- (void)setRightBarButtonTitle:(id)a3;
- (void)setScriptContextDictionary:(id)a3;
- (void)setShowsRightBarButton:(BOOL)a3;
- (void)setShowsStoreButton:(BOOL)a3;
- (void)setUsageContext:(id)a3;
- (void)sk_didBecomeOffScreen:(id)a3;
- (void)sk_didBecomeOnScreen:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SKStoreProductViewController

- (SKStoreProductViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SKStoreProductViewController;
  v4 = [(SKStoreProductViewController *)&v16 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    int v5 = _os_feature_enabled_impl();
    v4->_productPageQFAEnabled = v5;
    if (v5)
    {
      v6 = [[SKProductRemoteViewTask alloc] initWithStoreController:v4];
      remoteViewTask = v4->_remoteViewTask;
      v4->_remoteViewTask = v6;

      v4->_viewWillAppearWasCalled = 0;
    }
    else
    {
      v8 = [[SKInvocationQueueProxy alloc] initWithProtocol:&unk_1F08F1728];
      serviceProxy = v4->_serviceProxy;
      v4->_serviceProxy = (SKUIServiceProductPageViewController *)v8;

      [(SKStoreProductViewController *)v4 _requestRemoteViewController];
      [(SKStoreProductViewController *)v4 setTransitioningDelegate:v4];
    }
    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v11 = [v10 bundleIdentifier];
    bundleID = v4->_bundleID;
    v4->_bundleID = (NSString *)v11;

    [(SKStoreProductViewController *)v4 setShowsStoreButton:1];
    v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if (v14 == 1) {
      [(SKStoreProductViewController *)v4 setModalPresentationStyle:2];
    }
    v4->_viewWasOnScreen = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = (id)[(_UIAsyncInvocation *)self->_cancelRequest invoke];
  [(SKRemoteProductViewController *)self->_remoteViewController setProductViewController:0];
  id v5 = [(_UIRemoteViewController *)self->_remoteViewController disconnect];
  [(SKUIServiceProductPageViewController *)self->_serviceProxy setInvocationTarget:0];
  v6.receiver = self;
  v6.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v6 dealloc];
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (int64_t)modalTransitionStyle
{
  return 12;
}

- (void)loadProductWithParameters:(NSDictionary *)parameters completionBlock:(void *)block
{
  objc_super v6 = parameters;
  id v7 = block;
  v8 = [(NSDictionary *)v6 objectForKeyedSubscript:@"adNetworkNonce"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[(NSDictionary *)v6 mutableCopy];
      v10 = [v8 UUIDString];
      uint64_t v11 = [v10 lowercaseString];
      [v9 setObject:v11 forKeyedSubscript:@"adNetworkNonce"];

      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v9];

      objc_super v6 = (NSDictionary *)v12;
    }
  }
  if (self->_productPageQFAEnabled)
  {
    remoteViewTask = self->_remoteViewTask;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke;
    v16[3] = &unk_1E5FA9B90;
    id v17 = v7;
    [(SKProductRemoteViewTask *)remoteViewTask lookupProductWithParameters:v6 completion:v16];
  }
  else
  {
    if (self->_loadBlock != v7)
    {
      uint64_t v14 = (void *)[v7 copy];
      id loadBlock = self->_loadBlock;
      self->_id loadBlock = v14;
    }
    [(SKUIServiceProductPageViewController *)self->_serviceProxy loadProductWithParameters:v6];
  }
}

void __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (*(void *)(a1 + 32))
  {
    if (v4)
    {
      objc_super v6 = _SKErrorFromNSError(v4);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_2;
      block[3] = &unk_1E5FA9BB8;
      id v7 = *(id *)(a1 + 32);
      id v12 = v6;
      id v13 = v7;
      id v8 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_3;
      v9[3] = &unk_1E5FA9988;
      id v10 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], v9);
      id v8 = v10;
    }
  }
}

uint64_t __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadProductWithParameters:(NSDictionary *)parameters impression:(SKAdImpression *)impression completionBlock:(void *)block
{
  id v8 = parameters;
  v9 = impression;
  id v10 = block;
  uint64_t v11 = [(SKAdImpression *)v9 adImpressionIdentifier];
  if (v11)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__1;
    v24 = __Block_byref_object_dispose__1;
    id v25 = (id)[(NSDictionary *)v8 mutableCopy];
    id v12 = [(SKStoreProductViewController *)self _impressionDictFromImpression:v9];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke;
    v19[3] = &unk_1E5FAA5D0;
    v19[4] = &v20;
    [v12 enumerateKeysAndObjectsUsingBlock:v19];
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v21[5]];

    _Block_object_dispose(&v20, 8);
    id v8 = (NSDictionary *)v13;
  }
  if (self->_productPageQFAEnabled)
  {
    remoteViewTask = self->_remoteViewTask;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_2;
    v17[3] = &unk_1E5FA9B90;
    id v18 = v10;
    [(SKProductRemoteViewTask *)remoteViewTask lookupProductWithParameters:v8 completion:v17];
  }
  else
  {
    if (self->_loadBlock != v10)
    {
      v15 = (void *)[v10 copy];
      id loadBlock = self->_loadBlock;
      self->_id loadBlock = v15;
    }
    [(SKUIServiceProductPageViewController *)self->_serviceProxy loadProductWithParameters:v8];
  }
}

uint64_t __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:a3 forKeyedSubscript:a2];
}

void __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_super v6 = v5;
  if (*(void *)(a1 + 32))
  {
    if (v5)
    {
      id v7 = _SKErrorFromNSError(v5);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_3;
      block[3] = &unk_1E5FA9BB8;
      id v8 = *(id *)(a1 + 32);
      id v14 = v7;
      id v15 = v8;
      id v9 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_4;
      v10[3] = &unk_1E5FAA5F8;
      id v11 = *(id *)(a1 + 32);
      char v12 = a2;
      dispatch_async(MEMORY[0x1E4F14428], v10);
      id v9 = v11;
    }
  }
}

uint64_t __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)loadView
{
  id v8 = objc_alloc_init(SKObservableView);
  [(SKObservableView *)v8 setDelegate:self];
  [(SKObservableView *)v8 setAutoresizingMask:18];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(SKObservableView *)v8 setBackgroundColor:v3];

  [(SKStoreProductViewController *)self setView:v8];
  [(SKStoreProductViewController *)self _addRemoteView];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__viewTapped_];
  id v5 = [(SKStoreProductViewController *)self view];
  [v5 addGestureRecognizer:v4];

  objc_super v6 = [(SKStoreProductViewController *)self view];
  id v7 = [v6 layer];
  [v7 setHitTestsAsOpaque:1];
}

- (void)_viewTapped:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: viewTapped.", (uint8_t *)&v6, 0xCu);
  }
  if (self->_productPageQFAEnabled)
  {
    remoteViewTask = self->_remoteViewTask;
    if (remoteViewTask)
    {
      if ([(SKProductRemoteViewTask *)remoteViewTask extensionControllerState] == 1)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 138543362;
          id v7 = self;
          _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Dismissing view after tap.", (uint8_t *)&v6, 0xCu);
        }
        [(SKStoreProductViewController *)self dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  if (SKAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  [(SKStoreProductViewController *)self _configureForFullScreenPresentationOrThrowException];
  if ([(SKStoreProductViewController *)self _isInvalidSubclass]) {
    [(SKStoreProductViewController *)self _didFinishWithResult:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v5 willMoveToParentViewController:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SKStoreProductViewController *)self presentingViewController];
  if (v5)
  {
    int v6 = (void *)v5;
    int v7 = isMyViewVisible(self);

    if (v7)
    {
      if (self->_productPageQFAEnabled) {
        uint64_t v8 = 1160;
      }
      else {
        uint64_t v8 = 1056;
      }
      id v9 = *(Class *)((char *)&self->super.super.super.isa + v8);
      id v10 = [NSNumber numberWithBool:1];
      [v9 setVisibleInClientWindow:v10];

      self->_viewWasOnScreen = 1;
    }
  }
  if (self->_productPageQFAEnabled)
  {
    remoteViewTask = self->_remoteViewTask;
    char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SKStoreProductViewController _isPeeking](self, "_isPeeking"));
    [(SKProductRemoteViewTask *)remoteViewTask setPreview:v12];

    [(SKProductRemoteViewTask *)self->_remoteViewTask storeProductViewControllerWillAppear];
    self->_viewWillAppearWasCalled = 1;
  }
  else
  {
    serviceProxy = self->_serviceProxy;
    id v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SKStoreProductViewController _isPeeking](self, "_isPeeking"));
    [(SKUIServiceProductPageViewController *)serviceProxy setPreview:v14];
  }
  [(SKStoreProductViewController *)self setPresentationStyleIfNeeded];
  [(SKStoreProductViewController *)self setNoClippingIfNeeded];
  id v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  self->_originalStatusBarStyle = [v15 statusBarStyle];

  objc_super v16 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  if (!v17)
  {
    id v18 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v18 setStatusBarStyle:0 animated:v3];
  }
  [(SKStoreProductViewController *)self _forceOrientationBackToSupportedOrientation];
  v19.receiver = self;
  v19.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v19 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SKStoreProductViewController *)self presentingViewController];

  if (!v5)
  {
    int v6 = [[SKScrollDetector alloc] initWithDelegate:self];
    scrollDetector = self->_scrollDetector;
    self->_scrollDetector = v6;

    uint64_t v8 = self->_scrollDetector;
    id v9 = [(SKStoreProductViewController *)self view];
    [(SKScrollDetector *)v8 findAndListenForScrollingOfView:v9];
  }
  [(SKStoreProductViewController *)self _configureForFullScreenPresentationOrThrowException];
  if (self->_productPageQFAEnabled) {
    [(SKProductRemoteViewTask *)self->_remoteViewTask storeProductViewControllerDidAppear];
  }
  v10.receiver = self;
  v10.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v10 viewDidAppear:v3];
}

- (void)viewWillLayoutSubviews
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[%@] Invalid use of SKStoreProductViewController.", (uint8_t *)&v1, 0xCu);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v5 setStatusBarStyle:self->_originalStatusBarStyle animated:v3];

  if (self->_productPageQFAEnabled) {
    [(SKProductRemoteViewTask *)self->_remoteViewTask storeProductViewControllerWillDisappear];
  }
  v6.receiver = self;
  v6.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v3 viewDidDisappear:a3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: dismissViewControllerAnimated.", buf, 0xCu);
  }
  if (self->_productPageQFAEnabled) {
    [(SKProductRemoteViewTask *)self->_remoteViewTask storeProductViewControllerWillDismiss];
  }
  v6.receiver = self;
  v6.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v6 dismissViewControllerAnimated:1 completion:v5];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (int)_preferredStatusBarVisibility
{
  return 2;
}

+ (void)getCanLoadURL:(id)a3 withURLBag:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void))a5;
  id v11 = [MEMORY[0x1E4F74230] sharedConnection];
  char v12 = [v11 isOnDeviceAppInstallationAllowed];

  if (v12)
  {
    uint64_t v13 = [v8 scheme];
    if ([v13 caseInsensitiveCompare:@"http"]
      && [v13 caseInsensitiveCompare:@"https"])
    {
      v10[2](v10, 0);
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __73__SKStoreProductViewController_getCanLoadURL_withURLBag_completionBlock___block_invoke;
      v14[3] = &unk_1E5FAA620;
      id v17 = a1;
      id v15 = v8;
      objc_super v16 = v10;
      [v9 loadValueForKey:@"ix-store-sheet" completionBlock:v14];
    }
  }
  else
  {
    v10[2](v10, 0);
  }
}

void __73__SKStoreProductViewController_getCanLoadURL_withURLBag_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v5;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 48) _defaultIXStoreSheetDictionary];

    id v3 = (id)v4;
  }
  id v6 = v3;
  [*(id *)(a1 + 48) _validateURL:*(void *)(a1 + 32) withSheetInfo:v3 completionBlock:*(void *)(a1 + 40)];
}

+ (void)getCanLoadURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1E4FA8300];
  id v8 = a3;
  id v9 = [v7 contextWithBagType:0];
  [v9 setAllowsExpiredBags:1];
  [v9 setUsesCachedBagsOnly:1];
  objc_super v10 = (void *)[objc_alloc(MEMORY[0x1E4FA82F8]) initWithURLBagContext:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SKStoreProductViewController_getCanLoadURL_completionBlock___block_invoke;
  v12[3] = &unk_1E5FAA668;
  id v13 = v6;
  id v11 = v6;
  [a1 getCanLoadURL:v8 withURLBag:v10 completionBlock:v12];
}

void __62__SKStoreProductViewController_getCanLoadURL_completionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
  [v2 setAllowsExpiredBags:1];
  int v1 = (void *)[objc_alloc(MEMORY[0x1E4FA82F8]) initWithURLBagContext:v2];
  [v1 loadWithCompletionBlock:&__block_literal_global_6];
}

- (void)finishImmediately
{
  if (self->_productPageQFAEnabled) {
    id v2 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
  }
  else {
    id v2 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v2) finishImmediately];
}

- (void)loadProductWithPageDictionary:(id)a3 completionBlock:(id)a4
{
  if (self->_productPageQFAEnabled)
  {
    [(SKProductRemoteViewTask *)self->_remoteViewTask loadProductWithPageDictionary:a3 completionBlock:a4];
  }
  else
  {
    id v6 = a3;
    [(SKStoreProductViewController *)self _setLoadBlock:a4];
    [(SKUIServiceProductPageViewController *)self->_serviceProxy loadProductWithPageDictionary:v6];
  }
}

- (void)loadProductWithRequest:(id)a3 completionBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!self->_productPageQFAEnabled) {
    [(SKStoreProductViewController *)self _setLoadBlock:v6];
  }
  self->_productPageStyle = [v8 productPageStyle];
  int v7 = (void *)[v8 copyXPCEncoding];
  if (self->_productPageQFAEnabled) {
    [(SKProductRemoteViewTask *)self->_remoteViewTask loadProductWithRequest:v7 completionBlock:v6];
  }
  else {
    [(SKUIServiceProductPageViewController *)self->_serviceProxy loadProductWithRequest:v7];
  }
}

- (void)loadProductWithURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_productPageQFAEnabled
    || ([(SKStoreProductViewController *)self _setLoadBlock:v7], self->_productPageQFAEnabled))
  {
    remoteViewTask = self->_remoteViewTask;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke;
    v9[3] = &unk_1E5FA9B90;
    id v10 = v7;
    [(SKProductRemoteViewTask *)remoteViewTask loadProductWithURL:v6 completionBlock:v9];
  }
  else
  {
    [(SKUIServiceProductPageViewController *)self->_serviceProxy loadProductWithURL:v6];
  }
}

void __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke_2;
    block[3] = &unk_1E5FAA690;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setAdditionalBuyParameters:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (self->_additionalBuyParameters != v4)
  {
    id v8 = v4;
    id v5 = (NSString *)[(NSString *)v4 copy];
    additionalBuyParameters = self->_additionalBuyParameters;
    self->_additionalBuyParameters = v5;

    if (self->_productPageQFAEnabled) {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v7) setAdditionalBuyParameters:v8];
    uint64_t v4 = v8;
  }
}

- (void)setAffiliateIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (self->_affiliateIdentifier != v4)
  {
    id v8 = v4;
    id v5 = (NSString *)[(NSString *)v4 copy];
    affiliateIdentifier = self->_affiliateIdentifier;
    self->_affiliateIdentifier = v5;

    if (self->_productPageQFAEnabled) {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v7) setAffiliateIdentifier:v8];
    uint64_t v4 = v8;
  }
}

- (void)setClientIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (self->_clientIdentifier != v4)
  {
    id v8 = v4;
    id v5 = (NSString *)[(NSString *)v4 copy];
    clientIdentifier = self->_clientIdentifier;
    self->_clientIdentifier = v5;

    if (self->_productPageQFAEnabled) {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v7) setClientIdentifier:v8];
    uint64_t v4 = v8;
  }
}

- (void)setHostBundleIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (self->_hostBundleIdentifier != v4)
  {
    id v8 = v4;
    id v5 = (NSString *)[(NSString *)v4 copy];
    hostBundleIdentifier = self->_hostBundleIdentifier;
    self->_hostBundleIdentifier = v5;

    if (self->_productPageQFAEnabled) {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v7) setHostBundleIdentifier:v8];
    uint64_t v4 = v8;
  }
}

- (void)setCancelButtonTitle:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_cancelButtonTitle != v6)
  {
    objc_storeStrong((id *)&self->_cancelButtonTitle, a3);
    if (self->_productPageQFAEnabled) {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v5) setCancelButtonTitle:v6];
  }
}

- (void)setRightBarButtonTitle:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_rightBarButtonTitle != v6)
  {
    objc_storeStrong((id *)&self->_rightBarButtonTitle, a3);
    if (self->_productPageQFAEnabled) {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v5) setRightBarButtonTitle:v6];
  }
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  if (self->_showsRightBarButton != a3)
  {
    self->_showsRightBarButton = a3;
    if (self->_productPageQFAEnabled)
    {
      remoteViewTask = self->_remoteViewTask;
      -[SKProductRemoteViewTask setShowsRightBarButton:](remoteViewTask, "setShowsRightBarButton:");
    }
    else
    {
      serviceProxy = self->_serviceProxy;
      objc_msgSend(NSNumber, "numberWithBool:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(SKUIServiceProductPageViewController *)serviceProxy setShowsRightBarButton:v5];
    }
  }
}

- (void)setPromptString:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_promptString != v6)
  {
    objc_storeStrong((id *)&self->_promptString, a3);
    if (self->_productPageQFAEnabled) {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v5) setPromptString:v6];
  }
}

- (void)setProductPageStyle:(int64_t)a3
{
  if (self->_productPageStyle != a3)
  {
    self->_productPageStyle = a3;
    if (self->_productPageQFAEnabled) {
      uint64_t v3 = 1160;
    }
    else {
      uint64_t v3 = 1056;
    }
    uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProductPageStyle:");
  }
}

- (void)setShowsStoreButton:(BOOL)a3
{
  if (self->_showsStoreButton != a3)
  {
    self->_showsStoreButton = a3;
    if (self->_productPageQFAEnabled) {
      uint64_t v3 = 1160;
    }
    else {
      uint64_t v3 = 1056;
    }
    uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
    objc_msgSend(NSNumber, "numberWithBool:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsStoreButton:");
  }
}

- (void)setScriptContextDictionary:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  if (self->_scriptContextDictionary != v4)
  {
    id v8 = v4;
    id v5 = (NSDictionary *)[(NSDictionary *)v4 copy];
    scriptContextDictionary = self->_scriptContextDictionary;
    self->_scriptContextDictionary = v5;

    if (self->_productPageQFAEnabled) {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v7) setScriptContextDictionary:v8];
    uint64_t v4 = v8;
  }
}

- (void)setUsageContext:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_usageContext != v6)
  {
    objc_storeStrong((id *)&self->_usageContext, a3);
    if (self->_productPageQFAEnabled) {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    }
    else {
      id v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v5) setUsageContext:v6];
  }
}

- (void)setAskToBuy:(BOOL)a3
{
  if (self->_askToBuy != a3)
  {
    self->_askToBuy = a3;
    if (self->_productPageQFAEnabled)
    {
      remoteViewTask = self->_remoteViewTask;
      -[SKProductRemoteViewTask setAskToBuy:](remoteViewTask, "setAskToBuy:");
    }
    else
    {
      serviceProxy = self->_serviceProxy;
      objc_msgSend(NSNumber, "numberWithBool:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(SKUIServiceProductPageViewController *)serviceProxy setAskToBuy:v5];
    }
  }
}

- (void)_didFinish
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: didFinish.", (uint8_t *)&v6, 0xCu);
  }
  [(SKStoreProductViewController *)self _fireLoadBlockBeforeFinishing];
  [(SKStoreProductViewController *)self dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 productViewControllerDidFinish:self];
  }
}

- (void)_didFinishWithResult:(int64_t)a3
{
  [(SKStoreProductViewController *)self _fireLoadBlockBeforeFinishing];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    [(SKStoreProductViewController *)self dismissViewControllerAnimated:1 completion:0];
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 productViewController:self didFinishWithResult:a3];
  }
  else
  {
    [(SKStoreProductViewController *)self _didFinish];
  }
}

- (void)_didFinishDismissal
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dismissalCompleted = (void (**)(id, SEL))self->_dismissalCompleted;
  if (dismissalCompleted)
  {
    dismissalCompleted[2](dismissalCompleted, a2);
    id v4 = self->_dismissalCompleted;
  }
  else
  {
    id v4 = 0;
  }
  self->_dismissalCompleted = 0;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    char v6 = self;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: dismiss end delay.", (uint8_t *)&v5, 0xCu);
  }
  [(SKStoreProductViewController *)self _endDelayingPresentation];
}

- (void)_loadDidFinishWithResult:(BOOL)a3 error:(id)a4
{
  id loadBlock = (void (**)(id, BOOL, id))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, a3, a4);
    id v6 = self->_loadBlock;
    self->_id loadBlock = 0;
  }
}

- (void)_userDidInteractWithProduct:(unint64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 productViewController:self userDidInteractWithProduct:a3];
  }
}

- (void)_presentPageWithRequest:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 productViewController:self presentProductWithRequest:v9 animated:v4];
  }
}

- (void)_resetRemoteViewController
{
  if ([(SKRemoteProductViewController *)self->_remoteViewController isViewLoaded])
  {
    uint64_t v3 = [(SKRemoteProductViewController *)self->_remoteViewController view];
    [v3 removeFromSuperview];
  }
  id v4 = (id)[(_UIAsyncInvocation *)self->_cancelRequest invoke];
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = 0;

  [(SKUIServiceProductPageViewController *)self->_serviceProxy setInvocationTarget:0];
  [(SKRemoteProductViewController *)self->_remoteViewController setProductViewController:0];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 productViewController:self didFinishWithResult:1];
  }
  else
  {
    [(SKStoreProductViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)_isInvalidSubclass
{
  if ([(SKStoreProductViewController *)self isMemberOfClass:objc_opt_class()]) {
    goto LABEL_2;
  }
  id v4 = [(NSString *)self->_bundleID lowercaseString];
  int v5 = [v4 hasPrefix:@"com.apple."];

  if (v5)
  {
    int has_internal_content = os_variant_has_internal_content();
    if (has_internal_content)
    {
      int has_internal_content = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (has_internal_content)
      {
        -[SKStoreProductViewController _isInvalidSubclass]();
LABEL_2:
        LOBYTE(has_internal_content) = 0;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      -[SKStoreProductViewController _isInvalidSubclass]((uint64_t)self);
    }
    LOBYTE(has_internal_content) = 1;
  }
  return has_internal_content;
}

- (BOOL)_isPeeking
{
  uint64_t v3 = [(SKStoreProductViewController *)self presentationController];
  if ([v3 presentationStyle] == 20)
  {
    char isKindOfClass = 1;
  }
  else
  {
    int v5 = [(SKStoreProductViewController *)self presentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKStoreProductViewController;
  [(SKStoreProductViewController *)&v3 setParentViewController:a3];
}

- (void)setPresentationStyleIfNeeded
{
  objc_super v3 = [(SKStoreProductViewController *)self parentViewController];
  if (v3)
  {
  }
  else if (![(SKStoreProductViewController *)self _isPeeking])
  {
    id v4 = NSNumber;
    if (self->_productPageQFAEnabled) {
      uint64_t v8 = 1160;
    }
    else {
      uint64_t v8 = 1056;
    }
    id v6 = *(Class *)((char *)&self->super.super.super.isa + v8);
    uint64_t v7 = 4294967294;
    goto LABEL_8;
  }
  id v4 = NSNumber;
  if (self->_productPageQFAEnabled) {
    uint64_t v5 = 1160;
  }
  else {
    uint64_t v5 = 1056;
  }
  id v6 = *(Class *)((char *)&self->super.super.super.isa + v5);
  uint64_t v7 = 0;
LABEL_8:
  id v9 = [v4 numberWithInt:v7];
  [v6 setPresentationStyle:v9];
}

- (void)setNoClippingIfNeeded
{
  objc_super v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];
  int v5 = [@"com.apple.Spotlight" isEqualToString:v4];

  id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  remoteViewController = self->_remoteViewController;
  if (remoteViewController) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9 && v7 == 1)
  {
    [(_UIRemoteViewController *)remoteViewController _setViewClipsToBounds:0];
  }
}

- (void)_addRemoteView
{
  if (self->_remoteViewController && [(SKStoreProductViewController *)self isViewLoaded])
  {
    id v5 = [(SKRemoteProductViewController *)self->_remoteViewController view];
    objc_super v3 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v3];

    id v4 = [(SKStoreProductViewController *)self view];
    [v4 addSubview:v5];
    [v4 bounds];
    objc_msgSend(v5, "setFrame:");
    [v5 setAutoresizingMask:18];
  }
}

+ (id)_defaultIXStoreSheetDictionary
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"itunes[.]apple[.]com", @"new[.]itunes[.]com", 0);
  [v2 setObject:v3 forKey:@"host-patterns"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v4 addObject:@"^/([a-z][a-z]/)?(app|app-bundle|album|movie|tv-season)([/?]|$)"];
  [v4 addObject:@"^/redir/.*[&?]mt=[0123456789]+(&|$)"];
  [v2 setObject:v4 forKey:@"path-patterns"];

  return v2;
}

- (void)_fireLoadBlockBeforeFinishing
{
  if (self->_loadBlock && dyld_program_sdk_at_least())
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    [(SKStoreProductViewController *)self _loadDidFinishWithResult:0 error:v3];
  }
}

- (void)_forceOrientationBackToSupportedOrientation
{
  id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ((unint64_t)([v7 statusBarOrientation] - 3) <= 1
    && ([(SKStoreProductViewController *)self supportedInterfaceOrientations] & 0x18) == 0)
  {
    if (![(SKStoreProductViewController *)self isViewLoaded]
      || ([(SKStoreProductViewController *)self view],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v3 window],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      id v5 = [(SKStoreProductViewController *)self presentedViewController];
      id v6 = [v5 view];
      id v4 = [v6 window];

      if (!v4)
      {
        id v4 = [MEMORY[0x1E4FB1F48] keyWindow];
      }
    }
    [v4 _setRotatableViewOrientation:1 duration:1 force:0.0];
  }
}

- (void)_requestRemoteViewController
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SKStoreProductViewController__requestRemoteViewController__block_invoke;
  v8[3] = &unk_1E5FA9B00;
  v8[4] = self;
  [(SKStoreProductViewController *)self _beginDelayingPresentation:v8 cancellationHandler:10.0];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SKStoreProductViewController__requestRemoteViewController__block_invoke_2;
  v5[3] = &unk_1E5FA9B28;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v3 = +[_UIRemoteViewController requestViewController:@"ServiceProductPageViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:v5];
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __60__SKStoreProductViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v2 = SSError();
  [v1 _loadDidFinishWithResult:0 error:v2];

  return 0;
}

void __60__SKStoreProductViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v9 = WeakRetained;
  if (v6)
  {
    id v10 = (id *)(WeakRetained + 1048);
    objc_storeStrong((id *)WeakRetained + 131, a2);
    [*v10 setProductViewController:v9];
    id v11 = (void *)v9[132];
    char v12 = [*v10 serviceViewControllerProxy];
    [v11 setInvocationTarget:v12];

    [v9 setPresentationStyleIfNeeded];
    [v9 setNoClippingIfNeeded];
    [v9 addChildViewController:*v10];
    [v9 _addRemoteView];
  }
  else
  {
    NSLog(&cfstr_CouldNotReques.isa, v7);
    id v13 = SSError();
    [v9 _loadDidFinishWithResult:0 error:v13];

    v15.receiver = *(id *)(a1 + 32);
    v15.super_class = (Class)SKStoreProductViewController;
    objc_msgSendSuper2(&v15, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  id v14 = (void *)v9[125];
  v9[125] = 0;

  [v9 _endDelayingPresentation];
}

- (void)_setLoadBlock:(id)a3
{
  if (self->_loadBlock != a3)
  {
    id v4 = (void *)[a3 copy];
    id loadBlock = self->_loadBlock;
    self->_id loadBlock = v4;
    MEMORY[0x1F41817F8](v4, loadBlock);
  }
}

- (void)_configureForFullScreenPresentationOrThrowException
{
  id v3 = [(SKStoreProductViewController *)self presentingViewController];

  if (!v3)
  {
    if (dyld_program_sdk_at_least()) {
      [(SKStoreProductViewController *)self _throwUnsupportedPresentationException];
    }
    [(SKStoreProductViewController *)self setPresentationStyleIfNeeded];
  }
}

- (void)_throwUnsupportedPresentationException
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 raise:@"SKUnsupportedPresentationException", @"%@ must be used in a modal view controller", v4 format];
}

+ (void)_validateURL:(id)a3 withSheetInfo:(id)a4 completionBlock:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, uint64_t))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v8 objectForKey:@"host-patterns"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v7 host];
        if (v11)
        {
          id v38 = v8;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v12 = v10;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v45;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v45 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:*(void *)(*((void *)&v44 + 1) + 8 * i) options:1 error:0];
                uint64_t v18 = objc_msgSend(v17, "rangeOfFirstMatchInString:options:range:", v11, 0, 0, objc_msgSend((id)v11, "length"));

                if (v18 != 0x7FFFFFFFFFFFFFFFLL)
                {

                  id v8 = v38;
                  goto LABEL_17;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = 0;
          id v8 = v38;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
LABEL_17:
      objc_super v19 = [v8 objectForKey:@"path-patterns"];
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F28E78];
          v21 = [v7 path];
          uint64_t v22 = [v20 stringWithString:v21];

          if (v22)
          {
            v23 = [v7 parameterString];

            if (v23)
            {
              v24 = [v7 parameterString];
              [v22 appendFormat:@";%@", v24];
            }
            id v25 = [v7 query];

            if (v25)
            {
              v26 = [v7 query];
              [v22 appendFormat:@"?%@", v26];
            }
            v27 = [v7 fragment];

            if (v27)
            {
              v28 = [v7 fragment];
              [v22 appendFormat:@"#%@", v28];
            }
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            v36 = v19;
            id obj = v19;
            uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              v37 = v10;
              uint64_t v31 = *(void *)v41;
LABEL_28:
              uint64_t v32 = 0;
              while (1)
              {
                if (*(void *)v41 != v31) {
                  objc_enumerationMutation(obj);
                }
                int v33 = 1;
                v34 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:*(void *)(*((void *)&v40 + 1) + 8 * v32) options:1 error:0];
                uint64_t v35 = objc_msgSend(v34, "rangeOfFirstMatchInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length"));

                if (v35 != 0x7FFFFFFFFFFFFFFFLL) {
                  break;
                }
                if (v30 == ++v32)
                {
                  uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
                  if (v30) {
                    goto LABEL_28;
                  }
                  int v33 = 0;
                  break;
                }
              }
              id v10 = v37;
            }
            else
            {
              int v33 = 0;
            }

            objc_super v19 = v36;
          }
          else
          {
            int v33 = 0;
          }
        }
        else
        {
          int v33 = 0;
        }
      }
      else
      {
        int v33 = 1;
      }

      uint64_t v11 = v33 != 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v9[2](v9, v11);
}

- (id)_impressionDictFromImpression:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 advertisedAppStoreItemIdentifier];
  [v4 setObject:v5 forKeyedSubscript:@"id"];

  id v6 = [v3 signature];
  [v4 setObject:v6 forKeyedSubscript:@"adNetworkAttributionSignature"];

  id v7 = [v3 adCampaignIdentifier];
  [v4 setObject:v7 forKeyedSubscript:@"adNetworkCampaignId"];

  id v8 = [v3 sourceIdentifier];
  [v4 setObject:v8 forKeyedSubscript:@"sourceIdentifier"];

  BOOL v9 = [v3 adNetworkIdentifier];
  [v4 setObject:v9 forKeyedSubscript:@"adNetworkId"];

  id v10 = [v3 adImpressionIdentifier];
  uint64_t v11 = [v10 lowercaseString];
  [v4 setObject:v11 forKeyedSubscript:@"adNetworkNonce"];

  id v12 = [v3 timestamp];
  [v4 setObject:v12 forKeyedSubscript:@"adNetworkImpressionTimestamp"];

  uint64_t v13 = [v3 version];
  [v4 setObject:v13 forKeyedSubscript:@"adNetworkPayloadVersion"];

  uint64_t v14 = [v3 sourceAppStoreItemIdentifier];

  [v4 setObject:v14 forKeyedSubscript:@"adNetworkSourceAppStoreIdentifier"];

  return v4;
}

- (void)sk_didBecomeOnScreen:(id)a3
{
  if (self->_productPageQFAEnabled) {
    uint64_t v3 = 1160;
  }
  else {
    uint64_t v3 = 1056;
  }
  id v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
  id v5 = [NSNumber numberWithBool:1];
  objc_msgSend(v4, "setVisibleInClientWindow:");
}

- (void)sk_didBecomeOffScreen:(id)a3
{
  if (self->_productPageQFAEnabled) {
    uint64_t v3 = 1160;
  }
  else {
    uint64_t v3 = 1056;
  }
  id v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
  id v5 = [NSNumber numberWithBool:0];
  objc_msgSend(v4, "setVisibleInClientWindow:");
}

- (id)animationControllerForDismissedController:(id)a3
{
  uint64_t v3 = [[SKRemoteDismissingTransition alloc] initWithViewController:self];

  return v3;
}

- (BOOL)dismissRemoteViewControllerWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SKUIServiceProductPageViewController *)self->_serviceProxy invocationTarget];

  BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: dismiss begin delay.", (uint8_t *)&v10, 0xCu);
    }
    [(SKStoreProductViewController *)self _beginDelayingPresentation:0 cancellationHandler:5.0];
    id v7 = _Block_copy(v4);
    id dismissalCompleted = self->_dismissalCompleted;
    self->_id dismissalCompleted = v7;

    [(SKUIServiceProductPageViewController *)self->_serviceProxy dismissViewControllerAnimated:MEMORY[0x1E4F1CC38]];
  }
  else if (v6)
  {
    int v10 = 138543362;
    uint64_t v11 = self;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: no invocation target.", (uint8_t *)&v10, 0xCu);
  }

  return v5 != 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSString)additionalBuyParameters
{
  return self->_additionalBuyParameters;
}

- (NSString)affiliateIdentifier
{
  return self->_affiliateIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (NSDictionary)scriptContextDictionary
{
  return self->_scriptContextDictionary;
}

- (int64_t)productPageStyle
{
  return self->_productPageStyle;
}

- (NSString)usageContext
{
  return self->_usageContext;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSString)rightBarButtonTitle
{
  return self->_rightBarButtonTitle;
}

- (BOOL)showsRightBarButton
{
  return self->_showsRightBarButton;
}

- (NSString)promptString
{
  return self->_promptString;
}

- (BOOL)automaticallyDismisses
{
  return self->_automaticallyDismisses;
}

- (void)setAutomaticallyDismisses:(BOOL)a3
{
  self->_automaticallyDismisses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageContext, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewTask, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_dismissalCompleted, 0);
  objc_storeStrong((id *)&self->_scrollDetector, 0);
  objc_storeStrong((id *)&self->_promptString, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_scriptContextDictionary, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);

  objc_storeStrong((id *)&self->_additionalBuyParameters, 0);
}

- (void)didChangeAlpha:(double)a3
{
  BOOL v3 = a3 > 0.300000012;
  if (self->_viewWasOnScreen != v3)
  {
    if (self->_productPageQFAEnabled) {
      uint64_t v5 = 1160;
    }
    else {
      uint64_t v5 = 1056;
    }
    BOOL v6 = *(Class *)((char *)&self->super.super.super.isa + v5);
    id v7 = [NSNumber numberWithBool:a3 > 0.300000012];
    [v6 setVisibleInClientWindow:v7];

    self->_viewWasOnScreen = v3;
  }
}

- (void)didChangeHidden
{
  BOOL v3 = [(SKStoreProductViewController *)self view];
  uint64_t v4 = [v3 isHidden] ^ 1;

  if (self->_viewWasOnScreen != v4)
  {
    if (self->_productPageQFAEnabled) {
      uint64_t v5 = 1160;
    }
    else {
      uint64_t v5 = 1056;
    }
    BOOL v6 = *(Class *)((char *)&self->super.super.super.isa + v5);
    id v7 = [NSNumber numberWithBool:v4];
    [v6 setVisibleInClientWindow:v7];

    self->_viewWasOnScreen = v4;
  }
}

- (void)_isInvalidSubclass
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[%@] Subclassing SKStoreProductViewController is not supported.", (uint8_t *)&v1, 0xCu);
}

@end