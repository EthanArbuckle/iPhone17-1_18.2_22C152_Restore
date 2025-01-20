@interface EKAutocompleter
- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5;
- (BOOL)autocompleteRunning;
- (BOOL)directorySearchWithCompletion:(id)a3;
- (BOOL)excludeLocal;
- (BOOL)findGroups;
- (BOOL)findPeople;
- (BOOL)findRecents;
- (BOOL)findResources;
- (BOOL)findRooms;
- (BOOL)findSuggestions;
- (BOOL)isRunning;
- (BOOL)useACDirectorySearch;
- (CNAutocompleteStore)autocompleteStore;
- (CNCancelable)autocompletionSearchRequest;
- (EKAutocompleter)initWithDelegate:(id)a3;
- (EKAutocompleterDelegate)delegate;
- (EKDirectorySearchOperation)directorySearchOperation;
- (EKSource)source;
- (NSMutableArray)contactResults;
- (NSMutableArray)directorySearchResults;
- (NSSet)addressesToIgnore;
- (NSString)prefix;
- (OS_dispatch_queue)directorySearchQueue;
- (id)allResults;
- (id)autocompleteResultsFromDirectoryRecords:(id)a3 withType:(int64_t)a4;
- (id)cnResults;
- (id)removeIgnoredAddressesFromResults:(id)a3;
- (id)searchFor:(id)a3 onSource:(id)a4 withContext:(id)a5;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3;
- (void)autocompleteFetchDidEndNetworkActivity:(id)a3;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)cancelSearch;
- (void)clearLastResults;
- (void)setAddressesToIgnore:(id)a3;
- (void)setAutocompleteRunning:(BOOL)a3;
- (void)setAutocompleteStore:(id)a3;
- (void)setAutocompletionSearchRequest:(id)a3;
- (void)setContactResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectorySearchOperation:(id)a3;
- (void)setDirectorySearchQueue:(id)a3;
- (void)setDirectorySearchResults:(id)a3;
- (void)setExcludeLocal:(BOOL)a3;
- (void)setFindGroups:(BOOL)a3;
- (void)setFindPeople:(BOOL)a3;
- (void)setFindRecents:(BOOL)a3;
- (void)setFindResources:(BOOL)a3;
- (void)setFindRooms:(BOOL)a3;
- (void)setFindSuggestions:(BOOL)a3;
- (void)setIgnoredAddresses:(id)a3;
- (void)setIgnoredAddresses:(id)a3 ignoredAddressesFromParticipants:(id)a4;
- (void)setPrefix:(id)a3;
- (void)setSource:(id)a3;
- (void)setUseACDirectorySearch:(BOOL)a3;
@end

@implementation EKAutocompleter

