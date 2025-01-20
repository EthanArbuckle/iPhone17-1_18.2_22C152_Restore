@interface ACCAnalyticsLogger
+ (id)databasePathForUser:(int)a3;
+ (id)loggerForUser:(int)a3;
+ (int64_t)fuzzyDaysSinceDate:(id)a3;
+ (void)addBuiltInFieldsToEvent:(id)a3;
- (BOOL)_onQueuePostJSON:(id)a3 error:(id *)a4 httpStatusCode:(int64_t *)a5;
- (BOOL)allowsInsecureFigaroCert;
- (BOOL)forceUploadWithError:(id *)a3 httpStatusCode:(int64_t *)a4;
- (BOOL)ignoreServerDisablingMessages;
- (NSLock)eventCacheLock;
- (NSMutableArray)accessorydEventsBeforeFirstUnlock;
- (NSMutableArray)pluginEventsBeforeFirstUnlock;
- (NSString)figaroTopicName;
- (NSURL)figaroBagURL;
- (NSURL)figaroUploadURL;
- (OS_dispatch_queue)loggingQueue;
- (id)datePropertyForKey:(id)a3;
- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4;
- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3;
- (id)getLoggingJSON:(BOOL)a3 error:(id *)a4;
- (id)initForUser:(int)a3;
- (int)user;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_logEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logEventNamed:(id)a3 withAttributes:(id)a4;
- (void)resetUploadDateAndClearDBEntries:(BOOL)a3 dueToError:(BOOL)a4;
- (void)setAccessorydEventsBeforeFirstUnlock:(id)a3;
- (void)setAllowsInsecureFigaroCert:(BOOL)a3;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setEventCacheLock:(id)a3;
- (void)setIgnoreServerDisablingMessages:(BOOL)a3;
- (void)setLoggingQueue:(id)a3;
- (void)setPluginEventsBeforeFirstUnlock:(id)a3;
- (void)setUser:(int)a3;
@end

@implementation ACCAnalyticsLogger

+ (id)loggerForUser:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((id)objc_opt_class() == a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] attempt to instatiate abstract class ACCEventLogger", v8, 2u);
    }
    v6 = 0;
  }
  else
  {
    id v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_getAssociatedObject(v5, "ACCAnalyticsLoggerInstance");
    if (!v6)
    {
      v6 = (void *)[objc_alloc((Class)v5) initForUser:v3];
      objc_setAssociatedObject(v5, "ACCAnalyticsLoggerInstance", v6, (void *)0x301);
    }
    objc_sync_exit(v5);
  }
  return v6;
}

+ (id)databasePathForUser:(int)a3
{
  if (a3) {
    return @"/var/mobile/Library/CoreAccessories/Analytics/acc_analytics_accessoryd_v3.db";
  }
  else {
    return @"/var/mobile/Library/CoreAccessories/Analytics/acc_analytics_UserEventAgent_v3.db";
  }
}

+ (int64_t)fuzzyDaysSinceDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  id v5 = [v3 date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  if (v7 < 86400.0) {
    return 0;
  }
  if (v7 < 604800.0) {
    return 1;
  }
  if (v7 < 2592000.0) {
    return 7;
  }
  if (v7 >= 31536000.0) {
    return 365;
  }
  return 30;
}

