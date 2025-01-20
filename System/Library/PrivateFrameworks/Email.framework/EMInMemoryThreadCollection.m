@interface EMInMemoryThreadCollection
+ (id)_comparatorForInThreadProxiesWithSortDescriptors:(id)a3 sectionComparator:(id)a4;
+ (uint64_t)_comparisonForSortDescriptor:(void *)a3 value1:(void *)a4 value2:;
+ (uint64_t)_sectionIndexForThread:(void *)a3 sectionPredicates:(void *)a4 sectionIdentifier:;
- (BOOL)_didMergeInThreads:(BOOL)a1;
- (BOOL)_hasLoaded;
- (BOOL)_mergeInThreads:(unsigned int)a3 forMove:;
- (BOOL)_updateOldestThreadsForMailboxes:(void *)a1;
- (BOOL)_updateSectionForThread:(void *)a1;
- (BOOL)limitedCache;
- (BOOL)removeThreadProxies:(id)a3 forMove:(BOOL)a4;
- (EFAssertableScheduler)scheduler;
- (EFLazyCache)inMemoryThreadCache;
- (EFOrderedDictionary)sectionPredicates;
- (EMInMemoryThread)_createInMemoryThreadForConversationID:(EMInMemoryThread *)a1;
- (EMInMemoryThread)_createInMemoryThreadForConversationID:(void *)a3 messages:(int)a4 cacheResults:;
- (EMInMemoryThreadCollection)initWithQuery:(id)a3 mailboxTypeResolver:(id)a4 dataSource:(id)a5 delgate:(id)a6 scheduler:(id)a7 logClient:(id)a8 limitedCache:(BOOL)a9;
- (EMInMemoryThreadCollectionDataSource)dataSource;
- (EMInMemoryThreadCollectionDelegate)delegate;
- (EMMailboxTypeResolver)mailboxTypeResolver;
- (EMQuery)query;
- (EMThreadScope)threadScope;
- (OS_os_log)logClient;
- (id)_inMemoryThreadForConversationID:(uint64_t)a1;
- (id)_inMemoryThreadsForObjectIDs:(char)a3 cacheResults:;
- (id)_messagesByConversationIDForMessages:(void *)a1;
- (id)_updateThreadProxy:(unsigned char *)a3 threadIsEmpty:(void *)a4 thread:;
- (id)comparator;
- (id)itemIDs;
- (id)messageListItemForObjectID:(id)a3 error:(id *)a4;
- (id)messagesForThread:(id)a3;
- (id)sectionIdentifierForThreadObjectID:(id)a3;
- (id)threadsAndMessagesForObjectIDs:(id)a3;
- (int64_t)dateSortOrder;
- (uint64_t)_messageListItemChangeAffectsSorting:(void *)a1;
- (uint64_t)_removeThreadProxies:(char)a3 forMove:;
- (uint64_t)_sectionIndexForThread:(void *)a3 sectionIdentifier:;
- (uint64_t)_threadsWereDeleted;
- (uint64_t)_updateCurrentOldestThreadWithThreadIfApplicable:(void *)a3 forMailbox:;
- (void)_notifyObserverOfOldestThreadsByMailboxObjectIDs;
- (void)_nts_conversationIDDidChangeForMessages:(uint64_t)a3 fromConversationID:;
- (void)_nts_conversationNotificationLevelDidChangeForConversation:(uint64_t)a3 conversationID:;
- (void)_nts_initializeOldestThreadsByMailbox;
- (void)_nts_messagesWereAdded:(void *)a1;
- (void)_nts_messagesWereChanged:(void *)a3 forKeyPaths:(char)a4 deleted:;
- (void)_nts_objectIDDidChangeForMessage:(void *)a3 oldObjectID:(uint64_t)a4 oldConversationID:;
- (void)clearForRecovery;
- (void)clearInMemoryThreadCache;
- (void)clearOldestThreadsByMailboxObjectIDs;
- (void)conversationIDDidChangeForMessages:(id)a3 fromConversationID:(int64_t)a4;
- (void)conversationNotificationLevelDidChangeForConversation:(int64_t)a3 conversationID:(int64_t)a4;
- (void)enumerateObjectIDsInBatchesOfSize:(unint64_t)a3 block:(id)a4;
- (void)initializeOldestThreadsByMailbox;
- (void)messagesWereAdded:(id)a3;
- (void)messagesWereChanged:(id)a3 forKeyPaths:(id)a4 deleted:(BOOL)a5;
- (void)notifyObserverOfOldestThreadsByMailboxObjectIDs;
- (void)objectIDDidChangeForMessage:(id)a3 oldObjectID:(id)a4 oldConversationID:(int64_t)a5;
- (void)performBlockOnSchedulerIfNecessary:(id)a3;
- (void)setLimitedCache:(BOOL)a3;
- (void)setLogClient:(id)a3;
@end

@implementation EMInMemoryThreadCollection

- (EMInMemoryThreadCollection)initWithQuery:(id)a3 mailboxTypeResolver:(id)a4 dataSource:(id)a5 delgate:(id)a6 scheduler:(id)a7 logClient:(id)a8 limitedCache:(BOOL)a9
{
  id v15 = a3;
  id v61 = a4;
  id obj = a5;
  id v16 = a6;
  id v59 = a7;
  id v58 = a8;
  v65.receiver = self;
  v65.super_class = (Class)EMInMemoryThreadCollection;
  v17 = [(EMInMemoryThreadCollection *)&v65 init];
  v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v15 copy];
    query = v17->_query;
    v17->_query = (EMQuery *)v19;

    v21 = [v15 predicate];
    uint64_t v22 = +[EMMessageListItemPredicates threadScopeForPredicate:v21 withMailboxTypeResolver:v61];
    threadScope = v17->_threadScope;
    v17->_threadScope = (EMThreadScope *)v22;

    v24 = [v15 targetClassOptions];
    uint64_t v25 = [v24 objectForKeyedSubscript:@"SectionPredicates"];
    sectionPredicates = v17->_sectionPredicates;
    v17->_sectionPredicates = (EFOrderedDictionary *)v25;

    [(EFOrderedDictionary *)v17->_sectionPredicates enumerateKeysAndObjectsUsingBlock:&__block_literal_global_19];
    objc_storeStrong((id *)&v17->_mailboxTypeResolver, a4);
    objc_storeWeak((id *)&v17->_dataSource, obj);
    objc_storeWeak((id *)&v17->_delegate, v16);
    objc_storeStrong((id *)&v17->_scheduler, a7);
    objc_storeStrong((id *)&v17->_logClient, a8);
    v17->_threadsLock._os_unfair_lock_opaque = 0;
    v27 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    conversationIDs = v17->_conversationIDs;
    v17->_conversationIDs = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    threadsByConversationID = v17->_threadsByConversationID;
    v17->_threadsByConversationID = v29;

    v31 = [(EMQuery *)v17->_query sortDescriptors];
    v17->_dateSortOrder = +[EMMessageListItemPredicates dateSortOrderFromSortDescriptors:v31];

    v17->_limitedCache = a9;
    id v32 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v33 = objc_alloc_init(_EMInMemoryThreadCollectionOldestThreadsState);
    uint64_t v34 = [v32 initWithObject:v33];
    oldestThreadsByMailboxObjectIDs = v18->_oldestThreadsByMailboxObjectIDs;
    v18->_oldestThreadsByMailboxObjectIDs = (EFLocked *)v34;

    id v36 = objc_alloc(MEMORY[0x1E4F60D88]);
    if (v18->_limitedCache) {
      uint64_t v37 = 500;
    }
    else {
      uint64_t v37 = 0;
    }
    uint64_t v38 = [v36 initWithCountLimit:v37];
    inMemoryThreadCache = v18->_inMemoryThreadCache;
    v18->_inMemoryThreadCache = (EFLazyCache *)v38;

    if (!v18->_limitedCache
      || ([(EMInMemoryThreadCollection *)v18 query],
          v40 = objc_claimAutoreleasedReturnValue(),
          char v41 = [v40 queryOptions],
          v40,
          (v41 & 0x20) != 0))
    {
      uint64_t v42 = objc_opt_new();
      inMemoryThreadsByConversationID = v18->_inMemoryThreadsByConversationID;
      v18->_inMemoryThreadsByConversationID = (NSMutableDictionary *)v42;
    }
    v44 = [(EMInMemoryThreadCollection *)v18 query];
    char v45 = [v44 queryOptions];

    if (v45)
    {
      uint64_t v46 = objc_opt_new();
      mailboxesByConversationID = v18->_mailboxesByConversationID;
      v18->_mailboxesByConversationID = (NSMutableDictionary *)v46;
    }
    if (v18->_sectionPredicates)
    {
      id v48 = objc_alloc(MEMORY[0x1E4F60DA0]);
      v49 = objc_opt_new();
      uint64_t v50 = [v48 initWithObject:v49];
      sectionIndexesByConversationID = v18->_sectionIndexesByConversationID;
      v18->_sectionIndexesByConversationID = (EFLocked *)v50;

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v18);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __116__EMInMemoryThreadCollection_initWithQuery_mailboxTypeResolver_dataSource_delgate_scheduler_logClient_limitedCache___block_invoke_2;
      v62[3] = &unk_1E63E3918;
      objc_copyWeak(&v63, &location);
      v52 = (void *)MEMORY[0x1C18A2160](v62);
      objc_destroyWeak(&v63);
      objc_destroyWeak(&location);
    }
    else
    {
      v52 = 0;
    }
    v53 = objc_opt_class();
    v54 = [v15 sortDescriptors];
    uint64_t v55 = [v53 _comparatorForInThreadProxiesWithSortDescriptors:v54 sectionComparator:v52];
    id comparator = v18->_comparator;
    v18->_id comparator = (id)v55;
  }
  return v18;
}

uint64_t __116__EMInMemoryThreadCollection_initWithQuery_mailboxTypeResolver_dataSource_delgate_scheduler_logClient_limitedCache___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 allowEvaluation];
}

