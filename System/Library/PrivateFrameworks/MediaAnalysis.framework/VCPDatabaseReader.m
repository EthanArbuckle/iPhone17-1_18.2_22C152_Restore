@interface VCPDatabaseReader
+ (BOOL)shouldQueryInternalFields;
+ (id)databaseForPhotoLibrary:(id)a3;
+ (id)databaseForPhotoLibraryURL:(id)a3;
+ (id)databaseWithURL:(id)a3;
- (BOOL)exists;
- (BOOL)isAssetBlacklisted:(id)a3 blacklistDate:(id *)a4;
- (VCPDatabaseReader)initWithDatabaseURL:(id)a3;
- (VCPDatabaseReader)initWithPhotoLibrary:(id)a3;
- (VCPDatabaseReader)initWithPhotoLibraryURL:(id)a3;
- (id)blacklistedLocalIdentifiersFromAssets:(id)a3;
- (id)databaseDirectoryPath;
- (id)loadKeyValues;
- (id)queryAnalysesForAssets:(id)a3 withTypes:(id)a4;
- (id)queryAnalysisForAsset:(id)a3;
- (id)queryAnalysisForAsset:(id)a3 withTypes:(id)a4;
- (id)queryAnalysisPropertiesForAsset:(id)a3;
- (id)queryAnalysisPropertiesForAssets:(id)a3;
- (id)queryAssetsAnalyzedSince:(id)a3;
- (id)queryBlacklistedLocalIdentifiers;
- (id)queryFailedProcessingStatusFromAssets:(id)a3 forTaskID:(unint64_t)a4;
- (id)queryLocalIdentifiersForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4;
- (int)_queryValue:(int64_t *)a3 forKey:(id)a4;
- (int)executeDatabaseBlock:(id)a3;
- (int)openDatabase;
- (int)parseHeader:(sqlite3_stmt *)a3 startColumn:(int)a4 analysis:(id)a5;
- (int)parseResults:(sqlite3_stmt *)a3 typeColumn:(int)a4 dataColumn:(int)a5 results:(id)a6;
- (int)queryHeaderForAsset:(id)a3 analysis:(id *)a4 assetId:(int64_t *)a5;
- (int)queryHeadersForAssets:(id)a3 analyses:(id)a4 idMap:(id)a5;
- (int)queryProgressHistoryRecords:(id *)a3 sinceDate:(id)a4;
- (int)queryResultsForAssetId:(int64_t)a3 analysis:(id)a4;
- (int)queryResultsForAssetId:(int64_t)a3 withTypes:(id)a4 analysis:(id)a5;
- (int)queryResultsForAssets:(id)a3 withTypes:(id)a4 batchResults:(id)a5;
- (int)querySchedulingHistoryRecords:(id *)a3 forActivityID:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6;
- (int)querySchedulingHistoryRecords:(id *)a3 startDate:(id)a4 endDate:(id)a5;
- (int64_t)valueForKey:(id)a3;
- (unint64_t)countForTaskID:(unint64_t)a3 withProcessingStatus:(unint64_t)a4;
- (void)closeDatabase;
- (void)dealloc;
- (void)openDatabase;
@end

@implementation VCPDatabaseReader

+ (BOOL)shouldQueryInternalFields
{
  return 0;
}

- (VCPDatabaseReader)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPDatabaseReader;
  v5 = [(VCPDatabaseReader *)&v12 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaanalysis.sql", 0);
    sqlSerialQueue = v5->_sqlSerialQueue;
    v5->_sqlSerialQueue = (OS_dispatch_queue *)v6;

    if (v4) {
      objc_msgSend(v4, "vcp_mediaAnalysisDatabaseFilepath");
    }
    else {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultMediaAnalysisDatabaseFilepath");
    }
    filepath = v5->_filepath;
    v5->_filepath = (NSString *)v8;

    v5->_database = 0;
    v10 = v5;
  }

  return v5;
}

- (VCPDatabaseReader)initWithPhotoLibraryURL:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPDatabaseReader;
  v5 = [(VCPDatabaseReader *)&v14 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaanalysis.sql", 0);
    sqlSerialQueue = v5->_sqlSerialQueue;
    v5->_sqlSerialQueue = (OS_dispatch_queue *)v6;

    if ([MEMORY[0x1E4F39220] isSystemPhotoLibraryURL:v4])
    {
      uint64_t v8 = @"/var/mobile/Media/MediaAnalysis";
    }
    else
    {
      v9 = [v4 path];
      uint64_t v8 = [v9 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/MediaAnalysis"];
    }
    uint64_t v10 = [(__CFString *)v8 stringByAppendingPathComponent:@"mediaanalysis.db"];
    filepath = v5->_filepath;
    v5->_filepath = (NSString *)v10;

    v5->_database = 0;
    objc_super v12 = v5;
  }
  return v5;
}

- (VCPDatabaseReader)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPDatabaseReader;
  v5 = [(VCPDatabaseReader *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaanalysis.sql", 0);
    sqlSerialQueue = v5->_sqlSerialQueue;
    v5->_sqlSerialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [v4 absoluteString];
    filepath = v5->_filepath;
    v5->_filepath = (NSString *)v8;

    v5->_database = 0;
  }

  return v5;
}

+ (id)databaseForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

+ (id)databaseForPhotoLibraryURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPhotoLibraryURL:v3];

  return v4;
}

+ (id)databaseWithURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDatabaseURL:v3];

  return v4;
}

- (void)dealloc
{
  sqlite3_close(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)VCPDatabaseReader;
  [(VCPDatabaseReader *)&v3 dealloc];
}

- (BOOL)exists
{
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(self) = [v3 fileExistsAtPath:self->_filepath];

  return (char)self;
}

- (id)databaseDirectoryPath
{
  return [(NSString *)self->_filepath stringByDeletingLastPathComponent];
}

- (int)openDatabase
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:self->_filepath];

  if (v4)
  {
    v5 = [(NSString *)self->_filepath UTF8String];
    p_database = &self->_database;
    int v7 = sqlite3_open(v5, p_database);
    if (v7)
    {
      int v8 = v7;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v14[0] = 67109120;
          v14[1] = v8;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] Failed to open database: %d", (uint8_t *)v14, 8u);
        }
      }
    }
    else
    {
      int result = sqlite3_busy_handler(*p_database, (int (__cdecl *)(void *, int))busyHandler, 0);
      if (!result) {
        return result;
      }
      int v12 = result;
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        [(VCPDatabaseReader *)v12 openDatabase];
      }
    }
    *p_database = 0;
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] No database file exists", (uint8_t *)v14, 2u);
    }
  }
  return -23;
}

- (void)closeDatabase
{
  self->_database = 0;
}

- (int)parseHeader:(sqlite3_stmt *)a3 startColumn:(int)a4 analysis:(id)a5
{
  id v7 = a5;
  int v8 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(a3, a4));
  [v7 setObject:v8 forKeyedSubscript:@"version"];

  if (sqlite3_column_type(a3, a4 + 1) == 5)
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a3, a4 + 1));
  }
  [v7 setObject:v9 forKeyedSubscript:@"dateModified"];

  if (sqlite3_column_type(a3, a4 + 2) == 5)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a3, a4 + 2));
  }
  [v7 setObject:v10 forKeyedSubscript:@"dateAnalyzed"];

  objc_super v11 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(a3, a4 + 3));
  [v7 setObject:v11 forKeyedSubscript:@"performedAnalysisTypes"];

  int v12 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(a3, a4 + 4));
  [v7 setObject:v12 forKeyedSubscript:@"flags"];

  if (sqlite3_column_double(a3, a4 + 5) != -1.0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v13 forKeyedSubscript:@"quality"];
  }
  if (sqlite3_column_type(a3, a4 + 6) == 5)
  {
    objc_super v14 = 0;
  }
  else
  {
    objc_super v14 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a3, a4 + 6));
  }
  if (sqlite3_column_type(a3, a4 + 7) == 5)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a3, a4 + 7));
  }
  v16 = +[VCPFingerprint fingerprintWithMaster:v14 adjusted:v15];
  objc_msgSend(v7, "vcp_setFingerprint:", v16);

  if ([(id)objc_opt_class() shouldQueryInternalFields])
  {
    v17 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(a3, a4 + 8));
    [v7 setObject:v17 forKeyedSubscript:@"statsFlags"];
  }
  if ((int)objc_msgSend(v7, "vcp_version") < 3 && (objc_msgSend(v7, "vcp_types") & 4) != 0)
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "vcp_types") | 8);
    [v7 setObject:v18 forKeyedSubscript:@"performedAnalysisTypes"];
  }
  return 0;
}

