@interface APSTaskListener
- (APSTaskListener)initWithQueue:(id)a3 apsDaemon:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)activeServers;
- (NSXPCInterface)interface;
- (NSXPCListener)taskListener;
- (OS_dispatch_queue)queue;
- (void)_cleanupConnection:(id)a3;
- (void)dealloc;
@end

@implementation APSTaskListener

- (APSTaskListener)initWithQueue:(id)a3 apsDaemon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)APSTaskListener;
  v9 = [(APSTaskListener *)&v20 init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    activeServers = v9->_activeServers;
    v9->_activeServers = v10;

    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v9->_daemon, a4);
    v12 = +[APSLog taskManager];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting APSTaskListener service", v19, 2u);
    }

    id v13 = objc_alloc((Class)NSXPCListener);
    v14 = (NSXPCListener *)[v13 initWithMachServiceName:kAPSTaskClientServiceName];
    taskListener = v9->_taskListener;
    v9->_taskListener = v14;

    [(NSXPCListener *)v9->_taskListener setDelegate:v9];
    [(NSXPCListener *)v9->_taskListener _setQueue:v9->_queue];
    uint64_t v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___APSTaskManagerInterface];
    interface = v9->_interface;
    v9->_interface = (NSXPCInterface *)v16;

    [(NSXPCListener *)v9->_taskListener resume];
  }

  return v9;
}

- (void)dealloc
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSXPCListener *)self->_taskListener setDelegate:0];
  [(NSXPCListener *)self->_taskListener invalidate];
  interface = self->_interface;
  self->_interface = 0;

  activeServers = self->_activeServers;
  self->_activeServers = 0;

  daemon = self->_daemon;
  self->_daemon = 0;

  v6.receiver = self;
  v6.super_class = (Class)APSTaskListener;
  [(APSTaskListener *)&v6 dealloc];
}

- (void)_cleanupConnection:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_activeServers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "connection", (void)v12);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          [(NSMutableArray *)self->_activeServers removeObject:v10];
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForEntitlement:@"com.apple.apsd.nsxpc"];
  unsigned __int8 v9 = [v8 BOOLValue];

  if (v9)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v10 = [[APSTaskServer alloc] initWithConnection:v7 queue:self->_queue apsDaemon:self->_daemon];
    [(NSMutableArray *)self->_activeServers addObject:v10];
    [v7 setExportedInterface:self->_interface];
    [v7 _setQueue:self->_queue];
    objc_initWeak(&location, v7);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006D8DC;
    v14[3] = &unk_10012B898;
    objc_copyWeak(&v15, &location);
    v14[4] = self;
    [v7 setInvalidationHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006D9C4;
    v12[3] = &unk_10012B898;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    [v7 setInterruptionHandler:v12];
    [v7 setExportedObject:v10];
    [v7 resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = +[APSLog taskManager];
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      sub_1000CA6F0(v7, &v10->super);
    }
  }

  return v9;
}

- (NSXPCListener)taskListener
{
  return self->_taskListener;
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)activeServers
{
  return self->_activeServers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_activeServers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_taskListener, 0);
}

@end