uint64_t __116__EMInMemoryThreadCollection_initWithQuery_mailboxTypeResolver_dataSource_delgate_scheduler_logClient_limitedCache___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained scheduler];
    [v9 assertIsExecuting:1];

    uint64_t v31 = 0;
    id v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    id v36 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    id v30 = 0;
    v10 = (void *)v8[6];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __116__EMInMemoryThreadCollection_initWithQuery_mailboxTypeResolver_dataSource_delgate_scheduler_logClient_limitedCache___block_invoke_16;
    v20 = &unk_1E63E38F0;
    v23 = &v31;
    id v21 = v5;
    v24 = &v25;
    id v22 = v6;
    [v10 performWhileLocked:&v17];
    v11 = (void *)v32[5];
    if (v11) {
      unint64_t v12 = objc_msgSend(v11, "unsignedIntegerValue", v17, v18, v19, v20, v21);
    }
    else {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v14 = (void *)v26[5];
    if (v14) {
      unint64_t v15 = [v14 unsignedIntegerValue];
    }
    else {
      unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v12 == v15)
    {
      uint64_t v13 = 0;
    }
    else if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = -1;
      if (v15 != 0x7FFFFFFFFFFFFFFFLL && v12 >= v15) {
        uint64_t v13 = 1;
      }
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __116__EMInMemoryThreadCollection_initWithQuery_mailboxTypeResolver_dataSource_delgate_scheduler_logClient_limitedCache___block_invoke_16(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "conversationID"));
  uint64_t v4 = [v11 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  uint64_t v8 = [v11 objectForKeyedSubscript:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)_comparatorForInThreadProxiesWithSortDescriptors:(id)a3 sectionComparator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__EMInMemoryThreadCollection__comparatorForInThreadProxiesWithSortDescriptors_sectionComparator___block_invoke;
  v17[3] = &unk_1E63E3940;
  id v9 = v7;
  id v18 = v9;
  id v19 = a1;
  SEL v20 = a2;
  uint64_t v10 = MEMORY[0x1C18A2160](v17);
  id v11 = (void *)v10;
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__EMInMemoryThreadCollection__comparatorForInThreadProxiesWithSortDescriptors_sectionComparator___block_invoke_2;
    v14[3] = &unk_1E63E3968;
    id v15 = v8;
    id v16 = v11;
    unint64_t v12 = (void *)MEMORY[0x1C18A2160](v14);
  }
  else
  {
    unint64_t v12 = (void *)MEMORY[0x1C18A2160](v10);
  }

  return v12;
}

uint64_t __97__EMInMemoryThreadCollection__comparatorForInThreadProxiesWithSortDescriptors_sectionComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![*(id *)(a1 + 32) count]) {
    goto LABEL_3;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) firstObject];
  id v9 = [v5 primarySortValue];
  uint64_t v10 = [v6 primarySortValue];
  uint64_t v11 = +[EMInMemoryThreadCollection _comparisonForSortDescriptor:value1:value2:](v7, v8, v9, v10);

  if (!v11)
  {
LABEL_3:
    if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
    {
      unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"EMInMemoryThreadCollection.m" lineNumber:144 description:@"Multiple sort descriptors is unexpected"];
    }
    uint64_t v13 = [v5 objectID];
    uint64_t v14 = [v13 conversationID];
    id v15 = [v6 objectID];
    if (v14 < [v15 conversationID]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = -1;
    }
  }
  return v11;
}

+ (uint64_t)_comparisonForSortDescriptor:(void *)a3 value1:(void *)a4 value2:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  id v9 = [v6 key];
  if ([v9 isEqualToString:@"subject"])
  {
    uint64_t v10 = [v7 compare:v8 options:65];
LABEL_5:
    v25[3] = v10;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v7 localizedCaseInsensitiveCompare:v8];
    goto LABEL_5;
  }
  if (([v9 isEqualToString:@"toList"] & 1) == 0
    && ![v9 isEqualToString:@"senderList.emailAddressValue.displayName"])
  {
    uint64_t v10 = [v7 compare:v8];
    goto LABEL_5;
  }
  id v14 = v7;
  id v15 = v8;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  SEL v20 = __73__EMInMemoryThreadCollection__comparisonForSortDescriptor_value1_value2___block_invoke;
  id v21 = &unk_1E63E3990;
  id v16 = v15;
  id v22 = v16;
  v23 = &v24;
  [v14 enumerateObjectsUsingBlock:&v18];
  if (!v25[3])
  {
    unint64_t v17 = objc_msgSend(v16, "count", v18, v19, v20, v21);
    if (v17 > [v14 count]) {
      v25[3] = 1;
    }
  }

LABEL_6:
  char v11 = objc_msgSend(v6, "ascending", v18, v19, v20, v21);
  uint64_t v12 = v25[3];
  if ((v11 & 1) == 0 && v12)
  {
    if (v12 == -1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
    v25[3] = v12;
  }

  _Block_object_dispose(&v24, 8);
  return v12;
}

uint64_t __97__EMInMemoryThreadCollection__comparatorForInThreadProxiesWithSortDescriptors_sectionComparator___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!v7) {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v7;
}

void __73__EMInMemoryThreadCollection__comparisonForSortDescriptor_value1_value2___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    *a4 = 1;
  }
  else
  {
    id v7 = v19;
    id v8 = [v7 emailAddressValue];
    id v9 = [v8 displayName];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 stringValue];
    }
    uint64_t v12 = v11;

    id v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    id v14 = [v13 emailAddressValue];
    id v15 = [v14 displayName];
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [v13 stringValue];
    }
    uint64_t v18 = v17;

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v12 localizedCaseInsensitiveCompare:v18];
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (void)enumerateObjectIDsInBatchesOfSize:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [(EMInMemoryThreadCollection *)self scheduler];
  [v7 assertIsExecuting:1];

  id v8 = [(NSMutableOrderedSet *)self->_conversationIDs array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke;
  v10[3] = &unk_1E63E39E0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  objc_msgSend(v8, "ef_enumerateObjectsInBatchesOfSize:block:", a3, v10);
}

void __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_lock(v4);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke_2;
  v6[3] = &unk_1E63E39B8;
  v6[4] = *(void *)(a1 + 32);
  id v5 = objc_msgSend(v3, "ef_compactMap:", v6);
  os_unfair_lock_unlock(v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __70__EMInMemoryThreadCollection_enumerateObjectIDsInBatchesOfSize_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:a2];
  id v3 = [v2 objectID];

  return v3;
}

- (id)_messagesByConversationIDForMessages:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    a1 = objc_msgSend(v3, "ef_groupBy:", &__block_literal_global_31);
  }

  return a1;
}

id __67__EMInMemoryThreadCollection__messagesByConversationIDForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "conversationID"));

  return v3;
}

- (id)_inMemoryThreadsForObjectIDs:(char)a3 cacheResults:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  if (a1)
  {
    id v5 = objc_opt_new();
    char v21 = a3;
    v23 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = v22;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "conversationID"));
          id v11 = [a1 inMemoryThreadCache];
          uint64_t v12 = [v11 cachedObjectForKey:v10];

          if (v12) {
            [v5 addObject:v12];
          }
          else {
            [v23 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v7);
    }

    if ([v23 count])
    {
      id v13 = [a1 logClient];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v33 = a1;
        __int16 v34 = 2114;
        uint64_t v35 = (uint64_t)v23;
        _os_log_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEFAULT, "%p: Fetching messages for %{public}@", buf, 0x16u);
      }

      id v14 = [a1 dataSource];
      id v15 = [v14 collection:a1 messagesInConversationIDs:v23 limit:0x7FFFFFFFFFFFFFFFLL];

      id v16 = -[EMInMemoryThreadCollection _messagesByConversationIDForMessages:](a1, v15);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __72__EMInMemoryThreadCollection__inMemoryThreadsForObjectIDs_cacheResults___block_invoke;
      v24[3] = &unk_1E63E3A28;
      id v25 = v5;
      uint64_t v26 = a1;
      char v27 = v21;
      [v16 enumerateKeysAndObjectsUsingBlock:v24];
      id v17 = [a1 logClient];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v15 count];
        uint64_t v19 = [v16 count];
        *(_DWORD *)buf = 134218496;
        uint64_t v33 = a1;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        __int16 v36 = 2048;
        uint64_t v37 = v19;
        _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_DEFAULT, "%p: Fetched %lu messages for %lu threads", buf, 0x20u);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __72__EMInMemoryThreadCollection__inMemoryThreadsForObjectIDs_cacheResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = -[EMInMemoryThreadCollection _createInMemoryThreadForConversationID:messages:cacheResults:](*(void **)(a1 + 40), [v8 longLongValue], v5, *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v6, "ef_addOptionalObject:", v7);
}

