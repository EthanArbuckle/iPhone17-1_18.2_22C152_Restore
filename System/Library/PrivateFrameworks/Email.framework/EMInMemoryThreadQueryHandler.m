@interface EMInMemoryThreadQueryHandler
+ (OS_os_log)log;
- (BOOL)collection:(id)a3 reportChanges:(id)a4;
- (BOOL)collection:(id)a3 reportChanges:(id)a4 reloadSummaries:(BOOL)a5;
- (BOOL)collection:(id)a3 reportDeletes:(id)a4;
- (EMInMemoryThreadCollection)threadCollection;
- (EMInMemoryThreadQueryHandler)initWithQuery:(id)a3 repository:(id)a4 mailboxTypeResolver:(id)a5 resultsObserver:(id)a6 observationIdentifier:(id)a7;
- (EMMessageListItemQueryResultsObserver)resultsObserver;
- (EMMessageRepository)repository;
- (EMObjectID)observationIdentifier;
- (EMThreadReloadSummaryHelper)reloadSummaryHelper;
- (NSSet)mailboxes;
- (id)_distinctObjectIDs:(id)a3 queryHandlerLog:(id)a4;
- (id)_extraInfoForThreadObjectIDs:(id)a3 isMove:(BOOL)a4;
- (id)collection:(id)a3 messagesInConversationIDs:(id)a4 limit:(int64_t)a5;
- (id)mailboxesInCollection:(id)a3;
- (void)collection:(id)a3 didMergeInThreadsForMove:(BOOL)a4 newObjectIDs:(id)a5 existingObjectID:(id)a6 hasChanges:(BOOL *)a7;
- (void)collection:(id)a3 notifyOfOldestThreadsByMailboxObjectIDs:(id)a4;
- (void)collection:(id)a3 notifyReplacedExistingObjectID:(id)a4 newObjectID:(id)a5;
- (void)didSendUpdatesInCollection:(id)a3;
- (void)logThreadObjectIDsChangesWithMessage:(id)a3 newObjectIDs:(id)a4 beforeExistingObjectID:(id)a5;
- (void)logThreadObjectIDsWithMessage:(id)a3 objectIDs:(id)a4;
- (void)requestSummaryForMessageObjectIDs:(id)a3;
@end

@implementation EMInMemoryThreadQueryHandler

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EMInMemoryThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_19 != -1) {
    dispatch_once(&log_onceToken_19, block);
  }
  v2 = (void *)log_log_19;
  return (OS_os_log *)v2;
}

void __35__EMInMemoryThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_19;
  log_log_19 = (uint64_t)v1;
}

- (EMInMemoryThreadQueryHandler)initWithQuery:(id)a3 repository:(id)a4 mailboxTypeResolver:(id)a5 resultsObserver:(id)a6 observationIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v31 = a7;
  v32.receiver = self;
  v32.super_class = (Class)EMInMemoryThreadQueryHandler;
  v16 = [(EMInMemoryThreadQueryHandler *)&v32 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_repository, v13);
    v18 = (void *)MEMORY[0x1E4F60F28];
    v19 = [NSString stringWithFormat:@"com.apple.email.%@.%p", objc_opt_class(), v17];
    uint64_t v20 = [v18 serialDispatchQueueSchedulerWithName:v19 qualityOfService:25];
    threadCollectionScheduler = v17->_threadCollectionScheduler;
    v17->_threadCollectionScheduler = (EFAssertableScheduler *)v20;

    v22 = [EMInMemoryThreadCollection alloc];
    v23 = v17->_threadCollectionScheduler;
    v24 = +[EMInMemoryThreadQueryHandler log];
    LOBYTE(v30) = 0;
    uint64_t v25 = [(EMInMemoryThreadCollection *)v22 initWithQuery:v12 mailboxTypeResolver:v14 dataSource:v17 delgate:v17 scheduler:v23 logClient:v24 limitedCache:v30];
    threadCollection = v17->_threadCollection;
    v17->_threadCollection = (EMInMemoryThreadCollection *)v25;

    objc_storeWeak((id *)&v17->_resultsObserver, v15);
    objc_storeStrong((id *)&v17->_observationIdentifier, a7);
    v27 = objc_alloc_init(EMThreadReloadSummaryHelper);
    reloadSummaryHelper = v17->_reloadSummaryHelper;
    v17->_reloadSummaryHelper = v27;
  }
  return v17;
}

