@interface WDHourDateFormatter24Hour
@end

@implementation WDHourDateFormatter24Hour

uint64_t ___WDHourDateFormatter24Hour_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_WDHourDateFormatter24Hour___dateFormatter;
  _WDHourDateFormatter24Hour___dateFormatter = (uint64_t)v0;

  v2 = (void *)_WDHourDateFormatter24Hour___dateFormatter;
  return [v2 setDateFormat:@"H"];
}

@end