- (EMInMemoryThread)_createInMemoryThreadForConversationID:(void *)a3 messages:(int)a4 cacheResults:
{
  id v7 = a3;
  if (a1)
  {
    id v8 = [EMInMemoryThread alloc];
    id v9 = [a1 query];
    uint64_t v10 = [a1 threadScope];
    id v11 = [(EMInMemoryThread *)v8 initWithMessages:v7 originatingQuery:v9 threadScope:v10];

    if (v11 && a4)
    {
      uint64_t v12 = [a1 inMemoryThreadCache];
      id v13 = [NSNumber numberWithLongLong:a2];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __91__EMInMemoryThreadCollection__createInMemoryThreadForConversationID_messages_cacheResults___block_invoke;
      v17[3] = &unk_1E63E3AC0;
      void v17[4] = a1;
      uint64_t v19 = a2;
      id v14 = v11;
      uint64_t v18 = v14;
      id v15 = (id)[v12 objectForKey:v13 generator:v17];

      id v11 = v14;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)messageListItemForObjectID:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      uint64_t v12 = 0;
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  uint64_t v7 = [v6 conversationID];
  id v8 = [NSNumber numberWithLongLong:v7];
  if (self->_inMemoryThreadsByConversationID)
  {
    os_unfair_lock_lock(&self->_threadsLock);
    inMemoryThreadsByConversationID = self->_inMemoryThreadsByConversationID;
    uint64_t v10 = [NSNumber numberWithLongLong:v7];
    id v11 = [(NSMutableDictionary *)inMemoryThreadsByConversationID objectForKeyedSubscript:v10];

    os_unfair_lock_unlock(&self->_threadsLock);
  }
  else
  {
    id v13 = [(EMInMemoryThreadCollection *)self inMemoryThreadCache];
    id v11 = [v13 cachedObjectForKey:v8];

    if (v11)
    {
      id v14 = [(EMInMemoryThreadCollection *)self logClient];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v35 = self;
        __int16 v36 = 2114;
        uint64_t v37 = v8;
        _os_log_impl(&dword_1BEFDB000, v14, OS_LOG_TYPE_DEFAULT, "%p: Fetched messageListItem for %{public}@ from cache", buf, 0x16u);
      }
    }
    else
    {
      os_unfair_lock_lock(&self->_threadsLock);
      unint64_t v15 = [(NSMutableOrderedSet *)self->_conversationIDs indexOfObject:v8];
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v16 = 0;
      }
      else
      {
        uint64_t v17 = [(NSMutableOrderedSet *)self->_conversationIDs count];
        conversationIDs = self->_conversationIDs;
        id v19 = objc_alloc(MEMORY[0x1E4F28D60]);
        if (v15 >= 0xE) {
          unint64_t v20 = v15 - 14;
        }
        else {
          unint64_t v20 = 0;
        }
        uint64_t v21 = 14;
        if (v15 < 0xE) {
          uint64_t v21 = v15;
        }
        uint64_t v22 = v17 - v15;
        if (v17 - v15 >= 0xF) {
          uint64_t v22 = 15;
        }
        v23 = objc_msgSend(v19, "initWithIndexesInRange:", v20, v22 + v21);
        uint64_t v24 = [(NSMutableOrderedSet *)conversationIDs objectsAtIndexes:v23];

        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke;
        v33[3] = &unk_1E63E3A50;
        v33[4] = self;
        id v16 = objc_msgSend(v24, "ef_compactMap:", v33);
      }
      os_unfair_lock_unlock(&self->_threadsLock);
      if ([v16 count])
      {
        id v25 = -[EMInMemoryThreadCollection _inMemoryThreadsForObjectIDs:cacheResults:](self, v16, 1);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke_2;
        v32[3] = &__block_descriptor_40_e26_B16__0__EMInMemoryThread_8l;
        v32[4] = v7;
        id v11 = objc_msgSend(v25, "ef_firstObjectPassingTest:", v32);
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  uint64_t v12 = [v11 messageListItem];
  p_threadsLock = &self->_threadsLock;
  os_unfair_lock_lock(&self->_threadsLock);
  char v27 = [(NSMutableDictionary *)self->_threadsByConversationID objectForKeyedSubscript:v8];
  long long v28 = [v11 thread];
  long long v29 = [(EMInMemoryThreadCollection *)self query];
  [v27 updateFromThread:v28 addingAdditionalInformation:1 query:v29];

  os_unfair_lock_unlock(p_threadsLock);
  if (a4)
  {
    if (v12)
    {
      id v30 = 0;
LABEL_28:
      *a4 = v30;
      goto LABEL_29;
    }
LABEL_27:
    objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", v6);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = 0;
    goto LABEL_28;
  }
LABEL_29:

  return v12;
}

id __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 integerValue])
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v3];
    id v5 = [v4 objectID];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

BOOL __63__EMInMemoryThreadCollection_messageListItemForObjectID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 thread];
  BOOL v4 = [v3 conversationID] == *(void *)(a1 + 32);

  return v4;
}

- (id)threadsAndMessagesForObjectIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = -[EMInMemoryThreadCollection _inMemoryThreadsForObjectIDs:cacheResults:](self, a3, 0);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "messages", (void)v13);
        id v11 = [v9 thread];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)messagesForThread:(id)a3
{
  id v4 = a3;
  id v5 = -[EMInMemoryThreadCollection _inMemoryThreadForConversationID:]((uint64_t)self, [v4 conversationID]);
  uint64_t v6 = [v5 messages];

  return v6;
}

- (id)_inMemoryThreadForConversationID:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__inMemoryThreadForConversationID_ object:a1 file:@"EMInMemoryThreadCollection.m" lineNumber:339 description:@"Got a conversationID of 0"];
    }
    if (*(void *)(a1 + 24))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
      id v4 = *(void **)(a1 + 24);
      id v5 = [NSNumber numberWithLongLong:a2];
      uint64_t v6 = [v4 objectForKeyedSubscript:v5];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
      if (v6) {
        goto LABEL_10;
      }
      uint64_t v7 = [(id)a1 logClient];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v13 = a1;
        __int16 v14 = 2050;
        uint64_t v15 = a2;
        _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "%p: Thread with conversation ID: %{public}lld is not present in _inMemoryThreadsByConversationID.", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v7 = [(id)a1 inMemoryThreadCache];
      id v8 = [NSNumber numberWithLongLong:a2];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __63__EMInMemoryThreadCollection__inMemoryThreadForConversationID___block_invoke;
      v11[3] = &unk_1E63E3A98;
      v11[4] = a1;
      v11[5] = a2;
      uint64_t v6 = [v7 objectForKey:v8 generator:v11];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_10:
  return v6;
}

id __63__EMInMemoryThreadCollection__inMemoryThreadForConversationID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = -[EMInMemoryThreadCollection _createInMemoryThreadForConversationID:](*(EMInMemoryThread **)(a1 + 32), *(void *)(a1 + 40));
  id v4 = [*(id *)(a1 + 32) logClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [v3 thread];
    uint64_t v7 = [v6 displayDate];
    int v9 = 134349314;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Didn't find conversationID in Cache: %{public}lld, displayDate = %@", (uint8_t *)&v9, 0x16u);
  }
  return v3;
}

- (EMInMemoryThread)_createInMemoryThreadForConversationID:(EMInMemoryThread *)a1
{
  id v2 = a1;
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = [(EMInMemoryThread *)a1 dataSource];
    uint64_t v5 = [NSNumber numberWithLongLong:a2];
    v17[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    uint64_t v7 = [v4 collection:v2 messagesInConversationIDs:v6 limit:0x7FFFFFFFFFFFFFFFLL];

    if (![v7 count])
    {
      id v8 = [(EMInMemoryThread *)v2 logClient];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134218240;
        __int16 v14 = v2;
        __int16 v15 = 2050;
        uint64_t v16 = a2;
        _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: Could not find any messages for conversation ID: %{public}lld", (uint8_t *)&v13, 0x16u);
      }
    }
    if ([v7 count])
    {
      int v9 = [EMInMemoryThread alloc];
      uint64_t v10 = [(EMInMemoryThread *)v2 query];
      __int16 v11 = [(EMInMemoryThread *)v2 threadScope];
      id v2 = [(EMInMemoryThread *)v9 initWithMessages:v7 originatingQuery:v10 threadScope:v11];
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

id __91__EMInMemoryThreadCollection__createInMemoryThreadForConversationID_messages_cacheResults___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logClient];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [*(id *)(a1 + 40) thread];
    uint64_t v5 = [v4 displayDate];
    int v8 = 134349314;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_INFO, "Caching thread for conversationID: %{public}lld displayDate = %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = *(void **)(a1 + 40);
  return v6;
}

- (BOOL)removeThreadProxies:(id)a3 forMove:(BOOL)a4
{
  return -[EMInMemoryThreadCollection _removeThreadProxies:forMove:]((uint64_t)self, a3, a4);
}

- (uint64_t)_removeThreadProxies:(char)a3 forMove:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 array];
    int v8 = objc_msgSend(v7, "ef_map:", &__block_literal_global_50);

    [*(id *)(a1 + 8) removeObjectsInArray:v8];
    uint64_t v9 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__EMInMemoryThreadCollection__removeThreadProxies_forMove___block_invoke_2;
    v12[3] = &unk_1E63E3B08;
    id v10 = v8;
    id v13 = v10;
    [v9 performWhileLocked:v12];
    if (a3)
    {
      a1 = 0;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
      [*(id *)(a1 + 16) removeObjectsForKeys:v10];
      [*(id *)(a1 + 32) removeObjectsForKeys:v10];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
      a1 = -[EMInMemoryThreadCollection _threadsWereDeleted](a1);
    }
  }
  return a1;
}

id __59__EMInMemoryThreadCollection__removeThreadProxies_forMove___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "conversationID"));

  return v3;
}

uint64_t __59__EMInMemoryThreadCollection__removeThreadProxies_forMove___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeObjectsForKeys:*(void *)(a1 + 32)];
}

- (uint64_t)_threadsWereDeleted
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (-[EMInMemoryThreadCollection _hasLoaded](a1))
    {
      uint64_t v5 = 0;
      uint64_t v6 = &v5;
      uint64_t v7 = 0x3032000000;
      int v8 = __Block_byref_object_copy__4;
      uint64_t v9 = __Block_byref_object_dispose__4;
      id v10 = (id)0xAAAAAAAAAAAAAAAALL;
      id v10 = [MEMORY[0x1E4F1CA80] set];
      id v2 = *(void **)(v1 + 40);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke;
      v4[3] = &unk_1E63E3B58;
      v4[4] = v1;
      v4[5] = &v5;
      [v2 performWhileLocked:v4];
      if ([(id)v6[5] count]) {
        uint64_t v1 = -[EMInMemoryThreadCollection _updateOldestThreadsForMailboxes:]((void *)v1, (void *)v6[5]);
      }
      else {
        uint64_t v1 = 0;
      }
      _Block_object_dispose(&v5, 8);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)_hasLoaded
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v1 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__EMInMemoryThreadCollection__hasLoaded__block_invoke;
  v4[3] = &unk_1E63E3BC8;
  v4[4] = &v5;
  [v1 performWhileLocked:v4];
  BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 oldestThreadsByMailboxObjectIDs];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke_2;
  v7[3] = &unk_1E63E3B30;
  long long v8 = *(_OWORD *)(a1 + 32);
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    uint64_t v5 = [v3 oldestThreadsByMailboxObjectIDs];
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allObjects];
    [v5 removeObjectsForKeys:v6];
  }
}

void __49__EMInMemoryThreadCollection__threadsWereDeleted__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_lock(v6);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "conversationID"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
  }
  os_unfair_lock_unlock(v6);
}

