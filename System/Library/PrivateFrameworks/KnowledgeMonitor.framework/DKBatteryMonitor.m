@interface DKBatteryMonitor
@end

@implementation DKBatteryMonitor

void __26___DKBatteryMonitor_start__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (IOPSGetSupportedPowerSources())
  {
    v4 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __26___DKBatteryMonitor_start__block_invoke_cold_1(v4);
    }
  }
  else
  {
    notify_cancel(a2);
    [WeakRetained setHasInternalBattery:0];
    [WeakRetained completeStart];
  }
}

void __26___DKBatteryMonitor_start__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225002000, log, OS_LOG_TYPE_ERROR, "Got battery attach notification but still can't determine power sources.", v1, 2u);
}

@end