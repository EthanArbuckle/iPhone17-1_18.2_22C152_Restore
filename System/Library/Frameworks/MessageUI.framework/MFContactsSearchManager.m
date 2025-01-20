@interface MFContactsSearchManager
- (BOOL)includeUpcomingEventMembers;
- (BOOL)isSimulatedResultsEnabled;
- (MFContactsSearchManager)init;
- (MFContactsSearchManager)initWithAutocompleteSearchType:(unint64_t)a3;
- (MFContactsSearchManager)initWithAutocompleteStore:(id)a3 searchType:(unint64_t)a4;
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
- (void)setImplicitGroupCreationThreshold:(unint64_t)a3;
- (void)setIncludeUpcomingEventMembers:(BOOL)a3;
- (void)setRecentsBundleIdentifier:(id)a3;
- (void)setSearchAccountIDs:(id)a3;
- (void)setSearchTypes:(unint64_t)a3;
- (void)setSendingAccountIdentifier:(id)a3;
- (void)setSendingAddress:(id)a3;
- (void)setSimulatedResultsEnabled:(BOOL)a3;
@end

@implementation MFContactsSearchManager

- (MFContactsSearchManager)initWithAutocompleteSearchType:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A0A8]);
  v6 = [(MFContactsSearchManager *)self initWithAutocompleteStore:v5 searchType:a3];

  return v6;
}

- (MFContactsSearchManager)initWithAutocompleteStore:(id)a3 searchType:(unint64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFContactsSearchManager;
  v8 = [(MFContactsSearchManager *)&v19 init];
  v9 = v8;
  if (v8)
  {
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

- (MFContactsSearchManager)init
{
  return [(MFContactsSearchManager *)self initWithAutocompleteSearchType:0];
}

- (void)setSearchTypes:(unint64_t)a3
{
  self->_searchTypes = a3;
}

- (id)_nextTaskID
{
  return (id)[NSNumber numberWithUnsignedInt:self->_genNumber++];
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  autocompleteStore = self->_autocompleteStore;
  id v5 = [a3 autocompleteResult];
  -[CNAutocompleteStore userSelectedResult:atSortedIndex:](autocompleteStore, "userSelectedResult:atSortedIndex:");
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
      v7[2] = __49__MFContactsSearchManager_removeRecipientResult___block_invoke;
      v7[3] = &unk_1E5F7A7D8;
      id v8 = v4;
      [(CNAutocompleteStore *)autocompleteStore ignoreResult:v5 completionHandler:v7];
    }
  }
}

void __49__MFContactsSearchManager_removeRecipientResult___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#Warning removal of autocomplete recent %@ failed: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)searchForText:(id)a3 withAutocompleteFetchContext:(id)a4 consumer:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MFContactsSearchManager *)self _nextTaskID];
  uint64_t v12 = +[MFContactsAutocompleteSearchOperation operationWithOwner:self text:v8 taskID:v11 autocompleteStore:self->_autocompleteStore];

  if (v12)
  {
    [v12 configureForSearchTypes:self->_searchTypes];
    [v12 setFetchContext:v9];
    objc_msgSend(v12, "setSimulateResults:", -[MFContactsSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
    queue = self->_queue;
    v21[0] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(NSOperationQueue *)queue addOperations:v14 waitUntilFinished:0];

    v15 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
    v16 = +[MFContactsSearchTaskContext contextWithConsumer:v10 text:v8 operations:v15 searchQueries:0];

    if (v16)
    {
      taskContextsByTaskID = self->_taskContextsByTaskID;
      v18 = [v12 taskID];
      [(NSMutableDictionary *)taskContextsByTaskID setObject:v16 forKey:v18];
    }
  }
  objc_super v19 = [v12 taskID];

  return v19;
}

- (id)searchForText:(id)a3 consumer:(id)a4
{
  id v4 = [(MFContactsSearchManager *)self searchForText:a3 withAutocompleteFetchContext:0 consumer:a4];

  return v4;
}

