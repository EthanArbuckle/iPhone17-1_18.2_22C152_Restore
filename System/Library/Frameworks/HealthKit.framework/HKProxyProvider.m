@interface HKProxyProvider
+ (id)_relaunchQueue;
- (BOOL)shouldRetryOnInterruption;
- (HKProxyProvider)initWithSource:(id)a3 serviceIdentifier:(id)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteInterface:(id)a7;
- (NSString)serviceIdentifier;
- (OS_dispatch_queue)clientQueue;
- (_HKXPCExportable)exportedObject;
- (id)_fetchConnectionAndGeneration:(int64_t *)a3 error:(id *)a4;
- (id)_lock_sourceWithError:(id *)a3;
- (id)automaticProxyReconnectionHandler;
- (id)clientQueueActionHandlerWithCompletion:(id)a3;
- (id)clientQueueDoubleObjectHandlerWithCompletion:(id)a3;
- (id)clientQueueErrorHandlerWithCompletion:(id)a3;
- (id)clientQueueObjectHandlerWithCompletion:(id)a3;
- (id)clientQueueProgressHandlerWithHandler:(id)a3;
- (id)debugIdentifier;
- (id)description;
- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5;
- (void)_fetchEndpointAndConnectionWithContinuation:(id)a3;
- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_fetchRetryingProxyWithErrorCount:(int64_t)a3 handler:(id)a4 errorHandler:(id)a5;
- (void)_getSynchronousProxyWithErrorCount:(int64_t)a3 handler:(id)a4 errorHandler:(id)a5;
- (void)_getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_handleError:(id)a3 connectionGeneration:(int64_t)a4;
- (void)_lock_flushContinuationsWithConnection:(id)a3 error:(id)a4;
- (void)_lock_setUpConnectionWithEndpoint:(id)a3;
- (void)_resetConnectionWithGeneration:(int64_t)a3;
- (void)_serverDidFinishLaunching;
- (void)dealloc;
- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6;
- (void)fetchProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)invalidate;
- (void)referenceSourceWeakly;
- (void)setAutomaticProxyReconnectionHandler:(id)a3;
- (void)setShouldRetryOnInterruption:(BOOL)a3;
@end

@implementation HKProxyProvider

+ (id)_relaunchQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__HKProxyProvider__relaunchQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_relaunchQueue_onceToken != -1) {
    dispatch_once(&_relaunchQueue_onceToken, block);
  }
  v2 = (void *)_relaunchQueue_relaunchQueue;

  return v2;
}

uint64_t __33__HKProxyProvider__relaunchQueue__block_invoke(uint64_t a1)
{
  _relaunchQueue_relaunchQueue = HKCreateSerialDispatchQueue(*(void **)(a1 + 32), @"server-relaunch");

  return MEMORY[0x1F41817F8]();
}

- (HKProxyProvider)initWithSource:(id)a3 serviceIdentifier:(id)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteInterface:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    _HKInitializeLogging();
    v18 = HKLogInfrastructure();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[HKProxyProvider initWithSource:serviceIdentifier:exportedObject:exportedInterface:remoteInterface:]((uint64_t)self, v18);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)HKProxyProvider;
  v19 = [(HKProxyProvider *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_source, a3);
    uint64_t v21 = [v14 copy];
    serviceIdentifier = v20->_serviceIdentifier;
    v20->_serviceIdentifier = (NSString *)v21;

    objc_storeWeak((id *)&v20->_exportedObject, v15);
    objc_storeStrong((id *)&v20->_exportedInterface, a6);
    objc_storeStrong((id *)&v20->_remoteInterface, a7);
    v20->_shouldRetryOnInterruption = 1;
    *(void *)&v20->_lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
    v23 = [v13 clientQueue];
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      HKCreateSerialDispatchQueue(v20, 0);
      v25 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    clientQueue = v20->_clientQueue;
    v20->_clientQueue = v25;

    uint64_t v27 = [v13 daemonLaunchDarwinNotificationName];
    daemonLaunchNotificationName = v20->_daemonLaunchNotificationName;
    v20->_daemonLaunchNotificationName = (NSString *)v27;
  }
  return v20;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_HKXPCConnection *)self->_connection invalidate];
  if (self->_lock_automaticProxyReconnectionHandler)
  {
    int notifyToken = self->_notifyToken;
    if (notifyToken != -1) {
      notify_cancel(notifyToken);
    }
  }
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)HKProxyProvider;
  [(HKProxyProvider *)&v5 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  [(_HKXPCConnection *)self->_connection invalidate];
  v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 119, @"Proxy provider invalidated");
  [(HKProxyProvider *)self _lock_flushContinuationsWithConnection:0 error:v4];

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_serviceIdentifier];
}

