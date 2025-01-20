@interface ACDClient
+ (ACDClient)clientWithBundleID:(id)a3;
+ (id)_bundleForNonPlugInPID:(int)a3;
+ (id)_bundleForPID:(int)a3;
+ (id)_bundleIDForPID:(int)a3;
- (ACDAccountStoreFilter)filter;
- (ACDClient)init;
- (ACDClient)initWithConnection:(id)a3;
- (BOOL)hasEntitlement:(id)a3;
- (NSNumber)pid;
- (NSString)adamOrDisplayID;
- (NSString)bundleID;
- (NSString)localizedAppName;
- (NSString)name;
- (NSXPCConnection)connection;
- (__CFBundle)bundle;
- (id)_displayNameFromBundleInfoDictionaryForPID:(int)a3;
- (id)_displayNameFromLaunchServicesForPID:(int)a3;
- (id)_rawValueForEntitlement:(id)a3;
- (id)description;
- (void)dealloc;
- (void)setBundleID:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation ACDClient

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __28__ACDClient_hasEntitlement___block_invoke;
  v13 = &unk_264321AB8;
  p_clientPropertyLock = &self->_clientPropertyLock;
  v14 = self;
  id v15 = v4;
  id v6 = v4;
  v7 = ac_unfair_lock_perform_with_result_1(p_clientPropertyLock, &v10);
  char v8 = objc_msgSend(v7, "BOOLValue", v10, v11, v12, v13, v14);

  return v8;
}

id __28__ACDClient_hasEntitlement___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    v3 = [*(id *)(v1 + 64) objectForKey:*(void *)(a1 + 40)];
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 BOOLValue];
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      if (!v6[8])
      {
        uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
        uint64_t v8 = *(void *)(a1 + 32);
        v9 = *(void **)(v8 + 64);
        *(void *)(v8 + 64) = v7;

        id v6 = *(void **)(a1 + 32);
      }
      uint64_t v10 = [v6 _rawValueForEntitlement:*(void *)(a1 + 40)];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v14 = _ACDLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          uint64_t v20 = *(void *)(a1 + 40);
          uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
          int v22 = 138412802;
          uint64_t v23 = v21;
          __int16 v24 = 2112;
          uint64_t v25 = v20;
          __int16 v26 = 2112;
          v27 = v10;
          _os_log_fault_impl(&dword_2183AD000, v14, OS_LOG_TYPE_FAULT, "\"Connection '%@' has unsupported object type set for entitlement '%@': %@\"", (uint8_t *)&v22, 0x20u);
        }

        [*(id *)(*(void *)(a1 + 32) + 64) setObject:MEMORY[0x263EFFA80] forKey:*(void *)(a1 + 40)];
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v5 = [v10 BOOLValue];
        uint64_t v11 = _ACDLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = *(void *)(a1 + 40);
          uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 56);
          v19 = [NSNumber numberWithBool:v5];
          int v22 = 138412802;
          uint64_t v23 = v17;
          __int16 v24 = 2112;
          uint64_t v25 = v18;
          __int16 v26 = 2112;
          v27 = v19;
          _os_log_debug_impl(&dword_2183AD000, v11, OS_LOG_TYPE_DEBUG, "\"Entitlement %@ verification for %@ result cached as: %@\"", (uint8_t *)&v22, 0x20u);
        }
        v12 = *(void **)(*(void *)(a1 + 32) + 64);
        v13 = [NSNumber numberWithBool:v5];
        [v12 setObject:v13 forKey:*(void *)(a1 + 40)];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v15 = [NSNumber numberWithBool:v5];

  return v15;
}

- (id)_rawValueForEntitlement:(id)a3
{
  return (id)[(NSXPCConnection *)self->_connection valueForEntitlement:a3];
}

- (void)setFilter:(id)a3
{
}

