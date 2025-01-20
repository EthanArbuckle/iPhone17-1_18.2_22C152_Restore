@interface HKLiveWorkoutDataSource
+ (id)clientInterface;
+ (id)serverInterface;
- (BOOL)collectsDefaultTypes;
- (HKHealthStore)healthStore;
- (HKLiveWorkoutDataSource)initWithHealthStore:(HKHealthStore *)healthStore workoutConfiguration:(HKWorkoutConfiguration *)configuration;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSMutableDictionary)mutableFiltersBySampleType;
- (NSMutableSet)mutableSampleTypesToCollect;
- (NSSet)typesToCollect;
- (NSUUID)identifier;
- (OS_dispatch_queue)queue;
- (id)_queue_dataSourceConfiguration;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_queue_finishSetup;
- (void)clientRemote_didUpdateDataSourceConfiguration:(id)a3;
- (void)connectionInterrupted;
- (void)disableCollectionForType:(HKQuantityType *)quantityType;
- (void)enableCollectionForType:(HKQuantityType *)quantityType predicate:(NSPredicate *)predicate;
- (void)setCollectsDefaultTypes:(BOOL)a3;
- (void)setHealthStore:(id)a3;
- (void)setMutableFiltersBySampleType:(id)a3;
- (void)setMutableSampleTypesToCollect:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)unitTest_synchronizeWithCompletion:(id)a3;
- (void)workoutBuilderDidFinish;
@end

@implementation HKLiveWorkoutDataSource

- (HKLiveWorkoutDataSource)initWithHealthStore:(HKHealthStore *)healthStore workoutConfiguration:(HKWorkoutConfiguration *)configuration
{
  v7 = healthStore;
  v8 = configuration;
  v22.receiver = self;
  v22.super_class = (Class)HKLiveWorkoutDataSource;
  v9 = [(HKLiveWorkoutDataSource *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_healthStore, healthStore);
    uint64_t v12 = [(HKWorkoutConfiguration *)v8 copy];
    workoutConfiguration = v9->_workoutConfiguration;
    v9->_workoutConfiguration = (HKWorkoutConfiguration *)v12;

    v9->_collectsDefaultTypes = 1;
    uint64_t v14 = HKCreateSerialDispatchQueue(v9, @"queue");
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    v16 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v9->_healthStore taskIdentifier:@"HKLiveWorkoutDataSourceServerIdentifier" exportedObject:v9 taskUUID:v9->_identifier];
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v16;

    v18 = v9->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HKLiveWorkoutDataSource_initWithHealthStore_workoutConfiguration___block_invoke;
    block[3] = &unk_1E58BBA00;
    v21 = v9;
    dispatch_async(v18, block);
  }
  return v9;
}

uint64_t __68__HKLiveWorkoutDataSource_initWithHealthStore_workoutConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishSetup");
}

- (NSSet)typesToCollect
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__32;
  uint64_t v10 = __Block_byref_object_dispose__32;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HKLiveWorkoutDataSource_typesToCollect__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __41__HKLiveWorkoutDataSource_typesToCollect__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)enableCollectionForType:(HKQuantityType *)quantityType predicate:(NSPredicate *)predicate
{
  uint64_t v6 = quantityType;
  v7 = predicate;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  uint64_t v12 = v6;
  v13 = v7;
  v9 = v7;
  uint64_t v10 = v6;
  dispatch_async(queue, block);
}

void __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    v4 = objc_msgSend(v2, "hk_filterRepresentationForDataTypes:", v3);
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_dataSourceConfiguration");
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_2;
  v10[3] = &unk_1E58C4AA8;
  id v11 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3;
  v9[3] = &unk_1E58BBCC0;
  v9[4] = v6;
  id v8 = v5;
  [v7 fetchProxyWithHandler:v10 errorHandler:v9];
}

uint64_t __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDataSourceConfiguration:", *(void *)(a1 + 32));
}

void __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3_cold_1();
  }
}

