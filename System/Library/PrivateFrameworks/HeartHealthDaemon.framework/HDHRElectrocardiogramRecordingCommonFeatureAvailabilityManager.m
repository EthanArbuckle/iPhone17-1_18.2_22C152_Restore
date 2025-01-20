@interface HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager
- (HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 onboardingVersion:(unint64_t)a5 pairedFeatureAttributesProvider:(id)a6 disableAndExpiryProvider:(id)a7 regionAvailabilityProvider:(id)a8 deviceSupportedProvider:(id)a9 availabilityRequirementSet:(id)a10 cacheDefaults:(id)a11 isStandalone:(BOOL)a12;
- (NSString)description;
- (NSString)featureIdentifier;
- (id)_currentOnboardingHistoryDictionaryWithError:(id *)a3;
- (id)_makeOnboardingHistoryWithOnboardingVersion:(int64_t)a3 countryCode:(id)a4 error:(id *)a5;
- (id)_onboardedCountryCodeSupportedStateWithOnboardingCompletion:(id)a3 error:(id *)a4;
- (id)_onboardingCompletionWithError:(id *)a3;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)countryAvailabilityVersion;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3;
- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedDeviceProvider;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (unint64_t)_ineligibilityReasonsForRescindedStatus:(int64_t)a3;
- (void)_saveFirstOnboardingCompletionDateIfNeeded:(id)a3;
- (void)_setOnboardingCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 onboardingVersion:(unint64_t)a5 date:(id)a6 settings:(id)a7 completion:(id)a8;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4;
- (void)resetOnboardingWithCompletion:(id)a3;
- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDRegionAvailabilityProviding *)self->_regionAvailabilityProvider onboardingEligibilityForCountryCode:v6];
  uint64_t v8 = [v7 ineligibilityReasons];
  v9 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self pairedDeviceProvider];
  v10 = [v9 activePairedDevice];

  if (!v10)
  {
    uint64_t v21 = v8 | 2;
    id v22 = objc_alloc(MEMORY[0x1E4F2B008]);
    v23 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self countryAvailabilityVersion];
    v13 = (void *)[v22 initWithIneligibilityReasons:v21 countryAvailabilityVersion:v23];

    v18 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self featureIdentifier];
    v20 = [v13 eligibilityRespectingOverridesForFeatureIdentifier:v18];
LABEL_8:

    goto LABEL_10;
  }
  int v11 = [(HDHRElectrocardiogramDeviceSupportedStateProvider *)self->_deviceSupportedProvider isDeviceSupported:v10];
  v12 = [(HDFeatureDisableAndExpiryProviding *)self->_disableAndExpiryProvider rescindedStatusForCountryCode:v6 device:v10 error:a4];
  v13 = v12;
  if (v12)
  {
    if (v11) {
      uint64_t v14 = v8 | (v6 == 0);
    }
    else {
      uint64_t v14 = v8 | (v6 == 0) | 4;
    }
    unint64_t v15 = -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _ineligibilityReasonsForRescindedStatus:](self, "_ineligibilityReasonsForRescindedStatus:", [v12 integerValue]) | v14;
    id v16 = objc_alloc(MEMORY[0x1E4F2B008]);
    v17 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self countryAvailabilityVersion];
    v18 = (void *)[v16 initWithIneligibilityReasons:v15 countryAvailabilityVersion:v17];

    v19 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self featureIdentifier];
    v20 = [v18 eligibilityRespectingOverridesForFeatureIdentifier:v19];

    goto LABEL_8;
  }
  v20 = 0;
LABEL_10:

  return v20;
}

- (id)pairedDeviceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained daemon];
  v4 = [v3 nanoRegistryDeviceCapabilityProvider];

  return v4;
}

- (id)countryAvailabilityVersion
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v3 = [v2 currentOSBuild];

  return v3;
}

