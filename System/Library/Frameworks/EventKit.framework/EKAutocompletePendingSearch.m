@interface EKAutocompletePendingSearch
+ (id)_eventKitQueue;
+ (id)_queue;
- (BOOL)_shouldReturnResultForEvent:(id)a3 considerReadonlyEvents:(BOOL)a4;
- (EKAutocompletePendingSearch)initWithEventStore:(id)a3 searchString:(id)a4 maximumResultCount:(unint64_t)a5 ignoreScheduledEvents:(BOOL)a6 initialEvent:(id)a7 pasteboardItemProvider:(id)a8 completionHandler:(id)a9;
- (EKAutocompletePendingSearch)searchWithString:(id)a3 completionHandler:(id)a4;
- (id)firstNaturalLanguageResultWithSearchString:(id)a3;
- (void)cancel;
@end

@implementation EKAutocompletePendingSearch

- (EKAutocompletePendingSearch)initWithEventStore:(id)a3 searchString:(id)a4 maximumResultCount:(unint64_t)a5 ignoreScheduledEvents:(BOOL)a6 initialEvent:(id)a7 pasteboardItemProvider:(id)a8 completionHandler:(id)a9
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)EKAutocompletePendingSearch;
  v19 = [(EKAutocompletePendingSearch *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_eventStore, a3);
    v20->_maximumResultCount = a5;
    v20->_ignoreScheduledEvents = a6;
    objc_storeStrong((id *)&v20->_initialEvent, a7);
    objc_storeStrong((id *)&v20->_pasteboardItemProvider, a8);
    [(EKAutocompletePendingSearch *)v20 searchWithString:v15 completionHandler:v18];
  }

  return v20;
}

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)_queue_queue;

  return v2;
}

uint64_t __37__EKAutocompletePendingSearch__queue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobilecal.autocompletesearchcontroller.internalqueue", 0);
  uint64_t v1 = _queue_queue;
  _queue_queue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_eventKitQueue
{
  if (_eventKitQueue_onceToken != -1) {
    dispatch_once(&_eventKitQueue_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)_eventKitQueue_queue;

  return v2;
}

uint64_t __45__EKAutocompletePendingSearch__eventKitQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobilecal.autocompletesearchcontroller.eventkitqueue", 0);
  uint64_t v1 = _eventKitQueue_queue;
  _eventKitQueue_queue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)firstNaturalLanguageResultWithSearchString:(id)a3
{
  v4 = [(EKEventStore *)self->_eventStore predicateForNaturalLanguageSuggestedEventsWithSearchString:a3];
  v5 = [(EKEventStore *)self->_eventStore eventsMatchingPredicate:v4];
  if ([v5 count])
  {
    v6 = [v5 firstObject];
    v7 = objc_opt_new();
    v8 = [v6 uniqueID];
    [v7 setIdentifier:v8];

    v9 = [v6 title];
    [v7 setTitle:v9];

    [v7 setNaturalLanguageSuggestedEvent:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldReturnResultForEvent:(id)a3 considerReadonlyEvents:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = [v6 calendar];
    if ([v8 allowsContentModifications])
    {
    }
    else
    {
      v9 = [v7 calendar];
      int v10 = [v9 isNaturalLanguageSuggestedEventCalendar];

      if (!v10)
      {
LABEL_8:
        char v11 = 0;
        goto LABEL_12;
      }
    }
  }
  if ([v7 hasAttendees] && self->_ignoreScheduledEvents) {
    goto LABEL_8;
  }
  initialEvent = self->_initialEvent;
  if (initialEvent)
  {
    v13 = [(EKObject *)initialEvent uniqueIdentifier];
    v14 = [v7 uniqueIdentifier];
    char v15 = [v13 isEqualToString:v14];

    char v11 = v15 ^ 1;
  }
  else
  {
    char v11 = 1;
  }
LABEL_12:

  return v11;
}

- (EKAutocompletePendingSearch)searchWithString:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_pendingSearch)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"EKAutocompleteSearch.m" lineNumber:129 description:@"searchWithString:completionHandler: called multiple times"];
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  id v27 = 0;
  v9 = [(id)objc_opt_class() _eventKitQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke;
  block[3] = &unk_1E5B97028;
  v25 = v26;
  block[4] = self;
  id v10 = v7;
  id v24 = v10;
  dispatch_async(v9, block);

  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKAutocompletePendingSearch searchWithString:completionHandler:]();
  }
  id v11 = (id)*MEMORY[0x1E4F57920];
  v12 = (void *)MEMORY[0x1E4F577C0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_20;
  v19[3] = &unk_1E5B97540;
  v19[4] = self;
  id v13 = v10;
  id v20 = v13;
  id v14 = v8;
  id v21 = v14;
  v22 = v26;
  char v15 = [v12 searchWithString:v13 clientBundleID:v11 completionHandler:v19];
  pendingSearch = self->_pendingSearch;
  self->_pendingSearch = v15;

  _Block_object_dispose(v26, 8);
  return result;
}

