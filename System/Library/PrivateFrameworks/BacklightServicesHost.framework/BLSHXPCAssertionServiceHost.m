@interface BLSHXPCAssertionServiceHost
- (BLSHXPCAssertionServiceHost)initWithLocalService:(id)a3 peer:(id)a4;
- (id)acquireAssertionForDescriptor:(id)a3 error:(id *)a4;
- (id)proxyForIdentifier:(os_unfair_lock_s *)a1;
- (os_unfair_lock_s)isValid;
- (void)acquireAssertion:(id)a3;
- (void)cancelAssertion:(id)a3 withError:(id)a4;
- (void)dealloc;
- (void)destroyAssertion:(id)a3;
- (void)invalidate;
- (void)removeProxyForIdentifier:(uint64_t)a1;
- (void)restartAssertionTimeoutTimer:(id)a3;
- (void)setProxy:(void *)a3 forIdentifier:;
@end

@implementation BLSHXPCAssertionServiceHost

- (BLSHXPCAssertionServiceHost)initWithLocalService:(id)a3 peer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSHXPCAssertionServiceHost;
  v9 = [(BLSHXPCAssertionServiceHost *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = [v8 remoteProcess];
    objc_storeWeak((id *)&v10->_remoteProcessHandle, v11);

    objc_storeStrong((id *)&v10->_localService, a3);
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    assertionProxies = v10->_assertionProxies;
    v10->_assertionProxies = (NSMutableDictionary *)v12;

    v10->_valid = 1;
  }

  return v10;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21FCFC000, log, OS_LOG_TYPE_FAULT, "must invalidate before deallocating service", v1, 2u);
}

- (os_unfair_lock_s)isValid
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[9]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_valid = 0;
  assertionProxies = self->_assertionProxies;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__BLSHXPCAssertionServiceHost_invalidate__block_invoke;
  v5[3] = &unk_2645332A0;
  v5[4] = self;
  [(NSMutableDictionary *)assertionProxies enumerateKeysAndObjectsUsingBlock:v5];
  os_unfair_lock_unlock(p_lock);
}

void __41__BLSHXPCAssertionServiceHost_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 invalidate];
  v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F29920];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = @"service disconnected";
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = [v6 errorWithDomain:v7 code:3 userInfo:v8];
  [v5 cancelAssertion:v4 withError:v9];
}

- (id)proxyForIdentifier:(os_unfair_lock_s *)a1
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 8;
    id v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
    uint64_t v2 = [*(id *)(v2 + 24) objectForKey:v4];

    os_unfair_lock_unlock(v3);
  }

  return (id)v2;
}

- (void)setProxy:(void *)a3 forIdentifier:
{
  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 32);
    id v6 = a3;
    id v7 = a2;
    os_unfair_lock_lock(v5);
    [*(id *)(a1 + 24) setObject:v7 forKey:v6];

    os_unfair_lock_unlock(v5);
  }
}

- (void)removeProxyForIdentifier:(uint64_t)a1
{
  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 32);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(a1 + 24) removeObjectForKey:v4];

    os_unfair_lock_unlock(v3);
  }
}

- (id)acquireAssertionForDescriptor:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteProcessHandle);
  id v25 = 0;
  char v9 = [v7 checkEntitlementSourceForRequiredEntitlements:WeakRetained error:&v25];
  id v10 = v25;
  v11 = v10;
  if ((v9 & 1) != 0 || v10)
  {
    if (v10)
    {
      uint64_t v12 = 0;
      if (!a4)
      {
LABEL_6:

        return v12;
      }
    }
    else
    {
      v14 = [MEMORY[0x263F2B9B8] currentContext];
      id v15 = objc_alloc(MEMORY[0x263F29968]);
      v16 = [v14 remoteProcess];
      uint64_t v17 = [v16 pid];
      uint64_t v12 = objc_msgSend(v15, "initWithClientPid:hostPid:count:", v17, getpid(), objc_msgSend(MEMORY[0x263F29968], "nextCount"));

      v18 = [BLSHAssertionProxy alloc];
      v19 = [v14 remoteTarget];
      v20 = [(BLSHAssertionProxy *)v18 initWithIdentifier:v12 descriptor:v7 remoteTarget:v19];

      -[BLSHXPCAssertionServiceHost setProxy:forIdentifier:]((uint64_t)self, v20, v12);
      [(BLSAssertionService *)self->_localService acquireAssertion:v20];

      if (!a4) {
        goto LABEL_6;
      }
    }
    *a4 = v11;
    goto LABEL_6;
  }
  v21 = NSString;
  uint64_t v22 = (int)[WeakRetained pid];
  v23 = [WeakRetained bundleIdentifier];
  v24 = [v21 stringWithFormat:@"checkEntitlementSourceForRequiredEntitlements returned NO but did not provide an error for process:%ld:'%@' descriptor:%@", v22, v23, v7];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHXPCAssertionServiceHost acquireAssertionForDescriptor:error:](a2, (uint64_t)self, (uint64_t)v24);
  }
  [v24 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)acquireAssertion:(id)a3
{
  localService = self->_localService;
  -[BLSHXPCAssertionServiceHost proxyForIdentifier:]((os_unfair_lock_s *)self, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(BLSAssertionService *)localService acquireAssertion:v4];
}

- (void)cancelAssertion:(id)a3 withError:(id)a4
{
  localService = self->_localService;
  id v7 = a4;
  -[BLSHXPCAssertionServiceHost proxyForIdentifier:]((os_unfair_lock_s *)self, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(BLSAssertionService *)localService cancelAssertion:v8 withError:v7];
}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  localService = self->_localService;
  -[BLSHXPCAssertionServiceHost proxyForIdentifier:]((os_unfair_lock_s *)self, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(BLSAssertionService *)localService restartAssertionTimeoutTimer:v4];
}

- (void)destroyAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionProxies, 0);
  objc_destroyWeak((id *)&self->_remoteProcessHandle);

  objc_storeStrong((id *)&self->_localService, 0);
}

- (void)acquireAssertionForDescriptor:(uint64_t)a3 error:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  char v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"BLSHXPCAssertionServiceHost.m";
  __int16 v16 = 1024;
  int v17 = 105;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end