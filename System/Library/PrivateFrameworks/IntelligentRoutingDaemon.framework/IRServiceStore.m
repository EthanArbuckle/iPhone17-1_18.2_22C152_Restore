@interface IRServiceStore
+ (id)fetchAllServicesForClientIdentifier:(id)a3 persistenceManager:(id)a4;
+ (id)fetchAllServicesWithPersistenceManager:(id)a3;
+ (id)generateLogForServicesDatabaseWithPersistenceManager:(id)a3;
+ (id)generateLogForStringNumEntitiesInDatabaseWithPersistenceManager:(id)a3;
+ (void)adjustDBToStaticTokens:(id)a3;
+ (void)adjustFirstSeenDateOfCandidates:(id)a3;
+ (void)idendifyAndDeleteDuplicateServicesWithWithPersistenceManager:(id)a3;
- (BOOL)_cleanupCandidatesWithDate:(id)a3;
- (BOOL)_cleanupHistoryEventsWithDate:(id)a3;
- (BOOL)_cleanupNotAirplayCandidates;
- (BOOL)_cleanupPredictionEventsInDateInterval:(id)a3;
- (BOOL)_cleanupReplayEventsWithDate:(id)a3;
- (BOOL)_cleanupTrashedHistoryEvents;
- (BOOL)addCandidates:(id)a3;
- (BOOL)addHistoryEvent:(id)a3 withLimit:(unint64_t)a4;
- (BOOL)addReplayEvents:(id)a3 withLimit:(unint64_t)a4;
- (BOOL)addService:(id)a3;
- (BOOL)cleanupWithDate:(id)a3 dateIntervalOfMiLoPredictionsToDiscard:(id)a4;
- (BOOL)deleteCandidates:(id)a3;
- (BOOL)deleteService;
- (BOOL)injectStatisticsRelationship;
- (BOOL)updateCandidate:(id)a3;
- (BOOL)updateMiloServiceWithMiloUuidString:(id)a3;
- (BOOL)updateService:(id)a3;
- (BOOL)updateStatistics:(id)a3;
- (IRServiceStore)initWithPersistenceManager:(id)a3 serviceIdentifier:(id)a4;
- (NSString)serviceIdentifier;
- (id)fetchCandidatesContainer;
- (id)fetchHistoryEventsContainerWithLimit:(unint64_t)a3;
- (id)fetchMiLoServiceUuid;
- (id)fetchReplayEventAtDate:(id)a3;
- (id)fetchReplayEventsContainer;
- (id)fetchService;
- (id)fetchStatistics;
- (id)getReplayEventDescriptors;
@end

@implementation IRServiceStore

