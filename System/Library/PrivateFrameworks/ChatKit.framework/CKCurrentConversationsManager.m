@interface CKCurrentConversationsManager
+ (id)sharedInstance;
- (BOOL)_canDumpConversationFromCache:(id)a3;
- (IMDoubleLinkedList)orderedKeys;
- (NSCountedSet)currentConversations;
- (NSMutableDictionary)idToNodeDictionary;
- (unint64_t)cacheSize;
- (void)_prepareToDumpCachedConversation:(id)a3;
- (void)addConversation:(id)a3;
- (void)loadHistoryForConversation:(id)a3 keepAllCurrentlyLoadedMessages:(BOOL)a4;
- (void)pruneCache;
- (void)pruneCacheToSize:(unint64_t)a3;
- (void)purgeConversation:(id)a3;
- (void)purgeConversations:(id)a3;
- (void)removeConversation:(id)a3;
- (void)setCurrentConversations:(id)a3;
- (void)setIdToNodeDictionary:(id)a3;
- (void)setOrderedKeys:(id)a3;
@end

@implementation CKCurrentConversationsManager

+ (id)sharedInstance
{
  if (sharedInstance_creation_1 != -1) {
    dispatch_once(&sharedInstance_creation_1, &__block_literal_global_220);
  }
  v2 = (void *)sharedInstance_sInstance_3;

  return v2;
}

- (NSCountedSet)currentConversations
{
  currentConversations = self->_currentConversations;
  if (!currentConversations)
  {
    v4 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v5 = self->_currentConversations;
    self->_currentConversations = v4;

    currentConversations = self->_currentConversations;
  }

  return currentConversations;
}

- (void)loadHistoryForConversation:(id)a3 keepAllCurrentlyLoadedMessages:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  unsigned int v5 = [v12 limitToLoad];
  v6 = +[CKUIBehavior sharedBehaviors];
  unint64_t v7 = [v6 defaultConversationViewingMessageCount];

  if (v7 >= v5) {
    unint64_t v7 = v5;
  }
  v8 = +[CKUIBehavior sharedBehaviors];
  unint64_t v9 = [v8 initialConversationViewingMessageCount];

  if (v7 <= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v7;
  }
  if (v4)
  {
    unsigned int v11 = [v12 limitToLoad];
    if (v10 <= v11) {
      unint64_t v10 = v11;
    }
  }
  else
  {
    [v12 clearConversationLoadFromSpotlight];
  }
  [v12 setLoadedMessageCount:v10];
}

void __47__CKCurrentConversationsManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKCurrentConversationsManager);
  v1 = (void *)sharedInstance_sInstance_3;
  sharedInstance_sInstance_3 = (uint64_t)v0;
}

- (void)addConversation:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v5 = [v4 deviceIndependentID];
    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = [v4 shortDescription];
          int v18 = 138412290;
          v19 = v8;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Adding/incrementing conversation count in cache: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      unint64_t v9 = [(CKCurrentConversationsManager *)self currentConversations];
      [v9 addObject:v5];

      unint64_t v10 = [(CKCurrentConversationsManager *)self idToNodeDictionary];
      unsigned int v11 = [v10 objectForKeyedSubscript:v5];

      if (v11)
      {
        id v12 = [(CKCurrentConversationsManager *)self orderedKeys];
        [v12 removeLinkedListNode:v11];
      }
      else
      {
        unsigned int v11 = [(IMDoubleLinkedListNode *)[CKCurrentConversationsManagerOrderedNode alloc] initWithObject:v4];
        [(CKCurrentConversationsManagerOrderedNode *)v11 setKey:v5];
        id v12 = [(CKCurrentConversationsManager *)self idToNodeDictionary];
        [v12 setObject:v11 forKeyedSubscript:v5];
      }

      v15 = [(CKCurrentConversationsManager *)self orderedKeys];
      [v15 appendLinkedListNode:v11];

      v16 = [(CKCurrentConversationsManager *)self orderedKeys];
      unint64_t v17 = [v16 count];
      LODWORD(v17) = v17 > [(CKCurrentConversationsManager *)self cacheSize];

      if (v17) {
        [(CKCurrentConversationsManager *)self pruneCacheToSize:[(CKCurrentConversationsManager *)self cacheSize]];
      }
    }
    else if (v4 && IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v4 shortDescription];
        int v18 = 138412290;
        v19 = v14;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKCurrentConversationsManager: Not caching conversation with no deviceIndependentID: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v4 shortDescription];
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Not caching pending conversation: %@", (uint8_t *)&v18, 0xCu);
    }
LABEL_22:
  }
}

- (void)removeConversation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [v4 deviceIndependentID];
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unint64_t v7 = [v4 shortDescription];
        int v9 = 138412290;
        unint64_t v10 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Decrementing conversation count in cache: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    v8 = [(CKCurrentConversationsManager *)self currentConversations];
    [v8 removeObject:v5];
  }
}

