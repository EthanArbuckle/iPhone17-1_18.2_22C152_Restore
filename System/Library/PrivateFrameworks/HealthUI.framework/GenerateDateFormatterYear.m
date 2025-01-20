@interface GenerateDateFormatterYear
@end

@implementation GenerateDateFormatterYear

id ___GenerateDateFormatterYear_block_invoke()
{
  v0 = (void *)__yearFormatter;
  if (!__yearFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__yearFormatter;
    __yearFormatter = (uint64_t)v1;

    v3 = (void *)__yearFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"y" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__yearFormatter;
  }
  return v0;
}

@end