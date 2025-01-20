@interface GenerateDateFormatterMDYY
@end

@implementation GenerateDateFormatterMDYY

id ___GenerateDateFormatterMDYY_block_invoke()
{
  v0 = (void *)__MDYYFormatter;
  if (!__MDYYFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__MDYYFormatter;
    __MDYYFormatter = (uint64_t)v1;

    v3 = (void *)__MDYYFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"M/d/yy" options:0 locale:v5];
    [v3 setDateFormat:v6];

    v0 = (void *)__MDYYFormatter;
  }
  return v0;
}

@end