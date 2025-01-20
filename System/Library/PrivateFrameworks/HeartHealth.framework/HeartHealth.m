id HKHRIrregularRhythmNotificationsRequirementsWithFeatureIdentifier(void *a1)
{
  objc_class *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void v71[8];
  void v72[6];
  void v73[12];
  void v74[8];
  void v75[6];
  void v76[8];
  void v77[11];
  void v78[13];
  uint64_t vars8;

  v78[11] = *MEMORY[0x1E4F143B8];
  v1 = (objc_class *)MEMORY[0x1E4F2B028];
  v2 = a1;
  v50 = [v1 alloc];
  v77[0] = *MEMORY[0x1E4F29BC0];
  v70 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v76[0] = v70;
  v69 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v76[1] = v69;
  v68 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v76[2] = v68;
  v67 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2];
  v76[3] = v67;
  v66 = [MEMORY[0x1E4F2B030] seedIsNotExpiredForFeatureWithIdentifier:v2];
  v76[4] = v66;
  v65 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v76[5] = v65;
  v3 = *MEMORY[0x1E4F29EB8];
  v64 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v76[6] = v64;
  v4 = *MEMORY[0x1E4F29D10];
  v63 = [MEMORY[0x1E4F2B030] mutuallyExclusiveFeatureIsOffWithIdentifier:*MEMORY[0x1E4F29D10]];
  v76[7] = v63;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:8];
  v78[0] = v62;
  v77[1] = *MEMORY[0x1E4F29BD0];
  v61 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v75[0] = v61;
  v60 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v75[1] = v60;
  v59 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v75[2] = v59;
  v58 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v75[3] = v58;
  v57 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2];
  v75[4] = v57;
  v56 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v3];
  v75[5] = v56;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:6];
  v78[1] = v55;
  v77[2] = *MEMORY[0x1E4F29BC8];
  v54 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v74[0] = v54;
  v53 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v74[1] = v53;
  v52 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v74[2] = v52;
  v49 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v74[3] = v49;
  v48 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2];
  v74[4] = v48;
  v47 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v3];
  v74[5] = v47;
  v46 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v74[6] = v46;
  v45 = [MEMORY[0x1E4F2B030] mutuallyExclusiveFeatureIsOffWithIdentifier:v4];
  v74[7] = v45;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:8];
  v78[2] = v44;
  v77[3] = *MEMORY[0x1E4F29BD8];
  v43 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v73[0] = v43;
  v42 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v73[1] = v42;
  v41 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v73[2] = v41;
  v40 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2];
  v73[3] = v40;
  v39 = [MEMORY[0x1E4F2B030] seedIsNotExpiredForFeatureWithIdentifier:v2];
  v73[4] = v39;
  v38 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v73[5] = v38;
  v37 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v73[6] = v37;
  v36 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2 isSupportedIfCountryListMissing:0];
  v73[7] = v36;
  v35 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v3];
  v73[8] = v35;
  v34 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v73[9] = v34;
  v33 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v73[10] = v33;
  v32 = [MEMORY[0x1E4F2B030] onboardingRecordIsNotPresentForMutuallyExclusiveFeatureWithIdentifier:v4];
  v73[11] = v32;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:12];
  v78[3] = v31;
  v77[4] = *MEMORY[0x1E4F29BF8];
  v30 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v72[0] = v30;
  v29 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v72[1] = v29;
  v28 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v72[2] = v28;
  v27 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v72[3] = v27;
  v26 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2];
  v72[4] = v26;
  v25 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:v3];
  v72[5] = v25;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:6];
  v78[4] = v24;
  v77[5] = *MEMORY[0x1E4F29BF0];
  v23 = [MEMORY[0x1E4F2B030] seedIsNotExpiredForFeatureWithIdentifier:v2];
  v71[0] = v23;
  v22 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v71[1] = v22;
  v21 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v71[2] = v21;
  v20 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v71[3] = v20;
  v19 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2 isSupportedIfCountryListMissing:1];
  v71[4] = v19;
  v18 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v71[5] = v18;
  v17 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v71[6] = v17;
  v5 = [MEMORY[0x1E4F2B030] mutuallyExclusiveFeatureIsOffWithIdentifier:v4];
  v71[7] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:8];
  v78[5] = v6;
  v77[6] = *MEMORY[0x1E4F29C08];
  v7 = _TipsAppVisibilityRequirementsForFeatureIdentifier(v2);
  v78[6] = v7;
  v77[7] = *MEMORY[0x1E4F29C00];
  v8 = _TipsAppVisibilityRequirementsForFeatureIdentifier(v2);
  v9 = [MEMORY[0x1E4F2B030] onboardingRecordIsNotPresentForFeatureWithIdentifier:v2];
  v10 = [v8 arrayByAddingObject:v9];
  v78[7] = v10;
  v77[8] = *MEMORY[0x1E4F29BB0];
  v11 = _UsageRequirementsForFeatureIdentifier(v2);
  v12 = objc_msgSend(v11, "hk_filter:", &__block_literal_global_0);

  v78[8] = v12;
  v77[9] = @"UsagePendingOnboarding";
  v13 = _UsageRequirementsPendingOnboardingForFeatureIdentifier(v2);
  v78[9] = v13;
  v77[10] = *MEMORY[0x1E4F29C20];
  v14 = _UsageRequirementsForFeatureIdentifier(v2);

  v78[10] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:11];
  v51 = (id)[v50 initWithRequirementsByContext:v15];

  return v51;
}

