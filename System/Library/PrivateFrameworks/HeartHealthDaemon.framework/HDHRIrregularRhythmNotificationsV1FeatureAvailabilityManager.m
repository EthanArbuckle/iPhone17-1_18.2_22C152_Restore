@interface HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager
- (BOOL)_countryCodeIsSupportedForDevicePairing:(id)a3 device:(id)a4;
- (BOOL)_isFeatureSupportedOnDevice:(id)a3;
- (HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager)initWithProfile:(id)a3;
- (HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager)initWithProfile:(id)a3 disableAndExpiryProvider:(id)a4 notificationSettingDefaults:(id)a5;
- (NSString)featureIdentifier;
- (id)_onboardingCompletionWithError:(id *)a3;
- (id)_onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)countryAvailabilityVersion;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3;
- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
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

@implementation HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager

- (id)featureOnboardingRecordWithError:(id *)a3
{
  id v17 = 0;
  v5 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self onboardedCountryCodeSupportedStateWithError:&v17];
  id v6 = v17;
  v7 = v6;
  if (v5)
  {
    id v16 = 0;
    v8 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self _onboardingCompletionWithError:&v16];
    id v9 = v16;
    if (v8)
    {
LABEL_3:
      v10 = objc_msgSend(MEMORY[0x1E4F2B058], "hdhr_irregularRhythmNotificationsV1SettingsFromDefaults:", self->_notificationSettingDefaults);
LABEL_4:
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B050]), "initWithOnboardingState:onboardingCompletion:featureSettings:", objc_msgSend(v5, "integerValue"), v8, v10);

      goto LABEL_13;
    }
    if ([v5 integerValue] == 1)
    {
      if (v9)
      {
        if (!a3) {
          goto LABEL_11;
        }
        goto LABEL_7;
      }
      if ([v5 integerValue] != 1)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 100, @"Unexpectedly in an onboarded state with no onboarding completion");
        goto LABEL_12;
      }
      v8 = 0;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEBUG)) {
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager featureOnboardingRecordWithError:]();
      }
      id v13 = objc_alloc(MEMORY[0x1E4F2B2D8]);
      v14 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self featureIdentifier];
      v15 = [MEMORY[0x1E4F1C9C8] distantPast];
      v8 = (void *)[v13 initWithFeatureIdentifier:v14 version:1 completionDate:v15 countryCode:0 countryCodeProvenance:0];

      if (v8) {
        goto LABEL_3;
      }
    }
    v10 = 0;
    goto LABEL_4;
  }
  id v9 = v6;
  if (v9)
  {
    if (!a3)
    {
LABEL_11:
      _HKLogDroppedError();
      goto LABEL_12;
    }
LABEL_7:
    id v9 = v9;
    v11 = 0;
    *a3 = v9;
    goto LABEL_13;
  }
LABEL_12:
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v35 = 0;
  v5 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self _onboardingCompletionWithError:&v35];
  id v6 = v35;
  v7 = [v5 countryCode];
  if (v5)
  {
LABEL_20:
    id v17 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceProvider activePairedDevice];
    if (!v17)
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v37 = v20;
        id v21 = v20;
        _os_log_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding record present but not supported due to nil paired device", buf, 0xCu);
      }
LABEL_27:
      v22 = &unk_1F2B420A0;
LABEL_28:
      id v23 = v6;
