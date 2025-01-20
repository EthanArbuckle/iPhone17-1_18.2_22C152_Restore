@interface CUIKEditingManager
- (BOOL)_changesExistForObject:(id)a3;
- (BOOL)_closeEditingContext:(id)a3 action:(unint64_t)a4 condition:(unint64_t)a5 shouldClose:(BOOL *)a6;
- (BOOL)_commitChangesForContext:(id)a3 forceCommit:(BOOL)a4 shouldClose:(BOOL *)a5;
- (BOOL)_objectsSupportEditingContexts:(id)a3;
- (BOOL)closeEditingContext:(id)a3;
- (BOOL)closeEditingContext:(id)a3 shouldClose:(BOOL *)a4;
- (BOOL)closeEditingContextAndCommitChanges:(id)a3;
- (BOOL)closeEditingContextAndRevertIfLast:(id)a3;
- (BOOL)closeEditingContextWithoutCommittingChanges:(id)a3;
- (BOOL)commitChangesFromEditingContextWithoutClosing:(id)a3;
- (BOOL)isHidden:(id)a3;
- (CUIKEditingManager)initWithEventStore:(id)a3;
- (EKChangeListener)changeListener;
- (EKEventStore)eventStore;
- (NSMutableDictionary)changeHistory;
- (NSMutableDictionary)changedObjectMap;
- (NSMutableSet)editingContextGroups;
- (id)_allOpenEditingContexts;
- (id)_liveEditedObjectsMatchingPredicate:(id)a3 notInSet:(id)a4;
- (id)_objectsWithLiveEdits:(id)a3 matchingPredicate:(id)a4;
- (id)_openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5;
- (id)changedObjectsCopy;
- (id)eventWithAlias:(id)a3;
- (id)eventWithIdentifier:(id)a3;
- (id)eventsMatchingPredicate:(id)a3;
- (id)eventsWithExternalIdentifier:(id)a3;
- (id)eventsWithIdentifiers:(id)a3;
- (id)openEditingContextWithObject:(id)a3 interfaceType:(unint64_t)a4;
- (id)openEditingContextWithObject:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5;
- (id)openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4;
- (id)openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5;
- (id)remindersMatchingPredicate:(id)a3;
- (id)remindersWithExternalIdentifier:(id)a3;
- (void)_addContextToNewOrExistingGroup:(id)a3;
- (void)addAlias:(id)a3 eventIdentifier:(id)a4;
- (void)applyLiveChangesToObject:(id)a3;
- (void)applyLiveChangesToObjects:(id)a3;
- (void)clearAllLiveChanges;
- (void)clearLiveChangesForObjects:(id)a3;
- (void)fetchEventsMatchingPredicate:(id)a3 completion:(id)a4;
- (void)fetchRemindersMatchingPredicate:(id)a3 completion:(id)a4;
- (void)hide:(id)a3;
- (void)partialSaveObject:(id)a3;
- (void)performWithLock:(id)a3;
- (void)setChangeHistory:(id)a3;
- (void)setChangeListener:(id)a3;
- (void)setChangedObjectMap:(id)a3;
- (void)setEditingContextGroups:(id)a3;
- (void)setEventStore:(id)a3;
- (void)unhide:(id)a3;
@end

@implementation CUIKEditingManager

- (CUIKEditingManager)initWithEventStore:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CUIKEditingManager;
  v5 = [(CUIKEditingManager *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_eventStore, v4);
    uint64_t v7 = objc_opt_new();
    changeListener = v6->_changeListener;
    v6->_changeListener = (EKChangeListener *)v7;

    uint64_t v9 = objc_opt_new();
    changeHistory = v6->_changeHistory;
    v6->_changeHistory = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    changedObjectMap = v6->_changedObjectMap;
    v6->_changedObjectMap = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    hiddenObjects = v6->_hiddenObjects;
    v6->_hiddenObjects = (NSMutableSet *)v13;

    v15 = v6;
  }

  return v6;
}

