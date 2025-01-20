@interface EDSearchableIndexState
- (BOOL)clientStateFetched;
- (BOOL)coalesceTimerFired;
- (BOOL)didPreprocessItem:(id)a3;
- (BOOL)indexImmediately;
- (BOOL)isActive;
- (BOOL)needsImmediateProcessing;
- (BOOL)needsRefresh;
- (BOOL)needsToScheduleRefresh;
- (BOOL)needsToScheduleVerification;
- (BOOL)needsVerification;
- (BOOL)persistenceAvailable;
- (BOOL)queueContentsAllowsRefresh;
- (BOOL)scheduledProcessing;
- (BOOL)scheduledRefresh;
- (BOOL)scheduledVerification;
- (EDSearchableIndexState)initWithPendingIdentifierRemovals:(id)a3;
- (NSArray)pendingIdentifiers;
- (NSArray)pendingItems;
- (NSArray)preparingItems;
- (NSArray)preprocessingItems;
- (NSArray)processingItems;
- (NSSet)pendingDomainRemovals;
- (NSSet)removedIdentifiers;
- (_EDSearchableIndexPendingRemovals)pendingIdentifierRemovals;
- (id)prepareToIndexItems:(id)a3;
- (id)processBatchOfSize:(unint64_t)a3;
- (id)removePendingDomainRemovals;
- (int64_t)indexItem:(id)a3;
- (int64_t)resume;
- (int64_t)resumeCount;
- (int64_t)suspend;
- (int64_t)transaction;
- (unint64_t)countOfItemsInPendingQueues;
- (void)didCompleteBacklog;
- (void)didIndexItems:(id)a3;
- (void)didPrepareItems:(id)a3;
- (void)failedToIndexItems:(id)a3;
- (void)removeIdentifiersFromPendingQueues:(id)a3 reasons:(id)a4;
- (void)removeItemsForDomainIdentifier:(id)a3;
- (void)setClientStateFetched:(BOOL)a3;
- (void)setCoalesceTimerFired:(BOOL)a3;
- (void)setIndexImmediately:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setNeedsVerification:(BOOL)a3;
- (void)setPendingIdentifierRemovals:(id)a3;
- (void)setPersistenceAvailable:(BOOL)a3;
- (void)setResumeCount:(int64_t)a3;
- (void)setScheduledProcessing:(BOOL)a3;
- (void)setScheduledRefresh:(BOOL)a3;
- (void)setScheduledVerification:(BOOL)a3;
- (void)setTransaction:(int64_t)a3;
- (void)startReindex;
@end

@implementation EDSearchableIndexState

- (void)setIndexImmediately:(BOOL)a3
{
  self->_indexImmediately = a3;
}

- (void)setCoalesceTimerFired:(BOOL)a3
{
  self->_coalesceTimerFired = a3;
}

- (BOOL)queueContentsAllowsRefresh
{
  v3 = [(EDSearchableIndexState *)self preprocessingItems];
  unint64_t v4 = objc_msgSend(v3, "ef_countObjectsPassingTest:", &__block_literal_global_75);

  unint64_t v5 = [(EDSearchableIndexState *)self countOfItemsInPendingQueues];
  v6 = [(EDSearchableIndexState *)self preprocessingItems];
  uint64_t v7 = [v6 count];

  return v4 <= 0xC && v7 + v5 == 0;
}

- (NSArray)preprocessingItems
{
  return &self->_preprocessingItems->super;
}

- (BOOL)persistenceAvailable
{
  return self->_persistenceAvailable;
}

- (BOOL)needsToScheduleVerification
{
  unint64_t v3 = [(EDSearchableIndexState *)self countOfItemsInPendingQueues];
  if ([(EDSearchableIndexState *)self needsVerification]) {
    BOOL v4 = ![(EDSearchableIndexState *)self scheduledVerification];
  }
  else {
    LOBYTE(v4) = 0;
  }
  return !v3 && v4;
}

- (BOOL)needsVerification
{
  return self->_needsVerification;
}

- (BOOL)needsToScheduleRefresh
{
  BOOL v3 = [(EDSearchableIndexState *)self needsRefresh];
  if (v3) {
    LOBYTE(v3) = ![(EDSearchableIndexState *)self scheduledRefresh];
  }
  return v3;
}

