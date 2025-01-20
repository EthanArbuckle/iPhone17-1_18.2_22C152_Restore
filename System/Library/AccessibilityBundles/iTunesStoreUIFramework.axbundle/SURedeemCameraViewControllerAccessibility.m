@interface SURedeemCameraViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupNavigationItem;
@end

@implementation SURedeemCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SURedeemCameraViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SURedeemCameraViewController", @"toggleCameraBarButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SURedeemCameraViewController", @"_setupNavigationItem", "v", 0);
}

- (void)_setupNavigationItem
{
  v3.receiver = self;
  v3.super_class = (Class)SURedeemCameraViewControllerAccessibility;
  [(SURedeemCameraViewControllerAccessibility *)&v3 _setupNavigationItem];
  [(SURedeemCameraViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SURedeemCameraViewControllerAccessibility;
  [(SURedeemCameraViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(SURedeemCameraViewControllerAccessibility *)self safeValueForKey:@"toggleCameraBarButton"];
  v4 = accessibilityLocalizedString(@"flip.camera.button");
  [v3 setAccessibilityLabel:v4];
}

@end