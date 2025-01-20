@interface _CDUserContextServerClient
+ (id)clientInterface;
+ (id)clientOfService:(id)a3 withConnection:(id)a4 andContext:(id)a5;
+ (id)serverInterface;
- (BOOL)_shouldUpdateWebUsageForCurrentUser;
- (BOOL)isMDCSNeededForKeyPath:(id)a3;
- (BOOL)isMDCSNeededForKeyPathInKeyPaths:(id)a3;
- (NSMutableDictionary)devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
- (NSMutableSet)nonWakingRegistration;
- (NSMutableSet)wakingRegistrations;
- (NSXPCConnection)clientConnection;
- (OS_dispatch_queue)activateMonitorQueue;
- (OS_dispatch_queue)queue;
- (_CDInMemoryUserContext)userContext;
- (_CDUserContextService)service;
- (id)deviceIDsForDeviceTypes:(unint64_t)a3;
- (id)deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:(id)a3;
- (id)initForService:(id)a3 withConnection:(id)a4 andContext:(id)a5;
- (id)keyPathsSortedByDeviceID:(id)a3;
- (id)remoteDeviceIDs;
- (id)remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:(id)a3;
- (id)remoteDevices;
- (id)remoteDevicesForRemoteUserContextProxySourceDeviceUUID:(id)a3;
- (id)remoteUserContextProxySourceDeviceUUIDByDeviceID;
- (id)remoteUserContextProxySourceDeviceUUIDForKeyPath:(id)a3;
- (void)_hasKnowledgeOfPath:(id)a3 handler:(id)a4;
- (void)_propertiesOfPath:(id)a3 handler:(id)a4;
- (void)_propertiesOfRemotePath:(id)a3 handler:(id)a4;
- (void)_valueForPath:(id)a3 handler:(id)a4;
- (void)_valueForRemotePath:(id)a3 handler:(id)a4;
- (void)_valuesForPaths:(id)a3 handler:(id)a4;
- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4;
- (void)addObjects:(id)a3 andRemoveObjects:(id)a4 forArrayAtPath:(id)a5 handler:(id)a6;
- (void)addObjects:(id)a3 toArrayAtPath:(id)a4 handler:(id)a5;
- (void)deactivateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4;
- (void)dealloc;
- (void)deregisterAllCallbacks:(BOOL)a3;
- (void)deregisterCallback:(id)a3;
- (void)evaluatePredicate:(id)a3 handler:(id)a4;
- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4;
- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4 handler:(id)a5;
- (void)handlePreviouslyFiredRegistration:(id)a3 info:(id)a4;
- (void)hasKnowledgeOfPath:(id)a3 handler:(id)a4;
- (void)performRegistrationCallbackWithRegistration:(id)a3 info:(id)a4;
- (void)propertiesOfPath:(id)a3 handler:(id)a4;
- (void)propertiesOfRemotePath:(id)a3 handler:(id)a4;
- (void)proxyTokenDidUpdate;
- (void)registerCallback:(id)a3;
- (void)removeObjects:(id)a3 fromArrayAtPath:(id)a4 handler:(id)a5;
- (void)removeObjectsMatchingPredicate:(id)a3 fromArrayAtPath:(id)a4 handler:(id)a5;
- (void)setActivateMonitorQueue:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setDevicesToActivateByRemoteUserContextProxySourceDeviceUUID:(id)a3;
- (void)setNonWakingRegistration:(id)a3;
- (void)setObject:(id)a3 forPath:(id)a4 handler:(id)a5;
- (void)setObject:(id)a3 lastModifiedDate:(id)a4 forContextualKeyPath:(id)a5 handler:(id)a6;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setUserContext:(id)a3;
- (void)setWakingRegistrations:(id)a3;
- (void)subscribeToContextValueNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4;
- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3;
- (void)unsubscribeFromContextValueNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4;
- (void)valuesForPaths:(id)a3 handler:(id)a4;
- (void)valuesForPaths:(id)a3 inContextsMatching:(id)a4 handler:(id)a5;
@end

@implementation _CDUserContextServerClient

- (void)performRegistrationCallbackWithRegistration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke;
  block[3] = &unk_1E56091B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (BOOL)isMDCSNeededForKeyPath:(id)a3
{
  id v3 = a3;
  if (+[_CDContextQueries isMDCSKeyPath:v3])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = +[_CDDevice localDevice];
    id v6 = [v5 deviceID];
    id v7 = [v3 deviceID];
    int v4 = [v6 isEqualToString:v7] ^ 1;
  }
  return v4;
}

- (void)propertiesOfPath:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_CDUserContextService *)self->_service remoteDevicesHaveBeenActivated]
    || ![(_CDUserContextServerClient *)self isMDCSNeededForKeyPath:v6])
  {
    [(_CDUserContextServerClient *)self _propertiesOfPath:v6 handler:v7];
  }
  else
  {
    v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_18EC9B000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55___CDUserContextServerClient_propertiesOfPath_handler___block_invoke;
    v10[3] = &unk_1E5609B50;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(_CDUserContextService *)service requestActivateDevicesFromAllSubscribersWithHandler:v10];
  }
}

- (void)_propertiesOfPath:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___CDUserContextServerClient__propertiesOfPath_handler___block_invoke;
  v8[3] = &unk_1E5609B78;
  id v9 = v6;
  id v7 = v6;
  [(_CDUserContextServerClient *)self _valueForPath:a3 handler:v8];
}

- (void)_valueForPath:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activateMonitorQueue = self->_activateMonitorQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52___CDUserContextServerClient__valueForPath_handler___block_invoke;
  v15[3] = &unk_1E5609B50;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v9 = v15;
  id v10 = activateMonitorQueue;
  id v11 = v7;
  id v12 = v6;
  id v13 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E56095F0;
  id v20 = v13;
  id v21 = v9;
  id v14 = v13;
  dispatch_async(v10, block);
}

