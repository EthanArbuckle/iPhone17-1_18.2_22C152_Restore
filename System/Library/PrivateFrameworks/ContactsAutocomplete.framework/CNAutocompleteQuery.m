@interface CNAutocompleteQuery
+ (BOOL)searchTypeSupportsSuppressionOfAlreadyChosenAddresses:(unint64_t)a3;
+ (BOOL)shouldPerformQueryForRequest:(id)a3;
+ (BOOL)shouldSortResultsForPolicy:(id)a3;
+ (BOOL)shouldSuppressAddressesAlreadyChosenForRequest:(id)a3;
+ (id)observableForQuery:(id)a3 context:(id)a4;
+ (id)observableWithSupplementalResultsForQuery:(id)a3;
+ (id)queryWithRequest:(id)a3 searchProvider:(id)a4 delegate:(id)a5 probeProvider:(id)a6 scheduler:(id)a7 userSession:(id)a8 delegateToken:(id)a9;
+ (void)configureNetworkActivityHandlersForBuilder:(id)a3 query:(id)a4;
+ (void)configureNetworkForBuilder:(id)a3 query:(id)a4;
+ (void)configureNetworkPolicyForBuilder:(id)a3 query:(id)a4;
- (CNAutocompleteDelegateWrapper)delegate;
- (CNAutocompleteFetchRequest)request;
- (CNAutocompleteProbeProvider)probeProvider;
- (CNAutocompleteQuery)initWithRequest:(id)a3 searchProvider:(id)a4 delegate:(id)a5 probeProvider:(id)a6 scheduler:(id)a7 userSession:(id)a8 delegateToken:(id)a9;
- (CNAutocompleteSearchProvider)searchProvider;
- (CNAutocompleteSourceInclusionPolicy)sourceInclusionPolicy;
- (CNAutocompleteUserSession)userSession;
- (CNCancelable)delegateToken;
- (CNCancelationToken)cancelationToken;
- (CNScheduler)scheduler;
- (NSArray)completeResults;
- (id)execute;
- (id)executeWithContext:(id)a3;
- (id)makeDelegateWrapperWithDelegate:(id)a3 forRequest:(id)a4 sourceInclusionPolicy:(id)a5 userSession:(id)a6;
- (void)cancel;
- (void)searchOperationEncounteredError:(id)a3;
- (void)searchOperationReportedResults:(id)a3;
- (void)searchOperationsHaveBegunNetworkActivity;
- (void)searchOperationsHaveEndedNetworkActivity;
- (void)searchOperationsHaveFinished;
- (void)setCancelationToken:(id)a3;
- (void)setCompleteResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateToken:(id)a3;
- (void)setProbeProvider:(id)a3;
- (void)setRequest:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSearchProvider:(id)a3;
- (void)setSourceInclusionPolicy:(id)a3;
- (void)setUserSession:(id)a3;
@end

@implementation CNAutocompleteQuery

+ (id)queryWithRequest:(id)a3 searchProvider:(id)a4 delegate:(id)a5 probeProvider:(id)a6 scheduler:(id)a7 userSession:(id)a8 delegateToken:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = (void *)[objc_alloc((Class)a1) initWithRequest:v22 searchProvider:v21 delegate:v20 probeProvider:v19 scheduler:v18 userSession:v17 delegateToken:v16];

  return v23;
}

