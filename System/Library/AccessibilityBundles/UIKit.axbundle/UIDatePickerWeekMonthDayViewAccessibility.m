@interface UIDatePickerWeekMonthDayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)_accessibilityDatePickerComponentType;
@end

@implementation UIDatePickerWeekMonthDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDatePickerWeekMonthDayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (unint64_t)_accessibilityDatePickerComponentType
{
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UIDatePickerWeekMonthDayViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickervi.isa)];
  id v13 = (id)[(UIDatePickerWeekMonthDayViewAccessibility *)v15 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uipickercolumn.isa)];
  id v12 = (id)[v14[0] safeValueForKey:@"_tables"];
  v11 = (void *)[v12 indexOfObject:v13];
  uint64_t v6 = 0;
  v7 = &v6;
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

uint64_t __82__UIDatePickerWeekMonthDayViewAccessibility__accessibilityDatePickerComponentType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) calendarUnitForComponent:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end