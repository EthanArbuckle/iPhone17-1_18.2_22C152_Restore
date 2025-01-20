@interface CNAutocompleteDelegateWrapper
+ (id)responseScheduler;
- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5;
- (CNAutocompleteDelegateWrapper)initWithDelegate:(id)a3 userSession:(id)a4 fetchRequest:(id)a5;
- (CNAutocompleteDelegateWrapper)initWithDelegate:(id)a3 userSession:(id)a4 fetchRequest:(id)a5 scheduler:(id)a6;
- (CNAutocompleteFetchDelegate)delegate;
- (CNAutocompleteFetchRequest)fetchRequest;
- (CNAutocompleteQueryResponsePreparer)responsePreparer;
- (CNAutocompleteUserSession)userSession;
- (CNCancelationToken)cancelationToken;
- (CNScheduler)scheduler;
- (id)addDiagnosticLog:(id)a3;
- (id)askDelegateToAdjustResults;
- (id)sortResults;
- (id)suppressResultsWithAddresses:(id)a3;
- (unint64_t)openNetworkActivityCalls;
- (void)_autocompleteFetch:(id)a3 distributeReceivedResults:(id)a4;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)autocompleteFetchHitMaximumResultsCount:(id)a3 results:(id)a4;
- (void)cancel;
- (void)queueDidEndNetworkActivityMessageForFetch:(id)a3;
- (void)queueMessageToDelegate:(id)a3;
- (void)queueUncancelableMessageToDelegate:(id)a3;
- (void)setOpenNetworkActivityCalls:(unint64_t)a3;
- (void)setPredictionResultsFuture:(id)a3;
@end

@implementation CNAutocompleteDelegateWrapper

+ (id)responseScheduler
{
  return (id)[MEMORY[0x1E4F5A4E8] operationQueueSchedulerWithMaxConcurrentOperationCount:1];
}

- (CNAutocompleteDelegateWrapper)initWithDelegate:(id)a3 userSession:(id)a4 fetchRequest:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() responseScheduler];
  v12 = [(CNAutocompleteDelegateWrapper *)self initWithDelegate:v10 userSession:v9 fetchRequest:v8 scheduler:v11];

  return v12;
}

- (CNAutocompleteDelegateWrapper)initWithDelegate:(id)a3 userSession:(id)a4 fetchRequest:(id)a5 scheduler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNAutocompleteDelegateWrapper;
  v14 = [(CNAutocompleteDelegateWrapper *)&v23 init];
  if (v14)
  {
    v15 = [[_CNAutocompleteFetchDelegateSafeWrapper alloc] initWithDelegate:v10];
    delegate = v14->_delegate;
    v14->_delegate = (CNAutocompleteFetchDelegate *)v15;

    objc_storeStrong((id *)&v14->_scheduler, a6);
    v17 = (CNCancelationToken *)objc_alloc_init(MEMORY[0x1E4F5A368]);
    cancelationToken = v14->_cancelationToken;
    v14->_cancelationToken = v17;

    objc_storeStrong((id *)&v14->_userSession, a4);
    objc_storeStrong((id *)&v14->_fetchRequest, a5);
    v19 = [[CNAutocompleteQueryResponsePreparer alloc] initWithDelegate:v14->_delegate fetchRequest:v14->_fetchRequest];
    responsePreparer = v14->_responsePreparer;
    v14->_responsePreparer = v19;

    v21 = v14;
  }

  return v14;
}

- (id)addDiagnosticLog:(id)a3
{
  v4 = [(CNAutocompleteQueryResponsePreparer *)self->_responsePreparer addDiagnosticLog:a3];
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v4;

  return self;
}

- (id)sortResults
{
  v3 = [(CNAutocompleteQueryResponsePreparer *)self->_responsePreparer sortResults];
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v3;

  return self;
}

