@interface PHAssociatedObjectsEntry
- (PHAssociatedObjectsEntry)init;
- (id)associatedObjectForKey:(os_unfair_lock_s *)a1;
- (id)setAssociatedObjectIfNotSet:(void *)a3 forKey:;
- (void)setAssociatedObject:(void *)a3 forKey:;
@end

@implementation PHAssociatedObjectsEntry

- (id)associatedObjectForKey:(os_unfair_lock_s *)a1
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 2;
    id v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 8));
    uint64_t v2 = [*(id *)(v2 + 16) objectForKeyedSubscript:v4];

    os_unfair_lock_unlock(v3);
  }

  return (id)v2;
}

- (PHAssociatedObjectsEntry)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHAssociatedObjectsEntry;
  uint64_t v2 = [(PHAssociatedObjectsEntry *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    associatedObjects = v3->_associatedObjects;
    v3->_associatedObjects = v4;

    v6 = v3;
  }

  return v3;
}

- (id)setAssociatedObjectIfNotSet:(void *)a3 forKey:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v7 = [*(id *)(a1 + 16) objectForKeyedSubscript:v6];
    if (!v7)
    {
      [*(id *)(a1 + 16) setObject:v5 forKeyedSubscript:v6];
      id v7 = v5;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)setAssociatedObject:(void *)a3 forKey:
{
  if (a1)
  {
    id v5 = (os_unfair_lock_s *)(a1 + 8);
    id v6 = a3;
    id v7 = a2;
    os_unfair_lock_lock(v5);
    [*(id *)(a1 + 16) setObject:v7 forKeyedSubscript:v6];

    os_unfair_lock_unlock(v5);
  }
}

@end