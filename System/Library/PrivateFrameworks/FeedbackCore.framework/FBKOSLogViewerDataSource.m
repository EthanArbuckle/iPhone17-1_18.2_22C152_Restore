@interface FBKOSLogViewerDataSource
- (BOOL)foundCorruptDate;
- (BOOL)gotDelegateCallbackInLastFetch;
- (BOOL)hasMoreLogs;
- (BOOL)isCurrentPageComplete;
- (BOOL)lastFetchReturnedZeroEvents;
- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5;
- (BOOL)shouldContinue;
- (FBKOSLogViewerDataSource)initWithArchive:(id)a3 pageSize:(int64_t)a4 pageCompletion:(id)a5 error:(id)a6;
- (NSDate)oldestEventTimestamp;
- (NSMutableArray)savedEvents;
- (NSURL)logArchivePath;
- (OSLogPersistence)loggerLib;
- (id)fetchErrorBlock;
- (id)logAtIndex:(int64_t)a3;
- (id)loggerLibWithArchive:(id)a3 pageSize:(unint64_t)a4;
- (id)pageFetchCompletion;
- (int64_t)fetchWatchdog;
- (int64_t)numberOfLogs;
- (int64_t)pageSize;
- (int64_t)pendingNextPageRequest;
- (unint64_t)eventCountForCurrentPage;
- (unint64_t)numberOfEmptyFetches;
- (unint64_t)numberOfEventsInLastFetch;
- (unint64_t)oldestEventMachTime;
- (void)dealloc;
- (void)fetchNextBatch;
- (void)nextPage;
- (void)nextPageForReal;
- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4;
- (void)prepareForNextDateRangeFetch;
- (void)prepareForNextPage;
- (void)setEventCountForCurrentPage:(unint64_t)a3;
- (void)setFetchErrorBlock:(id)a3;
- (void)setFetchWatchdog:(int64_t)a3;
- (void)setFoundCorruptDate:(BOOL)a3;
- (void)setGotDelegateCallbackInLastFetch:(BOOL)a3;
- (void)setLogArchivePath:(id)a3;
- (void)setLoggerLib:(id)a3;
- (void)setNumberOfEmptyFetches:(unint64_t)a3;
- (void)setNumberOfEventsInLastFetch:(unint64_t)a3;
- (void)setOldestEventMachTime:(unint64_t)a3;
- (void)setOldestEventTimestamp:(id)a3;
- (void)setPageFetchCompletion:(id)a3;
- (void)setPageSize:(int64_t)a3;
- (void)setPendingNextPageRequest:(int64_t)a3;
- (void)setSavedEvents:(id)a3;
@end

@implementation FBKOSLogViewerDataSource

