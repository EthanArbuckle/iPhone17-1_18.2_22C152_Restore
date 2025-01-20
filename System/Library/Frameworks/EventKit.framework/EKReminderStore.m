@interface EKReminderStore
+ (BOOL)isNotFoundError:(id)a3;
+ (Class)frozenClassForReminderClass:(Class)a3;
+ (OS_os_log)log;
+ (id)uniqueIdentifierForREMObject:(id)a3;
- (BOOL)_commit:(id *)a3 error:(id *)a4;
- (BOOL)commit:(id *)a3;
- (BOOL)isSourceManaged:(id)a3;
- (BOOL)removeCalendar:(id)a3 error:(id *)a4;
- (BOOL)removeReminder:(id)a3 error:(id *)a4;
- (BOOL)saveCalendar:(id)a3 error:(id *)a4;
- (BOOL)saveObject:(id)a3 withFrozenObject:(id)a4 error:(id *)a5;
- (BOOL)saveReminder:(id)a3 error:(id *)a4;
- (EKEventStore)eventStore;
- (EKReminderStore)initWithEventStore:(id)a3 token:(id)a4;
- (NSArray)calendars;
- (NSArray)sources;
- (REMStore)remStore;
- (id)_allLists;
- (id)_fetchAndCacheConstraintsForFrozenSource:(id)a3;
- (id)_moveRemindersToNewLists:(id)a3 error:(id *)a4;
- (id)backingCalendarWithIdentifier:(id)a3;
- (id)backingReminderWithIdentifier:(id)a3;
- (id)cachedConstraintsForSource:(id)a3;
- (id)calendarWithIdentifier:(id)a3;
- (id)completionBlockForFetchRequestToken:(id)a3 remove:(BOOL)a4;
- (id)createNewReminder;
- (id)createNewReminderCalendar;
- (id)defaultCalendarForNewReminders;
- (id)existingUpdatedObject:(id)a3;
- (id)fetchRemindersMatchingPredicate:(id)a3 completion:(id)a4;
- (id)frozenAlarmForREMAlarms:(id)a3;
- (id)frozenCalendarFromCalendar:(id)a3 error:(id *)a4;
- (id)frozenObjectForReminderObject:(id)a3;
- (id)newFrozenObjectForReminderObject:(id)a3 withChanges:(id)a4;
- (id)predicateForCalendarStoreForRemindersInCalendars:(id)a3;
- (id)predicateForCompletedRemindersWithCompletionDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5;
- (id)predicateForIncompleteRemindersWithDueDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5;
- (id)predicateForRemindersInCalendars:(id)a3;
- (id)reminderWithIdentifier:(id)a3;
- (id)reminderWithUniqueId:(id)a3;
- (id)remindersMatchingPredicate:(id)a3;
- (id)remindersWithExternalIdentifier:(id)a3;
- (id)resetBackingAlarmWithBackingAlarm:(id)a3;
- (id)resetBackingLocationWithBackingLocation:(id)a3;
- (id)sourceWithIdentifier:(id)a3;
- (void)_checkPredicate:(id)a3;
- (void)_loadAccounts;
- (void)_loadAccountsIfNeeded;
- (void)_loadLists;
- (void)_loadListsIfNeeded;
- (void)_reminderCopiedToNewList:(id)a3;
- (void)defaultCalendarForNewReminders;
- (void)fillInPath:(id)a3 usingParents:(id)a4;
- (void)remindersChanged;
- (void)reset;
@end

@implementation EKReminderStore

- (void)remindersChanged
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EKReminderStore_remindersChanged__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(queue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  [WeakRetained reminderStoreChanged];
}

- (EKReminderStore)initWithEventStore:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)EKReminderStore;
  v8 = [(EKReminderStore *)&v30 init];
  if (v8)
  {
    REMStoreClass = (objc_class *)getREMStoreClass();
    if (v7) {
      v10 = (REMStore *)[[REMStoreClass alloc] initWithStoreContainerToken:v7];
    }
    else {
      v10 = (REMStore *)objc_alloc_init(REMStoreClass);
    }
    remStore = v8->_remStore;
    v8->_remStore = v10;

    if (!v8->_remStore)
    {
      v12 = +[EKReminderStore log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[EKReminderStore initWithEventStore:token:](v12);
      }
    }
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.eventkit.EKReminderStore.queue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    newObjectsIDs = v8->_newObjectsIDs;
    v8->_newObjectsIDs = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    updatedObjects = v8->_updatedObjects;
    v8->_updatedObjects = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objectIDsToCommit = v8->_objectIDsToCommit;
    v8->_objectIDsToCommit = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedObjects = v8->_deletedObjects;
    v8->_deletedObjects = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objectsToReset = v8->_objectsToReset;
    v8->_objectsToReset = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedConstraints = v8->_cachedConstraints;
    v8->_cachedConstraints = v25;

    objc_storeWeak((id *)&v8->_eventStore, v6);
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v28 = [getREMStoreClass() storeDidChangeNotificationName];
    [v27 addObserver:v8 selector:sel_remindersChanged name:v28 object:0];
  }
  return v8;
}

uint64_t __35__EKReminderStore_remindersChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  id v6 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v6 removeAllObjects];
}

+ (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)log_log;

  return (OS_os_log *)v2;
}

uint64_t __22__EKReminderStore_log__block_invoke()
{
  os_log_t v0 = os_log_create(ekSubSystem, "Reminders");
  uint64_t v1 = log_log;
  log_log = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_loadAccountsIfNeeded
{
  if (!self->_sources) {
    [(EKReminderStore *)self _loadAccounts];
  }
}

- (void)_loadAccounts
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error fetching reminder accounts: %@", v2, v3, v4, v5, v6);
}

- (NSArray)sources
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EKReminderStore_sources__block_invoke;
  block[3] = &unk_1E5B96E30;
  block[4] = self;
  void block[5] = &v18;
  dispatch_sync(queue, block);
  uint64_t v4 = (void *)v19[5];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (id)v19[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          v11 = [(EKObject *)[EKSource alloc] initWithPersistentObject:v10];
          [v5 addObject:v11];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return (NSArray *)v5;
}

