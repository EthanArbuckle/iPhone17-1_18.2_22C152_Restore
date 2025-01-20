@interface HDHRHeartRateNotificationsFeatureAvailabilityManager
- (BOOL)_isActiveRemoteDevicePresent;
- (BOOL)_isOnboardingRecordPresent;
- (HDHRHeartRateNotificationsFeatureAvailabilityManager)initWithFeatureIdentifier:(id)a3 notificationSettingsDefaults:(id)a4 pairedDeviceCapabilityProvider:(id)a5;
- (NSString)featureIdentifier;
- (id)_activeRemoteDeviceSupportsHeartRateNotificationsWithError:(id *)a3;
- (id)_featureEnabledDefaultsKey;
- (id)_featureSettings;
- (id)_thresholdDefaultsKey;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)description;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (int64_t)_defaultHeartRateThreshold;
- (void)_setFeatureEnabled:(id)a3 preferredThreshold:(id)a4;
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

@implementation HDHRHeartRateNotificationsFeatureAvailabilityManager

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@:%@", objc_opt_class(), self->_featureIdentifier];
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  if ([(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _isOnboardingRecordPresent])
  {
    v5 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:0 error:a3];
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F2B2D8]);
      featureIdentifier = self->_featureIdentifier;
      v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
      v9 = (void *)[v6 initWithFeatureIdentifier:featureIdentifier version:1 completionDate:v8 countryCode:0 countryCodeProvenance:0];

      id v10 = objc_alloc(MEMORY[0x1E4F2B050]);
      uint64_t v11 = [v5 onboardedCountrySupportedState];
      v12 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _featureSettings];
      v13 = (void *)[v10 initWithOnboardingState:v11 onboardingCompletion:v9 featureSettings:v12];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F2B050]) initWithOnboardingState:1 onboardingCompletion:0 featureSettings:0];
  }

  return v13;
}

- (BOOL)_isOnboardingRecordPresent
{
  notificationSettingsDefaults = self->_notificationSettingsDefaults;
  v3 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _featureEnabledDefaultsKey];
  v4 = [(NSUserDefaults *)notificationSettingsDefaults objectForKey:v3];
  LOBYTE(notificationSettingsDefaults) = v4 != 0;

  return (char)notificationSettingsDefaults;
}

- (id)_featureEnabledDefaultsKey
{
  if ([(NSString *)self->_featureIdentifier isEqualToString:*MEMORY[0x1E4F29D78]])
  {
    v4 = (id *)MEMORY[0x1E4F2BE68];
LABEL_5:
    v5 = (__CFString *)*v4;
    goto LABEL_7;
  }
  if ([(NSString *)self->_featureIdentifier isEqualToString:*MEMORY[0x1E4F29D58]])
  {
    v4 = (id *)MEMORY[0x1E4F2BE78];
    goto LABEL_5;
  }
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2, self, @"HDHRHeartRateNotificationsFeatureAvailabilityManager.m", 110, @"Unsupported feature identifier %@", self->_featureIdentifier object file lineNumber description];

  v5 = &stru_1F2B36C98;
LABEL_7:

  return v5;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F2B860], "sharedBehavior", a3);
  int v7 = [v6 isAppleWatch];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F2B008]) initWithIneligibilityReasons:0 countryAvailabilityVersion:@"unchecked"];
