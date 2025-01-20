@interface MRUControlCenterButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MRUControlCenterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUControlCenterButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MRUControlCenterButtonAccessibility *)self safeValueForKey:@"titleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)MRUControlCenterButtonAccessibility;
  [(MRUControlCenterButtonAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(MRUControlCenterButtonAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setIsAccessibilityElement:0];
}

@end