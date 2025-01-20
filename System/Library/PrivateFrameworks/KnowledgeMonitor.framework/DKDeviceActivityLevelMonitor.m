@interface DKDeviceActivityLevelMonitor
@end

@implementation DKDeviceActivityLevelMonitor

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 lastInUseStatus];
  return [v1 updatePerformanceThrottleStatusWithLevel:v2];
}

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38___DKDeviceActivityLevelMonitor_start__block_invoke_2;
  v7[3] = &unk_264714788;
  v7[4] = *(void *)(a1 + 32);
  v3 = v7;
  v4 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
  block[3] = &unk_2647148A0;
  id v9 = v4;
  id v10 = v3;
  id v5 = v4;
  dispatch_async(v2, block);

  return 1;
}

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePerformanceThrottleStatusWithLevel:*(void *)(a1 + 40) & 2];
}

uint64_t __38___DKDeviceActivityLevelMonitor_start__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 currentInUseStatus];
  return [v1 updateActivityDateAndInUseState:v2];
}

void __38___DKDeviceActivityLevelMonitor_start__block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF910] date];
  [*(id *)(a1 + 32) setLastActivityDate:v2];
  [*(id *)(a1 + 32) setLastSetActiveDate:v2];
}

void __38___DKDeviceActivityLevelMonitor_start__block_invoke_6(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v6 = [*(id *)(a1 + 32) debounceTimer];
  dispatch_suspend(v6);

  [*(id *)(a1 + 32) setCurrentInUseStatus:a2 & 0xFFFFFFFFFFFFFFFDLL];
  v7 = [*(id *)(a1 + 32) debounceTimer];
  if (a3 >= 2) {
    int64_t v8 = 2000000000;
  }
  else {
    int64_t v8 = 0;
  }
  dispatch_time_t v9 = dispatch_walltime(0, v8);
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

  id v10 = [*(id *)(a1 + 32) debounceTimer];
  dispatch_resume(v10);
}

@end