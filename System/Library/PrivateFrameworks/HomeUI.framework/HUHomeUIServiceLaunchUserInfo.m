@interface HUHomeUIServiceLaunchUserInfo
+ (BOOL)isInSetupContext:(int64_t)a3;
+ (id)launchReasonDescription:(int64_t)a3;
+ (id)userInfoForLockAccessFirmwareUpgradeSetupInHome:(id)a3;
+ (id)userInfoForLockAccessPinCodeSetupInHome:(id)a3;
+ (id)userInfoForLockAccessWalletKeySetupInHome:(id)a3;
+ (id)userInfoForResumeAccessorySetupInHome:(id)a3 accessoryUUIDs:(id)a4;
+ (id)userInfoForSafetyAndSecurityInHome:(id)a3;
+ (id)userInfoForSiriEndpointInHome:(id)a3;
+ (id)userInfoForUpgradeOfferResults:(id)a3;
+ (int64_t)launchReasonFromUserInfo:(id)a3;
@end

@implementation HUHomeUIServiceLaunchUserInfo

+ (BOOL)isInSetupContext:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (id)userInfoForResumeAccessorySetupInHome:(id)a3 accessoryUUIDs:(id)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v11[0] = HUHomeUIServiceLaunchReasonValueResumeSetup;
  v10[0] = HUHomeUIServiceLaunchReasonKey;
  v10[1] = HUHomeUIServiceLaunchHomeUUIDString;
  id v5 = a4;
  v6 = [a3 uniqueIdentifier];
  v7 = [v6 UUIDString];
  v10[2] = HUHomeUIServiceLaunchAccessoryUUIDsArray;
  v11[1] = v7;
  v11[2] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

+ (id)userInfoForSafetyAndSecurityInHome:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueSafetyAndSecurity;
  v3 = [a3 uniqueIdentifier];
  v4 = [v3 UUIDString];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)userInfoForSiriEndpointInHome:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueSiriEndpoint;
  v3 = [a3 uniqueIdentifier];
  v4 = [v3 UUIDString];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)userInfoForLockAccessFirmwareUpgradeSetupInHome:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueLockAccessFirmwareUpdate;
  v3 = [a3 uniqueIdentifier];
  v4 = [v3 UUIDString];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)userInfoForLockAccessWalletKeySetupInHome:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingAll;
  v3 = [a3 uniqueIdentifier];
  v4 = [v3 UUIDString];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)userInfoForLockAccessPinCodeSetupInHome:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingPinCodeOnly;
  v3 = [a3 uniqueIdentifier];
  v4 = [v3 UUIDString];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)userInfoForUpgradeOfferResults:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = HUHomeUIServiceLaunchReasonKey;
  v6[0] = HUHomeUIServiceLaunchReasonValueCameraUpgradeOffer;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)launchReasonFromUserInfo:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:HUHomeUIServiceLaunchReasonKey];
  if ([v3 isEqualToString:HUHomeUIServiceLaunchReasonValueResumeSetup])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:HUHomeUIServiceLaunchReasonValueSafetyAndSecurity])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:HUHomeUIServiceLaunchReasonValueSiriEndpoint])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:HUHomeUIServiceLaunchReasonValueLockAccessFirmwareUpdate])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingAll])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingPinCodeOnly])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:HUHomeUIServiceLaunchReasonValueCameraUpgradeOffer])
  {
    int64_t v4 = 7;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)launchReasonDescription:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueAddAccessory;
      goto LABEL_11;
    case 1:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueResumeSetup;
      goto LABEL_11;
    case 2:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueSafetyAndSecurity;
      goto LABEL_11;
    case 3:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueSiriEndpoint;
      goto LABEL_11;
    case 4:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueLockAccessFirmwareUpdate;
      goto LABEL_11;
    case 5:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingAll;
      goto LABEL_11;
    case 6:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingPinCodeOnly;
      goto LABEL_11;
    case 7:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueCameraUpgradeOffer;
LABEL_11:
      int64_t v4 = v3;
      break;
    case 8:
      int64_t v4 = @"HUHomeUIServiceLaunchReasonValueMax";
      break;
    default:
      int64_t v4 = 0;
      break;
  }

  return v4;
}

@end