@interface _UIDatePickerCalendarTimeLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsHoursEditing;
- (BOOL)_axIsMinutesEditing;
- (BOOL)_axSelfIsFirstResponder;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (_NSRange)_accessibilitySelectedTextRange;
- (_UIDatePickerCalendarTimeLabelAccessibility)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4;
- (id)_accessibilityHourElement;
- (id)_accessibilityInternalData;
- (id)_accessibilityMinuteElement;
- (id)_accessibilityResponderElement;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (uint64_t)_accessibilityInternalSelectedTextRange;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityFocusChanged:(id)a3;
- (void)_accessibilitySetInternalSelectedTextRange:(uint64_t)a3;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)dealloc;
- (void)pushCurrentStateIntoUIAndNotify;
@end

@implementation _UIDatePickerCalendarTimeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDatePickerCalendarTimeLabel";
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
  v3 = @"_UIDatePickerCalendarTimeView";
  objc_msgSend(location[0], "validateClass:");
  v6 = @"_UIDatePickerCalendarTimeLabel";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v7 = "@";
  [location[0] validateClass:@"_UIDatePickerCalendarTimeView" hasInstanceMethod:@"timeLabel" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"text", v7, 0);
  v4 = "v";
  [location[0] validateClass:v6 hasInstanceMethod:@"pushCurrentStateIntoUIAndNotify" withFullSignature:0];
  v8 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"initWithTimeFormat:minuteInterval:", v7, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"setHourText:", v4, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"setMinuteText:", v4, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"hourText", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"minuteText", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"inputScope", v8, 0);
  v5 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  [location[0] validateClass:v6 hasInstanceMethod:@"hourRect" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"minuteRect", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"timeFormat", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"stateContext", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerCalendarTimeLabelStateMachineContext", @"currentState", "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerCalendarTimeFormat", @"clock", v8, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() != 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 49;
}

- (unint64_t)accessibilityTraits
{
  v6 = self;
  SEL v5 = a2;
  if (AXDoesRequestingClientDeserveAutomation())
  {
    unint64_t v4 = 0;
    unint64_t v4 = *MEMORY[0x263F81408];
    if ([(_UIDatePickerCalendarTimeLabelAccessibility *)v6 _axSelfIsFirstResponder]) {
      v4 |= *MEMORY[0x263F81398];
    }
    return v4;
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    return [(_UIDatePickerCalendarTimeLabelAccessibility *)&v3 accessibilityTraits];
  }
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_axSelfIsFirstResponder
{
  v8 = self;
  SEL v7 = a2;
  char v6 = 0;
  objc_opt_class();
  id v5 = (id)__UIAccessibilityCastAsClass();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  char v3 = [v4 isFirstResponder];

  return v3 & 1;
}

- (BOOL)_axIsHoursEditing
{
  return [(_UIDatePickerCalendarTimeLabelAccessibility *)self safeIntegerForKey:@"inputScope", a2, self] == 2;
}

- (BOOL)_axIsMinutesEditing
{
  return [(_UIDatePickerCalendarTimeLabelAccessibility *)self safeIntegerForKey:@"inputScope", a2, self] == 3;
}

- (id)_accessibilityResponderElement
{
  SEL v7 = self;
  v6[1] = (id)a2;
  id v4 = [(_UIDatePickerCalendarTimeLabelAccessibility *)self accessibilityElements];
  v6[0] = v7;
  id v3 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:");
  id v5 = (id)[v3 firstObject];

  objc_storeStrong(v6, 0);

  return v5;
}

- (id)accessibilityElements
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIDatePickerCalendarTimeLabelAccessibility *)self _accessibilityValueForKey:@"accessibilityElements"];
  if (!location[0])
  {
    location[0] = (id)[MEMORY[0x263EFF980] array];

    [(_UIDatePickerCalendarTimeLabelAccessibility *)v7 _accessibilitySetRetainedValue:location[0] forKey:@"accessibilityElements"];
    id v4 = [(_UIDatePickerCalendarTimeLabelAccessibility *)v7 _accessibilityHourElement];
    objc_msgSend(location[0], "addObject:");

    id v5 = [(_UIDatePickerCalendarTimeLabelAccessibility *)v7 _accessibilityMinuteElement];
    objc_msgSend(location[0], "addObject:");
  }
  id v8 = location[0];
  objc_storeStrong(location, 0);
  v2 = v8;

  return v2;
}