- (CNAutocompleteQuery)initWithRequest:(id)a3 searchProvider:(id)a4 delegate:(id)a5 probeProvider:(id)a6 scheduler:(id)a7 userSession:(id)a8 delegateToken:(id)a9
{
  id v15 = a3;
  id v34 = a4;
  id v16 = a5;
  id v33 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (CNAutocompleteQuery *)a9;
  v37.receiver = self;
  v37.super_class = (Class)CNAutocompleteQuery;
  id v20 = [(CNAutocompleteQuery *)&v37 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    request = v20->_request;
    v20->_request = (CNAutocompleteFetchRequest *)v21;

    objc_storeStrong((id *)&v20->_searchProvider, a4);
    objc_storeStrong((id *)&v20->_probeProvider, a6);
    objc_storeStrong((id *)&v20->_userSession, a8);
    if (v19) {
      v23 = v19;
    }
    else {
      v23 = v20;
    }
    objc_storeWeak((id *)&v20->_delegateToken, v23);
    uint64_t v24 = +[CNAutocompleteSourceInclusionPolicy defaultPolicyWithFetchRequest:v15];
    sourceInclusionPolicy = v20->_sourceInclusionPolicy;
    v20->_sourceInclusionPolicy = (CNAutocompleteSourceInclusionPolicy *)v24;

    v26 = [(CNAutocompleteQuery *)v20 makeDelegateWrapperWithDelegate:v16 forRequest:v20->_request sourceInclusionPolicy:v20->_sourceInclusionPolicy userSession:v20->_userSession];
    objc_storeStrong((id *)&v20->_delegate, v26);
    v27 = (void *)MEMORY[0x1E4F5A368];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __113__CNAutocompleteQuery_initWithRequest_searchProvider_delegate_probeProvider_scheduler_userSession_delegateToken___block_invoke;
    v35[3] = &unk_1E63DD9C0;
    id v36 = v26;
    id v28 = v26;
    uint64_t v29 = [v27 tokenWithCancelationBlock:v35];
    cancelationToken = v20->_cancelationToken;
    v20->_cancelationToken = (CNCancelationToken *)v29;

    objc_storeStrong((id *)&v20->_scheduler, a7);
    v31 = v20;
  }
  return v20;
}

uint64_t __113__CNAutocompleteQuery_initWithRequest_searchProvider_delegate_probeProvider_scheduler_userSession_delegateToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)makeDelegateWrapperWithDelegate:(id)a3 forRequest:(id)a4 sourceInclusionPolicy:(id)a5 userSession:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [[CNAutocompleteDelegateWrapper alloc] initWithDelegate:v12 userSession:v10 fetchRequest:v9];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__CNAutocompleteQuery_makeDelegateWrapperWithDelegate_forRequest_sourceInclusionPolicy_userSession___block_invoke;
  v22[3] = &unk_1E63DE3B0;
  id v14 = v9;
  id v23 = v14;
  id v15 = [(CNAutocompleteDelegateWrapper *)v13 addDiagnosticLog:v22];

  LODWORD(v13) = [(id)objc_opt_class() shouldSortResultsForPolicy:v11];
  if (v13)
  {
    uint64_t v16 = [v15 sortResults];

    id v15 = (void *)v16;
  }
  id v17 = [v15 askDelegateToAdjustResults];

  if ([(id)objc_opt_class() shouldSuppressAddressesAlreadyChosenForRequest:v14])
  {
    id v18 = [v14 fetchContext];
    id v19 = [v18 otherAddressesAlreadyChosen];
    uint64_t v20 = [v17 suppressResultsWithAddresses:v19];

    id v17 = (void *)v20;
  }

  return v17;
}

uint64_t __100__CNAutocompleteQuery_makeDelegateWrapperWithDelegate_forRequest_sourceInclusionPolicy_userSession___block_invoke(uint64_t a1)
{
  return [NSString stringWithFormat:@"Request: %@", *(void *)(a1 + 32)];
}

+ (BOOL)shouldSuppressAddressesAlreadyChosenForRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 fetchContext];
  v6 = [v5 otherAddressesAlreadyChosen];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F5A568] standardPreferences];
    char v9 = [v8 userHasOptedInToPreference:@"CNSuppressAddressesAlreadyChosen"];

    if (v9) {
      char v10 = 1;
    }
    else {
      char v10 = objc_msgSend(a1, "searchTypeSupportsSuppressionOfAlreadyChosenAddresses:", objc_msgSend(v4, "searchType"));
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)searchTypeSupportsSuppressionOfAlreadyChosenAddresses:(unint64_t)a3
{
  return a3 != 0;
}

+ (BOOL)shouldSortResultsForPolicy:(id)a3
{
  id v3 = a3;
  if (([v3 includeRecents] & 1) != 0
    || ([v3 includeStewie] & 1) != 0
    || ([v3 includeContacts] & 1) != 0
    || ([v3 includeSuggestions] & 1) != 0
    || ([v3 includeCalendarServers] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 includeDirectoryServers];
  }

  return v4;
}

