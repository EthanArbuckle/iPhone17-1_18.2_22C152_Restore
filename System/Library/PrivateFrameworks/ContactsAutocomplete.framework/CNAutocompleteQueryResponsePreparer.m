@interface CNAutocompleteQueryResponsePreparer
- (CNAutocompleteFetchDelegate)delegate;
- (CNAutocompleteFetchRequest)fetchRequest;
- (CNAutocompleteQueryResponsePreparer)init;
- (CNAutocompleteQueryResponsePreparer)initWithDelegate:(id)a3;
- (CNAutocompleteQueryResponsePreparer)initWithDelegate:(id)a3 fetchRequest:(id)a4;
- (CNFuture)priorityResultsFuture;
- (CNPromise)matchingPriorityResultsPromise;
- (id)addDiagnosticLog:(id)a3;
- (id)applyPriorityResultsOrder:(id)a3;
- (id)askDelegateToAdjustResults;
- (id)findUniqueResults:(id)a3;
- (id)prepareResults:(id)a3 forFetch:(id)a4;
- (id)resultsNotPreviouslyReturned:(id)a3;
- (id)sortResults;
- (id)suppressResultsWithAddresses:(id)a3;
- (void)setMatchingPriorityResultsPromise:(id)a3;
- (void)setPriorityResultsFuture:(id)a3;
@end

@implementation CNAutocompleteQueryResponsePreparer

- (CNAutocompleteQueryResponsePreparer)init
{
  return [(CNAutocompleteQueryResponsePreparer *)self initWithDelegate:0];
}

- (CNAutocompleteQueryResponsePreparer)initWithDelegate:(id)a3
{
  return [(CNAutocompleteQueryResponsePreparer *)self initWithDelegate:a3 fetchRequest:0];
}

- (CNAutocompleteQueryResponsePreparer)initWithDelegate:(id)a3 fetchRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteQueryResponsePreparer;
  v8 = [(CNAutocompleteQueryResponsePreparer *)&v13 init];
  if (v8)
  {
    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    previouslyReturnedResults = v8->_previouslyReturnedResults;
    v8->_previouslyReturnedResults = v9;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_fetchRequest, a4);
    v11 = v8;
  }

  return v8;
}

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = CNALoggingContextDebug();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [v5 count];
    if (v7 < 0x1F5) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7, v42);
    }
    else {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v7);
    }
    *(_DWORD *)buf = 138543362;
    v44 = v8;
    _os_log_impl(&dword_1BEF57000, v6, OS_LOG_TYPE_DEFAULT, "Calling prepareResults: (%{public}@)", buf, 0xCu);
  }
  v9 = [(CNAutocompleteQueryResponsePreparer *)self findUniqueResults:v5];
  v10 = CNALoggingContextDebug();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = [v9 count];
    if (v11 < 0x1F5) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v11, v42);
    }
    else {
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v11);
    }
    *(_DWORD *)buf = 138543362;
    v44 = v12;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "Found unique results: (%{public}@)", buf, 0xCu);
  }
  objc_super v13 = [(CNAutocompleteQueryResponsePreparer *)self resultsNotPreviouslyReturned:v9];
  v14 = CNALoggingContextDebug();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v15 = [v13 count];
    if (v15 < 0x1F5) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v15, v42);
    }
    else {
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v15);
    }
    *(_DWORD *)buf = 138543362;
    v44 = v16;
    _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "Found unique results not previously returned: (%{public}@)", buf, 0xCu);
  }
  v17 = CNALoggingContextDebug();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = [v13 count];
    if (v18 < 0x1F5) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v18, v42);
    }
    else {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v18);
    }
    *(_DWORD *)buf = 138543362;
    v44 = v19;
    _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "Found unique new results not previously returned: (%{public}@)", buf, 0xCu);
  }
  v20 = [(CNAutocompleteQueryResponsePreparer *)self fetchRequest];
  v21 = [v20 searchString];
  uint64_t v22 = [v21 length];

  v23 = CNALoggingContextDebug();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      unint64_t v25 = [v13 count];
      if (v25 < 0x1F5) {
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", v25, v42);
      }
      else {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v25);
      }
      *(_DWORD *)buf = 138543362;
      v44 = v27;
      _os_log_impl(&dword_1BEF57000, v23, OS_LOG_TYPE_DEFAULT, "Search string has length > 0: (%{public}@)", buf, 0xCu);
    }
    id v28 = [(CNAutocompleteQueryResponsePreparer *)self applyPriorityResultsOrder:v13];
  }
  else
  {
    if (v24)
    {
      unint64_t v26 = [v13 count];
      if (v26 < 0x1F5) {
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", v26, v42);
      }
      else {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v26);
      }
      *(_DWORD *)buf = 138543362;
      v44 = v29;
      _os_log_impl(&dword_1BEF57000, v23, OS_LOG_TYPE_DEFAULT, "Search string has length = 0: (%{public}@)", buf, 0xCu);
    }
    id v28 = v13;
  }
  v30 = v28;
  v31 = CNALoggingContextDebug();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v32 = [v9 count];
    if (v32 < 0x1F5) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v32, v42);
    }
    else {
    v33 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v32);
    }
    v34 = objc_msgSend(v9, "_cn_take:", 500);
    *(_DWORD *)buf = 138543619;
    v44 = v33;
    __int16 v45 = 2113;
    v46 = v34;
    _os_log_impl(&dword_1BEF57000, v31, OS_LOG_TYPE_DEFAULT, "Unique results: (%{public}@): %{private}@", buf, 0x16u);
  }
  if (CNAutocompleteIsDebugLoggingEnabled())
  {
    v35 = (void *)[v5 mutableCopy];
    [v35 removeObjectsInArray:v13];
    v36 = CNALoggingContextDebug();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v44 = v35;
      _os_log_impl(&dword_1BEF57000, v36, OS_LOG_TYPE_DEFAULT, "Dropping duplicate results: %{private}@", buf, 0xCu);
    }

    v37 = CNALoggingContextDebug();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v38 = [v30 count];
      if (v38 < 0x1F5) {
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", v38, v42);
      }
      else {
      v39 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v38);
      }
      v40 = objc_msgSend(v30, "_cn_take:", 500);
      *(_DWORD *)buf = 138543619;
      v44 = v39;
      __int16 v45 = 2113;
      v46 = v40;
      _os_log_impl(&dword_1BEF57000, v37, OS_LOG_TYPE_DEFAULT, "Will return re-ranked results (%{public}@): %{private}@", buf, 0x16u);
    }
  }

  return v30;
}

