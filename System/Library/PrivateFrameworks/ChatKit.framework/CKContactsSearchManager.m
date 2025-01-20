@interface CKContactsSearchManager
- (BOOL)biasForOutgoingInteraction;
- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4;
- (BOOL)isMAIDGroupsEnabled;
- (BOOL)shouldIncludeGroupInResults:(id)a3;
- (BOOL)suppressGroupSuggestions;
- (BOOL)zkwGroupSuggestionsEnabled;
- (CKContactsSearchManager)init;
- (CKContactsSearchManagerDelegate)delegate;
- (CNAutocompleteSearchManager)searchManager;
- (NSArray)enteredRecipients;
- (NSCharacterSet)emojiCharacterSet;
- (NSMutableArray)searchResults;
- (NSNumber)currentSearchTaskID;
- (NSString)searchText;
- (_NSRange)_rangeForSearchTerm:(id)a3 inTarget:(id)a4 tokenizedByCharacterSet:(id)a5;
- (id)_cullOldResults:(id)a3;
- (id)_filterGroupResults:(id)a3;
- (id)_sortResultsByDate:(id)a3;
- (id)_sortSearchResultsWithCoreRecentsResults:(id)a3 displayNameMatches:(id)a4 participantNameMatches:(id)a5;
- (id)createAutocompelteGroupMembersFromParticipants:(id)a3;
- (id)matchingConversationWithGuid:(id)a3;
- (id)nameGroupSearchResults;
- (id)participantMatchGroupResults;
- (id)participantMatchResultsForSearchTerm:(id)a3;
- (id)zkwGroupSuggestions;
- (void)beganNetworkActivity;
- (void)cancelSearch;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)dealloc;
- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4;
- (void)endedNetworkActivity;
- (void)finishedSearchingForAutocompleteResults;
- (void)removeRecipient:(id)a3;
- (void)searchWithText:(id)a3;
- (void)setBiasForOutgoingInteraction:(BOOL)a3;
- (void)setCurrentSearchTaskID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmojiCharacterSet:(id)a3;
- (void)setEnteredRecipients:(id)a3;
- (void)setSearchManager:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSuppressGroupSuggestions:(BOOL)a3;
- (void)setZkwGroupSuggestionsEnabled:(BOOL)a3;
@end

@implementation CKContactsSearchManager

- (BOOL)isMAIDGroupsEnabled
{
  return MEMORY[0x1F4124070](self, a2);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Finished new compose contacts search.", buf, 2u);
    }
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)CKContactsSearchManager;
  [(CKContactsSearchManager *)&v5 dealloc];
}

- (CKContactsSearchManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)CKContactsSearchManager;
  v2 = [(CKContactsSearchManager *)&v11 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Starting new compose contacts search.", v10, 2u);
      }
    }
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F5A110]) initWithAutocompleteSearchType:1];
    searchManager = v2->_searchManager;
    v2->_searchManager = (CNAutocompleteSearchManager *)v4;

    v6 = sel_setFetchDelegate_;
    char v7 = objc_opt_respondsToSelector();
    v8 = v2->_searchManager;
    if ((v7 & 1) == 0)
    {
      v6 = sel_setSupplementalGroupResultsDelegate_;
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_10:
        [(CNAutocompleteSearchManager *)v2->_searchManager setImplicitGroupCreationThreshold:1];
        [(CNAutocompleteSearchManager *)v2->_searchManager setShouldIncludeGroupResults:1];
        return v2;
      }
      v8 = v2->_searchManager;
    }
    [(CNAutocompleteSearchManager *)v8 performSelector:v6 withObject:v2];
    goto LABEL_10;
  }
  return v2;
}

