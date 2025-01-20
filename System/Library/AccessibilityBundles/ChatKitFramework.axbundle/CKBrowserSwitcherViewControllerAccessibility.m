@interface CKBrowserSwitcherViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsScrollingByDragGesture;
- (BOOL)accessibilityPerformEscape;
- (id)accessibilityScrollStatusForScrollView:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetIsScrollingByDragGesture:(BOOL)a3;
- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4;
- (void)loadView;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setCurrentViewController:(id)a3;
@end

@implementation CKBrowserSwitcherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBrowserSwitcherViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsScrollingByDragGesture
{
  return MEMORY[0x270F09620](self, &__CKBrowserSwitcherViewController___axIsScrollingByDragGesture);
}

- (void)_axSetIsScrollingByDragGesture:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKBrowserSwitcherViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CKBrowserSwitcherViewController" hasInstanceVariable:@"_currentViewController" withType:"UIViewController<CKBrowserViewControllerProtocol>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserSwitcherViewController", @"setCurrentViewController:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserSwitcherViewController", @"browserTransitionCoordinatorWillCollapseOrDismiss:withReason:", "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserSwitcherViewController", @"browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:withReason:", "v", "@", "q", 0);
  [v3 validateClass:@"CKBrowserSwitcherViewController" hasInstanceVariable:@"_currentVisiblePlugin" withType:"IMBalloonPlugin"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMBalloonPlugin", @"browserDisplayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserSwitcherViewController", @"grabberView", "@", 0);
  [v3 validateClass:@"CKAppGrabberView" hasInstanceVariable:@"_closeButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserSwitcherViewController", @"appGrabberViewCloseButtonTapped:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  [(CKBrowserSwitcherViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(CKBrowserSwitcherViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 _accessibilitySetBoolValue:1 forKey:@"shouldBypassCollectionViewAX"];
  [v4 _accessibilitySetOpaqueElementScrollsContentIntoView:0];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  [(CKBrowserSwitcherViewControllerAccessibility *)&v3 loadView];
  [(CKBrowserSwitcherViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setCurrentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBrowserSwitcherViewControllerAccessibility *)self safeValueForKey:@"_currentViewController"];
  v8.receiver = self;
  v8.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  [(CKBrowserSwitcherViewControllerAccessibility *)&v8 setCurrentViewController:v4];
  if (v5 != v4
    && [(CKBrowserSwitcherViewControllerAccessibility *)self _axIsScrollingByDragGesture])
  {
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CE18];
    v7 = [v4 safeValueForKey:@"view"];
    UIAccessibilityPostNotification(v6, v7);

    [(CKBrowserSwitcherViewControllerAccessibility *)self _axSetIsScrollingByDragGesture:0];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  [(CKBrowserSwitcherViewControllerAccessibility *)&v4 scrollViewWillBeginDragging:a3];
  [(CKBrowserSwitcherViewControllerAccessibility *)self _axSetIsScrollingByDragGesture:1];
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v3 = [(CKBrowserSwitcherViewControllerAccessibility *)self safeValueForKey:@"grabberView"];
  objc_super v4 = [v3 safeValueForKey:@"_closeButton"];
  if ([v4 _accessibilityViewIsVisible])
  {
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      [(CKBrowserSwitcherViewControllerAccessibility *)self appGrabberViewCloseButtonTapped:0];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
      return 1;
    }
  }
  else
  {
  }
  v7.receiver = self;
  v7.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  return [(CKBrowserSwitcherViewControllerAccessibility *)&v7 accessibilityPerformEscape];
}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  [(CKBrowserSwitcherViewControllerAccessibility *)&v6 browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:a3 withReason:a4];
  char v5 = [(CKBrowserSwitcherViewControllerAccessibility *)self safeUIViewForKey:@"grabberView"];
  [v5 _accessibilitySetBoolValue:1 forKey:@"_axBrowserIsExpanded"];
}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherViewControllerAccessibility;
  [(CKBrowserSwitcherViewControllerAccessibility *)&v6 browserTransitionCoordinatorWillCollapseOrDismiss:a3 withReason:a4];
  char v5 = [(CKBrowserSwitcherViewControllerAccessibility *)self safeUIViewForKey:@"grabberView"];
  [v5 _accessibilitySetBoolValue:0 forKey:@"_axBrowserIsExpanded"];
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  id v4 = a3;
  [v4 _accessibilityPageIndex];
  [v4 _accessibilityPageCount];
  char v5 = NSString;
  objc_super v6 = accessibilityLocalizedString(@"browser.page.format");
  objc_super v7 = AXFormatInteger();
  objc_super v8 = AXFormatInteger();
  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7, v8);

  v10 = [(CKBrowserSwitcherViewControllerAccessibility *)self safeValueForKey:@"_currentVisiblePlugin"];
  objc_opt_class();
  v11 = [v10 safeValueForKey:@"browserDisplayName"];
  v12 = __UIAccessibilityCastAsClass();

  v13 = __UIAXStringForVariables();

  return v13;
}

@end