@interface IXServerConnection
+ (id)retrySynchronousIPC:(id)a3;
+ (id)sharedConnection;
- (BOOL)_onQueue_createXPCConnectionIfNecessary;
- (IXServerConnection)init;
- (NSMutableDictionary)coordinatorInstances;
- (NSMutableDictionary)promiseInstances;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)internalQueue;
- (id)_onQueue_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_onQueue_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_client_coordinatorDidCompleteSuccessfullyWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorDidInstallPlaceholderWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorDidRegisterForObservationWithUUID:(id)a3;
- (void)_client_coordinatorShouldBeginPostProcessingWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorShouldBeginRestoringUserDataWithUUID:(id)a3;
- (void)_client_coordinatorShouldPauseWithUUID:(id)a3;
- (void)_client_coordinatorShouldPrioritizeWithUUID:(id)a3;
- (void)_client_coordinatorShouldResumeWithUUID:(id)a3;
- (void)_client_coordinatorWithUUID:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4;
- (void)_client_coordinatorWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5;
- (void)_client_coordinatorWithUUID:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)_client_promiseDidCompleteSuccessfullyWithUUID:(id)a3;
- (void)_client_promiseWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5;
- (void)_onQueue_doCleanupForCoordinatorWithUUID:(id)a3;
- (void)_onQueue_doCleanupForPromiseWithUUID:(id)a3;
- (void)_onQueue_reSetupObserversAfter:(id)a3;
- (void)_onQueue_scanForAndRemoveEmptyHashTables;
- (void)registerAppInstallCoordinatorForUpdates:(id)a3 notifyDaemon:(BOOL)a4;
- (void)registerDataPromiseForUpdates:(id)a3 notifyDaemon:(BOOL)a4;
- (void)resetDaemonConnection;
- (void)setXpcConnection:(id)a3;
- (void)unregisterForUpdatesForAppInstallCoordinatorWithUUID:(id)a3;
- (void)unregisterForUpdatesForDataPromiseWithUUID:(id)a3;
@end

@implementation IXServerConnection

+ (id)sharedConnection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__IXServerConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, block);
  }
  v2 = (void *)sharedConnection_shared;

  return v2;
}

uint64_t __38__IXServerConnection_sharedConnection__block_invoke()
{
  sharedConnection_shared = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (void)_onQueue_scanForAndRemoveEmptyHashTables
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_FAULT, "%s: Detected orphaned promises %@", (uint8_t *)v1, 0x16u);
}

void __62__IXServerConnection__onQueue_scanForAndRemoveEmptyHashTables__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if (![a3 count]) {
    [*(id *)(a1 + 32) addObject:v7];
  }
  *a4 = 0;
}

void __62__IXServerConnection__onQueue_scanForAndRemoveEmptyHashTables__block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if (![a3 count]) {
    [*(id *)(a1 + 32) addObject:v7];
  }
  *a4 = 0;
}

- (void)_onQueue_reSetupObserversAfter:(id)a3
{
  id v4 = a3;
  [(IXServerConnection *)self _onQueue_scanForAndRemoveEmptyHashTables];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(IXServerConnection *)self promiseInstances];
  id v7 = [v6 allKeys];
  v8 = [v5 setWithArray:v7];

  if ([v8 count])
  {
    v9 = [(IXServerConnection *)self xpcConnection];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke;
    v22[3] = &unk_1E5D17618;
    id v23 = v4;
    v10 = [v9 remoteObjectProxyWithErrorHandler:v22];
    objc_msgSend(v10, "_remote_addObserversForDataPromisesWithUUIDs:", v8);
  }
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [(IXServerConnection *)self coordinatorInstances];
  v13 = [v12 allKeys];
  v14 = [v11 setWithArray:v13];

  if ([v14 count])
  {
    v15 = [(IXServerConnection *)self xpcConnection];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke_25;
    v20 = &unk_1E5D17618;
    id v21 = v4;
    v16 = [v15 remoteObjectProxyWithErrorHandler:&v17];
    objc_msgSend(v16, "_remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:", v14, 1, v17, v18, v19, v20);
  }
}

