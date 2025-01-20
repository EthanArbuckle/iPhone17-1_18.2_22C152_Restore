@interface ATXHeuristicResultCacheEntry
- (ATXHeuristicResultCacheEntry)initWithHeuristic:(id)a3 cache:(id)a4;
- (void)dealloc;
- (void)setActions:(id)a3 expirers:(id)a4;
@end

@implementation ATXHeuristicResultCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirers, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_cache);

  objc_storeStrong((id *)&self->_heuristicName, 0);
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_expirers;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        heuristicName = self->_heuristicName;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
        [v8 stopExpiring:heuristicName cache:WeakRetained];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicResultCacheEntry;
  [(ATXHeuristicResultCacheEntry *)&v11 dealloc];
}

- (ATXHeuristicResultCacheEntry)initWithHeuristic:(id)a3 cache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicResultCacheEntry;
  v9 = [(ATXHeuristicResultCacheEntry *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heuristicName, a3);
    objc_storeWeak((id *)&v10->_cache, v8);
    actions = v10->_actions;
    v10->_actions = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v12 = objc_opt_new();
    expirers = v10->_expirers;
    v10->_expirers = (NSSet *)v12;
  }
  return v10;
}

- (void)setActions:(id)a3 expirers:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v7 = (NSSet *)a4;
  objc_storeStrong((id *)&self->_actions, a3);
  id v8 = (void *)[(NSSet *)self->_expirers mutableCopy];
  [v8 minusSet:v7];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
        heuristicName = self->_heuristicName;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
        [v14 stopExpiring:heuristicName cache:WeakRetained];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  uint64_t v17 = (void *)[(NSSet *)v7 mutableCopy];
  [v17 minusSet:self->_expirers];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v28 + 1) + 8 * v22);
        v24 = self->_heuristicName;
        id v25 = objc_loadWeakRetained((id *)&self->_cache);
        [v23 startExpiring:v24 cache:v25];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }

  expirers = self->_expirers;
  self->_expirers = v7;
}

@end