- (id)_accessibilityHourElement
{
  v67 = self;
  v66[1] = (id)a2;
  v66[0] = (id)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
  id v23 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v66[0], "setAccessibilityLabel:");

  [v66[0] setAccessibilityIdentifier:@"Hours"];
  objc_initWeak(&location, v67);
  id v24 = v66[0];
  uint64_t v59 = MEMORY[0x263EF8330];
  int v60 = -1073741824;
  int v61 = 0;
  v62 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke;
  v63 = &unk_2650AE418;
  objc_copyWeak(&v64, &location);
  [v24 _setAccessibilityTraitsBlock:&v59];
  uint64_t v58 = 1;
  uint64_t v57 = 12;
  id v21 = (id)[(_UIDatePickerCalendarTimeLabelAccessibility *)v67 safeValueForKey:@"timeFormat"];
  uint64_t v22 = [v21 safeIntegerForKey:@"clock"];

  if (v22)
  {
    uint64_t v3 = v22;
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
        uint64_t v58 = 0;
        uint64_t v57 = 11;
        break;
      case 1:
        uint64_t v58 = 1;
        uint64_t v57 = 12;
        break;
      case 2:
        uint64_t v58 = 0;
        uint64_t v57 = 23;
        break;
      case 3:
        uint64_t v58 = 1;
        uint64_t v57 = 24;
        break;
      default:
        JUMPOUT(0);
    }
  }
  id v20 = v66[0];
  uint64_t v51 = MEMORY[0x263EF8330];
  int v52 = -1073741824;
  int v53 = 0;
  v54 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_2;
  v55 = &unk_2650AE468;
  objc_copyWeak(v56, &location);
  v56[1] = (id)v58;
  v56[2] = (id)v57;
  [v20 _setAccessibilityIncrementBlock:&v51];
  id v19 = v66[0];
  uint64_t v45 = MEMORY[0x263EF8330];
  int v46 = -1073741824;
  int v47 = 0;
  v48 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_4;
  v49 = &unk_2650AE468;
  objc_copyWeak(v50, &location);
  v50[1] = (id)v58;
  v50[2] = (id)v57;
  [v19 _setAccessibilityDecrementBlock:&v45];
  id v18 = v66[0];
  uint64_t v39 = MEMORY[0x263EF8330];
  int v40 = -1073741824;
  int v41 = 0;
  v42 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_6;
  v43 = &unk_2650AE108;
  objc_copyWeak(&v44, &location);
  [v18 _setAccessibilityValueBlock:&v39];
  v17 = v67;
  [(_UIDatePickerCalendarTimeLabelAccessibility *)v67 safeCGRectForKey:@"hourRect"];
  double v33 = v4;
  double v34 = v5;
  double v35 = v6;
  double v36 = v7;
  -[_UIDatePickerCalendarTimeLabelAccessibility convertRect:fromView:](v17, "convertRect:fromView:", v67, v4, v5, v6, v7);
  *(double *)&long long v15 = v8;
  *((double *)&v15 + 1) = v9;
  *(double *)&long long v16 = v10;
  *((double *)&v16 + 1) = v11;
  long long v37 = v15;
  long long v38 = v16;
  long long v31 = v15;
  long long v32 = v16;
  objc_msgSend(v66[0], "setAccessibilityFrameInContainerSpace:", v8, v9, v10, v11);
  id v14 = v66[0];
  uint64_t v25 = MEMORY[0x263EF8330];
  int v26 = -1073741824;
  int v27 = 0;
  v28 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_7;
  v29 = &unk_2650ADF60;
  objc_copyWeak(&v30, &location);
  [v14 _setAccessibilityActivateBlock:&v25];
  id v13 = v66[0];
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v44);
  objc_destroyWeak(v50);
  objc_destroyWeak(v56);
  objc_destroyWeak(&v64);
  objc_destroyWeak(&location);
  objc_storeStrong(v66, 0);

  return v13;
}

