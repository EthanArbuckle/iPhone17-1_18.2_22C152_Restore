@interface HKRelativeNumberFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKRelativeNumberFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6 = a3;
  v7 = HKNumberFormatterWithDecimalPrecisionAndStyle(2, [a4 roundingMode], 1);
  v8 = (void *)[v7 copy];

  v9 = [v8 plusSign];
  [v8 setPositivePrefix:v9];

  v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableCurrentLocale");
  [v8 setLocale:v10];

  v11 = [v8 stringFromNumber:&unk_1F3C229A0];
  v12 = [v8 stringFromNumber:&unk_1F3C229B0];
  v13 = [v8 stringFromNumber:v6];

  if (([v13 isEqualToString:v11] & 1) != 0 || objc_msgSend(v13, "isEqualToString:", v12))
  {
    [v8 setPositivePrefix:0];
    id v14 = [v8 stringFromNumber:&unk_1F3C229B0];
  }
  else
  {
    id v14 = v13;
  }
  v15 = v14;

  return v15;
}

@end