- (int)parseResults:(sqlite3_stmt *)a3 typeColumn:(int)a4 dataColumn:(int)a5 results:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  int v10 = sqlite3_column_int(a3, a4);
  if (sqlite3_column_type(a3, a5) == 5
    || (objc_super v11 = (void *)MEMORY[0x1E4F1C9B8],
        int v12 = sqlite3_column_blob(a3, a5),
        objc_msgSend(v11, "dataWithBytesNoCopy:length:freeWhenDone:", v12, sqlite3_column_bytes(a3, a5), 0),
        (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_11:
    int v20 = -18;
    goto LABEL_12;
  }
  id v23 = 0;
  objc_super v14 = [MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:&v23];
  id v15 = v23;
  v16 = v15;
  if (!v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = [v16 description];
        *(_DWORD *)buf = 67109378;
        int v25 = a5;
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "Failed to extract NSArray from column %d (%@)", buf, 0x12u);
      }
    }

    goto LABEL_11;
  }

  v17 = MediaAnalysisResultsTypeToKey(v10);
  if (v17)
  {
    [v9 setObject:v14 forKey:v17];
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v22 = VCPLogInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = v10;
      _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Unknown result key for result type %u", buf, 8u);
    }
  }
  int v20 = 0;
LABEL_12:

  return v20;
}

- (int)queryHeaderForAsset:(id)a3 analysis:(id *)a4 assetId:(int64_t *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      __int16 v26 = 1024;
      int v27 = 228;
      __int16 v28 = 2080;
      v29 = "-[VCPDatabaseReader queryHeaderForAsset:analysis:assetId:]";
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  ppStmt = 0;
  int v10 = [MEMORY[0x1E4F28E78] stringWithString:@"SELECT id, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint"];
  if ([(id)objc_opt_class() shouldQueryInternalFields]) {
    [v10 appendString:@", statsFlags"];
  }
  [v10 appendString:@" FROM Assets WHERE localIdentifier=(?);"];
  database = self->_database;
  id v12 = v10;
  int v13 = sqlite3_prepare_v2(database, (const char *)[v12 UTF8String], -1, &ppStmt, 0);
  if (!v13)
  {
    objc_super v14 = ppStmt;
    id v15 = v8;
    v16 = v15;
    int v17 = v15
        ? sqlite3_bind_text(v14, 1, (const char *)[v15 UTF8String], -1, 0)
        : sqlite3_bind_null(v14, 1);
    int v13 = v17;

    if (!v13)
    {
      v18 = sqlite3_expanded_sql(ppStmt);
      if (v18)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            int v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
            __int16 v26 = 1024;
            int v27 = 243;
            __int16 v28 = 2080;
            v29 = v18;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v18);
      }
      int v20 = sqlite3_step(ppStmt);
      if (v20 == 100)
      {
        *a5 = sqlite3_column_int(ppStmt, 0);
        id v21 = [MEMORY[0x1E4F1CA60] dictionary];
        *a4 = v21;
        int v13 = [(VCPDatabaseReader *)self parseHeader:ppStmt startColumn:1 analysis:v21];
        if (v13) {
          goto LABEL_24;
        }
        int v20 = sqlite3_step(ppStmt);
      }
      if (v20 == 101) {
        int v13 = 0;
      }
      else {
        int v13 = v20;
      }
    }
  }
LABEL_24:
  sqlite3_finalize(ppStmt);

  return v13;
}

- (int)queryResultsForAssetId:(int64_t)a3 analysis:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      __int16 v17 = 1024;
      int v18 = 264;
      __int16 v19 = 2080;
      int v20 = "-[VCPDatabaseReader queryResultsForAssetId:analysis:]";
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  ppStmt = 0;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  int v9 = sqlite3_prepare_v2(self->_database, "SELECT resultsType, results FROM Results WHERE assetId=(?);",
         -1,
         &ppStmt,
         0);
  if (!v9)
  {
    int v9 = sqlite3_bind_int64(ppStmt, 1, a3);
    if (!v9)
    {
      objc_super v11 = sqlite3_expanded_sql(ppStmt);
      if (v11)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          id v12 = VCPLogInstance();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
            __int16 v17 = 1024;
            int v18 = 273;
            __int16 v19 = 2080;
            int v20 = v11;
            _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v11);
      }
      while (1)
      {
        int v13 = sqlite3_step(ppStmt);
        if (v13 != 100) {
          break;
        }
        int v9 = [(VCPDatabaseReader *)self parseResults:ppStmt typeColumn:0 dataColumn:1 results:v8];
        if (v9) {
          goto LABEL_7;
        }
      }
      if (v13 == 101)
      {
        if ([v8 count]) {
          [v6 setObject:v8 forKey:@"metadataRanges"];
        }
        int v9 = 0;
      }
      else
      {
        int v9 = -18;
      }
    }
  }
LABEL_7:
  sqlite3_finalize(ppStmt);

  return v9;
}

- (int)queryResultsForAssetId:(int64_t)a3 withTypes:(id)a4 analysis:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      __int16 v37 = 1024;
      int v38 = 297;
      __int16 v39 = 2080;
      v40 = "-[VCPDatabaseReader queryResultsForAssetId:withTypes:analysis:]";
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v8 && ![v8 count])
  {
    int v16 = 0;
  }
  else
  {
    ppStmt = 0;
    objc_super v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT resultsType, results FROM Results WHERE assetId=(?");
    if ([v8 count])
    {
      [v12 appendString:@") AND resultsType IN (?"];
      for (unint64_t i = 1; i < [v8 count]; ++i)
        [v12 appendString:@",?"];
    }
    [v12 appendString:@";"]);
    database = self->_database;
    id v15 = v12;
    int v16 = sqlite3_prepare_v2(database, (const char *)[v15 UTF8String], -1, &ppStmt, 0);
    if (!v16)
    {
      int v16 = sqlite3_bind_int64(ppStmt, 1, a3);
      if (!v16)
      {
        int v27 = v11;
        id v28 = v9;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v17 = v8;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v30;
          int v20 = 2;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v17);
              }
              sqlite3_int64 v22 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "unsignedIntegerValue", v27, v28, (void)v29);
              int v16 = sqlite3_bind_int64(ppStmt, v20 + j, v22);
              if (v16)
              {

                objc_super v11 = v27;
                id v9 = v28;
                goto LABEL_38;
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
            v20 += j;
            if (v18) {
              continue;
            }
            break;
          }
        }

        objc_super v11 = v27;
        id v9 = v28;
        id v23 = sqlite3_expanded_sql(ppStmt);
        if (v23)
        {
          if (MediaAnalysisEnableDatabaseLog())
          {
            v24 = VCPLogInstance();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v36 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
              __int16 v37 = 1024;
              int v38 = 322;
              __int16 v39 = 2080;
              v40 = v23;
              _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
            }
          }
          sqlite3_free(v23);
        }
        while (1)
        {
          int v25 = sqlite3_step(ppStmt);
          if (v25 != 100) {
            break;
          }
          int v16 = [(VCPDatabaseReader *)self parseResults:ppStmt typeColumn:0 dataColumn:1 results:v27];
          if (v16) {
            goto LABEL_38;
          }
        }
        if (v25 && v25 != 101)
        {
          int v16 = -18;
        }
        else
        {
          if (objc_msgSend(v27, "count", v27, v28)) {
            [v9 setObject:v11 forKey:@"metadataRanges"];
          }
          int v16 = 0;
        }
      }
    }
LABEL_38:
    sqlite3_finalize(ppStmt);
  }
  return v16;
}

