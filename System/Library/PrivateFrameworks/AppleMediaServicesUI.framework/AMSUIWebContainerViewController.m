@interface AMSUIWebContainerViewController
- (AMSBinaryPromise)activeRefresh;
- (AMSPageRenderMetricsPresenter)pageRenderPresenter;
- (AMSUIWebAppearance)appearance;
- (AMSUIWebClientContext)context;
- (AMSUIWebContainerViewController)initWithViewController:(id)a3 appearance:(id)a4 navigationBar:(id)a5 context:(id)a6;
- (AMSUIWebContainerViewController)nextContainer;
- (AMSUIWebNavigationBarModel)navigationBarModel;
- (AMSUIWebPagePresenter)containedViewController;
- (AMSUIWebPresentationDelegate)modalPresentationDelegate;
- (AMSUIWebPresentationDelegate)pushPresentationDelegate;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)didAppearOnce;
- (BOOL)dismissCalled;
- (BOOL)isAppearing;
- (BOOL)shouldSkipInitialRefresh;
- (CGPoint)scrollPosition;
- (NSDictionary)pageInfo;
- (NSDictionary)pageMetrics;
- (UINavigationItem)lastNavigationItem;
- (UIViewController)hiddenViewController;
- (id)_actionBlockForWebButtonModel:(id)a3;
- (id)_buttonModelForBarButtonItemModel:(id)a3;
- (id)_createBarButtonItemWithModel:(id)a3 navigationBarModel:(id)a4;
- (id)_makeCustomNavigationBarAppearanceWithModel:(id)a3;
- (id)_refreshWithOptions:(id)a3;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)navigationItem;
- (int64_t)containerIndex;
- (int64_t)disableReappearPlaceholder;
- (int64_t)lastNavigationStyle;
- (unint64_t)_determineActivePresentationType;
- (unint64_t)activePresentationType;
- (void)_adjustWebViewScrollFor:(id)a3 completion:(id)a4;
- (void)_applyAppearance;
- (void)_handlePushDismissal;
- (void)_postEvent:(id)a3;
- (void)_prepareToMoveWebViewToVC:(id)a3 completion:(id)a4;
- (void)_refreshForInitialAppear;
- (void)_scrollTo:(CGPoint)a3 webView:(id)a4 completion:(id)a5;
- (void)_setupNavBarAnimated:(BOOL)a3;
- (void)applyNavigationBarModel:(id)a3 toNavigationController:(id)a4 animated:(BOOL)a5;
- (void)applyNavigationModel:(id)a3;
- (void)cacheScrollViewPositionFor:(id)a3;
- (void)contentWasReplacedAnimated:(BOOL)a3;
- (void)dealloc;
- (void)didDismissController:(id)a3;
- (void)handleModalDismissal;
- (void)loadView;
- (void)replaceContentWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setActiveRefresh:(id)a3;
- (void)setAppearance:(id)a3;
- (void)setContainedViewController:(id)a3;
- (void)setContainerIndex:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setDidAppearOnce:(BOOL)a3;
- (void)setDisableReappearPlaceholder:(int64_t)a3;
- (void)setDismissCalled:(BOOL)a3;
- (void)setHiddenViewController:(id)a3;
- (void)setIsAppearing:(BOOL)a3;
- (void)setLastNavigationItem:(id)a3;
- (void)setLastNavigationStyle:(int64_t)a3;
- (void)setModalPresentationDelegate:(id)a3;
- (void)setNavigationBarModel:(id)a3;
- (void)setNextContainer:(id)a3;
- (void)setPageInfo:(id)a3;
- (void)setPageRenderPresenter:(id)a3;
- (void)setPushPresentationDelegate:(id)a3;
- (void)setScrollPosition:(CGPoint)a3;
- (void)setShouldSkipInitialRefresh:(BOOL)a3;
- (void)setupToolbarAnimated:(BOOL)a3;
- (void)updateSafeAreaEdgesForPageModel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIWebContainerViewController

