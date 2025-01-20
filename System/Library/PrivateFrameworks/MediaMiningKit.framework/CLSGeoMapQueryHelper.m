@interface CLSGeoMapQueryHelper
- (BOOL)alreadyLaunched;
- (BOOL)didFinishQuery;
- (BOOL)isSimulatingTimeout;
- (CLSGeoMapQueryHelper)initWithQueryObject:(id)a3;
- (CLSGeoServiceThread)geoServiceThread;
- (CLSQueryProtocol)query;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)timer;
- (double)internalProgressTimeInterval;
- (double)nextRetryTime;
- (double)numberOfRetries;
- (double)timeoutInterval;
- (id)cancellerBlock;
- (id)completionBlock;
- (unint64_t)retryLevel;
- (void)_cancel;
- (void)_forwardToGeoThread;
- (void)_handleError:(id)a3;
- (void)_handleQueryResultsForQuery:(id)a3 error:(id)a4;
- (void)_heartBeat;
- (void)_startQuery;
- (void)cancel;
- (void)dealloc;
- (void)launchQueryWithCancellerBlock:(id)a3 completionBlock:(id)a4;
- (void)setAlreadyLaunched:(BOOL)a3;
- (void)setDidFinishQuery:(BOOL)a3;
- (void)setGeoServiceThread:(id)a3;
- (void)setInternalProgressTimeInterval:(double)a3;
- (void)setNextRetryTime:(double)a3;
- (void)setNumberOfRetries:(double)a3;
- (void)setRetryLevel:(unint64_t)a3;
- (void)setSimulatesTimeout:(BOOL)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setTimer:(id)a3;
- (void)setTimerQueue:(id)a3;
@end

@implementation CLSGeoMapQueryHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_geoServiceThread, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_cancellerBlock, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (void)setDidFinishQuery:(BOOL)a3
{
  self->_didFinishQuery = a3;
}

- (BOOL)didFinishQuery
{
  return self->_didFinishQuery;
}

- (void)setAlreadyLaunched:(BOOL)a3
{
  self->_alreadyLaunched = a3;
}

- (BOOL)alreadyLaunched
{
  return self->_alreadyLaunched;
}

- (void)setNextRetryTime:(double)a3
{
  self->_nextRetryTime = a3;
}

- (double)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setRetryLevel:(unint64_t)a3
{
  self->_retryLevel = a3;
}

- (unint64_t)retryLevel
{
  return self->_retryLevel;
}

