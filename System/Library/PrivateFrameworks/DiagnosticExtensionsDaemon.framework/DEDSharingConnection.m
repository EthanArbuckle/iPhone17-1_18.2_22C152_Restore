@interface DEDSharingConnection
+ (void)checkIn;
- (BOOL)listenForClients;
- (BOOL)started;
- (DEDSharingConnection)initWithController:(id)a3;
- (DEDSharingInbound)sharingInbound;
- (DEDSharingInboundDelegate)controller;
- (NSMutableDictionary)deviceSessions;
- (NSMutableDictionary)discoveredDevices;
- (NSMutableDictionary)pongingDevices;
- (NSMutableSet)visiblePingUUIDs;
- (OS_dispatch_queue)run_queue;
- (OS_dispatch_semaphore)bluetoothSessionSemaphore;
- (SFDeviceDiscovery)pingDiscovery;
- (SFDeviceDiscovery)pongDiscovery;
- (SFService)pingService;
- (SFService)workerService;
- (id)_existingSharingSessionForDevice:(id)a3;
- (id)blockingSharingSessionForDevice:(id)a3 fromInbound:(id)a4;
- (id)deviceStatusCallback;
- (id)sharingOutboundForBugSessionIdentifier:(id)a3 device:(id)a4 fromInbound:(id)a5;
- (void)_configureService:(id)a3 withLabel:(id)a4 needsSetup:(BOOL)a5 actionType:(unsigned __int8)a6 completion:(id)a7;
- (void)_handleIncomingPingingDevice:(id)a3;
- (void)_handleIncomingPongingDevice:(id)a3 fromInbound:(id)a4;
- (void)_saveDevice:(id)a3;
- (void)_verifyPairingForSession:(id)a3 holdForPIN:(BOOL)a4 completion:(id)a5;
- (void)addIncomingSFSession:(id)a3 forIdentifier:(id)a4;
- (void)checkReadinessForSFDevice:(id)a3 session:(id)a4;
- (void)configureListenForClients:(BOOL)a3;
- (void)configureSharingInbound:(id)a3;
- (void)createSharingSessionForSFDevice:(id)a3 holdForPIN:(BOOL)a4 fromInbound:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)discoverDevicesFromInbound:(id)a3 withCompletion:(id)a4;
- (void)getSystemInfoForDevice:(id)a3;
- (void)setBluetoothSessionSemaphore:(id)a3;
- (void)setController:(id)a3;
- (void)setDeviceSessions:(id)a3;
- (void)setDeviceStatusCallback:(id)a3;
- (void)setDiscoveredDevices:(id)a3;
- (void)setListenForClients:(BOOL)a3;
- (void)setPingDiscovery:(id)a3;
- (void)setPingService:(id)a3;
- (void)setPongDiscovery:(id)a3;
- (void)setPongingDevices:(id)a3;
- (void)setRun_queue:(id)a3;
- (void)setSharingInbound:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setVisiblePingUUIDs:(id)a3;
- (void)setWorkerService:(id)a3;
- (void)sharing_didStartBugSessionWithInfo:(id)a3 forCaller:(id)a4;
- (void)sharing_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6 fromInbound:(id)a7;
- (void)sharing_startPairSetupForDevice:(id)a3 fromInbound:(id)a4;
- (void)sharing_tryPIN:(id)a3 forDevice:(id)a4 fromInbound:(id)a5;
- (void)start;
- (void)startPingDiscovery;
- (void)startPingServiceWithCompletion:(id)a3;
- (void)startPongAdvertisement;
- (void)startPongDiscoveryFromInbound:(id)a3;
- (void)startWorkerService;
- (void)stopDiscovery;
- (void)stopPingDiscovery;
- (void)stopPingService;
- (void)stopPongAdvertisement;
- (void)stopPongDiscovery;
- (void)stopSession:(id)a3;
- (void)trySessionWithFoundDevice:(id)a3 fromInbound:(id)a4;
- (void)updateControllerWithDevice:(id)a3 andStatus:(int64_t)a4;
- (void)updatePongAdvertisement;
@end

@implementation DEDSharingConnection

+ (void)checkIn
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  v3 = [v2 environment];
  v4 = [v3 objectForKeyedSubscript:@"DED_UNIT_TEST"];

  v5 = Log_5();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "NOT checking in com.apple.diagnosticextensionsd.sharing-wakeup: DEBUG", v7, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "checking in com.apple.diagnosticextensionsd.sharing-wakeup", buf, 2u);
    }

    if (checkIn_onceToken != -1) {
      dispatch_once(&checkIn_onceToken, &__block_literal_global_27);
    }
  }
}

void __31__DEDSharingConnection_checkIn__block_invoke()
{
  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticextensionsd.sharing-wakeup", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_19);
  xpc_connection_resume(mach_service);
  v1 = (void *)checkIn__connection;
  checkIn__connection = (uint64_t)mach_service;
}

void __31__DEDSharingConnection_checkIn__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = a2;
  v3 = v2;
  if (v2 == (_xpc_connection_s *)MEMORY[0x263EF86C0])
  {
    v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "XPC_ERROR_TERMINATION_IMMINENT, will not check in for sharing-wakeup";
      BOOL v6 = buf;
      v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }
  else
  {
    xpc_connection_set_event_handler(v2, &__block_literal_global_22);
    xpc_connection_resume(v3);
    v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = 0;
      v5 = "did check in com.apple.diagnosticextensionsd.sharing-wakeup";
      BOOL v6 = (uint8_t *)&v9;
      v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_21FE04000, v7, v8, v5, v6, 2u);
    }
  }
}

- (DEDSharingConnection)initWithController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEDSharingConnection;
  v5 = [(DEDSharingConnection *)&v13 init];
  if (v5)
  {
    BOOL v6 = [MEMORY[0x263EFF9A0] dictionary];
    [(DEDSharingConnection *)v5 setDeviceSessions:v6];

    v7 = [MEMORY[0x263EFF9A0] dictionary];
    [(DEDSharingConnection *)v5 setDiscoveredDevices:v7];

    os_log_type_t v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.diagnosticextensionsd.sharingqueue", v8);
    [(DEDSharingConnection *)v5 setRun_queue:v9];

    [(DEDSharingConnection *)v5 setStarted:0];
    [(DEDSharingConnection *)v5 setListenForClients:0];
    [(DEDSharingConnection *)v5 setPingService:0];
    [(DEDSharingConnection *)v5 setWorkerService:0];
    [(DEDSharingConnection *)v5 setController:v4];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(5);
    [(DEDSharingConnection *)v5 setBluetoothSessionSemaphore:v10];

    v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingConnection initWithController:](v11);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(DEDSharingConnection *)self pingService];
  [v3 invalidate];

  id v4 = [(DEDSharingConnection *)self workerService];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)DEDSharingConnection;
  [(DEDSharingConnection *)&v5 dealloc];
}

