@interface CNAutocompleteSearchManager
- (BOOL)includeUpcomingEventMembers;
- (BOOL)isSimulatedResultsEnabled;
- (BOOL)shouldIncludeGroupResults;
- (BOOL)shouldUnifyResults;
- (CNAutocompleteSearchManager)init;
- (CNAutocompleteSearchManager)initWithAutocompleteSearchType:(unint64_t)a3;
- (CNAutocompleteSearchManager)initWithAutocompleteStore:(id)a3 searchType:(unint64_t)a4;
- (CNAutocompleteUIFetchDelegate)fetchDelegate;
- (NSArray)searchAccountIDs;
- (NSArray)searchAccounts;
- (NSString)recentsBundleIdentifier;
- (NSString)sendingAccountIdentifier;
- (NSString)sendingAddress;
- (id)_nextTaskID;
- (id)searchForCorecipientsWithAutocompleteFetchContext:(id)a3 consumer:(id)a4;
- (id)searchForText:(id)a3 consumer:(id)a4;
- (id)searchForText:(id)a3 withAutocompleteFetchContext:(id)a4 consumer:(id)a5;
- (unint64_t)autocompleteSearchType;
- (unint64_t)implicitGroupCreationThreshold;
- (void)_handleContactsAutocompleteSearch:(id)a3 returnedResults:(id)a4 taskID:(id)a5;
- (void)_handleContactsAutocompleteSearchFinished:(id)a3 taskID:(id)a4;
- (void)_handleTaskFinished:(id)a3 context:(id)a4;
- (void)cancelTaskWithID:(id)a3;
- (void)dealloc;
- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4;
- (void)removeRecipientResult:(id)a3;
- (void)setAutocompleteSearchType:(unint64_t)a3;
- (void)setFetchDelegate:(id)a3;
- (void)setImplicitGroupCreationThreshold:(unint64_t)a3;
- (void)setIncludeUpcomingEventMembers:(BOOL)a3;
- (void)setRecentsBundleIdentifier:(id)a3;
- (void)setSearchAccountIDs:(id)a3;
- (void)setSearchControllerOptions:(id)a3;
- (void)setSearchTypes:(unint64_t)a3;
- (void)setSendingAccountIdentifier:(id)a3;
- (void)setSendingAddress:(id)a3;
- (void)setShouldIncludeGroupResults:(BOOL)a3;
- (void)setShouldUnifyResults:(BOOL)a3;
- (void)setSimulatedResultsEnabled:(BOOL)a3;
@end

@implementation CNAutocompleteSearchManager

- (CNAutocompleteSearchManager)initWithAutocompleteSearchType:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A0A8]);
  v6 = [(CNAutocompleteSearchManager *)self initWithAutocompleteStore:v5 searchType:a3];

  return v6;
}

- (CNAutocompleteSearchManager)initWithAutocompleteStore:(id)a3 searchType:(unint64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNAutocompleteSearchManager;
  v8 = [(CNAutocompleteSearchManager *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_shouldUnifyResults = 1;
    v8->_searchTypes = 31;
    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v10 bundleIdentifier];
    uint64_t v12 = [v11 copy];
    recentsBundleIdentifier = v9->_recentsBundleIdentifier;
    v9->_recentsBundleIdentifier = (NSString *)v12;

    v9->_autocompleteSearchType = a4;
    objc_storeStrong((id *)&v9->_autocompleteStore, a3);
    if (!v9->_queue)
    {
      v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      queue = v9->_queue;
      v9->_queue = v14;

      [(NSOperationQueue *)v9->_queue setMaxConcurrentOperationCount:1];
      [(NSOperationQueue *)v9->_queue setQualityOfService:25];
    }
    if (!v9->_taskContextsByTaskID)
    {
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      taskContextsByTaskID = v9->_taskContextsByTaskID;
      v9->_taskContextsByTaskID = v16;
    }
  }

  return v9;
}

- (CNAutocompleteSearchManager)init
{
  return [(CNAutocompleteSearchManager *)self initWithAutocompleteSearchType:0];
}

- (void)setSearchTypes:(unint64_t)a3
{
  self->_searchTypes = a3;
}

- (void)setSearchControllerOptions:(id)a3
{
}

- (void)setShouldIncludeGroupResults:(BOOL)a3
{
  v4 = [NSNumber numberWithBool:a3];
  shouldIncludeGroupResultsImpl = self->_shouldIncludeGroupResultsImpl;
  self->_shouldIncludeGroupResultsImpl = v4;

  MEMORY[0x1F41817F8](v4, shouldIncludeGroupResultsImpl);
}

- (BOOL)shouldIncludeGroupResults
{
  shouldIncludeGroupResultsImpl = self->_shouldIncludeGroupResultsImpl;
  return !shouldIncludeGroupResultsImpl || [(NSNumber *)shouldIncludeGroupResultsImpl BOOLValue];
}

