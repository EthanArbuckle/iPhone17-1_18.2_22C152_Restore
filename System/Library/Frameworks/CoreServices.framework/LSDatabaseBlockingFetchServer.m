@interface LSDatabaseBlockingFetchServer
+ (id)sharedInstance;
- (BOOL)isForManualRebuild;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (id)getEndpoint;
- (void)setBlockingIsForManualRebuild:(BOOL)a3;
- (void)startRunningIfNecessary;
@end

@implementation LSDatabaseBlockingFetchServer

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)LSDatabaseBlockingFetchServer;
  v2 = [(LSDatabaseBlockingFetchServer *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.lsd.LSDatabaseBlockingFetchServer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v2->_running = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__LSDatabaseBlockingFetchServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_sharedServer;

  return v2;
}

void __47__LSDatabaseBlockingFetchServer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)sharedInstance_sharedServer;
  sharedInstance_sharedServer = v1;
}

- (void)startRunningIfNecessary
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__LSDatabaseBlockingFetchServer_startRunningIfNecessary__block_invoke;
  block[3] = &unk_1E522C268;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__LSDatabaseBlockingFetchServer_startRunningIfNecessary__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    result = [*(id *)(v1 + 16) resume];
    *(unsigned char *)(*(void *)(v2 + 32) + 24) = 1;
  }
  return result;
}

- (id)getEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (void)setBlockingIsForManualRebuild:(BOOL)a3
{
}

- (BOOL)isForManualRebuild
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_forManualRebuild);
  return v2 & 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 _setQueue:self->_queue];
  v8 = LSDatabaseBlockingFetchInterface();
  [v7 setExportedInterface:v8];

  objc_super v9 = [[LSDatabaseBlockingFetchClient alloc] initWithXPCConnection:v7];
  [v7 setExportedObject:v9];

  id from = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __68__LSDatabaseBlockingFetchServer_listener_shouldAcceptNewConnection___block_invoke;
  v14 = &unk_1E522C1C8;
  objc_copyWeak(&v15, &from);
  [v7 setInvalidationHandler:&v11];
  objc_msgSend(v7, "resume", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);

  return 1;
}

void __68__LSDatabaseBlockingFetchServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExportedObject:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end