LABEL_10:
    v12 = [v8 eligibilityRespectingOverridesForFeatureIdentifier:self->_featureIdentifier];

    goto LABEL_12;
  }
  uint64_t v9 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _activeRemoteDeviceSupportsHeartRateNotificationsWithError:a4];
  if (v9)
  {
    id v10 = (void *)v9;
    if ([(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _isActiveRemoteDevicePresent])
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = 2;
    }
    if (![v10 BOOLValue]) {
      v11 |= 4uLL;
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F2B008]) initWithIneligibilityReasons:v11 countryAvailabilityVersion:@"unchecked"];

    goto LABEL_10;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)_isActiveRemoteDevicePresent
{
  v2 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceCapabilityProvider activePairedDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_activeRemoteDeviceSupportsHeartRateNotificationsWithError:(id *)a3
{
  pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E17D2903-B868-4E6C-8E76-6D4939BEED44"];
  id v6 = [(HDPairedDeviceCapabilityProviding *)pairedDeviceCapabilityProvider isCapabilitySupportedOnActivePairedDevice:v5 error:a3];

  return v6;
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (objc_class *)MEMORY[0x1E4F2B028];
  v4 = self->_featureIdentifier;
  id v23 = [v3 alloc];
  v35[0] = *MEMORY[0x1E4F29BD8];
  v30 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v4];
  v34[0] = v30;
  v29 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v4 supportedOnLocalDevice:1];
  v34[1] = v29;
  uint64_t v5 = *MEMORY[0x1E4F29EB8];
  v28 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v34[2] = v28;
  v27 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v34[3] = v27;
  v26 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v34[4] = v26;
  uint64_t v6 = *MEMORY[0x1E4F67D78];
  v25 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:*MEMORY[0x1E4F67D78]];
  v34[5] = v25;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6];
  v36[0] = v22;
  v35[1] = *MEMORY[0x1E4F29BF8];
  v21 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:v6];
  v33 = v21;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v36[1] = v20;
  v35[2] = *MEMORY[0x1E4F29C20];
  v19 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v4];
  v32[0] = v19;
  v18 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v4 supportedOnLocalDevice:1];
  v32[1] = v18;
  int v7 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v5];
  v32[2] = v7;
  v8 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v32[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v32[4] = v9;
  id v10 = [MEMORY[0x1E4F2B030] featureIsOnWithIdentifier:v4 isOnIfSettingIsAbsent:0];

  v32[5] = v10;
  uint64_t v11 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:v6];
  v32[6] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:7];
  v36[2] = v12;
  v35[3] = *MEMORY[0x1E4F29BB8];
  v13 = [MEMORY[0x1E4F2B030] isNotInPostPregnancy];
  v31[0] = v13;
  v14 = [MEMORY[0x1E4F2B030] noOngoingPregnancy];
  v31[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v36[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
  id v24 = (id)[v23 initWithRequirementsByContext:v16];

  return v24;
}

- (HDHRHeartRateNotificationsFeatureAvailabilityManager)initWithFeatureIdentifier:(id)a3 notificationSettingsDefaults:(id)a4 pairedDeviceCapabilityProvider:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:*MEMORY[0x1E4F29D78]] & 1) == 0
    && ([v10 isEqualToString:*MEMORY[0x1E4F29D58]] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDHRHeartRateNotificationsFeatureAvailabilityManager.m", 90, @"Unsupported feature identifier %@", v10 object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)HDHRHeartRateNotificationsFeatureAvailabilityManager;
  v13 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_featureIdentifier, a3);
    objc_storeStrong((id *)&v14->_notificationSettingsDefaults, a4);
    objc_storeStrong((id *)&v14->_pairedDeviceCapabilityProvider, a5);
    id v15 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v16 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)v14 description];
    uint64_t v17 = [v15 initWithName:v16 loggingCategory:*MEMORY[0x1E4F29F48]];
    observers = v14->_observers;
    v14->_observers = (HKObserverSet *)v17;
  }
  return v14;
}

- (id)_thresholdDefaultsKey
{
  if ([(NSString *)self->_featureIdentifier isEqualToString:*MEMORY[0x1E4F29D78]])
  {
    v4 = (id *)MEMORY[0x1E4F2BE58];
LABEL_5:
    uint64_t v5 = (__CFString *)*v4;
    goto LABEL_7;
  }
  if ([(NSString *)self->_featureIdentifier isEqualToString:*MEMORY[0x1E4F29D58]])
  {
    v4 = (id *)MEMORY[0x1E4F2BE80];
    goto LABEL_5;
  }
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2, self, @"HDHRHeartRateNotificationsFeatureAvailabilityManager.m", 121, @"Unsupported feature identifier %@", self->_featureIdentifier object file lineNumber description];

  uint64_t v5 = &stru_1F2B36C98;
