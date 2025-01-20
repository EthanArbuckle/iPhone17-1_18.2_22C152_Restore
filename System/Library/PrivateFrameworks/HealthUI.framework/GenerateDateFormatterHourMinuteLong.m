@interface GenerateDateFormatterHourMinuteLong
@end

@implementation GenerateDateFormatterHourMinuteLong

id ___GenerateDateFormatterHourMinuteLong_block_invoke()
{
  v0 = (void *)__hourMinuteLongFormatter;
  if (!__hourMinuteLongFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__hourMinuteLongFormatter;
    __hourMinuteLongFormatter = (uint64_t)v1;

    v3 = (void *)__hourMinuteLongFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"j:mm:ss.SS a" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__hourMinuteLongFormatter;
  }
  return v0;
}

@end