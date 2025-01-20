@interface AppCache
+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12;
+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 isDataseparated:(BOOL)a8 isPlaceholder:(BOOL)a9 isPlugin:(BOOL)a10 telemetry:(id)a11;
+ (void)enumerateAppCachesOnVolume:(id)a3 options:(int)a4 telemetry:(id)a5 block:(id)a6;
+ (void)enumerateGroupCachesOnVolume:(id)a3 block:(id)a4;
+ (void)enumerateWithContainerQuery:(id)a3 container_class:(unint64_t)a4 options:(int)a5 telemetry:(id)a6 block:(id)a7;
- (AppCache)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12;
- (BOOL)isDataseparated;
- (BOOL)isPlaceholder;
- (BOOL)isPlugin;
- (BOOL)moveCacheAside:(id)a3;
- (BOOL)validate;
- (CacheDeleteVolume)cdVol;
- (NSDate)lastUsed;
- (NSMutableSet)bundleRecords;
- (NSNumber)lastKnownCacheSize;
- (NSNumber)lastKnownFreespace;
- (NSNumber)lastKnownGroupCacheSize;
- (NSNumber)lastKnownTmpSize;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)dataContainerURL;
- (NSURL)userManagedAssetsURL;
- (TestTelemetry)telemetry;
- (double)timestamp;
- (id)cachePath;
- (id)description;
- (id)tmpPath;
- (int)urgency;
- (int64_t)three_days_ago;
- (unint64_t)caches:(BOOL)a3 purge:(BOOL)a4;
- (unint64_t)clearCaches:(BOOL)a3;
- (unint64_t)groupCache:(BOOL)a3;
- (unint64_t)tmp:(BOOL)a3 purge:(BOOL)a4 all:(BOOL)a5;
- (void)addBundleRecord:(id)a3;
- (void)addBundleRecords:(id)a3;
- (void)invalidate;
- (void)setBundleRecords:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastKnownCacheSize:(id)a3;
- (void)setLastKnownFreespace:(id)a3;
- (void)setLastKnownGroupCacheSize:(id)a3;
- (void)setLastKnownTmpSize:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setTelemetry:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation AppCache

uint64_t __80__AppCache_enumerateWithContainerQuery_container_class_options_telemetry_block___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1AD0BA160]();
  uint64_t path = container_get_path();
  v4 = CDGetLogHandle((uint64_t)"client");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (path)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v64 = path;
      _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "path: %s\n", buf, 0xCu);
    }
    uint64_t v47 = path;

    v4 = [NSString stringWithUTF8String:container_get_identifier()];
    uint64_t persona_unique_string = container_get_persona_unique_string();
    uint64_t v50 = a1;
    if (persona_unique_string)
    {
      v51 = v4;
      v48 = v2;
      v7 = [NSString stringWithUTF8String:persona_unique_string];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        char v11 = 0;
        uint64_t v12 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v59 != v12) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            v15 = [v14 userPersonaUniqueString];
            int v16 = [v15 isEqualToString:v7];

            if (v16) {
              char v11 = [v14 isDataSeparatedPersona];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v10);
      }
      else
      {
        char v11 = 0;
      }

      char v17 = v11 & 1;
      v2 = v48;
      v4 = v51;
    }
    else
    {
      v7 = 0;
      char v17 = 0;
    }
    id v57 = 0;
    v18 = [MEMORY[0x1E4F22400] bundleRecordWithBundleIdentifier:v4 allowPlaceholder:1 error:&v57];
    id v19 = v57;
    v20 = v19;
    if (!v18 || v19)
    {
      v21 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v64 = (uint64_t)v4;
        __int16 v65 = 2112;
        v66 = v20;
        _os_log_error_impl(&dword_1A63D1000, v21, OS_LOG_TYPE_ERROR, "Unable to create an LSBundleRecord for %@ : %@", buf, 0x16u);
      }
    }
    else
    {
      v21 = [v18 UIBackgroundModes];
      if ([v21 containsObject:@"continuous"])
      {
LABEL_51:

        goto LABEL_52;
      }
      char v46 = v17;
      v52 = v4;
      v22 = [v18 bundleIdentifier];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || *(void *)(v50 + 72) == 3)
      {
        v23 = [v18 containingBundleRecord];
        v24 = [v23 bundleIdentifier];

        id v25 = [v18 infoDictionary];
        v26 = [v25 objectForKey:@"NSExtension" ofClass:objc_opt_class()];
        v27 = v26;
        if (v26)
        {
          v28 = [v26 objectForKeyedSubscript:@"CacheDeleteInfo"];

          if (v28)
          {
            v29 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v64 = (uint64_t)v24;
              _os_log_impl(&dword_1A63D1000, v29, OS_LOG_TYPE_DEFAULT, "skipping CacheDelete extension: %@", buf, 0xCu);
            }

LABEL_49:
            v4 = v52;
            goto LABEL_50;
          }
        }
        v30 = v2;

        char v45 = 1;
      }
      else
      {
        v30 = v2;
        char v45 = 0;
        v24 = v22;
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v25 = *(id *)(v50 + 40);
      uint64_t v31 = [v25 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v54;
        while (2)
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v25);
            }
            if ([v24 containsString:*(void *)(*((void *)&v53 + 1) + 8 * j)])
            {
              v27 = CDGetLogHandle((uint64_t)"client");
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v36 = [v18 bundleIdentifier];
                *(_DWORD *)buf = 138412290;
                uint64_t v64 = (uint64_t)v36;
                _os_log_impl(&dword_1A63D1000, v27, OS_LOG_TYPE_DEFAULT, "skipping excluded App %@", buf, 0xCu);
              }
              v2 = v30;
              goto LABEL_49;
            }
          }
          uint64_t v32 = [v25 countByEnumeratingWithState:&v53 objects:v62 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = v47;
        if ([v18 isPlaceholder]) {
          char v44 = 1;
        }
        else {
          char v44 = [v18 isSystemPlaceholder];
        }
        v2 = v30;
      }
      else
      {
        char v44 = 0;
        v2 = v30;
        uint64_t v35 = v47;
      }
      id v25 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v35 isDirectory:1 relativeToURL:0];
      v38 = 0;
      v4 = v52;
      if ((*(unsigned char *)(v50 + 80) & 2) != 0)
      {
        user_managed_assets_relative_uint64_t path = container_get_user_managed_assets_relative_path();
        if (!user_managed_assets_relative_path)
        {
          v27 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v64 = (uint64_t)v52;
            _os_log_debug_impl(&dword_1A63D1000, v27, OS_LOG_TYPE_DEBUG, "%@ does not have a user managed assets path, skipping", buf, 0xCu);
          }
LABEL_50:

          goto LABEL_51;
        }
        v38 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:user_managed_assets_relative_path isDirectory:1 relativeToURL:v25];
      }
      if (v25)
      {
        v49 = v2;
        v40 = [MEMORY[0x1E4F1CAD0] setWithObject:v18];
        BYTE2(v43) = v45;
        BYTE1(v43) = v44;
        LOBYTE(v43) = v46;
        v41 = +[AppCache appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:](AppCache, "appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:", v40, v52, v25, v38, v7, *(void *)(v50 + 48), v43, *(void *)(v50 + 56));

        if (v41)
        {
          (*(void (**)(void))(*(void *)(v50 + 64) + 16))();
        }
        else
        {
          v42 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v64 = (uint64_t)v18;
            _os_log_error_impl(&dword_1A63D1000, v42, OS_LOG_TYPE_ERROR, "Unable to create AppCache for %@", buf, 0xCu);
          }
        }
        v2 = v49;
      }

      v20 = 0;
    }

