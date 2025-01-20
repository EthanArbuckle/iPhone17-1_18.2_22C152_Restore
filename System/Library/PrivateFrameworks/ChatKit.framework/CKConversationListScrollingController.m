@interface CKConversationListScrollingController
- (BOOL)isFetchingOlderConversations;
- (CKConversationList)conversationList;
- (CKConversationListScrollingController)initWithConversationList:(id)a3 chatRegistry:(id)a4;
- (IMChatRegistry)chatRegistry;
- (NSMutableDictionary)filterModeToEarliestFetchedDate;
- (NSMutableDictionary)filterModeToEarliestReachedDate;
- (id)_convertFilterActionDictionaryToConversationListFilterModeDictionary:(id)a3;
- (void)_handleRegistryDidLoadNotification:(id)a3;
- (void)_loadOlderConversationsWithFilterMode:(unint64_t)a3;
- (void)_loadOlderConversationsWithFilterMode:(unint64_t)a3 limit:(unint64_t)a4 iteration:(unint64_t)a5;
- (void)_resetDateTrackingWithChatRegistry:(id)a3;
- (void)reachedConversationWithLastMessageDate:(id)a3 filterMode:(unint64_t)a4 remainingRows:(int64_t)a5;
- (void)setFetchingOlderConversations:(BOOL)a3;
- (void)setFilterModeToEarliestFetchedDate:(id)a3;
- (void)setFilterModeToEarliestReachedDate:(id)a3;
@end

@implementation CKConversationListScrollingController

- (void)reachedConversationWithLastMessageDate:(id)a3 filterMode:(unint64_t)a4 remainingRows:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] now];
  }
  v9 = [NSNumber numberWithUnsignedInteger:a4];
  v10 = [(CKConversationListScrollingController *)self filterModeToEarliestFetchedDate];
  v11 = [v10 objectForKeyedSubscript:v9];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] now];
  }
  v14 = v13;

  v15 = [(CKConversationListScrollingController *)self filterModeToEarliestReachedDate];
  v16 = [v15 objectForKeyedSubscript:v9];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [MEMORY[0x1E4F1C9C8] now];
  }
  v19 = v18;

  v20 = [v19 earlierDate:v8];
  v21 = [(CKConversationListScrollingController *)self filterModeToEarliestReachedDate];
  [v21 setObject:v20 forKeyedSubscript:v9];

  if (![(CKConversationListScrollingController *)self isFetchingOlderConversations])
  {
    v22 = [v8 earlierDate:v14];
    int v23 = [v22 isEqualToDate:v8];

    v24 = +[CKUIBehavior sharedBehaviors];
    unint64_t v25 = [v24 conversationListScrollingPaddingRowCount];

    int v26 = v25 > a5 ? 1 : v23;
    if (v26 == 1)
    {
      if (IMOSLoggingEnabled())
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [NSNumber numberWithInteger:a5];
          v29 = @"NO";
          if (v25 <= a5) {
            v30 = @"NO";
          }
          else {
            v30 = @"YES";
          }
          *(_DWORD *)v32 = 138412802;
          if (v23) {
            v29 = @"YES";
          }
          *(void *)&v32[4] = v29;
          __int16 v33 = 2112;
          v34 = v30;
          __int16 v35 = 2112;
          uint64_t v36 = v28;
          v31 = (void *)v28;
          _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Initiating infinite scroll fetch for date: %@ for end of list: %@ remaining rows: %@", v32, 0x20u);
        }
      }
      -[CKConversationListScrollingController _loadOlderConversationsWithFilterMode:](self, "_loadOlderConversationsWithFilterMode:", a4, *(void *)v32);
    }
  }
}

- (NSMutableDictionary)filterModeToEarliestReachedDate
{
  return self->_filterModeToEarliestReachedDate;
}

- (BOOL)isFetchingOlderConversations
{
  return self->_fetchingOlderConversations;
}

- (NSMutableDictionary)filterModeToEarliestFetchedDate
{
  return self->_filterModeToEarliestFetchedDate;
}