- (void)deregisterCallback:(id)a3
{
  id v4 = a3;
  if ([v4 isMultiDeviceRegistration]) {
    int v5 = ![(_CDInMemoryUserContext *)self->_userContext hasMultiDeviceRegistrations];
  }
  else {
    int v5 = 1;
  }
  int v6 = [v4 mustWake];
  uint64_t v7 = 56;
  if (v6) {
    uint64_t v7 = 48;
  }
  id v8 = *(id *)((char *)&self->super.isa + v7);
  objc_sync_enter(v8);
  [v8 removeObject:v4];
  id v9 = [(_CDUserContextService *)self->_service persistence];
  [v9 deleteRegistration:v4];

  [(_CDInMemoryUserContext *)self->_userContext deregisterCallback:v4];
  objc_sync_exit(v8);

  if ([v4 isMultiDeviceRegistration])
  {
    id v10 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_CDUserContextServerClient deregisterCallback:]();
    }

    if (((v5 | [(_CDInMemoryUserContext *)self->_userContext hasMultiDeviceRegistrations]) & 1) == 0)
    {
      [(_CDUserContextServerClient *)self subscribeToDeviceStatusChangeNotificationsForDeviceTypes:0];
      id v11 = -[_CDUserContextServerClient deviceIDsForDeviceTypes:](self, "deviceIDsForDeviceTypes:", [v4 deviceTypes]);
      if ([v11 count]) {
        [(_CDUserContextServerClient *)self unsubscribeFromContextValueNotificationsWithRegistration:v4 deviceIDs:v11];
      }
    }
  }
}

- (void)addObjects:(id)a3 andRemoveObjects:(id)a4 forArrayAtPath:(id)a5 handler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, BOOL))a6;
  id v14 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = _CDRedactedObjectForKeyPath(v12, v10);
    id v16 = _CDRedactedObjectForKeyPath(v12, v11);
    int v23 = 138412802;
    id v24 = v12;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_18EC9B000, v14, OS_LOG_TYPE_DEFAULT, "CDUserContext: %@ => ADD %@, REMOVE %@", (uint8_t *)&v23, 0x20u);
  }
  v17 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
  int v18 = [v12 isEqual:v17];
  if (v10 && v18)
  {
    BOOL v19 = [(_CDUserContextServerClient *)self _shouldUpdateWebUsageForCurrentUser];

    if (!v19) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  LOBYTE(v23) = 0;
  id v20 = [(_CDInMemoryUserContext *)self->_userContext addObjects:v10 andRemoveObjects:v11 fromArrayAtKeyPath:v12 valueDidChange:&v23];
  if ((_BYTE)v23)
  {
    id v21 = [(_CDUserContextService *)self->_service persistence];
    [v21 saveValue:v20 forKeyPath:v12];

    BOOL v22 = (_BYTE)v23 != 0;
  }
  else
  {
    BOOL v22 = 0;
  }
  v13[2](v13, v22);

LABEL_12:
}

- (void)setObject:(id)a3 forPath:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL))a5;
  id v11 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextServerClient setObject:forPath:handler:](v9, v8);
  }

  id v12 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
  if ([v9 isEqual:v12])
  {
    BOOL v13 = [(_CDUserContextServerClient *)self _shouldUpdateWebUsageForCurrentUser];

    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v14 = [(_CDInMemoryUserContext *)self->_userContext setObject:v8 returningMetadataForContextualKeyPath:v9];
  if (v14)
  {
    uint64_t v15 = [(_CDUserContextService *)self->_service persistence];
    [v15 saveValue:v14 forKeyPath:v9];
  }
  v10[2](v10, v14 != 0);

LABEL_10:
}

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1) {
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_34);
  }
  v2 = (void *)serverInterface_serverInterface_0;
  return v2;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken_0 != -1) {
    dispatch_once(&clientInterface_onceToken_0, &__block_literal_global_96);
  }
  v2 = (void *)clientInterface_clientInterface_0;
  return v2;
}

- (id)initForService:(id)a3 withConnection:(id)a4 andContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v40.receiver = self;
  v40.super_class = (Class)_CDUserContextServerClient;
  id v12 = [(_CDUserContextServerClient *)&v40 init];
  BOOL v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    objc_storeStrong((id *)&v13->_userContext, a5);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.coreduetd.service.client.workQueue", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    wakingRegistrations = v13->_wakingRegistrations;
    v13->_wakingRegistrations = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    nonWakingRegistration = v13->_nonWakingRegistration;
    v13->_nonWakingRegistration = (NSMutableSet *)v18;

    objc_storeStrong((id *)&v13->_clientConnection, a4);
    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.coreduetd.contextserverclient.activateMonitorQueue", v20);
    activateMonitorQueue = v13->_activateMonitorQueue;
    v13->_activateMonitorQueue = (OS_dispatch_queue *)v21;

    int v23 = [(id)objc_opt_class() clientInterface];
    [(NSXPCConnection *)v13->_clientConnection setRemoteObjectInterface:v23];

    id v24 = [(id)objc_opt_class() serverInterface];
    [(NSXPCConnection *)v13->_clientConnection setExportedInterface:v24];

    [(NSXPCConnection *)v13->_clientConnection setExportedObject:v13];
    objc_initWeak(&location, v9);
    objc_initWeak(&from, v13);
    clientConnection = v13->_clientConnection;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke;
    v35 = &unk_1E5609B28;
    objc_copyWeak(&v36, &location);
    objc_copyWeak(&v37, &from);
    [(NSXPCConnection *)clientConnection setInterruptionHandler:&v32];
    v26 = v13->_clientConnection;
    __int16 v27 = [(NSXPCConnection *)v26 interruptionHandler];
    [(NSXPCConnection *)v26 setInvalidationHandler:v27];

    [(NSXPCConnection *)v13->_clientConnection resume];
    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    devicesToActivateByRemoteUserContextProxySourceDeviceUUID = v13->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
    v13->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID = (NSMutableDictionary *)v28;

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v13 selector:sel_proxyTokenDidUpdate name:@"_CDMDCSProxyTokenUpdated" object:0];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_CDMDCSProxyTokenUpdated" object:0];

  [(NSXPCConnection *)self->_clientConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)_CDUserContextServerClient;
  [(_CDUserContextServerClient *)&v4 dealloc];
}

