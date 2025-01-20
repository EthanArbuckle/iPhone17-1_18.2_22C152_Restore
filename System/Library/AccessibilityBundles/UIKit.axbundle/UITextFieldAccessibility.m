@interface UITextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAvoidsMockViewContainers;
- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille;
- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3;
- (BOOL)_axTextFieldIsHidden;
- (BOOL)fieldEditor:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5;
- (BOOL)isAccessibilityElement;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (CGPoint)accessibilityActivationPoint;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)_accessibilityAttributedTextRetrieval;
- (id)_accessibilityCapturedImages;
- (id)_accessibilityForegroundTextColorAttribute;
- (id)_accessibilityGetValue;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityLeftButtons;
- (id)_accessibilityNativeFocusPreferredElement;
- (id)_accessibilityPlaceholderValue:(void *)a1;
- (id)_accessibilityRightButtons;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityTextFieldText;
- (id)_accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:(void *)a1;
- (id)accessibilityAttributedValue;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityLabel;
- (id)accessibilityPlaceholderValue;
- (id)accessibilityValue;
- (uint64_t)_axShowsLeadingView;
- (uint64_t)_axShowsTrailingView;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_accessibilitySetValue:(id)a3;
- (void)_clearButtonClicked:(id)a3;
@end

@implementation UITextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  id v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = "@";
  v3 = "{_NSRange=QQ}";
  v8 = @"UITextField";
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "{_NSRange=QQ}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"keyboardInput: shouldInsertText: isMarkedText:", v7, v7, v4, 0);
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"keyboardInputChangedSelection:", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"selectionRange", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"setSelectionRange:", v5, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"textInputTraits", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_showsLeftView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_showsRightView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_text", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_updateButtons", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_placeholderView", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_clearButtonClicked:", v5, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"interactionAssistant", v7, 0);
  v6 = @"UITextInteractionAssistant";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"view", v7, 0);
  [location[0] validateClass:v8 isKindOfClass:@"UIView"];
  [location[0] validateProtocol:@"UITextInputAdditions" hasRequiredInstanceMethod:@"textInputView"];
  objc_storeStrong(v10, v9);
}

- (unint64_t)_accessibilityAutomationType
{
  unint64_t v2 = [(UITextFieldAccessibility *)self accessibilityTraits];
  if ((v2 & *MEMORY[0x263F813D8]) != 0) {
    return 50;
  }
  else {
    return 49;
  }
}

- (BOOL)_axTextFieldIsHidden
{
  return a1 && ([a1 accessibilityElementsHidden] & 1) != 0;
}

- (id)_accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:(void *)a1
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v41 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v41)
  {
    char v37 = 0;
    objc_opt_class();
    id v36 = (id)__UIAccessibilityCastAsClass();
    id v35 = v36;
    objc_storeStrong(&v36, 0);
    id v38 = v35;
    id v34 = 0;
    double v33 = 0.0;
    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v24 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
    if (v24)
    {
      uint64_t v20 = *(void *)__b[2];
      uint64_t v21 = 0;
      unint64_t v22 = v24;
      while (1)
      {
        uint64_t v19 = v21;
        if (*(void *)__b[2] != v20) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(id *)(__b[1] + 8 * v21);
        id v17 = v38;
        [v32 rect];
        double v26 = v2;
        double v27 = v3;
        double v28 = v4;
        double v29 = v5;
        id v18 = (id)[v38 superview];
        objc_msgSend(v17, "convertRect:toView:", v26, v27, v28, v29);
        r1.origin.x = v6;
        r1.origin.y = v7;
        r1.size.width = v8;
        r1.size.height = v9;

        [v41 frame];
        r2.origin.x = v10;
        r2.origin.y = v11;
        r2.size.width = v12;
        r2.size.height = v13;
        CGRect v46 = CGRectIntersection(r1, r2);
        double v14 = v46.size.width * v46.size.height;
        if (v46.size.width * v46.size.height > v33)
        {
          double v33 = v46.size.width * v46.size.height;
          objc_storeStrong(&v34, v32);
        }
        ++v21;
        if (v19 + 1 >= v22)
        {
          uint64_t v21 = 0;
          unint64_t v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v43, 16, v14);
          if (!v22) {
            break;
          }
        }
      }
    }

    id v42 = v34;
    int v39 = 1;
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v42 = 0;
    int v39 = 1;
  }
  objc_storeStrong(&location, 0);
  v15 = v42;

  return v15;
}