LABEL_54:

      goto LABEL_55;
    }
    if (v7)
    {
      if (!v5
        || [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self _countryCodeIsSupportedForDevicePairing:v7 device:v17])
      {
LABEL_36:
        disableAndExpiryProvider = self->_disableAndExpiryProvider;
        id v34 = v6;
        v27 = [(HDFeatureDisableAndExpiryProviding *)disableAndExpiryProvider rescindedStatusForCountryCode:v7 device:v17 error:&v34];
        id v23 = v34;

        if (v27)
        {
          unint64_t v28 = [v27 integerValue];
          if (v28 > 2) {
            v22 = &unk_1F2B420E8;
          }
          else {
            v22 = (void *)qword_1E69B41D8[v28];
          }
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
            -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:]();
          }
          id v29 = v23;
          if (v29)
          {
            if (a3) {
              *a3 = v29;
            }
            else {
              _HKLogDroppedError();
            }
          }

          v22 = 0;
        }

        goto LABEL_54;
      }
      goto LABEL_27;
    }
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29F50];
    BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR);
    if (!v6)
    {
      if (v25) {
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:](v24);
      }
      v7 = @"OnboardedInHealthDatabaseWithoutACountryCode";
      goto LABEL_36;
    }
    if (v25)
    {
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:]();
      if (a3) {
        goto LABEL_32;
      }
    }
    else if (a3)
    {
LABEL_32:
      id v23 = v6;
      v7 = 0;
      v22 = 0;
      *a3 = v23;
      goto LABEL_54;
    }
    _HKLogDroppedError();
    v7 = 0;
    v22 = 0;
    goto LABEL_28;
  }
  if (v6 && objc_msgSend(v6, "hk_isDatabaseAccessibilityError"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v9 = [WeakRetained database];
    int v10 = [v9 isDataProtectedByFirstUnlockAvailable];
  }
  else
  {
    int v10 = 0;
  }
  v11 = [(NSUserDefaults *)self->_notificationSettingDefaults objectForKey:*MEMORY[0x1E4F2BE60]];

  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x1E4F29F50];
  id v13 = *MEMORY[0x1E4F29F50];
  if (v11) {
    BOOL v14 = v10 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.4(v12);
    }
    id v16 = @"HealthDatabaseIsUnavailableButSettingIsPresent";
LABEL_19:

    v7 = v16;
    goto LABEL_20;
  }
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.6();
    }
    if (a3) {
      *a3 = v6;
    }
    else {
      _HKLogDroppedError();
    }

    v22 = 0;
  }
  else
  {
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:].cold.5(v12);
      }
      id v16 = @"NoOnboardingInHealthDatabaseButSettingIsPresent";
      goto LABEL_19;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v12;
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v37 = v32;
      id v33 = v32;
      _os_log_impl(&dword_1D3AC6000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] No record of onboarding found", buf, 0xCu);
    }
    v22 = &unk_1F2B42088;
  }
LABEL_55:

  return v22;
}

- (id)_onboardingCompletionWithError:(id *)a3
{
  v5 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = objc_msgSend(v5, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  v8 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self featureIdentifier];
  id v9 = objc_msgSend(v7, "hdhr_irregularRhythmNotificationsOnboardingCompletionForFeatureIdentifier:error:", v8, a3);

  return v9;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F29D68];
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  v5 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self _onboardingEligibilityForCountryCode:a3 error:a4];
  id v6 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self featureIdentifier];
  v7 = [v5 eligibilityRespectingOverridesForFeatureIdentifier:v6];

  return v7;
}

- (id)_onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceProvider activePairedDevice];
  v8 = [(HDFeatureDisableAndExpiryProviding *)self->_disableAndExpiryProvider rescindedStatusForCountryCode:v6 device:v7 error:a4];
  id v9 = v8;
  if (v8)
  {
    [v8 integerValue];
    uint64_t v10 = HKFeatureAvailabilityOnboardingIneligibilityReasonsForRescindedStatus() | (2 * (v7 == 0));
    if (v6)
    {
      v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
      int v12 = [v11 isAppleWatch];

      if (v12)
      {
        int v13 = _LocalWatchDeviceSupportsCountryCode(v6);
        uint64_t v14 = v10 | 8;
        BOOL v15 = v13 == 0;
      }
      else
      {
        if (v7 && !_PairedWatchDeviceSupportsCountryCode(v7, v6)) {
          v10 |= 0x20uLL;
        }
        id v18 = v6;
        v19 = HKAtrialFibrillationDetectionSupportedCountries();
        int v20 = [v19 containsObject:v18];

        uint64_t v14 = v10 | 8;
        BOOL v15 = v20 == 0;
      }
      if (v15) {
        uint64_t v17 = v14;
      }
      else {
        uint64_t v17 = v10;
      }
      if (v7
        && ![(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self _isFeatureSupportedOnDevice:v7])
      {
        v17 |= 4uLL;
      }
    }
    else
    {
      uint64_t v17 = v10 | 1;
    }
    id v21 = objc_alloc(MEMORY[0x1E4F2B008]);
    v22 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self countryAvailabilityVersion];
    id v16 = (void *)[v21 initWithIneligibilityReasons:v17 countryAvailabilityVersion:v22];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)countryAvailabilityVersion
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v3 = [v2 currentOSBuild];

  return v3;
}

