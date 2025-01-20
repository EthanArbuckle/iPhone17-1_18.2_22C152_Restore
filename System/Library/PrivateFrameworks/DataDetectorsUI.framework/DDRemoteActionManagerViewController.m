@interface DDRemoteActionManagerViewController
- (BOOL)previewMode;
- (DDRemoteAction)action;
- (DDRemoteActionManagerViewController)initWithAction:(id)a3;
- (NSCopying)request;
- (NSExtension)extension;
- (id)controllerVerticalMargin;
- (id)doneButton;
- (id)emptyViewcontroller;
- (void)DDRemoteActionDidTerminateWithError:(id)a3;
- (void)addHitOverlay;
- (void)dealloc;
- (void)dismissViewController;
- (void)loadNavigationControllerIfNeeded;
- (void)loadRemoteAction;
- (void)loadTitleBarIfNeeded;
- (void)presentRemoteViewController;
- (void)removeLoadingViewToShowView:(id)a3;
- (void)setAction:(id)a3;
- (void)setExtension:(id)a3;
- (void)setPreviewMode:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)showErrorView;
- (void)showLoadingView;
- (void)showRemoteController;
- (void)unloadRemoteAction;
- (void)updatePreviewMode;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DDRemoteActionManagerViewController

- (void)dealloc
{
  [(DDRemoteActionManagerViewController *)self unloadRemoteAction];
  v3.receiver = self;
  v3.super_class = (Class)DDRemoteActionManagerViewController;
  [(DDRemoteActionManagerViewController *)&v3 dealloc];
}

- (void)viewWillDisappear:(BOOL)a3
{
  self->_shouldDeferPresenting = 1;
  v3.receiver = self;
  v3.super_class = (Class)DDRemoteActionManagerViewController;
  [(DDRemoteActionManagerViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = a3;
  self->_shouldDeferPresenting = 0;
  p_preferredContentSize = &self->_preferredContentSize;
  if (self->_preferredContentSize.height != 0.0)
  {
    double width = p_preferredContentSize->width;
    if (p_preferredContentSize->width != 0.0) {
      [(DDRemoteActionManagerViewController *)self setPreferredContentSize:width];
    }
  }
  [(DDRemoteActionManagerViewController *)self showRemoteController];
  v7.receiver = self;
  v7.super_class = (Class)DDRemoteActionManagerViewController;
  [(DDRemoteActionManagerViewController *)&v7 viewWillAppear:v4];
}

- (DDRemoteActionManagerViewController)initWithAction:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DDRemoteActionManagerViewController;
  v5 = [(DDRemoteActionManagerViewController *)&v19 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    objc_super v7 = [(DDRemoteActionManagerViewController *)v5 view];
    [v7 setBackgroundColor:v6];

    [(DDRemoteActionManagerViewController *)v5 setAction:v4];
    uint64_t v8 = [v4 platterTitle];
    platterTitle = v5->_platterTitle;
    v5->_platterTitle = (NSString *)v8;

    v10 = [(DDRemoteActionManagerViewController *)v5 action];
    [v10 suggestedContentSize];
    v5->_preferredContentSize.double width = v11;
    v5->_preferredContentSize.height = v12;

    [(DDRemoteActionManagerViewController *)v5 loadNavigationControllerIfNeeded];
    [(DDRemoteActionManagerViewController *)v5 addHitOverlay];
    [(DDRemoteActionManagerViewController *)v5 loadTitleBarIfNeeded];
    [(DDRemoteActionManagerViewController *)v5 loadRemoteAction];
    v5->_previewMode = 1;
    [(DDRemoteActionManagerViewController *)v5 updatePreviewMode];
    v5->_loaded = 0;
    dispatch_time_t v13 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__DDRemoteActionManagerViewController_initWithAction___block_invoke;
    block[3] = &unk_1E5A853B0;
    v14 = v5;
    v18 = v14;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
    v15 = v14;
  }
  return v5;
}

uint64_t __54__DDRemoteActionManagerViewController_initWithAction___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 1056) && !*(void *)(result + 1000)) {
    return [(id)result showLoadingView];
  }
  return result;
}