LABEL_52:
    goto LABEL_53;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "data container path is not returned:", buf, 2u);
  }
LABEL_53:

  return 1;
}

+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  if (!v18)
  {
    v26 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "AppCache: identifier is required";
LABEL_10:
      v29 = v26;
      uint32_t v30 = 2;
LABEL_11:
      _os_log_error_impl(&dword_1A63D1000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    }
LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  if (!v19)
  {
    v26 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "AppCache: dataContainerURL is required";
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  BYTE2(v32) = a11;
  LOWORD(v32) = __PAIR16__(a10, a9);
  v24 = -[AppCache initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:]([AppCache alloc], "initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:", v17, v18, v19, v20, v21, v22, v32, v23);
  id v25 = CDGetLogHandle((uint64_t)"client");
  v26 = v25;
  if (!v24)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 138412290;
    id v36 = v18;
    v28 = "AppCache: unable to create AppCache for %@";
    v29 = v26;
    uint32_t v30 = 12;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [(AppCache *)v24 identifier];
    v34 = [(AppCache *)v24 lastKnownCacheSize];
    uint64_t v33 = humanReadableNumber([v34 unsignedLongLongValue]);
    *(_DWORD *)buf = 138412546;
    id v36 = v27;
    __int16 v37 = 2112;
    v38 = v33;
    _os_log_impl(&dword_1A63D1000, v26, OS_LOG_TYPE_DEFAULT, "AppCache: created an app cache - identifier: %@, cacheSize: %@", buf, 0x16u);
  }
LABEL_14:

  return v24;
}

- (unint64_t)caches:(BOOL)a3 purge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
LABEL_16:
    v26 = NSNumber;
    id v27 = [(AppCache *)self cachePath];
    v28 = objc_msgSend(v26, "numberWithUnsignedLongLong:", size_dir((const char *)objc_msgSend(v27, "UTF8String")));
    [(AppCache *)self setLastKnownCacheSize:v28];

    v29 = [MEMORY[0x1E4F1C9C8] date];
    [v29 timeIntervalSinceReferenceDate];
    -[AppCache setTimestamp:](self, "setTimestamp:");

    if (v4) {
      goto LABEL_5;
    }
