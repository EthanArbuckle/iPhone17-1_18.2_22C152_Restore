@interface HKFeatureAvailabilityRequirementEvaluationDataSource
+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3;
+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4;
+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4 onboardingRecordFallbackProvider:(id)a5;
+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4 wristDetectionSettingManager:(id)a5 requirementSatisfactionOverridesDataSource:(id)a6 onboardingRecordFallbackProvider:(id)a7;
- (HKBluetoothDeviceDataSource)bluetoothDeviceDataSource;
- (HKCurrentCountryCodeProvider)currentCountryCodeProvider;
- (HKDarwinNotificationDataSource)darwinNotificationDataSource;
- (HKFeatureAvailabilityHealthDataRequirementDataSource)healthDataRequirementDataSource;
- (HKFeatureAvailabilityHealthDataSource)strongHealthDataSource;
- (HKFeatureAvailabilityHealthDataSource)weakHealthDataSource;
- (HKFeatureAvailabilityProvidingDataSource)featureAvailabilityProvidingDataSource;
- (HKFeatureAvailabilityRequirementEvaluationDataSource)initWithHealthDataSource:(id)a3 bluetoothDeviceDataSource:(id)a4 privacyPreferencesDataSource:(id)a5 respiratoryPreferencesDataSource:(id)a6 ageGatingDataSource:(id)a7 userNotificationSettingsDataSource:(id)a8 wristDetectionSettingDataSource:(id)a9 devicePairingAndSwitchingNotificationDataSource:(id)a10 darwinNotificationDataSource:(id)a11 watchLowPowerModeDataSource:(id)a12 currentCountryCodeProvider:(id)a13 requirementSatisfactionOverridesDataSource:(id)a14 currentDateDataSource:(id)a15 watchAppInstallationDataSource:(id)a16 onboardingRecordFallbackProvider:(id)a17 userNotificationsDataSource:(id)a18;
- (HKFeatureAvailabilityRequirementEvaluationDataSource)initWithHealthDataSource:(id)a3 featureAvailabilityProvidingDataSource:(id)a4 featureStatusProvidingDataSource:(id)a5 bluetoothDeviceDataSource:(id)a6 privacyPreferencesDataSource:(id)a7 respiratoryPreferencesDataSource:(id)a8 ageGatingDataSource:(id)a9 userNotificationSettingsDataSource:(id)a10 wristDetectionSettingDataSource:(id)a11 devicePairingAndSwitchingNotificationDataSource:(id)a12 darwinNotificationDataSource:(id)a13 watchLowPowerModeDataSource:(id)a14 currentCountryCodeProvider:(id)a15 requirementSatisfactionOverridesDataSource:(id)a16 currentDateDataSource:(id)a17 watchAppInstallationDataSource:(id)a18 onboardingRecordFallbackProvider:(id)a19 userNotificationsDataSource:(id)a20 healthDataRequirementDataSource:(id)a21 importExclusionDeviceDataSource:(id)a22;
- (HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource)requirementSatisfactionOverridesDataSource;
- (HKFeatureOnboardingRecordFallbackProviding)onboardingRecordFallbackProvider;
- (HKFeatureStatusProvidingDataSource)featureStatusProvidingDataSource;
- (HKImportExclusionDeviceDataSource)importExclusionDeviceDataSource;
- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingNotificationDataSource;
- (HKUserDefaultsDataSource)ageGatingDataSource;
- (HKUserDefaultsDataSource)privacyPreferencesDataSource;
- (HKUserDefaultsDataSource)respiratoryPreferencesDataSource;
- (HKUserDefaultsDataSource)userNotificationSettingsDataSource;
- (HKUserNotificationsDataSource)userNotificationsDataSource;
- (HKWatchAppInstallationDataSource)watchAppInstallationDataSource;
- (HKWatchLowPowerModeDataSource)watchLowPowerModeDataSource;
- (HKWristDetectionSettingDataSource)wristDetectionSettingDataSource;
- (NSDate)currentDate;
- (_HKBehavior)behavior;
- (id)currentCountryCode;
- (id)currentDateDataSource;
- (id)featureStatusForFeatureWithIdentifier:(id)a3 context:(id)a4 error:(id *)a5;
- (id)healthDataSource;
- (id)isWatchAppInstalledWithBundleIdentifier:(id)a3 error:(id *)a4;
- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 countryCode:(id)a4 error:(id *)a5;
- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 error:(id *)a4;
- (id)onboardingRecordForFeatureWithIdentifier:(id)a3 error:(id *)a4;
- (id)performLocalEvaluation:(id)a3;
- (id)regionAvailabilityForFeatureWithIdentifier:(id)a3 error:(id *)a4;
- (id)requirementSatisfactionOverridesForFeatureWithIdentifier:(id)a3;
- (void)registerObserverForDeviceCharacteristicAndPairingChanges:(id)a3 block:(id)a4;
- (void)setCurrentDateDataSource:(id)a3;
- (void)setOnboardingRecordFallbackProvider:(id)a3;
- (void)unregisterObserverForDeviceCharacteristicAndPairingChanges:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementEvaluationDataSource

