@interface UISwitchAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsAccessibleViaTableViewCell;
- (BOOL)_accessibilityIsMacVisualAppearance;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityKeyCommands;
- (id)_viewToAddFocusLayer;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetIsAccessibleViaTableViewCell:(BOOL)a3;
- (void)_fkaSwitchOff;
- (void)_fkaSwitchOn;
- (void)_keyboardActivate;
- (void)setEnabled:(BOOL)a3;
@end

@implementation UISwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISwitch";
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
  [location[0] validateClass:@"UISwitchVisualElement" isKindOfClass:@"UIView"];
  [location[0] validateClass:@"UISwitch" hasProperty:@"visualElement" withType:"@"];
  [location[0] validateClass:@"UISwitchModernVisualElement" hasInstanceVariable:@"_knobView" withType:"UIImageView"];
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsAccessibleViaTableViewCell
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_accessibilitySetIsAccessibleViaTableViewCell:(BOOL)a3
{
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  v5 = (dispatch_once_t *)&_accessibilitySupportsActivateAction_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_35);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (objc_class *)objc_opt_class();
  return class_getInstanceMethod(v2, sel_accessibilityActivate) != (Method)_accessibilitySupportsActivateAction_BaseActivate;
}

Method __61__UISwitchAccessibility__accessibilitySupportsActivateAction__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v0, sel_accessibilityActivate);
  _accessibilitySupportsActivateAction_BaseActivate = (uint64_t)result;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  v37 = self;
  v36[1] = (id)a2;
  v36[0] = (id)[(UISwitchAccessibility *)self safeUIViewForKey:@"visualElement"];
  if ([(UISwitchAccessibility *)v37 _accessibilityIsMacVisualAppearance])
  {
    char v34 = 0;
    id v33 = (id)__UIAccessibilitySafeClass();
    id v32 = v33;
    objc_storeStrong(&v33, 0);
    id v15 = v32;
    id v16 = (id)[v32 safeValueForKeyPath:@"_macCheckbox.cell"];
    char v27 = 0;
    char v25 = 0;
    if (v16)
    {
      id v2 = v16;
    }
    else
    {
      char v31 = 0;
      id v30 = (id)__UIAccessibilitySafeClass();
      id v29 = v30;
      objc_storeStrong(&v30, 0);
      id v28 = v29;
      char v27 = 1;
      id v26 = (id)[v29 safeValueForKeyPath:@"_macSwitch.cell"];
      char v25 = 1;
      id v2 = v26;
    }
    id v35 = v2;
    if (v25) {

    }
    if (v27) {
    char v23 = 0;
    }
    objc_opt_class();
    id v14 = (id)[v35 safeValueForKey:@"accessibilityActivationPointAttribute"];
    id v22 = (id)__UIAccessibilityCastAsClass();

    id v21 = v22;
    objc_storeStrong(&v22, 0);
    id v24 = v21;
    if (v21)
    {
      [v24 pointValue];
      uint64_t v19 = v3;
      uint64_t v20 = v4;
      UIAccessibilityPointForPoint();
      double v38 = v5;
      double v39 = v6;
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
    }
    id obj = 0;
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v35, 0);
    if (!v18) {
      goto LABEL_16;
    }
  }
  else
  {
    if (!v36[0])
    {
LABEL_16:
      v17.receiver = v37;
      v17.super_class = (Class)UISwitchAccessibility;
      [(UISwitchAccessibility *)&v17 accessibilityActivationPoint];
      double v38 = v9;
      double v39 = v10;
      int v18 = 1;
      goto LABEL_17;
    }
    [v36[0] accessibilityActivationPoint];
    double v38 = v7;
    double v39 = v8;
    int v18 = 1;
  }