uint64_t __32__IRServiceStore_updateService___block_invoke(uint64_t a1)
{
  +[IRServiceMO setPropertiesOfServiceMO:*(void *)(a1 + 32) withServiceDO:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 48) commitChangesToStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __35__IRServiceStore_updateStatistics___block_invoke(uint64_t a1)
{
  +[IRStatisticsMO setPropertiesOfStatisticsMO:*(void *)(a1 + 32) withStatisticsDO:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 48) commitChangesToStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)updateStatistics:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v22[0] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v9 = [(IRStore *)self fetchManagedObjectWithEntityName:v7 byAndPredicates:v8 sortDescriptors:0 andLimit:0];

  if (v9)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v10 = [(IRStore *)self managedObjectContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__IRServiceStore_updateStatistics___block_invoke;
    v13[3] = &unk_2653A07B8;
    id v14 = v9;
    v16 = self;
    v17 = &v18;
    id v15 = v4;
    [v10 performBlockAndWait:v13];

    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __44__IRServiceStore_addReplayEvents_withLimit___block_invoke_2(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v5 = a2;
  id v7 = [v4 managedObjectContext];
  v6 = +[IRReplayEventMO replayEventMOWithReplayEventDO:v5 replayEventsContainerMO:v3 inManagedObjectContext:v7];

  [v2 addObject:v6];
}

- (BOOL)updateService:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceIdentifier", self->_serviceIdentifier];
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v22[0] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v9 = [(IRStore *)self fetchManagedObjectWithEntityName:v7 byAndPredicates:v8 sortDescriptors:0 andLimit:0];

  if (v9)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v10 = [(IRStore *)self managedObjectContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __32__IRServiceStore_updateService___block_invoke;
    v13[3] = &unk_2653A07B8;
    id v14 = v9;
    v16 = self;
    v17 = &v18;
    id v15 = v4;
    [v10 performBlockAndWait:v13];

    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)fetchService
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceIdentifier", self->_serviceIdentifier];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v9[0] = v3;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = [(IRStore *)self fetchObjectWithEntityName:v5 byAndPredicates:v6 sortDescriptors:0 andLimit:0];

  return v7;
}

- (BOOL)addReplayEvents:(id)a3 withLimit:(unint64_t)a4
{
  v54[1] = *MEMORY[0x263EF8340];
  id v30 = a3;
  v31 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v54[0] = v31;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
  v9 = [(IRStore *)self fetchManagedObjectWithEntityName:v7 byAndPredicates:v8 sortDescriptors:0 andLimit:0];

  if (v9)
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    v10 = [(IRStore *)self managedObjectContext];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __44__IRServiceStore_addReplayEvents_withLimit___block_invoke;
    v32[3] = &unk_2653A0920;
    id v33 = v30;
    id v34 = v9;
    v35 = self;
    v36 = &v37;
    [v10 performBlockAndWait:v32];

    BOOL v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"replayEventsContainer.service.serviceIdentifier", self->_serviceIdentifier];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v53 = v11;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
    id v15 = [(IRStore *)self countManagedObjectWithEntityName:v13 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

    BOOL v16 = 0;
    if (*((unsigned char *)v38 + 24) && v15)
    {
      int64_t v17 = [v15 unsignedIntegerValue] - a4;
      uint64_t v18 = v17 & ~(v17 >> 63);
      v19 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      uint64_t v20 = (id)*MEMORY[0x263F50090];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        char v21 = [NSNumber numberWithUnsignedInteger:a4];
        v22 = [NSNumber numberWithUnsignedInteger:v18];
        *(_DWORD *)buf = 136316162;
        v44 = "#service-store, ";
        __int16 v45 = 2112;
        v46 = v19;
        __int16 v47 = 2112;
        v48 = v15;
        __int16 v49 = 2112;
        v50 = v21;
        __int16 v51 = 2112;
        v52 = v22;
        _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_DEBUG, "%s[%@], Commiting replay events to DB, numberOfReplayEvents: %@, limit: %@, removing: %@", buf, 0x34u);

        uint64_t v18 = v17 & ~(v17 >> 63);
      }

      if (v17 < 1)
      {
        BOOL v16 = 1;
      }
      else
      {
        v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:1];
        uint64_t v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"replayEventsContainer.service.serviceIdentifier", self->_serviceIdentifier];

        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        uint64_t v42 = v24;
        v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
        v41 = v23;
        v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
        BOOL v16 = [(IRStore *)self batchDeleteObjectsWithEntityName:v26 byAndPredicates:v27 sortDescriptors:v28 andLimit:v18];

        BOOL v11 = (void *)v24;
      }
    }

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __44__IRServiceStore_addReplayEvents_withLimit___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__IRServiceStore_addReplayEvents_withLimit___block_invoke_2;
  v7[3] = &unk_2653A0970;
  id v8 = v2;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v2;
  [v3 enumerateObjectsUsingBlock:v7];
  [*(id *)(a1 + 40) addReplayEvent:v6];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) commitChangesToStore];
}

- (IRServiceStore)initWithPersistenceManager:(id)a3 serviceIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRServiceStore;
  id v8 = [(IRStore *)&v11 initWithPersistenceManager:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_serviceIdentifier, a4);
  }

  return v9;
}

+ (id)fetchAllServicesWithPersistenceManager:(id)a3
{
  id v3 = a3;
  id v4 = [[IRStore alloc] initWithPersistenceManager:v3];

  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [(IRStore *)v4 fetchObjectsWithEntityName:v6 byAndPredicates:0 sortDescriptors:0 andLimit:0];

  return v7;
}

+ (id)fetchAllServicesForClientIdentifier:(id)a3 persistenceManager:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [[IRStore alloc] initWithPersistenceManager:v5];

  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"clientIdentifier", v6];

  id v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  v14[0] = v8;
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v12 = [(IRStore *)v7 fetchObjectsWithEntityName:v10 byAndPredicates:v11 sortDescriptors:0 andLimit:0];

  return v12;
}

