@interface DKInCarMonitor
@end

@implementation DKInCarMonitor

uint64_t __24___DKInCarMonitor_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConnectedStatus:1];
}

uint64_t __24___DKInCarMonitor_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConnectedStatus:0];
}

uint64_t __24___DKInCarMonitor_start__block_invoke_3(uint64_t a1)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 148), &state64);
  if (!result)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 145) = state64 != 0;
    return [(id)objc_opt_class() setIsConnected:*(unsigned __int8 *)(*(void *)(a1 + 32) + 145)];
  }
  return result;
}

@end