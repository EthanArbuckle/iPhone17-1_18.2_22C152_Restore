@interface ACHEarnedInstanceAwardingEngine
- (ACHEarnedInstanceAwardingEngine)initWithClient:(id)a3 assertionClient:(id)a4 dataStore:(id)a5 earnedInstanceStore:(id)a6 historicalEvaluationPolicy:(id *)a7;
- (ACHEarnedInstanceAwardingEngine)initWithProfile:(id)a3 dataStore:(id)a4 earnedInstanceStore:(id)a5 historicalEvaluationPolicy:(id *)a6;
- (id)currentDate;
- (id)dataStorePropertyProviderForSource:(id)a3;
- (unint64_t)sourceCount;
- (void)_client_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3;
- (void)_client_requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4;
- (void)_daemon_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3;
- (void)_daemon_requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4;
- (void)_queue_evaluateHistoryForSource:(id)a3 completion:(id)a4;
- (void)_queue_evaluateHistoryForSource:(id)a3 databaseContext:(id)a4 completion:(id)a5;
- (void)_queue_performQueuedEvaluations;
- (void)_queue_protectedDataBecameAvailable;
- (void)_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3;
- (void)activate;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)deregisterSource:(id)a3;
- (void)registerSource:(id)a3;
- (void)requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3;
- (void)requestHistoricalEvaluationForAllSourcesWithDatabaseContext:(id)a3 completion:(id)a4;
- (void)requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4;
- (void)setCurrentDateOverride:(id)a3;
@end

@implementation ACHEarnedInstanceAwardingEngine

- (ACHEarnedInstanceAwardingEngine)initWithClient:(id)a3 assertionClient:(id)a4 dataStore:(id)a5 earnedInstanceStore:(id)a6 historicalEvaluationPolicy:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v34.receiver = self;
  v34.super_class = (Class)ACHEarnedInstanceAwardingEngine;
  v16 = [(ACHEarnedInstanceAwardingEngine *)&v34 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_client, v12);
    objc_storeWeak((id *)&v17->_assertionClient, v13);
    objc_storeWeak((id *)&v17->_dataStore, v14);
    objc_storeWeak((id *)&v17->_earnedInstanceStore, v15);
    long long v18 = *(_OWORD *)&a7->var2;
    *(_OWORD *)&v17->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime = *(_OWORD *)&a7->var0;
    *(_OWORD *)&v17->_historicalEvaluationPolicy.endDate = v18;
    v17->_isActivated = 0;
    uint64_t v19 = HKCreateSerialDispatchQueue();
    internalQueue = v17->_internalQueue;
    v17->_internalQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    calendar = v17->_calendar;
    v17->_calendar = (NSCalendar *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sourceRegistry = v17->_sourceRegistry;
    v17->_sourceRegistry = v23;

    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    queuedIncrementalEvaluations = v17->_queuedIncrementalEvaluations;
    v17->_queuedIncrementalEvaluations = (NSMutableDictionary *)v25;

    objc_initWeak(&location, v17);
    v27 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
    v28 = v17->_internalQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __123__ACHEarnedInstanceAwardingEngine_initWithClient_assertionClient_dataStore_earnedInstanceStore_historicalEvaluationPolicy___block_invoke;
    handler[3] = &unk_264518588;
    id v31 = v12;
    objc_copyWeak(&v32, &location);
    notify_register_dispatch(v27, &v17->_protectedDataToken, v28, handler);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }

  return v17;
}

void __123__ACHEarnedInstanceAwardingEngine_initWithClient_assertionClient_dataStore_earnedInstanceStore_historicalEvaluationPolicy___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isProtectedDataAvailable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_queue_protectedDataBecameAvailable");
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHEarnedInstanceAwardingEngine;
  [(ACHEarnedInstanceAwardingEngine *)&v3 dealloc];
}

