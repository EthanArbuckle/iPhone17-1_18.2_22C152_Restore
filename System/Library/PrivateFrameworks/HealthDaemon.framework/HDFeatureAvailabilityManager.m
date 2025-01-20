@interface HDFeatureAvailabilityManager
- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 pairedFeatureAttributesProvider:(id)a8 regionAvailabilityProvider:(id)a9 disableAndExpiryProvider:(id)a10 loggingCategory:(id)a11;
- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 pairedFeatureAttributesProvider:(id)a8 regionAvailabilityProvider:(id)a9 disableAndExpiryProvider:(id)a10 onboardingEligibilityDeterminer:(id)a11 featureSettingsAtOnboardingTimeValidator:(id)a12 loggingCategory:(id)a13;
- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 regionAvailabilityProvider:(id)a8 disableAndExpiryProvider:(id)a9 loggingCategory:(id)a10;
- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 currentOnboardingVersion:(int64_t)a5 loggingCategory:(id)a6;
- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 currentOnboardingVersion:(int64_t)a5 pairedDeviceCapability:(id)a6 regionAvailabilityProvider:(id)a7 loggingCategory:(id)a8;
- (NSString)description;
- (NSString)featureIdentifier;
- (id)_onboardingCompletionsByStateWithError:(uint64_t)a1;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3;
- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (id)unitTest_didTriggerImmediateSync;
- (int64_t)currentOnboardingVersion;
- (uint64_t)_onboardedCountryCodeSupportedStateFromOnboardingCompletionsByState:(uint64_t)a1;
- (void)_triggerImmediateSyncWithReason:(uint64_t)a1;
- (void)dealloc;
- (void)disableAndExpiryProviderDidUpdate:(id)a3;
- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4;
- (void)getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)onboardingCompletionManager:(id)a3 didUpdateOnboardingCompletionsForFeatureIdentifier:(id)a4;
- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3;
- (void)regionAvailabilityProvidingDidUpdate:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4;
- (void)resetOnboardingWithCompletion:(id)a3;
- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)setCurrentOnboardingVersion:(int64_t)a3;
- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setUnitTest_didTriggerImmediateSync:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDFeatureAvailabilityManager

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 currentOnboardingVersion:(int64_t)a5 loggingCategory:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = +[HDRegionAvailabilityProvider uncheckedAvailability];
  v14 = [(HDFeatureAvailabilityManager *)self initWithProfile:v12 featureIdentifier:v11 currentOnboardingVersion:a5 pairedDeviceCapability:0 regionAvailabilityProvider:v13 loggingCategory:v10];

  return v14;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 currentOnboardingVersion:(int64_t)a5 pairedDeviceCapability:(id)a6 regionAvailabilityProvider:(id)a7 loggingCategory:(id)a8
{
  v14 = (void *)MEMORY[0x1E4F2B028];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  v20 = [v14 noRequirements];
  v21 = objc_alloc_init(HDFeatureNeverDisabledOrExpiredProvider);
  v22 = [(HDFeatureAvailabilityManager *)self initWithProfile:v19 featureIdentifier:v18 availabilityRequirements:v20 currentOnboardingVersion:a5 pairedDeviceCapability:v17 regionAvailabilityProvider:v16 disableAndExpiryProvider:v21 loggingCategory:v15];

  return v22;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 regionAvailabilityProvider:(id)a8 disableAndExpiryProvider:(id)a9 loggingCategory:(id)a10
{
  id v16 = NSString;
  id v28 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v27 = a5;
  id v20 = a4;
  id v21 = a3;
  v30 = objc_msgSend(v16, "stringWithFormat:", @"%ld", a6);
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F2AFE8]) initWithFeatureVersion:v30 updateVersion:v30 UDIDeviceIdentifier:0 yearOfRelease:0];
  v26 = [[HDLocalFeatureAttributesProvider alloc] initWithLocalFeatureAttributes:v29];
  v22 = [v21 daemon];
  v23 = [v22 nanoRegistryDeviceCapabilityProvider];

  v24 = [[HDFeatureAvailabilityOnboardingEligibilityDeterminer alloc] initWithFeatureIdentifier:v20 currentOnboardingVersion:a6 pairedDeviceCapability:v19 pairedDeviceCapabilityProvider:v23 regionAvailabilityProvider:v18 disableAndExpiryProvider:v17 loggingCategory:v28];
  v32 = [(HDFeatureAvailabilityManager *)self initWithProfile:v21 featureIdentifier:v20 availabilityRequirements:v27 currentOnboardingVersion:a6 pairedDeviceCapability:v19 pairedFeatureAttributesProvider:v26 regionAvailabilityProvider:v18 disableAndExpiryProvider:v17 onboardingEligibilityDeterminer:v24 featureSettingsAtOnboardingTimeValidator:0 loggingCategory:v28];

  return v32;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 pairedFeatureAttributesProvider:(id)a8 regionAvailabilityProvider:(id)a9 disableAndExpiryProvider:(id)a10 loggingCategory:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v29 = a8;
  id v20 = a7;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [v23 daemon];
  id v28 = [v24 nanoRegistryDeviceCapabilityProvider];

  v25 = [[HDFeatureAvailabilityOnboardingEligibilityDeterminer alloc] initWithFeatureIdentifier:v22 currentOnboardingVersion:a6 pairedDeviceCapability:v20 pairedDeviceCapabilityProvider:v28 regionAvailabilityProvider:v19 disableAndExpiryProvider:v18 loggingCategory:v17];
  v26 = [(HDFeatureAvailabilityManager *)self initWithProfile:v23 featureIdentifier:v22 availabilityRequirements:v21 currentOnboardingVersion:a6 pairedDeviceCapability:v20 pairedFeatureAttributesProvider:v29 regionAvailabilityProvider:v19 disableAndExpiryProvider:v18 onboardingEligibilityDeterminer:v25 featureSettingsAtOnboardingTimeValidator:0 loggingCategory:v17];

  return v26;
}

