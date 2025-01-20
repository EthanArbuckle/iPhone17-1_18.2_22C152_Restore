@interface HKLiveWorkoutBuilder
- (BOOL)shouldCollectWorkoutEvents;
- (HKLiveWorkoutBuilder)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)configuration device:(HKDevice *)device;
- (HKLiveWorkoutBuilder)initWithHealthStore:(id)a3 builderConfiguration:(id)a4 builderIdentifier:(id)a5;
- (HKLiveWorkoutBuilder)initWithHealthStore:(id)a3 session:(id)a4 builderConfiguration:(id)a5 builderIdentifier:(id)a6;
- (HKLiveWorkoutDataSource)dataSource;
- (HKWorkoutActivity)currentWorkoutActivity;
- (HKWorkoutSession)workoutSession;
- (NSArray)additionalDataSources;
- (id)_privateDelegate;
- (id)delegate;
- (void)_resourceQueue_updateElapsedTimeCache;
- (void)_resourceQueue_updateEvents:(id)a3;
- (void)clientRemote_didBeginActivity:(id)a3;
- (void)clientRemote_didEndActivity:(id)a3;
- (void)clientRemote_didUpdateActivities:(id)a3;
- (void)clientRemote_didUpdateMetadata:(id)a3;
- (void)clientRemote_didUpdateStatistics:(id)a3;
- (void)connectionInterrupted;
- (void)setAdditionalDataSources:(id)a3;
- (void)setDataSource:(HKLiveWorkoutDataSource *)dataSource;
- (void)setDelegate:(id)delegate;
- (void)setShouldCollectWorkoutEvents:(BOOL)shouldCollectWorkoutEvents;
- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6;
@end

@implementation HKLiveWorkoutBuilder

- (HKLiveWorkoutBuilder)initWithHealthStore:(id)a3 session:(id)a4 builderConfiguration:(id)a5 builderIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [v10 identifier];
  [v12 setAssociatedSessionUUID:v14];

  v18.receiver = self;
  v18.super_class = (Class)HKLiveWorkoutBuilder;
  v15 = [(HKWorkoutBuilder *)&v18 initWithHealthStore:v13 builderConfiguration:v12 builderIdentifier:v11];

  if (v15)
  {
    objc_storeWeak((id *)&v15->_workoutSession, v10);
    additionalDataSources = v15->_additionalDataSources;
    v15->_additionalDataSources = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v15;
}

- (HKLiveWorkoutBuilder)initWithHealthStore:(id)a3 builderConfiguration:(id)a4 builderIdentifier:(id)a5
{
  return [(HKLiveWorkoutBuilder *)self initWithHealthStore:a3 session:0 builderConfiguration:a4 builderIdentifier:a5];
}

- (HKLiveWorkoutBuilder)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)configuration device:(HKDevice *)device
{
  v8 = device;
  v9 = configuration;
  id v10 = healthStore;
  id v11 = objc_alloc_init(HKWorkoutBuilderConfiguration);
  [(HKWorkoutBuilderConfiguration *)v11 setDevice:v8];

  [(HKWorkoutBuilderConfiguration *)v11 setWorkoutConfiguration:v9];
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [(HKLiveWorkoutBuilder *)self initWithHealthStore:v10 session:0 builderConfiguration:v11 builderIdentifier:v12];

  return v13;
}

- (BOOL)shouldCollectWorkoutEvents
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(HKWorkoutBuilder *)self resourceQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__HKLiveWorkoutBuilder_shouldCollectWorkoutEvents__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __50__HKLiveWorkoutBuilder_shouldCollectWorkoutEvents__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configuration];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 shouldCollectWorkoutEvents];
}

