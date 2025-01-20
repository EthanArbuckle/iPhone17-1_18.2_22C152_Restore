id localizedString(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t vars8;

  if (a1)
  {
    a1 = [a1 localizedStringForKey:a3 value:&stru_26F6C69B8 table:a2];
    v3 = vars8;
  }
  return a1;
}

id accessibilityHomeLocalizedString(void *a1)
{
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  v3 = AXAccessibilityBundlesDirectory();
  v4 = [v3 stringByAppendingPathComponent:@"Home.axbundle"];
  v5 = [v1 bundleWithPath:v4];
  v6 = localizedString(v5, @"Accessibility", (uint64_t)v2);

  return v6;
}

id accessibilityHomeUILocalizedString(void *a1)
{
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  v4 = localizedString(v3, @"Accessibility", (uint64_t)v2);

  return v4;
}

id accessibilityLabelForNamedWallpaper(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"interior_wallpaper"])
  {
    id v2 = @"wallpaper.description.interior";
  }
  else
  {
    if (![v1 isEqualToString:@"red_wallpaper"])
    {
      v4 = accessibilityHomeUILocalizedString(v1);
      if ([v4 isEqualToString:v1]) {
        v5 = v1;
      }
      else {
        v5 = v4;
      }
      id v3 = v5;

      goto LABEL_10;
    }
    id v2 = @"wallpaper.description.red";
  }
  accessibilityHomeUILocalizedString(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v3;
}

id accessibilityLabelForCustomWallpaper(void *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F14D18];
  v11[0] = a1;
  id v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = a1;
  v4 = [v2 arrayWithObjects:v11 count:1];
  v5 = [v1 fetchAssetsWithLocalIdentifiers:v4 options:0];

  if (v5 && [v5 count])
  {
    v6 = [v5 firstObject];
    v7 = [v6 accessibilityLabel];
    v10 = [v6 accessibilityValue];
    v8 = __AXStringForVariables();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id accessibilityLabelForIconIdentifier(uint64_t a1)
{
  id v1 = [NSString stringWithFormat:@"icons.%@", a1];
  id v2 = v1;
  if (v1)
  {
    id v3 = accessibilityHomeUILocalizedString(v1);
    if (![v3 isEqualToString:v2]) {
      goto LABEL_5;
    }
  }
  id v3 = 0;
LABEL_5:

  return v3;
}

id accessibilityLabelForBadgeType(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 8 && ((0xFDu >> v1))
  {
    v4 = off_265127F88[v1];
    id v2 = accessibilityHomeUILocalizedString(v4);
    if ([v2 isEqualToString:v4]) {
      id v3 = 0;
    }
    else {
      id v3 = v2;
    }
  }
  else
  {
    id v2 = accessibilityHomeUILocalizedString(0);
    id v3 = 0;
  }
  id v5 = v3;

  return v5;
}

id accessibilityLabelForStatusItemCategory(uint64_t a1)
{
  if (a1)
  {
    if (a1 != 1)
    {
      id v2 = accessibilityHomeUILocalizedString(0);
      id v3 = 0;
      goto LABEL_9;
    }
    uint64_t v1 = @"status.actionrequired";
  }
  else
  {
    uint64_t v1 = @"status.alarm";
  }
  id v2 = accessibilityHomeUILocalizedString(v1);
  if ([v2 isEqualToString:v1]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }
LABEL_9:
  id v4 = v3;

  return v4;
}

id _accessibilityItemAccessoryType(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  MEMORY[0x2456509F0](@"HFItem");
  if (objc_opt_isKindOfClass())
  {
    char v20 = 0;
    objc_opt_class();
    id v3 = [v1 safeValueForKey:@"accessories"];
    id v4 = __UIAccessibilityCastAsClass();

    if (v4)
    {
      id v15 = v1;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            char v20 = 0;
            objc_opt_class();
            v11 = [v10 safeValueForKeyPath:@"category.localizedDescription"];
            v12 = __UIAccessibilityCastAsClass();

            if (v20) {
              abort();
            }
            [v2 axSafelyAddObject:v12];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v7);
      }

      id v1 = v15;
    }
  }
  v13 = AXLabelForElements();

  return v13;
}

void sub_2421C9AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2421CAD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2421CC904(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
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

void sub_2421CD154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(v26);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_2421CD488(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2421CE014(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

void sub_2421CEE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_2421D32DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
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

void sub_2421D3F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_2421D40E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2421D54A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, id *a13)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v20 - 128));
  _Unwind_Resume(a1);
}

void sub_2421D7A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2421D7DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2421D9774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2421DA53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09138]();
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x270F80888]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x270F0A0A8]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXFormatMagnificationFactor()
{
  return MEMORY[0x270F09250]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x270F09278]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x270F09810]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x270EF2B98](namestr);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x270F80938]();
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

uint64_t __UIAccessibilityCastAsSwiftStruct()
{
  return MEMORY[0x270F09618]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}