- (HDFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 availabilityRequirements:(id)a5 currentOnboardingVersion:(int64_t)a6 pairedDeviceCapability:(id)a7 pairedFeatureAttributesProvider:(id)a8 regionAvailabilityProvider:(id)a9 disableAndExpiryProvider:(id)a10 onboardingEligibilityDeterminer:(id)a11 featureSettingsAtOnboardingTimeValidator:(id)a12 loggingCategory:(id)a13
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v19 = v17;
  id v44 = v18;
  id v20 = a5;
  id v43 = a7;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v21 = a12;
  id v45 = a13;
  v46.receiver = self;
  v46.super_class = (Class)HDFeatureAvailabilityManager;
  id v22 = [(HDFeatureAvailabilityManager *)&v46 init];
  id v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_profile, v17);
    objc_storeStrong((id *)&v23->_loggingCategory, a13);
    objc_storeStrong((id *)&v23->_featureIdentifier, obj);
    v23->_currentOnboardingVersion = a6;
    objc_storeStrong((id *)&v23->_pairedDeviceCapability, a7);
    v24 = [v17 daemon];
    uint64_t v25 = [v24 nanoRegistryDeviceCapabilityProvider];
    pairedDeviceCapabilityProvider = v23->_pairedDeviceCapabilityProvider;
    v23->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v25;

    objc_storeStrong((id *)&v23->_pairedFeatureAttributesProvider, a8);
    objc_storeStrong((id *)&v23->_regionAvailabilityProvider, a9);
    objc_storeStrong((id *)&v23->_disableAndExpiryProvider, a10);
    objc_storeStrong((id *)&v23->_onboardingEligibilityDeterminer, a11);
    if (v20)
    {
      id v27 = (HKFeatureAvailabilityRequirementSet *)v20;
    }
    else
    {
      id v20 = 0;
      id v27 = [MEMORY[0x1E4F2B028] noRequirements];
    }
    requirements = v23->_requirements;
    v23->_requirements = v27;

    id v29 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v30 = [(HDFeatureAvailabilityManager *)v23 description];
    uint64_t v31 = [v29 initWithName:v30 loggingCategory:v45];
    observers = v23->_observers;
    v23->_observers = (HKObserverSet *)v31;

    uint64_t v33 = HKCreateSerialDispatchQueue();
    queue = v23->_queue;
    v23->_queue = (OS_dispatch_queue *)v33;

    [(HDPairedDeviceCapabilityProviding *)v23->_pairedDeviceCapabilityProvider registerObserver:v23 queue:v23->_queue];
    [(HDFeatureDisableAndExpiryProviding *)v23->_disableAndExpiryProvider setDelegate:v23];
    if ([(HDRegionAvailabilityProviding *)v23->_regionAvailabilityProvider conformsToProtocol:&unk_1F17FBF20])[(HDRegionAvailabilityProviding *)v23->_regionAvailabilityProvider setDelegate:v23]; {
    objc_storeStrong((id *)&v23->_featureSettingsAtOnboardingTimeValidator, a12);
    }
  }

  return v23;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@:%@", objc_opt_class(), self->_featureIdentifier];
}

