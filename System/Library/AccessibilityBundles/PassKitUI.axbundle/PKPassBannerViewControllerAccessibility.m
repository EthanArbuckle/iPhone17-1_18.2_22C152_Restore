@interface PKPassBannerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation PKPassBannerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassBannerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassBannerViewController", @"loadView", "v", 0);
  [v3 validateClass:@"PKPassBannerViewController" hasInstanceVariable:@"_platter" withType:"PLPlatterView"];
  [v3 validateClass:@"PKPassBannerViewController" hasInstanceVariable:@"_primaryLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPassBannerViewController" hasInstanceVariable:@"_secondaryLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassBannerViewControllerAccessibility;
  [(PKPassBannerViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPassBannerViewControllerAccessibility *)self safeUIViewForKey:@"_platter"];
  [v3 setIsAccessibilityElement:1];

  objc_initWeak(&location, self);
  v4 = [(PKPassBannerViewControllerAccessibility *)self safeUIViewForKey:@"_platter"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__PKPassBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265140E18;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __85__PKPassBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeUIViewForKey:@"_primaryLabel"];
  v4 = [v3 accessibilityLabel];
  id v5 = objc_loadWeakRetained(v1);
  id v6 = [v5 safeUIViewForKey:@"_secondaryLabel"];
  v9 = [v6 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassBannerViewControllerAccessibility;
  [(PKPassBannerViewControllerAccessibility *)&v3 loadView];
  [(PKPassBannerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end