- (EKAutocompleter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EKAutocompleter;
  v5 = [(EKAutocompleter *)&v18 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contactResults = v5->_contactResults;
    v5->_contactResults = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    directorySearchResults = v5->_directorySearchResults;
    v5->_directorySearchResults = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("directorySearchQueue", v10);
    directorySearchQueue = v5->_directorySearchQueue;
    v5->_directorySearchQueue = (OS_dispatch_queue *)v11;

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v13 = (void *)getCNAutocompleteStoreClass_softClass;
    uint64_t v23 = getCNAutocompleteStoreClass_softClass;
    if (!getCNAutocompleteStoreClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getCNAutocompleteStoreClass_block_invoke;
      v19[3] = &unk_1E5B969D8;
      v19[4] = &v20;
      __getCNAutocompleteStoreClass_block_invoke((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    v14 = v13;
    _Block_object_dispose(&v20, 8);
    uint64_t v15 = [[v14 alloc] initWithDelegate:v5];
    autocompleteStore = v5->_autocompleteStore;
    v5->_autocompleteStore = (CNAutocompleteStore *)v15;

    if ([v4 conformsToProtocol:&unk_1EF98E058])
    {
      [(EKAutocompleter *)v5 setDelegate:v4];
      if (objc_opt_respondsToSelector()) {
        [v4 autcompleterSetCNAutocompleteStore:v5->_autocompleteStore];
      }
    }
  }

  return v5;
}

- (id)searchFor:(id)a3 onSource:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKAutocompleter searchFor:onSource:withContext:]((uint64_t)v8, v11);
  }
  uint64_t v12 = [v8 length];
  if (!v10 && !v12)
  {
    [(EKAutocompleter *)self cancelSearch];
    [(EKAutocompleter *)self clearLastResults];
    v13 = [(EKAutocompleter *)self delegate];
    [v13 autcompleterUpdated:self];

    v14 = 0;
    goto LABEL_27;
  }
  uint64_t v15 = [(EKAutocompleter *)self prefix];
  if ([v15 isEqualToString:v8])
  {
    v16 = [(EKAutocompleter *)self source];
    int v17 = [v16 isEqual:v9];

    if (v17)
    {
      objc_super v18 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        -[EKAutocompleter searchFor:onSource:withContext:]((uint64_t)v8, v18, self);
      }
      v14 = [(EKAutocompleter *)self allResults];
      goto LABEL_27;
    }
  }
  else
  {
  }
  [(EKAutocompleter *)self setPrefix:v8];
  [(EKAutocompleter *)self setSource:v9];
  [(EKAutocompleter *)self cancelSearch];
  [(EKAutocompleter *)self clearLastResults];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v19 = (void *)getCNAutocompleteFetchRequestClass_softClass;
  uint64_t v32 = getCNAutocompleteFetchRequestClass_softClass;
  if (!getCNAutocompleteFetchRequestClass_softClass)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __getCNAutocompleteFetchRequestClass_block_invoke;
    v28[3] = &unk_1E5B969D8;
    v28[4] = &v29;
    __getCNAutocompleteFetchRequestClass_block_invoke((uint64_t)v28);
    v19 = (void *)v30[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v29, 8);
  v21 = [v20 request];
  [v21 setSearchString:v8];
  [v21 setSearchType:3];
  if ([(EKAutocompleter *)self findPeople]) {
    uint64_t v22 = [(EKAutocompleter *)self excludeLocal] ^ 1;
  }
  else {
    uint64_t v22 = 0;
  }
  [v21 setIncludeContacts:v22];
  if ([(EKAutocompleter *)self findSuggestions]) {
    uint64_t v23 = [(EKAutocompleter *)self excludeLocal] ^ 1;
  }
  else {
    uint64_t v23 = 0;
  }
  [v21 setIncludeSuggestions:v23];
  if ([(EKAutocompleter *)self findRecents]) {
    uint64_t v24 = [(EKAutocompleter *)self excludeLocal] ^ 1;
  }
  else {
    uint64_t v24 = 0;
  }
  [v21 setIncludeRecents:v24];
  objc_msgSend(v21, "setIncludeDirectoryServers:", -[EKAutocompleter useACDirectorySearch](self, "useACDirectorySearch"));
  [v21 setFetchContext:v10];
  objc_msgSend(v21, "setShouldIncludeGroupResults:", -[EKAutocompleter findGroups](self, "findGroups"));
  [v21 setIncludeCalendarServers:0];
  [(EKAutocompleter *)self setAutocompleteRunning:1];
  v25 = [(EKAutocompleter *)self autocompleteStore];
  v26 = [v25 scheduleFetchRequest:v21];
  [(EKAutocompleter *)self setAutocompletionSearchRequest:v26];

  if ([(EKAutocompleter *)self isRunning])
  {
    v14 = 0;
  }
  else
  {
    v14 = [(EKAutocompleter *)self allResults];
  }

LABEL_27:

  return v14;
}

- (void)clearLastResults
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "[EKAutocomplete] Clear Results", v1, 2u);
}

void __35__EKAutocompleter_clearLastResults__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) directorySearchResults];
  [v1 removeAllObjects];
}

- (void)cancelSearch
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = [a2 prefix];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEBUG, "[EKAutocomplete] Cancel search for %@", (uint8_t *)&v5, 0xCu);
}

- (BOOL)isRunning
{
  if ([(EKAutocompleter *)self autocompleteRunning]) {
    return 1;
  }
  id v4 = [(EKAutocompleter *)self directorySearchOperation];
  char v5 = [v4 isExecuting];

  return v5;
}

- (id)allResults
{
  v3 = [(EKAutocompleter *)self contactResults];
  id v4 = [(EKAutocompleter *)self removeIgnoredAddressesFromResults:v3];

  return v4;
}

