@interface FIUIActivityDataProvider
+ (id)sharedModel;
- (BOOL)_isPausedForActivitySummary:(id)a3;
- (BOOL)_loadingStateForActivitySummary:(id)a3;
- (FIUIActivityDataProvider)init;
- (id)_currentActivitySummaryQueryCollectionIntervalsOverride;
- (id)_queue_activityDataModelFromCurrentActivitySummary;
- (id)switcherActivityDataModel;
- (void)_broadcastCurrentModelUpdate:(id)a3 toSubscriber:(id)a4;
- (void)_broadcastCurrentModelUpdateToSubscribers:(id)a3;
- (void)_handleTimeChange;
- (void)_queue_restartQueriesIfQueryInUse:(id)a3;
- (void)_queue_restartQueriesPreservingExistingGoals:(BOOL)a3;
- (void)_queue_updateChartStatisticsWithStatisticsQueryResult:(id)a3;
- (void)_queue_updateCurrentActivitySummaryWithSummary:(id)a3;
- (void)_setCurrentDate:(id)a3;
- (void)addSubscriber:(id)a3;
- (void)dealloc;
- (void)fitnessAppsStateObserver:(id)a3 restrictedStateDidChange:(int64_t)a4;
- (void)getCurrentActivityDataModelWithHandler:(id)a3;
- (void)removeSubscriber:(id)a3;
@end

@implementation FIUIActivityDataProvider

- (FIUIActivityDataProvider)init
{
  v24.receiver = self;
  v24.super_class = (Class)FIUIActivityDataProvider;
  v2 = [(FIUIActivityDataProvider *)&v24 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F0A830] kilocalorieUnit];
    kcalUnit = v2->_kcalUnit;
    v2->_kcalUnit = (HKUnit *)v3;

    uint64_t v5 = [MEMORY[0x263F0A830] minuteUnit];
    minuteUnit = v2->_minuteUnit;
    v2->_minuteUnit = (HKUnit *)v5;

    uint64_t v7 = [MEMORY[0x263F0A830] countUnit];
    countUnit = v2->_countUnit;
    v2->_countUnit = (HKUnit *)v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanolifestyle.activity.cacheaccess", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    v12 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__FIUIActivityDataProvider_init__block_invoke;
    block[3] = &unk_2644A7B18;
    v13 = v2;
    v23 = v13;
    dispatch_async(v12, block);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.nanolifestyle.activity.subscriberaccess", v9);
    subscriber_queue = v13->_subscriber_queue;
    v13->_subscriber_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    subscribers = v13->_subscribers;
    v13->_subscribers = (NSHashTable *)v16;

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v13 selector:sel__handleTimeChange name:*MEMORY[0x263F83390] object:0];
    [v18 addObserver:v13 selector:sel__handleTimeChange name:*MEMORY[0x263EFF3C8] object:0];
    v19 = (FIFitnessAppsStateObserver *)objc_alloc_init(MEMORY[0x263F3D160]);
    fitnessAppsStateObserver = v13->_fitnessAppsStateObserver;
    v13->_fitnessAppsStateObserver = v19;

    [(FIFitnessAppsStateObserver *)v13->_fitnessAppsStateObserver setDelegate:v13];
    v13->_areFitnessAppsRestricted = [(FIFitnessAppsStateObserver *)v13->_fitnessAppsStateObserver areFitnessAppsRestricted];
  }
  return v2;
}

uint64_t __32__FIUIActivityDataProvider_init__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = objc_msgSend(MEMORY[0x263F0A410], "fiui_sharedHealthStoreForCarousel");
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  fitnessAppsStateObserver = self->_fitnessAppsStateObserver;
  self->_fitnessAppsStateObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)FIUIActivityDataProvider;
  [(FIUIActivityDataProvider *)&v5 dealloc];
}

+ (id)sharedModel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__FIUIActivityDataProvider_sharedModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedModel_onceToken != -1) {
    dispatch_once(&sharedModel_onceToken, block);
  }
  v2 = (void *)sharedModel___sharedModel;
  return v2;
}