- (AMSUIWebContainerViewController)initWithViewController:(id)a3 appearance:(id)a4 navigationBar:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(AMSUIWebContainerViewController *)self initWithNibName:0 bundle:0];
  v16 = v15;
  if (v15)
  {
    v15->_activePresentationType = 0;
    uint64_t v17 = [v12 copy];
    appearance = v16->_appearance;
    v16->_appearance = (AMSUIWebAppearance *)v17;

    objc_storeStrong((id *)&v16->_containedViewController, a3);
    objc_storeWeak((id *)&v16->_context, v14);
    v16->_dismissCalled = 0;
    objc_storeStrong((id *)&v16->_navigationBarModel, a5);
  }

  return v16;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)dealloc
{
  if (![(AMSUIWebContainerViewController *)self dismissCalled])
  {
    v3 = [(AMSUIWebContainerViewController *)self pushPresentationDelegate];

    if (!v3) {
      [(AMSUIWebContainerViewController *)self handleModalDismissal];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebContainerViewController;
  [(AMSUICommonViewController *)&v4 dealloc];
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  objc_super v4 = [(AMSUIWebContainerViewController *)self containedViewController];
  v5 = [v4 contentScrollViewForEdge:a3];

  return v5;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebContainerViewController;
  [(AMSUICommonViewController *)&v11 loadView];
  [(AMSUIWebContainerViewController *)self setTransitioningDelegate:self];
  v3 = [(AMSUIWebContainerViewController *)self containedViewController];
  [(AMSUICommonViewController *)self setChildViewController:v3];

  id v4 = objc_alloc(MEMORY[0x263F27DD8]);
  v5 = [(AMSUIWebContainerViewController *)self context];
  v6 = [v5 bag];
  v7 = [(AMSUIWebContainerViewController *)self context];
  v8 = [v7 metrics];
  v9 = (void *)[v4 initWithBag:v6 metrics:v8];
  [(AMSUIWebContainerViewController *)self setPageRenderPresenter:v9];

  v10 = [(AMSUIWebContainerViewController *)self pageRenderPresenter];
  [v10 startWithActivity:0];
}

- (id)navigationItem
{
  v3 = [(AMSUIWebContainerViewController *)self parentViewController];
  id v4 = objc_msgSend(v3, "ams_navigationItemViewController");

  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 navigationItem];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AMSUIWebContainerViewController;
    uint64_t v5 = [(AMSUIWebContainerViewController *)&v8 navigationItem];
  }
  v6 = (void *)v5;

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebContainerViewController;
  [(AMSUIWebContainerViewController *)&v10 viewDidAppear:a3];
  id v4 = [(AMSUIWebContainerViewController *)self pageRenderPresenter];
  [v4 viewDidAppear];

  [(AMSUIWebContainerViewController *)self _postEvent:@"DidAppear"];
  [(AMSUIWebContainerViewController *)self setDismissCalled:0];
  if (![(AMSUIWebContainerViewController *)self isAppearing]
    && [(AMSUIWebContainerViewController *)self didAppearOnce]
    && ([(AMSUIWebContainerViewController *)self isMovingToParentViewController] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = objc_opt_class();
      objc_super v8 = [(AMSUIWebContainerViewController *)self context];
      v9 = [v8 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Did re-appear from pop", buf, 0x16u);
    }
    [(AMSUIWebContainerViewController *)self didDismissController:self];
  }
  [(AMSUIWebContainerViewController *)self setDidAppearOnce:1];
  [(AMSUIWebContainerViewController *)self setIsAppearing:1];
  [(AMSUIWebContainerViewController *)self setShouldSkipInitialRefresh:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(AMSUIWebContainerViewController *)self _postEvent:@"DidDisappear"];
  v5.receiver = self;
  v5.super_class = (Class)AMSUIWebContainerViewController;
  [(AMSUIWebContainerViewController *)&v5 viewDidDisappear:v3];
  [(AMSUIWebContainerViewController *)self setIsAppearing:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebContainerViewController;
  [(AMSUIWebContainerViewController *)&v4 viewDidLoad];
  BOOL v3 = [(AMSUIWebContainerViewController *)self pageRenderPresenter];
  [v3 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebContainerViewController;
  [(AMSUIWebContainerViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [(AMSUIWebContainerViewController *)self pageRenderPresenter];
  [v4 viewWillAppear];

  self->_activePresentationType = [(AMSUIWebContainerViewController *)self _determineActivePresentationType];
  [(AMSUIWebContainerViewController *)self _refreshForInitialAppear];
  objc_super v5 = [(AMSUIWebContainerViewController *)self navigationBarModel];
  [(AMSUIWebContainerViewController *)self applyNavigationModel:v5];

  [(AMSUIWebContainerViewController *)self _applyAppearance];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIWebContainerViewController;
  [(AMSUIWebContainerViewController *)&v14 viewWillLayoutSubviews];
  BOOL v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(AMSUIWebContainerViewController *)self containedViewController];
  __int16 v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)applyNavigationModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_navigationBarModel, a3);
    [(AMSUIWebContainerViewController *)self _setupNavBarAnimated:0];
    id v5 = v6;
  }
}

- (void)cacheScrollViewPositionFor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [v5 webView];

  if (v6)
  {
    objc_initWeak(&location, self);
    double v7 = [v6 underlyingWebView];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__AMSUIWebContainerViewController_cacheScrollViewPositionFor___block_invoke;
    v8[3] = &unk_2643E4B68;
    objc_copyWeak(&v9, &location);
    [v7 evaluateJavaScript:@"window.scrollY;" completionHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __62__AMSUIWebContainerViewController_cacheScrollViewPositionFor___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    [v5 doubleValue];
    objc_msgSend(WeakRetained, "setScrollPosition:", 0.0, v4);
  }
}

- (void)handleModalDismissal
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (![(AMSUIWebContainerViewController *)self dismissCalled])
  {
    [(AMSUIWebContainerViewController *)self setDismissCalled:1];
    BOOL v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v3)
    {
      BOOL v3 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = [(AMSUIWebContainerViewController *)self context];
      double v7 = [v6 logKey];
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling modal dismissal", (uint8_t *)&v9, 0x16u);
    }
    double v8 = [(AMSUIWebContainerViewController *)self modalPresentationDelegate];
    [v8 didDismissController:self];
  }
}