- (id)cnResults
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = [(EKAutocompleter *)self contactResults];
  char v5 = [v3 orderedSetWithArray:v4];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [(EKAutocompleter *)self contactResults];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = [v12 value];
        v14 = [v13 address];

        if (v14)
        {
          uint64_t v15 = [(EKAutocompleter *)self addressesToIgnore];
          int v16 = [v15 containsObject:v14];

          if (v16) {
            [v5 removeObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  int v17 = [v5 array];

  return v17;
}

- (void)setIgnoredAddresses:(id)a3 ignoredAddressesFromParticipants:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));
  if ([v6 count]) {
    [v8 addObjectsFromArray:v6];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "emailAddress", (void)v20);
        int v16 = [v14 URL];
        int v17 = [v16 absoluteString];

        if (![v17 hasMailto])
        {
          objc_super v18 = 0;
          if (!v15) {
            goto LABEL_13;
          }
LABEL_12:
          [v8 addObject:v15];
          goto LABEL_13;
        }
        objc_super v18 = [v17 stringRemovingMailto];
        if (v15) {
          goto LABEL_12;
        }
LABEL_13:
        if (v18) {
          [v8 addObject:v18];
        }
        if (v17) {
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  long long v19 = [v8 allObjects];
  [(EKAutocompleter *)self setIgnoredAddresses:v19];
}

- (void)setIgnoredAddresses:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v6 = [MEMORY[0x1E4F1CA80] setWithArray:v5];
  if ([v4 count])
  {
    long long v22 = self;
    id v7 = [MEMORY[0x1E4F576B0] defaultProvider];
    v34[0] = *MEMORY[0x1E4F1ADC8];
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    id v23 = v4;
    id v9 = [v7 unifiedContactsForHandleStrings:v4 keysToFetch:v8];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          int v16 = [v15 emailAddresses];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v16);
                }
                long long v21 = [*(id *)(*((void *)&v24 + 1) + 8 * j) value];
                [v6 addObject:v21];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v18);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    self = v22;
    id v4 = v23;
  }
  [(EKAutocompleter *)self setAddressesToIgnore:v6];
}

- (id)removeIgnoredAddressesFromResults:(id)a3
{
  id v4 = a3;
  id v5 = [(EKAutocompleter *)self addressesToIgnore];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__EKAutocompleter_removeIgnoredAddressesFromResults___block_invoke;
    v10[3] = &unk_1E5B97268;
    v10[4] = self;
    id v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v10];
    id v8 = [v4 filteredArrayUsingPredicate:v7];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

uint64_t __53__EKAutocompleter_removeIgnoredAddressesFromResults___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 addressesToIgnore];
  id v5 = [v3 value];

  uint64_t v6 = [v5 address];
  uint64_t v7 = [v4 containsObject:v6] ^ 1;

  return v7;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = v7;
  id v10 = [(EKAutocompleter *)self autocompletionSearchRequest];

  if (v10 == v6)
  {
    id v30 = v6;
    uint64_t v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [(EKAutocompleter *)self prefix];
      *(_DWORD *)buf = 138412546;
      v40 = v13;
      __int16 v41 = 2112;
      id v42 = v9;
      _os_log_impl(&dword_1A4E47000, v12, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Update %@ with %@", buf, 0x16u);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v9;
    obuint64_t j = v9;
    uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          int v16 = [v15 value];
          uint64_t v17 = [v16 address];

          uint64_t v18 = [v15 resultType];
          uint64_t v19 = [v15 resultType];
          [(EKAutocompleter *)v8 addressesToIgnore];
          v21 = long long v20 = v8;
          long long v22 = [v15 value];
          id v23 = [v22 address];
          char v24 = [v21 containsObject:v23];

          id v8 = v20;
          BOOL v26 = v19 != 3 && v18 != 1 && v17 == 0;
          if (!v26 && (v24 & 1) == 0)
          {
            long long v27 = [(EKAutocompleter *)v20 contactResults];
            [v27 addObject:v15];
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v33);
    }

    id v9 = v29;
    id v6 = v30;
  }
  long long v28 = [(EKAutocompleter *)v8 delegate];
  [v28 autcompleterUpdated:v8];
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(EKAutocompleter *)self prefix];
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Failed %@ with error %@", (uint8_t *)&v9, 0x16u);
  }
  [(EKAutocompleter *)self setAutocompleteRunning:0];
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = [(EKAutocompleter *)self prefix];
    *(_DWORD *)buf = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Finished %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EKAutocompleter_autocompleteFetchDidFinish___block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__EKAutocompleter_autocompleteFetchDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAutocompleteRunning:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 autcompleterUpdated:*(void *)(a1 + 32)];
}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [(EKAutocompleter *)self prefix];
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Began network activity for %@", buf, 0xCu);
  }
  id v8 = [(EKAutocompleter *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__EKAutocompleter_autocompleteFetchDidBeginNetworkActivity___block_invoke;
    block[3] = &unk_1E5B96E08;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __60__EKAutocompleter_autocompleteFetchDidBeginNetworkActivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 autcompleterDidBeginNetworkActivity:*(void *)(a1 + 32)];
}