- (BOOL)_updateOldestThreadsForMailboxes:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = 2 * ([a1 dateSortOrder] == 1);
    BOOL v7 = [a1 dateSortOrder] != 0;
    long long v8 = (void *)a1[1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__EMInMemoryThreadCollection__updateOldestThreadsForMailboxes___block_invoke;
    v12[3] = &unk_1E63E3B80;
    void v12[4] = a1;
    id v9 = v5;
    id v13 = v9;
    __int16 v14 = &v16;
    BOOL v15 = v7;
    [v8 enumerateObjectsWithOptions:v6 usingBlock:v12];
    if (*((unsigned char *)v17 + 24))
    {
      -[EMInMemoryThreadCollection _notifyObserverOfOldestThreadsByMailboxObjectIDs](a1);
      BOOL v10 = *((unsigned char *)v17 + 24) != 0;
    }
    else
    {
      BOOL v10 = 0;
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __63__EMInMemoryThreadCollection__updateOldestThreadsForMailboxes___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  BOOL v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_lock(v7);
  long long v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v6];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v6];
  os_unfair_lock_unlock(v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14, (void)v15))
        {
          if (-[EMInMemoryThreadCollection _updateCurrentOldestThreadWithThreadIfApplicable:forMailbox:](*(void *)(a1 + 32), v9, v14))*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1; {
          if (*(unsigned char *)(a1 + 56))
          }
            [*(id *)(a1 + 40) removeObject:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  if (*(unsigned char *)(a1 + 56) && ![*(id *)(a1 + 40) count]) {
    *a4 = 1;
  }
}

- (uint64_t)_updateCurrentOldestThreadWithThreadIfApplicable:(void *)a3 forMailbox:
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (a1)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__4;
    uint64_t v26 = __Block_byref_object_dispose__4;
    id v27 = 0;
    long long v8 = *(void **)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke;
    v19[3] = &unk_1E63E3C40;
    uint64_t v21 = &v22;
    id v9 = v6;
    id v20 = v9;
    [v8 performWhileLocked:v19];
    if (([v5 isEqual:v23[5]] & 1) != 0
      || v23[5]
      && ([v5 date],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [(id)v23[5] date],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v10 compare:v11],
          v11,
          v10,
          v12 != -1))
    {
      uint64_t v13 = 0;
    }
    else
    {
      __int16 v14 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke_2;
      v16[3] = &unk_1E63E3C68;
      id v17 = v9;
      id v18 = v5;
      [v14 performWhileLocked:v16];

      uint64_t v13 = 1;
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_notifyObserverOfOldestThreadsByMailboxObjectIDs
{
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    long long v8 = __Block_byref_object_copy__4;
    id v9 = __Block_byref_object_dispose__4;
    id v10 = 0;
    BOOL v2 = (void *)a1[5];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __78__EMInMemoryThreadCollection__notifyObserverOfOldestThreadsByMailboxObjectIDs__block_invoke;
    v4[3] = &unk_1E63E3BC8;
    v4[4] = &v5;
    [v2 performWhileLocked:v4];
    id v3 = [a1 delegate];
    [v3 collection:a1 notifyOfOldestThreadsByMailboxObjectIDs:v6[5]];

    _Block_object_dispose(&v5, 8);
  }
}

- (void)notifyObserverOfOldestThreadsByMailboxObjectIDs
{
  id v3 = [(EMInMemoryThreadCollection *)self scheduler];
  [v3 assertIsExecuting:1];

  -[EMInMemoryThreadCollection _notifyObserverOfOldestThreadsByMailboxObjectIDs](self);
}

void __78__EMInMemoryThreadCollection__notifyObserverOfOldestThreadsByMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 oldestThreadsByMailboxObjectIDs];
  uint64_t v4 = objc_msgSend(v3, "ef_mapValues:", &__block_literal_global_57);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __78__EMInMemoryThreadCollection__notifyObserverOfOldestThreadsByMailboxObjectIDs__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 objectID];
  return v2;
}

- (void)performBlockOnSchedulerIfNecessary:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v4 = [(EMInMemoryThreadCollection *)self scheduler];
    [v4 performBlock:v5];
  }
  else
  {
    v5[2]();
  }
}

- (void)initializeOldestThreadsByMailbox
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__EMInMemoryThreadCollection_initializeOldestThreadsByMailbox__block_invoke;
  v2[3] = &unk_1E63E26B0;
  v2[4] = self;
  [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v2];
}

void __62__EMInMemoryThreadCollection_initializeOldestThreadsByMailbox__block_invoke(uint64_t a1)
{
}

- (void)_nts_initializeOldestThreadsByMailbox
{
  if (a1)
  {
    BOOL v2 = [a1 query];
    char v3 = [v2 queryOptions];

    if (v3)
    {
      uint64_t v4 = (void *)a1[5];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke;
      v9[3] = &unk_1E63E3BF0;
      v9[4] = a1;
      v9[5] = sel__nts_initializeOldestThreadsByMailbox;
      [v4 performWhileLocked:v9];
      uint64_t v5 = [a1 dataSource];
      id v6 = [v5 mailboxesInCollection:a1];
      -[EMInMemoryThreadCollection _updateOldestThreadsForMailboxes:](a1, v6);

      id v7 = (void *)a1[5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke_2;
      v8[3] = &unk_1E63E3C18;
      v8[4] = a1;
      [v7 performWhileLocked:v8];
    }
  }
}

void __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = [v6 oldestThreadsByMailboxObjectIDs];

  if (v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"EMInMemoryThreadCollection.m" lineNumber:511 description:@"oldestThreadsByMailboxObjectIDs should be only initialized once"];
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setOldestThreadsByMailboxObjectIDs:v4];
}

void __67__EMInMemoryThreadCollection__nts_initializeOldestThreadsByMailbox__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) logClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 oldestThreadsByMailboxObjectIDs];
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = [v6 count];
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Oldest threads initialized for %u mailboxes", (uint8_t *)&v7, 0x12u);
  }
}

void __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 oldestThreadsByMailboxObjectIDs];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __90__EMInMemoryThreadCollection__updateCurrentOldestThreadWithThreadIfApplicable_forMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 oldestThreadsByMailboxObjectIDs];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)clearOldestThreadsByMailboxObjectIDs
{
}

uint64_t __66__EMInMemoryThreadCollection_clearOldestThreadsByMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOldestThreadsByMailboxObjectIDs:0];
}

- (void)clearInMemoryThreadCache
{
  id v2 = [(EMInMemoryThreadCollection *)self inMemoryThreadCache];
  [v2 removeAllObjects];
}

- (void)clearForRecovery
{
  if (_os_feature_enabled_impl())
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke;
    v4[3] = &unk_1E63E26B0;
    v4[4] = self;
    [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v4];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke_2;
    v3[3] = &unk_1E63E26B0;
    v3[4] = self;
    [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v3];
    [(EMInMemoryThreadCollection *)self clearInMemoryThreadCache];
    os_unfair_lock_lock(&self->_threadsLock);
    [(NSMutableDictionary *)self->_threadsByConversationID removeAllObjects];
    [(NSMutableDictionary *)self->_mailboxesByConversationID removeAllObjects];
    os_unfair_lock_unlock(&self->_threadsLock);
  }
}

uint64_t __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

uint64_t __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) performWhileLocked:&__block_literal_global_69];
}

uint64_t __46__EMInMemoryThreadCollection_clearForRecovery__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setOldestThreadsByMailboxObjectIDs:0];
}

- (void)messagesWereAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__EMInMemoryThreadCollection_messagesWereAdded___block_invoke;
  v6[3] = &unk_1E63E2760;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v6];
}

void __48__EMInMemoryThreadCollection_messagesWereAdded___block_invoke(uint64_t a1)
{
}

- (void)_nts_messagesWereAdded:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[EMInMemoryThreadCollection _messagesByConversationIDForMessages:](a1, v3);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __53__EMInMemoryThreadCollection__nts_messagesWereAdded___block_invoke;
    id v17 = &unk_1E63E3CB0;
    id v18 = a1;
    id v8 = v6;
    id v19 = v8;
    id v9 = v7;
    id v20 = v9;
    id v10 = v5;
    id v21 = v10;
    [v4 enumerateKeysAndObjectsUsingBlock:&v14];
    uint64_t v11 = objc_msgSend(a1, "delegate", v14, v15, v16, v17, v18);
    [v11 prepareToSendUpdatesInCollection:a1];

    uint64_t v12 = [a1 delegate];
    LODWORD(v11) = [v12 collection:a1 reportChanges:v9];

    LODWORD(v12) = -[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v8, 1u);
    if ((-[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v10, 0) | v12 | v11) == 1)
    {
      uint64_t v13 = [a1 delegate];
      [v13 didSendUpdatesInCollection:a1];
    }
  }
}

