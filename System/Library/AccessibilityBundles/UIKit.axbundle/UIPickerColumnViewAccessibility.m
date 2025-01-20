@interface UIPickerColumnViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityKeyCommands;
- (id)_accessibilityNativeFocusPreferredElement;
- (id)_viewToAddFocusLayer;
- (id)accessibilityPath;
- (void)_fkaMoveToNextColumn;
- (void)_fkaMoveToPreviousColumn;
- (void)_fkaScrollToNextRow;
- (void)_fkaScrollToPreviousRow;
@end

@implementation UIPickerColumnViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPickerColumnView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIPickerTableView" isKindOfClass:@"UITableView"];
  v3 = @"UIPickerColumnView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIPickerColumnView" hasInstanceVariable:@"_middleTable" withType:"UIPickerTableView"];
  v5 = "q";
  [location[0] validateClass:@"UIPickerColumnView" hasInstanceMethod:@"selectionBarRow" withFullSignature:0];
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_scrollRowAtIndexPathToSelectionBar:animated:", "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_tableFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPickerView", @"columnForTableView:", v5, v4, 0);
  objc_storeStrong(v7, v6);
}

- (id)_accessibilityNativeFocusPreferredElement
{
  v18 = self;
  v17[1] = (id)a2;
  char v16 = 0;
  objc_opt_class();
  id v5 = (id)[(UIPickerColumnViewAccessibility *)v18 safeValueForKey:@"_pickerView"];
  id v15 = (id)__UIAccessibilityCastAsClass();

  id v14 = v15;
  objc_storeStrong(&v15, 0);
  v17[0] = v14;
  id v4 = (id)[v14 accessibilityElements];
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v13 = 0;
  v8[1] = &v9;
  id v7 = v17[0];
  v8[0] = v18;
  AXPerformSafeBlock();
  uint64_t v6 = v10[3];
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
  _Block_object_dispose(&v9, 8);
  id v3 = (id)[v4 axSafeObjectAtIndex:v6];

  objc_storeStrong(v17, 0);

  return v3;
}

void __76__UIPickerColumnViewAccessibility__accessibilityNativeFocusPreferredElement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) safeValueForKey:@"_middleTable"];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v1, "columnForTableView:");
}

- (id)_accessibilityKeyCommands
{
  v15[4] = *MEMORY[0x263EF8340];
  id v14 = self;
  SEL v13 = a2;
  char v12 = [(UIPickerColumnViewAccessibility *)self _accessibilityIsRTL] & 1;
  if (v12) {
    id v2 = (id)*MEMORY[0x263F1D3E0];
  }
  else {
    id v2 = (id)*MEMORY[0x263F1D3D8];
  }
  id v11 = v2;
  if (v12) {
    id v3 = (id)*MEMORY[0x263F1D3D8];
  }
  else {
    id v3 = (id)*MEMORY[0x263F1D3E0];
  }
  id v10 = v3;
  id v9 = (id)objc_msgSend(MEMORY[0x263F1C708], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x263F1D3E8]);
  v15[0] = v9;
  id v8 = (id)[MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3C8] modifierFlags:0 action:sel__fkaScrollToNextRow];
  v15[1] = v8;
  id v7 = (id)[MEMORY[0x263F1C708] keyCommandWithInput:v11 modifierFlags:0 action:sel__fkaMoveToPreviousColumn];
  v15[2] = v7;
  id v5 = (id)[MEMORY[0x263F1C708] keyCommandWithInput:v10 modifierFlags:0 action:sel__fkaMoveToNextColumn];
  v15[3] = v5;
  id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);

  return v6;
}

- (void)_fkaScrollToPreviousRow
{
  id v14 = self;
  v13[1] = (id)a2;
  id v3 = (void *)MEMORY[0x263F088C8];
  int v12 = 0;
  uint64_t v11 = [(UIPickerColumnViewAccessibility *)self safeIntegerForKey:@"selectionBarRow"] - 1;
  if (v11 <= 0) {
    uint64_t v2 = v12;
  }
  else {
    uint64_t v2 = v11;
  }
  v10[1] = (id)v2;
  v13[0] = (id)[v3 indexPathForRow:v2 inSection:0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __58__UIPickerColumnViewAccessibility__fkaScrollToPreviousRow__block_invoke;
  id v8 = &unk_2650ADFB0;
  id v9 = v14;
  v10[0] = v13[0];
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F812B0], 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(v13, 0);
}

uint64_t __58__UIPickerColumnViewAccessibility__fkaScrollToPreviousRow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollRowAtIndexPathToSelectionBar:animated:", *(void *)(a1 + 40), 1, a1, a1);
}

- (void)_fkaScrollToNextRow
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", -[UIPickerColumnViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", @"selectionBarRow")+ 1, 0);
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  int v5 = __54__UIPickerColumnViewAccessibility__fkaScrollToNextRow__block_invoke;
  int v6 = &unk_2650ADFB0;
  id v7 = v10;
  id v8 = v9[0];
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F812B0], 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(v9, 0);
}

uint64_t __54__UIPickerColumnViewAccessibility__fkaScrollToNextRow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollRowAtIndexPathToSelectionBar:animated:", *(void *)(a1 + 40), 1, a1, a1);
}

- (void)_fkaMoveToPreviousColumn
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  int v5 = __59__UIPickerColumnViewAccessibility__fkaMoveToPreviousColumn__block_invoke;
  int v6 = &unk_2650ADF18;
  v7[0] = self;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F812B0], 0);
  objc_storeStrong(v7, 0);
}

void __59__UIPickerColumnViewAccessibility__fkaMoveToPreviousColumn__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _accessibilityFocusContainer];
  [v1 _accessibilityMoveFocusWithHeading:32];
}

- (void)_fkaMoveToNextColumn
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  int v5 = __55__UIPickerColumnViewAccessibility__fkaMoveToNextColumn__block_invoke;
  int v6 = &unk_2650ADF18;
  v7[0] = self;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F812B0], 0);
  objc_storeStrong(v7, 0);
}

void __55__UIPickerColumnViewAccessibility__fkaMoveToNextColumn__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _accessibilityFocusContainer];
  [v1 _accessibilityMoveFocusWithHeading:16];
}

- (id)_viewToAddFocusLayer
{
  return (id)[(UIPickerColumnViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
}

- (id)accessibilityPath
{
  [(UIPickerColumnViewAccessibility *)self safeCGRectForKey:@"frame"];
  r1.origin.x = v2;
  r1.origin.y = v3;
  r1.size.width = v4;
  r1.size.height = v5;
  [(UIPickerColumnViewAccessibility *)self safeCGRectForKey:@"_tableFrame"];
  r2.origin.x = v6;
  r2.origin.y = v7;
  r2.size.width = v8;
  r2.size.height = v9;
  CGRect v19 = CGRectIntersection(r1, r2);
  id v15 = (void *)MEMORY[0x263F1C478];
  -[UIPickerColumnViewAccessibility convertRect:toView:](self, "convertRect:toView:", 0, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  return (id)objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:", v10, v11, v12, v13, 5.0);
}

@end