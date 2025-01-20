@interface CSLPRFLiveActivitiesAppSettings
+ (Class)serializationClass;
+ (const)notificationName;
+ (id)globalDefaultIdentifer;
+ (id)globalSettingsWithSerialization:(id)a3 delegate:(id)a4;
+ (id)settingsForApplication:(id)a3 withSerialization:(id)a4 delegate:(id)a5;
+ (id)settingsKey;
+ (id)sharedSettingsModel;
+ (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3;
+ (unint64_t)categoryForApplication:(id)a3;
+ (void)migrateLegacySettings:(id)a3;
- (BOOL)allowLiveActivitiesForApp;
- (BOOL)globalAllowLiveActivities;
- (BOOL)globalAutoLaunchLiveActivities;
- (BOOL)hasCustomSetting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSettings:(id)a3;
- (BOOL)isGlobalDefault;
- (BOOL)supportsSmartStack;
- (CSLPRFApplication)application;
- (NSString)description;
- (NSString)identifier;
- (id)allowLiveActivitiesForAppWithIgnoredSpecifier:(id)a3;
- (id)globalAllowLiveActivitiesWithIgnoredSpecifier:(id)a3;
- (id)globalAutoLaunchLiveActivitiesWithIgnoredSpecifier:(id)a3;
- (id)initForApplication:(id)a3 isGlobalDefault:(BOOL)a4 withSerialization:(id)a5 delegate:(id)a6;
- (id)resolvedSettingWithGlobalSettings:(id)a3;
- (id)serialize;
- (unint64_t)autoLaunchBehaviorForApp;
- (unint64_t)autoLaunchBehaviorForAppWithIgnoredSpecifier:(id)a3;
- (unint64_t)category;
- (unint64_t)hash;
- (void)setAllowLiveActivitiesForApp:(id)a3 withIgnoredSpecifier:(id)a4;
- (void)setApplication:(id)a3;
- (void)setAutoLaunchBehaviorForApp:(unint64_t)a3 withIgnoredSpecifier:(id)a4;
- (void)setCategory:(unint64_t)a3;
- (void)setDefaultAutoLaunchBehaviorWithBackgroundModes:(id)a3;
- (void)setGlobalAllowLiveActivities:(id)a3 withIgnoredSpecifier:(id)a4;
- (void)setGlobalAutoLaunchLiveActivities:(id)a3 withIgnoredSpecifier:(id)a4;
- (void)updateSettingsWithBlock:(id)a3;
@end

@implementation CSLPRFLiveActivitiesAppSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setApplication:(id)a3
{
}

- (CSLPRFApplication)application
{
  return self->_application;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (BOOL)isGlobalDefault
{
  return self->_isGlobalDefault;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[CSLPRFLiveActivitiesAppSettings globalAllowLiveActivities](self, "globalAllowLiveActivities"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[CSLPRFLiveActivitiesAppSettings globalAutoLaunchLiveActivities](self, "globalAutoLaunchLiveActivities"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[CSLPRFLiveActivitiesAppSettings allowLiveActivitiesForApp](self, "allowLiveActivitiesForApp"));
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CSLPRFLiveActivitiesAppSettings autoLaunchBehaviorForApp](self, "autoLaunchBehaviorForApp"));
  id v8 = (id)[v3 appendObject:self->_application];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(CSLPRFLiveActivitiesAppSettings *)self globalAllowLiveActivities];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke;
  v30[3] = &unk_264A0BCF8;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v30];
  BOOL v9 = [(CSLPRFLiveActivitiesAppSettings *)self globalAutoLaunchLiveActivities];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_2;
  v28[3] = &unk_264A0BCF8;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendBool:v9 counterpart:v28];
  BOOL v12 = [(CSLPRFLiveActivitiesAppSettings *)self allowLiveActivitiesForApp];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_3;
  v26[3] = &unk_264A0BCF8;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v26];
  unint64_t v15 = [(CSLPRFLiveActivitiesAppSettings *)self autoLaunchBehaviorForApp];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_4;
  v24[3] = &unk_264A0BBA0;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendUnsignedInteger:v15 counterpart:v24];
  application = self->_application;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_5;
  v22[3] = &unk_264A0BBC8;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendObject:application counterpart:v22];
  LOBYTE(application) = [v5 isEqual];

  return (char)application;
}