- (void)setShouldCollectWorkoutEvents:(BOOL)shouldCollectWorkoutEvents
{
  v5 = [(HKWorkoutBuilder *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke;
  v6[3] = &unk_1E58BDA20;
  v6[4] = self;
  BOOL v7 = shouldCollectWorkoutEvents;
  dispatch_sync(v5, v6);
}

void __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configuration];
  int v3 = [v2 shouldCollectWorkoutEvents];
  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    [v2 setShouldCollectWorkoutEvents:v4 != 0];
    [*(id *)(a1 + 32) setConfiguration:v2];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
    uint64_t v6 = [WeakRetained identifier];

    if (v6)
    {
      BOOL v7 = [*(id *)(a1 + 32) proxyProvider];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_2;
      v8[3] = &__block_descriptor_33_e43_v16__0___HKWorkoutBuilderServerInterface__8l;
      char v9 = *(unsigned char *)(a1 + 40);
      [v7 fetchProxyWithHandler:v8 errorHandler:&__block_literal_global_118];
    }
  }
}

uint64_t __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setShouldCollectEvents:", *(unsigned __int8 *)(a1 + 32));
}

void __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_3_cold_1();
  }
}

- (id)_privateDelegate
{
  id v2 = [(HKLiveWorkoutBuilder *)self delegate];
  if ([v2 conformsToProtocol:&unk_1EED53990]) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (HKWorkoutActivity)currentWorkoutActivity
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__52;
  id v11 = __Block_byref_object_dispose__52;
  id v12 = 0;
  int v3 = [(HKWorkoutBuilder *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HKLiveWorkoutBuilder_currentWorkoutActivity__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HKWorkoutActivity *)v4;
}

uint64_t __46__HKLiveWorkoutBuilder_currentWorkoutActivity__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_resourceQueue_updateElapsedTimeCache
{
  v9.receiver = self;
  v9.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v9 _resourceQueue_updateElapsedTimeCache];
  uint64_t v3 = [(HKLiveWorkoutBuilder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(HKWorkoutBuilder *)self healthStore];
    v5 = [v4 clientQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__HKLiveWorkoutBuilder__resourceQueue_updateElapsedTimeCache__block_invoke;
    v6[3] = &unk_1E58BBBD0;
    id v7 = v3;
    uint64_t v8 = self;
    dispatch_async(v5, v6);
  }
}

uint64_t __61__HKLiveWorkoutBuilder__resourceQueue_updateElapsedTimeCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutBuilderDidCollectEvent:*(void *)(a1 + 40)];
}

- (void)_resourceQueue_updateEvents:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v12 _resourceQueue_updateEvents:v4];
  v5 = [(HKLiveWorkoutBuilder *)self _privateDelegate];
  if (v5)
  {
    uint64_t v6 = [(HKWorkoutBuilder *)self healthStore];
    id v7 = [v6 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HKLiveWorkoutBuilder__resourceQueue_updateEvents___block_invoke;
    block[3] = &unk_1E58BB9C8;
    id v9 = v4;
    id v10 = v5;
    id v11 = self;
    dispatch_async(v7, block);
  }
}

void __52__HKLiveWorkoutBuilder__resourceQueue_updateEvents___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(a1 + 40), "workoutBuilder:didCollectEvent:", *(void *)(a1 + 48), *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setAdditionalDataSources:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKWorkoutBuilder *)self resourceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(a1 + 32) + 224)];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  id v4 = objc_msgSend(v3, "hk_minus:", v2);
  uint64_t v5 = objc_msgSend(v2, "hk_minus:", v3);
  id v6 = [*(id *)(a1 + 32) proxyProvider];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_2;
  v16 = &unk_1E58C8108;
  id v17 = v4;
  id v18 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 fetchProxyWithHandler:&v13 errorHandler:&__block_literal_global_76];

  long long v9 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithArray:", *(void *)(a1 + 40), v13, v14, v15, v16);
  uint64_t v10 = [v9 array];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 224);
  *(void *)(v11 + 224) = v10;
}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 allObjects];
  id v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_72_0);
  objc_msgSend(v4, "remote_addDataSourcesWithIdentifiers:", v6);

  id v8 = [*(id *)(a1 + 40) allObjects];
  id v7 = objc_msgSend(v8, "hk_map:", &__block_literal_global_74_0);
  objc_msgSend(v4, "remote_removeDataSourcesWithIdentifiers:", v7);
}

