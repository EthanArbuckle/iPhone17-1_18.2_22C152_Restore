@interface FBServiceFacilityServer
+ (id)sharedInstance;
+ (id)sharedInstanceDomain;
- (BOOL)_lock_areFacilityPrerequisitesSatisfied:(id)a3;
- (BSServiceDomainSpecification)domain;
- (FBServiceFacilityServer)init;
- (id)_initWithDomain:(id)a3;
- (void)_facilityQueue_facility:(id)a3 handleMessage:(id)a4 client:(id)a5;
- (void)_lock_evaluateSuspendedFacility:(id)a3;
- (void)addFacility:(id)a3;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)noteMilestoneReached:(id)a3;
- (void)removeFacility:(id)a3;
- (void)run;
@end

@implementation FBServiceFacilityServer

uint64_t __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_facilityQueue_facility:handleMessage:client:", *(void *)(a1 + 40), a3, *(void *)(a1 + 48));
}

void __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "queue_clientDidDisconnect:", v3);
  [v4 invalidate];
}

+ (id)sharedInstanceDomain
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (sharedInstanceDomain_onceToken != -1) { {
    dispatch_once(&sharedInstanceDomain_onceToken, v4);
  }
  }
  v2 = (void *)sharedInstanceDomain___domain;

  return v2;
}

- (void)_facilityQueue_facility:(id)a3 handleMessage:(id)a4 client:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F62730];
  id v10 = a3;
  uint64_t v11 = [v7 decodeInt64ForKey:v9];
  if (v11 == 0x636F6E6E656374)
  {
    v12 = FBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v8 prettyProcessDescription];
      v16 = [v8 facilityID];
      int v23 = 138543874;
      v24 = v14;
      __int16 v25 = 2114;
      v26 = v15;
      __int16 v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_1A62FC000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client %{public}@ connected to service %{public}@", (uint8_t *)&v23, 0x20u);
    }
    v17 = [v7 createReply];
    v18 = [MEMORY[0x1E4F62B40] messageWithBSXPCMessage:v7 ownReply:0];
    uint64_t v19 = objc_msgSend(v10, "queue_clientDidConnect:withMessage:", v8, v18);

    [v17 encodeBool:v19 forKey:*MEMORY[0x1E4F62738]];
    if (v19) { {
      v20 = 0;
    }
    }
    else {
      v20 = @"Connection rejected by service facility";
    }
    [v17 encodeObject:v20 forKey:*MEMORY[0x1E4F62720]];
    [v17 send];
    if ((v19 & 1) == 0) { {
      [v8 invalidate];
    }
    }
  }
  else
  {
    uint64_t v21 = v11;
    v22 = [MEMORY[0x1E4F62B40] messageWithBSXPCMessage:v7 ownReply:1];
    objc_msgSend(v10, "queue_handleMessage:withType:fromClient:", v22, v21, v8);
  }
}

void __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v11[3] = &unk_1E5C49CF0;
  id v4 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v4;
  id v13 = *(id *)(a1 + 48);
  id v5 = a2;
  [v5 setMessageHandler:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v8[3] = &unk_1E5C49D18;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v5 setErrorHandler:v8];
  v6 = [MEMORY[0x1E4F628B0] userInitiated];
  [v5 setServiceQuality:v6];

  id v7 = [*(id *)(a1 + 40) queue];
  [v5 setTargetDispatchingQueue:v7];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[FBProcessManager sharedInstance];
  id v10 = [v7 remoteProcess];
  id v11 = (id)[v9 registerProcessForHandle:v10];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v13 = [v8 decodeStringForKey:*MEMORY[0x1E4F62728]];

  if (v13
    && ([(NSMutableDictionary *)self->_lock_facilitiesByIdentifier objectForKey:v13],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = (void *)v14;
    v16 = [FBServiceFacilityServerClientHandle alloc];
    v17 = [v15 identifier];
    v18 = [(FBServiceFacilityServerClientHandle *)v16 initWithFacilityID:v17 connection:v7];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke;
    v28[3] = &unk_1E5C49D40;
    v28[4] = self;
    id v19 = v15;
    id v29 = v19;
    v20 = v18;
    v30 = v20;
    [v7 _configureConnection:v28];
    if ([(FBServiceFacilityServer *)self _lock_areFacilityPrerequisitesSatisfied:v19])
    {
      [v7 activate];
    }
    else
    {
      lock_pendingConnects = self->_lock_pendingConnects;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      __int16 v25 = __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_4;
      v26 = &unk_1E5C49AE0;
      id v27 = v7;
      v22 = +[_FBServiceFacilityServerPendingConnection pendingConnectionToFacility:v19 completion:&v23];
      -[NSMutableSet addObject:](lock_pendingConnects, "addObject:", v22, v23, v24, v25, v26);
    }
  }
  else
  {
    [v7 invalidate];
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_lock_areFacilityPrerequisitesSatisfied:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6 = [v5 _prerequisiteMilestones];

  if (v6 && [v6 count]) { {
    char v7 = [v6 isSubsetOfSet:self->_lock_completedMilestones];
  }
  }
  else {
    char v7 = 1;
  }

  return v7;
}

+ (id)sharedInstance
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__FBServiceFacilityServer_sharedInstance__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (sharedInstance_onceToken_2 != -1) { {
    dispatch_once(&sharedInstance_onceToken_2, v4);
  }
  }
  v2 = (void *)sharedInstance___instance_0;

  return v2;
}

