@interface HDBackgroundFeatureDeliveryManager
- (BOOL)isEligibleForFetchByPeriodicCountryMonitor:(id)a3;
- (HDBackgroundFeatureDeliveryManager)initWithProfile:(id)a3 featureAvailabilityExtension:(id)a4 deliveryCriteria:(id)a5 settingsProvider:(id)a6 loggingCategory:(id)a7;
- (HDBackgroundFeatureDeliveryManager)initWithProfile:(id)a3 featureAvailabilityExtension:(id)a4 loggingCategory:(id)a5;
- (HDKeyValueDomain)_lastCountryAvailabilityVersionDomain;
- (NSString)description;
- (id)_initWithProfile:(id)a3 periodicCountryMonitor:(id)a4 featureAvailabilityExtension:(id)a5 deliveryCriteria:(id)a6 settingsProvider:(id)a7 loggingCategory:(id)a8;
- (uint64_t)_queue_isEligibleForDeliveryMonitoringWithError:(uint64_t)a1;
- (void)_queue_updatePeriodicCountryMonitorEligibility;
- (void)_reportAnalyticsEventForCountryCode:(uint64_t)a3 countryCodeProvenance:(void *)a4 eventType:(void *)a5 errorCategory:(void *)a6 errorDetail:;
- (void)_setLastCountryAvailabilityVersion:(uint64_t)a1;
- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3;
- (void)periodicCountryMonitor:(id)a3 didFetchISOCountryCode:(id)a4 countryCodeProvenance:(int64_t)a5;
@end

@implementation HDBackgroundFeatureDeliveryManager

- (HDBackgroundFeatureDeliveryManager)initWithProfile:(id)a3 featureAvailabilityExtension:(id)a4 loggingCategory:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 periodicCountryMonitor];
  v12 = [(HDBackgroundFeatureDeliveryManager *)self _initWithProfile:v10 periodicCountryMonitor:v11 featureAvailabilityExtension:v9 deliveryCriteria:0 settingsProvider:0 loggingCategory:v8];

  return v12;
}

- (HDBackgroundFeatureDeliveryManager)initWithProfile:(id)a3 featureAvailabilityExtension:(id)a4 deliveryCriteria:(id)a5 settingsProvider:(id)a6 loggingCategory:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v16 periodicCountryMonitor];
  v18 = [(HDBackgroundFeatureDeliveryManager *)self _initWithProfile:v16 periodicCountryMonitor:v17 featureAvailabilityExtension:v15 deliveryCriteria:v14 settingsProvider:v13 loggingCategory:v12];

  return v18;
}

- (id)_initWithProfile:(id)a3 periodicCountryMonitor:(id)a4 featureAvailabilityExtension:(id)a5 deliveryCriteria:(id)a6 settingsProvider:(id)a7 loggingCategory:(id)a8
{
  id obj = a3;
  id v14 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v14)
  {
    v26.receiver = self;
    v26.super_class = (Class)HDBackgroundFeatureDeliveryManager;
    v18 = [(HDBackgroundFeatureDeliveryManager *)&v26 init];
    v19 = v18;
    if (v18)
    {
      objc_storeWeak((id *)&v18->_profile, obj);
      objc_storeStrong((id *)&v19->_periodicCountryMonitor, a4);
      objc_storeStrong((id *)&v19->_featureAvailabilityExtension, a5);
      objc_storeStrong((id *)&v19->_featureSpecificDeliveryCriteria, a6);
      objc_storeStrong((id *)&v19->_settingsProvider, a7);
      objc_storeStrong((id *)&v19->_loggingCategory, a8);
      v19->_state = 0;
      uint64_t v20 = [(HDPeriodicCountryMonitor *)v19->_periodicCountryMonitor observerQueue];
      queue = v19->_queue;
      v19->_queue = (OS_dispatch_queue *)v20;

      [(HDPeriodicCountryMonitor *)v19->_periodicCountryMonitor registerObserver:v19];
      [(HDFeatureAvailabilityExtension *)v19->_featureAvailabilityExtension registerObserver:v19 queue:v19->_queue];
    }
    self = v19;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDFeatureAvailabilityExtension *)self->_featureAvailabilityExtension featureIdentifier];
  v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  return (NSString *)v6;
}

