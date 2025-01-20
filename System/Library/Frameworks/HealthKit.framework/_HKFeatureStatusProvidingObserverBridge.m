@interface _HKFeatureStatusProvidingObserverBridge
- (HKFeatureIdentifierAndContext)featureIdentifierAndContext;
- (HKObserverBridgeHandle)handle;
- (_HKFeatureStatusProvidingObserverBridge)initWithFeatureIdentifierAndContext:(id)a3 handle:(id)a4;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
@end

@implementation _HKFeatureStatusProvidingObserverBridge

- (_HKFeatureStatusProvidingObserverBridge)initWithFeatureIdentifierAndContext:(id)a3 handle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKFeatureStatusProvidingObserverBridge;
  v9 = [(_HKFeatureStatusProvidingObserverBridge *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifierAndContext, a3);
    objc_storeStrong((id *)&v10->_handle, a4);
  }

  return v10;
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  v6 = HKLogInfrastructure();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    id v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_HKFeatureStatusProvidingObserverBridge featureStatusProviding:didUpdateFeatureStatus:]((uint64_t)self, v8);
    }
  }
  [(HKObserverBridgeHandle *)self->_handle notifyObserversOfChangeForKey:self->_featureIdentifierAndContext newValue:v5];
}

- (HKFeatureIdentifierAndContext)featureIdentifierAndContext
{
  return self->_featureIdentifierAndContext;
}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_featureIdentifierAndContext, 0);
}

- (void)featureStatusProviding:(uint64_t)a1 didUpdateFeatureStatus:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 8);
  int v7 = 138543618;
  id v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  id v6 = v4;
  _os_log_debug_impl(&dword_19C023000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@]: Observed feature status update for %{public}@, notifying observers", (uint8_t *)&v7, 0x16u);
}

@end