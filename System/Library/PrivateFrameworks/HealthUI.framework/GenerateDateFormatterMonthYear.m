@interface GenerateDateFormatterMonthYear
@end

@implementation GenerateDateFormatterMonthYear

id ___GenerateDateFormatterMonthYear_block_invoke()
{
  v0 = (void *)__monthYearFormatter;
  if (!__monthYearFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__monthYearFormatter;
    __monthYearFormatter = (uint64_t)v1;

    v3 = (void *)__monthYearFormatter;
    v4 = CPDateFormatStringForFormatType();
    [v3 setDateFormat:v4];

    v0 = (void *)__monthYearFormatter;
  }
  return v0;
}

@end