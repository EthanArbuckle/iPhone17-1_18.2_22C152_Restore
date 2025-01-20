@interface IPWatchLocaleController
- (BOOL)isMirroringEnabled;
- (IPWatchLocaleController)init;
- (IPWatchLocaleController)initWithSystemLanguages:(id)a3;
- (NPSDomainAccessor)gizmoGlobalDomain;
- (NPSManager)syncManager;
- (NSArray)systemLanguages;
- (id)deviceLanguage;
- (id)preferredLanguages;
- (void)initializeMirrorSettings;
- (void)mirrorLanguagesAndLocaleToWatch;
- (void)postLocaleChangedNotification;
- (void)resetTimeFormat;
- (void)setGizmoGlobalDomain:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setLocale:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)setSystemLanguages:(id)a3;
- (void)updateLocale:(id)a3;
@end

@implementation IPWatchLocaleController

- (IPWatchLocaleController)init
{
  return [(IPWatchLocaleController *)self initWithSystemLanguages:0];
}

- (IPWatchLocaleController)initWithSystemLanguages:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPWatchLocaleController;
  v6 = [(IPWatchLocaleController *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@".GlobalPreferences"];
    gizmoGlobalDomain = v6->_gizmoGlobalDomain;
    v6->_gizmoGlobalDomain = (NPSDomainAccessor *)v7;

    v9 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    syncManager = v6->_syncManager;
    v6->_syncManager = v9;

    objc_storeStrong((id *)&v6->_systemLanguages, a3);
  }

  return v6;
}

- (id)preferredLanguages
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  id v4 = (id)[v3 synchronize];

  id v5 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  v6 = [v5 objectForKey:@"AppleLanguages"];

  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9[0] = @"en-001";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

    v6 = (void *)v7;
  }
  return v6;
}

- (void)setLanguages:(id)a3
{
  id v4 = a3;
  id v5 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  [v5 setObject:v4 forKey:@"AppleLanguages"];

  v6 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  id v7 = (id)[v6 synchronize];

  v8 = [(IPWatchLocaleController *)self syncManager];
  v9 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  v10 = [v9 domain];
  v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"AppleLanguages"];
  [v8 synchronizeNanoDomain:v10 keys:v11];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.nano.watchlanguagechanged", 0, 0, 1u);
}

- (id)deviceLanguage
{
  v3 = [(IPWatchLocaleController *)self systemLanguages];
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v3 = [v4 localizations];
  }
  id v5 = (void *)MEMORY[0x1E4F28B50];
  v6 = [(IPWatchLocaleController *)self preferredLanguages];
  id v7 = [v5 preferredLocalizationsFromArray:v3 forPreferences:v6];
  v8 = [v7 firstObject];

  v9 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v8];

  return v9;
}

- (void)postLocaleChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.nano.watchlocalechanged", 0, 0, 1u);
}

- (void)updateLocale:(id)a3
{
  id v4 = a3;
  id v5 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  [v5 setObject:v4 forKey:@"AppleLocale"];

  v6 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  id v7 = (id)[v6 synchronize];

  id v11 = [(IPWatchLocaleController *)self syncManager];
  v8 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  v9 = [v8 domain];
  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"AppleLocale"];
  [v11 synchronizeNanoDomain:v9 keys:v10];
}

- (void)resetTimeFormat
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  [v3 setObject:0 forKey:@"AppleICUForce12HourTime"];

  id v4 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  id v5 = (id)[v4 synchronize];

  v6 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  [v6 setObject:0 forKey:@"AppleICUForce24HourTime"];

  v12[0] = @"AppleICUForce24HourTime";
  v12[1] = @"AppleICUForce12HourTime";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [(IPWatchLocaleController *)self syncManager];
  v9 = [(IPWatchLocaleController *)self gizmoGlobalDomain];
  v10 = [v9 domain];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  [v8 synchronizeNanoDomain:v10 keys:v11];
}

- (void)setLocale:(id)a3
{
  [(IPWatchLocaleController *)self updateLocale:a3];
  [(IPWatchLocaleController *)self resetTimeFormat];
  [(IPWatchLocaleController *)self postLocaleChangedNotification];
}