- (void)registerObserverForDeviceCharacteristicAndPairingChanges:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke;
  aBlock[3] = &unk_1E58C1150;
  objc_copyWeak(&v18, &location);
  id v8 = v7;
  id v17 = v8;
  v9 = _Block_copy(aBlock);
  v10 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self devicePairingAndSwitchingNotificationDataSource];
  [v10 registerObserverForDevicePairingChanges:v6 block:v9];

  v11 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self darwinNotificationDataSource];
  v12 = getNRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke_2;
  v14[3] = &unk_1E58C1178;
  id v13 = v9;
  id v15 = v13;
  [v11 registerObserver:v6 forKey:v12 newValueHandler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __133__HKFeatureAvailabilityRequirementEvaluationDataSource_NanoRegistry__registerObserverForDeviceCharacteristicAndPairingChanges_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterObserverForDeviceCharacteristicAndPairingChanges:(id)a3
{
  id v4 = a3;
  v5 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self devicePairingAndSwitchingNotificationDataSource];
  [v5 unregisterObserverForDevicePairingChanges:v4];

  id v7 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self darwinNotificationDataSource];
  id v6 = getNRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification();
  [v7 unregisterObserver:v4 forKey:v6];
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)initWithHealthDataSource:(id)a3 bluetoothDeviceDataSource:(id)a4 privacyPreferencesDataSource:(id)a5 respiratoryPreferencesDataSource:(id)a6 ageGatingDataSource:(id)a7 userNotificationSettingsDataSource:(id)a8 wristDetectionSettingDataSource:(id)a9 devicePairingAndSwitchingNotificationDataSource:(id)a10 darwinNotificationDataSource:(id)a11 watchLowPowerModeDataSource:(id)a12 currentCountryCodeProvider:(id)a13 requirementSatisfactionOverridesDataSource:(id)a14 currentDateDataSource:(id)a15 watchAppInstallationDataSource:(id)a16 onboardingRecordFallbackProvider:(id)a17 userNotificationsDataSource:(id)a18
{
  id v34 = a18;
  id v33 = a17;
  id v32 = a16;
  id v19 = a15;
  id v31 = a14;
  id v30 = a13;
  id v29 = a12;
  id v37 = a11;
  id v38 = a10;
  id v39 = a9;
  id v48 = a8;
  id v47 = a7;
  id v45 = a6;
  id v43 = a5;
  id v41 = a4;
  id v20 = a3;
  v21 = [HKFeatureAvailabilityHealthDataRequirementDataSource alloc];
  v22 = [v20 healthDataRequirementEvaluationProvider];
  v28 = [(HKFeatureAvailabilityHealthDataRequirementDataSource *)v21 initWithEvaluationProvider:v22];

  v23 = [[HKFeatureAvailabilityProvidingDataSource alloc] initWithHealthDataSource:v20];
  v24 = objc_alloc_init(HKFeatureStatusProvidingDataSource);
  v26 = objc_alloc_init(HKImportExclusionDeviceDataSource);
  v36 = -[HKFeatureAvailabilityRequirementEvaluationDataSource initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:](self, "initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:", v20, v23, v24, v41, v43, v45, v47, v48, v39, v38, v37, v29,
          v30,
          v31,
          v19,
          v32,
          v33,
          v34,
          v28,
          v26);

  return v36;
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)initWithHealthDataSource:(id)a3 featureAvailabilityProvidingDataSource:(id)a4 featureStatusProvidingDataSource:(id)a5 bluetoothDeviceDataSource:(id)a6 privacyPreferencesDataSource:(id)a7 respiratoryPreferencesDataSource:(id)a8 ageGatingDataSource:(id)a9 userNotificationSettingsDataSource:(id)a10 wristDetectionSettingDataSource:(id)a11 devicePairingAndSwitchingNotificationDataSource:(id)a12 darwinNotificationDataSource:(id)a13 watchLowPowerModeDataSource:(id)a14 currentCountryCodeProvider:(id)a15 requirementSatisfactionOverridesDataSource:(id)a16 currentDateDataSource:(id)a17 watchAppInstallationDataSource:(id)a18 onboardingRecordFallbackProvider:(id)a19 userNotificationsDataSource:(id)a20 healthDataRequirementDataSource:(id)a21 importExclusionDeviceDataSource:(id)a22
{
  id v38 = a3;
  id obj = a4;
  id v57 = a4;
  id v56 = a5;
  id v55 = a6;
  id v54 = a7;
  id v53 = a8;
  id v52 = a9;
  id v51 = a10;
  id v50 = a11;
  id v49 = a12;
  id v48 = a13;
  id v47 = a14;
  id v46 = a15;
  id v45 = a16;
  id v27 = a17;
  id v44 = a18;
  id v43 = a19;
  id v42 = a20;
  id v41 = a21;
  id v40 = a22;
  v58.receiver = self;
  v58.super_class = (Class)HKFeatureAvailabilityRequirementEvaluationDataSource;
  v28 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)&v58 init];
  if (v28)
  {
    int v29 = [v38 requiresWeakRetention];
    p_weakHealthDataSource = (id *)&v28->_weakHealthDataSource;
    if (v29)
    {
      objc_storeWeak(p_weakHealthDataSource, v38);
      id v31 = 0;
    }
    else
    {
      objc_storeWeak(p_weakHealthDataSource, 0);
      id v31 = (HKFeatureAvailabilityHealthDataSource *)v38;
    }
    strongHealthDataSource = v28->_strongHealthDataSource;
    v28->_strongHealthDataSource = v31;

    objc_storeStrong((id *)&v28->_featureAvailabilityProvidingDataSource, obj);
    objc_storeStrong((id *)&v28->_featureStatusProvidingDataSource, a5);
    objc_storeStrong((id *)&v28->_bluetoothDeviceDataSource, a6);
    objc_storeStrong((id *)&v28->_privacyPreferencesDataSource, a7);
    objc_storeStrong((id *)&v28->_respiratoryPreferencesDataSource, a8);
    objc_storeStrong((id *)&v28->_ageGatingDataSource, a9);
    objc_storeStrong((id *)&v28->_userNotificationSettingsDataSource, a10);
    objc_storeStrong((id *)&v28->_wristDetectionSettingDataSource, a11);
    objc_storeStrong((id *)&v28->_devicePairingAndSwitchingNotificationDataSource, a12);
    objc_storeStrong((id *)&v28->_darwinNotificationDataSource, a13);
    objc_storeStrong((id *)&v28->_watchLowPowerModeDataSource, a14);
    objc_storeStrong((id *)&v28->_currentCountryCodeProvider, a15);
    objc_storeStrong((id *)&v28->_requirementSatisfactionOverridesDataSource, a16);
    id v33 = _Block_copy(v27);
    id currentDateDataSource = v28->_currentDateDataSource;
    v28->_id currentDateDataSource = v33;

    objc_storeStrong((id *)&v28->_watchAppInstallationDataSource, a18);
    objc_storeStrong((id *)&v28->_onboardingRecordFallbackProvider, a19);
    objc_storeStrong((id *)&v28->_userNotificationsDataSource, a20);
    objc_storeStrong((id *)&v28->_healthDataRequirementDataSource, a21);
    objc_storeStrong((id *)&v28->_importExclusionDeviceDataSource, a22);
    v35 = [(HKFeatureStatusProvidingDataSource *)v28->_featureStatusProvidingDataSource dataSource];

    if (!v35) {
      [(HKFeatureStatusProvidingDataSource *)v28->_featureStatusProvidingDataSource setDataSource:v28];
    }
  }

  return v28;
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3
{
  id v4 = a3;
  v5 = [[HKFixedCurrentCountryCodeProvider alloc] initWithCountryCode:0];
  id v6 = [a1 dataSourceWithHealthDataSource:v4 currentCountryCodeProvider:v5];

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)v6;
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4
{
  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)[a1 dataSourceWithHealthDataSource:a3 currentCountryCodeProvider:a4 onboardingRecordFallbackProvider:0];
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4 onboardingRecordFallbackProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 wristDetectionSettingManager];
  v12 = [v10 requirementSatisfactionOverridesDataSource];
  id v13 = [a1 dataSourceWithHealthDataSource:v10 currentCountryCodeProvider:v9 wristDetectionSettingManager:v11 requirementSatisfactionOverridesDataSource:v12 onboardingRecordFallbackProvider:v8];

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)v13;
}