- (void)configureSharingInbound:(id)a3
{
  id v4 = a3;
  if (![(DEDSharingConnection *)self started]) {
    [(DEDSharingConnection *)self setSharingInbound:v4];
  }
}

- (void)configureListenForClients:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(DEDSharingConnection *)self started])
  {
    [(DEDSharingConnection *)self setListenForClients:v3];
  }
}

- (void)start
{
  if (![(DEDSharingConnection *)self started])
  {
    BOOL v3 = [DEDSharingInbound alloc];
    id v4 = [(DEDSharingConnection *)self controller];
    objc_super v5 = [(DEDSharingInbound *)v3 initWithController:v4 sharingConnection:self];
    [(DEDSharingConnection *)self setSharingInbound:v5];

    if ([(DEDSharingConnection *)self listenForClients])
    {
      [(DEDSharingConnection *)self startPingDiscovery];
      [(DEDSharingConnection *)self startWorkerService];
    }
  }
}

- (void)discoverDevicesFromInbound:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__DEDSharingConnection_discoverDevicesFromInbound_withCompletion___block_invoke;
  v10[3] = &unk_26453B740;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DEDSharingConnection *)self startPingServiceWithCompletion:v10];
}

void __66__DEDSharingConnection_discoverDevicesFromInbound_withCompletion___block_invoke(void *a1, void *a2)
{
  BOOL v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 startPongDiscoveryFromInbound:v4];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)stopDiscovery
{
  [(DEDSharingConnection *)self stopPongDiscovery];
  [(DEDSharingConnection *)self stopPingService];
}

- (void)startPingServiceWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void))a3;
  id v5 = [(DEDSharingConnection *)self pingService];

  if (v5)
  {
    id v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(DEDSharingConnection *)self pingService];
      int v12 = 138412290;
      objc_super v13 = v7;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Ping service already initialized [%@]", (uint8_t *)&v12, 0xCu);
    }
    v4[2](v4, MEMORY[0x263EFFA68]);
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F6C2B0]);
    [(DEDSharingConnection *)self setPingService:v8];

    id v9 = Log_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v10 = [(DEDSharingConnection *)self pingService];
      int v12 = 138412290;
      objc_super v13 = v10;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "Created new ping service [%@]", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = [(DEDSharingConnection *)self pingService];
    [(DEDSharingConnection *)self _configureService:v11 withLabel:@"ded-ping" needsSetup:1 actionType:17 completion:v4];

    uint64_t v4 = (void (**)(id, void))v11;
  }
}

- (void)stopPingService
{
  BOOL v3 = Log_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "Stopping ping service.", v5, 2u);
  }

  uint64_t v4 = [(DEDSharingConnection *)self pingService];
  [v4 invalidate];

  [(DEDSharingConnection *)self setPingService:0];
}

- (void)updatePongAdvertisement
{
  BOOL v3 = [(DEDSharingConnection *)self visiblePingUUIDs];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [(DEDSharingConnection *)self stopPongAdvertisement];
  }
  id v5 = [(DEDSharingConnection *)self visiblePingUUIDs];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(DEDSharingConnection *)self startPongAdvertisement];
  }
}

- (void)startPongAdvertisement
{
  BOOL v3 = [(DEDSharingConnection *)self workerService];
  char v4 = [v3 needsSetup];

  if ((v4 & 1) == 0)
  {
    id v5 = Log_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Starting pong advertisement.", v8, 2u);
    }

    uint64_t v6 = [(DEDSharingConnection *)self workerService];
    [v6 setNeedsSetup:1];

    id v7 = [(DEDSharingConnection *)self workerService];
    [v7 setDeviceActionType:18];
  }
}

- (void)stopPongAdvertisement
{
  BOOL v3 = [(DEDSharingConnection *)self workerService];
  int v4 = [v3 needsSetup];

  if (v4)
  {
    id v5 = Log_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Stopping pong advertisement.", v8, 2u);
    }

    uint64_t v6 = [(DEDSharingConnection *)self workerService];
    [v6 setNeedsSetup:0];

    id v7 = [(DEDSharingConnection *)self workerService];
    [v7 setDeviceActionType:0];
  }
}

- (void)startWorkerService
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DEDSharingConnection *)self workerService];

  if (v3)
  {
    int v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(DEDSharingConnection *)self workerService];
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      uint64_t v6 = "Worker service already initialized [%@]";
LABEL_6:
      _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F6C2B0]);
    [(DEDSharingConnection *)self setWorkerService:v7];

    v17 = @"com.apple.DeviceDiagnostics";
    uint64_t v8 = MEMORY[0x263EFFA88];
    uint64_t v18 = MEMORY[0x263EFFA88];
    id v9 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    dispatch_semaphore_t v10 = [(DEDSharingConnection *)self workerService];
    [v10 setPairSetupACL:v9];

    v15 = @"com.apple.DeviceDiagnostics";
    uint64_t v16 = v8;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    int v12 = [(DEDSharingConnection *)self workerService];
    [v12 setPairVerifyACL:v11];

    objc_super v13 = [(DEDSharingConnection *)self workerService];
    [v13 setOverrideScreenOff:1];

    uint64_t v14 = [(DEDSharingConnection *)self workerService];
    [(DEDSharingConnection *)self _configureService:v14 withLabel:@"ded-worker" needsSetup:0 actionType:0 completion:0];

    int v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(DEDSharingConnection *)self workerService];
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      uint64_t v6 = "Started sharing worker service %@";
      goto LABEL_6;
    }
  }
}

