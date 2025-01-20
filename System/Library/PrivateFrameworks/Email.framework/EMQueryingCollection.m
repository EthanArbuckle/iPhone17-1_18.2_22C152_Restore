@interface EMQueryingCollection
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
- (BOOL)containsItemID:(id)a3;
- (BOOL)containsItemID:(id)a3 includeRecovery:(BOOL)a4;
- (BOOL)isRecovering;
- (BOOL)objectIDBelongsToCollection:(id)a3;
- (BOOL)observerContainsObjectID:(id)a3;
- (EFCancelable)cancelationToken;
- (EFFuture)allItemIDs;
- (EFScheduler)observerScheduler;
- (EFScheduler)queryScheduler;
- (EMQuery)query;
- (EMQueryingCollection)initWithCoder:(id)a3;
- (EMQueryingCollection)initWithObjectID:(id)a3 query:(id)a4;
- (EMQueryingCollection)initWithQuery:(id)a3 repository:(id)a4;
- (NSHashTable)changeObservers;
- (id)_firstExistingItemIDForItemID:(id)a3 inReverse:(BOOL)a4;
- (id)_itemIDsForObjectIDs:(id)a3;
- (id)_iterateItemIDsStartingAtItemID:(id)a3 inReverse:(BOOL)a4 includeStartingItem:(BOOL)a5 withBlock:(id)a6;
- (id)firstExistingItemIDAfterItemID:(id)a3;
- (id)firstExistingItemIDBeforeItemID:(id)a3;
- (id)itemIDForObjectID:(id)a3;
- (id)iterateItemIDsStartingAtItemID:(id)a3 inReverse:(BOOL)a4 withBlock:(id)a5;
- (id)objectIDForItemID:(id)a3;
- (id)removeItemIDs:(id)a3;
- (unint64_t)signpostID;
- (void)_cancelQuery;
- (void)_cancelQueryIfNeeded;
- (void)_commonInitWithQuery:(id)a3;
- (void)_filterAndTransformObjectIDs:(id)a3 before:(BOOL)a4 existingObjectID:(id)a5 batchBlock:(id)a6;
- (void)_notifyNewChangeObserverAboutExistingState:(id)a3;
- (void)_performQuery;
- (void)_performQueryIfNeeded;
- (void)beginObserving:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)finishRecovery;
- (void)insertItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)insertItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)notifyChangeObserver:(id)a3 stockedItemIDs:(id)a4;
- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4;
- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)notifyNewChangeObserverAboutExistingState:(id)a3;
- (void)queryAnticipatesDeletedObjectIDs:(id)a3;
- (void)queryDidFinishInitialLoad;
- (void)queryDidFinishRemoteSearch;
- (void)queryDidStartRecovery;
- (void)queryMatchedAddedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)queryMatchedAddedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)queryMatchedChangedObjectIDs:(id)a3 extraInfo:(id)a4;
- (void)queryMatchedDeletedObjectIDs:(id)a3;
- (void)queryMatchedMovedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5;
- (void)queryMatchedMovedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5;
- (void)queryReplacedObjectID:(id)a3 withNewObjectID:(id)a4;
- (void)refresh;
- (void)setCancelationToken:(id)a3;
- (void)setChangeObservers:(id)a3;
- (void)stopObserving:(id)a3;
@end

@implementation EMQueryingCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_allItemIDsPromise, 0);
  objc_storeStrong((id *)&self->_recoveringItemIDs, 0);
  objc_storeStrong((id *)&self->_itemIDsAnticipatingDelete, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

void __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) itemIDForObjectID:v3];
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:v4])
  {
    v5 = +[EMQueryingCollection log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 134218498;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      v11 = v4;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Found duplicate: %{public}@\n%{public}@", (uint8_t *)&v8, 0x20u);
    }

    if ([*(id *)(a1 + 40) count]) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 64)) {
      [v7 insertObject:v4 atIndex:0];
    }
    else {
      [v7 addObject:v4];
    }
  }
}

- (EMQuery)query
{
  return self->_query;
}

- (id)itemIDForObjectID:(id)a3
{
  id v3 = a3;
  return v3;
}

- (EMQueryingCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMQueryingCollection;
  v5 = [(EMObject *)&v8 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_query"];
    [(EMQueryingCollection *)v5 _commonInitWithQuery:v6];
  }
  return v5;
}

- (EMQueryingCollection)initWithObjectID:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EMQueryingCollection;
  objc_super v8 = [(EMObject *)&v11 initWithObjectID:v6];
  uint64_t v9 = v8;
  if (v8) {
    [(EMQueryingCollection *)v8 _commonInitWithQuery:v7];
  }

  return v9;
}

- (void)_commonInitWithQuery:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_query, a3);
  self->_itemIDsLock._os_unfair_lock_opaque = 0;
  v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  itemIDs = self->_itemIDs;
  self->_itemIDs = v5;

  id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  itemIDsAnticipatingDelete = self->_itemIDsAnticipatingDelete;
  self->_itemIDsAnticipatingDelete = v7;

  uint64_t v9 = [MEMORY[0x1E4F60F28] immediateScheduler];
  observerScheduler = self->_observerScheduler;
  self->_observerScheduler = v9;

  objc_super v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  changeObservers = self->_changeObservers;
  self->_changeObservers = v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EMQueryingCollection;
  [(EMObject *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_query forKey:@"EFPropertyKey_query"];
}

- (BOOL)containsItemID:(id)a3 includeRecovery:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_itemIDsLock);
  int v7 = [(NSMutableOrderedSet *)self->_itemIDs containsObject:v6];
  if (((v7 | !v4) & 1) == 0) {
    LOBYTE(v7) = [(NSOrderedSet *)self->_recoveringItemIDs containsObject:v6];
  }
  os_unfair_lock_unlock(&self->_itemIDsLock);

  return v7;
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_4(uint64_t a1)
{
  v2 = +[EMQueryingCollection signpostLog];
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_5;
  v5[3] = &unk_1E63E4890;
  v5[4] = v3;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateObserversWithBlock:v5];
}

