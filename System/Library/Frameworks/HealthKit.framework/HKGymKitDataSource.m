@interface HKGymKitDataSource
+ (id)clientInterface;
+ (id)defaultConfigurationWithWorkoutConfiguration:(id)a3;
+ (id)serverInterface;
- (HKGymKitDataSource)initWithHealthStore:(id)a3 workoutConfiguration:(id)a4;
- (HKHealthStore)healthStore;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_startTaskServerIfNeeded;
- (void)connectionInterrupted;
- (void)setHealthStore:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)workoutBuilderDidFinish;
@end

@implementation HKGymKitDataSource

- (HKGymKitDataSource)initWithHealthStore:(id)a3 workoutConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKGymKitDataSource;
  v9 = [(HKGymKitDataSource *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_healthStore, a3);
    v12 = +[HKGymKitDataSource defaultConfigurationWithWorkoutConfiguration:v8];
    v13 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v9->_healthStore taskIdentifier:@"HKGymKitDataSourceServerIdentifier" exportedObject:v9 taskUUID:v9->_identifier];
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v13;

    [(HKTaskServerProxyProvider *)v9->_proxyProvider setTaskConfiguration:v12];
    [(HKGymKitDataSource *)v9 _startTaskServerIfNeeded];
  }
  return v9;
}

+ (id)defaultConfigurationWithWorkoutConfiguration:(id)a3
{
  id v3 = a3;
  v4 = +[HKWorkoutDataSource observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:](HKWorkoutDataSource, "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", [v3 activityType], objc_msgSend(v3, "locationType") == 2, 1, 1);
  v5 = [HKWorkoutDataSourceConfiguration alloc];
  v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [(HKWorkoutDataSourceConfiguration *)v5 initWithWorkoutConfiguration:v3 sampleTypesToCollect:v4 filters:MEMORY[0x1E4F1CC08] eventTypesToCollect:v6 collectsDefaultTypes:1];

  return v7;
}

- (void)workoutBuilderDidFinish
{
  self->_proxyProvider = 0;
  MEMORY[0x1F41817F8]();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52070];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED520D0];
}

- (id)exportedInterface
{
  return +[HKGymKitDataSource clientInterface];
}

- (id)remoteInterface
{
  return +[HKGymKitDataSource serverInterface];
}

- (void)connectionInterrupted
{
  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2;
  v3[3] = &unk_1E58BBCC0;
  v3[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_13 errorHandler:v3];
}

uint64_t __43__HKGymKitDataSource_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2_cold_1();
  }
}

- (void)_startTaskServerIfNeeded
{
  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2;
  v3[3] = &unk_1E58BBCC0;
  v3[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_60 errorHandler:v3];
}

uint64_t __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2_cold_1();
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

void __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "HKGymKitDataSource: Unable to fetch data source %@ proxy after interrupted connection with error: %@");
}

void __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "HKGymKitDataSource: Unable to start task server %@ with error: %@");
}

@end