id accessibilityMobilePhoneLocalizedString(void *a1)
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
  v2 = (void *)accessibilityMobilePhoneLocalizedString_axBundle;
  if (accessibilityMobilePhoneLocalizedString_axBundle) {
    goto LABEL_3;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = MEMORY[0x245651310]();
  v5 = [v4 stringByAppendingPathComponent:@"MobilePhone.axbundle"];
  v6 = [v3 bundleWithPath:v5];
  v7 = (void *)accessibilityMobilePhoneLocalizedString_axBundle;
  accessibilityMobilePhoneLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityMobilePhoneLocalizedString_axBundle;
  if (accessibilityMobilePhoneLocalizedString_axBundle)
  {
LABEL_3:
    v8 = [v2 localizedStringForKey:v1 value:&stru_26F6D4890 table:@"Accessibility"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6D4890 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id axStringForCallParticipantsView(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [v1 safeValueForKey:@"singleCallLabelView"];
  uint64_t v3 = __UIAccessibilitySafeClass();

  v4 = [v1 safeValueForKey:@"topMultipleCallLabelView"];
  v5 = __UIAccessibilitySafeClass();

  char v26 = 0;
  v6 = [v1 safeValueForKey:@"bottomMultipleCallLabelView"];
  uint64_t v7 = __UIAccessibilitySafeClass();

  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v20 = (void *)v7;
  v21 = (void *)v3;
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v5, v7);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      v14 = v11;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v13), "safeUIViewForKey:", @"participantMarqueeLabel", v18, v19);
        v16 = [v15 accessibilityLabel];

        v18 = v16;
        v19 = @"__AXStringForVariablesSentinel";
        v11 = __UIAXStringForVariables();

        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16, v16, @"__AXStringForVariablesSentinel");
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_2421F4C58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2421F5CF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2421F6024(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2421F6E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2421F7918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 72));
  _Unwind_Resume(a1);
}

void sub_2421F9090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2421F9A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x270F0A260]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F0A320]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x270F80938]();
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x270F05EE0](path, view);
}

BOOL UIAccessibilityIsAssistiveTouchRunning(void)
{
  return MEMORY[0x270F05EF8]();
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

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x270F80A08]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F80A10]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x270F062B0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F0A408]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F062D8]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}