void __26__EKReminderStore_sources__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadAccountsIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (id)sourceWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EKReminderStore *)self sources];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "sourceIdentifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)cachedConstraintsForSource:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  id v5 = [v4 backingObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    uint64_t v7 = [WeakRetained reminderSourceForEventSource:v5];

    uint64_t v8 = [v7 backingObject];

    id v5 = (void *)v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v5;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__EKReminderStore_cachedConstraintsForSource___block_invoke;
    block[3] = &unk_1E5B97028;
    id v15 = v9;
    long long v16 = &v17;
    block[4] = self;
    dispatch_sync(queue, block);
    id v11 = (id)v18[5];
  }
  else
  {
    v12 = +[EKReminderStore log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[EKReminderStore cachedConstraintsForSource:]();
    }

    id v11 = 0;
  }

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __46__EKReminderStore_cachedConstraintsForSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) sourceIdentifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 32) _fetchAndCacheConstraintsForFrozenSource:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void *)(v8 + 40);
    *(void *)(v8 + 40) = v7;
    MEMORY[0x1F41817F8](v7, v9);
  }
}

- (id)_fetchAndCacheConstraintsForFrozenSource:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [v4 remAccount];
  if (!v6)
  {
    uint64_t v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[EKReminderStore _fetchAndCacheConstraintsForFrozenSource:]();
    }
    goto LABEL_15;
  }
  uint64_t v7 = [v4 remAccount];
  uint64_t v8 = [v7 capabilities];

  if (!v8)
  {
    long long v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[EKReminderStore _fetchAndCacheConstraintsForFrozenSource:](v4, v16);
    }

LABEL_15:
    id v15 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [v8 supportsLocation];
  v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v4 remAccount];
    v12 = [v4 remAccount];
    int v18 = 138413058;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 1024;
    int v23 = [v12 type];
    __int16 v24 = 1024;
    int v25 = v9;
    _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_DEFAULT, "Fetching capabilities for source (%@), remAccount (%@), type (%d), supportsLocation (%d)", (uint8_t *)&v18, 0x22u);
  }
  [v5 setSupportsReminderLocations:v9];
  [v5 setSupportsAlarmProximity:v9];
  [v5 setSupportsStructuredLocations:v9];
  objc_msgSend(v5, "setSupportsAttachments:", -[NSObject supportsAttachments](v8, "supportsAttachments"));
  [v5 setAllowsEvents:0];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setAllowsCalendarAddDeleteModify:", objc_msgSend(v6, "daAllowsCalendarAddDeleteModify"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setSupportsReminderActions:", -[NSObject supportsReminderActions](v8, "supportsReminderActions"));
  }
  cachedConstraints = self->_cachedConstraints;
  long long v14 = [v4 sourceIdentifier];
  [(NSMutableDictionary *)cachedConstraints setObject:v5 forKeyedSubscript:v14];

  id v15 = v5;
LABEL_16:

  return v15;
}

- (BOOL)isSourceManaged:(id)a3
{
  id v3 = a3;
  id v4 = [v3 backingObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 backingObject];
    uint64_t v7 = [v6 remAccount];
    uint64_t v8 = v7;
    if (v7)
    {
      char v15 = 0;
      id v14 = 0;
      char v9 = [v7 MCIsManagedWithResultPtr:&v15 error:&v14];
      id v10 = v14;
      if (v9)
      {
        BOOL v11 = v15 != 0;
      }
      else
      {
        v12 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[EKReminderStore isSourceManaged:]();
        }

        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    id v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[EKReminderStore isSourceManaged:]();
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_loadListsIfNeeded
{
  if (!self->_lists) {
    [(EKReminderStore *)self _loadLists];
  }
}

- (void)_loadLists
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error fetching reminder lists: %@", v2, v3, v4, v5, v6);
}

- (id)_allLists
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__EKReminderStore__allLists__block_invoke;
  v5[3] = &unk_1E5B96E30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __28__EKReminderStore__allLists__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadListsIfNeeded];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSArray)calendars
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  id v42 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EKReminderStore_calendars__block_invoke;
  block[3] = &unk_1E5B96E30;
  block[4] = self;
  void block[5] = &v37;
  dispatch_sync(queue, block);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v38[5], "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = (id)v38[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = [(EKReminderStore *)self frozenObjectForReminderObject:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
        id v11 = [v9 meltedObjectInStore:WeakRetained];

        [v4 addObject:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v6);
  }

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  objc_super v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  v12 = self->_queue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __28__EKReminderStore_calendars__block_invoke_3;
  v25[3] = &unk_1E5B96E30;
  v25[4] = self;
  v25[5] = &v26;
  dispatch_sync(v12, v25);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = (id)v27[5];
  uint64_t v13 = [obj countByEnumeratingWithState:&v21 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = [(EKFrozenReminderObject *)[EKFrozenReminderCalendar alloc] initWithREMObject:0 inStore:self withChanges:*(void *)(*((void *)&v21 + 1) + 8 * j)];
        id v17 = objc_loadWeakRetained((id *)&self->_eventStore);
        int v18 = [(EKPersistentObject *)v16 meltedObjectInStore:v17];

        [v4 addObject:v18];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v21 objects:v43 count:16];
    }
    while (v13);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v37, 8);

  return (NSArray *)v4;
}

void __28__EKReminderStore_calendars__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadListsIfNeeded];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__EKReminderStore_calendars__block_invoke_2;
  v8[3] = &unk_1E5B97050;
  v8[4] = v2;
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
  uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

BOOL __28__EKReminderStore_calendars__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectID];
  uint64_t v4 = [v3 uuid];
  uint64_t v5 = [v4 UUIDString];

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v5];
  BOOL v7 = v6 == 0;

  return v7;
}