- (int)queryHeadersForAssets:(id)a3 analyses:(id)a4 idMap:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v32 = a4;
  id v33 = a5;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      __int16 v41 = 1024;
      int v42 = 346;
      __int16 v43 = 2080;
      v44 = "-[VCPDatabaseReader queryHeadersForAssets:analyses:idMap:]";
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  id v9 = [MEMORY[0x1E4F28E78] stringWithString:@"SELECT id, localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint"];
  if ([(id)objc_opt_class() shouldQueryInternalFields]) {
    [v9 appendString:@", statsFlags"];
  }
  objc_msgSend(v9, "appendString:", @" FROM Assets WHERE localIdentifier IN (?");
  for (unint64_t i = 1; i < [v7 count]; ++i)
    [v9 appendString:@",?"];
  [v9 appendString:@";"]);
  database = self->_database;
  id v31 = v9;
  int v12 = sqlite3_prepare_v2(database, (const char *)[v31 UTF8String], -1, (sqlite3_stmt **)buf, 0);
  if (!v12)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v36;
      int v16 = 1;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(sqlite3_stmt **)buf;
          id v19 = *(id *)(*((void *)&v35 + 1) + 8 * j);
          int v20 = v19;
          if (v19) {
            int v21 = sqlite3_bind_text(v18, v16 + j, (const char *)[v19 UTF8String], -1, 0);
          }
          else {
            int v21 = sqlite3_bind_null(v18, v16 + j);
          }
          int v12 = v21;

          if (v12)
          {

            goto LABEL_32;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
        v16 += j;
        if (v14) {
          continue;
        }
        break;
      }
    }

    int v22 = sqlite3_step(*(sqlite3_stmt **)buf);
    if (v22 == 100)
    {
      while (1)
      {
        int v23 = sqlite3_column_int(*(sqlite3_stmt **)buf, 0);
        v24 = *(sqlite3_stmt **)buf;
        if (sqlite3_column_type(*(sqlite3_stmt **)buf, 1) == 5)
        {
          int v25 = 0;
        }
        else
        {
          int v25 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v24, 1));
        }
        uint64_t v26 = v23;
        int v27 = [NSNumber numberWithLongLong:v23];
        [v33 setObject:v25 forKey:v27];

        id v28 = [MEMORY[0x1E4F1CA60] dictionary];
        int v12 = [(VCPDatabaseReader *)self parseHeader:*(void *)buf startColumn:2 analysis:v28];
        if (v12) {
          break;
        }
        long long v29 = [NSNumber numberWithLongLong:v26];
        [v32 setObject:v28 forKey:v29];

        int v22 = sqlite3_step(*(sqlite3_stmt **)buf);
        if (v22 != 100) {
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_28:
      if (v22 == 101) {
        int v12 = 0;
      }
      else {
        int v12 = v22;
      }
    }
  }
LABEL_32:
  sqlite3_finalize(*(sqlite3_stmt **)buf);

  return v12;
}

- (int)queryResultsForAssets:(id)a3 withTypes:(id)a4 batchResults:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v43 = v8;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v61 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      __int16 v62 = 1024;
      int v63 = 401;
      __int16 v64 = 2080;
      v65 = "-[VCPDatabaseReader queryResultsForAssets:withTypes:batchResults:]";
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v8 && ![v8 count])
  {
    int v15 = 0;
  }
  else
  {
    ppStmt = 0;
    objc_super v11 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT assetId, resultsType, results FROM Results WHERE assetId IN (?");
    for (unint64_t i = 1; i < [v7 count]; ++i)
      [v11 appendString:@",?"];
    if ([v8 count])
    {
      [v11 appendString:@") AND resultsType IN (?"];
      for (unint64_t j = 1; j < [v8 count]; ++j)
        [v11 appendString:@",?"];
    }
    [v11 appendString:@";"]);
    database = self->_database;
    id v42 = v11;
    int v15 = sqlite3_prepare_v2(database, (const char *)[v42 UTF8String], -1, &ppStmt, 0);
    if (!v15)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v16 = v7;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v53;
        int v19 = 1;
        while (2)
        {
          uint64_t v20 = 0;
          int v21 = v19;
          do
          {
            if (*(void *)v53 != v18) {
              objc_enumerationMutation(v16);
            }
            sqlite3_int64 v22 = [*(id *)(*((void *)&v52 + 1) + 8 * v20) unsignedIntegerValue];
            int v15 = sqlite3_bind_int64(ppStmt, v21 + v20, v22);
            if (v15)
            {

              goto LABEL_61;
            }
            ++v20;
          }
          while (v17 != v20);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v59 count:16];
          int v19 = v21 + v20;
          if (v17) {
            continue;
          }
          break;
        }
        int v23 = v21 + v20;
      }
      else
      {
        int v23 = 1;
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v24 = v43;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v49;
        while (2)
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v49 != v26) {
              objc_enumerationMutation(v24);
            }
            sqlite3_int64 v28 = [*(id *)(*((void *)&v48 + 1) + 8 * k) unsignedIntegerValue];
            int v15 = sqlite3_bind_int64(ppStmt, v23 + k, v28);
            if (v15)
            {

              goto LABEL_61;
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v58 count:16];
          v23 += k;
          if (v25) {
            continue;
          }
          break;
        }
      }

      long long v29 = sqlite3_expanded_sql(ppStmt);
      if (v29)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          long long v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v61 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
            __int16 v62 = 1024;
            int v63 = 435;
            __int16 v64 = 2080;
            v65 = v29;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v29);
      }
      int v40 = sqlite3_step(ppStmt);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v31 = v16;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v57 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v45;
        do
        {
          for (uint64_t m = 0; m != v32; ++m)
          {
            if (*(void *)v45 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v35 = *(void *)(*((void *)&v44 + 1) + 8 * m);
            long long v36 = [MEMORY[0x1E4F1CA60] dictionary];
            [v9 setObject:v36 forKeyedSubscript:v35];
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v57 count:16];
        }
        while (v32);
      }
      while (1)
      {

        if (v40 != 100) {
          break;
        }
        long long v37 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int(ppStmt, 0));
        id v31 = [v9 objectForKeyedSubscript:v37];

        if (!v31)
        {
          int v15 = -18;
          goto LABEL_61;
        }
        int v15 = [(VCPDatabaseReader *)self parseResults:ppStmt typeColumn:1 dataColumn:2 results:v31];
        if (v15)
        {

          goto LABEL_61;
        }
        int v40 = sqlite3_step(ppStmt);
      }
      if (v40 == 101) {
        int v38 = 0;
      }
      else {
        int v38 = -18;
      }
      if (v40) {
        int v15 = v38;
      }
      else {
        int v15 = 0;
      }
    }
LABEL_61:
    sqlite3_finalize(ppStmt);
  }
  return v15;
}

- (int)executeDatabaseBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  sqlSerialQueue = self->_sqlSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCPDatabaseReader_executeDatabaseBlock___block_invoke;
  block[3] = &unk_1E6298E80;
  id v9 = v4;
  int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(sqlSerialQueue, block);
  LODWORD(sqlSerialQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)sqlSerialQueue;
}

void __42__VCPDatabaseReader_executeDatabaseBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v2 = VCPLogInstance();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          int v7 = 67109120;
          int v8 = v3;
          _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] Database already opened, failed to execute query block: %d", (uint8_t *)&v7, 8u);
        }
      }
    }
  }
  id v4 = *(void **)(a1 + 32);
  if (!v4[3] || *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [v4 closeDatabase];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) openDatabase];
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v5 = VCPLogInstance();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            int v7 = 67109120;
            int v8 = v6;
            _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] Failed to execute query block: %d", (uint8_t *)&v7, 8u);
          }
        }
      }
    }
  }
}

- (BOOL)isAssetBlacklisted:(id)a3 blacklistDate:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 500;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader isAssetBlacklisted:blacklistDate:]";
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__VCPDatabaseReader_isAssetBlacklisted_blacklistDate___block_invoke;
  v11[3] = &unk_1E6298EA8;
  v11[4] = self;
  id v8 = v6;
  uint64_t v13 = buf;
  int v14 = a4;
  id v12 = v8;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v11];
  BOOL v9 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v9;
}

