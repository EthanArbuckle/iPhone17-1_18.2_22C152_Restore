@interface GKDashboardMultiplayerPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation GKDashboardMultiplayerPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKDashboardMultiplayerPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKDashboardMultiplayerPickerViewController", @"showContactPickerButton", "@", 0);
  [v3 validateClass:@"GKDashboardMultiplayerPickerViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardMultiplayerPickerViewControllerAccessibility;
  [(GKDashboardMultiplayerPickerViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(GKDashboardMultiplayerPickerViewControllerAccessibility *)self safeValueForKey:@"showContactPickerButton"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_0];
}

id __101__GKDashboardMultiplayerPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXGameCenterUIFrameworkLocString(@"ADD_FROM_CONTACTS");
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardMultiplayerPickerViewControllerAccessibility;
  [(GKDashboardMultiplayerPickerViewControllerAccessibility *)&v3 viewDidLoad];
  [(GKDashboardMultiplayerPickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end