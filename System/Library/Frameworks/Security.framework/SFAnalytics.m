@interface SFAnalytics
+ (BOOL)parseEventFilter:(id)a3 format:(id)a4 error:(id *)a5;
+ (BOOL)parseRules:(id)a3 format:(id)a4 error:(id *)a5;
+ (BOOL)parseVersions:(id)a3 format:(id)a4 error:(id *)a5;
+ (NSString)databasePath;
+ (id)defaultAnalyticsDatabasePath:(id)a3;
+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3;
+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3 uuid:(id)a4;
+ (id)encodeSFACollection:(id)a3 error:(id *)a4;
+ (id)fuzzyNumber:(id)a3;
+ (id)hwModelID;
+ (id)logger;
+ (id)parseAction:(id)a3 error:(id *)a4;
+ (id)treeOfUnderlyingErrors:(id)a3 depth:(int64_t)a4;
+ (id)underlyingErrors:(id)a3;
+ (int64_t)fuzzyDaysSinceDate:(id)a3;
+ (int64_t)fuzzyInteger:(int64_t)a3;
+ (void)addOSVersionToEvent:(id)a3;
+ (void)removeLegacyDefaultAnalyticsDatabasePath:(id)a3 usingDispatchToken:(int64_t *)a4;
- (NSMutableSet)metricsHooks;
- (SFAnalytics)init;
- (SFAnalyticsCollection)collection;
- (id)AddMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5;
- (id)addMetricSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5;
- (id)coreAnalyticsKeyFilter:(id)a3;
- (id)dailyMetrics;
- (id)dataPropertyForKey:(id)a3;
- (id)database;
- (id)datePropertyForKey:(id)a3;
- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4 eventClass:(int64_t)a5 timestampBucket:(double)a6;
- (id)existingMetricSamplerForName:(id)a3;
- (id)existingMultiSamplerForName:(id)a3;
- (id)logSystemMetricsForActivityNamed:(id)a3 withAction:(id)a4;
- (id)metricsAccountID;
- (id)numberPropertyForKey:(id)a3;
- (id)startLogSystemMetricsForActivityNamed:(id)a3;
- (void)addMetricsHook:(id)a3;
- (void)dailyCoreAnalyticsMetrics:(id)a3;
- (void)drainLogQueue;
- (void)incrementIntegerPropertyForKey:(id)a3;
- (void)loadCollectionConfiguration;
- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5;
- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5 timestampBucket:(unsigned int)a6;
- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5;
- (void)logMetric:(id)a3 withName:(id)a4;
- (void)logMetric:(id)a3 withName:(id)a4 oncePerReport:(BOOL)a5;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 timestampBucket:(unsigned int)a6;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6 timestampBucket:(unsigned int)a7;
- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5;
- (void)logSuccessForEventNamed:(id)a3;
- (void)logSuccessForEventNamed:(id)a3 timestampBucket:(unsigned int)a4;
- (void)noteEventNamed:(id)a3;
- (void)noteEventNamed:(id)a3 timestampBucket:(unsigned int)a4;
- (void)noteLaunchSequence:(id)a3;
- (void)removeMetricSamplerForName:(id)a3;
- (void)removeMetricsHook:(id)a3;
- (void)removeMultiSamplerForName:(id)a3;
- (void)removeState;
- (void)removeStateAndUnlinkFile:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setDataProperty:(id)a3 forKey:(id)a4;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setMetricsAccountID:(id)a3;
- (void)setMetricsHooks:(id)a3;
- (void)setNumberProperty:(id)a3 forKey:(id)a4;
- (void)updateCollectionConfigurationWithData:(id)a3;
@end

@implementation SFAnalytics

void __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && (WeakRetained[40] & 1) == 0)
  {
    id v15 = WeakRetained;
    v3 = [WeakRetained database];
    [v3 begin];

    LODWORD(v4) = *(_DWORD *)(a1 + 72);
    v5 = [*(id *)(a1 + 32) eventDictForEventName:*(void *)(a1 + 40) withAttributes:*(void *)(a1 + 48) eventClass:*(void *)(a1 + 64) timestampBucket:(double)v4];
    v6 = v15;
    switch(*(void *)(a1 + 64))
    {
      case 0:
        LOBYTE(v7) = *(unsigned char *)(a1 + 76);
        goto LABEL_15;
      case 1:
        int v8 = *(_DWORD *)(a1 + 76);
        if ((v8 & 1) == 0)
        {
          v9 = [v15 database];
          [v9 addEventDict:v5 toTable:@"hard_failures" timestampBucket:*(unsigned int *)(a1 + 72)];

          v6 = v15;
          int v8 = *(_DWORD *)(a1 + 76);
        }
        if ((v8 & 2) != 0) {
          goto LABEL_20;
        }
        v10 = [v6 database];
        [v10 incrementHardFailureCountForEventType:*(void *)(a1 + 40)];
        break;
      case 2:
        int v11 = *(_DWORD *)(a1 + 76);
        if ((v11 & 1) == 0)
        {
          v12 = [v15 database];
          [v12 addEventDict:v5 toTable:@"soft_failures" timestampBucket:*(unsigned int *)(a1 + 72)];

          v6 = v15;
          int v11 = *(_DWORD *)(a1 + 76);
        }
        if ((v11 & 2) != 0) {
          goto LABEL_20;
        }
        v10 = [v6 database];
        [v10 incrementSoftFailureCountForEventType:*(void *)(a1 + 40)];
        break;
      case 3:
        int v7 = *(_DWORD *)(a1 + 76);
        if ((v7 & 1) == 0)
        {
          v13 = [v15 database];
          [v13 addEventDict:v5 toTable:@"notes" timestampBucket:*(unsigned int *)(a1 + 72)];

          v6 = v15;
          int v7 = *(_DWORD *)(a1 + 76);
        }
LABEL_15:
        if ((v7 & 2) != 0) {
          goto LABEL_20;
        }
        v10 = [v6 database];
        [v10 incrementSuccessCountForEventType:*(void *)(a1 + 40)];
        break;
      case 4:
        if (*(unsigned char *)(a1 + 76)) {
          goto LABEL_20;
        }
        v10 = [v15 database];
        [v10 addRockwellDict:*(void *)(a1 + 40) userinfo:v5 toTable:@"rockwell" timestampBucket:*(unsigned int *)(a1 + 72)];
        break;
      default:
        goto LABEL_20;
    }

LABEL_20:
    v14 = [v15 database];
    [v14 end];

    WeakRetained = v15;
  }
}