void __44__EMQueryingCollection__cancelQueryIfNeeded__block_invoke(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 64);
  os_unfair_lock_lock(v2);
  id v3 = [*(id *)(a1 + 32) changeObservers];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [*(id *)(a1 + 32) _cancelQuery];
  }
  os_unfair_lock_unlock(v2);
}

void __39__EMQueryingCollection_beginObserving___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) changeObservers];
  uint64_t v4 = *v2 + 16;
  os_unfair_lock_lock(v4);
  objc_super v5 = [v3 anyObject];

  if (v5)
  {
    id v6 = +[EMQueryingCollection log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Observer already started: %{public}@ to: %{public}@", buf, 0x20u);
    }

    os_unfair_lock_unlock(v4);
    uint64_t v9 = [*(id *)(a1 + 32) observerScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__EMQueryingCollection_beginObserving___block_invoke_21;
    v10[3] = &unk_1E63E2848;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    id v12 = *(id *)(a1 + 40);
    [v9 performSyncBlock:v10];
  }
  else
  {
    [*(id *)(a1 + 32) _cancelQuery];
    [v3 addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _performQuery];
    os_unfair_lock_unlock(v4);
  }
}

- (void)enumerateObserversWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  p_changeObserversLock = &self->_changeObserversLock;
  os_unfair_lock_lock(&self->_changeObserversLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [(EMQueryingCollection *)self changeObservers];
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
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_changeObserversLock);
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 collectionDidFinishInitialLoad:*(void *)(a1 + 32)];
  }
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(*(os_log_t *)(a1 + 40), v3);
  objc_super v5 = *(id *)(a1 + 40);
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_END, v4, "EMCollectionTotal", " enableTelemetry=YES ", v7, 2u);
  }
}

- (void)beginObserving:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v4;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer added: %{public}@", buf, 0x16u);
  }

  id v6 = +[EMQueryingCollection signpostLog];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v4);
  uint64_t v8 = [(EMQueryingCollection *)self query];
  uint64_t v9 = v6;
  long long v10 = v9;
  if (v7 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v18 = v10;
  }
  else
  {
    if (os_signpost_enabled(v9))
    {
      NSStringFromClass((Class)[v8 targetClass]);
      long long v11 = (EMQueryingCollection *)(id)objc_claimAutoreleasedReturnValue();
      long long v12 = [v8 label];
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      __int16 v25 = 2114;
      id v26 = v12;
      __int16 v27 = 2114;
      uint64_t v28 = v13;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMCollectionTotal", "resultClass=%{signpost.description:attribute,public}@ label=%{signpost.description:attribute,public}@ observer=%{signpost.description:attribute,public}@ enableTelemetry=YES ", buf, 0x20u);
    }
    uint64_t v14 = v10;
    if (os_signpost_enabled(v14))
    {
      NSStringFromClass((Class)[v8 targetClass]);
      uint64_t v15 = (EMQueryingCollection *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v8 label];
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      __int16 v25 = 2114;
      id v26 = v16;
      __int16 v27 = 2114;
      uint64_t v28 = v17;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMCollectionFirstBatch", "resultClass=%{signpost.description:attribute,public}@ label=%{signpost.description:attribute,public}@ observer=%{signpost.description:attribute,public}@ enableTelemetry=YES ", buf, 0x20u);
    }
  }

  uint64_t v19 = [(EMQueryingCollection *)self queryScheduler];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __39__EMQueryingCollection_beginObserving___block_invoke;
  v21[3] = &unk_1E63E2760;
  v21[4] = self;
  id v20 = v4;
  id v22 = v20;
  [v19 performBlock:v21];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EMQueryingCollection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_34 != -1) {
    dispatch_once(&log_onceToken_34, block);
  }
  v2 = (void *)log_log_34;
  return (OS_os_log *)v2;
}

void __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EMQueryingCollection signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, v2);
  objc_super v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)os_signpost_id_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_END, v4, "EMCollectionFirstBatch", " enableTelemetry=YES ", v7, 2u);
  }
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EMQueryingCollection_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_3 != -1) {
    dispatch_once(&signpostLog_onceToken_3, block);
  }
  id v2 = (void *)signpostLog_log_3;
  return (OS_os_log *)v2;
}

- (EFScheduler)queryScheduler
{
  if (defaultCollectionScheduler_onceToken != -1) {
    dispatch_once(&defaultCollectionScheduler_onceToken, &__block_literal_global_207);
  }
  id v2 = (void *)defaultCollectionScheduler_scheduler;
  return (EFScheduler *)v2;
}

- (void)_performQuery
{
  id v5 = [(EMRepositoryObject *)self repository];
  id v3 = [(EMQueryingCollection *)self query];
  os_signpost_id_t v4 = [v5 performQuery:v3 withObserver:self];
  [(EMQueryingCollection *)self setCancelationToken:v4];
}

- (void)_cancelQuery
{
  id v3 = [(EMQueryingCollection *)self cancelationToken];
  [v3 cancel];

  [(EMQueryingCollection *)self setCancelationToken:0];
  os_unfair_lock_lock(&self->_itemIDsLock);
  [(NSMutableOrderedSet *)self->_itemIDs removeAllObjects];
  self->_foundAllItemIDs = 0;
  self->_foundFirstBatch = 0;
  recoveringItemIDs = self->_recoveringItemIDs;
  self->_recoveringItemIDs = 0;

  os_unfair_lock_unlock(&self->_itemIDsLock);
}

