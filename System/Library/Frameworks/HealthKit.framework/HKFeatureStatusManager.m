@interface HKFeatureStatusManager
+ (id)childFeatureStatusManagerWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4 contextConstraint:(id)a5;
- (BOOL)isObserving;
- (HKFeatureAvailabilityContextConstraint)contextConstraint;
- (HKFeatureAvailabilityProviding)featureAvailabilityProviding;
- (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSource;
- (HKFeatureAvailabilityRequirementEvaluationDataSource)strongDataSource;
- (HKFeatureAvailabilityRequirementEvaluationDataSource)weakDataSource;
- (HKFeatureAvailabilityRequirementSet)requirements;
- (HKFeatureStatus)_queue_featureStatusWithEvaluationContext:(void *)a3 requirements:(void *)a4 overrides:(void *)a5 error:;
- (HKFeatureStatus)currentFeatureStatus;
- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4;
- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4 contextConstraint:(id)a5;
- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4;
- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4 countryCodeSource:(int64_t)a5;
- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4 currentCountryCode:(id)a5;
- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4;
- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 cachingDefaults:(id)a5;
- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 contextConstraint:(id)a5;
- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 countryCodeSource:(int64_t)a5;
- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 currentCountryCode:(id)a5;
- (HKObserverSet)observers;
- (NSString)description;
- (NSString)featureIdentifier;
- (OS_dispatch_queue)queue;
- (_HKDelayedOperation)notifyObserversOperation;
- (id)_queue_updateFeatureStatusWithRequestDrivenByObservation:(void *)a3 error:;
- (id)_requirementSatisfactionOverrides;
- (id)featureStatusWithError:(id *)a3;
- (void)__unregisterForFeatureStatusChanges;
- (void)_notifyObserversWithFeatureStatus:(uint64_t)a1;
- (void)_queue_attemptFeatureStatusUpdateDrivenByObservation;
- (void)_queue_registerForFeatureStatusChanges;
- (void)_queue_unregisterForFeatureStatusChanges;
- (void)_registerForRequirementSatisfactionOverrideChangesForRequirements:(id *)a1;
- (void)_updateOverriddenSatisfactionOfRequirement:(void *)a3 overriddenSatisfaction:;
- (void)_updateSatisfactionOfRequirement:(char)a3 isSatisfied:;
- (void)dealloc;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3;
- (void)featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)setCurrentFeatureStatus:(id)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setNotifyObserversOperation:(id)a3;
- (void)setRequirements:(id)a3;
- (void)setStrongDataSource:(id)a3;
- (void)setWeakDataSource:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKFeatureStatusManager

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4
{
  return [(HKFeatureStatusManager *)self initWithFeatureIdentifier:a3 healthStore:a4 countryCodeSource:0];
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 currentCountryCode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 featureAvailabilityProvidingForFeatureIdentifier:a3];
  v11 = [[HKFixedCurrentCountryCodeProvider alloc] initWithCountryCode:v8];

  v12 = +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:v9 currentCountryCodeProvider:v11];

  v13 = [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:v10 featureAvailabilityDataSource:v12];
  return v13;
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 countryCodeSource:(int64_t)a5
{
  id v8 = a4;
  id v9 = [v8 featureAvailabilityProvidingForFeatureIdentifier:a3];
  v10 = [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:v9 healthDataSource:v8 countryCodeSource:a5];

  return v10;
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 cachingDefaults:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 featureAvailabilityProvidingForFeatureIdentifier:a3];
  v11 = [[HKFixedCurrentCountryCodeProvider alloc] initWithCountryCode:0];
  v12 = [[HKFeatureOnboardingRecordInaccessibilityCache alloc] initWithCachingDefaults:v8];

  v13 = +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:v9 currentCountryCodeProvider:v11 onboardingRecordFallbackProvider:v12];

  v14 = [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:v10 featureAvailabilityDataSource:v13];
  return v14;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4
{
  return [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:a3 healthDataSource:a4 countryCodeSource:0];
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4 currentCountryCode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[HKFixedCurrentCountryCodeProvider alloc] initWithCountryCode:v8];

  v12 = +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:v9 currentCountryCodeProvider:v11];

  v13 = [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:v10 featureAvailabilityDataSource:v12];
  return v13;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 healthDataSource:(id)a4 countryCodeSource:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (a5 == 1)
  {
    v13 = HKPreferredRegulatoryDomainProvider();
    id v14 = +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:v11 currentCountryCodeProvider:v13];
  }
  else
  {
    if (a5)
    {
LABEL_8:
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"HKFeatureStatusManager.m" lineNumber:143 description:@"Unexpected country code source"];

      v15 = 0;
      goto LABEL_9;
    }
    v12 = [v10 sharedRequirementEvaluationDataSource];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
      v13 = v14;
    }
    else
    {
      id v14 = +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:v11];
    }
  }
  v15 = v14;

  if (!v15) {
    goto LABEL_8;
  }
