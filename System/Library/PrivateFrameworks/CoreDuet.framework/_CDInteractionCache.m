@interface _CDInteractionCache
- (BOOL)containsUniqueCacheCandidate:(id)a3;
- (NSArray)interactions;
- (NSPredicate)predicate;
- (_CDInteractionCache)initWithInteractionStore:(id)a3 size:(unint64_t)a4 queryPredicate:(id)a5 filterBlock:(id)a6;
- (_CDInteractionStore)interactionStore;
- (id)_init;
- (id)filterBlock;
- (id)initForTesting;
- (id)initForTestingWithSize:(unint64_t)a3;
- (id)mostRecentInteractionForCandidateIdentifier:(id)a3;
- (id)mostRecentInteractionForCandidateIdentifier:(id)a3 direction:(int64_t)a4;
- (id)mostRecentInteractionForCandidateIdentifier:(id)a3 direction:(int64_t)a4 mechanism:(int64_t)a5;
- (id)uniqueConversationCandidates;
- (unint64_t)size;
- (void)_cacheInteractions:(id)a3;
- (void)_countConversationIDsForInteraction:(id)a3 deleted:(BOOL)a4;
- (void)_deleteInteractions:(id)a3;
- (void)_forceRefetch;
- (void)_handleInteractionRemoval:(id)a3;
- (void)_invalidate;
- (void)_rebuildMostRecentInteractions;
- (void)_refetch;
- (void)_updateMostRecentInteractionsWithInteraction:(id)a3 deleted:(BOOL)a4;
- (void)debounceRefetch;
- (void)interactionsDeleted:(id)a3;
- (void)interactionsRecorded:(id)a3;
@end

@implementation _CDInteractionCache

- (_CDInteractionCache)initWithInteractionStore:(id)a3 size:(unint64_t)a4 queryPredicate:(id)a5 filterBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = [(_CDInteractionCache *)self _init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 8, a3);
    v15[9] = (id)a4;
    v15[4] = (id)vcvtas_u32_f32((float)a4 * 0.65);
    objc_storeStrong(v15 + 10, a5);
    uint64_t v16 = MEMORY[0x192FB31A0](v13);
    id v17 = v15[11];
    v15[11] = (id)v16;

    *((unsigned char *)v15 + 56) = 1;
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.coreduetd.cdinteractioncache.queue", v18);
    id v20 = v15[1];
    v15[1] = v19;

    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, (dispatch_queue_t)v15[1]);
    id v22 = v15[2];
    v15[2] = v21;

    objc_initWeak(&location, v15);
    dispatch_source_set_timer((dispatch_source_t)v15[2], 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    v23 = v15[2];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __80___CDInteractionCache_initWithInteractionStore_size_queryPredicate_filterBlock___block_invoke;
    v30 = &unk_1E560D358;
    objc_copyWeak(&v31, &location);
    dispatch_source_set_event_handler(v23, &v27);
    dispatch_activate((dispatch_object_t)v15[2]);
    v24 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v27, v28, v29, v30);
    v25 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v24 addObserver:v15 selector:sel_interactionsRecorded_ name:@"_CDInteractionStoreRecordedInteractionsNotification" object:0];
    [v24 addObserver:v15 selector:sel_interactionsDeleted_ name:@"_CDInteractionStoreDeletedInteractionsNotification" object:0];
    [v25 addObserver:v15 selector:sel_debounceRefetch name:@"_CDInteractionStoreDeleteAllInteractionsNotification" object:0];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return (_CDInteractionCache *)v15;
}

- (id)initForTesting
{
  return [(_CDInteractionCache *)self initForTestingWithSize:500];
}

- (id)initForTestingWithSize:(unint64_t)a3
{
  v4 = [(_CDInteractionCache *)self _init];
  v5 = v4;
  if (v4)
  {
    v4[9] = a3;
    v4[4] = 0;
    uint64_t v6 = objc_opt_new();
    v7 = (void *)v5[3];
    v5[3] = v6;

    *((unsigned char *)v5 + 56) = 0;
  }
  return v5;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)_CDInteractionCache;
  v2 = [(_CDInteractionCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mostRecentInteractionsByTaxonomyAndIdentifier = v2->_mostRecentInteractionsByTaxonomyAndIdentifier;
    v2->_mostRecentInteractionsByTaxonomyAndIdentifier = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    conversationCandidates = v2->_conversationCandidates;
    v2->_conversationCandidates = (NSCountedSet *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)uniqueConversationCandidates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_CDInteractionCache *)self _refetch];
  v4 = (void *)[(NSCountedSet *)self->_conversationCandidates copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)containsUniqueCacheCandidate:(id)a3
{
  uint64_t v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(_CDInteractionCache *)v3 _refetch];
  LOBYTE(v3) = [(NSCountedSet *)v3->_conversationCandidates containsObject:v5];

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (void)debounceRefetch
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_CDInteractionCache *)self _invalidate];
  dispatch_suspend((dispatch_object_t)self->_timer);
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_timer);
  os_unfair_lock_unlock(p_lock);
}

