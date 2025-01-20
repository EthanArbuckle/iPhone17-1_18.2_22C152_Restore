@interface HKLocationFetcher
- (BOOL)_routesAreSmoothed:(id)a3;
- (HKAnchoredObjectQuery)routesQuery;
- (HKHealthStore)healthStore;
- (HKLocationFetcher)initWithHealthStore:(id)a3;
- (_HKLocationShifter)shifter;
- (_HKWorkoutRouteStore)routesStore;
- (id)_workoutRoutesQueryForWorkout:(id)a3 withUpdateHandler:(id)a4;
- (void)_handleAndShiftLocations:(id)a3 forWorkout:(id)a4 withSamplesHandler:(id)a5;
- (void)dealloc;
- (void)fetchLocationsFromWorkout:(id)a3 applyThreshold:(BOOL)a4 withSamplesHandler:(id)a5;
- (void)fetchLocationsFromWorkout:(id)a3 withSamplesHandler:(id)a4;
- (void)fetchLocationsFromWorkout:(id)a3 workoutActivity:(id)a4 samplesHandler:(id)a5;
- (void)fetchRoutesFromWorkout:(id)a3 withUpdateHandler:(id)a4;
- (void)setHealthStore:(id)a3;
- (void)setRoutesQuery:(id)a3;
- (void)setRoutesStore:(id)a3;
- (void)setShifter:(id)a3;
@end

@implementation HKLocationFetcher

- (HKLocationFetcher)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKLocationFetcher;
  v6 = [(HKLocationFetcher *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F2B9A8]) initWithHealthStore:v5];
    routesStore = v7->_routesStore;
    v7->_routesStore = (_HKWorkoutRouteStore *)v8;
  }
  return v7;
}

- (void)dealloc
{
  if (self->_routesQuery) {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
  }
  v3.receiver = self;
  v3.super_class = (Class)HKLocationFetcher;
  [(HKLocationFetcher *)&v3 dealloc];
}

- (_HKLocationShifter)shifter
{
  shifter = self->_shifter;
  if (!shifter)
  {
    v4 = (_HKLocationShifter *)objc_alloc_init(MEMORY[0x1E4F2B908]);
    id v5 = self->_shifter;
    self->_shifter = v4;

    shifter = self->_shifter;
  }
  return shifter;
}

- (void)fetchLocationsFromWorkout:(id)a3 withSamplesHandler:(id)a4
{
}

- (void)fetchLocationsFromWorkout:(id)a3 applyThreshold:(BOOL)a4 withSamplesHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = v10;
    v12 = [v8 startDate];
    uint64_t v13 = [v8 workoutActivityType];
    v14 = [v8 UUID];
    *(_DWORD *)buf = 138412802;
    v23 = v12;
    __int16 v24 = 2048;
    uint64_t v25 = v13;
    __int16 v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1E0B26000, v11, OS_LOG_TYPE_DEFAULT, "[routes] Request route on day %@ for workout of type %zd %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke;
  v17[3] = &unk_1E6D54FA0;
  id v15 = v9;
  id v19 = v15;
  objc_copyWeak(&v20, (id *)buf);
  id v16 = v8;
  id v18 = v16;
  BOOL v21 = a4;
  [(HKLocationFetcher *)self fetchRoutesFromWorkout:v16 withUpdateHandler:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = [WeakRetained routesStore];
    [v7 setWorkoutRoutes:v5];

    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    id v9 = [v8 routesStore];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke_2;
    v10[3] = &unk_1E6D54F78;
    id v11 = *(id *)(a1 + 32);
    char v14 = a3;
    char v15 = *(unsigned char *)(a1 + 56);
    objc_copyWeak(&v13, (id *)(a1 + 48));
    id v12 = *(id *)(a1 + 40);
    [v9 fetchAllLocationsWithCompletion:v10];

    objc_destroyWeak(&v13);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__HKLocationFetcher_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [[HKLocationReadings alloc] initWithLocations:v3 workout:*(void *)(a1 + 32) isSmoothed:*(unsigned __int8 *)(a1 + 56)];

  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Fetched location readings %@", (uint8_t *)&v7, 0xCu);
  }
  if (*(unsigned char *)(a1 + 57)
    && (!_shouldShowMapRoute(v4, 0) || [(HKLocationReadings *)v4 count] < 1))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _handleAndShiftLocations:v4 forWorkout:*(void *)(a1 + 32) withSamplesHandler:*(void *)(a1 + 40)];
  }
}

