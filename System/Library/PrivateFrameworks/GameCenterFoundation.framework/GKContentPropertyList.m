@interface GKContentPropertyList
+ (id)localPropertyListForGameDescriptor:(id)a3;
- (NSDictionary)root;
- (NSString)bundleID;
- (id)_mainBundle;
- (id)_rootDictionary;
- (id)achievementDescriptionForIdentifier:(id)a3;
- (id)achievementDescriptions;
- (id)imageNameForDashboardLogo;
- (id)leaderboardDescriptionForIdentifier:(id)a3;
- (id)leaderboardDescriptions;
- (id)leaderboardSetDescriptionForIdentifier:(id)a3;
- (id)leaderboardSetDescriptions;
- (id)localizedStringForKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setRoot:(id)a3;
@end

@implementation GKContentPropertyList

+ (id)localPropertyListForGameDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v5 _rootDictionary];
  v7 = [v6 objectForKeyedSubscript:@"GKPropertyListVersion"];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (int)[v7 intValue] <= 0)
  {
    v10 = [v4 objectForKeyedSubscript:@"bundle-id"];
    [v5 setBundleID:v10];

    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_mainBundle
{
  v3 = +[GKApplicationWorkspace defaultWorkspace];
  id v4 = [v3 applicationProxyForBundleID:self->_bundleID];
  id v5 = [v4 bundle];

  return v5;
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(GKContentPropertyList *)self _mainBundle];
  v6 = [v5 _gkSystemLocalizedStringForKey:v4 value:v4 table:@"GKGameCenter"];

  return v6;
}

- (id)imageNameForDashboardLogo
{
  v2 = [(GKContentPropertyList *)self _rootDictionary];
  v3 = [v2 objectForKeyedSubscript:@"GKDashboardImages"];
  id v4 = [v3 objectForKeyedSubscript:@"logoImageName"];

  return v4;
}

- (id)_rootDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(GKContentPropertyList *)self root];
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:self->_bundleID];
    id v5 = v4;
    if (v4)
    {
      v6 = [v4 pathForResource:@"GKGameCenterContent" ofType:@"plist"];
      v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
      if (v7)
      {
        id v17 = 0;
        v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v17];
        id v8 = (NSString *)v17;
        if (!v3)
        {
          v9 = os_log_GKGeneral;
          if (!os_log_GKGeneral)
          {
            id v10 = GKOSLoggers();
            v9 = os_log_GKGeneral;
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v8;
            _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "reading content plist: %@", buf, 0xCu);
          }
        }
        [(GKContentPropertyList *)self setRoot:v3];
      }
      else
      {
        v14 = os_log_GKGeneral;
        if (!os_log_GKGeneral)
        {
          id v15 = GKOSLoggers();
          v14 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v6;
          _os_log_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_INFO, "can't read file from path: %@", buf, 0xCu);
        }
        v3 = 0;
      }
    }
    else
    {
      v11 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v12 = GKOSLoggers();
        v11 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        bundleID = self->_bundleID;
        *(_DWORD *)buf = 138412290;
        v19 = bundleID;
        _os_log_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_INFO, "no bundle for bundleID: %@", buf, 0xCu);
      }
      v3 = 0;
    }
  }

  return v3;
}

- (id)leaderboardDescriptions
{
  v2 = [(GKContentPropertyList *)self _rootDictionary];
  v3 = [v2 objectForKeyedSubscript:@"GKLeaderboards"];

  return v3;
}

- (id)leaderboardSetDescriptions
{
  v2 = [(GKContentPropertyList *)self _rootDictionary];
  v3 = [v2 objectForKeyedSubscript:@"GKLeaderboardSets"];

  return v3;
}

- (id)achievementDescriptionForIdentifier:(id)a3
{
  id v4 = a3;
  achievementsByIdentifier = self->_achievementsByIdentifier;
  if (!achievementsByIdentifier)
  {
    v6 = [(NSDictionary *)self->_root objectForKeyedSubscript:@"GKAchievements"];
    v7 = [v6 _gkMapDictionaryWithKeyPath:@"identifier"];
    id v8 = self->_achievementsByIdentifier;
    self->_achievementsByIdentifier = v7;

    achievementsByIdentifier = self->_achievementsByIdentifier;
  }
  v9 = [(NSDictionary *)achievementsByIdentifier objectForKeyedSubscript:v4];

  return v9;
}

- (id)leaderboardDescriptionForIdentifier:(id)a3
{
  id v4 = a3;
  leaderboardsByIdentifier = self->_leaderboardsByIdentifier;
  if (!leaderboardsByIdentifier)
  {
    v6 = [(NSDictionary *)self->_root objectForKeyedSubscript:@"GKLeaderboards"];
    v7 = [v6 _gkMapDictionaryWithKeyPath:@"identifier"];
    id v8 = self->_leaderboardsByIdentifier;
    self->_leaderboardsByIdentifier = v7;

    leaderboardsByIdentifier = self->_leaderboardsByIdentifier;
  }
  v9 = [(NSDictionary *)leaderboardsByIdentifier objectForKeyedSubscript:v4];

  return v9;
}

- (id)leaderboardSetDescriptionForIdentifier:(id)a3
{
  id v4 = a3;
  leaderboardSetsByIdentifier = self->_leaderboardSetsByIdentifier;
  if (!leaderboardSetsByIdentifier)
  {
    v6 = [(NSDictionary *)self->_root objectForKeyedSubscript:@"GKLeaderboardSets"];
    v7 = [v6 _gkMapDictionaryWithKeyPath:@"identifier"];
    id v8 = self->_leaderboardSetsByIdentifier;
    self->_leaderboardSetsByIdentifier = v7;

    leaderboardSetsByIdentifier = self->_leaderboardSetsByIdentifier;
  }
  v9 = [(NSDictionary *)leaderboardSetsByIdentifier objectForKeyedSubscript:v4];

  return v9;
}

- (id)achievementDescriptions
{
  v2 = [(GKContentPropertyList *)self _rootDictionary];
  v3 = [v2 objectForKeyedSubscript:@"GKAchievements"];

  return v3;
}

- (NSDictionary)root
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRoot:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardSetsByIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboardsByIdentifier, 0);
  objc_storeStrong((id *)&self->_achievementsByIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_root, 0);
}

@end