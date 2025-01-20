@interface CKRecipientSearchListController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasSearchResults;
- (BOOL)isSearchResultsHidden;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldHideGroupsDonations;
- (BOOL)smsEnabled;
- (BOOL)suppressGroupSuggestions;
- (CKContactsSearchManager)searchManager;
- (CKRecipientSearchListController)initWithStyle:(int64_t)a3;
- (IDSBatchIDQueryController)statusQueryController;
- (IMAccount)defaultiMessageAccount;
- (NSArray)conversationCache;
- (NSArray)enteredRecipients;
- (NSArray)prefilteredRecipients;
- (NSArray)searchResults;
- (NSDate)idsQueryStartTime;
- (char)_serviceColorForRecipients:(id)a3;
- (id)_conversationList;
- (id)_statusQueryController;
- (int64_t)idsStatusForAddress:(id)a3;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)cancelSearch;
- (void)chatStateChanged:(id)a3;
- (void)contactsSearchManager:(id)a3 finishedSearchingWithResults:(id)a4;
- (void)dealloc;
- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4;
- (void)invalidateOutstandingIDStatusRequests;
- (void)invalidateSearchManager;
- (void)loadView;
- (void)removeRecipient:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchWithText:(id)a3;
- (void)setConversationCache:(id)a3;
- (void)setDefaultiMessageAccount:(id)a3;
- (void)setEnteredRecipients:(id)a3;
- (void)setIdsQueryStartTime:(id)a3;
- (void)setPrefilteredRecipients:(id)a3;
- (void)setSearchManager:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setShouldHideGroupsDonations:(BOOL)a3;
- (void)setSmsEnabled:(BOOL)a3;
- (void)setStatusQueryController:(id)a3;
- (void)setSuppressGroupSuggestions:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidAppearDeferredSetup;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKRecipientSearchListController

- (void)dealloc
{
  [(CKContactsSearchManager *)self->_searchManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSearchListController;
  [(CKRecipientSearchListController *)&v3 dealloc];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)CKRecipientSearchListController;
  [(CKRecipientSearchListController *)&v4 loadView];
  objc_super v3 = [(CKRecipientSearchListController *)self tableView];
  [v3 setAutoresizingMask:18];
  [v3 setOpaque:0];
  [v3 setScrollsToTop:0];
  [v3 setLayoutMarginsFollowReadableWidth:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKRecipientSearchListController;
  id v4 = a3;
  [(CNAutocompleteResultsTableViewController *)&v11 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v11.receiver, v11.super_class);
  double v6 = v5;

  v7 = [(CKRecipientSearchListController *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  if (v6 != v9)
  {
    v10 = [(CKRecipientSearchListController *)self tableView];
    [v10 reloadData];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKRecipientSearchListController;
  [(CKRecipientSearchListController *)&v16 viewWillAppear:a3];
  id v4 = [(CKRecipientSearchListController *)self tableView];
  double v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [v5 theme];
  v7 = [v6 searchResultsBackgroundColor];

  if (v7)
  {
    [v4 setBackgroundColor:v7];
    [v4 setTableHeaderBackgroundColor:v7];
    id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [v4 bounds];
    double v9 = objc_msgSend(v8, "initWithFrame:");
    [v4 setBackgroundView:v9];
  }
  v10 = +[CKUIBehavior sharedBehaviors];
  objc_super v11 = [v10 theme];
  v12 = [v11 searchResultsSeperatorColor];

  if (v12)
  {
    v13 = +[CKUIBehavior sharedBehaviors];
    v14 = [v13 theme];
    v15 = [v14 searchResultsSeperatorColor];
    [v4 setSeparatorColor:v15];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKRecipientSearchListController;
  [(CKRecipientSearchListController *)&v4 viewDidAppear:a3];
  [(CKRecipientSearchListController *)self performSelector:sel_viewDidAppearDeferredSetup withObject:0 afterDelay:0.0];
}

- (void)viewDidAppearDeferredSetup
{
  id v3 = [(CKRecipientSearchListController *)self conversationCache];
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_chatStateChanged_ name:@"CKConversationJoinStateDidChangeNotification" object:0];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_chatStateChanged_ name:*MEMORY[0x1E4F6B898] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_chatStateChanged_ name:@"CKConversationListFinishedLoadingNotification" object:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CKRecipientSearchListController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKRecipientSearchListController;
  id v3 = [(CNAutocompleteResultsTableViewController *)&v7 initWithStyle:a3];
  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    double v5 = objc_msgSend(v4, "__ck_bestAccountForAddresses:", 0);

    [(CKRecipientSearchListController *)v3 setDefaultiMessageAccount:v5];
  }
  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(CNAutocompleteResultsTableViewController *)self delegate];
  [v4 searchListControllerDidScroll:self];
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return ![(CKRecipientSearchListController *)self isSearchResultsHidden];
}

- (void)contactsSearchManager:(id)a3 finishedSearchingWithResults:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v29 = a4;
  double v5 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v5 startTimingForKey:@"MessageUI"];

  [(CKRecipientSearchListController *)self setSearchResults:v29];
  v28 = [(CKRecipientSearchListController *)self _statusQueryController];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  objc_super v7 = [(CKRecipientSearchListController *)self searchResults];
  id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v9 = [(CKRecipientSearchListController *)self searchResults];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "isGroup", v27) & 1) == 0
          && ([v13 children],
              v14 = objc_claimAutoreleasedReturnValue(),
              BOOL v15 = [v14 count] == 0,
              v14,
              v15))
        {
          v37 = v13;
          objc_super v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        }
        else
        {
          objc_super v16 = [v13 children];
        }
        v17 = v16;
        v18 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &__block_literal_global_7);
        [v8 addObjectsFromArray:v18];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v19 = [v9 countByEnumeratingWithState:&v31 objects:v38 count:16];
      uint64_t v10 = v19;
    }
    while (v19);
  }

  v20 = [(CKRecipientSearchListController *)self searchResults];
  [(CNAutocompleteResultsTableViewController *)self setRecipients:v20];

  v21 = [MEMORY[0x1E4F1C9C8] date];
  [(CKRecipientSearchListController *)self setIdsQueryStartTime:v21];

  [v28 setDestinations:v8];
  v22 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v22 stopTimingForKey:@"MessageUI"];

  v23 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v23 stopTimingForKey:@"Total"];

  [MEMORY[0x1E4F6C3F8] logTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [MEMORY[0x1E4F6C3F8] invalidateGlobalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  v24 = [(CNAutocompleteResultsTableViewController *)self delegate];
  [v24 searchListControllerDidFinishSearch:self];

  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
      *(_DWORD *)buf = 138412290;
      v36 = v26;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Search finished. Duration: %@", buf, 0xCu);
    }
  }
}

