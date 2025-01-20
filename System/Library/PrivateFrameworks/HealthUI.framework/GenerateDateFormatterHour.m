@interface GenerateDateFormatterHour
@end

@implementation GenerateDateFormatterHour

id ___GenerateDateFormatterHour_block_invoke()
{
  v0 = (void *)__hourFormatter;
  if (!__hourFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__hourFormatter;
    __hourFormatter = (uint64_t)v1;

    v3 = (void *)__hourFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"j a" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__hourFormatter;
  }
  return v0;
}

@end