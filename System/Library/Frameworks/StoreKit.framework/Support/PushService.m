@interface PushService
+ (id)_pushHandlerWithBagContract:(id)a3;
+ (id)sharedInstance;
- (PushService)init;
- (PushService)initWithConnection:(id)a3;
- (void)_flushPendingMessagesWithActionType:(id)a3;
- (void)_handleBagChangedNotification:(id)a3;
- (void)_initializeConnectionsAndSkipEnvironmentCheck:(BOOL)a3;
- (void)_processReceivedMessage:(id)a3 withConnection:(id)a4;
- (void)_queuePendingMessage:(id)a3 withActionType:(id)a4;
- (void)_unitTest_waitForSetup;
- (void)pushConnection:(id)a3 didRecieveMessage:(id)a4;
- (void)registerConsumer:(id)a3 forActionType:(unint64_t)a4;
- (void)unregisterConsumerForActionType:(unint64_t)a3;
@end

@implementation PushService

+ (id)sharedInstance
{
  if (qword_1003A0430 != -1) {
    dispatch_once(&qword_1003A0430, &stru_10035A438);
  }
  v2 = (void *)qword_1003A0428;

  return v2;
}

- (PushService)init
{
  return [(PushService *)self initWithConnection:0];
}

- (PushService)initWithConnection:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PushService;
  v6 = [(PushService *)&v25 init];
  if (v6)
  {
    uint64_t v7 = sub_10009F6F8("com.apple.storekit.StorePushService", QOS_CLASS_UTILITY);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSMapTable strongToWeakObjectsMapTable];
    consumers = v6->_consumers;
    v6->_consumers = (NSMapTable *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingMessages = v6->_pendingMessages;
    v6->_pendingMessages = v11;

    if (v5)
    {
      objc_storeStrong((id *)&v6->_connection, a3);
      [v5 setDelegate:v6];
    }
    v13 = v6->_dispatchQueue;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10008A3F4;
    v22 = &unk_1003580D0;
    v14 = v6;
    v23 = v14;
    id v24 = v5;
    dispatch_async(v13, &v19);
    if (os_variant_has_internal_content())
    {
      v15 = [PushDiagnostic alloc];
      v16 = -[PushDiagnostic initWithService:](v15, "initWithService:", v14, v19, v20, v21, v22, v23);
      pushDiagnostic = v14->_pushDiagnostic;
      v14->_pushDiagnostic = v16;
    }
  }

  return v6;
}

- (void)registerConsumer:(id)a3 forActionType:(unint64_t)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A55C;
  block[3] = &unk_100358F78;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)unregisterConsumerForActionType:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008A6B0;
  v4[3] = &unk_1003571F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)pushConnection:(id)a3 didRecieveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A840;
  block[3] = &unk_1003599E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

+ (id)_pushHandlerWithBagContract:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)AMSPushConfiguration);
  id v5 = +[NSSet setWithObjects:@"4", @"22", 0];
  [v4 setEnabledActionTypes:v5];

  id v6 = [objc_alloc((Class)AMSPushHandler) initWithConfiguration:v4 bag:v3];

  return v6;
}

- (void)_flushPendingMessagesWithActionType:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = [(NSMutableDictionary *)self->_pendingMessages objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [(NSMapTable *)self->_consumers objectForKey:v4];
    if (v6)
    {
      if (qword_1003A0480 != -1) {
        dispatch_once(&qword_1003A0480, &stru_10035A478);
      }
      id v7 = (void *)qword_1003A0458;
      if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_INFO))
      {
        id v8 = v7;
        *(_DWORD *)buf = 134218242;
        id v21 = [v5 count];
        __int16 v22 = 2114;
        id v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Flushing %lu message(s) for action type: %{public}@", buf, 0x16u);
      }
      [(NSMutableDictionary *)self->_pendingMessages setObject:0 forKeyedSubscript:v4];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(v6, "pushService:didReceiveMessage:", self, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          }
          id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v11);
      }
    }
    else
    {
      if (qword_1003A0480 != -1) {
        dispatch_once(&qword_1003A0480, &stru_10035A478);
      }
      v14 = (void *)qword_1003A0458;
      if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_ERROR)) {
        sub_1002C9C68(v14, v5, (uint64_t)v4);
      }
    }
  }
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008ABC0;
  block[3] = &unk_100358170;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_initializeConnectionsAndSkipEnvironmentCheck:(BOOL)a3
{
  id v5 = APSEnvironmentProduction;
  if (a3)
  {
    if (qword_1003A0480 != -1) {
      dispatch_once(&qword_1003A0480, &stru_10035A478);
    }
    id v6 = qword_1003A0458;
    if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping environment check and defaulting to: %{public}@", buf, 0xCu);
    }
    id v7 = 0;
    if (!v5) {
      goto LABEL_18;
    }
  }
  else
  {
    id v8 = +[Bag defaultBag];
    id v9 = +[BagKey pushEnvironment];
    id v10 = [v8 stringForKey:v9];
    id v18 = 0;
    uint64_t v11 = [v10 valueWithError:&v18];
    id v7 = v18;

    id v5 = (id)v11;
    if (!v11)
    {
LABEL_18:
      if (self->_connection)
      {
        if (qword_1003A0480 != -1) {
          dispatch_once(&qword_1003A0480, &stru_10035A478);
        }
        if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_ERROR)) {
          sub_1002C9D80();
        }
      }
      else
      {
        if (qword_1003A0480 != -1) {
          dispatch_once(&qword_1003A0480, &stru_10035A478);
        }
        if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_ERROR)) {
          sub_1002C9D18();
        }
      }
      goto LABEL_27;
    }
  }
  if ([(NSString *)self->_environment isEqualToString:v5]) {
    goto LABEL_27;
  }
  if (!+[APSConnection isValidEnvironment:v5]) {
    goto LABEL_18;
  }
  objc_storeStrong((id *)&self->_environment, v5);
  uint64_t v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  pendingMessages = self->_pendingMessages;
  self->_pendingMessages = v12;

  if (self->_connection)
  {
    if (qword_1003A0480 != -1) {
      dispatch_once(&qword_1003A0480, &stru_10035A478);
    }
    v14 = qword_1003A0458;
    if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Shutting down existing connection before starting up in new environment: %{public}@", buf, 0xCu);
    }
    [(PushConnection *)self->_connection shutdown];
    connection = self->_connection;
    self->_connection = 0;
  }
  long long v16 = [[PushConnection alloc] initWithEnvironment:v5 queue:self->_dispatchQueue];
  long long v17 = self->_connection;
  self->_connection = v16;

  [(PushConnection *)self->_connection setDelegate:self];
