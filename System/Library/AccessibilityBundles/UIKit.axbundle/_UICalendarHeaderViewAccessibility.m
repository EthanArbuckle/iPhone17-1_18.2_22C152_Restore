@interface _UICalendarHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityFKAShouldProcessChildren;
- (BOOL)_accessibilityUpdatesSwitchMenu;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupMonthSelector;
- (void)_setupViewHierarchy;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation _UICalendarHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UICalendarHeaderView";
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
  [location[0] validateClass:@"_UIDatePickerLinkedLabel" hasInstanceVariable:@"_renderingLabel" withType:"UILabel"];
  v5 = @"_UICalendarHeaderView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"_UICalendarHeaderTitleButton" hasInstanceVariable:@"_monthYearLabel" withType:"_UIDatePickerLinkedLabel"];
  v3 = "UIButton";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"_UICalendarHeaderView", @"_nextMonthButton");
  [location[0] validateClass:@"_UICalendarHeaderView" hasInstanceVariable:@"_previousMonthButton" withType:"UIButton"];
  v4 = "B";
  [location[0] validateClass:@"_UICalendarHeaderView" hasInstanceMethod:@"isExpanded" withFullSignature:0];
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"setExpanded:animated:", v4, v4, 0);
  v6 = "@";
  [location[0] validateClass:v5 hasInstanceMethod:@"delegate" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_setupViewHierarchy", v8, 0);
  v7 = @"UICalendarView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"headerViewDidStepBackward:", v8, v6, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)isAccessibilityElement
{
  v11 = self;
  SEL v10 = a2;
  char v8 = 0;
  BOOL v3 = 0;
  if (AXRequestingClient() == 4)
  {
    id v9 = (id)[MEMORY[0x263F22938] sharedInstance];
    char v8 = 1;
    BOOL v3 = [v9 switchControlTapBehavior] == 2;
  }
  if (v8) {

  }
  if (v3)
  {
    char v12 = 0;
  }
  else
  {
    char v6 = 0;
    objc_opt_class();
    id v5 = (id)__UIAccessibilityCastAsClass();
    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v7 = v4;
    if ([v4 _accessibilityViewIsVisible]) {
      char v12 = ([(_UICalendarHeaderViewAccessibility *)v11 safeBoolForKey:@"isExpanded"] ^ 1) & 1;
    }
    else {
      char v12 = 0;
    }
    objc_storeStrong(&v7, 0);
  }
  return v12 & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"calendar.month");
}

- (id)accessibilityValue
{
  v8[2] = self;
  v8[1] = (id)a2;
  id v5 = (id)[(_UICalendarHeaderViewAccessibility *)self safeValueForKey:@"_monthYearButton"];
  id v4 = (id)[v5 safeValueForKey:@"_monthYearLabel"];
  id v3 = (id)[v4 safeValueForKey:@"_renderingLabel"];
  v8[0] = (id)[v3 accessibilityLabel];

  id v7 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v8[0]];
  [v7 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21718]];
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"calendar.change.year.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CED8];
}

- (void)accessibilityIncrement
{
  char v8 = self;
  v7[1] = (id)a2;
  char v6 = 0;
  objc_opt_class();
  id v2 = (id)[(_UICalendarHeaderViewAccessibility *)v8 safeValueForKey:@"_nextMonthButton"];
  id v5 = (id)__UIAccessibilityCastAsClass();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  if ([v4 isEnabled])
  {
    id v3 = v8;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v3, 0);
  }
  objc_storeStrong(v7, 0);
}

