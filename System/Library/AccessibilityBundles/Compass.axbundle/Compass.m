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
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Compass.axbundle"],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6722D0 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id axCompassController()
{
  v0 = [(id)*MEMORY[0x263F1D020] keyWindow];
  v1 = [v0 rootViewController];

  return v1;
}

id axCompassPageViewController()
{
  v0 = axCompassController();
  v1 = [v0 safeValueForKey:@"_compassPageController"];

  return v1;
}

id axLevelPageViewController()
{
  v0 = axCompassController();
  v1 = [v0 safeValueForKey:@"_levelPageController"];

  return v1;
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F0A110]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x270F80A18]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x270F0A4D8]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}