@interface PUCompactAdjustmentsModeBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateTitleViewAnimated:(BOOL)a3;
@end

@implementation PUCompactAdjustmentsModeBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCompactAdjustmentsModeBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUCompactAdjustmentsModeBar" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCompactAdjustmentsModeBar", @"_updateTitleViewAnimated:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PUCompactAdjustmentsModeBarAccessibility;
  [(PUCompactAdjustmentsModeBarAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(PUCompactAdjustmentsModeBarAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:0];
}

- (void)_updateTitleViewAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCompactAdjustmentsModeBarAccessibility;
  [(PUCompactAdjustmentsModeBarAccessibility *)&v4 _updateTitleViewAnimated:a3];
  [(PUCompactAdjustmentsModeBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end