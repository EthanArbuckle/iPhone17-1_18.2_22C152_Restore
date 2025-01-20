@interface CLSQueryHandler
- (BOOL)isSimulatingTimeout;
- (CLSGeoServiceThread)geoServiceThread;
- (CLSQueryHandler)initWithQueryPerformer:(id)a3 geoServiceThread:(id)a4 loggingConnection:(id)a5;
- (double)timeoutInterval;
- (id)completionBlock;
- (id)progressBlock;
- (unint64_t)_cacheMapItems:(id)a3;
- (unint64_t)numberOfRetries;
- (void)_cancel;
- (void)_forwardToGeoThread;
- (void)_handleError:(id)a3 numberOfItems:(unint64_t)a4;
- (void)_handleQueryResultsForQuery:(id)a3 items:(id)a4 error:(id)a5;
- (void)_heartBeat;
- (void)_startQuery;
- (void)cacheItems;
- (void)cancel;
- (void)setCompletionBlock:(id)a3;
- (void)setGeoServiceThread:(id)a3;
- (void)setNumberOfRetries:(unint64_t)a3;
- (void)setProgressBlock:(id)a3;
- (void)setSimulatesTimeout:(BOOL)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation CLSQueryHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoServiceThread, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (void)setNumberOfRetries:(unint64_t)a3
{
  self->_numberOfRetries = a3;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setSimulatesTimeout:(BOOL)a3
{
  self->_simulatesTimeout = a3;
}

- (BOOL)isSimulatingTimeout
{
  return self->_simulatesTimeout;
}

- (void)setGeoServiceThread:(id)a3
{
}

- (CLSGeoServiceThread)geoServiceThread
{
  return self->_geoServiceThread;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (unint64_t)_cacheMapItems:(id)a3
{
  return [(CLSQueryPerformerProtocol *)self->_query cacheItems:a3];
}

- (void)cancel
{
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CLSQueryHandler_cancel__block_invoke;
  block[3] = &unk_1E6910188;
  block[4] = self;
  dispatch_sync(timerQueue, block);
}

uint64_t __25__CLSQueryHandler_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_cancel
{
  timer = self->_timer;
  if (timer && !dispatch_source_testcancel((dispatch_source_t)self->_timer))
  {
    dispatch_source_cancel(timer);
  }
}

- (void)_handleError:(id)a3 numberOfItems:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  unint64_t retryLevel = self->_retryLevel;
  self->_double nextRetryTime = Current + (double)(1 << retryLevel++) * 15.0;
  self->_unint64_t retryLevel = retryLevel;
  if (retryLevel < self->_numberOfRetries && ([v6 code] == -3 || objc_msgSend(v6, "code") == -9))
  {
    *(_WORD *)&self->_alreadyLaunched = 0;
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      double nextRetryTime = self->_nextRetryTime;
      v11 = loggingConnection;
      int v17 = 134217984;
      double v18 = nextRetryTime - CFAbsoluteTimeGetCurrent();
      _os_log_impl(&dword_1D2150000, v11, OS_LOG_TYPE_INFO, "Re-Trying in %0.2fs", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = [v6 code];
    completionBlock = (void (**)(id, BOOL, unint64_t, void))self->_completionBlock;
    if (completionBlock)
    {
      if (v12 == -8) {
        id v14 = 0;
      }
      else {
        id v14 = v6;
      }
      ((void (**)(id, BOOL, unint64_t, id))completionBlock)[2](completionBlock, v12 == -8, a4, v14);
      id v15 = self->_completionBlock;
      self->_completionBlock = 0;
    }
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (void)_heartBeat
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D2602300](self, a2);
  char v21 = 0;
  progressBlock = (void (**)(id, char *))self->_progressBlock;
  if (progressBlock)
  {
    progressBlock[2](progressBlock, &v21);
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
    {
      double internalProgressTimeInterval = self->_internalProgressTimeInterval;
      if (v21) {
        v20 = @"YES";
      }
      else {
        v20 = @"NO";
      }
      *(_DWORD *)buf = 134218498;
      double v23 = *(double *)&self;
      __int16 v24 = 2048;
      double v25 = internalProgressTimeInterval;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_debug_impl(&dword_1D2150000, loggingConnection, OS_LOG_TYPE_DEBUG, "%p - Progress tick %f seconds, shouldStop %@", buf, 0x20u);
    }
    if (v21) {
      [(CLSQueryHandler *)self _cancel];
    }
  }
  if (self->_alreadyLaunched)
  {
    double v6 = self->_internalProgressTimeInterval;
    double timeoutInterval = self->_timeoutInterval;
    if (v6 < timeoutInterval)
    {
      self->_double internalProgressTimeInterval = v6 + 1.0;
      goto LABEL_22;
    }
    self->_double internalProgressTimeInterval = 0.0;
    if (self->_didQueryFinish) {
      goto LABEL_13;
    }
    unint64_t retryLevel = self->_retryLevel;
    unint64_t numberOfRetries = self->_numberOfRetries;
    if (retryLevel >= numberOfRetries)
    {
      double v18 = self->_loggingConnection;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v23 = timeoutInterval * (double)numberOfRetries;
        _os_log_impl(&dword_1D2150000, v18, OS_LOG_TYPE_INFO, "Cancelled request because it took more than %f seconds", buf, 0xCu);
      }
      char v21 = 1;
      goto LABEL_21;
    }
    self->_unint64_t retryLevel = retryLevel + 1;
    [(CLSQueryPerformerProtocol *)self->_query cancel];
    v11 = objc_opt_class();
    query = self->_query;
    v13 = [(CLSQueryPerformerProtocol *)query regions];
    id v14 = [v11 queryWithTemplate:query forRegions:v13];
    id v15 = self->_query;
    self->_query = v14;

    v16 = self->_loggingConnection;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unint64_t v17 = self->_retryLevel;
      *(_DWORD *)buf = 134217984;
      double v23 = *(double *)&v17;
      _os_log_impl(&dword_1D2150000, v16, OS_LOG_TYPE_INFO, "Did hit %lu timeouts, try again", buf, 0xCu);
    }
  }
  else
  {
    self->_double internalProgressTimeInterval = 0.0;
    if (self->_didQueryFinish)
    {
LABEL_13:
      v8 = self->_loggingConnection;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v23 = *(double *)&self;
        _os_log_debug_impl(&dword_1D2150000, v8, OS_LOG_TYPE_DEBUG, "%p - Query Already finished", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
  if (v21)
  {
LABEL_21:
    [(CLSQueryHandler *)self _cancel];
    goto LABEL_22;
  }
  if (CFAbsoluteTimeGetCurrent() >= self->_nextRetryTime)
  {
    self->_alreadyLaunched = 1;
    [(CLSQueryHandler *)self _forwardToGeoThread];
  }
LABEL_22:
}

- (void)_startQuery
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = self->_query;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    query = self->_query;
    *(_DWORD *)buf = 134218242;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = query;
    _os_log_debug_impl(&dword_1D2150000, loggingConnection, OS_LOG_TYPE_DEBUG, "%p - Start query for %@", buf, 0x16u);
  }
  v5 = self->_query;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__CLSQueryHandler__startQuery__block_invoke;
  v8[3] = &unk_1E690EE30;
  objc_copyWeak(&v10, &location);
  double v6 = v3;
  v9 = v6;
  [(CLSQueryPerformerProtocol *)v5 submitWithHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __30__CLSQueryHandler__startQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[8];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      unint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_debug_impl(&dword_1D2150000, v9, OS_LOG_TYPE_DEBUG, "%p - Query Handler for %@ ", buf, 0x16u);
    }
    if ([v8 isSimulatingTimeout]) {
      sleep((*((double *)v8 + 13) + *((double *)v8 + 13)));
    }
    id v10 = v8[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __30__CLSQueryHandler__startQuery__block_invoke_63;
    v12[3] = &unk_1E690EFB0;
    v12[4] = v8;
    id v13 = *(id *)(a1 + 32);
    id v14 = v5;
    id v15 = v6;
    dispatch_async(v10, v12);
  }
}

uint64_t __30__CLSQueryHandler__startQuery__block_invoke_63(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleQueryResultsForQuery:*(void *)(a1 + 40) items:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_handleQueryResultsForQuery:(id)a3 items:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (CLSQueryHandler *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if ([v8 isCancelled])
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134218242;
      char v21 = self;
      __int16 v22 = 2112;
      unint64_t v23 = (unint64_t)v8;
      _os_log_debug_impl(&dword_1D2150000, loggingConnection, OS_LOG_TYPE_DEBUG, "%p - Query cancelled: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    self->_didQueryFinish = 1;
    if (v10)
    {
      uint64_t v12 = self->_loggingConnection;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412290;
        char v21 = v10;
        _os_log_error_impl(&dword_1D2150000, v12, OS_LOG_TYPE_ERROR, "GeoService returned error %@", (uint8_t *)&v20, 0xCu);
      }
      -[CLSQueryHandler _handleError:numberOfItems:](self, "_handleError:numberOfItems:", v10, [v9 count]);
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D2602300]();
      unint64_t v14 = [(CLSQueryHandler *)self _cacheMapItems:v9];
      id v15 = self->_loggingConnection;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 134218242;
        char v21 = self;
        __int16 v22 = 2112;
        unint64_t v23 = (unint64_t)v8;
        _os_log_debug_impl(&dword_1D2150000, v15, OS_LOG_TYPE_DEBUG, "%p - Caching result from %@", (uint8_t *)&v20, 0x16u);
      }
      completionBlock = (void (**)(id, uint64_t, unint64_t, void))self->_completionBlock;
      if (completionBlock)
      {
        unint64_t v17 = self->_loggingConnection;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 134218240;
          char v21 = self;
          __int16 v22 = 2048;
          unint64_t v23 = v14;
          _os_log_debug_impl(&dword_1D2150000, v17, OS_LOG_TYPE_DEBUG, "%p - Completion Block: %ld items cached", (uint8_t *)&v20, 0x16u);
          completionBlock = (void (**)(id, uint64_t, unint64_t, void))self->_completionBlock;
        }
        completionBlock[2](completionBlock, 1, v14, 0);
        id v18 = self->_completionBlock;
        self->_completionBlock = 0;
      }
      timer = self->_timer;
      self->_timer = 0;
    }
  }
}