void __53__EMInMemoryThreadCollection__nts_messagesWereAdded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1C18A1EF0]();
  id v8 = *(void **)(a1 + 32);
  if (v8[4])
  {
    id v9 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v49 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [*(id *)(*((void *)&v48 + 1) + 8 * i) mailboxObjectIDs];
          objc_msgSend(v9, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v14);
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v11);
    }

    uint64_t v15 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
    os_unfair_lock_lock(v15);
    long long v16 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v16)
    {
      id v17 = [v16 objectForKeyedSubscript:v5];
      id v18 = v17;
      if (v17)
      {
        id v19 = objc_msgSend(v17, "ef_arrayByAddingAbsentObjectsFromArray:", v9);
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v19 forKeyedSubscript:v5];
      }
      else
      {
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v9 forKeyedSubscript:v5];
      }
    }
    os_unfair_lock_unlock(v15);

    id v8 = *(void **)(a1 + 32);
  }
  id v20 = [v8 inMemoryThreadCache];
  id v21 = [v20 cachedObjectForKey:v5];

  uint64_t v22 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_lock(v22);
  v23 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  os_unfair_lock_unlock(v22);
  if (v21)
  {
    uint64_t v24 = [v21 addMessages:v6];
    id v25 = [v21 thread];
    uint64_t v26 = [*(id *)(a1 + 32) query];
    [(EMSortableThreadProxy *)v23 updateFromThread:v25 addingAdditionalInformation:0 query:v26];

    if (v24)
    {
      id v27 = *(void **)(a1 + 32);
      long long v28 = [v21 thread];
      LODWORD(v27) = -[EMInMemoryThreadCollection _updateSectionForThread:](v27, v28);

      if ((-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v24) | v27) == 1) {
        [*(id *)(a1 + 40) addObject:v23];
      }
      long long v29 = *(void **)(a1 + 48);
      id v30 = [v21 thread];
      long long v31 = [v30 objectID];
      [v29 setObject:v24 forKeyedSubscript:v31];
    }
  }
  else if (v23)
  {
    char v47 = 0;
    id v32 = *(void **)(a1 + 32);
    id v46 = 0;
    uint64_t v33 = -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:thread:](v32, v23, &v47, &v46);
    id v34 = v46;
    id v21 = v34;
    if (v33)
    {
      uint64_t v35 = *(void **)(a1 + 32);
      __int16 v36 = [v34 thread];
      LODWORD(v35) = -[EMInMemoryThreadCollection _updateSectionForThread:](v35, v36);

      if ((-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v33) | v35) == 1) {
        [*(id *)(a1 + 40) addObject:v23];
      }
      uint64_t v37 = *(void **)(a1 + 48);
      uint64_t v38 = [(EMSortableThreadProxy *)v23 objectID];
      [v37 setObject:v33 forKeyedSubscript:v38];
    }
  }
  else
  {
    id v21 = -[EMInMemoryThreadCollection _createInMemoryThreadForConversationID:messages:cacheResults:](*(void **)(a1 + 32), [v5 longLongValue], v6, 1);
    uint64_t v39 = [EMSortableThreadProxy alloc];
    v40 = [v21 thread];
    char v41 = [*(id *)(a1 + 32) query];
    v23 = [(EMSortableThreadProxy *)v39 initWithThread:v40 originatingQuery:v41];

    [*(id *)(a1 + 56) addObject:v23];
    uint64_t v42 = *(void **)(a1 + 32);
    v43 = [v21 thread];
    -[EMInMemoryThreadCollection _updateSectionForThread:](v42, v43);

    uint64_t v44 = *(void *)(a1 + 32);
    if (*(void *)(v44 + 24))
    {
      char v45 = (os_unfair_lock_s *)(v44 + 56);
      os_unfair_lock_lock((os_unfair_lock_t)(v44 + 56));
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v21 forKeyedSubscript:v5];
      os_unfair_lock_unlock(v45);
    }
  }
}

- (BOOL)_updateSectionForThread:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  BOOL v5 = 0;
  if (a1 && v3)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__4;
    id v19 = __Block_byref_object_dispose__4;
    id v20 = 0;
    uint64_t v6 = -[EMInMemoryThreadCollection _sectionIndexForThread:sectionIdentifier:](a1, v3, 0);
    id v7 = (void *)a1[6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__EMInMemoryThreadCollection__updateSectionForThread___block_invoke;
    v11[3] = &unk_1E63E3E88;
    uint64_t v13 = &v15;
    id v12 = v4;
    uint64_t v14 = v6;
    [v7 performWhileLocked:v11];
    id v8 = (void *)v16[5];
    if (v8) {
      uint64_t v9 = [v8 unsignedIntegerValue];
    }
    else {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    BOOL v5 = v6 != v9;

    _Block_object_dispose(&v15, 8);
  }

  return v5;
}

- (uint64_t)_messageListItemChangeAffectsSorting:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = objc_msgSend(a1, "query", 0);
    BOOL v5 = [v4 sortDescriptors];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) key];
          id v10 = [v3 valueForKeyPath:v9];

          if (v10)
          {
            uint64_t v6 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_updateThreadProxy:(unsigned char *)a3 threadIsEmpty:(void *)a4 thread:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = v7;
  if (a1)
  {
    uint64_t v9 = -[EMInMemoryThreadCollection _inMemoryThreadForConversationID:]((uint64_t)a1, [v7 conversationID]);
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 thread];
      long long v12 = [v8 calculateChangeFromThread:v11];

      long long v13 = [v10 thread];
      long long v14 = [a1 query];
      [v8 updateFromThread:v13 addingAdditionalInformation:0 query:v14];

      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      *a3 = 1;
      if (a4) {
        *a4 = 0;
      }
      long long v15 = [a1 logClient];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134218240;
        id v18 = a1;
        __int16 v19 = 2050;
        uint64_t v20 = [v8 conversationID];
        _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "%p: Thread %{public}lld no longer exists.", (uint8_t *)&v17, 0x16u);
      }

      long long v12 = 0;
    }
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (BOOL)_mergeInThreads:(unsigned int)a3 forMove:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v49 = v4;
  if (a1 && [v4 count])
  {
    char v54 = 0;
    if (a3) {
      char v54 = -[EMInMemoryThreadCollection _removeThreadProxies:forMove:](a1, v49, 1);
    }
    if ([v49 count])
    {
      long long v48 = [(id)a1 comparator];
      objc_msgSend(v49, "sortUsingComparator:");
      BOOL v5 = [v49 array];
      v43 = (void *)[v5 copy];

      id v6 = [v49 firstObject];
      if (v6)
      {
        unint64_t v8 = 0;
        char v47 = 0;
        *(void *)&long long v7 = 134219266;
        long long v42 = v7;
        while (1)
        {
          if (v8 >= objc_msgSend(*(id *)(a1 + 8), "count", v42)) {
            goto LABEL_35;
          }
          uint64_t v9 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
          id v46 = (void *)v9;
          id v10 = [*(id *)(a1 + 16) objectForKeyedSubscript:v9];
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
          if (((uint64_t (**)(void, void *, id))v48)[2](v48, v10, v6) == 1) {
            break;
          }
LABEL_31:

          ++v8;
          char v47 = v10;
          if (!v6)
          {
            char v47 = v10;
            goto LABEL_35;
          }
        }
        id v6 = v6;
        char v45 = v6;
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v12 = v6;
        while (1)
        {
          unint64_t v13 = v8;
          long long v14 = v12;
          id v12 = v6;

          long long v15 = [v12 objectID];
          [v11 addObject:v15];

          long long v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "conversationID"));
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
          [*(id *)(a1 + 16) setObject:v12 forKeyedSubscript:v16];
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
          [*(id *)(a1 + 8) insertObject:v16 atIndex:v13];
          [v49 removeObjectAtIndex:0];
          id v6 = [v49 firstObject];

          if (!v6) {
            break;
          }
          uint64_t v17 = ((uint64_t (**)(void, void *, id))v48)[2](v48, v10, v6);

          unint64_t v8 = v13 + 1;
          if (v17 != 1) {
            goto LABEL_15;
          }
        }

LABEL_15:
        id v18 = [v10 objectID];
        if ((!v47 || ((uint64_t (**)(void, void *, void *))v48)[2](v48, v45, v47) == 1)
          && ((uint64_t (**)(void, id, void *))v48)[2](v48, v12, v10) == -1)
        {
          if ([v11 count] == 1)
          {
            __int16 v19 = [(id)a1 logClient];
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
            *(_DWORD *)buf = 134218754;
            uint64_t v57 = a1;
            __int16 v58 = 2114;
            uint64_t v59 = (uint64_t)v45;
            __int16 v60 = 2114;
            id v61 = v47;
            __int16 v62 = 2114;
            id v63 = v10;
            uint64_t v24 = v19;
            id v25 = "%p: Merged in 1 new thread %{public}@ between existing threads %{public}@ and %{public}@";
            uint32_t v26 = 42;
          }
          else
          {
            __int16 v19 = [(id)a1 logClient];
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
            uint64_t v27 = [v11 count];
            *(_DWORD *)buf = v42;
            uint64_t v57 = a1;
            __int16 v58 = 2048;
            uint64_t v59 = v27;
            __int16 v60 = 2114;
            id v61 = v45;
            __int16 v62 = 2114;
            id v63 = v12;
            __int16 v64 = 2114;
            objc_super v65 = v47;
            __int16 v66 = 2114;
            v67 = v10;
            uint64_t v24 = v19;
            id v25 = "%p: Merged in %lu new threads %{public}@ to %{public}@ between existing threads %{public}@ and %{public}@";
            uint32_t v26 = 62;
          }
          _os_log_impl(&dword_1BEFDB000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
          goto LABEL_30;
        }
        if ([v11 count] == 1)
        {
          __int16 v19 = [(id)a1 logClient];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218754;
            uint64_t v57 = a1;
            __int16 v58 = 2114;
            uint64_t v59 = (uint64_t)v45;
            __int16 v60 = 2114;
            id v61 = v47;
            __int16 v62 = 2114;
            id v63 = v10;
            uint64_t v20 = v19;
            uint64_t v21 = "%p: Merged in 1 new thread out of order! %{public}@ between existing threads %{public}@ and %{public}@";
            uint32_t v22 = 42;
LABEL_23:
            _os_log_fault_impl(&dword_1BEFDB000, v20, OS_LOG_TYPE_FAULT, v21, buf, v22);
          }
        }
        else
        {
          __int16 v19 = [(id)a1 logClient];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            uint64_t v23 = [v11 count];
            *(_DWORD *)buf = v42;
            uint64_t v57 = a1;
            __int16 v58 = 2048;
            uint64_t v59 = v23;
            __int16 v60 = 2114;
            id v61 = v45;
            __int16 v62 = 2114;
            id v63 = v12;
            __int16 v64 = 2114;
            objc_super v65 = v47;
            __int16 v66 = 2114;
            v67 = v10;
            uint64_t v20 = v19;
            uint64_t v21 = "%p: Merged in %lu new threads out of order! %{public}@ to %{public}@ between existing threads %{public"
                  "}@ and %{public}@";
            uint32_t v22 = 62;
            goto LABEL_23;
          }
        }
LABEL_30:

        long long v28 = [(id)a1 delegate];
        [v28 collection:a1 didMergeInThreadsForMove:a3 newObjectIDs:v11 existingObjectID:v18 hasChanges:&v54];

        unint64_t v8 = v13 + 1;
        goto LABEL_31;
      }
      char v47 = 0;
