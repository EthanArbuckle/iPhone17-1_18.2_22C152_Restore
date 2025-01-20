@interface PHFetchResultInstrumentation
- (BOOL)areBacktracesEnabled;
- (BOOL)isPerformanceLoggingDisabled;
- (id)formatSqlString:(id)a3 withBindVariables:(id)a4;
- (int64_t)bytesPerRow;
- (unsigned)classifyFetchPerformanceLogLevel;
- (void)beginTrackingStatisticsWithContext:(id)a3;
- (void)classifyFetchPerformanceWithTuple:(id)a3;
- (void)didExecuteFetchRequestWithContext:(id)a3 resultCount:(unint64_t)a4 sqlString:(id)a5 bindVariables:(id)a6;
- (void)didFailFetchRequestWithContext:(id)a3;
- (void)endTrackingStatisticsWithContext:(id)a3 resultCount:(unint64_t)a4 sqlString:(id)a5 bindVariables:(id)a6;
- (void)logFetchWithSqlString:(id)a3 bindVariables:(id)a4;
- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7;
- (void)willExecuteFetchRequestWithContext:(id)a3;
@end

@implementation PHFetchResultInstrumentation

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  if (a7 == -1) {
    -[PHFetchResultInstrumentation didFailFetchRequestWithContext:](self, "didFailFetchRequestWithContext:", a3, a4, a5, a6);
  }
  else {
    [(PHFetchResultInstrumentation *)self didExecuteFetchRequestWithContext:a3 resultCount:a7 sqlString:a5 bindVariables:a6];
  }
}

- (void)didExecuteFetchRequestWithContext:(id)a3 resultCount:(unint64_t)a4 sqlString:(id)a5 bindVariables:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self->_importantFetchName)
  {
    v13 = self->_importantFetchSignpost.log;
    v14 = v13;
    os_signpost_id_t signpostId = self->_importantFetchSignpost.signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
    {
      int v16 = 134217984;
      unint64_t v17 = a4;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v14, OS_SIGNPOST_INTERVAL_END, signpostId, "ImportantPhotosFetch", "%tu", (uint8_t *)&v16, 0xCu);
    }
  }
  [(PHFetchResultInstrumentation *)self endTrackingStatisticsWithContext:v10 resultCount:a4 sqlString:v11 bindVariables:v12];
}

- (void)willExecuteFetchRequestWithContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PHFetchResultInstrumentation *)self beginTrackingStatisticsWithContext:v4];
  if (self->_importantFetchName)
  {
    PLImportantFetchGetLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      importantFetchName = self->_importantFetchName;
      int v11 = 138543362;
      id v12 = importantFetchName;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ImportantPhotosFetch", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v8 = 0;
    os_signpost_id_t v6 = 0;
  }
  log = self->_importantFetchSignpost.log;
  self->_importantFetchSignpost.log = (OS_os_log *)v8;

  self->_importantFetchSignpost.os_signpost_id_t signpostId = v6;
}

- (void)endTrackingStatisticsWithContext:(id)a3 resultCount:(unint64_t)a4 sqlString:(id)a5 bindVariables:(id)a6
{
  id v15 = a3;
  id v10 = a5;
  id v11 = a6;
  if (![(PHFetchResultInstrumentation *)self isPerformanceLoggingDisabled])
  {
    [v15 setTrackSQLiteDatabaseStatistics:self->_wasTrackingStatistics];
    id v12 = [v15 databaseStatistics];
    uint64_t v13 = [v12 totalCachePages];
    uint64_t v14 = v13 - [(NSSQLiteDatabaseStatistics *)self->_statsStart totalCachePages];
    self->_byteCount = v14 * [v12 pageSize];
    self->_rowCount = a4;
    self->_duration = CFAbsoluteTimeGetCurrent() - self->_timeStart;
    [(PHFetchResultInstrumentation *)self logFetchWithSqlString:v10 bindVariables:v11];
  }
}

