@interface EDMailboxProvider
- (BOOL)_isDeferringInvalidation;
- (EDAccountsProvider)accountsProvider;
- (EDMailboxProvider)initWithAccountsProvider:(id)a3;
- (EDMailboxProviderDelegate)delegate;
- (EFScheduler)observerScheduler;
- (NSArray)allMailboxCache;
- (NSMapTable)legacyMailboxToMailboxMap;
- (NSMapTable)objectIDToLegacyMailboxMap;
- (NSSet)allMailboxObjectIDs;
- (OS_dispatch_queue)mailboxCacheQueue;
- (id)_transformMailbox:(id)a3 legacyMailboxToMailboxMap:(id)a4 objectIDToLegacyMailboxMap:(id)a5;
- (id)allMailboxes;
- (id)legacyMailboxForObjectID:(id)a3;
- (id)legacyMailboxesForObjectIDs:(id)a3;
- (id)mailboxForObjectID:(id)a3;
- (id)mailboxFromLegacyMailbox:(id)a3;
- (id)mailboxObjectIDsForMailboxType:(int64_t)a3;
- (id)mailboxesFromLegacyMailboxes:(id)a3;
- (int64_t)mailboxTypeForMailboxObjectID:(id)a3;
- (void)_didChangeMailboxList:(id)a3;
- (void)_fetchMailboxesForAccount:(id)a3 kind:(int64_t)a4;
- (void)_invalidateCache;
- (void)_mailboxInvalidated:(id)a3;
- (void)_populateCache;
- (void)beginDeferringInvalidation;
- (void)endDeferringInvalidation;
- (void)enumerateAccountsWithBlock:(id)a3;
- (void)fetchMailboxesWithKind:(int64_t)a3;
- (void)invalidateMailboxes;
- (void)setAccountsProvider:(id)a3;
- (void)setAllMailboxCache:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegacyMailboxToMailboxMap:(id)a3;
- (void)setObjectIDToLegacyMailboxMap:(id)a3;
- (void)setObserverScheduler:(id)a3;
- (void)test_tearDown;
@end

@implementation EDMailboxProvider

- (void)_invalidateCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mailboxCacheQueue);
  v3 = [(EDMailboxProvider *)self legacyMailboxToMailboxMap];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(EDMailboxProvider *)self objectIDToLegacyMailboxMap];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(EDMailboxProvider *)self allMailboxCache];
      BOOL v4 = v6 != 0;
    }
  }

  [(EDMailboxProvider *)self setLegacyMailboxToMailboxMap:0];
  [(EDMailboxProvider *)self setObjectIDToLegacyMailboxMap:0];
  [(EDMailboxProvider *)self setAllMailboxCache:0];
  self->_needsToInvalidate = 0;
  if (v4)
  {
    v7 = _ef_log_EDMailboxProvider();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "_invalidateCache invalidated", buf, 2u);
    }
  }
  v8 = [(EDMailboxProvider *)self delegate];
  if (v8) {
    BOOL v9 = v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v10 = [(EDMailboxProvider *)self observerScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__EDMailboxProvider__invalidateCache__block_invoke;
    v11[3] = &unk_1E6BFF2F0;
    id v12 = v8;
    [v10 performBlock:v11];
  }
}

- (NSMapTable)objectIDToLegacyMailboxMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (NSMapTable)legacyMailboxToMailboxMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObjectIDToLegacyMailboxMap:(id)a3
{
}

- (void)setLegacyMailboxToMailboxMap:(id)a3
{
}

- (void)setAllMailboxCache:(id)a3
{
}

- (NSArray)allMailboxCache
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (EDMailboxProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (EDMailboxProviderDelegate *)WeakRetained;
}

unsigned char *__41__EDMailboxProvider__mailboxInvalidated___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _isDeferringInvalidation];
  result = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    if (!result[12])
    {
      BOOL v4 = _ef_log_EDMailboxProvider();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "_needsToInvalidate = YES", v5, 2u);
      }

      result = *(unsigned char **)(a1 + 32);
    }
    result[12] = 1;
  }
  else
  {
    return (unsigned char *)[result _invalidateCache];
  }
  return result;
}

- (BOOL)_isDeferringInvalidation
{
  signed int v2 = atomic_load((unsigned int *)&self->_deferringInvalidationCount);
  return v2 > 0;
}