- (void)_invalidate
{
  self->_needsRefetch = 1;
  mutableInteractions = self->_mutableInteractions;
  self->_mutableInteractions = 0;

  [(NSMutableDictionary *)self->_mostRecentInteractionsByTaxonomyAndIdentifier removeAllObjects];
  conversationCandidates = self->_conversationCandidates;
  [(NSCountedSet *)conversationCandidates removeAllObjects];
}

- (void)_refetch
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_needsRefetch)
  {
    self->_needsRefetch = 0;
    uint64_t v3 = _os_activity_create(&dword_18ECEB000, "Duet: CDInteractionCache refetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    os_activity_scope_leave(&state);

    [(NSCountedSet *)self->_conversationCandidates removeAllObjects];
    [(NSMutableDictionary *)self->_mostRecentInteractionsByTaxonomyAndIdentifier removeAllObjects];
    dispatch_time_t v4 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_DEFAULT, "CDInteractionCache: Refetching interactions", (uint8_t *)&state, 2u);
    }

    id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    if (_refetch__pasOnceToken6 != -1) {
      dispatch_once(&_refetch__pasOnceToken6, &__block_literal_global_204);
    }
    uint64_t v6 = (id)_refetch__pasExprOnceResult;
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    uint64_t v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31___CDInteractionCache__refetch__block_invoke_206;
    block[3] = &unk_1E560D380;
    p_os_activity_scope_state_s state = &state;
    block[4] = self;
    id v7 = v5;
    id v22 = v7;
    dispatch_sync(v6, block);
    objc_super v8 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(state.opaque[1] + 40) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v9;
      _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "Re-fetched interaction cache with %tu interactions", buf, 0xCu);
    }

    v10 = (NSMutableArray *)[*(id *)(state.opaque[1] + 40) mutableCopy];
    mutableInteractions = self->_mutableInteractions;
    self->_mutableInteractions = v10;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = *(id *)(state.opaque[1] + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          -[_CDInteractionCache _countConversationIDsForInteraction:deleted:](self, "_countConversationIDsForInteraction:deleted:", v16, 0, (void)v17);
          [(_CDInteractionCache *)self _updateMostRecentInteractionsWithInteraction:v16 deleted:0];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }
      while (v13);
    }

    _Block_object_dispose(&state, 8);
  }
}

- (void)_forceRefetch
{
  [(_CDInteractionCache *)self _invalidate];
  [(_CDInteractionCache *)self _refetch];
}

- (void)_countConversationIDsForInteraction:(id)a3 deleted:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 domainIdentifier];
  objc_super v8 = [v6 derivedIntentIdentifier];
  uint64_t v9 = [v6 targetBundleId];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v6 bundleId];
  }
  id v12 = v11;

  uint64_t v13 = [v6 recipients];
  uint64_t v14 = +[_CDInteraction generateConversationIdFromInteractionRecipients:v13];

  if (v12)
  {
    v15 = [[_CDCacheCandidate alloc] initWithDomainId:v7 derivedIntentId:v8 bundleId:v12 recipientsId:v14];
    conversationCandidates = self->_conversationCandidates;
    if (a4) {
      [(NSCountedSet *)conversationCandidates removeObject:v15];
    }
    else {
      [(NSCountedSet *)conversationCandidates addObject:v15];
    }
  }
  else
  {
    long long v17 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[_CDInteractionCache _countConversationIDsForInteraction:deleted:](v17);
    }
  }
}

- (void)_updateMostRecentInteractionsWithInteraction:(id)a3 deleted:(BOOL)a4
{
  id v6 = a3;
  id v7 = +[_CDCandidateInteractionTaxonomy taxonomyOfInteraction:]((uint64_t)_CDCandidateInteractionTaxonomy, v6);
  objc_super v8 = [(NSMutableDictionary *)self->_mostRecentInteractionsByTaxonomyAndIdentifier objectForKeyedSubscript:v7];
  if (v8) {
    goto LABEL_4;
  }
  if (!a4)
  {
    objc_super v8 = objc_opt_new();
    [(NSMutableDictionary *)self->_mostRecentInteractionsByTaxonomyAndIdentifier setObject:v8 forKeyedSubscript:v7];
LABEL_4:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76___CDInteractionCache__updateMostRecentInteractionsWithInteraction_deleted___block_invoke;
    v14[3] = &unk_1E560D3A8;
    id v15 = v8;
    BOOL v17 = a4;
    id v9 = v6;
    id v16 = v9;
    id v10 = v8;
    id v11 = (void (**)(void, void))MEMORY[0x192FB31A0](v14);
    id v12 = [v9 domainIdentifier];
    ((void (**)(void, void *))v11)[2](v11, v12);

    uint64_t v13 = [v9 derivedIntentIdentifier];
    ((void (**)(void, void *))v11)[2](v11, v13);
  }
}

