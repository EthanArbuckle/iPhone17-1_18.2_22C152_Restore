@interface EMMailboxRepository
+ (OS_os_log)log;
+ (id)remoteInterface;
- (EFCancelable)registrationCancelable;
- (EFPromise)mailboxesPromise;
- (EMAccountRepository)accountRepository;
- (EMMailboxRepository)initWithRemoteConnection:(id)a3 accountRepository:(id)a4;
- (NSMapTable)observerMap;
- (NSOrderedSet)mailboxesIfAvailable;
- (NSSet)allMailboxObjectIDs;
- (id)_filterIDsFromMailbox:(id)a3 withQuery:(id)a4;
- (id)_mailboxesFuture;
- (id)initInternal;
- (id)mailboxForObjectID:(id)a3;
- (id)mailboxIfAvailableForObjectID:(id)a3;
- (id)mailboxObjectIDsForMailboxType:(int64_t)a3;
- (id)mailboxesForObjectIDs:(id)a3;
- (id)mailboxesIfAvailableForObjectIDs:(id)a3;
- (id)performMailboxChangeAction:(id)a3;
- (id)performQuery:(id)a3 withObserver:(id)a4;
- (id)remoteAllMailboxObjectIDs;
- (id)remoteMailboxObjectIDsForMailboxType:(int64_t)a3;
- (int64_t)mailboxTypeForMailboxObjectID:(id)a3;
- (int64_t)remoteMailboxTypeForMailboxObjectID:(id)a3;
- (void)_prepareMailboxes:(id)a3;
- (void)_startObservingMailboxChangesIfNecessary;
- (void)dealloc;
- (void)mailboxListChanged:(id)a3;
- (void)performQuery:(id)a3 completionHandler:(id)a4;
- (void)recordFrecencyEventWithMailboxIDs:(id)a3;
- (void)recordFrecencyEventWithMailboxURLString:(id)a3;
- (void)recordFrecencyEventWithMailboxesOfMessage:(id)a3;
- (void)refreshMailboxList:(int64_t)a3;
- (void)setMailboxesPromise:(id)a3;
- (void)setObserverMap:(id)a3;
- (void)setRegistrationCancelable:(id)a3;
- (void)testRecordFrecencyEventsForAllMailboxes;
- (void)testResetFrecencyForAllMailboxes;
@end

@implementation EMMailboxRepository

- (void)_prepareMailboxes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EMRepository *)self prepareRepositoryObjects:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
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
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v10 objectID];
        [v5 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "setParentFromMailboxes:", v5, (void)v16);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

void __54__EMMailboxRepository_mailboxObjectIDsForMailboxType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 type] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

id __55__EMMailboxRepository__filterIDsFromMailbox_withQuery___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  return v2;
}

- (EMAccountRepository)accountRepository
{
  return self->_accountRepository;
}

id __42__EMMailboxRepository_mailboxForObjectID___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v2 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 36),
        os_unfair_lock_lock(v2),
        [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:*(void *)(a1 + 32)],
        v3 = objc_claimAutoreleasedReturnValue(),
        os_unfair_lock_unlock(v2),
        v3))
  {
    id v4 = [MEMORY[0x1E4F60D70] futureWithResult:v3];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F60D70];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 32));
    id v4 = [v5 futureWithError:v6];
    v3 = (void *)v6;
  }

  return v4;
}

- (id)_mailboxesFuture
{
  p_mailboxesPromiseLock = &self->_mailboxesPromiseLock;
  os_unfair_lock_lock(&self->_mailboxesPromiseLock);
  id v4 = [(EMMailboxRepository *)self mailboxesPromise];
  id v5 = [v4 future];

  os_unfair_lock_unlock(p_mailboxesPromiseLock);
  return v5;
}

- (EFPromise)mailboxesPromise
{
  return self->_mailboxesPromise;
}

+ (id)remoteInterface
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  id v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A6F780];
  [v12 setClasses:v4 forSelector:sel_mailboxListChanged_ argumentIndex:0 ofReply:0];
  uint64_t v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86978];
  [v13 setClasses:v4 forSelector:sel_getMailboxesWithCompletion_ argumentIndex:0 ofReply:1];
  [v13 setClasses:v7 forSelector:sel_getAllMailboxObjectIDsWithCompletion_ argumentIndex:0 ofReply:1];
  [v13 setClasses:v7 forSelector:sel_mailboxObjectIDsForMailboxType_completionHandler_ argumentIndex:0 ofReply:1];
  [v13 setClasses:v8 forSelector:sel_mailboxTypeForMailboxObjectID_completionHandler_ argumentIndex:0 ofReply:0];
  [v13 setClasses:v11 forSelector:sel_recordFrecencyEventWithMailboxesWithIDs_ argumentIndex:0 ofReply:0];
  [v13 setInterface:v12 forSelector:sel_startObservingMailboxChangesWithChangeObserver_observationIdentifier_ argumentIndex:0 ofReply:0];

  return v13;
}