- (id)execute
{
  return [(CNAutocompleteQuery *)self executeWithContext:0];
}

- (id)executeWithContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4F5A488];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__CNAutocompleteQuery_executeWithContext___block_invoke;
  v23[3] = &unk_1E63DE3D8;
  objc_copyWeak(&v24, &location);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__CNAutocompleteQuery_executeWithContext___block_invoke_2;
  v21[3] = &unk_1E63DE400;
  objc_copyWeak(&v22, &location);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__CNAutocompleteQuery_executeWithContext___block_invoke_3;
  v19[3] = &unk_1E63DE428;
  objc_copyWeak(&v20, &location);
  v6 = [v5 observerWithResultBlock:v23 completionBlock:v21 failureBlock:v19];
  uint64_t v7 = [(id)objc_opt_class() observableForQuery:self context:v4];
  v8 = [(CNAutocompleteQuery *)self scheduler];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __42__CNAutocompleteQuery_executeWithContext___block_invoke_4;
  uint64_t v16 = &unk_1E63DE450;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  id v18 = v10;
  id v11 = [v8 performCancelableBlock:&v13];

  -[CNCancelationToken addCancelable:](self->_cancelationToken, "addCancelable:", v11, v13, v14, v15, v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return self;
}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained searchOperationReportedResults:v3];
}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained searchOperationsHaveFinished];
}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained searchOperationEncounteredError:v3];
}

void __42__CNAutocompleteQuery_executeWithContext___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 subscribe:v3];
  [v4 addCancelable:v5];
}

