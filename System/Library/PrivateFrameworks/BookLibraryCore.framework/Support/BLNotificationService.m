@interface BLNotificationService
- (AMSPushHandler)pushHandler;
- (BLAutomaticDownloadProcessing)automaticDownloadProcessor;
- (BLNotificationConnection)connection;
- (BLNotificationService)initWithAutomaticDownloadProcessor:(id)a3;
- (NSString)environment;
- (OS_dispatch_queue)dispatchQueue;
- (void)_handleBagChangedNotification:(id)a3;
- (void)_handleCheckDownloadQueueMessage:(id)a3;
- (void)_handleNotification:(id)a3 notificationType:(id)a4;
- (void)_handlePreorderAvailableNotificationForMessage:(id)a3;
- (void)_initializeConnections;
- (void)connection:(id)a3 didRecieveMessage:(id)a4;
- (void)setAutomaticDownloadProcessor:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPushHandler:(id)a3;
@end

@implementation BLNotificationService

- (BLNotificationService)initWithAutomaticDownloadProcessor:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BLNotificationService;
  v6 = [(BLNotificationService *)&v20 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("BLNotificationConnection.Dispatch", v7);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v8;

    id v10 = objc_alloc_init((Class)AMSPushConfiguration);
    [v10 setUserNotificationExtensionId:@"books-notification-extension"];
    id v11 = objc_alloc((Class)AMSPushHandler);
    v12 = +[BUBag defaultBag];
    v13 = (AMSPushHandler *)[v11 initWithConfiguration:v10 bag:v12];
    pushHandler = v6->_pushHandler;
    v6->_pushHandler = v13;

    objc_storeStrong((id *)&v6->_automaticDownloadProcessor, a3);
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v6 selector:"_handleBagChangedNotification:" name:AMSBagChangedNotification object:0];

    v16 = v6->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000069EC;
    block[3] = &unk_1001A0FE8;
    v19 = v6;
    dispatch_async(v16, block);
  }
  return v6;
}

- (void)_initializeConnections
{
  v3 = +[BUBag defaultBag];
  v4 = [v3 pushNotificationsEnvironment];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006A9C;
  v5[3] = &unk_1001A10A0;
  v5[4] = self;
  [v4 valueWithCompletion:v5];
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006EA0;
  block[3] = &unk_1001A0FE8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)connection:(id)a3 didRecieveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006F6C;
  block[3] = &unk_1001A10C8;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_handleCheckDownloadQueueMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[BUAccountsProvider sharedProvider];
  id v6 = [v5 activeStoreAccount];
  id v7 = objc_msgSend(v6, "ams_DSID");

  dispatch_queue_t v8 = [v4 accountID];
  LODWORD(v6) = [v7 isEqualToNumber:v8];

  if (v6)
  {
    id v9 = _os_activity_create((void *)&_mh_execute_header, "checkDownloadQueue notification", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007684;
    block[3] = &unk_1001A0FE8;
    void block[4] = self;
    os_activity_apply(v9, block);
  }
  else
  {
    id v9 = BLServiceNotificationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 accountID];
      *(_DWORD *)buf = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received checkDownloadQueue notification for account %@ but active account is %@, so ignoring it", buf, 0x16u);
    }
  }
}

- (void)_handleNotification:(id)a3 notificationType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  dispatch_queue_t v8 = [v6 userInfo];
  id v9 = [v8 objectForKeyedSubscript:@"aps"];
  id v10 = [v9 objectForKeyedSubscript:@"_mt"];
  id v11 = [v10 objectForKeyedSubscript:@"details"];
  id v12 = [v11 objectForKeyedSubscript:@"contentAdamId"];
  id v13 = BUDynamicCast();

  if (v13 && [v13 length])
  {
    __int16 v14 = _os_activity_create((void *)&_mh_execute_header, "Handle notification", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000079D0;
    block[3] = &unk_1001A1130;
    id v17 = v7;
    id v18 = v13;
    v19 = self;
    id v20 = v6;
    os_activity_apply(v14, block);
  }
  else
  {
    __int16 v14 = BLServiceNotificationLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "storeID is empty", v15, 2u);
    }
  }
}

- (void)_handlePreorderAvailableNotificationForMessage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 userInfo];

  id v5 = [v4 objectForKeyedSubscript:@"aps"];
  id v6 = [v5 objectForKeyedSubscript:@"_mt"];
  id v7 = [v6 objectForKeyedSubscript:@"details"];
  dispatch_queue_t v8 = [v7 objectForKeyedSubscript:@"contentAdamId"];
  id v9 = BUDynamicCast();

  if (v9 && [v9 length])
  {
    id v10 = objc_opt_new();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007C9C;
    v11[3] = &unk_1001A1158;
    id v12 = v9;
    [v10 addStoreIDtoWantToReadList:v12 withCompletion:v11];
  }
}

- (BLAutomaticDownloadProcessing)automaticDownloadProcessor
{
  return self->_automaticDownloadProcessor;
}

- (void)setAutomaticDownloadProcessor:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (AMSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (BLNotificationConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_automaticDownloadProcessor, 0);
}

@end