@interface EMInMemoryThread
+ (OS_os_log)log;
+ (id)_dateSortDescriptors;
- (BOOL)_combinedHasAttachments;
- (BOOL)_combinedHasUnflagged;
- (BOOL)_combinedIsBlocked;
- (BOOL)_combinedIsVIP;
- (BOOL)_isSortedByDate:(id)a3;
- (EMInMemoryThread)initWithMessages:(id)a3 originatingQuery:(id)a4 threadScope:(id)a5;
- (EMMessage)displayMessage;
- (EMMessage)newestMessage;
- (EMMessage)oldestMessage;
- (EMMessageListItem)messageListItem;
- (EMQuery)originatingQuery;
- (EMThread)thread;
- (EMThreadScope)threadScope;
- (NSArray)messages;
- (NSString)description;
- (id)_calculateAndApplyChange;
- (id)_calculateChangesAfterRemovingMessages:(id)a3 applyingChanges:(id)a4 threadIsEmpty:(BOOL *)a5;
- (id)_combinedCCList;
- (id)_combinedFlagColors;
- (id)_combinedFlags;
- (id)_combinedMailboxes;
- (id)_combinedReadLater;
- (id)_combinedSenderList;
- (id)_combinedToList;
- (id)_createThreadWithObjectID:(id)a3;
- (id)_newestDisplayDate;
- (id)addMessages:(id)a3;
- (id)changeMessages:(id)a3 forKeyPaths:(id)a4 threadIsEmpty:(BOOL *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)removeMessages:(id)a3 threadIsEmpty:(BOOL *)a4;
- (id)updateMessage:(id)a3 fromOldObjectID:(id)a4;
- (void)_addMessagesToThread:(id)a3;
- (void)_recalculateDisplayMessage;
- (void)setDisplayMessage:(id)a3;
- (void)setThread:(id)a3;
@end

@implementation EMInMemoryThread

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__EMInMemoryThread_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_18 != -1) {
    dispatch_once(&log_onceToken_18, block);
  }
  v2 = (void *)log_log_18;
  return (OS_os_log *)v2;
}

void __23__EMInMemoryThread_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_18;
  log_log_18 = (uint64_t)v1;
}

- (EMInMemoryThread)initWithMessages:(id)a3 originatingQuery:(id)a4 threadScope:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)EMInMemoryThread;
  v11 = [(EMInMemoryThread *)&v27 init];
  if (v11)
  {
    v12 = objc_msgSend(v8, "ef_filter:", &__block_literal_global_18);
    uint64_t v13 = [v12 mutableCopy];
    messages = v11->_messages;
    v11->_messages = (NSMutableArray *)v13;

    if (![(NSMutableArray *)v11->_messages count])
    {
      v25 = 0;
      goto LABEL_10;
    }
    objc_storeStrong((id *)&v11->_originatingQuery, a4);
    objc_storeStrong((id *)&v11->_threadScope, a5);
    v15 = v11->_messages;
    v16 = [(id)objc_opt_class() _dateSortDescriptors];
    [(NSMutableArray *)v15 sortUsingDescriptors:v16];

    [(EMInMemoryThread *)v11 _recalculateDisplayMessage];
    v17 = [(NSMutableArray *)v11->_messages firstObject];
    uint64_t v18 = [v17 conversationID];

    if (!v18)
    {
      v19 = +[EMInMemoryThread log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [(NSMutableArray *)v11->_messages firstObject];
        v21 = objc_msgSend(v20, "ef_publicDescription");
        -[EMInMemoryThread initWithMessages:originatingQuery:threadScope:](v21, buf, v19, v20);
      }
    }
    v22 = [[EMThreadObjectID alloc] initWithConversationID:v18 threadScope:v11->_threadScope];
    uint64_t v23 = [(EMInMemoryThread *)v11 _createThreadWithObjectID:v22];
    thread = v11->_thread;
    v11->_thread = (EMThread *)v23;
  }
  v25 = v11;
LABEL_10:

  return v25;
}

uint64_t __66__EMInMemoryThread_initWithMessages_originatingQuery_threadScope___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 deleted] ^ 1;

  return v3;
}

- (id)_createThreadWithObjectID:(id)a3
{
  id v4 = a3;
  v5 = [(EMInMemoryThread *)self displayMessage];
  v6 = [(EMInMemoryThread *)self newestMessage];
  v7 = [EMThread alloc];
  id v8 = [(EMInMemoryThread *)self originatingQuery];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__EMInMemoryThread__createThreadWithObjectID___block_invoke;
  v14[3] = &unk_1E63E3860;
  id v9 = v6;
  id v15 = v9;
  v16 = self;
  id v10 = v5;
  id v17 = v10;
  id v11 = v4;
  id v18 = v11;
  v12 = [(EMThread *)v7 initWithObjectID:v11 originatingQuery:v8 builder:v14];

  return v12;
}