- (void)dealloc
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained featureSettingsManager];
  [v5 unregisterObserver:self];

  id v6 = objc_loadWeakRetained((id *)p_profile);
  v7 = [v6 onboardingCompletionManager];
  [v7 unregisterObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)HDFeatureAvailabilityManager;
  [(HDFeatureAvailabilityManager *)&v8 dealloc];
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  v4 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  v5 = -[HDFeatureAvailabilityManager _onboardingCompletionsByStateWithError:]((uint64_t)self, &v19);
  id v6 = (HDFeatureAvailabilityManager *)v19;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = -[HDFeatureAvailabilityManager _onboardedCountryCodeSupportedStateFromOnboardingCompletionsByState:]((uint64_t)v4, v5);
    if (v8 == 1)
    {
      v4 = 0;
LABEL_16:
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F2B050]) initWithOnboardingState:v8 onboardingCompletionsByState:v5 featureSettings:v4];
      goto LABEL_21;
    }
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_profile);
      id v11 = [WeakRetained featureSettingsManager];
      featureIdentifier = v4->_featureIdentifier;
      id v20 = 0;
      v13 = [v11 featureSettingsForFeatureIdentifier:featureIdentifier error:&v20];
      id v14 = v20;

      if (v14)
      {
        id v15 = (HDFeatureAvailabilityManager *)v14;
        _HKInitializeLogging();
        loggingCategory = v4->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v22 = v4;
          __int16 v23 = 2114;
          v24 = v15;
          _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get keys/values out of feature settings domain: %{public}@", buf, 0x16u);
        }
        v4 = 0;
      }
      else
      {
        v4 = v13;
        id v15 = v7;
      }
    }
    else
    {
      id v15 = v7;
    }
    id v17 = v15;

    if (v4)
    {
      v7 = v17;
      goto LABEL_16;
    }
    v4 = v17;
    if (v4)
    {
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_6;
    }
  }
  else
  {
    v4 = v6;
    if (v4)
    {
      if (!a3)
      {
LABEL_19:
        _HKLogDroppedError();
        v9 = 0;
        v7 = v4;
        goto LABEL_21;
      }
LABEL_6:
      v4 = v4;
      v9 = 0;
      *a3 = v4;
      v7 = v4;
      goto LABEL_21;
    }
  }
  v7 = 0;
  v9 = 0;
LABEL_21:

  return v9;
}

- (id)_onboardingCompletionsByStateWithError:(uint64_t)a1
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v5 = [WeakRetained onboardingCompletionManager];
    uint64_t v6 = *(void *)(a1 + 24);
    id v48 = 0;
    v7 = [v5 onboardingCompletionsForHighestVersionOfFeatureIdentifier:v6 error:&v48];
    id v8 = v48;

    if (v7)
    {
      id v9 = v7;
      id v10 = 0;
    }
    else
    {
      _HKInitializeLogging();
      id v11 = *(NSObject **)(a1 + 16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = a1;
        __int16 v54 = 2114;
        id v55 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch highest version of onboarding completed: %{public}@", buf, 0x16u);
      }
      id v12 = v8;
      id v10 = v12;
      if (v12) {
        id v13 = v12;
      }
    }
    id v14 = v10;
    id v15 = v14;
    if (!v7)
    {
      id v38 = v14;
      id v17 = v38;
      if (v38)
      {
        if (a2)
        {
          id v17 = v38;
          v37 = 0;
          *a2 = v17;
        }
        else
        {
          _HKLogDroppedError();
          v37 = 0;
        }
        id v18 = v17;
      }
      else
      {
        id v18 = 0;
        v37 = 0;
      }
      goto LABEL_31;
    }
    id v16 = *(void **)(a1 + 88);
    id v47 = v15;
    id v17 = [v16 onboardingEligibilitiesForOnboardingCompletions:v7 error:&v47];
    id v18 = v47;

    if (v17)
    {
      id v41 = v18;
      id v42 = v7;
      id v19 = (void *)MEMORY[0x1E4F1CA60];
      v50[0] = &unk_1F17EB550;
      id v20 = [MEMORY[0x1E4F1CA48] array];
      v51[0] = v20;
      v50[1] = &unk_1F17EB598;
      id v21 = [MEMORY[0x1E4F1CA48] array];
      v51[1] = v21;
      v50[2] = &unk_1F17EB580;
      id v22 = [MEMORY[0x1E4F1CA48] array];
      v51[2] = v22;
      v50[3] = &unk_1F17EB568;
      __int16 v23 = [MEMORY[0x1E4F1CA48] array];
      v51[3] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];
      id v25 = [v19 dictionaryWithDictionary:v24];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v26 = v17;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v44 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v32 = NSNumber;
            uint64_t v33 = [v31 onboardingEligibility];
            v34 = objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "onboardedCountrySupportedState"));
            v35 = [v25 objectForKeyedSubscript:v34];
            v36 = [v31 onboardingCompletion];
            [v35 addObject:v36];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v49 count:16];
        }
        while (v28);
      }

      v37 = objc_msgSend(v25, "hk_map:", &__block_literal_global_68);
      v7 = v42;
      id v18 = v41;
      goto LABEL_30;
    }
    id v39 = v18;
    id v25 = v39;
    if (v39)
    {
      if (a2)
      {
        id v25 = v39;
        v37 = 0;
        *a2 = v25;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      _HKLogDroppedError();
    }
    v37 = 0;
    goto LABEL_30;
  }
  v37 = 0;
