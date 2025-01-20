@interface BSPowerChanged
@end

@implementation BSPowerChanged

void ___BSPowerChanged_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = BSLogPowerMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_INFO, "kIOMessageCanSystemSleep -> powerMonitorSystemSleepRequested -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 powerMonitorSystemSleepRequested:*(void *)(a1 + 32)] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void ___BSPowerChanged_block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = BSLogPowerMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemWillNotSleep -> powerMonitorSystemSleepRequestAborted -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v3 powerMonitorSystemSleepRequestAborted:*(void *)(a1 + 32)];
  }
}

void ___BSPowerChanged_block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = BSLogPowerMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemWillSleep -> powerMonitorSystemWillSleep -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v3 powerMonitorSystemWillSleep:*(void *)(a1 + 32)];
  }
}

void ___BSPowerChanged_block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = BSLogPowerMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemWillPowerOn -> powerMonitorSystemWillWakeFromSleep -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v3 powerMonitorSystemWillWakeFromSleep:*(void *)(a1 + 32)];
  }
}

void ___BSPowerChanged_block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = BSLogPowerMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_INFO, "kIOMessageSystemHasPoweredOn -> powerMonitorSystemDidWakeFromSleep -> observer: %@", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v3 powerMonitorSystemDidWakeFromSleep:*(void *)(a1 + 32)];
  }
}

@end