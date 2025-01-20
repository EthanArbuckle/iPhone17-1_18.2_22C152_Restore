@interface CPLPhotosDaemonConnection
- (CPLPhotosDaemonConnection)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)managementServiceWithError:(id *)a3;
- (id)proxyWithErrorHandler:(id)a3;
- (void)close;
- (void)dealloc;
@end

@implementation CPLPhotosDaemonConnection

- (CPLPhotosDaemonConnection)init
{
  v13.receiver = self;
  v13.super_class = (Class)CPLPhotosDaemonConnection;
  v2 = [(CPLPhotosDaemonConnection *)&v13 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.photos.service" options:0];
    v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLPhotosDaemonProtocol];
    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PLAssetsdLibraryManagementServiceProtocol];
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    [v5 setClasses:v7 forSelector:"findPhotoLibraryIdentifiersMatchingSearchCriteria:reply:" argumentIndex:0 ofReply:1];

    [v4 setInterface:v5 forSelector:"getLibraryManagementServiceWithReply:" argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v3 setRemoteObjectInterface:v4];

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cpl.daemon.connection", 0);
    [(NSXPCConnection *)v3 _setQueue:v8];

    connection = v2->_connection;
    v2->_connection = v3;

    uint64_t v10 = [(NSXPCConnection *)v2->_connection _queue];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CPLPhotosDaemonConnection;
  [(CPLPhotosDaemonConnection *)&v3 dealloc];
}

- (void)close
{
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  if (!connection) {
    sub_100020134((uint64_t)self, (uint64_t)a2);
  }
  v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];

  return v7;
}

- (id)managementServiceWithError:(id *)a3
{
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100006174;
  v38 = sub_100006184;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100006174;
  v32 = sub_100006184;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000618C;
  v22[3] = &unk_100034B08;
  v24 = v26;
  v25 = &v34;
  id v5 = dispatch_semaphore_create(0);
  v23 = v5;
  uint64_t v6 = [(CPLPhotosDaemonConnection *)self proxyWithErrorHandler:v22];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006210;
  v17[3] = &unk_100034B30;
  v19 = v26;
  v20 = &v28;
  v21 = &v34;
  v7 = v5;
  v18 = v7;
  [v6 getLibraryManagementServiceWithReply:v17];
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000062C0;
    v13[3] = &unk_100034B58;
    v15 = v26;
    v16 = &v34;
    v14 = v7;
    dispatch_sync((dispatch_queue_t)queue, v13);
  }
  uint64_t v10 = (void *)v29[5];
  if (a3 && !v10)
  {
    *a3 = (id) v35[5];
    uint64_t v10 = (void *)v29[5];
  }
  id v11 = v10;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end