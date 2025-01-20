@interface PADVNSerialRequestsScheduler
- (BOOL)shouldProcessFrame:(id)a3;
- (PADVNSerialRequestsScheduler)init;
- (PADVNSerialRequestsScheduler)initWithQueue:(id)a3;
- (id)observationsFromRequest:(id)a3;
- (id)requestsForFrame:(id)a3 handler:(id)a4;
- (unint64_t)observationCompositeSetSize;
- (void)_dispatchVisionRequestForFrame:(id)a3;
- (void)_reset;
- (void)analyzeObservationComposite:(id)a3;
- (void)handleResultForRequest:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)processFrame:(id)a3;
- (void)waitForCurrentFrameProcessingWithCompletion:(id)a3;
@end

@implementation PADVNSerialRequestsScheduler

- (PADVNSerialRequestsScheduler)init
{
  v8.receiver = self;
  v8.super_class = (Class)PADVNSerialRequestsScheduler;
  v2 = [(PADVNSerialRequestsScheduler *)&v8 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [(PADVNSerialRequestsScheduler *)v2 _reset];
  }
  return v2;
}

- (PADVNSerialRequestsScheduler)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PADVNSerialRequestsScheduler;
  v6 = [(PADVNSerialRequestsScheduler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    [(PADVNSerialRequestsScheduler *)v7 _reset];
  }

  return v7;
}

- (void)processFrame:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_remainingRequests)
  {
  }
  else
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__PADVNSerialRequestsScheduler_processFrame___block_invoke;
    block[3] = &unk_264501B68;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    dispatch_async(queue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __45__PADVNSerialRequestsScheduler_processFrame___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained
    && !WeakRetained[4]
    && (id v4 = WeakRetained, [WeakRetained shouldProcessFrame:*(void *)(a1 + 32)]))
  {
    [v4 _dispatchVisionRequestForFrame:*(void *)(a1 + 32)];
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  return MEMORY[0x270F9A758]();
}

- (void)waitForCurrentFrameProcessingWithCompletion:(id)a3
{
  if (self->_isProcessingFrame)
  {
    self->_currentFrameProcessingCompletion = _Block_copy(a3);
    MEMORY[0x270F9A758]();
  }
  else
  {
    v3 = (void (*)(id))*((void *)a3 + 2);
    v3(a3);
  }
}

- (void)_dispatchVisionRequestForFrame:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_remainingRequests) {
    -[PADVNSerialRequestsScheduler _dispatchVisionRequestForFrame:]();
  }
  self->_isProcessingFrame = 1;
  objc_initWeak(&location, self);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke;
  v39[3] = &unk_264501BB8;
  objc_copyWeak(&v40, &location);
  id v5 = [(PADVNSerialRequestsScheduler *)self requestsForFrame:v4 handler:v39];
  requests = self->_requests;
  self->_requests = v5;

  self->_remainingRequests = [(NSArray *)self->_requests count];
  v7 = (NSMutableDictionary *)[MEMORY[0x263EFFA78] mutableCopy];
  currentObservationComposite = self->_currentObservationComposite;
  self->_currentObservationComposite = v7;

  id v9 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  v10 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v11 = self->_requests;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v16 = v9;
        }
        else {
          v16 = v10;
        }
        [v16 addObject:v15];
      }
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v12);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_3;
  block[3] = &unk_264501B90;
  objc_copyWeak(&v34, &location);
  id v18 = v10;
  id v32 = v18;
  id v19 = v4;
  id v33 = v19;
  dispatch_async(queue, block);
  id v20 = objc_alloc(MEMORY[0x263F1EF40]);
  uint64_t v21 = [v19 buffer];
  uint64_t v22 = [v19 orientation];
  v23 = (void *)[v20 initWithCVPixelBuffer:v21 orientation:v22 options:MEMORY[0x263EFFA78]];
  id v30 = 0;
  char v24 = [v23 performRequests:v9 error:&v30];
  id v25 = v30;
  id v26 = v30;
  if ((v24 & 1) == 0)
  {
    v27 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[PADVNSerialRequestsScheduler _dispatchVisionRequestForFrame:]((uint64_t)v26, v27);
    }

    self->_remainingRequests -= [v9 count];
    p_requestError = &self->_requestError;
    objc_storeStrong((id *)&self->_requestError, v25);
    if (!self->_remainingRequests)
    {
      [(PADVNSerialRequestsScheduler *)self handleObservationCompositeError:self->_requestError];
      v29 = *p_requestError;
      *p_requestError = 0;
    }
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

void __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_2;
    block[3] = &unk_264501B90;
    objc_copyWeak(&v14, v7);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
  }
}

void __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained handleResultForRequest:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
          uint64_t v9 = *(void *)(a1 + 40);
          id v11 = 0;
          [v8 performOn:v9 error:&v11];
          id v10 = v11;
          [WeakRetained handleResultForRequest:v8 error:v10];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)shouldProcessFrame:(id)a3
{
  return 1;
}

