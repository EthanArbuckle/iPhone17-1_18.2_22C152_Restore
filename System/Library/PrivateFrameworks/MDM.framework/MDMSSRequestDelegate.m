@interface MDMSSRequestDelegate
- (MDMSSRequestDelegate)initWithRequest:(id)a3;
- (SSRequest)request;
- (void)_startTimeout:(double)a3 completionBlock:(id)a4;
- (void)_timerDidFire:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
@end

@implementation MDMSSRequestDelegate

- (MDMSSRequestDelegate)initWithRequest:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MDMSSRequestDelegate;
  v6 = [(MDMSSRequestDelegate *)&v15 init];
  v7 = v6;
  if (v6)
  {
    if (!v5) {
      -[MDMSSRequestDelegate initWithRequest:]();
    }
    objc_storeStrong((id *)&v6->_request, a3);
    [(SSRequest *)v7->_request setDelegate:v7];
    id v8 = objc_alloc(MEMORY[0x263EFFA20]);
    v9 = [MEMORY[0x263EFF910] distantFuture];
    v10 = [MEMORY[0x263EFF910] distantFuture];
    [v10 timeIntervalSinceReferenceDate];
    uint64_t v11 = objc_msgSend(v8, "initWithFireDate:interval:target:selector:userInfo:repeats:", v9, v7, sel__timerDidFire_, v7, 1);
    timeoutTimer = v7->_timeoutTimer;
    v7->_timeoutTimer = (NSTimer *)v11;

    v13 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v13 addTimer:v7->_timeoutTimer forMode:*MEMORY[0x263EFF588]];
  }
  return v7;
}

- (void)dealloc
{
  [(NSTimer *)self->_timeoutTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MDMSSRequestDelegate;
  [(MDMSSRequestDelegate *)&v3 dealloc];
}

- (void)_startTimeout:(double)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke;
  v8[3] = &unk_264B9E0E0;
  double v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  _performBlockOnMainThread(v8);
}

void __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = v2;
    v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    objc_super v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    id v6 = v4;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Request starting. Timeout: %.1f seconds", buf, 0x16u);
  }
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_cold_1();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_2;
  v12[3] = &unk_264B9D4A8;
  id v13 = *(id *)(a1 + 40);
  uint64_t v7 = MEMORY[0x230FC63F0](v12);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v7;

  double v10 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:*(double *)(a1 + 48)];
  [v10 setFireDate:v11];

  [*(id *)(*(void *)(a1 + 32) + 8) start];
}

uint64_t __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cancel
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __30__MDMSSRequestDelegate_cancel__block_invoke;
  v2[3] = &unk_264B9D3E0;
  v2[4] = self;
  _performBlockOnMainThread(v2);
}

uint64_t __30__MDMSSRequestDelegate_cancel__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = v2;
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling request...", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 16)) {
    __30__MDMSSRequestDelegate_cancel__block_invoke_cold_1();
  }
  id v6 = *(void **)(v5 + 24);
  uint64_t v7 = [MEMORY[0x263EFF910] distantFuture];
  [v6 setFireDate:v7];

  return [*(id *)(*(void *)(a1 + 32) + 8) cancel];
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    id v20 = v5;
    id v8 = v18;
    _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Request failed. Error: %{public}@", buf, 0x16u);
  }
  timeoutTimer = self->_timeoutTimer;
  id v10 = [MEMORY[0x263EFF910] distantFuture];
  [(NSTimer *)timeoutTimer setFireDate:v10];

  uint64_t v11 = (void *)MEMORY[0x230FC63F0](self->_completionBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  if (v11)
  {
    id v13 = dispatch_get_global_queue(0, 0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__MDMSSRequestDelegate_request_didFailWithError___block_invoke;
    v14[3] = &unk_264B9D0E8;
    id v16 = v11;
    id v15 = v5;
    dispatch_async(v13, v14);
  }
}

uint64_t __49__MDMSSRequestDelegate_request_didFailWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)requestDidFinish:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v6 = v15;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed.", buf, 0xCu);
  }
  timeoutTimer = self->_timeoutTimer;
  id v8 = [MEMORY[0x263EFF910] distantFuture];
  [(NSTimer *)timeoutTimer setFireDate:v8];

  int v9 = (void *)MEMORY[0x230FC63F0](self->_completionBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  if (v9)
  {
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__MDMSSRequestDelegate_requestDidFinish___block_invoke;
    block[3] = &unk_264B9E2C8;
    id v13 = v9;
    dispatch_async(v11, block);
  }
}

uint64_t __41__MDMSSRequestDelegate_requestDidFinish___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_timerDidFire:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = v4;
    *(_DWORD *)buf = 138543362;
    id v18 = (id)objc_opt_class();
    id v6 = v18;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Request timed out. Canceling.", buf, 0xCu);
  }
  [(MDMSSRequestDelegate *)self cancel];
  uint64_t v7 = (void *)MEMORY[0x230FC63F0](self->_completionBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  int v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F38AF8];
  uint64_t v11 = DMCErrorArray();
  v12 = objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 30001, v11, *MEMORY[0x263F38A40], 0);

  if (v7)
  {
    id v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__MDMSSRequestDelegate__timerDidFire___block_invoke;
    block[3] = &unk_264B9D0E8;
    id v16 = v7;
    id v15 = v12;
    dispatch_async(v13, block);
  }
}

uint64_t __38__MDMSSRequestDelegate__timerDidFire___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (SSRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)initWithRequest:.cold.1()
{
}

void __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_cold_1()
{
}

void __30__MDMSSRequestDelegate_cancel__block_invoke_cold_1()
{
}

@end