LABEL_7:

  return v5;
}

- (int64_t)_defaultHeartRateThreshold
{
  if ([(NSString *)self->_featureIdentifier isEqualToString:*MEMORY[0x1E4F29D78]])
  {
    v4 = (int64_t *)MEMORY[0x1E4F67E38];
    return *v4;
  }
  if ([(NSString *)self->_featureIdentifier isEqualToString:*MEMORY[0x1E4F29D58]])
  {
    v4 = (int64_t *)MEMORY[0x1E4F67E40];
    return *v4;
  }
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2, self, @"HDHRHeartRateNotificationsFeatureAvailabilityManager.m", 132, @"Unsupported feature identifier %@", self->_featureIdentifier object file lineNumber description];

  return -1;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  if ([(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _isOnboardingRecordPresent])
  {
    BOOL v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  uint64_t v5 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)_featureSettings
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if ([(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _isOnboardingRecordPresent])
  {
    notificationSettingsDefaults = self->_notificationSettingsDefaults;
    v4 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _featureEnabledDefaultsKey];
    uint64_t v5 = [(NSUserDefaults *)notificationSettingsDefaults objectForKey:v4];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v6 = [v5 BOOLValue];
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v9 = self->_notificationSettingsDefaults;
    id v10 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _thresholdDefaultsKey];
    id v11 = [(NSUserDefaults *)v9 objectForKey:v10];

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = v11;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithInteger:", -[HDHRHeartRateNotificationsFeatureAvailabilityManager _defaultHeartRateThreshold](self, "_defaultHeartRateThreshold"));
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    v14 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v19 = *MEMORY[0x1E4F29DE0];
    id v15 = [NSNumber numberWithBool:v6];
    v20[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v17 = [v14 dictionaryWithDictionary:v16];

    if (v6) {
      [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F29DE8]];
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F2B058]) initWithDictionary:v17];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F2B058]);
    v8 = (void *)[v7 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }

  return v8;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B410], "uncheckedAvailability", a3);
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  BOOL v3 = [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"1"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F2B318]) initWithLocalAttributes:v3 pairedAttributes:0];

  return v4;
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = [a3 countryCode];
  id v23 = 0;
  id v12 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:v11 error:&v23];
  id v13 = v23;

  if (v12)
  {
    char v14 = [v12 isEligible];
    _HKInitializeLogging();
    id v15 = *MEMORY[0x1E4F29F48];
    v16 = *MEMORY[0x1E4F29F48];
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = self;
        _os_log_impl(&dword_1D3AC6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving onboarding record", buf, 0xCu);
      }
      uint64_t v17 = [v9 numberForKey:*MEMORY[0x1E4F29DE8]];
      [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _setFeatureEnabled:MEMORY[0x1E4F1CC38] preferredThreshold:v17];
      v10[2](v10, 1, 0);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[HDHRHeartRateNotificationsFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:]((uint64_t)self, v15, v12);
      }
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = objc_opt_class();
      v20 = [v12 ineligibilityReasonsDescription];
      objc_super v21 = objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v19, a2, @"Cannot complete onboarding: %@"", v20);
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v21);
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:]();
    }
    if (v13)
    {
      ((void (**)(id, uint64_t, id))v10)[2](v10, 0, v13);
    }
    else
    {
      v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Unexpected failure when evaluating eligibility");
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v22);
    }
  }
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v21 = a3;
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x1E4F2B2D8];
  id v14 = a7;
  id v15 = a6;
  id v16 = [v13 alloc];
  uint64_t v17 = v16;
  featureIdentifier = self->_featureIdentifier;
  if (v12)
  {
    uint64_t v19 = (void *)[v16 initWithFeatureIdentifier:self->_featureIdentifier version:1 completionDate:v12 countryCode:v21 countryCodeProvenance:a4];
  }
  else
  {
    v20 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v19 = (void *)[v17 initWithFeatureIdentifier:featureIdentifier version:1 completionDate:v20 countryCode:v21 countryCodeProvenance:a4];
  }
  [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self saveOnboardingCompletion:v19 settings:v15 completion:v14];
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", (uint8_t *)&v6, 0xCu);
  }
  [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _setFeatureEnabled:0 preferredThreshold:0];
  v4[2](v4, 1, 0);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if ([v9 isEqualToString:*MEMORY[0x1E4F29DE0]])
  {
    notificationSettingsDefaults = self->_notificationSettingsDefaults;
    id v12 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _thresholdDefaultsKey];
    id v13 = [(NSUserDefaults *)notificationSettingsDefaults objectForKey:v12];
    [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _setFeatureEnabled:v8 preferredThreshold:v13];