- (void)startPingDiscovery
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DEDSharingConnection *)self pingDiscovery];

  if (v3)
  {
    int v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(DEDSharingConnection *)self pingDiscovery];
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "Ping discovery already initialized %@", buf, 0xCu);
    }
    uint64_t v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(DEDSharingConnection *)self visiblePingUUIDs];
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Ping devices tracked %@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F6C230]);
    [(DEDSharingConnection *)self setPingDiscovery:v8];

    id v9 = Log_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v10 = [(DEDSharingConnection *)self pingDiscovery];
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "Created ping discovery %@", buf, 0xCu);
    }
    uint64_t v11 = [(DEDSharingConnection *)self pingDiscovery];
    [v11 setChangeFlags:13];

    int v12 = [(DEDSharingConnection *)self pingDiscovery];
    [v12 setDiscoveryFlags:16];

    objc_super v13 = [(DEDSharingConnection *)self pingDiscovery];
    [v13 setScanRate:20];

    uint64_t v14 = Log_5();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(DEDSharingConnection *)self pingDiscovery];
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "Initialized Ping discovery %@", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    [(DEDSharingConnection *)self setVisiblePingUUIDs:v16];

    objc_initWeak((id *)buf, self);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke;
    v31[3] = &unk_26453B768;
    objc_copyWeak(&v32, (id *)buf);
    v17 = [(DEDSharingConnection *)self pingDiscovery];
    [v17 setDeviceFoundHandler:v31];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_44;
    v29[3] = &unk_26453B790;
    objc_copyWeak(&v30, (id *)buf);
    uint64_t v18 = [(DEDSharingConnection *)self pingDiscovery];
    [v18 setDeviceChangedHandler:v29];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_46;
    v27[3] = &unk_26453B768;
    objc_copyWeak(&v28, (id *)buf);
    v19 = [(DEDSharingConnection *)self pingDiscovery];
    [v19 setDeviceLostHandler:v27];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_47;
    v25[3] = &unk_26453A9F0;
    objc_copyWeak(&v26, (id *)buf);
    v20 = [(DEDSharingConnection *)self pingDiscovery];
    [v20 setInterruptionHandler:v25];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__DEDSharingConnection_startPingDiscovery__block_invoke_48;
    v23[3] = &unk_26453A9F0;
    objc_copyWeak(&v24, (id *)buf);
    uint64_t v21 = [(DEDSharingConnection *)self pingDiscovery];
    [v21 setInvalidationHandler:v23];

    v22 = [(DEDSharingConnection *)self pingDiscovery];
    [v22 activateWithCompletion:&__block_literal_global_52];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __42__DEDSharingConnection_startPingDiscovery__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleIncomingPingingDevice:v3];
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __42__DEDSharingConnection_startPingDiscovery__block_invoke_44_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleIncomingPingingDevice:v3];
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v3;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_INFO, "Ping discovery deviceLost called for device [%@]", (uint8_t *)&v17, 0xCu);
  }

  id v5 = [v3 identifier];
  uint64_t v6 = [v5 UUIDString];

  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  id v9 = [WeakRetained visiblePingUUIDs];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    uint64_t v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "pingDiscovery.deviceLost: [%@]", (uint8_t *)&v17, 0xCu);
    }

    id v12 = objc_loadWeakRetained(v7);
    objc_super v13 = [v12 visiblePingUUIDs];
    uint64_t v14 = [v3 identifier];
    v15 = [v14 UUIDString];
    [v13 removeObject:v15];

    id v16 = objc_loadWeakRetained(v7);
    [v16 updatePongAdvertisement];
  }
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_47(uint64_t a1)
{
  v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Ping discovery interrupted.", v7, 2u);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained pingDiscovery];
  [v5 invalidate];

  id v6 = objc_loadWeakRetained(v3);
  [v6 setPingDiscovery:0];
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_48(uint64_t a1)
{
  v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Ping discovery invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPingDiscovery:0];
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_49(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = Log_5();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__DEDSharingConnection_startPingDiscovery__block_invoke_49_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "Ping discovery activated", v5, 2u);
  }
}

- (void)_handleIncomingPingingDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  int v7 = [v4 isValidDEDPingDevice];
  id v8 = [(DEDSharingConnection *)self visiblePingUUIDs];
  int v9 = [v8 containsObject:v6];

  if (!v7 || (v9 & 1) != 0)
  {
    if ((v7 & v9) == 1)
    {
      id v12 = Log_5();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[DEDSharingConnection _handleIncomingPingingDevice:]();
      }
    }
    else
    {
      char v14 = v7 | v9;
      v15 = Log_5();
      id v12 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412290;
          id v18 = v4;
          _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "Incoming ping discovery. known device no longer valid, will stop tracking [%@]", (uint8_t *)&v17, 0xCu);
        }

        id v16 = [(DEDSharingConnection *)self visiblePingUUIDs];
        [v16 removeObject:v6];

        id v12 = Log_5();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[DEDSharingConnection _handleIncomingPingingDevice:](self);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[DEDSharingConnection _handleIncomingPingingDevice:]();
      }
    }
  }
  else
  {
    int v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Incoming ping discovery. New device is valid, will track [%@]", (uint8_t *)&v17, 0xCu);
    }

    [(DEDSharingConnection *)self _saveDevice:v4];
    uint64_t v11 = [(DEDSharingConnection *)self visiblePingUUIDs];
    [v11 addObject:v6];

    id v12 = Log_5();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_super v13 = [(DEDSharingConnection *)self visiblePingUUIDs];
      int v17 = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_INFO, "Tracked DED ping devices %@", (uint8_t *)&v17, 0xCu);
    }
  }

  [(DEDSharingConnection *)self updatePongAdvertisement];
}

- (void)stopPingDiscovery
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = Log_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DEDSharingConnection *)self pingDiscovery];
    int v6 = 138412290;
    int v7 = v4;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "Stopping ping discovery on %@.", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(DEDSharingConnection *)self pingDiscovery];
  [v5 invalidate];

  [(DEDSharingConnection *)self setPingDiscovery:0];
}