uint64_t __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1();
  }
}

- (NSArray)additionalDataSources
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__52;
  uint64_t v11 = __Block_byref_object_dispose__52;
  id v12 = 0;
  uint64_t v3 = [(HKWorkoutBuilder *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__HKLiveWorkoutBuilder_additionalDataSources__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __45__HKLiveWorkoutBuilder_additionalDataSources__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 224) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (HKLiveWorkoutDataSource)dataSource
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__52;
  uint64_t v11 = __Block_byref_object_dispose__52;
  id v12 = 0;
  uint64_t v3 = [(HKWorkoutBuilder *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HKLiveWorkoutBuilder_dataSource__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HKLiveWorkoutDataSource *)v4;
}

void __34__HKLiveWorkoutBuilder_dataSource__block_invoke(uint64_t a1)
{
}

- (void)setDataSource:(HKLiveWorkoutDataSource *)dataSource
{
  id v4 = dataSource;
  uint64_t v5 = [(HKWorkoutBuilder *)self resourceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HKLiveWorkoutBuilder_setDataSource___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2[27];
  if (v4 != v3)
  {
    if (v4)
    {
      uint64_t v5 = [v2 proxyProvider];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_2;
      v10[3] = &unk_1E58BBC98;
      v10[4] = *(void *)(a1 + 32);
      [v5 fetchProxyWithHandler:v10 errorHandler:&__block_literal_global_80_0];

      uint64_t v2 = *(id **)(a1 + 32);
      id v3 = *(id *)(a1 + 40);
    }
    if (v3)
    {
      id v6 = [v2 proxyProvider];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_81;
      v8[3] = &unk_1E58BBC98;
      id v9 = *(id *)(a1 + 40);
      [v6 fetchProxyWithHandler:v8 errorHandler:&__block_literal_global_84_0];

      uint64_t v2 = *(id **)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
    }
    else
    {
      uint64_t v7 = 0;
    }
    objc_storeStrong(v2 + 27, v7);
  }
}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 216);
  id v3 = a2;
  id v4 = [v2 identifier];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  objc_msgSend(v3, "remote_removeDataSourcesWithIdentifiers:", v5);
}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1();
  }
}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_81(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  objc_msgSend(v3, "remote_addDataSourcesWithIdentifiers:", v5);
}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_2_82(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1();
  }
}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HKWorkoutBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v14);

  v25.receiver = self;
  v25.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v25 stateMachine:v10 didEnterState:v11 date:v12 error:v13];
  if ([v11 index] == 3)
  {
    currentActivity = self->super._currentActivity;
    self->super._currentActivity = 0;

    [(HKLiveWorkoutDataSource *)self->_dataSource workoutBuilderDidFinish];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v16 = self->_additionalDataSources;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "workoutBuilderDidFinish", (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v18);
    }
  }
}

- (void)clientRemote_didUpdateStatistics:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v12 clientRemote_didUpdateStatistics:v4];
  uint64_t v5 = [(HKLiveWorkoutBuilder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HKWorkoutBuilder *)self healthStore];
    uint64_t v7 = [v6 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HKLiveWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke;
    block[3] = &unk_1E58BB9C8;
    id v9 = v5;
    id v10 = self;
    id v11 = v4;
    dispatch_async(v7, block);
  }
}

void __57__HKLiveWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) allTypes];
  [v1 workoutBuilder:v2 didCollectDataOfTypes:v3];
}

