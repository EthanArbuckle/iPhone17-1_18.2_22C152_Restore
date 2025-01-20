@interface BKSGetWatchdogServerWrapper
@end

@implementation BKSGetWatchdogServerWrapper

void ___BKSGetWatchdogServerWrapper_block_invoke()
{
  if (!__service)
  {
    v0 = objc_alloc_init(BKSWatchdogServerWrapper);
    uint64_t v1 = __service;
    __service = (uint64_t)v0;
    MEMORY[0x1F41817F8](v0, v1);
  }
}

@end