+ (id)generateLogForStringNumEntitiesInDatabaseWithPersistenceManager:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [[IRStore alloc] initWithPersistenceManager:v3];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = v3;
  id v5 = [v3 managedObjectModel];
  id v6 = [v5 entities];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    uint64_t v10 = @"Memory: Entity count in database (for all services): \n";
    do
    {
      uint64_t v11 = 0;
      v12 = v10;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = [*(id *)(*((void *)&v23 + 1) + 8 * v11) managedObjectClassName];
        id v14 = [(IRStore *)v4 countManagedObjectWithEntityName:v13 byAndPredicates:0 sortDescriptors:0 andLimit:0];
        uint64_t v10 = [(__CFString *)v12 stringByAppendingFormat:@"Entity Name: %@, Entity Count:%@\n", v13, v14];

        ++v11;
        v12 = v10;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v10 = @"Memory: Entity count in database (for all services): \n";
  }

  id v15 = NSNumber;
  BOOL v16 = [v22 persistenceStore];
  int64_t v17 = [v16 url];
  uint64_t v18 = [v17 path];
  v19 = [v15 numberWithUnsignedLongLong:IRGetDiskUsageForPath(v18) / 0xF4240uLL];
  uint64_t v20 = [(__CFString *)v10 stringByAppendingFormat:@"Total Disk Size: %@M\n", v19];

  return v20;
}

+ (id)generateLogForServicesDatabaseWithPersistenceManager:(id)a3
{
  id v3 = +[IRServiceStore fetchAllServicesWithPersistenceManager:a3];
  id v4 = objc_opt_new();
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __71__IRServiceStore_generateLogForServicesDatabaseWithPersistenceManager___block_invoke;
  v13 = &unk_26539F968;
  id v14 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:&v10];
  id v6 = NSString;
  uint64_t v7 = [v5 componentsJoinedByString:@"\n"];
  uint64_t v8 = [v6 stringWithFormat:@"Services in DB: \n%@", v7, v10, v11, v12, v13];

  return v8;
}

void __71__IRServiceStore_generateLogForServicesDatabaseWithPersistenceManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSString;
  id v4 = a2;
  id v9 = [v4 clientIdentifier];
  id v5 = [v4 serviceIdentifier];
  [v4 servicePackage];
  id v6 = IRServicePackageString();
  uint64_t v7 = [v4 lastSeenDate];

  uint64_t v8 = [v3 stringWithFormat:@"client:%@, service:%@, package:%@, last seen:%@", v9, v5, v6, v7];
  [v2 addObject:v8];
}

+ (void)idendifyAndDeleteDuplicateServicesWithWithPersistenceManager:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[IRServiceStore fetchAllServicesWithPersistenceManager:v3];
  id v5 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v12 = [v11 serviceIdentifier];

        if (v12)
        {
          v13 = [v11 serviceIdentifier];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v8);
  }
  v27 = v6;

  uint64_t v28 = v3;
  id v14 = [[IRStore alloc] initWithPersistenceManager:v3];
  v31 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenDate" ascending:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v5;
  uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceIdentifier", v18];
        uint64_t v20 = (objc_class *)objc_opt_class();
        char v21 = NSStringFromClass(v20);
        __int16 v45 = v19;
        v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
        v44 = v31;
        long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
        long long v24 = [(IRStore *)v14 fetchManagedObjectsWithEntityName:v21 byAndPredicates:v22 sortDescriptors:v23 andLimit:0];

        long long v25 = [(IRStore *)v14 managedObjectContext];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke;
        v32[3] = &unk_2653A0880;
        id v33 = v24;
        uint64_t v34 = v18;
        v35 = v14;
        id v26 = v24;
        [v25 performBlockAndWait:v32];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v16);
  }
}

void __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke(uint64_t a1)
{
  v2 = (void **)(a1 + 32);
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    id v3 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_cold_1(a1, v2, v3);
    }
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_38;
    v5[3] = &unk_2653A0858;
    id v6 = *(id *)(a1 + 48);
    [v4 enumerateObjectsUsingBlock:v5];
    [*(id *)(a1 + 48) commitChangesToStore];
  }
}

void __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_38(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 managedObjectContext];
    [v5 deleteObject:v4];
  }
}

+ (void)adjustDBToStaticTokens:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[IRServiceStore fetchAllServicesWithPersistenceManager:v3];
  id v5 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v12 = [v11 clientIdentifier];

        if (v12)
        {
          v13 = [v11 clientIdentifier];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v8);
  }
  id v26 = v6;

  id v14 = [[IRStore alloc] initWithPersistenceManager:v3];
  v29 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenDate" ascending:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v5;
  uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"clientIdentifier", *(void *)(*((void *)&v33 + 1) + 8 * j)];
        v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        long long v42 = v18;
        char v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
        long long v41 = v29;
        v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
        long long v23 = [(IRStore *)v14 fetchManagedObjectsWithEntityName:v20 byAndPredicates:v21 sortDescriptors:v22 andLimit:0];

        long long v24 = [(IRStore *)v14 managedObjectContext];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __41__IRServiceStore_adjustDBToStaticTokens___block_invoke;
        v30[3] = &unk_2653A08D0;
        id v31 = v23;
        v32 = v14;
        id v25 = v23;
        [v24 performBlockAndWait:v30];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v16);
  }
}

