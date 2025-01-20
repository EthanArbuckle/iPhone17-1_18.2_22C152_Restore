@interface CSTopHitSearchQuery
- (BOOL)isTopHitQuery;
- (CSTopHitSearchQuery)initWithQueryString:(id)a3 context:(id)a4;
- (CSTopHitSearchQuery)initWithSearchString:(id)a3 keyboardLanguage:(id)a4 attributes:(id)a5 hitCount:(unint64_t)a6;
- (CSTopHitSearchQuery)initWithUserString:(id)a3 queryContext:(id)a4;
- (unint64_t)dispatchApplyWidth;
- (void)_handleBatches:(id)a3;
- (void)handleCompletion:(id)a3;
- (void)handleFoundItems:(id)a3;
- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4;
@end

@implementation CSTopHitSearchQuery

- (CSTopHitSearchQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitSearchQuery initWithQueryString:context:]((uint64_t)v6, v8);
  }

  [v7 setUserQuery:v6];
  [v7 setLowPriority:0];
  [v7 setRankingType:1];
  [v7 setGrouped:1];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 bundleIdentifier];

  id v11 = v10;
  if (!strcmp((const char *)[v11 UTF8String], "com.apple.mobilenotes")
    || !strcmp((const char *)[v11 UTF8String], "com.apple.Notes"))
  {
    objc_msgSend(v7, "setUserQueryOptions:", objc_msgSend(v7, "userQueryOptions") | 0x10);
  }
  v15.receiver = self;
  v15.super_class = (Class)CSTopHitSearchQuery;
  v12 = [(CSUserQuery *)&v15 initWithQueryString:&stru_1EDBB3A50 context:v7];
  v13 = v12;
  if (v12) {
    commonInit_0(v12);
  }

  return v13;
}

- (CSTopHitSearchQuery)initWithUserString:(id)a3 queryContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CSUserQueryContext alloc];
  v9 = objc_msgSend(v6, "xpc_dictionary");
  v10 = [(CSSearchQueryContext *)v8 initWithXPCDictionary:v9];

  id v11 = [v6 filterQueries];
  [(CSSearchQueryContext *)v10 setFilterQueries:v11];

  v12 = [v6 fetchAttributes];
  [(CSSearchQueryContext *)v10 setFetchAttributes:v12];

  v13 = [v6 keyboardLanguage];
  [(CSSearchQueryContext *)v10 setKeyboardLanguage:v13];

  v14 = [v6 protectionClasses];
  [(CSSearchQueryContext *)v10 setProtectionClasses:v14];

  objc_super v15 = [v6 bundleIDs];
  [(CSSearchQueryContext *)v10 setBundleIDs:v15];

  v16 = [v6 disableBundles];
  [(CSSearchQueryContext *)v10 setDisableBundles:v16];

  -[CSSearchQueryContext setMaxCount:](v10, "setMaxCount:", [v6 maxCount]);
  uint64_t v17 = [v6 maxSuggestionCount];

  [(CSSearchQueryContext *)v10 setMaxSuggestionCount:v17];
  [(CSSearchQueryContext *)v10 setLowPriority:0];
  [(CSSearchQueryContext *)v10 setRankingType:1];
  v20.receiver = self;
  v20.super_class = (Class)CSTopHitSearchQuery;
  v18 = [(CSUserQuery *)&v20 initWithUserString:v7 queryContext:v10];

  if (v18) {
    commonInit_0(v18);
  }

  return v18;
}

- (CSTopHitSearchQuery)initWithSearchString:(id)a3 keyboardLanguage:(id)a4 attributes:(id)a5 hitCount:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitSearchQuery initWithSearchString:keyboardLanguage:attributes:hitCount:]((uint64_t)v10, v13);
  }

  v14 = objc_opt_new();
  [v14 setKeyboardLanguage:v12];

  [v14 setFetchAttributes:v11];
  [v14 setMaxCount:a6];
  objc_super v15 = [(CSTopHitSearchQuery *)self initWithQueryString:v10 context:v14];
  v16 = v15;
  if (v15) {
    commonInit_0(v15);
  }

  return v16;
}

- (void)_handleBatches:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32 = self;
  v5 = [(CSUserQuery *)self queryContext];
  unint64_t v31 = [v5 maxCount];

  id v6 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitQuery handleBatches:]();
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 += objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "count", v31);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(v13, "addObjectsFromArray:", *(void *)(*((void *)&v35 + 1) + 8 * j), v31);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v16);
  }

  v33 = [v13 objectEnumerator];
  uint64_t v19 = [v33 nextObject];
  if (v19)
  {
    objc_super v20 = (void *)v19;
    unint64_t v21 = 0;
    uint64_t v34 = 0;
    v22 = 0;
    BOOL v23 = 1;
    while (1)
    {
      v24 = objc_msgSend(v20, "bundleID", v31);

      if (v23 && (!v22 || [v22 isEqualToString:v24]))
      {
        ++v21;
      }
      else
      {
        if (v21 >= v31) {
          unint64_t v25 = v31;
        }
        else {
          unint64_t v25 = v21;
        }
        if (!v25) {
          -[CSTopHitSearchQuery _handleBatches:]();
        }
        v26 = objc_msgSend(v13, "subarrayWithRange:", v34, v25);
        v27 = v32;
        objc_sync_enter(v27);
        v27->super.super._foundItemCount += v25;
        objc_sync_exit(v27);

        v28 = [(CSSearchQuery *)v27 foundItemsHandler];

        if (v28)
        {
          v29 = [(CSSearchQuery *)v27 foundItemsHandler];
          ((void (**)(void, void *))v29)[2](v29, v26);
        }
        [(CSUserQuery *)v27 processInstantAnswersWithFoundItems:v26];
        v34 += v21;
        unint64_t v21 = v23;
      }
      id v30 = v24;

      objc_super v20 = [v33 nextObject];
      BOOL v23 = v20 != 0;
      v22 = v30;
      if (!v20)
      {
        v22 = v30;
        if (!v21) {
          break;
        }
      }
    }
  }
}

- (unint64_t)dispatchApplyWidth
{
  return 1;
}

- (void)handleFoundItems:(id)a3
{
  id v4 = a3;
  v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitQuery handleFoundItems:]();
  }

  [(NSMutableArray *)self->_batches addObject:v4];
}

- (BOOL)isTopHitQuery
{
  return 1;
}

- (void)handleCompletion:(id)a3
{
  id v4 = a3;
  v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitQuery handleCompletion:]();
  }

  if (!v4) {
    [(CSTopHitSearchQuery *)self _handleBatches:self->_batches];
  }
  v6.receiver = self;
  v6.super_class = (Class)CSTopHitSearchQuery;
  [(CSUserQuery *)&v6 handleCompletion:v4];
}

- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CSTopHitSearchQuery;
  [(CSUserQuery *)&v4 userEngagedWithResult:a3 interactionType:*(void *)&a4];
}

- (void).cxx_destruct
{
}

- (void)initWithQueryString:(uint64_t)a1 context:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "initWithQueryString:%@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithSearchString:(uint64_t)a1 keyboardLanguage:(NSObject *)a2 attributes:hitCount:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "initWithSearchString:%@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleBatches:.cold.1()
{
}

@end