- (id)accessibilityDragSourceDescriptors
{
  v20[1] = *MEMORY[0x263EF8340];
  id v18 = self;
  v17[1] = (id)a2;
  v17[0] = (id)[(UITextFieldAccessibility *)self accessibilityUserDefinedDragSourceDescriptors];
  if (v17[0])
  {
    id v19 = v17[0];
    int v16 = 1;
  }
  else
  {
    char v14 = 0;
    objc_opt_class();
    id v13 = (id)__UIAccessibilityCastAsClass();
    id v12 = v13;
    objc_storeStrong(&v13, 0);
    id v15 = v12;
    id v11 = (id)[v12 selectedTextRange];
    if (v11 && ([v11 isEmpty] & 1) == 0)
    {
      id v10 = (id)[v15 selectionRectsForRange:v11];
      id v9 = -[UITextFieldAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v18, v10);
      if (v9)
      {
        id v6 = objc_alloc(MEMORY[0x263F1C3B8]);
        id v8 = accessibilityLocalizedString(@"drag.selection");
        [v9 rect];
        UIRectGetCenter();
        id v7 = (id)objc_msgSend(v6, "initWithName:point:inView:", v8, v15, v2, v3);
        v20[0] = v7;
        id v19 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      }
      else
      {
        id v19 = MEMORY[0x263EFFA68];
      }
      int v16 = 1;
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v10, 0);
    }
    else
    {
      id v19 = MEMORY[0x263EFFA68];
      int v16 = 1;
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(v17, 0);
  double v4 = v19;

  return v4;
}

- (id)accessibilityDropPointDescriptors
{
  v52[1] = *MEMORY[0x263EF8340];
  v48 = self;
  v47[1] = (id)a2;
  v47[0] = (id)[(UITextFieldAccessibility *)self accessibilityUserDefinedDropPointDescriptors];
  if (v47[0])
  {
    id v49 = v47[0];
    int v46 = 1;
    goto LABEL_15;
  }
  char v44 = 0;
  objc_opt_class();
  id v43 = (id)__UIAccessibilityCastAsClass();
  id v42 = v43;
  objc_storeStrong(&v43, 0);
  id v45 = v42;
  if ([v42 isEnabled])
  {
    id v41 = (id)[v45 selectedTextRange];
    if (v41)
    {
      if ([v41 isEmpty])
      {
        id v24 = v45;
        id v25 = (id)[v41 start];
        objc_msgSend(v24, "caretRectForPosition:");
        uint64_t v37 = v2;
        uint64_t v38 = v3;
        uint64_t v39 = v4;
        uint64_t v40 = v5;

        UIRectGetCenter();
        double v35 = v6;
        double v36 = v7;
        id v26 = objc_alloc(MEMORY[0x263F1C3B8]);
        id v28 = accessibilityLocalizedString(@"drop.at.point");
        id v27 = (id)objc_msgSend(v26, "initWithName:point:inView:", v35, v36);
        v52[0] = v27;
        id v49 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];

        int v46 = 1;
LABEL_13:
        objc_storeStrong(&v41, 0);
        goto LABEL_14;
      }
      id v34 = (id)[v45 selectionRectsForRange:v41];
      id v33 = -[UITextFieldAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v48, v34);
      if (v33)
      {
        id v21 = objc_alloc(MEMORY[0x263F1C3B8]);
        id v23 = accessibilityLocalizedString(@"drop.on.selection");
        [v33 rect];
        UIRectGetCenter();
        id v22 = (id)objc_msgSend(v21, "initWithName:point:inView:", v23, v45, v8, v9);
        id v51 = v22;
        id v49 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];

        int v46 = 1;
      }
      else
      {
        int v46 = 0;
      }
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      if (v46) {
        goto LABEL_13;
      }
    }
    [v45 frame];
    UIRectGetCenter();
    double v31 = v10;
    double v32 = v11;
    id v16 = v45;
    id v17 = (id)[v45 superview];
    [v16 convertPoint:v31 fromView:v32];
    double v29 = v12;
    double v30 = v13;

    id v18 = objc_alloc(MEMORY[0x263F1C3B8]);
    id v20 = accessibilityLocalizedString(@"drop.into.text");
    id v19 = (id)objc_msgSend(v18, "initWithName:point:inView:", v29, v30);
    id v50 = v19;
    id v49 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];

    int v46 = 1;
    goto LABEL_13;
  }
  id v49 = MEMORY[0x263EFFA68];
  int v46 = 1;