void __41__IRServiceStore_adjustDBToStaticTokens___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__IRServiceStore_adjustDBToStaticTokens___block_invoke_2;
  v3[3] = &unk_2653A08A8;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
  [*(id *)(a1 + 40) commitChangesToStore];
}

void __41__IRServiceStore_adjustDBToStaticTokens___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a2;
    id v7 = [v4 managedObjectContext];
    [v7 deleteObject:v5];
  }
  else
  {
    id v6 = a2;
    id v7 = [v6 clientIdentifier];
    objc_msgSend(v6, "setServiceIdentifier:");
  }
}

+ (void)adjustFirstSeenDateOfCandidates:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  id v5 = [v3 predicateWithFormat:@"%K = %@", @"firstSeenDate", 0];
  uint64_t v11 = @"firstSeenDate";
  id v6 = [MEMORY[0x263EFF910] now];
  v12[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  uint64_t v8 = [[IRStore alloc] initWithPersistenceManager:v4];
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  [(IRStore *)v8 batchUpdateObjectsWithEntityName:v10 predicate:v5 propertiesToUpdate:v7];
}

- (id)fetchCandidatesContainer
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v9[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = [(IRStore *)self fetchObjectWithEntityName:v5 byAndPredicates:v6 sortDescriptors:0 andLimit:0];

  return v7;
}

- (id)fetchReplayEventsContainer
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v9[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = [(IRStore *)self fetchObjectWithEntityName:v5 byAndPredicates:v6 sortDescriptors:0 andLimit:0];

  return v7;
}

- (id)fetchHistoryEventsContainerWithLimit:(unint64_t)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"historyEventsContainer.service.serviceIdentifier", self->_serviceIdentifier];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v27[0] = v5;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  id v26 = v6;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  uint64_t v11 = [(IRStore *)self fetchManagedObjectsWithEntityName:v8 byAndPredicates:v9 sortDescriptors:v10 andLimit:a3];

  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__6;
  long long v24 = __Block_byref_object_dispose__6;
  id v25 = (id)objc_opt_new();
  v12 = [(IRStore *)self managedObjectContext];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__IRServiceStore_fetchHistoryEventsContainerWithLimit___block_invoke;
  v17[3] = &unk_2653A0768;
  id v13 = v11;
  id v18 = v13;
  v19 = &v20;
  [v12 performBlockAndWait:v17];

  id v14 = [IRHistoryEventsContainerDO alloc];
  uint64_t v15 = [(IRHistoryEventsContainerDO *)v14 initWithHistoryEvents:v21[5]];

  _Block_object_dispose(&v20, 8);

  return v15;
}

void __55__IRServiceStore_fetchHistoryEventsContainerWithLimit___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) reverseObjectEnumerator];
  uint64_t v2 = [v7 nextObject];
  if (v2)
  {
    id v3 = (void *)v2;
    do
    {
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v5 = [v3 convert];
      [v4 addObject:v5];

      uint64_t v6 = [v7 nextObject];

      id v3 = (void *)v6;
    }
    while (v6);
  }
}

- (id)fetchMiLoServiceUuid
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v9[0] = v3;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = [(IRStore *)self fetchObjectWithEntityName:v5 byAndPredicates:v6 sortDescriptors:0 andLimit:0];

  return v7;
}

- (id)fetchReplayEventAtDate:(id)a3
{
  void v14[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A98];
  serviceIdentifier = self->_serviceIdentifier;
  id v6 = a3;
  id v7 = [v4 predicateWithFormat:@"%K = %@", @"replayEventsContainer.service.serviceIdentifier", serviceIdentifier];
  uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"date", v6];

  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  v14[0] = v7;
  v14[1] = v8;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v12 = [(IRStore *)self fetchObjectWithEntityName:v10 byAndPredicates:v11 sortDescriptors:0 andLimit:0];

  return v12;
}

- (id)fetchStatistics
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v9[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = [(IRStore *)self fetchObjectWithEntityName:v5 byAndPredicates:v6 sortDescriptors:0 andLimit:0];

  return v7;
}

