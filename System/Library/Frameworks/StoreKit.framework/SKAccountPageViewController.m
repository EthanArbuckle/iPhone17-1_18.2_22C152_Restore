@interface SKAccountPageViewController
+ (void)isCommerceUIURL:(id)a3 completion:(id)a4;
- (ACAccount)account;
- (AMSMutableBinaryPromise)connectionSetupPromise;
- (AMSUIWebViewController)webViewController;
- (BOOL)_isBridgedNavigationViewController;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)showAccountGlyph;
- (NSString)referrer;
- (SKAccountPageViewController)initWithAccountURL:(id)a3;
- (SKAccountPageViewController)initWithAccountURL:(id)a3 forceLegacy:(BOOL)a4;
- (SKAccountPageViewController)preWarmedViewController;
- (SKAccountPageViewController)presentingAccountPageViewController;
- (SKAccountPageViewControllerDelegate)delegate;
- (id)_URLForBagKey:(id)a3;
- (id)_overrideScheme:(id)a3;
- (id)_redeemURLFromRedeemConfigURL:(id)a3;
- (int64_t)type;
- (unint64_t)_indexForFirstBridgedNavigationViewController;
- (void)_addRemoteView;
- (void)_beginURLParsing:(id)a3 forceLegacy:(BOOL)a4;
- (void)_bridgedRightButtonPressed:(id)a3;
- (void)_didFinishLoading;
- (void)_didPrepareWithResult:(BOOL)a3 error:(id)a4;
- (void)_dismissBridgedViewController;
- (void)_dismissViewControllerWithResult:(BOOL)a3 error:(id)a4;
- (void)_financeInterruptionResolved:(BOOL)a3;
- (void)_handleLegacyViewWillAppear;
- (void)_keyboardDidChangeNotification:(id)a3;
- (void)_keyboardWillChangeNotification:(id)a3;
- (void)_overrideCreditCardPresentationWithCompletion:(id)a3;
- (void)_overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4;
- (void)_overrideRedeemCameraWithCompletion:(id)a3;
- (void)_popAllBridgedNavigationViewControllers;
- (void)_popBridgedViewControllersToIndex:(unint64_t)a3;
- (void)_presentBridgedViewController;
- (void)_pushBridgedViewControllerAnimated:(BOOL)a3 options:(id)a4;
- (void)_requestRemoteViewController;
- (void)_setBridgedNavigationItemWithOptions:(id)a3;
- (void)_setupLegacyContainer;
- (void)_setupNavigationItem;
- (void)_setupNotificationCenter;
- (void)_setupPreWarmedViewController;
- (void)_setupRemoteViewController:(BOOL)a3;
- (void)_setupWebViewController;
- (void)_sk_applicationDidEnterBackground:(id)a3;
- (void)_sk_applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)loadWithCompletionBlock:(id)a3;
- (void)overrideRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5;
- (void)prepareWithCompletionBlock:(id)a3;
- (void)redeemCameraViewController:(id)a3 didFinishWithRedeem:(id)a4;
- (void)setAccount:(id)a3;
- (void)setConnectionSetupPromise:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreWarmedViewController:(id)a3;
- (void)setPresentingAccountPageViewController:(id)a3;
- (void)setReferrer:(id)a3;
- (void)setShowAccountGlyph:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setWebViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SKAccountPageViewController

+ (void)isCommerceUIURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F4DE50];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = +[SKAccountPageBagProvider sharedBag];
  v10 = (void *)[v8 initWithBag:v9];

  v11 = [v10 isCommerceUIURL:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__SKAccountPageViewController_isCommerceUIURL_completion___block_invoke;
  v13[3] = &unk_1E5FA9B90;
  id v14 = v5;
  id v12 = v5;
  [v11 addFinishBlock:v13];
}

uint64_t __58__SKAccountPageViewController_isCommerceUIURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v9 = v5;
  if (v5)
  {
    NSLog(&cfstr_ErrorParsingTh.isa, v5);
    id v6 = v9;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    id v6 = v9;
  }

  return MEMORY[0x1F41817F8](v7, v6);
}

- (SKAccountPageViewController)initWithAccountURL:(id)a3
{
  return [(SKAccountPageViewController *)self initWithAccountURL:a3 forceLegacy:0];
}

- (SKAccountPageViewController)initWithAccountURL:(id)a3 forceLegacy:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SKAccountPageViewController;
  id v8 = [(SKAccountPageViewController *)&v16 init];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v9 bundleIdentifier];
    v11 = v10;
    if (!v10)
    {
      v4 = [MEMORY[0x1E4F28F80] processInfo];
      v11 = [v4 processName];
    }
    objc_storeStrong((id *)&v8->_referrer, v11);
    if (!v10)
    {
    }
    id v12 = (AMSMutableBinaryPromise *)objc_alloc_init(MEMORY[0x1E4F4DDA0]);
    connectionSetupPromise = v8->_connectionSetupPromise;
    v8->_connectionSetupPromise = v12;

    id v14 = [(SKAccountPageViewController *)v8 _overrideScheme:v7];
    [(SKAccountPageViewController *)v8 _beginURLParsing:v14 forceLegacy:v5];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = (id)[(_UIAsyncInvocation *)self->_cancelRequest invoke];
  [(SKRemoteAccountPageViewController *)self->_remoteViewController setAccountPageViewController:0];
  id v5 = [(SKRemoteAccountPageViewController *)self->_remoteViewController disconnect];
  [(SKUIServiceAccountPageViewController *)self->_serviceProxy setInvocationTarget:0];
  v6.receiver = self;
  v6.super_class = (Class)SKAccountPageViewController;
  [(SKAccountPageViewController *)&v6 dealloc];
}

