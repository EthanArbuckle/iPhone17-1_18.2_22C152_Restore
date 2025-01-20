@interface HKHRCardioFitnessFeatureAvailabilityRequirements
+ (id)_advertiseableFeature;
+ (id)_backgroundDelivery;
+ (id)_bridgeNotificationsEnablement;
+ (id)_bridgeNotificationsFooter;
+ (id)_bridgeOnboardingEnablement;
+ (id)_bridgeOnboardingVisibility;
+ (id)_bridgeSettingsVisibility;
+ (id)_classification;
+ (id)_featureIdentifier;
+ (id)_healthChecklistSettingsFooter;
+ (id)_nanoSettingsEnablement;
+ (id)_nanoSettingsVisibility;
+ (id)_notInPregnancyMode;
+ (id)_notOnboardedHealthChecklist;
+ (id)_notificationGeneration;
+ (id)_onboardedHealthChecklist;
+ (id)_onboardingInitiation;
+ (id)_postPregnancyAdjustmentEligibility;
+ (id)_pregnancyAdjustmentEligibility;
+ (id)_promotion;
+ (id)_requirementIdentifiersForRequirements:(id)a3;
+ (id)_usage;
+ (id)backgroundDelivery;
+ (id)bridgeNotificationsEnablementRequirementIdentifiers;
+ (id)bridgeNotificationsFooterRequirementIdentifiers;
+ (id)bridgeOnboardingEnablementRequirementIdentifiers;
+ (id)bridgeOnboardingVisibilityRequirementIdentifiers;
+ (id)bridgeSettingsVisibilityRequirementIdentifiers;
+ (id)classificationGeneration;
+ (id)healthChecklistSettingsFooter;
+ (id)nanoSettingsEnablementRequirementIdentifiers;
+ (id)nanoSettingsVisibilityRequirementIdentifiers;
+ (id)notInPregnancyModeRequirementIdentifiers;
+ (id)notificationGeneration;
+ (id)onboardingInitiationRequirementIdentifiers;
+ (id)promotionRequirementIdentifiers;
+ (id)requirementSet;
+ (id)usageRequirementIdentifiers;
@end

@implementation HKHRCardioFitnessFeatureAvailabilityRequirements

