@interface CKBrowserAppManagerViewController
- (BOOL)appAllowedByScreenTimeWithBundleIdentifier:(id)a3;
- (BOOL)isDismissing;
- (BOOL)isLoaded;
- (BOOL)isManagingStickers;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)shouldShowChatChrome;
- (BOOL)supportsQuickView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (CKBrowserAppManagerViewControllerDelegate)delegate;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)browserPresentationStyle;
- (int64_t)parentModalPresentationStyle;
- (void)browserAppManagerDidSelectPlugin:(id)a3;
- (void)delegate_BrowserAppManagerDidSelectPlugin:(id)a3;
- (void)dismiss;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsManagingStickers:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKBrowserAppManagerViewController

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserAppManagerViewController;
  [(CKBrowserViewController *)&v5 viewWillAppear:a3];
  v4 = [(CKBrowserAppManagerViewController *)self presentationController];
  [v4 setDelegate:self];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CKBrowserAppManagerViewController;
  [(CKBrowserAppManagerViewController *)&v10 viewDidLoad];
  v3 = [(CKBrowserAppManagerViewController *)self view];
  v4 = objc_alloc_init(CKAppManagerViewController);
  appViewController = self->_appViewController;
  self->_appViewController = v4;

  [(CKAppManagerViewController *)self->_appViewController setDelegate:self];
  v6 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:self->_appViewController];
  navController = self->_navController;
  self->_navController = v6;

  v8 = [(UINavigationController *)self->_navController view];
  v9 = [(CKBrowserAppManagerViewController *)self view];
  [v9 bounds];
  objc_msgSend(v8, "setFrame:");

  [v8 setAutoresizingMask:18];
  [v3 addSubview:v8];
  [(CKBrowserAppManagerViewController *)self addChildViewController:self->_navController];
  [(UINavigationController *)self->_navController didMoveToParentViewController:self];
}

- (BOOL)appAllowedByScreenTimeWithBundleIdentifier:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v3 = a3;
  v4 = IMSharedDowntimeController();
  char v5 = [v4 allowedToShowAppExtensionWithBundleIdentifier:v3];

  return v5;
}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
  id v6 = a3;
  [(CKBrowserAppManagerViewController *)self dismiss];
  v4 = [v6 appBundle];
  char v5 = [v4 bundleIdentifier];

  if ([(CKBrowserAppManagerViewController *)self appAllowedByScreenTimeWithBundleIdentifier:v5])
  {
    [(CKBrowserAppManagerViewController *)self delegate_BrowserAppManagerDidSelectPlugin:v6];
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

- (void)delegate_BrowserAppManagerDidSelectPlugin:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBrowserAppManagerViewController *)self delegate];
  [v5 browserAppManagerDidSelectPlugin:v4];
}

- (void)dismiss
{
  v2 = [(CKBrowserViewController *)self sendDelegate];
  [v2 dismiss];

  id v3 = +[CKBalloonPluginManager sharedInstance];
  [v3 invalidateAppManagerPlugin];
}

- (int64_t)browserPresentationStyle
{
  return 2;
}

- (BOOL)shouldShowChatChrome
{
  return 0;
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)isDismissing
{
  return 0;
}

- (int64_t)parentModalPresentationStyle
{
  return 4;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5 = a3;
  NSClassFromString(&cfstr_Ckfullscreenbr.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    v7 = [[CKBrowserFullscreenRevealAnimationController alloc] initWithDirection:1];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Ckfullscreenbr.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = [[CKBrowserFullscreenRevealAnimationController alloc] initWithDirection:0];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  NSClassFromString(&cfstr_Ckfullscreenbr.isa);
  if (objc_opt_isKindOfClass())
  {
    v11 = [[CKBrowserFullscreenRevealPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
    id location = 0;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __132__CKBrowserAppManagerViewController_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
    v13[3] = &unk_1E5629AD8;
    objc_copyWeak(&v14, &location);
    [(CKBrowserFullscreenRevealPresentationController *)v11 setDismissHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __132__CKBrowserAppManagerViewController_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismiss];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(CKBrowserViewController *)self sendDelegate];
  [v3 dismissAndReloadInputViews:1];
}

- (BOOL)isManagingStickers
{
  return self->_isManagingStickers;
}

- (void)setIsManagingStickers:(BOOL)a3
{
  self->_isManagingStickers = a3;
}

- (CKBrowserAppManagerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserAppManagerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appViewController, 0);

  objc_storeStrong((id *)&self->_navController, 0);
}

@end