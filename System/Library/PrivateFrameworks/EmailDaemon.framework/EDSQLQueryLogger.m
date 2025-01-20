@interface EDSQLQueryLogger
+ (id)log;
- (BOOL)_createFileIfNeeded:(id)a3;
- (EDSQLQueryLogger)init;
- (EFAssertableScheduler)queryLoggingScheduler;
- (NSFileHandle)rawQueryLogInputFileHandle;
- (NSMutableArray)queryStatisticsArray;
- (NSMutableDictionary)queryCountDict;
- (NSString)queryCountLogFilePath;
- (NSString)queryLogDirectoryPath;
- (NSString)queryLogFilePath;
- (id)_bucketTransactionLabels:(id)a3;
- (id)_createQueryCountLogFilePath;
- (id)_createQueryLogDirectoryPath;
- (id)_createQueryLogFilePath;
- (id)_createQueryStatisticsDictionary:(id)a3 queryCountByTransactionLabel:(id)a4 queryCountNum:(unint64_t)a5 firstRowExecutionTimeStats:(id)a6 totalExecutionTimeStats:(id)a7 timePerRowExecutionTimeStats:(id)a8;
- (id)_sortQueryCountDict;
- (void)_createQueryCountDict:(id)a3;
- (void)_createQueryLogDirectoryPath;
- (void)_preprocessQueryInfo;
- (void)_recreateFile:(id)a3;
- (void)_removeFile:(id)a3;
- (void)_writeQueryStatistics:(id)a3;
- (void)logQueryString:(id)a3 label:(id)a4 firstRowExecutionTimeInNanoseconds:(unint64_t)a5 totalExecutionTimeInNanoseconds:(unint64_t)a6 numberOfRows:(unint64_t)a7;
- (void)setQueryCountDict:(id)a3;
- (void)setQueryCountLogFilePath:(id)a3;
- (void)setQueryLogDirectoryPath:(id)a3;
- (void)setQueryLogFilePath:(id)a3;
- (void)setQueryStatisticsArray:(id)a3;
- (void)setRawQueryLogInputFileHandle:(id)a3;
- (void)submitQueryLogData;
@end

@implementation EDSQLQueryLogger

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__EDSQLQueryLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_92 != -1) {
    dispatch_once(&log_onceToken_92, block);
  }
  v2 = (void *)log_log_92;

  return v2;
}

void __23__EDSQLQueryLogger_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_92;
  log_log_92 = (uint64_t)v1;
}