+ (id)requirementSet
{
  v27[20] = *MEMORY[0x1E4F143B8];
  id v20 = objc_alloc(MEMORY[0x1E4F2B028]);
  v26[0] = *MEMORY[0x1E4F29B90];
  v25 = [(id)objc_opt_class() _backgroundDelivery];
  v27[0] = v25;
  v26[1] = *MEMORY[0x1E4F29BC0];
  v24 = [(id)objc_opt_class() _onboardingInitiation];
  v27[1] = v24;
  v26[2] = *MEMORY[0x1E4F29BD8];
  v23 = [(id)objc_opt_class() _promotion];
  v27[2] = v23;
  v26[3] = *MEMORY[0x1E4F29B88];
  v22 = [(id)objc_opt_class() _advertiseableFeature];
  v27[3] = v22;
  v26[4] = *MEMORY[0x1E4F29C20];
  v21 = [(id)objc_opt_class() _usage];
  v27[4] = v21;
  v26[5] = *MEMORY[0x1E4F29BB8];
  v19 = [(id)objc_opt_class() _notInPregnancyMode];
  v27[5] = v19;
  v26[6] = *MEMORY[0x1E4F29BE8];
  v18 = [(id)objc_opt_class() _pregnancyAdjustmentEligibility];
  v27[6] = v18;
  v26[7] = *MEMORY[0x1E4F29BE0];
  v17 = [(id)objc_opt_class() _postPregnancyAdjustmentEligibility];
  v27[7] = v17;
  v26[8] = @"CardioFitnessNotification";
  v16 = [(id)objc_opt_class() _notificationGeneration];
  v27[8] = v16;
  v26[9] = @"CardioFitnessClassification";
  v15 = [(id)objc_opt_class() _classification];
  v27[9] = v15;
  v26[10] = @"CardioFitnessHealthChecklistSettingsFooter";
  v14 = [(id)objc_opt_class() _healthChecklistSettingsFooter];
  v27[10] = v14;
  v26[11] = @"CardioFitnessBridgeSettingsVisibility";
  v13 = [(id)objc_opt_class() _bridgeSettingsVisibility];
  v27[11] = v13;
  v26[12] = @"CardioFitnessBridgeOnboardingVisibility";
  v2 = [(id)objc_opt_class() _bridgeOnboardingVisibility];
  v27[12] = v2;
  v26[13] = @"CardioFitnessBridgeOnboardingEnablement";
  v3 = [(id)objc_opt_class() _bridgeOnboardingEnablement];
  v27[13] = v3;
  v26[14] = @"CardioFitnessBridgeNotificationsEnablement";
  v4 = [(id)objc_opt_class() _bridgeNotificationsEnablement];
  v27[14] = v4;
  v26[15] = @"CardioFitnessBridgeNotificationsFooter";
  v5 = [(id)objc_opt_class() _bridgeNotificationsFooter];
  v27[15] = v5;
  v26[16] = @"CardioFitnessNanoSettingsVisibility";
  v6 = [(id)objc_opt_class() _nanoSettingsVisibility];
  v27[16] = v6;
  v26[17] = @"CardioFitnessNanoSettingsEnablement";
  v7 = [(id)objc_opt_class() _nanoSettingsEnablement];
  v27[17] = v7;
  v26[18] = @"CardioFitnessOnboardedHealthChecklist";
  v8 = [(id)objc_opt_class() _onboardedHealthChecklist];
  v27[18] = v8;
  v26[19] = @"CardioFitnessNotOnboardedHealthChecklist";
  v9 = [(id)objc_opt_class() _notOnboardedHealthChecklist];
  v27[19] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:20];
  v11 = (void *)[v20 initWithRequirementsByContext:v10];

  return v11;
}

+ (id)backgroundDelivery
{
  v3 = [a1 _backgroundDelivery];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)onboardingInitiationRequirementIdentifiers
{
  v3 = [a1 _onboardingInitiation];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)promotionRequirementIdentifiers
{
  v3 = [a1 _promotion];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)usageRequirementIdentifiers
{
  v3 = [a1 _usage];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)notificationGeneration
{
  v3 = [a1 _notificationGeneration];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)classificationGeneration
{
  v3 = [a1 _classification];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)healthChecklistSettingsFooter
{
  v3 = [a1 _healthChecklistSettingsFooter];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)bridgeSettingsVisibilityRequirementIdentifiers
{
  v3 = [a1 _bridgeSettingsVisibility];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)bridgeOnboardingVisibilityRequirementIdentifiers
{
  v3 = [a1 _bridgeOnboardingVisibility];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)bridgeOnboardingEnablementRequirementIdentifiers
{
  v3 = [a1 _bridgeOnboardingEnablement];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)bridgeNotificationsEnablementRequirementIdentifiers
{
  v3 = [a1 _bridgeNotificationsEnablement];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)bridgeNotificationsFooterRequirementIdentifiers
{
  v3 = [a1 _bridgeNotificationsFooter];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)nanoSettingsVisibilityRequirementIdentifiers
{
  v3 = [a1 _nanoSettingsVisibility];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)nanoSettingsEnablementRequirementIdentifiers
{
  v3 = [a1 _nanoSettingsEnablement];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)notInPregnancyModeRequirementIdentifiers
{
  v3 = [a1 _notInPregnancyMode];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)_backgroundDelivery
{
  v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  v4 = [v2 defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v3];

  return v4;
}

