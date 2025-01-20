@interface CAMOverlayService
+ (CAMOverlayService)sharedService;
+ (int64_t)version;
- (CAMOverlayServiceConnection)_activeConnection;
- (id)_init;
- (id)createConnectionWithClient:(id)a3;
- (id)createConnectionWithClient:(id)a3 queue:(id)a4;
- (void)_setActiveConnection:(id)a3;
@end

@implementation CAMOverlayService

+ (int64_t)version
{
  return 1;
}

+ (CAMOverlayService)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedService_sharedService;
  return (CAMOverlayService *)v2;
}

uint64_t __34__CAMOverlayService_sharedService__block_invoke()
{
  sharedService_sharedService = [[CAMOverlayService alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CAMOverlayService;
  return [(CAMOverlayService *)&v3 init];
}

- (id)createConnectionWithClient:(id)a3
{
  return [(CAMOverlayService *)self createConnectionWithClient:a3 queue:MEMORY[0x263EF83A0]];
}

- (id)createConnectionWithClient:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CAMOverlayService *)self _activeConnection];
  v9 = [[CAMOverlayServiceConnection alloc] initWithClient:v7 queue:v6];

  [(CAMOverlayService *)self _setActiveConnection:v9];
  if (!v8
    || ([v8 clientQueue], id v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 == v6))
  {
    [v8 invalidateWithReason:0];
  }
  else
  {
    v11 = [v8 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__CAMOverlayService_createConnectionWithClient_queue___block_invoke;
    block[3] = &unk_265261DD0;
    id v14 = v8;
    dispatch_async(v11, block);
  }
  return v9;
}

uint64_t __54__CAMOverlayService_createConnectionWithClient_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateWithReason:0];
}

- (CAMOverlayServiceConnection)_activeConnection
{
  return self->__activeConnection;
}

- (void)_setActiveConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end