@interface CAMApplicationDelegateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CAMApplicationDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMApplicationDelegate";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CAMApplicationDelegateAccessibility;
  [(CAMApplicationDelegateAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CAMApplicationDelegateAccessibility *)self safeValueForKey:@"captureController"];
  [v3 _accessibilityLoadAccessibilityInformation];
}

@end