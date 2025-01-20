@interface CAMCameraViewControllerContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
- (void)verifyViewOrdering;
@end

@implementation CAMCameraViewControllerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMCameraViewControllerContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCameraViewControllerContainerView", @"viewfinderView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCameraViewControllerContainerView", @"customOverlayView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCameraViewControllerContainerView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCameraViewControllerContainerView", @"verifyViewOrdering", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"isPerformingReviewUsingOverlay", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CAMCameraViewControllerContainerViewAccessibility;
  [(CAMCameraViewControllerContainerViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CAMCameraViewControllerContainerViewAccessibility *)self safeValueForKey:@"viewfinderView"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [MEMORY[0x263F1CB68] viewControllerForView:v4];
  objc_msgSend(v4, "setAccessibilityElementsHidden:", objc_msgSend(v5, "safeBoolForKey:", @"isPerformingReviewUsingOverlay"));
}

- (void)verifyViewOrdering
{
  v3.receiver = self;
  v3.super_class = (Class)CAMCameraViewControllerContainerViewAccessibility;
  [(CAMCameraViewControllerContainerViewAccessibility *)&v3 verifyViewOrdering];
  [(CAMCameraViewControllerContainerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CAMCameraViewControllerContainerViewAccessibility;
  [(CAMCameraViewControllerContainerViewAccessibility *)&v3 layoutSubviews];
  [(CAMCameraViewControllerContainerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end