@interface HKFeatureAvailabilityRequirements
+ (id)activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:(id)a3;
+ (id)activeWatchIsNotUnderInternalDevelopmentImportExclusionForFeatureWithIdentifier:(id)a3;
+ (id)ageIsPresent;
+ (id)bloodOxygenRecordingsAreEnabled;
+ (id)capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3;
+ (id)capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:(id)a3 supportedOnLocalDevice:(BOOL)a4;
+ (id)capabilityIsSupportedOnAnyWatch:(id)a3 supportedOnLocalDevice:(BOOL)a4;
+ (id)countryCodeIsPresentForFeatureWithIdentifier:(id)a3;
+ (id)countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4;
+ (id)countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4;
+ (id)countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:(id)a3;
+ (id)countryIsSupportedOnWatchForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4;
+ (id)currentCountryCodeIsPresentForFeatureWithIdentifier:(id)a3;
+ (id)currentCountryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4;
+ (id)currentCountryIsSupportedOnLocalDeviceForFeatureWithIdentifier:(id)a3;
+ (id)defaultHelpTileRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:(id)a3 isAgeGatedUserDefaultsKey:(id)a4;
+ (id)defaultOnboardingEligibilityRequirementsForFeatureIdentifier:(id)a3;
+ (id)defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:(id)a3 isAgeGatedUserDefaultsKey:(id)a4;
+ (id)featureFlagIsEnabled:(BOOL)a3;
+ (id)featureIsNotRemotelyDisabledWithIdentifier:(id)a3;
+ (id)featureIsOffWithIdentifier:(id)a3 isOffIfSettingIsAbsent:(BOOL)a4;
+ (id)featureIsOffWithIdentifier:(id)a3 settingsKey:(id)a4 isOffIfSettingIsAbsent:(BOOL)a5;
+ (id)featureIsOnWithIdentifier:(id)a3 isOnIfSettingIsAbsent:(BOOL)a4;
+ (id)featureIsOnWithIdentifier:(id)a3 settingsKey:(id)a4 isOnIfSettingIsAbsent:(BOOL)a5;
+ (id)fitnessTrackingIsEnabledInPrivacy;
+ (id)healthAppIsNotHidden;
+ (id)hearingAidCapabilityIsSupportedOnAnyPairedAirPods;
+ (id)hearingTestCapabilityIsSupportedOnAnyPairedAirPods;
+ (id)heartRateIsEnabledInPrivacy;
+ (id)heightIsPresent;
+ (id)isNotInPostPregnancy;
+ (id)localDeviceIsCapableOfPairingWithWatch;
+ (id)localDeviceIsCapableOfWatchPairing;
+ (id)mutuallyExclusiveFeatureIsOffWithIdentifier:(id)a3;
+ (id)noOngoingPregnancy;
+ (id)notAgeGatedForUserDefaultsKey:(id)a3;
+ (id)notInStoreDemoMode;
+ (id)notificationAuthorizedWithBundleIdentifier:(id)a3;
+ (id)notificationsOnForUserDefaultsKey:(id)a3;
+ (id)onboardedAtLeastDaysAgo:(int64_t)a3 featureIdentifier:(id)a4;
+ (id)onboardingAcknowledgedWithIdentifier:(id)a3;
+ (id)onboardingAcknowledgedWithIdentifier:(id)a3 settingsKey:(id)a4;
+ (id)onboardingNotAcknowledgedWithIdentifier:(id)a3;
+ (id)onboardingNotAcknowledgedWithIdentifier:(id)a3 settingsKey:(id)a4;
+ (id)onboardingRecordIsNotPresentForFeatureWithIdentifier:(id)a3;
+ (id)onboardingRecordIsNotPresentForMutuallyExclusiveFeatureWithIdentifier:(id)a3;
+ (id)onboardingRecordIsPresentForFeatureWithIdentifier:(id)a3;
+ (id)onboardingRecordsArePresentForPrerequisiteFeaturesWithIdentifiers:(id)a3;
+ (id)onboardingUserDefaultsKeyIsNotPresent:(id)a3;
+ (id)onboardingUserDefaultsKeyIsPresent:(id)a3;
+ (id)prerequisiteFeaturesAreOnWithFeatureSettings:(id)a3;
+ (id)profileIsNotFamilySetupPairingProfile;
+ (id)seedIsNotExpiredForFeatureWithIdentifier:(id)a3;
+ (id)someRegionIsSupportedForFeatureWithIdentifier:(id)a3;
+ (id)userDefaultsKeyIsNotPresent:(id)a3;
+ (id)walkingSteadinessCapabilityIsSupportedOnLocalDevice;
+ (id)watchAppIsInstalledForBundleIdentifier:(id)a3;
+ (id)watchLowPowerModeIsOff;
+ (id)wristDetectionIsEnabledForActiveWatch;
@end