- (HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager)initWithProfile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F65B80];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 daemon];
  v8 = (void *)[v6 initWithDaemon:v7 remoteDisableCondition:*MEMORY[0x1E4F2A960] seedExpirationCondition:*MEMORY[0x1E4F2A970]];

  id v9 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v10 = (void *)[v9 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  v11 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self initWithProfile:v5 disableAndExpiryProvider:v8 notificationSettingDefaults:v10];

  return v11;
}

- (HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager)initWithProfile:(id)a3 disableAndExpiryProvider:(id)a4 notificationSettingDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
  v11 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)&v24 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    int v13 = [v8 daemon];
    uint64_t v14 = [v13 nanoRegistryDeviceCapabilityProvider];
    pairedDeviceProvider = v12->_pairedDeviceProvider;
    v12->_pairedDeviceProvider = (HDPairedDeviceCapabilityProviding *)v14;

    objc_storeStrong((id *)&v12->_disableAndExpiryProvider, a4);
    objc_storeStrong((id *)&v12->_notificationSettingDefaults, a5);
    id v16 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    uint64_t v19 = [v16 initWithName:v18 loggingCategory:*MEMORY[0x1E4F29F50]];
    observers = v12->_observers;
    v12->_observers = (HKFeatureAvailabilityProvidingObserver *)v19;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    v22 = [WeakRetained daemon];
    [v22 registerDaemonReadyObserver:v12 queue:0];
  }
  return v12;
}

- (void)dealloc
{
  if ([(HKFeatureAvailabilityProvidingObserver *)self->_observers count]) {
    [(NSUserDefaults *)self->_notificationSettingDefaults removeObserver:self forKeyPath:*MEMORY[0x1E4F2BE60] context:HDHRIrregularRhythmNotificationsSettingObservingContext];
  }
  v3.receiver = self;
  v3.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
  [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)&v3 dealloc];
}

- (BOOL)_countryCodeIsSupportedForDevicePairing:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v8 = [v7 isAppleWatch];

  if (v8)
  {
    char v9 = _LocalWatchDeviceSupportsCountryCode(v5);
  }
  else
  {
    char v10 = _PairedWatchDeviceSupportsCountryCode(v6, v5);
    id v11 = v5;
    int v12 = HKAtrialFibrillationDetectionSupportedCountries();
    char v13 = [v12 containsObject:v11];

    char v9 = v10 & v13;
  }

  return v9;
}