- (ACHEarnedInstanceAwardingEngine)initWithProfile:(id)a3 dataStore:(id)a4 earnedInstanceStore:(id)a5 historicalEvaluationPolicy:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)ACHEarnedInstanceAwardingEngine;
  id v13 = [(ACHEarnedInstanceAwardingEngine *)&v27 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeWeak((id *)&v14->_dataStore, v11);
    objc_storeWeak((id *)&v14->_earnedInstanceStore, v12);
    long long v15 = *(_OWORD *)&a6->var2;
    *(_OWORD *)&v14->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime = *(_OWORD *)&a6->var0;
    *(_OWORD *)&v14->_historicalEvaluationPolicy.endDate = v15;
    uint64_t v16 = HKCreateSerialDispatchQueue();
    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    calendar = v14->_calendar;
    v14->_calendar = (NSCalendar *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sourceRegistry = v14->_sourceRegistry;
    v14->_sourceRegistry = v20;

    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    queuedIncrementalEvaluations = v14->_queuedIncrementalEvaluations;
    v14->_queuedIncrementalEvaluations = (NSMutableDictionary *)v22;

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_profile);
    uint64_t v25 = [WeakRetained database];
    [v25 addProtectedDataObserver:v14];
  }
  return v14;
}

- (void)activate
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 113);
  objc_super v3 = ACHLogAwardEngine();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke_cold_1(v4);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Activating Awarding Engine", v5, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
  }
}

- (unint64_t)sourceCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__ACHEarnedInstanceAwardingEngine_sourceCount__block_invoke;
  v5[3] = &unk_264516580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__ACHEarnedInstanceAwardingEngine_sourceCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)dataStorePropertyProviderForSource:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__32;
  uint64_t v16 = __Block_byref_object_dispose__32;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ACHEarnedInstanceAwardingEngine_dataStorePropertyProviderForSource___block_invoke;
  block[3] = &unk_2645165A8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __70__ACHEarnedInstanceAwardingEngine_dataStorePropertyProviderForSource___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)registerSource:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D1183E0])
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke;
    v7[3] = &unk_264515DE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(internalQueue, v7);
  }
  else
  {
    id v6 = ACHLogAwardEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceAwardingEngine registerSource:]();
    }
  }
}

void __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  id v4 = [*(id *)(a1 + 40) uniqueName];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = ACHLogAwardEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke_cold_1((uint64_t)v2);
    }
  }
  else
  {
    id v7 = [ACHEarnedInstanceAwardingSourceRecord alloc];
    uint64_t v8 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    id v11 = [*(id *)(a1 + 32) currentDate];
    id v6 = [(ACHEarnedInstanceAwardingSourceRecord *)v7 initWithSource:v8 earnedInstanceStore:WeakRetained dataStore:v10 registrationDate:v11];

    uint64_t v12 = *(void **)(a1 + 40);
    id v13 = *(void **)(*(void *)(a1 + 32) + 80);
    uint64_t v14 = [v12 uniqueName];
    [v13 setObject:v6 forKeyedSubscript:v14];

    long long v15 = ACHLogAwardEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [*v2 uniqueName];
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, "Awarding engine registered source with name [%{public}@]", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)deregisterSource:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D1183E0])
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke;
    v7[3] = &unk_264515DE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(internalQueue, v7);
  }
  else
  {
    id v6 = ACHLogAwardEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceAwardingEngine deregisterSource:]();
    }
  }
}

void __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  id v4 = [*(id *)(a1 + 40) uniqueName];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = *(void **)(*(void *)(a1 + 32) + 80);
    id v8 = [v6 uniqueName];
    [v7 removeObjectForKey:v8];

    uint64_t v9 = ACHLogAwardEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*v2 uniqueName];
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Awarding engine deregistered source with name [%{public}@]", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = ACHLogAwardEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke_cold_1((uint64_t)v2);
    }
  }
}

- (void)requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4
{
  p_client = &self->_client;
  id v7 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_client);

  if (WeakRetained) {
    [(ACHEarnedInstanceAwardingEngine *)self _client_requestIncrementalEvaluationForSource:v9 evaluationBlock:v7];
  }
  else {
    [(ACHEarnedInstanceAwardingEngine *)self _daemon_requestIncrementalEvaluationForSource:v9 evaluationBlock:v7];
  }
}

