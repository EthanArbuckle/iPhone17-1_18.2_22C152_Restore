@interface UIGestureKeyboardIntroductionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)showGestureKeyboardIntroduction;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UIGestureKeyboardIntroductionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIGestureKeyboardIntroduction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIGestureKeyboardIntroduction";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "UIKBKeyView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"UIGestureKeyboardIntroduction", @"m_firstKeyView");
  [location[0] validateClass:@"UIGestureKeyboardIntroduction" hasInstanceVariable:@"m_secondKeyView" withType:"UIKBKeyView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIGestureKeyboardIntroduction", @"showGestureKeyboardIntroduction", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBKeyView", @"key", "@", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v43 = self;
  SEL v42 = a2;
  v41.receiver = self;
  v41.super_class = (Class)UIGestureKeyboardIntroductionAccessibility;
  [(UIGestureKeyboardIntroductionAccessibility *)&v41 _accessibilityLoadAccessibilityInformation];
  id v40 = (id)[(UIGestureKeyboardIntroductionAccessibility *)v43 safeUIViewForKey:@"m_view"];
  id v39 = (id)[(UIGestureKeyboardIntroductionAccessibility *)v43 safeUIViewForKey:@"m_firstKeyView"];
  id v38 = (id)[(UIGestureKeyboardIntroductionAccessibility *)v43 safeUIViewForKey:@"m_secondKeyView"];
  char v36 = 0;
  objc_opt_class();
  id v22 = (id)[v39 safeValueForKey:@"key"];
  id v35 = (id)__UIAccessibilityCastAsClass();

  id v34 = v35;
  objc_storeStrong(&v35, 0);
  id v37 = v34;
  char v32 = 0;
  objc_opt_class();
  id v21 = (id)[v38 safeValueForKey:@"key"];
  id v31 = (id)__UIAccessibilityCastAsClass();

  id v30 = v31;
  objc_storeStrong(&v31, 0);
  id v33 = v30;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v40 subviews];
  uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
  if (v20)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0;
    unint64_t v18 = v20;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(obj);
      }
      id v29 = *(id *)(__b[1] + 8 * v17);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = 0;
        [v29 center];
        double v25 = v2;
        double v26 = v3;
        [v39 center];
        if (__CGPointEqualToPoint_0(v25, v26, v4, v5))
        {
          objc_storeStrong(&v27, v37);
        }
        else
        {
          [v29 center];
          double v23 = v6;
          double v24 = v7;
          [v38 center];
          if (__CGPointEqualToPoint_0(v23, v24, v8, v9)) {
            objc_storeStrong(&v27, v33);
          }
        }
        if (v27)
        {
          id v13 = (id)[v37 displayString];
          id v12 = (id)[v37 secondaryDisplayStrings];
          id v11 = (id)MEMORY[0x2455E6560]();
          id v10 = (id)__UIAXStringForVariables();
          objc_msgSend(v29, "setAccessibilityLabel:", v11, @"__AXStringForVariablesSentinel");

          id v14 = (id)accessibilityUIKitLocalizedString();
          objc_msgSend(v29, "setAccessibilityHint:");
        }
        objc_storeStrong(&v27, 0);
      }
      ++v17;
      if (v15 + 1 >= v18)
      {
        uint64_t v17 = 0;
        unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
}

- (BOOL)showGestureKeyboardIntroduction
{
  double v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIGestureKeyboardIntroductionAccessibility;
  char v4 = [(UIGestureKeyboardIntroductionAccessibility *)&v3 showGestureKeyboardIntroduction];
  [(UIGestureKeyboardIntroductionAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  return v4 & 1;
}

@end