- (id)initForUser:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v55.receiver = self;
  v55.super_class = (Class)ACCAnalyticsLogger;
  id v4 = [(ACCAnalyticsLogger *)&v55 init];
  id v5 = v4;
  if (v4)
  {
    v4->_user = v3;
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    pluginEventsBeforeFirstUnlock = v5->_pluginEventsBeforeFirstUnlock;
    v5->_pluginEventsBeforeFirstUnlock = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    accessorydEventsBeforeFirstUnlock = v5->_accessorydEventsBeforeFirstUnlock;
    v5->_accessorydEventsBeforeFirstUnlock = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    eventCacheLock = v5->_eventCacheLock;
    v5->_eventCacheLock = v10;

    v12 = +[ACCAnalyticsLogger databasePathForUser:v3];
    uint64_t v13 = +[ACCAnalyticsLoggerSQLiteStore storeWithPath:v12 schema:@"CREATE TABLE IF NOT EXISTS all_events (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n)\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_all_events AFTER INSERT ON all_events\nBEGIN\nDELETE FROM all_events WHERE id != NEW.id AND id % 999 = NEW.id % 999;\nEND;\nCREATE TABLE IF NOT EXISTS success_count (\nevent_type STRING PRIMARY KEY,\nsuccess_count INTEGER,\nwrap_failure_count INTEGER\n);\n"];;
    database = v5->_database;
    v5->_database = (ACCAnalyticsLoggerSQLiteStore *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.accessoryd.eventLogging", v15);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.accessoryd.eventLoggingQueue", 0);
    loggingQueue = v5->_loggingQueue;
    v5->_loggingQueue = (OS_dispatch_queue *)v18;

    int isInternalBuild = systemInfo_isInternalBuild();
    uint64_t v21 = 259200;
    if (isInternalBuild) {
      uint64_t v21 = 86400;
    }
    v5->_secondsBetweenUploads = v21;
    v5->_secondsBetweenUploadError = 3600;
    v22 = NSDictionary;
    v23 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/CoreAccessories.framework"];
    v24 = [v23 pathForResource:@"ACCAnalyticsLogging" ofType:@"plist"];
    v25 = [v22 dictionaryWithContentsOfFile:v24];

    uint64_t v26 = [v25 objectForKeyedSubscript:@"figaro_topic"];
    figaroTopicName = v5->_figaroTopicName;
    v5->_figaroTopicName = (NSString *)v26;

    v28 = NSURL;
    v29 = [v25 objectForKeyedSubscript:@"figaro_uploadURL"];
    uint64_t v30 = [v28 URLWithString:v29];
    p_figaroUploadURL = (void **)&v5->_figaroUploadURL;
    figaroUploadURL = v5->_figaroUploadURL;
    v5->_figaroUploadURL = (NSURL *)v30;

    v33 = NSURL;
    v34 = [v25 objectForKeyedSubscript:@"figaro_bagURL"];
    uint64_t v35 = [v33 URLWithString:v34];
    figaroBagURL = v5->_figaroBagURL;
    v5->_figaroBagURL = (NSURL *)v35;

    v37 = [v25 valueForKey:@"figaro_allowInsecureCertificate"];
    *((unsigned char *)v5 + 88) = *((unsigned char *)v5 + 88) & 0xFE | [v37 BOOLValue];

    v38 = [v25 objectForKeyedSubscript:@"figaro_endpointDomain"];
    v39 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.accessory.eventLogging"];
    v40 = [v39 stringForKey:@"figaro_topic"];
    if (v40) {
      objc_storeStrong((id *)&v5->_figaroTopicName, v40);
    }
    v54 = v40;
    v41 = NSURL;
    v42 = [v39 stringForKey:@"figaro_uploadURL"];
    v43 = [v41 URLWithString:v42];

    if (v43) {
      objc_storeStrong((id *)&v5->_figaroUploadURL, v43);
    }
    v44 = NSURL;
    v45 = [v39 stringForKey:@"figaro_bagURL"];
    v46 = [v44 URLWithString:v45];

    if (v46) {
      objc_storeStrong((id *)&v5->_figaroBagURL, v46);
    }
    *((unsigned char *)v5 + 88) |= [v39 BOOLForKey:@"figaro_allowInsecureCertificate"];
    v47 = [v39 stringForKey:@"figaro_endpointDomain"];
    v48 = v47;
    if (v47)
    {
      v49 = v47;

      v38 = v49;
    }
    if (systemInfo_isInternalBuild())
    {

      *((unsigned char *)v5 + 88) |= 8u;
      v38 = @"xp-qa.apple.com";
      if (!v5->_figaroUploadURL)
      {
        v50 = [NSString stringWithFormat:@"https://%@/report/2/%@", @"xp-qa.apple.com", v5->_figaroTopicName];
        uint64_t v51 = [NSURL URLWithString:v50];
        v52 = *p_figaroUploadURL;
        *p_figaroUploadURL = (void *)v51;
      }
    }
  }
  return v5;
}

- (void)logEventNamed:(id)a3 withAttributes:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = MEMORY[0x263EF8438];
    v27 = "[#ACCEventLogger] attempt to log an event with no name";
