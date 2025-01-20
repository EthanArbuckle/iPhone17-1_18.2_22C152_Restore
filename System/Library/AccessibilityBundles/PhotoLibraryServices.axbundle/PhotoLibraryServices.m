id accessibilityCameraUILocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityCameraUILocalizedString_axBundle;
  if (accessibilityCameraUILocalizedString_axBundle) {
    goto LABEL_3;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = (void *)_AXSCopyPathForAccessibilityBundle();
  v5 = [v3 bundleWithPath:v4];
  v6 = (void *)accessibilityCameraUILocalizedString_axBundle;
  accessibilityCameraUILocalizedString_axBundle = v5;

  v2 = (void *)accessibilityCameraUILocalizedString_axBundle;
  if (accessibilityCameraUILocalizedString_axBundle)
  {
LABEL_3:
    v7 = [v2 localizedStringForKey:v1 value:&stru_26F421A60 table:@"CameraUI"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id accessibilityPLServicesLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityPLServicesLocalizedString_axBundle;
  if (accessibilityPLServicesLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityPLServicesLocalizedString_axBundle,
        accessibilityPLServicesLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityPLServicesLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F421A60 table:@"PhotoLibraryServicesStrings"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x270F80888]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t UIAccessibilityIsImageScreenshot()
{
  return MEMORY[0x270F097D8]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x270F097E0]();
}

uint64_t UIAccessibilityMetadataDescriptionForVideo()
{
  return MEMORY[0x270F097E8]();
}

uint64_t _AXSCopyPathForAccessibilityBundle()
{
  return MEMORY[0x270F906D0]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x270F80B08]();
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