uint64_t __54__VCPDatabaseReader_isAssetBlacklisted_blacklistDate___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 24), "SELECT date FROM Blacklist WHERE localIdentifier=(?) AND count>=(?);",
         -1,
         &ppStmt,
         0);
  if (!v2)
  {
    int v3 = ppStmt;
    id v4 = *(id *)(a1 + 40);
    v5 = v4;
    uint64_t v6 = v4
       ? sqlite3_bind_text(v3, 1, (const char *)[v4 UTF8String], -1, 0)
       : sqlite3_bind_null(v3, 1);
    uint64_t v2 = v6;

    if (!v2)
    {
      uint64_t v2 = sqlite3_bind_int(ppStmt, 2, 2);
      if (!v2)
      {
        int v7 = sqlite3_expanded_sql(ppStmt);
        if (v7)
        {
          if (MediaAnalysisEnableDatabaseLog())
          {
            id v8 = VCPLogInstance();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              int v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
              __int16 v16 = 1024;
              int v17 = 510;
              __int16 v18 = 2080;
              int v19 = v7;
              _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
            }
          }
          sqlite3_free(v7);
        }
        int v9 = sqlite3_step(ppStmt);
        if (v9 == 100)
        {
          if (*(void *)(a1 + 56))
          {
            sqlite3_column_nsdate(ppStmt, 0);
            **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          int v9 = sqlite3_step(ppStmt);
        }
        if (v9 == 101)
        {
          sqlite3_finalize(ppStmt);
          return 0;
        }
        uint64_t v2 = 4294967278;
      }
    }
  }
  sqlite3_finalize(ppStmt);
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      int v15 = v11;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Error querying blacklist status for %@", buf, 0xCu);
    }
  }
  return v2;
}

- (id)blacklistedLocalIdentifiersFromAssets:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 533;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader blacklistedLocalIdentifiersFromAssets:]";
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if ([v4 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__21;
    uint64_t v13 = __Block_byref_object_dispose__21;
    id v14 = [MEMORY[0x1E4F1CA80] set];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__VCPDatabaseReader_blacklistedLocalIdentifiersFromAssets___block_invoke;
    v8[3] = &unk_1E6298ED0;
    id v9 = v4;
    int v10 = self;
    uint64_t v11 = buf;
    [(VCPDatabaseReader *)self executeDatabaseBlock:v8];
    id v6 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __59__VCPDatabaseReader_blacklistedLocalIdentifiersFromAssets___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT localIdentifier FROM Blacklist WHERE count>=(?) AND localIdentifier IN (?");
  for (unint64_t i = 1; i < [*(id *)(a1 + 32) count]; ++i)
    [v2 appendString:@",?"];
  [v2 appendString:@";"]);
  ppStmt = 0;
  id v4 = *(sqlite3 **)(*(void *)(a1 + 40) + 24);
  id v25 = v2;
  uint64_t v5 = sqlite3_prepare_v2(v4, (const char *)[v25 UTF8String], -1, &ppStmt, 0);
  if (!v5)
  {
    uint64_t v5 = sqlite3_bind_int(ppStmt, 1, 2);
    if (!v5)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v37 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v27;
        int v9 = 2;
        while (2)
        {
          for (uint64_t j = 0; j != v7; ++j)
          {
            if (*(void *)v27 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = ppStmt;
            id v12 = [*(id *)(*((void *)&v26 + 1) + 8 * j) localIdentifier];
            uint64_t v13 = v12;
            if (v12) {
              uint64_t v14 = sqlite3_bind_text(v11, v9 + j, (const char *)[v12 UTF8String], -1, 0);
            }
            else {
              uint64_t v14 = sqlite3_bind_null(v11, v9 + j);
            }
            uint64_t v5 = v14;

            if (v5)
            {

              goto LABEL_33;
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v37 count:16];
          v9 += j;
          if (v7) {
            continue;
          }
          break;
        }
      }

      uint64_t v15 = sqlite3_expanded_sql(ppStmt);
      if (v15)
      {
        if (MediaAnalysisEnableDatabaseLog())
        {
          __int16 v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
            __int16 v33 = 1024;
            int v34 = 553;
            __int16 v35 = 2080;
            long long v36 = v15;
            _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
        }
        sqlite3_free(v15);
      }
      for (int k = sqlite3_step(ppStmt); k == 100; int k = sqlite3_step(ppStmt))
      {
        __int16 v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v19 = ppStmt;
        if (sqlite3_column_type(ppStmt, 0) == 5)
        {
          uint64_t v20 = 0;
        }
        else
        {
          uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v19, 0));
        }
        [v18 addObject:v20];
      }
      if (k == 101) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = 4294967278;
      }
    }
  }
LABEL_33:
  sqlite3_finalize(ppStmt);
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query blacklisted assets", buf, 2u);
      }
    }
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
    int v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = 0;
  }
  return v5;
}

- (id)queryBlacklistedLocalIdentifiers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (MediaAnalysisEnableDatabaseLog())
  {
    int v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 578;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryBlacklistedLocalIdentifiers]";
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  uint64_t v8 = __Block_byref_object_dispose__21;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__VCPDatabaseReader_queryBlacklistedLocalIdentifiers__block_invoke;
  v6[3] = &unk_1E6298EF8;
  v6[4] = self;
  v6[5] = buf;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v6];
  id v4 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v4;
}

uint64_t __53__VCPDatabaseReader_queryBlacklistedLocalIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 24), "SELECT localIdentifier FROM Blacklist WHERE count>=(?);",
         -1,
         &ppStmt,
         0);
  if (!v2)
  {
    uint64_t v2 = sqlite3_bind_int(ppStmt, 1, 2);
    int v3 = ppStmt;
    if (v2) {
      goto LABEL_4;
    }
    uint64_t v8 = sqlite3_expanded_sql(ppStmt);
    if (v8)
    {
      if (MediaAnalysisEnableDatabaseLog())
      {
        id v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
          __int16 v17 = 1024;
          int v18 = 588;
          __int16 v19 = 2080;
          uint64_t v20 = v8;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
      }
      sqlite3_free(v8);
    }
    for (int i = sqlite3_step(ppStmt); i == 100; int i = sqlite3_step(ppStmt))
    {
      uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v12 = ppStmt;
      if (sqlite3_column_type(ppStmt, 0) == 5)
      {
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v12, 0));
      }
      [v11 addObject:v13];
    }
    if (i == 101)
    {
      sqlite3_finalize(ppStmt);
      return 0;
    }
    uint64_t v2 = 4294967278;
  }
  int v3 = ppStmt;
LABEL_4:
  sqlite3_finalize(v3);
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query blacklisted assets", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  return v2;
}

- (id)queryAnalysisForAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 611;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryAnalysisForAsset:]";
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__VCPDatabaseReader_queryAnalysisForAsset___block_invoke;
  v9[3] = &unk_1E6298ED0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = buf;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v9];
  id v7 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v7;
}

uint64_t __43__VCPDatabaseReader_queryAnalysisForAsset___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  uint64_t v12 = 0;
  uint64_t v5 = [v2 queryHeaderForAsset:v3 analysis:&obj assetId:&v12];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!v5)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      return 0;
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "queryResultsForAssetId:analysis:", v12);
    if (!v5) {
      return v5;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query asset %@", buf, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  return v5;
}

- (id)queryAnalysisPropertiesForAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 633;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryAnalysisPropertiesForAsset:]";
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__VCPDatabaseReader_queryAnalysisPropertiesForAsset___block_invoke;
  v9[3] = &unk_1E6298ED0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = buf;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v9];
  id v7 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v7;
}

uint64_t __53__VCPDatabaseReader_queryAnalysisPropertiesForAsset___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  uint64_t v12 = 0;
  uint64_t v5 = [v2 queryHeaderForAsset:v3 analysis:&obj assetId:&v12];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = a1[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v7;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query analysis properties of asset %@", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  return v5;
}

