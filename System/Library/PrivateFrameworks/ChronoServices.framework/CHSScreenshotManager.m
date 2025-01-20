@interface CHSScreenshotManager
+ (CHSScreenshotManager)sharedManager;
+ (NSString)basePath;
- (CHSScreenshotManager)initWithDirectory:(id)a3 fileManager:(id)a4;
- (id)URLForWidget:(id)a3 metrics:(id)a4 attributes:(id)a5 createIntermediateDirectories:(BOOL)a6;
- (id)_baseFileNameFromWidget:(uint64_t)a1;
- (id)allCachedSnapshotURLs;
- (id)finalFileNameForWidget:(void *)a3 metrics:(void *)a4 attributes:;
- (id)indexingDirectoryNameForWidget:(uint64_t)a1;
- (id)snapshotContextForWidget:(id)a3 metrics:(id)a4 attributes:(id)a5;
- (void)allCachedSnapshotURLs;
- (void)deleteAllCachedScreenshots;
- (void)deleteAllCachedScreenshotsExcludingWidgets:(id)a3;
- (void)deleteCachedScreenshotsMatchingWidget:(id)a3;
@end

@implementation CHSScreenshotManager

+ (NSString)basePath
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t started = sysdir_start_search_path_enumeration_private();
  MEMORY[0x192FD7A60](started, v5);
  v3 = [NSString stringWithCString:v5 encoding:4];
  return (NSString *)v3;
}

+ (CHSScreenshotManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CHSScreenshotManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_shared;
  return (CHSScreenshotManager *)v2;
}

void __37__CHSScreenshotManager_sharedManager__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) basePath];
  if (v1)
  {
    v2 = [NSString stringWithFormat:@"/private%@", v1];
    v3 = [v2 stringByAppendingPathComponent:@"com.apple.chrono"];

    v4 = [v3 stringByAppendingPathComponent:@"snapshot-cache"];

    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:0];

    v7 = [CHSScreenshotManager alloc];
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [(CHSScreenshotManager *)v7 initWithDirectory:v5 fileManager:v8];
    v10 = (void *)sharedManager_shared;
    sharedManager_shared = v9;
  }
  else
  {
    v11 = CHSLogClientSnapshots();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190C6F000, v11, OS_LOG_TYPE_DEFAULT, "Unable to resolve base directory for snapshots.", buf, 2u);
    }

    v12 = (void *)sharedManager_shared;
    sharedManager_shared = 0;
  }
}

- (CHSScreenshotManager)initWithDirectory:(id)a3 fileManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSScreenshotManager;
  uint64_t v9 = [(CHSScreenshotManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_threadSafe_fileManager, a4);
    objc_storeStrong((id *)&v10->_baseURL, a3);
  }

  return v10;
}

- (void)deleteAllCachedScreenshots
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  threadSafe_fileManager = self->_threadSafe_fileManager;
  baseURL = self->_baseURL;
  id v10 = 0;
  [(NSFileManager *)threadSafe_fileManager removeItemAtURL:baseURL error:&v10];
  v5 = (__CFString *)v10;
  uint64_t v6 = CHSLogClientSnapshots();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"success";
    if (v5) {
      id v7 = v5;
    }
    *(_DWORD *)buf = 138543362;
    objc_super v12 = v7;
    _os_log_impl(&dword_190C6F000, v6, OS_LOG_TYPE_DEFAULT, "Clearing all cached client-side snapshots: %{public}@", buf, 0xCu);
  }

  id v8 = self->_threadSafe_fileManager;
  uint64_t v9 = [(NSURL *)self->_baseURL path];
  [(NSFileManager *)v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
}

- (void)deleteCachedScreenshotsMatchingWidget:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  v20 = v4;
  uint64_t v6 = -[CHSScreenshotManager indexingDirectoryNameForWidget:]((uint64_t)self, v4);
  v23 = [(NSURL *)baseURL URLByAppendingPathComponent:v6 isDirectory:1];

  id v7 = -[CHSScreenshotManager _baseFileNameFromWidget:]((uint64_t)self, v4);
  threadSafe_fileManager = self->_threadSafe_fileManager;
  id v29 = 0;
  v22 = [(NSFileManager *)threadSafe_fileManager contentsOfDirectoryAtURL:v23 includingPropertiesForKeys:0 options:0 error:&v29];
  id v21 = v29;
  if (v21)
  {
    uint64_t v9 = CHSLogClientSnapshots();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v21 localizedDescription];
      -[CHSScreenshotManager deleteCachedScreenshotsMatchingWidget:]((uint64_t)v20, v10, buf, v9);
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = v22;
    uint64_t v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16, v20);
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v15 = [v14 lastPathComponent];
          int v16 = [v15 hasPrefix:v7];

          if (v16)
          {
            v17 = self->_threadSafe_fileManager;
            id v24 = 0;
            [(NSFileManager *)v17 removeItemAtURL:v14 error:&v24];
            id v18 = v24;
            v19 = CHSLogClientSnapshots();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v32 = v14;
              _os_log_impl(&dword_190C6F000, v19, OS_LOG_TYPE_DEFAULT, "Deleted client snapshot at path: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v11);
    }
  }
}

