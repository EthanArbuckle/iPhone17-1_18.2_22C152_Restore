@interface UISceneDelegate
- (BOOL)_handleFamilyURL:(id)a3;
- (BOOL)_handleFamilyURLComponents:(id)a3 eventType:(id)a4;
- (UIWindow)window;
- (id)_currentSceneSession;
- (void)_destroyCurrentSceneSession;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation UISceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = _FALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connecting to session.", (uint8_t *)&v21, 2u);
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v11 = _FALogSystem();
  v12 = v11;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connected to session.", (uint8_t *)&v21, 2u);
    }

    v12 = v7;
    v13 = (UIWindow *)[objc_alloc((Class)UIWindow) initWithWindowScene:v12];
    window = self->_window;
    self->_window = v13;

    id v15 = objc_alloc_init((Class)UIViewController);
    [(UIWindow *)self->_window setRootViewController:v15];

    v16 = [v8 URLContexts];
    v17 = [v16 anyObject];
    v18 = [v17 URL];

    v19 = _FALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v18 absoluteString];
      int v21 = 138412290;
      v22 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received URL to open in willConnectToSession %@", (uint8_t *)&v21, 0xCu);
    }
    [(UISceneDelegate *)self _handleFamilyURL:v18];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_100004CC0(v12);
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  v5 = [a4 anyObject];
  v6 = [v5 URL];

  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 absoluteString];
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received URL to open in openURLContexts %@", (uint8_t *)&v9, 0xCu);
  }
  [(UISceneDelegate *)self _handleFamilyURL:v6];
}

- (void)sceneDidDisconnect:(id)a3
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneDidDisconnect", v4, 2u);
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneDidBecomeActive", v4, 2u);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneWillResignActive", v4, 2u);
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneWillEnterForeground", v4, 2u);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneDidEnterBackground", v4, 2u);
  }
}

- (BOOL)_handleFamilyURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 scheme];
  unsigned int v6 = [v5 isEqualToString:@"family"];

  if (v6)
  {
    id v7 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:1];
    id v8 = [v7 fa_valueForQueryItem:@"aaaction"];
    if ([v8 isEqualToString:@"showFamilyInvite"])
    {
      int v9 = &FACircleEventTypeAcceptInvitation;
    }
    else if ([v8 isEqualToString:@"manageFamily"])
    {
      int v9 = &FACircleEventTypeManageCircle;
    }
    else
    {
      if (![v8 isEqualToString:@"approveWithRestrictionsPIN"])
      {
        if ([v8 isEqualToString:@"cacheMugshotMarquee"])
        {
          id v12 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
          [v12 setCachePolicy:0];
          [v12 startRequestWithCompletionHandler:&stru_100008220];

          BOOL v10 = 1;
        }
        else
        {
          v13 = _FALogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_100004D04();
          }

          BOOL v10 = 0;
        }
        goto LABEL_12;
      }
      int v9 = &FACircleEventTypeApproveWithRestrictionsPIN;
    }
    BOOL v10 = [(UISceneDelegate *)self _handleFamilyURLComponents:v7 eventType:*v9];
LABEL_12:

    goto LABEL_13;
  }
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100004D7C(v4, v7);
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)_handleFamilyURLComponents:(id)a3 eventType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  currentFamilyCircleStateController = self->_currentFamilyCircleStateController;
  int v9 = _FALogSystem();
  BOOL v10 = v9;
  if (currentFamilyCircleStateController)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v24 = v7;
      __int16 v25 = 2113;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ignoring event of type (%{public}@) with components: %{private}@ because an URL is already being handled", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100004E2C();
    }

    BOOL v10 = [objc_alloc((Class)FACircleContext) initWithEventType:v7];
    CFStringRef v21 = @"requestParameters";
    v11 = [v6 fa_queryItemsDictionary];
    v22 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v10 setAdditionalParameters:v12];

    id v13 = objc_alloc((Class)FACircleStateController);
    v14 = [(UISceneDelegate *)self window];
    id v15 = [v14 rootViewController];
    v16 = (FACircleStateController *)[v13 initWithPresenter:v15];
    v17 = self->_currentFamilyCircleStateController;
    self->_currentFamilyCircleStateController = v16;

    [(UIWindow *)self->_window makeKeyAndVisible];
    v18 = self->_currentFamilyCircleStateController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000043A8;
    v20[3] = &unk_100008270;
    v20[4] = self;
    [(FACircleStateController *)v18 performWithContext:v10 completion:v20];
  }

  return currentFamilyCircleStateController == 0;
}

- (void)_destroyCurrentSceneSession
{
  id v3 = [(UISceneDelegate *)self _currentSceneSession];
  if (v3)
  {
    v2 = +[UIApplication sharedApplication];
    [v2 requestSceneSessionDestruction:v3 options:0 errorHandler:&stru_1000082B0];
  }
}

- (id)_currentSceneSession
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 openSessions];

  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        BOOL v10 = [v9 scene];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v12 = [v9 scene];
          id v13 = v12;
          if (self->_window)
          {
            v14 = [v12 windows];
            unsigned __int8 v15 = [v14 containsObject:self->_window];

            if (v15)
            {
              id v16 = v9;

              goto LABEL_14;
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_14:

  return v16;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->rootViewController, 0);

  objc_storeStrong((id *)&self->_currentFamilyCircleStateController, 0);
}

@end