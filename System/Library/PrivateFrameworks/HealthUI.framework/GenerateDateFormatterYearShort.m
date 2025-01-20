@interface GenerateDateFormatterYearShort
@end

@implementation GenerateDateFormatterYearShort

id ___GenerateDateFormatterYearShort_block_invoke()
{
  v0 = (void *)__yearShortFormatter;
  if (!__yearShortFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__yearShortFormatter;
    __yearShortFormatter = (uint64_t)v1;

    v3 = (void *)__yearShortFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"yy" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__yearShortFormatter;
  }
  return v0;
}

@end