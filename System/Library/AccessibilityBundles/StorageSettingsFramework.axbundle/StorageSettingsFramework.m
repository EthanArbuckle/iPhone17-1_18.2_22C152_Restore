id accessibilityPreferencesFrameworkBundleLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  v1 = a1;
  v2 = AXAccessibilityBundlesDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"PreferencesFramework.axbundle"];

  v4 = [MEMORY[0x263F086E0] bundleWithPath:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 localizedStringForKey:v1 value:&stru_26F7F92C0 table:@"Accessibility"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09ED8]();
}

uint64_t AXFormatByteSize()
{
  return MEMORY[0x270F0A0F8]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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