uint64_t __39__FIUIActivityDataProvider_sharedModel__block_invoke()
{
  sharedModel___sharedModel = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)addSubscriber:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 description];
  _HKInitializeLogging();
  v6 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v14 = v5;
    _os_log_impl(&dword_21E433000, v6, OS_LOG_TYPE_DEFAULT, "Timeline model adding subscriber: %@", buf, 0xCu);
  }
  subscriber_queue = self->_subscriber_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__FIUIActivityDataProvider_addSubscriber___block_invoke;
  block[3] = &unk_2644A7B40;
  void block[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(subscriber_queue, block);
}

void __42__FIUIActivityDataProvider_addSubscriber___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([*(id *)(*(void *)(a1 + 32) + 112) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 112) anyObject];

    [*(id *)(*(void *)(a1 + 32) + 112) addObject:*(void *)(a1 + 40)];
    _HKInitializeLogging();
    uint64_t v3 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_21E433000, v3, OS_LOG_TYPE_DEFAULT, "Timeline model: Subscriber <%@> added.", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    dispatch_queue_t v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__FIUIActivityDataProvider_addSubscriber___block_invoke_288;
    block[3] = &unk_2644A8AC0;
    void block[4] = v5;
    void block[5] = &buf;
    dispatch_sync(v6, block);
    [*(id *)(a1 + 32) _broadcastCurrentModelUpdate:*(void *)(*((void *)&buf + 1) + 40) toSubscriber:*(void *)(a1 + 40)];
    if (!v2)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(NSObject **)(v7 + 48);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __42__FIUIActivityDataProvider_addSubscriber___block_invoke_2;
      v9[3] = &unk_2644A7B18;
      v9[4] = v7;
      dispatch_async(v8, v9);
    }
    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __42__FIUIActivityDataProvider_addSubscriber___block_invoke_288(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_activityDataModelFromCurrentActivitySummary");
  return MEMORY[0x270F9A758]();
}

uint64_t __42__FIUIActivityDataProvider_addSubscriber___block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E433000, v2, OS_LOG_TYPE_DEFAULT, "Timeline model: First subscriber added to activity data provider, starting queries", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startQueries");
}

- (void)removeSubscriber:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_21E433000, v5, OS_LOG_TYPE_DEFAULT, "Timeline model removing subscriber: %@", buf, 0xCu);
  }
  subscriber_queue = self->_subscriber_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__FIUIActivityDataProvider_removeSubscriber___block_invoke;
  block[3] = &unk_2644A7B18;
  void block[4] = self;
  dispatch_async(subscriber_queue, block);
}

void __45__FIUIActivityDataProvider_removeSubscriber___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 112) anyObject];

  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v3 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__FIUIActivityDataProvider_removeSubscriber___block_invoke_2;
    block[3] = &unk_2644A7B18;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __45__FIUIActivityDataProvider_removeSubscriber___block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E433000, v2, OS_LOG_TYPE_DEFAULT, "Timeline model: Last subscriber removed from activity data provider, stopping queries", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopQueriesPreservingExistingGoals:", 0);
}

- (id)switcherActivityDataModel
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__FIUIActivityDataProvider_switcherActivityDataModel__block_invoke;
  v5[3] = &unk_2644A8AC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __53__FIUIActivityDataProvider_switcherActivityDataModel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_activityDataModelFromCurrentActivitySummary");
  return MEMORY[0x270F9A758]();
}

- (void)getCurrentActivityDataModelWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke;
  v7[3] = &unk_2644A8AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_activityDataModelFromCurrentActivitySummary");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke_2;
  v5[3] = &unk_2644A7AA0;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __67__FIUIActivityDataProvider_getCurrentActivityDataModelWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_currentActivitySummaryQueryCollectionIntervalsOverride
{
  v9[4] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09BC0]];
  v8[0] = v2;
  v9[0] = &unk_26CF75C48;
  id v3 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09BD0]];
  v8[1] = v3;
  v9[1] = &unk_26CF75C48;
  id v4 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09BC8]];
  v8[2] = v4;
  v9[2] = &unk_26CF75C48;
  uint64_t v5 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F09240]];
  v8[3] = v5;
  v9[3] = &unk_26CF75C48;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)_queue_restartQueriesIfQueryInUse:(id)a3
{
  BOOL v4 = self->_queue_currentActivityCacheQuery == a3 || self->_queue_currentActivitySummaryQuery == a3;
  [(FIUIActivityDataProvider *)self _queue_restartQueriesPreservingExistingGoals:v4];
}

