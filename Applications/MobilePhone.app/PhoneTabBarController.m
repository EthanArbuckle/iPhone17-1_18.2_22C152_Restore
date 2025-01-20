@interface PhoneTabBarController
+ (id)defaultPNGName;
+ (int64_t)statusBarStyle;
- (BOOL)handleUserActivityContinuation:(id)a3;
- (BOOL)shouldDisableEdgeClip;
- (BOOL)shouldShowLastViewedTabGivenLastViewedTab:(int)a3;
- (BOOL)shouldSnapshot;
- (BOOL)shouldSwitchToMostRecentViewType;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (MPAnalyticsLogger)analyticsLogger;
- (MPFavoritesTableViewController)favoritesViewController;
- (MPKeypadViewController)keypadViewController;
- (MPRecentsTableViewController)recentsTableViewController;
- (PHBootSession)bootSession;
- (PHContactsViewController)contactsViewController;
- (PHVoicemailNavigationController)voicemailViewController;
- (PhoneTabBarController)init;
- (TUFeatureFlags)featureFlags;
- (UINavigationController)favoritesNavigationController;
- (UINavigationController)recentsNavigationController;
- (UIToolbar)toolbar;
- (_TtC11MobilePhone25RecentCallsViewController)recentsViewController;
- (id)viewControllerForTabViewType:(int)a3;
- (int)currentTabViewType;
- (int)defaultTabViewType;
- (int)tabTypeForViewController:(id)a3;
- (int)tabViewTypeToReturnTo:(id)a3;
- (void)_badgeChanged:(id)a3;
- (void)_startListeningForBadgeChangedNotifications:(id)a3;
- (void)_stopListeningForBadgeChangedNotifications:(id)a3;
- (void)_updateAllBadges:(BOOL)a3;
- (void)_updateBottomTabs;
- (void)_updateBottomTabs:(BOOL)a3 lastViewTypeNumber:(id)a4;
- (void)_willAppearInRemoteViewController;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)popCurrentNavigationControllerToRootViewControllerIfAppropriate;
- (void)prepareForSnapshot;
- (void)registerForBadgeUpdateNotification;
- (void)setAnalyticsLogger:(id)a3;
- (void)setBootSession:(id)a3;
- (void)setContactsViewController:(id)a3;
- (void)setFavoritesNavigationController:(id)a3;
- (void)setFavoritesViewController:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setKeypadViewController:(id)a3;
- (void)setRecentsNavigationController:(id)a3;
- (void)setRecentsTableViewController:(id)a3;
- (void)setRecentsViewController:(id)a3;
- (void)setSelectedViewController:(id)a3;
- (void)setShouldSwitchToMostRecentViewType:(BOOL)a3;
- (void)setToolbar:(id)a3;
- (void)setVoicemailViewController:(id)a3;
- (void)showFavoritesTab:(BOOL)a3 recentsTab:(BOOL)a4 contactsTab:(BOOL)a5 keypadTab:(BOOL)a6 voicemailTab:(BOOL)a7 prewarm:(int)a8;
- (void)switchToMostRecentlyUsedTabType:(id)a3;
- (void)switchToTab:(int)a3;
- (void)transitionCompleted;
- (void)updateSelectedViewController:(id)a3;
- (void)updateUserActivityState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PhoneTabBarController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v4 viewWillAppear:a3];
  if ([(PhoneTabBarController *)self currentTabViewType] == 5
    && ([UIApp hasEnhancedVoicemail] & 1) == 0
    && ([UIApp isRunningTest] & 1) == 0
    && ([UIApp launchedToTest] & 1) == 0)
  {
    [(PhoneTabBarController *)self switchToTab:[(PhoneTabBarController *)self defaultTabViewType]];
  }
}

- (void)switchToTab:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-[PhoneTabBarController switchToTab:%d]", buf, 8u);
  }

  switch((int)v3)
  {
    case 1:
      uint64_t v6 = [(PhoneTabBarController *)self favoritesNavigationController];
      goto LABEL_13;
    case 2:
      v8 = +[MPPreferences sharedPreferences];
      unsigned int v9 = [v8 useSwiftUIRecents];

      if (v9) {
        [(PhoneTabBarController *)self recentsViewController];
      }
      else {
      uint64_t v6 = [(PhoneTabBarController *)self recentsNavigationController];
      }
      goto LABEL_13;
    case 3:
      uint64_t v6 = [(PhoneTabBarController *)self contactsViewController];
      goto LABEL_13;
    case 4:
      uint64_t v6 = [(PhoneTabBarController *)self keypadViewController];
      goto LABEL_13;
    case 5:
      uint64_t v6 = [(PhoneTabBarController *)self voicemailViewController];
LABEL_13:
      v7 = (void *)v6;
      if (!v6) {
        goto LABEL_18;
      }
      v10 = [(PhoneTabBarController *)self viewControllers];
      unsigned int v11 = [v10 containsObject:v7];

      if (!v11) {
        goto LABEL_18;
      }
      v12 = [(PhoneTabBarController *)self selectedViewController];

      if (v7 != v12) {
        [(PhoneTabBarController *)self updateSelectedViewController:v7];
      }
      analyticsLogger = self->_analyticsLogger;
      v14 = +[NSNumber numberWithInt:v3, @"action", @"tab", &off_10028CE90];
      v17[1] = v14;
      v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:2];
      [(MPAnalyticsLogger *)analyticsLogger logEvent:@"com.apple.MobilePhone.TabSwitch" withCoreAnalyticsDictionary:v15];

      break;
    default:
      v7 = 0;
LABEL_18:
      [(PhoneTabBarController *)self switchToTab:[(PhoneTabBarController *)self defaultTabViewType]];
      break;
  }
}