LABEL_17:
    id v25 = [(AppCache *)self lastKnownCacheSize];
    unint64_t v23 = [v25 unsignedLongLongValue];
    goto LABEL_18;
  }
  v6 = [(AppCache *)self lastKnownCacheSize];
  if (![v6 unsignedLongLongValue])
  {

    goto LABEL_16;
  }
  BOOL v7 = [(AppCache *)self validate];

  if (!v7) {
    goto LABEL_16;
  }
  if (!v4) {
    goto LABEL_17;
  }
LABEL_5:
  id v8 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(AppCache *)self identifier];
    uint64_t v10 = [(AppCache *)self lastKnownCacheSize];
    char v11 = (void *)MEMORY[0x1E4F1C9C8];
    [(AppCache *)self timestamp];
    uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    int v35 = 67109890;
    int v36 = 363;
    __int16 v37 = 2112;
    v38 = v9;
    __int16 v39 = 2112;
    unint64_t v40 = (unint64_t)v10;
    __int16 v41 = 2112;
    v42 = v12;
    _os_log_impl(&dword_1A63D1000, v8, OS_LOG_TYPE_DEFAULT, "%d %@ purging cache, self.lastKnownCacheSize: %@ at %@", (uint8_t *)&v35, 0x26u);
  }
  v13 = [(AppCache *)self cachePath];
  BOOL v14 = [(AppCache *)self moveCacheAside:v13];

  if (!v14)
  {
    v15 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(AppCache *)self identifier];
      int v35 = 67109378;
      int v36 = 365;
      __int16 v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_DEFAULT, "%d %@ Unable to move aside cache, clearing in place", (uint8_t *)&v35, 0x12u);
    }
    id v17 = [(AppCache *)self cachePath];
    nuke_dir((const char *)[v17 UTF8String], 1);
  }
  id v18 = [(AppCache *)self cachePath];
  unint64_t v19 = size_dir((const char *)[v18 UTF8String]);

  id v20 = [(AppCache *)self lastKnownCacheSize];
  unint64_t v21 = [v20 unsignedLongLongValue];

  if (v21 <= v19)
  {
    unint64_t v23 = 0;
  }
  else
  {
    id v22 = [(AppCache *)self lastKnownCacheSize];
    unint64_t v23 = [v22 unsignedLongLongValue] - v19;
  }
  v24 = [NSNumber numberWithUnsignedLongLong:v19];
  [(AppCache *)self setLastKnownCacheSize:v24];

  id v25 = [MEMORY[0x1E4F1C9C8] date];
  [v25 timeIntervalSinceReferenceDate];
  -[AppCache setTimestamp:](self, "setTimestamp:");
LABEL_18:

  uint32_t v30 = [(AppCache *)self telemetry];

  if (v30)
  {
    uint64_t v31 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        uint64_t v32 = " purge";
      }
      else {
        uint64_t v32 = "";
      }
      uint64_t v33 = [(AppCache *)self cachePath];
      int v35 = 67109890;
      int v36 = 380;
      __int16 v37 = 2080;
      v38 = v32;
      __int16 v39 = 2048;
      unint64_t v40 = v23;
      __int16 v41 = 2112;
      v42 = v33;
      _os_log_impl(&dword_1A63D1000, v31, OS_LOG_TYPE_DEFAULT, "%d%s caches result: %llu on %@", (uint8_t *)&v35, 0x26u);
    }
  }
  return v23;
}

- (NSNumber)lastKnownCacheSize
{
  return self->_lastKnownCacheSize;
}