uint64_t __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) firstNaturalLanguageResultWithSearchString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)[a2 mutableCopy];
  id v7 = [(id)objc_opt_class() _queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5B97518;
  id v8 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v15 = v8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v17 = v9;
  uint64_t v18 = v10;
  id v16 = v6;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, v13);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_3();
  }
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v2 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_2(a1, (uint64_t *)(a1 + 40), v2);
      }
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(v3 + 48);
      *(void *)(v3 + 48) = 0;

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      id v5 = [(id)objc_opt_class() _eventKitQueue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21;
      v8[3] = &unk_1E5B974F0;
      uint64_t v14 = *(void *)(a1 + 72);
      id v6 = *(id *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      id v9 = v6;
      uint64_t v10 = v7;
      id v11 = *(id *)(a1 + 48);
      id v13 = *(id *)(a1 + 64);
      id v12 = *(id *)(a1 + 40);
      dispatch_async(v5, v8);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_1();
  }
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_4();
  }
  v37 = objc_opt_new();
  v40 = objc_opt_new();
  v39 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v2) {
    [*(id *)(a1 + 32) insertObject:v2 atIndex:0];
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v3)
  {
    BOOL v4 = 0;
    uint64_t v41 = *(void *)v57;
LABEL_7:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v57 != v41) {
        objc_enumerationMutation(obj);
      }
      id v6 = *(void **)(*((void *)&v56 + 1) + 8 * v5);
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x2020000000;
      char v55 = 0;
      uint64_t v7 = [(id)objc_opt_class() _queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_25;
      block[3] = &unk_1E5B96F20;
      block[4] = *(void *)(a1 + 40);
      void block[5] = &v52;
      dispatch_sync(v7, block);

      if (*((unsigned char *)v53 + 24))
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
          __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_3();
        }
        _Block_object_dispose(&v52, 8);

        goto LABEL_56;
      }
      id v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSinceDate:v39];
      if (v9 >= 0.5)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
          __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_2();
        }

        _Block_object_dispose(&v52, 8);
        goto LABEL_37;
      }
      uint64_t v10 = [v6 title];
      id v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v12 = [v10 stringByTrimmingCharactersInSet:v11];
      id v13 = [v12 lowercaseString];

      uint64_t v14 = [v40 objectForKey:v13];
      if (!v4 || v14 != 0) {
        break;
      }
      BOOL v4 = 1;