- (void)searchWithText:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKContactsSearchManager *)self cancelSearch];
  objc_super v5 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v5 startTimingForKey:@"Total"];

  v6 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v6 startTimingForKey:@"ContactSearchAutocomplete"];

  char v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  searchResults = self->_searchResults;
  self->_searchResults = v7;

  v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v5) = [v9 stewieEnabled];

  if (v5) {
    uint64_t v10 = 55;
  }
  else {
    uint64_t v10 = 23;
  }
  v36 = v4;
  [(CKContactsSearchManager *)self setSearchText:v4];
  objc_super v11 = [(CKContactsSearchManager *)self searchManager];
  [v11 setSearchTypes:v10];

  v12 = (objc_class *)MEMORY[0x192FBA860](@"CNAutocompleteFetchContext", @"Contacts");
  if (v12) {
    id v34 = objc_alloc_init(v12);
  }
  else {
    id v34 = 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v35 = self;
  obuint64_t j = [(CKContactsSearchManager *)self enteredRecipients];
  uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "address", v34);

        if (v19)
        {
          v20 = [v18 address];
          [v13 addObject:v20];
        }
        if ([v18 isGroup])
        {
          v21 = [v18 children];

          if (v21)
          {
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            v22 = [v18 children];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v39;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v39 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                  v28 = [v27 address];

                  if (v28)
                  {
                    v29 = [v27 address];
                    [v13 addObject:v29];
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
              }
              while (v24);
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v15);
  }

  v30 = v34;
  [v34 setOtherAddressesAlreadyChosen:v13];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v34, "setPredictsBasedOnOutgoingInteraction:", -[CKContactsSearchManager biasForOutgoingInteraction](v35, "biasForOutgoingInteraction"));
  }
  v31 = objc_msgSend(MEMORY[0x1E4F6C3F8], "globalTimingCollectionForKey:", @"CKAutocompleteTimingKey", v34);
  [v31 startTimingForKey:@"RemoteSearch"];

  v32 = [(CKContactsSearchManager *)v35 searchManager];
  v33 = [v32 searchForText:v36 withAutocompleteFetchContext:v30 consumer:v35];
  [(CKContactsSearchManager *)v35 setCurrentSearchTaskID:v33];
}

- (void)cancelSearch
{
  [MEMORY[0x1E4F6C3F8] invalidateGlobalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  v3 = [(CKContactsSearchManager *)self currentSearchTaskID];

  if (v3)
  {
    id v4 = [(CKContactsSearchManager *)self searchManager];
    objc_super v5 = [(CKContactsSearchManager *)self currentSearchTaskID];
    [v4 cancelTaskWithID:v5];

    [(CKContactsSearchManager *)self setCurrentSearchTaskID:0];
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_130);
  }

  [(CKContactsSearchManager *)self setSearchText:0];
}

uint64_t __39__CKContactsSearchManager_cancelSearch__block_invoke()
{
  return [(id)*MEMORY[0x1E4F43630] setNetworkActivityIndicatorVisible:0];
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CKContactsSearchManager *)self searchManager];
  [v7 didSelectRecipient:v6 atIndex:a4];
}

- (void)removeRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(CKContactsSearchManager *)self searchManager];
  [v5 removeRecipientResult:v4];
}

- (id)_sortSearchResultsWithCoreRecentsResults:(id)a3 displayNameMatches:(id)a4 participantNameMatches:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a4;
  id v30 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v12 + v11;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        char v17 = objc_msgSend(v16, "sourceType", v30);
        char v18 = [v16 sourceType];
        uint64_t v19 = [v16 sourceType];
        if ((v18 & 1) == 0 && (v17 & 0x10) == 0 && v19 != 0)
        {
          uint64_t v15 = v12 + v14;
          goto LABEL_16;
        }
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v12 = v15;
    }
    while (v11);
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_16:

  v21 = [(CKContactsSearchManager *)self _cullOldResults:v31];
  v22 = v30;
  uint64_t v23 = [(CKContactsSearchManager *)self _cullOldResults:v30];
  uint64_t v24 = [(CKContactsSearchManager *)self _sortResultsByDate:v21];
  uint64_t v25 = [(CKContactsSearchManager *)self _sortResultsByDate:v23];
  [v24 addObjectsFromArray:v25];

  if ((unint64_t)[v24 count] >= 9)
  {
    v26 = objc_msgSend(v24, "subarrayWithRange:", 0, 8);
    uint64_t v27 = [v26 mutableCopy];

    uint64_t v24 = (void *)v27;
  }
  v28 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v15, objc_msgSend(v24, "count", v30));
  [v9 insertObjects:v24 atIndexes:v28];

  return v9;
}

