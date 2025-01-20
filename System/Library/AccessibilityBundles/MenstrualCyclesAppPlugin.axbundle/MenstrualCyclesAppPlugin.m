id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F7027B8 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _AXGetStringForDay(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v3 = [v2 isDateInYesterday:v1];
  if (v3)
  {
    accessibilityLocalizedString(@"context.yesterday");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_26F7027B8;
  }
  int v5 = [v2 isDateInToday:v1];
  if (v5)
  {
    accessibilityLocalizedString(@"context.today");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_26F7027B8;
  }
  if (([v2 isDateInTomorrow:v1] & 1) == 0)
  {
    v7 = __UIAXStringForVariables();
    if (!v5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v11 = accessibilityLocalizedString(@"context.tomorrow");
  v7 = __UIAXStringForVariables();

  if (v5) {
LABEL_11:
  }

LABEL_12:
  if (v3)
  {

    if (v7) {
      goto LABEL_14;
    }
  }
  else if (v7)
  {
LABEL_14:
    v10 = AXDateStringForFormat();
    v8 = __UIAXStringForVariables();

    goto LABEL_17;
  }
  v8 = AXDateStringForFormat();
LABEL_17:

  return v8;
}

uint64_t _AXGetStringForDayAndYear()
{
  return AXDateStringForFormat();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x270F0A3B0]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F0A428]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

void abort(void)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}