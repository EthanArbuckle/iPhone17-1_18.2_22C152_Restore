@interface EDThreadScopeManager
+ (OS_os_log)log;
+ (id)mailboxTypesToPrecompute;
- (BOOL)_isBlackPearlPredicate:(id *)a3;
- (BOOL)_shouldPrecomputeMailboxType:(id)a3;
- (BOOL)_shouldPrecomputeMailboxWithObjectID:(id)a3;
- (BOOL)isThreadScopePrecomputed:(id)a3 mailboxProvider:(id)a4 shouldMigrate:(BOOL *)a5;
- (EDThreadScopeManager)initWithDataSource:(id)a3;
- (EDThreadScopeManagerDataSource)dataSource;
- (EFScheduler)evictionScheduler;
- (NSArray)threadScopes;
- (double)_evictionScoreForCount:(unint64_t)a3 timeInterval:(double)a4;
- (id)_mailboxFromPrecomputedMailboxScope:(id)a3 mailboxProvider:(id)a4 mailboxPredicate:(id *)a5;
- (id)_mailboxScopeFromPredicate:(id)a3;
- (id)_precomputedMailboxScopeForFilterPredicate:(id)a3 mailboxTypeResolver:(id)a4 foundPredicates:(unint64_t *)a5;
- (id)_threadScopeInfoForThreadScope:(id)a3;
- (id)_threadScopesWithLastViewedOlderThanLimit;
- (id)precomputedMailboxScopeForThreadScope:(id)a3 mailboxTypeResolver:(id)a4 foundPredicates:(unint64_t *)a5;
- (id)threadScopeFromPrecomputedMailboxScope:(id)a3 predicates:(unint64_t)a4 mailboxProvider:(id)a5;
- (id)threadScopesByDatabaseID;
- (int64_t)databaseIDForThreadScope:(id)a3;
- (unint64_t)_findPredicateTypeWithCompoundPredicate:(id)a3 mailboxTypeResolver:(id)a4 outMailboxScope:(id *)a5;
- (unint64_t)_numberOfThreadScopesToEvictFrom:(id)a3 upTo:(unint64_t *)a4;
- (void)_evictAtLeast:(unint64_t)a3 upTo:(unint64_t)a4 fromThreadScopesWithDatabaseIDs:(id)a5;
- (void)_initializeThreadScopesIfNeeded;
- (void)addThreadScope:(id)a3 withDatabaseID:(int64_t)a4 needsUpdate:(BOOL)a5 lastViewedDate:(id)a6;
- (void)logExistingThreadScopes;
- (void)removeAllThreadScopes;
- (void)removeThreadScope:(id)a3;
- (void)removeThreadScopesForMailboxScope:(id)a3;
- (void)resetCache;
- (void)setLastViewedDate:(id)a3 forThreadScope:(id)a4;
- (void)setNeedsUpdate:(BOOL)a3 forThreadScope:(id)a4;
@end

@implementation EDThreadScopeManager

- (int64_t)databaseIDForThreadScope:(id)a3
{
  id v4 = a3;
  [(EDThreadScopeManager *)self _initializeThreadScopesIfNeeded];
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  v6 = [(NSMutableDictionary *)self->_threadScopes objectForKeyedSubscript:v4];
  v7 = v6;
  if (v6) {
    int64_t v8 = [v6 databaseID];
  }
  else {
    int64_t v8 = *MEMORY[0x1E4F5FCC8];
  }

  os_unfair_lock_unlock(p_threadScopesLock);
  return v8;
}

