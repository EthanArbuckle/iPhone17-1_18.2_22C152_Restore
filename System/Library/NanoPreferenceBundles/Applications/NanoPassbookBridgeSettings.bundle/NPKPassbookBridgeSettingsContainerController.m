@interface NPKPassbookBridgeSettingsContainerController
- (BOOL)isActive;
- (BOOL)isInAppSwitcher;
- (BOOL)isViewVisible;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (NPKPassbookBridgeSettingsContainerController)init;
- (NPKPassbookBridgeSettingsController)listSettingsController;
- (PKAppProtectionCoordinator)appProtectionCoordinator;
- (UIViewController)shieldViewController;
- (id)_currentViewControllerForScreen:(unint64_t)a3;
- (id)applicationBundleIdentifier;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (unint64_t)currentScreen;
- (void)_applicationDidBecomeActive;
- (void)_applicationDidEnterBackground;
- (void)_applicationDidRemoveDeactivationReasonNotification:(id)a3;
- (void)_applicationDidResignActive;
- (void)_applicationWillAddDeactivationReasonNotification:(id)a3;
- (void)_loadCurrentScreen;
- (void)_restrictToShield;
- (void)_setCurrentScreen:(unint64_t)a3;
- (void)appProtectionCoordinatorDidGainAccess;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setAppProtectionCoordinator:(id)a3;
- (void)setCurrentScreen:(unint64_t)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsInAppSwitcher:(BOOL)a3;
- (void)setIsViewVisible:(BOOL)a3;
- (void)setListSettingsController:(id)a3;
- (void)setShieldViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NPKPassbookBridgeSettingsContainerController