- (id)mailboxObjectIDsForMailboxType:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableDictionary *)self->_mailboxesByObjectID count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mailboxesByObjectID = self->_mailboxesByObjectID;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __54__EMMailboxRepository_mailboxObjectIDsForMailboxType___block_invoke;
    uint64_t v13 = &unk_1E63E4470;
    int64_t v15 = a3;
    id v8 = v6;
    id v14 = v8;
    [(NSMutableDictionary *)mailboxesByObjectID enumerateKeysAndObjectsUsingBlock:&v10];

    os_unfair_lock_unlock(p_lock);
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  -[EMMailboxRepository remoteMailboxObjectIDsForMailboxType:](self, "remoteMailboxObjectIDsForMailboxType:", a3, v10, v11, v12, v13);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return v8;
}

uint64_t __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_94(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mailboxListChanged:a2];
}

- (id)mailboxForObjectID:(id)a3
{
  id v4 = a3;
  [(EMMailboxRepository *)self _startObservingMailboxChangesIfNecessary];
  id v5 = [(EMMailboxRepository *)self _mailboxesFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__EMMailboxRepository_mailboxForObjectID___block_invoke;
  v9[3] = &unk_1E63E43A8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  uint64_t v7 = [v5 then:v9];

  return v7;
}

- (void)mailboxListChanged:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v4 = +[EMMailboxRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v64 = [v34 count];
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Received New Mailbox List count:%lu", buf, 0xCu);
  }

  [(EMMailboxRepository *)self _prepareMailboxes:v34];
  v35 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v34];
  id v5 = [(EMMailboxRepository *)self mailboxesIfAvailable];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v39 = v5;
  v41 = (void *)[v5 mutableCopy];
  [v41 minusOrderedSet:v35];
  mailboxesByObjectID = self->_mailboxesByObjectID;
  uint64_t v7 = [v41 array];
  id v8 = objc_msgSend(v7, "ef_mapSelector:", sel_objectID);
  [(NSMutableDictionary *)mailboxesByObjectID removeObjectsForKeys:v8];

  v42 = (void *)[v35 mutableCopy];
  [v42 minusOrderedSet:v39];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v35;
  uint64_t v9 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v13 = self->_mailboxesByObjectID;
        id v14 = objc_msgSend(v12, "objectID", lock);
        [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v9);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v38 = self->_observerMap;
  uint64_t v15 = [(NSMapTable *)v38 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v15)
  {
    uint64_t v40 = *(void *)v53;
    v36 = self;
    do
    {
      uint64_t v16 = 0;
      uint64_t v37 = v15;
      do
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v38);
        }
        long long v17 = *(void **)(*((void *)&v52 + 1) + 8 * v16);
        long long v18 = -[NSMapTable objectForKey:](self->_observerMap, "objectForKey:", v17, lock);
        long long v19 = [(EMMailboxRepository *)self _filterIDsFromMailbox:obj withQuery:v18];
        v44 = [(EMMailboxRepository *)self _filterIDsFromMailbox:v42 withQuery:v18];
        long long v20 = [(EMMailboxRepository *)self _filterIDsFromMailbox:v41 withQuery:v18];
        if ([v44 count])
        {
          if (v39)
          {
            long long v21 = [MEMORY[0x1E4F28E60] indexSet];
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v22 = v44;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v60 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v49;
              do
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v49 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  objc_msgSend(v21, "addIndex:", objc_msgSend(v19, "indexOfObject:", *(void *)(*((void *)&v48 + 1) + 8 * j)));
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v60 count:16];
              }
              while (v23);
            }

            self = v36;
            uint64_t v15 = v37;
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __42__EMMailboxRepository_mailboxListChanged___block_invoke;
            v45[3] = &unk_1E63E44E0;
            id v46 = v19;
            v47 = v17;
            [v21 enumerateRangesUsingBlock:v45];
          }
          else
          {
            uint64_t v26 = [v44 array];
            [v17 queryMatchedAddedObjectIDs:v26 before:0 extraInfo:0];

            [v17 queryDidFinishInitialLoad];
          }
        }
        if ([v20 count])
        {
          v27 = [v20 array];
          [v17 queryMatchedDeletedObjectIDs:v27];
        }
        ++v16;
      }
      while (v16 != v15);
      uint64_t v15 = [(NSMapTable *)v38 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v15);
  }

  os_unfair_lock_unlock(lock);
  os_unfair_lock_lock(&self->_mailboxesPromiseLock);
  v28 = [(EMMailboxRepository *)self mailboxesPromise];
  v29 = [v28 future];
  int v30 = [v29 isFinished];

  if (v30)
  {
    v31 = [MEMORY[0x1E4F60E18] promise];
    [(EMMailboxRepository *)self setMailboxesPromise:v31];
  }
  v32 = [(EMMailboxRepository *)self mailboxesPromise];
  os_unfair_lock_unlock(&self->_mailboxesPromiseLock);
  [v32 finishWithResult:obj];
}

