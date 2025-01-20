@interface SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.PhoneSessionPortraitSummaryViewController";
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
  v4.super_class = (Class)SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility;
  [(SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

@end