uint64_t __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) globalAllowLiveActivities];
}

uint64_t __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) globalAutoLaunchLiveActivities];
}

uint64_t __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) allowLiveActivitiesForApp];
}

uint64_t __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoLaunchBehaviorForApp];
}

uint64_t __43__CSLPRFLiveActivitiesAppSettings_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) application];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSLPRFLiveActivitiesAppSettings globalAllowLiveActivities](self, "globalAllowLiveActivities"), @"globalAllowLiveActivities");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSLPRFLiveActivitiesAppSettings globalAutoLaunchLiveActivities](self, "globalAutoLaunchLiveActivities"), @"globalAutoLaunchLiveActivities");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSLPRFLiveActivitiesAppSettings allowLiveActivitiesForApp](self, "allowLiveActivitiesForApp"), @"liveActivitiesForApp");
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[CSLPRFLiveActivitiesAppSettings autoLaunchBehaviorForApp](self, "autoLaunchBehaviorForApp"), @"autoLaunchBehaviorForApp");
  id v8 = (id)[v3 appendObject:self->_application withName:@"application"];
  BOOL v9 = [v3 build];

  return (NSString *)v9;
}

- (id)serialize
{
  v15[4] = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_globalAllowLiveActivities = self->_lock_globalAllowLiveActivities;
  BOOL lock_globalAutoLaunchLiveActivities = self->_lock_globalAutoLaunchLiveActivities;
  BOOL lock_allowLiveActivitiesForApp = self->_lock_allowLiveActivitiesForApp;
  unint64_t lock_autoLaunchBehaviorForApp = self->_lock_autoLaunchBehaviorForApp;
  os_unfair_lock_unlock(p_lock);
  v14[0] = @"GlobalAllowLiveActivities";
  id v8 = [NSNumber numberWithBool:lock_globalAllowLiveActivities];
  v15[0] = v8;
  v14[1] = @"GlobalAutoLaunchLiveActivities";
  BOOL v9 = [NSNumber numberWithBool:lock_globalAutoLaunchLiveActivities];
  v15[1] = v9;
  v14[2] = @"AllowLiveActivitiesForApp";
  id v10 = [NSNumber numberWithBool:lock_allowLiveActivitiesForApp];
  v15[2] = v10;
  v14[3] = @"LiveActivitiesAutoLaunchBehaviorForApp";
  id v11 = [NSNumber numberWithUnsignedInteger:lock_autoLaunchBehaviorForApp];
  v15[3] = v11;
  BOOL v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

- (id)resolvedSettingWithGlobalSettings:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    id v5 = [[CSLPRFLiveActivitiesAppResolvedSettings alloc] initWithSettings:self globalSettings:v4];
  }
  else {
    id v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isEqualToSettings:(id)a3
{
  return CSLPRFEqualLiveActivitiesAppSettingsValues(self, a3);
}

- (void)updateSettingsWithBlock:(id)a3
{
  id v4 = (void (**)(id, CSLPRFLiveActivitiesAppMutableSettings *))a3;
  id v6 = [[CSLPRFLiveActivitiesAppMutableSettings alloc] initWithSettings:self];
  v4[2](v4, v6);

  if (![(CSLPRFLiveActivitiesAppMutableSettings *)v6 isEqualToSettings:self])
  {
    os_unfair_lock_lock(&self->_lock);
    self->_BOOL lock_globalAllowLiveActivities = [(CSLPRFLiveActivitiesAppMutableSettings *)v6 globalAllowLiveActivities];
    self->_BOOL lock_globalAutoLaunchLiveActivities = [(CSLPRFLiveActivitiesAppMutableSettings *)v6 globalAutoLaunchLiveActivities];
    self->_BOOL lock_allowLiveActivitiesForApp = [(CSLPRFLiveActivitiesAppMutableSettings *)v6 allowLiveActivitiesForApp];
    self->_unint64_t lock_autoLaunchBehaviorForApp = [(CSLPRFLiveActivitiesAppMutableSettings *)v6 autoLaunchBehaviorForApp];
    os_unfair_lock_unlock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didUpdateSettings:self];
  }
}

