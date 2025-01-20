@interface CSLPRFAppBacklightPrivacySettings
+ (Class)serializationClass;
+ (const)notificationName;
+ (id)globalDefaultIdentifer;
+ (id)globalSettingsWithSerialization:(id)a3 delegate:(id)a4;
+ (id)settingsForApplication:(id)a3 withSerialization:(id)a4 delegate:(id)a5;
+ (id)settingsKey;
+ (id)sharedSettingsModel;
+ (unint64_t)categoryForApplication:(id)a3;
- (BOOL)hasCustomSetting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSettings:(id)a3;
- (BOOL)isGlobalDefault;
- (BOOL)privacyDuringAlwaysOnForApp;
- (BOOL)privacyDuringAlwaysOnForLiveActivities;
- (BOOL)privacyDuringAlwaysOnForNotification;
- (BOOL)watchAppSupportsAlwaysOnDisplay;
- (CSLPRFApplication)application;
- (NSString)description;
- (NSString)identifier;
- (id)initForApplication:(id)a3 isGlobalDefault:(BOOL)a4 withSerialization:(id)a5 delegate:(id)a6;
- (id)privacyDuringAlwaysOnForAppWithIgnoredSpecifier:(id)a3;
- (id)privacyDuringAlwaysOnForLiveActivitiesWithIgnoredSpecifier:(id)a3;
- (id)privacyDuringAlwaysOnForNotificationWithIgnoredSpecifier:(id)a3;
- (id)resolvedSettingWithGlobalSettings:(id)a3;
- (id)serialize;
- (unint64_t)category;
- (unint64_t)hash;
- (void)setPrivacyDuringAlwaysOnForApp:(id)a3 withIgnoredSpecifier:(id)a4;
- (void)setPrivacyDuringAlwaysOnForLiveActivities:(id)a3 withIgnoredSpecifier:(id)a4;
- (void)setPrivacyDuringAlwaysOnForNotification:(id)a3 withIgnoredSpecifier:(id)a4;
- (void)updateSettingsWithBlock:(id)a3;
@end

@implementation CSLPRFAppBacklightPrivacySettings

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_application, 0);
}

- (unint64_t)category
{
  return self->_category;
}

- (CSLPRFApplication)application
{
  return self->_application;
}

- (BOOL)isGlobalDefault
{
  return self->_isGlobalDefault;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForApp](self, "privacyDuringAlwaysOnForApp"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForNotification](self, "privacyDuringAlwaysOnForNotification"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForLiveActivities](self, "privacyDuringAlwaysOnForLiveActivities"));
  id v7 = (id)[v3 appendObject:self->_application];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(CSLPRFAppBacklightPrivacySettings *)self privacyDuringAlwaysOnForApp];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke;
  v28[3] = &unk_264A0BCF8;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v28];
  BOOL v9 = [(CSLPRFAppBacklightPrivacySettings *)self privacyDuringAlwaysOnForNotification];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke_2;
  v26[3] = &unk_264A0BCF8;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendBool:v9 counterpart:v26];
  BOOL v12 = [(CSLPRFAppBacklightPrivacySettings *)self privacyDuringAlwaysOnForLiveActivities];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke_3;
  v24[3] = &unk_264A0BCF8;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v24];
  application = self->_application;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke_4;
  v22 = &unk_264A0BBC8;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendObject:application counterpart:&v19];
  LOBYTE(application) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return (char)application;
}

uint64_t __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) privacyDuringAlwaysOnForApp];
}

uint64_t __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) privacyDuringAlwaysOnForNotification];
}

uint64_t __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) privacyDuringAlwaysOnForLiveActivities];
}

uint64_t __45__CSLPRFAppBacklightPrivacySettings_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) application];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForApp](self, "privacyDuringAlwaysOnForApp"), @"privacyForApp");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForNotification](self, "privacyDuringAlwaysOnForNotification"), @"privacyForNotification");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForLiveActivities](self, "privacyDuringAlwaysOnForLiveActivities"), @"privacyForLiveActivities");
  id v7 = (id)[v3 appendObject:self->_application withName:@"application"];
  id v8 = [v3 build];

  return (NSString *)v8;
}

