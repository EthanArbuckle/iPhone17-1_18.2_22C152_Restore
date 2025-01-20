@interface ICQUISceneDelegate
- (UIWindow)window;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ICQUISceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connecting to session.", v16, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = v6;
    v9 = (UIWindow *)[objc_alloc((Class)UIWindow) initWithWindowScene:v8];
    window = self->_window;
    self->_window = v9;

    v11 = objc_alloc_init(ICQUIRootViewController);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v11;

    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100007360(v8, v13);
    }

    v14 = [v8 _sceneIdentifier];
    [(ICQUIRootViewController *)self->_rootViewController setSceneIdentifier:v14];

    [(UIWindow *)self->_window setRootViewController:self->_rootViewController];
    [(UIWindow *)self->_window setContentsPosition:0];
    v17 = self;
    v15 = +[NSArray arrayWithObjects:&v17 count:1];
    [v8 _registerSceneActionsHandlerArray:v15 forKey:@"launch_params"];
  }
  else
  {
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000073F8();
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100007438();
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000746C();
  }
}

- (void)sceneWillResignActive:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000074A0();
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000074D4();
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sceneDidEnterBackground. Dismissing upgrade flow.", v5, 2u);
  }

  [(ICQUIRootViewController *)self->_rootViewController dismissUpgradeFlow];
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v6 = a3;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[ICQUISceneDelegate _respondToActions:forFBSScene:inUIScene:fromTransitionContext:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s called.", buf, 0xCu);
  }

  id v8 = [v6 mutableCopy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v14 = [v13 info];
        v15 = [v14 objectForSetting:0];
        v16 = +[ICQRemoteContext contextFromDictionary:v15];
        v17 = _ICQGetLogSystem();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fetched a remote context: %@", buf, 0xCu);
          }

          [(ICQUIRootViewController *)self->_rootViewController setRemoteContext:v16];
          [v8 removeObject:v13];
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_100007508(&v24, v25, v18);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  [(UIWindow *)self->_window makeKeyAndVisible];
  v19 = v8;
  id v20 = [v8 copy];

  return v20;
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

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end