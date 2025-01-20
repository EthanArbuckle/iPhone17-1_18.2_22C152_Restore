@interface SLAttributionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityAXAttributedLabel;
@end

@implementation SLAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLAttributionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityAXAttributedLabel
{
  v2 = [(SLAttributionViewAccessibility *)self safeValueForKey:@"pillView"];
  v3 = [v2 _accessibilityAXAttributedLabel];

  return v3;
}

@end