- (void)_queue_restartQueriesPreservingExistingGoals:(BOOL)a3
{
  BOOL v3 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E433000, v5, OS_LOG_TYPE_DEFAULT, "Timeline model restarting queries", v6, 2u);
  }
  [(FIUIActivityDataProvider *)self _queue_stopQueriesPreservingExistingGoals:v3];
  [(FIUIActivityDataProvider *)self _queue_startQueries];
}

- (BOOL)_loadingStateForActivitySummary:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  _HKInitializeLogging();
  BOOL v4 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    v7[0] = 67109634;
    v7[1] = v3 == 0;
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 1024;
    int v11 = [v3 _isDataLoading];
    _os_log_impl(&dword_21E433000, v5, OS_LOG_TYPE_DEFAULT, "databaseLoading?:%u activitySummary:%@ [activitySummary _isDataLoading]:%u", (uint8_t *)v7, 0x18u);
  }
  return v3 == 0;
}

- (BOOL)_isPausedForActivitySummary:(id)a3
{
  return [a3 paused];
}

- (id)_queue_activityDataModelFromCurrentActivitySummary
{
  id v3 = self->_queue_currentActivitySummary;
  BOOL v4 = objc_alloc_init(FIUIActivityDataModel);
  uint64_t v5 = [(HKActivitySummary *)v3 activeEnergyBurned];
  id v6 = [(HKActivitySummary *)v3 activeEnergyBurnedGoal];
  id v7 = [(HKActivitySummary *)v3 appleMoveMinutes];
  [v7 doubleValueForUnit:self->_minuteUnit];
  double v9 = v8;

  __int16 v10 = [(HKActivitySummary *)v3 appleMoveMinutesGoal];
  [v10 doubleValueForUnit:self->_minuteUnit];
  double v12 = v11;

  v13 = [(HKActivitySummary *)v3 appleExerciseTime];
  [v13 doubleValueForUnit:self->_minuteUnit];
  double v15 = v14;

  uint64_t v16 = [(HKActivitySummary *)v3 appleExerciseTimeGoal];
  [v16 doubleValueForUnit:self->_minuteUnit];
  double v18 = v17;

  v19 = [(HKActivitySummary *)v3 appleStandHours];
  [v19 doubleValueForUnit:self->_countUnit];
  double v21 = v20;

  v22 = [(HKActivitySummary *)v3 appleStandHoursGoal];
  [v22 doubleValueForUnit:self->_countUnit];
  double v24 = v23;

  [(FIUIActivityDataModel *)v4 setActivityMoveMode:[(HKActivitySummary *)v3 _activityMoveMode]];
  [(FIUIActivityDataModel *)v4 setActiveEnergyTotal:v5];
  [(FIUIActivityDataModel *)v4 setActiveEnergyGoal:v6];
  [(FIUIActivityDataModel *)v4 setAppleMoveTimeTotal:v9];
  [(FIUIActivityDataModel *)v4 setAppleMoveTimeGoal:v12];
  [(FIUIActivityDataModel *)v4 setAppleExerciseTimeTotal:v15];
  [(FIUIActivityDataModel *)v4 setAppleExerciseTimeGoal:v18];
  [(FIUIActivityDataModel *)v4 setAppleStandHoursTotal:(uint64_t)v21];
  [(FIUIActivityDataModel *)v4 setAppleStandHoursGoal:(uint64_t)v24];
  [(FIUIActivityDataModel *)v4 setWheelchairUser:[(HKActivitySummary *)v3 _wheelchairUse] == 2];
  [(FIUIActivityDataModel *)v4 setPaused:[(FIUIActivityDataProvider *)self _isPausedForActivitySummary:v3]];
  v25 = (NSArray *)MEMORY[0x263EFFA68];
  if (self->_queue_currentActiveEnergyChartData) {
    queue_currentActiveEnergyChartData = self->_queue_currentActiveEnergyChartData;
  }
  else {
    queue_currentActiveEnergyChartData = (NSArray *)MEMORY[0x263EFFA68];
  }
  [(FIUIActivityDataModel *)v4 setActiveEnergyChartData:queue_currentActiveEnergyChartData];
  if (self->_queue_currentMoveTimeChartData) {
    queue_currentMoveTimeChartData = self->_queue_currentMoveTimeChartData;
  }
  else {
    queue_currentMoveTimeChartData = v25;
  }
  [(FIUIActivityDataModel *)v4 setAppleMoveTimeChartData:queue_currentMoveTimeChartData];
  if (self->_queue_currentExerciseChartData) {
    queue_currentExerciseChartData = self->_queue_currentExerciseChartData;
  }
  else {
    queue_currentExerciseChartData = v25;
  }
  [(FIUIActivityDataModel *)v4 setAppleExerciseTimeChartData:queue_currentExerciseChartData];
  if (self->_queue_currentStandChartData) {
    queue_currentStandChartData = self->_queue_currentStandChartData;
  }
  else {
    queue_currentStandChartData = v25;
  }
  [(FIUIActivityDataModel *)v4 setAppleStandHourChartData:queue_currentStandChartData];
  v30 = [MEMORY[0x263EFF910] date];
  [(FIUIActivityDataModel *)v4 setDate:v30];

  [(FIUIActivityDataModel *)v4 setDatabaseLoading:[(FIUIActivityDataProvider *)self _loadingStateForActivitySummary:v3]];
  [(FIUIActivityDataModel *)v4 setAreFitnessAppsRestricted:self->_areFitnessAppsRestricted];

  return v4;
}

