@interface _UIDatePickerIOSCompactViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIDatePickerIOSCompactViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDatePickerIOSCompactView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = @"_UIDatePickerIOSCompactView";
  v3 = @"_UIDatePickerViewComponent";
  objc_msgSend(location[0], "validateClass:conformsToProtocol:");
  [location[0] validateProtocol:@"_UIDatePickerViewComponent" hasRequiredInstanceMethod:@"data"];
  [location[0] validateProtocol:@"_UIDatePickerViewComponent" hasRequiredInstanceMethod:@"datePicker"];
  v4 = "@";
  [location[0] validateClass:@"UIDatePicker" hasInstanceMethod:@"_compactStyleDelegate" withFullSignature:0];
  v5 = "q";
  [location[0] validateClass:@"_UIDatePickerDataModel" hasInstanceMethod:@"datePickerMode" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"dateView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"timeView", v4, 0);
  [location[0] validateClass:v6 hasInstanceVariable:@"_presentation" withType:"_UIDatePickerOverlayPresentation"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerOverlayPresentation", @"activeMode", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"setActiveComponent:", "v", v5, 0);
  objc_storeStrong(v8, v7);
}

- (BOOL)isAccessibilityElement
{
  id v3 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"data"];
  uint64_t v4 = [v3 safeIntegerForKey:@"datePickerMode"];

  return v4 != 2;
}

- (id)accessibilityElements
{
  id v6 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"data"];
  uint64_t v7 = [v6 safeIntegerForKey:@"datePickerMode"];

  if (v7 == 2)
  {
    id v3 = (void *)MEMORY[0x263EFF8C0];
    id v5 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"dateView"];
    id v4 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"timeView"];
    id v9 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v4);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)accessibilityLabel
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v6 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"data"];
  uint64_t v7 = [v6 safeIntegerForKey:@"datePickerMode"];

  if (v7)
  {
    uint64_t v3 = v7;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
        objc_storeStrong(location, @"compact.picker.time");
        break;
      case 1:
        objc_storeStrong(location, @"compact.picker.date");
        break;
      case 2:
        objc_storeStrong(location, @"compact.picker.date.and.time");
        break;
      case 3:
        objc_storeStrong(location, @"compact.picker.countdown");
        break;
      case 4:
        objc_storeStrong(location, @"compact.picker.year.month");
        break;
      default:
        JUMPOUT(0);
    }
  }
  id v5 = accessibilityLocalizedString(location[0]);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)accessibilityValue
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  id v12 = 0;
  id v10 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"data"];
  uint64_t v11 = [v10 safeIntegerForKey:@"datePickerMode"];

  if (v11 == 1 || v11 == 2)
  {
    id v9 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)v14 safeUIViewForKey:@"_dateView"];
    id v2 = (id)[v9 accessibilityLabel];
    id v3 = v12;
    id v12 = v2;
  }
  if (!v11 || v11 == 2)
  {
    id v8 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)v14 safeUIViewForKey:@"_timeView"];
    id v4 = (id)[v8 accessibilityLabel];
    id v5 = v13[0];
    v13[0] = v4;
  }
  id v7 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v6 = self;
  SEL v5 = a2;
  unint64_t v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerIOSCompactViewAccessibility;
  unint64_t v4 = [(_UIDatePickerIOSCompactViewAccessibility *)&v3 accessibilityTraits];
  if ([(_UIDatePickerIOSCompactViewAccessibility *)v6 _accessibilityExpandedStatus] == 2) {
    v4 |= *MEMORY[0x263F1CEE8];
  }
  return v4;
}

- (int64_t)_accessibilityExpandedStatus
{
  id v3 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"_presentation"];
  BOOL v4 = [v3 safeIntegerForKey:@"activeMode"] != 0;

  if (v4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)accessibilityActivate
{
  v27 = self;
  SEL v26 = a2;
  id v3 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)self safeValueForKey:@"data"];
  uint64_t v4 = [v3 safeIntegerForKey:@"datePickerMode"];

  uint64_t v25 = v4;
  id v24 = (id)[(_UIDatePickerIOSCompactViewAccessibility *)v27 safeValueForKey:@"datePicker"];
  id v23 = (id)[v24 safeValueForKey:@"_compactStyleDelegate"];
  if (v4 == 1)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    v18 = __65___UIDatePickerIOSCompactViewAccessibility_accessibilityActivate__block_invoke;
    v19 = &unk_2650AE3B8;
    v20 = v27;
    id v21 = v23;
    id v22 = v24;
    AXPerformSafeBlock();
    char v28 = objc_opt_respondsToSelector() & 1;
    int v14 = 1;
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong((id *)&v20, 0);
  }
  else if (v25)
  {
    v5.receiver = v27;
    v5.super_class = (Class)_UIDatePickerIOSCompactViewAccessibility;
    char v28 = [(_UIDatePickerIOSCompactViewAccessibility *)&v5 accessibilityActivate];
    int v14 = 1;
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __65___UIDatePickerIOSCompactViewAccessibility_accessibilityActivate__block_invoke_2;
    id v10 = &unk_2650AE3B8;
    uint64_t v11 = v27;
    id v12 = v23;
    id v13 = v24;
    AXPerformSafeBlock();
    char v28 = objc_opt_respondsToSelector() & 1;
    int v14 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  return v28 & 1;
}

@end