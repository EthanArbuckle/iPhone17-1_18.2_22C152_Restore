@interface HDHeartbeatSeriesFeatureStatusManagerServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDHeartbeatSeriesFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_clientRemoteObjectProxy;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)heartbeatSeriesFeatureStatusManager:(id)a3 didFailToUpdateWithError:(id)a4;
- (void)heartbeatSeriesFeatureStatusManager:(id)a3 didUpdatePredominantFeature:(int64_t)a4;
- (void)remote_startObservingChangesWithCompletion:(id)a3;
- (void)remote_stopObservingChanges;
- (void)remote_updateAndNotifyAllObservers;
@end

@implementation HDHeartbeatSeriesFeatureStatusManagerServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x1E4F67D70]];

  if (v16)
  {
    v17 = [[HDHeartbeatSeriesFeatureStatusManagerServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"No profile extension found for %@", objc_opt_class());
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

- (HDHeartbeatSeriesFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDHeartbeatSeriesFeatureStatusManagerServer;
  id v11 = [(HDStandardTaskServer *)&v15 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    id v12 = [[HDHeartbeatSeriesFeatureStatusManager alloc] initWithClient:v10];
    manager = v11->_manager;
    v11->_manager = v12;
  }
  return v11;
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  manager = self->_manager;
  id v5 = a3;
  [(HDHeartbeatSeriesFeatureStatusManager *)manager startObservingChangesWithDelegate:self];
  [(HDHeartbeatSeriesFeatureStatusManager *)self->_manager getPredominantFeatureWithCompletion:v5];
}

- (void)remote_stopObservingChanges
{
}

- (void)remote_updateAndNotifyAllObservers
{
}

- (void)heartbeatSeriesFeatureStatusManager:(id)a3 didUpdatePredominantFeature:(int64_t)a4
{
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG)) {
    -[HDHeartbeatSeriesFeatureStatusManagerServer heartbeatSeriesFeatureStatusManager:didUpdatePredominantFeature:](v6);
  }
  v7 = [(HDHeartbeatSeriesFeatureStatusManagerServer *)self _clientRemoteObjectProxy];
  objc_msgSend(v7, "client_heartbeatSeriesFeatureStatusManagerDidUpdatePredominantFeature:", a4);
}

- (void)heartbeatSeriesFeatureStatusManager:(id)a3 didFailToUpdateWithError:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG)) {
    -[HDHeartbeatSeriesFeatureStatusManagerServer heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:](v6, (uint64_t)self, (uint64_t)v5);
  }
  v7 = [(HDHeartbeatSeriesFeatureStatusManagerServer *)self _clientRemoteObjectProxy];
  objc_msgSend(v7, "client_heartbeatSeriesFeatureStatusManagerDidFailToUpdateWithError:", v5);
}

- (id)_clientRemoteObjectProxy
{
  v2 = [(HDStandardTaskServer *)self client];
  v3 = [v2 connection];
  v4 = [v3 remoteObjectProxy];

  return v4;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F4121768](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F4121760](self, a2);
}

+ (id)requiredEntitlements
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F29E88];
  v5[0] = *MEMORY[0x1E4F29E48];
  v5[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F67E28] taskIdentifier];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)heartbeatSeriesFeatureStatusManager:(void *)a1 didUpdatePredominantFeature:.cold.1(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = v2;
  v4 = NSStringFromHKHeartbeatSeriesFeature();
  id v5 = HKSensitiveLogItem();
  int v6 = 138543618;
  v7 = v2;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1D3AC6000, v1, OS_LOG_TYPE_DEBUG, "[%{public}@] Received notification of predominant feature update: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)heartbeatSeriesFeatureStatusManager:(uint64_t)a3 didFailToUpdateWithError:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_debug_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Received notification of update error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end