- (BOOL)_isFeatureSupportedOnDevice:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
    char v5 = [v4 isAppleWatch];

    if (v5)
    {
      BOOL v6 = 1;
    }
    else
    {
      v7 = [v3 valueForProperty:*MEMORY[0x1E4F79D00]];
      BOOL v6 = v7 != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  v4 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:a3 error:a4];
  char v5 = v4;
  if (v4)
  {
    BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isEligible"));
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  v4 = (void *)MEMORY[0x1E4F65B28];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v6 = objc_msgSend(v4, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  v7 = objc_msgSend(v6, "hdhr_atrialFibrillationOnboardingCompletedDateWithError:", a3);

  return v7;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  char v5 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  char v5 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self isCurrentOnboardingVersionCompletedWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  id v3 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self onboardedCountryCodeSupportedStateWithError:a3];
  v4 = v3;
  if (v3)
  {
    if ([v3 integerValue] == 2) {
      char v5 = (void *)MEMORY[0x1E4F1CC38];
    }
    else {
      char v5 = (void *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  v4 = NSNumber;
  char v5 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceProvider activePairedDevice];
  id v6 = objc_msgSend(v4, "numberWithBool:", -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager _isFeatureSupportedOnDevice:](self, "_isFeatureSupportedOnDevice:", v5));

  return v6;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  v4 = [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:*MEMORY[0x1E4F29E90] watchDeviceIdentifier:*MEMORY[0x1E4F29EA0] phoneDeviceIdentifier:*MEMORY[0x1E4F29E98]];
  char v5 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceProvider activePairedDevice];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 valueForProperty:*MEMORY[0x1E4F79D00]];
    if (v7)
    {
      int v8 = [v6 valueForProperty:*MEMORY[0x1E4F79CF8]];
      char v9 = [v6 valueForProperty:*MEMORY[0x1E4F79CF0]];
      char v10 = (void *)[objc_alloc(MEMORY[0x1E4F2AFE8]) initWithFeatureVersion:@"1" updateVersion:v7 UDIDeviceIdentifier:v8 yearOfRelease:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F2B318]) initWithLocalAttributes:v4 pairedAttributes:v10];

  return v11;
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B028], "noRequirements", a3);
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return 0;
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F29DE0];
  int v8 = (void (**)(id, uint64_t, void))a4;
  if ([v6 isEqual:v7])
  {
    notificationSettingDefaults = self->_notificationSettingDefaults;
    uint64_t v10 = *MEMORY[0x1E4F2BE60];
    [(NSUserDefaults *)notificationSettingDefaults removeObjectForKey:*MEMORY[0x1E4F2BE60]];
    id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    HKSynchronizeNanoPreferencesUserDefaults();

    v8[2](v8, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager removeFeatureSettingValueForKey:completion:]();
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot remove unknown setting for IRN 1.0");
    v8[2](v8, 0, v12);

    int v8 = (void (**)(id, uint64_t, void))v12;
  }
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F65B28];
  p_profile = &self->_profile;
  id v6 = (void (**)(id, uint64_t, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  int v8 = objc_msgSend(v4, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

  id v24 = 0;
  uint64_t v9 = objc_msgSend(v8, "hdhr_resetAtrialFibrillationDetectionOnboardingWithError:", &v24);
  id v10 = v24;
  if (v9)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
    uint64_t v12 = *MEMORY[0x1E4F29700];
    [v11 removeObjectForKey:*MEMORY[0x1E4F29700]];
    char v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    HKSynchronizeNanoPreferencesUserDefaults();

    uint64_t v14 = *MEMORY[0x1E4F2BE60];
    [(NSUserDefaults *)self->_notificationSettingDefaults removeObjectForKey:*MEMORY[0x1E4F2BE60]];
    BOOL v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    HKSynchronizeNanoPreferencesUserDefaults();

    notify_post((const char *)*MEMORY[0x1E4F2A980]);
    id v16 = [HDHRHealthKitSyncManager alloc];
    id v17 = objc_loadWeakRetained((id *)p_profile);
    id v18 = [(HDHRHealthKitSyncManager *)v16 initWithProfile:v17];

    uint64_t v19 = (NSObject **)MEMORY[0x1E4F29F50];
    [(HDHRHealthKitSyncManager *)v18 triggerImmediateSyncWithReason:@"IRN onboarding has been reset" loggingCategory:*MEMORY[0x1E4F29F50]];
    _HKInitializeLogging();
    int v20 = *v19;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      id v23 = v22;
      _os_log_impl(&dword_1D3AC6000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reset onboarding successfully", buf, 0xCu);
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager resetOnboardingWithCompletion:]();
    }
  }
  v6[2](v6, v9, v10);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void, id))a7;
  if (v12)
  {
    _HKInitializeLogging();
    BOOL v15 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      id v17 = objc_opt_class();
      id v18 = v17;
      uint64_t v19 = [v12 debugDescription];
      *(_DWORD *)buf = 138543618;
      v75 = v17;
      __int16 v76 = 2114;
      id v77 = v19;
      _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to set onboarding date to %{public}@, but IRN V1 does not support specifying onboarding date", buf, 0x16u);
    }
  }
  if (v11)
  {
    id v73 = 0;
    int v20 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v73];
    id v21 = v73;
    if (!v20)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:]();
      }
      v14[2](v14, 0, v21);
      goto LABEL_33;
    }
    v22 = [v20 allOnboardedCountryCodesRegardlessOfSupportedState];
    int v23 = [v22 containsObject:v11];

    if (v23)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:]();
      }
      id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"IRN is already onboarded for %@", v11);
      v14[2](v14, 0, v24);

      goto LABEL_33;
    }
    id v72 = v21;
    BOOL v25 = [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:v11 error:&v72];
    id v26 = v72;

    if (!v25)
    {
      _HKInitializeLogging();
      id v34 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
      {
        v49 = v34;
        v50 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v75 = v50;
        __int16 v76 = 2114;
        id v77 = v11;
        __int16 v78 = 2114;
        id v79 = v26;
        id v51 = v50;
        _os_log_error_impl(&dword_1D3AC6000, v49, OS_LOG_TYPE_ERROR, "[%{public}@] Error checking onboarding completion ability in country %{public}@: %{public}@", buf, 0x20u);
      }
      v14[2](v14, 0, v26);
      goto LABEL_32;
    }
    if (([v25 isEligible] & 1) == 0)
    {
      id v35 = (void *)MEMORY[0x1E4F28C58];
      v36 = [v25 ineligibilityReasonsDescription];
      v37 = objc_msgSend(v35, "hk_error:format:", 110, @"This feature cannot be enabled for country %@: %@", v11, v36);
      v14[2](v14, 0, v37);

LABEL_32:
      id v21 = v26;
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v27 = (void *)MEMORY[0x1E4F65B28];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v29 = objc_msgSend(v27, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", WeakRetained);

    id v71 = v26;
    v59 = v29;
    LODWORD(v29) = objc_msgSend(v29, "hdhr_setAtrialFibrillationDetectionCurrentOnboardingVersionCompletedInCountryCode:error:", v11, &v71);
    id v60 = v71;

    char v58 = (char)v29;
    if (v29)
    {
      notify_post((const char *)*MEMORY[0x1E4F2A980]);
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      v31 = v30;
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v75 = v32;
      __int16 v76 = 2114;
      id v77 = v11;
      id v33 = v32;
      _os_log_impl(&dword_1D3AC6000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set onboarding completed in country %{public}@", buf, 0x16u);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v38 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        v57 = v25;
        v39 = (void *)*MEMORY[0x1E4F29DE0];
        uint64_t v70 = 0;
        v61 = v39;
        uint64_t v40 = objc_msgSend(v13, "numberForKey:error:");
        id v41 = 0;
        if (v41)
        {
          _HKInitializeLogging();
          v42 = (void *)*MEMORY[0x1E4F29F50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
          {
            v52 = v42;
            v53 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v75 = v53;
            __int16 v76 = 2114;
            id v77 = v61;
            __int16 v78 = 2114;
            id v79 = v41;
            id v54 = v53;
            _os_log_error_impl(&dword_1D3AC6000, v52, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving setting for key %{public}@: %{public}@", buf, 0x20u);
          }
        }
        v56 = v41;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
        v66[3] = &unk_1E69B4168;
        v66[4] = self;
        v68 = v14;
        char v69 = v58;
        id v26 = v60;
        id v67 = v26;
        v43 = (void *)MEMORY[0x1D943B130](v66);
        v44 = v43;
        v45 = (void *)v40;
        if (v40)
        {
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3;
          v64[3] = &unk_1E69B4190;
          v46 = &v65;
          v64[4] = self;
          v65 = v43;
          id v47 = v43;
          [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self setFeatureSettingNumber:v45 forKey:v61 completion:v64];
        }
        else
        {
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_346;
          v62[3] = &unk_1E69B4190;
          v46 = &v63;
          v62[4] = self;
          v63 = v43;
          id v48 = v43;
          [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)self removeFeatureSettingValueForKey:v61 completion:v62];
        }

        BOOL v25 = v57;
        goto LABEL_32;
      }
      v31 = v38;
      v55 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v75 = v55;
      __int16 v76 = 2114;
      id v77 = v11;
      __int16 v78 = 2114;
      id v79 = v60;
      id v33 = v55;
      _os_log_error_impl(&dword_1D3AC6000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting onboarding completed in country %{public}@: %{public}@", buf, 0x20u);
    }

    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"A non-nil country code is required to onboard this feature");
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  v14[2](v14, 0, v21);
LABEL_34:
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2;
  v7[3] = &unk_1E69B4140;
  v7[4] = v2;
  [v3 notifyObservers:v7];
  v4 = [HDHRHealthKitSyncManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v6 = [(HDHRHealthKitSyncManager *)v4 initWithProfile:WeakRetained];

  [(HDHRHealthKitSyncManager *)v6 triggerImmediateSyncWithReason:@"IRN onboarding has been completed" loggingCategory:*MEMORY[0x1E4F29F50]];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3_cold_1(a1, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_346(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_346_cold_1(a1, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager saveOnboardingCompletion:settings:completion:](v6);
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Saving HKOnboardingCompletion is not supported for IRN 1.0");
  v5[2](v5, 0, v7);
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setFeatureSettingData:forKey:completion:]();
  }
  int v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown data setting for IRN 1.0");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setFeatureSettingString:forKey:completion:]();
  }
  int v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown string setting for IRN 1.0");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x1E4F29DE0];
  id v11 = (void (**)(id, uint64_t, void))a5;
  if ([v9 isEqual:v10])
  {
    notificationSettingDefaults = self->_notificationSettingDefaults;
    uint64_t v13 = [v8 BOOLValue];
    uint64_t v14 = *MEMORY[0x1E4F2BE60];
    [(NSUserDefaults *)notificationSettingDefaults setBool:v13 forKey:*MEMORY[0x1E4F2BE60]];
    BOOL v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    HKSynchronizeNanoPreferencesUserDefaults();

    v11[2](v11, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:]();
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set number string setting for IRN 1.0");
    v11[2](v11, 0, v16);

    id v11 = (void (**)(id, uint64_t, void))v16;
  }
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E69B41B8;
  v5[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

uint64_t __87__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObserver:*(void *)(a1 + 32) forKeyPath:*MEMORY[0x1E4F2BE60] options:1 context:HDHRIrregularRhythmNotificationsSettingObservingContext];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E69B41B8;
  v4[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __83__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObserver:*(void *)(a1 + 32) forKeyPath:*MEMORY[0x1E4F2BE60] context:HDHRIrregularRhythmNotificationsSettingObservingContext];
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained database];
  [v4 addProtectedDataObserver:self];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    _HKInitializeLogging();
    id v5 = HKLogInfrastructure();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

    if (v6)
    {
      uint64_t v7 = HKLogInfrastructure();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = objc_opt_class();
        id v9 = NSNumber;
        observers = self->_observers;
        id v11 = v8;
        id v12 = objc_msgSend(v9, "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](observers, "count"));
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v8;
        __int16 v17 = 2114;
        id v18 = v12;
        _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for protected database becoming available", buf, 0x16u);
      }
    }
    uint64_t v13 = self->_observers;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke;
    v14[3] = &unk_1E69B4140;
    v14[4] = self;
    [(HKFeatureAvailabilityProvidingObserver *)v13 notifyObservers:v14];
  }
}