- (void)popCurrentNavigationControllerToRootViewControllerIfAppropriate
{
  unsigned int v3 = [(PhoneTabBarController *)self currentTabViewType];
  if (v3 == 1)
  {
    uint64_t v6 = &OBJC_IVAR___PhoneTabBarController__favoritesNavigationController;
    goto LABEL_6;
  }
  if (v3 == 2)
  {
    objc_super v4 = +[MPPreferences sharedPreferences];
    unsigned __int8 v5 = [v4 useSwiftUIRecents];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = &OBJC_IVAR___PhoneTabBarController__recentsNavigationController;
LABEL_6:
      id v7 = [*(id *)((char *)&self->super.super.super.super.isa + *v6) popToRootViewControllerAnimated:0];
    }
  }
}

- (int)currentTabViewType
{
  v2 = self;
  unsigned int v3 = [(PhoneTabBarController *)self selectedViewController];
  LODWORD(v2) = [(PhoneTabBarController *)v2 tabTypeForViewController:v3];

  return (int)v2;
}

- (int)tabTypeForViewController:(id)a3
{
  id v5 = a3;
  id v6 = [(PhoneTabBarController *)self favoritesNavigationController];

  if (v6 == v5)
  {
    int v18 = 1;
    goto LABEL_15;
  }
  uint64_t v7 = [(PhoneTabBarController *)self recentsNavigationController];
  if ((id)v7 == v5)
  {

    goto LABEL_14;
  }
  v8 = (void *)v7;
  uint64_t v9 = [(PhoneTabBarController *)self recentsViewController];
  if ((id)v9 == v5)
  {

    goto LABEL_14;
  }
  v10 = (void *)v9;
  id v11 = [(PhoneTabBarController *)self recentsTableViewController];

  if (v11 == v5)
  {
LABEL_14:
    int v18 = 2;
    goto LABEL_15;
  }
  id v12 = [(PhoneTabBarController *)self contactsViewController];

  if (v12 == v5)
  {
    int v18 = 3;
  }
  else
  {
    id v13 = [(PhoneTabBarController *)self keypadViewController];

    if (v13 == v5)
    {
      int v18 = 4;
    }
    else
    {
      id v14 = [(PhoneTabBarController *)self voicemailViewController];

      if (v14 == v5)
      {
        int v18 = 5;
      }
      else
      {
        v15 = PHDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[PhoneTabBarController tabTypeForViewController:](self, v15);
        }

        uint64_t v16 = +[NSString stringWithFormat:@"Unknown view controller: %@", v5];
        v17 = +[NSAssertionHandler currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"PhoneTabBarController.m" lineNumber:777 description:v16];

        int v18 = 0;
      }
    }
  }
LABEL_15:

  return v18;
}

- (UINavigationController)recentsNavigationController
{
  return &self->_recentsNavigationController->super;
}

- (UINavigationController)favoritesNavigationController
{
  return &self->_favoritesNavigationController->super;
}

- (void)updateUserActivityState:(id)a3
{
  uint64_t v4 = [(PhoneTabBarController *)self currentTabViewType];
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity continuity - Saving out currentTabType %d", buf, 8u);
  }

  id v6 = [(PhoneTabBarController *)self userActivity];
  uint64_t v7 = [(PhoneTabBarController *)self selectedViewController];
  v8 = [v7 title];
  [v6 setTitle:v8];

  uint64_t v9 = [(PhoneTabBarController *)self userActivity];
  v10 = +[NSNumber numberWithInt:v4, @"PHLastTabTypeKey"];
  id v13 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v9 setUserInfo:v11];
}

void __54__PhoneTabBarController_updateSelectedViewController___block_invoke(uint64_t a1)
{
  v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Activity continuity - Activity needs saving as the tab bar tab changed to %d", (uint8_t *)v8, 8u);
  }

  uint64_t v4 = [*(id *)(a1 + 32) userActivity];

  if (!v4)
  {
    id v5 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.mobilephone"];
    [*(id *)(a1 + 32) setUserActivity:v5];

    id v6 = [*(id *)(a1 + 32) userActivity];
    [v6 becomeCurrent];
  }
  uint64_t v7 = [*(id *)(a1 + 32) userActivity];
  [v7 setNeedsSave:1];
}

- (void)updateSelectedViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PhoneTabBarController;
  id v4 = a3;
  [(PhoneTabBarController *)&v8 setSelectedViewController:v4];
  [(PhoneTabBarController *)self popCurrentNavigationControllerToRootViewControllerIfAppropriate];
  unsigned int v5 = [(PhoneTabBarController *)self tabTypeForViewController:v4];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __54__PhoneTabBarController_updateSelectedViewController___block_invoke;
  v6[3] = &unk_10027D240;
  unsigned int v7 = v5;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  [(PhoneTabBarController *)self setShouldSwitchToMostRecentViewType:0];
}

- (void)_badgeChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneTabBarController badge changed notification %@", (uint8_t *)&v6, 0xCu);
  }

  [(PhoneTabBarController *)self _updateAllBadges:0];
}

- (void)_updateAllBadges:(BOOL)a3
{
  BOOL v3 = a3;
  [(PhoneTabBarController *)self registerForBadgeUpdateNotification];
  if (self->_voicemailViewController)
  {
    unsigned int v5 = [(PhoneTabBarController *)self tabBar];
    int v6 = [v5 items];
    id v7 = [v6 count];

    if ((unint64_t)v7 >= 5)
    {
      char v8 = [(id)objc_opt_class() badge];
      v10 = PhoneStringForBadgeValue(v8, v9);
      id v11 = [(PhoneTabBarController *)self tabBar];
      uint64_t v12 = [v11 items];
      id v13 = [v12 objectAtIndex:4];
      [v13 setBadgeValue:v10];
    }
  }
  if (v3)
  {
    [(PhoneTabBarController *)self performSelector:"_badgeChanged:" withObject:self afterDelay:0.0];
  }
  else
  {
    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 postNotificationName:PhoneRootViewControllerApplicationBadgeChangedNotification object:0];
  }
}