- (void)autocompleteFetchDidEndNetworkActivity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [(EKAutocompleter *)self prefix];
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete finished network activity for %@", buf, 0xCu);
  }
  id v8 = [(EKAutocompleter *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__EKAutocompleter_autocompleteFetchDidEndNetworkActivity___block_invoke;
    block[3] = &unk_1E5B96E08;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __58__EKAutocompleter_autocompleteFetchDidEndNetworkActivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 autcompleterDidFinishNetworkActivity:*(void *)(a1 + 32)];
}

- (id)autocompleteResultsFromDirectoryRecords:(id)a3 withType:(int64_t)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v25 = (id)objc_opt_new();
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v47 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v33;
    char v24 = &v38;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "preferredAddress", v24);
        char v9 = [v8 stringRemovingMailto];

        if (v9)
        {
          id v10 = v9;
        }
        else
        {
          id v10 = [v7 preferredAddress];
          if (!v10)
          {
            id v10 = [v7 displayName];
            if (!v10) {
              goto LABEL_23;
            }
          }
        }
        if (([v5 containsObject:v10] & 1) == 0)
        {
          [v5 addObject:v10];
          if (a4)
          {
            __int16 v11 = 0;
          }
          else
          {
            uint64_t v41 = 0;
            id v42 = &v41;
            uint64_t v43 = 0x2050000000;
            id v12 = (void *)getCNAutocompleteNameComponentsClass_softClass;
            uint64_t v44 = getCNAutocompleteNameComponentsClass_softClass;
            if (!getCNAutocompleteNameComponentsClass_softClass)
            {
              uint64_t v36 = MEMORY[0x1E4F143A8];
              uint64_t v37 = 3221225472;
              v38 = __getCNAutocompleteNameComponentsClass_block_invoke;
              v39 = &unk_1E5B969D8;
              v40 = &v41;
              __getCNAutocompleteNameComponentsClass_block_invoke((uint64_t)&v36);
              id v12 = (void *)v42[3];
            }
            id v13 = v12;
            _Block_object_dispose(&v41, 8);
            v14 = [v7 firstName];
            uint64_t v15 = [v7 lastName];
            __int16 v11 = [v13 nameComponentsWithFirstName:v14 lastName:v15 nickname:0 nameSuffix:0];
          }
          int v16 = [v7 principalPath];

          if (v16)
          {
            v45 = EKDirectoryRecordPrincipalPathKey;
            uint64_t v17 = [v7 principalPath];
            v46 = v17;
            int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          }
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke;
          v31[3] = &unk_1E5B972B8;
          v31[4] = self;
          v31[5] = v7;
          uint64_t v18 = (void *)MEMORY[0x1A6266730](v31);
          uint64_t v41 = 0;
          id v42 = &v41;
          uint64_t v43 = 0x2050000000;
          uint64_t v19 = (void *)getCNAutocompleteResultClass_softClass;
          uint64_t v44 = getCNAutocompleteResultClass_softClass;
          if (!getCNAutocompleteResultClass_softClass)
          {
            uint64_t v36 = MEMORY[0x1E4F143A8];
            uint64_t v37 = 3221225472;
            v38 = __getCNAutocompleteResultClass_block_invoke;
            v39 = &unk_1E5B969D8;
            v40 = &v41;
            __getCNAutocompleteResultClass_block_invoke((uint64_t)&v36);
            uint64_t v19 = (void *)v42[3];
          }
          id v20 = v19;
          _Block_object_dispose(&v41, 8);
          long long v21 = [v7 displayName];
          long long v22 = [v20 calDAVResultWithAddress:v9 displayName:v21 nameComponents:v11 resultType:a4 groupMembersProvider:v18 userInfo:v16];

          if (v22) {
            [v25 addObject:v22];
          }
        }
LABEL_23:
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v47 count:16];
    }
    while (v30);
  }

  [v25 sortUsingComparator:&__block_literal_global_13];

  return v25;
}