- (id)_filterIDsFromMailbox:(id)a3 withQuery:(id)a4
{
  id v5 = a3;
  id v6 = [a4 predicate];
  uint64_t v7 = [v5 filteredOrderedSetUsingPredicate:v6];

  id v8 = objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_115);

  return v8;
}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(EMMailboxRepository *)self _startObservingMailboxChangesIfNecessary];
  id v8 = [(EMRepository *)self trampoliningObserverForObserver:v7];

  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_observerMap setObject:v6 forKey:v8];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v9 = [(EMMailboxRepository *)self mailboxesIfAvailable];
  if (v9)
  {
    uint64_t v10 = [(EMMailboxRepository *)self _filterIDsFromMailbox:v9 withQuery:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([v10 count])
  {
    uint64_t v11 = [v10 array];
    [v8 queryMatchedAddedObjectIDs:v11 before:0 extraInfo:0];

    [v8 queryDidFinishInitialLoad];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__EMMailboxRepository_performQuery_withObserver___block_invoke;
  v15[3] = &unk_1E63E3298;
  objc_copyWeak(&v17, &location);
  id v13 = v8;
  id v16 = v13;
  [v12 addCancelationBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

- (NSOrderedSet)mailboxesIfAvailable
{
  v2 = [(EMMailboxRepository *)self _mailboxesFuture];
  uint64_t v3 = [v2 resultIfAvailable:0];

  return (NSOrderedSet *)v3;
}

- (void)_startObservingMailboxChangesIfNecessary
{
  uint64_t v3 = [(EMMailboxRepository *)self registrationCancelable];

  if (!v3)
  {
    id v4 = [(EMRepository *)self connection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke;
    v18[3] = &unk_1E63E4330;
    v18[4] = self;
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v18];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_94;
    v17[3] = &unk_1E63E4358;
    v17[4] = self;
    [v5 getMailboxesWithCompletion:v17];
    id v6 = [[EMObjectID alloc] initAsEphemeralID:1];
    [v5 startObservingMailboxChangesWithChangeObserver:self observationIdentifier:v6];
    id v7 = (void *)MEMORY[0x1E4F60D40];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_2;
    id v14 = &unk_1E63E2760;
    id v8 = v5;
    id v15 = v8;
    id v9 = v6;
    id v16 = v9;
    uint64_t v10 = [v7 tokenWithCancelationBlock:&v11];
    -[EMMailboxRepository setRegistrationCancelable:](self, "setRegistrationCancelable:", v10, v11, v12, v13, v14);
  }
}

- (EFCancelable)registrationCancelable
{
  return (EFCancelable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRegistrationCancelable:(id)a3
{
}

- (EMMailboxRepository)initWithRemoteConnection:(id)a3 accountRepository:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)EMMailboxRepository;
  id v8 = [(EMRepository *)&v22 initWithRemoteConnection:v6];
  if (v8)
  {
    v23[0] = @"name";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    +[EMQuery addValidSortDescriptorKeyPaths:v9 forTargetClass:objc_opt_class()];

    v8->_mailboxesPromiseLock._os_unfair_lock_opaque = 0;
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_accountRepository, a4);
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    observerMap = v8->_observerMap;
    v8->_observerMap = (NSMapTable *)v10;

    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mailboxesByObjectID = v8->_mailboxesByObjectID;
    v8->_mailboxesByObjectID = v12;

    uint64_t v14 = [MEMORY[0x1E4F60E18] promise];
    mailboxesPromise = v8->_mailboxesPromise;
    v8->_mailboxesPromise = (EFPromise *)v14;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke;
    v19[3] = &unk_1E63E2688;
    objc_copyWeak(&v20, &location);
    [v6 addResetHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke_2;
    v17[3] = &unk_1E63E2688;
    objc_copyWeak(&v18, &location);
    [v6 addRecoveryHandler:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v8;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EMMailboxRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_22 != -1) {
    dispatch_once(&log_onceToken_22, block);
  }
  v2 = (void *)log_log_22;
  return (OS_os_log *)v2;
}

void __26__EMMailboxRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_22;
  log_log_22 = (uint64_t)v1;
}

- (id)initInternal
{
}

void __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRegistrationCancelable:0];
}

void __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restartObservingMailboxChangesIfNecessary];
}

