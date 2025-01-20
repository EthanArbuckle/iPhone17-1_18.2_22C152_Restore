@interface CESRGeoLMRegionIDCache
+ (id)sharedInstance;
- (CESRGeoLMRegionIDCache)init;
- (CESRGeoLMRegionIDCache)initWithUserDefaults:(id)a3;
- (id)_geoLMAssetsInfoDictForLanguage:(id)a3;
- (id)_userDefaultsGeoLMAssetsInfoDictKeyForLanguage:(id)a3;
- (id)lastUsedGeoLMRegionIdForLanguage:(id)a3;
- (id)purgeUnusedGeoLMRegionIdFromCacheForLanguage:(id)a3;
- (void)_updateUserDefaultsWithGeoLMAssetsInfoDict:(id)a3 language:(id)a4;
- (void)purgeUserDefaultsGeoLMAssetsInfoDictForLanguages:(id)a3;
- (void)updateGeoLMAssetsInfoDictWithRegionId:(id)a3 language:(id)a4;
@end

@implementation CESRGeoLMRegionIDCache

- (void).cxx_destruct
{
}

- (id)_userDefaultsGeoLMAssetsInfoDictKeyForLanguage:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  v4 = [@"GeoLMAssetsInfo" stringByAppendingString:@"."];
  v5 = [v4 stringByAppendingString:v3];

  return v5;
}

- (void)_updateUserDefaultsWithGeoLMAssetsInfoDict:(id)a3 language:(id)a4
{
  userDefaults = self->_userDefaults;
  id v7 = a3;
  id v8 = [(CESRGeoLMRegionIDCache *)self _userDefaultsGeoLMAssetsInfoDictKeyForLanguage:a4];
  [(NSUserDefaults *)userDefaults setObject:v7 forKey:v8];
}

- (id)_geoLMAssetsInfoDictForLanguage:(id)a3
{
  userDefaults = self->_userDefaults;
  v4 = [(CESRGeoLMRegionIDCache *)self _userDefaultsGeoLMAssetsInfoDictKeyForLanguage:a3];
  v5 = [(NSUserDefaults *)userDefaults dictionaryForKey:v4];

  return v5;
}

- (void)purgeUserDefaultsGeoLMAssetsInfoDictForLanguages:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    v9 = (os_log_t *)MEMORY[0x1E4F4E380];
    *(void *)&long long v6 = 136315394;
    long long v13 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = -[CESRGeoLMRegionIDCache _userDefaultsGeoLMAssetsInfoDictKeyForLanguage:](self, "_userDefaultsGeoLMAssetsInfoDictKeyForLanguage:", *(void *)(*((void *)&v14 + 1) + 8 * v10), v13);
        v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v13;
          v19 = "-[CESRGeoLMRegionIDCache purgeUserDefaultsGeoLMAssetsInfoDictForLanguages:]";
          __int16 v20 = 2112;
          v21 = v11;
          _os_log_debug_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_DEBUG, "%s GeoLM: Going to delete: %@", buf, 0x16u);
        }
        [(NSUserDefaults *)self->_userDefaults removeObjectForKey:v11];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
}

