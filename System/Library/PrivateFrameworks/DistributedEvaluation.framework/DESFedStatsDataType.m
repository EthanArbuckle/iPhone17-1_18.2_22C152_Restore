@interface DESFedStatsDataType
+ (id)extractFedStatsDataTypeFrom:(id)a3 forKey:(id *)a4;
+ (void)initialize;
@end

@implementation DESFedStatsDataType

+ (id)extractFedStatsDataTypeFrom:(id)a3 forKey:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 recipeUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"MetadataEncoding"];

  v8 = [v7 allKeys];
  v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v25 = a4;
    uint64_t v12 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 = [v7 objectForKeyedSubscript:v14];
        v16 = [v15 objectForKeyedSubscript:@"type"];
        int v17 = [v16 isEqualToString:@"fedstats"];

        if (v17)
        {
          v19 = (void *)sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
          {
            v20 = v19;
            v21 = [v5 recipeID];
            *(_DWORD *)buf = 138412546;
            v32 = v21;
            __int16 v33 = 2112;
            v34 = v14;
            _os_log_impl(&dword_1BECCB000, v20, OS_LOG_TYPE_INFO, "Recipe %@ has schema for key %@ to use FedStats encoding.", buf, 0x16u);
          }
          v22 = [v15 objectForKeyedSubscript:@"dataContentTypes"];

          if (v22)
          {
            id *v25 = v14;
            v18 = [v15 objectForKeyedSubscript:@"dataContentTypes"];
          }
          else
          {
            v23 = (void *)sLog;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
              +[DESFedStatsDataType extractFedStatsDataTypeFrom:forKey:](v23, v5, (uint64_t)v14);
            }
            v18 = 0;
          }

          goto LABEL_19;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    v18 = 0;
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.DistributedEvaluation", "DESFedStatsDataType");
    MEMORY[0x1F41817F8]();
  }
}

+ (void)extractFedStatsDataTypeFrom:(uint64_t)a3 forKey:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  v6 = [a2 recipeID];
  int v7 = 138412802;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  __int16 v11 = 2112;
  uint64_t v12 = @"dataContentTypes";
  _os_log_error_impl(&dword_1BECCB000, v5, OS_LOG_TYPE_ERROR, "Recipe %@ has schema for key %@ to use FedStats encoding, but the schema key is not %@.", (uint8_t *)&v7, 0x20u);
}

@end