- (id)serialize
{
  v16[3] = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_privacyDuringAlwaysOnForApp = self->_lock_privacyDuringAlwaysOnForApp;
  int lock_privacyDuringAlwaysOnForNotification = self->_lock_privacyDuringAlwaysOnForNotification;
  BOOL lock_privacyDuringAlwaysOnForLiveActivities = self->_lock_privacyDuringAlwaysOnForLiveActivities;
  os_unfair_lock_unlock(p_lock);
  int v7 = [(CSLPRFApplication *)self->_application defaultsToPrivateAlwaysOnDisplayTreatment];
  if (!lock_privacyDuringAlwaysOnForLiveActivities
    && lock_privacyDuringAlwaysOnForApp == v7
    && lock_privacyDuringAlwaysOnForNotification == v7)
  {
    id v13 = 0;
  }
  else
  {
    v15[0] = @"AppPrivateDuringAOTForApp";
    id v10 = [NSNumber numberWithBool:lock_privacyDuringAlwaysOnForApp != 0];
    v16[0] = v10;
    v15[1] = @"AppPrivateDuringAOTForNotification";
    id v11 = [NSNumber numberWithBool:lock_privacyDuringAlwaysOnForNotification != 0];
    v16[1] = v11;
    v15[2] = @"AppPrivateDuringAOTForLiveActivities";
    BOOL v12 = [NSNumber numberWithBool:lock_privacyDuringAlwaysOnForLiveActivities];
    v16[2] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  }
  return v13;
}

- (id)resolvedSettingWithGlobalSettings:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    id v5 = [[CSLPRFAppBacklightPrivacyResolvedSettings alloc] initWithSettings:self globalSettings:v4];
  }
  else {
    id v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isEqualToSettings:(id)a3
{
  return CSLPRFEqualAppBacklightPrivacySettingsValues(self, a3);
}

- (void)updateSettingsWithBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, CSLPRFAppBacklightPrivacyMutableSettings *))a3;
  if (self->_category == 2)
  {
    cslprf_app_library_log();
    id v5 = (CSLPRFAppBacklightPrivacyMutableSettings *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_FAULT))
    {
      WeakRetained = [(CSLPRFApplication *)self->_application bundleIdentifier];
      application = self->_application;
      int v8 = 134218498;
      BOOL v9 = self;
      __int16 v10 = 2114;
      id v11 = WeakRetained;
      __int16 v12 = 2112;
      id v13 = application;
      _os_log_fault_impl(&dword_22F4EA000, &v5->super, OS_LOG_TYPE_FAULT, "%p cannot set settings on excluded application:%{public}@:%@", (uint8_t *)&v8, 0x20u);
LABEL_6:
    }
  }
  else
  {
    id v5 = [[CSLPRFAppBacklightPrivacyMutableSettings alloc] initWithSettings:self];
    v4[2](v4, v5);
    if (![(CSLPRFAppBacklightPrivacyMutableSettings *)v5 isEqualToSettings:self])
    {
      os_unfair_lock_lock(&self->_lock);
      self->_int lock_privacyDuringAlwaysOnForApp = [(CSLPRFAppBacklightPrivacyMutableSettings *)v5 privacyDuringAlwaysOnForApp];
      self->_int lock_privacyDuringAlwaysOnForNotification = [(CSLPRFAppBacklightPrivacyMutableSettings *)v5 privacyDuringAlwaysOnForNotification];
      self->_BOOL lock_privacyDuringAlwaysOnForLiveActivities = [(CSLPRFAppBacklightPrivacyMutableSettings *)v5 privacyDuringAlwaysOnForLiveActivities];
      os_unfair_lock_unlock(&self->_lock);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained didUpdateSettings:self];
      goto LABEL_6;
    }
  }
}