+ (id)observableForQuery:(id)a3 context:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 request];
  char v9 = [a1 shouldPerformQueryForRequest:v8];

  if (v9)
  {
    id v10 = [v6 request];
    uint64_t v11 = [v10 searchType];
    id v12 = [v6 scheduler];
    uint64_t v13 = [v6 probeProvider];
    uint64_t v14 = +[CNAutocompleteObservableBuilder builderWithSearchType:v11 scheduler:v12 probeProvider:v13];

    id v15 = [v6 sourceInclusionPolicy];
    uint64_t v16 = [v6 searchProvider];
    id v17 = [v6 request];
    id v18 = [v6 scheduler];
    id v19 = +[CNAutocompleteSearchObservableProvider providerWithSearchProvider:v16 fetchRequest:v17 scheduler:v18];

    [a1 configureNetworkForBuilder:v14 query:v6];
    if ([v15 includeContacts])
    {
      id v20 = [v19 localSearchObservable];
      [v14 addContactsObservable:v20];
      uint64_t v21 = CNALoggingContextDebug();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v20;
        _os_log_impl(&dword_1BEF57000, v21, OS_LOG_TYPE_DEFAULT, "Adding local contacts observable %@", buf, 0xCu);
      }
    }
    if ([v15 includeRecents])
    {
      id v22 = [v19 recentsSearchObservable];
      [v14 addCoreRecentsObservable:v22];
      id v23 = CNALoggingContextDebug();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v22;
        _os_log_impl(&dword_1BEF57000, v23, OS_LOG_TYPE_DEFAULT, "Adding recent contacts observable %@", buf, 0xCu);
      }
    }
    if ([v15 includeStewie])
    {
      id v24 = [v19 stewieSearchObservable];
      [v14 addStewieObservable:v24];
      v25 = CNALoggingContextDebug();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v19;
        _os_log_impl(&dword_1BEF57000, v25, OS_LOG_TYPE_DEFAULT, "Adding Stewie observable %@", buf, 0xCu);
      }
    }
    if ([v15 includeSuggestions])
    {
      v26 = [v19 suggestionsSearchObservable];
      [v14 addSuggestionsObservable:v26];
      v27 = CNALoggingContextDebug();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v26;
        _os_log_impl(&dword_1BEF57000, v27, OS_LOG_TYPE_DEFAULT, "Adding suggested contacts observable %@", buf, 0xCu);
      }
    }
    id v70 = a1;
    if ([v15 includeLocalExtensions])
    {
      id v28 = [v19 localExtensionSearchObservables];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __50__CNAutocompleteQuery_observableForQuery_context___block_invoke;
      v75[3] = &unk_1E63DE478;
      id v76 = v14;
      objc_msgSend(v28, "_cn_each:", v75);
    }
    if ([v15 includePredictions])
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
      v30 = [v19 predictionsSearchObservableWithUnfilteredResultPromise:v29];
      v31 = [v6 delegate];
      v32 = [v29 future];
      [v31 setPredictionResultsFuture:v32];

      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __50__CNAutocompleteQuery_observableForQuery_context___block_invoke_16;
      v73[3] = &unk_1E63DD9C0;
      id v74 = v29;
      id v33 = v29;
      [v14 addPredictionObservable:v30 doOnTimeout:v73];
      id v34 = CNALoggingContextDebug();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v30;
        _os_log_impl(&dword_1BEF57000, v34, OS_LOG_TYPE_DEFAULT, "Adding predictions CoreDuet/PeopleSuggester observable %@", buf, 0xCu);
      }
    }
    if ([v15 includeDirectoryServers])
    {
      v68 = v19;
      v35 = [v19 directoryServersSearchObservable];
      id v71 = v7;
      id v36 = [v7 directoryServerReuseCache];
      objc_super v37 = [v6 request];
      v38 = [v37 searchString];

      v39 = [[CNAutocompleteQueryCacheHelper alloc] initWithCache:v36 searchString:v38 serverSearchObservable:v35];
      v40 = [(CNAutocompleteQueryCacheHelper *)v39 cachedResultsObservable];
      [v14 addCachedDirectoryServerObservable:v40];
      v41 = CNALoggingContextDebug();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v40;
        _os_log_impl(&dword_1BEF57000, v41, OS_LOG_TYPE_DEFAULT, "Adding cached directory servers observable %@", buf, 0xCu);
      }

      v42 = [(CNAutocompleteQueryCacheHelper *)v39 uncachedResultsObservable];
      [v14 addDirectoryServerObservable:v42];
      v43 = CNALoggingContextDebug();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v42;
        _os_log_impl(&dword_1BEF57000, v43, OS_LOG_TYPE_DEFAULT, "Adding directory servers observable %@", buf, 0xCu);
      }

      id v7 = v71;
      id v19 = v68;
    }
    if ([v15 includeCalendarServers]
      && +[CNAutocompleteCalendarServerSearch isSupported])
    {
      v69 = v19;
      uint64_t v44 = [v19 calendarServersSearchObservable];
      id v72 = v7;
      uint64_t v45 = [v7 calendarServerReuseCache];
      v46 = [v6 request];
      uint64_t v47 = [v46 searchString];

      v48 = [CNAutocompleteQueryCacheHelper alloc];
      v66 = (void *)v44;
      v67 = (void *)v45;
      uint64_t v49 = v45;
      v50 = (void *)v47;
      v51 = [(CNAutocompleteQueryCacheHelper *)v48 initWithCache:v49 searchString:v47 serverSearchObservable:v44];
      v52 = [(CNAutocompleteQueryCacheHelper *)v51 cachedResultsObservable];
      v53 = [(CNAutocompleteQueryCacheHelper *)v51 uncachedResultsObservable];
      v54 = [v53 publish];

      v55 = [[CNAutocompleteCalendarQueryAssembler alloc] initWithRawCachedObservable:v52 rawUncachedObservable:v54];
      [(CNAutocompleteCalendarQueryAssembler *)v55 assemble];
      v56 = [(CNAutocompleteCalendarQueryAssembler *)v55 cachedObservable];
      [v14 addCachedCalendarServerObservable:v56];

      v57 = [(CNAutocompleteCalendarQueryAssembler *)v55 uncachedObservable];
      [v14 addCalendarServerObservable:v57];

      v58 = CNALoggingContextDebug();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = [(CNAutocompleteCalendarQueryAssembler *)v55 cachedObservable];
        *(_DWORD *)buf = 138412290;
        v78 = v59;
        _os_log_impl(&dword_1BEF57000, v58, OS_LOG_TYPE_DEFAULT, "Adding cached calendar servers observable %@", buf, 0xCu);
      }
      v60 = CNALoggingContextDebug();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [(CNAutocompleteCalendarQueryAssembler *)v55 uncachedObservable];
        *(_DWORD *)buf = 138412290;
        v78 = v61;
        _os_log_impl(&dword_1BEF57000, v60, OS_LOG_TYPE_DEFAULT, "Adding calendar servers observable %@", buf, 0xCu);
      }
      id v7 = v72;
      id v19 = v69;
    }
    if ([v15 includeSupplementalResults])
    {
      v62 = [v70 observableWithSupplementalResultsForQuery:v6];
      [v14 addSupplementalObservable:v62];

      v63 = CNALoggingContextDebug();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v19;
        _os_log_impl(&dword_1BEF57000, v63, OS_LOG_TYPE_DEFAULT, "Adding supplemental observable %@", buf, 0xCu);
      }
    }
    v64 = [v14 makeObservable];
  }
  else
  {
    v64 = [MEMORY[0x1E4F5A480] emptyObservable];
  }

  return v64;
}