+ (id)clientOfService:(id)a3 withConnection:(id)a4 andContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initForService:v9 withConnection:v8 andContext:v7];

  return v10;
}

- (void)hasKnowledgeOfPath:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_CDUserContextService *)self->_service remoteDevicesHaveBeenActivated]
    || ![(_CDUserContextServerClient *)self isMDCSNeededForKeyPath:v6])
  {
    [(_CDUserContextServerClient *)self _hasKnowledgeOfPath:v6 handler:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_18EC9B000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57___CDUserContextServerClient_hasKnowledgeOfPath_handler___block_invoke;
    v10[3] = &unk_1E5609B50;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(_CDUserContextService *)service requestActivateDevicesFromAllSubscribersWithHandler:v10];
  }
}

- (void)_hasKnowledgeOfPath:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activateMonitorQueue = self->_activateMonitorQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke;
  v15[3] = &unk_1E5609BA0;
  v17 = self;
  id v18 = v7;
  id v16 = v6;
  id v9 = v15;
  id v10 = activateMonitorQueue;
  id v11 = v7;
  id v12 = v6;
  BOOL v13 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E56095F0;
  id v20 = v13;
  id v21 = v9;
  id v14 = v13;
  dispatch_async(v10, block);
}

- (void)propertiesOfRemotePath:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_CDUserContextService *)self->_service remoteDevicesHaveBeenActivated]
    || ![(_CDUserContextServerClient *)self isMDCSNeededForKeyPath:v6])
  {
    [(_CDUserContextServerClient *)self _propertiesOfRemotePath:v6 handler:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_18EC9B000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61___CDUserContextServerClient_propertiesOfRemotePath_handler___block_invoke;
    v10[3] = &unk_1E5609B50;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(_CDUserContextService *)service requestActivateDevicesFromAllSubscribersWithHandler:v10];
  }
}

- (void)_propertiesOfRemotePath:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___CDUserContextServerClient__propertiesOfRemotePath_handler___block_invoke;
  v8[3] = &unk_1E5609B78;
  id v9 = v6;
  id v7 = v6;
  [(_CDUserContextServerClient *)self _valueForRemotePath:a3 handler:v8];
}

- (void)_valueForRemotePath:(id)a3 handler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([v6 isMultiDeviceKeyPath])
  {
    id v8 = [(_CDInMemoryUserContext *)self->_userContext propertiesForContextualKeyPath:v6];
    if (v8)
    {
      id v9 = v8;
      id v10 = [v8 lastModifiedDate];
      [v10 timeIntervalSinceNow];
      double v12 = v11;

      if (v12 > -0.2)
      {
        id v14 = [MEMORY[0x1E4F5B418] mdcsChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[_CDUserContextServerClient _valueForRemotePath:handler:](v6, v9);
        }

        v7[2](v7, v9);
        goto LABEL_12;
      }
    }
    v18[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke;
    v15[3] = &unk_1E5609BC8;
    void v15[4] = self;
    id v16 = v6;
    v17 = v7;
    [(_CDUserContextServerClient *)self fetchPropertiesOfRemoteKeyPaths:v9 handler:v15];

LABEL_12:
    goto LABEL_13;
  }
  BOOL v13 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextServerClient _valueForRemotePath:handler:]();
  }

  v7[2](v7, 0);
LABEL_13:
}

- (void)handlePreviouslyFiredRegistration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create();
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke;
  v14[3] = &unk_1E56095A0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v17 = v8;
  id v10 = v17;
  double v11 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E56095F0;
  id v19 = v10;
  id v20 = v11;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(queue, block);
}