LABEL_14:
  objc_storeStrong(&v45, 0);
LABEL_15:
  objc_storeStrong(v47, 0);
  char v14 = v49;

  return v14;
}

- (CGPoint)accessibilityActivationPoint
{
  double v36 = self;
  v35[1] = (id)a2;
  id v23 = (id)[(UITextFieldAccessibility *)self safeValueForKey:@"isEditing"];
  char v24 = [v23 BOOLValue];

  if (v24)
  {
    v35[0] = (id)[(UITextFieldAccessibility *)v36 safeValueForKey:@"interactionAssistant"];
    id v34 = (id)[v35[0] safeUIViewForKey:@"_selectionView"];
    id v20 = (id)[v35[0] safeValueForKey:@"view"];
    id v33 = (id)[v20 safeUIViewForKey:@"textInputView"];

    id v22 = (id)[v34 safeValueForKey:@"selection"];
    id v21 = (id)[v22 safeValueForKey:@"caretRect"];
    [v21 rectValue];
    *(void *)&long long v31 = v2;
    *((void *)&v31 + 1) = v3;
    *(void *)&long long v32 = v4;
    *((void *)&v32 + 1) = v5;

    objc_msgSend(v34, "convertRect:fromView:", v33, v31, v32);
    uint64_t v27 = v6;
    uint64_t v28 = v7;
    uint64_t v29 = v8;
    uint64_t v30 = v9;
    UIAccessibilityFrameForBounds();
    v26.origin.x = v10;
    v26.origin.y = v11;
    v26.size.width = v12;
    v26.size.height = v13;
    CGRectGetMidX(v26);
    CGRectGetMidY(v26);
    CGPointMake_9();
    double v37 = v14;
    double v38 = v15;
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(v35, 0);
  }
  else
  {
    v25.receiver = v36;
    v25.super_class = (Class)UITextFieldAccessibility;
    [(UITextFieldAccessibility *)&v25 accessibilityActivationPoint];
    double v37 = v16;
    double v38 = v17;
  }
  double v18 = v37;
  double v19 = v38;
  result.y = v19;
  result.x = v18;
  return result;
}

