@interface FCUIActivityControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsExpanded;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityMenuItemElements;
- (id)_accessibilityMenuView;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation FCUIActivityControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FCUIActivityControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FCUIActivityControl" hasInstanceVariable:@"_activityTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"FCUIActivityControl" hasInstanceVariable:@"_detailLabel" withType:"UILabel"];
  [v3 validateClass:@"FCUIActivityControl" hasInstanceVariable:@"_optionsButton" withType:"FCUIOptionsControl"];
  [v3 validateClass:@"FCUIActivityControl" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIActivityControl", @"isExpanded", "B", 0);
  [v3 validateClass:@"FCUIActivityControl" hasInstanceVariable:@"_menuView" withType:"FCUIActivityControlMenuView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIActivityControlMenuView", @"menuItemElements", "@", 0);
  [v3 validateClass:@"FCUIActivityControlMenuView" hasInstanceVariable:@"_footerView" withType:"_FCUIActivityControlMenuFooterView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIActivityControl", @"optionsAction", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIOptionsControl", @"controlType", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(FCUIActivityControlAccessibility *)self _accessibilityStringForLabelKeyValues:@"_activityTitleLabel, _detailLabel"];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(FCUIActivityControlAccessibility *)self safeBoolForKey:@"selected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityCustomActions
{
  if ([(FCUIActivityControlAccessibility *)self _accessibilityIsExpanded]) {
    int v3 = @"collapse.options.menu";
  }
  else {
    int v3 = @"show.more.options";
  }
  uint64_t v4 = accessibilityLocalizedString(v3);
  v5 = [(FCUIActivityControlAccessibility *)self safeValueForKey:@"_optionsButton"];
  uint64_t v6 = [v5 safeIntegerForKey:@"controlType"];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__FCUIActivityControlAccessibility_accessibilityCustomActions__block_invoke;
    v11[3] = &unk_265121AD8;
    objc_copyWeak(&v12, &location);
    v7 = (void *)[v8 initWithName:v4 actionHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v9 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v7);

  return v9;
}

uint64_t __62__FCUIActivityControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained safeValueForKey:@"optionsAction"];

  id v12 = v3;
  id v4 = v3;
  AXPerformSafeBlock();
  id v5 = objc_loadWeakRetained(v1);
  int v6 = [v5 _accessibilityIsExpanded];
  id v7 = objc_loadWeakRetained(v1);
  id v8 = v7;
  if (v6)
  {
    v9 = [v7 _accessibilityMenuItemElements];
    uint64_t v10 = [v9 firstObject];

    id v8 = (void *)v10;
  }

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v8);
  return 1;
}

uint64_t __62__FCUIActivityControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithSender:0 target:0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  int v3 = [MEMORY[0x263EFF980] array];
  if ([(FCUIActivityControlAccessibility *)self _accessibilityIsExpanded])
  {
    id v4 = [(FCUIActivityControlAccessibility *)self _accessibilityMenuItemElements];
    [v3 axSafelyAddObjectsFromArray:v4];

    id v5 = [(FCUIActivityControlAccessibility *)self _accessibilityMenuView];
    int v6 = [v5 safeValueForKey:@"_footerView"];

    [v3 axSafelyAddObject:v6];
  }

  return v3;
}

- (id)automationElements
{
  uint64_t v2 = (void *)MEMORY[0x263EFF8C0];
  int v3 = [(FCUIActivityControlAccessibility *)self safeValueForKey:@"_optionsButton"];
  id v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (BOOL)_accessibilityIsExpanded
{
  return [(FCUIActivityControlAccessibility *)self safeBoolForKey:@"isExpanded"];
}

- (id)_accessibilityMenuItemElements
{
  uint64_t v2 = [(FCUIActivityControlAccessibility *)self _accessibilityMenuView];
  int v3 = [v2 safeArrayForKey:@"menuItemElements"];

  return v3;
}

- (id)_accessibilityMenuView
{
  return (id)[(FCUIActivityControlAccessibility *)self safeValueForKey:@"_menuView"];
}

@end