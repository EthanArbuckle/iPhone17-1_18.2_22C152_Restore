@interface CacheDeleteAnalytics
+ (BOOL)isDataCollectionEnabled;
+ (id)buildType;
+ (id)currentSystemInfo;
+ (id)getLowDiskLevelFromPurgeResult:(id)a3;
- (BOOL)isRootVolume:(id)a3;
- (CDPurgeableResultCache)purgeableResultCache;
- (CacheDeleteAnalytics)initWithServiceProvider:(id)a3 withPurgeableResultCache:(id)a4;
- (CacheDeleteServiceProvider)serviceProvider;
- (NSMutableDictionary)dailyStats;
- (OS_dispatch_queue)serialQueue;
- (PowerLogger)powerLogger;
- (PurgeStatsReporter)purgeStatReporter;
- (const)stringForTime:(double)a3;
- (const)stringForUrgency:(int)a3;
- (double)machTimeToSeconds:(unint64_t)a3;
- (double)round:(double)a3 toSignificantDigits:(int)a4;
- (double)secondsFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)cacheManagementUsageStats;
- (id)dailyPurgeableStats:(BOOL)a3;
- (id)fetchAdditionalStats;
- (id)fetchApplicationUsageStats;
- (id)fetchLowDiskStats;
- (id)fetchStorageStats;
- (id)fetchTimingStats:(id)a3;
- (id)persistPath;
- (id)roundNumber:(id)a3 toSignificantDigits:(int)a4;
- (id)systemUsageStats;
- (unint64_t)nandSize;
- (void)_addDailyStats:(id)a3;
- (void)_postDailyStats:(id)a3;
- (void)_reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)_reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5;
- (void)_reportPurgeTimingInfo:(id)a3;
- (void)_reportPurgeableTimingInfo:(id)a3;
- (void)_reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)addDailyStats:(id)a3;
- (void)addDailyValueForKey:(id)a3 value:(double)a4;
- (void)anonymizeAndFlush:(id)a3 name:(id)a4;
- (void)clear;
- (void)incrementDailyValueForKey:(id)a3;
- (void)load:(id)a3;
- (void)postDailyStats:(id)a3;
- (void)processPeriodicOperationResult:(id)a3;
- (void)processPurgeOperationResult:(id)a3;
- (void)processPurgeableOperationResult:(id)a3;
- (void)reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5;
- (void)reportPeriodic:(id)a3;
- (void)reportPurge:(id)a3;
- (void)reportPurgeTimingInfo:(id)a3;
- (void)reportPurgeable:(id)a3;
- (void)reportPurgeableTimingInfo:(id)a3;
- (void)reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)save;
- (void)sendAppCacheStats:(id)a3;
- (void)sendCAEvent:(id)a3 key:(id)a4 value:(id)a5 value2:(id)a6;
- (void)sendPurgeableAmountStats;
- (void)setDailyStats:(id)a3;
- (void)setPowerLogger:(id)a3;
- (void)setPurgeStatReporter:(id)a3;
- (void)setPurgeableResultCache:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServiceProvider:(id)a3;
@end

@implementation CacheDeleteAnalytics

- (void)reportPurgeableTimingInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __50__CacheDeleteAnalytics_reportPurgeableTimingInfo___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

id __50__CacheDeleteAnalytics_reportPurgeableTimingInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportPurgeableTimingInfo:*(void *)(a1 + 40)];
}

- (void)_reportPurgeableTimingInfo:(id)a3
{
  id v9 = a3;
  -[CacheDeleteAnalytics secondsFrom:to:](self, "secondsFrom:to:", [v9 monotonicBegin], objc_msgSend(v9, "monotonicEnd"));
  id v4 = -[CacheDeleteAnalytics stringForTime:](self, "stringForTime:");
  v5 = +[NSString stringWithUTF8String:v4];
  unsigned __int8 v6 = [v5 isEqualToString:@"OK"];

  if ((v6 & 1) == 0)
  {
    id v7 = [v9 serviceName];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purgeable_time_%s_%s", v4, [v7 UTF8String]);

    [(CacheDeleteAnalytics *)self incrementDailyValueForKey:v8];
  }
}

- (const)stringForTime:(double)a3
{
  if (((125 * (unint64_t)a3) & 0x1FFFFFFFFFFFFFFFLL) <= 0x270) {
    v3 = "OK";
  }
  else {
    v3 = "Verylate";
  }
  if (1000 * (unint64_t)a3 - 1000 >= 0xFA0) {
    return v3;
  }
  else {
    return "Late";
  }
}

- (double)secondsFrom:(unint64_t)a3 to:(unint64_t)a4
{
  [(CacheDeleteAnalytics *)self machTimeToSeconds:a4 - a3];
  return result;
}

- (double)machTimeToSeconds:(unint64_t)a3
{
  if (qword_10006A800 != -1) {
    dispatch_once(&qword_10006A800, &__block_literal_global_1);
  }
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3 / 0x3B9ACA00];
  [v4 doubleValue];
  LODWORD(v5) = dword_10006A7F8;
  LODWORD(v6) = *(_DWORD *)algn_10006A7FC;
  double v8 = v7 * (double)v5 / (double)v6;

  return v8;
}

- (CacheDeleteAnalytics)initWithServiceProvider:(id)a3 withPurgeableResultCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CacheDeleteAnalytics;
  double v8 = [(CacheDeleteAnalytics *)&v22 init];
  if (v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(CacheDeleteAnalytics *)v8 setDailyStats:v9];

    v10 = +[NSDate date];
    v11 = [(CacheDeleteAnalytics *)v8 dailyStats];
    [v11 setObject:v10 forKeyedSubscript:@"DateStarted"];

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cache_delete.analytics", 0);
    [(CacheDeleteAnalytics *)v8 setSerialQueue:v12];

    [(CacheDeleteAnalytics *)v8 setPurgeableResultCache:v7];
    [(CacheDeleteAnalytics *)v8 setServiceProvider:v6];
    v13 = +[PowerLogger sharedLogger];
    [(CacheDeleteAnalytics *)v8 setPowerLogger:v13];

    v14 = [(CacheDeleteAnalytics *)v8 powerLogger];

    if (!v14)
    {
      v15 = CDGetLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No power log support.", v21, 2u);
      }
    }
    v16 = [PurgeStatsReporter alloc];
    v17 = cdCachesPath();
    v18 = [v17 stringByAppendingPathComponent:@"CDPurgeStats"];
    v19 = [(PurgeStatsReporter *)v16 initWithPath:v18];
    [(CacheDeleteAnalytics *)v8 setPurgeStatReporter:v19];

    v8->_nandSize = copyNANDSizeBytes();
  }

  return v8;
}

- (id)persistPath
{
  v2 = cdCachesPath();
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 stringByAppendingPathComponent:@"CacheDeleteAnalytics.plist"];
  }
  else
  {
    unint64_t v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to get persistPath to save analytics!", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (void)save
{
  v3 = [(CacheDeleteAnalytics *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __28__CacheDeleteAnalytics_save__block_invoke;
  block[3] = &unk_10005CD00;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __28__CacheDeleteAnalytics_save__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) persistPath];
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) dailyStats];
    unsigned __int8 v4 = [v3 writeToFile:v2 atomically:0];

    if ((v4 & 1) == 0)
    {
      unint64_t v5 = CDGetLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v6 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to persist CacheDelete analytic data!", v6, 2u);
      }
    }
  }
}

- (void)load:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __29__CacheDeleteAnalytics_load___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __29__CacheDeleteAnalytics_load___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) persistPath];
  if (v2)
  {
    v3 = +[NSDictionary dictionaryWithContentsOfFile:v2];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 mutableCopy];
      [*(id *)(a1 + 32) setDailyStats:v5];

      id v6 = [*(id *)(a1 + 32) dailyStats];
      id v7 = [v6 objectForKeyedSubscript:@"DateStarted"];

      if (!v7
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (+[NSDate date],
            id v8 = objc_claimAutoreleasedReturnValue(),
            [v8 timeIntervalSinceDate:v7],
            double v10 = v9,
            v8,
            v10 >= 86400.0))
      {
        [*(id *)(a1 + 32) _postDailyStats:*(void *)(a1 + 40)];
      }
    }
    else
    {
      v11 = CDGetLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Did not load CacheDelete analytic data", v14, 2u);
      }

      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      [*(id *)(a1 + 32) setDailyStats:v12];

      id v7 = +[NSDate date];
      v13 = [*(id *)(a1 + 32) dailyStats];
      [v13 setObject:v7 forKeyedSubscript:@"DateStarted"];
    }
  }
}

- (void)clear
{
  v3 = [(CacheDeleteAnalytics *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CacheDeleteAnalytics *)self persistPath];
  if (v4)
  {
    id v5 = +[NSFileManager defaultManager];
    id v16 = 0;
    unsigned int v6 = [v5 removeItemAtPath:v4 error:&v16];
    id v7 = v16;

    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8) {
      goto LABEL_14;
    }
    NSErrorDomain v9 = [v7 domain];
    NSErrorDomain v10 = v9;
    if (v9 == NSPOSIXErrorDomain)
    {
      id v11 = [v7 code];

      if (v11 == (id)2)
      {
        id v12 = CDGetLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "No file to remove at %@", buf, 0xCu);
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v12 = CDGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove file at %@: %@", buf, 0x16u);
    }
LABEL_13:

LABEL_14:
  }
  v13 = [(CacheDeleteAnalytics *)self dailyStats];
  [v13 removeAllObjects];

  v14 = +[NSDate date];
  v15 = [(CacheDeleteAnalytics *)self dailyStats];
  [v15 setObject:v14 forKeyedSubscript:@"DateStarted"];
}

