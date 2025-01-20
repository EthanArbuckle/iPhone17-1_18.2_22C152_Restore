@interface HDRespiratoryRateMeasurementsProfileExtension
- (HDRespiratoryRateMeasurementsProfileExtension)initWithProfile:(id)a3;
- (HDRespiratoryRateMeasurementsProfileExtension)initWithProfile:(id)a3 featureIdentifier:(id)a4 isBackgroundDeliveryEnabled:(BOOL)a5 loggingCategory:(id)a6;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
@end

@implementation HDRespiratoryRateMeasurementsProfileExtension

- (HDRespiratoryRateMeasurementsProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = HKLogInfrastructure();
  v6 = v5;
  if (self)
  {
    v7 = (void *)*MEMORY[0x1E4F29DA8];
    id v8 = v5;
    id v9 = v7;
    id v10 = v4;
    v11 = [v10 daemon];
    v12 = [v11 behavior];
    uint64_t v13 = [v12 isCompanionCapable];

    self = [(HDRespiratoryRateMeasurementsProfileExtension *)self initWithProfile:v10 featureIdentifier:v9 isBackgroundDeliveryEnabled:v13 loggingCategory:v8];
  }

  return self;
}

- (HDRespiratoryRateMeasurementsProfileExtension)initWithProfile:(id)a3 featureIdentifier:(id)a4 isBackgroundDeliveryEnabled:(BOOL)a5 loggingCategory:(id)a6
{
  BOOL v7 = a5;
  v61[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v55.receiver = self;
  v55.super_class = (Class)HDRespiratoryRateMeasurementsProfileExtension;
  uint64_t v13 = [(HDRespiratoryRateMeasurementsProfileExtension *)&v55 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_featureIdentifier, a4);
    v15 = [HDOTAFeatureDisableAndExpiryProvider alloc];
    [v10 daemon];
    v16 = id v53 = v12;
    v51 = [(HDOTAFeatureDisableAndExpiryProvider *)v15 initWithDaemon:v16 featureIdentifier:v11];

    v48 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5C64C95B-8E7C-46AB-A110-1E51C93D7B7F"];
    v52 = [HDFeatureAvailabilityManager alloc];
    v17 = (objc_class *)MEMORY[0x1E4F2B028];
    v18 = v14->_featureIdentifier;
    id v42 = [v17 alloc];
    v60[0] = *MEMORY[0x1E4F29B90];
    v50 = [MEMORY[0x1E4F2B030] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v18];
    v59 = v50;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    v61[0] = v49;
    v60[1] = *MEMORY[0x1E4F29BF8];
    v47 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v18];
    v58[0] = v47;
    v46 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:v18];
    v58[1] = v46;
    uint64_t v19 = *MEMORY[0x1E4F29EC8];
    v45 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EC8]];
    v58[2] = v45;
    v44 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
    v58[3] = v44;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
    v61[1] = v40;
    v60[2] = *MEMORY[0x1E4F29BF0];
    v39 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v18];
    v57[0] = v39;
    v38 = [MEMORY[0x1E4F2B030] countryIsSupportedOnWatchForFeatureWithIdentifier:v18 isSupportedIfCountryListMissing:0];
    v57[1] = v38;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    v61[2] = v37;
    v60[3] = *MEMORY[0x1E4F29C20];
    v36 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v18];
    v56[0] = v36;
    v35 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
    v56[1] = v35;
    [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:v18];
    v20 = BOOL v41 = v7;
    v56[2] = v20;
    v21 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v18];
    v56[3] = v21;
    [MEMORY[0x1E4F2B030] countryIsSupportedOnWatchForFeatureWithIdentifier:v18 isSupportedIfCountryListMissing:0];
    v22 = id v54 = v10;
    v56[4] = v22;
    v23 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v19];
    v56[5] = v23;
    v24 = [MEMORY[0x1E4F2B030] featureIsOnWithIdentifier:v18 isOnIfSettingIsAbsent:1];

    v56[6] = v24;
    [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
    v26 = id v25 = v11;
    v56[7] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:8];
    v61[3] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:4];
    v43 = (void *)[v42 initWithRequirementsByContext:v28];

    id v11 = v25;
    id v12 = v53;

    id v10 = v54;
    v29 = +[HDRegionAvailabilityProvider anyCountryAvailability];
    uint64_t v30 = [(HDFeatureAvailabilityManager *)v52 initWithProfile:v54 featureIdentifier:v25 availabilityRequirements:v43 currentOnboardingVersion:1 pairedDeviceCapability:v48 regionAvailabilityProvider:v29 disableAndExpiryProvider:v51 loggingCategory:v53];
    featureAvailabilityManager = v14->_featureAvailabilityManager;
    v14->_featureAvailabilityManager = (HDFeatureAvailabilityManager *)v30;

    if (v41)
    {
      v32 = [[HDBackgroundFeatureDeliveryManager alloc] initWithProfile:v54 featureAvailabilityExtension:v14->_featureAvailabilityManager loggingCategory:v53];
      featureDeliveryManager = v14->_featureDeliveryManager;
      v14->_featureDeliveryManager = v32;
    }
  }

  return v14;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  if ([a3 isEqualToString:self->_featureIdentifier]) {
    id v4 = self->_featureAvailabilityManager;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_featureDeliveryManager, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end