- (void)setTimerQueue:(id)a3
{
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setInternalProgressTimeInterval:(double)a3
{
  self->_internalProgressTimeInterval = a3;
}

- (double)internalProgressTimeInterval
{
  return self->_internalProgressTimeInterval;
}

- (void)setNumberOfRetries:(double)a3
{
  self->_numberOfRetries = a3;
}

- (double)numberOfRetries
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

- (id)completionBlock
{
  return self->_completionBlock;
}

- (id)cancellerBlock
{
  return self->_cancellerBlock;
}

- (CLSQueryProtocol)query
{
  return self->_query;
}

- (void)dealloc
{
  [(CLSGeoServiceThread *)self->_geoServiceThread cancel];
  v3.receiver = self;
  v3.super_class = (Class)CLSGeoMapQueryHelper;
  [(CLSGeoMapQueryHelper *)&v3 dealloc];
}

- (void)cancel
{
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CLSGeoMapQueryHelper_cancel__block_invoke;
  block[3] = &unk_1E6910188;
  block[4] = self;
  dispatch_sync(timerQueue, block);
}

uint64_t __30__CLSGeoMapQueryHelper_cancel__block_invoke(uint64_t a1)
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

- (void)_handleError:(id)a3
{
  id v11 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  unint64_t retryLevel = self->_retryLevel;
  self->_nextRetryTime = Current + (double)(1 << retryLevel++) * 15.0;
  self->_unint64_t retryLevel = retryLevel;
  if (self->_numberOfRetries > (double)retryLevel
    && ([v11 code] == -3 || objc_msgSend(v11, "code") == -9))
  {
    *(_WORD *)&self->_alreadyLaunched = 0;
  }
  else
  {
    uint64_t v6 = [v11 code];
    completionBlock = (void (**)(id, BOOL, void, CLSQueryProtocol *))self->_completionBlock;
    if (completionBlock)
    {
      id v8 = v11;
      if (v6 == -8) {
        id v8 = 0;
      }
      ((void (**)(id, BOOL, id, CLSQueryProtocol *))completionBlock)[2](completionBlock, v6 == -8, v8, self->_query);
      id v9 = self->_completionBlock;
      self->_completionBlock = 0;
    }
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (void)_heartBeat
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1D2602300](self, a2);
  char v12 = 0;
  cancellerBlock = (void (**)(id, char *))self->_cancellerBlock;
  if (cancellerBlock)
  {
    cancellerBlock[2](cancellerBlock, &v12);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      double internalProgressTimeInterval = self->_internalProgressTimeInterval;
      if (v12) {
        id v11 = @"YES";
      }
      else {
        id v11 = @"NO";
      }
      *(_DWORD *)buf = 134218498;
      double v14 = *(double *)&self;
      __int16 v15 = 2048;
      double v16 = internalProgressTimeInterval;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%p - Progress tick %f seconds, shouldStop %@", buf, 0x20u);
    }
    if (v12) {
      goto LABEL_4;
    }
  }
  if (self->_alreadyLaunched)
  {
    double v5 = self->_internalProgressTimeInterval;
    double timeoutInterval = self->_timeoutInterval;
    if (v5 < timeoutInterval)
    {
      self->_double internalProgressTimeInterval = v5 + 1.0;
      goto LABEL_14;
    }
    self->_double internalProgressTimeInterval = 0.0;
    if (self->_didFinishQuery) {
      goto LABEL_12;
    }
    unint64_t retryLevel = self->_retryLevel;
    double numberOfRetries = self->_numberOfRetries;
    if (numberOfRetries <= (double)retryLevel)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v14 = timeoutInterval * numberOfRetries;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled request because it took more than %f seconds", buf, 0xCu);
      }
      char v12 = 1;
    }
    else
    {
      self->_unint64_t retryLevel = retryLevel + 1;
      [(CLSQueryProtocol *)self->_query cancel];
      [(CLSQueryProtocol *)self->_query prepareForRetry];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        unint64_t v9 = self->_retryLevel;
        *(_DWORD *)buf = 134217984;
        double v14 = *(double *)&v9;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Did hit %lu timeouts, try again", buf, 0xCu);
      }
      if (!v12) {
        goto LABEL_9;
      }
    }
LABEL_4:
    [(CLSGeoMapQueryHelper *)self _cancel];
    goto LABEL_14;
  }
  self->_double internalProgressTimeInterval = 0.0;
  if (self->_didFinishQuery)
  {
LABEL_12:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = *(double *)&self;
      _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%p - Query Already finished", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_9:
  if (CFAbsoluteTimeGetCurrent() >= self->_nextRetryTime)
  {
    self->_alreadyLaunched = 1;
    [(CLSGeoMapQueryHelper *)self _forwardToGeoThread];
  }
LABEL_14:
}

- (void)_startQuery
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  objc_super v3 = self->_query;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    query = self->_query;
    *(_DWORD *)buf = 134218242;
    id v11 = self;
    __int16 v12 = 2112;
    v13 = query;
    _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%p - Start query for %@", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__CLSGeoMapQueryHelper__startQuery__block_invoke;
  v6[3] = &unk_1E6910160;
  objc_copyWeak(&v8, &location);
  v4 = v3;
  v7 = v4;
  [(CLSQueryProtocol *)v4 submitWithHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __35__CLSGeoMapQueryHelper__startQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      __int16 v12 = WeakRetained;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%p - Query Handler for %@ ", buf, 0x16u);
    }
    if ([WeakRetained isSimulatingTimeout]) {
      sleep((*((double *)WeakRetained + 6) + *((double *)WeakRetained + 6)));
    }
    uint64_t v6 = WeakRetained[10];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__CLSGeoMapQueryHelper__startQuery__block_invoke_67;
    block[3] = &unk_1E6910138;
    block[4] = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    id v10 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __35__CLSGeoMapQueryHelper__startQuery__block_invoke_67(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleQueryResultsForQuery:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_handleQueryResultsForQuery:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (CLSGeoMapQueryHelper *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if ([v6 isCancelled])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134218242;
      __int16 v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%p - Query cancelled: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    self->_didFinishQuery = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        __int16 v12 = v7;
        _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "GeoService returned error %@", (uint8_t *)&v11, 0xCu);
      }
      [(CLSGeoMapQueryHelper *)self _handleError:v7];
    }
    else
    {
      completionBlock = (void (**)(id, uint64_t, void, id))self->_completionBlock;
      if (completionBlock)
      {
        completionBlock[2](completionBlock, 1, 0, v6);
        id v9 = self->_completionBlock;
        self->_completionBlock = 0;
      }
      timer = self->_timer;
      self->_timer = 0;
    }
  }
}