- (void)dealloc
{
  [(EFCancelable *)self->_registrationCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)EMMailboxRepository;
  [(EMMailboxRepository *)&v3 dealloc];
}

void __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[EMMailboxRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_cold_1((uint64_t)v3, v4);
  }

  id v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMErrorDomain" code:1025 userInfo:0];
  [v5 finishWithError:v6];
}

uint64_t __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelObservation:*(void *)(a1 + 40)];
}

- (void)performQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(EMMailboxRepository *)self _startObservingMailboxChangesIfNecessary];
  id v8 = [(EMMailboxRepository *)self _mailboxesFuture];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__EMMailboxRepository_performQuery_completionHandler___block_invoke;
  v14[3] = &unk_1E63E4380;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  [v8 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__EMMailboxRepository_performQuery_completionHandler___block_invoke_2;
  v12[3] = &unk_1E63E2C40;
  id v11 = v10;
  id v13 = v11;
  [v8 addFailureBlock:v12];
}

void __54__EMMailboxRepository_performQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) predicate];
  id v4 = [v7 filteredOrderedSetUsingPredicate:v3];
  id v5 = [*(id *)(a1 + 32) sortDescriptors];
  id v6 = [v4 sortedArrayUsingDescriptors:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __54__EMMailboxRepository_performQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__EMMailboxRepository_performQuery_withObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 9);
  [*((id *)WeakRetained + 8) removeObjectForKey:*(void *)(a1 + 32)];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 9);
}

- (id)mailboxesForObjectIDs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__EMMailboxRepository_mailboxesForObjectIDs___block_invoke;
  v5[3] = &unk_1E63E43D0;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "ef_map:", v5);
  return v3;
}

id __45__EMMailboxRepository_mailboxesForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) mailboxForObjectID:a2];
  return v2;
}

- (id)mailboxIfAvailableForObjectID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(NSMutableDictionary *)self->_mailboxesByObjectID objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)mailboxesIfAvailableForObjectIDs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__EMMailboxRepository_mailboxesIfAvailableForObjectIDs___block_invoke;
  v5[3] = &unk_1E63E43F8;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "ef_compactMap:", v5);
  return v3;
}

id __56__EMMailboxRepository_mailboxesIfAvailableForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) mailboxIfAvailableForObjectID:a2];
  return v2;
}

- (void)refreshMailboxList:(int64_t)a3
{
  id v5 = [(EMRepository *)self connection];
  id v4 = [v5 remoteObjectProxy];
  [v4 refreshMailboxList:a3];
}

- (id)performMailboxChangeAction:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F60E18] promise];
  id v6 = [(EMRepository *)self connection];
  id v7 = [v6 reattemptingRemoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__EMMailboxRepository_performMailboxChangeAction___block_invoke;
  v11[3] = &unk_1E63E4420;
  id v8 = v5;
  id v12 = v8;
  [v7 performMailboxChangeAction:v4 completionHandler:v11];

  id v9 = [v8 future];

  return v9;
}

void __50__EMMailboxRepository_performMailboxChangeAction___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  objc_msgSend(v2, "finishWithResult:");
}

- (NSSet)allMailboxObjectIDs
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableDictionary *)self->_mailboxesByObjectID count])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v5 = [(NSMutableDictionary *)self->_mailboxesByObjectID allKeys];
    id v6 = (void *)[v4 initWithArray:v5];

    os_unfair_lock_unlock(p_lock);
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  id v6 = [(EMMailboxRepository *)self remoteAllMailboxObjectIDs];
LABEL_6:
  return (NSSet *)v6;
}