- (id)requestsForFrame:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)handleResultForRequest:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  --self->_remainingRequests;
  if (v7)
  {
    uint64_t v9 = recentlyLoggedError;
    id v10 = [v7 debugDescription];
    LOBYTE(v9) = [(id)v9 isEqualToString:v10];

    if ((v9 & 1) == 0)
    {
      id v11 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PADVNSerialRequestsScheduler handleResultForRequest:error:]((uint64_t)v6, (uint64_t)v8, v11);
      }

      uint64_t v12 = [v8 debugDescription];
      long long v13 = (void *)recentlyLoggedError;
      recentlyLoggedError = v12;
    }
    objc_storeStrong((id *)&self->_requestError, a4);
  }
  if (self->_requestError)
  {
    if (!self->_remainingRequests)
    {
      -[PADVNSerialRequestsScheduler handleObservationCompositeError:](self, "handleObservationCompositeError:");
      requestError = self->_requestError;
      self->_requestError = 0;
LABEL_19:
    }
  }
  else if (self->_currentObservationComposite)
  {
    requestError = [(PADVNSerialRequestsScheduler *)self observationsFromRequest:v6];
    if (requestError)
    {
      hasLoggedObservationError = 0;
      currentObservationComposite = self->_currentObservationComposite;
      v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      [(NSMutableDictionary *)currentObservationComposite setObject:requestError forKeyedSubscript:v17];

      uint64_t v18 = [(NSMutableDictionary *)self->_currentObservationComposite count];
      if (v18 == [(NSArray *)self->_requests count])
      {
        [(NSMutableArray *)self->_currentObservationCompositeSet addObject:self->_currentObservationComposite];
        [(PADVNSerialRequestsScheduler *)self analyzeObservationComposite:self->_currentObservationComposite];
        id v19 = self->_currentObservationComposite;
        self->_currentObservationComposite = 0;

        unint64_t v20 = [(PADVNSerialRequestsScheduler *)self observationCompositeSetSize];
        if ([(NSMutableArray *)self->_currentObservationCompositeSet count] == v20)
        {
          [(PADVNSerialRequestsScheduler *)self analyzeObservationCompositeSet:self->_currentObservationCompositeSet];
          [(NSMutableArray *)self->_currentObservationCompositeSet removeObjectAtIndex:0];
        }
      }
    }
    else if ((hasLoggedObservationError & 1) == 0)
    {
      uint64_t v21 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[PADVNSerialRequestsScheduler handleResultForRequest:error:]((uint64_t)v6, v21);
      }

      hasLoggedObservationError = 1;
    }
    goto LABEL_19;
  }
}

- (id)observationsFromRequest:(id)a3
{
  return (id)[a3 results];
}

- (unint64_t)observationCompositeSetSize
{
  return 1;
}

- (void)analyzeObservationComposite:(id)a3
{
  self->_isProcessingFrame = 0;
  currentFrameProcessingCompletion = (void (**)(id, SEL, id))self->_currentFrameProcessingCompletion;
  if (currentFrameProcessingCompletion)
  {
    currentFrameProcessingCompletion[2](currentFrameProcessingCompletion, a2, a3);
    id v5 = self->_currentFrameProcessingCompletion;
    self->_currentFrameProcessingCompletion = 0;
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(PADVNSerialRequestsScheduler *)self _reset];
}

- (void)_reset
{
  id v3 = (NSMutableDictionary *)[MEMORY[0x263EFFA78] mutableCopy];
  currentObservationComposite = self->_currentObservationComposite;
  self->_currentObservationComposite = v3;

  id v5 = (NSMutableArray *)[MEMORY[0x263EFFA68] mutableCopy];
  currentObservationCompositeSet = self->_currentObservationCompositeSet;
  self->_currentObservationCompositeSet = v5;

  self->_remainingRequests = 0;
  self->_isProcessingFrame = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentFrameProcessingCompletion, 0);
  objc_storeStrong((id *)&self->_requestError, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentObservationCompositeSet, 0);
  objc_storeStrong((id *)&self->_currentObservationComposite, 0);
}

- (void)_dispatchVisionRequestForFrame:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F07C000, a2, OS_LOG_TYPE_ERROR, "Vision request dispatch failed (%{public}@).", (uint8_t *)&v2, 0xCu);
}

- (void)_dispatchVisionRequestForFrame:.cold.2()
{
  __assert_rtn("-[PADVNSerialRequestsScheduler _dispatchVisionRequestForFrame:]", "PADVNSerialRequestsScheduler.m", 85, "_remainingRequests == 0");
}

- (void)handleResultForRequest:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F07C000, a2, OS_LOG_TYPE_ERROR, "Request %{public}@ did not obtain any observations.", (uint8_t *)&v2, 0xCu);
}

- (void)handleResultForRequest:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21F07C000, log, OS_LOG_TYPE_ERROR, "Request %{public}@ failed (%{public}@).", (uint8_t *)&v3, 0x16u);
}

@end