- (void)loadWithCompletionBlock:(id)a3
{
  if (self->_loadBlock)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Double load"];
  }
  else
  {
    id v4 = (void *)[a3 copy];
    id loadBlock = self->_loadBlock;
    self->_id loadBlock = v4;
  }
  self->_isLoading = 1;
  [(SKAccountPageViewController *)self beginAppearanceTransition:1 animated:0];
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SKAccountPageViewController_loadWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5FA9A08;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __55__SKAccountPageViewController_loadWithCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishLoading];
}

- (void)prepareWithCompletionBlock:(id)a3
{
  if (self->_prepareBlock)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    [v3 raise:v4 format:@"Double prepare"];
  }
  else
  {
    dispatch_time_t v6 = (void *)[a3 copy];
    id prepareBlock = self->_prepareBlock;
    self->_id prepareBlock = v6;
    MEMORY[0x1F41817F8](v6, prepareBlock);
  }
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v3];

  [(SKAccountPageViewController *)self setView:v4];
  [(SKAccountPageViewController *)self _addRemoteView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SKAccountPageViewController;
  [(SKAccountPageViewController *)&v3 viewDidLoad];
  [(SKAccountPageViewController *)self _setupNavigationItem];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SKAccountPageViewController;
  [(SKAccountPageViewController *)&v5 viewDidLayoutSubviews];
  serviceProxy = self->_serviceProxy;
  id v4 = [(SKAccountPageViewController *)self view];
  [v4 bounds];
  -[SKUIServiceAccountPageViewController setPresentationBounds:](serviceProxy, "setPresentationBounds:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKAccountPageViewController;
  [(SKAccountPageViewController *)&v4 viewWillAppear:a3];
  if (!self->_viewHasAppeared)
  {
    if (self->_remoteViewController) {
      [(SKAccountPageViewController *)self _handleLegacyViewWillAppear];
    }
    self->_viewHasAppeared = 1;
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKAccountPageViewController;
  [(SKAccountPageViewController *)&v6 willMoveToParentViewController:v4];
  if (!self->_isRemoteViewControllerReady)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__SKAccountPageViewController_willMoveToParentViewController___block_invoke;
    v5[3] = &unk_1E5FA9B00;
    v5[4] = self;
    [v4 _beginDelayingPresentation:v5 cancellationHandler:10.0];
  }
}

uint64_t __62__SKAccountPageViewController_willMoveToParentViewController___block_invoke(uint64_t a1)
{
  return 0;
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  if (!a3)
  {
    objc_super v5 = [(SKAccountPageViewController *)self presentingAccountPageViewController];
    if (v5)
    {
    }
    else if (!self->_financeInterruptionCalled)
    {
      [(SKAccountPageViewController *)self _financeInterruptionResolved:0];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKAccountPageViewController;
  [(SKAccountPageViewController *)&v5 viewDidAppear:a3];
  id v4 = [(SKAccountPageViewController *)self navigationController];

  if (v4) {
    [(SKAccountPageViewController *)self _setupPreWarmedViewController];
  }
}

- (void)_handleLegacyViewWillAppear
{
  [(SKAccountPageViewController *)self _setupRemoteViewController:0];
  if (!self->_cameraDidShow)
  {
    serviceProxy = self->_serviceProxy;
    id v4 = self->_accountURL;
    [(SKUIServiceAccountPageViewController *)serviceProxy setShowAccountGlyph:[(SKAccountPageViewController *)self showAccountGlyph]];
    [(SKUIServiceAccountPageViewController *)self->_serviceProxy loadWithURL:v4];
  }
  self->_cameraDidShow = 0;
}

- (void)_setupNotificationCenter
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__sk_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
  [v3 addObserver:self selector:sel__sk_applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
  [v3 addObserver:self selector:sel__keyboardDidChangeNotification_ name:*MEMORY[0x1E4FB2BB8] object:0];
  [v3 addObserver:self selector:sel__keyboardWillChangeNotification_ name:*MEMORY[0x1E4FB2C48] object:0];
}

- (void)_sk_applicationWillEnterForeground:(id)a3
{
  if ([(SKAccountPageViewController *)self isViewLoaded])
  {
    id v4 = [(SKAccountPageViewController *)self view];
    objc_super v5 = [v4 window];

    if (v5)
    {
      serviceProxy = self->_serviceProxy;
      [(SKUIServiceAccountPageViewController *)serviceProxy applicationWillEnterForeground];
    }
  }
}

- (void)_sk_applicationDidEnterBackground:(id)a3
{
}

- (void)_keyboardDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  objc_super v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [v4 userInfo];
  objc_super v16 = [v15 valueForKey:*MEMORY[0x1E4FB2BA0]];
  uint64_t v17 = (int)[v16 intValue];

  v18 = [v4 userInfo];

  v19 = [v18 valueForKey:*MEMORY[0x1E4FB2BA8]];
  [v19 floatValue];
  double v21 = v20;

  v22 = [(SKAccountPageViewController *)self view];
  v23 = [MEMORY[0x1E4FB1438] sharedApplication];
  v24 = [v23 keyWindow];
  objc_msgSend(v22, "convertRect:fromView:", v24, v8, v10, v12, v14);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  serviceProxy = self->_serviceProxy;

  -[SKUIServiceAccountPageViewController keyboardDidChangeFrame:animationCurve:duration:](serviceProxy, "keyboardDidChangeFrame:animationCurve:duration:", v17, v26, v28, v30, v32, v21);
}

- (void)_keyboardWillChangeNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  objc_super v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [v4 userInfo];
  objc_super v16 = [v15 valueForKey:*MEMORY[0x1E4FB2BA0]];
  uint64_t v17 = (int)[v16 intValue];

  v18 = [v4 userInfo];

  v19 = [v18 valueForKey:*MEMORY[0x1E4FB2BA8]];
  [v19 floatValue];
  double v21 = v20;

  v22 = [(SKAccountPageViewController *)self view];
  v23 = [MEMORY[0x1E4FB1438] sharedApplication];
  v24 = [v23 keyWindow];
  objc_msgSend(v22, "convertRect:fromView:", v24, v8, v10, v12, v14);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  serviceProxy = self->_serviceProxy;

  -[SKUIServiceAccountPageViewController keyboardWillChangeFrame:animationCurve:duration:](serviceProxy, "keyboardWillChangeFrame:animationCurve:duration:", v17, v26, v28, v30, v32, v21);
}

- (void)_didPrepareWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v9 = v6;
  if (v4)
  {
    [(SKAccountPageViewController *)self _addRemoteView];
    if (self->_viewHasAppeared) {
      [(SKAccountPageViewController *)self _handleLegacyViewWillAppear];
    }
  }
  id prepareBlock = (void (**)(id, BOOL, void))self->_prepareBlock;
  if (prepareBlock)
  {
    ((void (**)(id, BOOL, id))prepareBlock)[2](prepareBlock, v4, v9);
    id v8 = self->_prepareBlock;
    self->_id prepareBlock = 0;
  }

  MEMORY[0x1F4181820]();
}

