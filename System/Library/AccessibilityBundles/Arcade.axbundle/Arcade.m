id accessibilityAppStoreLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityAppStoreLocalizedString_axBundle;
  if (accessibilityAppStoreLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityAppStoreLocalizedString_axBundle,
        accessibilityAppStoreLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityAppStoreLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F61CF50 table:@"AppStore3Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

__CFString *accessibilityAppStorePrefixForTarget()
{
  return @"Arcade";
}

void sub_241F14A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_241F14BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241F16428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_241F1762C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241F1ABBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x270F09810]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x270F808D0]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAXStarRatingStringForRatingWithGranularity()
{
  return MEMORY[0x270F80928]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x270F09968]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void abort(void)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}