id _UsageRequirementsPendingOnboardingForFeatureIdentifier(void *a1)
{
  v18[13] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F2B030];
  id v2 = a1;
  v17 = [v1 healthAppIsNotHidden];
  v18[0] = v17;
  v16 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v18[1] = v16;
  v15 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v18[2] = v15;
  v14 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v18[3] = v14;
  v3 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2];
  v18[4] = v3;
  v4 = [MEMORY[0x1E4F2B030] seedIsNotExpiredForFeatureWithIdentifier:v2];
  v18[5] = v4;
  v5 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v18[6] = v5;
  v6 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v18[7] = v6;
  v7 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2 isSupportedIfCountryListMissing:1];

  v18[8] = v7;
  v8 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v18[9] = v8;
  v9 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v18[10] = v9;
  v10 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v18[11] = v10;
  v11 = [MEMORY[0x1E4F2B030] mutuallyExclusiveFeatureIsOffWithIdentifier:*MEMORY[0x1E4F29D10]];
  v18[12] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:13];

  return v12;
}

id _UsageRequirementsForFeatureIdentifier(void *a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = _UsageRequirementsPendingOnboardingForFeatureIdentifier(v1);
  v3 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:v1];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F2B030] featureIsOnWithIdentifier:v1 isOnIfSettingIsAbsent:0];

  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

id _TipsAppVisibilityRequirementsForFeatureIdentifier(void *a1)
{
  v13[8] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F2B030];
  id v2 = a1;
  v3 = [v1 profileIsNotFamilySetupPairingProfile];
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v2];
  v13[1] = v4;
  v5 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2];
  v13[2] = v5;
  v6 = [MEMORY[0x1E4F2B030] seedIsNotExpiredForFeatureWithIdentifier:v2];
  v13[3] = v6;
  v7 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v13[4] = v7;
  v8 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v13[5] = v8;
  v9 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2 isSupportedIfCountryListMissing:1];

  v13[6] = v9;
  v10 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v13[7] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:8];

  return v11;
}

uint64_t HKHRAFibBurdenControlClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B90E40];
}

id HKHRAFibBurdenControlServerInterface()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B95E00];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  v3 = [v1 setWithArray:v2];

  [v0 setClasses:v3 forSelector:sel_remote_injectBurdenValues_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t HKHRCardioFitnessStoreClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B8D1F0];
}

uint64_t HKHRCardioFitnessStoreServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B95ED0];
}

uint64_t HKHRBloodPressureDetailRoomBaseLink()
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "_hk_urlForBloodPressureType");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id HKHRHeartHealthBundle()
{
  v0 = (void *)HKHRHeartHealthBundle___ClassBundle;
  if (!HKHRHeartHealthBundle___ClassBundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v2 = (void *)HKHRHeartHealthBundle___ClassBundle;
    HKHRHeartHealthBundle___ClassBundle = v1;

    v0 = (void *)HKHRHeartHealthBundle___ClassBundle;
  }

  return v0;
}

id HKHeartRateLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = HKHRHeartHealthBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_1F3B84F70 table:@"HeartRateSettings"];

  return v3;
}

id HKHRAFibHistoryLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = HKHRHeartHealthBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return v3;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t HKHeartbeatSeriesFeatureStatusManagerClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B91630];
}

uint64_t HKHeartbeatSeriesFeatureStatusManagerServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B95FC0];
}

uint64_t HKHRAFibBurdenLocalFeatureAttributes()
{
  return [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"1" watchDeviceIdentifier:@"(01)00194252456804" phoneDeviceIdentifier:@"(01)00194252456798"];
}

uint64_t HKHRAFibBurdenOnboardingDeepLink()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://Heart.healthplugin/AFibBurdenOnboarding"];
}