- (void)registerForBadgeUpdateNotification
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __59__PhoneTabBarController_registerForBadgeUpdateNotification__block_invoke;
  block[3] = &unk_10027C670;
  block[4] = self;
  if (registerForBadgeUpdateNotification_onceToken != -1) {
    dispatch_once(&registerForBadgeUpdateNotification_onceToken, block);
  }
}

- (PhoneTabBarController)init
{
  v17.receiver = self;
  v17.super_class = (Class)PhoneTabBarController;
  v2 = [(PhoneTabBarController *)&v17 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(PhoneTabBarController *)v2 setDelegate:v2];
    [(PhoneTabBarController *)v3 setShouldSwitchToMostRecentViewType:1];
    id v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v3->_featureFlags;
    v3->_featureFlags = v4;

    int v6 = objc_alloc_init(MPAnalyticsLogger);
    analyticsLogger = v3->_analyticsLogger;
    v3->_analyticsLogger = v6;

    if (([UIApp tabBarFillsScreen] & 1) == 0) {
      [(PhoneTabBarController *)v3 setDefinesPresentationContext:1];
    }
    if ([UIApp userInterfaceStyle] == 1)
    {
      char v8 = [(PhoneTabBarController *)v3 tabBar];
      [v8 setBarStyle:1];
    }
    if ([UIApp userInterfaceStyle] == 1)
    {
      [(PhoneTabBarController *)v3 setDefinesPresentationContext:1];
      [(PhoneTabBarController *)v3 setProvidesPresentationContextTransitionStyle:1];
      [(PhoneTabBarController *)v3 setModalTransitionStyle:14];
    }
    if (+[UIApplication shouldMakeUIForDefaultPNG])
    {
      id v9 = objc_alloc((Class)UIImage);
      v10 = +[NSData data];
      id v11 = [v9 initWithData:v10];

      uint64_t v12 = [(PhoneTabBarController *)v3 tabBar];
      [v12 _setSelectionIndicatorImage:v11];
    }
    id v13 = PHPreferencesGetValueInDomain(@"PHLastTabTypeKey", TUBundleIdentifierMobilePhoneApplication);
    [(PhoneTabBarController *)v3 _updateBottomTabs:0 lastViewTypeNumber:v13];
    TUAddTelephonyCenterObserver();
    uint64_t v14 = objc_opt_new();
    bootSession = v3->_bootSession;
    v3->_bootSession = (PHBootSession *)v14;

    [(PhoneTabBarController *)v3 switchToMostRecentlyUsedTabType:v13];
  }
  return v3;
}

- (void)setShouldSwitchToMostRecentViewType:(BOOL)a3
{
  self->_shouldSwitchToMostRecentViewType = a3;
}

- (void)switchToMostRecentlyUsedTabType:(id)a3
{
  uint64_t v4 = [(PhoneTabBarController *)self tabViewTypeToReturnTo:a3];
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resuming to tab type: %d", (uint8_t *)v6, 8u);
  }

  [(PhoneTabBarController *)self switchToTab:v4];
}

- (int)tabViewTypeToReturnTo:(id)a3
{
  id v4 = a3;
  int v5 = [(PhoneTabBarController *)self defaultTabViewType];
  if (!v4)
  {
    PHPreferencesGetValueInDomain(@"PHLastTabTypeKey", TUBundleIdentifierMobilePhoneApplication);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[PhoneTabBarController shouldShowLastViewedTabGivenLastViewedTab:](self, "shouldShowLastViewedTabGivenLastViewedTab:", [v4 intValue]))
  {
    int v5 = [v4 intValue];
  }

  return v5;
}

- (BOOL)shouldShowLastViewedTabGivenLastViewedTab:(int)a3
{
  int v5 = [(PhoneTabBarController *)self bootSession];
  unsigned __int8 v6 = [v5 isInDifferentBootSession];

  id v7 = [(PhoneTabBarController *)self bootSession];
  [v7 persistBootSessionID];

  if (a3 == 5) {
    return v6 ^ 1;
  }
  else {
    return 1;
  }
}

- (PHBootSession)bootSession
{
  return self->_bootSession;
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v3 applicationDidResume];
  if ([(PhoneTabBarController *)self shouldSwitchToMostRecentViewType]) {
    [(PhoneTabBarController *)self switchToMostRecentlyUsedTabType:0];
  }
}

- (BOOL)shouldSwitchToMostRecentViewType
{
  return self->_shouldSwitchToMostRecentViewType;
}

- (void)_updateBottomTabs:(BOOL)a3 lastViewTypeNumber:(id)a4
{
  id v6 = a4;
  id v7 = +[PHApplicationServices sharedInstance];
  char v8 = [v7 contactStore];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __62__PhoneTabBarController__updateBottomTabs_lastViewTypeNumber___block_invoke;
  v12[3] = &unk_10027D268;
  v12[4] = self;
  uint64_t v9 = PHShouldOptimisticallyHideVoicemailUI(v12) ^ 1;
  if (a3)
  {
    uint64_t v10 = [(PhoneTabBarController *)self currentTabViewType];
    [(PhoneTabBarController *)self showFavoritesTab:v8 != 0 recentsTab:1 contactsTab:v8 != 0 keypadTab:1 voicemailTab:v9 prewarm:v10];
    [(PhoneTabBarController *)self switchToTab:v10];
  }
  else
  {
    if (v6) {
      BOOL v11 = [v6 intValue] == 1;
    }
    else {
      BOOL v11 = 0;
    }
    [(PhoneTabBarController *)self showFavoritesTab:v8 != 0 recentsTab:1 contactsTab:v8 != 0 keypadTab:1 voicemailTab:v9 prewarm:v11];
  }
}

