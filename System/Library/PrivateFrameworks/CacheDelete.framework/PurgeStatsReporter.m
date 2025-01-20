@interface PurgeStatsReporter
+ (BOOL)sendPurgeStatsEventWithKey:(id)a3;
+ (id)statKeys;
- (BOOL)statsAreStale;
- (NSURL)persistenceURL;
- (OS_dispatch_queue)persistenceQueue;
- (PurgeStatsReporter)initWithPath:(id)a3;
- (id)load;
- (unint64_t)generationNumber;
- (void)appendAndSaveStats:(id)a3;
- (void)resetPurgeStats;
- (void)save:(id)a3;
- (void)sendAndResetStats;
- (void)setPersistenceQueue:(id)a3;
@end

@implementation PurgeStatsReporter

- (PurgeStatsReporter)initWithPath:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PurgeStatsReporter;
  v5 = [(PurgeStatsReporter *)&v24 init];
  if (!v5) {
    goto LABEL_14;
  }
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.CacheDelete.purgeStatReporter", 0);
  persistenceQueue = v5->_persistenceQueue;
  v5->_persistenceQueue = (OS_dispatch_queue *)v6;

  uint64_t v8 = +[NSURL fileURLWithPath:v4];
  persistenceURL = v5->_persistenceURL;
  v5->_persistenceURL = (NSURL *)v8;

  v10 = v5->_persistenceURL;
  if (!v10)
  {
    v17 = CDGetLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to initialize purge stats' persistence path!", buf, 2u);
    }

    goto LABEL_19;
  }
  id v11 = [(NSURL *)v10 path];
  int v12 = access((const char *)[v11 UTF8String], 0);

  if (!v12)
  {
    if ([(PurgeStatsReporter *)v5 statsAreStale])
    {
      v18 = CDGetLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Purge stat reporter found stale stats", buf, 2u);
      }

      [(PurgeStatsReporter *)v5 resetPurgeStats];
    }
    goto LABEL_14;
  }
  v13 = +[NSKeyedArchiver archivedDataWithRootObject:&__NSDictionary0__struct requiringSecureCoding:1 error:0];
  if (!v13)
  {
    id v16 = 0;
    goto LABEL_16;
  }
  v14 = [(NSURL *)v5->_persistenceURL path];
  id v23 = 0;
  unsigned __int8 v15 = [v13 writeToFile:v14 options:0 error:&v23];
  id v16 = v23;

  if ((v15 & 1) == 0)
  {
LABEL_16:
    v20 = CDGetLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = [(NSURL *)v5->_persistenceURL path];
      *(_DWORD *)buf = 138412802;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v22;
      __int16 v29 = 2112;
      id v30 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "unable to write results to cache file. Data: %@, Path: %@, Error: %@", buf, 0x20u);
    }
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }

LABEL_14:
  v19 = v5;
LABEL_20:

  return v19;
}

- (void)save:(id)a3
{
  id v4 = a3;
  persistenceQueue = self->_persistenceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __27__PurgeStatsReporter_save___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(persistenceQueue, v7);
}

void __27__PurgeStatsReporter_save___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = +[NSKeyedArchiver archivedDataWithRootObject:*(void *)(a1 + 40) requiringSecureCoding:1 error:0];
    if (v2)
    {
      v3 = [*(id *)(*(void *)(a1 + 32) + 8) path];
      id v7 = 0;
      unsigned __int8 v4 = [v2 writeToFile:v3 options:0 error:&v7];
      v5 = v7;

      if (v4)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to persist purge stats, deleting persistence file if it exists. Error : %@", buf, 0xCu);
    }

    unlink((const char *)[*(id *)(*(void *)(a1 + 32) + 8) fileSystemRepresentation]);
    goto LABEL_11;
  }
  v5 = CDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Weird... no purge stats path to persist to.", buf, 2u);
  }
LABEL_12:
}

- (id)load
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__3;
  int v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  persistenceQueue = self->_persistenceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __26__PurgeStatsReporter_load__block_invoke;
  v7[3] = &unk_10005D8A0;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(persistenceQueue, v7);
  v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __26__PurgeStatsReporter_load__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) path];
  v3 = +[NSData dataWithContentsOfFile:v2];

  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  id v13 = 0;
  uint64_t v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v3 error:&v13];
  id v8 = v13;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (v8 || !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v11 = CDGetLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      id v15 = v8;
      __int16 v16 = 2112;
      v17 = v3;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to read in purge stats - deleting persistence file. Error: %@, Data: %@, Loaded Stats: %@", buf, 0x20u);
    }

    unlink((const char *)[*(id *)(*(void *)(a1 + 32) + 8) fileSystemRepresentation]);
  }
}

- (BOOL)statsAreStale
{
  v2 = [(PurgeStatsReporter *)self load];
  v3 = +[NSMutableDictionary dictionaryWithDictionary:v2];

  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  id v6 = objc_alloc_init((Class)NSNumberFormatter);
  [v6 setNumberStyle:1];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(v3, "allKeys", 0);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    double v9 = v5 + -172800.0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "substringToIndex:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "rangeOfString:", @"_"));
        id v13 = [v6 numberFromString:v12];

        [v13 doubleValue];
        double v15 = v14;

        if (v15 < v9)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)resetPurgeStats
{
}

- (void)appendAndSaveStats:(id)a3
{
  id v4 = a3;
  if ([(PurgeStatsReporter *)self statsAreStale]) {
    [(PurgeStatsReporter *)self resetPurgeStats];
  }
  double v5 = [(PurgeStatsReporter *)self load];
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;
  id v8 = +[NSUUID UUID];
  double v9 = +[NSString stringWithFormat:@"%lf_%@", v7, v8];

  [v10 setObject:v4 forKeyedSubscript:v9];
  [(PurgeStatsReporter *)self save:v10];
}

+ (id)statKeys
{
  return &off_100061588;
}

- (unint64_t)generationNumber
{
  return generationNumber_generation++;
}

- (void)sendAndResetStats
{
  [(PurgeStatsReporter *)self load];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v15 = v27 = 0u;
  id obj = [v15 allValues];
  id v19 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v4 = objc_opt_new();
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v5 = v3;
        id v6 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v21;
          do
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v21 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
              id v11 = +[PurgeStatsReporter statKeys];
              unsigned int v12 = [v11 containsObject:v10];

              if (v12)
              {
                id v13 = [v5 objectForKeyedSubscript:v10];
                [v4 setObject:v13 forKeyedSubscript:v10];
              }
            }
            id v7 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
          }
          while (v7);
        }

        if (!+[PurgeStatsReporter sendPurgeStatsEventWithKey:v4])
        {
          double v14 = CDGetLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            __int16 v29 = "-[PurgeStatsReporter sendAndResetStats]";
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s : sending of stats to CA seems to have failed (or is not enabled).", buf, 0xCu);
          }

          goto LABEL_22;
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  [(PurgeStatsReporter *)self resetPurgeStats];
}

+ (BOOL)sendPurgeStatsEventWithKey:(id)a3
{
  id v3 = a3;
  id v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "+[PurgeStatsReporter sendPurgeStatsEventWithKey:]";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s : %@", buf, 0x16u);
  }

  uint64_t v8 = v3;
  id v5 = v3;
  char v6 = AnalyticsSendEventLazy();

  return v6;
}

id __49__PurgeStatsReporter_sendPurgeStatsEventWithKey___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (void)setPersistenceQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
}

@end