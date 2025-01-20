@interface MPCSuzeLeaseSessionController
+ (MPCSuzeLeaseSessionController)sharedController;
- (id)_init;
- (void)startLeaseSessionWithConfiguration:(id)a3 completion:(id)a4;
- (void)stopLeaseSession:(id)a3 completion:(id)a4;
- (void)suzeLeaseSession:(id)a3 leaseRenewalDidFailWithError:(id)a4;
@end

@implementation MPCSuzeLeaseSessionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaseIDToLeaseSessionInfo, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)suzeLeaseSession:(id)a3 leaseRenewalDidFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke;
  block[3] = &unk_2643C6660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v6)];
      v8 = [v7 icLeaseSession];
      id v9 = *(void **)(a1 + 40);

      if (v8 == v9) {
        break;
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    if (!v7) {
      return;
    }
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke_2;
    block[3] = &unk_2643C6660;
    id v14 = v7;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v11;
    uint64_t v16 = v12;
    id v2 = v7;
    dispatch_async(v10, block);
  }
LABEL_12:
}

void __79__MPCSuzeLeaseSessionController_suzeLeaseSession_leaseRenewalDidFailWithError___block_invoke_2(uint64_t a1)
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = [*(id *)(a1 + 32) mpcLeaseSession];
  [v5 setObject:v2 forKey:@"MPCSuzeLeaseControllerUserInfoKeySession"];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v5 setObject:v3 forKey:@"MPCSuzeLeaseControllerUserInfoKeyError"];
  }
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification" object:*(void *)(a1 + 48) userInfo:v5];
}

- (void)stopLeaseSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke;
  block[3] = &unk_2643C5620;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_after(v8, MEMORY[0x263EF83A0], block);
}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_2;
  block[3] = &unk_2643C5620;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  dispatch_barrier_async(v2, block);
}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) icSuzeLeaseSession];
  id v3 = [v2 configuration];
  uint64_t v4 = [v3 leaseID];

  if (v4
    && ([*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v4],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    uint64_t v7 = [v5 clientCount];
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    [v6 setClientCount:v8 - 1];
    if ([v6 clientCount] <= 0)
    {
      id v11 = [v6 icLeaseSession];
      [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v4];
      if (![*(id *)(*(void *)(a1 + 40) + 24) count])
      {
        uint64_t v14 = *(void *)(a1 + 40);
        id v15 = *(void **)(v14 + 24);
        *(void *)(v14 + 24) = 0;
      }
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_3;
      v21[3] = &unk_2643C5350;
      id v16 = *(id *)(a1 + 48);
      v21[4] = *(void *)(a1 + 40);
      id v22 = v16;
      [v11 stopLeaseSessionWithCompletionHandler:v21];

      goto LABEL_15;
    }
    id v9 = *(void **)(a1 + 48);
    if (v9)
    {
      id v10 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_5;
      block[3] = &unk_2643C54B8;
      id v20 = v9;
      dispatch_async(v10, block);
      id v11 = v20;
LABEL_15:
    }
  }
  else
  {
    id v12 = *(void **)(a1 + 48);
    if (v12)
    {
      id v13 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_6;
      v17[3] = &unk_2643C54B8;
      id v18 = v12;
      dispatch_async(v13, v17);
      id v6 = 0;
      id v11 = v18;
      goto LABEL_15;
    }
    id v6 = 0;
  }
}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_4;
    block[3] = &unk_2643C4880;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:9 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __61__MPCSuzeLeaseSessionController_stopLeaseSession_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)startLeaseSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke;
  block[3] = &unk_2643C5620;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(accessQueue, block);
}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) leaseID];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v2];
  if (!v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F89380]) initWithConfiguration:*(void *)(a1 + 32)];
    [v4 setDelegate:*(void *)(a1 + 40)];
    id v3 = [[_MPCSuzeLeaseSessionInfo alloc] initWithICLeaseSession:v4];
    id v5 = *(void **)(*(void *)(a1 + 40) + 24);
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void **)(v7 + 24);
      *(void *)(v7 + 24) = v6;

      id v5 = *(void **)(*(void *)(a1 + 40) + 24);
    }
    [v5 setObject:v3 forKey:v2];
  }
  [(_MPCSuzeLeaseSessionInfo *)v3 setClientCount:[(_MPCSuzeLeaseSessionInfo *)v3 clientCount] + 1];
  id v9 = [(_MPCSuzeLeaseSessionInfo *)v3 icLeaseSession];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_2;
  v13[3] = &unk_2643C4858;
  id v10 = *(void **)(a1 + 48);
  v13[4] = *(void *)(a1 + 40);
  id v15 = v2;
  id v16 = v10;
  id v14 = v3;
  id v11 = v2;
  id v12 = v3;
  [v9 startLeaseSessionWithCompletionHandler:v13];
}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (a2)
  {
    id v10 = *(NSObject **)(v9 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_3;
    block[3] = &unk_2643C5620;
    id v22 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 40);
    id v21 = v7;
    dispatch_async(v10, block);

    id v11 = v22;
  }
  else
  {
    id v12 = *(NSObject **)(v9 + 8);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_4;
    v13[3] = &unk_2643C4830;
    v13[4] = v9;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 56);
    id v16 = v7;
    id v17 = v8;
    dispatch_barrier_async(v12, v13);

    id v11 = v14;
  }
}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) mpcLeaseSession];
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40), 0);
}

void __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 24) count])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = 0;
    }
  }
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_5;
  block[3] = &unk_2643C5620;
  id v10 = *(id *)(a1 + 72);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  dispatch_async(v6, block);
}

uint64_t __79__MPCSuzeLeaseSessionController_startLeaseSessionWithConfiguration_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCSuzeLeaseSessionController;
  uint64_t v2 = [(MPCSuzeLeaseSessionController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCSuzeLeaseSessionController.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCSuzeLeaseSessionController.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (MPCSuzeLeaseSessionController)sharedController
{
  if (sharedController_sOnceToken != -1) {
    dispatch_once(&sharedController_sOnceToken, &__block_literal_global_26631);
  }
  uint64_t v2 = (void *)sharedController_sSharedController;

  return (MPCSuzeLeaseSessionController *)v2;
}

void __49__MPCSuzeLeaseSessionController_sharedController__block_invoke()
{
  id v0 = [[MPCSuzeLeaseSessionController alloc] _init];
  uint64_t v1 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v0;
}

@end