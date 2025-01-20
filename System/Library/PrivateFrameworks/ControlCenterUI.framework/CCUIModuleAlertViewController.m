@interface CCUIModuleAlertViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4;
- (CCSModulePresentationOptions)presentationOptions;
- (CCUIModuleAlertViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4;
- (CCUIModuleAlertViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4 mainViewController:(id)a5;
- (CCUIModuleAlertViewControllerDelegate)delegate;
- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3;
- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3;
- (NSString)moduleIdentifier;
- (UIView)moduleAlertView;
- (double)backgroundViewWeighting;
- (void)contentModuleContainerViewControllerDismissPresentedContent:(id)a3;
- (void)dismissModulePresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setBackgroundViewWeighting:(double)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CCUIModuleAlertViewController

- (CCUIModuleAlertViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4
{
  return [(CCUIModuleAlertViewController *)self initWithModuleIdentifier:a3 presentationOptions:a4 mainViewController:0];
}

- (CCUIModuleAlertViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4 mainViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"CCUIModuleAlertViewController.m", 46, @"Invalid parameter not satisfying: %@", @"moduleIdentifier" object file lineNumber description];
  }
  v12 = [v11 moduleInstanceManager];
  v13 = [v12 loadAlertModuleWithBundleIdentifier:v9];
  if (!v13)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"CCUIModuleAlertViewController.m", 51, @"Unable to load module instance '%@'", v9 object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)CCUIModuleAlertViewController;
  v14 = [(CCUIModuleAlertViewController *)&v36 initWithNibName:0 bundle:0];
  if (v14)
  {
    uint64_t v15 = [v9 copy];
    moduleIdentifier = v14->_moduleIdentifier;
    v14->_moduleIdentifier = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    presentationOptions = v14->_presentationOptions;
    v14->_presentationOptions = (CCSModulePresentationOptions *)v17;

    objc_storeStrong((id *)&v14->_moduleInstance, v13);
    v19 = [CCUIContentModuleContainerViewController alloc];
    v20 = [(CCUIModuleInstance *)v14->_moduleInstance metadata];
    v21 = [v20 moduleIdentifier];
    id v35 = v10;
    id v22 = objc_alloc(MEMORY[0x1E4F29128]);
    [(CCUIModuleInstance *)v14->_moduleInstance uniqueIdentifier];
    id v33 = v11;
    v23 = id v34 = v9;
    v24 = (void *)[v22 initWithUUIDString:v23];
    v25 = [(CCUIModuleInstance *)v14->_moduleInstance module];
    [MEMORY[0x1E4F5ADF0] defaultAlertPresentationContext];
    v27 = v26 = v12;
    uint64_t v28 = [(CCUIContentModuleContainerViewController *)v19 initWithModuleIdentifier:v21 uniqueIdentifier:v24 contentModule:v25 presentationContext:v27];
    moduleContainerViewController = v14->_moduleContainerViewController;
    v14->_moduleContainerViewController = (CCUIContentModuleContainerViewController *)v28;

    v12 = v26;
    id v10 = v35;

    id v11 = v33;
    id v9 = v34;

    [(CCUIContentModuleContainerViewController *)v14->_moduleContainerViewController setDelegate:v14];
    [(CCUIModuleAlertViewController *)v14 addChildViewController:v14->_moduleContainerViewController];
  }

  return v14;
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(CCUIModuleAlertViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)CCUIModuleAlertViewController;
  [(CCUIModuleAlertViewController *)&v15 viewDidLoad];
  id v3 = [MEMORY[0x1E4F5AE08] _auxiliaryMaterialView];
  blurView = self->_blurView;
  self->_blurView = v3;

  v5 = self->_blurView;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [(MTMaterialView *)v5 setGroupNameBase:v7];

  [(MTMaterialView *)self->_blurView setWeighting:0.0];
  [(MTMaterialView *)self->_blurView setAutoresizingMask:18];
  v8 = [(CCUIModuleAlertViewController *)self view];
  [v8 addSubview:self->_blurView];

  id v9 = objc_alloc(MEMORY[0x1E4F5AE68]);
  id v10 = [(CCUIModuleAlertViewController *)self view];
  [v10 bounds];
  id v11 = (UIView *)objc_msgSend(v9, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v11;

  [(UIView *)self->_contentView setAutoresizingMask:18];
  v13 = [(CCUIModuleAlertViewController *)self view];
  [v13 addSubview:self->_contentView];

  v14 = [(CCUIContentModuleContainerViewController *)self->_moduleContainerViewController view];
  [v14 setAutoresizingMask:18];
  [(UIView *)self->_contentView addSubview:v14];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIModuleAlertViewController;
  [(CCUIModuleAlertViewController *)&v4 viewWillLayoutSubviews];
  if (![(CCUIContentModuleContainerViewController *)self->_moduleContainerViewController isExpanded])
  {
    id v3 = [(CCUIContentModuleContainerViewController *)self->_moduleContainerViewController contentViewController];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [v3 shouldBeginTransitionToExpandedContentModule])
    {
      [(CCUIContentModuleContainerViewController *)self->_moduleContainerViewController setExpanded:1];
      if (objc_opt_respondsToSelector()) {
        [v3 willTransitionToExpandedContentMode:1];
      }
      [(CCUIContentModuleContainerViewController *)self->_moduleContainerViewController transitionToExpandedMode:1];
      if (objc_opt_respondsToSelector()) {
        [v3 didTransitionToExpandedContentMode:1];
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIModuleAlertViewController;
  [(CCUIModuleAlertViewController *)&v4 viewDidAppear:a3];
  [(MTMaterialView *)self->_blurView setContentReplacedWithSnapshot:UIAccessibilityIsReduceTransparencyEnabled()];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIModuleAlertViewController;
  [(CCUIModuleAlertViewController *)&v4 viewWillDisappear:a3];
  [(MTMaterialView *)self->_blurView setContentReplacedWithSnapshot:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)moduleAlertView
{
  return (UIView *)[(CCUIContentModuleContainerViewController *)self->_moduleContainerViewController view];
}

- (double)backgroundViewWeighting
{
  [(MTMaterialView *)self->_blurView weighting];
  return result;
}

- (void)setBackgroundViewWeighting:(double)a3
{
}

- (void)dismissModulePresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
}

- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3
{
  id v3 = [(CCUIModuleAlertViewController *)self compactModeSourceViewForContentModuleContainerViewController:a3];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4
{
  return 1;
}

- (void)contentModuleContainerViewControllerDismissPresentedContent:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__CCUIModuleAlertViewController_contentModuleContainerViewControllerDismissPresentedContent___block_invoke;
  v3[3] = &unk_1E6A8A250;
  v3[4] = self;
  [(CCUIModuleAlertViewController *)self dismissModulePresentedContentAnimated:1 completion:v3];
}

void __93__CCUIModuleAlertViewController_contentModuleContainerViewControllerDismissPresentedContent___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1024));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1024));
      [v5 contentModuleAlertViewControllerNeedsDismissal:*(void *)(a1 + 32)];
    }
  }
}

- (CCSModulePresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (CCUIModuleAlertViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUIModuleAlertViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_moduleInstance, 0);

  objc_storeStrong((id *)&self->_moduleContainerViewController, 0);
}

@end