- (void)_queue_updateCurrentActivitySummaryWithSummary:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v18 = [(HKActivitySummary *)self->_queue_currentActivitySummary activeEnergyBurnedGoal];
  v32 = [(HKActivitySummary *)self->_queue_currentActivitySummary activeEnergyBurned];
  v30 = [(HKActivitySummary *)self->_queue_currentActivitySummary appleMoveMinutesGoal];
  v28 = [(HKActivitySummary *)self->_queue_currentActivitySummary appleMoveMinutes];
  v26 = [(HKActivitySummary *)self->_queue_currentActivitySummary appleExerciseTimeGoal];
  double v24 = [(HKActivitySummary *)self->_queue_currentActivitySummary appleExerciseTime];
  v22 = [(HKActivitySummary *)self->_queue_currentActivitySummary appleStandHoursGoal];
  double v20 = [(HKActivitySummary *)self->_queue_currentActivitySummary appleStandHours];
  int v16 = [(HKActivitySummary *)self->_queue_currentActivitySummary paused];
  uint64_t v5 = [v4 activeEnergyBurnedGoal];
  v31 = [v4 activeEnergyBurned];
  v29 = [v4 appleMoveMinutesGoal];
  v27 = [v4 appleMoveMinutes];
  v25 = [v4 appleExerciseTimeGoal];
  double v23 = [v4 appleExerciseTime];
  double v21 = [v4 appleStandHoursGoal];
  v19 = [v4 appleStandHours];
  BOOL v6 = [(FIUIActivityDataProvider *)self _isPausedForActivitySummary:v4];
  uint64_t v7 = [(HKActivitySummary *)self->_queue_currentActivitySummary _activitySummaryIndex];
  uint64_t v8 = [v4 _activitySummaryIndex];
  uint64_t v9 = [(HKActivitySummary *)self->_queue_currentActivitySummary _activityMoveMode];
  uint64_t v10 = [v4 _activityMoveMode];
  uint64_t v11 = [(HKActivitySummary *)self->_queue_currentActivitySummary _wheelchairUse];
  uint64_t v12 = [v4 _wheelchairUse];
  if (v7 == v8
    && v9 == v10
    && v11 == v12
    && ((v16 ^ v6) & 1) == 0
    && [v18 isEqual:v5]
    && [v32 isEqual:v31]
    && [v30 isEqual:v29]
    && [v28 isEqual:v27]
    && [v26 isEqual:v25]
    && [v24 isEqual:v23]
    && [v22 isEqual:v21]
    && [v20 isEqual:v19])
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      queue_currentActivitySummary = self->_queue_currentActivitySummary;
      *(_DWORD *)long long buf = 138412546;
      v34 = queue_currentActivitySummary;
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl(&dword_21E433000, v13, OS_LOG_TYPE_DEFAULT, "New activity summary (%@) has same values as existing (%@), skipping update", buf, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_queue_currentActivitySummary, a3);
    double v15 = [(FIUIActivityDataProvider *)self _queue_activityDataModelFromCurrentActivitySummary];
    [(FIUIActivityDataProvider *)self _broadcastCurrentModelUpdateToSubscribers:v15];
  }
}

