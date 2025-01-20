@interface UIPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsUserInteractionEnabled;
- (BOOL)_accessibilityRetainsFocusOnScreenChange;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityPath;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (int64_t)_accessibilityPageCount;
- (int64_t)_accessibilityPageIndex;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOption;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setCurrentPage:(int64_t)a3;
@end

@implementation UIPageControlAccessibility

- (void)setCurrentPage:(int64_t)a3
{
  v9 = self;
  SEL v8 = a2;
  int64_t v7 = a3;
  id v3 = (id)[(UIPageControlAccessibility *)self safeValueForKey:@"currentPage"];
  uint64_t v4 = [v3 integerValue];

  uint64_t v6 = v4;
  v5.receiver = v9;
  v5.super_class = (Class)UIPageControlAccessibility;
  [(UIPageControlAccessibility *)&v5 setCurrentPage:v7];
  if (v7 != v6) {
    [(UIPageControlAccessibility *)v9 _accessibilityCurrentPageDidChange];
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"UIPageControl";
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
  uint64_t v6 = @"UIPageControl";
  id v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  uint64_t v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_updateCurrentPageDisplayWithForceUpdate:", v3, "B", 0);
  objc_super v5 = @"UIControl";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v6 isKindOfClass:v5];
  [location[0] validateClass:v6 hasInstanceVariable:@"_visualProvider" withType:"_UIPageControlVisualProvider"];
  int64_t v7 = @"_UIInteractivePageControlVisualProvider";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"contentView", "@", 0);
  objc_storeStrong(v9, v8);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68] | *MEMORY[0x263F1CED8];
}

- (int64_t)_accessibilityPageCount
{
  id v3 = (id)[(UIPageControlAccessibility *)self safeValueForKey:@"numberOfPages"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)_accessibilityPageIndex
{
  id v3 = (id)[(UIPageControlAccessibility *)self safeValueForKey:@"currentPage"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (CGRect)accessibilityFrame
{
  id v6 = (id)[(UIPageControlAccessibility *)self safeValueForKey:@"bounds"];
  [v6 rectValue];

  UIAccessibilityFrameForBounds();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)accessibilityPath
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[(UIPageControlAccessibility *)self safeValueForKey:@"_visualProvider"];
  NSClassFromString(&cfstr_Uiinteractivep.isa);
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id)[v8[0] safeUIViewForKey:@"contentView"];
    [v7 accessibilityFrame];
    CGRect rect = v12;
    id v10 = (id)objc_msgSend(MEMORY[0x263F1C478], "_bezierPathWithArcRoundedRect:cornerRadius:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height, CGRectGetHeight(v12) / 2.0);
    int v5 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v4.receiver = v9;
    v4.super_class = (Class)UIPageControlAccessibility;
    id v10 = [(UIPageControlAccessibility *)&v4 accessibilityPath];
    int v5 = 1;
  }
  objc_storeStrong(v8, 0);
  double v2 = v10;

  return v2;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v23 = a3;
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v20 = [(UIPageControlAccessibility *)v22 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v13 = 0;
  char v8 = 0;
  if (!v20)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    v17 = __62__UIPageControlAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v18 = &unk_2650AE580;
    v19 = v22;
    char v13 = 1;
    CGRect v12 = (id *)&v19;
    char v8 = ((uint64_t (*)(void))__62__UIPageControlAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v8)
  {
    -[UIPageControlAccessibility _accessibilitySetBoolValue:forKey:](v22, "_accessibilitySetBoolValue:forKey:", 1);
    id v11 = (id)-[UIPageControlAccessibility accessibilityHitTest:withEvent:](v22, "accessibilityHitTest:withEvent:", location[0], v23.x, v23.y);
    [(UIPageControlAccessibility *)v22 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    v24 = (UIPageControlAccessibility *)v11;
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
    UIAccessibilityPointForPoint();
    point.x = v4;
    point.y = v5;
    if ([(UIPageControlAccessibility *)v22 isAccessibilityElement]
      && ([(UIPageControlAccessibility *)v22 accessibilityFrame], CGRectContainsPoint(v26, point)))
    {
      v24 = v22;
    }
    else
    {
      v24 = 0;
    }
  }
  objc_storeStrong(location, 0);
  id v6 = v24;

  return v6;
}

BOOL __62__UIPageControlAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_27);
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
      char v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      CGFloat v4 = v8;
      int v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_0;
}

void __62__UIPageControlAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_0 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      id v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      double v3 = v7;
      v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v2);
      char v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 34;
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UIPageControlAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v8 = v2 == 0;

  if (v8)
  {
    id v5 = (id)[(UIPageControlAccessibility *)self safeValueForKey:@"numberOfPages"];
    BOOL v6 = [v5 integerValue] >= 1;

    if (v6)
    {
      id v4 = (id)[(UIPageControlAccessibility *)self safeValueForKey:@"hidden"];
      BOOL v10 = ([v4 BOOLValue] ^ 1) & 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    id v7 = (id)[(UIPageControlAccessibility *)self isAccessibilityUserDefinedElement];
    BOOL v10 = [v7 BOOLValue] & 1;
  }
  return v10;
}