void __50__CNAutocompleteQuery_observableForQuery_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) addLocalExtensionObservable:v3];
  id v4 = CNALoggingContextDebug();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Adding local extensions observable %@", (uint8_t *)&v5, 0xCu);
  }
}

void __50__CNAutocompleteQuery_observableForQuery_context___block_invoke_16(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Duet observable timed out.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"CNContactAutocompleteErrorDomain" code:1 userInfo:v3];
  [v1 finishWithError:v4];
}

+ (BOOL)shouldPerformQueryForRequest:(id)a3
{
  return 1;
}

+ (void)configureNetworkForBuilder:(id)a3 query:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 configureNetworkPolicyForBuilder:v7 query:v6];
  [a1 configureNetworkActivityHandlersForBuilder:v7 query:v6];
}

+ (void)configureNetworkPolicyForBuilder:(id)a3 query:(id)a4
{
  id v5 = a3;
  id v6 = [a4 request];
  id v7 = [v6 searchString];
  id v8 = +[CNAutocompleteNetworkActivityPolicy policyWithThrottlingDelayForString:v7];

  [v8 delayBeforeBeginningNetworkActivity];
  objc_msgSend(v5, "setNetworkActivityStartDelay:");
}

+ (void)configureNetworkActivityHandlersForBuilder:(id)a3 query:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_initWeak(&location, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke;
  v9[3] = &unk_1E63DE400;
  objc_copyWeak(&v10, &location);
  [v5 setNetworkActivityDidStartHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke_2;
  v7[3] = &unk_1E63DE400;
  objc_copyWeak(&v8, &location);
  [v5 setNetworkActivityDidStopHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained searchOperationsHaveBegunNetworkActivity];
}

void __72__CNAutocompleteQuery_configureNetworkActivityHandlersForBuilder_query___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained searchOperationsHaveEndedNetworkActivity];
}

+ (id)observableWithSupplementalResultsForQuery:(id)a3
{
  id v3 = a3;
  id v4 = [v3 request];
  id v5 = [v4 triageIdentifier];

  id v6 = CNALoggingContextDebug();
  id v7 = (void *)MEMORY[0x1E4F5A480];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke;
  v13[3] = &unk_1E63DE560;
  id v14 = v3;
  id v15 = v5;
  id v16 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = v3;
  uint64_t v11 = [v7 observableWithBlock:v13];

  return v11;
}