- (void)beginTrackingStatisticsWithContext:(id)a3
{
  id v6 = a3;
  if (![(PHFetchResultInstrumentation *)self isPerformanceLoggingDisabled])
  {
    self->_wasTrackingStatistics = [v6 trackSQLiteDatabaseStatistics];
    [v6 setTrackSQLiteDatabaseStatistics:1];
    id v4 = [v6 databaseStatistics];
    statsStart = self->_statsStart;
    self->_statsStart = v4;

    self->_timeStart = CFAbsoluteTimeGetCurrent();
  }
}

- (BOOL)isPerformanceLoggingDisabled
{
  if (sOnceToken != -1) {
    dispatch_once(&sOnceToken, &__block_literal_global_19656);
  }
  return sIsLoggingDisabled;
}

- (void)logFetchWithSqlString:(id)a3 bindVariables:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v37 = 0;
  v38 = (os_log_type_t *)&v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__19681;
  v35 = __Block_byref_object_dispose__19682;
  id v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__PHFetchResultInstrumentation_logFetchWithSqlString_bindVariables___block_invoke;
  v30[3] = &unk_1E5844B20;
  v30[4] = &v37;
  v30[5] = &v31;
  [(PHFetchResultInstrumentation *)self classifyFetchPerformanceWithTuple:v30];
  v8 = PLFetchPerformanceGetLog();
  BOOL v9 = os_log_type_enabled(v8, v38[24]);

  if (v9)
  {
    v29 = [(PHFetchResultInstrumentation *)self formatSqlString:v6 withBindVariables:v7];
    id v10 = PLFetchPerformanceGetLog();
    os_log_type_t v11 = *((unsigned char *)v38 + 24);
    if (os_log_type_enabled(v10, v11))
    {
      id v26 = v7;
      id v27 = v6;
      uint64_t v24 = v32[5];
      double duration = self->_duration;
      qos_class_self();
      PLShortStringFromQoSClass();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v28 = [(PHFetchResult *)self->_fetchResult fetchRequest];
      uint64_t v13 = [v28 entityName];
      int64_t byteCount = self->_byteCount;
      int64_t rowCount = self->_rowCount;
      int64_t v16 = [(PHFetchResultInstrumentation *)self bytesPerRow];
      unint64_t v17 = [(PHFetchResult *)self->_fetchResult fetchOptions];
      uint64_t v18 = [(PHFetchResult *)self->_fetchResult fetchRequest];
      *(_DWORD *)buf = 138414594;
      uint64_t v42 = v24;
      __int16 v43 = 2048;
      double v44 = duration;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      v48 = v13;
      __int16 v49 = 2048;
      int64_t v50 = rowCount;
      __int16 v51 = 2048;
      int64_t v52 = byteCount;
      __int16 v53 = 2048;
      int64_t v54 = v16;
      __int16 v55 = 2112;
      v56 = v17;
      __int16 v57 = 2112;
      v58 = v18;
      __int16 v59 = 2112;
      v60 = v29;
      _os_log_impl(&dword_19B043000, v10, v11, "%@PhotoKit Fetch: duration: %.2f, QoS: %@, entity: %@, count: %lld, bytes: %lld, bytes per row: %lld\nPHFetchOptions: %@\nNSFetchRequest: %@%@", buf, 0x66u);

      id v7 = v26;
      id v6 = v27;
    }
    if ([(PHFetchResultInstrumentation *)self areBacktracesEnabled])
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];

      if (*((unsigned char *)v38 + 24) == 17) {
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      }
      else {
        os_log_type_t v21 = *((unsigned char *)v38 + 24);
      }
      v22 = PLFetchPerformanceGetLog();
      if (os_log_type_enabled(v22, v21))
      {
        uint64_t v23 = v32[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = v23;
        __int16 v43 = 2112;
        double v44 = *(double *)&v20;
        _os_log_impl(&dword_19B043000, v22, v21, "%@PhotoKit Fetch: Backtrace\n%@", buf, 0x16u);
      }
    }
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

