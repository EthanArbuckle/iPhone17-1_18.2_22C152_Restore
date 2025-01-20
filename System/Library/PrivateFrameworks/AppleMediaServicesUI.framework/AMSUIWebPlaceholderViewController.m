@interface AMSUIWebPlaceholderViewController
- (AMSBinaryPromise)snapshotPromise;
- (AMSUIMessageLoadingViewController)loadingController;
- (AMSUIWebAppearance)appearance;
- (AMSUIWebClientContext)context;
- (AMSUIWebLoadingPageModel)model;
- (AMSUIWebPagePresenter)originalViewController;
- (AMSUIWebPlaceholderViewController)initWithContext:(id)a3;
- (AMSUIWebPlaceholderViewController)initWithModel:(id)a3 context:(id)a4 appearance:(id)a5;
- (AMSUIWebPlaceholderViewController)initWithSnapshot:(id)a3 context:(id)a4 appearance:(id)a5;
- (AMSUIWebSnapshotView)snapshotView;
- (BOOL)animateFadeIn;
- (BOOL)hasAppeared;
- (BOOL)isVisible;
- (BOOL)shouldSnapshot;
- (NSUUID)snapshotID;
- (UIView)visibleView;
- (id)removeSnapshot;
- (void)_animateTransition;
- (void)_applyAppearance;
- (void)_replacePrimaryViewWithView:(id)a3 animated:(BOOL)a4;
- (void)_replacePrimaryViewWithViewController:(id)a3 animated:(BOOL)a4;
- (void)_startReappearTransitionTimerAnimated:(BOOL)a3;
- (void)_transitionToLoadingAnimated:(BOOL)a3;
- (void)_transitionToSnapshot;
- (void)awaitSnapshotWithCompletion:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setAnimateFadeIn:(BOOL)a3;
- (void)setAppearance:(id)a3;
- (void)setContext:(id)a3;
- (void)setHasAppeared:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setLoadingController:(id)a3;
- (void)setModel:(id)a3;
- (void)setOriginalViewController:(id)a3;
- (void)setShouldSnapshot:(BOOL)a3;
- (void)setSnapshotID:(id)a3;
- (void)setSnapshotPromise:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setVisibleView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willAppearAfterDismiss;
- (void)willPresentPageModel:(id)a3 appearance:(id)a4;
@end

@implementation AMSUIWebPlaceholderViewController

- (AMSUIWebPlaceholderViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebPlaceholderViewController;
  v6 = [(AMSUICommonViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = [MEMORY[0x263F27B58] promiseWithSuccess];
    snapshotPromise = v7->_snapshotPromise;
    v7->_snapshotPromise = (AMSBinaryPromise *)v8;
  }
  return v7;
}

- (AMSUIWebPlaceholderViewController)initWithModel:(id)a3 context:(id)a4 appearance:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = [(AMSUIWebPlaceholderViewController *)self initWithContext:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appearance, a5);
    objc_storeStrong((id *)&v12->_model, a3);
  }

  return v12;
}

- (AMSUIWebPlaceholderViewController)initWithSnapshot:(id)a3 context:(id)a4 appearance:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(AMSUIWebPlaceholderViewController *)self initWithContext:v9];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appearance, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x263F27B58]);
      snapshotPromise = v12->_snapshotPromise;
      v12->_snapshotPromise = v13;

      objc_initWeak(&location, v12);
      v15 = [AMSUIWebSnapshotView alloc];
      v16 = [v8 view];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __73__AMSUIWebPlaceholderViewController_initWithSnapshot_context_appearance___block_invoke;
      v20[3] = &unk_2643E37D0;
      objc_copyWeak(&v21, &location);
      uint64_t v17 = [(AMSUIWebSnapshotView *)v15 initWithView:v16 completion:v20];
      snapshotView = v12->_snapshotView;
      v12->_snapshotView = (AMSUIWebSnapshotView *)v17;

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return v12;
}

void __73__AMSUIWebPlaceholderViewController_initWithSnapshot_context_appearance___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained snapshotPromise];
  [v1 finishWithSuccess];
}

- (void)awaitSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebPlaceholderViewController *)self snapshotPromise];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__AMSUIWebPlaceholderViewController_awaitSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_2643E5630;
  id v8 = v4;
  id v6 = v4;
  [v5 addFinishBlock:v7];
}

