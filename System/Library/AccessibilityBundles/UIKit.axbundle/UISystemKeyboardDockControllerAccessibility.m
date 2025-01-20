@interface UISystemKeyboardDockControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (uint64_t)_axShowsGlobeKeyAsEmoji;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkupDockItems;
- (void)_axUpdateGlobeKeyLabel;
- (void)loadView;
- (void)updateDockItemsVisibility;
@end

@implementation UISystemKeyboardDockControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISystemKeyboardDockController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UISystemKeyboardDockController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v3 = "UIKeyboardDockItem";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"UISystemKeyboardDockController", @"_globeDockItem");
  [location[0] validateClass:@"UISystemKeyboardDockController" hasInstanceVariable:@"_dictationRunningDockItem" withType:"UIKeyboardDockItem"];
  [location[0] validateClass:@"UISystemKeyboardDockController" hasInstanceVariable:@"_dictationDockItem" withType:"UIKeyboardDockItem"];
  [location[0] validateClass:@"UISystemKeyboardDockController" hasInstanceVariable:@"_keyboardDockItem" withType:"UIKeyboardDockItem"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardDockItem", @"button", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"loadView", "v", 0);
  v5 = @"UIKeyboardImpl";
  v6 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"showsDedicatedEmojiKeyAlongsideGlobeButton", v6, 0);
  objc_storeStrong(v8, v7);
}

- (uint64_t)_axShowsGlobeKeyAsEmoji
{
  location[1] = a1;
  if (a1)
  {
    location[0] = (id)[MEMORY[0x263F1C738] activeInstance];
    LOBYTE(v2) = 0;
    if ([location[0] safeBoolForKey:@"globeKeyDisplaysAsEmojiKey"]) {
      int v2 = [location[0] safeBoolForKey:@"showsDedicatedEmojiKeyAlongsideGlobeButton"] ^ 1;
    }
    char v4 = v2 & 1;
    objc_storeStrong(location, 0);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (void)_axUpdateGlobeKeyLabel
{
  if (a1)
  {
    id v1 = (id)[a1 safeValueForKey:@"_globeDockItem"];
    char v4 = 0;
    char v2 = 0;
    if (-[UISystemKeyboardDockControllerAccessibility _axShowsGlobeKeyAsEmoji](a1))
    {
      id v5 = AXKBElementLocalizedForKeyboardLocale(@"global.keyboard.key.emoji");
      char v4 = 1;
      objc_msgSend(v1, "setAccessibilityLabel:", v5, v5);
    }
    else
    {
      id v3 = accessibilityLocalizedString(@"global.keyboard.key");
      char v2 = 1;
      objc_msgSend(v1, "setAccessibilityLabel:", v3, v3);
    }
    if (v2) {

    }
    if (v4) {
  }
    }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISystemKeyboardDockControllerAccessibility;
  [(UISystemKeyboardDockControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[UISystemKeyboardDockControllerAccessibility _accessibilityMarkupDockItems](v4);
}

- (void)_accessibilityMarkupDockItems
{
  v22 = a1;
  if (a1)
  {
    -[UISystemKeyboardDockControllerAccessibility _axUpdateGlobeKeyLabel](v22);
    id v21 = (id)[v22 safeValueForKey:@"_globeDockItem"];
    id v9 = accessibilityLocalizedString(@"globe.keyboard.key.hint");
    objc_msgSend(v21, "setAccessibilityHint:");

    objc_initWeak(&location, v22);
    id v10 = v21;
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    v17 = __76__UISystemKeyboardDockControllerAccessibility__accessibilityMarkupDockItems__block_invoke;
    v18 = &unk_2650AE108;
    objc_copyWeak(&v19, &location);
    [v10 _setAccessibilityValueBlock:&v14];
    id v13 = (id)[v22 safeValueForKey:@"_dictationRunningDockItem"];
    id v8 = accessibilityLocalizedString(@"dictation.key");
    objc_msgSend(v13, "setAccessibilityLabel:");

    id v7 = accessibilityLocalizedString(@"dictation.running.key.value");
    objc_msgSend(v13, "setAccessibilityValue:");

    [v13 setAccessibilityIdentifier:@"dictation"];
    id v12 = (id)[v22 safeValueForKey:@"_dictationDockItem"];
    id v6 = accessibilityLocalizedString(@"dictation.key");
    objc_msgSend(v12, "setAccessibilityLabel:");

    id v5 = accessibilityLocalizedString(@"dictation.key.hint");
    objc_msgSend(v12, "setAccessibilityHint:");

    [v12 setAccessibilityIdentifier:@"dictation"];
    id v11 = (id)[v22 safeValueForKey:@"_keyboardDockItem"];
    id v4 = accessibilityLocalizedString(@"keyboardMinimized.tabButton");
    objc_msgSend(v11, "setAccessibilityLabel:");

    id v1 = (id)[v21 safeValueForKey:@"button"];
    id v2 = (id)[v12 safeValueForKey:@"button"];
    id v3 = (id)[v11 safeValueForKey:@"button"];
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    objc_storeStrong(&v21, 0);
  }
}

id __76__UISystemKeyboardDockControllerAccessibility__accessibilityMarkupDockItems__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = -[UISystemKeyboardDockControllerAccessibility _axShowsGlobeKeyAsEmoji](WeakRetained);

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    BOOL KeyboardKeys = UIAXRequiresTwoNextKeyboardKeys();
    uint64_t v2 = 2;
    if (!KeyboardKeys) {
      uint64_t v2 = 0;
    }
    id v6 = UIAXNextKeyboardValue(v2);
  }

  return v6;
}

- (void)updateDockItemsVisibility
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISystemKeyboardDockControllerAccessibility;
  [(UISystemKeyboardDockControllerAccessibility *)&v2 updateDockItemsVisibility];
  -[UISystemKeyboardDockControllerAccessibility _axUpdateGlobeKeyLabel](v4);
}

- (void)loadView
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISystemKeyboardDockControllerAccessibility;
  [(UISystemKeyboardDockControllerAccessibility *)&v2 loadView];
  -[UISystemKeyboardDockControllerAccessibility _accessibilityMarkupDockItems](v4);
}

@end