- (void)showFavoritesTab:(BOOL)a3 recentsTab:(BOOL)a4 contactsTab:(BOOL)a5 keypadTab:(BOOL)a6 voicemailTab:(BOOL)a7 prewarm:(int)a8
{
  BOOL v57 = a6;
  BOOL v58 = a7;
  BOOL v56 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v12 = +[NSMutableArray arrayWithCapacity:5];
  id v13 = +[PHApplicationServices sharedInstance];
  uint64_t v14 = [v13 callProviderManager];
  int v15 = [v13 suggestedContactStore];
  uint64_t v16 = [v13 metadataCache];
  objc_super v17 = (void *)v16;
  if (v10)
  {
    int v18 = (void *)v16;
    if (!self->_favoritesViewController)
    {
      v54 = v14;
      v53 = [v13 favoritesController];
      v24 = [[MPFavoritesTableViewController alloc] initWithFavoritesController:v53];
      favoritesViewController = self->_favoritesViewController;
      self->_favoritesViewController = v24;

      [(PhoneTabBarController *)self _startListeningForBadgeChangedNotifications:self->_favoritesViewController];
      v26 = [[PhoneNavigationController alloc] initWithNibName:0 bundle:0];
      favoritesNavigationController = self->_favoritesNavigationController;
      self->_favoritesNavigationController = v26;

      v60 = self->_favoritesViewController;
      v28 = +[NSArray arrayWithObjects:&v60 count:1];
      [(PhoneNavigationController *)self->_favoritesNavigationController setViewControllers:v28];

      if (a8 == 1)
      {
        [(MPFavoritesTableViewController *)self->_favoritesViewController setIsInitialTab:1];
        [v53 fetchIfNeeded];
      }

      uint64_t v14 = v54;
    }
    [v12 addObject:self->_favoritesNavigationController];
    objc_super v17 = v18;
    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    int v19 = self->_favoritesNavigationController;
    self->_favoritesNavigationController = 0;

    [(PhoneTabBarController *)self _stopListeningForBadgeChangedNotifications:self->_favoritesViewController];
    v20 = self->_favoritesViewController;
    self->_favoritesViewController = 0;

    if (v9)
    {
LABEL_13:
      if (!self->_recentsTableViewController)
      {
        v55 = [UIApp recentsController];
        v29 = [[MPRecentsTableViewController alloc] initWithRecentsController:v55];
        recentsTableViewController = self->_recentsTableViewController;
        self->_recentsTableViewController = v29;

        [(PhoneTabBarController *)self _startListeningForBadgeChangedNotifications:self->_recentsTableViewController];
        v31 = [[PhoneNavigationController alloc] initWithNibName:0 bundle:0];
        recentsNavigationController = self->_recentsNavigationController;
        self->_recentsNavigationController = v31;

        v33 = +[PHApplicationServices sharedInstance];
        [v33 voicemailController];
        v34 = v17;
        v35 = v15;
        v37 = v36 = v14;

        [(PhoneNavigationController *)self->_recentsNavigationController setVoicemailController:v37];
        v59 = self->_recentsTableViewController;
        v38 = +[NSArray arrayWithObjects:&v59 count:1];
        [(PhoneNavigationController *)self->_recentsNavigationController setViewControllers:v38];

        uint64_t v14 = v36;
        int v15 = v35;
        objc_super v17 = v34;
      }
      [v12 addObject:self->_recentsNavigationController];
      goto LABEL_16;
    }
  }
  v21 = self->_recentsNavigationController;
  self->_recentsNavigationController = 0;

  if (self->_recentsTableViewController)
  {
    -[PhoneTabBarController _stopListeningForBadgeChangedNotifications:](self, "_stopListeningForBadgeChangedNotifications:");
    v22 = self->_recentsTableViewController;
    self->_recentsTableViewController = 0;
  }
  if (self->_recentsViewController)
  {
    -[PhoneTabBarController _stopListeningForBadgeChangedNotifications:](self, "_stopListeningForBadgeChangedNotifications:");
    recentsViewController = self->_recentsViewController;
    self->_recentsViewController = 0;
  }
LABEL_16:
  contactsViewController = self->_contactsViewController;
  if (v56)
  {
    if (!contactsViewController)
    {
      v40 = [[PHContactsViewController alloc] initWithContactStore:v15];
      v41 = self->_contactsViewController;
      self->_contactsViewController = v40;

      [(PhoneTabBarController *)self _startListeningForBadgeChangedNotifications:self->_contactsViewController];
      contactsViewController = self->_contactsViewController;
    }
    [v12 addObject:contactsViewController];
  }
  else
  {
    [(PhoneTabBarController *)self _stopListeningForBadgeChangedNotifications:contactsViewController];
    v42 = self->_contactsViewController;
    self->_contactsViewController = 0;
  }
  if (v57 && [UIApp showsPhoneDialer])
  {
    keypadViewController = self->_keypadViewController;
    if (!keypadViewController)
    {
      v44 = [(DialerController *)[MPKeypadViewController alloc] initWithDialerType:0 contactStore:v15];
      v45 = self->_keypadViewController;
      self->_keypadViewController = v44;

      [(DialerController *)self->_keypadViewController setCallProviderManager:v14];
      [(MPKeypadViewController *)self->_keypadViewController setMetadataCache:v17];
      keypadViewController = self->_keypadViewController;
    }
    [v12 addObject:keypadViewController];
  }
  else
  {
    v46 = self->_keypadViewController;
    self->_keypadViewController = 0;
  }
  voicemailViewController = self->_voicemailViewController;
  if (v58)
  {
    if (!voicemailViewController)
    {
      v48 = +[PHApplicationServices sharedInstance];
      v49 = [v48 voicemailController];

      v50 = objc_alloc_init(PHVoicemailNavigationController);
      v51 = self->_voicemailViewController;
      self->_voicemailViewController = v50;

      [(PhoneNavigationController *)self->_voicemailViewController setVoicemailController:v49];
      [(PhoneTabBarController *)self _startListeningForBadgeChangedNotifications:self->_voicemailViewController];

      voicemailViewController = self->_voicemailViewController;
    }
    [v12 addObject:voicemailViewController];
  }
  else
  {
    [(PhoneTabBarController *)self _stopListeningForBadgeChangedNotifications:voicemailViewController];
    v52 = self->_voicemailViewController;
    self->_voicemailViewController = 0;
  }
  [(PhoneTabBarController *)self registerForBadgeUpdateNotification];
  [(PhoneTabBarController *)self setViewControllers:v12];
}