- (EDSQLQueryLogger)init
{
  v18.receiver = self;
  v18.super_class = (Class)EDSQLQueryLogger;
  v2 = [(EDSQLQueryLogger *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EFSQLPreparedStatement" qualityOfService:17];
    queryLoggingScheduler = v2->_queryLoggingScheduler;
    v2->_queryLoggingScheduler = (EFAssertableScheduler *)v3;

    uint64_t v5 = [(EDSQLQueryLogger *)v2 _createQueryLogDirectoryPath];
    queryLogDirectoryPath = v2->_queryLogDirectoryPath;
    v2->_queryLogDirectoryPath = (NSString *)v5;

    uint64_t v7 = [(EDSQLQueryLogger *)v2 _createQueryLogFilePath];
    queryLogFilePath = v2->_queryLogFilePath;
    v2->_queryLogFilePath = (NSString *)v7;

    [(EDSQLQueryLogger *)v2 _createFileIfNeeded:v2->_queryLogFilePath];
    uint64_t v9 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v2->_queryLogFilePath];
    rawQueryLogInputFileHandle = v2->_rawQueryLogInputFileHandle;
    v2->_rawQueryLogInputFileHandle = (NSFileHandle *)v9;

    uint64_t v11 = [(EDSQLQueryLogger *)v2 _createQueryCountLogFilePath];
    queryCountLogFilePath = v2->_queryCountLogFilePath;
    v2->_queryCountLogFilePath = (NSString *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queryStatisticsArray = v2->_queryStatisticsArray;
    v2->_queryStatisticsArray = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryCountDict = v2->_queryCountDict;
    v2->_queryCountDict = v15;
  }
  return v2;
}

- (void)logQueryString:(id)a3 label:(id)a4 firstRowExecutionTimeInNanoseconds:(unint64_t)a5 totalExecutionTimeInNanoseconds:(unint64_t)a6 numberOfRows:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke;
  v17[3] = &unk_1E6C066A0;
  id v15 = v13;
  id v18 = v15;
  id v16 = v12;
  unint64_t v21 = a5;
  unint64_t v22 = a6;
  unint64_t v23 = a7;
  id v19 = v16;
  v20 = self;
  [v14 performBlock:v17];
}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke(uint64_t a1)
{
  v23[6] = *(id *)MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    v2 = +[EDSQLQueryLogger log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_3(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = [MEMORY[0x1E4F60E00] redactedQueryStringForQueryString:*(void *)(a1 + 40)];
  [v10 setObject:v11 forKeyedSubscript:@"redactedQuery"];
  id v12 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [v10 setObject:v12 forKeyedSubscript:@"firstRowExecutionTime"];

  id v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  [v10 setObject:v13 forKeyedSubscript:@"totalExecutionTime"];

  v14 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  [v10 setObject:v14 forKeyedSubscript:@"numberOfRows"];

  [v10 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"transactionLabel"];
  v23[0] = 0;
  id v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:v23];
  id v16 = v23[0];
  if (!v15)
  {
    v17 = +[EDSQLQueryLogger log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_2();
    }
  }
  id v18 = [*(id *)(a1 + 48) rawQueryLogInputFileHandle];
  id v22 = 0;
  char v19 = [v18 writeData:v15 error:&v22];
  id v20 = v22;

  if ((v19 & 1) == 0)
  {
    unint64_t v21 = +[EDSQLQueryLogger log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_1();
    }
  }
}

- (id)_createQueryLogDirectoryPath
{
  v11[4] = *(id *)MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F60410] mailDataDirectory];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"QueryPerformance" isDirectory:1 relativeToURL:v2];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
    v11[0] = 0;
    [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:v11];
    id v7 = v11[0];
    if (v7)
    {
      uint64_t v8 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v3 path];
        objc_claimAutoreleasedReturnValue();
        -[EDSQLQueryLogger _createQueryLogDirectoryPath]();
      }
    }
  }
  uint64_t v9 = [v3 path];

  return v9;
}

- (id)_createQueryLogFilePath
{
  v2 = [(EDSQLQueryLogger *)self queryLogDirectoryPath];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"Logs"];

  return v3;
}

- (id)_createQueryCountLogFilePath
{
  v2 = [(EDSQLQueryLogger *)self queryLogDirectoryPath];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"queryCountLogs_"];

  uint64_t v4 = EFSystemBuildVersion();
  uint64_t v5 = [v3 stringByAppendingString:v4];

  char v6 = [v5 stringByAppendingPathExtension:@"json.compressed"];

  return v6;
}

- (BOOL)_createFileIfNeeded:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];
  if ((v5 & 1) == 0) {
    [v4 createFileAtPath:v3 contents:0 attributes:0];
  }

  return v5 ^ 1;
}

- (void)_recreateFile:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v6]) {
    [(EDSQLQueryLogger *)self _removeFile:v6];
  }
  char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 createFileAtPath:v6 contents:0 attributes:0];
}

- (void)_removeFile:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = +[EDSQLQueryLogger log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(v6, "ef_publicDescription");
      [(EDSQLQueryLogger *)(uint64_t)v3 _removeFile:(uint64_t)v10];
    }
  }
}