- (void)addDailyStats:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __38__CacheDeleteAnalytics_addDailyStats___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __38__CacheDeleteAnalytics_addDailyStats___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDailyStats:*(void *)(a1 + 40)];
}

- (void)postDailyStats:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __39__CacheDeleteAnalytics_postDailyStats___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

id __39__CacheDeleteAnalytics_postDailyStats___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postDailyStats:*(void *)(a1 + 40)];
}

- (void)reportPurgeTimingInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __46__CacheDeleteAnalytics_reportPurgeTimingInfo___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

id __46__CacheDeleteAnalytics_reportPurgeTimingInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportPurgeTimingInfo:*(void *)(a1 + 40)];
}

+ (id)currentSystemInfo
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__CacheDeleteAnalytics_currentSystemInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_11 != -1) {
    dispatch_once(&_MergedGlobals_11, block);
  }
  v2 = (void *)qword_10006A7F0;
  return v2;
}

void __41__CacheDeleteAnalytics_currentSystemInfo__block_invoke(uint64_t a1)
{
  v2 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  v8[0] = @"systemBuildVersion";
  v3 = [v2 objectForKey:@"ProductBuildVersion"];
  v9[0] = v3;
  v8[1] = @"systemProductName";
  id v4 = [v2 objectForKey:@"ProductName"];
  v9[1] = v4;
  v8[2] = @"systemBuildType";
  id v5 = [*(id *)(a1 + 32) buildType];
  v9[2] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v7 = (void *)qword_10006A7F0;
  qword_10006A7F0 = v6;
}

+ (id)buildType
{
  if (os_variant_has_internal_content()) {
    v2 = @"Internal";
  }
  else {
    v2 = @"Release";
  }
  return v2;
}

+ (BOOL)isDataCollectionEnabled
{
  return _DiagnosticLogSubmissionEnabled(a1, a2);
}

- (id)fetchLowDiskStats
{
  v3 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v37 = [&off_100061510 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v52;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(&off_100061510);
        }
        uint64_t v38 = v4;
        uint64_t v5 = *(void *)(*((void *)&v51 + 1) + 8 * v4);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v6 = [&off_100061528 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v6)
        {
          id v7 = v6;
          id v8 = 0;
          uint64_t v9 = *(void *)v48;
          do
          {
            NSErrorDomain v10 = 0;
            id v11 = v8;
            do
            {
              if (*(void *)v48 != v9) {
                objc_enumerationMutation(&off_100061528);
              }
              id v8 = +[NSString stringWithFormat:@"%@%@", *(void *)(*((void *)&v47 + 1) + 8 * (void)v10), v5];

              id v12 = [(CacheDeleteAnalytics *)self dailyStats];
              v13 = [v12 objectForKeyedSubscript:v8];

              if (v13)
              {
                v14 = [(CacheDeleteAnalytics *)self dailyStats];
                v15 = [v14 objectForKeyedSubscript:v8];
                [v3 setObject:v15 forKeyedSubscript:v8];
              }
              NSErrorDomain v10 = (char *)v10 + 1;
              id v11 = v8;
            }
            while (v7 != v10);
            id v7 = [&off_100061528 countByEnumeratingWithState:&v47 objects:v57 count:16];
          }
          while (v7);
        }
        else
        {
          id v8 = 0;
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v16 = [&off_100061540 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v44;
          do
          {
            __int16 v19 = 0;
            id v20 = v8;
            do
            {
              if (*(void *)v44 != v18) {
                objc_enumerationMutation(&off_100061540);
              }
              id v8 = +[NSString stringWithFormat:@"%@%@", *(void *)(*((void *)&v43 + 1) + 8 * (void)v19), v5];

              v21 = [(CacheDeleteAnalytics *)self dailyStats];
              objc_super v22 = [v21 objectForKeyedSubscript:v8];

              if (v22)
              {
                v23 = [(CacheDeleteAnalytics *)self dailyStats];
                v24 = [v23 objectForKeyedSubscript:v8];
                [v3 setObject:v24 forKeyedSubscript:v8];
              }
              __int16 v19 = (char *)v19 + 1;
              id v20 = v8;
            }
            while (v17 != v19);
            id v17 = [&off_100061540 countByEnumeratingWithState:&v43 objects:v56 count:16];
          }
          while (v17);
        }
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v25 = [(CacheDeleteAnalytics *)self dailyStats];
        id v26 = [v25 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v40;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if ([v30 hasPrefix:@"lowDiskFunctionalFailure"])
              {
                v31 = [(CacheDeleteAnalytics *)self dailyStats];
                v32 = [v31 objectForKeyedSubscript:v30];

                if (v32)
                {
                  v33 = [(CacheDeleteAnalytics *)self dailyStats];
                  v34 = [v33 objectForKeyedSubscript:v30];
                  [v3 setObject:v34 forKeyedSubscript:v30];
                }
              }
            }
            id v27 = [v25 countByEnumeratingWithState:&v39 objects:v55 count:16];
          }
          while (v27);
        }

        uint64_t v4 = v38 + 1;
      }
      while ((id)(v38 + 1) != v37);
      id v37 = [&off_100061510 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v37);
  }
  return v3;
}

