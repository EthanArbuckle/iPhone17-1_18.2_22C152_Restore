@interface CNCache
+ (CNScheduler)atomicCacheScheduler;
+ (CNScheduler)nonatomicCacheScheduler;
+ (id)atomicCache;
+ (id)boundingStrategyWithCapacity:(unint64_t)a3;
+ (id)boundingStrategyWithTTL:(double)a3;
+ (id)boundingStrategyWithTTL:(double)a3 renewalOptions:(unint64_t)a4 timeProvider:(id)a5;
+ (id)cache;
- (CNCache)init;
- (CNCache)initWithBoundingStrategies:(id)a3 resourceScheduler:(id)a4;
- (CNCache)initWithResourceScheduler:(id)a3;
- (CNScheduler)resourceScheduler;
- (NSArray)allKeys;
- (NSArray)allObjects;
- (NSArray)boundingStrategies;
- (NSArray)evictedKeysAndValues;
- (NSMutableArray)didEvictHandlers;
- (NSMutableDictionary)storage;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 onCacheMiss:(id)a4;
- (id)resultWithResourceLock:(id)a3;
- (unint64_t)overestimatedCount;
- (void)addDidEvictHandler:(id)a3;
- (void)callDidEvictHandlersIfNecessary;
- (void)performWithResourceLock:(id)a3;
- (void)removeAllObjects;
- (void)resourceLock_evictObjectsForKeys:(id)a3;
- (void)resourceLock_setObject:(id)a3 forKey:(id)a4;
- (void)resourceLock_validateAllKeys;
- (void)resourceLock_validateKey:(id)a3;
- (void)resourceLock_validateKeys:(id)a3;
- (void)resourceLock_willAccessKey:(id)a3;
- (void)resourceLock_willSetObject:(id)a3 forKey:(id)a4;
- (void)setEvictedKeysAndValues:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CNCache

id __24__CNCache_objectForKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateKey:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_willAccessKey:", *(void *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) storage];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  return v3;
}

id __36__CNCache_objectForKey_onCacheMiss___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateKey:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_willAccessKey:", *(void *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) storage];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v3)
  {
    v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (v3) {
      objc_msgSend(*(id *)(a1 + 32), "resourceLock_setObject:forKey:", v3, *(void *)(a1 + 40));
    }
  }
  id v4 = v3;

  return v4;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)resourceLock_validateKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v7 count:1];

    -[CNCache resourceLock_validateKeys:](self, "resourceLock_validateKeys:", v6, v7, v8);
  }
}

- (void)resourceLock_validateKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(CNCache *)self boundingStrategies];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__CNCache_resourceLock_validateKeys___block_invoke;
    v9[3] = &unk_1E569FA50;
    v9[4] = self;
    id v7 = [v4 indexesOfObjectsPassingTest:v9];
    if ([v7 count])
    {
      uint64_t v8 = [v4 objectsAtIndexes:v7];
      [(CNCache *)self resourceLock_evictObjectsForKeys:v8];
    }
  }
}

- (void)resourceLock_willAccessKey:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CNCache *)self boundingStrategies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) willAccessKey:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)boundingStrategies
{
  return self->_boundingStrategies;
}

- (id)objectForKey:(id)a3 onCacheMiss:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__CNCache_objectForKey_onCacheMiss___block_invoke;
  v12[3] = &unk_1E569F960;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  long long v10 = [(CNCache *)self resultWithResourceLock:v12];
  [(CNCache *)self callDidEvictHandlersIfNecessary];

  return v10;
}

- (void)callDidEvictHandlersIfNecessary
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__1;
  long long v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__1;
  v5[4] = __Block_byref_object_dispose__1;
  id v6 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke;
  v4[3] = &unk_1E569FAA0;
  v4[4] = self;
  v4[5] = &v7;
  v4[6] = v5;
  [(CNCache *)self performWithResourceLock:v4];
  v2 = (void *)v8[5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_2;
  v3[3] = &unk_1E569FAF0;
  v3[4] = v5;
  objc_msgSend(v2, "_cn_each:", v3);
  _Block_object_dispose(v5, 8);

  _Block_object_dispose(&v7, 8);
}