- (ACDClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDClient;
  id v6 = [(ACDClient *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_clientPropertyLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_entitlementChecks, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  bundle = self->_bundle;
  if (bundle) {
    CFRelease(bundle);
  }
  v4.receiver = self;
  v4.super_class = (Class)ACDClient;
  [(ACDClient *)&v4 dealloc];
}

- (void)setBundleID:(id)a3
{
  id v4 = a3;
  p_clientPropertyLock = &self->_clientPropertyLock;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  objc_super v9 = __25__ACDClient_setBundleID___block_invoke;
  uint64_t v10 = &unk_264320D40;
  id v6 = v4;
  id v11 = v6;
  v12 = self;
  uint64_t v7 = v8;
  os_unfair_lock_lock(p_clientPropertyLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_clientPropertyLock);
}

void __25__ACDClient_setBundleID___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
  id v5 = v2;

  *(unsigned char *)(*(void *)(a1 + 40) + 32) = v5 != 0;
}

+ (ACDClient)clientWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setBundleID:v3];

  return (ACDClient *)v4;
}

- (ACDClient)init
{
  return [(ACDClient *)self initWithConnection:0];
}

- (NSNumber)pid
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __16__ACDClient_pid__block_invoke;
  v4[3] = &unk_264321A40;
  v4[4] = self;
  v2 = ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v4);

  return (NSNumber *)v2;
}

id __16__ACDClient_pid__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  if (!v3)
  {
    id v3 = *(void **)(v2 + 8);
    if (v3)
    {
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "processIdentifier"));
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      id v3 = *(void **)(*(void *)(a1 + 32) + 40);
    }
  }

  return v3;
}

+ (id)_bundleForNonPlugInPID:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = proc_pidpath(a3, buffer, 0x1000u);
  uint64_t v4 = NSURL;
  uint64_t v5 = (void *)[[NSString alloc] initWithBytes:buffer length:v3 encoding:4];
  id v6 = [v4 fileURLWithPath:v5];

  if (v6)
  {
    uint64_t v7 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v8 = [MEMORY[0x263F086E0] bundleWithURL:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)_bundleIDForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263F5E718] defaultManager];
  uint64_t v5 = [v4 containingAppForPlugInWithPid:v3];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = +[ACDClient _bundleForNonPlugInPID:v3];
    id v6 = [v7 bundleIdentifier];

    if (!v6)
    {
      uint64_t v8 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", buffer, proc_pidpath(v3, buffer, 0x1000u), 4);
      id v6 = [v8 lastPathComponent];
    }
  }

  return v6;
}

+ (id)_bundleForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [MEMORY[0x263F5E718] defaultManager];
  id v6 = [v5 containingAppForPlugInWithPid:v3];

  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
    uint64_t v8 = (void *)MEMORY[0x263F086E0];
    objc_super v9 = [v7 bundleContainerURL];
    uint64_t v10 = [v8 bundleWithURL:v9];
  }
  else
  {
    uint64_t v10 = [a1 _bundleForNonPlugInPID:v3];
  }

  return v10;
}

- (NSString)bundleID
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __21__ACDClient_bundleID__block_invoke;
  v4[3] = &unk_264321A68;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v4);

  return (NSString *)v2;
}

id __21__ACDClient_bundleID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    uint64_t v3 = *(void **)(v2 + 8);
    if (v3)
    {
      uint64_t v4 = +[ACDClient _bundleIDForPID:](ACDClient, "_bundleIDForPID:", [v3 processIdentifier]);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    }
  }

  return v3;
}

- (NSString)localizedAppName
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__ACDClient_localizedAppName__block_invoke;
  v4[3] = &unk_264321A68;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v4);

  return (NSString *)v2;
}

