void sub_59F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
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

void sub_67D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
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

void sub_6DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_8110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_88F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
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

uint64_t CHCacheIndexForDate(void *a1)
{
  uint64_t v1 = CHCacheIndexForDate_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CHCacheIndexForDate_onceToken, &__block_literal_global_500);
  }
  v3 = _HKActivityCacheDateComponentsFromDate();

  uint64_t v4 = _HKCacheIndexFromDateComponents();
  return v4;
}

void sub_ABF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
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

id accessibilityHKUnitForTrendType(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v2 = +[HKUnit kilocalorieUnit];
      goto LABEL_7;
    case 1:
      uint64_t v2 = +[HKUnit minuteUnit];
      goto LABEL_7;
    case 2:
    case 4:
    case 5:
      uint64_t v2 = +[HKUnit countUnit];
      goto LABEL_7;
    case 3:
      uint64_t v2 = +[HKUnit meterUnit];
LABEL_7:
      uint64_t v1 = (void *)v2;
      break;
    case 6:
      v3 = +[HKUnit literUnitWithMetricPrefix:4];
      uint64_t v4 = +[HKUnit gramUnitWithMetricPrefix:9];
      v5 = +[HKUnit minuteUnit];
      v6 = [v3 unitDividedByUnit:v4];
      uint64_t v1 = [v6 unitDividedByUnit:v5];

      goto LABEL_9;
    case 7:
    case 8:
      v3 = +[HKUnit meterUnitWithMetricPrefix:9];
      uint64_t v4 = +[HKUnit hourUnit];
      uint64_t v1 = [v3 unitDividedByUnit:v4];
LABEL_9:

      break;
    default:
      break;
  }

  return v1;
}

