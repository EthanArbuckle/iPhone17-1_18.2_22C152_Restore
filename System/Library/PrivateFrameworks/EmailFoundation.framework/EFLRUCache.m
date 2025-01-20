@interface EFLRUCache
+ (OS_os_log)log;
- (EFLRUCache)initWithCapacity:(unint64_t)a3;
- (NSMutableDictionary)nodesByKey;
- (NSString)ef_publicDescription;
- (_EFLRUCacheNode)firstNode;
- (_EFLRUCacheNode)lastNode;
- (id)objectForKey:(id)a3;
- (id)test_firstNode;
- (id)test_lastNode;
- (unint64_t)capacity;
- (unint64_t)size;
- (unint64_t)test_size;
- (void)_pruneLastObject;
- (void)_pushToTop:(id)a3;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)removeAllObjects;
- (void)setFirstNode:(id)a3;
- (void)setLastNode:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation EFLRUCache

- (EFLRUCache)initWithCapacity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EFLRUCache;
  v4 = [(EFLRUCache *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nodesByKey = v5->_nodesByKey;
    v5->_nodesByKey = v6;

    v5->_size = 0;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __17__EFLRUCache_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  v2 = (void *)log_log_4;
  return (OS_os_log *)v2;
}

void __17__EFLRUCache_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(EFLRUCache *)self nodesByKey];
  objc_super v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v10 = +[EFLRUCache log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[EFLRUCache addObject:forKey:](v10);
    }
  }
  else
  {
    unint64_t v11 = [(EFLRUCache *)self size];
    if (v11 >= [(EFLRUCache *)self capacity]) {
      [(EFLRUCache *)self _pruneLastObject];
    }
    v12 = [[_EFLRUCacheNode alloc] initWithKey:v7 element:v6];
    v13 = [(EFLRUCache *)self nodesByKey];
    [v13 setObject:v12 forKeyedSubscript:v7];

    [(EFLRUCache *)self setSize:[(EFLRUCache *)self size] + 1];
    v14 = [(EFLRUCache *)self lastNode];

    objc_super v9 = v12;
    if (!v14) {
      [(EFLRUCache *)self setLastNode:v12];
    }
  }
  [(EFLRUCache *)self _pushToTop:v9];

  os_unfair_lock_unlock(&self->_lock);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(EFLRUCache *)self nodesByKey];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    [(EFLRUCache *)self _pushToTop:v6];
  }
  os_unfair_lock_unlock(&self->_lock);
  id v7 = [v6 element];

  return v7;
}

- (void)removeAllObjects
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(EFLRUCache *)self nodesByKey];
  v5 = [v4 allValues];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "setNext:", 0, (void)v14);
        [v10 setPrevious:0];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  lastNode = self->_lastNode;
  self->_lastNode = 0;

  firstNode = self->_firstNode;
  self->_firstNode = 0;

  v13 = [(EFLRUCache *)self nodesByKey];
  [v13 removeAllObjects];

  [(EFLRUCache *)self setSize:0];
  os_unfair_lock_unlock(p_lock);
}

- (void)_pushToTop:(id)a3
{
  id v7 = a3;
  id v4 = [v7 next];
  v5 = [v7 previous];
  [v5 setNext:v4];

  [v7 setPrevious:0];
  id v6 = [(EFLRUCache *)self firstNode];
  [v7 setNext:v6];
  [v6 setPrevious:v7];
  [(EFLRUCache *)self setFirstNode:v7];
}

- (void)_pruneLastObject
{
  id v3 = [(EFLRUCache *)self lastNode];
  if (v3)
  {
    id v7 = v3;
    id v4 = [v3 previous];
    v5 = [(EFLRUCache *)self nodesByKey];
    id v6 = [v7 key];
    [v5 removeObjectForKey:v6];

    [v4 setNext:0];
    [(EFLRUCache *)self setLastNode:v4];
    [(EFLRUCache *)self setSize:[(EFLRUCache *)self size] - 1];

    id v3 = v7;
  }
}

- (NSString)ef_publicDescription
{
  return (NSString *)[NSString stringWithFormat:@"%@, Capacity: %lu, Size: %lu ", self, -[EFLRUCache capacity](self, "capacity"), -[EFLRUCache size](self, "size")];
}

- (unint64_t)test_size
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EFLRUCache.m", 150, @"%s can only be called from unit tests", "-[EFLRUCache test_size]");
  }
  return [(EFLRUCache *)self size];
}

- (id)test_firstNode
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EFLRUCache.m", 155, @"%s can only be called from unit tests", "-[EFLRUCache test_firstNode]");
  }
  return [(EFLRUCache *)self firstNode];
}

- (id)test_lastNode
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EFLRUCache.m", 160, @"%s can only be called from unit tests", "-[EFLRUCache test_lastNode]");
  }
  return [(EFLRUCache *)self lastNode];
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (NSMutableDictionary)nodesByKey
{
  return self->_nodesByKey;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (_EFLRUCacheNode)firstNode
{
  return self->_firstNode;
}

- (void)setFirstNode:(id)a3
{
}

- (_EFLRUCacheNode)lastNode
{
  return self->_lastNode;
}

- (void)setLastNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_firstNode, 0);
  objc_storeStrong((id *)&self->_nodesByKey, 0);
}

- (void)addObject:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Attempting to add object that already exist", v1, 2u);
}

@end