@interface StockAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityLabelWithMarketCap:(BOOL)a3;
- (id)_accessibilitySpeakThisString;
- (id)accessibilityLabel;
@end

@implementation StockAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Stock";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return [(StockAccessibility *)self _accessibilityLabelWithMarketCap:1];
}

- (id)_accessibilityLabelWithMarketCap:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v5 = v4;
  if (v4)
  {
    v6 = [v4 companyName];
    v7 = [v5 formattedPrice];
    v8 = [v5 formattedChange];
    v9 = [v5 formattedChangePercent];
    v10 = [v5 marketcap];
    v11 = [MEMORY[0x263F79940] BlankValueString];
    if (([v10 isEqualToString:v11] & 1) == 0)
    {
      v12 = (void *)MEMORY[0x263F08A30];
      v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
      uint64_t v14 = [v12 localizedStringFromNumber:v13 numberStyle:5];

      v10 = (void *)v14;
    }
    int v15 = [v5 changeIsNegative];
    if (v15)
    {
      uint64_t v16 = [@"-" stringByAppendingString:v9];

      v9 = (void *)v16;
    }
    if (v6)
    {
      BOOL v35 = v3;
      v41 = v6;
      v42 = v7;
      if (v7)
      {
        v17 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];
        [v17 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F217E8]];
      }
      else
      {
        v17 = 0;
      }
      v39 = v17;
      if (v15) {
        v19 = @"down";
      }
      else {
        v19 = @"up";
      }
      v38 = accessibilityLocalizedString(v19);
      v20 = [NSString stringWithFormat:v8];
      v21 = [MEMORY[0x263F21660] axAttributedStringWithString:v20];
      if (v8)
      {
        uint64_t v22 = [v20 rangeOfString:v8];
        if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v21, "setAttribute:forKey:withRange:", *MEMORY[0x263EFFB40], *MEMORY[0x263F217E8], v22, v23);
        }
      }
      v36 = v20;
      v37 = v21;
      v40 = v8;
      v24 = NSString;
      v25 = accessibilityLocalizedString(@"change.of");
      v26 = objc_msgSend(v24, "stringWithFormat:", v25, v9);

      v27 = [MEMORY[0x263F21660] axAttributedStringWithString:v26];
      if (v9)
      {
        uint64_t v28 = [v26 rangeOfString:v9];
        if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v27, "setAttribute:forKey:withRange:", *MEMORY[0x263EFFB40], *MEMORY[0x263F217E8], v28, v29);
        }
      }
      v30 = 0;
      if (([v10 isEqualToString:v11] & 1) == 0 && v35)
      {
        v31 = NSString;
        v32 = accessibilityLocalizedString(@"market.cap");
        v30 = objc_msgSend(v31, "stringWithFormat:", v32, v10);
      }
      if ([v7 integerValue] < 0)
      {
        v18 = 0;
        v6 = v41;
        v33 = v37;
      }
      else
      {
        v33 = v37;
        v6 = v41;
        v18 = __UIAXStringForVariables();
      }

      v7 = v42;
      v8 = v40;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_accessibilitySpeakThisString
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [v2 companyName];
    v5 = [v3 formattedPrice];
    v6 = [v3 formattedChange];
    if ([v3 changeIsNegative]) {
      v7 = @"ticker.cell.format.down.short";
    }
    else {
      v7 = @"ticker.cell.format.up.short";
    }
    v8 = accessibilityLocalizedString(v7);
    v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v4, v5, v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end