uint64_t HKHRAFibBurdenDetailRoomBaseLink()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://Heart.healthplugin/AFibBurdenDetailRoom"];
}

double HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay()
{
  double v0 = 1800.0;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v2 = [v1 objectForKey:@"HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay"];

    if (v2)
    {
      v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      double v0 = (double)[v3 integerForKey:@"HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay"];
    }
  }
  return v0;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire()
{
  if (![MEMORY[0x1E4F2B860] isAppleInternalInstall]) {
    return 4;
  }
  double v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v1 = [v0 objectForKey:@"HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire"];

  if (!v1) {
    return 4;
  }
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:@"HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire"];

  return v3;
}

id HKHRAFibBurdenAnalysisPercentageOverride()
{
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        double v0 = objc_claimAutoreleasedReturnValue(),
        [v0 objectForKey:@"HKHRAFibBurdenAnalysisPercentageOverride"],
        id v1 = objc_claimAutoreleasedReturnValue(),
        v1,
        v0,
        v1))
  {
    id v2 = NSNumber;
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", @"HKHRAFibBurdenAnalysisPercentageOverride"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride()
{
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        double v0 = objc_claimAutoreleasedReturnValue(),
        [v0 objectForKey:@"HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride"],
        id v1 = objc_claimAutoreleasedReturnValue(),
        v1,
        v0,
        v1))
  {
    id v2 = NSNumber;
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", @"HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id _ParseArrayOfValuesFromStringWithExpectedCount(void *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if ([v3 hasPrefix:@"["]
    && [v3 hasSuffix:@"]"])
  {
    id v23 = v3;
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);
    v5 = [v4 componentsSeparatedByString:@","];

    id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = [v6 numberFromString:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 integerValue];
            BOOL v15 = v14 < 3;
            uint64_t v16 = 100;
            if (v14 < 100) {
              uint64_t v16 = v14;
            }
            if (v16 <= 2) {
              uint64_t v17 = 2;
            }
            else {
              uint64_t v17 = v16;
            }
            v18 = [HKHRAFibBurdenAnalysisResult alloc];
            v19 = [NSNumber numberWithDouble:(double)v17 / 100.0];
            v20 = [(HKHRAFibBurdenAnalysisResult *)v18 initWithBurdenPercentage:v19 burdenPercentageWasClampedToLowerBound:v15 unavailabilityReason:0];
            [v7 addObject:v20];
          }
          else
          {
            v19 = [[HKHRAFibBurdenAnalysisResult alloc] initWithBurdenPercentage:0 burdenPercentageWasClampedToLowerBound:0 unavailabilityReason:2];
            [v7 addObject:v19];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    if ([v7 count] == a2) {
      id v21 = v7;
    }
    else {
      id v21 = 0;
    }

    id v3 = v23;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

id _RetrieveAndParseArrayOfResultsForKeyWithExpectedCount(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKey:v3],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v7 = [v6 stringForKey:v3];

    uint64_t v8 = _ParseArrayOfValuesFromStringWithExpectedCount(v7, a2);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

HKHRAFibBurdenDayOfWeekHistogram *HKHRAFibBurdenDayOfWeekHistogramOverride()
{
  double v0 = _RetrieveAndParseArrayOfResultsForKeyWithExpectedCount(@"HKHRAFibBurdenDayOfWeekHistogramOverride", 7);
  if (v0)
  {
    id v1 = [HKHRAFibBurdenDayOfWeekHistogram alloc];
    id v2 = [v0 objectAtIndexedSubscript:6];
    id v3 = [v0 objectAtIndexedSubscript:0];
    uint64_t v4 = [v0 objectAtIndexedSubscript:1];
    v5 = [v0 objectAtIndexedSubscript:2];
    id v6 = [v0 objectAtIndexedSubscript:3];
    id v7 = [v0 objectAtIndexedSubscript:4];
    uint64_t v8 = [v0 objectAtIndexedSubscript:5];
    uint64_t v9 = [(HKHRAFibBurdenDayOfWeekHistogram *)v1 initWithSundayBurden:v2 mondayBurden:v3 tuesdayBurden:v4 wednesdayBurden:v5 thursdayBurden:v6 fridayBurden:v7 saturdayBurden:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

HKHRAFibBurdenTimeOfDayHistogram *HKHRAFibBurdenTimeOfDayHistogramOverride()
{
  double v0 = _RetrieveAndParseArrayOfResultsForKeyWithExpectedCount(@"HKHRAFibBurdenTimeOfDayHistogramOverride", 6);
  if (v0)
  {
    id v1 = [HKHRAFibBurdenTimeOfDayHistogram alloc];
    id v2 = [v0 objectAtIndexedSubscript:0];
    id v3 = [v0 objectAtIndexedSubscript:1];
    uint64_t v4 = [v0 objectAtIndexedSubscript:2];
    v5 = [v0 objectAtIndexedSubscript:3];
    id v6 = [v0 objectAtIndexedSubscript:4];
    id v7 = [v0 objectAtIndexedSubscript:5];
    uint64_t v8 = [(HKHRAFibBurdenTimeOfDayHistogram *)v1 initWithMidnightToFourAMBurden:v2 fourAMtoEightAMBurden:v3 eightAMToNoonBurden:v4 noonToFourPMBurden:v5 fourPMToEightPMBurden:v6 eightPMToMidnightBurden:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id HKHRAFibBurdenDefaultsOverrideKeys()
{
  v2[10] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HKHRAFibBurdenSevenDayAnalysisStartingWeekday";
  v2[1] = @"HKHRAFibBurdenSevenDayAnalysisStartingHour";
  v2[2] = @"HKHRAFibBurdenSevenDayAnalysisStartingMinute";
  v2[3] = @"HKHRAFibBurdenSevenDayAnalysisStartingSecond";
  v2[4] = @"HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay";
  v2[5] = @"HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire";
  v2[6] = @"HKHRAFibBurdenAnalysisPercentageOverride";
  v2[7] = @"HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride";
  v2[8] = @"HKHRAFibBurdenDayOfWeekHistogramOverride";
  v2[9] = @"HKHRAFibBurdenTimeOfDayHistogramOverride";
  double v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:10];

  return v0;
}

__CFString *NSStringFromHKHRAnalyticsAgeBin(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6D497C8[a1 - 1];
  }
}

uint64_t HKHRAnalyticsAgeBinFromAgeInYears(void *a1)
{
  unint64_t v2 = [a1 integerValue];
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  if (v2 >= 0x41) {
    uint64_t v5 = 4;
  }
  if (v2 >= 0x37) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x28) {
    uint64_t v3 = v4;
  }
  if ((uint64_t)v2 < 22) {
    uint64_t v3 = 0;
  }
  if (a1) {
    return v3;
  }
  else {
    return 0;
  }
}

id HKHRPrettyPrintedAFibBurdenSevenDayAnalysisBreadcrumbs(void *a1)
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"======== Seven Day Analysis Steps ========\n"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F2B5F8]) initWithColumnTitles:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  id v6 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v5 setTimeZone:v6];

  v47[0] = @"Alarm Fired";
  id v7 = [v2 alarmFiredDate];
  if (v7)
  {
    id v1 = [v2 alarmFiredDate];
    uint64_t v8 = [v5 stringFromDate:v1];
  }
  else
  {
    uint64_t v8 = @"(null)";
  }
  v47[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  [v4 appendRow:v9];

  if (v7)
  {
  }
  v46[0] = @"XPC Activity Fired";
  uint64_t v10 = [v2 xpcActivityFiredDate];
  if (v10)
  {
    id v1 = [v2 xpcActivityFiredDate];
    v11 = [v5 stringFromDate:v1];
  }
  else
  {
    v11 = @"(null)";
  }
  v46[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  [v4 appendRow:v12];

  if (v10)
  {
  }
  v45[0] = @"Maintenance Operation Run";
  v13 = [v2 maintenanceOperationRunDate];
  if (v13)
  {
    id v1 = [v2 maintenanceOperationRunDate];
    uint64_t v14 = [v5 stringFromDate:v1];
  }
  else
  {
    uint64_t v14 = @"(null)";
  }
  v45[1] = v14;
  BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v4 appendRow:v15];

  if (v13)
  {
  }
  v44[0] = @"Analysis Started";
  uint64_t v16 = [v2 analysisStartedDate];
  if (v16)
  {
    id v1 = [v2 analysisStartedDate];
    uint64_t v17 = [v5 stringFromDate:v1];
  }
  else
  {
    uint64_t v17 = @"(null)";
  }
  v44[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  [v4 appendRow:v18];

  if (v16)
  {
  }
  v43[0] = @"Tachograms Classified";
  v19 = [v2 tachogramsClassifiedDate];
  if (v19)
  {
    id v1 = [v2 tachogramsClassifiedDate];
    v20 = [v5 stringFromDate:v1];
  }
  else
  {
    v20 = @"(null)";
  }
  v43[1] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  [v4 appendRow:v21];

  if (v19)
  {
  }
  v42[0] = @"Analysis Ended";
  v22 = [v2 analysisEndedDate];
  if (v22)
  {
    id v1 = [v2 analysisEndedDate];
    id v23 = [v5 stringFromDate:v1];
  }
  else
  {
    id v23 = @"(null)";
  }
  v42[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  [v4 appendRow:v24];

  if (v22)
  {
  }
  v41[0] = @"Analysis Retry Later Requested";
  long long v25 = [v2 analysisRetryLaterRequestedDate];
  if (v25)
  {
    id v1 = [v2 analysisRetryLaterRequestedDate];
    long long v26 = [v5 stringFromDate:v1];
  }
  else
  {
    long long v26 = @"(null)";
  }
  v41[1] = v26;
  long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v4 appendRow:v27];

  if (v25)
  {
  }
  long long v28 = [v4 formattedTable];
  [v3 appendString:v28];

  [v3 appendFormat:@"\n======== Seven Day Analysis Results ========\n"];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F2B5F8]) initWithColumnTitles:0];
  v40[0] = @"Last Analysis Result Date";
  uint64_t v30 = [v2 lastAnalysisResultDate];
  if (v30)
  {
    long long v26 = [v2 lastAnalysisResultDate];
    v31 = [v5 stringFromDate:v26];
  }
  else
  {
    v31 = @"(null)";
  }
  v40[1] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  [v29 appendRow:v32];

  if (v30)
  {
  }
  v33 = objc_msgSend(v2, "lastAnalysisResultContext", @"Last Analysis Result Context");
  if (v33)
  {
    v34 = [v2 lastAnalysisResultContext];
  }
  else
  {
    v34 = @"(null)";
  }
  v39[1] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v29 appendRow:v35];

  if (v33) {
  v36 = [v29 formattedTable];
  }
  [v3 appendString:v36];

  v37 = (void *)[v3 copy];

  return v37;
}