- (void)_startListeningForBadgeChangedNotifications:(id)a3
{
  id v4 = a3;
  id v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = objc_opt_class();

  [v6 addObserver:self selector:"_badgeChanged:" name:@"com.apple.mobilephone.BadgeChanged" object:v5];
}

- (int)defaultTabViewType
{
  if ([UIApp showsPhoneDialer]) {
    return 4;
  }
  objc_super v3 = +[PHApplicationServices sharedInstance];
  id v4 = [v3 contactStore];

  if (v4) {
    return 3;
  }
  else {
    return 2;
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v8 viewDidLoad];
  objc_super v3 = +[CNKFeatures sharedInstance];
  unsigned __int8 v4 = [v3 isUIFluidTransitionsEnabled];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = +[UIColor clearColor];
    id v6 = [(PhoneTabBarController *)self view];
    [v6 setBackgroundColor:v5];
  }
  id v7 = [(PhoneTabBarController *)self view];
  [v7 setOpaque:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v5 viewDidAppear:a3];
  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PHPhoneTabBarControllerViewDidAppearNotification" object:self];
}

void __59__PhoneTabBarController_registerForBadgeUpdateNotification__block_invoke(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_badgeChanged:" name:@"PhoneApplicationLocaleChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  TURemoveTelephonyCenterObserver();
  favoritesNavigationController = self->_favoritesNavigationController;
  self->_favoritesNavigationController = 0;

  recentsNavigationController = self->_recentsNavigationController;
  self->_recentsNavigationController = 0;

  favoritesViewController = self->_favoritesViewController;
  self->_favoritesViewController = 0;

  recentsTableViewController = self->_recentsTableViewController;
  self->_recentsTableViewController = 0;

  recentsViewController = self->_recentsViewController;
  self->_recentsViewController = 0;

  contactsViewController = self->_contactsViewController;
  self->_contactsViewController = 0;

  voicemailViewController = self->_voicemailViewController;
  self->_voicemailViewController = 0;

  v11.receiver = self;
  v11.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v11 dealloc];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v3 viewDidDisappear:a3];
}

- (void)_stopListeningForBadgeChangedNotifications:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v5 = objc_opt_class();

    [v6 removeObserver:self name:@"com.apple.mobilephone.BadgeChanged" object:v5];
  }
}

- (void)applicationWillSuspend
{
  v6.receiver = self;
  v6.super_class = (Class)PhoneTabBarController;
  [(PhoneTabBarController *)&v6 applicationWillSuspend];
  uint64_t v3 = [(PhoneTabBarController *)self currentTabViewType];
  id v4 = +[NSNumber numberWithInt:v3];
  PHPreferencesSetValueInDomain(@"PHLastTabTypeKey", v4, TUBundleIdentifierMobilePhoneApplication);

  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wrote out last tab type: %d", buf, 8u);
  }

  [(PhoneTabBarController *)self setShouldSwitchToMostRecentViewType:1];
}

- (void)setSelectedViewController:(id)a3
{
  id v4 = a3;
  [(PhoneTabBarController *)self updateSelectedViewController:v4];
  analyticsLogger = self->_analyticsLogger;
  v9[0] = @"action";
  v9[1] = @"tab";
  v10[0] = &off_10028CE78;
  uint64_t v6 = [(PhoneTabBarController *)self tabTypeForViewController:v4];

  id v7 = +[NSNumber numberWithInt:v6];
  v10[1] = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [(MPAnalyticsLogger *)analyticsLogger logEvent:@"com.apple.MobilePhone.TabSwitch" withCoreAnalyticsDictionary:v8];
}

- (void)_updateBottomTabs
{
}

id __62__PhoneTabBarController__updateBottomTabs_lastViewTypeNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBottomTabs];
}