+ (HKFeatureAvailabilityRequirementEvaluationDataSource)dataSourceWithHealthDataSource:(id)a3 currentCountryCodeProvider:(id)a4 wristDetectionSettingManager:(id)a5 requirementSatisfactionOverridesDataSource:(id)a6 onboardingRecordFallbackProvider:(id)a7
{
  id v12 = a3;
  id v28 = a7;
  id v27 = a6;
  id v13 = a5;
  id v26 = a4;
  int v29 = objc_alloc_init(HKBluetoothDeviceDataSource);
  v14 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  id v30 = v12;
  id v31 = objc_alloc_init(HKDarwinNotificationDataSource);
  id v15 = [v12 watchLowPowerModeDataSource];
  v16 = [[HKWatchAppInstallationDataSource alloc] initWithDevicePairingAndSwitchingNotificationDataSource:v14];
  if (!v15) {
    id v15 = [[HKWatchLowPowerModeDataSource alloc] initWithDarwinNotificationDataSource:v31 devicePairingAndSwitchingNotificationDataSource:v14];
  }
  v23 = objc_alloc_init(HKUserNotificationsDataSource);
  id v24 = objc_alloc((Class)a1);
  id v17 = +[HKUserDefaultsDataSource privacyPreferencesDataSource];
  id v18 = +[HKUserDefaultsDataSource respiratoryPreferencesDataSource];
  id v19 = +[HKUserDefaultsDataSource ageGatingDataSource];
  id v20 = +[HKUserDefaultsDataSource sharedHealthPreferencesDataSource];
  v21 = [[HKWristDetectionSettingDataSource alloc] initWithWristDetectionSettingManager:v13];

  id v25 = (id)objc_msgSend(v24, "initWithHealthDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:", v30, v29, v17, v18, v19, v20, v21, v14, v31, v15, v26, v27, &__block_literal_global_120,
              v16,
              v28,
              v23);

  return (HKFeatureAvailabilityRequirementEvaluationDataSource *)v25;
}