uint64_t HKHRAFibBurdenPreviousWeekDayIndexRange(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_msgSend(v4, "hk_dayIndexWithCalendar:", v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setWeekday:2];
  id v7 = [v3 nextDateAfterDate:v4 matchingComponents:v6 options:260];

  uint64_t v8 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", v3);
  if (v8 + 7 <= v5)
  {
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v9 = [v3 nextDateAfterDate:v7 matchingComponents:v6 options:260];

    uint64_t v10 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v3);
    id v7 = v9;
  }

  return v10;
}

uint64_t HKHRAFibBurdenNotificationsEnabledWithFeatureStatus(void *a1)
{
  id v1 = a1;
  id v2 = [v1 onboardingRecord];
  id v3 = [v2 featureSettings];

  if (v3)
  {
    id v4 = [v1 onboardingRecord];
    uint64_t v5 = [v4 featureSettings];
    uint64_t v6 = HKHRAFibBurdenNotificationsEnabledWithFeatureSettings(v5);
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKHRAFibBurdenLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      HKHRAFibBurdenNotificationsEnabledWithFeatureStatus_cold_1(v7);
    }

    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t HKHRAFibBurdenNotificationsEnabledWithFeatureSettings(void *a1)
{
  id v1 = [a1 numberForKey:@"WeeklyNotificationEnabled"];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekday()
{
  double v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekdayWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekdayWithDefaults(void *a1)
{
  id v1 = a1;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && ([v1 objectForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingWeekday"],
        id v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    uint64_t v3 = [v1 integerForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingWeekday"];
  }
  else
  {
    uint64_t v3 = 2;
  }

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingHour()
{
  double v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingHourWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingHourWithDefaults(void *a1)
{
  id v1 = a1;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && ([v1 objectForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingHour"],
        id v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    uint64_t v3 = [v1 integerForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingHour"];
  }
  else
  {
    uint64_t v3 = 8;
  }

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinute()
{
  double v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinuteWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinuteWithDefaults(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingMinute"];

  if (v2)
  {
    uint64_t v3 = [v1 integerForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingMinute"];
  }
  else
  {
    uint64_t v3 = arc4random_uniform(0x3Cu);
    [v1 setInteger:v3 forKey:@"HKHRAFibBurdenSevenDayAnalysisStartingMinute"];
  }

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecond()
{
  double v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecondWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecondWithDefaults(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingSecond"];

  if (v2)
  {
    uint64_t v3 = [v1 integerForKey:@"HKHRAFibBurdenSevenDayAnalysisStartingSecond"];
  }
  else
  {
    uint64_t v3 = arc4random_uniform(0x3Cu);
    [v1 setInteger:v3 forKey:@"HKHRAFibBurdenSevenDayAnalysisStartingSecond"];
  }

  return v3;
}

id HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponents()
{
  double v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v1 = HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults(v0);

  return v1;
}

id HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [v3 setWeekday:HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekdayWithDefaults(v2)];
  [v3 setHour:HKHRAFibBurdenSevenDayAnalysisDetermineStartingHourWithDefaults(v2)];
  [v3 setMinute:HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinuteWithDefaults(v2)];
  uint64_t v4 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecondWithDefaults(v2);

  [v3 setSecond:v4];
  uint64_t v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v3 setCalendar:v5];

  return v3;
}

id HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped(void *a1, int a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = HKHRAFibBurdenLocalFeatureAttributes();
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v14[0] = *MEMORY[0x1E4F2BBB0];
  uint64_t v6 = [v4 updateVersion];
  v15[0] = v6;
  v14[1] = *MEMORY[0x1E4F2A090];
  id v7 = NSNumber;
  uint64_t v8 = [v4 featureVersion];
  uint64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  v15[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v11 = (void *)[v5 initWithDictionary:v10];

  if (v3)
  {
    v12 = [v3 name];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2A200]];
  }
  else
  {
    _HKInitializeLogging();
    v12 = HKHRAFibBurdenLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped_cold_1(v12);
    }
  }

  if (a2) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2A1B8]];
  }

  return v11;
}

void sub_1E0A8EAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1E0A8ED8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E0A8F004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E0A8F2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E0A8F580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E0A8F94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void HKHRSubmitNotificationsEnabledSignal()
{
  double v0 = BiomeLibrary();
  id v1 = [v0 Discoverability];
  id v4 = [v1 Signals];

  uint64_t v2 = [v4 source];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F4FE08]) initWithContentIdentifier:@"com.apple.health.HeartRate.notifications.enabled" context:0 osBuild:0 userInfo:0];
  [v2 sendEvent:v3];
}

uint64_t HKHRCardioFitnessFeatureStatusManagerClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B8F6C8];
}

uint64_t HKHRCardioFitnessFeatureStatusManagerServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B96168];
}

