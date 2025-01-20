@interface _CSMultiQuery
+ (id)countingQueryForEmailsArrays:(id)a3 scope:(unint64_t)a4 context:(id)a5 contextualFilterQueries:(id)a6 includeSecondaryRecipients:(BOOL)a7 completionHandler:(id)a8;
+ (id)countingQueryWithPeopleSuggestions:(id)a3 filterQuery:(id)a4 context:(id)a5 completionHandler:(id)a6;
+ (id)countingQueryWithStrings:(id)a3 context:(id)a4 completionHandler:(id)a5;
+ (id)countingQueryWithStrings:(id)a3 contexts:(id)a4 completionHandler:(id)a5;
+ (id)countingQueryWithSuggestions:(id)a3 context:(id)a4 completionHandler:(id)a5;
+ (void)initialize;
- (BOOL)simple;
- (NSArray)queries;
- (NSMutableArray)results;
- (NSMutableArray)simpleQueryTokens;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)queue;
- (_CSMultiQuery)initWithQueries:(id)a3 completionHandler:(id)a4;
- (_CSMultiQuery)initWithSimpleQueries:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (void)cancel;
- (void)setCompletionHandler:(id)a3;
- (void)setGroup:(id)a3;
- (void)setQueries:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResults:(id)a3;
- (void)setSimple:(BOOL)a3;
- (void)setSimpleQueryTokens:(id)a3;
- (void)start;
- (void)startSimpleQueryAtIndex:(unint64_t)a3;
@end

@implementation _CSMultiQuery

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = dispatch_queue_attr_make_initially_inactive(MEMORY[0x1E4F14430]);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("multiquery shared queue", v5);
    v7 = (void *)sTargetQueue;
    sTargetQueue = (uint64_t)v6;

    dispatch_queue_set_width();
    v8 = sTargetQueue;
    dispatch_activate(v8);
  }
}

- (_CSMultiQuery)initWithSimpleQueries:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_CSMultiQuery;
  v9 = [(_CSMultiQuery *)&v23 init];
  if (v9)
  {
    dispatch_group_t v10 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v10;

    objc_storeStrong((id *)&v9->_queries, a3);
    v9->_simple = 1;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    simpleQueryTokens = v9->_simpleQueryTokens;
    v9->_simpleQueryTokens = (NSMutableArray *)v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    results = v9->_results;
    v9->_results = (NSMutableArray *)v14;

    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("multiquery instance queue", 0, (dispatch_queue_t)sTargetQueue);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [v8 copy];
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = (id)v18;

    if ([v7 count])
    {
      unint64_t v20 = 0;
      do
      {
        v21 = objc_alloc_init(_CSMultiQueryCountResult);
        [(NSMutableArray *)v9->_results setObject:v21 atIndexedSubscript:v20];

        ++v20;
      }
      while ([v7 count] > v20);
    }
  }

  return v9;
}

- (_CSMultiQuery)initWithQueries:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_CSMultiQuery;
  id v7 = [(_CSMultiQuery *)&v34 init];
  if (v7)
  {
    dispatch_group_t v8 = dispatch_group_create();
    group = v7->_group;
    v7->_group = (OS_dispatch_group *)v8;

    objc_storeStrong((id *)&v7->_queries, a3);
    v7->_simple = 0;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
    results = v7->_results;
    v7->_results = (NSMutableArray *)v10;

    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("multiquery instance queue", 0, (dispatch_queue_t)sTargetQueue);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v23 copy];
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = (id)v14;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v24;
    uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v31;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(obj);
          }
          unint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * v19);
          v21 = objc_alloc_init(_CSMultiQueryCountResult);
          [(NSMutableArray *)v7->_results setObject:v21 atIndexedSubscript:v17 + v19];

          id location = 0;
          objc_initWeak(&location, v20);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __51___CSMultiQuery_initWithQueries_completionHandler___block_invoke;
          v26[3] = &unk_1E554CB28;
          objc_copyWeak(v28, &location);
          v27 = v7;
          v28[1] = (id)(v17 + v19);
          [v20 setCompletionHandler:v26];

          objc_destroyWeak(v28);
          objc_destroyWeak(&location);
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        v17 += v19;
      }
      while (v16);
    }
  }
  return v7;
}