- (BOOL)addService:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(IRStore *)self managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__IRServiceStore_addService___block_invoke;
  v8[3] = &unk_2653A08F8;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  [v5 performBlockAndWait:v8];

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

uint64_t __29__IRServiceStore_addService___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[IRServiceMO MOService:v2 inManagedObjectContext:v3];

  uint64_t result = [*(id *)(a1 + 40) commitChangesToStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)addCandidates:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v22[0] = v5;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v9 = [(IRStore *)self fetchManagedObjectWithEntityName:v7 byAndPredicates:v8 sortDescriptors:0 andLimit:0];

  if (v9)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    uint64_t v10 = [(IRStore *)self managedObjectContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __32__IRServiceStore_addCandidates___block_invoke;
    v13[3] = &unk_2653A0920;
    id v14 = v4;
    id v15 = v9;
    uint64_t v16 = self;
    int64_t v17 = &v18;
    [v10 performBlockAndWait:v13];

    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __32__IRServiceStore_addCandidates___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __32__IRServiceStore_addCandidates___block_invoke_2;
  uint64_t v8 = &unk_2653A0288;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v4;
  [v2 enumerateObjectsUsingBlock:&v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore", v5, v6, v7, v8);
}

void __32__IRServiceStore_addCandidates___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 managedObjectContext];
  uint64_t v5 = +[IRCandidateMO MOCandidate:v4 candidatesContainerMO:v2 inManagedObjectContext:v6];

  [v2 addCandidatesObject:v5];
}

- (BOOL)addHistoryEvent:(id)a3 withLimit:(unint64_t)a4
{
  v54[1] = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v31 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v54[0] = v31;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
  id v9 = [(IRStore *)self fetchManagedObjectWithEntityName:v7 byAndPredicates:v8 sortDescriptors:0 andLimit:0];

  if (v9)
  {
    uint64_t v37 = 0;
    long long v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    uint64_t v10 = [(IRStore *)self managedObjectContext];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __44__IRServiceStore_addHistoryEvent_withLimit___block_invoke;
    v32[3] = &unk_2653A0920;
    id v33 = v9;
    id v34 = v30;
    long long v35 = self;
    long long v36 = &v37;
    [v10 performBlockAndWait:v32];

    BOOL v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"historyEventsContainer.service.serviceIdentifier", self->_serviceIdentifier];
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    v53 = v11;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
    id v15 = [(IRStore *)self countManagedObjectWithEntityName:v13 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

    BOOL v16 = 0;
    if (*((unsigned char *)v38 + 24) && v15)
    {
      int64_t v17 = [v15 unsignedIntegerValue] - a4;
      uint64_t v18 = v17 & ~(v17 >> 63);
      v19 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      uint64_t v20 = (id)*MEMORY[0x263F50090];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        char v21 = [NSNumber numberWithUnsignedInteger:a4];
        uint64_t v22 = [NSNumber numberWithUnsignedInteger:v18];
        *(_DWORD *)buf = 136316162;
        v44 = "#service-store, ";
        __int16 v45 = 2112;
        v46 = v19;
        __int16 v47 = 2112;
        uint64_t v48 = v15;
        __int16 v49 = 2112;
        v50 = v21;
        __int16 v51 = 2112;
        v52 = v22;
        _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_INFO, "%s[%@], Commiting history event to DB, numberOfHistoryEvents: %@, limit: %@, removing: %@", buf, 0x34u);

        uint64_t v18 = v17 & ~(v17 >> 63);
      }

      if (v17 < 1)
      {
        BOOL v16 = 1;
      }
      else
      {
        long long v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:1];
        uint64_t v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"historyEventsContainer.service.serviceIdentifier", self->_serviceIdentifier];

        id v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        uint64_t v42 = v24;
        v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
        long long v41 = v23;
        uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
        BOOL v16 = [(IRStore *)self batchDeleteObjectsWithEntityName:v26 byAndPredicates:v27 sortDescriptors:v28 andLimit:v18];

        BOOL v11 = (void *)v24;
      }
    }

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

