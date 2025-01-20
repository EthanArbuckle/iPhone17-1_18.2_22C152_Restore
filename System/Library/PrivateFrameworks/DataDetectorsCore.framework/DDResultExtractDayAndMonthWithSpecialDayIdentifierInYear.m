@interface DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear
@end

@implementation DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear

CFStringRef __DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear_block_invoke()
{
  CFStringRef result = createPropertyListForResource(@"Vacations");
  DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear__sVacationsInfoPlist = (uint64_t)result;
  return result;
}

@end