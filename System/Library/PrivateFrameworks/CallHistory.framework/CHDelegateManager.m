@interface CHDelegateManager
- (CHDelegateManager)init;
- (NSMapTable)delegateToQueue;
- (os_unfair_lock_s)accessorLock;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)performDelegateSelector:(SEL)a3;
- (void)performDelegateSelector:(SEL)a3 withDelegate:(id)a4;
- (void)removeDelegate:(id)a3;
@end

@implementation CHDelegateManager

- (void).cxx_destruct
{
}

- (CHDelegateManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CHDelegateManager;
  v2 = [(CHDelegateManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v4;
  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  p_accessorLock = &self->_accessorLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_accessorLock);
  v9 = [(CHDelegateManager *)self delegateToQueue];
  [v9 setObject:v7 forKey:v8];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeDelegate:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  v6 = [(CHDelegateManager *)self delegateToQueue];
  [v6 removeObjectForKey:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)performDelegateSelector:(SEL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CHDelegateManager *)self delegateToQueue];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          v11 = [(CHDelegateManager *)self delegateToQueue];
          v12 = [v11 objectForKey:v10];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __45__CHDelegateManager_performDelegateSelector___block_invoke;
          block[3] = &unk_1E61C7740;
          block[5] = v10;
          block[6] = a3;
          block[4] = self;
          dispatch_async(v12, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

uint64_t __45__CHDelegateManager_performDelegateSelector___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performDelegateSelector:*(void *)(a1 + 48) withDelegate:*(void *)(a1 + 40)];
}

- (void)performDelegateSelector:(SEL)a3 withDelegate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  uint64_t v8 = NSString;
  uint64_t v9 = NSStringFromSelector(a2);
  uint64_t v10 = [v8 stringWithFormat:@"Subclass is required to override %@", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

@end