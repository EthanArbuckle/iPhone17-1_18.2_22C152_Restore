@interface AVTCoreDataStoreMaintenance
- (AVTCoreDataStoreMaintenance)initWithEnvironment:(id)a3 managedObjectContextFactory:(id)a4;
- (AVTCoreDataStoreMaintenance)initWithWorkQueue:(id)a3 managedObjectContextFactory:(id)a4 eventCoalescer:(id)a5 logger:(id)a6;
- (AVTEventCoalescer)eventCoalescer;
- (AVTUILogger)logger;
- (BOOL)fixDuplicateRecordIdentifiers:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)mitigateDuplicatesWithManagedObjectContext:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)workQueue;
- (id)duplicatedIdentifiersInManagedObjectContext:(id)a3 error:(id *)a4;
- (id)fetchDuplicatedRecordsForIdentifiers:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (id)mocFactory;
- (void)runMaintenanceTasks;
- (void)storeDidChange;
@end

@implementation AVTCoreDataStoreMaintenance

- (AVTCoreDataStoreMaintenance)initWithEnvironment:(id)a3 managedObjectContextFactory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 serialQueueProvider];
  v9 = ((void (**)(void, const char *))v8)[2](v8, "com.apple.AvatarUI.AVTCoreDataStoreMaintenance.workQueue");

  v10 = [AVTEventCoalescer alloc];
  v11 = [v7 logger];
  v12 = [(AVTEventCoalescer *)v10 initWithDelay:v9 queue:v11 logger:5.0];

  v13 = [v7 logger];

  v14 = [(AVTCoreDataStoreMaintenance *)self initWithWorkQueue:v9 managedObjectContextFactory:v6 eventCoalescer:v12 logger:v13];
  return v14;
}

- (AVTCoreDataStoreMaintenance)initWithWorkQueue:(id)a3 managedObjectContextFactory:(id)a4 eventCoalescer:(id)a5 logger:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTCoreDataStoreMaintenance;
  v15 = [(AVTCoreDataStoreMaintenance *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_logger, a6);
    objc_storeStrong((id *)&v16->_eventCoalescer, a5);
    uint64_t v17 = [v12 copy];
    id mocFactory = v16->_mocFactory;
    v16->_id mocFactory = (id)v17;

    objc_initWeak(&location, v16);
    eventCoalescer = v16->_eventCoalescer;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __99__AVTCoreDataStoreMaintenance_initWithWorkQueue_managedObjectContextFactory_eventCoalescer_logger___block_invoke;
    v21[3] = &unk_2647C3680;
    objc_copyWeak(&v22, &location);
    [(AVTEventCoalescer *)eventCoalescer registerEventForCoalescingWithLabel:@"StoreMaintenanceObservedChange" handler:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __99__AVTCoreDataStoreMaintenance_initWithWorkQueue_managedObjectContextFactory_eventCoalescer_logger___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runMaintenanceTasks];
}

- (void)storeDidChange
{
  id v2 = [(AVTCoreDataStoreMaintenance *)self eventCoalescer];
  [v2 eventDidOccur:0];
}

- (void)runMaintenanceTasks
{
  v3 = [(AVTCoreDataStoreMaintenance *)self logger];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__AVTCoreDataStoreMaintenance_runMaintenanceTasks__block_invoke;
  v4[3] = &unk_2647C36A8;
  v4[4] = self;
  [v3 runningMaintenance:v4];
}

void __50__AVTCoreDataStoreMaintenance_runMaintenanceTasks__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mocFactory];
  v3 = v2[2]();

  v4 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
  id v14 = 0;
  char v5 = [v3 setQueryGenerationFromToken:v4 error:&v14];
  id v6 = v14;

  id v7 = *(void **)(a1 + 32);
  if (v5)
  {
    id v13 = 0;
    char v8 = [v7 mitigateDuplicatesWithManagedObjectContext:v3 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0)
    {
      v10 = [*(id *)(a1 + 32) logger];
      id v11 = [v9 description];
      [v10 logErrorMitigatingDuplicates:v11];
    }
    id v12 = [*(id *)(a1 + 32) logger];
    [v12 logMaintenanceCompleted];
  }
  else
  {
    id v9 = [v7 logger];
    id v12 = [v6 description];
    [v9 logErrorPinningContextToCurrentQueryGenerationToken:v12];
  }
}