- (void)_forwardToGeoThread
{
  v3 = (void *)MEMORY[0x1D2602300](self, a2);
  v4 = [(CLSQueryHandler *)self methodSignatureForSelector:sel__startQuery];
  id v5 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v4];
  [v5 setTarget:self];
  [v5 setSelector:sel__startQuery];
  [v5 retainArguments];
  [v5 performSelector:sel_invoke onThread:self->_geoServiceThread withObject:0 waitUntilDone:0];
}

- (void)cacheItems
{
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CLSQueryHandler_cacheItems__block_invoke;
  block[3] = &unk_1E6910188;
  block[4] = self;
  dispatch_async(timerQueue, block);
}

void __29__CLSQueryHandler_cacheItems__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    dispatch_source_set_timer(v2, 0, 0x3B9ACA00uLL, 0xEE6B280uLL);
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    dispatch_resume(v3);
  }
}

- (CLSQueryHandler)initWithQueryPerformer:(id)a3 geoServiceThread:(id)a4 loggingConnection:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CLSQueryHandler;
  id v12 = [(CLSQueryHandler *)&v29 init];
  if (v12)
  {
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v15 = dispatch_queue_create("Cacher Handler Queue", v14);
    uint64_t v16 = (void *)*((void *)v12 + 7);
    *((void *)v12 + 7) = v15;

    objc_storeStrong((id *)v12 + 8, a5);
    objc_storeStrong((id *)v12 + 12, a4);
    objc_storeStrong((id *)v12 + 1, a3);
    *((_WORD *)v12 + 24) = 0;
    *((void *)v12 + 2) = 0;
    dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v12 + 7));
    id v18 = (void *)*((void *)v12 + 3);
    *((void *)v12 + 3) = v17;

    objc_initWeak(&location, v12);
    uint64_t v19 = *((void *)v12 + 3);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke;
    handler[3] = &unk_1E69100B8;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v19, handler);
    int v20 = *((void *)v12 + 3);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke_2;
    v23[3] = &unk_1E69100E8;
    objc_copyWeak(&v25, &location);
    id v24 = v9;
    dispatch_source_set_cancel_handler(v20, v23);
    char v21 = *((void *)v12 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v31 = v12;
      _os_log_debug_impl(&dword_1D2150000, v21, OS_LOG_TYPE_DEBUG, "----- New Query Performer <%p> ----", buf, 0xCu);
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return (CLSQueryHandler *)v12;
}

void __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _heartBeat];
}

uint64_t __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    id v10 = v2;
    if (v3)
    {
      [v3 cancel];
      v2 = v10;
    }
    if (v2[11])
    {
      v4 = (void *)MEMORY[0x1E4F28C58];
      id v5 = [NSString stringWithFormat:@"%@ did %ld retries of %fs", objc_opt_class(), v10[14], v10[13]];
      id v6 = [v4 errorWithDomain:@"CLSErrorDomain" code:-4 localizedDescription:v5];

      (*(void (**)(void))(v10[11] + 16))();
      v7 = (void *)v10[11];
      v10[11] = 0;

      v2 = v10;
    }
    id v8 = (void *)v2[3];
    v2[3] = 0;
  }
  return MEMORY[0x1F41817F8]();
}

@end