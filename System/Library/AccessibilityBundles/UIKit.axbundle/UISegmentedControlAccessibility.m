@interface UISegmentedControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHasNativeFocus;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityNativeFocusPreferredElement;
- (id)accessibilityElements;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)sendActionsForControlEvents:(unint64_t)a3;
@end

@implementation UISegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISegmentedControl";
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
  v3 = @"UISegmentedControl";
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"canBecomeFocused", v4, 0);
  objc_storeStrong(v6, obj);
}

- (int64_t)accessibilityContainerType
{
  return 11;
}

- (unint64_t)_accessibilityAutomationType
{
  return 37;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (BOOL)accessibilityElementsHidden
{
  v8 = self;
  location[1] = (id)a2;
  id v3 = (id)[(UISegmentedControlAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"scopeBar"];

  if ((v4 & 1) == 0
    || ((location[0] = (id)-[UISegmentedControlAccessibility safeValueForKey:](v8, "safeValueForKey:", @"superview"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| ([location[0] showsScopeBar] & 1) != 0? (int v6 = 0): (v9 = 1, int v6 = 1), objc_storeStrong(location, 0), !v6))
  {
    v5.receiver = v8;
    v5.super_class = (Class)UISegmentedControlAccessibility;
    char v9 = [(UISegmentedControlAccessibility *)&v5 accessibilityElementsHidden];
  }
  return v9 & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  id v2 = (id)[(UISegmentedControlAccessibility *)self storedShouldGroupAccessibilityChildren];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 1;
  }
  id v4 = (id)[(UISegmentedControlAccessibility *)self storedShouldGroupAccessibilityChildren];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (id)accessibilityElements
{
  v10 = self;
  v9[1] = (id)a2;
  char v8 = 0;
  objc_opt_class();
  id v5 = (id)[(UISegmentedControlAccessibility *)v10 safeValueForKey:@"_segments"];
  id v7 = (id)__UIAccessibilityCastAsClass();

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  if ([(UISegmentedControlAccessibility *)v10 _accessibilityIsRTL])
  {
    id v4 = (id)[v9[0] reverseObjectEnumerator];
    id v11 = (id)[v4 allObjects];
  }
  else
  {
    id v11 = v9[0];
  }
  objc_storeStrong(v9, 0);
  id v2 = v11;

  return v2;
}

- (BOOL)_accessibilityHasNativeFocus
{
  char v9 = self;
  SEL v8 = a2;
  char v7 = 0;
  v6.receiver = self;
  v6.super_class = (Class)UISegmentedControlAccessibility;
  char v7 = [(UISegmentedControlAccessibility *)&v6 _accessibilityHasNativeFocus];
  char v4 = 0;
  BOOL v3 = 0;
  if (v7)
  {
    id v5 = [(UISegmentedControlAccessibility *)v9 _accessibilityNativeFocusPreferredElement];
    char v4 = 1;
    BOOL v3 = v5 != 0;
  }
  if (v4) {

  }
  if (v3) {
    char v7 = 0;
  }
  return v7 & 1;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  v14 = self;
  SEL v13 = a2;
  uint64_t v12 = 0;
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  uint64_t v5 = [v9 selectedSegmentIndex];

  uint64_t v12 = v5;
  id v8 = (id)[(UISegmentedControlAccessibility *)v14 safeArrayForKey:@"_segments"];
  if (v12 < 0 || (unint64_t v4 = v12, v4 >= [v8 count]))
  {
    v6.receiver = v14;
    v6.super_class = (Class)UISegmentedControlAccessibility;
    id v15 = [(UISegmentedControlAccessibility *)&v6 _accessibilityNativeFocusPreferredElement];
    int v7 = 1;
  }
  else
  {
    id v15 = (id)[v8 objectAtIndexedSubscript:v12];
    int v7 = 1;
  }
  objc_storeStrong(&v8, 0);
  id v2 = v15;

  return v2;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)sendActionsForControlEvents:(unint64_t)a3
{
  objc_super v6 = self;
  SEL v5 = a2;
  unint64_t v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControlAccessibility;
  [(UISegmentedControlAccessibility *)&v3 sendActionsForControlEvents:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = location[0] == (id)*MEMORY[0x263F1D180];
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  objc_super v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControlAccessibility;
  char v4 = [(UISegmentedControlAccessibility *)&v3 canBecomeFocused];
  if ([(UISegmentedControlAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])return [(UISegmentedControlAccessibility *)v6 safeBoolForKey:@"_hasEnabledSegment"] & 1; {
  else
  }
    return v4 & 1;
}

@end