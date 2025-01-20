@interface HKMobilityWalkingSteadinessFeatureAvailabilityRequirements
+ (id)_advertisableFeature;
+ (id)_backgroundDelivery;
+ (id)_classification;
+ (id)_eventSubmission;
+ (id)_featureIdentifier;
+ (id)_notInPregnancyMode;
+ (id)_notOnboardedHealthChecklist;
+ (id)_notificationSettingsVisibility;
+ (id)_onboardedHealthChecklist;
+ (id)_onboardingInitiation;
+ (id)_pregnancyAdjustmentEligibility;
+ (id)_promotion;
+ (id)_promotionFeatureTag;
+ (id)_requirementIdentifiersForRequirements:(id)a3;
+ (id)backgroundDeliveryIdentifiers;
+ (id)classificationGeneration;
+ (id)eventSubmission;
+ (id)notInPregnancyModeRequirementIdentifiers;
+ (id)notificationSettingsVisibility;
+ (id)onboardingInitiationRequirementIdentifiers;
+ (id)promotionFeatureTagRequirementIdentifiers;
+ (id)promotionRequirementIdentifiers;
+ (id)requirementSet;
@end

@implementation HKMobilityWalkingSteadinessFeatureAvailabilityRequirements

+ (id)requirementSet
{
  v23[13] = *MEMORY[0x1E4F143B8];
  id v17 = objc_alloc(MEMORY[0x1E4F2B028]);
  v22[0] = *MEMORY[0x1E4F29B90];
  v20 = [(id)objc_opt_class() _backgroundDelivery];
  v23[0] = v20;
  v22[1] = *MEMORY[0x1E4F29BC0];
  v19 = [(id)objc_opt_class() _onboardingInitiation];
  v23[1] = v19;
  v22[2] = *MEMORY[0x1E4F29BD8];
  v18 = [(id)objc_opt_class() _promotion];
  v23[2] = v18;
  v22[3] = *MEMORY[0x1E4F29B88];
  v16 = [(id)objc_opt_class() _advertisableFeature];
  v23[3] = v16;
  v22[4] = *MEMORY[0x1E4F29BB8];
  v15 = [MEMORY[0x1E4F2B030] isNotInPostPregnancy];
  v21[0] = v15;
  v14 = [MEMORY[0x1E4F2B030] noOngoingPregnancy];
  v21[1] = v14;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v23[4] = v13;
  v22[5] = *MEMORY[0x1E4F29BE8];
  v2 = [(id)objc_opt_class() _pregnancyAdjustmentEligibility];
  v23[5] = v2;
  v22[6] = @"WalkingSteadinessEventSubmission";
  v3 = [(id)objc_opt_class() _eventSubmission];
  v23[6] = v3;
  v22[7] = @"WalkingSteadinessNotificationSettingsVisibility";
  v4 = [(id)objc_opt_class() _notificationSettingsVisibility];
  v23[7] = v4;
  v22[8] = @"WalkingSteadinessClassification";
  v5 = [(id)objc_opt_class() _classification];
  v23[8] = v5;
  v22[9] = @"WalkingSteadinessOnboardedHealthChecklist";
  v6 = [(id)objc_opt_class() _onboardedHealthChecklist];
  v23[9] = v6;
  v22[10] = @"WalkingSteadinessNotOnboardedHealthChecklist";
  v7 = [(id)objc_opt_class() _notOnboardedHealthChecklist];
  v23[10] = v7;
  v22[11] = @"WalkingSteadinessPromotionFeatureTag";
  v8 = [(id)objc_opt_class() _promotionFeatureTag];
  v23[11] = v8;
  v22[12] = @"WalkingSteadinessShouldNotShowPregnancyContent";
  v9 = [(id)objc_opt_class() _notInPregnancyMode];
  v23[12] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:13];
  v11 = (void *)[v17 initWithRequirementsByContext:v10];

  return v11;
}

+ (id)backgroundDeliveryIdentifiers
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

