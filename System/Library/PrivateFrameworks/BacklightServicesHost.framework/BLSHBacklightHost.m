@interface BLSHBacklightHost
+ (BOOL)checkForWatchdogDidFire:(BOOL)a3;
+ (id)sharedBacklightHost;
+ (void)registerSharedBacklightHost:(id)a3;
+ (void)registerSharedBacklightHostForTest:(id)a3;
+ (void)sharedBacklightHost;
@end

@implementation BLSHBacklightHost

+ (id)sharedBacklightHost
{
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_1);
  id v3 = (id)_sharedBacklightHost;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_1);
  if (v3)
  {
    return v3;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sharedBacklightHost != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHBacklightHost sharedBacklightHost](a2);
    }
    [v5 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (void)registerSharedBacklightHost:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_1);
  if (!v5)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sharedBacklightHost != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHBacklightHost registerSharedBacklightHost:](a2);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD31F24);
  }
  if (_sharedBacklightHost)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_sharedBacklightHost == nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHBacklightHost registerSharedBacklightHost:](a2);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD31F88);
  }
  _sharedBacklightHost = (uint64_t)v5;

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BLSHBacklightHost_registerSharedBacklightHost___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerSharedBacklightHost__onceToken != -1) {
    dispatch_once(&registerSharedBacklightHost__onceToken, block);
  }
}

void __49__BLSHBacklightHost_registerSharedBacklightHost___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_springboardDidFinishStartup, @"com.apple.springboard.finishedstartup", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (void)registerSharedBacklightHostForTest:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_1);
  v4 = (void *)_sharedBacklightHost;
  _sharedBacklightHost = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_1);
}

+ (BOOL)checkForWatchdogDidFire:(BOOL)a3
{
  return +[BLSHWatchdogProvider checkForWatchdogDidFire:a3];
}

+ (void)registerSharedBacklightHost:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)registerSharedBacklightHost:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)sharedBacklightHost
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end