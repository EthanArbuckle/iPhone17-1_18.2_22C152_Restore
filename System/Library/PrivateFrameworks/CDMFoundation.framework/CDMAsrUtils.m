@interface CDMAsrUtils
+ (id)createAsrUuidCharIndexTimingMaps:(id)a3;
+ (id)createCharIndexTimingMap:(id)a3;
@end

@implementation CDMAsrUtils

+ (id)createAsrUuidCharIndexTimingMaps:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "+[CDMAsrUtils createAsrUuidCharIndexTimingMaps:]";
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Building maps of {char_index: asr_timing} for each ASR alternative", buf, 0xCu);
  }

  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 136315650;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v13 = +[CDMAsrUtils createCharIndexTimingMap:](CDMAsrUtils, "createCharIndexTimingMap:", v12, v21, (void)v22);
        v14 = [v12 idA];
        [v5 setObject:v13 forKey:v14];

        v15 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = (void *)MEMORY[0x263F71F70];
          v17 = [v12 idA];
          v18 = [v16 convertUUID:v17];
          *(_DWORD *)buf = v21;
          v27 = "+[CDMAsrUtils createAsrUuidCharIndexTimingMaps:]";
          __int16 v28 = 2112;
          v29 = v18;
          __int16 v30 = 2112;
          v31 = v13;
          _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Added asrUuid: %@ {char_index->asr_timing} asrMap: %@", buf, 0x20u);
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v9);
  }

  v19 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[CDMAsrUtils createAsrUuidCharIndexTimingMaps:]";
    __int16 v28 = 2112;
    v29 = v5;
    _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s Created asrMaps: %@", buf, 0x16u);
  }

  return v5;
}

+ (id)createCharIndexTimingMap:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = objc_msgSend(v3, "asrTokens", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "startMilliSeconds"));
        v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "beginIndex"));
        [v4 setObject:v11 forKey:v12];

        v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "endMilliSeconds"));
        v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "endIndex"));
        [v4 setObject:v13 forKey:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  v15 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    long long v22 = "+[CDMAsrUtils createCharIndexTimingMap:]";
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Created {char_index: asr_timing} dict: %@", buf, 0x16u);
  }

  return v4;
}

@end