uint64_t __86__CKRecipientSearchListController_contactsSearchManager_finishedSearchingWithResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 IDSCanonicalAddress];
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(CNAutocompleteResultsTableViewController *)self delegate];
  [(id)v14 searchListController:self destinationsUpdated:v11];

  LOBYTE(v14) = [(CKRecipientSearchListController *)self isSearchResultsHidden];
  int v15 = IMOSLoggingEnabled();
  if (v14)
  {
    if (v15)
    {
      objc_super v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Received IDS results while search is hidden. IDS destinatios to update: %@", buf, 0xCu);
      }
    }
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"CKIDSResultsFinishedWhenSearchTableIsHiddenNotification" object:0];
  }
  else
  {
    if (v15)
    {
      CKLogCStringForType(19);
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Received batch IDS Query results in recipient list: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      id v19 = v11;
      _CKLogExternal();
    }
    [(CNAutocompleteResultsTableViewController *)self invalidateAddressTintColors];
    [(CNAutocompleteResultsTableViewController *)self invalidatePreferredRecipients];
  }
}

- (void)chatStateChanged:(id)a3
{
  [(CKRecipientSearchListController *)self setConversationCache:0];
  id v4 = [(CKRecipientSearchListController *)self conversationCache];
}

- (void)searchWithText:(id)a3
{
  id v4 = a3;
  if (!CKIsScreenLocked())
  {
    id v6 = [(CKRecipientSearchListController *)self searchManager];
    objc_super v7 = [(CKRecipientSearchListController *)self enteredRecipients];
    id v8 = [(CKRecipientSearchListController *)self prefilteredRecipients];
    double v9 = [v7 arrayByAddingObjectsFromArray:v8];
    [v6 setEnteredRecipients:v9];

    double v5 = [(CKRecipientSearchListController *)self searchManager];
    [v5 searchWithText:v4];
LABEL_6:

    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Asked to search while device is locked, bailing", v10, 2u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)hasSearchResults
{
  v2 = [(CKRecipientSearchListController *)self searchResults];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isSearchResultsHidden
{
  int v3 = [(CKRecipientSearchListController *)self isViewLoaded];
  if (v3)
  {
    id v4 = [(CKRecipientSearchListController *)self tableView];
    char v5 = [v4 isHidden];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)invalidateOutstandingIDStatusRequests
{
  statusQueryController = self->_statusQueryController;
  if (statusQueryController)
  {
    [(IDSBatchIDQueryController *)statusQueryController invalidate];
    id v4 = self->_statusQueryController;
    self->_statusQueryController = 0;
  }
}

- (void)cancelSearch
{
  id v2 = [(CKRecipientSearchListController *)self searchManager];
  [v2 cancelSearch];
}

- (void)invalidateSearchManager
{
  [(CKContactsSearchManager *)self->_searchManager setDelegate:0];

  [(CKRecipientSearchListController *)self setSearchManager:0];
}

- (BOOL)suppressGroupSuggestions
{
  id v2 = [(CKRecipientSearchListController *)self searchManager];
  char v3 = [v2 suppressGroupSuggestions];

  return v3;
}

- (void)setSuppressGroupSuggestions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKRecipientSearchListController *)self searchManager];
  [v4 setSuppressGroupSuggestions:v3];
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CKRecipientSearchListController *)self searchManager];
  [v7 didSelectRecipient:v6 atIndex:a4];
}

