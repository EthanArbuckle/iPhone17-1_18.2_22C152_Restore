@interface BLSHService
+ (id)sharedService;
+ (id)startLocalOnlyServiceWithConfiguration:(id)a3;
+ (id)startServiceWithPlatformProvider:(id)a3;
+ (id)startServiceWithPlatformProvider:(id)a3 localOnly:(BOOL)a4;
+ (void)earlyInitialization;
+ (void)sharedService;
- (BLSHInactiveBudgetPolicing)inactiveBudgetPolicy;
- (BLSHLocalAssertionService)localAssertionService;
- (BLSHService)initWithPlatformProvider:(id)a3 localOnly:(BOOL)a4;
- (BLSHServicePlatformProvider)platformProvider;
- (BOOL)deviceSupportsAlwaysOn;
- (void)beginSpecialManagementForHostEnvironment:(id)a3;
- (void)deregisterSceneWorkspace:(id)a3;
- (void)registerSceneWorkspace:(id)a3;
@end

@implementation BLSHService

+ (void)earlyInitialization
{
}

+ (id)startServiceWithPlatformProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = [a1 startServiceWithPlatformProvider:v5 localOnly:0];

    return v7;
  }
  else
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"platformProvider != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHService startServiceWithPlatformProvider:](a2);
    }
    [v9 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)startLocalOnlyServiceWithConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)objc_opt_new();
  }
  id v5 = [[BLSHLocalOnlySimplePlatformProvider alloc] initWithConfiguration:v4];
  [MEMORY[0x263F29AB0] setIsHostProcess:1];
  v6 = [a1 startServiceWithPlatformProvider:v5 localOnly:1];

  return v6;
}

+ (id)startServiceWithPlatformProvider:(id)a3 localOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  os_unfair_lock_lock(&_classLock_2);
  if (_sharedService)
  {
    v10 = [NSString stringWithFormat:@"only one BLSHService can be registered"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHService startServiceWithPlatformProvider:localOnly:](a2);
    }
    [v10 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithPlatformProvider:v7 localOnly:v4];
    objc_storeStrong((id *)&_sharedService, v8);
    os_unfair_lock_unlock(&_classLock_2);

    return v8;
  }
  return result;
}

+ (id)sharedService
{
  os_unfair_lock_lock(&_classLock_2);
  id v3 = (id)_sharedService;
  os_unfair_lock_unlock(&_classLock_2);
  if (v3)
  {
    return v3;
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"[BLSHService sharedService] should not be called before startServiceWithPlatformProvider:"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHService sharedService](a2);
    }
    [v5 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BLSHService)initWithPlatformProvider:(id)a3 localOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BLSHService;
  v8 = [(BLSHService *)&v30 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_platformProvider, a3);
    v10 = [v7 backlightPlatformProvider];
    char v11 = objc_opt_respondsToSelector();
    v12 = v7;
    if (v11 & 1) != 0 || (char v13 = objc_opt_respondsToSelector(), v12 = v10, (v13)) {
      [v12 serviceInitializing:v9];
    }
    v14 = [[BLSHBacklightOSInterfaceProvider alloc] initWithPlatformProvider:v10];
    osInterfaceProvider = v9->_osInterfaceProvider;
    v9->_osInterfaceProvider = v14;

    +[BLSHBacklightOSInterfaceProvider setSharedProvider:v9->_osInterfaceProvider];
    uint64_t v16 = +[BLSHAssertionService serviceWithOSInterfaceProvider:v9->_osInterfaceProvider localOnly:v4];
    assertionService = v9->_assertionService;
    v9->_assertionService = (BLSHAssertionService *)v16;

    v18 = [[BLSHInactiveBudgetPolicy alloc] initWithOSTimerProvider:v9->_osInterfaceProvider];
    inactiveBudgetPolicy = v9->_inactiveBudgetPolicy;
    v9->_inactiveBudgetPolicy = (BLSHInactiveBudgetPolicing *)v18;
    v20 = v18;

    v21 = v9->_osInterfaceProvider;
    v22 = [(BLSHAssertionService *)v9->_assertionService localAssertionService];
    [(BLSHBacklightOSInterfaceProvider *)v21 registerHandlersForService:v22];

    v23 = v9->_osInterfaceProvider;
    v24 = [(BLSHAssertionService *)v9->_assertionService localAssertionService];
    uint64_t v25 = +[BLSHBacklightService serviceWithPlatformProvider:v10 osInterfaceProvider:v23 inactiveBudgetPolicy:v20 localAssertionService:v24 localOnly:v4];
    backlightService = v9->_backlightService;
    v9->_backlightService = (BLSHBacklightService *)v25;

    v27 = objc_alloc_init(BLSHDefaultsObserver);
    defaultsObserver = v9->_defaultsObserver;
    v9->_defaultsObserver = v27;
  }
  return v9;
}

- (BOOL)deviceSupportsAlwaysOn
{
  return [(BLSHBacklightOSInterfaceProvider *)self->_osInterfaceProvider deviceSupportsAlwaysOn];
}

- (BLSHLocalAssertionService)localAssertionService
{
  return [(BLSHAssertionService *)self->_assertionService localAssertionService];
}

- (void)registerSceneWorkspace:(id)a3
{
}

- (void)deregisterSceneWorkspace:(id)a3
{
}

- (void)beginSpecialManagementForHostEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = bls_backlight_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(BLSHService *)(uint64_t)self beginSpecialManagementForHostEnvironment:v5];
  }
}

- (BLSHServicePlatformProvider)platformProvider
{
  return self->_platformProvider;
}

- (BLSHInactiveBudgetPolicing)inactiveBudgetPolicy
{
  return self->_inactiveBudgetPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_platformProvider, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_backlightService, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);

  objc_storeStrong((id *)&self->_assertionService, 0);
}

+ (void)startServiceWithPlatformProvider:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)startServiceWithPlatformProvider:(const char *)a1 localOnly:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)sharedService
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)beginSpecialManagementForHostEnvironment:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 identifier];
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_ERROR, "%p beginSpecialManagementForHostEnvironment:%{public}@ is no longer necessary", (uint8_t *)&v6, 0x16u);
}

@end