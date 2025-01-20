@interface DRDragMonitorConnection
- (BOOL)_shouldNotifyForSession:(id)a3;
- (DRDragMonitorConnection)initWithQueue:(id)a3 machServiceName:(id)a4 serviceDisplayName:(id)a5 options:(unint64_t)a6;
- (NSString)machServiceName;
- (NSString)serviceDisplayName;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (int)dragMonitorProcessIdentifier;
- (unint64_t)options;
- (void)notifySessionDidEnd:(id)a3;
- (void)notifySessionWillBegin:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setUp;
@end

@implementation DRDragMonitorConnection

- (DRDragMonitorConnection)initWithQueue:(id)a3 machServiceName:(id)a4 serviceDisplayName:(id)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DRDragMonitorConnection;
  v14 = [(DRDragMonitorConnection *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a3);
    v15->_options = a6;
    objc_storeStrong((id *)&v15->_machServiceName, a4);
    objc_storeStrong((id *)&v15->_serviceDisplayName, a5);
  }

  return v15;
}

- (void)setUp
{
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:self->_machServiceName options:0];
  [v3 _setQueue:self->_queue];
  p_connection = &self->_connection;
  objc_storeStrong((id *)&self->_connection, v3);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008E48;
  v10[3] = &unk_100054B58;
  id v5 = v3;
  id v11 = v5;
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v10];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008E50;
  v7[3] = &unk_100054CA8;
  objc_copyWeak(&v8, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v7];
  v6 = _DUIDragSessionLifecycleListeningInterface();
  [(NSXPCConnection *)*p_connection setRemoteObjectInterface:v6];

  [(NSXPCConnection *)*p_connection setExportedInterface:0];
  [(NSXPCConnection *)*p_connection setExportedObject:0];
  [(NSXPCConnection *)*p_connection resume];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldNotifyForSession:(id)a3
{
  id v4 = a3;
  if (([v4 sourceRestrictsDragToSelf] & 1) != 0
    || ([v4 sourceRestrictsDragToLocalDevice] & 1) != 0)
  {
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_9;
  }
  if (([v4 originatedFromPointer] & 1) == 0)
  {
    v6 = DRLogTarget();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      serviceDisplayName = self->_serviceDisplayName;
      int v9 = 138412290;
      v10 = serviceDisplayName;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Not notifying %@ of non-pointer drag", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_8;
  }
  BOOL v5 = 1;
LABEL_9:

  return v5;
}

- (void)notifySessionWillBegin:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(void))a5;
  if ([(DRDragMonitorConnection *)self _shouldNotifyForSession:v7])
  {
    connection = self->_connection;
    if (!connection)
    {
      [(DRDragMonitorConnection *)self setUp];
      connection = self->_connection;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009198;
    v18[3] = &unk_100054CD0;
    v18[4] = self;
    v10 = v8;
    id v19 = v10;
    id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
    id v12 = DRLogTarget();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      serviceDisplayName = self->_serviceDisplayName;
      unsigned int v14 = [v7 identifier];
      *(_DWORD *)buf = 138412546;
      v21 = serviceDisplayName;
      __int16 v22 = 1024;
      unsigned int v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Notifying %@ of new drag session 0x%x", buf, 0x12u);
    }

    id v15 = [v7 identifier];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100009218;
    v16[3] = &unk_100054CF8;
    v16[4] = self;
    objc_super v17 = v10;
    [v11 dragDidBeginWithSession:v7 identifier:v15 reply:v16];
  }
  else
  {
    v8[2](v8);
  }
}

- (void)notifySessionDidEnd:(id)a3
{
  id v4 = a3;
  if ([(DRDragMonitorConnection *)self _shouldNotifyForSession:v4])
  {
    connection = self->_connection;
    if (!connection)
    {
      [(DRDragMonitorConnection *)self setUp];
      connection = self->_connection;
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000093DC;
    v7[3] = &unk_100054D20;
    void v7[4] = self;
    v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
    if ([(DRDragMonitorConnection *)self options]) {
      [v6 dragDidEndWithSession:v4];
    }
    else {
      objc_msgSend(v6, "dragDidEndWithSession:identifier:", v4, objc_msgSend(v4, "identifier"));
    }
  }
}

- (int)dragMonitorProcessIdentifier
{
  return [(NSXPCConnection *)self->_connection processIdentifier];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (NSString)serviceDisplayName
{
  return self->_serviceDisplayName;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceDisplayName, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end