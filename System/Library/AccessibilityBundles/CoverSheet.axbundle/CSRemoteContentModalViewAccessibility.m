@interface CSRemoteContentModalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CSRemoteContentModalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSRemoteContentModalView";
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
  v4.super_class = (Class)CSRemoteContentModalViewAccessibility;
  [(CSRemoteContentModalViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CSRemoteContentModalViewAccessibility *)self safeValueForKey:@"_backgroundDismissButton"];
  [v3 setIsAccessibilityElement:0];
}

@end