LABEL_35:
      if ([v49 count])
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v31 = v49;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v51;
          do
          {
            uint64_t v34 = 0;
            uint64_t v35 = v6;
            do
            {
              if (*(void *)v51 != v33) {
                objc_enumerationMutation(v31);
              }
              id v6 = *(id *)(*((void *)&v50 + 1) + 8 * v34);

              __int16 v36 = [v6 objectID];
              [v30 addObject:v36];

              uint64_t v37 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "conversationID"));
              os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
              [*(id *)(a1 + 16) setObject:v6 forKeyedSubscript:v37];
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
              [*(id *)(a1 + 8) addObject:v37];

              ++v34;
              uint64_t v35 = v6;
            }
            while (v32 != v34);
            uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v55 count:16];
          }
          while (v32);
        }

        uint64_t v38 = [(id)a1 delegate];
        [v38 collection:a1 didMergeInThreadsForMove:a3 newObjectIDs:v30 existingObjectID:0 hasChanges:&v54];

        id v6 = 0;
      }
      BOOL v39 = -[EMInMemoryThreadCollection _didMergeInThreads:](a1, v43);
      if (v54) {
        char v40 = 1;
      }
      else {
        char v40 = v39;
      }
      char v54 = v40;
    }
    BOOL v29 = v54 != 0;
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (void)messagesWereChanged:(id)a3 forKeyPaths:(id)a4 deleted:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__EMInMemoryThreadCollection_messagesWereChanged_forKeyPaths_deleted___block_invoke;
  v12[3] = &unk_1E63E3CD8;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  BOOL v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v12];
}

void __70__EMInMemoryThreadCollection_messagesWereChanged_forKeyPaths_deleted___block_invoke(uint64_t a1)
{
}

- (void)_nts_messagesWereChanged:(void *)a3 forKeyPaths:(char)a4 deleted:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v25 = v8;
    id v9 = -[EMInMemoryThreadCollection _messagesByConversationIDForMessages:](a1, v7);
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__EMInMemoryThreadCollection__nts_messagesWereChanged_forKeyPaths_deleted___block_invoke;
    v27[3] = &unk_1E63E3D00;
    v27[4] = a1;
    char v33 = a4;
    id v28 = v8;
    id v11 = v24;
    id v29 = v11;
    id v12 = v23;
    id v30 = v12;
    id v13 = v10;
    id v31 = v13;
    id v14 = v26;
    id v32 = v14;
    [v9 enumerateKeysAndObjectsUsingBlock:v27];
    BOOL v15 = [a1 delegate];
    [v15 prepareToSendUpdatesInCollection:a1];

    if ([v11 count] && (a4 & 1) == 0)
    {
      long long v16 = [a1 logClient];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[EMInMemoryThreadCollection _nts_messagesWereChanged:forKeyPaths:deleted:]((uint64_t)a1, (uint64_t)v7, v16);
      }
    }
    id v17 = v7;
    id v18 = [a1 delegate];
    int v19 = [v18 collection:a1 reportDeletes:v11];

    uint64_t v20 = [a1 delegate];
    int v21 = [v20 collection:a1 reportChanges:v13];

    LODWORD(v20) = -[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v12, 1u);
    if ((-[EMInMemoryThreadCollection _mergeInThreads:forMove:]((uint64_t)a1, v14, 0) | v20 | v21 | v19) == 1)
    {
      uint32_t v22 = [a1 delegate];
      [v22 didSendUpdatesInCollection:a1];
    }
    id v7 = v17;
    id v8 = v25;
  }
}

void __75__EMInMemoryThreadCollection__nts_messagesWereChanged_forKeyPaths_deleted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  context = (void *)MEMORY[0x1C18A1EF0]();
  id v7 = [*(id *)(a1 + 32) inMemoryThreadCache];
  id v8 = [v7 cachedObjectForKey:v5];

  id v9 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_lock(v9);
  id v10 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  os_unfair_lock_unlock(v9);
  if (v8)
  {
    char v68 = 0;
    if (*(unsigned char *)(a1 + 80))
    {
      id v11 = [*(id *)(a1 + 32) inMemoryThreadCache];
      [v11 removeObjectForKey:v5];

      [(EMInMemoryThread *)v8 removeMessages:v6 threadIsEmpty:&v68];
    }
    else
    {
      [(EMInMemoryThread *)v8 changeMessages:v6 forKeyPaths:*(void *)(a1 + 40) threadIsEmpty:&v68];
    uint64_t v12 = };
    uint32_t v22 = (void *)v12;
    if (v68)
    {
      [*(id *)(a1 + 48) addObject:v10];
      id v23 = [*(id *)(a1 + 32) logClient];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        id v25 = [(EMInMemoryThread *)v8 thread];
        id v26 = [v25 itemID];
        *(_DWORD *)buf = 134218242;
        uint64_t v70 = v24;
        __int16 v71 = 2114;
        uint64_t v72 = (uint64_t)v26;
        _os_log_impl(&dword_1BEFDB000, v23, OS_LOG_TYPE_DEFAULT, "%p: Marking thread %{public}@ as deleted", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v27 = *(void **)(a1 + 32);
      if (v12)
      {
        id v28 = [(EMInMemoryThread *)v8 thread];
        BOOL v29 = -[EMInMemoryThreadCollection _updateSectionForThread:](v27, v28);

        id v30 = [*(id *)(a1 + 32) logClient];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v64 = v6;
          uint64_t v31 = *(void *)(a1 + 32);
          id v63 = [(EMInMemoryThread *)v8 thread];
          id v32 = [v63 itemID];
          char v33 = objc_msgSend(v22, "ef_publicDescription");
          *(_DWORD *)buf = 134218754;
          uint64_t v70 = v31;
          __int16 v71 = 2114;
          uint64_t v72 = (uint64_t)v32;
          __int16 v73 = 2114;
          v74 = v33;
          __int16 v75 = 1024;
          BOOL v76 = v29;
          _os_log_impl(&dword_1BEFDB000, v30, OS_LOG_TYPE_DEFAULT, "%p: Updating thread (%{public}@) with change: %{public}@, sectionDidChange: %{BOOL}d", buf, 0x26u);

          id v6 = v64;
        }

        if ((-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v22) | v29) == 1)[*(id *)(a1 + 56) addObject:v10]; {
        uint64_t v34 = [(EMInMemoryThread *)v8 thread];
        }
        uint64_t v35 = [*(id *)(a1 + 32) query];
        [(EMSortableThreadProxy *)v10 updateFromThread:v34 addingAdditionalInformation:0 query:v35];

        __int16 v36 = *(void **)(a1 + 64);
        id v23 = [(EMInMemoryThread *)v8 thread];
        uint64_t v37 = [v23 objectID];
        [v36 setObject:v22 forKeyedSubscript:v37];
      }
      else
      {
        id v23 = [*(id *)(a1 + 32) logClient];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v56 = *(void *)(a1 + 32);
          uint64_t v57 = [(EMInMemoryThread *)v8 thread];
          __int16 v58 = [v57 itemID];
          uint64_t v59 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          uint64_t v70 = v56;
          __int16 v71 = 2114;
          uint64_t v72 = (uint64_t)v58;
          __int16 v73 = 2114;
          v74 = v59;
          _os_log_impl(&dword_1BEFDB000, v23, OS_LOG_TYPE_DEFAULT, "%p: No change detected for thread with item ID: %{public}@, keyPaths: %{public}@", buf, 0x20u);
        }
      }
    }

    goto LABEL_35;
  }
  if (v10)
  {
    char v68 = 0;
    id v13 = *(void **)(a1 + 32);
    id v67 = 0;
    id v14 = -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:thread:](v13, v10, &v68, &v67);
    BOOL v15 = (EMInMemoryThread *)v67;
    id v8 = v15;
    if (v68)
    {
      [*(id *)(a1 + 48) addObject:v10];
      long long v16 = [*(id *)(a1 + 32) logClient];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = [(EMSortableThreadProxy *)v10 conversationID];
        *(_DWORD *)buf = 134218240;
        uint64_t v70 = v17;
        __int16 v71 = 2050;
        uint64_t v72 = v18;
        int v19 = "%p: Marking thread proxy %{public}lld as deleted";
        uint64_t v20 = v16;
        uint32_t v21 = 22;
LABEL_8:
        _os_log_impl(&dword_1BEFDB000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
    else
    {
      long long v48 = *(void **)(a1 + 32);
      if (v14)
      {
        long long v49 = [(EMInMemoryThread *)v15 thread];
        BOOL v50 = -[EMInMemoryThreadCollection _updateSectionForThread:](v48, v49);

        long long v51 = [*(id *)(a1 + 32) logClient];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          id v65 = v6;
          uint64_t v52 = *(void *)(a1 + 32);
          uint64_t v53 = [(EMSortableThreadProxy *)v10 conversationID];
          char v54 = objc_msgSend(v14, "ef_publicDescription");
          *(_DWORD *)buf = 134218754;
          uint64_t v70 = v52;
          __int16 v71 = 2048;
          uint64_t v72 = v53;
          __int16 v73 = 2114;
          v74 = v54;
          __int16 v75 = 1024;
          BOOL v76 = v50;
          _os_log_impl(&dword_1BEFDB000, v51, OS_LOG_TYPE_DEFAULT, "%p: Updating thread proxy (%lld) with change: %{public}@, sectionDidChange: %{BOOL}d", buf, 0x26u);

          id v6 = v65;
        }

        if ((-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), v14) | v50) == 1)[*(id *)(a1 + 56) addObject:v10]; {
        uint64_t v55 = *(void **)(a1 + 64);
        }
        long long v16 = [(EMSortableThreadProxy *)v10 objectID];
        [v55 setObject:v14 forKeyedSubscript:v16];
        goto LABEL_34;
      }
      long long v16 = [*(id *)(a1 + 32) logClient];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v60 = *(void *)(a1 + 32);
        uint64_t v61 = [(EMSortableThreadProxy *)v10 conversationID];
        __int16 v62 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        uint64_t v70 = v60;
        __int16 v71 = 2048;
        uint64_t v72 = v61;
        __int16 v73 = 2114;
        v74 = v62;
        int v19 = "%p: No change detected for thread proxy with item ID: %lld, keyPaths: %{public}@";
        uint64_t v20 = v16;
        uint32_t v21 = 32;
        goto LABEL_8;
      }
    }
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  if (!*(unsigned char *)(a1 + 80))
  {
    uint64_t v38 = [*(id *)(a1 + 32) logClient];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      uint64_t v70 = v39;
      __int16 v71 = 2048;
      uint64_t v72 = [v5 longLongValue];
      _os_log_impl(&dword_1BEFDB000, v38, OS_LOG_TYPE_DEFAULT, "%p: Unable to find thread for conversation ID: %lld", buf, 0x16u);
    }

    char v40 = [EMInMemoryThread alloc];
    char v41 = [*(id *)(a1 + 32) query];
    long long v42 = [*(id *)(a1 + 32) threadScope];
    id v8 = [(EMInMemoryThread *)v40 initWithMessages:v6 originatingQuery:v41 threadScope:v42];

    v43 = [EMSortableThreadProxy alloc];
    uint64_t v44 = [(EMInMemoryThread *)v8 thread];
    char v45 = [*(id *)(a1 + 32) query];
    id v10 = [(EMSortableThreadProxy *)v43 initWithThread:v44 originatingQuery:v45];

    [*(id *)(a1 + 72) addObject:v10];
    id v46 = *(void **)(a1 + 32);
    char v47 = [(EMInMemoryThread *)v8 thread];
    -[EMInMemoryThreadCollection _updateSectionForThread:](v46, v47);

    goto LABEL_35;
  }