- (uint64_t)_axShowsLeadingView
{
  if (a1)
  {
    if ([a1 _shouldReverseLayoutDirection]) {
      char v2 = [a1 safeBoolForKey:@"_showsRightView"] & 1;
    }
    else {
      char v2 = [a1 safeBoolForKey:@"_showsLeftView"] & 1;
    }
    char v4 = v2;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_axShowsTrailingView
{
  if (a1)
  {
    if ([a1 _shouldReverseLayoutDirection]) {
      char v2 = [a1 safeBoolForKey:@"_showsLeftView"] & 1;
    }
    else {
      char v2 = [a1 safeBoolForKey:@"_showsRightView"] & 1;
    }
    char v4 = v2;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)_accessibilityLeftButtons
{
  double v14 = a1;
  if (a1)
  {
    id v13 = (id)[MEMORY[0x263EFF980] array];
    if (-[UITextFieldAccessibility _axShowsLeadingView](v14))
    {
      id v12 = (id)[v14 leftView];
      if ([v12 isAccessibilityElement])
      {
        [v13 addObject:v12];
      }
      else if (([v12 accessibilityElementsHidden] & 1) == 0)
      {
        id v3 = (id)[MEMORY[0x263F81198] options];
        id v11 = (id)objc_msgSend(v12, "_accessibilityLeafDescendantsWithOptions:");

        id v4 = v11;
        uint64_t v5 = MEMORY[0x263EF8330];
        int v6 = -1073741824;
        int v7 = 0;
        uint64_t v8 = __53__UITextFieldAccessibility__accessibilityLeftButtons__block_invoke;
        uint64_t v9 = &unk_2650AE910;
        id v10 = v14;
        [v4 enumerateObjectsUsingBlock:&v5];
        [v13 axSafelyAddObjectsFromArray:v11];
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v11, 0);
      }
      objc_storeStrong(&v12, 0);
    }
    id v15 = v13;
    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v15 = 0;
  }
  v1 = v15;

  return v1;
}

void __53__UITextFieldAccessibility__accessibilityLeftButtons__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setAccessibilityContainer:a1[4]];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityRightButtons
{
  id v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)[MEMORY[0x263EFF980] array];
  id v20 = (id)[(UITextFieldAccessibility *)v22 safeValueForKey:@"_clearButton"];
  char v18 = 0;
  BOOL v7 = 0;
  if (v20)
  {
    id v19 = (id)[v20 superview];
    char v18 = 1;
    BOOL v7 = v19 != 0;
  }
  if (v18) {

  }
  if (v7)
  {
    [v20 accessibilitySetIdentification:@"UIClearButton"];
    [v21[0] addObject:v20];
  }
  char v15 = 0;
  if (-[UITextFieldAccessibility _axShowsTrailingView](v22))
  {
    id v16 = (id)[(UITextFieldAccessibility *)v22 rightView];
    char v15 = 1;
    id v2 = v16;
  }
  else
  {
    id v2 = 0;
  }
  id v17 = v2;
  if (v15) {

  }
  if (v20 != v17)
  {
    if ([v17 isAccessibilityElement])
    {
      [v21[0] addObject:v17];
    }
    else if (([v17 accessibilityElementsHidden] & 1) == 0)
    {
      id v5 = (id)[MEMORY[0x263F81198] options];
      id v14 = (id)objc_msgSend(v17, "_accessibilityLeafDescendantsWithOptions:");

      id v6 = v14;
      uint64_t v8 = MEMORY[0x263EF8330];
      int v9 = -1073741824;
      int v10 = 0;
      id v11 = __54__UITextFieldAccessibility__accessibilityRightButtons__block_invoke;
      id v12 = &unk_2650AE910;
      id v13 = v22;
      [v6 enumerateObjectsUsingBlock:&v8];
      [v21[0] axSafelyAddObjectsFromArray:v14];
      objc_storeStrong((id *)&v13, 0);
      objc_storeStrong(&v14, 0);
    }
  }
  id v4 = v21[0];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);

  return v4;
}

