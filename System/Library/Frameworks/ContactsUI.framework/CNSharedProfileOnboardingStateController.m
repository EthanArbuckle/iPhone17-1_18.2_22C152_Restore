@interface CNSharedProfileOnboardingStateController
+ (id)log;
+ (id)userDefaults;
+ (void)writeToDefaultsDidSkipPosterSetup:(BOOL)a3;
- (BOOL)accountCanCreateSNaP;
- (BOOL)alwaysShowSNaPOnboarding;
- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3;
- (BOOL)deviceSupportsPosters;
- (BOOL)didSkipPosterSetup;
- (BOOL)hasCompletedOnboarding;
- (BOOL)iCloudSignedInToUseNicknames;
- (BOOL)isPhotosReadyForOnboarding;
- (BOOL)multiplePhoneNumbersTiedToAppleID;
- (BOOL)shouldShowOnboarding;
- (int64_t)currentOnboardingVersion;
- (int64_t)lastShowOnboardingVersionInSettings;
- (int64_t)lastShownOnboardingVersion;
- (void)writeToDefaultsCompletedOnboarding:(BOOL)a3;
- (void)writeToDefaultsLastShownOnboardingVersion;
- (void)writeToDefaultsLastShownSettingsOnboardingVersion;
- (void)writeToDefaultsOnboardingVersion:(int64_t)a3;
@end

@implementation CNSharedProfileOnboardingStateController

- (BOOL)shouldShowOnboarding
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(CNSharedProfileOnboardingStateController *)self alwaysShowSNaPOnboarding]) {
    return 1;
  }
  int64_t v4 = [(CNSharedProfileOnboardingStateController *)self lastShownOnboardingVersion];
  BOOL v3 = v4 < 1;
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109120;
    v7[1] = v4 < 1;
    _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "Should show onboarding: newOnboardingAvailable %d", (uint8_t *)v7, 8u);
  }

  return v3;
}

- (int64_t)lastShownOnboardingVersion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() userDefaults];
  int64_t v3 = [v2 integerForKey:@"CNSharedProfileOnboardingLastShownVersion"];

  int64_t v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    int64_t v7 = v3;
    _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "Last shown onboarding version: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

+ (id)userDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.contacts.sharedProfile"];

  return v2;
}

+ (id)log
{
  if (log_cn_once_token_21 != -1) {
    dispatch_once(&log_cn_once_token_21, &__block_literal_global_46654);
  }
  v2 = (void *)log_cn_once_object_21;

  return v2;
}

- (BOOL)alwaysShowSNaPOnboarding
{
  v2 = [(id)objc_opt_class() userDefaults];
  int64_t v3 = [v2 valueForKey:@"CNSharedProfileOnboardingAlwaysShow"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int64_t v7 = 0;
      _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "Always show SNaP Onboarding enabled", v7, 2u);
    }
  }
  return v4;
}

void __47__CNSharedProfileOnboardingStateController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNSharedProfileOnboardingController");
  v1 = (void *)log_cn_once_object_21;
  log_cn_once_object_21 = (uint64_t)v0;
}

+ (void)writeToDefaultsDidSkipPosterSetup:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Writing to defaults, user has selected to skip poster setup %d", (uint8_t *)v6, 8u);
  }

  v5 = [(id)objc_opt_class() userDefaults];
  [v5 setBool:v3 forKey:@"CNSharedProfileOnboardingDidSkipPosterSetup"];
}

- (void)writeToDefaultsLastShownSettingsOnboardingVersion
{
  v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_18B625000, v2, OS_LOG_TYPE_DEFAULT, "Writing to defaults, user has seen settings onboarding", v4, 2u);
  }

  BOOL v3 = [(id)objc_opt_class() userDefaults];
  [v3 setInteger:1 forKey:@"CNSharedProfileOnboardingLastShownSettingsVersion"];
}

- (int64_t)lastShowOnboardingVersionInSettings
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() userDefaults];
  int64_t v3 = [v2 integerForKey:@"CNSharedProfileOnboardingLastShownSettingsVersion"];

  int v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    int64_t v7 = v3;
    _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "Last shown settings onboarding version: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)didSkipPosterSetup
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() userDefaults];
  int v3 = [v2 BOOLForKey:@"CNSharedProfileOnboardingDidSkipPosterSetup"];

  int v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "User skipped poster setup: %d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (void)writeToDefaultsCompletedOnboarding:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Writing to defaults, completed onboarding %d", (uint8_t *)v6, 8u);
  }

  v5 = [(id)objc_opt_class() userDefaults];
  [v5 setBool:v3 forKey:@"CNSharedProfileOnboardingCompleted"];
}

