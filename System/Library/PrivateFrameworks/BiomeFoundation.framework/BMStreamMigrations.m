@interface BMStreamMigrations
+ (Class)legacyClassForLibraryStream:(id)a3;
+ (id)legacyClassNameForLibraryStream:(id)a3;
+ (id)libraryPathForStreamIdentifier:(id)a3;
+ (id)libraryRestrictedStreamMigrationPaths;
+ (id)pathToVersionFile;
+ (int64_t)handleFloatReturnValue:(id)a3;
+ (int64_t)readCurrentDatabaseVersion;
+ (void)readCurrentDatabaseVersion;
+ (void)setDatabaseVersion:(int64_t)a3;
- (void)_migrateStreamsToLibrary:(id)a3 streamType:(unint64_t)a4;
- (void)_moveStreamsWithPathMapping:(id)a3;
- (void)_removeStreamPaths:(id)a3;
- (void)migrate;
- (void)migrateFromVersion:(int64_t)a3;
@end

@implementation BMStreamMigrations

+ (id)libraryPathForStreamIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths];
  v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    v6 = +[BMStreamMigrations libraryRestrictedStreamMigrationPaths];
    v5 = [v6 objectForKey:v3];
  }

  return v5;
}

+ (id)libraryRestrictedStreamMigrationPaths
{
  return &unk_1F0B434B8;
}

+ (Class)legacyClassForLibraryStream:(id)a3
{
  id v3 = [a1 legacyClassNameForLibraryStream:a3];
  v4 = v3;
  if (v3)
  {
    v5 = NSClassFromString(v3);
  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

+ (id)legacyClassNameForLibraryStream:(id)a3
{
  return (id)[&unk_1F0B434E0 objectForKeyedSubscript:a3];
}

+ (id)pathToVersionFile
{
  v2 = +[BMProcess current];
  int v3 = [v2 isRunningInUserContext];

  v4 = +[BMPaths biomeDirectoryForDomain:v3 ^ 1u];
  v5 = [v4 stringByAppendingPathComponent:@"databaseVersion.json"];

  return v5;
}

+ (int64_t)handleFloatReturnValue:(id)a3
{
  id v3 = a3;
  [v3 doubleValue];
  if (v4 <= 0.0 || v4 >= 0.99) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

+ (int64_t)readCurrentDatabaseVersion
{
  v2 = +[BMStreamMigrations pathToVersionFile];
  id v27 = 0;
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v2 options:0 error:&v27];
  id v4 = v27;
  if (v4)
  {
    id v5 = v4;
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v7 = [v6 fileExistsAtPath:v2];

    v8 = __biome_log_for_category(0);
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B30A0000, v9, OS_LOG_TYPE_DEFAULT, "Unable to read existing database version file. Using 1 as the default version", buf, 2u);
      }
      int64_t v10 = 1;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[BMStreamMigrations readCurrentDatabaseVersion];
      }
      int64_t v10 = 0;
    }
  }
  else
  {
    id v25 = 0;
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v25];
    id v5 = v25;
    if (v5)
    {
      v11 = __biome_log_for_category(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[BMStreamMigrations readCurrentDatabaseVersion];
      }
      int64_t v10 = 0;
    }
    else
    {
      v11 = [v9 objectForKeyedSubscript:@"Version"];
      int64_t v10 = +[BMStreamMigrations handleFloatReturnValue:v11];
    }
  }
  return v10;
}

