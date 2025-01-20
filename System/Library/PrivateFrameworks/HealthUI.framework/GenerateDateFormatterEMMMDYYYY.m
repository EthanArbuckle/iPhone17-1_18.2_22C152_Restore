@interface GenerateDateFormatterEMMMDYYYY
@end

@implementation GenerateDateFormatterEMMMDYYYY

id ___GenerateDateFormatterEMMMDYYYY_block_invoke()
{
  v0 = (void *)__EMMMDYYYYFormatter;
  if (!__EMMMDYYYYFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__EMMMDYYYYFormatter;
    __EMMMDYYYYFormatter = (uint64_t)v1;

    v3 = (void *)__EMMMDYYYYFormatter;
    v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v6 = [v4 dateFormatFromTemplate:@"E, MMM d, yyyy", 0, v5 options locale];
    [v3 setDateFormat:v6];

    v0 = (void *)__EMMMDYYYYFormatter;
  }
  return v0;
}

@end