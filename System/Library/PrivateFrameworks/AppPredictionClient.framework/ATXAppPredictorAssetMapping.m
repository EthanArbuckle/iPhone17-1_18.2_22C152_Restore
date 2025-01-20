@interface ATXAppPredictorAssetMapping
+ (id)assetMappingWithCachedAssets;
+ (id)getFullCachePathWithBaseCachePath:(id)a3 cacheFileBaseName:(id)a4 subScoreName:(id)a5;
+ (id)sharedInstanceWithMobileAssets;
- (ATXAppPredictorAssetMapping)initWithUseMobileAssets:(BOOL)a3;
- (id)getAssetFileAndSubscoreForConsumerSubType:(unsigned __int8)a3;
- (id)getAtxToolDescription;
- (id)getFullCachePathWithBaseCachePath:(id)a3 consumerSubType:(unsigned __int8)a4;
- (id)getFullDefaultCachePathWithConsumerSubType:(unsigned __int8)a3;
@end

@implementation ATXAppPredictorAssetMapping

- (ATXAppPredictorAssetMapping)initWithUseMobileAssets:(BOOL)a3
{
  BOOL v3 = a3;
  v6 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v7 = [v6 stringByAppendingPathComponent:@"caches/assetMapping"];

  v47.receiver = self;
  v47.super_class = (Class)ATXAppPredictorAssetMapping;
  v8 = [(ATXAppPredictorAssetMapping *)&v47 init];
  if (!v8)
  {
    id v17 = 0;
    goto LABEL_20;
  }
  if (!v3)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)MEMORY[0x1AD0D3C30]();
      id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v13 = objc_opt_class();
      v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
      v15 = (void *)MEMORY[0x1AD0D3C30]();
      id v46 = 0;
      uint64_t v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v14 fromData:v10 error:&v46];
      id v17 = v46;
      consumerSubTypeAssetMappings = v8->_consumerSubTypeAssetMappings;
      v8->_consumerSubTypeAssetMappings = (NSDictionary *)v16;

      if (v8->_consumerSubTypeAssetMappings)
      {
        id v19 = v17;
LABEL_19:

        id v17 = v19;
        goto LABEL_20;
      }

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ATXAppPredictorAssetMapping initWithUseMobileAssets:]((uint64_t)v17, v37, v38, v39, v40, v41, v42, v43);
      }

      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ATXAppPredictorAssetMapping initWithUseMobileAssets:]();
    }
  }
  id v17 = 0;
LABEL_10:
  v20 = [ATXAssetsABHelper alloc];
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [(ATXAssetsABHelper *)v20 initWithAssetsForResource:v22 ofType:@"plist" specifiedABGroup:0];

  v24 = [(ATXAssetsABHelper *)v23 abGroupContents];
  uint64_t v25 = [v24 objectForKeyedSubscript:@"consumerSubTypeToAssetFileMapping"];
  v26 = v8->_consumerSubTypeAssetMappings;
  v8->_consumerSubTypeAssetMappings = (NSDictionary *)v25;

  if (v3)
  {
    if (!v8->_consumerSubTypeAssetMappings)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:a2 object:v8 file:@"ATXAppPredictorAssetMapping.m" lineNumber:61 description:@"Could not load ATXAppPredictorAssetMapping data"];
    }
    v27 = (void *)MEMORY[0x1AD0D3C30]();
    v28 = v8->_consumerSubTypeAssetMappings;
    id v45 = v17;
    v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v28 requiringSecureCoding:1 error:&v45];
    id v19 = v45;

    if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ATXAppPredictorAssetMapping initWithUseMobileAssets:]((uint64_t)v19, v29, v30, v31, v32, v33, v34, v35);
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7];
    if (!v14 || ([v10 isEqual:v14] & 1) == 0) {
      [v10 writeToFile:v7 atomically:1];
    }
    goto LABEL_19;
  }
LABEL_20:

  return v8;
}

+ (id)assetMappingWithCachedAssets
{
  v2 = [[ATXAppPredictorAssetMapping alloc] initWithUseMobileAssets:0];

  return v2;
}

+ (id)sharedInstanceWithMobileAssets
{
  if (sharedInstanceWithMobileAssets__pasOnceToken11 != -1) {
    dispatch_once(&sharedInstanceWithMobileAssets__pasOnceToken11, &__block_literal_global_45);
  }
  v2 = (void *)sharedInstanceWithMobileAssets__pasExprOnceResult;

  return v2;
}

void __61__ATXAppPredictorAssetMapping_sharedInstanceWithMobileAssets__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  v1 = [[ATXAppPredictorAssetMapping alloc] initWithUseMobileAssets:1];
  v2 = (void *)sharedInstanceWithMobileAssets__pasExprOnceResult;
  sharedInstanceWithMobileAssets__pasExprOnceResult = (uint64_t)v1;
}

- (id)getAssetFileAndSubscoreForConsumerSubType:(unsigned __int8)a3
{
  v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a3];
  v6 = [(NSDictionary *)self->_consumerSubTypeAssetMappings objectForKeyedSubscript:v5];
  if (v6) {
    goto LABEL_7;
  }
  if (!v5)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"ATXAppPredictorAssetMapping.m" lineNumber:101 description:@"Could not find a consumerSubType mapping because an empty consumerSubTypeString was nil"];
  }
  v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ATXAppPredictorAssetMapping getAssetFileAndSubscoreForConsumerSubType:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

  v6 = [(NSDictionary *)self->_consumerSubTypeAssetMappings objectForKeyedSubscript:@"__Default"];
  if (v6)
  {
LABEL_7:
    v14 = [v6 objectForKeyedSubscript:@"assetFile"];
    v15 = [v6 objectForKeyedSubscript:@"subscore"];
  }
  else
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXAppPredictorAssetMapping getAssetFileAndSubscoreForConsumerSubType:](v6, v18, v19, v20, v21, v22, v23, v24);
    }
    v14 = @"_ATXAppPredictor";
    v15 = @"TotalScore";
  }

  uint64_t v16 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v14 second:v15];

  return v16;
}

