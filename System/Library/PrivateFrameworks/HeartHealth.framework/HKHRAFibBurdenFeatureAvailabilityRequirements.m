@interface HKHRAFibBurdenFeatureAvailabilityRequirements
+ (id)_analysis;
+ (id)_featureIdentifier;
+ (id)_highlightGeneration;
+ (id)_lifeFactorPlatterGeneration;
+ (id)_mutualExclusivityEnforcement;
+ (id)_onboardingInitiation;
+ (id)_pdfGeneration;
+ (id)_promotion;
+ (id)_requirementIdentifiersForRequirements:(id)a3;
+ (id)_tipsAppVisibility;
+ (id)_usage;
+ (id)analysisRequirementIdentifiers;
+ (id)highlightGenerationRequirementIdentifiers;
+ (id)lifeFactorPlatterGenerationRequirementIdentifiers;
+ (id)onboardingInitiationRequirementIdentifiers;
+ (id)pdfRequirementIdentifiers;
+ (id)promotionRequirementIdentifiers;
+ (id)requirementSet;
+ (id)tipsAppVisibilityRequirementIdentifiers;
+ (id)usageRequirementIdentifiers;
@end

@implementation HKHRAFibBurdenFeatureAvailabilityRequirements

+ (id)requirementSet
{
  v16[9] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F2B028]);
  v15[0] = *MEMORY[0x1E4F29BC0];
  v14 = [(id)objc_opt_class() _onboardingInitiation];
  v16[0] = v14;
  v15[1] = *MEMORY[0x1E4F29BD8];
  v3 = [(id)objc_opt_class() _promotion];
  v16[1] = v3;
  v15[2] = *MEMORY[0x1E4F29C08];
  v4 = [(id)objc_opt_class() _tipsAppVisibility];
  v16[2] = v4;
  v15[3] = *MEMORY[0x1E4F29C20];
  v5 = [(id)objc_opt_class() _usage];
  v16[3] = v5;
  v15[4] = @"AFibBurdenAnalysis";
  v6 = [(id)objc_opt_class() _analysis];
  v16[4] = v6;
  v15[5] = *MEMORY[0x1E4F29BA8];
  v7 = [(id)objc_opt_class() _highlightGeneration];
  v16[5] = v7;
  v15[6] = @"LifeFactorPlatterGeneration";
  v8 = [(id)objc_opt_class() _lifeFactorPlatterGeneration];
  v16[6] = v8;
  v15[7] = @"PDFGeneration";
  v9 = [(id)objc_opt_class() _pdfGeneration];
  v16[7] = v9;
  v15[8] = *MEMORY[0x1E4F29BB0];
  v10 = [(id)objc_opt_class() _mutualExclusivityEnforcement];
  v16[8] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:9];
  v12 = (void *)[v2 initWithRequirementsByContext:v11];

  return v12;
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

+ (id)tipsAppVisibilityRequirementIdentifiers
{
  v3 = [a1 _tipsAppVisibility];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)usageRequirementIdentifiers
{
  v3 = [a1 _usage];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)analysisRequirementIdentifiers
{
  v3 = [a1 _analysis];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)highlightGenerationRequirementIdentifiers
{
  v3 = [a1 _highlightGeneration];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)lifeFactorPlatterGenerationRequirementIdentifiers
{
  v3 = [a1 _lifeFactorPlatterGeneration];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)pdfRequirementIdentifiers
{
  v3 = [a1 _pdfGeneration];
  v4 = [a1 _requirementIdentifiersForRequirements:v3];

  return v4;
}

+ (id)_onboardingInitiation
{
  v12[6] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F2B030] profileIsNotFamilySetupPairingProfile];
  v12[0] = v2;
  v3 = [MEMORY[0x1E4F2B030] notInStoreDemoMode];
  v12[1] = v3;
  v4 = (void *)MEMORY[0x1E4F2B030];
  v5 = [(id)objc_opt_class() _featureIdentifier];
  v6 = [v4 capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v5];
  v12[2] = v6;
  v7 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v12[3] = v7;
  v8 = [MEMORY[0x1E4F2B030] healthAppIsNotHidden];
  v12[4] = v8;
  v9 = [MEMORY[0x1E4F2B030] localDeviceIsCapableOfWatchPairing];
  v12[5] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];

  return v10;
}

+ (id)_promotion
{
  v21[7] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _onboardingInitiation];
  v3 = (void *)[v2 mutableCopy];

  v4 = (void *)MEMORY[0x1E4F2B030];
  v20 = [(id)objc_opt_class() _featureIdentifier];
  v19 = [v4 seedIsNotExpiredForFeatureWithIdentifier:v20];
  v21[0] = v19;
  v5 = (void *)MEMORY[0x1E4F2B030];
  v18 = [(id)objc_opt_class() _featureIdentifier];
  v6 = [v5 featureIsNotRemotelyDisabledWithIdentifier:v18];
  v21[1] = v6;
  v7 = (void *)MEMORY[0x1E4F2B030];
  v8 = [(id)objc_opt_class() _featureIdentifier];
  v9 = [v7 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v8 isSupportedIfCountryListMissing:0];
  v21[2] = v9;
  v10 = (void *)MEMORY[0x1E4F2B030];
  v11 = [(id)objc_opt_class() _featureIdentifier];
  v12 = [v10 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v11];
  v21[3] = v12;
  v13 = [MEMORY[0x1E4F2B030] wristDetectionIsEnabledForActiveWatch];
  v21[4] = v13;
  v14 = [MEMORY[0x1E4F2B030] heartRateIsEnabledInPrivacy];
  v21[5] = v14;
  v15 = [MEMORY[0x1E4F2B030] mutuallyExclusiveFeatureIsOffWithIdentifier:*MEMORY[0x1E4F29D60]];
  v21[6] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:7];
  [v3 addObjectsFromArray:v16];

  return v3;
}

