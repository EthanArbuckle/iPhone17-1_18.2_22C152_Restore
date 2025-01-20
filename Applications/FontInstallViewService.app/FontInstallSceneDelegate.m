@interface FontInstallSceneDelegate
- (FontInstallSceneDelegate)init;
- (UIWindow)window;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)_cleanupOnRootControllerDismiss;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation FontInstallSceneDelegate

- (FontInstallSceneDelegate)init
{
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)FontInstallSceneDelegate;
  v6 = [(FontInstallSceneDelegate *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = +[NSSet setWithArray:&off_100015078];
    supportedControllerClassNames = v9->_supportedControllerClassNames;
    v9->_supportedControllerClassNames = v2;
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

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
  id v12 = location[0];
  id v5 = objc_alloc((Class)UIWindow);
  v6 = (UIWindow *)[v5 initWithWindowScene:v12];
  window = v16->_window;
  v16->_window = v6;

  id v10 = location[0];
  v17 = v16;
  v11 = +[NSArray arrayWithObjects:&v17 count:1];
  [v10 _registerSceneActionsHandlerArray:forKey:];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v39 = 0;
  objc_storeStrong(&v39, a5);
  id v38 = 0;
  objc_storeStrong(&v38, a6);
  id v37 = [location[0] mutableCopy];
  memset(__b, 0, sizeof(__b));
  id v17 = location[0];
  id v18 = [v17 countByEnumeratingWithState:__b objects:v43 count:16];
  if (v18)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    id v16 = v18;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(v17);
      }
      id v36 = *(id *)(__b[1] + 8 * v15);
      id v34 = [v36 info];
      id v33 = [v34 objectForSetting:0];
      id v32 = [v34 objectForSetting:1];
      id v31 = [v34 objectForSetting:2];
      if (v33 && v31 && [(NSSet *)v42->_supportedControllerClassNames containsObject:v32])
      {
        if ([v32 isEqualToString:@"FontInstallMissingController"])
        {
          id v12 = objc_alloc_init(FontInstallMissingController);
          rootViewController = v42->_rootViewController;
          v42->_rootViewController = (FontInstallUISceneProtocol *)v12;
        }
        else
        {
          if ([v32 isEqualToString:@"DeleteAppFontsMainController"])
          {
            v11 = objc_alloc_init(DeleteAppFontsMainController);
            objc_super v7 = v42->_rootViewController;
            v42->_rootViewController = (FontInstallUISceneProtocol *)v11;
          }
          else
          {
            id v10 = objc_alloc_init(FontInstallMainController);
            objc_super v7 = v42->_rootViewController;
            v42->_rootViewController = (FontInstallUISceneProtocol *)v10;
          }
        }
        [(UIWindow *)v42->_window setRootViewController:v42->_rootViewController];
        [(UIWindow *)v42->_window setContentsPosition:0];
        objc_initWeak(&from, v42);
        v23 = _NSConcreteStackBlock;
        int v24 = -1073741824;
        int v25 = 0;
        v26 = __90__FontInstallSceneDelegate__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke;
        v27 = &unk_100014228;
        objc_copyWeak(&v28, &from);
        id v29 = objc_retainBlock(&v23);
        [(FontInstallUISceneProtocol *)v42->_rootViewController setupWithUserInfo:v33 xpcEndpoint:v31 dismissHandler:v29];
        [v37 removeObject:v36];
        int v22 = 2;
        objc_storeStrong(&v29, 0);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&from);
      }
      else
      {
        int v22 = 0;
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      if (v22) {
        break;
      }
      ++v15;
      if (v13 + 1 >= (unint64_t)v16)
      {
        uint64_t v15 = 0;
        id v16 = [v17 countByEnumeratingWithState:__b objects:v43 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  [(UIWindow *)v42->_window makeKeyAndVisible];
  id v9 = [v37 copy];
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);

  return v9;
}

void __90__FontInstallSceneDelegate__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] _cleanupOnRootControllerDismiss];
  }
  objc_storeStrong(location, 0);
}

- (void)sceneDidEnterBackground:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_rootViewController)
  {
    [(FontInstallUISceneProtocol *)v4->_rootViewController dismissViewControllerAnimated:1 completion:0];
    [(FontInstallSceneDelegate *)v4 _cleanupOnRootControllerDismiss];
  }
  objc_storeStrong(location, 0);
}

- (void)_cleanupOnRootControllerDismiss
{
  -[UIWindow setRootViewController:](self->_window, "setRootViewController:");
  v4 = +[UIApplication sharedApplication];
  v3 = [(UIWindow *)self->_window windowScene];
  id v2 = [(UIWindowScene *)v3 session];
  -[UIApplication requestSceneSessionDestruction:options:errorHandler:](v4, "requestSceneSessionDestruction:options:errorHandler:");
}

void __59__FontInstallSceneDelegate__cleanupOnRootControllerDismiss__block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  FSLog_Error(@"FontInstallViewService", @"Scene destruction request failed - %@", v2, v3, v4, v5, v6, v7, (uint64_t)location[0]);
  objc_storeStrong(location, 0);
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