@interface SBHPageManagementCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSelected;
- (BOOL)_accessibilityToggleButtonEnabled;
- (BOOL)_axHandleJumpToPage;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityToggleButton;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityPageIndex;
- (void)iconListHiddenDidChange:(id)a3;
@end

@implementation SBHPageManagementCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHPageManagementCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHPageManagementCellView", @"toggleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHPageManagementCellView", @"listView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHPageManagementCellView", @"iconListHiddenDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHPageManagementCellViewController", @"delegate", "@", 0);
  [v3 validateClass:@"SBRootFolderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"folder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"model", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolder", @"indexOfList:", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"exitPageManagementUIWithCompletionHandler:", "v", "@?", 0);
  [v3 validateClass:@"SBIconView"];
  [v3 validateProtocol:@"SBHPageManagementCellViewControllerDelegate" hasRequiredInstanceMethod:@"pageManagementCellViewControllerDidReceiveTap:"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = NSString;
  v4 = accessibilityLocalizedString(@"page.management.home.page");
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

- (id)accessibilityValue
{
  if ([(SBHPageManagementCellViewAccessibility *)self _accessibilityIsSelected]) {
    v2 = @"page.management.home.page.visible";
  }
  else {
    v2 = @"page.management.home.page.hidden";
  }

  return accessibilityLocalizedString(v2);
}

- (id)accessibilityHint
{
  if ([(SBHPageManagementCellViewAccessibility *)self _accessibilityToggleButtonEnabled])
  {
    if ([(SBHPageManagementCellViewAccessibility *)self _accessibilityIsSelected]) {
      id v3 = @"page.management.home.page.hint.hide";
    }
    else {
      id v3 = @"page.management.home.page.hint.show";
    }
    v4 = accessibilityLocalizedString(v3);
  }
  else
  {
    v5 = NSString;
    v6 = accessibilityLocalizedString(@"page.management.home.page.hint.jump");
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
    v4 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  }

  return v4;
}

- (id)accessibilityCustomActions
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([(SBHPageManagementCellViewAccessibility *)self _accessibilityIsSelected])
  {
    id v3 = NSString;
    v4 = accessibilityLocalizedString(@"page.management.home.page.jump.action");
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
    v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

    v7 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v6 target:self selector:sel__axHandleJumpToPage];
    v10[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(SBHPageManagementCellViewAccessibility *)self _accessibilityToggleButtonEnabled])
  {
    id v3 = [(SBHPageManagementCellViewAccessibility *)self safeValueForKey:@"toggleButton"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBHPageManagementCellViewAccessibility;
    [(SBHPageManagementCellViewAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  double v4 = [(SBHPageManagementCellViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbrootfoldervi_2.isa)];
  id v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __68__SBHPageManagementCellViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) exitPageManagementUIWithCompletionHandler:0];
}

- (void)iconListHiddenDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBHPageManagementCellViewAccessibility;
  [(SBHPageManagementCellViewAccessibility *)&v10 iconListHiddenDidChange:a3];
  if ([(SBHPageManagementCellViewAccessibility *)self _accessibilityIsSelected]) {
    double v4 = @"page.management.home.page.changed.visible";
  }
  else {
    double v4 = @"page.management.home.page.changed.hidden";
  }
  double v5 = accessibilityLocalizedString(v4);
  UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
  double v7 = NSString;
  double v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBHPageManagementCellViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex"));
  double v9 = objc_msgSend(v7, "localizedStringWithFormat:", v5, v8);
  UIAccessibilityPostNotification(v6, v9);
}

- (BOOL)_accessibilityIsSelected
{
  id v2 = [(SBHPageManagementCellViewAccessibility *)self _accessibilityToggleButton];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isSelected];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_accessibilityToggleButtonEnabled
{
  id v2 = [(SBHPageManagementCellViewAccessibility *)self _accessibilityToggleButton];
  char v3 = [v2 isEnabled];

  return v3;
}

- (id)_accessibilityToggleButton
{
  objc_opt_class();
  char v3 = [(SBHPageManagementCellViewAccessibility *)self safeValueForKey:@"toggleButton"];
  char v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)_axHandleJumpToPage
{
  return 1;
}

void __61__SBHPageManagementCellViewAccessibility__axHandleJumpToPage__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityViewController];
  v1 = [v2 safeValueForKey:@"delegate"];
  [v1 pageManagementCellViewControllerDidReceiveTap:v2];
}

- (id)accessibilityDragSourceDescriptors
{
  id v2 = [(SBHPageManagementCellViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_8 startWithSelf:0];
  char v3 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  char v4 = __UIAccessibilityCastAsClass();
  [v4 bounds];
  UIRectGetCenter();
  objc_msgSend(v4, "convertPoint:toView:", v2);
  double v6 = v5;
  double v8 = v7;
  id v9 = objc_alloc(MEMORY[0x263F1C3B8]);
  objc_super v10 = accessibilityLocalizedString(@"drag.page");
  v11 = objc_msgSend(v9, "initWithName:point:inView:", v10, v2, v6, v8);
  [v3 axSafelyAddObject:v11];

  return v3;
}

uint64_t __76__SBHPageManagementCellViewAccessibility_accessibilityDragSourceDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Sbiconview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityDropPointDescriptors
{
  char v3 = [(SBHPageManagementCellViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_372 startWithSelf:0];
  char v4 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  double v5 = __UIAccessibilityCastAsClass();
  [v5 bounds];
  UIRectGetCenter();
  objc_msgSend(v5, "convertPoint:toView:", v3);
  double v7 = v6;
  double v9 = v8 + -0.5;
  objc_super v10 = NSString;
  v11 = accessibilityLocalizedString(@"drop.before.page");
  v12 = [(SBHPageManagementCellViewAccessibility *)self accessibilityLabel];
  v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

  v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1C3B8]), "initWithName:point:inView:", v13, v3, v9, v7);
  [v4 axSafelyAddObject:v14];

  [v5 bounds];
  UIRectGetCenter();
  objc_msgSend(v5, "convertPoint:toView:", v3);
  double v16 = v15;
  double v18 = v17 + 0.5;
  v19 = NSString;
  v20 = accessibilityLocalizedString(@"drop.after.page");
  v21 = [(SBHPageManagementCellViewAccessibility *)self accessibilityLabel];
  v22 = objc_msgSend(v19, "stringWithFormat:", v20, v21);

  v23 = objc_msgSend(objc_alloc(MEMORY[0x263F1C3B8]), "initWithName:point:inView:", v22, v3, v18, v16);
  [v4 axSafelyAddObject:v23];

  return v4;
}

uint64_t __75__SBHPageManagementCellViewAccessibility_accessibilityDropPointDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Sbiconview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int64_t)_accessibilityPageIndex
{
  char v3 = [(SBHPageManagementCellViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbrootfoldervi_2.isa)];
  char v4 = [v3 safeValueForKey:@"folder"];
  double v5 = [(SBHPageManagementCellViewAccessibility *)self safeValueForKey:@"listView"];
  double v6 = [v5 safeValueForKey:@"model"];
  uint64_t v7 = [v4 indexOfList:v6];

  return v7 + 1;
}

@end