LABEL_28:

      _Block_object_dispose(&v52, 8);
      if (v3 == ++v5)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v3) {
          goto LABEL_7;
        }
        goto LABEL_37;
      }
    }
    id v15 = *(void **)(*(void *)(a1 + 40) + 8);
    id v16 = [v6 identifier];
    id v17 = [v15 eventWithUniqueId:v16];

    if (([*(id *)(a1 + 40) _shouldReturnResultForEvent:v17 considerReadonlyEvents:0] & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    if (v14)
    {
      if ([(EKAutocompleteSearchResult *)v14 source] == 2)
      {
LABEL_24:
        if (*(void *)(*(void *)(a1 + 40) + 16)) {
          BOOL v4 = (unint64_t)[v37 count] >= *(void *)(*(void *)(a1 + 40) + 16);
        }
        else {
          BOOL v4 = 0;
        }
        goto LABEL_27;
      }
    }
    else
    {
      int v18 = [v6 isNaturalLanguageSuggestedEvent];
      v19 = [EKAutocompleteSearchResult alloc];
      if (v18) {
        uint64_t v20 = 2;
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v14 = -[EKAutocompleteSearchResult initWithSource:](v19, "initWithSource:", v20, v37);
      [v40 setObject:v14 forKey:v13];
      [v37 addObject:v14];
      -[EKAutocompleteSearchResult setAllDay:](v14, "setAllDay:", [v17 isAllDay]);
    }
    -[EKAutocompleteSearchResult updateSelfFromEvent:](v14, "updateSelfFromEvent:", v17, v37);
    goto LABEL_24;
  }
LABEL_37:

  id v21 = *(void **)(*(void *)(a1 + 40) + 40);
  if (v21)
  {
    v22 = [v21 eventsFromPasteboard];
    v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v22, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v23 = v22;
    unsigned __int8 v24 = 0;
    uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v48 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 40), "_shouldReturnResultForEvent:considerReadonlyEvents:", v28, 1, v37))
          {
            if ([*(id *)(a1 + 48) length])
            {
              v29 = [v28 title];
              char v30 = [v29 containsCaseAndDiacriticInsensitive:*(void *)(a1 + 48)];
            }
            else
            {
              char v30 = 1;
            }
            v31 = [[EKAutocompleteSearchResult alloc] initWithSource:3];
            -[EKAutocompleteSearchResult setAllDay:](v31, "setAllDay:", [v28 isAllDay]);
            [v28 travelTime];
            -[EKAutocompleteSearchResult setTravelTime:](v31, "setTravelTime:");
            v32 = [v28 travelStartLocation];
            [(EKAutocompleteSearchResult *)v31 setTravelStartLocation:v32];

            [(EKAutocompleteSearchResult *)v31 updateSelfFromEvent:v28];
            -[EKAutocompleteSearchResult setCalendarColor:](v31, "setCalendarColor:", [*(id *)(*(void *)(a1 + 40) + 40) colorOfCalendarToPasteTo]);
            [v42 addObject:v31];

            v24 |= v30;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v25);
    }

    if ((([v42 count] != 0) & v24) == 1)
    {
      v33 = [[EKAutocompleteSearchResult alloc] initWithSource:4];
      [(EKAutocompleteSearchResult *)v33 setPasteboardResults:v42];
      v34 = [v37 firstObject];
      BOOL v35 = [v34 source] == 2;

      [v37 insertObject:v33 atIndex:v35];
    }
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_1();
  }
  v36 = [(id)objc_opt_class() _queue];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_28;
  v43[3] = &unk_1E5B974C8;
  v43[4] = *(void *)(a1 + 40);
  id v46 = *(id *)(a1 + 64);
  id v44 = v37;
  id v45 = *(id *)(a1 + 56);
  dispatch_async(v36, v43);

LABEL_56:
}

uint64_t __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_25(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48) == 0;
  return result;
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 48);
  BOOL v3 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v3) {
      __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_28_cold_2();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (v3)
  {
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_28_cold_1();
  }
}

- (void)cancel
{
  BOOL v3 = [(id)objc_opt_class() _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EKAutocompletePendingSearch_cancel__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __37__EKAutocompletePendingSearch_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    [v2 cancel];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSearch, 0);
  objc_storeStrong((id *)&self->_pasteboardItemProvider, 0);
  objc_storeStrong((id *)&self->_initialEvent, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)searchWithString:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Beginning spotlight search.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Search was cancelled before we processed results. Abandoning.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Spotlight query controller returned an error when searching for string (%@), error: %@", (uint8_t *)&v5, 0x16u);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Got spotlight search results.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Finished processing results.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Search took longer than allowed time. Stopping earlier.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Search was cancelled while processing results. Abandoning.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_21_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Processing results.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Search was cancelled while we processed results. Abandoning.", v2, v3, v4, v5, v6);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_28_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "EKAutocompleteSearch: Returning results via callback.", v2, v3, v4, v5, v6);
}

@end