- (id)queryAnalysisPropertiesForAssets:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 650;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryAnalysisPropertiesForAssets:]";
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if ([v4 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__21;
    uint64_t v12 = __Block_byref_object_dispose__21;
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__VCPDatabaseReader_queryAnalysisPropertiesForAssets___block_invoke;
    v8[3] = &unk_1E6298ED0;
    void v8[4] = self;
    id v9 = v4;
    id v10 = buf;
    [(VCPDatabaseReader *)self executeDatabaseBlock:v8];
    id v6 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __54__VCPDatabaseReader_queryAnalysisPropertiesForAssets___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:@"SELECT id, localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint"];
  if ([(id)objc_opt_class() shouldQueryInternalFields]) {
    [v2 appendString:@", statsFlags"];
  }
  objc_msgSend(v2, "appendString:", @" FROM Assets WHERE localIdentifier IN (?");
  for (unint64_t i = 1; i < [*(id *)(a1 + 40) count]; ++i)
    [v2 appendString:@",?"];
  [v2 appendString:@";"]);
  id v4 = *(sqlite3 **)(*(void *)(a1 + 32) + 24);
  id v5 = v2;
  uint64_t v6 = sqlite3_prepare_v2(v4, (const char *)[v5 UTF8String], -1, &ppStmt, 0);
  int v23 = v5;
  if (!v6)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      int v10 = 1;
LABEL_9:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = ppStmt;
        id v13 = *(id *)(*((void *)&v24 + 1) + 8 * v11);
        uint64_t v14 = v13;
        uint64_t v15 = v13
            ? sqlite3_bind_text(v12, v10 + v11, (const char *)[v13 UTF8String], -1, 0): sqlite3_bind_null(v12, v10 + v11);
        uint64_t v6 = v15;

        if (v6) {
          goto LABEL_33;
        }
        if (v8 == ++v11)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v35 count:16];
          v10 += v11;
          if (v8) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    __int16 v16 = sqlite3_expanded_sql(ppStmt);
    if (v16)
    {
      if (MediaAnalysisEnableDatabaseLog())
      {
        __int16 v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          long long v30 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
          __int16 v31 = 1024;
          int v32 = 680;
          __int16 v33 = 2080;
          int v34 = v16;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
      }
      sqlite3_free(v16);
    }
    unsigned int v18 = sqlite3_step(ppStmt);
    if (v18 == 100)
    {
      while (1)
      {
        id v7 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v6 = [*(id *)(a1 + 32) parseHeader:ppStmt startColumn:2 analysis:v7];
        if (v6) {
          break;
        }
        __int16 v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v20 = ppStmt;
        if (sqlite3_column_type(ppStmt, 1) == 5)
        {
          uint64_t v21 = 0;
        }
        else
        {
          uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v20, 1));
        }
        [v19 setObject:v7 forKey:v21];

        unsigned int v18 = sqlite3_step(ppStmt);
        if (v18 != 100) {
          goto LABEL_30;
        }
      }
LABEL_33:

      goto LABEL_34;
    }
LABEL_30:
    if (v18 == 101) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v18;
    }
  }
LABEL_34:
  sqlite3_finalize(ppStmt);

  return v6;
}

- (id)queryAnalysisForAsset:(id)a3 withTypes:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 704;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryAnalysisForAsset:withTypes:]";
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  unsigned int v18 = __Block_byref_object_dispose__21;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__VCPDatabaseReader_queryAnalysisForAsset_withTypes___block_invoke;
  v13[3] = &unk_1E6298F20;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  __int16 v16 = buf;
  id v10 = v7;
  id v15 = v10;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v13];
  id v11 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v11;
}

uint64_t __53__VCPDatabaseReader_queryAnalysisForAsset_withTypes___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  uint64_t v14 = 0;
  uint64_t v5 = [v2 queryHeaderForAsset:v3 analysis:&obj assetId:&v14];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!v5)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      return 0;
    }
    if (![*(id *)(a1 + 48) count]) {
      return 0;
    }
    id v10 = (void *)[*(id *)(a1 + 48) mutableCopy];
    id v11 = MediaAnalysisResultsTypesForAnalysisTypes(objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "vcp_types"));
    [v10 intersectSet:v11];
    uint64_t v5 = [*(id *)(a1 + 32) queryResultsForAssetId:v14 withTypes:v10 analysis:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    if (!v5) {
      return 0;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query asset %@", buf, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  return v5;
}

- (id)queryAnalysesForAssets:(id)a3 withTypes:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 731;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryAnalysesForAssets:withTypes:]";
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if ([v6 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__21;
    uint64_t v16 = __Block_byref_object_dispose__21;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__VCPDatabaseReader_queryAnalysesForAssets_withTypes___block_invoke;
    v11[3] = &unk_1E6298F48;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    uint64_t v14 = buf;
    [(VCPDatabaseReader *)self executeDatabaseBlock:v11];
    id v9 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __54__VCPDatabaseReader_queryAnalysesForAssets_withTypes___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) queryHeadersForAssets:*(void *)(a1 + 40) analyses:v26 idMap:v1];
  if (v3
    || [v26 count]
    && ((uint64_t v8 = *(void **)(a1 + 48)) == 0 || [v8 count])
    && (id v9 = *(void **)(a1 + 32),
        [v26 allKeys],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v9 queryResultsForAssets:v10 withTypes:*(void *)(a1 + 48) batchResults:v2],
        v10,
        v3))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MediaAnalysis] queryAnalysesForAssets Failed", buf, 2u);
      }
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = [v26 allKeys];
    uint64_t v3 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v3)
    {
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v17 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v18 = [v26 objectForKeyedSubscript:v16];
          [v17 addEntriesFromDictionary:v18];

          id v19 = [v2 objectForKeyedSubscript:v16];
          LOBYTE(v18) = v19 == 0;

          if ((v18 & 1) == 0)
          {
            uint64_t v20 = [v2 objectForKeyedSubscript:v16];
            [v17 setObject:v20 forKey:@"metadataRanges"];
          }
          uint64_t v21 = [v1 objectForKeyedSubscript:v16];
          BOOL v22 = v21 == 0;

          if (!v22)
          {
            int v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            long long v24 = [v1 objectForKeyedSubscript:v16];
            [v23 setObject:v17 forKey:v24];
          }
        }
        uint64_t v3 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v3);
    }
  }

  return v3;
}

- (id)queryAssetsAnalyzedSince:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 777;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryAssetsAnalyzedSince:]";
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  id v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__VCPDatabaseReader_queryAssetsAnalyzedSince___block_invoke;
  v9[3] = &unk_1E6298ED0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = buf;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v9];
  id v7 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v7;
}

uint64_t __46__VCPDatabaseReader_queryAssetsAnalyzedSince___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 24), "SELECT localIdentifier FROM Assets WHERE dateAnalyzed>=(?) UNION SELECT localIdentifier FROM Blacklist WHERE count>=(?) AND date>=(?);",
         -1,
         &ppStmt,
         0);
  if (!v2)
  {
    uint64_t v3 = ppStmt;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 timeIntervalSinceReferenceDate];
      uint64_t v7 = sqlite3_bind_double(v3, 1, v6);
    }
    else
    {
      uint64_t v7 = sqlite3_bind_null(v3, 1);
    }
    uint64_t v2 = v7;

    if (!v2)
    {
      uint64_t v2 = sqlite3_bind_int(ppStmt, 2, 2);
      if (!v2)
      {
        uint64_t v8 = ppStmt;
        id v9 = *(id *)(a1 + 40);
        id v10 = v9;
        if (v9)
        {
          [v9 timeIntervalSinceReferenceDate];
          uint64_t v12 = sqlite3_bind_double(v8, 3, v11);
        }
        else
        {
          uint64_t v12 = sqlite3_bind_null(v8, 3);
        }
        uint64_t v2 = v12;

        if (!v2)
        {
          id v13 = sqlite3_expanded_sql(ppStmt);
          if (v13)
          {
            if (MediaAnalysisEnableDatabaseLog())
            {
              id v14 = VCPLogInstance();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                long long v27 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
                __int16 v28 = 1024;
                int v29 = 790;
                __int16 v30 = 2080;
                long long v31 = v13;
                _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
              }
            }
            sqlite3_free(v13);
          }
          int v15 = sqlite3_step(ppStmt);
          uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v18 = *(void **)(v17 + 40);
          *(void *)(v17 + 40) = v16;
          while (1)
          {

            if (v15 != 100) {
              break;
            }
            id v19 = ppStmt;
            if (sqlite3_column_type(ppStmt, 0) == 5)
            {
              uint64_t v18 = 0;
            }
            else
            {
              uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v19, 0));
            }
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v18];
            int v15 = sqlite3_step(ppStmt);
          }
          if (v15 == 101)
          {
            sqlite3_finalize(ppStmt);
            return 0;
          }
          uint64_t v2 = 4294967278;
        }
      }
    }
  }
  sqlite3_finalize(ppStmt);
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      long long v27 = v21;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query assets since %@", buf, 0xCu);
    }
  }
  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  int v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = 0;

  return v2;
}

