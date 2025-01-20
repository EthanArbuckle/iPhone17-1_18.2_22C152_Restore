@interface WDHourDateFormatterAMPM
@end

@implementation WDHourDateFormatterAMPM

void ___WDHourDateFormatterAMPM_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_WDHourDateFormatterAMPM___dateFormatter;
  _WDHourDateFormatterAMPM___dateFormatter = (uint64_t)v0;

  v2 = (void *)MEMORY[0x1E4F28C10];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v2 dateFormatFromTemplate:@"ha" options:0 locale:v3];

  [(id)_WDHourDateFormatterAMPM___dateFormatter setDateFormat:v4];
}

@end