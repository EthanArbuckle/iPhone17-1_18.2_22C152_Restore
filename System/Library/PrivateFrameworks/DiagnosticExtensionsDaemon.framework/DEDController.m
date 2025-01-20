@interface DEDController
+ (id)archivedClasses;
- (BOOL)embeddedInApp;
- (BOOL)hasCompletionBlockWithIdentifier:(id)a3;
- (BOOL)hasDevice:(id)a3;
- (BOOL)hasRecentlyFinishedSessionWithIdentifier:(id)a3;
- (BOOL)induceTimeOutIfNeededAndReturnCanProceedWithDevice:(id)a3 sessionId:(id)a4;
- (BOOL)isDaemon;
- (BOOL)started;
- (BOOL)useIDS;
- (BOOL)useSharing;
- (DEDClientProtocol)clientDelegate;
- (DEDController)init;
- (DEDPairingProtocol)pairingDelegate;
- (DEDWorkerProtocol)workerDelegate;
- (DEDXPCConnector)xpcConnector;
- (NSDictionary)sessions;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)sessionDidStartBlocks;
- (NSMutableDictionary)sessionStartBlocks;
- (NSMutableSet)recentlyFinishedSessions;
- (OS_dispatch_queue)bugSessionCallbackQueue;
- (OS_dispatch_queue)replyQueue;
- (OS_dispatch_queue)workQueue;
- (OS_os_log)log;
- (id)_allKnownDevicesWithIdentifier:(id)a3;
- (id)_deviceForIncomingDevice:(id)a3;
- (id)_deviceForIncomingDevice:(id)a3 needsReady:(BOOL)a4;
- (id)_sharingDeviceForIncomingDevice:(id)a3;
- (id)allKnownDevices;
- (id)connector:(id)a3 needsXPCInboundForPid:(id)a4;
- (id)devicesCompletion;
- (id)didCancelCompletion;
- (id)idsConnection;
- (id)knownSessions;
- (id)persistence;
- (id)pongBlock;
- (id)popDidStartSessionCompletionWithIdentifier:(id)a3;
- (id)popSessionStartCompletionWithIdentifier:(id)a3;
- (id)sessionExistsCompletion;
- (id)sessionForIdentifier:(id)a3;
- (id)sharingConnection;
- (id)xpcConnectionsCompletion;
- (void)_didAbortSessionWithID:(id)a3;
- (void)_timeOutSessionStartBlockWithIdentifier:(id)a3 targetDevice:(id)a4 timeout:(double)a5;
- (void)abortSession:(id)a3;
- (void)abortSession:(id)a3 withCompletion:(id)a4;
- (void)addDevice:(id)a3;
- (void)addDidStartSessionCompletion:(id)a3 withIdentifier:(id)a4;
- (void)addSessionStartCompletion:(id)a3 withIdentifier:(id)a4 configuration:(id)a5 targetDevice:(id)a6;
- (void)configureForDaemon;
- (void)configureForSharing:(BOOL)a3;
- (void)connector:(id)a3 didLooseConnectionToProcessWithPid:(int)a4;
- (void)didFinishSessionWithIdentifier:(id)a3;
- (void)didStartBugSessionWithInfo:(id)a3;
- (void)discoverDevicesWithCompletion:(id)a3;
- (void)forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5;
- (void)hasActiveSessionForIdentifier:(id)a3 completion:(id)a4;
- (void)idsInbound_devicesChanged:(id)a3;
- (void)idsInbound_devicesChanged:(id)a3 completion:(id)a4;
- (void)idsInbound_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6;
- (void)insertNewSession:(id)a3;
- (void)listXPCConnections:(id)a3;
- (void)logDeviceCounts;
- (void)pingDaemonWithCompletion:(id)a3;
- (void)purgeStaleSessions:(id)a3 completion:(id)a4;
- (void)removeSessionWithIdentifier:(id)a3;
- (void)reset;
- (void)setBugSessionCallbackQueue:(id)a3;
- (void)setClientDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDevicesCompletion:(id)a3;
- (void)setDidCancelCompletion:(id)a3;
- (void)setEmbeddedInApp:(BOOL)a3;
- (void)setIsDaemon:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setPairingDelegate:(id)a3;
- (void)setPongBlock:(id)a3;
- (void)setRecentlyFinishedSessions:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setSessionDidStartBlocks:(id)a3;
- (void)setSessionExistsCompletion:(id)a3;
- (void)setSessionStartBlocks:(id)a3;
- (void)setSessions:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setUseIDS:(BOOL)a3;
- (void)setUseSharing:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)setWorkerDelegate:(id)a3;
- (void)setXpcConnectionsCompletion:(id)a3;
- (void)setXpcConnector:(id)a3;
- (void)sharingInbound_promptPINForDevice:(id)a3 fromInbound:(id)a4;
- (void)sharingInbound_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6;
- (void)sharingInbound_successPINForDevice:(id)a3 fromInbound:(id)a4;
- (void)start;
- (void)startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6 fromInbound:(id)a7;
- (void)startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 target:(id)a5 completion:(id)a6;
- (void)startPairSetupForDevice:(id)a3;
- (void)stopDiscovery;
- (void)tryPIN:(id)a3 forDevice:(id)a4;
- (void)upgradeToClassCDataProtectionIfNeeded;
- (void)xpcInbound_didDiscoverDevices:(id)a3;
- (void)xpcInbound_discoverAllAvailableDevices:(id)a3;
- (void)xpcInbound_forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5;
- (void)xpcInbound_gotDeviceUpdate:(id)a3;
- (void)xpcInbound_hasActiveSession:(id)a3 fromInbound:(id)a4;
- (void)xpcInbound_hasActiveSessionReply:(id)a3 isActive:(BOOL)a4;
- (void)xpcInbound_listClientXPCConnectionsReply:(id)a3;
- (void)xpcInbound_ping:(id)a3;
- (void)xpcInbound_pong;
- (void)xpcInbound_promptPINForDevice:(id)a3;
- (void)xpcInbound_startPairSetupForDevice:(id)a3 fromInbound:(id)a4;
- (void)xpcInbound_stopDeviceDiscovery:(id)a3;
- (void)xpcInbound_successPINForDevice:(id)a3;
- (void)xpcInbound_tryPIN:(id)a3 forDevice:(id)a4 fromInbound:(id)a5;
- (void)xpc_listClientXPCConnectionsFromInbound:(id)a3;
@end

@implementation DEDController

- (DEDController)init
{
  v20.receiver = self;
  v20.super_class = (Class)DEDController;
  v2 = [(DEDController *)&v20 init];
  v3 = v2;
  if (v2)
  {
    sessions = v2->_sessions;
    v2->_sessions = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
    devices = v3->_devices;
    v3->_devices = (NSMutableDictionary *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
    sessionStartBlocks = v3->_sessionStartBlocks;
    v3->_sessionStartBlocks = (NSMutableDictionary *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
    sessionDidStartBlocks = v3->_sessionDidStartBlocks;
    v3->_sessionDidStartBlocks = (NSMutableDictionary *)v9;

    v3->_isDaemon = 0;
    xpcConnector = v3->_xpcConnector;
    v3->_xpcConnector = 0;

    v12 = +[DEDConfiguration sharedInstance];
    uint64_t v13 = [v12 connectionType];

    if (v13 == 1)
    {
      dispatch_queue_t v14 = dispatch_queue_create("com.apple.diagnosticextensionsd.embedded-work-queue", 0);
    }
    else
    {
      dispatch_queue_t v14 = (dispatch_queue_t)MEMORY[0x263EF83A0];
      id v15 = MEMORY[0x263EF83A0];
    }
    replyQueue = v3->_replyQueue;
    v3->_replyQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.diagnosticextensionsd.work-queue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v3->_clientDelegate, 0);
    objc_storeWeak((id *)&v3->_workerDelegate, 0);
    *(_DWORD *)&v3->_started = 0;
  }
  return v3;
}

- (OS_dispatch_queue)bugSessionCallbackQueue
{
  p_bugSessionCallbackQueue = &self->_bugSessionCallbackQueue;
  bugSessionCallbackQueue = self->_bugSessionCallbackQueue;
  if (!bugSessionCallbackQueue)
  {
    objc_storeStrong((id *)p_bugSessionCallbackQueue, MEMORY[0x263EF83A0]);
    bugSessionCallbackQueue = *p_bugSessionCallbackQueue;
  }
  return bugSessionCallbackQueue;
}

- (void)configureForDaemon
{
  [(DEDController *)self setIsDaemon:1];
  [(DEDController *)self setUseSharing:0];
  [(DEDController *)self setUseIDS:1];
  v3 = +[DEDConfiguration sharedInstance];
  if ([v3 connectionType] == 1)
  {
  }
  else
  {
    v4 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v5 = [v4 environment];
    v6 = [v5 objectForKeyedSubscript:@"USE-DEBUG-SERVICE"];

    if (!v6) {
      return;
    }
  }
  [(DEDController *)self setUseIDS:0];
}

- (void)configureForSharing:(BOOL)a3
{
  if (a3)
  {
    v4 = [(DEDController *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[DEDController configureForSharing:]();
    }
  }
  [(DEDController *)self setUseSharing:0];
}

- (void)start
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "DEDController#start: already running", v2, v3, v4, v5, v6);
}

void __22__DEDController_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x223C5FD90]();
        v10 = *(void **)(a1 + 32);
        v11 = [v8 identifier];
        [v10 removeSessionWithIdentifier:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  v12 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_INFO, "checking for pending operations", buf, 2u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "sessions", 0);
  dispatch_queue_t v14 = [v13 allValues];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) resumePendingOperations];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v16);
  }

  [*(id *)(a1 + 32) upgradeToClassCDataProtectionIfNeeded];
}

+ (id)archivedClasses
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (void)pingDaemonWithCompletion:(id)a3
{
  id v4 = a3;
  [(DEDController *)self setPongBlock:v4];
  objc_initWeak(&location, self);
  uint64_t v5 = [(DEDController *)self replyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__DEDController_pingDaemonWithCompletion___block_invoke;
  v6[3] = &unk_26453A9F0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__DEDController_pingDaemonWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained xpcConnector];
  uint64_t v2 = [v1 diagnosticextensionsdXPCInterface];
  objc_msgSend(v2, "xpc_ping");
}

- (void)discoverDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "started device discovery", (uint8_t *)buf, 2u);
  }

  [(DEDController *)self setDevicesCompletion:v4];
  objc_initWeak(buf, self);
  uint64_t v6 = [(DEDController *)self replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DEDController_discoverDevicesWithCompletion___block_invoke;
  block[3] = &unk_26453A9F0;
  objc_copyWeak(&v8, buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __47__DEDController_discoverDevicesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained xpcConnector];
  uint64_t v2 = [v1 diagnosticextensionsdXPCInterface];
  objc_msgSend(v2, "xpc_discoverAllAvailableDevices");
}

- (void)stopDiscovery
{
  uint64_t v3 = [(DEDController *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "stopped device discovery", (uint8_t *)buf, 2u);
  }

  [(DEDController *)self setDevicesCompletion:0];
  objc_initWeak(buf, self);
  id v4 = [(DEDController *)self replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__DEDController_stopDiscovery__block_invoke;
  block[3] = &unk_26453A9F0;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __30__DEDController_stopDiscovery__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained xpcConnector];
  uint64_t v2 = [v1 diagnosticextensionsdXPCInterface];
  objc_msgSend(v2, "xpc_stopDeviceDiscovery");
}

- (id)allKnownDevices
{
  return [(DEDController *)self _allKnownDevicesWithIdentifier:0];
}

