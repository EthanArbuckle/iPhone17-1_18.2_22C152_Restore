@interface FBSPseudoSceneUpdater
+ (id)sharedInstance;
- (BOOL)canHaveAgent;
- (NSCopying)identifier;
- (id)callOutQueue;
- (id)createSceneFutureWithDefinition:(id)a3;
- (id)hostProcess;
- (id)sceneWithIdentity:(id)a3;
- (id)scenes;
- (void)activateSceneFuture:(id)a3 completion:(id)a4;
- (void)requestSceneWithOptions:(id)a3 completion:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5;
- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5;
@end

@implementation FBSPseudoSceneUpdater

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_31);
  }
  v2 = (void *)sharedInstance_updater;

  return v2;
}

uint64_t __39__FBSPseudoSceneUpdater_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_updater;
  sharedInstance_updater = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)callOutQueue
{
  v2 = +[FBSWorkspace _sharedWorkspaceIfExists];
  v3 = [v2 _callOutQueue];

  return v3;
}

- (id)hostProcess
{
  return +[FBSProcess currentProcess];
}

- (BOOL)canHaveAgent
{
  return 0;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v5 = a3;
  v6 = FBLogSceneClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[FBSPseudoSceneUpdater scene:didReceiveActions:forExtension:](v5, v6);
  }
}

- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [NSString stringWithFormat:@"not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    int v16 = 138544642;
    v17 = v13;
    __int16 v18 = 2114;
    v19 = v15;
    __int16 v20 = 2048;
    v21 = self;
    __int16 v22 = 2114;
    v23 = @"FBSPseudoSceneUpdater.m";
    __int16 v24 = 1024;
    int v25 = 47;
    __int16 v26 = 2114;
    v27 = v12;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);
  }
  [v12 UTF8String];
  _bs_set_crash_log_message();
}

- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [NSString stringWithFormat:@"not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    int v16 = 138544642;
    v17 = v13;
    __int16 v18 = 2114;
    v19 = v15;
    __int16 v20 = 2048;
    v21 = self;
    __int16 v22 = 2114;
    v23 = @"FBSPseudoSceneUpdater.m";
    __int16 v24 = 1024;
    int v25 = 53;
    __int16 v26 = 2114;
    v27 = v12;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);
  }
  [v12 UTF8String];
  _bs_set_crash_log_message();
}

- (id)createSceneFutureWithDefinition:(id)a3
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    id v11 = v7;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2114;
    v17 = @"FBSPseudoSceneUpdater.m";
    __int16 v18 = 1024;
    int v19 = 57;
    __int16 v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

- (void)activateSceneFuture:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    __int16 v14 = v10;
    __int16 v15 = 2114;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    __int16 v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = @"FBSPseudoSceneUpdater.m";
    __int16 v21 = 1024;
    int v22 = 61;
    __int16 v23 = 2114;
    __int16 v24 = v9;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    __int16 v14 = v10;
    __int16 v15 = 2114;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    __int16 v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = @"FBSPseudoSceneUpdater.m";
    __int16 v21 = 1024;
    int v22 = 65;
    __int16 v23 = 2114;
    __int16 v24 = v9;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
}

- (NSCopying)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return (NSCopying *)NSStringFromClass(v2);
}

- (id)scenes
{
  return 0;
}

- (id)sceneWithIdentity:(id)a3
{
  return 0;
}

- (void)scene:(void *)a1 didReceiveActions:(NSObject *)a2 forExtension:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 loggingIdentifier];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Pseudo scenes do not support sending actions.", (uint8_t *)&v4, 0xCu);
}

@end