@interface HMServiceDaemon
+ (id)sharedHMServiceDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HMServiceDaemon)init;
- (void)_activate;
- (void)_fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5;
- (void)_modifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_reportDeviceRecordChange:(id)a3;
- (void)_reportDeviceRecordLost:(id)a3;
- (void)_reportValidAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5;
- (void)_triggerDiagnosticCheckForIdentifier:(id)a3 completion:(id)a4;
- (void)_update;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)reportDeviceRecordChange:(id)a3;
- (void)reportDeviceRecordLost:(id)a3;
- (void)reportDiagnosticRecordChange:(id)a3;
- (void)reportValidAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5;
@end

@implementation HMServiceDaemon

- (void)_reportValidAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = self->_xpcConnections;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "hearingModeClient", (void)v18);
        if (v17) {
          [v16 clientReportValidAudiograms:v8 invalidAudiograms:v9 error:v10];
        }
      }
      uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)_update
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_xpcConnections;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "audiogramsReported", (void)v8) & 1) == 0)
        {
          v7 = +[HMHealthKitUtilities sharedInstance];
          [v7 startAudiogramQuery];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270218390];
  id v7 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v8 = objc_opt_class();
  long long v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_clientHMAvailableAudiograms_invalidAudiograms_error_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v9 forSelector:sel_clientHMAvailableAudiograms_invalidAudiograms_error_ argumentIndex:1 ofReply:0];
  long long v10 = objc_alloc_init(HMServiceXPCConnection);
  [(HMServiceXPCConnection *)v10 setDaemon:self];
  [(HMServiceXPCConnection *)v10 setDispatchQueue:self->_dispatchQueue];
  [(HMServiceXPCConnection *)v10 setXpcCnx:v5];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v13 = self->_xpcConnections;
    self->_xpcConnections = v12;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v10];
  [v5 _setQueue:self->_dispatchQueue];
  uint64_t v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2702164D8];
  [v5 setExportedInterface:v14];

  [v5 setExportedObject:v10];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__HMServiceDaemon_listener_shouldAcceptNewConnection___block_invoke;
  v16[3] = &unk_265362628;
  v16[4] = self;
  v16[5] = v10;
  [v5 setInvalidationHandler:v16];
  [v5 setRemoteObjectInterface:v6];
  [v5 resume];
  if (gLogCategory_HMServiceDaemon <= 20
    && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

uint64_t __65__HMServiceDaemon_reportValidAudiograms_invalidAudiograms_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportValidAudiograms:*(void *)(a1 + 40) invalidAudiograms:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)reportValidAudiograms:(id)a3 invalidAudiograms:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__HMServiceDaemon_reportValidAudiograms_invalidAudiograms_error___block_invoke;
  v15[3] = &unk_2653628A0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

+ (id)sharedHMServiceDaemon
{
  if (sharedHMServiceDaemon_sOnce != -1) {
    dispatch_once(&sharedHMServiceDaemon_sOnce, &__block_literal_global_1);
  }
  v2 = (void *)sharedHMServiceDaemon_sSelf;
  return v2;
}

uint64_t __40__HMServiceDaemon_sharedHMServiceDaemon__block_invoke()
{
  v0 = objc_alloc_init(HMServiceDaemon);
  uint64_t v1 = sharedHMServiceDaemon_sSelf;
  sharedHMServiceDaemon_sSelf = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HMServiceDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMServiceDaemon;
  v2 = [(HMServiceDaemon *)&v8 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.HMService.daemon.queue", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = v2;
  }

  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HMServiceDaemon_activate__block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HMServiceDaemon_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HMServiceDaemon <= 30
    && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  return [v2 _activate];
}

- (void)_activate
{
  if (!self->_xpcListener)
  {
    uint64_t v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.HearingModeService"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  id v5 = +[HMDeviceManager sharedInstance];
  [v5 setDispatchQueue:self->_dispatchQueue];

  uint64_t v6 = +[HMDeviceManager sharedInstance];
  [v6 activate];

  id v7 = +[HMHealthKitUtilities sharedInstance];
  [v7 setDispatchQueue:self->_dispatchQueue];

  id v8 = +[HMHealthKitUtilities sharedInstance];
  [v8 activate];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HMServiceDaemon_invalidate__block_invoke;
  block[3] = &unk_265362650;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__HMServiceDaemon_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  dispatch_queue_t v4 = +[HMDeviceManager sharedInstance];
  [v4 invalidate];

  id v5 = +[HMHealthKitUtilities sharedInstance];
  [v5 invalidate];
}

uint64_t __54__HMServiceDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (gLogCategory_HMServiceDaemon <= 20)
  {
    if (gLogCategory_HMServiceDaemon != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      id v5 = [v4 xpcCnx];
      uint64_t v7 = [v5 processIdentifier];
      LogPrintF();

      id v4 = v8;
    }
  }
  objc_msgSend(v4, "xpcConnectionInvalidated", v7);
  [(NSMutableSet *)self->_xpcConnections removeObject:v8];
  [(HMServiceDaemon *)self _update];
}

- (void)_fetchOcclusionResultForDeviceIdentifier:(id)a3 featureID:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[HMDeviceManager sharedInstance];
  [v9 fetchOcclusionResultForDeviceIdentifier:v8 featureID:v5 completion:v7];
}

- (void)_modifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[HMDeviceManager sharedInstance];
  [v10 _modifyDeviceConfiguration:v9 identifier:v8 completion:v7];
}

- (void)reportDeviceRecordChange:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HMServiceDaemon_reportDeviceRecordChange___block_invoke;
  v7[3] = &unk_265362628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __44__HMServiceDaemon_reportDeviceRecordChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportDeviceRecordChange:*(void *)(a1 + 40)];
}

- (void)_reportDeviceRecordChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_xpcConnections;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "hearingModeClient", (void)v12);
        if (v11) {
          [v10 clientReportHMDeviceRecordChanged:v4];
        }
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)reportDeviceRecordLost:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HMServiceDaemon_reportDeviceRecordLost___block_invoke;
  v7[3] = &unk_265362628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__HMServiceDaemon_reportDeviceRecordLost___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportDeviceRecordLost:*(void *)(a1 + 40)];
}

- (void)_reportDeviceRecordLost:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_xpcConnections;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "clientReportHMDeviceRecordLost:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)reportDiagnosticRecordChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_xpcConnections;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "hearingModeClient", (void)v13);
        char v12 = [v11 internalFlags];

        if (v12) {
          [v10 clientReportDiagnosticRecord:v4];
        }
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_triggerDiagnosticCheckForIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[HMDeviceManager sharedInstance];
  [v7 _triggerDiagnosticCheckForIdentifier:v6 completion:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end