- (NSSet)mailboxes
{
  mailboxes = self->_mailboxes;
  if (!mailboxes)
  {
    v4 = [(EMInMemoryThreadQueryHandler *)self threadCollection];
    v5 = [v4 query];
    v6 = [v5 predicate];
    v7 = [v4 mailboxTypeResolver];
    v8 = +[EMMessageListItemPredicates mailboxScopeForPredicate:v6 withMailboxTypeResolver:v7];

    char v13 = 0;
    v9 = [v4 mailboxTypeResolver];
    v10 = [v8 allMailboxObjectIDsWithMailboxTypeResolver:v9 forExclusion:&v13];
    v11 = self->_mailboxes;
    self->_mailboxes = v10;

    mailboxes = self->_mailboxes;
  }
  return mailboxes;
}

- (id)mailboxesInCollection:(id)a3
{
  id v3 = [(EMInMemoryThreadQueryHandler *)self mailboxes];
  return v3;
}

- (id)collection:(id)a3 messagesInConversationIDs:(id)a4 limit:(int64_t)a5
{
  id v7 = a4;
  v8 = [(EMInMemoryThreadQueryHandler *)self repository];
  v9 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
  v10 = [v8 messagesInConversationIDs:v7 limit:a5 observationIdentifier:v9];

  return v10;
}

