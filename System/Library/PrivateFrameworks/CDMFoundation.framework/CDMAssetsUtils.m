@interface CDMAssetsUtils
+ (BOOL)areFactorsValid:(id)a3 inKnownFactors:(id)a4;
+ (BOOL)isNLAssetValid:(id)a3 forLocale:(id)a4;
+ (BOOL)isNLAssetValid:(id)a3 forLocale:(id)a4 withFolders:(id)a5 useFileManager:(id)a6 withAssetAvailabilityType:(int64_t)a7;
+ (BOOL)registerWithAssetsDelegate:(id)a3 withCDMAssetsInfo:(id)a4 withType:(int64_t)a5 withLocale:(id)a6;
+ (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4 withLocale:(id)a5;
+ (id)appendPathWithServiceAssetFolder:(id)a3 assetPath:(id)a4;
+ (id)cdmAssetSetToStr:(int64_t)a3;
+ (id)filterFactors:(id)a3 forAssetSets:(id)a4 withAssetSetNameToFactors:(id)a5;
+ (id)filterFactors:(id)a3 withFactorsInAssetSet:(id)a4;
+ (id)findExistFolderInAssetFolders:(id)a3 underBasePath:(id)a4 useFileManager:(id)a5;
+ (id)getAssetVersionFromAssetMetadata:(id)a3;
+ (id)getAssistantUsages:(id)a3;
+ (id)getCDMAssetsInfoForNLRouterWithLocale:(id)a3;
+ (id)getGraphNameForAssetAvailabilityType:(int64_t)a3;
+ (id)getLanguageFromLocaleString:(id)a3;
+ (id)getNLUsages:(id)a3;
+ (id)getSsuUsages:(id)a3;
+ (id)loadAssetMetadataFromAsset:(id)a3;
@end

@implementation CDMAssetsUtils

+ (id)getNLUsages:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CDMAssetsUsages);
  [(CDMAssetsUsages *)v4 addUsageForKey:0 withAssetUsageValue:v3];

  return v4;
}

+ (id)loadAssetMetadataFromAsset:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = [a3 stringByAppendingPathComponent:@"version.yaml"];
  id v35 = 0;
  v4 = [NSString stringWithContentsOfFile:v3 encoding:4 error:&v35];
  id v5 = v35;
  if (v5)
  {
    v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "+[CDMAssetsUtils loadAssetMetadataFromAsset:]";
      __int16 v39 = 2112;
      v40 = v3;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error while loading file: %@. Error: %@.", buf, 0x20u);
    }

    id v29 = objc_alloc_init(NSDictionary);
  }
  else
  {
    v28 = v3;
    v7 = [MEMORY[0x263F08708] newlineCharacterSet];
    v27 = v4;
    v8 = [v4 componentsSeparatedByCharactersInSet:v7];

    id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      v12 = @":";
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v14 length])
          {
            uint64_t v15 = [v14 rangeOfString:v12];
            if (v16) {
              BOOL v17 = v15 == 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              BOOL v17 = 1;
            }
            if (v17)
            {
              v22 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v38 = "+[CDMAssetsUtils loadAssetMetadataFromAsset:]";
                __int16 v39 = 2112;
                v40 = v14;
                _os_log_debug_impl(&dword_2263A0000, v22, OS_LOG_TYPE_DEBUG, "%s Skip invalid line: %@.", buf, 0x16u);
              }
            }
            else
            {
              uint64_t v18 = v15;
              [v14 substringToIndex:v15];
              v20 = v19 = v12;
              v21 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
              v22 = [v20 stringByTrimmingCharactersInSet:v21];

              v23 = [v14 substringFromIndex:v18 + 1];
              v24 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
              v25 = [v23 stringByTrimmingCharactersInSet:v24];

              [v29 setValue:v25 forKey:v22];
              v12 = v19;
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    v4 = v27;
    id v3 = v28;
    id v5 = 0;
  }

  return v29;
}

+ (id)getAssetVersionFromAssetMetadata:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKey:@"version"];
  if (!v4)
  {
    v4 = [v3 objectForKey:@"VERSION"];
  }
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315650;
    v8 = "+[CDMAssetsUtils getAssetVersionFromAssetMetadata:]";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Asset version is: %@ for asset metadata: %@.", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

