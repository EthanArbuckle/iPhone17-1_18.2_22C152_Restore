@interface MPCPlaybackEngineMiddlewareOperation
- (MPCPlaybackEngineMiddleware)middleware;
- (MPCPlaybackEngineMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4;
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

@implementation MPCPlaybackEngineMiddlewareOperation

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

void __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke(id *a1)
{
  v2 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  objc_initWeak(&location, a1[4]);
  id v3 = objc_alloc(MEMORY[0x263F120F0]);
  uint64_t v4 = *MEMORY[0x263F11158];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke_2;
  v6[3] = &unk_2643C04F8;
  objc_copyWeak(&v8, &location);
  id v7 = a1[6];
  v5 = (void *)[v3 initWithName:v4 object:0 handler:v6];
  [v2 addObject:v5];
  objc_storeStrong((id *)a1[5] + 36, v2);
  [a1[5] finish];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)execute
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [(MPCPlaybackEngineMiddlewareOperation *)self inputOperations];
  uint64_t v4 = [v3 objectForKey:&unk_26CC38538];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) controller];
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  v11 = [v10 resolvedPlayerPath];
  char v12 = [v11 isInProcess];

  if (v12)
  {
    v13 = (void *)MEMORY[0x263F12118];
    v14 = [(MPCPlaybackEngineMiddlewareOperation *)self playerRequest];
    v15 = [v14 playerPath];
    v16 = [v15 playerID];
    v17 = [v13 infoCenterForPlayerID:v16];

    v18 = [v17 playbackEngine];
    if (v18)
    {
      v19 = [(MPCPlaybackEngineMiddlewareOperation *)self middleware];
      [v19 setPlaybackEngine:v18];

      v20 = _Block_copy(self->_invalidationHandler);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke;
      block[3] = &unk_2643C5620;
      v24 = self;
      id v25 = v20;
      id v23 = v18;
      id v21 = v20;
      dispatch_async(MEMORY[0x263EF83A0], block);
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

- (MPCPlayerRequest)playerRequest
{
  return self->_playerRequest;
}

- (MPCPlaybackEngineMiddleware)middleware
{
  return self->_middleware;
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
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (MPCPlaybackEngineMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlaybackEngineMiddlewareOperation;
  uint64_t v9 = [(MPAsyncOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerRequest, a4);
  }

  return v10;
}

- (void)setPlayerRequest:(id)a3
{
}

- (void)setMiddleware:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

void __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [v4 object];

  uint64_t v6 = [WeakRetained player];
  id v7 = [v6 currentItem];

  if (v5 == v7) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end