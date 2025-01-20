@interface HKHRElectrocardiogramRecordingFeatureAvailabilityRequirements
+ (id)_onboardingInitiationRequirementsForFeatureIdentifier:(id)a3;
+ (id)_onboardingPromotionRequirementsForFeatureIdentifier:(id)a3;
+ (id)_settingsUserInteractionEnabledForFeatureIdentifier:(id)a3;
+ (id)_settingsVisibilityRequirementsForFeatureIdentifier:(id)a3;
+ (id)_upgradeInitiation;
+ (id)_upgradePromotion;
+ (id)_usageRequirementsForFeatureIdentifier:(id)a3;
+ (id)requirementSet;
+ (id)requirementSetV2;
@end

@implementation HKHRElectrocardiogramRecordingFeatureAvailabilityRequirements

+ (id)_upgradeInitiation
{
  v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F29D30];
  v3 = [a1 _onboardingInitiationRequirementsForFeatureIdentifier:*MEMORY[0x1E4F29D30]];
  v4 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:*MEMORY[0x1E4F29D28]];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F2B030] onboardingRecordIsNotPresentForFeatureWithIdentifier:v2];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v2 isSupportedIfCountryListMissing:0];
  v11[2] = v6;
  v7 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v11[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v9 = [v3 arrayByAddingObjectsFromArray:v8];

  return v9;
}

+ (id)requirementSet
{
  v16[7] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F2B028]);
  v15[0] = *MEMORY[0x1E4F29BC0];
  v3 = objc_opt_class();
  uint64_t v4 = *MEMORY[0x1E4F29D20];
  v5 = [v3 _onboardingInitiationRequirementsForFeatureIdentifier:*MEMORY[0x1E4F29D20]];
  v16[0] = v5;
  v15[1] = *MEMORY[0x1E4F29BD8];
  v6 = [(id)objc_opt_class() _onboardingPromotionRequirementsForFeatureIdentifier:v4];
  v16[1] = v6;
  v15[2] = *MEMORY[0x1E4F29C20];
  v7 = [(id)objc_opt_class() _usageRequirementsForFeatureIdentifier:v4];
  v16[2] = v7;
  v15[3] = *MEMORY[0x1E4F29C18];
  v8 = [(id)objc_opt_class() _upgradePromotion];
  v16[3] = v8;
  v15[4] = *MEMORY[0x1E4F29C10];
  v9 = [(id)objc_opt_class() _upgradeInitiation];
  v16[4] = v9;
  v15[5] = *MEMORY[0x1E4F29BF8];
  v10 = [(id)objc_opt_class() _settingsVisibilityRequirementsForFeatureIdentifier:v4];
  v16[5] = v10;
  v15[6] = *MEMORY[0x1E4F29BF0];
  v11 = [(id)objc_opt_class() _settingsUserInteractionEnabledForFeatureIdentifier:v4];
  v16[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:7];
  v13 = (void *)[v2 initWithRequirementsByContext:v12];

  return v13;
}

+ (id)_usageRequirementsForFeatureIdentifier:(id)a3
{
  v18[11] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F2B030];
  id v4 = a3;
  v17 = [v3 seedIsNotExpiredForFeatureWithIdentifier:v4];
  v18[0] = v17;
  v16 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v18[1] = v16;
  v5 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v18[2] = v5;
  v6 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v4];
  v18[3] = v6;
  v7 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4];
  v18[4] = v7;
  v8 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:0];
  v18[5] = v8;
  v9 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];

  v18[6] = v9;
  v10 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v18[7] = v10;
  v11 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v18[8] = v11;
  v12 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v18[9] = v12;
  v13 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v18[10] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:11];

  return v14;
}

+ (id)_upgradePromotion
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F29D30];
  v3 = [a1 _onboardingPromotionRequirementsForFeatureIdentifier:*MEMORY[0x1E4F29D30]];
  id v4 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:*MEMORY[0x1E4F29D28]];
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F2B030] onboardingRecordIsNotPresentForFeatureWithIdentifier:v2];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = [v3 arrayByAddingObjectsFromArray:v6];

  return v7;
}

