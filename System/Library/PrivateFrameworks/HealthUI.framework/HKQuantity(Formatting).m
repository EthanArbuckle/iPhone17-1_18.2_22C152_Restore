@interface HKQuantity(Formatting)
- (id)localizedAttributedStringForType:()Formatting;
- (id)localizedAttributedStringForType:()Formatting parameters:;
- (id)localizedStringForType:()Formatting;
- (id)localizedStringForType:()Formatting parameters:;
- (id)unitStringForType:()Formatting;
- (uint64_t)unitStringForType:()Formatting parameters:;
@end

@implementation HKQuantity(Formatting)

- (id)unitStringForType:()Formatting
{
  id v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  v6 = [a1 unitStringForType:v4 parameters:v5];

  return v6;
}

- (uint64_t)unitStringForType:()Formatting parameters:
{
  return [a4 unitString:a3 quantity:a1];
}

- (id)localizedStringForType:()Formatting
{
  id v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  v6 = [a1 localizedStringForType:v4 parameters:v5];

  return v6;
}

- (id)localizedStringForType:()Formatting parameters:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 valueString:v7 quantity:a1];
  v9 = [v6 unitString:v7 quantity:a1];

  LODWORD(v7) = [v6 hasSpaceBetweenValueAndUnit];
  v10 = HKFormatValueAndUnitWithSpaceBetweenValueAndUnit(v8, v9, (int)v7);

  return v10;
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
  v8 = [v6 valueString:v7 quantity:a1];
  v9 = [v6 unitString:v7 quantity:a1];

  v10 = [v6 valueFont];
  if (v10) {
    [v6 valueFont];
  }
  else {
  v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
  }

  v12 = [v6 unitFont];
  if (v12) {
    [v6 unitFont];
  }
  else {
  v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueUnitFont");
  }

  int v14 = [v6 useColor];
  [v6 hasSpaceBetweenValueAndUnit];
  v15 = HKFormatAttributedValueAndUnitWithSpaceBetweenValueAndUnit(v8, v9, v11, v13, v14);

  return v15;
}

@end