@interface GKDashboardPlayerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation GKDashboardPlayerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKDashboardPlayerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKDashboardPlayerCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKDashboardPlayerCell", @"statusLabel", "@", 0);
  [v3 validateClass:@"GKDashboardPlayerCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"GKDashboardPlayerPickerCell" isKindOfClass:@"GKDashboardPlayerCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKDashboardPlayerPickerCell", @"showsPlayerSubtitle", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKDashboardPlayerPickerCell", @"showsMessagesHandleInStatusText", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  MEMORY[0x24564DC30](@"GKDashboardPlayerPickerCell", a2);
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(GKDashboardPlayerCellAccessibility *)self safeBoolForKey:@"showsPlayerSubtitle"] & 1) != 0
    || [(GKDashboardPlayerCellAccessibility *)self safeBoolForKey:@"showsMessagesHandleInStatusText"])
  {
    id v3 = @"nameLabel, statusLabel";
  }
  else
  {
    id v3 = @"nameLabel";
  }
  v4 = [(GKDashboardPlayerCellAccessibility *)self _accessibilityStringForLabelKeyValues:v3];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  int v3 = [(GKDashboardPlayerCellAccessibility *)self safeBoolForKey:@"isSelected"];
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardPlayerCellAccessibility;
  unint64_t v4 = *MEMORY[0x263F1CEE8] | [(GKDashboardPlayerCellAccessibility *)&v8 accessibilityTraits];
  unint64_t v5 = *MEMORY[0x263F1CF38] | v4;
  unint64_t v6 = v4 & ~*MEMORY[0x263F1CF38];
  if (v3) {
    return v5;
  }
  else {
    return v6;
  }
}

@end