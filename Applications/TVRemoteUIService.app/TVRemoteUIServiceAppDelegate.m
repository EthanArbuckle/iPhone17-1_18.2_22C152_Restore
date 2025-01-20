@interface TVRemoteUIServiceAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (TVDefaultSceneDelegate)defaultSceneDelegate;
- (TVLockScreenSceneDelegate)lockScreenSceneDelegate;
- (UIScene)defaultScene;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)defaultSceneDelegate;
- (void)lockScreenSceneDelegate;
- (void)lockScreenSceneDelegateSceneDidDisconnect:(id)a3;
- (void)setDefaultScene:(id)a3;
- (void)setDefaultSceneDelegate:(id)a3;
- (void)setLockScreenSceneDelegate:(id)a3;
@end

@implementation TVRemoteUIServiceAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = [v5 role];
  id v8 = [v6 initWithName:0 sessionRole:v7];

  v9 = [v5 role];
  unsigned __int8 v10 = [v9 isEqualToString:UIWindowSceneSessionRoleApplication];

  if ((v10 & 1) != 0
    || ([v5 role],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 isEqualToString:_UIWindowSceneSessionTypeCoverSheet],
        v11,
        v12))
  {
    [v8 setDelegateClass:objc_opt_class()];
  }

  return v8;
}

- (TVDefaultSceneDelegate)defaultSceneDelegate
{
  p_defaultSceneDelegate = &self->_defaultSceneDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSceneDelegate);

  if (!WeakRetained)
  {
    id v5 = +[UIApplication sharedApplication];
    id v6 = [v5 connectedScenes];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v12 delegate];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_storeWeak((id *)p_defaultSceneDelegate, v13);
            objc_storeWeak((id *)&self->_defaultScene, v12);
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v14 = objc_loadWeakRetained((id *)p_defaultSceneDelegate);
    if (!v14)
    {
      v15 = _TVRUIServiceAppLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[TVRemoteUIServiceAppDelegate defaultSceneDelegate](v15);
      }
    }
  }
  id v16 = objc_loadWeakRetained((id *)p_defaultSceneDelegate);

  return (TVDefaultSceneDelegate *)v16;
}

- (TVLockScreenSceneDelegate)lockScreenSceneDelegate
{
  p_lockScreenSceneDelegate = &self->_lockScreenSceneDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenSceneDelegate);

  if (!WeakRetained)
  {
    id v5 = +[UIApplication sharedApplication];
    id v6 = [v5 connectedScenes];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v12 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v11) delegate:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeWeak((id *)&self->_defaultSceneDelegate, v12);
          }

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    id v13 = objc_loadWeakRetained((id *)&self->_defaultSceneDelegate);
    if (!v13)
    {
      id v14 = _TVRUIServiceAppLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[TVRemoteUIServiceAppDelegate lockScreenSceneDelegate](v14);
      }
    }
  }
  id v15 = objc_loadWeakRetained((id *)p_lockScreenSceneDelegate);

  return (TVLockScreenSceneDelegate *)v15;
}

- (void)lockScreenSceneDelegateSceneDidDisconnect:(id)a3
{
  id v3 = [(TVRemoteUIServiceAppDelegate *)self defaultSceneDelegate];
  [v3 resetRootViewController];
}

- (void)setDefaultSceneDelegate:(id)a3
{
}

- (void)setLockScreenSceneDelegate:(id)a3
{
}

- (UIScene)defaultScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultScene);

  return (UIScene *)WeakRetained;
}

- (void)setDefaultScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_defaultScene);
  objc_destroyWeak((id *)&self->_lockScreenSceneDelegate);

  objc_destroyWeak((id *)&self->_defaultSceneDelegate);
}

- (void)defaultSceneDelegate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find defaultSceneDelegate in list of connected scenes", v1, 2u);
}

- (void)lockScreenSceneDelegate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find lockScreenDelegate in list of connected scenes", v1, 2u);
}

@end