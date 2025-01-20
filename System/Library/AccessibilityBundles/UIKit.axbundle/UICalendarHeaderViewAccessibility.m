@interface UICalendarHeaderViewAccessibility
@end

@implementation UICalendarHeaderViewAccessibility

void __60___UICalendarHeaderViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v2 headerViewDidStepForward:*(void *)(a1 + 32)];
}

void __60___UICalendarHeaderViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v2 headerViewDidStepBackward:*(void *)(a1 + 32)];
}

void __59___UICalendarHeaderViewAccessibility_setExpanded_animated___block_invoke(uint64_t a1)
{
  v9[2] = (id)a1;
  v9[1] = (id)a1;
  char v8 = 0;
  objc_opt_class();
  id v3 = (id)[*(id *)(a1 + 32) _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v7 = (id)__UIAccessibilityCastAsSafeCategory();

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  if (v6) {
    [v9[0] _accessibilityClearChildren];
  }
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
  char v4 = 0;
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_monthYearButton"];
    char v4 = 1;
    UIAccessibilityPostNotification(notification, v5);
  }
  else
  {
    UIAccessibilityPostNotification(notification, *(id *)(a1 + 32));
  }
  if (v4) {

  }
  objc_storeStrong(v9, 0);
}

id __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v6 = 0;
  char v4 = 0;
  if ([WeakRetained safeBoolForKey:@"isExpanded"])
  {
    id v7 = accessibilityLocalizedString(@"calendar.hide.year.picker");
    char v6 = 1;
    id v1 = v7;
  }
  else
  {
    id v5 = accessibilityLocalizedString(@"calendar.show.year.picker");
    char v4 = 1;
    id v1 = v5;
  }
  char v8 = v1;
  if (v4) {

  }
  if (v6) {

  }
  return v8;
}

__CFString *__60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isExpanded"]) {
    id v1 = @"DatePicker.Hide";
  }
  else {
    id v1 = @"DatePicker.Show";
  }
  char v4 = v1;

  return v4;
}

id __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained accessibilityValue];

  return v3;
}

double __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained safeUIViewForKey:@"_monthYearLabel"];
  [v3 accessibilityActivationPoint];
  double v5 = v1;

  return v5;
}

@end