LABEL_9:
  v17 = [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:v9 featureAvailabilityDataSource:v15];

  return v17;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HKFeatureAvailabilityContextConstraint allContexts];
  id v9 = [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:v7 featureAvailabilityDataSource:v6 contextConstraint:v8];

  return v9;
}

- (HKFeatureStatusManager)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4 contextConstraint:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 featureAvailabilityProvidingForFeatureIdentifier:a3];
  v11 = +[HKFeatureAvailabilityRequirementEvaluationDataSource dataSourceWithHealthDataSource:v9];

  v12 = [(HKFeatureStatusManager *)self initWithFeatureAvailabilityProviding:v10 featureAvailabilityDataSource:v11 contextConstraint:v8];
  return v12;
}

- (HKFeatureStatusManager)initWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4 contextConstraint:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)HKFeatureStatusManager;
  v12 = [(HKFeatureStatusManager *)&v31 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_featureAvailabilityProviding, a3);
    objc_storeStrong((id *)&v13->_strongDataSource, a4);
    objc_storeStrong((id *)&v13->_contextConstraint, a5);
    id v14 = [HKObserverSet alloc];
    v15 = [(HKFeatureStatusManager *)v13 description];
    v16 = HKLogInfrastructure();
    uint64_t v17 = [(HKObserverSet *)v14 initWithName:v15 loggingCategory:v16];
    observers = v13->_observers;
    v13->_observers = (HKObserverSet *)v17;

    v19 = [v9 featureIdentifier];
    uint64_t v20 = HKCreateSerialDispatchQueue(v13, v19);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v20;

    v22 = [v10 featureAvailabilityProvidingDataSource];
    [v22 setKnownFeatureAvailabilityProviding:v13->_featureAvailabilityProviding];

    objc_initWeak(&location, v13);
    v23 = [_HKDelayedOperation alloc];
    v24 = v13->_queue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke;
    v28[3] = &unk_1E58BD6C0;
    objc_copyWeak(&v29, &location);
    uint64_t v25 = [(_HKDelayedOperation *)v23 initWithMode:1 queue:v24 delay:v28 block:0.1];
    notifyObserversOperation = v13->_notifyObserversOperation;
    v13->_notifyObserversOperation = (_HKDelayedOperation *)v25;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 9);
    if (v3)
    {
      -[HKFeatureStatusManager _notifyObserversWithFeatureStatus:]((uint64_t)WeakRetained, v3);
    }
    else
    {
      _HKInitializeLogging();
      v4 = HKLogInfrastructure();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke_cold_1((uint64_t)v2, v4);
      }
    }
  }
}