void __46__EMInMemoryThread__createThreadWithObjectID___block_invoke(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] date];
  [v3 setDate:v4];

  v5 = [a1[5] _newestDisplayDate];
  [v3 setDisplayDate:v5];

  v6 = [a1[5] _combinedReadLater];
  [v3 setReadLater:v6];

  v7 = [a1[6] subject];
  [v3 setSubject:v7];

  id v8 = [a1[6] summary];
  [v3 setSummary:v8];

  id v9 = [a1[5] _combinedSenderList];
  [v3 setSenderList:v9];

  id v10 = [a1[5] _combinedToList];
  [v3 setToList:v10];

  id v11 = [a1[5] _combinedCCList];
  [v3 setCcList:v11];

  v12 = [a1[5] _combinedFlags];
  [v3 setFlags:v12];

  objc_msgSend(v3, "setHasUnflagged:", objc_msgSend(a1[5], "_combinedHasUnflagged"));
  uint64_t v13 = [a1[5] _combinedFlagColors];
  [v3 setFlagColors:v13];

  objc_msgSend(v3, "setIsVIP:", objc_msgSend(a1[5], "_combinedIsVIP"));
  objc_msgSend(v3, "setIsBlocked:", objc_msgSend(a1[5], "_combinedIsBlocked"));
  objc_msgSend(v3, "setUnsubscribeType:", objc_msgSend(a1[6], "unsubscribeType"));
  objc_msgSend(v3, "setHasAttachments:", objc_msgSend(a1[5], "_combinedHasAttachments"));
  objc_msgSend(v3, "setIsAuthenticated:", objc_msgSend(a1[6], "isAuthenticated"));
  objc_msgSend(v3, "setAllowAuthenticationWarning:", objc_msgSend(a1[6], "allowAuthenticationWarning"));
  objc_msgSend(v3, "setConversationNotificationLevel:", objc_msgSend(a1[6], "conversationNotificationLevel"));
  objc_msgSend(v3, "setCount:", objc_msgSend(*((id *)a1[5] + 1), "count"));
  v14 = [a1[5] _combinedMailboxes];
  [v3 setMailboxes:v14];

  id v15 = [a1[6] itemID];
  [v3 setDisplayMessageItemID:v15];

  v16 = [a1[6] followUp];
  [v3 setFollowUp:v16];

  id v17 = [a1[6] brandIndicatorLocation];
  [v3 setBrandIndicatorLocation:v17];

  id v18 = [a1[4] generatedSummary];
  [v3 setGeneratedSummary:v18];

  v19 = [a1[6] category];
  [v3 setCategory:v19];

  v20 = [a1[6] businessLogoID];
  [v3 setBusinessLogoID:v20];

  v21 = [v3 category];

  if (!v21)
  {
    v22 = +[EMInMemoryThread log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(a1[7], "ef_publicDescription");
      __46__EMInMemoryThread__createThreadWithObjectID___block_invoke_cold_1(v23, v24, v22);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [EMInMemoryThread alloc];
  messages = self->_messages;
  v6 = [(EMInMemoryThread *)self originatingQuery];
  v7 = [(EMInMemoryThread *)v4 initWithMessages:messages originatingQuery:v6 threadScope:self->_threadScope];

  return v7;
}

- (EMMessageListItem)messageListItem
{
  v2 = [(EMInMemoryThread *)self thread];
  return (EMMessageListItem *)v2;
}

- (NSArray)messages
{
  v2 = (void *)[(NSMutableArray *)self->_messages copy];
  return (NSArray *)v2;
}

- (EMMessage)newestMessage
{
  return (EMMessage *)[(NSMutableArray *)self->_messages firstObject];
}

- (EMMessage)oldestMessage
{
  return (EMMessage *)[(NSMutableArray *)self->_messages lastObject];
}

- (id)addMessages:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ef_filter:", &__block_literal_global_7);

  [(EMInMemoryThread *)self _addMessagesToThread:v5];
  [(EMInMemoryThread *)self _recalculateDisplayMessage];
  v6 = [(EMInMemoryThread *)self _calculateAndApplyChange];

  return v6;
}

uint64_t __32__EMInMemoryThread_addMessages___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 deleted] ^ 1;

  return v3;
}

