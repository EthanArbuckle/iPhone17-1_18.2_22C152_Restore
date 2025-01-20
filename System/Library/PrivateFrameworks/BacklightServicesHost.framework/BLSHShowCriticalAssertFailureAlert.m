@interface BLSHShowCriticalAssertFailureAlert
@end

@implementation BLSHShowCriticalAssertFailureAlert

void ___BLSHShowCriticalAssertFailureAlert_block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = bls_diagnostics_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ___BLSHShowCriticalAssertFailureAlert_block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v12 = (const void *)objc_opt_class();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)_blsCriticalAssertLockStatusDidChange, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  else
  {
    BLSHResetCriticalAssertFailure();
  }
}

void ___BLSHShowCriticalAssertFailureAlert_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end