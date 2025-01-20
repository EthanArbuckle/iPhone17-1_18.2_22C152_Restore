@interface PushService
- (PushService)init;
- (void)_handleAccountDidChangeNotification:(id)a3;
- (void)_handleBagChangedNotification:(id)a3;
- (void)handleSandboxAccountDidChangeNotification:(id)a3;
- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4;
- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5;
- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4;
- (void)testFlightConsumer:(id)a3 didChangeStatus:(BOOL)a4;
@end

@implementation PushService

- (PushService)init
{
  v21.receiver = self;
  v21.super_class = (Class)PushService;
  v2 = [(PushService *)&v21 init];
  if (v2)
  {
    uint64_t v3 = sub_1002D97AC("com.apple.appstored.StorePushService", QOS_CLASS_UTILITY);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMapTable strongToWeakObjectsMapTable];
    consumers = v2->_consumers;
    v2->_consumers = (NSMapTable *)v5;

    v7 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    pendingActionTypeCount = v2->_pendingActionTypeCount;
    v2->_pendingActionTypeCount = v7;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = sub_1003F48C0();
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_pendingActionTypeCount, "setObject:forKeyedSubscript:", &off_10054CAF8, *(void *)(*((void *)&v17 + 1) + 8 * (void)v13), (void)v17);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }

    if (os_variant_has_internal_content())
    {
      v14 = (PushDiagnostic *)sub_1002DC7F8([PushDiagnostic alloc], v2);
      pushDiagnostic = v2->_pushDiagnostic;
      v2->_pushDiagnostic = v14;
    }
  }
  return v2;
}

- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4
{
  id v6 = a4;
  v7 = [a3 actionType];
  unsigned int v8 = [v7 isEqualToString:AMSPushActionTypeBadging];

  if (v8)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10035EF54;
    block[3] = &unk_100521388;
    id v11 = v6;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4
{
  id v6 = a3;
  v7 = a4;
  unsigned int v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v9 = v7[1];
  switch(v9)
  {
    case 1:
      id v11 = +[LSApplicationWorkspace defaultWorkspace];
      unsigned int v12 = [v11 applicationIsInstalled:@"com.apple.AppStore"];

      if (!v12) {
        goto LABEL_11;
      }
LABEL_10:
      sub_10035F10C((uint64_t)self, v8, v6);
      goto LABEL_11;
    case 3:
      goto LABEL_10;
    case 2:
      if (self) {
        [(PushServiceTestFlightConsumer *)self->_testFlightConsumer pushConnection:v6 didReceiveRawMessage:v7];
      }
      goto LABEL_11;
  }
LABEL_7:
  id v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    if (v8) {
      uint64_t v13 = v8[1];
    }
    else {
      uint64_t v13 = 0;
    }
    int v14 = 134217984;
    uint64_t v15 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Received message for unknown topic:  %ld", (uint8_t *)&v14, 0xCu);
  }

LABEL_11:
}

- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5
{
  if (a5 == 2) {
    -[PushServiceTestFlightConsumer pushConnection:didReceiveToken:forTopic:](self->_testFlightConsumer, "pushConnection:didReceiveToken:forTopic:", a3, a4);
  }
}

- (void)testFlightConsumer:(id)a3 didChangeStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    CFStringRef v7 = @"disabled";
    if (v4) {
      CFStringRef v7 = @"enabled";
    }
    int v9 = 138543362;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TestFlight push service consumer changed status to: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  sub_100207818((uint64_t)self->_connection, v4);
  connection = self->_connection;
  if (v4) {
    sub_100207E44((uint64_t)connection, 2);
  }
  else {
    sub_100208080((uint64_t)connection, 2);
  }
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035F9B8;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10035FA58;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)handleSandboxAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10035FC44;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testFlightConsumer, 0);
  objc_storeStrong((id *)&self->_pushDiagnostic, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_pendingActionTypeCount, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end