- (void)registerCallback:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isMultiDeviceRegistration];
  if (v5) {
    BOOL v6 = [(_CDInMemoryUserContext *)self->_userContext hasMultiDeviceRegistrations];
  }
  else {
    BOOL v6 = 0;
  }
  objc_initWeak(&location, v4);
  [(_CDUserContextService *)self->_service removeOpenRegistration:v4];
  service = self->_service;
  id v27 = 0;
  id v8 = [(_CDUserContextService *)service obtainFiredRegistrationMatchingRegistration:v4 info:&v27];
  id v9 = v27;
  if (v8)
  {
    [(_CDUserContextServerClient *)self handlePreviouslyFiredRegistration:v4 info:v9];
  }
  else
  {
    if ([v4 mustWake])
    {
      id v10 = self->_wakingRegistrations;
      objc_sync_enter(v10);
      [(NSMutableSet *)self->_wakingRegistrations addObject:v4];
    }
    else
    {
      id v10 = self->_nonWakingRegistration;
      objc_sync_enter(v10);
      [(NSMutableSet *)self->_nonWakingRegistration addObject:v4];
    }
    objc_sync_exit(v10);

    objc_initWeak(&from, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47___CDUserContextServerClient_registerCallback___block_invoke;
    v23[3] = &unk_1E5609C60;
    objc_copyWeak(&v24, &from);
    objc_copyWeak(&v25, &location);
    [v4 setInformativeCallback:v23];
    activateMonitorQueue = self->_activateMonitorQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47___CDUserContextServerClient_registerCallback___block_invoke_2;
    v20[3] = &unk_1E56091D8;
    id v12 = v4;
    id v21 = v12;
    BOOL v22 = self;
    id v13 = v20;
    id v14 = activateMonitorQueue;
    id v15 = (void *)os_transaction_create();
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    v30 = __cd_dispatch_async_capture_tx_block_invoke_1;
    v31 = &unk_1E56095F0;
    id v32 = v15;
    id v33 = v13;
    id v16 = v15;
    dispatch_async(v14, &block);

    if (v5)
    {
      id v17 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[_CDUserContextServerClient registerCallback:]();
      }

      if (!v6) {
        [(_CDUserContextServerClient *)self subscribeToDeviceStatusChangeNotificationsForDeviceTypes:0xFFFFLL];
      }
      id v18 = -[_CDUserContextServerClient deviceIDsForDeviceTypes:](self, "deviceIDsForDeviceTypes:", [v12 deviceTypes]);
      [(_CDUserContextServerClient *)self subscribeToContextValueNotificationsWithRegistration:v12 deviceIDs:v18];
      if (![(_CDUserContextService *)self->_service remoteDevicesHaveBeenActivated])
      {
        id v19 = [MEMORY[0x1E4F5B418] mdcsChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(block) = 138412290;
          *(void *)((char *)&block + 4) = v12;
          _os_log_impl(&dword_18EC9B000, v19, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", (uint8_t *)&block, 0xCu);
        }

        [(_CDUserContextService *)self->_service requestActivateDevicesFromAllSubscribersWithHandler:&__block_literal_global_133];
      }
    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&location);
}

- (void)deregisterAllCallbacks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(_CDInMemoryUserContext *)self->_userContext hasMultiDeviceRegistrations];
  uint64_t v6 = 56;
  if (v3) {
    uint64_t v6 = 48;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  objc_sync_enter(v7);
  id v8 = (void *)[v7 copy];
  [v7 removeAllObjects];
  objc_sync_exit(v7);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    int v12 = !v5;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        id v15 = [(_CDUserContextService *)self->_service persistence];
        [v15 deleteRegistration:v14];

        [(_CDInMemoryUserContext *)self->_userContext deregisterCallback:v14];
        if ([v14 isMultiDeviceRegistration])
        {
          id v16 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            int v23 = v14;
            _os_log_debug_impl(&dword_18EC9B000, v16, OS_LOG_TYPE_DEBUG, "Deregistering multi-device callback: %@", buf, 0xCu);
          }

          if (((v12 | [(_CDInMemoryUserContext *)self->_userContext hasMultiDeviceRegistrations]) & 1) == 0)[(_CDUserContextServerClient *)self subscribeToDeviceStatusChangeNotificationsForDeviceTypes:0]; {
          id v17 = -[_CDUserContextServerClient deviceIDsForDeviceTypes:](self, "deviceIDsForDeviceTypes:", [v14 deviceTypes]);
          }
          if ([v17 count]) {
            [(_CDUserContextServerClient *)self unsubscribeFromContextValueNotificationsWithRegistration:v14 deviceIDs:v17];
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)evaluatePredicate:(id)a3 handler:(id)a4
{
  userContext = self->_userContext;
  id v7 = a4;
  (*((void (**)(id, BOOL))a4 + 2))(v7, [(_CDInMemoryUserContext *)userContext evaluatePredicate:a3]);
}

- (void)setObject:(id)a3 lastModifiedDate:(id)a4 forContextualKeyPath:(id)a5 handler:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, BOOL))a6;
  id v14 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    long long v18 = _CDRedactedObjectForKeyPath(v12, v10);
    int v19 = 138412802;
    id v20 = v12;
    __int16 v21 = 2112;
    BOOL v22 = v18;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_debug_impl(&dword_18EC9B000, v14, OS_LOG_TYPE_DEBUG, "CDUserContext: SET %@ => %@ / %@", (uint8_t *)&v19, 0x20u);
  }
  id v15 = [(_CDInMemoryUserContext *)self->_userContext setObject:v10 returningMetadataForContextualKeyPath:v12];
  id v16 = v15;
  if (v15)
  {
    if (v11) {
      [v15 setLastModifiedDate:v11];
    }
    id v17 = [(_CDUserContextService *)self->_service persistence];
    [v17 saveValue:v16 forKeyPath:v12];
  }
  v13[2](v13, v16 != 0);
}

