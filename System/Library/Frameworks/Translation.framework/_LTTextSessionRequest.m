@interface _LTTextSessionRequest
- (BOOL)isForDownloadRequest;
- (NSArray)batch;
- (NSLocale)resolvedSourceLocale;
- (NSLocale)resolvedTargetLocale;
- (NSUUID)logIdentifier;
- (_LTTextSessionRequest)initWithBatch:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 itemHandler:(id)a6 completionHandler:(id)a7;
- (id)_initWithBatch:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 isForDownloadRequest:(BOOL)a6 itemHandler:(id)a7 completionHandler:(id)a8;
- (id)initForDownloadRequestWithSourceLocale:(id)a3 targetLocale:(id)a4 completionHandler:(id)a5;
- (void)_cleanUp;
- (void)_invocationEndedWithErrorSELFLogging:(id)a3;
- (void)_setQueue:(id)a3;
- (void)didComplete;
- (void)didReceiveError:(id)a3 forInput:(id)a4;
- (void)didReceiveInterruptionFromHandler:(id)a3;
- (void)didTranslateInput:(id)a3 withResult:(id)a4;
- (void)setResolvedSourceLocale:(id)a3;
- (void)setResolvedTargetLocale:(id)a3;
@end

@implementation _LTTextSessionRequest

- (_LTTextSessionRequest)initWithBatch:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 itemHandler:(id)a6 completionHandler:(id)a7
{
  return (_LTTextSessionRequest *)[(_LTTextSessionRequest *)self _initWithBatch:a3 sourceLocale:a4 targetLocale:a5 isForDownloadRequest:0 itemHandler:a6 completionHandler:a7];
}

- (id)initForDownloadRequestWithSourceLocale:(id)a3 targetLocale:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95___LTTextSessionRequest_initForDownloadRequestWithSourceLocale_targetLocale_completionHandler___block_invoke;
  v12[3] = &unk_2651DC280;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(_LTTextSessionRequest *)self _initWithBatch:MEMORY[0x263EFFA68] sourceLocale:a3 targetLocale:a4 isForDownloadRequest:1 itemHandler:0 completionHandler:v12];

  return v10;
}

- (id)_initWithBatch:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 isForDownloadRequest:(BOOL)a6 itemHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v38.receiver = self;
  v38.super_class = (Class)_LTTextSessionRequest;
  v19 = [(_LTTextSessionRequest *)&v38 init];
  if (v19)
  {
    uint64_t v20 = +[_LTTextSession synchronizationQueue];
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [v14 copy];
    batch = v19->_batch;
    v19->_batch = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    resolvedSourceLocale = v19->_resolvedSourceLocale;
    v19->_resolvedSourceLocale = (NSLocale *)v24;

    uint64_t v26 = [v16 copy];
    resolvedTargetLocale = v19->_resolvedTargetLocale;
    v19->_resolvedTargetLocale = (NSLocale *)v26;

    v19->_isForDownloadRequest = a6;
    uint64_t v28 = [v17 copy];
    id itemHandler = v19->_itemHandler;
    v19->_id itemHandler = (id)v28;

    uint64_t v30 = [v18 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = (id)v30;

    uint64_t v32 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    resultMap = v19->_resultMap;
    v19->_resultMap = (NSMutableDictionary *)v32;

    uint64_t v34 = [MEMORY[0x263F08C38] UUID];
    logIdentifier = v19->_logIdentifier;
    v19->_logIdentifier = (NSUUID *)v34;

    v36 = v19;
  }

  return v19;
}