- (id)fetchStorageStats
{
  v3 = objc_opt_new();
  uint64_t v4 = [(CacheDeleteAnalytics *)self dailyPurgeableStats:1];
  [v3 addEntriesFromDictionary:v4];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v102 = [&off_100061558 countByEnumeratingWithState:&v104 objects:v108 count:16];
  if (v102)
  {
    uint64_t v101 = *(void *)v105;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v105 != v101) {
          objc_enumerationMutation(&off_100061558);
        }
        id v6 = 0;
        uint64_t v103 = v5;
        id v7 = *(void **)(*((void *)&v104 + 1) + 8 * v5);
        uint64_t v8 = 1;
        do
        {
          uint64_t v9 = [(CacheDeleteAnalytics *)self stringForUrgency:v8];
          id v10 = v7;
          id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgeReqs%s%s", [v10 UTF8String], v9);

          id v12 = [(CacheDeleteAnalytics *)self dailyStats];
          v13 = [v12 objectForKeyedSubscript:v11];

          if (v13)
          {
            v14 = [(CacheDeleteAnalytics *)self dailyStats];
            v15 = [v14 objectForKeyedSubscript:v11];
            [v3 setObject:v15 forKeyedSubscript:v11];
          }
          id v16 = v10;
          id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgeSuccess%s%s", [v16 UTF8String], v9);

          uint64_t v18 = [(CacheDeleteAnalytics *)self dailyStats];
          __int16 v19 = [v18 objectForKeyedSubscript:v17];

          if (v19)
          {
            id v20 = [(CacheDeleteAnalytics *)self dailyStats];
            v21 = [v20 objectForKeyedSubscript:v17];
            [v3 setObject:v21 forKeyedSubscript:v17];
          }
          id v22 = v16;
          v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyFSPurgeSuccess%s%s", [v22 UTF8String], v9);

          v24 = [(CacheDeleteAnalytics *)self dailyStats];
          v25 = [v24 objectForKeyedSubscript:v23];

          if (v25)
          {
            id v26 = [(CacheDeleteAnalytics *)self dailyStats];
            id v27 = [v26 objectForKeyedSubscript:v23];
            [v3 setObject:v27 forKeyedSubscript:v23];
          }
          id v28 = v22;
          v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgedBytes%s%s", [v28 UTF8String], v9);

          v30 = [(CacheDeleteAnalytics *)self dailyStats];
          v31 = [v30 objectForKeyedSubscript:v29];

          if (v31)
          {
            v32 = [(CacheDeleteAnalytics *)self dailyStats];
            v33 = [v32 objectForKeyedSubscript:v29];
            [v3 setObject:v33 forKeyedSubscript:v29];
          }
          id v34 = v28;
          id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgedReportedBytes%s%s", [v34 UTF8String], v9);

          v35 = [(CacheDeleteAnalytics *)self dailyStats];
          uint64_t v36 = [v35 objectForKeyedSubscript:v6];

          if (v36)
          {
            id v37 = [(CacheDeleteAnalytics *)self dailyStats];
            uint64_t v38 = [v37 objectForKeyedSubscript:v6];
            [v3 setObject:v38 forKeyedSubscript:v6];
          }
          uint64_t v8 = (v8 + 1);
        }
        while (v8 != 4);
        id v39 = v34;
        long long v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgeReqs%s%s", [v39 UTF8String], "Tot");

        long long v41 = [(CacheDeleteAnalytics *)self dailyStats];
        long long v42 = [v41 objectForKeyedSubscript:v40];

        if (v42)
        {
          long long v43 = [(CacheDeleteAnalytics *)self dailyStats];
          long long v44 = [v43 objectForKeyedSubscript:v40];
          [v3 setObject:v44 forKeyedSubscript:v40];
        }
        id v45 = v39;
        long long v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgeSuccess%s%s", [v45 UTF8String], "Tot");

        long long v47 = [(CacheDeleteAnalytics *)self dailyStats];
        long long v48 = [v47 objectForKeyedSubscript:v46];

        if (v48)
        {
          long long v49 = [(CacheDeleteAnalytics *)self dailyStats];
          long long v50 = [v49 objectForKeyedSubscript:v46];
          [v3 setObject:v50 forKeyedSubscript:v46];
        }
        id v51 = v45;
        long long v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyFSPurgeSuccess%s%s", [v51 UTF8String], "Tot");

        long long v53 = [(CacheDeleteAnalytics *)self dailyStats];
        long long v54 = [v53 objectForKeyedSubscript:v52];

        if (v54)
        {
          v55 = [(CacheDeleteAnalytics *)self dailyStats];
          v56 = [v55 objectForKeyedSubscript:v52];
          [v3 setObject:v56 forKeyedSubscript:v52];
        }
        id v57 = v51;
        v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgedBytes%s%s", [v57 UTF8String], "Tot");

        v59 = [(CacheDeleteAnalytics *)self dailyStats];
        v60 = [v59 objectForKeyedSubscript:v58];

        if (v60)
        {
          v61 = [(CacheDeleteAnalytics *)self dailyStats];
          v62 = [v61 objectForKeyedSubscript:v58];
          [v3 setObject:v62 forKeyedSubscript:v58];
        }
        v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyPurgedReportedBytes%s%s", [v57 UTF8String], "Tot");

        v64 = [(CacheDeleteAnalytics *)self dailyStats];
        v65 = [v64 objectForKeyedSubscript:v63];

        if (v65)
        {
          v66 = [(CacheDeleteAnalytics *)self dailyStats];
          v67 = [v66 objectForKeyedSubscript:v63];
          [v3 setObject:v67 forKeyedSubscript:v63];
        }
        uint64_t v5 = v103 + 1;
      }
      while ((id)(v103 + 1) != v102);
      id v102 = [&off_100061558 countByEnumeratingWithState:&v104 objects:v108 count:16];
    }
    while (v102);
  }
  v68 = [(CacheDeleteAnalytics *)self dailyStats];
  v69 = [v68 objectForKeyedSubscript:@"dailyActiveTimeS"];

  if (v69)
  {
    v70 = [(CacheDeleteAnalytics *)self dailyStats];
    v71 = [v70 objectForKeyedSubscript:@"dailyActiveTimeS"];
    [v3 setObject:v71 forKeyedSubscript:@"dailyActiveTimeS"];
  }
  v72 = [(CacheDeleteAnalytics *)self dailyStats];
  v73 = [v72 objectForKeyedSubscript:@"dailyActiveTimePurgingS"];

  if (v73)
  {
    v74 = [(CacheDeleteAnalytics *)self dailyStats];
    v75 = [v74 objectForKeyedSubscript:@"dailyActiveTimePurgingS"];
    [v3 setObject:v75 forKeyedSubscript:@"dailyActiveTimePurgingS"];
  }
  v76 = [(CacheDeleteAnalytics *)self dailyStats];
  v77 = [v76 objectForKeyedSubscript:@"dailyNumLowDiskPurges%s"];

  if (v77)
  {
    v78 = [(CacheDeleteAnalytics *)self dailyStats];
    v79 = [v78 objectForKeyedSubscript:@"dailyNumLowDiskPurges%s"];
    [v3 setObject:v79 forKeyedSubscript:@"dailyNumLowDiskPurges%s"];
  }
  v80 = [(CacheDeleteAnalytics *)self dailyStats];
  v81 = [v80 objectForKeyedSubscript:@"dailyNumLowDiskSuccess%s"];

  if (v81)
  {
    v82 = [(CacheDeleteAnalytics *)self dailyStats];
    v83 = [v82 objectForKeyedSubscript:@"dailyNumLowDiskSuccess%s"];
    [v3 setObject:v83 forKeyedSubscript:@"dailyNumLowDiskSuccess%s"];
  }
  v84 = [(CacheDeleteAnalytics *)self dailyStats];
  v85 = [v84 objectForKeyedSubscript:@"dailyNumVeryLowDiskPurges%s"];

  if (v85)
  {
    v86 = [(CacheDeleteAnalytics *)self dailyStats];
    v87 = [v86 objectForKeyedSubscript:@"dailyNumVeryLowDiskPurges%s"];
    [v3 setObject:v87 forKeyedSubscript:@"dailyNumVeryLowDiskPurges%s"];
  }
  v88 = [(CacheDeleteAnalytics *)self dailyStats];
  v89 = [v88 objectForKeyedSubscript:@"dailyNumVeryLowDiskSuccess%s"];

  if (v89)
  {
    v90 = [(CacheDeleteAnalytics *)self dailyStats];
    v91 = [v90 objectForKeyedSubscript:@"dailyNumVeryLowDiskSuccess%s"];
    [v3 setObject:v91 forKeyedSubscript:@"dailyNumVeryLowDiskSuccess%s"];
  }
  v92 = [(CacheDeleteAnalytics *)self dailyStats];
  v93 = [v92 objectForKeyedSubscript:@"dailyNumNearLowDiskPurges%s"];

  if (v93)
  {
    v94 = [(CacheDeleteAnalytics *)self dailyStats];
    v95 = [v94 objectForKeyedSubscript:@"dailyNumNearLowDiskPurges%s"];
    [v3 setObject:v95 forKeyedSubscript:@"dailyNumNearLowDiskPurges%s"];
  }
  v96 = [(CacheDeleteAnalytics *)self dailyStats];
  v97 = [v96 objectForKeyedSubscript:@"dailyNumNearLowDiskSuccess%s"];

  if (v97)
  {
    v98 = [(CacheDeleteAnalytics *)self dailyStats];
    v99 = [v98 objectForKeyedSubscript:@"dailyNumNearLowDiskSuccess%s"];
    [v3 setObject:v99 forKeyedSubscript:@"dailyNumNearLowDiskSuccess%s"];
  }
  return v3;
}

- (id)fetchTimingStats:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(CacheDeleteAnalytics *)self dailyPurgeableStats:0];
  id v35 = v5;
  [v5 addEntriesFromDictionary:v6];

  v30 = v4;
  id v7 = [v4 allKeys];
  uint64_t v8 = +[NSSet setWithArray:v7];
  id v9 = [v8 mutableCopy];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v9;
  id v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  id v10 = 0;
  if (v33)
  {
    uint64_t v32 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v11;
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v13 = [&off_100061570 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v37;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v37 != v15) {
                objc_enumerationMutation(&off_100061570);
              }
              id v17 = *(id *)(*((void *)&v36 + 1) + 8 * i);
              id v18 = [v17 UTF8String];
              id v19 = v12;
              id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purge_time_%s_%s", v18, [v19 UTF8String]);

              v21 = [(CacheDeleteAnalytics *)self dailyStats];
              id v22 = [v21 objectForKeyedSubscript:v20];

              if (v22)
              {
                v23 = [(CacheDeleteAnalytics *)self dailyStats];
                v24 = [v23 objectForKeyedSubscript:v20];
                [v35 setObject:v24 forKeyedSubscript:v20];
              }
              id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purgeable_time_%s_%s", [v17 UTF8String], objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));

              v25 = [(CacheDeleteAnalytics *)self dailyStats];
              id v26 = [v25 objectForKeyedSubscript:v10];

              if (v26)
              {
                id v27 = [(CacheDeleteAnalytics *)self dailyStats];
                id v28 = [v27 objectForKeyedSubscript:v10];
                [v35 setObject:v28 forKeyedSubscript:v10];
              }
            }
            id v14 = [&off_100061570 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v14);
        }
        uint64_t v11 = v34 + 1;
      }
      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v33);
  }

  return v35;
}

- (id)fetchApplicationUsageStats
{
  v3 = objc_opt_new();
  id v4 = [(CacheDeleteAnalytics *)self dailyPurgeableStats:0];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)fetchAdditionalStats
{
  v3 = objc_opt_new();
  id v4 = [(CacheDeleteAnalytics *)self dailyPurgeableStats:0];
  [v3 addEntriesFromDictionary:v4];

  uint64_t v5 = [(CacheDeleteAnalytics *)self systemUsageStats];
  if (v5) {
    [v3 addEntriesFromDictionary:v5];
  }
  id v6 = [(CacheDeleteAnalytics *)self cacheManagementUsageStats];
  if (v6) {
    [v3 addEntriesFromDictionary:v6];
  }

  return v3;
}

- (void)sendCAEvent:(id)a3 key:(id)a4 value:(id)a5 value2:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = +[NSMutableDictionary dictionaryWithCapacity:2];
  [v13 setObject:v12 forKey:@"name"];

  if (v10) {
    [v13 setObject:v10 forKey:@"value"];
  }
  if (v11) {
    [v13 setObject:v11 forKey:@"value_level4"];
  }
  uint64_t v15 = v13;
  id v14 = v13;
  AnalyticsSendEventLazy();
}

