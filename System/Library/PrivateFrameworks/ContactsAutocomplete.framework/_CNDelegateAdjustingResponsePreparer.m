@interface _CNDelegateAdjustingResponsePreparer
- (id)prepareResults:(id)a3 forFetch:(id)a4;
- (void)adjustArray:(id)a3 byAddingResults:(id)a4;
- (void)adjustArray:(id)a3 byRemovingResults:(id)a4;
@end

@implementation _CNDelegateAdjustingResponsePreparer

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9C8] date];
  v9 = [(CNAutocompleteQueryResponsePreparer *)self delegate];
  v10 = [v9 autocompleteFetch:v7 willAdjustResults:v6];

  uint64_t v11 = [v10 count];
  v12 = CNALoggingContextDebug();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      [v8 timeIntervalSinceNow];
      int v26 = 134218243;
      double v27 = v14 * -1000.0;
      __int16 v28 = 2113;
      v29 = v10;
      _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "Delegate requested adjustments (%.3fms): %{private}@", (uint8_t *)&v26, 0x16u);
    }

    v15 = CNALoggingContextPerformance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      [v8 timeIntervalSinceNow];
      int v26 = 134218243;
      double v27 = v16 * -1000.0;
      __int16 v28 = 2113;
      v29 = v10;
      _os_log_impl(&dword_1BEF57000, v15, OS_LOG_TYPE_INFO, "Delegate requested adjustments (%.3fms): %{private}@", (uint8_t *)&v26, 0x16u);
    }

    v17 = (void *)[v6 mutableCopy];
    v18 = [v10 objectForKeyedSubscript:@"rejected"];
    [(_CNDelegateAdjustingResponsePreparer *)self adjustArray:v17 byRemovingResults:v18];

    v19 = [v10 objectForKeyedSubscript:@"additional"];
    [(_CNDelegateAdjustingResponsePreparer *)self adjustArray:v17 byAddingResults:v19];

    v20 = [(_CNAutocompleteResponsePreparerDecorator *)self preparer];
    v21 = [v20 prepareResults:v17 forFetch:v7];
  }
  else
  {
    if (v13)
    {
      [v8 timeIntervalSinceNow];
      int v26 = 134217984;
      double v27 = v22 * -1000.0;
      _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "Delegate made no adjustments (%.3fms)", (uint8_t *)&v26, 0xCu);
    }

    v23 = CNALoggingContextPerformance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      [v8 timeIntervalSinceNow];
      int v26 = 134217984;
      double v27 = v24 * -1000.0;
      _os_log_impl(&dword_1BEF57000, v23, OS_LOG_TYPE_INFO, "Delegate made no adjustments (%.3fms)", (uint8_t *)&v26, 0xCu);
    }

    v17 = [(_CNAutocompleteResponsePreparerDecorator *)self preparer];
    v21 = [v17 prepareResults:v6 forFetch:v7];
  }

  return v21;
}

- (void)adjustArray:(id)a3 byAddingResults:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5 && [v5 count]) {
    [v7 addObjectsFromArray:v6];
  }
}

- (void)adjustArray:(id)a3 byRemovingResults:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5 && [v5 count]) {
    [v7 removeObjectsInArray:v6];
  }
}

@end