- (void)didReceiveError:(id)a3 forInput:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_completionHandler)
  {
    [(_LTTextSessionRequest *)self _invocationEndedWithErrorSELFLogging:v5];
    (*((void (**)(void))self->_completionHandler + 2))();
    [(_LTTextSessionRequest *)self _cleanUp];
  }
  else
  {
    v6 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_24639B000, v6, OS_LOG_TYPE_INFO, "Text request received error, but already called completion handler so ignoring new error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)didTranslateInput:(id)a3 withResult:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  NSUInteger v9 = [(NSArray *)self->_batch indexOfObject:v8];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_LTTextSessionRequest didTranslateInput:withResult:](v10);
    }
  }
  else if (self->_completionHandler)
  {
    resultMap = self->_resultMap;
    v12 = [NSNumber numberWithUnsignedInteger:v9];
    [(NSMutableDictionary *)resultMap setObject:v6 forKeyedSubscript:v12];

    id itemHandler = (void (**)(id, id, void))self->_itemHandler;
    if (itemHandler) {
      itemHandler[2](itemHandler, v6, 0);
    }
  }
  else
  {
    id v14 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 134217984;
      NSUInteger v16 = v9;
      _os_log_impl(&dword_24639B000, v14, OS_LOG_TYPE_INFO, "Received result for input item %zu after completion handler was already called, likely because an error previously ocurred; early returning",
        (uint8_t *)&v15,
        0xCu);
    }
  }
}

- (void)didComplete
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_completionHandler)
  {
    NSUInteger v3 = [(NSArray *)self->_batch count];
    id v11 = [MEMORY[0x263EFF980] arrayWithCapacity:v3];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        resultMap = self->_resultMap;
        id v6 = [NSNumber numberWithUnsignedInteger:i];
        int v7 = [(NSMutableDictionary *)resultMap objectForKeyedSubscript:v6];

        if (v7) {
          [v11 addObject:v7];
        }
      }
    }
    id completionHandler = (void (**)(id, void *, void))self->_completionHandler;
    NSUInteger v9 = (void *)[v11 copy];
    completionHandler[2](completionHandler, v9, 0);

    [(_LTTextSessionRequest *)self _cleanUp];
  }
  else
  {
    id v10 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24639B000, v10, OS_LOG_TYPE_INFO, "Request was reported as being finished, but completion handler was already called so ignoring update", buf, 2u);
    }
  }
}

- (NSLocale)resolvedSourceLocale
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  resolvedSourceLocale = self->_resolvedSourceLocale;

  return resolvedSourceLocale;
}

- (NSLocale)resolvedTargetLocale
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  resolvedTargetLocale = self->_resolvedTargetLocale;

  return resolvedTargetLocale;
}

- (void)setResolvedSourceLocale:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = (NSLocale *)[v5 copy];

  resolvedSourceLocale = self->_resolvedSourceLocale;
  self->_resolvedSourceLocale = v6;
}

- (void)setResolvedTargetLocale:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = (NSLocale *)[v5 copy];

  resolvedTargetLocale = self->_resolvedTargetLocale;
  self->_resolvedTargetLocale = v6;
}

- (void)_setQueue:(id)a3
{
}

- (void)_cleanUp
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id itemHandler = self->_itemHandler;
  self->_id itemHandler = 0;

  resultMap = self->_resultMap;

  [(NSMutableDictionary *)resultMap removeAllObjects];
}

- (void)didReceiveInterruptionFromHandler:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke;
  v5[3] = &unk_2651DBA48;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_invocationEndedWithErrorSELFLogging:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(_LTTextSessionRequest *)self isForDownloadRequest])
  {
    v4 = [(_LTTextSessionRequest *)self logIdentifier];
    +[_LTTranslator selfLoggingInvocationDidError:v5 invocationId:v4];
  }
}

- (NSArray)batch
{
  return self->_batch;
}

- (BOOL)isForDownloadRequest
{
  return self->_isForDownloadRequest;
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_resolvedTargetLocale, 0);
  objc_storeStrong((id *)&self->_resolvedSourceLocale, 0);
  objc_storeStrong((id *)&self->_resultMap, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_itemHandler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)didTranslateInput:(os_log_t)log withResult:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Unable to find input item in original inputs, ignoring result", v1, 2u);
}

@end