- (void)startPongDiscoveryFromInbound:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DEDSharingConnection *)self pongDiscovery];

  if (v5)
  {
    int v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(DEDSharingConnection *)self pongDiscovery];
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Pong discovery already initialized %@", buf, 0xCu);
    }
    uint64_t v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(DEDSharingConnection *)self pongingDevices];
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Pong devices tracked %@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263F6C230]);
    [(DEDSharingConnection *)self setPongDiscovery:v10];

    uint64_t v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(DEDSharingConnection *)self pongingDevices];
      *(_DWORD *)buf = 138412290;
      v39 = v12;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Created pong discovery %@", buf, 0xCu);
    }
    objc_super v13 = [(DEDSharingConnection *)self pongDiscovery];
    [v13 setChangeFlags:13];

    char v14 = [(DEDSharingConnection *)self pongDiscovery];
    [v14 setDiscoveryFlags:100794256];

    v15 = [(DEDSharingConnection *)self pongDiscovery];
    [v15 setScanRate:20];

    id v16 = Log_5();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [(DEDSharingConnection *)self pongDiscovery];
      *(_DWORD *)buf = 138412290;
      v39 = v17;
      _os_log_impl(&dword_21FE04000, v16, OS_LOG_TYPE_DEFAULT, "Initialized Pong discovery %@", buf, 0xCu);
    }
    id v18 = [MEMORY[0x263EFF9A0] dictionary];
    [(DEDSharingConnection *)self setPongingDevices:v18];

    objc_initWeak((id *)buf, self);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke;
    v35[3] = &unk_26453B7D8;
    objc_copyWeak(&v37, (id *)buf);
    id v19 = v4;
    id v36 = v19;
    v20 = [(DEDSharingConnection *)self pongDiscovery];
    [v20 setDeviceFoundHandler:v35];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_53;
    v32[3] = &unk_26453B800;
    objc_copyWeak(&v34, (id *)buf);
    id v33 = v19;
    uint64_t v21 = [(DEDSharingConnection *)self pongDiscovery];
    [v21 setDeviceChangedHandler:v32];

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_54;
    v30[3] = &unk_26453B768;
    objc_copyWeak(&v31, (id *)buf);
    v22 = [(DEDSharingConnection *)self pongDiscovery];
    [v22 setDeviceLostHandler:v30];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_56;
    v28[3] = &unk_26453A9F0;
    objc_copyWeak(&v29, (id *)buf);
    v23 = [(DEDSharingConnection *)self pongDiscovery];
    [v23 setInterruptionHandler:v28];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_57;
    v26[3] = &unk_26453A9F0;
    objc_copyWeak(&v27, (id *)buf);
    id v24 = [(DEDSharingConnection *)self pongDiscovery];
    [v24 setInvalidationHandler:v26];

    v25 = [(DEDSharingConnection *)self pongDiscovery];
    [v25 activateWithCompletion:&__block_literal_global_60_1];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
  }
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleIncomingPongingDevice:v3 fromInbound:*(void *)(a1 + 32)];
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_53_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleIncomingPongingDevice:v3 fromInbound:*(void *)(a1 + 32)];
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v3;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_INFO, "Pong discovery deviceLost called for device [%@]", (uint8_t *)&v16, 0xCu);
  }

  id v5 = [v3 identifier];
  int v6 = [v5 UUIDString];

  int v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  int v9 = [WeakRetained pongingDevices];
  id v10 = [v9 objectForKey:v6];

  if (v10)
  {
    uint64_t v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_54_cold_1();
    }

    id v12 = +[DEDDevice deviceForSFDevice:v3 andStatus:4];
    id v13 = objc_loadWeakRetained(v7);
    [v13 updateControllerWithDevice:v12 andStatus:4];

    id v14 = objc_loadWeakRetained(v7);
    v15 = [v14 pongingDevices];
    [v15 removeObjectForKey:v6];
  }
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_56(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained pongDiscovery];
  [v3 invalidate];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setPongDiscovery:0];

  id v5 = Log_5();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Pong discovery interrupted.", v6, 2u);
  }
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_57(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPongDiscovery:0];

  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "Pong discovery invalidated.", v3, 2u);
  }
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = Log_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "Pong discovery activated (error: %@).", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_handleIncomingPongingDevice:(id)a3 fromInbound:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 identifier];
  int v9 = [v8 UUIDString];

  int v10 = [v6 isValidDEDPongDevice];
  uint64_t v11 = [(DEDSharingConnection *)self pongingDevices];
  id v12 = [v11 objectForKeyedSubscript:v9];

  if (!v10 || v12)
  {
    if (v12) {
      int v19 = v10;
    }
    else {
      int v19 = 0;
    }
    if (v19 == 1)
    {
      v20 = Log_5();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:]();
      }
    }
    else
    {
      if (v12) {
        char v21 = 1;
      }
      else {
        char v21 = v10;
      }
      if (v21)
      {
        v22 = +[DEDDevice deviceForSFDevice:v6 andStatus:4];
        [(DEDSharingConnection *)self updateControllerWithDevice:v22 andStatus:4];
        v23 = [(DEDSharingConnection *)self pongingDevices];
        [v23 removeObjectForKey:v9];

        goto LABEL_26;
      }
      v20 = Log_5();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:]();
      }
    }

    goto LABEL_26;
  }
  id v13 = Log_5();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_21FE04000, v13, OS_LOG_TYPE_DEFAULT, "Incoming pong discovery. New device has pong action and within range, will get status [%@]", buf, 0xCu);
  }

  id v14 = Log_5();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:].cold.5(v6);
  }

  v15 = Log_5();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:].cold.4(v6);
  }

  [(DEDSharingConnection *)self _saveDevice:v6];
  int v16 = [(DEDSharingConnection *)self pongingDevices];
  [v16 setObject:v6 forKeyedSubscript:v9];

  id v17 = Log_5();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection _handleIncomingPongingDevice:fromInbound:](self);
  }

  uint64_t v18 = [(DEDSharingConnection *)self run_queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__DEDSharingConnection__handleIncomingPongingDevice_fromInbound___block_invoke;
  block[3] = &unk_26453A830;
  block[4] = self;
  id v25 = v6;
  id v26 = v7;
  dispatch_async(v18, block);

LABEL_26:
}

uint64_t __65__DEDSharingConnection__handleIncomingPongingDevice_fromInbound___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) trySessionWithFoundDevice:*(void *)(a1 + 40) fromInbound:*(void *)(a1 + 48)];
}

- (void)stopPongDiscovery
{
  id v3 = Log_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "Stopping pong discovery.", v5, 2u);
  }

  int v4 = [(DEDSharingConnection *)self pongDiscovery];
  [v4 invalidate];

  [(DEDSharingConnection *)self setPongDiscovery:0];
}