- (void)proxyTokenDidUpdate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableDictionary *)self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID copy];
  objc_sync_exit(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v11);
        [(_CDUserContextServerClient *)self activateDevices:v10 remoteUserContextProxySourceDeviceUUID:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v35 = a4;
  uid_t v32 = [(NSXPCConnection *)self->_clientConnection effectiveUserIdentifier];
  id v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  uint64_t v6 = self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
  objc_sync_enter(v6);
  uint64_t v7 = +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:v33];
  id v8 = [(_CDInMemoryUserContext *)self->_userContext objectForKeyedSubscript:v7];
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      long long v11 = [v35 UUIDString];
      -[_CDUserContextServerClient activateDevices:remoteUserContextProxySourceDeviceUUID:](v11, [v34 count], v48, v10);
    }

    id v9 = v34;
  }
  [(NSMutableDictionary *)self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID setObject:v9 forKeyedSubscript:v35];

  objc_sync_exit(v6);
  if (v8)
  {
    long long v12 = [MEMORY[0x1E4F5B418] mdcsChannel];
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

    if (v13)
    {
      long long v14 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[_CDUserContextServerClient activateDevices:remoteUserContextProxySourceDeviceUUID:](v34);
      }

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v15 = v34;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v41;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * v18);
            id v20 = [MEMORY[0x1E4F5B418] mdcsChannel];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v46 = v19;
              _os_log_debug_impl(&dword_18EC9B000, v20, OS_LOG_TYPE_DEBUG, "Activating device %{public}@", buf, 0xCu);
            }

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v47 count:16];
        }
        while (v16);
      }
    }
    __int16 v21 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
    objc_sync_enter(v21);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v22 = v34;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v27 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
          uint64_t v28 = [v26 deviceID];
          [v27 setObject:v26 forKeyedSubscript:v28];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v23);
    }

    [(_CDUserContextService *)self->_service setRemoteDevicesHaveBeenActivated:1];
    objc_sync_exit(v21);

    uint64_t v29 = [(_CDUserContextService *)self->_service proxySourceDeviceUUIDForUserID:v32];
    BOOL v30 = v29 == 0;

    if (v30)
    {
      v31 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[_CDUserContextServerClient activateDevices:remoteUserContextProxySourceDeviceUUID:](v35);
      }

      [(_CDUserContextService *)self->_service setProxySourceDeviceUUID:v35 forUserID:v32];
    }
    [(_CDInMemoryUserContext *)self->_userContext activateDevices:v22 remoteUserContextProxySourceDeviceUUID:v35];
  }
}

- (void)deactivateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    id v18 = v7;
    uint64_t v19 = self;
    id v10 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_CDUserContextServerClient deactivateDevices:remoteUserContextProxySourceDeviceUUID:](v6);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
          uint64_t v17 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v25 = v16;
            _os_log_debug_impl(&dword_18EC9B000, v17, OS_LOG_TYPE_DEBUG, "Deactivating device %{public}@", buf, 0xCu);
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v13);
    }

    id v7 = v18;
    self = v19;
  }
  [(_CDInMemoryUserContext *)self->_userContext deactivateDevices:v6 remoteUserContextProxySourceDeviceUUID:v7];
}

- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:handler:]();
  }

  BOOL v9 = [(_CDUserContextServerClient *)self keyPathsSortedByDeviceID:v6];
  if (![v9 count])
  {
    v7[2](v7, 0);
    goto LABEL_20;
  }
  v26 = (void (**)(void, void))v7;
  id v24 = v6;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v25 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v23 = v9;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
      uint64_t v17 = objc_msgSend(v11, "objectForKeyedSubscript:", v16, v23);
      id v18 = [v17 firstObject];
      uint64_t v19 = [(_CDUserContextServerClient *)self remoteUserContextProxySourceDeviceUUIDForKeyPath:v18];

      if (v19)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __70___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_handler___block_invoke;
        v27[3] = &unk_1E5609C88;
        id v28 = v25;
        id v29 = v10;
        uint64_t v30 = v16;
        id v31 = v11;
        uid_t v32 = v26;
        [(_CDUserContextServerClient *)self fetchPropertiesOfRemoteKeyPaths:v17 remoteUserContextProxySourceDeviceUUID:v19 handler:v27];

        long long v20 = v28;
LABEL_15:

        goto LABEL_16;
      }
      long long v21 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v16;
        _os_log_debug_impl(&dword_18EC9B000, v21, OS_LOG_TYPE_DEBUG, "CDUserContext: Unknown device specified: %@", buf, 0xCu);
      }

      [v10 addObject:v16];
      uint64_t v22 = [v10 count];
      if (v22 == [v11 count])
      {
        long long v20 = [v25 anyObject];
        ((void (**)(void, void *))v26)[2](v26, v20);
        goto LABEL_15;
      }
LABEL_16:
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
  }
  while (v13);
LABEL_18:

  BOOL v9 = v23;
  id v6 = v24;
  id v7 = (void (**)(id, void))v26;
LABEL_20:
}

- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:]();
  }

  id v19 = 0;
  uint64_t v12 = +[_CDXPCContextCodecs fetchPropertiesEventWithRemoteKeyPaths:v8 error:&v19];
  id v13 = v19;
  if (v12)
  {
    service = self->_service;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke;
    v16[3] = &unk_1E5609CB0;
    id v17 = v8;
    id v18 = v10;
    [(_CDUserContextService *)service sendEvent:v12 toProxy:v9 replyHandler:v16];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextServerClient fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:]();
    }

    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }
}