- (id)doneButton
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_dismissViewController];
  return v2;
}

- (id)emptyViewcontroller
{
  objc_super v3 = objc_opt_new();
  [v3 setTitle:self->_platterTitle];
  id v4 = [(DDRemoteActionManagerViewController *)self doneButton];
  v5 = [v3 navigationItem];
  [v5 setRightBarButtonItem:v4];

  return v3;
}

- (void)loadNavigationControllerIfNeeded
{
  v29[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(DDRemoteActionManagerViewController *)self action];
  int v4 = [v3 wantsSeamlessCommit];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42BF8]);
    v6 = [(DDRemoteActionManagerViewController *)self emptyViewcontroller];
    objc_super v7 = (UINavigationController *)[v5 initWithRootViewController:v6];
    navigationController = self->_navigationController;
    self->_navigationController = v7;

    v9 = [(UINavigationController *)self->_navigationController view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(DDRemoteActionManagerViewController *)self addChildViewController:self->_navigationController];
    v10 = [(DDRemoteActionManagerViewController *)self view];
    CGFloat v11 = [(UINavigationController *)self->_navigationController view];
    [v10 addSubview:v11];

    CGFloat v12 = [(DDRemoteActionManagerViewController *)self view];
    dispatch_time_t v13 = (void *)MEMORY[0x1E4F28DC8];
    v28 = @"nc";
    v14 = [(UINavigationController *)self->_navigationController view];
    v29[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v16 = [v13 constraintsWithVisualFormat:@"H:|[nc]|" options:0 metrics:0 views:v15];
    [v12 addConstraints:v16];

    v17 = [(UINavigationController *)self->_navigationController view];
    v18 = [v17 topAnchor];
    objc_super v19 = [(DDRemoteActionManagerViewController *)self view];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    navControllerTopConstraint = self->_navControllerTopConstraint;
    self->_navControllerTopConstraint = v21;

    v23 = [(UINavigationController *)self->_navigationController view];
    v24 = [v23 bottomAnchor];
    v25 = [(DDRemoteActionManagerViewController *)self view];
    v26 = [v25 bottomAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v27 setActive:1];
  }
}

- (void)dismissViewController
{
  [(DDRemoteActionManagerViewController *)self dismissViewControllerAnimated:1 completion:0];
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;
}

