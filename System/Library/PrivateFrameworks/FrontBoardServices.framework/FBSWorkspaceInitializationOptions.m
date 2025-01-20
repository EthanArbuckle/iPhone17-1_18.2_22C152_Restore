@interface FBSWorkspaceInitializationOptions
+ (id)optionsWithDelegate:(id)a3;
- (BOOL)_startsInactive;
- (FBSSerialQueue)callOutQueue;
- (FBSWorkspaceDelegate)delegate;
- (FBSWorkspaceInitializationOptions)init;
- (id)_initWithDelegate:(id)a3;
- (void)_setStartsInactive:(BOOL)a3;
- (void)setCallOutQueue:(id)a3;
@end

@implementation FBSWorkspaceInitializationOptions

- (FBSWorkspaceDelegate)delegate
{
  return self->_delegate;
}

- (FBSSerialQueue)callOutQueue
{
  return self->_callOutQueue;
}

- (BOOL)_startsInactive
{
  return self->_startsInactive;
}

- (void)setCallOutQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

+ (id)optionsWithDelegate:(id)a3
{
  id v3 = a3;
  id v4 = [[FBSWorkspaceInitializationOptions alloc] _initWithDelegate:v3];

  return v4;
}

- (id)_initWithDelegate:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSWorkspaceInitializationOptions *)a2 _initWithDelegate:(uint64_t)v11];
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  v7 = v6;
  v12.receiver = self;
  v12.super_class = (Class)FBSWorkspaceInitializationOptions;
  v8 = [(FBSWorkspaceInitializationOptions *)&v12 init];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_delegate, a3);
  }

  return v9;
}

- (FBSWorkspaceInitializationOptions)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on FBSWorkspaceInitializationOptions"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSWorkspaceInitializationOptions.m";
    __int16 v16 = 1024;
    int v17 = 17;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (void)_setStartsInactive:(BOOL)a3
{
  self->_startsInactive = a3;
}

- (void)_initWithDelegate:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSWorkspaceInitializationOptions.m";
  __int16 v16 = 1024;
  int v17 = 22;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end