- (void)fetchLocationsFromWorkout:(id)a3 workoutActivity:(id)a4 samplesHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v12 = [v9 startDate];
  id v13 = [v9 endDate];
  char v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];

  _HKInitializeLogging();
  char v15 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    v17 = [v8 startDate];
    id v18 = [v9 workoutConfiguration];
    uint64_t v19 = [v18 activityType];
    id v20 = [v8 UUID];
    *(_DWORD *)buf = 138413058;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v14;
    __int16 v35 = 2048;
    uint64_t v36 = v19;
    __int16 v37 = 2114;
    v38 = v20;
    _os_log_impl(&dword_1E0B26000, v16, OS_LOG_TYPE_DEFAULT, "[routes] Request route on day %@ (interval %@) for activity of type %zd and workout %{public}@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke;
  v25[3] = &unk_1E6D55018;
  objc_copyWeak(&v30, (id *)buf);
  id v21 = v10;
  id v29 = v21;
  id v22 = v8;
  id v26 = v22;
  id v23 = v9;
  id v27 = v23;
  id v24 = v14;
  id v28 = v24;
  [(HKLocationFetcher *)self fetchRoutesFromWorkout:v22 withUpdateHandler:v25];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

void __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v24 = v5;
  if (WeakRetained && [v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = __Block_byref_object_copy__17;
    v55[4] = __Block_byref_object_dispose__17;
    id v56 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    uint64_t v54 = 0;
    uint64_t v54 = [v5 count];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_285;
    aBlock[3] = &unk_1E6D54FC8;
    v50 = v53;
    id v7 = v5;
    id v44 = v7;
    id v25 = v6;
    id v45 = v25;
    id v8 = *(id *)(a1 + 32);
    char v52 = a3;
    id v46 = v8;
    v51 = v55;
    id v47 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 56);
    id v48 = WeakRetained;
    id v49 = v9;
    id v10 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v38 = 0;
    uint64_t v39 = (os_unfair_lock_s *)&v38;
    uint64_t v40 = 0x2810000000;
    v41 = &unk_1E0F50A5E;
    int v42 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v35;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(obj);
          }
          char v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
          id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
          id v16 = [v14 startDate];
          v17 = [v14 endDate];
          id v18 = (void *)[v15 initWithStartDate:v16 endDate:v17];

          uint64_t v19 = [v18 intersectionWithDateInterval:*(void *)(a1 + 48)];
          [v19 duration];
          if (v20 == 0.0)
          {
            os_unfair_lock_lock(v39 + 8);
            v10[2](v10);
            os_unfair_lock_unlock(v39 + 8);
          }
          else
          {
            id v21 = objc_alloc(MEMORY[0x1E4F2B7B8]);
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_2;
            v28[3] = &unk_1E6D54FF0;
            v32 = &v38;
            id v29 = v25;
            id v30 = v14;
            __int16 v33 = v55;
            v31 = v10;
            id v22 = (void *)[v21 initWithRoute:v14 dateInterval:v19 dataHandler:v28];
            id v23 = [WeakRetained healthStore];
            [v23 executeQuery:v22];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v57 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_285(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!--*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(a1 + 40);
          id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v7), "UUID", (void)v13);
          id v10 = [v8 objectForKeyedSubscript:v9];
          [v2 addObjectsFromArray:v10];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    uint64_t v11 = [[HKLocationReadings alloc] initWithLocations:v2 workout:*(void *)(a1 + 48) isSmoothed:*(unsigned __int8 *)(a1 + 96)];
    uint64_t v12 = v11;
    if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)
      && [(HKLocationReadings *)v11 count]
      && (_shouldShowMapRoute(v12, *(void **)(a1 + 56)) & 1) != 0)
    {
      [*(id *)(a1 + 64) _handleAndShiftLocations:v12 forWorkout:*(void *)(a1 + 48) withSamplesHandler:*(void *)(a1 + 72)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
}

void __78__HKLocationFetcher_fetchLocationsFromWorkout_workoutActivity_samplesHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v16 = a3;
  id v8 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  if (v16)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) UUID];
    id v11 = [v9 objectForKeyedSubscript:v10];

    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v12 = *(void **)(a1 + 32);
      long long v13 = [*(id *)(a1 + 40) UUID];
      [v12 setObject:v11 forKeyedSubscript:v13];
    }
    [v11 addObjectsFromArray:v16];
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = v8;
    id v11 = *(id *)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }

  if (a4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
}

- (BOOL)_routesAreSmoothed:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x1E4F2A1F8];
    uint64_t v8 = *MEMORY[0x1E4F2BC28];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "metadata", (void)v20);
        uint64_t v12 = [v11 objectForKeyedSubscript:v7];
        uint64_t v13 = [v12 integerValue];

        uint64_t v14 = [v10 metadata];
        id v15 = [v14 objectForKeyedSubscript:v8];
        int v16 = [v15 BOOLValue];

        if (v13 <= 1 && v16 == 0)
        {
          BOOL v18 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_14:

  return v18;
}

- (void)_handleAndShiftLocations:(id)a3 forWorkout:(id)a4 withSamplesHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F2B908];
  uint64_t v12 = [v8 allValidLocations];
  LOBYTE(v11) = [v11 isShiftRequiredForLocations:v12];

  if (v11)
  {
    uint64_t v13 = [(HKLocationFetcher *)self shifter];
    uint64_t v14 = [v8 allValidLocations];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__HKLocationFetcher__handleAndShiftLocations_forWorkout_withSamplesHandler___block_invoke;
    v15[3] = &unk_1E6D54928;
    id v16 = v9;
    id v17 = v8;
    id v18 = v10;
    [v13 shiftLocations:v14 withCompletion:v15];
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v8);
  }
}