- (void)_initializeThreadScopesIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  p_threadScopes = (id *)&self->_threadScopes;
  threadScopes = self->_threadScopes;
  os_unfair_lock_unlock(p_threadScopesLock);
  if (!threadScopes)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = [(EDThreadScopeManager *)self dataSource];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__EDThreadScopeManager__initializeThreadScopesIfNeeded__block_invoke;
    v16[3] = &unk_1E6C07750;
    id v8 = v6;
    id v17 = v8;
    [v7 threadScopeManager:self populateThreadScopesWithBlock:v16];

    uint64_t v15 = 0;
    os_unfair_lock_lock(p_threadScopesLock);
    if (*p_threadScopes) {
      goto LABEL_9;
    }
    objc_storeStrong((id *)&self->_threadScopes, v6);
    v9 = +[EDThreadScopeManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *p_threadScopes;
      *(_DWORD *)buf = 138543362;
      unint64_t v19 = (unint64_t)v10;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Loaded pre-computed thread scopes: %{public}@", buf, 0xCu);
    }

    unint64_t v11 = [*p_threadScopes count];
    if (v11 < 6)
    {
LABEL_9:
      v12 = 0;
      unint64_t v13 = 0;
    }
    else
    {
      v12 = [(EDThreadScopeManager *)self _threadScopesWithLastViewedOlderThanLimit];
      unint64_t v13 = [(EDThreadScopeManager *)self _numberOfThreadScopesToEvictFrom:v12 upTo:&v15];
      v14 = +[EDThreadScopeManager log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        unint64_t v19 = v13;
        __int16 v20 = 2048;
        uint64_t v21 = v15;
        __int16 v22 = 2048;
        unint64_t v23 = v11;
        __int16 v24 = 2114;
        v25 = v12;
        _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Evicting %lu-%lu thread scopes (after initializing %lu thread scopes) from: %{public}@", buf, 0x2Au);
      }
    }
    os_unfair_lock_unlock(p_threadScopesLock);
    if ([v12 count])
    {
      if (v15) {
        [(EDThreadScopeManager *)self _evictAtLeast:v13 upTo:v15 fromThreadScopesWithDatabaseIDs:v12];
      }
    }
  }
}

- (BOOL)isThreadScopePrecomputed:(id)a3 mailboxProvider:(id)a4 shouldMigrate:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(EDThreadScopeManager *)self _initializeThreadScopesIfNeeded];
  id v10 = [(EDThreadScopeManager *)self _threadScopeInfoForThreadScope:v8];
  unint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v15 = [(EDThreadScopeManager *)self precomputedMailboxScopeForThreadScope:v8 mailboxTypeResolver:v9 foundPredicates:0];

    char v13 = 0;
    char v12 = v15 != 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v12 = [v10 needsUpdate];
  char v13 = v12 ^ 1;
  if (a5) {
LABEL_3:
  }
    *a5 = v12;
LABEL_4:

  return v13;
}

- (id)_threadScopeInfoForThreadScope:(id)a3
{
  id v4 = a3;
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  id v6 = [(NSMutableDictionary *)self->_threadScopes objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_threadScopesLock);

  return v6;
}

- (void)setLastViewedDate:(id)a3 forThreadScope:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Setting lastViewedDate=%{public}@ for thread scope: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  id v10 = [(NSMutableDictionary *)self->_threadScopes objectForKeyedSubscript:v7];
  [v10 setLastViewedDate:v6];

  os_unfair_lock_unlock(p_threadScopesLock);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDThreadScopeManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_96 != -1) {
    dispatch_once(&log_onceToken_96, block);
  }
  v2 = (void *)log_log_96;

  return (OS_os_log *)v2;
}

void __27__EDThreadScopeManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_96;
  log_log_96 = (uint64_t)v1;
}

- (EDThreadScopeManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDThreadScopeManager;
  v5 = [(EDThreadScopeManager *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_threadScopesLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.EmailDaemon.EDThreadScopeManager.evictionScheduler"];
    evictionScheduler = v6->_evictionScheduler;
    v6->_evictionScheduler = (EFScheduler *)v7;
  }
  return v6;
}

+ (id)mailboxTypesToPrecompute
{
  if (mailboxTypesToPrecompute_onceToken != -1) {
    dispatch_once(&mailboxTypesToPrecompute_onceToken, &__block_literal_global_87);
  }
  v2 = (void *)mailboxTypesToPrecompute_mailboxTypes;

  return v2;
}

void __48__EDThreadScopeManager_mailboxTypesToPrecompute__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F35BB330, &unk_1F35BB348, &unk_1F35BB360, &unk_1F35BB378, &unk_1F35BB390, &unk_1F35BB3A8, 0);
  os_log_t v1 = (void *)mailboxTypesToPrecompute_mailboxTypes;
  mailboxTypesToPrecompute_mailboxTypes = v0;
}

