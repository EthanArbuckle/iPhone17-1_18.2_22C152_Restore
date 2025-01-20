id accessibilityLocalizedString(void *a1)
{
  return localizedString(@"Accessibility", a1);
}

id localizedString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = (void *)localizedString_axBundle;
  if (localizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7 = (void *)localizedString_axBundle,
        localizedString_axBundle = v6,
        v7,
        (v5 = (void *)localizedString_axBundle) != 0))
  {
    v8 = [v5 localizedStringForKey:v4 value:&stru_26F6C27D8 table:v3];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id accessibilityAntimonyLocalizedString(void *a1)
{
  return localizedString(@"Accessibility-Antimony", a1);
}

id accessibilityHealthCinnamonLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityHealthCinnamonLocalizedString_axBundle;
  if (accessibilityHealthCinnamonLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] accessibilityBundleWithLastPathComponent:@"Health.axbundle"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = (void *)accessibilityHealthCinnamonLocalizedString_axBundle,
        accessibilityHealthCinnamonLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityHealthCinnamonLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6C27D8 table:@"Accessibility-Cinnamon"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_2421B9D18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x270F80938]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

void abort(void)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}