uint64_t __219__HKFeatureAvailabilityRequirementEvaluationDataSource_dataSourceWithHealthDataSource_currentCountryCodeProvider_wristDetectionSettingManager_requirementSatisfactionOverridesDataSource_onboardingRecordFallbackProvider___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (id)healthDataSource
{
  id WeakRetained = (HKFeatureAvailabilityHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
  strongHealthDataSource = WeakRetained;
  if (WeakRetained || (strongHealthDataSource = self->_strongHealthDataSource) != 0)
  {
    v5 = strongHealthDataSource;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(HKAnalyticsDataSource *)(uint64_t)self healthDataSource];
    }

    v5 = 0;
  }

  return v5;
}

- (_HKBehavior)behavior
{
  return (_HKBehavior *)+[_HKBehavior sharedBehavior];
}

- (id)currentCountryCode
{
  return (id)[(HKCurrentCountryCodeProvider *)self->_currentCountryCodeProvider currentCountryCode];
}

- (NSDate)currentDate
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateDataSource + 2))();
}

- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self onboardingRecordForFeatureWithIdentifier:v7 error:a4];
  id v9 = v8;
  if (!v8)
  {
    id v4 = 0;
    goto LABEL_28;
  }
  uint64_t v10 = [v8 onboardingState];
  if ((unint64_t)(v10 - 2) >= 4)
  {
    if (v10 != 1) {
      goto LABEL_28;
    }
    v11 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self currentCountryCode];
    v21 = self;
    id v22 = v7;
    v23 = v11;
  }
  else
  {
    v11 = [v9 onboardedCountryCodesForOnboardingState];
    if ([v11 count])
    {
      id v27 = v11;
      id v28 = v9;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = v11;
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        v14 = 0;
        uint64_t v15 = *(void *)v31;
        uint64_t v16 = -1;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(obj);
            }
            id v18 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self onboardingEligibilityForFeatureWithIdentifier:v7 countryCode:*(void *)(*((void *)&v30 + 1) + 8 * i) error:a4];
            if (!v18)
            {

              id v4 = 0;
              goto LABEL_26;
            }
            id v19 = v18;
            uint64_t v20 = [v18 ineligibilityReasons];
            if (!v14)
            {
              v14 = [v19 countryAvailabilityVersion];
            }
            v16 &= v20;
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      else
      {
        v14 = 0;
        uint64_t v16 = -1;
      }

      id v24 = [HKFeatureAvailabilityOnboardingEligibility alloc];
      if (v14) {
        id v25 = v14;
      }
      else {
        id v25 = @"Unknown";
      }
      id v4 = [(HKFeatureAvailabilityOnboardingEligibility *)v24 initWithIneligibilityReasons:v16 countryAvailabilityVersion:v25];
