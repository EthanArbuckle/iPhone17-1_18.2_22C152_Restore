@interface WFAngelSceneManager
+ (id)sharedManager;
- (SBSUIRemoteAlertScene)activeScene;
- (UIWindow)activeWindow;
- (WFAngelSceneManager)init;
- (id)cancellationHandler;
- (id)windowActivationCompletionHandler;
- (int)displayStatusNotifyToken;
- (void)dealloc;
- (void)getWindowWithCancellationHandler:(id)a3 completionHandler:(id)a4;
- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4;
- (void)requestSceneDeactivation;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setActiveScene:(id)a3;
- (void)setActiveWindow:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setDisplayStatusNotifyToken:(int)a3;
- (void)setWindowActivationCompletionHandler:(id)a3;
@end

@implementation WFAngelSceneManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_activeWindow, 0);
  objc_storeStrong((id *)&self->_activeScene, 0);

  objc_storeStrong(&self->_windowActivationCompletionHandler, 0);
}

- (void)setCancellationHandler:(id)a3
{
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setDisplayStatusNotifyToken:(int)a3
{
  self->_displayStatusNotifyToken = a3;
}

- (int)displayStatusNotifyToken
{
  return self->_displayStatusNotifyToken;
}

- (UIWindow)activeWindow
{
  return self->_activeWindow;
}

- (void)setActiveScene:(id)a3
{
}

- (SBSUIRemoteAlertScene)activeScene
{
  return self->_activeScene;
}

- (void)setWindowActivationCompletionHandler:(id)a3
{
}

- (id)windowActivationCompletionHandler
{
  return self->_windowActivationCompletionHandler;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = sub_100002254();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[WFAngelSceneManager sceneDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Resetting...", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(WFAngelSceneManager *)self activeScene];

  if (v6 == v4)
  {
    [(WFAngelSceneManager *)self setActiveScene:0];
    [(WFAngelSceneManager *)self setActiveWindow:0];
  }
  if (notify_is_valid_token(self->_displayStatusNotifyToken)) {
    notify_cancel(self->_displayStatusNotifyToken);
  }
  self->_displayStatusNotifyToken = -1;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = sub_100002254();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        v19 = "-[WFAngelSceneManager scene:willConnectToSession:options:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Scene will connect, preparing window...", (uint8_t *)&v18, 0xCu);
      }

      [v11 setDelegate:self];
      [v11 setAllowsAlertStacking:1];
      [v11 setSwipeDismissalStyle:0];
      [v11 setDismissalAnimationStyle:0];
      [v11 setContentOverlaysStatusBar:1 animationSettings:0];
      [v11 setDesiredHardwareButtonEvents:16];
      id v13 = objc_alloc_init((Class)UIViewController);
      id v14 = [objc_alloc((Class)UIWindow) initWithWindowScene:v11];
      [v14 setRootViewController:v13];
      v15 = [v14 _rootSheetPresentationController];
      [v15 _setShouldScaleDownBehindDescendantSheets:0];

      [v14 makeKeyAndVisible];
      [(WFAngelSceneManager *)self setActiveWindow:v14];
      [(WFAngelSceneManager *)self setActiveScene:v11];
      v16 = [(WFAngelSceneManager *)self windowActivationCompletionHandler];

      if (v16)
      {
        v17 = [(WFAngelSceneManager *)self windowActivationCompletionHandler];
        ((void (**)(void, id, void))v17)[2](v17, v14, 0);

        [(WFAngelSceneManager *)self setWindowActivationCompletionHandler:0];
      }
    }
  }
}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  v5 = [a4 if_compactMap:&stru_100038808];
  if ([v5 count])
  {
    id v6 = sub_100002254();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[WFAngelSceneManager remoteAlertScene:handleButtonActions:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Home gesture invoked, invoking cancellation handler...", (uint8_t *)&v9, 0xCu);
    }

    int v7 = [(WFAngelSceneManager *)self cancellationHandler];

    if (v7)
    {
      uint64_t v8 = [(WFAngelSceneManager *)self cancellationHandler];
      (*(void (**)(void))(v8 + 16))();
    }
    else
    {
      uint64_t v8 = sub_100002254();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        id v10 = "-[WFAngelSceneManager remoteAlertScene:handleButtonActions:]";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%s Cancellation handler not found...", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)setActiveWindow:(id)a3
{
  id v4 = (UIWindow *)a3;
  v5 = sub_100002254();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WFAngelSceneManager setActiveWindow:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Setting active window to %@", (uint8_t *)&v7, 0x16u);
  }

  activeWindow = self->_activeWindow;
  self->_activeWindow = v4;
}

- (void)requestSceneDeactivation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002808;
  block[3] = &unk_100038C80;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)getWindowWithCancellationHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v8 = sub_100002254();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v18 = "-[WFAngelSceneManager getWindowWithCancellationHandler:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Getting window...", buf, 0xCu);
  }

  id v9 = objc_alloc((Class)SBSRemoteAlertDefinition);
  id v10 = +[RBSProcessIdentity identityForAngelJobLabel:@"com.apple.ShortcutsUI"];
  id v11 = [v9 initWithSceneProvidingProcess:v10 configurationIdentifier:0];

  id v12 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  id v13 = +[SBSRemoteAlertHandle newHandleWithDefinition:v11 configurationContext:v12];
  id v14 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [v13 activateWithContext:v14];
  [(WFAngelSceneManager *)self setWindowActivationCompletionHandler:v7];
  [(WFAngelSceneManager *)self setCancellationHandler:v6];
  if (self->_displayStatusNotifyToken == -1)
  {
    objc_initWeak((id *)buf, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002B4C;
    handler[3] = &unk_1000387C8;
    objc_copyWeak(&v16, (id *)buf);
    notify_register_dispatch("com.apple.iokit.hid.displayStatus", &self->_displayStatusNotifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_displayStatusNotifyToken)) {
    notify_cancel(self->_displayStatusNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)WFAngelSceneManager;
  [(WFAngelSceneManager *)&v3 dealloc];
}

- (WFAngelSceneManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFAngelSceneManager;
  v2 = [(WFAngelSceneManager *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_displayStatusNotifyToken = -1;
    id v4 = v2;
  }

  return v3;
}

+ (id)sharedManager
{
  if (qword_100044078 != -1) {
    dispatch_once(&qword_100044078, &stru_100038828);
  }
  v2 = (void *)qword_100044080;

  return v2;
}

@end