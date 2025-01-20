@interface SearchUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_axValidateString:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SearchUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUILabelAccessibility;
  v3 = [(SearchUILabelAccessibility *)&v9 accessibilityLabel];
  v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];
  uint64_t v6 = [v5 length];

  if (!v6) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SearchUILabelAccessibility;
  return [(SearchUILabelAccessibility *)&v8 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUILabelAccessibility;
  v3 = [(SearchUILabelAccessibility *)&v6 accessibilityLabel];
  v4 = [(SearchUILabelAccessibility *)self _axValidateString:v3];

  return v4;
}

- (id)_axValidateString:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  v7 = (void *)[v4 length];
  if (v7)
  {
    objc_super v8 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(\\b\\d{4})(-)(\\d{4}\\b)" options:0 error:0];
    uint64_t v9 = [v6 length];
    v10 = NSString;
    v11 = accessibilityLocalizedString(@"vibrant.label.time.to");
    v12 = [v10 stringWithFormat:@"$1 %@ $3", v11];
    v13 = objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, v9, v12);

    v14 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(?:([01]?\\d|2[0-3]):)?([0-5]?\\d):([0-5]?\\d)$" options:0 error:0];
    v15 = objc_msgSend(v14, "matchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
    if ([v15 count])
    {
      v16 = [v15 firstObject];
      uint64_t v17 = [v16 range];
      uint64_t v19 = v18;
      uint64_t v20 = [v16 range];
      v22 = objc_msgSend(v13, "substringWithRange:", v20, v21);
      v23 = AXLocalizeDurationTime();
      uint64_t v24 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", v17, v19, v23);

      v13 = (void *)v24;
    }
    v25 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"((?:[01]?\\d|2[0-3]):(?:[0-5]?\\d)) (-) ((?:[01]?\\d|2[0-3]):(?:[0-5]?\\d))" options:0 error:0];
    uint64_t v26 = [v13 length];
    v27 = NSString;
    v28 = accessibilityLocalizedString(@"vibrant.label.time.to");
    v29 = [v27 stringWithFormat:@"$1 %@ $3", v28];
    v30 = objc_msgSend(v25, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, v26, v29);

    id v6 = v30;
    v7 = v6;
  }

  return v7;
}

@end