- (id)askDelegateToAdjustResults
{
  v3 = [(CNAutocompleteQueryResponsePreparer *)self->_responsePreparer askDelegateToAdjustResults];
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v3;

  return self;
}

- (id)suppressResultsWithAddresses:(id)a3
{
  v4 = [(CNAutocompleteQueryResponsePreparer *)self->_responsePreparer suppressResultsWithAddresses:a3];
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v4;

  return self;
}

- (void)_autocompleteFetch:(id)a3 distributeReceivedResults:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNAutocompleteDelegateWrapper *)self responsePreparer];
  id v9 = [v8 prepareResults:v7 forFetch:v6];

  id v10 = [(CNAutocompleteDelegateWrapper *)self userSession];
  id v11 = [(CNAutocompleteDelegateWrapper *)self fetchRequest];
  [v10 didReceiveResults:v9 forRequest:v11];

  uint64_t v12 = [v9 count];
  id v13 = CNALoggingContextDebug();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      int v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1BEF57000, v13, OS_LOG_TYPE_DEFAULT, "About to tell our delegate about %@ results", (uint8_t *)&v16, 0xCu);
    }
    id v13 = [(CNAutocompleteDelegateWrapper *)self delegate];
    [v13 autocompleteFetch:v6 didReceiveResults:v9];
  }
  else if (v14)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1BEF57000, v13, OS_LOG_TYPE_DEFAULT, "No results to return to delegate", (uint8_t *)&v16, 2u);
  }
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CNAutocompleteDelegateWrapper_autocompleteFetch_didReceiveResults___block_invoke;
  v10[3] = &unk_1E63DDA58;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CNAutocompleteDelegateWrapper *)self queueMessageToDelegate:v10];
}

uint64_t __69__CNAutocompleteDelegateWrapper_autocompleteFetch_didReceiveResults___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _autocompleteFetch:*(void *)(a1 + 40) distributeReceivedResults:*(void *)(a1 + 48)];
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CNALoggingContextDebug();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "About to tell our delegate about error %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CNAutocompleteDelegateWrapper_autocompleteFetch_didFailWithError___block_invoke;
  v11[3] = &unk_1E63DDA58;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(CNAutocompleteDelegateWrapper *)self queueMessageToDelegate:v11];
}

void __68__CNAutocompleteDelegateWrapper_autocompleteFetch_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 autocompleteFetch:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke;
  v6[3] = &unk_1E63DD700;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CNAutocompleteDelegateWrapper *)self queueMessageToDelegate:v6];
}

void __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) openNetworkActivityCalls];
  objc_msgSend(*(id *)(a1 + 32), "setOpenNetworkActivityCalls:", objc_msgSend(*(id *)(a1 + 32), "openNetworkActivityCalls") + 1);
  if (!v2)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    [v3 autocompleteFetchDidBeginNetworkActivity:*(void *)(a1 + 40)];

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v4 = [*(id *)(a1 + 32) delegate];
    objc_initWeak(&from, *(id *)(a1 + 40));
    id v5 = [*(id *)(a1 + 32) cancelationToken];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_2;
    v7[3] = &unk_1E63DDAA8;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    id v6 = v4;
    id v8 = v6;
    [v5 addCancelationBlock:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }
}

void __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_3;
  v3[3] = &unk_1E63DDA80;
  objc_copyWeak(&v5, a1 + 6);
  v3[4] = WeakRetained;
  id v4 = a1[4];
  [WeakRetained queueUncancelableMessageToDelegate:v3];

  objc_destroyWeak(&v5);
}

void __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ([a1[4] openNetworkActivityCalls])
  {
    [a1[4] setOpenNetworkActivityCalls:0];
    [a1[5] autocompleteFetchDidEndNetworkActivity:WeakRetained];
  }
}

- (void)queueDidEndNetworkActivityMessageForFetch:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__CNAutocompleteDelegateWrapper_queueDidEndNetworkActivityMessageForFetch___block_invoke;
  v6[3] = &unk_1E63DD700;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CNAutocompleteDelegateWrapper *)self queueUncancelableMessageToDelegate:v6];
}