- (void)_addMessagesToThread:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() _dateSortDescriptors];
  v6 = EFComparatorFromSortDescriptors();

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableArray ef_insertObjectIfAbsent:usingComparator:](self->_messages, "ef_insertObjectIfAbsent:usingComparator:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), v6, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)changeMessages:(id)a3 forKeyPaths:(id)a4 threadIsEmpty:(BOOL *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v23 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22 = self;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v16 = [v15 flags];
        int v17 = [v16 deleted];

        if (v17) {
          id v18 = v9;
        }
        else {
          id v18 = v10;
        }
        [v18 addObject:v15];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  v19 = +[EMMessageListItemChange changesForKeyPaths:v23 ofItems:v10];
  v20 = [(EMInMemoryThread *)v22 _calculateChangesAfterRemovingMessages:v9 applyingChanges:v19 threadIsEmpty:a5];

  return v20;
}

- (id)removeMessages:(id)a3 threadIsEmpty:(BOOL *)a4
{
  id v4 = [(EMInMemoryThread *)self _calculateChangesAfterRemovingMessages:a3 applyingChanges:0 threadIsEmpty:a4];
  return v4;
}

- (id)updateMessage:(id)a3 fromOldObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EMInMemoryThread *)self thread];
  id v9 = [v8 displayMessageItemID];
  id v10 = [v6 itemID];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    uint64_t v12 = objc_alloc_init(EMMessageListItemChange);
    uint64_t v13 = [v6 objectID];
    long long v14 = [v13 collectionItemID];
    [(EMMessageListItemChange *)v12 setDisplayMessageItemID:v14];

    id v15 = v12;
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = [(EMInMemoryThread *)self messages];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__EMInMemoryThread_updateMessage_fromOldObjectID___block_invoke;
  v20[3] = &unk_1E63E3888;
  id v17 = v7;
  id v21 = v17;
  v22 = self;
  id v18 = v6;
  id v23 = v18;
  [v16 enumerateObjectsUsingBlock:v20];

  return v15;
}

void __50__EMInMemoryThread_updateMessage_fromOldObjectID___block_invoke(void *a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectID];
  int v5 = [v4 isEqual:a1[4]];

  if (v5)
  {
    char v12 = 0;
    id v6 = (void *)a1[5];
    v14[0] = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v8 = (id)[v6 removeMessages:v7 threadIsEmpty:&v12];

    id v9 = (void *)a1[5];
    uint64_t v13 = a1[6];
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    id v11 = (id)[v9 addMessages:v10];
  }
}

- (id)_calculateChangesAfterRemovingMessages:(id)a3 applyingChanges:(id)a4 threadIsEmpty:(BOOL *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v20 = v8;
  if ([v8 count]) {
    [(NSMutableArray *)self->_messages removeObjectsInArray:v8];
  }
  if ([v9 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = self->_messages;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v15 = [v14 objectID];
          uint64_t v16 = [v9 objectForKeyedSubscript:v15];

          if (v16) {
            [v16 applyToMessageListItem:v14];
          }
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
  [(EMInMemoryThread *)self _recalculateDisplayMessage];
  id v17 = [(EMInMemoryThread *)self _calculateAndApplyChange];
  if (a5)
  {
    id v18 = [(EMInMemoryThread *)self thread];
    *a5 = [v18 count] == 0;
  }
  return v17;
}

- (id)_calculateAndApplyChange
{
  id v3 = [(EMInMemoryThread *)self thread];
  id v4 = [v3 objectID];
  int v5 = [(EMInMemoryThread *)self _createThreadWithObjectID:v4];

  id v6 = [(EMInMemoryThread *)self thread];
  id v7 = +[EMMessageListItemChange changeFrom:v6 to:v5];

  if (v7)
  {
    [(EMInMemoryThread *)self setThread:v5];
    id v8 = v7;
  }

  return v7;
}

+ (id)_dateSortDescriptors
{
  if (_dateSortDescriptors_onceToken != -1) {
    dispatch_once(&_dateSortDescriptors_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)_dateSortDescriptors_sDateSortDescriptors;
  return v2;
}

void __40__EMInMemoryThread__dateSortDescriptors__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = +[EMMessageListItemPredicates sortDescriptorForDateAscending:0];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  v2 = (void *)_dateSortDescriptors_sDateSortDescriptors;
  _dateSortDescriptors_sDateSortDescriptors = v1;
}

- (BOOL)_isSortedByDate:(id)a3
{
  id v3 = [a3 firstObject];
  id v4 = [v3 key];
  int v5 = [(id)objc_opt_class() _dateSortDescriptors];
  id v6 = [v5 firstObject];
  id v7 = [v6 key];
  char v8 = [v4 isEqualToString:v7];

  return v8;
}

- (id)_combinedReadLater
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = self->_messages;
  id v3 = (EMReadLater *)[(NSMutableArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3) {
    goto LABEL_14;
  }
  id v4 = 0;
  uint64_t v5 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v3; uint64_t i = (EMReadLater *)((char *)i + 1))
    {
      if (*(void *)v17 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      char v8 = objc_msgSend(v7, "readLater", (void)v16);
      BOOL v9 = v8 == 0;

      if (!v9)
      {
        if (!v4
          || ([v7 readLater],
              id v10 = objc_claimAutoreleasedReturnValue(),
              [v10 date],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
              int v12 = [(NSMutableArray *)v4 ef_isLaterThanDate:v11],
              v11,
              v10,
              v12))
        {
          uint64_t v13 = [v7 readLater];
          uint64_t v14 = [v13 date];

          id v4 = (NSMutableArray *)v14;
        }
      }
    }
    id v3 = (EMReadLater *)[(NSMutableArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v3);

  if (v4)
  {
    id v3 = [[EMReadLater alloc] initWithDate:v4];
    v2 = v4;
LABEL_14:

    goto LABEL_16;
  }
  id v3 = 0;
LABEL_16:
  return v3;
}

- (id)_combinedSenderList
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v4 = [(EMInMemoryThread *)self displayMessage];
  uint64_t v5 = [v4 senderList];
  [v3 addObjectsFromArray:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_messages;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v10 != v4)
        {
          uint64_t v11 = objc_msgSend(v10, "senderList", (void)v14);
          [v3 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  int v12 = [v3 array];

  return v12;
}

- (id)_combinedToList
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_messages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "toList", (void)v11);
        [v3 addObjectsFromArray:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  BOOL v9 = [v3 array];

  return v9;
}

- (id)_combinedCCList
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_messages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "ccList", (void)v11);
        [v3 addObjectsFromArray:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  BOOL v9 = [v3 array];

  return v9;
}

- (id)_combinedFlags
{
  return +[EMMessage combinedFlagsForMessageListItems:self->_messages];
}

- (BOOL)_combinedHasUnflagged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_messages;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "hasUnflagged", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_combinedFlagColors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_combinedFlagColors_onceToken != -1) {
    dispatch_once(&_combinedFlagColors_onceToken, &__block_literal_global_19);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_messages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v4);
      }
      long long v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "flagColors", (void)v12);
      [v3 addIndexes:v8];

      if ([v3 containsIndexes:_combinedFlagColors_sAllFlagColors]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if ([v3 count]) {
    long long v9 = v3;
  }
  else {
    long long v9 = 0;
  }
  id v10 = v9;

  return v10;
}