- (id)precomputedMailboxScopeForThreadScope:(id)a3 mailboxTypeResolver:(id)a4 foundPredicates:(unint64_t *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = [v8 mailboxScope];
  int v11 = [v8 filterPredicate];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F60318] allMailboxesScope];

    if (v10 != v12)
    {
      __int16 v13 = +[EDThreadScopeManager log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = objc_msgSend(v11, "ef_publicDescription");
        *(_DWORD *)v27 = 138543362;
        *(void *)&v27[4] = v14;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Thread scope has unsupported filter predicate: %{public}@", v27, 0xCu);
      }
      goto LABEL_8;
    }
    *(void *)v27 = 0;
    v16 = [(EDThreadScopeManager *)self _precomputedMailboxScopeForFilterPredicate:v11 mailboxTypeResolver:v9 foundPredicates:v27];

    if (a5) {
      *a5 = *(void *)v27;
    }
    id v15 = v16;
    objc_super v10 = v15;
  }
  else
  {
    if (([v10 excludeTypes] & 1) != 0 || objc_msgSend(v10, "excludeMailboxes")) {
      goto LABEL_8;
    }
    id v17 = [v10 mailboxTypes];
    v18 = [v8 mailboxScope];
    unint64_t v19 = [v18 mailboxObjectIDs];

    uint64_t v20 = [v17 count];
    if ((unint64_t)([v19 count] + v20) >= 2)
    {
      if (a5) {
        *a5 = 0;
      }

LABEL_17:
      id v15 = 0;
      goto LABEL_18;
    }
    __int16 v22 = [v17 anyObject];
    if (v22 && [(EDThreadScopeManager *)self _shouldPrecomputeMailboxType:v22])
    {
      if (a5) {
        *a5 = 0;
      }
      id v23 = v10;
      int v24 = 1;
    }
    else
    {
      v25 = [v19 anyObject];
      if (v25
        && [(EDThreadScopeManager *)self _shouldPrecomputeMailboxWithObjectID:v25])
      {
        if (a5) {
          *a5 = 0;
        }
        id v26 = v10;
        int v24 = 1;
      }
      else
      {
        int v24 = 0;
      }
    }
    if (!v24)
    {
LABEL_8:
      if (a5)
      {
        id v15 = 0;
        *a5 = 0;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    id v15 = v10;
  }
LABEL_18:

  return v15;
}

- (id)_precomputedMailboxScopeForFilterPredicate:(id)a3 mailboxTypeResolver:(id)a4 foundPredicates:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v20 = v8;
  BOOL v10 = [(EDThreadScopeManager *)self _isBlackPearlPredicate:&v20];
  id v11 = v20;

  if (v10) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v10)
    {
      id v15 = [(EDThreadScopeManager *)self _mailboxScopeFromPredicate:v11];
      unint64_t v16 = 4;
      if (!v15) {
        goto LABEL_20;
      }
      goto LABEL_10;
    }
    if (a5)
    {
      id v17 = 0;
      id v15 = 0;
LABEL_21:
      *a5 = 0;
      goto LABEL_22;
    }
LABEL_19:
    id v17 = 0;
    id v15 = 0;
    goto LABEL_22;
  }
  id v13 = v11;
  if ([v13 compoundPredicateType] != 2)
  {
    if (a5) {
      *a5 = 0;
    }

    goto LABEL_19;
  }
  id v19 = 0;
  unint64_t v14 = [(EDThreadScopeManager *)self _findPredicateTypeWithCompoundPredicate:v13 mailboxTypeResolver:v9 outMailboxScope:&v19];
  id v15 = v19;
  unint64_t v16 = v14 | v12;

  if (!v15)
  {
LABEL_20:
    id v17 = 0;
    if (!a5) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_10:
  if (!v16) {
    goto LABEL_20;
  }
  if (a5) {
    *a5 = v16;
  }
  id v17 = v15;
  id v15 = v17;
LABEL_22:

  return v17;
}