+ (void)setDatabaseVersion:(int64_t)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = +[BMStreamMigrations pathToVersionFile];
  uint64_t v23 = @"Version";
  v6 = [NSNumber numberWithInteger:a3];
  v24[0] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  id v22 = 0;
  v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v22];
  id v9 = v22;
  int64_t v10 = [v5 stringByDeletingLastPathComponent];
  id v21 = v9;
  [v4 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v11 = v21;

  id v20 = v11;
  [v8 writeToFile:v5 options:268435457 error:&v20];
  id v12 = v20;

  if (v12)
  {
    uint64_t v13 = __biome_log_for_category(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[BMStreamMigrations setDatabaseVersion:]((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)migrate
{
  int64_t v3 = +[BMStreamMigrations readCurrentDatabaseVersion];

  [(BMStreamMigrations *)self migrateFromVersion:v3];
}

- (void)migrateFromVersion:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 != 9)
  {
    int64_t v3 = a3;
    id v5 = __biome_log_for_category(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [NSNumber numberWithInteger:v3];
      int v13 = 138412546;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = &unk_1F0B42D78;
      _os_log_impl(&dword_1B30A0000, v5, OS_LOG_TYPE_DEFAULT, "Initiating Biome migration from version %@ to version %@.", (uint8_t *)&v13, 0x16u);
    }
    if (v3 <= 8)
    {
      do
      {
        switch(v3)
        {
          case 0:
            [(BMStreamMigrations *)self _removeStreamPaths:&unk_1F0B42F28];
            int v7 = self;
            v8 = &unk_1F0B433F0;
            goto LABEL_16;
          case 1:
            id v9 = +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths];
            [(BMStreamMigrations *)self _migrateStreamsToLibrary:v9 streamType:1];

            int64_t v10 = +[BMStreamMigrations libraryRestrictedStreamMigrationPaths];
            [(BMStreamMigrations *)self _migrateStreamsToLibrary:v10 streamType:2];

            break;
          case 2:
            [(BMStreamMigrations *)self _moveStreamsWithPathMapping:&unk_1F0B43418];
            id v11 = self;
            id v12 = &unk_1F0B42F40;
            goto LABEL_13;
          case 3:
            int v7 = self;
            v8 = &unk_1F0B43440;
            goto LABEL_16;
          case 4:
            id v11 = self;
            id v12 = &unk_1F0B42F58;
            goto LABEL_13;
          case 5:
            if (![MEMORY[0x1E4F93B08] isInternalBuild]) {
              break;
            }
            id v11 = self;
            id v12 = &unk_1F0B42F70;
LABEL_13:
            [(BMStreamMigrations *)v11 _removeStreamPaths:v12];
            break;
          case 6:
            int v7 = self;
            v8 = &unk_1F0B43468;
            goto LABEL_16;
          case 7:
            int v7 = self;
            v8 = &unk_1F0B43490;
LABEL_16:
            [(BMStreamMigrations *)v7 _moveStreamsWithPathMapping:v8];
            break;
          default:
            break;
        }
        +[BMStreamMigrations setDatabaseVersion:++v3];
      }
      while (v3 != 9);
    }
  }
}

- (void)_moveStreamsWithPathMapping:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    uint64_t v25 = *MEMORY[0x1E4F281F8];
    *(void *)&long long v7 = 138543874;
    long long v24 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v11, v24);
        if ([v4 fileExistsAtPath:v12])
        {
          int v13 = __biome_log_for_category(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v33 = v11;
            __int16 v34 = 2114;
            id v35 = v12;
            _os_log_impl(&dword_1B30A0000, v13, OS_LOG_TYPE_INFO, "Skipping migration of %{public}@ to %{public}@ because destination already exists", buf, 0x16u);
          }
          uint64_t v14 = 0;
        }
        else
        {
          id v27 = 0;
          char v15 = [v4 moveItemAtPath:v11 toPath:v12 error:&v27];
          id v16 = v27;
          uint64_t v14 = v16;
          if (v15) {
            goto LABEL_21;
          }
          uint64_t v17 = [v16 domain];
          if (![v17 isEqualToString:v25])
          {

LABEL_18:
            int v13 = __biome_log_for_category(0);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              uint64_t v33 = v11;
              __int16 v34 = 2114;
              id v35 = v12;
              __int16 v36 = 2114;
              v37 = v14;
              _os_log_error_impl(&dword_1B30A0000, v13, OS_LOG_TYPE_ERROR, "Failed to migrate %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
            }
            goto LABEL_20;
          }
          if ([v14 code] == 260)
          {
          }
          else
          {
            uint64_t v18 = [v14 code];

            if (v18 != 4) {
              goto LABEL_18;
            }
          }
          int v13 = __biome_log_for_category(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v33 = v11;
            __int16 v34 = 2114;
            id v35 = v12;
            _os_log_impl(&dword_1B30A0000, v13, OS_LOG_TYPE_INFO, "Skipping migration of %{public}@ to %{public}@ because source does not exist", buf, 0x16u);
          }
        }
LABEL_20:

LABEL_21:
        id v26 = v14;
        char v19 = [v4 removeItemAtPath:v11 error:&v26];
        id v20 = v26;

        if (v19) {
          goto LABEL_29;
        }
        id v21 = [v20 domain];
        if ([v21 isEqualToString:v25])
        {
          uint64_t v22 = [v20 code];

          if (v22 == 4) {
            goto LABEL_29;
          }
        }
        else
        {
        }
        uint64_t v23 = __biome_log_for_category(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = v11;
          __int16 v34 = 2114;
          id v35 = v20;
          _os_log_error_impl(&dword_1B30A0000, v23, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@ with error %{public}@", buf, 0x16u);
        }

LABEL_29:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v8);
  }
}

