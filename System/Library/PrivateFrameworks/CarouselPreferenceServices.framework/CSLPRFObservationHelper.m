@interface CSLPRFObservationHelper
- (CSLPRFObservationHelper)init;
- (unint64_t)observerCount;
- (void)addObserver:(id)a3;
- (void)notifyObserversWithBlock:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation CSLPRFObservationHelper

- (void).cxx_destruct
{
}

- (void)notifyObserversWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSHashTable *)self->_lock_observers allObjects];
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

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)observerCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSHashTable *)self->_lock_observers count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (CSLPRFObservationHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFObservationHelper;
  v2 = [(CSLPRFObservationHelper *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v4;
  }
  return v3;
}

@end