void __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXServerConnection _onQueue_reSetupObserversAfter:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to re-enable promise observers after %@: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __53__IXServerConnection__onQueue_reSetupObserversAfter___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXServerConnection _onQueue_reSetupObserversAfter:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to re-enable coordinator observers after %@: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_onQueue_doCleanupForCoordinatorWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXServerConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(IXServerConnection *)self coordinatorInstances];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IXServerConnection _onQueue_doCleanupForCoordinatorWithUUID:]();
    }
    goto LABEL_8;
  }
  if ([v7 count]) {
    objc_msgSend(v7, "setCount:", objc_msgSend(v7, "count") - 1);
  }
  if (![v7 count])
  {
    __int16 v8 = [(IXServerConnection *)self coordinatorInstances];
    [v8 setObject:0 forKeyedSubscript:v4];
LABEL_8:
  }
}

- (void)_onQueue_doCleanupForPromiseWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXServerConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(IXServerConnection *)self promiseInstances];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IXServerConnection _onQueue_doCleanupForPromiseWithUUID:]();
    }
    goto LABEL_8;
  }
  if ([v7 count]) {
    objc_msgSend(v7, "setCount:", objc_msgSend(v7, "count") - 1);
  }
  if (![v7 count])
  {
    __int16 v8 = [(IXServerConnection *)self promiseInstances];
    [v8 setObject:0 forKeyedSubscript:v4];
LABEL_8:
  }
}

- (BOOL)_onQueue_createXPCConnectionIfNecessary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(IXServerConnection *)self xpcConnection];

  if (v3) {
    return 1;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.installcoordinationd" options:4096];
  [(IXServerConnection *)self setXpcConnection:v4];

  uint64_t v5 = [(IXServerConnection *)self xpcConnection];

  if (v5)
  {
    int v6 = +[IXClientProtocolInterface interface];
    id v7 = [(IXServerConnection *)self xpcConnection];
    [v7 setRemoteObjectInterface:v6];

    __int16 v8 = +[IXClientDelegateProtocolInterface interface];
    uint64_t v9 = [(IXServerConnection *)self xpcConnection];
    [v9 setExportedInterface:v8];

    __int16 v10 = [(IXServerConnection *)self xpcConnection];
    [v10 setExportedObject:self];

    objc_initWeak((id *)location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke;
    v18[3] = &unk_1E5D18450;
    objc_copyWeak(&v19, (id *)location);
    id v11 = [(IXServerConnection *)self xpcConnection];
    [v11 setInterruptionHandler:v18];

    uint64_t v16 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v17, (id *)location);
    uint64_t v12 = [(IXServerConnection *)self xpcConnection];
    [v12 setInvalidationHandler:&v16];

    v13 = [(IXServerConnection *)self xpcConnection];
    [v13 resume];

    [(IXServerConnection *)self _onQueue_reSetupObserversAfter:@"connection setup"];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);
    return 1;
  }
  v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[IXServerConnection _onQueue_createXPCConnectionIfNecessary]";
    __int16 v21 = 2112;
    v22 = @"com.apple.installcoordinationd";
    _os_log_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_DEFAULT, "%s: Failed to create NSXPCConnection for service %@", location, 0x16u);
  }

  return 0;
}

void __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[IXServerConnection _onQueue_createXPCConnectionIfNecessary]_block_invoke";
    _os_log_impl(&dword_1A7B2D000, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection interrupted to installcoordinationd", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_30;
    block[3] = &unk_1E5D179B0;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reSetupObserversAfter:", @"connection interruption");
}

void __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[IXServerConnection _onQueue_createXPCConnectionIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1A7B2D000, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection invalidated to installcoordinationd", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_34;
    block[3] = &unk_1E5D179B0;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_34(uint64_t a1)
{
  [*(id *)(a1 + 32) setXpcConnection:0];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_scanForAndRemoveEmptyHashTables");
  uint64_t v2 = [*(id *)(a1 + 32) coordinatorInstances];
  if ([v2 count])
  {
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) promiseInstances];
    uint64_t v4 = [v3 count];

    if (!v4) {
      return;
    }
  }
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  int v6 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_2_35;
  block[3] = &unk_1E5D179B0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v5, v6, block);
}

