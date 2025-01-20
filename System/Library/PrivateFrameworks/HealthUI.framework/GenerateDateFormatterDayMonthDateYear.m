@interface GenerateDateFormatterDayMonthDateYear
@end

@implementation GenerateDateFormatterDayMonthDateYear

id ___GenerateDateFormatterDayMonthDateYear_block_invoke()
{
  v0 = (void *)__dayMonthDateYearFormatter;
  if (!__dayMonthDateYearFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__dayMonthDateYearFormatter;
    __dayMonthDateYearFormatter = (uint64_t)v1;

    v3 = (void *)__dayMonthDateYearFormatter;
    v4 = CPDateFormatStringForFormatType();
    [v3 setDateFormat:v4];

    v0 = (void *)__dayMonthDateYearFormatter;
  }
  return v0;
}

@end