- (void)_notifyObserversWithFeatureStatus:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    v4 = HKLogInfrastructure();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      id v6 = HKLogInfrastructure();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = NSNumber;
        id v8 = [*(id *)(a1 + 48) allObservers];
        id v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = a1;
        __int16 v15 = 2114;
        v16 = v9;
        _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for feature status update", buf, 0x16u);
      }
    }
    id v10 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__HKFeatureStatusManager__notifyObserversWithFeatureStatus___block_invoke;
    v11[3] = &unk_1E58BD7B0;
    v11[4] = a1;
    id v12 = v3;
    [v10 notifyObservers:v11];
  }
}

+ (id)childFeatureStatusManagerWithFeatureAvailabilityProviding:(id)a3 featureAvailabilityDataSource:(id)a4 contextConstraint:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [objc_alloc((Class)a1) initWithFeatureAvailabilityProviding:v10 featureAvailabilityDataSource:v9 contextConstraint:v8];

  id v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = 0;

  objc_storeWeak((id *)(v11 + 24), v9);

  return (id)v11;
}

- (void)dealloc
{
  if (self->_isObserving) {
    -[HKFeatureStatusManager __unregisterForFeatureStatusChanges]((uint64_t)self);
  }
  v3.receiver = self;
  v3.super_class = (Class)HKFeatureStatusManager;
  [(HKFeatureStatusManager *)&v3 dealloc];
}

- (void)__unregisterForFeatureStatusChanges
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 16) unregisterObserver:a1];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_super v3 = WeakRetained;
    if (!WeakRetained) {
      objc_super v3 = *(void **)(a1 + 32);
    }
    id v4 = v3;

    BOOL v5 = *(void **)(a1 + 80);
    if (v5 && v4)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = -[HKFeatureAvailabilityRequirementSet allRequirements](v5);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            id v12 = [v4 requirementSatisfactionOverridesDataSource];
            v13 = [*(id *)(a1 + 16) featureIdentifier];
            [v12 unregisterObserver:a1 forFeature:v13 requirement:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
        }
        while (v8);
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v14 = -[HKFeatureAvailabilityRequirementSet allObservableRequirements](*(void **)(a1 + 80));
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "unregisterObserver:fromDataSource:", a1, v4, (void)v24);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
        }
        while (v16);
      }

      v19 = [(id)a1 dataSource];
      uint64_t v20 = [v19 healthDataRequirementDataSource];
      [v20 unregisterObserver:a1];
    }
    *(unsigned char *)(a1 + 8) = 0;
    _HKInitializeLogging();
    v21 = HKLogInfrastructure();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);

    if (v22)
    {
      v23 = HKLogInfrastructure();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = a1;
        _os_log_impl(&dword_19C023000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Unregistered for feature status changes", buf, 0xCu);
      }
    }
  }
}

- (NSString)featureIdentifier
{
  return (NSString *)[(HKFeatureAvailabilityProviding *)self->_featureAvailabilityProviding featureIdentifier];
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSource
{
  p_weakDataSource = &self->_weakDataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDataSource);

  if (WeakRetained)
  {
    id v6 = (HKFeatureAvailabilityRequirementEvaluationDataSource *)objc_loadWeakRetained((id *)p_weakDataSource);
  }
  else
  {
    strongDataSource = self->_strongDataSource;
    if (!strongDataSource)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"HKFeatureStatusManager.m", 238, @"No data source for %@ has been retained!", self object file lineNumber description];

      strongDataSource = self->_strongDataSource;
    }
    id v6 = strongDataSource;
  }

  return v6;
}

- (id)featureStatusWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HKFeatureStatusManager_featureStatusWithError___block_invoke;
  block[3] = &unk_1E58BD6E8;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v17;
  dispatch_sync(queue, block);
  BOOL v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = (id)v18[5];
    uint64_t v8 = v7;
    if (v7)
    {
      if (a3) {
        *a3 = v7;
      }
      else {
        _HKLogDroppedError(v7);
      }
    }
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v5;
}

