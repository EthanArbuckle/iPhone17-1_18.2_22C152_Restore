@interface MSOpenCompose
+ (MSOpenCompose)sharedInstance;
+ (void)presentNewMailWithContext:(id)a3 delegateEndpoint:(id)a4 completion:(id)a5;
- (MSOpenCompose)init;
- (void)presentNewMailWithContext:(void *)a3 delegateEndpoint:(void *)a4 completion:;
@end

@implementation MSOpenCompose

+ (MSOpenCompose)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MSOpenCompose_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;

  return (MSOpenCompose *)v2;
}

void __31__MSOpenCompose_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;
}

+ (void)presentNewMailWithContext:(id)a3 delegateEndpoint:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [a1 sharedInstance];
  -[MSOpenCompose presentNewMailWithContext:delegateEndpoint:completion:](v10, v11, v8, v9);
}

- (void)presentNewMailWithContext:(void *)a3 delegateEndpoint:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a1)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__MSOpenCompose_presentNewMailWithContext_delegateEndpoint_completion___block_invoke;
    v13[3] = &unk_264242F90;
    id v11 = v9;
    id v14 = v11;
    v12 = [a1 remoteObjectProxyWithErrorHandler:v13];
    [v12 presentNewMailWithContext:v7 delegateEndpoint:v8 completion:v11];
  }
}

- (MSOpenCompose)init
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C607548];
  v6.receiver = self;
  v6.super_class = (Class)MSOpenCompose;
  v4 = [(MSXPCService *)&v6 initWithRemoteObjectInterface:v3];

  return v4;
}

void __71__MSOpenCompose_presentNewMailWithContext_delegateEndpoint_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

@end