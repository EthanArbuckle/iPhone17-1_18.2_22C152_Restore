@interface BLNotificationConnection
- (APSConnection)connection;
- (BLNotificationConnection)initWithEnvironment:(id)a3 queue:(id)a4;
- (BLNotificationConnectionDelegate)delegate;
- (NSString)environment;
- (OS_dispatch_queue)queue;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation BLNotificationConnection

- (BLNotificationConnection)initWithEnvironment:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLNotificationConnection;
  v9 = [(BLNotificationConnection *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_environment, a3);
    v11 = (APSConnection *)[objc_alloc((Class)APSConnection) initWithEnvironmentName:v7 namedDelegatePort:@"com.apple.aps.bookassetd" queue:v10->_queue];
    connection = v10->_connection;
    v10->_connection = v11;

    CFStringRef v16 = @"com.apple.bookassetd";
    v13 = +[NSArray arrayWithObjects:&v16 count:1];
    [(APSConnection *)v10->_connection _setEnabledTopics:v13];

    [(APSConnection *)v10->_connection setDelegate:v10];
  }

  return v10;
}

- (void)dealloc
{
  [(APSConnection *)self->_connection shutdown];
  v3.receiver = self;
  v3.super_class = (Class)BLNotificationConnection;
  [(BLNotificationConnection *)&v3 dealloc];
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7 = a3;
  queue = self->_queue;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v10 = [[BLNotificationMessage alloc] initWithUserInfo:v9];

  v11 = BLServiceNotificationLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    id v14 = v7;
    __int16 v15 = 2114;
    CFStringRef v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Connection: %{public}@ received incoming message %{public}@", (uint8_t *)&v13, 0x16u);
  }

  if ([(BLNotificationMessage *)v10 actionType] == -1)
  {
    WeakRetained = BLServiceNotificationLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = v7;
      __int16 v15 = 2114;
      CFStringRef v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Connection: %{public}@ received invalid message %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connection:self didRecieveMessage:v10];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = BLServiceNotificationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = objc_msgSend(v7, "bu_md5");
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    int v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connection: %{public}@ received public token %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (BLNotificationConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLNotificationConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end