@interface MPCMusicFavoritingMiddlewareOperation
- (MPCMusicFavoritingMiddleware)middleware;
- (MPCMusicFavoritingMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4;
- (MPCPlayerRequest)playerRequest;
- (NSArray)inputProtocols;
- (NSArray)invalidationObservers;
- (NSArray)outputProtocols;
- (NSMapTable)inputOperations;
- (id)invalidationHandler;
- (void)execute;
- (void)setInputOperations:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setPlayerRequest:(id)a3;
@end

@implementation MPCMusicFavoritingMiddlewareOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)outputProtocols
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)setInputOperations:(id)a3
{
}

uint64_t __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endObservingSubscriptionStatusWithToken:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)execute
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v3 = [(MPCPlayerRequest *)self->_playerRequest userIdentity];
  if (v3)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v4 = [(MPCMusicFavoritingMiddlewareOperation *)self inputOperations];
    v5 = [v4 objectForKey:&unk_26CC38538];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v54;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v53 + 1) + 8 * v8) controller];
        if (v9) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v9 = 0;
    }

    v10 = [v9 resolvedPlayerPath];
    char v11 = [v10 isSystemMusicPath];

    if (v11)
    {
      v12 = [MEMORY[0x263F89210] sharedMonitorForIdentity:v3];
      v13 = [v12 subscriptionStatus];
      [(MPCMusicFavoritingMiddleware *)self->_middleware setRequestingUserSubscriptionStatus:v13];
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__30816;
      v51 = __Block_byref_object_dispose__30817;
      id v52 = 0;
      id v14 = objc_alloc(MEMORY[0x263F54EE0]);
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke;
      v44[3] = &unk_2643C67A0;
      id v15 = v12;
      id v45 = v15;
      v46 = &v47;
      v16 = (void *)[v14 initWithBlock:v44];
      v17 = _Block_copy(self->_invalidationHandler);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_2;
      v41[3] = &unk_2643C57B8;
      id v31 = v13;
      id v42 = v31;
      id v18 = v17;
      id v43 = v18;
      uint64_t v19 = [v15 beginObservingSubscriptionStatusWithHandler:v41];
      v20 = (void *)v48[5];
      v48[5] = v19;

      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__30816;
      v39 = __Block_byref_object_dispose__30817;
      id v40 = 0;
      id v21 = objc_alloc(MEMORY[0x263F54EE0]);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_3;
      v34[3] = &unk_2643C57E0;
      v34[4] = &v35;
      v22 = (void *)[v21 initWithBlock:v34];
      v23 = [MEMORY[0x263F11F58] sharedDeviceLibraryController];
      v24 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v25 = *MEMORY[0x263F11498];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_4;
      v32[3] = &unk_2643C5808;
      id v26 = v18;
      id v33 = v26;
      uint64_t v27 = [v24 addObserverForName:v25 object:v23 queue:0 usingBlock:v32];
      v28 = (void *)v36[5];
      v36[5] = v27;

      v57[0] = v16;
      v57[1] = v22;
      v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
      invalidationObservers = self->_invalidationObservers;
      self->_invalidationObservers = v29;

      [(MPAsyncOperation *)self finish];
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(&v47, 8);
    }
    else
    {
      [(MPAsyncOperation *)self finish];
    }
  }
  else
  {
    [(MPAsyncOperation *)self finish];
  }
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_inputOperations, 0);
}

- (NSArray)inputProtocols
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CC38538;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (MPCMusicFavoritingMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCMusicFavoritingMiddlewareOperation;
  v9 = [(MPAsyncOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerRequest, a4);
  }

  return v10;
}

void __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if (v6 == v5)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [v6 isEqual:v5];

    if ((v8 & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)setPlayerRequest:(id)a3
{
}

- (MPCPlayerRequest)playerRequest
{
  return self->_playerRequest;
}

- (void)setMiddleware:(id)a3
{
}

- (MPCMusicFavoritingMiddleware)middleware
{
  return self->_middleware;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

uint64_t __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end