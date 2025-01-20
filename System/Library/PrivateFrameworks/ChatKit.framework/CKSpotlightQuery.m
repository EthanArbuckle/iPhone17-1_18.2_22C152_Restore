@interface CKSpotlightQuery
- (BOOL)cancelled;
- (CKSpotlightQuery)initWithSearchText:(id)a3 chatRegistryOverride:(id)a4 startQuery:(BOOL)a5 completionBlock:(id)a6;
- (CKSpotlightQuery)initWithSearchText:(id)a3 completionBlock:(id)a4;
- (CKSpotlightQuery)initWithSearchText:(id)a3 completionBlock:(id)a4 startQuery:(BOOL)a5;
- (IMChatRegistry)chatRegisteryOverride;
- (MDSearchQuery)currentQuery;
- (NSArray)searchResults;
- (NSMutableDictionary)chatGUIDToLatestSearchResult;
- (OS_dispatch_group)searchResultLoadingGroup;
- (id)chatRegistry;
- (id)completion;
- (unint64_t)resultIndex;
- (void)_callCompletion;
- (void)_cleanup;
- (void)_processSearchResults;
- (void)cancel;
- (void)dealloc;
- (void)searchQuery:(id)a3 didFailWithError:(id)a4;
- (void)searchQuery:(id)a3 didReturnItems:(id)a4;
- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setChatGUIDToLatestSearchResult:(id)a3;
- (void)setChatRegisteryOverride:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setResultIndex:(unint64_t)a3;
- (void)setSearchResultLoadingGroup:(id)a3;
- (void)setSearchResults:(id)a3;
@end

@implementation CKSpotlightQuery

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)_processSearchResults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CKSpotlightQuery__processSearchResults__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__CKSpotlightQuery__processSearchResults__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v3;
        _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Leaving group %d", buf, 8u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Leaving A - cancel", buf, 2u);
      }
    }
  }
  else
  {
    if (!*(void *)(v1 + 48)) {
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_processSearchResults...", buf, 2u);
      }
    }
    unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) count];
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(void *)(v8 + 32) < v6)
    {
      *(void *)&long long v7 = 138412290;
      long long v29 = v7;
      do
      {
        v9 = [*(id *)(v8 + 40) objectAtIndex:v29];
        v10 = [v9 uniqueIdentifier];
        v11 = [v9 domainIdentifier];
        v12 = [v9 attributeSet];
        v13 = objc_msgSend(v12, "__ck_itemContentCreationDate");

        v14 = [v9 attributeSet];
        v15 = objc_msgSend(v14, "__ck_spotlightItemSnippet");

        if (([v10 containsString:@"message_guid"] & 1) != 0
          || [v10 containsString:@"chat_guid"])
        {
          ++*(void *)(*(void *)(a1 + 32) + 32);
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v38 = (unint64_t)v10;
              __int16 v39 = 2112;
              v40 = v11;
              _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Looking for a message matching message guid: %@ or chat guid: %@", buf, 0x16u);
            }
          }
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __41__CKSpotlightQuery__processSearchResults__block_invoke_84;
          aBlock[3] = &unk_1E5629B00;
          aBlock[4] = *(void *)(a1 + 32);
          id v34 = v13;
          id v17 = v10;
          id v35 = v17;
          id v36 = v15;
          v18 = (void (**)(void *, void *))_Block_copy(aBlock);
          if (v11)
          {
            if (IMOSLoggingEnabled())
            {
              v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v29;
                unint64_t v38 = (unint64_t)v11;
                _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "ChatGUID: %@", buf, 0xCu);
              }
            }
            v20 = [*(id *)(a1 + 32) chatRegistry];
            v21 = [v20 existingChatWithGUID:v11];

            v18[2](v18, v21);
          }
          else if (v17)
          {
            if (IMOSLoggingEnabled())
            {
              v22 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v29;
                unint64_t v38 = (unint64_t)v17;
                _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "MessageGUID: %@", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Entering B", buf, 2u);
              }
            }
            dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
            v24 = [MEMORY[0x1E4F6BC30] sharedInstance];
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __41__CKSpotlightQuery__processSearchResults__block_invoke_87;
            v31[3] = &unk_1E5629B28;
            v31[4] = *(void *)(a1 + 32);
            v32 = v18;
            [v24 loadMessageWithGUID:v17 completionBlock:v31];
          }
          ++*(void *)(*(void *)(a1 + 32) + 32);
        }
        uint64_t v8 = *(void *)(a1 + 32);
      }
      while (*(void *)(v8 + 32) < v6);
    }
    v25 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)buf = 134218240;
        unint64_t v38 = v6;
        __int16 v39 = 1024;
        LODWORD(v40) = v27;
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Count: %lu group: %d", buf, 0x12u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Leaving A", buf, 2u);
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
}

