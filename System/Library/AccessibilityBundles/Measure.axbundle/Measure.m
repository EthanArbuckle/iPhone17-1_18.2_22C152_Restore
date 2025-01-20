id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6F8430 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id AXMeasureAccessibilityStateObserver()
{
  objc_opt_class();
  v0 = [(id)MEMORY[0x245653970](@"Measure.AccessibilityStateObserver") safeValueForKey:@"shared"];
  v1 = __UIAccessibilityCastAsSafeCategory();

  return v1;
}

id AXMeasureLabelView()
{
  objc_opt_class();
  v0 = AXMeasureViewController();
  v1 = [v0 safeValueForKey:@"labelView"];
  v2 = __UIAccessibilityCastAsSafeCategory();

  return v2;
}

id AXMeasureViewController()
{
  if (AXDeviceIsPad())
  {
    v0 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
    v1 = [v0 rootViewController];
    v2 = __UIAccessibilitySafeClass();

    [v2 safeArrayForKey:@"viewControllers"];
  }
  else
  {
    v2 = AXMeasureTabBarController();
    [v2 viewControllers];
  v3 = };
  v4 = [v3 firstObject];

  return v4;
}

id AXMeasureReticleView()
{
  objc_opt_class();
  v0 = AXMeasureViewController();
  v1 = [v0 safeValueForKey:@"reticleView"];
  v2 = __UIAccessibilityCastAsSafeCategory();

  return v2;
}

id AXMeasureTabBarController()
{
  v0 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
  v1 = [v0 rootViewController];
  v2 = __UIAccessibilitySafeClass();

  objc_opt_class();
  v3 = [v2 safeArrayForKey:@"viewControllers"];
  v4 = [v3 firstObject];
  v5 = __UIAccessibilityCastAsClass();

  return v5;
}

id AXMeasureSpeakableDescriptionForLastSavedMeasurement()
{
  v0 = AXMeasureLabelView();
  v1 = [v0 _accessibilityLastSavedMeasurementString];

  return v1;
}

id AXMeasureSpeakableDescriptionForCurrentMeasurement()
{
  v0 = AXMeasureLabelView();
  v1 = [v0 _accessibilityCurrentMeasurementString];

  return v1;
}

uint64_t AXMeasureIsMeasuring()
{
  v0 = AXMeasureTabBarController();
  uint64_t v1 = [v0 selectedIndex];

  if (v1) {
    return 0;
  }
  v3 = AXMeasureAccessibilityStateObserver();
  uint64_t v4 = [v3 axIsModeForMeasuring];

  return v4;
}

void AXMeasureSpeakMeasurementAnnouncement(void *a1)
{
  id v2 = a1;
  id v1 = v2;
  AXPerformBlockOnMainThread();
}

void __AXMeasureSpeakMeasurementAnnouncement_block_invoke(uint64_t a1)
{
  if (AXMeasureIsMeasuring())
  {
    UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
    v3 = *(void **)(a1 + 32);
    UIAccessibilityPostNotification(v2, v3);
  }
}

void AXMeasureAnnounceUpdatedMeasurement(void *a1, void *a2)
{
  id v3 = a1;
  id v6 = a2;
  id v4 = v6;
  id v5 = v3;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __AXMeasureAnnounceUpdatedMeasurement_block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v2 = AXMeasureAccessibilityStateObserver();
  char v3 = [v2 axHasConfirmedRectangle];

  if (!*(unsigned char *)(a1 + 48) && (v3 & 1) == 0)
  {
    id v4 = AXMeasureAccessibilityStateObserver();
    id v7 = [v4 axDescriptionForNumberOfPointsAndLines];

    id v5 = v7;
    if (v7)
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v6 = [NSString localizedStringWithFormat:v7];

        id v5 = (id)v6;
      }
    }
    else
    {
      id v5 = *(id *)(a1 + 32);
    }
    id v8 = v5;
    AXMeasureSpeakMeasurementAnnouncement(v5);
  }
}

void AXMeasureDidPotentiallyShowCardViewWithAncestorClass(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = MEMORY[0x245653970](@"Measure.CardTitleView");
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = [MEMORY[0x263F1CBC8] keyWindow];
      id v5 = [v4 _accessibilityDescendantOfType:a1];
      uint64_t v6 = [v5 _accessibilityDescendantOfType:v3];
      id argument = [v6 safeUIViewForKey:@"title"];

      if (argument)
      {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
      }
    }
  }
}

void sub_24226FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_24227136C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_2422713B8()
{
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F0A110]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F0A1B8]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F0A250]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x270F80A18]();
}

uint64_t UIAccessibilitySpeakOrQueueIfNeeded()
{
  return MEMORY[0x270F80A20]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x270F06200]();
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

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}