- (id)resultWithResourceLock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  id v5 = [(CNCache *)self resourceScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__CNCache_resultWithResourceLock___block_invoke;
  v9[3] = &unk_1E569F2E8;
  long long v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)performWithResourceLock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNCache *)self resourceScheduler];
  [v5 performBlock:v4];
}

- (CNScheduler)resourceScheduler
{
  return self->_resourceScheduler;
}

- (void)setEvictedKeysAndValues:(id)a3
{
}

uint64_t __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [*(id *)(a1 + 32) evictedKeysAndValues];
  uint64_t v4 = [v2 arrayWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = [*(id *)(a1 + 32) didEvictHandlers];
  uint64_t v9 = [v7 arrayWithArray:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void **)(a1 + 32);

  return [v12 setEvictedKeysAndValues:0];
}

- (NSArray)evictedKeysAndValues
{
  return self->_evictedKeysAndValues;
}

- (NSMutableArray)didEvictHandlers
{
  return self->_didEvictHandlers;
}

uint64_t __34__CNCache_resultWithResourceLock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F41817F8]();
}

- (void)resourceLock_setObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(CNCache *)self resourceLock_willSetObject:v9 forKey:v6];
  id v7 = [(CNCache *)self storage];
  id v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (void)resourceLock_willSetObject:(id)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(CNCache *)self boundingStrategies];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    BOOL v11 = a3 != 0;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        id v15 = 0;
        [v13 willUpdateCacheBy:v11 forKey:v6 keysToEvict:&v15];
        id v14 = v15;
        if (v14) {
          [(CNCache *)self resourceLock_evictObjectsForKeys:v14];
        }

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __28__CNCache_setObject_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resourceLock_setObject:forKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__CNCache_setObject_forKey___block_invoke;
  v10[3] = &unk_1E569F988;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CNCache *)self performWithResourceLock:v10];
  [(CNCache *)self callDidEvictHandlersIfNecessary];
}

void __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_3;
  v6[3] = &unk_1E569FAC8;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_cn_each:", v6);
}

- (CNCache)init
{
  id v3 = +[CNScheduler immediateScheduler];
  uint64_t v4 = [(CNCache *)self initWithResourceScheduler:v3];

  return v4;
}

+ (id)atomicCache
{
  id v3 = [a1 atomicCacheScheduler];
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithResourceScheduler:v3];

  return v4;
}

- (CNCache)initWithBoundingStrategies:(id)a3 resourceScheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNCache;
  id v8 = [(CNCache *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    boundingStrategies = v8->_boundingStrategies;
    v8->_boundingStrategies = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_resourceScheduler, a4);
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storage = v8->_storage;
    v8->_storage = v11;

    if ([v6 count])
    {
      id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      didEvictHandlers = v8->_didEvictHandlers;
      v8->_didEvictHandlers = v13;
    }
    id v15 = v8;
  }

  return v8;
}

- (CNCache)initWithResourceScheduler:(id)a3
{
  return [(CNCache *)self initWithBoundingStrategies:MEMORY[0x1E4F1CBF0] resourceScheduler:a3];
}

+ (CNScheduler)atomicCacheScheduler
{
  return (CNScheduler *)+[CNScheduler synchronousSerialDispatchQueueWithName:@"com.apple.contacts.foundation.cache"];
}

- (void)resourceLock_evictObjectsForKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(CNCache *)self boundingStrategies];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__CNCache_resourceLock_evictObjectsForKeys___block_invoke;
    v10[3] = &unk_1E569FA78;
    v10[4] = self;
    id v7 = objc_msgSend(v4, "_cn_map:", v10);
    id v8 = objc_msgSend(v7, "_cn_filter:", CNPairNeitherElementIsNil);

    if ([v8 count]) {
      [(CNCache *)self setEvictedKeysAndValues:v8];
    }
  }
  uint64_t v9 = [(CNCache *)self storage];
  [v9 removeObjectsForKeys:v4];
}