- (TestTelemetry)telemetry
{
  return self->_telemetry;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setLastKnownCacheSize:(id)a3
{
}

- (id)cachePath
{
  v2 = NSString;
  id v3 = [(AppCache *)self dataContainerURL];
  BOOL v4 = objc_msgSend(v2, "stringWithUTF8String:", objc_msgSend(v3, "fileSystemRepresentation"));
  BOOL v5 = [v4 stringByAppendingPathComponent:@"Library/Caches"];

  return v5;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (AppCache)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v50 = a5;
  id v49 = a6;
  id v48 = a7;
  id v20 = a8;
  id v47 = a12;
  v51.receiver = self;
  v51.super_class = (Class)AppCache;
  unint64_t v21 = [(AppCache *)&v51 init];
  id v22 = v21;
  if (!v21) {
    goto LABEL_15;
  }
  if (!v18 || !v19)
  {
    v28 = CDGetLogHandle((uint64_t)"client");
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

LABEL_15:
      uint64_t v32 = 0;
      v34 = v48;
      uint64_t v33 = v49;
      int v35 = v47;
      goto LABEL_16;
    }
    *(_DWORD *)buf = 67109120;
    int v53 = 95;
    v29 = "%d AppCache: cannot create an AppCache without an identifier and LSRecord(s)!";
    uint32_t v30 = v28;
    uint32_t v31 = 8;
LABEL_26:
    _os_log_error_impl(&dword_1A63D1000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_14;
  }
  if (v50) {
    objc_storeStrong((id *)&v21->_dataContainerURL, a5);
  }
  dataContainerURL = v22->_dataContainerURL;
  if (!dataContainerURL)
  {
    v28 = CDGetLogHandle((uint64_t)"client");
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 67109378;
    int v53 = 92;
    __int16 v54 = 2112;
    id v55 = v19;
    v29 = "%d AppCache: cannot create an AppCache for %@ without dataContainerURL";
    uint32_t v30 = v28;
    uint32_t v31 = 18;
    goto LABEL_26;
  }
  if (v20)
  {
    if (!initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace)
    {
      uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "freespace"));
      id v25 = (void *)initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace;
      initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace = v24;
    }
    v26 = (CacheDeleteVolume *)v20;
    cdVol = v22->_cdVol;
    v22->_cdVol = v26;
  }
  else
  {
    cdVol = objc_msgSend(NSString, "stringWithUTF8String:", -[NSURL fileSystemRepresentation](dataContainerURL, "fileSystemRepresentation"));
    uint64_t v37 = +[CacheDeleteVolume volumeWithPath:cdVol];
    v38 = v22->_cdVol;
    v22->_cdVol = (CacheDeleteVolume *)v37;
  }
  if (!v22->_cdVol) {
    goto LABEL_15;
  }
  if (!a11) {
    objc_storeStrong((id *)&v22->_userManagedAssetsURL, a6);
  }
  uint64_t v39 = [v18 mutableCopy];
  bundleRecords = v22->_bundleRecords;
  v22->_bundleRecords = (NSMutableSet *)v39;

  objc_storeStrong((id *)&v22->_identifier, a4);
  objc_storeStrong((id *)&v22->_personaUniqueString, a7);
  v22->_isPlaceholder = a10;
  v22->_isPlugin = a11;
  uint64_t v41 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AppCache tmp:purge:all:](v22, "tmp:purge:all:", 0, 0, 0));
  lastKnownTmpSize = v22->_lastKnownTmpSize;
  v22->_lastKnownTmpSize = (NSNumber *)v41;

  uint64_t v43 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AppCache caches:purge:](v22, "caches:purge:", 0, 0));
  lastKnownCacheSize = v22->_lastKnownCacheSize;
  v22->_lastKnownCacheSize = (NSNumber *)v43;

  if (initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace)
  {
    char v45 = (NSNumber *)(id)initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CacheDeleteVolume freespace](v22->_cdVol, "freespace"));
    char v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  lastKnownFreespace = v22->_lastKnownFreespace;
  v22->_lastKnownFreespace = v45;
  v34 = v48;
  uint64_t v33 = v49;
  int v35 = v47;

  objc_storeStrong((id *)&v22->_telemetry, a12);
  v22->_timestamp = nan("");
  uint64_t v32 = v22;
LABEL_16:

  return v32;
}

- (unint64_t)tmp:(BOOL)a3 purge:(BOOL)a4 all:(BOOL)a5
{
  unint64_t v5 = 0;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  if (a5)
  {
    if (!a3 && !a4) {
      [(AppCache *)self validate];
    }
    uint64_t v9 = [(AppCache *)self tmpPath];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __26__AppCache_tmp_purge_all___block_invoke;
    v12[3] = &unk_1E5C51B30;
    BOOL v13 = a5;
    BOOL v14 = a4;
    v12[4] = self;
    v12[5] = &v15;
    traverse_dir_with_state(v9, 0, 0, v12);

    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v16[3]];
    [(AppCache *)self setLastKnownTmpSize:v10];

    unint64_t v5 = v16[3];
  }
  _Block_object_dispose(&v15, 8);
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableSet)bundleRecords
{
  return self->_bundleRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_lastKnownFreespace, 0);
  objc_storeStrong((id *)&self->_lastKnownTmpSize, 0);
  objc_storeStrong((id *)&self->_lastKnownGroupCacheSize, 0);
  objc_storeStrong((id *)&self->_lastKnownCacheSize, 0);
  objc_storeStrong((id *)&self->_userManagedAssetsURL, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_cdVol, 0);
  objc_storeStrong((id *)&self->_bundleRecords, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int)urgency
{
  v2 = [(AppCache *)self lastUsed];
  int v3 = urgencyForDate(v2);

  return v3;
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

+ (void)enumerateAppCachesOnVolume:(id)a3 options:(int)a4 telemetry:(id)a5 block:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = (void *)MEMORY[0x1AD0BA160]();
  BOOL v14 = getRootVolume();
  if (v14)
  {
    objc_msgSend(a1, "enumerateWithContainerQuery:container_class:options:telemetry:block:", v10, 2, v8, v11, v12);
    if (v8) {
      objc_msgSend(a1, "enumerateWithContainerQuery:container_class:options:telemetry:block:", v10, 4, v8, v11, v12);
    }
  }
  else
  {
    uint64_t v15 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v16 = 0;
      _os_log_error_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_ERROR, "No root volume, unable to enumerate apps!", v16, 2u);
    }
  }
}