LABEL_33:
    _os_log_impl(&dword_222CE3000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_67;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = MEMORY[0x263EF8438];
    v27 = "[#ACCEventLogger] attempt to log an event with no attributes";
    goto LABEL_33;
  }
  if (_isDeviceAnalyticsEnabled_onceToken != -1) {
    dispatch_once(&_isDeviceAnalyticsEnabled_onceToken, &__block_literal_global_360);
  }
  if (_isDeviceAnalyticsEnabled_dataCollectionEnabled)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
    +[ACCAnalyticsLogger addBuiltInFieldsToEvent:v9];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v84 = (uint64_t)v6;
      __int16 v85 = 2112;
      v86 = v9;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro event: %@\neventDict: %@", buf, 0x16u);
    }
    int v10 = MKBDeviceUnlockedSinceBoot();
    v11 = [(ACCAnalyticsLogger *)self eventCacheLock];
    [v11 lock];

    int v12 = [(ACCAnalyticsLogger *)self user];
    if (v10)
    {
      if (v12)
      {
        if ([(ACCAnalyticsLogger *)self user] != 1) {
          goto LABEL_59;
        }
        uint64_t v13 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
        uint64_t v14 = [v13 count];

        if (!v14) {
          goto LABEL_59;
        }
        v52 = v9;
        v53 = v8;
        id v54 = v6;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        obuint64_t j = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
        uint64_t v59 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
        if (v59)
        {
          uint64_t v57 = *(void *)v68;
          v15 = MEMORY[0x263EF8438];
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v68 != v57) {
                objc_enumerationMutation(obj);
              }
              uint64_t v61 = v16;
              v17 = *(void **)(*((void *)&v67 + 1) + 8 * v16);
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              id v18 = v17;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v79 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v64;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v64 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    v23 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v84 = (uint64_t)v23;
                      _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] send event: %@ to sql db", buf, 0xCu);
                    }
                    v24 = [v18 objectForKey:v23];
                    [(ACCAnalyticsLogger *)self _logEventNamed:v23 withAttributes:v24];
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v63 objects:v79 count:16];
                }
                while (v20);
              }

              uint64_t v16 = v61 + 1;
            }
            while (v61 + 1 != v59);
            uint64_t v59 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
          }
          while (v59);
        }

        v25 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
      }
      else
      {
        v34 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
        uint64_t v35 = [v34 count];

        if (!v35)
        {
LABEL_59:
          v47 = [(ACCAnalyticsLogger *)self eventCacheLock];
          [v47 unlock];

          [(ACCAnalyticsLogger *)self _logEventNamed:v6 withAttributes:v9];
LABEL_66:

          goto LABEL_67;
        }
        v52 = v9;
        v53 = v8;
        id v54 = v6;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id obja = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
        uint64_t v60 = [obja countByEnumeratingWithState:&v75 objects:v82 count:16];
        if (v60)
        {
          uint64_t v58 = *(void *)v76;
          v36 = MEMORY[0x263EF8438];
          do
          {
            uint64_t v37 = 0;
            do
            {
              if (*(void *)v76 != v58) {
                objc_enumerationMutation(obja);
              }
              uint64_t v62 = v37;
              v38 = *(void **)(*((void *)&v75 + 1) + 8 * v37);
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              id v39 = v38;
              uint64_t v40 = [v39 countByEnumeratingWithState:&v71 objects:v81 count:16];
              if (v40)
              {
                uint64_t v41 = v40;
                uint64_t v42 = *(void *)v72;
                do
                {
                  for (uint64_t j = 0; j != v41; ++j)
                  {
                    if (*(void *)v72 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    v44 = *(void **)(*((void *)&v71 + 1) + 8 * j);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v84 = (uint64_t)v44;
                      _os_log_impl(&dword_222CE3000, v36, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] send event: %@ to sql db", buf, 0xCu);
                    }
                    v45 = [v39 objectForKey:v44];
                    [(ACCAnalyticsLogger *)self _logEventNamed:v44 withAttributes:v45];
                  }
                  uint64_t v41 = [v39 countByEnumeratingWithState:&v71 objects:v81 count:16];
                }
                while (v41);
              }

              uint64_t v37 = v62 + 1;
            }
            while (v62 + 1 != v60);
            uint64_t v60 = [obja countByEnumeratingWithState:&v75 objects:v82 count:16];
          }
          while (v60);
        }

        v25 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
      }
      v46 = v25;
      [v25 removeAllObjects];

      uint64_t v8 = v53;
      id v6 = v54;
      v9 = v52;
      goto LABEL_59;
    }
    if (v12)
    {
      if ([(ACCAnalyticsLogger *)self user] != 1) {
        goto LABEL_65;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v84 = (uint64_t)v6;
        _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Adding event: %@ to accessoryd array", buf, 0xCu);
      }
      v28 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
      v29 = [NSDictionary dictionaryWithObject:v9 forKey:v6];
      [v28 addObject:v29];

      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      uint64_t v30 = [(ACCAnalyticsLogger *)self accessorydEventsBeforeFirstUnlock];
      uint64_t v31 = [v30 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v84 = v31;
      v32 = MEMORY[0x263EF8438];
      v33 = "[#ACCEventLogger] accessorydEventsBeforeFirstUnlock count: %lu";
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v84 = (uint64_t)v6;
        _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Adding event: %@ to plugin array", buf, 0xCu);
      }
      v48 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
      v49 = [NSDictionary dictionaryWithObject:v9 forKey:v6];
      [v48 addObject:v49];

      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      uint64_t v30 = [(ACCAnalyticsLogger *)self pluginEventsBeforeFirstUnlock];
      uint64_t v50 = [v30 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v84 = v50;
      v32 = MEMORY[0x263EF8438];
      v33 = "[#ACCEventLogger] pluginEventsBeforeFirstUnlock count: %lu";
    }
    _os_log_impl(&dword_222CE3000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);

LABEL_65:
    uint64_t v51 = [(ACCAnalyticsLogger *)self eventCacheLock];
    [v51 unlock];

    goto LABEL_66;
  }