- (id)openEditingContextWithObject:(id)a3 interfaceType:(unint64_t)a4
{
  return [(CUIKEditingManager *)self openEditingContextWithObject:a3 interfaceType:a4 observer:0];
}

- (id)openEditingContextWithObject:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v14 = a3;
    v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a5;
    id v10 = a3;
    uint64_t v11 = [v8 arrayWithObjects:&v14 count:1];

    v12 = -[CUIKEditingManager openEditingContextWithObjects:interfaceType:observer:](self, "openEditingContextWithObjects:interfaceType:observer:", v11, a4, v9, v14, v15);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4
{
  return [(CUIKEditingManager *)self openEditingContextWithObjects:a3 interfaceType:a4 observer:0];
}

- (id)openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (![(CUIKEditingManager *)self _objectsSupportEditingContexts:v8])
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v16 = @"Objects";
    v17[0] = v8;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v15 = [v12 exceptionWithName:v13 reason:@"Editing Contexts not supported for all objects." userInfo:v14];

    objc_exception_throw(v15);
  }
  id v10 = [(CUIKEditingManager *)self _openEditingContextWithObjects:v8 interfaceType:a4 observer:v9];

  return v10;
}

- (BOOL)_objectsSupportEditingContexts:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v8, "sourceType", (void)v11))
            {
              BOOL v9 = 0;
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (id)_openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = [[CUIKEditingContext alloc] initWithObjects:v8 interfaceType:a4 observer:v9];
    [(CUIKEditingContext *)v10 setEditingManager:self];
    long long v11 = [(CUIKEditingManager *)self changeListener];
    [v11 registerDelegate:v10];

    [(CUIKEditingManager *)self _addContextToNewOrExistingGroup:v10];
  }
  else
  {
    id v10 = 0;
  }
  long long v12 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = [v8 valueForKey:@"specificIdentifier"];
    int v15 = 134218242;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_1BDF08000, v12, OS_LOG_TYPE_DEFAULT, "Opened editing context %p with objects: %@", (uint8_t *)&v15, 0x16u);
  }

  return v10;
}

- (void)_addContextToNewOrExistingGroup:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CUIKEditingManager *)self editingContextGroups];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    [(CUIKEditingManager *)self setEditingContextGroups:v6];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [(CUIKEditingManager *)self editingContextGroups];
  uint64_t v8 = [(CUIKObjectGroup *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v13 = [v12 objectGroup];
        long long v14 = [v4 objectsBeingEdited];
        int v15 = [(CUIKEditingContextGroup *)v13 objectsBelongInGroup:v14];

        if (v15)
        {
          [v12 addContext:v4];
          goto LABEL_13;
        }
      }
      uint64_t v9 = [(CUIKObjectGroup *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = [CUIKObjectGroup alloc];
  __int16 v17 = [v4 objectsBeingEdited];
  uint64_t v7 = [(CUIKObjectGroup *)v16 initWithObjects:v17];

  long long v13 = [[CUIKEditingContextGroup alloc] initWithObjectGroup:v7];
  v18 = [(CUIKEditingManager *)self eventStore];
  [(CUIKEditingContextGroup *)v13 setEventStore:v18];

  [(CUIKEditingContextGroup *)v13 addContext:v4];
  uint64_t v19 = [(CUIKEditingManager *)self editingContextGroups];
  [v19 addObject:v13];

LABEL_13:
}

- (void)partialSaveObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingManager partialSaveObject:](v4);
  }

  uint64_t v6 = [v4 specificIdentifier];
  if (v6)
  {
    uint64_t v7 = [v4 changeSet];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__CUIKEditingManager_partialSaveObject___block_invoke;
    v9[3] = &unk_1E6369A70;
    v9[4] = self;
    id v10 = v6;
    id v11 = v4;
    id v12 = v7;
    uint64_t v8 = v7;
    [(CUIKEditingManager *)self performWithLock:v9];
  }
  else
  {
    uint64_t v8 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CUIKEditingManager partialSaveObject:](v8);
    }
  }
}

