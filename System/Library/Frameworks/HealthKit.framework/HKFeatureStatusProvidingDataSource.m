@interface HKFeatureStatusProvidingDataSource
- (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSource;
- (HKFeatureStatusProvidingDataSource)init;
- (NSMutableDictionary)featureStatusProvidingByFeatureIdentifierAndContext;
- (OS_dispatch_queue)observationQueue;
- (id)_featureStatusProvidingForFeatureIdentifierAndContext:(id)a3;
- (id)_makeFeatureStatusProviderForFeatureIdentifier:(id)a3 context:(id)a4 dataSource:(id)a5;
- (id)featureStatusProvidingForFeatureIdentifier:(id)a3 context:(id)a4;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (os_unfair_lock_s)lock;
- (void)setDataSource:(id)a3;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
@end

@implementation HKFeatureStatusProvidingDataSource

- (HKFeatureStatusProvidingDataSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureStatusProvidingDataSource;
  v2 = [(HKObserverBridge *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    featureStatusProvidingByFeatureIdentifierAndContext = v3->_featureStatusProvidingByFeatureIdentifierAndContext;
    v3->_featureStatusProvidingByFeatureIdentifierAndContext = (NSMutableDictionary *)v4;

    uint64_t v6 = HKCreateSerialDispatchQueue(v3, 0);
    observationQueue = v3->_observationQueue;
    v3->_observationQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (id)featureStatusProvidingForFeatureIdentifier:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HKFeatureIdentifierAndContext alloc] initWithFeatureIdentifier:v7 context:v6];

  objc_super v9 = [(HKFeatureStatusProvidingDataSource *)self _featureStatusProvidingForFeatureIdentifierAndContext:v8];

  return v9;
}

- (id)_featureStatusProvidingForFeatureIdentifierAndContext:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    id v7 = [(NSMutableDictionary *)self->_featureStatusProvidingByFeatureIdentifierAndContext objectForKeyedSubscript:v4];

    if (!v7)
    {
      v8 = [v4 featureIdentifier];
      objc_super v9 = [v4 context];
      v10 = [(HKFeatureStatusProvidingDataSource *)self _makeFeatureStatusProviderForFeatureIdentifier:v8 context:v9 dataSource:WeakRetained];

      [(NSMutableDictionary *)self->_featureStatusProvidingByFeatureIdentifierAndContext setObject:v10 forKeyedSubscript:v4];
    }
    v11 = [(NSMutableDictionary *)self->_featureStatusProvidingByFeatureIdentifierAndContext objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    _HKInitializeLogging();
    v12 = HKLogInfrastructure();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HKFeatureStatusProvidingDataSource _featureStatusProvidingForFeatureIdentifierAndContext:]((uint64_t)self, v12);
    }

    os_unfair_lock_unlock(&self->_lock);
    v11 = 0;
  }

  return v11;
}

- (id)_makeFeatureStatusProviderForFeatureIdentifier:(id)a3 context:(id)a4 dataSource:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  v10 = [v8 setWithObject:a4];
  v11 = +[HKFeatureAvailabilityContextConstraint onlySomeContexts:v10];

  v12 = [v7 featureAvailabilityProvidingDataSource];
  v13 = [v12 featureAvailabilityProvidingForFeatureIdentifier:v9];

  if (v13)
  {
    v14 = +[HKFeatureStatusManager childFeatureStatusManagerWithFeatureAvailabilityProviding:v13 featureAvailabilityDataSource:v7 contextConstraint:v11];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HKFeatureStatusProvidingDataSource *)self _featureStatusProvidingForFeatureIdentifierAndContext:v7];
  id v9 = [[_HKFeatureStatusProvidingObserverBridge alloc] initWithFeatureIdentifierAndContext:v7 handle:v6];

  [v8 registerObserver:v9 queue:self->_observationQueue];

  return v9;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(HKFeatureStatusProvidingDataSource *)self _featureStatusProvidingForFeatureIdentifierAndContext:a4];
  [v7 unregisterObserver:v6];
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)featureStatusProvidingByFeatureIdentifierAndContext
{
  return self->_featureStatusProvidingByFeatureIdentifierAndContext;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationQueue, 0);
  objc_storeStrong((id *)&self->_featureStatusProvidingByFeatureIdentifierAndContext, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)_featureStatusProvidingForFeatureIdentifierAndContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "[%{public}@]: Data source is nil", (uint8_t *)&v4, 0xCu);
}

@end