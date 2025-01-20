@interface CNAutocompleteStore
+ (double)defaultFetchCoalescingInterval;
- (CNAutocompleteProbeProvider)probeProvider;
- (CNAutocompleteSearchProvider)searchProvider;
- (CNAutocompleteStore)init;
- (CNAutocompleteStore)initWithDelegate:(id)a3;
- (CNAutocompleteStore)initWithDelegate:(id)a3 searchProvider:(id)a4 probeProvider:(id)a5 scheduler:(id)a6;
- (CNAutocompleteStoreQueryHelper)queryHelper;
- (CNAutocompleteStoreReproStringRecorder)reproStringRecorder;
- (CNAutocompleteUserSession)userSession;
- (CNCancelationToken)currentFetchToken;
- (CNScheduler)scheduler;
- (double)fetchCoalescingInterval;
- (id)executeFetchRequest:(id)a3;
- (id)executeFetchRequest:(id)a3 afterDelay:(double)a4 delegate:(id)a5;
- (id)executeFetchRequest:(id)a3 delegate:(id)a4;
- (id)scheduleFetchRequest:(id)a3;
- (id)scheduleFetchRequest:(id)a3 delegate:(id)a4;
- (void)ignoreResult:(id)a3 completionHandler:(id)a4;
- (void)setCurrentFetchToken:(id)a3;
- (void)setFetchCoalescingInterval:(double)a3;
- (void)setReproStringRecorder:(id)a3;
- (void)setUserSession:(id)a3;
- (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4;
@end

@implementation CNAutocompleteStore

- (CNAutocompleteStore)init
{
  return [(CNAutocompleteStore *)self initWithDelegate:0];
}

- (CNAutocompleteStore)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[CNAutocompleteSearchProviderFactory cachingProvider];
  v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v7 = [v6 schedulerProvider];
  v8 = [v7 backgroundScheduler];

  v9 = +[CNAutocompleteProbeProviderFactory defaultProbeProvider];
  v10 = [(CNAutocompleteStore *)self initWithDelegate:v4 searchProvider:v5 probeProvider:v9 scheduler:v8];

  return v10;
}

- (CNAutocompleteStore)initWithDelegate:(id)a3 searchProvider:(id)a4 probeProvider:(id)a5 scheduler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CNAutocompleteStore;
  v14 = [(CNAutocompleteStore *)&v24 init];
  if (v14)
  {
    v15 = [[CNAutocompleteUserSession alloc] initWithProbeProvider:v12];
    userSession = v14->_userSession;
    v14->_userSession = v15;

    v17 = [[CNAutocompleteStoreQueryHelper alloc] initWithSearchProvider:v11 delegate:v10 probeProvider:v12 scheduler:v13 userSession:v14->_userSession];
    queryHelper = v14->_queryHelper;
    v14->_queryHelper = v17;

    objc_storeStrong((id *)&v14->_scheduler, a6);
    objc_storeStrong((id *)&v14->_probeProvider, a5);
    [(id)objc_opt_class() defaultFetchCoalescingInterval];
    v14->_fetchCoalescingInterval = v19;
    v20 = [[CNAutocompleteStoreReproStringRecorder alloc] initWithTimeProvider:v13];
    reproStringRecorder = v14->_reproStringRecorder;
    v14->_reproStringRecorder = v20;

    v22 = v14;
  }

  return v14;
}

+ (double)defaultFetchCoalescingInterval
{
  v2 = [MEMORY[0x1E4F5A568] standardPreferences];
  v3 = [v2 objectForKey:@"CNAutocompleteKeystrokeCoalescingInterval"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.2;
  }

  return v5;
}

- (CNAutocompleteSearchProvider)searchProvider
{
  v2 = [(CNAutocompleteStore *)self queryHelper];
  v3 = [v2 searchProvider];

  return (CNAutocompleteSearchProvider *)v3;
}

- (id)scheduleFetchRequest:(id)a3
{
  return [(CNAutocompleteStore *)self scheduleFetchRequest:a3 delegate:0];
}

