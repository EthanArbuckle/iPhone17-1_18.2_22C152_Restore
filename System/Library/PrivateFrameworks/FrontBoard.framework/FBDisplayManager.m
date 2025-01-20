@interface FBDisplayManager
+ (FBSDisplayConfiguration)mainConfiguration;
+ (FBSDisplayConfiguration)mainDisplay;
+ (FBSDisplayIdentity)mainIdentity;
+ (id)sharedInstance;
- (FBDisplayManager)init;
- (FBDisplayManager)initWithInitializationCompletion:(id)a3;
- (FBDisplayManager)initWithTransformer:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FBDisplayManager

+ (FBSDisplayIdentity)mainIdentity
{
  v2 = [a1 sharedInstance];
  v3 = [v2 mainIdentity];

  return (FBSDisplayIdentity *)v3;
}

+ (FBSDisplayConfiguration)mainConfiguration
{
  v2 = [a1 sharedInstance];
  v3 = [v2 mainConfiguration];

  return (FBSDisplayConfiguration *)v3;
}

+ (id)sharedInstance
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__FBDisplayManager_sharedInstance__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (sharedInstance_onceToken_7 != -1) { {
    dispatch_once(&sharedInstance_onceToken_7, v4);
  }
  }
  v2 = (void *)sharedInstance___sharedInstance_2;

  return v2;
}

- (FBDisplayManager)init
{
  v4 = [NSString stringWithFormat:@"-init is not allowed - call +sharedInstance instead"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"FBDisplayManager.m";
    __int16 v17 = 1024;
    int v18 = 21;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBDisplayManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBDisplayManager)initWithInitializationCompletion:(id)a3
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"-initWithInitializationCompletion: is not allowed - call +sharedInstance instead"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    v16 = self;
    __int16 v17 = 2114;
    int v18 = @"FBDisplayManager.m";
    __int16 v19 = 1024;
    int v20 = 26;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  result = (FBDisplayManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBDisplayManager)initWithTransformer:(id)a3
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"-initWithTransformer: is not allowed - call +sharedInstance instead"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    v16 = self;
    __int16 v17 = 2114;
    int v18 = @"FBDisplayManager.m";
    __int16 v19 = 1024;
    int v20 = 31;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  result = (FBDisplayManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)invalidate
{
  v4 = [NSString stringWithFormat:@"you cannot invalidate FBDisplayManager"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    int v9 = v5;
    __int16 v10 = 2114;
    int v11 = v7;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = @"FBDisplayManager.m";
    __int16 v16 = 1024;
    int v17 = 36;
    __int16 v18 = 2114;
    __int16 v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __34__FBDisplayManager_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 infoDictionary];
  objc_msgSend(v3, "bs_safeStringForKey:", @"FBDisplayManagerTransformer");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    id v10 = objc_alloc_init(NSClassFromString(v4));
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v5 = [NSString stringWithFormat:@"Transformer specified must conform to <FBSDisplayTransformer>."];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        __34__FBDisplayManager_sharedInstance__block_invoke_cold_1(a1, (uint64_t)v5);
      }
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6358358);
    }
  }
  else
  {
    id v10 = 0;
  }
  if (UIKitLibraryCore() && (id v6 = getUIApplicationClass()) != 0)
  {
    v7 = [v6 displayManagerObserver];
  }
  else
  {
    v7 = 0;
  }
  id v8 = [(FBSDisplayMonitor *)[FBDisplayManager alloc] _initWithBookendObserver:v7 transformer:v10];
  int v9 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v8;
}

- (void)dealloc
{
  v4 = [NSString stringWithFormat:@"this singleton must be not deallocated"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    int v9 = v5;
    __int16 v10 = 2114;
    int v11 = v7;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = @"FBDisplayManager.m";
    __int16 v16 = 1024;
    int v17 = 62;
    __int16 v18 = 2114;
    __int16 v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

+ (FBSDisplayConfiguration)mainDisplay
{
  v2 = [a1 sharedInstance];
  v3 = [v2 mainConfiguration];

  return (FBSDisplayConfiguration *)v3;
}

void __34__FBDisplayManager_sharedInstance__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(*(SEL *)(a1 + 32));
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138544642;
  int v9 = v4;
  __int16 v10 = 2114;
  int v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  __int16 v15 = @"FBDisplayManager.m";
  __int16 v16 = 1024;
  int v17 = 48;
  __int16 v18 = 2114;
  uint64_t v19 = a2;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end