LABEL_5:
    v10[2](v10, 1, 0);
    goto LABEL_9;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F29DE8]])
  {
    [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _setFeatureEnabled:MEMORY[0x1E4F1CC38] preferredThreshold:v8];
    goto LABEL_5;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:]();
  }
  id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Unsupported feature setting %@", v9);
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v14);

LABEL_9:
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  int v6 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingData:forKey:completion:]((uint64_t)self, v7);
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"setFeatureSettingData: is not supported");
  v6[2](v6, 0, v8);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  int v6 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingString:forKey:completion:]((uint64_t)self, v7);
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"setFeatureSettingString: is not supported");
  v6[2](v6, 0, v8);
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4F29DE0]])
  {
    [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self resetOnboardingWithCompletion:v7];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F29DE8]])
  {
    notificationSettingsDefaults = self->_notificationSettingsDefaults;
    id v9 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _thresholdDefaultsKey];
    [(NSUserDefaults *)notificationSettingsDefaults removeObjectForKey:v9];

    v7[2](v7, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:]();
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Unsupported feature setting %@", v6);
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);
  }
}

- (void)_setFeatureEnabled:(id)a3 preferredThreshold:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  notificationSettingsDefaults = self->_notificationSettingsDefaults;
  id v8 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _featureEnabledDefaultsKey];
  id v9 = [(NSUserDefaults *)notificationSettingsDefaults objectForKey:v8];

  id v10 = v21;
  if (v9 != v21)
  {
    if (!v9 || (v11 = [v21 isEqual:v9], id v10 = v21, (v11 & 1) == 0))
    {
      id v12 = self->_notificationSettingsDefaults;
      id v13 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _featureEnabledDefaultsKey];
      [(NSUserDefaults *)v12 setObject:v21 forKey:v13];

      id v10 = v21;
    }
  }
  int v14 = [v10 BOOLValue];
  if (!v6 && v14)
  {
    objc_msgSend(NSNumber, "numberWithInteger:", -[HDHRHeartRateNotificationsFeatureAvailabilityManager _defaultHeartRateThreshold](self, "_defaultHeartRateThreshold"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = self->_notificationSettingsDefaults;
  id v16 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _thresholdDefaultsKey];
  [(NSUserDefaults *)v15 setObject:v6 forKey:v16];

  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _featureEnabledDefaultsKey];
  uint64_t v19 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _thresholdDefaultsKey];
  v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, 0);
  HKSynchronizeNanoPreferencesUserDefaults();

  if ([v21 BOOLValue]) {
    HKHRSubmitNotificationsEnabledSignal();
  }
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__HDHRHeartRateNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E69B41B8;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

void __79__HDHRHeartRateNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[1];
  v4 = [v2 _featureEnabledDefaultsKey];
  [v3 addObserver:v2 forKeyPath:v4 options:1 context:_HDHRHeartRateNotificationsSettingObservingContext];

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[1];
  id v7 = [v5 _thresholdDefaultsKey];
  [v6 addObserver:v5 forKeyPath:v7 options:1 context:_HDHRHeartRateNotificationsSettingObservingContext];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__HDHRHeartRateNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E69B41B8;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

