@interface EMMessageList
+ (OS_os_log)log;
+ (id)groupedCommerceSenderMessageListForMailboxes:(id)a3 withRepository:(id)a4 grouping:(int64_t)a5 sectionPredicates:(id)a6 countOfItemsToPrecache:(unint64_t)a7;
+ (id)groupedCommerceSenderMessageListForMailboxes:(id)a3 withRepository:(id)a4 grouping:(int64_t)a5 sectionPredicates:(id)a6 countOfItemsToPrecache:(unint64_t)a7 transformPredicate:(id)a8;
+ (id)simpleMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 countOfItemsToPrecache:(unint64_t)a6 shouldUpdateDisplayDate:(BOOL)a7 sortDescriptors:(id)a8 transformPredicate:(id)a9 ignoreMessageAdditionsPredicate:(id)a10 shouldShowBundle:(BOOL)a11;
+ (id)simpleMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 shouldUpdateDisplayDate:(BOOL)a6;
+ (id)threadedMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 countOfItemsToPrecache:(unint64_t)a6 shouldUpdateDisplayDate:(BOOL)a7 sortDescriptors:(id)a8 sectionPredicates:(id)a9 transformPredicate:(id)a10 ignoreMessageAdditionsPredicate:(id)a11 shouldShowBundle:(BOOL)a12;
+ (id)threadedMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 shouldUpdateDisplayDate:(BOOL)a6;
- (BOOL)_threadIsExpanded:(id)a3;
- (BOOL)_threadIsExpandedForItemID:(id)a3;
- (BOOL)anyExpandedThreadContainsItemID:(id)a3;
- (BOOL)isThreaded;
- (BOOL)objectIDBelongsToCollection:(id)a3;
- (BOOL)recentlyCollapsedThreadContainsItemID:(id)a3;
- (EFLazyCache)cache;
- (EFScheduler)observerScheduler;
- (EMCollectionItemIDStateCapturer)stateCapturer;
- (EMMailboxScope)mailboxScope;
- (EMMessageList)initWithMailboxes:(id)a3 repository:(id)a4 sortDescriptors:(id)a5 sectionPredicates:(id)a6 transformPredicate:(id)a7 ignoreMessageAdditionsPredicate:(id)a8 targetClass:(Class)a9 additionalQueryOptions:(unint64_t)a10 countOfItemsToPrecache:(unint64_t)a11 shouldUpdateDisplayDate:(BOOL)a12 labelPrefix:(id)a13 shouldShowBundle:(BOOL)a14;
- (EMMessageList)initWithMessageList:(id)a3;
- (EMMessageList)initWithObjectID:(id)a3 query:(id)a4 repository:(id)a5;
- (EMMessageList)initWithQuery:(id)a3 repository:(id)a4;
- (EMMessageList)unfilteredMessageList;
- (EMMessageRepository)repository;
- (EMThreadScope)threadScope;
- (NSPredicate)filterPredicate;
- (NSSet)expandedThreadItemIDs;
- (NSSet)recentlyCollapsedItemIDs;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (OS_dispatch_queue)contentProtectionQueue;
- (id)_adjustedItemIDToInsertAfterForExistingItemID:(id)a3 sectionIndex:(unint64_t)a4;
- (id)_adjustedItemIDToInsertBeforeForExistingItemID:(id)a3 sectionIndex:(unint64_t)a4;
- (id)_availableMessageListItemsForItemIDs:(id)a3;
- (id)_expandedObjectIDsForObjectIDs:(id)a3;
- (id)_hintsByObjectIDFromExtraInfo:(id)a3;
- (id)_itemIDsForItemIDs:(id)a3 changeObserver:(id)a4 extraInfo:(id)a5 outObserverSectionIndex:(unint64_t *)a6;
- (id)_nextThreadItemIDAfterThreadItemID:(id)a3;
- (id)_sectionIdentierForItemID:(id)a3;
- (id)_sectionIdentifierForIndex:(unint64_t)a3;
- (id)_sectionPredicates;
- (id)_sectionedObjectIDsFromExtraInfo:(id)a3;
- (id)_unreadItemIDsFromExtraInfo:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filteredMessageListWithPredicate:(id)a3 ignoredMessagesPredicate:(id)a4 userFiltered:(BOOL)a5;
- (id)itemIDForObjectID:(id)a3;
- (id)itemIDOfFirstMessageListItemMatchingPredicate:(id)a3;
- (id)itemIDOfMessageListItemWithDisplayMessage:(id)a3;
- (id)itemIDsForStateCaptureWithErrorString:(id *)a3;
- (id)labelForStateCapture;
- (id)messageListItemForItemID:(id)a3;
- (id)messageListItemForItemID:(id)a3 ifAvailable:(BOOL)a4;
- (id)messageListItemsForItemIDs:(id)a3;
- (id)messageListItemsForItemIDs:(id)a3 ifAvailable:(BOOL)a4;
- (id)objectIDForItemID:(id)a3;
- (id)removeItemIDs:(id)a3;
- (unint64_t)_sectionIndexForIdentifier:(id)a3;
- (unint64_t)_sectionIndexForItemID:(id)a3;
- (void)_addPrecachedItemsFromExtraInfo:(id)a3;
- (void)_attemptToFinishRetryingPromisesByItemID:(id)a3;
- (void)_commonInitWithRepository:(id)a3;
- (void)_updateSectionsWithItemIDs:(id)a3 extraInfo:(id)a4;
- (void)clearRecentlyCollapsedThread;
- (void)collapseThread:(id)a3;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
- (void)expandThread:(id)a3;
- (void)expandThreadsFromThreadItemIDs:(id)a3;
- (void)finishRecovery;
- (void)insertItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)insertItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)invalidateCacheForItemIDs:(id)a3;
- (void)notifyChangeObserver:(id)a3 stockedItemIDs:(id)a4;
- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4;
- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)queryMatchedChangedObjectIDs:(id)a3 extraInfo:(id)a4;
- (void)queryMatchedMovedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)queryMatchedMovedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setRecentlyCollapsedItemIDs:(id)a3;
- (void)setRepository:(id)a3;
- (void)setUnfilteredMessageList:(id)a3;
- (void)stopObserving:(id)a3;
@end

@implementation EMMessageList

- (BOOL)anyExpandedThreadContainsItemID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EMMessageList *)self isThreaded]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(EMQueryingCollection *)self containsItemID:v4 includeRecovery:1];

  return v5;
}

- (void)_addPrecachedItemsFromExtraInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v12 = [a3 objectForKeyedSubscript:@"precachedItems"];
  id v4 = [(EMMessageList *)self cache];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v12;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = [v8 objectID];
        v10 = [(EMMessageList *)self itemIDForObjectID:v9];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __49__EMMessageList__addPrecachedItemsFromExtraInfo___block_invoke;
        v14[3] = &unk_1E63E47C8;
        v14[4] = v8;
        id v11 = (id)[v4 objectForKey:v10 generator:v14];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

uint64_t __85__EMMessageList__itemIDsForItemIDs_changeObserver_extraInfo_outObserverSectionIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)itemIDForObjectID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [(EMMessageList *)self isThreaded]
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v6 = [v5 collectionItemID];
      goto LABEL_9;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMMessageList.m" lineNumber:442 description:@"Object ID of unrecognized type"];
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)isThreaded
{
  v3 = [(EMQueryingCollection *)self query];
  char v4 = objc_msgSend((id)objc_msgSend(v3, "targetClass"), "isEqual:", objc_opt_class());

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(EMQueryingCollection *)self query];
  char v5 = objc_msgSend((id)objc_msgSend(v6, "targetClass"), "isEqual:", objc_opt_class());

  return v5;
}

void __88__EMMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setQueryOptions:*(void *)(a1 + 40)];
  [v3 setTargetClassOptions:*(void *)(a1 + 32)];
}

void __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 summary];

  if (!v4)
  {
    [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
    char v5 = +[EMMessageList log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "Missing summary for itemID, refetching: %{public}@\n%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (NSString)ef_publicDescription
{
  id v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    id v5 = [(EMMessageList *)self debugDescription];
  }
  else
  {
    uint64_t v6 = NSString;
    v13.receiver = self;
    v13.super_class = (Class)EMMessageList;
    uint64_t v7 = [(EMObject *)&v13 ef_publicDescription];
    int v8 = [(EMQueryingCollection *)self query];
    uint64_t v9 = [v8 label];
    __int16 v10 = [v6 stringWithFormat:@"%@\n\tquery:%@", v7, v9];

    if ([(EMMessageList *)self isThreaded])
    {
      os_unfair_lock_lock(&self->_expandedThreadsLock);
      uint64_t v11 = (void *)[(NSMutableDictionary *)self->_expandedThreads copy];
      os_unfair_lock_unlock(&self->_expandedThreadsLock);
      id v5 = [NSString stringWithFormat:@"%@\n\tExpandedThreads:%@", v10, v11];
    }
    else
    {
      id v5 = v10;
    }
  }
  return (NSString *)v5;
}

uint64_t __49__EMMessageList__addPrecachedItemsFromExtraInfo___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F60D70] futureWithResult:*(void *)(a1 + 32)];
}

