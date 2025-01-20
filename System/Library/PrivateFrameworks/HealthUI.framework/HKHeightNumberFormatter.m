@interface HKHeightNumberFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKHeightNumberFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [a5 unitForDisplayType:v8];
  v10 = [MEMORY[0x1E4F2B618] footUnit];
  if ([v9 isEqual:v10])
  {
    [v7 doubleValue];
    v12 = HKFormattedFeetAndInches(v11);
  }
  else
  {
    v13 = HKNumberFormatterWithDecimalPrecisionAndStyle(2, [v8 roundingMode], 1);
    v12 = [v13 stringFromNumber:v7];
  }
  return v12;
}

@end