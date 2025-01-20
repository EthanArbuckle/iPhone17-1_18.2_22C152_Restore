@interface BLSPendingBacklightProxy
- (BLSPendingBacklightProxy)init;
- (BOOL)deviceSupportsAlwaysOn;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isTransitioning;
- (id)performChangeRequest:(id)a3;
- (int64_t)backlightState;
- (int64_t)flipbookState;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)replaceWithBacklightProxy:(id)a3;
@end

@implementation BLSPendingBacklightProxy

- (BLSPendingBacklightProxy)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLSPendingBacklightProxy;
  v2 = [(BLSPendingBacklightProxy *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    requests = v3->_requests;
    v3->_requests = (NSMutableArray *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:2];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v6;
  }
  return v3;
}

- (int64_t)backlightState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy) {
    int64_t v5 = [(BLSBacklightProxy *)replacementBacklightProxy backlightState];
  }
  else {
    int64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (int64_t)flipbookState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy) {
    int64_t v5 = [(BLSBacklightProxy *)replacementBacklightProxy flipbookState];
  }
  else {
    int64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isTransitioning
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy) {
    char v5 = [(BLSBacklightProxy *)replacementBacklightProxy isTransitioning];
  }
  else {
    char v5 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isAlwaysOnEnabled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy) {
    char v5 = [(BLSBacklightProxy *)replacementBacklightProxy isAlwaysOnEnabled];
  }
  else {
    char v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)deviceSupportsAlwaysOn
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy) {
    char v5 = [(BLSBacklightProxy *)replacementBacklightProxy deviceSupportsAlwaysOn];
  }
  else {
    char v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy) {
    [(BLSBacklightProxy *)replacementBacklightProxy addObserver:v5];
  }
  else {
    [(NSHashTable *)self->_observers addObject:v5];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy) {
    [(BLSBacklightProxy *)replacementBacklightProxy removeObserver:v5];
  }
  else {
    [(NSHashTable *)self->_observers removeObject:v5];
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)performChangeRequest:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
  {
    v7 = replacementBacklightProxy;
    os_unfair_lock_unlock(p_lock);
    v8 = [(BLSBacklightProxy *)v7 performChangeRequest:v4];
  }
  else
  {
    requests = self->_requests;
    id v10 = 0;
    [(NSMutableArray *)requests addObject:v4];

    os_unfair_lock_unlock(p_lock);
    v8 = 0;
  }

  return v8;
}

- (void)replaceWithBacklightProxy:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_replacementBacklightProxy, a3);
  uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
  observers = self->_observers;
  self->_observers = 0;

  v8 = self->_requests;
  requests = self->_requests;
  self->_requests = 0;

  os_unfair_lock_unlock(&self->_lock);
  id v10 = bls_assertions_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v33 = self;
    __int16 v34 = 1024;
    int v35 = [v6 count];
    __int16 v36 = 1024;
    int v37 = [(NSMutableArray *)v8 count];
    _os_log_debug_impl(&dword_1B55DE000, v10, OS_LOG_TYPE_DEBUG, "%p backlight proxy setup, will set %u observers, perform %u requests", buf, 0x18u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        [v5 addObserver:*(void *)(*((void *)&v26 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v13);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = v8;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = (id)objc_msgSend(v5, "performChangeRequest:", *(void *)(*((void *)&v22 + 1) + 8 * v20++), (void)v22);
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementBacklightProxy, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

@end