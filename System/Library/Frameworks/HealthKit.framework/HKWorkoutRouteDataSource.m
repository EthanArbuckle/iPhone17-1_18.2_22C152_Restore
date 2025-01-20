@interface HKWorkoutRouteDataSource
+ (id)clientInterface;
+ (id)serverIdentifier;
+ (id)serverInterface;
- (HKTaskServerProxyProvider)proxyProvider;
- (HKWorkoutRouteDataSource)initWithWorkoutSession:(id)a3;
- (HKWorkoutRouteDataSourceDelegate)delegate;
- (NSUUID)identifier;
- (NSUUID)sessionIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)clientRemote_didUpdateAltitude:(id)a3;
- (void)clientRemote_didUpdateElevation:(id)a3;
- (void)clientRemote_didUpdateRoute:(id)a3;
- (void)connectionInterrupted;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)workoutBuilderDidFinish;
@end

@implementation HKWorkoutRouteDataSource

- (HKWorkoutRouteDataSource)initWithWorkoutSession:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKWorkoutRouteDataSource;
  v5 = [(HKWorkoutRouteDataSource *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 identifier];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v8;

    v10 = [HKTaskServerProxyProvider alloc];
    v11 = [v4 healthStore];
    v12 = [(id)objc_opt_class() serverIdentifier];
    uint64_t v13 = [(HKTaskServerProxyProvider *)v10 initWithHealthStore:v11 taskIdentifier:v12 exportedObject:v5 taskUUID:v5->_identifier];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v13;

    v15 = v5->_proxyProvider;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke;
    v19[3] = &unk_1E58C6720;
    v20 = v5;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2;
    v17[3] = &unk_1E58BBCC0;
    v18 = v20;
    [(HKProxyProvider *)v15 fetchProxyWithHandler:v19 errorHandler:v17];
  }
  return v5;
}

uint64_t __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupWithSessionIdentifier:", *(void *)(*(void *)(a1 + 32) + 24));
}

void __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2_cold_1();
  }
}

+ (id)serverIdentifier
{
  return @"HKWorkoutRouteDataSourceServerIdentifier";
}

- (void)workoutBuilderDidFinish
{
  self->_proxyProvider = 0;
  MEMORY[0x1F41817F8]();
}

- (void)clientRemote_didUpdateElevation:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained workoutRouteDataSourceDidUpdateElevation:v4];
}

- (void)clientRemote_didUpdateRoute:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained workoutRouteDataSourceDidUpdateRoute:v4];
}

- (void)clientRemote_didUpdateAltitude:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 workoutRouteDataSource:self didUpdateAltitude:v7];
  }
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED1E918];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED537B0];
}

- (id)exportedInterface
{
  return +[HKWorkoutRouteDataSource clientInterface];
}

- (id)remoteInterface
{
  return +[HKWorkoutRouteDataSource serverInterface];
}

- (void)connectionInterrupted
{
  proxyProvider = self->_proxyProvider;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke;
  v4[3] = &unk_1E58C6720;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2;
  v3[3] = &unk_1E58BBCC0;
  v3[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v4 errorHandler:v3];
}

uint64_t __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupWithSessionIdentifier:", *(void *)(*(void *)(a1 + 32) + 24));
}

void __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2_cold_1();
  }
}

- (HKWorkoutRouteDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKWorkoutRouteDataSourceDelegate *)WeakRetained;
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

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Unable to setup workout route data source %@ with error: %{public}@");
}

void __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Unable to fetch workout route data source %@ proxy after interrupted connection with error: %{public}@");
}

@end