- (id)_nextTaskID
{
  return (id)[NSNumber numberWithUnsignedInt:self->_genNumber++];
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  autocompleteStore = self->_autocompleteStore;
  id v6 = [a3 autocompleteResult];
  [(CNAutocompleteStore *)autocompleteStore userSelectedResult:v6 atSortedIndex:a4];
}

- (void)removeRecipientResult:(id)a3
{
  id v4 = a3;
  if ([v4 isRemovableFromSearchResults])
  {
    id v5 = [v4 autocompleteResult];
    if (v5)
    {
      autocompleteStore = self->_autocompleteStore;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __53__CNAutocompleteSearchManager_removeRecipientResult___block_invoke;
      v7[3] = &unk_1E6128EE8;
      id v8 = v4;
      [(CNAutocompleteStore *)autocompleteStore ignoreResult:v5 completionHandler:v7];
    }
  }
}

void __53__CNAutocompleteSearchManager_removeRecipientResult___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = contactsSearchManagerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1B5AF5000, v6, OS_LOG_TYPE_INFO, "removal of autocomplete recent %@ failed: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)searchForText:(id)a3 withAutocompleteFetchContext:(id)a4 consumer:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CNAutocompleteSearchManager *)self _nextTaskID];
  uint64_t v12 = +[CNContactsAutocompleteSearchOperation operationWithOwner:self text:v8 taskID:v11 autocompleteStore:self->_autocompleteStore];

  if (v12)
  {
    v13 = contactsSearchManagerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:]((uint64_t)v8, v12);
    }

    v14 = contactsSearchManagerLog();
    v15 = [v12 taskID];
    os_signpost_id_t v16 = [v15 unsignedIntegerValue];

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B5AF5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "autocompleteTextSearch", "autocompleteSearch started", v26, 2u);
    }

    objc_msgSend(v12, "setShouldUnifyResults:", -[CNAutocompleteSearchManager shouldUnifyResults](self, "shouldUnifyResults"));
    [v12 setShouldIncludeGroupResults:self->_shouldIncludeGroupResultsImpl];
    searchControllerOptions = self->_searchControllerOptions;
    if (searchControllerOptions) {
      objc_msgSend(v12, "setAddressableGroupResultStyle:", -[CNAutocompleteSearchControllerOptions addressableGroupResultStyle](searchControllerOptions, "addressableGroupResultStyle"));
    }
    [v12 configureForSearchTypes:self->_searchTypes];
    [v12 setFetchContext:v9];
    objc_msgSend(v12, "setSimulateResults:", -[CNAutocompleteSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
    queue = self->_queue;
    v27[0] = v12;
    objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(NSOperationQueue *)queue addOperations:v19 waitUntilFinished:0];

    v20 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
    v21 = +[CNAutocompleteContactsSearchTaskContext contextWithConsumer:v10 text:v8 operations:v20 searchQueries:0];

    if (v21)
    {
      taskContextsByTaskID = self->_taskContextsByTaskID;
      v23 = [v12 taskID];
      [(NSMutableDictionary *)taskContextsByTaskID setObject:v21 forKey:v23];
    }
  }
  v24 = [v12 taskID];

  return v24;
}

- (id)searchForText:(id)a3 consumer:(id)a4
{
  return [(CNAutocompleteSearchManager *)self searchForText:a3 withAutocompleteFetchContext:0 consumer:a4];
}

- (id)searchForCorecipientsWithAutocompleteFetchContext:(id)a3 consumer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNAutocompleteSearchManager *)self _nextTaskID];
  id v9 = +[CNContactsAutocompleteSearchOperation operationWithOwner:self text:0 taskID:v8 autocompleteStore:self->_autocompleteStore];
  id v10 = contactsSearchManagerLog();
  id v11 = [v9 taskID];
  os_signpost_id_t v12 = [v11 unsignedIntegerValue];

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B5AF5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "autocompleteCorecipientsSearch", "autocompleteSearch (corecipients) started", v22, 2u);
  }

  [v9 setShouldIncludeGroupResults:self->_shouldIncludeGroupResultsImpl];
  [v9 configureForSearchTypes:self->_searchTypes];
  [v9 setFetchContext:v6];
  objc_msgSend(v9, "setSimulateResults:", -[CNAutocompleteSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
  searchControllerOptions = self->_searchControllerOptions;
  if (searchControllerOptions) {
    objc_msgSend(v9, "setAddressableGroupResultStyle:", -[CNAutocompleteSearchControllerOptions addressableGroupResultStyle](searchControllerOptions, "addressableGroupResultStyle"));
  }
  corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  if (!corecipientSearchTaskIDs)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_signpost_id_t v16 = self->_corecipientSearchTaskIDs;
    self->_corecipientSearchTaskIDs = v15;

    corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  }
  [(NSMutableArray *)corecipientSearchTaskIDs addObject:v8];
  [(NSOperationQueue *)self->_queue addOperation:v9];
  v17 = [MEMORY[0x1E4F1CA80] setWithObject:v9];
  v18 = [v6 otherAddressesAlreadyChosen];
  objc_super v19 = [v18 componentsJoinedByString:@", "];
  v20 = +[CNAutocompleteContactsSearchTaskContext contextWithConsumer:v7 text:v19 operations:v17 searchQueries:0];

  if (v20) {
    [(NSMutableDictionary *)self->_taskContextsByTaskID setObject:v20 forKey:v8];
  }

  return v8;
}

