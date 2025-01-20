@interface HUDashboardFilterCategoryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUDashboardFilterCategoryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDashboardFilterCategoryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUDashboardFilterCategoryCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"HomeUI.DashboardFilterCategoryCell[class].ContentView"];
  [v3 validateClass:@"HomeUI.DashboardFilterCategoryCell[class].ContentView" hasSwiftField:@"config" withSwiftType:"ContentConfiguration"];
  [v3 validateSwiftStruct:@"HomeUI.DashboardFilterCategoryCell[class].ContentConfiguration"];
  [v3 validateSwiftStruct:@"HomeUI.DashboardFilterCategoryCell[class].ContentConfiguration" hasSwiftField:@"text" withSwiftType:"Optional<String>"];
  [v3 validateSwiftStruct:@"HomeUI.DashboardFilterCategoryCell[class].ContentConfiguration" hasSwiftField:@"secondaryText" withSwiftType:"Optional<String>"];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 contentView];
  v4 = [v3 safeSwiftValueForKey:@"config"];
  v5 = __UIAccessibilityCastAsSwiftStruct();

  v6 = [v5 safeSwiftStringForKey:@"text"];
  if ([v6 length])
  {
    v7 = NSString;
    v8 = accessibilityHomeUILocalizedString(@"filter.cell.show.prefix");
    uint64_t v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);

    v6 = (void *)v9;
  }
  v12 = [v5 safeSwiftStringForKey:@"secondaryText"];
  v10 = __UIAXStringForVariables();

  return v10;
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(@"filter.cell.hint");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUDashboardFilterCategoryCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUDashboardFilterCategoryCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

@end