id __53__CacheDeleteAnalytics_sendCAEvent_key_value_value2___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendPurgeableAmountStats
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(CacheDeleteAnalytics *)self dailyStats];
  id v3 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v3)
  {
    id v4 = v3;
    id v33 = 0;
    uint64_t v5 = 0;
    CFStringRef v6 = @"dailyPurgeReqs";
    uint64_t v7 = *(void *)v37;
    CFStringRef v8 = @"dailyPurgeableAmount";
    do
    {
      id v9 = 0;
      id v31 = v4;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v9);
        if (([v10 containsString:v6] & 1) != 0
          || ([v10 containsString:@"dailyPurgedBytes"] & 1) != 0
          || [v10 containsString:@"dailyPurgedReportedBytes"])
        {
          id v11 = [(CacheDeleteAnalytics *)self dailyStats];
          id v12 = [v11 objectForKeyedSubscript:v10];
          [(CacheDeleteAnalytics *)self sendCAEvent:@"com.apple.cachedelete.purgeablestats" key:v10 value:v12 value2:0];
        }
        if ([v10 containsString:v8])
        {
          id v13 = [(CacheDeleteAnalytics *)self dailyStats];
          id v14 = [v13 objectForKeyedSubscript:v10];
          [v14 objectForKeyedSubscript:@"LEVEL3"];
          uint64_t v15 = v7;
          CFStringRef v16 = v8;
          v18 = CFStringRef v17 = v6;

          id v19 = [(CacheDeleteAnalytics *)self dailyStats];
          id v20 = [v19 objectForKeyedSubscript:v10];
          uint64_t v21 = [v20 objectForKeyedSubscript:@"LEVEL4"];

          [(CacheDeleteAnalytics *)self sendCAEvent:@"com.apple.cachedelete.purgeablestats" key:v10 value:v18 value2:v21];
          id v33 = (void *)v21;
          uint64_t v5 = (void *)v18;
          CFStringRef v6 = v17;
          CFStringRef v8 = v16;
          uint64_t v7 = v15;
          id v4 = v31;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v4 != v9);
      id v4 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v4);
  }
  else
  {
    id v33 = 0;
    uint64_t v5 = 0;
  }

  id v22 = [(CacheDeleteAnalytics *)self dailyStats];
  v23 = [v22 allKeys];
  unsigned int v24 = [v23 containsObject:@"dailyPurgeableAmountTotal"];

  if (v24)
  {
    v25 = +[NSNumber numberWithUnsignedLongLong:[(CacheDeleteAnalytics *)self nandSize]];
    [(CacheDeleteAnalytics *)self sendCAEvent:@"com.apple.cachedelete.purgeablestats" key:@"deviceNandSize" value:v25 value2:0];

    id v26 = getRootVolume();
    id v27 = +[CacheDeleteDaemonVolume volumeWithPath:v26];

    if (v27)
    {
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      [v27 containerTotalSize:&v34 andFreespace:&v35];
      id v28 = +[NSNumber numberWithUnsignedLongLong:v34];
      [(CacheDeleteAnalytics *)self sendCAEvent:@"com.apple.cachedelete.purgeablestats" key:@"dailyContainerSize" value:v28 value2:0];

      v29 = +[NSNumber numberWithUnsignedLongLong:v35];
      [(CacheDeleteAnalytics *)self sendCAEvent:@"com.apple.cachedelete.purgeablestats" key:@"dailyContainerFreespace" value:v29 value2:0];

      v30 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v27 freespace]);
      [(CacheDeleteAnalytics *)self sendCAEvent:@"com.apple.cachedelete.purgeablestats" key:@"dailyFreeBytesRoot" value:v30 value2:0];
    }
  }
}

- (void)sendAppCacheStats:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 containsString:@"cacheDir_outHardlinks"] & 1) != 0
          || [v9 containsString:@"cacheDir_size"])
        {
          id v10 = [v4 objectForKeyedSubscript:v9];
          [(CacheDeleteAnalytics *)self sendCAEvent:@"com.apple.cachedelete.purgeablestats" key:v9 value:v10 value2:0];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_addDailyStats:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteAnalytics *)self dailyStats];
  [v5 addEntriesFromDictionary:v4];
}

- (void)_postDailyStats:(id)a3
{
  id v10 = a3;
  id v4 = [(CacheDeleteAnalytics *)self dailyStats];
  [v4 removeObjectForKey:@"DateStarted"];

  [(CacheDeleteAnalytics *)self sendPurgeableAmountStats];
  if (+[CacheDeleteAnalytics isDataCollectionEnabled])
  {
    id v5 = [(CacheDeleteAnalytics *)self purgeStatReporter];
    [v5 sendAndResetStats];

    id v6 = [(CacheDeleteAnalytics *)self fetchStorageStats];
    uint64_t v7 = [(CacheDeleteAnalytics *)self fetchTimingStats:v10];
    CFStringRef v8 = [(CacheDeleteAnalytics *)self fetchAdditionalStats];
    id v9 = [(CacheDeleteAnalytics *)self fetchLowDiskStats];
    [v6 addEntriesFromDictionary:v9];
    [v7 addEntriesFromDictionary:v9];
    [v8 addEntriesFromDictionary:v9];
    [(CacheDeleteAnalytics *)self anonymizeAndFlush:v6 name:@"cacheDeleteDailyStorageReport"];
    [(CacheDeleteAnalytics *)self anonymizeAndFlush:v7 name:@"cacheDeleteDailyTimingReport"];
    [(CacheDeleteAnalytics *)self anonymizeAndFlush:v8 name:@"cacheDeleteDailyAdditionalReport"];
  }
  [(CacheDeleteAnalytics *)self clear];
}

- (void)anonymizeAndFlush:(id)a3 name:(id)a4
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __47__CacheDeleteAnalytics_anonymizeAndFlush_name___block_invoke;
  void v9[3] = &unk_10005D518;
  v9[4] = self;
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v10 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = [(id)objc_opt_class() currentSystemInfo];
  [v6 addEntriesFromDictionary:v7];

  id v8 = v6;
  AnalyticsSendEventLazy();
}

void __47__CacheDeleteAnalytics_anonymizeAndFlush_name___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [*(id *)(a1 + 32) roundNumber:v6 toSignificantDigits:2];
    [v7 doubleValue];
    [*(id *)(a1 + 40) setObject:v7 forKey:v5];
  }
  else
  {
    uint64_t v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not sending %@ to CA as it's not an NSNumber", (uint8_t *)&v8, 0xCu);
    }
  }
}

id __47__CacheDeleteAnalytics_anonymizeAndFlush_name___block_invoke_213(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_reportPurgeTimingInfo:(id)a3
{
  id v9 = a3;
  -[CacheDeleteAnalytics secondsFrom:to:](self, "secondsFrom:to:", [v9 monotonicBegin], objc_msgSend(v9, "monotonicEnd"));
  id v4 = -[CacheDeleteAnalytics stringForTime:](self, "stringForTime:");
  id v5 = +[NSString stringWithUTF8String:v4];
  unsigned __int8 v6 = [v5 isEqualToString:@"OK"];

  if ((v6 & 1) == 0)
  {
    id v7 = [v9 serviceName];
    int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purge_time_%s_%s", v4, [v7 UTF8String]);

    [(CacheDeleteAnalytics *)self incrementDailyValueForKey:v8];
  }
}

- (void)reportPurge:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __36__CacheDeleteAnalytics_reportPurge___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __36__CacheDeleteAnalytics_reportPurge___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPurgeOperationResult:*(void *)(a1 + 40)];
}

- (void)reportPurgeable:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __40__CacheDeleteAnalytics_reportPurgeable___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __40__CacheDeleteAnalytics_reportPurgeable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPurgeableOperationResult:*(void *)(a1 + 40)];
}

- (void)reportPeriodic:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteAnalytics *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __39__CacheDeleteAnalytics_reportPeriodic___block_invoke;
  v7[3] = &unk_10005CAE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

id __39__CacheDeleteAnalytics_reportPeriodic___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPeriodicOperationResult:*(void *)(a1 + 40)];
}

- (double)round:(double)a3 toSignificantDigits:(int)a4
{
  double result = 0.0;
  if (a3 != 0.0)
  {
    double v7 = log10(fabs(a3));
    double v8 = __exp10((double)a4 - ceil(v7));
    return round(v8 * a3) / v8;
  }
  return result;
}

- (id)roundNumber:(id)a3 toSignificantDigits:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [a3 doubleValue];
  -[CacheDeleteAnalytics round:toSignificantDigits:](self, "round:toSignificantDigits:", v4);
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

void __42__CacheDeleteAnalytics_machTimeToSeconds___block_invoke(id a1)
{
}

- (void)incrementDailyValueForKey:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(CacheDeleteAnalytics *)self dailyStats];
  id v5 = [v4 objectForKeyedSubscript:v8];

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v5 = &off_100061660;
  }
  id v6 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v5 longValue] + 1);

  double v7 = [(CacheDeleteAnalytics *)self dailyStats];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (void)addDailyValueForKey:(id)a3 value:(double)a4
{
  id v12 = a3;
  if (a4 < 0.0)
  {
    id v6 = +[NSString stringWithFormat:@"addDailyValueForKey: Negative value (%f) for total measured bytes in: \"%@\"", *(void *)&a4, v12];
    CDSimulateCrash();
  }
  double v7 = [(CacheDeleteAnalytics *)self dailyStats];
  id v8 = [v7 objectForKeyedSubscript:v12];

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v8 = &off_100061708;
  }
  [v8 doubleValue];
  id v10 = +[NSNumber numberWithDouble:v9 + a4];

  long long v11 = [(CacheDeleteAnalytics *)self dailyStats];
  [v11 setObject:v10 forKeyedSubscript:v12];
}

- (const)stringForUrgency:(int)a3
{
  if (a3 > 4) {
    return "???";
  }
  else {
    return (&off_10005D648)[a3];
  }
}