void __54__UITextFieldAccessibility__accessibilityRightButtons__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setAccessibilityContainer:a1[4]];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v21 = a3;
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v18 = [(UITextFieldAccessibility *)v20 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v11 = 0;
  char v6 = 0;
  if (!v18)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    char v15 = __60__UITextFieldAccessibility__accessibilityHitTest_withEvent___block_invoke;
    id v16 = &unk_2650AE580;
    id v17 = v20;
    char v11 = 1;
    int v10 = (id *)&v17;
    char v6 = ((uint64_t (*)(void))__60__UITextFieldAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v6)
  {
    -[UITextFieldAccessibility _accessibilitySetBoolValue:forKey:](v20, "_accessibilitySetBoolValue:forKey:", 1);
    id v9 = (id)-[UITextFieldAccessibility accessibilityHitTest:withEvent:](v20, "accessibilityHitTest:withEvent:", location[0], v21.x, v21.y);
    [(UITextFieldAccessibility *)v20 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v22 = v9;
    int v8 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    int v8 = 0;
  }
  if (v11) {
    objc_storeStrong(v10, 0);
  }
  if (!v8)
  {
    if (-[UITextFieldAccessibility _axTextFieldIsHidden](v20))
    {
      id v22 = 0;
    }
    else
    {
      v7.receiver = v20;
      v7.super_class = (Class)UITextFieldAccessibility;
      id v22 = -[UITextFieldAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, location[0], v21.x, v21.y);
    }
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  id v4 = v22;

  return v4;
}

BOOL __60__UITextFieldAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  char v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_3;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_45);
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
      int v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v4 = v8;
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
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_3;
}

void __60__UITextFieldAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_3 = (uint64_t)method_getImplementation(InstanceMethod);
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
      id v3 = v7;
      id v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      int v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)_accessibilitySetValue:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  char v6 = __51__UITextFieldAccessibility__accessibilitySetValue___block_invoke;
  objc_super v7 = &unk_2650ADFB0;
  int v8 = v11;
  id v9 = location[0];
  AXPerformSafeBlock();
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__UITextFieldAccessibility__accessibilitySetValue___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) window];
  BOOL v4 = v1 != 0;

  if (v4) {
    [*(id *)(a1 + 32) becomeFirstResponder];
  }
  uint64_t result = [*(id *)(a1 + 32) setText:*(void *)(a1 + 40)];
  if (v4) {
    return [*(id *)(a1 + 32) fieldEditorDidChange:0];
  }
  return result;
}

- (void)_clearButtonClicked:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITextFieldAccessibility;
  [(UITextFieldAccessibility *)&v3 _clearButtonClicked:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  [(UITextFieldAccessibility *)v5 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x263F21C40]];
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  return -[UITextFieldAccessibility _accessibilityLeftButtons](self);
}

- (id)_accessibilitySupplementaryFooterViews
{
  return [(UITextFieldAccessibility *)self _accessibilityRightButtons];
}

- (BOOL)isAccessibilityElement
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextFieldAccessibility *)self isAccessibilityUserDefinedElement];
  if (location[0]) {
    char v4 = [location[0] BOOLValue] & 1;
  }
  else {
    char v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityPlaceholderValue:(void *)a1
{
  id v22 = a1;
  char v21 = a2 & 1;
  if (a1)
  {
    id v20 = 0;
    char v18 = 0;
    objc_opt_class();
    id v14 = (id)[v22 safeValueForKey:@"_placeholderView"];
    id v17 = (id)__UIAccessibilityCastAsClass();

    id v16 = v17;
    objc_storeStrong(&v17, 0);
    id v19 = v16;
    id v13 = (id)[v16 superview];
    if (!v13 || ([v19 isHidden] & 1) != 0 || (objc_msgSend(v19, "alpha"), char v12 = 1, v2 <= 0.01)) {
      char v12 = v21;
    }

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = (id)[v19 attributedText];
        if ([v15 length])
        {
          id v3 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
          id v4 = v20;
          id v20 = v3;
        }
        objc_storeStrong(&v15, 0);
      }
      if (![v20 length])
      {
        id v5 = (id)[v19 accessibilityLabel];
        id v6 = v20;
        id v20 = v5;
      }
      id v7 = objc_alloc(MEMORY[0x263F21660]);
      int v8 = (void *)[v7 initWithStringOrAttributedString:v20];
      id v9 = v20;
      id v20 = v8;

      [v20 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21820]];
    }
    id v23 = v20;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v23 = 0;
  }
  char v10 = v23;

  return v10;
}

