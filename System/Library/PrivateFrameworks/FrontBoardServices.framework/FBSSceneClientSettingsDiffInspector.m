@interface FBSSceneClientSettingsDiffInspector
- (FBSSceneClientSettingsDiffInspector)init;
- (void)observeLayersWithBlock:(id)a3;
- (void)observePreferredInterfaceOrientationWithBlock:(id)a3;
- (void)observePreferredLevelWithBlock:(id)a3;
- (void)observePreferredSceneHostIdentifierWithBlock:(id)a3;
- (void)observePreferredSceneHostIdentityWithBlock:(id)a3;
- (void)observeProperty:(SEL)a3 withBlock:(id)a4;
@end

@implementation FBSSceneClientSettingsDiffInspector

- (void)observeProperty:(SEL)a3 withBlock:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"getter != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:](a2, (uint64_t)self, (uint64_t)v11);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  id v15 = v7;
  v8 = objc_opt_class();
  uint64_t v9 = FBSSettingForExtensionSelector(v8, a3);
  if (!v9)
  {
    v12 = NSString;
    v13 = NSStringFromSelector(a3);
    v14 = [v12 stringWithFormat:@"no setting found for %@", v13];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:](a2, (uint64_t)self, (uint64_t)v14);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  v10 = (void *)v9;
  [(FBSSettingsDiffInspector *)self observeSetting:v9 withBlock:v15];
}

- (FBSSceneClientSettingsDiffInspector)init
{
  if (init_onceToken_0 != -1) {
    dispatch_once(&init_onceToken_0, &__block_literal_global_20);
  }
  v4.receiver = self;
  v4.super_class = (Class)FBSSceneClientSettingsDiffInspector;
  return [(FBSSettingsDiffInspector *)&v4 init];
}

- (void)observePreferredInterfaceOrientationWithBlock:(id)a3
{
}

- (void)observeLayersWithBlock:(id)a3
{
}

void __43__FBSSceneClientSettingsDiffInspector_init__block_invoke()
{
  v0 = objc_alloc_init(FBSSceneClientSettings);
}

- (void)observePreferredLevelWithBlock:(id)a3
{
}

- (void)observePreferredSceneHostIdentifierWithBlock:(id)a3
{
}

- (void)observePreferredSceneHostIdentityWithBlock:(id)a3
{
}

- (void)observeProperty:(uint64_t)a3 withBlock:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"FBSSceneClientSettingsDiffInspector.m";
  __int16 v10 = 1024;
  int v11 = 28;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)observeProperty:(uint64_t)a3 withBlock:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"FBSSceneClientSettingsDiffInspector.m";
  __int16 v10 = 1024;
  int v11 = 30;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end