- (id)_allKnownDevicesWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(DEDController *)v5 devices];
  id v7 = [v6 allValues];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__DEDController__allKnownDevicesWithIdentifier___block_invoke;
  v11[3] = &unk_26453AA18;
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = objc_msgSend(v7, "ded_selectItemsPassingTest:", v11);

  objc_sync_exit(v5);
  return v9;
}

uint64_t __48__DEDController__allKnownDevicesWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v3 status];
  if (v4)
  {
    if (v5 == 4)
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v6 = [v3 identifier];
      uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v7 = v5 != 4;
  }

  return v7;
}

- (void)startPairSetupForDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 publicLogDescription];
    *(_DWORD *)buf = 136446466;
    dispatch_queue_t v14 = "-[DEDController startPairSetupForDevice:]";
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }
  uint64_t v7 = [(DEDController *)self _sharingDeviceForIncomingDevice:v4];
  if ([v7 transport] == 2)
  {
    objc_initWeak((id *)buf, self);
    id v8 = [(DEDController *)self replyQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__DEDController_startPairSetupForDevice___block_invoke;
    v10[3] = &unk_26453AA40;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v7;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v9 = [(DEDController *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDController startPairSetupForDevice:]();
    }
  }
}

void __41__DEDController_startPairSetupForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 diagnosticextensionsdXPCInterface];
  objc_msgSend(v3, "xpc_startPairSetupForDevice:", *(void *)(a1 + 32));
}

- (void)tryPIN:(id)a3 forDevice:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDController *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 publicLogDescription];
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = "-[DEDController tryPIN:forDevice:]";
    __int16 v19 = 2114;
    long long v20 = v9;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }
  v10 = [(DEDController *)self _sharingDeviceForIncomingDevice:v7];
  if ([v10 transport] == 2)
  {
    objc_initWeak((id *)buf, self);
    id v11 = [(DEDController *)self replyQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__DEDController_tryPIN_forDevice___block_invoke;
    block[3] = &unk_26453AA68;
    objc_copyWeak(&v16, (id *)buf);
    id v14 = v6;
    id v15 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = [(DEDController *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DEDController tryPIN:forDevice:]();
    }
  }
}

void __34__DEDController_tryPIN_forDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 diagnosticextensionsdXPCInterface];
  objc_msgSend(v3, "xpc_tryPIN:forDevice:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)_sharingDeviceForIncomingDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self _deviceForIncomingDevice:v4 needsReady:0];
  id v6 = [(DEDController *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(DEDController *)(uint64_t)v4 _sharingDeviceForIncomingDevice:v6];
  }

  return v5;
}

- (id)_deviceForIncomingDevice:(id)a3 needsReady:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(DEDController *)v7 devices];
  uint64_t v9 = [v6 hashingKey];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    id v11 = [(DEDController *)v7 log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "could not match device by transport-identifier, trying address", buf, 2u);
    }

    id v12 = [(DEDController *)v7 devices];
    uint64_t v13 = [v12 allValues];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __53__DEDController__deviceForIncomingDevice_needsReady___block_invoke;
    long long v24 = &unk_26453AA90;
    id v14 = v6;
    id v25 = v14;
    BOOL v26 = a4;
    v10 = objc_msgSend(v13, "ded_findWithBlock:", &v21);

    if (v10)
    {
      id v15 = [(DEDController *)v7 log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v14 description];
        *(_DWORD *)buf = 138543362;
        v28 = v16;
        _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_DEFAULT, "matched device by address on [%{public}@]", buf, 0xCu);
      }
    }
  }
  objc_sync_exit(v7);

  uint64_t v17 = [(DEDController *)v7 log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v6 publicLogSafeIdentifier];
    __int16 v19 = [v10 publicLogSafeIdentifier];
    *(_DWORD *)buf = 138543618;
    v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    _os_log_impl(&dword_21FE04000, v17, OS_LOG_TYPE_INFO, "device for incoming device %{public}@ -> %{public}@", buf, 0x16u);
  }
  return v10;
}

uint64_t __53__DEDController__deviceForIncomingDevice_needsReady___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 remoteTransport];
  if (v4 == [*(id *)(a1 + 32) remoteTransport])
  {
    uint64_t v5 = [v3 address];
    id v6 = [*(id *)(a1 + 32) address];
    unsigned int v7 = [v5 isEqualToString:v6];

    int v8 = *(unsigned __int8 *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7;
    }
    if (v8 && v7) {
      uint64_t v9 = [v3 status] == 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)hasDevice:(id)a3
{
  id v3 = [(DEDController *)self _deviceForIncomingDevice:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_deviceForIncomingDevice:(id)a3
{
  return [(DEDController *)self _deviceForIncomingDevice:a3 needsReady:0];
}

- (void)startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 target:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(DEDController *)self logDeviceCounts];
  id v14 = +[DEDDevice currentDevice];
  id v15 = DEDSessionStartLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [v14 name];
    uint64_t v17 = [v12 name];
    uint64_t v18 = [v12 address];
    int v19 = 136316162;
    long long v20 = "-[DEDController startBugSessionWithIdentifier:configuration:target:completion:]";
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    long long v24 = v16;
    __int16 v25 = 2112;
    BOOL v26 = v17;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_debug_impl(&dword_21FE04000, v15, OS_LOG_TYPE_DEBUG, "%s %@:%@ -> %@ (%@)", (uint8_t *)&v19, 0x34u);
  }
  if (v10 && v13)
  {
    [(DEDController *)self addSessionStartCompletion:v13 withIdentifier:v10 configuration:v11 targetDevice:v12];
    [(DEDController *)self startBugSessionWithIdentifier:v10 configuration:v11 caller:v14 target:v12 fromInbound:0];
  }
}

- (id)sessionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(DEDController *)v5 sessions];
  unsigned int v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v7;
}

- (void)insertNewSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDController insertNewSession:](v4, v5);
  }

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
  int v8 = [(DEDController *)v6 sessions];
  uint64_t v9 = (void *)[v7 initWithDictionary:v8];

  id v10 = [v4 identifier];
  [v9 setObject:v4 forKeyedSubscript:v10];

  id v11 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v9];
  [(DEDController *)v6 setSessions:v11];

  objc_sync_exit(v6);
}

- (void)removeSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDController removeSessionWithIdentifier:]();
  }

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
  int v8 = [(DEDController *)v6 sessions];
  uint64_t v9 = (void *)[v7 initWithDictionary:v8];

  [v9 removeObjectForKey:v4];
  id v10 = [NSDictionary dictionaryWithDictionary:v9];
  [(DEDController *)v6 setSessions:v10];

  objc_sync_exit(v6);
}

- (id)knownSessions
{
  uint64_t v2 = [(DEDController *)self sessions];
  id v3 = [v2 allKeys];

  return v3;
}

- (void)reset
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(DEDController *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[DEDController reset]";
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(DEDController *)self sessions];
  uint64_t v5 = [v4 allValues];

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
        [(DEDController *)self abortSession:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)listXPCConnections:(id)a3
{
  id v4 = a3;
  [(DEDController *)self setXpcConnectionsCompletion:v4];
  objc_initWeak(&location, self);
  uint64_t v5 = [(DEDController *)self replyQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__DEDController_listXPCConnections___block_invoke;
  v6[3] = &unk_26453A9F0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __36__DEDController_listXPCConnections___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained xpcConnector];
  uint64_t v2 = [v1 diagnosticextensionsdXPCInterface];
  objc_msgSend(v2, "xpc_listClientXPCConnections");
}

- (void)abortSession:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DEDController *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDController abortSession:withCompletion:](v8, v9, v10);
  }

  if (v7)
  {
    long long v11 = [(DEDController *)self didCancelCompletion];

    if (v11)
    {
      long long v12 = [(DEDController *)self log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "will overwrite previous DEDDidCancelSessionCompletion block", v17, 2u);
      }
    }
    [(DEDController *)self setDidCancelCompletion:v7];
  }
  long long v13 = [v6 identifier];
  if (v13)
  {
    id v14 = [(DEDController *)self sessions];
    id v15 = [v14 objectForKey:v13];

    if (!v15)
    {
      id v16 = [(DEDController *)self log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DEDController abortSession:withCompletion:]();
      }
    }
    [v15 cancel];
  }
}

- (void)abortSession:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 identifier];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "Aborting session %@", (uint8_t *)&v7, 0xCu);
  }
  [(DEDController *)self abortSession:v4 withCompletion:0];
}

- (void)_didAbortSessionWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self didCancelCompletion];

  if (v5)
  {
    id v6 = [(DEDController *)self didCancelCompletion];
    int v7 = [(DEDController *)self replyQueue];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    long long v11 = __40__DEDController__didAbortSessionWithID___block_invoke;
    long long v12 = &unk_26453A5E8;
    id v14 = v6;
    id v13 = v4;
    id v8 = v6;
    dispatch_async(v7, &v9);

    -[DEDController setDidCancelCompletion:](self, "setDidCancelCompletion:", 0, v9, v10, v11, v12);
  }
}

uint64_t __40__DEDController__didAbortSessionWithID___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)hasActiveSessionForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(DEDController *)self setSessionExistsCompletion:v7];
  id v8 = [(DEDController *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Retrieving active session: %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v9 = [(DEDController *)self replyQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__DEDController_hasActiveSessionForIdentifier_completion___block_invoke;
  v11[3] = &unk_26453AA40;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __58__DEDController_hasActiveSessionForIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 diagnosticextensionsdXPCInterface];
  objc_msgSend(v3, "xpc_hasActiveSession:", *(void *)(a1 + 32));
}

- (BOOL)hasRecentlyFinishedSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self recentlyFinishedSessions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__DEDController_hasRecentlyFinishedSessionWithIdentifier___block_invoke;
  v10[3] = &unk_26453AAB8;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "ded_findWithBlock:", v10);
  BOOL v8 = v7 != 0;

  return v8;
}

uint64_t __58__DEDController_hasRecentlyFinishedSessionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

- (void)forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DEDController *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 2) {
      id v11 = "Unknown";
    }
    else {
      id v11 = off_26453AD00[a3];
    }
    *(_DWORD *)buf = 136446722;
    long long v20 = v11;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Force removing notification of type [%{public}s] identifier [%{public}@] app [%{public}@]", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  id v12 = [(DEDController *)self replyQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__DEDController_forceRemoveNotificationOfType_identifier_hostIdentifier___block_invoke;
  v15[3] = &unk_26453AAE0;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a3;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __73__DEDController_forceRemoveNotificationOfType_identifier_hostIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 diagnosticextensionsdXPCInterface];
  objc_msgSend(v3, "xpc_forceRemoveNotificationOfType:identifier:hostIdentifier:", *(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)connector:(id)a3 didLooseConnectionToProcessWithPid:(int)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v6 = [(DEDController *)self isDaemon];
  id v7 = [(DEDController *)self log];
  id v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DEDController connector:didLooseConnectionToProcessWithPid:]();
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a4;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Daemon DED Controller lost connection to app with pid [%i]", (uint8_t *)v10, 8u);
  }

  if ([(DEDController *)self useSharing])
  {
    id v9 = [(DEDController *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "Daemon DED Controller will stop discovery", (uint8_t *)v10, 2u);
    }

    id v8 = [(DEDController *)self sharingConnection];
    [v8 stopDiscovery];
LABEL_10:
  }
}

- (id)connector:(id)a3 needsXPCInboundForPid:(id)a4
{
  id v5 = a4;
  BOOL v6 = [[DEDXPCInbound alloc] initWithDelegate:self senderPid:v5];

  return v6;
}

- (void)xpcInbound_forceRemoveNotificationOfType:(int64_t)a3 identifier:(id)a4 hostIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 2)
  {
    uint64_t v11 = DEDFollowUpNotifier;
LABEL_9:
    [(__objc2_class *)v11 forceRemoveNotificationWithIdentifier:v8 hostIdentifier:v9];
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    uint64_t v11 = DEDUserNotificationNotifier;
    goto LABEL_9;
  }
  if (a3)
  {
    id v12 = [(DEDController *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[DEDController xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:](a3, v12);
    }
  }
  else
  {
    id v10 = [(DEDController *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDController xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:]();
    }
  }
LABEL_13:
}