uint64_t __61__IXServerConnection__onQueue_createXPCConnectionIfNecessary__block_invoke_2_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_createXPCConnectionIfNecessary");
}

- (IXServerConnection)init
{
  v11.receiver = self;
  v11.super_class = (Class)IXServerConnection;
  uint64_t v2 = [(IXServerConnection *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordination.IXServerConnection.internal", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    coordinatorInstances = v2->_coordinatorInstances;
    v2->_coordinatorInstances = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    promiseInstances = v2->_promiseInstances;
    v2->_promiseInstances = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (id)_onQueue_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(IXServerConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if ([(IXServerConnection *)self _onQueue_createXPCConnectionIfNecessary])
  {
    uint64_t v6 = [(IXServerConnection *)self xpcConnection];
    id v7 = [v6 remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    uint64_t v8 = IXQueueForConcurrentOperations();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke;
    v10[3] = &unk_1E5D16FA0;
    id v11 = v4;
    IXDispatchAsyncWithAutoreleasePool(v8, v10);

    id v7 = 0;
  }

  return v7;
}

void __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
  }

  id v4 = _CreateError((uint64_t)"-[IXServerConnection _onQueue_remoteObjectProxyWithErrorHandler:]_block_invoke", 243, @"IXErrorDomain", 1uLL, 0, 0, @"Unable to get remote object proxy for installcoordinationd connection", v3, v5);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  uint64_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  uint64_t v5 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__IXServerConnection_remoteObjectProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E5D18478;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __56__IXServerConnection_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_remoteObjectProxyWithErrorHandler:", *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (id)_onQueue_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXServerConnection *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if ([(IXServerConnection *)self _onQueue_createXPCConnectionIfNecessary])
  {
    id v6 = [(IXServerConnection *)self xpcConnection];
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IXServerConnection _onQueue_synchronousRemoteObjectProxyWithErrorHandler:]();
    }

    id v10 = _CreateError((uint64_t)"-[IXServerConnection _onQueue_synchronousRemoteObjectProxyWithErrorHandler:]", 266, @"IXErrorDomain", 1uLL, 0, 0, @"Unable to get synchronous remote object proxy for installcoordinationd connection", v9, v12);
    (*((void (**)(id, void *))v4 + 2))(v4, v10);

    id v7 = 0;
  }

  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  uint64_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  uint64_t v5 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__IXServerConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E5D18478;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __67__IXServerConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_synchronousRemoteObjectProxyWithErrorHandler:", *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

+ (id)retrySynchronousIPC:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(void))a3;
  id v4 = 0;
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  for (uint64_t i = 6; i; --i)
  {
    if (v4)
    {
      id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = "+[IXServerConnection retrySynchronousIPC:]";
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Retrying IPC because of error %@", buf, 0x16u);
      }

      sleep(1u);
    }
    uint64_t v8 = v3[2](v3);

    if (!v8) {
      break;
    }
    uint64_t v9 = [v8 domain];
    if (![v9 isEqualToString:v5] || objc_msgSend(v8, "code") != 4097)
    {

      break;
    }

    id v4 = v8;
  }

  return v8;
}

- (void)registerAppInstallCoordinatorForUpdates:(id)a3 notifyDaemon:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 uniqueIdentifier];
  if (v7)
  {
    uint64_t v8 = [(IXServerConnection *)self internalQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke;
    v11[3] = &unk_1E5D184A0;
    v11[4] = self;
    id v9 = v7;
    id v12 = v9;
    id v13 = v6;
    BOOL v14 = a4;
    dispatch_sync(v8, v11);

    id v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[IXServerConnection registerAppInstallCoordinatorForUpdates:notifyDaemon:]";
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: Tracking coordinator with UUID %@", buf, 0x16u);
    }
  }
}

