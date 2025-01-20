@interface BLNotificationServiceProxy
- (BLNotificationServiceProxy)init;
- (NSXPCConnection)connection;
- (void)addStoreIDtoWantToReadList:(id)a3 withCompletion:(id)a4;
@end

@implementation BLNotificationServiceProxy

- (BLNotificationServiceProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)BLNotificationServiceProxy;
  v2 = [(BLNotificationServiceProxy *)&v7 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.iBooks.BookDataStoreService" options:0];
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BLNotificationServiceProtocol];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&stru_1001A2358];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&stru_1001A2378];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)addStoreIDtoWantToReadList:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(BLNotificationServiceProxy *)self connection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000414E8;
  v11[3] = &unk_1001A15D0;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 addStoreIDtoWantToReadList:v7 withCompletion:v9];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end