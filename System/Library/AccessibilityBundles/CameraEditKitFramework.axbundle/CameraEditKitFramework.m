id accessibilityCameraEditKitD2xLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityCameraEditKitD2xLocalizedString_axBundle;
  if (accessibilityCameraEditKitD2xLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityCameraEditKitD2xLocalizedString_axBundle,
        accessibilityCameraEditKitD2xLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityCameraEditKitD2xLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F4014F8 table:@"CameraEditKitAccessibility-d2x"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityCameraEditKitV2LocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityCameraEditKitV2LocalizedString_axBundle;
  if (accessibilityCameraEditKitV2LocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityCameraEditKitV2LocalizedString_axBundle,
        accessibilityCameraEditKitV2LocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityCameraEditKitV2LocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F4014F8 table:@"CameraEditKitAccessibility-D94"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

double AXScaledSliderValues(double a1, double a2, double a3, double a4)
{
  BOOL v4 = a4 == a2 || a4 == a3;
  if (v4 || ((double v5 = vabdd_f64(a4, a2), v6 = vabdd_f64(a3, a4), a4 + a4 == a3) ? (v7 = v5 == v6) : (v7 = 0), v7))
  {
    if (a3 > a2) {
      return (a1 - a2) / (a3 - a2) + 0.0;
    }
    return 2.22507386e-308;
  }
  double v8 = 0.0;
  if (a4 <= a2) {
    return v8;
  }
  if (a3 <= a2) {
    return 2.22507386e-308;
  }
  if (a1 >= a4)
  {
    if (a3 > a4)
    {
      double v9 = (a1 - a4) / (a3 - a4);
      double v10 = 0.0;
      goto LABEL_20;
    }
  }
  else if (a4 > a2)
  {
    double v9 = (a1 - a2) / (a4 - a2);
    double v10 = -1.0;
LABEL_20:
    double v12 = v9 + v10;
    goto LABEL_22;
  }
  double v12 = 2.22507386e-308;
LABEL_22:
  if (round(v12 * 100.0) / 100.0 == 0.0) {
    return 0.0;
  }
  else {
    return v12;
  }
}

double AXScaleSymmetricSliderValuesBetween(double a1, double a2, double a3, double a4, double a5)
{
  if (a3 <= a2) {
    return 2.22507386e-308;
  }
  else {
    return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4;
  }
}

double AXScaleAsymmetricSliderValuesBetween(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a4 <= a2) {
    return 2.22507386e-308;
  }
  if (a1 >= a3)
  {
    if (a4 > a3)
    {
      double result = (a1 - a3) * (a7 - a6) / (a4 - a3) + a6;
      goto LABEL_9;
    }
  }
  else if (a3 > a2)
  {
    double result = (a1 - a2) * (a6 - a5) / (a3 - a2) + a5;
    goto LABEL_9;
  }
  double result = 2.22507386e-308;
LABEL_9:
  if (round(result * 100.0) / 100.0 == 0.0) {
    return 0.0;
  }
  return result;
}

void sub_240192AAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_240193FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

uint64_t AXFormatFloat()
{
  return MEMORY[0x270F0A100]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t UIAXFrameForElements()
{
  return MEMORY[0x270F808E8]();
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

uint64_t UIAccessibilitySpeakOrQueueIfNeeded()
{
  return MEMORY[0x270F80A20]();
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

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F0A428]();
}

void abort(void)
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