+ (id)eventSubmission
{
  v3 = [a1 _eventSubmission];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)notificationSettingsVisibility
{
  v3 = [a1 _notificationSettingsVisibility];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)classificationGeneration
{
  v3 = [a1 _classification];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)promotionFeatureTagRequirementIdentifiers
{
  v3 = [a1 _promotionFeatureTag];
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
  v19[7] = *MEMORY[0x1E4F143B8];
  v18 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v19[0] = v18;
  id v17 = [MEMORY[0x1E4F2B030] walkingSteadinessCapabilityIsSupportedOnLocalDevice];
  v19[1] = v17;
  v2 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v19[2] = v2;
  v3 = (void *)MEMORY[0x1E4F2B030];
  v4 = [(id)objc_opt_class() _featureIdentifier];
  v5 = [v3 onboardingRecordIsPresentForFeatureWithIdentifier:v4];
  v19[3] = v5;
  v6 = (void *)MEMORY[0x1E4F2B030];
  v7 = [(id)objc_opt_class() _featureIdentifier];
  v8 = [v6 countryCodeIsPresentForFeatureWithIdentifier:v7];
  v19[4] = v8;
  v9 = (void *)MEMORY[0x1E4F2B030];
  v10 = [(id)objc_opt_class() _featureIdentifier];
  v11 = [v9 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v10];
  v19[5] = v11;
  v12 = (void *)MEMORY[0x1E4F2B030];
  v13 = [(id)objc_opt_class() _featureIdentifier];
  v14 = [v12 onboardingNotAcknowledgedWithIdentifier:v13];
  v19[6] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:7];

  return v15;
}

+ (id)_promotion
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _onboardingInitiation];
  v3 = (void *)[v2 mutableCopy];

  v4 = [MEMORY[0x1E4F2B030] fitnessTrackingIsEnabledInPrivacy];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCD8]];
  v8[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [v3 addObjectsFromArray:v6];

  return v3;
}

+ (id)_promotionFeatureTag
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F2B030] heightIsPresent];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)_eventSubmission
{
  v25[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F2B030];
  v24 = [(id)objc_opt_class() _featureIdentifier];
  v23 = [v2 onboardingRecordIsPresentForFeatureWithIdentifier:v24];
  v25[0] = v23;
  v3 = (void *)MEMORY[0x1E4F2B030];
  v22 = [(id)objc_opt_class() _featureIdentifier];
  v21 = [v3 onboardingAcknowledgedWithIdentifier:v22];
  v25[1] = v21;
  v4 = (void *)MEMORY[0x1E4F2B030];
  v20 = [(id)objc_opt_class() _featureIdentifier];
  v19 = [v4 featureIsOnWithIdentifier:v20 isOnIfSettingIsAbsent:0];
  v25[2] = v19;
  v5 = (void *)MEMORY[0x1E4F2B030];
  v18 = [(id)objc_opt_class() _featureIdentifier];
  v6 = [v5 countryCodeIsPresentForFeatureWithIdentifier:v18];
  v25[3] = v6;
  v7 = (void *)MEMORY[0x1E4F2B030];
  v8 = [(id)objc_opt_class() _featureIdentifier];
  v9 = [v7 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v8];
  v25[4] = v9;
  v10 = [MEMORY[0x1E4F2B030] walkingSteadinessCapabilityIsSupportedOnLocalDevice];
  v25[5] = v10;
  v11 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v25[6] = v11;
  v12 = [MEMORY[0x1E4F2B030] heightIsPresent];
  v25[7] = v12;
  v13 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCD8]];
  v25[8] = v13;
  v14 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v25[9] = v14;
  v15 = [MEMORY[0x1E4F2B030] fitnessTrackingIsEnabledInPrivacy];
  v25[10] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:11];

  return v16;
}

+ (id)_advertisableFeature
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _onboardingInitiation];
  v3 = (void *)[v2 mutableCopy];

  v4 = [MEMORY[0x1E4F2B030] fitnessTrackingIsEnabledInPrivacy];
  v14[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 addObjectsFromArray:v5];

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_1);
  v6 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F2B030] heightIsPresent];
  v13[1] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 featureIsOffWithIdentifier:v9 isOffIfSettingIsAbsent:1];
  v13[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v3 addObjectsFromArray:v11];

  return v3;
}

uint64_t __82__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__advertisableFeature__block_invoke(uint64_t a1, void *a2)
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

+ (id)_notificationSettingsVisibility
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _eventSubmission];
  v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_303);
  uint64_t v4 = [MEMORY[0x1E4F2B030] notificationAuthorizedWithBundleIdentifier:*MEMORY[0x1E4F2BDC0]];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 addObjectsFromArray:v5];

  return v3;
}

uint64_t __93__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__notificationSettingsVisibility__block_invoke()
{
  v0 = [(id)objc_opt_class() requirementIdentifier];
  uint64_t v1 = [v0 isEqualToString:*MEMORY[0x1E4F29C90]];

  return v1;
}