void __41__FBServiceFacilityServer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[FBServiceFacilityServer sharedInstanceDomain];
  if (v2)
  {
    id v9 = (id)v2;
    id v3 = [[FBServiceFacilityServer alloc] _initWithDomain:v2];
    id v4 = (void *)sharedInstance___instance_0;
    sharedInstance___instance_0 = (uint64_t)v3;
  }
  else
  {
    id v5 = NSString;
    v6 = [MEMORY[0x1E4F62B00] identifier];
    char v7 = [MEMORY[0x1E4F628B8] bootstrapConfiguration];
    id v8 = [v5 stringWithFormat:@"must have a valid domain for %@ : bootstrapConfiguration = %@", v6, v7];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __41__FBServiceFacilityServer_sharedInstance__block_invoke_cold_1(a1);
    }
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke(uint64_t a1)
{
  id v15 = [MEMORY[0x1E4F628B8] bootstrapConfiguration];
  uint64_t v2 = [MEMORY[0x1E4F62B00] identifier];
  id v3 = [v15 domainsContainingServiceIdentifier:v2];

  if ([v3 count])
  {
    if ([v3 count] != 1)
    {
      id v10 = NSString;
      id v11 = [MEMORY[0x1E4F62B00] identifier];
      id v12 = [v10 stringWithFormat:@"must have one and only one domain specify %@ : domains=%@", v11, v3];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_2(a1);
      }
      }
LABEL_14:
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63376ACLL);
    }
    uint64_t v4 = [v3 anyObject];
    id v5 = (void *)sharedInstanceDomain___domain;
    sharedInstanceDomain___domain = v4;
  }
  v6 = [MEMORY[0x1E4F62848] environmentAliases];
  char v7 = [MEMORY[0x1E4F62888] defaultShellMachName];
  id v8 = [v6 resolveMachService:v7];
  id v9 = [v15 domainForMachName:v8];

  if (v9 && v9 != (void *)sharedInstanceDomain___domain)
  {
    id v13 = NSString;
    uint64_t v14 = [MEMORY[0x1E4F62B00] identifier];
    id v12 = [v13 stringWithFormat:@"if we own the defaultShellMachName then %@ must be registered there", v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_1(a1);
    }
    }
    goto LABEL_14;
  }
}

- (FBServiceFacilityServer)init
{
  uint64_t v4 = [NSString stringWithFormat:@"init is not allowed on FBServiceFacilityServer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = @"FBServiceFacilityServer.m";
    __int16 v17 = 1024;
    int v18 = 116;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBServiceFacilityServer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithDomain:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v25.receiver = self;
    v25.super_class = (Class)FBServiceFacilityServer;
    char v7 = [(FBServiceFacilityServer *)&v25 init];
    id v8 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_domain, a3);
      int v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      lock_pendingConnects = v8->_lock_pendingConnects;
      v8->_lock_pendingConnects = v9;

      __int16 v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      lock_completedMilestones = v8->_lock_completedMilestones;
      v8->_lock_completedMilestones = v11;

      __int16 v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      lock_facilitiesByIdentifier = v8->_lock_facilitiesByIdentifier;
      v8->_lock_facilitiesByIdentifier = v13;

      __int16 v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      lock_suspendedFacilitiesByIdentifier = v8->_lock_suspendedFacilitiesByIdentifier;
      v8->_lock_suspendedFacilitiesByIdentifier = v15;

      __int16 v17 = (void *)MEMORY[0x1E4F628A0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __43__FBServiceFacilityServer__initWithDomain___block_invoke;
      v23[3] = &unk_1E5C49CC8;
      int v18 = v8;
      uint64_t v24 = v18;
      uint64_t v19 = [v17 listenerWithConfigurator:v23];
      serviceListener = v18->_serviceListener;
      v18->_serviceListener = (BSServiceConnectionListener *)v19;

      FBSSetServiceFacilityManager();
    }

    return v8;
  }
  else
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"domain"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBServiceFacilityServer _initWithDomain:]();
    }
    }
    [v22 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __43__FBServiceFacilityServer__initWithDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a2;
  uint64_t v4 = [v3 identifier];
  [v6 setDomain:v4];

  id v5 = [MEMORY[0x1E4F62B00] identifier];
  [v6 setService:v5];

  [v6 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v2 = [NSString stringWithFormat:@"this is a singleton, yo"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = [NSString stringWithUTF8String:"-[FBServiceFacilityServer dealloc]"];
    int v4 = 138544130;
    id v5 = v3;
    __int16 v6 = 2114;
    char v7 = @"FBServiceFacilityServer.m";
    __int16 v8 = 1024;
    int v9 = 142;
    __int16 v10 = 2114;
    __int16 v11 = v2;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v4, 0x26u);
  }
  [v2 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __69__FBServiceFacilityServer_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) activate];
}

