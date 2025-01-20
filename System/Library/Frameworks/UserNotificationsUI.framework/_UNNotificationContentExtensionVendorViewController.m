@interface _UNNotificationContentExtensionVendorViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges;
- (BOOL)canBecomeFirstResponder;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (UNNotificationContentExtension)extensionViewController;
- (_UNNotificationContentExtensionVendorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_extensionBundleIdentifier;
- (id)notificationExtensionVendorContext;
- (void)_invalidateExtensionContext;
- (void)_setupExtensionViewController:(id)a3;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)addChildViewController:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)preserveInputViews;
- (void)restoreInputViews;
- (void)setExtensionViewController:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation _UNNotificationContentExtensionVendorViewController

- (_UNNotificationContentExtensionVendorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  v4 = [(_UNNotificationContentExtensionVendorViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    atomic_store(0, (unsigned __int8 *)&v4->_invalidationOnceFlag);
    UNRegisterUserNotificationsUILogging();
  }
  return v5;
}

- (void)dealloc
{
  [(_UNNotificationContentExtensionVendorViewController *)self _invalidateExtensionContext];
  v3 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  [v3 removeObserver:self forKeyPath:@"title"];

  v4.receiver = self;
  v4.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v4 dealloc];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v5 = [(_UNNotificationContentExtensionVendorViewController *)self notificationExtensionVendorContext];
  objc_super v4 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  objc_msgSend(v5, "_extensionWantsToBecomeFirstResponder:", objc_msgSend(v4, "canBecomeFirstResponder"));
}

- (void)addChildViewController:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v6 addChildViewController:v4];
  if ([v4 conformsToProtocol:&unk_26D4C85E8])
  {
    [(_UNNotificationContentExtensionVendorViewController *)self _setupExtensionViewController:v4];
  }
  else
  {
    id v5 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR)) {
      [(_UNNotificationContentExtensionVendorViewController *)v5 addChildViewController:self];
    }
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  id v4 = a3;
  [(_UNNotificationContentExtensionVendorViewController *)&v5 willMoveToParentViewController:v4];
  objc_msgSend(v4, "preferredContentSizeDidChangeForChildContentContainer:", self, v5.receiver, v5.super_class);
}