id __44__CNCache_resourceLock_evictObjectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 storage];
  id v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v6 = +[CNPair pairWithFirst:v3 second:v5];

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __24__CNCache_objectForKey___block_invoke;
  id v11 = &unk_1E569F338;
  id v12 = self;
  id v13 = v4;
  id v5 = v4;
  uint64_t v6 = [(CNCache *)self resultWithResourceLock:&v8];
  [(CNCache *)self callDidEvictHandlersIfNecessary];

  return v6;
}

uint64_t __37__CNCache_resourceLock_validateKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) boundingStrategies];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__CNCache_resourceLock_validateKeys___block_invoke_2;
  v8[3] = &unk_1E569FA28;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __37__CNCache_resourceLock_validateKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 shouldEvictKey:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictedKeysAndValues, 0);
  objc_storeStrong((id *)&self->_didEvictHandlers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_resourceScheduler, 0);

  objc_storeStrong((id *)&self->_boundingStrategies, 0);
}

+ (id)boundingStrategyWithCapacity:(unint64_t)a3
{
  id v3 = [[_CNCacheFixedCapacityBoundingStrategy alloc] initWithCapacity:a3];

  return v3;
}

+ (id)cache
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (id)description
{
  id v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = NSNumber;
  id v5 = [(CNCache *)self allKeys];
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  id v7 = (id)[v3 appendName:@"count of keys" object:v6];

  uint64_t v8 = [v3 build];

  return v8;
}

+ (CNScheduler)nonatomicCacheScheduler
{
  return +[CNScheduler immediateScheduler];
}

+ (id)boundingStrategyWithTTL:(double)a3
{
  id v3 = [[_CNCacheFixedTTLBoundingStrategy alloc] initWithTTL:a3];

  return v3;
}

+ (id)boundingStrategyWithTTL:(double)a3 renewalOptions:(unint64_t)a4 timeProvider:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [[_CNCacheFixedTTLBoundingStrategy alloc] initWithTTL:a4 renewalOptions:v7 timeProvider:a3];

  return v8;
}

- (NSArray)allKeys
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__CNCache_allKeys__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v3 = [(CNCache *)self resultWithResourceLock:v5];
  [(CNCache *)self callDidEvictHandlersIfNecessary];

  return (NSArray *)v3;
}

id __18__CNCache_allKeys__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateAllKeys");
  id v2 = [*(id *)(a1 + 32) storage];
  id v3 = [v2 allKeys];

  return v3;
}

- (NSArray)allObjects
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__CNCache_allObjects__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v3 = [(CNCache *)self resultWithResourceLock:v5];
  [(CNCache *)self callDidEvictHandlersIfNecessary];

  return (NSArray *)v3;
}

id __21__CNCache_allObjects__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateAllKeys");
  id v2 = [*(id *)(a1 + 32) storage];
  id v3 = [v2 allValues];

  return v3;
}

- (unint64_t)overestimatedCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__CNCache_overestimatedCount__block_invoke;
  v4[3] = &unk_1E569F9B0;
  v4[4] = self;
  v4[5] = &v5;
  [(CNCache *)self performWithResourceLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__CNCache_overestimatedCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (void)removeAllObjects
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __27__CNCache_removeAllObjects__block_invoke;
  v2[3] = &unk_1E569F9D8;
  v2[4] = self;
  [(CNCache *)self performWithResourceLock:v2];
}

void __27__CNCache_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) storage];
  [v1 removeAllObjects];
}

- (void)addDidEvictHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNCache *)self boundingStrategies];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__CNCache_addDidEvictHandler___block_invoke;
    v7[3] = &unk_1E569FA00;
    v7[4] = self;
    id v8 = v4;
    [(CNCache *)self performWithResourceLock:v7];
  }
}

void __30__CNCache_addDidEvictHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) didEvictHandlers];
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  id v3 = _Block_copy(v2);
  [v4 addObject:v3];
}

- (void)resourceLock_validateAllKeys
{
  id v3 = [(CNCache *)self storage];
  id v4 = [v3 allKeys];
  id v5 = (id)[v4 copy];

  [(CNCache *)self resourceLock_validateKeys:v5];
}

void __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_3(uint64_t a1, void (**a2)(void, void, void))
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 first];
  uint64_t v6 = [*(id *)(a1 + 32) second];
  ((void (**)(void, id, void *))a2)[2](v5, v7, v6);
}

@end