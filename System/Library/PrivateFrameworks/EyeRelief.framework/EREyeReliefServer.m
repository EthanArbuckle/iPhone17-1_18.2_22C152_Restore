@interface EREyeReliefServer
+ (id)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (EREyeReliefServer)init;
- (NSMutableArray)clientConnections;
- (NSXPCListener)listener;
- (OS_dispatch_queue)connectionQueue;
- (id)distanceSamplingToggleHandler;
- (id)isDistanceSamplingEnabledHandler;
- (void)isDistanceSamplingEnabled:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setDistanceSamplingToggleHandler:(id)a3;
- (void)setIsDistanceSamplingEnabledHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)startServer;
- (void)toggleDistanceSampling:(id)a3;
@end

@implementation EREyeReliefServer

+ (id)sharedServer
{
  if (sharedServer_once != -1) {
    dispatch_once(&sharedServer_once, &__block_literal_global);
  }
  v2 = (void *)sharedServer_instance;

  return v2;
}

uint64_t __33__EREyeReliefServer_sharedServer__block_invoke()
{
  sharedServer_instance = objc_alloc_init(EREyeReliefServer);

  return MEMORY[0x270F9A758]();
}

- (EREyeReliefServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)EREyeReliefServer;
  v2 = [(EREyeReliefServer *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(EREyeReliefServer *)v2 setClientConnections:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.eyerelief.connectionqueue", 0);
    [(EREyeReliefServer *)v2 setConnectionQueue:v4];
  }
  return v2;
}

- (void)startServer
{
  v3 = [NSString stringWithFormat:@"Starting up server"];
  +[ERLogging log:v3 withType:3];

  dispatch_queue_t v4 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.eyereliefd"];
  [(EREyeReliefServer *)self setListener:v4];

  v5 = [(EREyeReliefServer *)self listener];
  [v5 setDelegate:self];

  id v6 = [(EREyeReliefServer *)self listener];
  [v6 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 processIdentifier];
  v9 = [v7 valueForEntitlement:@"com.apple.eyerelief.distancesampling"];
  char v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = EREyeReliefProtocolInterface();
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:self];
    v12 = [(EREyeReliefServer *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_2653037D8;
    int v22 = v8;
    block[4] = self;
    id v13 = v7;
    id v21 = v13;
    dispatch_async(v12, block);

    objc_initWeak(&location, v13);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v16[3] = &unk_265303800;
    v16[4] = self;
    int v18 = v8;
    objc_copyWeak(&v17, &location);
    [v13 setInvalidationHandler:v16];
    [v13 resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"Rejecting client connection from pid %d: Client not permitted to activate distance sampling.", v8);
    +[ERLogging log:v14 withType:1];
  }
  return v10;
}

void __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"Adding client connection from pid %d", *(unsigned int *)(a1 + 48));
  +[ERLogging log:v2 withType:3];

  id v3 = [*(id *)(a1 + 32) clientConnections];
  [v3 addObject:*(void *)(a1 + 40)];
}

void __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_3;
  block[3] = &unk_265303800;
  int v5 = *(_DWORD *)(a1 + 48);
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __56__EREyeReliefServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"Removing client connection from pid %d", *(unsigned int *)(a1 + 48));
  +[ERLogging log:v2 withType:3];

  id v4 = [*(id *)(a1 + 32) clientConnections];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 removeObject:WeakRetained];
}

- (void)toggleDistanceSampling:(id)a3
{
  id v8 = a3;
  id v4 = [(EREyeReliefServer *)self distanceSamplingToggleHandler];

  if (v4)
  {
    int v5 = [(EREyeReliefServer *)self distanceSamplingToggleHandler];
    v5[2]();
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"distanceSamplingStatusHandler was nil"];
    +[ERLogging log:v6 withType:3];
  }
  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id, BOOL, void))v8 + 2))(v8, v4 != 0, 0);
    id v7 = v8;
  }
}

- (void)isDistanceSamplingEnabled:(id)a3
{
  id v8 = a3;
  id v4 = [(EREyeReliefServer *)self isDistanceSamplingEnabledHandler];

  if (!v4)
  {
    id v7 = (void (**)(void, void, void))v8;
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  int v5 = [(EREyeReliefServer *)self isDistanceSamplingEnabledHandler];
  uint64_t v6 = v5[2]();

  id v7 = (void (**)(void, void, void))v8;
  if (v8)
  {
LABEL_6:
    ((void (**)(id, uint64_t, void))v7)[2](v8, v6, 0);
    id v7 = (void (**)(void, void, void))v8;
  }
LABEL_7:
}

- (id)distanceSamplingToggleHandler
{
  return self->_distanceSamplingToggleHandler;
}

- (void)setDistanceSamplingToggleHandler:(id)a3
{
}

- (id)isDistanceSamplingEnabledHandler
{
  return self->_isDistanceSamplingEnabledHandler;
}

- (void)setIsDistanceSamplingEnabledHandler:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_isDistanceSamplingEnabledHandler, 0);

  objc_storeStrong(&self->_distanceSamplingToggleHandler, 0);
}

@end