void __28__EKReminderStore_calendars__block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v12 = [v10 uncommittedChanges];
          [v11 addObject:v12];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)calendarWithIdentifier:(id)a3
{
  uint64_t v4 = [(EKReminderStore *)self backingCalendarWithIdentifier:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  uint64_t v6 = [v4 meltedObjectInStore:WeakRetained];

  return v6;
}

- (id)backingCalendarWithIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke;
  block[3] = &unk_1E5B96E58;
  block[4] = self;
  id v6 = v4;
  id v23 = v6;
  long long v24 = &v25;
  dispatch_sync(queue, block);
  uint64_t v7 = 0;
  if (!*((unsigned char *)v26 + 24))
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
    if (v8)
    {
      uint64_t v9 = [getREMListClass_0() objectIDWithUUID:v8];
      remStore = self->_remStore;
      id v21 = 0;
      id v11 = [(REMStore *)remStore fetchListWithObjectID:v9 error:&v21];
      id v12 = v21;
      long long v13 = v12;
      if (v11)
      {
        uint64_t v7 = [(EKReminderStore *)self frozenObjectForReminderObject:v11];
      }
      else
      {
        if (v12)
        {
          if (+[EKReminderStore isNotFoundError:v12])
          {
            long long v14 = +[EKReminderStore log];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v6;
              _os_log_impl(&dword_1A4E47000, v14, OS_LOG_TYPE_INFO, "No existing reminder list with identifier %@", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            long long v14 = +[EKReminderStore log];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[EKReminderStore backingCalendarWithIdentifier:]();
            }
          }
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v30 = 0x3032000000;
        id v31 = __Block_byref_object_copy__1;
        long long v32 = __Block_byref_object_dispose__1;
        id v33 = 0;
        long long v15 = self->_queue;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke_40;
        v18[3] = &unk_1E5B96E58;
        v18[4] = self;
        id v19 = v6;
        p_long long buf = &buf;
        dispatch_sync(v15, v18);
        if (*(void *)(*((void *)&buf + 1) + 40))
        {
          long long v16 = [EKFrozenReminderCalendar alloc];
          uint64_t v7 = [(EKFrozenReminderObject *)v16 initWithREMObject:0 inStore:self withChanges:*(void *)(*((void *)&buf + 1) + 40)];
        }
        else
        {
          uint64_t v7 = 0;
        }

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  _Block_object_dispose(&v25, 8);

  return v7;
}

void __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];

  if (v2) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __49__EKReminderStore_backingCalendarWithIdentifier___block_invoke_40(void *a1)
{
  if ([*(id *)(a1[4] + 40) containsObject:a1[5]])
  {
    id v5 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
    uint64_t v2 = [v5 uncommittedChanges];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)createNewReminderCalendar
{
  id v3 = [[EKFrozenReminderCalendar alloc] initNewListInStore:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  id v5 = [v3 meltedObjectInStore:WeakRetained];

  return v5;
}

- (id)frozenCalendarFromCalendar:(id)a3 error:(id *)a4
{
  id v5 = [a3 backingObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = +[EKReminderStore log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[EKReminderStore frozenCalendarFromCalendar:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
      id v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 validate:a4])
  {
    uint64_t v7 = [(EKReminderStore *)self frozenCalendarFromCalendar:v6 error:a4];
    if (v7) {
      BOOL v8 = [(EKReminderStore *)self saveObject:v6 withFrozenObject:v7 error:a4];
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)removeCalendar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 _validateDeletable:a4])
  {
    uint64_t v7 = [(EKReminderStore *)self frozenCalendarFromCalendar:v6 error:a4];
    BOOL v8 = v7;
    BOOL v9 = v7 != 0;
    if (v7)
    {
      id v10 = [v7 uniqueIdentifier];
      char v11 = [v6 isNew];
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__EKReminderStore_removeCalendar_error___block_invoke;
      block[3] = &unk_1E5B97078;
      char v19 = v11;
      block[4] = self;
      id v16 = v10;
      id v17 = v8;
      id v18 = v6;
      id v13 = v10;
      dispatch_sync(queue, block);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __40__EKReminderStore_removeCalendar_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 48) REMObject];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  id v3 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v4 = *(void *)(a1 + 56);

  return [v3 addObject:v4];
}

- (id)defaultCalendarForNewReminders
{
  remStore = self->_remStore;
  id v10 = 0;
  uint64_t v4 = [(REMStore *)remStore fetchDefaultListWithError:&v10];
  id v5 = v10;
  if (v4)
  {
    id v6 = [(EKReminderStore *)self frozenObjectForReminderObject:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    BOOL v8 = [v6 meltedObjectInStore:WeakRetained];
  }
  else
  {
    id v6 = +[EKReminderStore log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[EKReminderStore defaultCalendarForNewReminders]();
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (id)reminderWithUniqueId:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  remStore = self->_remStore;
  id v14 = 0;
  id v6 = [(REMStore *)remStore fetchReminderWithDACalendarItemUniqueIdentifier:v4 inList:0 error:&v14];
  id v7 = v14;
  BOOL v8 = v7;
  if (v6)
  {
    BOOL v9 = [(EKReminderStore *)self frozenObjectForReminderObject:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    char v11 = [v9 meltedObjectInStore:WeakRetained];

    if (v11) {
      goto LABEL_13;
    }
    id v12 = +[EKReminderStore log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[EKReminderStore reminderWithUniqueId:]();
    }
  }
  else
  {
    if (v7 && +[EKReminderStore isNotFoundError:v7])
    {
      id v12 = +[EKReminderStore log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_1A4E47000, v12, OS_LOG_TYPE_INFO, "No reminder found with unique identifier %@", buf, 0xCu);
      }
    }
    else
    {
      id v12 = +[EKReminderStore log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[EKReminderStore reminderWithUniqueId:]();
      }
    }
    char v11 = 0;
  }

LABEL_13:

  return v11;
}

- (id)reminderWithIdentifier:(id)a3
{
  id v4 = [(EKReminderStore *)self backingReminderWithIdentifier:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  id v6 = [v4 meltedObjectInStore:WeakRetained];

  return v6;
}

- (id)remindersWithExternalIdentifier:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  remStore = self->_remStore;
  id v22 = v4;
  v31[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  id v27 = 0;
  id v7 = [(REMStore *)remStore fetchRemindersWithDACalendarItemUniqueIdentifiers:v6 inList:0 error:&v27];
  id v8 = v27;

  if (v7)
  {
    BOOL v9 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = [v7 allValues];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v20 = v8;
      id v21 = v7;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = -[EKReminderStore frozenObjectForReminderObject:](self, "frozenObjectForReminderObject:", *(void *)(*((void *)&v23 + 1) + 8 * i), v20, v21);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          uint64_t v17 = [v15 meltedObjectInStore:WeakRetained];

          if (v17)
          {
            [v9 addObject:v17];
          }
          else
          {
            id v18 = +[EKReminderStore log];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v30 = v22;
              _os_log_error_impl(&dword_1A4E47000, v18, OS_LOG_TYPE_ERROR, "Unable to create EKReminder from REMReminder for external identifier %@", buf, 0xCu);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
      id v8 = v20;
      id v7 = v21;
    }
  }
  else
  {
    if (v8 && +[EKReminderStore isNotFoundError:v8])
    {
      id v10 = +[EKReminderStore log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v22;
        _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_INFO, "No reminders found with external identifier %@", buf, 0xCu);
      }
    }
    else
    {
      id v10 = +[EKReminderStore log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[EKReminderStore remindersWithExternalIdentifier:]();
      }
    }
    BOOL v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)backingReminderWithIdentifier:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  id v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EKReminderStore_backingReminderWithIdentifier___block_invoke;
  block[3] = &unk_1E5B970A0;
  long long v24 = &v26;
  block[4] = self;
  id v6 = v4;
  id v23 = v6;
  long long v25 = &v32;
  dispatch_sync(queue, block);
  id v7 = 0;
  if (!*((unsigned char *)v33 + 24))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    BOOL v9 = (void *)[v8 initWithUUIDString:v27[5]];
    if (v9)
    {
      id v10 = [getREMReminderClass_0() objectIDWithUUID:v9];
      remStore = self->_remStore;
      id v21 = 0;
      uint64_t v12 = [(REMStore *)remStore fetchReminderWithObjectID:v10 error:&v21];
      id v13 = v21;
      id v14 = v13;
      if (v12)
      {
        id v7 = [(EKReminderStore *)self frozenObjectForReminderObject:v12];
      }
      else
      {
        if (v13)
        {
          if (+[EKReminderStore isNotFoundError:v13])
          {
            long long v15 = +[EKReminderStore log];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              uint64_t v16 = v27[5];
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v6;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v16;
              _os_log_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_INFO, "No reminder found with identifier %@ (%@)", buf, 0x16u);
            }
          }
          else
          {
            long long v15 = +[EKReminderStore log];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[EKReminderStore backingReminderWithIdentifier:]();
            }
          }
        }
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v37 = __Block_byref_object_copy__1;
        v38 = __Block_byref_object_dispose__1;
        id v39 = 0;
        uint64_t v17 = self->_queue;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __49__EKReminderStore_backingReminderWithIdentifier___block_invoke_43;
        v20[3] = &unk_1E5B970C8;
        v20[4] = self;
        v20[5] = &v26;
        v20[6] = buf;
        dispatch_sync(v17, v20);
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          id v18 = [EKFrozenReminderReminder alloc];
          id v7 = [(EKFrozenReminderObject *)v18 initWithREMObject:0 inStore:self withChanges:*(void *)(*(void *)&buf[8] + 40)];
        }
        else
        {
          id v7 = 0;
        }
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);

  return v7;
}

void __49__EKReminderStore_backingReminderWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7) {
    objc_storeStrong(v6, *(id *)(a1 + 40));
  }
  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKeyedSubscript:");

  if (v8) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __49__EKReminderStore_backingReminderWithIdentifier___block_invoke_43(void *a1)
{
  if ([*(id *)(a1[4] + 40) containsObject:*(void *)(*(void *)(a1[5] + 8) + 40)])
  {
    id v5 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:*(void *)(*(void *)(a1[5] + 8) + 40)];
    uint64_t v2 = [v5 uncommittedChanges];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)createNewReminder
{
  id v3 = [[EKFrozenReminderReminder alloc] initNewReminderInStore:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  id v5 = [v3 meltedObjectInStore:WeakRetained];

  return v5;
}

- (BOOL)saveReminder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 validate:a4])
  {
    uint64_t v7 = [v6 calendar];
    if ([(EKReminderStore *)self saveCalendar:v7 error:a4])
    {
      id v8 = [v6 backingObject];
      BOOL v9 = [(EKReminderStore *)self frozenCalendarFromCalendar:v7 error:a4];
      BOOL v10 = v9
         && ([v6 forceUpdateFrozenCalendar:v9], objc_msgSend(v6, "save:", a4))
         && [(EKReminderStore *)self saveObject:v6 withFrozenObject:v8 error:a4];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)removeReminder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 _validateDeletable:a4];
  if (v7)
  {
    id v8 = [v6 backingObject];
    BOOL v9 = [v8 uniqueIdentifier];
    char v10 = [v6 isNew];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__EKReminderStore_removeReminder_error___block_invoke;
    block[3] = &unk_1E5B97078;
    char v19 = v10;
    block[4] = self;
    id v16 = v9;
    id v17 = v8;
    id v18 = v6;
    id v12 = v8;
    id v13 = v9;
    dispatch_sync(queue, block);
  }
  return v7;
}

uint64_t __40__EKReminderStore_removeReminder_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 48) REMObject];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  id v3 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v4 = *(void *)(a1 + 56);

  return [v3 addObject:v4];
}