- (void)loadTitleBarIfNeeded
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v37 = [(DDRemoteActionManagerViewController *)self action];
  objc_super v3 = [v37 platterTitle];
  if (v3)
  {
    titleBar = self->_titleBar;

    if (!titleBar)
    {
      id v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      v6 = self->_titleBar;
      self->_titleBar = v5;

      objc_super v7 = [(DDRemoteActionManagerViewController *)self view];
      [v7 addSubview:self->_titleBar];

      [(UIView *)self->_titleBar setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v8 = [(DDRemoteActionManagerViewController *)self view];
      v9 = (void *)MEMORY[0x1E4F28DC8];
      v10 = self->_titleBar;
      v44 = @"bar";
      v45[0] = v10;
      CGFloat v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      CGFloat v12 = [v9 constraintsWithVisualFormat:@"H:|[bar]|" options:0 metrics:0 views:v11];
      [v8 addConstraints:v12];

      dispatch_time_t v13 = [(DDRemoteActionManagerViewController *)self view];
      v14 = (void *)MEMORY[0x1E4F28DC8];
      v15 = self->_titleBar;
      v42 = @"bar";
      v43 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v17 = [v14 constraintsWithVisualFormat:@"V:|[bar(46)]" options:0 metrics:0 views:v16];
      [v13 addConstraints:v17];

      v18 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
      [(UIView *)self->_titleBar setBackgroundColor:v18];

      id v19 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      [(UIView *)self->_titleBar addSubview:v19];
      [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
      v20 = self->_titleBar;
      v21 = (void *)MEMORY[0x1E4F28DC8];
      v40 = @"line";
      id v41 = v19;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v23 = [v21 constraintsWithVisualFormat:@"H:|[line]|" options:0 metrics:0 views:v22];
      [(UIView *)v20 addConstraints:v23];

      v24 = self->_titleBar;
      v25 = (void *)MEMORY[0x1E4F28DC8];
      v38 = @"line";
      id v39 = v19;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      v27 = [v25 constraintsWithVisualFormat:@"V:[line(1)]|" options:0 metrics:0 views:v26];
      [(UIView *)v24 addConstraints:v27];

      v28 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
      [v19 setBackgroundColor:v28];

      v29 = objc_opt_new();
      [(UIView *)self->_titleBar addSubview:v29];
      [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
      v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v29 attribute:9 relatedBy:0 toItem:self->_titleBar attribute:9 multiplier:1.0 constant:0.0];
      [v30 setActive:1];

      v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:v29 attribute:7 relatedBy:0 toItem:self->_titleBar attribute:7 multiplier:1.0 constant:-10.0];
      [v31 setActive:1];

      v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:v29 attribute:10 relatedBy:0 toItem:self->_titleBar attribute:10 multiplier:1.0 constant:0.0];
      [v32 setActive:1];

      v33 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0 weight:*MEMORY[0x1E4F43930]];
      [v29 setFont:v33];

      v34 = [MEMORY[0x1E4F428B8] labelColor];
      [v29 setTextColor:v34];

      [v29 setTextAlignment:1];
      [v29 setLineBreakMode:4];
      v35 = [(DDRemoteActionManagerViewController *)self action];
      v36 = [v35 platterTitle];
      [v29 setText:v36];
    }
  }
  else
  {
  }
}

- (void)loadRemoteAction
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Fail to get DataDetectorsUI ActionsExtension (error %@)", (uint8_t *)&v1, 0xCu);
}

void __55__DDRemoteActionManagerViewController_loadRemoteAction__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  CGFloat v11 = WeakRetained;
  if (v9 || !WeakRetained)
  {
    [WeakRetained showErrorView];
  }
  else
  {
    [WeakRetained setRequest:v7];
    [v11 setExtension:*(void *)(a1 + 32)];
    id v12 = v8;
    objc_storeStrong(v11 + 122, a3);
    [v12 setDelegate:v11];
    dispatch_time_t v13 = [*(id *)(a1 + 32) _extensionContextForUUID:v7];
    objc_storeStrong(v11 + 123, v13);
    objc_msgSend(v13, "enableUserInteraction:", objc_msgSend(v11, "previewMode") ^ 1);
    uint64_t v14 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__DDRemoteActionManagerViewController_loadRemoteAction__block_invoke_2;
    v15[3] = &unk_1E5A853D8;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    [v13 prepareViewControllerWithContext:v14 completionHandler:v15];
    objc_destroyWeak(&v16);
  }
}

void __55__DDRemoteActionManagerViewController_loadRemoteAction__block_invoke_2(uint64_t a1, int a2, double a3, double a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (a2 && WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1056) = 1;
    *((double *)WeakRetained + 134) = a3;
    *((double *)WeakRetained + 135) = a4;
    objc_msgSend(WeakRetained, "setPreferredContentSize:", a3, a4);
    [v8 showRemoteController];
  }
  else
  {
    [WeakRetained showErrorView];
  }
}

- (void)showRemoteController
{
  if (self->_loaded && !self->_displayed && !self->_shouldDeferPresenting)
  {
    self->_displayed = 1;
    [(DDRemoteActionManagerViewController *)self updatePreviewMode];
    navigationController = self->_navigationController;
    if (!navigationController) {
      navigationController = self->_remoteViewController;
    }
    id v4 = [navigationController view];
    [(DDRemoteActionManagerViewController *)self removeLoadingViewToShowView:v4];
  }
}

