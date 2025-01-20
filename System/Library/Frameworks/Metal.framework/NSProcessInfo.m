@interface NSProcessInfo
@end

@implementation NSProcessInfo

uint64_t __63__NSProcessInfo_MTLDeviceCertification__hasPerformanceProfile___block_invoke()
{
  v0 = (const char *)kSemNotification;
  global_queue = dispatch_get_global_queue(0, 0);

  return notify_register_dispatch(v0, &_semNotifyToken, global_queue, &__block_literal_global_8_0);
}

uint64_t __63__NSProcessInfo_MTLDeviceCertification__hasPerformanceProfile___block_invoke_2()
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(_semNotifyToken, &state64);
  uint64_t v1 = _semState;
  _semState = state64;
  if (state64 != v1)
  {
    v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    return objc_msgSend(v2, "postNotificationName:object:", @"com.apple.system.performance_profile_changed", objc_msgSend(NSNumber, "numberWithInteger:", state64 != 0));
  }
  return result;
}

@end