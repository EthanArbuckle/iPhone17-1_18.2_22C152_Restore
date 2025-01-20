@interface UITabBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityFuzzyHitTestElements;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_dismissCustomizeSheet:(BOOL)a3;
- (void)beginCustomizingItems:(id)a3;
@end

@implementation UITabBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UITabBar" hasInstanceVariable:@"_items" withType:"NSArray"];
  [location[0] validateClass:@"UITabBarItem" hasInstanceVariable:@"_view" withType:"UITabBarButton"];
  objc_storeStrong(location, 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 22;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v25 = self;
  SEL v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)UITabBarAccessibility;
  [(UITabBarAccessibility *)&v23 _accessibilityLoadAccessibilityInformation];
  char v21 = 0;
  objc_opt_class();
  id v9 = (id)[(UITabBarAccessibility *)v25 safeValueForKey:@"_items"];
  id v20 = (id)__UIAccessibilityCastAsClass();

  id v19 = v20;
  objc_storeStrong(&v20, 0);
  id v22 = v19;
  memset(__b, 0, 0x40uLL);
  id obj = v19;
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      __b[8] = *(void *)(__b[1] + 8 * v5);
      char v16 = 0;
      objc_opt_class();
      id v15 = (id)__UIAccessibilityCastAsClass();
      if (v16) {
        abort();
      }
      id v14 = v15;
      objc_storeStrong(&v15, 0);
      id v17 = v14;
      char v12 = 0;
      objc_opt_class();
      id v2 = (id)[v17 safeValueForKey:@"_view"];
      id v11 = (id)__UIAccessibilityCastAsClass();

      if (v12) {
        abort();
      }
      id v10 = v11;
      objc_storeStrong(&v11, 0);
      id v13 = v10;
      if (v17 && v13) {
        AXApplyTabBarItemPropertiesToView(v17, v13);
      }
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v17, 0);
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v22, 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)[(UITabBarAccessibility *)self safeValueForKey:@"subviews", a2, self];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v23 = a3;
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v20 = [(UITabBarAccessibility *)v22 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v13 = 0;
  char v6 = 0;
  if (!v20)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    id v17 = __57__UITabBarAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v18 = &unk_2650AE580;
    id v19 = v22;
    char v13 = 1;
    char v12 = (id *)&v19;
    char v6 = ((uint64_t (*)(void))__57__UITabBarAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v6)
  {
    -[UITabBarAccessibility _accessibilitySetBoolValue:forKey:](v22, "_accessibilitySetBoolValue:forKey:", 1);
    id v11 = (id)-[UITabBarAccessibility accessibilityHitTest:withEvent:](v22, "accessibilityHitTest:withEvent:", location[0], v23.x, v23.y);
    [(UITabBarAccessibility *)v22 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v24 = v11;
    int v10 = 1;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    int v10 = 0;
  }
  if (v13) {
    objc_storeStrong(v12, 0);
  }
  if (!v10)
  {
    id v9 = (id)[(UITabBarAccessibility *)v22 safeValueForKey:@"_customizeView"];
    if (v9)
    {
      if (-[UITabBarAccessibility pointInside:withEvent:](v22, "pointInside:withEvent:", location[0], v23.x, v23.y))
      {
        v8.receiver = v22;
        v8.super_class = (Class)UITabBarAccessibility;
        id v24 = -[UITabBarAccessibility _accessibilityHitTest:withEvent:](&v8, sel__accessibilityHitTest_withEvent_, location[0], v23.x, v23.y);
      }
      else
      {
        id v24 = 0;
      }
      int v10 = 1;
    }
    else
    {
      v7.receiver = v22;
      v7.super_class = (Class)UITabBarAccessibility;
      id v24 = -[UITabBarAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, location[0], v23.x, v23.y);
      int v10 = 1;
    }
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
  uint64_t v4 = v24;

  return v4;
}

BOOL __57__UITabBarAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_2_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_526);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      objc_super v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      uint64_t v4 = v8;
      int v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      objc_super v7 = NSStringFromClass(v2);
      id v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseImplementation_0;
}

void __57__UITabBarAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseImplementation_0 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      objc_super v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      uint64_t v3 = v7;
      id v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      objc_super v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)_dismissCustomizeSheet:(BOOL)a3
{
  char v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UITabBarAccessibility;
  [(UITabBarAccessibility *)&v3 _dismissCustomizeSheet:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)beginCustomizingItems:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITabBarAccessibility;
  [(UITabBarAccessibility *)&v3 beginCustomizingItems:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITabBarAccessibility *)self accessibilityUserDefinedLabel];
  if (location[0]) {
    id v5 = location[0];
  }
  else {
    id v5 = accessibilityLocalizedString(@"tab.bar.label");
  }
  objc_storeStrong(location, 0);
  id v2 = v5;

  return v2;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = [location[0] isEqual:*MEMORY[0x263F1D180]];
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end