@interface DKCPUUsageMonitor
@end

@implementation DKCPUUsageMonitor

uint64_t __27___DKCPUUsageMonitor_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getCurrentCPUUsageLevel];
  v3 = *(void **)(a1 + 32);
  return [v3 setCurrentCPUUsageLevel:v2];
}

void __27___DKCPUUsageMonitor_start__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 160) = 0;
  *(void *)(*(void *)(a1 + 32) + 168) = 0;
  *(void *)(*(void *)(a1 + 32) + 152) = 0;
  [*(id *)(a1 + 32) getCPUTicksForUser:*(void *)(a1 + 32) + 152 system:*(void *)(a1 + 32) + 168 idle:*(void *)(a1 + 32) + 160];
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v2);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v3;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 144), 0, 0x2540BE400uLL, 0x5F5E100uLL);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 144);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __27___DKCPUUsageMonitor_start__block_invoke_2;
  handler[3] = &unk_264714788;
  handler[4] = v6;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 144));
  uint64_t v8 = [*(id *)(a1 + 32) getCurrentCPUUsageLevel];
  v9 = [NSNumber numberWithUnsignedInteger:v8];
  v10 = [MEMORY[0x263F351B8] userContext];
  v11 = [MEMORY[0x263F351D0] keyPathForCPUUsageLevel];
  [v10 setObject:v9 forKeyedSubscript:v11];

  *(void *)(*(void *)(a1 + 32) + 176) = v8;
}

@end