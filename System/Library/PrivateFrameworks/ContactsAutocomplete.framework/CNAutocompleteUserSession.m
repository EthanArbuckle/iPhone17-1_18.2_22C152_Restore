@interface CNAutocompleteUserSession
- (CNAutocompleteFetchRequest)currentRequest;
- (CNAutocompleteProbeProvider)probeProvider;
- (CNAutocompleteUsageMonitor)usageMonitor;
- (CNAutocompleteUserSession)initWithProbeProvider:(id)a3;
- (CNFuture)duetResultsFuture;
- (NSDate)requestStartTime;
- (OS_dispatch_queue)syncQueue;
- (_CNAutocompleteUserSessionDisplayedResults)lastDisplayedResults;
- (unint64_t)currentBatch;
- (void)_resetState;
- (void)didReceiveResults:(id)a3 forRequest:(id)a4;
- (void)didSelectResult:(id)a3 atSortedIndex:(unint64_t)a4;
- (void)setCurrentBatch:(unint64_t)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDuetResultsFuture:(id)a3;
- (void)setLastDisplayedResults:(id)a3;
- (void)setRequestStartTime:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setUsageMonitor:(id)a3;
- (void)willStartDuetRequestWithMatchingResultsFuture:(id)a3;
- (void)willStartExecutingRequest:(id)a3;
@end

@implementation CNAutocompleteUserSession

- (CNAutocompleteUserSession)initWithProbeProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteUserSession;
  v6 = [(CNAutocompleteUserSession *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.contacts.contactsautocomplete.UserSession", v7);
    syncQueue = v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_probeProvider, a3);
    v10 = [[CNAutocompleteUsageMonitor alloc] initWithProbeProvider:v5];
    usageMonitor = v6->_usageMonitor;
    v6->_usageMonitor = v10;

    v6->_currentBatch = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)willStartDuetRequestWithMatchingResultsFuture:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteUserSession *)self syncQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CNAutocompleteUserSession_willStartDuetRequestWithMatchingResultsFuture___block_invoke;
  v7[3] = &unk_1E63DD700;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __75__CNAutocompleteUserSession_willStartDuetRequestWithMatchingResultsFuture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDuetResultsFuture:*(void *)(a1 + 40)];
}

- (void)willStartExecutingRequest:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v5 = [(CNAutocompleteUserSession *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke;
  block[3] = &unk_1E63DD728;
  v20 = &v21;
  block[4] = self;
  id v6 = v4;
  id v19 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)v22[5];
  if (v7 && [v7 relevantForRequest:v6])
  {
    uint64_t v12 = 0;
    objc_super v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    id v8 = [(CNAutocompleteUserSession *)self syncQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_2;
    v11[3] = &unk_1E63DD750;
    v11[4] = &v21;
    v11[5] = &v12;
    dispatch_sync(v8, v11);

    v9 = (void *)v13[5];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_3;
      v10[3] = &unk_1E63DD778;
      v10[4] = self;
      v10[5] = &v21;
      [v9 enumerateKeysAndObjectsUsingBlock:v10];
    }
    _Block_object_dispose(&v12, 8);
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastDisplayedResults];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) setCurrentRequest:*(void *)(a1 + 40)];
  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setRequestStartTime:v6];

  [*(id *)(a1 + 32) setCurrentBatch:0];
  v7 = *(void **)(a1 + 32);
  return [v7 setDuetResultsFuture:0];
}

void __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) ignored] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setIgnored:1];
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) datesByBatchIndexes];
    uint64_t v2 = [v5 copy];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

void __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 date];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;

  id v13 = [*(id *)(a1 + 32) usageMonitor];
  uint64_t v11 = [v7 unsignedIntegerValue];

  uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) request];
  [v13 userIgnoredResultsOfBatch:v11 forRequest:v12 afterDelay:v10];
}

- (void)didReceiveResults:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0;
  id v8 = [(CNAutocompleteUserSession *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke;
  block[3] = &unk_1E63DD7A0;
  id v9 = v7;
  id v18 = v9;
  id v19 = self;
  v20 = &v24;
  uint64_t v21 = v22;
  dispatch_sync(v8, block);

  if (v25[3] != 0x7FFFFFFFFFFFFFFFLL && [v6 count])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke_5;
    v12[3] = &unk_1E63DD7C8;
    v12[4] = &v13;
    objc_msgSend(v6, "_cn_each:", v12);
    double v10 = [(CNAutocompleteUserSession *)self usageMonitor];
    uint64_t v11 = [v6 count];
    [v10 userSawNumberOfResults:v11 forBatch:v25[3] includingNumberOfSuggestions:v14[3] forRequest:v9];

    _Block_object_dispose(&v13, 8);
  }

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);
}