@implementation HKFeatureAvailabilityRequirements

+ (id)activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)activeWatchIsNotUnderInternalDevelopmentImportExclusionForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[HKFeatureAvailabilityRequirementActiveWatchIsNotUnderInternalDevelopmentImportExclusion alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)ageIsPresent
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementAgeIsPresent);

  return v2;
}

+ (id)bloodOxygenRecordingsAreEnabled
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled);

  return v2;
}

+ (id)capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch alloc] initWithFeatureIdentifier:v5 supportedOnLocalDevice:v4];

  return v6;
}

+ (id)capabilityIsSupportedOnAnyWatch:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch alloc] initWithNanoRegistryCapability:v5 supportedOnLocalDevice:v4];

  return v6;
}

+ (id)countryCodeIsPresentForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementCountryCodeIsPresent alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [(_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice *)[HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice alloc] initWithFeatureIdentifier:v5 isSupportedIfCountryListMissing:v4];

  return v6;
}

+ (id)countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)currentCountryCodeIsPresentForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementCurrentCountryCodeIsPresent alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)currentCountryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [(_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice *)[HKFeatureAvailabilityRequirementCurrentCountryIsSupportedOnActiveRemoteDevice alloc] initWithFeatureIdentifier:v5 isSupportedIfCountryListMissing:v4];

  return v6;
}

+ (id)currentCountryIsSupportedOnLocalDeviceForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementCurrentCountryIsSupportedOnLocalDevice alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)featureFlagIsEnabled:(BOOL)a3
{
  id v3 = [(HKFeatureAvailabilityMustBeTrueRequirement *)[HKFeatureAvailabilityRequirementFeatureFlagIsEnabled alloc] initWithWhatMustBeTrue:a3];

  return v3;
}

+ (id)featureIsNotRemotelyDisabledWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementFeatureIsNotRemotelyDisabled alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)featureIsOffWithIdentifier:(id)a3 isOffIfSettingIsAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[HKFeatureAvailabilityRequirementFeatureIsOff alloc] initWithFeatureIdentifier:v5 isOffWhenSettingIsAbsent:v4];

  return v6;
}

+ (id)featureIsOffWithIdentifier:(id)a3 settingsKey:(id)a4 isOffIfSettingIsAbsent:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[HKFeatureAvailabilityRequirementFeatureIsOff alloc] initWithFeatureIdentifier:v8 settingsOffKey:v7 isOffWhenSettingIsAbsent:v5];

  return v9;
}

+ (id)featureIsOnWithIdentifier:(id)a3 isOnIfSettingIsAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[HKFeatureAvailabilityRequirementFeatureIsOn alloc] initWithFeatureIdentifier:v5 isOnWhenSettingIsAbsent:v4];

  return v6;
}

+ (id)featureIsOnWithIdentifier:(id)a3 settingsKey:(id)a4 isOnIfSettingIsAbsent:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[HKFeatureAvailabilityRequirementFeatureIsOn alloc] initWithFeatureIdentifier:v8 settingsOnKey:v7 isOnWhenSettingIsAbsent:v5];

  return v9;
}

