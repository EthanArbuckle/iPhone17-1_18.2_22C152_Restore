@interface ASReachabilityQueryOperation
- (ASReachabilityQueryOperation)init;
- (ASReachabilityStatusCache)statusCache;
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSSet)destinations;
- (NSString)serviceIdentifier;
- (id)completionHandler;
- (id)updateHandler;
- (void)_queryTimedOut;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)finish;
- (void)setCompletionHandler:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setStatusCache:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)start;
@end

@implementation ASReachabilityQueryOperation

- (ASReachabilityQueryOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASReachabilityQueryOperation;
  result = [(ASReachabilityQueryOperation *)&v3 init];
  if (result)
  {
    result->_finished = 0;
    result->_executing = 0;
  }
  return result;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isReady
{
  return 1;
}

- (void)start
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if ([(ASReachabilityQueryOperation *)self isCancelled])
  {
    [(ASReachabilityQueryOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = 1;
    [(ASReachabilityQueryOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(ASReachabilityQueryOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(ASReachabilityQueryOperation *)self didChangeValueForKey:@"isExecuting"];
    ASLoggingInitialize();
    objc_super v3 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      destinations = self->_destinations;
      v5 = v3;
      *(_DWORD *)buf = 134217984;
      uint64_t v56 = [(NSSet *)destinations count];
      _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Reachability: Starting for %lu destinations", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCache);
    v7 = [WeakRetained statusesForDestinations:self->_destinations];

    v8 = (NSMutableDictionary *)[v7 mutableCopy];
    results = self->_results;
    self->_results = v8;

    if ([v7 count])
    {
      ASLoggingInitialize();
      v10 = (void *)ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        uint64_t v12 = [v7 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v56 = v12;
        _os_log_impl(&dword_21EC60000, v11, OS_LOG_TYPE_DEFAULT, "Reachability: Hit %lu destinations in cache second pass", buf, 0xCu);
      }
      (*((void (**)(void))self->_updateHandler + 2))();
    }
    v13 = self->_destinations;
    v14 = (void *)MEMORY[0x263F08A98];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __37__ASReachabilityQueryOperation_start__block_invoke;
    v52[3] = &unk_2644E81A0;
    id v45 = v7;
    id v53 = v45;
    v15 = [v14 predicateWithBlock:v52];
    v16 = [(NSSet *)v13 filteredSetUsingPredicate:v15];

    v17 = [MEMORY[0x263EFF9A0] dictionary];
    rawIDSDestinationToOriginalDestination = self->_rawIDSDestinationToOriginalDestination;
    self->_rawIDSDestinationToOriginalDestination = v17;

    v19 = [MEMORY[0x263EFF9C0] set];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v20 = v16;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v26 = IDSDestinationForString(v25);
          if (v26)
          {
            [v19 addObject:v26];
            v27 = (void *)IDSCopyRawAddressForDestination();
            [(NSMutableDictionary *)self->_rawIDSDestinationToOriginalDestination setObject:v25 forKeyedSubscript:v27];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v22);
    }

    if ([v20 count])
    {
      ASLoggingInitialize();
      v28 = (void *)ASLogDefault;
      v29 = v45;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v28;
        uint64_t v31 = [v20 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v56 = v31;
        _os_log_impl(&dword_21EC60000, v30, OS_LOG_TYPE_DEFAULT, "Reachability: Querying %lu destinations", buf, 0xCu);
      }
      v32 = [MEMORY[0x263F08A48] currentQueue];
      v33 = [v32 underlyingQueue];

      v34 = (IDSBatchIDQueryController *)[objc_alloc(MEMORY[0x263F4A008]) initWithService:self->_serviceIdentifier delegate:self queue:v33];
      batchQueryController = self->_batchQueryController;
      self->_batchQueryController = v34;

      v36 = (NSMutableSet *)[v20 mutableCopy];
      remainingDestinations = self->_remainingDestinations;
      self->_remainingDestinations = v36;

      v38 = self->_batchQueryController;
      v39 = [v19 allObjects];
      [(IDSBatchIDQueryController *)v38 setDestinations:v39];

      v40 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v33);
      timer = self->timer;
      self->timer = v40;

      v42 = self->timer;
      dispatch_time_t v43 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v42, v43, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      objc_initWeak((id *)buf, self);
      v44 = self->timer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __37__ASReachabilityQueryOperation_start__block_invoke_18;
      handler[3] = &unk_2644E8450;
      objc_copyWeak(&v47, (id *)buf);
      dispatch_source_set_event_handler(v44, handler);
      dispatch_resume((dispatch_object_t)self->timer);
      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(ASReachabilityQueryOperation *)self finish];
      v29 = v45;
    }
  }
}

BOOL __37__ASReachabilityQueryOperation_start__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

void __37__ASReachabilityQueryOperation_start__block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _queryTimedOut];
}

- (void)finish
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!self->_finished)
  {
    ASLoggingInitialize();
    BOOL v3 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      destinations = self->_destinations;
      v5 = v3;
      int v8 = 134217984;
      uint64_t v9 = [(NSSet *)destinations count];
      _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Reachability: Finished %lu destinations", (uint8_t *)&v8, 0xCu);
    }
    timer = self->timer;
    if (timer) {
      dispatch_source_cancel(timer);
    }
    [(IDSBatchIDQueryController *)self->_batchQueryController invalidate];
    [(ASReachabilityQueryOperation *)self willChangeValueForKey:@"isExecuting"];
    [(ASReachabilityQueryOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = 1;
    self->_executing = 0;
    [(ASReachabilityQueryOperation *)self didChangeValueForKey:@"isExecuting"];
    [(ASReachabilityQueryOperation *)self didChangeValueForKey:@"isFinished"];
    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void)_queryTimedOut
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC60000, log, OS_LOG_TYPE_ERROR, "Reachability: Query timed out", v1, 2u);
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ASReachabilityQueryOperation *)self serviceIdentifier];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __95__ASReachabilityQueryOperation_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke;
    uint64_t v22 = &unk_2644E8478;
    uint64_t v23 = self;
    id v13 = v12;
    id v24 = v13;
    [v8 enumerateKeysAndObjectsUsingBlock:&v19];
    -[NSMutableDictionary addEntriesFromDictionary:](self->_results, "addEntriesFromDictionary:", v13, v19, v20, v21, v22, v23);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCache);
    [WeakRetained addStatusesByDestination:v13];

    (*((void (**)(void))self->_updateHandler + 2))();
    remainingDestinations = self->_remainingDestinations;
    v16 = (void *)MEMORY[0x263EFFA08];
    v17 = [v13 allKeys];
    v18 = [v16 setWithArray:v17];
    [(NSMutableSet *)remainingDestinations minusSet:v18];

    if (![(NSMutableSet *)self->_remainingDestinations count]) {
      [(ASReachabilityQueryOperation *)self finish];
    }
  }
}

void __95__ASReachabilityQueryOperation_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  v4 = (void *)IDSCopyRawAddressForDestination();
  v5 = [*(id *)(*(void *)(a1 + 32) + 288) objectForKeyedSubscript:v4];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (ASReachabilityStatusCache)statusCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCache);

  return (ASReachabilityStatusCache *)WeakRetained;
}

- (void)setStatusCache:(id)a3
{
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_statusCache);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_rawIDSDestinationToOriginalDestination, 0);
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->_batchQueryController, 0);
  objc_storeStrong((id *)&self->_remainingDestinations, 0);

  objc_storeStrong((id *)&self->_destinations, 0);
}

@end