- (void)_client_requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = ACHLogAwardEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Incremental evaluation requested for source with name: %{public}@", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke;
  block[3] = &unk_264516AB0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke(id *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)a1[4];
  if (*((unsigned char *)v2 + 113))
  {
    uint64_t v3 = a1 + 5;
    id v4 = [v2[10] objectForKeyedSubscript:a1[5]];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 lastCompletedEvaluationInterval];

      if (v6)
      {
        if (*((unsigned char *)a1[4] + 112))
        {
          id v7 = ACHLogAwardEngine();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            id v8 = *v3;
            *(_DWORD *)buf = 138543362;
            v36 = v8;
            _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Queuing incremental request for %{public}@ because historical run in progress", buf, 0xCu);
          }

          id v9 = [a1[6] copy];
          id v10 = (void *)MEMORY[0x223C507A0]();
          [*((id *)a1[4] + 15) setObject:v10 forKeyedSubscript:a1[5]];
        }
        else
        {
          id v9 = [NSString stringWithFormat:@"Achievements Incremental Evaluation - %@", a1[5]];
          id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 2);
          id v34 = 0;
          uint64_t v12 = [WeakRetained acquireDatabaseAssertionWithIdentifier:v9 error:&v34];
          id v13 = v34;

          id v14 = ACHLogAwardEngine();
          long long v15 = v14;
          if (v12)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = *v3;
              *(_DWORD *)buf = 138543362;
              v36 = v16;
              _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, "Acquired assertion, proceeding with evaluation and removing queued evaluation if necessary for %{public}@", buf, 0xCu);
            }

            [*((id *)a1[4] + 15) removeObjectForKey:a1[5]];
            uint64_t v17 = [v5 lastScheduledEvaluationInterval];
            uint64_t v18 = [v17 endDate];
            uint64_t v19 = v18;
            if (v18)
            {
              id v20 = v18;
            }
            else
            {
              v24 = [v5 lastCompletedEvaluationInterval];
              id v20 = [v24 endDate];
            }
            v23 = [a1[4] currentDate];
            if ([v20 compare:v23] == 1)
            {
              uint64_t v25 = ACHLogAwardEngine();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_5();
              }
            }
            else
            {
              v26 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v20 endDate:v23];
              objc_super v27 = ACHLogAwardEngine();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v36 = v26;
                _os_log_impl(&dword_21F5DA000, v27, OS_LOG_TYPE_DEFAULT, "Incremental evaluation date interval is %{public}@", buf, 0xCu);
              }

              v31[0] = MEMORY[0x263EF8330];
              v31[1] = 3221225472;
              v31[2] = __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_362;
              v31[3] = &unk_2645185B0;
              id v28 = a1[6];
              id v32 = v26;
              id v33 = v28;
              v29[0] = MEMORY[0x263EF8330];
              v29[1] = 3221225472;
              v29[2] = __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2;
              v29[3] = &unk_264516A88;
              v29[4] = a1[4];
              id v30 = v12;
              uint64_t v25 = v26;
              [v5 addEvaluationOperationWithDateInterval:v25 databaseContext:0 evaluationBlock:v31 completion:v29];
            }
          }
          else
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_4();
            }

            uint64_t v21 = ACHLogAwardEngine();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = *v3;
              *(_DWORD *)buf = 138543362;
              v36 = v22;
              _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, "Queuing incremental request for %{public}@ until protected data becomes available", buf, 0xCu);
            }

            id v20 = (id)[a1[6] copy];
            v23 = (void *)MEMORY[0x223C507A0]();
            [*((id *)a1[4] + 15) setObject:v23 forKeyedSubscript:a1[5]];
          }
        }
      }
      else
      {
        id v9 = ACHLogAwardEngine();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_3();
        }
      }
    }
    else
    {
      id v9 = ACHLogAwardEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_2();
      }
    }
  }
  else
  {
    v5 = ACHLogAwardEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_1();
    }
  }
}

uint64_t __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_362(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  [WeakRetained invalidateAssertionWithToken:v3 error:&v6];
  id v4 = v6;

  if (v4)
  {
    v5 = ACHLogAwardEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2_cold_1();
    }
  }
}

- (void)_daemon_requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = ACHLogAwardEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Incremental evaluation requested for source with name: %{public}@", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke;
  block[3] = &unk_264516AB0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