- (id)accessibilityValue
{
  v18 = self;
  v17[1] = (id)a2;
  id v2 = (id)[(UIPageControlAccessibility *)self accessibilityUserDefinedValue];
  BOOL v12 = v2 == 0;

  if (v12)
  {
    char v16 = 0;
    objc_opt_class();
    id v15 = (id)__UIAccessibilityCastAsClass();
    id v14 = v15;
    objc_storeStrong(&v15, 0);
    v17[0] = v14;
    v13[2] = (id)([v14 currentPage] + 1);
    v13[1] = (id)[v17[0] numberOfPages];
    v13[0] = (id)[v17[0] progress];
    if (v13[0])
    {
      id v11 = accessibilityLocalizedString(@"page.control.format.text.with.progress");
      id v10 = (id)AXFormatInteger();
      id v9 = (id)AXFormatInteger();
      [v13[0] currentProgress];
      id v7 = (id)AXFormatFloatWithPercentage();
      id v19 = (id)AXCFormattedString();
    }
    else
    {
      id v8 = accessibilityLocalizedString(@"page.control.format.text");
      id v5 = (id)AXFormatInteger();
      id v6 = (id)AXFormatInteger();
      id v19 = (id)AXCFormattedString();
    }
    objc_storeStrong(v13, 0);
    objc_storeStrong(v17, 0);
  }
  else
  {
    id v19 = (id)[(UIPageControlAccessibility *)v18 accessibilityUserDefinedValue];
  }
  double v3 = v19;

  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIPageControlAccessibility;
  return [(UIPageControlAccessibility *)&v3 _accessibilityIsUserInteractionEnabled];
}

- (void)accessibilityIncrement
{
  id v9 = self;
  SEL v8 = a2;
  if ([(UIPageControlAccessibility *)self _accessibilityIsUserInteractionEnabled])
  {
    id v2 = (id)[(UIPageControlAccessibility *)v9 safeValueForKey:@"currentPage"];
    uint64_t v3 = [v2 integerValue] + 1;

    id v7 = (void *)v3;
    id v4 = (id)[(UIPageControlAccessibility *)v9 safeValueForKey:@"numberOfPages"];
    id v5 = (void *)[v4 integerValue];

    v6[2] = v5;
    if (v3 < (uint64_t)v5)
    {
      v6[0] = v9;
      v6[1] = v7;
      AXPerformSafeBlock();
      objc_storeStrong(v6, 0);
    }
  }
}

void __52__UIPageControlAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) safeBoolForKey:@"defersCurrentPageDisplay"] & 1) == 0) {
    [*(id *)(a1 + 32) _updateCurrentPageDisplayWithForceUpdate:1];
  }
  [*(id *)(a1 + 32) sendActionsForControlEvents:4096];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)accessibilityDecrement
{
  id v7 = self;
  SEL v6 = a2;
  if ([(UIPageControlAccessibility *)self _accessibilityIsUserInteractionEnabled])
  {
    id v2 = (id)[(UIPageControlAccessibility *)v7 safeValueForKey:@"currentPage"];
    uint64_t v3 = [v2 integerValue] - 1;

    id v5 = (void *)v3;
    if (v3 >= 0)
    {
      v4[0] = v7;
      v4[1] = v5;
      AXPerformSafeBlock();
      objc_storeStrong(v4, 0);
    }
  }
}

void __52__UIPageControlAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) safeBoolForKey:@"defersCurrentPageDisplay"] & 1) == 0) {
    [*(id *)(a1 + 32) _updateCurrentPageDisplayWithForceUpdate:1];
  }
  [*(id *)(a1 + 32) sendActionsForControlEvents:4096];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)_accessibilityRetainsFocusOnScreenChange
{
  return 1;
}

- (id)accessibilityUserInputLabels
{
  BOOL v12 = self;
  v11[1] = (id)a2;
  v10.receiver = self;
  v10.super_class = (Class)UIPageControlAccessibility;
  v11[0] = [(UIPageControlAccessibility *)&v10 accessibilityUserInputLabels];
  if (![v11[0] count])
  {
    id v9 = (id)[(UIPageControlAccessibility *)v12 accessibilityLabel];
    id v2 = (id)MEMORY[0x2455E6530]();
    id v3 = v11[0];
    v11[0] = v2;

    if (![v11[0] count])
    {
      id v8 = accessibilityLocalizedString(@"page.control.text");
      id v4 = (id)MEMORY[0x2455E6530]();
      id v5 = v11[0];
      v11[0] = v4;
    }
  }
  id v7 = v11[0];
  objc_storeStrong(v11, 0);

  return v7;
}

- (BOOL)canBecomeFocused
{
  SEL v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPageControlAccessibility;
  char v4 = [(UIPageControlAccessibility *)&v3 canBecomeFocused];
  if ([(UIPageControlAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])char v4 = 1; {
  return v4 & 1;
  }
}

@end