@interface CSLPRFLiveActivitiesAppResolvedSettings
- (BOOL)allowLiveActivitiesForApp;
- (BOOL)globalAllowLiveActivities;
- (BOOL)globalAutoLaunchLiveActivities;
- (BOOL)isEqualToSettings:(id)a3;
- (BOOL)supportsSmartStack;
- (CSLPRFLiveActivitiesAppResolvedSettings)initWithSettings:(id)a3 globalSettings:(id)a4;
- (unint64_t)autoLaunchBehaviorForApp;
@end

@implementation CSLPRFLiveActivitiesAppResolvedSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (BOOL)isEqualToSettings:(id)a3
{
  return CSLPRFEqualLiveActivitiesAppSettingsValues(self, a3);
}

- (unint64_t)autoLaunchBehaviorForApp
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  settings = self->_settings;
  uint64_t v5 = objc_opt_class();
  v6 = settings;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    v9 = [(CSLPRFLiveActivitiesAppProperties *)v8 application];
    v10 = [v9 bundleIdentifier];
    int v11 = [v10 isEqualToString:@"com.apple.SafetyMonitorApp"];

    if (v11)
    {
      v12 = cslprf_settings_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = NSStringFromSelector(a2);
        v14 = [(CSLPRFLiveActivitiesAppProperties *)v8 application];
        v15 = [v14 bundleIdentifier];
        int v29 = 134218498;
        v30 = self;
        __int16 v31 = 2112;
        v32 = v13;
        __int16 v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_22F4EA000, v12, OS_LOG_TYPE_INFO, "%p %@ -- this (%@) is a check-in activity, always allow it to launch to .smartstack.", (uint8_t *)&v29, 0x20u);
      }
      goto LABEL_16;
    }
  }
  if [(CSLPRFLiveActivitiesAppProperties *)self->_globalSettings globalAutoLaunchLiveActivities]&& ([(CSLPRFLiveActivitiesAppProperties *)self->_globalSettings globalAllowLiveActivities])
  {
    v12 = [(CSLPRFLiveActivitiesAppProperties *)v8 application];
    v16 = [v12 bundleIdentifier];
    if (![v16 isEqual:@"com.apple.NanoAllMusicApps"])
    {
LABEL_15:

LABEL_16:
LABEL_17:
      unint64_t v18 = [(CSLPRFLiveActivitiesAppProperties *)self->_settings autoLaunchBehaviorForApp];
      goto LABEL_21;
    }
    v17 = [MEMORY[0x263F01878] bundleRecordWithApplicationIdentifier:@"com.apple.NanoNowPlaying" error:0];
    if (v17)
    {

      goto LABEL_15;
    }
    uint64_t v24 = [(CSLPRFLiveActivitiesAppProperties *)self->_settings autoLaunchBehaviorForApp];

    if (v24 != 1) {
      goto LABEL_17;
    }
    v25 = cslprf_settings_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = NSStringFromSelector(a2);
      v27 = [(CSLPRFLiveActivitiesAppProperties *)v8 application];
      v28 = [v27 bundleIdentifier];
      int v29 = 134218498;
      v30 = self;
      __int16 v31 = 2112;
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v28;
      _os_log_impl(&dword_22F4EA000, v25, OS_LOG_TYPE_INFO, "%p %@ -- user uninstalled Now Playing but configured .smartstack for all audio apps, returning .app instead for (%@).", (uint8_t *)&v29, 0x20u);
    }
    unint64_t v18 = 2;
  }
  else
  {
    v19 = cslprf_settings_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = NSStringFromSelector(a2);
      v21 = [(CSLPRFLiveActivitiesAppProperties *)v8 application];
      v22 = [v21 bundleIdentifier];
      int v29 = 134218498;
      v30 = self;
      __int16 v31 = 2112;
      v32 = v20;
      __int16 v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_22F4EA000, v19, OS_LOG_TYPE_INFO, "%p %@ -- overriding app setting for (%@) because global setting is off.", (uint8_t *)&v29, 0x20u);
    }
    unint64_t v18 = 0;
  }
LABEL_21:

  return v18;
}

- (BOOL)allowLiveActivitiesForApp
{
  settings = self->_settings;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = settings;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7
    && ([(CSLPRFLiveActivitiesAppProperties *)v7 application],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 bundleIdentifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:@"com.apple.SafetyMonitorApp"],
        v9,
        v8,
        (v10 & 1) != 0)
    || [(CSLPRFLiveActivitiesAppProperties *)self->_globalSettings globalAllowLiveActivities])
  {
    char v11 = [(CSLPRFLiveActivitiesAppProperties *)self->_settings allowLiveActivitiesForApp];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)globalAutoLaunchLiveActivities
{
  return [(CSLPRFLiveActivitiesAppProperties *)self->_globalSettings globalAutoLaunchLiveActivities];
}

- (BOOL)globalAllowLiveActivities
{
  return [(CSLPRFLiveActivitiesAppProperties *)self->_globalSettings globalAllowLiveActivities];
}

- (BOOL)supportsSmartStack
{
  return [(CSLPRFLiveActivitiesAppProperties *)self->_settings supportsSmartStack];
}

- (CSLPRFLiveActivitiesAppResolvedSettings)initWithSettings:(id)a3 globalSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSLPRFLiveActivitiesAppResolvedSettings;
  v9 = [(CSLPRFLiveActivitiesAppResolvedSettings *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeStrong((id *)&v10->_globalSettings, a4);
  }

  return v10;
}

@end