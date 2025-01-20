@interface GenerateDateFormatterDayHour
@end

@implementation GenerateDateFormatterDayHour

id ___GenerateDateFormatterDayHour_block_invoke()
{
  v0 = (void *)__dayHourFormatter;
  if (!__dayHourFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__dayHourFormatter;
    __dayHourFormatter = (uint64_t)v1;

    v3 = (void *)__dayHourFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"ccc j a" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__dayHourFormatter;
  }
  return v0;
}

@end