@interface CAMNebulaDaemonProxyManager
+ (id)_clientProtocolInterface;
+ (id)_daemonProtocolInterface;
- (CAMNebulaDaemonIrisClientProtocol)irisClientDelegate;
- (CAMNebulaDaemonProxyManager)init;
- (CAMNebulaDaemonTimelapseClientProtocol)timelapseClientDelegate;
- (NSXPCConnection)_connection;
- (OS_dispatch_queue)_queue;
- (int64_t)_connectionCount;
- (void)_closeConnectionToDaemon;
- (void)_ensureConnectionToDaemon;
- (void)_getProxyForExecutingBlock:(id)a3;
- (void)closeConnectionToDaemon;
- (void)enqueueIrisVideoJobs:(id)a3;
- (void)ensureConnectionToDaemon;
- (void)finishCaptureForTimelapseWithUUID:(id)a3;
- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3;
- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3;
- (void)performCrashRecoveryIfNeededForceEndLastTimelapseSession:(BOOL)a3;
- (void)performIrisCrashRecovery;
- (void)pingAfterInterruption;
- (void)resumeTimelapseWithUUID:(id)a3;
- (void)setIrisClientDelegate:(id)a3;
- (void)setTimelapseClientDelegate:(id)a3;
- (void)startTimelapseWithUUID:(id)a3;
- (void)stopTimelapseWithUUID:(id)a3;
- (void)updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3;
- (void)updateTimelapseWithUUID:(id)a3;
@end

@implementation CAMNebulaDaemonProxyManager

- (CAMNebulaDaemonProxyManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMNebulaDaemonProxyManager;
  v2 = [(CAMNebulaDaemonProxyManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.camera.nebulad.proxy", 0);
    queue = v2->__queue;
    v2->__queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)setIrisClientDelegate:(id)a3
{
}

- (void)setTimelapseClientDelegate:(id)a3
{
}

- (void)performCrashRecoveryIfNeededForceEndLastTimelapseSession:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[CAMTimelapseDiskUtilities hasPendingWork]) {
    [(CAMNebulaDaemonProxyManager *)self updatePendingWorkFromDiskForceEndLastSession:v3];
  }
  if (+[CAMIrisDiskUtilities hasPendingWork])
  {
    [(CAMNebulaDaemonProxyManager *)self performIrisCrashRecovery];
  }
}

- (void)ensureConnectionToDaemon
{
  queue = self->__queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CAMNebulaDaemonProxyManager_ensureConnectionToDaemon__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__CAMNebulaDaemonProxyManager_ensureConnectionToDaemon__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureConnectionToDaemon];
}

- (void)closeConnectionToDaemon
{
  queue = self->__queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CAMNebulaDaemonProxyManager_closeConnectionToDaemon__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__CAMNebulaDaemonProxyManager_closeConnectionToDaemon__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeConnectionToDaemon];
}

- (void)_ensureConnectionToDaemon
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->__queue);
  connection = self->__connection;
  ++self->__connectionCount;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.assetsd.nebulad" options:4096];
    v5 = self->__connection;
    self->__connection = v4;

    objc_super v6 = [(id)objc_opt_class() _daemonProtocolInterface];
    [(NSXPCConnection *)self->__connection setRemoteObjectInterface:v6];
    v7 = [(id)objc_opt_class() _clientProtocolInterface];
    [(NSXPCConnection *)self->__connection setExportedInterface:v7];
    [(NSXPCConnection *)self->__connection setExportedObject:self];
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __56__CAMNebulaDaemonProxyManager__ensureConnectionToDaemon__block_invoke;
    v12 = &unk_263FA0E00;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->__connection setInterruptionHandler:&v9];
    -[NSXPCConnection setInvalidationHandler:](self->__connection, "setInvalidationHandler:", &__block_literal_global_33, v9, v10, v11, v12);
    [(NSXPCConnection *)self->__connection _setQueue:self->__queue];
    [(NSXPCConnection *)self->__connection resume];
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = @"com.apple.assetsd.nebulad";
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Opening new connection to %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __56__CAMNebulaDaemonProxyManager__ensureConnectionToDaemon__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = @"com.apple.assetsd.nebulad";
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Connection with %{public}@ was interrupted", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pingAfterInterruption];
}

void __56__CAMNebulaDaemonProxyManager__ensureConnectionToDaemon__block_invoke_3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138543362;
    v2 = @"com.apple.assetsd.nebulad";
    _os_log_impl(&dword_2099F8000, v0, OS_LOG_TYPE_DEFAULT, "Connection with %{public}@ was invalidated. System is likely trying to shut down", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_closeConnectionToDaemon
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->__queue);
  int64_t connectionCount = self->__connectionCount;
  self->__int64_t connectionCount = connectionCount - 1;
  if (connectionCount <= 1)
  {
    connection = self->__connection;
    if (connection)
    {
      v5 = connection;
      uint64_t v6 = self->__connection;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __55__CAMNebulaDaemonProxyManager__closeConnectionToDaemon__block_invoke;
      v10[3] = &unk_263FA0208;
      v11 = v5;
      v7 = v5;
      [(NSXPCConnection *)v6 addBarrierBlock:v10];
      v8 = self->__connection;
      self->__connection = 0;
    }
    else
    {
      v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Trying to close a nil connection", (uint8_t *)&v9, 2u);
      }
    }
  }
}

uint64_t __55__CAMNebulaDaemonProxyManager__closeConnectionToDaemon__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = @"com.apple.assetsd.nebulad";
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Closing connection to %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 32) setInterruptionHandler:0];
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  return [*(id *)(a1 + 32) invalidate];
}