- (void)xpcInbound_ping:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DEDController *)self replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DEDController_xpcInbound_ping___block_invoke;
  block[3] = &unk_26453AA40;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__DEDController_xpcInbound_ping___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_pong");
}

- (void)xpcInbound_pong
{
  objc_initWeak(&location, self);
  id v3 = [(DEDController *)self replyQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__DEDController_xpcInbound_pong__block_invoke;
  v4[3] = &unk_26453A9F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__DEDController_xpcInbound_pong__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained pongBlock];

  if (v3)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v4 = [v5 pongBlock];
    v4[2]();
  }
}

- (void)xpcInbound_discoverAllAvailableDevices:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, self);
  id v6 = [(DEDController *)self log];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "'Will start device discovery", buf, 2u);
  }

  id v7 = [(DEDController *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke;
  block[3] = &unk_26453AA68;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  uint64_t v11 = self;
  id v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke(id *a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id location = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v2 = [WeakRetained log];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Starting device discovery", buf, 2u);
  }

  group = dispatch_group_create();
  id v3 = objc_loadWeakRetained(location);
  int v4 = [v3 useIDS];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(location);
    id v6 = [v5 idsConnection];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_41;
    v54[3] = &unk_26453AB08;
    objc_copyWeak(&v56, location);
    id v55 = a1[4];
    [v6 setDeviceCallback:v54];

    id v7 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_3;
    block[3] = &unk_26453A9F0;
    objc_copyWeak(&v53, location);
    dispatch_group_async(group, v7, block);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&v56);
  }
  id v8 = objc_loadWeakRetained(location);
  int v9 = [v8 useSharing];

  if (v9)
  {
    id v10 = objc_loadWeakRetained(location);
    uint64_t v11 = [v10 sharingConnection];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_5;
    v49[3] = &unk_26453AB08;
    objc_copyWeak(&v51, location);
    id v50 = a1[4];
    [v11 setDeviceDiscoveryCallback:v49];

    id v12 = objc_loadWeakRetained(location);
    id v13 = [v12 log];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_INFO, "Starting sharing...", buf, 2u);
    }

    id v14 = dispatch_get_global_queue(21, 0);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_43;
    v46[3] = &unk_26453AA40;
    objc_copyWeak(&v48, location);
    id v47 = a1[4];
    dispatch_group_async(group, v14, v46);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v51);
  }
  dispatch_time_t v15 = dispatch_time(0, 0xDF8476000);
  dispatch_group_wait(group, v15);
  id obj = a1[5];
  objc_sync_enter(obj);
  id v16 = objc_loadWeakRetained(location);
  id v17 = [v16 log];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = objc_loadWeakRetained(location);
    int v19 = [v18 devices];
    long long v20 = [v19 allKeys];
    uint64_t v21 = [v20 count];
    *(_DWORD *)buf = 134217984;
    *(void *)v58 = v21;
    _os_log_impl(&dword_21FE04000, v17, OS_LOG_TYPE_DEFAULT, "discovered devices [%lu]", buf, 0xCu);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = objc_loadWeakRetained(location);
  __int16 v23 = [v22 devices];
  id v24 = [v23 allValues];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v24);
        }
        v28 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v29 = objc_loadWeakRetained(location);
        uint64_t v30 = [v29 log];

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = [v28 transport];
          v32 = [v28 publicLogSafeIdentifier];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = v31;
          *(_WORD *)&v58[4] = 2114;
          *(void *)&v58[6] = v32;
          _os_log_impl(&dword_21FE04000, v30, OS_LOG_TYPE_DEFAULT, "discovered [%i-%{public}@]", buf, 0x12u);
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
    }
    while (v25);
  }

  objc_sync_exit(obj);
  id v33 = objc_loadWeakRetained(location);
  v34 = [v33 replyQueue];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_45;
  v39[3] = &unk_26453AA40;
  objc_copyWeak(&v41, location);
  id v40 = a1[4];
  dispatch_async(v34, v39);

  objc_destroyWeak(&v41);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addDevice:v3];

  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [v5 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2;
  block[3] = &unk_26453AA68;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_gotDeviceUpdate:", *(void *)(a1 + 40));
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained idsConnection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_4;
  v4[3] = &unk_26453AB30;
  objc_copyWeak(&v5, v1);
  [v3 discoverDevicesWithCompletion:v4];

  objc_destroyWeak(&v5);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    id v7 = (id *)(a1 + 32);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained(v7);
        [WeakRetained addDevice:v9];

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addDevice:v3];

  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [v5 replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_6;
  block[3] = &unk_26453AA68;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_gotDeviceUpdate:", *(void *)(a1 + 40));
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_43(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained sharingConnection];
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2_44;
  v6[3] = &unk_26453AB30;
  objc_copyWeak(&v7, v2);
  [v4 discoverDevicesFromInbound:v5 withCompletion:v6];

  objc_destroyWeak(&v7);
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_2_44(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    id v7 = (id *)(a1 + 32);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained(v7);
        [WeakRetained addDevice:v9];

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __56__DEDController_xpcInbound_discoverAllAvailableDevices___block_invoke_45(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained xpcConnector];
  uint64_t v4 = [v3 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 allKnownDevices];
  objc_msgSend(v4, "xpc_didDiscoverDevices:", v6);
}

- (void)xpcInbound_gotDeviceUpdate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DEDController *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)buf = 138412546;
    long long v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 status];
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "Update: %@ status %ld", buf, 0x16u);
  }
  [(DEDController *)self addDevice:v4];
  objc_initWeak((id *)buf, self);
  id v7 = [(DEDController *)self replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__DEDController_xpcInbound_gotDeviceUpdate___block_invoke;
  block[3] = &unk_26453A9F0;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __44__DEDController_xpcInbound_gotDeviceUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained devicesCompletion];

  id v4 = objc_loadWeakRetained(v1);
  id v9 = v4;
  if (v3)
  {
    id v5 = [v4 devicesCompletion];
    id v6 = objc_loadWeakRetained(v1);
    id v7 = [v6 allKnownDevices];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
  else
  {
    uint64_t v8 = [v4 log];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "discovered devices, no completion block registered", buf, 2u);
    }
  }
}

- (void)xpcInbound_didDiscoverDevices:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        [(DEDController *)self addDevice:*(void *)(*((void *)&v12 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  objc_initWeak(&location, self);
  uint64_t v8 = [(DEDController *)self replyQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__DEDController_xpcInbound_didDiscoverDevices___block_invoke;
  v9[3] = &unk_26453A9F0;
  objc_copyWeak(&v10, &location);
  dispatch_async(v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __47__DEDController_xpcInbound_didDiscoverDevices___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained devicesCompletion];

  id v4 = objc_loadWeakRetained(v1);
  id v9 = v4;
  if (v3)
  {
    uint64_t v5 = [v4 devicesCompletion];
    id v6 = objc_loadWeakRetained(v1);
    uint64_t v7 = [v6 allKnownDevices];
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
  else
  {
    uint64_t v8 = [v4 log];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "discovered devices, no completion block registered", buf, 2u);
    }
  }
}

- (void)xpcInbound_stopDeviceDiscovery:(id)a3
{
  if ([(DEDController *)self useSharing])
  {
    id v4 = [(DEDController *)self sharingConnection];
    [v4 stopDiscovery];
  }
}

- (void)xpcInbound_hasActiveSession:(id)a3 fromInbound:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DEDController *)self sessions];
  id v9 = [v8 objectForKeyedSubscript:v6];

  objc_initWeak(&location, self);
  id v10 = [(DEDController *)self replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DEDController_xpcInbound_hasActiveSession_fromInbound___block_invoke;
  block[3] = &unk_26453AB58;
  objc_copyWeak(&v16, &location);
  id v14 = v7;
  id v15 = v6;
  BOOL v17 = v9 != 0;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __57__DEDController_xpcInbound_hasActiveSession_fromInbound___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_hasActiveSessionReply:isActive:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (void)xpcInbound_hasActiveSessionReply:(id)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(DEDController *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"No";
    if (v4) {
      uint64_t v8 = @"Yes";
    }
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    BOOL v17 = v8;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Session %{public}@ is active %{public}@", buf, 0x16u);
  }

  id v9 = [(DEDController *)self sessionExistsCompletion];

  if (v9)
  {
    objc_initWeak((id *)buf, self);
    id v10 = [(DEDController *)self replyQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__DEDController_xpcInbound_hasActiveSessionReply_isActive___block_invoke;
    v11[3] = &unk_26453AB80;
    objc_copyWeak(&v12, (id *)buf);
    BOOL v13 = v4;
    dispatch_async(v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __59__DEDController_xpcInbound_hasActiveSessionReply_isActive___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = [WeakRetained sessionExistsCompletion];
  v4[2](v4, *(unsigned __int8 *)(a1 + 40));

  id v5 = objc_loadWeakRetained(v2);
  [v5 setSessionExistsCompletion:0];
}

- (void)xpc_listClientXPCConnectionsFromInbound:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDController *)self xpcConnector];
  id v6 = [v5 clientConnections];

  objc_initWeak(&location, self);
  id v7 = [(DEDController *)self replyQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __57__DEDController_xpc_listClientXPCConnectionsFromInbound___block_invoke;
  v10[3] = &unk_26453AA68;
  objc_copyWeak(&v13, &location);
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __57__DEDController_xpc_listClientXPCConnectionsFromInbound___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_listClientXPCConnectionsReply:", *(void *)(a1 + 40));
}

- (void)xpcInbound_listClientXPCConnectionsReply:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDController *)self xpcConnectionsCompletion];

  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(DEDController *)self replyQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__DEDController_xpcInbound_listClientXPCConnectionsReply___block_invoke;
    block[3] = &unk_26453AA40;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __58__DEDController_xpcInbound_listClientXPCConnectionsReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained xpcConnectionsCompletion];
  v4[2](v4, *(void *)(a1 + 32));

  id v5 = objc_loadWeakRetained(v2);
  [v5 setXpcConnectionsCompletion:0];
}

- (void)xpcInbound_startPairSetupForDevice:(id)a3 fromInbound:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDController *)self _sharingDeviceForIncomingDevice:v6];
  if ([v8 transport] == 3)
  {
    id v9 = [(DEDController *)self sharingConnection];
    [v9 sharing_startPairSetupForDevice:v8 fromInbound:v7];
  }
  else
  {
    id v9 = [(DEDController *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDController xpcInbound_startPairSetupForDevice:fromInbound:]();
    }
  }
}

- (void)xpcInbound_promptPINForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDController *)self pairingDelegate];

  if (v5)
  {
    id v6 = [(DEDController *)self _sharingDeviceForIncomingDevice:v4];
    if ([v6 transport] == 2)
    {
      objc_initWeak(&location, self);
      id v7 = [(DEDController *)self replyQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__DEDController_xpcInbound_promptPINForDevice___block_invoke;
      block[3] = &unk_26453AA40;
      objc_copyWeak(&v11, &location);
      id v6 = v6;
      id v10 = v6;
      dispatch_async(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      id v8 = [(DEDController *)self log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[DEDController xpcInbound_promptPINForDevice:]();
      }
    }
  }
  else
  {
    id v6 = [(DEDController *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DEDController xpcInbound_promptPINForDevice:]();
    }
  }
}

void __47__DEDController_xpcInbound_promptPINForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained pairingDelegate];
  [v2 promptPINForDevice:*(void *)(a1 + 32)];
}