id __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__2;
  uint64_t v37 = __Block_byref_object_dispose__2;
  id v38 = (id)objc_opt_new();
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy__2;
  long long v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke_61;
  v18[3] = &unk_1E5B97290;
  long long v21 = &v23;
  long long v22 = &v33;
  uint64_t v5 = *(void *)(a1 + 32);
  id v20 = &v29;
  v18[4] = v5;
  id v6 = v4;
  uint64_t v19 = v6;
  id v7 = (void *)MEMORY[0x1A6266730](v18);
  id v8 = [EKGroupExpansionOperation alloc];
  char v9 = [*(id *)(a1 + 32) source];
  id v10 = [(EKGroupExpansionOperation *)v8 initWithSource:v9 group:*(void *)(a1 + 40) completionBlock:v7];

  [(EKGroupExpansionOperation *)v10 start];
  dispatch_time_t v11 = dispatch_time(0, 30000000000);
  intptr_t v12 = dispatch_semaphore_wait(v6, v11);
  v30[3] = v12;
  if (v12 || v24[5])
  {
    if (a2)
    {
      id v13 = (void *)v24[5];
      if (v13)
      {
        id v14 = v13;
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v14 = (id)[v15 initWithDomain:*MEMORY[0x1E4F5E920] code:7 userInfo:0];
      }
      *a2 = v14;
    }
    int v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v16 = (void *)[(id)v34[5] copy];
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v16;
}

void __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      id v8 = v5;
      char v9 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v8;
    }
    else
    {
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      dispatch_time_t v11 = *(void **)(a1 + 32);
      intptr_t v12 = [v21 locations];
      id v13 = [v11 autocompleteResultsFromDirectoryRecords:v12 withType:2];
      [v10 addObjectsFromArray:v13];

      id v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v15 = *(void **)(a1 + 32);
      int v16 = [v21 resources];
      uint64_t v17 = [v15 autocompleteResultsFromDirectoryRecords:v16 withType:3];
      [v14 addObjectsFromArray:v17];

      uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v19 = *(void **)(a1 + 32);
      char v9 = [v21 people];
      id v20 = [v19 autocompleteResultsFromDirectoryRecords:v9 withType:0];
      [v18 addObjectsFromArray:v20];
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

uint64_t __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 displayName];
  id v6 = [v4 displayName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)directorySearchWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(EKAutocompleter *)self source];
  if ([v5 sourceType] == 2 || objc_msgSend(v5, "sourceType") == 3 || objc_msgSend(v5, "sourceType") == 1)
  {
    id v6 = [(EKAutocompleter *)self directorySearchOperation];
    [v6 cancel];

    uint64_t v7 = [(EKAutocompleter *)self directorySearchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke;
    block[3] = &unk_1E5B96E08;
    block[4] = self;
    dispatch_sync(v7, block);

    id v8 = objc_opt_new();
    char v9 = [(EKAutocompleter *)self prefix];
    id v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    dispatch_time_t v11 = [v9 componentsSeparatedByCharactersInSet:v10];

    intptr_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
    [v8 setTerms:v12];

    objc_msgSend(v8, "setFindUsers:", -[EKAutocompleter findPeople](self, "findPeople"));
    objc_msgSend(v8, "setFindGroups:", -[EKAutocompleter findGroups](self, "findGroups"));
    objc_msgSend(v8, "setFindLocations:", -[EKAutocompleter findRooms](self, "findRooms"));
    objc_msgSend(v8, "setFindResources:", -[EKAutocompleter findResources](self, "findResources"));
    objc_initWeak(&location, self);
    id v13 = [(EKAutocompleter *)self directorySearchOperation];
    objc_initWeak(&from, v13);

    id v14 = [EKDirectorySearchOperation alloc];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_2;
    v24[3] = &unk_1E5B97300;
    objc_copyWeak(&v25, &location);
    id v15 = [(EKDirectorySearchOperation *)v14 initWithSource:v5 query:v8 resultsBlock:v24];
    [(EKAutocompleter *)self setDirectorySearchOperation:v15];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_4;
    v20[3] = &unk_1E5B97350;
    objc_copyWeak(&v22, &location);
    id v21 = v4;
    objc_copyWeak(&v23, &from);
    int v16 = [(EKAutocompleter *)self directorySearchOperation];
    [v16 setCompletionBlock:v20];

    uint64_t v17 = [(EKAutocompleter *)self directorySearchOperation];
    [v17 start];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) directorySearchResults];
  [v1 removeAllObjects];
}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_opt_new();
    id v6 = [v3 locations];
    uint64_t v7 = [WeakRetained autocompleteResultsFromDirectoryRecords:v6 withType:2];
    [v5 addObjectsFromArray:v7];

    id v8 = [v3 resources];
    char v9 = [WeakRetained autocompleteResultsFromDirectoryRecords:v8 withType:3];
    [v5 addObjectsFromArray:v9];

    id v10 = [v3 people];
    dispatch_time_t v11 = [WeakRetained autocompleteResultsFromDirectoryRecords:v10 withType:0];
    [v5 addObjectsFromArray:v11];

    intptr_t v12 = [v3 groups];
    id v13 = [WeakRetained autocompleteResultsFromDirectoryRecords:v12 withType:1];
    [v5 addObjectsFromArray:v13];

    id v14 = [WeakRetained directorySearchQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_3;
    v16[3] = &unk_1E5B97140;
    id v17 = WeakRetained;
    id v18 = v5;
    id v15 = v5;
    dispatch_async(v14, v16);
  }
}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) directorySearchResults];
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained directorySearchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_5;
    block[3] = &unk_1E5B97328;
    id v7 = a1[4];
    id v6 = v3;
    objc_copyWeak(&v8, a1 + 6);
    dispatch_async(v4, block);

    objc_destroyWeak(&v8);
  }
}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) directorySearchResults];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  return -[EKAutocompleter directorySearchWithCompletion:](self, "directorySearchWithCompletion:", a5, a4);
}