- (id)accessibilityPlaceholderValue
{
  return -[UITextFieldAccessibility _accessibilityPlaceholderValue:](self, 1);
}

- (id)_accessibilityTextFieldText
{
  id v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)[(UITextFieldAccessibility *)self safeValueForKey:@"_attributedText"];
  if (v21[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v2 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithCFAttributedString:v21[0]];
      id v3 = v21[0];
      v21[0] = v2;
    }
  }
  else
  {
    v21[0] = (id)[(UITextFieldAccessibility *)v22 safeValueForKey:@"_text"];
  }
  uint64_t v4 = [(UITextFieldAccessibility *)v22 accessibilityTraits];
  if ((v4 & *MEMORY[0x263F813D8]) == *MEMORY[0x263F813D8])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (id)[v21[0] string];
      id v6 = v21[0];
      v21[0] = v5;
    }
    char v20 = 0;
    objc_opt_class();
    id v19 = (id)__UIAccessibilityCastAsClass();
    id v18 = v19;
    objc_storeStrong(&v19, 0);
    id v7 = -[UIView _accessibilitySecureTextForString:]((uint64_t)v18, v21[0]);
    id v8 = v21[0];
    v21[0] = v7;
  }
  id v17 = (id)[MEMORY[0x263F1C738] activeInstance];
  id v15 = (id)[v17 textInputTraits];
  BOOL v16 = [v15 keyboardType] != 5;

  if (!v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = (id)[v21[0] string];
      id v10 = v21[0];
      v21[0] = v9;
    }
    id v11 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v21[0]];
    id v12 = v21[0];
    v21[0] = v11;

    [v21[0] setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21810]];
  }
  id v14 = v21[0];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v21, 0);

  return v14;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  id v9 = self;
  SEL v8 = a2;
  SEL name = a3;
  id v12 = (dispatch_once_t *)&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_427);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0);
  id v3 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v3, name);
  if (name == sel_accessibilityValue) {
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod;
  }
  if (name == sel_accessibilityAttributedValue) {
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod;
  }
  v5.receiver = v9;
  v5.super_class = (Class)UITextFieldAccessibility;
  return [(UITextFieldAccessibility *)&v5 _accessibilityOverridesPotentiallyAttributedAPISelector:name];
}

Method __84__UITextFieldAccessibility__accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityValue);
  id v1 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v1, sel_accessibilityAttributedValue);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod = (uint64_t)result;
  return result;
}

- (id)_accessibilityGetValue
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextFieldAccessibility *)self accessibilityUserDefinedValue];
  if (!location[0])
  {
    location[0] = [(UITextFieldAccessibility *)v7 _accessibilityTextFieldText];
  }
  if (![location[0] length])
  {
    id v5 = -[UITextFieldAccessibility _accessibilityPlaceholderValue:](v7, 0);
    if (v5) {
      objc_storeStrong(location, v5);
    }
    objc_storeStrong(&v5, 0);
  }
  if ([(UITextFieldAccessibility *)v7 _accessibilityBoolValueForKey:*MEMORY[0x263F21780]])
  {
    if ([location[0] isAXAttributedString])
    {
      [location[0] setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21780]];
    }
    else
    {
      id obj = (id)[MEMORY[0x263F21660] axAttributedStringWithString:location[0]];
      [obj setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21780]];
      objc_storeStrong(location, obj);
      objc_storeStrong(&obj, 0);
    }
  }
  id v3 = location[0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)accessibilityValue
{
  return [(UITextFieldAccessibility *)self _accessibilityGetValue];
}

