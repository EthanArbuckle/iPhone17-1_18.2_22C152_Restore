@interface PromotionalImageryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isTransparentFocusRegion;
@end

@implementation PromotionalImageryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.PromotionalImageryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicApplication.PromotionalImageryView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isTransparentFocusRegion", "B", 0);
}

- (BOOL)_isTransparentFocusRegion
{
  if ([(PromotionalImageryViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)PromotionalImageryViewAccessibility;
  return [(PromotionalImageryViewAccessibility *)&v4 _isTransparentFocusRegion];
}

@end