- (id)debugIdentifier
{
  return self->_serviceIdentifier;
}

- (void)referenceSourceWeakly
{
  source = self->_source;
  if (source)
  {
    p_weakSource = &self->_weakSource;
    v6 = source;
    objc_storeWeak((id *)p_weakSource, v6);
    objc_super v5 = self->_source;
    self->_source = 0;
  }
}

- (id)_lock_sourceWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_invalidated)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = objc_opt_class();
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = objc_msgSend(v6, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v7, a2, @"%@ for %@ invalidated"", v9, self->_serviceIdentifier);
LABEL_3:
    id v11 = v10;
    v12 = v11;
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError(v11);
      }
    }

    WeakRetained = 0;
    goto LABEL_10;
  }
  source = self->_source;
  if (source)
  {
    WeakRetained = source;
    goto LABEL_10;
  }
  WeakRetained = (HKProxyProviderSource *)objc_loadWeakRetained((id *)&self->_weakSource);
  if (!WeakRetained)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    id v17 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v17);
    v10 = objc_msgSend(v16, "hk_error:format:", 100, @"%@ source became nil for %@", v9, self->_serviceIdentifier);
    goto LABEL_3;
  }
LABEL_10:

  return WeakRetained;
}

- (void)_handleError:(id)a3 connectionGeneration:(int64_t)a4
{
  if (objc_msgSend(a3, "hk_isXPCConnectionError"))
  {
    [(HKProxyProvider *)self _resetConnectionWithGeneration:a4];
  }
}

- (void)_resetConnectionWithGeneration:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated && self->_connectionGeneration == a3)
  {
    connection = self->_connection;
    if (connection)
    {
      self->_connectionGeneration = a3 + 1;
      [(_HKXPCConnection *)connection invalidate];
      uint64_t v7 = self->_connection;
      self->_connection = 0;

      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__HKProxyProvider__resetConnectionWithGeneration___block_invoke;
      block[3] = &unk_1E58BBA00;
      block[4] = self;
      dispatch_async(clientQueue, block);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

void __50__HKProxyProvider__resetConnectionWithGeneration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
    [v4 connectionInterrupted];
  }
}

- (id)_fetchConnectionAndGeneration:(int64_t *)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection)
  {
    v10 = connection;
    *a3 = self->_connectionGeneration;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v11 = [(HKProxyProvider *)self _lock_sourceWithError:a4];
    os_unfair_lock_unlock(p_lock);
    if (v11)
    {
      v12 = [(HKProxyProvider *)self proxyServiceEndpointFromSource:v11 serviceIdentifier:self->_serviceIdentifier error:a4];
      if (v12)
      {
        os_unfair_lock_lock(p_lock);
        if (self->_invalidated)
        {
          id v13 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v14 = objc_opt_class();
          id v15 = (objc_class *)objc_opt_class();
          id v16 = NSStringFromClass(v15);
          objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v14, a2, @"%@ for %@ invalidated"", v16, self->_serviceIdentifier);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            if (a4) {
              *a4 = v17;
            }
            else {
              _HKLogDroppedError(v17);
            }
          }

          v10 = 0;
        }
        else
        {
          v19 = self->_connection;
          if (!v19)
          {
            [(HKProxyProvider *)self _lock_setUpConnectionWithEndpoint:v12];
            v19 = self->_connection;
          }
          v10 = v19;
          *a3 = self->_connectionGeneration;
        }
        os_unfair_lock_unlock(p_lock);
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_fetchEndpointAndConnectionWithContinuation:(id)a3
{
  id v4 = (void (**)(id, _HKXPCConnection *, int64_t, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection)
  {
    v4[2](v4, connection, self->_connectionGeneration, 0);
LABEL_5:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_6;
  }
  pendingFetchContinuations = self->_pendingFetchContinuations;
  if (pendingFetchContinuations)
  {
    v8 = (void *)[v4 copy];
    v9 = _Block_copy(v8);
    [(NSMutableArray *)pendingFetchContinuations addObject:v9];

    goto LABEL_5;
  }
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = self->_pendingFetchContinuations;
  self->_pendingFetchContinuations = v10;

  v12 = self->_pendingFetchContinuations;
  id v13 = (void *)[v4 copy];
  uint64_t v14 = _Block_copy(v13);
  [(NSMutableArray *)v12 addObject:v14];

  id v20 = 0;
  id v15 = [(HKProxyProvider *)self _lock_sourceWithError:&v20];
  id v16 = v20;
  if (v15)
  {
    os_unfair_lock_unlock(&self->_lock);
    serviceIdentifier = self->_serviceIdentifier;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke;
    v19[3] = &unk_1E58BEC78;
    v19[4] = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke_2;
    v18[3] = &unk_1E58BBCC0;
    v18[4] = self;
    [(HKProxyProvider *)self fetchProxyServiceEndpointFromSource:v15 serviceIdentifier:serviceIdentifier endpointHandler:v19 errorHandler:v18];
  }
  else
  {
    [(HKProxyProvider *)self _lock_flushContinuationsWithConnection:0 error:v16];
    os_unfair_lock_unlock(&self->_lock);
  }

LABEL_6:
}

void __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 80);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_lock_setUpConnectionWithEndpoint:", v4);

  objc_super v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 80);

  os_unfair_lock_unlock(v5);
}