- (CKConversationListScrollingController)initWithConversationList:(id)a3 chatRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListScrollingController;
  v9 = [(CKConversationListScrollingController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversationList, a3);
    objc_storeStrong((id *)&v10->_chatRegistry, a4);
    v11 = [(CKConversationListScrollingController *)v10 chatRegistry];
    [(CKConversationListScrollingController *)v10 _resetDateTrackingWithChatRegistry:v11];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v10 selector:sel__handleRegistryDidLoadNotification_ name:*MEMORY[0x1E4F6BA20] object:0];
  }
  return v10;
}

- (IMChatRegistry)chatRegistry
{
  return self->_chatRegistry;
}

- (void)_resetDateTrackingWithChatRegistry:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 filterCategoryToEarliestInitiallyFetchedLastMessageDate];
  v6 = [(CKConversationListScrollingController *)self _convertFilterActionDictionaryToConversationListFilterModeDictionary:v5];
  filterModeToEarliestFetchedDate = self->_filterModeToEarliestFetchedDate;
  self->_filterModeToEarliestFetchedDate = v6;

  id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  filterModeToEarliestReachedDate = self->_filterModeToEarliestReachedDate;
  self->_filterModeToEarliestReachedDate = v8;

  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_filterModeToEarliestFetchedDate;
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Reset filter mode to fetch dates to %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)_convertFilterActionDictionaryToConversationListFilterModeDictionary:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__CKConversationListScrollingController__convertFilterActionDictionaryToConversationListFilterModeDictionary___block_invoke;
  v8[3] = &unk_1E5621F20;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __110__CKConversationListScrollingController__convertFilterActionDictionaryToConversationListFilterModeDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 integerValue];
  switch(v7)
  {
    case 0:
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:&unk_1EDF160A0];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:&unk_1EDF160B8];
      id v8 = *(void **)(a1 + 32);
      id v9 = &unk_1EDF160D0;
      goto LABEL_11;
    case 1:
      id v8 = *(void **)(a1 + 32);
      id v9 = &unk_1EDF16100;
      goto LABEL_11;
    case 2:
      id v8 = *(void **)(a1 + 32);
      id v9 = &unk_1EDF160E8;
      goto LABEL_11;
    case 3:
      id v8 = *(void **)(a1 + 32);
      id v9 = &unk_1EDF16118;
      goto LABEL_11;
    case 4:
      id v8 = *(void **)(a1 + 32);
      id v9 = &unk_1EDF16130;
LABEL_11:
      [v8 setObject:v6 forKeyedSubscript:v9];
      break;
    default:
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = 134217984;
          uint64_t v12 = v7;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Unknown filter action: %ld", (uint8_t *)&v11, 0xCu);
        }
      }
      break;
  }
}

- (void)_handleRegistryDidLoadNotification:(id)a3
{
  id v4 = [(CKConversationListScrollingController *)self chatRegistry];
  [(CKConversationListScrollingController *)self _resetDateTrackingWithChatRegistry:v4];
}

- (void)_loadOlderConversationsWithFilterMode:(unint64_t)a3
{
  id v5 = +[CKUIBehavior sharedBehaviors];
  -[CKConversationListScrollingController _loadOlderConversationsWithFilterMode:limit:iteration:](self, "_loadOlderConversationsWithFilterMode:limit:iteration:", a3, [v5 conversationListScrollingBatchSize], 0);
}