void __75__HDHRHeartRateNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[1];
  v4 = [v2 _featureEnabledDefaultsKey];
  [v3 removeObserver:v2 forKeyPath:v4 context:_HDHRHeartRateNotificationsSettingObservingContext];

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[1];
  id v7 = [v5 _thresholdDefaultsKey];
  [v6 removeObserver:v5 forKeyPath:v7 context:_HDHRHeartRateNotificationsSettingObservingContext];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)_HDHRHeartRateNotificationsSettingObservingContext != a6)
  {
    v36.receiver = self;
    v36.super_class = (Class)HDHRHeartRateNotificationsFeatureAvailabilityManager;
    -[HDHRHeartRateNotificationsFeatureAvailabilityManager observeValueForKeyPath:ofObject:change:context:](&v36, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6, v33.receiver, v33.super_class);
    goto LABEL_13;
  }
  id v13 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _featureEnabledDefaultsKey];
  int v14 = [v10 isEqualToString:v13];

  if (v14)
  {
    _HKInitializeLogging();
    id v15 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      uint64_t v17 = objc_opt_class();
      v18 = NSNumber;
      observers = self->_observers;
      id v20 = v17;
      id v21 = objc_msgSend(v18, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
      *(_DWORD *)buf = 138543874;
      v38 = v17;
      __int16 v39 = 2114;
      v40 = v21;
      __int16 v41 = 2114;
      id v42 = v10;
      _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %{public}@ observers for change in setting %{public}@", buf, 0x20u);
    }
    v22 = self->_observers;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v35[3] = &unk_1E69B4140;
    void v35[4] = self;
    id v23 = v35;
  }
  else
  {
    id v24 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _thresholdDefaultsKey];
    int v25 = [v10 isEqualToString:v24];

    if (!v25)
    {
      -[HDHRHeartRateNotificationsFeatureAvailabilityManager observeValueForKeyPath:ofObject:change:context:](&v33, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6, self, HDHRHeartRateNotificationsFeatureAvailabilityManager);
      goto LABEL_13;
    }
    _HKInitializeLogging();
    uint64_t v26 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = objc_opt_class();
      v29 = NSNumber;
      v30 = self->_observers;
      id v31 = v28;
      v32 = objc_msgSend(v29, "numberWithUnsignedInteger:", -[HKObserverSet count](v30, "count"));
      *(_DWORD *)buf = 138543874;
      v38 = v28;
      __int16 v39 = 2114;
      v40 = v32;
      __int16 v41 = 2114;
      id v42 = v10;
      _os_log_impl(&dword_1D3AC6000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %{public}@ observers for change in setting %{public}@", buf, 0x20u);
    }
    v22 = self->_observers;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke_340;
    v34[3] = &unk_1E69B4140;
    v34[4] = self;
    id v23 = v34;
  }
  [(HKObserverSet *)v22 notifyObservers:v23];
LABEL_13:
}

uint64_t __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

void __103__HDHRHeartRateNotificationsFeatureAvailabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke_340(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdateSettings:*(void *)(a1 + 32)];
  }
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  v4 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:a3 error:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "ineligibilityReasons") == 0);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  id v3 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self onboardingEligibilityForCountryCode:0 error:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "onboardedCountrySupportedState"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  BOOL v5 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _isOnboardingRecordPresent];
  id v6 = [NSNumber numberWithBool:v5];
  v4[2](v4, v6, 0);
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  id v3 = NSNumber;
  BOOL v4 = [(HDHRHeartRateNotificationsFeatureAvailabilityManager *)self _isOnboardingRecordPresent];

  return (id)[v3 numberWithBool:v4];
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);

  objc_storeStrong((id *)&self->_notificationSettingsDefaults, 0);
}

- (void)saveOnboardingCompletion:settings:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Failed to determine onboarding eligibility: %{public}@");
}

- (void)saveOnboardingCompletion:(uint64_t)a1 settings:(void *)a2 completion:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a2;
  id v6 = [a3 ineligibilityReasonsDescription];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Ineligible for onboarding: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Unsupported feature setting %{public}@");
}

- (void)setFeatureSettingData:(uint64_t)a1 forKey:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] setFeatureSettingData: is not supported", (uint8_t *)&v2, 0xCu);
}

- (void)setFeatureSettingString:(uint64_t)a1 forKey:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] setFeatureSettingString: is not supported", (uint8_t *)&v2, 0xCu);
}

@end