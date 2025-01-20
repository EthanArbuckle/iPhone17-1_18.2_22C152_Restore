@interface HUCameraPlayerFooterViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation HUCameraPlayerFooterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCameraPlayerFooterViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUCameraPlayerFooterViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCameraPlayerFooterViewController", @"liveButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraPlayerFooterViewControllerAccessibility;
  [(HUCameraPlayerFooterViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HUCameraPlayerFooterViewControllerAccessibility *)self safeValueForKey:@"liveButton"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_5];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_285];
}

id __93__HUCameraPlayerFooterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  v0 = accessibilityHomeUILocalizedString(@"camera.live.button");
  v1 = AXAttributedStringForBetterPronuciation();

  return v1;
}

uint64_t __93__HUCameraPlayerFooterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return *MEMORY[0x263F1CF48];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUCameraPlayerFooterViewControllerAccessibility;
  [(HUCameraPlayerFooterViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUCameraPlayerFooterViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end