- (BOOL)isRootVolume:(id)a3
{
  id v3 = a3;
  uint64_t v4 = getRootVolume();
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)dailyPurgeableStats:(BOOL)a3
{
  BOOL v81 = a3;
  uint64_t v4 = getRootVolume();
  unsigned __int8 v5 = +[CacheDeleteDaemonVolume volumeWithPath:v4];

  id v6 = (char *)[v5 freespace];
  id v7 = [v5 size];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  unint64_t v75 = (unint64_t)v7;
  double v9 = +[NSNumber numberWithUnsignedLongLong:v7];
  [v8 setObject:v9 forKeyedSubscript:@"dailyTotalBytesRoot"];

  v76 = v6;
  id v10 = +[NSNumber numberWithUnsignedLongLong:v6];
  [v8 setObject:v10 forKeyedSubscript:@"dailyFreeBytesRoot"];

  v86 = self;
  long long v11 = +[NSNumber numberWithUnsignedLongLong:[(CacheDeleteAnalytics *)self nandSize]];
  [v8 setObject:v11 forKeyedSubscript:@"deviceNandSize"];

  unint64_t v12 = 0;
  uint64_t v13 = 1;
  long long v14 = v5;
  v77 = v5;
  v85 = v8;
  do
  {
    uint64_t v15 = [(CacheDeleteAnalytics *)v86 purgeableResultCache];
    CFStringRef v16 = [v15 recentInfoForVolume:v14 atUrgency:v13];

    CFStringRef v17 = v16;
    uint64_t v18 = [v16 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
    v83 = +[NSString stringWithFormat:@"dailyPurgeableBytes%s", [(CacheDeleteAnalytics *)v86 stringForUrgency:v13]];
    if ((unint64_t)[v18 unsignedLongLongValue] > v12) {
      unint64_t v12 = (unint64_t)[v18 unsignedLongLongValue];
    }
    if (v81)
    {
      unint64_t v80 = v12;
      v78 = v18;
      [v8 setObject:v18 forKeyedSubscript:v83];
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      v79 = v17;
      id v19 = v17;
      id v20 = [v19 countByEnumeratingWithState:&v100 objects:v107 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v101;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v101 != v22) {
              objc_enumerationMutation(v19);
            }
            unsigned int v24 = *(void **)(*((void *)&v100 + 1) + 8 * i);
            if (([v24 isEqualToString:@"CACHE_DELETE_VOLUME"] & 1) == 0
              && ([v24 isEqualToString:@"CACHE_DELETE_TOTAL_AVAILABLE"] & 1) == 0)
            {
              v25 = [(CacheDeleteAnalytics *)v86 stringForUrgency:v13];
              id v26 = v24;
              id v8 = v85;
              id v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailyItemizedPurgeableBytes%s_%s", v25, [v26 UTF8String]);
              id v28 = [v19 objectForKeyedSubscript:v26];
              [v85 setObject:v28 forKeyedSubscript:v27];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v100 objects:v107 count:16];
        }
        while (v21);
      }

      long long v14 = v77;
      uint64_t v18 = v78;
      CFStringRef v17 = v79;
      unint64_t v12 = v80;
    }

    uint64_t v13 = (v13 + 1);
  }
  while (v13 != 4);
  v29 = +[NSNumber numberWithUnsignedLongLong:v12];
  [v8 setObject:v29 forKeyedSubscript:@"dailyPurgeableBytesTot"];

  v30 = +[NSNumber numberWithUnsignedLongLong:&v6[v12]];
  [v8 setObject:v30 forKeyedSubscript:@"dailyEffectiveFreeBytesRoot"];

  id v31 = +[NSNumber numberWithDouble:(double)v12 / (double)v75];
  [v8 setObject:v31 forKeyedSubscript:@"dailyPurgeableOverTotalRatioRoot"];

  uint64_t v32 = +[NSNumber numberWithDouble:(double)v12 / (double)(v75 - (unint64_t)v76)];
  [v8 setObject:v32 forKeyedSubscript:@"dailyPurgeableOverUsedRatioRoot"];

  id v33 = +[NSNumber numberWithDouble:(double)v12 / (double)(unint64_t)&v76[v12]];
  [v8 setObject:v33 forKeyedSubscript:@"dailyPurgeableOverEffectiveFreeRatioRoot"];

  uint64_t v34 = lowSpaceVolumes();
  uint64_t v35 = [v34 objectForKeyedSubscript:@"CD_NEAR_LOW_DISK_EVENT"];
  long long v36 = +[NSMutableArray array];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v37 = v35;
  id v38 = [v37 countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v97;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v97 != v40) {
          objc_enumerationMutation(v37);
        }
        long long v42 = *(void **)(*((void *)&v96 + 1) + 8 * (void)j);
        long long v43 = [v42 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];

        if (v43)
        {
          long long v44 = [v42 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
          [v36 addObject:v44];
        }
      }
      id v39 = [v37 countByEnumeratingWithState:&v96 objects:v106 count:16];
    }
    while (v39);
  }
  v87 = v36;
  v82 = v37;

  id v45 = [v34 objectForKeyedSubscript:@"CD_LOWDISK_EVENT"];
  long long v46 = +[NSMutableArray array];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v47 = v45;
  id v48 = [v47 countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v93;
    do
    {
      for (k = 0; k != v49; k = (char *)k + 1)
      {
        if (*(void *)v93 != v50) {
          objc_enumerationMutation(v47);
        }
        long long v52 = *(void **)(*((void *)&v92 + 1) + 8 * (void)k);
        long long v53 = [v52 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];

        if (v53)
        {
          long long v54 = [v52 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
          [v46 addObject:v54];
        }
      }
      id v49 = [v47 countByEnumeratingWithState:&v92 objects:v105 count:16];
    }
    while (v49);
  }

  v84 = v34;
  v55 = [v34 objectForKeyedSubscript:@"CD_VERYLOWDISK_EVENT"];
  v56 = +[NSMutableArray array];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v57 = v55;
  id v58 = [v57 countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v89;
    do
    {
      for (m = 0; m != v59; m = (char *)m + 1)
      {
        if (*(void *)v89 != v60) {
          objc_enumerationMutation(v57);
        }
        v62 = *(void **)(*((void *)&v88 + 1) + 8 * (void)m);
        v63 = [v62 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];

        if (v63)
        {
          v64 = [v62 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
          [v56 addObject:v64];
        }
      }
      id v59 = [v57 countByEnumeratingWithState:&v88 objects:v104 count:16];
    }
    while (v59);
  }

  v65 = [v77 mountPoint];
  unsigned int v66 = [v87 containsObject:v65];

  if (v66) {
    v67 = &off_100061718;
  }
  else {
    v67 = &off_100061708;
  }
  [v85 setObject:v67 forKeyedSubscript:@"dailyIsNearLowDiskRoot"];
  v68 = [v77 mountPoint];
  unsigned int v69 = [v46 containsObject:v68];

  if (v69) {
    v70 = &off_100061718;
  }
  else {
    v70 = &off_100061708;
  }
  [v85 setObject:v70 forKeyedSubscript:@"dailyIsLowDiskRoot"];
  v71 = [v77 mountPoint];
  unsigned int v72 = [v56 containsObject:v71];

  if (v72) {
    v73 = &off_100061718;
  }
  else {
    v73 = &off_100061708;
  }
  [v85 setObject:v73 forKeyedSubscript:@"dailyIsVeryLowDiskRoot"];

  return v85;
}

- (id)systemUsageStats
{
  v2 = [(CacheDeleteAnalytics *)self serviceProvider];
  id v28 = [v2 serviceWithID:@"com.apple.mobile.cache_delete_daily"];

  if (v28)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    dispatch_time_t v4 = dispatch_time(0, 120000000000);
    *(void *)long long v44 = 0;
    id v45 = v44;
    uint64_t v46 = 0x3032000000;
    id v47 = __Block_byref_object_copy__0;
    id v48 = __Block_byref_object_dispose__0;
    id v49 = 0;
    unsigned __int8 v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting analytic data from daily service", buf, 2u);
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = __40__CacheDeleteAnalytics_systemUsageStats__block_invoke;
    v41[3] = &unk_10005D588;
    long long v43 = v44;
    id v6 = v3;
    long long v42 = v6;
    [v28 serviceCallback:&off_100061328 replyBlock:v41];
    oslog = v6;
    if (dispatch_semaphore_wait(v6, v4))
    {
      id v31 = &off_100061350;
LABEL_17:

      _Block_object_dispose(v44, 8);
      goto LABEL_18;
    }
    id v7 = (void *)*((void *)v45 + 5);
    if (!v7)
    {
      id v31 = 0;
      goto LABEL_17;
    }
    id v8 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
    if (v8)
    {
    }
    else
    {
      id v10 = [*((id *)v45 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"];
      BOOL v11 = v10 == 0;

      if (!v11)
      {
        id v31 = (_UNKNOWN **)objc_alloc_init((Class)NSMutableDictionary);
        [*((id *)v45 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v27 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v27)
        {
          uint64_t v25 = *(void *)v38;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v38 != v25) {
                objc_enumerationMutation(obj);
              }
              unint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              uint64_t v13 = -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v12, v25, oslog);
              id v14 = [v13 countByEnumeratingWithState:&v33 objects:v52 count:16];
              if (v14)
              {
                uint64_t v15 = *(void *)v34;
                id v30 = v13;
                do
                {
                  for (j = 0; j != v14; j = (char *)j + 1)
                  {
                    if (*(void *)v34 != v15) {
                      objc_enumerationMutation(v30);
                    }
                    CFStringRef v17 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
                    uint64_t v18 = [obj objectForKeyedSubscript:v12];
                    id v19 = [v18 objectForKeyedSubscript:v17];
                    id v20 = [v12 capitalizedString];
                    id v21 = [v20 stringByAppendingString:@"_"];
                    uint64_t v22 = [v17 capitalizedString];
                    v23 = [v21 stringByAppendingString:v22];
                    [v31 setObject:v19 forKey:v23];
                  }
                  uint64_t v13 = v30;
                  id v14 = [v30 countByEnumeratingWithState:&v33 objects:v52 count:16];
                }
                while (v14);
              }
            }
            id v27 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
          }
          while (v27);
        }

        goto LABEL_15;
      }
    }
    id obj = CDGetLogHandle();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      unsigned int v24 = [*((id *)v45 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
      *(_DWORD *)buf = 138412290;
      id v51 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "Failed to get system usage stats! %@", buf, 0xCu);
    }
    id v31 = 0;
LABEL_15:

    goto LABEL_17;
  }
  oslog = CDGetLogHandle();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v44 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Cannot find cache_delete_daily service!", v44, 2u);
  }
  id v31 = 0;
