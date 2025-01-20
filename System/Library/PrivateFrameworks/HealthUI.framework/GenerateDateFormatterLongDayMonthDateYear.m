@interface GenerateDateFormatterLongDayMonthDateYear
@end

@implementation GenerateDateFormatterLongDayMonthDateYear

id ___GenerateDateFormatterLongDayMonthDateYear_block_invoke()
{
  v0 = (void *)__longDayMonthDateYearFormatter;
  if (!__longDayMonthDateYearFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__longDayMonthDateYearFormatter;
    __longDayMonthDateYearFormatter = (uint64_t)v1;

    v3 = (void *)__longDayMonthDateYearFormatter;
    v4 = CPDateFormatStringForFormatType();
    [v3 setDateFormat:v4];

    v0 = (void *)__longDayMonthDateYearFormatter;
  }
  return v0;
}

@end