- (BOOL)handleUserActivityContinuation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v4 activityType];
  id v7 = v6;
  v54 = self;
  if (!v5 || !v6 || [v6 caseInsensitiveCompare:@"com.apple.Contacts.ViewingCard"])
  {
    int v8 = [v4 interaction];

    if (v8)
    {
      BOOL v9 = [v4 interaction];
      BOOL v10 = [(MPMessageID *)v9 intent];
      CUTWeakLinkClass();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        uint64_t v12 = PHDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Activity continuity - Play voicemail activity", buf, 2u);
        }

        uint64_t v13 = 5;
      }
      else
      {
        uint64_t v13 = 0;
      }

      v21 = 0;
      int v18 = 0;
      v20 = 0;
      goto LABEL_21;
    }
    uint64_t v14 = [(PhoneTabBarController *)self featureFlags];
    unsigned int v15 = [v14 callHistorySearchEnabled];
    if (v5 && v15 && v7)
    {
      unsigned int v16 = [v7 isEqual:CSQueryContinuationActionType];

      if (v16)
      {
        objc_super v17 = PHDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Activity continuity - Spotlight search in app activity", buf, 2u);
        }

        int v18 = [v5 objectForKey:CSSearchQueryString];
        if ([(MPMessageID *)v18 length])
        {
          int v19 = PHDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            BOOL v56 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Activity continuity - Spotlight search activity with searchQuery: %@", buf, 0xCu);
          }

          v20 = 0;
          uint64_t v13 = 2;
          goto LABEL_57;
        }
        v21 = 0;
        v20 = 0;
        v22 = 0;
        uint64_t v13 = 0;
        char isKindOfClass = 0;
        goto LABEL_48;
      }
    }
    else
    {
    }
    v28 = [(PhoneTabBarController *)self featureFlags];
    unsigned int v29 = [v28 callHistorySearchEnabled];
    if (v5 && v29 && v7)
    {
      unsigned int v30 = [v7 isEqual:CSSearchableItemActionType];

      if (v30)
      {
        v31 = PHDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Activity continuity - Spotlight search result continuity activity", buf, 2u);
        }

        BOOL v9 = [v5 objectForKey:CSSearchableItemActivityIdentifier];
        int v18 = [v5 objectForKey:CSSearchQueryString];
        if (v9)
        {
          id v32 = objc_alloc_init((Class)CHManager);
          v33 = +[CHRecentCall predicateForCallsWithUniqueID:v9];
          v34 = [v32 callsWithPredicate:v33 limit:1 offset:0 batchSize:0];

          v53 = v34;
          if ([v34 count])
          {
            id v52 = v32;
            v20 = v9;
            v35 = PHDefaultLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              BOOL v56 = v18;
              __int16 v57 = 2112;
              BOOL v58 = v20;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Activity continuity - Spotlight call search activity with searchQuery: %@ recentsUniqueID: %@", buf, 0x16u);
            }
            v21 = 0;
            char isKindOfClass = 1;
            uint64_t v13 = 2;
          }
          else
          {
            v48 = [(PhoneTabBarController *)self featureFlags];
            unsigned int v49 = [v48 voicemailSearchEnabled];

            if (!v49)
            {
              v21 = 0;
              v20 = 0;
              uint64_t v13 = 0;
              char isKindOfClass = 0;
LABEL_84:

LABEL_21:
              v22 = 0;
              goto LABEL_47;
            }
            id v52 = v32;
            v35 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
            if (v35
              && (v50 = [[MPMessageID alloc] initWithUuid:v35]) != 0)
            {
              v21 = v50;
              v51 = PHDefaultLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                BOOL v56 = v21;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Activity continuity - Spotlight voicemail search result activity with messageID: %@", buf, 0xCu);
              }
              uint64_t v13 = 5;
              char isKindOfClass = 1;
            }
            else
            {
              v51 = PHDefaultLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                BOOL v56 = v9;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[WARN] Activity continuity - Failed to create MPMessageID for uniqueIdentifier %@", buf, 0xCu);
              }
              char isKindOfClass = 0;
              v21 = 0;
              uint64_t v13 = 0;
            }

            v20 = 0;
          }

          id v32 = v52;
          goto LABEL_84;
        }
        v21 = 0;
        v20 = 0;
        v22 = 0;
        goto LABEL_29;
      }
    }
    else
    {
    }
    v36 = PHDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Activity continuity - Phone activity", buf, 2u);
    }

    BOOL v9 = [v5 objectForKey:@"PHLastTabTypeKey"];
    uint64_t v13 = (uint64_t)[(MPMessageID *)v9 intValue];
    v21 = 0;
    int v18 = 0;
    v20 = 0;
    v22 = 0;
    goto LABEL_46;
  }
  v23 = PHDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Activity continuity - com.apple.Contacts.ViewingCard activity", buf, 2u);
  }

  BOOL v9 = +[PHApplicationServices sharedInstance];
  v24 = [(MPMessageID *)v9 contactStore];
  v25 = +[CNContactViewController descriptorForRequiredKeys];
  v59 = v25;
  v26 = +[NSArray arrayWithObjects:&v59 count:1];
  v22 = [v24 contactWithUserActivityUserInfo:v5 keysToFetch:v26];

  if (!v22)
  {
    v27 = PHDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[PhoneTabBarController handleUserActivityContinuation:]((uint64_t)v5, v27);
    }
  }
  v21 = 0;
  int v18 = 0;
  v20 = 0;
LABEL_29:
  uint64_t v13 = 0;
LABEL_46:
  char isKindOfClass = 0;
LABEL_47:

  if (v13)
  {
LABEL_49:
    if (v22)
    {
      v37 = PHDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v56 = v22;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Activity continuity - Resuming to contact: %@", buf, 0xCu);
      }

      [(PhoneTabBarController *)v54 switchToTab:3];
      v38 = [(PhoneTabBarController *)v54 contactsViewController];
      [v38 showCardForContact:v22 animated:0];

LABEL_69:
      char isKindOfClass = 1;
      goto LABEL_70;
    }
    self = v54;
    if (v21)
    {
      v39 = PHDefaultLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = [(MPMessageID *)v21 messageUUID];
        *(_DWORD *)buf = 138412290;
        BOOL v56 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Activity continuity - Resuming to voicemail with messageID: %@", buf, 0xCu);
      }
      [(PhoneTabBarController *)v54 switchToTab:5];
      v41 = [(PhoneTabBarController *)v54 voicemailViewController];
      [v41 playMessageWithID:v21];

      v22 = 0;
      goto LABEL_69;
    }
