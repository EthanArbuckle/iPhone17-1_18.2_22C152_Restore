@interface NotifierInterface
- (NSString)clientIdentifier;
- (NSString)delegateMachServiceName;
- (NotifierInterface)initWithXPCConnection:(id)a3;
- (void)deliverNotificaton:(id)a3;
- (void)pendingNotificationsWithIdentifier:(id)a3 replyBlock:(id)a4;
- (void)removeAllNotifications;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegateMachServiceName:(id)a3;
@end

@implementation NotifierInterface

- (NotifierInterface)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NotifierInterface;
  v6 = [(NotifierInterface *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_conn, a3);
  }

  return v7;
}

- (void)deliverNotificaton:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString uniqueIdentifier];
  [v4 setUuid:v5];

  v6 = [(NotifierInterface *)self clientIdentifier];
  [v4 setClientIdentifier:v6];

  v7 = [(NotifierInterface *)self delegateMachServiceName];
  [v4 setDelegateMachServiceName:v7];

  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delivering %@", (uint8_t *)&v10, 0xCu);
  }

  objc_super v9 = +[NotificationController sharedController];
  [v9 deliverNotification:v4];
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[NotificationController sharedController];
  [v5 removeNotificationWithIdentifier:v3];
}

- (void)removeAllNotifications
{
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all notifications", v6, 2u);
  }

  id v4 = +[NotificationController sharedController];
  id v5 = [(NotifierInterface *)self clientIdentifier];
  [v4 removeAllNotificationsFromClient:v5];
}

- (void)pendingNotificationsWithIdentifier:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Returning pending notifications for identifier %@", buf, 0xCu);
  }

  objc_super v9 = dispatch_get_global_queue(2, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003358;
  v11[3] = &unk_1000082C0;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)delegateMachServiceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegateMachServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMachServiceName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end