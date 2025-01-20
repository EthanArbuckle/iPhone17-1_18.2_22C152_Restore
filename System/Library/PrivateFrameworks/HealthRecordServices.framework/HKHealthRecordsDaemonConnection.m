@interface HKHealthRecordsDaemonConnection
+ (id)sharedConnection;
- (HKHealthRecordsDaemonConnection)init;
- (HKHealthRecordsDaemonConnection)initWithListenerEndpoint:(id)a3;
- (NSString)daemonLaunchDarwinNotificationName;
- (OS_dispatch_queue)clientQueue;
- (id)endpointForServiceIdentifier:(id)a3 error:(id *)a4;
- (id)exportedInterface;
- (void)dealloc;
- (void)fetchEndpointForServiceIdentifier:(id)a3 endpointHandler:(id)a4 errorHandler:(id)a5;
@end

@implementation HKHealthRecordsDaemonConnection

+ (id)sharedConnection
{
  os_unfair_lock_lock((os_unfair_lock_t)&sharedConnection_lock);
  WeakRetained = (HKHealthRecordsDaemonConnection *)objc_loadWeakRetained(&sharedConnection_sharedConnection);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(HKHealthRecordsDaemonConnection);
    objc_storeWeak(&sharedConnection_sharedConnection, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedConnection_lock);

  return WeakRetained;
}

- (HKHealthRecordsDaemonConnection)init
{
  return [(HKHealthRecordsDaemonConnection *)self initWithListenerEndpoint:0];
}

- (HKHealthRecordsDaemonConnection)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKHealthRecordsDaemonConnection;
  v5 = [(HKHealthRecordsDaemonConnection *)&v12 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v6;

    id v8 = objc_alloc(MEMORY[0x263F0AA40]);
    if (v4) {
      uint64_t v9 = [v8 initWithListenerEndpoint:v4];
    }
    else {
      uint64_t v9 = [v8 initWithMachServiceName:@"com.apple.healthrecordsd" options:4096];
    }
    connection = v5->_connection;
    v5->_connection = (_HKXPCConnection *)v9;

    [(_HKXPCConnection *)v5->_connection setExportedObject:v5];
    [(_HKXPCConnection *)v5->_connection resume];
  }

  return v5;
}

- (void)dealloc
{
  [(_HKXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HKHealthRecordsDaemonConnection;
  [(HKHealthRecordsDaemonConnection *)&v3 dealloc];
}

- (void)fetchEndpointForServiceIdentifier:(id)a3 endpointHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  connection = self->_connection;
  id v11 = a3;
  objc_super v12 = [(_HKXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__HKHealthRecordsDaemonConnection_fetchEndpointForServiceIdentifier_endpointHandler_errorHandler___block_invoke;
  v15[3] = &unk_2645EE4F0;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend(v12, "remote_fetchEndpointForServiceIdentifier:completion:", v11, v15);
}

uint64_t __98__HKHealthRecordsDaemonConnection_fetchEndpointForServiceIdentifier_endpointHandler_errorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)endpointForServiceIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke;
  v14[3] = &unk_2645EE518;
  v14[4] = &v15;
  id v8 = [(_HKXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke_2;
  v13[3] = &unk_2645EE540;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v8, "remote_fetchEndpointForServiceIdentifier:completion:", v6, v13);
  id v9 = (id)v16[5];
  v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v11 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v11;
}

void __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  *id v6 = v8;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSString)daemonLaunchDarwinNotificationName
{
  return (NSString *)@"com.apple.healthrecordsd.launch";
}

- (id)exportedInterface
{
  id v2 = objc_alloc_init(MEMORY[0x263F08D80]);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end