@interface HKGymKitMetricsDataSource
+ (id)clientInterface;
+ (id)serverInterface;
- (HKGymKitMetricsDataSource)initWithHealthStore:(id)a3 workoutConfiguration:(id)a4;
- (HKGymKitMetricsDataSourceDelegate)delegate;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_startTaskServerIfNeededWithCompletion:(id)a3;
- (void)clientRemote_didReceiveMetrics:(id)a3;
- (void)connectionInterrupted;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)workoutBuilderDidFinish;
@end

@implementation HKGymKitMetricsDataSource

- (HKGymKitMetricsDataSource)initWithHealthStore:(id)a3 workoutConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKGymKitMetricsDataSource;
  v9 = [(HKGymKitMetricsDataSource *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v9->_workoutConfiguration, a4);
    v12 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v9->_healthStore taskIdentifier:@"HKGymKitMetricsDataSourceServerIdentifier" exportedObject:v9 taskUUID:v9->_identifier];
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v12;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke;
    v15[3] = &unk_1E58BBE28;
    v16 = v9;
    [(HKGymKitMetricsDataSource *)v16 _startTaskServerIfNeededWithCompletion:v15];
  }
  return v9;
}

void __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)workoutBuilderDidFinish
{
  self->_proxyProvider = 0;
  MEMORY[0x1F41817F8]();
}

- (void)clientRemote_didReceiveMetrics:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v5 = [(HKHealthStore *)self->_healthStore clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke;
  v7[3] = &unk_1E58C9CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v10, &to);
  v9 = self;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&to);
}

void __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke(uint64_t a1)
{
  v2 = +[HKUnit wattUnit];
  v3 = +[HKUnit unitFromString:@"J/s"];
  id v4 = *(void **)(a1 + 32);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke_2;
  v12 = &unk_1E58C9CB8;
  id v13 = v2;
  id v14 = v3;
  id v5 = v3;
  id v6 = v2;
  id v7 = objc_msgSend(v4, "hk_map:", &v9);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "gymKitMetricsDataSource:didReceiveMetrics:", *(void *)(a1 + 40), v7, v9, v10, v11, v12);
}

void __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a3;
  if ([v9 isCompatibleWithUnit:v8])
  {
    [v9 doubleValueForUnit:*(void *)(a1 + 32)];
    double v11 = v10;

    id v9 = +[HKQuantity quantityWithUnit:*(void *)(a1 + 40) doubleValue:v11];
  }
  v7[2](v7, v12, v9);
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53D50];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_clientRemote_didReceiveMetrics_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53DB0];
}

- (id)exportedInterface
{
  return +[HKGymKitMetricsDataSource clientInterface];
}

- (id)remoteInterface
{
  return +[HKGymKitMetricsDataSource serverInterface];
}

- (void)connectionInterrupted
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKGymKitMetricsDataSource *)self _startTaskServerIfNeededWithCompletion:v2];
}

void __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)_startTaskServerIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke;
  v9[3] = &unk_1E58C9D08;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "remote_startTaskServerIfNeeded");
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKGymKitMetricsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKGymKitMetricsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_23();
  OUTLINED_FUNCTION_1_9(&dword_19C023000, v5, v6, "%{public}@: Unable to start task server %@ with error: %@", v7, v8, v9, v10, v11);
}

void __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_23();
  OUTLINED_FUNCTION_1_9(&dword_19C023000, v5, v6, "%{public}@: Unable to fetch data source %@ proxy after interrupted connection with error: %@", v7, v8, v9, v10, v11);
}

@end