- (void)subscribeToContextValueNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextServerClient subscribeToContextValueNotificationsWithRegistration:deviceIDs:]();
  }

  id v8 = [(_CDUserContextServerClient *)self deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:v6];
  id v24 = v6;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = v9;
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v16 = [v10 objectForKeyedSubscript:v15];
        id v31 = 0;
        id v17 = +[_CDXPCContextCodecs subscribeToContextValueNotificationsEventWithRegistration:v26 deviceIDs:v16 error:&v31];
        id v18 = v31;
        if (v17)
        {
          service = self->_service;
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke;
          v29[3] = &unk_1E5609CD8;
          uint64_t v30 = v16;
          [(_CDUserContextService *)service sendEvent:v17 toProxy:v15 replyHandler:v29];
          long long v20 = v30;
        }
        else
        {
          long long v20 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[_CDUserContextServerClient subscribeToContextValueNotificationsWithRegistration:deviceIDs:](&v27, v28, v20);
          }
        }
        id v9 = v14;

        [v14 addObjectsFromArray:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  uint64_t v21 = [v9 count];
  if (v21 != [v24 count])
  {
    uint64_t v22 = (void *)[v24 mutableCopy];
    [v22 minusSet:v9];
    long long v23 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextServerClient subscribeToContextValueNotificationsWithRegistration:deviceIDs:]();
    }
  }
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:]();
  }

  id v26 = self;
  id v9 = [(_CDUserContextServerClient *)self deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:v7];
  uint64_t v25 = v7;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v27 = *(void *)v36;
    id v28 = v6;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = v10;
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v17 = [v11 objectForKeyedSubscript:v16];
        id v34 = 0;
        id v18 = +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsEventWithRegistration:v6 deviceIDs:v17 error:&v34];
        id v19 = v34;
        if (v18)
        {
          service = v26->_service;
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke;
          v31[3] = &unk_1E5609D00;
          long long v32 = v17;
          id v33 = v6;
          [(_CDUserContextService *)service sendEvent:v18 toProxy:v16 replyHandler:v31];

          uint64_t v21 = v32;
        }
        else
        {
          uint64_t v21 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:](&v29, v30, v21);
          }
        }
        id v10 = v15;

        [v15 addObjectsFromArray:v17];
        id v6 = v28;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }

  uint64_t v22 = [v10 count];
  if (v22 != [v25 count])
  {
    long long v23 = (void *)[v25 mutableCopy];
    [v23 minusSet:v10];
    id v24 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextServerClient unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:]();
    }
  }
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_CDUserContextServerClient subscribeToDeviceStatusChangeNotificationsForDeviceTypes:]();
  }

  id v20 = 0;
  id v6 = +[_CDXPCCodecs keepAliveEventWithKeepAlive:a3 != 0 error:&v20];
  id v7 = v20;
  if (v6)
  {
    id v8 = +[_CDContextQueries keyPathForMDCSProxies];
    id v9 = [(_CDInMemoryUserContext *)self->_userContext objectForKeyedSubscript:v8];
    id v10 = (void *)[v9 copy];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[_CDUserContextService sendEvent:toProxy:replyHandler:](self->_service, "sendEvent:toProxy:replyHandler:", v6, *(void *)(*((void *)&v16 + 1) + 8 * v15++), &__block_literal_global_142_0, (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_CDUserContextServerClient subscribeToDeviceStatusChangeNotificationsForDeviceTypes:]();
    }
  }
}

- (id)remoteUserContextProxySourceDeviceUUIDForKeyPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 deviceID];
  if (v4)
  {
    id v5 = +[_CDContextQueries keyPathForMDCSProxies];
    id v6 = [(_CDInMemoryUserContext *)self->_userContext objectForKeyedSubscript:v5];
    id v7 = (void *)[v6 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v19;
LABEL_4:
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v18 + 1) + 8 * v13);

        uint64_t v15 = -[_CDUserContextServerClient remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:](self, "remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:", v11, (void)v18);
        char v16 = [v15 containsObject:v4];

        if (v16) {
          break;
        }
        ++v13;
        uint64_t v14 = v11;
        if (v10 == v13)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            goto LABEL_4;
          }

          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)remoteDevices
{
  BOOL v3 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
  objc_sync_enter(v3);
  id v4 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
  id v5 = [v4 allValues];

  objc_sync_exit(v3);
  return v5;
}

- (id)remoteDeviceIDs
{
  BOOL v3 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
  objc_sync_enter(v3);
  id v4 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
  id v5 = [v4 allKeys];

  objc_sync_exit(v3);
  return v5;
}

- (id)remoteDevicesForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
  objc_sync_enter(v5);
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
  id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  [(_CDUserContextServerClient *)self remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [(_CDUserContextService *)self->_service remoteDevicesByDeviceID];
        uint64_t v15 = [v14 objectForKeyedSubscript:v13];

        if (v15) {
          [v8 addObject:v15];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  char v16 = (void *)[v8 copy];
  objc_sync_exit(v5);

  return v16;
}

- (id)remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  id v4 = +[_CDContextQueries keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:a3];
  id v5 = [(_CDInMemoryUserContext *)self->_userContext objectForKeyedSubscript:v4];
  id v6 = (void *)[v5 copy];

  return v6;
}

- (id)deviceIDsForDeviceTypes:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = [(_CDUserContextServerClient *)self remoteDevices];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "matchesDeviceTypes:", a3, (void)v18))
        {
          uint64_t v12 = [v11 deviceID];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = [v5 count];
    int v16 = [v6 count];
    long long v17 = _CDPrettyPrintCollection();
    *(_DWORD *)buf = 67109890;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = v16;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 2114;
    uint8_t v29 = v17;
    _os_log_debug_impl(&dword_18EC9B000, v13, OS_LOG_TYPE_DEBUG, "Found %d out of %d device IDs for device types %X: %{public}@", buf, 0x1Eu);
  }
  return v5;
}

