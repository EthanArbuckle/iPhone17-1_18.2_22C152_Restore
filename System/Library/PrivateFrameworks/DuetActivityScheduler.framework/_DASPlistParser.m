@interface _DASPlistParser
+ (id)sharedInstance;
- (BOOL)containsOverrideForActivity:(id)a3 withLimitation:(id)a4;
- (NSDictionary)overrideActivities;
- (NSMutableDictionary)plistToDictionaryMap;
- (_DASPlistParser)init;
- (id)dictionaryForPlist:(int64_t)a3;
- (id)loadOverrides;
- (void)loadOverrides;
- (void)loadPlist:(int64_t)a3;
- (void)setOverrideActivities:(id)a3;
- (void)setPlistToDictionaryMap:(id)a3;
@end

@implementation _DASPlistParser

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___DASPlistParser_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

- (BOOL)containsOverrideForActivity:(id)a3 withLimitation:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  if (v8)
  {
    v9 = self->_overrideActivities;
    objc_sync_enter(v9);
    v10 = [(NSDictionary *)self->_overrideActivities objectForKeyedSubscript:v7];
    int v11 = [v10 containsObject:v8];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          v11 |= objc_msgSend(v8, "containsString:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    objc_sync_exit(v9);
  }
  else
  {
    v16 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      -[_DASPlistParser containsOverrideForActivity:withLimitation:]((uint64_t)v6, v16);
    }
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

- (_DASPlistParser)init
{
  v9.receiver = self;
  v9.super_class = (Class)_DASPlistParser;
  v2 = [(_DASPlistParser *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    plistToDictionaryMap = v2->_plistToDictionaryMap;
    v2->_plistToDictionaryMap = (NSMutableDictionary *)v3;

    os_log_t v5 = os_log_create((const char *)[@"com.apple.duetactivityscheduler" UTF8String], (const char *)objc_msgSend(@"plist", "UTF8String"));
    id v6 = (void *)_log;
    _log = (uint64_t)v5;

    if (!v2->_overrideActivities) {
      id v7 = [(_DASPlistParser *)v2 loadOverrides];
    }
  }
  return v2;
}

- (id)dictionaryForPlist:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  plistToDictionaryMap = v4->_plistToDictionaryMap;
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(NSMutableDictionary *)plistToDictionaryMap objectForKeyedSubscript:v6];

  if (!v7) {
    [(_DASPlistParser *)v4 loadPlist:a3];
  }
  v8 = v4->_plistToDictionaryMap;
  objc_super v9 = [NSNumber numberWithInteger:a3];
  v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];

  objc_sync_exit(v4);

  return v10;
}

- (void)loadPlist:(int64_t)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  v30[0] = &unk_1F0E6ECE0;
  os_log_t v5 = [@"/System/Library/DuetActivityScheduler/Scheduler/Resources/" stringByAppendingString:@"com.apple.dasd.fastpass.activities.plist"];
  v31[0] = v5;
  v30[1] = &unk_1F0E6ECF8;
  id v6 = [@"/System/Library/DuetActivityScheduler/Scheduler/Resources/" stringByAppendingString:@"com.apple.dasd.features.plist"];
  v31[1] = v6;
  v30[2] = &unk_1F0E6ED10;
  id v7 = [@"/System/Library/DuetActivityScheduler/Scheduler/Resources/" stringByAppendingString:@"com.apple.dasd.allowlist.activities.plist"];
  v31[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

  objc_super v9 = [NSNumber numberWithInteger:a3];
  v10 = [v8 objectForKey:v9];

  int v11 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v10];
  id v12 = [v11 readDataToEndOfFile];
  if ([v12 length])
  {
    id v24 = 0;
    uint64_t v25 = 100;
    uint64_t v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:&v25 error:&v24];
    id v14 = v24;
    v15 = v14;
    v16 = (void *)_log;
    if (!v13 || v14)
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        [(_DASPlistParser *)v16 loadPlist:v8];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG))
      {
        v22 = NSNumber;
        long long v20 = v16;
        uint64_t v23 = [v22 numberWithInteger:a3];
        long long v21 = [v8 objectForKey:v23];
        *(_DWORD *)buf = 138412546;
        v27 = v21;
        __int16 v28 = 2112;
        v29 = v13;
        _os_log_debug_impl(&dword_1B578B000, v20, OS_LOG_TYPE_DEBUG, "Successfully read plist %@:%@", buf, 0x16u);
      }
      plistToDictionaryMap = self->_plistToDictionaryMap;
      long long v18 = objc_msgSend(NSNumber, "numberWithInteger:", a3, v21);
      [(NSMutableDictionary *)plistToDictionaryMap setObject:v13 forKey:v18];
    }
  }
  else
  {
    long long v19 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      [(_DASPlistParser *)v19 loadPlist:v8];
    }
  }
}

