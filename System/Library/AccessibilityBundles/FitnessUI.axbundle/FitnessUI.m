void sub_1BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

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

void sub_1DEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_2C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

id accessibilityDescriptionForPercentages(int a1, double a2, double a3, double a4)
{
  if (a2 != 1.0 || a3 != 1.0 || a4 != 1.0 || a1 == 0)
  {
    char v8 = a1;
    double v9 = fmax(a3, 0.0);
    if (fmax(a2, 0.0) >= 1.0 && (a1 & 1) != 0)
    {
      uint64_t v10 = accessibilityLocalizedString(@"lifestyle.goal.completed");
    }
    else
    {
      uint64_t v10 = UIAXFormatFloatWithPercentage();
    }
    v12 = (void *)v10;
    double v13 = fmax(a4, 0.0);
    if (v9 >= 1.0 && (v8 & 1) != 0)
    {
      uint64_t v14 = accessibilityLocalizedString(@"lifestyle.goal.completed");
    }
    else
    {
      uint64_t v14 = UIAXFormatFloatWithPercentage();
    }
    v15 = (void *)v14;
    if (v13 >= 1.0 && (v8 & 1) != 0)
    {
      uint64_t v16 = accessibilityLocalizedString(@"lifestyle.goal.completed");
    }
    else
    {
      uint64_t v16 = UIAXFormatFloatWithPercentage();
    }
    v17 = (void *)v16;
    v18 = accessibilityLocalizedString(@"rings.description.moving");
    v19 = accessibilityLocalizedString(@"rings.description.exercising");
    if (UIAccessibilityIsVoiceOverRunning())
    {
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2020000000;
      char v32 = 0;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = ___userIsWheelchairUserWithVoiceOverOn_block_invoke_2;
      v26[3] = &unk_8540;
      v27 = &__block_literal_global_384;
      v28 = &v29;
      if (_userIsWheelchairUserWithVoiceOverOn_onceToken != -1) {
        dispatch_once(&_userIsWheelchairUserWithVoiceOverOn_onceToken, v26);
      }
      if (!*((unsigned char *)v30 + 24))
      {
        v20 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = ___userIsWheelchairUserWithVoiceOverOn_block_invoke_3;
        block[3] = &unk_8568;
        v25 = &__block_literal_global_384;
        dispatch_async(v20, block);
      }
      _Block_object_dispose(&v29, 8);
    }
    if (_userIsWheelchairUserWithVoiceOverOn___isWheelchair) {
      v21 = @"rings.description.wheelchair.rolling";
    }
    else {
      v21 = @"rings.description.standing";
    }
    v23 = accessibilityLocalizedString(v21);
    v11 = __UIAXStringForVariables();
  }
  else
  {
    v11 = accessibilityLocalizedString(@"lifestyle.all.goals.completed");
  }

  return v11;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_8F40 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t accessibilityUseImperialUnits()
{
  if (accessibilityUseImperialUnits_onceToken != -1) {
    dispatch_once(&accessibilityUseImperialUnits_onceToken, &__block_literal_global_370);
  }
  return accessibilityUseImperialUnits_useImperialUnits;
}

void __accessibilityUseImperialUnits_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)NSLengthFormatter);
  uint64_t v3 = 0;
  id v2 = [v1 unitStringFromMeters:&v3 usedUnit:1.0];
  accessibilityUseImperialUnits_useImperialUnits = (v3 & 0x500) != 0;
}

id accessibilityFormattingManager()
{
  if (accessibilityFormattingManager_onceToken != -1) {
    dispatch_once(&accessibilityFormattingManager_onceToken, &__block_literal_global_373);
  }
  v0 = (void *)accessibilityFormattingManager_FormattingManager;

  return v0;
}

void __accessibilityFormattingManager_block_invoke(id a1)
{
  id v1 = objc_alloc((Class)FIUIUnitManager);
  id v2 = accessibilityHealthStore();
  id v5 = [v1 initWithHealthStore:v2];

  id v3 = [objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v5];
  v4 = (void *)accessibilityFormattingManager_FormattingManager;
  accessibilityFormattingManager_FormattingManager = (uint64_t)v3;
}

id accessibilityHealthStore()
{
  if (accessibilityHealthStore_onceToken != -1) {
    dispatch_once(&accessibilityHealthStore_onceToken, &__block_literal_global_387);
  }
  v0 = (void *)accessibilityHealthStore_HealthStore;

  return v0;
}

