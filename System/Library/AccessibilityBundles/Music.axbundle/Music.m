id accessibilityMusicLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityMusicLocalizedString_axBundle;
  if (accessibilityMusicLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityMusicLocalizedString_axBundle,
        accessibilityMusicLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityMusicLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F740C48 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityOasisMusicLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityOasisMusicLocalizedString_axBundle;
  if (accessibilityOasisMusicLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityOasisMusicLocalizedString_axBundle,
        accessibilityOasisMusicLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityOasisMusicLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F740C48 table:@"Accessibility-AQ"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void speakReorderItems(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v7, "section"));
  if (v8 >= 2)
  {
    uint64_t v9 = v8;
    objc_opt_class();
    v10 = [v5 cellForItemAtIndexPath:v6];
    v11 = __UIAccessibilityCastAsClass();

    if (!v11)
    {
LABEL_9:

      goto LABEL_10;
    }
    if ([v7 row] == v9 - 1)
    {
      objc_opt_class();
      v12 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section"));
      v13 = [v5 cellForItemAtIndexPath:v12];
      v14 = __UIAccessibilityCastAsClass();

      v15 = @"collection.view.reorder.after";
      if (!v14) {
        goto LABEL_8;
      }
    }
    else
    {
      objc_opt_class();
      v16 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") + 1, objc_msgSend(v7, "section"));
      v17 = [v5 cellForItemAtIndexPath:v16];
      v14 = __UIAccessibilityCastAsClass();

      v15 = @"collection.view.reorder.before";
      if (!v14)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    v18 = [v14 accessibilityLabel];
    v19 = NSString;
    v20 = accessibilityMusicLocalizedString(v15);
    v21 = objc_msgSend(v19, "stringWithFormat:", v20, v18);
    UIAccessibilitySpeak();

    goto LABEL_8;
  }
LABEL_10:
}

void speakReorderItemsTableView(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
  if (v8 >= 2)
  {
    uint64_t v9 = v8;
    objc_opt_class();
    v10 = [v5 cellForRowAtIndexPath:v6];
    v11 = __UIAccessibilityCastAsClass();

    if (!v11)
    {
LABEL_9:

      goto LABEL_10;
    }
    if ([v7 row] == v9 - 1)
    {
      objc_opt_class();
      v12 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section"));
      v13 = [v5 cellForRowAtIndexPath:v12];
      v14 = __UIAccessibilityCastAsClass();

      v15 = @"collection.view.reorder.after";
      if (!v14) {
        goto LABEL_8;
      }
    }
    else
    {
      objc_opt_class();
      v16 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") + 1, objc_msgSend(v7, "section"));
      v17 = [v5 cellForRowAtIndexPath:v16];
      v14 = __UIAccessibilityCastAsClass();

      v15 = @"collection.view.reorder.before";
      if (!v14)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    v18 = [v14 accessibilityLabel];
    v19 = NSString;
    v20 = accessibilityMusicLocalizedString(v15);
    v21 = objc_msgSend(v19, "stringWithFormat:", v20, v18);
    UIAccessibilitySpeak();

    goto LABEL_8;
  }
LABEL_10:
}

id accessibilityStripUnfavorableCharacters(void *a1)
{
  __int16 v6 = 183;
  id v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v1 stringWithCharacters:&v6 length:1];
  v4 = [v2 stringByReplacingOccurrencesOfString:v3 withString:@","];

  return v4;
}

void sub_24236A800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24236C4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v16 - 112));
  _Unwind_Resume(a1);
}

void sub_24236F24C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x270F80888]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09F10]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x270F0A0A8]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x270F0A120]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXPositionalStyleDurationStringForDuration()
{
  return MEMORY[0x270F0A278]();
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
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

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}