- (FBKOSLogViewerDataSource)initWithArchive:(id)a3 pageSize:(int64_t)a4 pageCompletion:(id)a5 error:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)FBKOSLogViewerDataSource;
  v14 = [(FBKOSLogViewerDataSource *)&v37 init];
  if (!v14)
  {
LABEL_11:
    v34 = v14;
    goto LABEL_15;
  }
  id v36 = 0;
  int v15 = [v11 checkResourceIsReachableAndReturnError:&v36];
  id v16 = v36;
  v17 = Log_8();
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v11 path];
      *(_DWORD *)buf = 138543362;
      v39 = v19;
      _os_log_impl(&dword_22A36D000, v18, OS_LOG_TYPE_DEFAULT, "Initializing log viewer with log archive [%{public}@]", buf, 0xCu);
    }
    v20 = _Block_copy(v12);
    id pageFetchCompletion = v14->_pageFetchCompletion;
    v14->_id pageFetchCompletion = v20;

    v22 = _Block_copy(v13);
    id fetchErrorBlock = v14->_fetchErrorBlock;
    v14->_id fetchErrorBlock = v22;

    objc_storeStrong((id *)&v14->_logArchivePath, a3);
    v14->_pageSize = a4;
    uint64_t v24 = [(FBKOSLogViewerDataSource *)v14 loggerLibWithArchive:v11 pageSize:[(FBKOSLogViewerDataSource *)v14 pageSize]];
    loggerLib = v14->_loggerLib;
    v14->_loggerLib = (OSLogPersistence *)v24;

    [(OSLogPersistence *)v14->_loggerLib setDelegate:v14];
    uint64_t v26 = objc_opt_new();
    savedEvents = v14->_savedEvents;
    v14->_savedEvents = (NSMutableArray *)v26;

    v14->_oldestEventMachTime = 0;
    v14->_gotDelegateCallbackInLastFetch = 0;
    v14->_numberOfEventsInLastFetch = 0;
    v14->_numberOfEmptyFetches = 0;
    v14->_pendingNextPageRequest = 0;
    v14->_fetchWatchdog = 0;
    v28 = [(FBKOSLogViewerDataSource *)v14 fetchErrorBlock];

    if (v28)
    {
      v29 = [(FBKOSLogViewerDataSource *)v14 loggerLib];
      char v30 = objc_msgSend(v29, "fba_hasValidStartAndEndDates");

      if ((v30 & 1) == 0)
      {
        [(FBKOSLogViewerDataSource *)v14 setFoundCorruptDate:1];
        v31 = Log_8();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[FBKOSLogViewerDataSource initWithArchive:pageSize:pageCompletion:error:](v14, v31);
        }

        v32 = [(FBKOSLogViewerDataSource *)v14 fetchErrorBlock];
        v33 = FBKErrorOfType(-1008);
        ((void (**)(void, void *))v32)[2](v32, v33);
      }
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[FBKOSLogViewerDataSource initWithArchive:pageSize:pageCompletion:error:](v14, v16, v18);
  }

  v34 = 0;
LABEL_15:

  return v34;
}

- (void)dealloc
{
  [(FBKOSLogViewerDataSource *)self setLoggerLib:0];
  v3.receiver = self;
  v3.super_class = (Class)FBKOSLogViewerDataSource;
  [(FBKOSLogViewerDataSource *)&v3 dealloc];
}

- (void)nextPage
{
  objc_super v3 = [(FBKOSLogViewerDataSource *)self loggerLib];
  int v4 = objc_msgSend(v3, "fba_hasValidStartAndEndDates");

  if (v4)
  {
    v5 = Log_8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "Next Page", v6, 2u);
    }

    if ([(FBKOSLogViewerDataSource *)self pendingNextPageRequest] < 1) {
      [(FBKOSLogViewerDataSource *)self nextPageForReal];
    }
    else {
      [(FBKOSLogViewerDataSource *)self setPendingNextPageRequest:[(FBKOSLogViewerDataSource *)self pendingNextPageRequest] + 1];
    }
  }
}

- (void)nextPageForReal
{
  [(FBKOSLogViewerDataSource *)self prepareForNextPage];

  [(FBKOSLogViewerDataSource *)self fetchNextBatch];
}

- (int64_t)numberOfLogs
{
  v2 = [(FBKOSLogViewerDataSource *)self savedEvents];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)logAtIndex:(int64_t)a3
{
  int v4 = [(FBKOSLogViewerDataSource *)self savedEvents];
  v5 = [v4 objectAtIndexedSubscript:a3];
  v6 = objc_msgSend(v5, "fba_toString");

  return v6;
}

- (BOOL)hasMoreLogs
{
  int64_t v3 = [(FBKOSLogViewerDataSource *)self oldestEventTimestamp];

  if (!v3) {
    return 1;
  }
  int v4 = [(FBKOSLogViewerDataSource *)self loggerLib];

  if (!v4) {
    return 0;
  }
  v5 = [(FBKOSLogViewerDataSource *)self oldestEventTimestamp];
  v6 = [(FBKOSLogViewerDataSource *)self loggerLib];
  v7 = [v6 endDate];
  BOOL v8 = [v5 compare:v7] != 0;

  return v8;
}

- (void)prepareForNextPage
{
  [(FBKOSLogViewerDataSource *)self setEventCountForCurrentPage:0];
  [(FBKOSLogViewerDataSource *)self setNumberOfEmptyFetches:0];

  [(FBKOSLogViewerDataSource *)self prepareForNextDateRangeFetch];
}