- (id)accessibilityAttributedValue
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = [(UITextFieldAccessibility *)self _accessibilityGetValue];
  if ([location[0] isAXAttributedString])
  {
    id v5 = (id)[location[0] cfAttributedString];
  }
  else if (location[0])
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:location[0]];
  }
  else
  {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  double v2 = v5;

  return v2;
}

- (id)accessibilityLabel
{
  SEL v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[(UITextFieldAccessibility *)self accessibilityUserDefinedLabel];
  if (v7[0])
  {
    id v9 = v7[0];
    int v6 = 1;
  }
  else
  {
    id v4 = (id)[(UITextFieldAccessibility *)v8 safeValueForKey:@"textLabel"];
    id v5 = (id)[v4 accessibilityLabel];

    id v9 = v5;
    int v6 = 1;
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(v7, 0);
  double v2 = v9;

  return v2;
}

- (id)_accessibilityForegroundTextColorAttribute
{
  return (id)[(UITextFieldAccessibility *)self textColor];
}

- (unint64_t)accessibilityTraits
{
  id v15 = self;
  SEL v14 = a2;
  unint64_t v13 = 0;
  unint64_t v13 = *MEMORY[0x263F81408];
  id v5 = (id)[(UITextFieldAccessibility *)self safeValueForKey:@"isEditing"];
  char v11 = 0;
  char v6 = 1;
  if (([v5 BOOLValue] & 1) == 0)
  {
    id v12 = (id)[(UITextFieldAccessibility *)v15 safeValueForKey:@"isFirstResponder"];
    char v11 = 1;
    char v6 = [v12 BOOLValue];
  }
  if (v11) {

  }
  if ((v6 & 1) != 0
    && (AXDoesRequestingClientDeserveAutomation()
     || _AXSMossdeepEnabled()
     || ([(id)*MEMORY[0x263F1D020] _accessibilityHardwareKeyboardActive] & 1) != 0
     || ([(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive] & 1) != 0))
  {
    v13 |= *MEMORY[0x263F81398];
  }
  id v10 = (id)[(UITextFieldAccessibility *)v15 accessibilityUserDefinedTraits];
  if (v10) {
    v13 |= [v10 unsignedLongLongValue];
  }
  char v9 = 0;
  objc_opt_class();
  id v8 = (id)__UIAccessibilityCastAsClass();
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  uint64_t v2 = -[UIView _accessibilityTextAreaTraits](v7);
  v13 |= v2;

  unint64_t v4 = v13;
  objc_storeStrong(&v10, 0);
  return v4;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2 = [(UITextFieldAccessibility *)self selectionRange];
  result.length = v3;
  result.id location = v2;
  return result;
}

- (id)accessibilityCustomRotors
{
  id v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)[MEMORY[0x263EFF980] array];
  id v6 = v11[0];
  v10.receiver = v12;
  v10.super_class = (Class)UITextFieldAccessibility;
  id v7 = [(UITextFieldAccessibility *)&v10 accessibilityCustomRotors];
  objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

  id v8 = v11[0];
  id v9 = (id)[(UITextFieldAccessibility *)v12 _accessibilityInternalTextLinkCustomRotors];
  objc_msgSend(v8, "axSafelyAddObjectsFromArray:");

  if (([(UITextFieldAccessibility *)v12 isEditing] & 1) != 0
    && AXUIKeyboardTypeSupportsMisspelledRotor([(UITextFieldAccessibility *)v12 keyboardType]))
  {
    id v4 = v11[0];
    id v5 = (id)[(UITextFieldAccessibility *)v12 _accessibilityMisspelledRotor];
    objc_msgSend(v4, "axSafelyAddObject:");
  }
  id v3 = v11[0];
  objc_storeStrong(v11, 0);

  return v3;
}

- (id)_accessibilityAttributedTextRetrieval
{
  return (id)[(UITextFieldAccessibility *)self attributedText];
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange v7 = a3;
  id v6 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextFieldAccessibility *)self safeValueForKey:@"text"];
  NSUInteger v4 = [location[0] length];
  char v3 = 0;
  if (AXIsDictationListening())
  {
    AXHandleUserInteractionForDictation(1);
    char v3 = 1;
  }
  _NSRange v10 = v7;
  if (v7.location + v7.length > v4 && !v7.length) {
    v7.id location = v4;
  }
  if (v7.length || (v8 = v7.location, uint64_t v9 = 0, v7.location > v4))
  {
    if (v7.length) {
      [v6 _accessibilitySetTextSelection:v7.length];
    }
  }
  else
  {
    -[UITextFieldAccessibility setSelectionRange:](v6, "setSelectionRange:", v7.location, v7.length);
  }
  if (v3) {
    AXHandleUserInteractionForDictation(0);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille
{
  v10[2] = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v8 = (id)__UIAccessibilityCastAsClass();
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  [v7 keyboardType];
  char v6 = UIKeyboardTypeIsNumberPad() & 1;
  id v5 = (id)[v10[0] textInputTraits];
  id v4 = (id)[v5 textContentType];
  BOOL v3 = 1;
  if ((v6 & 1) == 0)
  {
    BOOL v3 = 1;
    if (v4 != (id)*MEMORY[0x263F1D750]) {
      BOOL v3 = v4 == (id)*MEMORY[0x263F1D670];
    }
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v10, 0);
  return !v3;
}

- (BOOL)_accessibilityAvoidsMockViewContainers
{
  return 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  BOOL v14 = a5;
  id v13 = (id)-[UITextFieldAccessibility safeValueForKey:](v17, "safeValueForKey:");
  char v12 = 0;
  v11.receiver = v17;
  v11.super_class = (Class)UITextFieldAccessibility;
  char v12 = [(UITextFieldAccessibility *)&v11 keyboardInput:location[0] shouldInsertText:v15 isMarkedText:a5];
  id argument = (id)[(UITextFieldAccessibility *)v17 safeValueForKey:@"text"];
  if ([(UITextFieldAccessibility *)v17 accessibilityElementsHidden])
  {
    char v18 = v12 & 1;
  }
  else
  {
    if ((v12 & 1) == 0
      && ([(UITextFieldAccessibility *)v17 safeBoolForKey:@"isEditing"] & 1) != 0)
    {
      if ([v13 isEqualToString:argument])
      {
        if (([v15 isEqualToString:@"\n"] & 1) == 0) {
          UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
        }
      }
      else
      {
        uint64_t v5 = [(UITextFieldAccessibility *)v17 accessibilityTraits];
        if ((v5 & *MEMORY[0x263F813D8]) == 0)
        {
          uint64_t v9 = 0;
          if ([(UITextFieldAccessibility *)v17 accessibilityValueChangesAreReplacements])uint64_t v9 = *MEMORY[0x263F21C68]; {
          [(UITextFieldAccessibility *)v17 _accessibilityPostValueChangedNotificationWithChangeType:v9];
          }
          UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
        }
      }
    }
    char v18 = v12 & 1;
  }
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (BOOL)fieldEditor:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  _NSRange v13 = a5;
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  char v9 = 0;
  v8.receiver = v12;
  v8.super_class = (Class)UITextFieldAccessibility;
  char v9 = -[UITextFieldAccessibility fieldEditor:shouldInsertText:replacingRange:](&v8, sel_fieldEditor_shouldInsertText_replacingRange_, location[0], v10, v13.location, v13.length);
  if (!v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
  }
  char v6 = v9;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  v6[2] = self;
  v6[1] = (id)a2;
  id v4 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  v6[0] = (id)-[UITextFieldAccessibility _accessibilityLeafDescendantsWithOptions:](self, "_accessibilityLeafDescendantsWithOptions:");

  id v5 = (id)[v6[0] firstObject];
  objc_storeStrong(v6, 0);

  return v5;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

@end