void __40__CUIKEditingManager_partialSaveObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) changeHistory];
  id v11 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = v11;
  if (v11)
  {
    id v4 = [*(id *)(a1 + 48) changeSet];
    [v11 addChanges:v4 shouldCopyKeyCallback:&__block_literal_global_33];

    uint64_t v5 = [*(id *)(a1 + 32) changedObjectMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

    [v6 addChangesFromObject:*(void *)(a1 + 48) copyingBackingObjects:0];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 56);
    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v8 = (void *)[v7 copy];
    uint64_t v9 = [*(id *)(a1 + 32) changeHistory];
    [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

    uint64_t v6 = (void *)[*(id *)(a1 + 48) copy];
    id v10 = [*(id *)(a1 + 32) changedObjectMap];
    [v10 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v3 = v11;
LABEL_6:
}

uint64_t __40__CUIKEditingManager_partialSaveObject___block_invoke_2()
{
  return 0;
}

- (void)applyLiveChangesToObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingManager applyLiveChangesToObject:](v4);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CUIKEditingManager_applyLiveChangesToObject___block_invoke;
  v7[3] = &unk_1E6369CC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CUIKEditingManager *)self performWithLock:v7];
}

void __47__CUIKEditingManager_applyLiveChangesToObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) changeHistory];
  id v3 = [*(id *)(a1 + 40) specificIdentifier];
  id v5 = [v2 objectForKeyedSubscript:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 40) applyChanges:v5];
    id v4 = v5;
  }
}

- (void)applyLiveChangesToObjects:(id)a3
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
        [(CUIKEditingManager *)self applyLiveChangesToObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)clearLiveChangesForObjects:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingManager clearLiveChangesForObjects:](v4);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CUIKEditingManager_clearLiveChangesForObjects___block_invoke;
  v7[3] = &unk_1E6369CC8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  [(CUIKEditingManager *)self performWithLock:v7];
}

void __49__CUIKEditingManager_clearLiveChangesForObjects___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "specificIdentifier", (void)v12);
        if (v8)
        {
          long long v9 = [*(id *)(a1 + 40) changeHistory];
          [v9 removeObjectForKey:v8];

          long long v10 = [*(id *)(a1 + 40) changedObjectMap];
          [v10 removeObjectForKey:v8];
        }
        else
        {
          long long v10 = +[CUIKLogSubsystem editingContext];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            __49__CUIKEditingManager_clearLiveChangesForObjects___block_invoke_cold_1(v16, v7, &v17, v10);
          }
        }

        long long v11 = [v7 uniqueIdentifier];
        if (v11) {
          [*(id *)(*(void *)(a1 + 40) + 8) removeObject:v11];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void)clearAllLiveChanges
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BDF08000, log, OS_LOG_TYPE_DEBUG, "Clearing all live changes", v1, 2u);
}

void __41__CUIKEditingManager_clearAllLiveChanges__block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  [*(id *)(a1 + 32) setChangeHistory:v2];

  uint64_t v3 = objc_opt_new();
  [*(id *)(a1 + 32) setChangedObjectMap:v3];

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

- (id)changedObjectsCopy
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__14;
  long long v9 = __Block_byref_object_dispose__14;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__CUIKEditingManager_changedObjectsCopy__block_invoke;
  v4[3] = &unk_1E636B1A0;
  v4[4] = self;
  v4[5] = &v5;
  [(CUIKEditingManager *)self performWithLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__CUIKEditingManager_changedObjectsCopy__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) changedObjectMap];
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = *(void **)(*(void *)(a1 + 32) + 8);
        long long v12 = objc_msgSend(v10, "uniqueIdentifier", (void)v16);
        LOBYTE(v11) = [v11 containsObject:v12];

        if ((v11 & 1) == 0)
        {
          long long v13 = (void *)[v10 copy];
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v4;
}