- (void)submitQueryLogData
{
  id v3 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__EDSQLQueryLogger_submitQueryLogData__block_invoke;
  v4[3] = &unk_1E6BFF2F0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v60 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = [*(id *)(a1 + 32) queryLogFilePath];
  int v3 = [v60 fileExistsAtPath:v2];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) queryLogFilePath];
    uint64_t v5 = [v4 stringByAppendingString:@"_processing"];

    v58 = v5;
    if ([v60 fileExistsAtPath:v5])
    {
      id v6 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_8(v5, v6);
      }

      [*(id *)(a1 + 32) _removeFile:v5];
    }
    id v7 = [*(id *)(a1 + 32) queryLogFilePath];
    id v68 = 0;
    char v8 = [v60 moveItemAtPath:v7 toPath:v5 error:&v68];
    id v57 = v68;

    if ((v8 & 1) == 0)
    {
      v17 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [*(id *)(a1 + 32) queryLogFilePath];
        char v19 = objc_msgSend(v57, "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        v70 = v18;
        __int16 v71 = 2112;
        v72 = v58;
        __int16 v73 = 2114;
        v74 = v19;
        _os_log_error_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_ERROR, "Failed to rename file from: %@ to %@ due to error: %{public}@", buf, 0x20u);
      }
      goto LABEL_51;
    }
    id v9 = [*(id *)(a1 + 32) rawQueryLogInputFileHandle];
    [v9 closeFile];

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v10 queryLogFilePath];
    [v10 _recreateFile:v11];

    id v12 = (void *)MEMORY[0x1E4F28CB0];
    id v13 = [*(id *)(a1 + 32) queryLogFilePath];
    v14 = [v12 fileHandleForWritingAtPath:v13];
    [*(id *)(a1 + 32) setRawQueryLogInputFileHandle:v14];

    id v67 = 0;
    v59 = (void *)[[NSString alloc] initWithContentsOfFile:v5 encoding:1 error:&v67];
    v56 = v67;
    if (v56)
    {
      id v15 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(a1 + 32) queryLogFilePath];
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_7();
      }
      goto LABEL_50;
    }
    id v15 = [MEMORY[0x1E4F28FE8] scannerWithString:v59];
    id v20 = 0;
    while (([v15 isAtEnd] & 1) == 0)
    {
      unint64_t v21 = (void *)MEMORY[0x1E0190280]();
      id v66 = v20;
      [v15 scanUpToString:@"}{" intoString:&v66];
      id v22 = v66;

      unint64_t v23 = (void *)[v22 mutableCopy];
      if ([v23 length])
      {
        v24 = [v23 substringToIndex:1];
        char v25 = [v24 isEqualToString:@"{"];

        if ((v25 & 1) == 0) {
          [v23 insertString:@"{" atIndex:0];
        }
        v26 = objc_msgSend(v23, "substringFromIndex:", objc_msgSend(v23, "length") - 1);
        char v27 = [v26 isEqualToString:@"}"];

        if ((v27 & 1) == 0) {
          [v23 appendString:@"}"];
        }
        unint64_t v28 = [v15 scanLocation];
        if (v28 <= [v59 length] - 2) {
          [v15 setScanLocation:[v15 scanLocation] + 1];
        }
        [*(id *)(a1 + 32) _createQueryCountDict:v23];
      }
      else
      {
        v29 = +[EDSQLQueryLogger log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_6(&v64, v65, v29);
        }
      }
      id v20 = v22;
    }
    [*(id *)(a1 + 32) _preprocessQueryInfo];
    [*(id *)(a1 + 32) _removeFile:v58];
    v30 = [*(id *)(a1 + 32) queryStatisticsArray];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      v35 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_1(v35, v49, v50, v51, v52, v53, v54, v55);
      }
      goto LABEL_49;
    }
    v32 = (void *)MEMORY[0x1E4F28D90];
    v33 = [*(id *)(a1 + 32) queryStatisticsArray];
    id v63 = 0;
    v34 = [v32 dataWithJSONObject:v33 options:0 error:&v63];
    v35 = v63;

    v36 = [*(id *)(a1 + 32) queryStatisticsArray];
    [v36 removeAllObjects];

    if (!v34)
    {
      v37 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        [v35 ef_publicDescription];
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_2();
      }
      goto LABEL_48;
    }
    id v62 = 0;
    v37 = [v34 compressedDataUsingAlgorithm:0 error:&v62];
    id v38 = v62;

    if (!v37)
    {
      v42 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(a1 + 32) queryCountLogFilePath];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_3();
      }
      goto LABEL_47;
    }
    v39 = *(void **)(a1 + 32);
    uint64_t v40 = [v39 queryCountLogFilePath];
    [v39 _recreateFile:v40];

    v41 = [*(id *)(a1 + 32) queryCountLogFilePath];
    id v61 = 0;
    LOBYTE(v40) = [v37 writeToFile:v41 options:1 error:&v61];
    v42 = v61;

    if (v40)
    {
      if ([MEMORY[0x1E4F602E0] preferenceEnabled:38])
      {
LABEL_47:

LABEL_48:
LABEL_49:

LABEL_50:
        v17 = v56;
LABEL_51:

        id v16 = v58;
        goto LABEL_52;
      }
      v43 = [*(id *)(a1 + 32) queryCountLogFilePath];
      char v44 = DRSubmitLog();
      v45 = 0;

      if ((v44 & 1) == 0)
      {
        v46 = +[EDSQLQueryLogger log];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          [v45 ef_publicDescription];
          objc_claimAutoreleasedReturnValue();
          __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_4();
        }
      }
      v47 = *(void **)(a1 + 32);
      v48 = [v47 queryCountLogFilePath];
      [v47 _removeFile:v48];
    }
    else
    {
      v45 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(a1 + 32) queryCountLogFilePath];
        objc_claimAutoreleasedReturnValue();
        [v42 ef_publicDescription];
        objc_claimAutoreleasedReturnValue();
        __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_5();
      }
    }

    goto LABEL_47;
  }
  id v16 = +[EDSQLQueryLogger log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    [*(id *)(a1 + 32) queryLogFilePath];
    objc_claimAutoreleasedReturnValue();
    __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_9();
  }
