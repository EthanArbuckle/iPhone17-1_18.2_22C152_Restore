@interface _HKBackgroundObservationExtensionRemoteContext
- (HKBackgroundObservationExtension)extensionInstance;
- (_HKBackgroundObservationExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)backgroundObservationExtensionTimeWillExpire;
- (void)didReceiveUpdateForSampleType:(id)a3 completionHandler:(id)a4;
- (void)performCleanup;
- (void)setExtensionInstance:(id)a3;
@end

@implementation _HKBackgroundObservationExtensionRemoteContext

- (_HKBackgroundObservationExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)_HKBackgroundObservationExtensionRemoteContext;
  v5 = [(_HKBackgroundObservationExtensionRemoteContext *)&v8 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogBackgroundUpdates;
    if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEBUG)) {
      -[_HKBackgroundObservationExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:](v6, v5);
    }
  }
  return v5;
}

- (void)performCleanup
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = [(_HKBackgroundObservationExtensionRemoteContext *)self _UUID];
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "HealthKit app extension cleaning up for UUID: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(_HKBackgroundObservationExtensionRemoteContext *)self setExtensionInstance:0];
  [(_HKBackgroundObservationExtensionRemoteContext *)self completeRequestReturningItems:0 completionHandler:0];
}

- (void)didReceiveUpdateForSampleType:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  uint64_t v8 = [(_HKBackgroundObservationExtensionRemoteContext *)self extensionInstance];
  _HKInitializeLogging();
  v9 = (void *)HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = [(_HKBackgroundObservationExtensionRemoteContext *)self _UUID];
    int v12 = 138543618;
    v13 = v11;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_INFO, "HealthKit app extension with UUID: %{public}@ did receive update for sample type: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if (v8) {
    [v8 didReceiveUpdateForSampleType:v6 completionHandler:v7];
  }
  else {
    v7[2](v7);
  }
}

- (void)backgroundObservationExtensionTimeWillExpire
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = [(_HKBackgroundObservationExtensionRemoteContext *)self _UUID];
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "HealthKit app extension with UUID: %{public}@ will time out", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(_HKBackgroundObservationExtensionRemoteContext *)self extensionInstance];
  [v6 backgroundObservationExtensionTimeWillExpire];
}

- (HKBackgroundObservationExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithInputItems:(void *)a1 listenerEndpoint:(void *)a2 contextUUID:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = [a2 _UUID];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_debug_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEBUG, "HealthKit app extension context initialized for UUID: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end