- (void)_mailboxInvalidated:(id)a3
{
  mailboxCacheQueue = self->_mailboxCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__EDMailboxProvider__mailboxInvalidated___block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  dispatch_async(mailboxCacheQueue, block);
}

- (void)_didChangeMailboxList:(id)a3
{
}

void __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke(uint64_t a1)
{
  signed int v2 = [*(id *)(a1 + 32) legacyMailboxToMailboxMap];

  if (!v2) {
    [*(id *)(a1 + 32) _populateCache];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke_2;
  v7[3] = &unk_1E6C01B50;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "ef_compactMap:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke(uint64_t a1)
{
  signed int v2 = [*(id *)(a1 + 32) objectIDToLegacyMailboxMap];

  if (!v2) {
    [*(id *)(a1 + 32) _populateCache];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke_2;
  v7[3] = &unk_1E6C01BA0;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "ef_compactMap:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)allMailboxes
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  mailboxCacheQueue = self->_mailboxCacheQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__EDMailboxProvider_allMailboxes__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mailboxCacheQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)invalidateMailboxes
{
}

unsigned char *__45__EDMailboxProvider_endDeferringInvalidation__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[12]) {
    return (unsigned char *)[result _invalidateCache];
  }
  return result;
}

- (id)mailboxForObjectID:(id)a3
{
  uint64_t v4 = [(EDMailboxProvider *)self legacyMailboxForObjectID:a3];
  if (v4)
  {
    uint64_t v5 = [(EDMailboxProvider *)self mailboxFromLegacyMailbox:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)mailboxFromLegacyMailbox:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v7 = [(EDMailboxProvider *)self mailboxesFromLegacyMailboxes:v6];
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)legacyMailboxForObjectID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v7 = [(EDMailboxProvider *)self legacyMailboxesForObjectIDs:v6];
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)legacyMailboxesForObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  mailboxCacheQueue = self->_mailboxCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke;
  block[3] = &unk_1E6C01B78;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(mailboxCacheQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)mailboxesFromLegacyMailboxes:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  mailboxCacheQueue = self->_mailboxCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke;
  block[3] = &unk_1E6C01B78;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(mailboxCacheQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

id __49__EDMailboxProvider_legacyMailboxesForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectIDToLegacyMailboxMap];
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

id __50__EDMailboxProvider_mailboxesFromLegacyMailboxes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) legacyMailboxToMailboxMap];
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)fetchMailboxesWithKind:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__EDMailboxProvider_fetchMailboxesWithKind___block_invoke;
  v3[3] = &unk_1E6C01B28;
  v3[4] = self;
  v3[5] = a3;
  [(EDMailboxProvider *)self enumerateAccountsWithBlock:v3];
}

- (void)_populateCache
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(EDMailboxProvider *)self beginDeferringInvalidation];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  uint64_t v5 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __35__EDMailboxProvider__populateCache__block_invoke;
  v15 = &unk_1E6C01B00;
  v16 = self;
  id v6 = v4;
  id v17 = v6;
  id v7 = v5;
  id v18 = v7;
  id v8 = v3;
  id v19 = v8;
  [(EDMailboxProvider *)self enumerateAccountsWithBlock:&v12];
  -[EDMailboxProvider setLegacyMailboxToMailboxMap:](self, "setLegacyMailboxToMailboxMap:", v6, v12, v13, v14, v15, v16);
  [(EDMailboxProvider *)self setObjectIDToLegacyMailboxMap:v7];
  BOOL v9 = (void *)[v8 copy];
  [(EDMailboxProvider *)self setAllMailboxCache:v9];

  [(EDMailboxProvider *)self endDeferringInvalidation];
  _ef_log_EDMailboxProvider();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "populated cache: %lu", buf, 0xCu);
  }
}

- (void)endDeferringInvalidation
{
  if (atomic_fetch_add(&self->_deferringInvalidationCount, 0xFFFFFFFF) == 1)
  {
    mailboxCacheQueue = self->_mailboxCacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__EDMailboxProvider_endDeferringInvalidation__block_invoke;
    block[3] = &unk_1E6BFF2F0;
    block[4] = self;
    dispatch_async(mailboxCacheQueue, block);
  }
}

- (void)beginDeferringInvalidation
{
}

