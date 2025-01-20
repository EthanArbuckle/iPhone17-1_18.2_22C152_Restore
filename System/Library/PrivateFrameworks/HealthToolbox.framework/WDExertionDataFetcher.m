@interface WDExertionDataFetcher
- (WDExertionDataFetcher)initWithHealthStore:(id)a3 predicate:(id)a4 exertionTypeCode:(int64_t)a5 limit:(int64_t)a6 sortDescriptors:(id)a7 resultsHandler:(id)a8;
- (void)start;
@end

@implementation WDExertionDataFetcher

- (WDExertionDataFetcher)initWithHealthStore:(id)a3 predicate:(id)a4 exertionTypeCode:(int64_t)a5 limit:(int64_t)a6 sortDescriptors:(id)a7 resultsHandler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  if (v16)
  {
    v25.receiver = self;
    v25.super_class = (Class)WDExertionDataFetcher;
    v19 = [(WDExertionDataFetcher *)&v25 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_healthStore, a3);
      objc_storeStrong((id *)&v20->_predicate, a4);
      v20->_exertionTypeCode = a5;
      v20->_limit = a6;
      objc_storeStrong((id *)&v20->_sortDescriptors, a7);
      uint64_t v21 = MEMORY[0x223C798A0](v18);
      id resultsHandler = v20->_resultsHandler;
      v20->_id resultsHandler = (id)v21;
    }
    self = v20;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)start
{
  id v3 = objc_alloc(MEMORY[0x263F0A6E0]);
  v4 = [MEMORY[0x263F0A948] workoutType];
  predicate = self->_predicate;
  int64_t limit = self->_limit;
  sortDescriptors = self->_sortDescriptors;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__WDExertionDataFetcher_start__block_invoke;
  v9[3] = &unk_26458DEE8;
  v9[4] = self;
  v8 = (void *)[v3 initWithSampleType:v4 predicate:predicate limit:limit sortDescriptors:sortDescriptors resultsHandler:v9];

  [(HKHealthStore *)self->_healthStore executeQuery:v8];
}

void __30__WDExertionDataFetcher_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 count])
  {
    if ((unint64_t)[v8 count] < 2)
    {
      v12 = [v8 firstObject];
      v13 = (void *)MEMORY[0x263F0A668];
      v14 = [v12 UUID];
      id v15 = [v13 predicateForObjectWithUUID:v14];

      id v16 = objc_alloc(MEMORY[0x263F0A928]);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __30__WDExertionDataFetcher_start__block_invoke_2;
      v18[3] = &unk_26458DEC0;
      v18[4] = *(void *)(a1 + 32);
      id v17 = (void *)[v16 initWithPredicate:v15 anchor:0 options:0 resultsHandler:v18];
      [*(id *)(*(void *)(a1 + 32) + 8) executeQuery:v17];
    }
    else
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 48);
      v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F09548] code:3 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
  }
}

void __30__WDExertionDataFetcher_start__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    objc_super v25 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16);
LABEL_15:
    v25();
    goto LABEL_16;
  }
  if (![v10 count])
  {
    objc_super v25 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16);
    goto LABEL_15;
  }
  id v26 = v11;
  id v27 = v9;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "samples", v26);

        if (v20)
        {
          uint64_t v21 = [v19 samples];
          [v13 addObjectsFromArray:v21];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);
  }

  id v9 = v27;
  [*(id *)(*(void *)(a1 + 32) + 8) stopQuery:v27];
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(v22 + 48);
  v24 = [MEMORY[0x263F46750] filterSamplesOfExertionTypeCode:*(void *)(v22 + 24) fromExertionSamples:v13];
  (*(void (**)(uint64_t, void *, void))(v23 + 16))(v23, v24, 0);

  id v11 = v26;
LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end