- (void)replaceContentWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v10 = (void (**)(void))a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [(AMSUIWebContainerViewController *)self containedViewController];
  id v12 = v9;
  if (v11 == v12)
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_containedViewController, a3);
    uint64_t v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = objc_opt_class();
      v16 = [(AMSUIWebContainerViewController *)self context];
      uint64_t v17 = [v16 logKey];
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      v27 = v17;
      __int16 v28 = 2114;
      id v29 = v11;
      __int16 v30 = 2114;
      id v31 = v12;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Replacing fromVC with toVC (fromVC: %{public}@, toVC: %{public}@)", buf, 0x2Au);
    }
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke;
    v18[3] = &unk_2643E4BE0;
    objc_copyWeak(&v22, (id *)buf);
    id v19 = v12;
    id v20 = v11;
    v21 = v10;
    BOOL v23 = a4;
    [(AMSUIWebContainerViewController *)self _prepareToMoveWebViewToVC:v19 completion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "ams_setChildViewController:", *(void *)(a1 + 32));
  BOOL v3 = [WeakRetained view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  uint64_t v13 = [*(id *)(a1 + 32) view];
  objc_msgSend(v13, "ams_setAlpha:", 0.0);

  objc_super v14 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v14)
  {
    objc_super v14 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [WeakRetained context];
    v18 = [v17 logKey];
    id v19 = [*(id *)(a1 + 32) view];
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v16;
    __int16 v34 = 2114;
    v35 = v18;
    __int16 v36 = 2114;
    v37 = v19;
    _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] toVC.view added (toVC.view: %{public}@)", buf, 0x20u);
  }
  [WeakRetained scrollPosition];
  if (v20 > 0.0)
  {
    id v21 = objc_alloc_init(MEMORY[0x263F829A8]);
    [v21 configureWithDefaultBackground];
    id v22 = [WeakRetained navigationItem];
    [v22 setStandardAppearance:v21];

    BOOL v23 = [WeakRetained navigationItem];
    [v23 setCompactAppearance:v21];

    v24 = [WeakRetained navigationItem];
    [v24 setScrollEdgeAppearance:v21];
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_21;
  v26[3] = &unk_2643E4BB8;
  uint64_t v25 = *(void *)(a1 + 32);
  id v27 = *(id *)(a1 + 40);
  id v28 = WeakRetained;
  id v30 = *(id *)(a1 + 48);
  id v29 = *(id *)(a1 + 32);
  char v31 = *(unsigned char *)(a1 + 64);
  [WeakRetained _adjustWebViewScrollFor:v25 completion:v26];
}

