@interface FBSServiceFacilityClient
+ (BSServiceConnectionEndpoint)defaultShellEndpoint;
- (BOOL)_isValid;
- (BOOL)isConfigured;
- (BSServiceQuality)serviceQuality;
- (FBSServiceFacilityClient)init;
- (FBSServiceFacilityClient)initWithConfigurator:(id)a3;
- (FBSServiceFacilityClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4;
- (NSString)description;
- (NSString)identifier;
- (OS_dispatch_queue)calloutQueue;
- (void)_lock_activate;
- (void)_lock_invalidate;
- (void)_queue_handleError:(id)a3;
- (void)_queue_handleMessage:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)sendMessage:(id)a3 withType:(int64_t)a4;
- (void)sendMessage:(id)a3 withType:(int64_t)a4 replyHandler:(id)a5 waitForReply:(BOOL)a6 timeout:(double)a7;
- (void)setCalloutQueue:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterface:(id)a3;
- (void)setInterfaceTarget:(id)a3;
- (void)setServiceQuality:(id)a3;
@end

@implementation FBSServiceFacilityClient

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 encodeObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"fbs_facilityID"];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(FBSServiceFacilityClient *)self _lock_invalidate];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_invalidate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_invalidated)
  {
    v3 = FBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      int v7 = 138543618;
      v8 = v5;
      __int16 v9 = 2048;
      v10 = self;
      _os_log_impl(&dword_19C680000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Service facility connection invalidated", (uint8_t *)&v7, 0x16u);
    }
    self->_lock_invalidated = 1;
    [(BSServiceConnection *)self->_lock_connection invalidate];
    lock_connection = self->_lock_connection;
    self->_lock_connection = 0;
  }
}

+ (BSServiceConnectionEndpoint)defaultShellEndpoint
{
  v2 = [off_1E58F4520 environmentAliases];
  v3 = [off_1E58F4568 defaultShellMachName];
  v4 = [v2 resolveMachService:v3];
  v5 = +[FBSSystemServiceSpecification identifier];
  v6 = [off_1E58F4568 endpointForMachName:v4 service:v5 instance:0];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    __int16 v9 = +[FBSSystemServiceSpecification identifier];
    id v8 = [off_1E58F4568 nullEndpointForService:v9 instance:0];
  }

  return (BSServiceConnectionEndpoint *)v8;
}

