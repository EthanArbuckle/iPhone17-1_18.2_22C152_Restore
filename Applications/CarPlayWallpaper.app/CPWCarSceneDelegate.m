@interface CPWCarSceneDelegate
- (CPWRootViewController)rootViewController;
- (UIWindow)window;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation CPWCarSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  v7 = sub_100005818(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scene is connecting: %{public}@", buf, 0xCu);
  }

  id v8 = v6;
  v33 = self;
  v9 = +[NSArray arrayWithObjects:&v33 count:1];
  v10 = +[NSString stringWithFormat:@"%p", self];
  [v8 _registerSettingsDiffActionArray:v9 forKey:v10];

  id v11 = [objc_alloc((Class)UIWindow) initWithWindowScene:v8];
  [(CPWCarSceneDelegate *)self setWindow:v11];

  v12 = [v8 _FBSScene];
  v13 = [v12 settings];
  v14 = [v13 displayIdentity];
  id v15 = [v14 isCarInstrumentsDisplay];

  objc_opt_class();
  v16 = [v8 _FBSScene];
  id v17 = [v16 settings];
  if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  v19 = +[UIApplication sharedApplication];
  v20 = [v19 delegate];

  objc_opt_class();
  id v21 = [v18 wallpaper];
  if (v21 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  v23 = (Class *)CRSUISystemWallpaperProvider_ptr;
  if (v22) {
    v23 = (Class *)CRSUIClusterThemeManager_ptr;
  }
  id v24 = objc_alloc_init(*v23);
  v25 = [CPWRootViewController alloc];
  v26 = [v18 wallpaper];
  v27 = [v20 assetLibrary];
  v28 = [v20 wallpaperCache];
  v29 = [(CPWRootViewController *)v25 initWithWallpaper:v26 assetLibrary:v27 wallpaperProvider:v24 wallpaperCache:v28 isInstrumentCluster:v15];
  [(CPWCarSceneDelegate *)self setRootViewController:v29];

  v30 = [(CPWCarSceneDelegate *)self rootViewController];
  v31 = [(CPWCarSceneDelegate *)self window];
  [v31 setRootViewController:v30];

  v32 = [(CPWCarSceneDelegate *)self window];
  [v32 makeKeyAndVisible];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = sub_100005818(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scene did disconnect: %{public}@", buf, 0xCu);
  }

  v9 = self;
  id v6 = v4;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  [v6 _unregisterSettingsDiffActionArrayForKey:v7];

  id v8 = [(CPWCarSceneDelegate *)self rootViewController];
  [v8 invalidate];
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v9 = a3;
  v10 = sub_100005818(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Handling update for scene: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  objc_opt_class();
  id v11 = [v9 _FBSScene];
  id v12 = [v11 settings];
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  v14 = [v13 wallpaper];
  id v15 = [(CPWCarSceneDelegate *)self rootViewController];
  [v15 setWallpaper:v14];
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
}

- (CPWRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->window, 0);
}

@end