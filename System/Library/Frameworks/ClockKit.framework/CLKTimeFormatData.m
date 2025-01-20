@interface CLKTimeFormatData
@end

@implementation CLKTimeFormatData

uint64_t __47___CLKTimeFormatData__timeFormatDataAccessLock__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08958]);
  uint64_t v1 = _timeFormatDataAccessLock_accessLock;
  _timeFormatDataAccessLock_accessLock = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end