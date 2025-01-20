@interface CSLPRFLiveActivitiesAppSettingsCustomization
- (id)settingsForBundleIdentifier:(id)a3 fromAllSettings:(id)a4 handled:(BOOL *)a5;
@end

@implementation CSLPRFLiveActivitiesAppSettingsCustomization

- (id)settingsForBundleIdentifier:(id)a3 fromAllSettings:(id)a4 handled:(BOOL *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F01878] bundleRecordWithApplicationIdentifier:v7 error:0];
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = cslprf_settings_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v30 = 138412290;
        id v31 = v7;
        _os_log_impl(&dword_22F4EA000, v14, OS_LOG_TYPE_INFO, "Live activities settings requested for: %@", (uint8_t *)&v30, 0xCu);
      }

      v15 = +[CSLPRFApp appWithApplicationRecord:v13];
      v16 = [v15 unionedBackgroundModes];
      if ([v16 containsObject:@"audio"])
      {
        int v17 = 0;
      }
      else
      {
        v18 = [v15 bundleIdentifier];
        int v19 = [v18 isEqualToString:@"com.apple.NanoNowPlaying"];

        int v17 = v19 ^ 1;
      }

      v20 = [v15 unionedBackgroundModes];
      if ([v20 containsObject:@"workout-processing"])
      {
        int v21 = 1;
      }
      else
      {
        v22 = [v15 bundleIdentifier];
        int v21 = [v22 isEqualToString:@"com.apple.SessionTrackerApp"];
      }
      v23 = [v15 unionedBackgroundModes];
      char v24 = [v23 containsObject:@"physical-therapy"];

      if (((v17 | v21) & 1) == 0 && (v24 & 1) == 0)
      {
        v25 = cslprf_settings_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl(&dword_22F4EA000, v25, OS_LOG_TYPE_INFO, "Bundle id is a media app, returning 'All Media Apps' settings", (uint8_t *)&v30, 2u);
        }
        v26 = kAllMusicAppsBundleIdentifer;
LABEL_25:

        *a5 = 1;
        v27 = [v8 objectForKey:*v26];

        goto LABEL_31;
      }
      if (v21)
      {
        v25 = cslprf_settings_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl(&dword_22F4EA000, v25, OS_LOG_TYPE_INFO, "Bundle id is a workout app, returning 'All Workout Apps' settings", (uint8_t *)&v30, 2u);
        }
        v26 = kAllWorkoutAppsBundleIdentifier;
        goto LABEL_25;
      }
    }
  }
  v28 = cslprf_settings_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    LOWORD(v30) = 0;
    _os_log_impl(&dword_22F4EA000, v28, OS_LOG_TYPE_INFO, "Bundle id is not a special type of app, returning standard settings.", (uint8_t *)&v30, 2u);
  }

  v27 = 0;
  *a5 = 0;
LABEL_31:

  return v27;
}

@end