@interface ITIdleTimerStateService
- (BOOL)addIdleTimerConfiguration:(id)a3 fromProcess:(id)a4 forReason:(id)a5;
- (BOOL)clientConfiguration:(id)a3 handleIdleEvent:(unint64_t)a4;
- (BOOL)isIdleTimerServiceAvailable;
- (ITIdleTimerStateService)initWithDispatchQueue:(id)a3;
- (ITIdleTimerStateService)initWithDispatchQueue:(id)a3 delegate:(id)a4;
- (ITIdleTimerStateServiceDelegate)delegate;
- (id)_identifierForClientProcess:(id)a3;
- (void)_addStateCaptureHandler;
- (void)clientDidDisconnect:(id)a3;
- (void)dealloc;
- (void)removeIdleTimerConfigurationFromProcess:(id)a3 forReason:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ITIdleTimerStateService

- (BOOL)addIdleTimerConfiguration:(id)a3 fromProcess:(id)a4 forReason:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssert();
  v11 = [(ITIdleTimerStateService *)self _identifierForClientProcess:v9];
  id v12 = [(NSMutableDictionary *)self->_assertionReasonsByClientID objectForKeyedSubscript:v11];
  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(NSMutableDictionary *)self->_assertionReasonsByClientID setObject:v12 forKeyedSubscript:v11];
  }
  v13 = [(NSMutableDictionary *)self->_assertionsByReason objectForKeyedSubscript:v10];

  if (v13)
  {
    v14 = ITLogIdleTimer();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      int v21 = 138543874;
      v22 = v20;
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v10;
      _os_log_error_impl(&dword_210665000, v14, OS_LOG_TYPE_ERROR, "%{public}@ - received duplicate assertion request from client: %{public}@ for reason: %{public}@", (uint8_t *)&v21, 0x20u);
    }
    BOOL v15 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = [WeakRetained acquireIdleTimerAssertionWithConfiguration:v8 fromClient:v9 forReason:v10];

    BOOL v15 = v17 != 0;
    if (v17)
    {
      [(NSMutableDictionary *)self->_assertionsByReason setObject:v17 forKeyedSubscript:v10];
      [v12 addObject:v10];
    }
  }
  return v15;
}

- (id)_identifierForClientProcess:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  int v6 = [v4 pid];

  v7 = [v3 stringWithFormat:@"%@:%ld", v5, v6];

  return v7;
}

- (ITIdleTimerStateService)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ITIdleTimerStateService;
  id v9 = [(ITIdleTimerStateService *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calloutDispatchQueue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assertionsByReason = v10->_assertionsByReason;
    v10->_assertionsByReason = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assertionReasonsByClientID = v10->_assertionReasonsByClientID;
    v10->_assertionReasonsByClientID = v13;

    BOOL v15 = [[ITIdleTimerStateServer alloc] initWithCalloutQueue:v10->_calloutDispatchQueue delegate:v10];
    server = v10->_server;
    v10->_server = v15;

    [(ITIdleTimerStateService *)v10 _addStateCaptureHandler];
  }

  return v10;
}

- (ITIdleTimerStateService)initWithDispatchQueue:(id)a3
{
  return [(ITIdleTimerStateService *)self initWithDispatchQueue:a3 delegate:0];
}

- (void)dealloc
{
  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    [(BSInvalidatable *)stateCaptureAssertion invalidate];
    id v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ITIdleTimerStateService;
  [(ITIdleTimerStateService *)&v5 dealloc];
}

- (void)removeIdleTimerConfigurationFromProcess:(id)a3 forReason:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  BSDispatchQueueAssert();
  id v7 = [(ITIdleTimerStateService *)self _identifierForClientProcess:v6];

  id v8 = [(NSMutableDictionary *)self->_assertionReasonsByClientID objectForKeyedSubscript:v7];
  if (v8)
  {
    id v9 = [(NSMutableDictionary *)self->_assertionsByReason objectForKeyedSubscript:v10];
    [(NSMutableDictionary *)self->_assertionsByReason removeObjectForKey:v10];
    [v9 invalidate];
    [v8 removeObject:v10];
  }
}

- (void)clientDidDisconnect:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssert();
  objc_super v5 = [(ITIdleTimerStateService *)self _identifierForClientProcess:v4];
  id v6 = [(NSMutableDictionary *)self->_assertionReasonsByClientID objectForKeyedSubscript:v5];
  id v7 = (void *)[v6 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[ITIdleTimerStateService removeIdleTimerConfigurationFromProcess:forReason:](self, "removeIdleTimerConfigurationFromProcess:forReason:", v4, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(NSMutableDictionary *)self->_assertionReasonsByClientID removeObjectForKey:v5];
}

- (BOOL)isIdleTimerServiceAvailable
{
  BSDispatchQueueAssert();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(self) = WeakRetained != 0;

  return (char)self;
}

- (BOOL)clientConfiguration:(id)a3 handleIdleEvent:(unint64_t)a4
{
  id v6 = a3;
  BSDispatchQueueAssert();
  LOBYTE(a4) = [(ITIdleTimerStateServer *)self->_server clientConfiguration:v6 handleIdleEvent:a4];

  return a4;
}

- (void)_addStateCaptureHandler
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = self->_stateCaptureAssertion;
  self->_stateCaptureAssertion = v3;

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

__CFString *__50__ITIdleTimerStateService__addStateCaptureHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained[4] description];
  }
  else
  {
    v3 = &stru_26C28D3A8;
  }

  return v3;
}

- (ITIdleTimerStateServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ITIdleTimerStateServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_assertionReasonsByClientID, 0);
  objc_storeStrong((id *)&self->_assertionsByReason, 0);
  objc_storeStrong((id *)&self->_calloutDispatchQueue, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end