__CFString *HKHRAFibBurdenAnalyticsPropertyValueForVersion(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"1.0";
  }
  else
  {
    uint64_t v2 = (__CFString *)(id)*MEMORY[0x1E4F296C8];
  }
  return v2;
}

id HKHRAFibBurdenDetermineIsFocusModeOn()
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  double v0 = [MEMORY[0x1E4F504C8] userFocusComputedMode];
  uint64_t v1 = [v0 publisherFromStartTime:0.0];
  uint64_t v2 = [v1 last];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke;
  v7[3] = &unk_1E6D49B28;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_290;
  v6[3] = &unk_1E6D49B50;
  v6[4] = &v8;
  id v3 = (id)[v2 sinkWithCompletion:v7 receiveInput:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void sub_1E0A9059C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKHRAFibBurdenLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 error];
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1E0A83000, v4, OS_LOG_TYPE_DEFAULT, "[HKHRAFibBurdenDetermineIsFocusModeOn] User focus computed mode publisher finished with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    _HKInitializeLogging();
    uint64_t v6 = HKHRAFibBurdenLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1E0A83000, v6, OS_LOG_TYPE_DEFAULT, "[HKHRAFibBurdenDetermineIsFocusModeOn] No focus mode returned, possibly implying focus modes never used, sending off.", (uint8_t *)&v9, 2u);
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = MEMORY[0x1E4F1CC28];
  }
}

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_290(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];

  _HKInitializeLogging();
  id v5 = HKHRAFibBurdenLogForCategory(3);
  uint64_t v6 = v5;
  if (v4)
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v7)
    {
      uint64_t v8 = HKHRAFibBurdenLogForCategory(3);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_290_cold_2(v3, v8);
      }
    }
    int v9 = NSNumber;
    uint64_t v6 = [v3 eventBody];
    uint64_t v10 = objc_msgSend(v9, "numberWithBool:", -[NSObject isStarting](v6, "isStarting"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_290_cold_1(v3, v6);
  }
}