- (void)dealloc
{
  id v3 = [(EMQueryingCollection *)self cancelationToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)EMQueryingCollection;
  [(EMQueryingCollection *)&v4 dealloc];
}

- (EFCancelable)cancelationToken
{
  return self->_cancelationToken;
}

- (void)setCancelationToken:(id)a3
{
}

- (void)queryDidFinishInitialLoad
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v53 = self;
    __int16 v54 = 2114;
    v55 = self;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "<%p> Finished initial load\n%{public}@", buf, 0x16u);
  }

  if ([(EMQueryingCollection *)self isRecovering]) {
    [(EMQueryingCollection *)self finishRecovery];
  }
  os_unfair_lock_lock(&self->_itemIDsLock);
  recoveringItemIDs = self->_recoveringItemIDs;
  if (!recoveringItemIDs)
  {
    uint64_t v14 = 0;
    id v38 = 0;
    goto LABEL_24;
  }
  objc_super v4 = -[NSMutableOrderedSet differenceFromOrderedSet:](self->_itemIDs, "differenceFromOrderedSet:");
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v37 = v4;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke;
  v50[3] = &unk_1E63E5D20;
  v50[4] = self;
  id v38 = v5;
  id v51 = v38;
  id v6 = (void (**)(void, void, void))MEMORY[0x1C18A2160](v50);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  os_signpost_id_t v7 = [v4 insertions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v64 count:16];
  uint64_t v9 = 0;
  if (!v8)
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_21;
  }
  uint64_t v10 = *(void *)v47;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v47 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [*(id *)(*((void *)&v46 + 1) + 8 * i) index];
LABEL_14:
        ++v9;
        continue;
      }
      if ([*(id *)(*((void *)&v46 + 1) + 8 * i) index] == v11 + v9) {
        goto LABEL_14;
      }
      v6[2](v6, v11, v9);
      uint64_t v11 = [v13 index];
      uint64_t v9 = 1;
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v64 count:16];
  }
  while (v8);
LABEL_21:

  v6[2](v6, v11, v9);
  uint64_t v15 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v16 = [(NSOrderedSet *)self->_recoveringItemIDs count];
    uint64_t v17 = [(NSMutableOrderedSet *)self->_itemIDs count];
    v18 = [v37 removals];
    uint64_t v19 = [v18 count];
    uint64_t v20 = [v38 count];
    *(_DWORD *)buf = 134219266;
    v53 = self;
    __int16 v54 = 2048;
    v55 = (EMQueryingCollection *)v16;
    __int16 v56 = 2048;
    uint64_t v57 = v17;
    __int16 v58 = 2048;
    uint64_t v59 = v19;
    __int16 v60 = 2048;
    uint64_t v61 = v20;
    __int16 v62 = 2114;
    v63 = self;
    _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "<%p> Finishing recovery, number of items went from %lu to %lu (%lu removals, %lu grouped insertions)\n%{public}@", buf, 0x3Eu);
  }
  v21 = self->_recoveringItemIDs;
  self->_recoveringItemIDs = 0;

  uint64_t v14 = v37;
LABEL_24:
  uint64_t v22 = [(NSMutableOrderedSet *)self->_itemIDs count];
  self->_foundAllItemIDs = 1;
  self->_foundFirstBatch = 1;
  v23 = self->_allItemIDsPromise;
  allItemIDsPromise = self->_allItemIDsPromise;
  self->_allItemIDsPromise = 0;

  if (v23)
  {
    uint64_t v25 = [(NSMutableSet *)self->_itemIDsAnticipatingDelete count];
    itemIDs = self->_itemIDs;
    if (v25)
    {
      __int16 v27 = (void *)[(NSMutableOrderedSet *)itemIDs mutableCopy];
      [v27 minusSet:self->_itemIDsAnticipatingDelete];
      uint64_t v28 = [v27 array];
    }
    else
    {
      __int16 v27 = [(NSMutableOrderedSet *)itemIDs array];
      uint64_t v28 = [v27 copy];
    }
    uint64_t v29 = (void *)v28;
  }
  else
  {
    uint64_t v29 = 0;
  }
  os_unfair_lock_unlock(&self->_itemIDsLock);
  v30 = [v14 removals];
  if ([v30 count])
  {

    goto LABEL_33;
  }
  BOOL v31 = [v38 count] == 0;

  if (v31)
  {
    if (!v22)
    {
      v35 = [(EMQueryingCollection *)self observerScheduler];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_30;
      v41[3] = &unk_1E63E26B0;
      v41[4] = self;
      [v35 performSyncBlock:v41];
    }
  }
  else
  {
LABEL_33:
    v32 = [(EMQueryingCollection *)self observerScheduler];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_27;
    v42[3] = &unk_1E63E2848;
    id v43 = v14;
    v44 = self;
    id v45 = v38;
    [v32 performSyncBlock:v42];
  }
  if (recoveringItemIDs)
  {
    v33 = [(EMQueryingCollection *)self observerScheduler];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2_31;
    v40[3] = &unk_1E63E26B0;
    v40[4] = self;
    [v33 performSyncBlock:v40];
  }
  v34 = [(EMQueryingCollection *)self observerScheduler];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_4;
  v39[3] = &unk_1E63E26B0;
  v39[4] = self;
  [v34 performSyncBlock:v39];

  [(EMQueryingCollection *)self _cancelQueryIfNeeded];
  [(EFPromise *)v23 finishWithResult:v29];
}

- (void)queryMatchedAddedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v18 = self;
    __int16 v19 = 2048;
    uint64_t v20 = [v8 count];
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Added %lu objectIDs before %{public}@\n%{public}@", buf, 0x2Au);
  }

  BOOL v12 = [(EMQueryingCollection *)self isRecovering];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke;
  v14[3] = &unk_1E63E5CD0;
  v14[4] = self;
  id v13 = v10;
  id v15 = v13;
  BOOL v16 = v12;
  [(EMQueryingCollection *)self _filterAndTransformObjectIDs:v8 before:1 existingObjectID:v9 batchBlock:v14];
}