uint64_t __44__IRServiceStore_addHistoryEvent_withLimit___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v5 = +[IRHistoryEventMO historyEventMOWithhistoryEventDO:v3 historyEventsContainerMO:v2 inManagedObjectContext:v4];
  [v2 addHistoryEventsObject:v5];

  uint64_t result = [*(id *)(a1 + 48) commitChangesToStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)updateCandidate:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"candidatesContainer.service.serviceIdentifier", self->_serviceIdentifier];
  id v6 = (void *)MEMORY[0x263F08A98];
  id v7 = [v4 candidateIdentifier];
  uint64_t v8 = [v6 predicateWithFormat:@"%K = %@", @"candidateIdentifier", v7];

  id v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  v25[0] = v5;
  v25[1] = v8;
  BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  uint64_t v12 = [(IRStore *)self fetchManagedObjectWithEntityName:v10 byAndPredicates:v11 sortDescriptors:0 andLimit:0];

  if (v12)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v13 = [(IRStore *)self managedObjectContext];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __34__IRServiceStore_updateCandidate___block_invoke;
    v16[3] = &unk_2653A0920;
    id v17 = v12;
    id v18 = v4;
    v19 = self;
    uint64_t v20 = &v21;
    [v13 performBlockAndWait:v16];

    BOOL v14 = *((unsigned char *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __34__IRServiceStore_updateCandidate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  +[IRCandidateMO setPropertiesOfCandidateMO:v2 withCandidate:v3 managedObjectContext:v4];

  uint64_t result = [*(id *)(a1 + 48) commitChangesToStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)updateMiloServiceWithMiloUuidString:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = __Block_byref_object_copy__6;
  id v25 = __Block_byref_object_dispose__6;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v27[0] = v5;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  id v26 = [(IRStore *)self fetchManagedObjectWithEntityName:v7 byAndPredicates:v8 sortDescriptors:0 andLimit:0];

  if (v22[5])
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    id v9 = [(IRStore *)self managedObjectContext];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __54__IRServiceStore_updateMiloServiceWithMiloUuidString___block_invoke;
    v12[3] = &unk_2653A0948;
    id v15 = &v21;
    BOOL v16 = &v17;
    id v13 = v4;
    BOOL v14 = self;
    [v9 performBlockAndWait:v12];

    BOOL v10 = *((unsigned char *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v10;
}

uint64_t __54__IRServiceStore_updateMiloServiceWithMiloUuidString___block_invoke(uint64_t a1)
{
  +[IRMiLoServiceMO setPropertiesOfMiLoServiceMO:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withMiLoServiceUuidString:*(void *)(a1 + 32)];
  uint64_t result = [*(id *)(a1 + 40) commitChangesToStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)injectStatisticsRelationship
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", self->_serviceIdentifier];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v24[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  id v7 = [(IRStore *)self fetchManagedObjectWithEntityName:v5 byAndPredicates:v6 sortDescriptors:0 andLimit:0];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceIdentifier", self->_serviceIdentifier];

    BOOL v10 = (objc_class *)objc_opt_class();
    BOOL v11 = NSStringFromClass(v10);
    uint64_t v23 = v9;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    id v13 = [(IRStore *)self fetchManagedObjectWithEntityName:v11 byAndPredicates:v12 sortDescriptors:0 andLimit:0];

    if (v13)
    {
      uint64_t v19 = 0;
      char v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      BOOL v14 = [(IRStore *)self managedObjectContext];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __46__IRServiceStore_injectStatisticsRelationship__block_invoke;
      v16[3] = &unk_2653A08F8;
      void v16[4] = self;
      id v17 = v13;
      id v18 = &v19;
      [v14 performBlockAndWait:v16];

      BOOL v8 = *((unsigned char *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      BOOL v8 = 0;
    }

    uint64_t v3 = (void *)v9;
  }

  return v8;
}

void __46__IRServiceStore_injectStatisticsRelationship__block_invoke(uint64_t a1)
{
  uint64_t v2 = [IRStatisticsMO alloc];
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [(IRStatisticsMO *)v2 initWithContext:v3];

  [(IRStatisticsMO *)v4 setService:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setStatistics:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) commitChangesToStore];
}

- (BOOL)deleteService
{
  uint64_t v2 = self;
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"serviceIdentifier", self->_serviceIdentifier];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v8[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  LOBYTE(v2) = [(IRStore *)v2 batchDeleteObjectsWithEntityName:v5 byAndPredicates:v6 sortDescriptors:0 andLimit:0];

  return (char)v2;
}

- (BOOL)deleteCandidates:(id)a3
{
  uint64_t v3 = self;
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A98];
  serviceIdentifier = self->_serviceIdentifier;
  id v6 = a3;
  id v7 = [v4 predicateWithFormat:@"%K = %@", @"candidatesContainer.service.serviceIdentifier", serviceIdentifier];
  BOOL v8 = (void *)MEMORY[0x263F08A98];
  uint64_t v9 = [v6 compactMap:&__block_literal_global_16];

  BOOL v10 = [v9 allObjects];
  BOOL v11 = [v8 predicateWithFormat:@"%K IN %@", @"candidateIdentifier", v10];

  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  v16[0] = v7;
  v16[1] = v11;
  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  LOBYTE(v3) = [(IRStore *)v3 batchDeleteObjectsWithEntityName:v13 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

  return (char)v3;
}

uint64_t __35__IRServiceStore_deleteCandidates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 candidateIdentifier];
}