id __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] scheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2;
  v8[3] = &unk_1E63DE538;
  id v9 = a1[4];
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = v3;
  id v5 = v3;
  id v6 = [v4 performCancelableBlock:v8];

  return v6;
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2(id *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5A330]) initWithState:1];
  id v5 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v5 timestamp];
  uint64_t v7 = v6;

  id v8 = CNALoggingContextTriage();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = CNALoggingContextPerformance();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Searching via Delegate (supplemental results", "", buf, 2u);
  }

  id v12 = [a1[4] delegate];
  uint64_t v13 = [a1[4] delegateToken];
  id v14 = [a1[4] request];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_28;
  v25[3] = &unk_1E63DE510;
  os_signpost_id_t v33 = v9;
  uint64_t v34 = v7;
  id v26 = a1[5];
  id v15 = v3;
  id v27 = v15;
  v32 = v35;
  id v28 = a1[4];
  id v29 = a1[6];
  id v16 = v4;
  id v30 = v16;
  id v31 = a1[7];
  int v17 = [v12 autocompleteFetch:v13 shouldExpectSupplementalResultsForRequest:v14 completionHandler:v25];

  if (v17)
  {
    id v18 = CNALoggingContextTriage();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = a1[5];
      *(_DWORD *)buf = 138543362;
      id v38 = v19;
      _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Supplemental: Results are expected", buf, 0xCu);
    }
  }
  else
  {
    id v20 = CNALoggingContextTriage();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = a1[5];
      *(_DWORD *)buf = 138543362;
      id v38 = v21;
      _os_log_impl(&dword_1BEF57000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Supplemental: Results are not expected", buf, 0xCu);
    }

    id v22 = CNALoggingContextPerformance();
    id v23 = v22;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BEF57000, v23, OS_SIGNPOST_INTERVAL_END, v9, "Searching via Delegate (supplemental results", "", buf, 2u);
    }

    if ([v16 trySetState:0])
    {
      [a1[7] observerDidComplete];
    }
    else
    {
      id v24 = a1[6];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2_cold_1(v24);
      }
    }
  }

  _Block_object_dispose(v35, 8);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CNALoggingContextPerformance();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 88);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Searching via Delegate (supplemental results", "", buf, 2u);
  }

  id v10 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v10 timestamp];
  double v12 = v11;

  uint64_t v13 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v12 - *(double *)(a1 + 96)];
  id v14 = CNALoggingContextTriage();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v15) {
      goto LABEL_12;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v52 = (uint64_t)v6;
    int v17 = "[%{public}@] Supplemental: Search failed (%{public}@): %{public}@";
    id v18 = v14;
    uint32_t v19 = 32;
  }
  else
  {
    if (!v15) {
      goto LABEL_12;
    }
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = [v5 count];
    uint64_t v22 = [v5 count];
    id v23 = "results";
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    if (v22 == 1) {
      id v23 = "result";
    }
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2080;
    uint64_t v52 = (uint64_t)v23;
    __int16 v53 = 2114;
    v54 = v13;
    int v17 = "[%{public}@] Supplemental: Search complete (%lu %s, %{public}@)";
    id v18 = v14;
    uint32_t v19 = 42;
  }
  _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_12:

  if ([*(id *)(a1 + 40) isCanceled]) {
    goto LABEL_32;
  }
  uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v24 + 24))
  {
    CNAutocompleteDelegateMultipleCallbacks(*(void **)(a1 + 48));
    goto LABEL_32;
  }
  *(unsigned char *)(v24 + 24) = 1;
  v25 = [*(id *)(a1 + 48) request];
  if ([v25 searchType] == 1)
  {
    BOOL v26 = [v5 count] == 0;

    if (v26) {
      goto LABEL_27;
    }
    v25 = objc_msgSend(v5, "_cn_filter:", &__block_literal_global_20);
    id v27 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = v27;
      uint64_t v29 = [v25 count];
      uint64_t v30 = [v25 count];
      id v31 = "groups";
      if (v30 == 1) {
        id v31 = "group";
      }
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_1BEF57000, v28, OS_LOG_TYPE_INFO, "Supplemental results include %lu %s to check for matching members.", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v52 = 1;
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36;
    v42 = &unk_1E63DE4E8;
    id v43 = *(id *)(a1 + 40);
    id v44 = *(id *)(a1 + 56);
    v46 = buf;
    id v45 = *(id *)(a1 + 48);
    v32 = objc_msgSend(v25, "_cn_flatMap:", &v39);
    os_signpost_id_t v33 = *(id *)(a1 + 56);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = objc_msgSend(v32, "count", v39, v40, v41, v42, v43, v44);
      uint64_t v35 = [v32 count];
      char v36 = "members";
      if (v35 == 1) {
        char v36 = "member";
      }
      *(_DWORD *)uint64_t v47 = 134218242;
      uint64_t v48 = v34;
      __int16 v49 = 2080;
      v50 = v36;
      _os_log_impl(&dword_1BEF57000, v33, OS_LOG_TYPE_INFO, "Promoting %lu %s to include with the top-level results", v47, 0x16u);
    }

    uint64_t v37 = [v5 arrayByAddingObjectsFromArray:v32];

    _Block_object_dispose(buf, 8);
    id v5 = (id)v37;
  }