- (BOOL)isRecovering
{
  id v2 = self;
  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  LOBYTE(v2) = v2->_recoveringItemIDs != 0;
  os_unfair_lock_unlock(p_itemIDsLock);
  return (char)v2;
}

- (void)_filterAndTransformObjectIDs:(id)a3 before:(BOOL)a4 existingObjectID:(id)a5 batchBlock:(id)a6
{
  BOOL v8 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *, void *))a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__11;
  v43[4] = __Block_byref_object_dispose__11;
  id v44 = (id)0xAAAAAAAAAAAAAAAALL;
  -[EMQueryingCollection itemIDForObjectID:](self, "itemIDForObjectID:", v10, v12);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke;
  v38[3] = &unk_1E63E5D70;
  id v15 = v14;
  id v39 = v15;
  v41 = v43;
  BOOL v42 = v8;
  id v16 = v12;
  id v40 = v16;
  uint64_t v17 = (void *)MEMORY[0x1C18A2160](v38);
  if (v8) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 0;
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke_2;
  v33[3] = &unk_1E63E5D98;
  v33[4] = self;
  id v19 = v15;
  id v34 = v19;
  uint64_t v20 = v17;
  id v35 = v20;
  v36 = v43;
  BOOL v37 = v8;
  [v28 enumerateObjectsWithOptions:v18 usingBlock:v33];
  if ([v19 count]) {
    v20[2](v20);
  }

  _Block_object_dispose(v43, 8);
  os_unfair_lock_unlock(p_itemIDsLock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v16;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v26 = [v25 first];
        __int16 v27 = [v25 second];
        v11[2](v11, v26, v27);
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v22);
  }
}

void __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F60DF0];
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  id v5 = [v2 pairWithFirst:v3 second:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  objc_super v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 56)) {
    [v4 insertObject:v5 atIndex:0];
  }
  else {
    [v4 addObject:v5];
  }
  [*(id *)(a1 + 32) removeAllObjects];
}

void __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) insertItemIDs:v5 before:v6 extraInfo:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 48))
  {
    os_signpost_id_t v7 = [*(id *)(a1 + 32) observerScheduler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke_2;
    v8[3] = &unk_1E63E4008;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    [v7 performSyncBlock:v8];
  }
}

uint64_t __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 61) = 1;
  [*(id *)(a1 + 32) notifyChangeObserversAboutAddedItemIDs:*(void *)(a1 + 40) before:*(void *)(a1 + 48) extraInfo:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 32);
  return [v2 enumerateObserversWithBlock:&__block_literal_global_42];
}

- (void)_cancelQueryIfNeeded
{
  id v3 = [(EMQueryingCollection *)self queryScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__EMQueryingCollection__cancelQueryIfNeeded__block_invoke;
  v4[3] = &unk_1E63E26B0;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (id)firstExistingItemIDAfterItemID:(id)a3
{
  id v3 = [(EMQueryingCollection *)self _firstExistingItemIDForItemID:a3 inReverse:0];
  return v3;
}

- (id)_firstExistingItemIDForItemID:(id)a3 inReverse:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__EMQueryingCollection__firstExistingItemIDForItemID_inReverse___block_invoke;
  v6[3] = &unk_1E63E4840;
  v6[4] = self;
  objc_super v4 = [(EMQueryingCollection *)self _iterateItemIDsStartingAtItemID:a3 inReverse:a4 includeStartingItem:1 withBlock:v6];
  return v4;
}

- (id)_iterateItemIDsStartingAtItemID:(id)a3 inReverse:(BOOL)a4 includeStartingItem:(BOOL)a5 withBlock:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (uint64_t (**)(id, id))a6;
  id v12 = v10;
  os_unfair_lock_lock(&self->_itemIDsLock);
  if (v7) {
    char v13 = v11[2](v11, v12);
  }
  else {
    char v13 = 1;
  }
  id v14 = v12;
  while ((v13 & 1) != 0)
  {
    itemIDs = self->_itemIDs;
    if (v8) {
      [(NSMutableOrderedSet *)itemIDs ef_objectBeforeObject:v14];
    }
    else {
    uint64_t v16 = [(NSMutableOrderedSet *)itemIDs ef_objectAfterObject:v14];
    }

    if (!v16)
    {
      id v14 = 0;
      break;
    }
    id v14 = (void *)v16;
    char v13 = v11[2](v11, (id)v16);
  }
  os_unfair_lock_unlock(&self->_itemIDsLock);

  return v14;
}

uint64_t __64__EMQueryingCollection__firstExistingItemIDForItemID_inReverse___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) containsObject:a2];
}

- (void)insertItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_itemIDsLock);
  [(NSMutableOrderedSet *)self->_itemIDs removeObjectsInArray:v8];
  [(NSMutableOrderedSet *)self->_itemIDs ef_insertObjects:v8 before:v7];
  os_unfair_lock_unlock(&self->_itemIDsLock);
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

uint64_t __80__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke(void *a1, void *a2)
{
  return [a2 collection:a1[4] addedItemIDs:a1[5] before:a1[6]];
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(EMQueryingCollection *)self firstExistingItemIDAfterItemID:v8];
  id v10 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = [v7 count];
    __int16 v18 = 2114;
    id v19 = v9;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "Notifying observer %lu itemIDs were added before undeletedItemID %{public}@ (derived from existingItemID: %{public}@)", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke;
  v13[3] = &unk_1E63E4A70;
  v13[4] = self;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v13];
}

- (EMQueryingCollection)initWithQuery:(id)a3 repository:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EMQueryingCollection *)self initWithObjectID:0 query:v6];
  [(EMRepositoryObject *)v8 setRepository:v7];

  return v8;
}