LABEL_26:

      v11 = v27;
      id v9 = v28;
      goto LABEL_27;
    }
    v21 = self;
    id v22 = v7;
    v23 = 0;
  }
  id v4 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)v21 onboardingEligibilityForFeatureWithIdentifier:v22 countryCode:v23 error:a4];
LABEL_27:

LABEL_28:

  return v4;
}

- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 countryCode:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HKFeatureAvailabilityProvidingDataSource *)self->_featureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:v8];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 onboardingEligibilityForCountryCode:v9 error:a5];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    v14 = [NSString stringWithFormat:@"No extension found for feature with identifier %@", v8];
    objc_msgSend(v13, "hk_error:description:", 110, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v15;
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError(v15);
      }
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (id)onboardingRecordForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HKFeatureAvailabilityProvidingDataSource *)self->_featureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:v6];
  id v8 = v7;
  if (v7)
  {
    id v20 = 0;
    id v9 = [v7 featureOnboardingRecordWithError:&v20];
    id v10 = v20;
    onboardingRecordFallbackProvider = self->_onboardingRecordFallbackProvider;
    if (v9)
    {
      [(HKFeatureOnboardingRecordFallbackProviding *)onboardingRecordFallbackProvider updateForRetrievedOnboardingRecord:v9 featureIdentifier:v6];
    }
    else
    {
      id v9 = [(HKFeatureOnboardingRecordFallbackProviding *)onboardingRecordFallbackProvider fallbackOnboardingRecordForError:v10 featureIdentifier:v6];
      if (!v9)
      {
        id v16 = v10;
        id v17 = v16;
        if (v16)
        {
          if (a4) {
            *a4 = v16;
          }
          else {
            _HKLogDroppedError(v16);
          }
        }
      }
    }
    id v18 = v9;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = [NSString stringWithFormat:@"No extension found for feature with identifier %@", v6];
    objc_msgSend(v12, "hk_error:description:", 110, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v14;
    if (v14)
    {
      if (a4) {
        *a4 = v14;
      }
      else {
        _HKLogDroppedError(v14);
      }
    }

    id v18 = 0;
  }

  return v18;
}

- (id)regionAvailabilityForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HKFeatureAvailabilityProvidingDataSource *)self->_featureAvailabilityProvidingDataSource featureAvailabilityProvidingForFeatureIdentifier:v6];
  id v8 = v7;
  if (v7)
  {
    id v19 = 0;
    id v9 = [v7 regionAvailabilityWithError:&v19];
    id v10 = v19;
    v11 = v10;
    if (!v9)
    {
      id v12 = v10;
      uint64_t v13 = v12;
      if (v12)
      {
        if (a4) {
          *a4 = v12;
        }
        else {
          _HKLogDroppedError(v12);
        }
      }
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    id v15 = [NSString stringWithFormat:@"No extension found for feature with identifier %@", v6];
    objc_msgSend(v14, "hk_error:description:", 110, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v16;
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError(v16);
      }
    }

    id v9 = 0;
  }

  return v9;
}