- (void)start
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_started = 1;
  id v3 = logForCSLogCategoryQuery();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  v5 = v3;
  dispatch_queue_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    NSUInteger v7 = [(NSArray *)self->_queries count];
    *(_DWORD *)buf = 134217984;
    NSUInteger v18 = v7;
    _os_signpost_emit_with_name_impl(&dword_18D0E3000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CSMultiQuery", "start with %lu counting queries", buf, 0xCu);
  }

  if ([(NSArray *)self->_queries count])
  {
    unint64_t v8 = 0;
    do
    {
      dispatch_group_enter((dispatch_group_t)self->_group);
      if (self->_simple)
      {
        [(_CSMultiQuery *)self startSimpleQueryAtIndex:v8];
      }
      else
      {
        v9 = [(NSArray *)self->_queries objectAtIndexedSubscript:v8];
        [v9 start];
      }
      ++v8;
    }
    while (v8 < [(NSArray *)self->_queries count]);
  }
  group = self->_group;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22___CSMultiQuery_start__block_invoke;
  block[3] = &unk_1E554C768;
  v15 = self;
  os_signpost_id_t v16 = v4;
  uint64_t v14 = v6;
  dispatch_queue_t v12 = v6;
  dispatch_group_notify(group, queue, block);
}

- (void)startSimpleQueryAtIndex:(unint64_t)a3
{
  v5 = -[NSArray objectAtIndexedSubscript:](self->_queries, "objectAtIndexedSubscript:");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41___CSMultiQuery_startSimpleQueryAtIndex___block_invoke;
  v14[3] = &unk_1E554CB50;
  v14[4] = self;
  v14[5] = a3;
  dispatch_queue_t v6 = _Block_copy(v14);
  NSUInteger v7 = [v5 queryString];
  unint64_t v8 = [v5 bundleIDs];
  v9 = [v5 protectionClasses];
  uint64_t v10 = [v5 keyboardLanguage];
  v11 = [v5 preferredLanguages];
  unint64_t HasResultsForQuery = CSSimpleQueryHasResultsForQuery(v7, v8, v9, v10, v11, 0, v6);

  v13 = [NSNumber numberWithLongLong:HasResultsForQuery];
  [(NSMutableArray *)self->_simpleQueryTokens setObject:v13 atIndexedSubscript:a3];
}

- (void)cancel
{
  if (self->_started)
  {
    uint64_t v3 = 40;
    if (!self->_simple) {
      uint64_t v3 = 48;
    }
    if ([*(id *)((char *)&self->super.isa + v3) count])
    {
      unint64_t v4 = 0;
      do
      {
        if (self->_simple)
        {
          v5 = [(NSMutableArray *)self->_simpleQueryTokens objectAtIndexedSubscript:v4];
          CSSimpleQueryCancel([v5 unsignedLongLongValue]);
        }
        else
        {
          v5 = [(NSArray *)self->_queries objectAtIndexedSubscript:v4];
          [v5 cancel];
        }

        ++v4;
        if (self->_simple) {
          uint64_t v6 = 40;
        }
        else {
          uint64_t v6 = 48;
        }
      }
      while (v4 < [*(id *)((char *)&self->super.isa + v6) count]);
    }
  }
}

+ (id)countingQueryWithStrings:(id)a3 contexts:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = [v7 count];
  if (v11 == [v8 count])
  {
    if (![v8 count])
    {
LABEL_6:
      NSUInteger v18 = [[_CSMultiQuery alloc] initWithQueries:v10 completionHandler:v9];
      goto LABEL_9;
    }
    uint64_t v12 = 0;
    while (1)
    {
      v13 = [v8 objectAtIndex:v12];
      uint64_t v14 = [v7 objectAtIndex:v12];
      v15 = (void *)[v13 copy];
      [v15 setCounting:1];
      [v15 setFetchAttributes:0];
      [v15 setCompletionAttributes:0];
      [v15 setCompletionWeights:0];
      [v15 setCompletionResultCount:0];
      [v15 setMaxSuggestionCount:0];
      os_signpost_id_t v16 = [[CSSearchQuery alloc] initWithQueryString:v14 context:v15];
      if (!v16) {
        break;
      }
      uint64_t v17 = v16;
      [v10 addObject:v16];

      if (++v12 >= (unint64_t)[v8 count]) {
        goto LABEL_6;
      }
    }
  }
  NSUInteger v18 = 0;
LABEL_9:

  return v18;
}

