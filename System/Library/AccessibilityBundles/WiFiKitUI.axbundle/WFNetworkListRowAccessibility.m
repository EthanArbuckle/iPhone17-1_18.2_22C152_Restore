@interface WFNetworkListRowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axNetwork;
- (id)accessibilityLabel;
- (int64_t)_axNetworkState;
- (unint64_t)accessibilityTraits;
@end

@implementation WFNetworkListRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFNetworkListRow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFNetworkListRow", @"config", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFNetworkRowConfig", @"network", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFNetworkRowConfig", @"connectionState", "q", 0);
  [v3 validateProtocol:@"WFNetworkListRecord" hasRequiredInstanceMethod:@"title"];
  [v3 validateProtocol:@"WFNetworkListRecord" hasRequiredInstanceMethod:@"subtitle"];
  [v3 validateProtocol:@"WFNetworkListRecord" hasRequiredInstanceMethod:@"isSecure"];
  [v3 validateProtocol:@"WFNetworkListRecord" hasRequiredInstanceMethod:@"isInstantHotspot"];
  [v3 validateProtocol:@"WFNetworkListRecord" hasRequiredInstanceMethod:@"signalBars"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)WFNetworkListRowAccessibility;
  unint64_t v3 = [(WFNetworkListRowAccessibility *)&v7 accessibilityTraits];
  int64_t v4 = [(WFNetworkListRowAccessibility *)self _axNetworkState];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (v4 != 2) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)_axNetwork
{
  return (id)[(WFNetworkListRowAccessibility *)self safeValueForKeyPath:@"config.network"];
}

- (int64_t)_axNetworkState
{
  v2 = [(WFNetworkListRowAccessibility *)self safeValueForKey:@"config"];
  int64_t v3 = [v2 safeIntegerForKey:@"connectionState"];

  return v3;
}

- (id)accessibilityLabel
{
  int64_t v3 = [(WFNetworkListRowAccessibility *)self _axNetworkState];
  int64_t v4 = [(WFNetworkListRowAccessibility *)self _axNetwork];
  uint64_t v5 = [v4 safeValueForKey:@"title"];

  v6 = [(WFNetworkListRowAccessibility *)self _axNetwork];
  objc_super v7 = [v6 safeValueForKey:@"subtitle"];

  v8 = [(WFNetworkListRowAccessibility *)self _axNetwork];
  int v9 = [v8 safeBoolForKey:@"isSecure"];

  v10 = [(WFNetworkListRowAccessibility *)self _axNetwork];
  int v11 = [v10 safeBoolForKey:@"isInstantHotspot"];

  v12 = [(WFNetworkListRowAccessibility *)self _axNetwork];
  uint64_t v13 = [v12 safeUnsignedIntegerForKey:@"signalBars"];

  v14 = NSString;
  v15 = accessibilityLocalizedString(@"wifi.strength");
  v16 = [NSNumber numberWithUnsignedInteger:v13];
  v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

  if (v9) {
    v18 = @"is.secure";
  }
  else {
    v18 = @"not.secure";
  }
  v24 = accessibilityLocalizedString(v18);
  v19 = __UIAXStringForVariables();

  if (v3 == 1)
  {
    v20 = accessibilityLocalizedString(@"connecting");
    if (!v11)
    {
LABEL_6:
      v21 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v20 = 0;
    if (!v11) {
      goto LABEL_6;
    }
  }
  v21 = accessibilityLocalizedString(@"personal.hotspot");
LABEL_9:
  v22 = __UIAXStringForVariables();

  if (v11) {
  if (v3 == 1)
  }

  return v22;
}

@end