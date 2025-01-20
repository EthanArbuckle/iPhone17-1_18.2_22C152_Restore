@interface AppDeletionUISceneDelegate
- (AppDeletionPresentingViewController)presentingVC;
- (AppDeletionUISceneDelegate)init;
- (OS_xpc_object)presenterConnection;
- (UIWindow)window;
- (void)_communicateAlertInvalidate;
- (void)_dismissAlert:(BOOL)a3;
- (void)communicateButtonPressWithButtonDisposition:(unint64_t)a3;
- (void)connectToInvokerEndpoint:(id)a3;
- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)setPresenterConnection:(id)a3;
- (void)setPresentingVC:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDeletionUISceneDelegate

- (AppDeletionUISceneDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)AppDeletionUISceneDelegate;
  v2 = [(AppDeletionUISceneDelegate *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AppDeletionUISceneDelegate *)v2 setPresenterConnection:0];
    [(AppDeletionUISceneDelegate *)v3 setPresentingVC:0];
  }
  return v3;
}

- (void)connectToInvokerEndpoint:(id)a3
{
  v4 = (_xpc_endpoint_s *)a3;
  objc_super v5 = sub_1000072E4((uint64_t)off_100017300);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AppDeletionUISceneDelegate connectToInvokerEndpoint:]";
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Connecting to presenter %@", buf, 0x16u);
  }

  xpc_connection_t v6 = xpc_connection_create_from_endpoint(v4);
  [(AppDeletionUISceneDelegate *)self setPresenterConnection:v6];

  v7 = [(AppDeletionUISceneDelegate *)self presenterConnection];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000076B0;
  handler[3] = &unk_1000103A0;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);

  v8 = [(AppDeletionUISceneDelegate *)self presenterConnection];
  xpc_connection_resume(v8);

  *(void *)buf = "begin";
  xpc_object_t v11 = xpc_BOOL_create(1);
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)buf, &v11, 1uLL);
  v10 = [(AppDeletionUISceneDelegate *)self presenterConnection];
  xpc_connection_send_message(v10, v9);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = v6;
    v8 = [v7 configurationContext];
    xpc_object_t v9 = [v8 xpcEndpoint];

    if (v9)
    {
      [(AppDeletionUISceneDelegate *)self connectToInvokerEndpoint:v9];
      v10 = [v7 configurationContext];
      xpc_object_t v11 = [v10 userInfo];

      if (v11)
      {
        v12 = [[AppDeletionPresentingViewController alloc] initWithAlertData:v11 delegate:self];
        if (v12)
        {
          v13 = v12;
          [(AppDeletionUISceneDelegate *)self setPresentingVC:v12];
          id v14 = [objc_alloc((Class)UIWindow) initWithWindowScene:v7];
          [(AppDeletionUISceneDelegate *)self setWindow:v14];

          v15 = [(AppDeletionUISceneDelegate *)self window];
          [v15 setRootViewController:v13];

          v16 = [(AppDeletionUISceneDelegate *)self window];
          [v16 makeKeyAndVisible];

          [v7 setAllowsAlertStacking:1];
LABEL_16:

          goto LABEL_17;
        }
        v18 = sub_1000072E4((uint64_t)off_100017300);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100008954(v18, v26, v27, v28, v29, v30, v31, v32);
        }
      }
      else
      {
        v18 = sub_1000072E4((uint64_t)off_100017300);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000088DC(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }

      [(AppDeletionUISceneDelegate *)self _communicateAlertInvalidate];
      goto LABEL_16;
    }
    v17 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100008858(v17);
    }
  }
  else
  {
    v7 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000089CC(v7);
    }
  }
LABEL_17:
}

- (void)sceneDidBecomeActive:(id)a3
{
  v4 = [(AppDeletionUISceneDelegate *)self presentingVC];
  id v5 = objc_alloc((Class)UINavigationController);
  id v6 = [v4 obViewController];
  id v7 = [v5 initWithRootViewController:v6];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007DA0;
  v18[3] = &unk_1000103C8;
  id v8 = v4;
  id v19 = v8;
  xpc_object_t v9 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:UISheetPresentationControllerDetentIdentifierMedium resolver:v18];
  uint64_t v26 = v9;
  v10 = +[NSArray arrayWithObjects:&v26 count:1];
  xpc_object_t v11 = [v7 sheetPresentationController];
  [v11 setDetents:v10];

  v12 = [v7 sheetPresentationController];
  [v12 setPreferredCornerRadius:30.0];

  v13 = [v7 presentationController];
  [v13 setDelegate:v8];

  id v14 = sub_1000072E4((uint64_t)off_100017300);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v8 bundleID];
    id v16 = [v8 appType];
    *(_DWORD *)buf = 136315650;
    uint64_t v21 = "-[AppDeletionUISceneDelegate sceneDidBecomeActive:]";
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 2048;
    id v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Presenting the deletion sheet for %@ with type %lu", buf, 0x20u);
  }
  v17 = [(AppDeletionUISceneDelegate *)self presentingVC];
  [v17 presentSheetViewController:v7];
}

- (void)communicateButtonPressWithButtonDisposition:(unint64_t)a3
{
  id v5 = [(AppDeletionUISceneDelegate *)self presenterConnection];

  if (v5)
  {
    keys = "result";
    xpc_object_t v16 = xpc_int64_create(a3);
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &v16, 1uLL);
    id v7 = [(AppDeletionUISceneDelegate *)self presenterConnection];
    xpc_connection_send_message(v7, v6);
  }
  else
  {
    id v8 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100008A50(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)_communicateAlertInvalidate
{
  v3 = [(AppDeletionUISceneDelegate *)self presenterConnection];

  if (v3)
  {
    keys = "dismiss";
    xpc_object_t v14 = xpc_BOOL_create(1);
    xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &v14, 1uLL);
    id v5 = [(AppDeletionUISceneDelegate *)self presenterConnection];
    xpc_connection_send_message(v5, v4);
  }
  else
  {
    xpc_object_t v6 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100008AC8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)_dismissAlert:(BOOL)a3
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007FCC;
    block[3] = &unk_1000103F0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(AppDeletionUISceneDelegate *)self _communicateAlertInvalidate];
  }
}

- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = sub_1000072E4((uint64_t)off_100017300);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    xpc_object_t v6 = "-[AppDeletionUISceneDelegate remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Scene Invalidated: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (OS_xpc_object)presenterConnection
{
  return self->_presenterConnection;
}

- (void)setPresenterConnection:(id)a3
{
}

- (AppDeletionPresentingViewController)presentingVC
{
  return self->_presentingVC;
}

- (void)setPresentingVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingVC, 0);
  objc_storeStrong((id *)&self->_presenterConnection, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end