- (void)removeRecipient:(id)a3
{
  id v4 = a3;
  [(CNAutocompleteResultsTableViewController *)self invalidateSearchResultRecipient:v4];
  id v5 = [(CKRecipientSearchListController *)self searchManager];
  [v5 removeRecipient:v4];
}

- (CKContactsSearchManager)searchManager
{
  searchManager = self->_searchManager;
  if (!searchManager)
  {
    id v4 = objc_alloc_init(CKContactsSearchManager);
    id v5 = self->_searchManager;
    self->_searchManager = v4;

    [(CKContactsSearchManager *)self->_searchManager setDelegate:self];
    [(CKRecipientSearchListController *)self setShouldHideGroupsDonations:0];
    searchManager = self->_searchManager;
  }

  return searchManager;
}

- (NSArray)conversationCache
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  conversationCache = self->_conversationCache;
  if (!conversationCache)
  {
    uint64_t v28 = 1176;
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v29 = self;
    id v4 = [(CKRecipientSearchListController *)self _conversationList];
    id v5 = [v4 conversations];

    id obj = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v40;
      uint64_t v30 = *(void *)v40;
      do
      {
        uint64_t v9 = 0;
        uint64_t v32 = v7;
        do
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v39 + 1) + 8 * v9);
          if (((objc_msgSend(v10, "isGroupConversation", v28) & 1) != 0
             || [v10 isBusinessConversation])
            && ([v10 hasLeft] & 1) == 0)
          {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v12 = [v10 chat];
            id v13 = [v12 guid];
            uint64_t v14 = [v13 copy];

            long long v34 = (void *)v14;
            [v11 setObject:v14 forKey:@"CKConversationGUIDKey"];
            int v15 = [v10 displayName];
            objc_super v16 = (void *)[v15 copy];

            if ([v16 length]) {
              [v11 setObject:v16 forKey:@"CKConversationDisplayNameKey"];
            }
            v17 = [MEMORY[0x1E4F1CA48] array];
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            v18 = [v10 chat];
            id v19 = [v18 participants];

            uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v36 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = [*(id *)(*((void *)&v35 + 1) + 8 * i) name];
                  v25 = (void *)[v24 copy];

                  [v17 addObject:v25];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v21);
            }

            [v11 setObject:v17 forKey:@"CKConversationEntityNamesKey"];
            [v31 addObject:v11];

            uint64_t v8 = v30;
            uint64_t v7 = v32;
          }
          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v7);
    }

    v26 = *(Class *)((char *)&v29->super.super.super.super.super.isa + v28);
    *(Class *)((char *)&v29->super.super.super.super.super.isa + v28) = (Class)v31;

    conversationCache = *(NSArray **)((char *)&v29->super.super.super.super.super.isa + v28);
  }

  return conversationCache;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (id)_statusQueryController
{
  statusQueryController = self->_statusQueryController;
  if (!statusQueryController)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6AAD8]);
    id v5 = (IDSBatchIDQueryController *)[v4 initWithService:*MEMORY[0x1E4F6AA78] delegate:self queue:MEMORY[0x1E4F14428]];
    uint64_t v6 = self->_statusQueryController;
    self->_statusQueryController = v5;

    statusQueryController = self->_statusQueryController;
  }

  return statusQueryController;
}