- (id)resetBackingAlarmWithBackingAlarm:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 path];
  id v6 = [v5 firstObject];
  int v7 = [v6 uuid];
  id v8 = [v7 UUIDString];
  BOOL v9 = [(EKReminderStore *)self backingReminderWithIdentifier:v8];

  if (v9)
  {
    [v9 alarms];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = (id)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      char v19 = v6;
      id v20 = v5;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v15 = objc_msgSend(v14, "uniqueIdentifier", v19, v20, (void)v21);
          id v16 = [v4 uniqueIdentifier];
          char v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            id v11 = v14;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_12:
      id v6 = v19;
      id v5 = v20;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)resetBackingLocationWithBackingLocation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 path];
  id v6 = [v5 firstObject];
  int v7 = [v6 uuid];
  id v8 = [v7 UUIDString];
  BOOL v9 = [(EKReminderStore *)self backingReminderWithIdentifier:v8];

  if (v9)
  {
    id v10 = [v4 uniqueIdentifier];
    [v9 alarms];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v20 = v6;
      long long v21 = v5;
      uint64_t v14 = *(void *)v23;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v15), "structuredLocation", v20, v21, (void)v22);
        char v17 = [v16 uniqueIdentifier];
        char v18 = [v17 isEqualToString:v10];

        if (v18) {
          break;
        }

        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v13) {
            goto LABEL_4;
          }
          id v16 = 0;
          break;
        }
      }
      id v6 = v20;
      id v5 = v21;
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)saveObject:(id)a3 withFrozenObject:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [v8 uniqueIdentifier];
  char v10 = [v8 isNew];

  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__EKReminderStore_saveObject_withFrozenObject_error___block_invoke;
  v15[3] = &unk_1E5B970F0;
  id v16 = v7;
  char v17 = self;
  char v19 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v7;
  dispatch_sync(queue, v15);

  return 1;
}

