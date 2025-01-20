@interface MPConcreteMediaEntityPropertiesCache
- (Class)dataProviderEntityClass;
- (MPConcreteMediaEntityPropertiesCache)initWithLibraryDataProvider:(id)a3 dataProviderEntityClass:(Class)a4 identifier:(int64_t)a5;
- (MPMediaLibraryDataProvider)dataProvider;
- (id)valueForProperty:(id)a3 isCached:(BOOL *)a4;
- (int64_t)identifier;
- (void)_cacheValues:(id)a3 persistValueInBackgroundBlock:(id)a4;
- (void)cachePropertyValues:(id)a3 forProperties:(id)a4 persistValueInBackgroundBlock:(id)a5;
- (void)cacheValue:(id)a3 forProperty:(id)a4 persistValueInBackgroundBlock:(id)a5;
- (void)dealloc;
- (void)delete;
- (void)invalidate;
@end

@implementation MPConcreteMediaEntityPropertiesCache

- (id)valueForProperty:(id)a3 isCached:(BOOL *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  v8 = [(NSMutableDictionary *)self->_properties objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    if (a4) {
      *a4 = 1;
    }
    v9 = [MEMORY[0x1E4F1CA98] null];

    if (v8 == v9)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)cacheValue:(id)a3 forProperty:(id)a4 persistValueInBackgroundBlock:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MPMediaLibraryDataProvider.m" lineNumber:1710 description:@"Property can't be nil"];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v12 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_6;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = v9;
LABEL_6:
  v14 = v12;
  id v16 = v10;
  v17[0] = v12;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [(MPConcreteMediaEntityPropertiesCache *)self _cacheValues:v15 persistValueInBackgroundBlock:v11];
}

- (void)_cacheValues:(id)a3 persistValueInBackgroundBlock:(id)a4
{
  id v6 = a4;
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke;
  v10[3] = &unk_1E57F15D8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  os_unfair_lock_unlock(p_lock);
}

- (void)cachePropertyValues:(id)a3 forProperties:(id)a4 persistValueInBackgroundBlock:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)[v7 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v16 = objc_msgSend(v7, "objectForKey:", v15, (void)v18);

        if (!v16)
        {
          v17 = [MEMORY[0x1E4F1CA98] null];
          [v9 setObject:v17 forKey:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [(MPConcreteMediaEntityPropertiesCache *)self _cacheValues:v9 persistValueInBackgroundBlock:0];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  v4 = [WeakRetained entityCache];
  [v4 removeEntityWithIdentifier:self->_identifier dataProviderEntityClass:self->_dataProviderEntityClass];

  v5.receiver = self;
  v5.super_class = (Class)MPConcreteMediaEntityPropertiesCache;
  [(MPConcreteMediaEntityPropertiesCache *)&v5 dealloc];
}

- (Class)dataProviderEntityClass
{
  return self->_dataProviderEntityClass;
}

- (MPConcreteMediaEntityPropertiesCache)initWithLibraryDataProvider:(id)a3 dataProviderEntityClass:(Class)a4 identifier:(int64_t)a5
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPConcreteMediaEntityPropertiesCache;
  id v8 = [(MPConcreteMediaEntityPropertiesCache *)&v17 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataProvider, v7);
    v9->_dataProviderEntityClass = a4;
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    properties = v9->_properties;
    v9->_properties = v10;

    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    valuePersistenceBlocks = v9->_valuePersistenceBlocks;
    v9->_valuePersistenceBlocks = v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mediaplayer.EntityProperty.calloutQueue", 0);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v14;

    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

void __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19971DE60]();
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v6 forKey:v5];
  if (*(void *)(a1 + 40))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_2;
    v16[3] = &unk_1E57F8408;
    id v17 = v6;
    id v19 = *(id *)(a1 + 40);
    id v8 = v5;
    id v18 = v8;
    id v9 = (void *)[v16 copy];
    id v10 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v11 = (void *)MEMORY[0x19971E0F0]();
    [v10 setObject:v11 forKey:v8];

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(NSObject **)(v12 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_3;
    block[3] = &unk_1E57F9F98;
    block[4] = v12;
    id v15 = v8;
    dispatch_async(v13, block);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_valuePersistenceBlocks, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (MPMediaLibraryDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);

  return (MPMediaLibraryDataProvider *)WeakRetained;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_valuePersistenceBlocks allKeys];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[NSMutableDictionary valueForKey:](self->_properties, "valueForKey:", v11, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  properties = self->_properties;
  p_properties = &self->_properties;
  if (properties) {
    objc_storeStrong((id *)p_properties, v5);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)delete
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_valuePersistenceBlocks removeAllObjects];
  properties = self->_properties;
  if (properties)
  {
    self->_properties = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

void __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F1CA98] null];
  if ([v2 isEqual:v3]) {
    v4 = 0;
  }
  else {
    v4 = *(void **)(a1 + 32);
  }
  id v5 = v4;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v2 = (void *)v3;
  }
}

@end