- (void)trySessionWithFoundDevice:(id)a3 fromInbound:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[DEDDevice deviceForSFDevice:v6 andStatus:3];
  int v9 = [(DEDSharingConnection *)self _existingSharingSessionForDevice:v8];
  if (v9)
  {
    [(DEDSharingConnection *)self checkReadinessForSFDevice:v6 session:v9];
  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke;
    v10[3] = &unk_26453B828;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    [(DEDSharingConnection *)self createSharingSessionForSFDevice:v11 holdForPIN:0 fromInbound:v7 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v10 = WeakRetained;
  if (a3)
  {
    [WeakRetained checkReadinessForSFDevice:*(void *)(a1 + 32) session:v6];
  }
  else
  {
    [WeakRetained stopSession:v6];

    id v8 = objc_loadWeakRetained(v5);
    int v9 = objc_msgSend(v8, "run_queue");
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke_2;
    block[3] = &unk_26453AA40;
    objc_copyWeak(&v13, v5);
    id v12 = *(id *)(a1 + 32);
    dispatch_async(v9, block);

    objc_destroyWeak(&v13);
  }
}

void __62__DEDSharingConnection_trySessionWithFoundDevice_fromInbound___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained getSystemInfoForDevice:*(void *)(a1 + 32)];
}

- (void)getSystemInfoForDevice:(id)a3
{
  id v4 = a3;
  id v5 = Log_5();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection getSystemInfoForDevice:](v4);
  }

  id v6 = [(DEDSharingConnection *)self bluetoothSessionSemaphore];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v7 = objc_alloc_init(MEMORY[0x263F6C2D8]);
  id v8 = objc_alloc_init(MEMORY[0x263F6C210]);
  int v9 = [v4 identifier];
  [v8 setIdentifier:v9];

  [v7 setPeerDevice:v8];
  [v7 setAllowUnencrypted:1];
  [v7 activate];
  id v10 = Log_5();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection getSystemInfoForDevice:](v4);
  }

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke;
  v20[3] = &unk_26453B850;
  v23 = v24;
  v20[4] = self;
  id v11 = v4;
  id v21 = v11;
  id v12 = v7;
  id v22 = v12;
  [v12 getSystemInfoWithCompletion:v20];
  dispatch_time_t v13 = dispatch_time(0, 18000000000);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_71;
  v16[3] = &unk_26453AF70;
  v16[4] = self;
  id v17 = v11;
  id v18 = v12;
  int v19 = v24;
  id v14 = v12;
  id v15 = v11;
  dispatch_after(v13, MEMORY[0x263EF83A0], v16);

  _Block_object_dispose(v24, 8);
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_7:
    id v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _saveDevice:*(void *)(a1 + 40)];
    id v8 = +[DEDDevice deviceForSFDevice:*(void *)(a1 + 40) systemInfo:v5 andStatus:2];
    [*(id *)(a1 + 32) updateControllerWithDevice:v8 andStatus:2];
    goto LABEL_10;
  }
  int v9 = [*(id *)(a1 + 32) bluetoothSessionSemaphore];
  dispatch_semaphore_signal(v9);

  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_2();
    }
LABEL_10:
  }
  [*(id *)(a1 + 48) invalidate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

uint64_t __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_71(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    id v2 = [*(id *)(result + 32) bluetoothSessionSemaphore];
    dispatch_semaphore_signal(v2);

    id v3 = Log_5();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_71_cold_1(v1);
    }

    result = [*(id *)(v1 + 48) invalidate];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (void)checkReadinessForSFDevice:(id)a3 session:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = Log_5();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection checkReadinessForSFDevice:session:](v5);
  }

  v11[0] = @"setup";
  v11[1] = @"yourIdentifier";
  v12[0] = @"ready_check";
  id v8 = [v5 identifier];
  int v9 = [v8 UUIDString];
  v12[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v6 sendWithFlags:0 object:v10];
}

- (void)sharing_startPairSetupForDevice:(id)a3 fromInbound:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = Log_5();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection sharing_startPairSetupForDevice:fromInbound:](v6);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke;
  v16[3] = &unk_26453B8A0;
  v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  id v11 = (void (**)(void, void))MEMORY[0x223C5FFB0](v16);
  id v12 = [(DEDSharingConnection *)self _existingSharingSessionForDevice:v9];
  if (v12)
  {
    ((void (**)(void, void *))v11)[2](v11, v12);
  }
  else
  {
    dispatch_time_t v13 = [v9 sfDevice];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_82;
    v14[3] = &unk_26453B8C8;
    id v15 = v11;
    [(DEDSharingConnection *)self createSharingSessionForSFDevice:v13 holdForPIN:1 fromInbound:v10 completion:v14];
  }
}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2;
  v6[3] = &unk_26453B878;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  [v5 pairSetupWithFlags:8 completion:v6];
}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_2(v4);
  }

  if (v3)
  {
    if ([v3 code] != -6723)
    {
      id v5 = Log_5();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_1();
      }

      objc_msgSend(*(id *)(a1 + 32), "sharing_startPairSetupForDevice:fromInbound:", *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) controller];
    objc_msgSend(v6, "sharingInbound_successPINForDevice:fromInbound:", *(void *)(a1 + 40), *(void *)(a1 + 48));

    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) sfDevice];
    [v7 checkReadinessForSFDevice:v8 session:*(void *)(a1 + 56)];
  }
}

uint64_t __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sharing_tryPIN:(id)a3 forDevice:(id)a4 fromInbound:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = Log_5();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "trying pin for device [%{public}@]", (uint8_t *)&v13, 0xCu);
  }

  id v10 = [(DEDSharingConnection *)self _existingSharingSessionForDevice:v8];
  id v11 = v10;
  if (v10)
  {
    [v10 pairSetupTryPIN:v7];
  }
  else
  {
    id v12 = Log_5();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DEDSharingConnection sharing_tryPIN:forDevice:fromInbound:]();
    }
  }
}

