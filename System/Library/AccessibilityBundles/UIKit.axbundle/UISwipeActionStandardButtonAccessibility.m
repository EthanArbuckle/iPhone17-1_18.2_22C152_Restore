@interface UISwipeActionStandardButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation UISwipeActionStandardButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISwipeActionStandardButton";
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
  [location[0] validateClass:@"UISwipeActionStandardButton" hasInstanceVariable:@"_buttonWidth" withType:"d"];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v29 = a3;
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v26 = [(UISwipeActionStandardButtonAccessibility *)v28 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v19 = 0;
  char v12 = 0;
  if (!v26)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    int v21 = -1073741824;
    int v22 = 0;
    v23 = __76__UISwipeActionStandardButtonAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v24 = &unk_2650AE580;
    v25 = v28;
    char v19 = 1;
    v18 = (id *)&v25;
    char v12 = ((uint64_t (*)(void))__76__UISwipeActionStandardButtonAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v12)
  {
    -[UISwipeActionStandardButtonAccessibility _accessibilitySetBoolValue:forKey:](v28, "_accessibilitySetBoolValue:forKey:", 1);
    id v17 = (id)-[UISwipeActionStandardButtonAccessibility accessibilityHitTest:withEvent:](v28, "accessibilityHitTest:withEvent:", location[0], v29.x, v29.y);
    [(UISwipeActionStandardButtonAccessibility *)v28 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    v30 = (UISwipeActionStandardButtonAccessibility *)v17;
    int v16 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    int v16 = 0;
  }
  if (v19) {
    objc_storeStrong(v18, 0);
  }
  if (!v16)
  {
    [(UISwipeActionStandardButtonAccessibility *)v28 accessibilityFrame];
    rect.origin.x = v4;
    rect.origin.y = v5;
    rect.size.width = v6;
    rect.size.height = v7;
    UIAccessibilityPointForPoint();
    point.x = v8;
    point.y = v9;
    if (CGRectContainsPoint(rect, point))
    {
      v30 = v28;
    }
    else
    {
      v13.receiver = v28;
      v13.super_class = (Class)UISwipeActionStandardButtonAccessibility;
      v30 = (UISwipeActionStandardButtonAccessibility *)-[UISwipeActionStandardButtonAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, location[0], v29.x, v29.y);
    }
    int v16 = 1;
  }
  objc_storeStrong(location, 0);
  v10 = v30;

  return v10;
}

BOOL __76__UISwipeActionStandardButtonAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  v18 = (dispatch_once_t *)&MACancelDownloadErrorDomain_block_invoke_onceToken_1;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_34);
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
      CGFloat v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      CGFloat v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      CGFloat v7 = NSStringFromClass(v2);
      CGFloat v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)MACancelDownloadErrorDomain_block_invoke_BaseImplementation_1;
}

void __76__UISwipeActionStandardButtonAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    MACancelDownloadErrorDomain_block_invoke_BaseImplementation_1 = (uint64_t)method_getImplementation(InstanceMethod);
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
      v3 = v7;
      CGFloat v9 = v3;
      v2 = (objc_class *)objc_opt_class();
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

- (CGRect)accessibilityFrame
{
  [(UISwipeActionStandardButtonAccessibility *)self bounds];
  rect.origin.x = v2;
  rect.origin.y = v3;
  rect.size.height = v4;
  [(UISwipeActionStandardButtonAccessibility *)self safeCGFloatForKey:@"_buttonWidth"];
  rect.size.width = v5;
  return UIAccessibilityConvertFrameToScreenCoordinates(rect, (UIView *)self);
}

@end