- (void)initializeMirrorSettings
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F79EF0] sharedInstance];
  int v4 = [v3 isPaired];

  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.bulletinboard.apps"];
    v6 = [v5 dictionaryForKey:@"com.apple.CompanionInternationalSettings"];
    id v7 = (void *)[v6 mutableCopy];

    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v8 = [v7 objectForKeyedSubscript:@"BPSNanoBulletinShowsCustomSettings"];
    if (!v8)
    {
      v9 = [(IPWatchLocaleController *)self preferredLanguages];
      v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      if ([v9 isEqualToArray:v10])
      {
        id v11 = Logger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315394;
          v20 = "-[IPWatchLocaleController initializeMirrorSettings]";
          __int16 v21 = 2114;
          v22 = v10;
          _os_log_impl(&dword_1BECA5000, v11, OS_LOG_TYPE_DEFAULT, "%s: Enabling language mirroring after initial pair (%{public}@).", (uint8_t *)&v19, 0x16u);
        }
        int v12 = 1;
      }
      else
      {
        id v11 = [(IPWatchLocaleController *)self deviceLanguage];
        v13 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
        int v14 = [v11 isEqualToString:v13];
        v15 = Logger();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            int v19 = 136315906;
            v20 = "-[IPWatchLocaleController initializeMirrorSettings]";
            __int16 v21 = 2114;
            v22 = v9;
            __int16 v23 = 2114;
            v24 = v10;
            __int16 v25 = 2114;
            v26 = v11;
            _os_log_impl(&dword_1BECA5000, v15, OS_LOG_TYPE_DEFAULT, "%s: Preferred languages don’t match (watch %{public}@ ≠ phone %{public}@). Enabling language mirroring because device languages match (%{public}@).", (uint8_t *)&v19, 0x2Au);
          }

          [(IPWatchLocaleController *)self mirrorLanguagesAndLocaleToWatch];
          int v12 = 1;
        }
        else
        {
          if (v16)
          {
            int v19 = 136316162;
            v20 = "-[IPWatchLocaleController initializeMirrorSettings]";
            __int16 v21 = 2114;
            v22 = v9;
            __int16 v23 = 2114;
            v24 = v10;
            __int16 v25 = 2114;
            v26 = v11;
            __int16 v27 = 2114;
            v28 = v13;
            _os_log_impl(&dword_1BECA5000, v15, OS_LOG_TYPE_DEFAULT, "%s: Preferred languages don’t match (watch %{public}@ ≠ phone %{public}@). Disabling language mirroring because device language doesn’t match (watch %{public}@ ≠ phone %{public}@).", (uint8_t *)&v19, 0x34u);
          }

          int v12 = 0;
        }
      }
      v17 = [NSNumber numberWithInt:v12 ^ 1u];
      [v7 setObject:v17 forKeyedSubscript:@"BPSNanoBulletinShowsCustomSettings"];

      [v5 setObject:v7 forKey:@"com.apple.CompanionInternationalSettings"];
      id v18 = (id)[v5 synchronize];
    }
  }
}

- (BOOL)isMirroringEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.bulletinboard.apps"];
  v3 = [v2 dictionaryForKey:@"com.apple.CompanionInternationalSettings"];
  int v4 = [v3 objectForKeyedSubscript:@"BPSNanoBulletinShowsCustomSettings"];
  char v5 = [v4 BOOLValue] ^ 1;

  return v5;
}

- (void)mirrorLanguagesAndLocaleToWatch
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = Logger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[IPWatchLocaleController mirrorLanguagesAndLocaleToWatch]";
    _os_log_impl(&dword_1BECA5000, v3, OS_LOG_TYPE_DEFAULT, "%s: Mirroring languages and locale to watch…", (uint8_t *)&v7, 0xCu);
  }

  int v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [(IPWatchLocaleController *)self setLanguages:v4];

  char v5 = [MEMORY[0x1E4F1CA20] preferredLocale];
  v6 = [v5 localeIdentifier];
  [(IPWatchLocaleController *)self setLocale:v6];
}

- (NPSDomainAccessor)gizmoGlobalDomain
{
  return self->_gizmoGlobalDomain;
}

- (void)setGizmoGlobalDomain:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (NSArray)systemLanguages
{
  return self->_systemLanguages;
}

- (void)setSystemLanguages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguages, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_gizmoGlobalDomain, 0);
}

@end