+ (id)findExistFolderInAssetFolders:(id)a3 underBasePath:(id)a4 useFileManager:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = a4;
  id v9 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v16 = -[NSObject stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", v15, (void)v21);
        if ([v9 fileExistsAtPath:v16])
        {
          v19 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v26 = "+[CDMAssetsUtils findExistFolderInAssetFolders:underBasePath:useFileManager:]";
            __int16 v27 = 2112;
            v28 = v8;
            __int16 v29 = 2112;
            v30 = v16;
            __int16 v31 = 2112;
            long long v32 = v15;
            _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s Using basePath %@ basePath, path %@ exists. Return %@.", buf, 0x2Au);
          }

          id v18 = v15;
          BOOL v17 = v10;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "+[CDMAssetsUtils findExistFolderInAssetFolders:underBasePath:useFileManager:]";
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v8;
    _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s No folder exists in %@ under %@. Return nil.", buf, 0x20u);
  }
  id v18 = 0;
LABEL_15:

  return v18;
}

+ (id)appendPathWithServiceAssetFolder:(id)a3 assetPath:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    uint64_t v11 = "+[CDMAssetsUtils appendPathWithServiceAssetFolder:assetPath:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s NL asset path is: %@. Appending asset folder: %@ to it.", (uint8_t *)&v10, 0x20u);
  }

  v8 = [v6 stringByAppendingPathComponent:v5];

  return v8;
}

+ (id)filterFactors:(id)a3 withFactorsInAssetSet:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = a3;
  id v7 = [v5 setWithArray:a4];
  v8 = [MEMORY[0x263EFFA08] setWithArray:v6];

  [v7 intersectSet:v8];
  id v9 = [v7 allObjects];

  return v9;
}

+ (BOOL)isNLAssetValid:(id)a3 forLocale:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v8 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_15:
      BOOL v10 = 0;
      goto LABEL_16;
    }
    int v14 = 136315138;
    id v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
    uint64_t v11 = "%s NL asset is nil. It is invalid. Return NO.";
LABEL_18:
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v14, 0xCu);
    goto LABEL_15;
  }
  if (![v5 getAssetType])
  {
    v8 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    int v14 = 136315138;
    id v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
    uint64_t v11 = "%s NilAsset received. It is invalid. Return NO.";
    goto LABEL_18;
  }
  id v7 = [v5 getAssetPath];
  v8 = v7;
  if (v7 && [v7 length])
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v5 getAssetPath];
      int v14 = 136315394;
      id v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s NL asset: %@ is valid. Return YES.", (uint8_t *)&v14, 0x16u);
    }
    BOOL v10 = 1;
  }
  else
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      id v15 = "+[CDMAssetsUtils isNLAssetValid:forLocale:]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s NL asset: %@ has nil asset path. It is invalid. Return NO.", (uint8_t *)&v14, 0x16u);
    }
    BOOL v10 = 0;
  }

LABEL_16:
  return v10;
}

+ (id)filterFactors:(id)a3 forAssetSets:(id)a4 withAssetSetNameToFactors:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v7 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v15 = [v9 objectForKeyedSubscript:v14];
          __int16 v16 = +[CDMAssetsUtils filterFactors:v7 withFactorsInAssetSet:v15];
          id v17 = v16;
          if (v16 && [v16 count])
          {
            [v20 setObject:v17 forKeyedSubscript:v14];
          }
          else
          {
            uint64_t v18 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              __int16 v27 = "+[CDMAssetsUtils filterFactors:forAssetSets:withAssetSetNameToFactors:]";
              __int16 v28 = 2112;
              id v29 = v7;
              __int16 v30 = 2112;
              __int16 v31 = v15;
              __int16 v32 = 2112;
              uint64_t v33 = v14;
              _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Can't find any factor in factors: %@ among %@ that exist under assetSetName: %@. Continue.", buf, 0x2Au);
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v11);
    }
  }
  return v20;
}

+ (id)cdmAssetSetToStr:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_2647A4FE8[a3];
  }
}

+ (id)getSsuUsages:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CDMAssetsUsages);
  [(CDMAssetsUsages *)v4 addUsageForKey:0 withAssetUsageValue:v3];

  [(CDMAssetsUsages *)v4 addUsageForKey:2 withAssetUsageValue:@"enabled"];
  return v4;
}

+ (id)getAssistantUsages:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CDMAssetsUsages);
  [(CDMAssetsUsages *)v4 addUsageForKey:0 withAssetUsageValue:v3];

  [(CDMAssetsUsages *)v4 addUsageForKey:1 withAssetUsageValue:@"enabled"];
  return v4;
}

+ (BOOL)areFactorsValid:(id)a3 inKnownFactors:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v12, (void)v16) & 1) == 0)
          {
            uint64_t v14 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              long long v21 = "+[CDMAssetsUtils areFactorsValid:inKnownFactors:]";
              __int16 v22 = 2112;
              uint64_t v23 = v12;
              __int16 v24 = 2112;
              id v25 = v6;
              _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Can't find factor: %@ in factor to among known factors: %@. Return NO.", buf, 0x20u);
            }

            BOOL v13 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_14:
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