- (BOOL)privacyDuringAlwaysOnForLiveActivities
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_privacyDuringAlwaysOnForLiveActivities;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)privacyDuringAlwaysOnForNotification
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_privacyDuringAlwaysOnForNotification;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)privacyDuringAlwaysOnForApp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_privacyDuringAlwaysOnForApp;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)hasCustomSetting
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = [(CSLPRFApplication *)self->_application defaultsToPrivateAlwaysOnDisplayTreatment];
  int lock_privacyDuringAlwaysOnForApp = self->_lock_privacyDuringAlwaysOnForApp;
  BOOL v6 = lock_privacyDuringAlwaysOnForApp != v4
    || self->_lock_privacyDuringAlwaysOnForNotification != lock_privacyDuringAlwaysOnForApp
    || self->_lock_privacyDuringAlwaysOnForLiveActivities;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)watchAppSupportsAlwaysOnDisplay
{
  return [(CSLPRFApplication *)self->_application supportsAlwaysOnDisplay];
}

- (NSString)identifier
{
  return (NSString *)[(CSLPRFApplication *)self->_application bundleIdentifier];
}

- (id)initForApplication:(id)a3 isGlobalDefault:(BOOL)a4 withSerialization:(id)a5 delegate:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CSLPRFAppBacklightPrivacySettings;
  uint64_t v14 = [(CSLPRFAppBacklightPrivacySettings *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_application, a3);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_isGlobalDefault = a4;
    uint64_t v16 = [v11 defaultsToPrivateAlwaysOnDisplayTreatment];
    v15->_int lock_privacyDuringAlwaysOnForApp = v16;
    *(_WORD *)&v15->_int lock_privacyDuringAlwaysOnForNotification = v16;
    v15->_category = +[CSLPRFAppBacklightPrivacySettings categoryForApplication:v11];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v12;
        v15->_int lock_privacyDuringAlwaysOnForApp = objc_msgSend(v17, "cslprf_BOOLForKey:withDefaultValue:", @"AppPrivateDuringAOTForApp", v16);
        v15->_int lock_privacyDuringAlwaysOnForNotification = objc_msgSend(v17, "cslprf_BOOLForKey:withDefaultValue:", @"AppPrivateDuringAOTForNotification", v16);
        char v18 = objc_msgSend(v17, "cslprf_BOOLForKey:withDefaultValue:", @"AppPrivateDuringAOTForLiveActivities", 0);

        v15->_BOOL lock_privacyDuringAlwaysOnForLiveActivities = v18;
      }
      else
      {
        uint64_t v19 = cslprf_app_library_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218242;
          id v23 = v15;
          __int16 v24 = 2112;
          id v25 = v12;
          _os_log_fault_impl(&dword_22F4EA000, v19, OS_LOG_TYPE_FAULT, "%p CSLPRFAppBacklightPrivacySettings serialization was not a NSDictionary:%@", buf, 0x16u);
        }
      }
    }
  }

  return v15;
}

+ (id)sharedSettingsModel
{
  if (sharedSettingsModel_onceToken != -1) {
    dispatch_once(&sharedSettingsModel_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)sharedSettingsModel_sharedModel;
  return v2;
}

void __56__CSLPRFAppBacklightPrivacySettings_sharedSettingsModel__block_invoke()
{
  v0 = [CSLPRFPerApplicationSettingsModel alloc];
  id v3 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:2];
  uint64_t v1 = [(CSLPRFPerApplicationSettingsModel *)v0 initWithApplicationLibrary:v3 perApplicationSettingsClass:objc_opt_class()];
  v2 = (void *)sharedSettingsModel_sharedModel;
  sharedSettingsModel_sharedModel = v1;
}

+ (const)notificationName
{
  return "CSLSAppBacklightPrivacySettingsChangedNotification";
}

+ (id)settingsKey
{
  return @"AppBacklightPrivacySettings";
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
  id v3 = a3;
  if (categoryForApplication__onceToken != -1) {
    dispatch_once(&categoryForApplication__onceToken, &__block_literal_global);
  }
  if ([v3 isBBSourcedApplication])
  {
    int v4 = (void *)categoryForApplication__appsWhichCannotBeMarkedPrivate;
    id v5 = [v3 bundleIdentifier];
    LODWORD(v4) = [v4 containsObject:v5];

    if (v4) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = 1;
    }
  }
  else if ([v3 supportsAlwaysOnDisplay])
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = 2;
  }

  return v6;
}

