@interface BLSHShowWatchdogFailureAlert
@end

@implementation BLSHShowWatchdogFailureAlert

void ___BLSHShowWatchdogFailureAlert_block_invoke(uint64_t a1)
{
  v2 = bls_diagnostics_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ___BLSHShowWatchdogFailureAlert_block_invoke_cold_1(v2);
  }

  v3 = (void *)__blsh_ttrwatchdog_lastFailureDetails;
  if (!__blsh_ttrwatchdog_lastFailureDetails)
  {
    uint64_t v4 = objc_opt_new();
    v5 = (void *)__blsh_ttrwatchdog_lastFailureDetails;
    __blsh_ttrwatchdog_lastFailureDetails = v4;

    v3 = (void *)__blsh_ttrwatchdog_lastFailureDetails;
  }
  v6 = *(void **)(a1 + 32);
  v7 = [v6 identifier];
  [v3 setObject:v6 forKeyedSubscript:v7];

  if (!*(unsigned char *)(a1 + 40))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v9 = (const void *)objc_opt_class();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_blsWatchdogTimerLockStatusDidChange, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

void ___BLSHShowWatchdogFailureAlert_block_invoke_111(uint64_t a1)
{
  v1 = (void *)__blsh_ttrwatchdog_lastFailureDetails;
  if (__blsh_ttrwatchdog_lastFailureDetails)
  {
    v3 = [*(id *)(a1 + 32) identifier];
    uint64_t v4 = [v1 objectForKeyedSubscript:v3];

    if (v4)
    {
      v5 = (void *)__blsh_ttrwatchdog_lastFailureDetails;
      v6 = [*(id *)(a1 + 32) identifier];
      [v5 removeObjectForKey:v6];

      if (![(id)__blsh_ttrwatchdog_lastFailureDetails count])
      {
        v7 = (void *)__blsh_ttrwatchdog_lastFailureDetails;
        __blsh_ttrwatchdog_lastFailureDetails = 0;
      }
    }
  }
}

uint64_t ___BLSHShowWatchdogFailureAlert_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + v2) + 16))();
}

void ___BLSHShowWatchdogFailureAlert_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "-[BLSHInternalTapToRadarManager requestTapToRadar:::] said to try again later. will wait for next lock status change to check again for critical assert", v1, 2u);
}

@end