- (unint64_t)autoLaunchBehaviorForApp
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(CSLPRFLiveActivitiesAppSettings *)self globalAllowLiveActivities])
  {
    if (self->_isGlobalDefault)
    {
      v3 = cslprf_settings_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        id v4 = [(CSLPRFLiveActivitiesAppSettings *)self application];
        id v5 = [v4 bundleIdentifier];
        int v16 = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_22F4EA000, v3, OS_LOG_TYPE_INFO, "App is not configured so using global settings for %@", (uint8_t *)&v16, 0xCu);
      }
      return [(CSLPRFLiveActivitiesAppSettings *)self globalAutoLaunchLiveActivities];
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      unint64_t lock_autoLaunchBehaviorForApp = self->_lock_autoLaunchBehaviorForApp;
      os_unfair_lock_unlock(&self->_lock);
      id v10 = cslprf_settings_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = @"off";
        if (lock_autoLaunchBehaviorForApp == 2) {
          id v11 = @"app";
        }
        if (lock_autoLaunchBehaviorForApp == 1) {
          BOOL v12 = @"smart stack";
        }
        else {
          BOOL v12 = v11;
        }
        id v13 = [(CSLPRFLiveActivitiesAppSettings *)self application];
        id v14 = [v13 bundleIdentifier];
        int v16 = 138412546;
        id v17 = v12;
        __int16 v18 = 2112;
        id v19 = v14;
        _os_log_impl(&dword_22F4EA000, v10, OS_LOG_TYPE_INFO, "Returning live activities auto launch behavior = %@ for %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    id v7 = cslprf_settings_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(CSLPRFLiveActivitiesAppSettings *)self application];
      BOOL v9 = [v8 bundleIdentifier];
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_INFO, "Not allowing auto launch of live activity for %@ and global setting is off", (uint8_t *)&v16, 0xCu);
    }
    return 0;
  }
  return lock_autoLaunchBehaviorForApp;
}

- (BOOL)allowLiveActivitiesForApp
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_isGlobalDefault)
  {
    return [(CSLPRFLiveActivitiesAppSettings *)self globalAllowLiveActivities];
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL lock_allowLiveActivitiesForApp = self->_lock_allowLiveActivitiesForApp;
    os_unfair_lock_unlock(&self->_lock);
    id v5 = cslprf_settings_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (lock_allowLiveActivitiesForApp) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      id v7 = [(CSLPRFLiveActivitiesAppSettings *)self application];
      id v8 = [v7 bundleIdentifier];
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_INFO, "Returning allow live activities = %@ for %@", (uint8_t *)&v9, 0x16u);
    }
    return lock_allowLiveActivitiesForApp;
  }
}

- (BOOL)globalAutoLaunchLiveActivities
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_globalAutoLaunchLiveActivities = self->_lock_globalAutoLaunchLiveActivities;
  os_unfair_lock_unlock(p_lock);
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (lock_globalAutoLaunchLiveActivities) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = [(CSLPRFLiveActivitiesAppSettings *)self application];
    id v8 = [v7 bundleIdentifier];
    int v10 = 138412546;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_INFO, "Returning global auto launch live activities = %@ for %@", (uint8_t *)&v10, 0x16u);
  }
  return lock_globalAutoLaunchLiveActivities;
}

