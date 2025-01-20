@interface StepTrayHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateLayoutProgress;
@end

@implementation StepTrayHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StepTrayHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"StepTrayHeaderView", @"layoutProgress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"StepTrayHeaderView", @"_updateLayoutProgress", "v", 0);
  [v3 validateClass:@"StepTrayHeaderView" hasInstanceVariable:@"_chevronImageView" withType:"UIImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)StepTrayHeaderViewAccessibility;
  [(StepTrayHeaderViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(StepTrayHeaderViewAccessibility *)self safeUIViewForKey:@"_chevronImageView"];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityTraits];
    [v4 setAccessibilityTraits:*MEMORY[0x263F219B8] | v5];
    [v4 setIsAccessibilityElement:1];
    v6 = AXMapKitLocString(@"BUTTON_EXPAND");
    [v4 setAccessibilityLabel:v6];
  }
}

- (void)_updateLayoutProgress
{
  v7.receiver = self;
  v7.super_class = (Class)StepTrayHeaderViewAccessibility;
  [(StepTrayHeaderViewAccessibility *)&v7 _updateLayoutProgress];
  id v3 = [(StepTrayHeaderViewAccessibility *)self safeUIViewForKey:@"_chevronImageView"];
  if (v3)
  {
    [(StepTrayHeaderViewAccessibility *)self safeFloatForKey:@"layoutProgress"];
    if (v4 < 1.0) {
      uint64_t v5 = @"BUTTON_EXPAND";
    }
    else {
      uint64_t v5 = @"BUTTON_COLLAPSE";
    }
    v6 = AXMapKitLocString(v5);
    [v3 setAccessibilityLabel:v6];
  }
}

@end