- (id)mostRecentInteractionForCandidateIdentifier:(id)a3 direction:(int64_t)a4 mechanism:(int64_t)a5
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_CDInteractionCache *)self _refetch];
  id v10 = +[_CDCandidateInteractionTaxonomy taxonomyWithDirection:mechanism:]((uint64_t)_CDCandidateInteractionTaxonomy, a4, a5);
  id v11 = [(NSMutableDictionary *)self->_mostRecentInteractionsByTaxonomyAndIdentifier objectForKeyedSubscript:v10];
  id v12 = [v11 objectForKeyedSubscript:v8];
  int v13 = [v12 isUncachedSentinel];

  if (v13) {
    [(_CDInteractionCache *)self _rebuildMostRecentInteractions];
  }
  uint64_t v14 = [(NSMutableDictionary *)self->_mostRecentInteractionsByTaxonomyAndIdentifier objectForKeyedSubscript:v10];
  id v15 = [v14 objectForKeyedSubscript:v8];
  id v16 = [v15 interactionIfCached];

  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (id)mostRecentInteractionForCandidateIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  for (uint64_t i = 0; i != 4; ++i)
  {
    id v7 = (void *)MEMORY[0x192FB2F20]();
    id v8 = [(_CDInteractionCache *)self mostRecentInteractionForCandidateIdentifier:v4 direction:i];
    id v9 = v8;
    if (v5)
    {
      if (_CDStartDateCompare(v5, v8) == -1)
      {
        id v10 = v9;

        id v5 = v10;
      }
    }
    else
    {
      id v5 = v8;
    }
  }

  return v5;
}

- (id)mostRecentInteractionForCandidateIdentifier:(id)a3 direction:(int64_t)a4
{
  id v6 = a3;
  id v7 = 0;
  for (uint64_t i = 0; i != 21; ++i)
  {
    id v9 = (void *)MEMORY[0x192FB2F20]();
    id v10 = [(_CDInteractionCache *)self mostRecentInteractionForCandidateIdentifier:v6 direction:a4 mechanism:i];
    id v11 = v10;
    if (v7)
    {
      if (_CDStartDateCompare(v7, v10) == -1)
      {
        id v12 = v11;

        id v7 = v12;
      }
    }
    else
    {
      id v7 = v10;
    }
  }

  return v7;
}

- (void)_rebuildMostRecentInteractions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_mostRecentInteractionsByTaxonomyAndIdentifier removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_mutableInteractions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x192FB2F20](v4);
        -[_CDInteractionCache _updateMostRecentInteractionsWithInteraction:deleted:](self, "_updateMostRecentInteractionsWithInteraction:deleted:", v8, 0, (void)v10);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