const char *HKHRAFibBurdenLogCategoryForCategory(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return "default";
  }
  else {
    return off_1E6D49B98[a1 - 1];
  }
}

id HKHRAFibBurdenLogForCategory(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v3 = [v2 showSensitiveLogItems];

  if (v3)
  {
    id v4 = (void **)MEMORY[0x1E4F29F48];
  }
  else
  {
    if (HKHRAFibBurdenLogForCategory_onceToken != -1) {
      dispatch_once(&HKHRAFibBurdenLogForCategory_onceToken, &__block_literal_global_3);
    }
    id v4 = (void **)((char *)&HKHRAFibBurdenLogForCategory_logObjects + 8 * a1);
  }
  id v5 = *v4;

  return v5;
}

void __HKHRAFibBurdenLogForCategory_block_invoke()
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v1 = "default";
    if ((unint64_t)(i - 1) <= 2) {
      uint64_t v1 = off_1E6D49BB8[i - 1];
    }
    os_log_t v2 = os_log_create((const char *)HKHRAFibBurdenLogSubsystem, v1);
    char v3 = (void *)HKHRAFibBurdenLogForCategory_logObjects[i];
    HKHRAFibBurdenLogForCategory_logObjects[i] = v2;
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1E0A946E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1E0A95B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E0A965F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

