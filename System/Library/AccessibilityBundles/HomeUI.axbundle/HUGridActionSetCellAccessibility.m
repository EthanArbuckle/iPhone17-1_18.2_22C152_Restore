@interface HUGridActionSetCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsActiveGridCell;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation HUGridActionSetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUGridActionSetCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridActionSetCell", @"titleAndDescriptionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridActionSetTitleAndDescriptionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridActionSetTitleAndDescriptionView", @"descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridActionSetCell", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconView", @"displayStyle", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconView", @"iconDescriptor", "@", 0);
  [v3 validateProtocol:@"HFIconDescriptor" hasRequiredInstanceMethod:@"identifier"];
  [v3 validateClass:@"HUGridActionSetCell" isKindOfClass:@"HIGridCell"];
  [v3 validateClass:@"HUGridActionSetPlaceholderCell" isKindOfClass:@"HUGridActionSetCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridCellAccessibility", @"_axIsActiveGridCell", "B", 0);
}

- (id)accessibilityLabel
{
  v2 = [(HUGridActionSetCellAccessibility *)self safeValueForKey:@"titleAndDescriptionView"];
  id v3 = [v2 safeValueForKey:@"titleLabel"];
  v6 = [v2 safeValueForKey:@"descriptionLabel"];
  v4 = __AXStringForVariables();

  return v4;
}

- (id)accessibilityIdentifier
{
  id v3 = [(HUGridActionSetCellAccessibility *)self safeValueForKey:@"iconView"];
  uint64_t v4 = [v3 safeIntegerForKey:@"displayStyle"];

  v5 = NSString;
  v6 = [(HUGridActionSetCellAccessibility *)self safeValueForKeyPath:@"titleAndDescriptionView.titleLabel.text"];
  v7 = [(HUGridActionSetCellAccessibility *)self safeValueForKeyPath:@"iconView.iconDescriptor.identifier"];
  v8 = [v5 stringWithFormat:@"%@, %@, %ld", v6, v7, v4];

  return v8;
}

- (BOOL)_axIsActiveGridCell
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

@end