void __35__EMQueryingCollection_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)signpostLog_log_3;
  signpostLog_log_3 = (uint64_t)v1;
}

void __27__EMQueryingCollection_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_34;
  log_log_34 = (uint64_t)v1;
}

void __39__EMQueryingCollection_beginObserving___block_invoke_21(uint64_t a1)
{
  id v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 64);
  os_unfair_lock_lock(v2);
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _notifyNewChangeObserverAboutExistingState:*(void *)(a1 + 48)];
  os_unfair_lock_unlock(v2);
}

- (void)_notifyNewChangeObserverAboutExistingState:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EMQueryingCollection signpostLog];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
  if (self->_foundFirstBatch && ![(EMQueryingCollection *)self isRecovering])
  {
    id v7 = +[EMQueryingCollection log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NSMutableOrderedSet *)self->_itemIDs count];
      int v14 = 134218498;
      id v15 = self;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      id v19 = self;
      _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Added stocked %lu objectIDs\n%{public}@", (uint8_t *)&v14, 0x20u);
    }

    id v9 = [(NSMutableOrderedSet *)self->_itemIDs array];
    [(EMQueryingCollection *)self notifyChangeObserver:v4 stockedItemIDs:v9];

    id v10 = v5;
    id v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v11, OS_SIGNPOST_INTERVAL_END, v6, "EMCollectionFirstBatch", " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
    }
  }
  if (self->_foundAllItemIDs && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 collectionDidFinishInitialLoad:self];
    id v12 = v5;
    char v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "EMCollectionTotal", " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
    }
  }
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)objectIDForItemID:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)objectIDBelongsToCollection:(id)a3
{
  return a3 != 0;
}

- (void)insertItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_itemIDsLock);
  [(NSMutableOrderedSet *)self->_itemIDs removeObjectsInArray:v8];
  [(NSMutableOrderedSet *)self->_itemIDs ef_insertObjects:v8 after:v7];
  os_unfair_lock_unlock(&self->_itemIDsLock);
}

- (id)removeItemIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock(&self->_itemIDsLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_itemIDsAnticipatingDelete containsObject:v10]) {
          [(NSMutableSet *)self->_itemIDsAnticipatingDelete removeObject:v10];
        }
        else {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(NSMutableOrderedSet *)self->_itemIDs removeObjectsInArray:v6];
  os_unfair_lock_unlock(&self->_itemIDsLock);

  return v5;
}

- (BOOL)containsItemID:(id)a3
{
  return [(EMQueryingCollection *)self containsItemID:a3 includeRecovery:0];
}

- (id)firstExistingItemIDBeforeItemID:(id)a3
{
  id v3 = [(EMQueryingCollection *)self _firstExistingItemIDForItemID:a3 inReverse:1];
  return v3;
}

- (id)iterateItemIDsStartingAtItemID:(id)a3 inReverse:(BOOL)a4 withBlock:(id)a5
{
  id v5 = [(EMQueryingCollection *)self _iterateItemIDsStartingAtItemID:a3 inReverse:a4 includeStartingItem:0 withBlock:a5];
  return v5;
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(EMQueryingCollection *)self firstExistingItemIDBeforeItemID:v8];
  uint64_t v10 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = [v7 count];
    __int16 v18 = 2114;
    id v19 = v9;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "Notifying observer %lu itemIDs were added after undeletedItemID %{public}@ (derived from existingItemID: %{public}@)", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke;
  v13[3] = &unk_1E63E4A70;
  v13[4] = self;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v13];
}

uint64_t __79__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke(void *a1, void *a2)
{
  return [a2 collection:a1[4] addedItemIDs:a1[5] after:a1[6]];
}

- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__EMQueryingCollection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke;
  v7[3] = &unk_1E63E4890;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v7];
}

uint64_t __75__EMQueryingCollection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 collection:*(void *)(a1 + 32) changedItemIDs:*(void *)(a1 + 40)];
}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(EMQueryingCollection *)self firstExistingItemIDAfterItemID:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke;
  v12[3] = &unk_1E63E4A70;
  v12[4] = self;
  id v10 = v7;
  id v13 = v10;
  id v14 = v9;
  id v11 = v9;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v12];
}

uint64_t __80__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke(void *a1, void *a2)
{
  return [a2 collection:a1[4] movedItemIDs:a1[5] before:a1[6]];
}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(EMQueryingCollection *)self firstExistingItemIDBeforeItemID:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke;
  v12[3] = &unk_1E63E4A70;
  v12[4] = self;
  id v10 = v7;
  id v13 = v10;
  id v14 = v9;
  id v11 = v9;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v12];
}

uint64_t __79__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke(void *a1, void *a2)
{
  return [a2 collection:a1[4] movedItemIDs:a1[5] after:a1[6]];
}

- (void)notifyChangeObserver:(id)a3 stockedItemIDs:(id)a4
{
}

- (EFFuture)allItemIDs
{
  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  if (self->_foundAllItemIDs)
  {
    uint64_t v4 = [(NSMutableSet *)self->_itemIDsAnticipatingDelete count];
    itemIDs = self->_itemIDs;
    if (v4)
    {
      id v6 = (void *)[(NSMutableOrderedSet *)itemIDs mutableCopy];
      [v6 minusSet:self->_itemIDsAnticipatingDelete];
      uint64_t v7 = [v6 array];
    }
    else
    {
      id v6 = [(NSMutableOrderedSet *)itemIDs array];
      uint64_t v7 = [v6 copy];
    }
    id v12 = (void *)v7;

    os_unfair_lock_unlock(p_itemIDsLock);
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F60D70] futureWithResult:v12];

      id v11 = (void *)v13;
      goto LABEL_12;
    }
    id v11 = 0;
  }
  else
  {
    allItemIDsPromise = self->_allItemIDsPromise;
    if (!allItemIDsPromise)
    {
      id v9 = [MEMORY[0x1E4F60E18] promise];
      id v10 = self->_allItemIDsPromise;
      self->_allItemIDsPromise = v9;

      allItemIDsPromise = self->_allItemIDsPromise;
    }
    id v11 = [(EFPromise *)allItemIDsPromise future];
    os_unfair_lock_unlock(p_itemIDsLock);
  }
  [(EMQueryingCollection *)self _performQueryIfNeeded];