- (BOOL)globalAllowLiveActivities
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(CSLPRFLiveActivitiesAppSettings *)self application];
  id v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.SafetyMonitorApp"];

  if (v5)
  {
    id v6 = cslprf_settings_log();
    BOOL v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = [(CSLPRFLiveActivitiesAppSettings *)self application];
      int v9 = [v8 bundleIdentifier];
      int v16 = 138412290;
      id v17 = v9;
      int v10 = "Overriding global settings to allow check-in activity for (%@)";
      __int16 v11 = v6;
      uint32_t v12 = 12;
LABEL_9:
      _os_log_impl(&dword_22F4EA000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, v12);
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL lock_globalAllowLiveActivities = self->_lock_globalAllowLiveActivities;
    BOOL v7 = self->_lock_globalAllowLiveActivities;
    os_unfair_lock_unlock(&self->_lock);
    id v6 = cslprf_settings_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (lock_globalAllowLiveActivities) {
        uint64_t v14 = @"YES";
      }
      else {
        uint64_t v14 = @"NO";
      }
      id v8 = [(CSLPRFLiveActivitiesAppSettings *)self application];
      int v9 = [v8 bundleIdentifier];
      int v16 = 138412546;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v9;
      int v10 = "Returning global allow live activities = %@ for %@";
      __int16 v11 = v6;
      uint32_t v12 = 22;
      goto LABEL_9;
    }
  }

  return v7;
}

- (BOOL)hasCustomSetting
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isGlobalDefault)
  {
    BOOL v4 = !self->_lock_globalAllowLiveActivities || !self->_lock_globalAutoLaunchLiveActivities;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    int lock_allowLiveActivitiesForApp = self->_lock_allowLiveActivitiesForApp;
    int v6 = [(CSLPRFApplication *)self->_application supportsSmartStack];
    unint64_t lock_autoLaunchBehaviorForApp = self->_lock_autoLaunchBehaviorForApp;
    unint64_t defaultAutoLaunchBehaviorForApp = self->_defaultAutoLaunchBehaviorForApp;
    os_unfair_lock_unlock(p_lock);
    return lock_allowLiveActivitiesForApp != v6 || lock_autoLaunchBehaviorForApp != defaultAutoLaunchBehaviorForApp;
  }
  return v4;
}

- (BOOL)supportsSmartStack
{
  return [(CSLPRFApplication *)self->_application supportsSmartStack];
}

- (NSString)identifier
{
  return (NSString *)[(CSLPRFApplication *)self->_application bundleIdentifier];
}

- (void)setDefaultAutoLaunchBehaviorWithBackgroundModes:(id)a3
{
  v10[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(CSLPRFLiveActivitiesAppSettings *)self hasCustomSetting];
  v10[0] = @"com.apple.SessionTrackerApp";
  v10[1] = @"com.apple.Mind";
  v10[2] = @"com.apple.Mandrake";
  v10[3] = @"com.apple.NanoCompass.watchkitapp";
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  if (([v4 containsObject:@"physical-therapy"] & 1) != 0
    || ([v4 containsObject:@"workout-processing"] & 1) != 0)
  {
    unint64_t v7 = 2;
  }
  else
  {
    id v8 = [(CSLPRFApplication *)self->_application bundleIdentifier];
    int v9 = [v6 containsObject:v8];

    unint64_t v7 = 1;
    if (v9) {
      unint64_t v7 = 2;
    }
  }
  self->_unint64_t defaultAutoLaunchBehaviorForApp = v7;
  if (!v5) {
    self->_unint64_t lock_autoLaunchBehaviorForApp = v7;
  }
}

