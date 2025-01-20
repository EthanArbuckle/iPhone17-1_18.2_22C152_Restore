@interface UIPasscodeFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityChildren;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_accessibilitySetValue:(id)a3;
- (void)setShowsOKButton:(BOOL)a3;
@end

@implementation UIPasscodeFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPasscodeField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setShowsOKButton:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UIPasscodeFieldAccessibility;
  [(UIPasscodeFieldAccessibility *)&v3 setShowsOKButton:a3];
  [(UIPasscodeFieldAccessibility *)v6 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_accessibilityChildren
{
  id v18 = a1;
  if (a1)
  {
    id v17 = (id)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    objc_initWeak(&location, v18);
    id v15 = (id)[v18 _accessibilityValueForKey:@"TextElement"];
    if (!v15)
    {
      id v8 = objc_alloc(MEMORY[0x263F1C3A8]);
      v7 = (void *)[v8 initWithAccessibilityContainer:v18];
      id v15 = v7;

      [v18 _accessibilitySetRetainedValue:v7 forKey:@"TextElement"];
      [v7 setAccessibilityDelegate:v18];
      uint64_t v9 = MEMORY[0x263EF8330];
      int v10 = -1073741824;
      int v11 = 0;
      v12 = __54__UIPasscodeFieldAccessibility__accessibilityChildren__block_invoke;
      v13 = &unk_2650AE230;
      objc_copyWeak(&v14, &location);
      [v7 _setAccessibilityFrameBlock:&v9];
      [v15 setAccessibilityTraits:*MEMORY[0x263F813D8] | *MEMORY[0x263F81408] | *MEMORY[0x263F81398]];
      objc_destroyWeak(&v14);
    }
    [v17 addObject:v15];
    id v5 = (id)[v18 safeValueForKey:@"showsOKButton"];
    char v6 = [v5 BOOLValue];

    if (v6)
    {
      id v4 = v17;
      id v3 = (id)[v18 safeValueForKey:@"_okButton"];
      objc_msgSend(v4, "axSafelyAddObject:");
    }
    id v19 = v17;
    objc_storeStrong(&v15, 0);
    objc_destroyWeak(&location);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v19 = 0;
  }
  v1 = v19;

  return v1;
}

double __54__UIPasscodeFieldAccessibility__accessibilityChildren__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v4 = v1;

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v28 = a3;
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v25 = [(UIPasscodeFieldAccessibility *)v27 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v18 = 0;
  char v9 = 0;
  if (!v25)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    v22 = __64__UIPasscodeFieldAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v23 = &unk_2650AE580;
    v24 = v27;
    char v18 = 1;
    id v17 = (id *)&v24;
    char v9 = ((uint64_t (*)(void))__64__UIPasscodeFieldAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v9)
  {
    -[UIPasscodeFieldAccessibility _accessibilitySetBoolValue:forKey:](v27, "_accessibilitySetBoolValue:forKey:", 1);
    id v16 = (id)-[UIPasscodeFieldAccessibility accessibilityHitTest:withEvent:](v27, "accessibilityHitTest:withEvent:", location[0], v28.x, v28.y);
    [(UIPasscodeFieldAccessibility *)v27 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v29 = v16;
    int v15 = 1;
    objc_storeStrong(&v16, 0);
  }
  else
  {
    int v15 = 0;
  }
  if (v18) {
    objc_storeStrong(v17, 0);
  }
  if (!v15)
  {
    id v8 = (id)[(UIPasscodeFieldAccessibility *)v27 _accessibilityParentView];
    UIAccessibilityPointForPoint();
    point.x = v4;
    point.y = v5;

    id v13 = -[UIPasscodeFieldAccessibility _accessibilityChildren](v27);
    if ([v13 count] != 2
      || ((id v12 = (id)[v13 objectAtIndex:1],
           [v12 accessibilityFrame],
           CGRect rect = v31,
           !CGRectContainsPoint(v31, point))
        ? (int v15 = 0)
        : (v29 = v12, int v15 = 1),
          objc_storeStrong(&v12, 0),
          !v15))
    {
      v10.receiver = v27;
      v10.super_class = (Class)UIPasscodeFieldAccessibility;
      id v29 = -[UIPasscodeFieldAccessibility _accessibilityHitTest:withEvent:](&v10, sel__accessibilityHitTest_withEvent_, location[0], v28.x, v28.y, v8);
      int v15 = 1;
    }
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(location, 0);
  char v6 = v29;

  return v6;
}

BOOL __64__UIPasscodeFieldAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  char v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_1;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_28);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
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
      id v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      CGFloat v4 = v8;
      objc_super v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      char v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_1;
}

void __64__UIPasscodeFieldAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_1 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v3 = v7;
      char v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      id v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)accessibilityElements
{
  return -[UIPasscodeFieldAccessibility _accessibilityChildren](self);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilitySetValue:(id)a3
{
  CGFloat v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIPasscodeFieldAccessibility *)v4 setStringValue:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v17 = self;
  SEL v16 = a2;
  id v6 = (id)[(UIPasscodeFieldAccessibility *)self safeValueForKey:@"numberOfEntryFields"];
  uint64_t v7 = [v6 integerValue];

  uint64_t v15 = v7;
  id v8 = (id)[(UIPasscodeFieldAccessibility *)v17 safeValueForKey:@"stringValue"];
  char v12 = 0;
  char v10 = 0;
  if ([v8 length])
  {
    id v13 = accessibilityLocalizedString(@"secure.password.field");
    char v12 = 1;
    id v2 = v13;
  }
  else
  {
    id v11 = accessibilityLocalizedString(@"secure.password.field.empty");
    char v10 = 1;
    id v2 = v11;
  }
  id v14 = v2;
  if (v10) {

  }
  if (v12) {
  id v9 = accessibilityLocalizedString(@"secure.password.field.numchars.required");
  }
  id v4 = (id)objc_msgSend(NSString, "localizedStringWithFormat:", v9, v15);
  id v5 = (id)__UIAXStringForVariables();

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v14, 0);

  return v5;
}

- (id)accessibilityValue
{
  return (id)[(UIPasscodeFieldAccessibility *)self safeValueForKey:@"stringValue", a2, self];
}

@end