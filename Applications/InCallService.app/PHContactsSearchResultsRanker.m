@interface PHContactsSearchResultsRanker
- (BOOL)printReason;
- (PHContactsSearchResultsRanker)init;
- (_PSEnsembleModel)model;
- (_PSPredictionContext)context;
- (_PSSuggesterConfiguration)configuration;
- (id)autocompleteSuggestionForContact:(id)a3 phoneNumber:(id)a4;
- (id)rankContactSearchResults:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setModel:(id)a3;
- (void)setPrintReason:(BOOL)a3;
@end

@implementation PHContactsSearchResultsRanker

- (PHContactsSearchResultsRanker)init
{
  v10.receiver = self;
  v10.super_class = (Class)PHContactsSearchResultsRanker;
  v2 = [(PHContactsSearchResultsRanker *)&v10 init];
  if (v2)
  {
    v3 = (_PSPredictionContext *)objc_alloc_init((Class)_PSPredictionContext);
    context = v2->_context;
    v2->_context = v3;

    [(_PSPredictionContext *)v2->_context setBundleID:@"com.apple.InCallService"];
    uint64_t v5 = +[_PSSuggesterConfiguration defaultConfiguration];
    configuration = v2->_configuration;
    v2->_configuration = (_PSSuggesterConfiguration *)v5;

    v7 = (_PSEnsembleModel *)objc_alloc_init((Class)_PSEnsembleModel);
    model = v2->_model;
    v2->_model = v7;
  }
  return v2;
}

- (id)rankContactSearchResults:(id)a3
{
  id v4 = a3;
  v38 = +[NSMutableArray array];
  uint64_t v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v51 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ContactsSearchResultsRanker] Received request to rank %lu contacts", buf, 0xCu);
  }

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v47;
    id v35 = v7;
    id v36 = v6;
    uint64_t v34 = *(void *)v47;
    do
    {
      v11 = 0;
      id v37 = v9;
      do
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v11);
        v13 = [v12 contact];
        v14 = [v13 identifier];
        [v6 setObject:v12 forKeyedSubscript:v14];

        v15 = [v12 preferredPhoneNumber];

        if (v15)
        {
          v16 = [v12 preferredPhoneNumber];
          v17 = [(PHContactsSearchResultsRanker *)self autocompleteSuggestionForContact:v13 phoneNumber:v16];

          [v38 addObject:v17];
        }
        else
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v17 = [v13 phoneNumbers];
          id v18 = [v17 countByEnumeratingWithState:&v42 objects:v54 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = 0;
            uint64_t v21 = *(void *)v43;
LABEL_12:
            uint64_t v22 = 0;
            while (1)
            {
              if (*(void *)v43 != v21) {
                objc_enumerationMutation(v17);
              }
              v23 = [(PHContactsSearchResultsRanker *)self autocompleteSuggestionForContact:v13 phoneNumber:*(void *)(*((void *)&v42 + 1) + 8 * v22)];
              [v38 addObject:v23];

              if (v20 + v22 == 4) {
                break;
              }
              if (v19 == (id)++v22)
              {
                id v19 = [v17 countByEnumeratingWithState:&v42 objects:v54 count:16];
                v20 += v22;
                if (v19) {
                  goto LABEL_12;
                }
                break;
              }
            }
            id v7 = v35;
            id v6 = v36;
            uint64_t v10 = v34;
            id v9 = v37;
          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v9);
  }

  v24 = sub_1000D5130();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v38 count];
    id v26 = [v7 count];
    *(_DWORD *)buf = 134218240;
    id v51 = v25;
    __int16 v52 = 2048;
    id v53 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[ContactsSearchResultsRanker] Created %lu candidates from %lu contacts", buf, 0x16u);
  }

  v27 = [(PHContactsSearchResultsRanker *)self model];
  v28 = [(PHContactsSearchResultsRanker *)self context];
  v29 = [v27 rankedAutocompleteSuggestionsFromContext:v28 candidates:v38];

  id v30 = objc_alloc_init((Class)NSMutableArray);
  if ([v29 count])
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100094EC0;
    v39[3] = &unk_1002CF918;
    id v40 = v6;
    id v41 = v30;
    [v29 enumerateObjectsUsingBlock:v39];
  }
  v31 = sub_1000D5130();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = [v30 count];
    *(_DWORD *)buf = 134217984;
    id v51 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[ContactsSearchResultsRanker] After ranking, rankedContactSearchResults = %lu", buf, 0xCu);
  }

  return v30;
}

- (id)autocompleteSuggestionForContact:(id)a3 phoneNumber:(id)a4
{
  id v5 = a3;
  id v6 = [a4 value];
  id v7 = [v6 unformattedInternationalStringValue];

  id v8 = objc_alloc((Class)_PSAutocompleteSuggestion);
  id v9 = [v5 displayName];
  uint64_t v10 = [v5 identifier];

  id v11 = [v8 initWithChatGuid:0 chatHandles:0 displayName:v9 handle:v7 contactIdentifier:v10 resultSourceType:16 autocompleteResult:0 recipients:0];

  return v11;
}

- (_PSPredictionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_PSSuggesterConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (_PSEnsembleModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (BOOL)printReason
{
  return self->_printReason;
}

- (void)setPrintReason:(BOOL)a3
{
  self->_printReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end