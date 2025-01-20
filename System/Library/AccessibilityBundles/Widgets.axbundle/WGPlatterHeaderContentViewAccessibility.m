@interface WGPlatterHeaderContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureUtilityButton;
@end

@implementation WGPlatterHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGPlatterHeaderContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WGPlatterHeaderContentView" isKindOfClass:@"PLPlatterHeaderContentView"];
  [v3 validateClass:@"PLPlatterHeaderContentView" hasInstanceVariable:@"_utilityButton" withType:"UIButton"];
  [v3 validateClass:@"WGWidgetPlatterView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetPlatterView", @"isShowingMoreContent", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"_configureUtilityButton", "v", 0);
}

- (void)_configureUtilityButton
{
  v3.receiver = self;
  v3.super_class = (Class)WGPlatterHeaderContentViewAccessibility;
  [(WGPlatterHeaderContentViewAccessibility *)&v3 _configureUtilityButton];
  [(WGPlatterHeaderContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)WGPlatterHeaderContentViewAccessibility;
  [(WGPlatterHeaderContentViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_super v3 = [(WGPlatterHeaderContentViewAccessibility *)self safeValueForKey:@"_utilityButton"];
  v4 = __UIAccessibilitySafeClass();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__WGPlatterHeaderContentViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265169180;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __85__WGPlatterHeaderContentViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = [WeakRetained titleLabel];
  v4 = [v3 text];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = objc_loadWeakRetained(v1);
    v7 = [v6 _accessibilityAncestorIsKindOf:MEMORY[0x24566AD50](@"WGWidgetPlatterView")];

    if ([v7 safeBoolForKey:@"isShowingMoreContent"]) {
      objc_super v8 = @"show.less";
    }
    else {
      objc_super v8 = @"show.more";
    }
    accessibilityLocalizedString(v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end