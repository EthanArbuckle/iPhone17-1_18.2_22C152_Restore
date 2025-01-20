@interface CNUINavigationListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityToggleItemForCell:(id)a3;
@end

@implementation CNUINavigationListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNUINavigationListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNUINavigationListViewController", @"itemAtIndexPath:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNUINavigationListViewController", @"navigationListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNUINavigationListViewController", @"toggleItem:", "v", "@", 0);
}

- (BOOL)_accessibilityToggleItemForCell:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(CNUINavigationListViewControllerAccessibility *)self safeValueForKey:@"navigationListView"];
  v6 = __UIAccessibilityCastAsClass();

  if (v6)
  {
    int v7 = [v4 safeBoolForKey:@"accessoryControlExpanded"];
    uint64_t v10 = MEMORY[0x263EF8330];
    id v11 = v6;
    id v12 = v4;
    AXPerformSafeBlock();
    int v8 = v7 ^ objc_msgSend(v12, "safeBoolForKey:", @"accessoryControlExpanded", v10, 3221225472, __81__CNUINavigationListViewControllerAccessibility__accessibilityToggleItemForCell___block_invoke, &unk_265118008);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

void __81__CNUINavigationListViewControllerAccessibility__accessibilityToggleItemForCell___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 48) itemAtIndexPath:v3];
  [*(id *)(a1 + 48) toggleItem:v2];
}

@end