- (void)_loadOlderConversationsWithFilterMode:(unint64_t)a3 limit:(unint64_t)a4 iteration:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v9 = [(CKConversationListScrollingController *)self isFetchingOlderConversations];
  if (a5 > 0xC || v9)
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        BOOL v16 = [(CKConversationListScrollingController *)self isFetchingOlderConversations];
        uint64_t v17 = [NSNumber numberWithUnsignedInteger:a5];
        id v18 = (void *)v17;
        v19 = @"NO";
        if (v16) {
          v19 = @"YES";
        }
        int v39 = 138412546;
        unint64_t v40 = (unint64_t)v19;
        __int16 v41 = 2112;
        unint64_t v42 = v17;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Ignoring load older conversations request, is fetching is %@ and iteration is %@", (uint8_t *)&v39, 0x16u);
      }
    }
  }
  else
  {
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    int v11 = [(CKConversationListScrollingController *)self filterModeToEarliestFetchedDate];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1C9C8] now];
    }
    v20 = v14;

    v21 = [(CKConversationListScrollingController *)self conversationList];
    v22 = [v21 conversations];
    int v23 = [v22 lastObject];
    v24 = [v23 chat];
    v32 = [v24 lastFinishedMessageDate];

    unint64_t v25 = [v20 laterDate:v32];

    if (IMOSLoggingEnabled())
    {
      int v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v39 = 134219010;
        unint64_t v40 = a5;
        __int16 v41 = 2048;
        unint64_t v42 = a4;
        __int16 v43 = 1024;
        int v44 = a3;
        __int16 v45 = 2112;
        v46 = v25;
        __int16 v47 = 2112;
        v48 = v32;
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Kicking off request (%llu) for %llu older conversations with filter mode %d older than date %@ (oldest conversation date: %@)", (uint8_t *)&v39, 0x30u);
      }
    }
    [(CKConversationListScrollingController *)self setFetchingOlderConversations:1];
    v27 = [(CKConversationListScrollingController *)self chatRegistry];
    uint64_t v28 = [(CKConversationListScrollingController *)self conversationList];
    v29 = [v28 _chatPredicateForFilterMode:a3];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke;
    v33[3] = &unk_1E5621EF8;
    v33[4] = self;
    id v34 = v10;
    id v35 = v25;
    unint64_t v36 = a4;
    unint64_t v37 = a5;
    unint64_t v38 = a3;
    id v30 = v25;
    id v31 = v10;
    [v27 _loadChatsFilteredUsingPredicate:v29 lastMessageOlderThan:v30 limit:a4 waitForReply:0 completionHandler:v33];
  }
}

void __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    int v11 = [*(id *)(a1 + 32) filterModeToEarliestFetchedDate];
    id v10 = [v11 objectForKeyedSubscript:*(void *)(a1 + 40)];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v7 count];
      id v14 = [*(id *)(a1 + 32) conversationList];
      v15 = [v14 conversations];
      *(_DWORD *)buf = 134218754;
      uint64_t v31 = v13;
      __int16 v32 = 2048;
      uint64_t v33 = [v15 count];
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Request for older conversations found %llu results (conversation list total now %llu) with error: %@ earliest last message date: %@", buf, 0x2Au);
    }
  }
  [*(id *)(a1 + 32) setFetchingOlderConversations:0];
  if ([v7 count])
  {
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = [*(id *)(a1 + 32) filterModeToEarliestReachedDate];
    id v18 = [v17 objectForKeyedSubscript:*(void *)(a1 + 40)];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1C9C8] now];
    }
    v21 = v20;

    if ([v10 isEqualToDate:*(void *)(a1 + 48)]
      && (unint64_t v22 = *(void *)(a1 + 56), v22 <= 0xC7))
    {
      uint64_t v16 = 2 * v22;
    }
    else
    {
      int v23 = [v21 earlierDate:v10];
      BOOL v24 = v23 == v21;

      if (!v24)
      {
        BOOL v25 = *(void *)(a1 + 64) == 0;
LABEL_18:
        int v26 = [*(id *)(a1 + 32) filterModeToEarliestFetchedDate];
        [v26 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];

        if (v25)
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke_83;
          v29[3] = &unk_1E5621ED0;
          uint64_t v28 = *(void *)(a1 + 64);
          uint64_t v27 = *(void *)(a1 + 72);
          v29[4] = *(void *)(a1 + 32);
          v29[5] = v27;
          v29[6] = v16;
          v29[7] = v28;
          dispatch_async(MEMORY[0x1E4F14428], v29);
        }

        goto LABEL_21;
      }
    }
    BOOL v25 = 1;
    goto LABEL_18;
  }
LABEL_21:
}

uint64_t __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke_83(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadOlderConversationsWithFilterMode:*(void *)(a1 + 40) limit:*(void *)(a1 + 48) iteration:*(void *)(a1 + 56) + 1];
}

- (CKConversationList)conversationList
{
  return self->_conversationList;
}

- (void)setFilterModeToEarliestFetchedDate:(id)a3
{
}

- (void)setFilterModeToEarliestReachedDate:(id)a3
{
}

- (void)setFetchingOlderConversations:(BOOL)a3
{
  self->_fetchingOlderConversations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterModeToEarliestReachedDate, 0);
  objc_storeStrong((id *)&self->_filterModeToEarliestFetchedDate, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);

  objc_storeStrong((id *)&self->_conversationList, 0);
}

@end