+ (id)_onboardingInitiation
{
  v24[10] = *MEMORY[0x1E4F143B8];
  v23 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v24[0] = v23;
  v22 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EA8]];
  v24[1] = v22;
  v2 = (void *)MEMORY[0x1E4F2B030];
  v21 = [(id)objc_opt_class() _featureIdentifier];
  id v20 = [v2 capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v21 supportedOnLocalDevice:1];
  v24[2] = v20;
  v19 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v24[3] = v19;
  v18 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v24[4] = v18;
  v3 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v24[5] = v3;
  v4 = (void *)MEMORY[0x1E4F2B030];
  v5 = [(id)objc_opt_class() _featureIdentifier];
  v6 = [v4 onboardingRecordIsPresentForFeatureWithIdentifier:v5];
  v24[6] = v6;
  v7 = (void *)MEMORY[0x1E4F2B030];
  v8 = [(id)objc_opt_class() _featureIdentifier];
  v9 = [v7 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v8];
  v24[7] = v9;
  v10 = (void *)MEMORY[0x1E4F2B030];
  v11 = [(id)objc_opt_class() _featureIdentifier];
  v12 = [v10 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v11 isSupportedIfCountryListMissing:1];
  v24[8] = v12;
  v13 = (void *)MEMORY[0x1E4F2B030];
  v14 = [(id)objc_opt_class() _featureIdentifier];
  v15 = [v13 onboardingNotAcknowledgedWithIdentifier:v14 settingsKey:@"CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"];
  v24[9] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:10];

  return v16;
}

+ (id)_promotion
{
  v3 = [(id)objc_opt_class() _onboardingInitiation];
  v4 = (void *)[v3 mutableCopy];

  v5 = [a1 _notInPregnancyMode];
  [v4 addObjectsFromArray:v5];

  return v4;
}

+ (id)_advertiseableFeature
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() _onboardingInitiation];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "hk_removeObjectsPassingTest:", &__block_literal_global_1);
  v5 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E4F2B030];
  v7 = [(id)objc_opt_class() _featureIdentifier];
  v8 = [v6 featureIsOffWithIdentifier:v7 isOffIfSettingIsAbsent:1];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v4 addObjectsFromArray:v9];

  v10 = [a1 _notInPregnancyMode];
  [v4 addObjectsFromArray:v10];

  return v4;
}

uint64_t __73__HKHRCardioFitnessFeatureAvailabilityRequirements__advertiseableFeature__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() requirementIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F29CD8]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [(id)objc_opt_class() requirementIdentifier];
    uint64_t v4 = [v5 isEqualToString:*MEMORY[0x1E4F29CE0]];
  }
  return v4;
}

+ (id)_usage
{
  v27[11] = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v27[0] = v26;
  v25 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v27[1] = v25;
  v24 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCA8]];
  v27[2] = v24;
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v23 = [(id)objc_opt_class() _featureIdentifier];
  v22 = [v2 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v23];
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E4F2B030];
  v21 = [(id)objc_opt_class() _featureIdentifier];
  id v20 = [v3 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v21 isSupportedIfCountryListMissing:1];
  v27[4] = v20;
  uint64_t v4 = (void *)MEMORY[0x1E4F2B030];
  v19 = [(id)objc_opt_class() _featureIdentifier];
  v5 = [v4 capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v19 supportedOnLocalDevice:1];
  v27[5] = v5;
  v6 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v27[6] = v6;
  v7 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 onboardingRecordIsPresentForFeatureWithIdentifier:v9];
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E4F2B030];
  v12 = [(id)objc_opt_class() _featureIdentifier];
  v13 = [v11 onboardingAcknowledgedWithIdentifier:v12 settingsKey:@"CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"];
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E4F2B030];
  v15 = [(id)objc_opt_class() _featureIdentifier];
  v16 = [v14 featureIsOnWithIdentifier:v15 isOnIfSettingIsAbsent:1];
  v27[10] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:11];

  return v17;
}

+ (id)_notificationGeneration
{
  id v2 = [(id)objc_opt_class() _usage];
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

+ (id)_classification
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v12[0] = v4;
  v5 = (void *)MEMORY[0x1E4F2B030];
  v6 = [(id)objc_opt_class() _featureIdentifier];
  v7 = [v5 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v6];
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EA8]];
  void v12[3] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];

  return v10;
}

+ (id)_healthChecklistSettingsFooter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _usage];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 addObjectsFromArray:v5];

  return v3;
}