- (BOOL)cleanupWithDate:(id)a3 dateIntervalOfMiLoPredictionsToDiscard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IRServiceStore *)self _cleanupCandidatesWithDate:v6]
    && [(IRServiceStore *)self _cleanupHistoryEventsWithDate:v6]
    && [(IRServiceStore *)self _cleanupReplayEventsWithDate:v6]
    && [(IRServiceStore *)self _cleanupTrashedHistoryEvents]
    && [(IRServiceStore *)self _cleanupNotAirplayCandidates]
    && (!v7
     || [(IRServiceStore *)self _cleanupPredictionEventsInDateInterval:v7]);

  return v8;
}

- (BOOL)_cleanupCandidatesWithDate:(id)a3
{
  uint64_t v3 = self;
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A98];
  serviceIdentifier = self->_serviceIdentifier;
  id v6 = a3;
  id v7 = [v4 predicateWithFormat:@"%K = %@", @"candidatesContainer.service.serviceIdentifier", serviceIdentifier];
  BOOL v8 = (void *)MEMORY[0x263F08A98];
  uint64_t v9 = +[IRPreferences shared];
  BOOL v10 = [v9 dbCleanupXPCActivityDeleteCandidatesThreshold];
  BOOL v11 = [v8 predicateWithFormat:@"(%@ - %K) > %@", v6, @"lastSeenDate", v10];

  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  v16[0] = v7;
  v16[1] = v11;
  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  LOBYTE(v3) = [(IRStore *)v3 batchDeleteObjectsWithEntityName:v13 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

  return (char)v3;
}

- (BOOL)_cleanupHistoryEventsWithDate:(id)a3
{
  uint64_t v3 = self;
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A98];
  serviceIdentifier = self->_serviceIdentifier;
  id v6 = a3;
  id v7 = [v4 predicateWithFormat:@"%K = %@", @"historyEventsContainer.service.serviceIdentifier", serviceIdentifier];
  BOOL v8 = (void *)MEMORY[0x263F08A98];
  uint64_t v9 = +[IRPreferences shared];
  BOOL v10 = [v9 dbCleanupXPCActivityDeleteHistoryEventsThreshold];
  BOOL v11 = [v8 predicateWithFormat:@"(%@ - %K) > %@", v6, @"date", v10];

  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  v16[0] = v7;
  v16[1] = v11;
  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  LOBYTE(v3) = [(IRStore *)v3 batchDeleteObjectsWithEntityName:v13 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

  return (char)v3;
}

- (BOOL)_cleanupReplayEventsWithDate:(id)a3
{
  uint64_t v3 = self;
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A98];
  serviceIdentifier = self->_serviceIdentifier;
  id v6 = a3;
  id v7 = [v4 predicateWithFormat:@"%K = %@", @"replayEventsContainer.service.serviceIdentifier", serviceIdentifier];
  BOOL v8 = (void *)MEMORY[0x263F08A98];
  uint64_t v9 = +[IRPreferences shared];
  BOOL v10 = [v9 dbCleanupXPCActivityDeleteReplayEventsThreshold];
  BOOL v11 = [v8 predicateWithFormat:@"(%@ - %K) > %@", v6, @"date", v10];

  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  v16[0] = v7;
  v16[1] = v11;
  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  LOBYTE(v3) = [(IRStore *)v3 batchDeleteObjectsWithEntityName:v13 byAndPredicates:v14 sortDescriptors:0 andLimit:0];

  return (char)v3;
}

- (BOOL)_cleanupTrashedHistoryEvents
{
  uint64_t v2 = self;
  void v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"historyEventsContainer.service.serviceIdentifier", self->_serviceIdentifier];
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"candidateIdenfifier", 0];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v9[0] = v3;
  v9[1] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  LOBYTE(v2) = [(IRStore *)v2 batchDeleteObjectsWithEntityName:v6 byAndPredicates:v7 sortDescriptors:0 andLimit:0];

  return (char)v2;
}

