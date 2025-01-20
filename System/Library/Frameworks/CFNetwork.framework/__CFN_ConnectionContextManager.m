@interface __CFN_ConnectionContextManager
- (__CFN_ConnectionContextManager)init;
- (uint64_t)keyForSession:(id *)a1;
- (void)dealloc;
- (void)registerSession:(uint64_t)a3;
- (void)unregisterSession:(uint64_t)a1;
@end

@implementation __CFN_ConnectionContextManager

- (void)unregisterSession:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = -[__CFN_ConnectionContextManager keyForSession:]((id *)a2);
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if ([(id)_registeredSessions objectForKeyedSubscript:v3])
    {
      v4 = (void *)[(id)_registeredSessions objectForKeyedSubscript:v3];
      uint64_t v5 = a2 ? *(void *)(a2 + 128) : 0;
      [v4 removeObject:v5];
      if (!objc_msgSend((id)objc_msgSend((id)_registeredSessions, "objectForKeyedSubscript:", v3), "count"))
      {
        [(id)_nwContexts removeObjectForKey:v3];
        [(id)_registeredSessions removeObjectForKey:v3];
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
}

- (void)registerSession:(uint64_t)a3
{
  uint64_t v3 = result;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v5 = (void *)-[__CFN_ConnectionContextManager keyForSession:]((id *)a3);
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (![(id)_registeredSessions objectForKeyedSubscript:v5])
    {
      [v5 UTF8String];
      uint64_t v6 = nw_context_create();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v21 = __50____CFN_ConnectionContextManager_registerSession___block_invoke_2;
      v22 = &unk_1E5258228;
      uint64_t v23 = v6;
      nw_context_set_isolate_protocol_cache();
      if (a3) {
        v7 = *(void **)(a3 + 112);
      }
      else {
        v7 = 0;
      }
      [v7 _loggingPrivacyLevel];
      nw_context_set_privacy_level();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      if (a3) {
        v8 = *(void **)(a3 + 112);
      }
      else {
        v8 = 0;
      }
      v9 = (void *)[v8 _proxyConfigurations];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v9);
            }
            nw_context_add_proxy();
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v10);
      }
      nw_context_activate();
      [(id)_nwContexts setObject:v6 forKeyedSubscript:v5];
      uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
      [(id)_registeredSessions setObject:v13 forKeyedSubscript:v5];
      v21((uint64_t)v20);
    }
    v14 = (void *)[(id)_registeredSessions objectForKeyedSubscript:v5];
    if (a3) {
      uint64_t v15 = *(void *)(a3 + 128);
    }
    else {
      uint64_t v15 = 0;
    }
    [v14 addObject:v15];
    *uint64_t v3 = (id)[(id)_nwContexts objectForKeyedSubscript:v5];
    operator new();
  }
  *result = 0;
  result[1] = 0;
  return result;
}

- (uint64_t)keyForSession:(id *)a1
{
  v2 = NSString;
  uint64_t v3 = [a1 _tlsSessionCachePrefix];
  if (a1)
  {
    uint64_t v4 = [a1[14] _tlsTrustPinningPolicyName];
    if ([a1[14] _allowsTLSFallback]) {
      uint64_t v5 = 89;
    }
    else {
      uint64_t v5 = 78;
    }
    uint64_t v6 = [a1[14] _loggingPrivacyLevel];
    id v7 = a1[14];
  }
  else
  {
    uint64_t v4 = [0 _tlsTrustPinningPolicyName];
    if ([0 _allowsTLSFallback]) {
      uint64_t v5 = 89;
    }
    else {
      uint64_t v5 = 78;
    }
    uint64_t v6 = [0 _loggingPrivacyLevel];
    id v7 = 0;
  }
  return [v2 stringWithFormat:@"com.apple.CFNetwork.NSURLSession.{%@}{%@}{%c}{%d}{%p}", v3, v4, v5, v6, objc_msgSend(v7, "_proxyConfigurations")];
}

- (__CFN_ConnectionContextManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)__CFN_ConnectionContextManager;
  v2 = [(__CFN_ConnectionContextManager *)&v4 init];
  if (v2)
  {
    _lock = 0;
    _nwContexts = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    _registeredSessions = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__CFN_ConnectionContextManager;
  [(__CFN_ConnectionContextManager *)&v3 dealloc];
}

@end