- (void)prepareForNextDateRangeFetch
{
  [(FBKOSLogViewerDataSource *)self setNumberOfEventsInLastFetch:0];
  [(FBKOSLogViewerDataSource *)self setGotDelegateCallbackInLastFetch:0];

  [(FBKOSLogViewerDataSource *)self setFetchWatchdog:0];
}

- (BOOL)lastFetchReturnedZeroEvents
{
  if ([(FBKOSLogViewerDataSource *)self numberOfEventsInLastFetch]) {
    return 0;
  }

  return [(FBKOSLogViewerDataSource *)self gotDelegateCallbackInLastFetch];
}

- (void)fetchNextBatch
{
  [a1 numberOfEmptyFetches];
  OUTLINED_FUNCTION_1_6(&dword_22A36D000, v1, v2, "Empty page count: [%lu]", v3, v4, v5, v6, 0);
}

- (id)loggerLibWithArchive:(id)a3 pageSize:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)MEMORY[0x263F52758];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setOptions:1];
  [v7 setBatchSize:a4];
  [v7 setLogArchive:v6];

  BOOL v8 = Log_8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 archiveVersion];
    v10 = [v7 startDate];
    id v11 = objc_msgSend(v10, "fba_toString");
    id v12 = [v7 endDate];
    id v13 = objc_msgSend(v12, "fba_toString");
    int v15 = 134218498;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    v18 = v11;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Log archive version is [%lu] start date: [%{public}@] end date [%{public}@]", (uint8_t *)&v15, 0x20u);
  }

  return v7;
}

- (BOOL)isCurrentPageComplete
{
  unint64_t v3 = [(FBKOSLogViewerDataSource *)self eventCountForCurrentPage];
  return v3 >= [(FBKOSLogViewerDataSource *)self pageSize];
}

- (BOOL)shouldContinue
{
  if ([(FBKOSLogViewerDataSource *)self isCurrentPageComplete]) {
    return 0;
  }

  return [(FBKOSLogViewerDataSource *)self hasMoreLogs];
}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  [(FBKOSLogViewerDataSource *)self setGotDelegateCallbackInLastFetch:1];
  uint64_t v9 = Log_8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FBKOSLogViewerDataSource persistence:results:error:]();
  }

  if ([v7 count])
  {
    if (!v8)
    {
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v14 = v7;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
LABEL_14:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          __int16 v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
          unint64_t v20 = [(FBKOSLogViewerDataSource *)self eventCountForCurrentPage];
          unint64_t v21 = [(id)v12 count] + v20;
          if (v21 >= [(FBKOSLogViewerDataSource *)self pageSize]) {
            break;
          }
          unint64_t v22 = [v19 machTimestamp];
          if (v22 > [(FBKOSLogViewerDataSource *)self oldestEventMachTime])
          {
            [(id)v12 addObject:v19];
            -[FBKOSLogViewerDataSource setOldestEventMachTime:](self, "setOldestEventMachTime:", [v19 machTimestamp]);
            v23 = [v19 timestamp];
            [(FBKOSLogViewerDataSource *)self setOldestEventTimestamp:v23];
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v16) {
              goto LABEL_14;
            }
            break;
          }
        }
      }

      -[FBKOSLogViewerDataSource setEventCountForCurrentPage:](self, "setEventCountForCurrentPage:", -[FBKOSLogViewerDataSource eventCountForCurrentPage](self, "eventCountForCurrentPage")+ [(id)v12 count]);
      -[FBKOSLogViewerDataSource setNumberOfEventsInLastFetch:](self, "setNumberOfEventsInLastFetch:", [(id)v12 count]);
      uint64_t v24 = Log_8();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[FBKOSLogViewerDataSource persistence:results:error:]((void *)v12, v24);
      }

      v25 = [(FBKOSLogViewerDataSource *)self savedEvents];
      uint64_t v26 = (void *)[(id)v12 copy];
      [v25 addObjectsFromArray:v26];

      BOOL v13 = [(FBKOSLogViewerDataSource *)self shouldContinue];
      goto LABEL_25;
    }
    v10 = Log_8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FBKOSLogViewerDataSource persistence:results:error:]((uint64_t)v8, v10);
    }

    id v11 = [(FBKOSLogViewerDataSource *)self fetchErrorBlock];

    if (!v11)
    {
      BOOL v13 = 0;
      goto LABEL_26;
    }
    uint64_t v12 = [(FBKOSLogViewerDataSource *)self fetchErrorBlock];
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v8);
  }
  else
  {
    uint64_t v12 = Log_8();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "No more results, done", buf, 2u);
    }
  }
  BOOL v13 = 0;
