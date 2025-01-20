@interface HDMobilityWalkingSteadinessFeatureAvailabilityManager
- (BOOL)_determineIsSupportedWithOnboardingCompletions:(id)a3 regionCheckBlock:(id)a4;
- (BOOL)_localRegionCheckWithCountryCode:(id)a3;
- (HDMobilityWalkingSteadinessFeatureAvailabilityManager)initWithProfile:(id)a3 regionAvailabilityProvider:(id)a4;
- (NSString)featureIdentifier;
- (id)_onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)_onboardingCompletionsForHighestVersionWithError:(id *)a3;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)canCompleteOnboardingWhileBypassingDeviceForDemoDataPurposesWithCountryCode:(id)a3;
- (id)description;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (int64_t)_currentOnboardingVersion;
- (int64_t)_unitTest_currentOnboardingVersionOverride;
- (void)getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4;
- (void)resetOnboardingWithCompletion:(id)a3;
- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)set_unitTest_currentOnboardingVersionOverride:(int64_t)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDMobilityWalkingSteadinessFeatureAvailabilityManager

- (HDMobilityWalkingSteadinessFeatureAvailabilityManager)initWithProfile:(id)a3 regionAvailabilityProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDMobilityWalkingSteadinessFeatureAvailabilityManager;
  v8 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    v9->_currentOnboardingVersion = 1;
    objc_storeStrong((id *)&v9->_supportedRegionProvider, a4);
    id v10 = objc_alloc(MEMORY[0x263F431E8]);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v12 = [v10 initWithProfile:WeakRetained featureIdentifier:*MEMORY[0x263F09818] currentOnboardingVersion:v9->_currentOnboardingVersion loggingCategory:*MEMORY[0x263F09940]];
    manager = v9->_manager;
    v9->_manager = (HDFeatureAvailabilityManager *)v12;

    v14 = v9;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDFeatureAvailabilityManager *)self->_manager featureIdentifier];
  id v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  return v6;
}

- (id)canCompleteOnboardingWhileBypassingDeviceForDemoDataPurposesWithCountryCode:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [(HDRegionAvailabilityProviding *)self->_supportedRegionProvider onboardingEligibilityForCountryCode:a3];
  v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isEligible"));

  return v5;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

- (NSString)featureIdentifier
{
  return (NSString *)[(HDFeatureAvailabilityManager *)self->_manager featureIdentifier];
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:]();
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, @"Feature settings is not implemented for Walking Steadiness.");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  v5 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self _onboardingCompletionsForHighestVersionWithError:&v12];
  id v6 = v12;
  if (v5)
  {
    if ([v5 count])
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithError___block_invoke;
      v11[3] = &unk_2645D7C98;
      v11[4] = self;
      id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _determineIsSupportedWithOnboardingCompletions:regionCheckBlock:](self, "_determineIsSupportedWithOnboardingCompletions:regionCheckBlock:", v5, v11));
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x263F09940];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = self;
        _os_log_impl(&dword_221A40000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
      }
      id v7 = (void *)MEMORY[0x263EFFA80];
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:]();
    }
    id v8 = v6;
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