uint64_t __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_155(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (id)messageListItemForItemID:(id)a3
{
  id v3 = [(EMMessageList *)self messageListItemForItemID:a3 ifAvailable:0];
  return v3;
}

- (id)messageListItemForItemID:(id)a3 ifAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v15 = v6;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    uint64_t v9 = [(EMMessageList *)self messageListItemsForItemIDs:v8 ifAvailable:v4];
    __int16 v10 = [v9 firstObject];
  }
  else
  {
    uint64_t v11 = +[EMMessageList log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [(EMMessageList *)self ef_publicDescription];
      -[EMMessageList messageListItemForItemID:ifAvailable:](v12, buf, v11);
    }

    objc_super v13 = (void *)MEMORY[0x1E4F60D70];
    int v8 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", 0);
    __int16 v10 = [v13 futureWithError:v8];
  }

  return v10;
}

id __56__EMMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F60E18] promise];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  id v5 = [v4 future];

  return v5;
}

void __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  int v8 = [v7 future];
  uint64_t v9 = [v6 delegate];
  [v8 setDelegate:v9];

  __int16 v10 = +[EMMessageList log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v21 = v6;
    __int16 v22 = 2114;
    v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "itemFuture %{public}@ -> retryingFuture: %{public}@\n%@", buf, 0x20u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_155;
  v18[3] = &unk_1E63E4868;
  id v12 = v7;
  id v19 = v12;
  [v6 addSuccessBlock:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_2;
  v15[3] = &unk_1E63E49F8;
  v15[4] = *(void *)(a1 + 48);
  id v13 = v5;
  id v16 = v13;
  id v14 = v12;
  id v17 = v14;
  [v6 addFailureBlock:v15];
}

NSObject *__54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2(id *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([a1[4] containsItemID:v3 includeRecovery:0])
  {
    BOOL v4 = [a1[5] cachedObjectForKey:v3];
    if (v4)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_3;
      v25[3] = &unk_1E63E4908;
      id v26 = a1[5];
      id v5 = v3;
      id v6 = a1[4];
      v27[0] = v5;
      v27[1] = v6;
      [v4 addSuccessBlock:v25];
      uint64_t v7 = +[EMMessageList log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = a1[4];
        *(_DWORD *)buf = 138543874;
        id v29 = v5;
        __int16 v30 = 2114;
        v31 = v4;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "Cache hit for %{public}@ returning %{public}@\n%@", buf, 0x20u);
      }

      uint64_t v9 = &v26;
      __int16 v10 = (id *)v27;
      uint64_t v11 = v4;
    }
    else
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_149;
      v21 = &unk_1E63E4958;
      id v13 = a1[5];
      id v24 = a1[6];
      id v14 = v3;
      id v22 = v14;
      id v23 = a1[5];
      uint64_t v11 = [v13 objectForKey:v14 generator:&v18];
      id v15 = +[EMMessageList log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = a1[4];
        *(_DWORD *)buf = 138543874;
        id v29 = v14;
        __int16 v30 = 2114;
        v31 = v11;
        __int16 v32 = 2112;
        id v33 = v16;
        _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "Cache miss for %{public}@ returning %{public}@\n%@", buf, 0x20u);
      }

      uint64_t v9 = &v24;
      __int16 v10 = &v22;
    }
  }
  else
  {
    uint64_t v11 = (*((void (**)(void))a1[6] + 2))();
    BOOL v4 = +[EMMessageList log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = a1[4];
      *(_DWORD *)buf = 138543874;
      id v29 = v3;
      __int16 v30 = 2114;
      v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Unknown item request for %{public}@ returning %{public}@\n%@", buf, 0x20u);
    }
  }

  return v11;
}

- (id)messageListItemsForItemIDs:(id)a3 ifAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[EMMessageList log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = &stru_1F1A3DFB0;
    *(_DWORD *)buf = 138543874;
    if (v4) {
      id v8 = @" available";
    }
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = self;
    _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "Getting%{public}@ message list items: %@\n%@", buf, 0x20u);
  }

  if (v4)
  {
    uint64_t v9 = [(EMMessageList *)self _availableMessageListItemsForItemIDs:v6];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__EMMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke;
    v13[3] = &unk_1E63E48E0;
    id v11 = v10;
    id v14 = v11;
    uint64_t v9 = objc_msgSend(v6, "ef_map:", v13);
    [(EMMessageList *)self _attemptToFinishRetryingPromisesByItemID:v11];
  }
  return v9;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__EMMessageList_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_25 != -1) {
    dispatch_once(&log_onceToken_25, block);
  }
  v2 = (void *)log_log_25;
  return (OS_os_log *)v2;
}

- (void)_attemptToFinishRetryingPromisesByItemID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allKeys];
  id v6 = [(EMMessageList *)self _availableMessageListItemsForItemIDs:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke;
  v9[3] = &unk_1E63E4A20;
  id v10 = v6;
  id v7 = v4;
  id v11 = v7;
  id v12 = self;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v9];
}

- (id)_availableMessageListItemsForItemIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [(EMMessageList *)self cache];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke;
  v28[3] = &unk_1E63E48E0;
  id v7 = v5;
  id v29 = v7;
  id v8 = (void *)MEMORY[0x1C18A2160](v28);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2;
  v25[3] = &unk_1E63E4980;
  void v25[4] = self;
  id v9 = v6;
  id v26 = v9;
  id v10 = v8;
  id v27 = v10;
  objc_msgSend(v4, "ef_map:", v25);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v7 allKeys];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_151;
  v23[3] = &unk_1E63E49A8;
  v23[4] = self;
  id v12 = v7;
  id v24 = v12;
  id v13 = objc_msgSend(v11, "ef_compactMap:", v23);
  if ([v11 count])
  {
    id v14 = [(EMMessageList *)self repository];
    id v15 = [(EMObject *)self objectID];
    id v16 = [v14 messageListItemsForObjectIDs:v13 observationIdentifier:v15];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_153;
    v19[3] = &unk_1E63E49D0;
    id v20 = v13;
    uint64_t v21 = self;
    id v22 = v12;
    [v16 enumerateObjectsUsingBlock:v19];
  }
  return v18;
}

- (NSSet)expandedThreadItemIDs
{
  if ([(EMMessageList *)self isThreaded])
  {
    p_expandedThreadsLock = &self->_expandedThreadsLock;
    os_unfair_lock_lock(&self->_expandedThreadsLock);
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v5 = [(NSMutableDictionary *)self->_expandedThreads allKeys];
    id v6 = (void *)[v4 initWithArray:v5];

    os_unfair_lock_unlock(p_expandedThreadsLock);
  }
  else
  {
    id v6 = 0;
  }
  return (NSSet *)v6;
}

- (EFLazyCache)cache
{
  return self->_cache;
}

- (id)filteredMessageListWithPredicate:(id)a3 ignoredMessagesPredicate:(id)a4 userFiltered:(BOOL)a5
{
  BOOL v5 = a5;
  v34[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a4;
  if (self->_unfilteredMessageList)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"EMMessageList.m" lineNumber:671 description:@"filters can't stack"];
  }
  id v10 = [(EMQueryingCollection *)self query];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  id v12 = [v10 predicate];
  v34[0] = v12;
  v34[1] = v9;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  id v14 = [v11 andPredicateWithSubpredicates:v13];

  id v15 = [v10 targetClassOptions];
  id v16 = (void *)[v15 mutableCopy];

  if (v30)
  {
    if (!v16)
    {
      id v16 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    [v16 setObject:v30 forKeyedSubscript:@"EMMessageListIgnoreMessageAdditionsPredicate"];
  }
  if (v5) {
    unint64_t v17 = [v10 queryOptions] & 0xFFFFFFFFFFFFEFFFLL;
  }
  else {
    unint64_t v17 = [v10 queryOptions];
  }
  id v18 = [EMQuery alloc];
  uint64_t v19 = [v10 targetClass];
  id v20 = objc_msgSend(v14, "ef_simplifiedPredicate");
  uint64_t v21 = [v10 sortDescriptors];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __88__EMMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke;
  v31[3] = &unk_1E63E4818;
  unint64_t v33 = v17;
  id v22 = v16;
  id v32 = v22;
  id v23 = [(EMQuery *)v18 initWithTargetClass:v19 predicate:v20 sortDescriptors:v21 builder:v31];

  id v24 = objc_alloc((Class)objc_opt_class());
  uint64_t v25 = [(EMMessageList *)self repository];
  id v26 = (void *)[v24 initWithQuery:v23 repository:v25];

  [v26 setFilterPredicate:v9];
  [v26 setUnfilteredMessageList:self];

  return v26;
}

- (void)setUnfilteredMessageList:(id)a3
{
}

- (void)setFilterPredicate:(id)a3
{
}