- (BOOL)_isBlackPearlPredicate:(id *)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = *a3;
  if ([v4 compoundPredicateType] == 1
    && ([v4 subpredicates],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6 == 2))
  {
    uint64_t v7 = [v4 subpredicates];
    id v8 = [v7 firstObject];

    id v9 = [v4 subpredicates];
    BOOL v10 = [v9 lastObject];

    id v11 = [MEMORY[0x1E4F60390] predicateForPrimaryMessages];
    char v12 = [v8 isEqual:v11];

    id v13 = v10;
    if ((v12 & 1) != 0
      || ([MEMORY[0x1E4F60390] predicateForPrimaryMessages],
          unint64_t v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v10 isEqual:v14],
          v14,
          id v13 = v8,
          (v15 & 1) != 0))
    {
      *a3 = v13;
      BOOL v16 = 1;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)_findPredicateTypeWithCompoundPredicate:(id)a3 mailboxTypeResolver:(id)a4 outMailboxScope:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  [v18 subpredicates];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    unint64_t v10 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
    id v17 = a5;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (v11
          || ([(EDThreadScopeManager *)self _mailboxScopeFromPredicate:*(void *)(*((void *)&v20 + 1) + 8 * i)], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          if ((v10 & 1) != 0
            || ![MEMORY[0x1E4F60390] isPredicateForMessagesWithActiveFollowUp:v14 mailboxTypeResolver:v19 inSent:0 sentMailboxObjectIDs:0])
          {
            if ((v10 & 2) != 0
              || ![MEMORY[0x1E4F60390] isPredicateForMessagesWithFiredReadLaterDate:v14 accountObjectIDs:0])
            {

              a5 = v17;
              goto LABEL_19;
            }
            v10 |= 2uLL;
          }
          else
          {
            v10 |= 1uLL;
          }
        }
        else
        {
          id v11 = (void *)v15;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      a5 = v17;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_19:
    unint64_t v10 = 0;
    id v11 = 0;
  }

  if (a5) {
    *a5 = v11;
  }

  return v10;
}

- (id)_mailboxScopeFromPredicate:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  uint64_t v14 = -500;
  char v5 = [MEMORY[0x1E4F60390] isPredicateForMessagesInMailboxObjectID:v4 mailboxObjectID:&v13];
  id v6 = v13;
  if ((v5 & 1) != 0
    || ([MEMORY[0x1E4F60390] isPredicateForMessagesInMailboxWithType:v4 mailboxType:&v14] & 1) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(EDThreadScopeManager *)self _shouldPrecomputeMailboxWithObjectID:v6])
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F60318];
        v15[0] = v6;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
        uint64_t v9 = [v7 mailboxScopeForMailboxObjectIDs:v8 forExclusion:0];

        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v10 = [NSNumber numberWithInteger:v14];
      BOOL v11 = [(EDThreadScopeManager *)self _shouldPrecomputeMailboxType:v10];

      if (v11)
      {
        uint64_t v9 = [MEMORY[0x1E4F60318] mailboxScopeForMailboxType:v14 forExclusion:0];
        goto LABEL_9;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (id)_mailboxFromPrecomputedMailboxScope:(id)a3 mailboxProvider:(id)a4 mailboxPredicate:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 mailboxObjectIDs];
  unint64_t v10 = [v9 anyObject];

  BOOL v11 = (void *)MEMORY[0x1E4F60390];
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxWithObjectID:v10];
    id v13 = [v8 mailboxForObjectID:v10];
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v15 = [v7 mailboxTypes];
  BOOL v16 = [v15 anyObject];
  uint64_t v12 = objc_msgSend(v11, "predicateForMessagesInMailboxWithType:", objc_msgSend(v16, "integerValue"));

  id v13 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = v12;
LABEL_4:

  return v13;
}