- (id)queryFailedProcessingStatusFromAssets:(id)a3 forTaskID:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 818;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryFailedProcessingStatusFromAssets:forTaskID:]";
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if ([v6 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__21;
    uint64_t v16 = __Block_byref_object_dispose__21;
    id v17 = [MEMORY[0x1E4F1CA60] dictionary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__VCPDatabaseReader_queryFailedProcessingStatusFromAssets_forTaskID___block_invoke;
    v10[3] = &unk_1E6298EA8;
    id v11 = v6;
    uint64_t v12 = self;
    id v13 = buf;
    unint64_t v14 = a4;
    [(VCPDatabaseReader *)self executeDatabaseBlock:v10];
    id v8 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __69__VCPDatabaseReader_queryFailedProcessingStatusFromAssets_forTaskID___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"SELECT localIdentifier, status, attempts, lastAttemptDate, nextAttemptDate, errorCode, errorLine FROM ProcessingStatus WHERE taskID=(?) AND status!=(?) AND localIdentifier IN (?");
  for (unint64_t i = 1; i < [*(id *)(a1 + 32) count]; ++i)
    [v2 appendString:@",?"];
  [v2 appendString:@";"]);
  ppStmt = 0;
  id v4 = *(sqlite3 **)(*(void *)(a1 + 40) + 24);
  id v37 = v2;
  uint64_t v5 = sqlite3_prepare_v2(v4, (const char *)[v37 UTF8String], -1, &ppStmt, 0);
  if (!v5)
  {
    uint64_t v5 = sqlite3_bind_int64(ppStmt, 1, *(void *)(a1 + 56));
    if (!v5)
    {
      uint64_t v5 = sqlite3_bind_int64(ppStmt, 2, 1);
      if (!v5)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v6 = *(id *)(a1 + 32);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v49 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v39;
          int v9 = 3;
          while (2)
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v39 != v8) {
                objc_enumerationMutation(v6);
              }
              id v11 = ppStmt;
              id v12 = [*(id *)(*((void *)&v38 + 1) + 8 * j) localIdentifier];
              id v13 = v12;
              if (v12) {
                uint64_t v14 = sqlite3_bind_text(v11, v9 + j, (const char *)[v12 UTF8String], -1, 0);
              }
              else {
                uint64_t v14 = sqlite3_bind_null(v11, v9 + j);
              }
              uint64_t v5 = v14;

              if (v5)
              {

                goto LABEL_43;
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v49 count:16];
            v9 += j;
            if (v7) {
              continue;
            }
            break;
          }
        }

        int v15 = sqlite3_expanded_sql(ppStmt);
        if (v15)
        {
          if (MediaAnalysisEnableDatabaseLog())
          {
            uint64_t v16 = VCPLogInstance();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              long long v44 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
              __int16 v45 = 1024;
              int v46 = 839;
              __int16 v47 = 2080;
              long long v48 = v15;
              _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
            }
          }
          sqlite3_free(v15);
        }
        int v17 = sqlite3_step(ppStmt);
        while (v17 == 100)
        {
          uint64_t v18 = ppStmt;
          if (sqlite3_column_type(ppStmt, 0) == 5)
          {
            id v19 = 0;
          }
          else
          {
            id v19 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v18, 0));
          }
          uint64_t v20 = *(void *)(a1 + 56);
          sqlite3_int64 v21 = sqlite3_column_int64(ppStmt, 1);
          sqlite3_int64 v22 = sqlite3_column_int64(ppStmt, 2);
          int v23 = ppStmt;
          if (sqlite3_column_type(ppStmt, 3) == 5)
          {
            long long v24 = 0;
          }
          else
          {
            long long v24 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v23, 3));
          }
          long long v25 = ppStmt;
          if (sqlite3_column_type(ppStmt, 4) == 5)
          {
            long long v26 = 0;
          }
          else
          {
            long long v26 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v25, 4));
          }
          sqlite3_int64 v27 = sqlite3_column_int64(ppStmt, 5);
          __int16 v28 = +[VCPProcessingStatusEntry entryWithLocalIdentifier:v19 taskID:v20 status:v21 attempts:v22 lastAttemptDate:v24 andNextAttemptDate:v26 errorCode:v27 errorLine:sqlite3_column_int64(ppStmt, 6)];

          int v29 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          __int16 v30 = ppStmt;
          if (sqlite3_column_type(ppStmt, 0) == 5)
          {
            long long v31 = 0;
          }
          else
          {
            long long v31 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v30, 0));
          }
          [v29 setObject:v28 forKeyedSubscript:v31];

          int v17 = sqlite3_step(ppStmt);
        }
        if (v17 == 101) {
          uint64_t v5 = 0;
        }
        else {
          uint64_t v5 = 4294967278;
        }
      }
    }
  }
LABEL_43:
  sqlite3_finalize(ppStmt);
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(const char **)(a1 + 56);
        *(_DWORD *)buf = 134217984;
        long long v44 = v33;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query failed assets for taskID: %lu", buf, 0xCu);
      }
    }
    uint64_t v34 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = 0;
  }
  return v5;
}

- (id)queryLocalIdentifiersForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 874;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryLocalIdentifiersForTaskID:withStatus:]";
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  id v12 = __Block_byref_object_dispose__21;
  id v13 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__VCPDatabaseReader_queryLocalIdentifiersForTaskID_withStatus___block_invoke;
  v10[3] = &unk_1E6298F70;
  v10[6] = a3;
  v10[7] = a4;
  void v10[4] = self;
  v10[5] = buf;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v10];
  id v8 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v8;
}

uint64_t __63__VCPDatabaseReader_queryLocalIdentifiersForTaskID_withStatus___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  ppStmt = 0;
  uint64_t v3 = sqlite3_prepare_v2(*(sqlite3 **)(a1[4] + 24), "SELECT localIdentifier FROM ProcessingStatus WHERE taskID=(?) AND status=(?);",
         -1,
         &ppStmt,
         0);
  if (v3) {
    goto LABEL_4;
  }
  uint64_t v3 = sqlite3_bind_int64(ppStmt, 1, a1[6]);
  if (v3) {
    goto LABEL_4;
  }
  uint64_t v3 = sqlite3_bind_int64(ppStmt, 2, a1[7]);
  if (v3) {
    goto LABEL_4;
  }
  uint64_t v7 = sqlite3_expanded_sql(ppStmt);
  if (v7)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        __int16 v15 = 1024;
        int v16 = 885;
        __int16 v17 = 2080;
        uint64_t v18 = v7;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v7);
  }
  uint64_t v3 = sqlite3_step(ppStmt);
  while (v3 == 100)
  {
    int v9 = ppStmt;
    if (sqlite3_column_type(ppStmt, 0) == 5
      || (objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v9, 0)),
          (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] WARNING: ProcessingStatus entry with nil localIdentifier", buf, 2u);
        }
      }
      id v10 = 0;
    }
    else
    {
      [v2 addObject:v10];
    }
    uint64_t v3 = sqlite3_step(ppStmt);
  }
  if (v3 && v3 != 101)
  {
LABEL_4:

    id v2 = 0;
  }
  else
  {
    uint64_t v3 = 0;
  }
  sqlite3_finalize(ppStmt);
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v2;

  return v3;
}

- (unint64_t)countForTaskID:(unint64_t)a3 withProcessingStatus:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 909;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader countForTaskID:withProcessingStatus:]";
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__VCPDatabaseReader_countForTaskID_withProcessingStatus___block_invoke;
  v10[3] = &unk_1E6298F70;
  v10[6] = a3;
  v10[7] = a4;
  void v10[4] = self;
  v10[5] = buf;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v10];
  unint64_t v8 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v8;
}

