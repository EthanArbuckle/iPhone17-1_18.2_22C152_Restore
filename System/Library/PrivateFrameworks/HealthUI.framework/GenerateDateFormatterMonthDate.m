@interface GenerateDateFormatterMonthDate
@end

@implementation GenerateDateFormatterMonthDate

id ___GenerateDateFormatterMonthDate_block_invoke()
{
  v0 = (void *)__monthDateFormatter;
  if (!__monthDateFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__monthDateFormatter;
    __monthDateFormatter = (uint64_t)v1;

    v3 = (void *)__monthDateFormatter;
    v4 = CPDateFormatStringForFormatType();
    [v3 setDateFormat:v4];

    v0 = (void *)__monthDateFormatter;
  }
  return v0;
}

@end