LABEL_27:
  if ((objc_msgSend(*(id *)(a1 + 40), "isCanceled", v39, v40, v41, v42) & 1) == 0)
  {
    if ([*(id *)(a1 + 64) trySetState:0])
    {
      [MEMORY[0x1E4F5A488] sendResult:v5 error:v6 toObserver:*(void *)(a1 + 72)];
    }
    else
    {
      id v38 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_28_cold_1(v38);
      }
    }
  }
LABEL_32:
}

BOOL __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_32(uint64_t a1, void *a2)
{
  return [a2 resultType] == 1;
}

id __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isCanceled])
  {
    id v4 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v5;
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Supplemental search has been cancelled; will not expand group %lu.",
        buf,
        0xCu);
    }
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v23 = 0;
    uint64_t v7 = [v3 members:&v23];
    id v8 = v23;
    if (v7)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_37;
      uint64_t v21 = &unk_1E63DE4C0;
      id v22 = *(id *)(a1 + 48);
      id v6 = objc_msgSend(v7, "_cn_filter:", &v18);
      os_signpost_id_t v9 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v14 = *(void *)(v13 + 24);
        *(void *)(v13 + 24) = v14 + 1;
        BOOL v15 = v9;
        uint64_t v16 = objc_msgSend(v6, "count", v18, v19, v20, v21);
        uint64_t v17 = [v7 count];
        *(_DWORD *)buf = 134218496;
        uint64_t v25 = v14;
        __int16 v26 = 2048;
        uint64_t v27 = v16;
        __int16 v28 = 2048;
        uint64_t v29 = v17;
        _os_log_debug_impl(&dword_1BEF57000, v15, OS_LOG_TYPE_DEBUG, "Expanding group %lu: %lu/%lu members matched", buf, 0x20u);
      }
    }
    else
    {
      id v10 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36_cold_2((uint64_t)v3, (uint64_t)v8, v10);
      }
      double v11 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36_cold_1(a1, v11);
      }
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v6;
}

uint64_t __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  id v4 = [v3 address];
  uint64_t v5 = [*(id *)(a1 + 32) request];
  id v6 = [v5 searchString];
  uint64_t v7 = objc_msgSend(v4, "_cn_hasPrefix:", v6);

  return v7;
}

- (void)searchOperationReportedResults:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNAutocompleteQuery *)self request];
  uint64_t v6 = [v5 maximumResultsCount];
  uint64_t v7 = [(CNAutocompleteQuery *)self completeResults];
  id v8 = objc_msgSend(v4, "_cn_take:", v6 - objc_msgSend(v7, "count"));

  os_signpost_id_t v9 = [(CNAutocompleteQuery *)self completeResults];
  id v10 = [v4 arrayByAddingObjectsFromArray:v9];

  [(CNAutocompleteQuery *)self setCompleteResults:v10];
  double v11 = [(CNAutocompleteQuery *)self completeResults];
  unint64_t v12 = [v11 count];
  uint64_t v13 = [(CNAutocompleteQuery *)self request];
  unint64_t v14 = [v13 maximumResultsCount];

  if (v12 >= v14)
  {
    uint64_t v17 = CNALoggingContextTriage();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(CNAutocompleteQuery *)self request];
      uint64_t v19 = [v18 triageIdentifier];
      uint64_t v20 = [(CNAutocompleteQuery *)self request];
      uint64_t v21 = [v20 maximumResultsCount];
      id v22 = [(CNAutocompleteQuery *)self completeResults];
      int v25 = 138543874;
      __int16 v26 = v19;
      __int16 v27 = 2048;
      uint64_t v28 = v21;
      __int16 v29 = 2048;
      uint64_t v30 = [v22 count];
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reached maximumResultsCount (%lu) completeResults: (%lu), cancelling.", (uint8_t *)&v25, 0x20u);
    }
    [(CNAutocompleteQuery *)self cancel];
    id v23 = [(CNAutocompleteQuery *)self delegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
    [v23 autocompleteFetchHitMaximumResultsCount:WeakRetained results:v8];
  }
  else
  {
    delegate = self->_delegate;
    id v16 = objc_loadWeakRetained((id *)&self->_delegateToken);
    [(CNAutocompleteDelegateWrapper *)delegate autocompleteFetch:v16 didReceiveResults:v8];
  }
}