- (void)collection:(id)a3 didMergeInThreadsForMove:(BOOL)a4 newObjectIDs:(id)a5 existingObjectID:(id)a6 hasChanges:(BOOL *)a7
{
  BOOL v9 = a4;
  id v18 = a5;
  id v11 = a6;
  id v12 = [(EMInMemoryThreadQueryHandler *)self resultsObserver];
  if (v9)
  {
    if (v11) {
      [(EMInMemoryThreadQueryHandler *)self logThreadObjectIDsChangesWithMessage:@"Moving objectIDs" newObjectIDs:v18 beforeExistingObjectID:v11];
    }
    else {
      [(EMInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Moving objectIDs to end of list:" objectIDs:v18];
    }
    char v13 = [(EMInMemoryThreadQueryHandler *)self _extraInfoForThreadObjectIDs:v18 isMove:1];
    id v14 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
    [v12 observer:v14 matchedMovedObjectIDs:v18 before:v11 extraInfo:v13];

    *a7 = 1;
  }
  else
  {
    if (v11) {
      [(EMInMemoryThreadQueryHandler *)self logThreadObjectIDsChangesWithMessage:@"Adding objectIDs" newObjectIDs:v18 beforeExistingObjectID:v11];
    }
    else {
      [(EMInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Adding objectIDs to end of list" objectIDs:v18];
    }
    id v15 = +[EMInMemoryThreadQueryHandler log];
    char v13 = [(EMInMemoryThreadQueryHandler *)self _distinctObjectIDs:v18 queryHandlerLog:v15];

    v16 = [(EMInMemoryThreadQueryHandler *)self _extraInfoForThreadObjectIDs:v13 isMove:0];
    v17 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
    [v12 observer:v17 matchedAddedObjectIDs:v13 before:v11 extraInfo:v16];

    *a7 = 1;
  }
}

- (void)collection:(id)a3 notifyOfOldestThreadsByMailboxObjectIDs:(id)a4
{
  id v7 = a4;
  v5 = [(EMInMemoryThreadQueryHandler *)self resultsObserver];
  v6 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
  [v5 observer:v6 matchedOldestItemsUpdatedForMailboxes:v7];
}

- (void)collection:(id)a3 notifyReplacedExistingObjectID:(id)a4 newObjectID:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  v8 = [(EMInMemoryThreadQueryHandler *)self resultsObserver];
  BOOL v9 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
  [v8 observer:v9 replacedExistingObjectID:v10 withNewObjectID:v7];
}

- (void)didSendUpdatesInCollection:(id)a3
{
  id v5 = [(EMInMemoryThreadQueryHandler *)self resultsObserver];
  v4 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
  [v5 observer:v4 wasUpdated:0];
}

- (BOOL)collection:(id)a3 reportChanges:(id)a4
{
  return [(EMInMemoryThreadQueryHandler *)self collection:a3 reportChanges:a4 reloadSummaries:1];
}

- (BOOL)collection:(id)a3 reportChanges:(id)a4 reloadSummaries:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  if (v8)
  {
    if (v5)
    {
      BOOL v9 = [(EMInMemoryThreadQueryHandler *)self threadCollection];
      id v10 = [v9 query];
      id v11 = [v10 predicate];
      id v12 = [v9 mailboxTypeResolver];
      char v13 = +[EMMessageListItemPredicates mailboxScopeForPredicate:v11 withMailboxTypeResolver:v12];

      id v14 = [(EMInMemoryThreadQueryHandler *)self reloadSummaryHelper];
      id v15 = [v14 summariesToReloadForChanges:v7 mailboxScope:v13];

      [(EMInMemoryThreadQueryHandler *)self requestSummaryForMessageObjectIDs:v15];
    }
    v16 = [v7 allKeys];
    [(EMInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Changing objectIDs" objectIDs:v16];

    v17 = [(EMInMemoryThreadQueryHandler *)self resultsObserver];
    if (v17)
    {
      id v18 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
      [v17 observer:v18 matchedChangesForObjectIDs:v7];
    }
  }

  return v8 != 0;
}

- (BOOL)collection:(id)a3 reportDeletes:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    id v7 = [v5 array];
    uint64_t v8 = objc_msgSend(v7, "ef_map:", &__block_literal_global_20);

    [(EMInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Deleting objectIDs" objectIDs:v8];
    BOOL v9 = [(EMInMemoryThreadQueryHandler *)self resultsObserver];
    id v10 = [(EMInMemoryThreadQueryHandler *)self observationIdentifier];
    [v9 observer:v10 matchedDeletedObjectIDs:v8];

    [(EMInMemoryThreadCollection *)self->_threadCollection removeThreadProxies:v5 forMove:0];
  }

  return v6 != 0;
}

id __57__EMInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  return v2;
}

- (id)_distinctObjectIDs:(id)a3 queryHandlerLog:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = [MEMORY[0x1E4F60D58] currentDevice];
  int v9 = [v8 isInternal];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v7];
    uint64_t v11 = [v10 count];
    if (v11 != [v7 count])
    {
      id v12 = v6;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v14 = [v10 array];
        id v15 = [v7 differenceFromArray:v14];
        v16 = [v15 debugDescription];
        __b[0] = 138412290;
        *(void *)&__b[1] = v16;
        _os_log_fault_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_FAULT, "Adding objectIDs but duplicate found %@", (uint8_t *)__b, 0xCu);
      }
      memset(__b, 170, sizeof(__b));
      __b[8] = 0;
      *(void *)v19 = 0xE00000001;
      int v20 = 1;
      pid_t v21 = getpid();
      size_t v17 = 648;
      if (!sysctl(v19, 4u, __b, &v17, 0, 0) && (__b[8] & 0x800) != 0) {
        __debugbreak();
      }
    }
  }
  return v7;
}

