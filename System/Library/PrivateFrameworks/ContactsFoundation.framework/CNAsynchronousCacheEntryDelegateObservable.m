@interface CNAsynchronousCacheEntryDelegateObservable
- (CNAsynchronousCacheEntryDelegateObservable)init;
- (id)subscribe:(id)a3;
- (void)cacheEntryDidUpdateValue:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation CNAsynchronousCacheEntryDelegateObservable

- (CNAsynchronousCacheEntryDelegateObservable)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNAsynchronousCacheEntryDelegateObservable;
  v2 = [(CNAsynchronousCacheEntryDelegateObservable *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = v2;
  }

  return v2;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  [(NSMutableArray *)self->_observers addObject:v4];
  id v6 = self->_currentValue;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __56__CNAsynchronousCacheEntryDelegateObservable_subscribe___block_invoke;
  v14 = &unk_1E569F310;
  v15 = self;
  id v7 = v4;
  id v16 = v7;
  v8 = +[CNCancelationToken tokenWithCancelationBlock:&v11];

  objc_sync_exit(v5);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v12, v13, v14, v15);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v9) {
      [v7 observerDidReceiveResult:v6];
    }
  }

  return v8;
}

uint64_t __56__CNAsynchronousCacheEntryDelegateObservable_subscribe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)cacheEntryDidUpdateValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_observers;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSMutableArray *)self->_observers copy];
  id v7 = [v4 currentValue];
  id currentValue = self->_currentValue;
  self->_id currentValue = v7;

  objc_sync_exit(v5);
  id v9 = [v4 currentValue];
  v10 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v9);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "observerDidReceiveResult:", v10, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentValue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end