void __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 113))
  {
    uint64_t v3 = [*(id *)(v2 + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3)
    {
      v5 = [v3 lastCompletedEvaluationInterval];

      if (v5)
      {
        id v6 = [v4 lastScheduledEvaluationInterval];
        id v7 = [v6 endDate];
        id v8 = v7;
        if (v7)
        {
          id v9 = v7;
        }
        else
        {
          id v10 = [v4 lastCompletedEvaluationInterval];
          id v9 = [v10 endDate];
        }
        id v11 = [*(id *)(a1 + 32) currentDate];
        if ([v9 compare:v11] == 1)
        {
          uint64_t v12 = ACHLogAwardEngine();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_5();
          }
        }
        else
        {
          uint64_t v12 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v11];
          id v13 = ACHLogAwardEngine();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v31 = v12;
            _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Incremental evaluation date interval is %{public}@", buf, 0xCu);
          }

          id v14 = [NSString stringWithFormat:@"Achievements Incremental Evaluation - %@", *(void *)(a1 + 40)];
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
          id v16 = [WeakRetained database];
          id v29 = 0;
          uint64_t v17 = +[ACHDatabaseAssertion assertionWithDatabase:v16 identifier:v14 error:&v29];
          uint64_t v18 = v29;

          uint64_t v19 = ACHLogAwardEngine();
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v20)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Acquired assertion, proceeding with evaluation and removing queued evaluation if necessary", buf, 2u);
            }

            [*(id *)(*(void *)(a1 + 32) + 120) removeObjectForKey:*(void *)(a1 + 40)];
            uint64_t v21 = ACHDatabaseContextWithAccessibilityAssertion(v17);
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_366;
            v26[3] = &unk_2645185B0;
            id v28 = *(id *)(a1 + 48);
            objc_super v27 = v12;
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2;
            v24[3] = &unk_264516010;
            id v25 = v17;
            [v4 addEvaluationOperationWithDateInterval:v27 databaseContext:v21 evaluationBlock:v26 completion:v24];

            uint64_t v22 = v28;
          }
          else
          {
            if (v20)
            {
              *(_DWORD *)buf = 138543362;
              id v31 = v18;
              _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion with error %{public}@", buf, 0xCu);
            }

            v23 = ACHLogAwardEngine();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "Queuing incremental request until protected data becomes available", buf, 2u);
            }

            uint64_t v21 = (void *)[*(id *)(a1 + 48) copy];
            uint64_t v22 = (void *)MEMORY[0x223C507A0]();
            [*(id *)(*(void *)(a1 + 32) + 120) setObject:v22 forKeyedSubscript:*(void *)(a1 + 40)];
          }
        }
      }
      else
      {
        id v9 = ACHLogAwardEngine();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_3();
        }
      }
    }
    else
    {
      id v9 = ACHLogAwardEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v4 = ACHLogAwardEngine();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_1();
    }
  }
}

uint64_t __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_366(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
  block[3] = &unk_264516580;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync(internalQueue, block);
  if (*((unsigned char *)v14 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    BOOL v7 = WeakRetained == 0;

    if (v7) {
      [(ACHEarnedInstanceAwardingEngine *)self _daemon_requestHistoricalEvaluationForAllSourcesWithCompletion:v4];
    }
    else {
      [(ACHEarnedInstanceAwardingEngine *)self _client_requestHistoricalEvaluationForAllSourcesWithCompletion:v4];
    }
  }
  else
  {
    id v8 = ACHLogAwardEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceAwardingEngine requestHistoricalEvaluationForAllSourcesWithCompletion:](v8);
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Awarding Engine not activated";
    id v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v11 = [v9 errorWithDomain:@"com.apple.ActivityAchievements" code:11 userInfo:v10];

    v4[2](v4, 0, v11);
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __90__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 113);
  return result;
}

- (void)_client_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = ACHLogAwardEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation for all sources", (uint8_t *)&buf, 2u);
  }

  if (self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime) {
    double v6 = 600.0;
  }
  else {
    double v6 = 15.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionClient);
  id v19 = 0;
  id v8 = [WeakRetained acquireDatabaseAssertionWithIdentifier:@"Achievements Historical Evaluation" duration:&v19 error:v6];
  id v9 = v19;

  if (v8)
  {
    objc_initWeak(&buf, self);
    id v10 = [MEMORY[0x263EFF910] date];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
    v13[3] = &unk_2645185D8;
    id v11 = v10;
    id v14 = v11;
    objc_copyWeak(&v17, &buf);
    id v15 = v8;
    id v16 = v4;
    [(ACHEarnedInstanceAwardingEngine *)self _requestHistoricalEvaluationForAllSourcesWithCompletion:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&buf);
  }
  else
  {
    uint64_t v12 = ACHLogAwardEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceAwardingEngine _client_requestHistoricalEvaluationForAllSourcesWithCompletion:]();
    }

    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v9);
  }
}

