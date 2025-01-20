@interface ACHActivitySummaryIterator
- (ACHActivitySummaryIterator)initWithHealthStore:(id)a3 shouldIncludePrivateProperties:(BOOL)a4;
- (BOOL)includePrivateProperties;
- (HKHealthStore)healthStore;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSCalendar)calendar;
- (id)exportedInterface;
- (id)newEmptyActivitySummaryFromSummary:(id)a3;
- (id)remoteInterface;
- (void)_enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5;
- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5;
- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 includeNilSummaries:(BOOL)a4 handler:(id)a5 errorHandler:(id)a6;
- (void)setCalendar:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setIncludePrivateProperties:(BOOL)a3;
- (void)setProxyProvider:(id)a3;
@end

@implementation ACHActivitySummaryIterator

- (ACHActivitySummaryIterator)initWithHealthStore:(id)a3 shouldIncludePrivateProperties:(BOOL)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ACHActivitySummaryIterator;
  v8 = [(ACHActivitySummaryIterator *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    calendar = v9->_calendar;
    v9->_calendar = (NSCalendar *)v10;

    id v12 = objc_alloc(MEMORY[0x263F0A818]);
    healthStore = v9->_healthStore;
    uint64_t v14 = *MEMORY[0x263F23468];
    v15 = [MEMORY[0x263F08C38] UUID];
    uint64_t v16 = [v12 initWithHealthStore:healthStore taskIdentifier:v14 exportedObject:v9 taskUUID:v15];
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = (HKTaskServerProxyProvider *)v16;

    v9->_includePrivateProperties = a4;
  }

  return v9;
}

- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v21 = a3;
  v8 = (void (**)(id, void))a4;
  v23 = (void (**)(void))a5;
  v9 = [(ACHActivitySummaryIterator *)self calendar];
  uint64_t v10 = [v21 chunked:100 calendar:v9];
  v11 = (void *)[v10 mutableCopy];

  BOOL v25 = [(ACHActivitySummaryIterator *)self includePrivateProperties];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v12)
  {
    uint64_t v24 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x3032000000;
        v42 = __Block_byref_object_copy__4;
        v43 = __Block_byref_object_dispose__4;
        id v44 = 0;
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__4;
        v37 = __Block_byref_object_dispose__4;
        id v38 = (id)MEMORY[0x263EFFA68];
        v15 = (void *)MEMORY[0x223C50570]();
        uint64_t v16 = [(ACHActivitySummaryIterator *)self proxyProvider];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke;
        v31[3] = &unk_264516780;
        BOOL v32 = v25;
        v31[4] = v14;
        v31[5] = &v33;
        v31[6] = &v39;
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3;
        v30[3] = &unk_2645167A8;
        v30[4] = &v39;
        [v16 getSynchronousProxyWithHandler:v31 errorHandler:v30];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v17 = (id)v34[5];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v49 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(v17);
              }
              v8[2](v8, *(void *)(*((void *)&v26 + 1) + 8 * j));
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v49 count:16];
          }
          while (v18);
        }

        if (v40[5]) {
          v23[2]();
        }
        _Block_object_dispose(&v33, 8);

        _Block_object_dispose(&v39, 8);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v12);
  }
}

void __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 startDateComponents];
  v6 = [*(id *)(a1 + 32) endDateComponents];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2;
  v8[3] = &unk_264516758;
  long long v9 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "remote_activitySummariesForStartDateComponents:endDateComponents:includePrivateProperties:completion:", v5, v6, v7, v8);
}

void __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __102__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 includeNilSummaries:(BOOL)a4 handler:(id)a5 errorHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v7)
  {
    id v12 = a6;
    id v13 = a3;
    [(ACHActivitySummaryIterator *)self _enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval:v13 handler:v11 errorHandler:v12];
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __122__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_includeNilSummaries_handler_errorHandler___block_invoke;
    v17[3] = &unk_2645167D0;
    id v18 = v10;
    id v14 = a6;
    id v15 = a3;
    uint64_t v16 = (void *)MEMORY[0x223C507A0](v17);
    [(ACHActivitySummaryIterator *)self enumerateActivitySummariesForDateComponentInterval:v15 handler:v16 errorHandler:v14];

    id v13 = v18;
  }
}

void __122__ACHActivitySummaryIterator_enumerateActivitySummariesForDateComponentInterval_includeNilSummaries_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 _gregorianDateComponents];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);
}

