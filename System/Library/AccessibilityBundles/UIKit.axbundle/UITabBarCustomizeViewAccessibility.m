@interface UITabBarCustomizeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityObscuredScreenAllowedViews;
- (void)tabBarTouchesBegan:(id)a3 withEvent:(id)a4;
- (void)tabBarTouchesEnded:(id)a3 withEvent:(id)a4;
- (void)tabBarTouchesMoved:(id)a3 withEvent:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UITabBarCustomizeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarCustomizeView";
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
  v3 = @"UITabBarCustomizeView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UITabBarCustomizeView" hasInstanceVariable:@"_draggingItem" withType:"UITabBarItem"];
  [location[0] validateClass:@"UITabBar" hasInstanceVariable:@"_items" withType:"NSArray"];
  v5 = @"view";
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITabBarItem", 0);
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"tabBarTouchesBegan: withEvent:", v6, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"tabBarTouchesMoved: withEvent:", v4, v6, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"tabBarTouchesEnded: withEvent:", v4, v6, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITabBarItemProxy", v5, v6, 0);
  objc_storeStrong(v8, v7);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  v5[1] = *MEMORY[0x263EF8340];
  id v3 = (id)[(UITabBarCustomizeViewAccessibility *)self safeValueForKey:@"_tabBar"];
  v5[0] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v15, "safeValueForKey:");
  v11.receiver = v15;
  v11.super_class = (Class)UITabBarCustomizeViewAccessibility;
  [(UITabBarCustomizeViewAccessibility *)&v11 touchesBegan:location[0] withEvent:v13];
  id v10 = (id)[(UITabBarCustomizeViewAccessibility *)v15 safeValueForKey:@"_draggingProxy"];
  if (!v12 && v10)
  {
    id v4 = NSString;
    id v7 = accessibilityLocalizedString(@"started.moving.tabbar.icon");
    id v6 = (id)[v10 safeValueForKey:@"view"];
    id v5 = (id)[v6 accessibilityLabel];
    id v9 = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = (id)-[UITabBarCustomizeViewAccessibility safeValueForKey:](v21, "safeValueForKey:");
  v17.receiver = v21;
  v17.super_class = (Class)UITabBarCustomizeViewAccessibility;
  [(UITabBarCustomizeViewAccessibility *)&v17 touchesMoved:location[0] withEvent:v19];
  id v16 = (id)[(UITabBarCustomizeViewAccessibility *)v21 safeValueForKey:@"_replaceItem"];
  if (v16 && ([v18 isEqual:v16] & 1) == 0)
  {
    id v15 = (id)[v16 safeValueForKey:@"view"];
    id v12 = (UIAccessibilityNotifications *)MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21980]);
    id v5 = (id)[(UITabBarCustomizeViewAccessibility *)v21 safeValueForKey:@"_tabBar"];
    id v4 = (id)[v5 safeValueForKey:@"_items"];
    id v6 = (char *)[v4 indexOfObject:v16];

    v14[1] = v6;
    id v7 = NSString;
    id v11 = accessibilityLocalizedString(@"replacing.tabbar.icon");
    id v10 = (id)[v15 accessibilityLabel];
    id v9 = (id)[NSNumber numberWithUnsignedInteger:v6 + 1];
    id v8 = (id)AXFormatNumber();
    v14[0] = (id)objc_msgSend(v7, "stringWithFormat:", v11, v10, v8);

    UIAccessibilityPostNotification(*v12, v14[0]);
    objc_storeStrong(v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[(UITabBarCustomizeViewAccessibility *)v9 safeValueForKey:@"_draggingProxy"];
  v5.receiver = v9;
  v5.super_class = (Class)UITabBarCustomizeViewAccessibility;
  [(UITabBarCustomizeViewAccessibility *)&v5 touchesEnded:location[0] withEvent:v7];
  if (v6) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)tabBarTouchesBegan:(id)a3 withEvent:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  v11.receiver = v14;
  v11.super_class = (Class)UITabBarCustomizeViewAccessibility;
  [(UITabBarCustomizeViewAccessibility *)&v11 tabBarTouchesBegan:location[0] withEvent:v12];
  id v10 = (id)[(UITabBarCustomizeViewAccessibility *)v14 safeValueForKey:@"_draggingItem"];
  if (v10)
  {
    id v4 = NSString;
    id v7 = accessibilityLocalizedString(@"started.moving.tabbar.icon");
    id v6 = (id)[v10 safeValueForKey:@"view"];
    id v5 = (id)[v6 accessibilityLabel];
    id v9 = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)tabBarTouchesMoved:(id)a3 withEvent:(id)a4
{
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  uint64_t v27 = 0;
  v28 = &v27;
  int v29 = 838860800;
  int v30 = 48;
  v31 = __Block_byref_object_copy__19;
  v32 = __Block_byref_object_dispose__19;
  id v33 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  v22 = __67__UITabBarCustomizeViewAccessibility_tabBarTouchesMoved_withEvent___block_invoke;
  v23 = &unk_2650AEAD0;
  v26[1] = &v27;
  v24 = v37;
  id v25 = location[0];
  v26[0] = v35;
  AXPerformSafeBlock();
  id v18 = (id)v28[5];
  objc_storeStrong(v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong((id *)&v24, 0);
  _Block_object_dispose(&v27, 8);
  objc_storeStrong(&v33, 0);
  id v34 = v18;
  v17.receiver = v37;
  v17.super_class = (Class)UITabBarCustomizeViewAccessibility;
  [(UITabBarCustomizeViewAccessibility *)&v17 tabBarTouchesMoved:location[0] withEvent:v35];
  id v16 = (id)[(UITabBarCustomizeViewAccessibility *)v37 safeValueForKey:@"_draggingItem"];
  if (v16 && v34 && ([v34 isEqual:v16] & 1) == 0)
  {
    id v12 = (UIAccessibilityNotifications *)MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21980]);
    id v15 = (id)[v34 safeValueForKey:@"view"];
    id v5 = (id)[(UITabBarCustomizeViewAccessibility *)v37 safeValueForKey:@"_tabBar"];
    id v4 = (id)[v5 safeValueForKey:@"_items"];
    id v6 = (char *)[v4 indexOfObject:v16];

    argument[1] = v6;
    id v7 = NSString;
    id v11 = accessibilityLocalizedString(@"replacing.tabbar.icon");
    id v10 = (id)[v15 accessibilityLabel];
    id v9 = (id)[NSNumber numberWithUnsignedInteger:v6 + 1];
    id v8 = (id)AXFormatNumber();
    argument[0] = (id)objc_msgSend(v7, "stringWithFormat:", v11, v10, v8);

    UIAccessibilityPostNotification(*v12, argument[0]);
    objc_storeStrong(argument, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __67__UITabBarCustomizeViewAccessibility_tabBarTouchesMoved_withEvent___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) itemInTabBarWithTouches:*(void *)(a1 + 40) withEvent:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (void)tabBarTouchesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[(UITabBarCustomizeViewAccessibility *)v9 safeValueForKey:@"_draggingItem"];
  v5.receiver = v9;
  v5.super_class = (Class)UITabBarCustomizeViewAccessibility;
  [(UITabBarCustomizeViewAccessibility *)&v5 tabBarTouchesEnded:location[0] withEvent:v7];
  if (v6) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  CGPoint v82 = a3;
  v81 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v79 = [(UITabBarCustomizeViewAccessibility *)v81 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v72 = 0;
  char v33 = 0;
  if (!v79)
  {
    uint64_t v73 = MEMORY[0x263EF8330];
    int v74 = -1073741824;
    int v75 = 0;
    v76 = __70__UITabBarCustomizeViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v77 = &unk_2650AE580;
    v78 = v81;
    char v72 = 1;
    v71 = (id *)&v78;
    char v33 = ((uint64_t (*)(void))__70__UITabBarCustomizeViewAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v33)
  {
    -[UITabBarCustomizeViewAccessibility _accessibilitySetBoolValue:forKey:](v81, "_accessibilitySetBoolValue:forKey:", 1);
    id v70 = (id)-[UITabBarCustomizeViewAccessibility accessibilityHitTest:withEvent:](v81, "accessibilityHitTest:withEvent:", location[0], v82.x, v82.y);
    [(UITabBarCustomizeViewAccessibility *)v81 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v83 = v70;
    int v69 = 1;
    objc_storeStrong(&v70, 0);
  }
  else
  {
    int v69 = 0;
  }
  if (v72) {
    objc_storeStrong(v71, 0);
  }
  if (!v69)
  {
    v67.receiver = v81;
    v67.super_class = (Class)UITabBarCustomizeViewAccessibility;
    id v68 = -[UITabBarCustomizeViewAccessibility _accessibilityHitTest:withEvent:](&v67, sel__accessibilityHitTest_withEvent_, location[0], v82.x, v82.y);
    char v62 = 0;
    if (!v68 || (char v32 = 0, v68 == v81))
    {
      char v66 = 0;
      objc_opt_class();
      id v65 = (id)__UIAccessibilityCastAsClass();
      id v64 = v65;
      objc_storeStrong(&v65, 0);
      id v63 = v64;
      char v62 = 1;
      char v32 = objc_msgSend(v64, "pointInside:withEvent:", location[0], v82.x, v82.y);
    }
    if (v62) {

    }
    if (v32)
    {
      char v60 = 0;
      objc_opt_class();
      id v31 = (id)[(UITabBarCustomizeViewAccessibility *)v81 safeValueForKey:@"_proxies"];
      id v59 = (id)__UIAccessibilityCastAsClass();

      id v58 = v59;
      objc_storeStrong(&v59, 0);
      id v61 = v58;
      uint64_t v57 = 0;
      id v27 = (id)[(UITabBarCustomizeViewAccessibility *)v81 safeValueForKey:@"_itemsInRowCount"];
      uint64_t v28 = [v27 integerValue];

      uint64_t v57 = v28;
      uint64_t v56 = 0;
      unint64_t v4 = [v61 count];
      float v84 = (float)v4 / (float)v57;
      uint64_t v56 = vcvtps_s32_f32(v84);
      memset(&r1, 0, sizeof(r1));
      CGRect r1 = *(CGRect *)*(void *)&MEMORY[0x263F001A0];
      memset(__b, 0, sizeof(__b));
      id obj = v61;
      uint64_t v30 = [obj countByEnumeratingWithState:__b objects:v85 count:16];
      if (v30)
      {
        uint64_t v24 = *(void *)__b[2];
        uint64_t v25 = 0;
        unint64_t v26 = v30;
        while (1)
        {
          uint64_t v23 = v25;
          if (*(void *)__b[2] != v24) {
            objc_enumerationMutation(obj);
          }
          id v54 = *(id *)(__b[1] + 8 * v25);
          char v51 = 0;
          objc_opt_class();
          id v22 = (id)[v54 safeValueForKey:@"view"];
          id v50 = (id)__UIAccessibilityCastAsClass();

          if (v51) {
            abort();
          }
          id v49 = v50;
          objc_storeStrong(&v50, 0);
          id v52 = v49;
          [v49 frame];
          r2.origin.x = v5;
          r2.origin.y = v6;
          r2.size.width = v7;
          r2.size.height = v8;
          CGRect v48 = CGRectUnion(r1, r2);
          CGRect r1 = v48;
          objc_storeStrong(&v52, 0);
          ++v25;
          if (v23 + 1 >= v26)
          {
            uint64_t v25 = 0;
            unint64_t v26 = [obj countByEnumeratingWithState:__b objects:v85 count:16];
            if (!v26) {
              break;
            }
          }
        }
      }

      id v18 = v81;
      id v21 = (id)[v61 firstObject];
      id v20 = (id)[v21 safeValueForKey:@"view"];
      id v19 = (id)[v20 superview];
      [(UITabBarCustomizeViewAccessibility *)v18 convertPoint:v82.x toView:v82.y];
      double v45 = v9;
      double v46 = v10;

      double v46 = v46 - r1.origin.y;
      double v44 = v45 - r1.origin.x;
      double v43 = r1.size.width - 1.0;
      if (v45 - r1.origin.x >= r1.size.width - 1.0) {
        double v17 = v43;
      }
      else {
        double v17 = v44;
      }
      double v42 = v17;
      double v45 = v17;
      double v41 = v17;
      int v40 = 0;
      if (v17 >= (double)0) {
        double v16 = v41;
      }
      else {
        double v16 = (double)v40;
      }
      double v39 = v16;
      double v45 = v16;
      r1.size.width = r1.size.width / (double)v57;
      r1.size.height = r1.size.height / (double)v56;
      double v15 = (double)v57;
      double v14 = CGFloor(v46 / r1.size.height);
      int v38 = (int)(CGFloor(v16 / r1.size.width) + v15 * v14);
      char v35 = 0;
      if (v38 < 0 || v38 >= (int)[v61 count])
      {
        id v11 = 0;
      }
      else
      {
        id v36 = (id)[v61 objectAtIndex:v38];
        char v35 = 1;
        id v11 = v36;
      }
      id v37 = v11;
      if (v35) {

      }
      id v34 = (id)[v37 safeValueForKey:@"view"];
      if (v34) {
        objc_storeStrong(&v68, v34);
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v61, 0);
    }
    id v83 = v68;
    int v69 = 1;
    objc_storeStrong(&v68, 0);
  }
  objc_storeStrong(location, 0);
  id v12 = v83;

  return v12;
}

BOOL __70__UITabBarCustomizeViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  id v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_2;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_37);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
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
      CGFloat v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      unint64_t v4 = v8;
      double v10 = v4;
      uint64_t v2 = (objc_class *)objc_opt_class();
      CGFloat v7 = NSStringFromClass(v2);
      double v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_2;
}

void __70__UITabBarCustomizeViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_2 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      CGFloat v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v3 = v7;
      double v9 = v3;
      uint64_t v2 = (objc_class *)objc_opt_class();
      CGFloat v6 = NSStringFromClass(v2);
      CGFloat v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

@end