- (id)initForApplication:(id)a3 isGlobalDefault:(BOOL)a4 withSerialization:(id)a5 delegate:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CSLPRFLiveActivitiesAppSettings;
  uint64_t v14 = [(CSLPRFLiveActivitiesAppSettings *)&v25 init];
  unint64_t v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_application, a3);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_isGlobalDefault = a4;
    *(_WORD *)&v15->_BOOL lock_globalAllowLiveActivities = 257;
    v15->_int lock_allowLiveActivitiesForApp = 1;
    int v16 = [(CSLPRFApplication *)v15->_application unionedBackgroundModes];
    [(CSLPRFLiveActivitiesAppSettings *)v15 setDefaultAutoLaunchBehaviorWithBackgroundModes:v16];

    v15->_unint64_t lock_autoLaunchBehaviorForApp = v15->_defaultAutoLaunchBehaviorForApp;
    v15->_category = +[CSLPRFLiveActivitiesAppSettings categoryForApplication:v11];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v12;
        v15->_BOOL lock_globalAllowLiveActivities = [v17 cslprf_BOOLForKey:@"GlobalAllowLiveActivities" withDefaultValue:1];
        v15->_BOOL lock_globalAutoLaunchLiveActivities = [v17 cslprf_BOOLForKey:@"GlobalAutoLaunchLiveActivities" withDefaultValue:1];
        v15->_int lock_allowLiveActivitiesForApp = [v17 cslprf_BOOLForKey:@"AllowLiveActivitiesForApp" withDefaultValue:1];
        uint64_t v18 = [v17 objectForKey:@"LiveActivitiesAutoLaunchBehaviorForApp"];
        if (v18)
        {
          id v19 = (void *)v18;
          uint64_t v20 = [v11 bundleIdentifier];
          v21 = +[CSLPRFLiveActivitiesAppSettings globalDefaultIdentifer];
          char v22 = [v20 isEqualToString:v21];

          if ((v22 & 1) == 0)
          {
            id v23 = [v17 objectForKey:@"LiveActivitiesAutoLaunchBehaviorForApp"];
            v15->_unint64_t lock_autoLaunchBehaviorForApp = [v23 integerValue];
          }
        }
      }
      else
      {
        id v17 = cslprf_app_library_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218242;
          id v27 = v15;
          __int16 v28 = 2112;
          id v29 = v12;
          _os_log_fault_impl(&dword_22F4EA000, v17, OS_LOG_TYPE_FAULT, "%p CSLPRFLiveActivitiesAppSettings serialization was not a NSDictionary:%@", buf, 0x16u);
        }
      }
    }
  }

  return v15;
}

+ (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3
{
  v3 = +[CSLPRFLiveActivitiesAppSettings sharedSettingsModel];
  id v4 = [MEMORY[0x263F29C40] builderWithObject:v3];
  [v4 appendString:@"Live Activities Settings" withName:@"Title"];
  BOOL v5 = [v3 globalSettings];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__CSLPRFLiveActivitiesAppSettings__stateDataWithHints___block_invoke;
  v19[3] = &unk_264A0BCA8;
  id v6 = v4;
  id v20 = v6;
  id v21 = v5;
  id v7 = v5;
  [v6 appendBodySectionWithName:@"Globals" multilinePrefix:0 block:v19];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  unint64_t v15 = __55__CSLPRFLiveActivitiesAppSettings__stateDataWithHints___block_invoke_2;
  int v16 = &unk_264A0BCA8;
  id v17 = v3;
  id v18 = v6;
  id v8 = v6;
  id v9 = v3;
  [v8 appendBodySectionWithName:@"Apps" multilinePrefix:0 block:&v13];
  int v10 = objc_msgSend(v8, "build", v13, v14, v15, v16);
  id v11 = (os_state_data_s *)CSLPRFStateDataWithTitleDescriptionAndHints(@"CSLPRFLiveActivities", v10);

  return v11;
}

id __55__CSLPRFLiveActivitiesAppSettings__stateDataWithHints___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "globalAllowLiveActivities"), @"Allow");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "globalAutoLaunchLiveActivities"), @"Auto-Launch");
}

void __55__CSLPRFLiveActivitiesAppSettings__stateDataWithHints___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 32) allApplicationSettings];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v14 + 1) + 8 * v5);
        id v7 = *(void **)(a1 + 40);
        id v8 = [v6 identifier];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __55__CSLPRFLiveActivitiesAppSettings__stateDataWithHints___block_invoke_3;
        v11[3] = &unk_264A0BCA8;
        id v12 = *(id *)(a1 + 40);
        id v13 = v6;
        id v9 = v6;
        [v7 appendBodySectionWithName:v8 multilinePrefix:0 block:v11];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