- (void)accessibilityDecrement
{
  char v8 = self;
  v7[1] = (id)a2;
  char v6 = 0;
  objc_opt_class();
  id v2 = (id)[(_UICalendarHeaderViewAccessibility *)v8 safeValueForKey:@"_previousMonthButton"];
  id v5 = (id)__UIAccessibilityCastAsClass();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  if ([v4 isEnabled])
  {
    id v3 = v8;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v3, 0);
  }
  objc_storeStrong(v7, 0);
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  id v7 = (id)[(_UICalendarHeaderViewAccessibility *)self safeValueForKey:@"_monthYearButton"];
  id v6 = (id)[v7 safeValueForKey:@"_monthYearLabel"];
  [v6 accessibilityActivationPoint];
  double v8 = v2;
  double v9 = v3;

  double v4 = v8;
  double v5 = v9;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)automationElements
{
  double v8 = self;
  SEL v7 = a2;
  char v6 = 0;
  objc_opt_class();
  id v5 = (id)__UIAccessibilityCastAsClass();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  id v3 = (id)[v4 subviews];

  return v3;
}

- (BOOL)_accessibilityFKAShouldProcessChildren
{
  return ![(_UICalendarHeaderViewAccessibility *)self isAccessibilityElement];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UICalendarHeaderViewAccessibility;
  [(_UICalendarHeaderViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[_UICalendarHeaderViewAccessibility _axMarkupMonthSelector](v4);
}

- (void)_axMarkupMonthSelector
{
  id v39 = a1;
  if (a1)
  {
    objc_initWeak(&location, v39);
    id v37 = (id)[v39 safeUIViewForKey:@"_monthYearButton"];
    id v36 = (id)[v37 safeUIViewForKey:@"_monthYearLabel"];
    [v36 setIsAccessibilityElement:0];
    [v37 setIsAccessibilityElement:1];
    id v10 = v37;
    uint64_t v30 = MEMORY[0x263EF8330];
    int v31 = -1073741824;
    int v32 = 0;
    v33 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke;
    v34 = &unk_2650AE108;
    objc_copyWeak(&v35, &location);
    [v10 _setAccessibilityLabelBlock:&v30];
    id v9 = v37;
    uint64_t v24 = MEMORY[0x263EF8330];
    int v25 = -1073741824;
    int v26 = 0;
    v27 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_2;
    v28 = &unk_2650AE108;
    objc_copyWeak(&v29, &location);
    [v9 setAccessibilityIdentifierBlock:&v24];
    [v37 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    id v8 = v37;
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    v21 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_3;
    v22 = &unk_2650AE108;
    objc_copyWeak(&v23, &location);
    [v8 _setAccessibilityValueBlock:&v18];
    objc_initWeak(&v17, v37);
    id v7 = v37;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_4;
    v15 = &unk_2650AE508;
    objc_copyWeak(&v16, &v17);
    [v7 _setAccessibilityActivationPointBlock:&v11];
    id v6 = (id)[v39 safeValueForKey:@"_nextMonthButton"];
    id v5 = accessibilityLocalizedString(@"calendar.change.month.increment");
    objc_msgSend(v6, "setAccessibilityLabel:");

    id v4 = (id)[v39 safeValueForKey:@"_nextMonthButton"];
    [v4 setAccessibilityIdentifier:@"DatePicker.NextMonth"];

    id v3 = (id)[v39 safeValueForKey:@"_previousMonthButton"];
    id v2 = accessibilityLocalizedString(@"calendar.change.month.decrement");
    objc_msgSend(v3, "setAccessibilityLabel:");

    id v1 = (id)[v39 safeValueForKey:@"_previousMonthButton"];
    [v1 setAccessibilityIdentifier:@"DatePicker.PreviousMonth"];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v35);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_destroyWeak(&location);
  }
}

- (void)_setupViewHierarchy
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UICalendarHeaderViewAccessibility;
  [(_UICalendarHeaderViewAccessibility *)&v2 _setupViewHierarchy];
  -[_UICalendarHeaderViewAccessibility _axMarkupMonthSelector](v4);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  BOOL v7 = a4;
  v6.receiver = self;
  v6.super_class = (Class)_UICalendarHeaderViewAccessibility;
  [(_UICalendarHeaderViewAccessibility *)&v6 setExpanded:a3 animated:a4];
  id v4 = v10;
  BOOL v5 = v8;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v4, 0);
}

@end