+ (id)logger
{
  if ((id)objc_opt_class() == a1)
  {
    v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "attempt to instatiate abstract class SFAnalytics", v8, 2u);
    }

    id v4 = 0;
  }
  else
  {
    id v3 = a1;
    objc_sync_enter(v3);
    objc_getAssociatedObject(v3, "SFAnalyticsInstance");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      id v4 = objc_alloc_init((Class)v3);
      objc_setAssociatedObject(v3, "SFAnalyticsInstance", v4, (void *)0x301);
    }
    objc_sync_exit(v3);

    id v5 = (id)[v4 database];
  }

  return v4;
}

- (id)database
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  if (!database)
  {
    id v4 = [(id)objc_opt_class() databasePath];
    +[SFAnalyticsSQLiteStore storeWithPath:v4 schema:@"CREATE TABLE IF NOT EXISTS hard_failures (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_hard_failures;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_hard_failures_v2 AFTER INSERT ON hard_failures\nBEGIN\nDELETE FROM hard_failures WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS soft_failures (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_soft_failures;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_soft_failures_v2 AFTER INSERT ON soft_failures\nBEGIN\nDELETE FROM soft_failures WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS notes (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_notes;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_notes_v2 AFTER INSERT ON notes\nBEGIN\nDELETE FROM notes WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS samples (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,\nname STRING,\nvalue REAL\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_samples;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_samples_v2 AFTER INSERT ON samples\nBEGIN\nDELETE FROM samples WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS success_count (\nevent_type STRING PRIMARY KEY,\nsuccess_count INTEGER,\nhard_failure_count INTEGER,\nsoft_failure_count INTEGER\n);\nCREATE TABLE IF NOT EXISTS rockwell (\nevent_type STRING PRIMARY KEY,\ntimestamp REAL,data BLOB\n);\nDROP TABLE IF EXISTS all_events;\n"];
    id v5 = (SFAnalyticsSQLiteStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_database;
    self->_database = v5;

    database = self->_database;
    if (!database)
    {
      int v7 = secLogObjForScope("SecCritical");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        int v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "Did not get a database! (Client %@)", (uint8_t *)&v11, 0xCu);
      }
      database = self->_database;
    }
  }

  return database;
}

- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4 eventClass:(int64_t)a5 timestampBucket:(double)a6
{
  if (a4)
  {
    id v10 = a3;
    int v11 = (void *)[a4 mutableCopy];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CA60];
    id v13 = a3;
    int v11 = [v12 dictionary];
  }
  v14 = v11;
  [v11 setObject:a3 forKeyedSubscript:@"eventType"];

  id v15 = [MEMORY[0x1E4F1C9C8] date];
  [v15 timeIntervalSince1970WithBucket:a6];
  double v17 = v16;

  v18 = [NSNumber numberWithDouble:v17 * 1000.0];
  [v14 setObject:v18 forKeyedSubscript:@"eventTime"];

  v19 = [NSNumber numberWithInteger:a5];
  [v14 setObject:v19 forKeyedSubscript:@"eventClass"];

  +[SFAnalytics addOSVersionToEvent:v14];

  return v14;
}

+ (void)addOSVersionToEvent:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFAnalytics_addOSVersionToEvent___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (addOSVersionToEvent__onceToken != -1) {
    dispatch_once(&addOSVersionToEvent__onceToken, block);
  }
  if (addOSVersionToEvent__build) {
    [v4 setObject:addOSVersionToEvent__build forKeyedSubscript:@"build"];
  }
  if (addOSVersionToEvent__product) {
    [v4 setObject:addOSVersionToEvent__product forKeyedSubscript:@"product"];
  }
  if (addOSVersionToEvent__modelID) {
    [v4 setObject:addOSVersionToEvent__modelID forKeyedSubscript:@"modelid"];
  }
  if (addOSVersionToEvent__internal) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"internal"];
  }
}

- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5 timestampBucket:(unsigned int)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    *(void *)buf = 0;
    v33 = buf;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__2247;
    v36 = __Block_byref_object_dispose__2248;
    id v37 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke;
    block[3] = &unk_1E54849D8;
    block[4] = self;
    void block[5] = buf;
    dispatch_sync(queue, block);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = *((id *)v33 + 5);
    int v14 = 0;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v14 |= (*(uint64_t (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v17++) + 16))();
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v15);
    }

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = self->_queue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke_2;
    v20[3] = &unk_1E5475D30;
    objc_copyWeak(v23, &location);
    v20[4] = self;
    id v21 = v10;
    id v22 = v11;
    v23[1] = (id)a4;
    unsigned int v24 = a6;
    int v25 = v14;
    dispatch_sync(v18, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v19 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B299000, v19, OS_LOG_TYPE_DEFAULT, "SFAnalytics: attempt to log an event with no name", buf, 2u);
    }
  }
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5
{
}

void __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) metricsHooks];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableSet)metricsHooks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

+ (id)encodeSFACollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = objc_alloc_init(SECSFARules);
  if (v7)
  {
    int v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:a4];
    objc_opt_class();
    v9 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v8 objectForKeyedSubscript:@"rules"];
      if (v10 && ![a1 parseRules:v10 format:v7 error:a4])
      {
        v9 = 0;
      }
      else
      {
        id v11 = [v8 objectForKeyedSubscript:@"versions"];
        if (v11 && ![a1 parseVersions:v11 format:v7 error:a4])
        {
          v9 = 0;
        }
        else
        {
          v12 = [v8 objectForKeyedSubscript:@"eventFilter"];
          if (v12 && ![a1 parseEventFilter:v12 format:v7 error:a4])
          {
            v9 = 0;
          }
          else
          {
            id v13 = [(SECSFARules *)v7 data];
            int v14 = v13;
            if (v13)
            {
              v9 = [v13 compressedDataUsingAlgorithm:0 error:a4];
            }
            else
            {
              v9 = 0;
            }
          }
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)parseEventFilter:(id)a3 format:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__870;
    v20 = __Block_byref_object_dispose__871;
    id v21 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__SFAnalytics_SFACollection__parseEventFilter_format_error___block_invoke;
    v13[3] = &unk_1E54758E8;
    uint64_t v15 = &v16;
    id v14 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    v9 = (void *)v17[5];
    BOOL v10 = v9 == 0;
    if (a5 && v9) {
      *a5 = v9;
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (a5)
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:1 description:@"events key missing"];
      *a5 = v11;
    }
    BOOL v10 = 0;
  }

  return v10;
}

