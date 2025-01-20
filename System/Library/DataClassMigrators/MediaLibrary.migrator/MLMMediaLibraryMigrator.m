@interface MLMMediaLibraryMigrator
- (BOOL)performMigration;
- (MLMMediaLibraryMigrator)init;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MLMMediaLibraryMigrator

- (void).cxx_destruct
{
}

- (float)migrationProgress
{
  float result = 1.0;
  if (!self->_migrated) {
    return 0.0;
  }
  return result;
}

- (float)estimatedDuration
{
  v3 = [(NSArray *)self->_libraries firstObject];
  unsigned int v4 = [v3 currentDatabaseVersion];

  if (v4) {
    return (float)(2220020 - v4) / 200.0 * (double)[(NSArray *)self->_libraries count];
  }
  else {
    return 1.0;
  }
}

- (BOOL)performMigration
{
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries])
  {
    v2 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[Migrator] Multi-user mode detected, removing the single-user library", buf, 2u);
    }

    if (MSVDeviceOSIsInternalInstall())
    {
      v3 = +[ML3TerminationCoordinator sharedCoordinator];
      [v3 execute];
    }
    unsigned int v4 = +[NSFileManager defaultManager];
    v5 = +[ML3MusicLibrary pathForResourceFileOrFolder:9];
    [v4 removeItemAtPath:v5 error:0];

    v6 = +[ML3MusicLibrary pathForResourceFileOrFolder:8];
    [v4 removeItemAtPath:v6 error:0];

    v7 = +[ML3MusicLibrary mediaFolderPath];
    uint64_t v8 = +[ML3MusicLibrary libraryPathForContainerPath:v7];
    [v4 removeItemAtPath:v8 error:0];

    v9 = +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:@"iTunes_Control"];
    LOBYTE(v8) = [v4 fileExistsAtPath:v9 isDirectory:0];

    if ((v8 & 1) == 0)
    {
      v10 = +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:@"iTunes_Control"];
      id v38 = 0;
      [v4 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v38];
      v11 = (NSArray *)v38;

      if (v11)
      {
        v12 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v11;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_FAULT, "[Migrator] Failed to re-create iTunes_Control directory on multi-user device during migration - error=%{public}@", buf, 0xCu);
        }
      }
    }
    v13 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[Migrator] Single-user library removed", buf, 2u);
    }
  }
  v14 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    libraries = self->_libraries;
    *(_DWORD *)buf = 134217984;
    v41 = libraries;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[Migrator] Validating media libraries %p", buf, 0xCu);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v32 = 16;
  v16 = self->_libraries;
  id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v35;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(NSArray **)(*((void *)&v34 + 1) + 8 * i);
        if (([(NSArray *)v20 validateDatabase] & 1) == 0)
        {
          v21 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v20;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "[Migrator] Failed to validate media library %{public}@ during migration", buf, 0xCu);
          }
        }
      }
      id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v17);
  }

  if ((+[ML3MusicLibrary deviceSupportsMultipleLibraries] & 1) == 0)
  {
    v22 = [*(id *)&self->DataClassMigrator_opaque[v32] firstObject];
    v23 = [v22 valueForDatabaseProperty:@"MLCloudDatabaseRevision"];
    BOOL v24 = [v23 intValue] == 0;

    if (!v24)
    {
      v25 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "[Migrator] Migrated from Copper or earlier. Disabling 'show offline music' switch automatically.", buf, 2u);
      }

      v26 = (void *)CFPreferencesCopyAppValue(@"MusicShowCloudMediaEnabledSettingRevisionID", @"com.apple.mobileipod");
      if ((objc_opt_respondsToSelector() & 1) == 0 || (uint64_t)[v26 integerValue] < 1)
      {
        CFPreferencesSetAppValue(@"MusicShowCloudMediaEnabledSettingRevisionID", &off_4218, @"com.apple.mobileipod");
        CFPreferencesSetAppValue(@"MusicShowCloudMediaEnabledSetting", 0, @"com.apple.mobileipod");
      }
    }
    v27 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Requesting to update spotlight indexes for Music and Videos", buf, 2u);
    }

    v28 = +[MLMediaLibraryService sharedMediaLibraryService];
    [v28 updateSpotlightIndexForBundleID:@"com.apple.Music" withCompletion:0];

    v29 = +[MLMediaLibraryService sharedMediaLibraryService];
    [v29 updateSpotlightIndexForBundleID:@"com.apple.videos" withCompletion:0];
  }
  v30 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[Migrator] Migration successful", buf, 2u);
  }

  BOOL result = 1;
  self->_migrated = 1;
  return result;
}

- (id)dataClassName
{
  return @"MediaLibrary";
}

- (MLMMediaLibraryMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MLMMediaLibraryMigrator;
  v2 = [(MLMMediaLibraryMigrator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ML3MusicLibrary allLibraries];
    libraries = v2->_libraries;
    v2->_libraries = (NSArray *)v3;

    v2->_migrated = 0;
  }
  return v2;
}

@end