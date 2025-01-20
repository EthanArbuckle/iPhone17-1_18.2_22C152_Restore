@interface FIUIWorkoutDataProvider
- (BOOL)hasWorkouts;
- (FIUIWorkoutDataProvider)init;
- (FIUIWorkoutDataProvider)initWithHealthStore:(id)a3;
- (FIUIWorkoutDataProvider)initWithHealthStore:(id)a3 shouldSortAscending:(BOOL)a4;
- (id)allWorkouts;
- (id)workoutsForDay:(id)a3;
- (void)_commonInit;
- (void)_fetchAllWorkoutsFromDate:(id)a3;
- (void)_handleAddedSamples:(id)a3;
- (void)_handleRemovedObjects:(id)a3;
- (void)_retryQuery:(id)a3;
- (void)_retryQueryOnDidBecomeActiveWithDate:(id)a3;
- (void)_runUpdateHandlers;
- (void)_timeZoneDidChange:(id)a3;
- (void)addUpdateHandler:(id)a3;
- (void)dealloc;
- (void)startFetchingFromDate:(id)a3;
- (void)stopFetching;
@end

@implementation FIUIWorkoutDataProvider

- (FIUIWorkoutDataProvider)initWithHealthStore:(id)a3
{
  return [(FIUIWorkoutDataProvider *)self initWithHealthStore:a3 shouldSortAscending:1];
}

- (FIUIWorkoutDataProvider)initWithHealthStore:(id)a3 shouldSortAscending:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIUIWorkoutDataProvider;
  v8 = [(FIUIWorkoutDataProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_shouldSortAscending = a4;
    [(FIUIWorkoutDataProvider *)v9 _commonInit];
  }

  return v9;
}

- (FIUIWorkoutDataProvider)init
{
  return 0;
}

- (void)_commonInit
{
  if (!self->_healthStore)
  {
    v3 = (HKHealthStore *)objc_alloc_init(MEMORY[0x263F0A410]);
    healthStore = self->_healthStore;
    self->_healthStore = v3;
  }
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  updateHandlers = self->_updateHandlers;
  self->_updateHandlers = v5;

  id v7 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  gregorianCalendar = self->_gregorianCalendar;
  self->_gregorianCalendar = v7;

  v9 = self->_gregorianCalendar;
  v10 = [MEMORY[0x263EFFA18] systemTimeZone];
  [(NSCalendar *)v9 setTimeZone:v10];

  objc_super v11 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v11;

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel__timeZoneDidChange_ name:*MEMORY[0x263EFF5D0] object:0];

  self->_lock._os_unfair_lock_opaque = 0;
}

- (void)_timeZoneDidChange:(id)a3
{
  gregorianCalendar = self->_gregorianCalendar;
  objc_msgSend(MEMORY[0x263EFFA18], "systemTimeZone", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSCalendar *)gregorianCalendar setTimeZone:v4];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FIUIWorkoutDataProvider;
  [(FIUIWorkoutDataProvider *)&v4 dealloc];
}

- (BOOL)hasWorkouts
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableDictionary *)v2->_workoutsByDay count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)workoutsForDay:(id)a3
{
  uint64_t v4 = _HKCacheIndexFromDateComponents();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  workoutsByDay = self->_workoutsByDay;
  id v7 = [NSNumber numberWithLongLong:v4];
  v8 = [(NSMutableDictionary *)workoutsByDay objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
  v9 = [v8 allSamples];

  return v9;
}

- (id)allWorkouts
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableDictionary count](self->_workoutsByDay, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(NSMutableDictionary *)self->_workoutsByDay allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_super v11 = [(NSMutableDictionary *)self->_workoutsByDay objectForKeyedSubscript:v10];
        v12 = [v11 allSamples];
        [v4 setObject:v12 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v13 = (void *)[v4 copy];

  return v13;
}

- (void)startFetchingFromDate:(id)a3
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  workoutsByDay = self->_workoutsByDay;
  self->_workoutsByDay = v5;

  os_unfair_lock_unlock(p_lock);
  [(FIUIWorkoutDataProvider *)self stopFetching];
  [(FIUIWorkoutDataProvider *)self _fetchAllWorkoutsFromDate:v7];
}

- (void)stopFetching
{
  if (self->_currentWorkoutAnchoredObjectQuery) {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
  }
}