- (id)_onboardingCompletionWithError:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  id v44 = 0;
  uint64_t v8 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _currentOnboardingHistoryDictionaryWithError:&v44];
  id v9 = v44;
  v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      if (a3)
      {
        v26 = 0;
        *a3 = v9;
      }
      else
      {
        _HKLogDroppedError();
        v26 = 0;
      }
      goto LABEL_27;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v42 = v9;
  unint64_t onboardingVersion = self->_onboardingVersion;
  id v12 = v8;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v13 = [v12 allKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:buf count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v40 = v7;
    uint64_t v16 = *(void *)v46;
    v17 = (void *)MEMORY[0x1E4F1CC08];
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        if ([*(id *)(*((void *)&v45 + 1) + 8 * i) integerValue] == onboardingVersion)
        {
          v19 = objc_msgSend(NSString, "stringWithFormat:", @"%i", onboardingVersion);
          v20 = [v12 objectForKeyedSubscript:v19];
          uint64_t v21 = [(__CFString *)v20 length];
          id v22 = &stru_1F2B36C98;
          if (v21) {
            id v22 = v20;
          }
          v23 = NSNumber;
          v24 = v22;
          v25 = [v23 numberWithInteger:onboardingVersion];
          v49 = v25;
          v50 = v24;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];

          goto LABEL_14;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:buf count:16];
      if (v15) {
        continue;
      }
      break;
    }
LABEL_14:
    v7 = v40;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CC08];
  }

  if ([v17 count])
  {
    v27 = [v17 allKeys];
    v28 = [v27 lastObject];

    v29 = [v17 objectForKeyedSubscript:v28];
    id v43 = 0;
    v30 = objc_msgSend(v7, "hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:", &v43);
    id v41 = v43;
    if (!v30)
    {
      v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1.0];
    }
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v52 = self;
      __int16 v53 = 2114;
      v54 = v29;
      __int16 v55 = 2114;
      v56 = v28;
      _os_log_impl(&dword_1D3AC6000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] ECG onboarding countryCode: %{public}@, version: %{public}@", buf, 0x20u);
    }
    v32 = objc_msgSend(v7, "hdhr_electrocardiogramRecordingCountryCodeProvenanceWithError:", 0);
    id v33 = objc_alloc(MEMORY[0x1E4F2B2D8]);
    featureIdentifier = self->_featureIdentifier;
    v35 = v7;
    uint64_t v36 = [v28 integerValue];
    uint64_t v37 = [v32 integerValue];
    uint64_t v38 = v36;
    v7 = v35;
    v26 = (void *)[v33 initWithFeatureIdentifier:featureIdentifier version:v38 completionDate:v30 countryCode:v29 countryCodeProvenance:v37];
  }
  else
  {
    v26 = 0;
  }

  v10 = v42;
LABEL_27:

  return v26;
}