- (BOOL)mitigateDuplicatesWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AVTCoreDataStoreMaintenance *)self duplicatedIdentifiersInManagedObjectContext:v6 error:a4];
  char v8 = v7;
  if (v7)
  {
    if ([v7 count])
    {
      id v9 = [(AVTCoreDataStoreMaintenance *)self fetchDuplicatedRecordsForIdentifiers:v8 managedObjectContext:v6 error:a4];
      if (v9) {
        BOOL v10 = [(AVTCoreDataStoreMaintenance *)self fixDuplicateRecordIdentifiers:v9 managedObjectContext:v6 error:a4];
      }
      else {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)fixDuplicateRecordIdentifiers:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__AVTCoreDataStoreMaintenance_fixDuplicateRecordIdentifiers_managedObjectContext_error___block_invoke;
  v9[3] = &unk_2647C36D0;
  v9[4] = self;
  id v7 = a4;
  [a3 enumerateKeysAndObjectsUsingBlock:v9];
  LOBYTE(a5) = [v7 save:a5];

  return (char)a5;
}

void __88__AVTCoreDataStoreMaintenance_fixDuplicateRecordIdentifiers_managedObjectContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v16 = a3;
  objc_msgSend(v16, "subarrayWithRange:", 1, objc_msgSend(v16, "count") - 1);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = [MEMORY[0x263F08C38] UUID];
        [v10 setIdentifier:v11];

        id v12 = [*(id *)(a1 + 32) logger];
        id v13 = [v5 UUIDString];
        id v14 = [v10 identifier];
        v15 = [v14 UUIDString];
        [v12 logDeduplicateRecordWithIdentifier:v13 toNewRecordWithIdentifier:v15];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (id)fetchDuplicatedRecordsForIdentifiers:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Avatar"];
  BOOL v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"identifier", v7];
  [v9 setPredicate:v10];

  id v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"orderDate" ascending:1];
  v35[0] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [v9 setSortDescriptors:v12];

  v34[0] = @"identifier";
  v34[1] = @"orderDate";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  [v9 setPropertiesToFetch:v13];

  id v14 = [v8 executeFetchRequest:v9 error:a5];
  if (v14)
  {
    id v27 = v8;
    id v28 = v7;
    v15 = [MEMORY[0x263EFF9A0] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v26 = v14;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v22 = [v21 identifier];
          uint64_t v23 = [v15 objectForKeyedSubscript:v22];

          if (!v23)
          {
            uint64_t v23 = [MEMORY[0x263EFF980] array];
            objc_super v24 = [v21 identifier];
            [v15 setObject:v23 forKeyedSubscript:v24];
          }
          [v23 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v18);
    }

    id v8 = v27;
    id v7 = v28;
    id v14 = v26;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)duplicatedIdentifiersInManagedObjectContext:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF260];
  id v5 = a3;
  uint64_t v6 = [v4 fetchRequestWithEntityName:@"Avatar"];
  id v7 = [MEMORY[0x263F087F0] expressionForKeyPath:@"identifier"];
  id v8 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v8 setName:@"count"];
  uint64_t v9 = (void *)MEMORY[0x263F087F0];
  v28[0] = v7;
  BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  id v11 = [v9 expressionForFunction:@"count:" arguments:v10];
  [v8 setExpression:v11];

  [v8 setExpressionResultType:300];
  [v6 setResultType:2];
  id v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"identifier" ascending:1];
  id v27 = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  [v6 setSortDescriptors:v13];

  v26 = @"identifier";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  [v6 setPropertiesToGroupBy:v14];

  v25[0] = @"identifier";
  v25[1] = v8;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [v6 setPropertiesToFetch:v15];

  id v16 = [MEMORY[0x263F087F0] expressionForVariable:@"count"];
  uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ > 1", v16];
  [v6 setHavingPredicate:v17];

  uint64_t v18 = [v5 executeFetchRequest:v6 error:a4];

  if (v18)
  {
    uint64_t v19 = [(AVTCoreDataStoreMaintenance *)self logger];
    long long v20 = [v18 description];
    objc_msgSend(v19, "logDiscoveredDuplicates:count:", v20, objc_msgSend(v18, "count"));

    long long v21 = objc_msgSend(v18, "avt_map:", &__block_literal_global_1);
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

uint64_t __81__AVTCoreDataStoreMaintenance_duplicatedIdentifiersInManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"identifier"];
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTEventCoalescer)eventCoalescer
{
  return self->_eventCoalescer;
}

- (id)mocFactory
{
  return self->_mocFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mocFactory, 0);
  objc_storeStrong((id *)&self->_eventCoalescer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end