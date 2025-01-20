@interface HKQuantityRange(Formatting)
- (id)_valueStringForType:()Formatting parameters:;
- (id)localizedAttributedStringForType:()Formatting;
- (id)localizedAttributedStringForType:()Formatting parameters:;
- (id)localizedStringForType:()Formatting;
- (id)localizedStringForType:()Formatting parameters:;
- (id)unitStringForType:()Formatting;
- (id)unitStringForType:()Formatting parameters:;
@end

@implementation HKQuantityRange(Formatting)

- (id)unitStringForType:()Formatting
{
  id v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  v6 = [a1 unitStringForType:v4 parameters:v5];

  return v6;
}

- (id)unitStringForType:()Formatting parameters:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 maximum];
  v9 = [v6 unitString:v7 quantity:v8];

  return v9;
}

- (id)localizedStringForType:()Formatting
{
  id v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  id v6 = [a1 localizedStringForType:v4 parameters:v5];

  return v6;
}

- (id)localizedStringForType:()Formatting parameters:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 _valueStringForType:v7 parameters:v6];
  v9 = [a1 maximum];
  v10 = [v6 unitString:v7 quantity:v9];

  LODWORD(v7) = [v6 hasSpaceBetweenValueAndUnit];
  v11 = HKFormatValueAndUnitWithSpaceBetweenValueAndUnit(v8, v10, (int)v7);

  return v11;
}

- (id)localizedAttributedStringForType:()Formatting
{
  id v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  id v6 = [a1 localizedAttributedStringForType:v4 parameters:v5];

  return v6;
}

- (id)localizedAttributedStringForType:()Formatting parameters:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 _valueStringForType:v7 parameters:v6];
  v9 = [a1 maximum];
  v10 = [v6 unitString:v7 quantity:v9];

  v11 = [v6 valueFont];
  if (v11) {
    [v6 valueFont];
  }
  else {
  v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
  }

  v13 = [v6 unitFont];
  if (v13) {
    [v6 unitFont];
  }
  else {
  v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueUnitFont");
  }

  int v15 = [v6 useColor];
  [v6 hasSpaceBetweenValueAndUnit];
  v16 = HKFormatAttributedValueAndUnitWithSpaceBetweenValueAndUnit(v8, v10, v12, v14, v15);

  return v16;
}

- (id)_valueStringForType:()Formatting parameters:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 minimum];
  v9 = [v6 valueString:v7 quantity:v8];

  v10 = [a1 maximum];
  v11 = [v6 valueString:v7 quantity:v10];

  if ([v9 isEqualToString:v11])
  {
    id v12 = v9;
  }
  else
  {
    v13 = NSString;
    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int v15 = [v14 localizedStringForKey:@"RANGE_STRING %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    objc_msgSend(v13, "stringWithFormat:", v15, v9, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

@end