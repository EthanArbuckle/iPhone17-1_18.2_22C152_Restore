@interface CNFSettingsViewController
- (BOOL)_hasPendingDeepLink;
- (CNFPendingDeepLinkRepresentation)pendingDeepLinkRepresentation;
- (CNFSettingsViewController)init;
- (PSController)_currentChildViewController;
- (id)name;
- (id)settingsClassName;
- (id)specifierTitle;
- (int64_t)serviceType;
- (void)_invokePendingDeepLink;
- (void)_loadChildViewController;
- (void)applicationDidResume;
- (void)containerViewControllerShouldUpdate:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setPendingDeepLinkRepresentation:(id)a3;
- (void)set_currentChildViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNFSettingsViewController

- (CNFSettingsViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNFSettingsViewController;
  v2 = [(CNFSettingsViewController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F4A568] sharedInstance];
    v4 = [(CNFSettingsViewController *)v2 name];
    [v3 addListenerID:v4 capabilities:*MEMORY[0x263F4A888]];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_containerViewControllerShouldUpdate_ name:@"CNFSettingsViewControllerNeedsContainerUpdate" object:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CNFSettingsViewController;
  [(CNFSettingsViewController *)&v10 viewDidLoad];
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Container – viewDidLoad", v9, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  v4 = [MEMORY[0x263F4A568] sharedInstance];
  char v5 = [v4 isConnected];

  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x263F4A568] sharedInstance];
    [v6 blockUntilConnected];
  }
  objc_super v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    CNFRegSetGlobalAppearanceStyle(2);
    CNFRegSetSupportsAutoRotation(1);
  }
  [(CNFSettingsViewController *)self _loadChildViewController];
}

- (void)_loadChildViewController
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CNFSettingsViewController *)self serviceType];
  CNFRegSetStringTableForServiceType(v3);
  switch(v3)
  {
    case 2:
      goto LABEL_4;
    case 1:
      uint64_t v4 = [MEMORY[0x263F4A610] iMessageService];
      goto LABEL_6;
    case 0:
LABEL_4:
      uint64_t v4 = [MEMORY[0x263F4A610] facetimeService];
LABEL_6:
      char v5 = (void *)v4;
      goto LABEL_8;
  }
  char v5 = 0;
LABEL_8:
  if (+[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:v5 inProgressRegisteringNonPhoneAccount:0])
  {
    v6 = (objc_class *)objc_opt_class();
  }
  else
  {
    objc_super v7 = [(CNFSettingsViewController *)self settingsClassName];
    v6 = NSClassFromString(v7);
  }
  uint64_t v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Container view controller choosing to show initialChildViewControllerClass %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v17 = NSStringFromClass(v6);
    IMLogString();
  }
  objc_super v10 = (void *)MEMORY[0x263F5FC40];
  v11 = [(CNFSettingsViewController *)self specifierTitle];
  v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:2 edit:0];

  v13 = [(CNFSettingsViewController *)self settingsClassName];
  [v12 setProperty:v13 forKey:@"cnf-completionclass"];

  v14 = [NSNumber numberWithInteger:v3];
  [v12 setProperty:v14 forKey:@"ft-serviceType"];

  [v12 setProperty:MEMORY[0x263EFFA88] forKey:@"cnf-hideLearnMoreButton"];
  v15 = CreateDetailControllerInstanceWithClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    if (([v16 isConnected] & 1) == 0) {
      [v16 connect:1];
    }
  }
  [v15 setSpecifier:v12];
  [(CNFSettingsViewController *)self set_currentChildViewController:v15];
  if ([(CNFSettingsViewController *)self _hasPendingDeepLink]) {
    [(CNFSettingsViewController *)self _invokePendingDeepLink];
  }
}

