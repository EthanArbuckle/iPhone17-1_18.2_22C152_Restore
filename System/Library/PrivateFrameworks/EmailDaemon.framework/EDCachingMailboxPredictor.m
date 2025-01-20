@interface EDCachingMailboxPredictor
- (EDCachingMailboxPredictor)initWithPredictor:(id)a3;
- (EDMailboxPredictor)predictor;
- (NSCache)cache;
- (NSMutableDictionary)cacheKeysByProperty;
- (id)_cacheKeyForMessages:(id)a3;
- (id)_propertyKeysForMessage:(id)a3;
- (id)predictMailboxIDsForMessages:(id)a3 limit:(unint64_t)a4;
- (void)_trackCacheKey:(id)a3 forPropertyKey:(id)a4;
- (void)invalidatePredictionsAffectedByMessage:(id)a3;
- (void)removeAllPredictions;
- (void)setCache:(id)a3;
- (void)setCacheKeysByProperty:(id)a3;
- (void)setPredictor:(id)a3;
@end

@implementation EDCachingMailboxPredictor

- (EDCachingMailboxPredictor)initWithPredictor:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDCachingMailboxPredictor;
  v5 = [(EDCachingMailboxPredictor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(EDCachingMailboxPredictor *)v5 setPredictor:v4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(EDCachingMailboxPredictor *)v6 setCache:v7];

    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(EDCachingMailboxPredictor *)v6 setCacheKeysByProperty:v8];
  }
  return v6;
}

- (id)predictMailboxIDsForMessages:(id)a3 limit:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v6 = -[EDCachingMailboxPredictor _cacheKeyForMessages:](self, "_cacheKeyForMessages:");
  id v7 = [(EDCachingMailboxPredictor *)self cache];
  uint64_t v8 = [v7 objectForKey:v6];

  id v23 = (id)v8;
  if (v8)
  {
    v9 = +[EDMailboxPredictionController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[EDCachingMailboxPredictor predictMailboxIDsForMessages:limit:]((uint64_t)v6, v9);
    }
  }
  else
  {
    objc_super v10 = +[EDMailboxPredictionController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[EDCachingMailboxPredictor predictMailboxIDsForMessages:limit:]((uint64_t)v6, v10);
    }

    v11 = [(EDCachingMailboxPredictor *)self predictor];
    id v23 = [v11 predictMailboxIDsForMessages:v22 limit:a4];

    v12 = [(EDCachingMailboxPredictor *)self cache];
    [v12 setObject:v23 forKey:v6];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v9 = v22;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v17 = [(EDCachingMailboxPredictor *)self _propertyKeysForMessage:v16];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v17);
                }
                [(EDCachingMailboxPredictor *)self _trackCacheKey:v6 forPropertyKey:*(void *)(*((void *)&v24 + 1) + 8 * j)];
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v18);
          }
        }
        uint64_t v13 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }
  }

  return v23;
}

- (void)invalidatePredictionsAffectedByMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [(EDCachingMailboxPredictor *)self _propertyKeysForMessage:a3];
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = v4;
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = [(EDCachingMailboxPredictor *)self cacheKeysByProperty];
        uint64_t v8 = [v7 objectForKeyedSubscript:v6];
        v9 = [v8 allObjects];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              uint64_t v14 = [(EDCachingMailboxPredictor *)self cache];
              [v14 removeObjectForKey:v13];

              v15 = [(EDCachingMailboxPredictor *)self cacheKeysByProperty];
              uint64_t v16 = [v15 objectForKeyedSubscript:v6];
              [v16 removeObject:v13];
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }
}

- (void)removeAllPredictions
{
  id v3 = [(EDCachingMailboxPredictor *)self cacheKeysByProperty];
  [v3 removeAllObjects];

  id v4 = [(EDCachingMailboxPredictor *)self cache];
  [v4 removeAllObjects];
}

- (id)_cacheKeyForMessages:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_mapSelector:", sel_persistentID);
  id v4 = (void *)[v3 mutableCopy];

  [v4 sortUsingSelector:sel_compare_];
  v5 = [v4 componentsJoinedByString:@","];

  return v5;
}

- (void)_trackCacheKey:(id)a3 forPropertyKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(EDCachingMailboxPredictor *)self cacheKeysByProperty];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v10 = [(EDCachingMailboxPredictor *)self cacheKeysByProperty];
    [v10 setObject:v9 forKeyedSubscript:v6];

    uint64_t v8 = (void *)v9;
  }
  [v8 addObject:v11];
}

- (id)_propertyKeysForMessage:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v29 = v3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = [v3 listIDHash];
  if (v28)
  {
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v28, "int64Value"));
    [v4 addObject:v5];
  }
  uint64_t v6 = [v3 conversationID];
  if (v6)
  {
    id v7 = [NSNumber numberWithLongLong:v6];
    [v4 addObject:v7];
  }
  uint64_t v8 = objc_msgSend(v3, "to", v6);
  uint64_t v9 = objc_msgSend(v8, "ef_mapSelector:", sel_ea_uncommentedAddress);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F60F40]);
        v15 = [NSString stringWithFormat:@"R %@", v13];
        uint64_t v16 = (void *)[v14 initWithString:v15];

        v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "int64Value"));
        [v4 addObject:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }

  uint64_t v18 = [v29 from];
  uint64_t v19 = [v18 firstObject];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F60F40]);
    long long v21 = [NSString stringWithFormat:@"S %@", v19];
    long long v22 = (void *)[v20 initWithString:v21];

    long long v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v22, "int64Value"));
    [v4 addObject:v23];
  }
  long long v24 = [v29 persistentID];
  uint64_t v25 = [v24 longLongValue];

  if (v25)
  {
    long long v26 = [NSNumber numberWithLongLong:v25];
    [v4 addObject:v26];
  }

  return v4;
}

- (EDMailboxPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSMutableDictionary)cacheKeysByProperty
{
  return self->_cacheKeysByProperty;
}

- (void)setCacheKeysByProperty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKeysByProperty, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_predictor, 0);
}

- (void)predictMailboxIDsForMessages:(uint64_t)a1 limit:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_DEBUG, "Cache miss for %@", (uint8_t *)&v2, 0xCu);
}

- (void)predictMailboxIDsForMessages:(uint64_t)a1 limit:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_DEBUG, "Cache hit for %@", (uint8_t *)&v2, 0xCu);
}

@end