- (id)lastUsedGeoLMRegionIdForLanguage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CESRGeoLMRegionIDCache *)self _geoLMAssetsInfoDictForLanguage:v4];
  if ([v5 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v6);
          }
          long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, (void)v22);
          long long v15 = v14;
          if (v10 | v9)
          {
            if (v14 && [v14 compare:v9] == 1)
            {
              id v16 = v13;

              id v17 = v15;
              unint64_t v9 = (unint64_t)v17;
              unint64_t v10 = (unint64_t)v16;
            }
          }
          else
          {
            unint64_t v10 = v13;
            unint64_t v9 = v15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
      unint64_t v10 = 0;
    }

    id v19 = (id)v10;
    __int16 v20 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CESRGeoLMRegionIDCache lastUsedGeoLMRegionIdForLanguage:]";
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_debug_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_DEBUG, "%s GeoLM: Last used GeoLM regionId: %@", buf, 0x16u);
    }
  }
  else
  {
    v18 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[CESRGeoLMRegionIDCache lastUsedGeoLMRegionIdForLanguage:]";
      _os_log_debug_impl(&dword_1B8CCB000, v18, OS_LOG_TYPE_DEBUG, "%s GeoLM: No history of GeoLM usage. regionId: nil", buf, 0xCu);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)purgeUnusedGeoLMRegionIdFromCacheForLanguage:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _AFPreferencesBoolValueForKeyWithContext();
  id v6 = [(CESRGeoLMRegionIDCache *)self _geoLMAssetsInfoDictForLanguage:v4];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [v7 count];
  uint64_t v9 = v8;
  if (v5)
  {
    unint64_t v10 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[CESRGeoLMRegionIDCache purgeUnusedGeoLMRegionIdFromCacheForLanguage:]";
      __int16 v40 = 2048;
      uint64_t v41 = v9;
      _os_log_debug_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_DEBUG, "%s GeoLM: GeoLM region specific assets deletion is disabled, number of regionIds used till now: %ld", buf, 0x16u);
    }
    goto LABEL_5;
  }
  if (v8 < 2)
  {
LABEL_5:
    id v11 = 0;
    goto LABEL_26;
  }
  uint64_t v33 = v8;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v44 count:16];
  uint64_t v31 = self;
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v12);
        }
        id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        __int16 v20 = objc_msgSend(v12, "objectForKeyedSubscript:", v19, v31);
        v21 = v20;
        if (v16 | v15)
        {
          if ([v20 compare:v15] == -1)
          {
            id v22 = v19;

            id v23 = v21;
            unint64_t v15 = (unint64_t)v23;
            unint64_t v16 = (unint64_t)v22;
          }
        }
        else
        {
          unint64_t v16 = v19;
          unint64_t v15 = v21;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
  }

  id v11 = (id)v16;
  if (v33 != 2)
  {
    id v29 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "-[CESRGeoLMRegionIDCache purgeUnusedGeoLMRegionIdFromCacheForLanguage:]";
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v11;
      __int16 v42 = 2048;
      uint64_t v43 = v33;
      v27 = "%s GeoLM: regionIdToBePurged: %@, _geoLMAssetsInfoDict count: %ld";
      __int16 v28 = v29;
      goto LABEL_30;
    }
LABEL_24:
    objc_msgSend(v12, "removeObjectForKey:", v11, v31);
    [v32 _updateUserDefaultsWithGeoLMAssetsInfoDict:v12 language:v4];
    goto LABEL_25;
  }
  long long v24 = [v12 valueForKey:v11];
  uint64_t v25 = +[CESRUtilities calculateDiffInDaysFromTimestamp:v24];

  if (v25 >= 8)
  {
    v26 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "-[CESRGeoLMRegionIDCache purgeUnusedGeoLMRegionIdFromCacheForLanguage:]";
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v11;
      __int16 v42 = 2048;
      uint64_t v43 = v25;
      v27 = "%s GeoLM: regionIdToBePurged: %@, lastWhenUsed: %ld days ago";
      __int16 v28 = v26;
LABEL_30:
      _os_log_debug_impl(&dword_1B8CCB000, v28, OS_LOG_TYPE_DEBUG, v27, buf, 0x20u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
LABEL_25:

LABEL_26:

  return v11;
}

- (void)updateGeoLMAssetsInfoDictWithRegionId:(id)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CESRGeoLMRegionIDCache *)self _geoLMAssetsInfoDictForLanguage:v6];
  id v13 = (id)[v8 mutableCopy];

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  if (!v13) {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v12 = [NSNumber numberWithDouble:v11];
  [v13 setObject:v12 forKey:v7];

  [(CESRGeoLMRegionIDCache *)self _updateUserDefaultsWithGeoLMAssetsInfoDict:v13 language:v6];
}

- (CESRGeoLMRegionIDCache)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CESRGeoLMRegionIDCache;
  id v6 = [(CESRGeoLMRegionIDCache *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
  }

  return v7;
}

- (CESRGeoLMRegionIDCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CESRGeoLMRegionIDCache;
  v2 = [(CESRGeoLMRegionIDCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_3811);
  }
  v2 = (void *)sharedInstance_geoLMRegionIDCache;

  return v2;
}

uint64_t __40__CESRGeoLMRegionIDCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CESRGeoLMRegionIDCache);
  uint64_t v1 = sharedInstance_geoLMRegionIDCache;
  sharedInstance_geoLMRegionIDCache = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end