@interface MPStoreItemMetadataImportWindow
- (MPServerObjectDatabase)serverObjectDatabase;
- (MPStoreItemMetadataImportWindow)initWithEventCadence:(double)a3 maximumLatency:(double)a4 serverObjectDatabase:(id)a5 queue:(id)a6;
- (OS_dispatch_queue)queue;
- (double)eventCadence;
- (double)maximumLatency;
- (void)_purge;
- (void)addPayload:(id)a3 userIdentity:(id)a4;
@end

@implementation MPStoreItemMetadataImportWindow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_serverObjectDatabase);

  objc_storeStrong((id *)&self->_accumulatedObjects, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MPServerObjectDatabase)serverObjectDatabase
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverObjectDatabase);

  return (MPServerObjectDatabase *)WeakRetained;
}

- (double)maximumLatency
{
  return self->_maximumLatency;
}

- (double)eventCadence
{
  return self->_eventCadence;
}

- (void)_purge
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableArray *)self->_accumulatedObjects copy];
  v33 = self;
  [(NSMutableArray *)self->_accumulatedObjects removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v12 = [v11 userIdentity];
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1CA98] null];
        }
        v15 = v14;

        v16 = [v5 objectForKeyedSubscript:v15];
        if (v16)
        {
          v17 = [v11 platformDictionary];
          [v16 addObject:v17];
        }
        else
        {
          v18 = (void *)MEMORY[0x1E4F1CA48];
          v17 = [v11 platformDictionary];
          v19 = [v18 arrayWithObject:v17];
          [v5 setObject:v19 forKeyedSubscript:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v8);
  }
  v32 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&v33->_serverObjectDatabase);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v21 = v5;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        v27 = objc_msgSend(v21, "objectForKeyedSubscript:", v26, v32);
        v28 = [[MPServerObjectDatabaseStorePlatformImportRequest alloc] initWithPayload:v27];
        v29 = [MEMORY[0x1E4F1CA98] null];

        if (v26 != v29) {
          [(MPServerObjectDatabaseImportRequest *)v28 setUserIdentity:v26];
        }
        queue = v33->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__MPStoreItemMetadataImportWindow__purge__block_invoke;
        block[3] = &unk_1E57F9F98;
        id v35 = WeakRetained;
        v36 = v28;
        v31 = v28;
        dispatch_async(queue, block);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v23);
  }
}

id __41__MPStoreItemMetadataImportWindow__purge__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) importObjectsFromRequest:*(void *)(a1 + 40) options:0 error:0];
}

- (void)addPayload:(id)a3 userIdentity:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  if (![(NSMutableArray *)self->_accumulatedObjects count]) {
    [(MPStoreItemMetadataImportWindow *)self performSelector:sel__purge withObject:0 afterDelay:self->_maximumLatency];
  }
  uint64_t v9 = [[MPStoreItemMetadataImportDescriptor alloc] initWithPayload:v8 userIdentity:v7];

  [(NSMutableArray *)self->_accumulatedObjects addObject:v9];
  os_unfair_lock_unlock(p_lock);
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__checkCadence object:0];
  [(MPStoreItemMetadataImportWindow *)self performSelector:sel__checkCadence withObject:0 afterDelay:self->_eventCadence];
}

- (MPStoreItemMetadataImportWindow)initWithEventCadence:(double)a3 maximumLatency:(double)a4 serverObjectDatabase:(id)a5 queue:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MPStoreItemMetadataImportWindow;
  v12 = [(MPStoreItemMetadataImportWindow *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_eventCadence = a3;
    v12->_maximumLatency = a4;
    objc_storeWeak((id *)&v12->_serverObjectDatabase, v10);
    id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    accumulatedObjects = v13->_accumulatedObjects;
    v13->_accumulatedObjects = v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_queue, a6);
  }

  return v13;
}

@end