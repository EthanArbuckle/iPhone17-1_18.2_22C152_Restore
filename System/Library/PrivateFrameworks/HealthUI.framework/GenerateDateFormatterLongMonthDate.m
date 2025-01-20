@interface GenerateDateFormatterLongMonthDate
@end

@implementation GenerateDateFormatterLongMonthDate

id ___GenerateDateFormatterLongMonthDate_block_invoke()
{
  v0 = (void *)__longMonthDateFormatter;
  if (!__longMonthDateFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v2 = (void *)__longMonthDateFormatter;
    __longMonthDateFormatter = (uint64_t)v1;

    v3 = (void *)__longMonthDateFormatter;
    v4 = CPDateFormatStringForFormatType();
    [v3 setDateFormat:v4];

    v0 = (void *)__longMonthDateFormatter;
  }
  return v0;
}

@end