- (char)_serviceColorForRecipients:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = -1;
  if ([v4 isGroup])
  {
    [v4 children];
  }
  else
  {
    v36[0] = v4;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v5 = };
  uint64_t v6 = objc_msgSend(v5, "__imArrayByApplyingBlock:", &__block_literal_global_155_0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_2;
  v27[3] = &unk_1E5620C90;
  v27[4] = self;
  v27[5] = &v28;
  [v6 enumerateObjectsUsingBlock:v27];
  if (*((unsigned __int8 *)v29 + 24) == 255 && [(CKRecipientSearchListController *)self smsEnabled])
  {
    uint64_t v7 = +[CKConversationList sharedConversationList];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_3;
    v24 = &unk_1E5621500;
    v25 = self;
    id v9 = v8;
    id v26 = v9;
    [v5 enumerateObjectsUsingBlock:&v21];
    id v10 = [v7 conversationForHandles:v9 displayName:0 joinedChatsOnly:1 create:0];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 sendingService];
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(19);
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v33 = v9;
          __int16 v34 = 2112;
          long long v35 = v12;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Updating service color in recipient search list for handles: %@, with service: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      {
        id v19 = v9;
        uint64_t v20 = v12;
        _CKLogExternal();
      }
      char v14 = objc_msgSend(v12, "__ck_displayColor", v19, v20, v21, v22, v23, v24, v25);
      *((unsigned char *)v29 + 24) = v14;
      int v15 = [v9 firstObject];
      int v16 = [v15 isBusiness];

      if (v16) {
        *((unsigned char *)v29 + 24) = 6;
      }
    }
  }
  char v17 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v17;
}

uint64_t __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke(uint64_t a1, void *a2)
{
  return [a2 IDSCanonicalAddress];
}

void __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v7 = [v6 searchListController:*(void *)(a1 + 32) idStatusForIDSID:v11];

  if (v7 == 1)
  {
    uint64_t v8 = [MEMORY[0x1E4F6BDB8] iMessageService];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "__ck_displayColor");

    int v9 = MEMORY[0x192FBA6A0](v11);
    id v10 = v11;
    if (v9) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 6;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    *a4 = 1;
    id v10 = v11;
  }
}

void __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 defaultiMessageAccount];
  uint64_t v6 = [v4 rawAddress];

  uint64_t v7 = IMStripFormattingFromAddress();
  id v9 = [v5 imHandleWithID:v7 alreadyCanonical:0];

  uint64_t v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 40) addObject:v9];
    uint64_t v8 = v9;
  }
}

- (int64_t)idsStatusForAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteResultsTableViewController *)self delegate];
  int64_t v6 = [v5 searchListController:self idStatusForIDSID:v4];

  return v6;
}

- (BOOL)shouldHideGroupsDonations
{
  return self->shouldHideGroupsDonations;
}

- (void)setShouldHideGroupsDonations:(BOOL)a3
{
  self->shouldHideGroupsDonations = a3;
}

- (NSArray)enteredRecipients
{
  return self->_enteredRecipients;
}

- (void)setEnteredRecipients:(id)a3
{
}

- (NSArray)prefilteredRecipients
{
  return self->_prefilteredRecipients;
}

- (void)setPrefilteredRecipients:(id)a3
{
}

- (BOOL)smsEnabled
{
  return self->_smsEnabled;
}

- (void)setSmsEnabled:(BOOL)a3
{
  self->_smsEnabled = a3;
}

- (IMAccount)defaultiMessageAccount
{
  return self->_defaultiMessageAccount;
}

- (void)setDefaultiMessageAccount:(id)a3
{
}

- (IDSBatchIDQueryController)statusQueryController
{
  return self->_statusQueryController;
}

- (void)setStatusQueryController:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (void)setSearchManager:(id)a3
{
}

- (NSDate)idsQueryStartTime
{
  return self->_idsQueryStartTime;
}

- (void)setIdsQueryStartTime:(id)a3
{
}

- (void)setConversationCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationCache, 0);
  objc_storeStrong((id *)&self->_idsQueryStartTime, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_statusQueryController, 0);
  objc_storeStrong((id *)&self->_defaultiMessageAccount, 0);
  objc_storeStrong((id *)&self->_prefilteredRecipients, 0);

  objc_storeStrong((id *)&self->_enteredRecipients, 0);
}

@end