uint64_t __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _localRegionCheckWithCountryCode:a2];
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self isCurrentOnboardingVersionCompletedWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  id v4 = NSNumber;
  BOOL v5 = -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _localRegionCheckWithCountryCode:](self, "_localRegionCheckWithCountryCode:", a3, a4);
  return (id)[v4 numberWithBool:v5];
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:]((uint64_t)self, v7, a2);
  }
  id v8 = (void *)MEMORY[0x263F087E8];
  v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  v11 = [v9 stringWithFormat:@"%@ is not implemented for %@", v10, objc_opt_class()];
  objc_msgSend(v8, "hk_error:description:", 110, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a4) {
      *a4 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  return (id)[(HDFeatureAvailabilityManager *)self->_manager isFeatureCapabilitySupportedOnActivePairedDeviceWithError:a3];
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  return (id)[(HDFeatureAvailabilityManager *)self->_manager earliestDateLowestOnboardingVersionCompletedWithError:a3];
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  return (id)[(HDFeatureAvailabilityManager *)self->_manager pairedFeatureAttributesWithError:a3];
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:]((uint64_t)self, v6, a2);
  }
  id v7 = (void *)MEMORY[0x263F087E8];
  id v8 = NSString;
  v9 = NSStringFromSelector(a2);
  id v10 = [v8 stringWithFormat:@"%@ is not implemented for %@", v9, objc_opt_class()];
  objc_msgSend(v7, "hk_error:description:", 110, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a3) {
      *a3 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)[(HDRegionAvailabilityProviding *)self->_supportedRegionProvider regionAvailability];
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v21 = a3;
  id v12 = a5;
  v13 = (objc_class *)MEMORY[0x263F0A5B0];
  id v14 = a7;
  id v15 = a6;
  id v16 = [v13 alloc];
  v17 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self featureIdentifier];
  int64_t v18 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self _currentOnboardingVersion];
  if (v12)
  {
    v19 = (void *)[v16 initWithFeatureIdentifier:v17 version:v18 completionDate:v12 countryCode:v21 countryCodeProvenance:a4];
  }
  else
  {
    v20 = [MEMORY[0x263EFF910] now];
    v19 = (void *)[v16 initWithFeatureIdentifier:v17 version:v18 completionDate:v20 countryCode:v21 countryCodeProvenance:a4];
  }
  [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self saveOnboardingCompletion:v19 settings:v15 completion:v14];
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, id))a5;
  v9 = [v7 countryCode];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v11 = [WeakRetained onboardingCompletionManager];
    id v17 = 0;
    uint64_t v12 = [v11 insertOnboardingCompletion:v7 error:&v17];
    v13 = (void (**)(id, uint64_t, id))v17;

    if (v12)
    {
      id v14 = [WeakRetained nanoSyncManager];
      id v15 = [NSString stringWithFormat:@"[%@] Onboarding completed", self];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke;
      v16[3] = &unk_2645D7B68;
      v16[4] = self;
      [v14 syncHealthDataWithOptions:0 reason:v15 completion:v16];
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
        -[HDMobilityWalkingSteadinessFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:]();
      }
    }
    v8[2](v8, v12, v13);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:]();
    }
    id WeakRetained = objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"Country code <nil> is not an allowed country code");
    v8[2](v8, 0, WeakRetained);
    v13 = v8;
  }
}

void __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x263F09940];
  id v7 = *MEMORY[0x263F09940];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_221A40000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after onboarding completed", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:]();
  }
  id v6 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, @"Feature settings is not implemented for Walking Steadiness.");
  v5[2](v5, 0, v6);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:]();
  }
  id v6 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, @"Feature settings is not implemented for Walking Steadiness.");
  v5[2](v5, 0, v6);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:]();
  }
  id v6 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, @"Feature settings is not implemented for Walking Steadiness.");
  v5[2](v5, 0, v6);
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
    -[HDMobilityWalkingSteadinessFeatureAvailabilityManager featureOnboardingRecordWithError:]();
  }
  id v5 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, @"Feature settings is not implemented for Walking Steadiness.");
  v4[2](v4, 0, v5);
}

- (void)resetOnboardingWithCompletion:(id)a3
{
}

- (int64_t)_currentOnboardingVersion
{
  if (![(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self _unitTest_currentOnboardingVersionOverride])return self->_currentOnboardingVersion; {
  return [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self _unitTest_currentOnboardingVersionOverride];
  }
}

- (id)_onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v14 = 0;
  id v5 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self _onboardingCompletionsForHighestVersionWithError:&v14];
  id v6 = v14;
  if (v5)
  {
    if ([v5 count])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager__onboardedCountryCodeSupportedStateWithError___block_invoke;
      v13[3] = &unk_2645D7C98;
      v13[4] = self;
      if ([(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self _determineIsSupportedWithOnboardingCompletions:v5 regionCheckBlock:v13])
      {
        uint64_t v7 = 2;
      }
      else
      {
        uint64_t v7 = 3;
      }
      _HKInitializeLogging();
      uint64_t v8 = *MEMORY[0x263F09940];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v16 = self;
        __int16 v17 = 1026;
        int v18 = v7;
        _os_log_impl(&dword_221A40000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarded country code state: %{public}i", buf, 0x12u);
      }
      int v9 = [NSNumber numberWithInteger:v7];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v11 = *MEMORY[0x263F09940];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = self;
        _os_log_impl(&dword_221A40000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
      }
      int v9 = &unk_26D3F97F8;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:]();
    }
    id v10 = v6;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int v9 = 0;
  }

  return v9;
}

uint64_t __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager__onboardedCountryCodeSupportedStateWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _localRegionCheckWithCountryCode:a2];
}

