@interface CAMUserPreferencesMigrator
+ (int64_t)_HDRModeForLegacyHDRMode:(int64_t)a3;
+ (int64_t)_captureModeForLegacyCameraMode:(int64_t)a3;
+ (int64_t)_flashModeForLegacyFlashMode:(int64_t)a3;
+ (int64_t)_previewViewAspectModeForLegacyAspectMode:(int64_t)a3;
+ (void)migrateLegacyPreferences;
@end

@implementation CAMUserPreferencesMigrator

+ (void)migrateLegacyPreferences
{
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  v3 = (void *)CFPreferencesCopyAppValue(@"CameraConfiguration", @"com.apple.mobileslideshow");
  v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"HDRKeepOriginalPhoto", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    [v4 setBool:AppBooleanValue != 0 forKey:@"CAMUserPreferenceHDREV0"];
  }
  Boolean v22 = 0;
  int v6 = CFPreferencesGetAppBooleanValue(@"CAMUse60FPSVideo", @"com.apple.mobileslideshow", &v22);
  if (v22) {
    [v4 setInteger:v6 != 0 forKey:*MEMORY[0x263F5DED0]];
  }
  v7 = [v3 objectForKeyedSubscript:@"EnableGridLines"];
  v8 = v7;
  if (v7) {
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v7, "BOOLValue"), @"CAMUserPreferenceShowGridOverlay");
  }
  v9 = [v3 objectForKeyedSubscript:*MEMORY[0x263F83CF8]];
  v10 = v9;
  if (v9) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_flashModeForLegacyFlashMode:", objc_msgSend(v9, "integerValue")), @"CAMUserPreferenceDesiredFlashMode");
  }
  v11 = [v3 objectForKeyedSubscript:@"VideoFlashMode"];
  v12 = v11;
  if (v11) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_flashModeForLegacyFlashMode:", objc_msgSend(v11, "integerValue")), @"CAMUserPreferenceTorchMode");
  }
  v13 = [v3 objectForKeyedSubscript:@"HDRMode"];
  v14 = v13;
  if (v13) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_HDRModeForLegacyHDRMode:", objc_msgSend(v13, "integerValue")), @"CAMUserPreferenceDesiredHDRMode");
  }
  v15 = [v3 objectForKeyedSubscript:@"UserChangedHDRAfterFlash"];
  v16 = v15;
  if (v15)
  {
    if ([v15 BOOLValue]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [v4 setInteger:v17 forKey:@"CAMUserPreferenceFlashAndHDRConflictingControl"];
  }
  v18 = [v3 objectForKeyedSubscript:*MEMORY[0x263F83CE8]];
  v19 = v18;
  if (v18) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_captureModeForLegacyCameraMode:", objc_msgSend(v18, "integerValue")), @"CAMUserPreferenceCaptureMode");
  }
  v20 = [v3 objectForKeyedSubscript:@"PreviewZoomMode"];
  v21 = v20;
  if (v20) {
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_previewViewAspectModeForLegacyAspectMode:", objc_msgSend(v20, "integerValue")), @"CAMUserPreferencePreviewViewAspectMode");
  }
  [v4 setBool:1 forKey:@"CAMUserPreferenceDidMigrate"];
  [v4 synchronize];
}

+ (int64_t)_flashModeForLegacyFlashMode:(int64_t)a3
{
  if (a3) {
    return a3 == 1;
  }
  else {
    return 2;
  }
}

+ (int64_t)_captureModeForLegacyCameraMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_209C7B6D8[a3 - 1];
  }
}

+ (int64_t)_HDRModeForLegacyHDRMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)_previewViewAspectModeForLegacyAspectMode:(int64_t)a3
{
  return a3 == 1;
}

@end