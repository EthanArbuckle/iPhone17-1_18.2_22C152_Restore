@interface HUGridStatusCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUGridStatusCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUGridStatusCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HFItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridStatusCell", @"item", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(HUGridStatusCellAccessibility *)self safeValueForKey:@"item"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F47A30]];
  v7 = __UIAccessibilitySafeClass();

  v8 = [v7 midValue];
  uint64_t v9 = [v8 integerValue];

  v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F47A38]];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    accessibilityHomeUILocalizedString(@"unknown.percent");
  }
  else {
  v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F47A10]];
  }
  v11 = __UIAXStringForVariables();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUGridStatusCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUGridStatusCellAccessibility *)&v3 accessibilityTraits];
}

@end