- (void)interactionsRecorded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "CDInteractionCache: New recorded interactions", v8, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_needsRefetch)
  {
    uint64_t v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"_CDInteractionsKey"];

    if ([v7 count]) {
      [(_CDInteractionCache *)self _cacheInteractions:v7];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)interactionsDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "CDInteractionCache: New deleted interactions", v8, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_needsRefetch)
  {
    uint64_t v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"_CDInteractionsKey"];

    if ([v7 count]) {
      [(_CDInteractionCache *)self _deleteInteractions:v7];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_cacheInteractions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  oslog = +[_CDLogging interactionChannel];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v30;
    *(void *)&long long v6 = 138740227;
    long long v26 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        long long v11 = (void *)MEMORY[0x192FB2F20]();
        uint64_t v12 = [(_CDInteractionCache *)self filterBlock];
        if (!v12
          || (long long v13 = (void *)v12,
              [(_CDInteractionCache *)self filterBlock],
              uint64_t v14 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
              int v15 = ((uint64_t (**)(void, void *))v14)[2](v14, v10),
              v14,
              v13,
              v15))
        {
          uint64_t v16 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_mutableInteractions, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, [(NSMutableArray *)self->_mutableInteractions count], 1024, &__block_literal_global);
          if (v16 == [(NSMutableArray *)self->_mutableInteractions count]
            || (-[NSMutableArray objectAtIndexedSubscript:](self->_mutableInteractions, "objectAtIndexedSubscript:", v16), BOOL v17 = objc_claimAutoreleasedReturnValue(), v18 = [v17 isEqual:v10], v17, (v18 & 1) == 0))
          {
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              v34 = v10;
              __int16 v35 = 2048;
              uint64_t v36 = v16;
              _os_log_debug_impl(&dword_18ECEB000, oslog, OS_LOG_TYPE_DEBUG, "Caching interaction %{sensitive}@ to index %tu", buf, 0x16u);
            }
            [(NSMutableArray *)self->_mutableInteractions insertObject:v10 atIndex:v16];
            [(_CDInteractionCache *)self _countConversationIDsForInteraction:v10 deleted:0];
            [(_CDInteractionCache *)self _updateMostRecentInteractionsWithInteraction:v10 deleted:0];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v7);
  }

  unint64_t v19 = [(NSMutableArray *)self->_mutableInteractions count];
  if (v19 > [(_CDInteractionCache *)self size])
  {
    unint64_t v20 = [(_CDInteractionCache *)self size];
    uint64_t v21 = [(NSMutableArray *)self->_mutableInteractions count];
    unint64_t v22 = v21 - [(_CDInteractionCache *)self size];
    if (v22)
    {
      unint64_t v24 = 0;
      *(void *)&long long v23 = 138740227;
      long long v26 = v23;
      do
      {
        uint64_t v25 = -[NSMutableArray objectAtIndexedSubscript:](self->_mutableInteractions, "objectAtIndexedSubscript:", v20 + v24, v26);
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          v34 = v25;
          __int16 v35 = 2048;
          uint64_t v36 = v20 + v24;
          _os_log_debug_impl(&dword_18ECEB000, oslog, OS_LOG_TYPE_DEBUG, "Will truncate interaction %{sensitive}@ at index %tu", buf, 0x16u);
        }
        [(_CDInteractionCache *)self _handleInteractionRemoval:v25];

        ++v24;
      }
      while (v20 <= v24 + v20 && v24 < v22);
    }
    -[NSMutableArray removeObjectsInRange:](self->_mutableInteractions, "removeObjectsInRange:", v20, v22, v26);
  }
}

- (void)_deleteInteractions:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  oslog = +[_CDLogging interactionChannel];
  unint64_t v20 = [(NSMutableArray *)self->_mutableInteractions count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138740227;
    long long v19 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x192FB2F20]();
        uint64_t v13 = [(_CDInteractionCache *)self filterBlock];
        if (!v13
          || (uint64_t v14 = (void *)v13,
              [(_CDInteractionCache *)self filterBlock],
              int v15 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
              int v16 = v15[2](v15, v11),
              v15,
              v14,
              v16))
        {
          uint64_t v17 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_mutableInteractions, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, [(NSMutableArray *)self->_mutableInteractions count], 256, &__block_literal_global);
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v18 = v17;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v19;
              uint64_t v27 = v11;
              __int16 v28 = 2048;
              uint64_t v29 = v18;
              _os_log_debug_impl(&dword_18ECEB000, oslog, OS_LOG_TYPE_DEBUG, "Deleting interaction %{sensitive}@ at index %tu", buf, 0x16u);
            }
            [(NSMutableArray *)self->_mutableInteractions removeObjectAtIndex:v18];
            [(_CDInteractionCache *)self _handleInteractionRemoval:v11];
            if (v20 >= self->_minCacheSize
              && [(NSMutableArray *)self->_mutableInteractions count] < self->_minCacheSize)
            {
              [(_CDInteractionCache *)self _forceRefetch];
              goto LABEL_17;
            }
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (void)_handleInteractionRemoval:(id)a3
{
  id v4 = a3;
  [(_CDInteractionCache *)self _countConversationIDsForInteraction:v4 deleted:1];
  [(_CDInteractionCache *)self _updateMostRecentInteractionsWithInteraction:v4 deleted:1];
}

- (NSArray)interactions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_CDInteractionCache *)self _refetch];
  id v4 = (void *)[(NSMutableArray *)self->_mutableInteractions copy];
  os_unfair_lock_unlock(p_lock);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = v5;

  return v6;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_mostRecentInteractionsByTaxonomyAndIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationCandidates, 0);
  objc_storeStrong((id *)&self->_mutableInteractions, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_countConversationIDsForInteraction:(os_log_t)log deleted:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18ECEB000, log, OS_LOG_TYPE_FAULT, "Tried to add interaction without domainIdentifier, derivedIntentIdentifier, or bundle id", v1, 2u);
}

@end