+ (id)getFullCachePathWithBaseCachePath:(id)a3 cacheFileBaseName:(id)a4 subScoreName:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@-%@-%@", a3, a4, a5];
}

- (id)getFullDefaultCachePathWithConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v6 = [v5 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
  v7 = [(ATXAppPredictorAssetMapping *)self getFullCachePathWithBaseCachePath:v6 consumerSubType:v3];

  return v7;
}

- (id)getFullCachePathWithBaseCachePath:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = [(ATXAppPredictorAssetMapping *)self getAssetFileAndSubscoreForConsumerSubType:v4];
  uint64_t v8 = [v7 first];
  uint64_t v9 = [v7 second];
  uint64_t v10 = +[ATXAppPredictorAssetMapping getFullCachePathWithBaseCachePath:v6 cacheFileBaseName:v8 subScoreName:v9];

  return v10;
}

- (id)getAtxToolDescription
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  int v3 = 0;
  do
  {
    unsigned int v4 = v3;
    v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
    [v2 addObject:v5];

    ++v3;
  }
  while (v4 < 0x2F);
  uint64_t v33 = v2;
  uint64_t v40 = objc_opt_new();
  uint64_t v35 = objc_opt_new();
  id v37 = (id)objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obj = self->_consumerSubTypeAssetMappings;
  uint64_t v39 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v39)
  {
    id v6 = &stru_1EFD9B408;
    uint64_t v36 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v9 = MEMORY[0x1AD0D3C30]();
        uint64_t v10 = v6;
        if (([v8 isEqualToString:@"__Default"] & 1) == 0)
        {
          int v11 = [v33 containsObject:v8];
          uint64_t v12 = @" (INVALID SUBTYPE)";
          if (v11) {
            uint64_t v12 = v6;
          }
          uint64_t v10 = v12;
        }
        uint64_t v13 = [(NSDictionary *)self->_consumerSubTypeAssetMappings objectForKeyedSubscript:v8];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"assetFile"];
        v15 = (void *)v14;
        uint64_t v16 = @" (ASSET FILE NAME MISSING)";
        if (v14) {
          uint64_t v16 = (__CFString *)v14;
        }
        id v17 = v16;

        uint64_t v18 = [v13 objectForKeyedSubscript:@"subscore"];
        uint64_t v19 = (void *)v18;
        uint64_t v20 = @" (FINAL SUBSCORE NAME MISSING)";
        if (v18) {
          uint64_t v20 = (__CFString *)v18;
        }
        uint64_t v21 = v20;

        v44 = v10;
        context = (void *)v9;
        uint64_t v43 = v13;
        if ([v40 containsObject:v17])
        {
          uint64_t v42 = [[ATXAssetsABHelper alloc] initWithAssetsForResource:v17 ofType:@"plist" specifiedABGroup:0];
          uint64_t v22 = [(ATXAssetsABHelper *)v42 abGroupContents];
LABEL_22:
          uint64_t v41 = v6;
          goto LABEL_25;
        }
        if ([v35 containsObject:v17])
        {
          uint64_t v22 = 0;
          uint64_t v42 = 0;
        }
        else
        {
          uint64_t v23 = [[ATXAssetsABHelper alloc] initWithAssetsForResource:v17 ofType:@"plist" specifiedABGroup:0];
          uint64_t v22 = [(ATXAssetsABHelper *)v23 abGroupContents];
          uint64_t v42 = v23;
          if (v22)
          {
            [v40 addObject:v17];
            goto LABEL_22;
          }
          [v35 addObject:v17];
        }
        uint64_t v41 = @"(INVALID ASSET FILE)";
LABEL_25:
        uint64_t v24 = [v22 objectForKeyedSubscript:@"Scorer"];
        uint64_t v25 = [v24 objectForKeyedSubscript:v21];
        v26 = @" (MISSING FROM ASSET FILE)";
        if (v25) {
          v26 = v6;
        }
        v27 = v6;
        v28 = v26;

        uint64_t v29 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
        uint64_t v30 = [v29 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
        uint64_t v31 = +[ATXAppPredictorAssetMapping getFullCachePathWithBaseCachePath:v30 cacheFileBaseName:v17 subScoreName:v21];

        [v37 appendFormat:@"%@%@\n", v8, v44];
        [v37 appendFormat:@"    assetFile=%@%@\n", v17, v41];
        [v37 appendFormat:@"    subscore=%@%@\n", v21, v28];

        id v6 = v27;
        [v37 appendFormat:@"    cacheFilePath=%@\n", v31];
      }
      uint64_t v39 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v39);
  }

  return v37;
}

- (void).cxx_destruct
{
}

- (void)initWithUseMobileAssets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithUseMobileAssets:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ATXAppPredictorAssetMapping:cached unable to init from file", v0, 2u);
}

- (void)initWithUseMobileAssets:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getAssetFileAndSubscoreForConsumerSubType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getAssetFileAndSubscoreForConsumerSubType:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end