id __55__CSLPRFLiveActivitiesAppSettings__stateDataWithHints___block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "allowLiveActivitiesForApp"), @"Allow");
  if ([*(id *)(a1 + 40) autoLaunchBehaviorForApp] != 2) {
    [*(id *)(a1 + 40) autoLaunchBehaviorForApp];
  }
  id v3 = (id)[*(id *)(a1 + 32) appendBool:1 withName:@"Auto-Launch"];
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "supportsSmartStack"), @"Supports Smart Stack");
  if ([*(id *)(a1 + 40) category] != 1
    && [*(id *)(a1 + 40) category]
    && [*(id *)(a1 + 40) category] != 3)
  {
    [*(id *)(a1 + 40) category];
  }
  return (id)[*(id *)(a1 + 32) appendBool:1 withName:@"Category"];
}

+ (void)migrateLegacySettings:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.Carousel"];
  id v5 = (id)[v4 synchronize];
  id v6 = [v4 objectForKey:@"mediaAutoLaunch"];

  if (v6)
  {
    char v7 = [v4 BOOLForKey:@"mediaAutoLaunch"];
    id v8 = cslprf_settings_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F4EA000, v8, OS_LOG_TYPE_INFO, "Legacy audio auto-launch setting was on, not migrating", buf, 2u);
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)long long v15 = 0;
        _os_log_impl(&dword_22F4EA000, v8, OS_LOG_TYPE_INFO, "Migrating legacy audio auto-launch setting to off", v15, 2u);
      }

      id v8 = +[CSLPRFPerApplicationSettings fakeApplicationWithIdentifier:@"com.apple.NanoAllMusicApps"];
      id v11 = [v3 settingsForApplication:v8];
      [v11 updateSettingsWithBlock:&__block_literal_global_82];
    }
    [v4 removeObjectForKey:@"mediaAutoLaunch"];
    id v12 = (id)[v4 synchronize];
  }
  else
  {
    int v10 = cslprf_settings_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_22F4EA000, v10, OS_LOG_TYPE_INFO, "Attempted migration of legacy media auto launch setting, no setting found on device", v13, 2u);
    }
  }
}

uint64_t __57__CSLPRFLiveActivitiesAppSettings_migrateLegacySettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAutoLaunchBehaviorForApp:0];
}

+ (id)sharedSettingsModel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CSLPRFLiveActivitiesAppSettings_sharedSettingsModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettingsModel_onceToken_4358 != -1) {
    dispatch_once(&sharedSettingsModel_onceToken_4358, block);
  }
  id v2 = (void *)sharedSettingsModel_sharedModel_4359;
  return v2;
}

void __54__CSLPRFLiveActivitiesAppSettings_sharedSettingsModel__block_invoke(uint64_t a1)
{
  id v2 = [CSLPRFPerApplicationSettingsModel alloc];
  id v3 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:3];
  uint64_t v4 = [(CSLPRFPerApplicationSettingsModel *)v2 initWithApplicationLibrary:v3 perApplicationSettingsClass:objc_opt_class()];
  id v5 = (void *)sharedSettingsModel_sharedModel_4359;
  sharedSettingsModel_sharedModel_4359 = v4;

  id v13 = +[CSLPRFPerApplicationSettings fakeApplicationWithIdentifier:@"com.apple.NanoAllMusicApps"];
  id v6 = +[CSLPRFPerApplicationSettings fakeApplicationWithIdentifier:@"com.apple.NanoAllWorkoutApps"];
  char v7 = +[CSLPRFPerApplicationSettings fakeApplicationWithIdentifier:@"com.apple.SafetyMonitorApp"];
  id v8 = [(id)sharedSettingsModel_sharedModel_4359 settingsForApplication:v7];
  [v8 updateSettingsWithBlock:&__block_literal_global_4360];
  id v9 = (id)[(id)sharedSettingsModel_sharedModel_4359 settingsForApplication:v6];
  id v10 = (id)[(id)sharedSettingsModel_sharedModel_4359 settingsForApplication:v13];
  uint64_t v11 = objc_opt_new();
  id v12 = (void *)sharedSettingsModel_customizationDelegate;
  sharedSettingsModel_customizationDelegate = v11;

  [(id)sharedSettingsModel_sharedModel_4359 setCustomizationDelegate:sharedSettingsModel_customizationDelegate];
  [*(id *)(a1 + 32) migrateLegacySettings:sharedSettingsModel_sharedModel_4359];
  if (os_variant_has_internal_diagnostics()) {
    os_state_add_handler();
  }
}

