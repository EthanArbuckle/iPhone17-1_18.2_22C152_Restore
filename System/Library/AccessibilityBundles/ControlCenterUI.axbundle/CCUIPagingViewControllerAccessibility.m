@interface CCUIPagingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)controlsGalleryViewControllerWillDismiss:(id)a3;
- (void)controlsGalleryViewControllerWillPresent:(id)a3;
@end

@implementation CCUIPagingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIPagingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIPagingViewController", @"controlsGalleryViewControllerWillPresent:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIPagingViewController", @"controlsGalleryViewControllerWillDismiss:", "v", "@", 0);
  [v3 validateClass:@"CCUIPagingViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CCUISControlsGalleryViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIPagingViewControllerAccessibility;
  [(CCUIPagingViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUIPagingViewControllerAccessibility *)self safeValueForKey:@"presentedViewController"];
  MEMORY[0x245648D60](@"CCUISControlsGalleryViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(CCUIPagingViewControllerAccessibility *)self safeValueForKey:@"view"];
    [v5 setAccessibilityElementsHidden:1];
  }
}

- (void)controlsGalleryViewControllerWillPresent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIPagingViewControllerAccessibility;
  [(CCUIPagingViewControllerAccessibility *)&v5 controlsGalleryViewControllerWillPresent:a3];
  v4 = [(CCUIPagingViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v4 setAccessibilityElementsHidden:1];
}

- (void)controlsGalleryViewControllerWillDismiss:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIPagingViewControllerAccessibility;
  [(CCUIPagingViewControllerAccessibility *)&v5 controlsGalleryViewControllerWillDismiss:a3];
  v4 = [(CCUIPagingViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v4 setAccessibilityElementsHidden:0];
}

@end