- (EMMessageList)initWithMailboxes:(id)a3 repository:(id)a4 sortDescriptors:(id)a5 sectionPredicates:(id)a6 transformPredicate:(id)a7 ignoreMessageAdditionsPredicate:(id)a8 targetClass:(Class)a9 additionalQueryOptions:(unint64_t)a10 countOfItemsToPrecache:(unint64_t)a11 shouldUpdateDisplayDate:(BOOL)a12 labelPrefix:(id)a13 shouldShowBundle:(BOOL)a14
{
  id v20 = a3;
  id v21 = a4;
  id v39 = a5;
  id v41 = a6;
  id v22 = (void (**)(id, id))a7;
  id v23 = a8;
  id v24 = a13;
  v38 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"EMMessageList.m", 256, @"Invalid parameter not satisfying: %@", @"[repository isKindOfClass:[EMMessageRepository class]]" object file lineNumber description];
  }
  id v25 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v20];
  id v26 = v25;
  if (v22)
  {
    id v26 = v22[2](v22, v25);
  }
  if (a12)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v28 = (id)objc_msgSend(v27, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"UpdateDisplayDate", 0);
    if (v23)
    {
      if (v28) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    id v29 = v28;
    if (a11) {
      goto LABEL_12;
    }
  }
  else
  {
    if (v23)
    {
LABEL_10:
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_11:
      id v29 = v28;
      [v28 setObject:v23 forKeyedSubscript:@"EMMessageListIgnoreMessageAdditionsPredicate"];
      if (!a11) {
        goto LABEL_17;
      }
LABEL_12:
      if (v29)
      {
LABEL_16:
        __int16 v30 = [NSNumber numberWithUnsignedInteger:a11];
        [v29 setObject:v30 forKeyedSubscript:@"precacheItemsWithCount"];

        goto LABEL_17;
      }
LABEL_15:
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      goto LABEL_16;
    }
    if (a11) {
      goto LABEL_15;
    }
    id v29 = 0;
  }
LABEL_17:
  if ([v41 count])
  {
    if (!v29) {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    [v29 setObject:v41 forKeyedSubscript:@"SectionPredicates"];
  }
  v31 = (void *)[[NSString alloc] initWithFormat:@"%@-%p", v24, self];
  id v32 = [EMQuery alloc];
  unint64_t v33 = objc_msgSend(v26, "ef_simplifiedPredicate");
  uint64_t v34 = [(EMQuery *)v32 initWithTargetClass:a9 predicate:v33 sortDescriptors:v39 queryOptions:a10 | 8 targetClassOptions:v29 label:v31];

  v35 = [(EMMessageList *)self initWithQuery:v34 repository:v21];
  return v35;
}

- (EMMessageList)initWithQuery:(id)a3 repository:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"EMMessageList.m", 319, @"Invalid parameter not satisfying: %@", @"[repository isKindOfClass:[EMMessageRepository class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)EMMessageList;
  id v9 = [(EMQueryingCollection *)&v13 initWithObjectID:0 query:v7];
  id v10 = v9;
  if (v9) {
    [(EMMessageList *)v9 _commonInitWithRepository:v8];
  }

  return v10;
}

- (void)_commonInitWithRepository:(id)a3
{
  id v36 = a3;
  if ([(EMMessageList *)self isThreaded])
  {
    self->_expandedThreadsLock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    expandedThreads = self->_expandedThreads;
    self->_expandedThreads = v4;

    id v6 = [(EMQueryingCollection *)self query];
    id v7 = [v6 predicate];
    id v8 = [v36 mailboxRepository];
    id v9 = +[EMMessageListItemPredicates threadScopeForPredicate:v7 withMailboxTypeResolver:v8];
    threadScope = self->_threadScope;
    self->_threadScope = v9;
  }
  id v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  messageListItemsForRetry = self->_messageListItemsForRetry;
  self->_messageListItemsForRetry = v11;

  id v13 = objc_alloc(MEMORY[0x1E4F60DA0]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = (EFLocked *)[v13 initWithObject:v14];
  itemIDSections = self->_itemIDSections;
  self->_itemIDSections = v15;

  unint64_t v17 = (EFLazyCache *)[objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:200];
  cache = self->_cache;
  self->_cache = v17;

  [(EMMessageList *)self setRepository:v36];
  uint64_t v19 = [(EMQueryingCollection *)self query];
  id v20 = [v19 predicate];
  id v21 = [v36 mailboxRepository];
  id v22 = +[EMMessageListItemPredicates mailboxScopeForPredicate:v20 withMailboxTypeResolver:v21];
  mailboxScope = self->_mailboxScope;
  self->_mailboxScope = v22;

  id v24 = (void *)MEMORY[0x1E4F60F28];
  id v25 = [NSString stringWithFormat:@"com.apple.email.%@.observerScheduler", objc_opt_class()];
  id v26 = [v24 serialDispatchQueueSchedulerWithName:v25];
  observerScheduler = self->_observerScheduler;
  self->_observerScheduler = v26;

  id v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v29 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.email.EMMessageList.contentProtectionQueue", v28);
  contentProtectionQueue = self->_contentProtectionQueue;
  self->_contentProtectionQueue = v29;

  EFRegisterContentProtectionObserver();
  v31 = [EMCollectionItemIDStateCapturer alloc];
  id v32 = (objc_class *)objc_opt_class();
  unint64_t v33 = NSStringFromClass(v32);
  uint64_t v34 = [(EMCollectionItemIDStateCapturer *)v31 initWithTitle:v33 delegate:self];
  stateCapturer = self->_stateCapturer;
  self->_stateCapturer = v34;
}

- (void)setRepository:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMMessageList.m" lineNumber:57 description:@"Wrong repository type"];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMMessageList;
  [(EMRepositoryObject *)&v7 setRepository:v5];
}

void __73__EMMessageList_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    if _os_feature_enabled_impl() && (objc_opt_respondsToSelector())
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = [v4 _hintsByObjectIDFromExtraInfo:*(void *)(a1 + 40)];
      [v3 collection:v4 shouldHighlightSnippetHints:v5];
    }
    id v6 = [*(id *)(a1 + 32) _unreadItemIDsFromExtraInfo:*(void *)(a1 + 40)];
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    objc_super v7 = [*(id *)(a1 + 32) _itemIDsForItemIDs:*(void *)(a1 + 48) changeObserver:v3 extraInfo:*(void *)(a1 + 40) outObserverSectionIndex:&v16];
    if (objc_msgSend(v7, "ef_isEmpty"))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id v9 = *(id *)(v8 + 40);
      id v10 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v9;
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) _adjustedItemIDToInsertBeforeForExistingItemID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sectionIndex:v16];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }

    [v3 collection:*(void *)(a1 + 32) addedItemIDs:v7 toThreadWithItemID:0 before:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) unreadItemIDs:v6];
    id v13 = +[EMMessageList log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_debug_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEBUG, "<%p> [section %lu] Adding %{public}@ before %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    [v3 collection:*(void *)(a1 + 32) addedItemIDs:*(void *)(a1 + 48) before:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
}

- (id)_unreadItemIDsFromExtraInfo:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 objectForKeyedSubscript:@"unreadMessageIDs"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__EMMessageList__unreadItemIDsFromExtraInfo___block_invoke;
    v8[3] = &unk_1E63E4778;
    v8[4] = self;
    id v6 = objc_msgSend(v5, "ef_map:", v8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_hintsByObjectIDFromExtraInfo:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectForKeyedSubscript:@"snippetHintsByObjectID"];
    id v5 = objc_opt_new();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__EMMessageList__hintsByObjectIDFromExtraInfo___block_invoke;
    v8[3] = &unk_1E63E47A0;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(EMMessageList *)self _addPrecachedItemsFromExtraInfo:v10];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__7;
  v17[4] = __Block_byref_object_dispose__7;
  id v18 = (id)0xAAAAAAAAAAAAAAAALL;
  id v18 = [(EMQueryingCollection *)self firstExistingItemIDAfterItemID:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__EMMessageList_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke;
  v13[3] = &unk_1E63E47F0;
  void v13[4] = self;
  id v11 = v10;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  uint64_t v16 = v17;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v13];

  _Block_object_dispose(v17, 8);
}

- (void)insertItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(EMMessageList *)self _updateSectionsWithItemIDs:v8 extraInfo:v10];
  v11.receiver = self;
  v11.super_class = (Class)EMMessageList;
  [(EMQueryingCollection *)&v11 insertItemIDs:v8 before:v9 extraInfo:v10];
}

- (void)_updateSectionsWithItemIDs:(id)a3 extraInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EMMessageList *)self _sectionPredicates];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [(EMMessageList *)self _sectionedObjectIDsFromExtraInfo:v7];
    itemIDSections = self->_itemIDSections;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__EMMessageList__updateSectionsWithItemIDs_extraInfo___block_invoke;
    v13[3] = &unk_1E63E4750;
    id v14 = v10;
    id v15 = v6;
    id v12 = v10;
    [(EFLocked *)itemIDSections performWhileLocked:v13];
  }
}