- (id)_currentOnboardingHistoryDictionaryWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  id v29 = 0;
  uint64_t v8 = objc_msgSend(v7, "hdhr_electrocardiogramRecordingOnboardingHistoryWithError:", &v29);
  id v9 = v29;
  v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    id v28 = 0;
    objc_msgSend(v7, "hdhr_electrocardiogramRecordingOnboardingCompletionVersionWithError:", &v28);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v28;
    if (!v12)
    {
      uint64_t v21 = [MEMORY[0x1E4F2B860] sharedBehavior];
      int v22 = [v21 isAppleWatch];

      if (!v22
        || (uint64_t v23 = [(NSUserDefaults *)self->_cacheDefaults integerForKey:*MEMORY[0x1E4F29AB0]], v23 < 1)
        || ([NSNumber numberWithInteger:v23],
            (id v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v24 = v13;
        id v12 = v24;
        if (v24)
        {
          if (a3)
          {
            id v12 = v24;
            v18 = 0;
            *a3 = v12;
            goto LABEL_34;
          }
          _HKLogDroppedError();
        }
        v18 = 0;
        goto LABEL_34;
      }
    }
    id v27 = 0;
    uint64_t v14 = objc_msgSend(v7, "hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:", &v27);
    id v15 = v27;
    objc_msgSend(v14, "hk_copyNonEmptyString");
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if (v15)
      {
        if (a3)
        {
          v18 = 0;
          *a3 = v15;
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
LABEL_16:

LABEL_34:
        goto LABEL_35;
      }
      if ([v12 integerValue])
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E4F29F50];
        uint64_t v16 = @"US";
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v31 = self;
          __int16 v32 = 2114;
          id v33 = @"US";
          _os_log_impl(&dword_1D3AC6000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding region: %{public}@ (Not Present, Assumed)", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    v18 = v17;
    if (v8) {
      [v17 addEntriesFromDictionary:v8];
    }
    if ([v12 integerValue])
    {
      if (v16) {
        v19 = v16;
      }
      else {
        v19 = &stru_1F2B36C98;
      }
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"%i", objc_msgSend(v12, "integerValue"));
      [v18 setObject:v19 forKey:v20];
    }
    goto LABEL_16;
  }
  if (a3)
  {
    v18 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    v18 = 0;
  }
LABEL_35:

  return v18;
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v29 = 0;
  v5 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _onboardingCompletionWithError:&v29];
  id v6 = v29;
  v7 = (os_log_t *)MEMORY[0x1E4F29F50];
  if (v5) {
    goto LABEL_2;
  }
  _HKInitializeLogging();
  v20 = *v7;
  uint64_t v21 = *v7;
  if (!v6)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      _os_log_impl(&dword_1D3AC6000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] ECG is not onboarded", buf, 0xCu);
    }
LABEL_2:
    id v28 = 0;
    uint64_t v8 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _onboardedCountryCodeSupportedStateWithOnboardingCompletion:v5 error:&v28];
    id v9 = v28;
    _HKInitializeLogging();
    v10 = *v7;
    BOOL v11 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      v26 = a3;
      if (v11)
      {
        id v12 = v10;
        [v8 integerValue];
        id v13 = NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
        *(_DWORD *)buf = 138543618;
        v31 = self;
        __int16 v32 = 2114;
        id v33 = v13;
        _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarded country state: %{public}@", buf, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      id v15 = [WeakRetained featureSettingsManager];
      featureIdentifier = self->_featureIdentifier;
      id v27 = 0;
      v17 = [v15 featureSettingsForFeatureIdentifier:featureIdentifier error:&v27];
      id v18 = v27;

      if (v17)
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B050]), "initWithOnboardingState:onboardingCompletion:featureSettings:", objc_msgSend(v8, "integerValue"), v5, v17);
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
          -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureOnboardingRecordWithError:]();
        }
        id v23 = v18;
        id v24 = v23;
        if (v23)
        {
          if (v26) {
            id *v26 = v23;
          }
          else {
            _HKLogDroppedError();
          }
        }

        v19 = 0;
      }

      goto LABEL_30;
    }
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Can't read ECG onboarding state with error: %{public}@", buf, 0x16u);
    }
    id v22 = v9;
    id v18 = v22;
    if (v22)
    {
      if (a3)
      {
        id v18 = v22;
        v19 = 0;
        *a3 = v18;
LABEL_30:

        goto LABEL_31;
      }
      _HKLogDroppedError();
    }
    v19 = 0;
    goto LABEL_30;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager featureOnboardingRecordWithError:]();
  }
  if (a3)
  {
    v19 = 0;
    *a3 = v6;
  }
  else
  {
    _HKLogDroppedError();
    v19 = 0;
  }