- (id)loadOverrides
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  obuint64_t j = v2;
  overrideActivities = v2->_overrideActivities;
  if (overrideActivities)
  {
LABEL_2:
    v4 = overrideActivities;
    goto LABEL_3;
  }
  v26 = [(_DASPlistParser *)v2 dictionaryForPlist:1];
  if ([v26 count])
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v26 allKeys];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v24 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        uint64_t v27 = v7;
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v24);
          }
          uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v29 = [v26 objectForKeyedSubscript:v9];
          v10 = [v29 objectForKeyedSubscript:@"LimitationOverrides"];
          if (v10)
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v28 = v10;
            id v11 = v10;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v31;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v31 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * j);
                  v16 = [v6 objectForKeyedSubscript:v15];
                  BOOL v17 = v16 == 0;

                  if (v17)
                  {
                    long long v18 = [MEMORY[0x1E4F1CA80] set];
                    [v6 setObject:v18 forKeyedSubscript:v15];
                  }
                  long long v19 = [v6 objectForKeyedSubscript:v15];
                  [v19 addObject:v9];
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v12);
            }

            v10 = v28;
          }
        }
        uint64_t v7 = [v24 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v7);
    }

    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v6];
    long long v21 = obj->_overrideActivities;
    obj->_overrideActivities = (NSDictionary *)v20;

    overrideActivities = obj->_overrideActivities;
    goto LABEL_2;
  }
  v22 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    -[_DASPlistParser loadOverrides](v22);
  }

  v4 = 0;
LABEL_3:
  objc_sync_exit(obj);

  return v4;
}

- (NSMutableDictionary)plistToDictionaryMap
{
  return self->_plistToDictionaryMap;
}

- (void)setPlistToDictionaryMap:(id)a3
{
}

- (NSDictionary)overrideActivities
{
  return self->_overrideActivities;
}

- (void)setOverrideActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideActivities, 0);

  objc_storeStrong((id *)&self->_plistToDictionaryMap, 0);
}

- (void)loadPlist:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  os_log_t v5 = NSNumber;
  id v6 = a1;
  uint64_t v7 = [v5 numberWithInteger:a2];
  v8 = [a3 objectForKey:v7];
  OUTLINED_FUNCTION_0_0(&dword_1B578B000, v9, v10, "Failed to read file %@", v11, v12, v13, v14, 2u);
}

- (void)loadPlist:(void *)a3 .cold.2(void *a1, uint64_t a2, void *a3)
{
  os_log_t v5 = NSNumber;
  id v6 = a1;
  uint64_t v7 = [v5 numberWithInteger:a2];
  v8 = [a3 objectForKey:v7];
  OUTLINED_FUNCTION_0_0(&dword_1B578B000, v9, v10, "Failed to convert plist %@ to dictionary", v11, v12, v13, v14, 2u);
}

- (void)loadOverrides
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B578B000, log, OS_LOG_TYPE_ERROR, "Can't load override plist", v1, 2u);
}

- (void)containsOverrideForActivity:(uint64_t)a1 withLimitation:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B578B000, a2, OS_LOG_TYPE_ERROR, "No identifier for %@", (uint8_t *)&v2, 0xCu);
}

@end