LABEL_25:

LABEL_26:
  return v13;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  if ([(FBKOSLogViewerDataSource *)self gotDelegateCallbackInLastFetch]
    && ![(FBKOSLogViewerDataSource *)self lastFetchReturnedZeroEvents])
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(FBKOSLogViewerDataSource *)self numberOfEmptyFetches] + 1;
  }
  [(FBKOSLogViewerDataSource *)self setNumberOfEmptyFetches:v5];
  uint64_t v6 = [(FBKOSLogViewerDataSource *)self fetchWatchdog];
  [(FBKOSLogViewerDataSource *)self setFetchWatchdog:v6 + 1];
  if (v6 < 1000)
  {
    BOOL v10 = [(FBKOSLogViewerDataSource *)self shouldContinue];
    id v11 = Log_8();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:]();
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__FBKOSLogViewerDataSource_persistenceDidFinishReadingForStartDate_endDate___block_invoke;
      block[3] = &unk_264873FE8;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      if (v12) {
        -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:].cold.5();
      }

      BOOL v13 = [(FBKOSLogViewerDataSource *)self pageFetchCompletion];

      if (v13)
      {
        id v14 = Log_8();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:].cold.4(self);
        }

        uint64_t v15 = [(FBKOSLogViewerDataSource *)self pageFetchCompletion];
        ((void (**)(void, FBKOSLogViewerDataSource *))v15)[2](v15, self);
      }
      if ([(FBKOSLogViewerDataSource *)self pendingNextPageRequest] >= 1)
      {
        uint64_t v16 = Log_8();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:]();
        }

        [(FBKOSLogViewerDataSource *)self setPendingNextPageRequest:[(FBKOSLogViewerDataSource *)self pendingNextPageRequest] - 1];
        [(FBKOSLogViewerDataSource *)self nextPageForReal];
      }
    }
  }
  else
  {
    [(FBKOSLogViewerDataSource *)self setFoundCorruptDate:1];
    id v7 = Log_8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FBKOSLogViewerDataSource persistenceDidFinishReadingForStartDate:endDate:]();
    }

    id v8 = [(FBKOSLogViewerDataSource *)self fetchErrorBlock];
    uint64_t v9 = FBKErrorOfType(-1008);
    ((void (**)(void, void *))v8)[2](v8, v9);
  }
}

uint64_t __76__FBKOSLogViewerDataSource_persistenceDidFinishReadingForStartDate_endDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchNextBatch];
}

- (NSMutableArray)savedEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSavedEvents:(id)a3
{
}

- (BOOL)foundCorruptDate
{
  return self->_foundCorruptDate;
}

- (void)setFoundCorruptDate:(BOOL)a3
{
  self->_foundCorruptDate = a3;
}