void __76__HKLocationFetcher__handleAndShiftLocations_forWorkout_withSamplesHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[HKLocationReadings initWithLocations:workout:isSmoothed:]([HKLocationReadings alloc], "initWithLocations:workout:isSmoothed:", v3, *(void *)(a1 + 32), [*(id *)(a1 + 40) isSmoothed]);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchRoutesFromWorkout:(id)a3 withUpdateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKLocationFetcher *)self _workoutRoutesQueryForWorkout:v6 withUpdateHandler:v7];
  routesQuery = self->_routesQuery;
  self->_routesQuery = v8;

  objc_initWeak(&location, self);
  id v10 = self->_routesQuery;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke;
  id v16 = &unk_1E6D55040;
  id v11 = v7;
  id v18 = v11;
  id v12 = v6;
  id v17 = v12;
  objc_copyWeak(&v19, &location);
  [(HKAnchoredObjectQuery *)v10 setUpdateHandler:&v13];
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_routesQuery, v13, v14, v15, v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  _HKInitializeLogging();
  if (v7)
  {
    id v8 = *MEMORY[0x1E4F29EE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EE8], OS_LOG_TYPE_ERROR)) {
      __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke_cold_1((uint64_t)v7, v8);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 32);
      id v11 = v9;
      id v12 = [v10 UUID];
      int v18 = 138543362;
      id v19 = v12;
      _os_log_impl(&dword_1E0B26000, v11, OS_LOG_TYPE_DEFAULT, "[routes] Update called; run location series query for workout %{public}@",
        (uint8_t *)&v18,
        0xCu);
    }
    uint64_t v13 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v15 = [WeakRetained _workoutRoutesQueryForWorkout:*(void *)(a1 + 32) withUpdateHandler:*(void *)(a1 + 40)];

    id v16 = objc_loadWeakRetained(v13);
    id v17 = [v16 healthStore];
    [v17 executeQuery:v15];
  }
}

- (id)_workoutRoutesQueryForWorkout:(id)a3 withUpdateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F2B3C0] predicateForObjectsFromWorkout:v6];
  id v9 = [MEMORY[0x1E4F2B448] dataTypeWithCode:102];
  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x1E4F2ABF0]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke;
  v15[3] = &unk_1E6D55068;
  id v11 = v7;
  id v17 = v11;
  objc_copyWeak(&v18, &location);
  id v12 = v6;
  id v16 = v12;
  uint64_t v13 = (void *)[v10 initWithType:v9 predicate:v8 anchor:0 limit:0 resultsHandler:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  if (v9)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29EE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EE8], OS_LOG_TYPE_ERROR)) {
      __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke_cold_1((uint64_t)v9, v10);
    }
    goto LABEL_4;
  }
  if (![v8 count])
  {
LABEL_4:
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v13 = [WeakRetained routesStore];
  char v14 = [v13 containsSameValuesAs:v8];

  if (v14) {
    goto LABEL_6;
  }
  _HKInitializeLogging();
  id v15 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    uint64_t v17 = [v8 count];
    id v18 = [v8 firstObject];
    id v19 = [v18 UUID];
    uint64_t v20 = [*(id *)(a1 + 32) UUID];
    int v24 = 134218498;
    uint64_t v25 = v17;
    __int16 v26 = 2112;
    id v27 = v19;
    __int16 v28 = 2114;
    id v29 = v20;
    _os_log_impl(&dword_1E0B26000, v16, OS_LOG_TYPE_DEFAULT, "[routes] Fetched %zd new samples (first: %@) for workout %{public}@", (uint8_t *)&v24, 0x20u);
  }
  long long v21 = [*(id *)(a1 + 32) sourceRevision];
  long long v22 = [v21 source];
  [v22 _isAppleWatch];

  id v23 = objc_loadWeakRetained((id *)(a1 + 48));
  [v23 _routesAreSmoothed:v8];

  id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
  v11();
LABEL_6:
}

- (void)setShifter:(id)a3
{
}

- (_HKWorkoutRouteStore)routesStore
{
  return self->_routesStore;
}

- (void)setRoutesStore:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKAnchoredObjectQuery)routesQuery
{
  return self->_routesQuery;
}

- (void)setRoutesQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_routesStore, 0);
  objc_storeStrong((id *)&self->_shifter, 0);
}

void __62__HKLocationFetcher_fetchRoutesFromWorkout_withUpdateHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "[routes] An error occurred while updating series samples for workout. %@", (uint8_t *)&v2, 0xCu);
}

void __69__HKLocationFetcher__workoutRoutesQueryForWorkout_withUpdateHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "[routes] Could not fetch series samples for workout. %@", (uint8_t *)&v2, 0xCu);
}

@end