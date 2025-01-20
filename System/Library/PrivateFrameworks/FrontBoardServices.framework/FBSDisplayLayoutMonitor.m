@interface FBSDisplayLayoutMonitor
+ (BSServiceInterface)interface;
+ (NSString)mainDisplayInstanceIdentifier;
+ (NSString)serviceIdentifier;
+ (id)_endpointForDisplayType:(int64_t)a3;
+ (id)monitorWithConfiguration:(id)a3;
+ (id)sharedMonitorForDisplayType:(int64_t)a3;
- (FBSDisplayLayout)currentLayout;
- (FBSDisplayLayoutMonitor)init;
- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3;
- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3 handler:(id)a4;
- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3 qualityOfService:(unint64_t)a4 handler:(id)a5;
- (id)_initWithConfiguration:(id)a3 singleton:(BOOL)a4 needsDefaultPriority:(BOOL)a5 mutable:(BOOL)a6 displayType:(int64_t)a7 mutableHandler:(id)a8;
- (id)handler;
- (int64_t)displayType;
- (unint64_t)qualityOfService;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handler;
- (void)invalidate;
- (void)qualityOfService;
- (void)removeObserver:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation FBSDisplayLayoutMonitor

void __116__FBSDisplayLayoutMonitor__initWithConfiguration_singleton_needsDefaultPriority_mutable_displayType_mutableHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __39__FBSDisplayLayoutMonitor_addObserver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (WeakRetained && v7)
  {
    if (objc_opt_respondsToSelector())
    {
      [v8 layoutMonitor:WeakRetained didUpdateDisplayLayout:v9 withContext:v5];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v8 layoutMonitor:WeakRetained didUpdateDisplayLayout:v9];
    }
  }
}

uint64_t __72__FBSDisplayLayoutMonitor_initWithDisplayType_qualityOfService_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FBSDisplayLayout)currentLayout
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_handlerAssertion = self->_lock_handlerAssertion;
  if (lock_handlerAssertion)
  {
    id v5 = [(_FBSDisplayLayoutServiceAssertion *)lock_handlerAssertion currentLayout];
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v6 = [(NSMapTable *)self->_lock_deprecated_observerAssertions objectEnumerator];
    if ([v6 countByEnumeratingWithState:v8 objects:v9 count:16])
    {
      id v5 = [**((id **)&v8[0] + 1) currentLayout];
    }
    else
    {
      id v5 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return (FBSDisplayLayout *)v5;
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)interface___interface_0;

  return (BSServiceInterface *)v2;
}

+ (id)monitorWithConfiguration:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"configuration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutMonitor monitorWithConfiguration:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  v4 = v3;
  id v5 = [[FBSDisplayLayoutMonitor alloc] _initWithConfiguration:v3 singleton:0 needsDefaultPriority:0 mutable:0 displayType:-1 mutableHandler:0];

  return v5;
}

- (id)_initWithConfiguration:(id)a3 singleton:(BOOL)a4 needsDefaultPriority:(BOOL)a5 mutable:(BOOL)a6 displayType:(int64_t)a7 mutableHandler:(id)a8
{
  BOOL v10 = a6;
  LODWORD(v11) = a5;
  id v15 = a3;
  id v16 = a8;
  if (!v15)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"config"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayLayoutMonitor _initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:](a2);
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
  }
  v17 = v16;
  v34.receiver = self;
  v34.super_class = (Class)FBSDisplayLayoutMonitor;
  v18 = [(FBSDisplayLayoutMonitor *)&v34 init];
  if (v18)
  {
    v19 = [v15 endpoint];
    if ([v15 needsUserInteractivePriority]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v11;
    }
    v18->_deprecated_singleton = a4;
    if (v10)
    {
      v18->_deprecated_mutable = 1;
      objc_storeStrong((id *)&v18->_deprecated_endpoint, v19);
      v18->_deprecated_qos = v11;
    }
    v18->_deprecated_displayType = a7;
    uint64_t v20 = MEMORY[0x19F3991F0](v17);
    id lock_deprecated_handler = v18->_lock_deprecated_handler;
    v18->_id lock_deprecated_handler = (id)v20;

    if (v19)
    {
      v22 = [v15 transitionHandler];
      if (v22)
      {
        objc_initWeak(&location, v18);
        v23 = [_FBSDisplayLayoutServiceAssertion alloc];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __116__FBSDisplayLayoutMonitor__initWithConfiguration_singleton_needsDefaultPriority_mutable_displayType_mutableHandler___block_invoke;
        v30[3] = &unk_1E58F6210;
        objc_copyWeak(&v32, &location);
        id v31 = v22;
        uint64_t v24 = [(_FBSDisplayLayoutServiceAssertion *)v23 initWithEndpoint:v19 qos:v11 observer:v30];
        lock_handlerAssertion = v18->_lock_handlerAssertion;
        v18->_lock_handlerAssertion = (_FBSDisplayLayoutServiceAssertion *)v24;

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
      else if (!v18->_deprecated_mutable)
      {
        v26 = [[_FBSDisplayLayoutServiceAssertion alloc] initWithEndpoint:v19 qos:v11 observer:0];
        v27 = v18->_lock_handlerAssertion;
        v18->_lock_handlerAssertion = v26;
      }
    }
  }
  return v18;
}

