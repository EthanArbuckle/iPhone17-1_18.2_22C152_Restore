void LoadMessageUI()
{
  void *v0;
  void *v1;

  if ((LoadedMessage & 1) == 0)
  {
    v0 = (void *)MEMORY[0x263F811C8];
    v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.messageui"];
    [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

    LoadedMessage = 1;
  }
}

id MobileCalAXLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)MobileCalAXLocalizedString_axBundle;
  if (MobileCalAXLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileCal.axbundle"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)MobileCalAXLocalizedString_axBundle,
        MobileCalAXLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)MobileCalAXLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6960F0 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.EventKitUIFramework.axbundle"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F6960F0 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityCalendarTitleForEventIfNecessary(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [MEMORY[0x263EFF9C0] set];
  uint64_t v3 = [v1 eventStore];
  v4 = [v3 calendarsForEntityType:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "source", (void)v18);
        if ([v11 sourceType] == 5)
        {
        }
        else
        {
          char v12 = [v10 isSubscribedHolidayCalendar];

          if ((v12 & 1) == 0) {
            [v2 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v13 = [v1 calendar];
  if ([v2 containsObject:v13] && (unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v16 = 0;
  }
  else
  {
    v14 = objc_msgSend(v1, "calendar", (void)v18);
    uint64_t v15 = [v14 type];

    if (v15 == 4)
    {
      v16 = 0;
      goto LABEL_19;
    }
    v13 = [v1 calendar];
    v16 = MEMORY[0x24564B8F0]();
  }

LABEL_19:

  return v16;
}

void sub_2421036F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2421048C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242105CB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_242106B44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
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

void sub_242107650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 128));
  _Unwind_Resume(a1);
}

id getAXCustomContentClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAXCustomContentClass_softClass;
  uint64_t v7 = getAXCustomContentClass_softClass;
  if (!getAXCustomContentClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXCustomContentClass_block_invoke;
    v3[3] = &unk_26511E588;
    v3[4] = &v4;
    __getAXCustomContentClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_242107FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2421082A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

Class __getAXCustomContentClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26511E5A8;
    uint64_t v5 = 0;
    AccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityLibraryCore_frameworkLibrary) {
    __getAXCustomContentClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AXCustomContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXCustomContentClass_block_invoke_cold_2();
  }
  getAXCustomContentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_242108E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void __getAXCustomContentClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKEventDetailTitleCellAccessibility.m", 35, @"%s", *a1);

  __break(1u);
}

void __getAXCustomContentClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAXCustomContentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventDetailTitleCellAccessibility.m", 36, @"Unable to find class %s", "AXCustomContent");

  __break(1u);
  AXDateStringForFormat();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F092A0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CalDisplayStringTravelTimeAndDuration()
{
  return MEMORY[0x270EEB690]();
}

uint64_t CalDisplayedTitleForCalendar()
{
  return MEMORY[0x270EEB698]();
}

uint64_t CalRoundPointToScreenScale()
{
  return MEMORY[0x270EEB6B0]();
}

uint64_t CalShow24Hours()
{
  return MEMORY[0x270EEB6B8]();
}

uint64_t CalStringForHour()
{
  return MEMORY[0x270EEB6C0]();
}

uint64_t CalStringForMonthNumber()
{
  return MEMORY[0x270EEB6C8]();
}

uint64_t CalStringForMonthYear()
{
  return MEMORY[0x270EEB6D0]();
}

uint64_t CarImage()
{
  return MEMORY[0x270EEB6E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x270F808D0]();
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

uint64_t UIAccessibilityFrameToBounds()
{
  return MEMORY[0x270F809A0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x270F809D8]();
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

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x270F80A18]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t WalkmanImage()
{
  return MEMORY[0x270EEB6F0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityIgnoreNextNotification()
{
  return MEMORY[0x270F80AC8]();
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
  return MEMORY[0x270F09600]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F09610]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F09658]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x270F096D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}