- (NPKPassbookBridgeSettingsContainerController)init
{
  v10.receiver = self;
  v10.super_class = (Class)NPKPassbookBridgeSettingsContainerController;
  v2 = [(NPKPassbookBridgeSettingsContainerController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(NPKPassbookBridgeSettingsContainerController *)v2 setCurrentScreen:0];
    v4 = +[UIApplication sharedApplication];
    -[NPKPassbookBridgeSettingsContainerController setIsActive:](v3, "setIsActive:", [v4 applicationState] == 0);

    [(NPKPassbookBridgeSettingsContainerController *)v3 setIsInAppSwitcher:0];
    [(NPKPassbookBridgeSettingsContainerController *)v3 setIsViewVisible:1];
    v5 = +[PKAppProtectionCoordinator shared];
    [(NPKPassbookBridgeSettingsContainerController *)v3 setAppProtectionCoordinator:v5];

    v6 = [(NPKPassbookBridgeSettingsContainerController *)v3 appProtectionCoordinator];
    [v6 registerObserver:v3];

    v7 = objc_alloc_init(NPKPassbookBridgeSettingsController);
    [(NPKPassbookBridgeSettingsContainerController *)v3 setListSettingsController:v7];

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
  v3 = [(NPKPassbookBridgeSettingsContainerController *)self appProtectionCoordinator];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPKPassbookBridgeSettingsContainerController;
  [(NPKPassbookBridgeSettingsContainerController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)NPKPassbookBridgeSettingsContainerController;
  [(NPKPassbookBridgeSettingsContainerController *)&v8 viewDidLoad];
  v3 = [(NPKPassbookBridgeSettingsContainerController *)self view];
  objc_super v4 = +[UIColor systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(NPKPassbookBridgeSettingsContainerController *)self navigationItem];
  v6 = [(NPKPassbookBridgeSettingsContainerController *)self specifier];
  v7 = [v6 name];
  [v5 setTitle:v7];

  [(NPKPassbookBridgeSettingsContainerController *)self _loadCurrentScreen];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NPKPassbookBridgeSettingsContainerController;
  [(NPKPassbookBridgeSettingsContainerController *)&v8 viewWillLayoutSubviews];
  unint64_t v3 = [(NPKPassbookBridgeSettingsContainerController *)self currentScreen];
  if (v3 - 2 >= 2)
  {
    if (v3 != 1) {
      return;
    }
    objc_super v4 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
  }
  else
  {
    objc_super v4 = [(NPKPassbookBridgeSettingsContainerController *)self shieldViewController];
  }
  v5 = v4;
  v6 = [v4 view];
  v7 = [(NPKPassbookBridgeSettingsContainerController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPassbookBridgeSettingsContainerController;
  [(NPKPassbookBridgeSettingsContainerController *)&v4 viewIsAppearing:a3];
  [(NPKPassbookBridgeSettingsContainerController *)self setIsViewVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPassbookBridgeSettingsContainerController;
  [(NPKPassbookBridgeSettingsContainerController *)&v4 viewDidDisappear:a3];
  [(NPKPassbookBridgeSettingsContainerController *)self setIsViewVisible:0];
}

- (void)_loadCurrentScreen
{
  if ([(NPKPassbookBridgeSettingsContainerController *)self isActive]
    && ![(NPKPassbookBridgeSettingsContainerController *)self isInAppSwitcher]
    && [(NPKPassbookBridgeSettingsContainerController *)self isViewVisible])
  {
    unint64_t v3 = [(NPKPassbookBridgeSettingsContainerController *)self appProtectionCoordinator];
    unsigned int v4 = [v3 isEffectivelyLocked];

    if (v4)
    {
      objc_initWeak(&location, self);
      v5 = [(NPKPassbookBridgeSettingsContainerController *)self appProtectionCoordinator];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_12E2C;
      v7[3] = &unk_2CE88;
      objc_copyWeak(&v8, &location);
      [v5 isShieldRequiredWithCompletion:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_12E88;
      block[3] = &unk_2C6A8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_restrictToShield
{
  unint64_t v3 = [(NPKPassbookBridgeSettingsContainerController *)self appProtectionCoordinator];
  unsigned int v4 = [v3 isEffectivelyLocked];

  if (v4
    && ((char *)[(NPKPassbookBridgeSettingsContainerController *)self currentScreen] == (char *)&dword_0 + 1
     || ![(NPKPassbookBridgeSettingsContainerController *)self currentScreen]))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_12F54;
    block[3] = &unk_2C6A8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_setCurrentScreen:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(NPKPassbookBridgeSettingsContainerController *)self currentScreen] != a3)
  {
    v5 = [(NPKPassbookBridgeSettingsContainerController *)self _currentViewControllerForScreen:[(NPKPassbookBridgeSettingsContainerController *)self currentScreen]];
    switch(a3)
    {
      case 0uLL:
        v6 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Settings screen: Undetermined", buf, 2u);
        }

        goto LABEL_6;
      case 1uLL:
        v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Settings screen: List Settings", v31, 2u);
        }

        uint64_t v13 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
        goto LABEL_17;
      case 2uLL:
        id v8 = [(NPKPassbookBridgeSettingsContainerController *)self appProtectionCoordinator];
        [v8 requestAccess];

        goto LABEL_9;
      case 3uLL:
LABEL_9:
        v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Settings screen: Shield", v30, 2u);
        }

        objc_super v10 = [(NPKPassbookBridgeSettingsContainerController *)self shieldViewController];

        if (!v10)
        {
          id v11 = objc_alloc_init((Class)PKAppProtectionShieldConfiguration);
          [v11 setShowAuthOnAppear:0];
          v12 = +[PKAppProtectionShieldViewController createShieldViewControllerWithConfiguration:v11];
          [(NPKPassbookBridgeSettingsContainerController *)self setShieldViewController:v12];
        }
        uint64_t v13 = [(NPKPassbookBridgeSettingsContainerController *)self shieldViewController];
LABEL_17:
        v7 = (void *)v13;
        if (v5) {
          goto LABEL_18;
        }
        goto LABEL_28;
      default:
LABEL_6:
        v7 = 0;
        if (!v5) {
          goto LABEL_28;
        }
LABEL_18:
        BOOL v15 = [(NPKPassbookBridgeSettingsContainerController *)self isInAppSwitcher];
        v16 = [(NPKPassbookBridgeSettingsContainerController *)self navigationController];
        v17 = [v5 presentedViewController];
        v18 = v17;
        if (v17) {
          [v17 dismissViewControllerAnimated:v15 completion:0];
        }
        v19 = [v16 presentedViewController];

        if (v19) {
          [v19 dismissViewControllerAnimated:v15 completion:0];
        }
        v20 = [v16 viewControllers];
        if ([v20 indexOfObject:self] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = [(NPKPassbookBridgeSettingsContainerController *)self parentViewController];
          if ([v20 indexOfObject:v21] != (id)0x7FFFFFFFFFFFFFFFLL) {
            id v22 = [v16 popToViewController:v21 animated:v15];
          }
        }
        else
        {
          id v23 = [v16 popToViewController:self animated:v15];
        }
        v24 = [v5 view];
        [v24 removeFromSuperview];

        [v5 removeFromParentViewController];
        [v5 didMoveToParentViewController:0];

LABEL_28:
        if (v7)
        {
          [(NPKPassbookBridgeSettingsContainerController *)self addChildViewController:v7];
          v25 = [(NPKPassbookBridgeSettingsContainerController *)self view];
          v26 = [v7 view];
          [v25 addSubview:v26];

          [v7 didMoveToParentViewController:self];
          v27 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];

          if (v7 == v27)
          {
            v28 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
            [v28 handlePendingURL];
          }
        }
        [(NPKPassbookBridgeSettingsContainerController *)self setCurrentScreen:a3];
        v29 = [(NPKPassbookBridgeSettingsContainerController *)self view];
        [v29 setNeedsLayout];

        break;
    }
  }
}

- (id)_currentViewControllerForScreen:(unint64_t)a3
{
  if (a3 - 2 >= 2)
  {
    if (a3 == 1)
    {
      unint64_t v3 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  else
  {
    unint64_t v3 = [(NPKPassbookBridgeSettingsContainerController *)self shieldViewController];
  }

  return v3;
}

- (void)_applicationDidEnterBackground
{
}

- (void)_applicationDidResignActive
{
  [(NPKPassbookBridgeSettingsContainerController *)self setIsActive:0];
  if ([(NPKPassbookBridgeSettingsContainerController *)self isInAppSwitcher])
  {
    [(NPKPassbookBridgeSettingsContainerController *)self _restrictToShield];
  }
}

- (void)_applicationDidBecomeActive
{
  [(NPKPassbookBridgeSettingsContainerController *)self setIsActive:1];

  [(NPKPassbookBridgeSettingsContainerController *)self _loadCurrentScreen];
}

- (void)_applicationWillAddDeactivationReasonNotification:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  v5 = [v4 objectForKey:_UIApplicationDeactivationReasonUserInfoKey];
  unsigned int v6 = [v5 longLongValue];

  if (v6 == 3)
  {
    [(NPKPassbookBridgeSettingsContainerController *)self setIsInAppSwitcher:1];
    if (![(NPKPassbookBridgeSettingsContainerController *)self isActive])
    {
      [(NPKPassbookBridgeSettingsContainerController *)self _restrictToShield];
    }
  }
}

- (void)_applicationDidRemoveDeactivationReasonNotification:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  v5 = [v4 objectForKey:_UIApplicationDeactivationReasonUserInfoKey];
  unsigned int v6 = [v5 longLongValue];

  if (v6 == 3)
  {
    [(NPKPassbookBridgeSettingsContainerController *)self setIsInAppSwitcher:0];
    [(NPKPassbookBridgeSettingsContainerController *)self _loadCurrentScreen];
  }
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
  LOBYTE(a5) = [v10 prepareHandlingURLForSpecifierID:v9 resourceDictionary:v8 animatePush:a5];

  return (char)a5;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [(NPKPassbookBridgeSettingsContainerController *)self currentScreen];
  if (v7 - 2 >= 2 && v7)
  {
    if (v7 != 1) {
      goto LABEL_7;
    }
    id v8 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
    [v8 handleURL:v10 withCompletion:v6];
  }
  else
  {
    id v9 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
    [v9 setPendingURLResourceDictionary:v10];

    id v8 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
    [v8 setUrlHandlingCompletion:v6];
  }

LABEL_7:
}

- (void)appProtectionCoordinatorDidGainAccess
{
}

- (id)localizedPaneTitle
{
  v2 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
  unint64_t v3 = [v2 localizedPaneTitle];

  return v3;
}

- (id)applicationBundleIdentifier
{
  v2 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
  unint64_t v3 = [v2 applicationBundleIdentifier];

  return v3;
}

- (id)localizedMirroringDetailFooter
{
  v2 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
  unint64_t v3 = [v2 localizedMirroringDetailFooter];

  return v3;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  v2 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
  unsigned __int8 v3 = [v2 suppressSendToNotificationCenterOption];

  return v3;
}

- (BOOL)suppressMirrorOption
{
  v2 = [(NPKPassbookBridgeSettingsContainerController *)self listSettingsController];
  unsigned __int8 v3 = [v2 suppressMirrorOption];

  return v3;
}

- (NPKPassbookBridgeSettingsController)listSettingsController
{
  return self->_listSettingsController;
}

- (void)setListSettingsController:(id)a3
{
}

- (UIViewController)shieldViewController
{
  return self->_shieldViewController;
}

- (void)setShieldViewController:(id)a3
{
}

- (PKAppProtectionCoordinator)appProtectionCoordinator
{
  return self->_appProtectionCoordinator;
}

- (void)setAppProtectionCoordinator:(id)a3
{
}

- (unint64_t)currentScreen
{
  return self->_currentScreen;
}

- (void)setCurrentScreen:(unint64_t)a3
{
  self->_currentScreen = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isViewVisible
{
  return self->_isViewVisible;
}

- (void)setIsViewVisible:(BOOL)a3
{
  self->_isViewVisible = a3;
}

- (BOOL)isInAppSwitcher
{
  return self->_isInAppSwitcher;
}

- (void)setIsInAppSwitcher:(BOOL)a3
{
  self->_isInAppSwitcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtectionCoordinator, 0);
  objc_storeStrong((id *)&self->_shieldViewController, 0);

  objc_storeStrong((id *)&self->_listSettingsController, 0);
}

@end