- (id)_itemIDsForItemIDs:(id)a3 changeObserver:(id)a4 extraInfo:(id)a5 outObserverSectionIndex:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v11 sectionForCollection:self];
    id v14 = [(EMMessageList *)self _sectionedObjectIDsFromExtraInfo:v12];
    id v15 = v14;
    if (v13)
    {
      uint64_t v16 = [v14 objectForKeyedSubscript:v13];
      id v17 = (id)v16;
      id v18 = (void *)MEMORY[0x1E4F1CBF0];
      if (v16) {
        id v18 = (void *)v16;
      }
      id v19 = v18;
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      __int16 v21 = [v15 allValues];
      id v22 = objc_msgSend(v21, "ef_flatten");
      __int16 v23 = (void *)[v20 initWithArray:v22];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __85__EMMessageList__itemIDsForItemIDs_changeObserver_extraInfo_outObserverSectionIndex___block_invoke;
      v25[3] = &unk_1E63E4840;
      id v26 = v23;
      id v17 = v23;
      objc_msgSend(v10, "ef_filter:", v25);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6) {
      *a6 = [(EMMessageList *)self _sectionIndexForIdentifier:v13];
    }
  }
  else
  {
    id v19 = v10;
  }

  return v19;
}

- (id)_sectionedObjectIDsFromExtraInfo:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectForKeyedSubscript:@"collectionItemIDBySections"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)_sectionIndexForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(EMMessageList *)self _sectionPredicates];
  id v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 indexOfKey:v4];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)_sectionPredicates
{
  v2 = [(EMQueryingCollection *)self query];
  id v3 = [v2 targetClassOptions];
  id v4 = [v3 objectForKeyedSubscript:@"SectionPredicates"];

  return v4;
}

- (id)_adjustedItemIDToInsertBeforeForExistingItemID:(id)a3 sectionIndex:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = [(EMMessageList *)self _sectionIndexForItemID:v6];
    unint64_t v8 = v7;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || v7 <= a4)
    {
      if (v7 == a4) {
        goto LABEL_10;
      }
      uint64_t v9 = +[EMMessageList log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v11 = 134218498;
        unint64_t v12 = a4;
        __int16 v13 = 2114;
        unint64_t v14 = (unint64_t)v6;
        __int16 v15 = 2048;
        unint64_t v16 = v8;
        _os_log_fault_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_FAULT, "Attempting to insert items from section %lu before item %{public}@ in previous section %lu", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      uint64_t v9 = +[EMMessageList log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138543874;
        unint64_t v12 = (unint64_t)v6;
        __int16 v13 = 2048;
        unint64_t v14 = v8;
        __int16 v15 = 2048;
        unint64_t v16 = a4;
        _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_INFO, "Existing item %{public}@ in section %lu, inserting at end of section %lu", (uint8_t *)&v11, 0x20u);
      }
    }

    id v6 = 0;
  }
LABEL_10:
  return v6;
}

- (EMMessageRepository)repository
{
  v7.receiver = self;
  v7.super_class = (Class)EMMessageList;
  id v4 = [(EMRepositoryObject *)&v7 repository];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMMessageList.m" lineNumber:57 description:@"Wrong repository type"];
    }
  }
  return (EMMessageRepository *)v4;
}

void __20__EMMessageList_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_25;
  log_log_25 = (uint64_t)v1;
}

+ (id)threadedMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 countOfItemsToPrecache:(unint64_t)a6 shouldUpdateDisplayDate:(BOOL)a7 sortDescriptors:(id)a8 sectionPredicates:(id)a9 transformPredicate:(id)a10 ignoreMessageAdditionsPredicate:(id)a11 shouldShowBundle:(BOOL)a12
{
  id v27 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  LOBYTE(v26) = a12;
  LOBYTE(v25) = a7;
  __int16 v23 = (void *)[objc_alloc((Class)a1) initWithMailboxes:v27 repository:v18 sortDescriptors:v19 sectionPredicates:v20 transformPredicate:v21 ignoreMessageAdditionsPredicate:v22 targetClass:objc_opt_class() additionalQueryOptions:a5 countOfItemsToPrecache:a6 shouldUpdateDisplayDate:v25 labelPrefix:@"EMMessageList-threaded" shouldShowBundle:v26];

  return v23;
}

+ (id)threadedMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 shouldUpdateDisplayDate:(BOOL)a6
{
  BOOL v6 = a6;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = +[EMMessageListItemPredicates sortDescriptorForDateAscending:0];
  v17[0] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  LOBYTE(v16) = 0;
  unint64_t v14 = [a1 threadedMessageListForMailboxes:v10 withRepository:v11 additionalQueryOptions:a5 countOfItemsToPrecache:0 shouldUpdateDisplayDate:v6 sortDescriptors:v13 sectionPredicates:0 transformPredicate:0 ignoreMessageAdditionsPredicate:0 shouldShowBundle:v16];

  return v14;
}

+ (id)simpleMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 shouldUpdateDisplayDate:(BOOL)a6
{
  BOOL v6 = a6;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = +[EMMessageListItemPredicates sortDescriptorForDateAscending:0];
  v17[0] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  LOBYTE(v16) = 0;
  unint64_t v14 = [a1 simpleMessageListForMailboxes:v10 withRepository:v11 additionalQueryOptions:a5 countOfItemsToPrecache:0 shouldUpdateDisplayDate:v6 sortDescriptors:v13 transformPredicate:0 ignoreMessageAdditionsPredicate:0 shouldShowBundle:v16];

  return v14;
}

+ (id)simpleMessageListForMailboxes:(id)a3 withRepository:(id)a4 additionalQueryOptions:(unint64_t)a5 countOfItemsToPrecache:(unint64_t)a6 shouldUpdateDisplayDate:(BOOL)a7 sortDescriptors:(id)a8 transformPredicate:(id)a9 ignoreMessageAdditionsPredicate:(id)a10 shouldShowBundle:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  LOBYTE(v25) = a11;
  LOBYTE(v24) = a7;
  id v22 = (void *)[objc_alloc((Class)a1) initWithMailboxes:v17 repository:v18 sortDescriptors:v19 sectionPredicates:0 transformPredicate:v20 ignoreMessageAdditionsPredicate:v21 targetClass:objc_opt_class() additionalQueryOptions:a5 countOfItemsToPrecache:a6 shouldUpdateDisplayDate:v24 labelPrefix:@"EMMessageList-simple" shouldShowBundle:v25];

  return v22;
}

+ (id)groupedCommerceSenderMessageListForMailboxes:(id)a3 withRepository:(id)a4 grouping:(int64_t)a5 sectionPredicates:(id)a6 countOfItemsToPrecache:(unint64_t)a7
{
  objc_super v7 = [a1 groupedCommerceSenderMessageListForMailboxes:a3 withRepository:a4 grouping:a5 sectionPredicates:a6 countOfItemsToPrecache:a7 transformPredicate:0];
  return v7;
}

+ (id)groupedCommerceSenderMessageListForMailboxes:(id)a3 withRepository:(id)a4 grouping:(int64_t)a5 sectionPredicates:(id)a6 countOfItemsToPrecache:(unint64_t)a7 transformPredicate:(id)a8
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v30 = a4;
  id v13 = a6;
  id v29 = v13;
  v31 = (void (**)(id, id))a8;
  id v14 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:a3];
  id v32 = v14;
  if (v31)
  {
    id v32 = v31[2](v31, v14);
  }
  if ([v13 count])
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v13, @"SectionPredicates", 0);
    if (a7)
    {
      id v16 = (id)v15;
      if (v15)
      {
LABEL_9:
        id v17 = [NSNumber numberWithUnsignedInteger:a7];
        [v16 setObject:v17 forKeyedSubscript:@"precacheItemsWithCount"];

        goto LABEL_12;
      }
LABEL_8:
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      goto LABEL_9;
    }
    id v16 = (id)v15;
  }
  else
  {
    if (a7) {
      goto LABEL_8;
    }
    id v16 = 0;
  }
LABEL_12:
  id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"EMMessageList-grouped-%p", a1);
  id v19 = +[EMMessageListItemPredicates sortDescriptorForKeyPath:@"displayDate" ascending:0];
  v37[0] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];

  id v21 = [EMQuery alloc];
  uint64_t v22 = objc_opt_class();
  __int16 v23 = objc_msgSend(v32, "ef_simplifiedPredicate");
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __146__EMMessageList_groupedCommerceSenderMessageListForMailboxes_withRepository_grouping_sectionPredicates_countOfItemsToPrecache_transformPredicate___block_invoke;
  v33[3] = &unk_1E63E4700;
  uint64_t v36 = 72;
  id v24 = v18;
  id v34 = v24;
  id v25 = v16;
  id v35 = v25;
  uint64_t v26 = [(EMQuery *)v21 initWithTargetClass:v22 predicate:v23 sortDescriptors:v20 builder:v33];

  id v27 = (void *)[objc_alloc((Class)a1) initWithQuery:v26 repository:v30];
  return v27;
}

void __146__EMMessageList_groupedCommerceSenderMessageListForMailboxes_withRepository_grouping_sectionPredicates_countOfItemsToPrecache_transformPredicate___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setLimit:0];
  [v3 setQueryOptions:a1[6]];
  [v3 setLabel:a1[4]];
  [v3 setTargetClassOptions:a1[5]];
}