__CFString *NSStringFromHKHeartbeatSeriesFeature(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    os_log_t v2 = NSString;
    char v3 = [NSNumber numberWithInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"HKHeartbeatSeriesFeature: %@", v3];
  }
  else
  {
    uint64_t v1 = off_1E6D49FF8[a1 - 1];
  }

  return v1;
}

void sub_1E0A97990(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E0A98114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id OUTLINED_FUNCTION_0_3(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t _HKHRIsIrregularRhythmNotificationsRowHiddenInBridgeWithFeatureStatus(void *a1)
{
  id v1 = a1;
  int v2 = [v1 isOnboardingRecordPresent];
  char v3 = (void *)MEMORY[0x1E4F29BF8];
  if (!v2) {
    char v3 = (void *)MEMORY[0x1E4F29BD0];
  }
  uint64_t v4 = [v1 objectForKeyedSubscript:*v3];

  uint64_t v5 = [v4 areAllRequirementsSatisfied] ^ 1;
  return v5;
}

uint64_t _HKHRIsUserInteractionEnabledForIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus(void *a1)
{
  id v1 = a1;
  int v2 = [v1 isOnboardingRecordPresent];
  char v3 = (void *)MEMORY[0x1E4F29BF0];
  if (!v2) {
    char v3 = (void *)MEMORY[0x1E4F29BC8];
  }
  uint64_t v4 = [v1 objectForKeyedSubscript:*v3];

  uint64_t v5 = [v4 areAllRequirementsSatisfied];
  return v5;
}

uint64_t _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus(void *a1)
{
  id v1 = a1;
  if ([v1 isOnboardingRecordPresent])
  {
    int v2 = [v1 onboardingRecord];
    char v3 = [v2 featureSettings];
    uint64_t v4 = *MEMORY[0x1E4F29DE0];
    id v12 = 0;
    uint64_t v5 = [v3 numberForKey:v4 error:&v12];
    id v6 = v12;

    if (v5)
    {
      BOOL v7 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F29BF0]];
      int v8 = [v7 areAllRequirementsSatisfied];

      if (v8)
      {
        uint64_t v9 = [v5 BOOLValue];
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v10 = *MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus_cold_1((uint64_t)v6, v10);
      }
    }
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

id _HKHRIrregularRhythmNotificationsHeaderWithFeatureStatus(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
  int v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F29D08]];
  char v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = HKHeartRateLocalizedString(@"FEATURES_DISABLED_WRIST_DETECTION_MESSAGE");
  }

  return v4;
}

id _HKHRIrregularRhythmNotificationsBridgeFooterWithFeatureStatus(void *a1)
{
  id v1 = a1;
  int v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
  int v3 = [v1 isOnboardingRecordPresent];
  uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F29C88]];
  int v5 = [v4 BOOLValue];

  id v6 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F29CF8]];
  char v7 = [v6 BOOLValue];

  int v8 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F29C70]];
  int v9 = [v8 BOOLValue];

  uint64_t v10 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F29C68]];
  int v11 = [v10 BOOLValue];

  int v12 = v3 ^ 1;
  if ((v3 ^ 1) & 1) != 0 || (v7)
  {
    if ((v12 | v5))
    {
      if ((v12 | v9 & v11))
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F29BF0];
        if (!v3) {
          uint64_t v14 = (void *)MEMORY[0x1E4F29BC8];
        }
        BOOL v15 = [v1 objectForKeyedSubscript:*v14];
        uint64_t v16 = [v15 unsatisfiedRequirementIdentifiers];
        uint64_t v17 = [v16 count];

        v18 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F29CB0]];
        char v19 = [v18 BOOLValue];

        if (v17 != 1 || (v19 & 1) != 0)
        {
          uint64_t v13 = +[HKHRIrregularRhythmNotificationsBridgeFooter standardFooter];
        }
        else
        {
          uint64_t v13 = +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenAFibHistoryIsEnabled];
        }
      }
      else
      {
        uint64_t v13 = +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenUnavailableInOnboardedCountry];
      }
    }
    else
    {
      uint64_t v13 = +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenRemotelyDisabled];
    }
  }
  else
  {
    uint64_t v13 = +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenSeedHasExpired];
  }
  v20 = (void *)v13;

  return v20;
}