- (id)_objectsWithLiveEdits:(id)a3 matchingPredicate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v9 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (-[CUIKEditingManager _changesExistForObject:](self, "_changesExistForObject:", v15, (void)v19))
        {
          [(CUIKEditingManager *)self applyLiveChangesToObject:v15];
          long long v16 = [v15 specificIdentifier];
          [v9 addObject:v16];

          if (([v15 isDeleted] & 1) != 0
            || [(CUIKEditingManager *)self isHidden:v15]
            || v7 && ![v7 evaluateWithObject:v15])
          {
            continue;
          }
        }
        [v8 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  if (v7)
  {
    long long v17 = [(CUIKEditingManager *)self _liveEditedObjectsMatchingPredicate:v7 notInSet:v9];
    if ([v17 count]) {
      [v8 addObjectsFromArray:v17];
    }
  }

  return v8;
}

- (id)_liveEditedObjectsMatchingPredicate:(id)a3 notInSet:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CUIKEditingManager__liveEditedObjectsMatchingPredicate_notInSet___block_invoke;
  aBlock[3] = &unk_1E636B1C8;
  id v20 = v7;
  id v26 = v20;
  id v9 = v6;
  id v27 = v9;
  id v10 = v8;
  id v28 = v10;
  uint64_t v11 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [(CUIKEditingManager *)self changedObjectsCopy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11[2](v11, v17);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = v10;
  return v18;
}

void __67__CUIKEditingManager__liveEditedObjectsMatchingPredicate_notInSet___block_invoke(id *a1, void *a2)
{
  id v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v12 isDeleted] & 1) == 0)
  {
    id v3 = a1[4];
    uint64_t v4 = [v12 specificIdentifier];
    LOBYTE(v3) = [v3 containsObject:v4];

    if ((v3 & 1) == 0)
    {
      id v5 = v12;
      id v6 = [v5 recurrenceDate];

      if (v6) {
        goto LABEL_14;
      }
      id v7 = (void *)MEMORY[0x1E4F255F0];
      uint64_t v8 = [v5 localUID];
      id v9 = [v5 startDate];
      uint64_t v10 = [v7 recurrenceIdentifierWithLocalUID:v8 recurrenceDate:v9];
      uint64_t v11 = [(id)v10 identifierString];

      LOBYTE(v10) = [a1[4] containsObject:v11];
      if ((v10 & 1) == 0)
      {
LABEL_14:
        if ([a1[5] evaluateWithObject:v5]) {
          [a1[6] addObject:v5];
        }
      }
    }
  }
}

- (BOOL)_changesExistForObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 specificIdentifier];
  id v6 = [v4 uniqueIdentifier];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__CUIKEditingManager__changesExistForObject___block_invoke;
  v10[3] = &unk_1E6369BD8;
  uint64_t v13 = &v14;
  v10[4] = self;
  id v7 = v5;
  id v11 = v7;
  id v8 = v6;
  id v12 = v8;
  [(CUIKEditingManager *)self performWithLock:v10];
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __45__CUIKEditingManager__changesExistForObject___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) changeHistory];
  id v2 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = [*(id *)(*(void *)(a1 + 32) + 8) containsObject:*(void *)(a1 + 48)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
}

- (id)eventsMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(CUIKEditingManager *)self eventStore];
  id v6 = [v5 eventsMatchingPredicate:v4];

  id v7 = [(CUIKEditingManager *)self _objectsWithLiveEdits:v6 matchingPredicate:v4];

  return v7;
}

- (void)fetchEventsMatchingPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CUIKEditingManager *)self eventStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__CUIKEditingManager_fetchEventsMatchingPredicate_completion___block_invoke;
  v12[3] = &unk_1E636B1F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 fetchEventsMatchingPredicate:v10 resultHandler:v12];
}

void __62__CUIKEditingManager_fetchEventsMatchingPredicate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = [*(id *)(a1 + 32) _objectsWithLiveEdits:a2 matchingPredicate:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    char v3 = v5;
  }
}

- (id)eventWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CUIKEditingManager *)self eventStore];
  id v6 = [v5 eventWithIdentifier:v4];

  if (!v6)
  {
    id v6 = [(CUIKEditingManager *)self eventWithAlias:v4];
  }
  [(CUIKEditingManager *)self applyLiveChangesToObject:v6];

  return v6;
}

