@interface DKPluggedInMonitor
@end

@implementation DKPluggedInMonitor

uint64_t __28___DKPluggedInMonitor_start__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 152))
  {
    uint64_t v1 = result;
    v2 = _DKPluggedInMonitorLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_225002000, v2, OS_LOG_TYPE_INFO, "Received notification for adapter change", v3, 2u);
    }

    return [*(id *)(v1 + 32) setCurrentState];
  }
  return result;
}

@end