id accessibilityFitnessStringForDate(void *a1, uint64_t a2)
{
  id v3 = a1;
  char v23 = 0;
  objc_opt_class();
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  id v4 = v3;
  AXPerformSafeBlock();
  id v5 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  v6 = __UIAccessibilityCastAsClass();

  if (v23) {
    abort();
  }
  [v6 _activeEnergyCompletionPercentage];
  if (v7 >= 0.0
    && ([v6 safeDoubleForKey:@"_exerciseTimeCompletionPercentage"], v8 >= 0.0)
    && ([v6 _standHoursCompletionPercentage], v9 >= 0.0))
  {
    [v6 _activeEnergyCompletionPercentage];
    double v13 = v12;
    [v6 safeDoubleForKey:@"_exerciseTimeCompletionPercentage"];
    double v15 = v14;
    [v6 _standHoursCompletionPercentage];
    v10 = [v6 _fitnessUIAccessibilityDescriptionForPercentages:a2 exercisingPercentage:v13 standingPercentage:v15 arePercentagesCapped:v16];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_B004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __accessibilityFitnessStringForDate_block_invoke(uint64_t a1)
{
  id v5 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  uint64_t v2 = [v5 activitySummaryForCacheIndex:CHCacheIndexForDate(*(void **)(a1 + 32))];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 localizedStringForKey:v1 value:&stru_1A620 table:@"Accessibility"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id accessibilityDescriptionForPercentages(int a1, double a2, double a3, double a4)
{
  if (a2 != 1.0 || a3 != 1.0 || a4 != 1.0 || a1 == 0)
  {
    char v8 = a1;
    double v9 = fmax(a3, 0.0);
    if (fmax(a2, 0.0) == 1.0 && (a1 & 1) != 0)
    {
      uint64_t v10 = accessibilityLocalizedString(@"lifestyle.goal.completed");
    }
    else
    {
      uint64_t v10 = UIAXFormatFloatWithPercentage();
    }
    double v12 = (void *)v10;
    double v13 = fmax(a4, 0.0);
    if (v9 == 1.0 && (v8 & 1) != 0)
    {
      uint64_t v14 = accessibilityLocalizedString(@"lifestyle.goal.completed");
    }
    else
    {
      uint64_t v14 = UIAXFormatFloatWithPercentage();
    }
    double v15 = (void *)v14;
    if (v13 == 1.0 && (v8 & 1) != 0)
    {
      uint64_t v16 = accessibilityLocalizedString(@"lifestyle.goal.completed");
    }
    else
    {
      uint64_t v16 = UIAXFormatFloatWithPercentage();
    }
    uint64_t v17 = (void *)v16;
    v18 = accessibilityLocalizedString(@"lifestyle.calories.burned");
    uint64_t v19 = accessibilityLocalizedString(@"lifestyle.active.minutes");
    if (_userIsWheelchairUserWithVoiceOverOn()) {
      v20 = @"lifestyle.active.hours.wheelchair.roll";
    }
    else {
      v20 = @"lifestyle.active.hours";
    }
    id v22 = accessibilityLocalizedString(v20);
    v11 = __UIAXStringForVariables();
  }
  else
  {
    v11 = accessibilityLocalizedString(@"lifestyle.all.goals.completed");
  }

  return v11;
}

id accessibilityLocalizedStringForAchievement(void *a1)
{
  id v1 = a1;
  if (accessibilityLocalizedStringForAchievement_onceToken != -1) {
    dispatch_once(&accessibilityLocalizedStringForAchievement_onceToken, &__block_literal_global_538);
  }
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [(id)accessibilityLocalizedStringForAchievement_AXAchievementLocalizationProvider titleForAchievement:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void __accessibilityLocalizedStringForAchievement_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)ACHAchievementLocalizationProvider);
  uint64_t v2 = (void *)accessibilityLocalizedStringForAchievement_AXAchievementLocalizationProvider;
  accessibilityLocalizedStringForAchievement_AXAchievementLocalizationProvider = (uint64_t)v1;

  uint64_t v3 = FIUICopyUserFirstNameFromAddressBook();
  [(id)accessibilityLocalizedStringForAchievement_AXAchievementLocalizationProvider setName:v3];

  uint64_t IsWheelchairUserWithVoiceOverOn = _userIsWheelchairUserWithVoiceOverOn();
  id v5 = (void *)accessibilityLocalizedStringForAchievement_AXAchievementLocalizationProvider;

  [v5 setWheelchairUser:IsWheelchairUserWithVoiceOverOn];
}

id accessibilityAttributedStringForPaceContainingString(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (([v1 containsString:@"--"] & 1) != 0
      || [v1 containsString:@"––"])
    {
      id v2 = objc_alloc((Class)AXAttributedString);
      uint64_t v3 = accessibilityLocalizedString(@"no.data");
      id v4 = [v2 initWithString:v3];
    }
    else
    {
      uint64_t v3 = objc_opt_new();
      if (accessibilityAttributedStringForPaceContainingString_onceToken != -1) {
        dispatch_once(&accessibilityAttributedStringForPaceContainingString_onceToken, &__block_literal_global_555);
      }
      id v5 = objc_msgSend((id)accessibilityAttributedStringForPaceContainingString_paceExpression, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
      v6 = v5;
      if (v5 && [v5 numberOfRanges] == (char *)&dword_0 + 3)
      {
        id v7 = [v6 rangeAtIndex:0];
        uint64_t v9 = v8;
        id v10 = [v6 rangeAtIndex:1];
        uint64_t v12 = v11;
        id v13 = [v6 rangeAtIndex:2];
        uint64_t v15 = v14;
        uint64_t v16 = objc_msgSend(v1, "substringWithRange:", v10, v12);
        LODWORD(v12) = [v16 intValue];

        uint64_t v17 = objc_msgSend(v1, "substringWithRange:", v13, v15);
        LODWORD(v13) = [v17 intValue];

        v18 = +[NSNumber numberWithInt:(int)((double)(int)v13 + (double)(int)v12 * 60.0)];
        uint64_t v19 = [v3 stringFromNumber:v18];

        if (v19) {
          v20 = (__CFString *)v19;
        }
        else {
          v20 = &stru_1A620;
        }
        v21 = objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", v7, v9, v20);
        id v22 = objc_msgSend(v21, "rangeOfString:options:range:", v20, 0, v7, -[__CFString length](v20, "length"));
        uint64_t v24 = v23;
        id v4 = [objc_alloc((Class)AXAttributedString) initWithString:v21];
        objc_msgSend(v4, "setAttribute:forKey:withRange:", &__kCFBooleanTrue, UIAccessibilityTokenDurationTimeMMSS, v22, v24);
      }
      else
      {
        id v4 = [objc_alloc((Class)AXAttributedString) initWithString:v1];
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __accessibilityAttributedStringForPaceContainingString_block_invoke(id a1)
{
  accessibilityAttributedStringForPaceContainingString_paceExpression = +[NSRegularExpression regularExpressionWithPattern:@"(\\d+)'\\s?([0-5]?[0-9])(?:''|\")" options:0 error:0];

  _objc_release_x1();
}

uint64_t _userIsWheelchairUserWithVoiceOverOn()
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = ___userIsWheelchairUserWithVoiceOverOn_block_invoke_2;
    v4[3] = &unk_18648;
    id v5 = &__block_literal_global_567;
    v6 = &v7;
    if (_userIsWheelchairUserWithVoiceOverOn_onceToken != -1) {
      dispatch_once(&_userIsWheelchairUserWithVoiceOverOn_onceToken, v4);
    }
    if (!*((unsigned char *)v8 + 24))
    {
      v0 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___userIsWheelchairUserWithVoiceOverOn_block_invoke_3;
      block[3] = &unk_18670;
      uint64_t v3 = &__block_literal_global_567;
      dispatch_async(v0, block);
    }
    _Block_object_dispose(&v7, 8);
  }
  return _userIsWheelchairUserWithVoiceOverOn___isWheelchair;
}

void ___userIsWheelchairUserWithVoiceOverOn_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)HKHealthStore);
  uint64_t v4 = 0;
  id v2 = [v1 wheelchairUseWithError:&v4];
  uint64_t v3 = v2;
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

void sub_C69C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
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

void sub_C8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_CE84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_DC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_DFD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXCFormattedString()
{
  return _AXCFormattedString();
}

uint64_t AXDateFromStringWithFormat()
{
  return _AXDateFromStringWithFormat();
}

uint64_t AXDateStringForFormat()
{
  return _AXDateStringForFormat();
}

uint64_t AXFormatFloat()
{
  return _AXFormatFloat();
}

uint64_t AXLabelForElements()
{
  return _AXLabelForElements();
}

uint64_t AXLocalizeDurationTime()
{
  return _AXLocalizeDurationTime();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t FIUICopyUserFirstNameFromAddressBook()
{
  return _FIUICopyUserFirstNameFromAddressBook();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t UIAXFormatFloatWithPercentage()
{
  return _UIAXFormatFloatWithPercentage();
}

uint64_t UIAXLabelForElements()
{
  return _UIAXLabelForElements();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  return _UIAccessibilityConvertFrameToScreenCoordinates(rect, view);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return __HKActivityCacheDateComponentsFromDate();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return __HKCacheIndexFromDateComponents();
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

uint64_t __UIAccessibilitySafeClass()
{
  return ___UIAccessibilitySafeClass();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend__accessibilityCirclePathBasedOnBoundsWidth(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityCirclePathBasedOnBoundsWidth];
}

id objc_msgSend__accessibilityGraphData(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityGraphData];
}

id objc_msgSend__accessibilityLabelAttribute(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLabelAttribute];
}

id objc_msgSend__accessibilityLoadAccessibilityInformation(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLoadAccessibilityInformation];
}

id objc_msgSend__accessibilityNumberOfSlices(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityNumberOfSlices];
}

id objc_msgSend__accessibilityTimeIntervalPerSlice(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityTimeIntervalPerSlice];
}

