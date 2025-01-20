@interface HDFeatureAvailabilityManager(HDMenstrualCycles)
+ (id)hdmc_deviationsAvailabilityManagerWithProfile:()HDMenstrualCycles;
+ (id)hdmc_heartRateInputAvailabilityManagerWithProfile:()HDMenstrualCycles;
+ (id)hdmc_menstrualCyclesAvailabilityManagerWithProfile:()HDMenstrualCycles;
+ (id)hdmc_wristTemperatureInputAvailabilityManagerWithProfile:()HDMenstrualCycles;
@end

@implementation HDFeatureAvailabilityManager(HDMenstrualCycles)

+ (id)hdmc_menstrualCyclesAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  uint64_t v3 = *MEMORY[0x263F09798];
  v4 = (objc_class *)MEMORY[0x263F43228];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [MEMORY[0x263F0A288] emptyCountrySet];
  v8 = [v5 daemon];
  v9 = (void *)[v6 initWithFeatureIdentifier:v3 defaultCountrySet:v7 healthDaemon:v8];

  id v10 = objc_alloc(MEMORY[0x263F432B8]);
  v11 = HDMCLocalFeatureAttributes();
  v12 = (void *)[v10 initWithFeatureIdentifier:v3 localFeatureAttributes:v11 localCountrySetAvailabilityProvider:v9];

  [v12 synchronizeLocalProperties];
  id v13 = objc_alloc(MEMORY[0x263F431E8]);
  v14 = [MEMORY[0x263F0A3A0] noRequirements];
  v15 = [MEMORY[0x263F43300] uncheckedAvailability];
  id v16 = objc_alloc_init(MEMORY[0x263F431F0]);
  v17 = (void *)[v13 initWithProfile:v5 featureIdentifier:v3 availabilityRequirements:v14 currentOnboardingVersion:1 pairedDeviceCapability:0 pairedFeatureAttributesProvider:v12 regionAvailabilityProvider:v15 disableAndExpiryProvider:v16 loggingCategory:*MEMORY[0x263F09930]];

  return v17;
}

+ (id)hdmc_heartRateInputAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  v64[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (id)*MEMORY[0x263F097A8];
  uint64_t v5 = [MEMORY[0x263F0A288] localAvailabilityForMenstrualCyclesHeartRateInput];
  id v6 = objc_alloc(MEMORY[0x263F43228]);
  v7 = [v3 daemon];
  v52 = (void *)v5;
  uint64_t v8 = [v6 initWithFeatureIdentifier:v4 defaultCountrySet:v5 healthDaemon:v7];

  id v9 = objc_alloc(MEMORY[0x263F432B8]);
  id v10 = HDMCHeartRateInputLocalFeatureAttributes();
  v51 = (void *)v8;
  v11 = (void *)[v9 initWithFeatureIdentifier:v4 localFeatureAttributes:v10 localCountrySetAvailabilityProvider:v8];

  v49 = v11;
  [v11 synchronizeLocalProperties];
  id v12 = objc_alloc(MEMORY[0x263F432A8]);
  id v13 = [v3 daemon];
  v50 = (void *)[v12 initWithDaemon:v13 featureIdentifier:v4];

  v63[0] = *MEMORY[0x263F095D0];
  v14 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v4];
  v62 = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
  v64[0] = v15;
  v63[1] = *MEMORY[0x263F095C8];
  id v16 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v61[0] = v16;
  v17 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:1];
  v61[1] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
  v64[1] = v18;
  v48 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];

  v19 = v3;
  v20 = [v3 daemon];
  v21 = [v20 behavior];
  LODWORD(v16) = [v21 isAppleWatch];

  v22 = (void *)MEMORY[0x263F09930];
  if (v16)
  {
    v23 = v49;
    v24 = (void *)[objc_alloc(MEMORY[0x263F43440]) initWithAllowedCountriesDataSource:v49 profile:v3 featureCapability:0 loggingCategory:*MEMORY[0x263F09930]];
    uint64_t v59 = *MEMORY[0x263F09600];
    v47 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
    v58[0] = v47;
    v46 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];
    v58[1] = v46;
    v45 = [MEMORY[0x263F0A3A8] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:1];
    v58[2] = v45;
    v44 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v4];
    v58[3] = v44;
    v43 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v4 isOnIfSettingIsAbsent:1];
    v58[4] = v43;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:5];
    v60 = v25;
    v26 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    v27 = v48;
    v28 = objc_msgSend(v48, "hk_dictionaryByAddingEntriesFromDictionary:", v26);
    v29 = v22;
  }
  else
  {
    id v30 = objc_alloc(MEMORY[0x263F43228]);
    v31 = [v3 daemon];
    uint64_t v42 = [v30 initWithFeatureIdentifier:v4 defaultCountrySet:v52 healthDaemon:v31];

    v56[0] = *MEMORY[0x263F09580];
    v47 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v4];
    v55[0] = v47;
    v46 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:*MEMORY[0x263F09798]];
    v55[1] = v46;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    v57[0] = v45;
    v56[1] = *MEMORY[0x263F095A8];
    v44 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v4];
    v54[0] = v44;
    v43 = [MEMORY[0x263F0A3A8] onboardingRecordIsNotPresentForFeatureWithIdentifier:v4];
    v54[1] = v43;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
    v57[1] = v25;
    v56[2] = *MEMORY[0x263F09600];
    v26 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
    v53[0] = v26;
    uint64_t v41 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];
    v53[1] = v41;
    v32 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v4];
    v53[2] = v32;
    v33 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v4 isOnIfSettingIsAbsent:1];
    v53[3] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];
    v57[2] = v34;
    [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];
    v36 = v35 = v19;
    v28 = objc_msgSend(v48, "hk_dictionaryByAddingEntriesFromDictionary:", v36);

    v19 = v35;
    v29 = (void *)MEMORY[0x263F09930];

    v27 = (void *)v41;
    v24 = (void *)v42;
    v23 = v49;
  }

  id v37 = objc_alloc(MEMORY[0x263F431E8]);
  v38 = (void *)[objc_alloc(MEMORY[0x263F0A3A0]) initWithRequirementsByContext:v28];
  v39 = (void *)[v37 initWithProfile:v19 featureIdentifier:v4 availabilityRequirements:v38 currentOnboardingVersion:1 pairedDeviceCapability:0 pairedFeatureAttributesProvider:v23 regionAvailabilityProvider:v24 disableAndExpiryProvider:v50 loggingCategory:*v29];

  return v39;
}