- (HDKeyValueDomain)_lastCountryAvailabilityVersionDomain
{
  v2 = [HDKeyValueDomain alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v4 = [(HDKeyValueDomain *)v2 initWithCategory:0 domainName:@"HDBackgroundFeatureDeliveryManager_LastCountryAvailabilityVersion" profile:WeakRetained];

  return v4;
}

- (void)_setLastCountryAvailabilityVersion:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v9 = 0;
    id v3 = a2;
    uint64_t v4 = -[HDBackgroundFeatureDeliveryManager _lastCountryAvailabilityVersionDomain](a1);
    v5 = [*(id *)(a1 + 24) featureIdentifier];
    char v6 = [v4 setString:v3 forKey:v5 error:&v9];

    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      _HKInitializeLogging();
      id v8 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v11 = a1;
        __int16 v12 = 2114;
        id v13 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting last country availability version: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (uint64_t)_queue_isEligibleForDeliveryMonitoringWithError:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    uint64_t v4 = *(void **)(v2 + 24);
    id v13 = 0;
    v5 = [v4 onboardedCountryCodeSupportedStateWithError:&v13];
    id v6 = v13;
    if (v5)
    {
      switch([v5 integerValue])
      {
        case 1:
          _HKInitializeLogging();
          id v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v15 = v2;
          id v8 = "[%{public}@] We're not onboarded";
          break;
        case 2:
          _HKInitializeLogging();
          uint64_t v11 = *(NSObject **)(v2 + 48);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v15 = v2;
            _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] We're already onboarded in a supported state", buf, 0xCu);
          }
          uint64_t v2 = MEMORY[0x1E4F1CC28];
          goto LABEL_24;
        case 3:
          _HKInitializeLogging();
          id v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v15 = v2;
          id v8 = "[%{public}@] We're onboarded in an unsupported state";
          break;
        case 4:
          _HKInitializeLogging();
          id v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v15 = v2;
          id v8 = "[%{public}@] We're onboarded in a disabled state";
          break;
        case 5:
          _HKInitializeLogging();
          id v7 = *(NSObject **)(v2 + 48);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v15 = v2;
          id v8 = "[%{public}@] We're onboarded in a expired state";
          break;
        default:
          goto LABEL_21;
      }
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_21:
      uint64_t v2 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      _HKInitializeLogging();
      id v9 = *(NSObject **)(v2 + 48);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v2;
        __int16 v16 = 2114;
        id v17 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking onboarded state: %{public}@", buf, 0x16u);
      }
      id v10 = v6;
      if (v10)
      {
        if (a2) {
          *a2 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v2 = 0;
    }
LABEL_24:
  }
  return v2;
}

- (void)_queue_updatePeriodicCountryMonitorEligibility
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (*(void *)(a1 + 64) == 2)
    {
      _HKInitializeLogging();
      uint64_t v2 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = a1;
        _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Currently saving delivery, skipping registration update", buf, 0xCu);
      }
    }
    else
    {
      id v24 = 0;
      id v3 = -[HDBackgroundFeatureDeliveryManager _queue_isEligibleForDeliveryMonitoringWithError:](a1, &v24);
      id v4 = v24;
      if (v3)
      {
        int v5 = [v3 BOOLValue];
        _HKInitializeLogging();
        id v6 = *(NSObject **)(a1 + 48);
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        if (v5)
        {
          if (v7)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v28 = a1;
            _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Eligible for delivery monitoring, registering for new country codes", buf, 0xCu);
          }
          *(void *)(a1 + 64) = 1;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
          id v8 = *(void **)(a1 + 24);
          id v26 = 0;
          id v9 = [v8 regionAvailabilityWithError:&v26];
          id v10 = v26;
          uint64_t v11 = [v9 version];

          if (!v11)
          {
            _HKInitializeLogging();
            __int16 v12 = *(NSObject **)(a1 + 48);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v21 = v12;
              v22 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              uint64_t v28 = (uint64_t)v22;
              __int16 v29 = 2114;
              id v30 = v10;
              id v23 = v22;
              _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving region availability version: %{public}@", buf, 0x16u);
            }
          }
          id v25 = v10;
          id v13 = -[HDBackgroundFeatureDeliveryManager _lastCountryAvailabilityVersionDomain](a1);
          uint64_t v14 = [*(id *)(a1 + 24) featureIdentifier];
          uint64_t v15 = [v13 stringForKey:v14 error:&v25];

          id v16 = v25;
          if (v15 || !v16)
          {
            if (v15 && [v11 isEqualToString:v15])
            {
              _HKInitializeLogging();
              v19 = *(NSObject **)(a1 + 48);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v28 = a1;
                __int16 v29 = 2114;
                id v30 = v11;
                _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for immediate background delivery check. Current: %{public}@", buf, 0x16u);
              }
            }
            else
            {
              _HKInitializeLogging();
              uint64_t v20 = *(NSObject **)(a1 + 48);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                uint64_t v28 = a1;
                __int16 v29 = 2114;
                id v30 = v15;
                __int16 v31 = 2114;
                v32 = v11;
                _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Eligible for immediate background delivery check. Last: %{public}@ Current: %{public}@", buf, 0x20u);
              }
              [*(id *)(a1 + 16) enqueueMaintenanceFetch];
            }
          }
          else
          {
            _HKInitializeLogging();
            id v17 = *(NSObject **)(a1 + 48);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v28 = a1;
              __int16 v29 = 2114;
              id v30 = v16;
              _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving last country availability version: %{public}@. Skipping immediate background check", buf, 0x16u);
            }
          }
        }
        else
        {
          if (v7)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v28 = a1;
            _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery monitoring, unregistering for new country codes", buf, 0xCu);
          }
          *(void *)(a1 + 64) = 4;
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v18 = *(NSObject **)(a1 + 48);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v28 = a1;
          __int16 v29 = 2114;
          id v30 = v4;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining eligibility: %{public}@; skipping registration update",
            buf,
            0x16u);
        }
      }
    }
  }
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received update of onboarding completion, updating registration status", (uint8_t *)&v5, 0xCu);
  }
  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received region availability update notification, updating registration status", (uint8_t *)&v5, 0xCu);
  }
  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received update of paired device availability, updating registration status", (uint8_t *)&v5, 0xCu);
  }
  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
}