LABEL_67:
}

- (void)_logEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = [(ACCAnalyticsLogger *)self loggingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke;
  block[3] = &unk_26466B9B8;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [NSDictionary dictionaryWithDictionary:*(void *)(a1 + 32)];
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107;
  block[3] = &unk_26466B990;
  void block[4] = WeakRetained;
  id v14 = *(id *)(a1 + 48);
  id v5 = v3;
  id v15 = v5;
  uint64_t v16 = &v17;
  dispatch_sync(v4, block);
  id v6 = [MEMORY[0x263EFF910] date];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    id v7 = (void *)v18[5];
    *(_DWORD *)buf = 138412290;
    id v24 = v7;
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "[#ACCEventLogger] ACCEventLogging: figaroDate %@", buf, 0xCu);
  }
  if (!v18[5])
  {
    [WeakRetained resetUploadDateAndClearDBEntries:0 dueToError:1];
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "compare:") == 1)
  {
    id v11 = 0;
    uint64_t v12 = 0;
    int v8 = [WeakRetained forceUploadWithError:&v11 httpStatusCode:&v12];
    id v9 = v11;
    if ((v8 & 1) == 0)
    {
      if ((unint64_t)(v12 - 400) > 0x63)
      {
        uint64_t v10 = 0;
LABEL_12:
        [WeakRetained resetUploadDateAndClearDBEntries:v10 dueToError:v8 ^ 1u];
        if (v9 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v9;
          _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogging: failed with error: %@", buf, 0xCu);
        }

        goto LABEL_16;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_cold_1(&v12);
      }
    }
    uint64_t v10 = 1;
    goto LABEL_12;
  }
LABEL_16:

  _Block_object_dispose(&v17, 8);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1
    && (*(unsigned char *)(v1 + 88) & 2) == 0
    && ([*(id *)(v1 + 80) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) eventDictForEventName:*(void *)(a1 + 40) withAttributes:*(void *)(a1 + 48)];
    id v4 = [*(id *)(a1 + 32) eventDictWithBlacklistedFieldsStrippedFrom:v3];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 8) allEvents];
    uint64_t v6 = [v5 count];

    [*(id *)(*(void *)(a1 + 32) + 8) addEventDict:v4 toTable:@"all_events"];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) allEvents];
    unint64_t v8 = [v7 count];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      unint64_t v13 = v8;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] database entry count: %lu", (uint8_t *)&v12, 0xCu);
    }
    if (v8 > 0x3E7 || v6 == 999)
    {
      if ((v6 != 999 || v8 != 999) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107_cold_1(v8);
      }
      [*(id *)(*(void *)(a1 + 32) + 8) incrementWrapFailureCount];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 8) incrementSuccessCount];
    }
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) uploadDate];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (void)resetUploadDateAndClearDBEntries:(BOOL)a3 dueToError:(BOOL)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ACCAnalyticsLogger_resetUploadDateAndClearDBEntries_dueToError___block_invoke;
  block[3] = &unk_26466B9E0;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3;
  BOOL v11 = a4;
  dispatch_sync(queue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__ACCAnalyticsLogger_resetUploadDateAndClearDBEntries_dueToError___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40)) {
      [WeakRetained[1] clearAllData];
    }
    if (!*(unsigned char *)(a1 + 41))
    {
      id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)(uint64_t)v3[6]];
      [v3[1] setUploadDate:v5];
      goto LABEL_8;
    }
    id v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)(uint64_t)v3[7]];
    [v3[1] setUploadDate:v4];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3[1] uploadDate];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] ACCEventLogging: next analytic sync event: %@", (uint8_t *)&v6, 0xCu);