- (BOOL)_cleanupNotAirplayCandidates
{
  uint64_t v3 = [(IRServiceStore *)self fetchCandidatesContainer];
  id v4 = [v3 candidates];
  uint64_t v5 = [v4 allWhere:&__block_literal_global_90];

  if ([v5 count]) {
    BOOL v6 = [(IRServiceStore *)self deleteCandidates:v5];
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

uint64_t __46__IRServiceStore__cleanupNotAirplayCandidates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsAirPlayOrUnknownAVODTarget] ^ 1;
}

- (BOOL)_cleanupPredictionEventsInDateInterval:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"historyEvent.historyEventsContainer.service.serviceIdentifier", self->_serviceIdentifier];
  BOOL v6 = (void *)MEMORY[0x263F08A98];
  id v7 = [v4 startDate];
  BOOL v8 = [v4 endDate];
  uint64_t v9 = [v6 predicateWithFormat:@"%K >= %@ && %K <= %@", @"historyEvent.date", v7, @"historyEvent.date", v8];

  BOOL v10 = (objc_class *)objc_opt_class();
  BOOL v11 = NSStringFromClass(v10);
  v28[0] = v5;
  v28[1] = v9;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  id v13 = [(IRStore *)self fetchManagedObjectsWithEntityName:v11 byAndPredicates:v12 sortDescriptors:0 andLimit:0];

  BOOL v14 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v15 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    BOOL v16 = NSNumber;
    id v17 = v15;
    id v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "#service-store, ";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v27 = v18;
    _os_log_impl(&dword_25418E000, v17, OS_LOG_TYPE_INFO, "%s[%@], Found %@ events to mark as discarded events", buf, 0x20u);
  }
  if (v13 && [v13 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v27) = 0;
    uint64_t v19 = [(IRStore *)self managedObjectContext];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __57__IRServiceStore__cleanupPredictionEventsInDateInterval___block_invoke;
    v22[3] = &unk_2653A0998;
    char v24 = self;
    id v25 = buf;
    id v23 = v13;
    [v19 performBlockAndWait:v22];

    BOOL v20 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

uint64_t __57__IRServiceStore__cleanupPredictionEventsInDateInterval___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "setLabel:", 0, (void)v9);
        [v7 setPredictionId:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t result = [*(id *)(a1 + 40) commitChangesToStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
}

- (id)getReplayEventDescriptors
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F08A98];
  uint64_t v4 = [(IRServiceStore *)self serviceIdentifier];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"service.serviceIdentifier", v4];

  BOOL v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v26[0] = v5;
  BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  long long v9 = [(IRStore *)self fetchManagedObjectWithEntityName:v7 byAndPredicates:v8 sortDescriptors:0 andLimit:0];

  if (v9)
  {
    uint64_t v19 = 0;
    BOOL v20 = &v19;
    uint64_t v21 = 0x3032000000;
    char v22 = __Block_byref_object_copy__7;
    id v23 = __Block_byref_object_dispose__7;
    id v24 = (id)objc_opt_new();
    long long v10 = [(IRStore *)self managedObjectContext];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke;
    void v16[3] = &unk_2653A0768;
    id v17 = v9;
    id v18 = &v19;
    [v10 performBlockAndWait:v16];

    long long v11 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
    long long v12 = (void *)v20[5];
    id v25 = v11;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [v12 sortUsingDescriptors:v13];

    uint64_t v14 = (void *)[(id)v20[5] copy];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) replayEvent];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke_2;
  v3[3] = &unk_2653A09C0;
  void v3[4] = *(void *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [IRReplayEventDescriptor alloc];
  uint64_t v5 = [v3 date];
  BOOL v6 = [v3 contextChangeReason];
  id v7 = [v3 systemState];

  BOOL v8 = [v7 convert];
  long long v9 = [(IRReplayEventDescriptor *)v4 initWithDate:v5 withContextChangeReason:v6 withSystemState:v8];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v9];
}

void __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_cold_1(uint64_t a1, void **a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = NSNumber;
  uint64_t v5 = *a2;
  BOOL v6 = a3;
  id v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  int v8 = 138412546;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  long long v11 = v7;
  _os_log_error_impl(&dword_25418E000, v6, OS_LOG_TYPE_ERROR, "#service-store, [ErrorId - Duplicate Services] Identified multiple service with service identifier:%@, num services identified: %@", (uint8_t *)&v8, 0x16u);
}

@end