- (BOOL)isEligibleForFetchByPeriodicCountryMonitor:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking eligibility", (uint8_t *)&v7, 0xCu);
  }
  int64_t state = self->_state;
  if (!state)
  {
    -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility]((uint64_t)self);
    int64_t state = self->_state;
  }
  return state == 1;
}

- (void)periodicCountryMonitor:(id)a3 didFetchISOCountryCode:(id)a4 countryCodeProvenance:(int64_t)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v90 = self;
    __int16 v91 = 2114;
    id v92 = v7;
    _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received new country code: %{public}@", buf, 0x16u);
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F2B010];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F2B070]) initWithCountryCode:v7];
  __int16 v12 = [v9 dataSourceWithHealthDataSource:WeakRetained currentCountryCodeProvider:v11];

  id v13 = (void *)MEMORY[0x1E4F2AFF0];
  uint64_t v14 = *MEMORY[0x1E4F29B90];
  uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F29B90]];
  uint64_t v16 = [v13 onlySomeContexts:v15];

  id v17 = (void *)v16;
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F2B068]) initWithFeatureAvailabilityProviding:self->_featureAvailabilityExtension featureAvailabilityDataSource:v12 contextConstraint:v16];
  id v87 = 0;
  uint64_t v19 = [v18 featureStatusWithError:&v87];
  id v20 = v87;
  v79 = (void *)v19;
  if (!v19)
  {
    _HKInitializeLogging();
    v35 = self->_loggingCategory;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v90 = self;
      __int16 v91 = 2114;
      id v92 = v20;
      _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Error evaluating feature status: %{public}@", buf, 0x16u);
    }
    v36 = NSString;
    id v28 = [v20 domain];
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "code"));
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = [v36 stringWithFormat:@"%@_%@", v28, v25];
    v37 = @"feature_status";
    v38 = self;
    v39 = v7;
    int64_t v40 = a5;
    v41 = v26;
    goto LABEL_19;
  }
  v77 = v18;
  featureAvailabilityExtension = self->_featureAvailabilityExtension;
  id v86 = v20;
  v22 = [(HDFeatureAvailabilityExtension *)featureAvailabilityExtension regionAvailabilityWithError:&v86];
  id v23 = v86;

  uint64_t v24 = [v22 version];

  v76 = (void *)v24;
  if (!v24)
  {
    _HKInitializeLogging();
    v42 = self->_loggingCategory;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v90 = self;
      __int16 v91 = 2114;
      id v92 = v23;
      _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "[%{public}@] Error accessing region availability: %{public}@", buf, 0x16u);
    }
    v43 = NSString;
    id v25 = [v23 domain];
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "code"));
    id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = [v43 stringWithFormat:@"%@_%@", v25, v26];
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, @"error", @"availability_version", v44);

    id v28 = 0;
    id v20 = v23;
    goto LABEL_23;
  }
  if (([v79 includesContext:v14] & 1) == 0)
  {
    v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:a2, self, @"HDBackgroundFeatureDeliveryManager.m", 354, @"Invalid parameter not satisfying: %@", @"[featureStatus includesContext:HKFeatureAvailabilityContextBackgroundDelivery]" object file lineNumber description];
  }
  id v25 = [v79 objectForKeyedSubscript:v14];
  if (([v25 areAllRequirementsSatisfied] & 1) == 0)
  {
    v72 = v17;
    _HKInitializeLogging();
    v45 = self->_loggingCategory;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      v47 = [v25 unsatisfiedRequirementIdentifiersDescription];
      *(_DWORD *)buf = 138543874;
      v90 = self;
      __int16 v91 = 2114;
      id v92 = v7;
      __int16 v93 = 2114;
      id v94 = v47;
      _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery in %{public}@, unsatisfied requirements: %{public}@", buf, 0x20u);
    }
    v74 = v12;
    v48 = (void *)MEMORY[0x1E4F1CAD0];
    v49 = [v25 unsatisfiedRequirementIdentifiers];
    id v26 = [v48 setWithArray:v49];

    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = *MEMORY[0x1E4F29C78];
    v88[0] = *MEMORY[0x1E4F29C80];
    v88[1] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
    v53 = [v50 setWithArray:v52];
    int v54 = [(__CFString *)v26 isSubsetOfSet:v53];

    if (v54) {
      -[HDBackgroundFeatureDeliveryManager _setLastCountryAvailabilityVersion:]((uint64_t)self, v76);
    }
    id v25 = v25;
    id v55 = v7;
    uint64_t v56 = [v25 highestPriorityUnsatisfiedRequirement];
    v57 = (void *)v56;
    if (v56) {
      v58 = (__CFString *)v56;
    }
    else {
      v58 = @"unexpected_requirements";
    }
    [v25 unsatisfiedRequirementIdentifiers];
    v60 = id v59 = v7;

    v61 = [v60 componentsJoinedByString:@","];
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v55, a5, @"error", v58, v61);

    id v7 = v59;
    id v20 = v23;
    id v17 = v72;
    __int16 v12 = v74;
    goto LABEL_35;
  }
  id v85 = v23;
  -[HDBackgroundFeatureDeliveryManager _queue_isEligibleForDeliveryMonitoringWithError:]((uint64_t)self, &v85);
  id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v20 = v85;

  uint64_t v18 = v77;
  if (!v26)
  {
    _HKInitializeLogging();
    v62 = self->_loggingCategory;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v90 = self;
      __int16 v91 = 2114;
      id v92 = v20;
      __int16 v93 = 2114;
      id v94 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining eligibility: %{public}@; ignoring new country code: %{public}@",
        buf,
        0x20u);
    }
    v63 = NSString;
    v64 = [v20 domain];
    v65 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "code"));
    v66 = [v63 stringWithFormat:@"%@_%@", v64, v65];
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, @"error", @"eligibility", v66);

    id v26 = 0;
    goto LABEL_35;
  }
  if (([(__CFString *)v26 BOOLValue] & 1) == 0)
  {
    _HKInitializeLogging();
    v67 = self->_loggingCategory;
    id v28 = v76;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v90 = self;
      __int16 v91 = 2114;
      id v92 = v7;
      _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery; ignoring new country code: %{public}@",
        buf,
        0x16u);
    }
    v37 = @"eligibility";
    v41 = @"already_onboarded";
    v38 = self;
    v39 = v7;
    int64_t v40 = a5;