void __49__HKFeatureStatusManager_featureStatusWithError___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    id v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[4];
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v5;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for client request", buf, 0xCu);
    }
  }
  uint64_t v6 = a1[4];
  uint64_t v7 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = -[HKFeatureStatusManager _queue_updateFeatureStatusWithRequestDrivenByObservation:error:](v6, 0, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)_queue_updateFeatureStatusWithRequestDrivenByObservation:(void *)a3 error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v32 = 0;
    v33[0] = &v32;
    v33[1] = 0x3032000000;
    v33[2] = __Block_byref_object_copy__1;
    v33[3] = __Block_byref_object_dispose__1;
    id v34 = 0;
    uint64_t v7 = (id *)(a1 + 80);
    uint64_t v6 = *(void **)(a1 + 80);
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v9 = *(void **)(a1 + 16);
      obuint64_t j = 0;
      id v8 = [v9 featureAvailabilityRequirementsWithError:&obj];
      objc_storeStrong(&v34, obj);
    }
    id v10 = (void *)-[HKFeatureAvailabilityRequirementSet copyApplyingContextConstraint:]((uint64_t)v8, *(void **)(a1 + 40));

    if (v10)
    {
      uint64_t v11 = -[HKFeatureStatusManager _requirementSatisfactionOverrides]((id *)a1);
      id v12 = [(id)a1 dataSource];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke;
      v26[3] = &unk_1E58BD738;
      long long v30 = &v32;
      id v27 = v10;
      uint64_t v28 = a1;
      id v13 = v11;
      id v29 = v13;
      uint64_t v14 = [v12 performLocalEvaluation:v26];

      if (v14)
      {
        if (!*v7) {
          objc_storeStrong(v7, v10);
        }
        uint64_t v15 = *(void **)(a1 + 72);
        if (v15)
        {
          a2 = 0;
          int v16 = [v15 isEqual:v14] ^ 1;
        }
        else
        {
          int v16 = 0;
        }
        if ((a2 | v16) == 1)
        {
          _HKInitializeLogging();
          v21 = HKLogInfrastructure();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);

          if (v22)
          {
            v23 = HKLogInfrastructure();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v36 = a1;
              _os_log_impl(&dword_19C023000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Feature status did change", buf, 0xCu);
            }
          }
          objc_storeStrong((id *)(a1 + 72), v14);
          [*(id *)(a1 + 64) execute];
        }
        else
        {
          objc_storeStrong((id *)(a1 + 72), v14);
        }
        id v24 = v14;
      }
      else
      {
        id v19 = *(id *)(v33[0] + 40);
        uint64_t v20 = v19;
        if (v19)
        {
          if (a3) {
            *a3 = v19;
          }
          else {
            _HKLogDroppedError(v19);
          }
        }
      }
      goto LABEL_33;
    }
    _HKInitializeLogging();
    uint64_t v17 = HKLogInfrastructure();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[HKFeatureStatusManager _queue_updateFeatureStatusWithRequestDrivenByObservation:error:](a1, (uint64_t)v33, v17);
    }

    id v18 = *(id *)(v33[0] + 40);
    id v13 = v18;
    if (v18)
    {
      if (a3)
      {
        id v13 = v18;
        uint64_t v14 = 0;
        *a3 = v13;
LABEL_33:

        _Block_object_dispose(&v32, 8);
        goto LABEL_34;
      }
      _HKLogDroppedError(v18);
    }
    uint64_t v14 = 0;
    goto LABEL_33;
  }
  uint64_t v14 = 0;
LABEL_34:

  return v14;
}

- (id)_requirementSatisfactionOverrides
{
  v1 = a1;
  if (a1)
  {
    v2 = [a1 dataSource];
    BOOL v3 = [v1[2] featureIdentifier];
    v1 = [v2 requirementSatisfactionOverridesForFeatureWithIdentifier:v3];
  }

  return v1;
}

