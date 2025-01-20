@interface WDElectrocardiogramFilterDataProvider
+ (id)_atrialFibrillationClassificationPredicateWithClassifications:(id)a3;
+ (id)_atrialFibrillationClassificationPredicateWithValue:(unint64_t)a3;
+ (id)_atrialFibrillationClassificationPredicateWithValues:(id)a3;
+ (id)cellTitleForType:(int64_t)a3;
+ (id)viewControllerTitleForType:(int64_t)a3;
- (NSArray)countQueries;
- (NSArray)filterTypes;
- (NSMutableDictionary)counts;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)resourceQueue;
- (WDElectrocardiogramFilterDataProvider)initWithProfile:(id)a3 delegate:(id)a4;
- (WDElectrocardiogramFilterDataProviderDelegate)delegate;
- (WDProfile)profile;
- (id)_atrialFibrillationClassificationsWithActiveAlgorithmVersion:(int64_t)a3;
- (id)_countQueriesForFilterTypes:(id)a3;
- (id)_countQueryForType:(int64_t)a3;
- (id)_filterTypesForActiveAlgorithmVersion:(int64_t)a3;
- (id)_highLowHeartRateClassificationsWithActiveAlgorithmVersion:(int64_t)a3;
- (id)_inconclusiveClassificationsWithActiveAlgorithmVersion:(int64_t)a3;
- (id)displayStringCountForType:(int64_t)a3;
- (id)electrocardiogramPredicateForType:(int64_t)a3;
- (int64_t)_rQueue_countForType:(int64_t)a3;
- (int64_t)activeAlgorithmVersion;
- (int64_t)countForType:(int64_t)a3;
- (int64_t)filterTypeCount;
- (void)_rQueue_notifyDelegateDidUpdateCountForType:(int64_t)a3;
- (void)_rQueue_setCount:(int64_t)a3 forType:(int64_t)a4;
- (void)_safelyStopQuery:(id)a3;
- (void)_stopQueries;
- (void)setActiveAlgorithmVersion:(int64_t)a3;
- (void)setClientQueue:(id)a3;
- (void)setCountQueries:(id)a3;
- (void)setCounts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterTypes:(id)a3;
- (void)setProfile:(id)a3;
- (void)setResourceQueue:(id)a3;
- (void)start;
- (void)stop;
- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
@end

@implementation WDElectrocardiogramFilterDataProvider

- (WDElectrocardiogramFilterDataProvider)initWithProfile:(id)a3 delegate:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WDElectrocardiogramFilterDataProvider;
  v8 = [(WDElectrocardiogramFilterDataProvider *)&v29 init];
  v9 = v8;
  if (!v8)
  {
LABEL_6:
    v25 = v9;
    goto LABEL_10;
  }
  objc_storeWeak((id *)&v8->_profile, v6);
  objc_storeWeak((id *)&v9->_delegate, v7);
  v10 = (void *)MEMORY[0x263F0A348];
  v11 = [v6 healthStore];
  id v28 = 0;
  v12 = [v10 versionWithHealthStore:v11 error:&v28];
  id v13 = v28;

  if (v12)
  {
    uint64_t v14 = [v12 integerValue];
    v9->_int64_t activeAlgorithmVersion = v14;
    uint64_t v15 = [(WDElectrocardiogramFilterDataProvider *)v9 _filterTypesForActiveAlgorithmVersion:v14];
    filterTypes = v9->_filterTypes;
    v9->_filterTypes = (NSArray *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    counts = v9->_counts;
    v9->_counts = v17;

    uint64_t v19 = HKCreateSerialDispatchQueue();
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = HKCreateSerialDispatchQueue();
    resourceQueue = v9->_resourceQueue;
    v9->_resourceQueue = (OS_dispatch_queue *)v21;

    _HKInitializeLogging();
    v23 = *MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      int64_t activeAlgorithmVersion = v9->_activeAlgorithmVersion;
      *(_DWORD *)buf = 138543618;
      v31 = v9;
      __int16 v32 = 1024;
      int v33 = activeAlgorithmVersion;
      _os_log_impl(&dword_2210D2000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Initialized with alg ver: %i.", buf, 0x12u);
    }

    goto LABEL_6;
  }
  _HKInitializeLogging();
  v26 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
    -[WDElectrocardiogramFilterDataProvider initWithProfile:delegate:]((uint64_t)v13, v26);
  }

  v25 = 0;