- (id)threadScopeFromPrecomputedMailboxScope:(id)a3 predicates:(unint64_t)a4 mailboxProvider:(id)a5
{
  char v6 = a4;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((v6 & 3) == 0)
  {
    if ((v6 & 1) == 0)
    {
      if ((v6 & 2) == 0)
      {
        BOOL v11 = 0;
        goto LABEL_18;
      }
      uint64_t v13 = (uint64_t)v8;
      goto LABEL_15;
    }
    uint64_t v13 = (uint64_t)v8;
LABEL_9:
    BOOL v11 = 0;
    BOOL v16 = [MEMORY[0x1E4F60390] predicateForMessagesWithActiveFollowUpInSent];
    goto LABEL_10;
  }
  id v31 = 0;
  BOOL v11 = [(EDThreadScopeManager *)self _mailboxFromPrecomputedMailboxScope:v8 mailboxProvider:v9 mailboxPredicate:&v31];
  id v12 = v31;
  objc_msgSend(v10, "ef_addOptionalObject:", v12);
  uint64_t v13 = [MEMORY[0x1E4F60318] allMailboxesScope];

  if ((v6 & 1) == 0) {
    goto LABEL_11;
  }
  if (!v11) {
    goto LABEL_9;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F60390];
  v34[0] = v11;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  BOOL v16 = [v14 predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:v15 mailboxTypeResolver:v9];

LABEL_10:
  objc_msgSend(v10, "ef_addOptionalObject:", v16);

LABEL_11:
  if ((v6 & 2) != 0)
  {
    if (v11)
    {
      id v17 = (void *)MEMORY[0x1E4F60390];
      v33 = v11;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      id v19 = [v17 predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:v18];

LABEL_16:
      objc_msgSend(v10, "ef_addOptionalObject:", v19);

      goto LABEL_17;
    }
LABEL_15:
    BOOL v11 = 0;
    id v19 = [MEMORY[0x1E4F60390] predicateForFiredReadLaterMessages];
    goto LABEL_16;
  }
LABEL_17:
  id v8 = (id)v13;
LABEL_18:
  if ([v10 count])
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_orCompoundPredicateWithSubpredicates:", v10);
    if ((v6 & 4) == 0)
    {
      long long v21 = (void *)v20;
      goto LABEL_26;
    }
    id v22 = (id)v20;
    if (v20) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 4) == 0)
  {
    long long v21 = 0;
    goto LABEL_26;
  }
  id v30 = 0;
  id v23 = [(EDThreadScopeManager *)self _mailboxFromPrecomputedMailboxScope:v8 mailboxProvider:v9 mailboxPredicate:&v30];
  id v22 = v30;
LABEL_25:
  int v24 = (void *)MEMORY[0x1E4F28F60];
  v32[0] = v22;
  uint64_t v25 = [MEMORY[0x1E4F60390] predicateForPrimaryMessages];
  v32[1] = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  uint64_t v27 = objc_msgSend(v24, "ef_andCompoundPredicateWithSubpredicates:", v26);

  long long v21 = (void *)v27;
LABEL_26:
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F604F0]) initWithMailboxScope:v8 filterPredicate:v21];

  return v28;
}

- (BOOL)_shouldPrecomputeMailboxWithObjectID:(id)a3
{
  id v4 = a3;
  if ([v4 isEphemeral])
  {
    char v5 = 0;
  }
  else
  {
    char v6 = [(EDThreadScopeManager *)self dataSource];
    char v5 = [v6 threadScopeManager:self isValidMailboxObjectID:v4];
  }
  return v5;
}

- (BOOL)_shouldPrecomputeMailboxType:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() mailboxTypesToPrecompute];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (NSArray)threadScopes
{
  [(EDThreadScopeManager *)self _initializeThreadScopesIfNeeded];
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  id v4 = [(NSMutableDictionary *)self->_threadScopes allKeys];
  os_unfair_lock_unlock(p_threadScopesLock);

  return (NSArray *)v4;
}

- (id)threadScopesByDatabaseID
{
  [(EDThreadScopeManager *)self _initializeThreadScopesIfNeeded];
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_threadScopes, "count"));
  threadScopes = self->_threadScopes;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__EDThreadScopeManager_threadScopesByDatabaseID__block_invoke;
  v8[3] = &unk_1E6C07700;
  id v6 = v4;
  id v9 = v6;
  [(NSMutableDictionary *)threadScopes enumerateKeysAndObjectsUsingBlock:v8];

  os_unfair_lock_unlock(p_threadScopesLock);

  return v6;
}