void __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v8 = v7;

  id v9 = ACHLogAwardEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (a2) {
      id v10 = @"YES";
    }
    *(_DWORD *)id buf = 134218242;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Completed historical evaluation in %lf seconds with success: %@", buf, 0x16u);
  }

  if (v5)
  {
    id v11 = ACHLogAwardEngine();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_2();
    }
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v15 = *(void *)(a1 + 40);
    id v19 = 0;
    char v16 = [v14 invalidateAssertionWithToken:v15 error:&v19];
    id v17 = v19;

    if ((v16 & 1) == 0)
    {
      uint64_t v18 = ACHLogAwardEngine();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1();
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_daemon_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ACHLogAwardEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation for all sources", buf, 2u);
  }

  if (self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime) {
    double v6 = 60.0;
  }
  else {
    double v6 = 15.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v8 = [WeakRetained database];
  id v16 = 0;
  id v9 = +[ACHDatabaseAssertion assertionWithDatabase:v8 identifier:@"Achievements Historical Evaluation" timeout:&v16 error:v6];
  id v10 = v16;

  if (v9)
  {
    id v11 = ACHDatabaseContextWithAccessibilityAssertion(v9);
    [v11 setCacheScope:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __98__ACHEarnedInstanceAwardingEngine__daemon_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
    v13[3] = &unk_264518600;
    id v14 = v9;
    id v15 = v4;
    [(ACHEarnedInstanceAwardingEngine *)self requestHistoricalEvaluationForAllSourcesWithDatabaseContext:v11 completion:v13];
  }
  else
  {
    uint64_t v12 = ACHLogAwardEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v18 = v10;
      _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion with error %{public}@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v10);
  }
}

void __98__ACHEarnedInstanceAwardingEngine__daemon_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = ACHLogAwardEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Completed historical evaluation with success: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = ACHLogAwardEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Assertion acquired! Let's go!", buf, 2u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
  v8[3] = &unk_264517070;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(internalQueue, v8);
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 72))
  {
LABEL_6:
    id v4 = dispatch_group_create();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    char v37 = 1;
    *(void *)id buf = 0;
    id v31 = buf;
    uint64_t v32 = 0x3032000000;
    id v33 = __Block_byref_object_copy__32;
    id v34 = __Block_byref_object_dispose__32;
    id v35 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = [*(id *)(*(void *)(a1 + 32) + 80) allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * v10);
          dispatch_group_enter(v4);
          uint64_t v12 = *(void **)(a1 + 32);
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_386;
          v22[3] = &unk_264518650;
          uint64_t v24 = v36;
          id v25 = buf;
          v22[4] = v12;
          v22[5] = v11;
          v23 = v4;
          objc_msgSend(v12, "_queue_evaluateHistoryForSource:completion:", v11, v22);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v42 count:16];
      }
      while (v8);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(NSObject **)(v13 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_387;
    block[3] = &unk_264518678;
    BOOL v20 = v36;
    uint64_t v21 = buf;
    block[4] = v13;
    id v19 = *(id *)(a1 + 40);
    dispatch_group_notify(v4, v14, block);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v36, 8);
    goto LABEL_18;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
  id v41 = 0;
  char v3 = [WeakRetained clearAllInMemoryPropertiesWithError:&v41];
  id v4 = v41;

  id v5 = ACHLogAwardEngine();
  double v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "DataStore cleared for historical evaluation", buf, 2u);
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1();
  }

  id v15 = *(void **)(a1 + 40);
  if (v15)
  {
    id v16 = dispatch_get_global_queue(21, 0);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_385;
    v38[3] = &unk_2645168B8;
    id v40 = v15;
    id v4 = v4;
    v39 = v4;
    dispatch_async(v16, v38);
  }
LABEL_18:
}

uint64_t __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_385(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_386(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  double v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 32);
  block[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2;
  block[3] = &unk_264518628;
  char v15 = a2;
  uint64_t v14 = *(void *)(a1 + 64);
  id v11 = v5;
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) &= *(unsigned char *)(a1 + 80);
  uint64_t v2 = *(void *)(*(void *)(a1 + 72) + 8);
  id v5 = *(void **)(v2 + 40);
  char v3 = (id *)(v2 + 40);
  id v4 = v5;
  if (!v5) {
    id v4 = *(void **)(a1 + 32);
  }
  objc_storeStrong(v3, v4);
  if (!*(unsigned char *)(*(void *)(a1 + 40) + 73)) {
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 80) || *(void *)(a1 + 32))
  {
    double v6 = ACHLogAwardEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_1(a1);
    }