LABEL_18:

  return v31;
}

void __40__CacheDeleteAnalytics_systemUsageStats__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received response from daily service analytics data request", v8, 2u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)cacheManagementUsageStats
{
  v2 = [(CacheDeleteAnalytics *)self serviceProvider];
  id v3 = [v2 serviceWithID:@"com.apple.mobile.cache_delete_managed_assets"];

  if (v3)
  {
    v38[0] = @"CACHE_DELETE_OPERATIONS";
    CFStringRef v36 = @"CACHE_DELETE_ANALYTICS_REPORT";
    CFStringRef v34 = @"CACHE_DELETE_VOLUME";
    dispatch_time_t v4 = getRootVolume();
    long long v35 = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    long long v37 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v38[1] = @"CACHE_DELETE_QOS";
    v39[0] = v6;
    v39[1] = &off_100061678;
    id v7 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    dispatch_time_t v9 = dispatch_time(0, 120000000000);
    *(void *)id v26 = 0;
    id v27 = v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__0;
    id v30 = __Block_byref_object_dispose__0;
    id v31 = 0;
    id v10 = CDGetLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting analytic data from cache management service", buf, 2u);
    }

    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    uint64_t v22 = __49__CacheDeleteAnalytics_cacheManagementUsageStats__block_invoke;
    v23 = &unk_10005D588;
    uint64_t v25 = v26;
    BOOL v11 = v8;
    unsigned int v24 = v11;
    [v3 serviceCallback:v7 replyBlock:&v20];
    if (dispatch_semaphore_wait(v11, v9))
    {
      unint64_t v12 = &off_100061378;
    }
    else
    {
      uint64_t v13 = (void *)*((void *)v27 + 5);
      if (v13)
      {
        id v14 = objc_msgSend(v13, "objectForKeyedSubscript:", @"CACHE_DELETE_ERROR", v20, v21, v22, v23);
        if (v14)
        {
        }
        else
        {
          CFStringRef v16 = [*((id *)v27 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"];
          BOOL v17 = v16 == 0;

          if (!v17)
          {
            uint64_t v18 = CDGetLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = [*((id *)v27 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"];
              *(_DWORD *)buf = 138412290;
              long long v33 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received %@", buf, 0xCu);
            }
            unint64_t v12 = [*((id *)v27 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"];
            goto LABEL_13;
          }
        }
      }
      unint64_t v12 = 0;
    }
LABEL_13:

    _Block_object_dispose(v26, 8);
    goto LABEL_14;
  }
  id v7 = CDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v26 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Cannot find cache_delete_app_container_caches service!", v26, 2u);
  }
  unint64_t v12 = 0;
LABEL_14:

  return v12;
}

void __49__CacheDeleteAnalytics_cacheManagementUsageStats__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received response from cache management service analytics data request", v8, 2u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)getLowDiskLevelFromPurgeResult:(id)a3
{
  id v3 = a3;
  if ([v3 isVeryLowDisk])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isLowDisk])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = (uint64_t)[v3 isNearLowDisk];
  }
  uint64_t v5 = +[NSNumber numberWithInt:v4];

  return v5;
}