LABEL_8:
    }
  }
}

- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    uint64_t v8 = (void *)[a4 mutableCopy];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFF9A0];
    id v10 = a3;
    uint64_t v8 = [v9 dictionary];
  }
  BOOL v11 = v8;
  [v8 setObject:self->_figaroTopicName forKeyedSubscript:@"topic"];
  [v11 setObject:a3 forKeyedSubscript:@"eventType"];

  int v12 = NSNumber;
  unint64_t v13 = [MEMORY[0x263EFF910] date];
  [v13 timeIntervalSince1970];
  id v15 = [v12 numberWithDouble:v14 * 1000.0];
  [v11 setObject:v15 forKeyedSubscript:@"eventTime"];

  metricsBase = self->_metricsBase;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__ACCAnalyticsLogger_eventDictForEventName_withAttributes___block_invoke;
  v19[3] = &unk_26466BA08;
  id v17 = v11;
  id v20 = v17;
  [(NSDictionary *)metricsBase enumerateKeysAndObjectsUsingBlock:v19];

  return v17;
}

void __59__ACCAnalyticsLogger_eventDictForEventName_withAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 mutableCopy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_blacklistedFields;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ACCAnalyticsLogger_setDateProperty_forKey___block_invoke;
  block[3] = &unk_26466BA30;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __45__ACCAnalyticsLogger_setDateProperty_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setDateProperty:a1[5] forKey:a1[6]];
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ACCAnalyticsLogger_datePropertyForKey___block_invoke;
  block[3] = &unk_26466BA58;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __41__ACCAnalyticsLogger_datePropertyForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) datePropertyForKey:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (NSURL)figaroUploadURL
{
  v31[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  figaroUploadURL = self->_figaroUploadURL;
  if (figaroUploadURL)
  {
    id v4 = figaroUploadURL;
  }
  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy_;
    v27[4] = __Block_byref_object_dispose_;
    id v28 = 0;
    id v6 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    uint64_t v30 = @"User-Agent";
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"accessoryd/%s", "1.1");
    v31[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    [v6 setHTTPAdditionalHeaders:v8];

    id v9 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v6 delegate:self delegateQueue:0];
    id v10 = self->_figaroBagURL;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy_;
    uint64_t v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __37__ACCAnalyticsLogger_figaroUploadURL__block_invoke;
    v15[3] = &unk_26466BA80;
    objc_copyWeak(&v20, &location);
    id v18 = v27;
    long long v11 = v5;
    uint64_t v16 = v11;
    uint64_t v19 = &v21;
    id v12 = v9;
    id v17 = v12;
    id v13 = [v12 dataTaskWithURL:v10 completionHandler:v15];
    [v13 resume];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    id v4 = (NSURL *)(id)v22[5];

    objc_destroyWeak(&v20);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(v27, 8);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __37__ACCAnalyticsLogger_figaroUploadURL__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_35;
  }
  if (!v6 || v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v9 + 40);
  id v10 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
LABEL_26:

LABEL_27:
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
        [*(id *)(a1 + 40) invalidateAndCancel];
        goto LABEL_35;
      }
      *(_WORD *)buf = 0;
      id v28 = MEMORY[0x263EF8438];
      v29 = "[#ACCEventLogger] Unable to fetch figaro endpoint";
    }
    else
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
        || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      id v28 = MEMORY[0x263EF8438];
      v29 = "[#ACCEventLogger] Malformed config payload!";
    }
    _os_log_impl(&dword_222CE3000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    goto LABEL_34;
  }
  if ((WeakRetained[11] & 8) != 0)
  {
LABEL_19:
    uint64_t v21 = [v10 objectForKeyedSubscript:@"metricsBase"];
    id v22 = (void *)WeakRetained[8];
    WeakRetained[8] = v21;

    uint64_t v23 = [v10 objectForKeyedSubscript:@"metricsUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = [v23 stringByAppendingFormat:@"/2/%@", WeakRetained[3]];
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v24;
        _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] got metrics endpoint: %@", buf, 0xCu);
      }
      uint64_t v25 = [NSURL URLWithString:v24];
      id v26 = [v25 scheme];
      int v27 = [v26 isEqualToString:@"https"];

      if (v27) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v25);
      }
    }
    goto LABEL_26;
  }
  long long v11 = [v10 valueForKey:@"disabled"];
  if ([v11 BOOLValue]) {
    char v12 = 2;
  }
  else {
    char v12 = 0;
  }
  *((unsigned char *)WeakRetained + 88) = WeakRetained[11] & 0xFD | v12;

  if ((WeakRetained[11] & 2) == 0)
  {
    id v13 = [v10 valueForKey:@"sendDisabled"];
    int v14 = [v13 BOOLValue];

    if (!v14)
    {
      id v15 = [v10 valueForKey:@"postFrequency"];
      unint64_t v16 = [v15 unsignedIntegerValue];

      if (v16 >= 0x3E8) {
        WeakRetained[6] = v16 / 0x3E8;
      }
      uint64_t v17 = [v10 objectForKeyedSubscript:@"blacklistedEvents"];
      id v18 = (void *)WeakRetained[10];
      WeakRetained[10] = v17;

      uint64_t v19 = [v10 objectForKeyedSubscript:@"blacklistedFields"];
      id v20 = (void *)WeakRetained[9];
      WeakRetained[9] = v19;

      goto LABEL_19;
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] figaro is disabled", buf, 2u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

LABEL_35:
}

