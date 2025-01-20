@interface WFNetworkListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (int64_t)_axNetworkState;
- (unint64_t)accessibilityTraits;
@end

@implementation WFNetworkListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFNetworkListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"WFNetworkCell" hasRequiredInstanceMethod:@"title"];
  [v3 validateProtocol:@"WFNetworkCell" hasRequiredInstanceMethod:@"subtitle"];
  [v3 validateProtocol:@"WFNetworkCell" hasRequiredInstanceMethod:@"secure"];
  [v3 validateProtocol:@"WFNetworkCell" hasRequiredInstanceMethod:@"bars"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFNetworkListCell", @"personalHotspot", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFAssociationStateView", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFNetworkListCell", @"associationStateView", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)WFNetworkListCellAccessibility;
  unint64_t v3 = [(WFNetworkListCellAccessibility *)&v7 accessibilityTraits];
  int64_t v4 = [(WFNetworkListCellAccessibility *)self _axNetworkState];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (v4 != 2) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (int64_t)_axNetworkState
{
  v2 = [(WFNetworkListCellAccessibility *)self safeValueForKey:@"associationStateView"];
  int64_t v3 = [v2 safeIntegerForKey:@"state"];

  return v3;
}

- (id)accessibilityLabel
{
  int64_t v3 = [(WFNetworkListCellAccessibility *)self _axNetworkState];
  int64_t v4 = [(WFNetworkListCellAccessibility *)self safeValueForKey:@"title"];
  uint64_t v5 = [(WFNetworkListCellAccessibility *)self safeValueForKey:@"subtitle"];
  int v6 = [(WFNetworkListCellAccessibility *)self safeBoolForKey:@"secure"];
  int v7 = [(WFNetworkListCellAccessibility *)self safeBoolForKey:@"personalHotspot"];
  uint64_t v8 = [(WFNetworkListCellAccessibility *)self safeUnsignedIntegerForKey:@"bars"];
  v9 = NSString;
  v10 = accessibilityLocalizedString(@"wifi.strength");
  v11 = [NSNumber numberWithUnsignedInteger:v8];
  v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);

  if (v6) {
    v13 = @"is.secure";
  }
  else {
    v13 = @"not.secure";
  }
  v19 = accessibilityLocalizedString(v13);
  v14 = __UIAXStringForVariables();

  if (v3 == 1)
  {
    v15 = accessibilityLocalizedString(@"connecting");
    if (!v7)
    {
LABEL_6:
      v16 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    if (!v7) {
      goto LABEL_6;
    }
  }
  v16 = accessibilityLocalizedString(@"personal.hotspot");
LABEL_9:
  v17 = __UIAXStringForVariables();

  if (v7) {
  if (v3 == 1)
  }

  return v17;
}

@end