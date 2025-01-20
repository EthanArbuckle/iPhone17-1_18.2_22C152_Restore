@interface _HKWeakObserversMap
- (_HKWeakObserversMap)init;
- (id)test_observersForKey:(id)a3;
- (void)addObserver:(id)a3 forKey:(id)a4;
- (void)addObserver:(id)a3 queue:(id)a4 forKey:(id)a5;
- (void)notifyObserversOfKey:(id)a3 handler:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forKey:(id)a4;
@end

@implementation _HKWeakObserversMap

- (_HKWeakObserversMap)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKWeakObserversMap;
  v2 = [(_HKWeakObserversMap *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[HKMultimap multimapWithWeakObjects];
    map = v3->_map;
    v3->_map = (HKMultimap *)v4;
  }
  return v3;
}

- (void)addObserver:(id)a3 forKey:(id)a4
{
}

- (void)addObserver:(id)a3 queue:(id)a4 forKey:(id)a5
{
  id object = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  v10 = objc_getAssociatedObject(object, &_HKAssociatedQueueKey);

  if (!v10)
  {
    if (!v8)
    {
      HKCreateSerialDispatchQueue(object, @"_HKWeakObserversMap.queue");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_setAssociatedObject(object, &_HKAssociatedQueueKey, v8, (void *)0x301);
  }
  [(HKMultimap *)self->_map setObject:object forKey:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HKMultimap *)self->_map removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(HKMultimap *)self->_map removeObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyObserversOfKey:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(HKMultimap *)self->_map objectsForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = objc_getAssociatedObject(v13, &_HKAssociatedQueueKey);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __52___HKWeakObserversMap_notifyObserversOfKey_handler___block_invoke;
        block[3] = &unk_1E58BBB10;
        block[4] = self;
        id v17 = v6;
        v18 = v13;
        id v19 = v7;
        dispatch_async(v14, block);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (id)test_observersForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(HKMultimap *)self->_map objectsForKey:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void).cxx_destruct
{
}

@end