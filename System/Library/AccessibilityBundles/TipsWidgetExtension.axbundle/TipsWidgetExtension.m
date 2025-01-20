id accessibilityTipsLocalizedString(void *a1)
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
  v2 = (void *)MEMORY[0x263F086E0];
  v3 = MEMORY[0x245667880]();
  v4 = [v3 stringByAppendingPathComponent:@"Tips.axbundle"];
  v5 = [v2 bundleWithPath:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedStringForKey:v1 value:&stru_26F815658 table:@"Accessibility"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F09558]();
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