LABEL_36:
}

- (void)objectIDDidChangeForMessage:(id)a3 oldObjectID:(id)a4 oldConversationID:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__EMInMemoryThreadCollection_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke;
  v12[3] = &unk_1E63E3D28;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v12];
}

void __88__EMInMemoryThreadCollection_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke(uint64_t a1)
{
}

- (void)_nts_objectIDDidChangeForMessage:(void *)a3 oldObjectID:(uint64_t)a4 oldConversationID:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = [(id)a1 delegate];
    [v9 prepareToSendUpdatesInCollection:a1];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke;
    v50[3] = &unk_1E63E3D50;
    v50[4] = a1;
    id v10 = v8;
    id v51 = v10;
    id v11 = (void (**)(void, void, void))MEMORY[0x1C18A2160](v50);
    if ([v7 conversationID] == a4)
    {
      uint64_t v12 = [(id)a1 inMemoryThreadCache];
      id v13 = [NSNumber numberWithLongLong:a4];
      id v14 = [v12 cachedObjectForKey:v13];

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
      int64_t v15 = *(void **)(a1 + 16);
      long long v16 = [NSNumber numberWithLongLong:a4];
      uint64_t v17 = [v15 objectForKeyedSubscript:v16];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
      if (v14)
      {
        uint64_t v18 = [v14 updateMessage:v7 fromOldObjectID:v10];
        int v19 = [v14 thread];
        uint64_t v20 = [(id)a1 query];
        [v17 updateFromThread:v19 addingAdditionalInformation:0 query:v20];

        uint32_t v21 = [v14 thread];
        uint32_t v22 = [v21 objectID];
        ((void (**)(void, void *, void *))v11)[2](v11, v18, v22);
      }
      else
      {
        char v47 = 0;
        id v45 = 0;
        uint64_t v18 = -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:thread:]((void *)a1, v17, &v47, &v45);
        id v34 = v45;
        id v14 = v34;
        if (v47)
        {

          id v14 = 0;
        }
        uint32_t v21 = [v17 objectID];
        ((void (**)(void, void *, void *))v11)[2](v11, v18, v21);
      }

      uint64_t v35 = [v14 thread];
      -[EMInMemoryThreadCollection _updateSectionForThread:]((void *)a1, v35);

      __int16 v36 = [(id)a1 delegate];
      uint64_t v37 = [v7 objectID];
      [v36 collection:a1 notifyReplacedExistingObjectID:v10 newObjectID:v37];
    }
    else
    {
      id v23 = [(id)a1 inMemoryThreadCache];
      uint64_t v24 = [NSNumber numberWithLongLong:a4];
      id v14 = [v23 cachedObjectForKey:v24];

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
      id v25 = *(void **)(a1 + 16);
      id v26 = [NSNumber numberWithLongLong:a4];
      uint64_t v17 = [v25 objectForKeyedSubscript:v26];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
      if (v14)
      {
        uint64_t v27 = [v14 messages];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke_73;
        v48[3] = &unk_1E63E3D78;
        id v49 = v10;
        id v28 = objc_msgSend(v27, "ef_filter:", v48);

        char v47 = 0;
        BOOL v29 = [v14 removeMessages:v28 threadIsEmpty:&v47];
        if (v47)
        {

          id v30 = [(id)a1 inMemoryThreadCache];
          uint64_t v31 = [NSNumber numberWithLongLong:a4];
          [v30 removeObjectForKey:v31];

          id v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithObjects:", v17, 0);
          char v33 = [(id)a1 delegate];
          [v33 collection:a1 reportDeletes:v32];
          id v14 = 0;
        }
        else
        {
          long long v42 = [v14 thread];
          v43 = [(id)a1 query];
          [v17 updateFromThread:v42 addingAdditionalInformation:0 query:v43];

          id v32 = [v14 thread];
          char v33 = [v32 objectID];
          ((void (**)(void, void *, void *))v11)[2](v11, v29, v33);
        }
      }
      else if (v17)
      {
        char v47 = 0;
        id v46 = 0;
        uint64_t v38 = -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:thread:]((void *)a1, v17, &v47, &v46);
        id v39 = v46;
        id v14 = v39;
        if (v47)
        {

          char v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithObjects:", v17, 0);
          char v41 = [(id)a1 delegate];
          [v41 collection:a1 reportDeletes:v40];

          id v14 = 0;
        }
        else
        {
          char v40 = [v17 objectID];
          ((void (**)(void, void *, void *))v11)[2](v11, v38, v40);
        }
      }
      else
      {
        id v14 = 0;
      }
      __int16 v36 = [v14 thread];
      -[EMInMemoryThreadCollection _updateSectionForThread:]((void *)a1, v36);
    }

    uint64_t v44 = [(id)a1 delegate];
    [v44 didSendUpdatesInCollection:a1];
  }
}

void __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) logClient];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "%p: Changed objectID from %{public}@ for message in thread: %{public}@", buf, 0x20u);
    }

    id v10 = [*(id *)(a1 + 32) delegate];
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v6;
    id v14 = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v10 collection:v11 reportChanges:v12];
  }
}

uint64_t __93__EMInMemoryThreadCollection__nts_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)conversationIDDidChangeForMessages:(id)a3 fromConversationID:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__EMInMemoryThreadCollection_conversationIDDidChangeForMessages_fromConversationID___block_invoke;
  v8[3] = &unk_1E63E3088;
  v8[4] = self;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v8];
}

void __84__EMInMemoryThreadCollection_conversationIDDidChangeForMessages_fromConversationID___block_invoke(uint64_t a1)
{
}

- (void)_nts_conversationIDDidChangeForMessages:(uint64_t)a3 fromConversationID:
{
  id v54 = a2;
  if (!a1) {
    goto LABEL_27;
  }
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [(id)a1 delegate];
  [v5 prepareToSendUpdatesInCollection:a1];

  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v6 = [v54 firstObject];
  uint64_t v7 = [v6 conversationID];

  uint64_t v8 = [(id)a1 inMemoryThreadCache];
  id v9 = [NSNumber numberWithLongLong:v7];
  int64_t v10 = [v8 cachedObjectForKey:v9];

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  uint64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = [NSNumber numberWithLongLong:v7];
  id v13 = [v11 objectForKeyedSubscript:v12];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  if (v10)
  {
    id v14 = [(EMInMemoryThread *)v10 addMessages:v54];
    int64_t v15 = [(EMInMemoryThread *)v10 thread];
    uint64_t v16 = [(id)a1 query];
    [(EMSortableThreadProxy *)v13 updateFromThread:v15 addingAdditionalInformation:0 query:v16];

    if (v14)
    {
      __int16 v17 = [(EMInMemoryThread *)v10 thread];
      uint64_t v18 = [v17 objectID];
      [v55 setObject:v14 forKeyedSubscript:v18];

      __int16 v19 = [(EMInMemoryThread *)v10 thread];
      BOOL v20 = -[EMInMemoryThreadCollection _updateSectionForThread:]((void *)a1, v19);

      if (v20) {
        [v53 addObject:v13];
      }
    }
LABEL_10:

    int v24 = 0;
    goto LABEL_11;
  }
  if (v13)
  {
    char v60 = 0;
    id v59 = 0;
    id v14 = -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:thread:]((void *)a1, v13, &v60, &v59);
    int64_t v10 = (EMInMemoryThread *)v59;
    if (v14)
    {
      uint64_t v21 = [(EMSortableThreadProxy *)v13 objectID];
      [v55 setObject:v14 forKeyedSubscript:v21];

      uint32_t v22 = [(EMInMemoryThread *)v10 thread];
      BOOL v23 = -[EMInMemoryThreadCollection _updateSectionForThread:]((void *)a1, v22);

      if (v23) {
        [v53 addObject:v13];
      }
    }
    goto LABEL_10;
  }
  char v41 = [EMInMemoryThread alloc];
  long long v42 = [(id)a1 query];
  v43 = [(id)a1 threadScope];
  int64_t v10 = [(EMInMemoryThread *)v41 initWithMessages:v54 originatingQuery:v42 threadScope:v43];

  uint64_t v44 = [EMSortableThreadProxy alloc];
  id v45 = [(EMInMemoryThread *)v10 thread];
  id v46 = [(id)a1 query];
  id v13 = [(EMSortableThreadProxy *)v44 initWithThread:v45 originatingQuery:v46];

  char v47 = [(EMInMemoryThread *)v10 thread];
  -[EMInMemoryThreadCollection _updateSectionForThread:]((void *)a1, v47);

  long long v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithObjects:", v13, 0);
  int v24 = -[EMInMemoryThreadCollection _mergeInThreads:forMove:](a1, v48, 0);

LABEL_11:
  id v25 = [(id)a1 inMemoryThreadCache];
  id v26 = [NSNumber numberWithLongLong:a3];
  id v27 = [v25 cachedObjectForKey:v26];

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  id v28 = *(void **)(a1 + 16);
  BOOL v29 = [NSNumber numberWithLongLong:a3];
  id v30 = [v28 objectForKeyedSubscript:v29];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  char v60 = 0;
  if (v27)
  {
    uint64_t v31 = [v27 removeMessages:v54 threadIsEmpty:&v60];
    if (v60)
    {
      id v32 = [(id)a1 inMemoryThreadCache];
      char v33 = [NSNumber numberWithLongLong:a3];
      [v32 removeObjectForKey:v33];
    }
    else
    {
      id v34 = [v27 thread];
      uint64_t v35 = [(id)a1 query];
      [v30 updateFromThread:v34 addingAdditionalInformation:0 query:v35];
    }
LABEL_17:
    if (v60)
    {
      __int16 v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithObjects:", v30, 0);
      uint64_t v37 = [(id)a1 delegate];
      v24 |= [v37 collection:a1 reportDeletes:v36];
    }
    else if (v31)
    {
      uint64_t v38 = [v30 objectID];
      [v55 setObject:v31 forKeyedSubscript:v38];

      id v39 = [v27 thread];
      BOOL v40 = -[EMInMemoryThreadCollection _updateSectionForThread:]((void *)a1, v39);

      if (v40) {
        [v53 addObject:v30];
      }
    }
    goto LABEL_24;
  }
  if (v30)
  {
    id v58 = 0;
    uint64_t v31 = -[EMInMemoryThreadCollection _updateThreadProxy:threadIsEmpty:thread:]((void *)a1, v30, &v60, &v58);
    id v27 = v58;
    goto LABEL_17;
  }
  uint64_t v31 = 0;
  id v27 = 0;