void __60__SFAnalytics_SFACollection__parseEventFilter_format_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v8 = objc_alloc_init(SECSFAEventFilter);
    [(SECSFAEventFilter *)v8 setEvent:v15];
    uint64_t v9 = [v7 integerValue];
    uint64_t v10 = 100 - v9;
    if ((unint64_t)v9 > 0x63) {
      uint64_t v10 = 0;
    }
    if (v9 >= 1) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 100;
    }
    [(SECSFAEventFilter *)v8 setDropRate:v11];
    [*(id *)(a1 + 32) addEventFilter:v8];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:@"events type invalid"];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

+ (BOOL)parseVersions:(id)a3 format:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_alloc_init(SECSFAVersionMatch);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      id v28 = v8;
      id v29 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            unsigned int v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:@"versions type invalid"];
            id v15 = v24;
            if (a5)
            {
              id v15 = v24;
              *a5 = v15;
            }
            goto LABEL_26;
          }
          id v15 = [v14 objectForKeyedSubscript:@"version"];
          uint64_t v16 = [v14 objectForKeyedSubscript:@"platform"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v23 = (void *)MEMORY[0x1E4F28C58];
            [NSString stringWithFormat:@"versions it string: %@", v14];
            goto LABEL_23;
          }
          uint64_t v17 = +[SFAnalyticsCollection parseVersion:v15 platform:v16];
          if (!v17)
          {
            v23 = (void *)MEMORY[0x1E4F28C58];
            [NSString stringWithFormat:@"versions not parsing: %@", v14];
            int v25 = LABEL_23:;
            v26 = [v23 errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:v25];

            if (a5) {
              *a5 = v26;
            }

LABEL_26:
            id v8 = v28;
            id v7 = v29;

            BOOL v21 = 0;
            goto LABEL_27;
          }
          uint64_t v18 = (void *)v17;
          [(SECSFAVersionMatch *)v9 addVersions:v17];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        id v8 = v28;
        id v7 = v29;
        if (v11) {
          continue;
        }
        break;
      }
    }

    v19 = [(SECSFAVersionMatch *)v9 versions];
    uint64_t v20 = [v19 count];

    if (v20) {
      [v8 setAllowedBuilds:v9];
    }
    BOOL v21 = 1;
LABEL_27:
  }
  else
  {
    if (a5)
    {
      id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:1 description:@"versions key missing"];
      *a5 = v22;
    }
    BOOL v21 = 0;
  }

  return v21;
}

+ (BOOL)parseRules:(id)a3 format:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = a1;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v10 = v8;
    uint64_t v49 = [v10 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (!v49)
    {
      BOOL v33 = 1;
      goto LABEL_77;
    }
    uint64_t v50 = *(void *)v53;
    id v48 = v10;
    id v42 = v8;
    v44 = v9;
    v45 = a5;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v53 != v50) {
          objc_enumerationMutation(v10);
        }
        uint64_t v12 = *(void **)(*((void *)&v52 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:@"rules type invalid"];
          id v13 = v35;
          if (a5)
          {
            id v13 = v35;
            *a5 = v13;
          }
LABEL_70:
          id v8 = v42;
          id v9 = v44;
LABEL_76:

          BOOL v33 = 0;
          goto LABEL_77;
        }
        id v13 = [v12 objectForKeyedSubscript:@"eventType"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a5)
          {
            id v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:2 description:@"eventType missing"];
            *a5 = v36;
          }
          goto LABEL_70;
        }
        id v14 = [v12 objectForKeyedSubscript:@"eventClass"];
        if (!v14) {
          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v8 = v42;
          id v9 = v44;
          if (a5)
          {
            id v37 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:2 description:@"eventType not a string"];
            goto LABEL_74;
          }
LABEL_75:

          goto LABEL_76;
        }
        if ([v14 isEqual:@"all"])
        {
          char v15 = 0;
          uint64_t v16 = 1;
          goto LABEL_15;
        }
        if (([v14 isEqual:@"errors"] & 1) == 0)
        {
          if ([v14 isEqual:@"success"])
          {
            char v15 = 0;
            uint64_t v16 = 10;
          }
          else if ([v14 isEqual:@"hardfail"])
          {
            char v15 = 0;
            uint64_t v16 = 11;
          }
          else if ([v14 isEqual:@"softfail"])
          {
            char v15 = 0;
            uint64_t v16 = 12;
          }
          else if ([v14 isEqual:@"note"])
          {
            char v15 = 0;
            uint64_t v16 = 13;
          }
          else
          {
            if (([v14 isEqual:@"rockwell"] & 1) == 0)
            {
              id v8 = v42;
              id v9 = v44;
              if (a5)
              {
                v40 = (void *)MEMORY[0x1E4F28C58];
                v41 = [NSString stringWithFormat:@"unknown eventclass: %@", v14];
                id v37 = [v40 errorWithDomain:@"com.apple.SFAErrorDomain" code:2 description:v41];

                id v10 = v48;
LABEL_74:
                id v38 = v37;
                *a5 = v38;
              }
              goto LABEL_75;
            }
            char v15 = 0;
            uint64_t v16 = 14;
          }
        }
        else
        {
LABEL_14:
          uint64_t v16 = 0;
          char v15 = 1;
        }
LABEL_15:
        uint64_t v17 = [v12 objectForKeyedSubscript:@"match"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:4 description:@"match missing"];
          id v18 = v30;
          if (a5)
          {
            id v18 = v30;
            *a5 = v18;
          }