void __105__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F2B49A60]) {
    [v3 featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:*(void *)(a1 + 32)];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)HDHRIrregularRhythmNotificationsSettingObservingContext == a6)
  {
    if (v10 && ([v10 isEqualToString:*MEMORY[0x1E4F2BE60]] & 1) != 0)
    {
      _HKInitializeLogging();
      uint64_t v13 = HKLogInfrastructure();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

      if (v14)
      {
        BOOL v15 = HKLogInfrastructure();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = objc_opt_class();
          __int16 v17 = NSNumber;
          observers = self->_observers;
          id v19 = v16;
          int v20 = objc_msgSend(v17, "numberWithUnsignedInteger:", -[HKFeatureAvailabilityProvidingObserver count](observers, "count"));
          *(_DWORD *)buf = 138543874;
          id v26 = v16;
          __int16 v27 = 2114;
          unint64_t v28 = v20;
          __int16 v29 = 2114;
          id v30 = v10;
          _os_log_impl(&dword_1D3AC6000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers for change in setting %{public}@", buf, 0x20u);
        }
      }
      id v21 = self->_observers;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __111__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v22[3] = &unk_1E69B4140;
      v22[4] = self;
      [(HKFeatureAvailabilityProvidingObserver *)v21 notifyObservers:v22];
    }
    else
    {
      v23.receiver = self;
      v23.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
      [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)&v23 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager;
    [(HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager *)&v24 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __111__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdateSettings:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationSettingDefaults, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceProvider, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  _os_log_debug_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] No onboarding found in health database (error: %{public}@), but workaround is present", v5, 0x16u);
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Error computing external rescinded status: %{public}@", v7, v8, v9, v10, v11);
}

- (void)onboardedCountryCodeSupportedStateWithError:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_7();
  id v4 = OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, v5, v6, "[%{public}@] Nil country code found with non-nil onboarding. Applying Workaround.", v7, v8, v9, v10, v11);
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.3()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Unable to read country code even though we're onboarded: %{public}@", v7, v8, v9, v10, v11);
}

