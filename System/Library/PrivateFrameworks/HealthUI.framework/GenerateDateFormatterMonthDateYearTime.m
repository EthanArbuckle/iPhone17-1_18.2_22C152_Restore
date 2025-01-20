@interface GenerateDateFormatterMonthDateYearTime
@end

@implementation GenerateDateFormatterMonthDateYearTime

id ___GenerateDateFormatterMonthDateYearTime_block_invoke()
{
  v0 = (void *)__monthDateYearTimeFormatter;
  if (!__monthDateYearTimeFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__monthDateYearTimeFormatter;
    __monthDateYearTimeFormatter = (uint64_t)v1;

    v3 = (void *)__monthDateYearTimeFormatter;
    v4 = CPDateFormatStringForFormatType();
    [v3 setDateFormat:v4];

    v0 = (void *)__monthDateYearTimeFormatter;
  }
  return v0;
}

@end