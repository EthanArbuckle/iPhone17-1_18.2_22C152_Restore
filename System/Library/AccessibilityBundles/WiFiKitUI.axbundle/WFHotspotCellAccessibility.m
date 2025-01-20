@interface WFHotspotCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHideBatteryView;
- (void)didMoveToWindow;
@end

@implementation WFHotspotCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFHotspotCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"didMoveToWindow", "v", 0);
  [v3 validateClass:@"WFHotspotCell" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFAssociationStateView", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFHotspotCell", @"associationStateView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFHotspotCell", @"hotspotDetailsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFHotspotCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFHotspotDetailsView", @"batteryCharge", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFHotspotDetailsView", @"cellularProtocolString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFHotspotDetailsView", @"signalBars", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFHotspotDetailsView", @"batteryView", "@", 0);
}

- (void)_axHideBatteryView
{
  id v3 = [(WFHotspotCellAccessibility *)self safeValueForKey:@"hotspotDetailsView"];
  v2 = [v3 safeValueForKey:@"batteryView"];
  [v2 setIsAccessibilityElement:0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCellAccessibility;
  [(WFHotspotCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(WFHotspotCellAccessibility *)self _axHideBatteryView];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)WFHotspotCellAccessibility;
  [(WFHotspotCellAccessibility *)&v3 didMoveToWindow];
  [(WFHotspotCellAccessibility *)self _axHideBatteryView];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(WFHotspotCellAccessibility *)self safeValueForKey:@"hotspotDetailsView"];
  v4 = NSString;
  v5 = accessibilityLocalizedString(@"cellular.strength");
  [v3 safeUnsignedIntegerForKey:@"signalBars"];
  v6 = AXFormatInteger();
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

  v8 = NSString;
  v9 = accessibilityLocalizedString(@"battery.level");
  [v3 safeUnsignedIntegerForKey:@"batteryCharge"];
  v10 = AXFormatFloatWithPercentage();
  v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

  v12 = [(WFHotspotCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v13 = [v12 accessibilityLabel];
  v16 = [v3 safeStringForKey:@"cellularProtocolString"];
  v14 = __UIAXStringForVariables();

  return v14;
}

@end