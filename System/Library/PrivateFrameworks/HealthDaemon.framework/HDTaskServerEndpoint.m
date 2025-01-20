@interface HDTaskServerEndpoint
- (Class)taskServerClass;
- (HDProfile)profile;
- (HDTaskServer)taskServer;
- (HDTaskServerDelegate)taskServerDelegate;
- (HDTaskServerEndpoint)initWithTaskServerClass:(Class)a3 taskConfiguration:(id)a4 healthStoreConfiguration:(id)a5 taskUUID:(id)a6 instanceUUID:(id)a7 profile:(id)a8 databaseAccessibilityAssertions:(id)a9 connectionQueue:(id)a10;
- (HDTaskServerEndpointDelegate)delegate;
- (HKHealthStoreConfiguration)healthStoreConfiguration;
- (HKTaskConfiguration)taskConfiguration;
- (NSUUID)instanceUUID;
- (NSUUID)taskUUID;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)databaseAccessibilityAssertions;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
- (void)connectionConfiguredForListener:(id)a3 client:(id)a4 exportedObject:(id)a5;
- (void)connectionInvalidatedForListener:(id)a3 client:(id)a4 exportedObject:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setTaskServerDelegate:(id)a3;
@end

@implementation HDTaskServerEndpoint

- (HDTaskServerEndpoint)initWithTaskServerClass:(Class)a3 taskConfiguration:(id)a4 healthStoreConfiguration:(id)a5 taskUUID:(id)a6 instanceUUID:(id)a7 profile:(id)a8 databaseAccessibilityAssertions:(id)a9 connectionQueue:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id obj = a8;
  id v20 = a9;
  id v21 = a10;
  v44.receiver = self;
  v44.super_class = (Class)HDTaskServerEndpoint;
  v22 = [(HDTaskServerEndpoint *)&v44 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_taskServerClass, a3);
    uint64_t v24 = [v18 copy];
    taskUUID = v23->_taskUUID;
    v23->_taskUUID = (NSUUID *)v24;

    uint64_t v26 = [v19 copy];
    instanceUUID = v23->_instanceUUID;
    v23->_instanceUUID = (NSUUID *)v26;

    uint64_t v28 = [v16 copy];
    taskConfiguration = v23->_taskConfiguration;
    v23->_taskConfiguration = (HKTaskConfiguration *)v28;

    uint64_t v30 = [v17 copy];
    healthStoreConfiguration = v23->_healthStoreConfiguration;
    v23->_healthStoreConfiguration = (HKHealthStoreConfiguration *)v30;

    id v42 = v18;
    id v32 = v16;
    objc_storeWeak((id *)&v23->_profile, obj);
    objc_storeWeak((id *)&v23->_databaseAccessibilityAssertions, v20);
    id WeakRetained = objc_loadWeakRetained((id *)&v23->_profile);
    v34 = [WeakRetained daemon];
    [v34 connectionManager];
    id v35 = v19;
    v37 = id v36 = v17;
    v38 = NSStringFromClass(a3);
    uint64_t v39 = [v37 createAnonymousListenerWithLabel:v38];
    listener = v23->_listener;
    v23->_listener = (HDXPCListener *)v39;

    id v17 = v36;
    id v19 = v35;

    id v16 = v32;
    id v18 = v42;
    [(HDXPCListener *)v23->_listener setConnectionQueue:v21];
    [(HDXPCListener *)v23->_listener setDelegate:v23];
  }

  return v23;
}

