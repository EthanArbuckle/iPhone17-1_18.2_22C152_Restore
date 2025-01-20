@interface HUDashboardViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation HUDashboardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDashboardViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDashboardContext", @"accessoryTypeGroup", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDashboardContext", @"room", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDashboardContext", @"home", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDashboardViewController", @"navigationAnnounceButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HUDashboardViewControllerAccessibility;
  [(HUDashboardViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HUDashboardViewControllerAccessibility *)self safeValueForKey:@"navigationAnnounceButton"];
  v4.receiver = self;
  v4.super_class = (Class)HUDashboardViewControllerAccessibility;
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x263F1CF40] | (unint64_t)-[HUDashboardViewControllerAccessibility accessibilityTraits](&v4, sel_accessibilityTraits));
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUDashboardViewControllerAccessibility;
  [(HUDashboardViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUDashboardViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end