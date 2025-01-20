@interface AXMVisionEngineCache
- (AXMVisionEngineCache)initWithCacheSize:(int64_t)a3;
- (id)_cacheQueue_resultForKey:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)resultForKey:(id)a3;
- (int64_t)_cacheQueue_cacheSize;
- (int64_t)cacheSize;
- (void)_cacheQueue_setResult:(id)a3 forKey:(id)a4;
- (void)purgeCache;
- (void)setResult:(id)a3 forKey:(id)a4;
@end

@implementation AXMVisionEngineCache

- (AXMVisionEngineCache)initWithCacheSize:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AXMVisionEngineCache;
  v4 = [(AXMVisionEngineCache *)&v13 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v6 = dispatch_queue_create("cacheQueue", v5);
    cacheQueue = v4->_cacheQueue;
    v4->_cacheQueue = (OS_dispatch_queue *)v6;

    v4->_cacheQueue_maxItems = a3;
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    cacheQueue_results = v4->_cacheQueue_results;
    v4->_cacheQueue_results = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSet];
    cacheQueue_orderedKeys = v4->_cacheQueue_orderedKeys;
    v4->_cacheQueue_orderedKeys = (NSMutableOrderedSet *)v10;
  }
  return v4;
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AXMVisionEngineCache_description__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__AXMVisionEngineCache_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"AXMVisionEngineCache<%p>: %ld items", *(void *)(a1 + 32), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "count"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)debugDescription
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AXMVisionEngineCache_debugDescription__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__AXMVisionEngineCache_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMVisionEngineCache<%p>: %ld items\n", *(void *)(a1 + 32), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "count"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AXMVisionEngineCache_debugDescription__block_invoke_2;
  v7[3] = &unk_1E6117978;
  v7[4] = *(void *)(a1 + 40);
  return [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __40__AXMVisionEngineCache_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:@"---\n  Key:%@\n  Result:%@\n", a2, a3];
}

- (int64_t)cacheSize
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AXMVisionEngineCache_cacheSize__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AXMVisionEngineCache_cacheSize__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_cacheQueue_cacheSize");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_cacheQueue_cacheSize
{
  return self->_cacheQueue_maxItems;
}

- (id)resultForKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    objc_super v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    id v17 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__AXMVisionEngineCache_resultForKey___block_invoke;
    block[3] = &unk_1E6117398;
    id v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(cacheQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __37__AXMVisionEngineCache_resultForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_cacheQueue_resultForKey:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_cacheQueue_resultForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cacheQueue_results objectForKey:v4];
  if (v5)
  {
    [(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys removeObject:v4];
    [(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys addObject:v4];
    uint64_t v6 = AXMediaLogEngineCache();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AXMVisionEngineCache _cacheQueue_resultForKey:]((uint64_t)v4, v6);
    }
  }

  return v5;
}

- (void)setResult:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__AXMVisionEngineCache_setResult_forKey___block_invoke;
    block[3] = &unk_1E61179A0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_sync(cacheQueue, block);
  }
}

uint64_t __41__AXMVisionEngineCache_setResult_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cacheQueue_setResult:forKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_cacheQueue_setResult:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(NSMutableDictionary *)self->_cacheQueue_results setObject:v6 forKey:v7];
    p_cacheQueue_orderedKeys = &self->_cacheQueue_orderedKeys;
    [(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys removeObject:v7];
    [(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys addObject:v7];
    uint64_t v9 = AXMediaLogEngineCache();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AXMVisionEngineCache _cacheQueue_setResult:forKey:]((uint64_t)v7, (id *)&self->_cacheQueue_orderedKeys);
    }

    if ((unint64_t)[(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys count] > self->_cacheQueue_maxItems)
    {
      id v10 = [(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys firstObject];
      [(NSMutableDictionary *)self->_cacheQueue_results removeObjectForKey:v10];
      [(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys removeObject:v10];
      id v11 = AXMediaLogEngineCache();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[AXMVisionEngineCache _cacheQueue_setResult:forKey:]((uint64_t)v10, (id *)p_cacheQueue_orderedKeys);
      }
    }
  }
  else
  {
    uint64_t v12 = AXMediaLogEngineCache();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AXMVisionEngineCache _cacheQueue_setResult:forKey:]((uint64_t)v7, (uint64_t)self);
    }

    [(NSMutableDictionary *)self->_cacheQueue_results removeObjectForKey:v7];
    [(NSMutableOrderedSet *)self->_cacheQueue_orderedKeys removeObject:v7];
  }
}

- (void)purgeCache
{
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AXMVisionEngineCache_purgeCache__block_invoke;
  block[3] = &unk_1E6117090;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

void __34__AXMVisionEngineCache_purgeCache__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = AXMediaLogEngineCache();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__AXMVisionEngineCache_purgeCache__block_invoke_cold_1(v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue_results, 0);
  objc_storeStrong((id *)&self->_cacheQueue_orderedKeys, 0);

  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

- (void)_cacheQueue_resultForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "Result found for key: %p. moving to newest position", (uint8_t *)&v2, 0xCu);
}

- (void)_cacheQueue_setResult:(uint64_t)a1 forKey:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 24) count];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1B57D5000, v2, v3, "set nil result. removing key: %p. %ld items remain", v4, v5, v6, v7, v8);
}

- (void)_cacheQueue_setResult:(uint64_t)a1 forKey:(id *)a2 .cold.2(uint64_t a1, id *a2)
{
  [*a2 count];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1B57D5000, v2, v3, "cache size too big. evicted key: %p. %ld items remain", v4, v5, v6, v7, v8);
}

- (void)_cacheQueue_setResult:(uint64_t)a1 forKey:(id *)a2 .cold.3(uint64_t a1, id *a2)
{
  [*a2 count];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1B57D5000, v2, v3, "set new result. adding key: %p. %ld items remain", v4, v5, v6, v7, v8);
}

void __34__AXMVisionEngineCache_purgeCache__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "purge cache of all keys", v1, 2u);
}

@end