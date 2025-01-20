@interface SESGDPRSceneDelegate
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SESGDPRSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "SESAngel - scene:willConnectToSession:options:", buf, 2u);
  }

  *(void *)buf = 0;
  v23 = buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000164C;
  v26 = sub_10000165C;
  id v12 = v8;
  id v27 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*((id *)v23 + 5) setSwipeDismissalStyle:1];
    [*((id *)v23 + 5) setDismissalAnimationStyle:2];
    [*((id *)v23 + 5) setAllowsMenuButtonDismissal:1];
    v13 = objc_opt_new();
    objc_initWeak(&location, self);
    objc_initWeak(&from, v9);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100001664;
    v17[3] = &unk_100004208;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    v17[4] = buf;
    v14 = objc_retainBlock(v17);
    [v13 setDismissHandler:v14];
    id v15 = objc_alloc((Class)UIWindow);
    id v16 = [v15 initWithWindowScene:*((void *)v23 + 5)];
    [v16 setRootViewController:v13];
    [v16 makeKeyAndVisible];
    [(SESGDPRSceneDelegate *)self setWindow:v16];
    objc_storeStrong((id *)&self->_viewController, v13);
    [v13 presentGDPR];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(buf, 8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3 = a3;
  v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Angel - sceneDidDisconnect", v6, 2u);
  }

  id v5 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 invalidate];
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Angel - sceneDidBecomeActive:", v4, 2u);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = a3;
  v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Angel - sceneWillResignActive:", v6, 2u);
  }

  id v5 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 invalidate];
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Angel - sceneDidEnterBackground:", v7, 2u);
    }

    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 invalidate];
      [(SESGDPRViewController *)self->_viewController dismissViewControllerAnimated:1 completion:0];
    }
  }
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

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end