- (OSLogPersistence)loggerLib
{
  return (OSLogPersistence *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoggerLib:(id)a3
{
}

- (NSURL)logArchivePath
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogArchivePath:(id)a3
{
}

- (NSDate)oldestEventTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOldestEventTimestamp:(id)a3
{
}

- (unint64_t)numberOfEventsInLastFetch
{
  return self->_numberOfEventsInLastFetch;
}

- (void)setNumberOfEventsInLastFetch:(unint64_t)a3
{
  self->_numberOfEventsInLastFetch = a3;
}

- (unint64_t)numberOfEmptyFetches
{
  return self->_numberOfEmptyFetches;
}

- (void)setNumberOfEmptyFetches:(unint64_t)a3
{
  self->_numberOfEmptyFetches = a3;
}

- (BOOL)gotDelegateCallbackInLastFetch
{
  return self->_gotDelegateCallbackInLastFetch;
}

- (void)setGotDelegateCallbackInLastFetch:(BOOL)a3
{
  self->_gotDelegateCallbackInLastFetch = a3;
}

- (unint64_t)eventCountForCurrentPage
{
  return self->_eventCountForCurrentPage;
}

- (void)setEventCountForCurrentPage:(unint64_t)a3
{
  self->_eventCountForCurrentPage = a3;
}

- (unint64_t)oldestEventMachTime
{
  return self->_oldestEventMachTime;
}

- (void)setOldestEventMachTime:(unint64_t)a3
{
  self->_oldestEventMachTime = a3;
}

- (id)pageFetchCompletion
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setPageFetchCompletion:(id)a3
{
}

- (id)fetchErrorBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setFetchErrorBlock:(id)a3
{
}

- (int64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(int64_t)a3
{
  self->_pageSize = a3;
}

- (int64_t)pendingNextPageRequest
{
  return self->_pendingNextPageRequest;
}

- (void)setPendingNextPageRequest:(int64_t)a3
{
  self->_pendingNextPageRequest = a3;
}

- (int64_t)fetchWatchdog
{
  return self->_fetchWatchdog;
}

- (void)setFetchWatchdog:(int64_t)a3
{
  self->_fetchWatchdog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchErrorBlock, 0);
  objc_storeStrong(&self->_pageFetchCompletion, 0);
  objc_storeStrong((id *)&self->_oldestEventTimestamp, 0);
  objc_storeStrong((id *)&self->_logArchivePath, 0);
  objc_storeStrong((id *)&self->_loggerLib, 0);

  objc_storeStrong((id *)&self->_savedEvents, 0);
}

- (void)initWithArchive:(void *)a1 pageSize:(NSObject *)a2 pageCompletion:error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 loggerLib];
  unint64_t v5 = [v4 startDate];
  uint64_t v6 = objc_msgSend(v5, "fba_toString");
  id v7 = [a1 loggerLib];
  id v8 = [v7 endDate];
  uint64_t v9 = objc_msgSend(v8, "fba_toString");
  int v10 = 138543618;
  id v11 = v6;
  __int16 v12 = 2114;
  BOOL v13 = v9;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Log Archive has invalid dates. Start Date [%{public}@], end date: [%{public}@]", (uint8_t *)&v10, 0x16u);
}

- (void)initWithArchive:(NSObject *)a3 pageSize:pageCompletion:error:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a1 logArchivePath];
  uint64_t v6 = [a2 description];
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  int v10 = v6;
  _os_log_error_impl(&dword_22A36D000, a3, OS_LOG_TYPE_ERROR, "Could not initialize FBKOSLogViewerDataSource with logarchive file: [%{public}@] error: [%{public}@]", (uint8_t *)&v7, 0x16u);
}

- (void)persistence:(void *)a1 results:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "Fetched [%i] log events from data range batch", (uint8_t *)v3, 8u);
}

- (void)persistence:(uint64_t)a1 results:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error fetching page [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)persistence:results:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Got log events", v2, v3, v4, v5, v6);
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22A36D000, v0, OS_LOG_TYPE_ERROR, "Too many fetches. Aborting", v1, 2u);
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Reading for date range finished, will read another batch", v2, v3, v4, v5, v6);
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Reading for date range finished, done reading, next page requested ", v2, v3, v4, v5, v6);
}

- (void)persistenceDidFinishReadingForStartDate:(void *)a1 endDate:.cold.4(void *a1)
{
  uint64_t v1 = [a1 savedEvents];
  [v1 count];
  OUTLINED_FUNCTION_1_6(&dword_22A36D000, v2, v3, "Log events count: [%lu] on completion block", v4, v5, v6, v7, 0);
}

- (void)persistenceDidFinishReadingForStartDate:endDate:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Reading for date range finished, done reading ", v2, v3, v4, v5, v6);
}

@end