- (void)_handleTaskFinished:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = contactsSearchManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CNAutocompleteSearchManager _handleTaskFinished:context:]();
  }

  id v9 = [v7 consumer];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [v7 consumer];
    [v11 finishedTaskWithID:v6];
  }
  [(NSMutableDictionary *)self->_taskContextsByTaskID removeObjectForKey:v6];
}

- (void)_handleContactsAutocompleteSearchFinished:(id)a3 taskID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = contactsSearchManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CNAutocompleteSearchManager _handleTaskFinished:context:]();
  }

  id v9 = [(NSMutableDictionary *)self->_taskContextsByTaskID objectForKey:v6];
  int v10 = [(NSMutableArray *)self->_corecipientSearchTaskIDs containsObject:v6];
  id v11 = contactsSearchManagerLog();
  uint64_t v12 = [v6 unsignedIntegerValue];
  os_signpost_id_t v13 = v12;
  if (v10)
  {
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B5AF5000, v11, OS_SIGNPOST_INTERVAL_END, v13, "autocompleteCorecipientsSearch", "autocompleteSearchFinished (corecipients)", buf, 2u);
    }

    if ([v9 consumerRespondsToCallbacks])
    {
      v14 = [v9 consumer];
      [v14 finishedSearchingForCorecipients];
    }
    [(NSMutableArray *)self->_corecipientSearchTaskIDs removeObject:v6];
  }
  else
  {
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B5AF5000, v11, OS_SIGNPOST_INTERVAL_END, v13, "autocompleteTextSearch", "autocompleteSearchFinished", v17, 2u);
    }

    if ([v9 consumerRespondsToCallbacks])
    {
      v15 = [v9 consumer];
      [v15 finishedSearchingForAutocompleteResults];
    }
  }
  os_signpost_id_t v16 = [v9 operations];
  [v16 removeObject:v7];

  if ([v9 done]) {
    [(CNAutocompleteSearchManager *)self _handleTaskFinished:v6 context:v9];
  }
}

- (void)_handleContactsAutocompleteSearch:(id)a3 returnedResults:(id)a4 taskID:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = contactsSearchManagerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CNAutocompleteSearchManager _handleContactsAutocompleteSearch:returnedResults:taskID:]((uint64_t)v8, v7);
  }

  int v10 = contactsSearchManagerLog();
  uint64_t v11 = [v8 unsignedIntegerValue];
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      int v17 = 134217984;
      uint64_t v18 = [v7 count];
      _os_signpost_emit_with_name_impl(&dword_1B5AF5000, v10, OS_SIGNPOST_EVENT, v12, "autocompleteSearchReturnedResults", "found %ld autocomplete results", (uint8_t *)&v17, 0xCu);
    }
  }

  os_signpost_id_t v13 = [(NSMutableDictionary *)self->_taskContextsByTaskID objectForKey:v8];
  int v14 = [(NSMutableArray *)self->_corecipientSearchTaskIDs containsObject:v8];
  int v15 = [v13 consumerRespondsToCallbacks];
  if (v14)
  {
    if (v15)
    {
      os_signpost_id_t v16 = [v13 consumer];
      [v16 consumeCorecipientSearchResults:v7 taskID:v8];
LABEL_11:
    }
  }
  else if (v15)
  {
    os_signpost_id_t v16 = [v13 consumer];
    [v16 consumeAutocompleteSearchResults:v7 taskID:v8];
    goto LABEL_11;
  }
}