+ (id)_onboardingPromotionRequirementsForFeatureIdentifier:(id)a3
{
  v19[12] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F2B030];
  id v4 = a3;
  v18 = [v3 seedIsNotExpiredForFeatureWithIdentifier:v4];
  v19[0] = v18;
  v17 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v19[1] = v17;
  v16 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v19[2] = v16;
  v5 = [MEMORY[0x1E4F2B030] notInStoreDemoMode];
  v19[3] = v5;
  v6 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v4];
  v19[4] = v6;
  v7 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4];
  v19[5] = v7;
  v8 = [MEMORY[0x1E4F2B030] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:0];
  v19[6] = v8;
  v9 = [MEMORY[0x1E4F2B030] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];

  v19[7] = v9;
  v10 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v19[8] = v10;
  v11 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v19[9] = v11;
  v12 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v19[10] = v12;
  v13 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v19[11] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:12];

  return v14;
}

+ (id)_onboardingInitiationRequirementsForFeatureIdentifier:(id)a3
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F2B030];
  id v4 = a3;
  v5 = [v3 seedIsNotExpiredForFeatureWithIdentifier:v4];
  v15[0] = v5;
  v6 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v15[1] = v6;
  v7 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v15[2] = v7;
  v8 = [MEMORY[0x1E4F2B030] notInStoreDemoMode];
  v15[3] = v8;
  v9 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v4];
  v15[4] = v9;
  v10 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4];

  v15[5] = v10;
  v11 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v15[6] = v11;
  v12 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  void v15[7] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:8];

  return v13;
}

+ (id)_settingsVisibilityRequirementsForFeatureIdentifier:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F2B030];
  id v4 = a3;
  v5 = [v3 profileIsNotFamilySetupPairingProfile];
  v11[0] = v5;
  v6 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v4];
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4];

  v11[2] = v7;
  v8 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v11[3] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];

  return v9;
}

+ (id)_settingsUserInteractionEnabledForFeatureIdentifier:(id)a3
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F2B030];
  id v4 = a3;
  v5 = [v3 profileIsNotFamilySetupPairingProfile];
  v6 = objc_msgSend(MEMORY[0x1E4F2B030], "heartRateIsEnabledInPrivacy", v5);
  v12[1] = v6;
  v7 = [MEMORY[0x1E4F2B030] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v12[2] = v7;
  v8 = [MEMORY[0x1E4F2B030] seedIsNotExpiredForFeatureWithIdentifier:v4];

  v12[3] = v8;
  v9 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v12[4] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];

  return v10;
}

+ (id)requirementSetV2
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F29D30];
  id v3 = objc_alloc(MEMORY[0x1E4F2B028]);
  v17[0] = *MEMORY[0x1E4F29BC0];
  id v4 = [(id)objc_opt_class() _onboardingInitiationRequirementsForFeatureIdentifier:v2];
  v18[0] = v4;
  v17[1] = *MEMORY[0x1E4F29BD8];
  v5 = [(id)objc_opt_class() _onboardingPromotionRequirementsForFeatureIdentifier:v2];
  v18[1] = v5;
  v17[2] = *MEMORY[0x1E4F29C20];
  v6 = [(id)objc_opt_class() _usageRequirementsForFeatureIdentifier:v2];
  v18[2] = v6;
  v17[3] = *MEMORY[0x1E4F29B90];
  v7 = [MEMORY[0x1E4F2B030] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v2];
  v8 = objc_msgSend(MEMORY[0x1E4F2B030], "onboardingRecordIsPresentForFeatureWithIdentifier:", *MEMORY[0x1E4F29D28], v7);
  v16[1] = v8;
  v9 = (void *)MEMORY[0x1E4F2B030];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"253F2ED0-FFC6-4D36-A387-B6965C9E4682"];
  v11 = [v9 capabilityIsSupportedOnAnyWatch:v10 supportedOnLocalDevice:1];
  v16[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v18[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  v14 = (void *)[v3 initWithRequirementsByContext:v13];

  return v14;
}

@end