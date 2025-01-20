@interface ACHMindfulSessionIterator
- (ACHMindfulSessionIterator)initWithHealthStore:(id)a3;
- (ACHMindfulSessionIterator)initWithHealthStore:(id)a3 batchSize:(unint64_t)a4;
- (HKHealthStore)healthStore;
- (HKSampleIteratorQuery)query;
- (unint64_t)batchSize;
- (void)_runQueryForDateInterval:(id)a3 lastCursor:(id)a4 completion:(id)a5;
- (void)enumerateMindfulSessionsForDateInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5;
- (void)setBatchSize:(unint64_t)a3;
- (void)setHealthStore:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation ACHMindfulSessionIterator

- (ACHMindfulSessionIterator)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHMindfulSessionIterator;
  v6 = [(ACHMindfulSessionIterator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_batchSize = 128;
  }

  return v7;
}

- (ACHMindfulSessionIterator)initWithHealthStore:(id)a3 batchSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHMindfulSessionIterator;
  v8 = [(ACHMindfulSessionIterator *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (void)enumerateMindfulSessionsForDateInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v23 = a3;
  v8 = (void (**)(id, void))a4;
  v22 = (void (**)(void))a5;
  objc_super v9 = [(ACHMindfulSessionIterator *)self query];

  if (v9)
  {
    v10 = [(ACHMindfulSessionIterator *)self healthStore];
    objc_super v11 = [(ACHMindfulSessionIterator *)self query];
    [v10 stopQuery:v11];
  }
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__24;
  v49 = __Block_byref_object_dispose__24;
  id v50 = (id)MEMORY[0x263EFFA68];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__24;
  v43 = __Block_byref_object_dispose__24;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__24;
  v37 = __Block_byref_object_dispose__24;
  id v38 = 0;
  while (1)
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    uint64_t v13 = v34[5];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __90__ACHMindfulSessionIterator_enumerateMindfulSessionsForDateInterval_handler_errorHandler___block_invoke;
    v28[3] = &unk_2645172B0;
    v30 = &v45;
    v31 = &v39;
    v32 = &v33;
    v14 = v12;
    v29 = v14;
    [(ACHMindfulSessionIterator *)self _runQueryForDateInterval:v23 lastCursor:v13 completion:v28];
    dispatch_time_t v15 = dispatch_time(0, 10000000000);
    intptr_t v16 = dispatch_semaphore_wait(v14, v15);
    if (v40[5] || v16 != 0) {
      break;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = (id)v46[5];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v18);
          }
          v8[2](v8, *(void *)(*((void *)&v24 + 1) + 8 * v21++));
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v51 count:16];
      }
      while (v19);
    }

    if (!v34[5]) {
      goto LABEL_17;
    }
  }
  v22[2]();

LABEL_17:
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
}

void __90__ACHMindfulSessionIterator_enumerateMindfulSessionsForDateInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v7;
  id v15 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_runQueryForDateInterval:(id)a3 lastCursor:(id)a4 completion:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v25 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x263F0A668];
  objc_super v11 = [v8 startDate];
  id v12 = [v8 endDate];
  long long v24 = [v10 predicateForSamplesWithStartDate:v11 endDate:v12 options:1];

  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __76__ACHMindfulSessionIterator__runQueryForDateInterval_lastCursor_completion___block_invoke;
  v26[3] = &unk_2645172D8;
  objc_copyWeak(&v28, &location);
  id v13 = v9;
  id v27 = v13;
  v14 = (void *)MEMORY[0x223C507A0](v26);
  if (v25)
  {
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x263F0A6C8]), "initWithQueryCursor:limit:resultsHandler:", v25, -[ACHMindfulSessionIterator batchSize](self, "batchSize"), v14);
    [(ACHMindfulSessionIterator *)self setQuery:v15];
  }
  else
  {
    id v15 = [MEMORY[0x263F0A6E8] categoryTypeForIdentifier:*MEMORY[0x263F09388]];
    id v23 = (void *)[objc_alloc(MEMORY[0x263F0A678]) initWithSampleType:v15 predicate:v24];
    id v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
    id v17 = objc_alloc(MEMORY[0x263F0A6C8]);
    v31[0] = v23;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    v30 = v16;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    uint64_t v20 = objc_msgSend(v17, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:limit:resultsHandler:", v18, v19, 0, 0, 0, -[ACHMindfulSessionIterator batchSize](self, "batchSize"), v14);
    [(ACHMindfulSessionIterator *)self setQuery:v20];
  }
  uint64_t v21 = [(ACHMindfulSessionIterator *)self healthStore];
  v22 = [(ACHMindfulSessionIterator *)self query];
  [v21 executeQuery:v22];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __76__ACHMindfulSessionIterator__runQueryForDateInterval_lastCursor_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = (id *)(a1 + 40);
  id v10 = a5;
  id v11 = a4;
  id v15 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  v14 = [WeakRetained healthStore];
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

@end