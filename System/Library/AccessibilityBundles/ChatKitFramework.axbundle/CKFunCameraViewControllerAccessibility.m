@interface CKFunCameraViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKFunCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKFunCameraViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFunCameraViewController", @"dismiss", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFunCameraViewController", @"funCameraAppViewController", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKFunCameraViewControllerAccessibility;
  [(CKFunCameraViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKFunCameraViewControllerAccessibility *)self safeValueForKey:@"funCameraAppViewController"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"AXFunCamBrowserDrawer"];
}

- (BOOL)accessibilityPerformEscape
{
  if (objc_opt_respondsToSelector())
  {
    [(CKFunCameraViewControllerAccessibility *)self dismiss];
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CKFunCameraViewControllerAccessibility;
    return [(CKFunCameraViewControllerAccessibility *)&v4 accessibilityPerformEscape];
  }
}

@end