LABEL_10:

  return v25;
}

- (int64_t)filterTypeCount
{
  v2 = [(WDElectrocardiogramFilterDataProvider *)self filterTypes];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)start
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(WDElectrocardiogramFilterDataProvider *)self stop];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(WDElectrocardiogramFilterDataProvider *)self setCounts:v3];

  v4 = [(WDElectrocardiogramFilterDataProvider *)self profile];
  v5 = [v4 updateController];
  id v6 = [MEMORY[0x263F0A358] electrocardiogramType];
  [v5 addObserver:self forType:v6];

  id v7 = [(WDElectrocardiogramFilterDataProvider *)self filterTypes];
  v8 = [(WDElectrocardiogramFilterDataProvider *)self _countQueriesForFilterTypes:v7];
  [(WDElectrocardiogramFilterDataProvider *)self setCountQueries:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = [(WDElectrocardiogramFilterDataProvider *)self countQueries];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        uint64_t v15 = [(WDElectrocardiogramFilterDataProvider *)self profile];
        v16 = [v15 healthStore];
        [v16 executeQuery:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)stop
{
  id v3 = [(WDElectrocardiogramFilterDataProvider *)self profile];
  v4 = [v3 updateController];
  v5 = [MEMORY[0x263F0A358] electrocardiogramType];
  [v4 removeObserver:self forType:v5];

  [(WDElectrocardiogramFilterDataProvider *)self _stopQueries];
}

- (int64_t)countForType:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v5 = [(WDElectrocardiogramFilterDataProvider *)self resourceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WDElectrocardiogramFilterDataProvider_countForType___block_invoke;
  block[3] = &unk_26458DDB0;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __54__WDElectrocardiogramFilterDataProvider_countForType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_rQueue_countForType:", *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)displayStringCountForType:(int64_t)a3
{
  int64_t v3 = [(WDElectrocardiogramFilterDataProvider *)self countForType:a3];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = &stru_26D2EA890;
  }
  else
  {
    int64_t v5 = v3;
    int64_t v6 = HKIntegerFormatter();
    id v7 = [NSNumber numberWithInteger:v5];
    v4 = [v6 stringFromNumber:v7];
  }

  return v4;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  BOOL v7 = a7;
  id v16 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x263F0A358];
  id v13 = a4;
  uint64_t v14 = [v12 electrocardiogramType];
  int v15 = [v13 isEqual:v14];

  if (v15 && ([v16 count] || objc_msgSend(v11, "count") || v7)) {
    [(WDElectrocardiogramFilterDataProvider *)self start];
  }
}

+ (id)cellTitleForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"ALL_DATA_TITLE";
      goto LABEL_8;
    case 1:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"SINUS_RHYTHM_TITLE";
      goto LABEL_8;
    case 2:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"ATRIAL_FIBRILLATION_TITLE";
      goto LABEL_8;
    case 3:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"HIGH_LOW_HEART_RATE_TITLE";
      goto LABEL_8;
    case 4:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"INCONCLUSIVE_TITLE";
      goto LABEL_8;
    case 5:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"INCONCLUSIVE_POOR_RECORDING_TITLE";
LABEL_8:
      BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
      int64_t v3 = HKConditionallyRedactedHeartRhythmString();

      break;
    default:
      break;
  }

  return v3;
}

+ (id)viewControllerTitleForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"ALL_DATA_VIEW_CONTROLLER_TITLE";
      goto LABEL_8;
    case 1:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"SINUS_RHYTHM_TITLE";
      goto LABEL_8;
    case 2:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"ATRIAL_FIBRILLATION_TITLE";
      goto LABEL_8;
    case 3:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"HIGH_LOW_HEART_RATE_TITLE";
      goto LABEL_8;
    case 4:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"INCONCLUSIVE_TITLE";
      goto LABEL_8;
    case 5:
      v4 = WDBundle();
      int64_t v5 = v4;
      int64_t v6 = @"INCONCLUSIVE_POOR_RECORDING_TITLE";