- (void)setEndpoint:(id)a3
{
  v4 = (BSServiceConnectionEndpoint *)a3;
  if (self->_configured)
  {
    v10 = [NSString stringWithFormat:@"untimely configuration call"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setEndpoint:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  v5 = v4;
  if (!v4)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setEndpoint:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  v6 = [(BSServiceConnectionEndpoint *)v4 service];
  int v7 = +[FBSSystemServiceSpecification identifier];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"the endpoint specifies an incompatible service : endpoint=%@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setEndpoint:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
  }
  endpoint = self->_endpoint;
  self->_endpoint = v5;
}

- (FBSServiceFacilityClient)initWithConfigurator:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient initWithConfigurator:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
  }
  v5 = (void (**)(void, void))v4;
  v34.receiver = self;
  v34.super_class = (Class)FBSServiceFacilityClient;
  v6 = [(FBSServiceFacilityClient *)&v34 init];
  if (v6)
  {
    ((void (**)(void, FBSServiceFacilityClient *))v5)[2](v5, v6);
    v6->_configured = 1;
    if (!v6->_endpoint)
    {
      v25 = [NSString stringWithFormat:@"configuration error: endpoint was not specified"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSServiceFacilityClient initWithConfigurator:]();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
    }
    facilityID = v6->_facilityID;
    if (!facilityID)
    {
      v26 = [NSString stringWithFormat:@"configuration error: facilityID was not specified"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSServiceFacilityClient initWithConfigurator:]();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
    }
    if ((v6->_interface == 0) != (v6->_configOnly_interfaceTarget == 0))
    {
      v27 = [NSString stringWithFormat:@"if an interface is specified you must also specify the target"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSServiceFacilityClient initWithConfigurator:].cold.4();
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
    }
    v6->_lock._os_unfair_lock_opaque = 0;
    if (!v6->_serviceQuality)
    {
      uint64_t v8 = [off_1E58F4580 utility];
      serviceQuality = v6->_serviceQuality;
      v6->_serviceQuality = (BSServiceQuality *)v8;

      facilityID = v6->_facilityID;
    }
    v10 = [NSString stringWithFormat:@"FBSServiceFacilityClient:%@", facilityID];
    uint64_t v11 = [off_1E58F44F8 serial];
    v12 = [v11 serviceClass:v6->_serviceQuality relativePriority:v6->_serviceQuality];

    if (!v6->_calloutQueue)
    {
      [NSString stringWithFormat:@"FBSServiceFacilityClientCallout:%@", v6->_facilityID];
      objc_claimAutoreleasedReturnValue();
      BSDispatchQueueCreate();
    }
    NSClassFromString(&cfstr_Uisapplication_0.isa);
    v6->_uisHack = objc_opt_isKindOfClass() & 1;
    v13 = FBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      endpoint = v6->_endpoint;
      *(_DWORD *)buf = 138412290;
      v36 = endpoint;
      _os_log_impl(&dword_19C680000, v13, OS_LOG_TYPE_DEFAULT, "Creating service facility connection with %@", buf, 0xCu);
    }

    v15 = v6->_endpoint;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke;
    v32[3] = &unk_1E58F7528;
    v16 = v6;
    v33 = v16;
    uint64_t v17 = [off_1E58F4560 connectionWithEndpoint:v15 clientContextBuilder:v32];
    lock_connection = v16->_lock_connection;
    v16->_lock_connection = (BSServiceConnection *)v17;

    v19 = v16->_lock_connection;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_2;
    v28[3] = &unk_1E58F6560;
    id v29 = v10;
    v30 = v16;
    id v31 = v12;
    id v20 = v12;
    id v21 = v10;
    [(BSServiceConnection *)v19 _configureConnection:v28];
    id configOnly_interfaceTarget = v6->_configOnly_interfaceTarget;
    v6->_id configOnly_interfaceTarget = 0;
  }
  return v6;
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  if (self->_configured)
  {
    int v7 = [NSString stringWithFormat:@"untimely configuration call"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setIdentifier:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v4)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setIdentifier:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  id v9 = v4;
  v5 = (NSString *)[v4 copy];
  facilityID = self->_facilityID;
  self->_facilityID = v5;
}

void __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setName:*(void *)(a1 + 32)];
  [v3 setServiceQuality:*(void *)(*(void *)(a1 + 40) + 24)];
  BSDispatchQueueCreate();
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(FBSServiceFacilityClient *)self _lock_activate];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)identifier
{
  return self->_facilityID;
}

- (void)sendMessage:(id)a3 withType:(int64_t)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong(&self->_configOnly_interfaceTarget, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_serviceQuality, 0);
  objc_storeStrong((id *)&self->_facilityID, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = +[FBSXPCMessage messageWithBSXPCMessage:v5 ownReply:0];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 75)) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    uint64_t v7 = objc_alloc_init(FBSXPCMessage);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint8_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_2;
    v10[3] = &unk_1E58F5450;
    id v12 = *(id *)(a1 + 40);
    uint64_t v11 = v7;
    dispatch_async(v9, v10);
  }
}

- (void)sendMessage:(id)a3 withType:(int64_t)a4 replyHandler:(id)a5 waitForReply:(BOOL)a6 timeout:(double)a7
{
  BOOL v7 = a6;
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"fbs_message"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  v13 = v12;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated || self->_lock_connectionDenied)
  {
    v14 = 0;
  }
  else
  {
    v14 = self->_lock_connection;
    [(FBSServiceFacilityClient *)self _lock_activate];
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke;
    v21[3] = &unk_1E58F75A0;
    v21[4] = self;
    BOOL v23 = v7;
    id v22 = v13;
    v15 = [(BSServiceConnection *)v14 createMessageWithCompletion:v21];
  }
  else
  {
    v15 = [(BSServiceConnection *)v14 createMessage];
  }
  [v15 encodeInt64:a4 forKey:@"message"];
  v16 = [v11 payload];
  [v15 encodeXPCObject:v16 forKey:@"fbs_message"];

  if (v15)
  {
    if (v7) {
      [v15 sendSynchronously];
    }
    else {
      [v15 send];
    }
  }
  else if (v13)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_3;
    block[3] = &unk_1E58F5040;
    id v20 = v13;
    dispatch_async(calloutQueue, block);
  }
}

