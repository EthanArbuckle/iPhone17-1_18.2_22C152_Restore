@interface GEOMapsSuggestionsCache
+ (id)defaultCacheDir;
+ (id)defaultPathForProcessName:(id)a3;
+ (id)defaultSuppressedEntriesPath;
+ (void)pruneOldCacheAtPath:(id)a3;
@end

@implementation GEOMapsSuggestionsCache

+ (id)defaultCacheDir
{
  if (qword_1EB2A0290 != -1) {
    dispatch_once(&qword_1EB2A0290, &__block_literal_global_159);
  }
  v2 = (void *)_MergedGlobals_299;

  return v2;
}

void __42__GEOMapsSuggestionsCache_defaultCacheDir__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[GEOFilePaths pathFor:22];
  v1 = (void *)_MergedGlobals_299;
  _MergedGlobals_299 = v0;

  unsigned __int8 v9 = 0;
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v3 = [v2 fileExistsAtPath:_MergedGlobals_299 isDirectory:&v9];
  int v4 = v9;

  if ((v3 & 1) == 0 && !v4)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = 0;
    [v5 createDirectoryAtPath:_MergedGlobals_299 withIntermediateDirectories:1 attributes:0 error:&v8];
    id v6 = v8;

    if (v6)
    {
      v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v11 = _MergedGlobals_299;
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Cannot create cache dir at: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }
}

+ (id)defaultPathForProcessName:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__GEOMapsSuggestionsCache_defaultPathForProcessName___block_invoke;
  v9[3] = &unk_1E53D79B0;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = qword_1EB2A02A0;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&qword_1EB2A02A0, v9);
  }
  id v7 = (id)qword_1EB2A0298;

  return v7;
}

void __53__GEOMapsSuggestionsCache_defaultPathForProcessName___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) defaultCacheDir];
  if (v5)
  {
    v2 = [NSString stringWithFormat:@"MapsSuggestionsManager_%@.storage", *(void *)(a1 + 32)];
    uint64_t v3 = [v5 stringByAppendingPathComponent:v2];
    id v4 = (void *)qword_1EB2A0298;
    qword_1EB2A0298 = v3;
  }
}

+ (id)defaultSuppressedEntriesPath
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GEOMapsSuggestionsCache_defaultSuppressedEntriesPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2A02B0 != -1) {
    dispatch_once(&qword_1EB2A02B0, block);
  }
  v2 = (void *)qword_1EB2A02A8;

  return v2;
}

void __55__GEOMapsSuggestionsCache_defaultSuppressedEntriesPath__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) defaultCacheDir];
  if (v4)
  {
    v1 = [NSString stringWithFormat:@"suppressedEntries.data"];
    uint64_t v2 = [v4 stringByAppendingPathComponent:v1];
    uint64_t v3 = (void *)qword_1EB2A02A8;
    qword_1EB2A02A8 = v2;
  }
}

+ (void)pruneOldCacheAtPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v3 isDirectory:0])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", -GEOConfigGetDouble(GeoServicesConfig_MapsSuggestionsCacheFileMaxAge, (uint64_t)off_1E9113F28));
    if (!v5)
    {
      id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "maxAllowedAge was nil", buf, 2u);
      }
      goto LABEL_20;
    }
    id v14 = 0;
    id v6 = [v4 attributesOfItemAtPath:v3 error:&v14];
    id v7 = v14;
    id v8 = [v6 fileModificationDate];

    if (!v8 || v7)
    {
      id v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v16 = v3;
        __int16 v17 = 2114;
        v18 = v7;
        __int16 v12 = "Could not stat file at path: %{public}@, error: %{public}@";
LABEL_17:
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else
    {
      if ([v8 compare:v5] != -1)
      {
LABEL_20:

        goto LABEL_21;
      }
      id v13 = 0;
      int v9 = [v4 removeItemAtPath:v3 error:&v13];
      id v7 = v13;
      id v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      id v11 = v10;
      if (v9 && !v7)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          id v16 = v3;
          _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Successfully removed old MapsSuggestions cache at: %{private}@", buf, 0xCu);
        }
        id v7 = v11;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v16 = v3;
        __int16 v17 = 2114;
        v18 = v7;
        __int16 v12 = "Could not remove file at path: %{public}@, error: %{public}@";
        goto LABEL_17;
      }
    }

LABEL_19:
    goto LABEL_20;
  }
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v16 = v3;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "No need to purge unexisting MapsSuggestions cache at: %{private}@", buf, 0xCu);
  }
LABEL_21:
}

@end