void __60__CSLPRFAppBacklightPrivacySettings_categoryForApplication___block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"com.apple.facetime";
  v4[1] = @"com.apple.tips";
  v4[2] = @"com.apple.TapToRadar";
  v4[3] = @"com.apple.Bridge";
  v4[4] = @"com.apple.Sharing.Remote";
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)categoryForApplication__appsWhichCannotBeMarkedPrivate;
  categoryForApplication__appsWhichCannotBeMarkedPrivate = v2;
}

+ (id)globalSettingsWithSerialization:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  BOOL v9 = [a1 globalDefaultIdentifer];
  __int16 v10 = +[CSLPRFPerApplicationSettings fakeApplicationWithIdentifier:v9];
  id v11 = (void *)[v8 initForApplication:v10 isGlobalDefault:1 withSerialization:v7 delegate:v6];

  return v11;
}

+ (id)settingsForApplication:(id)a3 withSerialization:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initForApplication:v10 isGlobalDefault:0 withSerialization:v9 delegate:v8];

  return v11;
}

- (void)setPrivacyDuringAlwaysOnForLiveActivities:(id)a3 withIgnoredSpecifier:(id)a4
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
    v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = self;
    _os_log_debug_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEBUG, "%p %@:%@ %@", buf, 0x2Au);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __113__CSLPRFAppBacklightPrivacySettings_PSSpecifier__setPrivacyDuringAlwaysOnForLiveActivities_withIgnoredSpecifier___block_invoke;
  v10[3] = &unk_264A0AB80;
  id v11 = v6;
  id v8 = v6;
  [(CSLPRFAppBacklightPrivacySettings *)self updateSettingsWithBlock:v10];
}

void __113__CSLPRFAppBacklightPrivacySettings_PSSpecifier__setPrivacyDuringAlwaysOnForLiveActivities_withIgnoredSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPrivacyDuringAlwaysOnForLiveActivities:", objc_msgSend(v2, "BOOLValue") ^ 1);
}

- (id)privacyDuringAlwaysOnForLiveActivitiesWithIgnoredSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "%p %@ %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForLiveActivities](self, "privacyDuringAlwaysOnForLiveActivities") ^ 1);
  return v6;
}

- (void)setPrivacyDuringAlwaysOnForNotification:(id)a3 withIgnoredSpecifier:(id)a4
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
  v10[2] = __111__CSLPRFAppBacklightPrivacySettings_PSSpecifier__setPrivacyDuringAlwaysOnForNotification_withIgnoredSpecifier___block_invoke;
  v10[3] = &unk_264A0AB80;
  id v11 = v6;
  id v8 = v6;
  [(CSLPRFAppBacklightPrivacySettings *)self updateSettingsWithBlock:v10];
}

void __111__CSLPRFAppBacklightPrivacySettings_PSSpecifier__setPrivacyDuringAlwaysOnForNotification_withIgnoredSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPrivacyDuringAlwaysOnForNotification:", objc_msgSend(v2, "BOOLValue") ^ 1);
}

- (id)privacyDuringAlwaysOnForNotificationWithIgnoredSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "%p %@ %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForNotification](self, "privacyDuringAlwaysOnForNotification") ^ 1);
  return v6;
}

- (void)setPrivacyDuringAlwaysOnForApp:(id)a3 withIgnoredSpecifier:(id)a4
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
  v10[2] = __102__CSLPRFAppBacklightPrivacySettings_PSSpecifier__setPrivacyDuringAlwaysOnForApp_withIgnoredSpecifier___block_invoke;
  v10[3] = &unk_264A0AB80;
  id v11 = v6;
  id v8 = v6;
  [(CSLPRFAppBacklightPrivacySettings *)self updateSettingsWithBlock:v10];
}

void __102__CSLPRFAppBacklightPrivacySettings_PSSpecifier__setPrivacyDuringAlwaysOnForApp_withIgnoredSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPrivacyDuringAlwaysOnForApp:", objc_msgSend(v2, "BOOLValue") ^ 1);
}

- (id)privacyDuringAlwaysOnForAppWithIgnoredSpecifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = cslprf_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_debug_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEBUG, "%p %@ %@", (uint8_t *)&v9, 0x20u);
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[CSLPRFAppBacklightPrivacySettings privacyDuringAlwaysOnForApp](self, "privacyDuringAlwaysOnForApp") ^ 1);
  return v6;
}

@end