void __53__EKReminderStore_saveObject_withFrozenObject_error___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) prepareReminderKitObjectForSaveWithUpdatedBackingObjectProvider:*(void *)(a1 + 40)];
  id v3 = v2;
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_2;
  }
  if (![v2 count]) {
    goto LABEL_29;
  }
  if (*(unsigned char *)(a1 + 56)) {
LABEL_2:
  }
    [*(id *)(*(void *)(a1 + 40) + 40) addObject:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) cachedMeltedChildIdentifierToParentMap];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v25 = v3;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v11 = [v10 uniqueIdentifier];
        [*(id *)(*(void *)(a1 + 40) + 48) setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v5;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        char v17 = [v16 uniqueIdentifier];
        id v18 = [v4 objectForKeyedSubscript:v17];
        char v19 = v18;
        if (!v18
          || ([v18 persistentObject],
              id v20 = objc_claimAutoreleasedReturnValue(),
              char v21 = [v20 isNew],
              v20,
              (v21 & 1) == 0))
        {
          if ([(id)objc_opt_class() canCommitSelf])
          {
            [*(id *)(*(void *)(a1 + 40) + 56) addObject:v17];
          }
          else
          {
            if (v19)
            {
              long long v22 = [v19 uniqueIdentifier];
              long long v23 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v22];
              if (!v23)
              {
                long long v23 = [v19 backingObject];
              }
              long long v24 = [v16 updateParentToCommitSelf:v23];
              [*(id *)(a1 + 40) fillInPath:v24 usingParents:v4];
              [v19 setBackingObject:v24];
              [*(id *)(*(void *)(a1 + 40) + 56) addObject:v22];
              [*(id *)(*(void *)(a1 + 40) + 48) setObject:v24 forKeyedSubscript:v22];
            }
            else
            {
              long long v22 = +[EKReminderStore log];
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                v36 = v16;
                _os_log_error_impl(&dword_1A4E47000, v22, OS_LOG_TYPE_ERROR, "Object requiring parent to commit has no parent: %@", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v13);
  }

  [*(id *)(*(void *)(a1 + 40) + 72) addObject:*(void *)(a1 + 32)];
  id v3 = v25;
LABEL_29:
}

- (void)fillInPath:(id)a3 usingParents:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v13 uniqueIdentifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    do
    {
      BOOL v9 = [v8 backingObject];
      char v10 = [v9 remObjectID];
      [v6 insertObject:v10 atIndex:0];
      id v11 = [v8 uniqueIdentifier];
      uint64_t v12 = [v5 objectForKeyedSubscript:v11];

      uint64_t v8 = (void *)v12;
    }
    while (v12);
  }
  [v13 setPath:v6];
}

- (BOOL)commit:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__1;
  v43 = __Block_byref_object_dispose__1;
  id v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__1;
  long long v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__1;
  long long v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EKReminderStore_commit___block_invoke;
  block[3] = &unk_1E5B97118;
  block[4] = self;
  void block[5] = &v35;
  void block[6] = &v23;
  block[7] = &v39;
  block[8] = &v29;
  dispatch_sync(queue, block);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)v30[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) reset];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v45 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v36 + 24))
  {
    char v10 = (void *)v24[5];
    if (v10)
    {
      id v11 = [v10 allKeys];
      uint64_t v12 = self->_queue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __26__EKReminderStore_commit___block_invoke_2;
      v16[3] = &unk_1E5B97140;
      v16[4] = self;
      id v17 = v11;
      id v13 = v11;
      dispatch_sync(v12, v16);
    }
  }
  if (a3) {
    *a3 = (id) v40[5];
  }
  BOOL v14 = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v14;
}

void __26__EKReminderStore_commit___block_invoke(void *a1)
{
  uint64_t v2 = a1[7];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  id v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(v2 + 8);
  id v16 = *(id *)(v6 + 40);
  obuint64_t j = v4;
  char v7 = [v5 _commit:&obj error:&v16];
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v16);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v7;
  uint64_t v8 = [*(id *)(a1[4] + 72) copy];
  uint64_t v9 = *(void *)(a1[8] + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(a1[4] + 72) removeAllObjects];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (v11)
    {
      uint64_t v12 = *(void **)(a1[4] + 88);
      if (v12)
      {
        objc_msgSend(v12, "addEntriesFromDictionary:");
      }
      else
      {
        uint64_t v13 = [v11 mutableCopy];
        uint64_t v14 = a1[4];
        uint64_t v15 = *(void **)(v14 + 88);
        *(void *)(v14 + 88) = v13;
      }
    }
  }
}

void __26__EKReminderStore_commit___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) removeObjectsForKeys:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 88) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 88);
    *(void *)(v2 + 88) = 0;
  }
}

- (BOOL)_commit:(id *)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableSet *)self->_objectIDsToCommit count]
    && ![(NSMutableDictionary *)self->_deletedObjects count])
  {
    char v26 = 1;
    goto LABEL_32;
  }
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x2050000000;
  char v7 = (void *)getREMSaveRequestClass_softClass;
  uint64_t v40 = getREMSaveRequestClass_softClass;
  if (!getREMSaveRequestClass_softClass)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __getREMSaveRequestClass_block_invoke;
    v36[3] = &unk_1E5B969D8;
    v36[4] = &v37;
    __getREMSaveRequestClass_block_invoke((uint64_t)v36);
    char v7 = (void *)v38[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v37, 8);
  uint64_t v9 = (void *)[[v8 alloc] initWithStore:self->_remStore];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  char v10 = self->_objectIDsToCommit;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (!v11)
  {
LABEL_13:

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = self->_deletedObjects;
    uint64_t v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v16);
          }
          long long v20 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deletedObjects, "objectForKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
          getREMListClass_0();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v21 = [v9 updateList:v20];
            [v21 removeFromParent];
          }
          else
          {
            getREMReminderClass_0();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_23;
            }
            long long v21 = [v9 updateReminder:v20];
            [v21 removeFromList];
          }

