@interface CCUISensorAttributionExpandedViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMoveToPrivacyHeaderView;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation CCUISensorAttributionExpandedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUISensorAttributionExpandedViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionExpandedViewController", @"isExpanded", "B", 0);
  [v3 validateClass:@"CCUISensorAttributionExpandedViewController" hasInstanceVariable:@"_privacyHeaderView" withType:"CCUISensorAttributionPrivacyHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionExpandedViewController", @"setExpanded:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionExpandedViewController", @"scrollView", "@", 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionExpandedViewControllerAccessibility;
  [(CCUISensorAttributionExpandedViewControllerAccessibility *)&v3 viewDidLoad];
  [(CCUISensorAttributionExpandedViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityMoveToPrivacyHeaderView
{
  id argument = [(CCUISensorAttributionExpandedViewControllerAccessibility *)self safeValueForKey:@"_privacyHeaderView"];
  if (-[CCUISensorAttributionExpandedViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"isExpanded")&& [argument _accessibilityViewIsVisible])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CCUISensorAttributionExpandedViewControllerAccessibility;
  [(CCUISensorAttributionExpandedViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  objc_super v3 = [(CCUISensorAttributionExpandedViewControllerAccessibility *)self safeUIViewForKey:@"scrollView"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __102__CCUISensorAttributionExpandedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265119130;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityViewIsModalBlock:v4];

  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __102__CCUISensorAttributionExpandedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isExpanded"];

  return v2;
}

uint64_t __102__CCUISensorAttributionExpandedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityMoveToPrivacyHeaderView];
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CCUISensorAttributionExpandedViewControllerAccessibility;
  [(CCUISensorAttributionExpandedViewControllerAccessibility *)&v4 setExpanded:a3 animated:a4];
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __81__CCUISensorAttributionExpandedViewControllerAccessibility_setExpanded_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityMoveToPrivacyHeaderView];
}

@end