- (id)_extraInfoForThreadObjectIDs:(id)a3 isMove:(BOOL)a4
{
  uint64_t v4 = a4;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  int v19[2] = __68__EMInMemoryThreadQueryHandler__extraInfoForThreadObjectIDs_isMove___block_invoke;
  v19[3] = &unk_1E63E3EF8;
  v19[4] = self;
  uint64_t v8 = objc_msgSend(v7, "ef_groupBy:", v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__EMInMemoryThreadQueryHandler__extraInfoForThreadObjectIDs_isMove___block_invoke_2;
  v17[3] = &unk_1E63E3F20;
  id v9 = v7;
  id v18 = v9;
  id v10 = objc_msgSend(v8, "ef_mapValues:", v17);

  if (![v10 count])
  {
    char v13 = 0;
    goto LABEL_14;
  }
  if (v4)
  {
    uint64_t v11 = [v10 count];
    if (v11 == 1)
    {
      uint64_t v4 = [v10 allValues];
      uint64_t v8 = [(id)v4 firstObject];
      uint64_t v12 = [v8 count];
      if (v12 == [v9 count])
      {

LABEL_12:
        goto LABEL_13;
      }
    }
    uint64_t v14 = [v10 count];
    if (v11 == 1)
    {
      BOOL v15 = v14 == 0;

      if (v15) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    if (v14)
    {
LABEL_11:
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [(id)v4 handleFailureInMethod:a2 object:self file:@"EMInMemoryThreadQueryHandler.m" lineNumber:182 description:@"We don't allow moving multiple items to different sections"];
      goto LABEL_12;
    }
  }
LABEL_13:
  int v20 = @"collectionItemIDBySections";
  v21[0] = v10;
  char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
LABEL_14:

  return v13;
}

id __68__EMInMemoryThreadQueryHandler__extraInfoForThreadObjectIDs_isMove___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) sectionIdentifierForThreadObjectID:a2];
  return v2;
}

id __68__EMInMemoryThreadQueryHandler__extraInfoForThreadObjectIDs_isMove___block_invoke_2(uint64_t a1)
{
  os_log_t v1 = objc_msgSend(*(id *)(a1 + 32), "ef_mapSelector:", sel_collectionItemID);
  return v1;
}

- (void)logThreadObjectIDsWithMessage:(id)a3 objectIDs:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] < 0xB)
  {
    uint64_t v8 = +[EMInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218498;
      uint64_t v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = (uint64_t)v7;
      _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, 10);
    id v9 = +[EMInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218754;
      uint64_t v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = [v7 count];
      __int16 v16 = 2114;
      size_t v17 = v8;
      _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu : %{public}@ ", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)logThreadObjectIDsChangesWithMessage:(id)a3 newObjectIDs:(id)a4 beforeExistingObjectID:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v9 count] < 0xB)
  {
    uint64_t v11 = +[EMInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218754;
      __int16 v14 = self;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = (uint64_t)v9;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %{public}@ before existing: %{public}@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(v9, "subarrayWithRange:", 0, 10);
    __int16 v12 = +[EMInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134219010;
      __int16 v14 = self;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = [v9 count];
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu before existing: %{public}@ : %{public}@", (uint8_t *)&v13, 0x34u);
    }
  }
}

- (void)requestSummaryForMessageObjectIDs:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(EMInMemoryThreadQueryHandler *)self repository];
  [v4 requestSummaryForObjectIDs:v5];
}

- (EMInMemoryThreadCollection)threadCollection
{
  return self->_threadCollection;
}

- (EMMessageRepository)repository
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_repository);
  return (EMMessageRepository *)WeakRetained;
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsObserver);
  return (EMMessageListItemQueryResultsObserver *)WeakRetained;
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (EMThreadReloadSummaryHelper)reloadSummaryHelper
{
  return self->_reloadSummaryHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadSummaryHelper, 0);
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_destroyWeak((id *)&self->_resultsObserver);
  objc_destroyWeak((id *)&self->_repository);
  objc_storeStrong((id *)&self->_threadCollection, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_threadCollectionScheduler, 0);
}

@end