LABEL_19:
    -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)v38, v39, v40, @"error", v37, v41);
    goto LABEL_36;
  }
  featureSpecificDeliveryCriteria = self->_featureSpecificDeliveryCriteria;
  id v28 = v76;
  if (!featureSpecificDeliveryCriteria)
  {
LABEL_44:
    _HKInitializeLogging();
    v69 = self->_loggingCategory;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = self;
      _os_log_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving delivery", buf, 0xCu);
    }
    self->_int64_t state = 2;
    v70 = [(HDBackgroundFeatureDeliverySettingsProviding *)self->_settingsProvider featureSettingsUponBackgroundDelivery];
    v75 = self->_featureAvailabilityExtension;
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke;
    v80[3] = &unk_1E6300260;
    v80[4] = self;
    id v81 = v7;
    int64_t v83 = a5;
    id v28 = v76;
    id v82 = v28;
    [(HDFeatureAvailabilityExtension *)v75 setCurrentOnboardingVersionCompletedForCountryCode:v81 countryCodeProvenance:a5 date:0 settings:v70 completion:v80];

LABEL_23:
    uint64_t v18 = v77;
    goto LABEL_36;
  }
  id v84 = v20;
  uint64_t v29 = [(HDBackgroundFeatureDeliveryCriteriaProviding *)featureSpecificDeliveryCriteria isBackgroundDeliverySupportedWithError:&v84];
  id v73 = v84;

  if (v29 != 2)
  {
    if (!v29)
    {
      _HKInitializeLogging();
      id v30 = self->_loggingCategory;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v90 = self;
        __int16 v91 = 2114;
        id v92 = v73;
        __int16 v93 = 2114;
        id v94 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Error evaluating background delivery criteria: %{public}@; ignoring new country code: %{public}@",
          buf,
          0x20u);
      }
      __int16 v31 = NSString;
      id v20 = v73;
      v32 = [v73 domain];
      uint64_t v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v73, "code"));
      v34 = [v31 stringWithFormat:@"%@_%@", v32, v33];
      -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, @"error", @"legacy_criteria", v34);