LABEL_29:
          int v29 = 1;
          goto LABEL_52;
        }
        id v18 = [v12 objectForKeyedSubscript:@"repeatAfterSeconds"];
        if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (!a5) {
            goto LABEL_29;
          }
          id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:5 description:@"repeatAfterSeconds not number"];
          *a5 = v19;
        }
        else
        {
          id v19 = [v12 objectForKeyedSubscript:@"processName"];
          if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v46 = v19;
            uint64_t v20 = a5;
            uint64_t v21 = [v12 objectForKeyedSubscript:@"matchOnFirstFailure"];
            if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              id v31 = (id)v21;
              a5 = v20;
              if (v20)
              {
                id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:5 description:@"matchOnFirstFailure not number"];
                *uint64_t v20 = v24;
                int v29 = 1;
                id v19 = v46;
                goto LABEL_49;
              }
              int v29 = 1;
              id v19 = v46;
            }
            else
            {
              v47 = (void *)v21;
              id v22 = objc_alloc_init(SECSFAEventRule);
              [(SECSFAEventRule *)v22 setEventType:v13];
              if ((v15 & 1) == 0) {
                [(SECSFAEventRule *)v22 setEventClass:v16];
              }
              id v19 = v46;
              [(SECSFAEventRule *)v22 setProcessName:v46];
              -[SECSFAEventRule setRepeatAfterSeconds:](v22, "setRepeatAfterSeconds:", (int)[v18 intValue]);
              -[SECSFAEventRule setMatchOnFirstFailure:](v22, "setMatchOnFirstFailure:", [v47 intValue] != 0);
              id v51 = 0;
              v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v17 format:200 options:0 error:&v51];
              id v24 = v51;
              [(SECSFAEventRule *)v22 setMatch:v23];

              int v25 = [(SECSFAEventRule *)v22 match];

              if (v25)
              {
                v26 = [v12 objectForKeyedSubscript:@"action"];
                long long v27 = [v43 parseAction:v26 error:v45];
                [(SECSFAEventRule *)v22 setAction:v27];

                id v28 = [(SECSFAEventRule *)v22 action];

                if (v28)
                {
                  [v44 addEventRules:v22];
                  int v29 = 0;
                }
                else
                {
                  int v29 = 1;
                }
              }
              else
              {
                if (v45)
                {
                  id *v45 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:12 description:@"plist encode failed" underlying:v24];
                }
                int v29 = 1;
              }
              id v31 = v47;

              a5 = v45;
LABEL_49:
            }
LABEL_50:

            goto LABEL_51;
          }
          if (a5)
          {
            id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:5 description:@"processName not string"];
            *a5 = v31;
            int v29 = 1;
            goto LABEL_50;
          }
        }
        int v29 = 1;
LABEL_51:

        id v10 = v48;
LABEL_52:

        if (v29)
        {
          BOOL v33 = 0;
          id v8 = v42;
          id v9 = v44;
          goto LABEL_77;
        }
        ++v11;
      }
      while (v49 != v11);
      uint64_t v32 = [v10 countByEnumeratingWithState:&v52 objects:v56 count:16];
      BOOL v33 = 1;
      id v8 = v42;
      id v9 = v44;
      uint64_t v49 = v32;
      if (!v32)
      {
LABEL_77:

        goto LABEL_78;
      }
    }
  }
  if (a5)
  {
    id v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:1 description:@"rules key missing"];
    *a5 = v34;
  }
  BOOL v33 = 0;
LABEL_78:

  return v33;
}

+ (id)parseAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(SECSFAAction);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 objectForKeyedSubscript:@"radarNumber"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [(SECSFAAction *)v6 setRadarnumber:v7];
      id v8 = [v5 objectForKeyedSubscript:@"actionType"];
      if (![v8 isEqual:@"ttr"])
      {
        if ([v8 isEqual:@"abc"])
        {
          id v9 = objc_alloc_init(SECSFAActionAutomaticBugCapture);
          if (v7)
          {
            uint64_t v12 = [v5 objectForKeyedSubscript:@"domain"];
            id v13 = [v5 objectForKeyedSubscript:@"type"];
            id v14 = [v5 objectForKeyedSubscript:@"subtype"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  [(SECSFAActionAutomaticBugCapture *)v9 setDomain:v12];
                  [(SECSFAActionAutomaticBugCapture *)v9 setType:v13];
                  [(SECSFAActionAutomaticBugCapture *)v9 setSubtype:v14];
                  [(SECSFAAction *)v6 setAbc:v9];

                  goto LABEL_29;
                }
              }
            }
            if (a4)
            {
              id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:10 description:@"abc invalid type"];
              *a4 = v18;
            }
          }
        }
        else
        {
          if ([v8 isEqual:@"drop"])
          {
            id v9 = objc_alloc_init(SECSFAActionDropEvent);
            uint64_t v16 = [v5 objectForKeyedSubscript:@"event"];
            -[SECSFAActionAutomaticBugCapture setExcludeEvent:](v9, "setExcludeEvent:", [v16 BOOLValue]);

            uint64_t v17 = [v5 objectForKeyedSubscript:@"count"];
            -[SECSFAActionAutomaticBugCapture setExcludeCount:](v9, "setExcludeCount:", [v17 BOOLValue]);

            [(SECSFAAction *)v6 setDrop:v9];
            goto LABEL_29;
          }
          if (!a4)
          {
LABEL_37:
            id v9 = 0;
            goto LABEL_38;
          }
          id v9 = [NSString stringWithFormat:@"action unknown: %@", v8];
          id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:11 description:v9];
          *a4 = v19;
        }
LABEL_36:

        goto LABEL_37;
      }
      id v9 = objc_alloc_init(SECSFAActionTapToRadar);
      if (v9)
      {
        id v10 = [v5 objectForKeyedSubscript:@"alert"];
        uint64_t v11 = [v5 objectForKeyedSubscript:@"componentID"];
        v23 = [v5 objectForKeyedSubscript:@"componentName"];
        id v22 = [v5 objectForKeyedSubscript:@"componentVersion"];
        uint64_t v21 = [v5 objectForKeyedSubscript:@"radarDescription"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [(SECSFAActionAutomaticBugCapture *)v9 setAlert:v10];
                  [(SECSFAActionAutomaticBugCapture *)v9 setComponentID:v11];
                  [(SECSFAActionAutomaticBugCapture *)v9 setComponentName:v23];
                  [(SECSFAActionAutomaticBugCapture *)v9 setComponentVersion:v22];
                  [(SECSFAActionAutomaticBugCapture *)v9 setRadarDescription:v21];
                  [(SECSFAAction *)v6 setTtr:v9];

LABEL_29:
                  id v9 = v6;
                  goto LABEL_38;
                }
              }
            }
          }
        }
        if (a4)
        {
          id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:9 description:@"attribute invalid type"];
          *a4 = v15;
        }
        goto LABEL_36;
      }
LABEL_38:

      goto LABEL_39;
    }
    if (a4)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:8 description:@"radarNumber invalid"];
      id v9 = 0;
      *a4 = v8;
      goto LABEL_38;
    }
    id v9 = 0;
  }
  else
  {
    if (!a4)
    {
      id v9 = 0;
      goto LABEL_40;
    }
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SFAErrorDomain" code:6 description:@"action invalid type"];
    id v9 = 0;
    *a4 = v7;
  }
LABEL_39:

LABEL_40:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_metricsHooks, 0);
  objc_storeStrong((id *)&self->_multisamplers, 0);
  objc_storeStrong((id *)&self->_samplers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (void)setCollection:(id)a3
{
}

- (SFAnalyticsCollection)collection
{
  return (SFAnalyticsCollection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetricsHooks:(id)a3
{
}

- (void)drainLogQueue
{
}

- (void)noteLaunchSequence:(id)a3
{
  id v8 = a3;
  id v4 = [v8 metricsReport];
  if (v4)
  {
    id v5 = NSString;
    id v6 = [v8 name];
    id v7 = [v5 stringWithFormat:@"Launch-%@", v6];
    [(SFAnalytics *)self logEventNamed:v7 class:4 attributes:v4 timestampBucket:0];
  }
}

- (void)logMetric:(id)a3 withName:(id)a4 oncePerReport:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__SFAnalytics_logMetric_withName_oncePerReport___block_invoke;
    v12[3] = &unk_1E5475D80;
    objc_copyWeak(&v15, location);
    BOOL v16 = a5;
    id v13 = v9;
    id v14 = v8;
    dispatch_async(queue, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v11 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "SFAnalytics: Need a valid result and name to log result", (uint8_t *)location, 2u);
    }
  }
}

void __48__SFAnalytics_logMetric_withName_oncePerReport___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained && (WeakRetained[40] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = [WeakRetained database];
      [v4 removeAllSamplesForName:*(void *)(a1 + 32)];
    }
    id v5 = [v6 database];
    [v5 addSample:*(void *)(a1 + 40) forName:*(void *)(a1 + 32)];
  }
}

- (void)logMetric:(id)a3 withName:(id)a4
{
}

- (id)startLogSystemMetricsForActivityNamed:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[SFAnalyticsActivityTracker alloc] initWithName:v3 clientClass:objc_opt_class()];
    [(SFAnalyticsActivityTracker *)v4 start];
  }
  else
  {
    id v5 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "Cannot log system metrics without name", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)logSystemMetricsForActivityNamed:(id)a3 withAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [[SFAnalyticsActivityTracker alloc] initWithName:v5 clientClass:objc_opt_class()];
    id v8 = v7;
    if (v6) {
      [(SFAnalyticsActivityTracker *)v7 performAction:v6];
    }
  }
  else
  {
    id v9 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, "Cannot log system metrics without name", v11, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)removeMultiSamplerForName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__SFAnalytics_removeMultiSamplerForName___block_invoke;
    v7[3] = &unk_1E5475C40;
    objc_copyWeak(&v9, location);
    id v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to remove multisampler without specifying samplerName", (uint8_t *)location, 2u);
    }
  }
}

void __41__SFAnalytics_removeMultiSamplerForName___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)os_transaction_create();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v3 pauseSampling];

    [WeakRetained[4] removeObjectForKey:*(void *)(a1 + 32)];
  }
}

- (void)removeMetricSamplerForName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__SFAnalytics_removeMetricSamplerForName___block_invoke;
    v7[3] = &unk_1E5475C40;
    objc_copyWeak(&v9, location);
    id v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    id v6 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to remove sampler without specifying samplerName", (uint8_t *)location, 2u);
    }
  }
}

void __42__SFAnalytics_removeMetricSamplerForName___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)os_transaction_create();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [WeakRetained[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v3 pauseSampling];

    [WeakRetained[3] removeObjectForKey:*(void *)(a1 + 32)];
  }
}

- (id)existingMultiSamplerForName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2247;
  id v18 = __Block_byref_object_dispose__2248;
  id v19 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SFAnalytics_existingMultiSamplerForName___block_invoke;
  v9[3] = &unk_1E5475C68;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  uint64_t v11 = &v14;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __43__SFAnalytics_existingMultiSamplerForName___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    WeakRetained = v6;
  }
}

- (id)existingMetricSamplerForName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2247;
  id v18 = __Block_byref_object_dispose__2248;
  id v19 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SFAnalytics_existingMetricSamplerForName___block_invoke;
  v9[3] = &unk_1E5475C68;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  uint64_t v11 = &v14;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __44__SFAnalytics_existingMetricSamplerForName___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    WeakRetained = v6;
  }
}

- (id)AddMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if (a4 < 1.0 && a4 != -1.0)
    {
      id v15 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = a4;
      uint64_t v14 = "SFAnalytics: cannot add sampler with interval %f";
      uint64_t v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_16;
    }
    if (v9)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v28 = 0x3032000000;
      int v29 = __Block_byref_object_copy__2247;
      long long v30 = __Block_byref_object_dispose__2248;
      id v31 = 0;
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__SFAnalytics_AddMultiSamplerForName_withTimeInterval_block___block_invoke;
      block[3] = &unk_1E5475D58;
      objc_copyWeak(v25, &location);
      id v21 = v8;
      p_long long buf = &buf;
      v25[1] = *(id *)&a4;
      id v22 = self;
      id v23 = v10;
      dispatch_sync(queue, block);
      id v13 = *(id *)(*((void *)&buf + 1) + 40);

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);

      goto LABEL_18;
    }
    id v15 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      uint64_t v14 = "SFAnalytics: cannot add sampler without block";
      goto LABEL_15;
    }
  }
  else
  {
    id v15 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      uint64_t v14 = "SFAnalytics: cannot add sampler without name";
LABEL_15:
      uint64_t v17 = v15;
      uint32_t v18 = 2;
LABEL_16:
      _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v18);
    }
  }
LABEL_17:

  id v13 = 0;
LABEL_18:

  return v13;
}

void __61__SFAnalytics_AddMultiSamplerForName_withTimeInterval_block___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v3)
  {
    uint64_t v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "SFAnalytics: multisampler \"%@\" already exists", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v6 = [[SFAnalyticsMultiSampler alloc] initWithName:*(void *)(a1 + 32) interval:*(void *)(a1 + 48) block:objc_opt_class() clientClass:*(double *)(a1 + 72)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [WeakRetained[4] setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (id)addMetricSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    if (a4 < 1.0 && a4 != -1.0)
    {
      id v15 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = a4;
      uint64_t v14 = "SFAnalytics: cannot add sampler with interval %f";
      uint64_t v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_16;
    }
    if (v9)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v28 = 0x3032000000;
      int v29 = __Block_byref_object_copy__2247;
      long long v30 = __Block_byref_object_dispose__2248;
      id v31 = 0;
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__SFAnalytics_addMetricSamplerForName_withTimeInterval_block___block_invoke;
      block[3] = &unk_1E5475D58;
      objc_copyWeak(v25, &location);
      id v21 = v8;
      p_long long buf = &buf;
      v25[1] = *(id *)&a4;
      id v22 = self;
      id v23 = v10;
      dispatch_sync(queue, block);
      id v13 = *(id *)(*((void *)&buf + 1) + 40);

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);

      goto LABEL_18;
    }
    id v15 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      uint64_t v14 = "SFAnalytics: cannot add sampler without block";
      goto LABEL_15;
    }
  }
  else
  {
    id v15 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      uint64_t v14 = "SFAnalytics: cannot add sampler without name";
LABEL_15:
      uint64_t v17 = v15;
      uint32_t v18 = 2;
LABEL_16:
      _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v18);
    }
  }