- (EMMessageList)initWithMessageList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 query];
  BOOL v6 = [v4 repository];
  objc_super v7 = [(EMMessageList *)self initWithQuery:v5 repository:v6];

  if (v7)
  {
    unint64_t v8 = [v4 filterPredicate];

    if (v8)
    {
      uint64_t v9 = [v4 filterPredicate];
      [(EMMessageList *)v7 setFilterPredicate:v9];

      id v10 = [EMMessageList alloc];
      id v11 = [v4 unfilteredMessageList];
      unint64_t v12 = [v11 query];
      id v13 = [v4 unfilteredMessageList];
      id v14 = [v13 repository];
      uint64_t v15 = [(EMMessageList *)v10 initWithQuery:v12 repository:v14];
      [(EMMessageList *)v7 setUnfilteredMessageList:v15];
    }
  }

  return v7;
}

- (EMMessageList)initWithObjectID:(id)a3 query:(id)a4 repository:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EMMessageList.m", 309, @"Invalid parameter not satisfying: %@", @"[repository isKindOfClass:[EMMessageRepository class]]" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)EMMessageList;
  unint64_t v12 = [(EMQueryingCollection *)&v16 initWithObjectID:v9 query:v10];
  id v13 = v12;
  if (v12) {
    [(EMMessageList *)v12 _commonInitWithRepository:v11];
  }

  return v13;
}

- (void)dealloc
{
  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EMMessageList;
  [(EMQueryingCollection *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithMessageList:self];
}

- (NSString)debugDescription
{
  objc_super v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)EMMessageList;
  id v4 = [(EMObject *)&v11 debugDescription];
  id v5 = [(EMQueryingCollection *)self query];
  BOOL v6 = [v5 debugDescription];
  objc_super v7 = [v3 stringWithFormat:@"%@\n\tquery:%@", v4, v6];

  if ([(EMMessageList *)self isThreaded])
  {
    os_unfair_lock_lock(&self->_expandedThreadsLock);
    unint64_t v8 = (void *)[(NSMutableDictionary *)self->_expandedThreads copy];
    os_unfair_lock_unlock(&self->_expandedThreadsLock);
    id v9 = [NSString stringWithFormat:@"%@\n\tExpandedThreads:%@", v7, v8];
  }
  else
  {
    id v9 = v7;
  }

  return (NSString *)v9;
}

- (void)stopObserving:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMMessageList;
  [(EMQueryingCollection *)&v7 stopObserving:v4];
  id v5 = [(EMMessageList *)self cache];
  [v5 removeAllObjects];

  os_unfair_lock_lock(&self->_expandedThreadsLock);
  BOOL v6 = [(NSMutableDictionary *)self->_expandedThreads allValues];
  [(NSMutableDictionary *)self->_expandedThreads removeAllObjects];
  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  [v6 makeObjectsPerformSelector:sel_stopObserving_ withObject:self];
}

- (id)objectIDForItemID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [EMMessageObjectID alloc];
      BOOL v6 = [(EMMessageList *)self mailboxScope];
      uint64_t v7 = [(EMMessageObjectID *)v5 initWithCollectionItemID:v4 mailboxScope:v6];
LABEL_9:
      id v10 = (void *)v7;

      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(EMMessageList *)self isThreaded])
    {
      unint64_t v8 = [EMThreadObjectID alloc];
      BOOL v6 = [(EMMessageList *)self threadScope];
      uint64_t v7 = [(EMThreadObjectID *)v8 initWithCollectionItemID:v4 threadScope:v6];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [EMGroupedSenderObjectID alloc];
      BOOL v6 = [(EMMessageList *)self threadScope];
      uint64_t v7 = [(EMGroupedSenderObjectID *)v9 initWithCollectionItemID:v4 threadScope:v6];
      goto LABEL_9;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)objectIDBelongsToCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(EMMessageList *)self mailboxScope];
    uint64_t v7 = [v5 mailboxScope];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![(EMMessageList *)self isThreaded])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v10 = 0;
        goto LABEL_8;
      }
    }
    id v9 = v4;
    BOOL v6 = [(EMMessageList *)self threadScope];
    uint64_t v7 = [v9 threadScope];
    char v8 = [v6 isEqual:v7];
  }
  BOOL v10 = v8;

LABEL_8:
  return v10;
}

- (void)insertItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(EMMessageList *)self _updateSectionsWithItemIDs:v8 extraInfo:v10];
  v11.receiver = self;
  v11.super_class = (Class)EMMessageList;
  [(EMQueryingCollection *)&v11 insertItemIDs:v8 after:v9 extraInfo:v10];
}

void __54__EMMessageList__updateSectionsWithItemIDs_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __54__EMMessageList__updateSectionsWithItemIDs_extraInfo___block_invoke_2;
  v17[3] = &unk_1E63E4728;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v12, (void)v13) & 1) == 0) {
          [v6 setObject:0 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v9);
  }
}

void __54__EMMessageList__updateSectionsWithItemIDs_extraInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v10, (void)v11);
        [*(id *)(a1 + 40) addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)removeItemIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = [(EMMessageList *)self cache];
        [v9 removeObjectForKey:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [(EMMessageList *)self _sectionPredicates];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    itemIDSections = self->_itemIDSections;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __31__EMMessageList_removeItemIDs___block_invoke;
    v16[3] = &unk_1E63E3B08;
    id v17 = v4;
    [(EFLocked *)itemIDSections performWhileLocked:v16];
  }
  v15.receiver = self;
  v15.super_class = (Class)EMMessageList;
  long long v13 = [(EMQueryingCollection *)&v15 removeItemIDs:v4];

  return v13;
}

uint64_t __31__EMMessageList_removeItemIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectsForKeys:*(void *)(a1 + 32)];
}

id __45__EMMessageList__unreadItemIDsFromExtraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) itemIDForObjectID:a2];
  return v2;
}

void __47__EMMessageList__hintsByObjectIDFromExtraInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "globalMessageID"));
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(EMMessageList *)self _addPrecachedItemsFromExtraInfo:v10];
  v17[0] = 0;
  v17[1] = v17;
  void v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__7;
  void v17[4] = __Block_byref_object_dispose__7;
  id v18 = (id)0xAAAAAAAAAAAAAAAALL;
  id v18 = [(EMQueryingCollection *)self firstExistingItemIDBeforeItemID:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__EMMessageList_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke;
  v13[3] = &unk_1E63E47F0;
  void v13[4] = self;
  id v11 = v10;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  uint64_t v16 = v17;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v13];

  _Block_object_dispose(v17, 8);
}

void __72__EMMessageList_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    if _os_feature_enabled_impl() && (objc_opt_respondsToSelector())
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = [v4 _hintsByObjectIDFromExtraInfo:*(void *)(a1 + 40)];
      [v3 collection:v4 shouldHighlightSnippetHints:v5];
    }
    uint64_t v6 = [*(id *)(a1 + 32) _unreadItemIDsFromExtraInfo:*(void *)(a1 + 40)];
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    id v7 = [*(id *)(a1 + 32) _itemIDsForItemIDs:*(void *)(a1 + 48) changeObserver:v3 extraInfo:*(void *)(a1 + 40) outObserverSectionIndex:&v16];
    if (objc_msgSend(v7, "ef_isEmpty"))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id v9 = *(id *)(v8 + 40);
      id v10 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v9;
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) _adjustedItemIDToInsertAfterForExistingItemID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sectionIndex:v16];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }

    [v3 collection:*(void *)(a1 + 32) addedItemIDs:v7 toThreadWithItemID:0 after:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) unreadItemIDs:v6];
    long long v13 = +[EMMessageList log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v7;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_debug_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEBUG, "<%p> [section %lu] Adding %{public}@ after %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    [v3 collection:*(void *)(a1 + 32) addedItemIDs:*(void *)(a1 + 48) after:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
}

- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4
{
}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = 0;
  v17[1] = v17;
  void v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__7;
  void v17[4] = __Block_byref_object_dispose__7;
  id v18 = (id)0xAAAAAAAAAAAAAAAALL;
  id v18 = [(EMQueryingCollection *)self firstExistingItemIDAfterItemID:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__EMMessageList_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke;
  v13[3] = &unk_1E63E47F0;
  void v13[4] = self;
  id v11 = v8;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  uint64_t v16 = v17;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v13];

  _Block_object_dispose(v17, 8);
}

void __73__EMMessageList_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = [*(id *)(a1 + 32) _itemIDsForItemIDs:*(void *)(a1 + 40) changeObserver:v3 extraInfo:*(void *)(a1 + 48) outObserverSectionIndex:&v11];
  if ([v4 count])
  {
    uint64_t v5 = [*(id *)(a1 + 32) _adjustedItemIDToInsertBeforeForExistingItemID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sectionIndex:v11];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [v3 collection:*(void *)(a1 + 32) movedItemIDs:v4 before:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v8 = +[EMMessageList log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v4;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_debug_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEBUG, "<%p> [section %lu] Moved %{public}@ before %{public}@", buf, 0x2Au);
    }
  }
}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = 0;
  v17[1] = v17;
  void v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__7;
  void v17[4] = __Block_byref_object_dispose__7;
  id v18 = (id)0xAAAAAAAAAAAAAAAALL;
  id v18 = [(EMQueryingCollection *)self firstExistingItemIDBeforeItemID:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__EMMessageList_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke;
  v13[3] = &unk_1E63E47F0;
  void v13[4] = self;
  id v11 = v8;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  __int16 v16 = v17;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v13];

  _Block_object_dispose(v17, 8);
}