+ (id)_endpointForDisplayType:(int64_t)a3
{
  v4 = +[FBSDisplayLayoutMonitor serviceIdentifier];
  if (a3)
  {
    if (a3 == 3)
    {
      id v5 = off_1E58F4568;
      v6 = @"com.apple.CarPlayApp.non-launching-service";
      id v7 = @"com.apple.CarPlayApp.Dashboard";
      goto LABEL_8;
    }
    [NSString stringWithFormat:@"unknown(%li)", a3];
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v5 = off_1E58F4568;
    if (a3 == 6)
    {
      v6 = @"com.apple.CarPlayApp.non-launching-service";
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = +[FBSDisplayLayoutMonitor mainDisplayInstanceIdentifier];
    id v5 = off_1E58F4568;
  }
  v8 = [off_1E58F4520 environmentAliases];
  id v9 = [off_1E58F4568 defaultShellMachName];
  v6 = [v8 resolveMachService:v9];

LABEL_8:
  BOOL v10 = [v5 endpointForMachName:v6 service:v4 instance:v7];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [off_1E58F4568 nullEndpointForService:v4 instance:v7];
  }
  v13 = v12;

  return v13;
}

+ (NSString)serviceIdentifier
{
  return (NSString *)@"com.apple.frontboard.layout-monitor";
}

+ (NSString)mainDisplayInstanceIdentifier
{
  return (NSString *)@"com.apple.frontboard.main-display";
}

void __36__FBSDisplayLayoutMonitor_interface__block_invoke()
{
  v0 = +[FBSDisplayLayoutMonitor serviceIdentifier];
  id v4 = [off_1E58F4538 interfaceWithIdentifier:v0];

  v1 = [off_1E58F4550 protocolForProtocol:&unk_1EED49260];
  [v4 setClient:v1];

  [v4 setClientMessagingExpectation:1];
  uint64_t v2 = [v4 copy];
  id v3 = (void *)interface___interface_0;
  interface___interface_0 = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_deprecated_observerAssertions, 0);
  objc_storeStrong(&self->_lock_deprecated_handler, 0);
  objc_storeStrong((id *)&self->_deprecated_endpoint, 0);

  objc_storeStrong((id *)&self->_lock_handlerAssertion, 0);
}