+ (BOOL)isNLAssetValid:(id)a3 forLocale:(id)a4 withFolders:(id)a5 useFileManager:(id)a6 withAssetAvailabilityType:(int64_t)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 136315906;
    __int16 v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
    __int16 v25 = 2112;
    int64_t v26 = (int64_t)v12;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Check is NL asset: %@ valid for locale: %@ with folders :%@.", (uint8_t *)&v23, 0x2Au);
  }

  if ([a1 isNLAssetValid:v12 forLocale:v13])
  {
    long long v17 = [v12 getAssetPath];
    if ([v15 fileExistsAtPath:v17])
    {
      if (a7)
      {
        long long v18 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v23 = 136315394;
          __int16 v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
          __int16 v25 = 2048;
          int64_t v26 = a7;
          _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Skipping top level folder check for assetAvailabilityType: %ld", (uint8_t *)&v23, 0x16u);
        }
        BOOL v19 = 1;
        goto LABEL_12;
      }
      if (v14 && [v14 count])
      {
        long long v21 = [a1 findExistFolderInAssetFolders:v14 underBasePath:v17 useFileManager:v15];

        if (v21)
        {
          BOOL v19 = 1;
          goto LABEL_13;
        }
        long long v18 = CDMOSLoggerForCategory(0);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
        int v23 = 136315394;
        __int16 v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
        __int16 v25 = 2112;
        int64_t v26 = (int64_t)v12;
        __int16 v22 = "%s No folder exists for NLAsset: %@. Return NO.";
        goto LABEL_22;
      }
      long long v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 136315394;
        __int16 v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
        __int16 v25 = 2112;
        int64_t v26 = (int64_t)v12;
        __int16 v22 = "%s No folders specified for NL asset %@.";
LABEL_22:
        _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v23, 0x16u);
      }
    }
    else
    {
      long long v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 136315394;
        __int16 v24 = "+[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:]";
        __int16 v25 = 2112;
        int64_t v26 = (int64_t)v17;
        __int16 v22 = "%s Base asset path does not exist %@.";
        goto LABEL_22;
      }
    }
LABEL_11:
    BOOL v19 = 0;
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

+ (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4 withLocale:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = a5;
  if (!v8)
  {
    uint64_t v9 = objc_alloc_init(CDMConfig);
    uint64_t v8 = [(CDMConfig *)v9 defaultLocaleIdentifier];
    uint64_t v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315394;
      BOOL v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      __int16 v20 = 2112;
      long long v21 = v8;
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Locale was nil. Update it to Assistant locale: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  if (a4 == 1)
  {
    uint64_t v11 = +[CDMAssetsUtils getLanguageFromLocaleString:v8];
    id v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315394;
      BOOL v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      __int16 v20 = 2112;
      long long v21 = v11;
      _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for NLRouter assets for locale: %@", (uint8_t *)&v18, 0x16u);
    }

    id v15 = +[CDMAssetsUtils getCDMAssetsInfoForNLRouterWithLocale:v11];
    if (v15)
    {
      BOOL v13 = +[CDMAssetsUtils registerWithAssetsDelegate:v7 withCDMAssetsInfo:v15 withType:1 withLocale:v11];
    }
    else
    {
      long long v16 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 136315138;
        BOOL v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
        _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Failed to initialize CDMAssetsInfo for NLRouter. Asset registration failed", (uint8_t *)&v18, 0xCu);
      }

      BOOL v13 = 0;
    }
  }
  else if (a4)
  {
    uint64_t v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      BOOL v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      _os_log_error_impl(&dword_2263A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: Asset Registration failed because of unknown assetAvailabilityType.", (uint8_t *)&v18, 0xCu);
    }
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v11 = +[CDMServiceGraph getAssetsForSetup:v8];
    id v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315394;
      BOOL v19 = "+[CDMAssetsUtils registerWithAssetsDelegate:withType:withLocale:]";
      __int16 v20 = 2112;
      long long v21 = v8;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Register assets delegate for NLX assets for locale: %@", (uint8_t *)&v18, 0x16u);
    }

    BOOL v13 = +[CDMAssetsUtils registerWithAssetsDelegate:v7 withCDMAssetsInfo:v11 withType:0 withLocale:v8];
  }

  return v13;
}