- (void)_lock_activate
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setServiceQuality:(id)a3
{
  uint64_t v4 = (BSServiceQuality *)a3;
  if (self->_configured)
  {
    uint64_t v6 = [NSString stringWithFormat:@"untimely configuration call"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setServiceQuality:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"serviceQuality"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setServiceQuality:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  serviceQuality = self->_serviceQuality;
  self->_serviceQuality = v4;

  MEMORY[0x1F41817F8](v4, serviceQuality);
}

- (void)setCalloutQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  if (self->_configured)
  {
    uint64_t v6 = [NSString stringWithFormat:@"untimely configuration call"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setCalloutQueue:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"calloutQueue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setCalloutQueue:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  calloutQueue = self->_calloutQueue;
  self->_calloutQueue = v4;

  MEMORY[0x1F41817F8](v4, calloutQueue);
}

void __42__FBSServiceFacilityClient__lock_activate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = *(os_unfair_lock_s **)(a1 + 32);
  uint64_t v4 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock(v5 + 15);
  if (v3 && !BYTE2((*v4)[18]._os_unfair_lock_opaque))
  {
    uint64_t v6 = FBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint8_t v9 = *v4;
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      __int16 v27 = 2048;
      v28 = v9;
      _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Service facility connection activation received.", buf, 0x16u);
    }
    if (([v3 decodeBoolForKey:@"fbs_accept"] & 1) == 0)
    {
      v10 = FBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        v13 = *v4;
        *(_DWORD *)buf = 138543618;
        v26 = v12;
        __int16 v27 = 2048;
        v28 = v13;
        _os_log_impl(&dword_19C680000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Service denied.", buf, 0x16u);
      }
      LOBYTE((*v4)[18]._os_unfair_lock_opaque) = 1;
      [*(id *)&(*v4)[16]._os_unfair_lock_opaque invalidate];
      v14 = *(void **)&(*v4)[16]._os_unfair_lock_opaque;
      *(void *)&(*v4)[16]._os_unfair_lock_opaque = 0;

      v15 = [MEMORY[0x1E4F1CA60] dictionary];
      v16 = [v3 decodeStringForKey:@"fbs_errorDesc"];
      if (v16)
      {
        uint64_t v17 = [NSString stringWithFormat:@"Service denied: %@", v16];
        [v15 setObject:v16 forKey:*MEMORY[0x1E4F28588]];
      }
      else
      {
        uint64_t v17 = @"Service denied.";
      }
      [v15 setObject:v17 forKey:*MEMORY[0x1E4F28568]];
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSServiceFacilityErrorDomain" code:1 userInfo:v15];
      v19 = FBLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __42__FBSServiceFacilityClient__lock_activate__block_invoke_cold_1((uint64_t)v4, v18);
      }

      id v20 = *v4;
      id v21 = *(NSObject **)&(*v4)[12]._os_unfair_lock_opaque;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__FBSServiceFacilityClient__lock_activate__block_invoke_91;
      block[3] = &unk_1E58F4AB0;
      void block[4] = v20;
      id v24 = v18;
      id v22 = v18;
      dispatch_async(v21, block);
    }
  }
  os_unfair_lock_unlock(*v4 + 15);
}

- (FBSServiceFacilityClient)init
{
  uint64_t v4 = [NSString stringWithFormat:@"you must use another initializer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    uint8_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSServiceFacilityClient.m";
    __int16 v16 = 1024;
    int v17 = 41;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSServiceFacilityClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__FBSServiceFacilityClient_initWithIdentifier_calloutQueue___block_invoke;
  v12[3] = &unk_1E58F7500;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  __int16 v10 = [(FBSServiceFacilityClient *)self initWithConfigurator:v12];

  return v10;
}

void __60__FBSServiceFacilityClient_initWithIdentifier_calloutQueue___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[FBSServiceFacilityClient defaultShellEndpoint];
  [v5 setEndpoint:v3];

  [v5 setIdentifier:*(void *)(a1 + 32)];
  uint64_t v4 = [off_1E58F4580 userInitiated];
  [v5 setServiceQuality:v4];

  if (*(void *)(a1 + 40)) {
    [v5 setCalloutQueue:];
  }
}

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_handleMessage:];
}

