@interface _HKFeatureAvailabilityProvidingObserverBridge
- (HKObserverBridgeHandle)handle;
- (_HKFeatureAvailabilityProvidingObserverBridge)initWithHandle:(id)a3;
- (void)_notifyObserversWithFeatureAvailabilityProviding:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3;
@end

@implementation _HKFeatureAvailabilityProvidingObserverBridge

- (_HKFeatureAvailabilityProvidingObserverBridge)initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKFeatureAvailabilityProvidingObserverBridge;
  v6 = [(_HKFeatureAvailabilityProvidingObserverBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v7;
}

- (void)_notifyObserversWithFeatureAvailabilityProviding:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  id v5 = [v4 featureOnboardingRecordWithError:&v12];
  id v6 = v12;
  if (v5)
  {
    handle = self->_handle;
    v8 = [v4 featureIdentifier];
    [(HKObserverBridgeHandle *)handle notifyObserversOfChangeForKey:v8 newValue:v5];
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_super v9 = objc_opt_class();
      id v10 = v9;
      v11 = [v4 featureIdentifier];
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_error_impl(&dword_19C023000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Error retrieving onboarding record for %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 featureIdentifier];
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed setting update for %{public}@, notifying observers", (uint8_t *)&v9, 0x16u);
  }
  [(_HKFeatureAvailabilityProvidingObserverBridge *)self _notifyObserversWithFeatureAvailabilityProviding:v4];
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 featureIdentifier];
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed onboarding completion update for %{public}@, notifying observers", (uint8_t *)&v9, 0x16u);
  }
  [(_HKFeatureAvailabilityProvidingObserverBridge *)self _notifyObserversWithFeatureAvailabilityProviding:v4];
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 featureIdentifier];
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed paired device capability update for %{public}@, notifying observers", (uint8_t *)&v9, 0x16u);
  }
  [(_HKFeatureAvailabilityProvidingObserverBridge *)self _notifyObserversWithFeatureAvailabilityProviding:v4];
}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end