- (void)clientRemote_didUpdateMetadata:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v10 clientRemote_didUpdateMetadata:a3];
  id v4 = [(HKLiveWorkoutBuilder *)self _privateDelegate];
  if (v4)
  {
    uint64_t v5 = [(HKWorkoutBuilder *)self healthStore];
    id v6 = [v5 clientQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__HKLiveWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke;
    v7[3] = &unk_1E58BBBD0;
    id v8 = v4;
    id v9 = self;
    dispatch_async(v6, v7);
  }
}

uint64_t __55__HKLiveWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutBuilderDidChangeMetadata:*(void *)(a1 + 40)];
}

- (void)clientRemote_didBeginActivity:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v12 clientRemote_didBeginActivity:v4];
  uint64_t v5 = [(HKLiveWorkoutBuilder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HKWorkoutBuilder *)self healthStore];
    uint64_t v7 = [v6 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HKLiveWorkoutBuilder_clientRemote_didBeginActivity___block_invoke;
    block[3] = &unk_1E58BB9C8;
    id v9 = v5;
    objc_super v10 = self;
    id v11 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __54__HKLiveWorkoutBuilder_clientRemote_didBeginActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutBuilder:*(void *)(a1 + 40) didBeginActivity:*(void *)(a1 + 48)];
}

- (void)clientRemote_didEndActivity:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v12 clientRemote_didEndActivity:v4];
  uint64_t v5 = [(HKLiveWorkoutBuilder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HKWorkoutBuilder *)self healthStore];
    uint64_t v7 = [v6 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HKLiveWorkoutBuilder_clientRemote_didEndActivity___block_invoke;
    block[3] = &unk_1E58BB9C8;
    id v9 = v5;
    objc_super v10 = self;
    id v11 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __52__HKLiveWorkoutBuilder_clientRemote_didEndActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutBuilder:*(void *)(a1 + 40) didEndActivity:*(void *)(a1 + 48)];
}

- (void)clientRemote_didUpdateActivities:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v10 clientRemote_didUpdateActivities:a3];
  id v4 = [(HKLiveWorkoutBuilder *)self _privateDelegate];
  if (v4)
  {
    uint64_t v5 = [(HKWorkoutBuilder *)self healthStore];
    id v6 = [v5 clientQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__HKLiveWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke;
    v7[3] = &unk_1E58BBBD0;
    id v8 = v4;
    id v9 = self;
    dispatch_async(v6, v7);
  }
}

uint64_t __57__HKLiveWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutBuilderUpdateActivities:*(void *)(a1 + 40)];
}

- (void)connectionInterrupted
{
  id v3 = [(HKWorkoutBuilder *)self proxyProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke;
  v6[3] = &unk_1E58BBF38;
  void v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_104;
  v5[3] = &unk_1E58BBCC0;
  v5[4] = self;
  [v3 fetchProxyWithHandler:v6 errorHandler:v5];

  v4.receiver = self;
  v4.super_class = (Class)HKLiveWorkoutBuilder;
  [(HKWorkoutBuilder *)&v4 connectionInterrupted];
}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2;
  v6[3] = &unk_1E58BBBD0;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_INFO, "%{public}@: Recovering data sources after server interruption.", (uint8_t *)&v11, 0xCu);
  }
  objc_super v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "hk_map:", &__block_literal_global_102);
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 216);
  if (v7)
  {
    id v8 = [v7 identifier];
    [v5 addObject:v8];

    uint64_t v6 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v6 + 240));
  objc_super v10 = [WeakRetained identifier];

  if (v10) {
    [v5 addObject:v10];
  }
  objc_msgSend(*(id *)(a1 + 40), "remote_addDataSourcesWithIdentifiers:", v5);
}

uint64_t __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_100(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  objc_super v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_104_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (HKWorkoutSession)workoutSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutSession);

  return (HKWorkoutSession *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workoutSession);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalDataSources, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Unable to change should collecte events configuration property with error: %@", v2, v3, v4, v5, v6);
}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Unable to update workout builder server's data sources with error: %@", v2, v3, v4, v5, v6);
}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_104_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover data sources after connection invalidation: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end