- (id)_sortResultsByDate:(id)a3
{
  v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_114_2];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

uint64_t __46__CKContactsSearchManager__sortResultsByDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 lastMessageDate];
  id v6 = [v4 lastMessageDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_cullOldResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 lastMessageDate];

        if (v10)
        {
          uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          uint64_t v12 = [v9 lastMessageDate];
          uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v14 = [v11 components:24 fromDate:v12 toDate:v13 options:0];

          if ((unint64_t)[v14 month] <= 2) {
            [v16 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v16;
}

- (id)_filterGroupResults:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__CKContactsSearchManager__filterGroupResults___block_invoke;
  v5[3] = &unk_1E56286C8;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "__imArrayByFilteringWithBlock:", v5);

  return v3;
}

uint64_t __47__CKContactsSearchManager__filterGroupResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isMAIDGroupsEnabled]
    && (__int16 v4 = [v3 sourceType], objc_msgSend(v3, "isGroup"))
    && (v4 & 0x100) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    char v6 = [v3 sourceType];
    unsigned int v7 = [v3 isGroup] ^ 1;
    if (v6) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 1;
    }
  }

  return v5;
}

- (NSCharacterSet)emojiCharacterSet
{
  emojiCharacterSet = self->_emojiCharacterSet;
  if (!emojiCharacterSet)
  {
    __int16 v4 = (NSCharacterSet *)CEMCreateEmojiCharacterSet();
    uint64_t v5 = self->_emojiCharacterSet;
    self->_emojiCharacterSet = v4;

    emojiCharacterSet = self->_emojiCharacterSet;
  }

  return emojiCharacterSet;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v8 stopTimingForKey:@"RemoteSearch"];

  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
      int v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Finished remote group search in %@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v11 = [(CKContactsSearchManager *)self _filterGroupResults:v6];
  uint64_t v12 = [(CKContactsSearchManager *)self searchResults];
  [v12 addObjectsFromArray:v11];
}

- (void)finishedSearchingForAutocompleteResults
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = [(CKContactsSearchManager *)self searchResults];
  id v3 = self;
  if ([(CKContactsSearchManager *)self suppressGroupSuggestions])
  {
    __int16 v4 = [(CKContactsSearchManager *)self searchResults];
    uint64_t v5 = objc_msgSend(v4, "__imArrayByApplyingBlock:", &__block_literal_global_120_1);

    id v6 = (void *)v5;
    id v3 = self;
  }
  else
  {
    id v6 = v2;
  }
  uint64_t v27 = v6;
  uint64_t v25 = (void *)[v6 mutableCopy];
  id v7 = [(CKContactsSearchManager *)v3 enteredRecipients];
  id v8 = (void *)[v7 copy];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v8;
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v11 = v27;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v32;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              if (([v15 isGroup] & 1) == 0)
              {
                id v16 = [v15 IDSCanonicalAddress];
                long long v17 = [v10 IDSCanonicalAddress];
                int v18 = [v16 isEqualToIgnoringCase:v17];

                if (v18)
                {
                  [v25 removeObject:v15];
                  goto LABEL_20;
                }
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_20:
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v28);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CKContactsSearchManager_finishedSearchingForAutocompleteResults__block_invoke_2;
  block[3] = &unk_1E5620AF8;
  block[4] = self;
  id v19 = v25;
  id v30 = v19;
  dispatch_async(MEMORY[0x1E4F14428], block);
  long long v20 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v20 stopTimingForKey:@"ContactSearchAutocomplete"];

  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
      *(_DWORD *)buf = 138412290;
      long long v40 = v22;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Finished searching in %@", buf, 0xCu);
    }
  }
}

id __66__CKContactsSearchManager_finishedSearchingForAutocompleteResults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isGroup]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

void __66__CKContactsSearchManager_finishedSearchingForAutocompleteResults__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)[*(id *)(a1 + 40) copy];
  [v4 contactsSearchManager:v2 finishedSearchingWithResults:v3];
}