void __72__EMMessageList_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = [*(id *)(a1 + 32) _itemIDsForItemIDs:*(void *)(a1 + 40) changeObserver:v3 extraInfo:*(void *)(a1 + 48) outObserverSectionIndex:&v11];
  if ([v4 count])
  {
    uint64_t v5 = [*(id *)(a1 + 32) _adjustedItemIDToInsertAfterForExistingItemID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sectionIndex:v11];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [v3 collection:*(void *)(a1 + 32) movedItemIDs:v4 after:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v8 = +[EMMessageList log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v4;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_debug_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEBUG, "<%p> [section %lu] Moved %{public}@ after %{public}@", buf, 0x2Au);
    }
  }
}

- (void)notifyChangeObserver:(id)a3 stockedItemIDs:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v7 collection:self addedItemIDs:v6 toThreadWithItemID:0 before:0 unreadItemIDs:0];
  }
  else {
    [v7 collection:self addedItemIDs:v6 before:0];
  }
}

- (EMMessageList)unfilteredMessageList
{
  if (self->_unfilteredMessageList) {
    self = self->_unfilteredMessageList;
  }
  return self;
}

- (id)_sectionIdentifierForIndex:(unint64_t)a3
{
  id v4 = [(EMMessageList *)self _sectionPredicates];
  uint64_t v5 = [v4 keyAtIndex:a3];

  return v5;
}

- (unint64_t)_sectionIndexForItemID:(id)a3
{
  id v4 = [(EMMessageList *)self _sectionIdentierForItemID:a3];
  unint64_t v5 = [(EMMessageList *)self _sectionIndexForIdentifier:v4];

  return v5;
}

- (id)_sectionIdentierForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  __int16 v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  itemIDSections = self->_itemIDSections;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__EMMessageList__sectionIdentierForItemID___block_invoke;
  v9[3] = &unk_1E63E3E60;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  [(EFLocked *)itemIDSections performWhileLocked:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__EMMessageList__sectionIdentierForItemID___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_adjustedItemIDToInsertAfterForExistingItemID:(id)a3 sectionIndex:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = [(EMMessageList *)self _sectionIndexForItemID:v6];
    unint64_t v8 = v7;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_14;
      }
      uint64_t v9 = +[EMMessageList log];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      int v11 = 138543874;
      unint64_t v12 = (unint64_t)v6;
      __int16 v13 = 2048;
      unint64_t v14 = v8;
      __int16 v15 = 2048;
      unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      if (v7 >= a4)
      {
        if (v7 == a4) {
          goto LABEL_14;
        }
        uint64_t v9 = +[EMMessageList log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          int v11 = 134218498;
          unint64_t v12 = a4;
          __int16 v13 = 2114;
          unint64_t v14 = (unint64_t)v6;
          __int16 v15 = 2048;
          unint64_t v16 = v8;
          _os_log_fault_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_FAULT, "Attempting to insert items from section %lu after item %{public}@ in following section %lu", (uint8_t *)&v11, 0x20u);
        }
        goto LABEL_13;
      }
      uint64_t v9 = +[EMMessageList log];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        id v6 = 0;
        goto LABEL_14;
      }
      int v11 = 138543874;
      unint64_t v12 = (unint64_t)v6;
      __int16 v13 = 2048;
      unint64_t v14 = v8;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
    }
    _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_INFO, "Existing item %{public}@ in section %lu, inserting at start of section %lu", (uint8_t *)&v11, 0x20u);
    goto LABEL_13;
  }
LABEL_14:
  return v6;
}

- (void)expandThreadsFromThreadItemIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(EMMessageList *)self isThreaded])
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EMMessageList.m" lineNumber:855 description:@"Message list does not support threading"];
  }
  [(EMMessageList *)self messageListItemsForItemIDs:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __48__EMMessageList_expandThreadsFromThreadItemIDs___block_invoke;
        v12[3] = &unk_1E63E4868;
        v12[4] = self;
        [v10 addSuccessBlock:v12];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __48__EMMessageList_expandThreadsFromThreadItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) expandThread:v3];
  }
}

- (void)expandThread:(id)a3
{
  id v8 = a3;
  if (![(EMMessageList *)self isThreaded])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMMessageList.m" lineNumber:868 description:@"Message list does not support threading"];
  }
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  expandedThreads = self->_expandedThreads;
  id v6 = [v8 itemID];
  [(NSMutableDictionary *)expandedThreads setObject:v8 forKeyedSubscript:v6];

  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  [v8 beginObserving:self];
}

- (void)collapseThread:(id)a3
{
  id v5 = a3;
  if (![(EMMessageList *)self isThreaded])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"EMMessageList.m" lineNumber:878 description:@"Message list does not support threading"];
  }
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  expandedThreads = self->_expandedThreads;
  uint64_t v7 = [v5 itemID];
  [(NSMutableDictionary *)expandedThreads removeObjectForKey:v7];

  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  id v8 = [v5 allItemIDs];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__EMMessageList_collapseThread___block_invoke;
  v12[3] = &unk_1E63E48B8;
  v12[4] = self;
  id v9 = v5;
  id v13 = v9;
  [v8 addSuccessBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__EMMessageList_collapseThread___block_invoke_4;
  v11[3] = &unk_1E63E4330;
  v11[4] = self;
  [v8 addFailureBlock:v11];
}

void __32__EMMessageList_collapseThread___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)[*(id *)(a1 + 32) removeItemIDs:v3];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  [*(id *)(a1 + 32) setRecentlyCollapsedItemIDs:v5];

  [*(id *)(a1 + 40) stopObserving:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 32) observerScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__EMMessageList_collapseThread___block_invoke_2;
  v8[3] = &unk_1E63E2760;
  void v8[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v9 = v7;
  [v6 performBlock:v8];
}

void __32__EMMessageList_collapseThread___block_invoke_2(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__EMMessageList_collapseThread___block_invoke_3;
  v2[3] = &unk_1E63E4890;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObserversWithBlock:v2];
}

uint64_t __32__EMMessageList_collapseThread___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 collection:*(void *)(a1 + 32) deletedItemIDs:*(void *)(a1 + 40)];
}

void __32__EMMessageList_collapseThread___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[EMMessageList log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_msgSend(v3, "ef_publicDescription");
    __32__EMMessageList_collapseThread___block_invoke_4_cold_1(v5, v6, v7, v4);
  }
}

- (BOOL)recentlyCollapsedThreadContainsItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EMMessageList *)self recentlyCollapsedItemIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)clearRecentlyCollapsedThread
{
}

- (id)messageListItemsForItemIDs:(id)a3
{
  id v3 = [(EMMessageList *)self messageListItemsForItemIDs:a3 ifAvailable:0];
  return v3;
}

id __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60E18] promise];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  uint64_t v5 = [v4 future];

  return v5;
}

id __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_149(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2_150;
  v4[3] = &unk_1E63E4930;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [v2 addFailureBlock:v4];

  return v2;
}

uint64_t __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_2_150(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

id __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_151(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (uint64_t *)(a1 + 32);
  id v5 = [*(id *)(a1 + 32) objectIDForItemID:v3];
  if (!v5)
  {
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", v3);
    [v6 finishWithError:v7];

    uint64_t v8 = +[EMMessageList log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_151_cold_1((uint64_t)v3, v4, v8);
    }
  }
  return v5;
}

void __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_153(id *a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a1[4] objectAtIndexedSubscript:a3];
  id v7 = [a1[5] itemIDForObjectID:v6];
  uint64_t v8 = [a1[6] objectForKeyedSubscript:v7];
  [v8 finishWithFuture:v5];
  id v9 = +[EMMessageList log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = a1[5];
    int v13 = 138543874;
    long long v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "Future for item: %{public}@ -> %{public}@\n%@", (uint8_t *)&v13, 0x20u);
  }

  int v11 = [v5 delegate];
  unint64_t v12 = [v8 future];
  [v12 setDelegate:v11];
}

void __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:@"EMErrorDomain"])
  {

    goto LABEL_5;
  }
  uint64_t v5 = [v3 code];

  if (v5 != 1025)
  {
LABEL_5:
    [a1[6] finishWithError:v3];
    goto LABEL_6;
  }
  id v6 = [a1[4] contentProtectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_3;
  block[3] = &unk_1E63E2848;
  id v7 = a1[5];
  id v8 = a1[4];
  id v10 = v7;
  id v11 = v8;
  id v12 = a1[6];
  dispatch_async(v6, block);

LABEL_6:
}

void __58__EMMessageList__attemptToFinishRetryingPromisesByItemID___block_invoke_3(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = EFProtectedDataAvailable();
  id v3 = +[EMMessageList log];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Retrying for item: %{public}@\n%@", buf, 0x16u);
    }

    id v7 = (void *)a1[5];
    uint64_t v8 = a1[6];
    uint64_t v12 = a1[4];
    uint64_t v13 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v7 _attemptToFinishRetryingPromisesByItemID:v9];
  }
  else
  {
    if (v4)
    {
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Adding item for retry when unlocked: %{public}@\n%@", buf, 0x16u);
    }

    [*(id *)(a1[5] + 112) setObject:a1[6] forKey:a1[4]];
  }
}

