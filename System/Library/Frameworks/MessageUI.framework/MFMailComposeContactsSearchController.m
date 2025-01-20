@interface MFMailComposeContactsSearchController
- (MFMailComposeContactsSearchController)init;
- (MFMailComposeContactsSearchControllerDelegate)delegate;
- (NSNumber)taskID;
- (void)_cancelSearchAndNotify:(BOOL)a3;
- (void)_finishSearch;
- (void)_reset;
- (void)beganNetworkActivity;
- (void)cancelSearch;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)consumeCorecipientSearchResults:(id)a3 taskID:(id)a4;
- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4;
- (void)endedNetworkActivity;
- (void)findCorecipientsWithRecipients:(id)a3;
- (void)finishedSearchingForAutocompleteResults;
- (void)finishedSearchingForCorecipients;
- (void)finishedTaskWithID:(id)a3;
- (void)removeRecipient:(id)a3;
- (void)searchWithString:(id)a3;
- (void)searchWithString:(id)a3 enteredRecipients:(id)a4 title:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setTaskID:(id)a3;
@end

@implementation MFMailComposeContactsSearchController

- (MFMailComposeContactsSearchController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MFMailComposeContactsSearchController;
  v2 = [(MFMailComposeContactsSearchController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F5A110]) initWithAutocompleteSearchType:0];
    manager = v2->_manager;
    v2->_manager = (CNAutocompleteSearchManager *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    autocompleteSearchResults = v2->_autocompleteSearchResults;
    v2->_autocompleteSearchResults = v5;

    [(CNAutocompleteSearchManager *)v2->_manager setImplicitGroupCreationThreshold:2];
    [(CNAutocompleteSearchManager *)v2->_manager setIncludeUpcomingEventMembers:1];
  }
  return v2;
}

- (void)_reset
{
  [(NSMutableArray *)self->_autocompleteSearchResults removeAllObjects];
  corecipientSearchResults = self->_corecipientSearchResults;

  [(NSMutableArray *)corecipientSearchResults removeAllObjects];
}

- (void)searchWithString:(id)a3
{
}

- (void)searchWithString:(id)a3 enteredRecipients:(id)a4 title:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  [(MFMailComposeContactsSearchController *)self _cancelSearchAndNotify:0];
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"MFMailComposeContactsSearchControllerWillBeginSearch" object:self userInfo:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = [WeakRetained sendingAccountProxyForComposeContactsSearchController:self];
  manager = self->_manager;
  v14 = [v12 uniqueID];
  [(CNAutocompleteSearchManager *)manager setSendingAccountIdentifier:v14];

  uint64_t v15 = [WeakRetained addressableGroupResultStyleForComposeContactsSearchController:self];
  id v16 = objc_alloc_init(MEMORY[0x1E4F5A100]);
  [v16 setAddressableGroupResultStyle:v15];
  [(CNAutocompleteSearchManager *)self->_manager setSearchControllerOptions:v16];
  id v17 = objc_alloc_init(MEMORY[0x1E4F5A060]);
  v18 = [v8 arrayByApplyingSelector:sel_uncommentedAddress];
  [v17 setOtherAddressesAlreadyChosen:v18];

  [v17 setTitle:v9];
  v19 = [(CNAutocompleteSearchManager *)self->_manager searchForText:v20 withAutocompleteFetchContext:v17 consumer:self];
  [(MFMailComposeContactsSearchController *)self setTaskID:v19];
}

- (void)cancelSearch
{
}

- (void)_cancelSearchAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = self->_waitingOnSearchResultsCount != 0;
  if (self->_taskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_manager, "cancelTaskWithID:");
    [(MFMailComposeContactsSearchController *)self setTaskID:0];
    BOOL v5 = 1;
  }
  [(MFMailComposeContactsSearchController *)self _reset];
  self->_foundAnySearchResults = 0;
  if (v3 && v5)
  {
    [(MFMailComposeContactsSearchController *)self _finishSearch];
  }
}

