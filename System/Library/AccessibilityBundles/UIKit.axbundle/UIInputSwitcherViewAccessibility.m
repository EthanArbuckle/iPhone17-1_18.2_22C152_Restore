@interface UIInputSwitcherViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (id)_accessibilityLastHandednessBiasAnnouncement;
- (id)accessibilityIdentifier;
- (void)_accessibilitySetLastHandednessBiasAnnouncement:(uint64_t)a1;
- (void)_axAnnounceSelectedLanguage:(id)a3;
- (void)_segmentControlValueDidChange:(id)a3;
- (void)highlightRow:(unint64_t)a3;
- (void)updateSelectionWithPoint:(CGPoint)a3;
- (void)willFadeForSelectionAtIndex:(unint64_t)a3;
@end

@implementation UIInputSwitcherViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSwitcherView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIInputSwitcherView";
  v6 = @"UIKeyboardMenuView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"UIInputSwitcherTableView" isKindOfClass:@"UITableView"];
  [location[0] validateClass:@"UIInputSwitcherView" hasInstanceVariable:@"m_table" withType:"UIInputSwitcherTableView"];
  v3 = "@";
  [location[0] validateClass:@"UIInputSwitcherView" hasInstanceMethod:@"inputModes" withFullSignature:0];
  [location[0] validateClass:v4 hasInstanceVariable:@"m_inputSwitcherItems" withType:"NSArray"];
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"updateSelectionWithPoint:", "{CGPoint=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputSwitcherItem", @"identifier", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_segmentControlValueDidChange:", v7, v3, 0);
  v5 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"willFadeForSelectionAtIndex:", v7, "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputSwitcherSegmentControl", @"selectedSegmentIndex", "q", 0);
  [location[0] validateClass:v4 isKindOfClass:v6];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"highlightRow:", v7, v5, 0);
  objc_storeStrong(v9, v8);
}

- (id)_accessibilityLastHandednessBiasAnnouncement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIInputSwitcherView___accessibilityLastHandednessBiasAnnouncement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetLastHandednessBiasAnnouncement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)accessibilityIdentifier
{
  return @"InputSwitcherView";
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  CGPoint v14 = a3;
  v13 = self;
  v12[1] = (id)a2;
  char v11 = 0;
  objc_opt_class();
  id v5 = (id)[(UIInputSwitcherViewAccessibility *)v13 safeValueForKey:@"m_table"];
  id v10 = (id)__UIAccessibilityCastAsClass();

  id v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  id v8 = (id)[v9 indexPathForSelectedRow];
  v7.receiver = v13;
  v7.super_class = (Class)UIInputSwitcherViewAccessibility;
  -[UIInputSwitcherViewAccessibility updateSelectionWithPoint:](&v7, sel_updateSelectionWithPoint_, v14.x, v14.y);
  id v6 = (id)[v12[0] indexPathForSelectedRow];
  if (v8 != v6 && ([v8 isEqual:v6] & 1) == 0)
  {
    if (v6)
    {
      [(UIInputSwitcherViewAccessibility *)v13 _axAnnounceSelectedLanguage:v6];
    }
    else
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
      id v4 = accessibilityLocalizedString(@"keyboard.cancel");
      UIAccessibilityPostNotification(notification, v4);
    }
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v12, 0);
}

- (void)highlightRow:(unint64_t)a3
{
  id v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIInputSwitcherViewAccessibility;
  [(UIInputSwitcherViewAccessibility *)&v5 highlightRow:a3];
  uint64_t v3 = v8;
  id v4 = (id)[MEMORY[0x263F088C8] indexPathForRow:v6 inSection:0];
  -[UIInputSwitcherViewAccessibility _axAnnounceSelectedLanguage:](v3, "_axAnnounceSelectedLanguage:");
}

