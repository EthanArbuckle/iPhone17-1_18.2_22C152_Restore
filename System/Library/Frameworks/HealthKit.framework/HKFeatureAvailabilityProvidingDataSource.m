@interface HKFeatureAvailabilityProvidingDataSource
- (HKFeatureAvailabilityHealthDataSource)healthDataSource;
- (HKFeatureAvailabilityProvidingDataSource)initWithHealthDataSource:(id)a3;
- (NSMutableDictionary)featureAvailabilityProvidingByFeatureIdentifier;
- (OS_dispatch_queue)observationQueue;
- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (os_unfair_lock_s)lock;
- (void)setKnownFeatureAvailabilityProviding:(id)a3;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
@end

@implementation HKFeatureAvailabilityProvidingDataSource

- (HKFeatureAvailabilityProvidingDataSource)initWithHealthDataSource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKFeatureAvailabilityProvidingDataSource;
  v5 = [(HKObserverBridge *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_healthDataSource, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    featureAvailabilityProvidingByFeatureIdentifier = v6->_featureAvailabilityProvidingByFeatureIdentifier;
    v6->_featureAvailabilityProvidingByFeatureIdentifier = (NSMutableDictionary *)v7;

    uint64_t v9 = HKCreateSerialDispatchQueue(v6, 0);
    observationQueue = v6->_observationQueue;
    v6->_observationQueue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (void)setKnownFeatureAvailabilityProviding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 featureIdentifier];
    os_unfair_lock_lock(&self->_lock);
    uint64_t v7 = [(NSMutableDictionary *)self->_featureAvailabilityProvidingByFeatureIdentifier objectForKeyedSubscript:v6];

    if (!v7) {
      [(NSMutableDictionary *)self->_featureAvailabilityProvidingByFeatureIdentifier setObject:v5 forKeyedSubscript:v6];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HKFeatureAvailabilityProvidingDataSource setKnownFeatureAvailabilityProviding:]();
    }
  }
}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthDataSource);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained requiresWeakRetention])
    {
      uint64_t v7 = [v6 featureAvailabilityProvidingForFeatureIdentifier:v4];
      os_unfair_lock_lock(&self->_lock);
      v8 = [(NSMutableDictionary *)self->_featureAvailabilityProvidingByFeatureIdentifier objectForKeyedSubscript:v4];

      if (v8)
      {
LABEL_14:

        goto LABEL_15;
      }
      if (!v7)
      {
        _HKInitializeLogging();
        uint64_t v9 = HKLogInfrastructure();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          [(HKFeatureAvailabilityProvidingDataSource *)(uint64_t)self featureAvailabilityProvidingForFeatureIdentifier:v9];
        }

        goto LABEL_14;
      }
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      objc_super v12 = [(NSMutableDictionary *)self->_featureAvailabilityProvidingByFeatureIdentifier objectForKeyedSubscript:v4];

      if (v12)
      {
LABEL_15:
        v11 = [(NSMutableDictionary *)self->_featureAvailabilityProvidingByFeatureIdentifier objectForKeyedSubscript:v4];
        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_16;
      }
      uint64_t v7 = [v6 featureAvailabilityProvidingForFeatureIdentifier:v4];
    }
    [(NSMutableDictionary *)self->_featureAvailabilityProvidingByFeatureIdentifier setObject:v7 forKeyedSubscript:v4];
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v10 = HKLogInfrastructure();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[HKFeatureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:]();
  }

  v11 = 0;
LABEL_16:

  return v11;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HKFeatureAvailabilityProvidingDataSource *)self featureAvailabilityProvidingForFeatureIdentifier:a3];
  v8 = [[_HKFeatureAvailabilityProvidingObserverBridge alloc] initWithHandle:v6];

  [v7 registerObserver:v8 queue:self->_observationQueue];

  return v8;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(HKFeatureAvailabilityProvidingDataSource *)self featureAvailabilityProvidingForFeatureIdentifier:a4];
  [v7 unregisterObserver:v6];
}

- (HKFeatureAvailabilityHealthDataSource)healthDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthDataSource);

  return (HKFeatureAvailabilityHealthDataSource *)WeakRetained;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)featureAvailabilityProvidingByFeatureIdentifier
{
  return self->_featureAvailabilityProvidingByFeatureIdentifier;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationQueue, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvidingByFeatureIdentifier, 0);

  objc_destroyWeak((id *)&self->_healthDataSource);
}

- (void)setKnownFeatureAvailabilityProviding:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_4(&dword_19C023000, v1, v2, "[%{public}@]: Given nil featureAvailabilityProviding in -setKnownFeatureAvailabilityProviding:", v3, v4, v5, v6, 2u);
}

- (void)featureAvailabilityProvidingForFeatureIdentifier:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_4(&dword_19C023000, v1, v2, "[%{public}@]: Health data source is nil", v3, v4, v5, v6, 2u);
}

- (void)featureAvailabilityProvidingForFeatureIdentifier:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_fault_impl(&dword_19C023000, a3, OS_LOG_TYPE_FAULT, "[%{public}@]: Unknown feature identifier %{public}@", (uint8_t *)&v6, 0x16u);
}

@end