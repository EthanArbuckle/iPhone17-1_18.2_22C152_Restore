@interface AEInvalidationRouter
- (AEInvalidationRouter)initWithQueue:(id)a3;
- (id)invalidationHandler;
- (void)fetchCapturedErrorWithCompletion:(id)a3;
- (void)forwardError;
- (void)setRouterDelegate:(id)a3;
- (void)setRouterMode:(int64_t)a3;
@end

@implementation AEInvalidationRouter

- (AEInvalidationRouter)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEInvalidationRouter;
  v6 = [(AEInvalidationRouter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_mode = 0;
  }

  return v7;
}

- (void)setRouterMode:(int64_t)a3
{
  objc_initWeak(&location, self);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__AEInvalidationRouter_setRouterMode___block_invoke;
  block[3] = &unk_264EA39E8;
  v6 = queue;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(v6, block);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __38__AEInvalidationRouter_setRouterMode___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[4] = *(void *)(a1 + 40);
  }
  id v3 = WeakRetained;
  -[AEInvalidationRouter forwardError]((uint64_t)WeakRetained);
}

- (void)forwardError
{
  if (a1)
  {
    v2 = (id *)(a1 + 24);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained && *(void *)(a1 + 32) == 1)
    {
      id v6 = WeakRetained;
      id v4 = *(id *)(a1 + 40);
      if (v4)
      {
        int v5 = *(unsigned __int8 *)(a1 + 9);

        if (v5) {
          return;
        }
        *(unsigned char *)(a1 + 9) = 1;
        id v6 = objc_loadWeakRetained(v2);
        [v6 invalidationRouter:a1 didReceiveInvalidationError:*(void *)(a1 + 40)];
      }
      id WeakRetained = v6;
    }
  }
}

- (void)setRouterDelegate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AEInvalidationRouter_setRouterDelegate___block_invoke;
  block[3] = &unk_264EA3A10;
  id v6 = queue;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __42__AEInvalidationRouter_setRouterDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_storeWeak(WeakRetained + 3, *(id *)(a1 + 32));
  }
  -[AEInvalidationRouter forwardError]((uint64_t)WeakRetained);
}

- (void)fetchCapturedErrorWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__AEInvalidationRouter_fetchCapturedErrorWithCompletion___block_invoke;
  block[3] = &unk_264EA3A38;
  id v9 = v4;
  id v6 = v4;
  id v7 = queue;
  objc_copyWeak(&v10, &location);
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__AEInvalidationRouter_fetchCapturedErrorWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = *((void *)WeakRetained + 5);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, v3);
}

- (id)invalidationHandler
{
  objc_initWeak(&location, self);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__AEInvalidationRouter_invalidationHandler__block_invoke;
  v9[3] = &unk_264EA3A60;
  id v10 = v4;
  int v5 = v4;
  objc_copyWeak(&v11, &location);
  id v6 = (void *)MEMORY[0x23ED033D0](v9);
  id v7 = (void *)MEMORY[0x23ED033D0]();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __43__AEInvalidationRouter_invalidationHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__AEInvalidationRouter_invalidationHandler__block_invoke_2;
  v6[3] = &unk_264EA3A10;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __43__AEInvalidationRouter_invalidationHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 8))
    {
      *((unsigned char *)WeakRetained + 8) = 1;
      id v3 = WeakRetained;
      objc_storeStrong((id *)WeakRetained + 5, *(id *)(a1 + 32));
      id WeakRetained = v3;
      if (*((void *)v3 + 4) == 1)
      {
        -[AEInvalidationRouter forwardError]((uint64_t)v3);
        id WeakRetained = v3;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end