- (BOOL)forceUploadWithError:(id *)a3 httpStatusCode:(int64_t *)a4
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v7 = [(ACCAnalyticsLogger *)self getLoggingJSON:0 error:a3];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ACCAnalyticsLogger_forceUploadWithError_httpStatusCode___block_invoke;
  block[3] = &unk_26466BAA8;
  id v12 = v7;
  id v13 = self;
  id v15 = &v21;
  unint64_t v16 = a3;
  int v14 = &v17;
  id v9 = v7;
  dispatch_sync(queue, block);
  *a4 = v18[3];
  LOBYTE(a4) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return (char)a4;
}

uint64_t __58__ACCAnalyticsLogger_forceUploadWithError_httpStatusCode___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  BOOL v3 = 0;
  if (v2)
  {
    result = [*(id *)(result + 40) _onQueuePostJSON:v2 error:*(void *)(result + 64) httpStatusCode:*(void *)(*(void *)(result + 48) + 8) + 24];
    if (result) {
      BOOL v3 = 1;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = v3;
  return result;
}

- (BOOL)_onQueuePostJSON:(id)a3 error:(id *)a4 httpStatusCode:(int64_t *)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  uint64_t v33 = @"User-Agent";
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"accessoryd/%s", "1.1");
  v34[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
  [v8 setHTTPAdditionalHeaders:v10];

  long long v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v8 delegate:self delegateQueue:0];
  id v12 = [(ACCAnalyticsLogger *)self figaroUploadURL];
  if (v12) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] failed to get a figaro endpoint - using bag instead", buf, 2u);
  }
  id v12 = [(ACCAnalyticsLogger *)self figaroBagURL];
  if (v12)
  {
LABEL_5:
    id v13 = objc_alloc_init(MEMORY[0x263F089E0]);
    [v13 setURL:v12];
    [v13 setHTTPMethod:@"POST"];
    [v13 setHTTPBody:v7];
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    uint64_t v30 = buf;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__ACCAnalyticsLogger__onQueuePostJSON_error_httpStatusCode___block_invoke;
    v20[3] = &unk_26466BAD0;
    uint64_t v23 = &v25;
    char v24 = buf;
    id v15 = v14;
    uint64_t v21 = v15;
    id v22 = v11;
    unint64_t v16 = [v22 dataTaskWithRequest:v13 completionHandler:v20];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro start", v19, 2u);
    }
    [v16 resume];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    *a5 = v26[3];
    BOOL v17 = v30[24] != 0;

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v17 = 0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] failed to get a figaro endpoint", buf, 2u);
      BOOL v17 = 0;
    }
  }

  return v17;
}

void __60__ACCAnalyticsLogger__onQueuePostJSON_error_httpStatusCode___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v9;
      id v10 = MEMORY[0x263EF8438];
      long long v11 = "[#ACCEventLogger] Figaro event error: %@";
      uint32_t v12 = 12;
LABEL_11:
      _os_log_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v12);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v13 statusCode];
    if ([v13 statusCode] < 200 || objc_msgSend(v13, "statusCode") > 299)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 67109120;
        LODWORD(v18) = [v13 statusCode];
        dispatch_semaphore_t v14 = MEMORY[0x263EF8438];
        id v15 = "[#ACCEventLogger] Figaro error: %d";
        uint32_t v16 = 8;
        goto LABEL_14;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        dispatch_semaphore_t v14 = MEMORY[0x263EF8438];
        id v15 = "[#ACCEventLogger] Figaro success";
        uint32_t v16 = 2;