os_state_data_s *__54__CSLPRFLiveActivitiesAppSettings_sharedSettingsModel__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[CSLPRFLiveActivitiesAppSettings _stateDataWithHints:a2];
}

void __54__CSLPRFLiveActivitiesAppSettings_sharedSettingsModel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAllowLiveActivitiesForApp:1];
  [v2 setAutoLaunchBehaviorForApp:1];
}

+ (const)notificationName
{
  return "CSLSLiveActivitiesAppSettingsChangedNotification";
}

+ (id)settingsKey
{
  return @"LiveActivitiesAppSettings";
}

+ (Class)serializationClass
{
  return (Class)objc_opt_class();
}

+ (id)globalDefaultIdentifer
{
  return @"com.apple.Carousel.AllApps";
}

+ (unint64_t)categoryForApplication:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 bundleIdentifier];
  id v5 = +[CSLPRFLiveActivitiesAppSettings globalDefaultIdentifer];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v8 = [v3 bundleIdentifier];
    if ([v8 isEqualToString:@"com.apple.NanoAllMusicApps"])
    {

LABEL_6:
      unint64_t v7 = 0;
      goto LABEL_21;
    }
    id v9 = [v3 bundleIdentifier];
    char v10 = [v9 isEqualToString:@"com.apple.NanoAllWorkoutApps"];

    if (v10) {
      goto LABEL_6;
    }
    uint64_t v11 = (void *)MEMORY[0x263F01878];
    id v12 = [v3 bundleIdentifier];
    id v23 = 0;
    id v13 = [v11 bundleRecordWithApplicationIdentifier:v12 error:&v23];
    id v14 = v23;

    if (v14)
    {
      long long v15 = cslprf_app_library_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v3 bundleIdentifier];
        *(_DWORD *)buf = 138412546;
        objc_super v25 = v21;
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_error_impl(&dword_22F4EA000, v15, OS_LOG_TYPE_ERROR, "Error reading category for application %@ - error: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v16 = objc_opt_class();
      id v17 = v13;
      if (v16)
      {
        if (objc_opt_isKindOfClass()) {
          id v18 = v17;
        }
        else {
          id v18 = 0;
        }
      }
      else
      {
        id v18 = 0;
      }
      long long v15 = v18;

      if (v15)
      {
        if ([v15 supportsLiveActivities]) {
          unint64_t v7 = 1;
        }
        else {
          unint64_t v7 = 2;
        }
        goto LABEL_20;
      }
      id v20 = cslprf_app_library_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        char v22 = [v3 bundleIdentifier];
        *(_DWORD *)buf = 138412290;
        objc_super v25 = v22;
        _os_log_error_impl(&dword_22F4EA000, v20, OS_LOG_TYPE_ERROR, "Error record from proxy for application %@", buf, 0xCu);
      }
      long long v15 = 0;
    }
    unint64_t v7 = 2;
LABEL_20:

    goto LABEL_21;
  }
  unint64_t v7 = 3;
LABEL_21:

  return v7;
}

+ (id)globalSettingsWithSerialization:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = [a1 globalDefaultIdentifer];
  char v10 = +[CSLPRFPerApplicationSettings fakeApplicationWithIdentifier:v9];
  uint64_t v11 = (void *)[v8 initForApplication:v10 isGlobalDefault:1 withSerialization:v7 delegate:v6];

  return v11;
}

+ (id)settingsForApplication:(id)a3 withSerialization:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initForApplication:v10 isGlobalDefault:0 withSerialization:v9 delegate:v8];

  return v11;
}

