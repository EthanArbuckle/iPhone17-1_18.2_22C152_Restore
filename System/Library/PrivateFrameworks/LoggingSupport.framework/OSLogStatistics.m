@interface OSLogStatistics
- (NSDate)end;
- (NSDate)start;
- (NSError)processingError;
- (NSString)archivePath;
- (OSLogEventSource)eventSource;
- (OSLogStatistics)initWithLogArchivePath:(id)a3 errorOut:(id *)a4;
- (OSLogStatistics)initWithLogArchivePath:(id)a3 forRelativePaths:(id)a4 errorOut:(id *)a5;
- (id)_initializeEventSourceWithPaths:(id)a3;
- (id)aggregationForStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 withOptions:(unint64_t)a6 errorOut:(id *)a7;
- (void)setEventSource:(id)a3;
- (void)setProcessingError:(id)a3;
@end

@implementation OSLogStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_processingError, 0);
  objc_storeStrong((id *)&self->_eventSource, 0);
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (void)setProcessingError:(id)a3
{
}

- (NSError)processingError
{
  return self->_processingError;
}

- (void)setEventSource:(id)a3
{
}

- (OSLogEventSource)eventSource
{
  return self->_eventSource;
}

- (id)aggregationForStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 withOptions:(unint64_t)a6 errorOut:(id *)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = [[OSLogEventStream alloc] initWithSource:self->_eventSource];
  [(OSLogEventStreamBase *)v15 setFlags:20];
  v16 = _logHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    id v44 = v14;
    __int16 v45 = 2048;
    unint64_t v46 = a6;
    _os_log_impl(&dword_1A112E000, v16, OS_LOG_TYPE_DEFAULT, "Starting aggregation with start date : %@, end date : %@, predicate: %@, and flags %lu", buf, 0x2Au);
  }

  if (a6) {
    [(OSLogEventStreamBase *)v15 setFlags:[(OSLogEventStreamBase *)v15 flags] | 1];
  }
  if ((a6 & 2) != 0) {
    [(OSLogEventStreamBase *)v15 setFlags:[(OSLogEventStreamBase *)v15 flags] ^ 2];
  }
  if ((a6 & 4) != 0) {
    [(OSLogEventStreamBase *)v15 setFlags:[(OSLogEventStreamBase *)v15 flags] | 0x20];
  }
  if ((a6 & 8) != 0) {
    [(OSLogEventStreamBase *)v15 setFlags:[(OSLogEventStreamBase *)v15 flags] | 0x200];
  }
  [(OSLogEventStream *)v15 setFilterPredicate:v14];
  if (v13)
  {
    [v13 timeIntervalSince1970];
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = [[OSLogStatisticsAggregation alloc] initWithLabel:@"All" tier:1];
  objc_initWeak(&location, v15);
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke;
  v36[3] = &unk_1E5A42C00;
  id v21 = v13;
  id v37 = v21;
  v39[1] = v18;
  objc_copyWeak(v39, &location);
  v22 = v19;
  v38 = v22;
  [(OSLogEventStreamBase *)v15 setEventHandler:v36];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v44) = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke_2;
  v33[3] = &unk_1E5A42C28;
  v35 = buf;
  v23 = v20;
  v34 = v23;
  [(OSLogEventStreamBase *)v15 setInvalidationHandler:v33];
  v24 = v12;
  if (!v12)
  {
    v24 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  [(OSLogEventStream *)v15 activateStreamFromDate:v24];
  if (!v12) {

  }
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  v25 = _logHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_1A112E000, v25, OS_LOG_TYPE_DEFAULT, "Finished enumerating all events.", v41, 2u);
  }

  v26 = [(OSLogStatistics *)self processingError];

  if (v26)
  {
    v27 = _logHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = [(OSLogStatistics *)self processingError];
      *(_DWORD *)v41 = 138412290;
      uint64_t v42 = v31;
      v32 = (void *)v31;
      _os_log_error_impl(&dword_1A112E000, v27, OS_LOG_TYPE_ERROR, "Encountered error during enumeration of tracepoints: %@", v41, 0xCu);
    }
    if (a7)
    {
      *a7 = [(OSLogStatistics *)self processingError];
    }
  }
  v28 = v34;
  v29 = v22;

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v39);

  objc_destroyWeak(&location);
  return v29;
}