LABEL_8:

LABEL_9:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    return;
  }
  id v7 = ACHLogAwardEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 48) uniqueName];
    *(_DWORD *)id buf = 138412290;
    v36 = v8;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "[%@] succeeded historical evaluation, commiting data to dataStore", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  uint64_t v10 = (id *)(a1 + 48);
  id v11 = [*(id *)(a1 + 48) source];
  id v34 = 0;
  char v12 = [WeakRetained commitPropertiesForProvider:v11 withError:&v34];
  id v13 = v34;

  uint64_t v14 = ACHLogAwardEngine();
  char v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [*v10 source];
      id v17 = [v16 uniqueName];
      id v18 = [*v10 uniqueName];
      *(_DWORD *)id buf = 138412546;
      v36 = v17;
      __int16 v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, "Successfully commited data store properties for sourceRecord.source %@, now committing source record %@ properties", buf, 0x16u);
    }
    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    uint64_t v20 = *(void *)(a1 + 48);
    id v33 = v13;
    char v21 = [v19 commitPropertiesForProvider:v20 withError:&v33];
    double v6 = v33;

    if ((v21 & 1) == 0)
    {
      __int16 v22 = ACHLogAwardEngine();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_2(a1 + 48);
      }

      uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
      long long v26 = *(NSObject **)(v23 + 40);
      uint64_t v24 = (id *)(v23 + 40);
      id v25 = v26;
      if (v26) {
        long long v27 = v25;
      }
      else {
        long long v27 = v6;
      }
      objc_storeStrong(v24, v27);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_3(a1 + 48);
  }

  uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
  id v31 = *(void **)(v28 + 40);
  long long v29 = (id *)(v28 + 40);
  id v30 = v31;
  if (v31) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = v13;
  }
  objc_storeStrong(v29, v32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_387(uint64_t a1)
{
  char v2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_388;
    block[3] = &unk_264516FD0;
    id v8 = v4;
    char v9 = v2;
    id v7 = v3;
    dispatch_async(v5, block);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_performQueuedEvaluations");
}

uint64_t __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_388(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)requestHistoricalEvaluationForAllSourcesWithDatabaseContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ACHLogAwardEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation for all sources with database context", buf, 2u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke;
  block[3] = &unk_264516AB0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

void __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v2 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 1;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__32;
  void v24[4] = __Block_byref_object_dispose__32;
  id v25 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = [*(id *)(a1[4] + 80) allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        id v8 = (void *)a1[4];
        uint64_t v9 = a1[5];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_2;
        v16[3] = &unk_2645186C8;
        v16[4] = v8;
        id v18 = v26;
        id v19 = v24;
        id v17 = v2;
        objc_msgSend(v8, "_queue_evaluateHistoryForSource:databaseContext:completion:", v7, v9, v16);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v4);
  }

  id v10 = (void *)a1[6];
  if (v10)
  {
    id v11 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_4;
    block[3] = &unk_2645186F0;
    id v13 = v10;
    id v14 = v26;
    char v15 = v24;
    dispatch_group_notify(v2, v11, block);
  }
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

void __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_3;
  block[3] = &unk_2645186A0;
  char v14 = a2;
  uint64_t v13 = *(void *)(a1 + 56);
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) &= *(unsigned char *)(a1 + 64);
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  uint64_t v4 = v5;
  if (!v5) {
    uint64_t v4 = *(void **)(a1 + 32);
  }
  objc_storeStrong(v3, v4);
  uint64_t v6 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v6);
}

uint64_t __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__ACHEarnedInstanceAwardingEngine_database_protectedDataDidBecomeAvailable___block_invoke;
    block[3] = &unk_264515DB8;
    void block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __76__ACHEarnedInstanceAwardingEngine_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_protectedDataBecameAvailable");
}

- (void)_queue_protectedDataBecameAvailable
{
  id v3 = ACHLogAwardEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Protected data became available; attempting queued evaluation",
      v4,
      2u);
  }

  [(ACHEarnedInstanceAwardingEngine *)self _queue_performQueuedEvaluations];
}

- (void)_queue_performQueuedEvaluations
{
  queuedIncrementalEvaluations = self->_queuedIncrementalEvaluations;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__ACHEarnedInstanceAwardingEngine__queue_performQueuedEvaluations__block_invoke;
  v3[3] = &unk_264518718;
  v3[4] = self;
  [(NSMutableDictionary *)queuedIncrementalEvaluations enumerateKeysAndObjectsUsingBlock:v3];
}