- (void)xpcInbound_tryPIN:(id)a3 forDevice:(id)a4 fromInbound:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDController *)self _sharingDeviceForIncomingDevice:v9];
  if ([v11 transport] == 3)
  {
    id v12 = [(DEDController *)self sharingConnection];
    [v12 sharing_tryPIN:v8 forDevice:v9 fromInbound:v10];
  }
  else
  {
    id v12 = [(DEDController *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DEDController xpcInbound_tryPIN:forDevice:fromInbound:]();
    }
  }
}

- (void)xpcInbound_successPINForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDController *)self _sharingDeviceForIncomingDevice:v4];
  if ([v5 transport] == 2)
  {
    objc_initWeak(&location, self);
    id v6 = [(DEDController *)self replyQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__DEDController_xpcInbound_successPINForDevice___block_invoke;
    block[3] = &unk_26453AA40;
    objc_copyWeak(&v10, &location);
    id v9 = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = [(DEDController *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DEDController xpcInbound_successPINForDevice:]();
    }
  }
}

void __48__DEDController_xpcInbound_successPINForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained pairingDelegate];
  [v2 successPINForDevice:*(void *)(a1 + 32)];
}

- (void)sharingInbound_promptPINForDevice:(id)a3 fromInbound:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDController *)self _sharingDeviceForIncomingDevice:v6];
  if ([v8 transport] == 3)
  {
    objc_initWeak(&location, self);
    id v9 = [(DEDController *)self replyQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__DEDController_sharingInbound_promptPINForDevice_fromInbound___block_invoke;
    v11[3] = &unk_26453AA68;
    objc_copyWeak(&v14, &location);
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [(DEDController *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDController sharingInbound_promptPINForDevice:fromInbound:]();
    }
  }
}

void __63__DEDController_sharingInbound_promptPINForDevice_fromInbound___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_promptPINForDevice:", *(void *)(a1 + 40));
}

- (void)sharingInbound_successPINForDevice:(id)a3 fromInbound:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDController *)self _sharingDeviceForIncomingDevice:v6];
  if ([v8 transport] == 3)
  {
    objc_initWeak(&location, self);
    id v9 = [(DEDController *)self replyQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__DEDController_sharingInbound_successPINForDevice_fromInbound___block_invoke;
    v11[3] = &unk_26453AA68;
    objc_copyWeak(&v14, &location);
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [(DEDController *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDController sharingInbound_successPINForDevice:fromInbound:]();
    }
  }
}

void __64__DEDController_sharingInbound_successPINForDevice_fromInbound___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_successPINForDevice:", *(void *)(a1 + 40));
}

- (void)sharingInbound_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
}

- (void)idsInbound_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6
{
}

- (void)idsInbound_devicesChanged:(id)a3
{
}

- (void)idsInbound_devicesChanged:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__DEDController_idsInbound_devicesChanged_completion___block_invoke;
  block[3] = &unk_26453ABA8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __54__DEDController_idsInbound_devicesChanged_completion___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v30 = *(id *)(a1 + 32);
  objc_sync_enter(v30);
  int v31 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:10];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) devices];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v4)
  {
    uint64_t v33 = *(void *)v40;
    id obj = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v7 = (void *)MEMORY[0x223C5FD90]();
        if ([v6 remoteTransport] == 4)
        {
          id v8 = *(void **)(a1 + 40);
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_53;
          v38[3] = &unk_26453AA18;
          v38[4] = v6;
          id v9 = objc_msgSend(v8, "ded_findWithBlock:", v38);
          if (v9)
          {
            id v10 = [v6 name];
            id v11 = [v9 name];
            char v12 = [v10 isEqualToString:v11];

            if ((v12 & 1) == 0)
            {
              id v13 = [*(id *)(a1 + 32) log];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                id v14 = [v6 hashingKey];
                id v15 = [v6 name];
                __int16 v16 = [v9 name];
                *(_DWORD *)buf = 138543875;
                long long v45 = v14;
                __int16 v46 = 2113;
                id v47 = v15;
                __int16 v48 = 2113;
                v49 = v16;
                _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEFAULT, "idsInbound_devicesChanged: Device [%{public}@], change [%{private}@] -> [%{private}@]", buf, 0x20u);
              }
              BOOL v17 = [v9 name];
              [v6 setName:v17];
            }
          }
          else
          {
            long long v20 = [*(id *)(a1 + 32) log];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = [v6 hashingKey];
              *(_DWORD *)buf = 138543362;
              long long v45 = v21;
              _os_log_impl(&dword_21FE04000, v20, OS_LOG_TYPE_DEFAULT, "idsInbound_devicesChanged: Will remove device [%{public}@]", buf, 0xCu);
            }
            [v31 addObject:v6];
          }
        }
        else
        {
          uint64_t v18 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            int v19 = [v6 hashingKey];
            __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_cold_1(v19, v50, &v51, v18);
          }
        }
      }
      id v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v4);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v31;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        __int16 v27 = [*(id *)(a1 + 32) devices];
        v28 = [v26 hashingKey];
        [v27 removeObjectForKey:v28];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v23);
  }

  objc_sync_exit(v30);
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = [a2 address];
  uint64_t v4 = [*(id *)(a1 + 32) address];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6 fromInbound:(id)a7
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v89 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  if (![(DEDController *)self induceTimeOutIfNeededAndReturnCanProceedWithDevice:v14 sessionId:v12])goto LABEL_67; {
  [(DEDController *)self logDeviceCounts];
  }
  if (!v14)
  {
    uint64_t v23 = DEDSessionStartLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:]();
    }
    goto LABEL_12;
  }
  __int16 v16 = [(DEDController *)self _deviceForIncomingDevice:v14 needsReady:1];
  if (!v16)
  {
    uint64_t v23 = DEDSessionStartLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [v14 hashingKey];
      -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:](v24, buf, v23);
    }