LABEL_52:
}

- (void)_preprocessQueryInfo
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v3 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  [v3 assertIsExecuting:1];

  id v38 = [(EDSQLQueryLogger *)self _sortQueryCountDict];
  unint64_t v4 = [v38 count];
  uint64_t v5 = [MEMORY[0x1E4F60D58] currentDevice];
  int v6 = [v5 isInternal];

  if (v6)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = v38;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          id v12 = [(EDSQLQueryLogger *)self queryCountDict];
          id v13 = [v12 objectForKeyedSubscript:v11];

          [(EDSQLQueryLogger *)self _writeQueryStatistics:v13];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v8);
    }
  }
  else
  {
    double v14 = (double)v4 * 0.1;
    if (v4) {
      BOOL v15 = (unint64_t)v14 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15) {
      unint64_t v16 = 1;
    }
    else {
      unint64_t v16 = (unint64_t)v14;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v17 = v38;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v18)
    {
      unint64_t v19 = 0;
      uint64_t v20 = *(void *)v40;
      while (2)
      {
        uint64_t v21 = 0;
        unint64_t v22 = v19;
        BOOL v23 = v16 >= v19;
        unint64_t v24 = v16 - v19;
        unint64_t v37 = v22 + v18;
        if (v23) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = 0;
        }
        do
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v26 = *(void *)(*((void *)&v39 + 1) + 8 * v21);
          char v27 = [(EDSQLQueryLogger *)self queryCountDict];
          unint64_t v28 = [v27 objectForKeyedSubscript:v26];

          if (v25 == v21)
          {

            goto LABEL_28;
          }
          [(EDSQLQueryLogger *)self _writeQueryStatistics:v28];

          ++v21;
        }
        while (v18 != v21);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
        unint64_t v19 = v37;
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v16 < v4)
    {
      do
      {
        v29 = [NSNumber numberWithUnsignedInteger:v16];
        [v7 addObject:v29];

        ++v16;
      }
      while (v4 != v16);
    }
    for (unint64_t j = (unint64_t)((double)v4 * 0.01); j; --j)
    {
      uint64_t v31 = arc4random_uniform([v7 count] - 1);
      v32 = [v7 objectAtIndexedSubscript:v31];
      uint64_t v33 = [v32 unsignedIntegerValue];

      v34 = [v17 objectAtIndexedSubscript:v33];
      v35 = [(EDSQLQueryLogger *)self queryCountDict];
      v36 = [v35 objectForKeyedSubscript:v34];
      [(EDSQLQueryLogger *)self _writeQueryStatistics:v36];

      [v7 removeObjectAtIndex:v31];
    }
  }
}

