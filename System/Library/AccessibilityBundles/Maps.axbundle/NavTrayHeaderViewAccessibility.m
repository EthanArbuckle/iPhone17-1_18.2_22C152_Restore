@interface NavTrayHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateContentAndReloadStackView:(BOOL)a3;
@end

@implementation NavTrayHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavTrayHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavTrayHeaderView", @"isExpanded", "B", 0);
  [v3 validateClass:@"NavTrayHeaderView" hasInstanceVariable:@"_chevronImageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavTrayHeaderView", @"_updateContentAndReloadStackView:", "v", "B", 0);
  [v3 validateClass:@"NavTrayHeaderView" hasInstanceVariable:@"_minimizedArrivalLabel" withType:"NavTrayStackedLabel"];
  [v3 validateClass:@"NavTrayHeaderView" hasInstanceVariable:@"_timeLabel" withType:"NavTrayStackedLabel"];
  [v3 validateClass:@"NavTrayHeaderView" hasInstanceVariable:@"_distanceLabel" withType:"NavTrayStackedLabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)NavTrayHeaderViewAccessibility;
  [(NavTrayHeaderViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NavTrayHeaderViewAccessibility *)self safeUIViewForKey:@"_chevronImageView"];
  v4 = v3;
  if (v3)
  {
    [v3 setAccessibilityTraits:*MEMORY[0x263F219B8]];
    [v4 setIsAccessibilityElement:1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__NavTrayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v5[3] = &unk_26512D6B0;
    v5[4] = self;
    [v4 setAccessibilityLabelBlock:v5];
  }
}

id __76__NavTrayHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) safeBoolForKey:@"isExpanded"]) {
    v1 = @"BUTTON_COLLAPSE";
  }
  else {
    v1 = @"BUTTON_EXPAND";
  }

  return AXMapKitLocString(v1);
}

- (void)_updateContentAndReloadStackView:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavTrayHeaderViewAccessibility;
  [(NavTrayHeaderViewAccessibility *)&v7 _updateContentAndReloadStackView:a3];
  v4 = [(NavTrayHeaderViewAccessibility *)self safeValueForKey:@"_minimizedArrivalLabel"];
  [v4 accessibilitySetIdentification:@"ETA"];

  v5 = [(NavTrayHeaderViewAccessibility *)self safeValueForKey:@"_timeLabel"];
  [v5 accessibilitySetIdentification:@"RemainingTime"];

  objc_super v6 = [(NavTrayHeaderViewAccessibility *)self safeValueForKey:@"_distanceLabel"];
  [v6 accessibilitySetIdentification:@"RemainingDistance"];
}

@end