- (void)presentRemoteViewController
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (self->_navigationController)
  {
    uint64_t v3 = [(DDRemoteActionManagerViewController *)self doneButton];
    id v4 = [(DDRemoteActionHostViewController *)self->_remoteViewController navigationItem];
    [v4 setRightBarButtonItem:v3];

    [(DDRemoteActionHostViewController *)self->_remoteViewController setTitle:self->_platterTitle];
    navigationController = self->_navigationController;
    v30[0] = self->_remoteViewController;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [(UINavigationController *)navigationController setViewControllers:v6];

    if (!self->_titleBar) {
      return;
    }
    titleBarBottomConstraint = self->_titleBarBottomConstraint;
    if (titleBarBottomConstraint) {
      [(NSLayoutConstraint *)titleBarBottomConstraint setActive:0];
    }
    id v8 = [(UINavigationController *)self->_navigationController view];
    id v9 = [v8 topAnchor];
    v10 = [(UIView *)self->_titleBar bottomAnchor];
    CGFloat v11 = [v9 constraintEqualToAnchor:v10];
    id v12 = self->_titleBarBottomConstraint;
    self->_titleBarBottomConstraint = v11;
  }
  else
  {
    [(DDRemoteActionManagerViewController *)self addChildViewController:self->_remoteViewController];
    dispatch_time_t v13 = [(DDRemoteActionManagerViewController *)self view];
    uint64_t v14 = [(DDRemoteActionHostViewController *)self->_remoteViewController view];
    [v13 insertSubview:v14 below:self->_hitView];

    v15 = [(DDRemoteActionHostViewController *)self->_remoteViewController view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v16 = [(DDRemoteActionManagerViewController *)self view];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    v28 = @"vc";
    v18 = [(DDRemoteActionHostViewController *)self->_remoteViewController view];
    v29 = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v20 = [v17 constraintsWithVisualFormat:@"H:|[vc]|" options:0 metrics:0 views:v19];
    [v16 addConstraints:v20];

    if ([(DDRemoteActionManagerViewController *)self previewMode] && self->_titleBar)
    {
      id v8 = [(DDRemoteActionManagerViewController *)self view];
      titleBar = self->_titleBar;
      v22 = (void *)MEMORY[0x1E4F28DC8];
      v26[1] = @"vc";
      v27[0] = titleBar;
      v26[0] = @"titleBar";
      id v9 = [(DDRemoteActionHostViewController *)self->_remoteViewController view];
      v27[1] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      v23 = @"V:[titleBar][vc]|";
    }
    else
    {
      id v8 = [(DDRemoteActionManagerViewController *)self view];
      v22 = (void *)MEMORY[0x1E4F28DC8];
      id v9 = [(DDRemoteActionHostViewController *)self->_remoteViewController view];
      v25 = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v23 = @"V:|[vc]|";
    }
    id v12 = [v22 constraintsWithVisualFormat:v23 options:0 metrics:0 views:v10];
    [v8 addConstraints:v12];
  }
}