LABEL_8:
      BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
      int64_t v3 = HKConditionallyRedactedHeartRhythmString();

      break;
    default:
      break;
  }

  return v3;
}

- (id)electrocardiogramPredicateForType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int64_t v3 = objc_opt_class();
      uint64_t v4 = 3;
      goto LABEL_9;
    case 2:
      uint64_t v6 = [(WDElectrocardiogramFilterDataProvider *)self _atrialFibrillationClassificationsWithActiveAlgorithmVersion:[(WDElectrocardiogramFilterDataProvider *)self activeAlgorithmVersion]];
      goto LABEL_7;
    case 3:
      uint64_t v6 = [(WDElectrocardiogramFilterDataProvider *)self _highLowHeartRateClassificationsWithActiveAlgorithmVersion:[(WDElectrocardiogramFilterDataProvider *)self activeAlgorithmVersion]];
      goto LABEL_7;
    case 4:
      uint64_t v6 = [(WDElectrocardiogramFilterDataProvider *)self _inconclusiveClassificationsWithActiveAlgorithmVersion:[(WDElectrocardiogramFilterDataProvider *)self activeAlgorithmVersion]];
LABEL_7:
      BOOL v7 = (void *)v6;
      int64_t v5 = [(id)objc_opt_class() _atrialFibrillationClassificationPredicateWithClassifications:v6];

      break;
    case 5:
      int64_t v3 = objc_opt_class();
      uint64_t v4 = 1;
LABEL_9:
      int64_t v5 = [v3 _atrialFibrillationClassificationPredicateWithValue:v4];
      break;
    default:
      int64_t v5 = 0;
      break;
  }

  return v5;
}

- (id)_atrialFibrillationClassificationsWithActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_26D2FD470;
  }
  else {
    return &unk_26D2FD488;
  }
}

- (id)_highLowHeartRateClassificationsWithActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_26D2FD4A0;
  }
  else {
    return &unk_26D2FD4B8;
  }
}

- (id)_inconclusiveClassificationsWithActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_26D2FD4D0;
  }
  else {
    return &unk_26D2FD4E8;
  }
}

+ (id)_atrialFibrillationClassificationPredicateWithValues:(id)a3
{
  int64_t v3 = objc_msgSend(a3, "hk_map:", &__block_literal_global_1);
  uint64_t v4 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v3];

  return v4;
}

uint64_t __94__WDElectrocardiogramFilterDataProvider__atrialFibrillationClassificationPredicateWithValues___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F0A668];
  uint64_t v3 = [a2 integerValue];

  return [v2 predicateForElectrocardiogramsWithPrivateClassification:v3];
}

+ (id)_atrialFibrillationClassificationPredicateWithValue:(unint64_t)a3
{
  return (id)[MEMORY[0x263F0A668] predicateForElectrocardiogramsWithPrivateClassification:a3];
}

+ (id)_atrialFibrillationClassificationPredicateWithClassifications:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  int64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v4 == 1)
  {
    BOOL v7 = [v3 firstObject];

    v8 = objc_msgSend(v6, "_atrialFibrillationClassificationPredicateWithValue:", objc_msgSend(v7, "integerValue"));
    id v3 = v7;
  }
  else
  {
    v8 = [v5 _atrialFibrillationClassificationPredicateWithValues:v3];
  }

  return v8;
}

- (id)_filterTypesForActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_26D2FD500;
  }
  else {
    return &unk_26D2FD518;
  }
}

