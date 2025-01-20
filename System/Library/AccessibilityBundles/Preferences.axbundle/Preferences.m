id accessibilityNonLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t vars8;

  v1 = a1;
  v2 = accessibilityBundle();
  v3 = v2;
  v4 = 0;
  if (v1 && v2)
  {
    v5 = NSDictionary;
    v6 = [v2 pathForResource:@"NonLocalizedStrings" ofType:@"strings"];
    v7 = [v5 dictionaryWithContentsOfFile:v6];

    v4 = [v7 objectForKey:v1];
  }

  return v4;
}

id accessibilityBundle()
{
  v0 = (void *)accessibilityBundle_axBundle;
  if (!accessibilityBundle_axBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Preferences.axbundle"];
    v2 = (void *)accessibilityBundle_axBundle;
    accessibilityBundle_axBundle = v1;

    v0 = (void *)accessibilityBundle_axBundle;
  }

  return v0;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = accessibilityBundle();
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_26F786F08 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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