+ (id)hdmc_wristTemperatureInputAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  v82[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (id)*MEMORY[0x263F097B0];
  uint64_t v5 = HKLocalDeviceHardwareSupportsWristTemperatureMeasurements();
  uint64_t v6 = [MEMORY[0x263F0A288] localAvailabilityForMenstrualCyclesWristTemperatureInput];
  id v7 = objc_alloc(MEMORY[0x263F43228]);
  v67 = v3;
  uint64_t v8 = [v3 daemon];
  v66 = (void *)v6;
  uint64_t v9 = [v7 initWithFeatureIdentifier:v4 defaultCountrySet:v6 healthDaemon:v8];

  id v10 = objc_alloc(MEMORY[0x263F432B8]);
  v11 = HDMCWristTemperatureInputLocalFeatureAttributes();
  v65 = (void *)v9;
  id v12 = (void *)[v10 initWithFeatureIdentifier:v4 localFeatureAttributes:v11 localCountrySetAvailabilityProvider:v9];

  v63 = v12;
  [v12 synchronizeLocalProperties];
  id v13 = objc_alloc(MEMORY[0x263F432A8]);
  v14 = [v3 daemon];
  v64 = (void *)[v13 initWithDaemon:v14 featureIdentifier:v4];

  v81[0] = *MEMORY[0x263F095D0];
  v60 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v4];
  v80 = v60;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
  v82[0] = v58;
  v81[1] = *MEMORY[0x263F095C8];
  v56 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v79[0] = v56;
  v15 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:1];
  v79[1] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
  v82[1] = v16;
  v81[2] = *MEMORY[0x263F095E8];
  v17 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v4];
  v78[0] = v17;
  uint64_t v18 = *MEMORY[0x263F098C0];
  v19 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:*MEMORY[0x263F098C0]];
  v78[1] = v19;
  unsigned int v54 = v5;
  v20 = [MEMORY[0x263F0A3A8] capabilityIsSupportedOnAnyWatch:0 supportedOnLocalDevice:v5];
  v78[2] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
  v82[2] = v21;
  v81[3] = *MEMORY[0x263F095E0];
  uint64_t v52 = v18;
  v22 = [MEMORY[0x263F0A3A8] defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:v4 isAgeGatedUserDefaultsKey:v18];
  v77 = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  v82[3] = v23;
  v62 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:4];

  v24 = v67;
  v25 = [v67 daemon];
  v26 = [v25 behavior];
  LODWORD(v23) = [v26 isAppleWatch];

  v27 = (void *)MEMORY[0x263F09930];
  if (v23)
  {
    v28 = v63;
    v29 = (void *)[objc_alloc(MEMORY[0x263F43440]) initWithAllowedCountriesDataSource:v63 profile:v67 featureCapability:0 loggingCategory:*MEMORY[0x263F09930]];
    uint64_t v75 = *MEMORY[0x263F09600];
    id v30 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
    v74[0] = v30;
    v61 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];
    v74[1] = v61;
    uint64_t v59 = [MEMORY[0x263F0A3A8] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:1];
    v74[2] = v59;
    v57 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v4];
    v74[3] = v57;
    v55 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v4 isOnIfSettingIsAbsent:1];
    v74[4] = v55;
    v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:5];
    v76 = v53;
    v31 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    v32 = v62;
    v33 = objc_msgSend(v62, "hk_dictionaryByAddingEntriesFromDictionary:", v31);
    v34 = 0;
  }
  else
  {
    uint64_t v49 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CBC78224-8F5E-4D43-8666-69ADBE2A6277"];
    id v35 = objc_alloc(MEMORY[0x263F43228]);
    v36 = [v67 daemon];
    uint64_t v50 = [v35 initWithFeatureIdentifier:v4 defaultCountrySet:v66 healthDaemon:v36];

    v72[0] = *MEMORY[0x263F09580];
    uint64_t v51 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v4];
    v71[0] = v51;
    v61 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:*MEMORY[0x263F09798]];
    v71[1] = v61;
    uint64_t v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
    v73[0] = v59;
    v72[1] = *MEMORY[0x263F09590];
    v57 = [MEMORY[0x263F0A3A8] defaultHelpTileRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:v4 isAgeGatedUserDefaultsKey:v52];
    v70[0] = v57;
    v55 = [MEMORY[0x263F0A3A8] capabilityIsSupportedOnAnyWatch:v49 supportedOnLocalDevice:v54];
    v70[1] = v55;
    v53 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v4 isOnIfSettingIsAbsent:1];
    v70[2] = v53;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:3];
    v73[1] = v31;
    v72[2] = *MEMORY[0x263F095A8];
    uint64_t v48 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v4];
    uint64_t v69 = v48;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
    v73[2] = v47;
    v72[3] = *MEMORY[0x263F09600];
    id v37 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
    v68[0] = v37;
    v38 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];
    v68[1] = v38;
    v39 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v4];
    v68[2] = v39;
    v40 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v4 isOnIfSettingIsAbsent:1];
    v68[3] = v40;
    uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:4];
    v73[3] = v41;
    uint64_t v42 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:4];
    v33 = objc_msgSend(v62, "hk_dictionaryByAddingEntriesFromDictionary:", v42);

    v29 = (void *)v50;
    v34 = (void *)v49;

    v27 = (void *)MEMORY[0x263F09930];
    v24 = v67;

    id v30 = (void *)v51;
    v32 = (void *)v48;
    v28 = v63;
  }

  id v43 = objc_alloc(MEMORY[0x263F431E8]);
  v44 = (void *)[objc_alloc(MEMORY[0x263F0A3A0]) initWithRequirementsByContext:v33];
  v45 = (void *)[v43 initWithProfile:v24 featureIdentifier:v4 availabilityRequirements:v44 currentOnboardingVersion:1 pairedDeviceCapability:v34 pairedFeatureAttributesProvider:v28 regionAvailabilityProvider:v29 disableAndExpiryProvider:v64 loggingCategory:*v27];

  return v45;
}

