@interface _CSContactSearch
+ (BOOL)doesContactMatchTerm:(id)a3 contact:(id)a4;
+ (OS_dispatch_queue)targetQueue;
+ (id)autocompleteStore;
+ (id)contactStore;
+ (id)filterContactsBasedOnUserQueryString:(id)a3 contacts:(id)a4;
- (BOOL)autocompleteEnabled;
- (BOOL)finished;
- (BOOL)includeRecents;
- (CNCancelable)autocompleteRequest;
- (NSString)query;
- (OS_dispatch_queue)queue;
- (_CSContactSearch)initWithQuery:(id)a3 queryID:(unint64_t)a4 autocompleteEnabled:(BOOL)a5;
- (id)completionHandler;
- (id)contactsMatchingQuery:(id)a3 error:(id *)a4;
- (unint64_t)queryID;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)handleCompletionWithContacts:(id)a3 error:(id)a4;
- (void)setAutocompleteRequest:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)start;
- (void)startAutocompleteContactsSearch;
- (void)startContactsSearch;
@end

@implementation _CSContactSearch

+ (OS_dispatch_queue)targetQueue
{
  if (targetQueue_onceToken != -1) {
    dispatch_once(&targetQueue_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)targetQueue_targetQueue;

  return (OS_dispatch_queue *)v2;
}

- (_CSContactSearch)initWithQuery:(id)a3 queryID:(unint64_t)a4 autocompleteEnabled:(BOOL)a5
{
  id v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_CSContactSearch;
  v10 = [(_CSContactSearch *)&v21 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_query, a3);
    v11->_queryID = a4;
    v11->_autocompleteEnabled = a5;
    v11->_includeRecents = 1;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    accumulatedContacts = v11->_accumulatedContacts;
    v11->_accumulatedContacts = (NSMutableArray *)v12;

    id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.corespotlight.contactSearch.%ld.%p", a4, v11);
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = +[_CSContactSearch targetQueue];
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2(v15, v16, v17);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;
  }
  return v11;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "[ContactSearch] Canceling auto complete request due to deallocation", v1, 2u);
}

- (void)start
{
  self->_startTime = mach_absolute_time();
  v3 = self;
  objc_sync_enter(v3);
  id completionHandler = v3->_completionHandler;
  objc_sync_exit(v3);

  if (completionHandler)
  {
    v5 = [(_CSContactSearch *)v3 query];
    if ([v5 length])
    {
      qos_class_t v6 = qos_class_self();
      queue = v3->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __25___CSContactSearch_start__block_invoke;
      block[3] = &unk_1E5548F00;
      block[4] = v3;
      dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6, 0, block);
      dispatch_async(queue, v8);
    }
    else
    {
      v10 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D0E3000, v10, OS_LOG_TYPE_INFO, "[ContactSearch] Ignoring attempt to start a contact search with an empty query", buf, 2u);
      }

      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespotlight.contactSearch" code:-1 userInfo:0];
      [(_CSContactSearch *)v3 handleCompletionWithContacts:0 error:v11];
    }
  }
  else
  {
    id v9 = v3;
    objc_sync_enter(v9);
    v9->_finished = 1;
    objc_sync_exit(v9);

    v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D0E3000, v5, OS_LOG_TYPE_INFO, "[ContactSearch] Ignoring attempt to start a contact search with no completionHandler set", buf, 2u);
    }
  }
}

- (void)cancel
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "[ContactSearch] Canceling auto complete request", v1, 2u);
}

+ (id)contactStore
{
  if (contactStore_onceToken != -1) {
    dispatch_once(&contactStore_onceToken, &__block_literal_global_88);
  }
  v2 = (void *)contactStore_store;

  return v2;
}

+ (id)autocompleteStore
{
  if (autocompleteStore_onceToken != -1) {
    dispatch_once(&autocompleteStore_onceToken, &__block_literal_global_91_0);
  }
  v2 = (void *)autocompleteStore_store;

  return v2;
}