LABEL_17:

  id v13 = 0;
LABEL_18:

  return v13;
}

void __62__SFAnalytics_addMetricSamplerForName_withTimeInterval_block___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained[3] objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v3)
  {
    uint64_t v4 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "SFAnalytics: sampler \"%@\" already exists", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v6 = [[SFAnalyticsSampler alloc] initWithName:*(void *)(a1 + 32) interval:*(void *)(a1 + 48) block:objc_opt_class() clientClass:*(double *)(a1 + 72)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [WeakRetained[3] setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5
{
}

- (void)noteEventNamed:(id)a3
{
}

- (void)noteEventNamed:(id)a3 timestampBucket:(unsigned int)a4
{
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6
{
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6 timestampBucket:(unsigned int)a7
{
  BOOL v9 = a4;
  id v20 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v11)
  {
    if (v12)
    {
      uint64_t v14 = (void *)[v12 mutableCopy];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v15 = v14;
    uint64_t v16 = [v14 objectForKeyedSubscript:@"errorChain"];

    if (!v16)
    {
      uint64_t v17 = [(id)objc_opt_class() underlyingErrors:v11];
      [v15 setObject:v17 forKeyedSubscript:@"errorChain"];
    }
    uint32_t v18 = [v11 domain];
    [v15 setObject:v18 forKeyedSubscript:@"errorDomain"];

    id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "code"));
    [v15 setObject:v19 forKeyedSubscript:@"errorCode"];

    if (v9) {
      [(SFAnalytics *)self logHardFailureForEventNamed:v20 withAttributes:v15];
    }
    else {
      [(SFAnalytics *)self logSoftFailureForEventNamed:v20 withAttributes:v15];
    }
  }
  else
  {
    [(SFAnalytics *)self logSuccessForEventNamed:v20];
  }
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5
{
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 timestampBucket:(unsigned int)a6
{
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5
{
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
}

- (void)logSuccessForEventNamed:(id)a3
{
}

- (void)logSuccessForEventNamed:(id)a3 timestampBucket:(unsigned int)a4
{
}

- (void)dailyCoreAnalyticsMetrics:(id)a3
{
  id v4 = a3;
  id v6 = [(SFAnalytics *)self dailyMetrics];
  uint64_t v5 = [(SFAnalytics *)self coreAnalyticsKeyFilter:v6];
  +[SecCoreAnalytics sendEvent:v4 event:v5];
}

- (id)coreAnalyticsKeyFilter:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SFAnalytics_coreAnalyticsKeyFilter___block_invoke;
  v8[3] = &unk_1E5475D08;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __38__SFAnalytics_coreAnalyticsKeyFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  [v4 setObject:v5 forKeyedSubscript:v6];
}

- (id)dailyMetrics
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2247;
  long long v27 = __Block_byref_object_dispose__2248;
  id v28 = 0;
  uint64_t v17 = 0;
  uint32_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2247;
  id v21 = __Block_byref_object_dispose__2248;
  id v22 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SFAnalytics_dailyMetrics__block_invoke;
  block[3] = &unk_1E5477920;
  void block[4] = self;
  void block[5] = &v23;
  void block[6] = &v17;
  dispatch_sync(queue, block);
  id v5 = (void *)v24[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__SFAnalytics_dailyMetrics__block_invoke_2;
  v14[3] = &unk_1E5475CB8;
  id v6 = v3;
  id v15 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v7 = (void *)v18[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __27__SFAnalytics_dailyMetrics__block_invoke_3;
  v12[3] = &unk_1E5475CE0;
  id v8 = v6;
  id v13 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = v13;
  id v10 = v8;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

uint64_t __27__SFAnalytics_dailyMetrics__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __27__SFAnalytics_dailyMetrics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 oncePerReport])
  {
    id v4 = [v6 sampleNow];
    if (v4) {
      [*(id *)(a1 + 32) addEntriesFromDictionary:v4];
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __27__SFAnalytics_dailyMetrics__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 oncePerReport])
  {
    id v6 = [v5 sampleNow];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

- (SFAnalytics)init
{
  v14.receiver = self;
  v14.super_class = (Class)SFAnalytics;
  uint64_t v2 = [(SFAnalytics *)&v14 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SFAnalytics data access queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    samplers = v2->_samplers;
    v2->_samplers = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    multisamplers = v2->_multisamplers;
    v2->_multisamplers = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    metricsHooks = v2->_metricsHooks;
    v2->_metricsHooks = (NSMutableSet *)v10;

    id v12 = [(SFAnalytics *)v2 database];
  }
  return v2;
}

- (void)setMetricsAccountID:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFAnalytics_setMetricsAccountID___block_invoke;
  block[3] = &unk_1E5475C40;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__SFAnalytics_setMetricsAccountID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    [v3 setMetricsAccountID:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (id)metricsAccountID
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__2247;
  id v13 = __Block_byref_object_dispose__2248;
  id v14 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SFAnalytics_metricsAccountID__block_invoke;
  block[3] = &unk_1E5475C90;
  objc_copyWeak(&v7, &location);
  void block[4] = &v9;
  dispatch_sync(queue, block);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void __31__SFAnalytics_metricsAccountID__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    uint64_t v4 = [v3 metricsAccountID];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id WeakRetained = v7;
  }
}

- (id)dataPropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2247;
  id v22 = __Block_byref_object_dispose__2248;
  id v23 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __34__SFAnalytics_dataPropertyForKey___block_invoke;
  id v13 = &unk_1E5475C68;
  objc_copyWeak(&v16, &location);
  id v15 = &v18;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(queue, &v10);
  if (v19[5])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v8 = objc_msgSend(v7, "initWithBase64EncodedString:options:", v19[5], 0, v10, v11, v12, v13);
  }
  else
  {
    id v8 = 0;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __34__SFAnalytics_dataPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    uint64_t v4 = [v3 propertyForKey:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id WeakRetained = v7;
  }
}

- (void)setDataProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__SFAnalytics_setDataProperty_forKey___block_invoke;
  v11[3] = &unk_1E5475C18;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __38__SFAnalytics_setDataProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    uint64_t v4 = [*(id *)(a1 + 32) base64EncodedStringWithOptions:0];
    [v3 setProperty:v4 forKey:*(void *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

- (id)numberPropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2247;
  uint64_t v18 = __Block_byref_object_dispose__2248;
  id v19 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__SFAnalytics_numberPropertyForKey___block_invoke;
  v9[3] = &unk_1E5475C68;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  uint64_t v11 = &v14;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __36__SFAnalytics_numberPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    id v4 = [v3 propertyForKey:*(void *)(a1 + 32)];

    if (v4)
    {
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    id WeakRetained = v8;
  }
}

- (void)setNumberProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__SFAnalytics_setNumberProperty_forKey___block_invoke;
  v11[3] = &unk_1E5475C18;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __40__SFAnalytics_setNumberProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    id v4 = [*(id *)(a1 + 32) stringValue];
    [v3 setProperty:v4 forKey:*(void *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

- (void)incrementIntegerPropertyForKey:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFAnalytics_incrementIntegerPropertyForKey___block_invoke;
  block[3] = &unk_1E5475C40;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__SFAnalytics_incrementIntegerPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    id v4 = [v3 propertyForKey:*(void *)(a1 + 32)];
    uint64_t v5 = [v4 integerValue];

    id v6 = [v8 database];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v5 + 1);
    [v6 setProperty:v7 forKey:*(void *)(a1 + 32)];

    id WeakRetained = v8;
  }
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2247;
  uint64_t v18 = __Block_byref_object_dispose__2248;
  id v19 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SFAnalytics_datePropertyForKey___block_invoke;
  v9[3] = &unk_1E5475C68;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  uint64_t v11 = &v14;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __34__SFAnalytics_datePropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    uint64_t v4 = [v3 datePropertyForKey:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id WeakRetained = v7;
  }
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__SFAnalytics_setDateProperty_forKey___block_invoke;
  v11[3] = &unk_1E5475C18;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __38__SFAnalytics_setDateProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained database];
    [v3 setDateProperty:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)removeState
{
}

- (void)removeStateAndUnlinkFile:(BOOL)a3
{
  [(NSMutableDictionary *)self->_samplers removeAllObjects];
  [(NSMutableDictionary *)self->_multisamplers removeAllObjects];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SFAnalytics_removeStateAndUnlinkFile___block_invoke;
  block[3] = &unk_1E5475BF0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_sync(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __40__SFAnalytics_removeStateAndUnlinkFile___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained database];
    [v2 close];

    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v3 = [WeakRetained database];
      [v3 remove];
    }
    id v4 = WeakRetained[1];
    WeakRetained[1] = 0;

    [WeakRetained[6] removeAllObjects];
  }
}

- (void)updateCollectionConfigurationWithData:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(SFAnalytics *)v4 collection];

  if (!v5)
  {
    id v6 = objc_alloc_init(SFAnalyticsCollection);
    [(SFAnalytics *)v4 setCollection:v6];
  }
  id v7 = [(SFAnalytics *)v4 collection];
  [v7 storeCollection:v8 logger:v4];

  objc_sync_exit(v4);
}

