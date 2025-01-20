@interface GenerateDateFormatterMonthDateYear
@end

@implementation GenerateDateFormatterMonthDateYear

id ___GenerateDateFormatterMonthDateYear_block_invoke()
{
  v0 = (void *)__monthDateYearFormatter;
  if (!__monthDateYearFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__monthDateYearFormatter;
    __monthDateYearFormatter = (uint64_t)v1;

    v3 = (void *)__monthDateYearFormatter;
    v4 = CPDateFormatStringForFormatType();
    [v3 setDateFormat:v4];

    v0 = (void *)__monthDateYearFormatter;
  }
  return v0;
}

@end