- (void)invalidateCacheForItemIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EMMessageList *)self cache];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)itemIDOfMessageListItemWithDisplayMessage:(id)a3
{
  id v4 = a3;
  if ([(EMMessageList *)self isThreaded])
  {
    uint64_t v5 = -[EMThreadCollectionItemID initWithConversationID:]([EMThreadCollectionItemID alloc], "initWithConversationID:", [v4 conversationID]);
  }
  else
  {
    uint64_t v5 = [v4 itemID];
  }
  id v6 = v5;
  if ([(EMQueryingCollection *)self containsItemID:v5 includeRecovery:0]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)finishRecovery
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)EMMessageList;
  [(EMQueryingCollection *)&v17 finishRecovery];
  id v3 = [(EMMessageList *)self cache];
  [v3 removeAllObjects];

  if ([(EMMessageList *)self isThreaded])
  {
    os_unfair_lock_lock(&self->_expandedThreadsLock);
    id v4 = [(NSMutableDictionary *)self->_expandedThreads allValues];
    os_unfair_lock_unlock(&self->_expandedThreadsLock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
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
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = objc_msgSend(v9, "allItemIDs", (void)v13);
          long long v11 = [v10 resultIfAvailable];

          if ([v11 count])
          {
            long long v12 = [v9 itemID];
            [(EMMessageList *)self insertItemIDs:v11 after:v12 extraInfo:0];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [(EMMessageList *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v5);

  if (EFProtectedDataAvailable())
  {
    uint64_t v6 = [(NSMapTable *)self->_messageListItemsForRetry dictionaryRepresentation];
    if ([v6 count])
    {
      uint64_t v7 = +[EMMessageList log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v6 allKeys];
        int v9 = 138543618;
        long long v10 = v8;
        __int16 v11 = 2114;
        long long v12 = self;
        _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "Retrying for items: %{public}@\n%{public}@", (uint8_t *)&v9, 0x16u);
      }
      [(EMMessageList *)self _attemptToFinishRetryingPromisesByItemID:v6];
      [(NSMapTable *)self->_messageListItemsForRetry removeAllObjects];
    }
  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EMMessageList.m", 1133, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v12 = v9;
    if ([(EMMessageList *)self _threadIsExpanded:v12])
    {
      if (!v11)
      {
        uint64_t v13 = [v12 itemID];
        id v11 = [(EMMessageList *)self _nextThreadItemIDAfterThreadItemID:v13];
      }
      [(EMMessageList *)self insertItemIDs:v10 before:v11 extraInfo:0];
      long long v14 = [(EMMessageList *)self observerScheduler];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __48__EMMessageList_collection_addedItemIDs_before___block_invoke;
      v16[3] = &unk_1E63E4008;
      void v16[4] = self;
      id v11 = v11;
      id v17 = v11;
      id v18 = v10;
      id v19 = v12;
      [v14 performSyncBlock:v16];
    }
  }
}

void __48__EMMessageList_collection_addedItemIDs_before___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) firstExistingItemIDAfterItemID:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__EMMessageList_collection_addedItemIDs_before___block_invoke_2;
  v5[3] = &unk_1E63E4A48;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = v2;
  id v4 = v2;
  [v3 enumerateObserversWithBlock:v5];
}

void __48__EMMessageList_collection_addedItemIDs_before___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = objc_opt_respondsToSelector();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3)
  {
    id v6 = [*(id *)(a1 + 48) itemID];
    [v7 collection:v4 addedItemIDs:v5 toThreadWithItemID:v6 before:*(void *)(a1 + 56) unreadItemIDs:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    [v7 collection:*(void *)(a1 + 32) addedItemIDs:*(void *)(a1 + 40) before:*(void *)(a1 + 56)];
  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"EMMessageList.m", 1165, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v12 = v9;
    if ([(EMMessageList *)self _threadIsExpanded:v12])
    {
      if (!v11)
      {
        id v11 = [v12 itemID];
      }
      [(EMMessageList *)self insertItemIDs:v10 after:v11 extraInfo:0];
      uint64_t v13 = [(EMMessageList *)self observerScheduler];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __47__EMMessageList_collection_addedItemIDs_after___block_invoke;
      v15[3] = &unk_1E63E4008;
      v15[4] = self;
      id v11 = v11;
      id v16 = v11;
      id v17 = v10;
      id v18 = v12;
      [v13 performSyncBlock:v15];
    }
  }
}

void __47__EMMessageList_collection_addedItemIDs_after___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) firstExistingItemIDBeforeItemID:*(void *)(a1 + 40)];
  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__EMMessageList_collection_addedItemIDs_after___block_invoke_2;
  v5[3] = &unk_1E63E4A48;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = v2;
  id v4 = v2;
  [v3 enumerateObserversWithBlock:v5];
}

void __47__EMMessageList_collection_addedItemIDs_after___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = objc_opt_respondsToSelector();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3)
  {
    id v6 = [*(id *)(a1 + 48) itemID];
    [v7 collection:v4 addedItemIDs:v5 toThreadWithItemID:v6 after:*(void *)(a1 + 56) unreadItemIDs:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    [v7 collection:*(void *)(a1 + 32) addedItemIDs:*(void *)(a1 + 40) after:*(void *)(a1 + 56)];
  }
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EMMessageList.m", 1198, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v12 = v9;
    if ([(EMMessageList *)self _threadIsExpanded:v12])
    {
      if (!v11)
      {
        uint64_t v13 = [v12 itemID];
        id v11 = [(EMMessageList *)self _nextThreadItemIDAfterThreadItemID:v13];
      }
      [(EMMessageList *)self insertItemIDs:v10 before:v11 extraInfo:0];
      long long v14 = [(EMMessageList *)self observerScheduler];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __48__EMMessageList_collection_movedItemIDs_before___block_invoke;
      v16[3] = &unk_1E63E2848;
      void v16[4] = self;
      id v11 = v11;
      id v17 = v11;
      id v18 = v10;
      [v14 performSyncBlock:v16];
    }
  }
}

void __48__EMMessageList_collection_movedItemIDs_before___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) firstExistingItemIDAfterItemID:*(void *)(a1 + 40)];
  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__EMMessageList_collection_movedItemIDs_before___block_invoke_2;
  v5[3] = &unk_1E63E4A70;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = v2;
  id v4 = v2;
  [v3 enumerateObserversWithBlock:v5];
}

uint64_t __48__EMMessageList_collection_movedItemIDs_before___block_invoke_2(void *a1, void *a2)
{
  return [a2 collection:a1[4] movedItemIDs:a1[5] before:a1[6]];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"EMMessageList.m", 1226, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v12 = v9;
    if ([(EMMessageList *)self _threadIsExpanded:v12])
    {
      if (!v11)
      {
        id v11 = [v12 itemID];
      }
      [(EMMessageList *)self insertItemIDs:v10 after:v11 extraInfo:0];
      uint64_t v13 = [(EMMessageList *)self observerScheduler];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __47__EMMessageList_collection_movedItemIDs_after___block_invoke;
      v15[3] = &unk_1E63E2848;
      v15[4] = self;
      id v11 = v11;
      id v16 = v11;
      id v17 = v10;
      [v13 performSyncBlock:v15];
    }
  }
}

void __47__EMMessageList_collection_movedItemIDs_after___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) firstExistingItemIDBeforeItemID:*(void *)(a1 + 40)];
  char v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__EMMessageList_collection_movedItemIDs_after___block_invoke_2;
  v5[3] = &unk_1E63E4A70;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = v2;
  id v4 = v2;
  [v3 enumerateObserversWithBlock:v5];
}

uint64_t __47__EMMessageList_collection_movedItemIDs_after___block_invoke_2(void *a1, void *a2)
{
  return [a2 collection:a1[4] movedItemIDs:a1[5] after:a1[6]];
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EMMessageList *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMMessageList collection:changedItemIDs:]", "EMMessageList.m", 1255, "0");
}

- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EMMessageList.m", 1259, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  if (![(EMQueryingCollection *)self isRecovering]
    && [(EMMessageList *)self _threadIsExpanded:v9])
  {
    id v12 = [(EMMessageList *)self observerScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__EMMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke;
    v14[3] = &unk_1E63E2848;
    v14[4] = self;
    id v15 = v10;
    id v16 = v11;
    [v12 performSyncBlock:v14];
  }
}

uint64_t __67__EMMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke(void *a1)
{
  return +[EMMessageListChangeObserverHelper collection:a1[4] notifyChangeObserversAboutChangedItemIDs:a1[5] itemIDsWithCountChanges:a1[6]];
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"EMMessageList.m", 1278, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v9 = [(EMMessageList *)self removeItemIDs:v8];
    id v10 = [(EMMessageList *)self observerScheduler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__EMMessageList_collection_deletedItemIDs___block_invoke;
    v12[3] = &unk_1E63E2760;
    v12[4] = self;
    id v13 = v8;
    [v10 performSyncBlock:v12];
  }
}

void __43__EMMessageList_collection_deletedItemIDs___block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__EMMessageList_collection_deletedItemIDs___block_invoke_2;
  v2[3] = &unk_1E63E4890;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObserversWithBlock:v2];
}