LABEL_14:
        _os_log_impl(&dword_222CE3000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, v16);
      }
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    id v10 = MEMORY[0x263EF8438];
    long long v11 = "[#ACCEventLogger] Received the wrong kind of class";
    uint32_t v12 = 2;
    goto LABEL_11;
  }
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  [*(id *)(a1 + 40) invalidateAndCancel];
}

+ (void)addBuiltInFieldsToEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (addBuiltInFieldsToEvent__onceToken != -1)
  {
    dispatch_once(&addBuiltInFieldsToEvent__onceToken, &__block_literal_global_0);
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__build)
  {
    [v4 setObject:addBuiltInFieldsToEvent__build forKeyedSubscript:@"build"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__productVersion)
  {
    [v4 setObject:addBuiltInFieldsToEvent__productVersion forKeyedSubscript:@"productVersion"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__modelNumberStr)
  {
    [v4 setObject:addBuiltInFieldsToEvent__modelNumberStr forKeyedSubscript:@"modelString"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__platform)
  {
    [v4 setObject:addBuiltInFieldsToEvent__platform forKeyedSubscript:@"platform"];
    id v3 = v4;
  }
  if (addBuiltInFieldsToEvent__productType)
  {
    [v4 setObject:addBuiltInFieldsToEvent__productType forKeyedSubscript:@"productType"];
    id v3 = v4;
  }
}

void __46__ACCAnalyticsLogger_addBuiltInFieldsToEvent___block_invoke()
{
  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    id v13 = v0;
    uint64_t v1 = [v0 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
    uint64_t v2 = (void *)addBuiltInFieldsToEvent__build;
    addBuiltInFieldsToEvent__build = v1;

    uint64_t v3 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFFAC0]];
    id v4 = (void *)addBuiltInFieldsToEvent__productVersion;
    addBuiltInFieldsToEvent__productVersion = v3;

    uint64_t v5 = MGCopyAnswer();
    id v6 = (void *)addBuiltInFieldsToEvent__modelNumberStr;
    addBuiltInFieldsToEvent__modelNumberStr = v5;

    uint64_t v7 = MGCopyAnswer();
    id v8 = (void *)addBuiltInFieldsToEvent__platform;
    addBuiltInFieldsToEvent__platform = v7;

    uint64_t v9 = MGCopyAnswer();
    id v10 = (void *)addBuiltInFieldsToEvent__productVersion;
    addBuiltInFieldsToEvent__productVersion = v9;

    uint64_t v11 = MGCopyAnswer();
    uint32_t v12 = (void *)addBuiltInFieldsToEvent__productType;
    addBuiltInFieldsToEvent__productType = v11;

    v0 = v13;
  }
}