- (id)featureStatusForFeatureWithIdentifier:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(HKFeatureStatusProvidingDataSource *)self->_featureStatusProvidingDataSource featureStatusProvidingForFeatureIdentifier:v8 context:a4];
  id v10 = v9;
  if (v9)
  {
    v11 = [v9 featureStatusWithError:a5];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = [NSString stringWithFormat:@"No feature status manager available for feature with identifier %@", v8];
    objc_msgSend(v12, "hk_error:description:", 110, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v14;
    if (v14)
    {
      if (a5) {
        *a5 = v14;
      }
      else {
        _HKLogDroppedError(v14);
      }
    }

    v11 = 0;
  }

  return v11;
}

- (id)performLocalEvaluation:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = [HKFeatureAvailabilityLocalRequirementEvaluationContext alloc];
  id v6 = [(HKFeatureAvailabilityRequirementEvaluationDataSource *)self healthDataSource];
  id v7 = -[HKFeatureAvailabilityRequirementEvaluationDataSource initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:](v5, "initWithHealthDataSource:featureAvailabilityProvidingDataSource:featureStatusProvidingDataSource:bluetoothDeviceDataSource:privacyPreferencesDataSource:respiratoryPreferencesDataSource:ageGatingDataSource:userNotificationSettingsDataSource:wristDetectionSettingDataSource:devicePairingAndSwitchingNotificationDataSource:darwinNotificationDataSource:watchLowPowerModeDataSource:currentCountryCodeProvider:requirementSatisfactionOverridesDataSource:currentDateDataSource:watchAppInstallationDataSource:onboardingRecordFallbackProvider:userNotificationsDataSource:healthDataRequirementDataSource:importExclusionDeviceDataSource:", v6, self->_featureAvailabilityProvidingDataSource, self->_featureStatusProvidingDataSource, self->_bluetoothDeviceDataSource, self->_privacyPreferencesDataSource, self->_respiratoryPreferencesDataSource, self->_ageGatingDataSource, self->_userNotificationSettingsDataSource, self->_wristDetectionSettingDataSource, self->_devicePairingAndSwitchingNotificationDataSource, self->_darwinNotificationDataSource, self->_watchLowPowerModeDataSource,
         self->_currentCountryCodeProvider,
         self->_requirementSatisfactionOverridesDataSource,
         self->_currentDateDataSource,
         self->_watchAppInstallationDataSource,
         self->_onboardingRecordFallbackProvider,
         self->_userNotificationsDataSource,
         self->_healthDataRequirementDataSource,
         self->_importExclusionDeviceDataSource);

  id v8 = v4[2](v4, v7);

  return v8;
}

- (id)requirementSatisfactionOverridesForFeatureWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [HKFeatureAvailabilityRequirementSatisfactionOverrides alloc];
  id v6 = [(HKUserDefaultsDataSource *)self->_requirementSatisfactionOverridesDataSource userDefaults];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__HKFeatureAvailabilityRequirementEvaluationDataSource_requirementSatisfactionOverridesForFeatureWithIdentifier___block_invoke;
  v9[3] = &unk_1E58C84D8;
  objc_copyWeak(&v10, &location);
  id v7 = [(HKFeatureAvailabilityRequirementSatisfactionOverrides *)v5 initWithUserDefaults:v6 featureIdentifier:v4 requirementOverridableEvaluator:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

uint64_t __113__HKFeatureAvailabilityRequirementEvaluationDataSource_requirementSatisfactionOverridesForFeatureWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = objc_alloc_init(HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility);
    uint64_t v9 = [(HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility *)v8 isRequirementOverridable:v6 featureIdentifier:v5 dataSource:WeakRetained];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)isWatchAppInstalledWithBundleIdentifier:(id)a3 error:(id *)a4
{
  watchAppInstallationDataSource = self->_watchAppInstallationDataSource;
  id v12 = 0;
  id v6 = [(HKWatchAppInstallationDataSource *)watchAppInstallationDataSource isWatchAppInstalledWithBundleIdentifier:a3 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (!v6)
  {
    id v9 = v7;
    id v10 = v9;
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError(v9);
      }
    }
  }

  return v6;
}

- (HKFeatureAvailabilityProvidingDataSource)featureAvailabilityProvidingDataSource
{
  return self->_featureAvailabilityProvidingDataSource;
}

- (HKFeatureStatusProvidingDataSource)featureStatusProvidingDataSource
{
  return self->_featureStatusProvidingDataSource;
}

