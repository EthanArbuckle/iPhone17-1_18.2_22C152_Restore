@interface BLSHBacklightSceneEnvironmentHosting
+ (id)createLocalHostEnvironmentForEnvironment:(id)a3;
+ (void)enableSubhostingForEnvironment:(id)a3 withSessionProvider:(id)a4;
+ (void)enableSubhostingForEnvironment:(id)a3 withSessionProvider:(id)a4 osTimerProvider:(id)a5;
@end

@implementation BLSHBacklightSceneEnvironmentHosting

+ (void)enableSubhostingForEnvironment:(id)a3 withSessionProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(BLSHBacklightOSTimerProvider);
  [a1 enableSubhostingForEnvironment:v7 withSessionProvider:v6 osTimerProvider:v8];
}

+ (void)enableSubhostingForEnvironment:(id)a3 withSessionProvider:(id)a4 osTimerProvider:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v16 delegate];

  if (v11)
  {
    v12 = [[BLSHLocalHostSceneEnvironmentUpdater alloc] initWithSessionProvider:v9 localHostEnvironment:v16 osTimerProvider:v10];
    [v16 setUpdater:v12];
  }
  else
  {
    v13 = NSString;
    v14 = [v16 identifier];
    v15 = [v13 stringWithFormat:@"environment %@ must have a delegate to enable subhosting", v14];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHBacklightSceneEnvironmentHosting enableSubhostingForEnvironment:withSessionProvider:osTimerProvider:](a2, (uint64_t)a1, (uint64_t)v15);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

+ (id)createLocalHostEnvironmentForEnvironment:(id)a3
{
  id v3 = a3;
  v4 = [[BLSHLocalHostSceneEnvironment alloc] initWithBacklightSceneEnvironment:v3];

  return v4;
}

+ (void)enableSubhostingForEnvironment:(const char *)a1 withSessionProvider:(uint64_t)a2 osTimerProvider:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"BLSHBacklightSceneEnvironmentHosting.m";
  __int16 v16 = 1024;
  int v17 = 23;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end