void __41__CKSpotlightQuery__processSearchResults__block_invoke_84(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Chat: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  v5 = [v3 guid];

  if (v5)
  {
    unint64_t v6 = *(void **)(a1[4] + 48);
    long long v7 = [v3 guid];
    uint64_t v8 = [v6 objectForKey:v7];

    if (!v8
      || a1[5]
      && ([v8 messageDate],
          v9 = objc_claimAutoreleasedReturnValue(),
          BOOL v10 = [v9 compare:a1[5]] == -1,
          v9,
          v10))
    {
      v11 = [CKSpotlightSearchResult alloc];
      uint64_t v12 = a1[6];
      v13 = [v3 guid];
      v14 = [(CKSpotlightSearchResult *)v11 initWithMessageGUID:v12 chatGUID:v13 messageTime:a1[5] summery:a1[7]];

      v15 = *(void **)(a1[4] + 48);
      v16 = [v3 guid];
      [v15 setObject:v14 forKey:v16];
    }
  }
}

void __41__CKSpotlightQuery__processSearchResults__block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    long long v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Completion called with message; %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = [v6 lastObject];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Leaving B", (uint8_t *)&v11, 2u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
}

- (void)_cleanup
{
  searchResults = self->_searchResults;
  self->_searchResults = 0;

  self->_resultIndex = 0;
  chatGUIDToLatestSearchResult = self->_chatGUIDToLatestSearchResult;
  self->_chatGUIDToLatestSearchResult = 0;

  currentQuery = self->_currentQuery;
  if (currentQuery)
  {
    if ((unint64_t)[(MDSearchQuery *)currentQuery status] <= 2) {
      [(MDSearchQuery *)self->_currentQuery cancel];
    }
    [(MDSearchQuery *)self->_currentQuery setDelegate:0];
    id v6 = self->_currentQuery;
    self->_currentQuery = 0;
  }
  [(CKSpotlightQuery *)self setCompletion:0];
  searchResultLoadingGroup = self->_searchResultLoadingGroup;
  if (searchResultLoadingGroup)
  {
    self->_searchResultLoadingGroup = 0;
  }
}

- (void)_callCompletion
{
  if (self->_completion)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_chatGUIDToLatestSearchResult, "count"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [(NSMutableDictionary *)self->_chatGUIDToLatestSearchResult allValues];
    [v4 addObjectsFromArray:v3];

    [v4 sortUsingComparator:&__block_literal_global_92_0];
    (*((void (**)(void))self->_completion + 2))();
  }
}

uint64_t __35__CKSpotlightQuery__callCompletion__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (CKSpotlightQuery)initWithSearchText:(id)a3 completionBlock:(id)a4 startQuery:(BOOL)a5
{
  BOOL v21 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v7;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "initWithSearchText:completionBlock: [searchText: %@]", buf, 0xCu);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)CKSpotlightQuery;
  BOOL v10 = [(CKSpotlightQuery *)&v22 init];
  int v11 = v10;
  if (v10)
  {
    [(CKSpotlightQuery *)v10 setCompletion:v8];
    if ([v7 length])
    {
      if (setupCoreSpotlight_onceToken != -1) {
        dispatch_once(&setupCoreSpotlight_onceToken, &__block_literal_global_179);
      }
      if (_CKMDSearchQueryClass
        && _CKMDSearchQueryOptionFetchAttributes
        && _CKMDItemAuthors
        && _CKMDItemAuthorAddresses
        && _CKMDItemRecipients
        && _CKMDItemRecipientAddresses
        && _CKMDItemSubject
        && _CKMDItemTextContent
        && _CKMDItemInstantMessageAddresses)
      {
        if (CKEnhancedLegacySearchDisabled()) {
          [MEMORY[0x1E4F28F60] predicateWithFormat:@"(kMDItemAuthors contains[cd] %@) || (kMDItemAuthorAddresses contains[cd] %@) || (kMDItemRecipients contains[cd] %@) || (kMDItemRecipientAddresses contains[cd] %@) || (kMDItemInstantMessageAddresses contains[cd] %@) || (kMDItemSubject contains[cd] %@) || (kMDItemTextContent contains[cd] %@)", v7, v7, v7, v7, v7, v7, v7];
        }
        else {
        v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(kMDItemSubject contains[cd] %@) || (kMDItemTextContent contains[cd] %@)", v7, v7];
        }
        id v13 = objc_alloc((Class)_CKMDSearchQueryClass);
        uint64_t v24 = _CKMDSearchQueryOptionFetchAttributes;
        v23[0] = _CKMDItemAuthors;
        v23[1] = _CKMDItemAuthorAddresses;
        v23[2] = _CKMDItemRecipients;
        v23[3] = _CKMDItemRecipientAddresses;
        v23[4] = _CKMDItemInstantMessageAddresses;
        v23[5] = _CKMDItemSubject;
        v23[6] = _CKMDItemTextContent;
        v23[7] = @"kMDItemContentCreationDate";
        uint64_t v14 = _CKMDItemSnippet;
        if (!_CKMDItemSnippet) {
          uint64_t v14 = kMDSpotlightItemSnippet;
        }
        v23[8] = v14;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:9];
        v25 = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        uint64_t v17 = [v13 initWithPredicate:v20 options:v16];
        currentQuery = v11->_currentQuery;
        v11->_currentQuery = (MDSearchQuery *)v17;

        [(MDSearchQuery *)v11->_currentQuery setClientBundleID:@"com.apple.MobileSMS"];
        [(MDSearchQuery *)v11->_currentQuery setDelegate:v11];
        if (v21) {
          [(MDSearchQuery *)v11->_currentQuery start];
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Couldn't find CoreSpotlight symbols", buf, 2u);
        }
      }
    }
  }

  return v11;
}