LABEL_57:
    v42 = PHDefaultLog();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v43)
      {
        *(_DWORD *)buf = 138412546;
        BOOL v56 = v18;
        __int16 v57 = 2112;
        BOOL v58 = v20;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Activity continuity - Resuming to recents search with searchQuery: %@ recentsUniqueID: %@", buf, 0x16u);
      }

      [(PhoneTabBarController *)self switchToTab:2];
      id v44 = [(MPMessageID *)v20 length];
      v45 = [(PhoneTabBarController *)self recentsTableViewController];
      v46 = v45;
      if (v44) {
        [v45 handleShowDetailsURLForUniqueID:v20 withContinuingSearchText:v18];
      }
      else {
        [v45 startSearchingForText:v18];
      }

      v22 = 0;
    }
    else
    {
      if (v43)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v56) = v13;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Activity continuity - Resuming to tab type: %d", buf, 8u);
      }

      [(PhoneTabBarController *)self switchToTab:v13];
      v22 = 0;
      int v18 = 0;
    }
    v21 = 0;
    goto LABEL_69;
  }
LABEL_48:
  if (v22) {
    goto LABEL_49;
  }
LABEL_70:

  return isKindOfClass & 1;
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 scheme];
  uint64_t v6 = [v5 lowercaseString];

  if ([v6 isEqualToString:@"mobilephone-contacts"])
  {
    id v7 = [v4 host];
    int v8 = [v7 lowercaseString];

    if (v8 && [v8 isEqualToString:@"show"])
    {
      BOOL v9 = [v4 query];
      BOOL v10 = (char *)[v9 rangeOfString:@"="];
      if (v10)
      {
        objc_super v11 = v10;
        if (v10 < (char *)[v9 length] - 1)
        {
          uint64_t v12 = [v9 substringToIndex:v11];
          uint64_t v13 = [v9 substringFromIndex:v11 + 1];
          if ([v12 isEqualToString:@"id"])
          {
            uint64_t v14 = +[PHApplicationServices sharedInstance];
            [v14 contactStore];
            uint64_t v15 = v28 = v13;

            unsigned int v16 = +[CNContactViewController descriptorForRequiredKeys];
            v31 = v16;
            objc_super v17 = +[NSArray arrayWithObjects:&v31 count:1];
            unsigned int v29 = (void *)v15;
            int v18 = (void *)v15;
            uint64_t v13 = v28;
            int v19 = [v18 contactForIdentifier:v28 keysToFetch:v17];

            if (v19)
            {
              v20 = [(PhoneTabBarController *)self contactsViewController];
              [v20 showCardForContact:v19 animated:0];
            }
          }
        }
      }
    }
    uint64_t v21 = [(PhoneTabBarController *)self contactsViewController];
LABEL_19:
    id v23 = (id)v21;
    goto LABEL_20;
  }
  if ([v6 isEqualToString:@"vmshow"])
  {
    int v8 = [v4 voicemailMessageUUID];
    if (v8 || [UIApp hasEnhancedVoicemail])
    {
      v22 = PHDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Switching to Voicemail tab to show a voicemail.", buf, 2u);
      }

      uint64_t v21 = [(PhoneTabBarController *)self voicemailViewController];
      goto LABEL_19;
    }
    id v23 = 0;
LABEL_20:

    if (!v23) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  if (([v6 isEqualToString:@"mobilephone-recents"] & 1) != 0
    || [v6 isEqualToString:@"mobilephone-unknowncallerstip"])
  {
    v24 = +[MPPreferences sharedPreferences];
    unsigned int v25 = [v24 useSwiftUIRecents];

    if (!v25)
    {
      id v23 = [(PhoneTabBarController *)self recentsNavigationController];
      [(PhoneTabBarController *)self switchToTab:[(PhoneTabBarController *)self tabTypeForViewController:v23]];
      int v8 = [v4 recentsUniqueID];
      if ([v8 length])
      {
        v27 = [(PhoneTabBarController *)self recentsTableViewController];
        [v27 handleShowDetailsURLForUniqueID:v8];
      }
      goto LABEL_20;
    }
    uint64_t v26 = [(PhoneTabBarController *)self recentsViewController];
  }
  else if ([v6 isEqualToString:@"mobilephone-favorites"])
  {
    uint64_t v26 = [(PhoneTabBarController *)self favoritesNavigationController];
  }
  else
  {
    if (![v6 isEqualToString:@"mobilephone-keypad"])
    {
      id v23 = 0;
      goto LABEL_25;
    }
    uint64_t v26 = [(PhoneTabBarController *)self keypadViewController];
  }
  id v23 = (id)v26;
  if (!v26) {
    goto LABEL_25;
  }
LABEL_21:
  [(PhoneTabBarController *)self switchToTab:[(PhoneTabBarController *)self tabTypeForViewController:v23]];
  if ([v23 conformsToProtocol:&OBJC_PROTOCOL___PhoneTabViewController])
  {
    id v23 = v23;
    if (objc_opt_respondsToSelector()) {
      [v23 handleURL:v4];
    }
  }
LABEL_25:
}

- (id)viewControllerForTabViewType:(int)a3
{
  id v4 = 0;
  switch(a3)
  {
    case 0:
      break;
    case 1:
      id v4 = [(PhoneTabBarController *)self favoritesViewController];
      break;
    case 2:
      int v8 = +[MPPreferences sharedPreferences];
      unsigned int v9 = [v8 useSwiftUIRecents];

      if (v9) {
        [(PhoneTabBarController *)self recentsViewController];
      }
      else {
      id v4 = [(PhoneTabBarController *)self recentsTableViewController];
      }
      break;
    case 3:
      id v4 = [(PhoneTabBarController *)self contactsViewController];
      break;
    case 4:
      id v4 = [(PhoneTabBarController *)self keypadViewController];
      break;
    case 5:
      id v4 = [(PhoneTabBarController *)self voicemailViewController];
      break;
    default:
      uint64_t v6 = +[NSString stringWithFormat:@"Unknown tab type: %u", *(void *)&a3];
      id v7 = +[NSAssertionHandler currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PhoneTabBarController.m" lineNumber:804 description:v6];

      id v4 = 0;
      break;
  }

  return v4;
}

+ (int64_t)statusBarStyle
{
  return [UIApp userInterfaceStyle] == 1;
}

+ (id)defaultPNGName
{
  id v2 = [UIApp rootViewController];
  uint64_t v3 = [v2 baseViewController];

  id v4 = [v3 selectedViewController];
  uint64_t v5 = [(id)objc_opt_class() defaultPNGName];

  return v5;
}

- (BOOL)shouldDisableEdgeClip
{
  return 0;
}

- (BOOL)shouldSnapshot
{
  id v2 = [(PhoneTabBarController *)self viewControllerForTabViewType:[(PhoneTabBarController *)self currentTabViewType]];
  unsigned __int8 v3 = [v2 shouldSnapshot];

  return v3;
}

- (void)prepareForSnapshot
{
  id v2 = [(PhoneTabBarController *)self viewControllerForTabViewType:[(PhoneTabBarController *)self currentTabViewType]];
  [v2 prepareForSnapshot];
}

- (void)transitionCompleted
{
  unsigned __int8 v3 = [(PhoneTabBarController *)self selectedViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PhoneTabBarController *)self selectedViewController];
    [v5 transitionCompleted];
  }
}

