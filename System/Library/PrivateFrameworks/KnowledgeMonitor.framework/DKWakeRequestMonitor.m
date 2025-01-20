@interface DKWakeRequestMonitor
@end

@implementation DKWakeRequestMonitor

uint64_t __30___DKWakeRequestMonitor_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) obtainNextUserVisibleWakeRequest];
}

void __30___DKWakeRequestMonitor_start__block_invoke_2(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 168);
  dispatch_time_t v2 = dispatch_walltime(0, 2000000000);
  dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void *__57___DKWakeRequestMonitor_synchronouslyReflectCurrentValue__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[19]) {
    return (void *)[result obtainNextUserVisibleWakeRequest];
  }
  return result;
}

@end