HKHRIrregularRhythmNotificationsBridgeSettings *HKHRIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _HKHRIsIrregularRhythmNotificationsRowHiddenInBridgeWithFeatureStatus(v1);
  uint64_t v3 = _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus(v1);
  uint64_t v4 = [v1 isOnboardingRecordPresent] ^ 1;
  uint64_t v5 = _HKHRIsUserInteractionEnabledForIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus(v1);
  id v6 = _HKHRIrregularRhythmNotificationsHeaderWithFeatureStatus(v1);
  char v7 = _HKHRIrregularRhythmNotificationsBridgeFooterWithFeatureStatus(v1);

  int v8 = [[HKHRIrregularRhythmNotificationsBridgeSettings alloc] initWithSettingHidden:v2 notificationsOn:v3 shouldLinkToOnboarding:v4 userInteractionEnabled:v5 headerText:v6 footer:v7];

  return v8;
}

id HKHRCardioFitnessAllowedCountrySet()
{
  double v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = [(id)GSSystemRootDirectory() stringByAppendingString:@"/System/Library/Health/AvailableRegions"];
  uint64_t v2 = [v0 fileURLWithPath:v1 isDirectory:1];

  uint64_t v3 = [v2 URLByAppendingPathComponent:*MEMORY[0x1E4F29D18]];

  uint64_t v4 = [v3 URLByAppendingPathExtension:@"plist"];

  uint64_t v5 = [MEMORY[0x1E4F2AE70] countrySetWithPlistURL:v4 error:0];

  return v5;
}

uint64_t HKHRCardioFitnessShouldSkipHardwareCheck()
{
  uint64_t result = [MEMORY[0x1E4F2B860] isAppleInternalInstall];
  if (result)
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"HKHRCardioFitnessShouldSkipHardwareCheck"];

    return v2;
  }
  return result;
}

uint64_t HKHRCardioFitnessShouldSkipLocationCheck()
{
  uint64_t result = [MEMORY[0x1E4F2B860] isAppleInternalInstall];
  if (result)
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"HKHRCardioFitnessShouldSkipLocationCheck"];

    return v2;
  }
  return result;
}

uint64_t HKHRCardioFitnessEventOnboardingDeepLink()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://Heart.healthplugin/CardioFitnessEventOnboarding"];
}

uint64_t HKHRCardioFitnessDetailRoomBaseLink()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://Heart.healthplugin/CardioFitnessDetailRoom"];
}

__CFString *HKHRCardioFitnessChartContextQueryName()
{
  return @"chartContext";
}

uint64_t HKHRCardioFitnessLocalFeatureAttributes()
{
  return [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"1"];
}

void HKHRAFibBurdenNotificationsEnabledWithFeatureStatus_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1E0A83000, log, OS_LOG_TYPE_FAULT, "[HKHRAFibBurdenNotificationsEnabled] No feature settings present in onboarding record.", v1, 2u);
}

void HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1E0A83000, log, OS_LOG_TYPE_FAULT, "[HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped()] Attempted to pull local time zone, but instead got nil, not adding to metadata.", v1, 2u);
}

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_290_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(a1, "error"));
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1E0A83000, a2, OS_LOG_TYPE_ERROR, "[HKHRAFibBurdenDetermineIsFocusModeOn] Received nil user focus computed mode with reason: %{public}@", (uint8_t *)&v4, 0xCu);
}

void __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_290_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 eventBody];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1E0A83000, a2, OS_LOG_TYPE_DEBUG, "[HKHRAFibBurdenDetermineIsFocusModeOn] Received event: %{public}@", (uint8_t *)&v4, 0xCu);
}

void _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "BOOL _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus(HKFeatureStatus * _Nonnull __strong)";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1E0A83000, a2, OS_LOG_TYPE_ERROR, "[%{public}s]: Prompted for IRN's 'enabled' state, but setting is missing or invalid; reporting 'off': %{public}@",
    (uint8_t *)&v2,
    0x16u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1F411CA28]();
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAgeAndMaximumAge()
{
  return MEMORY[0x1F40E7A48]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1F40E7BA0]();
}

uint64_t HKObjectForNanoPreferencesUserDefaultsKey()
{
  return MEMORY[0x1F40E7E88]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1F40E7F00]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1F40E81C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}