uint64_t __57__VCPDatabaseReader_countForTaskID_withProcessingStatus___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(a1[4] + 24), "SELECT COUNT(*) FROM ProcessingStatus WHERE taskID=(?) AND status=(?);",
         -1,
         &ppStmt,
         0);
  if (v2
    || (uint64_t v2 = sqlite3_bind_int64(ppStmt, 1, a1[6]), v2)
    || (uint64_t v2 = sqlite3_bind_int64(ppStmt, 2, a1[7]), v2))
  {
    uint64_t v3 = v2;
    sqlite3_int64 v4 = 0;
  }
  else
  {
    id v6 = sqlite3_expanded_sql(ppStmt);
    if (v6)
    {
      uint64_t v7 = v6;
      if (MediaAnalysisEnableDatabaseLog())
      {
        unint64_t v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          id v11 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
          __int16 v12 = 1024;
          int v13 = 918;
          __int16 v14 = 2080;
          __int16 v15 = v7;
          _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
      }
      sqlite3_free(v7);
    }
    if (sqlite3_step(ppStmt) == 100)
    {
      sqlite3_int64 v4 = sqlite3_column_int64(ppStmt, 0);
      uint64_t v3 = 0;
    }
    else
    {
      sqlite3_int64 v4 = 0;
      uint64_t v3 = 4294967278;
    }
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = v4;
  sqlite3_finalize(ppStmt);
  return v3;
}

- (int)_queryValue:(int64_t *)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      __int16 v21 = 1024;
      int v22 = 933;
      __int16 v23 = 2080;
      long long v24 = "-[VCPDatabaseReader _queryValue:forKey:]";
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  ppStmt = 0;
  *a3 = 0;
  int v8 = sqlite3_prepare_v2(self->_database, "SELECT value FROM KeyValueStore WHERE key = (?);", -1, &ppStmt, 0);
  if (v8) {
    goto LABEL_10;
  }
  int v9 = ppStmt;
  id v10 = v6;
  id v11 = v10;
  int v12 = v10
      ? sqlite3_bind_text(v9, 1, (const char *)[v10 UTF8String], -1, 0)
      : sqlite3_bind_null(v9, 1);
  int v8 = v12;

  if (v8) {
    goto LABEL_10;
  }
  uint64_t v16 = sqlite3_expanded_sql(ppStmt);
  if (v16)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      __int16 v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        __int16 v21 = 1024;
        int v22 = 941;
        __int16 v23 = 2080;
        long long v24 = v16;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v16);
  }
  int v8 = sqlite3_step(ppStmt);
  if (v8 == 100)
  {
    *a3 = sqlite3_column_int64(ppStmt, 0);
    int v8 = sqlite3_step(ppStmt);
  }
  int v14 = 0;
  if (v8)
  {
    if (v8 != 101)
    {
LABEL_10:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v20) = v8;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Failed to query KeyValueStore (error code: %d)", buf, 8u);
        }
      }
      int v14 = v8;
    }
  }
  sqlite3_finalize(ppStmt);

  return v14;
}

- (int64_t)valueForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 957;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader valueForKey:]";
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    *(void *)&buf[24] = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__VCPDatabaseReader_valueForKey___block_invoke;
    v8[3] = &unk_1E6298F98;
    void v8[4] = self;
    id v10 = buf;
    id v9 = v4;
    [(VCPDatabaseReader *)self executeDatabaseBlock:v8];
    int64_t v6 = *(void *)(*(void *)&buf[8] + 24);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

uint64_t __33__VCPDatabaseReader_valueForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryValue:*(void *)(*(void *)(a1 + 48) + 8) + 24 forKey:*(void *)(a1 + 40)];
}

- (id)loadKeyValues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      __int16 v13 = 1024;
      int v14 = 967;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCPDatabaseReader loadKeyValues]";
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__VCPDatabaseReader_loadKeyValues__block_invoke;
  v9[3] = &unk_1E6298FC0;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [(VCPDatabaseReader *)self executeDatabaseBlock:v9];
  int64_t v6 = v10;
  id v7 = v5;

  return v7;
}

uint64_t __34__VCPDatabaseReader_loadKeyValues__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 24), "SELECT key, value FROM KeyValueStore;",
         -1,
         &ppStmt,
         0);
  if (v2) {
    goto LABEL_2;
  }
  id v4 = sqlite3_expanded_sql(ppStmt);
  if (v4)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      id v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        __int16 v13 = 1024;
        int v14 = 975;
        __int16 v15 = 2080;
        uint64_t v16 = v4;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v4);
  }
  uint64_t v2 = sqlite3_step(ppStmt);
  while (v2 == 100)
  {
    int64_t v6 = ppStmt;
    if (sqlite3_column_type(ppStmt, 0) != 5)
    {
      id v7 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v6, 0));
      if (v7)
      {
        int v8 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(ppStmt, 1));
        [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
LABEL_21:

        goto LABEL_23;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      int v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "Parsed a value without key specified; skipping this value",
          buf,
          2u);
      }
      id v7 = 0;
      goto LABEL_21;
    }
    id v7 = 0;
LABEL_23:
    uint64_t v2 = sqlite3_step(ppStmt);
  }
  if (!v2 || v2 == 101)
  {
    uint64_t v2 = 0;
    goto LABEL_27;
  }
LABEL_2:
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Failed to query KeyValueStore", buf, 2u);
    }
  }
LABEL_27:
  sqlite3_finalize(ppStmt);
  return v2;
}

- (int)querySchedulingHistoryRecords:(id *)a3 forActivityID:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1001;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader querySchedulingHistoryRecords:forActivityID:startDate:endDate:]";
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  __int16 v23 = __Block_byref_object_dispose__21;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__VCPDatabaseReader_querySchedulingHistoryRecords_forActivityID_startDate_endDate___block_invoke;
  v17[3] = &unk_1E6298FE8;
  v17[4] = self;
  unint64_t v21 = a4;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  uint64_t v20 = buf;
  int v15 = [(VCPDatabaseReader *)self executeDatabaseBlock:v17];
  *a3 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v15;
}

uint64_t __83__VCPDatabaseReader_querySchedulingHistoryRecords_forActivityID_startDate_endDate___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 24), "SELECT activityID, startTime, duration, exitStatus, sessionLog FROM BackgroundActivitySchedulingHistory WHERE activityID=(?) AND startTime>=(?) AND startTime<=(?);",
         -1,
         &ppStmt,
         0);
  if (v2) {
    goto LABEL_11;
  }
  uint64_t v2 = sqlite3_bind_int64(ppStmt, 1, *(void *)(a1 + 64));
  if (v2) {
    goto LABEL_11;
  }
  uint64_t v3 = ppStmt;
  id v4 = *(id *)(a1 + 40);
  id v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v7 = sqlite3_bind_double(v3, 2, v6);
  }
  else
  {
    uint64_t v7 = sqlite3_bind_null(v3, 2);
  }
  uint64_t v2 = v7;

  if (v2) {
    goto LABEL_11;
  }
  int v8 = ppStmt;
  id v9 = *(id *)(a1 + 48);
  id v10 = v9;
  if (v9)
  {
    [v9 timeIntervalSinceReferenceDate];
    uint64_t v12 = sqlite3_bind_double(v8, 3, v11);
  }
  else
  {
    uint64_t v12 = sqlite3_bind_null(v8, 3);
  }
  uint64_t v2 = v12;

  if (v2) {
    goto LABEL_11;
  }
  id v18 = sqlite3_expanded_sql(ppStmt);
  if (v18)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      id v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        sqlite3_int64 v27 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        __int16 v28 = 1024;
        int v29 = 1013;
        __int16 v30 = 2080;
        long long v31 = v18;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v18);
  }
  uint64_t v2 = sqlite3_step(ppStmt);
  while (v2 == 100)
  {
    uint64_t v20 = objc_alloc_init(MADActivitySchedulingRecord);
    [(MADActivitySchedulingRecord *)v20 setActivityID:sqlite3_column_int64(ppStmt, 0)];
    unint64_t v21 = ppStmt;
    if (sqlite3_column_type(ppStmt, 1) == 5)
    {
      int v22 = 0;
    }
    else
    {
      int v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v21, 1));
    }
    [(MADActivitySchedulingRecord *)v20 setStartTime:v22];

    [(MADActivitySchedulingRecord *)v20 setDuration:sqlite3_column_double(ppStmt, 2)];
    [(MADActivitySchedulingRecord *)v20 setExitStatus:sqlite3_column_int64(ppStmt, 3)];
    __int16 v23 = ppStmt;
    if (sqlite3_column_type(ppStmt, 4) == 5)
    {
      id v24 = 0;
    }
    else
    {
      id v24 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v23, 4));
    }
    [(MADActivitySchedulingRecord *)v20 setSessionLog:v24];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v20];
    uint64_t v2 = sqlite3_step(ppStmt);
  }
  if (v2 && v2 != 101)
  {
LABEL_11:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        VCPTaskIDDescription(*(void *)(a1 + 64));
        id v14 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        sqlite3_int64 v27 = v14;
        __int16 v28 = 1024;
        int v29 = v2;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[SchedulingHistory] Failed to query history for %@ - %d", buf, 0x12u);
      }
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
  else
  {
    uint64_t v2 = 0;
  }
  sqlite3_finalize(ppStmt);
  return v2;
}

