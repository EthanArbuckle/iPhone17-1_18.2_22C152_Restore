@interface ADClientLiteListener
- (ADClientLiteListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_decrementAndTestExecutionCount;
- (void)_doDelayedClientWorkIfAny:(id)a3;
- (void)_incrementAndTestExecutionCount;
- (void)doClientWork:(id)a3 withTimeoutBlock:(id)a4;
- (void)doDelayedClientWorkIfAny;
- (void)listen;
@end

@implementation ADClientLiteListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workItemQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_decrementAndTestExecutionCount
{
  int64_t v2 = self->_executionCount - 1;
  self->_executionCount = v2;
  if (v2)
  {
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      v5 = "-[ADClientLiteListener _decrementAndTestExecutionCount]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Unexpected execution count. File radar.", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_incrementAndTestExecutionCount
{
  int64_t executionCount = self->_executionCount;
  self->_int64_t executionCount = executionCount + 1;
  if (executionCount >= 1)
  {
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      v5 = "-[ADClientLiteListener _incrementAndTestExecutionCount]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Unexpected execution count. File radar.", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_doDelayedClientWorkIfAny:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100158C64;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async((dispatch_queue_t)a3, block);
}

- (void)doDelayedClientWorkIfAny
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[ADClientLiteListener doDelayedClientWorkIfAny]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADClientLiteListener *)self _doDelayedClientWorkIfAny:self->_queue];
}

- (void)doClientWork:(id)a3 withTimeoutBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADClientLiteListener doClientWork:withTimeoutBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100158FC8;
  block[3] = &unk_10050C688;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = queue;
  dispatch_async(v12, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = AFClientLiteEntitlement;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    v8 = AFClientLiteClientObjectInterface();
    [v5 setRemoteObjectInterface:v8];

    v9 = AFClientLiteRemoteObjectInterface();
    [v5 setExportedInterface:v9];

    id v10 = [[ADClientLite alloc] initWithListener:self connection:v5];
    [v5 setExportedObject:v10];

    [v5 resume];
  }
  else
  {
    id v11 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      int v14 = 136315650;
      id v15 = "-[ADClientLiteListener listener:shouldAcceptNewConnection:]";
      __int16 v16 = 1026;
      unsigned int v17 = [v5 processIdentifier];
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Client with pid %{public}d does not have entitlement %@", (uint8_t *)&v14, 0x1Cu);
    }
  }

  return HasEntitlement;
}

- (void)listen
{
}

- (ADClientLiteListener)init
{
  v12.receiver = self;
  v12.super_class = (Class)ADClientLiteListener;
  int64_t v2 = [(ADClientLiteListener *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSXPCListener);
    int v4 = (NSXPCListener *)[v3 initWithMachServiceName:AFClientLiteServiceName];
    listener = v2->_listener;
    v2->_listener = v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(0, v6);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (AFQueue *)objc_alloc_init((Class)AFQueue);
    workItemQueue = v2->_workItemQueue;
    v2->_workItemQueue = v9;

    v2->_int64_t executionCount = 0;
  }
  return v2;
}

@end