LABEL_12:

    uint64_t v25 = DEDSessionStartLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:]();
    }

    uint64_t v26 = [(DEDController *)self replyQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke;
    block[3] = &unk_26453AA68;
    objc_copyWeak(&v134, &location);
    id v132 = v12;
    id v133 = 0;
    dispatch_async(v26, block);

    objc_destroyWeak(&v134);
    goto LABEL_67;
  }
  BOOL v17 = [v13 requestedCapabilities];
  char v18 = [v14 hasCapabilities:v17];

  if (v18)
  {
    int v19 = DEDSessionStartLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [v14 identifier];
      unint64_t v21 = [v14 transport];
      if (v21 > 4) {
        id v22 = "Unknown";
      }
      else {
        id v22 = off_26453AD88[v21];
      }
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2114;
      v143 = (uint64_t (*)(uint64_t, uint64_t))v12;
      _os_log_impl(&dword_21FE04000, v19, OS_LOG_TYPE_DEFAULT, "inTarget device: [%{public}@] - [%{public}s] - [%{public}@]", buf, 0x20u);
    }
    id v30 = DEDSessionStartLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = [v16 identifier];
      unint64_t v32 = [v16 transport];
      if (v32 > 4) {
        uint64_t v33 = "Unknown";
      }
      else {
        uint64_t v33 = off_26453AD88[v32];
      }
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2114;
      v143 = (uint64_t (*)(uint64_t, uint64_t))v12;
      _os_log_impl(&dword_21FE04000, v30, OS_LOG_TYPE_DEFAULT, "target device: [%{public}@] - [%{public}s] - [%{public}@]", buf, 0x20u);
    }
    long long v34 = DEDSessionStartLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v80 = [v89 name];
      v81 = [v16 name];
      v82 = [v16 address];
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v143 = v80;
      *(_WORD *)v144 = 2112;
      *(void *)&v144[2] = v81;
      *(_WORD *)&v144[10] = 2112;
      *(void *)&v144[12] = v82;
      _os_log_debug_impl(&dword_21FE04000, v34, OS_LOG_TYPE_DEBUG, "%s %@:%@ -> %@ (%@)", buf, 0x34u);
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v143 = __Block_byref_object_copy__0;
    *(void *)v144 = __Block_byref_object_dispose__0;
    *(void *)&v144[8] = 0;
    long long v35 = [(DEDController *)self sessions];
    long long v36 = [v35 objectForKeyedSubscript:v12];

    if (v36)
    {
      long long v37 = DEDSessionStartLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v136 = 138543362;
        id v137 = v12;
        _os_log_impl(&dword_21FE04000, v37, OS_LOG_TYPE_DEFAULT, "found existing session [%{public}@]", v136, 0xCu);
      }

      v38 = [(DEDController *)self sessions];
      uint64_t v39 = [v38 objectForKeyedSubscript:v12];
      long long v40 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v39;

      if ([*(id *)(*(void *)&buf[8] + 40) hasCapability:@"mutable-bug-session"])objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "setConfig:", v13); {
    }
      }
    else
    {
      long long v41 = DEDSessionStartLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v136 = 138543362;
        id v137 = v12;
        _os_log_impl(&dword_21FE04000, v41, OS_LOG_TYPE_DEFAULT, "creating new session [%{public}@]", v136, 0xCu);
      }

      long long v42 = [[DEDBugSession alloc] initWithConfiguration:v13];
      long long v43 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v42;

      [*(id *)(*(void *)&buf[8] + 40) setIdentifier:v12];
      long long v44 = [v16 identifier];
      [*(id *)(*(void *)&buf[8] + 40) setDeviceIdentifier:v44];
    }
    long long v45 = [(DEDController *)self bugSessionCallbackQueue];
    [*(id *)(*(void *)&buf[8] + 40) setCallbackQueue:v45];

    [*(id *)(*(void *)&buf[8] + 40) didStart];
    v140[0] = @"DEDExtensionIdentifierManager";
    __int16 v46 = [*(id *)(*(void *)&buf[8] + 40) identifierManager];
    id v47 = [v46 JSONRepresentation];
    v140[1] = @"identifier";
    v141[0] = v47;
    v141[1] = v12;
    __int16 v48 = [NSDictionary dictionaryWithObjects:v141 forKeys:v140 count:2];

    v49 = DEDSessionStartLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = [*(id *)(*(void *)&buf[8] + 40) identifier];
      *(_DWORD *)v136 = 138543618;
      id v137 = v50;
      __int16 v138 = 2114;
      v139 = v48;
      _os_log_impl(&dword_21FE04000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting with sessionSyncData [%{public}@]", v136, 0x16u);
    }
    v118[0] = MEMORY[0x263EF8330];
    v118[1] = 3221225472;
    v118[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_78;
    v118[3] = &unk_26453ABF8;
    v125 = buf;
    v119 = @"DEDExtensionIdentifierManager";
    id v51 = v12;
    id v120 = v51;
    objc_copyWeak(&v126, &location);
    id v52 = v89;
    id v121 = v52;
    id v88 = v16;
    id v122 = v88;
    id v84 = v15;
    id v123 = v84;
    id v86 = v48;
    id v124 = v86;
    v87 = (void *)MEMORY[0x223C5FFB0](v118);
    [(DEDController *)self addDidStartSessionCompletion:v87 withIdentifier:v51];
    if ([v52 transport] == 1)
    {
      uint64_t v53 = objc_alloc_init(DEDLocalTransport);
      v54 = [(DEDController *)self clientDelegate];
      [(DEDLocalTransport *)v53 setClientDelegate:v54];

      [*(id *)(*(void *)&buf[8] + 40) setClient:v53];
    }
    else if ([v52 transport] == 2)
    {
      id v55 = [DEDXPCOutbound alloc];
      uint64_t v53 = [(DEDController *)self xpcConnector];
      id v56 = [(DEDLocalTransport *)v53 clientXPCInterfaceFromInbound:v84];
      v57 = [(DEDXPCOutbound *)v55 initWithRemoteObject:v56];
      [*(id *)(*(void *)&buf[8] + 40) setClient:v57];
    }
    else if ([v52 transport] == 4)
    {
      uint64_t v53 = [v52 address];
      v58 = [(DEDController *)self idsConnection];
      v59 = +[DEDIDSOutbound outboundWithSessionID:v51 withDeviceAtAddress:v53 connection:v58];
      [*(id *)(*(void *)&buf[8] + 40) setClient:v59];
    }
    else if ([v52 transport] == 3)
    {
      uint64_t v60 = [(DEDController *)self sharingConnection];
      v61 = [v60 sharingOutboundForBugSessionIdentifier:v51 device:v52 fromInbound:v84];
      [*(id *)(*(void *)&buf[8] + 40) setClient:v61];

      v62 = [*(id *)(*(void *)&buf[8] + 40) client];
      BOOL v63 = v62 == 0;

      if (!v63)
      {
LABEL_50:
        v85 = +[DEDDevice currentDevice];
        if ([v88 transport] == 1)
        {
          v64 = objc_alloc_init(DEDLocalTransport);
          v65 = [(DEDController *)self workerDelegate];
          [(DEDLocalTransport *)v64 setWorkerDelegate:v65];

          [*(id *)(*(void *)&buf[8] + 40) setWorker:v64];
          v66 = [(DEDController *)self replyQueue];
          v114[0] = MEMORY[0x263EF8330];
          v114[1] = 3221225472;
          v114[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_84;
          v114[3] = &unk_26453AA68;
          objc_copyWeak(&v117, &location);
          id v115 = v51;
          id v116 = v86;
          dispatch_async(v66, v114);

          objc_destroyWeak(&v117);
        }
        else if ([v88 transport] == 2)
        {
          v67 = [(DEDController *)self replyQueue];
          v107[0] = MEMORY[0x263EF8330];
          v107[1] = 3221225472;
          v107[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_85;
          v107[3] = &unk_26453AC20;
          objc_copyWeak(&v113, &location);
          v112 = buf;
          id v108 = v51;
          id v109 = v13;
          id v110 = v85;
          id v111 = v88;
          dispatch_async(v67, v107);

          objc_destroyWeak(&v113);
        }
        else if ([v88 transport] == 4)
        {
          v68 = [v88 address];
          v69 = [(DEDController *)self idsConnection];
          v70 = +[DEDIDSOutbound outboundWithSessionID:v51 withDeviceAtAddress:v68 connection:v69];
          [*(id *)(*(void *)&buf[8] + 40) setWorker:v70];

          v71 = [(DEDController *)self replyQueue];
          v101[0] = MEMORY[0x263EF8330];
          v101[1] = 3221225472;
          v101[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2_86;
          v101[3] = &unk_26453AC48;
          objc_copyWeak(&v106, &location);
          id v102 = v51;
          id v103 = v13;
          id v104 = v85;
          id v105 = v88;
          dispatch_async(v71, v101);

          objc_destroyWeak(&v106);
        }
        else if ([v88 transport] == 3)
        {
          v72 = [(DEDController *)self sharingConnection];
          v73 = [v72 sharingOutboundForBugSessionIdentifier:v51 device:v88 fromInbound:v84];

          if (v73)
          {
            [*(id *)(*(void *)&buf[8] + 40) setWorker:v73];
            v74 = [(DEDController *)self replyQueue];
            v94[0] = MEMORY[0x263EF8330];
            v94[1] = 3221225472;
            v94[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3_87;
            v94[3] = &unk_26453AC70;
            v75 = &v100;
            objc_copyWeak(&v100, &location);
            id v95 = v51;
            id v96 = v13;
            v97 = v85;
            id v98 = v88;
            id v99 = v84;
            dispatch_async(v74, v94);

            v76 = &v95;
            v77 = &v96;
            v78 = v97;
          }
          else
          {
            v83 = DEDSessionStartLog();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v136 = 0;
              _os_log_impl(&dword_21FE04000, v83, OS_LOG_TYPE_DEFAULT, "Bug session start failed. Could not find sharing outbound on worker", v136, 2u);
            }

            v78 = [(DEDController *)self replyQueue];
            v90[0] = MEMORY[0x263EF8330];
            v90[1] = 3221225472;
            v90[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_88;
            v90[3] = &unk_26453AA68;
            v75 = &v93;
            objc_copyWeak(&v93, &location);
            v76 = &v91;
            id v91 = v51;
            v77 = &v92;
            id v92 = v88;
            dispatch_async(v78, v90);
          }

          objc_destroyWeak(v75);
        }
        else
        {
          v79 = [(DEDController *)self log];
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.4();
          }
        }
        objc_destroyWeak(&v126);

        _Block_object_dispose(buf, 8);
        goto LABEL_67;
      }
      DEDSessionStartLog();
      uint64_t v53 = (DEDLocalTransport *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v53->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v136 = 0;
        _os_log_impl(&dword_21FE04000, &v53->super, OS_LOG_TYPE_DEFAULT, "Bug session start failed. Could not find sharing outbound on client", v136, 2u);
      }
    }
    else
    {
      uint64_t v53 = [(DEDController *)self log];
      if (os_log_type_enabled(&v53->super, OS_LOG_TYPE_ERROR)) {
        -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.5();
      }
    }

    goto LABEL_50;
  }
  __int16 v27 = DEDSessionStartLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    -[DEDController startBugSessionWithIdentifier:configuration:caller:target:fromInbound:].cold.6();
  }

  v28 = [(DEDController *)self replyQueue];
  v127[0] = MEMORY[0x263EF8330];
  v127[1] = 3221225472;
  v127[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_63;
  v127[3] = &unk_26453AA68;
  objc_copyWeak(&v130, &location);
  id v128 = v12;
  id v129 = v16;
  id v29 = v16;
  dispatch_async(v28, v127);

  objc_destroyWeak(&v130);
LABEL_67:
  objc_destroyWeak(&location);
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained hasCompletionBlockWithIdentifier:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    id v6 = +[DEDConfiguration sharedInstance];
    id v7 = [v6 errorDomain];
    id v12 = [v5 errorWithDomain:v7 code:102 userInfo:&unk_26D1AF710];

    id v8 = objc_loadWeakRetained(v2);
    id v9 = [v8 popSessionStartCompletionWithIdentifier:*(void *)(a1 + 32)];
    ((void (**)(void, void, id))v9)[2](v9, 0, v12);

    id v10 = [*(id *)(a1 + 40) productType];
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v10, [*(id *)(a1 + 40) isRemote], 0, 102);
  }
  else
  {
    id v11 = DEDSessionStartLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1();
    }
  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_63(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained hasCompletionBlockWithIdentifier:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    id v6 = +[DEDConfiguration sharedInstance];
    id v7 = [v6 errorDomain];
    id v12 = [v5 errorWithDomain:v7 code:103 userInfo:&unk_26D1AF738];

    id v8 = objc_loadWeakRetained(v2);
    id v9 = [v8 popSessionStartCompletionWithIdentifier:*(void *)(a1 + 32)];
    ((void (**)(void, void, id))v9)[2](v9, 0, v12);

    id v10 = [*(id *)(a1 + 40) productType];
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v10, [*(id *)(a1 + 40) isRemote], 0, 103);
  }
  else
  {
    id v11 = DEDSessionStartLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1();
    }
  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a2;
  +[DEDAnalytics didCreateBugSessionForApp:0];
  int v4 = DEDSessionStartLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) identifier];
    *(_DWORD *)buf = 138543618;
    id v51 = v5;
    __int16 v52 = 2114;
    id v53 = v3;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] in DEDDidStartSessionCompletion with sessionInfo [%{public}@]", buf, 0x16u);
  }
  id v6 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  DEDSessionStartLog();
  id v7 = (DEDExtensionIdentifierManager *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      id v51 = v9;
      _os_log_impl(&dword_21FE04000, &v7->super, OS_LOG_TYPE_DEFAULT, "Synchronizing extension identifiers [%{public}@]", buf, 0xCu);
    }

    id v7 = [[DEDExtensionIdentifierManager alloc] initWithJSONString:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setIdentifierManager:v7];
  }
  else if (v8)
  {
    id v10 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    id v51 = v10;
    _os_log_impl(&dword_21FE04000, &v7->super, OS_LOG_TYPE_DEFAULT, "DEDExtensionIdentifierManager not found in info dictionary for [%{public}@]. Cannot synchronize extension identifiers", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained insertNewSession:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

  id v12 = objc_loadWeakRetained((id *)(a1 + 88));
  int v13 = [v12 isDaemon];

  if (v13) {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) save];
  }
  if ([*(id *)(a1 + 48) transport] == 1)
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 88));
    id v15 = [v14 replyQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_80;
    block[3] = &unk_26453ABD0;
    __int16 v16 = &v49;
    objc_copyWeak(&v49, (id *)(a1 + 88));
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 80);
    id v46 = v17;
    uint64_t v48 = v18;
    id v47 = *(id *)(a1 + 56);
    dispatch_async(v15, block);

    int v19 = v46;
LABEL_19:

    objc_destroyWeak(v16);
    goto LABEL_20;
  }
  if ([*(id *)(a1 + 48) transport] == 2)
  {
    id v20 = objc_loadWeakRetained((id *)(a1 + 88));
    unint64_t v21 = [v20 replyQueue];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_81;
    v41[3] = &unk_26453AA68;
    __int16 v16 = &v44;
    objc_copyWeak(&v44, (id *)(a1 + 88));
    id v42 = *(id *)(a1 + 64);
    id v43 = *(id *)(a1 + 72);
    dispatch_async(v21, v41);

    int v19 = v42;
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 48) transport] == 4)
  {
    id v22 = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v23 = [v22 replyQueue];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2;
    v37[3] = &unk_26453AA68;
    __int16 v16 = &v40;
    objc_copyWeak(&v40, (id *)(a1 + 88));
    id v38 = *(id *)(a1 + 72);
    id v39 = *(id *)(a1 + 48);
    dispatch_async(v23, v37);

    int v19 = v38;
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 48) transport] == 3)
  {
    id v24 = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v25 = [v24 replyQueue];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3;
    v33[3] = &unk_26453AA68;
    __int16 v16 = &v36;
    objc_copyWeak(&v36, (id *)(a1 + 88));
    id v34 = *(id *)(a1 + 72);
    id v35 = *(id *)(a1 + 48);
    dispatch_async(v25, v33);

    int v19 = v34;
    goto LABEL_19;
  }
  uint64_t v26 = DEDSessionStartLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_78_cold_1(a1, v26, v27, v28, v29, v30, v31, v32);
  }