id __89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 healthDataRequirementDataSource];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(id *)(v5 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke_2;
  v10[3] = &unk_1E58BD710;
  uint64_t v6 = *(void **)(a1 + 32);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v3;
  id v12 = v6;
  id v13 = *(id *)(a1 + 48);
  id v7 = v3;
  id v8 = [v4 withPrewarmedEvaluationOfRequirementSet:v6 error:&v14 handler:v10];
  objc_storeStrong((id *)(v5 + 40), v14);

  return v8;
}

HKFeatureStatus *__89__HKFeatureStatusManager__queue_updateFeatureStatusWithRequestDrivenByObservation_error___block_invoke_2(uint64_t a1, void *a2)
{
  return -[HKFeatureStatusManager _queue_featureStatusWithEvaluationContext:requirements:overrides:error:](*(HKFeatureStatus **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), a2);
}

- (HKFeatureStatus)_queue_featureStatusWithEvaluationContext:(void *)a3 requirements:(void *)a4 overrides:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v12 = [(NSDictionary *)a1->_requirementsEvaluationByContext featureIdentifier];
    id v23 = 0;
    id v13 = [v9 onboardingRecordForFeatureWithIdentifier:v12 error:&v23];
    id v14 = v23;

    if (v13)
    {
      id v22 = v14;
      -[HKFeatureAvailabilityRequirementSet evaluationByContextWithDataSource:overrides:error:]((uint64_t)v10, v9, v11, &v22);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = v22;

      if (v15)
      {
        a1 = [[HKFeatureStatus alloc] initWithOnboardingRecord:v13 requirementsEvaluationByContext:v15];
      }
      else
      {
        _HKInitializeLogging();
        id v19 = HKLogInfrastructure();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[HKFeatureStatusManager _queue_featureStatusWithEvaluationContext:requirements:overrides:error:]();
        }

        id v20 = v16;
        id v16 = v20;
        if (v20)
        {
          if (a5) {
            *a5 = v20;
          }
          else {
            _HKLogDroppedError(v20);
          }
        }

        a1 = 0;
      }
      goto LABEL_19;
    }
    _HKInitializeLogging();
    uint64_t v17 = HKLogInfrastructure();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[HKFeatureStatusManager _queue_featureStatusWithEvaluationContext:requirements:overrides:error:]();
    }

    id v18 = v14;
    id v15 = v18;
    if (v18)
    {
      if (a5)
      {
        id v15 = v18;
        a1 = 0;
        *a5 = v15;
        id v16 = v15;
LABEL_19:

        goto LABEL_20;
      }
      _HKLogDroppedError(v18);
    }
    a1 = 0;
    id v16 = v15;
    goto LABEL_19;
  }
LABEL_20:

  return a1;
}

- (void)registerObserver:(id)a3
{
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  observers = self->_observers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HKFeatureStatusManager_registerObserver_queue___block_invoke;
  v11[3] = &unk_1E58BD760;
  v11[4] = &v12;
  [(HKObserverSet *)observers registerObserver:v6 queue:v7 runIfFirstObserver:v11];
  if (*((unsigned char *)v13 + 24))
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__HKFeatureStatusManager_registerObserver_queue___block_invoke_2;
    v10[3] = &unk_1E58BBA00;
    v10[4] = self;
    dispatch_sync(queue, v10);
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __49__HKFeatureStatusManager_registerObserver_queue___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __49__HKFeatureStatusManager_registerObserver_queue___block_invoke_2(uint64_t a1)
{
}

- (void)_queue_registerForFeatureStatusChanges
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_19C023000, v0, OS_LOG_TYPE_FAULT, "[%{public}@]: Error determining feature requirements during registration: %{public}@", v1, 0x16u);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HKFeatureStatusManager_unregisterObserver___block_invoke;
  v8[3] = &unk_1E58BD760;
  v8[4] = &v9;
  [(HKObserverSet *)observers unregisterObserver:v4 runIfLastObserver:v8];
  if (*((unsigned char *)v10 + 24))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__HKFeatureStatusManager_unregisterObserver___block_invoke_2;
    v7[3] = &unk_1E58BBA00;
    v7[4] = self;
    dispatch_sync(queue, v7);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __45__HKFeatureStatusManager_unregisterObserver___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __45__HKFeatureStatusManager_unregisterObserver___block_invoke_2(uint64_t a1)
{
}