- (id)searchForCorecipientsWithAutocompleteFetchContext:(id)a3 consumer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFContactsSearchManager *)self _nextTaskID];
  id v9 = +[MFContactsAutocompleteSearchOperation operationWithOwner:self text:0 taskID:v8 autocompleteStore:self->_autocompleteStore];
  [v9 configureForSearchTypes:self->_searchTypes];
  [v9 setFetchContext:v6];
  objc_msgSend(v9, "setSimulateResults:", -[MFContactsSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
  corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  if (!corecipientSearchTaskIDs)
  {
    id v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = self->_corecipientSearchTaskIDs;
    self->_corecipientSearchTaskIDs = v11;

    corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  }
  [(NSMutableArray *)corecipientSearchTaskIDs addObject:v8];
  [(NSOperationQueue *)self->_queue addOperation:v9];
  v13 = [MEMORY[0x1E4F1CA80] setWithObject:v9];
  v14 = [v6 otherAddressesAlreadyChosen];
  v15 = [v14 componentsJoinedByString:@", "];
  v16 = +[MFContactsSearchTaskContext contextWithConsumer:v7 text:v15 operations:v13 searchQueries:0];

  if (v16) {
    [(NSMutableDictionary *)self->_taskContextsByTaskID setObject:v16 forKey:v8];
  }

  return v8;
}

- (void)_handleTaskFinished:(id)a3 context:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 consumer];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [v6 consumer];
    [v9 finishedTaskWithID:v10];
  }
  [(NSMutableDictionary *)self->_taskContextsByTaskID removeObjectForKey:v10];
}

- (void)_handleContactsAutocompleteSearchFinished:(id)a3 taskID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_taskContextsByTaskID objectForKey:v6];
  if ([(NSMutableArray *)self->_corecipientSearchTaskIDs containsObject:v6])
  {
    if ([v7 consumerRespondsToCallbacks])
    {
      char v8 = [v7 consumer];
      [v8 finishedSearchingForCorecipients];
    }
    [(NSMutableArray *)self->_corecipientSearchTaskIDs removeObject:v6];
  }
  else if ([v7 consumerRespondsToCallbacks])
  {
    id v9 = [v7 consumer];
    [v9 finishedSearchingForAutocompleteResults];
  }
  id v10 = [v7 operations];
  [v10 removeObject:v11];

  if ([v7 done]) {
    [(MFContactsSearchManager *)self _handleTaskFinished:v6 context:v7];
  }
}

- (void)_handleContactsAutocompleteSearch:(id)a3 returnedResults:(id)a4 taskID:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  char v8 = [(NSMutableDictionary *)self->_taskContextsByTaskID objectForKey:v7];
  if ([(NSMutableArray *)self->_corecipientSearchTaskIDs containsObject:v7])
  {
    if (![v8 consumerRespondsToCallbacks]) {
      goto LABEL_7;
    }
    id v9 = [v8 consumer];
    [v9 consumeCorecipientSearchResults:v10 taskID:v7];
  }
  else
  {
    if (![v8 consumerRespondsToCallbacks]) {
      goto LABEL_7;
    }
    id v9 = [v8 consumer];
    [v9 consumeAutocompleteSearchResults:v10 taskID:v7];
  }

LABEL_7:
}

- (void)cancelTaskWithID:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_taskContextsByTaskID, "objectForKey:");
  id v5 = [v4 operations];
  [v5 makeObjectsPerformSelector:sel_cancel];

  [(NSMutableDictionary *)self->_taskContextsByTaskID removeObjectForKey:v6];
}

- (void)dealloc
{
  int contactSearchAccountChangedToken = self->_contactSearchAccountChangedToken;
  if (contactSearchAccountChangedToken) {
    notify_cancel(contactSearchAccountChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFContactsSearchManager;
  [(MFContactsSearchManager *)&v4 dealloc];
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
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
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
  objc_storeStrong((id *)&self->_recentsBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_corecipientSearchTaskIDs, 0);
  objc_storeStrong((id *)&self->_searchAccounts, 0);
  objc_storeStrong((id *)&self->_explicitSearchAccountIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);

  objc_storeStrong((id *)&self->_taskContextsByTaskID, 0);
}

@end