@interface EFWatchdog
+ (OS_os_log)log;
- (EFWatchdog)initWithMonitoredBundleIdentifier:(id)a3;
- (NSString)monitoredBundleIdentifier;
- (void)invalidate;
- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4;
- (void)start;
@end

@implementation EFWatchdog

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __17__EFWatchdog_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1) {
    dispatch_once(&log_onceToken_9, block);
  }
  v2 = (void *)log_log_9;
  return (OS_os_log *)v2;
}

void __17__EFWatchdog_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;
}

- (EFWatchdog)initWithMonitoredBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFWatchdog;
  v5 = [(EFWatchdog *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    monitoredBundleIdentifier = v5->_monitoredBundleIdentifier;
    v5->_monitoredBundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_monitor)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EFWatchdog_iOS.m" lineNumber:36 description:@"-[EFWatchdog start] should only be called once"];
  }
  id v3 = (SBSApplicationUserQuitMonitor *)[objc_alloc(MEMORY[0x1E4FA6A00]) initWithDelegate:self];
  monitor = self->_monitor;
  self->_monitor = v3;

  v5 = +[EFWatchdog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(EFWatchdog *)self monitoredBundleIdentifier];
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1B5A59000, v5, OS_LOG_TYPE_DEFAULT, "Monitoring for user termination of bundle identifier %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = +[EFWatchdog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(EFWatchdog *)self monitoredBundleIdentifier];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1B5A59000, v3, OS_LOG_TYPE_DEFAULT, "Stopping monitoring for user termination of bundle identifier %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(SBSApplicationUserQuitMonitor *)self->_monitor invalidate];
}

- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(EFWatchdog *)self monitoredBundleIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    int v9 = +[EFWatchdog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1B5A59000, v9, OS_LOG_TYPE_DEFAULT, "App with bundle identifier %{public}@ was quit by the user, terminating", buf, 0xCu);
    }

    exit(0);
  }
}

- (NSString)monitoredBundleIdentifier
{
  return self->_monitoredBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end