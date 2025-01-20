@interface CachedCurrentCalendar
@end

@implementation CachedCurrentCalendar

uint64_t ___CachedCurrentCalendar_block_invoke()
{
  _CachedCurrentCalendar___calendar = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  return MEMORY[0x270F9A758]();
}

@end