+ (id)_tipsAppVisibility
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _onboardingInitiation];
  v3 = (void *)[v2 mutableCopy];

  v4 = (void *)MEMORY[0x1E4F2B030];
  v5 = [(id)objc_opt_class() _featureIdentifier];
  v6 = [v4 seedIsNotExpiredForFeatureWithIdentifier:v5];
  v18[0] = v6;
  v7 = (void *)MEMORY[0x1E4F2B030];
  v8 = [(id)objc_opt_class() _featureIdentifier];
  v9 = [v7 featureIsNotRemotelyDisabledWithIdentifier:v8];
  v18[1] = v9;
  v10 = (void *)MEMORY[0x1E4F2B030];
  v11 = [(id)objc_opt_class() _featureIdentifier];
  v12 = [v10 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v11 isSupportedIfCountryListMissing:0];
  v18[2] = v12;
  v13 = (void *)MEMORY[0x1E4F2B030];
  v14 = [(id)objc_opt_class() _featureIdentifier];
  v15 = [v13 countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  [v3 addObjectsFromArray:v16];

  return v3;
}

+ (id)_usage
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _promotion];
  v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_6);
  v4 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F29EB8]];
  v16[0] = v4;
  v5 = (void *)MEMORY[0x1E4F2B030];
  v6 = [(id)objc_opt_class() _featureIdentifier];
  v7 = [v5 countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v6 isSupportedIfCountryListMissing:1];
  v16[1] = v7;
  v8 = (void *)MEMORY[0x1E4F2B030];
  v9 = [(id)objc_opt_class() _featureIdentifier];
  v10 = [v8 onboardingRecordIsPresentForFeatureWithIdentifier:v9];
  v16[2] = v10;
  v11 = (void *)MEMORY[0x1E4F2B030];
  v12 = [(id)objc_opt_class() _featureIdentifier];
  v13 = [v11 featureIsOnWithIdentifier:v12 isOnIfSettingIsAbsent:0];
  v16[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  [v3 addObjectsFromArray:v14];

  return v3;
}

uint64_t __55__HKHRAFibBurdenFeatureAvailabilityRequirements__usage__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() requirementIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F29CB8]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [(id)objc_opt_class() requirementIdentifier];
    uint64_t v4 = [v5 isEqualToString:*MEMORY[0x1E4F29C68]];
  }
  return v4;
}

+ (id)_analysis
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _usage];
  v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_291);
  uint64_t v4 = [MEMORY[0x1E4F2B030] localDeviceIsCapableOfPairingWithWatch];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 addObjectsFromArray:v5];

  return v3;
}

uint64_t __58__HKHRAFibBurdenFeatureAvailabilityRequirements__analysis__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() requirementIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F29C58]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [(id)objc_opt_class() requirementIdentifier];
    if ([v5 isEqualToString:*MEMORY[0x1E4F29C68]])
    {
      uint64_t v4 = 1;
    }
    else
    {
      v6 = [(id)objc_opt_class() requirementIdentifier];
      uint64_t v4 = [v6 isEqualToString:*MEMORY[0x1E4F29CB0]];
    }
  }

  return v4;
}

+ (id)_highlightGeneration
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _analysis];
  v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_293);
  uint64_t v4 = [MEMORY[0x1E4F2B030] onboardedAtLeastDaysAgo:42 featureIdentifier:*MEMORY[0x1E4F29D10]];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 addObjectsFromArray:v5];

  return v3;
}

uint64_t __69__HKHRAFibBurdenFeatureAvailabilityRequirements__highlightGeneration__block_invoke()
{
  v0 = [(id)objc_opt_class() requirementIdentifier];
  uint64_t v1 = [v0 isEqualToString:*MEMORY[0x1E4F29CC0]];

  return v1;
}

+ (id)_lifeFactorPlatterGeneration
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

+ (id)_pdfGeneration
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F2B030];
  v3 = [(id)objc_opt_class() _featureIdentifier];
  uint64_t v4 = [v2 onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F2B030] localDeviceIsCapableOfPairingWithWatch];
  v8[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

+ (id)_mutualExclusivityEnforcement
{
  id v2 = [(id)objc_opt_class() _usage];
  v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "hk_removeObjectsPassingTest:", &__block_literal_global_295);

  return v3;
}

uint64_t __78__HKHRAFibBurdenFeatureAvailabilityRequirements__mutualExclusivityEnforcement__block_invoke()
{
  v0 = [(id)objc_opt_class() requirementIdentifier];
  uint64_t v1 = [v0 isEqualToString:*MEMORY[0x1E4F29CB0]];

  return v1;
}

+ (id)_featureIdentifier
{
  return (id)*MEMORY[0x1E4F29D10];
}

+ (id)_requirementIdentifiersForRequirements:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_298);
}

uint64_t __88__HKHRAFibBurdenFeatureAvailabilityRequirements__requirementIdentifiersForRequirements___block_invoke()
{
  v0 = objc_opt_class();

  return [v0 requirementIdentifier];
}

@end