id accessibilityMobileMailLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityMobileMailLocalizedString_axBundle;
  if (accessibilityMobileMailLocalizedString_axBundle) {
    goto LABEL_3;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = NSString;
  v5 = MEMORY[0x2456554B0]();
  v6 = [v4 stringWithFormat:@"%@/%@", v5, @"MobileMail.axbundle"];
  v7 = [v3 bundleWithPath:v6];
  v8 = (void *)accessibilityMobileMailLocalizedString_axBundle;
  accessibilityMobileMailLocalizedString_axBundle = v7;

  v2 = (void *)accessibilityMobileMailLocalizedString_axBundle;
  if (accessibilityMobileMailLocalizedString_axBundle)
  {
LABEL_3:
    v9 = [v2 localizedStringForKey:v1 value:&stru_26F714DE0 table:@"Accessibility"];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
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