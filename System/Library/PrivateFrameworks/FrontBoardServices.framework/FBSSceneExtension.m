@interface FBSSceneExtension
+ (BOOL)propagateToSceneWithDefinition:(id)a3;
+ (BOOL)softLinkExtensionFrameworkInClient;
+ (id)_frameworkNameLoadingIfNeeded:(BOOL)a3;
+ (id)alloc;
+ (id)clientComponents;
+ (id)clientSettingsExtensions;
+ (id)description;
+ (id)hostComponents;
+ (id)settingsExtensions;
+ (id)transitionContextExtensions;
+ (void)initialize;
@end

@implementation FBSSceneExtension

+ (BOOL)propagateToSceneWithDefinition:(id)a3
{
  return 0;
}

+ (id)clientComponents
{
  return 0;
}

id __31__FBSSceneExtension_initialize__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _frameworkNameLoadingIfNeeded:1];
}

+ (id)_frameworkNameLoadingIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);
  objc_getAssociatedObject(a1, (const void *)_FBSFrameworkKey);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    v7 = (void *)MEMORY[0x19F398F90]();
    os_unfair_lock_unlock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
    v9 = [v8 executablePath];
    uint64_t v10 = [v9 lastPathComponent];
    v11 = (void *)v10;
    v12 = @"(unknown)";
    if (v10) {
      v12 = (__CFString *)v10;
    }
    v5 = v12;

    os_unfair_lock_lock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);
    objc_setAssociatedObject(a1, (const void *)_FBSFrameworkKey, v5, (void *)1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);

  return v5;
}

+ (id)clientSettingsExtensions
{
  return 0;
}

+ (void)initialize
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_15(&dword_19C680000, v2, v3, "Soft-linking extensions are only supported on internal installs: \"%{public}@\"", v4, v5, v6, v7, 2u);
}

+ (id)transitionContextExtensions
{
  return 0;
}

+ (BOOL)softLinkExtensionFrameworkInClient
{
  return 0;
}

+ (id)settingsExtensions
{
  return 0;
}

+ (id)alloc
{
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromClass((Class)a1);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is not intended to be instantiated", v5];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v11 = v7;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2048;
    id v15 = a1;
    __int16 v16 = 2114;
    v17 = @"FBSSceneExtension.m";
    __int16 v18 = 1024;
    int v19 = 220;
    __int16 v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

+ (id)hostComponents
{
  return 0;
}

+ (id)description
{
  uint64_t v3 = [a1 _frameworkNameLoadingIfNeeded:0];
  if (v3)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = NSStringFromClass((Class)a1);
    uint64_t v6 = [v4 stringWithFormat:@"%@ (%@)", v5, v3];
  }
  else
  {
    uint64_t v6 = NSStringFromClass((Class)a1);
  }

  return v6;
}

@end