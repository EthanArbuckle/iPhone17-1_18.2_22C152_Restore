@interface CARObserverHashTable
- (BOOL)hasObservers;
- (CARObserverHashTable)initWithProtocol:(id)a3;
- (CARObserverHashTable)initWithProtocol:(id)a3 callbackQueue:(id)a4;
- (OS_dispatch_queue)callbackQueue;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CARObserverHashTable

- (void)registerObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (CARObserverHashTable)initWithProtocol:(id)a3 callbackQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CARObserverHashTable;
  v9 = [(CARObserverHashTable *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_protocol, a3);
    objc_storeStrong((id *)&v10->_callbackQueue, a4);
    v10->_observersLock._os_unfair_lock_opaque = 0;
    v11 = v10;
  }

  return v10;
}

- (CARObserverHashTable)initWithProtocol:(id)a3
{
  return [(CARObserverHashTable *)self initWithProtocol:a3 callbackQueue:MEMORY[0x1E4F14428]];
}

- (BOOL)hasObservers
{
  v2 = self;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(p_observersLock);
  LOBYTE(v2) = [(NSHashTable *)v2->_observers count] != 0;
  os_unfair_lock_unlock(p_observersLock);
  return (char)v2;
}

- (void)unregisterObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
  os_unfair_lock_unlock(p_observersLock);
}

- (void)enumerateObserversWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v5 = [(NSHashTable *)self->_observers copy];
  v6 = (void *)v17[5];
  v17[5] = v5;

  os_unfair_lock_unlock(&self->_observersLock);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __52__CARObserverHashTable_enumerateObserversWithBlock___block_invoke;
  objc_super v13 = &unk_1E5E3BE30;
  v15 = &v16;
  id v7 = v4;
  id v14 = v7;
  id v8 = (void *)MEMORY[0x1AD1140A0](&v10);
  v9 = [(CARObserverHashTable *)self callbackQueue];
  dispatch_sync(v9, v8);

  _Block_object_dispose(&v16, 8);
}

void __52__CARObserverHashTable_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectEnumerator];
  uint64_t v3 = 0;
  while (1)
  {
    id v4 = (void *)v3;
    uint64_t v3 = [v2 nextObject];

    if (!v3) {
      break;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  SEL name = MethodDescription.name;
  if (!MethodDescription.name)
  {
    objc_method_description v8 = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
    types = v8.types;
    SEL name = v8.name;
  }
  if (name) {
    BOOL v9 = types == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    [(CARObserverHashTable *)self doesNotRecognizeSelector:a3];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v5 = [(NSHashTable *)self->_observers copy];
  v6 = (void *)v17[5];
  v17[5] = v5;

  os_unfair_lock_unlock(&self->_observersLock);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __42__CARObserverHashTable_forwardInvocation___block_invoke;
  objc_super v13 = &unk_1E5E3BE58;
  id v7 = v4;
  id v14 = v7;
  v15 = &v16;
  objc_method_description v8 = (void *)MEMORY[0x1AD1140A0](&v10);
  objc_msgSend(v7, "retainArguments", v10, v11, v12, v13);
  BOOL v9 = [(CARObserverHashTable *)self callbackQueue];
  dispatch_async(v9, v8);

  _Block_object_dispose(&v16, 8);
}

void __42__CARObserverHashTable_forwardInvocation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) selector];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", v7, (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@ observers count: %d", v5, -[NSHashTable count](self->_observers, "count")];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 appendFormat:@"\n\t%@ (%p)", objc_opt_class(), *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13];
      }
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v6;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end