LABEL_23:
        }
        uint64_t v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v17);
    }

    [(NSMutableSet *)self->_objectIDsToCommit removeAllObjects];
    [(NSMutableDictionary *)self->_deletedObjects removeAllObjects];
    [(NSMutableSet *)self->_newObjectsIDs removeAllObjects];
    lists = self->_lists;
    self->_lists = 0;

    if ([(NSMutableArray *)self->_remindersNeedingMove count]
      && ([(EKReminderStore *)self _moveRemindersToNewLists:v9 error:a4],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          BOOL v24 = v23 == 0,
          id v25 = v23,
          *a3 = v25,
          v25,
          v24))
    {
      char v26 = 0;
    }
    else
    {
      char v26 = objc_msgSend(v9, "saveSynchronouslyWithError:", a4, (void)v28);
    }

LABEL_32:
    [(NSMutableDictionary *)self->_updatedObjects removeAllObjects];
    return v26;
  }
  uint64_t v12 = *(void *)v33;
LABEL_7:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v33 != v12) {
      objc_enumerationMutation(v10);
    }
    uint64_t v14 = [(NSMutableDictionary *)self->_updatedObjects objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * v13)];
    int v15 = [v14 _applyChangesToSaveRequest:v9 error:a4];

    if (!v15) {
      break;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (!v11) {
        goto LABEL_13;
      }
      goto LABEL_7;
    }
  }

  return 0;
}

- (id)_moveRemindersToNewLists:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableArray count](self->_remindersNeedingMove, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_remindersNeedingMove;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "uniqueIdentifier", (void)v20);
        uint64_t v15 = [v13 _copyToNewList:v6 error:a4];
        if (!v15)
        {

          id v18 = 0;
          goto LABEL_11;
        }
        id v16 = (void *)v15;
        [v7 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  remindersNeedingMove = self->_remindersNeedingMove;
  self->_remindersNeedingMove = 0;

  id v18 = v7;
LABEL_11:

  return v18;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__EKReminderStore_reset__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __24__EKReminderStore_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v6 removeAllObjects];
}

- (id)predicateForRemindersInCalendars:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[EKREMReminderPredicate alloc] initWithCalendars:v3];

  return v4;
}

- (id)predicateForCalendarStoreForRemindersInCalendars:(id)a3
{
  id v3 = a3;
  id v4 = [[EKREMReminderPredicate alloc] initForCalendarStoreWithCalendars:v3];

  return v4;
}

- (id)predicateForIncompleteRemindersWithDueDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[EKREMCompletionStateReminderPredicate alloc] initForIncompleteRemindersWithDueDateStarting:v9 ending:v8 calendars:v7];

  return v10;
}

- (id)predicateForCompletedRemindersWithCompletionDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[EKREMCompletionStateReminderPredicate alloc] initForCompletedRemindersWithCompletionDateStarting:v9 ending:v8 calendars:v7];

  return v10;
}

- (void)_checkPredicate:(id)a3
{
  id v3 = a3;
  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"predicate is nil"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"predicate is not a reminder predicate created through EKEventStore"];
  }
}

- (id)fetchRemindersMatchingPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(EKReminderStore *)self _checkPredicate:v6];
  id v8 = [[EKReminderFetchRequestToken alloc] initWithReminderStore:self];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke;
  block[3] = &unk_1E5B97168;
  block[4] = self;
  id v10 = v8;
  long long v22 = v10;
  id v23 = v7;
  id v11 = v7;
  dispatch_sync(queue, block);
  queryQueue = self->_queryQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke_2;
  v18[3] = &unk_1E5B97190;
  v18[4] = self;
  uint64_t v13 = v10;
  long long v19 = v13;
  id v20 = v6;
  id v14 = v6;
  dispatch_async(queryQueue, v18);
  uint64_t v15 = v20;
  id v16 = v13;

  return v16;
}

void __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 104))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 104);
    *(void *)(v3 + 104) = v2;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.eventkit.reminders.search", v5);
    uint64_t v7 = a1[4];
    id v8 = *(void **)(v7 + 96);
    *(void *)(v7 + 96) = v6;
  }
  id v9 = (id)MEMORY[0x1A6266730](a1[6]);
  [*(id *)(a1[4] + 104) setObject:v9 forKeyedSubscript:a1[5]];
}

void __62__EKReminderStore_fetchRemindersMatchingPredicate_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionBlockForFetchRequestToken:*(void *)(a1 + 40) remove:0];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) remindersMatchingPredicate:*(void *)(a1 + 48)];
    uint64_t v3 = [*(id *)(a1 + 32) completionBlockForFetchRequestToken:*(void *)(a1 + 40) remove:1];
    id v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
    }
  }
}

- (id)completionBlockForFetchRequestToken:(id)a3 remove:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__56;
  long long v19 = __Block_byref_object_dispose__57;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__EKReminderStore_completionBlockForFetchRequestToken_remove___block_invoke;
  v11[3] = &unk_1E5B971B8;
  id v12 = v6;
  uint64_t v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (void *)MEMORY[0x1A6266730](v16[5]);

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __62__EKReminderStore_completionBlockForFetchRequestToken_remove___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 104);
    [v6 removeObjectForKey:v5];
  }
}