- (void)_didFinishLoading
{
  id loadBlock = (void (**)(id, SEL))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, a2);
    id v4 = self->_loadBlock;
    self->_id loadBlock = 0;

    self->_isLoading = 0;
    [(SKAccountPageViewController *)self _addRemoteView];
    [(SKAccountPageViewController *)self endAppearanceTransition];
  }
}

- (void)_dismissViewControllerWithResult:(BOOL)a3 error:(id)a4
{
  if (self->_prepareBlock)
  {
    [(SKAccountPageViewController *)self _didPrepareWithResult:0 error:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 accountPageViewControllerDidFinish:self];
    }
    else if ([(SKAccountPageViewController *)self _isBridgedNavigationViewController])
    {
      [(SKAccountPageViewController *)self _popAllBridgedNavigationViewControllers];
    }
    else
    {
      [(SKAccountPageViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_financeInterruptionResolved:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SKAccountPageViewController *)self presentingAccountPageViewController];

    if (v8)
    {
      id v9 = [(SKAccountPageViewController *)self presentingAccountPageViewController];
      [v9 _financeInterruptionResolved:v3];
    }
    else
    {
      self->_financeInterruptionCalled = 1;
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 accountPageViewController:self financeInterruptionResolved:v3];
    }
  }
}

- (void)_overrideCreditCardPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SKAccountPageViewController__overrideCreditCardPresentationWithCompletion___block_invoke;
  v6[3] = &unk_1E5FA9BB8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __77__SKAccountPageViewController__overrideCreditCardPresentationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getSUCreditCardReaderViewControllerClass_softClass;
  uint64_t v10 = getSUCreditCardReaderViewControllerClass_softClass;
  if (!getSUCreditCardReaderViewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getSUCreditCardReaderViewControllerClass_block_invoke;
    v6[3] = &unk_1E5FA9A30;
    v6[4] = &v7;
    __getSUCreditCardReaderViewControllerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  BOOL v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init(v3);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [v4 setCompletionBlock:*(void *)(a1 + 40)];
  [v5 setModalPresentationStyle:0];
  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 1034) = 1;
}

- (void)_overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke;
  block[3] = &unk_1E5FA9C08;
  id v9 = v6;
  int64_t v10 = a3;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1
    && (id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1008)), v2, !v2))
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v4 = (void *)getSURedeemCameraViewControllerClass_softClass;
    uint64_t v15 = getSURedeemCameraViewControllerClass_softClass;
    if (!getSURedeemCameraViewControllerClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getSURedeemCameraViewControllerClass_block_invoke;
      location[3] = &unk_1E5FA9A30;
      location[4] = &v12;
      __getSURedeemCameraViewControllerClass_block_invoke((uint64_t)location);
      id v4 = (void *)v13[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v12, 8);
    id v6 = objc_alloc_init(v5);
    objc_initWeak(location, *(id *)(a1 + 32));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke_2;
    v9[3] = &unk_1E5FA9BE0;
    objc_copyWeak(&v10, location);
    [v6 setCodeHandler:v9];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
    [v7 setModalPresentationStyle:0];
    [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 1008), v6);
    *(unsigned char *)(*(void *)(a1 + 32) + 1034) = 1;

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1008));

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1008));
      [v8 performAction:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
    }
  }
}