- (id)eventsWithIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[CUIKEditingManager eventWithIdentifier:](self, "eventWithIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(CUIKEditingManager *)self applyLiveChangesToObjects:v5];
  id v12 = (void *)[v5 copy];

  return v12;
}

- (id)eventsWithExternalIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CUIKEditingManager *)self eventStore];
  id v6 = [v5 calendarItemsWithExternalIdentifier:v4];

  uint64_t v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v7, "addObject:", v13, (void)v15);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(CUIKEditingManager *)self applyLiveChangesToObjects:v7];

  return v7;
}

- (void)hide:(id)a3
{
  id v4 = [a3 valueForKey:@"uniqueIdentifier"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__CUIKEditingManager_hide___block_invoke;
  v6[3] = &unk_1E6369CC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CUIKEditingManager *)self performWithLock:v6];
}

uint64_t __27__CUIKEditingManager_hide___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)unhide:(id)a3
{
  id v4 = [a3 valueForKey:@"uniqueIdentifier"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__CUIKEditingManager_unhide___block_invoke;
  v6[3] = &unk_1E6369CC8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(CUIKEditingManager *)self performWithLock:v6];
}

void __29__CUIKEditingManager_unhide___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "removeObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)isHidden:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__CUIKEditingManager_isHidden___block_invoke;
    v9[3] = &unk_1E636AB68;
    uint64_t v11 = &v12;
    v9[4] = self;
    id v10 = v5;
    [(CUIKEditingManager *)self performWithLock:v9];
  }
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __31__CUIKEditingManager_isHidden___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)addAlias:(id)a3 eventIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CUIKEditingManager_addAlias_eventIdentifier___block_invoke;
  v10[3] = &unk_1E6369D18;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CUIKEditingManager *)self performWithLock:v10];
}

uint64_t __47__CUIKEditingManager_addAlias_eventIdentifier___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(a1[4] + 16);
  }
  uint64_t v7 = a1[5];
  uint64_t v6 = a1[6];

  return [v2 setObject:v6 forKeyedSubscript:v7];
}

- (id)eventWithAlias:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F255F0] recurrenceIdentifierWithString:v4];
  uint64_t v6 = [v5 localUID];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__14;
  id v28 = __Block_byref_object_dispose__14;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__CUIKEditingManager_eventWithAlias___block_invoke;
  v21[3] = &unk_1E636AB68;
  long long v23 = &v24;
  v21[4] = self;
  id v7 = v6;
  id v22 = v7;
  [(CUIKEditingManager *)self performWithLock:v21];
  if (v25[5])
  {
    id v8 = [(CUIKEditingManager *)self eventStore];
    id v9 = [v8 eventWithIdentifier:v25[5]];

    if (v9)
    {
      id v10 = [v5 recurrenceDate];
      if (v10)
      {
        id v11 = (void *)MEMORY[0x1E4F255F0];
        id v12 = [v9 UUID];
        uint64_t v13 = [v5 recurrenceDate];
        uint64_t v14 = [v11 recurrenceIdentifierWithLocalUID:v12 recurrenceDate:v13];

        char v15 = [(CUIKEditingManager *)self eventStore];
        uint64_t v16 = [v15 eventWithRecurrenceIdentifier:v14];

        id v9 = (void *)v16;
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__CUIKEditingManager_eventWithAlias___block_invoke_2;
    v18[3] = &unk_1E636B218;
    v18[4] = self;
    id v19 = v7;
    uint64_t v20 = &v24;
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
  else
  {
    id v9 = 0;
  }

  _Block_object_dispose(&v24, 8);

  return v9;
}

void __37__CUIKEditingManager_eventWithAlias___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __37__CUIKEditingManager_eventWithAlias___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CUIKEditingManager_eventWithAlias___block_invoke_3;
  v5[3] = &unk_1E636B218;
  v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performWithLock:v5];
}

void __37__CUIKEditingManager_eventWithAlias___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  int v3 = [v2 isEqualToString:*(void *)(*(void *)(a1[6] + 8) + 40)];

  if (v3)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void **)(a1[4] + 16);
    [v5 setObject:0 forKeyedSubscript:v4];
  }
}