+ (id)fitnessTrackingIsEnabledInPrivacy
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementFitnessTrackingIsEnabledInPrivacy);

  return v2;
}

+ (id)healthAppIsNotHidden
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementHealthAppIsNotHidden);

  return v2;
}

+ (id)hearingTestCapabilityIsSupportedOnAnyPairedAirPods
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementHearingTestCapabilityIsSupportedOnAnyPairedAirPods);

  return v2;
}

+ (id)hearingAidCapabilityIsSupportedOnAnyPairedAirPods
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementHearingAidCapabilityIsSupportedOnAnyPairedAirPods);

  return v2;
}

+ (id)heartRateIsEnabledInPrivacy
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy);

  return v2;
}

+ (id)heightIsPresent
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementHeightIsPresent);

  return v2;
}

+ (id)localDeviceIsCapableOfPairingWithWatch
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch);

  return v2;
}

+ (id)localDeviceIsCapableOfWatchPairing
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing);

  return v2;
}

+ (id)mutuallyExclusiveFeatureIsOffWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)notAgeGatedForUserDefaultsKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey alloc] initWithUserDefaultsKey:v3];

  return v4;
}

+ (id)notInStoreDemoMode
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementNotInStoreDemoMode);

  return v2;
}

+ (id)notificationAuthorizedWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementNotificationAuthorized alloc] initWithBundleIdentifier:v3];

  return v4;
}

+ (id)notificationsOnForUserDefaultsKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)[HKFeatureAvailabilityRequirementNotificationsOnForUserDefaultsKey alloc] initWithUserDefaultsKey:v3];

  return v4;
}

+ (id)onboardedAtLeastDaysAgo:(int64_t)a3 featureIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [[HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo alloc] initWithFeatureIdentifier:v5 daysBeforeCurrentDate:a3];

  return v6;
}

+ (id)onboardingAcknowledgedWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementOnboardingAcknowledged alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)onboardingAcknowledgedWithIdentifier:(id)a3 settingsKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HKFeatureAvailabilityRequirementOnboardingAcknowledged alloc] initWithFeatureIdentifier:v6 settingsKey:v5];

  return v7;
}

+ (id)onboardingNotAcknowledgedWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementOnboardingNotAcknowledged alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)onboardingNotAcknowledgedWithIdentifier:(id)a3 settingsKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HKFeatureAvailabilityRequirementOnboardingNotAcknowledged alloc] initWithFeatureIdentifier:v6 settingsKey:v5];

  return v7;
}

+ (id)onboardingRecordsArePresentForPrerequisiteFeaturesWithIdentifiers:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementOnboardingRecordsArePresentForPrerequisiteFeatures alloc] initWithPrerequisiteFeatureIdentifiers:v3];

  return v4;
}

+ (id)onboardingRecordIsNotPresentForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)[HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresent alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)onboardingRecordIsNotPresentForMutuallyExclusiveFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)[HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)onboardingRecordIsPresentForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)[HKFeatureAvailabilityRequirementOnboardingRecordIsPresent alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)onboardingUserDefaultsKeyIsNotPresent:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)[HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsNotPresent alloc] initWithUserDefaultsKey:v3];

  return v4;
}

+ (id)onboardingUserDefaultsKeyIsPresent:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)[HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsPresent alloc] initWithUserDefaultsKey:v3];

  return v4;
}

+ (id)prerequisiteFeaturesAreOnWithFeatureSettings:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementPrerequisiteFeaturesAreOn alloc] initWithPrerequisiteFeatureSettings:v3];

  return v4;
}

+ (id)profileIsNotFamilySetupPairingProfile
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementProfileIsNotFamilySetupPairingProfile);

  return v2;
}

+ (id)seedIsNotExpiredForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)[HKFeatureAvailabilityRequirementSeedIsNotExpired alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)someRegionIsSupportedForFeatureWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityRegionAvailabilityRequirement *)[HKFeatureAvailabilityRequirementSomeRegionIsSupported alloc] initWithFeatureIdentifier:v3];

  return v4;
}