- (_NSRange)_rangeForSearchTerm:(id)a3 inTarget:(id)a4 tokenizedByCharacterSet:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v7 = a4;
  [v7 componentsSeparatedByCharactersInSet:a5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
  {
    uint64_t v11 = v9;
    id v28 = v8;
    NSUInteger v29 = 0;
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v16 = [v14 stringByTrimmingCharactersInSet:v15];

        uint64_t v17 = [v7 rangeOfString:v16];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v19 = v17;
          if (v17 + v18 <= (unint64_t)[v7 length])
          {
            long long v20 = objc_msgSend(v7, "substringWithRange:", v19, objc_msgSend(v7, "length") - v19);
            v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            uint64_t v22 = [v20 stringByTrimmingCharactersInSet:v21];
            uint64_t v23 = [v22 rangeOfString:v30 options:393];
            NSUInteger v29 = v24;

            if (v23 != 0x7FFFFFFFFFFFFFFFLL)
            {

              uint64_t v10 = v23;
              id v8 = v28;
              goto LABEL_14;
            }
            id v8 = v28;
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
    NSUInteger v25 = v29;
  }
  else
  {
    NSUInteger v25 = 0;
  }

  NSUInteger v26 = v10;
  NSUInteger v27 = v25;
  result.length = v27;
  result.location = v26;
  return result;
}

- (void)beganNetworkActivity
{
}

- (void)endedNetworkActivity
{
}

- (id)nameGroupSearchResults
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v2 startTimingForKey:@"ContactSearchAutocomplete - Group Name Search"];

  id v38 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = [(CKContactsSearchManager *)self searchText];
  id v3 = [(CKContactsSearchManager *)self delegate];
  id v4 = [v3 conversationCacheForContactsSearchManager:self];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v4;
  uint64_t v42 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v7 = [v6 objectForKey:@"CKConversationDisplayNameKey"];
        if (v7) {
          BOOL v8 = v44 != 0;
        }
        else {
          BOOL v8 = 0;
        }
        if (v8)
        {
          uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          uint64_t v10 = [(CKContactsSearchManager *)self _rangeForSearchTerm:v44 inTarget:v7 tokenizedByCharacterSet:v9];

          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_14;
          }
          uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          uint64_t v12 = (void *)[v11 mutableCopy];

          uint64_t v13 = [(CKContactsSearchManager *)self emojiCharacterSet];
          [v12 formUnionWithCharacterSet:v13];

          uint64_t v14 = [(CKContactsSearchManager *)self _rangeForSearchTerm:v44 inTarget:v7 tokenizedByCharacterSet:v12];
          if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_14;
          }
          uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          id v16 = [v44 stringByTrimmingCharactersInSet:v15];
          uint64_t v17 = [(CKContactsSearchManager *)self emojiCharacterSet];
          int v18 = objc_msgSend(v16, "__ck_containsOnlyCharactersFromSet:", v17);

          if (v18)
          {
            if ([v7 rangeOfString:v44 options:385] != 0x7FFFFFFFFFFFFFFFLL)
            {
LABEL_14:
              uint64_t v19 = [v6 objectForKey:@"CKConversationGUIDKey"];
              long long v20 = [(CKContactsSearchManager *)self matchingConversationWithGuid:v19];
              v21 = v20;
              if (v20)
              {
                uint64_t v22 = [v20 chat];
                uint64_t v23 = [v22 lastFinishedMessageDate];
                BOOL v24 = [(CKContactsSearchManager *)self shouldIncludeGroupInResults:v23];

                if (v24)
                {
                  id v25 = objc_alloc(MEMORY[0x1E4F5A118]);
                  long long v39 = [v21 chat];
                  NSUInteger v26 = [v39 guid];
                  NSUInteger v27 = [v21 displayName];
                  id v28 = [v21 chat];
                  NSUInteger v29 = [v28 participants];
                  id v30 = [(CKContactsSearchManager *)self createAutocompelteGroupMembersFromParticipants:v29];
                  long long v31 = (void *)[v25 initWithIdentifier:v26 title:v27 members:v30];

                  [v38 addObject:v31];
                }
              }
            }
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v42);
  }

  long long v32 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v32 stopTimingForKey:@"ContactSearchAutocomplete - Group Name Search"];

  if (IMOSLoggingEnabled())
  {
    long long v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      long long v34 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
      *(_DWORD *)buf = 138412290;
      v50 = v34;
      _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Finished group name search in %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = [v38 count];
      *(_DWORD *)buf = 138412802;
      v50 = v44;
      __int16 v51 = 2048;
      uint64_t v52 = v36;
      __int16 v53 = 2112;
      id v54 = v38;
      _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Group name search for text: %@ found %ld results. Results: %@", buf, 0x20u);
    }
  }

  return v38;
}

