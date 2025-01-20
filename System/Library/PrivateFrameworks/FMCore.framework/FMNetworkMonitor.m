@interface FMNetworkMonitor
+ (id)sharedInstance;
- (BOOL)isMonitoring;
- (BOOL)isNetworkUp;
- (NWPathEvaluator)evaluator;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerNetworkMonitorLaunchEvent:(BOOL)a3;
- (void)setEvaluator:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation FMNetworkMonitor

void __67__FMNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v5 = @"IsNetworkAvailable";
  v3 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"com.apple.icloud.FMNetworkMonitor.networkChanged" object:0 userInfo:v4];
}

- (void)startMonitoring
{
  v3 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
  [(FMNetworkMonitor *)self setEvaluator:v3];

  id v4 = [(FMNetworkMonitor *)self evaluator];
  [v4 addObserver:self forKeyPath:@"path" options:5 context:0];
}

- (void)setEvaluator:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([a3 isEqualToString:@"path"])
  {
    v8 = [v7 path];
    uint64_t v9 = [v8 status];

    v10 = LogCategory_Unspecified();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = @"DOWN";
      if (v9 == 1) {
        v11 = @"UP";
      }
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D0EC4000, v10, OS_LOG_TYPE_INFO, "Network state changed: %@", buf, 0xCu);
    }

    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __67__FMNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    activity_block[3] = &__block_descriptor_33_e5_v8__0l;
    BOOL v13 = v9 == 1;
    _os_activity_initiate(&dword_1D0EC4000, "Network state changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (BOOL)isNetworkUp
{
  BOOL v3 = [(FMNetworkMonitor *)self isMonitoring];
  if (v3)
  {
    id v4 = [(FMNetworkMonitor *)self evaluator];
    v5 = [v4 path];
    uint64_t v6 = [v5 status];

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  return v3;
}

- (BOOL)isMonitoring
{
  v2 = [(FMNetworkMonitor *)self evaluator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance___instance_1;
  return v2;
}

uint64_t __34__FMNetworkMonitor_sharedInstance__block_invoke()
{
  sharedInstance___instance_1 = objc_alloc_init(FMNetworkMonitor);
  return MEMORY[0x1F41817F8]();
}

- (void)stopMonitoring
{
  BOOL v3 = [(FMNetworkMonitor *)self evaluator];
  [v3 removeObserver:self forKeyPath:@"path" context:0];

  [(FMNetworkMonitor *)self setEvaluator:0];
}

- (void)registerNetworkMonitorLaunchEvent:(BOOL)a3
{
  BOOL v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D0EC4000, v3, OS_LOG_TYPE_DEFAULT, "FMNetworkMonitor registerNetworkMonitorLaunchEvent: not implemented for this platform.", v4, 2u);
  }
}

- (void).cxx_destruct
{
}

@end