- (void)_writeQueryStatistics:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  [v5 assertIsExecuting:1];

  int v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "queryCount"));
  uint64_t v7 = [MEMORY[0x1E4F60E00] bucketValueForQueryLogCount:v6 bucketValues:&unk_1F35BB5D0];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "firstRowMaxExecutionTime"));
  v23[0] = v8;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "firstRowMinExecutionTime"));
  v23[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "timePerRowMaxExecutionTime"));
  v22[0] = v11;
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "timePerRowMinExecutionTime"));
  v22[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMaxExecutionTime"));
  v21[0] = v14;
  BOOL v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "totalMinExecutionTime"));
  v21[1] = v15;
  unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  id v17 = [v4 queryCountByTransactionLabel];
  uint64_t v18 = [v4 redactedQuery];
  unint64_t v19 = [(EDSQLQueryLogger *)self _createQueryStatisticsDictionary:v18 queryCountByTransactionLabel:v17 queryCountNum:v7 firstRowExecutionTimeStats:v10 totalExecutionTimeStats:v16 timePerRowExecutionTimeStats:v13];

  uint64_t v20 = [(EDSQLQueryLogger *)self queryStatisticsArray];
  [v20 addObject:v19];
}

- (id)_sortQueryCountDict
{
  int v3 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  [v3 assertIsExecuting:1];

  id v4 = [(EDSQLQueryLogger *)self queryCountDict];
  uint64_t v5 = [v4 keysSortedByValueUsingComparator:&__block_literal_global_81];

  return v5;
}

uint64_t __39__EDSQLQueryLogger__sortQueryCountDict__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v5 queryCount];
  if (v6 <= [v4 queryCount])
  {
    unint64_t v8 = [v5 queryCount];
    if (v8 >= [v4 queryCount]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)_createQueryCountDict:(id)a3
{
  id v4 = a3;
  id v5 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  [v5 assertIsExecuting:1];

  unint64_t v6 = [(EDSQLQueryLogger *)self queryCountDict];
  uint64_t v7 = [v6 allKeys];

  unint64_t v8 = [v4 dataUsingEncoding:4];
  uint64_t v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:0];
  id v10 = v9;
  if (v9)
  {
    id v36 = v4;
    uint64_t v11 = [v9 objectForKeyedSubscript:@"redactedQuery"];
    id v38 = [v10 objectForKeyedSubscript:@"firstRowExecutionTime"];
    id v12 = [v10 objectForKeyedSubscript:@"totalExecutionTime"];
    id v13 = [v10 objectForKeyedSubscript:@"numberOfRows"];
    double v14 = NSNumber;
    [v12 doubleValue];
    double v16 = v15;
    [v13 doubleValue];
    unint64_t v37 = [v14 numberWithDouble:v16 / v17];
    uint64_t v18 = [v10 objectForKeyedSubscript:@"transactionLabel"];
    unint64_t v19 = (void *)v18;
    uint64_t v20 = @"unnamed transaction";
    if (v18) {
      uint64_t v20 = (__CFString *)v18;
    }
    uint64_t v21 = v20;

    if (v11 && v38 && v12 && v13)
    {
      if ([v7 containsObject:v11])
      {
        unint64_t v22 = [(EDSQLQueryLogger *)self queryCountDict];
        BOOL v23 = [v22 objectForKeyedSubscript:v11];

        [v23 addStatisticWithTransactionLabel:v21 firstRowExecutionTime:v38 timePerRowExecutionTime:v37 totalExecutionTime:v12];
        unint64_t v24 = [(EDSQLQueryLogger *)self queryCountDict];
        [v24 setObject:v23 forKey:v11];
      }
      else
      {
        uint64_t v33 = [[EDSQLQueryStatistics alloc] initWithQuery:v11 transactionLabel:v21 firstRowExecutionTime:v38 timePerRowExecutionTime:v37 totalExecutionTime:v12];
        uint64_t v34 = [v7 arrayByAddingObject:v11];

        v35 = [(EDSQLQueryLogger *)self queryCountDict];
        [v35 setObject:v33 forKey:v11];

        uint64_t v7 = (void *)v34;
      }
    }
    else
    {
      unint64_t v25 = +[EDSQLQueryLogger log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[EDSQLQueryLogger _createQueryCountDict:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    id v4 = v36;
  }
  else
  {
    uint64_t v11 = +[EDSQLQueryLogger log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[EDSQLQueryLogger _createQueryCountDict:]((uint64_t)v4, v11);
    }
  }
}

- (id)_createQueryStatisticsDictionary:(id)a3 queryCountByTransactionLabel:(id)a4 queryCountNum:(unint64_t)a5 firstRowExecutionTimeStats:(id)a6 totalExecutionTimeStats:(id)a7 timePerRowExecutionTimeStats:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  unint64_t v19 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  [v19 assertIsExecuting:1];

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v20 setObject:v14 forKeyedSubscript:@"redactedQuery"];
  uint64_t v21 = [(EDSQLQueryLogger *)self _bucketTransactionLabels:v15];
  [v20 setObject:v21 forKeyedSubscript:@"transactionLabel"];

  unint64_t v22 = [NSNumber numberWithUnsignedInteger:a5];
  [v20 setObject:v22 forKeyedSubscript:@"queryCount"];

  [v20 setObject:v16 forKeyedSubscript:@"firstRowExecutionTimeStats"];
  [v20 setObject:v17 forKeyedSubscript:@"totalExecutionTimeStats"];
  [v20 setObject:v18 forKeyedSubscript:@"timePerRowExecutionTimeStats"];

  return v20;
}

- (id)_bucketTransactionLabels:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v4 = [(EDSQLQueryLogger *)self queryLoggingScheduler];
  [v4 assertIsExecuting:1];

  id v5 = (void *)[v16 mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v6 = [v16 allKeys];
  obunint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v16 objectForKey:v10];
        uint64_t v12 = [MEMORY[0x1E4F60E00] bucketValueForQueryLogCount:v11 bucketValues:&unk_1F35BB5E8];
        id v13 = [NSNumber numberWithUnsignedInteger:v12];
        [v5 setObject:v13 forKeyedSubscript:v10];
      }
      unint64_t v6 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v5;
}