- (BOOL)scheduledRefresh
{
  return self->_scheduledRefresh;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (BOOL)needsImmediateProcessing
{
  unint64_t v3 = [(EDSearchableIndexState *)self countOfItemsInPendingQueues];
  BOOL v4 = [(EDSearchableIndexState *)self pendingDomainRemovals];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = [(EDSearchableIndexState *)self indexImmediately];
    if (v3) {
      BOOL v5 = v6;
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)countOfItemsInPendingQueues
{
  unint64_t v3 = [(EDSearchableIndexState *)self pendingItems];
  uint64_t v4 = [v3 count];
  BOOL v5 = [(EDSearchableIndexState *)self pendingIdentifierRemovals];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [(EDSearchableIndexState *)self pendingDomainRemovals];
  unint64_t v8 = v6 + v4 + [v7 count];

  return v8;
}

- (NSSet)pendingDomainRemovals
{
  return &self->_pendingDomainRemovals->super;
}

- (NSArray)pendingItems
{
  return &self->_pendingItems->super;
}

- (_EDSearchableIndexPendingRemovals)pendingIdentifierRemovals
{
  return self->_pendingIdentifierRemovals;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)indexImmediately
{
  return self->_indexImmediately;
}

- (BOOL)coalesceTimerFired
{
  return self->_coalesceTimerFired;
}

- (BOOL)clientStateFetched
{
  return self->_clientStateFetched;
}

- (id)processBatchOfSize:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EDSearchableIndexState *)self pendingItems];
  unint64_t v5 = [v4 count];

  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  if (v6)
  {
    id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = [(EDSearchableIndexState *)self pendingItems];
    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      unint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v25;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v21 = v10 + v8;
        uint64_t v19 = v10;
        uint64_t v13 = v10 + 1;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
          unint64_t v15 = [v14 estimatedSizeInBytes];
          if (v15 <= 0x2000000) {
            unint64_t v16 = v15;
          }
          else {
            unint64_t v16 = 0;
          }
          v17 = [v14 items];
          [v23 addObjectsFromArray:v17];

          if (v13 + v12 >= v6 || (v9 += v16, v9 >= 0x2000000))
          {
            uint64_t v21 = v19 + v12 + 1;
            uint64_t v7 = obj;
            goto LABEL_21;
          }
          ++v12;
        }
        while (v8 != v12);
        uint64_t v7 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v10 = v21;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
LABEL_21:

    -[NSMutableArray removeObjectsInRange:](self->_pendingItems, "removeObjectsInRange:", 0, v21);
    [(NSMutableArray *)self->_processingItems addObjectsFromArray:v23];
  }
  else
  {
    id v23 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

- (int64_t)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(int64_t)a3
{
  self->_transaction = a3;
}

- (NSArray)pendingIdentifiers
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v4 = [(EDSearchableIndexState *)self pendingItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v30 + 1) + 8 * i) identifier];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v5);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v9 = [(EDSearchableIndexState *)self preprocessingItems];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v26 + 1) + 8 * j) identifier];
        [v3 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = [(EDSearchableIndexState *)self processingItems];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = [*(id *)(*((void *)&v22 + 1) + 8 * k) identifier];
        [v3 addObject:v18];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(EDSearchableIndexState *)self removedIdentifiers];
  [v3 unionSet:v19];

  v20 = [v3 allObjects];

  return (NSArray *)v20;
}

- (void)setScheduledRefresh:(BOOL)a3
{
  self->_scheduledRefresh = a3;
}

- (void)setScheduledProcessing:(BOOL)a3
{
  self->_scheduledProcessing = a3;
}