LABEL_32:

  return v37;
}

- (uint64_t)_onboardedCountryCodeSupportedStateFromOnboardingCompletionsByState:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ([v3 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v5 = [&unk_1F17E9540 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        a1 = 3;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(&unk_1F17E9540);
            }
            id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            id v10 = [v4 objectForKeyedSubscript:v9];
            uint64_t v11 = [v10 count];

            if (v11)
            {
              a1 = [v9 integerValue];
              goto LABEL_15;
            }
          }
          uint64_t v6 = [&unk_1F17E9540 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      else
      {
        a1 = 3;
      }
    }
    else
    {
      a1 = 1;
    }
  }
LABEL_15:

  return a1;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  uint64_t v5 = [(HDFeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  id v10 = 0;
  v4 = [(HDFeatureAvailabilityManager *)self onboardedCountryCodeSupportedStateWithError:&v10];
  id v5 = v10;
  id v6 = v5;
  if (v4)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isEqual:", &unk_1F17EB550));
  }
  else
  {
    id v8 = v5;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v7 = 0;
  }

  return v7;
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  id v5 = [(HDFeatureAvailabilityManager *)self isCurrentOnboardingVersionCompletedWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v6 = [WeakRetained onboardingCompletionManager];
    featureIdentifier = self->_featureIdentifier;
    id v50 = 0;
    id v8 = [v6 onboardingCompletionsForLowestVersionOfFeatureIdentifier:featureIdentifier error:&v50];
    id v9 = v50;

    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = 0;
    }
    else
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = self;
        __int16 v54 = 2114;
        id v55 = v9;
        _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch lowest version of onboarding completed: %{public}@", buf, 0x16u);
      }
      id v13 = v9;
      uint64_t v11 = v13;
      if (v13) {
        id v14 = v13;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v8 = 0;
  }
  id v15 = v11;
  id v16 = v15;
  if (!v8)
  {
    id v16 = v15;
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_40;
  }
  if (![v8 count])
  {
    _HKInitializeLogging();
    id v40 = self->_loggingCategory;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = self;
      _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
    }
LABEL_40:
    id v38 = 0;
    goto LABEL_46;
  }
  id v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v43 = v8;
  id obj = v8;
  uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id v42 = a3;
    uint64_t v20 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        id v22 = v16;
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(obj);
        }
        __int16 v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v24 = objc_msgSend(v23, "countryCode", v42);
        id v45 = v16;
        id v25 = [(HDFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:v24 error:&v45];
        id v16 = v45;

        if (!v25)
        {
          id v39 = v16;
          id v16 = v39;
          id v8 = v43;
          if (v39)
          {
            if (v42) {
              *id v42 = v39;
            }
            else {
              _HKLogDroppedError();
            }
          }

          id v38 = 0;
          goto LABEL_45;
        }
        int v26 = [v25 isEligible];
        _HKInitializeLogging();
        uint64_t v27 = self->_loggingCategory;
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            uint64_t v29 = v27;
            v30 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138543618;
            uint64_t v53 = self;
            __int16 v54 = 2114;
            id v55 = v30;
            _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found with supported country code: %{public}@", buf, 0x16u);
          }
          uint64_t v31 = [v23 completionDate];
          uint64_t v32 = [v17 earlierDate:v31];

          id v17 = (id)v32;
        }
        else if (v28)
        {
          uint64_t v33 = v27;
          v34 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543618;
          uint64_t v53 = self;
          __int16 v54 = 2114;
          id v55 = v34;
          _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found with unsupported country code: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  v35 = [MEMORY[0x1E4F1C9C8] distantFuture];
  int v36 = [v17 isEqualToDate:v35];

  if (v36)
  {
    _HKInitializeLogging();
    v37 = self->_loggingCategory;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = self;
      _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completions meet the current requirements", buf, 0xCu);
    }
    id v38 = 0;
  }
  else
  {
    id v17 = v17;
    id v38 = v17;
  }
  id v8 = v43;
