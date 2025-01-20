@interface UIScreenAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (id)_accessibilityNativeFocusElement;
- (id)_focusSystem;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation UIScreenAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIScreen";
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
  v3 = @"UIScreen";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"didUpdateFocusInContext: withAnimationCoordinator:", v4, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_focusSystem", v4, 0);
  v5 = "B";
  [location[0] validateClass:v3 hasInstanceMethod:@"_isFocusSystemLoaded" withFullSignature:0];
  v6 = @"UIFocusSystem";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_setEnabled:", v7, v5, 0);
  objc_storeStrong(v9, v8);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  v17.receiver = v20;
  v17.super_class = (Class)UIScreenAccessibility;
  [(UIScreenAccessibility *)&v17 didUpdateFocusInContext:location[0] withAnimationCoordinator:v18];
  id v12 = (id)[location[0] previouslyFocusedItem];
  id v4 = (id)[location[0] nextFocusedItem];
  BOOL v13 = v12 != v4;

  BOOL v16 = v13;
  if (v13)
  {
    id v15 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityNativeFocusPreferredElement];
    UIAccessibilityPostNotification(*MEMORY[0x263F81308], v15);
    id v10 = (id)[location[0] nextFocusedView];
    [v10 bounds];
    frame.origin.x = v5;
    frame.origin.y = v6;
    frame.size.width = v7;
    frame.size.height = v8;
    v9 = (UIView *)(id)[location[0] nextFocusedView];
    UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)5, frame, v9);

    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityNativeFocusElement
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)[(UIScreenAccessibility *)self safeValueForKey:@"_focusSystem"];
  char v10 = 0;
  objc_opt_class();
  id v9 = (id)__UIAccessibilityCastAsClass();
  id v8 = v9;
  objc_storeStrong(&v9, 0);
  id v11 = (id)[v8 focusedItem];

  if (objc_opt_respondsToSelector())
  {
    id v2 = (id)[v11 _accessibilityUnderlyingElementForFocusItem];
    id v3 = v11;
    id v11 = v2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (id)[v12[0] safeValueForKey:@"_preferredFirstResponder"];
      os_log_t oslog = (os_log_t)(id)AXLogUIA();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_3_2_8_69_8_69((uint64_t)v13, (uint64_t)v11, (uint64_t)v7);
        _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "focused item is a first responder: %{sensitive}@. Preferred item is %{sensitive}@", v13, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (v7) {
        objc_storeStrong(&v11, v7);
      }
      objc_storeStrong(&v7, 0);
    }
  }
  id v5 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);

  return v5;
}

- (id)_focusSystem
{
  uint64_t v14 = self;
  SEL v13 = a2;
  char v12 = ([(UIScreenAccessibility *)self safeBoolForKey:@"_isFocusSystemLoaded"] ^ 1) & 1;
  v10.receiver = v14;
  v10.super_class = (Class)UIScreenAccessibility;
  id v11 = [(UIScreenAccessibility *)&v10 _focusSystem];
  if ((v12 & 1) != 0
    && (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0
    && (_UIApplicationIsExtension() & 1) != 0)
  {
    char v8 = 0;
    objc_opt_class();
    id v7 = (id)__UIAccessibilityCastAsClass();
    id v6 = v7;
    objc_storeStrong(&v7, 0);
    id v9 = v6;
    uint64_t v5 = [v6 _userInterfaceIdiom];
    if (v5 != 3 && v5 != 2)
    {
      id v4 = v11;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong(&v4, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  id v3 = v11;
  objc_storeStrong(&v11, 0);

  return v3;
}

void __37__UIScreenAccessibility__focusSystem__block_invoke(id *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  uint64_t v1 = MEMORY[0x263EF8330];
  int v2 = -1073741824;
  int v3 = 0;
  id v4 = __37__UIScreenAccessibility__focusSystem__block_invoke_2;
  uint64_t v5 = &unk_2650ADF18;
  v6[0] = a1[4];
  AXPerformSafeBlock();
  objc_storeStrong(v6, 0);
}

uint64_t __37__UIScreenAccessibility__focusSystem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 0, a1, a1);
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  uint64_t v4 = [(UIScreenAccessibility *)self _userInterfaceIdiom];
  BOOL v3 = 0;
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    BOOL v3 = 0;
    if (v4 != 3) {
      return v4 != 2;
    }
  }
  return v3;
}

@end