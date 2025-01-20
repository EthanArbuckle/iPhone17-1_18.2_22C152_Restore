@interface PhoneSceneDelegate
- (BOOL)handleShortcutItem:(id)a3;
- (BOOL)isUIInitialized;
- (UIApplicationShortcutItem)shortcutItem;
- (UIWindow)window;
- (id)_createWindowFromScene:(id)a3;
- (void)_initializeUI;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didUpdateUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setIsUIInitialized:(BOOL)a3;
- (void)setShortcutItem:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation PhoneSceneDelegate

- (UIWindow)window
{
  return self->_window;
}

- (void)sceneDidBecomeActive:(id)a3
{
  v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidBecomeActive:", (uint8_t *)&v12, 2u);
  }

  v5 = PHPreferencesGetValueInDomain(@"PHLastTabTypeKey", TUBundleIdentifierMobilePhoneApplication);
  int v6 = (int)v5;

  if (v6 != 2) {
    [UIApp warmInCallServiceIfNecessary];
  }
  v7 = [(PhoneSceneDelegate *)self shortcutItem];

  if (v7)
  {
    v8 = [(PhoneSceneDelegate *)self shortcutItem];
    unsigned int v9 = [(PhoneSceneDelegate *)self handleShortcutItem:v8];

    v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"NO";
      if (v9) {
        CFStringRef v11 = @"YES";
      }
      int v12 = 138412290;
      CFStringRef v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: did handle shortcut with success: %@", (uint8_t *)&v12, 0xCu);
    }

    [(PhoneSceneDelegate *)self setShortcutItem:0];
  }
}

- (UIApplicationShortcutItem)shortcutItem
{
  return self->_shortcutItem;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned int v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: scene:willConnectToSession:options: %@", buf, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = v7;
    if (![(PhoneSceneDelegate *)self isUIInitialized])
    {
      if (!self->_window)
      {
        CFStringRef v11 = [(PhoneSceneDelegate *)self _createWindowFromScene:v10];
        window = self->_window;
        self->_window = v11;
      }
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __57__PhoneSceneDelegate_scene_willConnectToSession_options___block_invoke;
      v24[3] = &unk_10027C670;
      v24[4] = self;
      +[UIView performWithoutAnimation:v24];
    }
  }
  else
  {
    v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PhoneSceneDelegate scene:willConnectToSession:options:]((uint64_t)v7, v10);
    }
  }

  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    CFStringRef v13 = [(PhoneSceneDelegate *)self window];
    [v13 orderFront:0];
  }
  v14 = [v8 shortcutItem];
  [(PhoneSceneDelegate *)self setShortcutItem:v14];

  v15 = [UIApp rootViewController];
  [v15 displayUIAnimated:0];

  v16 = [v8 URLContexts];
  id v17 = [v16 count];

  if (v17)
  {
    id v18 = [v8 URLContexts];
    [(PhoneSceneDelegate *)self scene:v7 openURLContexts:v18];
  }
  else
  {
    id v18 = objc_alloc_init((Class)TUFeatureFlags);
    if ([v18 callHistorySearchEnabled])
    {
      v19 = [v8 userActivities];
      id v20 = [v19 count];

      if (v20)
      {
        v21 = [v8 userActivities];
        v22 = [v21 anyObject];

        v23 = PHDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: connectionOptions has userActivity: %@", buf, 0xCu);
        }

        [(PhoneSceneDelegate *)self scene:v7 continueUserActivity:v22];
      }
    }
  }
}

void __57__PhoneSceneDelegate_scene_willConnectToSession_options___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(PhoneRootViewController);
  [UIApp setRootViewController:v2];

  id v5 = [UIApp rootViewController];
  v3 = [v5 view];
  v4 = [v3 window];

  if (!v4) {
    [*(id *)(*(void *)(a1 + 32) + 16) setRootViewController:v5];
  }
  [*(id *)(a1 + 32) _initializeUI];
  [*(id *)(a1 + 32) setIsUIInitialized:1];
  [*(id *)(*(void *)(a1 + 32) + 16) makeKeyAndVisible];
}

- (void)setShortcutItem:(id)a3
{
}

- (void)setIsUIInitialized:(BOOL)a3
{
  self->_isUIInitialized = a3;
}

- (BOOL)isUIInitialized
{
  return self->_isUIInitialized;
}

- (id)_createWindowFromScene:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)UIWindow) initWithWindowScene:v3];

  id v5 = [UIApp applicationTintColor];
  [v4 setTintColor:v5];

  int v6 = +[UIColor clearColor];
  [v4 setBackgroundColor:v6];

  return v4;
}

- (void)_initializeUI
{
  if (![UIApp isSuspended]
    || ([UIApp alwaysShowLocalVideo] & 1) == 0)
  {
    v2 = (void *)UIApp;
    [v2 showInitialView];
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneWillEnterForeground:", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PhoneApplicationActivatedNotification" object:0];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidEnterBackground:", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PhoneApplicationDeactivatedNotification" object:0];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, BOOL))a5;
  unsigned int v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: windowScene:performActionForShortcutItem: %@", (uint8_t *)&v12, 0xCu);
  }

  [(PhoneSceneDelegate *)self setShortcutItem:v7];
  v10 = [(PhoneSceneDelegate *)self shortcutItem];
  BOOL v11 = [(PhoneSceneDelegate *)self handleShortcutItem:v10];

  [(PhoneSceneDelegate *)self setShortcutItem:0];
  v8[2](v8, v11);
}