void __48__EDThreadScopeManager_threadScopesByDatabaseID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "databaseID"));
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)addThreadScope:(id)a3 withDatabaseID:(int64_t)a4 needsUpdate:(BOOL)a5 lastViewedDate:(id)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [[_EDThreadScopeInfo alloc] initWithDatabaseID:a4 needsUpdate:v7 lastViewedDate:v11];
  uint64_t v13 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unint64_t v20 = (unint64_t)v10;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Adding pre-computed thread scope: %{public}@ -> %{public}@", buf, 0x16u);
  }

  id v18 = 0;
  os_unfair_lock_lock(&self->_threadScopesLock);
  [(NSMutableDictionary *)self->_threadScopes setObject:v12 forKeyedSubscript:v10];
  unint64_t v14 = [(NSMutableDictionary *)self->_threadScopes count];
  if (v14 < 0x10)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
  }
  else
  {
    uint64_t v15 = [(EDThreadScopeManager *)self _threadScopesWithLastViewedOlderThanLimit];
    unint64_t v16 = [(EDThreadScopeManager *)self _numberOfThreadScopesToEvictFrom:v15 upTo:&v18];
    id v17 = +[EDThreadScopeManager log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v20 = v16;
      __int16 v21 = 2048;
      id v22 = v18;
      __int16 v23 = 2048;
      unint64_t v24 = v14;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Evicting %lu-%lu thread scopes (after adding %luth thread scope) from: %{public}@", buf, 0x2Au);
    }
  }
  os_unfair_lock_unlock(&self->_threadScopesLock);
  if ([v15 count] && v18) {
    [(EDThreadScopeManager *)self _evictAtLeast:v16 upTo:v18 fromThreadScopesWithDatabaseIDs:v15];
  }
}

- (void)setNeedsUpdate:(BOOL)a3 forThreadScope:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Setting needsUpdate=%u for thread scope: %{public}@", (uint8_t *)v10, 0x12u);
  }

  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  id v9 = [(NSMutableDictionary *)self->_threadScopes objectForKeyedSubscript:v6];
  [v9 setNeedsUpdate:v4];

  os_unfair_lock_unlock(p_threadScopesLock);
}

- (void)removeAllThreadScopes
{
  id v3 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Resetting all pre-computed thread scopes", v7, 2u);
  }

  os_unfair_lock_lock(&self->_threadScopesLock);
  threadScopes = self->_threadScopes;
  if (threadScopes)
  {
    [(NSMutableDictionary *)threadScopes removeAllObjects];
  }
  else
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = self->_threadScopes;
    self->_threadScopes = v5;
  }
  os_unfair_lock_unlock(&self->_threadScopesLock);
}

- (void)removeThreadScope:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Resetting pre-computed thread scope: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_lock(&self->_threadScopesLock);
  [(NSMutableDictionary *)self->_threadScopes removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_threadScopesLock);
}

- (void)removeThreadScopesForMailboxScope:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Resetting pre-computed thread scopes for mailbox scope: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_threadScopesLock);
  threadScopes = self->_threadScopes;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __58__EDThreadScopeManager_removeThreadScopesForMailboxScope___block_invoke;
  v10[3] = &unk_1E6C07728;
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = [(NSMutableDictionary *)threadScopes keysOfEntriesPassingTest:v10];
  id v9 = [v8 allObjects];

  [(NSMutableDictionary *)self->_threadScopes removeObjectsForKeys:v9];
  os_unfair_lock_unlock(&self->_threadScopesLock);
}

uint64_t __58__EDThreadScopeManager_removeThreadScopesForMailboxScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 mailboxScope];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)resetCache
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(EDThreadScopeManager *)self dataSource];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__EDThreadScopeManager_resetCache__block_invoke;
  v9[3] = &unk_1E6C07750;
  id v5 = (NSMutableDictionary *)v3;
  id v10 = v5;
  [v4 threadScopeManager:self populateThreadScopesWithBlock:v9];

  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  threadScopes = self->_threadScopes;
  self->_threadScopes = v5;
  uint64_t v8 = v5;

  os_unfair_lock_unlock(p_threadScopesLock);
}