LABEL_45:

LABEL_46:

  return v38;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v13 = 0;
  id v7 = [(HDFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:v6 error:&v13];
  id v8 = v13;
  if (v7)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isEligible"));
    goto LABEL_14;
  }
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to determine onboarding eligibility: %{public}@", buf, 0x16u);
    if (v8) {
      goto LABEL_5;
    }
  }
  else if (v8)
  {
LABEL_5:
    id v11 = v8;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Unexpected failure when evaluating eligibility for %@", v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_8:
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError();
    }

    if (v8) {
      goto LABEL_13;
    }
  }

LABEL_13:
  id v9 = 0;
LABEL_14:

  return v9;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  return [(HDFeatureAvailabilityOnboardingEligibilityDeterminer *)self->_onboardingEligibilityDeterminer onboardingEligibilityForCountryCode:a3 error:a4];
}

void __71__HDFeatureAvailabilityManager__onboardingCompletionsByStateWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
    v7[2](v7, v9, v8);
  }
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  id v11 = 0;
  id v5 = -[HDFeatureAvailabilityManager _onboardingCompletionsByStateWithError:]((uint64_t)self, &v11);
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDFeatureAvailabilityManager _onboardedCountryCodeSupportedStateFromOnboardingCompletionsByState:]((uint64_t)self, v5));
  }
  else
  {
    id v9 = v6;
    if (v9)
    {
      if (a3) {
        *a3 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v8 = 0;
  }

  return v8;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
  if (pairedDeviceCapabilityProvider && (pairedDeviceCapability = self->_pairedDeviceCapability) != 0)
  {
    id v7 = [(HDPairedDeviceCapabilityProviding *)pairedDeviceCapabilityProvider isCapabilitySupportedOnActivePairedDevice:pairedDeviceCapability error:a3];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v7;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  return (id)[(HDPairedFeatureAttributesProviding *)self->_pairedFeatureAttributesProvider currentPairedFeatureAttributes];
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return self->_requirements;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)[(HDRegionAvailabilityProviding *)self->_regionAvailabilityProvider regionAvailability];
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v22 = a3;
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x1E4F2B2D8];
  id v14 = a7;
  id v15 = a6;
  id v16 = [v13 alloc];
  id v17 = v16;
  featureIdentifier = self->_featureIdentifier;
  int64_t currentOnboardingVersion = self->_currentOnboardingVersion;
  if (v12)
  {
    uint64_t v20 = (void *)[v16 initWithFeatureIdentifier:self->_featureIdentifier version:self->_currentOnboardingVersion completionDate:v12 countryCode:v22 countryCodeProvenance:a4];
  }
  else
  {
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v20 = (void *)[v17 initWithFeatureIdentifier:featureIdentifier version:currentOnboardingVersion completionDate:v21 countryCode:v22 countryCodeProvenance:a4];
  }
  [(HDFeatureAvailabilityManager *)self saveOnboardingCompletion:v20 settings:v15 completion:v14];
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = v9;
  featureSettingsAtOnboardingTimeValidator = self->_featureSettingsAtOnboardingTimeValidator;
  id v13 = v11;
  if (featureSettingsAtOnboardingTimeValidator
    && (id v25 = 0,
        [(HDFeatureSettingsValidating *)featureSettingsAtOnboardingTimeValidator featureSettingsGivenBaseSettings:v11 onboardingCompletion:v8 error:&v25], v13 = (id)objc_claimAutoreleasedReturnValue(), id v14 = v25, v11, v14))
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings failed validation: %{public}@", buf, 0x16u);
    }
    v10[2](v10, 0, v14);
  }
  else
  {
    id v24 = 0;
    id v16 = v8;
    id v17 = v13;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v19 = [WeakRetained database];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __88__HDFeatureAvailabilityManager__insertOnboardingCompletion_featureSettingsValues_error___block_invoke;
    uint64_t v27 = &unk_1E62FB0D0;
    id v13 = v17;
    id v28 = v13;
    id v29 = WeakRetained;
    id v20 = v16;
    id v30 = v20;
    uint64_t v31 = self;
    id v21 = WeakRetained;
    BOOL v22 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v19 error:&v24 block:buf inaccessibilityHandler:0];

    id v14 = v24;
    _HKInitializeLogging();
    __int16 v23 = self->_loggingCategory;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set current onboarding version completed with success", buf, 0xCu);
      }
      -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, @"Onboarding completed");
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set current onboarding version completed: %{public}@", buf, 0x16u);
    }
    v10[2](v10, v22, v14);
  }
}