- (BOOL)handleShortcutItem:(id)a3
{
  id v3 = a3;
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    id v29 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: handling shortcut item %@", (uint8_t *)&v28, 0xCu);
  }

  id v5 = [UIApp rootViewController];
  int v6 = [v5 baseViewController];

  id v7 = [v6 selectedViewController];
  id v8 = [v7 presentedViewController];
  if (v8) {
    [v7 dismissViewControllerAnimated:0 completion:0];
  }
  unsigned int v9 = [v3 type];
  if ([v9 isEqualToString:@"com.apple.mobilephone.contacts.create"])
  {
    +[CATransaction begin];
    +[CATransaction disableActions];
    [v6 switchToTab:3];
    id v10 = [v6 contactsViewController];
    [v10 addContact:0 animated:0];
LABEL_25:
    +[CATransaction commit];

    goto LABEL_26;
  }
  if ([v9 isEqualToString:@"com.apple.mobilephone.search"])
  {
    +[CATransaction begin];
    +[CATransaction disableActions];
    id v10 = objc_alloc_init((Class)TUFeatureFlags);
    if ([v10 callHistorySearchEnabled])
    {
      [v6 switchToTab:2];
      BOOL v11 = [v6 recentsNavigationController];
      id v12 = [v11 popToRootViewControllerAnimated:0];

      id v13 = [v6 recentsTableViewController];
      [v13 startSearchingForText:0];
    }
    else
    {
      [v6 switchToTab:3];
      id v13 = [v6 contactsViewController];
      v19 = [v13 viewControllers];
      id v20 = [v13 contactListViewController];
      unsigned int v21 = [v19 containsObject:v20];

      v22 = [v13 contactListViewController];
      if (v21) {
        id v23 = [v13 popToViewController:v22 animated:0];
      }
      else {
        [v13 pushViewController:v22 animated:0];
      }

      v24 = [v13 contactListViewController];
      [v24 startSearching];
    }
    goto LABEL_25;
  }
  if ([v9 isEqualToString:@"com.apple.mobilephone.recents"])
  {
    +[CATransaction begin];
    +[CATransaction disableActions];
    [v6 switchToTab:2];
    v14 = +[MPPreferences sharedPreferences];
    unsigned __int8 v15 = [v14 useSwiftUIRecents];

    if ((v15 & 1) == 0)
    {
      v16 = [v6 recentsTableViewController];
      id v17 = [v16 tableView];

      if ((uint64_t)[v17 numberOfRowsInSection:0] >= 1)
      {
        id v18 = +[NSIndexPath indexPathForRow:0 inSection:0];
        [v17 scrollToRowAtIndexPath:v18 atScrollPosition:1 animated:0];
      }
    }
    goto LABEL_21;
  }
  if (![v9 isEqualToString:@"com.apple.mobilephone.voicemail"])
  {
LABEL_31:
    BOOL v25 = 0;
    goto LABEL_27;
  }
  if (![UIApp hasEnhancedVoicemail])
  {
    v27 = PHDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Voicemail shortcut was selected, but enhanced voicemail is unavailable", (uint8_t *)&v28, 2u);
    }

    goto LABEL_31;
  }
  +[CATransaction begin];
  +[CATransaction disableActions];
  [v6 switchToTab:5];
LABEL_21:
  +[CATransaction commit];
LABEL_26:
  BOOL v25 = 1;
LABEL_27:

  return v25;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidDisconnect:", v10, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [UIApp rootViewController];
    id v8 = [v6 keyWindow];
    unsigned int v9 = [v8 rootViewController];

    if (v7 == v9) {
      [UIApp setRootViewController:0];
    }
    [(UIWindow *)self->_window setRootViewController:0];
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneWillResignActive:", v4, 2u);
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v4 = a4;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate openURLContexts: %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = (void *)UIApp;
        id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) URL:(void)v13];
        [v11 applicationOpenURL:v12];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Phone scene %@ will continue user activity with type %@", (uint8_t *)&v10, 0x16u);
  }

  id v8 = objc_alloc_init((Class)TUFeatureFlags);
  if ([v8 conversationHandoffEnabled]
    && [v6 isEqualToString:TUUserActivityTypeConversationHandoff])
  {
    uint64_t v9 = +[TUCallCenter sharedInstance];
    [v9 continueHandoffEligibleConversation];
  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Phone scene %@ is continuing user activity: %@", (uint8_t *)&v18, 0x16u);
  }

  id v8 = [v6 activityType];
  uint64_t v9 = TUCallPhoneAppHistoryActivityType();
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    id v11 = +[PHApplicationServices sharedInstance];
    __int16 v12 = [v11 callProviderManager];

    id v13 = +[TUDialRequest dialRequestForUserActivity:v6 callProviderManager:v12];
    if (v13)
    {
      long long v14 = +[TUCallCenter sharedInstance];
      id v15 = [v14 dialWithRequest:v13];
    }
    goto LABEL_10;
  }
  long long v16 = [v6 activityType];
  unsigned int v17 = [v16 isEqualToString:TUUserActivityTypeConversationHandoff];

  if (!v17)
  {
    __int16 v12 = [UIApp rootViewController];
    id v13 = [v12 baseViewController];
    [v13 handleUserActivityContinuation:v6];
    goto LABEL_10;
  }
  __int16 v12 = PHDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v6 tu_dynamicIdentifier];
    int v18 = 138412290;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FaceTime call handoff dynamic identifier was: %@", (uint8_t *)&v18, 0xCu);
LABEL_10:
  }
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Phone scene %@ did fail to continue user activity with type %@ due to error %@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)scene:(id)a3 didUpdateUserActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Phone scene %@ did update user activity %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutItem, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (void)scene:(uint64_t)a1 willConnectToSession:(NSObject *)a2 options:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type of scene: %@", (uint8_t *)&v2, 0xCu);
}

@end