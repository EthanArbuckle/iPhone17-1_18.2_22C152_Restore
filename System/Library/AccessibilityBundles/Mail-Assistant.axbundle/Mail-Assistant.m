__CFString *accessibilityMobileMailLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v1 = a1;
  v2 = (void *)accessibilityMobileMailLocalizedString_axBundle;
  if (accessibilityMobileMailLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/AccessibilityBundles/MobileMail.axbundle"], v3 = objc_claimAutoreleasedReturnValue(), v4 = (void *)accessibilityMobileMailLocalizedString_axBundle, accessibilityMobileMailLocalizedString_axBundle = v3, v4, (v2 = (void *)accessibilityMobileMailLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6DBC48 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &stru_26F6DBC48;
  }
  v7 = v6;

  return v7;
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}