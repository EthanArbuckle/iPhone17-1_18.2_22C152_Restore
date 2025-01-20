@interface FBAOSLogViewerDataSource
- (BOOL)foundCorruptDate;
- (BOOL)gotDelegateCallbackInLastFetch;
- (BOOL)hasMoreLogs;
- (BOOL)isCurrentPageComplete;
- (BOOL)lastFetchReturnedZeroEvents;
- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5;
- (BOOL)shouldContinue;
- (FBAOSLogViewerDataSource)initWithArchive:(id)a3 pageSize:(int64_t)a4 pageCompletion:(id)a5 error:(id)a6;
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

@implementation FBAOSLogViewerDataSource

- (FBAOSLogViewerDataSource)initWithArchive:(id)a3 pageSize:(int64_t)a4 pageCompletion:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)FBAOSLogViewerDataSource;
  v14 = [(FBAOSLogViewerDataSource *)&v37 init];
  if (!v14)
  {
LABEL_11:
    v34 = v14;
    goto LABEL_15;
  }
  id v36 = 0;
  unsigned int v15 = [v11 checkResourceIsReachableAndReturnError:&v36];
  id v16 = v36;
  v17 = sub_100016C8C();
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v11 path];
      *(_DWORD *)buf = 138543362;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Initializing log viewer with log archive [%{public}@]", buf, 0xCu);
    }
    id v20 = objc_retainBlock(v12);
    id pageFetchCompletion = v14->_pageFetchCompletion;
    v14->_id pageFetchCompletion = v20;

    id v22 = objc_retainBlock(v13);
    id fetchErrorBlock = v14->_fetchErrorBlock;
    v14->_id fetchErrorBlock = v22;

    objc_storeStrong((id *)&v14->_logArchivePath, a3);
    v14->_pageSize = a4;
    uint64_t v24 = [(FBAOSLogViewerDataSource *)v14 loggerLibWithArchive:v11 pageSize:[(FBAOSLogViewerDataSource *)v14 pageSize]];
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
    v28 = [(FBAOSLogViewerDataSource *)v14 fetchErrorBlock];

    if (v28)
    {
      v29 = [(FBAOSLogViewerDataSource *)v14 loggerLib];
      unsigned __int8 v30 = [v29 fba_hasValidStartAndEndDates];

      if ((v30 & 1) == 0)
      {
        [(FBAOSLogViewerDataSource *)v14 setFoundCorruptDate:1];
        v31 = sub_100016C8C();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_1000A4A94(v14, v31);
        }

        v32 = [(FBAOSLogViewerDataSource *)v14 fetchErrorBlock];
        v33 = sub_100033F70(-1008);
        ((void (**)(void, void *))v32)[2](v32, v33);
      }
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1000A4BA8(v14, v16, v18);
  }

  v34 = 0;
LABEL_15:

  return v34;
}

- (void)dealloc
{
  [(FBAOSLogViewerDataSource *)self setLoggerLib:0];
  v3.receiver = self;
  v3.super_class = (Class)FBAOSLogViewerDataSource;
  [(FBAOSLogViewerDataSource *)&v3 dealloc];
}

- (void)nextPage
{
  objc_super v3 = [(FBAOSLogViewerDataSource *)self loggerLib];
  unsigned int v4 = [v3 fba_hasValidStartAndEndDates];

  if (v4)
  {
    v5 = sub_100016C8C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Next Page", v6, 2u);
    }

    if ([(FBAOSLogViewerDataSource *)self pendingNextPageRequest] < 1) {
      [(FBAOSLogViewerDataSource *)self nextPageForReal];
    }
    else {
      [(FBAOSLogViewerDataSource *)self setPendingNextPageRequest:(char *)[(FBAOSLogViewerDataSource *)self pendingNextPageRequest] + 1];
    }
  }
}

- (void)nextPageForReal
{
  [(FBAOSLogViewerDataSource *)self prepareForNextPage];

  [(FBAOSLogViewerDataSource *)self fetchNextBatch];
}

