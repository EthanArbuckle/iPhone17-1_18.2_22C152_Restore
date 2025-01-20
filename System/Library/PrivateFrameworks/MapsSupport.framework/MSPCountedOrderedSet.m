@interface MSPCountedOrderedSet
- (BOOL)containsObject:(id)a3;
- (MSPCountedOrderedSet)init;
- (NSArray)array;
- (NSOrderedSet)contents;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (void)_addObjectNoLock:(id)a3;
- (void)_removeObjectNoLock:(id)a3;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeObjectsFromArray:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation MSPCountedOrderedSet

- (MSPCountedOrderedSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSPCountedOrderedSet;
  v2 = [(MSPCountedOrderedSet *)&v8 init];
  if (v2)
  {
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    counts = v2->_counts;
    v2->_counts = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    set = v2->_set;
    v2->_set = v5;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSOrderedSet)contents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableOrderedSet *)self->_set copy];
  os_unfair_lock_unlock(p_lock);

  return (NSOrderedSet *)v4;
}

- (NSArray)array
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableOrderedSet *)self->_set array];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableOrderedSet *)self->_set count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addObject:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(MSPCountedOrderedSet *)self _addObjectNoLock:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_addObjectNoLock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    NSUInteger v5 = [(NSCountedSet *)self->_counts countForObject:v4];
    [(NSCountedSet *)self->_counts addObject:v6];
    if (!v5) {
      [(NSMutableOrderedSet *)self->_set addObject:v6];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)unionSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
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
          -[MSPCountedOrderedSet _addObjectNoLock:](self, "_addObjectNoLock:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)addObjectsFromArray:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a3];
  [(MSPCountedOrderedSet *)self unionSet:v4];
}

- (void)removeObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(MSPCountedOrderedSet *)self _removeObjectNoLock:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeObjectNoLock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    [(NSCountedSet *)self->_counts removeObject:v4];
    if (![(NSCountedSet *)self->_counts countForObject:v5]) {
      [(NSMutableOrderedSet *)self->_set removeObject:v5];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)minusSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
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
          -[MSPCountedOrderedSet _removeObjectNoLock:](self, "_removeObjectNoLock:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)removeObjectsFromArray:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [(MSPCountedOrderedSet *)self minusSet:v4];
}

- (BOOL)containsObject:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = [(NSMutableOrderedSet *)v3->_set containsObject:v5];

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (unint64_t)countForObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t v6 = [(NSCountedSet *)self->_counts countForObject:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v10 = [(NSMutableOrderedSet *)self->_set countByEnumeratingWithState:a3 objects:a4 count:a5];
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);

  objc_storeStrong((id *)&self->_counts, 0);
}

@end