void __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_21(uint64_t a1)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2;
  aBlock[3] = &unk_2643E4948;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v18 = v2;
  uint64_t v19 = v3;
  id v20 = *(id *)(a1 + 56);
  double v4 = (void (**)(void))_Block_copy(aBlock);
  [*(id *)(a1 + 40) scrollPosition];
  if (v5 > 0.0)
  {
    [*(id *)(a1 + 40) setLastNavigationItem:0];
    [*(id *)(a1 + 40) _setupNavBarAnimated:0];
  }
  double v6 = [*(id *)(a1 + 48) contentScrollViewForEdge:1];
  double v7 = [*(id *)(a1 + 40) navigationController];
  double v8 = [v7 topViewController];
  [v8 setContentScrollView:v6 forEdge:1];

  if (*(unsigned char *)(a1 + 64))
  {
    double v9 = (void *)MEMORY[0x263F82E00];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_24;
    v15[3] = &unk_2643E3118;
    id v16 = *(id *)(a1 + 48);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2_25;
    v12[3] = &unk_2643E4B90;
    double v10 = v4;
    v12[4] = *(void *)(a1 + 40);
    id v13 = v10;
    char v14 = *(unsigned char *)(a1 + 64);
    [v9 animateWithDuration:0 delay:v15 options:v12 animations:0.2 completion:0.0];
  }
  else
  {
    double v11 = [*(id *)(a1 + 48) view];
    objc_msgSend(v11, "ams_setAlpha:", 1.0);

    v4[2](v4);
  }
}

uint64_t __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "ams_removeFromParentViewController");
  id v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    id v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    double v5 = [*(id *)(a1 + 40) context];
    double v6 = [v5 logKey];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    double v11 = v6;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] fromVC removed", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_24(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2_25(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  return [v2 contentWasReplacedAnimated:v3];
}

- (void)setupToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v5 = [(AMSUIWebContainerViewController *)self containedViewController];
  double v6 = [v5 toolbarItems];

  double v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v7)
  {
    double v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  int v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = objc_opt_class();
    __int16 v10 = [(AMSUIWebContainerViewController *)self context];
    double v11 = [v10 logKey];
    int v18 = 138543874;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    BOOL v23 = v6;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Setting Toolbar (items: %{public}@)", (uint8_t *)&v18, 0x20u);
  }
  [(AMSUIWebContainerViewController *)self setToolbarItems:v6 animated:v3];
  if ([v6 count])
  {
    uint64_t v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      uint64_t v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [(AMSUIWebContainerViewController *)self context];
      id v16 = [v15 logKey];
      int v18 = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v16;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Showing toolbar", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v17 = [(AMSUIWebContainerViewController *)self navigationController];
    [v17 setToolbarHidden:0 animated:v3];
  }
}

- (void)updateSafeAreaEdgesForPageModel:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v9;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    if ([v4 ignoreTopSafeArea]) {
      uint64_t v5 = 10;
    }
    else {
      uint64_t v5 = 11;
    }
    if (![v4 ignoreBottomSafeArea]) {
      v5 |= 4uLL;
    }
    double v6 = [(AMSUIWebContainerViewController *)self context];
    double v7 = [v6 webPage];
    int v8 = [v7 view];

    if ([v8 edgesPropagatingSafeAreaInsetsToSubviews] != v5)
    {
      [v8 setEdgesPropagatingSafeAreaInsetsToSubviews:v5];
      objc_msgSend(v8, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    }
  }
}

- (void)didDismissController:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", a3);
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = objc_opt_class();
    id v7 = v6;
    int v8 = [(AMSUIWebContainerViewController *)self context];
    id v9 = [v8 logKey];
    int v16 = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received container dismissal", (uint8_t *)&v16, 0x16u);
  }
  __int16 v10 = [(AMSUIWebContainerViewController *)self containedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v12 = [(AMSUIWebContainerViewController *)self containedViewController];
    [v12 willAppearAfterDismiss];
  }
  [(AMSUIWebContainerViewController *)self setNextContainer:0];
  id v13 = objc_alloc_init(AMSUIWebFlowOptions);
  uint64_t v14 = [(AMSUIWebContainerViewController *)self pageInfo];
  [(AMSUIWebFlowOptions *)v13 setPageData:v14];

  [(AMSUIWebFlowOptions *)v13 setDeferredPresentation:[(AMSUIWebContainerViewController *)self disableReappearPlaceholder] != 0];
  [(AMSUIWebFlowOptions *)v13 setReuseExistingPage:1];
  [(AMSUIWebFlowOptions *)v13 setAnimated:1];
  id v15 = [(AMSUIWebContainerViewController *)self _refreshWithOptions:v13];
}

- (void)_prepareToMoveWebViewToVC:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(void))a4;
  double v6 = [(AMSUIWebContainerViewController *)self navigationController];
  char v7 = [v6 isToolbarHidden];

  if ((v7 & 1) == 0)
  {
    int v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v8)
    {
      int v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = objc_opt_class();
      double v11 = [(AMSUIWebContainerViewController *)self context];
      uint64_t v12 = [v11 logKey];
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Hiding toolbar", (uint8_t *)&v14, 0x16u);
    }
    id v13 = [(AMSUIWebContainerViewController *)self navigationController];
    [v13 setToolbarHidden:1 animated:1];

    [(AMSUIWebContainerViewController *)self setToolbarItems:MEMORY[0x263EFFA68] animated:0];
  }
  v5[2](v5);
}