void __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[128] redeemCameraCodeDetected:v5];
  }
}

- (void)_overrideRedeemCameraWithCompletion:(id)a3
{
  id v4 = (void *)[a3 copy];
  id redeemCompletionHandler = self->redeemCompletionHandler;
  self->id redeemCompletionHandler = v4;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SKAccountPageViewController__overrideRedeemCameraWithCompletion___block_invoke;
  block[3] = &unk_1E5FA9A08;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__SKAccountPageViewController__overrideRedeemCameraWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  BOOL v3 = (void *)getSKUIClientContextClass_softClass;
  uint64_t v20 = getSKUIClientContextClass_softClass;
  if (!getSKUIClientContextClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getSKUIClientContextClass_block_invoke;
    uint64_t v15 = &unk_1E5FA9A30;
    objc_super v16 = &v17;
    __getSKUIClientContextClass_block_invoke((uint64_t)&v12);
    BOOL v3 = (void *)v18[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v17, 8);
  id v5 = [v4 defaultContext];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v6 = (void *)getSKUIRedeemConfigurationClass_softClass;
  uint64_t v20 = getSKUIRedeemConfigurationClass_softClass;
  if (!getSKUIRedeemConfigurationClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getSKUIRedeemConfigurationClass_block_invoke;
    uint64_t v15 = &unk_1E5FA9A30;
    objc_super v16 = &v17;
    __getSKUIRedeemConfigurationClass_block_invoke((uint64_t)&v12);
    id v6 = (void *)v18[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v17, 8);
  id v8 = (void *)[[v7 alloc] initWithOperationQueue:v2 category:0 clientContext:v5];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v9 = (void *)getSKUIRedeemViewControllerClass_softClass;
  uint64_t v20 = getSKUIRedeemViewControllerClass_softClass;
  if (!getSKUIRedeemViewControllerClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getSKUIRedeemViewControllerClass_block_invoke;
    uint64_t v15 = &unk_1E5FA9A30;
    objc_super v16 = &v17;
    __getSKUIRedeemViewControllerClass_block_invoke((uint64_t)&v12);
    id v9 = (void *)v18[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v17, 8);
  double v11 = (void *)[[v10 alloc] initWithRedeemCategory:0];
  [v11 setModalPresentationStyle:0];
  [v11 setClientContext:v5];
  [v11 setOperationQueue:v2];
  [v11 setCameraRedeemVisible:1];
  [v11 setCameraDelegate:*(void *)(a1 + 32)];
  [v11 setRedeemConfiguration:v8];
  [v11 setShouldPerformInitialOperationOnAppear:0];
  [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 1034) = 1;
}

- (void)_setBridgedNavigationItemWithOptions:(id)a3
{
  id v25 = a3;
  id v4 = [v25 objectForKeyedSubscript:@"ServiceNavigationItemOptionBackButtonTitle"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v25;
  if (isKindOfClass)
  {
    id v7 = [(SKAccountPageViewController *)self navigationItem];
    id v8 = [v7 backBarButtonItem];

    if (v8)
    {
      [v8 setTitle:v4];
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
      [v9 setTitle:v4];
      id v10 = [(SKAccountPageViewController *)self navigationItem];
      [v10 setBackBarButtonItem:v9];
    }
    id v6 = v25;
  }
  double v11 = [v6 objectForKeyedSubscript:@"ServiceNavigationItemOptionBackButtonHidden"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v11 BOOLValue];
    uint64_t v13 = [(SKAccountPageViewController *)self navigationItem];
    [v13 setHidesBackButton:v12 animated:1];
  }
  uint64_t v14 = [v25 objectForKeyedSubscript:@"ServiceNavigationItemOptionRightButtonTitle"];
  uint64_t v15 = [v25 objectForKeyedSubscript:@"ServiceNavigationItemOptionRightButtonStyle"];
  objc_super v16 = [v25 objectForKeyedSubscript:@"ServiceNavigationItemOptionRightButtonEnabled"];
  uint64_t v17 = [v16 BOOLValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v15 integerValue];
      uint64_t v19 = [(SKAccountPageViewController *)self navigationItem];
      uint64_t v20 = [v19 rightBarButtonItem];

      if (v20)
      {
        [v20 setTitle:v14];
        [v20 setStyle:v18];
        [v20 setEnabled:v17];
      }
      else
      {
        double v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v14 style:v18 target:self action:sel__bridgedRightButtonPressed_];
        [v21 setEnabled:v17];
        v22 = [(SKAccountPageViewController *)self navigationItem];
        [v22 setRightBarButtonItem:v21];
      }
    }
  }
  v23 = [v25 objectForKeyedSubscript:@"ServiceNavigationItemOptionTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [(SKAccountPageViewController *)self navigationItem];
    [v24 setTitle:v23];
  }
}

