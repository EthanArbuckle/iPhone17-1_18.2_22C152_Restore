@interface DBSDisplayZoomOptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DBSDisplayZoomOptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DBSDisplayZoomOptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSDisplayZoomOptionView", @"optionNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSDisplayZoomOptionView", @"isSelected", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(DBSDisplayZoomOptionViewAccessibility *)self safeValueForKey:@"optionNameLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)DBSDisplayZoomOptionViewAccessibility;
  unint64_t v3 = [(DBSDisplayZoomOptionViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(DBSDisplayZoomOptionViewAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end