- (void)cancelTaskWithID:(id)a3
{
  id v4 = a3;
  id v5 = contactsSearchManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CNAutocompleteSearchManager cancelTaskWithID:]();
  }

  int v6 = [(NSMutableArray *)self->_corecipientSearchTaskIDs containsObject:v4];
  id v7 = contactsSearchManagerLog();
  uint64_t v8 = [v4 unsignedIntegerValue];
  os_signpost_id_t v9 = v8;
  if (v6)
  {
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      __int16 v16 = 0;
      int v10 = "autocompleteCorecipientsSearch";
      uint64_t v11 = "autocompleteSearch (corecipients) was cancelled";
      os_signpost_id_t v12 = (uint8_t *)&v16;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_1B5AF5000, v7, OS_SIGNPOST_INTERVAL_END, v9, v10, v11, v12, 2u);
    }
  }
  else if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    __int16 v15 = 0;
    int v10 = "autocompleteTextSearch";
    uint64_t v11 = "autocompleteSearch was cancelled";
    os_signpost_id_t v12 = (uint8_t *)&v15;
    goto LABEL_10;
  }

  os_signpost_id_t v13 = [(NSMutableDictionary *)self->_taskContextsByTaskID objectForKey:v4];
  int v14 = [v13 operations];
  [v14 makeObjectsPerformSelector:sel_cancel];

  [(NSMutableDictionary *)self->_taskContextsByTaskID removeObjectForKey:v4];
}

- (void)dealloc
{
  int contactSearchAccountChangedToken = self->_contactSearchAccountChangedToken;
  if (contactSearchAccountChangedToken) {
    notify_cancel(contactSearchAccountChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNAutocompleteSearchManager;
  [(CNAutocompleteSearchManager *)&v4 dealloc];
}

- (NSString)recentsBundleIdentifier
{
  return self->_recentsBundleIdentifier;
}

- (void)setRecentsBundleIdentifier:(id)a3
{
}

- (NSArray)searchAccountIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSearchAccountIDs:(id)a3
{
}

- (NSString)sendingAddress
{
  return self->_sendingAddress;
}

- (void)setSendingAddress:(id)a3
{
}

- (CNAutocompleteUIFetchDelegate)fetchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fetchDelegate);

  return (CNAutocompleteUIFetchDelegate *)WeakRetained;
}

- (void)setFetchDelegate:(id)a3
{
}

- (unint64_t)implicitGroupCreationThreshold
{
  return self->_implicitGroupCreationThreshold;
}

- (void)setImplicitGroupCreationThreshold:(unint64_t)a3
{
  self->_implicitGroupCreationThreshold = a3;
}

- (BOOL)includeUpcomingEventMembers
{
  return self->_includeUpcomingEventMembers;
}

- (void)setIncludeUpcomingEventMembers:(BOOL)a3
{
  self->_includeUpcomingEventMembers = a3;
}

- (unint64_t)autocompleteSearchType
{
  return self->_autocompleteSearchType;
}

- (void)setAutocompleteSearchType:(unint64_t)a3
{
  self->_autocompleteSearchType = a3;
}

- (NSString)sendingAccountIdentifier
{
  return self->_sendingAccountIdentifier;
}

- (void)setSendingAccountIdentifier:(id)a3
{
}

- (BOOL)shouldUnifyResults
{
  return self->_shouldUnifyResults;
}

- (void)setShouldUnifyResults:(BOOL)a3
{
  self->_shouldUnifyResults = a3;
}

- (BOOL)isSimulatedResultsEnabled
{
  return self->_simulatedResultsEnabled;
}

- (void)setSimulatedResultsEnabled:(BOOL)a3
{
  self->_simulatedResultsEnabled = a3;
}

- (NSArray)searchAccounts
{
  return self->_searchAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAccountIdentifier, 0);
  objc_destroyWeak((id *)&self->_fetchDelegate);
  objc_storeStrong((id *)&self->_recentsBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_corecipientSearchTaskIDs, 0);
  objc_storeStrong((id *)&self->_shouldIncludeGroupResultsImpl, 0);
  objc_storeStrong((id *)&self->_searchAccounts, 0);
  objc_storeStrong((id *)&self->_explicitSearchAccountIDs, 0);
  objc_storeStrong((id *)&self->_searchControllerOptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);

  objc_storeStrong((id *)&self->_taskContextsByTaskID, 0);
}

- (void)searchForText:(uint64_t)a1 withAutocompleteFetchContext:(void *)a2 consumer:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 taskID];
  OUTLINED_FUNCTION_4(&dword_1B5AF5000, v2, v3, "Beginning CNContactsAutocompleteSearchOperation for \"%@\" (task %@)", v4, v5, v6, v7, 2u);
}

- (void)_handleTaskFinished:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "task %@ finished", v2, v3, v4, v5, v6);
}

- (void)_handleContactsAutocompleteSearch:(uint64_t)a1 returnedResults:(void *)a2 taskID:.cold.1(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_4(&dword_1B5AF5000, v2, v3, "task %@: found %ld autocomplete results", v4, v5, v6, v7, 2u);
}

- (void)cancelTaskWithID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5AF5000, v0, v1, "task %@ cancelled", v2, v3, v4, v5, v6);
}

@end