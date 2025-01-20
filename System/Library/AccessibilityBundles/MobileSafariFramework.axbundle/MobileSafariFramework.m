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
  v8 = [v2 localizedStringForKey:v1 value:&stru_26F71AB80 table:@"Accessibility"];

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
  v8 = [v2 localizedStringForKey:v1 value:&stru_26F71AB80 table:@"SafariServicesAccessibility"];

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
  v8 = [v2 localizedStringForKey:v1 value:&stru_26F71AB80 table:@"SafariScribbleAccessibility"];

  return v8;
}

void sub_2422E8AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2422E9284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422E9DF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2422EAAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422EAE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2422ECEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422ED010(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2422ED10C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2422ED208(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2422EDCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422EF5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2422EFA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422EFE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422F03CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2422F21D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2422F30CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422F3690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422F375C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
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

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x270F09FF0]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F0A110]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F0A1C8]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXProcessIsSafari()
{
  return MEMORY[0x270F0A2D0]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
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

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}