@interface NavSignListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_didPan:(id)a3;
- (void)_didTap:(id)a3;
@end

@implementation NavSignListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavSignListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignListViewController", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignListViewController", @"activeStepIndex", "Q", 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NavSignListViewControllerAccessibility;
  v7 = [(NavSignListViewControllerAccessibility *)&v13 collectionView:a3 cellForItemAtIndexPath:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
  v12[3] = &unk_26512D6B0;
  v12[4] = self;
  [v7 _setAccessibilityHintBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v10[3] = &unk_26512D6D8;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  [v7 _setAccessibilityElementsHiddenBlock:v10];

  return v7;
}

id __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) safeBoolForKey:@"isExpanded"]) {
    v1 = @"ROUTE_LIST_HINT_COLLAPSE";
  }
  else {
    v1 = @"ROUTE_LIST_HINT_EXPAND";
  }
  v2 = AXMapsLocString(v1);

  return v2;
}

BOOL __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) safeBoolForKey:@"isExpanded"]) {
    return 0;
  }
  uint64_t v3 = [*(id *)(a1 + 32) safeIntegerForKey:@"activeStepIndex"];
  return [*(id *)(a1 + 40) row] != v3;
}

- (void)_didTap:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NavSignListViewControllerAccessibility;
  [(NavSignListViewControllerAccessibility *)&v3 _didTap:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_didPan:(id)a3
{
  id v4 = a3;
  int v5 = [(NavSignListViewControllerAccessibility *)self safeBoolForKey:@"isExpanded"];
  v6.receiver = self;
  v6.super_class = (Class)NavSignListViewControllerAccessibility;
  [(NavSignListViewControllerAccessibility *)&v6 _didPan:v4];

  if (v5 != [(NavSignListViewControllerAccessibility *)self safeBoolForKey:@"isExpanded"])UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0); {
}
  }

@end