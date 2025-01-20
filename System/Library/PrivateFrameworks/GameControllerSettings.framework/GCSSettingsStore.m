@interface GCSSettingsStore
- (BOOL)savedDataMeetsRequiredVersion:(id)a3;
- (BOOL)showGCPreferencesPane;
- (GCSControllers)controllers;
- (GCSCopilotFusedControllers)copilotFusedControllers;
- (GCSGames)games;
- (GCSMouseProfiles)mouseProfiles;
- (GCSProfiles)profiles;
- (GCSSettingsStore)initWithUserDefaults:(id)a3;
- (NSString)settingsVersion;
- (id)profileForPersistentControllerIdentifier:(id)a3 appBundleIdentifier:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSettingsVersion:(id)a3;
- (void)setShowGCPreferencesPane:(BOOL)a3;
@end

@implementation GCSSettingsStore

- (GCSSettingsStore)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GCSSettingsStore;
  v6 = [(GCSSettingsStore *)&v20 init];
  v7 = v6;
  if (v6)
  {
    settingsVersion = v6->_settingsVersion;
    v6->_settingsVersion = (NSString *)@"0.0.0";

    objc_storeStrong((id *)&v7->_defaults, a3);
    [(GCUserDefaults *)v7->_defaults addObserver:v7 forKeyPath:@"settingsVersion" options:5 context:0];
    v9 = [[GCSGamesCollection alloc] initWithSettingsStore:v7 userDefaults:v7->_defaults];
    games = v7->_games;
    v7->_games = (GCSGames *)v9;

    v11 = [[GCSProfilesCollection alloc] initWithSettingsStore:v7 userDefaults:v7->_defaults];
    profiles = v7->_profiles;
    v7->_profiles = (GCSProfiles *)v11;

    v13 = [[GCSMouseProfilesCollection alloc] initWithSettingsStore:v7 userDefaults:v7->_defaults];
    mouseProfiles = v7->_mouseProfiles;
    v7->_mouseProfiles = (GCSMouseProfiles *)v13;

    v15 = [[GCSControllersCollection alloc] initWithSettingsStore:v7 userDefaults:v7->_defaults];
    controllers = v7->_controllers;
    v7->_controllers = (GCSControllers *)v15;

    v17 = [[GCSCopilotFusedControllersCollection alloc] initWithSettingsStore:v7 userDefaults:v7->_defaults];
    copilotFusedControllers = v7->_copilotFusedControllers;
    v7->_copilotFusedControllers = (GCSCopilotFusedControllers *)v17;
  }
  return v7;
}

- (BOOL)showGCPreferencesPane
{
  return [(GCUserDefaults *)self->_defaults BOOLForKey:@"showGCPrefsPane"];
}

- (void)setShowGCPreferencesPane:(BOOL)a3
{
  [(GCUserDefaults *)self->_defaults setBool:a3 forKey:@"showGCPrefsPane"];
  notify_post("com.apple.systemsettings.extensions.didchange");
}

- (id)profileForPersistentControllerIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [(GCSGames *)self->_games gameWithBundleIdentifier:a4];
  if (!v7)
  {
    games = self->_games;
    v9 = +[GCSGame defaultIdentifier];
    v7 = [(GCSGames *)games gameWithBundleIdentifier:v9];
  }
  v10 = [v7 profileUUIDForPersistentControllerIdentifier:v6];
  if (v10)
  {
    v11 = [(GCSProfiles *)self->_profiles profileForIdentifier:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)savedDataMeetsRequiredVersion:(id)a3
{
  v4 = [a3 shortenedVersionNumberString];
  id v5 = [(NSString *)self->_settingsVersion shortenedVersionNumberString];
  BOOL v6 = [v4 compare:v5 options:64] != 1;

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"settingsVersion"])
  {
    v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(GCSSettingsStore *)self setSettingsVersion:v13];
      v14 = getGCSLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
    }
    else
    {
      [(GCSSettingsStore *)self setSettingsVersion:@"0.0.0"];
      v14 = getGCSLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_7:
        v15 = [(GCSSettingsStore *)self settingsVersion];
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_22128F000, v14, OS_LOG_TYPE_INFO, "GCSSettingsStore.settingsVersion = %@", buf, 0xCu);
      }
    }

    goto LABEL_9;
  }
  v16.receiver = self;
  v16.super_class = (Class)GCSSettingsStore;
  [(GCSSettingsStore *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  v13 = v12;
LABEL_9:
}

- (void)dealloc
{
  [(GCUserDefaults *)self->_defaults removeObserver:self forKeyPath:@"settingsVersion" context:0];
  v3.receiver = self;
  v3.super_class = (Class)GCSSettingsStore;
  [(GCSSettingsStore *)&v3 dealloc];
}

- (NSString)settingsVersion
{
  return self->_settingsVersion;
}

- (void)setSettingsVersion:(id)a3
{
}

- (GCSGames)games
{
  return self->_games;
}

- (GCSProfiles)profiles
{
  return self->_profiles;
}

- (GCSMouseProfiles)mouseProfiles
{
  return self->_mouseProfiles;
}

- (GCSControllers)controllers
{
  return self->_controllers;
}

- (GCSCopilotFusedControllers)copilotFusedControllers
{
  return self->_copilotFusedControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copilotFusedControllers, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_mouseProfiles, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_games, 0);
  objc_storeStrong((id *)&self->_settingsVersion, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end