+ (BOOL)registerWithAssetsDelegate:(id)a3 withCDMAssetsInfo:(id)a4 withType:(int64_t)a5 withLocale:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = +[CDMAssetsManager getSingletonCDMAssetsManager];
  BOOL v13 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v11];
  id v25 = 0;
  [v12 setupForLocale:v13 cdmAssetsInfo:v10 error:&v25];
  id v14 = v25;

  if (v14)
  {
    id v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v27 = "+[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:]";
      __int16 v28 = 2112;
      id v29 = v11;
      long long v16 = "%s [ERR]: Error occurs while setup CDMAssetsManager with locale: %@. Return NO.";
      long long v17 = v15;
      uint32_t v18 = 22;
LABEL_10:
      _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v24 = 0;
  unsigned int v19 = [v12 registerForCDMAssetsInfo:v10 withLocale:v11 withAssetsDelegate:v9 selfContextId:0 selfMetadata:0 dataDispatcherContext:0 withAssetAvailabilityType:a5 withError:&v24];
  id v14 = v24;
  __int16 v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v23 = +[CDMAssetsUtils getGraphNameForAssetAvailabilityType:a5];
    *(_DWORD *)buf = 136315650;
    __int16 v27 = "+[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:]";
    __int16 v28 = 2112;
    id v29 = v23;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Registration status for graph: %@ is %ld", buf, 0x20u);
  }
  if ((v19 & 1) == 0)
  {
    id v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v27 = "+[CDMAssetsUtils registerWithAssetsDelegate:withCDMAssetsInfo:withType:withLocale:]";
      long long v16 = "%s [ERR]: Error occurs while registering. Return NO.";
      long long v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_10;
    }
LABEL_11:

    BOOL v21 = 0;
    goto LABEL_12;
  }
  BOOL v21 = 1;
LABEL_12:

  return v21;
}

+ (id)getCDMAssetsInfoForNLRouterWithLocale:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[CDMAssetsUtils getLanguageFromLocaleString:v3];
  if (v4)
  {
    int v23 = v4;
    id v5 = [CDMAssetsInfo alloc];
    id v6 = +[CDMAssetsUtils getGraphNameForAssetAvailabilityType:1];
    id v7 = [(CDMAssetsInfo *)v5 initWithGraphName:v6];

    uint64_t v8 = [CDMAssetsFactorConfig alloc];
    uint64_t v9 = MEMORY[0x263EFFA68];
    v30[0] = @"com.apple.if.planner.nlrouter.base";
    v30[1] = @"com.apple.if.planner.nlrouter.tokenizer";
    v31[0] = MEMORY[0x263EFFA68];
    v31[1] = MEMORY[0x263EFFA68];
    id v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    id v11 = [(CDMAssetsFactorConfig *)v8 initWithFactorToFoldersMapping:v10];

    uint64_t v12 = MEMORY[0x263EFFA88];
    v28[0] = @"com.apple.if.planner.nlrouter.base";
    v28[1] = @"com.apple.if.planner.nlrouter.tokenizer";
    v29[0] = MEMORY[0x263EFFA88];
    v29[1] = MEMORY[0x263EFFA88];
    BOOL v13 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    [(CDMAssetsFactorConfig *)v11 setFactorToIsRequiredMapping:v13];

    id v14 = [CDMAssetsFactorConfig alloc];
    int64_t v26 = @"com.apple.if.planner.nlrouter.overrides";
    uint64_t v27 = v9;
    id v15 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    long long v16 = [(CDMAssetsFactorConfig *)v14 initWithFactorToFoldersMapping:v15];

    id v24 = @"com.apple.if.planner.nlrouter.overrides";
    uint64_t v25 = v12;
    long long v17 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [(CDMAssetsFactorConfig *)v16 setFactorToIsRequiredMapping:v17];

    uint32_t v18 = objc_alloc_init(CDMAssetsUsages);
    unsigned int v19 = +[CDMAssetsUtils getLanguageFromLocaleString:v3];
    [(CDMAssetsUsages *)v18 addUsageForKey:3 withAssetUsageValue:v19];

    __int16 v20 = objc_alloc_init(CDMAssetsUsages);
    BOOL v21 = +[CDMAssetsUtils getLanguageFromLocaleString:v3];
    [(CDMAssetsUsages *)v20 addUsageForKey:3 withAssetUsageValue:v21];

    [(CDMAssetsInfo *)v7 setAssetsUsages:v18 withCDMAssetsFactorConfig:v11 forCDMAssetSet:2];
    [(CDMAssetsInfo *)v7 setAssetsUsages:v20 withCDMAssetsFactorConfig:v16 forCDMAssetSet:3];

    v4 = v23;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)getLanguageFromLocaleString:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"_"];
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    id v11 = "+[CDMAssetsUtils getLanguageFromLocaleString:]";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Extracted language: %@ from locale: %@", (uint8_t *)&v10, 0x20u);
  }

  if (v5 && [v5 length])
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "+[CDMAssetsUtils getLanguageFromLocaleString:]";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while setup CDMAssetsManager with locale: %@. Return NO.", (uint8_t *)&v10, 0x16u);
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)getGraphNameForAssetAvailabilityType:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = @"NLRouterNoGraph";
  }
  else if (a3)
  {
    id v5 = 0;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end