- (void)invalidate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_deprecated_singleton)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (!self->_lock_invalidated)
    {
      self->_lock_invalidated = 1;
      [(_FBSDisplayLayoutServiceAssertion *)self->_lock_handlerAssertion invalidate];
      lock_handlerAssertion = self->_lock_handlerAssertion;
      self->_lock_handlerAssertion = 0;

      id lock_deprecated_handler = self->_lock_deprecated_handler;
      self->_id lock_deprecated_handler = 0;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v6 = [(NSMapTable *)self->_lock_deprecated_observerAssertions objectEnumerator];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v10++) invalidate];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }

      lock_deprecated_observerAssertions = self->_lock_deprecated_observerAssertions;
      self->_lock_deprecated_observerAssertions = 0;
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (FBSDisplayLayoutMonitor)init
{
  uint64_t v4 = [NSString stringWithFormat:@"init is not allowed on FBSDisplayLayoutMonitor"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    uint8_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    long long v13 = self;
    __int16 v14 = 2114;
    long long v15 = @"FBSDisplayLayoutMonitor.m";
    __int16 v16 = 1024;
    int v17 = 82;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

+ (id)sharedMonitorForDisplayType:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&sharedMonitorForDisplayType____lock);
  uint64_t v4 = (void *)sharedMonitorForDisplayType____monitors;
  if (!sharedMonitorForDisplayType____monitors)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = (void *)sharedMonitorForDisplayType____monitors;
    sharedMonitorForDisplayType____monitors = v5;

    uint64_t v4 = (void *)sharedMonitorForDisplayType____monitors;
  }
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  id v8 = [v4 objectForKey:v7];

  if (!v8)
  {
    uint8_t v9 = +[FBSDisplayLayoutMonitor _endpointForDisplayType:a3];
    __int16 v10 = +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:v9];

    id v8 = [[FBSDisplayLayoutMonitor alloc] _initWithConfiguration:v10 singleton:1 needsDefaultPriority:1 mutable:1 displayType:a3 mutableHandler:0];
    uint64_t v11 = (void *)sharedMonitorForDisplayType____monitors;
    __int16 v12 = [NSNumber numberWithInteger:a3];
    [v11 setObject:v8 forKey:v12];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedMonitorForDisplayType____lock);

  return v8;
}

- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3
{
  return [(FBSDisplayLayoutMonitor *)self initWithDisplayType:a3 handler:0];
}

- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3 handler:(id)a4
{
  return [(FBSDisplayLayoutMonitor *)self initWithDisplayType:a3 qualityOfService:21 handler:a4];
}

- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3 qualityOfService:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  if ((FBSDisplayTypeIsValid(a3) & 1) == 0)
  {
    __int16 v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"FBSDisplayTypeIsValid(displayType)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayLayoutMonitor initWithDisplayType:qualityOfService:handler:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  uint8_t v9 = +[FBSDisplayLayoutMonitor _endpointForDisplayType:a3];
  __int16 v10 = +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:v9];

  if (v8)
  {
    uint64_t v11 = (void *)[v8 copy];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__FBSDisplayLayoutMonitor_initWithDisplayType_qualityOfService_handler___block_invoke;
    v15[3] = &unk_1E58F6238;
    id v8 = v11;
    id v16 = v8;
    [v10 setTransitionHandler:v15];
  }
  __int16 v12 = [(FBSDisplayLayoutMonitor *)self _initWithConfiguration:v10 singleton:0 needsDefaultPriority:a4 == 21 mutable:1 displayType:a3 mutableHandler:v8];

  return v12;
}

- (int64_t)displayType
{
  return self->_deprecated_displayType;
}

- (id)handler
{
  if (!self->_deprecated_mutable)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%s is deprecated and only works with monitors created using the deprecated interfaces", "-[FBSDisplayLayoutMonitor handler]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayLayoutMonitor handler]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)MEMORY[0x19F3991F0](self->_lock_deprecated_handler);
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = (void *)MEMORY[0x19F3991F0](v4);

  return v5;
}