void __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coordinatorInstances];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    uint64_t v3 = objc_alloc_init(IXAppInstallObjectsMetadata);
    id v4 = [*(id *)(a1 + 32) coordinatorInstances];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [(IXAppInstallObjectsMetadata *)v3 addObject:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 56))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke_2;
    v8[3] = &unk_1E5D17618;
    uint64_t v5 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v6 = objc_msgSend(v5, "_onQueue_remoteObjectProxyWithErrorHandler:", v8);
    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    objc_msgSend(v6, "_remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:", v7, 0);

    [*(id *)(a1 + 48) setIsRegisteredWithDaemon:1];
  }
}

void __75__IXServerConnection_registerAppInstallCoordinatorForUpdates_notifyDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXServerConnection registerAppInstallCoordinatorForUpdates:notifyDaemon:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to register coordinator with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)unregisterForUpdatesForAppInstallCoordinatorWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(IXServerConnection *)self internalQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke;
    v6[3] = &unk_1E5D17848;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_doCleanupForCoordinatorWithUUID:", *(void *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke_2;
  v6[3] = &unk_1E5D17618;
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "_onQueue_remoteObjectProxyWithErrorHandler:", v6);
  objc_msgSend(v3, "_remote_removeObserverForCoordinatorWithUUID:", *(void *)(a1 + 40));

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[IXServerConnection unregisterForUpdatesForAppInstallCoordinatorWithUUID:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: No longer tracking coordinator with UUID %@", buf, 0x16u);
  }
}

void __75__IXServerConnection_unregisterForUpdatesForAppInstallCoordinatorWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXServerConnection unregisterForUpdatesForAppInstallCoordinatorWithUUID:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to unregister coordinator with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)registerDataPromiseForUpdates:(id)a3 notifyDaemon:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 uniqueIdentifier];
  if (v7)
  {
    __int16 v8 = [(IXServerConnection *)self internalQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke;
    v11[3] = &unk_1E5D184A0;
    v11[4] = self;
    id v9 = v7;
    id v12 = v9;
    id v13 = v6;
    BOOL v14 = a4;
    dispatch_sync(v8, v11);

    __int16 v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[IXServerConnection registerDataPromiseForUpdates:notifyDaemon:]";
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: Tracking data promise with UUID %@", buf, 0x16u);
    }
  }
}

void __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) promiseInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v3 = objc_alloc_init(IXAppInstallObjectsMetadata);
    id v4 = [*(id *)(a1 + 32) promiseInstances];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [(IXAppInstallObjectsMetadata *)v3 addObject:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 56))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke_2;
    v8[3] = &unk_1E5D17618;
    uint64_t v5 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v6 = objc_msgSend(v5, "_onQueue_remoteObjectProxyWithErrorHandler:", v8);
    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    objc_msgSend(v6, "_remote_addObserversForDataPromisesWithUUIDs:", v7);
  }
}

void __65__IXServerConnection_registerDataPromiseForUpdates_notifyDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXServerConnection registerDataPromiseForUpdates:notifyDaemon:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to register promise with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)unregisterForUpdatesForDataPromiseWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(IXServerConnection *)self internalQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke;
    v6[3] = &unk_1E5D17848;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_doCleanupForPromiseWithUUID:", *(void *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke_2;
  v6[3] = &unk_1E5D17618;
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "_onQueue_remoteObjectProxyWithErrorHandler:", v6);
  objc_msgSend(v3, "_remote_removeObserverForDataPromiseWithUUID:", *(void *)(a1 + 40));

  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[IXServerConnection unregisterForUpdatesForDataPromiseWithUUID:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: No longer tracking data promise with UUID %@", buf, 0x16u);
  }
}