- (id)zkwGroupSuggestions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v2 startTimingForKey:@"ContactSearchAutocomplete - ZKW Group Search"];

  id v28 = [MEMORY[0x1E4F1CA48] array];
  if ([(CKContactsSearchManager *)self zkwGroupSuggestionsEnabled])
  {
    id v3 = [(CKContactsSearchManager *)self searchText];
    int v4 = [v3 isEqualToString:&stru_1EDE4CA38];

    if (v4)
    {
      uint64_t v5 = [(CKContactsSearchManager *)self delegate];
      id v6 = [v5 conversationCacheForContactsSearchManager:self];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      obuint64_t j = v6;
      uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v31)
      {
        uint64_t v30 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v34 != v30) {
              objc_enumerationMutation(obj);
            }
            BOOL v8 = [*(id *)(*((void *)&v33 + 1) + 8 * i) objectForKey:@"CKConversationGUIDKey"];
            uint64_t v9 = [(CKContactsSearchManager *)self matchingConversationWithGuid:v8];
            uint64_t v10 = v9;
            if (v9)
            {
              uint64_t v11 = [v9 chat];
              uint64_t v12 = [v11 lastFinishedMessageDate];
              BOOL v13 = [(CKContactsSearchManager *)self shouldIncludeGroupInResults:v12];

              if (v13)
              {
                id v14 = objc_alloc(MEMORY[0x1E4F5A118]);
                uint64_t v15 = [v10 chat];
                id v16 = [v15 guid];
                uint64_t v17 = [v10 displayName];
                int v18 = [v10 chat];
                uint64_t v19 = [v18 participants];
                long long v20 = [(CKContactsSearchManager *)self createAutocompelteGroupMembersFromParticipants:v19];
                v21 = (void *)[v14 initWithIdentifier:v16 title:v17 members:v20];

                [v28 addObject:v21];
              }
            }
          }
          uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v31);
      }
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v22 stopTimingForKey:@"ContactSearchAutocomplete - ZKW Group Search"];

  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      BOOL v24 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = (uint64_t)v24;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Finished ZKW group search in %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v28 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v38 = v26;
      __int16 v39 = 2112;
      id v40 = v28;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Group ZKW search for found %ld results. Results: %@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)matchingConversationWithGuid:(id)a3
{
  id v3 = a3;
  int v4 = +[CKConversationList sharedConversationList];
  uint64_t v5 = [v4 conversationForExistingChatWithGUID:v3];

  return v5;
}

- (BOOL)shouldIncludeGroupInResults:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 components:24 fromDate:v4 toDate:v6 options:0];

  LOBYTE(v4) = (unint64_t)[v7 month] < 3;
  return (char)v4;
}

- (id)participantMatchGroupResults
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v3 startTimingForKey:@"ContactSearchAutocomplete - Group Participant Match Group Search"];

  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(CKContactsSearchManager *)self searchText];
  if (v5)
  {
    uint64_t v6 = [(CKContactsSearchManager *)self participantMatchResultsForSearchTerm:v5];

    id v4 = (void *)v6;
  }
  id v7 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
  [v7 stopTimingForKey:@"ContactSearchAutocomplete - Group Participant Match Group  Search"];

  if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKAutocompleteTimingKey"];
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Finished group participant match search in %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v4 count];
      int v13 = 138412802;
      id v14 = v5;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      int v18 = v4;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Participant Match for search text: %@ found %ld results. Results: %@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v4;
}

