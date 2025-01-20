@interface CNAutocompleteQueryCacheHelper
+ (BOOL)shouldCacheResults:(id)a3;
+ (id)cache_os_log;
+ (id)stringByRemovingLastCharacterFromString:(id)a3;
- (CNAutocompleteQueryCacheHelper)initWithCache:(id)a3 searchString:(id)a4 serverSearchObservable:(id)a5;
- (CNAutocompleteQueryCacheHelper)initWithCache:(id)a3 searchString:(id)a4 serverSearchObservable:(id)a5 cacheMissAuditor:(id)a6 schedulerProvider:(id)a7;
- (CNAutocompleteQueryCacheMissAuditor)cacheMissAuditor;
- (CNCache)cache;
- (CNObservable)serverSearchObservable;
- (CNSchedulerProvider)schedulerProvider;
- (NSString)searchString;
- (id)cachedFutureForSearchString:(id)a3;
- (id)cachedResultsObservable;
- (id)observablesForSearchString:(id)a3 withCachedResults:(id)a4;
- (id)remoteResultsForSearchString:(id)a3;
- (id)remoteResultsForSearchString:(id)a3 andCompletePromise:(id)a4;
- (id)uncachedResultsObservable;
@end

@implementation CNAutocompleteQueryCacheHelper

+ (id)cache_os_log
{
  if (cache_os_log_cn_once_token_0 != -1) {
    dispatch_once(&cache_os_log_cn_once_token_0, &__block_literal_global_19);
  }
  v2 = (void *)cache_os_log_cn_once_object_0;
  return v2;
}

uint64_t __46__CNAutocompleteQueryCacheHelper_cache_os_log__block_invoke()
{
  cache_os_log_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "cache");
  return MEMORY[0x1F41817F8]();
}

- (CNAutocompleteQueryCacheHelper)initWithCache:(id)a3 searchString:(id)a4 serverSearchObservable:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F5A4F0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 defaultProvider];
  v13 = objc_alloc_init(CNAutocompleteQueryCacheMissAuditor);
  v14 = [(CNAutocompleteQueryCacheHelper *)self initWithCache:v11 searchString:v10 serverSearchObservable:v9 cacheMissAuditor:v13 schedulerProvider:v12];

  return v14;
}

- (CNAutocompleteQueryCacheHelper)initWithCache:(id)a3 searchString:(id)a4 serverSearchObservable:(id)a5 cacheMissAuditor:(id)a6 schedulerProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CNAutocompleteQueryCacheHelper;
  v18 = [(CNAutocompleteQueryCacheHelper *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cache, a3);
    uint64_t v20 = [v14 copy];
    searchString = v19->_searchString;
    v19->_searchString = (NSString *)v20;

    objc_storeStrong((id *)&v19->_serverSearchObservable, a5);
    objc_storeStrong((id *)&v19->_cacheMissAuditor, a6);
    objc_storeStrong((id *)&v19->_schedulerProvider, a7);
    v22 = v19;
  }

  return v19;
}

- (id)cachedResultsObservable
{
  v3 = [(CNAutocompleteQueryCacheHelper *)self searchString];
  v4 = [(CNAutocompleteQueryCacheHelper *)self cachedFutureForSearchString:v3];
  if (v4) {
    [MEMORY[0x1E4F5A480] observableWithFuture:v4];
  }
  else {
  v5 = [MEMORY[0x1E4F5A480] emptyObservable];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke;
  v16[3] = &unk_1E63DE2E8;
  id v17 = v3;
  id v6 = v3;
  v7 = [v5 map:v16];

  v8 = [v7 filter:&__block_literal_global_9];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_3;
  v15[3] = &unk_1E63DDE28;
  v15[4] = self;
  id v9 = [v8 doOnNext:v15];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_11;
  v14[3] = &unk_1E63DDE50;
  v14[4] = self;
  id v10 = [v9 doOnError:v14];

  id v11 = [MEMORY[0x1E4F5A480] emptyObservable];
  v12 = [v10 onError:v11];

  return v12;
}

id __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[CNAutocompleteResultTokenMatcher alloc] initWithSearchString:*(void *)(a1 + 32)];
  v5 = [(CNAutocompleteResultTokenMatcher *)v4 filterAdapter];
  id v6 = objc_msgSend(v3, "_cn_filter:", v5);

  return v6;
}

BOOL __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

void __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Using %lu filtered results from the cache", (uint8_t *)&v6, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) cacheMissAuditor];
  [v5 didReturnCachedResults:v3];
}