id objc_msgSend__accessibilityUpdateCurrentPresentedView(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityUpdateCurrentPresentedView];
}

id objc_msgSend__accessibilityViewIsVisible(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityViewIsVisible];
}

id objc_msgSend__activeEnergyCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 _activeEnergyCompletionPercentage];
}

id objc_msgSend__axAnnotateAchievementView(void *a1, const char *a2, ...)
{
  return [a1 _axAnnotateAchievementView];
}

id objc_msgSend__axDateInterval(void *a1, const char *a2, ...)
{
  return [a1 _axDateInterval];
}

id objc_msgSend__axElements(void *a1, const char *a2, ...)
{
  return [a1 _axElements];
}

id objc_msgSend__axLabelForAchievementLabel(void *a1, const char *a2, ...)
{
  return [a1 _axLabelForAchievementLabel];
}

id objc_msgSend__standHoursCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 _standHoursCompletionPercentage];
}

id objc_msgSend_accessibilityActivationPoint(void *a1, const char *a2, ...)
{
  return [a1 accessibilityActivationPoint];
}

id objc_msgSend_accessibilityContainer(void *a1, const char *a2, ...)
{
  return [a1 accessibilityContainer];
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 accessibilityElements];
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return [a1 accessibilityFrame];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return [a1 accessibilityTraits];
}

id objc_msgSend_accessibilityUserDefinedLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityUserDefinedLabel];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityValue];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return [a1 countUnit];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hourUnit(void *a1, const char *a2, ...)
{
  return [a1 hourUnit];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_meterUnit(void *a1, const char *a2, ...)
{
  return [a1 meterUnit];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_minuteUnit(void *a1, const char *a2, ...)
{
  return [a1 minuteUnit];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return [a1 numberOfRanges];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return [a1 quantity];
}

id objc_msgSend_rightBarButtonItems(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItems];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceRevision(void *a1, const char *a2, ...)
{
  return [a1 sourceRevision];
}

id objc_msgSend_standaloneWeekdaySymbols(void *a1, const char *a2, ...)
{
  return [a1 standaloneWeekdaySymbols];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_weekdaySymbols(void *a1, const char *a2, ...)
{
  return [a1 weekdaySymbols];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUse];
}

id objc_msgSend_workoutActivityType(void *a1, const char *a2, ...)
{
  return [a1 workoutActivityType];
}