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
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6AE6D0 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityNonLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  v2 = MEMORY[0x24564E190]();
  v3 = [v2 stringByAppendingPathComponent:@"GeneralSettingsUI.axbundle"];

  v4 = [MEMORY[0x263F086E0] bundleWithPath:v3];
  v5 = v4;
  v6 = 0;
  if (v1 && v4)
  {
    v7 = NSDictionary;
    v8 = [v4 pathForResource:@"NonLocalizedStrings" ofType:@"strings"];
    v9 = [v7 dictionaryWithContentsOfFile:v8];

    v6 = [v9 objectForKey:v1];
  }

  return v6;
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F0A320]();
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