void __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 80);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_lock_flushContinuationsWithConnection:error:", 0, v4);

  objc_super v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 80);

  os_unfair_lock_unlock(v5);
}

- (void)_lock_setUpConnectionWithEndpoint:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_connection)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
    if (WeakRetained)
    {
      v6 = [[_HKXPCConnection alloc] initWithListenerEndpoint:v4];
      connection = self->_connection;
      self->_connection = v6;

      v8 = self->_connection;
      v9 = [(HKProxyProvider *)self debugIdentifier];
      [(_HKXPCConnection *)v8 setDebugIdentifier:v9];

      objc_initWeak(&location, self);
      connectionGeneration = (void *)self->_connectionGeneration;
      id v11 = self->_connection;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke;
      v16[3] = &unk_1E58BECA0;
      objc_copyWeak(v17, &location);
      v17[1] = connectionGeneration;
      [(_HKXPCConnection *)v11 setInterruptionHandler:v16];
      v12 = self->_connection;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke_2;
      v14[3] = &unk_1E58BECA0;
      objc_copyWeak(v15, &location);
      v15[1] = connectionGeneration;
      [(_HKXPCConnection *)v12 setInvalidationHandler:v14];
      [(_HKXPCConnection *)self->_connection setExportedObject:WeakRetained];
      [(_HKXPCConnection *)self->_connection resumeWithExportedInterface:self->_exportedInterface remoteInterface:self->_remoteInterface];
      [(HKProxyProvider *)self _lock_flushContinuationsWithConnection:self->_connection error:0];
      objc_destroyWeak(v15);
      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
    else
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"exportedObject became nil for %@", self->_serviceIdentifier);
      [(HKProxyProvider *)self _lock_flushContinuationsWithConnection:0 error:v13];
    }
  }
}

void __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnectionWithGeneration:*(void *)(a1 + 40)];
}

void __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnectionWithGeneration:*(void *)(a1 + 40)];
}

- (void)_lock_flushContinuationsWithConnection:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_pendingFetchContinuations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  pendingFetchContinuations = self->_pendingFetchContinuations;
  self->_pendingFetchContinuations = 0;
}

- (void)_fetchRetryingProxyWithErrorCount:(int64_t)a3 handler:(id)a4 errorHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  if (_fetchRetryingProxyWithErrorCount_handler_errorHandler__onceToken != -1) {
    dispatch_once(&_fetchRetryingProxyWithErrorCount_handler_errorHandler__onceToken, block);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_2;
  v12[3] = &unk_1E58BECF0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(HKProxyProvider *)self _fetchProxyWithHandler:v11 errorHandler:v12];
}

uint64_t __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke()
{
  v0 = objc_opt_class();
  _fetchRetryingProxyWithErrorCount_handler_errorHandler__retryQueue = HKCreateSerialDispatchQueue(v0, @"retry");

  return MEMORY[0x1F41817F8]();
}

void __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hk_isXPCConnectionError") && (uint64_t v4 = *(void *)(a1 + 56), v4 <= 3))
  {
    long double v5 = pow(1.5, (double)v4);
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 0.25 * 1000000000.0));
    id v7 = _fetchRetryingProxyWithErrorCount_handler_errorHandler__retryQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_3;
    v10[3] = &unk_1E58BECC8;
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    uint64_t v13 = v8;
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    dispatch_after(v6, v7, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRetryingProxyWithErrorCount:*(void *)(a1 + 56) + 1 handler:*(void *)(a1 + 40) errorHandler:*(void *)(a1 + 48)];
}

