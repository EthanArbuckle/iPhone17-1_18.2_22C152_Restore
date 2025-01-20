@interface MapsSuggestionsRealMapsSyncConnector
- (BOOL)allContentOfType:(int64_t)a3 handler:(id)a4;
- (MapsSuggestionsMapsSyncConnectorDelegate)delegate;
- (MapsSuggestionsRealMapsSyncConnector)init;
- (NSArray)storeSubscriptionTypes;
- (NSString)uniqueName;
- (id)MapsSyncReviewedPlace_fetchWithMuids:(id)a3;
- (id)saveNewReviewedPlaceWithMuid:(unint64_t)a3 lastSuggestedReviewDate:(id)a4;
- (void)deleteObjects:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation MapsSuggestionsRealMapsSyncConnector

void __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    uint64_t v6 = *(void *)(a1 + 32);
    v4(v6, v5);
  }
  else
  {
    id v7 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v7);
  }
}

void __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    uint64_t v6 = *(void *)(a1 + 32);
    v4(v6, v5);
  }
  else
  {
    id v7 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v7);
  }
}

- (MapsSuggestionsRealMapsSyncConnector)init
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsRealMapsSyncConnector;
  v2 = [(MapsSuggestionsRealMapsSyncConnector *)&v7 init];
  if (v2)
  {
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    v8[2] = objc_opt_class();
    v8[3] = objc_opt_class();
    v8[4] = objc_opt_class();
    v8[5] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:6];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F74378] sharedStore];
    [v5 subscribe:v2];
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allContentOfType:(int64_t)a3 handler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    switch(a3)
    {
      case 0:
        uint64_t v6 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446978;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealMapsSyncConnector.m";
        __int16 v26 = 1024;
        int v27 = 115;
        __int16 v28 = 2082;
        v29 = "-[MapsSuggestionsRealMapsSyncConnector allContentOfType:handler:]";
        __int16 v30 = 2082;
        v31 = "YES";
        objc_super v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_15;
      case 1:
        id v8 = objc_alloc_init(MEMORY[0x1E4F74330]);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke;
        v21[3] = &unk_1E5CB7EF0;
        v22 = v5;
        [v8 fetchWithCompletionHandler:v21];

        BOOL v9 = 1;
        uint64_t v6 = v22;
        break;
      case 2:
        id v10 = objc_alloc_init(MEMORY[0x1E4F74300]);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_2;
        v19[3] = &unk_1E5CB7EF0;
        v20 = v5;
        [v10 fetchWithCompletionHandler:v19];

        BOOL v9 = 1;
        uint64_t v6 = v20;
        break;
      case 3:
        if (qword_1EB6F08D8 != -1) {
          dispatch_once(&qword_1EB6F08D8, &__block_literal_global_43);
        }
        if (_MergedGlobals_54)
        {
          v11 = [MEMORY[0x1E4F74390] mapsFavoritesPredicateWithHidden:0 includeNearbyTransit:0];
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"positionIndex" ascending:1];
          id v13 = objc_alloc(MEMORY[0x1E4F74388]);
          v23 = v12;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
          uint64_t v6 = [v13 initWithPredicate:v11 sortDescriptors:v14 range:0];
        }
        else
        {
          uint64_t v6 = 0;
        }
        id v16 = objc_alloc_init(MEMORY[0x1E4F74310]);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_3;
        v17[3] = &unk_1E5CB7EF0;
        id v18 = v5;
        [v16 fetchWithOptions:v6 completionHandler:v17];

        BOOL v9 = 1;
        break;
      default:
        uint64_t v6 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446978;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealMapsSyncConnector.m";
        __int16 v26 = 1024;
        int v27 = 118;
        __int16 v28 = 2082;
        v29 = "-[MapsSuggestionsRealMapsSyncConnector allContentOfType:handler:]";
        __int16 v30 = 2082;
        v31 = "YES";
        objc_super v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Missing a MapsSuggestionsMapsSyncType in allContentOfType:";
        goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealMapsSyncConnector.m";
      __int16 v26 = 1024;
      int v27 = 83;
      __int16 v28 = 2082;
      v29 = "-[MapsSuggestionsRealMapsSyncConnector allContentOfType:handler:]";
      __int16 v30 = 2082;
      v31 = "nil == (handler)";
      objc_super v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_15:
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x26u);
    }
LABEL_16:
    BOOL v9 = 0;
  }

  return v9;
}

void __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    uint64_t v6 = *(void *)(a1 + 32);
    v4(v6, v5);
  }
  else
  {
    id v7 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v7);
  }
}

- (MapsSuggestionsMapsSyncConnectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MapsSuggestionsMapsSyncConnectorDelegate *)WeakRetained;
}

- (id)MapsSyncReviewedPlace_fetchWithMuids:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F74370];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithOffset:0 limit:1];
  uint64_t v6 = (void *)MEMORY[0x1E4F74390];
  v15[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v8 = [v6 queryPredicateWithFormat:@"muid IN %@" argumentArray:v7];

  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F74388]) initWithPredicate:v8 sortDescriptors:0 range:v5];
  id v10 = objc_alloc_init(MEMORY[0x1E4F74358]);
  uint64_t v14 = 0;
  v11 = [v10 fetchSyncWithOptions:v9 error:&v14];
  v12 = [v11 firstObject];

  return v12;
}

- (id)saveNewReviewedPlaceWithMuid:(unint64_t)a3 lastSuggestedReviewDate:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F74350];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4F742E8]);
  [v7 setAnonymousCredential:v8];

  [v7 setMuid:a3];
  [v7 setLastSuggestedReviewDate:v6];

  if (v7) {
    id v9 = v7;
  }

  return v7;
}

- (void)deleteObjects:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F74378];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedStore];
  [v8 deleteWithObjects:v7 completionHandler:v6];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "queryContentsDidChangeWithTypes: %@", buf, 0xCu);
  }

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    if (v8)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = v4;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v10) {
        goto LABEL_23;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "containsString:", @"History", (void)v16))
          {
            uint64_t v15 = 1;
          }
          else if ([v14 containsString:@"Collection"])
          {
            uint64_t v15 = 2;
          }
          else
          {
            if (![v14 containsString:@"Favorite"]) {
              continue;
            }
            uint64_t v15 = 3;
          }
          [v8 mapsSyncDidChangeForType:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (!v11) {
          goto LABEL_23;
        }
      }
    }
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "MapsSuggestionsRealMapsSyncConnector.m";
      __int16 v23 = 1026;
      int v24 = 136;
      __int16 v25 = 2082;
      __int16 v26 = "-[MapsSuggestionsRealMapsSyncConnector storeDidChangeWithTypes:]";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: delegate went away in %{public}s", buf, 0x1Cu);
    }

LABEL_23:
  }
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end