- (void)startAutocompleteContactsSearch
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  +[CSAutocompleteContactsWrapper CNAutocompleteStoreClass];
  if (!objc_opt_class())
  {
    v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_INFO, "[ContactSearch] AutocompleteContacts unavailable.", (uint8_t *)&v12, 2u);
    }

    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespotlight.contactSearch" code:-3 userInfo:0];
    [(_CSContactSearch *)self handleCompletionWithContacts:0 error:v4];
  }
  v5 = [(objc_class *)+[CSAutocompleteContactsWrapper CNAutocompleteFetchRequestClass] request];
  qos_class_t v6 = [(_CSContactSearch *)self query];
  [v5 setSearchString:v6];

  [v5 setSearchType:0];
  [v5 setIncludeContacts:1];
  objc_msgSend(v5, "setIncludeRecents:", -[_CSContactSearch includeRecents](self, "includeRecents"));
  [v5 setIncludeSuggestions:0];
  [v5 setIncludeDirectoryServers:0];
  [v5 setIncludePredictions:0];
  [v5 setIncludeCalendarServers:0];
  [v5 setIncludeStewie:0];
  [v5 setIncludeLocalExtensions:0];
  v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    dispatch_block_t v8 = [(_CSContactSearch *)self query];
    id v9 = CSRedactString(v8, 1);
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_INFO, "[ContactSearch] Fetching auto complete contacts for %@", (uint8_t *)&v12, 0xCu);
  }
  v10 = [(id)objc_opt_class() autocompleteStore];
  v11 = [v10 executeFetchRequest:v5 delegate:self];

  [(_CSContactSearch *)self setAutocompleteRequest:v11];
}

+ (id)filterContactsBasedOnUserQueryString:(id)a3 contacts:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (+[_CSContactSearch doesContactMatchTerm:contact:](_CSContactSearch, "doesContactMatchTerm:contact:", v5, v13, (void)v16))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v7 copy];

  return v14;
}

+ (BOOL)doesContactMatchTerm:(id)a3 contact:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 displayName];
  uint64_t v8 = [v7 localizedStandardRangeOfString:v5];

  if (v8)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = objc_msgSend(v6, "emailAddresses", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if (![*(id *)(*((void *)&v14 + 1) + 8 * i) localizedStandardRangeOfString:v5])
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)startContactsSearch
{
  qos_class_t v3 = qos_class_self();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___CSContactSearch_startContactsSearch__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v3, 0, block);
  dispatch_async(queue, v5);
}

