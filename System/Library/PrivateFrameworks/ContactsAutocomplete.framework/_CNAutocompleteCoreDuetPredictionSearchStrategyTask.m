@interface _CNAutocompleteCoreDuetPredictionSearchStrategyTask
+ (id)constrainMechanismsForSearchType:(unint64_t)a3;
+ (int64_t)_addressTypeFromHandle:(id)a3;
+ (void)configureContext:(id)a3 withFetchRequest:(id)a4;
+ (void)configureSettings:(id)a3 withFetchRequest:(id)a4;
- (_CNAutocompleteCoreDuetPredictionSearchStrategyTask)initWithRequest:(id)a3 contactStore:(id)a4;
- (id)resultValueForCDContact:(id)a3;
- (id)run:(id *)a3;
- (id)suggesterContextForFetchRequest:(id)a3;
- (id)suggesterSettingsForFetchRequest:(id)a3;
- (int64_t)addressTypeForCDContact:(id)a3;
- (void)convertResults;
- (void)prepareQuery;
- (void)runQuery;
@end

@implementation _CNAutocompleteCoreDuetPredictionSearchStrategyTask

- (_CNAutocompleteCoreDuetPredictionSearchStrategyTask)initWithRequest:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNAutocompleteCoreDuetPredictionSearchStrategyTask;
  v9 = [(CNTask *)&v13 initWithName:@"com.apple.contacts.autocomplete.prediction-search.cd"];
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
  [(_CNAutocompleteCoreDuetPredictionSearchStrategyTask *)self prepareQuery];
  [(_CNAutocompleteCoreDuetPredictionSearchStrategyTask *)self runQuery];
  [(_CNAutocompleteCoreDuetPredictionSearchStrategyTask *)self convertResults];
  results = self->_results;
  return results;
}

- (void)prepareQuery
{
  v3 = [(_CNAutocompleteCoreDuetPredictionSearchStrategyTask *)self suggesterContextForFetchRequest:self->_request];
  context = self->_context;
  self->_context = v3;

  self->_settings = [(_CNAutocompleteCoreDuetPredictionSearchStrategyTask *)self suggesterSettingsForFetchRequest:self->_request];
  MEMORY[0x1F41817F8]();
}

- (id)suggesterContextForFetchRequest:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5B430];
  id v4 = a3;
  v5 = [v3 currentContext];
  [(id)objc_opt_class() configureContext:v5 withFetchRequest:v4];

  return v5;
}

+ (void)configureContext:(id)a3 withFetchRequest:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 fetchContext];
  v9 = [v8 otherAddressesAlreadyChosen];
  v10 = [v5 setWithArray:v9];
  [v7 setSeedContactIdentifiers:v10];

  v11 = [v6 fetchContext];
  v12 = [v11 title];
  [v7 setTitle:v12];

  objc_super v13 = [v6 fetchContext];
  v14 = [v13 locationUUID];
  [v7 setLocationUUID:v14];

  v15 = [v6 fetchContext];
  v16 = [v15 date];
  [v7 setDate:v16];

  id v17 = [v6 searchString];

  [v7 setContactPrefix:v17];
}

- (id)suggesterSettingsForFetchRequest:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5B438];
  id v4 = a3;
  v5 = [v3 defaultSettings];
  [(id)objc_opt_class() configureSettings:v5 withFetchRequest:v4];

  return v5;
}

+ (void)configureSettings:(id)a3 withFetchRequest:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  id v8 = [v6 fetchContext];
  v9 = [v8 sendingAddressAccountIdentifier];
  char v10 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v12 = [v6 fetchContext];
    objc_super v13 = [v12 sendingAddressAccountIdentifier];
    v14 = [v11 setWithObject:v13];
    [v33 setConstrainAccounts:v14];
  }
  v15 = [v6 fetchContext];
  v16 = [v15 domainIdentifier];
  char v17 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v16);

  if ((v17 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = [v6 fetchContext];
    v20 = [v19 domainIdentifier];
    v21 = [v18 setWithObject:v20];
    [v33 setConstrainDomainIdentifiers:v21];
  }
  v22 = objc_msgSend(a1, "constrainMechanismsForSearchType:", objc_msgSend(v6, "searchType"));
  [v33 setConstrainMechanisms:v22];

  v23 = [v6 fetchContext];
  objc_msgSend(v33, "setRequireOutgoingInteraction:", objc_msgSend(v23, "predictsBasedOnOutgoingInteraction"));

  v24 = [v6 searchString];
  int v25 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v24);

  if (v25)
  {
    unint64_t v26 = +[CNAutocompletePredictionSearch predictedResultLimit];
    if (v26) {
      [v33 setMaxNumberOfPeopleSuggested:v26];
    }
  }
  v27 = [v6 fetchContext];
  v28 = [v27 bundleIdentifiers];

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E4F1CAD0];
    v30 = [v6 fetchContext];
    v31 = [v30 bundleIdentifiers];
    v32 = [v29 setWithArray:v31];
    [v33 setConstrainBundleIds:v32];
  }
  if ([v6 searchType] == 3) {
    [v33 setUseFuture:1];
  }
}

