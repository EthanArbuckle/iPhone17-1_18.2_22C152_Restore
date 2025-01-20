@interface DSXPCServer
- (DSCohortManager)cohortManager;
- (DSDeviceContext)myDeviceContext;
- (DSXPCServer)init;
- (NSMutableSet)xpcConnections;
- (OS_dispatch_queue)dispatchQueue;
- (void)_activate;
- (void)_deviceFoundHandler:(id)a3;
- (void)_deviceLostHandler:(id)a3;
- (void)_ensureAdvertiserStarted;
- (void)_ensureAdvertiserStopped;
- (void)_ensureScannerStarted;
- (void)_ensureScannerStopped;
- (void)_handleXPCConnection:(id)a3;
- (void)_invalidate;
- (void)_receivedXPCObject:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)removeXPCConnection:(id)a3;
- (void)setCohortManager:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMyDeviceContext:(id)a3;
- (void)updateAdvertiser;
- (void)updateScanner;
@end

@implementation DSXPCServer

- (DSXPCServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)DSXPCServer;
  v2 = [(DSXPCServer *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.distributedsensingd", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__DSXPCServer_activate__block_invoke;
  block[3] = &unk_2646D4E18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__DSXPCServer_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    return [*(id *)(result + 32) _activate];
  }
  return result;
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSXPCServer != -1) {
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  }
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.distributedsensingd", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;

    v6 = self->_xpcListener;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __24__DSXPCServer__activate__block_invoke;
    handler[3] = &unk_2646D4E40;
    handler[4] = self;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(self->_xpcListener);
  }
  if (!self->_myDeviceContext)
  {
    objc_super v7 = objc_alloc_init(DSDeviceContext);
    myDeviceContext = self->_myDeviceContext;
    self->_myDeviceContext = v7;

    [(DSDeviceContext *)self->_myDeviceContext setIsMe:1];
  }
  if (!self->_cohortManager)
  {
    v9 = objc_alloc_init(DSCohortManager);
    cohortManager = self->_cohortManager;
    self->_cohortManager = v9;

    [(DSCohortManager *)self->_cohortManager setDispatchQueue:self->_dispatchQueue];
    [(DSCohortManager *)self->_cohortManager setXpcDaemonServer:self];
  }
}

uint64_t __24__DSXPCServer__activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _receivedXPCObject:a2];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__DSXPCServer_invalidate__block_invoke;
  block[3] = &unk_2646D4E18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__DSXPCServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSXPCServer != -1) {
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  }
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate", buf, 2u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  dispatch_queue_t v4 = self->_xpcConnections;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "invalidate", (void)v12);
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  myDeviceContext = self->_myDeviceContext;
  if (myDeviceContext)
  {
    self->_myDeviceContext = 0;
  }
  cohortManager = self->_cohortManager;
  if (cohortManager)
  {
    self->_cohortManager = 0;
  }
  [(DSXPCServer *)self _ensureScannerStopped];
  [(DSXPCServer *)self _ensureAdvertiserStopped];
  [(NSMutableSet *)self->_xpcConnections removeAllObjects];
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;
}

- (void)_receivedXPCObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (MEMORY[0x223CBE6A0]() == MEMORY[0x263EF86F0])
  {
    [(DSXPCServer *)self _handleXPCConnection:v4];
  }
  else if (v4 == (id)MEMORY[0x263EF86A8])
  {
    if (onceTokenDSXPCServer != -1) {
      dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
    }
    uint64_t v7 = logObjDSXPCServer;
    if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_ERROR, "XPC Listener invalidated", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (onceTokenDSXPCServer != -1) {
      dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
    }
    uint64_t v5 = (void *)logObjDSXPCServer;
    if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = v5;
      int v8 = 136315138;
      uint64_t v9 = MEMORY[0x223CBE5A0](v4);
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_ERROR, "XPC Listener error, received XPC object :%s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_handleXPCConnection:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  uint64_t v5 = (_xpc_connection_s *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  uint64_t v9 = objc_alloc_init(DSXPCConnection);
  [(DSXPCConnection *)v9 setXpcDaemonServer:self];
  [(DSXPCConnection *)v9 setDispatchQueue:self->_dispatchQueue];
  [(DSXPCConnection *)v9 setPid:xpc_connection_get_pid(v5)];
  [(DSXPCConnection *)v9 setXpcConnection:v5];

  [(DSXPCConnection *)v9 activate];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    int v8 = self->_xpcConnections;
    self->_xpcConnections = v7;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v9];
}

- (void)removeXPCConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(NSMutableSet *)self->_xpcConnections removeObject:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_xpcConnections;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {

    -[DSDeviceContext setCoordinationStatus:](self->_myDeviceContext, "setCoordinationStatus:", 0, (void)v15);
    [(DSDeviceContext *)self->_myDeviceContext setTiebreaker:0];
LABEL_16:
    [(DSDeviceContext *)self->_myDeviceContext setVehicleState:0];
    [(DSDeviceContext *)self->_myDeviceContext setVehicleConfidence:0];
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v16;
  char v9 = 1;
  char v10 = 1;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      long long v13 = objc_msgSend(v12, "kappaSession", (void)v15);

      if (v13)
      {
        char v9 = 0;
      }
      else
      {
        long long v14 = [v12 motionSession];

        v10 &= v14 == 0;
      }
    }
    uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v7);

  if (v9)
  {
    [(DSDeviceContext *)self->_myDeviceContext setCoordinationStatus:0];
    [(DSDeviceContext *)self->_myDeviceContext setTiebreaker:0];
  }
  if (v10) {
    goto LABEL_16;
  }
