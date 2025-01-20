@interface ACDQueueDictionary
- (ACDQueueDictionary)init;
- (BOOL)isEmpty;
- (BOOL)isQueueEmptyForKey:(id)a3;
- (id)dequeueAllObjectsInQueueForKey:(id)a3;
- (id)dequeueFirstObjectInQueueForKey:(id)a3;
- (id)description;
- (id)firstObjectInQueueForKey:(id)a3;
- (id)keyForRandomQueue;
- (void)addObject:(id)a3 toQueueForKey:(id)a4;
@end

@implementation ACDQueueDictionary

- (ACDQueueDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACDQueueDictionary;
  v2 = [(ACDQueueDictionary *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    allQueuesByID = v2->_allQueuesByID;
    v2->_allQueuesByID = v3;
  }
  return v2;
}

- (BOOL)isEmpty
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)v2->_allQueuesByID allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if (![(ACDQueueDictionary *)v2 isQueueEmptyForKey:*(void *)(*((void *)&v9 + 1) + 8 * i)])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)isQueueEmptyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)v5->_allQueuesByID objectForKeyedSubscript:v4];
  BOOL v7 = [v6 count] == 0;

  objc_sync_exit(v5);
  return v7;
}

- (void)addObject:(id)a3 toQueueForKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMutableDictionary *)v7->_allQueuesByID objectForKeyedSubscript:v6];
  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  if (v9) {
    [v8 addObject:v9];
  }
  [(NSMutableDictionary *)v7->_allQueuesByID setObject:v8 forKey:v6];

  objc_sync_exit(v7);
}

- (id)dequeueFirstObjectInQueueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_allQueuesByID objectForKeyedSubscript:v4];
  BOOL v7 = [v6 firstObject];
  if (v7)
  {
    [v6 removeObjectAtIndex:0];
    [(NSMutableDictionary *)v5->_allQueuesByID setObject:v6 forKey:v4];
  }

  objc_sync_exit(v5);

  return v7;
}

- (id)firstObjectInQueueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_allQueuesByID objectForKeyedSubscript:v4];
  BOOL v7 = [v6 firstObject];

  objc_sync_exit(v5);

  return v7;
}

- (id)dequeueAllObjectsInQueueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_allQueuesByID objectForKeyedSubscript:v4];
  if (v6) {
    [(NSMutableDictionary *)v5->_allQueuesByID removeObjectForKey:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)keyForRandomQueue
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_allQueuesByID allKeys];
  id v4 = [v3 firstObject];

  objc_sync_exit(v2);

  return v4;
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->_allQueuesByID description];
}

- (void).cxx_destruct
{
}

@end