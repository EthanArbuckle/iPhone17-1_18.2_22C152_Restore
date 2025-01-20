@interface _CNSortingResponsePreparer
- (id)prepareResults:(id)a3 forFetch:(id)a4;
@end

@implementation _CNSortingResponsePreparer

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNAutocompleteQueryResponsePreparer *)self delegate];
  [v8 autocompleteFetch:v7 willSortResults:v6];

  v9 = [(CNAutocompleteQueryResponsePreparer *)self delegate];
  v10 = [v9 resultComparatorForAutocompleteFetch:v7];

  v11 = CNALoggingContextDebug();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Using sorting algoritm provided by client", buf, 2u);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54___CNSortingResponsePreparer_prepareResults_forFetch___block_invoke;
    v22[3] = &unk_1E63DE868;
    id v23 = v10;
    v13 = [v6 sortedArrayUsingComparator:v22];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Using standard sorting algorithms", buf, 2u);
    }

    v13 = [v6 sortedArrayUsingSelector:sel_compare_];
  }
  v14 = CNALoggingContextDebug();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v15 = [v13 count];
    if (v15 < 0x1F5) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v15, v21);
    }
    else {
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v15);
    }
    v17 = objc_msgSend(v13, "_cn_take:", 500);
    *(_DWORD *)buf = 138543619;
    v25 = v16;
    __int16 v26 = 2113;
    v27 = v17;
    _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "Sorted results: (%{public}@): %{private}@", buf, 0x16u);
  }
  v18 = [(_CNAutocompleteResponsePreparerDecorator *)self preparer];
  v19 = [v18 prepareResults:v13 forFetch:v7];

  return v19;
}

@end