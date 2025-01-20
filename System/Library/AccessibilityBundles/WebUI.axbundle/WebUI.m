id accessibilityMobileSafariLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityMobileSafariLocalizedString_axBundle;
  if (!accessibilityMobileSafariLocalizedString_axBundle)
  {
    v3 = (void *)MEMORY[0x263F086E0];
    v4 = AXAccessibilityBundlesDirectory();
    v5 = [v4 stringByAppendingPathComponent:@"MobileSafari.axbundle"];
    v6 = [v3 bundleWithPath:v5];
    v7 = (void *)accessibilityMobileSafariLocalizedString_axBundle;
    accessibilityMobileSafariLocalizedString_axBundle = v6;

    v2 = (void *)accessibilityMobileSafariLocalizedString_axBundle;
    if (!accessibilityMobileSafariLocalizedString_axBundle) {
      accessibilityMobileSafariLocalizedString_cold_1();
    }
  }
  v8 = [v2 localizedStringForKey:v1 value:&stru_26F83AA98 table:@"Accessibility"];

  return v8;
}

id accessibilitySafariServicesLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilitySafariServicesLocalizedString_axBundle;
  if (!accessibilitySafariServicesLocalizedString_axBundle)
  {
    v3 = (void *)MEMORY[0x263F086E0];
    v4 = AXAccessibilityBundlesDirectory();
    v5 = [v4 stringByAppendingPathComponent:@"SafariServices.axbundle"];
    uint64_t v6 = [v3 bundleWithPath:v5];
    v7 = (void *)accessibilitySafariServicesLocalizedString_axBundle;
    accessibilitySafariServicesLocalizedString_axBundle = v6;

    v2 = (void *)accessibilitySafariServicesLocalizedString_axBundle;
    if (!accessibilitySafariServicesLocalizedString_axBundle) {
      accessibilitySafariServicesLocalizedString_cold_1();
    }
  }
  v8 = [v2 localizedStringForKey:v1 value:&stru_26F83AA98 table:@"SafariServicesAccessibility"];

  return v8;
}

id accessibilitySafariScribbleLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilitySafariScribbleLocalizedString_axBundle;
  if (!accessibilitySafariScribbleLocalizedString_axBundle)
  {
    v3 = (void *)MEMORY[0x263F086E0];
    v4 = AXAccessibilityBundlesDirectory();
    v5 = [v4 stringByAppendingPathComponent:@"MobileSafariFramework.axbundle"];
    uint64_t v6 = [v3 bundleWithPath:v5];
    v7 = (void *)accessibilitySafariScribbleLocalizedString_axBundle;
    accessibilitySafariScribbleLocalizedString_axBundle = v6;

    v2 = (void *)accessibilitySafariScribbleLocalizedString_axBundle;
    if (!accessibilitySafariScribbleLocalizedString_axBundle) {
      accessibilitySafariScribbleLocalizedString_cold_1();
    }
  }
  v8 = [v2 localizedStringForKey:v1 value:&stru_26F83AA98 table:@"SafariScribbleAccessibility"];

  return v8;
}

void accessibilityMobileSafariLocalizedString_cold_1()
{
  __assert_rtn("accessibilityMobileSafariLocalizedString", "AXSafariBundleSharedUtilities.m", 16, "axBundle != nil");
}

void accessibilitySafariServicesLocalizedString_cold_1()
{
  __assert_rtn("accessibilitySafariServicesLocalizedString", "AXSafariBundleSharedUtilities.m", 34, "axBundle != nil");
}

void accessibilitySafariScribbleLocalizedString_cold_1()
{
  __assert_rtn("accessibilitySafariScribbleLocalizedString", "AXSafariBundleSharedUtilities.m", 53, "axBundle != nil");
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09ED8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}