- (void)addHitOverlay
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!self->_hitView)
  {
    uint64_t v3 = (UIView *)objc_opt_new();
    hitView = self->_hitView;
    self->_hitView = v3;

    [(UIView *)self->_hitView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [(DDRemoteActionManagerViewController *)self view];
    [v5 addSubview:self->_hitView];

    v6 = [(UIView *)self->_hitView layer];
    [v6 setHitTestsAsOpaque:1];

    id v7 = [(DDRemoteActionManagerViewController *)self view];
    id v8 = (void *)MEMORY[0x1E4F28DC8];
    id v9 = self->_hitView;
    id v19 = @"hitView";
    v20[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    CGFloat v11 = [v8 constraintsWithVisualFormat:@"H:|[hitView]|" options:0 metrics:0 views:v10];
    [v7 addConstraints:v11];

    id v12 = [(DDRemoteActionManagerViewController *)self view];
    dispatch_time_t v13 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v14 = self->_hitView;
    v17 = @"hitView";
    v18 = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v16 = [v13 constraintsWithVisualFormat:@"V:|[hitView]|" options:0 metrics:0 views:v15];
    [v12 addConstraints:v16];
  }
}

- (void)updatePreviewMode
{
  serviceContext = self->_serviceContext;
  if (serviceContext) {
    [(DDRemoteActionViewServiceProtocol *)serviceContext enableUserInteraction:!self->_previewMode];
  }
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    id v5 = [(DDRemoteActionHostViewController *)remoteViewController parentViewController];

    if (v5)
    {
      [(DDRemoteActionHostViewController *)self->_remoteViewController removeFromParentViewController];
      v6 = [(DDRemoteActionHostViewController *)self->_remoteViewController view];
      [v6 removeFromSuperview];
    }
    [(DDRemoteActionManagerViewController *)self presentRemoteViewController];
  }
  navigationController = self->_navigationController;
  if (navigationController) {
    [(UINavigationController *)navigationController setNavigationBarHidden:self->_previewMode];
  }
  [(UIView *)self->_titleBar setHidden:!self->_previewMode];
  [(UIView *)self->_hitView setHidden:!self->_previewMode];
  [(NSLayoutConstraint *)self->_titleBarBottomConstraint setActive:self->_previewMode];
  [(NSLayoutConstraint *)self->_navControllerTopConstraint setActive:!self->_previewMode];
  if (self->_previewMode) {
    id v8 = 0;
  }
  else {
    id v8 = self;
  }
  objc_storeStrong((id *)&self->_strongSelf, v8);
}

- (void)setPreviewMode:(BOOL)a3
{
  if (self->_previewMode != a3)
  {
    self->_previewMode = a3;
    [(DDRemoteActionManagerViewController *)self updatePreviewMode];
  }
}

- (void)unloadRemoteAction
{
  uint64_t v3 = [(DDRemoteActionManagerViewController *)self request];

  if (v3)
  {
    id v4 = [(DDRemoteActionManagerViewController *)self extension];
    id v5 = [(DDRemoteActionManagerViewController *)self request];
    [v4 cancelExtensionRequestWithIdentifier:v5];

    [(DDRemoteActionManagerViewController *)self setRequest:0];
  }
}

- (id)controllerVerticalMargin
{
  uint64_t v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 statusBarFrame];
  double v5 = v4;
  double v7 = v6;

  if (v5 < v7) {
    double v7 = v5;
  }
  id v8 = [(UINavigationController *)self->_navigationController navigationBar];
  [v8 size];
  double v10 = v9;

  CGFloat v11 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v11 numberWithDouble:v7 + v10];
}