- (void)_willAppearInRemoteViewController
{
  unsigned __int8 v3 = +[PHApplicationServices sharedInstance];
  char v4 = [v3 contactStore];
  BOOL v5 = v4 != 0;

  [(PhoneTabBarController *)self showFavoritesTab:v5 recentsTab:1 contactsTab:v5 keypadTab:1 voicemailTab:0 prewarm:3];
  uint64_t v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"CREATE_NEW_CALL" value:&stru_100285990 table:@"General"];
  int v8 = [(PhoneTabBarController *)self contactsViewController];
  unsigned int v9 = [v8 contactListViewController];
  BOOL v10 = [v9 navigationItem];
  [v10 setPrompt:v7];

  objc_super v11 = [(PhoneTabBarController *)self keypadViewController];
  [v11 setIsHostedInRemoteViewController:1];

  id v12 = [(PhoneTabBarController *)self contactsViewController];
  [(PhoneTabBarController *)self updateSelectedViewController:v12];
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PhoneTabBarController *)self selectedViewController];
  unsigned int v9 = [(PhoneTabBarController *)self keypadViewController];
  if (([v8 isEqual:v9] & 1) == 0)
  {

    goto LABEL_5;
  }
  BOOL v10 = [(PhoneTabBarController *)self contactsViewController];
  unsigned int v11 = [v7 isEqual:v10];

  if (v11)
  {
    int v8 = +[MPSignpost sharedInstance];
    [v8 keypadTabSwitchStarted];
LABEL_5:
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v7 tabBarControllerShouldSelectViewController:v6])
  {
    BOOL v14 = 0;
  }
  else
  {
    id v12 = [v6 selectedViewController];

    if (v12 != v7)
    {
      uint64_t v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotificationName:@"PhoneApplicationDidChangeTabBarSelectionNotification" object:v7 userInfo:0];
    }
    BOOL v14 = 1;
  }

  return v14;
}

- (void)setFavoritesNavigationController:(id)a3
{
}

- (void)setRecentsNavigationController:(id)a3
{
}

- (_TtC11MobilePhone25RecentCallsViewController)recentsViewController
{
  return self->_recentsViewController;
}

- (void)setRecentsViewController:(id)a3
{
}

- (MPRecentsTableViewController)recentsTableViewController
{
  return self->_recentsTableViewController;
}

- (void)setRecentsTableViewController:(id)a3
{
}

- (PHContactsViewController)contactsViewController
{
  return self->_contactsViewController;
}

- (void)setContactsViewController:(id)a3
{
}

- (PHVoicemailNavigationController)voicemailViewController
{
  return self->_voicemailViewController;
}

- (void)setVoicemailViewController:(id)a3
{
}

- (MPFavoritesTableViewController)favoritesViewController
{
  return self->_favoritesViewController;
}

- (void)setFavoritesViewController:(id)a3
{
}

- (MPKeypadViewController)keypadViewController
{
  return self->_keypadViewController;
}

- (void)setKeypadViewController:(id)a3
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (void)setBootSession:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (MPAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_bootSession, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_keypadViewController, 0);
  objc_storeStrong((id *)&self->_favoritesViewController, 0);
  objc_storeStrong((id *)&self->_voicemailViewController, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_storeStrong((id *)&self->_recentsTableViewController, 0);
  objc_storeStrong((id *)&self->_recentsViewController, 0);
  objc_storeStrong((id *)&self->_recentsNavigationController, 0);

  objc_storeStrong((id *)&self->_favoritesNavigationController, 0);
}

- (void)handleUserActivityContinuation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to open a ViewingCard activity, as CNContactStore returned nil for %@", (uint8_t *)&v2, 0xCu);
}

- (void)tabTypeForViewController:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  char v4 = [a1 recentsNavigationController];
  BOOL v5 = [a1 recentsViewController];
  id v6 = [a1 recentsTableViewController];
  id v7 = [a1 favoritesNavigationController];
  int v8 = [a1 contactsViewController];
  unsigned int v9 = [a1 keypadViewController];
  BOOL v10 = [a1 voicemailViewController];
  int v11 = 138413826;
  id v12 = v4;
  __int16 v13 = 2112;
  BOOL v14 = v5;
  __int16 v15 = 2112;
  unsigned int v16 = v6;
  __int16 v17 = 2112;
  int v18 = v7;
  __int16 v19 = 2112;
  v20 = v8;
  __int16 v21 = 2112;
  v22 = v9;
  __int16 v23 = 2112;
  v24 = v10;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Recents: %@, %@, %@, Favorites: %@, Contacts: %@, Dialer: %@, Voicemail: %@", (uint8_t *)&v11, 0x48u);
}

@end