- (int)querySchedulingHistoryRecords:(id *)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (MediaAnalysisEnableDatabaseLog())
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1046;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader querySchedulingHistoryRecords:startDate:endDate:]";
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  uint64_t v20 = __Block_byref_object_dispose__21;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__VCPDatabaseReader_querySchedulingHistoryRecords_startDate_endDate___block_invoke;
  v15[3] = &unk_1E6298F48;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v18 = buf;
  int v13 = [(VCPDatabaseReader *)self executeDatabaseBlock:v15];
  *a3 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v13;
}

uint64_t __69__VCPDatabaseReader_querySchedulingHistoryRecords_startDate_endDate___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 24), "SELECT activityID, startTime, duration, exitStatus, sessionLog FROM BackgroundActivitySchedulingHistory WHERE startTime>=(?) AND startTime<=(?);",
         -1,
         &ppStmt,
         0);
  if (v2) {
    goto LABEL_10;
  }
  uint64_t v3 = ppStmt;
  id v4 = *(id *)(a1 + 40);
  id v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v7 = sqlite3_bind_double(v3, 1, v6);
  }
  else
  {
    uint64_t v7 = sqlite3_bind_null(v3, 1);
  }
  uint64_t v2 = v7;

  if (v2) {
    goto LABEL_10;
  }
  id v8 = ppStmt;
  id v9 = *(id *)(a1 + 48);
  id v10 = v9;
  if (v9)
  {
    [v9 timeIntervalSinceReferenceDate];
    uint64_t v12 = sqlite3_bind_double(v8, 2, v11);
  }
  else
  {
    uint64_t v12 = sqlite3_bind_null(v8, 2);
  }
  uint64_t v2 = v12;

  if (v2) {
    goto LABEL_10;
  }
  id v17 = sqlite3_expanded_sql(ppStmt);
  if (v17)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      id v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        long long v26 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        __int16 v27 = 1024;
        int v28 = 1057;
        __int16 v29 = 2080;
        __int16 v30 = v17;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v17);
  }
  uint64_t v2 = sqlite3_step(ppStmt);
  while (v2 == 100)
  {
    id v19 = objc_alloc_init(MADActivitySchedulingRecord);
    [(MADActivitySchedulingRecord *)v19 setActivityID:sqlite3_column_int64(ppStmt, 0)];
    uint64_t v20 = ppStmt;
    if (sqlite3_column_type(ppStmt, 1) == 5)
    {
      id v21 = 0;
    }
    else
    {
      id v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v20, 1));
    }
    [(MADActivitySchedulingRecord *)v19 setStartTime:v21];

    [(MADActivitySchedulingRecord *)v19 setDuration:sqlite3_column_double(ppStmt, 2)];
    [(MADActivitySchedulingRecord *)v19 setExitStatus:sqlite3_column_int64(ppStmt, 3)];
    uint64_t v22 = ppStmt;
    if (sqlite3_column_type(ppStmt, 4) == 5)
    {
      __int16 v23 = 0;
    }
    else
    {
      __int16 v23 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v22, 4));
    }
    [(MADActivitySchedulingRecord *)v19 setSessionLog:v23];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v19];
    uint64_t v2 = sqlite3_step(ppStmt);
  }
  if (v2 && v2 != 101)
  {
LABEL_10:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v2;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[SchedulingHistory] Failed to query all background activities - %d", buf, 8u);
      }
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }
  else
  {
    uint64_t v2 = 0;
  }
  sqlite3_finalize(ppStmt);
  return v2;
}

- (int)queryProgressHistoryRecords:(id *)a3 sinceDate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (MediaAnalysisEnableDatabaseLog())
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1088;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseReader queryProgressHistoryRecords:sinceDate:]";
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__21;
  uint64_t v15 = __Block_byref_object_dispose__21;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__VCPDatabaseReader_queryProgressHistoryRecords_sinceDate___block_invoke;
  v11[3] = &unk_1E6298ED0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  int v13 = buf;
  int v9 = [(VCPDatabaseReader *)self executeDatabaseBlock:v11];
  *a3 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v9;
}

uint64_t __59__VCPDatabaseReader_queryProgressHistoryRecords_sinceDate___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 24), "SELECT activityID, analysisSubtype, storeDate, version, processedAssetCount, totalAssetCount FROM BackgroundAnalysisProgressHistory WHERE storeDate>=(?) ORDER BY activityID ASC, analysisSubtype ASC, storeDate DESC;",
         -1,
         &ppStmt,
         0);
  if (v2) {
    goto LABEL_6;
  }
  uint64_t v3 = ppStmt;
  id v4 = *(id *)(a1 + 40);
  id v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v7 = sqlite3_bind_double(v3, 1, v6);
  }
  else
  {
    uint64_t v7 = sqlite3_bind_null(v3, 1);
  }
  uint64_t v2 = v7;

  if (v2) {
    goto LABEL_6;
  }
  id v12 = sqlite3_expanded_sql(ppStmt);
  if (v12)
  {
    if (MediaAnalysisEnableDatabaseLog())
    {
      int v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v19 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        __int16 v20 = 1024;
        int v21 = 1099;
        __int16 v22 = 2080;
        __int16 v23 = v12;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
    }
    sqlite3_free(v12);
  }
  uint64_t v2 = sqlite3_step(ppStmt);
  while (v2 == 100)
  {
    uint64_t v14 = objc_alloc_init(MADBackgroundAnalysisProgressRecord);
    [(MADBackgroundAnalysisProgressRecord *)v14 setActivityID:sqlite3_column_int64(ppStmt, 0)];
    [(MADBackgroundAnalysisProgressRecord *)v14 setAnalysisSubtype:sqlite3_column_int64(ppStmt, 1)];
    uint64_t v15 = ppStmt;
    if (sqlite3_column_type(ppStmt, 2) == 5)
    {
      id v16 = 0;
    }
    else
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v15, 2));
    }
    [(MADBackgroundAnalysisProgressRecord *)v14 setStoreDate:v16];

    [(MADBackgroundAnalysisProgressRecord *)v14 setVersion:sqlite3_column_int64(ppStmt, 3)];
    [(MADBackgroundAnalysisProgressRecord *)v14 setProcessedAssetCount:sqlite3_column_int64(ppStmt, 4)];
    [(MADBackgroundAnalysisProgressRecord *)v14 setTotalAssetCount:sqlite3_column_int64(ppStmt, 5)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
    uint64_t v2 = sqlite3_step(ppStmt);
  }
  if (v2 && v2 != 101)
  {
LABEL_6:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Failed to query BackgroundAnalysisProgressHistory table", buf, 2u);
      }
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    uint64_t v2 = 0;
  }
  sqlite3_finalize(ppStmt);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filepath, 0);
  objc_storeStrong((id *)&self->_sqlSerialQueue, 0);
}

- (void)openDatabase
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1BBEDA000, a2, OS_LOG_TYPE_FAULT, "[VCPDatabaseReader] Failed to set busy handler: %d", (uint8_t *)v2, 8u);
}

@end