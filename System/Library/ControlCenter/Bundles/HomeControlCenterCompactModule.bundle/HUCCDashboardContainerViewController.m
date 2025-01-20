@interface HUCCDashboardContainerViewController
- (BOOL)_canShowWhileLocked;
- (CGRect)expandedContentFrame;
- (CGSize)preferredExpandedSize;
- (HUCCDashboardContainerViewController)initWithDelegate:(id)a3;
- (HUCCDashboardContainerViewControllerDelegate)delegate;
- (HUCCRemoteDashboardViewController)remoteDashboardViewController;
- (NSDictionary)transitionSubviewFrames;
- (_UIAsyncInvocation)cancelServiceInvocation;
- (id)serviceViewControllerProxy;
- (void)_addNewRemoteViewController:(id)a3;
- (void)_configureAndAddRemoteViewController:(id)a3 forHome:(id)a4;
- (void)_requestRemoteViewControllerForHome:(id)a3;
- (void)_stopAndRemoveRemoteViewController;
- (void)loadView;
- (void)quickControlsPresentationDidUpdate:(BOOL)a3;
- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4;
- (void)requestDismissal;
- (void)requestLockAuthenticationForRemoteDashboard:(id)a3;
- (void)setCancelServiceInvocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteDashboardViewController:(id)a3;
- (void)setTransitionSubviewFrames:(id)a3;
- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4;
- (void)willFinishTransition:(BOOL)a3 forCompactModule:(BOOL)a4;
@end

@implementation HUCCDashboardContainerViewController

- (HUCCDashboardContainerViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCCDashboardContainerViewController;
  v5 = [(HUCCDashboardContainerViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  [(HUCCDashboardContainerViewController *)self expandedContentFrame];
  id v4 = objc_msgSend(v3, "initWithFrame:");
  [(HUCCDashboardContainerViewController *)self setView:v4];

  v5 = [MEMORY[0x263F47B60] sharedDispatcher];
  id v6 = [v5 home];

  [(HUCCDashboardContainerViewController *)self _requestRemoteViewControllerForHome:v6];
}

- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3)
  {
    v7 = [(HUCCDashboardContainerViewController *)self view];
    objc_super v8 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    v9 = [v8 view];
    [v7 addSubview:v9];
  }
  id v10 = [(HUCCDashboardContainerViewController *)self serviceViewControllerProxy];
  [v10 willBeginTransition:v5 forCompactModule:v4];
}

- (void)willFinishTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  if (!a3)
  {
    id v6 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    BOOL v5 = [v6 view];
    [v5 removeFromSuperview];
  }
}

- (id)serviceViewControllerProxy
{
  v2 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  id v3 = [v2 serviceViewControllerProxy];

  return v3;
}