LABEL_24:
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __89__EMInMemoryThreadCollection__nts_conversationIDDidChangeForMessages_fromConversationID___block_invoke;
  v56[3] = &unk_1E63E3DA0;
  v56[4] = a1;
  id v49 = v53;
  id v57 = v49;
  [v55 enumerateKeysAndObjectsUsingBlock:v56];
  BOOL v50 = [(id)a1 delegate];
  int v51 = [v50 collection:a1 reportChanges:v55];

  if ((-[EMInMemoryThreadCollection _mergeInThreads:forMove:](a1, v49, 1u) | v51 | v24) == 1)
  {
    uint64_t v52 = [(id)a1 delegate];
    [v52 didSendUpdatesInCollection:a1];
  }
LABEL_27:
}

void __89__EMInMemoryThreadCollection__nts_conversationIDDidChangeForMessages_fromConversationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (-[EMInMemoryThreadCollection _messageListItemChangeAffectsSorting:](*(void **)(a1 + 32), a3))
  {
    id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
    os_unfair_lock_lock(v5);
    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "conversationID"));
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    os_unfair_lock_unlock(v5);
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)conversationNotificationLevelDidChangeForConversation:(int64_t)a3 conversationID:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__EMInMemoryThreadCollection_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke;
  v4[3] = &unk_1E63E3DC8;
  v4[4] = self;
  void v4[5] = a3;
  void v4[6] = a4;
  [(EMInMemoryThreadCollection *)self performBlockOnSchedulerIfNecessary:v4];
}

void __99__EMInMemoryThreadCollection_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke(uint64_t *a1)
{
}

- (void)_nts_conversationNotificationLevelDidChangeForConversation:(uint64_t)a3 conversationID:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v6 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    uint64_t v7 = *(void **)(a1 + 16);
    uint64_t v8 = [NSNumber numberWithLongLong:a3];
    id v9 = [v7 objectForKeyedSubscript:v8];

    os_unfair_lock_unlock(v6);
    if (v9)
    {
      int64_t v10 = objc_alloc_init(EMMessageListItemChange);
      uint64_t v11 = [NSNumber numberWithInteger:a2];
      [(EMMessageListItemChange *)v10 setConversationNotificationLevel:v11];

      uint64_t v12 = [(id)a1 delegate];
      [v12 prepareToSendUpdatesInCollection:a1];

      id v13 = [(id)a1 delegate];
      id v14 = [v9 objectID];
      __int16 v17 = v14;
      v18[0] = v10;
      int64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      [v13 collection:a1 reportChanges:v15];

      uint64_t v16 = [(id)a1 delegate];
      [v16 didSendUpdatesInCollection:a1];
    }
  }
}

- (BOOL)_didMergeInThreads:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    if (-[EMInMemoryThreadCollection _hasLoaded](a1))
    {
      BOOL v4 = [(id)a1 dateSortOrder] == 1;
      BOOL v5 = [(id)a1 dateSortOrder] != 0;
      id v6 = [(id)a1 dataSource];
      uint64_t v7 = [v6 mailboxesInCollection:a1];
      uint64_t v8 = (void *)[v7 mutableCopy];

      uint64_t v15 = 0;
      uint64_t v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49__EMInMemoryThreadCollection__didMergeInThreads___block_invoke;
      v11[3] = &unk_1E63E3DF0;
      void v11[4] = a1;
      id v13 = &v15;
      BOOL v14 = v5;
      id v9 = v8;
      id v12 = v9;
      [v3 enumerateObjectsWithOptions:2 * v4 usingBlock:v11];
      if (*((unsigned char *)v16 + 24))
      {
        -[EMInMemoryThreadCollection _notifyObserverOfOldestThreadsByMailboxObjectIDs]((void *)a1);
        a1 = *((unsigned char *)v16 + 24) != 0;
      }
      else
      {
        a1 = 0;
      }

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __40__EMInMemoryThreadCollection__hasLoaded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 oldestThreadsByMailboxObjectIDs];
  BOOL v4 = v3 != 0;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

void __49__EMInMemoryThreadCollection__didMergeInThreads___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
  os_unfair_lock_lock(v7);
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
  id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "conversationID"));
  int64_t v10 = [v8 objectForKeyedSubscript:v9];

  os_unfair_lock_unlock(v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v16 = -[EMInMemoryThreadCollection _updateCurrentOldestThreadWithThreadIfApplicable:forMailbox:](*(void *)(a1 + 32), v6, v15);
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        BOOL v18 = (v16 & 1) != 0 || *(unsigned char *)(v17 + 24) != 0;
        *(unsigned char *)(v17 + 24) = v18;
        if (*(unsigned char *)(a1 + 56)) {
          objc_msgSend(*(id *)(a1 + 40), "removeObject:", v15, (void)v19);
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)(a1 + 56) && ![*(id *)(a1 + 40) count]) {
    *a4 = 1;
  }
}

- (id)itemIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int64_t v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  id v3 = [(EMInMemoryThreadCollection *)self scheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__EMInMemoryThreadCollection_itemIDs__block_invoke;
  v6[3] = &unk_1E63E3E38;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performSyncBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__EMInMemoryThreadCollection_itemIDs__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) array];
  uint64_t v2 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_81);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

EMThreadCollectionItemID *__37__EMInMemoryThreadCollection_itemIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = -[EMThreadCollectionItemID initWithConversationID:]([EMThreadCollectionItemID alloc], "initWithConversationID:", [v2 longLongValue]);

  return v3;
}

- (id)sectionIdentifierForThreadObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__4;
  long long v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  sectionIndexesByConversationID = self->_sectionIndexesByConversationID;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __65__EMInMemoryThreadCollection_sectionIdentifierForThreadObjectID___block_invoke;
  uint64_t v13 = &unk_1E63E3E60;
  uint64_t v15 = &v16;
  id v6 = v4;
  id v14 = v6;
  [(EFLocked *)sectionIndexesByConversationID performWhileLocked:&v10];
  if (v17[5])
  {
    uint64_t v7 = [(EMInMemoryThreadCollection *)self sectionPredicates];
    uint64_t v8 = objc_msgSend(v7, "keyAtIndex:", objc_msgSend((id)v17[5], "unsignedIntegerValue"));
  }
  else
  {
    uint64_t v8 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __65__EMInMemoryThreadCollection_sectionIdentifierForThreadObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "conversationID"));
  uint64_t v4 = [v7 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (uint64_t)_sectionIndexForThread:(void *)a3 sectionIdentifier:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 sectionPredicates];
    uint64_t v7 = +[EMInMemoryThreadCollection _sectionIndexForThread:sectionPredicates:sectionIdentifier:]((uint64_t)EMInMemoryThreadCollection, v5, v6, a3);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __54__EMInMemoryThreadCollection__updateSectionForThread___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "conversationID"));
  uint64_t v4 = [v10 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "conversationID"));
  [v10 setObject:v8 forKeyedSubscript:v9];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
}
  }

+ (uint64_t)_sectionIndexForThread:(void *)a3 sectionPredicates:(void *)a4 sectionIdentifier:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__4;
  BOOL v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__EMInMemoryThreadCollection__sectionIndexForThread_sectionPredicates_sectionIdentifier___block_invoke;
  v11[3] = &unk_1E63E3EB0;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  id v14 = &v19;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  uint64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __89__EMInMemoryThreadCollection__sectionIndexForThread_sectionPredicates_sectionIdentifier___block_invoke(void *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  id v10 = a3;
  if ([a4 evaluateWithObject:a1[4]])
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *a5 = 1;
  }
}

- (EMInMemoryThreadCollectionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (EMInMemoryThreadCollectionDataSource *)WeakRetained;
}

- (EMInMemoryThreadCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EMInMemoryThreadCollectionDelegate *)WeakRetained;
}

- (OS_os_log)logClient
{
  return self->_logClient;
}

- (void)setLogClient:(id)a3
{
}

- (EMQuery)query
{
  return self->_query;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EMMailboxTypeResolver)mailboxTypeResolver
{
  return self->_mailboxTypeResolver;
}

- (EFLazyCache)inMemoryThreadCache
{
  return self->_inMemoryThreadCache;
}

- (int64_t)dateSortOrder
{
  return self->_dateSortOrder;
}

- (id)comparator
{
  return self->_comparator;
}

- (EFOrderedDictionary)sectionPredicates
{
  return self->_sectionPredicates;
}

- (EFAssertableScheduler)scheduler
{
  return self->_scheduler;
}

- (BOOL)limitedCache
{
  return self->_limitedCache;
}

- (void)setLimitedCache:(BOOL)a3
{
  self->_limitedCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_sectionPredicates, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_inMemoryThreadCache, 0);
  objc_storeStrong((id *)&self->_mailboxTypeResolver, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sectionIndexesByConversationID, 0);
  objc_storeStrong((id *)&self->_oldestThreadsByMailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxesByConversationID, 0);
  objc_storeStrong((id *)&self->_inMemoryThreadsByConversationID, 0);
  objc_storeStrong((id *)&self->_threadsByConversationID, 0);
  objc_storeStrong((id *)&self->_conversationIDs, 0);
}

- (void)_nts_messagesWereChanged:(uint64_t)a1 forKeyPaths:(uint64_t)a2 deleted:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "%p: Marking threads from messages %{public}@ as deleted even though no messages were deleted.", (uint8_t *)&v3, 0x16u);
}

@end