- (void)_triggerImmediateSyncWithReason:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v5 = [WeakRetained nanoSyncManager];
    id v6 = [NSString stringWithFormat:@"[%@] %@", a1, v3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke;
    v17[3] = &unk_1E62F5D48;
    v17[4] = a1;
    id v7 = v3;
    id v18 = v7;
    [v5 syncHealthDataWithOptions:0 reason:v6 completion:v17];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithChangesSyncRequest:v8];
    id v10 = objc_loadWeakRetained((id *)(a1 + 8));
    id v11 = [v10 cloudSyncManager];
    id v12 = [NSString stringWithFormat:@"[%@] %@", a1, v7];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke_397;
    v15[3] = &unk_1E62F5D48;
    v15[4] = a1;
    id v13 = v7;
    id v16 = v13;
    [v11 syncWithRequest:v9 reason:v12 completion:v15];

    uint64_t v14 = *(void *)(a1 + 120);
    if (v14) {
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v13);
    }
  }
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_profile = &self->_profile;
  id v9 = (void (**)(id, uint64_t, id))a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v13 = [WeakRetained featureSettingsManager];
  featureIdentifier = self->_featureIdentifier;
  id v18 = 0;
  uint64_t v15 = [v13 setFeatureSettingsData:v11 forKey:v10 featureIdentifier:featureIdentifier error:&v18];

  id v16 = v18;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (v15)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = self;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set data for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, @"Did set data for key");
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2114;
    id v22 = v16;
    _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set data for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v9[2](v9, v15, v16);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_profile = &self->_profile;
  id v9 = (void (**)(id, uint64_t, id))a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v13 = [WeakRetained featureSettingsManager];
  featureIdentifier = self->_featureIdentifier;
  id v18 = 0;
  uint64_t v15 = [v13 setFeatureSettingsNumber:v11 forKey:v10 featureIdentifier:featureIdentifier suppressNotificationsToObserver:0 error:&v18];

  id v16 = v18;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (v15)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = self;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set number for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, @"Did set number for key");
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2114;
    id v22 = v16;
    _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set number for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v9[2](v9, v15, v16);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_profile = &self->_profile;
  id v9 = (void (**)(id, uint64_t, id))a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v13 = [WeakRetained featureSettingsManager];
  featureIdentifier = self->_featureIdentifier;
  id v18 = 0;
  uint64_t v15 = [v13 setFeatureSettingsString:v11 forKey:v10 featureIdentifier:featureIdentifier error:&v18];

  id v16 = v18;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (v15)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = self;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did set string for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, @"Did set string for key");
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2114;
    id v22 = v16;
    _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set string for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v9[2](v9, v15, v16);
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_profile = &self->_profile;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v10 = [WeakRetained featureSettingsManager];
  featureIdentifier = self->_featureIdentifier;
  id v15 = 0;
  uint64_t v12 = [v10 removeFeatureSettingsValueForKey:v8 featureIdentifier:featureIdentifier error:&v15];

  id v13 = v15;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (v12)
  {
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did remove value for key in feature settings domain with success", buf, 0xCu);
    }
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, @"Did remove setting for key");
  }
  else if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove value for key in feature settings domain, with error: %{public}@", buf, 0x16u);
  }
  v7[2](v7, v12, v13);
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_profile = &self->_profile;
  id v5 = (void (**)(id, BOOL, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v7 = [WeakRetained database];
  id v15 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__HDFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke;
  v12[3] = &unk_1E62F2AE0;
  id v8 = WeakRetained;
  id v13 = v8;
  uint64_t v14 = self;
  BOOL v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v15 block:v12 inaccessibilityHandler:0];
  id v10 = v15;

  if (v9)
  {
    -[HDFeatureAvailabilityManager _triggerImmediateSyncWithReason:]((uint64_t)self, @"Onboarding reset");
  }
  else
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to reset onboarding: %{public}@", buf, 0x16u);
    }
  }
  v5[2](v5, v9, v10);
}