- (id)scheduleFetchRequest:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CNAutocompleteStore *)self fetchCoalescingInterval];
  if (v8 == 0.0)
  {
    [(CNAutocompleteStore *)self executeFetchRequest:v6 delegate:v7];
  }
  else
  {
    [(CNAutocompleteStore *)self fetchCoalescingInterval];
    -[CNAutocompleteStore executeFetchRequest:afterDelay:delegate:](self, "executeFetchRequest:afterDelay:delegate:", v6, v7);
  v9 = };

  return v9;
}

- (id)executeFetchRequest:(id)a3 afterDelay:(double)a4 delegate:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = CNALoggingContextDebug();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v43 = v8;
    __int16 v44 = 2048;
    double v45 = a4;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling request %{private}@ after delay (%.3fs)", buf, 0x16u);
  }

  id v11 = [v8 searchNames];
  BOOL v12 = [v11 count] == 1;

  if (v12)
  {
    id v13 = [(CNAutocompleteStore *)self reproStringRecorder];
    v14 = [v8 searchString];
    [v13 recordString:v14];

    v15 = CNALoggingContextDebug();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(CNAutocompleteStore *)self reproStringRecorder];
      v17 = [v16 reproString];
      *(_DWORD *)buf = 138412290;
      id v43 = v17;
      _os_log_impl(&dword_1BEF57000, v15, OS_LOG_TYPE_DEFAULT, "Repro string: %@", buf, 0xCu);
    }
  }
  v18 = CNALoggingContextDebug();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = [(CNAutocompleteStore *)self currentFetchToken];
    *(_DWORD *)buf = 134217984;
    id v43 = v19;
    _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_DEFAULT, "Cancelling current fetch token (%p)", buf, 0xCu);
  }
  v20 = [(CNAutocompleteStore *)self currentFetchToken];
  [v20 cancel];

  id v21 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  [(CNAutocompleteStore *)self setCurrentFetchToken:v21];
  id v41 = 0;
  char v22 = [v8 isValid:&v41];
  id v23 = v41;
  if (v22)
  {
    objc_super v24 = [(CNAutocompleteStore *)self userSession];
    [v24 willStartExecutingRequest:v8];

    objc_initWeak((id *)buf, self);
    v25 = [(CNAutocompleteStore *)self currentFetchToken];
    v26 = [(CNAutocompleteStore *)self scheduler];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2;
    v33[3] = &unk_1E63DDA80;
    objc_copyWeak(&v36, (id *)buf);
    id v34 = v8;
    id v35 = v9;
    v27 = [v26 afterDelay:v33 performBlock:a4];
    [v25 addCancelable:v27];

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v28 = CNALoggingContextDebug();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v43 = v8;
      __int16 v44 = 2112;
      double v45 = *(double *)&v23;
      _os_log_impl(&dword_1BEF57000, v28, OS_LOG_TYPE_DEFAULT, "Fetch request is not valid: %@, error:%@, stopping.", buf, 0x16u);
    }

    v29 = [(CNAutocompleteStore *)self scheduler];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke;
    v37[3] = &unk_1E63DDA58;
    id v38 = v9;
    id v39 = v21;
    id v40 = v23;
    id v30 = (id)[v29 afterDelay:v37 performBlock:0.0];
  }
  v31 = [(CNAutocompleteStore *)self currentFetchToken];

  return v31;
}

uint64_t __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autocompleteFetch:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
}

void __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    v3 = [WeakRetained queryHelper];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = [v10 currentFetchToken];
    id v7 = [v3 executeFetchRequest:v5 delegate:v4 delegateToken:v6];

    id v8 = [v10 currentFetchToken];
    if (v7 == v8) {
      __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2_cold_1();
    }

    id v9 = [v10 currentFetchToken];
    [v9 addCancelable:v7];

    id WeakRetained = v10;
  }
}