- (EFAssertableScheduler)queryLoggingScheduler
{
  return self->_queryLoggingScheduler;
}

- (NSString)queryLogDirectoryPath
{
  return self->_queryLogDirectoryPath;
}

- (void)setQueryLogDirectoryPath:(id)a3
{
}

- (NSString)queryLogFilePath
{
  return self->_queryLogFilePath;
}

- (void)setQueryLogFilePath:(id)a3
{
}

- (NSString)queryCountLogFilePath
{
  return self->_queryCountLogFilePath;
}

- (void)setQueryCountLogFilePath:(id)a3
{
}

- (NSFileHandle)rawQueryLogInputFileHandle
{
  return self->_rawQueryLogInputFileHandle;
}

- (void)setRawQueryLogInputFileHandle:(id)a3
{
}

- (NSMutableDictionary)queryCountDict
{
  return self->_queryCountDict;
}

- (void)setQueryCountDict:(id)a3
{
}

- (NSMutableArray)queryStatisticsArray
{
  return self->_queryStatisticsArray;
}

- (void)setQueryStatisticsArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStatisticsArray, 0);
  objc_storeStrong((id *)&self->_queryCountDict, 0);
  objc_storeStrong((id *)&self->_rawQueryLogInputFileHandle, 0);
  objc_storeStrong((id *)&self->_queryCountLogFilePath, 0);
  objc_storeStrong((id *)&self->_queryLogFilePath, 0);
  objc_storeStrong((id *)&self->_queryLogDirectoryPath, 0);

  objc_storeStrong((id *)&self->_queryLoggingScheduler, 0);
}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to write raw log: %{public}@", v5);
}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to convert raw log to json data: %{public}@", v5);
}

void __121__EDSQLQueryLogger_logQueryString_label_firstRowExecutionTimeInNanoseconds_totalExecutionTimeInNanoseconds_numberOfRows___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createQueryLogDirectoryPath
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to create directory at path: %@", v5);
}

- (void)_removeFile:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_2(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to remove processed file at %@ due to error: %{public}@", v4, v5);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to convert query statistics array to NSData due to error: %{public}@", v5);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to compress file at %@ due to error: %{public}@", v5, v6);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to submit logs to diagnostic pipeline %{public}@", v5);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to write to file with compressed data at %@ due to error: %{public}@", v5, v6);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_6(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Detected empty query log", buf, 2u);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to read query log file at file path: %@", v5);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Remove file failed in the middle of preprocessing: %@", (uint8_t *)&v2, 0xCu);
}

void __38__EDSQLQueryLogger_submitQueryLogData__block_invoke_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to find query log file at file path: %@", v5);
}

- (void)_createQueryCountDict:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Failed to find valid query for log line: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_createQueryCountDict:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end