uint64_t __65__AMSUIWebPlaceholderViewController_awaitSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebPlaceholderViewController;
  [(AMSUICommonViewController *)&v4 dealloc];
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIWebPlaceholderViewController;
  [(AMSUICommonViewController *)&v14 loadView];
  v3 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  objc_super v4 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v4, "ams_setBackgroundColor:", v3);

  id v5 = objc_opt_class();
  id v6 = [(AMSUIWebPlaceholderViewController *)self model];
  v7 = [v6 message];
  id v8 = [v5 placeholderStyleLoadingControllerWithMessage:v7];
  [(AMSUIWebPlaceholderViewController *)self setLoadingController:v8];

  id v9 = [(AMSUIWebPlaceholderViewController *)self loadingController];
  id v10 = [v9 view];
  objc_msgSend(v10, "ams_setBackgroundColor:", v3);

  objc_super v11 = [(AMSUIWebPlaceholderViewController *)self model];
  LODWORD(v10) = [v11 disableDelay];

  if (v10) {
    [(AMSUIWebPlaceholderViewController *)self _transitionToLoadingAnimated:0];
  }
  else {
    [(AMSUIWebPlaceholderViewController *)self _transitionToSnapshot];
  }
  v12 = [(AMSUIWebPlaceholderViewController *)self snapshotID];

  if (!v12)
  {
    v13 = objc_opt_new();
    [(AMSUIWebPlaceholderViewController *)self setSnapshotID:v13];
  }
}

- (void)willAppearAfterDismiss
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebPlaceholderViewController;
  [(AMSUIWebPlaceholderViewController *)&v16 viewDidDisappear:a3];
  [(AMSUIWebPlaceholderViewController *)self setIsVisible:0];
  objc_super v4 = [(AMSUIWebPlaceholderViewController *)self loadingController];
  [v4 removeMessage];

  id v5 = [(AMSUIWebPlaceholderViewController *)self context];
  int v6 = [v5 reducedMemoryMode];

  if (v6)
  {
    v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [(AMSUIWebPlaceholderViewController *)self context];
      objc_super v11 = [v10 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Reduce memory mode enabled, cleaning up snapshot", buf, 0x16u);
    }
    v12 = [(AMSUIWebPlaceholderViewController *)self removeSnapshot];
    if (v12)
    {
      v13 = [(AMSUIWebPlaceholderViewController *)self context];
      objc_super v14 = [v13 snapshotCache];
      v15 = [(AMSUIWebPlaceholderViewController *)self snapshotID];
      [v14 setObject:v12 forKey:v15];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebPlaceholderViewController;
  [(AMSUIWebPlaceholderViewController *)&v15 viewWillAppear:a3];
  [(AMSUIWebPlaceholderViewController *)self _applyAppearance];
  objc_super v4 = [(AMSUIWebPlaceholderViewController *)self context];
  int v5 = [v4 reducedMemoryMode];

  if (v5)
  {
    int v6 = [(AMSUIWebPlaceholderViewController *)self context];
    v7 = [v6 snapshotCache];
    id v8 = [(AMSUIWebPlaceholderViewController *)self snapshotID];
    uint64_t v9 = [v7 objectForKey:v8];

    if (v9)
    {
      id v10 = [(AMSUIWebPlaceholderViewController *)self snapshotView];
      [v10 updateSnapshot:v9];
    }
  }
  objc_super v11 = [(AMSUIWebPlaceholderViewController *)self snapshotView];
  if (v11)
  {
    v12 = [(AMSUIWebPlaceholderViewController *)self visibleView];
    v13 = [(AMSUIWebPlaceholderViewController *)self snapshotView];
    BOOL v14 = v12 == v13;
  }
  else
  {
    BOOL v14 = 0;
  }

  if (![(AMSUIWebPlaceholderViewController *)self hasAppeared] && !v14) {
    [(AMSUIWebPlaceholderViewController *)self _startReappearTransitionTimerAnimated:[(AMSUIWebPlaceholderViewController *)self animateFadeIn]];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebPlaceholderViewController;
  [(AMSUIWebPlaceholderViewController *)&v4 viewDidAppear:a3];
  [(AMSUIWebPlaceholderViewController *)self setIsVisible:1];
  [(AMSUIWebPlaceholderViewController *)self setHasAppeared:1];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebPlaceholderViewController;
  [(AMSUIWebPlaceholderViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(AMSUICommonViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUIWebPlaceholderViewController *)self visibleView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (id)removeSnapshot
{
  v2 = [(AMSUIWebPlaceholderViewController *)self snapshotView];
  v3 = [v2 removeSnapshot];

  return v3;
}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    objc_storeStrong((id *)&self->_appearance, a4);
    [(AMSUIWebPlaceholderViewController *)self _applyAppearance];
  }
  else
  {
    double v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      double v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      objc_super v13 = [(AMSUIWebPlaceholderViewController *)self context];
      BOOL v14 = [v13 logKey];
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid loading page model: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)_applyAppearance
{
  id v13 = [(AMSUIWebPlaceholderViewController *)self appearance];
  v3 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  uint64_t v4 = [v13 backgroundColor];
  double v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  id v7 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v7, "ams_setBackgroundColor:", v6);

  uint64_t v8 = [v13 backgroundColor];
  id v9 = (void *)v8;
  if (v8) {
    double v10 = (void *)v8;
  }
  else {
    double v10 = v3;
  }
  double v11 = [(AMSUIWebPlaceholderViewController *)self loadingController];
  uint64_t v12 = [v11 view];
  objc_msgSend(v12, "ams_setBackgroundColor:", v10);
}

- (void)_startReappearTransitionTimerAnimated:(BOOL)a3
{
  double v5 = [(AMSUIWebPlaceholderViewController *)self visibleView];
  id v6 = [(AMSUIWebPlaceholderViewController *)self loadingController];
  id v7 = [v6 view];

  if (v5 != v7)
  {
    objc_initWeak(&location, self);
    id v8 = MEMORY[0x263EF83A0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __75__AMSUIWebPlaceholderViewController__startReappearTransitionTimerAnimated___block_invoke;
    v14[3] = &unk_2643E5658;
    objc_copyWeak(&v15, &location);
    BOOL v16 = a3;
    id v9 = v14;
    double v10 = AMSLogKey();
    dispatch_time_t v11 = dispatch_time(0, 1500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_1;
    block[3] = &unk_2643E33B0;
    id v19 = v10;
    id v20 = v9;
    id v12 = v10;
    id v13 = (void *)MEMORY[0x263EF83A0];
    dispatch_after(v11, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __75__AMSUIWebPlaceholderViewController__startReappearTransitionTimerAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _transitionToLoadingAnimated:*(unsigned __int8 *)(a1 + 40)];
  [WeakRetained setSnapshotView:0];
}

- (void)_replacePrimaryViewWithView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(AMSUIWebPlaceholderViewController *)self visibleView];

  id v7 = v15;
  if (v6 != v15)
  {
    id v8 = [(AMSUIWebPlaceholderViewController *)self visibleView];
    id v9 = [(AMSUIWebPlaceholderViewController *)self loadingController];
    double v10 = [v9 view];

    if (v8 == v10)
    {
      dispatch_time_t v11 = [(AMSUIWebPlaceholderViewController *)self loadingController];
      [(AMSUICommonViewController *)self unsetChildViewController:v11];
    }
    id v12 = [(AMSUIWebPlaceholderViewController *)self visibleView];
    [v12 removeFromSuperview];

    id v13 = [(AMSUICommonViewController *)self view];
    [v13 bounds];
    objc_msgSend(v15, "setFrame:");

    BOOL v14 = [(AMSUICommonViewController *)self view];
    [v14 addSubview:v15];

    [(AMSUIWebPlaceholderViewController *)self setVisibleView:v15];
    id v7 = v15;
    if (v4)
    {
      [(AMSUIWebPlaceholderViewController *)self _animateTransition];
      id v7 = v15;
    }
  }
}

- (void)_replacePrimaryViewWithViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(AMSUIWebPlaceholderViewController *)self visibleView];
  id v7 = [v10 view];

  if (v6 != v7)
  {
    id v8 = [(AMSUIWebPlaceholderViewController *)self visibleView];
    [v8 removeFromSuperview];

    [(AMSUICommonViewController *)self setChildViewController:v10];
    id v9 = [v10 view];
    [(AMSUIWebPlaceholderViewController *)self setVisibleView:v9];

    if (v4) {
      [(AMSUIWebPlaceholderViewController *)self _animateTransition];
    }
  }
}

- (void)_animateTransition
{
  v3 = [(AMSUIWebPlaceholderViewController *)self visibleView];
  [v3 setAlpha:0.0];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__AMSUIWebPlaceholderViewController__animateTransition__block_invoke;
  v4[3] = &unk_2643E3118;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v4 options:0 animations:0.5 completion:0.0];
}

void __55__AMSUIWebPlaceholderViewController__animateTransition__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) visibleView];
  [v1 setAlpha:1.0];
}