void __34__EDThreadScopeManager_resetCache__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a3;
  id v9 = a5;
  id v10 = [[_EDThreadScopeInfo alloc] initWithDatabaseID:a2 needsUpdate:a4 lastViewedDate:v9];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
}

void __55__EDThreadScopeManager__initializeThreadScopesIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a3;
  id v9 = a5;
  id v10 = [[_EDThreadScopeInfo alloc] initWithDatabaseID:a2 needsUpdate:a4 lastViewedDate:v9];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
}

- (void)_evictAtLeast:(unint64_t)a3 upTo:(unint64_t)a4 fromThreadScopesWithDatabaseIDs:(id)a5
{
  id v8 = a5;
  id v9 = [(EDThreadScopeManager *)self evictionScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke;
  v11[3] = &unk_1E6C01620;
  v11[4] = self;
  id v10 = v8;
  id v12 = v10;
  unint64_t v13 = a3;
  unint64_t v14 = a4;
  [v9 performBlock:v11];
}

void __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2 = [*(id *)(a1 + 32) dataSource];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2;
  v37[3] = &unk_1E6C07778;
  v37[4] = v3;
  id v5 = v26;
  id v38 = v5;
  [v2 threadScopeManager:v3 gatherStatisticsForThreadScopesWithDatabaseIDs:v4 block:v37];

  int v6 = [v5 allKeys];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_31;
  v35[3] = &unk_1E6C077A0;
  id v7 = v5;
  id v36 = v7;
  uint64_t v27 = [v6 sortedArrayUsingComparator:v35];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v27;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        if ((unint64_t)[v8 count] < *(void *)(a1 + 48))
        {
          [v8 addObject:v13];
          unint64_t v14 = +[EDThreadScopeManager log];
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_11;
          }
          *(_DWORD *)buf = 138412290;
          id v40 = v13;
          uint64_t v15 = v14;
          unint64_t v16 = "Adding %@ for eviction: below min";
          goto LABEL_15;
        }
        id v17 = [v7 objectForKeyedSubscript:v13];
        [v17 doubleValue];
        double v19 = v18;

        if (v19 <= 100.0) {
          goto LABEL_17;
        }
        [v8 addObject:v13];
        unint64_t v14 = +[EDThreadScopeManager log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v13;
          uint64_t v15 = v14;
          unint64_t v16 = "Adding %@ for eviction: score below threshold";
LABEL_15:
          _os_log_debug_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0xCu);
        }
LABEL_11:

        if ((unint64_t)[v8 count] >= *(void *)(a1 + 56)) {
          goto LABEL_17;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v20 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
      uint64_t v10 = v20;
    }
    while (v20);
  }
LABEL_17:

  __int16 v21 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v40 = v8;
    _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to evict thread scopes with database IDs: %{public}@", buf, 0xCu);
  }

  id v22 = [*(id *)(a1 + 32) dataSource];
  uint64_t v23 = *(void *)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_33;
  v28[3] = &unk_1E6C077F0;
  v28[4] = v23;
  id v24 = v8;
  id v29 = v24;
  id v25 = v7;
  id v30 = v25;
  [v22 threadScopeManager:v23 evictThreadScopesWithDatabaseIDs:v24 completionBlock:v28];
}

void __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [v7 timeIntervalSinceNow];
  double v9 = v8;
  if (v8 <= 0.0)
  {
    double v11 = -v8;
  }
  else
  {
    uint64_t v10 = +[EDThreadScopeManager log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218498;
      double v19 = v9;
      __int16 v20 = 2048;
      uint64_t v21 = a2;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_error_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_ERROR, "Last viewed %f seconds in the future for thread scope %lld: %{public}@", (uint8_t *)&v18, 0x20u);
    }

    double v11 = 0.0;
  }

  [*(id *)(a1 + 32) _evictionScoreForCount:a4 timeInterval:v11];
  uint64_t v13 = v12;
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v15 = *(void **)(a1 + 40);
  unint64_t v16 = [NSNumber numberWithLongLong:a2];
  [v15 setObject:v14 forKeyedSubscript:v16];

  id v17 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134218752;
    double v19 = *(double *)&a2;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2048;
    id v23 = a4;
    __int16 v24 = 2048;
    double v25 = v11;
    _os_log_debug_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEBUG, "Eviction score for %llu: %f (%llu count, %f time)", (uint8_t *)&v18, 0x2Au);
  }
}