- (id)participantMatchResultsForSearchTerm:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v29 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(CKContactsSearchManager *)self delegate];
  long long v33 = self;
  uint64_t v6 = [v5 conversationCacheForContactsSearchManager:self];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v6;
  uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v7;
        BOOL v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        uint64_t v9 = [v8 objectForKey:@"CKConversationEntityNamesKey"];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v34 = v9;
        uint64_t v10 = [v34 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v36;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v34);
              }
              if ([*(id *)(*((void *)&v35 + 1) + 8 * i) rangeOfString:v4 options:393] != 0x7FFFFFFFFFFFFFFFLL)
              {
                id v14 = [v8 objectForKey:@"CKConversationGUIDKey"];
                __int16 v15 = [(CKContactsSearchManager *)v33 matchingConversationWithGuid:v14];
                uint64_t v16 = [v15 chat];
                __int16 v17 = [v16 lastFinishedMessageDate];
                BOOL v18 = [(CKContactsSearchManager *)v33 shouldIncludeGroupInResults:v17];

                if (v18)
                {
                  id v19 = objc_alloc(MEMORY[0x1E4F5A118]);
                  long long v20 = [v15 chat];
                  v21 = [v20 guid];
                  uint64_t v22 = [v15 displayName];
                  uint64_t v23 = [v15 chat];
                  BOOL v24 = [v23 participants];
                  id v25 = [(CKContactsSearchManager *)v33 createAutocompelteGroupMembersFromParticipants:v24];
                  uint64_t v26 = (void *)[v19 initWithIdentifier:v21 title:v22 members:v25];

                  [v29 addObject:v26];
                  goto LABEL_18;
                }
              }
            }
            uint64_t v11 = [v34 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_18:

        uint64_t v7 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v31);
  }

  return v29;
}

- (id)createAutocompelteGroupMembersFromParticipants:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "ID", (void)v24);
        char v12 = MEMORY[0x192FBA6E0]();

        if (v12)
        {
          uint64_t v13 = 2;
        }
        else
        {
          id v14 = [v10 ID];
          int IsEmail = IMStringIsEmail();

          if (IsEmail) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = 3;
          }
        }
        uint64_t v16 = objc_opt_new();
        __int16 v17 = [v10 firstName];
        [v16 setGivenName:v17];

        BOOL v18 = [v10 lastName];
        [v16 setFamilyName:v18];

        id v19 = [v10 nickname];
        [v16 setNickname:v19];

        id v20 = objc_alloc(MEMORY[0x1E4F5A120]);
        v21 = [v10 ID];
        uint64_t v22 = (void *)[v20 initWithNameComponents:v16 address:v21 addressType:v13];

        [v4 addObject:v22];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (CKContactsSearchManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKContactsSearchManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)enteredRecipients
{
  return self->_enteredRecipients;
}

- (void)setEnteredRecipients:(id)a3
{
}

- (BOOL)suppressGroupSuggestions
{
  return self->_suppressGroupSuggestions;
}

- (void)setSuppressGroupSuggestions:(BOOL)a3
{
  self->_suppressGroupSuggestions = a3;
}

- (BOOL)biasForOutgoingInteraction
{
  return self->_biasForOutgoingInteraction;
}

- (void)setBiasForOutgoingInteraction:(BOOL)a3
{
  self->_biasForOutgoingInteraction = a3;
}

- (BOOL)zkwGroupSuggestionsEnabled
{
  return self->_zkwGroupSuggestionsEnabled;
}

- (void)setZkwGroupSuggestionsEnabled:(BOOL)a3
{
  self->_zkwGroupSuggestionsEnabled = a3;
}

- (CNAutocompleteSearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
}

- (void)setEmojiCharacterSet:(id)a3
{
}

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (NSNumber)currentSearchTaskID
{
  return self->_currentSearchTaskID;
}

- (void)setCurrentSearchTaskID:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_emojiCharacterSet, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_enteredRecipients, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end