uint64_t __43__EMMessageList_collection_deletedItemIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 collection:*(void *)(a1 + 32) deletedItemIDs:*(void *)(a1 + 40)];
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"EMMessageList.m", 1297, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = [(EMMessageList *)self observerScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke;
  v10[3] = &unk_1E63E2760;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  [v7 performSyncBlock:v10];
}

void __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke_2;
  v2[3] = &unk_1E63E4890;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObserversWithBlock:v2];
}

void __48__EMMessageList_collectionDidFinishInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) itemID];
    [v5 collection:v3 didFinishInitialLoadForThreadWithItemID:v4];
  }
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EMMessageList.m", 1310, @"Invalid parameter not satisfying: %@", @"[collection isKindOfClass:[EMThread class]]" object file lineNumber description];
  }
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v12 = [(EMMessageList *)self observerScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke;
    v14[3] = &unk_1E63E2848;
    v14[4] = self;
    id v15 = v10;
    id v16 = v11;
    [v12 performSyncBlock:v14];
  }
}

void __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke_2;
  v3[3] = &unk_1E63E4A70;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateObserversWithBlock:v3];
}

uint64_t __65__EMMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke_2(void *a1, void *a2)
{
  return [a2 collection:a1[4] replacedExistingItemID:a1[5] withNewItemID:a1[6]];
}

- (void)queryMatchedMovedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(EMMessageList *)self _expandedObjectIDsForObjectIDs:a3];
  v11.receiver = self;
  v11.super_class = (Class)EMMessageList;
  [(EMQueryingCollection *)&v11 queryMatchedMovedObjectIDs:v10 before:v8 extraInfo:v9];
}

- (void)queryMatchedMovedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(EMMessageList *)self _expandedObjectIDsForObjectIDs:a3];
  v11.receiver = self;
  v11.super_class = (Class)EMMessageList;
  [(EMQueryingCollection *)&v11 queryMatchedMovedObjectIDs:v10 after:v8 extraInfo:v9];
}

- (void)queryMatchedChangedObjectIDs:(id)a3 extraInfo:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)EMMessageList;
  id v18 = a4;
  [(EMQueryingCollection *)&v37 queryMatchedChangedObjectIDs:a3 extraInfo:v18];
  id v19 = [v18 objectForKeyedSubscript:@"changesByObjectID"];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__7;
  id v35 = __Block_byref_object_dispose__7;
  id v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke;
  v30[3] = &unk_1E63E4A98;
  v30[4] = &v31;
  id v6 = (void (**)(void, void))MEMORY[0x1C18A2160](v30);
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  unint64_t v7 = [v19 count];
  if (v7 >= [(NSMutableDictionary *)self->_expandedThreads count])
  {
    expandedThreads = self->_expandedThreads;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke_2;
    v28[3] = &unk_1E63E4AC0;
    id v29 = v6;
    [(NSMutableDictionary *)expandedThreads enumerateKeysAndObjectsUsingBlock:v28];
    id v8 = v29;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = [v19 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = [(NSMutableDictionary *)self->_expandedThreads objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          ((void (**)(void, void *))v6)[2](v6, v12);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v39 count:16];
      }
      while (v9);
    }
  }

  os_unfair_lock_unlock(&self->_expandedThreadsLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = (id)v32[5];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        [(EMMessageList *)self collapseThread:*(void *)(*((void *)&v20 + 1) + 8 * j)];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v38 count:16];
    }
    while (v15);
  }

  _Block_object_dispose(&v31, 8);
}

void __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7 && (unint64_t)[v7 count] <= 1)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v3)
    {
      [v3 addObject:v7];
    }
    else
    {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }
}

uint64_t __56__EMMessageList_queryMatchedChangedObjectIDs_extraInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_expandedObjectIDsForObjectIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if ([(EMMessageList *)self isThreaded])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v14;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          [v4 addObject:v9];
          uint64_t v10 = [(EMMessageList *)self itemIDForObjectID:v9];
          if ([(EMMessageList *)self _threadIsExpandedForItemID:v10])
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __48__EMMessageList__expandedObjectIDsForObjectIDs___block_invoke;
            v15[3] = &unk_1E63E4AE8;
            v15[4] = self;
            id v16 = v4;
            id v11 = [(EMQueryingCollection *)self iterateItemIDsStartingAtItemID:v10 inReverse:0 withBlock:v15];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    id v12 = v14;
  }
  else
  {
    id v12 = v14;
    id v4 = v14;
  }

  return v4;
}

uint64_t __48__EMMessageList__expandedObjectIDsForObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v5 = [*(id *)(a1 + 32) objectIDForItemID:v3];
    if (v5) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
  return isKindOfClass & 1;
}

- (void)queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[EMMessageList log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[EMMessageList queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:]((uint64_t)self, v5);
  }

  uint64_t v6 = [(EMMessageList *)self observerScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke;
  v8[3] = &unk_1E63E2760;
  id v7 = v4;
  id v9 = v7;
  uint64_t v10 = self;
  [v6 performSyncBlock:v8];
}

void __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_2;
  v8[3] = &unk_1E63E4B10;
  void v8[4] = *(void *)(a1 + 40);
  id v3 = objc_msgSend(v2, "ef_mapValues:", v8);
  id v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_3;
  v6[3] = &unk_1E63E4890;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObserversWithBlock:v6];
}

id __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2 = [*(id *)(a1 + 32) itemIDForObjectID:a2];
  return v2;
}

void __69__EMMessageList_queryMatchedOldestItemsUpdatedForMailboxesObjectIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 collection:*(void *)(a1 + 32) oldestItemsUpdatedForMailboxes:*(void *)(a1 + 40)];
  }
}

- (BOOL)_threadIsExpanded:(id)a3
{
  id v4 = [a3 itemID];
  LOBYTE(self) = [(EMMessageList *)self _threadIsExpandedForItemID:v4];

  return (char)self;
}

- (BOOL)_threadIsExpandedForItemID:(id)a3
{
  id v4 = a3;
  p_expandedThreadsLock = &self->_expandedThreadsLock;
  os_unfair_lock_lock(&self->_expandedThreadsLock);
  uint64_t v6 = [(NSMutableDictionary *)self->_expandedThreads objectForKeyedSubscript:v4];
  LOBYTE(self) = v6 != 0;

  os_unfair_lock_unlock(p_expandedThreadsLock);
  return (char)self;
}

- (id)_nextThreadItemIDAfterThreadItemID:(id)a3
{
  id v3 = [(EMQueryingCollection *)self iterateItemIDsStartingAtItemID:a3 inReverse:0 withBlock:&__block_literal_global_32];
  return v3;
}

uint64_t __52__EMMessageList__nextThreadItemIDAfterThreadItemID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)itemIDOfFirstMessageListItemMatchingPredicate:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F60E18]);
  uint64_t v6 = [(EMQueryingCollection *)self query];
  id v7 = objc_alloc(MEMORY[0x1E4F28BA0]);
  v23[0] = v4;
  id v8 = [v6 predicate];
  v23[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  uint64_t v10 = (void *)[v7 initWithType:1 subpredicates:v9];

  id v11 = [EMQuery alloc];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v10, "ef_simplifiedPredicate");
  id v14 = [v6 sortDescriptors];
  uint64_t v15 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:queryOptions:label:](v11, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v12, v13, v14, [v6 queryOptions], 0);

  id v16 = [(EMMessageList *)self repository];
  long long v17 = [v5 completionHandlerAdapter];
  [v16 performQuery:v15 limit:1 completionHandler:v17];

  long long v18 = [v5 future];
  long long v19 = [v18 result];
  long long v20 = [v19 firstObject];

  if (v20)
  {
    long long v21 = [(EMMessageList *)self itemIDOfMessageListItemWithDisplayMessage:v20];
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

- (id)labelForStateCapture
{
  id v2 = [(EMQueryingCollection *)self query];
  id v3 = [v2 label];

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  id v3 = [(EMQueryingCollection *)self allItemIDs];
  id v4 = [v3 resultIfAvailable];

  return v4;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (NSSet)recentlyCollapsedItemIDs
{
  return self->_recentlyCollapsedItemIDs;
}

- (void)setRecentlyCollapsedItemIDs:(id)a3
{
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_recentlyCollapsedItemIDs, 0);
  objc_storeStrong((id *)&self->_unfilteredMessageList, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_itemIDSections, 0);
  objc_storeStrong((id *)&self->_messageListItemsForRetry, 0);
  objc_storeStrong((id *)&self->_expandedThreads, 0);
}

void __32__EMMessageList_collapseThread___block_invoke_4_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Failed to collapse thread %{public}@: %{public}@", buf, 0x16u);
}

- (void)messageListItemForItemID:(os_log_t)log ifAvailable:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Attempting to retrieve a messageListItem for a nil itemID from messageList: %{public}@", buf, 0xCu);
}

void __54__EMMessageList__availableMessageListItemsForItemIDs___block_invoke_151_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Invalid item: %{public}@\n%@", (uint8_t *)&v4, 0x16u);
}

- (void)queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_DEBUG, "<%p> Oldest items updated for mailboxes", (uint8_t *)&v2, 0xCu);
}

@end