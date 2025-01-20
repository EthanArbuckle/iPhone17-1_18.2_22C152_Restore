@interface EDMessageRepositoryQueryHandler
- (BOOL)keyPathsAffectSorting:(id)a3;
- (BOOL)start;
- (EDMessagePersistence)messagePersistence;
- (EDMessageRepositoryQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 observer:(id)a7 observationIdentifier:(id)a8;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDRemindMeNotificationController)remindMeNotificationController;
- (EFLocked)summaryLoadersMapTable;
- (EMMessageListItemQueryResultsObserver)resultsObserver;
- (EMObjectID)observationIdentifier;
- (EMQuery)query;
- (NSSet)mailboxes;
- (id)_distinctObjectIDs:(id)a3 queryHandlerLog:(id)a4;
- (id)messageReconciliationQueries;
- (id)threadReconciliationQueries;
- (int64_t)dateSortOrder;
- (void)cancel;
- (void)dealloc;
- (void)requestSummaryForMessageObjectID:(id)a3;
- (void)setSummaryLoadersMapTable:(id)a3;
- (void)test_tearDown;
@end

@implementation EDMessageRepositoryQueryHandler

- (EMQuery)query
{
  return self->_query;
}

- (EDMessageRepositoryQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 observer:(id)a7 observationIdentifier:(id)a8
{
  id v14 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v15 = a7;
  id v16 = a8;
  v31.receiver = self;
  v31.super_class = (Class)EDMessageRepositoryQueryHandler;
  v17 = [(EDMessageRepositoryQueryHandler *)&v31 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    query = v17->_query;
    v17->_query = (EMQuery *)v18;

    objc_storeStrong((id *)&v17->_messagePersistence, a4);
    objc_storeStrong((id *)&v17->_hookRegistry, a5);
    objc_storeStrong((id *)&v17->_remindMeNotificationController, a6);
    objc_storeStrong((id *)&v17->_resultsObserver, a7);
    objc_storeStrong((id *)&v17->_observationIdentifier, a8);
    id v20 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v21 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uint64_t v22 = [v20 initWithObject:v21];
    summaryLoadersMapTable = v17->_summaryLoadersMapTable;
    v17->_summaryLoadersMapTable = (EFLocked *)v22;

    mailboxes = v17->_mailboxes;
    v17->_mailboxes = 0;

    v25 = (void *)MEMORY[0x1E4F60390];
    v26 = [(EMQuery *)v17->_query sortDescriptors];
    v17->_dateSortOrder = [v25 dateSortOrderFromSortDescriptors:v26];
  }
  return v17;
}

- (id)_distinctObjectIDs:(id)a3 queryHandlerLog:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = [MEMORY[0x1E4F60D58] currentDevice];
  int v9 = [v8 isInternal];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v7];
    uint64_t v11 = [v10 count];
    if (v11 != [v7 count])
    {
      v12 = v6;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v14 = [v10 array];
        id v15 = [v7 differenceFromArray:v14];
        id v16 = [v15 debugDescription];
        __b[0] = 138412290;
        *(void *)&__b[1] = v16;
        _os_log_fault_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_FAULT, "Adding objectIDs but duplicate found %@", (uint8_t *)__b, 0xCu);
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

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (BOOL)start
{
  return (atomic_exchange(&self->_didStart._Value, 1u) & 1) == 0;
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  return self->_resultsObserver;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)dealloc
{
  [(EDMessageRepositoryQueryHandler *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)EDMessageRepositoryQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v3 dealloc];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMessageRepositoryQueryHandler.m", 48, @"%s can only be called from unit tests", "-[EDMessageRepositoryQueryHandler test_tearDown]");
  }

  [(EDMessageRepositoryQueryHandler *)self tearDown];
}

- (void)cancel
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__26;
  id v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  summaryLoadersMapTable = self->_summaryLoadersMapTable;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__EDMessageRepositoryQueryHandler_cancel__block_invoke;
  v11[3] = &unk_1E6C03C80;
  v11[4] = &v12;
  [(EFLocked *)summaryLoadersMapTable performWhileLocked:v11];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v13[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancel", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

void __41__EDMessageRepositoryQueryHandler_cancel__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectEnumerator];
  uint64_t v4 = [v3 allObjects];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSSet)mailboxes
{
  mailboxes = self->_mailboxes;
  if (!mailboxes)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F60390];
    uint64_t v5 = [(EMQuery *)self->_query predicate];
    uint64_t v6 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
    id v7 = [v6 mailboxPersistence];
    long long v8 = [v4 mailboxScopeForPredicate:v5 withMailboxTypeResolver:v7];

    char v14 = 0;
    long long v9 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
    long long v10 = [v9 mailboxPersistence];
    uint64_t v11 = [v8 allMailboxObjectIDsWithMailboxTypeResolver:v10 forExclusion:&v14];
    uint64_t v12 = self->_mailboxes;
    self->_mailboxes = v11;

    mailboxes = self->_mailboxes;
  }

  return mailboxes;
}

- (BOOL)keyPathsAffectSorting:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v6 = [v5 sortDescriptors];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) key];
        char v11 = [v4 containsObject:v10];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)requestSummaryForMessageObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__26;
  v23 = __Block_byref_object_dispose__26;
  id v24 = 0;
  summaryLoadersMapTable = self->_summaryLoadersMapTable;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke;
  v16[3] = &unk_1E6C03CA8;
  uint64_t v18 = &v19;
  id v6 = v4;
  id v17 = v6;
  [(EFLocked *)summaryLoadersMapTable performWhileLocked:v16];
  uint64_t v7 = (void *)v20[5];
  if (v7) {
    [v7 cancel];
  }
  uint64_t v8 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
  long long v9 = [v8 requestSummaryForMessageObjectID:v6];

  long long v10 = self->_summaryLoadersMapTable;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke_2;
  v13[3] = &unk_1E6C03CD0;
  id v14 = v9;
  id v11 = v6;
  id v15 = v11;
  id v12 = v9;
  [(EFLocked *)v10 performWhileLocked:v13];

  _Block_object_dispose(&v19, 8);
}

void __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __68__EDMessageRepositoryQueryHandler_requestSummaryForMessageObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (id)messageReconciliationQueries
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EDMessageRepositoryQueryHandler *)self query];
  char v4 = [v3 queryOptions];

  if ((v4 & 8) != 0)
  {
    id v6 = [(EDMessageRepositoryQueryHandler *)self query];
    v8[0] = v6;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)threadReconciliationQueries
{
  return 0;
}

- (int64_t)dateSortOrder
{
  return self->_dateSortOrder;
}

- (EFLocked)summaryLoadersMapTable
{
  return self->_summaryLoadersMapTable;
}

- (void)setSummaryLoadersMapTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLoadersMapTable, 0);
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_storeStrong((id *)&self->_resultsObserver, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_mailboxes, 0);
}

@end