- (void)_pushBridgedViewControllerAnimated:(BOOL)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [(SKAccountPageViewController *)self preWarmedViewController];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [[SKAccountPageViewController alloc] initWithAccountURL:0 forceLegacy:1];
  }
  id v10 = v9;

  objc_initWeak(&location, v10);
  double v11 = [(SKAccountPageViewController *)v10 connectionSetupPromise];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SKAccountPageViewController__pushBridgedViewControllerAnimated_options___block_invoke;
  v13[3] = &unk_1E5FA9C30;
  objc_copyWeak(&v15, &location);
  void v13[4] = self;
  id v12 = v6;
  id v14 = v12;
  BOOL v16 = a3;
  [v11 addFinishBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__SKAccountPageViewController__pushBridgedViewControllerAnimated_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) account];
  [WeakRetained setAccount:v2];

  BOOL v3 = [*(id *)(a1 + 32) delegate];
  [WeakRetained setDelegate:v3];

  [WeakRetained setPresentingAccountPageViewController:*(void *)(a1 + 32)];
  [WeakRetained setType:1];
  [WeakRetained _setupRemoteViewController:1];
  [WeakRetained _setBridgedNavigationItemWithOptions:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) navigationController];
  [v4 pushViewController:WeakRetained animated:*(unsigned __int8 *)(a1 + 56)];

  [*(id *)(a1 + 32) setPreWarmedViewController:0];
}

- (void)_popBridgedViewControllersToIndex:(unint64_t)a3
{
  if (a3 == -1)
  {
    [(SKAccountPageViewController *)self _popAllBridgedNavigationViewControllers];
  }
  else
  {
    unint64_t v4 = [(SKAccountPageViewController *)self _indexForFirstBridgedNavigationViewController]+ a3;
    id v5 = [(SKAccountPageViewController *)self navigationController];
    id v6 = [v5 viewControllers];
    unint64_t v7 = [v6 count];

    if (v7 > v4)
    {
      id v8 = [(SKAccountPageViewController *)self navigationController];
      id v9 = [v8 viewControllers];
      id v12 = [v9 objectAtIndex:v4];

      id v10 = [(SKAccountPageViewController *)self navigationController];
      id v11 = (id)[v10 popToViewController:v12 animated:1];
    }
  }
}

- (void)_presentBridgedViewController
{
  BOOL v3 = [(SKAccountPageViewController *)self preWarmedViewController];
  unint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = [[SKAccountPageViewController alloc] initWithAccountURL:0 forceLegacy:1];
  }
  id v6 = v5;

  objc_initWeak(&location, v6);
  unint64_t v7 = [(SKAccountPageViewController *)v6 connectionSetupPromise];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SKAccountPageViewController__presentBridgedViewController__block_invoke;
  v8[3] = &unk_1E5FA9C58;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [v7 addFinishBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__SKAccountPageViewController__presentBridgedViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) account];
  [WeakRetained setAccount:v2];

  BOOL v3 = [*(id *)(a1 + 32) delegate];
  [WeakRetained setDelegate:v3];

  [WeakRetained setPresentingAccountPageViewController:*(void *)(a1 + 32)];
  [WeakRetained setType:2];
  [WeakRetained _setupRemoteViewController:1];
  [WeakRetained setModalPresentationStyle:5];
  unint64_t v4 = [WeakRetained view];
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v5];

  id v6 = [WeakRetained view];
  [v6 setOpaque:0];

  [*(id *)(a1 + 32) presentModalViewController:WeakRetained withTransition:0];
  [*(id *)(a1 + 32) setPreWarmedViewController:0];
}

- (void)_dismissBridgedViewController
{
}

- (void)_bridgedRightButtonPressed:(id)a3
{
}

- (void)redeemCameraViewController:(id)a3 didFinishWithRedeem:(id)a4
{
  id v8 = a3;
  id redeemCompletionHandler = (void (**)(id, id, void))self->redeemCompletionHandler;
  if (redeemCompletionHandler)
  {
    redeemCompletionHandler[2](redeemCompletionHandler, a4, 0);
    id v7 = self->redeemCompletionHandler;
    self->id redeemCompletionHandler = 0;
  }
  [v8 dismissViewControllerAnimated:1 completion:0];
}

- (void)overrideRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4FA81D8];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 sharedConfig];
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  id v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_9;
  }
  LODWORD(v18) = 138543362;
  *(void *)((char *)&v18 + 4) = objc_opt_class();
  id v15 = *(id *)((char *)&v18 + 4);
  LODWORD(v17) = 12;
  BOOL v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v18, v17, v18);
    free(v16);
    SSFileLog();