LABEL_20:
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_80(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = [WeakRetained hasCompletionBlockWithIdentifier:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 popSessionStartCompletionWithIdentifier:*(void *)(a1 + 32)];
    v6[2](v6, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);

    id v9 = [*(id *)(a1 + 40) productType];
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v9, [*(id *)(a1 + 40) isRemote], 1, 0);
  }
  else
  {
    id v7 = DEDSessionStartLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
      *(_DWORD *)buf = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session start returned but we have no completion block", buf, 0xCu);
    }
  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_81(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained xpcConnector];
  id v3 = [v2 clientXPCInterfaceFromInbound:*(void *)(a1 + 32)];
  objc_msgSend(v3, "xpc_didStartBugSessionWithInfo:", *(void *)(a1 + 40));
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained idsConnection];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) address];
  objc_msgSend(v2, "ids_didStartBugSessionWithInfo:forID:", v3, v4);
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained sharingConnection];
  objc_msgSend(v2, "sharing_didStartBugSessionWithInfo:forCaller:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_84(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = a1 + 32;
  int v4 = [WeakRetained popDidStartSessionCompletionWithIdentifier:*(void *)(a1 + 32)];

  id v5 = DEDSessionStartLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v14 = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "Replying with sessionSyncData [%{public}@]", (uint8_t *)&v14, 0xCu);
  }

  if (v4)
  {
    v4[2](v4, *(void *)(a1 + 40));
  }
  else
  {
    id v7 = DEDSessionStartLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_84_cold_1(v3, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_85(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = [WeakRetained xpcConnector];
  id v5 = [v3 diagnosticextensionsdXPCInterface];

  int v4 = [[DEDXPCOutbound alloc] initWithRemoteObject:v5];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setWorker:v4];
  objc_msgSend(v5, "xpc_startBugSessionWithIdentifier:configuration:caller:target:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_2_86(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = [WeakRetained idsConnection];
  objc_msgSend(v2, "ids_startBugSessionWithIdentifier:configuration:caller:target:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_3_87(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v2 = [WeakRetained sharingConnection];
  objc_msgSend(v2, "sharing_startBugSessionWithIdentifier:configuration:caller:target:fromInbound:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_88(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained hasCompletionBlockWithIdentifier:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    uint64_t v6 = [v5 popSessionStartCompletionWithIdentifier:*(void *)(a1 + 32)];
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = +[DEDConfiguration sharedInstance];
    uint64_t v9 = [v8 errorDomain];
    uint64_t v10 = [v7 errorWithDomain:v9 code:101 userInfo:0];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v10);

    id v12 = [*(id *)(a1 + 40) productType];
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v12, [*(id *)(a1 + 40) isRemote], 0, 101);
  }
  else
  {
    uint64_t v11 = DEDSessionStartLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Session start failed, no completion block", buf, 2u);
    }
  }
}

- (void)didStartBugSessionWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"identifier"];
  if (v5)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [(DEDController *)self replyQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__DEDController_didStartBugSessionWithInfo___block_invoke;
    v8[3] = &unk_26453AA68;
    objc_copyWeak(&v11, &location);
    id v9 = v5;
    id v10 = v4;
    dispatch_async(v6, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = DEDSessionStartLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DEDController didStartBugSessionWithInfo:]();
    }
  }
}

void __44__DEDController_didStartBugSessionWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained popDidStartSessionCompletionWithIdentifier:*(void *)(a1 + 32)];

  if (v3)
  {
    v3[2](v3, *(void *)(a1 + 40));
  }
  else
  {
    id v4 = DEDSessionStartLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_INFO, "started session, no completion block registered for session [%{public}@]", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)didFinishSessionWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDController *)self recentlyFinishedSessions];

  if (!v5)
  {
    int v6 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:5];
    [(DEDController *)self setRecentlyFinishedSessions:v6];
  }
  uint64_t v7 = [(DEDController *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Did finish session [%{public}@]", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = [(DEDController *)self recentlyFinishedSessions];
  [v8 addObject:v4];
}

- (BOOL)induceTimeOutIfNeededAndReturnCanProceedWithDevice:(id)a3 sessionId:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (+[DEDUtils isInternalInstall]
    && (+[DEDPersistence sharedInstance],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 canProceedWithDevice:v6],
        v8,
        (v9 & 1) == 0))
  {
    uint64_t v11 = [(DEDController *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 hashingKey];
      *(_DWORD *)buf = 138543362;
      id v20 = v12;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Inducing device timeout for device [%{public}@]", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    uint64_t v13 = [(DEDController *)self replyQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__DEDController_induceTimeOutIfNeededAndReturnCanProceedWithDevice_sessionId___block_invoke;
    block[3] = &unk_26453AA68;
    objc_copyWeak(&v18, (id *)buf);
    id v16 = v7;
    id v17 = v6;
    dispatch_async(v13, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

void __78__DEDController_induceTimeOutIfNeededAndReturnCanProceedWithDevice_sessionId___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained hasCompletionBlockWithIdentifier:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    id v6 = +[DEDConfiguration sharedInstance];
    id v7 = [v6 errorDomain];
    id v16 = @"Error reason";
    uint64_t v8 = NSString;
    char v9 = [*(id *)(a1 + 40) hashingKey];
    BOOL v10 = [v8 stringWithFormat:@"induced timeout for device [%@]", v9];
    v17[0] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v12 = [v5 errorWithDomain:v7 code:100 userInfo:v11];

    id v13 = objc_loadWeakRetained(v2);
    int v14 = [v13 popSessionStartCompletionWithIdentifier:*(void *)(a1 + 32)];
    ((void (**)(void, void, NSObject *))v14)[2](v14, 0, v12);

    uint64_t v15 = [*(id *)(a1 + 40) productType];
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v15, [*(id *)(a1 + 40) isRemote], 0, 100);
  }
  else
  {
    id v12 = DEDSessionStartLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1();
    }
  }
}

- (void)upgradeToClassCDataProtectionIfNeeded
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "upgradeToClassCDataProtectionIfNeeded already done", v1, 2u);
}

void __54__DEDController_upgradeToClassCDataProtectionIfNeeded__block_invoke()
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  os_log_t v0 = DEDSessionCleanupLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEFAULT, "upgradeToClassCDataProtectionIfNeeded start", buf, 2u);
  }

  uint64_t v1 = +[DEDConfiguration sharedInstance];
  uint64_t v2 = [v1 dedDirectory];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v25 = (void *)v2;
  id obj = [MEMORY[0x263F3A0A0] findAllItems:v2 includeDirs:1];
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    uint64_t v6 = *MEMORY[0x263EFF650];
    uint64_t v7 = *MEMORY[0x263EFF648];
    unint64_t v8 = 0x263EFF000uLL;
    unint64_t v9 = 0x263EFF000uLL;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        context = (void *)MEMORY[0x223C5FD90]();
        id v12 = DEDSessionCleanupLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          [v11 lastPathComponent];
          uint64_t v13 = v4;
          uint64_t v14 = v7;
          uint64_t v15 = v6;
          uint64_t v16 = v5;
          unint64_t v17 = v9;
          v19 = unint64_t v18 = v8;
          *(_DWORD *)buf = 138543362;
          long long v37 = v19;
          _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "Upgrading: [%{public}@]", buf, 0xCu);

          unint64_t v8 = v18;
          unint64_t v9 = v17;
          uint64_t v5 = v16;
          uint64_t v6 = v15;
          uint64_t v7 = v14;
          uint64_t v4 = v13;
        }

        uint64_t v34 = v6;
        uint64_t v35 = v7;
        id v20 = [*(id *)(v8 + 2352) dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v28 = 0;
        [v11 setResourceValues:v20 error:&v28];
        id v21 = v28;

        if (v21)
        {
          id v22 = DEDSessionCleanupLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            __54__DEDController_upgradeToClassCDataProtectionIfNeeded__block_invoke_cold_1((uint64_t)v33, (uint64_t)v21);
          }
        }
        uint64_t v23 = [*(id *)(v9 + 2624) standardUserDefaults];
        [v23 setBool:1 forKey:@"DEDUpgradedToClassC"];

        id v24 = DEDSessionCleanupLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FE04000, v24, OS_LOG_TYPE_DEFAULT, "upgradeToClassCDataProtectionIfNeeded end", buf, 2u);
        }

        ++v10;
      }
      while (v4 != v10);
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v4);
  }
}

- (void)purgeStaleSessions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = NSString;
  unint64_t v8 = +[DEDConfiguration sharedInstance];
  unint64_t v9 = [v8 identifier];
  uint64_t v10 = [v7 stringWithFormat:@"%@.purge", v9];

  uint64_t v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  id v12 = v10;
  uint64_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DEDController_purgeStaleSessions_completion___block_invoke;
  block[3] = &unk_26453ACE0;
  id v17 = v5;
  id v18 = v6;
  id v14 = v6;
  id v15 = v5;
  dispatch_async(v13, block);
}

void __47__DEDController_purgeStaleSessions_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  uint64_t v3 = +[DEDConfiguration sharedInstance];
  uint64_t v4 = [v3 identifier];
  id v5 = [v4 stringByAppendingString:@"-cleanup"];

  id v6 = v5;
  [v6 UTF8String];
  uint64_t v7 = (void *)os_transaction_create();
  unint64_t v8 = +[DEDActivity sharedInstance];
  unint64_t v9 = [v8 newCleanupActivity];

  uint64_t v10 = DEDSessionCleanupLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v11;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "[%lu] persisted sessions", buf, 0xCu);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__DEDController_purgeStaleSessions_completion___block_invoke_112;
  v14[3] = &unk_26453ACB8;
  id v15 = v7;
  id v16 = *(id *)(a1 + 32);
  id v17 = v2;
  id v18 = *(id *)(a1 + 40);
  id v12 = v2;
  id v13 = v7;
  os_activity_apply(v9, v14);
}

void __47__DEDController_purgeStaleSessions_completion___block_invoke_112(id *a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v1 = DEDSessionCleanupLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v1, OS_LOG_TYPE_DEFAULT, "purge stale sessions begin", buf, 2u);
  }

  uint64_t v2 = +[DEDConfiguration sharedInstance];
  uint64_t v3 = [v2 dedDirectory];

  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v50 = [MEMORY[0x263F3A0A0] getDirectorySize:v3];
    uint64_t v7 = [MEMORY[0x263F3A0A0] lsDir:v3];
    unint64_t v8 = objc_msgSend(v7, "ded_mapWithBlock:", &__block_literal_global_117);

    unint64_t v9 = DEDSessionCleanupLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v68 = v10;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "Found [%lu] session directories", buf, 0xCu);
    }
    __int16 v52 = v3;

    id v51 = v8;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v8];
    id v12 = objc_alloc_init(DEDAttachmentHandler);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v13 = a1[5];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v75 count:16];
    uint64_t v54 = v12;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          int v19 = [v18 identifier];
          uint64_t v20 = [(DEDAttachmentHandler *)v12 directoryForBugSessionIdentifier:v19];

          [v11 removeObject:v20];
          uint64_t v21 = [v18 state];
          id v22 = DEDSessionCleanupLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [v18 identifier];
            id v24 = (void *)v23;
            uint64_t v25 = "Unknown";
            if ((unint64_t)(v21 + 1) <= 9) {
              uint64_t v25 = off_26453AD18[v21 + 1];
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v68 = v23;
            __int16 v69 = 2082;
            uint64_t v70 = (uint64_t)v25;
            _os_log_impl(&dword_21FE04000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] state: [%{public}s]", buf, 0x16u);

            id v12 = v54;
          }

          if (v21 == -1)
          {
            +[DEDAnalytics didCompleteBugSessionWithState:2];
            [v18 cleanup];
            [a1[6] addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v15);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v26 = v11;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v74 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v60 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          long long v32 = DEDSessionCleanupLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = [v31 lastPathComponent];
            *(_DWORD *)buf = 138543362;
            uint64_t v68 = (uint64_t)v33;
            _os_log_impl(&dword_21FE04000, v32, OS_LOG_TYPE_INFO, "will remove orphan session directory [%{public}@]", buf, 0xCu);
          }
          uint64_t v34 = [MEMORY[0x263F08850] defaultManager];
          id v58 = 0;
          [v34 removeItemAtURL:v31 error:&v58];
          id v35 = v58;

          id v36 = DEDSessionCleanupLog();
          long long v37 = v36;
          if (v35)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              __47__DEDController_purgeStaleSessions_completion___block_invoke_112_cold_1((uint64_t)v73, (uint64_t)v31);
            }
          }
          else if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = [v31 lastPathComponent];
            *(_DWORD *)buf = 138543362;
            uint64_t v68 = (uint64_t)v38;
            _os_log_impl(&dword_21FE04000, v37, OS_LOG_TYPE_DEFAULT, "did remove orphan session directory [%{public}@]", buf, 0xCu);
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v74 count:16];
      }
      while (v28);
    }

    uint64_t v3 = v52;
    uint64_t v39 = [MEMORY[0x263F3A0A0] getDirectorySize:v52];
    uint64_t v40 = v50 - v39;
    if (v50 != v39)
    {
      uint64_t v41 = v39;
      id v42 = DEDSessionCleanupLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [MEMORY[0x263F086F0] stringFromByteCount:v50 countStyle:0];
        id v44 = [MEMORY[0x263F086F0] stringFromByteCount:v41 countStyle:0];
        long long v45 = [MEMORY[0x263F086F0] stringFromByteCount:v40 countStyle:0];
        *(_DWORD *)buf = 138543874;
        uint64_t v68 = (uint64_t)v43;
        __int16 v69 = 2114;
        uint64_t v70 = (uint64_t)v44;
        __int16 v71 = 2114;
        v72 = v45;
        _os_log_impl(&dword_21FE04000, v42, OS_LOG_TYPE_DEFAULT, "ded dir size before cleanup [%{public}@] after [%{public}@] diff [%{public}@]", buf, 0x20u);
      }
      id v46 = DEDSessionCleanupLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = [a1[6] count];
        uint64_t v48 = [v26 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v68 = v47;
        __int16 v69 = 2048;
        uint64_t v70 = v48;
        _os_log_impl(&dword_21FE04000, v46, OS_LOG_TYPE_DEFAULT, "Removed [%lu] sessions [%lu] orphan directories", buf, 0x16u);
      }
    }
  }
  id v49 = DEDSessionCleanupLog();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v49, OS_LOG_TYPE_DEFAULT, "purge stale sessions end", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DEDController_purgeStaleSessions_completion___block_invoke_120;
  block[3] = &unk_26453A5E8;
  id v57 = a1[7];
  id v56 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__DEDController_purgeStaleSessions_completion___block_invoke_114(uint64_t a1, void *a2)
{
  return [a2 URLByResolvingSymlinksInPath];
}