- (void)showLoadingView
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (!self->_loadingView)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    loadingDate = self->_loadingDate;
    self->_loadingDate = v3;

    double v5 = (UIView *)objc_opt_new();
    loadingView = self->_loadingView;
    self->_loadingView = v5;

    double v7 = [(DDRemoteActionManagerViewController *)self view];
    [v7 addSubview:self->_loadingView];

    [(UIView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [(DDRemoteActionManagerViewController *)self view];
    double v9 = (void *)MEMORY[0x1E4F28DC8];
    double v10 = self->_loadingView;
    v47 = @"lv";
    v48[0] = v10;
    CGFloat v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    id v12 = [v9 constraintsWithVisualFormat:@"H:|[lv]|" options:0 metrics:0 views:v11];
    [v8 addConstraints:v12];

    dispatch_time_t v13 = [(DDRemoteActionManagerViewController *)self view];
    uint64_t v14 = (void *)MEMORY[0x1E4F28DC8];
    v45 = @"margin";
    v15 = [(DDRemoteActionManagerViewController *)self controllerVerticalMargin];
    v46 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v17 = self->_loadingView;
    v43 = @"lv";
    v44 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v19 = [v14 constraintsWithVisualFormat:@"V:|-(margin)-[lv]|" options:0 metrics:v16 views:v18];
    [v13 addConstraints:v19];

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42708]), "initWithFrame:", 135.0, 140.0, 50.0, 50.0);
    [(UIView *)self->_loadingView addSubview:v20];
    [v20 setActivityIndicatorViewStyle:100];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:9 relatedBy:0 toItem:self->_loadingView attribute:9 multiplier:1.0 constant:0.0];
    [v21 setActive:1];

    v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:10 relatedBy:0 toItem:self->_loadingView attribute:10 multiplier:1.0 constant:-23.0];
    [v22 setActive:1];

    [v20 startAnimating];
    v23 = objc_opt_new();
    [(UIView *)self->_loadingView addSubview:v23];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:v23 attribute:9 relatedBy:0 toItem:self->_loadingView attribute:9 multiplier:1.0 constant:0.0];
    [v24 setActive:1];

    v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:v23 attribute:3 relatedBy:0 toItem:v20 attribute:3 multiplier:1.0 constant:30.0];
    [v25 setActive:1];

    uint64_t v26 = *MEMORY[0x1E4F43850];
    v40[0] = *MEMORY[0x1E4F43858];
    v40[1] = v26;
    v41[0] = &unk_1EF50FDE0;
    v41[1] = &unk_1EF50FDF8;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    v42 = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];

    uint64_t v29 = *MEMORY[0x1E4F43808];
    v39[0] = v28;
    uint64_t v30 = *MEMORY[0x1E4F43810];
    v38[0] = v29;
    v38[1] = v30;
    v31 = _UISystemFontName();
    v39[1] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

    v33 = (void *)[objc_alloc(MEMORY[0x1E4F42A38]) initWithFontAttributes:v32];
    v34 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v33 size:14.0];
    [v23 setFont:v34];

    v35 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v23 setTextColor:v35];

    v36 = DDLocalizedString(@"LOADING");
    [v23 setText:v36];

    [(UIView *)self->_loadingView setAlpha:0.0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54__DDRemoteActionManagerViewController_showLoadingView__block_invoke;
    v37[3] = &unk_1E5A853B0;
    v37[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v37 animations:0.2];
  }
}

uint64_t __54__DDRemoteActionManagerViewController_showLoadingView__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:1.0];
}

- (void)removeLoadingViewToShowView:(id)a3
{
  id v4 = a3;
  if (self->_loadingView)
  {
    [(NSDate *)self->_loadingDate timeIntervalSinceNow];
    double v6 = fmin(v5 + 0.3, 0.0);
    [v4 setAlpha:0.0];
    double v7 = (void *)MEMORY[0x1E4F42FF0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke;
    v9[3] = &unk_1E5A85428;
    id v10 = v4;
    CGFloat v11 = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke_2;
    v8[3] = &unk_1E5A85450;
    v8[4] = self;
    [v7 animateWithDuration:0 delay:v9 options:v8 animations:0.2 completion:v6];
  }
}

uint64_t __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 992);
  return [v2 setAlpha:0.0];
}

void __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 992) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 992);
  *(void *)(v2 + 992) = 0;
}

