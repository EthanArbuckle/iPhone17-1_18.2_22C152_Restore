@interface UIInputSwitcherSegmentControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
- (void)setSegmentImages:(id)a3;
- (void)setSegmentTitles:(id)a3;
@end

@implementation UIInputSwitcherSegmentControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSwitcherSegmentControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIInputSwitcherSegmentControl";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v3 = "@";
  [location[0] validateClass:@"UIInputSwitcherSegmentControl" hasInstanceMethod:@"stackView" withFullSignature:0];
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"setSegmentImages:", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"setSegmentTitles:", v5, v3, 0);
  objc_storeStrong(v7, v6);
}

- (void)didMoveToWindow
{
  v4 = self;
  SEL v3 = a2;
  [(UIInputSwitcherSegmentControlAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v2.receiver = v4;
  v2.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  [(UIInputSwitcherSegmentControlAccessibility *)&v2 didMoveToWindow];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  [(UIInputSwitcherSegmentControlAccessibility *)&v22 _accessibilityLoadAccessibilityInformation];
  char v20 = 0;
  objc_opt_class();
  id v15 = (id)[(UIInputSwitcherSegmentControlAccessibility *)v24 safeValueForKey:@"stackView"];
  id v19 = (id)__UIAccessibilityCastAsClass();

  id v18 = v19;
  objc_storeStrong(&v19, 0);
  id v21 = v18;
  id v13 = (id)[v18 arrangedSubviews];
  BOOL v14 = [v13 count] != 3;

  if (v14)
  {
    char v16 = 0;
    BOOL v3 = 0;
    if (v21)
    {
      id v17 = (id)[v21 arrangedSubviews];
      char v16 = 1;
      BOOL v3 = [v17 count] != 0;
    }
    if (v16) {

    }
    if (v3)
    {
      id v2 = (id)[v21 arrangedSubviews];
      [v2 count];
      _AXAssert();
    }
  }
  else
  {
    id v6 = (id)UIKitAccessibilityLocalizedString();
    id v5 = (id)[v21 arrangedSubviews];
    id v4 = (id)[v5 objectAtIndexedSubscript:0];
    [v4 setAccessibilityLabel:v6];

    id v9 = (id)UIKitAccessibilityLocalizedString();
    id v8 = (id)[v21 arrangedSubviews];
    id v7 = (id)[v8 objectAtIndexedSubscript:1];
    [v7 setAccessibilityLabel:v9];

    id v12 = (id)UIKitAccessibilityLocalizedString();
    id v11 = (id)[v21 arrangedSubviews];
    id v10 = (id)[v11 objectAtIndexedSubscript:2];
    [v10 setAccessibilityLabel:v12];
  }
  objc_storeStrong(&v21, 0);
}

- (void)setSegmentImages:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  [(UIInputSwitcherSegmentControlAccessibility *)&v3 setSegmentImages:location[0]];
  [(UIInputSwitcherSegmentControlAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
  objc_storeStrong(location, 0);
}

- (void)setSegmentTitles:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIInputSwitcherSegmentControlAccessibility;
  [(UIInputSwitcherSegmentControlAccessibility *)&v3 setSegmentTitles:location[0]];
  [(UIInputSwitcherSegmentControlAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
  objc_storeStrong(location, 0);
}

@end