- (void)contentWasReplacedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = objc_opt_class();
    int v8 = [(AMSUIWebContainerViewController *)self context];
    id v9 = [v8 logKey];
    uint64_t v10 = [(AMSUIWebContainerViewController *)self containedViewController];
    int v11 = 138543874;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    int v14 = v9;
    __int16 v15 = 2114;
    __int16 v16 = v10;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Content replaced (containedViewController: %{public}@)", (uint8_t *)&v11, 0x20u);
  }
  [(AMSUIWebContainerViewController *)self setupToolbarAnimated:v3];
}

- (AMSUIWebPagePresenter)containedViewController
{
  return self->_containedViewController;
}

- (NSDictionary)pageMetrics
{
  id v3 = objc_alloc(NSDictionary);
  id v4 = [(AMSUIWebContainerViewController *)self context];
  uint64_t v5 = [v4 URL];
  double v6 = [(AMSUIWebContainerViewController *)self pageInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"routeName"];
  int v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", @"pageRender", @"eventType", v5, @"pageUrl", v7, @"placement", 0);

  return (NSDictionary *)v8;
}

- (void)setContainedViewController:(id)a3
{
}

- (id)_actionBlockForWebButtonModel:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__AMSUIWebContainerViewController__actionBlockForWebButtonModel___block_invoke;
  v8[3] = &unk_2643E3598;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  double v6 = (void *)[v8 copy];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __65__AMSUIWebContainerViewController__actionBlockForWebButtonModel___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) action];
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      int v8 = [WeakRetained context];
      id v9 = [v8 logKey];
      int v15 = 138543618;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Navigation bar button selected", (uint8_t *)&v15, 0x16u);
    }
    id v10 = (id)[v3 runAction];
  }
  else
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v11 = [v5 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      __int16 v13 = [WeakRetained context];
      int v14 = [v13 logKey];
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Navigation bar button selected with no action to run", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_adjustWebViewScrollFor:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(void))a4;
  id v7 = a3;
  int v8 = [(AMSUIWebContainerViewController *)self context];
  id v9 = [v8 webPage];
  objc_opt_class();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v11 = [(AMSUIWebContainerViewController *)self context];
    uint64_t v12 = [v11 webPage];
    __int16 v13 = [v12 webView];

    [(AMSUIWebContainerViewController *)self scrollPosition];
    double v15 = v14;
    double v17 = v16;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke;
    v19[3] = &unk_2643E33B0;
    id v20 = v13;
    id v21 = v6;
    id v18 = v13;
    -[AMSUIWebContainerViewController _scrollTo:webView:completion:](self, "_scrollTo:webView:completion:", v18, v19, v15, v17);
  }
  else
  {
    v6[2](v6);
  }
}

void __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingWebView];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke_2;
  v3[3] = &unk_2643E4C08;
  id v4 = *(id *)(a1 + 40);
  [v2 _doAfterNextStablePresentationUpdate:v3];
}

uint64_t __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_applyAppearance
{
  id v8 = [(AMSUIWebContainerViewController *)self appearance];
  id v3 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  uint64_t v4 = [v8 backgroundColor];
  id v5 = (void *)v4;
  if (v4) {
    double v6 = (void *)v4;
  }
  else {
    double v6 = v3;
  }
  id v7 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v7, "ams_setBackgroundColor:", v6);
}

- (id)_buttonModelForBarButtonItemModel:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 buttonModel];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    unint64_t v8 = [(AMSUIWebContainerViewController *)self activePresentationType];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = objc_msgSend(v4, "conditionalButtonModels", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v14 hideOnPush]) {
            BOOL v15 = v8 == 2;
          }
          else {
            BOOL v15 = 0;
          }
          if (!v15 && (![v14 hideOnModal] || v8 != 1))
          {
            id v7 = [v14 button];

            goto LABEL_20;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v7 = 0;
  }
LABEL_20:

  return v7;
}

- (id)_createBarButtonItemWithModel:(id)a3 navigationBarModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(AMSUIWebContainerViewController *)self _buttonModelForBarButtonItemModel:v6];
  id v9 = (void *)MEMORY[0x263F824A8];
  if (v8)
  {
    uint64_t v10 = [(AMSUIWebContainerViewController *)self _actionBlockForWebButtonModel:v8];
    [v9 barButtonItemWithWebButtonModel:v8 navigationBarModel:v7 actionBlock:v10];
  }
  else
  {
    uint64_t v10 = [v6 appViewModel];
    [v9 barButtonItemWithWebAppViewModel:v10];
  uint64_t v11 = };

  return v11;
}