+ (id)userDefaultsKeyIsNotPresent:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)[HKFeatureAvailabilityRequirementUserDefaultsKeyIsNotPresent alloc] initWithUserDefaultsKey:v3];

  return v4;
}

+ (id)walkingSteadinessCapabilityIsSupportedOnLocalDevice
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice);

  return v2;
}

+ (id)watchAppIsInstalledForBundleIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HKFeatureAvailabilityRequirementWatchAppIsInstalled alloc] initWithBundleIdentifier:v3];

  return v4;
}

+ (id)watchLowPowerModeIsOff
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff);

  return v2;
}

+ (id)wristDetectionIsEnabledForActiveWatch
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch);

  return v2;
}

+ (id)isNotInPostPregnancy
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementNotInPostPregnancy);

  return v2;
}

+ (id)noOngoingPregnancy
{
  v2 = objc_alloc_init(HKFeatureAvailabilityRequirementNoOngoingPregnancy);

  return v2;
}

+ (id)countryIsSupportedOnWatchForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[_HKBehavior sharedBehavior];
  int v7 = [v6 isAppleWatch];

  if (v7) {
    +[HKFeatureAvailabilityRequirements countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v5];
  }
  else {
  id v8 = +[HKFeatureAvailabilityRequirements countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v5 isSupportedIfCountryListMissing:v4];
  }

  return v8;
}

+ (id)countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[HKFeatureAvailabilityRequirements countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v5];
  v13[0] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  id v8 = +[_HKBehavior sharedBehavior];
  int v9 = [v8 isAppleWatch];

  if (v9)
  {
    v10 = +[HKFeatureAvailabilityRequirements countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v5 isSupportedIfCountryListMissing:v4];
    id v11 = [v7 arrayByAddingObject:v10];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

+ (id)defaultOnboardingEligibilityRequirementsForFeatureIdentifier:(id)a3
{
  v14[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 currentCountryCodeIsPresentForFeatureWithIdentifier:v4];
  id v6 = objc_msgSend(a1, "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v4, v5);
  v14[1] = v6;
  int v7 = [a1 capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4];
  v14[2] = v7;
  id v8 = [a1 currentCountryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];
  v14[3] = v8;
  int v9 = [a1 currentCountryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:0];
  v14[4] = v9;
  v10 = [a1 featureIsNotRemotelyDisabledWithIdentifier:v4];
  v14[5] = v10;
  id v11 = [a1 seedIsNotExpiredForFeatureWithIdentifier:v4];

  v14[6] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:7];

  return v12;
}

+ (id)defaultHelpTileRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:(id)a3 isAgeGatedUserDefaultsKey:(id)a4
{
  id v6 = a3;
  int v7 = [a1 defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:v6 isAgeGatedUserDefaultsKey:a4];
  id v8 = +[HKFeatureAvailabilityRequirements featureIsOnWithIdentifier:v6 isOnIfSettingIsAbsent:1];

  int v9 = [v7 arrayByAddingObject:v8];

  return v9;
}

+ (id)defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:(id)a3 isAgeGatedUserDefaultsKey:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  int v7 = +[HKFeatureAvailabilityRequirements onboardingRecordIsPresentForFeatureWithIdentifier:v6];
  v17[0] = v7;
  id v8 = +[HKFeatureAvailabilityRequirements featureIsNotRemotelyDisabledWithIdentifier:v6];
  v17[1] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v10 = +[HKFeatureAvailabilityRequirements countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:v6 isSupportedIfCountryListMissing:1];

  id v11 = [v9 arrayByAddingObjectsFromArray:v10];
  v12 = +[HKFeatureAvailabilityRequirements notAgeGatedForUserDefaultsKey:v5];

  v16 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v14 = [v11 arrayByAddingObjectsFromArray:v13];

  return v14;
}

@end