- (id)keyPathsSortedByDeviceID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "deviceID", (void)v14);
        if (v11)
        {
          uint64_t v12 = [v4 objectForKeyedSubscript:v11];
          if (!v12)
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
          [v12 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)remoteUserContextProxySourceDeviceUUIDByDeviceID
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  long long v17 = +[_CDContextQueries keyPathForMDCSProxies];
  id v4 = -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:");
  id v5 = (void *)[v4 copy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = [(_CDUserContextServerClient *)self remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:v10];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              [v3 setObject:v10 forKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)deviceIDsSortedByRemoteUserContextProxySourceDeviceUUIDFromDeviceIDs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  uint64_t v6 = [(_CDUserContextServerClient *)self remoteUserContextProxySourceDeviceUUIDByDeviceID];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v19;
    *(void *)&long long v9 = 138543362;
    long long v17 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, v17, (void)v18);
        if (v14)
        {
          long long v15 = [v5 objectForKeyedSubscript:v14];
          if (!v15)
          {
            long long v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
            [v5 setObject:v15 forKeyedSubscript:v14];
          }
          [v15 addObject:v13];
        }
        else
        {
          long long v15 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v13;
            _os_log_error_impl(&dword_18EC9B000, v15, OS_LOG_TYPE_ERROR, "Unknown device id: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isMDCSNeededForKeyPathInKeyPaths:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[_CDUserContextServerClient isMDCSNeededForKeyPath:](self, "isMDCSNeededForKeyPath:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)addObjects:(id)a3 toArrayAtPath:(id)a4 handler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL))a5;
  long long v11 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = _CDRedactedObjectForKeyPath(v9, v8);
    int v18 = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    long long v21 = v12;
    _os_log_impl(&dword_18EC9B000, v11, OS_LOG_TYPE_DEFAULT, "CDUserContext: ADD %@ => %@", (uint8_t *)&v18, 0x16u);
  }
  long long v13 = +[_CDContextQueries keyPathForAppWebUsageDataDictionaries];
  if ([v9 isEqual:v13])
  {
    BOOL v14 = [(_CDUserContextServerClient *)self _shouldUpdateWebUsageForCurrentUser];

    if (!v14) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  LOBYTE(v18) = 0;
  long long v15 = [(_CDInMemoryUserContext *)self->_userContext addObjects:v8 andRemoveObjects:0 fromArrayAtKeyPath:v9 valueDidChange:&v18];
  if ((_BYTE)v18)
  {
    uint64_t v16 = [(_CDUserContextService *)self->_service persistence];
    [v16 saveValue:v15 forKeyPath:v9];

    BOOL v17 = (_BYTE)v18 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }
  v10[2](v10, v17);

LABEL_11:
}

- (void)removeObjects:(id)a3 fromArrayAtPath:(id)a4 handler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL))a5;
  long long v11 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = _CDRedactedObjectForKeyPath(v9, v8);
    int v16 = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl(&dword_18EC9B000, v11, OS_LOG_TYPE_DEFAULT, "CDUserContext: REMOVE %@ => %@", (uint8_t *)&v16, 0x16u);
  }
  LOBYTE(v16) = 0;
  long long v13 = [(_CDInMemoryUserContext *)self->_userContext addObjects:0 andRemoveObjects:v8 fromArrayAtKeyPath:v9 valueDidChange:&v16];
  if ((_BYTE)v16)
  {
    BOOL v14 = [(_CDUserContextService *)self->_service persistence];
    [v14 saveValue:v13 forKeyPath:v9];

    BOOL v15 = (_BYTE)v16 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  v10[2](v10, v15);
}

- (void)removeObjectsMatchingPredicate:(id)a3 fromArrayAtPath:(id)a4 handler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  long long v11 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_18EC9B000, v11, OS_LOG_TYPE_DEFAULT, "CDUserContext: Remove object matching predicate %@ => %@", buf, 0x16u);
  }

  if (!+[_CDPredicateValidator validatePredicate:v8 allowedKeys:0 error:0])
  {
    int v16 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[_CDUserContextServerClient removeObjectsMatchingPredicate:fromArrayAtPath:handler:]();
    }
    goto LABEL_14;
  }
  if (v8)
  {
    if (+[_CDPredicateValidator validatePredicate:v8 allowedKeys:0 error:0])
    {
      [v8 allowEvaluation];
      goto LABEL_7;
    }
    int v16 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[_CDUserContextServerClient removeObjectsMatchingPredicate:fromArrayAtPath:handler:]();
    }
LABEL_14:

    v10[2](v10, MEMORY[0x1E4F1CBF0]);
    goto LABEL_15;
  }
LABEL_7:
  userContext = self->_userContext;
  id v17 = 0;
  long long v13 = [(_CDInMemoryUserContext *)userContext removeObjectsMatchingPredicate:v8 fromArrayAtKeyPath:v9 removedObjects:&v17];
  id v14 = v17;
  if ([v14 count])
  {
    BOOL v15 = [(_CDUserContextService *)self->_service persistence];
    [v15 saveValue:v13 forKeyPath:v9];
  }
  ((void (**)(id, id))v10)[2](v10, v14);

LABEL_15:
}

- (BOOL)_shouldUpdateWebUsageForCurrentUser
{
  return 1;
}

- (void)valuesForPaths:(id)a3 inContextsMatching:(id)a4 handler:(id)a5
{
  userContext = self->_userContext;
  id v9 = a5;
  id v10 = [(_CDInMemoryUserContext *)userContext valuesForKeyPaths:a3 inContextsMatchingPredicate:a4];
  (*((void (**)(id, id))a5 + 2))(v9, v10);
}

- (void)valuesForPaths:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_CDUserContextService *)self->_service remoteDevicesHaveBeenActivated]
    || ![(_CDUserContextServerClient *)self isMDCSNeededForKeyPathInKeyPaths:v6])
  {
    [(_CDUserContextServerClient *)self _valuesForPaths:v6 handler:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_18EC9B000, v8, OS_LOG_TYPE_DEFAULT, "Requesting activate devices for %@", buf, 0xCu);
    }

    service = self->_service;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53___CDUserContextServerClient_valuesForPaths_handler___block_invoke;
    v10[3] = &unk_1E5609B50;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(_CDUserContextService *)service requestActivateDevicesFromAllSubscribersWithHandler:v10];
  }
}