- (CGRect)expandedContentFrame
{
  id v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  [(HUCCDashboardContainerViewController *)self preferredExpandedSize];
  double v6 = v5;
  if (v4 == 1)
  {
    CCUIExpandedModuleEdgeInsets();
    double v6 = v6 + v7 * 2.0;
    [(HUCCDashboardContainerViewController *)self preferredExpandedSize];
    double v9 = v8;
    CCUIExpandedModuleEdgeInsets();
    double v11 = v9 + v10 * -4.0;
  }
  else
  {
    [(HUCCDashboardContainerViewController *)self preferredExpandedSize];
    double v11 = v12;
  }
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v6;
  result.size.height = v11;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)preferredExpandedSize
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    CCUIDefaultExpandedContentModuleWidth();
    CGFloat Width = v4;
    CCUIMaximumExpandedContentModuleHeight();
  }
  else
  {
    CCUIScreenBounds();
    CGFloat Width = CGRectGetWidth(v10);
    CCUIScreenBounds();
    double Height = CGRectGetHeight(v11);
  }
  double v7 = Height;
  double v8 = Width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_requestRemoteViewControllerForHome:(id)a3
{
  id v4 = a3;
  [(HUCCDashboardContainerViewController *)self _beginDelayingPresentation:&unk_26F4C62E8 cancellationHandler:5.0];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_240656578;
  v7[3] = &unk_2650CB4D8;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  double v6 = +[HUCCRemoteDashboardViewController requestViewControllerWithConnectionHandler:v7];
  [(HUCCDashboardContainerViewController *)self setCancelServiceInvocation:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_configureAndAddRemoteViewController:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [(HUCCDashboardContainerViewController *)self _addNewRemoteViewController:v10];
    CGRect v11 = [(HUCCDashboardContainerViewController *)self serviceViewControllerProxy];
    double v12 = [v7 uniqueIdentifier];
    double v13 = [v12 UUIDString];
    [v11 configureHomeControlServiceWithHomeUUID:v13];

    objc_initWeak(&location, self);
    double v14 = [(HUCCDashboardContainerViewController *)self serviceViewControllerProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_2406567CC;
    v15[3] = &unk_2650CB500;
    objc_copyWeak(&v16, &location);
    [v14 getTransitionSubviewFramesWithCompletion:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(&cfstr_UnexpectedRemo.isa, v8);
  }
}

- (void)_stopAndRemoveRemoteViewController
{
  uint64_t v3 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];

  if (v3)
  {
    id v4 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    [v4 beginAppearanceTransition:0 animated:0];

    id v5 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    [v5 willMoveToParentViewController:0];

    id v6 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    id v7 = [v6 view];
    [v7 removeFromSuperview];

    id v8 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    id v9 = (id)[v8 disconnect];

    id v10 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    [v10 removeFromParentViewController];

    CGRect v11 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
    [v11 endAppearanceTransition];

    [(HUCCDashboardContainerViewController *)self setRemoteDashboardViewController:0];
  }
}

- (void)_addNewRemoteViewController:(id)a3
{
  id v4 = a3;
  [(HUCCDashboardContainerViewController *)self _stopAndRemoveRemoteViewController];
  [(HUCCDashboardContainerViewController *)self setRemoteDashboardViewController:v4];

  id v5 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  [v5 setDelegate:self];

  id v6 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  [v6 beginAppearanceTransition:1 animated:0];

  id v7 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  [(HUCCDashboardContainerViewController *)self addChildViewController:v7];

  id v8 = [(HUCCDashboardContainerViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  v18 = [v17 view];
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  v19 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  v20 = [v19 view];
  [v20 setAutoresizingMask:18];

  v21 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  [v21 didMoveToParentViewController:self];

  id v22 = [(HUCCDashboardContainerViewController *)self remoteDashboardViewController];
  [v22 endAppearanceTransition];
}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_240657538((uint64_t)v5, v6);
  }

  [(HUCCDashboardContainerViewController *)self setRemoteDashboardViewController:0];
}

- (void)requestDismissal
{
  id v2 = [(HUCCDashboardContainerViewController *)self delegate];
  [v2 requestDismissal];
}

- (void)requestLockAuthenticationForRemoteDashboard:(id)a3
{
  id v4 = [(HUCCDashboardContainerViewController *)self delegate];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_240656C04;
  v5[3] = &unk_2650CB3A0;
  v5[4] = self;
  [v4 requestAuthenticationIfLockedWithCompletionHandler:v5];
}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUCCDashboardContainerViewController *)self delegate];
  [v4 quickControlsPresentationDidUpdate:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSDictionary)transitionSubviewFrames
{
  return self->_transitionSubviewFrames;
}

- (void)setTransitionSubviewFrames:(id)a3
{
}

- (HUCCRemoteDashboardViewController)remoteDashboardViewController
{
  return self->_remoteDashboardViewController;
}

- (void)setRemoteDashboardViewController:(id)a3
{
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setCancelServiceInvocation:(id)a3
{
}

- (HUCCDashboardContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCDashboardContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
  objc_storeStrong((id *)&self->_remoteDashboardViewController, 0);

  objc_storeStrong((id *)&self->_transitionSubviewFrames, 0);
}

@end