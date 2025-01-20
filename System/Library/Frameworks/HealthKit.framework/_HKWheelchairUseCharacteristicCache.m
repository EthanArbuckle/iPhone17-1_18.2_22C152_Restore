@interface _HKWheelchairUseCharacteristicCache
- (BOOL)_lock_isWheelchairUser;
- (BOOL)_lock_needsFetch;
- (BOOL)hasFetchedWheelchairUse;
- (BOOL)isWheelchairUser;
- (_HKWheelchairUseCharacteristicCache)initWithHealthStore:(id)a3;
- (void)_alertObservers:(id)a3 didUpdateToWheelchairUser:(BOOL)a4;
- (void)_handleFetchError:(id)a3;
- (void)_handleFetchSuccess:(id)a3;
- (void)_lock_fetchWheelchairUse;
- (void)_lock_fetchWheelchairUseIfNecessary;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation _HKWheelchairUseCharacteristicCache

- (_HKWheelchairUseCharacteristicCache)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKWheelchairUseCharacteristicCache;
  v6 = [(_HKWheelchairUseCharacteristicCache *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_state = 0;
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    uint64_t v10 = HKCreateSerialDispatchQueue(0, @"fetchingQueue");
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v7->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v7->_lock);
    [(_HKWheelchairUseCharacteristicCache *)v7 _lock_fetchWheelchairUse];
    os_unfair_lock_unlock(&v7->_lock);
    objc_initWeak(&location, v7);
    v12 = MEMORY[0x1E4F14428];
    id v13 = MEMORY[0x1E4F14428];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59___HKWheelchairUseCharacteristicCache_initWithHealthStore___block_invoke;
    v15[3] = &unk_1E58BED68;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.healthd.user-characteristics.did-change", &v7->_characteristicUpdateToken, v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  notify_cancel(self->_characteristicUpdateToken);
  v3.receiver = self;
  v3.super_class = (Class)_HKWheelchairUseCharacteristicCache;
  [(_HKWheelchairUseCharacteristicCache *)&v3 dealloc];
}

- (void)registerObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_alertObservers:(id)a3 didUpdateToWheelchairUser:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) wheelchairUseCharacteristicCache:self wheelchairUsageDidChange:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)isWheelchairUser
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(_HKWheelchairUseCharacteristicCache *)v2 _lock_isWheelchairUser];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isWheelchairUser
{
  return [(HKWheelchairUseObject *)self->_wheelchairUseObject wheelchairUse] == HKWheelchairUseYes;
}

- (BOOL)hasFetchedWheelchairUse
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_wheelchairUseObject != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_needsFetch
{
  return self->_state == 0;
}

- (void)_lock_fetchWheelchairUseIfNecessary
{
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(_HKWheelchairUseCharacteristicCache *)self _lock_needsFetch])
  {
    [(_HKWheelchairUseCharacteristicCache *)self _lock_fetchWheelchairUse];
  }
}

- (void)_lock_fetchWheelchairUse
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_state = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleFetchError:(id)a3
{
  id v4 = a3;
  if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      -[_HKWheelchairUseCharacteristicCache _handleFetchError:]((uint64_t)v4, v5);
    }
  }
  int v6 = objc_msgSend(v4, "hk_isDatabaseAccessibilityError");
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    self->_state = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    int64_t queryRetries = self->_queryRetries;
    self->_int64_t queryRetries = queryRetries + 1;
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v8 = 5;
    if (queryRetries < 5) {
      uint64_t v8 = queryRetries;
    }
    dispatch_time_t v9 = dispatch_time(0, 1000000000 * v8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57___HKWheelchairUseCharacteristicCache__handleFetchError___block_invoke;
    block[3] = &unk_1E58BBA00;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
  }
}

- (void)_handleFetchSuccess:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  wheelchairUseObject = self->_wheelchairUseObject;
  self->_state = 2;
  self->_int64_t queryRetries = 0;
  uint64_t v7 = [(HKWheelchairUseObject *)wheelchairUseObject wheelchairUse];
  if (v7 == [v5 wheelchairUse])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v8 = (id)HKLogDefault;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HKWheelchairUse v9 = [(HKWheelchairUseObject *)self->_wheelchairUseObject wheelchairUse];
      if ((unint64_t)v9 > HKWheelchairUseYes) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = off_1E58C7F18[v9];
      }
      unint64_t v11 = [v5 wheelchairUse];
      if (v11 > 2) {
        long long v12 = 0;
      }
      else {
        long long v12 = off_1E58C7F18[v11];
      }
      int v16 = 138412802;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "%@: Wheelchair Use changed from \"%@\" to \"%@\", notifying observers.", (uint8_t *)&v16, 0x20u);
    }

    objc_storeStrong((id *)&self->_wheelchairUseObject, a3);
    BOOL v13 = [(_HKWheelchairUseCharacteristicCache *)self _lock_isWheelchairUser];
    long long v14 = [(NSHashTable *)self->_observers allObjects];
    v15 = (void *)[v14 copy];

    os_unfair_lock_unlock(&self->_lock);
    [(_HKWheelchairUseCharacteristicCache *)self _alertObservers:v15 didUpdateToWheelchairUser:v13];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wheelchairUseObject, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_handleFetchError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error loading wheelchair use characteristic: %@", (uint8_t *)&v2, 0xCu);
}

@end