- (unint64_t)_determineActivePresentationType
{
  id v3 = [(UIViewController *)self ams_navigationItemViewController];
  id v4 = [(UIViewController *)self ams_navigationController];
  id v5 = [v4 viewControllers];

  if ([v5 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 1;
    while (1)
    {
      unint64_t v8 = [v5 objectAtIndexedSubscript:v6];

      if (v6)
      {
        if (v8 == v3) {
          break;
        }
      }
      if (++v6 >= (unint64_t)[v5 count]) {
        goto LABEL_9;
      }
    }
    unint64_t v7 = 2;
  }
  else
  {
    unint64_t v7 = 1;
  }
LABEL_9:

  return v7;
}

- (void)_handlePushDismissal
{
  id v3 = [(AMSUIWebContainerViewController *)self pushPresentationDelegate];
  [v3 didDismissController:self];
}

- (id)_makeCustomNavigationBarAppearanceWithModel:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F829A8]);
  uint64_t v5 = [v3 backgroundStyle];
  if (v5 == 2)
  {
    [v4 configureWithTransparentBackground];
  }
  else if (v5 == 1)
  {
    [v4 configureWithOpaqueBackground];
  }
  else
  {
    [v4 configureWithDefaultBackground];
  }
  uint64_t v6 = (void *)MEMORY[0x263F825C8];
  unint64_t v7 = [v3 backgroundColor];
  unint64_t v8 = objc_msgSend(v6, "ams_colorFromHexString:", v7);
  [v4 setBackgroundColor:v8];

  return v4;
}

- (void)_postEvent:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AMSUIWebContainerViewController *)self context];
  uint64_t v6 = [v5 flowController];
  unint64_t v7 = [v6 currentContainer];

  if (v7 == self)
  {
    BOOL v15 = @"pageData";
    uint64_t v8 = [(AMSUIWebContainerViewController *)self pageInfo];
    id v9 = (void *)v8;
    uint64_t v10 = MEMORY[0x263EFFA78];
    if (v8) {
      uint64_t v10 = v8;
    }
    v16[0] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

    uint64_t v12 = [(AMSUIWebContainerViewController *)self context];
    __int16 v13 = [v12 dataProvider];
    id v14 = (id)[v13 postEvent:v4 options:v11];
  }
}

- (void)_refreshForInitialAppear
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![(AMSUIWebContainerViewController *)self didAppearOnce]
    && ![(AMSUIWebContainerViewController *)self shouldSkipInitialRefresh])
  {
    id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v3)
    {
      id v3 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = [(AMSUIWebContainerViewController *)self context];
      unint64_t v7 = [v6 logKey];
      int v11 = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Refreshing for initial appearance", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = objc_alloc_init(AMSUIWebFlowOptions);
    id v9 = [(AMSUIWebContainerViewController *)self pageInfo];
    [(AMSUIWebFlowOptions *)v8 setPageData:v9];

    [(AMSUIWebFlowOptions *)v8 setAnimated:1];
    id v10 = [(AMSUIWebContainerViewController *)self _refreshWithOptions:v8];
  }
}

- (id)_refreshWithOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AMSUIWebContainerViewController *)self activeRefresh];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    unint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = [(AMSUIWebContainerViewController *)self context];
      id v10 = [v9 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      long long v20 = v10;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deduping refresh call", buf, 0x16u);
    }
    int v11 = [(AMSUIWebContainerViewController *)self activeRefresh];
  }
  else
  {
    uint64_t v12 = [(AMSUIWebContainerViewController *)self context];
    __int16 v13 = [v12 flowController];
    int v11 = [v13 refreshPageForContainer:self options:v4];

    objc_initWeak((id *)buf, self);
    [(AMSUIWebContainerViewController *)self setActiveRefresh:v11];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__AMSUIWebContainerViewController__refreshWithOptions___block_invoke;
    v15[3] = &unk_2643E4340;
    objc_copyWeak(&v16, (id *)buf);
    [v11 addFinishBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

void __55__AMSUIWebContainerViewController__refreshWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setActiveRefresh:0];
}