LABEL_31:

  return v19;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self featureIdentifier];
  v7 = [v3 stringWithFormat:@"<%@: %p: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (id)_onboardedCountryCodeSupportedStateWithOnboardingCompletion:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = [a3 countryCode];
    id v18 = 0;
    id v7 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:v6 error:&v18];
    id v8 = v18;
    id v9 = v8;
    if (v7)
    {
      if (self->_isStandalone)
      {
        [v7 ineligibilityReasons];
        unint64_t v10 = [v7 ineligibilityReasons] & 0xFFFFFFFFFFFFFFFDLL;
        id v11 = objc_alloc(MEMORY[0x1E4F2B008]);
        id v12 = [v7 countryAvailabilityVersion];
        uint64_t v13 = [v11 initWithIneligibilityReasons:v10 countryAvailabilityVersion:v12];

        id v7 = (id)v13;
      }
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "onboardedCountrySupportedState"));
      goto LABEL_14;
    }
    id v16 = v8;
    id v7 = v16;
    if (v16)
    {
      if (a4)
      {
        id v7 = v16;
        uint64_t v14 = 0;
        *a4 = v7;
LABEL_14:

        goto LABEL_15;
      }
      _HKLogDroppedError();
    }
    uint64_t v14 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  id v15 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_1D3AC6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] No record of onboarding found, assuming not onboarded", buf, 0xCu);
  }
  uint64_t v14 = &unk_1F2B42B20;
LABEL_15:

  return v14;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v5 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _onboardingCompletionWithError:&v13];
  id v6 = v13;
  id v7 = v6;
  if (v6)
  {
    int v8 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F50];
    unint64_t v10 = *MEMORY[0x1E4F29F50];
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = self;
        _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't read ECG onboarding completion",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:]();
    }
    if (a3)
    {
      id v11 = 0;
      *a3 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v11 = 0;
    }
  }
  else
  {
    id v11 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _onboardedCountryCodeSupportedStateWithOnboardingCompletion:v5 error:a3];
  }

  return v11;
}