- (id)indexingDirectoryNameForWidget:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = [v3 kind];
    uint64_t v6 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    id v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

    uint64_t v8 = [v7 length];
    if ((int)v8 <= 50) {
      int v9 = 50;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = objc_msgSend(v7, "rangeOfComposedCharacterSequencesForRange:", (v9 - 50), v8 - (v9 - 50));
    uint64_t v12 = objc_msgSend(v7, "substringWithRange:", v10, v11);
    uint64_t v13 = [v4 extensionIdentity];
    v14 = [v13 extensionBundleIdentifier];
    v15 = [v14 stringByAppendingPathComponent:v12];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_baseFileNameFromWidget:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = CHSWidgetFamilyDescription([v3 family]);
    uint64_t v6 = [v4 intentReference];
    if ([v6 stableHash])
    {
      id v7 = NSString;
      uint64_t v8 = [v4 intentReference];
      objc_msgSend(v7, "stringWithFormat:", @"%lld--", objc_msgSend(v8, "stableHash"));
      int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v9 = &stru_1EE0A1408;
    }

    uint64_t v10 = [NSString stringWithFormat:@"%@--%@", v5, v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)deleteAllCachedScreenshotsExcludingWidgets:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__CHSScreenshotManager_deleteAllCachedScreenshotsExcludingWidgets___block_invoke;
  v27[3] = &unk_1E56C93B8;
  v27[4] = self;
  id v4 = objc_msgSend(a3, "bs_map:", v27);
  int v16 = [(CHSScreenshotManager *)self allCachedSnapshotURLs];
  objc_msgSend(v16, "bs_map:", &__block_literal_global_5);
  v17 = self;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v4;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v20;
LABEL_8:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v10);
            }
            if ([v9 hasPrefix:*(void *)(*((void *)&v19 + 1) + 8 * v13)]) {
              break;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v32 count:16];
              if (v11) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          threadSafe_fileManager = v17->_threadSafe_fileManager;
          id v18 = 0;
          [(NSFileManager *)threadSafe_fileManager removeItemAtPath:v9 error:&v18];
          id v10 = v18;
          if (v10)
          {
            v15 = CHSLogClientSnapshots();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v29 = v9;
              __int16 v30 = 2114;
              id v31 = v10;
              _os_log_error_impl(&dword_190C6F000, v15, OS_LOG_TYPE_ERROR, "Error removing client snapshot for %{public}@: error = %{public}@", buf, 0x16u);
            }
          }
          else
          {
            v15 = CHSLogClientSnapshots();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v29 = v9;
              _os_log_impl(&dword_190C6F000, v15, OS_LOG_TYPE_DEFAULT, "Deleted client snapshot at path: %{public}@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v6);
  }
}

id __67__CHSScreenshotManager_deleteAllCachedScreenshotsExcludingWidgets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  uint64_t v6 = -[CHSScreenshotManager indexingDirectoryNameForWidget:](v4, v3);
  uint64_t v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:1];

  uint64_t v8 = -[CHSScreenshotManager _baseFileNameFromWidget:](*(void *)(a1 + 32), v3);
  int v9 = [v7 URLByAppendingPathComponent:v8];
  id v10 = [v9 path];

  uint64_t v11 = CHSLogClientSnapshots();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v7 filePathURL];
    v14 = [v13 path];
    int v15 = 138543618;
    int v16 = v10;
    __int16 v17 = 2114;
    id v18 = v14;
    _os_log_debug_impl(&dword_190C6F000, v11, OS_LOG_TYPE_DEBUG, "Prefix to keep: %{public}@ (%{public}@)", (uint8_t *)&v15, 0x16u);
  }
  return v10;
}