void __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Error filtering cached results: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)cachedFutureForSearchString:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_cache;
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  objc_sync_enter(v7);
  uint64_t v8 = 0;
  *(void *)&long long v9 = 138412290;
  long long v16 = v9;
  id v10 = v6;
  while ([v10 length] && !v8)
  {
    uint64_t v8 = [(CNCache *)v7 objectForKeyedSubscript:v10];
    if (v8)
    {
      id v11 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v10 length];
        uint64_t v13 = [v6 length];
        *(_DWORD *)buf = 138412802;
        v18 = v10;
        __int16 v19 = 2048;
        uint64_t v20 = v12;
        __int16 v21 = 2048;
        uint64_t v22 = v13;
        _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Found entry in reuse cache (key “%@”, length %lu/%lu)", buf, 0x20u);
      }
    }
    else
    {
      id v14 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        v18 = v10;
        _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "No cache entry for “%@”", buf, 0xCu);
      }

      [(id)objc_opt_class() stringByRemovingLastCharacterFromString:v10];
      id v10 = v11 = v10;
    }
  }
  objc_sync_exit(v7);

  return v8;
}

- (id)uncachedResultsObservable
{
  id v3 = self->_cache;
  id v4 = (void *)MEMORY[0x1E4F5A480];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke;
  id v14 = &unk_1E63DE338;
  id v15 = self;
  long long v16 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 observableWithBlock:&v11];
  uint64_t v7 = *MEMORY[0x1E4F5A248];
  uint64_t v8 = [(CNAutocompleteQueryCacheHelper *)self schedulerProvider];
  long long v9 = [v6 flatMap:v7 schedulerProvider:v8];

  return v9;
}

id __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) searchString];
  id v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
    uint64_t v8 = [v7 future];
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v4];

    long long v9 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl(&dword_1BEF57000, v9, OS_LOG_TYPE_DEFAULT, "No existing cache entry for “%@”", buf, 0xCu);
    }
  }
  objc_sync_exit(v5);

  id v10 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v11 searchString];
  if (v7)
  {
    uint64_t v13 = [v11 remoteResultsForSearchString:v12 andCompletePromise:v7];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_15;
    v22[3] = &unk_1E63DE310;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v23 = v14;
    uint64_t v24 = v15;
    id v25 = v4;
    id v26 = v7;
    [v10 addCancelationBlock:v22];

    uint64_t v12 = v23;
  }
  else
  {
    uint64_t v13 = [v11 remoteResultsForSearchString:v12];
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_17;
  v19[3] = &unk_1E63DD700;
  id v20 = v3;
  id v21 = v13;
  id v16 = v13;
  id v17 = v3;
  [v10 performBlock:v19];

  return v10;
}

void __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_15(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Server search cancelled; removing cache entry for key “%@”",
      (uint8_t *)&v7,
      0xCu);
  }

  id v5 = *(void **)(a1 + 56);
  uint64_t v6 = [MEMORY[0x1E4F5A3F0] userCanceledError];
  [v5 finishWithError:v6];

  [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
  objc_sync_exit(v2);
}

uint64_t __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_17(uint64_t a1)
{
  [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 observerDidComplete];
}

+ (id)stringByRemovingLastCharacterFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v3, "length") - 1));

  return v4;
}

- (id)remoteResultsForSearchString:(id)a3
{
  uint64_t v4 = [(CNAutocompleteQueryCacheHelper *)self serverSearchObservable];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString___block_invoke;
  v7[3] = &unk_1E63DDE28;
  v7[4] = self;
  id v5 = [v4 doOnNext:v7];

  return v5;
}

void __63__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 cacheMissAuditor];
  [v4 didReturnLiveResults:v3];
}

