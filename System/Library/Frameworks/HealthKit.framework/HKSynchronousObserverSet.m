@interface HKSynchronousObserverSet
- (HKSynchronousObserverSet)initWithName:(id)a3 loggingCategory:(id)a4;
- (NSArray)allObservers;
- (unint64_t)count;
- (void)notifyObservers:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKSynchronousObserverSet

- (HKSynchronousObserverSet)initWithName:(id)a3 loggingCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSynchronousObserverSet;
  v8 = [(HKSynchronousObserverSet *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_category, a4);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observerTable = v8->_observerTable;
    v8->_observerTable = (NSHashTable *)v11;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSHashTable *)self->_observerTable containsObject:v4]) {
    [(NSHashTable *)self->_observerTable addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSHashTable *)self->_observerTable containsObject:v4]) {
    [(NSHashTable *)self->_observerTable removeObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)notifyObservers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSHashTable *)self->_observerTable allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSHashTable *)self->_observerTable count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)allObservers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSHashTable *)self->_observerTable allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_observerTable, 0);
}

@end