LABEL_27:
}

- (void)_processReceivedMessage:(id)a3 withConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 actionType] == (id)-1)
  {
    if (qword_1003A0480 != -1) {
      dispatch_once(&qword_1003A0480, &stru_10035A478);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_ERROR)) {
      sub_1002C9DE8();
    }
  }
  else
  {
    if (qword_1003A0480 != -1) {
      dispatch_once(&qword_1003A0480, &stru_10035A478);
    }
    id v8 = qword_1003A0458;
    if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_INFO))
    {
      int v20 = 138543618;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connection: %{public}@ received incoming message: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    pushHandler = self->_pushHandler;
    id v10 = [v6 userInfo];
    LODWORD(pushHandler) = [(AMSPushHandler *)pushHandler shouldHandleNotification:v10];

    if (pushHandler)
    {
      uint64_t v11 = self->_pushHandler;
      uint64_t v12 = [v6 userInfo];
      [(AMSPushHandler *)v11 handleNotification:v12];
    }
    else
    {
      uint64_t v12 = [v6 accountID];
      id v13 = +[ACAccountStore ams_sharedAccountStore];
      v14 = objc_msgSend(v13, "ams_activeiTunesAccount");
      long long v15 = objc_msgSend(v14, "ams_DSID");

      if (v12)
      {
        if (([v15 isEqualToNumber:v12] & 1) == 0)
        {
          if (qword_1003A0480 != -1) {
            dispatch_once(&qword_1003A0480, &stru_10035A478);
          }
          long long v16 = qword_1003A0458;
          if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_DEBUG))
          {
            int v20 = 138543875;
            id v21 = v7;
            __int16 v22 = 2113;
            id v23 = v12;
            __int16 v24 = 2113;
            objc_super v25 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Connection: %{public}@ received push for %{private}@ but active is: %{private}@", (uint8_t *)&v20, 0x20u);
          }
        }
      }
      else
      {
        if (qword_1003A0480 != -1) {
          dispatch_once(&qword_1003A0480, &stru_10035A478);
        }
        if (os_log_type_enabled((os_log_t)qword_1003A0458, OS_LOG_TYPE_DEBUG)) {
          sub_1002C9E50();
        }
      }
      long long v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 actionType]);
      id v18 = [(NSMapTable *)self->_consumers objectForKey:v17];
      v19 = v18;
      if (v18) {
        [v18 pushService:self didReceiveMessage:v6];
      }
      else {
        [(PushService *)self _queuePendingMessage:v6 withActionType:v17];
      }
    }
  }
}

- (void)_queuePendingMessage:(id)a3 withActionType:(id)a4
{
  id v11 = a4;
  dispatchQueue = self->_dispatchQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v8 = [(NSMutableDictionary *)self->_pendingMessages objectForKeyedSubscript:v11];
  id v9 = v8;
  if (v8)
  {
    [v8 addObject:v7];
  }
  else
  {
    uint64_t v10 = +[NSMutableSet setWithObject:v7];

    [(NSMutableDictionary *)self->_pendingMessages setObject:v10 forKeyedSubscript:v11];
    id v7 = (id)v10;
  }
}

- (void)_unitTest_waitForSetup
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushDiagnostic, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_consumers, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end