- (void)loadView
{
  v3 = [_UNNotificationContentExtensionVendorViewControllerView alloc];
  id v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  objc_super v5 = -[_UNNotificationContentExtensionVendorViewControllerView initWithFrame:](v3, "initWithFrame:");

  [(_UNNotificationContentExtensionVendorViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v6 viewDidLoad];
  v3 = (UIScrollViewDelayedTouchesBeganGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C948]) initWithTarget:self action:sel_delayed_];
  touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
  self->_touchDelayGestureRecognizer = v3;

  [(UIScrollViewDelayedTouchesBeganGestureRecognizer *)self->_touchDelayGestureRecognizer setDelaysTouchesBegan:1];
  objc_super v5 = [(_UNNotificationContentExtensionVendorViewController *)self view];
  [v5 addGestureRecognizer:self->_touchDelayGestureRecognizer];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(_UNNotificationContentExtensionVendorViewController *)self notificationExtensionVendorContext];
  [v3 _extensionWantsToUpdateMediaPlayPauseButton];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[_UNNotificationContentExtensionVendorViewController viewWillAppear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v7 viewWillAppear:v3];
  objc_super v6 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  objc_msgSend(v6, "bs_beginAppearanceTransition:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = "-[_UNNotificationContentExtensionVendorViewController viewDidAppear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v8 viewDidAppear:v3];
  objc_super v6 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  objc_msgSend(v6, "bs_endAppearanceTransition:", 1);

  objc_super v7 = [(_UNNotificationContentExtensionVendorViewController *)self notificationExtensionVendorContext];
  [v7 _extensionWantsMessagesFromHostDelivered];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = "-[_UNNotificationContentExtensionVendorViewController viewWillDisappear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v8 viewWillDisappear:v3];
  objc_super v6 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  objc_msgSend(v6, "bs_beginAppearanceTransition:animated:", 0, v3);

  objc_super v7 = [(_UNNotificationContentExtensionVendorViewController *)self firstResponder];
  [v7 resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[_UNNotificationContentExtensionVendorViewController viewDidDisappear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v7 viewDidDisappear:v3];
  objc_super v6 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  objc_msgSend(v6, "bs_endAppearanceTransition:", 0);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v12 preferredContentSizeDidChangeForChildContentContainer:v4];
  [(_UNNotificationContentExtensionVendorViewController *)self preferredContentSize];
  double v6 = v5;
  double v8 = v7;
  [v4 preferredContentSize];
  if (v6 != v10 || v8 != v9)
  {
    [v4 preferredContentSize];
    -[_UNNotificationContentExtensionVendorViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  id v7 = a4;
  -[_UNNotificationContentExtensionVendorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __106___UNNotificationContentExtensionVendorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_264603878;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  id v4 = a3;
  [(_UNNotificationContentExtensionVendorViewController *)&v17 systemLayoutFittingSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v17.receiver, v17.super_class);
  double v6 = v5;
  double v8 = v7;

  if (v6 == *MEMORY[0x263F001B0] && v8 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v10 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
    uint64_t v11 = [v10 view];

    objc_super v12 = [(_UNNotificationContentExtensionVendorViewController *)self view];
    [v12 bounds];
    double Width = CGRectGetWidth(v18);

    LODWORD(v14) = 1148846080;
    LODWORD(v15) = 1112014848;
    objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v14, v15);
    if (v16 > 0.0) {
      [(_UNNotificationContentExtensionVendorViewController *)self setPreferredContentSize:Width];
    }
  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  [(_UNNotificationContentExtensionVendorViewController *)&v6 beginRequestWithExtensionContext:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setNotificationExtensionContainer:self];
  }
  else
  {
    double v5 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR)) {
      -[_UNNotificationContentExtensionVendorViewController beginRequestWithExtensionContext:](v5);
    }
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController setPreferredContentSize:](&v3, sel_setPreferredContentSize_, a3.width, a3.height);
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (void)preserveInputViews
{
  id v4 = [MEMORY[0x263F1C850] sharedInstance];
  char v3 = [MEMORY[0x263F08D40] valueWithPointer:self];
  [v4 _preserveInputViewsWithId:v3 animated:1];
}

- (void)restoreInputViews
{
  id v4 = [MEMORY[0x263F1C850] sharedInstance];
  char v3 = [MEMORY[0x263F08D40] valueWithPointer:self];
  [v4 _restoreInputViewsWithId:v3 animated:1];
}

- (id)_extensionBundleIdentifier
{
  v2 = (void *)MEMORY[0x263F086E0];
  char v3 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  id v4 = [v2 bundleForClass:objc_opt_class()];
  double v5 = [v4 bundleIdentifier];

  return v5;
}

- (id)notificationExtensionVendorContext
{
  v2 = [(_UNNotificationContentExtensionVendorViewController *)self extensionContext];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_setupExtensionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViewController, a3);
  id v5 = a3;
  id v7 = [(_UNNotificationContentExtensionVendorViewController *)self view];
  id v6 = [v5 view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");
  [v6 setAutoresizingMask:18];
  [v7 addSubview:v6];
  [v5 preferredContentSize];
  -[_UNNotificationContentExtensionVendorViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [v5 addObserver:self forKeyPath:@"title" options:1 context:0];
}

- (void)_invalidateExtensionContext
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ((atomic_exchange(&self->_invalidationOnceFlag._Value, 1u) & 1) == 0)
  {
    uint64_t v3 = UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446210;
      id v6 = "-[_UNNotificationContentExtensionVendorViewController _invalidateExtensionContext]";
      _os_log_impl(&dword_222224000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
    }
    id v4 = [(_UNNotificationContentExtensionVendorViewController *)self extensionContext];
    [v4 completeRequestReturningItems:0 completionHandler:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_UNNotificationContentExtensionVendorViewController *)self extensionViewController];
  if (v11 == v9)
  {
    int v12 = [v14 isEqualToString:@"title"];

    if (!v12) {
      goto LABEL_5;
    }
    id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    v13 = [(_UNNotificationContentExtensionVendorViewController *)self notificationExtensionVendorContext];
    [v13 _extensionDidUpdateTitle:v11];
  }
LABEL_5:
}

- (UNNotificationContentExtension)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionViewController, 0);

  objc_storeStrong((id *)&self->_touchDelayGestureRecognizer, 0);
}

- (void)addChildViewController:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [a3 _extensionBundleIdentifier];
  double v8 = NSStringFromProtocol((Protocol *)&unk_26D4C85E8);
  int v9 = 138543874;
  id v10 = v6;
  __int16 v11 = 2114;
  int v12 = v7;
  __int16 v13 = 2114;
  id v14 = v8;
  _os_log_error_impl(&dword_222224000, v4, OS_LOG_TYPE_ERROR, "View controller %{public}@ in extension %{public}@ does not conform to protocol %{public}@", (uint8_t *)&v9, 0x20u);
}

- (void)beginRequestWithExtensionContext:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  int v5 = v3;
  _os_log_error_impl(&dword_222224000, v1, OS_LOG_TYPE_ERROR, "Unexpected extension context class: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end