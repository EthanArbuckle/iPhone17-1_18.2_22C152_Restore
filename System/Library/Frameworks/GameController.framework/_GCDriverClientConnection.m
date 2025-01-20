@interface _GCDriverClientConnection
- (_GCDriverClientConnection)initWithConnection:(id)a3 fromProcess:(id)a4;
- (_GCDriverServerInterface)exportedObject;
- (id)connectToDeviceService:(id)a3 withClient:(id)a4;
- (void)connectToDeviceService:(id)a3 withClient:(id)a4 reply:(id)a5;
- (void)setExportedObject:(id)a3;
@end

@implementation _GCDriverClientConnection

- (_GCDriverClientConnection)initWithConnection:(id)a3 fromProcess:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GCDriverClientConnection;
  v7 = [(_GCIPCRemoteIncomingConnection *)&v11 initWithConnection:v6 fromProcess:a4];
  if (v7)
  {
    v8 = GCDriverServerInterface();
    [v6 setExportedInterface:v8];

    v9 = GCDriverClientInterface();
    [v6 setRemoteObjectInterface:v9];
  }
  return v7;
}

- (_GCDriverServerInterface)exportedObject
{
  v2 = [(GCIPCRemoteConnection *)self connection];
  v3 = [v2 exportedObject];

  return (_GCDriverServerInterface *)v3;
}

- (void)setExportedObject:(id)a3
{
  id v4 = a3;
  id v5 = [(GCIPCRemoteConnection *)self connection];
  [v5 setExportedObject:v4];
}

- (void)connectToDeviceService:(id)a3 withClient:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(GCIPCRemoteIncomingConnection *)self remoteProxy];
  ConnectToDriverService(v10, v11, v9, v8);
}

- (id)connectToDeviceService:(id)a3 withClient:(id)a4
{
  id v6 = (Protocol *)a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)&off_26D2C1C20) initOnQueue:0 withOptions:0];
  id v9 = NSStringFromProtocol(v6);
  id v10 = +[NSString stringWithFormat:@"Connect to '%@'.", v9];
  [v8 setLabel:v10];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke;
  v20[3] = &unk_26D22B9C8;
  v20[4] = self;
  id v11 = v6;
  v21 = v11;
  id v12 = v7;
  id v22 = v12;
  [v8 setSyncBlock:v20];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_3;
  v17[3] = &unk_26D22BA40;
  v17[4] = self;
  v18 = v11;
  id v19 = v12;
  id v13 = v12;
  v14 = v11;
  [v8 setAsyncBlock:v17];
  v15 = [v8 activate];

  return v15;
}

@end