LABEL_9:
  }
  [(SKUIServiceAccountPageViewController *)self->_serviceProxy performRedeemOperationWithCode:v10 cameraRecognized:v5 completion:v9];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)_beginURLParsing:(id)a3 forceLegacy:(BOOL)a4
{
  id v6 = a3;
  id v7 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke;
  block[3] = &unk_1E5FA9CD0;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke(uint64_t a1)
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v26[0] = @"paymentsShipping";
  v26[1] = @"manageSubscriptions";
  v27[0] = @"paymentsAndShippingUrl";
  v27[1] = @"manageSubscriptionsUrl";
  v26[2] = @"editBilling";
  v27[2] = @"editBillingUrl";
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  unint64_t v4 = [v2 path];
  BOOL v5 = [v3 objectForKey:v4];

  if (v5)
  {
    id v6 = [v2 path];
    NSLog(&cfstr_GenericConfigU.isa, v6, v5);

    id v7 = *(void **)(a1 + 40);
    id v8 = v5;
LABEL_3:
    uint64_t v9 = [v7 _URLForBagKey:v8];
LABEL_4:
    id v10 = (void *)v9;

    id v2 = v10;
    goto LABEL_5;
  }
  BOOL v12 = [v2 pathComponents];
  int v13 = [v12 firstObject];
  char v14 = [v13 isEqual:@"account"];

  if ((v14 & 1) != 0 || !v2)
  {
    NSLog(&cfstr_AccountUrlConf.isa);
    v22 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v23 = objc_msgSend(v22, "ams_activeiTunesAccount");

    id v7 = *(void **)(a1 + 40);
    if (v23) {
      id v8 = @"modifyAccount";
    }
    else {
      id v8 = @"signup";
    }
    goto LABEL_3;
  }
  id v15 = [v2 pathComponents];
  BOOL v16 = [v15 firstObject];
  int v17 = [v16 isEqual:@"redeem"];

  if (v17)
  {
    NSLog(&cfstr_RedeemUrlConfi.isa);
    uint64_t v9 = [*(id *)(a1 + 40) _redeemURLFromRedeemConfigURL:v2];
    goto LABEL_4;
  }
LABEL_5:
  if (*(unsigned char *)(a1 + 48))
  {
    id v11 = [MEMORY[0x1E4F4DDD0] promiseWithResult:&unk_1F08C0D90];
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F4DE50]);
    uint64_t v19 = +[SKAccountPageBagProvider sharedBag];
    uint64_t v20 = (void *)[v18 initWithBag:v19];

    id v11 = [v20 typeForURL:v2];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_119;
  v24[3] = &unk_1E5FA9CA8;
  v24[4] = *(void *)(a1 + 40);
  id v25 = v2;
  id v21 = v2;
  [v11 addFinishBlock:v24];
}

void __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_2;
  v10[3] = &unk_1E5FA9C80;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v12 = v6;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 976), *(id *)(a1 + 40));
  if (*(void *)(a1 + 48))
  {
    NSLog(&cfstr_CouldDetermine.isa, *(void *)(a1 + 48));
    id v2 = *(void **)(a1 + 32);
    [v2 _setupLegacyContainer];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 56) integerValue];
    switch(v3)
    {
      case 2:
        NSLog(&cfstr_DynamicUiViewC.isa);
        break;
      case 1:
        [*(id *)(a1 + 32) _setupLegacyContainer];
        break;
      case 0:
        [*(id *)(a1 + 32) _setupWebViewController];
        break;
    }
    id v4 = [*(id *)(a1 + 32) connectionSetupPromise];
    objc_msgSend(v4, "finishWithSuccess:error:", *(void *)(a1 + 48) == 0);
  }
}

- (id)_URLForBagKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA8300];
  id v4 = a3;
  id v5 = [v3 contextWithBagType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA82F8]) initWithURLBagContext:v5];
  id v7 = [v6 valueForKey:v4 error:0];

  objc_opt_class();
  id v8 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }

  return v8;
}

- (id)_redeemURLFromRedeemConfigURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 pathComponents];
  unint64_t v6 = [v5 count];

  if (v6 < 2)
  {
    id v7 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:1];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = [v7 queryItems];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v24 = self;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v15 = [v14 name];
          int v16 = [v15 isEqualToString:@"code"];

          if (v16)
          {
            id v8 = [v14 value];
            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      id v8 = 0;
LABEL_13:
      self = v24;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v7 = [v4 pathComponents];
    id v8 = [v7 objectAtIndexedSubscript:1];
  }

  int v17 = [(SKAccountPageViewController *)self _URLForBagKey:@"redeemCodeLanding"];
  if (v17 && v8)
  {
    id v18 = [MEMORY[0x1E4F29088] componentsWithURL:v17 resolvingAgainstBaseURL:1];
    uint64_t v19 = [MEMORY[0x1E4F290C8] queryItemWithName:@"code" value:v8];
    uint64_t v20 = [v18 queryItems];
    id v21 = [v20 arrayByAddingObject:v19];
    [v18 setQueryItems:v21];

    uint64_t v22 = [v18 URL];

    int v17 = (void *)v22;
  }

  return v17;
}