void __65__IXServerConnection_unregisterForUpdatesForDataPromiseWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXServerConnection unregisterForUpdatesForDataPromiseWithUUID:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact installcoordinationd to unregister promise with UUID %@: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)resetDaemonConnection
{
  id v3 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__IXServerConnection_resetDaemonConnection__block_invoke;
  block[3] = &unk_1E5D179B0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __43__IXServerConnection_resetDaemonConnection__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[IXServerConnection resetDaemonConnection]_block_invoke";
    _os_log_impl(&dword_1A7B2D000, v2, OS_LOG_TYPE_DEFAULT, "%s: Resetting daemon connection", (uint8_t *)&v8, 0xCu);
  }

  id v3 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  objc_msgSend(v3, "_remote_fakeClientDeathWithCompletion:", &__block_literal_global_52);

  id v4 = [*(id *)(a1 + 32) coordinatorInstances];
  [v4 removeAllObjects];

  uint64_t v5 = [*(id *)(a1 + 32) promiseInstances];
  [v5 removeAllObjects];

  int v6 = [*(id *)(a1 + 32) xpcConnection];
  [v6 invalidate];

  return [*(id *)(a1 + 32) setXpcConnection:0];
}

void __43__IXServerConnection_resetDaemonConnection__block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[IXServerConnection resetDaemonConnection]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to request the daemon to fake our death: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __43__IXServerConnection_resetDaemonConnection__block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[IXServerConnection resetDaemonConnection]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to request the daemon to fake our death: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)_client_coordinatorDidRegisterForObservationWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXServerConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__IXServerConnection__client_coordinatorDidRegisterForObservationWithUUID___block_invoke;
  v7[3] = &unk_1E5D17848;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__IXServerConnection__client_coordinatorDidRegisterForObservationWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_didRegisterForObservation", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_coordinatorShouldPrioritizeWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IXServerConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__IXServerConnection__client_coordinatorShouldPrioritizeWithUUID___block_invoke;
  v7[3] = &unk_1E5D17848;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__IXServerConnection__client_coordinatorShouldPrioritizeWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldPrioritize", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_coordinatorShouldResumeWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IXServerConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__IXServerConnection__client_coordinatorShouldResumeWithUUID___block_invoke;
  v7[3] = &unk_1E5D17848;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__IXServerConnection__client_coordinatorShouldResumeWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldResume", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_coordinatorShouldPauseWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IXServerConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__IXServerConnection__client_coordinatorShouldPauseWithUUID___block_invoke;
  v7[3] = &unk_1E5D17848;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__IXServerConnection__client_coordinatorShouldPauseWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldPause", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__IXServerConnection__client_coordinatorWithUUID_configuredPromiseDidBeginFulfillment___block_invoke;
  block[3] = &unk_1E5D16FF0;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __87__IXServerConnection__client_coordinatorWithUUID_configuredPromiseDidBeginFulfillment___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_promiseDidBeginFulfillmentWithIdentifier:", *(void *)(a1 + 48), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_coordinatorShouldBeginRestoringUserDataWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IXServerConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__IXServerConnection__client_coordinatorShouldBeginRestoringUserDataWithUUID___block_invoke;
  v7[3] = &unk_1E5D17848;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __78__IXServerConnection__client_coordinatorShouldBeginRestoringUserDataWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_shouldBeginRestoringUserData", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_coordinatorDidInstallPlaceholderWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__IXServerConnection__client_coordinatorDidInstallPlaceholderWithUUID_forRecordPromise___block_invoke;
  block[3] = &unk_1E5D184C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __88__IXServerConnection__client_coordinatorDidInstallPlaceholderWithUUID_forRecordPromise___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  id v5 = [v4 anyObject];
  id v6 = [v5 bundleID];
  if ([(id)objc_opt_class() modifiesLocalLaunchServicesDatabase])
  {
    id v7 = IXApplicationRecordForRecordPromise(*(void **)(a1 + 48), v6);
  }
  else
  {
    id v7 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "_clientDelegate_placeholderDidInstallForApplicationRecord:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_client_coordinatorShouldBeginPostProcessingWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__IXServerConnection__client_coordinatorShouldBeginPostProcessingWithUUID_forRecordPromise___block_invoke;
  block[3] = &unk_1E5D184C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __92__IXServerConnection__client_coordinatorShouldBeginPostProcessingWithUUID_forRecordPromise___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  id v5 = [v4 anyObject];
  id v6 = [v5 bundleID];
  if ([(id)objc_opt_class() modifiesLocalLaunchServicesDatabase])
  {
    id v7 = IXApplicationRecordForRecordPromise(*(void **)(a1 + 48), v6);
  }
  else
  {
    id v7 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "_clientDelegate_shouldBeginPostProcessingForApplicationRecord:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_client_coordinatorDidCompleteSuccessfullyWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__IXServerConnection__client_coordinatorDidCompleteSuccessfullyWithUUID_forRecordPromise___block_invoke;
  block[3] = &unk_1E5D184C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __90__IXServerConnection__client_coordinatorDidCompleteSuccessfullyWithUUID_forRecordPromise___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  id v5 = [v4 anyObject];
  id v6 = [v5 bundleID];
  if ([(id)objc_opt_class() modifiesLocalLaunchServicesDatabase])
  {
    id v7 = IXApplicationRecordForRecordPromise(*(void **)(a1 + 48), v6);
  }
  else
  {
    id v7 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "_clientDelegate_didCompleteForApplicationRecord:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(IXServerConnection *)self internalQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__IXServerConnection__client_coordinatorWithUUID_didCancelWithReason_client___block_invoke;
  v13[3] = &unk_1E5D184F0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __77__IXServerConnection__client_coordinatorWithUUID_didCancelWithReason_client___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[IXServerConnection _client_coordinatorWithUUID:didCancelWithReason:client:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = [v4 count];
    _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Messaged with uuid %@ to cancel with reason %@; found %lu coordinators to cancel",
      buf,
      0x2Au);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "_clientDelegate_didCancelWithError:client:", *(void *)(a1 + 48), *(void *)(a1 + 56), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v10 = a3;
  uint64_t v11 = [(IXServerConnection *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__IXServerConnection__client_coordinatorWithUUID_didUpdateProgress_forPhase_overallProgress___block_invoke;
  block[3] = &unk_1E5D18518;
  block[4] = self;
  id v14 = v10;
  double v15 = a4;
  unint64_t v16 = a5;
  double v17 = a6;
  id v12 = v10;
  dispatch_async(v11, block);
}

void __93__IXServerConnection__client_coordinatorWithUUID_didUpdateProgress_forPhase_overallProgress___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) coordinatorInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_didUpdateProgress:forPhase:overallProgress:", *(void *)(a1 + 56), *(double *)(a1 + 48), *(double *)(a1 + 64), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_promiseDidCompleteSuccessfullyWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IXServerConnection *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__IXServerConnection__client_promiseDidCompleteSuccessfullyWithUUID___block_invoke;
  v7[3] = &unk_1E5D17848;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__IXServerConnection__client_promiseDidCompleteSuccessfullyWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) promiseInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_didComplete", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_client_promiseWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(IXServerConnection *)self internalQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__IXServerConnection__client_promiseWithUUID_didCancelWithReason_client___block_invoke;
  v13[3] = &unk_1E5D184F0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __73__IXServerConnection__client_promiseWithUUID_didCancelWithReason_client___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) promiseInstances];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v3 instances];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_clientDelegate_didCancelWithError:client:", *(void *)(a1 + 48), *(void *)(a1 + 56), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)coordinatorInstances
{
  return self->_coordinatorInstances;
}

- (NSMutableDictionary)promiseInstances
{
  return self->_promiseInstances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseInstances, 0);
  objc_storeStrong((id *)&self->_coordinatorInstances, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)_onQueue_doCleanupForCoordinatorWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: No entry existed for coordinator with UUID %@", v2, v3, v4, v5, 2u);
}

- (void)_onQueue_doCleanupForPromiseWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: No entry existed for promise with UUID %@", v2, v3, v4, v5, 2u);
}

void __65__IXServerConnection__onQueue_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Unable to get remote object proxy for installcoordinationd connection : %@", v2, v3, v4, v5, 2u);
}

- (void)_onQueue_synchronousRemoteObjectProxyWithErrorHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Unable to get synchronous remote object proxy for installcoordinationd connection : %@", v2, v3, v4, v5, 2u);
}

@end