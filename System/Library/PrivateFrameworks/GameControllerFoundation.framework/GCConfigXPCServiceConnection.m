@interface GCConfigXPCServiceConnection
- (GCConfigXPCServiceClientInterface)client;
- (GCConfigXPCServiceConnection)init;
- (id)connectToService:(id)a3 withClient:(id)a4;
- (void)setClient:(id)a3;
@end

@implementation GCConfigXPCServiceConnection

- (GCConfigXPCServiceConnection)init
{
  v3 = (void *)[objc_alloc((Class)&off_26BEEFFA8) initWithServiceName:@"com.apple.gamecontroller.ConfigService"];
  v4 = GCConfigXPCServiceClientInterface();
  [v3 setExportedInterface:v4];

  v5 = GCConfigXPCServiceInterface();
  [v3 setRemoteObjectInterface:v5];

  v8.receiver = self;
  v8.super_class = (Class)GCConfigXPCServiceConnection;
  v6 = [(GCIPCRemoteOutgoingConnection *)&v8 initWithConnection:v3];

  return v6;
}

- (GCConfigXPCServiceClientInterface)client
{
  v2 = [(GCIPCRemoteConnection *)self connection];
  v3 = [v2 exportedObject];

  return (GCConfigXPCServiceClientInterface *)v3;
}

- (void)setClient:(id)a3
{
  id v4 = a3;
  id v5 = [(GCIPCRemoteConnection *)self connection];
  [v5 setExportedObject:v4];
}

- (id)connectToService:(id)a3 withClient:(id)a4
{
  v6 = (Protocol *)a3;
  id v7 = a4;
  id v8 = [[GCOperation alloc] initOnQueue:0 withOptions:0];
  v9 = NSStringFromProtocol(v6);
  v10 = +[NSString stringWithFormat:@"Connect to '%@'.", v9];
  [v8 setLabel:v10];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke;
  v20[3] = &unk_26BEC4C28;
  v20[4] = self;
  v11 = v6;
  v21 = v11;
  id v12 = v7;
  id v22 = v12;
  [v8 setSyncBlock:v20];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_3;
  v17[3] = &unk_26BEC4C50;
  v17[4] = self;
  v18 = v11;
  id v19 = v12;
  id v13 = v12;
  v14 = v11;
  [v8 setAsyncBlock:v17];
  v15 = [v8 activate];

  return v15;
}

id __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  id v5 = (void *)a1[4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_12;
  v12[3] = &unk_26BEC42E0;
  v12[4] = &v13;
  v6 = [v5 synchronousRemoteProxyWithErrorHandler:v12];
  id v7 = (void *)a1[5];
  id v8 = (void *)a1[6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_2;
  v11[3] = &unk_26BEC4308;
  v11[4] = &v19;
  v11[5] = &v13;
  ConnectToDriverService(v7, v6, v8, v11);
  *a3 = (id) v14[5];
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_12(uint64_t a1, void *a2)
{
}

void __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_4;
  v12[3] = &unk_26BEC4358;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 remoteProxyWithErrorHandler:v12];
  id v8 = (void *)a1[5];
  uint64_t v7 = (void *)a1[6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_5;
  v10[3] = &unk_26BEC4380;
  id v11 = v5;
  id v9 = v5;
  ConnectToDriverService(v8, v6, v7, v10);
}

uint64_t __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failWithError:a2];
}

uint64_t __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 succeedWithResult:a2];
  }
  else {
    return objc_msgSend(v2, "failWithError:");
  }
}

@end