LABEL_17:
  [(DSXPCServer *)self updateScanner];
  [(DSXPCServer *)self updateAdvertiser];
}

- (void)updateAdvertiser
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  *(_WORD *)&self->_shouldAdvertiseDSInfo = 0;
  v3 = self->_myDeviceContext;
  if ([(DSDeviceContext *)v3 coordinationStatus]) {
    self->_shouldAdvertiseDSAction = 1;
  }
  int v4 = [(DSDeviceContext *)v3 vehicleState];

  if (v4 == 1) {
    self->_shouldAdvertiseDSInfo = 1;
  }
  if (self->_shouldAdvertiseDSAction || self->_shouldAdvertiseDSInfo)
  {
    [(DSXPCServer *)self _ensureAdvertiserStarted];
  }
  else
  {
    [(DSXPCServer *)self _ensureAdvertiserStopped];
  }
}

- (void)_ensureAdvertiserStarted
{
  if (onceTokenDSXPCServer != -1) {
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  }
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Advertiser Started", v6, 2u);
  }
  int v4 = self->_advertiseManager;
  if (!v4)
  {
    int v4 = objc_alloc_init(DSAdvertiseManager);
    [(DSAdvertiseManager *)v4 setDispatchQueue:self->_dispatchQueue];
    [(DSAdvertiseManager *)v4 setXpcDaemonServer:self];
    objc_storeStrong((id *)&self->_advertiseManager, v4);
  }
  if (self->_shouldAdvertiseDSAction) {
    uint64_t v5 = (2 * self->_shouldAdvertiseDSInfo) | 4;
  }
  else {
    uint64_t v5 = 2 * self->_shouldAdvertiseDSInfo;
  }
  [(DSAdvertiseManager *)v4 setDsAdvertiseFlags:v5];
  [(DSAdvertiseManager *)v4 startAdvertising];
}

- (void)_ensureAdvertiserStopped
{
  if (onceTokenDSXPCServer != -1) {
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  }
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Advertiser Stopped", v6, 2u);
  }
  advertiseManager = self->_advertiseManager;
  if (advertiseManager)
  {
    [(DSAdvertiseManager *)advertiseManager stopAdvertising];
    uint64_t v5 = self->_advertiseManager;
    self->_advertiseManager = 0;
  }
}

- (void)updateScanner
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  *(_WORD *)&self->_shouldScanDSInfo = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_xpcConnections;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = objc_msgSend(v8, "kappaSession", (void)v12);

        p_shouldScanDSAction = &self->_shouldScanDSAction;
        if (!v9)
        {
          v11 = [v8 motionSession];

          p_shouldScanDSAction = &self->_shouldScanDSInfo;
          if (!v11) {
            continue;
          }
        }
        BOOL *p_shouldScanDSAction = 1;
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  if (self->_shouldScanDSAction || self->_shouldScanDSInfo) {
    [(DSXPCServer *)self _ensureScannerStarted];
  }
  else {
    [(DSXPCServer *)self _ensureScannerStopped];
  }
}

- (void)_ensureScannerStarted
{
  if (onceTokenDSXPCServer != -1) {
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  }
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Scanner Started", buf, 2u);
  }
  uint64_t v4 = self->_scanManager;
  if (!v4)
  {
    uint64_t v4 = objc_alloc_init(DSScanManager);
    [(DSScanManager *)v4 setDispatchQueue:self->_dispatchQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__DSXPCServer__ensureScannerStarted__block_invoke;
    v7[3] = &unk_2646D4E68;
    v7[4] = self;
    [(DSScanManager *)v4 setDeviceFoundHandler:v7];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__DSXPCServer__ensureScannerStarted__block_invoke_2;
    v6[3] = &unk_2646D4E68;
    v6[4] = self;
    [(DSScanManager *)v4 setDeviceLostHandler:v6];
    objc_storeStrong((id *)&self->_scanManager, v4);
  }
  if (self->_shouldScanDSAction) {
    uint64_t v5 = (2 * self->_shouldScanDSInfo) | 4;
  }
  else {
    uint64_t v5 = 2 * self->_shouldScanDSInfo;
  }
  [(DSScanManager *)v4 setDsScanFlags:v5];
  [(DSScanManager *)v4 startScanning];
}

uint64_t __36__DSXPCServer__ensureScannerStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceFoundHandler:a2];
}

uint64_t __36__DSXPCServer__ensureScannerStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceLostHandler:a2];
}

- (void)_ensureScannerStopped
{
  if (onceTokenDSXPCServer != -1) {
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  }
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Scanner Stopped", v6, 2u);
  }
  scanManager = self->_scanManager;
  if (scanManager)
  {
    [(DSScanManager *)scanManager stopScanning];
    uint64_t v5 = self->_scanManager;
    self->_scanManager = 0;
  }
}

- (void)_deviceFoundHandler:(id)a3
{
  cohortManager = self->_cohortManager;
  if (cohortManager) {
    [(DSCohortManager *)cohortManager deviceFound:a3];
  }
}

- (void)_deviceLostHandler:(id)a3
{
  cohortManager = self->_cohortManager;
  if (cohortManager) {
    [(DSCohortManager *)cohortManager deviceLost:a3];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableSet)xpcConnections
{
  return self->_xpcConnections;
}

- (DSDeviceContext)myDeviceContext
{
  return self->_myDeviceContext;
}

- (void)setMyDeviceContext:(id)a3
{
}

- (DSCohortManager)cohortManager
{
  return self->_cohortManager;
}

- (void)setCohortManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortManager, 0);
  objc_storeStrong((id *)&self->_myDeviceContext, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_advertiseManager, 0);
  objc_storeStrong((id *)&self->_scanManager, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end