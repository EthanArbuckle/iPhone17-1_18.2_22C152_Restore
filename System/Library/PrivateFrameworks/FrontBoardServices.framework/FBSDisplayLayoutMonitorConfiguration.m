@interface FBSDisplayLayoutMonitorConfiguration
+ (id)configurationForDefaultMainDisplayMonitor;
+ (id)configurationWithEndpoint:(id)a3;
- (BOOL)needsUserInteractivePriority;
- (BSServiceConnectionEndpoint)endpoint;
- (FBSDisplayLayoutMonitorConfiguration)init;
- (id)_initWithEndpoint:(id)a3;
- (id)transitionHandler;
- (void)setNeedsUserInteractivePriority:(BOOL)a3;
- (void)setTransitionHandler:(id)a3;
@end

@implementation FBSDisplayLayoutMonitorConfiguration

- (void)setTransitionHandler:(id)a3
{
}

+ (id)configurationWithEndpoint:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Bsserviceconne.isa);
  if (!v3)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }

  v4 = [v3 service];
  v5 = +[FBSDisplayLayoutMonitor serviceIdentifier];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"service identifier of endpoint is mismatched : endpoint=%@", v3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = [[FBSDisplayLayoutMonitorConfiguration alloc] _initWithEndpoint:v3];

  return v7;
}

+ (id)configurationForDefaultMainDisplayMonitor
{
  v2 = [FBSDisplayLayoutMonitorConfiguration alloc];
  id v3 = +[FBSDisplayLayoutMonitor _endpointForDisplayType:0];
  id v4 = [(FBSDisplayLayoutMonitorConfiguration *)v2 _initWithEndpoint:v3];

  return v4;
}

- (id)_initWithEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSDisplayLayoutMonitorConfiguration;
  char v6 = [(FBSDisplayLayoutMonitorConfiguration *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endpoint, a3);
  }

  return v7;
}

- (id)transitionHandler
{
  return self->_transitionHandler;
}

- (BOOL)needsUserInteractivePriority
{
  return self->_needsUserInteractivePriority;
}

- (BSServiceConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setNeedsUserInteractivePriority:(BOOL)a3
{
  self->_needsUserInteractivePriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionHandler, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (FBSDisplayLayoutMonitorConfiguration)init
{
  id v4 = [NSString stringWithFormat:@"init is not allowed on FBSDisplayLayoutMonitorConfiguration"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    char v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    objc_super v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSDisplayLayoutMonitor.m";
    __int16 v16 = 1024;
    int v17 = 356;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

+ (void)configurationWithEndpoint:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)configurationWithEndpoint:.cold.2()
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