@interface EducationUISceneDelegate
- (EducationUISceneDelegate)init;
- (UIWindow)window;
- (void)connectToInvokerEndpoint:(id)a3;
- (void)dealloc;
- (void)remoteAlertScene:(id)a3 didTransitionToAttachedToWindowedAccessory:(BOOL)a4 windowedAccessoryCutoutFrameInScreen:(CGRect)a5;
- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4;
- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
- (void)systemActionDelegate:(id)a3 requestsDismissalOfEducationController:(id)a4;
@end

@implementation EducationUISceneDelegate

- (EducationUISceneDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)EducationUISceneDelegate;
  v2 = [(EducationUISceneDelegate *)&v5 init];
  v3 = sub_1000051C4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "init delegate %@", buf, 0xCu);
  }

  return v2;
}

- (void)dealloc
{
  v3 = sub_1000051C4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "deallocate delegate %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)EducationUISceneDelegate;
  [(EducationUISceneDelegate *)&v4 dealloc];
}

- (void)connectToInvokerEndpoint:(id)a3
{
  objc_super v4 = (_xpc_endpoint_s *)a3;
  objc_super v5 = sub_1000051C4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connecting to presenter", v8, 2u);
  }

  v6 = xpc_connection_create_from_endpoint(v4);
  connectionToPresenter = self->_connectionToPresenter;
  self->_connectionToPresenter = v6;

  xpc_connection_set_event_handler(self->_connectionToPresenter, &stru_100008208);
  xpc_connection_resume(self->_connectionToPresenter);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000051C4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v35 = "-[EducationUISceneDelegate scene:willConnectToSession:options:]";
    __int16 v36 = 2112;
    v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    __int16 v40 = 2112;
    id v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ %@ %@", buf, 0x2Au);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = v8;
    v13 = [v12 configurationContext];
    v14 = [v13 xpcEndpoint];

    if (v14) {
      [(EducationUISceneDelegate *)self connectToInvokerEndpoint:v14];
    }
    v15 = [v12 configurationContext];
    v16 = [v15 userInfo];
    v17 = [v16 objectForKey:kCFBundleIdentifierKey];

    if (v17)
    {
      v33 = v14;
      v18 = [v12 configurationContext];
      v19 = [v18 userInfo];
      v20 = [v19 objectForKey:@"feature"];
      v21 = (char *)[v20 unsignedIntegerValue];

      v22 = sub_1000051C4();
      v23 = v22;
      if ((unint64_t)(v21 - 4) > 0xFFFFFFFFFFFFFFFCLL)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v17;
          __int16 v36 = 2048;
          v37 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "init education VC for %@ feature %lld", buf, 0x16u);
        }

        v24 = (APEducationViewControllerSystemActionDelegate *)objc_alloc_init((Class)APEducationViewControllerSystemActionDelegate);
        actionDelegate = self->_actionDelegate;
        self->_actionDelegate = v24;

        [(APEducationViewControllerSystemActionDelegate *)self->_actionDelegate setDelegate:self];
        v26 = (UIWindow *)[objc_alloc((Class)UIWindow) initWithWindowScene:v12];
        window = self->_window;
        self->_window = v26;

        v23 = +[APApplication applicationWithBundleIdentifier:v17];
        if (v21 == (char *)2)
        {
          v28 = (objc_class *)APHideEducationViewController;
        }
        else if (v21 == (char *)1)
        {
          v28 = (objc_class *)APLockEducationViewController;
        }
        else
        {
          v28 = (objc_class *)APEducationFlowViewController;
        }
        v29 = (APEducationViewController *)[[v28 alloc] initForApplication:v23];
        educationVC = self->_educationVC;
        self->_educationVC = v29;

        [(APEducationViewController *)self->_educationVC setDelegate:self->_actionDelegate];
        v31 = (APEducationVCPresentingViewController *)objc_alloc_init((Class)APEducationVCPresentingViewController);
        presentingVC = self->_presentingVC;
        self->_presentingVC = v31;

        [(UIWindow *)self->_window setRootViewController:self->_presentingVC];
        [(UIWindow *)self->_window makeKeyAndVisible];
        [v12 setAllowsAlertStacking:1];
        v14 = v33;
      }
      else
      {
        v14 = v33;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1000053D0((uint64_t)v21, v23);
        }
      }
    }
    else
    {
      v23 = sub_1000051C4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100005320(v12, v23);
      }
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3 = a3;
  objc_super v4 = sub_1000051C4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[EducationUISceneDelegate sceneDidDisconnect:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  int v5 = sub_1000051C4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    educationVC = self->_educationVC;
    int v7 = 136315650;
    id v8 = "-[EducationUISceneDelegate sceneDidBecomeActive:]";
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    v12 = educationVC;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@; presenting education VC %@",
      (uint8_t *)&v7,
      0x20u);
  }

  [(APEducationVCPresentingViewController *)self->_presentingVC presentEducationViewController:self->_educationVC];
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000051C4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[EducationUISceneDelegate sceneWillResignActive:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000051C4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[EducationUISceneDelegate sceneWillEnterForeground:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000051C4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[EducationUISceneDelegate sceneDidEnterBackground:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  id v4 = a3;
  int v5 = sub_1000051C4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    __int16 v7 = "-[EducationUISceneDelegate remoteAlertScene:handleButtonActions:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000051C4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "-[EducationUISceneDelegate remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)remoteAlertScene:(id)a3 didTransitionToAttachedToWindowedAccessory:(BOOL)a4 windowedAccessoryCutoutFrameInScreen:(CGRect)a5
{
  id v5 = a3;
  int v6 = sub_1000051C4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[EducationUISceneDelegate remoteAlertScene:didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)systemActionDelegate:(id)a3 requestsDismissalOfEducationController:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004ECC;
  v4[3] = &unk_100008258;
  v4[4] = self;
  [a4 dismissViewControllerAnimated:1 completion:v4];
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
  objc_storeStrong((id *)&self->_connectionToPresenter, 0);
  objc_storeStrong((id *)&self->_presentingVC, 0);
  objc_storeStrong((id *)&self->_educationVC, 0);

  objc_storeStrong((id *)&self->_actionDelegate, 0);
}

@end