- (id)remindersMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CUIKEditingManager *)self eventStore];
  id v6 = [v5 remindersMatchingPredicate:v4];

  uint64_t v7 = [(CUIKEditingManager *)self _objectsWithLiveEdits:v6 matchingPredicate:v4];

  return v7;
}

- (void)fetchRemindersMatchingPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CUIKEditingManager *)self eventStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CUIKEditingManager_fetchRemindersMatchingPredicate_completion___block_invoke;
  v12[3] = &unk_1E636B1F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 fetchRemindersMatchingPredicate:v10 completion:v12];
}

void __65__CUIKEditingManager_fetchRemindersMatchingPredicate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) _objectsWithLiveEdits:a2 matchingPredicate:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    int v3 = v5;
  }
}

- (id)remindersWithExternalIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CUIKEditingManager *)self eventStore];
  id v6 = [v5 calendarItemsWithExternalIdentifier:v4];

  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v7, "addObject:", v13, (void)v15);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(CUIKEditingManager *)self applyLiveChangesToObjects:v7];

  return v7;
}

- (BOOL)closeEditingContext:(id)a3
{
  return [(CUIKEditingManager *)self _closeEditingContext:a3 action:1 condition:1 shouldClose:0];
}

- (BOOL)closeEditingContext:(id)a3 shouldClose:(BOOL *)a4
{
  return [(CUIKEditingManager *)self _closeEditingContext:a3 action:1 condition:1 shouldClose:a4];
}

- (BOOL)closeEditingContextAndCommitChanges:(id)a3
{
  return [(CUIKEditingManager *)self _closeEditingContext:a3 action:1 condition:0 shouldClose:0];
}

- (BOOL)closeEditingContextWithoutCommittingChanges:(id)a3
{
  return [(CUIKEditingManager *)self _closeEditingContext:a3 action:0 condition:0 shouldClose:0];
}

- (BOOL)closeEditingContextAndRevertIfLast:(id)a3
{
  return [(CUIKEditingManager *)self _closeEditingContext:a3 action:2 condition:1 shouldClose:0];
}

- (BOOL)_closeEditingContext:(id)a3 action:(unint64_t)a4 condition:(unint64_t)a5 shouldClose:(BOOL *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = v10;
  if (!v10)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"editing context is nil"];
    BOOL v19 = 0;
    goto LABEL_27;
  }
  id v12 = [v10 group];
  unsigned __int8 v25 = 1;
  uint64_t v13 = [v12 activeEditingContextsExcludingContext:v11];
  uint64_t v14 = [v13 count];

  long long v15 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = @"unknown";
    long long v17 = @"unknown";
    if (a4 <= 2) {
      long long v17 = off_1E636B238[a4];
    }
    if (a5 == 1) {
      long long v16 = @"lastOnly";
    }
    if (!a5) {
      long long v16 = @"always";
    }
    long long v18 = v16;
    *(_DWORD *)buf = 134218754;
    id v27 = v11;
    __int16 v28 = 2114;
    id v29 = v17;
    __int16 v30 = 2114;
    v31 = v18;
    __int16 v32 = 2048;
    uint64_t v33 = v14;
    _os_log_impl(&dword_1BDF08000, v15, OS_LOG_TYPE_DEFAULT, "Closing context %p.  action=%{public}@; condition = %{public}@; Other active contexts? %lu",
      buf,
      0x2Au);
  }
  if (!a5 || !v14)
  {
    if (a4 == 2)
    {
      [v11 revert:0];
    }
    else if (a4 == 1)
    {
      BOOL v19 = [(CUIKEditingManager *)self _commitChangesForContext:v11 forceCommit:a5 == 0 shouldClose:&v25];
      int v20 = v25;
      if (!a6)
      {
LABEL_21:
        if (!v20) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
LABEL_20:
      *a6 = v20;
      goto LABEL_21;
    }
    int v20 = 1;
    BOOL v19 = 1;
    if (!a6) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  BOOL v19 = 1;
LABEL_22:
  [v12 removeContext:v11];
LABEL_23:
  if (v12)
  {
    long long v21 = [v12 openContexts];
    uint64_t v22 = [v21 count];

    if (!v22)
    {
      long long v23 = [(CUIKEditingManager *)self editingContextGroups];
      [v23 removeObject:v12];
    }
  }

LABEL_27:
  return v19;
}

- (BOOL)commitChangesFromEditingContextWithoutClosing:(id)a3
{
  return [(CUIKEditingManager *)self _commitChangesForContext:a3 forceCommit:1 shouldClose:0];
}

- (BOOL)_commitChangesForContext:(id)a3 forceCommit:(BOOL)a4 shouldClose:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"editing context is nil"];
LABEL_9:
    char v14 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218240;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    _os_log_impl(&dword_1BDF08000, v9, OS_LOG_TYPE_DEFAULT, "Committing changes in context %p.  Force commit? %d", (uint8_t *)&v19, 0x12u);
  }

  if (![v8 _prepareForCommitWithDecision:v6 shouldClose:a5]) {
    goto LABEL_9;
  }
  id v10 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134217984;
    id v20 = v8;
    _os_log_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_DEFAULT, "Actually committing changes in context %p", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v11 = [(CUIKEditingManager *)self eventStore];
  id v12 = [v8 group];
  uint64_t v13 = [v12 objectsToCommit];
  char v14 = [v11 commitObjects:v13 error:0];

  long long v15 = [v8 group];
  long long v16 = [v15 objectsToCommit];
  long long v17 = [v16 allObjects];
  [(CUIKEditingManager *)self clearLiveChangesForObjects:v17];

