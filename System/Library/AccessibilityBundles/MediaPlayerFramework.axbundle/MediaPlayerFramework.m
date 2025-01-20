id accessibilityMPLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityMPLocalizedString_axBundle;
  if (accessibilityMPLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityMPLocalizedString_axBundle,
        accessibilityMPLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityMPLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F414160 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_2401DFAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id AXLabelForMediaRoute(void *a1)
{
  id v1 = a1;
  if ([v1 isAppleTVRoute])
  {
    v2 = @"route.description.appletv";
  }
  else if ([v1 isAirpodsRoute])
  {
    v2 = @"route.description.airpods";
  }
  else if ([v1 isPowerbeatsRoute])
  {
    v2 = @"route.description.powerbeats";
  }
  else if ([v1 isBeatsSoloRoute])
  {
    v2 = @"route.description.beatssolo";
  }
  else if ([v1 isBeatsXRoute])
  {
    v2 = @"route.description.beatsx";
  }
  else if ([v1 isCarplayRoute])
  {
    v2 = @"route.description.carplay";
  }
  else if ([v1 isHomePodRoute])
  {
    v2 = @"route.description.homepod";
  }
  else if ([v1 isDeviceRoute] && objc_msgSend(v1, "routeSubtype") != 2)
  {
    v2 = @"route.description.device";
  }
  else
  {
    unint64_t v3 = [v1 routeSubtype] - 2;
    if (v3 > 0xD) {
      v2 = @"route.description.speaker";
    }
    else {
      v2 = off_2650A2DA8[v3];
    }
  }
  v4 = accessibilityLocalizedString(v2);

  return v4;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MediaPlayerFramework.axbundle"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F414160 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_2401E1CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
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

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIAXTimeStringForDuration()
{
  return MEMORY[0x270F80940]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x270F05ED8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

void abort(void)
{
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}