- (void)_valuesForPaths:(id)a3 handler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v18 = v6;
  uint64_t v8 = [v6 count];
  if (v8)
  {
    id v17 = v7;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__2;
    v38[4] = __Block_byref_object_dispose__2;
    uint64_t v9 = v8;
    id v39 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v8];
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__2;
    v35[4] = __Block_byref_object_dispose__2;
    id v36 = (id)os_transaction_create();
    dispatch_time_t v10 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke;
    block[3] = &unk_1E5609D48;
    long long v32 = v38;
    uint64_t v34 = v9;
    id v12 = v17;
    id v31 = v12;
    id v33 = v35;
    dispatch_after(v10, queue, block);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v6;
    uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_145;
          v20[3] = &unk_1E5609D98;
          void v20[4] = self;
          v20[5] = v16;
          uint64_t v22 = v38;
          uint64_t v23 = v37;
          uint64_t v25 = v9;
          id v21 = v12;
          long long v24 = v35;
          [(_CDUserContextServerClient *)self _valueForPath:v16 handler:v20];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v13);
    }

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v38, 8);

    id v7 = v17;
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)activateMonitorQueue
{
  return self->_activateMonitorQueue;
}

- (void)setActivateMonitorQueue:(id)a3
{
}

- (_CDUserContextService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (_CDInMemoryUserContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (NSMutableSet)wakingRegistrations
{
  return self->_wakingRegistrations;
}

- (void)setWakingRegistrations:(id)a3
{
}

- (NSMutableSet)nonWakingRegistration
{
  return self->_nonWakingRegistration;
}

- (void)setNonWakingRegistration:(id)a3
{
}

- (NSMutableDictionary)devicesToActivateByRemoteUserContextProxySourceDeviceUUID
{
  return self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID;
}

- (void)setDevicesToActivateByRemoteUserContextProxySourceDeviceUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesToActivateByRemoteUserContextProxySourceDeviceUUID, 0);
  objc_storeStrong((id *)&self->_nonWakingRegistration, 0);
  objc_storeStrong((id *)&self->_wakingRegistrations, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_activateMonitorQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_valueForRemotePath:(void *)a1 handler:(void *)a2 .cold.1(void *a1, void *a2)
{
  v2 = _CDRedactedObjectForKeyPath(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v3, v4, "CDUserContext: GET %@ = %@", v5, v6, v7, v8, v9);
}

- (void)_valueForRemotePath:handler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18EC9B000, v0, v1, "Illegal GET of remote key path: %@", v2, v3, v4, v5, v6);
}

- (void)registerCallback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18EC9B000, v0, v1, "Registering multi-device callback: %@", v2, v3, v4, v5, v6);
}

- (void)deregisterCallback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18EC9B000, v0, v1, "Deregistering multi-device callback: %@", v2, v3, v4, v5, v6);
}

- (void)activateDevices:(void *)a1 remoteUserContextProxySourceDeviceUUID:.cold.1(void *a1)
{
  uint64_t v1 = [a1 UUIDString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v2, v3, "Registering remote user context proxy %{public}@", v4, v5, v6, v7, v8);
}

- (void)activateDevices:(void *)a1 remoteUserContextProxySourceDeviceUUID:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_14(&dword_18EC9B000, v1, v2, "Activating %u devices:", v3, v4, v5, v6, 0);
}

- (void)activateDevices:(uint8_t *)buf remoteUserContextProxySourceDeviceUUID:(os_log_t)log .cold.3(void *a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEBUG, "Waiting for proxy token for remote user context proxy %{public}@ before activating %u devices", buf, 0x12u);
}

- (void)deactivateDevices:(void *)a1 remoteUserContextProxySourceDeviceUUID:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_14(&dword_18EC9B000, v1, v2, "Deactivating %u devices:", v3, v4, v5, v6, 0);
}

- (void)fetchPropertiesOfRemoteKeyPaths:handler:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v1, v2, "Fetching properties of remote key paths: %{public}@", v3, v4, v5, v6, v7);
}

- (void)fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_18EC9B000, v1, v2, "Invalid key paths: %{public}@", v3, v4, v5, v6, v7);
}

- (void)fetchPropertiesOfRemoteKeyPaths:remoteUserContextProxySourceDeviceUUID:handler:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v0, v1, "Fetching properties of remote key paths from %{public}@: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)subscribeToContextValueNotificationsWithRegistration:deviceIDs:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_18EC9B000, v1, v2, "Unable to subscribe to user context value notifications on remote devices: %{public}@", v3, v4, v5, v6, v7);
}

- (void)subscribeToContextValueNotificationsWithRegistration:(NSObject *)a3 deviceIDs:.cold.2(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_12_0(&dword_18EC9B000, a3, (uint64_t)a3, "Invalid registration or remote deviceIDs", a1);
}

- (void)subscribeToContextValueNotificationsWithRegistration:deviceIDs:.cold.3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v1, v2, "Subscribing to context value change notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:.cold.1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_15(&dword_18EC9B000, v1, v2, "Unable to unsubscribe from  user context value notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:(NSObject *)a3 deviceIDs:.cold.2(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_12_0(&dword_18EC9B000, a3, (uint64_t)a3, "Invalid registration or deviceIDs", a1);
}

- (void)unsubscribeFromContextValueNotificationsWithRegistration:deviceIDs:.cold.3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v1, v2, "Unsubscribing from context value change notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12_0(&dword_18EC9B000, v0, v1, "Unable to instantiate keep alive event", v2);
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_18EC9B000, v0, v1, "Requesting to subscribe to device status change notifications", v2, v3, v4, v5, v6);
}

- (void)setObject:(void *)a1 forPath:(void *)a2 handler:.cold.1(void *a1, void *a2)
{
  uint64_t v2 = _CDRedactedObjectForKeyPath(a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v3, v4, "CDUserContext: SET %@ => %@", v5, v6, v7, v8, v9);
}

- (void)removeObjectsMatchingPredicate:fromArrayAtPath:handler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_FAULT, "Client provided invalid predicate %@", v1, 0xCu);
}

- (void)removeObjectsMatchingPredicate:fromArrayAtPath:handler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_FAULT, "Client provided invalid predicate to removeObjectsMatchingPredicate:fromArrayAtPath:handler: %@", v1, 0xCu);
}

@end