uint64_t __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 compare:v6];

  return v8;
}

void __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_33(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_lock(v3);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2_34;
    v5[3] = &unk_1E6C077C8;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "ef_removeObjectsPassingTest:", v5);

    os_unfair_lock_unlock(v3);
  }
}

uint64_t __75__EDThreadScopeManager__evictAtLeast_upTo_fromThreadScopesWithDatabaseIDs___block_invoke_2_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 databaseID];
  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [NSNumber numberWithLongLong:v7];
  uint64_t v10 = [v8 containsObject:v9];

  if (v10)
  {
    double v11 = +[EDThreadScopeManager log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = [NSNumber numberWithLongLong:v7];
      unint64_t v14 = [v12 objectForKeyedSubscript:v13];
      int v16 = 134218498;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      id v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Evicting thread scope with database ID: %llu -> %{public}@ = %{public}@", (uint8_t *)&v16, 0x20u);
    }
  }

  return v10;
}

- (double)_evictionScoreForCount:(unint64_t)a3 timeInterval:(double)a4
{
  return (double)a3 / sqrt(a4 / 604800.0);
}

- (id)_threadScopesWithLastViewedOlderThanLimit
{
  os_unfair_lock_assert_owner(&self->_threadScopesLock);
  uint64_t v3 = [(NSMutableDictionary *)self->_threadScopes ef_filter:&__block_literal_global_38];
  uint64_t v4 = objc_msgSend(v3, "ef_mapValues:", &__block_literal_global_41_0);

  return v4;
}

BOOL __65__EDThreadScopeManager__threadScopesWithLastViewedOlderThanLimit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 lastViewedDate];
  uint64_t v5 = [v3 databaseID];
  id v6 = v4;
  [v6 timeIntervalSinceNow];
  double v8 = v7;
  if (v7 <= 0.0)
  {
    BOOL v10 = v7 < -604800.0;
  }
  else
  {
    double v9 = +[EDThreadScopeManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218498;
      double v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_error_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_ERROR, "Last viewed %f seconds in the future for thread scope %lld: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

id __65__EDThreadScopeManager__threadScopesWithLastViewedOlderThanLimit__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "databaseID"));

  return v3;
}

- (unint64_t)_numberOfThreadScopesToEvictFrom:(id)a3 upTo:(unint64_t *)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_threadScopesLock);
  unint64_t v7 = [(NSMutableDictionary *)self->_threadScopes count];
  unint64_t v8 = v7;
  if (v7 >= 5) {
    unint64_t v9 = v7 - 5;
  }
  else {
    unint64_t v9 = 0;
  }
  unint64_t v10 = [v6 count];
  if (a4)
  {
    if (v10 >= v9) {
      unint64_t v11 = v9;
    }
    else {
      unint64_t v11 = v10;
    }
    *a4 = v11;
  }
  unint64_t v12 = v8 - 10;
  if (v8 < 0xA) {
    unint64_t v12 = 0;
  }
  if (v10 >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v10;
  }

  return v13;
}

- (void)logExistingThreadScopes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_threadScopesLock = &self->_threadScopesLock;
  os_unfair_lock_lock(&self->_threadScopesLock);
  uint64_t v4 = [(NSMutableDictionary *)self->_threadScopes allKeys];
  os_unfair_lock_unlock(p_threadScopesLock);
  uint64_t v5 = +[EDThreadScopeManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Existing thread scopes:", buf, 2u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v8 = 138543362;
    long long v14 = v8;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        unint64_t v12 = +[EDThreadScopeManager log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v13 = objc_msgSend(v11, "ef_publicDescription");
          *(_DWORD *)buf = v14;
          __int16 v20 = v13;
          _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
}

- (EDThreadScopeManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (EDThreadScopeManagerDataSource *)WeakRetained;
}

- (EFScheduler)evictionScheduler
{
  return self->_evictionScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictionScheduler, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_threadScopes, 0);
}

@end