- (id)findUniqueResults:(id)a3
{
  return +[CNAutocompleteQueryResponseUniqueResultFinder findUniqueResults:a3 duplicateResultHandler:&__block_literal_global_25];
}

uint64_t __57__CNAutocompleteQueryResponsePreparer_findUniqueResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateUsingInformationFromRelatedResult:");
}

- (id)resultsNotPreviouslyReturned:(id)a3
{
  previouslyReturnedResults = self->_previouslyReturnedResults;
  id v5 = a3;
  uint64_t v6 = [(NSMutableOrderedSet *)previouslyReturnedResults count];
  [(NSMutableOrderedSet *)self->_previouslyReturnedResults addObjectsFromArray:v5];

  uint64_t v7 = [(NSMutableOrderedSet *)self->_previouslyReturnedResults count] - v6;
  v8 = [(NSMutableOrderedSet *)self->_previouslyReturnedResults array];
  v9 = objc_msgSend(v8, "subarrayWithRange:", v6, v7);

  return v9;
}

- (id)applyPriorityResultsOrder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5A3D8];
  id v5 = a3;
  uint64_t v6 = [v4 currentEnvironment];
  uint64_t v7 = [v6 suggestedResultPrioritization];

  v8 = [(CNAutocompleteQueryResponsePreparer *)self fetchRequest];
  v9 = [(CNAutocompleteQueryResponsePreparer *)self matchingPriorityResultsPromise];
  v10 = [v7 applyPriorityOrderToResults:v5 fetchRequest:v8 andCompletePriorityResultsPromise:v9];

  return v10;
}

- (id)addDiagnosticLog:(id)a3
{
  id v4 = a3;
  id v5 = [_CNDiagnosticResponsePreparer alloc];
  uint64_t v6 = [(CNAutocompleteQueryResponsePreparer *)self delegate];
  uint64_t v7 = [(_CNDiagnosticResponsePreparer *)v5 initWithResponsePreparer:self delegate:v6 log:v4];

  return v7;
}

- (id)sortResults
{
  v3 = [_CNSortingResponsePreparer alloc];
  id v4 = [(CNAutocompleteQueryResponsePreparer *)self delegate];
  id v5 = [(_CNAutocompleteResponsePreparerDecorator *)v3 initWithResponsePreparer:self delegate:v4];

  return v5;
}

- (id)askDelegateToAdjustResults
{
  v3 = [_CNDelegateAdjustingResponsePreparer alloc];
  id v4 = [(CNAutocompleteQueryResponsePreparer *)self delegate];
  id v5 = [(_CNAutocompleteResponsePreparerDecorator *)v3 initWithResponsePreparer:self delegate:v4];

  return v5;
}

- (id)suppressResultsWithAddresses:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = objc_msgSend(a3, "_cn_map:", CNAutocompleteResultAddressStringForHashingTransform);
  uint64_t v6 = [v4 setWithArray:v5];

  uint64_t v7 = [_CNFilteringResponsePreparer alloc];
  v8 = [(CNAutocompleteQueryResponsePreparer *)self delegate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CNAutocompleteQueryResponsePreparer_suppressResultsWithAddresses___block_invoke;
  v12[3] = &unk_1E63DE4C0;
  id v13 = v6;
  id v9 = v6;
  v10 = [(_CNFilteringResponsePreparer *)v7 initWithResponsePreparer:self delegate:v8 filter:v12];

  return v10;
}

uint64_t __68__CNAutocompleteQueryResponsePreparer_suppressResultsWithAddresses___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void (**)(uint64_t, void *))CNAutocompleteResultAddressStringForHashingTransform;
  id v4 = [a2 value];
  id v5 = [v4 address];
  uint64_t v6 = v3[2]((uint64_t)v3, v5);

  uint64_t v7 = [*(id *)(a1 + 32) containsObject:v6] ^ 1;
  return v7;
}

- (CNAutocompleteFetchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CNAutocompleteFetchDelegate *)WeakRetained;
}

- (CNAutocompleteFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (CNFuture)priorityResultsFuture
{
  return self->_priorityResultsFuture;
}

- (void)setPriorityResultsFuture:(id)a3
{
}

- (CNPromise)matchingPriorityResultsPromise
{
  return self->_matchingPriorityResultsPromise;
}

- (void)setMatchingPriorityResultsPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingPriorityResultsPromise, 0);
  objc_storeStrong((id *)&self->_priorityResultsFuture, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handleStringClassifier, 0);
  objc_storeStrong((id *)&self->_previouslyReturnedResults, 0);
}

@end