- (void)enumerateAccountsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountsProvider);
  id v6 = [WeakRetained mailAccounts];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "isActive", (void)v12)) {
          v4[2](v4, v11);
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void __35__EDMailboxProvider__populateCache__block_invoke(uint64_t a1, void *a2)
{
  id v4 = (void *)MEMORY[0x1E0190280]();
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 rootMailbox];
  id v7 = [v5 _transformMailbox:v6 legacyMailboxToMailboxMap:*(void *)(a1 + 40) objectIDToLegacyMailboxMap:*(void *)(a1 + 48)];

  [*(id *)(a1 + 56) addObjectsFromArray:v7];
}

uint64_t __44__EDMailboxProvider_fetchMailboxesWithKind___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchMailboxesForAccount:a2 kind:*(void *)(a1 + 40)];
}

void __33__EDMailboxProvider_allMailboxes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) allMailboxCache];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [*(id *)(a1 + 32) _populateCache];
    uint64_t v5 = [*(id *)(a1 + 32) allMailboxCache];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void ___ef_log_EDMailboxProvider_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDMailboxProvider");
  v1 = (void *)_ef_log_EDMailboxProvider_log;
  _ef_log_EDMailboxProvider_log = (uint64_t)v0;
}

- (EDMailboxProvider)initWithAccountsProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EDMailboxProvider;
  uint64_t v5 = [(EDMailboxProvider *)&v16 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accountsProvider, v4);
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mail.EDMailboxProviderQueue", v7);
    mailboxCacheQueue = v6->_mailboxCacheQueue;
    v6->_mailboxCacheQueue = (OS_dispatch_queue *)v8;

    id v10 = (void *)MEMORY[0x1E4F60F28];
    uint64_t v11 = (objc_class *)objc_opt_class();
    long long v12 = NSStringFromClass(v11);
    uint64_t v13 = [v10 serialDispatchQueueSchedulerWithName:v12 qualityOfService:17];
    observerScheduler = v6->_observerScheduler;
    v6->_observerScheduler = (EFScheduler *)v13;
  }
  return v6;
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMailboxProvider.m", 43, @"%s can only be called from unit tests", "-[EDMailboxProvider test_tearDown]");
  }
  dispatch_sync((dispatch_queue_t)self->_mailboxCacheQueue, &__block_literal_global_10_0);
  id v4 = [(EDMailboxProvider *)self observerScheduler];
  [v4 performSyncBlock:&__block_literal_global_12];
}

- (id)_transformMailbox:(id)a3 legacyMailboxToMailboxMap:(id)a4 objectIDToLegacyMailboxMap:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(EDMailboxProvider *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxProvider _transformMailbox:legacyMailboxToMailboxMap:objectIDToLegacyMailboxMap:]", "EDMailboxProvider.m", 104, "0");
}

- (void)_fetchMailboxesForAccount:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  [(EDMailboxProvider *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxProvider _fetchMailboxesForAccount:kind:]", "EDMailboxProvider.m", 114, "0");
}

uint64_t __37__EDMailboxProvider__invalidateCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mailboxListInvalidated];
}

- (NSSet)allMailboxObjectIDs
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(EDMailboxProvider *)self allMailboxes];
  id v5 = objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
  id v6 = (void *)[v3 initWithArray:v5];

  return (NSSet *)v6;
}

- (id)mailboxObjectIDsForMailboxType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(EDMailboxProvider *)self allMailboxes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 type] == a3)
        {
          id v11 = [v10 objectID];
          [v5 addObject:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

- (int64_t)mailboxTypeForMailboxObjectID:(id)a3
{
  id v3 = [(EDMailboxProvider *)self mailboxForObjectID:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 type];
  }
  else {
    int64_t v5 = -500;
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (EDAccountsProvider)accountsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountsProvider);

  return (EDAccountsProvider *)WeakRetained;
}

- (void)setAccountsProvider:(id)a3
{
}

- (OS_dispatch_queue)mailboxCacheQueue
{
  return self->_mailboxCacheQueue;
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (void)setObserverScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_mailboxCacheQueue, 0);
  objc_storeStrong((id *)&self->_allMailboxCache, 0);
  objc_storeStrong((id *)&self->_objectIDToLegacyMailboxMap, 0);
  objc_storeStrong((id *)&self->_legacyMailboxToMailboxMap, 0);
  objc_destroyWeak((id *)&self->_accountsProvider);

  objc_destroyWeak((id *)&self->delegate);
}

@end