- (void)processPurgeOperationResult:(id)a3
{
  id v4 = a3;
  long long v97 = self;
  uint64_t v5 = [(CacheDeleteAnalytics *)self purgeStatReporter];
  id v96 = [v5 generationNumber];

  id v82 = [v4 monotonicEnd];
  id v81 = [v4 monotonicBegin];
  double v6 = gTimebaseConversion;
  id v7 = [v4 monotonicEnd];
  id v8 = [v4 monotonicBegin];
  double v9 = gTimebaseConversion;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v10 = [v4 volumeNames];
  id v11 = [v10 countByEnumeratingWithState:&v114 objects:v125 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v115;
    long long v94 = "Root";
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v115 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([(CacheDeleteAnalytics *)v97 isRootVolume:*(void *)(*((void *)&v114 + 1) + 8 * i)])
        {
          char v80 = 1;
          goto LABEL_12;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v114 objects:v125 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    char v80 = 0;
    long long v94 = "Ext";
  }
  else
  {
    char v80 = 0;
    long long v94 = "Ext";
  }
LABEL_12:

  id v14 = -[CacheDeleteAnalytics stringForUrgency:](v97, "stringForUrgency:", [v4 level]);
  uint64_t v15 = +[NSString stringWithFormat:@"dailyPurgeReqs%s%s", v94, v14];
  [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v15];
  if ((int)[v4 level] > 3)
  {
    long long v92 = v15;
  }
  else
  {
    long long v92 = +[NSString stringWithFormat:@"dailyPurgeReqs%s%s", v94, "Tot"];

    [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v92];
  }
  if ([v4 success])
  {
    CFStringRef v16 = +[NSString stringWithFormat:@"dailyPurgeSuccess%s%s", v94, v14];

    [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v16];
    if ((int)[v4 level] > 3)
    {
      long long v92 = v16;
    }
    else
    {
      long long v92 = +[NSString stringWithFormat:@"dailyPurgeSuccess%s%s", v94, "Tot"];

      [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v92];
    }
  }
  if ([v4 fsPurgeSuccess])
  {
    BOOL v17 = +[NSString stringWithFormat:@"dailyFSPurgeSuccess%s%s", v94, v14];

    [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v17];
    if ((int)[v4 level] > 3)
    {
      long long v92 = v17;
    }
    else
    {
      long long v92 = +[NSString stringWithFormat:@"dailyFSPurgeSuccess%s%s", v94, "Tot"];

      [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v92];
    }
  }
  uint64_t v18 = +[NSString stringWithFormat:@"dailyPurgedBytes%s%s", v94, v14];
  id v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalMeasuredBytes]);
  [v19 doubleValue];
  -[CacheDeleteAnalytics addDailyValueForKey:value:](v97, "addDailyValueForKey:value:", v18);

  if ((int)[v4 level] > 3)
  {
    v85 = v18;
  }
  else
  {
    v85 = +[NSString stringWithFormat:@"dailyPurgedBytes%s%s", v94, "Tot"];

    id v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalMeasuredBytes]);
    [v20 doubleValue];
    -[CacheDeleteAnalytics addDailyValueForKey:value:](v97, "addDailyValueForKey:value:", v85);
  }
  uint64_t v21 = +[NSString stringWithFormat:@"dailyPurgedReportedBytes%s%s", v94, v14];
  uint64_t v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalReportedBytes]);
  [v22 doubleValue];
  -[CacheDeleteAnalytics addDailyValueForKey:value:](v97, "addDailyValueForKey:value:", v21);

  if ((int)[v4 level] > 3)
  {
    v84 = v21;
  }
  else
  {
    v84 = +[NSString stringWithFormat:@"dailyPurgedReportedBytes%s%s", v94, "Tot"];

    v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalReportedBytes]);
    [v23 doubleValue];
    -[CacheDeleteAnalytics addDailyValueForKey:value:](v97, "addDailyValueForKey:value:", v84);
  }
  double v24 = v9 * ((double)(unint64_t)v7 - (double)(unint64_t)v8) / 1000000000.0;
  [(CacheDeleteAnalytics *)v97 addDailyValueForKey:@"dailyActiveTimeS" value:v24];
  [(CacheDeleteAnalytics *)v97 addDailyValueForKey:@"dailyActiveTimePurgingS" value:v24];
  v123[0] = @"purgeRequestedRytes";
  uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 requestedBytes]);
  v124[0] = v25;
  v123[1] = @"purgeReportedBytes";
  id v26 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalReportedBytes]);
  v124[1] = v26;
  v123[2] = @"purgeMeasuredBytes";
  id v27 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalMeasuredBytes]);
  v124[2] = v27;
  v123[3] = @"purgeSuccess";
  unsigned int v28 = [v4 success];
  double v29 = 0.0;
  if (v28) {
    double v29 = 1.0;
  }
  id v30 = +[NSNumber numberWithDouble:v29];
  v124[3] = v30;
  v123[4] = @"purgeTime";
  id v31 = +[NSNumber numberWithDouble:v24];
  v124[4] = v31;
  uint64_t v32 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:5];
  id v93 = [v32 mutableCopy];

  if (([v4 success] & 1) == 0)
  {
    long long v33 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unsigned char *)[v4 requestedBytes] - (unsigned char *)objc_msgSend(v4, "totalMeasuredBytes"));
    [v93 setObject:v33 forKey:@"purgeDefecitBytes"];
  }
  v121[0] = @"purgeClientProcName";
  long long v91 = [v4 clientProcName];
  v122[0] = v91;
  v121[1] = @"purgeRequestedRytes";
  long long v90 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 requestedBytes]);
  v122[1] = v90;
  v121[2] = @"purgeInitialFreespace";
  long long v89 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 beginFreeSpace]);
  v122[2] = v89;
  v121[3] = @"purgeEndFreespace";
  long long v88 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 endFreeSpace]);
  v122[3] = v88;
  v121[4] = @"purgeMeasuredBytes";
  CFStringRef v34 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalMeasuredBytes]);
  v122[4] = v34;
  v121[5] = @"purgeReportedBytes";
  v87 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 totalReportedBytes]);
  v122[5] = v87;
  v121[6] = @"purgeSuccess";
  unsigned int v35 = [v4 success];
  double v36 = 0.0;
  if (v35) {
    double v36 = 1.0;
  }
  v86 = +[NSNumber numberWithDouble:v36];
  v122[6] = v86;
  v121[7] = @"purgeLowDiskLevel";
  long long v37 = +[CacheDeleteAnalytics getLowDiskLevelFromPurgeResult:v4];
  v122[7] = v37;
  v121[8] = @"purgeContainerSize";
  long long v38 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 containerSize]);
  v122[8] = v38;
  v121[9] = @"purgeContainerInitialFreespace";
  long long v39 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 containerInitialFreespace]);
  v122[9] = v39;
  v121[10] = @"purgeTime";
  long long v40 = +[NSNumber numberWithDouble:v6 * ((double)(unint64_t)v82 - (double)(unint64_t)v81) / 1000000.0];
  v122[10] = v40;
  v121[11] = @"purgeAttempt";
  long long v41 = +[NSNumber numberWithUnsignedLongLong:v96];
  v122[11] = v41;
  long long v42 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:12];
  id v83 = [v42 mutableCopy];

  if ([v4 isLowDisk])
  {
    unsigned int v43 = [v4 success];
    double v44 = 0.0;
    if (v43) {
      double v44 = 1.0;
    }
    id v45 = +[NSNumber numberWithDouble:v44];
    [v93 setObject:v45 forKey:@"lowdiskSuccess"];

    uint64_t v46 = +[NSNumber numberWithDouble:v24];
    [v93 setObject:v46 forKey:@"lowdiskTimeS"];

    if (qword_10006A808)
    {
      -[CacheDeleteAnalytics secondsFrom:to:](v97, "secondsFrom:to:", qword_10006A808, [v4 monotonicBegin]);
      id v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v93 setObject:v47 forKey:@"lowdiskPeriodS"];
    }
    qword_10006A808 = (uint64_t)[v4 monotonicBegin];
    id v48 = +[NSString stringWithFormat:@"dailyNumLowDiskPurges%s", v94];
    [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v48];

    if ([v4 success])
    {
      id v49 = +[NSString stringWithFormat:@"dailyNumLowDiskSuccess%s", v94];
      [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v49];
    }
  }
  if ([v4 isVeryLowDisk])
  {
    unsigned int v50 = [v4 success];
    double v51 = 0.0;
    if (v50) {
      double v51 = 1.0;
    }
    long long v52 = +[NSNumber numberWithDouble:v51];
    [v93 setObject:v52 forKey:@"verylowdiskSuccess"];

    long long v53 = +[NSNumber numberWithDouble:v24];
    [v93 setObject:v53 forKey:@"verylowdiskTimeS"];

    if (qword_10006A810)
    {
      -[CacheDeleteAnalytics secondsFrom:to:](v97, "secondsFrom:to:", qword_10006A810, [v4 monotonicBegin]);
      long long v54 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v93 setObject:v54 forKey:@"verylowdiskPeriodS"];
    }
    qword_10006A810 = (uint64_t)[v4 monotonicBegin];
    v55 = +[NSString stringWithFormat:@"dailyNumVeryLowDiskPurges%s", v94];
    [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v55];

    if ([v4 success])
    {
      v56 = +[NSString stringWithFormat:@"dailyNumVeryLowDiskSuccess%s", v94];
      [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v56];
    }
  }
  if ([v4 isNearLowDisk])
  {
    unsigned int v57 = [v4 success];
    double v58 = 0.0;
    if (v57) {
      double v58 = 1.0;
    }
    id v59 = +[NSNumber numberWithDouble:v58];
    [v93 setObject:v59 forKey:@"nearlowdisk_success"];

    uint64_t v60 = +[NSNumber numberWithDouble:v24];
    [v93 setObject:v60 forKey:@"nearlowdiskTimeS"];

    if (qword_10006A818)
    {
      -[CacheDeleteAnalytics secondsFrom:to:](v97, "secondsFrom:to:", qword_10006A818, [v4 monotonicBegin]);
      v61 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v93 setObject:v61 forKey:@"nearlowdiskPeriodS"];
    }
    qword_10006A818 = (uint64_t)[v4 monotonicBegin];
    v62 = +[NSString stringWithFormat:@"dailyNumNearLowDiskPurges%s", v94];
    [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v62];

    if ([v4 success])
    {
      v63 = +[NSString stringWithFormat:@"dailyNumNearLowDiskSuccess%s", v94];
      [(CacheDeleteAnalytics *)v97 incrementDailyValueForKey:v63];
    }
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__0;
  v112 = __Block_byref_object_dispose__0;
  id v113 = 0;
  v64 = [v4 results];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = __52__CacheDeleteAnalytics_processPurgeOperationResult___block_invoke;
  v102[3] = &unk_10005D5B0;
  v102[4] = v97;
  char v107 = v80;
  id v95 = v93;
  id v103 = v95;
  long long v105 = &v108;
  id v65 = v4;
  id v104 = v65;
  id v106 = v96;
  [v64 enumerateObjectsUsingBlock:v102];

  [(CacheDeleteAnalytics *)v97 postStatsDictionary:v95 summarize:1];
  if (+[CacheDeleteAnalytics isDataCollectionEnabled])
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    unsigned int v66 = [v65 timedOutServices];
    id v67 = [v66 countByEnumeratingWithState:&v98 objects:v120 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v99;
      do
      {
        for (j = 0; j != v67; j = (char *)j + 1)
        {
          if (*(void *)v99 != v68) {
            objc_enumerationMutation(v66);
          }
          v70 = *(void **)(*((void *)&v98 + 1) + 8 * (void)j);
          v118[0] = @"purgeClientProcName";
          v71 = [v65 clientProcName];
          v119[0] = v71;
          v119[1] = &off_100061660;
          v118[1] = @"purgeReportedBytes";
          v118[2] = @"purgeTime";
          unsigned int v72 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 1000 * (void)[v65 timeoutTime]);
          v119[2] = v72;
          v118[3] = @"purgeServiceName";
          v73 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v70 UTF8String]);
          v119[3] = v73;
          v118[4] = @"purgeAttempt";
          v74 = +[NSNumber numberWithUnsignedLongLong:v96];
          v119[4] = v74;
          uint64_t v75 = +[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:5];
          v76 = (void *)v109[5];
          v109[5] = v75;

          v77 = [(CacheDeleteAnalytics *)v97 purgeStatReporter];
          [v77 appendAndSaveStats:v109[5]];
        }
        id v67 = [v66 countByEnumeratingWithState:&v98 objects:v120 count:16];
      }
      while (v67);
    }

    v78 = [(CacheDeleteAnalytics *)v97 purgeStatReporter];
    [v78 appendAndSaveStats:v83];
  }
  v79 = [(CacheDeleteAnalytics *)v97 powerLogger];
  [v79 flush];

  _Block_object_dispose(&v108, 8);
}

void __52__CacheDeleteAnalytics_processPurgeOperationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (double)(unint64_t)[v3 monotonicEnd];
  id v5 = [v3 monotonicBegin];
  double v6 = gTimebaseConversion * (v4 - (double)(unint64_t)v5) / 1000000.0;
  double v7 = v6 / 1000.0;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v3, "urgency"));
  id v9 = [v3 serviceName];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purge_time_%s_%s", v8, [v9 UTF8String]);

  id v11 = +[NSNumber numberWithDouble:v6 / 1000.0];
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];

  id v12 = [v3 serviceName];
  uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purgeRequestedBytes%s%s", v8, [v12 UTF8String]);

  id v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 requestedBytes]);
  long long v38 = (void *)v13;
  [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v13];

  id v15 = [v3 serviceName];
  CFStringRef v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purgeReportedBytes%s%s", v8, [v15 UTF8String]);

  BOOL v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 reportedBytes]);
  [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v16];

  id v18 = [v3 serviceName];
  id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purgePercentReported%s%s", v8, [v18 UTF8String]);

  id v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round((double)(unint64_t)[v3 reportedBytes]/ (double)(unint64_t)objc_msgSend(v3, "requestedBytes")* 100.0));
  [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:v19];

  if (*(unsigned char *)(a1 + 72) && ([v3 reportedBytes] || v7 > 1.0))
  {
    v39[0] = @"purgeClientProcName";
    double v36 = [*(id *)(a1 + 48) clientProcName];
    v40[0] = v36;
    v39[1] = @"purgeReportedBytes";
    unsigned int v35 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 reportedBytes]);
    v40[1] = v35;
    void v39[2] = @"purgeLevel";
    uint64_t v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 urgency]);
    v40[2] = v21;
    v39[3] = @"purgeTime";
    +[NSNumber numberWithDouble:v6];
    uint64_t v22 = v37 = v10;
    v40[3] = v22;
    v39[4] = @"purgeServiceName";
    id v23 = [v3 serviceName];
    double v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v23 UTF8String]);
    v40[4] = v24;
    v39[5] = @"purgeAttempt";
    uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
    v40[5] = v25;
    uint64_t v26 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:6];
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    unsigned int v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    id v10 = v37;
    if (+[CacheDeleteAnalytics isDataCollectionEnabled])
    {
      double v29 = [*(id *)(a1 + 32) purgeStatReporter];
      [v29 appendAndSaveStats:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "machTimeToSeconds:", objc_msgSend(v3, "monotonicBegin"));
  double v31 = v30;
  uint64_t v32 = [*(id *)(a1 + 32) powerLogger];
  id v33 = [v3 urgency];
  CFStringRef v34 = [v3 serviceName];
  objc_msgSend(v32, "logCacheDuetEvent:urgencyLevel:serviceName:startFromUptime:duration:requestedBytes:purgedBytes:", 1, v33, v34, objc_msgSend(v3, "requestedBytes"), objc_msgSend(v3, "reportedBytes"), v31, v7);
}