LABEL_17:
  objc_storeStrong(v36, 0);
  double v11 = v38;
  double v12 = v39;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  id v3 = (id)-[UISwitchAccessibility safeValueForKey:](self, "safeValueForKey:");
  char v4 = [v3 BOOLValue];

  char v10 = v4 & 1;
  v9.receiver = v13;
  v9.super_class = (Class)UISwitchAccessibility;
  [(UISwitchAccessibility *)&v9 setEnabled:v11];
  id v5 = (id)[(UISwitchAccessibility *)v13 safeValueForKey:@"isEnabled"];
  char v6 = [v5 BOOLValue];

  char v8 = v6 & 1;
  id location = (id)[(UISwitchAccessibility *)v13 safeValueForKey:@"superview"];
  if ((v10 & 1) != (v6 & 1))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [location _accessibilityRemoveValueForKey:@"AXInternalData"];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v20 = a3;
  uint64_t v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v17 = [(UISwitchAccessibility *)v19 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v10 = 0;
  char v6 = 0;
  if (!v17)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = __57__UISwitchAccessibility__accessibilityHitTest_withEvent___block_invoke;
    id v15 = &unk_2650AE580;
    id v16 = v19;
    char v10 = 1;
    objc_super v9 = (id *)&v16;
    char v6 = ((uint64_t (*)(void))__57__UISwitchAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v6)
  {
    -[UISwitchAccessibility _accessibilitySetBoolValue:forKey:](v19, "_accessibilitySetBoolValue:forKey:", 1);
    id v8 = (id)-[UISwitchAccessibility accessibilityHitTest:withEvent:](v19, "accessibilityHitTest:withEvent:", location[0], v20.x, v20.y);
    [(UISwitchAccessibility *)v19 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v21 = (UISwitchAccessibility *)v8;
    int v7 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    int v7 = 0;
  }
  if (v10) {
    objc_storeStrong(v9, 0);
  }
  if (!v7)
  {
    if ([(UISwitchAccessibility *)v19 isAccessibilityElement]
      && ([(UISwitchAccessibility *)v19 accessibilityElementsHidden] & 1) == 0)
    {
      if (-[UISwitchAccessibility _accessibilityPointInside:withEvent:](v19, "_accessibilityPointInside:withEvent:", location[0], v20.x, v20.y))id v21 = v19; {
      else
      }
        id v21 = 0;
    }
    else
    {
      id v21 = 0;
    }
  }
  objc_storeStrong(location, 0);
  char v4 = v21;

  return v4;
}

BOOL __57__UISwitchAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  int v18 = (dispatch_once_t *)&MACancelDownloadErrorDomain_block_invoke_onceToken_2;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_325_0);
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
      id v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      char v4 = v8;
      char v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      int v7 = NSStringFromClass(v2);
      objc_super v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)MACancelDownloadErrorDomain_block_invoke_BaseImplementation_2;
}

void __57__UISwitchAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    MACancelDownloadErrorDomain_block_invoke_BaseImplementation_2 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      int v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v3 = v7;
      objc_super v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
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

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UISwitchAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 1;
  }
  id v4 = (id)[(UISwitchAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (id)accessibilityLabel
{
  uint64_t v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)[(UISwitchAccessibility *)self accessibilityUserDefinedLabel];
  if (v15[0])
  {
    char v17 = (__CFString *)v15[0];
    int v14 = 1;
  }
  else
  {
    char v12 = 0;
    objc_opt_class();
    id v11 = (id)__UIAccessibilityCastAsClass();
    id v10 = v11;
    objc_storeStrong(&v11, 0);
    id v13 = v10;
    id v4 = (id)[v10 title];
    BOOL v5 = [v4 length] != 0;

    BOOL v9 = v5;
    BOOL v8 = [v13 preferredStyle] == 1;
    if (v5 && v8)
    {
      char v17 = (__CFString *)(id)[v13 title];
      int v14 = 1;
    }
    else if ([(UISwitchAccessibility *)v16 _accessibilityBoolValueForKey:@"AXIsInRetrieval"] & 1)
    {
      char v17 = @"--";
      int v14 = 1;
    }
    else
    {
      -[UISwitchAccessibility _accessibilitySetBoolValue:forKey:](v16, "_accessibilitySetBoolValue:forKey:", 1);
      id v6 = -[UIViewAccessibility _accessibilityRetrieveLabelFromTableViewCell](v16);
      [(UISwitchAccessibility *)v16 _accessibilitySetBoolValue:0 forKey:@"AXIsInRetrieval"];
      char v17 = (__CFString *)v6;
      int v14 = 1;
      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v15, 0);
  id v2 = v17;

  return v2;
}

- (id)accessibilityValue
{
  if ([(UISwitchAccessibility *)self safeBoolForKey:@"isOn", a2, self]) {
    id v2 = @"1";
  }
  else {
    id v2 = @"0";
  }

  return v2;
}

- (unint64_t)_accessibilityAutomationType
{
  return 40;
}

- (unint64_t)accessibilityTraits
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UISwitchAccessibility *)self accessibilityUserDefinedTraits];
  if (location[0])
  {
    unint64_t v9 = [location[0] unsignedLongLongValue];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F1CEE8];
    id v3 = (id)[(UISwitchAccessibility *)v8 safeValueForKey:@"isEnabled"];
    char v4 = [v3 BOOLValue];

    if ((v4 & 1) == 0) {
      v5 |= *MEMORY[0x263F1CF20];
    }
    unint64_t v6 = v5 | *MEMORY[0x263F1CF60];
    if ([(UISwitchAccessibility *)v8 _accessibilityIsAccessibleViaTableViewCell])
    {
      v6 |= *MEMORY[0x263F813E8];
    }
    unint64_t v9 = v6;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)_accessibilityKeyCommands
{
  v13[2] = *MEMORY[0x263EF8340];
  id v10 = (void *)MEMORY[0x263F1C708];
  uint64_t v11 = *MEMORY[0x263F1D3E0];
  if ([(UISwitchAccessibility *)self _accessibilityIsRTL]) {
    unint64_t v9 = sel__fkaSwitchOff;
  }
  else {
    unint64_t v9 = sel__fkaSwitchOn;
  }
  id v6 = (id)[v10 keyCommandWithInput:v11 modifierFlags:0 action:v9];
  v13[0] = v6;
  BOOL v7 = (void *)MEMORY[0x263F1C708];
  uint64_t v8 = *MEMORY[0x263F1D3D8];
  if ([(UISwitchAccessibility *)self _accessibilityIsRTL]) {
    uint64_t v5 = sel__fkaSwitchOn;
  }
  else {
    uint64_t v5 = sel__fkaSwitchOff;
  }
  id v3 = (id)[v7 keyCommandWithInput:v8 modifierFlags:0 action:v5];
  v13[1] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v4;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (void)_fkaSwitchOn
{
  if (([(UISwitchAccessibility *)self safeBoolForKey:@"isOn"] & 1) == 0) {
    [(UISwitchAccessibility *)self _keyboardActivate];
  }
}

- (void)_fkaSwitchOff
{
  if ([(UISwitchAccessibility *)self safeBoolForKey:@"isOn"]) {
    [(UISwitchAccessibility *)self _keyboardActivate];
  }
}

- (void)_keyboardActivate
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  uint64_t v5 = __42__UISwitchAccessibility__keyboardActivate__block_invoke;
  id v6 = &unk_2650ADF18;
  v7[0] = self;
  AXPerformSafeBlock();
  _UIAccessibilitySetAssociatedElementContextForNextNotification();
  UIAccessibilityPostNotification(*MEMORY[0x263F81438], MEMORY[0x263EFFA78]);
  objc_storeStrong(v7, 0);
}