- (int64_t)numberOfLogs
{
  v2 = [(FBAOSLogViewerDataSource *)self savedEvents];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (id)logAtIndex:(int64_t)a3
{
  unsigned int v4 = [(FBAOSLogViewerDataSource *)self savedEvents];
  v5 = [v4 objectAtIndexedSubscript:a3];
  v6 = [v5 fba_toString];

  return v6;
}

- (BOOL)hasMoreLogs
{
  id v3 = [(FBAOSLogViewerDataSource *)self oldestEventTimestamp];

  if (!v3) {
    return 1;
  }
  unsigned int v4 = [(FBAOSLogViewerDataSource *)self loggerLib];

  if (!v4) {
    return 0;
  }
  v5 = [(FBAOSLogViewerDataSource *)self oldestEventTimestamp];
  v6 = [(FBAOSLogViewerDataSource *)self loggerLib];
  v7 = [v6 endDate];
  BOOL v8 = [v5 compare:v7] != 0;

  return v8;
}

- (void)prepareForNextPage
{
  [(FBAOSLogViewerDataSource *)self setEventCountForCurrentPage:0];
  [(FBAOSLogViewerDataSource *)self setNumberOfEmptyFetches:0];

  [(FBAOSLogViewerDataSource *)self prepareForNextDateRangeFetch];
}

- (void)prepareForNextDateRangeFetch
{
  [(FBAOSLogViewerDataSource *)self setNumberOfEventsInLastFetch:0];
  [(FBAOSLogViewerDataSource *)self setGotDelegateCallbackInLastFetch:0];

  [(FBAOSLogViewerDataSource *)self setFetchWatchdog:0];
}

- (BOOL)lastFetchReturnedZeroEvents
{
  if ([(FBAOSLogViewerDataSource *)self numberOfEventsInLastFetch]) {
    return 0;
  }

  return [(FBAOSLogViewerDataSource *)self gotDelegateCallbackInLastFetch];
}

- (void)fetchNextBatch
{
  id v3 = sub_100016C8C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000A4C6C(self);
  }

  unsigned int v4 = [(FBAOSLogViewerDataSource *)self oldestEventTimestamp];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(FBAOSLogViewerDataSource *)self loggerLib];
    id v6 = [v7 startDate];
  }
  double v8 = 10.0;
  if ([(FBAOSLogViewerDataSource *)self numberOfEmptyFetches] >= 2) {
    double v8 = fmin(__exp10((double)[(FBAOSLogViewerDataSource *)self numberOfEmptyFetches]), 1.79769313e308);
  }
  v9 = sub_100016C8C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v15 = 134217984;
    double v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Time delta: [%f]", (uint8_t *)&v15, 0xCu);
  }

  v10 = [v6 dateByAddingTimeInterval:v8];
  id v11 = sub_100016C8C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v6 fba_toString];
    id v13 = [v10 fba_toString];
    int v15 = 138543618;
    double v16 = *(double *)&v12;
    __int16 v17 = 2114;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "start date: [%{public}@]  end date: [%{public}@] ", (uint8_t *)&v15, 0x16u);
  }
  [(FBAOSLogViewerDataSource *)self prepareForNextDateRangeFetch];
  v14 = [(FBAOSLogViewerDataSource *)self loggerLib];
  [v14 fetchFromStartDate:v6 toEndDate:v10];
}

- (id)loggerLibWithArchive:(id)a3 pageSize:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)OSLogPersistence);
  [v6 setOptions:1];
  [v6 setBatchSize:a4];
  [v6 setLogArchive:v5];

  v7 = sub_100016C8C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 archiveVersion];
    v9 = [v6 startDate];
    v10 = [v9 fba_toString];
    id v11 = [v6 endDate];
    id v12 = [v11 fba_toString];
    int v14 = 134218498;
    id v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Log archive version is [%lu] start date: [%{public}@] end date [%{public}@]", (uint8_t *)&v14, 0x20u);
  }

  return v6;
}

- (BOOL)isCurrentPageComplete
{
  unint64_t v3 = [(FBAOSLogViewerDataSource *)self eventCountForCurrentPage];
  return v3 >= [(FBAOSLogViewerDataSource *)self pageSize];
}