LABEL_12:
  return (EFFuture *)v11;
}

- (void)stopObserving:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer removed: %{public}@", buf, 0x16u);
  }

  id v6 = [(EMQueryingCollection *)self queryScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__EMQueryingCollection_stopObserving___block_invoke;
  v7[3] = &unk_1E63E5C88;
  v7[4] = self;
  void v7[5] = v4;
  [v6 performBlock:v7];
}

void __38__EMQueryingCollection_stopObserving___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (os_unfair_lock_s **)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) changeObservers];
  id v4 = *v2 + 16;
  os_unfair_lock_lock(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6)
  {

    os_unfair_lock_unlock(v4);
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "_cancelQuery", (void)v12);
    goto LABEL_14;
  }
  char v7 = 0;
  uint64_t v8 = *(void *)v13;
  int v9 = 1;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      BOOL v11 = *(void *)(*((void *)&v12 + 1) + 8 * i) == *(void *)(a1 + 40);
      v9 &= v11;
      v7 |= v11;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);

  if (v7) {
    objc_msgSend(v5, "removeObject:", *(void *)(a1 + 40), (void)v12);
  }
  os_unfair_lock_unlock(v4);
  if (v9) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)refresh
{
  id v3 = [(EMQueryingCollection *)self queryScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__EMQueryingCollection_refresh__block_invoke;
  v4[3] = &unk_1E63E26B0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __31__EMQueryingCollection_refresh__block_invoke(uint64_t a1)
{
  id v2 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "Pulling to refresh", buf, 2u);
  }

  if ([*(id *)(a1 + 32) isRecovering])
  {
    id v3 = +[EMQueryingCollection log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "Do not trigger recovery for pulling to refresh since recovery is in progress", v5, 2u);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) cancelationToken];

    if (!v4) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) repository];
    [v3 refreshQueryWithObserver:*(void *)(a1 + 32)];
  }
}

- (void)_performQueryIfNeeded
{
  id v3 = [(EMQueryingCollection *)self queryScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__EMQueryingCollection__performQueryIfNeeded__block_invoke;
  v4[3] = &unk_1E63E26B0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __45__EMQueryingCollection__performQueryIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cancelationToken];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 _performQuery];
  }
}

- (void)finishRecovery
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134218242;
    id v5 = self;
    __int16 v6 = 2114;
    char v7 = self;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "<%p> Finish Recovery\n%{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)queryDidStartRecovery
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  if (self->_recoveringItemIDs)
  {
    int v4 = +[EMQueryingCollection log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      __int16 v10 = self;
      __int16 v11 = 2114;
      long long v12 = self;
      _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Restarting recovery\n%{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v5 = +[EMQueryingCollection log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(NSMutableOrderedSet *)self->_itemIDs count];
      int v9 = 134218498;
      __int16 v10 = self;
      __int16 v11 = 2048;
      long long v12 = (EMQueryingCollection *)v6;
      __int16 v13 = 2114;
      long long v14 = self;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Starting recovery (%lu existing items)\n%{public}@", (uint8_t *)&v9, 0x20u);
    }

    char v7 = (NSOrderedSet *)[(NSMutableOrderedSet *)self->_itemIDs copy];
    recoveringItemIDs = self->_recoveringItemIDs;
    self->_recoveringItemIDs = v7;
  }
  [(NSMutableOrderedSet *)self->_itemIDs removeAllObjects];
  self->_foundAllItemIDs = 0;
  self->_foundFirstBatch = 0;
  os_unfair_lock_unlock(p_itemIDsLock);
}

- (void)queryMatchedAddedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    __int16 v18 = self;
    __int16 v19 = 2048;
    uint64_t v20 = [v8 count];
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Added %lu objectIDs after %{public}@\n%{public}@", buf, 0x2Au);
  }

  BOOL v12 = [(EMQueryingCollection *)self isRecovering];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke;
  v14[3] = &unk_1E63E5CD0;
  v14[4] = self;
  id v13 = v10;
  id v15 = v13;
  BOOL v16 = v12;
  [(EMQueryingCollection *)self _filterAndTransformObjectIDs:v8 before:0 existingObjectID:v9 batchBlock:v14];
}

void __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) insertItemIDs:v5 after:v6 extraInfo:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 48))
  {
    char v7 = [*(id *)(a1 + 32) observerScheduler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke_2;
    v8[3] = &unk_1E63E4008;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    [v7 performSyncBlock:v8];
  }
}

uint64_t __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyChangeObserversAboutAddedItemIDs:*(void *)(a1 + 40) after:*(void *)(a1 + 48) extraInfo:*(void *)(a1 + 56)];
}

- (void)queryMatchedMovedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    uint64_t v22 = [v8 count];
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = self;
    _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Moved %lu objectIDs before %{public}@\n%{public}@", buf, 0x2Au);
  }

  BOOL v12 = [(EMQueryingCollection *)self _itemIDsForObjectIDs:v8];
  id v13 = [(EMQueryingCollection *)self itemIDForObjectID:v9];
  [(EMQueryingCollection *)self insertItemIDs:v12 before:v13 extraInfo:v10];
  if (![(EMQueryingCollection *)self isRecovering])
  {
    long long v14 = [(EMQueryingCollection *)self observerScheduler];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__EMQueryingCollection_queryMatchedMovedObjectIDs_before_extraInfo___block_invoke;
    v15[3] = &unk_1E63E4008;
    v15[4] = self;
    id v16 = v12;
    id v17 = v13;
    id v18 = v10;
    [v14 performSyncBlock:v15];
  }
}