- (BOOL)_determineIsSupportedWithOnboardingCompletions:(id)a3 regionCheckBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (uint64_t (**)(id, void *))a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
  uint64_t v11 = (os_log_t *)MEMORY[0x263F09940];
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v31;
    *(void *)&long long v10 = 138543362;
    long long v29 = v10;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v8);
      }
      id v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      uint64_t v16 = objc_msgSend(v15, "version", v29, (void)v30);
      if (v16 >= [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self _currentOnboardingVersion])
      {
        v20 = [v15 countryCode];

        if (v20)
        {
          id v21 = [v15 countryCode];
          int v22 = v7[2](v7, v21);

          _HKInitializeLogging();
          v23 = *v11;
          BOOL v24 = os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v24)
            {
              *(_DWORD *)buf = v29;
              v35 = self;
              _os_log_impl(&dword_221A40000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found that satisfies region check", buf, 0xCu);
            }

            BOOL v27 = 1;
            goto LABEL_23;
          }
          if (!v24) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = v29;
          v35 = self;
          int v18 = v23;
          uint64_t v19 = "[%{public}@] Onboarding completion found that does not satisfy region check";
          goto LABEL_15;
        }
        _HKInitializeLogging();
        os_log_t v25 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          v35 = self;
          int v18 = v25;
          uint64_t v19 = "[%{public}@] Onboarding completion found with no country code";
          goto LABEL_15;
        }
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v17 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          v35 = self;
          int v18 = v17;
          uint64_t v19 = "[%{public}@] Onboarding completion found with older version than current";
LABEL_15:
          _os_log_impl(&dword_221A40000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        }
      }
LABEL_16:
      if (v12 == ++v14)
      {
        uint64_t v12 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _HKInitializeLogging();
  v26 = *v11;
  BOOL v27 = 0;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = self;
    _os_log_impl(&dword_221A40000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completions meet the current requirements", buf, 0xCu);
    BOOL v27 = 0;
  }
LABEL_23:

  return v27;
}

- (id)_onboardingCompletionsForHighestVersionWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained onboardingCompletionManager];
  uint64_t v7 = [(HDMobilityWalkingSteadinessFeatureAvailabilityManager *)self featureIdentifier];
  id v13 = 0;
  id v8 = [v6 onboardingCompletionsForHighestVersionOfFeatureIdentifier:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessFeatureAvailabilityManager _onboardingCompletionsForHighestVersionWithError:]();
    }
    id v11 = v9;
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v8;
}

- (BOOL)_localRegionCheckWithCountryCode:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDRegionAvailabilityProviding *)self->_supportedRegionProvider onboardingEligibilityForCountryCode:v4];
  int v6 = [v5 isEligible];

  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x263F09940];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138543619;
      uint64_t v12 = self;
      __int16 v13 = 2113;
      id v14 = v4;
      id v9 = "[%{public}@] Country code %{private}@ supported";
LABEL_6:
      _os_log_impl(&dword_221A40000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v8)
  {
    int v11 = 138543619;
    uint64_t v12 = self;
    __int16 v13 = 2113;
    id v14 = v4;
    id v9 = "[%{public}@] Country code %{private}@ not supported";
    goto LABEL_6;
  }

  return v6;
}

- (int64_t)_unitTest_currentOnboardingVersionOverride
{
  return self->__unitTest_currentOnboardingVersionOverride;
}

- (void)set_unitTest_currentOnboardingVersionOverride:(int64_t)a3
{
  self->__unitTest_currentOnboardingVersionOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_supportedRegionProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_221A40000, v0, v1, "[%{public}@] Feature settings is not implemented for Walking Steadiness.", v2, v3, v4, v5, v6);
}

- (void)isCurrentOnboardingVersionCompletedWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Error retrieving onboarding completions: %{public}@");
}

- (void)onboardingEligibilityForCountryCode:(const char *)a3 error:.cold.1(uint64_t a1, void *a2, const char *a3)
{
  id v4 = a2;
  uint64_t v5 = NSStringFromSelector(a3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_221A40000, v6, v7, "[%{public}@] %{public}@ is not implemented", v8, v9, v10, v11, v12);
}

- (void)saveOnboardingCompletion:settings:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_221A40000, v0, v1, "[%{public}@] Cannot save onboarding completion with nil country code", v2, v3, v4, v5, v6);
}

- (void)saveOnboardingCompletion:settings:completion:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Failed to set current onboarding version completed: %{public}@");
}

void __102__HDMobilityWalkingSteadinessFeatureAvailabilityManager_saveOnboardingCompletion_settings_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_221A40000, a2, a3, "[%{public}@] NanoSync failed after onboarding completed: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_onboardingCompletionsForHighestVersionWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Failed to fetch highest version of onboarding completed: %{public}@");
}

@end