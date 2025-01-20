@interface CKAppGrabberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CKAppGrabberViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKAppGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAppGrabberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKAppGrabberView" hasInstanceVariable:@"_pluginTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"CKAppGrabberView" hasInstanceVariable:@"_closeButton" withType:"UIButton"];
  [v3 validateClass:@"CKAppGrabberView" hasInstanceVariable:@"_chevronView" withType:"_UIGrabber"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)CKAppGrabberViewAccessibility;
  [(CKAppGrabberViewAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(CKAppGrabberViewAccessibility *)self safeValueForKey:@"_pluginTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
  objc_initWeak(&location, self);
  v6 = [(CKAppGrabberViewAccessibility *)self safeUIViewForKey:@"_chevronView"];
  [v6 setIsAccessibilityElement:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__CKAppGrabberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_265112EF8;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityLabelBlock:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

id __75__CKAppGrabberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained _accessibilityBoolValueForKey:@"_axBrowserIsExpanded"];

  if (v2) {
    id v3 = @"browser.collapse.button";
  }
  else {
    id v3 = @"browser.expand.button";
  }

  return accessibilityLocalizedString(v3);
}

- (CKAppGrabberViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKAppGrabberViewAccessibility;
  id v3 = -[CKAppGrabberViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CKAppGrabberViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end