id __29__ACDClient_localizedAppName__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[6];
  if (!v3)
  {
    uint64_t v3 = (void *)v2[1];
    if (v3)
    {
      uint64_t v5 = objc_msgSend(v2, "_displayNameFromLaunchServicesForPID:", objc_msgSend(v3, "processIdentifier"));
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 48);
      *(void *)(v6 + 48) = v5;

      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(v8 + 48);
      if (!v3)
      {
        uint64_t v9 = objc_msgSend((id)v8, "_displayNameFromBundleInfoDictionaryForPID:", objc_msgSend(*(id *)(v8 + 8), "processIdentifier"));
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void **)(v10 + 48);
        *(void *)(v10 + 48) = v9;

        uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
        if (!v3)
        {
          v12 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:*(void *)(*(void *)(a1 + 32) + 24) allowPlaceholder:0 error:0];
          uint64_t v13 = [v12 localizedName];
          uint64_t v14 = *(void *)(a1 + 32);
          id v15 = *(void **)(v14 + 48);
          *(void *)(v14 + 48) = v13;

          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v3 = *(void **)(v16 + 48);
          if (!v3)
          {
            [*(id *)(v16 + 8) processIdentifier];
            uint64_t v17 = ACDGetProcNameForPID();
            uint64_t v18 = *(void *)(a1 + 32);
            v19 = *(void **)(v18 + 48);
            *(void *)(v18 + 48) = v17;

            uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
          }
        }
      }
    }
  }

  return v3;
}

- (id)_displayNameFromLaunchServicesForPID:(int)a3
{
  uint64_t v3 = +[ACDClient _bundleForPID:*(void *)&a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v5 = [v3 bundleURL];
    uint64_t v6 = (void *)[v4 initWithURL:v5 allowPlaceholder:0 error:0];

    uint64_t v7 = [v6 localizedName];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_displayNameFromBundleInfoDictionaryForPID:(int)a3
{
  uint64_t v3 = +[ACDClient _bundleForPID:*(void *)&a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 localizedInfoDictionary];
    uint64_t v6 = [v5 objectForKey:*MEMORY[0x263EFFA90]];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSString)name
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __17__ACDClient_name__block_invoke;
  v4[3] = &unk_264321A68;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v4);

  return (NSString *)v2;
}

id __17__ACDClient_name__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  if (!v3)
  {
    [*(id *)(v2 + 8) processIdentifier];
    uint64_t v4 = ACDGetProcNameForPID();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 56);
  }

  return v3;
}

- (NSString)adamOrDisplayID
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__ACDClient_adamOrDisplayID__block_invoke;
  v4[3] = &unk_264321A68;
  v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v4);

  return (NSString *)v2;
}

id __28__ACDClient_adamOrDisplayID__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v1)
  {
    [v1 processIdentifier];
    uint64_t v1 = ACDGetAdamOrDisplayIDForPID();
  }

  return v1;
}

- (__CFBundle)bundle
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __19__ACDClient_bundle__block_invoke;
  v3[3] = &unk_264321A90;
  v3[4] = self;
  return (__CFBundle *)ac_unfair_lock_perform_with_result_1(&self->_clientPropertyLock, v3);
}

id __19__ACDClient_bundle__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v4 = [*v1 bundleID];
    uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

    uint64_t v6 = [v5 bundleContainerURL];

    if (v6)
    {
      CFRetain(v6);
      *((void *)*v1 + 2) = CFBundleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFURLRef)v6);
      if (!*((void *)*v1 + 2))
      {
        uint64_t v7 = _ACDLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __19__ACDClient_bundle__block_invoke_cold_1((uint64_t *)v1, (uint64_t)v6, v7);
        }
      }
      CFRelease(v6);
    }

    uint64_t v2 = (void *)*((void *)*v1 + 2);
  }

  return v2;
}

- (id)description
{
  uint64_t v2 = NSString;
  id v3 = [(ACDClient *)self name];
  uint64_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (ACDAccountStoreFilter)filter
{
  return self->_filter;
}

void __19__ACDClient_bundle__block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"CFBundleCreate failed: %@, %@\"", (uint8_t *)&v4, 0x16u);
}

@end