- (HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager)initWithProfile:(id)a3 featureIdentifier:(id)a4 onboardingVersion:(unint64_t)a5 pairedFeatureAttributesProvider:(id)a6 disableAndExpiryProvider:(id)a7 regionAvailabilityProvider:(id)a8 deviceSupportedProvider:(id)a9 availabilityRequirementSet:(id)a10 cacheDefaults:(id)a11 isStandalone:(BOOL)a12
{
  id obj = a3;
  id v17 = a4;
  id v18 = a6;
  id v35 = a7;
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v31 = a11;
  v37.receiver = self;
  v37.super_class = (Class)HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager;
  v19 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)&v37 init];
  v20 = v19;
  if (v19)
  {
    id v29 = v17;
    objc_storeWeak((id *)&v19->_profile, obj);
    objc_storeStrong((id *)&v20->_featureIdentifier, a4);
    v20->_unint64_t onboardingVersion = a5;
    objc_storeStrong((id *)&v20->_pairedFeatureAttributesProvider, a6);
    objc_storeStrong((id *)&v20->_disableAndExpiryProvider, a7);
    objc_storeStrong((id *)&v20->_regionAvailabilityProvider, a8);
    objc_storeStrong((id *)&v20->_deviceSupportedProvider, a9);
    objc_storeStrong((id *)&v20->_availabilityRequirementSet, a10);
    objc_storeStrong((id *)&v20->_cacheDefaults, a11);
    v20->_isStandalone = a12;
    id v21 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    id v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    uint64_t v24 = [v21 initWithName:v23 loggingCategory:*MEMORY[0x1E4F29F50]];
    observers = v20->_observers;
    v20->_observers = (HKFeatureAvailabilityProvidingObserver *)v24;

    id WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    id v27 = [WeakRetained daemon];
    [v27 registerDaemonReadyObserver:v20 queue:0];

    id v17 = v29;
  }

  return v20;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self isCurrentOnboardingVersionCompletedWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  v3 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self onboardedCountryCodeSupportedStateWithError:a3];
  v4 = v3;
  if (v3)
  {
    if ([v3 integerValue] == 2) {
      v5 = (void *)MEMORY[0x1E4F1CC38];
    }
    else {
      v5 = (void *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  v4 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:a3 error:a4];
  v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isEligible"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)_ineligibilityReasonsForRescindedStatus:(int64_t)a3
{
  if (a3 == 1) {
    return 64;
  }
  else {
    return (unint64_t)(a3 == 2) << 7;
  }
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  v3 = NSNumber;
  deviceSupportedProvider = self->_deviceSupportedProvider;
  v5 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self pairedDeviceProvider];
  id v6 = [v5 activePairedDevice];
  id v7 = objc_msgSend(v3, "numberWithBool:", -[HDHRElectrocardiogramDeviceSupportedStateProvider isDeviceSupported:](deviceSupportedProvider, "isDeviceSupported:", v6));

  return v7;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  v4 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = objc_msgSend(v4, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  id v7 = objc_msgSend(v6, "hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:", a3);

  return v7;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  return (id)[(HDPairedFeatureAttributesProviding *)self->_pairedFeatureAttributesProvider currentPairedFeatureAttributes];
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return self->_availabilityRequirementSet;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)[(HDRegionAvailabilityProviding *)self->_regionAvailabilityProvider regionAvailability];
}

- (void)_setOnboardingCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 onboardingVersion:(unint64_t)a5 date:(id)a6 settings:(id)a7 completion:(id)a8
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v58 = a7;
  uint64_t v14 = (void (**)(id, uint64_t, id))a8;
  id v15 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v17 = objc_msgSend(v15, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  uint64_t v18 = *MEMORY[0x1E4F29E80];
  if (*MEMORY[0x1E4F29E80] == a5)
  {
    id v57 = v13;
    v19 = (void *)MEMORY[0x1E4F1CC08];
LABEL_9:
    id v23 = (void *)*MEMORY[0x1E4F29AA8];
    id v62 = 0;
    char v24 = [v17 setPropertyListValue:v19 forKey:v23 error:&v62];
    id v56 = v62;
    if (v24)
    {
      uint64_t v25 = *MEMORY[0x1E4F29AA0];
      v65[0] = v57;
      uint64_t v26 = *MEMORY[0x1E4F29AB0];
      v64[0] = v25;
      v64[1] = v26;
      uint64_t v53 = v26;
      id v27 = [NSNumber numberWithUnsignedInteger:a5];
      v65[1] = v27;
      v64[2] = @"HKElectrocardiogramOnboardingCountryCodeProvenance";
      uint64_t v28 = [NSNumber numberWithInteger:a4];
      v65[2] = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];

      id v61 = 0;
      __int16 v55 = (void *)v29;
      LOBYTE(v28) = [v17 setValuesWithDictionary:v29 error:&v61];
      id v54 = v61;
      if (v28)
      {
        cacheDefaults = self->_cacheDefaults;
        id v31 = (uint64_t *)MEMORY[0x1E4F29AD0];
        if (v18 == a5)
        {
          uint64_t v32 = v53;
          [(NSUserDefaults *)cacheDefaults removeObjectForKey:v53];
          uint64_t v33 = *MEMORY[0x1E4F29AE0];
          uint64_t v34 = *MEMORY[0x1E4F29AD8];
          id v22 = v58;
        }
        else
        {
          uint64_t v32 = v53;
          [(NSUserDefaults *)cacheDefaults setInteger:a5 forKey:v53];
          uint64_t v52 = *MEMORY[0x1E4F29AE0];
          -[NSUserDefaults setBool:forKey:](self->_cacheDefaults, "setBool:forKey:", 1);
          uint64_t v34 = *MEMORY[0x1E4F29AD8];
          id v22 = v58;
          if (v58)
          {
            uint64_t v38 = [v58 numberForKey:*MEMORY[0x1E4F29AD8]];
            v39 = v38;
            if (v38) {
              -[NSUserDefaults setBool:forKey:](self->_cacheDefaults, "setBool:forKey:", [v38 BOOLValue], v34);
            }
            uint64_t v50 = *v31;
            v51 = v39;
            v40 = objc_msgSend(v58, "numberForKey:");
            id v41 = v40;
            if (v40)
            {
              id v42 = self->_cacheDefaults;
              uint64_t v43 = [v40 BOOLValue];
              id v44 = v42;
              id v31 = (uint64_t *)MEMORY[0x1E4F29AD0];
              [(NSUserDefaults *)v44 setBool:v43 forKey:v50];
            }
          }
          uint64_t v33 = v52;
        }
        long long v45 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v32, v33, v34, *v31, 0);
        HKSynchronizeNanoPreferencesUserDefaults();

        observers = self->_observers;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke;
        v60[3] = &unk_1E69B4140;
        v60[4] = self;
        [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v60];
        id v47 = objc_loadWeakRetained((id *)&self->_profile);
        long long v48 = [v47 nanoSyncManager];
        v49 = [NSString stringWithFormat:@"[%@] Onboarding completed", objc_opt_class()];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2;
        v59[3] = &unk_1E69B45A8;
        v59[4] = self;
        [v48 syncHealthDataWithOptions:0 reason:v49 completion:v59];

        uint64_t v36 = v56;
        v14[2](v14, 1, v56);
        id v13 = v57;
      }
      else
      {
        _HKInitializeLogging();
        objc_super v37 = *MEMORY[0x1E4F29F50];
        uint64_t v36 = v56;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v67 = self;
          __int16 v68 = 2048;
          unint64_t v69 = a5;
          __int16 v70 = 2112;
          id v71 = v56;
          _os_log_error_impl(&dword_1D3AC6000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Couldn't set ECG onboarding completion version %ld: %@", buf, 0x20u);
        }
        id v13 = v57;
        id v22 = v58;
        if (v14) {
          v14[2](v14, 0, v56);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      id v35 = *MEMORY[0x1E4F29F50];
      uint64_t v36 = v56;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v67 = self;
        __int16 v68 = 2048;
        unint64_t v69 = a5;
        __int16 v70 = 2112;
        id v71 = v23;
        __int16 v72 = 2112;
        id v73 = v56;
        _os_log_error_impl(&dword_1D3AC6000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Couldn't set ECG onboarding history %ld for key [%@]: %@", buf, 0x2Au);
      }
      id v13 = v57;
      id v22 = v58;
      if (v14) {
        v14[2](v14, 0, v56);
      }
    }

    goto LABEL_31;
  }
  id v63 = 0;
  uint64_t v20 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _makeOnboardingHistoryWithOnboardingVersion:a5 countryCode:v13 error:&v63];
  id v21 = v63;
  v19 = v21;
  if (v20 || !v21)
  {
    id v57 = v13;

    v19 = (void *)v20;
    goto LABEL_9;
  }
  if (v14) {
    v14[2](v14, 0, v21);
  }
  id v22 = v58;
LABEL_31:
}