- (void)setHandler:(id)a3
{
  id v4 = a3;
  if (!self->_deprecated_mutable)
  {
    id v16 = [NSString stringWithFormat:@"%s is deprecated and only works with monitors created using the deprecated interfaces", "-[FBSDisplayLayoutMonitor setHandler:]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayLayoutMonitor setHandler:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v5 = v4;
  id v6 = (id)[v4 copy];

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_deprecated_handler != v6 && !self->_lock_invalidated)
  {
    uint64_t v7 = self->_lock_handlerAssertion;
    lock_handlerAssertion = self->_lock_handlerAssertion;
    self->_lock_handlerAssertion = 0;

    uint8_t v9 = (void *)MEMORY[0x19F3991F0](v6);
    id lock_deprecated_handler = self->_lock_deprecated_handler;
    self->_id lock_deprecated_handler = v9;

    if (self->_lock_deprecated_handler && self->_deprecated_endpoint)
    {
      uint64_t v11 = [_FBSDisplayLayoutServiceAssertion alloc];
      deprecated_endpoint = self->_deprecated_endpoint;
      uint64_t deprecated_qos = self->_deprecated_qos;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __38__FBSDisplayLayoutMonitor_setHandler___block_invoke;
      v17[3] = &unk_1E58F6260;
      id v18 = v6;
      __int16 v14 = [(_FBSDisplayLayoutServiceAssertion *)v11 initWithEndpoint:deprecated_endpoint qos:deprecated_qos observer:v17];
      long long v15 = self->_lock_handlerAssertion;
      self->_lock_handlerAssertion = v14;
    }
    [(_FBSDisplayLayoutServiceAssertion *)v7 invalidate];
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __38__FBSDisplayLayoutMonitor_setHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!self->_deprecated_mutable)
  {
    __int16 v14 = [NSString stringWithFormat:@"%s is deprecated and only works with monitors created using the deprecated interfaces", "-[FBSDisplayLayoutMonitor addObserver:]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayLayoutMonitor addObserver:](a2);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  id v6 = v5;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    uint64_t v7 = [(NSMapTable *)self->_lock_deprecated_observerAssertions objectForKey:v6];
    if (v7 || self->_lock_invalidated)
    {
    }
    else if (self->_deprecated_endpoint)
    {
      if (!self->_lock_deprecated_observerAssertions)
      {
        id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        lock_deprecated_observerAssertions = self->_lock_deprecated_observerAssertions;
        self->_lock_deprecated_observerAssertions = v8;
      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v6);
      __int16 v10 = [_FBSDisplayLayoutServiceAssertion alloc];
      deprecated_endpoint = self->_deprecated_endpoint;
      uint64_t deprecated_qos = self->_deprecated_qos;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __39__FBSDisplayLayoutMonitor_addObserver___block_invoke;
      v15[3] = &unk_1E58F6288;
      objc_copyWeak(&v16, &location);
      objc_copyWeak(&v17, &from);
      long long v13 = [(_FBSDisplayLayoutServiceAssertion *)v10 initWithEndpoint:deprecated_endpoint qos:deprecated_qos observer:v15];
      [(NSMapTable *)self->_lock_deprecated_observerAssertions setObject:v13 forKey:v6];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (!self->_deprecated_mutable)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%s is deprecated and only works with monitors created using the deprecated interfaces", "-[FBSDisplayLayoutMonitor removeObserver:]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayLayoutMonitor removeObserver:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  id v8 = v4;
  os_unfair_lock_lock(&self->_lock);
  if (v8)
  {
    id v5 = [(NSMapTable *)self->_lock_deprecated_observerAssertions objectForKey:v8];
    [v5 invalidate];

    [(NSMapTable *)self->_lock_deprecated_observerAssertions removeObjectForKey:v8];
  }
  if (![(NSMapTable *)self->_lock_deprecated_observerAssertions count])
  {
    lock_deprecated_observerAssertions = self->_lock_deprecated_observerAssertions;
    self->_lock_deprecated_observerAssertions = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)qualityOfService
{
  if (!self->_deprecated_mutable)
  {
    id v3 = [NSString stringWithFormat:@"%s is deprecated and only works with monitors created using the deprecated interfaces", "-[FBSDisplayLayoutMonitor qualityOfService]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayLayoutMonitor qualityOfService]();
    }
    [v3 UTF8String];
    _bs_set_crash_log_message();
  }
  if (self->_deprecated_qos == 1) {
    return 21;
  }
  else {
    return 17;
  }
}

- (void)_initWithConfiguration:(const char *)a1 singleton:needsDefaultPriority:mutable:displayType:mutableHandler:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)monitorWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDisplayType:qualityOfService:handler:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handler
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setHandler:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addObserver:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeObserver:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)qualityOfService
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end