- (void)purgeConversation:(id)a3
{
  id v12 = a3;
  id v4 = [v12 deviceIndependentID];
  if (v4)
  {
    unsigned int v5 = [(CKCurrentConversationsManager *)self currentConversations];
    uint64_t v6 = [v5 countForObject:v4];

    for (; v6; --v6)
    {
      unint64_t v7 = [(CKCurrentConversationsManager *)self currentConversations];
      [v7 removeObject:v4];
    }
    v8 = [(CKCurrentConversationsManager *)self idToNodeDictionary];
    int v9 = [v8 objectForKeyedSubscript:v4];

    [(CKCurrentConversationsManager *)self _prepareToDumpCachedConversation:v12];
    unint64_t v10 = [(CKCurrentConversationsManager *)self orderedKeys];
    [v10 removeLinkedListNode:v9];

    uint64_t v11 = [(CKCurrentConversationsManager *)self idToNodeDictionary];
    [v11 removeObjectForKey:v4];
  }
}

- (void)purgeConversations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CKCurrentConversationsManager *)self purgeConversation:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)pruneCache
{
}

- (void)pruneCacheToSize:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v17 = 134217984;
      unint64_t v18 = a3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Pruning conversation cache to size %ld", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t v6 = [(CKCurrentConversationsManager *)self orderedKeys];
  uint64_t v7 = [v6 first];

  if (v7)
  {
    while (1)
    {
      uint64_t v8 = [(CKCurrentConversationsManager *)self orderedKeys];
      BOOL v9 = [v8 count] > a3;

      if (!v9)
      {
LABEL_13:

        return;
      }
      uint64_t v10 = [v7 next];
      long long v11 = [v7 object];
      long long v12 = [v11 deviceIndependentID];
      v13 = [v7 key];
      if (!v12) {
        break;
      }
      if ([(CKCurrentConversationsManager *)self _canDumpConversationFromCache:v11])
      {
        [(CKCurrentConversationsManager *)self _prepareToDumpCachedConversation:v11];
        uint64_t v14 = [(CKCurrentConversationsManager *)self orderedKeys];
        [v14 removeLinkedListNode:v7];

        v15 = [(CKCurrentConversationsManager *)self idToNodeDictionary];
        [v15 removeObjectForKey:v12];
LABEL_11:
      }
      uint64_t v7 = (void *)v10;
      if (!v10) {
        goto LABEL_13;
      }
    }
    v16 = [(CKCurrentConversationsManager *)self orderedKeys];
    [v16 removeLinkedListNode:v7];

    v15 = [(CKCurrentConversationsManager *)self idToNodeDictionary];
    [v15 removeObjectForKey:v13];
    goto LABEL_11;
  }
}

- (BOOL)_canDumpConversationFromCache:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 deviceIndependentID];
  if (v5)
  {
    uint64_t v6 = [(CKCurrentConversationsManager *)self currentConversations];
    BOOL v7 = [v6 countForObject:v5] == 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = [v4 shortDescription];
        int v11 = 138412290;
        long long v12 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKCurrentConversationsManager: asking to dump conversation with no deviceIndependentID: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_prepareToDumpCachedConversation:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [v3 shortDescription];
      int v8 = 138412290;
      BOOL v9 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "  => Preparing to dump conversation from cache: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v6 = +[CKUIBehavior sharedBehaviors];
  uint64_t v7 = [v6 defaultConversationSummaryMessageCount];

  [v3 setLoadedMessageCount:v7];
}

- (IMDoubleLinkedList)orderedKeys
{
  orderedKeys = self->_orderedKeys;
  if (!orderedKeys)
  {
    id v4 = (IMDoubleLinkedList *)objc_alloc_init(MEMORY[0x1E4F6C330]);
    uint64_t v5 = self->_orderedKeys;
    self->_orderedKeys = v4;

    orderedKeys = self->_orderedKeys;
  }

  return orderedKeys;
}

- (NSMutableDictionary)idToNodeDictionary
{
  idToNodeDictionary = self->_idToNodeDictionary;
  if (!idToNodeDictionary)
  {
    id v4 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[CKCurrentConversationsManager cacheSize](self, "cacheSize"));
    uint64_t v5 = self->_idToNodeDictionary;
    self->_idToNodeDictionary = v4;

    idToNodeDictionary = self->_idToNodeDictionary;
  }

  return idToNodeDictionary;
}

- (unint64_t)cacheSize
{
  v2 = +[CKUIBehavior sharedBehaviors];
  unint64_t v3 = [v2 conversationCacheSize];

  if (!v3 && IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "CKCurrentConversationsManager: Conversation cache size is zero!", v6, 2u);
    }
  }
  return v3;
}

- (void)setCurrentConversations:(id)a3
{
}

- (void)setIdToNodeDictionary:(id)a3
{
}

- (void)setOrderedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_idToNodeDictionary, 0);

  objc_storeStrong((id *)&self->_currentConversations, 0);
}

@end