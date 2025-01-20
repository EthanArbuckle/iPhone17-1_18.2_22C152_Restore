@interface ATXContextHeuristicCache
- (ATXContextHeuristicCache)init;
- (id)allRelevantSuggestionsForDate:(id)a3;
- (id)heuristicsCached;
- (id)nextChangeAfterDate:(id)a3;
- (id)suggestionsForKey:(id)a3;
- (void)dealloc;
- (void)evict:(id)a3;
- (void)evictAll;
- (void)evictBefore:(id)a3;
- (void)setSuggestions:(id)a3 forKey:(id)a4;
@end

@implementation ATXContextHeuristicCache

- (ATXContextHeuristicCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXContextHeuristicCache;
  v2 = [(ATXContextHeuristicCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    criteriaTable = v2->_criteriaTable;
    v2->_criteriaTable = (NSHashTable *)v5;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)ATXContextHeuristicCache;
  [(ATXContextHeuristicCache *)&v3 dealloc];
}

- (id)suggestionsForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  v6 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v5];

  pthread_mutex_unlock(p_lock);

  return v6;
}

- (void)setSuggestions:(id)a3 forKey:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cache setObject:v6 forKeyedSubscript:v7];
  objc_super v8 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v7;
    __int16 v34 = 2048;
    uint64_t v35 = objc_msgSend(v6, "count", p_lock);
    _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "[Cache internal] Adding suggestions for key %@: %lu", buf, 0x16u);
  }
  v23 = v7;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    uint64_t v24 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      uint64_t v25 = v10;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "atxActionCriteria", p_lock, v23);
        v15 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v13 uiSpecification];
          v16 = [v27 title];
          v17 = [v13 uiSpecification];
          v18 = [v17 reason];
          uint64_t v19 = [v18 hash];
          v20 = [v14 startDate];
          v21 = [v14 endDate];
          *(_DWORD *)buf = 138413058;
          id v33 = v16;
          __int16 v34 = 2048;
          uint64_t v35 = v19;
          __int16 v36 = 2112;
          v37 = v20;
          __int16 v38 = 2112;
          v39 = v21;
          _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "[Cache internal] Adding criteria for suggestion %@, reason.hash %lu, start: %@ end: %@", buf, 0x2Au);

          uint64_t v10 = v25;
          uint64_t v11 = v24;
        }
        [(NSHashTable *)self->_criteriaTable addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v10);
  }

  pthread_mutex_unlock(p_lock);
}

- (id)heuristicsCached
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_cache allKeys];
  pthread_mutex_unlock(p_lock);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];

  return v5;
}

- (id)allRelevantSuggestionsForDate:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v27 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v24 = self;
  id obj = self->_cache;
  uint64_t v25 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v5;
        id v6 = -[NSMutableDictionary objectForKeyedSubscript:](v24->_cache, "objectForKeyedSubscript:", *(void *)(*((void *)&v33 + 1) + 8 * v5), p_lock);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v28 = v6;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v43 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v30 != v9) {
                objc_enumerationMutation(v28);
              }
              uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v12 = [v11 atxActionCriteria];
              v13 = __atxlog_handle_context_heuristic();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v14 = [v12 startDate];
                v15 = [v12 endDate];
                *(_DWORD *)buf = 138412802;
                id v38 = v4;
                __int16 v39 = 2112;
                v40 = v14;
                __int16 v41 = 2112;
                v42 = v15;
                _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "[Cache internal] Considering date: %@ for interval %@ - %@", buf, 0x20u);
              }
              v16 = [v12 dateInterval];
              int v17 = [v16 containsDate:v4];

              if (v17)
              {
                [v27 addObject:v11];
              }
              else
              {
                v18 = __atxlog_handle_context_heuristic();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v38 = v11;
                  _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "[Cache internal] Suggestion is no longer relevant: %@", buf, 0xCu);
                }
              }
            }
            uint64_t v8 = [v28 countByEnumeratingWithState:&v29 objects:v43 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v25);
  }

  pthread_mutex_unlock(p_lock);
  uint64_t v19 = (void *)[v27 copy];

  return v19;
}

- (id)nextChangeAfterDate:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = self->_criteriaTable;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_24;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v34;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
      v13 = objc_msgSend(v12, "startDate", (void)v33);
      if (v13)
      {
      }
      else
      {
        v14 = [v12 endDate];

        if (!v14) {
          goto LABEL_18;
        }
      }
      v15 = [v12 startDate];

      if (v15)
      {
        [v4 timeIntervalSinceReferenceDate];
        double v17 = v16;
        v18 = [v12 startDate];
        [v18 timeIntervalSinceReferenceDate];
        double v20 = v19;

        if (v17 < v20)
        {
          v21 = [v12 startDate];
          v22 = [v9 earlierDate:v21];
          if (v22) {
            goto LABEL_16;
          }
          id v23 = [v12 startDate];
          goto LABEL_17;
        }
      }
      uint64_t v24 = [v12 endDate];

      if (v24)
      {
        [v4 timeIntervalSinceReferenceDate];
        double v26 = v25;
        v27 = [v12 endDate];
        [v27 timeIntervalSinceReferenceDate];
        double v29 = v28;

        if (v26 < v29)
        {
          v21 = [v12 endDate];
          v22 = [v9 earlierDate:v21];
          if (v22)
          {
LABEL_16:
            id v23 = v22;
            v22 = v23;
          }
          else
          {
            id v23 = [v12 endDate];
          }
LABEL_17:
          id v30 = v23;

          uint64_t v9 = v30;
        }
      }
LABEL_18:
      ++v11;
    }
    while (v8 != v11);
    uint64_t v31 = [(NSHashTable *)v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v8 = v31;
  }
  while (v31);
LABEL_24:

  pthread_mutex_unlock(p_lock);

  return v9;
}

- (void)evictBefore:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cache allKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v9];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __40__ATXContextHeuristicCache_evictBefore___block_invoke;
        v13[3] = &unk_1E68A4EF0;
        id v14 = v4;
        uint64_t v11 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", v13);
        [(NSMutableDictionary *)self->_cache setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  pthread_mutex_unlock(&self->_lock);
}

uint64_t __40__ATXContextHeuristicCache_evictBefore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 atxActionCriteria];
  uint64_t v5 = [v4 endDate];

  if (v5
    && ([*(id *)(a1 + 32) timeIntervalSinceReferenceDate],
        double v7 = v6,
        [v4 endDate],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 timeIntervalSinceReferenceDate],
        double v10 = v9,
        v8,
        v7 >= v10))
  {
    uint64_t v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_DEFAULT, "[Cache internal] Removing suggestion: %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (void)evict:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "[Cache internal] Removing %@", (uint8_t *)&v6, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cache removeObjectForKey:v4];
  pthread_mutex_unlock(&self->_lock);
}

- (void)evictAll
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ATXContextHeuristicCache *)self heuristicsCached];
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "[Cache internal] Removing all heuristics %@", (uint8_t *)&v7, 0xCu);
  }
  pthread_mutex_lock(&self->_lock);
  uint64_t v5 = (NSMutableDictionary *)objc_opt_new();
  cache = self->_cache;
  self->_cache = v5;

  pthread_mutex_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteriaTable, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end