@interface IAMModalViewController
- (BOOL)shouldAutorotate;
- (BOOL)shouldPresentFullscreen;
- (BOOL)shouldUsePadLayout;
- (IAMModalViewController)init;
- (IAMViewControllerMetricsDelegate)metricsDelegate;
- (UIView)contentView;
- (UIViewController)contentViewController;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)viewControllerWillDismissBlock;
- (int64_t)preferredStatusBarStyle;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setMetricsDelegate:(id)a3;
- (void)setShouldPresentFullscreen:(BOOL)a3;
- (void)setViewControllerWillDismissBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation IAMModalViewController

- (IAMModalViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)IAMModalViewController;
  v2 = [(IAMModalViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IAMModalViewController *)v2 setModalPresentationStyle:4];
  }
  return v3;
}

- (void)viewDidLoad
{
  v34[4] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)IAMModalViewController;
  [(IAMModalViewController *)&v33 viewDidLoad];
  [(IAMModalViewController *)self setNeedsStatusBarAppearanceUpdate];
  v3 = [(IAMModalViewController *)self contentViewController];
  [(IAMModalViewController *)self addChildViewController:v3];

  v4 = [(IAMModalViewController *)self contentViewController];
  objc_super v5 = [v4 view];
  [(IAMModalViewController *)self setContentView:v5];

  v6 = [(IAMModalViewController *)self contentView];
  [v6 setClipsToBounds:1];

  v7 = [(IAMModalViewController *)self contentView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(IAMModalViewController *)self view];
  v9 = [(IAMModalViewController *)self contentView];
  [v8 addSubview:v9];

  v23 = (void *)MEMORY[0x263F08938];
  v32 = [(IAMModalViewController *)self contentView];
  v30 = [v32 topAnchor];
  v31 = [(IAMModalViewController *)self view];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v34[0] = v28;
  v27 = [(IAMModalViewController *)self contentView];
  v25 = [v27 leftAnchor];
  v26 = [(IAMModalViewController *)self view];
  v24 = [v26 leftAnchor];
  v22 = [v25 constraintEqualToAnchor:v24];
  v34[1] = v22;
  v21 = [(IAMModalViewController *)self contentView];
  v20 = [v21 rightAnchor];
  v10 = [(IAMModalViewController *)self view];
  v11 = [v10 rightAnchor];
  v12 = [v20 constraintEqualToAnchor:v11];
  v34[2] = v12;
  v13 = [(IAMModalViewController *)self contentView];
  v14 = [v13 bottomAnchor];
  v15 = [(IAMModalViewController *)self view];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v34[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  [v23 activateConstraints:v18];

  v19 = [(IAMModalViewController *)self contentViewController];
  [v19 didMoveToParentViewController:self];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(IAMModalViewController *)self viewControllerWillDismissBlock];

  if (v7)
  {
    v8 = [(IAMModalViewController *)self viewControllerWillDismissBlock];
    v8[2]();
  }
  v9.receiver = self;
  v9.super_class = (Class)IAMModalViewController;
  [(IAMModalViewController *)&v9 dismissViewControllerAnimated:v4 completion:v6];
}

- (BOOL)shouldAutorotate
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (objc_class *)MEMORY[0x263F1CCB8];
  id v9 = a4;
  v10 = (void *)[[v8 alloc] initWithPresentedViewController:v7 presentingViewController:v9];

  [v10 setDelegate:self];
  [v10 _setShouldDismissWhenTappedOutside:1];
  v11 = [v7 traitCollection];
  if ([v11 horizontalSizeClass] == 2)
  {
    v12 = [v7 traitCollection];
    BOOL v13 = [v12 userInterfaceIdiom] == 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  if ([(IAMModalViewController *)self shouldPresentFullscreen])
  {
    uint64_t v14 = [MEMORY[0x263F1CD30] _largeDetent];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __110__IAMModalViewController__presentationControllerForPresentedController_presentingController_sourceController___block_invoke;
    v18[3] = &__block_descriptor_33_e16_d16__0__UIView_8l;
    BOOL v19 = v13;
    uint64_t v14 = [MEMORY[0x263F1CD30] _detentWithContainerViewBlock:v18];
  }
  v15 = (void *)v14;
  v20[0] = v14;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  [v10 _setDetents:v16];

  if (!v13)
  {
    [v10 _setWantsBottomAttachedInCompactHeight:1];
    [v10 _setWidthFollowsPreferredContentSizeWhenBottomAttached:1];
  }

  return v10;
}

double __110__IAMModalViewController__presentationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 648.0;
  }
  [a2 safeAreaInsets];
  return 500.0 - v3;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  BOOL v4 = [(IAMModalViewController *)self metricsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(IAMModalViewController *)self metricsDelegate];
    [v6 viewController:self didReportDismissalAction:1];
  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (IAMViewControllerMetricsDelegate)metricsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);

  return (IAMViewControllerMetricsDelegate *)WeakRetained;
}

- (void)setMetricsDelegate:(id)a3
{
}

- (id)viewControllerWillDismissBlock
{
  return self->_viewControllerWillDismissBlock;
}

- (void)setViewControllerWillDismissBlock:(id)a3
{
}

- (BOOL)shouldPresentFullscreen
{
  return self->_shouldPresentFullscreen;
}

- (void)setShouldPresentFullscreen:(BOOL)a3
{
  self->_shouldPresentFullscreen = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (BOOL)shouldUsePadLayout
{
  return self->_shouldUsePadLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong(&self->_viewControllerWillDismissBlock, 0);
  objc_destroyWeak((id *)&self->_metricsDelegate);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end