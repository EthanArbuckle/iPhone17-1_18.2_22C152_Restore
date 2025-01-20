@interface _HKWorkoutRouteStore
- (BOOL)containsSameValuesAs:(id)a3;
- (_HKWorkoutRouteStore)init;
- (_HKWorkoutRouteStore)initWithHealthStore:(id)a3;
- (id)_queue_locations;
- (id)samples;
- (void)_fetchAllLocationsFromSeriesSample:(id)a3;
- (void)_queue_addWorkoutRoutes:(id)a3;
- (void)_queue_checkAndReturnIfLocationsLoaded;
- (void)_setLocations:(id)a3 forUUID:(id)a4;
- (void)addWorkoutRoutes:(id)a3;
- (void)fetchAllLocationsWithCompletion:(id)a3;
- (void)setWorkoutRoutes:(id)a3;
@end

@implementation _HKWorkoutRouteStore

- (_HKWorkoutRouteStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)_HKWorkoutRouteStore;
  v2 = [(_HKWorkoutRouteStore *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = HKCreateSerialDispatchQueue(v2, 0);
    locationQueue = v3->_locationQueue;
    v3->_locationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    series = v3->_series;
    v3->_series = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (BOOL)containsSameValuesAs:(id)a3
{
  id v4 = a3;
  v5 = [(_HKWorkoutRouteStore *)self samples];
  uint64_t v6 = [v5 count];
  if (v6 == [v4 count])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
    char v9 = [v7 isEqualToSet:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (_HKWorkoutRouteStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(_HKWorkoutRouteStore *)self init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    locations = v6->_locations;
    v6->_locations = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_healthStore, a3);
  }

  return v6;
}

- (void)_setLocations:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  locationQueue = self->_locationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___HKWorkoutRouteStore__setLocations_forUUID___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(locationQueue, block);
}

- (void)_queue_checkAndReturnIfLocationsLoaded
{
  int64_t v2 = self->_loadingCount - 1;
  self->_loadingCount = v2;
  if (!v2 && self->_loadingCompletionBlock)
  {
    id v4 = [(_HKWorkoutRouteStore *)self _queue_locations];
    if ([v4 count]) {
      (*((void (**)(void))self->_loadingCompletionBlock + 2))();
    }
  }
}

- (void)setWorkoutRoutes:(id)a3
{
  id v4 = a3;
  locationQueue = self->_locationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41___HKWorkoutRouteStore_setWorkoutRoutes___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(locationQueue, v7);
}

- (void)addWorkoutRoutes:(id)a3
{
  id v4 = a3;
  locationQueue = self->_locationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41___HKWorkoutRouteStore_addWorkoutRoutes___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(locationQueue, v7);
}

- (void)_queue_addWorkoutRoutes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v6 = 138412290;
    long long v19 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        series = self->_series;
        id v12 = objc_msgSend(v10, "UUID", v19);
        id v13 = [(NSMutableDictionary *)series objectForKeyedSubscript:v12];

        if (!v13)
        {
          _HKInitializeLogging();
          v14 = (void *)HKLogWorkouts;
          if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            v16 = [v10 UUID];
            *(_DWORD *)buf = v19;
            v25 = v16;
            _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, "[routes] Add routes %@ to workout route store.", buf, 0xCu);
          }
          v17 = self->_series;
          v18 = [v10 UUID];
          [(NSMutableDictionary *)v17 setObject:v10 forKey:v18];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)fetchAllLocationsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_HKWorkoutRouteStore *)self samples];
  self->_loadingCount = [v5 count];
  long long v6 = _Block_copy(v4);
  id loadingCompletionBlock = self->_loadingCompletionBlock;
  self->_id loadingCompletionBlock = v6;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
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
        -[_HKWorkoutRouteStore _fetchAllLocationsFromSeriesSample:](self, "_fetchAllLocationsFromSeriesSample:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_fetchAllLocationsFromSeriesSample:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v6 = [HKWorkoutRouteQuery alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke;
  v10[3] = &unk_1E58C9788;
  id v11 = v4;
  id v12 = v5;
  long long v13 = self;
  id v7 = v5;
  id v8 = v4;
  uint64_t v9 = [(HKWorkoutRouteQuery *)v6 initWithRoute:v8 dataHandler:v10];
  [(HKHealthStore *)self->_healthStore executeQuery:v9];
}

- (id)samples
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__60;
  uint64_t v10 = __Block_byref_object_dispose__60;
  id v11 = 0;
  locationQueue = self->_locationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31___HKWorkoutRouteStore_samples__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(locationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_queue_locations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_series allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_139];

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        locations = self->_locations;
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "UUID", (void)v15);
        long long v13 = [(NSMutableDictionary *)locations objectForKeyedSubscript:v12];

        [v5 addObjectsFromArray:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong(&self->_loadingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_locationQueue, 0);
  objc_storeStrong((id *)&self->_series, 0);

  objc_storeStrong((id *)&self->_locations, 0);
}

@end