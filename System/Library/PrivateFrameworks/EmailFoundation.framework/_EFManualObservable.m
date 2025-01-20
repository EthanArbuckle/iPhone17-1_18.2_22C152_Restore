@interface _EFManualObservable
- (BOOL)_addObserver:(id)a3 failureError:(id *)a4;
- (_EFManualObservable)init;
- (id)subscribe:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _EFManualObservable

- (id)subscribe:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  BOOL v5 = [(_EFManualObservable *)self _addObserver:v4 failureError:&v12];
  id v6 = v12;
  v7 = objc_alloc_init(EFCancelationToken);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33___EFManualObservable_subscribe___block_invoke;
  v10[3] = &unk_1E6121B90;
  v10[4] = self;
  id v8 = v4;
  id v11 = v8;
  [(EFCancelationToken *)v7 addCancelationBlock:v10];
  if (v5)
  {
    if (v6) {
      [v8 observerDidFailWithError:v6];
    }
    else {
      [v8 observerDidComplete];
    }
  }

  return v7;
}

- (BOOL)_addObserver:(id)a3 failureError:(id *)a4
{
  v7 = (_EFManualObservable *)a3;
  if (v7 == self)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:v7 file:@"_EFManualObservable.m" lineNumber:107 description:@"can't observe self"];

    if (a4) {
      goto LABEL_3;
    }
  }
  else if (a4)
  {
    goto LABEL_3;
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2 object:self file:@"_EFManualObservable.m" lineNumber:108 description:@"out variable should always be provided"];

LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  BOOL didCompleteOrFail = self->_didCompleteOrFail;
  if (self->_didCompleteOrFail) {
    *a4 = self->_failureError;
  }
  else {
    [(NSMutableArray *)self->_observers addObject:v7];
  }
  os_unfair_lock_unlock(&self->_lock);

  return didCompleteOrFail;
}

- (void)observerDidReceiveResult:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didCompleteOrFail) {
    id v6 = 0;
  }
  else {
    id v6 = (void *)[(NSMutableArray *)self->_observers copy];
  }
  os_unfair_lock_unlock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "observerDidReceiveResult:", v4, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (_EFManualObservable)init
{
  v7.receiver = self;
  v7.super_class = (Class)_EFManualObservable;
  v2 = [(_EFManualObservable *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v2->_observers;
    v2->_observers = v3;

    failureError = v2->_failureError;
    v2->_failureError = 0;

    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_BOOL didCompleteOrFail = 0;
  }
  return v2;
}

- (void)observerDidComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didCompleteOrFail)
  {
    id v4 = 0;
  }
  else
  {
    self->_BOOL didCompleteOrFail = 1;
    id v4 = (void *)[(NSMutableArray *)self->_observers copy];
  }
  os_unfair_lock_unlock(p_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "observerDidComplete", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)observerDidFailWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didCompleteOrFail)
  {
    uint64_t v7 = 0;
  }
  else
  {
    self->_BOOL didCompleteOrFail = 1;
    objc_storeStrong((id *)&self->_failureError, a3);
    uint64_t v7 = (void *)[(NSMutableArray *)self->_observers copy];
  }
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "observerDidFailWithError:", v5, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureError, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end