- (void)_axAnnounceSelectedLanguage:(id)a3
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v39 = 0;
  objc_opt_class();
  id v13 = (id)[(UIInputSwitcherViewAccessibility *)v42 safeValueForKey:@"m_table"];
  id v38 = (id)__UIAccessibilityCastAsClass();

  id v37 = v38;
  objc_storeStrong(&v38, 0);
  id v40 = v37;
  id v36 = (id)[v37 cellForRowAtIndexPath:location[0]];
  if (v36)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    int v30 = 838860800;
    int v31 = 48;
    v32 = __Block_byref_object_copy__12;
    v33 = __Block_byref_object_dispose__12;
    id v34 = 0;
    uint64_t v21 = MEMORY[0x263EF8330];
    int v22 = -1073741824;
    int v23 = 0;
    v24 = __64__UIInputSwitcherViewAccessibility__axAnnounceSelectedLanguage___block_invoke;
    v25 = &unk_2650ADF88;
    v27[1] = &v28;
    v26 = v42;
    v27[0] = location[0];
    AXPerformSafeBlock();
    id v20 = (id)v29[5];
    objc_storeStrong(v27, 0);
    objc_storeStrong((id *)&v26, 0);
    _Block_object_dispose(&v28, 8);
    objc_storeStrong(&v34, 0);
    id v35 = v20;
    id v19 = 0;
    id v18 = 0;
    id v17 = (id)[(UIInputSwitcherViewAccessibility *)v42 safeArrayForKey:@"inputModes"];
    id v16 = (id)[v35 safeValueForKey:@"identifier"];
    if ([v17 containsObject:v16]) {
      id v3 = v16;
    }
    else {
      id v3 = 0;
    }
    id v15 = v3;
    if (v3)
    {
      id v4 = (id)MEMORY[0x2455E67B0](v15);
      id v5 = v18;
      id v18 = v4;

      id v6 = (id)MEMORY[0x2455E66B0](v18);
      id v7 = v18;
      id v18 = v6;
    }
    id v8 = (id)[v36 accessibilityValue];
    id v9 = v19;
    id v19 = v8;

    id v10 = (void *)MEMORY[0x263F21660];
    id v12 = (id)[v36 accessibilityLabel];
    id v11 = (id)__UIAXStringForVariables();
    id argument = (id)objc_msgSend(v10, "axAttributedStringWithString:", v19, @"__AXStringForVariablesSentinel");

    if (v18) {
      [argument setAttribute:v18 forKey:*MEMORY[0x263F217A8]];
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v35, 0);
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

void __64__UIInputSwitcherViewAccessibility__axAnnounceSelectedLanguage___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) safeArrayForKey:@"m_inputSwitcherItems"];
  id v1 = (id)objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_segmentControlValueDidChange:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)UIInputSwitcherViewAccessibility;
  [(UIInputSwitcherViewAccessibility *)&v18 _segmentControlValueDidChange:location[0]];
  id v17 = 0;
  char v16 = 0;
  id v15 = (id)__UIAccessibilitySafeClass();
  id v14 = v15;
  objc_storeStrong(&v15, 0);
  id v3 = location[0];
  location[0] = v14;

  char v12 = 0;
  objc_opt_class();
  id v7 = (id)[location[0] safeValueForKey:@"selectedSegmentIndex"];
  id v11 = (id)__UIAccessibilityCastAsClass();

  id v10 = v11;
  objc_storeStrong(&v11, 0);
  id v13 = v10;
  if (v10 && (unint64_t)[v13 integerValue] <= 2)
  {
    id v4 = (id)UIKitAccessibilityLocalizedString();
    id v5 = v17;
    id v17 = v4;
  }
  char v8 = 0;
  LOBYTE(v6) = 0;
  if (v17)
  {
    id v9 = -[UIInputSwitcherViewAccessibility _accessibilityLastHandednessBiasAnnouncement](v20);
    char v8 = 1;
    int v6 = [v9 isEqualToString:v17] ^ 1;
  }
  if (v8) {

  }
  if (v6)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v17);
    -[UIInputSwitcherViewAccessibility _accessibilitySetLastHandednessBiasAnnouncement:]((uint64_t)v20, v17);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)willFadeForSelectionAtIndex:(unint64_t)a3
{
  char v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE68];
  id v4 = (id)[MEMORY[0x263F1C738] activeInstance];
  UIAccessibilityPostNotification(notification, v4);

  v5.receiver = v8;
  v5.super_class = (Class)UIInputSwitcherViewAccessibility;
  [(UIInputSwitcherViewAccessibility *)&v5 willFadeForSelectionAtIndex:v6];
}

@end