id __42__UISwitchAccessibility__keyboardActivate__block_invoke(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UISwitchAccessibility;
  return objc_msgSendSuper2(&v2, sel__keyboardActivate);
}

- (id)accessibilityPath
{
  double v39 = (UIView *)self;
  SEL v38 = a2;
  uint64_t v37 = AXRequestingClient();
  if (v37 == 3 || v37 == 4)
  {
    v40 = 0;
  }
  else if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    id v20 = (id)[(UIView *)v39 safeUIViewForKey:@"visualElement"];
    id v36 = (id)[v20 safeUIViewForKey:@"_knobView"];

    id v21 = v36;
    [v36 bounds];
    double v28 = v2;
    double v29 = v3;
    double v30 = v4;
    double v31 = v5;
    objc_msgSend(v21, "convertRect:toView:", v39, v2, v3, v4, v5);
    uint64_t v32 = v6;
    uint64_t v34 = v7;
    uint64_t v35 = v8;
    double v33 = v9 - 3.0;
    CGRectMake_3();
    AX_CGRectGetCenter();
    path[2] = v10;
    path[3] = v11;
    UIRectCenteredAboutPoint();
    *(void *)&long long v24 = v12;
    *((void *)&v24 + 1) = v13;
    *(void *)&long long v25 = v14;
    *((void *)&v25 + 1) = v15;
    long long v26 = v24;
    long long v27 = v25;
    path[1] = COERCE_UIBEZIERPATH_(3.0);
    id v22 = (void *)MEMORY[0x263F1C478];
    AX_CGRectGetCenter();
    path[0] = (UIBezierPath *)(id)objc_msgSend(v22, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v16, v17, *(double *)&v25 / 2.0 + 3.0, 0.0, 6.28318531);
    v40 = UIAccessibilityConvertPathToScreenCoordinates(path[0], v39);
    objc_storeStrong((id *)path, 0);
    objc_storeStrong(&v36, 0);
  }
  else
  {
    v40 = 0;
  }
  int v18 = v40;

  return v18;
}

- (id)_viewToAddFocusLayer
{
  id v3 = (id)[(UISwitchAccessibility *)self safeUIViewForKey:@"visualElement"];
  id v4 = (id)[v3 safeUIViewForKey:@"_knobView"];

  return v4;
}

@end