- (BOOL)findRooms
{
  return self->_findRooms;
}

- (void)setFindRooms:(BOOL)a3
{
  self->_findRooms = a3;
}

- (BOOL)findPeople
{
  return self->_findPeople;
}

- (void)setFindPeople:(BOOL)a3
{
  self->_findPeople = a3;
}

- (BOOL)findSuggestions
{
  return self->_findSuggestions;
}

- (void)setFindSuggestions:(BOOL)a3
{
  self->_findSuggestions = a3;
}

- (BOOL)findResources
{
  return self->_findResources;
}

- (void)setFindResources:(BOOL)a3
{
  self->_findResources = a3;
}

- (BOOL)findGroups
{
  return self->_findGroups;
}

- (void)setFindGroups:(BOOL)a3
{
  self->_findGroups = a3;
}

- (BOOL)findRecents
{
  return self->_findRecents;
}

- (void)setFindRecents:(BOOL)a3
{
  self->_findRecents = a3;
}

- (BOOL)useACDirectorySearch
{
  return self->_useACDirectorySearch;
}

- (void)setUseACDirectorySearch:(BOOL)a3
{
  self->_useACDirectorySearch = a3;
}

- (BOOL)excludeLocal
{
  return self->_excludeLocal;
}

- (void)setExcludeLocal:(BOOL)a3
{
  self->_excludeLocal = a3;
}

- (EKAutocompleterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKAutocompleterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)prefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrefix:(id)a3
{
}

- (EKSource)source
{
  return (EKSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSource:(id)a3
{
}

- (NSSet)addressesToIgnore
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAddressesToIgnore:(id)a3
{
}

- (NSMutableArray)contactResults
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContactResults:(id)a3
{
}

- (CNCancelable)autocompletionSearchRequest
{
  return (CNCancelable *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAutocompletionSearchRequest:(id)a3
{
}

- (BOOL)autocompleteRunning
{
  return self->_autocompleteRunning;
}

- (void)setAutocompleteRunning:(BOOL)a3
{
  self->_autocompleteRunning = a3;
}

- (CNAutocompleteStore)autocompleteStore
{
  return (CNAutocompleteStore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAutocompleteStore:(id)a3
{
}

- (EKDirectorySearchOperation)directorySearchOperation
{
  return (EKDirectorySearchOperation *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDirectorySearchOperation:(id)a3
{
}

- (OS_dispatch_queue)directorySearchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDirectorySearchQueue:(id)a3
{
}

- (NSMutableArray)directorySearchResults
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDirectorySearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directorySearchResults, 0);
  objc_storeStrong((id *)&self->_directorySearchQueue, 0);
  objc_storeStrong((id *)&self->_directorySearchOperation, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_storeStrong((id *)&self->_autocompletionSearchRequest, 0);
  objc_storeStrong((id *)&self->_contactResults, 0);
  objc_storeStrong((id *)&self->_addressesToIgnore, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_prefix, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)searchFor:(uint64_t)a1 onSource:(void *)a2 withContext:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 allResults];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = [v6 count];
  _os_log_debug_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEBUG, "[EKAutocomplete] Same search (\"%@\"), ret %lu results.", (uint8_t *)&v7, 0x16u);
}

- (void)searchFor:(uint64_t)a1 onSource:(NSObject *)a2 withContext:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "[EKAutocomplete] Search for %@ invoked", (uint8_t *)&v2, 0xCu);
}

@end