- (void)classifyFetchPerformanceWithTuple:(id)a3
{
  id v6 = (void (**)(id, void, __CFString *))a3;
  uint64_t v4 = [(PHFetchResultInstrumentation *)self classifyFetchPerformanceLogLevel];
  if (v4 == 2) {
    v5 = &stru_1EEAC1950;
  }
  else {
    v5 = @"Slow ";
  }
  if ([(NSString *)self->_importantFetchName hasPrefix:@"!"])
  {
    if ((((_BYTE)v4 - 1) & 0xFE) != 0) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = 0;
    }
    v5 = [NSString stringWithFormat:@"[%@] %@", self->_importantFetchName, v5];
  }
  v6[2](v6, v4, v5);
}

- (unsigned)classifyFetchPerformanceLogLevel
{
  if (self->_suppressSlowFetchReports) {
    return 2;
  }
  qos_class_t v4 = qos_class_self();
  uint64_t v5 = [(PHFetchResultInstrumentation *)self bytesPerRow];
  if (v4 < QOS_CLASS_USER_INITIATED)
  {
    uint64_t v7 = 2;
  }
  else
  {
    int64_t rowCount = self->_rowCount;
    if ((rowCount > 100 || v5 <= 327680) && (rowCount < 101 || v5 <= 163840))
    {
      uint64_t v7 = 16;
      if (rowCount > 100 || v5 <= 81920)
      {
        if (v5 <= 40960 || rowCount <= 100) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = 16;
        }
      }
    }
    else
    {
      uint64_t v7 = 17;
    }
  }
  v8 = +[PHFetchLogRateLimiter sharedRateLimiter];
  unsigned __int8 v9 = [v8 rateLimitedLogLevelForLogForLevel:v7];

  return v9;
}

- (int64_t)bytesPerRow
{
  p_int64_t byteCount = &self->_byteCount;
  int64_t result = self->_byteCount;
  uint64_t v3 = p_byteCount[1];
  if (v3 >= 1) {
    result /= v3;
  }
  return result;
}

void __68__PHFetchResultInstrumentation_logFetchWithSqlString_bindVariables___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)formatSqlString:(id)a3 withBindVariables:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    context = (void *)MEMORY[0x19F389B10]();
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v7 appendFormat:@"\nsql: %@", v5];
    uint64_t v8 = [v6 count];
    if (v8)
    {
      uint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        os_log_type_t v11 = (void *)MEMORY[0x19F389B10]();
        id v12 = [v6 objectAtIndexedSubscript:i];
        uint64_t v13 = [MEMORY[0x1E4F8A770] stringFromBindVariable:v12 withTypePrefix:1];
        [v7 appendFormat:@"\nsql: bind[%tu] = %@", i, v13];
      }
    }
    uint64_t v14 = (__CFString *)[v7 copy];
  }
  else
  {
    uint64_t v14 = &stru_1EEAC1950;
  }

  return v14;
}

- (BOOL)areBacktracesEnabled
{
  if (sOnceToken != -1) {
    dispatch_once(&sOnceToken, &__block_literal_global_19656);
  }
  return sAreBacktracesEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsStart, 0);

  objc_storeStrong((id *)&self->_importantFetchName, 0);

  objc_storeStrong((id *)&self->_fetchResult, 0);
}

- (void)didFailFetchRequestWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_importantFetchName)
  {
    id v5 = self->_importantFetchSignpost.log;
    id v6 = v5;
    os_signpost_id_t signpostId = self->_importantFetchSignpost.signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
    {
      int v8 = 134217984;
      uint64_t v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_END, signpostId, "ImportantPhotosFetch", "%tu", (uint8_t *)&v8, 0xCu);
    }
  }
  if (![(PHFetchResultInstrumentation *)self isPerformanceLoggingDisabled]) {
    [v4 setTrackSQLiteDatabaseStatistics:self->_wasTrackingStatistics];
  }
}

@end