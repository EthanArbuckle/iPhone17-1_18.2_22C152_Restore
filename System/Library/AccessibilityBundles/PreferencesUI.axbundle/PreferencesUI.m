id accessibilityLocalizedString(void *a1)
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
  v3 = [v2 stringByAppendingPathComponent:@"Preferences.axbundle"];

  v4 = [MEMORY[0x263F086E0] bundleWithPath:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 localizedStringForKey:v1 value:&stru_26F78BE60 table:@"Accessibility"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id accessibilityNonLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  v2 = AXAccessibilityBundlesDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Preferences.axbundle"];

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

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09ED8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x270F09968]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}