- (void)setPendingIdentifierRemovals:(id)a3
{
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (BOOL)scheduledProcessing
{
  return self->_scheduledProcessing;
}

- (NSSet)removedIdentifiers
{
  return &self->_removedIdentifiers->super;
}

- (id)removePendingDomainRemovals
{
  id v3 = [(EDSearchableIndexState *)self pendingDomainRemovals];
  uint64_t v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  pendingDomainRemovals = self->_pendingDomainRemovals;
  self->_pendingDomainRemovals = v4;

  return v3;
}

- (NSArray)processingItems
{
  return &self->_processingItems->super;
}

- (void)didIndexItems:(id)a3
{
}

- (EDSearchableIndexState)initWithPendingIdentifierRemovals:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDSearchableIndexState;
  uint64_t v6 = [(EDSearchableIndexState *)&v20 init];
  if (v6)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    removedIdentifiers = v6->_removedIdentifiers;
    v6->_removedIdentifiers = v7;

    unint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    preparingItems = v6->_preparingItems;
    v6->_preparingItems = v9;

    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingItems = v6->_pendingItems;
    v6->_pendingItems = v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    preprocessingItems = v6->_preprocessingItems;
    v6->_preprocessingItems = v13;

    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    processingItems = v6->_processingItems;
    v6->_processingItems = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingDomainRemovals = v6->_pendingDomainRemovals;
    v6->_pendingDomainRemovals = v17;

    objc_storeStrong((id *)&v6->_pendingIdentifierRemovals, a3);
  }

  return v6;
}

BOOL __52__EDSearchableIndexState_queueContentsAllowsRefresh__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  id v3 = +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:v2];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)suspend
{
  int64_t v3 = [(EDSearchableIndexState *)self resumeCount] - 1;
  [(EDSearchableIndexState *)self setResumeCount:v3];
  return v3;
}

- (int64_t)resume
{
  int64_t v3 = [(EDSearchableIndexState *)self resumeCount] + 1;
  [(EDSearchableIndexState *)self setResumeCount:v3];
  return v3;
}

- (id)prepareToIndexItems:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_preparingItems addObjectsFromArray:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__EDSearchableIndexState_prepareToIndexItems___block_invoke;
  v8[3] = &unk_1E6C05D28;
  v8[4] = self;
  id v5 = [v4 indexesOfObjectsPassingTest:v8];
  if ([v5 count])
  {
    uint64_t v6 = [v4 objectsAtIndexes:v5];
    [(NSMutableArray *)self->_preparingItems removeObjectsInArray:v6];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __46__EDSearchableIndexState_prepareToIndexItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) removedIdentifiers];
  id v5 = [v3 identifier];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

- (void)didPrepareItems:(id)a3
{
}

- (BOOL)didPreprocessItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_preprocessingItems indexOfObject:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_preprocessingItems removeObjectAtIndex:v5];
  }

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)indexItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDSearchableIndexState *)self preprocessingItems];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(EDSearchableIndexState *)self preprocessingItems];
    unint64_t v9 = [v8 objectAtIndexedSubscript:v6];

    [v9 addPendingItem:v4];
    int64_t v7 = 1;
LABEL_5:

    goto LABEL_6;
  }
  if ([v4 requiresPreprocessing])
  {
    [(NSMutableArray *)self->_preprocessingItems addObject:v4];
    int64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = [(EDSearchableIndexState *)self pendingItems];
  uint64_t v12 = [v11 indexOfObject:v4];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [(EDSearchableIndexState *)self pendingItems];
    unint64_t v9 = [v17 objectAtIndexedSubscript:v12];

    [v9 addPendingItem:v4];
    int64_t v7 = 2;
    goto LABEL_5;
  }
  uint64_t v13 = [(EDSearchableIndexState *)self pendingItems];
  uint64_t v14 = objc_msgSend(v13, "ef_indexWhereObjectWouldBeInserted:usingComparator:", v4, &__block_literal_global_6);

  [(NSMutableArray *)self->_pendingItems insertObject:v4 atIndex:v14];
  uint64_t v15 = [(EDSearchableIndexState *)self pendingItems];
  unint64_t v16 = [v15 count];

  if (v16 >= 0x800) {
    [(NSMutableArray *)self->_pendingItems removeLastObject];
  }
  int64_t v7 = 3;
LABEL_6:

  return v7;
}