+ (id)constrainMechanismsForSearchType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F1A3BE60, 0, v5, v6);
      goto LABEL_9;
    case 1uLL:
    case 4uLL:
    case 5uLL:
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F1A3BE78, &unk_1F1A3BE90, &unk_1F1A3BEA8, 0);
      goto LABEL_9;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F1A3BEC0, &unk_1F1A3BED8, &unk_1F1A3BEF0, 0);
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F1A3BE48, 0, v5, v6);
LABEL_9:
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return a1;
}

- (void)runQuery
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CNALoggingContextTriage();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = CNALoggingContextPerformance();
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Searching CoreDuet", "", buf, 2u);
  }

  uint64_t v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v8 = [v7 cdPeopleSuggester];
  context = self->_context;
  settings = self->_settings;
  id v19 = 0;
  v11 = [v8 suggestPeopleWithContext:context settings:settings error:&v19];
  id v12 = v19;

  objc_super v13 = CNALoggingContextPerformance();
  v14 = v13;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v14, OS_SIGNPOST_INTERVAL_END, v4, "Searching CoreDuet", "", buf, 2u);
  }

  if (v11)
  {
    v15 = v11;
    suggestions = self->_suggestions;
    self->_suggestions = v15;
  }
  else
  {
    char v17 = CNALoggingContextTriage();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(CNAutocompleteFetchRequest *)self->_request triageIdentifier];
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error searching CoreDuet: %{public}@", buf, 0x16u);
    }
    suggestions = self->_suggestions;
    self->_suggestions = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)convertResults
{
  uint64_t v3 = [(CNAutocompleteFetchRequest *)self->_request priorityDomainForSorting];
  os_signpost_id_t v4 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  uint64_t v5 = [v4 sendingAddress];
  uint64_t v6 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v3 sendingAddress:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v8 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  uint64_t v9 = [v8 otherAddressesAlreadyChosen];
  char v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CBF0];
  }
  id v12 = (void *)[v7 initWithArray:v11];

  suggestions = self->_suggestions;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke;
  v18[3] = &unk_1E63DE7D8;
  id v19 = v12;
  v20 = self;
  id v21 = v6;
  id v14 = v6;
  id v15 = v12;
  v16 = [(NSArray *)suggestions _cn_compactMap:v18];
  results = self->_results;
  self->_results = v16;
}

- (id)resultValueForCDContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CNAutocompleteResultValue);
  uint64_t v6 = [v4 identifier];
  [(CNAutocompleteResultValue *)v5 setAddress:v6];

  int64_t v7 = [(_CNAutocompleteCoreDuetPredictionSearchStrategyTask *)self addressTypeForCDContact:v4];
  [(CNAutocompleteResultValue *)v5 setAddressType:v7];
  return v5;
}

- (int64_t)addressTypeForCDContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 type];
  if ((unint64_t)(v4 - 1) >= 3)
  {
    uint64_t v6 = v4;
    int64_t v7 = CNALoggingContextDebug();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];
      int v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1BEF57000, v7, OS_LOG_TYPE_DEFAULT, "Unrecognized identifier type from duet: %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v9 = [MEMORY[0x1E4F5A568] standardPreferences];
    int v10 = [v9 userHasOptedInToPreference:@"CNGuessDuetIdentifierEnabledInAutocomplete"];

    if (v10)
    {
      uint64_t v11 = [v3 identifier];
      id v12 = CNALoggingContextDebug();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "No luck with the type, let's infer it from the handle (%@)", (uint8_t *)&v15, 0xCu);
      }

      int64_t v5 = [(id)objc_opt_class() _addressTypeFromHandle:v11];
    }
    else
    {
      objc_super v13 = CNALoggingContextDebug();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1BEF57000, v13, OS_LOG_TYPE_DEFAULT, "Returning none address type", (uint8_t *)&v15, 2u);
      }

      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = qword_1BEFB7330[v4 - 1];
  }

  return v5;
}

+ (int64_t)_addressTypeFromHandle:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F5A410];
  v16[0] = v3;
  int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v6 = [v4 classificationOfHandleStrings:v5];

  int64_t v7 = [v6 phoneNumbers];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    int64_t v9 = 2;
  }
  else
  {
    int v10 = [v6 emailAddresses];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      int64_t v9 = 1;
    }
    else
    {
      id v12 = CNALoggingContextDebug();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "Unrecognized handle from duet: %@", (uint8_t *)&v14, 0xCu);
      }

      int64_t v9 = 0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end