- (void)onboardedCountryCodeSupportedStateWithError:(void *)a1 .cold.4(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_7();
  id v4 = OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, v5, v6, "[%{public}@] Onboarding is unavailable while the health database is locked, but setting is present. Applying Workaround.", v7, v8, v9, v10, v11);
}

- (void)onboardedCountryCodeSupportedStateWithError:(void *)a1 .cold.5(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_7();
  id v4 = OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, v5, v6, "[%{public}@] No onboarding found in health database, but setting is present. Applying Workaround.", v7, v8, v9, v10, v11);
}

- (void)onboardedCountryCodeSupportedStateWithError:.cold.6()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Cannot read onboarding completion data: %{public}@", v7, v8, v9, v10, v11);
}

- (void)removeFeatureSettingValueForKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@]: Unknown setting for IRN 1.0: %{public}@", v7, v8, v9, v10, v11);
}

- (void)resetOnboardingWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Error resetting onboarding: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Error checking existing onboarding record prior to setting onboarding completed: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Error setting onboarding completed: IRN is already onboarded for %{public}@", v7, v8, v9, v10, v11);
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_2();
  id v5 = OUTLINED_FUNCTION_5(v4);
  OUTLINED_FUNCTION_8(&dword_1D3AC6000, v6, v7, "[%{public}@] Error setting value for key %{public}@: %{public}@", v8, v9, v10, v11, v12);
}

void __162__HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_346_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_2();
  id v5 = OUTLINED_FUNCTION_5(v4);
  OUTLINED_FUNCTION_8(&dword_1D3AC6000, v6, v7, "[%{public}@] Error removing value for key %{public}@: %{public}@", v8, v9, v10, v11, v12);
}

- (void)saveOnboardingCompletion:(void *)a1 settings:completion:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_7();
  id v4 = OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, v5, v6, "[%{public}@] Saving HKOnboardingCompletion is not supported for IRN 1.0", v7, v8, v9, v10, v11);
}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@]: Unknown data setting for IRN 1.0: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@]: Unknown string setting for IRN 1.0: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@]: Unknown number setting for IRN 1.0: %{public}@", v7, v8, v9, v10, v11);
}

@end