LABEL_10:
  return v14;
}

- (id)_allOpenEditingContexts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CUIKEditingManager *)self editingContextGroups];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) openContexts];
        [v3 unionSet:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 allObjects];

  return v10;
}

- (void)performWithLock:(id)a3
{
  id v4 = (void (**)(void))a3;
  self = (CUIKEditingManager *)((char *)self + 24);
  os_unfair_lock_lock((os_unfair_lock_t)self);
  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)self);
}

- (EKEventStore)eventStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  return (EKEventStore *)WeakRetained;
}

- (void)setEventStore:(id)a3
{
}

- (NSMutableSet)editingContextGroups
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEditingContextGroups:(id)a3
{
}

- (EKChangeListener)changeListener
{
  return (EKChangeListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setChangeListener:(id)a3
{
}

- (NSMutableDictionary)changeHistory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChangeHistory:(id)a3
{
}

- (NSMutableDictionary)changedObjectMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setChangedObjectMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedObjectMap, 0);
  objc_storeStrong((id *)&self->_changeHistory, 0);
  objc_storeStrong((id *)&self->_changeListener, 0);
  objc_storeStrong((id *)&self->_editingContextGroups, 0);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_uuidAliases, 0);

  objc_storeStrong((id *)&self->_hiddenObjects, 0);
}

- (void)partialSaveObject:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "Attempting to partial save an object with a nil identifier", v1, 2u);
}

- (void)partialSaveObject:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 specificIdentifier];
  OUTLINED_FUNCTION_7_0(&dword_1BDF08000, v2, v3, "Partial saving object: %@", v4, v5, v6, v7, 2u);
}

- (void)applyLiveChangesToObject:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 specificIdentifier];
  OUTLINED_FUNCTION_7_0(&dword_1BDF08000, v2, v3, "Applying live changes to object: %@", v4, v5, v6, v7, 2u);
}

- (void)clearLiveChangesForObjects:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 valueForKey:@"specificIdentifier"];
  OUTLINED_FUNCTION_7_0(&dword_1BDF08000, v2, v3, "Clearing live changes for objects: %@", v4, v5, v6, v7, 2u);
}

void __49__CUIKEditingManager_clearLiveChangesForObjects___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 objectID];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1BDF08000, a4, OS_LOG_TYPE_ERROR, "Object (%{public}@) does not have a specific identifier.", a1, 0xCu);
}

@end