- (id)sharingOutboundForBugSessionIdentifier:(id)a3 device:(id)a4 fromInbound:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDSharingConnection *)self _existingSharingSessionForDevice:v9];
  if (v11
    || ([(DEDSharingConnection *)self blockingSharingSessionForDevice:v9 fromInbound:v10], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v12 = [[DEDSharingOutbound alloc] initWithID:v8 withSFSession:v11 connection:self];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)sharing_startBugSessionWithIdentifier:(id)a3 configuration:(id)a4 caller:(id)a5 target:(id)a6 fromInbound:(id)a7
{
  v23[5] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = [(DEDSharingConnection *)self blockingSharingSessionForDevice:v15 fromInbound:a7];
  if (v16)
  {
    id v17 = Log_5();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingConnection sharing_startBugSessionWithIdentifier:configuration:caller:target:fromInbound:](v15);
    }

    id v18 = [v13 secureArchive];
    if (!v18)
    {
      id v18 = [MEMORY[0x263EFF8F8] data];
    }
    v22[0] = @"setup";
    v22[1] = @"sessionID";
    v23[0] = @"start_session";
    v23[1] = v12;
    v23[2] = v18;
    v22[2] = @"config";
    v22[3] = @"callingDevice";
    int v19 = [v14 serialize];
    v23[3] = v19;
    v22[4] = @"targetDevice";
    v20 = [v15 serialize];
    void v23[4] = v20;
    id v21 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

    [v16 sendWithFlags:0 object:v21];
  }
}

- (void)sharing_didStartBugSessionWithInfo:(id)a3 forCaller:(id)a4
{
  id v8 = a3;
  id v6 = [(DEDSharingConnection *)self _existingSharingSessionForDevice:a4];
  if (v6)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
    [v7 setObject:@"did_start_session" forKeyedSubscript:@"setup"];
    [v6 sendWithFlags:0 object:v7];
  }
}

- (void)updateControllerWithDevice:(id)a3 andStatus:(int64_t)a4
{
  id v14 = a3;
  id v6 = [(DEDSharingConnection *)self deviceStatusCallback];

  if (v6)
  {
    [v14 setStatus:a4];
    id v7 = [(DEDSharingConnection *)self deviceStatusCallback];
    ((void (**)(void, id, int64_t))v7)[2](v7, v14, a4);
  }
  id v8 = [(DEDSharingConnection *)self deviceSessions];
  id v9 = [v14 address];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = [(DEDSharingConnection *)self deviceSessions];
    id v12 = [v14 address];
    id v13 = [v11 objectForKeyedSubscript:v12];
    [(DEDSharingConnection *)self stopSession:v13];
  }
}

- (void)_saveDevice:(id)a3
{
  id v4 = a3;
  id v7 = [(DEDSharingConnection *)self discoveredDevices];
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];
  [v7 setObject:v4 forKey:v6];
}

- (void)_configureService:(id)a3 withLabel:(id)a4 needsSetup:(BOOL)a5 actionType:(unsigned __int8)a6 completion:(id)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  [v12 setAdvertiseRate:40];
  [v12 setIdentifier:*MEMORY[0x263F6C370]];
  [v12 setLabel:v13];
  if (v9)
  {
    [v12 setNeedsSetup:1];
    [v12 setDeviceActionType:v8];
  }
  else
  {
    [v12 setNeedsSetup:0];
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke;
  v28[3] = &unk_26453AA40;
  objc_copyWeak(&v30, &from);
  id v15 = v13;
  id v29 = v15;
  [v12 setInterruptionHandler:v28];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_103;
  v26[3] = &unk_26453A5C0;
  id v16 = v15;
  id v27 = v16;
  [v12 setInvalidationHandler:v26];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_104;
  void v24[3] = &unk_26453B8F0;
  objc_copyWeak(&v25, &location);
  [v12 setReceivedObjectHandler:v24];
  [v12 setReceivedRequestHandler:0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2;
  v19[3] = &unk_26453B918;
  BOOL v22 = v9;
  id v17 = v16;
  id v20 = v17;
  char v23 = v8;
  id v18 = v14;
  id v21 = v18;
  [v12 activateWithCompletion:v19];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];

  id v3 = Log_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ service interrupted.", (uint8_t *)&v5, 0xCu);
  }
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_103(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ service invalidated.", (uint8_t *)&v4, 0xCu);
  }
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_104(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = [WeakRetained sharingInbound];
  [v8 handleObject:v6 forSFSession:v7];
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = Log_5();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_2();
    }
  }
  else if (v6)
  {
    __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, MEMORY[0x263EFFA68]);
  }
}