+ (id)_daemonProtocolInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE49FB8];
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_enqueueIrisVideoJobs_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_clientProtocolInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE2B180];
}

- (void)_getProxyForExecutingBlock:(id)a3
{
  id v4 = a3;
  queue = self->__queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke;
  v7[3] = &unk_263FA08E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureConnectionToDaemon];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  id v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_75;
  v8[3] = &unk_263FA28D0;
  v8[4] = &v9;
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v3, v10[5]);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_77;
  v7[3] = &unk_263FA0208;
  v7[4] = v5;
  dispatch_async(v6, v7);

  _Block_object_dispose(&v9, 8);
}

void __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Error getting proxy object %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_77(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeConnectionToDaemon];
}

- (void)pingAfterInterruption
{
}

uint64_t __52__CAMNebulaDaemonProxyManager_pingAfterInterruption__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pingAfterInterruption];
}

- (void)startTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CAMNebulaDaemonProxyManager_startTimelapseWithUUID___block_invoke;
  v6[3] = &unk_263FA4050;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaDaemonProxyManager *)self _getProxyForExecutingBlock:v6];
}

uint64_t __54__CAMNebulaDaemonProxyManager_startTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 startTimelapseWithUUID:*(void *)(a1 + 32)];
}

- (void)resumeTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CAMNebulaDaemonProxyManager_resumeTimelapseWithUUID___block_invoke;
  v6[3] = &unk_263FA4050;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaDaemonProxyManager *)self _getProxyForExecutingBlock:v6];
}

uint64_t __55__CAMNebulaDaemonProxyManager_resumeTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resumeTimelapseWithUUID:*(void *)(a1 + 32)];
}

- (void)updateTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CAMNebulaDaemonProxyManager_updateTimelapseWithUUID___block_invoke;
  v6[3] = &unk_263FA4050;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaDaemonProxyManager *)self _getProxyForExecutingBlock:v6];
}

uint64_t __55__CAMNebulaDaemonProxyManager_updateTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateTimelapseWithUUID:*(void *)(a1 + 32)];
}

- (void)finishCaptureForTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__CAMNebulaDaemonProxyManager_finishCaptureForTimelapseWithUUID___block_invoke;
  v6[3] = &unk_263FA4050;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaDaemonProxyManager *)self _getProxyForExecutingBlock:v6];
}

uint64_t __65__CAMNebulaDaemonProxyManager_finishCaptureForTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishCaptureForTimelapseWithUUID:*(void *)(a1 + 32)];
}

- (void)stopTimelapseWithUUID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CAMNebulaDaemonProxyManager_stopTimelapseWithUUID___block_invoke;
  v6[3] = &unk_263FA4050;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaDaemonProxyManager *)self _getProxyForExecutingBlock:v6];
}

uint64_t __53__CAMNebulaDaemonProxyManager_stopTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopTimelapseWithUUID:*(void *)(a1 + 32)];
}

- (void)updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __76__CAMNebulaDaemonProxyManager_updatePendingWorkFromDiskForceEndLastSession___block_invoke;
  v3[3] = &__block_descriptor_33_e47_v24__0___CAMNebulaDaemonProtocol__8__NSError_16l;
  BOOL v4 = a3;
  [(CAMNebulaDaemonProxyManager *)self _getProxyForExecutingBlock:v3];
}

uint64_t __76__CAMNebulaDaemonProxyManager_updatePendingWorkFromDiskForceEndLastSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePendingWorkFromDiskForceEndLastSession:*(unsigned __int8 *)(a1 + 32)];
}

- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__CAMNebulaDaemonProxyManager_forceStopTimelapseCaptureWithReasons___block_invoke;
  v3[3] = &unk_263FA04E0;
  void v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __68__CAMNebulaDaemonProxyManager_forceStopTimelapseCaptureWithReasons___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained forceStopTimelapseCaptureWithReasons:*(void *)(a1 + 40)];
}

- (void)enqueueIrisVideoJobs:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CAMNebulaDaemonProxyManager_enqueueIrisVideoJobs___block_invoke;
  v6[3] = &unk_263FA4050;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaDaemonProxyManager *)self _getProxyForExecutingBlock:v6];
}

uint64_t __52__CAMNebulaDaemonProxyManager_enqueueIrisVideoJobs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enqueueIrisVideoJobs:*(void *)(a1 + 32)];
}

- (void)performIrisCrashRecovery
{
}

uint64_t __55__CAMNebulaDaemonProxyManager_performIrisCrashRecovery__block_invoke(uint64_t a1, void *a2)
{
  return [a2 performIrisCrashRecovery];
}

- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__CAMNebulaDaemonProxyManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke;
  v6[3] = &unk_263FA0408;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __86__CAMNebulaDaemonProxyManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:*(void *)(a1 + 40)];
}

- (CAMNebulaDaemonTimelapseClientProtocol)timelapseClientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timelapseClientDelegate);
  return (CAMNebulaDaemonTimelapseClientProtocol *)WeakRetained;
}

- (CAMNebulaDaemonIrisClientProtocol)irisClientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_irisClientDelegate);
  return (CAMNebulaDaemonIrisClientProtocol *)WeakRetained;
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (int64_t)_connectionCount
{
  return self->__connectionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->__queue, 0);
  objc_destroyWeak((id *)&self->_irisClientDelegate);
  objc_destroyWeak((id *)&self->_timelapseClientDelegate);
}

@end