@interface FPOneToManyWeakMap
- (FPOneToManyWeakMap)init;
- (id)anyObjectForKey:(id)a3;
- (id)removeObject:(id)a3;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)removeObjectsForKey:(id)a3;
@end

@implementation FPOneToManyWeakMap

- (id)anyObjectForKey:(id)a3
{
  if (a3)
  {
    v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:");
    v4 = [v3 anyObject];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (FPOneToManyWeakMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)FPOneToManyWeakMap;
  v2 = [(FPOneToManyWeakMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = v3;
  }
  return v2;
}

- (void)removeObjectsForKey:(id)a3
{
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    v7 = [(NSMutableDictionary *)self->_backingDictionary objectForKeyedSubscript:v6];
    if (!v7)
    {
      v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      [(NSMutableDictionary *)self->_backingDictionary setObject:v7 forKeyedSubscript:v6];
    }
    [v7 addObject:v8];
  }
}

- (id)removeObject:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(NSMutableDictionary *)self->_backingDictionary allKeys];
  v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [(NSMutableDictionary *)self->_backingDictionary objectForKeyedSubscript:v12];
        if ([v13 containsObject:v4])
        {
          [v5 addObject:v12];
          [v13 removeObject:v4];
        }
        v14 = [v13 anyObject];

        if (!v14) {
          [(NSMutableDictionary *)self->_backingDictionary setObject:0 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end