@interface NotificationController
+ (id)sharedController;
- (id)xpcConnectionForClientWithMachServiceName:(id)a3;
- (void)_allPendingNotificationsSortedByDate:(id)a3;
- (void)allPendingNotificationsWithCompletion:(id)a3;
- (void)deliverNotification:(id)a3;
- (void)pendingNotificationsForClient:(id)a3 withCompletion:(id)a4;
- (void)provider:(id)a3 didActivateNotification:(id)a4;
- (void)provider:(id)a3 didDismissNotification:(id)a4;
- (void)removeAllNotificationsFromClient:(id)a3;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)start;
@end

@implementation NotificationController

+ (id)sharedController
{
  if (qword_10000DB48 != -1) {
    dispatch_once(&qword_10000DB48, &stru_1000082E0);
  }
  v2 = (void *)qword_10000DB40;
  return v2;
}

- (void)start
{
  v3 = objc_alloc_init(FAUserNotificationProvider);
  notificationProvider = self->_notificationProvider;
  self->_notificationProvider = v3;

  v5 = self->_notificationProvider;
  [(FAUserNotificationProvider *)v5 setDelegate:self];
}

- (void)deliverNotification:(id)a3
{
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing notification with identifier: %@", (uint8_t *)&v6, 0xCu);
  }

  [(FAUserNotificationProvider *)self->_notificationProvider tearDownNotificationWithIdentifier:v4];
}

- (void)removeAllNotificationsFromClient:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing all notifications for client: %@", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000037C4;
  v6[3] = &unk_100008330;
  v6[4] = self;
  [(NotificationController *)self pendingNotificationsForClient:v4 withCompletion:v6];
}

- (void)pendingNotificationsForClient:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetch pending notifications for client: %@", buf, 0xCu);
  }

  notificationProvider = self->_notificationProvider;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000039D4;
  v12[3] = &unk_100008358;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(FAUserNotificationProvider *)notificationProvider deliveredNotifications:v12];
}

- (void)allPendingNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching all notifications", v6, 2u);
  }

  [(NotificationController *)self _allPendingNotificationsSortedByDate:v4];
}

- (void)_allPendingNotificationsSortedByDate:(id)a3
{
  id v4 = a3;
  notificationProvider = self->_notificationProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003C18;
  v7[3] = &unk_100008298;
  id v8 = v4;
  id v6 = v4;
  [(FAUserNotificationProvider *)notificationProvider deliveredNotifications:v7];
}

- (void)provider:(id)a3 didActivateNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v13 = _FALogSystem();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    id v14 = [0 uuid];
    int v19 = 138412290;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NotificationController: Did not find pending notification to activate with UUID %@", (uint8_t *)&v19, 0xCu);
LABEL_10:

    goto LABEL_11;
  }
  v9 = [v7 activateActionURL];

  if (v9)
  {
    id v10 = +[LSApplicationWorkspace defaultWorkspace];
    id v11 = [v8 activateActionURL];
    uint64_t v21 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v22 = &__kCFBooleanTrue;
    v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v10 openSensitiveURL:v11 withOptions:v12];

    id v13 = [v8 identifier];
    [(NotificationController *)self removeNotificationWithIdentifier:v13];
    goto LABEL_11;
  }
  v15 = [v8 delegateMachServiceName];

  id v13 = _FALogSystem();
  BOOL v16 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v16)
    {
      v17 = [v8 delegateMachServiceName];
      int v19 = 138412290;
      v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to wake up delegate at %@", (uint8_t *)&v19, 0xCu);
    }
    v18 = [v8 delegateMachServiceName];
    id v13 = [(NotificationController *)self xpcConnectionForClientWithMachServiceName:v18];

    id v14 = [v13 remoteObjectProxyWithErrorHandler:&stru_100008398];
    [v14 didActivateNotification:v8];
    goto LABEL_10;
  }
  if (v16)
  {
    int v19 = 138412290;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NotificationController: No action was configured for activated notification %@", (uint8_t *)&v19, 0xCu);
  }
LABEL_11:
}

- (void)provider:(id)a3 didDismissNotification:(id)a4
{
  id v5 = a4;
  id v6 = [v5 dismissActionlURL];

  if (v6)
  {
    id v7 = +[LSApplicationWorkspace defaultWorkspace];
    id v8 = [v5 dismissActionlURL];
    [v7 openURL:v8];
LABEL_7:

    goto LABEL_8;
  }
  v9 = [v5 delegateMachServiceName];

  if (v9)
  {
    id v10 = [v5 delegateMachServiceName];
    id v7 = [(NotificationController *)self xpcConnectionForClientWithMachServiceName:v10];

    id v8 = [v7 remoteObjectProxyWithErrorHandler:&stru_1000083B8];
    [v8 didDismissNotification:v5];
    goto LABEL_7;
  }
  id v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 uuid];
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NotificationController: Did not find pending notification to dismiss with UUID %@", (uint8_t *)&v11, 0xCu);
    goto LABEL_7;
  }
LABEL_8:
}

- (id)xpcConnectionForClientWithMachServiceName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v3 options:4096];

  id v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FAFamilyNotifierRemoteObjectProtocol];
  [v4 setRemoteObjectInterface:v5];
  [v4 resume];

  return v4;
}

- (void).cxx_destruct
{
}

@end