- (BOOL)hasCompletedOnboarding
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() userDefaults];
  int v3 = [v2 BOOLForKey:@"CNSharedProfileOnboardingCompleted"];

  int v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "Has completed onboarding: %d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (void)writeToDefaultsOnboardingVersion:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Writing to defaults, onboarding versions %ld", (uint8_t *)&v6, 0xCu);
  }

  v5 = [(id)objc_opt_class() userDefaults];
  [v5 setInteger:a3 forKey:@"CNSharedProfileOnboardingLastShownVersion"];
}

- (void)writeToDefaultsLastShownOnboardingVersion
{
}

- (BOOL)accountCanCreateSNaP
{
  if (![(CNSharedProfileOnboardingStateController *)self iCloudSignedInToUseNicknames])
  {
    v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = 0;
      int v6 = "Cannot create SNaP on account because iCloud is not signed in";
      int64_t v7 = (uint8_t *)&v11;
LABEL_9:
      _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    }
LABEL_10:

    return 0;
  }
  int v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  int v4 = [v3 featureFlags];
  if (([v4 isFeatureEnabled:14] & 1) == 0)
  {
    BOOL v8 = [(CNSharedProfileOnboardingStateController *)self multiplePhoneNumbersTiedToAppleID];

    if (!v8) {
      return 1;
    }
    v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = 0;
      int v6 = "Cannot create SNaP on account because multiple numbers are associated with Apple ID";
      int64_t v7 = (uint8_t *)&v10;
      goto LABEL_9;
    }
    goto LABEL_10;
  }

  return 1;
}

- (BOOL)iCloudSignedInToUseNicknames
{
  v2 = [getIMNicknameControllerClass() sharedInstance];
  char v3 = [v2 iCloudSignedInToUseNicknames];

  return v3;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  id IMNicknameControllerClass = getIMNicknameControllerClass();

  return [IMNicknameControllerClass multiplePhoneNumbersTiedToAppleID];
}

- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3
{
  v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  int v6 = [v5 featureFlags];
  int v7 = [v6 isFeatureEnabled:16];

  if (!v7) {
    goto LABEL_6;
  }
  BOOL v8 = [(CNSharedProfileOnboardingStateController *)self accountCanCreateSNaP];
  if (v8)
  {
    if (!a3)
    {
      v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      __int16 v10 = [v9 featureFlags];
      int v11 = [v10 isFeatureEnabled:14];

      if (v11)
      {
        if ([(CNSharedProfileOnboardingStateController *)self multiplePhoneNumbersTiedToAppleID])
        {
LABEL_6:
          LOBYTE(v8) = 0;
          return v8;
        }
      }
    }
    v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEBUG, "User can show onboarding", v14, 2u);
    }

    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)isPhotosReadyForOnboarding
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  v2 = +[CNPhotoLibraryProvider photoLibraryWithError:&v14];
  id v3 = v14;
  if (v2)
  {
    [v2 ratioOfAssetsAtOrAboveSceneAnalysisVersion:88];
    double v5 = v4;
    [v2 ratioOfAssetsAtOrAboveFaceAnalysisVersion:11];
    double v7 = v6;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough", @"com.apple.photoanalysisd", 0);
    int v9 = AppBooleanValue;
    BOOL v10 = v5 >= 0.75;
    if (v7 < 0.75) {
      BOOL v10 = 0;
    }
    if (AppBooleanValue) {
      BOOL v11 = v10;
    }
    else {
      BOOL v11 = 0;
    }
    v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      double v16 = v5;
      __int16 v17 = 2048;
      double v18 = v7;
      __int16 v19 = 1024;
      BOOL v20 = v9 != 0;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEFAULT, "Is Photos app ready for onboarding: scene analysis ratio %.2f, face analysis ratio %.2f, suggestions defaults: %d", buf, 0x1Cu);
    }
  }
  else
  {
    v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v16 = *(double *)&v3;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "Unable to open photo library for onboarding %@", buf, 0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)currentOnboardingVersion
{
  return 1;
}

- (BOOL)deviceSupportsPosters
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

@end