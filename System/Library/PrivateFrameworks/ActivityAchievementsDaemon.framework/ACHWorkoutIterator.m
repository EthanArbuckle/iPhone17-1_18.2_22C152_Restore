@interface ACHWorkoutIterator
- (ACHWorkoutIterator)initWithHealthStore:(id)a3;
- (ACHWorkoutIterator)initWithHealthStore:(id)a3 batchSize:(unint64_t)a4;
- (HKHealthStore)healthStore;
- (HKSampleIteratorQuery)query;
- (unint64_t)batchSize;
- (void)_runQueryForDateInterval:(id)a3 lastCursor:(id)a4 completion:(id)a5;
- (void)enumerateWorkoutsForDateInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5;
- (void)setBatchSize:(unint64_t)a3;
- (void)setHealthStore:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation ACHWorkoutIterator

- (ACHWorkoutIterator)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHWorkoutIterator;
  v6 = [(ACHWorkoutIterator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_batchSize = 128;
  }

  return v7;
}

- (ACHWorkoutIterator)initWithHealthStore:(id)a3 batchSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHWorkoutIterator;
  v8 = [(ACHWorkoutIterator *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (void)enumerateWorkoutsForDateInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  *(void *)((char *)&v64[1] + 4) = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_super v9 = (void (**)(id, void))a4;
  v31 = (void (**)(id, void))a5;
  v32 = self;
  v10 = [(ACHWorkoutIterator *)self query];

  if (v10)
  {
    objc_super v11 = [(ACHWorkoutIterator *)self healthStore];
    v12 = [(ACHWorkoutIterator *)self query];
    [v11 stopQuery:v12];
  }
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__16;
  v58 = __Block_byref_object_dispose__16;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__16;
  v52 = __Block_byref_object_dispose__16;
  id v53 = 0;
  uint64_t v30 = *MEMORY[0x263F08320];
  do
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__16;
    v46 = __Block_byref_object_dispose__16;
    id v47 = (id)MEMORY[0x263EFFA68];
    uint64_t v14 = v49[5];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __76__ACHWorkoutIterator_enumerateWorkoutsForDateInterval_handler_errorHandler___block_invoke;
    v37[3] = &unk_2645172B0;
    v39 = &v42;
    v40 = &v54;
    v41 = &v48;
    v15 = v13;
    v38 = v15;
    [(ACHWorkoutIterator *)v32 _runQueryForDateInterval:v8 lastCursor:v14 completion:v37];
    dispatch_time_t v16 = dispatch_time(0, 60000000000);
    intptr_t v17 = dispatch_semaphore_wait(v15, v16);
    uint64_t v18 = v55[5];
    BOOL v19 = (v18 | v17) == 0;
    if (v18 | v17)
    {
      if (v17)
      {
        v25 = ACHLogWorkouts();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[ACHWorkoutIterator enumerateWorkoutsForDateInterval:handler:errorHandler:](buf, v64, v25);
        }

        v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v61 = v30;
        v62 = @"Semaphore wait timeout in workout iterator";
        v27 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        uint64_t v28 = [v26 errorWithDomain:@"com.apple.ActivityAchievements.WorkoutIterator" code:10 userInfo:v27];
        v29 = (void *)v55[5];
        v55[5] = v28;

        uint64_t v18 = v55[5];
      }
      v31[2](v31, v18);
    }
    else
    {
      id v20 = v8;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v21 = (id)v43[5];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v60 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v21);
            }
            v9[2](v9, *(void *)(*((void *)&v33 + 1) + 8 * i));
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v60 count:16];
        }
        while (v22);
      }

      id v8 = v20;
    }

    _Block_object_dispose(&v42, 8);
  }
  while (v19 && v49[5]);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

void __76__ACHWorkoutIterator_enumerateWorkoutsForDateInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2) {
    objc_super v9 = a2;
  }
  else {
    objc_super v9 = (void *)MEMORY[0x263EFFA68];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
  id v16 = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v12 = v8;

  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v7;
  id v15 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_runQueryForDateInterval:(id)a3 lastCursor:(id)a4 completion:(id)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v26 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x263F0A668];
  objc_super v11 = [v8 startDate];
  id v12 = [v8 endDate];
  v25 = [v10 predicateForSamplesWithStartDate:v11 endDate:v12 options:1];

  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __69__ACHWorkoutIterator__runQueryForDateInterval_lastCursor_completion___block_invoke;
  v27[3] = &unk_2645172D8;
  objc_copyWeak(&v29, &location);
  id v13 = v9;
  id v28 = v13;
  uint64_t v14 = (void *)MEMORY[0x223C507A0](v27);
  if (v26)
  {
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x263F0A6C8]), "initWithQueryCursor:limit:resultsHandler:", v26, -[ACHWorkoutIterator batchSize](self, "batchSize"), v14);
    [(ACHWorkoutIterator *)self setQuery:v15];
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263F0A678]);
    intptr_t v17 = [MEMORY[0x263F0A6E8] workoutType];
    id v15 = (void *)[v16 initWithSampleType:v17 predicate:v25];

    uint64_t v18 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
    id v19 = objc_alloc(MEMORY[0x263F0A6C8]);
    v32[0] = v15;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    v31 = v18;
    id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    uint64_t v22 = objc_msgSend(v19, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:limit:resultsHandler:", v20, v21, 0, 0, 0, -[ACHWorkoutIterator batchSize](self, "batchSize"), v14);
    [(ACHWorkoutIterator *)self setQuery:v22];
  }
  uint64_t v23 = [(ACHWorkoutIterator *)self healthStore];
  v24 = [(ACHWorkoutIterator *)self query];
  [v23 executeQuery:v24];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __69__ACHWorkoutIterator__runQueryForDateInterval_lastCursor_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = (id *)(a1 + 40);
  id v10 = a5;
  id v11 = a4;
  id v15 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  uint64_t v14 = [WeakRetained healthStore];
  [v14 stopQuery:v12];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKSampleIteratorQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)enumerateWorkoutsForDateInterval:(uint8_t *)buf handler:(void *)a2 errorHandler:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = @"Semaphore wait timeout in workout iterator";
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
}

@end