+ (void)enumerateWithContainerQuery:(id)a3 container_class:(unint64_t)a4 options:(int)a5 telemetry:(id)a6 block:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a7;
  id v12 = (void *)MEMORY[0x1AD0BA160]();
  if (container_query_create())
  {
    BOOL v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    BOOL v14 = [v13 listAllPersonaWithAttributes];
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    id v20 = v14;
    id v21 = v9;
    id v22 = v10;
    id v23 = v11;
    id v15 = v14;
    int iterate_results_sync = container_query_iterate_results_sync();
    container_query_get_last_error();
    uint64_t v17 = (void *)container_error_copy_unlocalized_description();
    uint64_t v18 = CDGetLogHandle((uint64_t)"client");
    id v19 = v18;
    if (iterate_results_sync)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v25 = v17;
        _os_log_debug_impl(&dword_1A63D1000, v19, OS_LOG_TYPE_DEBUG, "container_query_iterate_results_sync succeeded; %s",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = v17;
      _os_log_error_impl(&dword_1A63D1000, v19, OS_LOG_TYPE_ERROR, "container_query_iterate_results_sync failed; %s",
        buf,
        0xCu);
    }

    free(v17);
    container_query_free();
  }
  else
  {
    BOOL v13 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A63D1000, v13, OS_LOG_TYPE_DEFAULT, "container_query_create failed", buf, 2u);
    }
  }
}

- (id)description
{
  uint64_t v32 = NSString;
  uint64_t v3 = [(AppCache *)self identifier];
  uint64_t v30 = [(AppCache *)self urgency];
  uint64_t v4 = [(AppCache *)self lastUsed];
  uint64_t v5 = humanReadableNumber([(AppCache *)self caches:0 purge:0]);
  uint64_t v6 = humanReadableNumber([(AppCache *)self tmp:0 purge:0 all:0]);
  uint64_t v33 = [(AppCache *)self lastKnownFreespace];
  v38 = humanReadableNumber([v33 unsignedLongLongValue]);
  uint32_t v31 = [(AppCache *)self bundleRecords];
  v29 = [v31 allObjects];
  uint64_t v37 = [v29 componentsJoinedByString:@", "];
  BOOL v7 = [(AppCache *)self personaUniqueString];
  int v35 = (void *)v4;
  int v36 = (void *)v3;
  v34 = (void *)v5;
  if (v7)
  {
    uint64_t v8 = [(AppCache *)self personaUniqueString];
  }
  else
  {
    uint64_t v8 = @"none";
  }
  if ([(AppCache *)self isDataseparated]) {
    id v9 = " Dataseparated ";
  }
  else {
    id v9 = "";
  }
  if ([(AppCache *)self isPlaceholder]) {
    id v10 = " Placeholder ";
  }
  else {
    id v10 = "";
  }
  id v11 = [(AppCache *)self dataContainerURL];
  uint64_t v12 = [v11 fileSystemRepresentation];
  BOOL v13 = [(AppCache *)self userManagedAssetsURL];
  if (v13)
  {
    BOOL v14 = [NSString stringWithFormat:@", user managed assets: %s", -[NSURL fileSystemRepresentation](self->_userManagedAssetsURL, "fileSystemRepresentation")];
    uint64_t v27 = v12;
    id v23 = v9;
    id v25 = v10;
    uint64_t v21 = v6;
    id v15 = (void *)v6;
    int v16 = v34;
    uint64_t v17 = v35;
    uint64_t v18 = v36;
    id v19 = [v32 stringWithFormat:@"identifier: %@, urgency: %d, lastUsed: %@, cacheSize: %@, tmpSize: %@, freespace: %@ bundleRecords: [ %@ ], persona: %@%s%s, data container: %s%@", v36, v30, v35, v34, v21, v38, v37, v8, v23, v25, v27, v14];
  }
  else
  {
    uint64_t v28 = v12;
    uint64_t v24 = v9;
    uint64_t v26 = v10;
    uint64_t v22 = v6;
    id v15 = (void *)v6;
    int v16 = v34;
    uint64_t v17 = v35;
    uint64_t v18 = v36;
    id v19 = [v32 stringWithFormat:@"identifier: %@, urgency: %d, lastUsed: %@, cacheSize: %@, tmpSize: %@, freespace: %@ bundleRecords: [ %@ ], persona: %@%s%s, data container: %s%@", v36, v30, v35, v34, v22, v38, v37, v8, v24, v26, v28, &stru_1EFB2B968];
  }

  if (v7) {
  return v19;
  }
}

