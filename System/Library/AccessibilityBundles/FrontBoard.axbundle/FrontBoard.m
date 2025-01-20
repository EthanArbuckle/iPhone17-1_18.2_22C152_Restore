id localizedString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t vars8;

  v3 = a1;
  v4 = a2;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedStringForKey:v4 value:&stru_26F6A75C0 table:v3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id accessibilityLocalizedString(void *a1)
{
  return localizedString(@"Accessibility", a1);
}

uint64_t AXApplicationNameLabelForBundleIdentifier()
{
  return MEMORY[0x270F096D8]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90570]();
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