@interface MCMLRUCache
- (MCMDoublyLinkedList)mruItems;
- (MCMLRUCache)init;
- (MCMLRUCache)initWithName:(id)a3 maxCount:(unint64_t)a4;
- (NSMutableDictionary)storage;
- (NSString)name;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)maxCount;
- (void)removeAllObjects;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MCMLRUCache

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(MCMLRUCache *)self mruItems];
  uint64_t v9 = [v8 count];
  v10 = [(MCMLRUCache *)self storage];
  uint64_t v11 = [v10 count];

  if (v9 != v11)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    v31 = [(MCMLRUCache *)self mruItems];
    uint64_t v32 = [v31 count];
    self = [(MCMLRUCache *)self storage];
    int v39 = 134218240;
    uint64_t v40 = v32;
    __int16 v41 = 2048;
    unint64_t v42 = [(MCMLRUCache *)self count];
    LODWORD(v38) = 22;
    v37 = &v39;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_13;
  }
  v12 = [(MCMLRUCache *)self storage];
  v13 = [v12 objectForKey:v7];

  if (v13)
  {
    [(MCMDoublyLinkedListNode *)v13 setData:v6];
    v14 = [(MCMLRUCache *)self mruItems];
    [v14 removeNodeAndAddToTail:v13];
  }
  else
  {
    unint64_t v15 = [(MCMLRUCache *)self maxCount];
    v16 = [(MCMLRUCache *)self mruItems];
    uint64_t v17 = [v16 count];

    if (v15 == v17)
    {
      v18 = [(MCMLRUCache *)self mruItems];
      v13 = [v18 removeFromHead];

      v19 = container_log_handle_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v27 = [(MCMLRUCache *)self name];
        v28 = [(MCMLRUCache *)self storage];
        v29 = [(MCMDoublyLinkedListNode *)v13 key];
        v30 = [v28 objectForKeyedSubscript:v29];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v30;
        _os_log_debug_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEBUG, "[%@] Evicting from cache: %@", buf, 0x16u);
      }
      v20 = [(MCMLRUCache *)self storage];
      v21 = [(MCMDoublyLinkedListNode *)v13 key];
      [v20 setObject:0 forKeyedSubscript:v21];

      [(MCMDoublyLinkedListNode *)v13 setKey:v7];
      [(MCMDoublyLinkedListNode *)v13 setData:v6];
    }
    else
    {
      v13 = [[MCMDoublyLinkedListNode alloc] initWithKey:v7 data:v6];
    }
    v22 = [(MCMLRUCache *)self mruItems];
    [v22 addToTail:v13];

    v14 = [(MCMLRUCache *)self storage];
    [v14 setObject:v13 forKeyedSubscript:v7];
  }

  v23 = [(MCMLRUCache *)self mruItems];
  uint64_t v24 = [v23 count];
  v25 = [(MCMLRUCache *)self storage];
  uint64_t v26 = [v25 count];

  if (v24 != v26)
  {
LABEL_13:
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    v33 = [(MCMLRUCache *)self mruItems];
    uint64_t v34 = [v33 count];
    v35 = [(MCMLRUCache *)self storage];
    uint64_t v36 = [v35 count];
    int v39 = 134218240;
    uint64_t v40 = v34;
    __int16 v41 = 2048;
    unint64_t v42 = v36;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)objectForKey:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(MCMLRUCache *)self mruItems];
  uint64_t v6 = [v5 count];
  id v7 = [(MCMLRUCache *)self storage];
  uint64_t v8 = [v7 count];

  if (v6 != v8)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    v21 = [(MCMLRUCache *)self mruItems];
    uint64_t v22 = [v21 count];
    self = [(MCMLRUCache *)self storage];
    int v29 = 134218240;
    uint64_t v30 = v22;
    __int16 v31 = 2048;
    unint64_t v32 = [(MCMLRUCache *)self count];
    LODWORD(v28) = 22;
    v27 = &v29;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v9 = [(MCMLRUCache *)self storage];
  v10 = [v9 objectForKeyedSubscript:v4];

  if (v10)
  {
    uint64_t v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(MCMLRUCache *)self name];
      v20 = [v10 data];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_debug_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEBUG, "[%@] Cache hit: %@", buf, 0x16u);
    }
    v12 = [(MCMLRUCache *)self mruItems];
    [v12 removeNodeAndAddToTail:v10];
  }
  v13 = [v10 data];
  v14 = [(MCMLRUCache *)self mruItems];
  uint64_t v15 = [v14 count];
  v16 = [(MCMLRUCache *)self storage];
  uint64_t v17 = [v16 count];

  if (v15 != v17)
  {
LABEL_11:
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    v23 = [(MCMLRUCache *)self mruItems];
    uint64_t v24 = [v23 count];
    v25 = [(MCMLRUCache *)self storage];
    uint64_t v26 = [v25 count];
    int v29 = 134218240;
    uint64_t v30 = v24;
    __int16 v31 = 2048;
    unint64_t v32 = v26;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (MCMDoublyLinkedList)mruItems
{
  return self->_mruItems;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mruItems, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(MCMLRUCache *)self mruItems];
  unint64_t v5 = [v4 count];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)removeAllObjects
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(MCMLRUCache *)self name];
    uint64_t v8 = [(MCMLRUCache *)self mruItems];
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEBUG, "[%@] Evicting items from cache: %@", (uint8_t *)&v9, 0x16u);
  }
  unint64_t v5 = [(MCMLRUCache *)self storage];
  [v5 removeAllObjects];

  uint64_t v6 = [(MCMLRUCache *)self mruItems];
  [v6 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (MCMLRUCache)initWithName:(id)a3 maxCount:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMLRUCache;
  uint64_t v8 = [(MCMLRUCache *)&v15 init];
  int v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_maxCount = a4;
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a4];
    storage = v9->_storage;
    v9->_storage = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    mruItems = v9->_mruItems;
    v9->_mruItems = (MCMDoublyLinkedList *)v12;

    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (MCMLRUCache)init
{
  return [(MCMLRUCache *)self initWithName:@"default" maxCount:10];
}

@end