uint64_t __62__HDFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [*(id *)(a1 + 32) featureSettingsManager];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(v6 + 24);
  id v17 = 0;
  char v8 = [v5 resetFeatureSettingsForFeatureIdentifier:v7 suppressNotificationsToObserver:v6 error:&v17];
  id v9 = v17;

  if ((v8 & 1) == 0)
  {
    id v13 = v9;
    if (!v13)
    {
LABEL_10:

      uint64_t v14 = 0;
      goto LABEL_11;
    }
    if (!a3)
    {
LABEL_9:
      _HKLogDroppedError();
      goto LABEL_10;
    }
LABEL_6:
    id v13 = v13;
    *a3 = v13;
    goto LABEL_10;
  }
  id v10 = [*(id *)(a1 + 32) onboardingCompletionManager];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 24);
  id v16 = v9;
  char v12 = [v10 resetOnboardingCompletionsForFeature:v11 error:&v16];
  id v13 = v16;

  if ((v12 & 1) == 0)
  {
    id v13 = v13;
    if (!v13) {
      goto LABEL_10;
    }
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __88__HDFeatureAvailabilityManager__insertOnboardingCompletion_featureSettingsValues_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = [*(id *)(a1 + 40) featureSettingsManager];
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = [*(id *)(a1 + 48) featureIdentifier];
    uint64_t v9 = *(void *)(a1 + 56);
    id v19 = 0;
    char v10 = [v6 setFeatureSettingsValues:v7 featureIdentifier:v8 suppressNotificationsToObserver:v9 error:&v19];
    id v11 = v19;

    if ((v10 & 1) == 0)
    {
      id v12 = v11;
      if (!v12)
      {
LABEL_14:

        uint64_t v16 = 0;
        goto LABEL_15;
      }
      if (a3)
      {
LABEL_5:
        id v12 = v12;
        *a3 = v12;
        goto LABEL_14;
      }
LABEL_13:
      _HKLogDroppedError();
      goto LABEL_14;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v13 = [*(id *)(a1 + 40) onboardingCompletionManager];
  uint64_t v14 = *(void *)(a1 + 48);
  id v18 = v11;
  char v15 = [v13 insertOnboardingCompletion:v14 error:&v18];
  id v12 = v18;

  if ((v15 & 1) == 0 && (!*(void *)(a1 + 32) || (objc_msgSend(v12, "hk_isDuplicateObjectError") & 1) == 0))
  {
    id v12 = v12;
    if (!v12) {
      goto LABEL_14;
    }
    if (a3) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  uint64_t v16 = 1;
LABEL_15:

  return v16;
}

void __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543874;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] NanoSync failed after %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

void __64__HDFeatureAvailabilityManager__triggerImmediateSyncWithReason___block_invoke_397(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 138543618;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      int v10 = "[%{public}@] Cloud sync request completed after %{public}@";
      uint64_t v11 = v7;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v8)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543874;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    id v19 = v5;
    int v10 = "[%{public}@] Cloud sync request failed after %{public}@: %{public}@";
    uint64_t v11 = v7;
    uint32_t v12 = 32;
    goto LABEL_6;
  }
}

- (void)setCurrentOnboardingVersion:(int64_t)a3
{
  self->_int64_t currentOnboardingVersion = a3;
  -[HDFeatureAvailabilityOnboardingEligibilityDeterminer setCurrentOnboardingVersion:](self->_onboardingEligibilityDeterminer, "setCurrentOnboardingVersion:");
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  p_profile = &self->_profile;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  observers = self->_observers;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v12[3] = &unk_1E62F31C0;
  id v13 = WeakRetained;
  int v14 = self;
  id v11 = WeakRetained;
  [(HKObserverSet *)observers registerObserver:v8 queue:v7 runIfFirstObserver:v12];
}

void __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) featureSettingsManager];
  [v2 registerObserver:*(void *)(a1 + 40) featureIdentifier:*(void *)(*(void *)(a1 + 40) + 24) queue:*(void *)(*(void *)(a1 + 40) + 112)];

  id v3 = [*(id *)(a1 + 32) onboardingCompletionManager];
  [v3 registerObserver:*(void *)(a1 + 40) featureIdentifier:*(void *)(*(void *)(a1 + 40) + 24) queue:*(void *)(*(void *)(a1 + 40) + 112)];

  [*(id *)(*(void *)(a1 + 40) + 48) registerObserver:*(void *)(a1 + 40) queue:*(void *)(*(void *)(a1 + 40) + 112)];
  v4 = [*(id *)(a1 + 32) database];
  char v5 = [v4 isDataProtectedByFirstUnlockAvailable];

  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(NSObject **)(v6 + 16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] First unlock has not occurred, registering to notify when it has", buf, 0xCu);
    }
    id v8 = [*(id *)(a1 + 32) database];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(v9 + 112);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke_398;
    v11[3] = &unk_1E62F3208;
    v11[4] = v9;
    [v8 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:v10 block:v11];
  }
}