- (id)_accessibilityMinuteElement
{
  v63 = self;
  v62[1] = (id)a2;
  v62[0] = (id)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
  id v19 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v62[0], "setAccessibilityLabel:");

  [v62[0] setAccessibilityIdentifier:@"Minutes"];
  objc_initWeak(&location, v63);
  id v20 = v62[0];
  uint64_t v55 = MEMORY[0x263EF8330];
  int v56 = -1073741824;
  int v57 = 0;
  uint64_t v58 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke;
  uint64_t v59 = &unk_2650AE418;
  objc_copyWeak(&v60, &location);
  [v20 _setAccessibilityTraitsBlock:&v55];
  v54 = 0;
  uint64_t v53 = 59;
  id v18 = v62[0];
  uint64_t v47 = MEMORY[0x263EF8330];
  int v48 = -1073741824;
  int v49 = 0;
  v50 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_2;
  uint64_t v51 = &unk_2650AE468;
  objc_copyWeak(v52, &location);
  v52[1] = v54;
  v52[2] = (id)v53;
  [v18 _setAccessibilityIncrementBlock:&v47];
  id v17 = v62[0];
  uint64_t v41 = MEMORY[0x263EF8330];
  int v42 = -1073741824;
  int v43 = 0;
  id v44 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_4;
  uint64_t v45 = &unk_2650AE490;
  objc_copyWeak(v46, &location);
  v46[1] = v54;
  [v17 _setAccessibilityDecrementBlock:&v41];
  id v16 = v62[0];
  uint64_t v35 = MEMORY[0x263EF8330];
  int v36 = -1073741824;
  int v37 = 0;
  long long v38 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_6;
  uint64_t v39 = &unk_2650AE108;
  objc_copyWeak(&v40, &location);
  [v16 _setAccessibilityValueBlock:&v35];
  long long v15 = v63;
  [(_UIDatePickerCalendarTimeLabelAccessibility *)v63 safeCGRectForKey:@"minuteRect"];
  double v29 = v2;
  double v30 = v3;
  double v31 = v4;
  double v32 = v5;
  -[_UIDatePickerCalendarTimeLabelAccessibility convertRect:fromView:](v15, "convertRect:fromView:", v63, v2, v3, v4, v5);
  *(double *)&long long v13 = v6;
  *((double *)&v13 + 1) = v7;
  *(double *)&long long v14 = v8;
  *((double *)&v14 + 1) = v9;
  long long v33 = v13;
  long long v34 = v14;
  long long v27 = v13;
  long long v28 = v14;
  objc_msgSend(v62[0], "setAccessibilityFrameInContainerSpace:", v6, v7, v8, v9);
  id v12 = v62[0];
  uint64_t v21 = MEMORY[0x263EF8330];
  int v22 = -1073741824;
  int v23 = 0;
  id v24 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_7;
  uint64_t v25 = &unk_2650ADF60;
  objc_copyWeak(&v26, &location);
  [v12 _setAccessibilityActivateBlock:&v21];
  id v11 = v62[0];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v40);
  objc_destroyWeak(v46);
  objc_destroyWeak(v52);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
  objc_storeStrong(v62, 0);

  return v11;
}

- (id)accessibilityLabel
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIDatePickerCalendarTimeLabelAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickerca_2.isa)];
  if (location[0])
  {
    id v4 = (id)[location[0] safeUIViewForKey:@"timeLabel"];
    id v6 = (id)[v4 accessibilityLabel];
  }
  else
  {
    id v6 = accessibilityLocalizedString(@"calendar.time");
  }
  objc_storeStrong(location, 0);
  double v2 = v6;

  return v2;
}

