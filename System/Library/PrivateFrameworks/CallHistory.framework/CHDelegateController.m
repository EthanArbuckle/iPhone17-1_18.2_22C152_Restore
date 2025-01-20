@interface CHDelegateController
- (CHDelegateController)init;
- (NSMapTable)delegateToQueue;
- (os_unfair_lock_s)delegateLock;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)enumerateDelegatesUsingBlock:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation CHDelegateController

- (CHDelegateController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CHDelegateController;
  v2 = [(CHDelegateController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_delegateLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v4;
  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  v8 = [(CHDelegateController *)self delegateToQueue];
  [v8 setObject:v6 forKey:v9];

  os_unfair_lock_unlock(p_delegateLock);
}

- (void)removeDelegate:(id)a3
{
  id v6 = a3;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  v5 = [(CHDelegateController *)self delegateToQueue];
  [v5 removeObjectForKey:v6];

  os_unfair_lock_unlock(p_delegateLock);
}

- (void)enumerateDelegatesUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, void *, char *))a3;
  os_unfair_lock_lock(&self->_delegateLock);
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(CHDelegateController *)self delegateToQueue];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
      v10 = [(CHDelegateController *)self delegateToQueue];
      v11 = [v10 objectForKey:v9];

      v4[2](v4, v9, v11, &v16);
      LOBYTE(v9) = v16 == 0;

      if ((v9 & 1) == 0) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(&self->_delegateLock);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (void).cxx_destruct
{
}

@end