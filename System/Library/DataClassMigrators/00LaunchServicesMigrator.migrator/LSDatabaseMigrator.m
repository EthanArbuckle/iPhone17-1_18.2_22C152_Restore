@interface LSDatabaseMigrator
- (BOOL)performMigration;
- (BOOL)populateLSDatabase;
- (BOOL)removeAppRemovalRestrictionForTVOnUpgradeIfInstalled;
- (BOOL)removeTVAppSystemAppRemovedRestrictionFor12_3;
- (LSDatabaseMigrator)init;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation LSDatabaseMigrator

- (LSDatabaseMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)LSDatabaseMigrator;
  return [(LSDatabaseMigrator *)&v3 init];
}

- (id)dataClassName
{
  return @"LSDatabaseMigrator";
}

- (BOOL)populateLSDatabase
{
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 _LSPrivateNoteMigratorRunning];
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = +[LSApplicationRecord enumeratorWithOptions:0];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) bundleIdentifier];
        [v3 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v11 = [v3 count];
  if (!v11)
  {
    v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_349C(v12);
    }
  }
  if ([v2 _LSPrivateDatabaseNeedsRebuild])
  {
    v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "_LSPrivateDatabaseNeedsRebuild = YES, Forcing a database rebuild", v15, 2u);
    }

    [v2 _LSPrivateRebuildApplicationDatabasesForSystemApps:1 internal:1 user:1];
  }
  [v2 _LSPrivateUpdateAppRemovalRestrictions];

  return v11 != 0;
}

- (BOOL)removeTVAppSystemAppRemovedRestrictionFor12_3
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"LSHasRunRemoveTVAppRestrictionSentinelKey"];

  if (v4)
  {
    v5 = _LSDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Correct-TV-app-restriction migration has already run. Success!", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setBool:1 forKey:@"LSHasRunRemoveTVAppRestrictionSentinelKey"];

    v5 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v7 = [v5 _LSPrivateRemovedSystemAppIdentifiers];
    id v8 = [(id)v7 mutableCopy];

    LOBYTE(v7) = [(LSDatabaseMigrator *)self userDataDisposition];
    v9 = _LSDefaultLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((v7 & 4) != 0)
    {
      if (v10)
      {
        int v14 = 67109632;
        *(_DWORD *)v15 = [v5 applicationIsInstalled:@"com.apple.tv"];
        *(_WORD *)&v15[4] = 1024;
        *(_DWORD *)&v15[6] = [v8 containsObject:@"com.apple.tv"];
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = [v8 containsObject:@"com.apple.videos"] ^ 1;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "tv app migration bits: installed: %d removed: %d videos removed: %d", (uint8_t *)&v14, 0x14u);
      }

      id v11 = _LSDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        *(void *)v15 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "removedSystemApps = %@", (uint8_t *)&v14, 0xCu);
      }

      if ([v5 applicationIsInstalled:@"com.apple.tv"]
        && [v8 containsObject:@"com.apple.tv"]
        && ([v8 containsObject:@"com.apple.videos"] & 1) == 0)
      {
        v12 = _LSDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138543618;
          *(void *)v15 = @"com.apple.tv";
          *(_WORD *)&v15[8] = 2112;
          id v16 = v8;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "removing %{public}@ from removed system apps list %@", (uint8_t *)&v14, 0x16u);
        }

        [v8 removeObject:@"com.apple.tv"];
      }
    }
    else
    {
      if (v10)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Not migrating after backup restore, so only removing videos from removed system apps", (uint8_t *)&v14, 2u);
      }
    }
    [v8 removeObject:@"com.apple.videos"];
    [v5 _LSPrivateSetRemovedSystemAppIdentifiers:v8];
  }
  return 1;
}

- (BOOL)removeAppRemovalRestrictionForTVOnUpgradeIfInstalled
{
  if (([(LSDatabaseMigrator *)self userDataDisposition] & 2) != 0)
  {
    v2 = +[LSApplicationWorkspace defaultWorkspace];
    id v3 = [v2 _LSPrivateRemovedSystemAppIdentifiers];
    if ([v2 applicationIsInstalled:@"com.apple.tv"]
      && [v3 containsObject:@"com.apple.tv"])
    {
      unsigned int v4 = _LSDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "TV app is installed but app-removed restriction exists for it. Removing restriction.", v7, 2u);
      }

      id v5 = [v3 mutableCopy];
      [v5 removeObject:@"com.apple.tv"];
      [v2 _LSPrivateSetRemovedSystemAppIdentifiers:v5];
    }
  }
  return 1;
}

- (BOOL)performMigration
{
  unsigned __int8 v3 = [(LSDatabaseMigrator *)self populateLSDatabase];
  char v4 = v3 & [(LSDatabaseMigrator *)self removeTVAppSystemAppRemovedRestrictionFor12];
  return v4 & [(LSDatabaseMigrator *)self removeAppRemovalRestrictionForTVOnUpgradeIfInstalled];
}

- (float)estimatedDuration
{
  v4.receiver = self;
  v4.super_class = (Class)LSDatabaseMigrator;
  unsigned int v2 = [(LSDatabaseMigrator *)&v4 didUpgrade];
  float result = 120.0;
  if (!v2) {
    return 2.0;
  }
  return result;
}

- (float)migrationProgress
{
  return -1.0;
}

@end