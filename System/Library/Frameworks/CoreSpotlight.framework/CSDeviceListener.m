@interface CSDeviceListener
+ (id)sharedListener;
- (BOOL)onBattery;
- (CSDeviceListener)init;
@end

@implementation CSDeviceListener

- (BOOL)onBattery
{
  unsigned __int8 v2 = atomic_load(sCSOnBattery);
  return v2 & 1;
}

+ (id)sharedListener
{
  if (sharedListener_defaultOnceToken != -1) {
    dispatch_once(&sharedListener_defaultOnceToken, &__block_literal_global_11);
  }
  unsigned __int8 v2 = (void *)sharedListener___DefaultListener;

  return v2;
}

void __24__CSDeviceListener_init__block_invoke()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    CFErrorRef error = 0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.private.iokit.powersource-control", &error);
    if (v2)
    {
      CFBooleanRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      sCSPowerEntitlement = v5;
      v9 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __24__CSDeviceListener_init__block_invoke_cold_3(v9);
      }

      CFRelease(v3);
    }
    else
    {
      CFErrorRef v6 = error;
      v7 = logForCSLogCategoryDefault();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __24__CSDeviceListener_init__block_invoke_cold_2((uint64_t *)&error, v8);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        __24__CSDeviceListener_init__block_invoke_cold_1(v8);
      }
    }
    if (error)
    {
      CFRelease(error);
      CFErrorRef error = 0;
    }
    CFRelease(v1);
  }
}

uint64_t __34__CSDeviceListener_sharedListener__block_invoke()
{
  sharedListener___DefaultListener = objc_alloc_init(CSDeviceListener);

  return MEMORY[0x1F41817F8]();
}

- (CSDeviceListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSDeviceListener;
  CFBooleanRef v2 = [(CSDeviceListener *)&v7 init];
  if (v2)
  {
    atomic_store(0, sCSOnBattery);
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_3);
    }
    CSQueryPowerState();
    if (sCSPowerEntitlement)
    {
      CFRunLoopSourceRef RunLoopSource = IOPSNotificationCreateRunLoopSource((IOPowerSourceCallbackType)CSQueryPowerState, 0);
      if (RunLoopSource)
      {
        CFTypeID v4 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v4, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
        CFRelease(v4);
        CSQueryPowerState();
      }
    }
  }
  return v2;
}

void __24__CSDeviceListener_init__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  CFBooleanRef v2 = @"com.apple.private.iokit.powersource-control";
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "Couldn't find \"%@\" entitlement", (uint8_t *)&v1, 0xCu);
}

void __24__CSDeviceListener_init__block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  CFTypeID v4 = @"com.apple.private.iokit.powersource-control";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "SecTaskCopyValueForEntitlement failed for \"%@\", error:%@", (uint8_t *)&v3, 0x16u);
}

void __24__CSDeviceListener_init__block_invoke_cold_3(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  uint64_t v2 = @"com.apple.private.iokit.powersource-control";
  __int16 v3 = 2112;
  CFTypeID v4 = @"YES";
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "Found \"%@\" entitlement, value:%@", (uint8_t *)&v1, 0x16u);
}

@end