- (void)fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(HKProxyProvider *)self shouldRetryOnInterruption]) {
    [(HKProxyProvider *)self _fetchRetryingProxyWithErrorCount:0 handler:v7 errorHandler:v6];
  }
  else {
    [(HKProxyProvider *)self _fetchProxyWithHandler:v7 errorHandler:v6];
  }
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_clientQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int64_t v15 = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke;
  long long v16 = &unk_1E58BED40;
  long long v17 = self;
  v18 = v8;
  id v19 = v7;
  id v20 = v6;
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = _Block_copy(&v13);
  -[HKProxyProvider _fetchEndpointAndConnectionWithContinuation:](self, "_fetchEndpointAndConnectionWithContinuation:", v12, v13, v14, v15, v16, v17);
}

void __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_2;
  aBlock[3] = &unk_1E58BED18;
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v23 = a3;
  id v22 = *(id *)(a1 + 48);
  id v9 = _Block_copy(aBlock);
  if (v7)
  {
    id v10 = [v7 remoteObjectProxyWithErrorHandler:v9];
    id v11 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_3;
    block[3] = &unk_1E58BBF10;
    id v12 = *(id *)(a1 + 56);
    id v19 = v10;
    id v20 = v12;
    id v13 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to fetch proxy connection.");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = *(NSObject **)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_4;
    v15[3] = &unk_1E58BBF10;
    id v17 = v9;
    id v8 = v8;
    id v16 = v8;
    dispatch_async(v14, v15);

    id v13 = v17;
  }
}

void __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  [v3 _handleError:v5 connectionGeneration:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(HKProxyProvider *)self shouldRetryOnInterruption]) {
    [(HKProxyProvider *)self _getSynchronousProxyWithErrorCount:0 handler:v7 errorHandler:v6];
  }
  else {
    [(HKProxyProvider *)self _getSynchronousProxyWithHandler:v7 errorHandler:v6];
  }
}

- (void)_getSynchronousProxyWithErrorCount:(int64_t)a3 handler:(id)a4 errorHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__HKProxyProvider__getSynchronousProxyWithErrorCount_handler_errorHandler___block_invoke;
  v12[3] = &unk_1E58BECF0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(HKProxyProvider *)self _getSynchronousProxyWithHandler:v11 errorHandler:v12];
}

void __75__HKProxyProvider__getSynchronousProxyWithErrorCount_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "hk_isXPCConnectionError") && (uint64_t v3 = *(void *)(a1 + 56), v3 <= 3)) {
    [*(id *)(a1 + 32) _getSynchronousProxyWithErrorCount:v3 + 1 handler:*(void *)(a1 + 40) errorHandler:*(void *)(a1 + 48)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v16 = 0;
  id v8 = [(HKProxyProvider *)self _fetchConnectionAndGeneration:&v17 error:&v16];
  id v9 = v16;
  id v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__HKProxyProvider__getSynchronousProxyWithHandler_errorHandler___block_invoke;
    v13[3] = &unk_1E58BED18;
    v13[4] = self;
    uint64_t v15 = v17;
    id v14 = v7;
    id v11 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v6[2](v6, v11);
  }
  else if (v9)
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to fetch proxy connection.");
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

void __64__HKProxyProvider__getSynchronousProxyWithHandler_errorHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  [v3 _handleError:v5 connectionGeneration:v4];
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)setAutomaticProxyReconnectionHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id lock_automaticProxyReconnectionHandler = self->_lock_automaticProxyReconnectionHandler;
  if (v4)
  {
    if (!lock_automaticProxyReconnectionHandler && self->_daemonLaunchNotificationName)
    {
      objc_initWeak(&location, self);
      id v6 = [(NSString *)self->_daemonLaunchNotificationName UTF8String];
      id v7 = [(id)objc_opt_class() _relaunchQueue];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      id v13 = __56__HKProxyProvider_setAutomaticProxyReconnectionHandler___block_invoke;
      id v14 = &unk_1E58BED68;
      objc_copyWeak(&v15, &location);
      notify_register_dispatch(v6, &self->_notifyToken, v7, &v11);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else if (lock_automaticProxyReconnectionHandler)
  {
    int notifyToken = self->_notifyToken;
    if (notifyToken != -1)
    {
      notify_cancel(notifyToken);
      self->_int notifyToken = -1;
    }
  }
  id v9 = objc_msgSend(v4, "copy", v11, v12, v13, v14);
  id v10 = self->_lock_automaticProxyReconnectionHandler;
  self->_id lock_automaticProxyReconnectionHandler = v9;

  os_unfair_lock_unlock(&self->_lock);
}

void __56__HKProxyProvider_setAutomaticProxyReconnectionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serverDidFinishLaunching];
}