- (void)dealloc
{
  [(HDTaskServerEndpoint *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDTaskServerEndpoint;
  [(HDTaskServerEndpoint *)&v3 dealloc];
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return (NSXPCListenerEndpoint *)[(HDXPCListener *)self->_listener endpoint];
}

- (void)resume
{
}

- (void)invalidate
{
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [(HDTaskServerEndpoint *)self delegate];
  v9 = [(HDTaskServerEndpoint *)self taskServerDelegate];
  v10 = [HDHealthStoreClient alloc];
  healthStoreConfiguration = self->_healthStoreConfiguration;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v13 = objc_loadWeakRetained((id *)&self->_databaseAccessibilityAssertions);
  v14 = [(HDHealthStoreClient *)v10 initWithXPCClient:v7 configuration:healthStoreConfiguration profile:WeakRetained databaseAccessibilityAssertions:v13];

  char v15 = objc_opt_respondsToSelector();
  Class taskServerClass = self->_taskServerClass;
  if ((v15 & 1) == 0)
  {
    if (([(objc_class *)taskServerClass instancesRespondToSelector:sel_initWithUUID_configuration_client_delegate_] & 1) == 0)goto LABEL_10; {
    uint64_t v22 = [objc_alloc(self->_taskServerClass) initWithUUID:self->_taskUUID configuration:self->_taskConfiguration client:v14 delegate:v9];
    }
    if (!v22) {
      goto LABEL_10;
    }
    id v19 = (void *)v22;
    id v21 = 0;
LABEL_9:
    objc_storeWeak((id *)&self->_taskServer, v19);
    goto LABEL_17;
  }
  taskUUID = self->_taskUUID;
  taskConfiguration = self->_taskConfiguration;
  id v29 = 0;
  id v19 = [(objc_class *)taskServerClass createTaskServerWithUUID:taskUUID configuration:taskConfiguration client:v14 delegate:v9 error:&v29];
  id v20 = v29;
  id v21 = v20;
  if (v19) {
    goto LABEL_9;
  }
  if (!v20)
  {
LABEL_10:
    v23 = (void *)MEMORY[0x1E4F28C58];
    Class v24 = self->_taskServerClass;
    v25 = [(NSUUID *)self->_taskUUID UUIDString];
    objc_msgSend(v23, "hk_error:format:", 124, @"Failed to create %@ task server (%@)", v24, v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = v26;
      if (a5) {
        *a5 = v26;
      }
      else {
        _HKLogDroppedError();
      }
    }
    id v21 = 0;
    goto LABEL_16;
  }
  if (a5)
  {
    id v21 = v20;
    *a5 = v21;
  }
  else
  {
    _HKLogDroppedError();
  }
LABEL_16:
  [v8 taskServerDidFailToInitializeForUUID:self->_taskUUID];
  id v19 = 0;
LABEL_17:

  return v19;
}

- (void)connectionConfiguredForListener:(id)a3 client:(id)a4 exportedObject:(id)a5
{
  id v6 = a5;
  id v7 = [(HDTaskServerEndpoint *)self profile];
  v8 = [(HDTaskServerEndpoint *)self delegate];
  id v12 = v6;
  v9 = [v7 daemon];
  v10 = [v9 taskServerRegistry];
  [v10 didCreateTaskServer:v12];

  [v8 taskServerDidFinishInitialization:v12];
  v11 = [v7 daemon];
  objc_msgSend(v11, "unitTest_taskServerDidInit:", v12);
}

- (void)connectionInvalidatedForListener:(id)a3 client:(id)a4 exportedObject:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [(HDTaskServerEndpoint *)self profile];
  v8 = [(HDTaskServerEndpoint *)self delegate];
  id v9 = v6;
  [v8 taskServerDidInvalidate:v9];
  v10 = [v7 daemon];
  v11 = [v10 taskServerRegistry];
  [v11 taskServerDidInvalidate:v9];

  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  taskUUID = self->_taskUUID;
  char v15 = @"HDTaskServerUUIDKey";
  v16[0] = taskUUID;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v12 postNotificationName:@"HDTaskServerDidInvalidateNotification" object:0 userInfo:v14];
}

- (Class)taskServerClass
{
  return self->_taskServerClass;
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (NSUUID)instanceUUID
{
  return self->_instanceUUID;
}

- (HKTaskConfiguration)taskConfiguration
{
  return self->_taskConfiguration;
}

- (HKHealthStoreConfiguration)healthStoreConfiguration
{
  return self->_healthStoreConfiguration;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)databaseAccessibilityAssertions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseAccessibilityAssertions);

  return (_TtC12HealthDaemon29HDHealthStoreClientAssertions *)WeakRetained;
}

- (HDTaskServer)taskServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);

  return (HDTaskServer *)WeakRetained;
}

- (HDTaskServerEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDTaskServerEndpointDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HDTaskServerDelegate)taskServerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskServerDelegate);

  return (HDTaskServerDelegate *)WeakRetained;
}

- (void)setTaskServerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_taskServerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_taskServer);
  objc_destroyWeak((id *)&self->_databaseAccessibilityAssertions);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStoreConfiguration, 0);
  objc_storeStrong((id *)&self->_taskConfiguration, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);

  objc_storeStrong((id *)&self->_taskServerClass, 0);
}

@end