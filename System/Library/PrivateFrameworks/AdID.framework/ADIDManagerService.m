@interface ADIDManagerService
+ (id)sharedInstance;
- (ADIDManagerService)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)reconcileArray;
- (NSXPCListener)listener;
- (unint64_t)delayForNewForceReconcileRequest;
- (void)forceReconcile:(id)a3;
- (void)setListener:(id)a3;
- (void)setReconcileArray:(id)a3;
@end

@implementation ADIDManagerService

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__ADIDManagerService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken != -1) {
    dispatch_once(&sharedInstance__onceToken, block);
  }
  v2 = (void *)sharedInstance__instance;

  return v2;
}

uint64_t __36__ADIDManagerService_sharedInstance__block_invoke()
{
  sharedInstance__instance = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (ADIDManagerService)init
{
  v11.receiver = self;
  v11.super_class = (Class)ADIDManagerService;
  v2 = [(ADIDManagerService *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    reconcileArray = v2->_reconcileArray;
    v2->_reconcileArray = (NSMutableArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ap.adprivacyd.forceReconcile", 0);
    forceReconcileQueue = v2->_forceReconcileQueue;
    v2->_forceReconcileQueue = (OS_dispatch_queue *)v5;

    id v7 = objc_alloc(MEMORY[0x263F08D88]);
    uint64_t v8 = [v7 initWithMachServiceName:*MEMORY[0x263F24140]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v8;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.ap.idmanager"];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    [v5 setExportedObject:self];
    uint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D5A7360];
    [v5 setExportedInterface:v8];

    [v5 setInvalidationHandler:&__block_literal_global_1];
    v9 = [NSString stringWithFormat:@"Accepted connection from ID manager client."];
    _ADLog();

    [v5 resume];
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Rejected ID manager client with PID %d lacking the appropriate entitlement (%@).", objc_msgSend(v5, "processIdentifier"), @"com.apple.private.ap.idmanager"];
    _ADLog();
  }
  return v7;
}

void __57__ADIDManagerService_listener_shouldAcceptNewConnection___block_invoke()
{
  id v0 = [NSString stringWithFormat:@"XPC connection invalidated. Lost connection from ID manager client."];
  _ADLog();
}

- (void)forceReconcile:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ADIDManagerService *)self delayForNewForceReconcileRequest];
  if (v5)
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"Delaying forceReconcile for %lu seconds.", v5);
    _ADLog();
  }
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * v5);
  forceReconcileQueue = self->_forceReconcileQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ADIDManagerService_forceReconcile___block_invoke;
  block[3] = &unk_264669878;
  id v11 = v4;
  id v9 = v4;
  dispatch_after(v7, forceReconcileQueue, block);
}

void __37__ADIDManagerService_forceReconcile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F24230] workQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__ADIDManagerService_forceReconcile___block_invoke_2;
  v3[3] = &unk_264669878;
  id v4 = *(id *)(a1 + 32);
  [v2 addOperationWithBlock:v3];
}

void __37__ADIDManagerService_forceReconcile___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F241D8] sharedInstance];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__ADIDManagerService_forceReconcile___block_invoke_3;
  v3[3] = &unk_264669850;
  id v4 = *(id *)(a1 + 32);
  [v2 reconcile:v3];
}

void __37__ADIDManagerService_forceReconcile___block_invoke_3(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = (void *)MEMORY[0x263F087E8];
    v6 = [v3 domain];
    uint64_t v7 = [v4 code];
    v13 = @"Error Description";
    uint64_t v8 = [v4 description];
    v14[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = [v5 errorWithDomain:v6 code:v7 userInfo:v9];

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
}

- (unint64_t)delayForNewForceReconcileRequest
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [MEMORY[0x263EFF910] date];
  id v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = v2->_reconcileArray;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        [v3 timeIntervalSinceDate:v9];
        if (v10 > 30.0) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)v2->_reconcileArray removeObjectsInArray:v4];
  [(NSMutableArray *)v2->_reconcileArray addObject:v3];
  uint64_t v11 = [NSString stringWithFormat:@"Times that a forceReconcile have been requested: %@", v2->_reconcileArray];
  _ADLog();

  uint64_t v12 = [(NSMutableArray *)v2->_reconcileArray count];
  objc_sync_exit(v2);

  return v12 - 1;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (NSMutableArray)reconcileArray
{
  return self->_reconcileArray;
}

- (void)setReconcileArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconcileArray, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_forceReconcileQueue, 0);
}

@end