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
    v7 = [v2 localizedStringForKey:v1 value:&stru_26F422D68 table:@"CameraUIStrings"];
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
  if (accessibilityPLServicesLocalizedString_axBundle) {
    goto LABEL_3;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = (void *)_AXSCopyPathForAccessibilityBundle();
  uint64_t v5 = [v3 bundleWithPath:v4];
  v6 = (void *)accessibilityPLServicesLocalizedString_axBundle;
  accessibilityPLServicesLocalizedString_axBundle = v5;

  v2 = (void *)accessibilityPLServicesLocalizedString_axBundle;
  if (accessibilityPLServicesLocalizedString_axBundle)
  {
LABEL_3:
    v7 = [v2 localizedStringForKey:v1 value:&stru_26F422D68 table:@"PhotoLibraryServicesStrings"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_2402192B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x270F80888]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x270F0A0B0]();
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

uint64_t VOTLogCommon()
{
  return MEMORY[0x270F0A3D8]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
}

uint64_t _AXSCopyPathForAccessibilityBundle()
{
  return MEMORY[0x270F906D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

uint64_t __UIAccessibilitySetAssociatedCopiedObject()
{
  return MEMORY[0x270F0A4A0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}