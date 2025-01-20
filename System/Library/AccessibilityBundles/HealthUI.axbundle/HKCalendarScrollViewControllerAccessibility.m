@interface HKCalendarScrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HKCalendarScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKCalendarScrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarScrollViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarScrollViewController", @"scrollView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewControllerAccessibility;
  [(HKCalendarScrollViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HKCalendarScrollViewControllerAccessibility *)self safeValueForKey:@"scrollView"];
  [v3 setIsAccessibilityOpaqueElementProvider:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewControllerAccessibility;
  [(HKCalendarScrollViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(HKCalendarScrollViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end