- (void)_setupWebViewController
{
  id v11 = [getAMSUIWebViewControllerClass() createBagForSubProfile];
  uint64_t v3 = [(SKAccountPageViewController *)self account];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    objc_msgSend(v6, "ams_activeiTunesAccount");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = (AMSUIWebViewController *)[objc_alloc((Class)getAMSUIWebViewControllerClass()) initWithBag:v11 account:v5 clientInfo:0];
  webViewController = self->_webViewController;
  self->_webViewController = v7;

  id v9 = [(AMSUIWebViewController *)self->_webViewController loadURL:self->_accountURL];
  [v9 addFinishBlock:&__block_literal_global_1];
  self->_isRemoteViewControllerReady = 1;
  [(SKAccountPageViewController *)self _endDelayingPresentation];
  uint64_t v10 = [(SKAccountPageViewController *)self parentViewController];
  [v10 _endDelayingPresentation];

  [(SKAccountPageViewController *)self setModalPresentationStyle:2];
  [(SKAccountPageViewController *)self setModalInPresentation:1];
  [(SKAccountPageViewController *)self _addRemoteView];
}

void __54__SKAccountPageViewController__setupWebViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_10;
  }
  int v11 = 138412290;
  id v12 = v3;
  LODWORD(v10) = 12;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v11, v10);
    free(v9);
    SSFileLog();
LABEL_10:
  }
}

- (void)_setupLegacyContainer
{
  id v3 = [[SKInvocationQueueProxy alloc] initWithProtocol:&unk_1F08F1668];
  serviceProxy = self->_serviceProxy;
  self->_serviceProxy = (SKUIServiceAccountPageViewController *)v3;

  [(SKAccountPageViewController *)self _requestRemoteViewController];
  [(SKAccountPageViewController *)self setModalPresentationStyle:2];
  [(SKAccountPageViewController *)self setModalInPresentation:1];
  [(SKAccountPageViewController *)self _setupNotificationCenter];

  [(SKAccountPageViewController *)self _addRemoteView];
}

- (void)_setupNavigationItem
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v4 configureWithDefaultBackground];
  id v3 = [(SKAccountPageViewController *)self navigationItem];
  [v3 setScrollEdgeAppearance:v4];
}

- (id)_overrideScheme:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 scheme];
  if (!v4) {
    goto LABEL_5;
  }
  int v5 = (void *)v4;
  int v6 = [v3 scheme];
  if ([v6 isEqualToString:@"http"])
  {

LABEL_5:
    id v9 = v3;
    goto LABEL_6;
  }
  id v7 = [v3 scheme];
  int v8 = [v7 isEqualToString:@"https"];

  if (v8) {
    goto LABEL_5;
  }
  int v11 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
  [v11 setScheme:@"https"];
  id v9 = [v11 URL];

LABEL_6:

  return v9;
}

- (void)_popAllBridgedNavigationViewControllers
{
  unint64_t v3 = [(SKAccountPageViewController *)self _indexForFirstBridgedNavigationViewController]- 1;
  uint64_t v4 = [(SKAccountPageViewController *)self navigationController];
  int v5 = [v4 viewControllers];
  unint64_t v6 = [v5 count];

  if (v6 > v3)
  {
    id v7 = [(SKAccountPageViewController *)self navigationController];
    int v8 = [v7 viewControllers];
    id v11 = [v8 objectAtIndex:v3];

    id v9 = [(SKAccountPageViewController *)self navigationController];
    id v10 = (id)[v9 popToViewController:v11 animated:1];
  }
}

- (unint64_t)_indexForFirstBridgedNavigationViewController
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v3 = [(SKAccountPageViewController *)self navigationController];
  uint64_t v4 = [v3 viewControllers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [(SKAccountPageViewController *)self navigationController];
          id v12 = [v11 viewControllers];
          unint64_t v10 = [v12 indexOfObject:v9];

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v10;
}

- (BOOL)_isBridgedNavigationViewController
{
  unint64_t v3 = [(SKAccountPageViewController *)self navigationController];
  uint64_t v4 = [v3 viewControllers];
  BOOL v5 = (unint64_t)[v4 count] > 1 || -[SKAccountPageViewController type](self, "type") == 1;

  return v5;
}

- (void)_addRemoteView
{
  if (!self->_isLoading)
  {
    unint64_t v3 = self->_remoteViewController;
    uint64_t v4 = v3;
    if (self->_webViewController)
    {
      id v12 = v3;
      BOOL v5 = [(SKAccountPageViewController *)self navigationController];

      if (v5) {
        uint64_t v6 = self->_webViewController;
      }
      else {
        uint64_t v6 = (AMSUIWebViewController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_webViewController];
      }
      uint64_t v7 = v6;

      [(SKAccountPageViewController *)self addChildViewController:v7];
      uint64_t v8 = [(SKAccountPageViewController *)self view];
      uint64_t v9 = [(AMSUIWebViewController *)v7 view];
      [v8 addSubview:v9];

      unint64_t v3 = (SKRemoteAccountPageViewController *)[(AMSUIWebViewController *)v7 didMoveToParentViewController:self];
      uint64_t v4 = (SKRemoteAccountPageViewController *)v7;
    }
    if (v4)
    {
      uint64_t v13 = v4;
      unint64_t v3 = (SKRemoteAccountPageViewController *)[(SKAccountPageViewController *)self isViewLoaded];
      uint64_t v4 = v13;
      if (v3)
      {
        unint64_t v10 = [(SKAccountPageViewController *)self view];
        id v11 = [(SKRemoteAccountPageViewController *)v13 view];
        [v10 bounds];
        objc_msgSend(v11, "setFrame:");
        [v11 setAutoresizingMask:18];
        [v10 addSubview:v11];

        uint64_t v4 = v13;
      }
    }
    MEMORY[0x1F41817F8](v3, v4);
  }
}

