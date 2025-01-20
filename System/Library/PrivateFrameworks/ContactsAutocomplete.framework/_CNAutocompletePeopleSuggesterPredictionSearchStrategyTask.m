@interface _CNAutocompletePeopleSuggesterPredictionSearchStrategyTask
+ (id)_fallbackIdentifierByAssemblingDistinctValuesFromGroupResultSuggestion:(id)a3;
+ (id)_identifierForGroupResultSuggestion:(id)a3;
+ (int64_t)_addressTypeFromHandle:(id)a3;
- (_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask)initWithRequest:(id)a3 contactStore:(id)a4;
- (id)run:(id *)a3;
- (void)convertResults;
- (void)prepareQuery;
- (void)runQuery;
@end

@implementation _CNAutocompletePeopleSuggesterPredictionSearchStrategyTask

- (_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask)initWithRequest:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask;
  v9 = [(CNTask *)&v13 initWithName:@"com.apple.contacts.autocomplete.prediction-search.ps"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
    v11 = v10;
  }

  return v10;
}

- (id)run:(id *)a3
{
  [(_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask *)self prepareQuery];
  [(_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask *)self runQuery];
  [(_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask *)self convertResults];
  results = self->_results;
  return results;
}

- (void)prepareQuery
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = (_PSPredictionContext *)objc_alloc_init(get_PSPredictionContextClass_0());
  context = self->_context;
  self->_context = v3;

  v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v6 = [v5 mainBundleIdentifier];
  [(_PSPredictionContext *)self->_context setBundleID:v6];

  id v7 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  id v8 = [v7 sendingAddressAccountIdentifier];
  [(_PSPredictionContext *)self->_context setAccountIdentifier:v8];

  v9 = [(CNAutocompleteFetchRequest *)self->_request searchString];
  [(_PSPredictionContext *)self->_context setSearchPrefix:v9];

  v10 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  v11 = [v10 otherAddressesAlreadyChosen];
  [(_PSPredictionContext *)self->_context setSeedRecipients:v11];

  v12 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  objc_super v13 = [v12 locationUUID];

  if (v13)
  {
    v14 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
    v15 = [v14 locationUUID];
    v19[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [(_PSPredictionContext *)self->_context setLocationUUIDs:v16];
  }
  v17 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  v18 = [v17 date];
  [(_PSPredictionContext *)self->_context setSuggestionDate:v18];
}

- (void)runQuery
{
  v3 = CNALoggingContextTriage();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = CNALoggingContextPerformance();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Searching PeopleSuggester", "", buf, 2u);
  }

  id v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v8 = [v7 peopleSuggester];
  v9 = [v8 autocompleteSearchResultsWithPredictionContext:self->_context];
  psResults = self->_psResults;
  self->_psResults = v9;

  v11 = CNALoggingContextPerformance();
  v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)objc_super v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v12, OS_SIGNPOST_INTERVAL_END, v4, "Searching PeopleSuggester", "", v13, 2u);
  }
}

- (void)convertResults
{
  v3 = [(CNAutocompleteFetchRequest *)self->_request priorityDomainForSorting];
  os_signpost_id_t v4 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  v5 = [v4 sendingAddress];
  v6 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v3 sendingAddress:v5];

  id v7 = objc_opt_new();
  id v8 = [(CNAutocompleteFetchRequest *)self->_request searchString];
  if (v8)
  {
    v9 = [(CNAutocompleteFetchRequest *)self->_request searchString];
    BOOL v10 = [v9 length] == 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  v11 = [(_PSPredictionContext *)self->_context bundleID];
  psResults = self->_psResults;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke;
  v18[3] = &unk_1E63DE988;
  v18[4] = self;
  id v19 = v7;
  BOOL v22 = v10;
  id v20 = v6;
  id v21 = v11;
  id v13 = v11;
  id v14 = v6;
  id v15 = v7;
  v16 = [(NSArray *)psResults _cn_compactMap:v18];
  results = self->_results;
  self->_results = v16;
}

+ (int64_t)_addressTypeFromHandle:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  os_signpost_id_t v4 = v3;
  if (!v3 || ![v3 length])
  {
    id v7 = CNALoggingContextDebug();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1BEF57000, v7, OS_LOG_TYPE_DEFAULT, "Skipping a PeopleSuggester prediction with a nil or empty handle.", (uint8_t *)&v15, 2u);
    }
LABEL_7:
    int64_t v10 = 0;
    goto LABEL_8;
  }
  v5 = (void *)MEMORY[0x1E4F5A410];
  v17[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v7 = [v5 classificationOfHandleStrings:v6];

  id v8 = [v7 phoneNumbers];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v12 = [v7 emailAddresses];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      int64_t v10 = 1;
      goto LABEL_8;
    }
    id v14 = CNALoggingContextDebug();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "Unrecognized handle from duet: %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_7;
  }
  int64_t v10 = 2;
LABEL_8:

  return v10;
}

+ (id)_identifierForGroupResultSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 conversationIdentifier];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {

    v5 = [a1 _fallbackIdentifierByAssemblingDistinctValuesFromGroupResultSuggestion:v4];
  }

  return v5;
}

+ (id)_fallbackIdentifierByAssemblingDistinctValuesFromGroupResultSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [v3 groupName];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [v3 groupName];
    [v4 addObject:v7];
  }
  id v8 = [v3 recipients];
  uint64_t v9 = objc_msgSend(v8, "_cn_compactMap:", &__block_literal_global_26);

  [v4 addObjectsFromArray:v9];
  int64_t v10 = [v4 sortedArrayUsingSelector:sel_compare_];
  v11 = [v10 componentsJoinedByString:&stru_1F1A2F2D8];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_psResults, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end