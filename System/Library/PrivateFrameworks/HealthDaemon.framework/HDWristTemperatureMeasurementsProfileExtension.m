@interface HDWristTemperatureMeasurementsProfileExtension
- (HDWristTemperatureMeasurementsProfileExtension)initWithProfile:(id)a3;
- (HDWristTemperatureMeasurementsProfileExtension)initWithProfile:(id)a3 featureIdentifier:(id)a4 isBackgroundDeliveryEnabled:(BOOL)a5 loggingCategory:(id)a6;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
@end

@implementation HDWristTemperatureMeasurementsProfileExtension

- (HDWristTemperatureMeasurementsProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = HKLogInfrastructure();
  v6 = v5;
  if (self)
  {
    v7 = (void *)*MEMORY[0x1E4F29DD0];
    id v8 = v5;
    id v9 = v7;
    id v10 = v4;
    v11 = [v10 daemon];
    v12 = [v11 behavior];
    uint64_t v13 = [v12 isCompanionCapable];

    self = [(HDWristTemperatureMeasurementsProfileExtension *)self initWithProfile:v10 featureIdentifier:v9 isBackgroundDeliveryEnabled:v13 loggingCategory:v8];
  }

  return self;
}

- (HDWristTemperatureMeasurementsProfileExtension)initWithProfile:(id)a3 featureIdentifier:(id)a4 isBackgroundDeliveryEnabled:(BOOL)a5 loggingCategory:(id)a6
{
  BOOL v7 = a5;
  v97[8] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v86.receiver = self;
  v86.super_class = (Class)HDWristTemperatureMeasurementsProfileExtension;
  uint64_t v13 = [(HDWristTemperatureMeasurementsProfileExtension *)&v86 init];
  v14 = v13;
  if (v13)
  {
    v83 = v13;
    objc_storeStrong((id *)&v13->_featureIdentifier, a4);
    v15 = [MEMORY[0x1E4F2B860] sharedBehavior];
    BOOL v81 = v7;
    if ([v15 isAppleWatch]) {
      v16 = 0;
    }
    else {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"CBC78224-8F5E-4D43-8666-69ADBE2A6277"];
    }

    uint64_t v17 = [MEMORY[0x1E4F2AE70] localAvailabilityForWristTemperatureMeasurements];
    v18 = [HDLocalCountrySetAvailabilityProvider alloc];
    v19 = [v10 daemon];
    v80 = (void *)v17;
    uint64_t v20 = [(HDLocalCountrySetAvailabilityProvider *)v18 initWithFeatureIdentifier:v11 defaultCountrySet:v17 healthDaemon:v19];

    v21 = [HDPairedFeaturePropertiesSyncManager alloc];
    v22 = [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"1"];
    v79 = (void *)v20;
    v23 = [(HDPairedFeaturePropertiesSyncManager *)v21 initWithFeatureIdentifier:v11 localFeatureAttributes:v22 localCountrySetAvailabilityProvider:v20];

    [(HDPairedFeaturePropertiesSyncManager *)v23 synchronizeLocalProperties];
    v78 = v23;
    v73 = [[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider alloc] initWithAllowedCountriesDataSource:v23 profile:v10 featureCapability:v16 loggingCategory:v12];
    v24 = [HDOTAFeatureDisableAndExpiryProvider alloc];
    v25 = [v10 daemon];
    v69 = [(HDOTAFeatureDisableAndExpiryProvider *)v24 initWithDaemon:v25 featureIdentifier:v11];

    v77 = [HDFeatureAvailabilityManager alloc];
    v26 = (objc_class *)MEMORY[0x1E4F2B028];
    id v84 = v11;
    id v27 = v11;
    id v28 = v16;
    id v64 = [v26 alloc];
    v96[0] = *MEMORY[0x1E4F29B90];
    v76 = [MEMORY[0x1E4F2B030] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v27];
    v95 = v76;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
    v97[0] = v75;
    v96[1] = *MEMORY[0x1E4F29B98];
    v74 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v27 supportedOnLocalDevice:HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()];
    v94[0] = v74;
    v72 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v27];
    v94[1] = v72;
    v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
    v97[1] = v71;
    v96[2] = *MEMORY[0x1E4F29BA0];
    uint64_t v29 = *MEMORY[0x1E4F29ED0];
    v70 = [MEMORY[0x1E4F2B030] defaultHelpTileRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:v27 isAgeGatedUserDefaultsKey:*MEMORY[0x1E4F29ED0]];
    v93[0] = v70;
    v68 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnAnyWatch:v28 supportedOnLocalDevice:HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()];
    v93[1] = v68;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
    v97[2] = v67;
    v96[3] = *MEMORY[0x1E4F29BF8];
    v66 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:v27];
    v92[0] = v66;
    v63 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v27 supportedOnLocalDevice:HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()];
    v92[1] = v63;
    v62 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v29];
    v92[2] = v62;
    v61 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
    v92[3] = v61;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];
    v97[3] = v60;
    v96[4] = *MEMORY[0x1E4F29BF0];
    v59 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v27];
    v91[0] = v59;
    v58 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v27];
    v91[1] = v58;
    v57 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v27 isSupportedIfCountryListMissing:1];
    v91[2] = v57;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:3];
    v97[4] = v56;
    v96[5] = *MEMORY[0x1E4F29C08];
    v55 = [MEMORY[0x1E4F2B030] defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:v27 isAgeGatedUserDefaultsKey:v29];
    v90[0] = v55;
    v54 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnAnyWatch:v28 supportedOnLocalDevice:HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()];
    v90[1] = v54;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    v97[5] = v53;
    v96[6] = *MEMORY[0x1E4F29C00];
    v52 = [MEMORY[0x1E4F2B030] defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:v27 isAgeGatedUserDefaultsKey:v29];
    v89[0] = v52;
    v47 = v28;
    v51 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnAnyWatch:v28 supportedOnLocalDevice:HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()];

    v89[1] = v51;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
    v97[6] = v50;
    v96[7] = *MEMORY[0x1E4F29C20];
    v49 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
    v88[0] = v49;
    v48 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:v27];
    v88[1] = v48;
    v46 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v27 supportedOnLocalDevice:HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()];
    v88[2] = v46;
    v45 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v27];
    v88[3] = v45;
    v30 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v27];
    v88[4] = v30;
    v31 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v27 isSupportedIfCountryListMissing:1];
    v88[5] = v31;
    v32 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v29];
    v88[6] = v32;
    id v82 = v12;
    v33 = (void *)MEMORY[0x1E4F2B030];
    uint64_t v87 = *MEMORY[0x1E4F29DC0];
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
    v34 = id v85 = v10;
    v35 = [v33 onboardingRecordsArePresentForPrerequisiteFeaturesWithIdentifiers:v34];
    v88[7] = v35;
    v36 = [MEMORY[0x1E4F2B030] featureIsOnWithIdentifier:v27 isOnIfSettingIsAbsent:1];

    v88[8] = v36;
    v37 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
    v88[9] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:10];
    v97[7] = v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:8];
    v65 = (void *)[v64 initWithRequirementsByContext:v39];

    id v12 = v82;
    id v10 = v85;

    uint64_t v40 = [(HDFeatureAvailabilityManager *)v77 initWithProfile:v85 featureIdentifier:v27 availabilityRequirements:v65 currentOnboardingVersion:1 pairedDeviceCapability:v47 regionAvailabilityProvider:v73 disableAndExpiryProvider:v69 loggingCategory:v82];
    v14 = v83;
    featureAvailabilityManager = v83->_featureAvailabilityManager;
    v83->_featureAvailabilityManager = (HDFeatureAvailabilityManager *)v40;

    if (v81)
    {
      v42 = [[HDBackgroundFeatureDeliveryManager alloc] initWithProfile:v85 featureAvailabilityExtension:v83->_featureAvailabilityManager loggingCategory:v82];
      featureDeliveryManager = v83->_featureDeliveryManager;
      v83->_featureDeliveryManager = v42;
    }
    id v11 = v84;
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