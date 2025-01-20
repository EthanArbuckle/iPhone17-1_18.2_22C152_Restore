@interface PassbookSettingsContainerController
- (BOOL)_shouldResetToRoot;
- (PassbookSettingsContainerController)init;
- (float)verticalContentOffset;
- (id)_currentViewControllerForScreen:(unint64_t)a3;
- (void)_applicationDidBecomeActive;
- (void)_applicationDidEnterBackground;
- (void)_applicationDidRemoveDeactivationReasonNotification:(id)a3;
- (void)_applicationDidResignActive;
- (void)_applicationWillAddDeactivationReasonNotification:(id)a3;
- (void)_loadCurrentScreen;
- (void)_resetToRootAnimated:(BOOL)a3;
- (void)_restrictToShield;
- (void)appProtectionCoordinatorDidGainAccess;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)loadView;
- (void)setCurrentScreen:(unint64_t)a3;
- (void)setDesiredVerticalContentOffset:(float)a3;
- (void)setDesiredVerticalContentOffsetItemNamed:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation PassbookSettingsContainerController

- (PassbookSettingsContainerController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PassbookSettingsContainerController;
  v2 = [(PassbookSettingsContainerController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentScreen = 0;
    v2->_isActive = 1;
    v2->_isInAppSwitcher = 0;
    uint64_t v4 = +[PKAppProtectionCoordinator shared];
    appProtectionCoordinator = v3->_appProtectionCoordinator;
    v3->_appProtectionCoordinator = (PKAppProtectionCoordinator *)v4;

    [(PKAppProtectionCoordinator *)v3->_appProtectionCoordinator registerObserver:v3];
    v6 = objc_alloc_init(PassbookSettingsListController);
    listSettingsController = v3->_listSettingsController;
    v3->_listSettingsController = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"_applicationDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
    [v8 addObserver:v3 selector:"_applicationDidEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
    [v8 addObserver:v3 selector:"_applicationDidResignActive" name:UIApplicationWillResignActiveNotification object:0];
    [v8 addObserver:v3 selector:"_applicationDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];
    [v8 addObserver:v3 selector:"_applicationWillAddDeactivationReasonNotification:" name:_UIApplicationWillAddDeactivationReasonNotification object:0];
    [v8 addObserver:v3 selector:"_applicationDidRemoveDeactivationReasonNotification:" name:_UIApplicationDidRemoveDeactivationReasonNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  [(PKAppProtectionCoordinator *)self->_appProtectionCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PassbookSettingsContainerController;
  [(PassbookSettingsContainerController *)&v3 dealloc];
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)PassbookSettingsContainerController;
  [(PassbookSettingsContainerController *)&v8 loadView];
  objc_super v3 = [(PassbookSettingsContainerController *)self view];
  uint64_t v4 = +[UIColor systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(PassbookSettingsContainerController *)self navigationItem];
  v6 = [(PassbookSettingsContainerController *)self specifier];
  v7 = [v6 name];
  [v5 setTitle:v7];

  [(PassbookSettingsContainerController *)self _loadCurrentScreen];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PassbookSettingsContainerController;
  [(PassbookSettingsContainerController *)&v6 viewWillLayoutSubviews];
  unint64_t v3 = self->_currentScreen - 1;
  if (v3 <= 2)
  {
    uint64_t v4 = [*(id *)&self->PSViewController_opaque[*off_104F8[v3]] view];
    v5 = [(PassbookSettingsContainerController *)self view];
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PassbookSettingsContainerController;
  [(PassbookSettingsContainerController *)&v3 viewDidLayoutSubviews];
  if (self->_currentScreen == 1) {
    [(PassbookSettingsListController *)self->_listSettingsController handlePendingURL];
  }
}

- (void)_loadCurrentScreen
{
  if ([(PKAppProtectionCoordinator *)self->_appProtectionCoordinator isEffectivelyLocked])
  {
    objc_initWeak(&location, self);
    appProtectionCoordinator = self->_appProtectionCoordinator;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_30E8;
    v5[3] = &unk_104B0;
    objc_copyWeak(&v6, &location);
    [(PKAppProtectionCoordinator *)appProtectionCoordinator isShieldRequiredWithCompletion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3144;
    block[3] = &unk_104D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_restrictToShield
{
  if ([(PKAppProtectionCoordinator *)self->_appProtectionCoordinator isEffectivelyLocked])
  {
    if (self->_currentScreen <= 1)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_31F8;
      block[3] = &unk_104D8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setCurrentScreen:(unint64_t)a3
{
  if (self->_currentScreen != a3)
  {
    v5 = -[PassbookSettingsContainerController _currentViewControllerForScreen:](self, "_currentViewControllerForScreen:");
    switch(a3)
    {
      case 0uLL:
        id v6 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Settings screen: Undetermined", buf, 2u);
        }

        goto LABEL_6;
      case 1uLL:
        v13 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Settings screen: List Settings", v19, 2u);
        }

        listSettingsController = self->_listSettingsController;
        goto LABEL_16;
      case 2uLL:
        [(PKAppProtectionCoordinator *)self->_appProtectionCoordinator requestAccess];
        goto LABEL_9;
      case 3uLL:
LABEL_9:
        objc_super v8 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Settings screen: Shield", v18, 2u);
        }

        listSettingsController = self->_shieldViewController;
        if (!listSettingsController)
        {
          id v10 = objc_alloc_init((Class)PKAppProtectionShieldConfiguration);
          [v10 setShowAuthOnAppear:0];
          v11 = +[PKAppProtectionShieldViewController createShieldViewControllerWithConfiguration:v10];
          shieldViewController = self->_shieldViewController;
          self->_shieldViewController = v11;

          listSettingsController = self->_shieldViewController;
        }
LABEL_16:
        id v7 = listSettingsController;
        if (v5) {
          goto LABEL_17;
        }
        goto LABEL_18;
      default:
LABEL_6:
        id v7 = 0;
        if (!v5) {
          goto LABEL_18;
        }
LABEL_17:
        [(PassbookSettingsContainerController *)self _resetToRootAnimated:self->_isInAppSwitcher];
        v14 = [v5 view];
        [v14 removeFromSuperview];

        [v5 removeFromParentViewController];
        [v5 didMoveToParentViewController:0];
LABEL_18:
        if (v7)
        {
          [(PassbookSettingsContainerController *)self addChildViewController:v7];
          v15 = [(PassbookSettingsContainerController *)self view];
          v16 = [v7 view];
          [v15 addSubview:v16];

          [v7 didMoveToParentViewController:self];
        }
        self->_currentScreen = a3;
        v17 = [(PassbookSettingsContainerController *)self view];
        [v17 setNeedsLayout];

        break;
    }
  }
}

- (id)_currentViewControllerForScreen:(unint64_t)a3
{
  if (a3 - 1 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)&self->PSViewController_opaque[*off_104F8[a3 - 1]];
  }
  return v4;
}

- (void)_resetToRootAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = [(PassbookSettingsContainerController *)self navigationController];
  v5 = [(PassbookSettingsContainerController *)self _currentViewControllerForScreen:self->_currentScreen];
  id v6 = [v5 presentedViewController];

  if (v6) {
    [v6 dismissViewControllerAnimated:v3 completion:0];
  }
  id v7 = [v13 presentedViewController];

  if (v7) {
    [v7 dismissViewControllerAnimated:v3 completion:0];
  }
  objc_super v8 = [v13 viewControllers];
  if ([v8 indexOfObject:self] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [(PassbookSettingsContainerController *)self parentViewController];
    if ([v8 indexOfObject:v9] != (id)0x7FFFFFFFFFFFFFFFLL) {
      id v10 = [v13 popToViewController:v9 animated:v3];
    }
  }
  else
  {
    id v11 = [v13 popToViewController:self animated:v3];
  }
  if (!self->_isInAppSwitcher)
  {
    v12 = +[UIApplication sharedApplication];
    [v12 _updateSnapshotForBackgroundApplication:1];
  }
}

- (BOOL)_shouldResetToRoot
{
  v2 = [(PassbookSettingsContainerController *)self navigationController];
  BOOL v3 = objc_msgSend(v2, "pkui_frontMostViewController");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 presentingViewController];

    BOOL v3 = (void *)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned __int8 v6 = objc_msgSend(v3, "pkui_disablesAutomaticDismissalUponEnteringBackground");
    v5 = 0;
    goto LABEL_10;
  }
  v5 = [v3 viewControllers];
  unsigned __int8 v6 = objc_msgSend(v3, "pkui_disablesAutomaticDismissalUponEnteringBackground");
  if ((v6 & 1) != 0 || !v5)
  {
LABEL_10:
    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v7 = [v5 firstObject];
  if (objc_msgSend(v7, "pkui_disablesAutomaticDismissalUponEnteringBackground"))
  {
LABEL_16:
    LOBYTE(v10) = 0;
LABEL_22:

    goto LABEL_23;
  }
  objc_super v8 = [v5 lastObject];
  unsigned __int8 v9 = objc_msgSend(v8, "pkui_disablesAutomaticDismissalUponEnteringBackground");

  if ((v9 & 1) == 0)
  {
LABEL_12:
    id v11 = v5;
    v12 = [v3 childViewControllers];
    id v7 = [v12 lastObject];

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = [v7 viewControllers];

        id v13 = [v5 firstObject];
        if (objc_msgSend(v13, "pkui_disablesAutomaticDismissalUponEnteringBackground"))
        {

          goto LABEL_16;
        }
        v15 = [v5 lastObject];
        unsigned __int8 v16 = objc_msgSend(v15, "pkui_disablesAutomaticDismissalUponEnteringBackground");

        if ((v16 & 1) == 0)
        {
          id v11 = v5;
          goto LABEL_21;
        }
        goto LABEL_11;
      }
      unsigned __int8 v14 = objc_msgSend(v7, "pkui_disablesAutomaticDismissalUponEnteringBackground");

      if (v14)
      {
        LOBYTE(v10) = 0;
        v5 = v11;
        goto LABEL_23;
      }
    }
LABEL_21:
    id v7 = +[PKDismissalPreventionAssertionManager sharedInstance];
    unsigned int v10 = [v7 shouldPreventAutomaticDismissal] ^ 1;
    v5 = v11;
    goto LABEL_22;
  }
LABEL_11:
  LOBYTE(v10) = 0;
LABEL_23:

  return v10;
}

- (void)_applicationDidEnterBackground
{
  [(PassbookSettingsContainerController *)self _restrictToShield];
  if ([(PassbookSettingsContainerController *)self _shouldResetToRoot])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3994;
    block[3] = &unk_104D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_applicationDidResignActive
{
  self->_isActive = 0;
  if (self->_isInAppSwitcher) {
    [(PassbookSettingsContainerController *)self _restrictToShield];
  }
}

- (void)_applicationDidBecomeActive
{
  self->_isActive = 1;
  if (!self->_isInAppSwitcher) {
    [(PassbookSettingsContainerController *)self _loadCurrentScreen];
  }
}

- (void)_applicationWillAddDeactivationReasonNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  v5 = [v4 objectForKey:_UIApplicationDeactivationReasonUserInfoKey];
  unsigned int v6 = [v5 longLongValue];

  if (v6 == 3)
  {
    self->_isInAppSwitcher = 1;
    if (!self->_isActive)
    {
      [(PassbookSettingsContainerController *)self _restrictToShield];
    }
  }
}

- (void)_applicationDidRemoveDeactivationReasonNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  v5 = [v4 objectForKey:_UIApplicationDeactivationReasonUserInfoKey];
  unsigned int v6 = [v5 longLongValue];

  if (v6 == 3)
  {
    self->_isInAppSwitcher = 0;
    if (self->_isActive)
    {
      [(PassbookSettingsContainerController *)self _loadCurrentScreen];
    }
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unint64_t currentScreen = self->_currentScreen;
  if (currentScreen - 2 < 2 || currentScreen == 0)
  {
    [(PassbookSettingsListController *)self->_listSettingsController setPendingURLResourceDictionary:v9];
    [(PassbookSettingsListController *)self->_listSettingsController setUrlHandlingCompletion:v6];
  }
  else if (currentScreen == 1)
  {
    [(PassbookSettingsListController *)self->_listSettingsController handleURL:v9 withCompletion:v6];
  }
}

- (void)appProtectionCoordinatorDidGainAccess
{
}

- (void)setDesiredVerticalContentOffset:(float)a3
{
}

- (void)setDesiredVerticalContentOffsetItemNamed:(id)a3
{
}

- (float)verticalContentOffset
{
  [(PassbookSettingsListController *)self->_listSettingsController verticalContentOffset];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtectionCoordinator, 0);
  objc_storeStrong((id *)&self->_shieldViewController, 0);

  objc_storeStrong((id *)&self->_listSettingsController, 0);
}

@end