- (id)remindersMatchingPredicate:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EKReminderStore *)self _checkPredicate:v4];
  id v45 = v4;
  uint64_t v43 = [(EKReminderStore *)self _allLists];
  remStore = self->_remStore;
  id v75 = 0;
  id v44 = [v45 fetchMatchingRemindersInStore:remStore allLists:v43 error:&v75];
  id v42 = v75;
  if (v44)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v44, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v7 = v44;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v72 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = [(EKReminderStore *)self frozenObjectForReminderObject:*(void *)(*((void *)&v71 + 1) + 8 * i)];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          uint64_t v13 = [v11 meltedObjectInStore:WeakRetained];
          [v6 addObject:v13];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v71 objects:v78 count:16];
      }
      while (v8);
    }

    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__1;
    v69 = __Block_byref_object_dispose__1;
    id v70 = 0;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__1;
    v63 = __Block_byref_object_dispose__1;
    id v64 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__EKReminderStore_remindersMatchingPredicate___block_invoke;
    block[3] = &unk_1E5B970C8;
    block[4] = self;
    void block[5] = &v65;
    void block[6] = &v59;
    dispatch_sync(queue, block);
    if ([(id)v66[5] count] || objc_msgSend((id)v60[5], "count"))
    {
      if (v60[5])
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
      }
      else
      {
        uint64_t v15 = 0;
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __46__EKReminderStore_remindersMatchingPredicate___block_invoke_2;
      v54[3] = &unk_1E5B971E0;
      id v41 = v15;
      id v55 = v41;
      v57 = &v65;
      id v40 = v45;
      id v56 = v40;
      id v18 = [v17 predicateWithBlock:v54];
      [v6 filterUsingPredicate:v18];

      if (v66[5])
      {
        id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
        id v20 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend((id)v66[5], "count"));
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v21 = (id)v66[5];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v77 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v51;
          p_eventStore = &self->_eventStore;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v51 != v23) {
                objc_enumerationMutation(v21);
              }
              char v26 = *(void **)(*((void *)&v50 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v27 = objc_loadWeakRetained((id *)p_eventStore);
                long long v28 = [v26 meltedObjectInStore:v27];
                [v20 addObject:v28];
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v77 count:16];
          }
          while (v22);
        }

        [v20 filterUsingPredicate:v40];
        long long v29 = (void *)MEMORY[0x1E4F1CAD0];
        long long v30 = [v6 valueForKey:@"calendarItemIdentifier"];
        long long v31 = [v29 setWithArray:v30];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v32 = v20;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v76 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v47;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v47 != v34) {
                objc_enumerationMutation(v32);
              }
              v36 = *(void **)(*((void *)&v46 + 1) + 8 * k);
              uint64_t v37 = [v36 calendarItemIdentifier];
              char v38 = [v31 containsObject:v37];

              if ((v38 & 1) == 0) {
                [v6 addObject:v36];
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v76 count:16];
          }
          while (v33);
        }
      }
    }
    _Block_object_dispose(&v59, 8);

    _Block_object_dispose(&v65, 8);
  }
  else
  {
    id v16 = +[EKReminderStore log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[EKReminderStore remindersMatchingPredicate:]();
    }

    id v6 = 0;
  }

  return v6;
}

uint64_t __46__EKReminderStore_remindersMatchingPredicate___block_invoke(void *a1)
{
  if ([*(id *)(a1[4] + 48) count])
  {
    uint64_t v2 = [*(id *)(a1[4] + 48) allValues];
    uint64_t v3 = *(void *)(a1[5] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t result = [*(id *)(a1[4] + 64) count];
  if (result)
  {
    uint64_t v6 = [*(id *)(a1[4] + 64) allKeys];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void *)(v7 + 40);
    *(void *)(v7 + 40) = v6;
    return MEMORY[0x1F41817F8](v6, v8);
  }
  return result;
}

uint64_t __46__EKReminderStore_remindersMatchingPredicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  uint64_t v7 = [v5 backingObject];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v7 uniqueIdentifier];
  LOBYTE(v8) = [v8 containsObject:v9];

  if (v8)
  {
    uint64_t v10 = 0;
  }
  else
  {
LABEL_10:
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      uint64_t v10 = [*(id *)(a1 + 40) evaluateWithObject:v5];
    }
    else {
      uint64_t v10 = 1;
    }
  }

  return v10;
}

- (id)frozenObjectForReminderObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    BOOL v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__1;
    uint64_t v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    id v5 = +[EKReminderStore uniqueIdentifierForREMObject:v4];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__EKReminderStore_frozenObjectForReminderObject___block_invoke;
    block[3] = &unk_1E5B97028;
    id v12 = &v13;
    block[4] = self;
    id v7 = v5;
    id v11 = v7;
    dispatch_sync(queue, block);
    id v8 = [(EKReminderStore *)self newFrozenObjectForReminderObject:v4 withChanges:v14[5]];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __49__EKReminderStore_frozenObjectForReminderObject___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 uncommittedChanges];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)frozenAlarmForREMAlarms:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__1;
  long long v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = +[EKReminderStore uniqueIdentifierForREMObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v7);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EKReminderStore_frozenAlarmForREMAlarms___block_invoke;
  block[3] = &unk_1E5B96EA8;
  id v12 = v5;
  id v18 = self;
  id v19 = &v24;
  id v17 = v12;
  dispatch_sync(queue, block);
  uint64_t v13 = [EKFrozenReminderAlarm alloc];
  BOOL v14 = [(EKFrozenReminderAlarm *)v13 initWithAlarms:v6 inStore:self withChanges:v25[5]];

  _Block_object_dispose(&v24, 8);

  return v14;
}