- (void)_fetchAllWorkoutsFromDate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF910] date];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke;
  aBlock[3] = &unk_2644A85D0;
  objc_copyWeak(&v22, &location);
  id v6 = v4;
  id v20 = v6;
  id v7 = v5;
  id v21 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_290;
  v16[3] = &unk_2644A85F8;
  objc_copyWeak(&v18, &location);
  id v9 = v6;
  id v17 = v9;
  uint64_t v10 = _Block_copy(v16);
  objc_super v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"endDate >= %@", v9];
  id v12 = objc_alloc(MEMORY[0x263F0A0C8]);
  v13 = [MEMORY[0x263F0A598] workoutType];
  v14 = (HKAnchoredObjectQuery *)[v12 initWithType:v13 predicate:v11 anchor:0 limit:0 resultsHandler:v8];
  currentWorkoutAnchoredObjectQuery = self->_currentWorkoutAnchoredObjectQuery;
  self->_currentWorkoutAnchoredObjectQuery = v14;

  [(HKAnchoredObjectQuery *)self->_currentWorkoutAnchoredObjectQuery setUpdateHandler:v10];
  [(HKHealthStore *)self->_healthStore executeQuery:self->_currentWorkoutAnchoredObjectQuery];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke(id *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2;
  block[3] = &unk_2644A85A8;
  objc_copyWeak(&v17, a1 + 6);
  id v13 = v9;
  id v14 = a1[4];
  id v15 = v8;
  id v16 = a1[5];
  id v10 = v8;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v17);
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    _HKInitializeLogging();
    id v4 = *MEMORY[0x263F098C8];
    v5 = *MEMORY[0x263F098C8];
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2_cold_1((uint64_t *)(a1 + 32), v4);
      }
      [WeakRetained _retryQueryOnDidBecomeActiveWithDate:*(void *)(a1 + 40)];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = NSNumber;
        id v7 = *(void **)(a1 + 48);
        id v8 = v4;
        id v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        id v10 = NSNumber;
        id v11 = [MEMORY[0x263EFF910] date];
        [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
        id v12 = objc_msgSend(v10, "numberWithDouble:");
        int v13 = 138412546;
        id v14 = v9;
        __int16 v15 = 2112;
        id v16 = v12;
        _os_log_impl(&dword_21E433000, v8, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - fetched %@ workouts in %@ seconds", (uint8_t *)&v13, 0x16u);
      }
      if ([*(id *)(a1 + 48) count])
      {
        [WeakRetained _handleAddedSamples:*(void *)(a1 + 48)];
        [WeakRetained _runUpdateHandlers];
      }
    }
  }
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_290(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _HKInitializeLogging();
  int v13 = *MEMORY[0x263F098C8];
  id v14 = *MEMORY[0x263F098C8];
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_290_cold_1((uint64_t)v11, v13);
    }
    [WeakRetained _retryQueryOnDidBecomeActiveWithDate:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = NSNumber;
      id v16 = v13;
      uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      *(_DWORD *)buf = 138412290;
      id v22 = v17;
      _os_log_impl(&dword_21E433000, v16, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - fetched %@ updated workouts", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_291;
    block[3] = &unk_2644A7B40;
    void block[4] = WeakRetained;
    id v19 = v10;
    id v20 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_291(uint64_t result)
{
  if (!*(void *)(result + 32)) {
    return result;
  }
  uint64_t v1 = result;
  if ([*(id *)(result + 40) count])
  {
    [*(id *)(v1 + 32) _handleRemovedObjects:*(void *)(v1 + 40)];
    if (![*(id *)(v1 + 48) count]) {
      goto LABEL_7;
    }
  }
  else
  {
    result = [*(id *)(v1 + 48) count];
    if (!result) {
      return result;
    }
  }
  [*(id *)(v1 + 32) _handleAddedSamples:*(void *)(v1 + 48)];
LABEL_7:
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21E433000, v2, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - workouts did update. Running update handlers", v3, 2u);
  }
  return [*(id *)(v1 + 32) _runUpdateHandlers];
}

- (void)addUpdateHandler:(id)a3
{
  updateHandlers = self->_updateHandlers;
  id v4 = _Block_copy(a3);
  [(NSMutableArray *)updateHandlers addObject:v4];
}

- (void)_runUpdateHandlers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_updateHandlers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_handleAddedSamples:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "sourceRevision", lock);
        id v11 = [v10 productType];
        objc_msgSend(v9, "_setIsWatchWorkout:", objc_msgSend(v11, "containsString:", @"Watch"));

        gregorianCalendar = self->_gregorianCalendar;
        int v13 = [v9 endDate];
        id v14 = [(NSCalendar *)gregorianCalendar hk_activitySummaryDateComponentsFromDate:v13];

        uint64_t v15 = _HKCacheIndexFromDateComponents();
        workoutsByDay = self->_workoutsByDay;
        uint64_t v17 = [NSNumber numberWithLongLong:v15];
        id v18 = [(NSMutableDictionary *)workoutsByDay objectForKeyedSubscript:v17];

        if (!v18)
        {
          id v18 = objc_alloc_init(MEMORY[0x263F0A798]);
          id v19 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"endDate" ascending:self->_shouldSortAscending];
          [v18 setSortDescriptor:v19];

          id v20 = self->_workoutsByDay;
          id v21 = [NSNumber numberWithLongLong:v15];
          [(NSMutableDictionary *)v20 setObject:v18 forKey:v21];
        }
        v29 = v9;
        id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
        [v18 insertSamples:v22];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_handleRemovedObjects:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v22 + 1) + 8 * v10) UUID];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v13 = [(NSMutableDictionary *)self->_workoutsByDay allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v17++) removeSamplesWithUUIDs:v5];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_retryQueryOnDidBecomeActiveWithDate:(id)a3
{
  id v4 = (NSDate *)a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_21E433000, v5, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - will retry query on did become active", v9, 2u);
  }
  retryDate = self->_retryDate;
  self->_retryDate = v4;
  uint64_t v7 = v4;

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__retryQuery_ name:*MEMORY[0x263F83318] object:0];
}

- (void)_retryQuery:(id)a3
{
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E433000, v4, OS_LOG_TYPE_DEFAULT, "FIUIWorkoutDataProvider - did become active; retrying query",
      v6,
      2u);
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F83318] object:0];

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_workoutsByDay removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  [(FIUIWorkoutDataProvider *)self _fetchAllWorkoutsFromDate:self->_retryDate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryDate, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_currentWorkoutAnchoredObjectQuery, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_workoutsByDay, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "Error fetching workouts: %@", (uint8_t *)&v3, 0xCu);
}

void __53__FIUIWorkoutDataProvider__fetchAllWorkoutsFromDate___block_invoke_290_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "Error updating workouts: %@", (uint8_t *)&v2, 0xCu);
}

@end