+ (id)_bridgeSettingsVisibility
{
  void v12[5] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _featureIdentifier];
  v3 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:v2];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F2B030], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E4F2BCB0], v3);
  v12[1] = v4;
  v5 = (void *)MEMORY[0x1E4F2B030];
  v6 = [(id)objc_opt_class() _featureIdentifier];
  v7 = [v5 capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v6 supportedOnLocalDevice:1];
  v12[2] = v7;
  v8 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  void v12[3] = v8;
  v9 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v12[4] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];

  return v10;
}

+ (id)_bridgeOnboardingVisibility
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 onboardingNotAcknowledgedWithIdentifier:v3 settingsKey:@"CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

+ (id)_bridgeOnboardingEnablement
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v5 = (void *)MEMORY[0x1E4F2B030];
  v6 = objc_msgSend((id)objc_opt_class(), "_featureIdentifier", v4);
  v7 = [v5 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v6 isSupportedIfCountryListMissing:1];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v11[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  return v9;
}

+ (id)_bridgeNotificationsEnablement
{
  v13[5] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EA8]];
  v3 = objc_msgSend(MEMORY[0x1E4F2B030], "ageIsPresent", v2);
  v13[1] = v3;
  uint64_t v4 = (void *)MEMORY[0x1E4F2B030];
  v5 = [(id)objc_opt_class() _featureIdentifier];
  v6 = [v4 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v5];
  v13[2] = v6;
  v7 = (void *)MEMORY[0x1E4F2B030];
  v8 = [(id)objc_opt_class() _featureIdentifier];
  v9 = [v7 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v8 isSupportedIfCountryListMissing:1];
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v13[4] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];

  return v11;
}

+ (id)_bridgeNotificationsFooter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _bridgeNotificationsEnablement];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 addObjectsFromArray:v5];

  return v3;
}

+ (id)_nanoSettingsVisibility
{
  id v2 = [(id)objc_opt_class() _notificationGeneration];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = (void *)MEMORY[0x1E4F2B030];
  v5 = [(id)objc_opt_class() _featureIdentifier];
  v6 = [v4 featureIsOnWithIdentifier:v5 isOnIfSettingIsAbsent:1];
  [v3 removeObject:v6];

  v7 = [MEMORY[0x1E4F2B030] ageIsPresent];
  [v3 removeObject:v7];

  v8 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EA8]];
  [v3 removeObject:v8];

  v9 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCB0]];
  [v3 addObject:v9];

  return v3;
}

+ (id)_nanoSettingsEnablement
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EA8]];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)_onboardedHealthChecklist
{
  v27[11] = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v27[0] = v26;
  v25 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v27[1] = v25;
  v24 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCA8]];
  v27[2] = v24;
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v23 = [(id)objc_opt_class() _featureIdentifier];
  v22 = [v2 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v23];
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E4F2B030];
  v21 = [(id)objc_opt_class() _featureIdentifier];
  id v20 = [v3 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v21 isSupportedIfCountryListMissing:1];
  v27[4] = v20;
  uint64_t v4 = (void *)MEMORY[0x1E4F2B030];
  v19 = [(id)objc_opt_class() _featureIdentifier];
  v5 = [v4 capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v19 supportedOnLocalDevice:1];
  v27[5] = v5;
  v6 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v27[6] = v6;
  v7 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 onboardingRecordIsPresentForFeatureWithIdentifier:v9];
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E4F2B030];
  v12 = [(id)objc_opt_class() _featureIdentifier];
  v13 = [v11 onboardingAcknowledgedWithIdentifier:v12 settingsKey:@"CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"];
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E4F2B030];
  v15 = [(id)objc_opt_class() _featureIdentifier];
  v16 = [v14 featureIsOnWithIdentifier:v15 isOnIfSettingIsAbsent:1];
  v27[10] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:11];

  return v17;
}