id __67__CHSScreenshotManager_deleteAllCachedScreenshotsExcludingWidgets___block_invoke_15(uint64_t a1, void *a2)
{
  v2 = [a2 path];
  return v2;
}

- (id)allCachedSnapshotURLs
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [(NSFileManager *)self->_threadSafe_fileManager enumeratorAtURL:self->_baseURL includingPropertiesForKeys:0 options:0 errorHandler:&__block_literal_global_19];
  v2 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v13;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = *MEMORY[0x1E4F1C628];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v14 = 0;
        [v8 getResourceValue:&v14 forKey:v6 error:0];
        id v9 = v14;
        if (([v9 BOOLValue] & 1) == 0)
        {
          id v10 = CHSLogClientSnapshots();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v11 = [v8 path];
            [(CHSScreenshotManager *)v11 allCachedSnapshotURLs];
          }

          [v2 addObject:v8];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);
  }

  return v2;
}

uint64_t __45__CHSScreenshotManager_allCachedSnapshotURLs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = CHSLogClientSnapshots();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CHSScreenshotManager_allCachedSnapshotURLs__block_invoke_cold_1((uint64_t)v3, v4);
  }

  return 1;
}

- (id)snapshotContextForWidget:(id)a3 metrics:(id)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = [(CHSScreenshotManager *)self URLForWidget:a3 metrics:a4 attributes:v8 createIntermediateDirectories:0];
  id v10 = [[CHSSnapshotContext alloc] initWithURL:v9 attributes:v8 fileManager:self->_threadSafe_fileManager];

  return v10;
}

- (id)URLForWidget:(id)a3 metrics:(id)a4 attributes:(id)a5 createIntermediateDirectories:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  baseURL = self->_baseURL;
  id v14 = -[CHSScreenshotManager indexingDirectoryNameForWidget:]((uint64_t)self, v10);
  long long v15 = [(NSURL *)baseURL URLByAppendingPathComponent:v14 isDirectory:1];

  if (v6)
  {
    threadSafe_fileManager = self->_threadSafe_fileManager;
    long long v17 = [v15 path];
    uint64_t v22 = 0;
    [(NSFileManager *)threadSafe_fileManager createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v22];
  }
  long long v18 = -[CHSScreenshotManager finalFileNameForWidget:metrics:attributes:]((uint64_t)self, v10, v11, v12);
  uint64_t v19 = [v15 URLByAppendingPathComponent:v18 isDirectory:0];
  uint64_t v20 = [v19 URLByAppendingPathExtension:@"snapshot"];

  return v20;
}

- (id)finalFileNameForWidget:(void *)a3 metrics:(void *)a4 attributes:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = v8;
  long long v23 = v7;
  if (a1)
  {
    id v10 = -[CHSScreenshotManager _baseFileNameFromWidget:](a1, v7);
    id v11 = [v8 _stringKeyRepresentation];
    id v12 = CHSScreenshotColorSchemeDescription([v9 colorScheme]);
    if ([v9 allowsPrivacySensitiveContent])
    {
      int v13 = [v9 userWantsWidgetDataWhenPasscodeLocked];
      id v14 = @".private";
      if (v13) {
        id v14 = @".private-exception";
      }
      long long v15 = v14;
    }
    else
    {
      long long v15 = &stru_1EE0A1408;
    }
    long long v16 = [v9 additionalSettingsContext];
    if (v16)
    {
      long long v17 = [NSString stringWithFormat:@"--%@", v16];
    }
    else
    {
      long long v17 = &stru_1EE0A1408;
    }
    long long v18 = [v9 tintParameters];
    uint64_t v19 = [v18 hash];

    uint64_t v20 = [NSString stringWithFormat:@"%@%@%@--%lu.%@%@", v10, v11, v17, v19, v12, v15, v8, v23];
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSafe_fileManager, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)deleteCachedScreenshotsMatchingWidget:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_190C6F000, log, OS_LOG_TYPE_DEBUG, "Error fetching snapshot list for widget: %{public}@, error = %{public}@", buf, 0x16u);
}

- (void)allCachedSnapshotURLs
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_debug_impl(&dword_190C6F000, log, OS_LOG_TYPE_DEBUG, "Existing client snapshot path: %{public}@", buf, 0xCu);
}

void __45__CHSScreenshotManager_allCachedSnapshotURLs__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190C6F000, a2, OS_LOG_TYPE_ERROR, "Unexpected error iterating directories for client snapshots: error = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end