+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 isDataseparated:(BOOL)a8 isPlaceholder:(BOOL)a9 isPlugin:(BOOL)a10 telemetry:(id)a11
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a11;
  if (!v17)
  {
    uint64_t v24 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v27 = "AppCache: identifier is required";
LABEL_10:
      uint64_t v28 = v24;
      uint32_t v29 = 2;
LABEL_11:
      _os_log_error_impl(&dword_1A63D1000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    }
LABEL_13:
    uint64_t v22 = 0;
    goto LABEL_14;
  }
  if (!v18)
  {
    uint64_t v24 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v27 = "AppCache: dataContainerURL is required";
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  BYTE2(v31) = a10;
  BYTE1(v31) = a9;
  LOBYTE(v31) = a8;
  uint64_t v22 = -[AppCache initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:]([AppCache alloc], "initWithBundleRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:", v16, v17, v18, v19, v20, 0, v31, v21);
  id v23 = CDGetLogHandle((uint64_t)"client");
  uint64_t v24 = v23;
  if (!v22)
  {
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 138412290;
    id v34 = v17;
    uint64_t v27 = "AppCache: unable to create AppCache for %@";
    uint64_t v28 = v24;
    uint32_t v29 = 12;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [(AppCache *)v22 identifier];
    uint64_t v32 = [(AppCache *)v22 lastKnownCacheSize];
    uint64_t v26 = humanReadableNumber([v32 unsignedLongLongValue]);
    *(_DWORD *)buf = 138412546;
    id v34 = v25;
    __int16 v35 = 2112;
    int v36 = v26;
    _os_log_impl(&dword_1A63D1000, v24, OS_LOG_TYPE_DEFAULT, "AppCache: created an app cache - identifier: %@, cacheSize: %@", buf, 0x16u);
  }
LABEL_14:

  return v22;
}

- (void)addBundleRecord:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(AppCache *)self bundleRecords];
  char v5 = [v4 containsObject:v10];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(AppCache *)self dataContainerURL];
    BOOL v7 = [v10 dataContainerURL];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      id v9 = [(AppCache *)self bundleRecords];
      [v9 addObject:v10];
    }
  }
}

- (void)addBundleRecords:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AppCache *)self addBundleRecord:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)tmpPath
{
  v2 = NSString;
  id v3 = [(AppCache *)self dataContainerURL];
  id v4 = objc_msgSend(v2, "stringWithUTF8String:", objc_msgSend(v3, "fileSystemRepresentation"));
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"tmp"];

  return v5;
}

- (void)invalidate
{
  double v3 = nan("");
  [(AppCache *)self setTimestamp:v3];
}

- (BOOL)validate
{
  id v3 = [(AppCache *)self cachePath];
  int v4 = access((const char *)[v3 UTF8String], 0);

  BOOL result = 0;
  if (!v4)
  {
    [(AppCache *)self timestamp];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
    [(AppCache *)self timestamp];
    uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    BOOL v8 = validateTimestamp(v7, 3600.0);

    if (v8)
    {
      cdVol = self->_cdVol;
      long long v10 = [(AppCache *)self lastKnownFreespace];
      LOBYTE(cdVol) = -[CacheDeleteVolume freespaceIsStale:](cdVol, "freespaceIsStale:", [v10 unsignedLongLongValue]);

      return cdVol ^ 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int64_t)three_days_ago
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.tv_sec = 0;
  *(void *)&v6.tv_usec = 0;
  if (gettimeofday(&v6, 0))
  {
    v2 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = __error();
      uint64_t v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      BOOL v8 = v5;
      _os_log_error_impl(&dword_1A63D1000, v2, OS_LOG_TYPE_ERROR, "gettimeofday failed: %s", buf, 0xCu);
    }
  }
  return v6.tv_sec - 259200;
}

- (unint64_t)groupCache:(BOOL)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a3 || ![(AppCache *)self validate])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = [(AppCache *)self bundleRecords];
    uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    id v23 = self;
    unint64_t v7 = 0;
    if (v26)
    {
      uint64_t v25 = *(void *)v33;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = v8;
          uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v10 = [v9 groupContainerURLs];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v29;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * v14);
                id v16 = [v9 groupContainerURLs];
                id v17 = [v16 objectForKeyedSubscript:v15];

                id v18 = NSString;
                id v19 = v17;
                id v20 = objc_msgSend(v18, "stringWithUTF8String:", objc_msgSend(v19, "fileSystemRepresentation"));
                id v21 = [v20 stringByAppendingPathComponent:@"Library/Caches"];

                v7 += did_fast_size_directory(v21, 0);
                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v12);
          }

          uint64_t v8 = v27 + 1;
        }
        while (v27 + 1 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v26);
    }

    uint64_t v22 = [NSNumber numberWithUnsignedLongLong:v7];
    [(AppCache *)v23 setLastKnownGroupCacheSize:v22];

    return v7;
  }
  else
  {
    int v4 = [(AppCache *)self lastKnownGroupCacheSize];
    unint64_t v5 = [v4 unsignedLongLongValue];

    return v5;
  }
}

uint64_t __26__AppCache_tmp_purge_all___block_invoke(uint64_t a1, char *a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    *(unsigned char *)(a3 + 1) = 1;
  }
  else if (*(unsigned char *)(a1 + 48) || (uint64_t v6 = *(void *)(a3 + 48), v6 < objc_msgSend(*(id *)(a1 + 32), "three_days_ago")))
  {
    if (*(unsigned char *)(a1 + 49)) {
      unlink(a2);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += *(void *)(a3 + 8);
  }
  return 1;
}