+ (id)hdmc_deviationsAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  v39[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 daemon];
  uint64_t v5 = [v4 behavior];
  char v6 = [v5 isAppleWatch];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F097A0];
    id v28 = objc_alloc(MEMORY[0x263F0A3A0]);
    v38[0] = *MEMORY[0x263F09580];
    v33 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:*MEMORY[0x263F09798]];
    v37[0] = v33;
    v32 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v8];
    v37[1] = v32;
    v31 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v8];
    v37[2] = v31;
    id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
    v39[0] = v30;
    v38[1] = *MEMORY[0x263F09600];
    v27 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v8];
    v36[0] = v27;
    v26 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v8];
    v36[1] = v26;
    uint64_t v9 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v8];
    v36[2] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
    v39[1] = v10;
    v38[2] = *MEMORY[0x263F095D0];
    v11 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v8];
    id v35 = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
    v39[2] = v12;
    v38[3] = *MEMORY[0x263F095A8];
    id v13 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v8];
    v34[0] = v13;
    v14 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v8];
    v34[1] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    v39[3] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
    v29 = (void *)[v28 initWithRequirementsByContext:v16];

    v17 = [MEMORY[0x263F0A288] localAvailabilityForMenstrualCyclesDeviationDetection];
    id v18 = objc_alloc(MEMORY[0x263F43228]);
    v19 = [v3 daemon];
    v20 = (void *)[v18 initWithFeatureIdentifier:v8 defaultCountrySet:v17 healthDaemon:v19];

    id v21 = objc_alloc(MEMORY[0x263F432A8]);
    v22 = [v3 daemon];
    v23 = (void *)[v21 initWithDaemon:v22 featureIdentifier:v8];

    id v24 = objc_alloc(MEMORY[0x263F431E8]);
    id v7 = (void *)[v24 initWithProfile:v3 featureIdentifier:v8 availabilityRequirements:v29 currentOnboardingVersion:1 pairedDeviceCapability:0 regionAvailabilityProvider:v20 disableAndExpiryProvider:v23 loggingCategory:*MEMORY[0x263F09930]];
  }
  return v7;
}

@end