void __75__CNAutocompleteDelegateWrapper_queueDidEndNetworkActivityMessageForFetch___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) openNetworkActivityCalls])
  {
    objc_msgSend(*(id *)(a1 + 32), "setOpenNetworkActivityCalls:", objc_msgSend(*(id *)(a1 + 32), "openNetworkActivityCalls") - 1);
    if (![*(id *)(a1 + 32) openNetworkActivityCalls])
    {
      id v2 = [*(id *)(a1 + 32) delegate];
      [v2 autocompleteFetchDidEndNetworkActivity:*(void *)(a1 + 40)];
    }
  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CNAutocompleteDelegateWrapper_autocompleteFetchDidFinish___block_invoke;
  v6[3] = &unk_1E63DD700;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CNAutocompleteDelegateWrapper *)self queueMessageToDelegate:v6];
}

void __60__CNAutocompleteDelegateWrapper_autocompleteFetchDidFinish___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 autocompleteFetchDidFinish:*(void *)(a1 + 40)];
}

- (void)autocompleteFetchHitMaximumResultsCount:(id)a3 results:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(CNCancelationToken *)self->_cancelationToken isCanceled] & 1) == 0) {
    -[CNAutocompleteDelegateWrapper autocompleteFetchHitMaximumResultsCount:results:]();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__CNAutocompleteDelegateWrapper_autocompleteFetchHitMaximumResultsCount_results___block_invoke;
  v10[3] = &unk_1E63DDA58;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CNAutocompleteDelegateWrapper *)self queueUncancelableMessageToDelegate:v10];
}

void __81__CNAutocompleteDelegateWrapper_autocompleteFetchHitMaximumResultsCount_results___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _autocompleteFetch:*(void *)(a1 + 40) distributeReceivedResults:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 autocompleteFetchDidFinish:*(void *)(a1 + 40)];
}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  return [(CNAutocompleteFetchDelegate *)self->_delegate autocompleteFetch:a3 shouldExpectSupplementalResultsForRequest:a4 completionHandler:a5];
}

- (void)queueMessageToDelegate:(id)a3
{
  id v4 = a3;
  id v5 = self->_cancelationToken;
  scheduler = self->_scheduler;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__CNAutocompleteDelegateWrapper_queueMessageToDelegate___block_invoke;
  v9[3] = &unk_1E63DDAD0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [(CNScheduler *)scheduler performBlock:v9];
}

uint64_t __56__CNAutocompleteDelegateWrapper_queueMessageToDelegate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)queueUncancelableMessageToDelegate:(id)a3
{
}

- (void)cancel
{
}

- (void)setPredictionResultsFuture:(id)a3
{
  [(CNAutocompleteQueryResponsePreparer *)self->_responsePreparer setPriorityResultsFuture:a3];
  id v6 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  [(CNAutocompleteQueryResponsePreparer *)self->_responsePreparer setMatchingPriorityResultsPromise:v6];
  userSession = self->_userSession;
  id v5 = [v6 future];
  [(CNAutocompleteUserSession *)userSession willStartDuetRequestWithMatchingResultsFuture:v5];
}

- (CNAutocompleteFetchDelegate)delegate
{
  return self->_delegate;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (CNAutocompleteQueryResponsePreparer)responsePreparer
{
  return self->_responsePreparer;
}

- (unint64_t)openNetworkActivityCalls
{
  return self->_openNetworkActivityCalls;
}

- (void)setOpenNetworkActivityCalls:(unint64_t)a3
{
  self->_openNetworkActivityCalls = a3;
}

- (CNCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (CNAutocompleteUserSession)userSession
{
  return self->_userSession;
}

- (CNAutocompleteFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_responsePreparer, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)autocompleteFetchHitMaximumResultsCount:results:.cold.1()
{
}

@end