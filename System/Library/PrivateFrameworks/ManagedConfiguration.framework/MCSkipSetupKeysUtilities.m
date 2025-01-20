@interface MCSkipSetupKeysUtilities
+ (id)allSkipKeys;
@end

@implementation MCSkipSetupKeysUtilities

+ (id)allSkipKeys
{
  if (allSkipKeys_onceToken != -1) {
    dispatch_once(&allSkipKeys_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)allSkipKeys_allSkipKeys;

  return v2;
}

void __39__MCSkipSetupKeysUtilities_allSkipKeys__block_invoke()
{
  v2[43] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AppStore";
  v2[1] = @"SIMSetup";
  v2[2] = @"ScreenTime";
  v2[3] = @"AccessibilityAppearance";
  v2[4] = @"Android";
  v2[5] = @"Appearance";
  v2[6] = @"AppleID";
  v2[7] = @"N/A";
  v2[8] = @"Biometric";
  v2[9] = @"CloudStorage";
  v2[10] = @"DeviceProtection";
  v2[11] = @"DeviceToDeviceMigration";
  v2[12] = @"Diagnostics";
  v2[13] = @"DisplayTone";
  v2[14] = @"ExpressLanguage";
  v2[15] = @"HomeButtonSensitivity";
  v2[16] = @"Keyboard";
  v2[17] = @"Language";
  v2[18] = @"Location";
  v2[19] = @"EnableLockdownMode";
  v2[20] = @"MessagingActivationUsingPhoneNumber";
  v2[21] = @"OnBoarding";
  v2[22] = @"Passcode";
  v2[23] = @"Payment";
  v2[24] = @"PreferredLanguage";
  v2[25] = @"Privacy";
  v2[26] = @"Region";
  v2[27] = @"Restore";
  v2[28] = @"RestoreCompleted";
  v2[29] = @"Siri";
  v2[30] = @"SpokenLanguage";
  v2[31] = @"TOS";
  v2[32] = @"TapToSetup";
  v2[33] = @"UpdateCompleted";
  v2[34] = @"WatchMigration";
  v2[35] = @"Welcome";
  v2[36] = @"iMessageAndFaceTime";
  v2[37] = @"SoftwareUpdate";
  v2[38] = @"TermsOfAddress";
  v2[39] = @"WiFi";
  v2[40] = @"IntendedUser";
  v2[41] = @"Safety";
  v2[42] = @"ActionButton";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:43];
  v1 = (void *)allSkipKeys_allSkipKeys;
  allSkipKeys_allSkipKeys = v0;
}

@end