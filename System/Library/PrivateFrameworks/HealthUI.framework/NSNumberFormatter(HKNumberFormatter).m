@interface NSNumberFormatter(HKNumberFormatter)
- (uint64_t)returnsUnitWithValueForDisplay;
@end

@implementation NSNumberFormatter(HKNumberFormatter)

- (uint64_t)returnsUnitWithValueForDisplay
{
  return 0;
}

@end