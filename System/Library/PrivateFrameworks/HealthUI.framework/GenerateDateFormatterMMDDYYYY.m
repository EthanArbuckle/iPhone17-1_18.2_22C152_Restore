@interface GenerateDateFormatterMMDDYYYY
@end

@implementation GenerateDateFormatterMMDDYYYY

id ___GenerateDateFormatterMMDDYYYY_block_invoke()
{
  v0 = (void *)__MMDDYYYYFormatter;
  if (!__MMDDYYYYFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__MMDDYYYYFormatter;
    __MMDDYYYYFormatter = (uint64_t)v1;

    v3 = (void *)__MMDDYYYYFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"MM/dd/yyyy" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__MMDDYYYYFormatter;
  }
  return v0;
}

@end