uint64_t __36__EDSearchableIndexState_indexItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)removeIdentifiersFromPendingQueues:(id)a3 reasons:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v22 = a4;
  if ([v23 count])
  {
    [(NSMutableSet *)self->_removedIdentifiers addObjectsFromArray:v23];
    objc_super v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];
    uint64_t v6 = [(EDSearchableIndexState *)self pendingItems];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke;
    v30[3] = &unk_1E6C05D70;
    id v7 = v20;
    id v31 = v7;
    uint64_t v21 = [v6 indexesOfObjectsPassingTest:v30];

    [(NSMutableArray *)self->_pendingItems removeObjectsAtIndexes:v21];
    uint64_t v8 = [(EDSearchableIndexState *)self pendingIdentifierRemovals];
    [v8 addIdentifiers:v23 withReasons:v22];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = [(EDSearchableIndexState *)self preprocessingItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = [v14 identifier];
          int v16 = [v7 containsObject:v15];

          if (v16) {
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v11);
    }

    if ([v9 count]) {
      [(NSMutableArray *)self->_preprocessingItems removeObjectsInArray:v9];
    }
    v17 = [(EDSearchableIndexState *)self preparingItems];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke_2;
    v24[3] = &unk_1E6C05D28;
    id v18 = v7;
    id v25 = v18;
    uint64_t v19 = [v17 indexesOfObjectsPassingTest:v24];

    [(NSMutableArray *)self->_preparingItems removeObjectsAtIndexes:v19];
  }
}

uint64_t __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)removeItemsForDomainIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v3 = [(EDSearchableIndexState *)self pendingItems];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__EDSearchableIndexState_removeItemsForDomainIdentifier___block_invoke;
  v21[3] = &unk_1E6C05D70;
  id v4 = v14;
  id v22 = v4;
  uint64_t v15 = [v3 indexesOfObjectsPassingTest:v21];

  [(NSMutableArray *)self->_pendingItems removeObjectsAtIndexes:v15];
  [(NSMutableSet *)self->_pendingDomainRemovals addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(EDSearchableIndexState *)self preprocessingItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 referenceItem];
        uint64_t v12 = [v11 domainIdentifier];
        int v13 = [v12 hasPrefix:v4];

        if (v13) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  if ([v5 count]) {
    [(NSMutableArray *)self->_preprocessingItems removeObjectsInArray:v5];
  }
}

uint64_t __57__EDSearchableIndexState_removeItemsForDomainIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 referenceItem];
  id v4 = [v3 domainIdentifier];
  uint64_t v5 = [v4 hasPrefix:*(void *)(a1 + 32)];

  return v5;
}

- (void)failedToIndexItems:(id)a3
{
}

- (void)startReindex
{
  [(EDSearchableIndexState *)self setTransaction:0];
  [(EDSearchableIndexState *)self setClientStateFetched:0];
  [(NSMutableArray *)self->_processingItems removeAllObjects];
  [(NSMutableArray *)self->_pendingItems removeAllObjects];
  [(NSMutableArray *)self->_preprocessingItems removeAllObjects];
  [(NSMutableSet *)self->_pendingDomainRemovals removeAllObjects];
  id v3 = [(EDSearchableIndexState *)self pendingIdentifierRemovals];
  [v3 removeAllIdentifiers];
}

- (void)didCompleteBacklog
{
}

- (int64_t)resumeCount
{
  return self->_resumeCount;
}

- (void)setResumeCount:(int64_t)a3
{
  self->_resumeCount = a3;
}

- (NSArray)preparingItems
{
  return &self->_preparingItems->super;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void)setNeedsVerification:(BOOL)a3
{
  self->_needsVerification = a3;
}

- (BOOL)scheduledVerification
{
  return self->_scheduledVerification;
}

- (void)setScheduledVerification:(BOOL)a3
{
  self->_scheduledVerification = a3;
}

- (void)setClientStateFetched:(BOOL)a3
{
  self->_clientStateFetched = a3;
}

- (void)setPersistenceAvailable:(BOOL)a3
{
  self->_persistenceAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingIdentifierRemovals, 0);
  objc_storeStrong((id *)&self->_pendingDomainRemovals, 0);
  objc_storeStrong((id *)&self->_processingItems, 0);
  objc_storeStrong((id *)&self->_preprocessingItems, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_preparingItems, 0);

  objc_storeStrong((id *)&self->_removedIdentifiers, 0);
}

@end