+ (id)_onboardedHealthChecklist
{
  v26[12] = *MEMORY[0x1E4F143B8];
  v25 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v26[0] = v25;
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v24 = [(id)objc_opt_class() _featureIdentifier];
  v23 = [v2 onboardingRecordIsPresentForFeatureWithIdentifier:v24];
  v26[1] = v23;
  v3 = (void *)MEMORY[0x1E4F2B030];
  v22 = [(id)objc_opt_class() _featureIdentifier];
  v21 = [v3 countryCodeIsPresentForFeatureWithIdentifier:v22];
  v26[2] = v21;
  uint64_t v4 = (void *)MEMORY[0x1E4F2B030];
  v20 = [(id)objc_opt_class() _featureIdentifier];
  v19 = [v4 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v20];
  v26[3] = v19;
  v18 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCD8]];
  v26[4] = v18;
  v5 = [MEMORY[0x1E4F2B030] walkingSteadinessCapabilityIsSupportedOnLocalDevice];
  v26[5] = v5;
  v6 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v26[6] = v6;
  v7 = [MEMORY[0x1E4F2B030] notificationAuthorizedWithBundleIdentifier:*MEMORY[0x1E4F2BDC0]];
  v26[7] = v7;
  v8 = [MEMORY[0x1E4F2B030] fitnessTrackingIsEnabledInPrivacy];
  v26[8] = v8;
  v9 = [MEMORY[0x1E4F2B030] heightIsPresent];
  v26[9] = v9;
  v10 = (void *)MEMORY[0x1E4F2B030];
  v11 = [(id)objc_opt_class() _featureIdentifier];
  v12 = [v10 onboardingAcknowledgedWithIdentifier:v11];
  v26[10] = v12;
  v13 = (void *)MEMORY[0x1E4F2B030];
  v14 = [(id)objc_opt_class() _featureIdentifier];
  v15 = [v13 featureIsOnWithIdentifier:v14 isOnIfSettingIsAbsent:0];
  v26[11] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:12];

  return v16;
}

+ (id)_notOnboardedHealthChecklist
{
  v17[7] = *MEMORY[0x1E4F143B8];
  v16 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v17[0] = v16;
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v17[1] = v4;
  v5 = (void *)MEMORY[0x1E4F2B030];
  v6 = [(id)objc_opt_class() _featureIdentifier];
  v7 = [v5 countryCodeIsPresentForFeatureWithIdentifier:v6];
  v17[2] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v9];
  v17[3] = v10;
  v11 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCD8]];
  v17[4] = v11;
  v12 = [MEMORY[0x1E4F2B030] walkingSteadinessCapabilityIsSupportedOnLocalDevice];
  v17[5] = v12;
  v13 = [MEMORY[0x1E4F2B030] fitnessTrackingIsEnabledInPrivacy];
  v17[6] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:7];

  return v14;
}

+ (id)_classification
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v5 = (void *)MEMORY[0x1E4F2B030];
  v6 = objc_msgSend((id)objc_opt_class(), "_featureIdentifier", v4);
  v7 = [v5 countryCodeIsPresentForFeatureWithIdentifier:v6];
  v15[1] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v9];
  v15[2] = v10;
  v11 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCD8]];
  v15[3] = v11;
  v12 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v15[4] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];

  return v13;
}

+ (id)_featureIdentifier
{
  return (id)*MEMORY[0x1E4F29DD8];
}

+ (id)_requirementIdentifiersForRequirements:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_306);
}

uint64_t __101__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__requirementIdentifiersForRequirements___block_invoke()
{
  v0 = objc_opt_class();

  return [v0 requirementIdentifier];
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
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _onboardingInitiation];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = [MEMORY[0x1E4F2B030] fitnessTrackingIsEnabledInPrivacy];
  v15[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v3 addObjectsFromArray:v5];

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_308);
  v6 = [MEMORY[0x1E4F2B030] ageIsPresent];
  v7 = objc_msgSend(MEMORY[0x1E4F2B030], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E4F2BCD8], v6);
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F2B030] heightIsPresent];
  void v14[2] = v8;
  v9 = (void *)MEMORY[0x1E4F2B030];
  v10 = [(id)objc_opt_class() _featureIdentifier];
  v11 = [v9 featureIsOffWithIdentifier:v10 isOffIfSettingIsAbsent:1];
  v14[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  [v3 addObjectsFromArray:v12];

  return v3;
}

uint64_t __93__HKMobilityWalkingSteadinessFeatureAvailabilityRequirements__pregnancyAdjustmentEligibility__block_invoke(uint64_t a1, void *a2)
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

@end