- (void)loadCollectionConfiguration
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = objc_alloc_init(SFAnalyticsCollection);
  uint64_t v3 = v2;
  if (v2)
  {
    [(SFAnalyticsCollection *)v2 loadCollection:obj];
    [(SFAnalytics *)obj setCollection:v3];
  }

  objc_sync_exit(obj);
}

- (void)removeMetricsHook:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SFAnalytics_removeMetricsHook___block_invoke;
  v7[3] = &unk_1E5475BC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __33__SFAnalytics_removeMetricsHook___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) metricsHooks];
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  [v3 removeObject:v2];
}

- (void)addMetricsHook:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__SFAnalytics_addMetricsHook___block_invoke;
  v7[3] = &unk_1E5475BC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __30__SFAnalytics_addMetricsHook___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) metricsHooks];
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  [v3 addObject:v2];
}

+ (id)underlyingErrors:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() treeOfUnderlyingErrors:v3 depth:0];
  if (v4)
  {
    if ([MEMORY[0x1E4F28D90] isValidJSONObject:v4])
    {
      id v10 = 0;
      uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:2 error:&v10];
      id v6 = v10;
      if (v5)
      {
        id v7 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
      }
      else
      {
        id v8 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          id v12 = v3;
          __int16 v13 = 2114;
          id v14 = v6;
          _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "SFA: underlyingErrors failed to encode %{public}@ with failure: %{public}@", buf, 0x16u);
        }

        id v7 = 0;
      }
    }
    else
    {
      id v6 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v12 = v3;
        _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "SFA: underlyingErrors encoded to not json %{public}@", buf, 0xCu);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)treeOfUnderlyingErrors:(id)a3 depth:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 > 5) {
    goto LABEL_21;
  }
  int64_t v7 = a4 + 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a4)
    {
      id v10 = [v8 domain];
      [v9 setObject:v10 forKeyedSubscript:@"d"];

      uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
      [v9 setObject:v11 forKeyedSubscript:@"c"];
    }
    id v12 = [v8 userInfo];
    __int16 v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v14 = [a1 treeOfUnderlyingErrors:v13 depth:v7];

    [v9 setObject:v14 forKeyedSubscript:@"u"];
    uint64_t v15 = [v8 userInfo];
    uint64_t v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F28750]];
    uint64_t v17 = [a1 treeOfUnderlyingErrors:v16 depth:v7];

    [v9 setObject:v17 forKeyedSubscript:@"m"];
    if ([v9 count]) {
      id v18 = v9;
    }
    else {
      id v18 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_21:
    id v18 = 0;
    goto LABEL_26;
  }
  id v19 = v6;
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v27 = objc_msgSend(a1, "treeOfUnderlyingErrors:depth:", v26, v7, (void)v29);
          if (v27) {
            [v20 addObject:v27];
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v23);
  }

  if ([v20 count]) {
    id v18 = v20;
  }
  else {
    id v18 = 0;
  }

LABEL_26:

  return v18;
}

