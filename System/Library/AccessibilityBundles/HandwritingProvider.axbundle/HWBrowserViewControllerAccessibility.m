@interface HWBrowserViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axShouldAnnounceScroll;
- (double)_axLastContentOffsetX;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnounceHandwritingViewScroll;
- (void)_axSetLastContentOffsetX:(double)a3;
- (void)_axSetShouldAnnounceScroll:(BOOL)a3;
- (void)_axUpdateAndFocusCanvas;
- (void)_clear:(id)a3;
- (void)_inkViewTouchesEndedNotification:(id)a3;
- (void)_scrollPageToLeft:(id)a3;
- (void)_scrollPageToRight:(id)a3;
- (void)_undo:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCurrentHandwritingItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation HWBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HWBrowserViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_axLastContentOffsetX
{
  MEMORY[0x270F0A440](self, &__HWBrowserViewControllerAccessibility___axLastContentOffsetX);
  return result;
}

- (void)_axSetLastContentOffsetX:(double)a3
{
}

- (BOOL)_axShouldAnnounceScroll
{
  return MEMORY[0x270F0A438](self, &__HWBrowserViewControllerAccessibility___axShouldAnnounceScroll);
}

- (void)_axSetShouldAnnounceScroll:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HWBrowserViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"canvasView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"currentHandwritingItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"handwritingScrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"_clear:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"_undo:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"_scrollPageToLeft:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"_scrollPageToRight:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"_inkViewTouchesEndedNotification:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"scrollViewDidScroll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBrowserViewController", @"scrollViewDidEndScrollingAnimation:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HWBrowserViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityViewIsModal:AXDeviceIsPhoneIdiom()];
  v4 = [(HWBrowserViewControllerAccessibility *)self safeValueForKey:@"handwritingScrollView"];
  objc_msgSend(v4, "_accessibilitySetVisibleContentInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v3 viewDidLoad];
  [(HWBrowserViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setCurrentHandwritingItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v4 setCurrentHandwritingItem:a3];
  [(HWBrowserViewControllerAccessibility *)self _axUpdateAndFocusCanvas];
  [(HWBrowserViewControllerAccessibility *)self _axSetShouldAnnounceScroll:0];
}

- (void)_clear:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v4 _clear:a3];
  [(HWBrowserViewControllerAccessibility *)self _axUpdateAndFocusCanvas];
}

- (void)_undo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v4 _undo:a3];
  [(HWBrowserViewControllerAccessibility *)self _axSetShouldAnnounceScroll:0];
}

- (void)_scrollPageToLeft:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  objc_opt_class();
  objc_super v5 = [(HWBrowserViewControllerAccessibility *)self safeValueForKey:@"handwritingScrollView"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 contentOffset];
  -[HWBrowserViewControllerAccessibility _axSetLastContentOffsetX:](self, "_axSetLastContentOffsetX:");
  v7.receiver = self;
  v7.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v7 _scrollPageToLeft:v4];
}

- (void)_scrollPageToRight:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  objc_opt_class();
  objc_super v5 = [(HWBrowserViewControllerAccessibility *)self safeValueForKey:@"handwritingScrollView"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 contentOffset];
  -[HWBrowserViewControllerAccessibility _axSetLastContentOffsetX:](self, "_axSetLastContentOffsetX:");
  v7.receiver = self;
  v7.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v7 _scrollPageToRight:v4];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v4 scrollViewDidScroll:a3];
  [(HWBrowserViewControllerAccessibility *)self _axAnnounceHandwritingViewScroll];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v4 scrollViewDidEndScrollingAnimation:a3];
  [(HWBrowserViewControllerAccessibility *)self _axSetShouldAnnounceScroll:1];
}

- (void)_inkViewTouchesEndedNotification:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewControllerAccessibility;
  [(HWBrowserViewControllerAccessibility *)&v4 _inkViewTouchesEndedNotification:a3];
  [(HWBrowserViewControllerAccessibility *)self _axUpdateAndFocusCanvas];
}

- (void)_axUpdateAndFocusCanvas
{
  id v2 = [(HWBrowserViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v2);
}

- (void)_axAnnounceHandwritingViewScroll
{
  objc_opt_class();
  objc_super v3 = [(HWBrowserViewControllerAccessibility *)self safeValueForKey:@"handwritingScrollView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  [v4 contentOffset];
  double v6 = v5;
  [(HWBrowserViewControllerAccessibility *)self _axLastContentOffsetX];
  if (v6 != v7)
  {
    double v8 = v7;
    if ([(HWBrowserViewControllerAccessibility *)self _axShouldAnnounceScroll])
    {
      if (v6 >= v8) {
        v9 = @"scrolled.right";
      }
      else {
        v9 = @"scrolled.left";
      }
      v10 = accessibilityLocalizedString(v9);
      UIAccessibilitySpeak();

      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
}

@end