- (BOOL)shouldContinue
{
  if ([(FBAOSLogViewerDataSource *)self isCurrentPageComplete]) {
    return 0;
  }

  return [(FBAOSLogViewerDataSource *)self hasMoreLogs];
}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(FBAOSLogViewerDataSource *)self setGotDelegateCallbackInLastFetch:1];
  v9 = sub_100016C8C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000A4DEC();
  }

  if ([v7 count])
  {
    if (!v8)
    {
      id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v14 = v7;
      id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v29;
LABEL_14:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
          unint64_t v20 = [(FBAOSLogViewerDataSource *)self eventCountForCurrentPage];
          v21 = (char *)[v12 count] + v20;
          if (v21 >= (char *)[(FBAOSLogViewerDataSource *)self pageSize]) {
            break;
          }
          id v22 = [v19 machTimestamp];
          if (v22 > (id)[(FBAOSLogViewerDataSource *)self oldestEventMachTime])
          {
            [v12 addObject:v19];
            -[FBAOSLogViewerDataSource setOldestEventMachTime:](self, "setOldestEventMachTime:", [v19 machTimestamp]);
            v23 = [v19 timestamp];
            [(FBAOSLogViewerDataSource *)self setOldestEventTimestamp:v23];
          }
          if (v16 == (id)++v18)
          {
            id v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v16) {
              goto LABEL_14;
            }
            break;
          }
        }
      }

      [(FBAOSLogViewerDataSource *)self setEventCountForCurrentPage:(char *)[v12 count]+ [(FBAOSLogViewerDataSource *)self eventCountForCurrentPage]];
      [(FBAOSLogViewerDataSource *)self setNumberOfEventsInLastFetch:[v12 count]];
      uint64_t v24 = sub_100016C8C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_1000A4CE8(v12, v24);
      }

      v25 = [(FBAOSLogViewerDataSource *)self savedEvents];
      id v26 = [v12 copy];
      [v25 addObjectsFromArray:v26];

      BOOL v13 = [(FBAOSLogViewerDataSource *)self shouldContinue];
      goto LABEL_25;
    }
    v10 = sub_100016C8C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000A4D74((uint64_t)v8, v10);
    }

    id v11 = [(FBAOSLogViewerDataSource *)self fetchErrorBlock];

    if (!v11)
    {
      BOOL v13 = 0;
      goto LABEL_26;
    }
    id v12 = [(FBAOSLogViewerDataSource *)self fetchErrorBlock];
    ((void (*)(NSObject *, id))v12[2].isa)(v12, v8);
  }
  else
  {
    id v12 = sub_100016C8C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No more results, done", buf, 2u);
    }
  }
  BOOL v13 = 0;
LABEL_25:

LABEL_26:
  return v13;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  if ([(FBAOSLogViewerDataSource *)self gotDelegateCallbackInLastFetch]
    && ![(FBAOSLogViewerDataSource *)self lastFetchReturnedZeroEvents])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = (char *)[(FBAOSLogViewerDataSource *)self numberOfEmptyFetches] + 1;
  }
  [(FBAOSLogViewerDataSource *)self setNumberOfEmptyFetches:v5];
  uint64_t v6 = [(FBAOSLogViewerDataSource *)self fetchWatchdog];
  [(FBAOSLogViewerDataSource *)self setFetchWatchdog:v6 + 1];
  if (v6 < 1000)
  {
    unsigned int v10 = [(FBAOSLogViewerDataSource *)self shouldContinue];
    id v11 = sub_100016C8C();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        sub_1000A4E60();
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100017A30;
      block[3] = &unk_1000F2518;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      if (v12) {
        sub_1000A4F54();
      }

      BOOL v13 = [(FBAOSLogViewerDataSource *)self pageFetchCompletion];

      if (v13)
      {
        id v14 = sub_100016C8C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_1000A4EC8(self);
        }

        id v15 = [(FBAOSLogViewerDataSource *)self pageFetchCompletion];
        ((void (**)(void, FBAOSLogViewerDataSource *))v15)[2](v15, self);
      }
      if ([(FBAOSLogViewerDataSource *)self pendingNextPageRequest] >= 1)
      {
        id v16 = sub_100016C8C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_1000A4E94();
        }

        [(FBAOSLogViewerDataSource *)self setPendingNextPageRequest:(char *)[(FBAOSLogViewerDataSource *)self pendingNextPageRequest] - 1];
        [(FBAOSLogViewerDataSource *)self nextPageForReal];
      }
    }
  }
  else
  {
    [(FBAOSLogViewerDataSource *)self setFoundCorruptDate:1];
    id v7 = sub_100016C8C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000A4E20();
    }

    id v8 = [(FBAOSLogViewerDataSource *)self fetchErrorBlock];
    v9 = sub_100033F70(-1008);
    ((void (**)(void, void *))v8)[2](v8, v9);
  }
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

@end