@interface SCNOrderedDictionary
- (id)allKeys;
- (id)allValues;
- (id)copy;
- (id)description;
- (id)dictionary;
- (id)keys;
- (id)objectAtIndex:(int64_t)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)_setupFrom:(id)a3;
- (void)applyBlock:(id)a3;
- (void)applyFunction:(void *)a3 withContext:(void *)a4;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SCNOrderedDictionary

- (id)allKeys
{
  v2 = (void *)[(NSMutableArray *)self->_keys copy];

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNOrderedDictionary;
  [(SCNOrderedDictionary *)&v3 dealloc];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  [(SCNOrderedDictionary *)self removeObjectForKey:a4];
  if (a3)
  {
    keys = self->_keys;
    if (!keys)
    {
      self->_keys = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_keyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      keys = self->_keys;
    }
    [(NSMutableArray *)keys addObject:a4];
    keyValues = self->_keyValues;
    [(NSMutableDictionary *)keyValues setObject:a3 forKey:a4];
  }
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_keyValues objectForKey:a3];
}

- (id)objectAtIndex:(int64_t)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_keys objectAtIndex:a3];

  return [(SCNOrderedDictionary *)self objectForKey:v4];
}

- (void)removeObjectForKey:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->_keyValues, "objectForKey:"))
  {
    if ([(NSMutableArray *)self->_keys count] == 1)
    {
      [(SCNOrderedDictionary *)self removeAllObjects];
    }
    else
    {
      [(NSMutableArray *)self->_keys removeObject:a3];
      keyValues = self->_keyValues;
      [(NSMutableDictionary *)keyValues removeObjectForKey:a3];
    }
  }
}

- (void)removeAllObjects
{
  self->_keys = 0;
  self->_keyValues = 0;
}

- (void)applyFunction:(void *)a3 withContext:(void *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  keys = self->_keys;
  uint64_t v8 = [(NSMutableArray *)keys countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(keys);
        }
        ((void (*)(void, uint64_t, void *))a3)(*(void *)(*((void *)&v12 + 1) + 8 * i), [(NSMutableDictionary *)self->_keyValues objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)], a4);
      }
      uint64_t v9 = [(NSMutableArray *)keys countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)applyBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  keys = self->_keys;
  uint64_t v6 = [(NSMutableArray *)keys countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(keys);
        }
        (*((void (**)(id, void, uint64_t))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8 * i), [(NSMutableDictionary *)self->_keyValues objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * i)]);
      }
      uint64_t v7 = [(NSMutableArray *)keys countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_keys count];
}

- (id)allValues
{
  return (id)[(NSMutableDictionary *)self->_keyValues allValues];
}

- (id)dictionary
{
  return self->_keyValues;
}

- (id)keys
{
  return self->_keys;
}

- (void)_setupFrom:(id)a3
{
  self->_keyValues = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "dictionary"), "mutableCopy");
  self->_keys = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "keys"), "mutableCopy");
}

- (id)copy
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [v3 _setupFrom:self];
  return v3;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = (void *)[v3 stringWithFormat:@"<%@: %p\n{\n", NSStringFromClass(v4), self];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  keys = self->_keys;
  uint64_t v7 = [(NSMutableArray *)keys countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(keys);
        }
        [v5 appendFormat:@"    \"%@\" = \"%@\"\n", *(void *)(*((void *)&v12 + 1) + 8 * i), -[NSMutableDictionary objectForKeyedSubscript:](self->_keyValues, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i))];
      }
      uint64_t v8 = [(NSMutableArray *)keys countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [v5 appendString:@"}>"];
  return v5;
}

@end