@interface FBSServiceFacility
- (BOOL)queue_clientDidConnect:(id)a3 withMessage:(id)a4;
- (BOOL)shouldAllowClientConnection:(id)a3 withMessage:(id)a4;
- (FBSSerialQueue)queue;
- (FBSServiceFacility)init;
- (FBSServiceFacility)initWithIdentifier:(id)a3 queue:(id)a4;
- (NSSet)_prerequisiteMilestones;
- (NSSet)clients;
- (NSString)identifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)queue_clientDidDisconnect:(id)a3;
- (void)queue_handleMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
- (void)sendMessage:(id)a3 withType:(int64_t)a4 toClients:(id)a5;
@end

@implementation FBSServiceFacility

- (FBSSerialQueue)queue
{
  return self->_queue;
}

- (void)queue_clientDidDisconnect:(id)a3
{
  id v10 = a3;
  [(FBSSerialQueue *)self->_queue assertOnQueue];
  identifier = self->_identifier;
  v5 = [v10 facilityID];
  if ([(NSString *)identifier isEqualToString:v5])
  {
    int v6 = [(NSMutableSet *)self->_clients containsObject:v10];

    v7 = v10;
    if (!v6) {
      goto LABEL_6;
    }
    [(NSMutableSet *)self->_clients removeObject:v10];
    os_unfair_lock_lock(&self->_clients_immutable_lock);
    v8 = (NSSet *)[(NSMutableSet *)self->_clients copy];
    clients_immutable = self->_clients_immutable;
    self->_clients_immutable = v8;

    os_unfair_lock_unlock(&self->_clients_immutable_lock);
    [(FBSServiceFacility *)self noteClientDidDisconnect:v10];
  }
  else
  {
  }
  v7 = v10;
LABEL_6:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)queue_handleMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(FBSSerialQueue *)self->_queue assertOnQueue];
  if ([(NSMutableSet *)self->_clients containsObject:v9])
  {
    [(FBSServiceFacility *)self noteDidReceiveMessage:v8 withType:a4 fromClient:v9];
  }
  else
  {
    id v10 = FBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacility queue_handleMessage:withType:fromClient:]((uint64_t)self, v9);
    }
  }
}

- (NSSet)_prerequisiteMilestones
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:@"FBSServiceMilestoneSystemApplicationInitialized"];
}

- (BOOL)queue_clientDidConnect:(id)a3 withMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FBSSerialQueue *)self->_queue assertOnQueue];
  BOOL v8 = [(FBSServiceFacility *)self shouldAllowClientConnection:v6 withMessage:v7];
  if (v8)
  {
    [(NSMutableSet *)self->_clients addObject:v6];
    os_unfair_lock_lock(&self->_clients_immutable_lock);
    id v9 = (NSSet *)[(NSMutableSet *)self->_clients copy];
    clients_immutable = self->_clients_immutable;
    self->_clients_immutable = v9;

    os_unfair_lock_unlock(&self->_clients_immutable_lock);
    [(FBSServiceFacility *)self noteClientDidConnect:v6 withMessage:v7];
  }
  else
  {
    v11 = FBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacility queue_clientDidConnect:withMessage:]((uint64_t)self, v6);
    }
  }
  return v8;
}

- (BOOL)shouldAllowClientConnection:(id)a3 withMessage:(id)a4
{
  return 1;
}

- (FBSServiceFacility)init
{
  v4 = [NSString stringWithFormat:@"wrong initializer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSServiceFacility.m";
    __int16 v16 = 1024;
    int v17 = 34;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSServiceFacility)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacility initWithIdentifier:queue:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }
  int v8 = v7;
  if (!v7)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSServiceFacility initWithIdentifier:queue:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  v22.receiver = self;
  v22.super_class = (Class)FBSServiceFacility;
  id v9 = [(FBSServiceFacility *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_queue, a4);
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    clients = v9->_clients;
    v9->_clients = (NSMutableSet *)v12;

    uint64_t v14 = [(NSMutableSet *)v9->_clients copy];
    clients_immutable = v9->_clients_immutable;
    v9->_clients_immutable = (NSSet *)v14;

    v9->_clients_immutable_lock._os_unfair_lock_opaque = 0;
    __int16 v16 = FBSGetServiceFacilityManager();
    if (!v16)
    {
      v21 = [NSString stringWithFormat:@"no service facility manager found"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSServiceFacility initWithIdentifier:queue:]();
      }
      [v21 UTF8String];
      _bs_set_crash_log_message();
    }
    int v17 = v16;
    [v16 addFacility:v9];
  }
  return v9;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)invalidate
{
  [(FBSSerialQueue *)self->_queue assertOnQueue];
  self->_invalidated = 1;
  FBSGetServiceFacilityManager();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeFacility:self];
}

- (NSSet)clients
{
  p_clients_immutable_lock = &self->_clients_immutable_lock;
  os_unfair_lock_lock(&self->_clients_immutable_lock);
  uint64_t v4 = self->_clients_immutable;
  os_unfair_lock_unlock(p_clients_immutable_lock);

  return v4;
}

- (void)sendMessage:(id)a3 withType:(int64_t)a4 toClients:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint8_t v9 = [v7 payload];
  if (v9)
  {
    v19 = v9;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            __int16 v18 = [NSString stringWithFormat:@"Client must be provided by the system."];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[FBSServiceFacility sendMessage:withType:toClients:]();
            }
            [v18 UTF8String];
            _bs_set_crash_log_message();
          }
          v15 = [v14 clientHandle_messageBuilder];
          __int16 v16 = [v15 createMessage];

          [v16 encodeInt64:a4 forKey:@"message"];
          int v17 = [v7 payload];
          [v16 encodeXPCObject:v17 forKey:@"fbs_message"];

          [v16 send];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    uint8_t v9 = v19;
  }
}

- (id)succinctDescription
{
  v2 = [(FBSServiceFacility *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [off_1E58F44F0 builderWithObject:self];
  uint64_t v4 = [(FBSServiceFacility *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"ID"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSServiceFacility *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSServiceFacility *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FBSServiceFacility_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __60__FBSServiceFacility_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _prerequisiteMilestones];
  id v4 = [v3 allObjects];
  [v2 appendArraySection:v4 withName:@"prereqMilestones" skipIfEmpty:1];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) clients];
  id v6 = [v7 allObjects];
  [v5 appendArraySection:v6 withName:@"clients" skipIfEmpty:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients_immutable, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_prerequisiteMilestones, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:queue:.cold.1()
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

- (void)initWithIdentifier:queue:.cold.2()
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

- (void)initWithIdentifier:queue:.cold.3()
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

- (void)queue_clientDidConnect:(uint64_t)a1 withMessage:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 prettyProcessDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v6, v7, "[%{public}@] Rejecting client %{public}@.", v8, v9, v10, v11, v12);
}

- (void)queue_handleMessage:(uint64_t)a1 withType:(void *)a2 fromClient:.cold.1(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 prettyProcessDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v6, v7, "[%{public}@] Ignoring message from untracked client %{public}@.", v8, v9, v10, v11, v12);
}

- (void)sendMessage:withType:toClients:.cold.1()
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

@end