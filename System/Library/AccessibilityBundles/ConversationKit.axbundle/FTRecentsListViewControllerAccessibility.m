@interface FTRecentsListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axPrepareHeaderView:(id)a3;
- (void)accessibilityPrepareHeaderView:(id)a3;
@end

@implementation FTRecentsListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FTRecentsListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FTRecentsListViewController", @"accessibilityPrepareHeaderView:", "v", "@", 0);
  [v3 validateClass:@"FTRecentsListViewController" hasSwiftField:@"collectionView" withSwiftType:"UICollectionView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)FTRecentsListViewControllerAccessibility;
  [(FTRecentsListViewControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(FTRecentsListViewControllerAccessibility *)self safeSwiftValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityLocalizedString(@"recentList.label");
  [v4 setAccessibilityLabel:v5];

  uint64_t v6 = [v4 numberOfSections];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *MEMORY[0x263F1D120];
    do
    {
      v10 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v8];
      objc_opt_class();
      v11 = [v4 supplementaryViewForElementKind:v9 atIndexPath:v10];
      v12 = __UIAccessibilityCastAsClass();

      [(FTRecentsListViewControllerAccessibility *)self _axPrepareHeaderView:v12];
      ++v8;
    }
    while (v7 != v8);
  }
}

- (void)accessibilityPrepareHeaderView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FTRecentsListViewControllerAccessibility;
  id v4 = a3;
  [(FTRecentsListViewControllerAccessibility *)&v5 accessibilityPrepareHeaderView:v4];
  -[FTRecentsListViewControllerAccessibility _axPrepareHeaderView:](self, "_axPrepareHeaderView:", v4, v5.receiver, v5.super_class);
}

- (void)_axPrepareHeaderView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 contentConfiguration];
  objc_super v5 = __UIAccessibilityCastAsClass();

  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  uint64_t v6 = [v5 text];
  [v3 setAccessibilityLabel:v6];
}

@end