- (BOOL)moveCacheAside:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(AppCache *)self cdVol];
  uint64_t v6 = discardedCachesPathForVolume(v5);

  unint64_t v7 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 67109378;
    *(_DWORD *)long long v35 = 309;
    *(_WORD *)&v35[4] = 2112;
    *(void *)&v35[6] = v6;
    _os_log_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEFAULT, "%d parent discardedCachesPath: %@", (uint8_t *)&v34, 0x12u);
  }

  if (!v6)
  {
    id v18 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [(CacheDeleteVolume *)self->_cdVol mountPoint];
      int v34 = 138412290;
      *(void *)long long v35 = v27;
      _os_log_error_impl(&dword_1A63D1000, v18, OS_LOG_TYPE_ERROR, "AppCache moveCacheAside: Unable to create destination path for mount point: %@", (uint8_t *)&v34, 0xCu);
    }
    id v8 = 0;
    goto LABEL_19;
  }
  id v8 = v6;
  if (mkdir((const char *)[v8 UTF8String], 0x1C0u) && *__error() != 17)
  {
    id v18 = CDGetLogHandle((uint64_t)"client");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_19:
      BOOL v24 = 0;
      goto LABEL_20;
    }
LABEL_27:
    id v8 = v8;
    uint64_t v28 = [v8 UTF8String];
    long long v29 = __error();
    long long v30 = strerror(*v29);
    int v34 = 136315394;
    *(void *)long long v35 = v28;
    *(_WORD *)&v35[8] = 2080;
    *(void *)&v35[10] = v30;
    _os_log_error_impl(&dword_1A63D1000, v18, OS_LOG_TYPE_ERROR, "mkdir failed for %s : %s", (uint8_t *)&v34, 0x16u);
    goto LABEL_19;
  }
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  long long v10 = [v9 UUIDString];
  uint64_t v11 = [v8 stringByAppendingPathComponent:v10];

  uint64_t v12 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 67109378;
    *(_DWORD *)long long v35 = 326;
    *(_WORD *)&v35[4] = 2112;
    *(void *)&v35[6] = v11;
    _os_log_impl(&dword_1A63D1000, v12, OS_LOG_TYPE_DEFAULT, "%d child discardedCachesPath: %@", (uint8_t *)&v34, 0x12u);
  }

  id v8 = v11;
  if (mkdir((const char *)[v8 UTF8String], 0x1C0u) && *__error() != 17)
  {
    id v18 = CDGetLogHandle((uint64_t)"client");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
  id v13 = v4;
  uint64_t v14 = (const std::__fs::filesystem::path *)[v13 UTF8String];
  id v8 = v8;
  uint64_t v15 = (const std::__fs::filesystem::path *)[v8 UTF8String];
  rename(v14, v15, v16);
  if (v17)
  {
    id v18 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(AppCache *)self cachePath];
      uint64_t v20 = [v19 UTF8String];
      id v8 = v8;
      uint64_t v21 = [v8 UTF8String];
      uint64_t v22 = __error();
      id v23 = strerror(*v22);
      int v34 = 136315650;
      *(void *)long long v35 = v20;
      *(_WORD *)&v35[8] = 2080;
      *(void *)&v35[10] = v21;
      __int16 v36 = 2080;
      uint64_t v37 = v23;
      _os_log_error_impl(&dword_1A63D1000, v18, OS_LOG_TYPE_ERROR, "rename failed for %s -> %s : %s", (uint8_t *)&v34, 0x20u);
    }
    goto LABEL_19;
  }
  id v26 = v13;
  if (!mkdir((const char *)[v26 UTF8String], 0x1C0u))
  {
    BOOL v24 = 1;
    goto LABEL_21;
  }
  id v18 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = [v26 UTF8String];
    long long v32 = __error();
    long long v33 = strerror(*v32);
    int v34 = 136315394;
    *(void *)long long v35 = v31;
    *(_WORD *)&v35[8] = 2080;
    *(void *)&v35[10] = v33;
    _os_log_error_impl(&dword_1A63D1000, v18, OS_LOG_TYPE_ERROR, "Unable to re-create Caches directory at: %s : %s", (uint8_t *)&v34, 0x16u);
  }
  BOOL v24 = 1;
LABEL_20:

LABEL_21:
  return v24;
}

- (unint64_t)clearCaches:(BOOL)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  id v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v5 = [(AppCache *)self bundleRecords];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v10 = [v9 bundleIdentifier];

        if (v10)
        {
          uint64_t v11 = [v9 bundleIdentifier];
          [v4 addObject:v11];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v6);
  }

  uint64_t v12 = 0;
  int v13 = -3;
  *(void *)&long long v14 = 138412290;
  long long v21 = v14;
  do
  {
    uint64_t v15 = [(AppCache *)self telemetry];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __24__AppCache_clearCaches___block_invoke;
    v23[3] = &unk_1E5C51B58;
    v23[4] = self;
    v23[5] = &v29;
    BOOL v24 = a3;
    id v16 = assert_group_cache_deletion(v15, v4, v23, &__block_literal_global_9);

    int v17 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v21;
      int v34 = v16;
      _os_log_impl(&dword_1A63D1000, v17, OS_LOG_TYPE_DEFAULT, "clearCaches assert_group_cache_deletion retryIDs: %@", buf, 0xCu);
    }

    if (__CFADD__(v13++, 1)) {
      break;
    }
    uint64_t v12 = v16;
  }
  while ([v16 count]);
  unint64_t v19 = v30[3];

  _Block_object_dispose(&v29, 8);
  return v19;
}

