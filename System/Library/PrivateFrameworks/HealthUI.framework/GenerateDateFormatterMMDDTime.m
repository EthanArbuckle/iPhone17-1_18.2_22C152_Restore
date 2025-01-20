@interface GenerateDateFormatterMMDDTime
@end

@implementation GenerateDateFormatterMMDDTime

id ___GenerateDateFormatterMMDDTime_block_invoke()
{
  v0 = (void *)__MMDDTimeFormatter;
  if (!__MMDDTimeFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__MMDDTimeFormatter;
    __MMDDTimeFormatter = (uint64_t)v1;

    v3 = (void *)__MMDDTimeFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"M/d j:mm a" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__MMDDTimeFormatter;
  }
  return v0;
}

@end