uint64_t __68__EMQueryingCollection_queryMatchedMovedObjectIDs_before_extraInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyChangeObserversAboutMovedItemIDs:*(void *)(a1 + 40) before:*(void *)(a1 + 48) extraInfo:*(void *)(a1 + 56)];
}

- (void)queryMatchedMovedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  id v11 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v8 count];
    *(_WORD *)&buf[22] = 2114;
    __int16 v19 = v9;
    LOWORD(v20) = 2114;
    *(void *)((char *)&v20 + 2) = self;
    _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Moved %lu objectIDs after %{public}@\n%{public}@", buf, 0x2Au);
  }

  BOOL v12 = [(EMQueryingCollection *)self _itemIDsForObjectIDs:v8];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__11;
  *(void *)&long long v20 = __Block_byref_object_dispose__11;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = [(EMQueryingCollection *)self itemIDForObjectID:v9];
  [(EMQueryingCollection *)self insertItemIDs:v12 after:*(void *)(*(void *)&buf[8] + 40) extraInfo:v10];
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v13 = [(EMQueryingCollection *)self observerScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__EMQueryingCollection_queryMatchedMovedObjectIDs_after_extraInfo___block_invoke;
    v14[3] = &unk_1E63E5CF8;
    v14[4] = self;
    id v15 = v12;
    id v17 = buf;
    id v16 = v10;
    [v13 performSyncBlock:v14];
  }
  _Block_object_dispose(buf, 8);
}

uint64_t __67__EMQueryingCollection_queryMatchedMovedObjectIDs_after_extraInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyChangeObserversAboutMovedItemIDs:*(void *)(a1 + 40) after:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) extraInfo:*(void *)(a1 + 48)];
}

- (void)queryMatchedChangedObjectIDs:(id)a3 extraInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = (EMQueryingCollection *)a3;
  id v7 = a4;
  id v8 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = self;
    __int16 v22 = 2048;
    uint64_t v23 = [(EMQueryingCollection *)v6 count];
    __int16 v24 = 2114;
    __int16 v25 = v6;
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Changed %lu objectIDs: %{public}@", buf, 0x20u);
  }

  id v9 = [(EMQueryingCollection *)self _itemIDsForObjectIDs:v6];
  os_unfair_lock_lock(&self->_itemIDsLock);
  recoveringItemIDs = self->_recoveringItemIDs;
  if (recoveringItemIDs)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke;
    v19[3] = &unk_1E63E4840;
    v19[4] = self;
    uint64_t v11 = objc_msgSend(v9, "ef_filter:", v19);

    id v9 = (void *)v11;
  }
  os_unfair_lock_unlock(&self->_itemIDsLock);
  uint64_t v12 = [v9 count];
  if (v12 != [(EMQueryingCollection *)v6 count])
  {
    if (recoveringItemIDs)
    {
      id v13 = +[EMQueryingCollection log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v9 count];
        *(_DWORD *)buf = 134218498;
        uint64_t v21 = self;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2114;
        __int16 v25 = self;
        _os_log_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEFAULT, "<%p> %lu changed itemIDs while recovering\n%{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v13 = +[EMQueryingCollection log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[EMQueryingCollection queryMatchedChangedObjectIDs:extraInfo:]((uint64_t)self, buf, [v9 count], v13);
      }
    }
  }
  if ([v9 count])
  {
    id v15 = [(EMQueryingCollection *)self observerScheduler];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke_24;
    v16[3] = &unk_1E63E2848;
    v16[4] = self;
    id v17 = v9;
    id v18 = v7;
    [v15 performSyncBlock:v16];
  }
}

uint64_t __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) containsObject:a2];
}

uint64_t __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyChangeObserversAboutChangedItemIDs:*(void *)(a1 + 40) extraInfo:*(void *)(a1 + 48)];
}

- (void)queryAnticipatesDeletedObjectIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 count];
    __int16 v14 = 2114;
    id v15 = self;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Anticipating delete of %lu objectIDs\n%{public}@", buf, 0x20u);
  }

  id v6 = [(EMQueryingCollection *)self _itemIDsForObjectIDs:v4];
  os_unfair_lock_lock(&self->_itemIDsLock);
  [(NSMutableSet *)self->_itemIDsAnticipatingDelete addObjectsFromArray:v6];
  os_unfair_lock_unlock(&self->_itemIDsLock);
  if (![(EMQueryingCollection *)self isRecovering])
  {
    id v7 = [(EMQueryingCollection *)self observerScheduler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke;
    v8[3] = &unk_1E63E2760;
    v8[4] = self;
    id v9 = v6;
    [v7 performSyncBlock:v8];
  }
}

void __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke_2;
  v2[3] = &unk_1E63E4890;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObserversWithBlock:v2];
}

uint64_t __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 collection:*(void *)(a1 + 32) deletedItemIDs:*(void *)(a1 + 40)];
}

- (void)queryMatchedDeletedObjectIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v12 = self;
    __int16 v13 = 2048;
    uint64_t v14 = [v4 count];
    __int16 v15 = 2114;
    uint64_t v16 = self;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Deleted %lu objectIDs\n%{public}@", buf, 0x20u);
  }

  id v6 = [(EMQueryingCollection *)self _itemIDsForObjectIDs:v4];
  id v7 = [(EMQueryingCollection *)self removeItemIDs:v6];
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering") && [v7 count])
  {
    id v8 = [(EMQueryingCollection *)self observerScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke;
    v9[3] = &unk_1E63E2760;
    v9[4] = self;
    id v10 = v7;
    [v8 performSyncBlock:v9];
  }
}

