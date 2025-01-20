@interface FAPushHelperService
+ (id)sharedInstance;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (FAFamilyNotifier)familyNotifier;
- (FAPushHelperService)init;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)setFamilyNotifier:(id)a3;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
- (void)start;
- (void)startNewConnection;
- (void)stop;
@end

@implementation FAPushHelperService

+ (id)sharedInstance
{
  if (qword_10005EF48 != -1) {
    dispatch_once(&qword_10005EF48, &stru_10004D9A0);
  }
  v2 = (void *)qword_10005EF40;
  return v2;
}

- (FAPushHelperService)init
{
  v17.receiver = self;
  v17.super_class = (Class)FAPushHelperService;
  v2 = [(FAPushHelperService *)&v17 init];
  if (v2)
  {
    v3 = objc_alloc_init(FAEventPushHandler);
    eventPushHandler = v2->_eventPushHandler;
    v2->_eventPushHandler = v3;

    uint64_t v5 = +[NSSet setWithObjects:@"com.icloud.family", 0];
    pushTpoics = v2->_pushTpoics;
    v2->_pushTpoics = (NSSet *)v5;

    v7 = v2->_eventPushHandler;
    v8 = objc_alloc_init(FAFollowupPushHandler);
    uint64_t v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, 0);
    pushHandlers = v2->_pushHandlers;
    v2->_pushHandlers = (NSArray *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.family.aps_queue", v11);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v12;

    v14 = (FAFamilyNotifier *)[objc_alloc((Class)FAFamilyNotifier) initWithIdentifier:@"com.apple.familycircled" machServiceName:@"com.apple.family.notifier"];
    familyNotifier = v2->_familyNotifier;
    v2->_familyNotifier = v14;
  }
  return v2;
}

- (void)dealloc
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down APS connection.", buf, 2u);
  }

  [(FAPushHelperService *)self stop];
  v4.receiver = self;
  v4.super_class = (Class)FAPushHelperService;
  [(FAPushHelperService *)&v4 dealloc];
}

- (void)start
{
  if (self->_connection)
  {
    v2 = _FALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "APS connection is already active.", v3, 2u);
    }
  }
  else
  {
    [(FAPushHelperService *)self startNewConnection];
  }
}

- (void)stop
{
  [(APSConnection *)self->_connection shutdown];
  [(APSConnection *)self->_connection setDelegate:0];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)startNewConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF88;
  block[3] = &unk_10004D9F0;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  uint64_t v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 base64EncodedStringWithOptions:0];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "APS public token received: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 topic];
    v8 = [v5 userInfo];
    *(_DWORD *)buf = 138412546;
    v23 = v7;
    __int16 v24 = 2112;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received new incoming message from APS. %@ - %@", buf, 0x16u);
  }
  uint64_t v9 = [[FAPushMessage alloc] initWithMessage:v5];
  if ([(FAPushMessage *)v9 isValid])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = self->_pushHandlers;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "shouldProcess:", v9, (void)v17))
          {
            v16 = _FALogSystem();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found a handler, processing push.", buf, 2u);
            }

            [v15 process:v9];
          }
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  else
  {
    _FALogSystem();
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      sub_1000350B8(&v10->super);
    }
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "APS connection status changed! isConnected: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "APS connection reconnected.", v4, 2u);
  }
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return [(FAEventPushHandler *)self->_eventPushHandler familyRefreshActivityScheduler];
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

- (FAFamilyNotifier)familyNotifier
{
  return self->_familyNotifier;
}

- (void)setFamilyNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyNotifier, 0);
  objc_storeStrong((id *)&self->_eventPushHandler, 0);
  objc_storeStrong((id *)&self->_pushHandlers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_activeAPSEnvironment, 0);
  objc_storeStrong((id *)&self->_pushTpoics, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end