- (void)_removeStreamPaths:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = *MEMORY[0x1E4F281F8];
    *(void *)&long long v7 = 138543618;
    long long v19 = v7;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        id v20 = 0;
        char v13 = objc_msgSend(v4, "removeItemAtPath:error:", v12, &v20, v19);
        id v14 = v20;
        char v15 = v14;
        if ((v13 & 1) == 0)
        {
          id v16 = [v14 domain];
          if ([v16 isEqualToString:v10])
          {
            uint64_t v17 = [v15 code];

            if (v17 == 4) {
              goto LABEL_14;
            }
          }
          else
          {
          }
          uint64_t v18 = __biome_log_for_category(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v26 = v12;
            __int16 v27 = 2114;
            long long v28 = v15;
            _os_log_error_impl(&dword_1B30A0000, v18, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@ with error %{public}@", buf, 0x16u);
          }
        }
LABEL_14:

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)_migrateStreamsToLibrary:(id)a3 streamType:(unint64_t)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v43;
    uint64_t v35 = *MEMORY[0x1E4F281F8];
    unint64_t v11 = 0x1E6022000uLL;
    *(void *)&long long v8 = 138412290;
    long long v34 = v8;
    unint64_t v36 = a4;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        char v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v14 = objc_msgSend(*(id *)(v11 + 1920), "pathForStreamIdentifier:streamType:", v13, a4, v34);
        if ([v6 fileExistsAtPath:v14])
        {
          char v15 = __biome_log_for_category(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v34;
            id v47 = v13;
            _os_log_debug_impl(&dword_1B30A0000, v15, OS_LOG_TYPE_DEBUG, "Migrating stream %@ to BMLibrary.", buf, 0xCu);
          }

          unint64_t v16 = v11;
          uint64_t v17 = *(void **)(v11 + 1920);
          uint64_t v18 = [obj valueForKey:v13];
          long long v19 = [v17 pathForStreamIdentifier:v18 streamType:2];

          id v20 = __biome_log_for_category(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v34;
            id v47 = v19;
            _os_log_debug_impl(&dword_1B30A0000, v20, OS_LOG_TYPE_DEBUG, "New path: %@", buf, 0xCu);
          }

          char v41 = 1;
          long long v21 = [v19 stringByDeletingLastPathComponent];
          char v22 = [v6 fileExistsAtPath:v21 isDirectory:&v41];

          if (v22)
          {
            id v23 = 0;
          }
          else
          {
            long long v24 = [v19 stringByDeletingLastPathComponent];
            id v40 = 0;
            [v6 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:&v40];
            id v23 = v40;

            if (v23)
            {
              uint64_t v25 = __biome_log_for_category(0);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v34;
                id v47 = v23;
                _os_log_error_impl(&dword_1B30A0000, v25, OS_LOG_TYPE_ERROR, "Error creating migrated path: %@", buf, 0xCu);
              }
            }
          }
          id v39 = v23;
          char v26 = [v6 moveItemAtPath:v14 toPath:v19 error:&v39];
          id v27 = v39;

          if (v26)
          {
            id v28 = v27;
LABEL_30:
            a4 = v36;

            unint64_t v11 = v16;
            goto LABEL_31;
          }
          long long v29 = [v27 domain];
          if ([v29 isEqual:v35])
          {
            uint64_t v30 = [v27 code];

            if (v30 == 516)
            {
              long long v31 = __biome_log_for_category(0);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v34;
                id v47 = v19;
                _os_log_impl(&dword_1B30A0000, v31, OS_LOG_TYPE_DEFAULT, "Skip migrating stream since the new path already exists: %@", buf, 0xCu);
              }
LABEL_26:

              id v38 = v27;
              char v32 = [v6 removeItemAtPath:v14 error:&v38];
              id v28 = v38;

              if ((v32 & 1) == 0)
              {
                uint64_t v33 = __biome_log_for_category(0);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v34;
                  id v47 = v28;
                  _os_log_error_impl(&dword_1B30A0000, v33, OS_LOG_TYPE_ERROR, "Error removing old stream, %@", buf, 0xCu);
                }
              }
              goto LABEL_30;
            }
          }
          else
          {
          }
          long long v31 = __biome_log_for_category(0);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v34;
            id v47 = v27;
            _os_log_error_impl(&dword_1B30A0000, v31, OS_LOG_TYPE_ERROR, "Error moving stream to library location, %@", buf, 0xCu);
          }
          goto LABEL_26;
        }
LABEL_31:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v9);
  }
}

+ (void)readCurrentDatabaseVersion
{
}

+ (void)setDatabaseVersion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end