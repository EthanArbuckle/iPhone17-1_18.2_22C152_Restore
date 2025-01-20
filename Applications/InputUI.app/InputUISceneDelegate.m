@interface InputUISceneDelegate
- (IUIInputSourceViewController)keyboardContainerVC;
- (UIWindow)window;
- (id)sessionCoordinator;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setKeyboardContainerVC:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation InputUISceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = a3;
  v4 = sub_1000029D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InputUI sceneDidBecomeActive:%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3 = a3;
  v4 = sub_1000029D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InputUI sceneWillEnterForeground:%@", (uint8_t *)&v6, 0xCu);
  }

  int v5 = +[UIApplication sharedApplication];
  [v5 resumeTextInputService];
}

- (id)sessionCoordinator
{
  v2 = +[InputUIApp sharedApplication];
  id v3 = [v2 sessionCoordinator];

  return v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = sub_1000029D8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "InputUI scene:%@ willConnectToSession:%@", (uint8_t *)&v19, 0x16u);
  }

  objc_storeWeak((id *)&self->_windowScene, v7);
  v10 = [InputUIWindow alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v12 = [(InputUIWindow *)v10 initWithWindowScene:WeakRetained];

  p_keyboardWindow = &self->_keyboardWindow;
  objc_storeStrong((id *)&self->_keyboardWindow, v12);
  if ((+[UIKeyboard inputUIOOP] & 1) != 0
    || !+[UIKeyboard supportsAutoFillPanel])
  {
    id v14 = [(InputUISceneDelegate *)self sessionCoordinator];
    v15 = objc_alloc_init(IUIInputSourceViewController);
    [(IUIInputSourceViewController *)v15 setSessionCoordinator:v14];
    [v14 setInputSourceViewController:v15];
    [(InputUISceneDelegate *)self setKeyboardContainerVC:v15];
    [(UIWindow *)*p_keyboardWindow setRootViewController:v15];
  }
  else
  {
    id v14 = objc_alloc_init((Class)UIViewController);
    [(UIWindow *)*p_keyboardWindow setRootViewController:v14];
  }

  [(UIWindow *)*p_keyboardWindow makeKeyAndVisible];
  v16 = *p_keyboardWindow;
  double y = CGPointZero.y;
  v18 = +[UIScreen mainScreen];
  [v18 bounds];
  -[UIWindow setFrame:](v16, "setFrame:", CGPointZero.x, y);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3 = a3;
  v4 = sub_1000029D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InputUI sceneDidDisconnect:%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = a3;
  v4 = sub_1000029D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InputUI sceneWillResignActive:%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = a3;
  v4 = sub_1000029D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InputUI sceneDidEnterBackground:%@", (uint8_t *)&v6, 0xCu);
  }

  int v5 = +[UIApplication sharedApplication];
  [v5 pauseTextInputService];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (IUIInputSourceViewController)keyboardContainerVC
{
  return self->_keyboardContainerVC;
}

- (void)setKeyboardContainerVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardContainerVC, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_keyboardWindow, 0);

  objc_destroyWeak((id *)&self->_windowScene);
}

@end