+ (id)_notOnboardedHealthChecklist
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v19 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v20[0] = v19;
  v18 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v20[1] = v18;
  v17 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCA8]];
  v20[2] = v17;
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v20[3] = v4;
  v5 = (void *)MEMORY[0x1E4F2B030];
  v6 = [(id)objc_opt_class() _featureIdentifier];
  v7 = [v5 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v6 isSupportedIfCountryListMissing:1];
  v20[4] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v9 supportedOnLocalDevice:1];
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v20[6] = v11;
  v12 = (void *)MEMORY[0x1E4F2B030];
  v13 = [(id)objc_opt_class() _featureIdentifier];
  v14 = [v12 onboardingRecordIsPresentForFeatureWithIdentifier:v13];
  v20[7] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:8];

  return v15;
}

+ (id)_notInPregnancyMode
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F2B030] isNotInPostPregnancy];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F2B030] noOngoingPregnancy];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)_pregnancyAdjustmentEligibility
{
  v27[11] = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v27[0] = v26;
  v25 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v27[1] = v25;
  v24 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCA8]];
  v27[2] = v24;
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v23 = [(id)objc_opt_class() _featureIdentifier];
  v22 = [v2 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v23];
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E4F2B030];
  v21 = [(id)objc_opt_class() _featureIdentifier];
  id v20 = [v3 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v21 isSupportedIfCountryListMissing:1];
  v27[4] = v20;
  uint64_t v4 = (void *)MEMORY[0x1E4F2B030];
  v19 = [(id)objc_opt_class() _featureIdentifier];
  v5 = [v4 capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v19 supportedOnLocalDevice:1];
  v27[5] = v5;
  v6 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v27[6] = v6;
  v7 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 onboardingRecordIsPresentForFeatureWithIdentifier:v9];
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E4F2B030];
  v12 = [(id)objc_opt_class() _featureIdentifier];
  v13 = [v11 onboardingAcknowledgedWithIdentifier:v12 settingsKey:@"CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"];
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E4F2B030];
  v15 = [(id)objc_opt_class() _featureIdentifier];
  v16 = [v14 featureIsOnWithIdentifier:v15 isOnIfSettingIsAbsent:1];
  v27[10] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:11];

  return v17;
}

+ (id)_postPregnancyAdjustmentEligibility
{
  v27[11] = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v27[0] = v26;
  v25 = [MEMORY[0x1E4F2B030] watchAppIsInstalledForBundleIdentifier:@"com.apple.HeartRate"];
  v27[1] = v25;
  v24 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCA8]];
  v27[2] = v24;
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v23 = [(id)objc_opt_class() _featureIdentifier];
  v22 = [v2 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v23];
  v27[3] = v22;
  v3 = (void *)MEMORY[0x1E4F2B030];
  v21 = [(id)objc_opt_class() _featureIdentifier];
  id v20 = [v3 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v21 isSupportedIfCountryListMissing:1];
  v27[4] = v20;
  uint64_t v4 = (void *)MEMORY[0x1E4F2B030];
  v19 = [(id)objc_opt_class() _featureIdentifier];
  v5 = [v4 capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v19 supportedOnLocalDevice:1];
  v27[5] = v5;
  v6 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v27[6] = v6;
  v7 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v27[7] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 onboardingRecordIsPresentForFeatureWithIdentifier:v9];
  v27[8] = v10;
  v11 = (void *)MEMORY[0x1E4F2B030];
  v12 = [(id)objc_opt_class() _featureIdentifier];
  v13 = [v11 onboardingAcknowledgedWithIdentifier:v12 settingsKey:@"CardioFitnessFeatureSettingsKeyNotificationDetailsEntered"];
  v27[9] = v13;
  v14 = (void *)MEMORY[0x1E4F2B030];
  v15 = [(id)objc_opt_class() _featureIdentifier];
  v16 = [v14 featureIsOffWithIdentifier:v15 isOffIfSettingIsAbsent:1];
  v27[10] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:11];

  return v17;
}

+ (id)_featureIdentifier
{
  return (id)*MEMORY[0x1E4F29D18];
}

+ (id)_requirementIdentifiersForRequirements:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_325);
}

uint64_t __91__HKHRCardioFitnessFeatureAvailabilityRequirements__requirementIdentifiersForRequirements___block_invoke()
{
  v0 = objc_opt_class();

  return [v0 requirementIdentifier];
}

@end