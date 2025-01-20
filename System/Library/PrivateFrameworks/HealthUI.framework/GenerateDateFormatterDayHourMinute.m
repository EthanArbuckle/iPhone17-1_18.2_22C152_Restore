@interface GenerateDateFormatterDayHourMinute
@end

@implementation GenerateDateFormatterDayHourMinute

id ___GenerateDateFormatterDayHourMinute_block_invoke()
{
  v0 = (void *)__dayHourMinuteFormatter;
  if (!__dayHourMinuteFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__dayHourMinuteFormatter;
    __dayHourMinuteFormatter = (uint64_t)v1;

    v3 = (void *)__dayHourMinuteFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"ccc j:mm a" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__dayHourMinuteFormatter;
  }
  return v0;
}

@end