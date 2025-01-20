@interface GEOObserverHashTable
- (BOOL)hasObservers;
- (GEOObserverHashTable)init;
- (GEOObserverHashTable)initWithProtocol:(id)a3 queue:(id)a4;
- (NSArray)allObservers;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)count;
- (void)enumerateObserversWithGroup:(id)a3 visitor:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation GEOObserverHashTable

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_observers removeObject:v4];
  [(NSMapTable *)self->_observerQueues removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_observers addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (objc_method_description v7 = protocol_getMethodDescription(self->_protocol, a3, 1, 1), types = v7.types, v7.name))
  {
    v8 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  else
  {
    [(GEOObserverHashTable *)self doesNotRecognizeSelector:a3];
    v8 = 0;
  }

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSHashTable *)self->_observers allObjects];
  objc_method_description v7 = (void *)[(NSMapTable *)self->_observerQueues copy];
  v8 = self->_callbackQueue;
  os_unfair_lock_unlock(p_lock);
  if ([v6 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__GEOObserverHashTable_forwardInvocation___block_invoke;
    v12[3] = &unk_1E53D99F0;
    id v9 = v4;
    id v13 = v9;
    id v14 = v6;
    id v15 = v7;
    uint64_t v10 = MEMORY[0x18C120660](v12);
    v11 = (void *)v10;
    if (v8)
    {
      [v9 retainArguments];
      dispatch_async((dispatch_queue_t)v8, v11);
    }
    else
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
}

void __42__GEOObserverHashTable_forwardInvocation___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] selector];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a1[5];
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    v19 = v23;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v8 = objc_msgSend(a1[6], "objectForKey:", v7, v19);
          if (v8)
          {
            uint64_t v9 = v2;
            uint64_t v10 = (void *)MEMORY[0x1E4F1CA18];
            v11 = [a1[4] methodSignature];
            v12 = [v10 invocationWithMethodSignature:v11];

            objc_msgSend(v12, "setSelector:", objc_msgSend(a1[4], "selector"));
            id v13 = [a1[4] methodSignature];
            uint64_t v14 = [v13 numberOfArguments];

            if (v14)
            {
              unint64_t v15 = 0;
              do
              {
                uint64_t v26 = 0;
                [a1[4] getArgument:&v26 atIndex:v15];
                [v12 setArgument:&v26 atIndex:v15++];
                v16 = [a1[4] methodSignature];
                unint64_t v17 = [v16 numberOfArguments];
              }
              while (v15 < v17);
            }
            [v12 retainArguments];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v23[0] = __42__GEOObserverHashTable_forwardInvocation___block_invoke_2;
            v23[1] = &unk_1E53D8998;
            id v24 = v12;
            uint64_t v25 = v7;
            id v18 = v12;
            dispatch_async(v8, block);

            uint64_t v2 = v9;
            uint64_t v5 = v20;
          }
          else
          {
            [a1[4] invokeWithTarget:v7];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v4);
  }
}

- (GEOObserverHashTable)initWithProtocol:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOObserverHashTable;
  uint64_t v9 = [(GEOObserverHashTable *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_protocol, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:1];
    observerQueues = v10->_observerQueues;
    v10->_observerQueues = (NSMapTable *)v13;

    objc_storeStrong((id *)&v10->_callbackQueue, a4);
    unint64_t v15 = v10;
  }

  return v10;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_observers addObject:v7];
  [(NSMapTable *)self->_observerQueues setObject:v6 forKey:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerQueues, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

- (NSArray)allObservers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (BOOL)hasObservers
{
  return [(GEOObserverHashTable *)self count] != 0;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSHashTable *)self->_observers allObjects];
  unint64_t v5 = [v4 count];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

uint64_t __42__GEOObserverHashTable_forwardInvocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithTarget:*(void *)(a1 + 40)];
}

- (GEOObserverHashTable)init
{
  result = (GEOObserverHashTable *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)enumerateObserversWithGroup:(id)a3 visitor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v10 = (void *)[(NSMapTable *)self->_observerQueues copy];
  uint64_t v11 = self->_callbackQueue;
  os_unfair_lock_unlock(p_lock);
  if ([v9 count])
  {
    if (v6 && [v9 count])
    {
      unint64_t v12 = 0;
      do
      {
        dispatch_group_enter(v6);
        ++v12;
      }
      while (v12 < [v9 count]);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke;
    v15[3] = &unk_1E53D9B30;
    id v16 = v9;
    id v17 = v10;
    id v19 = v7;
    id v18 = v6;
    uint64_t v13 = (void (**)(void))MEMORY[0x18C120660](v15);
    uint64_t v14 = v13;
    if (v11) {
      dispatch_async((dispatch_queue_t)v11, v13);
    }
    else {
      v13[2](v13);
    }
  }
}

void __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [a1[5] objectForKey:v7];
        if (v8)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          void block[2] = __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke_2;
          block[3] = &unk_1E53D95B8;
          id v12 = a1[7];
          block[4] = v7;
          id v11 = a1[6];
          dispatch_async(v8, block);
        }
        else
        {
          (*((void (**)(void))a1[7] + 2))();
          uint64_t v9 = a1[6];
          if (v9) {
            dispatch_group_leave(v9);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
  }
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSHashTable *)self->_observers copy];
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"GEOObserverHashTable observers count: %d", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"\n\t%@ (%p)", objc_opt_class(), *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

@end