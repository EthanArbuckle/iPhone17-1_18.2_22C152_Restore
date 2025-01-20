@interface GenerateDateFormatterHourMinute
@end

@implementation GenerateDateFormatterHourMinute

id ___GenerateDateFormatterHourMinute_block_invoke()
{
  v0 = (void *)__hourMinuteFormatter;
  if (!__hourMinuteFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__hourMinuteFormatter;
    __hourMinuteFormatter = (uint64_t)v1;

    v3 = (void *)__hourMinuteFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"j:mm a" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__hourMinuteFormatter;
  }
  return v0;
}

@end