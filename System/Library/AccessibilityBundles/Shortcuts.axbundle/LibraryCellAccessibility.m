@interface LibraryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axLibraryViewController;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation LibraryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Shortcuts.LibraryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Shortcuts.LibraryCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Shortcuts.LibraryViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWorkflowDescriptor", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWorkflowReference", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Shortcuts.LibraryCell", @"workflowReference", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Shortcuts.LibraryViewController", @"libraryCellDidRequestComposeUI:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Shortcuts.LibraryViewController", @"axDeleteWorkflowAction:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Shortcuts.LibraryViewController", @"axDuplicateWorkflowAction:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Shortcuts.LibraryCell", @"autoShortcut", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFExecutableAppShortcut", @"phrase", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LNAutoShortcutLocalizedPhrase", @"localizedPhrase", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(LibraryCellAccessibility *)self safeValueForKey:@"workflowReference"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 safeStringForKey:@"name"];
    v6 = [v4 safeStringForKey:@"subtitle"];
    __AXStringForVariables();
  }
  else
  {
    v5 = [(LibraryCellAccessibility *)self safeValueForKey:@"autoShortcut"];
    v6 = [v5 safeValueForKey:@"phrase"];
    [v6 safeStringForKey:@"localizedPhrase"];
  v7 = };

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)LibraryCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(LibraryCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomActions
{
  objc_super v3 = objc_opt_new();
  v4 = [(LibraryCellAccessibility *)self _axLibraryViewController];
  v5 = [(LibraryCellAccessibility *)self safeValueForKey:@"workflowReference"];
  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityLocalizedString(@"delete.action");
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke;
    v25[3] = &unk_265150C90;
    id v26 = v4;
    id v27 = v5;
    v8 = (void *)[v6 initWithName:v7 actionHandler:v25];
    [v3 addObject:v8];
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = objc_alloc(MEMORY[0x263F1C390]);
    v10 = accessibilityLocalizedString(@"duplicate.action");
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v22[3] = &unk_265150C90;
    id v23 = v4;
    id v24 = v5;
    v11 = (void *)[v9 initWithName:v10 actionHandler:v22];
    [v3 addObject:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = objc_alloc(MEMORY[0x263F1C390]);
    v13 = accessibilityLocalizedString(@"edit.action");
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_5;
    v19 = &unk_265150C90;
    id v20 = v4;
    v21 = self;
    v14 = (void *)[v12 initWithName:v13 actionHandler:&v16];
    objc_msgSend(v3, "addObject:", v14, v16, v17, v18, v19);
  }

  return v3;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) axDeleteWorkflowAction:*(void *)(a1 + 40)];
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) axDuplicateWorkflowAction:*(void *)(a1 + 40)];
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) libraryCellDidRequestComposeUI:*(void *)(a1 + 40)];
}

- (id)_axLibraryViewController
{
  id v2 = [(LibraryCellAccessibility *)self safeValueForKey:@"collectionView"];
  id v3 = [v2 safeValueForKey:@"delegate"];

  return v3;
}

@end