- (void)_enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval:(id)a3 handler:(id)a4 errorHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v24 = a3;
  v8 = (void (**)(id, void *, void *))a4;
  long long v26 = (void (**)(void))a5;
  uint64_t v9 = [(ACHActivitySummaryIterator *)self calendar];
  id v10 = [v24 chunked:100 calendar:v9];
  id v11 = (void *)[v10 mutableCopy];

  BOOL v28 = [(ACHActivitySummaryIterator *)self includePrivateProperties];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v11;
  uint64_t v29 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v47;
    uint64_t v12 = *MEMORY[0x263F234C0];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v47 != v27) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
        context = (void *)MEMORY[0x223C50570]();
        uint64_t v40 = 0;
        uint64_t v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__4;
        id v44 = __Block_byref_object_dispose__4;
        id v45 = 0;
        uint64_t v34 = 0;
        uint64_t v35 = &v34;
        uint64_t v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__4;
        id v38 = __Block_byref_object_dispose__4;
        id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v15 = [(ACHActivitySummaryIterator *)self proxyProvider];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke;
        v32[3] = &unk_264516820;
        BOOL v33 = v28;
        v32[4] = v14;
        v32[5] = self;
        v32[6] = &v34;
        v32[7] = &v40;
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3;
        v31[3] = &unk_2645167A8;
        v31[4] = &v40;
        [v15 getSynchronousProxyWithHandler:v32 errorHandler:v31];

        calendar = self->_calendar;
        id v17 = [v14 startDateComponents];
        id v18 = [(NSCalendar *)calendar dateFromComponents:v17];

        uint64_t v19 = self->_calendar;
        v20 = [v14 endDateComponents];
        id v21 = [(NSCalendar *)v19 dateFromComponents:v20];
        while (1)
        {

          if (!objc_msgSend(v18, "hk_isBeforeOrEqualToDate:", v21)) {
            break;
          }
          v20 = [(NSCalendar *)self->_calendar components:v12 fromDate:v18];
          v22 = [(id)v35[5] objectForKeyedSubscript:v20];
          v8[2](v8, v22, v20);
          uint64_t v23 = [(NSCalendar *)self->_calendar hk_startOfDateByAddingDays:1 toDate:v18];

          id v18 = (void *)v23;
        }
        if (v41[5]) {
          v26[2]();
        }

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v40, 8);

        ++v13;
      }
      while (v13 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v29);
  }
}

void __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 startDateComponents];
  id v6 = [*(id *)(a1 + 32) endDateComponents];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2;
  v8[3] = &unk_2645167F8;
  long long v9 = *(_OWORD *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  objc_msgSend(v4, "remote_activitySummariesForStartDateComponents:endDateComponents:includePrivateProperties:completion:", v5, v6, v7, v8);
}

void __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    uint64_t v10 = *MEMORY[0x263F234C0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = *(void **)(a1[4] + 24);
        id v14 = [v12 _startDate];
        id v15 = [v13 components:v10 fromDate:v14];

        [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v12 forKeyedSubscript:v15];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  uint64_t v16 = *(void *)(a1[6] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v6;
}

void __126__ACHActivitySummaryIterator__enumerateActivitySummariesIncludingEmptySummariesForDateComponentInterval_handler_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)newEmptyActivitySummaryFromSummary:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F0A090];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "_setActivitySummaryIndex:", objc_msgSend(v4, "_activitySummaryIndex"));
  objc_msgSend(v5, "setActivityMoveMode:", objc_msgSend(v4, "activityMoveMode"));
  id v6 = [v4 activeEnergyBurnedGoal];
  [v5 setActiveEnergyBurnedGoal:v6];

  uint64_t v7 = [v4 appleMoveTimeGoal];
  [v5 setAppleMoveTimeGoal:v7];

  uint64_t v8 = [v4 appleStandHoursGoal];
  [v5 setAppleStandHoursGoal:v8];

  uint64_t v9 = [v4 appleExerciseTimeGoal];

  [v5 setAppleExerciseTimeGoal:v9];
  return v5;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D133AE8];
}

- (id)remoteInterface
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1281C0];
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v5 = (void *)[v3 initWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (BOOL)includePrivateProperties
{
  return self->_includePrivateProperties;
}

- (void)setIncludePrivateProperties:(BOOL)a3
{
  self->_includePrivateProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end