uint64_t __47__DEDController_purgeStaleSessions_completion___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)persistence
{
  return +[DEDPersistence sharedInstance];
}

- (void)addDevice:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 platform];
  int v6 = [v5 isEqualToString:@"xros"];

  if (v6) {
    [v4 setPlatform:@"visionos"];
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if ([v4 status] == 1)
  {
    unint64_t v8 = [(DEDController *)v7 log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      long long v61 = [v4 identifier];
      id v55 = [v4 idsIdentifier];
      long long v59 = [v4 address];
      uint64_t v54 = [v4 model];
      id v57 = [v4 name];
      id v56 = [v4 platform];
      id v53 = [v4 build];
      unint64_t v9 = [v4 remoteTransport];
      if (v9 > 4) {
        uint64_t v10 = "Unknown";
      }
      else {
        uint64_t v10 = off_26453AD88[v9];
      }
      id v51 = v10;
      unint64_t v19 = [v4 transport];
      if (v19 > 4) {
        uint64_t v20 = "Unknown";
      }
      else {
        uint64_t v20 = off_26453AD88[v19];
      }
      uint64_t v50 = v20;
      uint64_t v23 = [v4 status];
      if ((unint64_t)(v23 - 1) > 3) {
        id v24 = "Unknown";
      }
      else {
        id v24 = off_26453AD68[v23 - 1];
      }
      __int16 v52 = objc_msgSend(v4, "deviceClass", v24);
      uint64_t v25 = [v4 productType];
      id v26 = [v4 color];
      uint64_t v27 = [v4 enclosureColor];
      uint64_t v28 = [v4 homeButtonType];
      int v29 = [v4 isHomeKitResident];
      uint64_t v30 = [v4 mediaSystemRole];
      long long v31 = [v4 capabilities];
      *(_DWORD *)buf = 138547715;
      *(void *)long long v66 = v61;
      *(_WORD *)&v66[8] = 2114;
      *(void *)&v66[10] = v55;
      *(_WORD *)&v66[18] = 2113;
      *(void *)&v66[20] = v59;
      __int16 v67 = 2114;
      uint64_t v68 = v54;
      __int16 v69 = 2113;
      uint64_t v70 = v57;
      __int16 v71 = 2114;
      v72 = v56;
      __int16 v73 = 2114;
      v74 = v53;
      __int16 v75 = 2082;
      uint64_t v76 = v51;
      __int16 v77 = 2082;
      v78 = v50;
      __int16 v79 = 2082;
      v80 = v49;
      __int16 v81 = 2114;
      v82 = v52;
      __int16 v83 = 2114;
      id v84 = v25;
      __int16 v85 = 2114;
      id v86 = v26;
      __int16 v87 = 2114;
      id v88 = v27;
      __int16 v89 = 2048;
      uint64_t v90 = v28;
      __int16 v91 = 1024;
      int v92 = v29;
      __int16 v93 = 2048;
      uint64_t v94 = v30;
      __int16 v95 = 2114;
      id v96 = v31;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "Device ready:\nidentifier: %{public}@\nidsIdentifier: %{public}@\naddress: %{private}@\nmodel: %{public}@\nname: %{private}@\nplatform: %{public}@\nbuild: %{public}@\nremoteTransport: %{public}s\ntransport: %{public}s\nstatus: %{public}s\ndeviceClass: %{public}@\nproductType: %{public}@\ncolor: %{public}@\nenclosureColor: %{public}@\nhomeButtonType: %li\n"
        "isHomeKitResident: %d\n"
        "mediaSystemRole: %li\n"
        "capabilities: %{public}@\n",
        buf,
        0xB2u);
    }
  }
  else
  {
    unint64_t v8 = [(DEDController *)v7 log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      long long v62 = [v4 name];
      id v58 = [v4 platform];
      long long v60 = [v4 build];
      uint64_t v11 = [v4 productType];
      unint64_t v12 = [v4 status] - 1;
      if (v12 > 3) {
        id v13 = "Unknown";
      }
      else {
        id v13 = off_26453AD68[v12];
      }
      unint64_t v14 = [v4 transport];
      if (v14 > 4) {
        uint64_t v15 = "Unknown";
      }
      else {
        uint64_t v15 = off_26453AD88[v14];
      }
      uint64_t v16 = [v4 publicLogSafeIdentifier];
      unint64_t v17 = [v4 remoteTransport];
      if (v17 > 4) {
        id v18 = "Unknown";
      }
      else {
        id v18 = off_26453AD88[v17];
      }
      uint64_t v21 = [v4 address];
      id v22 = [v4 idsIdentifier];
      *(_DWORD *)buf = 138480131;
      *(void *)long long v66 = v62;
      *(_WORD *)&v66[8] = 2114;
      *(void *)&v66[10] = v58;
      *(_WORD *)&v66[18] = 2114;
      *(void *)&v66[20] = v60;
      __int16 v67 = 2114;
      uint64_t v68 = v11;
      __int16 v69 = 2082;
      uint64_t v70 = v13;
      __int16 v71 = 2082;
      v72 = v15;
      __int16 v73 = 2114;
      v74 = v16;
      __int16 v75 = 2082;
      uint64_t v76 = v18;
      __int16 v77 = 2113;
      v78 = v21;
      __int16 v79 = 2114;
      v80 = v22;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "Will try to add device:\n%{private}@ - %{public}@ %{public}@ (%{public}@) -- %{public}s \n%{public}s (%{public}@) \n%{public}s Remote: (%{private}@ - %{public}@)", buf, 0x66u);
    }
  }

  long long v32 = [v4 hashingKeyForTempDevice];
  uint64_t v33 = [(DEDController *)v7 devices];
  uint64_t v34 = [v33 objectForKeyedSubscript:v32];

  if (v34)
  {
    id v35 = [(DEDController *)v7 log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v36 = [v34 publicLogSafeIdentifier];
      *(_DWORD *)buf = 138543619;
      *(void *)long long v66 = v36;
      *(_WORD *)&v66[8] = 2113;
      *(void *)&v66[10] = v32;
      _os_log_impl(&dword_21FE04000, v35, OS_LOG_TYPE_INFO, "found temp device [%{public}@] for key [%{private}@]", buf, 0x16u);
    }
    long long v37 = [(DEDController *)v7 devices];
    [v37 removeObjectForKey:v32];
  }
  if ([v4 isTemporaryDevice])
  {
    id v38 = [(DEDController *)v7 devices];
    uint64_t v39 = [v38 allValues];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __27__DEDController_addDevice___block_invoke;
    v63[3] = &unk_26453AA18;
    id v64 = v4;
    uint64_t v40 = objc_msgSend(v39, "ded_findWithBlock:", v63);
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v41 = [v4 hashingKey];
  if (v40)
  {
    id v42 = [(DEDController *)v7 log];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      int v43 = [v4 transport];
      id v44 = [v4 publicLogSafeIdentifier];
      long long v45 = [v40 description];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)long long v66 = v43;
      *(_WORD *)&v66[4] = 2114;
      *(void *)&v66[6] = v44;
      *(_WORD *)&v66[14] = 2114;
      *(void *)&v66[16] = v45;
      _os_log_impl(&dword_21FE04000, v42, OS_LOG_TYPE_INFO, "Not adding temp device [%i-%{public}@], already have [%{public}@]", buf, 0x1Cu);
    }
  }
  else
  {
    id v46 = [(DEDController *)v7 devices];
    [v46 setObject:v4 forKeyedSubscript:v41];

    id v42 = [(DEDController *)v7 log];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = [v4 transport];
      uint64_t v48 = [v4 publicLogSafeIdentifier];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)long long v66 = v47;
      *(_WORD *)&v66[4] = 2114;
      *(void *)&v66[6] = v48;
      _os_log_impl(&dword_21FE04000, v42, OS_LOG_TYPE_DEFAULT, "Did add device [%i-%{public}@]", buf, 0x12u);
    }
  }

  [(DEDController *)v7 logDeviceCounts];
  objc_sync_exit(v7);
}

uint64_t __27__DEDController_addDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 remoteTransport];
  if (v4 == [*(id *)(a1 + 32) remoteTransport])
  {
    id v5 = [v3 address];
    int v6 = [*(id *)(a1 + 32) address];
    uint64_t v7 = [v5 isEqualToString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)logDeviceCounts
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(DEDController *)v2 devices];
  uint64_t v4 = [v3 allValues];

  objc_sync_exit(v2);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v5);
        }
        switch(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "status", (void)v14))
        {
          case 1:
            ++v9;
            break;
          case 2:
            ++v8;
            break;
          case 3:
            ++v7;
            break;
          case 4:
            ++v6;
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v26 count:16];
    }
    while (v10);
  }

  id v13 = [(DEDController *)v2 log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v6;
    _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEFAULT, "Devices: ready [%lu] needs pairing [%lu] waiting [%lu] not available [%lu]", buf, 0x2Au);
  }
}

- (id)idsConnection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__DEDController_idsConnection__block_invoke;
  block[3] = &unk_26453A5C0;
  void block[4] = self;
  if (idsConnection_onceToken != -1) {
    dispatch_once(&idsConnection_onceToken, block);
  }
  return (id)idsConnection__idsConnection;
}

void __30__DEDController_idsConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "Creating IDS connection", v5, 2u);
  }

  id v3 = [[DEDIDSConnection alloc] initWithController:*(void *)(a1 + 32)];
  uint64_t v4 = (void *)idsConnection__idsConnection;
  idsConnection__idsConnection = (uint64_t)v3;
}

- (id)sharingConnection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__DEDController_sharingConnection__block_invoke;
  block[3] = &unk_26453A5C0;
  void block[4] = self;
  if (sharingConnection_onceToken != -1) {
    dispatch_once(&sharingConnection_onceToken, block);
  }
  return (id)sharingConnection__sharingConnection;
}