- (id)_countQueriesForFilterTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[WDElectrocardiogramFilterDataProvider _countQueryForType:](self, "_countQueryForType:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_countQueryForType:(int64_t)a3
{
  int64_t v5 = [MEMORY[0x263F0A358] electrocardiogramType];
  id v6 = [(WDElectrocardiogramFilterDataProvider *)self electrocardiogramPredicateForType:a3];
  id v7 = objc_alloc(MEMORY[0x263F0A6C0]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke;
  v11[3] = &unk_26458DE20;
  id v12 = v5;
  int64_t v13 = a3;
  v11[4] = self;
  id v8 = v5;
  uint64_t v9 = (void *)[v7 initWithSampleType:v8 predicate:v6 resultsHandler:v11];

  return v9;
}

void __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_cold_1(a1, (uint64_t)v9, v10);
    }
  }
  else if (v8)
  {
    id v11 = [*(id *)(a1 + 32) resourceQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_370;
    v14[3] = &unk_26458DDF8;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v16 = v12;
    uint64_t v17 = v13;
    dispatch_async(v11, v14);
  }
}

uint64_t __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_370(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  objc_msgSend(v2, "_rQueue_setCount:forType:", objc_msgSend(v3, "integerValue"), *(void *)(a1 + 56));

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);

  return objc_msgSend(v4, "_rQueue_notifyDelegateDidUpdateCountForType:", v5);
}

- (void)_stopQueries
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(WDElectrocardiogramFilterDataProvider *)self countQueries];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WDElectrocardiogramFilterDataProvider *)self _safelyStopQuery:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_safelyStopQuery:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(WDElectrocardiogramFilterDataProvider *)self profile];
    uint64_t v5 = [v6 healthStore];
    [v5 stopQuery:v4];
  }
}

- (void)_rQueue_notifyDelegateDidUpdateCountForType:(int64_t)a3
{
  uint64_t v5 = [(WDElectrocardiogramFilterDataProvider *)self resourceQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(WDElectrocardiogramFilterDataProvider *)self _rQueue_countForType:a3];
  uint64_t v7 = [(WDElectrocardiogramFilterDataProvider *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__WDElectrocardiogramFilterDataProvider__rQueue_notifyDelegateDidUpdateCountForType___block_invoke;
  block[3] = &unk_26458DE48;
  block[4] = self;
  block[5] = v6;
  block[6] = a3;
  dispatch_async(v7, block);
}

void __85__WDElectrocardiogramFilterDataProvider__rQueue_notifyDelegateDidUpdateCountForType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 electrocardiogramFilterDataProvider:*(void *)(a1 + 32) didUpdateCount:*(void *)(a1 + 40) type:*(void *)(a1 + 48)];
}

- (int64_t)_rQueue_countForType:(int64_t)a3
{
  uint64_t v5 = [(WDElectrocardiogramFilterDataProvider *)self resourceQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(WDElectrocardiogramFilterDataProvider *)self counts];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  long long v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v9 = [(WDElectrocardiogramFilterDataProvider *)self counts];
  long long v10 = [NSNumber numberWithInteger:a3];
  long long v11 = [v9 objectForKeyedSubscript:v10];
  int64_t v12 = [v11 integerValue];

  return v12;
}

- (void)_rQueue_setCount:(int64_t)a3 forType:(int64_t)a4
{
  uint64_t v7 = [(WDElectrocardiogramFilterDataProvider *)self resourceQueue];
  dispatch_assert_queue_V2(v7);

  id v10 = [NSNumber numberWithInteger:a3];
  long long v8 = [(WDElectrocardiogramFilterDataProvider *)self counts];
  long long v9 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (WDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (WDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (WDElectrocardiogramFilterDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WDElectrocardiogramFilterDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (void)setActiveAlgorithmVersion:(int64_t)a3
{
  self->_int64_t activeAlgorithmVersion = a3;
}

- (NSArray)filterTypes
{
  return self->_filterTypes;
}

- (void)setFilterTypes:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
}

- (NSMutableDictionary)counts
{
  return self->_counts;
}

- (void)setCounts:(id)a3
{
}

- (NSArray)countQueries
{
  return self->_countQueries;
}

- (void)setCountQueries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countQueries, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_filterTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)initWithProfile:(uint64_t)a1 delegate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch active algorithm version with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 134349314;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2210D2000, log, OS_LOG_TYPE_ERROR, "Failed to fetch count for type: %{public}ld, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end