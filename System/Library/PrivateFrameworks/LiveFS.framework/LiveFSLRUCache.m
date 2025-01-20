@interface LiveFSLRUCache
- (LiveFSLRUCache)init;
- (NSMutableArray)usageOrder;
- (NSMutableDictionary)mapping;
- (id)objectForKey:(id)a3;
- (id)objectForKeyLocked:(id)a3;
- (int)countLimit;
- (void)removeAllObjects;
- (void)removeLastItem;
- (void)removeObjectForKey:(id)a3;
- (void)setCountLimit:(int)a3;
- (void)setMapping:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setUsageOrder:(id)a3;
@end

@implementation LiveFSLRUCache

- (LiveFSLRUCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)LiveFSLRUCache;
  v2 = [(LiveFSLRUCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mapping = v2->_mapping;
    v2->_mapping = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    usageOrder = v2->_usageOrder;
    v2->_usageOrder = (NSMutableArray *)v5;
  }
  return v2;
}

- (int)countLimit
{
  return self->_countLimit;
}

- (void)setCountLimit:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  int countLimit = obj->_countLimit;
  obj->_int countLimit = a3;
  while (countLimit > a3)
  {
    [(LiveFSLRUCache *)obj removeLastItem];
    --countLimit;
  }
  objc_sync_exit(obj);
}

- (id)objectForKeyLocked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_mapping objectForKey:v4];
  if (v5)
  {
    [(NSMutableArray *)self->_usageOrder removeObject:v4];
    [(NSMutableArray *)self->_usageOrder addObject:v4];
  }

  return v5;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v6 = [(LiveFSLRUCache *)v5 objectForKeyLocked:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)removeLastItem
{
  id v3 = [(NSMutableArray *)self->_usageOrder objectAtIndex:0];
  [(NSMutableArray *)self->_usageOrder removeObjectAtIndex:0];
  [(NSMutableDictionary *)self->_mapping removeObjectForKey:v3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_super v8 = [(LiveFSLRUCache *)v7 objectForKeyLocked:v6];

  if (!v8)
  {
    if ([(NSMutableDictionary *)v7->_mapping count] >= (unint64_t)v7->_countLimit) {
      [(LiveFSLRUCache *)v7 removeLastItem];
    }
    [(NSMutableDictionary *)v7->_mapping setObject:v9 forKey:v6];
    [(NSMutableArray *)v7->_usageOrder addObject:v6];
  }
  objc_sync_exit(v7);
}

- (void)removeAllObjects
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_mapping removeAllObjects];
  [(NSMutableArray *)obj->_usageOrder removeAllObjects];
  objc_sync_exit(obj);
}

- (void)removeObjectForKey:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableDictionary *)v4->_mapping objectForKey:v6];

  if (v5)
  {
    [(NSMutableArray *)v4->_usageOrder removeObject:v6];
    [(NSMutableDictionary *)v4->_mapping removeObjectForKey:v6];
  }
  objc_sync_exit(v4);
}

- (NSMutableDictionary)mapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMapping:(id)a3
{
}

- (NSMutableArray)usageOrder
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUsageOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOrder, 0);

  objc_storeStrong((id *)&self->_mapping, 0);
}

@end