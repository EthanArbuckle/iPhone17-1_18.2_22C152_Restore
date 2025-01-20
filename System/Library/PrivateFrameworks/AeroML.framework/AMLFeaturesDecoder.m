@interface AMLFeaturesDecoder
+ (id)dataMetricsForFeatureProvider:(id)a3;
+ (id)dictionariesFromBatchProvider:(id)a3;
+ (id)logger;
+ (id)modelArrayForArrayProvider:(id)a3;
+ (id)modelContentForBatchProvider:(id)a3;
+ (id)modelDataFrom:(id)a3;
@end

@implementation AMLFeaturesDecoder

+ (id)logger
{
  if (logger_onceToken_0 != -1) {
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)logger_logger_0;

  return v2;
}

void __28__AMLFeaturesDecoder_logger__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.aeroml.AMLFramework", "AMLFeaturesDecoder");
  v1 = (void *)logger_logger_0;
  logger_logger_0 = (uint64_t)v0;

  if (!logger_logger_0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __31__AMLPhotosShareMetrics_logger__block_invoke_cold_1();
  }
}

+ (id)modelDataFrom:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v3, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  id v14 = 0;
  v10 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v9 fromData:v4 error:&v14];

  id v11 = v14;
  if (v11)
  {
    v12 = +[AMLFeaturesDecoder logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[AMLFeaturesDecoder modelDataFrom:](v11, v12);
    }
  }

  return v10;
}

+ (id)modelArrayForArrayProvider:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v26 = (id)objc_opt_new();
  v22 = v3;
  id v4 = [v3 array];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 featureNames];
  v25 = [v6 allObjects];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
        v9 = objc_opt_new();
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v10 = v25;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v30;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * v14);
              v16 = [v8 featureValueForName:v15];
              if ([v16 type] == 1)
              {
                uint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "int64Value"));
LABEL_17:
                v19 = (void *)v17;
                [v9 setObject:v17 forKeyedSubscript:v15];

                goto LABEL_18;
              }
              if ([v16 type] == 2)
              {
                v18 = NSNumber;
                [v16 doubleValue];
                uint64_t v17 = objc_msgSend(v18, "numberWithDouble:");
                goto LABEL_17;
              }
              if ([v16 type] == 3)
              {
                uint64_t v17 = [v16 stringValue];
                goto LABEL_17;
              }
              [v9 setObject:0 forKeyedSubscript:v15];
LABEL_18:

              ++v14;
            }
            while (v12 != v14);
            uint64_t v20 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
            uint64_t v12 = v20;
          }
          while (v20);
        }

        [v26 addObject:v9];
        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }

  return v26;
}

+ (id)dataMetricsForFeatureProvider:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)dictionariesFromBatchProvider:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v15 = (id)objc_opt_new();
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v6 = [v3 featuresAtIndex:v4];
      uint64_t v7 = [v6 featureNames];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            uint64_t v13 = [v6 featureValueForName:v12];
            [v5 setObject:v13 forKeyedSubscript:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
      [v15 addObject:v5];

      ++v4;
    }
    while (v4 < [v3 count]);
  }

  return v15;
}

+ (id)modelContentForBatchProvider:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a1 dictionariesFromBatchProvider:v4];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

+ (void)modelDataFrom:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = [a1 localizedDescription];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_24775E000, a2, OS_LOG_TYPE_ERROR, "Encountered error when unarchiving model data: %@ Description: %@", (uint8_t *)&v5, 0x16u);
}

@end