LABEL_35:
      id v28 = v76;
      uint64_t v18 = v77;
      goto LABEL_36;
    }
    id v20 = v73;
    goto LABEL_44;
  }
  _HKInitializeLogging();
  v68 = self->_loggingCategory;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v90 = self;
    __int16 v91 = 2114;
    id v92 = v7;
    _os_log_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not eligible for delivery; ignoring new country code: %{public}@",
      buf,
      0x16u);
  }
  -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:]((uint64_t)self, v7, a5, @"error", @"legacy_criteria", @"unsupported");
  id v20 = v73;
LABEL_36:
}

void __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:](v6, *(void **)(a1 + 40), *(void *)(a1 + 56), @"delivery", 0, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v7;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error saving delivery: %{public}@", buf, 0x16u);
      uint64_t v7 = *(void *)(a1 + 32);
    }
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = NSString;
    __int16 v12 = [v5 domain];
    id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
    uint64_t v14 = [v11 stringWithFormat:@"%@_%@", v12, v13];
    if (v7) {
      -[HDBackgroundFeatureDeliveryManager _reportAnalyticsEventForCountryCode:countryCodeProvenance:eventType:errorCategory:errorDetail:](v7, v9, v10, @"error", @"save", v14);
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(NSObject **)(v15 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke_325;
  block[3] = &unk_1E62F31C0;
  block[4] = v15;
  id v18 = *(id *)(a1 + 48);
  dispatch_async(v16, block);
}

void __106__HDBackgroundFeatureDeliveryManager_periodicCountryMonitor_didFetchISOCountryCode_countryCodeProvenance___block_invoke_325(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = 3;
  -[HDBackgroundFeatureDeliveryManager _setLastCountryAvailabilityVersion:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);

  -[HDBackgroundFeatureDeliveryManager _queue_updatePeriodicCountryMonitorEligibility](v2);
}

- (void)_reportAnalyticsEventForCountryCode:(uint64_t)a3 countryCodeProvenance:(void *)a4 eventType:(void *)a5 errorCategory:(void *)a6 errorDetail:
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  if (a1)
  {
    v26[0] = a4;
    v25[0] = @"eventType";
    v25[1] = @"featureIdentifier";
    uint64_t v11 = *(void **)(a1 + 24);
    id v12 = a6;
    id v13 = a5;
    id v14 = a4;
    uint64_t v15 = [v11 featureIdentifier];
    v26[1] = v15;
    v25[2] = @"provenance";
    uint64_t v16 = NSStringFromHKOnboardingCompletionCountryCodeProvenance();
    v26[2] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    id v18 = (void *)[v17 mutableCopy];

    [v18 setObject:v13 forKeyedSubscript:@"errorCategory"];
    [v18 setObject:v12 forKeyedSubscript:@"errorDetail"];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v20 = [WeakRetained daemon];
    __int16 v21 = [v20 OTAFeatureAvailabilityManager];
    id v22 = [v21 factorPackID];
    [v18 setObject:v22 forKeyedSubscript:@"OTAFactorPackID"];

    uint64_t v23 = HKImproveHealthAndActivityAnalyticsAllowed();
    uint64_t v24 = [NSNumber numberWithBool:v23];

    [v18 setObject:v24 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];
    if (v23) {
      [v18 setObject:v10 forKeyedSubscript:@"countryCode"];
    }
    AnalyticsSendEvent();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_settingsProvider, 0);
  objc_storeStrong((id *)&self->_featureSpecificDeliveryCriteria, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityExtension, 0);
  objc_storeStrong((id *)&self->_periodicCountryMonitor, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end