void __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) currentRequest];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) currentBatch];
    objc_msgSend(*(id *)(a1 + 40), "setCurrentBatch:", objc_msgSend(*(id *)(a1 + 40), "currentBatch") + 1);
    uint64_t v4 = [*(id *)(a1 + 40) requestStartTime];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) lastDisplayedResults];
    id v9 = [v8 request];
    LOBYTE(v7) = [v7 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      double v10 = [[_CNAutocompleteUserSessionDisplayedResults alloc] initWithRequest:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) setLastDisplayedResults:v10];
    }
    uint64_t v11 = [*(id *)(a1 + 40) duetResultsFuture];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 40) duetResultsFuture];
      id v19 = 0;
      uint64_t v13 = [v12 resultWithTimeout:&v19 error:0.0];
      id v14 = v19;

      if (!v13)
      {
        uint64_t v15 = CNALoggingContextDebug();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v14;
          _os_log_impl(&dword_1BEF57000, v15, OS_LOG_TYPE_DEFAULT, "Failed to retrieve duet results with error: %@", buf, 0xCu);
        }
      }
      BOOL v16 = [v13 count] != 0;
      id v17 = [*(id *)(a1 + 40) lastDisplayedResults];
      [v17 setContainsDuetResults:v16];

      [*(id *)(a1 + 40) setDuetResultsFuture:0];
    }
    id v18 = [*(id *)(a1 + 40) lastDisplayedResults];
    [v18 didReceiveBatch:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  }
}

BOOL __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke_5(uint64_t a1, void *a2)
{
  BOOL result = +[CNAutocompleteResult isSourceTypeConsideredSuggestion:](CNAutocompleteResult, "isSourceTypeConsideredSuggestion:", [a2 sourceType]);
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (void)didSelectResult:(id)a3 atSortedIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v7 = [(CNAutocompleteUserSession *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CNAutocompleteUserSession_didSelectResult_atSortedIndex___block_invoke;
  block[3] = &unk_1E63DD7F0;
  void block[4] = self;
  void block[5] = &v14;
  block[6] = &v10;
  dispatch_sync(v7, block);

  id v8 = [(CNAutocompleteUserSession *)self usageMonitor];
  [v8 userSelectedResult:v6 atSortedIndex:a4 forRequest:v15[5] gotResultsFromDuet:*((unsigned __int8 *)v11 + 24)];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

uint64_t __59__CNAutocompleteUserSession_didSelectResult_atSortedIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentRequest];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) lastDisplayedResults];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 containsDuetResults];

  id v6 = *(void **)(a1 + 32);
  return [v6 _resetState];
}

- (void)_resetState
{
  [(CNAutocompleteUserSession *)self setCurrentRequest:0];
  [(CNAutocompleteUserSession *)self setCurrentBatch:0x7FFFFFFFFFFFFFFFLL];
  [(CNAutocompleteUserSession *)self setLastDisplayedResults:0];
  [(CNAutocompleteUserSession *)self setRequestStartTime:0];
  [(CNAutocompleteUserSession *)self setDuetResultsFuture:0];
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (CNAutocompleteFetchRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (unint64_t)currentBatch
{
  return self->_currentBatch;
}

- (void)setCurrentBatch:(unint64_t)a3
{
  self->_currentBatch = a3;
}

- (_CNAutocompleteUserSessionDisplayedResults)lastDisplayedResults
{
  return self->_lastDisplayedResults;
}

- (void)setLastDisplayedResults:(id)a3
{
}

- (NSDate)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(id)a3
{
}

- (CNAutocompleteUsageMonitor)usageMonitor
{
  return self->_usageMonitor;
}

- (void)setUsageMonitor:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (CNFuture)duetResultsFuture
{
  return self->_duetResultsFuture;
}

- (void)setDuetResultsFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetResultsFuture, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong((id *)&self->_requestStartTime, 0);
  objc_storeStrong((id *)&self->_lastDisplayedResults, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
}

@end