@interface MSCRODBrailleConnectionHelper
+ (id)sharedHelper;
- (MSCRODBrailleConnectionHelper)init;
- (void)_processDeviceReconnectQueue;
- (void)handleBluetoothConnectionEventForQueue:(id)a3;
- (void)handleBluetoothConnectionEventForQueue:(id)a3 forceProcess:(BOOL)a4;
- (void)queueDeviceConnection:(id)a3 withCallback:(id)a4;
@end

@implementation MSCRODBrailleConnectionHelper

+ (id)sharedHelper
{
  if (qword_100019C18 != -1) {
    dispatch_once(&qword_100019C18, &stru_1000146A8);
  }
  v2 = (void *)qword_100019C10;

  return v2;
}

- (MSCRODBrailleConnectionHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSCRODBrailleConnectionHelper;
  v2 = [(MSCRODBrailleConnectionHelper *)&v10 init];
  uint64_t v3 = +[NSMutableArray array];
  reconnectDeviceQueue = v2->_reconnectDeviceQueue;
  v2->_reconnectDeviceQueue = (NSMutableArray *)v3;

  uint64_t v5 = +[NSMutableDictionary dictionary];
  reconnectDeviceCallbacks = v2->_reconnectDeviceCallbacks;
  v2->_reconnectDeviceCallbacks = (NSMutableDictionary *)v5;

  dispatch_queue_t v7 = dispatch_queue_create("global-braille-reconnect-queue", 0);
  reconnectQueue = v2->_reconnectQueue;
  v2->_reconnectQueue = (OS_dispatch_queue *)v7;

  v2->_waitingForCallback = 0;
  return v2;
}

- (void)_processDeviceReconnectQueue
{
  if (!self->_waitingForCallback)
  {
LABEL_6:
    v4 = [(NSMutableArray *)self->_reconnectDeviceQueue firstObject];
    if (v4)
    {
      v6 = AXLogBrailleHW();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ATTEMPT BT CONNECT: %@", buf, 0xCu);
      }

      self->_waitingForCallback = 1;
      self->_lastBTConnectTime = CFAbsoluteTimeGetCurrent();
      [v4 device];
      uint64_t v7 = BTDeviceConnectServices();
      v8 = AXLogBrailleHW();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = +[NSNumber numberWithInt:v7];
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received connect result: %@", buf, 0xCu);
      }
      reconnectDeviceCallbacks = self->_reconnectDeviceCallbacks;
      v11 = [v4 address];
      v12 = [(NSMutableDictionary *)reconnectDeviceCallbacks objectForKey:v11];

      if (v12)
      {
        id v13 = v12;
        AXPerformBlockAsynchronouslyOnMainThread();
      }
    }
    goto LABEL_16;
  }
  CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - self->_lastBTConnectTime;
  v4 = AXLogBrailleHW();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 > 30.0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Waited 30 seconds for BT callback, which never came...", buf, 2u);
    }

    self->_waitingForCallback = 0;
    goto LABEL_6;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Still waiting for BT callback", buf, 2u);
  }
LABEL_16:
}

- (void)handleBluetoothConnectionEventForQueue:(id)a3
{
}

- (void)handleBluetoothConnectionEventForQueue:(id)a3 forceProcess:(BOOL)a4
{
  id v6 = a3;
  reconnectQueue = self->_reconnectQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001C18;
  block[3] = &unk_100014720;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)reconnectQueue, block);
}

- (void)queueDeviceConnection:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = AXLogBrailleHW();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Queuing connect BT device: %@", buf, 0xCu);
    }

    reconnectQueue = self->_reconnectQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002018;
    block[3] = &unk_100014748;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)reconnectQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconnectQueue, 0);
  objc_storeStrong((id *)&self->_reconnectDeviceCallbacks, 0);

  objc_storeStrong((id *)&self->_reconnectDeviceQueue, 0);
}

@end