- (id)automaticProxyReconnectionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = _Block_copy(self->_lock_automaticProxyReconnectionHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = _Block_copy(v4);

  return v5;
}

- (void)_serverDidFinishLaunching
{
  uint64_t v3 = [(HKProxyProvider *)self automaticProxyReconnectionHandler];
  id v4 = v3;
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__HKProxyProvider__serverDidFinishLaunching__block_invoke;
    aBlock[3] = &unk_1E58BED90;
    aBlock[4] = self;
    id v9 = v3;
    id v5 = _Block_copy(aBlock);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_44;
    v7[3] = &unk_1E58BBCC0;
    v7[4] = self;
    id v6 = _Block_copy(v7);
    if ([(HKProxyProvider *)self shouldRetryOnInterruption]) {
      [(HKProxyProvider *)self _getSynchronousProxyWithErrorCount:0 handler:v5 errorHandler:v6];
    }
    else {
      [(HKProxyProvider *)self _getSynchronousProxyWithHandler:v5 errorHandler:v6];
    }
  }
}

void __44__HKProxyProvider__serverDidFinishLaunching__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "%{public}@: Fetched proxy after detecting server relaunch.", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_44_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (id)clientQueueErrorHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  id v12 = [(HKProxyProvider *)self exportedObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BEDE0;
  aBlock[4] = self;
  id v9 = v4;
  uint64_t v10 = v11;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BEDB8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)clientQueueActionHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  id v12 = [(HKProxyProvider *)self exportedObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BEE30;
  aBlock[4] = self;
  id v9 = v4;
  uint64_t v10 = v11;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke_2;
  v9[3] = &unk_1E58BEE08;
  id v7 = *(id *)(a1 + 40);
  char v13 = a2;
  id v10 = v5;
  id v11 = v7;
  uint64_t v12 = *(void *)(a1 + 48);
  id v8 = v5;
  dispatch_async(v6, v9);
}

void __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)clientQueueObjectHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  id v12 = [(HKProxyProvider *)self exportedObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BEE80;
  aBlock[4] = self;
  id v9 = v4;
  id v10 = v11;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke_2;
  v12[3] = &unk_1E58BEE58;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)clientQueueDoubleObjectHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  id v12 = [(HKProxyProvider *)self exportedObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BEED0;
  aBlock[4] = self;
  id v9 = v4;
  id v10 = v11;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BEEA8;
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  uint64_t v20 = *(void *)(a1 + 48);
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, block);
}

void __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
  }
  uint64_t v3 = *(void *)(a1[8] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)clientQueueProgressHandlerWithHandler:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  id v12 = [(HKProxyProvider *)self exportedObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke;
  aBlock[3] = &unk_1E58BEEF8;
  aBlock[4] = self;
  id v9 = v4;
  id v10 = v11;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);

  return v6;
}

void __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke_2;
  block[3] = &unk_1E58BEDB8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (_HKXPCExportable)exportedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);

  return (_HKXPCExportable *)WeakRetained;
}

- (BOOL)shouldRetryOnInterruption
{
  return self->_shouldRetryOnInterruption;
}

- (void)setShouldRetryOnInterruption:(BOOL)a3
{
  self->_shouldRetryOnInterruption = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_pendingFetchContinuations, 0);
  objc_storeStrong(&self->_lock_automaticProxyReconnectionHandler, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_daemonLaunchNotificationName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_weakSource);

  objc_storeStrong((id *)&self->_source, 0);
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)initWithSource:(uint64_t)a1 serviceIdentifier:(NSObject *)a2 exportedObject:exportedInterface:remoteInterface:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_19C023000, a2, OS_LOG_TYPE_FAULT, "%{public}@: source unexpectedly nil", (uint8_t *)&v4, 0xCu);
}

void __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_44_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch proxy after detecting server relaunch: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end