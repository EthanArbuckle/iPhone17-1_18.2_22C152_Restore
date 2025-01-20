@interface MPCReportingDeviceIdentityPropertiesLoader
+ (MPCReportingDeviceIdentityPropertiesLoader)sharedLoader;
- (MPCReportingDeviceIdentityPropertiesLoader)init;
- (void)loadReportingIdentityPropertiesWithCompletionHandler:(id)a3;
@end

@implementation MPCReportingDeviceIdentityPropertiesLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialWorkQueue, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)loadReportingIdentityPropertiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serialWorkQueue = self->_serialWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_2643C55A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialWorkQueue, v7);
}

void __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F893C0] activeAccount];
  v3 = [MEMORY[0x263F893C8] defaultIdentityStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_2643BF488;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v2;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v2;
  [v3 getPropertiesForUserIdentity:v6 completionHandler:v7];
}

void __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(MPCReportingIdentityProperties);
  v5 = [v3 DSID];
  -[MPCReportingIdentityProperties setStoreAccountID:](v4, "setStoreAccountID:", [v5 unsignedLongLongValue]);

  id v6 = [v3 storefrontIdentifier];

  if (v6)
  {
    [(MPCReportingIdentityProperties *)v4 setStoreFrontID:v6];
  }
  else
  {
    v7 = [MEMORY[0x263F893C8] defaultIdentityStore];
    id v8 = [v7 localStoreAccountProperties];
    uint64_t v9 = [v8 storefrontIdentifier];
    [(MPCReportingIdentityProperties *)v4 setStoreFrontID:v9];
  }
  id v10 = [MEMORY[0x263F11D68] cloudServiceStatusControllerWithUserIdentity:*(void *)(a1 + 32)];
  v11 = [v10 musicSubscriptionStatus];
  -[MPCReportingIdentityProperties setHasSubscriptionPlaybackCapability:](v4, "setHasSubscriptionPlaybackCapability:", [v11 hasCapability:1]);
  v12 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_2643C55A8;
  id v13 = *(id *)(a1 + 48);
  v16 = v4;
  id v17 = v13;
  v14 = v4;
  dispatch_async(v12, v15);
}

uint64_t __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (MPCReportingDeviceIdentityPropertiesLoader)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCReportingDeviceIdentityPropertiesLoader;
  v2 = [(MPCReportingDeviceIdentityPropertiesLoader *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCReportingDeviceIdentityPropertiesLoader.serialWorkQueue", 0);
    serialWorkQueue = v2->_serialWorkQueue;
    v2->_serialWorkQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCReportingDeviceIdentityPropertiesLoader.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (MPCReportingDeviceIdentityPropertiesLoader)sharedLoader
{
  if (sharedLoader_sOnceToken != -1) {
    dispatch_once(&sharedLoader_sOnceToken, &__block_literal_global_3197);
  }
  v2 = (void *)sharedLoader_sSharedLoader;

  return (MPCReportingDeviceIdentityPropertiesLoader *)v2;
}

void __58__MPCReportingDeviceIdentityPropertiesLoader_sharedLoader__block_invoke()
{
  v0 = objc_alloc_init(MPCReportingDeviceIdentityPropertiesLoader);
  v1 = (void *)sharedLoader_sSharedLoader;
  sharedLoader_sSharedLoader = (uint64_t)v0;
}

@end