- (void)dealloc
{
  [(CKSpotlightQuery *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CKSpotlightQuery;
  [(CKSpotlightQuery *)&v3 dealloc];
}

- (void)searchQuery:(id)a3 didReturnItems:(id)a4
{
  id v6 = (MDSearchQuery *)a3;
  id v7 = a4;
  if (self->_currentQuery == v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "did return items", buf, 2u);
      }
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__CKSpotlightQuery_searchQuery_didReturnItems___block_invoke;
    v9[3] = &unk_1E5620AF8;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __47__CKSpotlightQuery_searchQuery_didReturnItems___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 40);
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v3)
  {
    uint64_t v4 = [v3 arrayByAddingObjectsFromArray:v2];
  }
  else
  {
    uint64_t v4 = [v2 copy];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 40) count];
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Added results with count %lu", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = (MDSearchQuery *)a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = a4;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "statusChanged: %lu", buf, 0xCu);
    }
  }
  if (a4 == 3 && self->_currentQuery == v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  if (!v5[7])
  {
    dispatch_group_t v6 = dispatch_group_create();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v6;

    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Entering A", buf, 2u);
      }
    }
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke_112;
    block[3] = &unk_1E5620C40;
    block[4] = v10;
    dispatch_group_notify(v11, MEMORY[0x1E4F14428], block);
    uint64_t v5 = *(void **)(a1 + 32);
  }
  return [v5 _processSearchResults];
}

uint64_t __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke_112(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Notify triggered!", v5, 2u);
    }
  }
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3[8])
  {
    [v3 _callCompletion];
    uint64_t v3 = *(unsigned char **)(a1 + 32);
  }
  return [v3 _cleanup];
}

- (void)searchQuery:(id)a3 didFailWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_group_t v6 = (MDSearchQuery *)a3;
  id v7 = a4;
  if (self->_currentQuery == v6 && IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Spotlight query failed with error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (CKSpotlightQuery)initWithSearchText:(id)a3 completionBlock:(id)a4
{
  return [(CKSpotlightQuery *)self initWithSearchText:a3 completionBlock:a4 startQuery:1];
}

- (CKSpotlightQuery)initWithSearchText:(id)a3 chatRegistryOverride:(id)a4 startQuery:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  uint64_t v11 = [(CKSpotlightQuery *)self initWithSearchText:a3 completionBlock:a6 startQuery:v7];
  id v12 = v11;
  if (v11) {
    [(CKSpotlightQuery *)v11 setChatRegisteryOverride:v10];
  }

  return v12;
}

- (id)chatRegistry
{
  chatRegisteryOverride = self->_chatRegisteryOverride;
  if (chatRegisteryOverride)
  {
    uint64_t v3 = chatRegisteryOverride;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  }

  return v3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (MDSearchQuery)currentQuery
{
  return self->_currentQuery;
}

- (unint64_t)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unint64_t)a3
{
  self->_resultIndex = a3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (NSMutableDictionary)chatGUIDToLatestSearchResult
{
  return self->_chatGUIDToLatestSearchResult;
}

- (void)setChatGUIDToLatestSearchResult:(id)a3
{
}

- (OS_dispatch_group)searchResultLoadingGroup
{
  return self->_searchResultLoadingGroup;
}

- (void)setSearchResultLoadingGroup:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (IMChatRegistry)chatRegisteryOverride
{
  return self->_chatRegisteryOverride;
}

- (void)setChatRegisteryOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatRegisteryOverride, 0);
  objc_storeStrong((id *)&self->_searchResultLoadingGroup, 0);
  objc_storeStrong((id *)&self->_chatGUIDToLatestSearchResult, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end