void __66__ACHEarnedInstanceAwardingEngine__queue_performQueuedEvaluations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ACHLogAwardEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Attempting queued evaluation for %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) requestIncrementalEvaluationForSource:v5 evaluationBlock:v6];
}

- (void)_queue_evaluateHistoryForSource:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  int v8 = ACHLogAwardEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 source];
    uint64_t v10 = [v9 uniqueName];
    *(_DWORD *)id buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Getting ready to evaluate history for source: %{public}@", buf, 0xCu);
  }
  id v11 = [v6 lastCompletedEvaluationInterval];
  long long v12 = [v11 endDate];
  long long v13 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
  *(_OWORD *)id buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
  long long v36 = v13;
  char v14 = ACHHistoricalEvaluationStartDateForPolicy((uint64_t)buf, v12);

  if (v14)
  {
    calendar = self->_calendar;
    id v16 = [(ACHEarnedInstanceAwardingEngine *)self currentDate];
    long long v17 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
    *(_OWORD *)id buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
    long long v36 = v17;
    id v18 = ACHHistoricalEvaluationEndDateForPolicy((uint64_t)buf, calendar, v16);

    [v18 timeIntervalSinceReferenceDate];
    double v20 = v19;
    [v14 timeIntervalSinceReferenceDate];
    if (v20 <= v21)
    {
      uint64_t v29 = ACHLogAwardEngine();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ACHEarnedInstanceAwardingEngine _queue_evaluateHistoryForSource:completion:]((uint64_t)v14);
      }

      if (!v7) {
        goto LABEL_17;
      }
      id v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.Achievements.AwardingEngine" code:101 userInfo:0];
      v7[2](v7, 0, v26);
    }
    else
    {
      long long v22 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v14 endDate:v18];
      long long v23 = ACHLogAwardEngine();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        *(void *)&uint8_t buf[4] = v22;
        _os_log_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_DEFAULT, "Historical evaluation interval is %{public}@", buf, 0xCu);
      }

      [v6 cancelAllEvaluationOperations];
      uint64_t v24 = [v6 source];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke_390;
      v30[3] = &unk_264518768;
      id v31 = v24;
      id v32 = v22;
      id v25 = v22;
      id v26 = v24;
      [v6 addEvaluationOperationWithDateInterval:v25 evaluationBlock:v30 completion:v7];
    }
LABEL_17:

    goto LABEL_18;
  }
  char v27 = ACHLogAwardEngine();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_21F5DA000, v27, OS_LOG_TYPE_DEFAULT, "No valid start date, not evaluating history", buf, 2u);
  }

  if (v7)
  {
    uint64_t v28 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke;
    block[3] = &unk_264518740;
    id v34 = v7;
    dispatch_async(v28, block);

    id v18 = v34;
    goto LABEL_17;
  }
LABEL_18:
}

void __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.Achievements.AwardingEngine" code:102 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke_390(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) earnedInstancesForHistoricalInterval:*(void *)(a1 + 40) error:a2];
}

- (void)_queue_evaluateHistoryForSource:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v11 = ACHLogAwardEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [v8 source];
    long long v13 = [v12 uniqueName];
    *(_DWORD *)id buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Getting ready to evaluate history for source: %{public}@", buf, 0xCu);
  }
  char v14 = [v8 lastCompletedEvaluationInterval];
  char v15 = [v14 endDate];
  long long v16 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
  *(_OWORD *)id buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
  long long v40 = v16;
  long long v17 = ACHHistoricalEvaluationStartDateForPolicy((uint64_t)buf, v15);

  if (v17)
  {
    calendar = self->_calendar;
    double v19 = [(ACHEarnedInstanceAwardingEngine *)self currentDate];
    long long v20 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
    *(_OWORD *)id buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
    long long v40 = v20;
    double v21 = ACHHistoricalEvaluationEndDateForPolicy((uint64_t)buf, calendar, v19);

    [v21 timeIntervalSinceReferenceDate];
    double v23 = v22;
    [v17 timeIntervalSinceReferenceDate];
    if (v23 <= v24)
    {
      id v32 = ACHLogAwardEngine();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[ACHEarnedInstanceAwardingEngine _queue_evaluateHistoryForSource:completion:]((uint64_t)v17);
      }

      if (!v10) {
        goto LABEL_17;
      }
      id v29 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.Achievements.AwardingEngine" code:101 userInfo:0];
      v10[2](v10, 0, v29);
    }
    else
    {
      id v25 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v17 endDate:v21];
      id v26 = ACHLogAwardEngine();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl(&dword_21F5DA000, v26, OS_LOG_TYPE_DEFAULT, "Historical evaluation interval is %{public}@", buf, 0xCu);
      }

      [v8 cancelAllEvaluationOperations];
      char v27 = [v8 source];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke_392;
      v33[3] = &unk_264518790;
      id v34 = v27;
      id v35 = v25;
      id v36 = v9;
      id v28 = v25;
      id v29 = v27;
      [v8 addEvaluationOperationWithDateInterval:v28 databaseContext:v36 evaluationBlock:v33 completion:v10];
    }
