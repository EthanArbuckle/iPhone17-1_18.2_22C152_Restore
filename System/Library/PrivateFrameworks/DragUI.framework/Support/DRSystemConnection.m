@interface DRSystemConnection
- (DRSystemConnection)initWithQueue:(id)a3;
- (NSXPCConnection)connection;
- (int)systemProcessIdentifier;
- (void)notifySessionDidEnd:(id)a3;
- (void)notifySessionWillBegin:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation DRSystemConnection

- (DRSystemConnection)initWithQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DRSystemConnection;
  v5 = [(DRSystemConnection *)&v15 init];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.DragUI.druid.system" options:0];
    [v6 _setQueue:v4];
    objc_storeStrong((id *)&v5->_connection, v6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100031E44;
    v13[3] = &unk_100054B58;
    id v7 = v6;
    id v14 = v7;
    [(NSXPCConnection *)v5->_connection setInterruptionHandler:v13];
    objc_initWeak(&location, v5);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100031E4C;
    v10[3] = &unk_100054CA8;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)v5->_connection setInvalidationHandler:v10];
    v8 = _DUINewClientSystemAppInterface();
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_connection setExportedInterface:0];
    [(NSXPCConnection *)v5->_connection setExportedObject:0];
    [(NSXPCConnection *)v5->_connection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)notifySessionWillBegin:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  if (connection)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000320A0;
    v17[3] = &unk_100054D20;
    v17[4] = self;
    id v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
    id v7 = objc_opt_new();
    objc_msgSend(v7, "setSessionIdentifier:", objc_msgSend(v4, "identifier"));
    v8 = [v4 sourceConnection];
    objc_msgSend(v7, "setProcessIdentifier:", objc_msgSend(v8, "processIdentifier"));

    v9 = [v4 sourceConnection];
    v10 = v9;
    if (v9)
    {
      [v9 auditToken];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }
    v14[0] = v15;
    v14[1] = v16;
    [v7 setAuditToken:v14];

    objc_msgSend(v7, "setSupportsSystemDrag:", objc_msgSend(v4, "supportsSystemDrag"));
    id v11 = [v4 persistentSceneIdentifier];
    [v7 setPersistentSceneIdentifier:v11];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100032164;
    v12[3] = &unk_1000564E0;
    id v13 = v4;
    [v6 dragDidBeginWithSystemSession:v13 info:v7 reply:v12];
  }
}

- (void)notifySessionDidEnd:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  if (connection)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100032394;
    v15[3] = &unk_100054D20;
    v15[4] = self;
    id v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
    id v7 = objc_opt_new();
    objc_msgSend(v7, "setSessionIdentifier:", objc_msgSend(v4, "identifier"));
    v8 = [v4 sourceConnection];
    objc_msgSend(v7, "setProcessIdentifier:", objc_msgSend(v8, "processIdentifier"));

    v9 = [v4 sourceConnection];
    v10 = v9;
    if (v9)
    {
      [v9 auditToken];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
    v12[0] = v13;
    v12[1] = v14;
    [v7 setAuditToken:v12];

    objc_msgSend(v7, "setSupportsSystemDrag:", objc_msgSend(v4, "supportsSystemDrag"));
    id v11 = [v4 persistentSceneIdentifier];
    [v7 setPersistentSceneIdentifier:v11];

    [v6 dragDidEndWithSystemSession:v7];
  }
}

- (int)systemProcessIdentifier
{
  return [(NSXPCConnection *)self->_connection processIdentifier];
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
}

@end