- (CGRect)accessibilityFrame
{
  uint64_t v25 = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIDatePickerCalendarTimeLabelAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickerca_2.isa)];
  if (location[0])
  {
    v22.receiver = v25;
    v22.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    [(_UIDatePickerCalendarTimeLabelAccessibility *)&v22 accessibilityFrame];
    v23.origin.double x = v2;
    v23.origin.double y = v3;
    v23.size.double width = v4;
    v23.size.double height = v5;
    id v18 = (id)[location[0] safeUIViewForKey:@"timeLabel"];
    [v18 accessibilityFrame];
    r2.origin.double x = v6;
    r2.origin.double y = v7;
    r2.size.double width = v8;
    r2.size.double height = v9;
    CGRect v26 = CGRectUnion(v23, r2);
  }
  else
  {
    v19.receiver = v25;
    v19.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    [(_UIDatePickerCalendarTimeLabelAccessibility *)&v19 accessibilityFrame];
    v26.origin.double x = v10;
    v26.origin.double y = v11;
    v26.size.double width = v12;
    v26.size.double height = v13;
  }
  int v20 = 1;
  objc_storeStrong(location, 0);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_accessibilityInternalData
{
  id v5 = a1;
  if (a1)
  {
    id v4 = (id)[v5 _accessibilityValueForKey:@"AXInternalData"];
    if (!v4)
    {
      id v4 = (id)objc_opt_new();

      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      id v3 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 0, 0);
      objc_msgSend(v4, "setValue:forKey:");

      [v5 _accessibilitySetRetainedValue:v4 forKey:@"AXInternalData"];
    }
    id v6 = v4;
    objc_storeStrong(&v4, 0);
  }
  else
  {
    id v6 = 0;
  }
  v1 = v6;

  return v1;
}

- (uint64_t)_accessibilityInternalSelectedTextRange
{
  id v5 = a1;
  if (a1)
  {
    id v4 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityInternalData](v5);
    id v3 = (id)[v4 objectForKey:@"AXInternalRange"];
    uint64_t v6 = [v3 rangeValue];
    uint64_t v7 = v1;
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v4, 0);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  return v6;
}

- (void)_accessibilitySetInternalSelectedTextRange:(uint64_t)a3
{
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  uint64_t v6 = a1;
  if (a1)
  {
    id v5 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityInternalData](v6);
    id v3 = v5;
    id v4 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v8);
    objc_msgSend(v3, "setObject:forKey:");

    objc_storeStrong(&v5, 0);
  }
}

- (_NSRange)_accessibilitySelectedTextRange
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIDatePickerCalendarTimeLabelAccessibility *)self safeStringForKey:@"text"];
  if ([location[0] length])
  {
    uint64_t v9 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityInternalSelectedTextRange](v8);
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    uint64_t v9 = (uint64_t)[(_UIDatePickerCalendarTimeLabelAccessibility *)&v5 _accessibilitySelectedTextRange];
  }
  NSUInteger v10 = v2;
  int v6 = 1;
  objc_storeStrong(location, 0);
  NSUInteger v3 = v9;
  NSUInteger v4 = v10;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange v6 = a3;
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIDatePickerCalendarTimeLabelAccessibility *)self safeStringForKey:@"text"];
  if ([location[0] length])
  {
    [(_UIDatePickerCalendarTimeLabelAccessibility *)v5 _accessibilitySetInternalSelectedTextRange:v6.length];
    UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
  }
  v3.receiver = v5;
  v3.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilitySetSelectedTextRange:](&v3, sel__accessibilitySetSelectedTextRange_, v6.location, v6.length);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityFocusChanged:(id)a3
{
  NSUInteger v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  [(_UIDatePickerCalendarTimeLabelAccessibility *)v4 _accessibilitySetInternalSelectedTextRange:0];
  objc_storeStrong(location, 0);
}

- (_UIDatePickerCalendarTimeLabelAccessibility)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  CGFloat v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v10 = a4;
  NSUInteger v4 = v12;
  CGFloat v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  CGFloat v12 = [(_UIDatePickerCalendarTimeLabelAccessibility *)&v9 initWithTimeFormat:location[0] minuteInterval:a4];
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    id v7 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v12 selector:sel__accessibilityFocusChanged_ name:*MEMORY[0x263F1CDF8] object:0];
  }
  uint64_t v6 = v12;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)dealloc
{
  uint64_t v5 = self;
  SEL v4 = a2;
  [(_UIDatePickerCalendarTimeLabelAccessibility *)self _accessibilityRemoveValueForKey:@"AXInternalData"];
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5 name:*MEMORY[0x263F1CDF8] object:0];

  v3.receiver = v5;
  v3.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  [(_UIDatePickerCalendarTimeLabelAccessibility *)&v3 dealloc];
}

- (void)pushCurrentStateIntoUIAndNotify
{
  SEL v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  [(_UIDatePickerCalendarTimeLabelAccessibility *)&v2 pushCurrentStateIntoUIAndNotify];
  [(_UIDatePickerCalendarTimeLabelAccessibility *)v4 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x263F21C68]];
}

@end