@interface SceneDelegate
- (UIWindow)window;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000A54C((uint64_t)v17, (uint64_t)"-[SceneDelegate scene:willConnectToSession:options:]", (uint64_t)v13);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "%s connectionOptions:%@", v17, 0x16u);
  }
  objc_storeStrong(&v12, 0);
  id v5 = objc_alloc((Class)UIWindow);
  v6 = (UIWindow *)[v5 initWithWindowScene:location[0]];
  window = v16->_window;
  v16->_window = v6;

  id v8 = location[0];
  v9 = +[NSArray arrayWithObject:v16];
  [v8 _registerSceneActionsHandlerArray:forKey:];

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = 0;
  objc_storeStrong(&v29, a6);
  id v28 = [location[0] mutableCopy];
  memset(__b, 0, sizeof(__b));
  id v19 = location[0];
  id v20 = [v19 countByEnumeratingWithState:__b objects:v35 count:16];
  if (v20)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    id v15 = v20;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(v19);
      }
      id v27 = *(id *)(__b[1] + 8 * v14);
      os_log_t oslog = (os_log_t)(id)SUSUILog();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        os_log_type_t v11 = type;
        sub_10000A54C((uint64_t)v34, (uint64_t)"-[SceneDelegate _respondToActions:forFBSScene:inUIScene:fromTransitionContext:]", (uint64_t)v27);
        _os_log_impl((void *)&_mh_execute_header, log, v11, " %s got new action:%@", v34, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v8 = objc_alloc((Class)SUSUIAuthenticationAlertAction);
      id v9 = [v27 info];
      id v23 = [v8 initWithInfo:forBaseAction:];

      if (v23)
      {
        [v28 removeObject:v27];
        v21 = objc_alloc_init(SUSUIRemoteAuthenticationContainerViewController);
        [(SUSUIRemoteAuthenticationContainerViewController *)v21 configureWithAction:v23];
        [(UIWindow *)v33->_window setRootViewController:v21];
        [(UIWindow *)v33->_window makeKeyAndVisible];
        objc_storeStrong((id *)&v21, 0);
        int v22 = 0;
      }
      else
      {
        int v22 = 3;
      }
      objc_storeStrong(&v23, 0);
      ++v14;
      if (v12 + 1 >= (unint64_t)v15)
      {
        uint64_t v14 = 0;
        id v15 = [v19 countByEnumeratingWithState:__b objects:v35 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  id v7 = v28;
  int v22 = 1;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);

  return v7;
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
}

@end