id accessibilityUnitManager()
{
  if (accessibilityUnitManager_onceToken != -1) {
    dispatch_once(&accessibilityUnitManager_onceToken, &__block_literal_global_377);
  }
  v0 = (void *)accessibilityUnitManager_UnitManager;

  return v0;
}

void __accessibilityUnitManager_block_invoke(id a1)
{
  id v1 = objc_alloc((Class)FIUIUnitManager);
  accessibilityHealthStore();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v1 initWithHealthStore:v4];
  id v3 = (void *)accessibilityUnitManager_UnitManager;
  accessibilityUnitManager_UnitManager = (uint64_t)v2;
}

void ___userIsWheelchairUserWithVoiceOverOn_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)HKHealthStore);
  uint64_t v4 = 0;
  id v2 = [v1 wheelchairUseWithError:&v4];
  id v3 = v2;
  if (!v4) {
    _userIsWheelchairUserWithVoiceOverOn___isWheelchair = [v2 wheelchairUse] == (char *)&dword_0 + 2;
  }
}

uint64_t ___userIsWheelchairUserWithVoiceOverOn_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t ___userIsWheelchairUserWithVoiceOverOn_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __accessibilityHealthStore_block_invoke(id a1)
{
  accessibilityHealthStore_HealthStore = (uint64_t)objc_alloc_init((Class)HKHealthStore);

  _objc_release_x1();
}

void sub_4578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_476C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t AXClockTimeStringForDate()
{
  return _AXClockTimeStringForDate();
}

uint64_t AXFormatInteger()
{
  return _AXFormatInteger();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t AXTimeStringForType()
{
  return _AXTimeStringForType();
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t UIAXFormatFloatWithPercentage()
{
  return _UIAXFormatFloatWithPercentage();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  return _UIAccessibilityConvertFrameToScreenCoordinates(rect, view);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return _UIAccessibilityFrameForBounds();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return ___AXStringForVariables();
}

uint64_t __UIAXStringForVariables()
{
  return ___UIAXStringForVariables();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend__accessibilityChartSlices(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityChartSlices];
}

id objc_msgSend__accessibilityFrameStandardBar(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityFrameStandardBar];
}

id objc_msgSend__accessibilityFrameUniform(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityFrameUniform];
}

id objc_msgSend__accessibilityIsFKARunningForFocusItem(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityIsFKARunningForFocusItem];
}

id objc_msgSend__accessibilityLoadAccessibilityInformation(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLoadAccessibilityInformation];
}

id objc_msgSend__accessibilityNumberOfSlices(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityNumberOfSlices];
}

id objc_msgSend__accessibilityShouldUseSlices(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityShouldUseSlices];
}

id objc_msgSend__accessibilityTimeIntervalPerSlice(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityTimeIntervalPerSlice];
}

id objc_msgSend__accessibilityViewIsVisible(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityViewIsVisible];
}

id objc_msgSend__accessibleSubviews(void *a1, const char *a2, ...)
{
  return [a1 _accessibleSubviews];
}

id objc_msgSend__axUpdateAccessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 _axUpdateAccessibilityElements];
}

id objc_msgSend__axUpdateChartSlices(void *a1, const char *a2, ...)
{
  return [a1 _axUpdateChartSlices];
}

id objc_msgSend__backgroundView(void *a1, const char *a2, ...)
{
  return [a1 _backgroundView];
}

id objc_msgSend__setActiveScrollwheelIfNotActive(void *a1, const char *a2, ...)
{
  return [a1 _setActiveScrollwheelIfNotActive];
}

id objc_msgSend_accessibilityDelegate(void *a1, const char *a2, ...)
{
  return [a1 accessibilityDelegate];
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return [a1 accessibilityFrame];
}

id objc_msgSend_accessibilityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accessibilityIdentifier];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityValue];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_barPoint(void *a1, const char *a2, ...)
{
  return [a1 barPoint];
}

id objc_msgSend_barSeries(void *a1, const char *a2, ...)
{
  return [a1 barSeries];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAccessibilityUserDefinedElement(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityUserDefinedElement];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_minuteUnit(void *a1, const char *a2, ...)
{
  return [a1 minuteUnit];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sliceIndex(void *a1, const char *a2, ...)
{
  return [a1 sliceIndex];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_userActiveEnergyBurnedUnit(void *a1, const char *a2, ...)
{
  return [a1 userActiveEnergyBurnedUnit];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUse];
}

id objc_msgSend_wheelchairUseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wheelchairUseWithError:");
}