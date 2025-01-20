@interface OnboardingHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation OnboardingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.OnboardingHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.OnboardingHeaderView", @"header", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.OnboardingHeaderView", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.ENUIPublicHealthHeader", @"style", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.ENUIPublicHealthHeader", @"title", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)OnboardingHeaderViewAccessibility;
  [(OnboardingHeaderViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(OnboardingHeaderViewAccessibility *)self safeValueForKey:@"header"];
  v4 = [(OnboardingHeaderViewAccessibility *)self safeValueForKey:@"imageView"];
  if ([v3 safeIntegerForKey:@"style"])
  {
    [v4 setIsAccessibilityElement:1];
    v5 = [v3 safeStringForKey:@"title"];
    [v4 setAccessibilityLabel:v5];
  }
}

@end