- (id)getLoggingJSON:(BOOL)a3 error:(id *)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint32_t v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ACCAnalyticsLogger_getLoggingJSON_error___block_invoke;
  v7[3] = &unk_26466BAF8;
  v7[5] = &v9;
  v7[6] = a4;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __43__ACCAnalyticsLogger_getLoggingJSON_error___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 8) tryToOpenDatabase])
  {
    char v32 = [*(id *)(*(void *)(a1 + 32) + 8) allEvents];
    uint64_t v30 = [MEMORY[0x263EFF910] date];
    uint64_t v31 = a1;
    [*(id *)(*(void *)(a1 + 32) + 8) summaryCounts];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v29 = long long v36 = 0u;
    uint64_t v2 = [v29 objectEnumerator];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v10 = [v9 objectForKeyedSubscript:@"success_count"];
          v5 += [v10 integerValue];

          uint64_t v11 = [v9 objectForKeyedSubscript:@"wrap_failure_count"];
          v6 += [v11 integerValue];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }

    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v13 = v12;
    uint64_t v14 = *(void *)(*(void *)(v31 + 32) + 24);
    if (v14)
    {
      [v12 setObject:v14 forKeyedSubscript:@"topic"];
    }
    else
    {
      id v15 = [MEMORY[0x263EFF9D0] null];
      [v13 setObject:v15 forKeyedSubscript:@"topic"];
    }
    uint32_t v16 = NSNumber;
    [v30 timeIntervalSince1970];
    id v18 = [v16 numberWithDouble:v17 * 1000.0];
    [v13 setObject:v18 forKeyedSubscript:@"eventTime"];

    [v13 setObject:@"accessoryHealthSummary" forKeyedSubscript:@"eventType"];
    uint64_t v19 = [NSNumber numberWithInteger:v5];
    [v13 setObject:v19 forKeyedSubscript:@"success_count"];

    uint64_t v20 = [NSNumber numberWithInteger:v6];
    [v13 setObject:v20 forKeyedSubscript:@"wrap_failure_count"];

    +[ACCAnalyticsLogger addBuiltInFieldsToEvent:v13];
    uint64_t v21 = (void *)[v32 mutableCopy];
    [v21 addObject:v13];
    v38[0] = @"postTime";
    id v22 = NSNumber;
    [v30 timeIntervalSince1970];
    char v24 = [v22 numberWithDouble:v23 * 1000.0];
    v38[1] = @"events";
    v39[0] = v24;
    v39[1] = v21;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];

    uint64_t v26 = [MEMORY[0x263F08900] dataWithJSONObject:v25 options:*(unsigned __int8 *)(v31 + 56) error:*(void *)(v31 + 48)];
    uint64_t v27 = *(void *)(*(void *)(v31 + 40) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] can't get logging JSON because database is not openable", buf, 2u);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    -[ACCAnalyticsLogger URLSession:didReceiveChallenge:completionHandler:]();
  }
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Figaro challenge", buf, 2u);
  }
  int v19 = 0;
  if ([v9 previousFailureCount] >= 1) {
    goto LABEL_5;
  }
  id v12 = [v9 protectionSpace];
  id v13 = [v12 authenticationMethod];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F08560]];

  if (!v14)
  {
    v11[2](v11, 1, 0);
    goto LABEL_12;
  }
  id v15 = [v9 protectionSpace];
  uint64_t v16 = [v15 serverTrust];

  MEMORY[0x223CA7550](v16, &v19);
  if (*((unsigned char *)self + 88))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Force Accepting Figaro Credential", v18, 2u);
    }
    goto LABEL_15;
  }
  if (v19 == 1 || v19 == 4)
  {
LABEL_15:
    double v17 = [MEMORY[0x263F08BB8] credentialForTrust:v16];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v17);

    goto LABEL_12;
  }
LABEL_5:
  v11[2](v11, 2, 0);
LABEL_12:
}

- (BOOL)ignoreServerDisablingMessages
{
  return (*((unsigned __int8 *)self + 88) >> 3) & 1;
}

- (void)setIgnoreServerDisablingMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 88) = *((unsigned char *)self + 88) & 0xF7 | v3;
}

- (BOOL)allowsInsecureFigaroCert
{
  return *((unsigned char *)self + 88) & 1;
}

- (void)setAllowsInsecureFigaroCert:(BOOL)a3
{
  *((unsigned char *)self + 88) = *((unsigned char *)self + 88) & 0xFE | a3;
}

- (NSURL)figaroBagURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)figaroTopicName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int)user
{
  return self->_user;
}

- (void)setUser:(int)a3
{
  self->_user = a3;
}

- (NSMutableArray)pluginEventsBeforeFirstUnlock
{
  return self->_pluginEventsBeforeFirstUnlock;
}

- (void)setPluginEventsBeforeFirstUnlock:(id)a3
{
}

- (NSMutableArray)accessorydEventsBeforeFirstUnlock
{
  return self->_accessorydEventsBeforeFirstUnlock;
}

- (void)setAccessorydEventsBeforeFirstUnlock:(id)a3
{
}

- (NSLock)eventCacheLock
{
  return self->_eventCacheLock;
}

- (void)setEventCacheLock:(id)a3
{
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setLoggingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_eventCacheLock, 0);
  objc_storeStrong((id *)&self->_accessorydEventsBeforeFirstUnlock, 0);
  objc_storeStrong((id *)&self->_pluginEventsBeforeFirstUnlock, 0);
  objc_storeStrong((id *)&self->_blacklistedEvents, 0);
  objc_storeStrong((id *)&self->_blacklistedFields, 0);
  objc_storeStrong((id *)&self->_metricsBase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_figaroBagURL, 0);
  objc_storeStrong((id *)&self->_figaroTopicName, 0);
  objc_storeStrong((id *)&self->_figaroUploadURL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[#ACCEventLogger] ACCEventLogging: error %lu forced events to be dropped", (uint8_t *)&v2, 0xCu);
}

void __52__ACCAnalyticsLogger__logEventNamed_withAttributes___block_invoke_107_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 134218240;
  uint64_t v2 = a1;
  __int16 v3 = 1024;
  int v4 = 999;
  _os_log_error_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[#ACCEventLogger] database count: %lu greater than max count allowed (%d)", (uint8_t *)&v1, 0x12u);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
}

@end