uint64_t __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

void __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29F50];
  id v7 = *MEMORY[0x1E4F29F50];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after onboarding completed", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2_cold_1(a1, (uint64_t)v5, v6);
  }
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    id v28 = 0;
    uint64_t v16 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:v12 error:&v28];
    id v17 = v28;
    if (v16)
    {
      if ([v16 isEligible])
      {
        objc_initWeak((id *)location, self);
        unint64_t onboardingVersion = self->_onboardingVersion;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __164__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
        v24[3] = &unk_1E69B4BB0;
        objc_copyWeak(&v27, (id *)location);
        id v25 = v13;
        id v26 = v15;
        [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _setOnboardingCompletedForCountryCode:v12 countryCodeProvenance:a4 onboardingVersion:onboardingVersion date:v25 settings:v14 completion:v24];

        objc_destroyWeak(&v27);
        objc_destroyWeak((id *)location);
      }
      else
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        id v21 = [v16 ineligibilityReasonsDescription];
        id v22 = objc_msgSend(v20, "hk_error:format:", 110, @"This feature cannot be enabled for country %@: %@", v12, v21);
        (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v22);
      }
    }
    else
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = self;
        __int16 v30 = 2114;
        id v31 = v12;
        __int16 v32 = 2114;
        id v33 = v17;
        _os_log_error_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking onboarding completion ability in country %{public}@: %{public}@", location, 0x20u);
      }
      (*((void (**)(id, void, id))v15 + 2))(v15, 0, v17);
    }
  }
  else
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"A non-nil country code is required to onboard this feature");
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v18);
  }
}