void __43__EKReminderStore_frozenAlarmForREMAlarms___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v6), (void)v11);
      uint64_t v8 = [v7 uncommittedChanges];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)newFrozenObjectForReminderObject:(id)a3 withChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (uint64_t v8 = +[EKReminderStore frozenClassForReminderClass:objc_opt_class()]) != 0)
  {
    uint64_t v9 = (void *)[[v8 alloc] initWithREMObject:v6 inStore:self withChanges:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (Class)frozenClassForReminderClass:(Class)a3
{
  if (frozenClassForReminderClass__onceToken != -1) {
    dispatch_once(&frozenClassForReminderClass__onceToken, &__block_literal_global_64);
  }
  uint64_t v5 = (void *)[(id)frozenClassForReminderClass__reminderClassToFrozenClassMap objectForKey:a3];
  if (!v5)
  {
    id v6 = [a1 log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[EKReminderStore frozenClassForReminderClass:](a3);
    }
  }

  return (Class)v5;
}

void __47__EKReminderStore_frozenClassForReminderClass___block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:258];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v0 valuePointerFunctions:v0 capacity:6];
  id v2 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  frozenClassForReminderClass__reminderClassToFrozenClassMap = v1;

  uint64_t v3 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  uint64_t v4 = objc_opt_class();
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  uint64_t v5 = (void *)getREMAccountClass_softClass;
  uint64_t v31 = getREMAccountClass_softClass;
  if (!getREMAccountClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __getREMAccountClass_block_invoke;
    uint64_t v26 = &unk_1E5B969D8;
    id v27 = &v28;
    __getREMAccountClass_block_invoke((uint64_t)&v23);
    uint64_t v5 = (void *)v29[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v28, 8);
  [v3 setObject:v4 forKey:objc_opt_class()];
  id v7 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  uint64_t v8 = objc_opt_class();
  getREMListClass_0();
  [v7 setObject:v8 forKey:objc_opt_class()];
  uint64_t v9 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  uint64_t v10 = objc_opt_class();
  getREMReminderClass_0();
  [v9 setObject:v10 forKey:objc_opt_class()];
  long long v11 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  uint64_t v12 = objc_opt_class();
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  long long v13 = (void *)getREMAlarmClass_softClass;
  uint64_t v31 = getREMAlarmClass_softClass;
  if (!getREMAlarmClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __getREMAlarmClass_block_invoke;
    uint64_t v26 = &unk_1E5B969D8;
    id v27 = &v28;
    __getREMAlarmClass_block_invoke((uint64_t)&v23);
    long long v13 = (void *)v29[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v28, 8);
  [v11 setObject:v12 forKey:objc_opt_class()];
  uint64_t v15 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  uint64_t v16 = objc_opt_class();
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  id v17 = (void *)getREMRecurrenceRuleClass_softClass;
  uint64_t v31 = getREMRecurrenceRuleClass_softClass;
  if (!getREMRecurrenceRuleClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __getREMRecurrenceRuleClass_block_invoke;
    uint64_t v26 = &unk_1E5B969D8;
    id v27 = &v28;
    __getREMRecurrenceRuleClass_block_invoke((uint64_t)&v23);
    id v17 = (void *)v29[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v28, 8);
  [v15 setObject:v16 forKey:objc_opt_class()];
  id v19 = (void *)frozenClassForReminderClass__reminderClassToFrozenClassMap;
  uint64_t v20 = objc_opt_class();
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  long long v21 = (void *)getREMStructuredLocationClass_softClass;
  uint64_t v31 = getREMStructuredLocationClass_softClass;
  if (!getREMStructuredLocationClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __getREMStructuredLocationClass_block_invoke;
    uint64_t v26 = &unk_1E5B969D8;
    id v27 = &v28;
    __getREMStructuredLocationClass_block_invoke((uint64_t)&v23);
    long long v21 = (void *)v29[3];
  }
  id v22 = v21;
  _Block_object_dispose(&v28, 8);
  [v19 setObject:v20 forKey:objc_opt_class()];
}

- (void)_reminderCopiedToNewList:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  remindersNeedingMove = self->_remindersNeedingMove;
  if (!remindersNeedingMove)
  {
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = self->_remindersNeedingMove;
    self->_remindersNeedingMove = v5;

    remindersNeedingMove = self->_remindersNeedingMove;
  }
  [(NSMutableArray *)remindersNeedingMove addObject:v7];
}

- (id)existingUpdatedObject:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_updatedObjects objectForKeyedSubscript:a3];
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 frozenClassForReminderClass:objc_opt_class()];
  if (v5)
  {
    id v6 = [v5 uniqueIdentifierForREMObject:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)isNotFoundError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v5 = (void *)getREMErrorDomainSymbolLoc_ptr;
  uint64_t v12 = getREMErrorDomainSymbolLoc_ptr;
  if (!getREMErrorDomainSymbolLoc_ptr)
  {
    id v6 = (void *)ReminderKitLibrary_1();
    v10[3] = (uint64_t)dlsym(v6, "REMErrorDomain");
    getREMErrorDomainSymbolLoc_ptr = v10[3];
    uint64_t v5 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v5) {
    +[EKReminderStore isNotFoundError:]();
  }
  if ([v4 isEqualToString:*v5]) {
    BOOL v7 = [v3 code] == -3000;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (REMStore)remStore
{
  return self->_remStore;
}

- (EKEventStore)eventStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  return (EKEventStore *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_remStore, 0);
  objc_storeStrong((id *)&self->queryCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_movedRemindersIDMap, 0);
  objc_storeStrong((id *)&self->_remindersNeedingMove, 0);
  objc_storeStrong((id *)&self->_objectsToReset, 0);
  objc_storeStrong((id *)&self->_deletedObjects, 0);
  objc_storeStrong((id *)&self->_objectIDsToCommit, 0);
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_newObjectsIDs, 0);
  objc_storeStrong((id *)&self->_lists, 0);
  objc_storeStrong((id *)&self->_cachedConstraints, 0);
  objc_storeStrong((id *)&self->_sources, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithEventStore:(os_log_t)log token:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Unable to create reminder store. Reminder data will be unavailable.", v1, 2u);
}

- (void)cachedConstraintsForSource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Source (%@) is an event source without a reminder source; can't get reminder constraints for it.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_fetchAndCacheConstraintsForFrozenSource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Got a nil remAccount when fetching constraints for %@", v2, v3, v4, v5, v6);
}

- (void)_fetchAndCacheConstraintsForFrozenSource:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 remAccount];
  uint64_t v5 = [a1 remAccount];
  int v6 = 138412802;
  BOOL v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 1024;
  int v11 = [v5 type];
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Got a nil capabilities when fetching constraints for %@ (remAccount = %@, type = %d)", (uint8_t *)&v6, 0x1Cu);
}

- (void)isSourceManaged:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_ERROR, "Failed to check whether REMAccount (%@) is managed: %@", v2, 0x16u);
}

- (void)isSourceManaged:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Tried to call isSourceManaged: on the reminder store for a non-reminder source: %@", v2, v3, v4, v5, v6);
}

- (void)backingCalendarWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error fetching calendar by identifier: %@", v2, v3, v4, v5, v6);
}

- (void)frozenCalendarFromCalendar:error:.cold.1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1A4E47000, v2, v3, "calendar being saved should have an EKFrozenReminderCalendar backing class, but instead has a backing object of type %@", v4, v5, v6, v7, v8);
}

- (void)defaultCalendarForNewReminders
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "defaultCalendarForNewReminders is nil: %@", v2, v3, v4, v5, v6);
}

- (void)reminderWithUniqueId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error fetching reminder by uniqueId identifier: %@", v2, v3, v4, v5, v6);
}

- (void)reminderWithUniqueId:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Unable to create EKReminder from REMReminder for unique identifier %@", v2, v3, v4, v5, v6);
}

- (void)remindersWithExternalIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error fetching reminders by external identifier: %@", v2, v3, v4, v5, v6);
}

- (void)backingReminderWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error fetching reminder by identifier: %@", v2, v3, v4, v5, v6);
}

- (void)remindersMatchingPredicate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error fetching reminders: %@", v2, v3, v4, v5, v6);
}

+ (void)frozenClassForReminderClass:(objc_class *)a1 .cold.1(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1A4E47000, v2, v3, "Class has no known frozen version: %@", v4, v5, v6, v7, v8);
}

+ (void)isNotFoundError:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSErrorDomain getREMErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 48, @"%s", dlerror());

  __break(1u);
}

@end