- (void)findCorecipientsWithRecipients:(id)a3
{
  id v14 = a3;
  [(MFMailComposeContactsSearchController *)self _reset];
  if (self->_corecipientSearchTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_manager, "cancelTaskWithID:");
    corecipientSearchTaskID = self->_corecipientSearchTaskID;
    self->_corecipientSearchTaskID = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v14 count])
  {
    v6 = [WeakRetained sendingAccountProxyForComposeContactsSearchController:self];
    manager = self->_manager;
    id v8 = [v6 uniqueID];
    [(CNAutocompleteSearchManager *)manager setSendingAccountIdentifier:v8];

    uint64_t v9 = [WeakRetained addressableGroupResultStyleForComposeContactsSearchController:self];
    id v10 = objc_alloc_init(MEMORY[0x1E4F5A100]);
    [v10 setAddressableGroupResultStyle:v9];
    [(CNAutocompleteSearchManager *)self->_manager setSearchControllerOptions:v10];
    id v11 = objc_alloc_init(MEMORY[0x1E4F5A060]);
    [v11 setOtherAddressesAlreadyChosen:v14];
    v12 = [(CNAutocompleteSearchManager *)self->_manager searchForCorecipientsWithAutocompleteFetchContext:v11 consumer:self];
    v13 = self->_corecipientSearchTaskID;
    self->_corecipientSearchTaskID = v12;
  }
  else
  {
    [WeakRetained composeContactsSearchController:self didFindCorecipients:0];
  }
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeRecipient:(id)a3
{
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6 = a3;
  -[NSMutableArray addObjectsFromArray:](self->_autocompleteSearchResults, "addObjectsFromArray:");
  self->_foundAnySearchResults |= [(NSMutableArray *)self->_autocompleteSearchResults count] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeContactsSearchController:self didSortResults:self->_autocompleteSearchResults];
}

- (void)finishedSearchingForAutocompleteResults
{
  self->_foundAnySearchResults |= [(NSMutableArray *)self->_autocompleteSearchResults count] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeContactsSearchController:self didSortResults:self->_autocompleteSearchResults];

  [(MFMailComposeContactsSearchController *)self _finishSearch];
}

- (void)consumeCorecipientSearchResults:(id)a3 taskID:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  corecipientSearchResults = self->_corecipientSearchResults;
  if (!corecipientSearchResults)
  {
    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = self->_corecipientSearchResults;
    self->_corecipientSearchResults = v10;

    corecipientSearchResults = self->_corecipientSearchResults;
    id v7 = v13;
  }
  [(NSMutableArray *)corecipientSearchResults addObjectsFromArray:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeContactsSearchController:self didFindCorecipients:self->_corecipientSearchResults];
}

- (void)finishedSearchingForCorecipients
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeContactsSearchController:self didFindCorecipients:self->_corecipientSearchResults];

  [(MFMailComposeContactsSearchController *)self _finishSearch];
}

- (void)finishedTaskWithID:(id)a3
{
  BOOL v5 = (NSNumber *)a3;
  v4 = [(MFMailComposeContactsSearchController *)self taskID];

  if (v4 == v5)
  {
    [(MFMailComposeContactsSearchController *)self setTaskID:0];
    [(MFMailComposeContactsSearchController *)self _finishSearch];
  }
  else if (self->_corecipientSearchTaskID == v5)
  {
    self->_corecipientSearchTaskID = 0;
  }
}

- (void)_finishSearch
{
  if (!self->_waitingOnSearchResultsCount)
  {
    BOOL v3 = [(MFMailComposeContactsSearchController *)self taskID];

    if (!v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__MFMailComposeContactsSearchController__finishSearch__block_invoke;
      block[3] = &unk_1E5F79088;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 postNotificationName:@"MFMailComposeContactsSearchControllerDidEndSearch" object:self userInfo:0];
    }
  }
}

void __54__MFMailComposeContactsSearchController__finishSearch__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained composeContactsSearchController:*(void *)(a1 + 32) finishedWithResults:*(unsigned __int8 *)(*(void *)(a1 + 32) + 40)];
}

- (void)beganNetworkActivity
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 setNetworkActivityIndicatorVisible:1];
}

- (void)endedNetworkActivity
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 setNetworkActivityIndicatorVisible:0];
}

- (MFMailComposeContactsSearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailComposeContactsSearchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_corecipientSearchTaskID, 0);
  objc_storeStrong((id *)&self->_corecipientSearchResults, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end