- (void)processPurgeableOperationResult:(id)a3
{
  id v4 = a3;
  [(CacheDeleteAnalytics *)self incrementDailyValueForKey:@"dailyPurgeableReqs"];
  -[CacheDeleteAnalytics secondsFrom:to:](self, "secondsFrom:to:", [v4 monotonicBegin], objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  -[CacheDeleteAnalytics addDailyValueForKey:value:](self, "addDailyValueForKey:value:", @"dailyActiveTimePurgeableS");
  [(CacheDeleteAnalytics *)self addDailyValueForKey:@"dailyActiveTimeS" value:v6];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [v4 results];

  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = __56__CacheDeleteAnalytics_processPurgeableOperationResult___block_invoke;
  id v14 = &unk_10005D5D8;
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:&v11];

  -[CacheDeleteAnalytics postStatsDictionary:summarize:](self, "postStatsDictionary:summarize:", v9, 1, v11, v12, v13, v14, v15);
  id v10 = [(CacheDeleteAnalytics *)self powerLogger];
  [v10 flush];
}

void __56__CacheDeleteAnalytics_processPurgeableOperationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "secondsFrom:to:", objc_msgSend(v4, "monotonicBegin"), objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v4, "urgency"));
  id v8 = [v4 serviceName];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"purgeable_time_%s_%s", v7, [v8 UTF8String]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = +[NSNumber numberWithDouble:v6];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v15];

  objc_msgSend(*(id *)(a1 + 32), "machTimeToSeconds:", objc_msgSend(v4, "monotonicBegin"));
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 32) powerLogger];
  id v13 = [v4 urgency];
  id v14 = [v4 serviceName];

  [v12 logCacheDuetEvent:2 urgencyLevel:v13 serviceName:v14 startFromUptime:0 duration:0 requestedBytes:v11 purgedBytes:v6];
}

- (void)processPeriodicOperationResult:(id)a3
{
  id v4 = a3;
  [(CacheDeleteAnalytics *)self incrementDailyValueForKey:@"dailyPeriodicReqs"];
  -[CacheDeleteAnalytics secondsFrom:to:](self, "secondsFrom:to:", [v4 monotonicBegin], objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  -[CacheDeleteAnalytics addDailyValueForKey:value:](self, "addDailyValueForKey:value:", @"dailyActiveTimePeriodicS");
  [(CacheDeleteAnalytics *)self addDailyValueForKey:@"dailyActiveTimeS" value:v6];
  id v7 = objc_alloc((Class)NSMutableDictionary);
  id v8 = [v4 results];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  double v10 = [v4 results];

  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = __55__CacheDeleteAnalytics_processPeriodicOperationResult___block_invoke;
  id v16 = &unk_10005D600;
  BOOL v17 = self;
  id v18 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:&v13];

  -[CacheDeleteAnalytics postStatsDictionary:summarize:](self, "postStatsDictionary:summarize:", v11, 1, v13, v14, v15, v16, v17);
  uint64_t v12 = [(CacheDeleteAnalytics *)self powerLogger];
  [v12 flush];
}

void __55__CacheDeleteAnalytics_processPeriodicOperationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "secondsFrom:to:", objc_msgSend(v4, "monotonicBegin"), objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v4, "urgency"));
  id v8 = [v4 serviceName];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"periodicTimeS%s%s", v7, [v8 UTF8String]);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = +[NSNumber numberWithDouble:v6];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v20];

  id v10 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v4, "urgency"));
  id v11 = [v4 serviceName];
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"periodicReportedBytes%s%s", v10, [v11 UTF8String]);

  id v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 reportedPurgedBytes]);
  [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];

  objc_msgSend(*(id *)(a1 + 32), "machTimeToSeconds:", objc_msgSend(v4, "monotonicBegin"));
  double v15 = v14;
  id v16 = [*(id *)(a1 + 32) powerLogger];
  id v17 = [v4 urgency];
  id v18 = [v4 serviceName];
  id v19 = [v4 reportedPurgedBytes];

  [v16 logCacheDuetEvent:0 urgencyLevel:v17 serviceName:v18 startFromUptime:0 duration:v19 requestedBytes:v15 purgedBytes:v6];
}

- (void)reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CacheDeleteAnalytics *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__CacheDeleteAnalytics_reportReceivedLowDiskNotification_forVolume___block_invoke;
  block[3] = &unk_10005D030;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

id __68__CacheDeleteAnalytics_reportReceivedLowDiskNotification_forVolume___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportReceivedLowDiskNotification:*(void *)(a1 + 40) forVolume:*(void *)(a1 + 48)];
}

- (void)_reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = getRootVolume();
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9) {
    id v10 = "Root";
  }
  else {
    id v10 = "Ext";
  }
  if ([v6 isEqualToString:@"CD_VERYLOWDISK_EVENT"])
  {
    CFStringRef v11 = @"dailyNumVeryLowDiskEvents";
LABEL_12:
    id v12 = +[NSString stringWithFormat:@"%@%s", v11, v10];
    [(CacheDeleteAnalytics *)self incrementDailyValueForKey:v12];
    id v13 = +[NSString stringWithFormat:@"%@%s", v11, "All"];
    [(CacheDeleteAnalytics *)self incrementDailyValueForKey:v13];

    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"CD_LOWDISK_EVENT"])
  {
    CFStringRef v11 = @"dailyNumLowDiskEvents";
    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"CD_NEAR_LOW_DISK_EVENT"])
  {
    CFStringRef v11 = @"dailyNumNearLowDiskEvents";
    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"CD_DESIRED_EVENT"])
  {
    CFStringRef v11 = @"dailyNumDesiredDiskEvents";
    goto LABEL_12;
  }
  double v14 = CDGetLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unknown low disk event: %@", buf, 0xCu);
  }

LABEL_13:
}

- (void)reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CacheDeleteAnalytics *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__CacheDeleteAnalytics_reportBroadcastLowDiskNotification_forVolume___block_invoke;
  block[3] = &unk_10005D030;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

id __69__CacheDeleteAnalytics_reportBroadcastLowDiskNotification_forVolume___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportBroadcastLowDiskNotification:*(void *)(a1 + 40) forVolume:*(void *)(a1 + 48)];
}

- (void)_reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = getRootVolume();
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9) {
    id v10 = "Root";
  }
  else {
    id v10 = "Ext";
  }
  if ([v6 isEqualToString:@"CD_VERYLOWDISK_EVENT"])
  {
    CFStringRef v11 = @"dailyNumVeryLowDiskBroadcasts";
LABEL_12:
    id v12 = +[NSString stringWithFormat:@"%@%s", v11, v10];
    [(CacheDeleteAnalytics *)self incrementDailyValueForKey:v12];
    id v13 = +[NSString stringWithFormat:@"%@%s", v11, "All"];
    [(CacheDeleteAnalytics *)self incrementDailyValueForKey:v13];

    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"CD_LOWDISK_EVENT"])
  {
    CFStringRef v11 = @"dailyNumLowDiskBroadcasts";
    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"CD_NEAR_LOW_DISK_EVENT"])
  {
    CFStringRef v11 = @"dailyNumNearLowDiskBroadcasts";
    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"CD_DESIRED_EVENT"])
  {
    CFStringRef v11 = @"dailyNumDesiredDiskBroadcasts";
    goto LABEL_12;
  }
  double v14 = CDGetLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unknown low disk event: %@", buf, 0xCu);
  }

LABEL_13:
}

- (void)reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5
{
  id v8 = a3;
  unsigned int v9 = [(CacheDeleteAnalytics *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __74__CacheDeleteAnalytics_reportLowDiskFunctionalFailure_failureType_isRoot___block_invoke;
  block[3] = &unk_10005D628;
  block[4] = self;
  id v12 = v8;
  int v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_sync(v9, block);
}

id __74__CacheDeleteAnalytics_reportLowDiskFunctionalFailure_failureType_isRoot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportLowDiskFunctionalFailure:*(void *)(a1 + 40) failureType:*(unsigned int *)(a1 + 48) isRoot:*(unsigned __int8 *)(a1 + 52)];
}

- (void)_reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5
{
  if (a5) {
    id v6 = "Root";
  }
  else {
    id v6 = "Ext";
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"lowDiskFunctionalFailure_%d_%s_%s", *(void *)&a4, v6, [a3 UTF8String]);
  id v8 = CDGetLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_reportLowDiskFunctionalFailure key: %@", buf, 0xCu);
  }

  [(CacheDeleteAnalytics *)self incrementDailyValueForKey:v7];
}

- (CDPurgeableResultCache)purgeableResultCache
{
  return self->_purgeableResultCache;
}

- (void)setPurgeableResultCache:(id)a3
{
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableDictionary)dailyStats
{
  return self->_dailyStats;
}

- (void)setDailyStats:(id)a3
{
}

- (CacheDeleteServiceProvider)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
}

- (unint64_t)nandSize
{
  return self->_nandSize;
}

- (PurgeStatsReporter)purgeStatReporter
{
  return self->_purgeStatReporter;
}

- (void)setPurgeStatReporter:(id)a3
{
}

- (PowerLogger)powerLogger
{
  return self->_powerLogger;
}

- (void)setPowerLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogger, 0);
  objc_storeStrong((id *)&self->_purgeStatReporter, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_dailyStats, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_purgeableResultCache, 0);
}

@end