- (id)_existingSharingSessionForDevice:(id)a3
{
  int v4 = [a3 address];
  uint64_t v5 = [(DEDSharingConnection *)self deviceSessions];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = Log_5();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DEDSharingConnection _existingSharingSessionForDevice:]();
    }

    uint64_t v8 = [(DEDSharingConnection *)self deviceSessions];
    BOOL v9 = [v8 objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)blockingSharingSessionForDevice:(id)a3 fromInbound:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = Log_5();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDSharingConnection blockingSharingSessionForDevice:fromInbound:](v6);
  }

  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__4;
  id v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  uint64_t v9 = [(DEDSharingConnection *)self _existingSharingSessionForDevice:v6];
  id v10 = (void *)v22[5];
  void v22[5] = v9;

  id v11 = (void *)v22[5];
  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    id v14 = [v6 sfDevice];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__DEDSharingConnection_blockingSharingSessionForDevice_fromInbound___block_invoke;
    v18[3] = &unk_26453B940;
    id v20 = &v21;
    id v15 = v13;
    int v19 = v15;
    [(DEDSharingConnection *)self createSharingSessionForSFDevice:v14 holdForPIN:0 fromInbound:v7 completion:v18];

    dispatch_time_t v16 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v15, v16);
    id v12 = (id)v22[5];
  }
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __68__DEDSharingConnection_blockingSharingSessionForDevice_fromInbound___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)createSharingSessionForSFDevice:(id)a3 holdForPIN:(BOOL)a4 fromInbound:(id)a5 completion:(id)a6
{
  v54[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__4;
  v51 = __Block_byref_object_dispose__4;
  id v52 = objc_alloc_init(MEMORY[0x263F6C2B8]);
  [(id)v48[5] setServiceIdentifier:*MEMORY[0x263F6C370]];
  [(id)v48[5] setPeerDevice:v9];
  v53 = @"com.apple.DeviceDiagnostics";
  v54[0] = MEMORY[0x263EFFA88];
  id v12 = [NSDictionary dictionaryWithObjects:v54 forKeys:&v53 count:1];
  [(id)v48[5] setPairSetupACL:v12];

  [(id)v48[5] setLabel:@"ded-session"];
  objc_initWeak(&location, (id)v48[5]);
  objc_initWeak(&from, self);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke;
  v43[3] = &unk_26453B2D8;
  id v13 = v9;
  id v44 = v13;
  [(id)v48[5] setErrorHandler:v43];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_110;
  v39[3] = &unk_26453B968;
  id v14 = v13;
  id v40 = v14;
  objc_copyWeak(&v41, &from);
  objc_copyWeak(&v42, &location);
  [(id)v48[5] setInterruptionHandler:v39];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_111;
  v35[3] = &unk_26453B968;
  id v15 = v14;
  id v36 = v15;
  objc_copyWeak(&v37, &from);
  objc_copyWeak(&v38, &location);
  [(id)v48[5] setInvalidationHandler:v35];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_112;
  v31[3] = &unk_26453B990;
  id v16 = v15;
  id v32 = v16;
  objc_copyWeak(&v34, &from);
  id v17 = v10;
  id v33 = v17;
  [(id)v48[5] setPromptForPINHandler:v31];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_2;
  v28[3] = &unk_26453B9B8;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(&v30, &location);
  [(id)v48[5] setReceivedObjectHandler:v28];
  id v18 = (void *)v48[5];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3;
  v22[3] = &unk_26453B9E0;
  id v25 = &v47;
  id v19 = v16;
  id v23 = v19;
  objc_copyWeak(&v26, &from);
  BOOL v27 = a4;
  id v20 = v11;
  id v24 = v20;
  [v18 activateWithCompletion:v22];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v47, 8);
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = Log_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_cold_1();
  }
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_110(uint64_t a1)
{
  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_110_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained deviceSessions];
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [v5 peerDevice];
  id v7 = [v6 identifier];
  uint64_t v8 = [v7 UUIDString];
  [v4 removeObjectForKey:v8];
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_111(uint64_t a1)
{
  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_111_cold_1(a1);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained deviceSessions];
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [v5 peerDevice];
  id v7 = [v6 identifier];
  uint64_t v8 = [v7 UUIDString];
  [v4 removeObjectForKey:v8];
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_112(uint64_t a1)
{
  id v4 = +[DEDDevice deviceForSFDevice:*(void *)(a1 + 32) andStatus:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained controller];
  objc_msgSend(v3, "sharingInbound_promptPINForDevice:fromInbound:", v4, *(void *)(a1 + 40));
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained sharingInbound];
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 handleObject:v5 forSFSession:v7];
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_2();
  }

  if (v3)
  {
    id v5 = Log_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v8 = [WeakRetained deviceSessions];
    id v9 = [*(id *)(a1 + 32) identifier];
    id v10 = [v9 UUIDString];
    [v8 setObject:v6 forKeyedSubscript:v10];

    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    [v11 _verifyPairingForSession:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) holdForPIN:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 40)];
  }
}

- (void)_verifyPairingForSession:(id)a3 holdForPIN:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__DEDSharingConnection__verifyPairingForSession_holdForPIN_completion___block_invoke;
  void v12[3] = &unk_26453BA08;
  id v10 = v8;
  id v13 = v10;
  BOOL v16 = a4;
  objc_copyWeak(&v15, &location);
  id v11 = v9;
  id v14 = v11;
  [v10 pairVerifyWithFlags:8 completion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __71__DEDSharingConnection__verifyPairingForSession_holdForPIN_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = Log_5();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) peerDevice];
      id v7 = [v6 identifier];
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "verifyPairing (%@) error: %@ ", (uint8_t *)&v12, 0x16u);
    }
    if (!*(unsigned char *)(a1 + 56))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained stopSession:*(void *)(a1 + 32)];
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      id v10 = [*(id *)(a1 + 32) peerDevice];
      id v11 = [v10 identifier];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "verifyPairing (%@) success!", (uint8_t *)&v12, 0xCu);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)stopSession:(id)a3
{
  id v8 = a3;
  id v4 = [(DEDSharingConnection *)self deviceSessions];
  BOOL v5 = [v8 peerDevice];
  uint64_t v6 = [v5 identifier];
  id v7 = [v6 UUIDString];
  [v4 removeObjectForKey:v7];

  [v8 invalidate];
}

- (void)addIncomingSFSession:(id)a3 forIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__DEDSharingConnection_addIncomingSFSession_forIdentifier___block_invoke;
  v14[3] = &unk_26453BA30;
  id v8 = v7;
  id v15 = v8;
  objc_copyWeak(&v16, &location);
  [v6 setInvalidationHandler:v14];
  id v9 = Log_5();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "Incoming SFSession added for %@", buf, 0xCu);
  }

  id v10 = [(DEDSharingConnection *)self deviceSessions];
  id v11 = [v10 objectForKeyedSubscript:v8];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    id v13 = [(DEDSharingConnection *)self deviceSessions];
    [v13 setObject:v6 forKeyedSubscript:v8];
  }
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __59__DEDSharingConnection_addIncomingSFSession_forIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "Incoming SFSession Invalidated for %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained deviceSessions];
  [v5 removeObjectForKey:*(void *)(a1 + 32)];
}