- (void)_queue_unregisterForFeatureStatusChanges
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    -[HKFeatureStatusManager __unregisterForFeatureStatusChanges](a1);
  }
}

- (void)_registerForRequirementSatisfactionOverrideChangesForRequirements:(id *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    -[HKFeatureAvailabilityRequirementSet allRequirements](a2);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
          id v8 = [a1 dataSource];
          uint64_t v9 = [v8 requirementSatisfactionOverridesDataSource];
          id v10 = [a1[2] featureIdentifier];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __92__HKFeatureStatusManager__registerForRequirementSatisfactionOverrideChangesForRequirements___block_invoke;
          v12[3] = &unk_1E58BD788;
          v12[4] = v7;
          [v9 registerObserver:a1 forFeature:v10 requirement:v7 newValueHandler:v12];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
  }
}

void __92__HKFeatureStatusManager__registerForRequirementSatisfactionOverrideChangesForRequirements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(id)objc_opt_class() requirementIdentifier];
      int v9 = 138543874;
      id v10 = v5;
      __int16 v11 = 2114;
      id v12 = v6;
      __int16 v13 = 2114;
      long long v14 = v8;
      _os_log_error_impl(&dword_19C023000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring observed override value of %{public}@ for %{public}@; invalid type",
        (uint8_t *)&v9,
        0x20u);
    }
  }
  else
  {
    -[HKFeatureStatusManager _updateOverriddenSatisfactionOfRequirement:overriddenSatisfaction:]((uint64_t)v5, *(void **)(a1 + 32), v6);
  }
}

- (void)_updateOverriddenSatisfactionOfRequirement:(void *)a3 overriddenSatisfaction:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [(id)objc_opt_class() requirementIdentifier];
    id v8 = v7;
    if (v6)
    {
      int v9 = [v6 BOOLValue];
      _HKInitializeLogging();
      id v10 = HKLogInfrastructure();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

      if (v11)
      {
        id v12 = HKLogInfrastructure();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          __int16 v13 = @"is NOT";
          *(_DWORD *)buf = 138543874;
          uint64_t v18 = a1;
          __int16 v19 = 2114;
          if (v9) {
            __int16 v13 = @"is";
          }
          id v20 = v8;
          __int16 v21 = 2114;
          id v22 = v13;
          _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Override: %{public}@ %{public}@ satisfied; updating feature status",
            buf,
            0x20u);
        }
      }
      -[HKFeatureStatusManager _updateSatisfactionOfRequirement:isSatisfied:](a1, v5, v9);
    }
    else
    {
      long long v14 = *(NSObject **)(a1 + 56);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __92__HKFeatureStatusManager__updateOverriddenSatisfactionOfRequirement_overriddenSatisfaction___block_invoke;
      v15[3] = &unk_1E58BBBD0;
      v15[4] = a1;
      id v16 = v7;
      dispatch_sync(v14, v15);
    }
  }
}

uint64_t __60__HKFeatureStatusManager__notifyObserversWithFeatureStatus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureStatusProviding:*(void *)(a1 + 32) didUpdateFeatureStatus:*(void *)(a1 + 40)];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKFeatureAvailabilityProviding *)self->_featureAvailabilityProviding featureIdentifier];
  id v6 = [v3 stringWithFormat:@"<%@:%@:%p>", v4, v5, self];

  return (NSString *)v6;
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = HKLogInfrastructure();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543362;
      id v8 = self;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for onboarding completion update", (uint8_t *)&v7, 0xCu);
    }
  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation]((uint64_t)self);
}