void __164__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _saveFirstOnboardingCompletionDateIfNeeded:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v6 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:]((uint64_t)self, v7);
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Saving HKOnboardingCompletion is not supported for ECG 1.0");
  v6[2](v6, 0, v8);
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager setFeatureSettingData:forKey:completion:]();
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown data setting for ECG 1.0");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager setFeatureSettingString:forKey:completion:]();
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown string setting for ECG 1.0");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:]();
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown string setting for ECG 1.0");
  v7[2](v7, 0, v8);
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager removeFeatureSettingValueForKey:completion:]();
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Removing settings for ECG 1.0 is not supported");
  v6[2](v6, 0, v7);
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  cacheDefaults = self->_cacheDefaults;
  uint64_t v5 = *MEMORY[0x1E4F29A98];
  id v6 = a3;
  [(NSUserDefaults *)cacheDefaults removeObjectForKey:v5];
  [(NSUserDefaults *)self->_cacheDefaults removeObjectForKey:@"WristConfirmationAlertDate"];
  uint64_t v7 = *MEMORY[0x1E4F29AE0];
  [(NSUserDefaults *)self->_cacheDefaults removeObjectForKey:*MEMORY[0x1E4F29AE0]];
  [(NSUserDefaults *)self->_cacheDefaults removeObjectForKey:@"PromimentUpgradeTileDismissed"];
  uint64_t v8 = *MEMORY[0x1E4F29AD8];
  [(NSUserDefaults *)self->_cacheDefaults removeObjectForKey:*MEMORY[0x1E4F29AD8]];
  uint64_t v9 = *MEMORY[0x1E4F29AD0];
  [(NSUserDefaults *)self->_cacheDefaults removeObjectForKey:*MEMORY[0x1E4F29AD0]];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v5, @"WristConfirmationAlertDate", v7, v8, v9, 0);
  HKSynchronizeNanoPreferencesUserDefaults();

  uint64_t v11 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v13 = objc_msgSend(v11, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  uint64_t v14 = 0;
  objc_msgSend(v13, "hdhr_resetElectrocardiogramRecordingFirstOnboardingCompletedDateWithError:", &v14);
  [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _setOnboardingCompletedForCountryCode:&stru_1F2B36C98 countryCodeProvenance:0 onboardingVersion:*MEMORY[0x1E4F29E80] date:0 settings:0 completion:v6];
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E69B41B8;
  v5[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

void __89__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairedDeviceProvider];
  [v2 registerObserver:*(void *)(a1 + 32) queue:0];
}

- (void)unregisterObserver:(id)a3
{
}

- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v4 = HKLogInfrastructure();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](self->_observers, "count"));
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = self;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers paired device capability changes", buf, 0x16u);
    }
  }
  observers = self->_observers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke;
  v9[3] = &unk_1E69B4140;
  v9[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v9];
}