- (void)run
{
}

- (void)addFacility:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (!v5)
  {
    __int16 v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBServiceFacilityServer addFacility:]();
    }
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6337D5CLL);
  }
  __int16 v6 = (void *)v5;
  char v7 = [v4 queue];

  if (!v7)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[facility queue] != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBServiceFacilityServer addFacility:]();
    }
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6337DC0);
  }
  os_unfair_lock_lock(&self->_lock);
  __int16 v8 = [(NSMutableDictionary *)self->_lock_facilitiesByIdentifier objectForKey:v6];

  if (v8)
  {
    __int16 v15 = [NSString stringWithFormat:@"duplicate facility with identifier %@", v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBServiceFacilityServer addFacility:]();
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6337E1CLL);
  }
  int v9 = FBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = (objc_class *)objc_opt_class();
    __int16 v11 = NSStringFromClass(v10);
    id v12 = [v4 succinctDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1A62FC000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding facility: %{public}@", buf, 0x16u);
  }
  [(NSMutableDictionary *)self->_lock_facilitiesByIdentifier setObject:v4 forKey:v6];
  [(NSMutableDictionary *)self->_lock_suspendedFacilitiesByIdentifier setObject:v4 forKey:v6];
  [(FBServiceFacilityServer *)self _lock_evaluateSuspendedFacility:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeFacility:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (v5)
  {
    __int16 v6 = FBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = (objc_class *)objc_opt_class();
      __int16 v8 = NSStringFromClass(v7);
      int v9 = [v4 succinctDescription];
      int v10 = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2114;
      __int16 v13 = v9;
      _os_log_impl(&dword_1A62FC000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing facility: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_lock_facilitiesByIdentifier removeObjectForKey:v5];
    [(NSMutableDictionary *)self->_lock_suspendedFacilitiesByIdentifier removeObjectForKey:v5];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)noteMilestoneReached:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = FBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl(&dword_1A62FC000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Milestone reached: %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_lock_completedMilestones addObject:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  __int16 v8 = [(NSMutableDictionary *)self->_lock_suspendedFacilitiesByIdentifier allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) { {
          objc_enumerationMutation(v8);
        }
        }
        [(FBServiceFacilityServer *)self _lock_evaluateSuspendedFacility:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_evaluateSuspendedFacility:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(FBServiceFacilityServer *)self _lock_areFacilityPrerequisitesSatisfied:v4])
  {
    uint64_t v5 = FBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = (objc_class *)objc_opt_class();
      char v7 = NSStringFromClass(v6);
      __int16 v8 = [v4 identifier];
      *(_DWORD *)buf = 138543618;
      objc_super v25 = v7;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_impl(&dword_1A62FC000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting facility: %{public}@", buf, 0x16u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = [(NSMutableSet *)self->_lock_pendingConnects allObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) { {
            objc_enumerationMutation(v9);
          }
          }
          long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v15 = [v14 facility];

          if (v15 == v4)
          {
            long long v16 = [v14 completion];
            v16[2]();

            [(NSMutableSet *)self->_lock_pendingConnects removeObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    lock_suspendedFacilitiesByIdentifier = self->_lock_suspendedFacilitiesByIdentifier;
    __int16 v18 = [v4 identifier];
    [(NSMutableDictionary *)lock_suspendedFacilitiesByIdentifier removeObjectForKey:v18];
  }
}

- (BSServiceDomainSpecification)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

void __41__FBServiceFacilityServer_sharedInstance__block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __47__FBServiceFacilityServer_sharedInstanceDomain__block_invoke_cold_2(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithDomain:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addFacility:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addFacility:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addFacility:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end