- (void)_scrollTo:(CGPoint)a3 webView:(id)a4 completion:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = [a4 underlyingWebView];
  v17[0] = @"scrollX";
  id v10 = [NSNumber numberWithDouble:x];
  v17[1] = @"scrollY";
  v18[0] = v10;
  int v11 = [NSNumber numberWithDouble:y];
  v18[1] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  __int16 v13 = [MEMORY[0x263F1FA10] defaultClientWorld];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__AMSUIWebContainerViewController__scrollTo_webView_completion___block_invoke;
  v15[3] = &unk_2643E4C30;
  id v16 = v8;
  id v14 = v8;
  objc_msgSend(v9, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", @"return new Promise( (resolve, reject) => {    window.requestAnimationFrame(() => {        window.scrollTo(scrollX, scrollY);        window.requestAnimationFrame(() => {            setTimeout(() => {                resolve();            }, 0);        });    });});",
    v12,
    0,
    v13,
    v15);
}

uint64_t __64__AMSUIWebContainerViewController__scrollTo_webView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setupNavBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AMSUIWebContainerViewController *)self navigationBarModel];
  if (v5)
  {
    id v7 = v5;
    uint64_t v6 = [(UIViewController *)self ams_navigationController];
    if (v6) {
      [(AMSUIWebContainerViewController *)self applyNavigationBarModel:v7 toNavigationController:v6 animated:v3];
    }

    uint64_t v5 = v7;
  }
}

- (void)applyNavigationBarModel:(id)a3 toNavigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v33 = a3;
  id v7 = [(AMSUIWebContainerViewController *)self navigationItem];
  objc_msgSend(v7, "setHidesBackButton:", objc_msgSend(v33, "hidesBackButton"));
  id v8 = [v33 title];
  [v7 setTitle:v8];

  id v9 = [v33 leftBarButtonItemModel];
  id v10 = [(AMSUIWebContainerViewController *)self _createBarButtonItemWithModel:v9 navigationBarModel:v33];

  [v10 setAccessibilityIdentifier:@"left_bar_button_item"];
  [v7 setLeftBarButtonItem:v10];
  int v11 = [v33 rightBarButtonItemModel];
  uint64_t v12 = [(AMSUIWebContainerViewController *)self _createBarButtonItemWithModel:v11 navigationBarModel:v33];

  [v12 setAccessibilityIdentifier:@"right_bar_button_item"];
  [v7 setRightBarButtonItem:v12];
  uint64_t v13 = [v33 hidesBackButton] ^ 1;
  id v14 = [(UIViewController *)self ams_navigationController];
  uint64_t v15 = [v14 interactivePopGestureRecognizer];
  [v15 setEnabled:v13];

  id v16 = [v33 backButtonTitle];

  if (v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x263F824A8]);
    uint64_t v18 = [v33 backButtonTitle];
    [v17 setTitle:v18];

    [v7 setBackBarButtonItem:v17];
  }
  else
  {
    [v7 setBackBarButtonItem:0];
  }
  [v7 _setManualScrollEdgeAppearanceEnabled:0];
  __int16 v19 = [(UIViewController *)self ams_navigationController];
  objc_msgSend(v19, "setNavigationBarHidden:animated:", objc_msgSend(v33, "style") == 1, v5);

  BOOL v20 = [v33 style] == 3;
  uint64_t v21 = [(UIViewController *)self ams_navigationController];
  __int16 v22 = [v21 navigationBar];
  [v22 setPrefersLargeTitles:v20];

  int64_t v23 = [(AMSUIWebContainerViewController *)self lastNavigationStyle];
  if (v23 != [v33 style]
    || ([(AMSUIWebContainerViewController *)self lastNavigationItem],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v24 != v7))
  {
    -[AMSUIWebContainerViewController setLastNavigationStyle:](self, "setLastNavigationStyle:", [v33 style]);
    [(AMSUIWebContainerViewController *)self setLastNavigationItem:v7];
    switch([v33 style])
    {
      case 0:
      case 1:
        break;
      case 2:
      case 3:
        id v25 = objc_alloc_init(MEMORY[0x263F829A8]);
        [v25 configureWithDefaultBackground];
        [v7 setStandardAppearance:v25];
        [v7 setCompactAppearance:v25];
        [v7 setScrollEdgeAppearance:v25];
        goto LABEL_14;
      case 5:
        id v25 = objc_alloc_init(MEMORY[0x263F829A8]);
        [v25 configureWithTransparentBackground];
        goto LABEL_13;
      case 6:
        id v25 = objc_alloc_init(MEMORY[0x263F829A8]);
        [v25 configureWithTransparentBackground];
        __int16 v26 = [MEMORY[0x263F825C8] systemBackgroundColor];
        id v27 = [v26 colorWithAlphaComponent:0.96];
        [v25 setBackgroundColor:v27];

LABEL_13:
        [v7 setScrollEdgeAppearance:v25];
        [v7 setStandardAppearance:v25];
        [v7 setCompactAppearance:v25];
        goto LABEL_14;
      case 7:
        id v28 = (void *)MEMORY[0x263F827E8];
        id v29 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"];
        id v30 = [v28 imageNamed:@"navigation-back-button" inBundle:v29 compatibleWithTraitCollection:0];
        char v31 = [(UIViewController *)self ams_navigationController];
        uint64_t v32 = [v31 navigationBar];
        [v32 setBackIndicatorImage:v30];

        goto LABEL_10;
      case 8:
        id v25 = [(AMSUIWebContainerViewController *)self _makeCustomNavigationBarAppearanceWithModel:v33];
        [v7 setCompactAppearance:v25];
        [v7 setScrollEdgeAppearance:v25];
        [v7 setStandardAppearance:v25];
LABEL_14:

        break;
      default:
LABEL_10:
        [v7 setScrollEdgeAppearance:0];
        [v7 setStandardAppearance:0];
        [v7 setCompactAppearance:0];
        break;
    }
  }
}