- (id)executeFetchRequest:(id)a3
{
  return [(CNAutocompleteStore *)self executeFetchRequest:a3 delegate:0];
}

- (id)executeFetchRequest:(id)a3 delegate:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CNALoggingContextDebug();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %@", buf, 0xCu);
  }

  id v9 = [(CNAutocompleteStore *)self currentFetchToken];
  [v9 cancel];

  id v10 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  [(CNAutocompleteStore *)self setCurrentFetchToken:v10];
  id v27 = 0;
  char v11 = [v6 isValid:&v27];
  id v12 = v27;
  if (v11)
  {
    id v13 = [(CNAutocompleteStore *)self userSession];
    [v13 willStartExecutingRequest:v6];

    v14 = [(CNAutocompleteStore *)self queryHelper];
    v15 = [(CNAutocompleteStore *)self currentFetchToken];
    v16 = [v14 executeFetchRequest:v6 delegate:v7 delegateToken:v15];

    v17 = [(CNAutocompleteStore *)self currentFetchToken];
    [v17 addCancelable:v16];
  }
  else
  {
    v18 = CNALoggingContextDebug();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_DEFAULT, "Fetch request is not valid: %@, error:%@, stopping.", buf, 0x16u);
    }

    double v19 = [(CNAutocompleteStore *)self scheduler];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__CNAutocompleteStore_executeFetchRequest_delegate___block_invoke;
    v23[3] = &unk_1E63DDA58;
    id v24 = v7;
    id v25 = v10;
    id v26 = v12;
    id v20 = (id)[v19 afterDelay:v23 performBlock:0.0];

    v16 = v24;
  }

  id v21 = [(CNAutocompleteStore *)self currentFetchToken];

  return v21;
}

uint64_t __52__CNAutocompleteStore_executeFetchRequest_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autocompleteFetch:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
}

- (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CNAutocompleteStore *)self userSession];
  [v7 didSelectResult:v6 atSortedIndex:a4];

  id v8 = [(CNAutocompleteStore *)self reproStringRecorder];
  [v8 clear];
}

- (void)ignoreResult:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 ignoreResultBlock];

  if (v8)
  {
    id v9 = [(CNAutocompleteStore *)self scheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__CNAutocompleteStore_ignoreResult_completionHandler___block_invoke;
    v10[3] = &unk_1E63DDAD0;
    id v11 = v6;
    id v12 = v7;
    [v9 performBlock:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __54__CNAutocompleteStore_ignoreResult_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ignoreResultBlock];
  id v6 = 0;
  uint64_t v3 = ((uint64_t (**)(void, id *))v2)[2](v2, &v6);
  id v4 = v6;

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v3, v4);
  }
}

- (double)fetchCoalescingInterval
{
  return self->_fetchCoalescingInterval;
}

- (void)setFetchCoalescingInterval:(double)a3
{
  self->_fetchCoalescingInterval = a3;
}

- (CNAutocompleteStoreQueryHelper)queryHelper
{
  return self->_queryHelper;
}

- (CNCancelationToken)currentFetchToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentFetchToken);
  return (CNCancelationToken *)WeakRetained;
}

- (void)setCurrentFetchToken:(id)a3
{
}

- (CNAutocompleteUserSession)userSession
{
  return self->_userSession;
}

- (void)setUserSession:(id)a3
{
}

- (CNAutocompleteStoreReproStringRecorder)reproStringRecorder
{
  return self->_reproStringRecorder;
}

- (void)setReproStringRecorder:(id)a3
{
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_reproStringRecorder, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_destroyWeak((id *)&self->_currentFetchToken);
  objc_storeStrong((id *)&self->_queryHelper, 0);
}

void __63__CNAutocompleteStore_executeFetchRequest_afterDelay_delegate___block_invoke_2_cold_1()
{
  __assert_rtn("-[CNAutocompleteStore executeFetchRequest:afterDelay:delegate:]_block_invoke_2", "CNAutocompleteStore.m", 122, "queryToken != self.currentFetchToken");
}

@end