- (id)remoteAllMailboxObjectIDs
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  id v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  v2 = [(EMRepository *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_28];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_105;
  v6[3] = &unk_1E63E4448;
  v6[4] = &v7;
  [v3 getAllMailboxObjectIDsWithCompletion:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EMMailboxRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_105(uint64_t a1, void *a2)
{
}

- (id)remoteMailboxObjectIDsForMailboxType:(int64_t)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__5;
  uint64_t v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  id v4 = [(EMRepository *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_110;
  v8[3] = &unk_1E63E4448;
  v8[4] = &v10;
  [v5 mailboxObjectIDsForMailboxType:a3 completionHandler:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EMMailboxRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_cold_1();
  }
}

void __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_110(uint64_t a1, void *a2)
{
}

- (int64_t)mailboxTypeForMailboxObjectID:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(NSMutableDictionary *)self->_mailboxesByObjectID count])
  {
    id v6 = [(NSMutableDictionary *)self->_mailboxesByObjectID objectForKey:v4];
    int64_t v7 = [v6 type];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    int64_t v7 = [(EMMailboxRepository *)self remoteMailboxTypeForMailboxObjectID:v4];
  }

  return v7;
}

- (int64_t)remoteMailboxTypeForMailboxObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = -500;
  id v5 = [(EMRepository *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke;
  v11[3] = &unk_1E63E4330;
  id v6 = v4;
  id v12 = v6;
  int64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_111;
  v10[3] = &unk_1E63E44B8;
  v10[4] = &v13;
  [v7 mailboxTypeForMailboxObjectID:v6 completionHandler:v10];

  int64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EMMailboxRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_cold_1();
  }
}

uint64_t __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_111(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __42__EMMailboxRepository_mailboxListChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2 - 1];
  }
  else
  {
    id v9 = 0;
  }
  id v6 = *(void **)(a1 + 40);
  int64_t v7 = [*(id *)(a1 + 32) array];
  int64_t v8 = objc_msgSend(v7, "subarrayWithRange:", a2, a3);
  [v6 queryMatchedAddedObjectIDs:v8 after:v9 extraInfo:0];
}

- (void)recordFrecencyEventWithMailboxURLString:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    if (v5)
    {
      id v6 = [[EMMailboxObjectID alloc] initWithURL:v5];
      int64_t v7 = v6;
      if (v6)
      {
        v9[0] = v6;
        int64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
        [(EMMailboxRepository *)self recordFrecencyEventWithMailboxIDs:v8];
      }
    }
  }
}

- (void)recordFrecencyEventWithMailboxesOfMessage:(id)a3
{
  id v4 = [a3 mailboxObjectIDs];
  -[EMMailboxRepository recordFrecencyEventWithMailboxIDs:](self, "recordFrecencyEventWithMailboxIDs:");
}

- (void)recordFrecencyEventWithMailboxIDs:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = [(EMRepository *)self connection];
    id v5 = [v4 remoteObjectProxy];
    [v5 recordFrecencyEventWithMailboxesWithIDs:v6];
  }
}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  id v3 = [(EMRepository *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 testRecordFrecencyEventsForAllMailboxes];
}

- (void)testResetFrecencyForAllMailboxes
{
  id v3 = [(EMRepository *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 testResetFrecencyForAllMailboxes];
}

- (void)setMailboxesPromise:(id)a3
{
}

- (NSMapTable)observerMap
{
  return self->_observerMap;
}

- (void)setObserverMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRepository, 0);
  objc_storeStrong((id *)&self->_observerMap, 0);
  objc_storeStrong((id *)&self->_mailboxesPromise, 0);
  objc_storeStrong((id *)&self->_registrationCancelable, 0);
  objc_storeStrong((id *)&self->_mailboxesByObjectID, 0);
}

void __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Error establishing xpc connection : %@", (uint8_t *)&v2, 0xCu);
}

void __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Failed getAllMailboxObjectIDsWithCompletion: error:%{public}@", (uint8_t *)&v2, 0xCu);
}

void __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_1(&dword_1BEFDB000, v0, v1, "Failed mailboxObjectIDsForMailboxType:%li error:%{public}@");
}

void __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_1(&dword_1BEFDB000, v0, v1, "Failed mailboxTypeForMailboxObjectID:%{public}@ error:%{public}@");
}

@end