void __24__AppCache_clearCaches___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) caches:0 purge:1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) tmp:0 purge:1 all:*(unsigned __int8 *)(a1 + 48)];
  v2 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v4 = [*(id *)(a1 + 32) identifier];
    unint64_t v5 = [*(id *)(a1 + 32) cachePath];
    v6[0] = 67109890;
    v6[1] = 402;
    __int16 v7 = 2048;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    long long v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A63D1000, v2, OS_LOG_TYPE_DEFAULT, "%d clearCaches result: %llu for %@ on %@", (uint8_t *)v6, 0x26u);
  }
}

void __24__AppCache_clearCaches___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_error_impl(&dword_1A63D1000, v6, OS_LOG_TYPE_ERROR, "AppCache clearCaches: Unable to clear caches for %@ : %@", (uint8_t *)&v7, 0x16u);
  }
}

+ (void)enumerateGroupCachesOnVolume:(id)a3 block:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1AD0BA160]();
  id v8 = getRootVolume();
  if (v8)
  {
    uint64_t v9 = container_query_create();
    uint64_t v10 = v9;
    if (v5)
    {
      id v24 = v6;
      uint64_t v11 = v7;
      empty = xpc_array_create_empty();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v5;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            xpc_object_t v18 = xpc_string_create((const char *)[*(id *)(*((void *)&v26 + 1) + 8 * i) UTF8String]);
            xpc_array_append_value(empty, v18);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v15);
      }

      int v7 = v11;
      id v6 = v24;
      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
      empty = 0;
      if (v9)
      {
LABEL_11:
        container_query_set_class();
        container_query_operation_set_flags();
        if (empty) {
          container_query_set_group_identifiers();
        }
        container_query_set_include_other_owners();
        long long v25 = v6;
        int iterate_results_sync = container_query_iterate_results_sync();
        container_query_get_last_error();
        uint64_t v20 = (void *)container_error_copy_unlocalized_description();
        long long v21 = CDGetLogHandle((uint64_t)"client");
        uint64_t v22 = v21;
        if (iterate_results_sync)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v31 = v20;
            _os_log_debug_impl(&dword_1A63D1000, v22, OS_LOG_TYPE_DEBUG, "container_query_iterate_results_sync succeeded; %s",
              buf,
              0xCu);
          }
        }
        else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v31 = v20;
          _os_log_error_impl(&dword_1A63D1000, v22, OS_LOG_TYPE_ERROR, "container_query_iterate_results_sync failed; %s",
            buf,
            0xCu);
        }

        free(v20);
        container_query_free();
        id v23 = v25;
LABEL_24:

        goto LABEL_25;
      }
    }
    id v23 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A63D1000, v23, OS_LOG_TYPE_DEFAULT, "container_query_create failed", buf, 2u);
    }
    goto LABEL_24;
  }
  empty = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(empty, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A63D1000, empty, OS_LOG_TYPE_ERROR, "No root volume, unable to enumerate apps!", buf, 2u);
  }
LABEL_25:
}

uint64_t __47__AppCache_enumerateGroupCachesOnVolume_block___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t path = container_get_path();
  if (path)
  {
    uint64_t v3 = path;
    id v4 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      uint64_t v14 = v3;
      _os_log_debug_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEBUG, "group path: %s\n", (uint8_t *)&v13, 0xCu);
    }

    id v5 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
    id v6 = NSString;
    id v7 = v5;
    id v8 = objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));
    uint64_t v9 = [v8 stringByAppendingPathComponent:@"Library/Caches"];

    id v10 = v9;
    if (size_dir((const char *)[v10 UTF8String]))
    {
      uint64_t v11 = [NSString stringWithUTF8String:container_get_identifier()];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  return 1;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setBundleRecords:(id)a3
{
}

- (CacheDeleteVolume)cdVol
{
  return self->_cdVol;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isDataseparated
{
  return self->_isDataseparated;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isPlugin
{
  return self->_isPlugin;
}

- (NSURL)userManagedAssetsURL
{
  return self->_userManagedAssetsURL;
}

- (NSNumber)lastKnownGroupCacheSize
{
  return self->_lastKnownGroupCacheSize;
}

- (void)setLastKnownGroupCacheSize:(id)a3
{
}

- (NSNumber)lastKnownTmpSize
{
  return self->_lastKnownTmpSize;
}

- (void)setLastKnownTmpSize:(id)a3
{
}

- (NSNumber)lastKnownFreespace
{
  return self->_lastKnownFreespace;
}

- (void)setLastKnownFreespace:(id)a3
{
}

- (void)setLastUsed:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTelemetry:(id)a3
{
}

@end