- (void)showErrorView
{
  v45[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v3 = (UIView *)objc_opt_new();
    errorView = self->_errorView;
    self->_errorView = v3;

    double v5 = [(DDRemoteActionManagerViewController *)self view];
    [v5 addSubview:self->_errorView];

    [(UIView *)self->_errorView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [(DDRemoteActionManagerViewController *)self view];
    double v7 = (void *)MEMORY[0x1E4F28DC8];
    id v8 = self->_errorView;
    v44 = @"ev";
    v45[0] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    id v10 = [v7 constraintsWithVisualFormat:@"H:|[ev]|" options:0 metrics:0 views:v9];
    [v6 addConstraints:v10];

    CGFloat v11 = [(DDRemoteActionManagerViewController *)self view];
    id v12 = (void *)MEMORY[0x1E4F28DC8];
    v42 = @"margin";
    dispatch_time_t v13 = [(DDRemoteActionManagerViewController *)self controllerVerticalMargin];
    v43 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v15 = self->_errorView;
    v40 = @"ev";
    id v41 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v17 = [v12 constraintsWithVisualFormat:@"V:|-(margin)-[ev]|" options:0 metrics:v14 views:v16];
    [v11 addConstraints:v17];

    v18 = objc_opt_new();
    [(UIView *)self->_errorView addSubview:v18];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:9 relatedBy:0 toItem:self->_errorView attribute:9 multiplier:1.0 constant:0.0];
    [v19 setActive:1];

    v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:10 relatedBy:0 toItem:self->_errorView attribute:10 multiplier:1.0 constant:-23.0];
    [v20 setActive:1];

    uint64_t v21 = *MEMORY[0x1E4F43850];
    v37[0] = *MEMORY[0x1E4F43858];
    v37[1] = v21;
    v38[0] = &unk_1EF50FDE0;
    v38[1] = &unk_1EF50FDF8;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    id v39 = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];

    uint64_t v24 = *MEMORY[0x1E4F43808];
    v36[0] = v23;
    uint64_t v25 = *MEMORY[0x1E4F43810];
    v35[0] = v24;
    v35[1] = v25;
    uint64_t v26 = _UISystemFontName();
    v36[1] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

    v28 = (void *)[objc_alloc(MEMORY[0x1E4F42A38]) initWithFontAttributes:v27];
    uint64_t v29 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v28 size:14.0];
    [v18 setFont:v29];

    uint64_t v30 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v18 setTextColor:v30];

    v31 = DDLocalizedString(@"Preview not available");
    [v18 setText:v31];

    if (self->_loadingView)
    {
      [(DDRemoteActionManagerViewController *)self removeLoadingViewToShowView:self->_errorView];
    }
    else if (self->_remoteViewController)
    {
      [(UIView *)self->_errorView setAlpha:0.0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_2;
      v33[3] = &unk_1E5A853B0;
      v33[4] = self;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_3;
      v32[3] = &unk_1E5A85450;
      v32[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v33 animations:v32 completion:0.2];
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__DDRemoteActionManagerViewController_showErrorView__block_invoke;
    block[3] = &unk_1E5A853B0;
    void block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__DDRemoteActionManagerViewController_showErrorView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showErrorView];
}

void __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) setAlpha:1.0];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 976) view];
  [v2 setAlpha:0.0];
}

void __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_3(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1040);
  if (v3)
  {
    id v4 = [(id)v2 emptyViewcontroller];
    v9[0] = v4;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v3 setViewControllers:v5];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  double v6 = [*(id *)(v2 + 976) view];
  [v6 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 32) + 976) removeFromParentViewController];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 976);
  *(void *)(v7 + 976) = 0;
}

- (void)DDRemoteActionDidTerminateWithError:(id)a3
{
  if (a3) {
    [(DDRemoteActionManagerViewController *)self showErrorView];
  }
}

- (BOOL)previewMode
{
  return self->_previewMode;
}

- (DDRemoteAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (DDRemoteAction *)WeakRetained;
}

- (void)setAction:(id)a3
{
}

- (NSExtension)extension
{
  return (NSExtension *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)request
{
  return (NSCopying *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_platterTitle, 0);
  objc_storeStrong((id *)&self->_loadingDate, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_hitView, 0);
  objc_storeStrong((id *)&self->_navControllerTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleBar, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end