void __39__EMInMemoryThread__combinedFlagColors__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, 7);
  uint64_t v1 = (void *)_combinedFlagColors_sAllFlagColors;
  _combinedFlagColors_sAllFlagColors = v0;
}

- (BOOL)_combinedIsVIP
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_messages;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isVIP", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_combinedIsBlocked
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_messages;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isBlocked", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_combinedHasAttachments
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_messages;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "hasAttachments", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_newestDisplayDate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_messages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v9 = objc_msgSend(v8, "displayDate", (void)v13);
        int v10 = objc_msgSend(v9, "ef_isLaterThanDate:", v3);

        if (v10)
        {
          uint64_t v11 = [v8 displayDate];

          uint64_t v3 = (void *)v11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)_combinedMailboxes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_messages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "mailboxes", (void)v11);
        [v3 addObjectsFromArray:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  long long v9 = [v3 array];

  return v9;
}

- (void)_recalculateDisplayMessage
{
  uint64_t v3 = [(NSMutableArray *)self->_messages indexOfObjectPassingTest:&__block_literal_global_25];
  if (v3)
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_messages lastObject];
    }
    else {
    id v4 = [(NSMutableArray *)self->_messages objectAtIndexedSubscript:v3 - 1];
    }
    -[EMInMemoryThread setDisplayMessage:](self, "setDisplayMessage:");
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_messages firstObject];
    -[EMInMemoryThread setDisplayMessage:](self, "setDisplayMessage:");
  }
}

uint64_t __46__EMInMemoryThread__recalculateDisplayMessage__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 read];

  return v3;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EMInMemoryThread *)self thread];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> conversationID:%lld", v4, self, objc_msgSend(v5, "conversationID")];

  return (NSString *)v6;
}

- (EMThread)thread
{
  return self->_thread;
}

- (void)setThread:(id)a3
{
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EMQuery)originatingQuery
{
  return self->_originatingQuery;
}

- (EMMessage)displayMessage
{
  return self->_displayMessage;
}

- (void)setDisplayMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_originatingQuery, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

- (void)initWithMessages:(os_log_t)log originatingQuery:(void *)a4 threadScope:.cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Message %{public}@ had conversationID 0", buf, 0xCu);
}

void __46__EMInMemoryThread__createThreadWithObjectID___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Attempting to transform thread %{public}@ with no category", buf, 0xCu);
}

@end