void __35__SFAnalytics_addOSVersionToEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    id v9 = v2;
    uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
    id v4 = (void *)addOSVersionToEvent__build;
    addOSVersionToEvent__build = v3;

    uint64_t v5 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F1CD18]];
    id v6 = (void *)addOSVersionToEvent__product;
    addOSVersionToEvent__product = v5;

    addOSVersionToEvent__internal = os_variant_has_internal_diagnostics();
    uint64_t v7 = [*(id *)(a1 + 32) hwModelID];
    id v8 = (void *)addOSVersionToEvent__modelID;
    addOSVersionToEvent__modelID = v7;

    uint64_t v2 = v9;
  }
}

+ (id)hwModelID
{
  if (hwModelID_onceToken != -1) {
    dispatch_once(&hwModelID_onceToken, &__block_literal_global_160);
  }
  uint64_t v2 = (void *)hwModelID_hwModel;

  return v2;
}

void __24__SFAnalytics_hwModelID__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  memset(&__b, 170, sizeof(__b));
  uname(&__b);
  uint64_t v0 = [NSString stringWithCString:__b.machine encoding:4];
  v1 = (void *)hwModelID_hwModel;
  hwModelID_hwModel = v0;
}

+ (id)fuzzyNumber:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = objc_msgSend(a1, "fuzzyInteger:", objc_msgSend(a3, "integerValue"));

  return (id)[v3 numberWithInteger:v4];
}

+ (int64_t)fuzzyInteger:(int64_t)a3
{
  if (a3 >= 0) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = -a3;
  }
  if (!a3) {
    return 0;
  }
  int64_t v4 = (a3 >> 63) | 1;
  if (v3 <= 5) {
    return 5 * v4;
  }
  if (v3 % 5 >= 3) {
    unint64_t v6 = 5 * (v3 / 5) + 5;
  }
  else {
    unint64_t v6 = 5 * (v3 / 5);
  }
  return v6 * v4;
}

+ (int64_t)fuzzyDaysSinceDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    int64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1483228800.0];
    uint64_t v5 = [v3 compare:v4];

    if (v5 == -1)
    {
      int64_t v9 = 1000;
    }
    else
    {
      unint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
      [v6 timeIntervalSinceDate:v3];
      double v8 = v7;

      if (v8 >= 86400.0)
      {
        if (v8 >= 604800.0)
        {
          if (v8 >= 2592000.0)
          {
            if (v8 >= 31536000.0) {
              int64_t v9 = 365;
            }
            else {
              int64_t v9 = 30;
            }
          }
          else
          {
            int64_t v9 = 7;
          }
        }
        else
        {
          int64_t v9 = 1;
        }
      }
      else
      {
        int64_t v9 = 0;
      }
    }
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3
{
  id v4 = a3;
  [a1 removeLegacyDefaultAnalyticsDatabasePath:v4 usingDispatchToken:&defaultProtectedAnalyticsDatabasePath__onceToken];
  uint64_t v5 = +[SFAnalytics defaultProtectedAnalyticsDatabasePath:v4 uuid:0];

  return v5;
}

+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F28E78] stringWithString:@"sfanalytics"];
  CFURLRef v8 = SecCopyURLForFileInBaseDirectory(@"private/var/protected/", (uint64_t)v7);
  WithPathInDirectory(v8, (uint64_t)&__block_literal_global_140);
  if (v6)
  {
    [v7 appendString:@"/"];
    int64_t v9 = [v6 UUIDString];
    [v7 appendString:v9];

    CFURLRef v10 = SecCopyURLForFileInBaseDirectory(@"private/var/protected/", (uint64_t)v7);
    WithPathInDirectory(v10, (uint64_t)&__block_literal_global_146);
  }
  uint64_t v11 = [NSString stringWithFormat:@"%@/%@.db", v7, v5];
  CFURLRef v12 = SecCopyURLForFileInBaseDirectory(@"private/var/protected/", (uint64_t)v11);
  __int16 v13 = [(__CFURL *)v12 path];

  return v13;
}

uint64_t __58__SFAnalytics_defaultProtectedAnalyticsDatabasePath_uuid___block_invoke_144(int a1, char *path)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      id v5 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        CFURLRef v8 = path;
        __int16 v9 = 2080;
        CFURLRef v10 = strerror(v4);
        _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  return chmod(path, 0x1FFu);
}

uint64_t __58__SFAnalytics_defaultProtectedAnalyticsDatabasePath_uuid___block_invoke(int a1, char *path)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      id v5 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        CFURLRef v8 = path;
        __int16 v9 = 2080;
        CFURLRef v10 = strerror(v4);
        _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  return chmod(path, 0x1FFu);
}

+ (void)removeLegacyDefaultAnalyticsDatabasePath:(id)a3 usingDispatchToken:(int64_t *)a4
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke;
  block[3] = &unk_1E5484B08;
  id v9 = v5;
  int64_t v6 = *a4;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(a4, block);
  }
}

void __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSString stringWithFormat:@"Analytics/%@.db", *(void *)(a1 + 32)];
  WithPathInKeychainDirectory((uint64_t)v2, (uint64_t)&__block_literal_global_121);
  int v3 = [NSString stringWithFormat:@"Analytics/%@.db-shm", *(void *)(a1 + 32)];

  WithPathInKeychainDirectory((uint64_t)v3, (uint64_t)&__block_literal_global_126);
  id v4 = [NSString stringWithFormat:@"Analytics/%@.db-wal", *(void *)(a1 + 32)];

  WithPathInKeychainDirectory((uint64_t)v4, (uint64_t)&__block_literal_global_131);
  WithPathInKeychainDirectory(@"Analytics", (uint64_t)&__block_literal_global_133);
}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_5(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_4(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_3(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_2(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

+ (id)defaultAnalyticsDatabasePath:(id)a3
{
  id v3 = a3;
  WithPathInKeychainDirectory(@"Analytics", (uint64_t)&__block_literal_global_2300);
  id v4 = [NSString stringWithFormat:@"Analytics/%@.db", v3];

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v5 = SecCopyURLForFileInBaseDirectory(@"Library/Keychains", (uint64_t)v4);
  int64_t v6 = [(__CFURL *)v5 path];

  return v6;
}

uint64_t __44__SFAnalytics_defaultAnalyticsDatabasePath___block_invoke(int a1, char *path)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      CFURLRef v5 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        CFURLRef v8 = path;
        __int16 v9 = 2080;
        CFURLRef v10 = strerror(v4);
        _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  return chmod(path, 0x1FFu);
}

+ (NSString)databasePath
{
  return 0;
}

@end