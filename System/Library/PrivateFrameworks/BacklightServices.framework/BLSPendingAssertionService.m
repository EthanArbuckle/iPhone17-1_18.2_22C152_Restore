@interface BLSPendingAssertionService
- (BLSPendingAssertionService)init;
- (os_unfair_lock_s)hasReplacementService;
- (void)acquireAssertion:(id)a3;
- (void)cancelAssertion:(id)a3 withError:(id)a4;
- (void)replaceWithService:(id)a3;
- (void)restartAssertionTimeoutTimer:(id)a3;
@end

@implementation BLSPendingAssertionService

- (BLSPendingAssertionService)init
{
  v7.receiver = self;
  v7.super_class = (Class)BLSPendingAssertionService;
  v2 = [(BLSPendingAssertionService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    assertionsToAcquire = v3->_assertionsToAcquire;
    v3->_assertionsToAcquire = (NSMutableArray *)v4;
  }
  return v3;
}

- (os_unfair_lock_s)hasReplacementService
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 6;
    os_unfair_lock_lock(a1 + 6);
    v1 = (os_unfair_lock_s *)(*(void *)&v1[4]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)acquireAssertion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"only BLSAssertion objects supported by pending service not:%@", v4 format];
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_replacementService)
  {
    objc_msgSend(v4, "setService:");
    [(BLSAssertionService *)self->_replacementService acquireAssertion:v4];
  }
  else
  {
    [(NSMutableArray *)self->_assertionsToAcquire addObject:v4];
    v5 = bls_assertions_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      objc_super v7 = self;
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_1B55DE000, v5, OS_LOG_TYPE_INFO, "%p assertion acquired before service setup, pending:%{public}@", buf, 0x16u);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)cancelAssertion:(id)a3 withError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (-[BLSPendingAssertionService hasReplacementService]((os_unfair_lock_s *)self)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"replacement service has been set, should not be invalidating:%@", v6 format];
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_assertionsToAcquire removeObject:v6];
  os_unfair_lock_unlock(&self->_lock);
  __int16 v8 = bls_assertions_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1B55DE000, v8, OS_LOG_TYPE_INFO, "%p assertion invalidated (%{public}@) before service setup, no longer pending:%{public}@", buf, 0x20u);
  }
}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[BLSPendingAssertionService hasReplacementService]((os_unfair_lock_s *)self)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"replacement service has been set, should not be restarting timeout timer for:%@", v4 format];
  }
  v5 = bls_assertions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1B55DE000, v5, OS_LOG_TYPE_INFO, "%p assertion timeout restarted before service setup:%{public}@", buf, 0x16u);
  }
}

- (void)replaceWithService:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)[(NSMutableArray *)self->_assertionsToAcquire copy];
  [(NSMutableArray *)self->_assertionsToAcquire removeAllObjects];
  objc_storeStrong((id *)&self->_replacementService, a3);
  os_unfair_lock_unlock(&self->_lock);
  id v7 = bls_assertions_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(BLSPendingAssertionService *)(uint64_t)self replaceWithService:v7];
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v13, "setService:", v5, (void)v14);
        [v5 acquireAssertion:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementService, 0);

  objc_storeStrong((id *)&self->_assertionsToAcquire, 0);
}

- (void)replaceWithService:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = [a2 count];
  _os_log_debug_impl(&dword_1B55DE000, a3, OS_LOG_TYPE_DEBUG, "%p service setup, will transition %u assertions", (uint8_t *)&v4, 0x12u);
}

@end