void __34__DEDController_sharingConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "Creating Sharing connection", v5, 2u);
  }

  id v3 = [[DEDSharingConnection alloc] initWithController:*(void *)(a1 + 32)];
  uint64_t v4 = (void *)sharingConnection__sharingConnection;
  sharingConnection__sharingConnection = (uint64_t)v3;
}

- (void)setBugSessionCallbackQueue:(id)a3
{
}

- (DEDXPCConnector)xpcConnector
{
  return (DEDXPCConnector *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcConnector:(id)a3
{
}

- (DEDClientProtocol)clientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientDelegate);
  return (DEDClientProtocol *)WeakRetained;
}

- (void)setClientDelegate:(id)a3
{
}

- (DEDWorkerProtocol)workerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workerDelegate);
  return (DEDWorkerProtocol *)WeakRetained;
}

- (void)setWorkerDelegate:(id)a3
{
}

- (DEDPairingProtocol)pairingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDelegate);
  return (DEDPairingProtocol *)WeakRetained;
}

- (void)setPairingDelegate:(id)a3
{
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (void)setIsDaemon:(BOOL)a3
{
  self->_isDaemon = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)useSharing
{
  return self->_useSharing;
}

- (void)setUseSharing:(BOOL)a3
{
  self->_useSharing = a3;
}

- (BOOL)useIDS
{
  return self->_useIDS;
}

- (void)setUseIDS:(BOOL)a3
{
  self->_useIDS = a3;
}

- (BOOL)embeddedInApp
{
  return self->_embeddedInApp;
}

- (void)setEmbeddedInApp:(BOOL)a3
{
  self->_embeddedInApp = a3;
}

- (id)devicesCompletion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setDevicesCompletion:(id)a3
{
}

- (id)pongBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setPongBlock:(id)a3
{
}

- (id)sessionExistsCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setSessionExistsCompletion:(id)a3
{
}

- (NSMutableDictionary)sessionStartBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSessionStartBlocks:(id)a3
{
}

- (NSMutableDictionary)sessionDidStartBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSessionDidStartBlocks:(id)a3
{
}

- (NSMutableSet)recentlyFinishedSessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRecentlyFinishedSessions:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReplyQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLog:(id)a3
{
}

- (id)didCancelCompletion
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setDidCancelCompletion:(id)a3
{
}

- (id)xpcConnectionsCompletion
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setXpcConnectionsCompletion:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDevices:(id)a3
{
}

- (NSDictionary)sessions
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong(&self->_xpcConnectionsCompletion, 0);
  objc_storeStrong(&self->_didCancelCompletion, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_recentlyFinishedSessions, 0);
  objc_storeStrong((id *)&self->_sessionDidStartBlocks, 0);
  objc_storeStrong((id *)&self->_sessionStartBlocks, 0);
  objc_storeStrong(&self->_sessionExistsCompletion, 0);
  objc_storeStrong(&self->_pongBlock, 0);
  objc_storeStrong(&self->_devicesCompletion, 0);
  objc_destroyWeak((id *)&self->_pairingDelegate);
  objc_destroyWeak((id *)&self->_workerDelegate);
  objc_destroyWeak((id *)&self->_clientDelegate);
  objc_storeStrong((id *)&self->_xpcConnector, 0);
  objc_storeStrong((id *)&self->_bugSessionCallbackQueue, 0);
}

- (void)addDidStartSessionCompletion:(id)a3 withIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(DEDController *)self sessionDidStartBlocks];
  objc_sync_enter(v7);
  uint64_t v8 = [(DEDController *)self sessionDidStartBlocks];
  uint64_t v9 = (void *)MEMORY[0x223C5FFB0](v10);
  [v8 setObject:v9 forKey:v6];

  objc_sync_exit(v7);
}

- (id)popDidStartSessionCompletionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDController *)self sessionDidStartBlocks];
  objc_sync_enter(v5);
  id v6 = [(DEDController *)self sessionDidStartBlocks];
  uint64_t v7 = [v6 objectForKey:v4];

  if (v7)
  {
    uint64_t v8 = [(DEDController *)self sessionDidStartBlocks];
    [v8 removeObjectForKey:v4];
  }
  else
  {
    uint64_t v8 = DEDSessionStartLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "tried to pop a nil session did start block", v11, 2u);
    }
  }

  objc_sync_exit(v5);
  uint64_t v9 = (void *)MEMORY[0x223C5FFB0](v7);

  return v9;
}

- (void)addSessionStartCompletion:(id)a3 withIdentifier:(id)a4 configuration:(id)a5 targetDevice:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(DEDController *)self sessionDidStartBlocks];
  objc_sync_enter(v13);
  long long v14 = [(DEDController *)self sessionStartBlocks];
  long long v15 = (void *)MEMORY[0x223C5FFB0](v16);
  [v14 setObject:v15 forKey:v10];

  [v11 bugSessionStartTimeout];
  -[DEDController _timeOutSessionStartBlockWithIdentifier:targetDevice:timeout:](self, "_timeOutSessionStartBlockWithIdentifier:targetDevice:timeout:", v10, v12);
  objc_sync_exit(v13);
}

- (id)popSessionStartCompletionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDController *)self sessionDidStartBlocks];
  objc_sync_enter(v5);
  id v6 = [(DEDController *)self sessionStartBlocks];
  uint64_t v7 = [v6 objectForKey:v4];

  if (v7)
  {
    uint64_t v8 = [(DEDController *)self sessionStartBlocks];
    [v8 removeObjectForKey:v4];
  }
  else
  {
    uint64_t v8 = DEDSessionStartLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "tried to pop a nil session start block", v11, 2u);
    }
  }

  objc_sync_exit(v5);
  uint64_t v9 = (void *)MEMORY[0x223C5FFB0](v7);

  return v9;
}

- (BOOL)hasCompletionBlockWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDController *)self sessionStartBlocks];
  objc_sync_enter(v5);
  id v6 = [(DEDController *)self sessionStartBlocks];
  uint64_t v7 = [v6 objectForKey:v4];
  BOOL v8 = v7 != 0;

  objc_sync_exit(v5);
  return v8;
}

- (void)_timeOutSessionStartBlockWithIdentifier:(id)a3 targetDevice:(id)a4 timeout:(double)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(DEDController *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2048;
    double v23 = a5;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Session [%{public}@] will timeout after [%.1lf] seconds", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  id WeakRetained = objc_loadWeakRetained((id *)buf);
  id v13 = [WeakRetained replyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke;
  block[3] = &unk_26453AA68;
  objc_copyWeak(&v19, (id *)buf);
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_after(v11, v13, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained sessionStartBlocks];

  objc_sync_enter(v4);
  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v5 hasCompletionBlockWithIdentifier:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v2);
    id v8 = [v7 popSessionStartCompletionWithIdentifier:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = 0;
  }
  objc_sync_exit(v4);

  if (v8)
  {
    id v9 = DEDSessionStartLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke_cold_1((uint64_t *)(a1 + 32), v9);
    }

    id v10 = (void *)MEMORY[0x263F087E8];
    dispatch_time_t v11 = +[DEDConfiguration sharedInstance];
    id v12 = [v11 errorDomain];
    id v13 = [v10 errorWithDomain:v12 code:100 userInfo:0];

    ((void (**)(void, void, void *))v8)[2](v8, 0, v13);
    id v14 = [*(id *)(a1 + 40) productType];
    +[DEDAnalytics logBugSessionStartWithDeviceType:isRemote:success:errorCode:](DEDAnalytics, "logBugSessionStartWithDeviceType:isRemote:success:errorCode:", v14, [*(id *)(a1 + 40) remoteTransport] != 1, 0, 100);
  }
}

- (void)configureForSharing:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21FE04000, v0, OS_LOG_TYPE_FAULT, "Tried to enable sharing. It's disabled!", v1, 2u);
}

- (void)startPairSetupForDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

- (void)tryPIN:forDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

- (void)_sharingDeviceForIncomingDevice:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[DEDController _sharingDeviceForIncomingDevice:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "%s%@ -> %@", (uint8_t *)&v3, 0x20u);
}

- (void)insertNewSession:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, a2, v4, "Inserting bug session [%{public}@]", v5);
}

- (void)removeSessionWithIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Removing bug session [%{public}@]", v2);
}

- (void)abortSession:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "could not abort session [%{public}@] because session is not known to controller", v2, v3, v4, v5, v6);
}

- (void)abortSession:(uint64_t)a3 withCompletion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[DEDController abortSession:withCompletion:]";
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, a1, a3, "%s", (uint8_t *)&v3);
}

- (void)connector:didLooseConnectionToProcessWithPid:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Daemon connection delegate called on app controller", v2, v3, v4, v5, v6);
}

- (void)xpcInbound_forceRemoveNotificationOfType:(uint64_t)a1 identifier:(NSObject *)a2 hostIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v2 = "Unknown";
  }
  else {
    uint64_t v2 = "unset";
  }
  int v3 = 136446466;
  uint64_t v4 = "-[DEDController xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:]";
  __int16 v5 = 2082;
  uint8_t v6 = v2;
  _os_log_fault_impl(&dword_21FE04000, a2, OS_LOG_TYPE_FAULT, "[%{public}s] for type [%{public}s] not handled", (uint8_t *)&v3, 0x16u);
}

- (void)xpcInbound_forceRemoveNotificationOfType:identifier:hostIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Cannot force remove notification for type .unset", v2, v3, v4, v5, v6);
}

- (void)xpcInbound_startPairSetupForDevice:fromInbound:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

- (void)xpcInbound_promptPINForDevice:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Pairing delegate is nil. Cannot prompt PIN for device [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)xpcInbound_promptPINForDevice:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

- (void)xpcInbound_tryPIN:forDevice:fromInbound:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

- (void)xpcInbound_successPINForDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

- (void)sharingInbound_promptPINForDevice:fromInbound:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

- (void)sharingInbound_successPINForDevice:fromInbound:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21FE04000, v0, v1, "[%{public}s] could not find device. Incoming device [%{public}@]", v2, v3, v4, v5, 2u);
}

void __54__DEDController_idsInbound_devicesChanged_completion___block_invoke_cold_1(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, a4, (uint64_t)a3, "idsInbound_devicesChanged: ignoring device [%{public}@]", a2);
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "does not have device, cannot continue", v2, v3, v4, v5, v6);
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "given target device is nil, bailing", v2, v3, v4, v5, v6);
}

- (void)startBugSessionWithIdentifier:(os_log_t)log configuration:caller:target:fromInbound:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "cannot find device with [%{public}@]", buf, 0xCu);
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Unknown caller transport. Cannot configure bug session worker", v2, v3, v4, v5, v6);
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Unknown caller transport. Cannot configure bug session client", v2, v3, v4, v5, v6);
}

- (void)startBugSessionWithIdentifier:configuration:caller:target:fromInbound:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Device does not have capabilities requested by bug session config, cannot continue.", v2, v3, v4, v5, v6);
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "DEDSessionStartCompletion is nil", v2, v3, v4, v5, v6);
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_78_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __87__DEDController_startBugSessionWithIdentifier_configuration_caller_target_fromInbound___block_invoke_84_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didStartBugSessionWithInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "did start session but info does not have session id, cannot continue", v2, v3, v4, v5, v6);
}

void __54__DEDController_upgradeToClassCDataProtectionIfNeeded__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "description");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_8(&dword_21FE04000, v5, v6, "Error setting file protection key: %@");
}

void __47__DEDController_purgeStaleSessions_completion___block_invoke_112_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "lastPathComponent");
  _DWORD *v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_8(&dword_21FE04000, v5, v6, "Error deleting orphan dir [%{public}@]");
}

void __96__DEDController_CompletionBlocks___timeOutSessionStartBlockWithIdentifier_targetDevice_timeout___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "session start timed out for session id [%{public}@]", (uint8_t *)&v3, 0xCu);
}

@end