- (HKBluetoothDeviceDataSource)bluetoothDeviceDataSource
{
  return self->_bluetoothDeviceDataSource;
}

- (HKUserDefaultsDataSource)privacyPreferencesDataSource
{
  return self->_privacyPreferencesDataSource;
}

- (HKUserDefaultsDataSource)respiratoryPreferencesDataSource
{
  return self->_respiratoryPreferencesDataSource;
}

- (HKUserDefaultsDataSource)ageGatingDataSource
{
  return self->_ageGatingDataSource;
}

- (HKUserDefaultsDataSource)userNotificationSettingsDataSource
{
  return self->_userNotificationSettingsDataSource;
}

- (HKWristDetectionSettingDataSource)wristDetectionSettingDataSource
{
  return self->_wristDetectionSettingDataSource;
}

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingNotificationDataSource
{
  return self->_devicePairingAndSwitchingNotificationDataSource;
}

- (HKDarwinNotificationDataSource)darwinNotificationDataSource
{
  return self->_darwinNotificationDataSource;
}

- (HKWatchAppInstallationDataSource)watchAppInstallationDataSource
{
  return self->_watchAppInstallationDataSource;
}

- (HKWatchLowPowerModeDataSource)watchLowPowerModeDataSource
{
  return self->_watchLowPowerModeDataSource;
}

- (HKUserNotificationsDataSource)userNotificationsDataSource
{
  return self->_userNotificationsDataSource;
}

- (HKImportExclusionDeviceDataSource)importExclusionDeviceDataSource
{
  return self->_importExclusionDeviceDataSource;
}

- (HKCurrentCountryCodeProvider)currentCountryCodeProvider
{
  return self->_currentCountryCodeProvider;
}

- (HKFeatureAvailabilityHealthDataSource)weakHealthDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakHealthDataSource);

  return (HKFeatureAvailabilityHealthDataSource *)WeakRetained;
}

- (HKFeatureAvailabilityHealthDataSource)strongHealthDataSource
{
  return self->_strongHealthDataSource;
}

- (id)currentDateDataSource
{
  return self->_currentDateDataSource;
}

- (void)setCurrentDateDataSource:(id)a3
{
}

- (HKFeatureOnboardingRecordFallbackProviding)onboardingRecordFallbackProvider
{
  return self->_onboardingRecordFallbackProvider;
}

- (void)setOnboardingRecordFallbackProvider:(id)a3
{
}

- (HKFeatureAvailabilityHealthDataRequirementDataSource)healthDataRequirementDataSource
{
  return self->_healthDataRequirementDataSource;
}

- (HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource)requirementSatisfactionOverridesDataSource
{
  return self->_requirementSatisfactionOverridesDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementSatisfactionOverridesDataSource, 0);
  objc_storeStrong((id *)&self->_healthDataRequirementDataSource, 0);
  objc_storeStrong((id *)&self->_onboardingRecordFallbackProvider, 0);
  objc_storeStrong(&self->_currentDateDataSource, 0);
  objc_storeStrong((id *)&self->_strongHealthDataSource, 0);
  objc_destroyWeak((id *)&self->_weakHealthDataSource);
  objc_storeStrong((id *)&self->_currentCountryCodeProvider, 0);
  objc_storeStrong((id *)&self->_importExclusionDeviceDataSource, 0);
  objc_storeStrong((id *)&self->_userNotificationsDataSource, 0);
  objc_storeStrong((id *)&self->_watchLowPowerModeDataSource, 0);
  objc_storeStrong((id *)&self->_watchAppInstallationDataSource, 0);
  objc_storeStrong((id *)&self->_darwinNotificationDataSource, 0);
  objc_storeStrong((id *)&self->_devicePairingAndSwitchingNotificationDataSource, 0);
  objc_storeStrong((id *)&self->_wristDetectionSettingDataSource, 0);
  objc_storeStrong((id *)&self->_userNotificationSettingsDataSource, 0);
  objc_storeStrong((id *)&self->_ageGatingDataSource, 0);
  objc_storeStrong((id *)&self->_respiratoryPreferencesDataSource, 0);
  objc_storeStrong((id *)&self->_privacyPreferencesDataSource, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceDataSource, 0);
  objc_storeStrong((id *)&self->_featureStatusProvidingDataSource, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityProvidingDataSource, 0);
}

@end