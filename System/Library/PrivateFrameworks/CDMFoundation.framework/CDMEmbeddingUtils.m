@interface CDMEmbeddingUtils
+ (BOOL)isValidEmbeddingVersionOnlyNumber:(id)a3;
+ (id)setStringToJSONDictionaryWithError:(id *)a3 stringToConvert:(id)a4;
@end

@implementation CDMEmbeddingUtils

+ (id)setStringToJSONDictionaryWithError:(id *)a3 stringToConvert:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F08900];
  v6 = [a4 dataUsingEncoding:4];
  id v14 = 0;
  v7 = [v5 JSONObjectWithData:v6 options:0 error:&v14];
  id v8 = v14;

  if (v8)
  {
    *a3 = v8;
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a3;
      *(_DWORD *)buf = 136315394;
      v16 = "+[CDMEmbeddingUtils setStringToJSONDictionaryWithError:stringToConvert:]";
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to convert string to JSONDictionary with error: %@.", buf, 0x16u);
    }

    id v10 = objc_alloc_init(NSDictionary);
  }
  else
  {
    id v10 = v7;
  }
  v11 = v10;

  return v11;
}

+ (BOOL)isValidEmbeddingVersionOnlyNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [a3 componentsSeparatedByString:@"."];
  if ([v3 count] == 3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          if ((objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "intValue", (void)v12) & 0x80000000) != 0)
          {
            id v10 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              id v18 = "+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:]";
              _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s The embedding Version is invalid as it less than 0.", buf, 0xCu);
            }

            goto LABEL_16;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        BOOL v9 = 1;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:]";
      _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s The embeddingVersion is invalid as it contains more than or less than 3 portions. The valid format is {OS}.{NCV}.{Patch}.", buf, 0xCu);
    }
LABEL_16:
    BOOL v9 = 0;
  }

  return v9;
}

@end