- (void)_forwardToGeoThread
{
  objc_super v3 = (void *)MEMORY[0x1D2602300](self, a2);
  id v4 = [(CLSGeoMapQueryHelper *)self methodSignatureForSelector:sel__startQuery];
  double v5 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v4];
  [v5 setTarget:self];
  [v5 setSelector:sel__startQuery];
  [v5 retainArguments];
  [v5 performSelector:sel_invoke onThread:self->_geoServiceThread withObject:0 waitUntilDone:0];
}

- (void)launchQueryWithCancellerBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CLSGeoMapQueryHelper_launchQueryWithCancellerBlock_completionBlock___block_invoke;
  block[3] = &unk_1E6910110;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(timerQueue, block);
}

void __70__CLSGeoMapQueryHelper_launchQueryWithCancellerBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 40))
  {
    id v9 = objc_alloc_init(CLSGeoServiceThread);
    [(CLSGeoServiceThread *)v9 setName:@"GeoService thread Run Loop"];
    [(CLSGeoServiceThread *)v9 start];
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v8 = *(void *)(a1 + 32);
  }
  id v12 = *(void **)(v8 + 72);
  if (v12)
  {
    object = v12;
    dispatch_source_set_timer(object, 0, 0x3B9ACA00uLL, 0xEE6B280uLL);
    dispatch_resume(object);
  }
}

- (CLSGeoMapQueryHelper)initWithQueryObject:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSGeoMapQueryHelper;
  uint64_t v6 = [(CLSGeoMapQueryHelper *)&v22 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v9 = dispatch_queue_create("Cache Handler Queue", v8);
    uint64_t v10 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v9;

    *((_OWORD *)v6 + 3) = xmmword_1D21C5190;
    objc_storeStrong((id *)v6 + 2, a3);
    *(_WORD *)(v6 + 9) = 0;
    *((void *)v6 + 8) = 0;
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v6 + 10));
    id v12 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v11;

    objc_initWeak(&location, v6);
    id v13 = *((void *)v6 + 9);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__CLSGeoMapQueryHelper_initWithQueryObject___block_invoke;
    handler[3] = &unk_1E69100B8;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v13, handler);
    id v14 = *((void *)v6 + 9);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __44__CLSGeoMapQueryHelper_initWithQueryObject___block_invoke_2;
    v16[3] = &unk_1E69100E8;
    objc_copyWeak(&v18, &location);
    id v17 = v5;
    dispatch_source_set_cancel_handler(v14, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return (CLSGeoMapQueryHelper *)v6;
}

void __44__CLSGeoMapQueryHelper_initWithQueryObject___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _heartBeat];
}

uint64_t __44__CLSGeoMapQueryHelper_initWithQueryObject___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[2];
    uint64_t v10 = v2;
    if (v3)
    {
      [v3 cancel];
      uint64_t v2 = v10;
    }
    if (v2[4])
    {
      id v4 = (void *)MEMORY[0x1E4F28C58];
      id v5 = [NSString stringWithFormat:@"%@ did %ld retries of %fs", objc_opt_class(), (unint64_t)*((double *)v10 + 7), v10[6]];
      uint64_t v6 = [v4 errorWithDomain:@"CLSErrorDomain" code:-4 localizedDescription:v5];

      (*(void (**)(void))(v10[4] + 16))();
      id v7 = (void *)v10[4];
      v10[4] = 0;

      uint64_t v2 = v10;
    }
    uint64_t v8 = (void *)v2[9];
    v2[9] = 0;
  }
  return MEMORY[0x1F41817F8]();
}

@end