- (void)disableCollectionForType:(HKQuantityType *)quantityType
{
  v4 = quantityType;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  uint64_t v6 = v4;
  dispatch_async(queue, v7);
}

void __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_dataSourceConfiguration");
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_2;
  v7[3] = &unk_1E58C4AA8;
  id v8 = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_3;
  v6[3] = &unk_1E58BBCC0;
  v6[4] = v3;
  id v5 = v2;
  [v4 fetchProxyWithHandler:v7 errorHandler:v6];
}

uint64_t __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDataSourceConfiguration:", *(void *)(a1 + 32));
}

void __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3_cold_1();
  }
}

- (id)_queue_dataSourceConfiguration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [HKWorkoutDataSourceConfiguration alloc];
  workoutConfiguration = self->_workoutConfiguration;
  mutableSampleTypesToCollect = self->_mutableSampleTypesToCollect;
  mutableFiltersBySampleType = self->_mutableFiltersBySampleType;
  v7 = [MEMORY[0x1E4F1CAD0] set];
  id v8 = [(HKWorkoutDataSourceConfiguration *)v3 initWithWorkoutConfiguration:workoutConfiguration sampleTypesToCollect:mutableSampleTypesToCollect filters:mutableFiltersBySampleType eventTypesToCollect:v7 collectsDefaultTypes:self->_collectsDefaultTypes];

  return v8;
}

- (void)workoutBuilderDidFinish
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HKLiveWorkoutDataSource_workoutBuilderDidFinish__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __50__HKLiveWorkoutDataSource_workoutBuilderDidFinish__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)unitTest_synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_2;
  v5[3] = &unk_1E58C4AD0;
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_3;
  v3[3] = &unk_1E58BBD88;
  id v4 = *(id *)(a1 + 40);
  [v2 fetchProxyWithHandler:v5 errorHandler:v3];
}

uint64_t __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_synchronizeWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53090];
}

+ (id)serverInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED530F0];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_remote_setDataSourceConfiguration_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)exportedInterface
{
  return +[HKLiveWorkoutDataSource clientInterface];
}

- (id)remoteInterface
{
  return +[HKLiveWorkoutDataSource serverInterface];
}

- (void)connectionInterrupted
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_dataSourceConfiguration");
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_2;
  v7[3] = &unk_1E58C4AA8;
  id v8 = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3;
  v6[3] = &unk_1E58BBCC0;
  v6[4] = v3;
  id v5 = v2;
  [v4 fetchProxyWithHandler:v7 errorHandler:v6];
}

uint64_t __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDataSourceConfiguration:", *(void *)(a1 + 32));
}

void __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3_cold_1();
  }
}

- (void)clientRemote_didUpdateDataSourceConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HKLiveWorkoutDataSource_clientRemote_didUpdateDataSourceConfiguration___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __73__HKLiveWorkoutDataSource_clientRemote_didUpdateDataSourceConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) sampleTypesToCollect];
  uint64_t v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v3;

  id v9 = [*(id *)(a1 + 40) filtersBySampleType];
  uint64_t v6 = [v9 mutableCopy];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v6;
}

- (void)_queue_finishSetup
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error getting activity mode %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke_2_cold_1();
  }
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)mutableSampleTypesToCollect
{
  return self->_mutableSampleTypesToCollect;
}

- (void)setMutableSampleTypesToCollect:(id)a3
{
}

- (NSMutableDictionary)mutableFiltersBySampleType
{
  return self->_mutableFiltersBySampleType;
}

- (void)setMutableFiltersBySampleType:(id)a3
{
}

- (BOOL)collectsDefaultTypes
{
  return self->_collectsDefaultTypes;
}

- (void)setCollectsDefaultTypes:(BOOL)a3
{
  self->_collectsDefaultTypes = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mutableFiltersBySampleType, 0);
  objc_storeStrong((id *)&self->_mutableSampleTypesToCollect, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

void __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Unable to set data source %@ configuration with error: %@");
}

void __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Unable to fetch data source %@ proxy after interrupted connection with error: %@");
}

void __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Unable to start task server %@ with error: %@");
}

@end