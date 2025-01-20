@interface ACSportsPlaySummaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACSportsPlaySummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsPlaySummaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsPlaySummaryView", @"goalTime", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsPlaySummaryView", @"goalScorer", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(ACSportsPlaySummaryViewAccessibility *)self safeValueForKey:@"goalTime"];
  v4 = __UIAccessibilityCastAsClass();

  char v19 = 0;
  objc_opt_class();
  v5 = [(ACSportsPlaySummaryViewAccessibility *)self safeValueForKey:@"goalScorer"];
  v6 = __UIAccessibilityCastAsClass();

  if (v4 && v6)
  {
    uint64_t v7 = [v4 rangeOfString:@":"];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [v4 substringToIndex:v7];

      v4 = (void *)v8;
    }
    v9 = NSString;
    v10 = accessibilityLocalizedString(@"sport.soccer.goal");
    v11 = objc_msgSend(v9, "stringWithFormat:", v10, v4, v6);

    v12 = [MEMORY[0x263F21660] axAttributedStringWithString:v11];
    uint64_t v13 = [v12 rangeOfString:v4];
    v15 = v11;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "setAttribute:forKey:withRange:", MEMORY[0x263EFFA88], *MEMORY[0x263F21708], v13, v14);
      v15 = v12;
    }
    id v16 = v15;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)ACSportsPlaySummaryViewAccessibility;
    id v16 = [(ACSportsPlaySummaryViewAccessibility *)&v18 accessibilityLabel];
  }

  return v16;
}

@end