- (void)_queue_attemptFeatureStatusUpdateDrivenByObservation
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[%{public}@]: Error attempting to update feature status: %{public}@");
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = HKLogInfrastructure();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543362;
      id v8 = self;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for paired device capability update", (uint8_t *)&v7, 0xCu);
    }
  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation]((uint64_t)self);
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = HKLogInfrastructure();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543362;
      id v8 = self;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating feature status for feature settings update", (uint8_t *)&v7, 0xCu);
    }
  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation]((uint64_t)self);
}

- (void)featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(id)objc_opt_class() requirementIdentifier];
  id v8 = -[HKFeatureStatusManager _requirementSatisfactionOverrides]((id *)&self->super.isa);
  uint64_t v9 = [v8 overriddenSatisfactionOfRequirementWithIdentifier:v7];

  if (v9)
  {
    _HKInitializeLogging();
    id v10 = HKLogInfrastructure();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

    if (v11)
    {
      id v12 = HKLogInfrastructure();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = 138543618;
        long long v14 = self;
        __int16 v15 = 2114;
        id v16 = v7;
        _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Satisfaction of %{public}@ is overridden; ignoring observed satisfaction change",
          (uint8_t *)&v13,
          0x16u);
      }
    }
  }
  else
  {
    -[HKFeatureStatusManager _updateSatisfactionOfRequirement:isSatisfied:]((uint64_t)self, v6, a4);
  }
}

- (void)_updateSatisfactionOfRequirement:(char)a3 isSatisfied:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [(id)objc_opt_class() requirementIdentifier];
    int v7 = *(NSObject **)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__HKFeatureStatusManager__updateSatisfactionOfRequirement_isSatisfied___block_invoke;
    v9[3] = &unk_1E58BD7D8;
    v9[4] = a1;
    id v10 = v6;
    char v12 = a3;
    id v11 = v5;
    id v8 = v6;
    dispatch_sync(v7, v9);
  }
}

void __92__HKFeatureStatusManager__updateOverriddenSatisfactionOfRequirement_overriddenSatisfaction___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogInfrastructure();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    uint64_t v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Override of %{public}@ cleared; regenerating feature status",
        (uint8_t *)&v7,
        0x16u);
    }
  }
  -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation](*(void *)(a1 + 32));
}