- (id)contactsMatchingQuery:(id)a3 error:(id *)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[_CSContactSearch contactStore];
  id v7 = [(objc_class *)+[CSContactsWrapper CNContactFormatterClass] descriptorForRequiredKeysForStyle:0];
  v23[0] = v7;
  uint64_t v8 = +[CSContactsWrapper CNContactNicknameKey];
  v23[1] = v8;
  uint64_t v9 = +[CSContactsWrapper sharedInstance];
  uint64_t v10 = [v9 CNContactEmailAddressesKeyString];
  v23[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

  int v12 = objc_msgSend(objc_alloc(+[CSContactsWrapper CNContactFetchRequestClass](CSContactsWrapper, "CNContactFetchRequestClass")), "initWithKeysToFetch:", v11);
  uint64_t v13 = [(objc_class *)+[CSContactsWrapper CNContactClass] predicateForContactsMatchingName:v5];
  [v12 setPredicate:v13];

  long long v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = v6;
  objc_sync_enter(v15);
  id v22 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48___CSContactSearch_contactsMatchingQuery_error___block_invoke;
  v20[3] = &unk_1E554C7C0;
  id v16 = v14;
  id v21 = v16;
  [v15 enumerateContactsWithFetchRequest:v12 error:&v22 usingBlock:v20];
  id v17 = v22;

  objc_sync_exit(v15);
  if (v17)
  {
    id v18 = 0;
    if (a4) {
      *a4 = v17;
    }
  }
  else
  {
    id v18 = v16;
  }

  return v18;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  v32 = self;
  unint64_t startTime = self->_startTime;
  uint64_t v8 = mach_absolute_time();
  if (CSNanosecondsSinceAbsoluteTime_onceToken != -1) {
    dispatch_once(&CSNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_226_0);
  }
  uint64_t v9 = CSNanosecondsSinceAbsoluteTime_sTimebaseInfo;
  unint64_t v10 = *(unsigned int *)algn_1E91AD43C;
  uint64_t v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v46 = [v6 count];
    __int16 v47 = 2048;
    double v48 = (float)((v8 - startTime) * v9 / v10) / 1000000.0;
    _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_INFO, "[ContactSearch] Received %ld auto complete contacts after %.1fms", buf, 0x16u);
  }

  v34 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (![v13 resultType])
        {
          id v14 = [v13 value];
          id v15 = [v14 address];
          if ([(_CSContactSearchResult *)v15 length])
          {
            id v16 = [v13 value];
            BOOL v17 = [v16 addressType] == 1;

            if (!v17) {
              continue;
            }
            char v35 = [v13 sourceType];
            char v18 = [v13 sourceType];
            uint64_t v19 = [v13 nameComponents];

            if (v19)
            {
              id v14 = objc_alloc_init(MEMORY[0x1E4F28F30]);
              v20 = [v13 nameComponents];
              id v21 = [v20 firstName];
              [v14 setGivenName:v21];

              id v22 = [v13 nameComponents];
              v23 = [v22 lastName];
              [v14 setFamilyName:v23];
            }
            else
            {
              id v14 = 0;
            }
            v24 = [_CSContactSearchResult alloc];
            v25 = [v13 displayName];
            v26 = [v13 value];
            v27 = [v26 address];
            v43 = v27;
            v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
            v29 = [v13 identifier];
            v30 = [v13 recentsIdentifier];
            id v15 = [(_CSContactSearchResult *)v24 initWithDisplayName:v25 nameComponents:v14 emailAddresses:v28 contactIdentifier:v29 recentsIdentifier:v30 sourceType:v18 & 1 | (unint64_t)(v35 & 2)];

            [v34 addObject:v15];
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v38);
  }

  if ([v34 count])
  {
    v31 = v32->_accumulatedContacts;
    objc_sync_enter(v31);
    [(NSMutableArray *)v32->_accumulatedContacts addObjectsFromArray:v34];
    objc_sync_exit(v31);
  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  v4 = self->_accumulatedContacts;
  objc_sync_enter(v4);
  id v5 = self->_accumulatedContacts;
  objc_sync_exit(v4);

  [(_CSContactSearch *)self handleCompletionWithContacts:v5 error:0];
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
}

- (void)handleCompletionWithContacts:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(_CSContactSearch *)v8 completionHandler];
  [(_CSContactSearch *)v8 setCompletionHandler:0];
  if (v8->_finished)
  {
    objc_sync_exit(v8);
  }
  else
  {
    v8->_finished = 1;
    objc_sync_exit(v8);

    if (v9)
    {
      unint64_t startTime = v8->_startTime;
      uint64_t v11 = mach_absolute_time();
      if (CSNanosecondsSinceAbsoluteTime_onceToken != -1) {
        dispatch_once(&CSNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_226_0);
      }
      uint64_t v13 = CSNanosecondsSinceAbsoluteTime_sTimebaseInfo;
      unint64_t v12 = *(unsigned int *)algn_1E91AD43C;
      id v14 = logForCSLogCategoryDefault();
      id v15 = v14;
      float v16 = (float)((v11 - startTime) * v13 / v12) / 1000000.0;
      if (v7)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[_CSContactSearch handleCompletionWithContacts:error:]((uint64_t)v7, v15, v16);
        }

        ((void (**)(void, void, id))v9)[2](v9, 0, v7);
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v17 = 134218240;
          uint64_t v18 = [v6 count];
          __int16 v19 = 2048;
          double v20 = v16;
          _os_log_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_INFO, "[ContactSearch] Finished fetching %ld contacts in %.1fms", (uint8_t *)&v17, 0x16u);
        }

        ((void (**)(void, id, void))v9)[2](v9, v6, 0);
      }
    }
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)query
{
  return self->_query;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (BOOL)autocompleteEnabled
{
  return self->_autocompleteEnabled;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (CNCancelable)autocompleteRequest
{
  return self->_autocompleteRequest;
}

- (void)setAutocompleteRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteRequest, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_accumulatedContacts, 0);
}

- (void)handleCompletionWithContacts:(float)a3 error:.cold.1(uint64_t a1, NSObject *a2, float a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "[ContactSearch] Failed to fetch contacts in %.1fms: %@", (uint8_t *)&v3, 0x16u);
}

@end