void __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke_2;
  v2[3] = &unk_1E63E4890;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObserversWithBlock:v2];
}

uint64_t __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 collection:*(void *)(a1 + 32) deletedItemIDs:*(void *)(a1 + 40)];
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (a2)
    {
      id v9 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:a2 - 1];
    }
    else
    {
      id v9 = 0;
    }
    id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "ef_subarrayWithRange:", a2, a3);
    id v7 = *(void **)(a1 + 40);
    id v8 = [MEMORY[0x1E4F60DF0] pairWithFirst:v9 second:v6];
    [v7 addObject:v8];
  }
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_27(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) removals];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2;
    v20[3] = &unk_1E63E4890;
    v20[4] = v4;
    id v21 = *(id *)(a1 + 32);
    [v4 enumerateObserversWithBlock:v20];
  }
  id v5 = +[EMQueryingCollection log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 48) count];
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = v6;
    __int16 v25 = 2114;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "Start to notify observer of %lu grouped insertions\n%{public}@", buf, 0x16u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        __int16 v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v13 = *(void **)(a1 + 40);
        uint64_t v14 = objc_msgSend(v12, "second", (void)v16);
        __int16 v15 = [v12 first];
        [v13 notifyChangeObserversAboutAddedItemIDs:v14 after:v15 extraInfo:0];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) removals];
  id v5 = objc_msgSend(v4, "ef_mapSelector:", sel_object);
  [v6 collection:v3 deletedItemIDs:v5];
}

uint64_t __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyChangeObserversAboutAddedItemIDs:MEMORY[0x1E4F1CBF0] before:0 extraInfo:0];
}

uint64_t __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2_31(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_3;
  v3[3] = &unk_1E63E5D48;
  v3[4] = v1;
  return [v1 enumerateObserversWithBlock:v3];
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didFinishRecoveryForCollection:*(void *)(a1 + 32)];
  }
}

- (void)queryDidFinishRemoteSearch
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__EMQueryingCollection_queryDidFinishRemoteSearch__block_invoke;
  v2[3] = &unk_1E63E5D48;
  v2[4] = self;
  [(EMQueryingCollection *)self enumerateObserversWithBlock:v2];
}

void __50__EMQueryingCollection_queryDidFinishRemoteSearch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didFinishRemoteSearchForCollection:*(void *)(a1 + 32)];
  }
}

- (id)_itemIDsForObjectIDs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__EMQueryingCollection__itemIDsForObjectIDs___block_invoke;
  v5[3] = &unk_1E63E4B10;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "ef_map:", v5);
  return v3;
}

id __45__EMQueryingCollection__itemIDsForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) itemIDForObjectID:a2];
  return v2;
}

- (BOOL)observerContainsObjectID:(id)a3
{
  id v4 = a3;
  if ([(EMQueryingCollection *)self objectIDBelongsToCollection:v4])
  {
    id v5 = [(EMQueryingCollection *)self itemIDForObjectID:v4];
    BOOL v6 = [(EMQueryingCollection *)self containsItemID:v5 includeRecovery:0];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)queryReplacedObjectID:(id)a3 withNewObjectID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(EMQueryingCollection *)self objectIDBelongsToCollection:v6])
  {
    id v8 = +[EMQueryingCollection log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      long long v18 = self;
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      uint64_t v24 = self;
      _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Replace objectID %{public}@ with %{public}@\n%{public}@", buf, 0x2Au);
    }

    uint64_t v9 = [(EMQueryingCollection *)self itemIDForObjectID:v6];
    if (v9)
    {
      uint64_t v10 = [(EMQueryingCollection *)self itemIDForObjectID:v7];
      os_unfair_lock_lock(&self->_itemIDsLock);
      uint64_t v11 = [(NSMutableOrderedSet *)self->_itemIDs indexOfObject:v9];
      if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
        [(NSMutableOrderedSet *)self->_itemIDs replaceObjectAtIndex:v11 withObject:v10];
      }
      os_unfair_lock_unlock(&self->_itemIDsLock);
      __int16 v12 = [(EMQueryingCollection *)self observerScheduler];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke;
      v14[3] = &unk_1E63E2848;
      v14[4] = self;
      id v15 = v9;
      __int16 v13 = v10;
      long long v16 = v13;
      [v12 performSyncBlock:v14];
    }
    else
    {
      __int16 v13 = +[EMQueryingCollection log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        long long v18 = self;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEFAULT, "<%p> Replace objectID %{public}@ but itemIDForObjectID is nil", buf, 0x16u);
      }
    }
  }
}

void __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke_2;
  v3[3] = &unk_1E63E4A70;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateObserversWithBlock:v3];
}

uint64_t __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke_2(void *a1, void *a2)
{
  return [a2 collection:a1[4] replacedExistingItemID:a1[5] withNewItemID:a1[6]];
}

- (void)notifyNewChangeObserverAboutExistingState:(id)a3
{
  id v4 = a3;
  id v5 = [(EMQueryingCollection *)self observerScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__EMQueryingCollection_notifyNewChangeObserverAboutExistingState___block_invoke;
  v7[3] = &unk_1E63E2760;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

uint64_t __66__EMQueryingCollection_notifyNewChangeObserverAboutExistingState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyNewChangeObserverAboutExistingState:*(void *)(a1 + 40)];
}

- (void)setChangeObservers:(id)a3
{
}

- (void)queryMatchedChangedObjectIDs:(uint64_t)a3 extraInfo:(os_log_t)log .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218498;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  *((_WORD *)buf + 11) = 2114;
  *((void *)buf + 3) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "<%p> Fewer than expected changed itemIDs: %lu\n%{public}@", buf, 0x20u);
}

@end