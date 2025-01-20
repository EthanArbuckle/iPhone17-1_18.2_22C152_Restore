@interface UIDatePickerContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityDatePickerComponentType;
- (unint64_t)accessibilityTraits;
@end

@implementation UIDatePickerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDatePickerContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v33 = self;
  location[1] = (id)a2;
  v31.receiver = self;
  v31.super_class = (Class)UIDatePickerContentViewAccessibility;
  location[0] = [(UIDatePickerContentViewAccessibility *)&v31 accessibilityLabel];
  if (!location[0])
  {
    id v24 = (id)[(UIDatePickerContentViewAccessibility *)v33 safeValueForKey:@"titleLabel"];
    id v2 = (id)[v24 accessibilityLabel];
    id v3 = location[0];
    location[0] = v2;
  }
  id v30 = (id)[(UIDatePickerContentViewAccessibility *)v33 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickervi.isa)];
  if (!v30)
  {
    id v34 = location[0];
    int v29 = 1;
    goto LABEL_27;
  }
  id v22 = (id)[v30 safeValueForKey:@"datePickerMode"];
  uint64_t v23 = [v22 unsignedIntValue];

  uint64_t v28 = v23;
  uint64_t v27 = [(UIDatePickerContentViewAccessibility *)v33 _accessibilityDatePickerComponentType];
  id v26 = 0;
  if (v23 == 3)
  {
    if (v27 == 32)
    {
      id v21 = (id)[v30 safeValueForKey:@"_hourLabel"];
      id v4 = (id)[v21 accessibilityLabel];
      id v5 = v26;
      id v26 = v4;
    }
    else if (v27 == 64)
    {
      id v20 = (id)[v30 safeValueForKey:@"_minuteLabel"];
      id v6 = (id)[v20 accessibilityLabel];
      id v7 = v26;
      id v26 = v6;
    }
    if (v26)
    {
      v18 = NSString;
      id v19 = accessibilityLocalizedString(@"date.picker.row.format");
      id v34 = (id)objc_msgSend(v18, "stringWithFormat:", location[0], v26);
    }
    else
    {
      id v34 = location[0];
    }
    int v29 = 1;
    goto LABEL_26;
  }
  if (!v28 || v28 == 2)
  {
    id v25 = 0;
    if (v27 == 32)
    {
      v16 = NSString;
      id v17 = accessibilityLocalizedString(@"date.picker.hours");
      id v8 = (id)[v16 stringWithFormat:location[0]];
      id v9 = v25;
      id v25 = v8;
    }
    else if (v27 == 64)
    {
      v14 = NSString;
      id v15 = accessibilityLocalizedString(@"date.picker.minutes");
      id v10 = (id)objc_msgSend(v14, "localizedStringWithFormat:", v15, objc_msgSend(location[0], "integerValue"));
      id v11 = v25;
      id v25 = v10;
    }
    if (v25) {
      objc_storeStrong(location, v25);
    }
    objc_storeStrong(&v25, 0);
    goto LABEL_25;
  }
  if (v28 != 1)
  {
LABEL_25:
    id v34 = location[0];
    int v29 = 1;
    goto LABEL_26;
  }
  id v34 = location[0];
  int v29 = 1;
LABEL_26:
  objc_storeStrong(&v26, 0);
LABEL_27:
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  v12 = v34;

  return v12;
}

- (unint64_t)_accessibilityDatePickerComponentType
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UIDatePickerContentViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickervi.isa)];
  id v13 = (id)[(UIDatePickerContentViewAccessibility *)v15 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uipickercolumn.isa)];
  id v12 = (id)[v14[0] safeValueForKey:@"_tables"];
  id v11 = (void *)[v12 indexOfObject:v13];
  uint64_t v6 = 0;
  id v7 = &v6;
  int v8 = 0x20000000;
  int v9 = 32;
  uint64_t v10 = 0;
  NSClassFromString(&cfstr_Uidatepickervi.isa);
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id)[v14[0] safeValueForKey:@"_mode"];
    v4[1] = &v6;
    v4[0] = v5;
    v4[2] = v11;
    AXPerformSafeBlock();
    objc_storeStrong(v4, 0);
    objc_storeStrong(&v5, 0);
  }
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  return v3;
}

uint64_t __77__UIDatePickerContentViewAccessibility__accessibilityDatePickerComponentType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) calendarUnitForComponent:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v10 = self;
  SEL v9 = a2;
  unint64_t v8 = 0;
  id v4 = (id)[(UIDatePickerContentViewAccessibility *)self safeValueForKey:@"titleLabel"];
  id location = (id)[v4 safeValueForKey:@"textColor"];

  id v5 = (id)[(UIDatePickerContentViewAccessibility *)v10 _accessibilityValueForKey:@"SelectedColor"];
  char v6 = UIAccessibilityColorEqualToColor();

  if (v6) {
    v8 |= *MEMORY[0x263F1CF38];
  }
  unint64_t v3 = v8;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end