- (void)_transitionToLoadingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AMSUIWebPlaceholderViewController *)self loadingController];
  [(AMSUIWebPlaceholderViewController *)self _replacePrimaryViewWithViewController:v5 animated:v3];
}

- (void)_transitionToSnapshot
{
  BOOL v3 = [(AMSUIWebPlaceholderViewController *)self snapshotView];

  if (v3)
  {
    id v4 = [(AMSUIWebPlaceholderViewController *)self snapshotView];
    [(AMSUIWebPlaceholderViewController *)self _replacePrimaryViewWithView:v4 animated:0];
  }
}

- (BOOL)animateFadeIn
{
  return self->_animateFadeIn;
}

- (void)setAnimateFadeIn:(BOOL)a3
{
  self->_animateFadeIn = a3;
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (AMSUIWebLoadingPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (AMSUIWebPagePresenter)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (AMSUIMessageLoadingViewController)loadingController
{
  return self->_loadingController;
}

- (void)setLoadingController:(id)a3
{
}

- (BOOL)shouldSnapshot
{
  return self->_shouldSnapshot;
}

- (void)setShouldSnapshot:(BOOL)a3
{
  self->_shouldSnapshot = a3;
}

- (NSUUID)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(id)a3
{
}

- (AMSBinaryPromise)snapshotPromise
{
  return self->_snapshotPromise;
}

- (void)setSnapshotPromise:(id)a3
{
}

- (AMSUIWebSnapshotView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (UIView)visibleView
{
  return self->_visibleView;
}

- (void)setVisibleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleView, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_snapshotPromise, 0);
  objc_storeStrong((id *)&self->_snapshotID, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_originalViewController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end