void __100__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_pairedDeviceCapabilitiesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdatePairedDeviceCapability:*(void *)(a1 + 32)];
  }
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained database];
  [v4 addProtectedDataObserver:self];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    _HKInitializeLogging();
    BOOL v5 = HKLogInfrastructure();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

    if (v6)
    {
      uint64_t v7 = HKLogInfrastructure();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](self->_observers, "count"));
        *(_DWORD *)buf = 138543618;
        __int16 v12 = self;
        __int16 v13 = 2114;
        uint64_t v14 = v8;
        _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for protected database becoming available", buf, 0x16u);
      }
    }
    observers = self->_observers;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __107__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke;
    v10[3] = &unk_1E69B4140;
    v10[4] = self;
    [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v10];
  }
}

void __107__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F2B49A60]) {
    [v3 featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:*(void *)(a1 + 32)];
  }
}

- (void)_saveFirstOnboardingCompletionDateIfNeeded:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F65B28];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v7 = objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

    id v18 = 0;
    uint64_t v8 = objc_msgSend(v7, "hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:", &v18);
    id v9 = v18;
    if (!v8)
    {
      id v17 = 0;
      char v10 = objc_msgSend(v7, "hdhr_setElectrocardiogramRecordingFirstOnboardingCompletedDate:error:", v4, &v17);
      id v11 = v17;
      __int16 v12 = v11;
      if ((v10 & 1) == 0 && v11)
      {
        int v13 = objc_msgSend(v11, "hk_isDatabaseAccessibilityError");
        _HKInitializeLogging();
        uint64_t v14 = *MEMORY[0x1E4F29F50];
        uint64_t v15 = *MEMORY[0x1E4F29F50];
        if (v13)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = self;
            _os_log_impl(&dword_1D3AC6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't save first ECG onboarding completion date",
              buf,
              0xCu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager _saveFirstOnboardingCompletionDateIfNeeded:]();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v16 = *MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = self;
      _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] First ECG onboarding completion date is not provided", buf, 0xCu);
    }
  }
}

- (id)_makeOnboardingHistoryWithOnboardingVersion:(int64_t)a3 countryCode:(id)a4 error:(id *)a5
{
  uint64_t v8 = (__CFString *)a4;
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = &stru_1F2B36C98;
  }
  id v17 = 0;
  char v10 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)self _currentOnboardingHistoryDictionaryWithError:&v17];
  id v11 = v17;
  __int16 v12 = v11;
  if (v10) {
    goto LABEL_5;
  }
  if (!v11)
  {
    char v10 = (void *)MEMORY[0x1E4F1CC08];
LABEL_5:
    int v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%i", a3);
    [v13 setObject:v9 forKey:v14];

    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v13];

    goto LABEL_6;
  }
  if (a5)
  {
    uint64_t v15 = 0;
    *a5 = v11;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v15 = 0;
  }
LABEL_6:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityRequirementSet, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cacheDefaults, 0);
  objc_storeStrong((id *)&self->_deviceSupportedProvider, 0);
  objc_storeStrong((id *)&self->_regionAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_pairedFeatureAttributesProvider, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Can't read ECG feature settings with error: %{public}@");
}

- (void)featureOnboardingRecordWithError:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Can't read ECG onboarding record with error: %{public}@");
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error reading ECG onboarding completion: %{public}@");
}

void __169__HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager__setOnboardingCompletedForCountryCode_countryCodeProvenance_onboardingVersion_date_settings_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, a2, a3, "[%{public}@] NanoSync failed after onboarding completed: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)saveOnboardingCompletion:(uint64_t)a1 settings:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Saving HKOnboardingCompletion is not supported for ECG 1.0", (uint8_t *)&v2, 0xCu);
}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Unknown data setting for ECG 1.0: %{public}@");
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Unknown string setting for ECG 1.0: %{public}@");
}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Unknown number setting for ECG 1.0: %{public}@");
}

- (void)removeFeatureSettingValueForKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Removing settings for ECG 1.0 is not supported: %{public}@");
}

- (void)_saveFirstOnboardingCompletionDateIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error saving first ECG onboarding completion date: %{public}@");
}

@end