+ (id)countingQueryWithStrings:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 count])
  {
    id v21 = v9;
    uint64_t v11 = (void *)[v8 copy];
    [v11 setCounting:1];
    [v11 setFetchAttributes:0];
    [v11 setCompletionAttributes:0];
    [v11 setCompletionWeights:0];
    [v11 setCompletionResultCount:0];
    [v11 setMaxSuggestionCount:0];
    [v11 setCompletionOptions:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [[CSSearchQuery alloc] initWithQueryString:*(void *)(*((void *)&v22 + 1) + 8 * i) context:v11];
          if (!v17)
          {

            uint64_t v19 = 0;
            id v9 = v21;
            goto LABEL_12;
          }
          NSUInteger v18 = v17;
          [v10 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v9 = v21;
    uint64_t v19 = [[_CSMultiQuery alloc] initWithQueries:v10 completionHandler:v21];
LABEL_12:
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (id)countingQueryWithSuggestions:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v26 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        os_signpost_id_t v16 = objc_alloc_init(CSSearchQueryContext);
        [(CSSearchQueryContext *)v16 setCounting:1];
        uint64_t v17 = [v8 bundleIDs];
        [(CSSearchQueryContext *)v16 setBundleIDs:v17];

        NSUInteger v18 = [v8 protectionClasses];
        [(CSSearchQueryContext *)v16 setProtectionClasses:v18];

        uint64_t v19 = [v8 filterQueries];
        [(CSSearchQueryContext *)v16 setFilterQueries:v19];

        unint64_t v20 = [v8 keyboardLanguage];
        [(CSSearchQueryContext *)v16 setKeyboardLanguage:v20];

        id v21 = [CSSearchQuery alloc];
        long long v22 = [v15 queryString];
        long long v23 = [(CSSearchQuery *)v21 initWithQueryString:v22 queryContext:v16];

        [v9 addObject:v23];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = [[_CSMultiQuery alloc] initWithQueries:v9 completionHandler:v26];

  return v24;
}

+ (id)countingQueryForEmailsArrays:(id)a3 scope:(unint64_t)a4 context:(id)a5 contextualFilterQueries:(id)a6 includeSecondaryRecipients:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v32 = a6;
  id v30 = a8;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v13;
  uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v21 = objc_alloc_init(CSSearchQueryContext);
        long long v22 = [v14 bundleIDs];
        [(CSSearchQueryContext *)v21 setBundleIDs:v22];

        long long v23 = [v14 protectionClasses];
        [(CSSearchQueryContext *)v21 setProtectionClasses:v23];

        long long v24 = [v14 keyboardLanguage];
        [(CSSearchQueryContext *)v21 setKeyboardLanguage:v24];

        long long v25 = [v14 preferredLanguages];
        [(CSSearchQueryContext *)v21 setPreferredLanguages:v25];

        id v26 = +[_CSContactSearchResult generateQueryStringForContact:v20 filterQueries:v32 includeSecondaryRecipients:v9 inputScope:a4];
        long long v27 = [[CSSearchQuery alloc] initWithQueryString:v26 queryContext:v21];
        [v15 addObject:v27];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  long long v28 = [[_CSMultiQuery alloc] initWithSimpleQueries:v15 completionHandler:v30];

  return v28;
}

+ (id)countingQueryWithPeopleSuggestions:(id)a3 filterQuery:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v34 = a4;
  id v10 = a5;
  id v30 = a6;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v32 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v15 = objc_alloc_init(CSSearchQueryContext);
        [(CSSearchQueryContext *)v15 setCounting:1];
        uint64_t v16 = [v10 bundleIDs];
        [(CSSearchQueryContext *)v15 setBundleIDs:v16];

        uint64_t v17 = [v10 protectionClasses];
        [(CSSearchQueryContext *)v15 setProtectionClasses:v17];

        uint64_t v18 = [v10 keyboardLanguage];
        [(CSSearchQueryContext *)v15 setKeyboardLanguage:v18];

        uint64_t v19 = [v14 currentToken];
        uint64_t v20 = [v19 itemSummary];
        id v21 = [v20 emailAddresses];

        long long v22 = [MEMORY[0x1E4F1CA48] array];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __90___CSMultiQuery_countingQueryWithPeopleSuggestions_filterQuery_context_completionHandler___block_invoke;
        v35[3] = &unk_1E554CB78;
        id v36 = v22;
        id v23 = v22;
        [v21 enumerateObjectsUsingBlock:v35];
        long long v24 = [v23 componentsJoinedByString:@","];
        long long v25 = [CSSearchQuery alloc];
        id v26 = [NSString stringWithFormat:@"((%@) && (FieldMatch(kMDItemRecipientEmailAddresses, %@)) && !(FieldMatch(kMDItemAuthorEmailAddresses, %@)))", v34, v24, v24];
        long long v27 = [(CSSearchQuery *)v25 initWithQueryString:v26 queryContext:v15];

        [v33 addObject:v27];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v12);
  }

  long long v28 = [[_CSMultiQuery alloc] initWithQueries:v33 completionHandler:v30];

  return v28;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)simple
{
  return self->_simple;
}

- (void)setSimple:(BOOL)a3
{
  self->_simple = a3;
}

- (NSMutableArray)simpleQueryTokens
{
  return self->_simpleQueryTokens;
}

- (void)setSimpleQueryTokens:(id)a3
{
}

- (NSArray)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_simpleQueryTokens, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end