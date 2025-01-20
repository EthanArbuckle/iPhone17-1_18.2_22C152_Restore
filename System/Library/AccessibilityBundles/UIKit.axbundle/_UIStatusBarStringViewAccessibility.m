@interface _UIStatusBarStringViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)_accessibilityIsNonDismissableStatusBarElement;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIStatusBarStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarStringView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIStatusBarStringView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  v20 = self;
  v19[1] = (id)a2;
  char v18 = 0;
  objc_opt_class();
  id v17 = (id)__UIAccessibilityCastAsClass();
  id v16 = v17;
  objc_storeStrong(&v17, 0);
  v19[0] = v16;
  v9 = (void *)MEMORY[0x263F21660];
  id v10 = (id)[v16 text];
  id v15 = (id)objc_msgSend(v9, "axAttributedStringWithString:");

  if ([(_UIStatusBarStringViewAccessibility *)v20 _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsTime"] & 1) != 0|| ([(_UIStatusBarStringViewAccessibility *)v20 _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsPillTime"])
  {
    v6 = (void *)MEMORY[0x263F21660];
    id v8 = (id)[MEMORY[0x263EFF910] date];
    id v7 = (id)AXDateStringForFormat();
    id v2 = (id)objc_msgSend(v6, "axAttributedStringWithString:");
    id v3 = v15;
    id v15 = v2;

    [v15 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21708]];
  }
  if (-[_UIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](v20, "_accessibilityBoolValueForKey:", @"AccessibilityStatusBarStringIsDate"))[v15 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21718]]; {
  if ([(_UIStatusBarStringViewAccessibility *)v20 _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsBreadcrumb"])
  }
  {
    v14.receiver = v20;
    v14.super_class = (Class)_UIStatusBarStringViewAccessibility;
    id v21 = [(_UIStatusBarStringViewAccessibility *)&v14 accessibilityLabel];
    int v13 = 1;
  }
  else if (([(_UIStatusBarStringViewAccessibility *)v20 _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsDataNetwork"] & 1) == 0|| ((v11.receiver = v20, v11.super_class = (Class)_UIStatusBarStringViewAccessibility, (id v12 = [(_UIStatusBarStringViewAccessibility *)&v11 accessibilityLabel]) == 0)? (v13 = 0): (v21 = v12, v13 = 1), objc_storeStrong(&v12, 0), !v13))
  {
    id v21 = v15;
    int v13 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v19, 0);
  v4 = v21;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v6 = self;
  SEL v5 = a2;
  unint64_t v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarStringViewAccessibility;
  unint64_t v4 = [(_UIStatusBarStringViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F81368];
  if ([(_UIStatusBarStringViewAccessibility *)v6 _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsTime"] & 1) != 0|| ([(_UIStatusBarStringViewAccessibility *)v6 _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsPillTime"])
  {
    v4 |= *MEMORY[0x263F1CF68];
  }
  return v4;
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

- (BOOL)canBecomeFocused
{
  id v12 = self;
  SEL v11 = a2;
  char v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarStringViewAccessibility;
  char v10 = [(_UIStatusBarStringViewAccessibility *)&v9 canBecomeFocused];
  uint64_t v8 = 0;
  char v7 = 0;
  id v6 = (id)__UIAccessibilitySafeClass();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v3 = (id)[v5 traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v8 = v4;
  if (v4 != 3 && v8 != 2) {
    char v10 = [(_UIStatusBarStringViewAccessibility *)v12 accessibilityRespondsToUserInteraction] & 1;
  }
  return v10 & 1;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  id v5 = self;
  SEL v4 = a2;
  if ([(_UIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsPillTime"])return 0; {
  v3.receiver = v5;
  }
  v3.super_class = (Class)_UIStatusBarStringViewAccessibility;
  return [(_UIStatusBarStringViewAccessibility *)&v3 isAccessibilityElement];
}

- (BOOL)_accessibilityIsNonDismissableStatusBarElement
{
  return 1;
}

@end