- (void)setAutoLaunchBehaviorForApp:(unint64_t)a3 withIgnoredSpecifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = cslprf_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 134218754;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_debug_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEBUG, "%p %@:%lu %@", buf, 0x2Au);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __97__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setAutoLaunchBehaviorForApp_withIgnoredSpecifier___block_invoke;
  v9[3] = &__block_descriptor_40_e52_v16__0___CSLPRFLiveActivitiesAppMutableProperties__8l;
  v9[4] = a3;
  [(CSLPRFLiveActivitiesAppSettings *)self updateSettingsWithBlock:v9];
}

uint64_t __97__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setAutoLaunchBehaviorForApp_withIgnoredSpecifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAutoLaunchBehaviorForApp:*(void *)(a1 + 32)];
}

- (unint64_t)autoLaunchBehaviorForAppWithIgnoredSpecifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = 134218498;
    id v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "%p %@ %@", (uint8_t *)&v8, 0x20u);
  }
  return [(CSLPRFLiveActivitiesAppSettings *)self autoLaunchBehaviorForApp];
}

- (void)setAllowLiveActivitiesForApp:(id)a3 withIgnoredSpecifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = cslprf_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 134218754;
    id v13 = self;
    __int16 v14 = 2112;
    unint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = self;
    _os_log_debug_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEBUG, "%p %@:%@ %@", buf, 0x2Au);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __98__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setAllowLiveActivitiesForApp_withIgnoredSpecifier___block_invoke;
  v10[3] = &unk_264A0BBF0;
  id v11 = v6;
  id v8 = v6;
  [(CSLPRFLiveActivitiesAppSettings *)self updateSettingsWithBlock:v10];
}

void __98__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setAllowLiveActivitiesForApp_withIgnoredSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setAllowLiveActivitiesForApp:", objc_msgSend(v2, "BOOLValue") ^ 1);
}

- (id)allowLiveActivitiesForAppWithIgnoredSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 134218498;
    __int16 v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "%p %@ %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[CSLPRFLiveActivitiesAppSettings allowLiveActivitiesForApp](self, "allowLiveActivitiesForApp") ^ 1);
  return v6;
}

- (void)setGlobalAutoLaunchLiveActivities:(id)a3 withIgnoredSpecifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = cslprf_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 134218754;
    __int16 v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = self;
    _os_log_debug_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEBUG, "%p %@:%@ %@", buf, 0x2Au);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __103__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setGlobalAutoLaunchLiveActivities_withIgnoredSpecifier___block_invoke;
  v10[3] = &unk_264A0BBF0;
  id v11 = v6;
  id v8 = v6;
  [(CSLPRFLiveActivitiesAppSettings *)self updateSettingsWithBlock:v10];
}

void __103__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setGlobalAutoLaunchLiveActivities_withIgnoredSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setGlobalAutoLaunchLiveActivities:", objc_msgSend(v2, "BOOLValue") ^ 1);
}

- (id)globalAutoLaunchLiveActivitiesWithIgnoredSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 134218498;
    __int16 v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "%p %@ %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[CSLPRFLiveActivitiesAppSettings globalAutoLaunchLiveActivities](self, "globalAutoLaunchLiveActivities") ^ 1);
  return v6;
}

- (void)setGlobalAllowLiveActivities:(id)a3 withIgnoredSpecifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = cslprf_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 134218754;
    __int16 v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = self;
    _os_log_debug_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEBUG, "%p %@:%@ %@", buf, 0x2Au);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __98__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setGlobalAllowLiveActivities_withIgnoredSpecifier___block_invoke;
  v10[3] = &unk_264A0BBF0;
  id v11 = v6;
  id v8 = v6;
  [(CSLPRFLiveActivitiesAppSettings *)self updateSettingsWithBlock:v10];
}

void __98__CSLPRFLiveActivitiesAppSettings_PSSpecifier__setGlobalAllowLiveActivities_withIgnoredSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setGlobalAllowLiveActivities:", objc_msgSend(v2, "BOOLValue") ^ 1);
}

- (id)globalAllowLiveActivitiesWithIgnoredSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 134218498;
    __int16 v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "%p %@ %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[CSLPRFLiveActivitiesAppSettings globalAllowLiveActivities](self, "globalAllowLiveActivities") ^ 1);
  return v6;
}

@end