- (void)searchOperationEncounteredError:(id)a3
{
  delegate = self->_delegate;
  p_delegateToken = &self->_delegateToken;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegateToken);
  [(CNAutocompleteDelegateWrapper *)delegate autocompleteFetchDidEndNetworkActivity:WeakRetained];

  id v8 = self->_delegate;
  id v9 = objc_loadWeakRetained((id *)p_delegateToken);
  [(CNAutocompleteDelegateWrapper *)v8 autocompleteFetch:v9 didFailWithError:v6];
}

- (void)searchOperationsHaveBegunNetworkActivity
{
  id v3 = CNALoggingContextDebug();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Search operations have begun network activity", v6, 2u);
  }

  delegate = self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
  [(CNAutocompleteDelegateWrapper *)delegate autocompleteFetchDidBeginNetworkActivity:WeakRetained];
}

- (void)searchOperationsHaveEndedNetworkActivity
{
  id v3 = CNALoggingContextDebug();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Search operations have ended network activity", v6, 2u);
  }

  delegate = self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
  [(CNAutocompleteDelegateWrapper *)delegate autocompleteFetchDidEndNetworkActivity:WeakRetained];
}

- (void)searchOperationsHaveFinished
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = CNALoggingContextTriage();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CNAutocompleteQuery *)self request];
    uint64_t v5 = [v4 triageIdentifier];
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Search operation complete.", (uint8_t *)&v8, 0xCu);
  }
  delegate = self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
  [(CNAutocompleteDelegateWrapper *)delegate autocompleteFetchDidFinish:WeakRetained];
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = CNALoggingContextDebug();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
    int v5 = 134218240;
    id v6 = self;
    __int16 v7 = 2048;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling query %p, delegate token: %p", (uint8_t *)&v5, 0x16u);
  }
  [(CNCancelationToken *)self->_cancelationToken cancel];
}

- (CNAutocompleteFetchRequest)request
{
  return (CNAutocompleteFetchRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
}

- (CNAutocompleteDelegateWrapper)delegate
{
  return (CNAutocompleteDelegateWrapper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (CNScheduler)scheduler
{
  return (CNScheduler *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScheduler:(id)a3
{
}

- (CNCancelationToken)cancelationToken
{
  return (CNCancelationToken *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCancelationToken:(id)a3
{
}

- (CNAutocompleteSearchProvider)searchProvider
{
  return (CNAutocompleteSearchProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSearchProvider:(id)a3
{
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return (CNAutocompleteProbeProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProbeProvider:(id)a3
{
}

- (CNAutocompleteUserSession)userSession
{
  return (CNAutocompleteUserSession *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserSession:(id)a3
{
}

- (CNCancelable)delegateToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateToken);
  return (CNCancelable *)WeakRetained;
}

- (void)setDelegateToken:(id)a3
{
}

- (CNAutocompleteSourceInclusionPolicy)sourceInclusionPolicy
{
  return (CNAutocompleteSourceInclusionPolicy *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSourceInclusionPolicy:(id)a3
{
}

- (NSArray)completeResults
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCompleteResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeResults, 0);
  objc_storeStrong((id *)&self->_sourceInclusionPolicy, 0);
  objc_destroyWeak((id *)&self->_delegateToken);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BEF57000, log, OS_LOG_TYPE_ERROR, "Tried to complete the supplemental results observer, but the observer has already been completed", v1, 2u);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_28_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BEF57000, log, OS_LOG_TYPE_ERROR, "Tried to send supplemental results to observer, but the observer has already been completed", v1, 2u);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36_cold_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  id v4 = a2;
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = [0 count];
  _os_log_debug_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEBUG, "Expanding group %lu resulted in error, 0/%lu members matched", (uint8_t *)&v5, 0x16u);
}

void __65__CNAutocompleteQuery_observableWithSupplementalResultsForQuery___block_invoke_36_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BEF57000, log, OS_LOG_TYPE_ERROR, "Error expanding supplemental group (%{public}@): %{public}@", (uint8_t *)&v3, 0x16u);
}

@end