void __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(void *)(a1 + 32)
    && (uint64_t v4 = [v3 unixDate],
        double v5 = (double)*(uint64_t *)v4,
        int v6 = *(_DWORD *)(v4 + 8),
        id v3 = v8,
        (double)v6 / 1000000.0 + v5 > *(double *)(a1 + 56)))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained invalidate];
  }
  else if ([v3 type] == 1536 || objc_msgSend(v8, "type") == 1024)
  {
    [*(id *)(a1 + 40) _addTraceEvent:v8];
  }
}

void __82__OSLogStatistics_aggregationForStartDate_endDate_predicate_withOptions_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  switch(a2)
  {
    case 1:
      int v6 = _logHandle();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v12 = 0;
      v7 = "Stream disconnected.";
      id v8 = (uint8_t *)&v12;
      break;
    case 2:
      int v6 = _logHandle();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v11 = 0;
      v7 = "Stream backlogged, too many events.";
      id v8 = (uint8_t *)&v11;
      break;
    case 3:
      int v6 = _logHandle();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v10 = 0;
      v7 = "Invalid position.";
      id v8 = (uint8_t *)&v10;
      break;
    case 7:
      int v6 = _logHandle();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v9 = 0;
      v7 = "Client has insufficient permissions to access the archive.";
      id v8 = (uint8_t *)&v9;
      break;
    default:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_12;
  }
  _os_log_impl(&dword_1A112E000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_11:

LABEL_12:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_initializeEventSourceWithPaths:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(OSLogStatistics *)self archivePath];

  if (!v5
    || (int v6 = (void *)MEMORY[0x1E4F1CB10],
        [(OSLogStatistics *)self archivePath],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v6 fileURLWithPath:v7 isDirectory:0],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (v4) {
      +[OSLogEventStore localStoreWithRelativePaths:v4];
    }
    else {
    __int16 v9 = +[OSLogEventStore localStore];
    }
    id v8 = 0;
    if (!v9) {
      goto LABEL_15;
    }
LABEL_9:
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2074;
    v26 = __Block_byref_object_dispose__2075;
    id v27 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2074;
    dispatch_semaphore_t v20 = __Block_byref_object_dispose__2075;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__OSLogStatistics__initializeEventSourceWithPaths___block_invoke;
    v15[3] = &unk_1E5A42BD8;
    v15[4] = &v16;
    v15[5] = &v22;
    [v9 prepareWithCompletionHandler:v15];
    __int16 v10 = (void *)v17[5];
    if (v10)
    {
      objc_storeStrong((id *)&self->_eventSource, v10);
      id v11 = 0;
    }
    else
    {
      id v11 = (id)v23[5];
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
    goto LABEL_16;
  }
  if (v4) {
    +[OSLogEventStore storeWithArchiveURL:v8 relativePaths:v4];
  }
  else {
  __int16 v9 = +[OSLogEventStore storeWithArchiveURL:v8];
  }
  if (v9) {
    goto LABEL_9;
  }
LABEL_15:
  __int16 v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v28 = *MEMORY[0x1E4F28568];
  v29[0] = @"Failed to initialize event store";
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  id v11 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:v13];

LABEL_16:
  return v11;
}

void __51__OSLogStatistics__initializeEventSourceWithPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = 40;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    uint64_t v6 = 32;
    v7 = v11;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + v6) + 8);
  id v9 = v7;
  __int16 v10 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
}

- (NSDate)end
{
  return [(OSLogEventSource *)self->_eventSource newestDate];
}

- (NSDate)start
{
  return [(OSLogEventSource *)self->_eventSource oldestDate];
}

- (OSLogStatistics)initWithLogArchivePath:(id)a3 errorOut:(id *)a4
{
  return [(OSLogStatistics *)self initWithLogArchivePath:a3 forRelativePaths:0 errorOut:a4];
}

- (OSLogStatistics)initWithLogArchivePath:(id)a3 forRelativePaths:(id)a4 errorOut:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)OSLogStatistics;
  id v11 = [(OSLogStatistics *)&v18 init];
  __int16 v12 = v11;
  if (v11
    && (objc_storeStrong((id *)&v11->_archivePath, a3),
        [(OSLogStatistics *)v12 _initializeEventSourceWithPaths:v10],
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = (void *)v13;
    v15 = _logHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v20 = v14;
      _os_log_error_impl(&dword_1A112E000, v15, OS_LOG_TYPE_ERROR, "Encountered error during initialisation of OSLogStatistics: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v14;
    }

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = v12;
  }

  return v16;
}

@end