LABEL_17:

    goto LABEL_18;
  }
  id v30 = ACHLogAwardEngine();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_21F5DA000, v30, OS_LOG_TYPE_DEFAULT, "No valid start date, not evaluating history", buf, 2u);
  }

  if (v10)
  {
    id v31 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke;
    block[3] = &unk_264518740;
    v38 = v10;
    dispatch_async(v31, block);

    double v21 = v38;
    goto LABEL_17;
  }
LABEL_18:
}

void __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.Achievements.AwardingEngine" code:102 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke_392(uint64_t a1)
{
  return [*(id *)(a1 + 32) earnedInstancesForHistoricalInterval:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (id)currentDate
{
  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
  {
    id v3 = currentDateOverride;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedIncrementalEvaluations, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_sourceRegistry, 0);
  objc_destroyWeak((id *)&self->_earnedInstanceStore);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_assertionClient);
  objc_destroyWeak((id *)&self->_client);
}

void __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Awarding Engine is already activated!", v1, 2u);
}

- (void)registerSource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Not registering source %{public}@ because it does not conform to awarding protocol", v2, v3, v4, v5, v6);
}

void __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_9(a1) uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F5DA000, v2, v3, "Error registering source with name [%{public}@]: a provider with this name already exists", v4, v5, v6, v7, v8);
}

- (void)deregisterSource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Not deregistering source %{public}@ because it does not conform to awarding protocol", v2, v3, v4, v5, v6);
}

void __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_9(a1) uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F5DA000, v2, v3, "Error deregistering source with name [%{public}@]: no source is registered", v4, v5, v6, v7, v8);
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "[%{public}@] requested an incremental evaluation but engine is not activated yet. Skipping!", v2, v3, v4, v5, v6);
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error requesting incremental evaluation for source with name [%{public}@]: no such source exists", v2, v3, v4, v5, v6);
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error requesting incremental evaluation for source with name [%{public}@]: this source has never completed a historical run", v2, v3, v4, v5, v6);
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Failed to get accessibility assertion for %{public}@ with error %{public}@", (void)v3, DWORD2(v3));
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Error requesting incremental evaluation for source with name [%{public}@]: the evaluation start date is greater than the end date. - sourceRecord: %{public}@", (void)v3, DWORD2(v3));
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error invalidating assertion with token %@: %@");
}

- (void)requestHistoricalEvaluationForAllSourcesWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Received a request to run a historical evaluation but engine is not activated yet. Skipping!", v1, 2u);
}

- (void)_client_requestHistoricalEvaluationForAllSourcesWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Failed to get accessibility assertion with error %{public}@", v2, v3, v4, v5, v6);
}

void __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error invalidating accessibility assertion: %{public}@", v2, v3, v4, v5, v6);
}

void __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error: %{public}@", v2, v3, v4, v5, v6);
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Failed to clear data store with error %{public}@", v2, v3, v4, v5, v6);
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_21F5DA000, v2, v3, "[%@] failed historical evaluation, not commiting data to dataStore: %{public}@", v4, v5, v6, v7, v8);
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_9(a1) uniqueName];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F5DA000, v2, v3, "Error committing data store properties for sourceRecord %@ with error %{public}@", v4, v5, v6, v7, v8);
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_3(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_9(a1) source];
  uint64_t v2 = [v1 uniqueName];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F5DA000, v3, v4, "Error committing data store properties for sourceRecord.source %@ with error %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_evaluateHistoryForSource:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Historical evaluation not possible, interval start date comes after end date: %{public}@ -> %{public}@", (void)v3, DWORD2(v3));
}

@end