- (unint64_t)activePresentationType
{
  return self->_activePresentationType;
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (int64_t)containerIndex
{
  return self->_containerIndex;
}

- (void)setContainerIndex:(int64_t)a3
{
  self->_containerIndedouble x = a3;
}

- (int64_t)disableReappearPlaceholder
{
  return self->_disableReappearPlaceholder;
}

- (void)setDisableReappearPlaceholder:(int64_t)a3
{
  self->_disableReappearPlaceholder = a3;
}

- (AMSUIWebPresentationDelegate)modalPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresentationDelegate);
  return (AMSUIWebPresentationDelegate *)WeakRetained;
}

- (void)setModalPresentationDelegate:(id)a3
{
}

- (AMSUIWebContainerViewController)nextContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextContainer);
  return (AMSUIWebContainerViewController *)WeakRetained;
}

- (void)setNextContainer:(id)a3
{
}

- (NSDictionary)pageInfo
{
  return self->_pageInfo;
}

- (void)setPageInfo:(id)a3
{
}

- (AMSPageRenderMetricsPresenter)pageRenderPresenter
{
  return self->_pageRenderPresenter;
}

- (void)setPageRenderPresenter:(id)a3
{
}

- (AMSUIWebPresentationDelegate)pushPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushPresentationDelegate);
  return (AMSUIWebPresentationDelegate *)WeakRetained;
}

- (void)setPushPresentationDelegate:(id)a3
{
}

- (BOOL)shouldSkipInitialRefresh
{
  return self->_shouldSkipInitialRefresh;
}

- (void)setShouldSkipInitialRefresh:(BOOL)a3
{
  self->_shouldSkipInitialRefresh = a3;
}

- (AMSBinaryPromise)activeRefresh
{
  return self->_activeRefresh;
}

- (void)setActiveRefresh:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (BOOL)dismissCalled
{
  return self->_dismissCalled;
}

- (void)setDismissCalled:(BOOL)a3
{
  self->_dismissCalled = a3;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (UIViewController)hiddenViewController
{
  return self->_hiddenViewController;
}

- (void)setHiddenViewController:(id)a3
{
}

- (UINavigationItem)lastNavigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastNavigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)setLastNavigationItem:(id)a3
{
}

- (int64_t)lastNavigationStyle
{
  return self->_lastNavigationStyle;
}

- (void)setLastNavigationStyle:(int64_t)a3
{
  self->_lastNavigationStyle = a3;
}

- (AMSUIWebNavigationBarModel)navigationBarModel
{
  return self->_navigationBarModel;
}

- (void)setNavigationBarModel:(id)a3
{
}

- (CGPoint)scrollPosition
{
  double x = self->_scrollPosition.x;
  double y = self->_scrollPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScrollPosition:(CGPoint)a3
{
  self->_scrollPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarModel, 0);
  objc_destroyWeak((id *)&self->_lastNavigationItem);
  objc_storeStrong((id *)&self->_hiddenViewController, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_activeRefresh, 0);
  objc_destroyWeak((id *)&self->_pushPresentationDelegate);
  objc_storeStrong((id *)&self->_pageRenderPresenter, 0);
  objc_storeStrong((id *)&self->_pageInfo, 0);
  objc_destroyWeak((id *)&self->_nextContainer);
  objc_destroyWeak((id *)&self->_modalPresentationDelegate);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_containedViewController, 0);
}

@end