void __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 60);
  id v5 = a3;
  os_unfair_lock_lock(v4);
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  [*(id *)(a1 + 32) _queue_handleError:v5];
}

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) activate];
}

uint64_t __49__FBSServiceFacilityClient_initWithConfigurator___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)setInterface:(id)a3
{
  uint64_t v4 = (BSServiceInterface *)a3;
  if (self->_configured)
  {
    id v6 = [NSString stringWithFormat:@"untimely configuration call"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setInterface:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v4)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"interface"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setInterface:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  interface = self->_interface;
  self->_interface = v4;

  MEMORY[0x1F41817F8](v4, interface);
}

- (void)setInterfaceTarget:(id)a3
{
  id v4 = a3;
  if (self->_configured)
  {
    id v6 = [NSString stringWithFormat:@"untimely configuration call"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setInterfaceTarget:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v4)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"target"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacilityClient setInterfaceTarget:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  id configOnly_interfaceTarget = self->_configOnly_interfaceTarget;
  self->_id configOnly_interfaceTarget = v4;

  MEMORY[0x1F41817F8](v4, configOnly_interfaceTarget);
}

- (NSString)description
{
  id v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_facilityID withName:@"facilityID"];
  id v5 = [v3 build];

  return (NSString *)v5;
}

uint64_t __83__FBSServiceFacilityClient_sendMessage_withType_replyHandler_waitForReply_timeout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isValid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = !v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __42__FBSServiceFacilityClient__lock_activate__block_invoke_91(uint64_t a1)
{
  [*(id *)(a1 + 32) handleError:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)_queue_handleError:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v14[0] = *MEMORY[0x1E4F28568];
  v14[1] = v5;
  v15[0] = @"Service suspended: the connection with the service host has been interrupted.";
  v15[1] = @"The connection with the service host has been interrupted.";
  v14[2] = *MEMORY[0x1E4F28A50];
  v15[2] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v8 = [v6 dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v9 = [v4 errorWithDomain:@"FBSServiceFacilityErrorDomain" code:2 userInfo:v8];

  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FBSServiceFacilityClient__queue_handleError___block_invoke;
  block[3] = &unk_1E58F4AB0;
  void block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(calloutQueue, block);
}

uint64_t __47__FBSServiceFacilityClient__queue_handleError___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t result = [*(id *)(a1 + 32) _isValid];
  if (result)
  {
    id v4 = FBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__FBSServiceFacilityClient__queue_handleError___block_invoke_cold_1(v2, a1);
    }

    return [*(id *)(a1 + 32) handleError:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)_queue_handleMessage:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke;
  v7[3] = &unk_1E58F4AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

void __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if ([*(id *)(a1 + 32) _isValid])
  {
    uint64_t v3 = [*(id *)(a1 + 40) decodeInt64ForKey:@"message"];
    id v4 = +[FBSXPCMessage messageWithBSXPCMessage:*(void *)(a1 + 40) ownReply:1];
    uint64_t v5 = FBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke_cold_1(v2, v5);
    }

    [(id)*v2 handleMessage:v4 withType:v3];
  }
}

- (BSServiceQuality)serviceQuality
{
  return self->_serviceQuality;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (BOOL)isConfigured
{
  return self->_configured;
}

- (void)initWithConfigurator:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfigurator:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfigurator:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfigurator:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setEndpoint:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setEndpoint:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setEndpoint:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setServiceQuality:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setServiceQuality:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setInterface:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setInterface:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setInterfaceTarget:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setInterfaceTarget:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCalloutQueue:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCalloutQueue:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendMessage:withType:replyHandler:waitForReply:timeout:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __42__FBSServiceFacilityClient__lock_activate__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 localizedDescription];
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_10_0(&dword_19C680000, v6, v7, "[%{public}@:%p] %{public}@", v8, v9, v10, v11, v12);
}

void __47__FBSServiceFacilityClient__queue_handleError___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [*(id *)(a2 + 40) localizedDescription];
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_10_0(&dword_19C680000, v6, v7, "[%{public}@:%p] %{public}@", v8, v9, v10, v11, v12);
}

void __49__FBSServiceFacilityClient__queue_handleMessage___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *a1;
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_19C680000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@:%p] Handle incoming message.", (uint8_t *)&v7, 0x16u);
}

@end