- (void)_queue_updateChartStatisticsWithStatisticsQueryResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 activeEnergyResults];
  queue_currentActiveEnergyChartData = self->_queue_currentActiveEnergyChartData;
  self->_queue_currentActiveEnergyChartData = v5;

  uint64_t v7 = [v4 appleMoveTimeResults];
  queue_currentMoveTimeChartData = self->_queue_currentMoveTimeChartData;
  self->_queue_currentMoveTimeChartData = v7;

  uint64_t v9 = [v4 appleExerciseTimeResults];
  queue_currentExerciseChartData = self->_queue_currentExerciseChartData;
  self->_queue_currentExerciseChartData = v9;

  uint64_t v11 = [v4 appleStandHourResults];

  queue_currentStandChartData = self->_queue_currentStandChartData;
  self->_queue_currentStandChartData = v11;

  id v13 = [(FIUIActivityDataProvider *)self _queue_activityDataModelFromCurrentActivitySummary];
  [(FIUIActivityDataProvider *)self _broadcastCurrentModelUpdateToSubscribers:v13];
}

- (void)_handleTimeChange
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E433000, log, OS_LOG_TYPE_DEBUG, "Timeline model does not have subscribers, nothing to do", v1, 2u);
}

void __45__FIUIActivityDataProvider__handleTimeChange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 112) anyObject];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void __45__FIUIActivityDataProvider__handleTimeChange__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v3 = v2;
  if (*(void *)(*(void *)(a1 + 32) + 120) && objc_msgSend(v2, "isDateInToday:"))
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E433000, v4, OS_LOG_TYPE_DEFAULT, "Timeline model has subscribers, but date didn't change, so *not* restarting everything.", buf, 2u);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v5 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E433000, v5, OS_LOG_TYPE_DEFAULT, "Timeline model has subscribers, and the date has changed, so restarting everything", v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_restartQueriesPreservingExistingGoals:", 1);
  }
}

- (void)_broadcastCurrentModelUpdateToSubscribers:(id)a3
{
  id v4 = a3;
  subscriber_queue = self->_subscriber_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __70__FIUIActivityDataProvider__broadcastCurrentModelUpdateToSubscribers___block_invoke;
  v7[3] = &unk_2644A7AF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(subscriber_queue, v7);
}

void __70__FIUIActivityDataProvider__broadcastCurrentModelUpdateToSubscribers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(a1 + 32), "_broadcastCurrentModelUpdate:toSubscriber:", *(void *)(a1 + 40), *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_broadcastCurrentModelUpdate:(id)a3 toSubscriber:(id)a4
{
}

- (void)fitnessAppsStateObserver:(id)a3 restrictedStateDidChange:(int64_t)a4
{
  self->_areFitnessAppsRestricted = a4 == 1;
  id v5 = [(FIUIActivityDataProvider *)self _queue_activityDataModelFromCurrentActivitySummary];
  [(FIUIActivityDataProvider *)self _broadcastCurrentModelUpdateToSubscribers:v5];
}

- (void)_setCurrentDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __44__FIUIActivityDataProvider__setCurrentDate___block_invoke;
  v7[3] = &unk_2644A7AF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __44__FIUIActivityDataProvider__setCurrentDate___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppsStateObserver, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_subscriber_queue, 0);
  objc_storeStrong((id *)&self->_queue_currentStandChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentExerciseChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentMoveTimeChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentActiveEnergyChartData, 0);
  objc_storeStrong((id *)&self->_queue_currentActivityCacheQuery, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummaryQuery, 0);
  objc_storeStrong((id *)&self->_countUnit, 0);
  objc_storeStrong((id *)&self->_minuteUnit, 0);
  objc_storeStrong((id *)&self->_kcalUnit, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end