- (DEDSharingInbound)sharingInbound
{
  return (DEDSharingInbound *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharingInbound:(id)a3
{
}

- (DEDSharingInboundDelegate)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (DEDSharingInboundDelegate *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (BOOL)listenForClients
{
  return self->_listenForClients;
}

- (void)setListenForClients:(BOOL)a3
{
  self->_listenForClients = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSMutableDictionary)pongingDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPongingDevices:(id)a3
{
}

- (NSMutableDictionary)deviceSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceSessions:(id)a3
{
}

- (NSMutableDictionary)discoveredDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDiscoveredDevices:(id)a3
{
}

- (OS_dispatch_queue)run_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRun_queue:(id)a3
{
}

- (OS_dispatch_semaphore)bluetoothSessionSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBluetoothSessionSemaphore:(id)a3
{
}

- (SFService)pingService
{
  return self->_pingService;
}

- (void)setPingService:(id)a3
{
}

- (SFDeviceDiscovery)pingDiscovery
{
  return self->_pingDiscovery;
}

- (void)setPingDiscovery:(id)a3
{
}

- (NSMutableSet)visiblePingUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVisiblePingUUIDs:(id)a3
{
}

- (SFService)workerService
{
  return self->_workerService;
}

- (void)setWorkerService:(id)a3
{
}

- (SFDeviceDiscovery)pongDiscovery
{
  return self->_pongDiscovery;
}

- (void)setPongDiscovery:(id)a3
{
}

- (id)deviceStatusCallback
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setDeviceStatusCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceStatusCallback, 0);
  objc_storeStrong((id *)&self->_pongDiscovery, 0);
  objc_storeStrong((id *)&self->_workerService, 0);
  objc_storeStrong((id *)&self->_visiblePingUUIDs, 0);
  objc_storeStrong((id *)&self->_pingDiscovery, 0);
  objc_storeStrong((id *)&self->_pingService, 0);
  objc_storeStrong((id *)&self->_bluetoothSessionSemaphore, 0);
  objc_storeStrong((id *)&self->_run_queue, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_deviceSessions, 0);
  objc_storeStrong((id *)&self->_pongingDevices, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_sharingInbound, 0);
}

- (void)initWithController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "DEDSharingConnection initialized.", v1, 2u);
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Ping discovery deviceFound called for device [%@]", v2);
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_44_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

void __42__DEDSharingConnection_startPingDiscovery__block_invoke_49_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Ping discovery activated with error [%@]", v1, 0xCu);
}

- (void)_handleIncomingPingingDevice:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Incoming ping discovery. Already tracking device [%@]", v2);
}

- (void)_handleIncomingPingingDevice:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 visiblePingUUIDs];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "Tracked DED ping devices %@", v4, v5, v6, v7, v8);
}

- (void)_handleIncomingPingingDevice:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Incoming ping discovery. New device not valid, ignoring [%@]", v2);
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Pong discovery deviceFound called for device [%@]", v2);
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_53_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Pong discovery deviceChangedHandler called for device [%@]", v2);
}

void __54__DEDSharingConnection_startPongDiscoveryFromInbound___block_invoke_54_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "pongDiscovery.deviceLost: %@", v2);
}

- (void)_handleIncomingPongingDevice:fromInbound:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Incoming pong discovery. Already tracking device [%@]", v2);
}

- (void)_handleIncomingPongingDevice:fromInbound:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Incoming pong discovery. New device is not valid, will ignore [%@]", v2);
}

- (void)_handleIncomingPongingDevice:(void *)a1 fromInbound:.cold.3(void *a1)
{
  uint64_t v1 = [a1 pongingDevices];
  uint64_t v2 = [v1 allKeys];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v3, v4, "Tracked DED pong devices %@", v5, v6, v7, v8, v9);
}

- (void)_handleIncomingPongingDevice:(void *)a1 fromInbound:.cold.4(void *a1)
{
  [a1 needsSetup];
  [a1 systemPairState];
  OUTLINED_FUNCTION_10(&dword_21FE04000, v2, v3, "---- setup? %@\t paired: %s", v4, v5, v6, v7, 2u);
}

- (void)_handleIncomingPongingDevice:(void *)a1 fromInbound:.cold.5(void *a1)
{
  uint64_t v2 = [a1 name];
  uint64_t v3 = [a1 model];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v4, v5, "---- %@ \tmodel: %@", v6, v7, v8, v9, v10);
}

- (void)getSystemInfoForDevice:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "getSystemInfo activated (%@)", v4, v5, v6, v7, v8);
}

- (void)getSystemInfoForDevice:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "getSystemInfo queued (%@)", v4, v5, v6, v7, v8);
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [*(id *)(v0 + 40) identifier];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v2, v3, "getSystemInfo (%@) dict:%@", v4, v5, v6, v7, v8);
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [*(id *)(v0 + 40) identifier];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v2, v3, "getSystemInfo (%@) error: %@", v4, v5, v6, v7, v8);
}

void __47__DEDSharingConnection_getSystemInfoForDevice___block_invoke_71_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "getSystemInfo (%@) timeout invalidation", v4, v5, v6, v7, v8);
}

- (void)checkReadinessForSFDevice:(void *)a1 session:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "checkReadiness (%@)", v4, v5, v6, v7, v8);
}

- (void)sharing_startPairSetupForDevice:(void *)a1 fromInbound:.cold.1(void *a1)
{
  uint64_t v2 = [a1 address];
  uint64_t v3 = [a1 name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v4, v5, "startPairSetup (%@) %@", v6, v7, v8, v9, v10);
}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "--- error, retrying setup (error:%@)", v2);
}

void __68__DEDSharingConnection_sharing_startPairSetupForDevice_fromInbound___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "Session Pair completion", v1, 2u);
}

- (void)sharing_tryPIN:forDevice:fromInbound:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "no session for pin attempt for device [%{public}@]", v1, 0xCu);
}

- (void)sharing_startBugSessionWithIdentifier:(void *)a1 configuration:caller:target:fromInbound:.cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "startBugSessionWithIdentifier sending start_session to %@", v4, v5, v6, v7, v8);
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
}

void __85__DEDSharingConnection__configureService_withLabel_needsSetup_actionType_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x20u);
}

- (void)_existingSharingSessionForDevice:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_21FE04000, v0, v1, "Got sharingSession for device address: %@", v2);
}

- (void)blockingSharingSessionForDevice:(void *)a1 fromInbound:.cold.1(void *a1)
{
  uint64_t v1 = [a1 address];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "blockingSharingSessionForDevice: %@", v4, v5, v6, v7, v8);
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8_2(v0) identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v2, v3, "SFSession (%@) Error %{public}@", v4, v5, v6, v7, v8);
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_110_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8_2(a1) identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "SFSession (%@) Interrupted.", v4, v5, v6, v7, v8);
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_111_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8_2(a1) identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "SFSession (%@) Invalidated", v4, v5, v6, v7, v8);
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_8_2(v0) identifier];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v2, v3, "SFSession activate failed for device (%@) (Error %@).", v4, v5, v6, v7, v8);
}

void __90__DEDSharingConnection_createSharingSessionForSFDevice_holdForPIN_fromInbound_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) identifier];
  uint64_t v5 = [*(id *)(v3 + 32) identifier];
  int v6 = 138412802;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v1;
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "SFSession %@ Activated for device (%@) (Error %@).", (uint8_t *)&v6, 0x20u);
}

@end