- (id)remoteResultsForSearchString:(id)a3 andCompletePromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_cache;
  uint64_t v9 = [(CNAutocompleteQueryCacheHelper *)self serverSearchObservable];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke;
  v42[3] = &unk_1E63DE360;
  v42[4] = self;
  id v10 = v6;
  id v43 = v10;
  id v11 = v7;
  id v44 = v11;
  uint64_t v12 = v8;
  v45 = v12;
  uint64_t v13 = [v9 doOnNext:v42];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_21;
  v41[3] = &unk_1E63DDE28;
  v41[4] = self;
  id v14 = [v13 doOnNext:v41];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_2;
  v36[3] = &unk_1E63DE388;
  uint64_t v15 = v12;
  v37 = v15;
  v38 = self;
  id v16 = v10;
  id v39 = v16;
  id v17 = v11;
  id v40 = v17;
  v18 = [v14 doOnError:v36];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_22;
  v32[3] = &unk_1E63DDA58;
  __int16 v19 = v15;
  v33 = v19;
  v34 = self;
  id v20 = v17;
  id v35 = v20;
  id v21 = [v18 doOnCompletion:v32];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_27;
  v27[3] = &unk_1E63DE310;
  v28 = v19;
  uint64_t v29 = self;
  id v30 = v20;
  id v31 = v16;
  id v22 = v16;
  id v23 = v20;
  uint64_t v24 = v19;
  id v25 = [v21 doOnSubscribe:v27];

  return v25;
}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (+[CNAutocompleteQueryCacheHelper shouldCacheResults:v3])
  {
    objc_msgSend(v3, "_cn_flatten");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 count];
      uint64_t v7 = *(void *)(a1 + 40);
      int v12 = 134218242;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1BEF57000, v5, OS_LOG_TYPE_DEFAULT, "Caching %lu results for key “%@”", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 48) finishWithResult:v4];
  }
  else
  {
    id v4 = *(id *)(a1 + 56);
    objc_sync_enter(v4);
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Result set is not a candidate for caching; removing cache entry for key “%@”",
        (uint8_t *)&v12,
        0xCu);
    }

    id v10 = *(void **)(a1 + 48);
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactAutocompleteErrorDomain" code:101 userInfo:0];
    [v10 finishWithError:v11];

    [*(id *)(a1 + 56) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    objc_sync_exit(v4);
  }
}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 cacheMissAuditor];
  [v4 didReturnLiveResults:v3];
}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  id v5 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1BEF57000, v5, OS_LOG_TYPE_DEFAULT, "Server search failed with error %{public}@; removing cache entry for key “%@”",
      (uint8_t *)&v7,
      0x16u);
  }

  [*(id *)(a1 + 56) finishWithError:v3];
  [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
  objc_sync_exit(v4);
}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_22(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 48) future];
    int v5 = [v4 isFinished];
    uint64_t v6 = @"IS NOT";
    if (v5) {
      uint64_t v6 = @"IS";
    }
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Server complete; promise %@ finished",
      (uint8_t *)&v7,
      0xCu);
  }
  objc_sync_exit(v2);
}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_27(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Caching the future of promise %@ for key “%@”", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 48) future];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*(void *)(a1 + 56)];

  objc_sync_exit(v2);
}

- (id)observablesForSearchString:(id)a3 withCachedResults:(id)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F5A480] observableWithFuture:a4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke;
  v22[3] = &unk_1E63DE2E8;
  id v23 = v6;
  id v8 = v6;
  __int16 v9 = [v7 map:v22];

  uint64_t v10 = [v9 filter:&__block_literal_global_29];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_3;
  v21[3] = &unk_1E63DDE28;
  v21[4] = self;
  uint64_t v11 = [v10 doOnNext:v21];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_30;
  v20[3] = &unk_1E63DDE50;
  v20[4] = self;
  int v12 = [v11 doOnError:v20];

  uint64_t v13 = [MEMORY[0x1E4F5A480] emptyObservable];
  __int16 v14 = [v12 onError:v13];

  uint64_t v15 = [(CNAutocompleteQueryCacheHelper *)self serverSearchObservable];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_31;
  v19[3] = &unk_1E63DDE28;
  void v19[4] = self;
  uint64_t v16 = [v15 doOnNext:v19];

  id v17 = [MEMORY[0x1E4F5A490] pairWithFirst:v14 second:v16];

  return v17;
}

id __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[CNAutocompleteResultTokenMatcher alloc] initWithSearchString:*(void *)(a1 + 32)];
  uint64_t v5 = [(CNAutocompleteResultTokenMatcher *)v4 filterAdapter];
  id v6 = objc_msgSend(v3, "_cn_filter:", v5);

  return v6;
}

BOOL __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

void __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Using %lu filtered results from the cache", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [*(id *)(a1 + 32) cacheMissAuditor];
  [v5 didReturnCachedResults:v3];
}

void __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_msgSend((id)objc_opt_class(), "cache_os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Error filtering cached results: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_31(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 cacheMissAuditor];
  [v4 didReturnLiveResults:v3];
}

+ (BOOL)shouldCacheResults:(id)a3
{
  return __ROR8__(0x8F5C28F5C28F5C29 * [a3 count], 2) > 0x28F5C28F5C28F5CuLL;
}

- (CNCache)cache
{
  return self->_cache;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (CNObservable)serverSearchObservable
{
  return self->_serverSearchObservable;
}

- (CNAutocompleteQueryCacheMissAuditor)cacheMissAuditor
{
  return self->_cacheMissAuditor;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_cacheMissAuditor, 0);
  objc_storeStrong((id *)&self->_serverSearchObservable, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end