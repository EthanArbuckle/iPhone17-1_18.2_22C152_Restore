@interface ANNotificationController
- (ANNotificationController)init;
- (id)_clientSideNotifierWithMachServiceName:(id)a3;
- (void)addNotification:(id)a3 withCompletion:(id)a4;
- (void)notificationProvider:(id)a3 didActivateNotification:(id)a4;
- (void)notificationProvider:(id)a3 didDismissNotification:(id)a4;
- (void)removeNotificationWithID:(id)a3 completion:(id)a4;
- (void)removeNotificationsWithEventID:(id)a3 completion:(id)a4;
@end

@implementation ANNotificationController

- (ANNotificationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANNotificationController;
  v2 = [(ANNotificationController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ANNotificationProvider);
    notificationProvider = v2->_notificationProvider;
    v2->_notificationProvider = v3;

    [(ANNotificationProvider *)v2->_notificationProvider setDelegate:v2];
  }
  return v2;
}

- (void)addNotification:(id)a3 withCompletion:(id)a4
{
}

- (void)removeNotificationWithID:(id)a3 completion:(id)a4
{
  notificationProvider = self->_notificationProvider;
  objc_super v6 = (void (**)(id, uint64_t, void))a4;
  [(ANNotificationProvider *)notificationProvider removeNotificationWithIdentifier:a3];
  v6[2](v6, 1, 0);
}

- (void)removeNotificationsWithEventID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  notificationProvider = self->_notificationProvider;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006870;
  v11[3] = &unk_10000C4D0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ANNotificationProvider *)notificationProvider deliveredNotifications:v11];
}

- (void)notificationProvider:(id)a3 didActivateNotification:(id)a4
{
  id v5 = a4;
  id v6 = _ANLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[ANNotificationController notificationProvider:didActivateNotification:]";
    __int16 v14 = 1024;
    int v15 = 76;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Activated notification: %@\"", buf, 0x1Cu);
  }

  id v7 = dispatch_get_global_queue(25, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006BC0;
  v9[3] = &unk_10000C4F8;
  id v10 = v5;
  v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)notificationProvider:(id)a3 didDismissNotification:(id)a4
{
  id v5 = a4;
  id v6 = _ANLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[ANNotificationController notificationProvider:didDismissNotification:]";
    __int16 v14 = 1024;
    int v15 = 91;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Dismissed notification: %@\"", buf, 0x1Cu);
  }

  id v7 = dispatch_get_global_queue(25, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006E98;
  v9[3] = &unk_10000C4F8;
  id v10 = v5;
  v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (id)_clientSideNotifierWithMachServiceName:(id)a3
{
  id v3 = a3;
  v4 = _ANLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[ANNotificationController _clientSideNotifierWithMachServiceName:]";
    __int16 v20 = 1024;
    int v21 = 110;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Creating XPC connection to %@...\"", buf, 0x1Cu);
  }

  id v5 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v3 options:0];
  id v6 = +[ANClientCallbackInterface XPCInterface];
  [v5 setRemoteObjectInterface:v6];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007228;
  v16[3] = &unk_10000C398;
  id v7 = v3;
  id v17 = v7;
  [v5 setInterruptionHandler:v16];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100007274;
  __int16 v14 = &unk_10000C398;
  id v15 = v7;
  id v8 = v7;
  [v5 setInvalidationHandler:&v11];
  objc_msgSend(v5, "resume", v11, v12, v13, v14);
  id v9 = [v5 remoteObjectProxyWithErrorHandler:&stru_10000C538];

  return v9;
}

- (void).cxx_destruct
{
}

@end