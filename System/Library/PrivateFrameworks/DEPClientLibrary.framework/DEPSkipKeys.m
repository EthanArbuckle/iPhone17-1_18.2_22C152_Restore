@interface DEPSkipKeys
+ (id)_iOS_skipKeys;
+ (id)_osx_skipKeys;
+ (id)_tvOS_skipKeys;
+ (id)_visionOS_skipKeys;
+ (id)_watchOS_skipKeys;
+ (id)allSkipKeys;
@end

@implementation DEPSkipKeys

+ (id)allSkipKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__DEPSkipKeys_allSkipKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allSkipKeys_onceToken != -1) {
    dispatch_once(&allSkipKeys_onceToken, block);
  }
  v2 = (void *)allSkipKeys_allSkipKeys;
  return v2;
}

uint64_t __26__DEPSkipKeys_allSkipKeys__block_invoke(uint64_t a1)
{
  allSkipKeys_allSkipKeys = objc_msgSend(*(id *)(a1 + 32), "_iOS_skipKeys");
  return MEMORY[0x1F41817F8]();
}

+ (id)_visionOS_skipKeys
{
  v4[43] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AccessibilityAppearance";
  v4[1] = @"ActionButton";
  v4[2] = @"Android";
  v4[3] = @"Appearance";
  v4[4] = @"AppleID";
  v4[5] = @"AppStore";
  v4[6] = @"Biometric";
  v4[7] = @"CameraButton";
  v4[8] = @"DeviceToDeviceMigration";
  v4[9] = @"DeviceProtection";
  v4[10] = @"Diagnostics";
  v4[11] = @"DisplayTone";
  v4[12] = @"EnableLockdownMode";
  v4[13] = @"ExpressLanguage";
  v4[14] = @"HomeButtonSensitivity";
  v4[15] = @"iMessageAndFaceTime";
  v4[16] = @"Intelligence";
  v4[17] = @"IntendedUser";
  v4[18] = @"Keyboard";
  v4[19] = @"Location";
  v4[20] = @"MessagingActivationUsingPhoneNumber";
  v4[21] = @"OnBoarding";
  v4[22] = @"Passcode";
  v4[23] = @"Payment";
  v4[24] = @"PreferredLanguage";
  v4[25] = @"Privacy";
  v4[26] = @"Restore";
  v4[27] = @"RestoreCompleted";
  v4[28] = @"Safety";
  v4[29] = @"ScreenTime";
  v4[30] = @"SIMSetup";
  v4[31] = @"Siri";
  v4[32] = @"SoftwareUpdate";
  v4[33] = @"SpokenLanguage";
  v4[34] = @"TapToSetup";
  v4[35] = @"TermsOfAddress";
  v4[36] = @"TOS";
  v4[37] = @"UpdateCompleted";
  v4[38] = @"WatchMigration";
  v4[39] = @"WebContentFiltering";
  v4[40] = @"Welcome";
  v4[41] = @"WiFi";
  v4[42] = @"Zoom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:43];
  return v2;
}

+ (id)_iOS_skipKeys
{
  v4[43] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AccessibilityAppearance";
  v4[1] = @"ActionButton";
  v4[2] = @"Android";
  v4[3] = @"Appearance";
  v4[4] = @"AppleID";
  v4[5] = @"AppStore";
  v4[6] = @"Biometric";
  v4[7] = @"CameraButton";
  v4[8] = @"DeviceToDeviceMigration";
  v4[9] = @"DeviceProtection";
  v4[10] = @"Diagnostics";
  v4[11] = @"DisplayTone";
  v4[12] = @"EnableLockdownMode";
  v4[13] = @"ExpressLanguage";
  v4[14] = @"HomeButtonSensitivity";
  v4[15] = @"iMessageAndFaceTime";
  v4[16] = @"Intelligence";
  v4[17] = @"IntendedUser";
  v4[18] = @"Keyboard";
  v4[19] = @"Location";
  v4[20] = @"MessagingActivationUsingPhoneNumber";
  v4[21] = @"OnBoarding";
  v4[22] = @"Passcode";
  v4[23] = @"Payment";
  v4[24] = @"PreferredLanguage";
  v4[25] = @"Privacy";
  v4[26] = @"Restore";
  v4[27] = @"RestoreCompleted";
  v4[28] = @"Safety";
  v4[29] = @"ScreenTime";
  v4[30] = @"SIMSetup";
  v4[31] = @"Siri";
  v4[32] = @"SoftwareUpdate";
  v4[33] = @"SpokenLanguage";
  v4[34] = @"TapToSetup";
  v4[35] = @"TermsOfAddress";
  v4[36] = @"TOS";
  v4[37] = @"UpdateCompleted";
  v4[38] = @"WatchMigration";
  v4[39] = @"WebContentFiltering";
  v4[40] = @"Welcome";
  v4[41] = @"WiFi";
  v4[42] = @"Zoom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:43];
  return v2;
}

+ (id)_osx_skipKeys
{
  v4[24] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Accessibility";
  v4[1] = @"Appearance";
  v4[2] = @"AppleID";
  v4[3] = @"AppStore";
  v4[4] = @"Biometric";
  v4[5] = @"Diagnostics";
  v4[6] = @"DisplayTone";
  v4[7] = @"EnableLockdownMode";
  v4[8] = @"FileVault";
  v4[9] = @"iCloudDiagnostics";
  v4[10] = @"iCloudStorage";
  v4[11] = @"Intelligence";
  v4[12] = @"Location";
  v4[13] = @"Passcode";
  v4[14] = @"Payment";
  v4[15] = @"Privacy";
  v4[16] = @"Restore";
  v4[17] = @"ScreenTime";
  v4[18] = @"Siri";
  v4[19] = @"TermsOfAddress";
  v4[20] = @"TOS";
  v4[21] = @"UnlockWithWatch";
  v4[22] = @"Wallpaper";
  v4[23] = @"Welcome";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:24];
  return v2;
}

+ (id)_tvOS_skipKeys
{
  v4[13] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AppleID";
  v4[1] = @"Diagnostics";
  v4[2] = @"Language";
  v4[3] = @"Location";
  v4[4] = @"Privacy";
  v4[5] = @"Region";
  v4[6] = @"ScreenSaver";
  v4[7] = @"Siri";
  v4[8] = @"TapToSetup";
  v4[9] = @"TOS";
  v4[10] = @"TVHomeScreenSync";
  v4[11] = @"TVProviderSignIn";
  v4[12] = @"TVRoom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  return v2;
}

+ (id)_watchOS_skipKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end