- (void)set_currentChildViewController:(id)a3
{
  char v5 = (PSController *)a3;
  p_currentChildViewController = &self->__currentChildViewController;
  currentChildViewController = self->__currentChildViewController;
  if (currentChildViewController != v5)
  {
    v25 = v5;
    if (currentChildViewController)
    {
      [(PSController *)currentChildViewController willMoveToParentViewController:0];
      uint64_t v8 = [(PSController *)*p_currentChildViewController view];
      [v8 removeFromSuperview];

      [(PSController *)*p_currentChildViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->__currentChildViewController, a3);
    v9 = *p_currentChildViewController;
    objc_super v10 = [(CNFSettingsViewController *)self rootController];
    [(PSController *)v9 setRootController:v10];

    if (v25)
    {
      [(CNFSettingsViewController *)self addChildViewController:v25];
      v11 = [(CNFSettingsViewController *)self view];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      uint64_t v20 = [(PSController *)v25 view];
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

      v21 = [(CNFSettingsViewController *)self view];
      v22 = [(PSController *)v25 view];
      [v21 addSubview:v22];

      [(PSController *)v25 didMoveToParentViewController:self];
      v23 = [(PSController *)v25 specifier];
      v24 = [v23 name];
      [(CNFSettingsViewController *)self setTitle:v24];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)viewDidLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)CNFSettingsViewController;
  [(CNFSettingsViewController *)&v30 viewDidLayoutSubviews];
  uint64_t v3 = [(CNFSettingsViewController *)self _currentChildViewController];
  uint64_t v4 = [v3 view];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [(CNFSettingsViewController *)self view];
  [v13 bounds];
  v32.origin.x = v14;
  v32.origin.y = v15;
  v32.size.width = v16;
  v32.size.height = v17;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  BOOL v18 = CGRectEqualToRect(v31, v32);

  if (!v18)
  {
    double v19 = [(CNFSettingsViewController *)self view];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [(CNFSettingsViewController *)self _currentChildViewController];
    v29 = [v28 view];
    objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);
  }
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)CNFSettingsViewController;
  [(CNFSettingsViewController *)&v3 applicationDidResume];
  v2 = [MEMORY[0x263F4AF48] sharedInstance];
  [v2 resetCacheSubscriptionInfo];
}

- (void)containerViewControllerShouldUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Container received notification to re-determine child view controller.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFSettingsViewController *)self _loadChildViewController];
  CGFloat v6 = [(CNFSettingsViewController *)self navigationController];
  double v7 = [v6 viewControllers];

  CGFloat v8 = [(CNFSettingsViewController *)self parentViewController];
  if (v8
    && ([(CNFSettingsViewController *)self parentViewController],
        double v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v7 containsObject:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    double v11 = [(CNFSettingsViewController *)self parentViewController];
  }
  else
  {
    double v11 = self;
  }
  CGFloat v12 = v11;
  double v13 = [(CNFSettingsViewController *)self navigationController];
  id v14 = (id)[v13 popToViewController:v12 animated:0];

  CGFloat v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CGFloat v17 = v12;
    _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Container view controller attempted to pop to {%@}.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = objc_alloc_init(CNFPendingDeepLinkRepresentation);
  [(CNFPendingDeepLinkRepresentation *)v8 setResourceDictionary:v6];
  [(CNFPendingDeepLinkRepresentation *)v8 setCompletion:v7];
  [(CNFSettingsViewController *)self setPendingDeepLinkRepresentation:v8];
  double v9 = [(CNFSettingsViewController *)self _currentChildViewController];

  if (v9)
  {
    [(CNFSettingsViewController *)self _invokePendingDeepLink];
  }
  else
  {
    char v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "Failed to route a prefs link because we have no contained child controller to forward to. Will try again after the childViewController is configured.", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (BOOL)_hasPendingDeepLink
{
  return self->_pendingDeepLinkRepresentation != 0;
}

- (void)_invokePendingDeepLink
{
  if (self->_pendingDeepLinkRepresentation)
  {
    objc_super v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v8 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Forwarding pending prefs deep link now that child controller is configured.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    id v4 = [(CNFPendingDeepLinkRepresentation *)self->_pendingDeepLinkRepresentation resourceDictionary];
    double v5 = [(CNFPendingDeepLinkRepresentation *)self->_pendingDeepLinkRepresentation completion];
    pendingDeepLinkRepresentation = self->_pendingDeepLinkRepresentation;
    self->_pendingDeepLinkRepresentation = 0;

    id v7 = [(CNFSettingsViewController *)self _currentChildViewController];
    [v7 handleURL:v4 withCompletion:v5];
  }
}

- (id)specifierTitle
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  double v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CNFSettingsViewController.m", 254, @"Call to abstract method (%@) on %@", v5, objc_opt_class() object file lineNumber description];

  return 0;
}

- (int64_t)serviceType
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  double v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CNFSettingsViewController.m", 259, @"Call to abstract method (%@) on %@", v5, objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)settingsClassName
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  double v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CNFSettingsViewController.m", 264, @"Call to abstract method (%@) on %@", v5, objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)name
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  double v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CNFSettingsViewController.m", 269, @"Call to abstract method (%@) on %@", v5, objc_opt_class() object file lineNumber description];

  return 0;
}

- (PSController)_currentChildViewController
{
  return self->__currentChildViewController;
}

- (CNFPendingDeepLinkRepresentation)pendingDeepLinkRepresentation
{
  return self->_pendingDeepLinkRepresentation;
}

- (void)setPendingDeepLinkRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeepLinkRepresentation, 0);
  objc_storeStrong((id *)&self->__currentChildViewController, 0);
}

@end