- (void)_setupPreWarmedViewController
{
  unint64_t v3 = [(SKAccountPageViewController *)self preWarmedViewController];

  if (!v3)
  {
    BOOL v5 = [[SKAccountPageViewController alloc] initWithAccountURL:0 forceLegacy:1];
    uint64_t v4 = [(SKAccountPageViewController *)self account];
    [(SKAccountPageViewController *)v5 setAccount:v4];

    [(SKAccountPageViewController *)self setPreWarmedViewController:v5];
  }
}

- (void)_setupRemoteViewController:(BOOL)a3
{
  if (!self->_isRemoteViewControllerSetup || a3)
  {
    if (self->_account) {
      -[SKUIServiceAccountPageViewController setAccount:](self->_serviceProxy, "setAccount:");
    }
    if (self->_referrer) {
      -[SKUIServiceAccountPageViewController setReferrer:](self->_serviceProxy, "setReferrer:");
    }
    if ([(SKAccountPageViewController *)self _isBridgedNavigationViewController]
      || self->_loadBlock)
    {
      [(SKUIServiceAccountPageViewController *)self->_serviceProxy setType:1];
      if ([(SKAccountPageViewController *)self type] == 1) {
        [(SKUIServiceAccountPageViewController *)self->_serviceProxy setLoadFromBridgedNavigation:1];
      }
    }
    else
    {
      if ([(SKAccountPageViewController *)self type] == 2)
      {
        [(SKUIServiceAccountPageViewController *)self->_serviceProxy setType:2];
        [(SKUIServiceAccountPageViewController *)self->_serviceProxy setLoadFromBridgedNavigation:0];
      }
      BOOL v5 = [(SKAccountPageViewController *)self navigationController];
      [v5 setNavigationBarHidden:1];
    }
    self->_isRemoteViewControllerSetup = 1;
  }
}

- (void)_requestRemoteViewController
{
  unint64_t v3 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  uint64_t v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (!v7) {
    goto LABEL_10;
  }
  v14[0] = 0;
  LODWORD(v11) = 2;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v14, v11);
    free(v8);
    SSFileLog();
LABEL_10:
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__SKAccountPageViewController__requestRemoteViewController__block_invoke;
  v13[3] = &unk_1E5FA9B00;
  void v13[4] = self;
  [(SKAccountPageViewController *)self _beginDelayingPresentation:v13 cancellationHandler:10.0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SKAccountPageViewController__requestRemoteViewController__block_invoke_2;
  v12[3] = &unk_1E5FA9D18;
  v12[4] = self;
  uint64_t v9 = +[_UIRemoteViewController requestViewController:@"ServiceAccountPageViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:v12];
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v9;
}

uint64_t __59__SKAccountPageViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  return 0;
}

void __59__SKAccountPageViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v6 = a3;
  if (v13)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1016), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1016), "setAccountPageViewController:");
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 1024);
    uint64_t v9 = [*(id *)(v7 + 1016) serviceViewControllerProxy];
    [v8 setInvocationTarget:v9];

    [*(id *)(a1 + 32) _setupRemoteViewController:0];
    [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 1016)];
  }
  else
  {
    NSLog(&cfstr_CouldNotReques.isa, v6);
    [*(id *)(a1 + 32) _didPrepareWithResult:0 error:v6];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 984);
  *(void *)(v10 + 984) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 1032) = 1;
  [*(id *)(a1 + 32) _endDelayingPresentation];
  id v12 = [*(id *)(a1 + 32) parentViewController];
  [v12 _endDelayingPresentation];
}

- (SKAccountPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKAccountPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)referrer
{
  return self->_referrer;
}

- (void)setReferrer:(id)a3
{
}

- (BOOL)showAccountGlyph
{
  return self->_showAccountGlyph;
}

- (void)setShowAccountGlyph:(BOOL)a3
{
  self->_showAccountGlyph = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (SKAccountPageViewController)preWarmedViewController
{
  return self->_preWarmedViewController;
}

- (void)setPreWarmedViewController:(id)a3
{
}

- (SKAccountPageViewController)presentingAccountPageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingAccountPageViewController);

  return (SKAccountPageViewController *)WeakRetained;
}

- (void)setPresentingAccountPageViewController:(id)a3
{
}

- (AMSUIWebViewController)webViewController
{
  return self->_webViewController;
}

- (void)setWebViewController:(id)a3
{
}

- (AMSMutableBinaryPromise)connectionSetupPromise
{
  return self->_connectionSetupPromise;
}

- (void)setConnectionSetupPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionSetupPromise, 0);
  objc_storeStrong((id *)&self->_webViewController, 0);
  objc_destroyWeak((id *)&self->_presentingAccountPageViewController);
  objc_storeStrong((id *)&self->_preWarmedViewController, 0);
  objc_storeStrong((id *)&self->_referrer, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->redeemCompletionHandler, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_presentedRedeemCameraViewController);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);

  objc_storeStrong((id *)&self->_accountURL, 0);
}

@end