@interface SBUITableViewCellAccessibilityElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
@end

@implementation SBUITableViewCellAccessibilityElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCellAccessibilityElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4 = a3;
  v5 = [(SBUITableViewCellAccessibilityElementAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbassistantvie.isa)];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 safeValueForKey:@"_tableView"];
    v8 = [(SBUITableViewCellAccessibilityElementAccessibility *)self accessibilityContainer];
    char v9 = [v8 isScrollEnabled];

    if ((v9 & 1) == 0)
    {
      v11 = [(SBUITableViewCellAccessibilityElementAccessibility *)self safeValueForKey:@"tableViewCell"];
      [v11 bounds];
      objc_msgSend(v7, "convertRect:fromView:", v11);
      objc_msgSend(v7, "scrollRectToVisible:animated:", 0);
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __92__SBUITableViewCellAccessibilityElementAccessibility_accessibilityScrollToVisibleWithChild___block_invoke;
      v17 = &unk_265153D50;
      v18 = self;
      AXPerformBlockAsynchronouslyOnMainThread();

      BOOL v10 = 1;
      goto LABEL_6;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SBUITableViewCellAccessibilityElementAccessibility;
  BOOL v10 = [(SBUITableViewCellAccessibilityElementAccessibility *)&v13 accessibilityScrollToVisibleWithChild:v4];
LABEL_6:

  return v10;
}

id __92__SBUITableViewCellAccessibilityElementAccessibility_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) safeValueForKey:@"tableViewCell"];
}

@end