uint64_t __55__HDFeatureAvailabilityManager_registerObserver_queue___block_invoke_398(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 112));
    _HKInitializeLogging();
    v2 = *(NSObject **)(v1 + 16);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v4) = 138543362;
      *(void *)((char *)&v4 + 4) = v1;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying for first unlock", (uint8_t *)&v4, 0xCu);
    }
    id v3 = *(void **)(v1 + 104);
    *(void *)&long long v4 = MEMORY[0x1E4F143A8];
    *((void *)&v4 + 1) = 3221225472;
    char v5 = __76__HDFeatureAvailabilityManager__queue_dataProtectedByFirstUnlockIsAvailable__block_invoke;
    uint64_t v6 = &unk_1E62FBEE8;
    uint64_t v7 = v1;
    return [v3 notifyObservers:&v4];
  }
  return result;
}

- (void)unregisterObserver:(id)a3
{
}

void __76__HDFeatureAvailabilityManager__queue_dataProtectedByFirstUnlockIsAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1840808]) {
    [v3 featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:*(void *)(a1 + 32)];
  }
}

- (void)onboardingCompletionManager:(id)a3 didUpdateOnboardingCompletionsForFeatureIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    observers = self->_observers;
    uint64_t v8 = loggingCategory;
    uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of onboarding completion update", buf, 0x16u);
  }
  uint64_t v10 = self->_observers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__HDFeatureAvailabilityManager_onboardingCompletionManager_didUpdateOnboardingCompletionsForFeatureIdentifier___block_invoke;
  v11[3] = &unk_1E62FBEE8;
  v11[4] = self;
  [(HKObserverSet *)v10 notifyObservers:v11];
}

uint64_t __111__HDFeatureAvailabilityManager_onboardingCompletionManager_didUpdateOnboardingCompletionsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSNumber;
    observers = self->_observers;
    uint64_t v8 = loggingCategory;
    uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of feature settings update", buf, 0x16u);
  }
  uint64_t v10 = self->_observers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__HDFeatureAvailabilityManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke;
  v11[3] = &unk_1E62FBEE8;
  v11[4] = self;
  [(HKObserverSet *)v10 notifyObservers:v11];
}

void __93__HDFeatureAvailabilityManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdateSettings:*(void *)(a1 + 32)];
  }
}

- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = NSNumber;
    observers = self->_observers;
    uint64_t v7 = loggingCategory;
    uint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    *(_DWORD *)buf = 138543618;
    uint32_t v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of paired device capability update", buf, 0x16u);
  }
  uint64_t v9 = self->_observers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HDFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke;
  v10[3] = &unk_1E62FBEE8;
  v10[4] = self;
  [(HKObserverSet *)v9 notifyObservers:v10];
}

void __66__HDFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdatePairedDeviceCapability:*(void *)(a1 + 32)];
  }
}

- (void)regionAvailabilityProvidingDidUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = NSNumber;
    observers = self->_observers;
    uint64_t v7 = loggingCategory;
    uint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    *(_DWORD *)buf = 138543618;
    uint32_t v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of region availability update", buf, 0x16u);
  }
  uint64_t v9 = self->_observers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__HDFeatureAvailabilityManager_regionAvailabilityProvidingDidUpdate___block_invoke;
  v10[3] = &unk_1E62FBEE8;
  v10[4] = self;
  [(HKObserverSet *)v9 notifyObservers:v10];
}

void __69__HDFeatureAvailabilityManager_regionAvailabilityProvidingDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1840808]) {
    [v3 featureAvailabilityExtensionDidUpdateRegionAvailability:*(void *)(a1 + 32)];
  }
}

- (void)disableAndExpiryProviderDidUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = NSNumber;
    observers = self->_observers;
    uint64_t v7 = loggingCategory;
    uint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    *(_DWORD *)buf = 138543618;
    uint32_t v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of disable and expiry update", buf, 0x16u);
  }
  uint64_t v9 = self->_observers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HDFeatureAvailabilityManager_disableAndExpiryProviderDidUpdate___block_invoke;
  v10[3] = &unk_1E62FBEE8;
  v10[4] = self;
  [(HKObserverSet *)v9 notifyObservers:v10];
}

uint64_t __66__HDFeatureAvailabilityManager_disableAndExpiryProviderDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)currentOnboardingVersion
{
  return self->_currentOnboardingVersion;
}

- (id)unitTest_didTriggerImmediateSync
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setUnitTest_didTriggerImmediateSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didTriggerImmediateSync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_onboardingEligibilityDeterminer, 0);
  objc_storeStrong((id *)&self->_featureSettingsAtOnboardingTimeValidator, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_regionAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedFeatureAttributesProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapability, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end