void __71__HKFeatureStatusManager__updateSatisfactionOfRequirement_isSatisfied___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 72);
  if (!v3 || (uint64_t v4 = *(void *)(v2 + 80)) == 0)
  {
    if (HKFeatureAvailabilityRequirementIdentifierReflectsSensitiveData(*(void **)(a1 + 40))
      && (HKShowSensitiveLogItems() & 1) == 0)
    {
      _HKInitializeLogging();
      id v24 = HKLogInfrastructure();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

      if (v25)
      {
        uint64_t v17 = HKLogInfrastructure();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          int v30 = 138543362;
          uint64_t v31 = v26;
          __int16 v21 = "[%{public}@] Requirement satisfaction changed; regenerating feature status";
          id v22 = v17;
          uint32_t v23 = 12;
LABEL_21:
          _os_log_impl(&dword_19C023000, v22, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v30, v23);
        }
LABEL_22:
      }
    }
    else
    {
      _HKInitializeLogging();
      __int16 v15 = HKLogInfrastructure();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

      if (v16)
      {
        uint64_t v17 = HKLogInfrastructure();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void *)(a1 + 40);
          id v20 = @"is";
          if (!*(unsigned char *)(a1 + 56)) {
            id v20 = @"is NOT";
          }
          int v30 = 138543874;
          uint64_t v31 = v18;
          __int16 v32 = 2114;
          uint64_t v33 = v19;
          __int16 v34 = 2114;
          v35 = v20;
          __int16 v21 = "[%{public}@] %{public}@ %{public}@ satisfied; regenerating feature status";
          id v22 = v17;
          uint32_t v23 = 32;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
    -[HKFeatureStatusManager _queue_attemptFeatureStatusUpdateDrivenByObservation](*(void *)(a1 + 32));
    return;
  }
  uint64_t v5 = (void *)[v3 copyUpdatingRequirement:*(void *)(a1 + 48) fromRequirements:v4 isSatisfied:*(unsigned __int8 *)(a1 + 56)];
  if (([v5 isEqual:*(void *)(*(void *)(a1 + 32) + 72)] & 1) == 0)
  {
    if (HKFeatureAvailabilityRequirementIdentifierReflectsSensitiveData(*(void **)(a1 + 40))
      && (HKShowSensitiveLogItems() & 1) == 0)
    {
      _HKInitializeLogging();
      id v27 = HKLogInfrastructure();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

      if (v28)
      {
        uint64_t v8 = HKLogInfrastructure();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = *(void *)(a1 + 32);
          int v30 = 138543362;
          uint64_t v31 = v29;
          char v12 = "[%{public}@] Requirement satisfaction changed; updating feature status";
          int v13 = v8;
          uint32_t v14 = 12;
LABEL_27:
          _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v30, v14);
        }
LABEL_28:
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v6 = HKLogInfrastructure();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

      if (v7)
      {
        uint64_t v8 = HKLogInfrastructure();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          uint64_t v10 = *(void *)(a1 + 40);
          uint64_t v11 = @"is";
          if (!*(unsigned char *)(a1 + 56)) {
            uint64_t v11 = @"is NOT";
          }
          int v30 = 138543874;
          uint64_t v31 = v9;
          __int16 v32 = 2114;
          uint64_t v33 = v10;
          __int16 v34 = 2114;
          v35 = v11;
          char v12 = "[%{public}@] %{public}@ %{public}@ satisfied; updating feature status";
          int v13 = v8;
          uint32_t v14 = 32;
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v5);
    [*(id *)(*(void *)(a1 + 32) + 64) execute];
  }
}

- (HKFeatureAvailabilityProviding)featureAvailabilityProviding
{
  return self->_featureAvailabilityProviding;
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)weakDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDataSource);

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)WeakRetained;
}

- (void)setWeakDataSource:(id)a3
{
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)strongDataSource
{
  return self->_strongDataSource;
}

- (void)setStrongDataSource:(id)a3
{
}

- (HKFeatureAvailabilityContextConstraint)contextConstraint
{
  return self->_contextConstraint;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_HKDelayedOperation)notifyObserversOperation
{
  return self->_notifyObserversOperation;
}

- (void)setNotifyObserversOperation:(id)a3
{
}

- (HKFeatureStatus)currentFeatureStatus
{
  return self->_currentFeatureStatus;
}

- (void)setCurrentFeatureStatus:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (HKFeatureAvailabilityRequirementSet)requirements
{
  return self->_requirements;
}

- (void)setRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_currentFeatureStatus, 0);
  objc_storeStrong((id *)&self->_notifyObserversOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_contextConstraint, 0);
  objc_storeStrong((id *)&self->_strongDataSource, 0);
  objc_destroyWeak((id *)&self->_weakDataSource);

  objc_storeStrong((id *)&self->_featureAvailabilityProviding, 0);
}

void __111__HKFeatureStatusManager_initWithFeatureAvailabilityProviding_featureAvailabilityDataSource_contextConstraint___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_19C023000, a2, OS_LOG_TYPE_FAULT, "[%{public}@]: Asked to notify observers, but no feature status available", (uint8_t *)&v4, 0xCu);
}

- (void)_queue_updateFeatureStatusWithRequestDrivenByObservation:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "[%{public}@]: Error determining feature requirements: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_queue_featureStatusWithEvaluationContext:requirements:overrides:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[%{public}@]: Error retrieving onboarding record: %{public}@");
}

- (void)_queue_featureStatusWithEvaluationContext:requirements:overrides:error:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[%{public}@]: Error evaluating requirements by context: %{public}@");
}

@end