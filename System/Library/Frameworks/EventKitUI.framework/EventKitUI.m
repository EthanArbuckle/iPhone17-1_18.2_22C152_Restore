uint64_t EKUIOverriddenTraitsBasedOnWindowGeometryIsEnforced()
{
  return 0;
}

id CalendarAppCircleTextColor()
{
  if (CalendarAppCircleTextColor_onceToken != -1) {
    dispatch_once(&CalendarAppCircleTextColor_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)CalendarAppCircleTextColor__color;

  return v0;
}

id CalendarAppCircleNonTodayBGColor()
{
  if (CalendarAppCircleNonTodayBGColor_onceToken != -1) {
    dispatch_once(&CalendarAppCircleNonTodayBGColor_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)CalendarAppCircleNonTodayBGColor__color;

  return v0;
}

uint64_t CalInterfaceIsLeftToRight()
{
  if (CalInterfaceIsLeftToRight_onceToken != -1) {
    dispatch_once(&CalInterfaceIsLeftToRight_onceToken, &__block_literal_global_18);
  }
  return _leftToRight;
}

void sub_1B3F4FE30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CalTimeDirectionIsLeftToRight()
{
  if (CalTimeDirectionIsLeftToRight_onceToken != -1) {
    dispatch_once(&CalTimeDirectionIsLeftToRight_onceToken, &__block_literal_global_21);
  }
  return __calendarDirectionLeftToRight;
}

void sub_1B3F51268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F51D6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F51F6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CalRoundToScreenScale(double a1)
{
  if ((double)(int)a1 != a1) {
    return UIRoundToViewScale();
  }
  return result;
}

void sub_1B3F52B38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F52F20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F53708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F53910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CalendarLinkLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CalendarLinkLibraryCore_frameworkLibrary;
  uint64_t v5 = CalendarLinkLibraryCore_frameworkLibrary;
  if (!CalendarLinkLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E60884F8;
    long long v7 = *(_OWORD *)&off_1E6088508;
    v3[3] = _sl_dlopen();
    CalendarLinkLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1B3F53D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double CalRoundRectToScreenScale(double a1, double a2, double a3, double a4)
{
  double v7 = a1;
  if (a1 != (double)(int)a1)
  {
    UIRoundToViewScale();
    double v7 = v8;
  }
  if (a2 != (double)(int)a2) {
    UIRoundToViewScale();
  }
  if (a3 != (double)(int)a3) {
    UIRoundToViewScale();
  }
  if (a4 != (double)(int)a4) {
    UIRoundToViewScale();
  }
  return v7;
}

void sub_1B3F570E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double CalOnePixelInPoints()
{
  uint64_t v0 = CalOnePixelInPoints___scale;
  if (*(double *)&CalOnePixelInPoints___scale == -1.0)
  {
    *(double *)&uint64_t v0 = _EKUIScaleFactor();
    CalOnePixelInPoints___scale = v0;
  }
  return 1.0 / *(double *)&v0;
}

void sub_1B3F596F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __CalInterfaceIsLeftToRight_block_invoke()
{
  id v0 = +[EKUIApplicationExtensionOverrides shared];
  _leftToRight = [v0 layoutDirectionOrOverride] == 0;
}

BOOL EKUICurrentHeightSizeClassIsCompact(void *a1)
{
  return _EKUIActiveHeightSizeClass(a1) == 1;
}

uint64_t _EKUIActiveHeightSizeClass(void *a1)
{
  id v1 = a1;
  uint64_t v2 = EKUICurrentWindowInterfaceParadigm(v1);
  if (v2 == -1)
  {
    uint64_t v4 = _rootHierarchyForViewHierarchy(v1);
    uint64_t v3 = objc_msgSend(v4, "ekui_verticalSizeClass");
  }
  else if (v2 == 16 || v2 == 2)
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

BOOL EKUICurrentWidthSizeClassIsCompactInViewHierarchy(void *a1)
{
  return _EKUIActiveWidthSizeClass(a1) == 1;
}

BOOL EKUIShouldSaveStateInPreferences()
{
  return !EKUIDeviceCanTransform();
}

double _EKUIScaleFactor()
{
  id v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v1 = [v0 traitCollection];
  [v1 displayScale];
  double v3 = v2;

  return v3;
}

BOOL EKUIDeviceCanTransform()
{
  id v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v1 = [v0 traitCollection];
  BOOL v2 = [v1 userInterfaceIdiom] == 1;

  return v2;
}

double EKUIScaleFactor()
{
  id v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v1 = [v0 traitCollection];
  [v1 displayScale];
  double v3 = v2;

  return v3;
}

uint64_t _EKUIActiveWidthSizeClass(void *a1)
{
  id v1 = a1;
  uint64_t v2 = EKUICurrentWindowInterfaceParadigm(v1);
  if (v2 == -1)
  {
    uint64_t v4 = _rootHierarchyForViewHierarchy(v1);
    uint64_t v3 = objc_msgSend(v4, "ekui_horizontalSizeClass");
  }
  else if (v2 == 16 || v2 == 8)
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t EKUICurrentWindowInterfaceParadigm(void *a1)
{
  id v1 = a1;
  double v2 = EKUICurrentWindowSize(v1);
  uint64_t v4 = EKUIWindowInterfaceParadigmForWindowSize(v1, v2, v3);

  return v4;
}

double EKUICurrentWindowSize(void *a1)
{
  id v1 = _rootHierarchyForViewHierarchy(a1);
  objc_msgSend(v1, "ekui_size");
  double v3 = v2;

  return v3;
}

id _rootHierarchyForViewHierarchy(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v2 = v1;
LABEL_4:
    double v3 = v2;
    goto LABEL_5;
  }
  double v7 = objc_msgSend(v1, "ekui_rootViewHierarchy");

  if (v7)
  {
    objc_msgSend(v1, "ekui_rootViewHierarchy");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  double v8 = +[SizeContext sharedInstance];
  double v3 = [v8 viewHierarchyForCurrentContext];

LABEL_5:
  if (_shouldAssertOnUnknownWindow_onceToken != -1) {
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_49);
  }
  if (_shouldAssertOnUnknownWindow_shouldAssert)
  {
    if (!v3) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"EKUIDeviceCapabilities assertion failed: %@", @"_windowForView: Unable to find window: is the view not connected to a view hierarchy?" format];
    }
    goto LABEL_11;
  }
  if (v3)
  {
LABEL_11:
    id v4 = v3;
    goto LABEL_12;
  }
  EKUIMainWindowForMultiwindowError();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  uint64_t v5 = v4;

  return v5;
}

uint64_t EKUIWindowInterfaceParadigmForWindowSize(void *a1, double a2, double a3)
{
  id v5 = a1;
  int v6 = EKUIWindowSizeParadigmForWindowSize(a2, a3);
  if (!v5 && (v6 & 0x154400BE) != 0)
  {
    uint64_t v7 = 2;
    goto LABEL_31;
  }
  if (!v5 && (v6 & 0x140) != 0)
  {
    uint64_t v7 = 4;
    goto LABEL_31;
  }
  if (!v5 && (v6 & 0x22880400) != 0)
  {
    uint64_t v7 = 8;
    goto LABEL_31;
  }
  if ((*(void *)&v6 & 0x31FA00) != 0 && v5 == 0) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5)
  {
    v9 = _rootHierarchyForViewHierarchy(v5);
    if (objc_msgSend(v9, "ekui_horizontalSizeClass") == 1)
    {
      uint64_t v10 = objc_msgSend(v9, "ekui_verticalSizeClass");
      if (v10 == 2) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = -1;
      }
      BOOL v12 = v10 == 1;
      uint64_t v13 = 4;
    }
    else
    {
      if (objc_msgSend(v9, "ekui_horizontalSizeClass") != 2)
      {
        uint64_t v7 = -1;
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v14 = objc_msgSend(v9, "ekui_verticalSizeClass");
      uint64_t v11 = 16;
      if (v14 != 2) {
        uint64_t v11 = -1;
      }
      BOOL v12 = v14 == 1;
      uint64_t v13 = 8;
    }
    if (v12) {
      uint64_t v7 = v13;
    }
    else {
      uint64_t v7 = v11;
    }
    goto LABEL_30;
  }
LABEL_31:

  return v7;
}

uint64_t EKUIWindowSizeParadigmForWindowSize(double a1, double a2)
{
  if (a1 + -1764.0 > -0.001) {
    return 0x40000000;
  }
  if (a1 + -1366.0 > -0.001) {
    return 0x4000;
  }
  if (a1 + -1194.0 > -0.001) {
    return 0x200000;
  }
  if (a1 + -1112.0 > -0.001) {
    return 0x10000;
  }
  if (a1 + -1024.0 > -0.001)
  {
    BOOL v3 = a2 + -1366.0 <= -0.001;
    uint64_t v4 = 4096;
    uint64_t v5 = 0x2000;
    goto LABEL_11;
  }
  if (a1 + -956.0 > -0.001 && 440.0 - a2 > -0.001 || a1 + -932.0 > -0.001 && 430.0 - a2 > -0.001) {
    return 0x20000000;
  }
  if (a1 + -926.0 > -0.001 && 428.0 - a2 > -0.001) {
    return 0x2000000;
  }
  double v6 = 414.0 - a2;
  if (a1 + -896.0 > -0.001 && v6 > -0.001) {
    return 0x80000;
  }
  if (a1 + -874.0 > -0.001 && 402.0 - a2 > -0.001 || a1 + -852.0 > -0.001 && 393.0 - a2 > -0.001) {
    return 0x8000000;
  }
  if (a1 + -844.0 > -0.001 && 390.0 - a2 > -0.001) {
    return 0x800000;
  }
  if (a1 + -834.0 > -0.001)
  {
    BOOL v3 = a2 + -1194.0 <= -0.001;
    uint64_t v4 = 0x8000;
    uint64_t v5 = 0x100000;
    goto LABEL_11;
  }
  if (a1 + -768.0 > -0.001) {
    return 2048;
  }
  if (a1 + -736.0 > -0.001 && v6 > -0.001) {
    return 1024;
  }
  uint64_t result = 512;
  if (a1 + -700.0 <= -0.001 && a1 + -678.0 <= -0.001)
  {
    uint64_t result = 256;
    if (a1 + -667.0 <= -0.001 && a1 + -568.0 <= -0.001)
    {
      if (a1 + -512.0 > -0.001) {
        return 128;
      }
      if (a1 + -480.0 > -0.001) {
        return 64;
      }
      BOOL v7 = a1 + -440.0 > -0.001;
      if (956.0 - a2 <= -0.001) {
        BOOL v7 = 0;
      }
      uint64_t result = 0x10000000;
      if (a1 + -430.0 <= -0.001 && !v7)
      {
        if (a1 + -428.0 > -0.001) {
          return 0x1000000;
        }
        if (a1 + -414.0 > -0.001)
        {
          BOOL v3 = a2 + -896.0 <= -0.001;
          uint64_t v4 = 32;
          uint64_t v5 = 0x40000;
LABEL_11:
          if (v3) {
            return v4;
          }
          else {
            return v5;
          }
        }
        BOOL v8 = a1 + -402.0 > -0.001;
        if (874.0 - a2 <= -0.001) {
          BOOL v8 = 0;
        }
        uint64_t result = 0x4000000;
        if (a1 + -393.0 <= -0.001 && !v8)
        {
          if (a1 + -390.0 > -0.001) {
            return 0x400000;
          }
          if (a1 + -375.0 <= -0.001)
          {
            if (a1 + -320.0 <= -0.001) {
              return -1;
            }
            if (a2 + -768.0 > -0.001) {
              return 8;
            }
            BOOL v3 = a2 + -568.0 <= -0.001;
            uint64_t v4 = 2;
            uint64_t v5 = 4;
            goto LABEL_11;
          }
          if (vabdd_f64(812.0, a2) >= 2.22044605e-16) {
            return 16;
          }
          else {
            return 0x20000;
          }
        }
      }
    }
  }
  return result;
}

uint64_t EKUIUseLargeFormatPhoneUI()
{
  id v0 = +[EKUIApplicationExtensionOverrides shared];
  id v1 = [v0 viewHierarchyOrOverride];

  uint64_t v2 = EKUICurrentWindowSizeParadigmForViewHierarchy(v1);
  uint64_t result = 1;
  if (v2 > 0xFFFFFF)
  {
    if (v2 > 0x7FFFFFF)
    {
      BOOL v4 = v2 == 0x8000000 || v2 == 0x10000000;
      uint64_t v5 = 0x20000000;
    }
    else
    {
      BOOL v4 = v2 == 0x1000000 || v2 == 0x2000000;
      uint64_t v5 = 0x4000000;
    }
    if (!v4 && v2 != v5) {
      return 0;
    }
  }
  else if (v2 >= 0x80000)
  {
    if (v2 != 0x80000 && v2 != 0x400000 && v2 != 0x800000) {
      return 0;
    }
  }
  else if (v2 != 32 && v2 != 1024 && v2 != 0x40000)
  {
    return 0;
  }
  return result;
}

id EKUIMainWindowForMultiwindowError()
{
  id v0 = +[EKUIApplicationExtensionOverrides shared];
  id v1 = [v0 viewHierarchyOrOverride];

  return v1;
}

uint64_t EKUICurrentWindowSizeParadigmForViewHierarchy(void *a1)
{
  id v1 = a1;
  double v2 = EKUICurrentWindowWidthWithViewHierarchy(v1);
  double v3 = EKUICurrentWindowHeightWithViewHierarchy(v1);

  return EKUIWindowSizeParadigmForWindowSize(v2, v3);
}

double EKUICurrentWindowWidthWithViewHierarchy(void *a1)
{
  id v1 = _rootHierarchyForViewHierarchy(a1);
  objc_msgSend(v1, "ekui_width");
  double v3 = v2;

  return v3;
}

double EKUICurrentWindowHeightWithViewHierarchy(void *a1)
{
  id v1 = _rootHierarchyForViewHierarchy(a1);
  objc_msgSend(v1, "ekui_height");
  double v3 = v2;

  return v3;
}

BOOL EKUICurrentWidthSizeClassIsRegularInViewHierarchy(void *a1)
{
  return _EKUIActiveWidthSizeClass(a1) == 2;
}

void sub_1B3F5D204(_Unwind_Exception *a1)
{
}

void sub_1B3F5D320(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double CalCeilToScreenScale(double a1)
{
  uint64_t v2 = CalCeilToScreenScale___scale;
  if (*(double *)&CalCeilToScreenScale___scale == -1.0)
  {
    *(double *)&uint64_t v2 = _EKUIScaleFactor();
    CalCeilToScreenScale___scale = v2;
  }
  if (a1 != 0.0) {
    return ceil(*(double *)&v2 * a1) / *(double *)&v2;
  }
  return a1;
}

void EKUIMultiwindowAssert(char a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  if (_shouldAssertOnUnknownWindow_onceToken != -1) {
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_49);
  }
  if (_shouldAssertOnUnknownWindow_shouldAssert)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
    if ((a1 & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"EKUIDeviceCapabilities assertion failed: %@", v11 format];
    }
  }
}

void EKUIPushFallbackSizingContextWithViewHierarchy(void *a1)
{
  id v16 = a1;
  if (v16)
  {
    EKUIMultiwindowAssert(1, @"Attempt to push nil window as fallback sizing context", v1, v2, v3, v4, v5, v6, v15);
    BOOL v7 = +[SizeContext sharedInstance];
    [v7 pushContextWithViewHierarchy:v16];
  }
  else
  {
    BOOL v7 = +[SizeContext sharedInstance];
    char v8 = [v7 hasViewHierarchyForCurrentContext];
    EKUIMultiwindowAssert(v8, @"Attempt to push nil window as fallback sizing context", v9, v10, v11, v12, v13, v14, v15);
  }
}

void EKUIPopFallbackSizingContextWithViewHierarchy(void *a1)
{
  id v16 = a1;
  if (v16)
  {
    EKUIMultiwindowAssert(1, @"Attempt to pop nil window as fallback sizing context", v1, v2, v3, v4, v5, v6, v15);
    BOOL v7 = +[SizeContext sharedInstance];
    [v7 popContextFromViewHierarchy:v16];
  }
  else
  {
    BOOL v7 = +[SizeContext sharedInstance];
    char v8 = [v7 hasViewHierarchyForCurrentContext];
    EKUIMultiwindowAssert(v8, @"Attempt to pop nil window as fallback sizing context", v9, v10, v11, v12, v13, v14, v15);
  }
}

void __CalTimeDirectionIsLeftToRight_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  __calendarDirectionLeftToRight = [v0 _calendarDirection] == 0;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D200];

  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_LocaleChanged, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void ___shouldAssertOnUnknownWindow_block_invoke()
{
  id v0 = [MEMORY[0x1E4F57C00] sharedPreferences];
  _shouldAssertOnUnknownWindow_shouldAssert = [v0 enableMultiwindowAsserts];
}

id WeekendTextColor()
{
  id v0 = (void *)WeekendTextColor_sWeekendTextColor;
  if (!WeekendTextColor_sWeekendTextColor)
  {
    uint64_t v1 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    CFStringRef v2 = (void *)WeekendTextColor_sWeekendTextColor;
    WeekendTextColor_sWeekendTextColor = v1;

    id v0 = (void *)WeekendTextColor_sWeekendTextColor;
  }

  return v0;
}

void __CalendarAppCircleNonTodayBGColor_block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4FB1618];
  EventKitUIBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 colorNamed:@"CalendarAppCircleNonTodayBGColor" inBundle:v3 compatibleWithTraitCollection:0];
  CFStringRef v2 = (void *)CalendarAppCircleNonTodayBGColor__color;
  CalendarAppCircleNonTodayBGColor__color = v1;
}

void __CalendarAppCircleTextColor_block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4FB1618];
  EventKitUIBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 colorNamed:@"CalendarAppCircleTextColor" inBundle:v3 compatibleWithTraitCollection:0];
  CFStringRef v2 = (void *)CalendarAppCircleTextColor__color;
  CalendarAppCircleTextColor__color = v1;
}

void sub_1B3F5FD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NSBundle *EventKitUIBundle(void)
{
  if (EventKitUIBundle_onceToken != -1) {
    dispatch_once(&EventKitUIBundle_onceToken, &__block_literal_global_45);
  }
  id v0 = (void *)EventKitUIBundle_bundle;

  return (NSBundle *)v0;
}

void sub_1B3F611C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CalFloorToScreenScale(double a1)
{
  uint64_t v2 = CalFloorToScreenScale___scale;
  if (*(double *)&CalFloorToScreenScale___scale == -1.0)
  {
    *(double *)&uint64_t v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (a1 != 0.0) {
    return floor(*(double *)&v2 * a1) / *(double *)&v2;
  }
  return a1;
}

double EKUISeparatorLineThickness()
{
  uint64_t v0 = CalOnePixelInPoints___scale;
  if (*(double *)&CalOnePixelInPoints___scale == -1.0)
  {
    *(double *)&uint64_t v0 = _EKUIScaleFactor();
    CalOnePixelInPoints___scale = v0;
  }
  return 1.0 / *(double *)&v0;
}

BOOL EKUIUsesLargeTextLayout(void *a1)
{
  if (a1)
  {
    uint64_t v1 = [a1 preferredContentSizeCategory];
  }
  else
  {
    uint64_t v2 = +[EKUIApplicationExtensionOverrides shared];
    uint64_t v1 = [v2 preferredContentSizeCategoryOrOverride];
  }
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v1);

  return IsAccessibilityCategory;
}

BOOL EKUIPrefersLargerTextThanDefault(void *a1)
{
  if (a1)
  {
    uint64_t v1 = [a1 preferredContentSizeCategory];
  }
  else
  {
    uint64_t v2 = +[EKUIApplicationExtensionOverrides shared];
    uint64_t v1 = [v2 preferredContentSizeCategoryOrOverride];
  }
  BOOL v3 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) == NSOrderedDescending;

  return v3;
}

double EKUIWidthForWindowSizeParadigm(uint64_t a1)
{
  double result = 320.0;
  if (a1 >= 0x20000)
  {
    if (a1 > 0xFFFFFF)
    {
      if (a1 <= 0x7FFFFFF)
      {
        switch(a1)
        {
          case 0x1000000:
            return 428.0;
          case 0x2000000:
            return 926.0;
          case 0x4000000:
            return 393.0;
        }
      }
      else if (a1 > 0x1FFFFFFF)
      {
        if (a1 == 0x20000000)
        {
          return 932.0;
        }
        else if (a1 == 0x40000000)
        {
          return 1764.0;
        }
      }
      else if (a1 == 0x8000000)
      {
        return 852.0;
      }
      else if (a1 == 0x10000000)
      {
        return 430.0;
      }
      return result;
    }
    if (a1 < 0x100000)
    {
      if (a1 != 0x20000)
      {
        if (a1 != 0x40000)
        {
          BOOL v3 = a1 == 0x80000;
          double v2 = 896.0;
LABEL_31:
          if (v3) {
            return v2;
          }
          return result;
        }
        return 414.0;
      }
      return 375.0;
    }
    if (a1 >= 0x400000)
    {
      if (a1 == 0x400000) {
        return 390.0;
      }
      if (a1 == 0x800000) {
        return 844.0;
      }
      return result;
    }
    if (a1 != 0x100000)
    {
      if (a1 == 0x200000) {
        return 1194.0;
      }
      return result;
    }
    return 834.0;
  }
  if (a1 > 1023)
  {
    if (a1 < 0x2000)
    {
      if (a1 == 1024) {
        return 736.0;
      }
      if (a1 == 2048) {
        return 768.0;
      }
      if (a1 != 4096) {
        return result;
      }
      return 1024.0;
    }
    if (a1 < 0x8000)
    {
      if (a1 != 0x2000)
      {
        if (a1 == 0x4000) {
          return 1366.0;
        }
        return result;
      }
      return 1024.0;
    }
    if (a1 != 0x8000)
    {
      if (a1 == 0x10000) {
        return 1112.0;
      }
      return result;
    }
    return 834.0;
  }
  if (a1 <= 63)
  {
    if (a1 != -1)
    {
      if (a1 != 16)
      {
        if (a1 != 32) {
          return result;
        }
        return 414.0;
      }
      return 375.0;
    }
    if (_shouldAssertOnUnknownWindow_onceToken != -1) {
      dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_49);
    }
    if (_shouldAssertOnUnknownWindow_shouldAssert) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"EKUIDeviceCapabilities assertion failed: %@", @"EKUIWidthForWindowSizeParadigm: Unable to find window width for paradigm" format];
    }
    return 1.84467441e19;
  }
  if (a1 <= 255)
  {
    double v2 = 480.0;
    if (a1 == 128) {
      double result = 512.0;
    }
    BOOL v3 = a1 == 64;
    goto LABEL_31;
  }
  if (a1 == 256) {
    return 568.0;
  }
  if (a1 == 512) {
    return 700.0;
  }
  return result;
}

void sub_1B3F66F98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F671CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

uint64_t EKUIHasFallbackSizingContext()
{
  uint64_t v0 = +[SizeContext sharedInstance];
  uint64_t v1 = [v0 hasViewHierarchyForCurrentContext];

  return v1;
}

id CalendarAppTintColor()
{
  uint64_t v0 = (void *)CalendarAppTintColor___AppTintColor;
  if (!CalendarAppTintColor___AppTintColor)
  {
    uint64_t v1 = [MEMORY[0x1E4FB1618] systemRedColor];
    double v2 = (void *)CalendarAppTintColor___AppTintColor;
    CalendarAppTintColor___AppTintColor = v1;

    uint64_t v0 = (void *)CalendarAppTintColor___AppTintColor;
  }

  return v0;
}

void sub_1B3F69C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B3F69F34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F6A4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void __EventKitUIBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.eventkitui"];
  uint64_t v1 = (void *)EventKitUIBundle_bundle;
  EventKitUIBundle_bundle = v0;
}

void EKUILogInitIfNeeded()
{
  if (EKUILogInitIfNeeded_onceToken != -1) {
    dispatch_once(&EKUILogInitIfNeeded_onceToken, &__block_literal_global_54);
  }
}

void sub_1B3F6BC8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B3F6BD7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void __EKUILogInitIfNeeded_block_invoke()
{
  os_log_t v0 = os_log_create(EKUILogSubsystem, "EventKitUI");
  uint64_t v1 = (void *)kEKUILogHandle;
  kEKUILogHandle = (uint64_t)v0;

  os_log_t v2 = os_log_create(EKUILogSubsystem, "EventEditor");
  BOOL v3 = (void *)kEKUILogEventEditorHandle;
  kEKUILogEventEditorHandle = (uint64_t)v2;

  os_log_t v4 = os_log_create(EKUILogSubsystem, "LocationSearch");
  uint64_t v5 = (void *)kEKUILogLocationSearchHandle;
  kEKUILogLocationSearchHandle = (uint64_t)v4;

  os_log_t v6 = os_log_create(EKUILogSubsystem, "Invitees");
  BOOL v7 = (void *)kEKUILogInviteesHandle;
  kEKUILogInviteesHandle = (uint64_t)v6;
}

void sub_1B3F6D1EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

double CalOffsetToCenterNumberWithFont(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v4 pointSize];
  if (v5 < 18.0)
  {
    if (([v3 isEqualToString:@"1"] & 1) == 0
      && ([v3 isEqualToString:@"2"] & 1) == 0
      && ([v3 isEqualToString:@"4"] & 1) == 0)
    {
      double v6 = 0.0;
      if (![v3 isEqualToString:@"11"]) {
        goto LABEL_13;
      }
    }
LABEL_12:
    uint64_t v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 scale];
    double v6 = -1.0 / v10;

    goto LABEL_13;
  }
  [v4 pointSize];
  double v6 = 0.0;
  if (v7 >= 21.0) {
    goto LABEL_13;
  }
  if (([v3 isEqualToString:@"1"] & 1) != 0
    || [v3 isEqualToString:@"4"])
  {
    UIRoundToViewScale();
    double v6 = v8;
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"3"]) {
    goto LABEL_12;
  }
  if (([v3 isEqualToString:@"6"] & 1) != 0
    || [v3 isEqualToString:@"11"])
  {
    uint64_t v12 = CalFloorToScreenScale___scale;
    if (*(double *)&CalFloorToScreenScale___scale == -1.0)
    {
      *(double *)&uint64_t v12 = _EKUIScaleFactor();
      CalFloorToScreenScale___scale = v12;
    }
    double v6 = -floor(*(double *)&v12 * 0.4) / *(double *)&v12;
  }
LABEL_13:

  return v6;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return objc_opt_class();
}

id _StringWithLineEndingsRemoved(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\n"];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

void sub_1B3F70F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _StringValuePartsForDateComponents(void *a1, void *a2, void *a3, int a4, uint64_t a5, char a6, id *a7, id *a8)
{
  id v29 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = _CalendarForFormattingStrings();
  v17 = [v16 dateFromComponents:v29];

  v18 = EventKitUIBundle();
  v19 = [v18 localizedStringForKey:@"Start time zone format" value:@"%@ %@" table:0];

  if (v15)
  {
    v20 = CUIKShortTZString();
    a6 = 1;
    if (a4)
    {
LABEL_3:
      if (!a7) {
        goto LABEL_17;
      }
      v21 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
      goto LABEL_5;
    }
  }
  else
  {
    v20 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  if (v14)
  {
    uint64_t v22 = [v14 year];
    if (v22 == [v29 year])
    {
      uint64_t v23 = [v14 month];
      if (v23 == [v29 month])
      {
        uint64_t v24 = [v14 day];
        uint64_t v25 = [v29 day];
        if (a7)
        {
          if (v24 == v25)
          {
            CUIKStringForTime();
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            *a7 = v26;
            if (v20)
            {
              objc_msgSend(NSString, "localizedStringWithFormat:", v19, v26, v20);
              id v26 = (id)objc_claimAutoreleasedReturnValue();
              *a7 = v26;
            }
            goto LABEL_16;
          }
        }
      }
    }
  }
  if (a7)
  {
    id v26 = *a7;
LABEL_16:
    if (v26) {
      goto LABEL_17;
    }
    if (a6) {
      CUIKShortStringForDay();
    }
    else {
      CUIKStringForDateWithCommaAndYear();
    }
    id v27 = objc_claimAutoreleasedReturnValue();
    *a7 = v27;

    if (!a8) {
      goto LABEL_17;
    }
    CUIKStringForTime();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    *a8 = v28;
    if (!v20) {
      goto LABEL_17;
    }
    v21 = objc_msgSend(NSString, "localizedStringWithFormat:", v19, v28, v20);
    a7 = a8;
LABEL_5:
    *a7 = v21;
  }
LABEL_17:
}

id _CalendarForFormattingStrings()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v1 = [v0 timeZone];
  id v2 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  char v3 = [v1 isEqualToTimeZone:v2];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
    [v0 setTimeZone:v4];
  }

  return v0;
}

void sub_1B3F784D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3F79234(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F795A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F796A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F7A9BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3F80D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1B3F82548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18)
{
}

void sub_1B3F84870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

double springAnimationDuration()
{
  return 0.91;
}

void scaleViewToFrame(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if (a1)
  {
    id v9 = a1;
    v18.origin.x = a2;
    v18.origin.y = a3;
    v18.size.width = a4;
    v18.size.height = a5;
    double MidX = CGRectGetMidX(v18);
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    double MidY = CGRectGetMidY(v19);
    [v9 frame];
    CGFloat v12 = a4 / CGRectGetWidth(v20);
    [v9 frame];
    memset(&v17, 0, sizeof(v17));
    CGFloat v13 = a5 / CGRectGetHeight(v21);
    [v9 transform];
    CGAffineTransform v15 = v17;
    CGAffineTransformScale(&v16, &v15, v12, v13);
    CGAffineTransform v17 = v16;
    CGAffineTransform v14 = v16;
    [v9 setTransform:&v14];
    objc_msgSend(v9, "setCenter:", MidX, MidY);
  }
}

id createImageViewFromView(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double v10 = captureImageFromView(a1, a2);
  uint64_t v11 = createImageViewFromImage(v10, a3, a4, a5, a6);

  return v11;
}

id captureImageFromView(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 isHidden];
  [v3 setHidden:0];
  double v5 = objc_opt_new();
  [v5 setScale:EKUIScaleFactor()];
  [v5 setOpaque:a2];
  [v5 setPreferredRange:1];
  id v6 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [v3 bounds];
  id v9 = objc_msgSend(v6, "initWithSize:format:", v5, v7, v8);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  CGAffineTransform v15 = __captureImageFromView_block_invoke;
  CGAffineTransform v16 = &unk_1E6087B90;
  char v18 = a2;
  id v17 = v3;
  id v10 = v3;
  uint64_t v11 = [v9 imageWithActions:&v13];
  objc_msgSend(v10, "setHidden:", v4, v13, v14, v15, v16);

  return v11;
}

id createImageViewFromImage(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  [v9 scale];
  CGFloat v11 = a2 * v10;
  [v9 scale];
  CGFloat v13 = a3 * v12;
  [v9 scale];
  CGFloat v15 = a4 * v14;
  [v9 scale];
  CGFloat v17 = a5 * v16;
  id v18 = v9;
  CGRect v19 = (CGImage *)[v18 CGImage];

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  CGRect v20 = CGImageCreateWithImageInRect(v19, v26);
  id v21 = objc_alloc(MEMORY[0x1E4FB1838]);
  uint64_t v22 = [MEMORY[0x1E4FB1818] imageWithCGImage:v20];
  uint64_t v23 = (void *)[v21 initWithImage:v22];

  if (v20) {
    CGImageRelease(v20);
  }
  objc_msgSend(v23, "setFrame:", a2, a3, a4, a5);

  return v23;
}

void __captureImageFromView_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1E20];
    double v5 = [*(id *)(a1 + 32) traitCollection];
    [v4 setCurrentTraitCollection:v5];

    id v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v6 set];

    [*(id *)(a1 + 32) bounds];
    CGContextFillRect(v3, v9);
  }
  id v7 = [*(id *)(a1 + 32) layer];
  [v7 renderInContext:v3];
}

id createSnapshotFromView(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  uint64_t v12 = [v11 isHidden];
  [v11 setHidden:0];
  [v11 setNeedsDisplay];
  id v13 = objc_alloc(MEMORY[0x1E4FB1C40]);
  [v11 bounds];
  double v14 = objc_msgSend(v13, "initWithFrame:");
  objc_msgSend(v14, "captureSnapshotRect:fromView:withSnapshotType:", v11, a2, a3, a4, a5, a6);
  [v11 setHidden:v12];

  return v14;
}

uint64_t synchronizationOffsetForLabels(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v29 = [v3 objectAtIndex:0];
  double v5 = [v29 text];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v35;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9 + v8;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = [*(id *)(*((void *)&v34 + 1) + 8 * v11) text];
        char v14 = [v5 isEqualToString:v13];

        if (v14)
        {
          uint64_t v22 = v9 + v11;
          uint64_t v25 = v6;
          CGFloat v15 = v5;
          goto LABEL_22;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v27 = [v6 objectAtIndex:0];
  CGFloat v15 = [v27 text];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v28 = v3;
  id v16 = v3;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v31;
    while (2)
    {
      uint64_t v21 = 0;
      uint64_t v22 = v19 - v18;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = [*(id *)(*((void *)&v30 + 1) + 8 * v21) text];
        char v24 = [v15 isEqualToString:v23];

        if (v24)
        {
          uint64_t v22 = v19 - v21;
          goto LABEL_21;
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      uint64_t v19 = v22;
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_21:

  uint64_t v25 = v27;
  id v3 = v28;
LABEL_22:

  return v22;
}

id createCrossFadeViewsFromViews(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = -a3 & (-a3 >> 63);
  unint64_t v8 = [v5 count];
  uint64_t v9 = [v6 count];
  if (v8 <= v9 - a3) {
    int64_t v10 = v9 - a3;
  }
  else {
    int64_t v10 = v8;
  }
  double v11 = _estimatedSpacing(v5);
  double v65 = v12;
  double v66 = v11;
  double v13 = _estimatedSpacing(v6);
  double v63 = v14;
  double v64 = v13;
  id v15 = v6;
  id v16 = [v5 objectAtIndex:-a3 & (a3 >> 63)];
  uint64_t v17 = (-a3 & (a3 >> 63)) + a3;
  if (v17 < 0
    || v17 >= (unint64_t)[v15 count]
    || ([v15 objectAtIndex:v17], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v18 = [v15 objectAtIndex:0];
  }
  [v18 bounds];
  double Width = CGRectGetWidth(v68);
  [v16 bounds];
  double v20 = CGRectGetWidth(v69);
  [v18 bounds];
  double Height = CGRectGetHeight(v70);
  [v16 bounds];
  double v22 = CGRectGetHeight(v71);

  uint64_t v23 = [v5 firstObject];
  [v23 frame];
  double v61 = v25;
  double v62 = v24;

  CGRect v26 = [v15 firstObject];
  [v26 frame];
  double v59 = v28;
  double v60 = v27;

  id v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10 - v7];
  if (v10 > v7)
  {
    double v57 = Height / v22;
    double v58 = Width / v20;
    double v55 = 1.0 / (Height / v22);
    double v56 = 1.0 / (Width / v20);
    do
    {
      if (v7 < 0 || v7 >= (unint64_t)[v5 count])
      {
        uint64_t v30 = 0;
      }
      else
      {
        uint64_t v30 = [v5 objectAtIndex:v7];
      }
      uint64_t v31 = a3 + v7;
      if (a3 + v7 < 0 || v31 >= (unint64_t)[v15 count])
      {
        uint64_t v32 = 0;
      }
      else
      {
        uint64_t v32 = [v15 objectAtIndex:a3 + v7];
      }
      if (!(v30 | v32)) {
        goto LABEL_25;
      }
      if (v30)
      {
        [(id)v30 frame];
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        if (!v32) {
          goto LABEL_23;
        }
      }
      else
      {
        [(id)v32 bounds];
        double v34 = v62 + (double)v7 * v66;
        double v36 = v61 + (double)v7 * v65;
        double v38 = v56 * v49;
        double v40 = v55 * v50;
        if (!v32)
        {
LABEL_23:
          [(id)v30 bounds];
          double v42 = v60 + (double)v31 * v64;
          double v44 = v59 + (double)v31 * v63;
          double v46 = v58 * v51;
          double v48 = v57 * v52;
          goto LABEL_24;
        }
      }
      [(id)v32 frame];
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
LABEL_24:
      v53 = -[CrossFadeView initWithStartView:endView:startFrame:endFrame:]([CrossFadeView alloc], "initWithStartView:endView:startFrame:endFrame:", v30, v32, v34, v36, v38, v40, v42, v44, v46, v48);
      [v29 addObject:v53];

LABEL_25:
      ++v7;
    }
    while (v10 != v7);
  }

  return v29;
}

double _estimatedSpacing(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 count] > 1)
  {
    id v3 = [v1 objectAtIndex:0];
    id v4 = [v1 objectAtIndex:1];
    [v4 frame];
    double v6 = v5;
    [v3 frame];
    double v2 = v6 - v7;
    [v4 frame];
    [v3 frame];
  }
  else
  {
    double v2 = *MEMORY[0x1E4F1DAD8];
  }

  return v2;
}

id springAnimateViewPosition(void *a1, unsigned int a2, void *a3, double a4, double a5)
{
  id v9 = a1;
  id v10 = a3;
  if (v9)
  {
    double v11 = _createSpringOfBasicAnimationDependingOnDebugState(@"position", a2);
    [v9 center];
    double v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
    [v11 setFromValue:v12];

    [v9 frame];
    double v14 = a4 + v13 * 0.5;
    [v9 frame];
    id v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v14, a5 + v15 * 0.5);
    [v11 setToValue:v16];

    if (v10) {
      [v11 setDelegate:v10];
    }
    uint64_t v17 = [v9 layer];
    [v17 addAnimation:v11 forKey:@"position"];

    [v9 frame];
    objc_msgSend(v9, "setFrame:", a4, a5);
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

id _createSpringOfBasicAnimationDependingOnDebugState(void *a1, unsigned int a2)
{
  id v3 = a1;
  UIAnimationDragCoefficient();
  if (v4 <= 1.5)
  {
    id v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:v3];
    [v5 setMass:2.0];
    [v5 setStiffness:300.0];
    [v5 setDamping:400.0];
    id v10 = _createTimingFunction(a2, v6, v7, v8, v9);
    [v5 setTimingFunction:v10];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F39B48]);
    [v5 setKeyPath:v3];
  }
  UIAnimationDragCoefficient();
  [v5 setDuration:v11 * 0.91];

  return v5;
}

id springAnimateViewBounds(void *a1, unsigned int a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a1;
  id v14 = a3;
  if (v13)
  {
    double v15 = _createSpringOfBasicAnimationDependingOnDebugState(@"bounds", a2);
    [v13 bounds];
    id v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
    [v15 setFromValue:v16];

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a4, a5, a6, a7);
    [v15 setToValue:v17];

    if (v14) {
      [v15 setDelegate:v14];
    }
    uint64_t v18 = [v13 layer];
    [v18 addAnimation:v15 forKey:@"bounds"];

    objc_msgSend(v13, "setBounds:", a4, a5, a6, a7);
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

id springAnimateViewFrame(void *a1, unsigned int a2, void *a3, double a4, double a5, double a6, double a7)
{
  if (a1)
  {
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    id v15 = a3;
    id v16 = a1;
    id v17 = springAnimateViewBounds(v16, a2, 0, v13, v14, a6, a7);
    uint64_t v18 = springAnimateViewPosition(v16, a2, v15, a4, a5);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

id springAnimateViewAlpha(void *a1, unsigned int a2, void *a3, double a4)
{
  id v7 = a1;
  id v8 = a3;
  if (v7)
  {
    double v9 = _createSpringOfBasicAnimationDependingOnDebugState(@"opacity", a2);
    id v10 = NSNumber;
    [v7 alpha];
    float v11 = objc_msgSend(v10, "numberWithDouble:");
    [v9 setFromValue:v11];

    double v12 = [NSNumber numberWithDouble:a4];
    [v9 setToValue:v12];

    UIAnimationDragCoefficient();
    [v9 setDuration:v13 * 0.91];
    if (v8) {
      [v9 setDelegate:v8];
    }
    double v14 = [v7 layer];
    [v14 addAnimation:v9 forKey:@"opacity"];

    [v7 setAlpha:a4];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

id _createTimingFunction(unsigned int a1, double a2, double a3, double a4, double a5)
{
  if (a1 > 4)
  {
    [MEMORY[0x1E4F39C10] functionWithName:@"default"];
  }
  else
  {
    LODWORD(a2) = 1046804326;
    LODWORD(a3) = 990057071;
    LODWORD(a4) = 1057860511;
    LODWORD(a5) = 1064563009;
    [MEMORY[0x1E4F39C10] functionWithControlPoints:a2 :a3 :a4 :a5];
  id v5 = };

  return v5;
}

void recursiveAnimationRemove(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v1 = objc_msgSend(a1, "sublayers", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v8;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v1);
          }
          double v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
          recursiveAnimationRemove(v6);
          [v6 removeAllAnimations];
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v3);
    }
  }
}

float preferredNavigationAnimationFrameRateRange()
{
  LODWORD(result) = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return result;
}

void animateNavigationPreferringFRR(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4FB1EB0];
  id v2 = a1;
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v1, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1572874, v2, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

id navigationAnimationsPreferringFRR(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __navigationAnimationsPreferringFRR_block_invoke;
  aBlock[3] = &unk_1E6087BD8;
  id v6 = v1;
  id v2 = v1;
  uint64_t v3 = _Block_copy(aBlock);

  return v3;
}

void __navigationAnimationsPreferringFRR_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __navigationAnimationsPreferringFRR_block_invoke_2;
  v9[3] = &unk_1E6087BD8;
  id v10 = *(id *)(a1 + 32);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1572874, v9, v6, v7, v8);
}

uint64_t __navigationAnimationsPreferringFRR_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id dayViewScrollAnimationsPreferringFRR(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __dayViewScrollAnimationsPreferringFRR_block_invoke;
  aBlock[3] = &unk_1E6087BD8;
  id v6 = v1;
  id v2 = v1;
  uint64_t v3 = _Block_copy(aBlock);

  return v3;
}

void __dayViewScrollAnimationsPreferringFRR_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __dayViewScrollAnimationsPreferringFRR_block_invoke_2;
  v9[3] = &unk_1E6087BD8;
  id v10 = *(id *)(a1 + 32);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1572884, v9, v6, v7, v8);
}

uint64_t __dayViewScrollAnimationsPreferringFRR_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id DisplayAddressForIdentity(void *a1)
{
  id v1 = a1;
  id v2 = [v1 emailAddress];

  if (v2)
  {
    uint64_t v3 = [v1 emailAddress];
    goto LABEL_10;
  }
  CAFrameRateRange v4 = [v1 phoneNumber];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F57BF8] sharedGenerator];
    double v6 = [v1 phoneNumber];
    uint64_t v7 = [v5 formattedStringForPhoneNumber:v6];
  }
  else
  {
    double v8 = [v1 URL];
    int v9 = objc_msgSend(v8, "cal_hasSchemeTel");

    if (!v9)
    {
      id v5 = [v1 URL];
      uint64_t v3 = [v5 resourceSpecifier];
      goto LABEL_9;
    }
    id v5 = [MEMORY[0x1E4F57BF8] sharedGenerator];
    double v6 = [v1 URL];
    uint64_t v7 = [v5 formattedStringForTelURL:v6];
  }
  uint64_t v3 = (void *)v7;

LABEL_9:
LABEL_10:

  return v3;
}

uint64_t DisplayStringForIdentity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x1E4F57B30] displayStringForIdentity:a1 useAddressAsFallback:a2 contactIdentifier:a3];
}

id IdentityNameFromRecipient(void *a1)
{
  id v1 = a1;
  id v2 = [v1 displayString];
  uint64_t v3 = [v2 length];

  if (v3) {
    [v1 displayString];
  }
  else {
  CAFrameRateRange v4 = [v1 compositeName];
  }

  if (objc_msgSend(v4, "cal_isPhoneNumber"))
  {
    id v5 = [MEMORY[0x1E4F57BF8] sharedGenerator];
    double v6 = [MEMORY[0x1E4F57BF8] normalizedPhoneNumber:v4];
    uint64_t v7 = [v5 formattedStringForPhoneNumber:v6];

    CAFrameRateRange v4 = (void *)v7;
  }
  double v8 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  int v9 = [v4 stringByRemovingCharactersInSet:v8];

  return v9;
}

uint64_t CanSeeAttendeeStatuses(uint64_t a1)
{
  return [MEMORY[0x1E4F254B8] canSeeAttendeeStatusesForEvent:a1];
}

BOOL EKUIAttendeeUtils_ShouldConsiderAttendeeForConflictChecking(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    BOOL v3 = [v1 participantType] != 2;
  }
  else
  {
    CAFrameRateRange v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "EKUIAttendeeUtils_ShouldConsiderAttendeeForConflictChecking";
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "'nil' participant given to function: [%s].  Will not attempt to check whether this attendee should be considered for conflict checking.", (uint8_t *)&v6, 0xCu);
    }
    BOOL v3 = 0;
  }

  return v3;
}

BOOL EKUIAttendeeUtils_ShouldCountAttendeeAsConflicted(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    BOOL v4 = ([MEMORY[0x1E4F254B8] showTypeAsBusy:a2] & 1) != 0
      || [v3 participantStatus] == 3;
  }
  else
  {
    id v5 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "EKUIAttendeeUtils_ShouldCountAttendeeAsConflicted";
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_ERROR, "'nil' participant given to function: [%s].  Will not compute conflicted state.", (uint8_t *)&v7, 0xCu);
    }
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t EKUIAttendeeUtils_AttendeeHasResponded(void *a1)
{
  return [a1 needsResponse] ^ 1;
}

void sub_1B3F8B198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, id *a13, id *location, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
}

double _CachedSizeForButton(void *a1)
{
  id v1 = a1;
  if (_CachedSizeForButton_onceToken != -1) {
    dispatch_once(&_CachedSizeForButton_onceToken, &__block_literal_global_5);
  }
  id v2 = objc_msgSend(v1, "titleForState:", objc_msgSend(v1, "state"));
  id v3 = [(id)_CachedSizeForButton___sizes objectForKeyedSubscript:v2];
  if (!v3)
  {
    id v3 = objc_opt_new();
    [(id)_CachedSizeForButton___sizes setObject:v3 forKeyedSubscript:v2];
  }
  BOOL v4 = [v1 titleLabel];
  id v5 = [v4 font];

  int v6 = [v3 objectForKeyedSubscript:v5];
  if (!v6)
  {
    int v7 = (void *)MEMORY[0x1E4F29238];
    [v1 intrinsicContentSize];
    int v6 = objc_msgSend(v7, "valueWithSize:");
    [v3 setObject:v6 forKeyedSubscript:v5];
  }
  [v6 sizeValue];
  double v9 = v8;

  return v9;
}

void sub_1B3F949CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3F952F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3F95488(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

Class __getREMObjectIDClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary();
  Class result = objc_getClass("REMObjectID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMObjectIDClass_block_invoke_cold_1();
  }
  getREMObjectIDClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ReminderKitLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ReminderKitLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6087DB0;
    uint64_t v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary) {
    ReminderKitLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ReminderKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getREMStoreClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary();
  Class result = objc_getClass("REMStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMStoreClass_block_invoke_cold_1();
  }
  getREMStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMRecurrenceRuleFormatterClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary();
  Class result = objc_getClass("REMRecurrenceRuleFormatter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1();
  }
  getREMRecurrenceRuleFormatterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id defaultDarkLineColor()
{
  uint64_t v0 = (void *)defaultDarkLineColor_sDarkLineColor;
  if (!defaultDarkLineColor_sDarkLineColor)
  {
    uint64_t v1 = [MEMORY[0x1E4FB1618] colorWithWhite:0.76 alpha:1.0];
    uint64_t v2 = (void *)defaultDarkLineColor_sDarkLineColor;
    defaultDarkLineColor_sDarkLineColor = v1;

    uint64_t v0 = (void *)defaultDarkLineColor_sDarkLineColor;
  }

  return v0;
}

id defaultLineColorWithOpaque(int a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)defaultLineColorWithOpaque_sDefaultLineColorOpaque;
    if (defaultLineColorWithOpaque_sDefaultLineColorOpaque) {
      goto LABEL_7;
    }
    uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.84 alpha:1.0];
    uint64_t v3 = &defaultLineColorWithOpaque_sDefaultLineColorOpaque;
  }
  else
  {
    uint64_t v1 = (void *)defaultLineColorWithOpaque_sDefaultLineColor;
    if (defaultLineColorWithOpaque_sDefaultLineColor) {
      goto LABEL_7;
    }
    uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.24];
    uint64_t v3 = &defaultLineColorWithOpaque_sDefaultLineColor;
  }
  BOOL v4 = (void *)*v3;
  uint64_t *v3 = v2;

  uint64_t v1 = (void *)*v3;
LABEL_7:

  return v1;
}

id CalendarInvitationTitleColorOpaque()
{
  uint64_t v0 = (void *)CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque;
  if (!CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque)
  {
    uint64_t v1 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
    uint64_t v2 = (void *)CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque;
    CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque = v1;

    uint64_t v0 = (void *)CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque;
  }

  return v0;
}

uint64_t CalendarInvitationTitleColor()
{
  return MEMORY[0x1F410F7F0]();
}

uint64_t TodayTimelineColor()
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "cuik_todayTimelineColor");
}

id CalendarForegroundColorForColor(void *a1)
{
  id v1 = a1;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  [v1 getRed:&v56 green:&v55 blue:&v54 alpha:&v53];
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v1, "hash"));
  uint64_t v3 = (void *)CalendarForegroundColorForColor_sTextColors;
  if (!CalendarForegroundColorForColor_sTextColors)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:7];
    id v5 = (void *)CalendarForegroundColorForColor_sTextColors;
    CalendarForegroundColorForColor_sTextColors = v4;

    for (uint64_t i = 0; i != 168; i += 24)
    {
      int v7 = [MEMORY[0x1E4FB1618] colorWithRed:*(double *)((char *)&unk_1B413A788 + i) green:*(double *)((char *)&unk_1B413A788 + i + 8) blue:*(double *)((char *)&unk_1B413A788 + i + 16) alpha:1.0];
      double v8 = [MEMORY[0x1E4FB1618] colorWithRed:*(double *)((char *)&unk_1B413A830 + i) green:*(double *)((char *)&unk_1B413A830 + i + 8) blue:*(double *)((char *)&unk_1B413A830 + i + 16) alpha:1.0];
      double v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "hash"));
      [(id)CalendarForegroundColorForColor_sTextColors setObject:v8 forKey:v9];
    }
    uint64_t v3 = (void *)CalendarForegroundColorForColor_sTextColors;
  }
  id v10 = [v3 objectForKey:v2];
  CAFrameRateRange v11 = v10;
  if (v10)
  {
    id v12 = v10;
    goto LABEL_19;
  }
  float v13 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.55];
  double v14 = CUIKBlendColorsSourceOver();

  int v15 = [v14 isGreenOrYellow];
  if (v15) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.18 alpha:1.0];
  }
  id v12 = [v14 overlayWithColor:v16];

  CUIKLuminance();
  double v18 = v17;
  CUIKLuminance();
  double v20 = v19;
  [v14 differenceFromColor:v12];
  if (v21 < 1.0)
  {
    double v22 = (void *)MEMORY[0x1E4FB1618];
    double v23 = (1.0 - v21) / 3.0;
    [v12 redComponent];
    double v25 = v24 - v23;
    [v12 greenComponent];
    double v27 = v26 - v23;
    [v12 blueComponent];
    uint64_t v29 = [v22 colorWithRed:v25 green:v27 blue:v28 - v23 alpha:1.0];

    id v12 = (id)v29;
  }
  double v30 = v18 - v20;
  if (v15)
  {
    if (v30 < 0.75)
    {
      double v31 = 0.75 - v30;
      uint64_t v32 = (void *)MEMORY[0x1E4FB1618];
      [v12 redComponent];
      double v34 = v33;
      [v12 redComponent];
      double v36 = v34 + (0.75 - v30) * v35 * -0.299;
      [v12 greenComponent];
      double v38 = v37;
      [v12 greenComponent];
      double v40 = v38 + (0.75 - v30) * v39 * -0.587;
      [v12 blueComponent];
      double v42 = v41;
      [v12 blueComponent];
      uint64_t v44 = [v32 colorWithRed:v36 green:v40 blue:v42 + v31 * v43 * -0.114 alpha:1.0];
LABEL_17:
      double v51 = (void *)v44;

      id v12 = v51;
    }
  }
  else if (v30 < 0.28)
  {
    double v45 = (void *)MEMORY[0x1E4FB1618];
    [v12 hueComponent];
    double v47 = v46;
    [v12 saturationComponent];
    double v49 = v48;
    [v12 brightnessComponent];
    uint64_t v44 = [v45 colorWithHue:v47 saturation:v49 brightness:v50 - (0.28 - v30) alpha:1.0];
    goto LABEL_17;
  }
  [(id)CalendarForegroundColorForColor_sTextColors setObject:v12 forKey:v2];

LABEL_19:

  return v12;
}

uint64_t EKUISimulatedNavigationBarColor()
{
  return [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_20];
}

id __EKUISimulatedNavigationBarColor_block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    double v2 = 0.0705882353;
  }
  else {
    double v2 = 0.968627451;
  }
  uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithRed:v2 green:v2 blue:v2 alpha:1.0];

  return v3;
}

uint64_t EKUIVerticalGridLineColor()
{
  return [MEMORY[0x1E4FB1618] separatorColor];
}

id ClearButtonImageColor()
{
  if (ClearButtonImageColor_onceToken != -1) {
    dispatch_once(&ClearButtonImageColor_onceToken, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)ClearButtonImageColor__color;

  return v0;
}

void __ClearButtonImageColor_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4FB1618];
  EventKitUIBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 colorNamed:@"ClearButtonImageColor" inBundle:v3 compatibleWithTraitCollection:0];
  double v2 = (void *)ClearButtonImageColor__color;
  ClearButtonImageColor__color = v1;
}

uint64_t EKHalfSystemGroupedBackgroundColor()
{
  return [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_27];
}

id __EKHalfSystemGroupedBackgroundColor_block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  uint64_t v4 = [v2 systemGroupedBackgroundColor];
  id v5 = [v4 resolvedColorWithTraitCollection:v3];

  int v6 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
  int v7 = [v6 resolvedColorWithTraitCollection:v3];

  double v8 = [v5 colorWithAlphaComponent:0.5];
  double v9 = objc_msgSend(v7, "ek_blendWithColor:", v8);

  return v9;
}

uint64_t SuggestedLocationDismissImageColor()
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.654901961 green:0.654901961 blue:0.670588235 alpha:1.0];
}

uint64_t CheckmarkGreenColor()
{
  return [MEMORY[0x1E4FB1618] systemGreenColor];
}

void sub_1B3F9E094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id EKUIIOSMacLogHandle()
{
  if (EKUIIOSMacLogHandle_onceToken != -1) {
    dispatch_once(&EKUIIOSMacLogHandle_onceToken, &__block_literal_global_45);
  }
  uint64_t v0 = (void *)EKUIIOSMacLogHandle_handle;

  return v0;
}

void __EKUIIOSMacLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.eventkit", "iOSMacUtils");
  uint64_t v1 = (void *)EKUIIOSMacLogHandle_handle;
  EKUIIOSMacLogHandle_handle = (uint64_t)v0;
}

void sub_1B3F9E8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_1B3FA03B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28,id *a29,id *a30,id *a31,id *a32,id *a33,id *a34,id *a35,id *a36,id *location)
{
}

void sub_1B3FA0B20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FA1C04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FA27FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
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

void sub_1B3FA7E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CalStringForRelativeOffset(int a1, double a2)
{
  if (a1)
  {
    id v3 = (const void *)CalTimeZoneCopyCFTimeZone();
    uint64_t GregorianDate = CalDateTimeGetGregorianDate();
    id v5 = (void *)MEMORY[0x1E4F1C9C8];
    MEMORY[0x1BA985590](GregorianDate);
    int v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    CFRelease(v3);
    BOOL v7 = a2 > 0.0;
    if (a2 >= 86400.0) {
      BOOL v7 = 0;
    }
    if (a2 == 0.0 || v7)
    {
      id v16 = EventKitUIBundle();
      double v9 = [v16 localizedStringForKey:@"On day of event (%@)" value:&stru_1F0CC2140 table:0];

      double v17 = NSString;
      id v10 = CUIKStringForGMTTime();
      id v12 = objc_msgSend(v17, "localizedStringWithFormat:", v9, v10);
    }
    else
    {
      if (a2 == -572400.0)
      {
        double v8 = NSString;
        double v9 = EventKitUIBundle();
        id v10 = [v9 localizedStringForKey:@"%@ before" value:&stru_1F0CC2140 table:0];
        CAFrameRateRange v11 = CalIntervalOneWeekLocalizedString();
        id v12 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v11);
      }
      else
      {
        if (a2 >= 0.0 || a2 < -21600.0)
        {
          double v21 = EventKitUIBundle();
          double v22 = v21;
          if (a2 >= 0.0)
          {
            double v9 = [v21 localizedStringForKey:@"%@ after" value:&stru_1F0CC2140 table:0];

            double v23 = floor(a2 / 86400.0);
          }
          else
          {
            double v9 = [v21 localizedStringForKey:@"%@ before" value:&stru_1F0CC2140 table:0];

            double v23 = ceil(fabs(a2) / 86400.0);
          }
          uint64_t v24 = (uint64_t)v23;
          double v25 = NSString;
          double v26 = EventKitUIBundle();
          double v27 = [v26 localizedStringForKey:@"interval_days_long" value:&stru_1F0CC2140 table:0];
          id v10 = objc_msgSend(v25, "localizedStringWithFormat:", v27, v24);

          CAFrameRateRange v11 = [NSString localizedStringWithValidatedFormat:v9, @"%@", 0, v10 validFormatSpecifiers error];
          double v28 = NSString;
          double v20 = EventKitUIBundle();
          uint64_t v29 = [v20 localizedStringForKey:@"All-day alarm format" value:@"%@ (%@)" table:0];
          double v30 = CUIKStringForGMTTime();
          id v12 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v11, v30);
        }
        else
        {
          double v18 = CalOnTimeLocalizedString();
          double v9 = CUIKDurationStringForTimeInterval();

          id v10 = CUIKStringForGMTTime();
          double v19 = NSString;
          CAFrameRateRange v11 = EventKitUIBundle();
          double v20 = [v11 localizedStringForKey:@"All-day alarm format" value:@"%@ (%@)" table:0];
          id v12 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v9, v10);
        }
      }
    }
  }
  else if (a2 == -604800.0)
  {
    float v13 = NSString;
    int v6 = EventKitUIBundle();
    double v14 = [v6 localizedStringForKey:@"%@ before" value:&stru_1F0CC2140 table:0];
    int v15 = CalIntervalOneWeekLocalizedString();
    id v12 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v15);
  }
  else
  {
    int v6 = CalOnTimeLocalizedString();
    id v12 = CUIKDurationStringForTimeInterval();
  }

  return v12;
}

id CalIntervalOneWeekLocalizedString()
{
  os_log_t v0 = NSString;
  uint64_t v1 = EventKitUIBundle();
  double v2 = [v1 localizedStringForKey:@"interval_weeks" value:&stru_1F0CC2140 table:0];
  id v3 = objc_msgSend(v0, "localizedStringWithFormat:", v2, 1);

  return v3;
}

id CalOnTimeLocalizedString()
{
  os_log_t v0 = EventKitUIBundle();
  uint64_t v1 = [v0 localizedStringForKey:@"At time of event" value:&stru_1F0CC2140 table:0];

  return v1;
}

void sub_1B3FAA744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

void sub_1B3FAB7F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B3FB05E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 144));
  _Unwind_Resume(a1);
}

void sub_1B3FB0AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B3FB32C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __CalendarLinkLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CalendarLinkLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B3FB5A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,id a26)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a26);
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

void sub_1B3FB5D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1B3FB5FF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t EKUIDescriptorForRequiredKeysForLabeledDisplayString()
{
  return MEMORY[0x1F410F748]();
}

uint64_t EKUILabeledDisplayStringForContact(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F57B58] CUIKLabeledDisplayStringForContact:a1 label:a2];
}

uint64_t EKUILabeledDisplayStringForContactWithStore(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x1E4F57B58] CUIKLabeledDisplayStringForContact:a2 label:a3];
}

id EKUIUserFriendlyStringForCLLocation(void *a1)
{
  id v1 = a1;
  [v1 coordinate];
  uint64_t v4 = CreateCoordinateComponentString(1, v2, v3);
  [v1 coordinate];
  double v6 = v5;
  double v8 = v7;

  uint64_t v9 = CreateCoordinateComponentString(0, v6, v8);
  id v10 = NSString;
  CAFrameRateRange v11 = EventKitUIBundle();
  id v12 = [v11 localizedStringForKey:@"%@, %@", &stru_1F0CC2140, 0 value table];
  float v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v4, v9);

  return v13;
}

id CreateCoordinateComponentString(int a1, double a2, double a3)
{
  if (!a1) {
    a2 = a3;
  }
  uint64_t v4 = (uint64_t)(a2 * 3600.0);
  BOOL v5 = v4 < 0;
  if (v4 >= 0) {
    double v6 = @"N";
  }
  else {
    double v6 = @"S";
  }
  double v7 = @"E";
  if (v5) {
    double v7 = @"W";
  }
  if (a1) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  uint64_t v9 = EventKitUIBundle();
  id v10 = [v9 localizedStringForKey:v8 value:&stru_1F0CC2140 table:0];
  uint64_t v11 = (uint64_t)a2;
  double v12 = fabs((a2 - (double)(uint64_t)a2) * 60.0);
  uint64_t v13 = (uint64_t)v12;
  double v14 = (double)(uint64_t)((v12 - (double)(uint64_t)v12) * 60.0);
  if (v11 >= 0) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = -v11;
  }

  id v16 = v10;
  id v17 = v16;
  id v18 = [NSString alloc];
  uint64_t v19 = EventKitUIBundle();
  double v20 = [v19 localizedStringForKey:@"%ld°%ld'%.0f'' %@" value:&stru_1F0CC2140 table:0];
  double v21 = objc_msgSend(v18, "initWithFormat:", v20, v15, v13, *(void *)&v14, v17, 0);

  return v21;
}

void sub_1B3FB88F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1B3FB8E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CalStringForMonthNumber()
{
  return MEMORY[0x1F410F9C0]();
}

uint64_t CalStringAbbreviationForDayOfWeek()
{
  return MEMORY[0x1F410F948]();
}

uint64_t CalStringForYear()
{
  return MEMORY[0x1F410FA10]();
}

uint64_t CalStringForDateAndDayOfWeekInCalendarTimezoneWithFormattingContext()
{
  return MEMORY[0x1F410F968]();
}

uint64_t CalStringForDateAndDayOfWeekSystemTime()
{
  return MEMORY[0x1F410F978]();
}

uint64_t CalInvalidateToday()
{
  return MEMORY[0x1F410F7E8]();
}

uint64_t CalNumberOfSecondsForCurrentTime()
{
  return MEMORY[0x1F410F8A0]();
}

uint64_t CalWeekStartForDisplay()
{
  return CUIKZeroIndexedWeekStart();
}

uint64_t CalDetermineWeekStart()
{
  return MEMORY[0x1F410F750]();
}

uint64_t CalLocaleIsRightToLeft()
{
  return MEMORY[0x1F410F808]();
}

void sub_1B3FB92D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FBAB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1B3FBAE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FBB948(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B3FBDB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1B3FBDDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CalImageFromGlyph(void *a1)
{
  id v1 = a1;
  [v1 size];
  UIGraphicsBeginImageContextWithOptions(v5, 0, 0.0);
  objc_msgSend(v1, "drawAtPoint:", 0.0, 0.0);

  double v2 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v2;
}

void sub_1B3FC1020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FC46D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FC4800(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FC4888(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FC4940(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FC54BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FC5A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FC5C08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3FC7F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FC9420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, id *a14, id *a15, uint64_t a16, uint64_t a17, id *a18, uint64_t a19, uint64_t a20,uint64_t a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a18);
  objc_destroyWeak(a22);
  objc_destroyWeak(a23);
  objc_destroyWeak(a24);
  objc_destroyWeak(a25);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak((id *)(v27 - 112));
  _Unwind_Resume(a1);
}

void sub_1B3FCC190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

void sub_1B3FCCD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1B3FCF7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return v0;
}

void sub_1B3FD701C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FD9CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

id getCNComposeRecipientClass()
{
  uint64_t v4 = 0;
  CGSize v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNComposeRecipientClass_softClass;
  uint64_t v7 = getCNComposeRecipientClass_softClass;
  if (!getCNComposeRecipientClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientClass_block_invoke;
    v3[3] = &unk_1E6087D90;
    v3[4] = &v4;
    __getCNComposeRecipientClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B3FDEAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNComposeRecipientClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ContactsAutocompleteUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6088EB0;
    uint64_t v5 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary) {
    __getCNComposeRecipientClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CNComposeRecipient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNComposeRecipientClass_block_invoke_cold_2();
  }
  getCNComposeRecipientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsAutocompleteUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsAutocompleteUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B3FE0714(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3FE0C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_1B3FE501C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1B3FE5B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FE6960(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3FE7B50(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B3FE88C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(v25);
  objc_destroyWeak((id *)(v27 - 104));
  _Unwind_Resume(a1);
}

void sub_1B3FE9800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(v17);
  objc_destroyWeak((id *)(v20 - 72));
  _Unwind_Resume(a1);
}

void sub_1B3FE9C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3FEAF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FEC38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_32);
  }
  uint64_t v0 = (void *)logHandle_handle;

  return v0;
}

void __logHandle_block_invoke()
{
  os_log_t v0 = os_log_create(EKUILogSubsystem, "EKUIAppReview");
  uint64_t v1 = (void *)logHandle_handle;
  logHandle_handle = (uint64_t)v0;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1B3FEE014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMStreamsClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMStreamsClass_block_invoke_cold_1();
  }
  getBMStreamsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __BiomeStreamsLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6089520;
    uint64_t v2 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary) {
    BiomeStreamsLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __BiomeStreamsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeStreamsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBMDiscoverabilitySignalEventClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDiscoverabilitySignalEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1();
  }
  getBMDiscoverabilitySignalEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B3FF90A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3FFC510(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void _EKStringFactoryHandleSignificantTimeChange()
{
  id v0 = +[EKStringFactory sharedInstance];
  [v0 _invalidateFormatters];
}

void sub_1B4000004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

uint64_t ScaledCalendarColorDotImageForColor(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F57BB8] scaledCalendarColorDotImageForColor:a1 font:a2];
}

uint64_t ScaledCalendarColorChooserDotImageForColor(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F57BB8] scaledCalendarColorChooserDotImageForColor:a1 font:a2];
}

uint64_t ScaledCalendarColorDotImageForColor_SuggestedEvent(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F57BB8], "scaledCalendarColorDotImageForColor_SuggestedEvent:font:", a1, a2);
}

uint64_t ScaledCalendarInvitationDot(uint64_t a1)
{
  return [MEMORY[0x1E4F57BB8] scaledCalendarInvitationDotForFont:a1];
}

uint64_t CarImage_Occurrences()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"car.fill"];
}

uint64_t CarImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"car.fill"];
}

uint64_t WalkmanImage_Occurrences()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"figure.walk"];
}

uint64_t WalkmanImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"figure.walk"];
}

uint64_t BicycleImage_Occurrences()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"bicycle"];
}

uint64_t BicycleImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"bicycle"];
}

uint64_t TransitImage_Occurrences()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"tram.fill"];
}

uint64_t TransitImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"tram.fill"];
}

id BirthdayImage()
{
  id v0 = [MEMORY[0x1E4F57C18] sharedInstance];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  uint64_t v2 = [v0 birthdayImageForFont:v1];

  return v2;
}

uint64_t PendingImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"questionmark.circle"];
}

id ImageForAvailabilityType(uint64_t a1)
{
  if (a1)
  {
    int v1 = [MEMORY[0x1E4F254B8] showTypeAsBusy:a1];
    uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
    if (v1) {
      uint64_t v3 = @"xmark.circle";
    }
    else {
      uint64_t v3 = @"checkmark.circle";
    }
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v3 = @"questionmark.circle";
  }
  long long v4 = [v2 systemImageNamed:v3];

  return v4;
}

uint64_t BusyImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle"];
}

uint64_t FreeImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
}

id AccessibilityLabelForAvailabilityType(uint64_t a1)
{
  if (a1)
  {
    int v1 = [MEMORY[0x1E4F254B8] showTypeAsBusy:a1];
    uint64_t v2 = EventKitUIBundle();
    uint64_t v3 = v2;
    if (v1)
    {
      long long v4 = @"Busy - accessibility";
      uint64_t v5 = @"Busy";
    }
    else
    {
      long long v4 = @"Free - accessibility";
      uint64_t v5 = @"Free";
    }
  }
  else
  {
    uint64_t v2 = EventKitUIBundle();
    uint64_t v3 = v2;
    long long v4 = @"Pending - accessibility";
    uint64_t v5 = @"Pending";
  }
  uint64_t v6 = [v2 localizedStringForKey:v4 value:v5 table:0];

  return v6;
}

id TableViewCheckmarkImage(void *a1)
{
  int v1 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v2 = *MEMORY[0x1E4FB28C8];
  id v3 = a1;
  long long v4 = [v1 preferredFontDescriptorWithTextStyle:v2];
  uint64_t v5 = [v4 fontDescriptorWithSymbolicTraits:2];

  uint64_t v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
  int64_t v7 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:2 traitCollection:v3];

  double v8 = [MEMORY[0x1E4FB1830] configurationWithFont:v6 scale:v7];
  uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v8];

  return v9;
}

id TableViewDisclosureIndicatorImage(void *a1)
{
  int v1 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v2 = *MEMORY[0x1E4FB28C8];
  id v3 = a1;
  long long v4 = [v1 defaultFontDescriptorWithTextStyle:v2];
  uint64_t v5 = [v4 fontDescriptorWithSymbolicTraits:2];

  uint64_t v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
  int64_t v7 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:1 traitCollection:v3];

  double v8 = [MEMORY[0x1E4FB1830] configurationWithFont:v6 scale:v7];
  uint64_t v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v8];
  uint64_t v11 = [v10 imageWithTintColor:v9 renderingMode:1];

  return v11;
}

id BadgeImageForHoliday(void *a1, uint64_t a2, void *a3, float64_t a4)
{
  id v7 = a1;
  id v8 = a3;
  if (BadgeImageForHoliday_onceToken != -1) {
    dispatch_once(&BadgeImageForHoliday_onceToken, &__block_literal_global_29);
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", _UniqueDotHashForColorAndRadiusAndInterfaceStyleAndLocale(v7, a2 == 1, v8, a4));
  id v10 = [(id)BadgeImageForHoliday___CachedHolidayBadgeImages objectForKey:v9];
  if (!v10)
  {
    v22.width = a4;
    v22.height = a4;
    UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    double v12 = CUIKTextColorForCalendarColorForStyle();
    CGContextBeginPath(CurrentContext);
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, a4, a4);
    id v13 = objc_claimAutoreleasedReturnValue();
    CGContextAddPath(CurrentContext, (CGPathRef)[v13 CGPath]);
    CGContextClip(CurrentContext);
    [v12 setFill];
    uint64_t v14 = EventKitUIBundle();
    uint64_t v15 = FailProofLocale(v8);
    id v16 = [v14 localizedStringForKey:@"Holiday character glyph" value:@"H" table:0 localization:v15];

    id v17 = [MEMORY[0x1E4FB08E0] systemFontOfSize:ceil(a4 * 0.75)];
    objc_msgSend(v16, "_legacy_sizeWithFont:", v17);
    CalRoundToScreenScale((a4 - v18) * 0.5);
    objc_msgSend(v16, "drawInRect:withFont:lineBreakMode:alignment:lineSpacing:", v17, 2, 1, 0, 0.0, v19, a4, a4);
    id v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)BadgeImageForHoliday___CachedHolidayBadgeImages setObject:v10 forKey:v9];
  }

  return v10;
}

void __BadgeImageForHoliday_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  int v1 = (void *)BadgeImageForHoliday___CachedHolidayBadgeImages;
  BadgeImageForHoliday___CachedHolidayBadgeImages = v0;
}

unint64_t _UniqueDotHashForColorAndRadiusAndInterfaceStyleAndLocale(void *a1, int a2, void *a3, float64_t a4)
{
  float64_t v21 = 0.0;
  double v22 = 0.0;
  float64_t v19 = 0.0;
  float64_t v20 = 0.0;
  id v6 = a3;
  [a1 getRed:&v22 green:&v21 blue:&v20 alpha:&v19];
  unint64_t v7 = (unint64_t)(v22 * 100.0);
  v8.f64[0] = v20;
  v8.f64[1] = v19;
  float64x2_t v16 = v8;
  v8.f64[0] = a4;
  v8.f64[1] = v21;
  float64x2_t v18 = v8;
  uint64_t v9 = [v6 hash];

  float64x2_t v10 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
  int8x16_t v11 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vmulq_f64(v18, v10)), (uint64x2_t)xmmword_1B413AA20);
  int8x16_t v12 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vmulq_f64(v16, v10)), (uint64x2_t)xmmword_1B413AA30);
  uint64_t v13 = 0x800000000;
  if (!a2) {
    uint64_t v13 = 0;
  }
  int8x16_t v14 = vorrq_s8(v11, v12);
  return (*(void *)&vorr_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)) | v7 | v13) ^ v9;
}

id FailProofLocale(void *a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = EventKitUIBundle();
  id v3 = [v2 localizations];

  long long v4 = EventKitUIBundle();
  uint64_t v5 = [v4 preferredLocalizations];
  id v6 = [v5 firstObject];

  if (v1)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F28B50];
    v12[0] = v1;
    v12[1] = v6;
    float64x2_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v9 = [v7 preferredLocalizationsFromArray:v3 forPreferences:v8];

    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

id BadgeImageForAlternateWorkday(void *a1, uint64_t a2, void *a3, float64_t a4)
{
  id v7 = a1;
  id v8 = a3;
  if (BadgeImageForAlternateWorkday_onceToken != -1) {
    dispatch_once(&BadgeImageForAlternateWorkday_onceToken, &__block_literal_global_71);
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", _UniqueDotHashForColorAndRadiusAndInterfaceStyleAndLocale(v7, a2 == 1, v8, a4));
  id v10 = [(id)BadgeImageForAlternateWorkday___CachedAlternateWorkdayBadgeImages objectForKey:v9];
  if (!v10)
  {
    v23.width = a4;
    v23.height = a4;
    UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    int8x16_t v12 = CUIKTextColorForCalendarColorForStyle();
    CGContextBeginPath(CurrentContext);
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, a4, a4);
    id v13 = objc_claimAutoreleasedReturnValue();
    CGContextAddPath(CurrentContext, (CGPathRef)[v13 CGPath]);
    CGContextClip(CurrentContext);
    if (a2 == 2) {
      CUIKColorDarkenedToPercentageWithFinalAlpha();
    }
    else {
    int8x16_t v14 = CUIKColorLightenedToPercentageWithFinalAlpha();
    }
    [v14 setFill];
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = a4;
    v24.size.height = a4;
    CGContextFillEllipseInRect(CurrentContext, v24);
    [v12 setFill];
    uint64_t v15 = EventKitUIBundle();
    float64x2_t v16 = FailProofLocale(v8);
    id v17 = [v15 localizedStringForKey:@"Alternate workday character glyph" value:@"W" table:0 localization:v16];

    float64x2_t v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:ceil(a4 * 0.75)];
    objc_msgSend(v17, "_legacy_sizeWithFont:", v18);
    CalRoundToScreenScale((a4 - v19) * 0.5);
    objc_msgSend(v17, "drawInRect:withFont:lineBreakMode:alignment:lineSpacing:", v18, 2, 1, 0, 0.0, v20, a4, a4);
    id v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)BadgeImageForAlternateWorkday___CachedAlternateWorkdayBadgeImages setObject:v10 forKey:v9];
  }

  return v10;
}

void __BadgeImageForAlternateWorkday_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)BadgeImageForAlternateWorkday___CachedAlternateWorkdayBadgeImages;
  BadgeImageForAlternateWorkday___CachedAlternateWorkdayBadgeImages = v0;
}

id ImageForAttributes(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F30EB8];
  id v2 = a1;
  id v3 = [v1 imageForStyle:v2 size:3 forScale:0 format:EKUIScaleFactor()];

  return v3;
}

id ImageForMapItem(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F30EB8];
  id v2 = a1;
  id v3 = [v1 imageForMapItem:v2 forScale:0 fallbackToBundleIcon:EKUIScaleFactor()];

  if (!v3)
  {
    id v3 = MapPinImage();
  }

  return v3;
}

id MapPinImage()
{
  uint64_t v0 = [MEMORY[0x1E4F645A0] markerStyleAttributes];
  id v1 = [MEMORY[0x1E4F30EB8] imageForStyle:v0 size:4 forScale:0 format:EKUIScaleFactor()];

  return v1;
}

void sub_1B4006AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4009FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B400A9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(v21);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1B400D154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

id getCNComposeRecipientClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNComposeRecipientClass_softClass_0;
  uint64_t v7 = getCNComposeRecipientClass_softClass_0;
  if (!getCNComposeRecipientClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientClass_block_invoke_0;
    v3[3] = &unk_1E6087D90;
    v3[4] = &v4;
    __getCNComposeRecipientClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B400EA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNComposeRecipientClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ContactsAutocompleteUILibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E60898F8;
    uint64_t v5 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_0) {
    __getCNComposeRecipientClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CNComposeRecipient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNComposeRecipientClass_block_invoke_cold_2_0();
  }
  getCNComposeRecipientClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsAutocompleteUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ContactsAutocompleteUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1B401080C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v29 - 144));
  _Unwind_Resume(a1);
}

void sub_1B4012BDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1B40131A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1B4013898(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1B4014200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 144));
  _Unwind_Resume(a1);
}

void sub_1B401470C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_1B401AB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  objc_destroyWeak(v37);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sub_1B401F2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id a45)
{
  objc_destroyWeak(v46);
  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a45);
  _Unwind_Resume(a1);
}

void sub_1B4024ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40259F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B40283CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

void locationAuthorizationsChanged()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"EKAlarmsViewModelTTLLocationAuthorizationStatusNeedsReloadNotification" object:0];
}

void sub_1B402B0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double LongTailSpringAnimaionGoodEnoughEndingTime()
{
  return springAnimationDuration() * 0.5;
}

void sub_1B402E44C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_1B4032A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1B4033C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_1B40350D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4037AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose((const void *)(v60 - 232), 8);
  _Block_object_dispose((const void *)(v60 - 184), 8);
  _Block_object_dispose((const void *)(v60 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_1B40383DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4039CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1B4040684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_1B4040A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t CompareEKAttachments(void *a1, const char *a2)
{
  return [a1 compareFileNames:a2];
}

void sub_1B404A988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(v27);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1B404C43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

id CalDisplayedTitleForSourceAsCalendarTarget(void *a1)
{
  id v1 = a1;
  if ([v1 sourceType] == 4)
  {
    uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v3 = [v2 model];

    if ([v3 isEqualToString:@"iPhone"])
    {
      uint64_t v4 = EventKitUIBundle();
      uint64_t v5 = v4;
      uint64_t v6 = @"On My iPhone";
    }
    else if ([v3 isEqualToString:@"iPad"])
    {
      uint64_t v4 = EventKitUIBundle();
      uint64_t v5 = v4;
      uint64_t v6 = @"On My iPad";
    }
    else
    {
      int v8 = [v3 isEqualToString:@"iPod touch"];
      uint64_t v4 = EventKitUIBundle();
      uint64_t v5 = v4;
      if (v8) {
        uint64_t v6 = @"On My iPod touch";
      }
      else {
        uint64_t v6 = @"On My Device";
      }
    }
    uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];
  }
  else
  {
    uint64_t v7 = CUIKDisplayedTitleForSource();
  }

  return v7;
}

void CalAddInlineMenuItemArrayToArrayWithTitle(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB1970];
    id v6 = a1;
    id v7 = [v5 menuWithTitle:a3 image:0 identifier:0 options:1 children:a2];
    objc_msgSend(v6, "addObject:");
  }
  else
  {
    id v7 = a1;
    [v7 addObjectsFromArray:a2];
  }
}

BOOL _CalEventIsOnOneDay(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = CUIKCalendar();
  id v6 = [v5 components:28 fromDate:v4];

  id v7 = [v5 components:28 fromDate:v3];

  uint64_t v8 = [v6 day];
  if (v8 == [v7 day] && (uint64_t v9 = objc_msgSend(v6, "month"), v9 == objc_msgSend(v7, "month")))
  {
    uint64_t v10 = [v6 year];
    BOOL v11 = v10 == [v7 year];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void _CalDetailStringsForDate(void *a1, void *a2, void *a3, void *a4, char a5, uint64_t a6, int a7, void *a8, void *a9, void *a10, void *a11)
{
  id v17 = a10;
  id v61 = a1;
  id v18 = a2;
  id v60 = a3;
  id v19 = a4;
  BOOL v20 = _CalEventIsOnOneDay(v61, v18);
  BOOL v21 = v20;
  if (a5)
  {
    if (v20)
    {
      if (a7)
      {
        double v22 = EventKitUIBundle();
        CGSize v23 = [v22 localizedStringForKey:@"All day" value:&stru_1F0CC2140 table:0];

        CGRect v24 = 0;
        uint64_t v25 = 0;
        double v26 = 0;
LABEL_20:
        double v36 = a11;
LABEL_21:
        double v37 = a9;
        goto LABEL_28;
      }
      double v26 = CUIKLongDayStringForDate();
      uint64_t v53 = EventKitUIBundle();
      CGSize v23 = [v53 localizedStringForKey:@"All day" value:&stru_1F0CC2140 table:0];
    }
    else
    {
      double v28 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
      uint64_t v29 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
      double v30 = NSString;
      uint64_t v31 = EventKitUIBundle();
      uint64_t v32 = [v31 localizedStringForKey:@"All day from %@" value:&stru_1F0CC2140 table:0];
      double v26 = objc_msgSend(v30, "localizedStringWithFormat:", v32, v28);

      double v33 = NSString;
      double v34 = EventKitUIBundle();
      double v35 = [v34 localizedStringForKey:@"to %@" value:&stru_1F0CC2140 table:0];
      CGSize v23 = objc_msgSend(v33, "localizedStringWithFormat:", v35, v29);

      id v17 = a10;
    }
    CGRect v24 = 0;
    uint64_t v25 = 0;
    goto LABEL_20;
  }
  if (CUIKShouldShowTimezoneClarification()) {
    int v27 = 1;
  }
  else {
    int v27 = CUIKShouldShowTimezoneClarification();
  }
  if (!v21)
  {
    id v58 = v19;
    uint64_t v38 = CUIKStringForTimeWithTZIfDivergent();
    uint64_t v39 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    uint64_t v40 = CUIKStringForTimeWithTZIfDivergent();
    uint64_t v41 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    double v42 = EventKitUIBundle();
    double v43 = [v42 localizedStringForKey:@"from %@ %@" value:&stru_1F0CC2140 table:0];

    uint64_t v44 = EventKitUIBundle();
    double v45 = [v44 localizedStringForKey:@"to %@ %@" value:&stru_1F0CC2140 table:0];

    double v57 = (void *)v39;
    double v26 = objc_msgSend(NSString, "localizedStringWithFormat:", v43, v38, v39);
    uint64_t v55 = (void *)v41;
    uint64_t v56 = (void *)v40;
    CGSize v23 = objc_msgSend(NSString, "localizedStringWithFormat:", v45, v40, v41);
    CGRect v24 = 0;
    uint64_t v25 = 0;
    if (v27)
    {
      double v46 = NSString;
      uint64_t v54 = v38;
      double v47 = CUIKStringForTimeWithTZ();
      double v48 = CUIKStringForDateAndDayOfWeekInTimezone();
      uint64_t v25 = objc_msgSend(v46, "localizedStringWithFormat:", v43, v47, v48);

      double v49 = NSString;
      double v50 = CUIKStringForTimeWithTZ();
      double v51 = CUIKStringForDateAndDayOfWeekInTimezone();
      double v52 = v49;
      uint64_t v38 = v54;
      CGRect v24 = objc_msgSend(v52, "localizedStringWithFormat:", v45, v50, v51);
    }
    double v36 = a11;
    id v17 = a10;
    id v19 = v58;
    goto LABEL_21;
  }
  if (!a6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"CUIKDetailStringsForDate: unspecified size class"];
  }
  if (a7)
  {
    CGSize v23 = CUIKDurationStringForDates();
    double v37 = a9;
    double v36 = a11;
    if (v27)
    {
      uint64_t v25 = CUIKTimezoneClarificationStringForDates();
      CGRect v24 = 0;
    }
    else
    {
      CGRect v24 = 0;
      uint64_t v25 = 0;
    }
    double v26 = 0;
  }
  else
  {
    double v26 = CUIKLongDayStringForDate();
    CGSize v23 = CUIKDurationStringForDates();
    double v37 = a9;
    double v36 = a11;
    if (v27)
    {
      uint64_t v25 = CUIKTimezoneClarificationStringForDates();
      CGRect v24 = 0;
    }
    else
    {
      CGRect v24 = 0;
      uint64_t v25 = 0;
    }
  }
  id v17 = a10;
LABEL_28:
  if (a8) {
    *a8 = v26;
  }
  if (v37) {
    *double v37 = v23;
  }
  if (v17) {
    void *v17 = v25;
  }
  if (v36) {
    *double v36 = v24;
  }
}

void CalDetailStringsForCalendarEvent(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, int a8)
{
  id v25 = a1;
  id v14 = a7;
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
    id v17 = [v25 endDateUnadjustedForLegacyClients];
    id v18 = [v25 startDate];
    [v17 timeIntervalSinceDate:v18];
    double v20 = v19;

    BOOL v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v16 sinceDate:v20];
    [v25 startTimeZone];
  }
  else
  {
    id v16 = [v25 startDate];
    BOOL v21 = [v25 endDateUnadjustedForLegacyClients];
    [v25 endTimeZone];
  double v22 = };
  CGSize v23 = [v25 startTimeZone];
  _CalDetailStringsForDate(v16, v21, v23, v22, [v25 isAllDay], a2, a8, a3, a4, a5, a6);
}

uint64_t CalAddInlineMenuItemArrayToArray(void *a1, const char *a2)
{
  return [a1 addObjectsFromArray:a2];
}

uint64_t CalRecurrenceDateMatchesAnyDaySpecifiedInByDayList()
{
  return MEMORY[0x1F410F8C8]();
}

uint64_t CalRecurrenceMonthMatchesAnyMonthSpecifiedInByMonthList()
{
  return MEMORY[0x1F410F8E0]();
}

uint64_t CalRecurrenceDateMatchesAnyDaySpecifiedInByMonthDayList()
{
  return MEMORY[0x1F410F8D0]();
}

uint64_t CompareEKCalendars()
{
  return MEMORY[0x1F410F710]();
}

void sub_1B405158C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void sub_1B405247C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

BOOL EKUIUsesLargeTextYearView(void *a1)
{
  if (a1)
  {
    id v1 = [a1 preferredContentSizeCategory];
  }
  else
  {
    uint64_t v2 = +[EKUIApplicationExtensionOverrides shared];
    id v1 = [v2 preferredContentSizeCategoryOrOverride];
  }
  BOOL v3 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) == NSOrderedDescending;

  return v3;
}

void sub_1B4052D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40545C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4056520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

double EKRoundWithScale(double a1, double a2)
{
  double v2 = a2;
  if (a2 == 0.0)
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    double v2 = v5;
  }
  return round(v2 * a1) / v2;
}

void sub_1B4058F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4059DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4059F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B405BBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B40600E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

Class __getREMObjectIDClass_block_invoke_0(uint64_t a1)
{
  ReminderKitLibrary_0();
  Class result = objc_getClass("REMObjectID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMObjectIDClass_block_invoke_cold_1_0();
  }
  getREMObjectIDClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ReminderKitLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ReminderKitLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E608A530;
    uint64_t v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_0) {
    ReminderKitLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ReminderKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getREMStoreClass_block_invoke_0(uint64_t a1)
{
  ReminderKitLibrary_0();
  Class result = objc_getClass("REMStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMStoreClass_block_invoke_cold_1_0();
  }
  getREMStoreClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B4065FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

double CalRoundEdgeInsetsToScreenScale(double a1, double a2, double a3, double a4)
{
  if (a2 != (double)(int)a2) {
    UIRoundToViewScale();
  }
  if (a4 != (double)(int)a4) {
    UIRoundToViewScale();
  }
  if (a1 != (double)(int)a1)
  {
    UIRoundToViewScale();
    a1 = v7;
  }
  if (a3 != (double)(int)a3) {
    UIRoundToViewScale();
  }
  return a1;
}

double CalFloorRectToScreenScale(double a1)
{
  uint64_t v2 = CalFloorToScreenScale___scale;
  if (*(double *)&CalFloorToScreenScale___scale == -1.0)
  {
    *(double *)&uint64_t v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (a1 != 0.0) {
    a1 = floor(a1 * *(double *)&v2) / *(double *)&v2;
  }
  if (*(double *)&v2 == -1.0)
  {
    *(double *)&uint64_t v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (*(double *)&v2 == -1.0)
  {
    *(double *)&uint64_t v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (*(double *)&v2 == -1.0) {
    CalFloorToScreenScale___scale = _EKUIScaleFactor();
  }
  return a1;
}

BOOL CalIsRectEffectivelyEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  float v8 = a1;
  float v9 = a5;
  if (vabds_f32(v8, v9) >= 0.00000011921) {
    return 0;
  }
  float v10 = a2;
  float v11 = a6;
  if (vabds_f32(v10, v11) >= 0.00000011921) {
    return 0;
  }
  float v12 = a3;
  float v13 = a7;
  if (vabds_f32(v12, v13) >= 0.00000011921) {
    return 0;
  }
  float v14 = a4;
  float v15 = a8;
  return vabds_f32(v14, v15) < 0.00000011921;
}

double CalRoundPointToScreenScale(double a1, double a2)
{
  double v3 = a1;
  if (a1 != (double)(int)a1)
  {
    UIRoundToViewScale();
    double v3 = v4;
  }
  if (a2 != (double)(int)a2) {
    UIRoundToViewScale();
  }
  return v3;
}

double EKUIPixelSizeInPoints()
{
  if (EKUIPixelSizeInPoints_onceToken != -1) {
    dispatch_once(&EKUIPixelSizeInPoints_onceToken, &__block_literal_global_49);
  }
  return *(double *)&EKUIPixelSizeInPoints_pixelSizeInPoints;
}

void __EKUIPixelSizeInPoints_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v0 = _EKUIScaleFactor();
  if (v0 == 0.0)
  {
    uint64_t v1 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(v_Block_object_dispose(&STACK[0x2D0], 8) = 0;
    uint64_t v2 = "The main screen's scale is 0.0.  Will not calculate pixel size in points.";
    double v3 = v1;
    os_log_type_t v4 = OS_LOG_TYPE_ERROR;
    uint32_t v5 = 2;
  }
  else
  {
    double v6 = v0;
    *(double *)&EKUIPixelSizeInPoints_pixelSizeInPoints = 1.0 / v0;
    uint64_t v7 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    int v8 = 134218240;
    double v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = EKUIPixelSizeInPoints_pixelSizeInPoints;
    uint64_t v2 = "The main screen's scale is [%f].  The pixel size in points is [%f]";
    double v3 = v7;
    os_log_type_t v4 = OS_LOG_TYPE_DEBUG;
    uint32_t v5 = 22;
  }
  _os_log_impl(&dword_1B3F4C000, v3, v4, v2, (uint8_t *)&v8, v5);
}

void CalUpdateUserInterfaceDirection()
{
  id v0 = +[EKUIApplicationExtensionOverrides shared];
  _leftToRight = [v0 layoutDirectionOrOverride] == 0;
}

void _LocaleChanged()
{
  id v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  __calendarDirectionLeftToRight = [v0 _calendarDirection] == 0;
}

void sub_1B406700C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4068AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 168));
  _Unwind_Resume(a1);
}

void sub_1B4069968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B406CE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_1B406E524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B406EECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B406FB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DarkenWhiteIfNeeded(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (CUIKColorIsWhite())
  {
    uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
  }

  return v2;
}

id CalendarTitleWithDotAttributedString(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint32_t v5 = CUIKDisplayedTitleForCalendar();
  double v6 = [v4 displayColor];

  uint64_t v7 = CUIKAdjustedColorForBackgroundColor();

  int v8 = +[EKUICalendarMenu calendarCircleImageForColor:v7];
  double v9 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v8];
  __int16 v10 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"%@ %@"];
  float v13 = objc_msgSend(v11, "initWithFormat:options:locale:", v12, 0, 0, v10, v5);

  return v13;
}

uint64_t _calendarPreferencesTableAdditionsDefaultFont()
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

id _calendarPreferencesTableAdditionsBoldFont()
{
  id v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0 options:1];
  id v1 = objc_msgSend(v0, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v0, "symbolicTraits") | 2);
  uint64_t v2 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v1 size:0.0];

  return v2;
}

void sub_1B407CF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_1B407D224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40808C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4080A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4080BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

id getQLPreviewControllerClass()
{
  uint64_t v4 = 0;
  uint32_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getQLPreviewControllerClass_softClass;
  uint64_t v7 = getQLPreviewControllerClass_softClass;
  if (!getQLPreviewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getQLPreviewControllerClass_block_invoke;
    v3[3] = &unk_1E6087D90;
    v3[4] = &v4;
    __getQLPreviewControllerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B4082F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getQLPreviewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!QuickLookLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __QuickLookLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E608AA10;
    uint64_t v5 = 0;
    QuickLookLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!QuickLookLibraryCore_frameworkLibrary) {
    __getQLPreviewControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("QLPreviewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getQLPreviewControllerClass_block_invoke_cold_2();
  }
  getQLPreviewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuickLookLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuickLookLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B40848B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void PresentValidationAlert(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  EventKitUIBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v6 localizedStringForKey:@"Cannot Save Event" value:&stru_1F0CC2140 table:0];
  PresentValidationAlertWithDefaultTitle(v4, v3, v5);
}

void PresentValidationAlertWithDefaultTitle(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  id v9 = a1;
  __int16 v10 = [v7 userInfo];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];

  if (v11)
  {
    uint64_t v12 = *MEMORY[0x1E4F25440];
    goto LABEL_10;
  }
  float v13 = [v7 domain];
  uint64_t v12 = *MEMORY[0x1E4F25440];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F25440]];

  if (v14)
  {
    uint64_t v15 = [v7 code];
    if (v15 == 8)
    {
      id v16 = EventKitUIBundle();
      id v17 = v16;
      id v18 = @"Alert Time";
LABEL_8:
      id v11 = [v16 localizedStringForKey:v18 value:&stru_1F0CC2140 table:0];

      if (v11) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    if (v15 == 7)
    {
      id v16 = EventKitUIBundle();
      id v17 = v16;
      id v18 = @"Cannot Repeat Event";
      goto LABEL_8;
    }
  }
LABEL_9:
  id v11 = v8;
LABEL_10:

  id v27 = v7;
  double v19 = [v27 domain];
  int v20 = [v19 isEqualToString:v12];

  if (v20)
  {
    BOOL v21 = [v27 localizedDescription];
  }
  else
  {
    BOOL v21 = 0;
  }

  double v22 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v21 preferredStyle:1];
  CGSize v23 = (void *)MEMORY[0x1E4FB1410];
  CGRect v24 = EventKitUIBundle();
  id v25 = [v24 localizedStringForKey:@"OK" value:&stru_1F0CC2140 table:0];
  double v26 = [v23 actionWithTitle:v25 style:1 handler:0];
  [v22 addAction:v26];

  [v9 presentViewController:v22 animated:1 completion:0];
}

void PresentJunkAlertControllerWithHandler(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  id v7 = EventKitUIBundle();
  id v8 = [v7 localizedStringForKey:@"You can report this invitation as junk by sending it to Apple." value:&stru_1F0CC2140 table:0];

  id v9 = EventKitUIBundle();
  __int16 v10 = [v9 localizedStringForKey:@"Delete and Report Junk" value:&stru_1F0CC2140 table:0];

  id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:0 preferredStyle:a2];
  uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __PresentJunkAlertControllerWithHandler_block_invoke;
  v19[3] = &unk_1E608A7C0;
  id v20 = v5;
  id v13 = v5;
  int v14 = [v12 actionWithTitle:v10 style:2 handler:v19];
  [v11 addAction:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  id v16 = EventKitUIBundle();
  id v17 = [v16 localizedStringForKey:@"Cancel - report as spam" value:@"Cancel" table:0];
  id v18 = [v15 actionWithTitle:v17 style:1 handler:0];
  [v11 addAction:v18];

  [v6 presentViewController:v11 animated:1 completion:0];
}

uint64_t __PresentJunkAlertControllerWithHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void PresentJunkAlertControllerForEvent(void *a1, void *a2)
{
  id v3 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertControllerForEvent_block_invoke;
  v5[3] = &unk_1E6087570;
  id v6 = v3;
  id v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 0, v5);
}

uint64_t __PresentJunkAlertControllerForEvent_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsJunk:1 shouldSave:1];
}

void PresentJunkAlertDialogForEvent(void *a1, void *a2)
{
  id v3 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertDialogForEvent_block_invoke;
  v5[3] = &unk_1E6087570;
  id v6 = v3;
  id v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 1, v5);
}

uint64_t __PresentJunkAlertDialogForEvent_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsJunk:1 shouldSave:1];
}

void PresentJunkAlertControllerForCalendar(void *a1, void *a2)
{
  id v3 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertControllerForCalendar_block_invoke;
  v5[3] = &unk_1E6087570;
  id v6 = v3;
  id v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 0, v5);
}

uint64_t __PresentJunkAlertControllerForCalendar_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsJunk:1];
}

void PresentJunkAlertDialogForCalendar(void *a1, void *a2)
{
  id v3 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertDialogForCalendar_block_invoke;
  v5[3] = &unk_1E6087570;
  id v6 = v3;
  id v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 1, v5);
}

uint64_t __PresentJunkAlertDialogForCalendar_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsJunk:1];
}

void sub_1B40862C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40868A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4086A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4088808(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

Class __getREMRecurrenceRuleFormatterClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ReminderKitLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E608AA50;
    uint64_t v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_1) {
    __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("REMRecurrenceRuleFormatter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMRecurrenceRuleFormatterClass_block_invoke_cold_2();
  }
  getREMRecurrenceRuleFormatterClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

objc_class *__MessageUIClassFromString(void *a1)
{
  uint64_t v1 = a1;
  if (__MessageUIHandle_MessageUIHandle) {
    goto LABEL_5;
  }
  uint64_t v2 = MEMORY[0x1BA9857A0]();
  id v3 = [v2 stringByAppendingPathComponent:@"System/Library/Frameworks/MessageUI.framework/MessageUI"];

  id v4 = v3;
  __MessageUIHandle_MessageUIHandle = (uint64_t)dlopen((const char *)[v4 fileSystemRepresentation], 1);
  if (!__MessageUIHandle_MessageUIHandle)
  {
    uint64_t v5 = dlerror();
    NSLog(&cfstr_CouldnTLoadMes.isa, v5);
  }

  if (__MessageUIHandle_MessageUIHandle) {
LABEL_5:
  }
    Class v6 = NSClassFromString(v1);
  else {
    Class v6 = 0;
  }
  id v7 = v6;

  return v7;
}

void sub_1B408A28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B408A980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B408C2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id EKUILogSignpostHandle()
{
  if (EKUILogSignpostHandle_onceToken != -1) {
    dispatch_once(&EKUILogSignpostHandle_onceToken, &__block_literal_global_7);
  }
  id v0 = (void *)EKUILogSignpostHandle_handle;

  return v0;
}

void __EKUILogSignpostHandle_block_invoke()
{
  os_log_t v0 = os_log_create(EKUILogSubsystem, "signpost");
  uint64_t v1 = (void *)EKUILogSignpostHandle_handle;
  EKUILogSignpostHandle_handle = (uint64_t)v0;
}

void sub_1B40901EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 256));
  _Unwind_Resume(a1);
}

uint64_t _EKUIAssert(uint64_t result, uint64_t a2)
{
  if ((result & 1) == 0) {
    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"EKUIDeviceCapabilities assertion failed: %@", a2 format];
  }
  return result;
}

BOOL _floatLessThanOrEqual(double a1, double a2)
{
  return a2 - a1 > -0.001;
}

uint64_t EKUICatalyst()
{
  return 0;
}

BOOL EKUIUnscaledCatalyst()
{
  os_log_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  return v1 == 5;
}

double EKUIUnscaledCatalystTableRowHeightDefault()
{
  return 34.0;
}

double EKUILayoutMarginsForFullscreenLayoutRectWithSize(void *a1, double a2)
{
  [a1 layoutMargins];
  double v4 = v3;
  if (a2 <= 1024.0 && a2 <= 700.0 && a2 <= 678.0 && a2 <= 414.0 && a2 > 375.0) {
    CalRoundToScreenScale(22.3333333);
  }
  return v4;
}

uint64_t EKUIShouldUseUIKitLayoutMargins()
{
  os_log_t v0 = EKUIMainWindowForMultiwindowError();
  objc_msgSend(v0, "ekui_size");
  uint64_t v3 = 0;
  if (v0)
  {
    if (v1 > 1.0 && v2 > 1.0)
    {
      uint64_t v5 = EKUIWindowSizeParadigmForWindowSize(v1, v2);
      uint64_t v3 = 1;
      if (v5 <= 0x1FFFFFF)
      {
        if (v5 != 0x80000 && v5 != 0x800000) {
          goto LABEL_13;
        }
      }
      else if (v5 != 0x2000000 && v5 != 0x8000000 && v5 != 0x20000000)
      {
LABEL_13:
        uint64_t v3 = 0;
      }
    }
  }

  return v3;
}

uint64_t EKUIIsCompactThickWidthRegularTallHeight()
{
  os_log_t v0 = EKUIMainWindowForMultiwindowError();
  objc_msgSend(v0, "ekui_size");
  uint64_t v3 = 0;
  if (v0)
  {
    if (v1 > 1.0 && v2 > 1.0)
    {
      uint64_t v5 = EKUIWindowSizeParadigmForWindowSize(v1, v2);
      uint64_t v3 = 1;
      if (v5 <= 0xFFFFFF)
      {
        if (v5 != 0x40000 && v5 != 0x400000) {
          goto LABEL_13;
        }
      }
      else if (v5 != 0x1000000 && v5 != 0x4000000 && v5 != 0x10000000)
      {
LABEL_13:
        uint64_t v3 = 0;
      }
    }
  }

  return v3;
}

uint64_t _EKUIOverriddenTraitsPhonesBehaveLikeiPhoneSixPlus()
{
  return 0;
}

uint64_t EKUIIsExtended(void *a1)
{
  id v1 = a1;
  uint64_t v2 = EKUICurrentWindowSizeParadigmForViewHierarchy(v1);
  if (_EKUIActiveWidthSizeClass(v1) == 1)
  {
    if (v2 == 0x20000) {
      goto LABEL_6;
    }
    double v3 = EKUICurrentWindowWidthWithViewHierarchy(v1);
    double v4 = EKUICurrentWindowHeightWithViewHierarchy(v1);
    if (v3 >= v4) {
      double v4 = v3;
    }
    if (fabs(v4 + -812.0) < 2.22044605e-16)
    {
LABEL_6:
      uint64_t v5 = 1;
      goto LABEL_22;
    }
  }
  uint64_t v5 = 1;
  if (v2 > 0x1FFFFFF)
  {
    if (v2 <= 0x7FFFFFF)
    {
      if (v2 == 0x2000000) {
        goto LABEL_22;
      }
      uint64_t v6 = 0x4000000;
      goto LABEL_21;
    }
    if (v2 != 0x8000000 && v2 != 0x10000000)
    {
      uint64_t v6 = 0x20000000;
LABEL_21:
      if (v2 == v6) {
        goto LABEL_22;
      }
LABEL_23:
      uint64_t v5 = 0;
    }
  }
  else if (v2 < 0x400000)
  {
    if (v2 != 0x40000 && v2 != 0x80000) {
      goto LABEL_23;
    }
  }
  else if (v2 != 0x400000 && v2 != 0x800000)
  {
    uint64_t v6 = 0x1000000;
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

uint64_t EKUIIsSizeExtended(double a1, double a2)
{
  uint64_t v4 = EKUIWindowSizeParadigmForWindowSize(a1, a2);
  uint64_t result = 1;
  if (v4 <= 0x1FFFFFF)
  {
    if (v4 == 0x80000 || v4 == 0x800000) {
      return result;
    }
  }
  else if (v4 == 0x2000000 || v4 == 0x8000000 || v4 == 0x20000000)
  {
    return result;
  }
  double v6 = -(375.0 - a2);
  if (375.0 - a2 >= 0.0) {
    double v6 = 375.0 - a2;
  }
  if (v6 >= 0.00001) {
    return 0;
  }
  double v7 = 812.0 - a1;
  if (812.0 - a1 < 0.0) {
    double v7 = -(812.0 - a1);
  }
  if (v7 >= 0.00001) {
    return 0;
  }
  return result;
}

double EKUIApplicationFrame(void *a1)
{
  id v1 = a1;
  EKUICurrentWindowWidthWithViewHierarchy(v1);
  EKUICurrentWindowHeightWithViewHierarchy(v1);

  return 0.0;
}

double EKUIContainedControllerIdealWidth()
{
  os_log_t v0 = +[EKUIApplicationExtensionOverrides shared];
  id v1 = [v0 viewHierarchyOrOverride];

  double v2 = fmin(EKUICurrentWindowWidthWithViewHierarchy(v1), 375.0);
  return v2;
}

double EKUIContainedControllerIdealHeight()
{
  os_log_t v0 = +[EKUIApplicationExtensionOverrides shared];
  id v1 = [v0 viewHierarchyOrOverride];

  double v2 = fmin(EKUICurrentWindowHeightWithViewHierarchy(v1), 667.0);
  return v2;
}

double EKUIHeightForWindowSizeParadigm(uint64_t a1)
{
  double result = 320.0;
  if (a1 >= 0x20000)
  {
    if (a1 > 0xFFFFFF)
    {
      if (a1 <= 0x7FFFFFF)
      {
        switch(a1)
        {
          case 0x1000000:
            return 926.0;
          case 0x2000000:
            return 428.0;
          case 0x4000000:
            return 852.0;
        }
      }
      else if (a1 > 0x1FFFFFFF)
      {
        if (a1 == 0x20000000)
        {
          return 430.0;
        }
        else if (a1 == 0x40000000)
        {
          return 728.0;
        }
      }
      else if (a1 == 0x8000000)
      {
        return 393.0;
      }
      else if (a1 == 0x10000000)
      {
        return 932.0;
      }
      return result;
    }
    if (a1 >= 0x100000)
    {
      if (a1 >= 0x400000)
      {
        if (a1 == 0x400000) {
          return 844.0;
        }
        if (a1 == 0x800000) {
          return 390.0;
        }
        return result;
      }
      if (a1 == 0x100000) {
        return 1194.0;
      }
      if (a1 == 0x200000) {
        return 834.0;
      }
      return result;
    }
    if (a1 == 0x20000) {
      return 812.0;
    }
    if (a1 == 0x40000) {
      return 896.0;
    }
    if (a1 != 0x80000) {
      return result;
    }
    return 414.0;
  }
  if (a1 <= 1023)
  {
    if (a1 <= 15)
    {
      switch(a1)
      {
        case -1:
          if (_shouldAssertOnUnknownWindow_onceToken != -1) {
            dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_49);
          }
          if (_shouldAssertOnUnknownWindow_shouldAssert) {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"EKUIDeviceCapabilities assertion failed: %@", @"EKUIHeightForWindowSizeParadigm: Unable to find window height for paradigm" format];
          }
          return 1.84467441e19;
        case 2:
          return 480.0;
        case 4:
          double result = 568.0;
          break;
        case 8:
          return 768.0;
        default:
          return result;
      }
      return result;
    }
    if (a1 <= 127)
    {
      if (a1 == 16) {
        return 667.0;
      }
      if (a1 == 32) {
        return 736.0;
      }
      return result;
    }
    if (a1 != 128 && a1 != 512) {
      return result;
    }
    return 768.0;
  }
  if (a1 < 0x2000)
  {
    if (a1 != 1024)
    {
      if (a1 != 2048)
      {
        if (a1 != 4096) {
          return result;
        }
        return 768.0;
      }
      return 1024.0;
    }
    return 414.0;
  }
  if (a1 < 0x8000)
  {
    if (a1 == 0x2000) {
      return 1366.0;
    }
    if (a1 != 0x4000) {
      return result;
    }
    return 1024.0;
  }
  if (a1 == 0x8000) {
    return 1112.0;
  }
  if (a1 == 0x10000) {
    return 834.0;
  }
  return result;
}

BOOL EKUICurrentHeightSizeClassIsRegular(void *a1)
{
  return _EKUIActiveHeightSizeClass(a1) == 2;
}

uint64_t EKUIInterfaceOrientationForViewHierarchy(void *a1)
{
  id v1 = _rootHierarchyForViewHierarchy(a1);
  uint64_t v2 = objc_msgSend(v1, "ekui_interfaceOrientation");

  return v2;
}

double EKUIGoldenRatioPhi()
{
  return 1.61803399;
}

uint64_t EKUIGoldenRatioColumnWidthMinor(double a1)
{
  return CalRoundToScreenScale(a1 / 2.61803399);
}

uint64_t EKUIGoldenRatioColumnWidthMajor(double a1)
{
  CalRoundToScreenScale(a1 / 2.61803399);
  double v2 = v1 * 1.61803399;

  return CalRoundToScreenScale(v2);
}

BOOL EKUICurrentWidthSizeClassIsRegular()
{
  os_log_t v0 = +[EKUIApplicationExtensionOverrides shared];
  double v1 = [v0 viewHierarchyOrOverride];

  BOOL v2 = _EKUIActiveWidthSizeClass(v1) == 2;
  return v2;
}

void sub_1B409181C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B409281C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40946D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4097DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1B4098588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B409CCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

void sub_1B409F570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void sub_1B409F7BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1B40A62A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40AB9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCNComposeRecipientTextViewClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getCNComposeRecipientTextViewClass_softClass;
  uint64_t v7 = getCNComposeRecipientTextViewClass_softClass;
  if (!getCNComposeRecipientTextViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientTextViewClass_block_invoke;
    v3[3] = &unk_1E6087D90;
    v3[4] = &v4;
    __getCNComposeRecipientTextViewClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B40ABB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B40AC0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

id getCNComposeRecipientClass_1()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getCNComposeRecipientClass_softClass_1;
  uint64_t v7 = getCNComposeRecipientClass_softClass_1;
  if (!getCNComposeRecipientClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientClass_block_invoke_1;
    v3[3] = &unk_1E6087D90;
    v3[4] = &v4;
    __getCNComposeRecipientClass_block_invoke_1((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B40AC1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B40ACCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40ADAF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B40AE0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B40AE2DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B40AE508(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B40AEC14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B40AEDD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getCNAutocompleteResultsTableViewControllerClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteUILibrary();
  Class result = objc_getClass("CNAutocompleteResultsTableViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAutocompleteResultsTableViewControllerClass_block_invoke_cold_1();
  }
  getCNAutocompleteResultsTableViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ContactsAutocompleteUILibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_1)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ContactsAutocompleteUILibraryCore_block_invoke_1;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E608AE28;
    uint64_t v2 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_1) {
    ContactsAutocompleteUILibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ContactsAutocompleteUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  ContactsAutocompleteUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getCNComposeRecipientTextViewClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteUILibrary();
  Class result = objc_getClass("CNComposeRecipientTextView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNComposeRecipientTextViewClass_block_invoke_cold_1();
  }
  getCNComposeRecipientTextViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNComposeRecipientClass_block_invoke_1(uint64_t a1)
{
  ContactsAutocompleteUILibrary();
  Class result = objc_getClass("CNComposeRecipient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNComposeRecipientClass_block_invoke_cold_1_1();
  }
  getCNComposeRecipientClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNComposeRecipientGroupClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteUILibrary();
  Class result = objc_getClass("CNComposeRecipientGroup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNComposeRecipientGroupClass_block_invoke_cold_1();
  }
  getCNComposeRecipientGroupClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNComposeRecipientOriginContextClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteUILibrary();
  Class result = objc_getClass("CNComposeRecipientOriginContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNComposeRecipientOriginContextClass_block_invoke_cold_1();
  }
  getCNComposeRecipientOriginContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAutocompleteSearchManagerClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteUILibrary();
  Class result = objc_getClass("CNAutocompleteSearchManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAutocompleteSearchManagerClass_block_invoke_cold_1();
  }
  getCNAutocompleteSearchManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B40B2A2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

id getPKScribbleInteractionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getPKScribbleInteractionClass_softClass;
  uint64_t v7 = getPKScribbleInteractionClass_softClass;
  if (!getPKScribbleInteractionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPKScribbleInteractionClass_block_invoke;
    v3[3] = &unk_1E6087D90;
    v3[4] = &v4;
    __getPKScribbleInteractionClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B40B6D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKScribbleInteractionClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PencilKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PencilKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E608AF20;
    uint64_t v5 = 0;
    PencilKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PencilKitLibraryCore_frameworkLibrary) {
    __getPKScribbleInteractionClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PKScribbleInteraction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPKScribbleInteractionClass_block_invoke_cold_2();
  }
  getPKScribbleInteractionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PencilKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PencilKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B40BA2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40BA764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40BB4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40BCA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40BD1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1B40C5824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40C8254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double DraggedEventShadowOffset()
{
  return 0.0;
}

uint64_t DraggedEventShadowColor()
{
  id v0 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v1 = [v0 CGColor];

  return v1;
}

double pinchDistanceForGestureRecognizer(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 locationOfTouch:0 inView:v3];
  double v6 = v5;
  [v4 locationOfTouch:1 inView:v3];
  double v8 = v7;

  return vabdd_f64(v6, v8);
}

void CalPlopView(void *a1)
{
}

double CalSnapDateTo15MinuteOr5MinuteInterval(void *a1, int a2, double a3)
{
  id v5 = a1;
  double v6 = v5;
  if (a2)
  {
    if (!v5 || ([v5 isNew] & 1) != 0) {
      goto LABEL_8;
    }
    double v7 = [v6 startDate];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = a3 - v8;

    double v10 = -v9;
    if (v9 >= 0.0) {
      double v10 = v9;
    }
    if (v10 >= 149.0)
    {
LABEL_8:
      uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      int v14 = [v6 eventStore];
      uint64_t v15 = [v14 timeZone];

      if (v15)
      {
        id v16 = [v6 eventStore];
        id v17 = [v16 timeZone];
        [v11 setTimeZone:v17];
      }
      id v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
      double v19 = [v11 components:224 fromDate:v18];

      uint64_t v20 = [v19 minute];
      uint64_t v21 = [v19 second] + 60 * v20;
      if (a2 != 3 && v21 >= 151 && v21 <= 449
        || a2 == 2 && v21 >= 1951 && v21 <= 2249
        || a2 == 3 && v21 >= 3151 && v21 <= 3449)
      {
        double v13 = round(a3 / 300.0) * 300.0;
      }
      else
      {
        double v13 = _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(v6, a3, 149.0);
      }
    }
    else
    {
      uint64_t v11 = [v6 startDate];
      [v11 timeIntervalSinceReferenceDate];
      double v13 = v12;
    }
  }
  else
  {
    double v13 = _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(v5, a3, 900.0);
  }

  return v13;
}

void CalPopViewIn(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 setAlpha:0.0];
  CGAffineTransformMakeScale(&v14, 0.1, 0.1);
  CGAffineTransform v13 = v14;
  [v3 setTransform:&v13];
  id v5 = (void *)MEMORY[0x1E4FB1EB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __CalPopViewIn_block_invoke;
  v11[3] = &unk_1E6087570;
  id v12 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CalPopViewIn_block_invoke_2;
  v8[3] = &unk_1E608B3A0;
  id v9 = v12;
  id v10 = v4;
  id v6 = v4;
  id v7 = v12;
  [v5 animateWithDuration:0x20000 delay:v11 options:v8 animations:0.100000001 completion:0.0];
}

void CalScaleViewIn(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  [v11 frame];
  double v14 = dbl_1B413B140[a5 - v13 == 0.0];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F39B48], "animationWithKeyPath:", @"shadowOpacity", a5 - v13);
  [v15 setDuration:v14];
  id v16 = [NSNumber numberWithFloat:0.0];
  [v15 setFromValue:v16];

  id v17 = NSNumber;
  id v18 = [v11 layer];
  [v18 shadowOpacity];
  double v19 = objc_msgSend(v17, "numberWithFloat:");
  [v15 setToValue:v19];

  uint64_t v20 = [v11 layer];
  [v20 addAnimation:v15 forKey:@"animateOpacity"];

  uint64_t v21 = (void *)MEMORY[0x1E4FB1EB0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __CalScaleViewIn_block_invoke;
  v27[3] = &unk_1E60896F8;
  id v28 = v11;
  double v29 = a3;
  double v30 = a4;
  double v31 = a5;
  double v32 = a6;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __CalScaleViewIn_block_invoke_2;
  v24[3] = &unk_1E608B3A0;
  id v25 = v28;
  id v26 = v12;
  id v22 = v12;
  id v23 = v28;
  [v21 animateWithDuration:0x20000 delay:v27 options:v24 animations:v14 completion:0.0];
}

void CalSwitchViewToSuperview(void *a1, void *a2)
{
  id v14 = a1;
  id v3 = a2;
  id v4 = [v14 superview];

  if (v4 != v3)
  {
    if (v3)
    {
      id v5 = [v14 superview];
      [v14 frame];
      objc_msgSend(v5, "convertRect:toView:", v3);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      [v3 addSubview:v14];
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
    }
    else
    {
      [v14 removeFromSuperview];
    }
  }
}

void sub_1B40D5CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B40D6DAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

double CalSnapDateTo15MinuteInterval(void *a1, double a2)
{
  return _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(a1, a2, 900.0);
}

double _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = v5;
  if (!v5 || ([v5 isNew] & 1) != 0) {
    goto LABEL_7;
  }
  double v7 = [v6 startDate];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = a2 - v8;

  double v10 = -v9;
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  if (v10 >= a3)
  {
LABEL_7:
    double v13 = round(a2 / 900.0) * 900.0;
  }
  else
  {
    double v11 = [v6 startDate];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;
  }
  return v13;
}

uint64_t __CalPopViewIn_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  CGAffineTransformMakeScale(&v5, 1.11, 1.11);
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

void __CalPopViewIn_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __CalPopViewIn_block_invoke_3;
  v6[3] = &unk_1E6087570;
  id v7 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CalPopViewIn_block_invoke_4;
  v3[3] = &unk_1E608B3A0;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:0 delay:v6 options:v3 animations:0.100000001 completion:0.0];
}

uint64_t __CalPopViewIn_block_invoke_3(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.95, 0.95);
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

void __CalPopViewIn_block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __CalPopViewIn_block_invoke_5;
  v6[3] = &unk_1E6087570;
  id v7 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CalPopViewIn_block_invoke_6;
  v3[3] = &unk_1E608B3A0;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:0 delay:v6 options:v3 animations:0.100000001 completion:0.0];
}

uint64_t __CalPopViewIn_block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __CalPopViewIn_block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsDisplay];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __CalScaleViewIn_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  long long v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __CalScaleViewIn_block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsDisplay];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void CalScaleViewOut(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  [v11 frame];
  double v14 = dbl_1B413B150[a5 - v13 == 0.0];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F39B48], "animationWithKeyPath:", @"shadowOpacity", a5 - v13);
  [v15 setDuration:v14];
  id v16 = NSNumber;
  id v17 = [v11 layer];
  [v17 shadowOpacity];
  id v18 = objc_msgSend(v16, "numberWithFloat:");
  [v15 setFromValue:v18];

  double v19 = [NSNumber numberWithFloat:0.0];
  [v15 setToValue:v19];

  uint64_t v20 = [v11 layer];
  [v20 addAnimation:v15 forKey:@"animateOpacity"];

  uint64_t v21 = (void *)MEMORY[0x1E4FB1EB0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __CalScaleViewOut_block_invoke;
  v27[3] = &unk_1E60896F8;
  id v28 = v11;
  double v29 = a3;
  double v30 = a4;
  double v31 = a5;
  double v32 = a6;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __CalScaleViewOut_block_invoke_2;
  v24[3] = &unk_1E608B3A0;
  id v25 = v28;
  id v26 = v12;
  id v22 = v12;
  id v23 = v28;
  [v21 animateWithDuration:131076 delay:v27 options:v24 animations:v14 completion:0.0];
}

uint64_t __CalScaleViewOut_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __CalScaleViewOut_block_invoke_2(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __CalScaleViewOut_block_invoke_3;
  v6[3] = &unk_1E6087570;
  id v7 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CalScaleViewOut_block_invoke_4;
  v3[3] = &unk_1E608B3A0;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v6 animations:v3 completion:0.05];
}

uint64_t __CalScaleViewOut_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __CalScaleViewOut_block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsDisplay];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void CalPlopViewWithScaleFactorAndCompletion(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__21;
  v16[4] = __Block_byref_object_dispose__21;
  id v17 = (id)[v6 copy];
  id v7 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke;
  v13[3] = &unk_1E6087E70;
  id v14 = v5;
  double v15 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_2;
  v9[3] = &unk_1E608B3F0;
  id v8 = v14;
  double v12 = a3;
  id v10 = v8;
  id v11 = v16;
  [v7 animateWithDuration:0x10000 delay:v13 options:v9 animations:0.100000001 completion:0.0];

  _Block_object_dispose(v16, 8);
}

void sub_1B40D8974(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(double *)(a1 + 40) * 1.11, *(double *)(a1 + 40) * 1.11);
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

void __CalPlopViewWithScaleFactorAndCompletion_block_invoke_2(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_3;
  v9[3] = &unk_1E6087570;
  id v10 = *(id *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_4;
  _OWORD v5[3] = &unk_1E608B3F0;
  id v3 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 animateWithDuration:0 delay:v9 options:v5 animations:0.100000001 completion:0.0];
}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_3(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.95, 0.95);
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

void __CalPlopViewWithScaleFactorAndCompletion_block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_5;
  v8[3] = &unk_1E6087E70;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_6;
  _OWORD v5[3] = &unk_1E608B3C8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 animateWithDuration:0 delay:v8 options:v5 animations:0.100000001 completion:0.0];
}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_5(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(double *)(a1 + 40) * 1.05, *(double *)(a1 + 40) * 1.05);
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

void __CalPlopViewWithScaleFactorAndCompletion_block_invoke_6(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_7;
  _OWORD v4[3] = &unk_1E6087570;
  id v5 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_8;
  v3[3] = &unk_1E608A660;
  void v3[4] = *(void *)(a1 + 40);
  [v2 animateWithDuration:0x20000 delay:v4 options:v3 animations:0.100000001 completion:0.0];
}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B40DA260(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1B40DA270(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

double sub_1B40DA280@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  sub_1B40DC120(&qword_1E9CFC140, (void (*)(uint64_t))type metadata accessor for EKEventGenericDetailOOPHostViewModel);
  *(void *)a1 = sub_1B411E628();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v2;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 80) = 0;
  return result;
}

uint64_t sub_1B40DA310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v53 = a1;
  uint64_t v51 = sub_1B411E618();
  MEMORY[0x1F4188790]();
  double v52 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1B411E9B8();
  uint64_t v49 = *(void *)(v56 - 8);
  MEMORY[0x1F4188790]();
  id v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC148);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v58 = *v1;
  uint64_t v8 = (void *)MEMORY[0x1E4FBC8C8];
  id v9 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & **((void **)&v58 + 1)) + 0x80);
  uint64_t v10 = *((id *)&v58 + 1);
  v9();
  sub_1B40DA960((uint64_t)&v58);
  type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
  sub_1B40DC120(&qword_1E9CFC150, (void (*)(uint64_t))type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration);
  uint64_t v48 = sub_1B411E628();
  uint64_t v57 = v11;
  uint64_t v12 = swift_allocObject();
  long long v13 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v12 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v12 + 64) = v13;
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(v2 + 64);
  *(void *)(v12 + 96) = *(void *)(v2 + 80);
  long long v14 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v12 + 32) = v14;
  uint64_t v15 = v12;
  uint64_t v16 = swift_allocObject();
  long long v17 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v16 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v16 + 64) = v17;
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v2 + 64);
  *(void *)(v16 + 96) = *(void *)(v2 + 80);
  long long v18 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 32) = v18;
  uint64_t v42 = v16;
  uint64_t v19 = swift_allocObject();
  long long v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v19 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v19 + 64) = v20;
  *(_OWORD *)(v19 + 80) = *(_OWORD *)(v2 + 64);
  *(void *)(v19 + 96) = *(void *)(v2 + 80);
  long long v21 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v19 + 32) = v21;
  uint64_t v55 = v19;
  uint64_t v22 = swift_allocObject();
  long long v23 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v22 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v22 + 64) = v23;
  *(_OWORD *)(v22 + 80) = *(_OWORD *)(v2 + 64);
  *(void *)(v22 + 96) = *(void *)(v2 + 80);
  long long v24 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v22 + 32) = v24;
  uint64_t v54 = v22;
  id v25 = *(uint64_t (**)(uint64_t))((*v8 & *v10) + 0xB0);
  sub_1B40DC394(v2);
  sub_1B40DC394(v2);
  sub_1B40DC394(v2);
  sub_1B40DC424((uint64_t)&v58);
  uint64_t v26 = sub_1B40DC394(v2);
  uint64_t v47 = v25(v26);
  sub_1B40DA960((uint64_t)&v58);
  int v46 = sub_1B411E708();
  LOBYTE(v25) = sub_1B411E718();
  unsigned __int8 v27 = sub_1B411E728();
  unsigned __int8 v28 = sub_1B411E748();
  int v29 = sub_1B411E738();
  sub_1B411E738();
  if (sub_1B411E738() != v25) {
    int v29 = sub_1B411E738();
  }
  sub_1B411E738();
  if (sub_1B411E738() != v27) {
    int v29 = sub_1B411E738();
  }
  sub_1B411E738();
  if (sub_1B411E738() == v28) {
    int v45 = v29;
  }
  else {
    int v45 = sub_1B411E738();
  }
  uint64_t v44 = sub_1B411E638();
  uint64_t v30 = swift_allocObject();
  long long v31 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v30 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v30 + 64) = v31;
  *(_OWORD *)(v30 + 80) = *(_OWORD *)(v2 + 64);
  *(void *)(v30 + 96) = *(void *)(v2 + 80);
  long long v32 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v30 + 32) = v32;
  sub_1B40DC394(v2);
  double v33 = v5;
  double v43 = v5;
  sub_1B411E9A8();
  double v34 = v52;
  uint64_t v35 = v49;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(&v52[*(int *)(v51 + 20)], v33, v56);
  *double v34 = &unk_1E9CFC160;
  v34[1] = v30;
  sub_1B40DC65C((uint64_t)v34, (uint64_t)&v7[*(int *)(v50 + 36)]);
  uint64_t v36 = v57;
  *(void *)uint64_t v7 = v48;
  *((void *)v7 + 1) = v36;
  *((void *)v7 + 2) = sub_1B40DC16C;
  *((void *)v7 + 3) = v15;
  uint64_t v41 = v15;
  uint64_t v37 = v42;
  *((void *)v7 + 4) = sub_1B40DC218;
  *((void *)v7 + 5) = v37;
  uint64_t v51 = (uint64_t)sub_1B40DC2A8;
  uint64_t v38 = v55;
  *((void *)v7 + 6) = sub_1B40DC2A8;
  *((void *)v7 + 7) = v38;
  uint64_t v39 = v54;
  *((void *)v7 + _Block_object_dispose(&STACK[0x2D0], 8) = sub_1B40DC324;
  *((void *)v7 + 9) = v39;
  *((void *)v7 + 10) = v47;
  v7[88] = v46;
  *((void *)v7 + 12) = v44;
  v7[104] = v45;
  swift_retain();
  sub_1B40DA260((uint64_t)sub_1B40DC16C);
  sub_1B40DA260((uint64_t)sub_1B40DC218);
  sub_1B40DA260((uint64_t)sub_1B40DC2A8);
  sub_1B40DA260((uint64_t)sub_1B40DC324);
  swift_retain();
  sub_1B40DC6C0((uint64_t)v34);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v43, v56);
  swift_release();
  sub_1B40DA270((uint64_t)sub_1B40DC16C);
  sub_1B40DA270((uint64_t)sub_1B40DC218);
  sub_1B40DA270(v51);
  sub_1B40DA270((uint64_t)sub_1B40DC324);
  swift_release();
  return sub_1B40DC71C((uint64_t)v7, v53);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B40DA960(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B40DA98C(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_1B411E4F8();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_1B411E518();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_1B411E538();
  v1[12] = v4;
  v1[13] = *(void *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1B411E998();
  v1[16] = sub_1B411E988();
  uint64_t v6 = sub_1B411E968();
  v1[17] = v6;
  v1[18] = v5;
  return MEMORY[0x1F4188298](sub_1B40DAB3C, v6, v5);
}

uint64_t sub_1B40DAB3C()
{
  sub_1B411B9E4();
  swift_bridgeObjectRetain();
  sub_1B411E4E8();
  sub_1B411E528();
  sub_1B411E508();
  v0[19] = sub_1B411E988();
  uint64_t v1 = sub_1B40DC120((unint64_t *)&unk_1E9CFC370, MEMORY[0x1E4F25828]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1B40DAC84;
  uint64_t v3 = v0[6];
  return MEMORY[0x1F4187C78](v0 + 2, v3, v1);
}

uint64_t sub_1B40DAC84()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 16_Block_object_dispose(&STACK[0x2D0], 8) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  if (v0)
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B40DB1A0;
  }
  else
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B40DAE1C;
  }
  return MEMORY[0x1F4188298](v7, v4, v6);
}

uint64_t sub_1B40DAE1C()
{
  swift_release();
  v0[22] = v0[2];
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40DAE88, v1, v2);
}

uint64_t sub_1B40DAE88()
{
  if (v0[22])
  {
    return MEMORY[0x1F4188298](sub_1B40DAFB4, 0, 0);
  }
  else
  {
    uint64_t v2 = v0[7];
    uint64_t v1 = v0[8];
    uint64_t v3 = v0[6];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    uint64_t v5 = v0[13];
    uint64_t v4 = v0[14];
    uint64_t v6 = v0[12];
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_1B40DAFB4()
{
  *(void *)(v0 + 184) = sub_1B411E988();
  uint64_t v2 = sub_1B411E968();
  return MEMORY[0x1F4188298](sub_1B40DB040, v2, v1);
}

uint64_t sub_1B40DB040()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = (long long *)v0[5];
  swift_release();
  sub_1B40DB44C(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40DB0BC, v3, v4);
}

uint64_t sub_1B40DB0BC()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = v0[13];
  uint64_t v4 = v0[14];
  uint64_t v6 = v0[12];
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1B40DB1A0()
{
  v0[3] = v0[21];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFCC80);
  swift_willThrowTypedImpl();
  swift_release();
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40DB234, v1, v2);
}

uint64_t sub_1B40DB234()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1B411EA18();
  uint64_t v4 = *sub_1B40EC57C();
  os_log_type_t v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    uint64_t v6 = (void *)v0[21];
    id v7 = v6;
    id v8 = v6;
    uint64_t v9 = v4;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v6;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v13;
    sub_1B411EAF8();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_1B3F4C000, v9, v5, "EKEventGenericDetailOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v11, -1, -1);
    MEMORY[0x1BA986180](v10, -1, -1);
  }
  else
  {
    uint64_t v6 = (void *)v0[21];
  }

  uint64_t v15 = v0[13];
  uint64_t v14 = v0[14];
  uint64_t v16 = v0[12];
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void sub_1B40DB44C(uint64_t a1, long long *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  ((void (*)(void))MEMORY[0x1F4188790])();
  os_log_type_t v5 = &v37[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1B411E568();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v10 = &v37[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = &v37[-v12];
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = &v37[-v14];
  if (!*(void *)(a1 + 16))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_6;
  }
  uint64_t v16 = *(void (**)(unsigned char *, unint64_t, uint64_t))(v7 + 16);
  v16(v5, a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_6:
    sub_1B40E1C58((uint64_t)v5, &qword_1E9CFC168);
    sub_1B411EA18();
    id v29 = (id)*sub_1B40EC57C();
    sub_1B411E578();

    return;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32))(v15, v5, v6);
  long long v45 = *a2;
  long long v17 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **((void **)&v45 + 1)) + 0x70);
  uint64_t v42 = *((void *)&v45 + 1);
  uint64_t v41 = *((id *)&v45 + 1);
  v17(1);
  sub_1B40DA960((uint64_t)&v45);
  os_log_type_t v18 = sub_1B411EA28();
  uint64_t v19 = *sub_1B40EC57C();
  v16(v13, (unint64_t)v15, v6);
  v16(v10, (unint64_t)v15, v6);
  if (os_log_type_enabled(v19, v18))
  {
    os_log_t v40 = v19;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v44 = v39;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v21 = sub_1B411E548();
    uint64_t v43 = sub_1B40DFA70(v21, v22, &v44);
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    int v38 = v18;
    long long v23 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    v23(v13, v6);
    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v24 = sub_1B411E558();
    uint64_t v43 = sub_1B40DFA70(v24, v25, &v44);
    uint64_t v26 = v23;
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    v23(v10, v6);
    os_log_t v27 = v40;
    _os_log_impl(&dword_1B3F4C000, v40, (os_log_type_t)v38, "EKEventGenericDetailOOPHostView AppExtensionQuery Found %s (%s) RemoteUI Extension", (uint8_t *)v20, 0x16u);
    uint64_t v28 = v39;
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v28, -1, -1);
    MEMORY[0x1BA986180](v20, -1, -1);
  }
  else
  {
    uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    v26(v13, v6);
    v26(v10, v6);
  }
  uint64_t v30 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v41) + 0x80);
  long long v31 = v41;
  uint64_t v32 = v30();
  sub_1B40DA960((uint64_t)&v45);
  double v33 = (uint64_t *)sub_1B411BA18();
  uint64_t v34 = *v33;
  uint64_t v35 = v33[1];
  uint64_t v36 = *(void (**)(unsigned char *, uint64_t, uint64_t, void *))(*(void *)v32 + 360);
  sub_1B40DC424((uint64_t)&v45);
  swift_bridgeObjectRetain();
  v36(v15, v34, v35, v31);
  sub_1B40DA960((uint64_t)&v45);
  swift_release();
  swift_bridgeObjectRelease();
  v26(v15, v6);
}

void sub_1B40DB9D0()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(void **)(v0 + 8);
  if (v1)
  {
    id v3 = v1;
    uint64_t v7 = v2;
    uint64_t v4 = MEMORY[0x1BA984370](v3);
    (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v7) + 0xB8))(v4);
  }
  else
  {
    os_log_type_t v5 = self;
    uint64_t v7 = v2;
    uint64_t v6 = MEMORY[0x1BA984370](objc_msgSend(v5, sel_whiteColor));
    (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v7) + 0xB8))(v6);
  }
}

void sub_1B40DBAE8(void *a1)
{
  id v3 = *(void **)(v1 + 80);
  id v4 = a1;

  *(void *)(v1 + 80) = a1;
  sub_1B40DB9D0();
}

uint64_t sub_1B40DBB44(uint64_t a1, unint64_t a2)
{
  os_log_type_t v5 = sub_1B411EA28();
  uint64_t v6 = *sub_1B40EC57C();
  if (os_log_type_enabled(v6, v5))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v7 = v6;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(void *)&long long v14 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B40DFA70(a1, a2, (uint64_t *)&v14);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3F4C000, v7, v5, "EKEventOOPHostView: rightBarButtonTapped. buttonAction <%s>", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v9, -1, -1);
    MEMORY[0x1BA986180](v8, -1, -1);
  }
  long long v14 = *v2;
  uint64_t v10 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **((void **)&v14 + 1)) + 0x80);
  id v11 = *((id *)&v14 + 1);
  uint64_t v12 = v10();
  sub_1B40DA960((uint64_t)&v14);
  (*(void (**)(uint64_t, unint64_t))(*(void *)v12 + 288))(a1, a2);
  return swift_release();
}

uint64_t sub_1B40DBD40(uint64_t a1, unint64_t a2)
{
  os_log_type_t v5 = sub_1B411EA28();
  uint64_t v6 = *sub_1B40EC57C();
  if (os_log_type_enabled(v6, v5))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v7 = v6;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(void *)&long long v14 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B40DFA70(a1, a2, (uint64_t *)&v14);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3F4C000, v7, v5, "EKEventOOPHostView: rightBarButtonTapped. buttonAction <%s>", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v9, -1, -1);
    MEMORY[0x1BA986180](v8, -1, -1);
  }
  long long v14 = *v2;
  uint64_t v10 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **((void **)&v14 + 1)) + 0x80);
  id v11 = *((id *)&v14 + 1);
  uint64_t v12 = v10();
  sub_1B40DA960((uint64_t)&v14);
  (*(void (**)(uint64_t, unint64_t))(*(void *)v12 + 320))(a1, a2);
  return swift_release();
}

uint64_t sub_1B40DBF3C(uint64_t a1)
{
  os_log_type_t v3 = sub_1B411EA28();
  id v4 = *sub_1B40EC57C();
  if (os_log_type_enabled(v4, v3))
  {
    os_log_type_t v5 = v4;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134217984;
    *(void *)&long long v9 = a1;
    sub_1B411EAF8();
    _os_log_impl(&dword_1B3F4C000, v5, v3, "EKEventOOPHostView: bottomStatusButtonTapped. buttonAction <%ld>", v6, 0xCu);
    MEMORY[0x1BA986180](v6, -1, -1);
  }
  long long v9 = *v1;
  uint64_t v7 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v9 + 1)) + 0x80))(*((id *)&v9 + 1));
  sub_1B40DA960((uint64_t)&v9);
  (*(void (**)(uint64_t))(*(void *)v7 + 352))(a1);
  return swift_release();
}

uint64_t sub_1B40DC0B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1B40DA310(a1);
}

uint64_t type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(uint64_t a1)
{
  return sub_1B40E01B8(a1, (uint64_t *)&unk_1E9CFD770);
}

uint64_t sub_1B40DC120(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B40DC16C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 32);
  if (v6)
  {
    uint64_t v11 = result;
    swift_retain();
    v6(v11, a2, a3, a4, a5);
    return sub_1B40DA270((uint64_t)v6);
  }
  return result;
}

uint64_t sub_1B40DC218(uint64_t result, uint64_t a2, uint64_t a3)
{
  id v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v4)
  {
    uint64_t v7 = result;
    swift_retain();
    v4(v7, a2, a3);
    return sub_1B40DA270((uint64_t)v4);
  }
  return result;
}

uint64_t sub_1B40DC2A8(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 64);
  if (v3)
  {
    uint64_t v5 = result;
    swift_retain();
    v3(v5, a2);
    return sub_1B40DA270((uint64_t)v3);
  }
  return result;
}

uint64_t sub_1B40DC324(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 80);
  if (v2)
  {
    uint64_t v3 = result;
    swift_retain();
    v2(v3);
    return sub_1B40DA270((uint64_t)v2);
  }
  return result;
}

uint64_t sub_1B40DC394(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void **)(a1 + 80);
  id v7 = *(id *)(a1 + 8);
  sub_1B40DA260(v2);
  sub_1B40DA260(v3);
  sub_1B40DA260(v4);
  sub_1B40DA260(v5);
  id v8 = v6;
  return a1;
}

uint64_t sub_1B40DC424(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t objectdestroyTm()
{
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  if (*(void *)(v0 + 48)) {
    swift_release();
  }
  if (*(void *)(v0 + 64)) {
    swift_release();
  }
  if (*(void *)(v0 + 80)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1B40DC4D4()
{
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *id v2 = v1;
  v2[1] = sub_1B40DC568;
  return sub_1B40DA98C(v0 + 16);
}

uint64_t sub_1B40DC568()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B40DC65C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B411E618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40DC6C0(uint64_t a1)
{
  uint64_t v2 = sub_1B411E618();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B40DC71C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40DC784@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1B40E00C8(v3, a1);
}

uint64_t sub_1B40DC7D8(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B40DC834())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40DC890()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_sceneID);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B40DC8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_sceneID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B40DC948())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40DC9A4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_viewID);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B40DC9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_viewID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B40DCA5C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40DCAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1B40DCB08(a1, a2);
  return v4;
}

uint64_t sub_1B40DCB08(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity;
  uint64_t v10 = sub_1B411E568();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (void *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_sceneID);
  *uint64_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = v2
      + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration__customViewConfigurationChangedPublisher;
  v18[15] = 0;
  sub_1B411E598();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v6 + 32))(v12, v8, v5);
  uint64_t v13 = (void *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback);
  *uint64_t v13 = 0;
  v13[1] = 0;
  long long v14 = (void *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback);
  void *v14 = 0;
  v14[1] = 0;
  uint64_t v15 = (void *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback);
  *uint64_t v15 = 0;
  v15[1] = 0;
  uint64_t v16 = (void *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_viewID);
  *uint64_t v16 = a1;
  v16[1] = a2;
  return v2;
}

uint64_t sub_1B40DCCA8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B40DCD1C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40DCD6C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 224))(*a1);
}

uint64_t sub_1B40DCDB4()
{
  return sub_1B411E5E8();
}

void (*sub_1B40DCE24(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B40DCEB0;
}

void sub_1B40DCEB0(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_1B40DCF18()
{
  return swift_endAccess();
}

uint64_t sub_1B40DCF7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1B40DD0A8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B40DD1B8;
}

void sub_1B40DD1B8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1B411E5B8();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_1B411E5B8();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_1B40DD328()
{
  return sub_1B40DD5B8(&OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback, (void (*)(void, void))sub_1B40E1D64);
}

uint64_t sub_1B40DD348(uint64_t a1, uint64_t a2)
{
  return sub_1B40DD640(a1, a2, &OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40E1D68);
}

uint64_t (*sub_1B40DD368())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B40DD3C4(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  uint64_t result = (void (*)(uint64_t, uint64_t))(*(uint64_t (**)(void))(*(void *)v2 + 264))();
  if (result)
  {
    uint64_t v6 = (uint64_t)result;
    result(a1, a2);
    return (void (*)(uint64_t, uint64_t))sub_1B40DA270(v6);
  }
  return result;
}

uint64_t sub_1B40DD460()
{
  return sub_1B40DD5B8(&OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback, (void (*)(void, void))sub_1B40E1D64);
}

uint64_t sub_1B40DD480(uint64_t a1, uint64_t a2)
{
  return sub_1B40DD640(a1, a2, &OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40E1D68);
}

uint64_t (*sub_1B40DD4A0())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B40DD4FC(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  uint64_t result = (void (*)(uint64_t, uint64_t))(*(uint64_t (**)(void))(*(void *)v2 + 296))();
  if (result)
  {
    uint64_t v6 = (uint64_t)result;
    result(a1, a2);
    return (void (*)(uint64_t, uint64_t))sub_1B40DA270(v6);
  }
  return result;
}

uint64_t sub_1B40DD598()
{
  return sub_1B40DD5B8(&OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback, (void (*)(void, void))sub_1B40E1D64);
}

uint64_t sub_1B40DD5B8(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_1B40DD620(uint64_t a1, uint64_t a2)
{
  return sub_1B40DD640(a1, a2, &OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40E1D68);
}

uint64_t sub_1B40DD640(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_1B40DD6A4())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B40DD700(uint64_t a1))(uint64_t)
{
  uint64_t result = (void (*)(uint64_t))(*(uint64_t (**)(void))(*(void *)v1 + 328))();
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    result(a1);
    return (void (*)(uint64_t))sub_1B40DA270(v4);
  }
  return result;
}

uint64_t sub_1B40DD794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_1B411E568();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  (*(void (**)(unsigned char *))(*(void *)v3 + 144))(v9);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)v3 + 168);
  swift_bridgeObjectRetain();
  v12(a2, a3);
  uint64_t v13 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v3 + 232))(v16);
  BOOL *v14 = !*v14;
  return v13(v16, 0);
}

uint64_t sub_1B40DD94C()
{
  sub_1B40E1C58(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity, &qword_1E9CFC168);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration__customViewConfigurationChangedPublisher;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1B40DDA6C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

id sub_1B40DDAAC(_OWORD *a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity];
  uint64_t v5 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)&v3[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent];
  long long v7 = a1[1];
  *(_OWORD *)uint64_t v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  long long v8 = a1[3];
  *((_OWORD *)v6 + 2) = a1[2];
  *((_OWORD *)v6 + 3) = v8;
  *((_OWORD *)v6 + 4) = a1[4];
  v10.receiver = v3;
  v10.super_class = v1;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t sub_1B40DDB78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1B40E00C8(v3, a1);
}

uint64_t sub_1B40DDBCC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B40DDC28())()
{
  return j_j__swift_endAccess;
}

void *sub_1B40DDC84()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40DDCD4(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char *v3 = a1;
}

uint64_t (*sub_1B40DDD28())()
{
  return j__swift_endAccess;
}

void sub_1B40DDD88(void *a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id aBlock = 0;
  id v2 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x90);
    id v5 = aBlock;
    id v6 = v3;
    v4(v3);
    objc_msgSend(v6, sel_setExportedInterface_, *sub_1B40EAAE8());
    objc_msgSend(v6, sel_setRemoteObjectInterface_, *sub_1B40EABB8());
    objc_msgSend(v6, sel_setExportedObject_, v1);
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    long long v45 = sub_1B40E0228;
    uint64_t v46 = v7;
    id aBlock = (id)MEMORY[0x1E4F143A8];
    uint64_t v42 = 1107296256;
    uint64_t v43 = sub_1B40DE4D8;
    uint64_t v44 = &block_descriptor;
    long long v8 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v6, sel_setInterruptionHandler_, v8);
    _Block_release(v8);
    uint64_t v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    long long v45 = sub_1B40E0228;
    uint64_t v46 = v9;
    id aBlock = (id)MEMORY[0x1E4F143A8];
    uint64_t v42 = 1107296256;
    uint64_t v43 = sub_1B40DE4D8;
    uint64_t v44 = &block_descriptor_23;
    objc_super v10 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v6, sel_resume);
    os_log_type_t v11 = sub_1B411EA28();
    uint64_t v12 = (os_log_t *)sub_1B40EC57C();
    os_log_t v13 = *v12;
    if (os_log_type_enabled(*v12, v11))
    {
      id v14 = v6;
      uint64_t v15 = v13;
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 67109376;
      LODWORD(aBlock) = objc_msgSend(v14, sel_processIdentifier);
      sub_1B411EAF8();
      *(_WORD *)(v16 + _Block_object_dispose(&STACK[0x2D0], 8) = 1024;
      LODWORD(aBlock) = objc_msgSend(v14, sel_effectiveUserIdentifier);
      sub_1B411EAF8();

      _os_log_impl(&dword_1B3F4C000, v15, v11, "_AppExtensionEventGenericDetailOOPHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v16, 0xEu);
      MEMORY[0x1BA986180](v16, -1, -1);
    }
    id v17 = objc_msgSend(v6, sel_remoteObjectProxy);
    sub_1B411EB18();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC1F0);
    if (swift_dynamicCast())
    {
      uint64_t v18 = *(void *)((char *)v1
                      + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                      + 8);
      uint64_t v19 = *(void (**)(uint64_t))(*(void *)v18 + 184);
      uint64_t v20 = swift_retain();
      v19(v20);
      uint64_t v21 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
      objc_msgSend(v40, sel_setupGenericViewContextWithViewID_, v21);

      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = v40;
      long long v23 = *(void (**)(void, uint64_t))(*(void *)v18 + 272);
      swift_unknownObjectRetain();
      v23(sub_1B40E0320, v22);
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v40;
      unint64_t v25 = *(void (**)(void, uint64_t))(*(void *)v18 + 304);
      swift_unknownObjectRetain();
      v25(sub_1B40E032C, v24);
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = v40;
      os_log_t v27 = *(void (**)(id (*)(uint64_t), uint64_t))(*(void *)v18 + 336);
      swift_unknownObjectRetain();
      v27(sub_1B40E0390, v26);

      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      sub_1B411EA18();
      uint64_t v39 = *v12;
      sub_1B411E578();
    }
  }
  else
  {
    id v28 = aBlock;
    id v29 = (void *)sub_1B411E458();

    swift_willThrow();
    os_log_type_t v30 = sub_1B411EA18();
    long long v31 = *sub_1B40EC57C();
    if (os_log_type_enabled(v31, v30))
    {
      id v32 = v29;
      id v33 = v29;
      uint64_t v34 = v31;
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 138412290;
      id v37 = v29;
      int v38 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id aBlock = v38;
      sub_1B411EAF8();
      *uint64_t v36 = v38;

      _os_log_impl(&dword_1B3F4C000, v34, v30, "Error: _AppExtensionEventGenericDetailOOPHostView Setup: Cannot make XPC Connection. %@", v35, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
      swift_arrayDestroy();
      MEMORY[0x1BA986180](v36, -1, -1);
      MEMORY[0x1BA986180](v35, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_1B40DE4D8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1B40DE584()
{
  uint64_t v1 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
  objc_msgSend(v2, sel_invalidate);

  id v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x90);

  return v3(0);
}

uint64_t sub_1B40DE71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a3;
  uint64_t v10 = sub_1B411E7D8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  os_log_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v5
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 16);
  if (v19)
  {
    uint64_t v27 = v11;
    uint64_t v28 = result;
    uint64_t v20 = *(void *)(v5
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 24);
    uint64_t v25 = v16;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v26 = sub_1B411EA38();
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = v19;
    v21[3] = v20;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = v29;
    v21[7] = a4;
    v21[8] = a5;
    void aBlock[4] = sub_1B40E03EC;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_38;
    uint64_t v22 = _Block_copy(aBlock);
    sub_1B40DA260(v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B40DC120((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    long long v23 = (void *)v26;
    MEMORY[0x1BA984600](0, v18, v13, v22);
    _Block_release(v22);

    sub_1B40DA270(v19);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v18, v28);
  }
  return result;
}

uint64_t sub_1B40DEB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1B411E7D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v3
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 32);
  if (v16)
  {
    uint64_t v24 = v8;
    uint64_t v25 = result;
    uint64_t v17 = *(void *)(v3
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 40);
    uint64_t v18 = v13;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v23 = sub_1B411EA38();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v16;
    v19[3] = v17;
    void v19[4] = a1;
    v19[5] = a2;
    v19[6] = a3;
    void aBlock[4] = sub_1B40E04AC;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_44;
    uint64_t v20 = _Block_copy(aBlock);
    sub_1B40DA260(v16);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B40DC120((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    uint64_t v21 = (void *)v23;
    MEMORY[0x1BA984600](0, v15, v10, v20);
    _Block_release(v20);

    sub_1B40DA270(v16);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v15, v25);
  }
  return result;
}

uint64_t sub_1B40DEEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1B411E7D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v2
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 48);
  if (v14)
  {
    uint64_t v15 = *(void *)(v2
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 56);
    uint64_t v21 = v11;
    uint64_t v22 = result;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v20 = sub_1B411EA38();
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = v14;
    v16[3] = v15;
    v16[4] = a1;
    void v16[5] = a2;
    void aBlock[4] = sub_1B40E0528;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_50;
    uint64_t v17 = _Block_copy(aBlock);
    sub_1B40DA260(v14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B40DC120((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    uint64_t v18 = (void *)v20;
    MEMORY[0x1BA984600](0, v13, v8, v17);
    _Block_release(v17);

    sub_1B40DA270(v14);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v13, v22);
  }
  return result;
}

uint64_t sub_1B40DF280(uint64_t a1)
{
  uint64_t v3 = sub_1B411E7D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v1
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 64);
  if (v12)
  {
    uint64_t v13 = *(void *)(v1
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 72);
    uint64_t v19 = v9;
    uint64_t v20 = result;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v18 = sub_1B411EA38();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = v12;
    v14[3] = v13;
    v14[4] = a1;
    void aBlock[4] = sub_1B40E0598;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_56;
    uint64_t v15 = _Block_copy(aBlock);
    sub_1B40DA260(v12);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B40DC120((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    uint64_t v16 = (void *)v18;
    MEMORY[0x1BA984600](0, v11, v6, v15);
    _Block_release(v15);

    sub_1B40DA270(v12);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return result;
}

id sub_1B40DF658()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B40DF758()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F258A8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC218);
  sub_1B411E6F8();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1B40DF7D0(void *a1, uint64_t a2)
{
  sub_1B40E05C8(a1, a2, *(void *)(v2 + 8));
}

id sub_1B40DF7E0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[9];
  uint64_t v15 = v1[8];
  uint64_t v16 = *v1;
  uint64_t v17 = (objc_class *)type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(0);
  uint64_t v10 = (char *)objc_allocWithZone(v17);
  uint64_t v11 = &v10[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity];
  uint64_t v12 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v10[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn] = 0;
  uint64_t v13 = &v10[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent];
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v2;
  *((void *)v13 + 2) = v4;
  *((void *)v13 + 3) = v3;
  *((void *)v13 + 4) = v5;
  *((void *)v13 + 5) = v6;
  *((void *)v13 + 6) = v7;
  *((void *)v13 + 7) = v8;
  *((void *)v13 + _Block_object_dispose(&STACK[0x2D0], 8) = v15;
  *((void *)v13 + 9) = v9;
  swift_retain();
  sub_1B40DA260(v4);
  sub_1B40DA260(v5);
  sub_1B40DA260(v7);
  sub_1B40DA260(v15);
  v19.receiver = v10;
  v19.super_class = v17;
  id result = objc_msgSendSuper2(&v19, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1B40DF928()
{
  return sub_1B411E698();
}

uint64_t sub_1B40DF964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B40E1C04();

  return MEMORY[0x1F40FAB68](a1, a2, a3, v6);
}

uint64_t sub_1B40DF9C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B40E1C04();

  return MEMORY[0x1F40FAB30](a1, a2, a3, v6);
}

uint64_t sub_1B40DFA2C()
{
  return sub_1B411E7A8();
}

void sub_1B40DFA48()
{
}

uint64_t sub_1B40DFA70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B40DFB44(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B40E1D04((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1B40E1D04((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B40DFB44(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1B411EB08();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1B40DFD00(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1B411EC68();
  if (!v8)
  {
    sub_1B411ECB8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1B411ED28();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1B40DFD00(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B40DFD98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B40DFF78(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1B40DFF78(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B40DFD98(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1B40DFF10(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1B411EC48();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1B411ECB8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1B411E8E8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1B411ED28();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1B411ECB8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1B40DFF10(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC880);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B40DFF78(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC880);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1B411ED28();
  __break(1u);
  return result;
}

uint64_t sub_1B40E00C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40E0130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(uint64_t a1)
{
  return sub_1B40E01B8(a1, (uint64_t *)&unk_1E9CFD780);
}

uint64_t sub_1B40E01B8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B40E01F0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void sub_1B40E0244()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x1BA986210](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    unint64_t v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x88))();

    if (v3)
    {
      objc_msgSend(v3, sel_setExportedObject_, 0);
    }
  }
}

uint64_t sub_1B40E02E8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B40E0320(uint64_t a1, uint64_t a2)
{
}

void sub_1B40E032C(uint64_t a1, uint64_t a2)
{
}

void sub_1B40E0338(uint64_t a1, uint64_t a2, SEL *a3)
{
  size_t v5 = *(void **)(v3 + 16);
  id v6 = (id)sub_1B411E898();
  objc_msgSend(v5, *a3, v6);
}

id sub_1B40E0390(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_genericViewBottomStatusButtonTapped_, a1);
}

uint64_t sub_1B40E03A4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1B40E03EC()
{
  return (*(uint64_t (**)(void, void, void, void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B40E046C()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B40E04AC()
{
  return (*(uint64_t (**)(void, void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1B40E04E0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B40E0528()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1B40E0558()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B40E0598()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

void sub_1B40E05C8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B411E4C8();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v46 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v7 - 8);
  int64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1B411E568();
  uint64_t v10 = *(void *)(v49 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v49);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v48 = (char *)&v42 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC360);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  long long v45 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  objc_super v19 = (char *)&v42 - v18;
  self;
  if (swift_dynamicCastObjCClass())
  {
    id v20 = a1;
    sub_1B411EA78();
    uint64_t v21 = sub_1B411EA68();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21) == 1)
    {
      id v44 = v20;
      sub_1B40E1C58((uint64_t)v19, (uint64_t *)&unk_1E9CFC360);
      uint64_t v23 = *(void (**)(uint64_t))(*(void *)a3 + 136);
      uint64_t v47 = v10;
      uint64_t v24 = swift_retain();
      v23(v24);
      uint64_t v25 = v47;
      swift_release();
      uint64_t v26 = v49;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v9, 1, v49) == 1)
      {

        sub_1B40E1C58((uint64_t)v9, &qword_1E9CFC168);
      }
      else
      {
        uint64_t v42 = v13;
        uint64_t v27 = v48;
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v48, v9, v26);
        uint64_t v28 = *(uint64_t (**)(uint64_t))(*(void *)a3 + 160);
        uint64_t v29 = swift_retain();
        uint64_t v43 = v28(v29);
        unint64_t v31 = v30;
        swift_release();
        if (v31)
        {
          os_log_type_t v32 = sub_1B411EA28();
          id v33 = *sub_1B40EC57C();
          os_log_type_t v34 = v32;
          if (os_log_type_enabled(v33, v32))
          {
            swift_bridgeObjectRetain_n();
            uint64_t v35 = v33;
            uint64_t v36 = (uint8_t *)swift_slowAlloc();
            uint64_t v37 = swift_slowAlloc();
            uint64_t v51 = v37;
            *(_DWORD *)uint64_t v36 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v50 = sub_1B40DFA70(v43, v31, &v51);
            sub_1B411EAF8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1B3F4C000, v35, v34, "_AppExtensionEventGenericDetailOOPHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v36, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1BA986180](v37, -1, -1);
            MEMORY[0x1BA986180](v36, -1, -1);
          }
          uint64_t v38 = v47;
          uint64_t v39 = v48;
          uint64_t v40 = v49;
          (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v42, v48, v49);
          sub_1B411E4D8();
          uint64_t v41 = v45;
          sub_1B411EA58();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v41, 0, 1, v21);
          sub_1B411EA88();

          (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v26);
        }
      }
    }
    else
    {

      sub_1B40E1C58((uint64_t)v19, (uint64_t *)&unk_1E9CFC360);
    }
  }
  else
  {
    sub_1B411ECC8();
    __break(1u);
  }
}

uint64_t sub_1B40E0B94(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1B4158A8C, 1);
}

uint64_t sub_1B40E0BB0()
{
  return MEMORY[0x1E4F1ABE8];
}

unint64_t sub_1B40E0BC0()
{
  unint64_t result = qword_1E9CFC220;
  if (!qword_1E9CFC220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC220);
  }
  return result;
}

uint64_t sub_1B40E0C14()
{
  return MEMORY[0x1E4F3F160];
}

void destroy for EKEventGenericDetailOOPHostView(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  if (*(void *)(a1 + 32)) {
    swift_release();
  }
  if (*(void *)(a1 + 48)) {
    swift_release();
  }
  if (*(void *)(a1 + 64)) {
    swift_release();
  }
  uint64_t v2 = *(void **)(a1 + 80);
}

void *initializeWithCopy for EKEventGenericDetailOOPHostView(void *a1, void *a2)
{
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  id v7 = v4;
  if (v5)
  {
    uint64_t v8 = a2[3];
    a1[2] = v5;
    a1[3] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v9 = a2[4];
  if (v9)
  {
    uint64_t v10 = a2[5];
    a1[4] = v9;
    a1[5] = v10;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  uint64_t v11 = a2[6];
  if (v11)
  {
    uint64_t v12 = a2[7];
    a1[6] = v11;
    a1[7] = v12;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  uint64_t v13 = a2[8];
  if (v13)
  {
    uint64_t v14 = a2[9];
    a1[8] = v13;
    a1[9] = v14;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  uint64_t v15 = (void *)a2[10];
  a1[10] = v15;
  id v16 = v15;
  return a1;
}

void *assignWithCopy for EKEventGenericDetailOOPHostView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  uint64_t v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      uint64_t v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      uint64_t v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      uint64_t v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v13)
  {
    uint64_t v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v16 = a2[8];
  if (!a1[8])
  {
    if (v16)
    {
      uint64_t v18 = a2[9];
      a1[8] = v16;
      a1[9] = v18;
      swift_retain();
      goto LABEL_29;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    goto LABEL_29;
  }
  if (!v16)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v17 = a2[9];
  a1[8] = v16;
  a1[9] = v17;
  swift_retain();
  swift_release();
LABEL_29:
  objc_super v19 = (void *)a1[10];
  id v20 = (void *)a2[10];
  a1[10] = v20;
  id v21 = v20;

  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

void *assignWithTake for EKEventGenericDetailOOPHostView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  long long v5 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v4;

  uint64_t v6 = a2[2];
  if (a1[2])
  {
    if (v6)
    {
      uint64_t v7 = a2[3];
      a1[2] = v6;
      a1[3] = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = a2[3];
    a1[2] = v6;
    a1[3] = v8;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v9 = a2[4];
  if (a1[4])
  {
    if (v9)
    {
      uint64_t v10 = a2[5];
      a1[4] = v9;
      a1[5] = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = a2[5];
    a1[4] = v9;
    a1[5] = v11;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v12 = a2[6];
  if (a1[6])
  {
    if (v12)
    {
      uint64_t v13 = a2[7];
      a1[6] = v12;
      a1[7] = v13;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v12)
  {
    uint64_t v14 = a2[7];
    a1[6] = v12;
    a1[7] = v14;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v15 = a2[8];
  if (!a1[8])
  {
    if (v15)
    {
      uint64_t v17 = a2[9];
      a1[8] = v15;
      a1[9] = v17;
      goto LABEL_29;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    goto LABEL_29;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v16 = a2[9];
  a1[8] = v15;
  a1[9] = v16;
  swift_release();
LABEL_29:
  uint64_t v18 = (void *)a1[10];
  a1[10] = a2[10];

  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventGenericDetailOOPHostView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKEventGenericDetailOOPHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8_Block_object_dispose(&STACK[0x2D0], 8) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8_Block_object_dispose(&STACK[0x2D0], 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventGenericDetailOOPHostView()
{
  return &type metadata for EKEventGenericDetailOOPHostView;
}

uint64_t initializeBufferWithCopyOfBuffer for _AppExtensionEventGenericDetailHostView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _AppExtensionEventGenericDetailHostView(void *a1)
{
  uint64_t result = swift_release();
  if (a1[2]) {
    uint64_t result = swift_release();
  }
  if (a1[4]) {
    uint64_t result = swift_release();
  }
  if (a1[6]) {
    uint64_t result = swift_release();
  }
  if (a1[8])
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for _AppExtensionEventGenericDetailHostView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  uint64_t v10 = a2[6];
  if (v10)
  {
    uint64_t v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  uint64_t v12 = a2[8];
  if (v12)
  {
    uint64_t v13 = a2[9];
    a1[8] = v12;
    a1[9] = v13;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  return a1;
}

void *assignWithCopy for _AppExtensionEventGenericDetailHostView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      uint64_t v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v10 = a2[6];
  if (a1[6])
  {
    if (v10)
    {
      uint64_t v11 = a2[7];
      a1[6] = v10;
      a1[7] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = a2[7];
    a1[6] = v10;
    a1[7] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v13 = a2[8];
  if (!a1[8])
  {
    if (v13)
    {
      uint64_t v15 = a2[9];
      a1[8] = v13;
      a1[9] = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v14 = a2[9];
  a1[8] = v13;
  a1[9] = v14;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

void *assignWithTake for _AppExtensionEventGenericDetailHostView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      uint64_t v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v11 = a2[6];
  if (a1[6])
  {
    if (v11)
    {
      uint64_t v12 = a2[7];
      a1[6] = v11;
      a1[7] = v12;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v11)
  {
    uint64_t v13 = a2[7];
    a1[6] = v11;
    a1[7] = v13;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v14 = a2[8];
  if (!a1[8])
  {
    if (v14)
    {
      uint64_t v16 = a2[9];
      a1[8] = v14;
      a1[9] = v16;
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v15 = a2[9];
  a1[8] = v14;
  a1[9] = v15;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AppExtensionEventGenericDetailHostView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AppExtensionEventGenericDetailHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _AppExtensionEventGenericDetailHostView()
{
  return &type metadata for _AppExtensionEventGenericDetailHostView;
}

uint64_t sub_1B40E170C()
{
  return type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
}

void sub_1B40E1714()
{
  sub_1B40E1818();
  if (v0 <= 0x3F)
  {
    sub_1B40E1B7C(319, (unint64_t *)&unk_1E9CFCB90, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1B40E1818()
{
  if (!qword_1E9CFC230)
  {
    sub_1B411E568();
    unint64_t v0 = sub_1B411EAE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9CFC230);
    }
  }
}

uint64_t sub_1B40E1870()
{
  return type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(0);
}

void sub_1B40E1878()
{
  sub_1B40E1818();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_1B40E1920()
{
  unint64_t result = qword_1E9CFC300;
  if (!qword_1E9CFC300)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFC148);
    sub_1B40E19CC();
    sub_1B40DC120(&qword_1E9CFC710, MEMORY[0x1E4F3C908]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC300);
  }
  return result;
}

unint64_t sub_1B40E19CC()
{
  unint64_t result = qword_1E9CFC308;
  if (!qword_1E9CFC308)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFC310);
    sub_1B40E1A48();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC308);
  }
  return result;
}

unint64_t sub_1B40E1A48()
{
  unint64_t result = qword_1E9CFC318;
  if (!qword_1E9CFC318)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFC320);
    sub_1B40E0BC0();
    sub_1B40E1AE8(&qword_1E9CFC328, (uint64_t *)&unk_1E9CFC330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC318);
  }
  return result;
}

uint64_t sub_1B40E1AE8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for EKEventStatusButtonsAction(uint64_t a1)
{
}

void type metadata accessor for EKRemoteViewPresentationStyle(uint64_t a1)
{
}

void sub_1B40E1B7C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1B40E1BC8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_1B40E1C04()
{
  unint64_t result = qword_1E9CFC358;
  if (!qword_1E9CFC358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC358);
  }
  return result;
}

uint64_t sub_1B40E1C58(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1B40E1D04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id EKRemoteUIObjectSerializerWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id EKRemoteUIObjectSerializerWrapper.init()()
{
  id v1 = objc_allocWithZone((Class)sub_1B411E828());
  unint64_t v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  *(void *)&v2[OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer] = v3;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for EKRemoteUIObjectSerializerWrapper();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIObjectSerializerWrapper()
{
  return self;
}

uint64_t sub_1B40E1EF4()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  uint64_t v2 = sub_1B411E808();

  return v2;
}

uint64_t sub_1B40E1FD4()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  uint64_t v2 = sub_1B411E818();

  return v2;
}

id EKRemoteUIObjectSerializerWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKRemoteUIObjectSerializerWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for EKRemoteUIObjectSerializerWrapper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKRemoteUIObjectSerializerWrapper);
}

uint64_t dispatch thunk of EKRemoteUIObjectSerializerWrapper.serializedRepresentation(ekObject:obfuscateKeyProperties:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of EKRemoteUIObjectSerializerWrapper.serializedRepresentation(ekObject:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

double sub_1B40E2158(uint64_t a1)
{
  *(_WORD *)(a1 + 144) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_1B40E2178(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC3F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1B40E21E0())()
{
  return j_j__swift_endAccess;
}

id EKCalendarChooserOOPImpl.__allocating_init(eventStore:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_1B40E8B00(a1);

  return v4;
}

id EKCalendarChooserOOPImpl.init(eventStore:)(void *a1)
{
  id v2 = sub_1B40E8B00(a1);

  return v2;
}

uint64_t sub_1B40E230C(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  id v2 = v1;
  v92.receiver = v1;
  v92.super_class = (Class)type metadata accessor for EKCalendarChooserOOPImpl();
  objc_msgSendSuper2(&v92, sel_viewDidLoad);
  id v3 = *(id *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel);
  double v4 = sub_1B411364C((uint64_t)v93);
  CGSizeMake(v93, v4);
  uint64_t v5 = (uint64_t)v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView;
  swift_beginAccess();
  sub_1B40E2178(v5, (uint64_t)v94);
  sub_1B40E2178((uint64_t)v93, v5);
  sub_1B40E8EE8((uint64_t)v94, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8E2C);
  uint64_t v6 = sub_1B40E21E0();
  sub_1B40E2178(v7, (uint64_t)v95);
  sub_1B40E2178((uint64_t)v95, (uint64_t)v96);
  if (sub_1B40E8ED0((uint64_t)v96) != 1)
  {
    uint64_t v8 = *(void **)((char *)v2 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore);
    id v9 = v8;
    sub_1B4114AFC(v8);
  }
  ((void (*)(unsigned char *, void))v6)(v91, 0);
  uint64_t v10 = sub_1B40E21E0();
  sub_1B40E2178(v11, (uint64_t)v90);
  sub_1B40E2178((uint64_t)v90, (uint64_t)v91);
  int v12 = sub_1B40E8ED0((uint64_t)v91);
  uint64_t v13 = (void *)MEMORY[0x1E4FBC8C8];
  if (v12 != 1)
  {
    uint64_t v14 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x158))();
    sub_1B4114DF4(v14);
  }
  ((void (*)(unsigned char *, void))v10)(v89, 0);
  uint64_t v15 = sub_1B40E21E0();
  sub_1B40E2178(v16, (uint64_t)v88);
  sub_1B40E2178((uint64_t)v88, (uint64_t)v89);
  if (sub_1B40E8ED0((uint64_t)v89) != 1)
  {
    uint64_t v17 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x170))();
    sub_1B4115018(v17);
  }
  ((void (*)(unsigned char *, void))v15)(v87, 0);
  uint64_t v18 = sub_1B40E21E0();
  sub_1B40E2178(v19, (uint64_t)v86);
  sub_1B40E2178((uint64_t)v86, (uint64_t)v87);
  if (sub_1B40E8ED0((uint64_t)v87) != 1)
  {
    uint64_t v20 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x188))();
    sub_1B4115234(v20);
  }
  ((void (*)(unsigned char *, void))v18)(v85, 0);
  id v21 = sub_1B40E21E0();
  sub_1B40E2178(v22, (uint64_t)v84);
  sub_1B40E2178((uint64_t)v84, (uint64_t)v85);
  if (sub_1B40E8ED0((uint64_t)v85) != 1)
  {
    char v23 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x1A0))();
    sub_1B4115454(v23 & 1);
  }
  ((void (*)(unsigned char *, void))v21)(v83, 0);
  uint64_t v24 = sub_1B40E21E0();
  sub_1B40E2178(v25, (uint64_t)v82);
  sub_1B40E2178((uint64_t)v82, (uint64_t)v83);
  if (sub_1B40E8ED0((uint64_t)v83) != 1)
  {
    char v26 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x1B8))();
    sub_1B4115674(v26 & 1);
  }
  uint64_t v27 = ((uint64_t (*)(unsigned char *, void))v24)(v81, 0);
  uint64_t v28 = (*(uint64_t (**)(uint64_t))((*v13 & *v2) + 0x200))(v27);
  sub_1B40E5410(v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_1B40E21E0();
  sub_1B40E2178(v30, (uint64_t)v80);
  sub_1B40E2178((uint64_t)v80, (uint64_t)v81);
  if (sub_1B40E8ED0((uint64_t)v81) != 1)
  {
    char v31 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x220))();
    sub_1B4115AD4(v31 & 1);
  }
  ((void (*)(unsigned char *, void))v29)(v79, 0);
  os_log_type_t v32 = sub_1B40E21E0();
  sub_1B40E2178(v33, (uint64_t)v78);
  sub_1B40E2178((uint64_t)v78, (uint64_t)v79);
  if (sub_1B40E8ED0((uint64_t)v79) != 1)
  {
    uint64_t v34 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x238))();
    sub_1B4115CF4(v34);
  }
  ((void (*)(unsigned char *, void))v32)(v77, 0);
  uint64_t v35 = sub_1B40E21E0();
  sub_1B40E2178(v36, (uint64_t)v76);
  sub_1B40E2178((uint64_t)v76, (uint64_t)v77);
  if (sub_1B40E8ED0((uint64_t)v77) != 1)
  {
    char v37 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x250))();
    sub_1B4115F14(v37 & 1);
  }
  ((void (*)(unsigned char *, void))v35)(v75, 0);
  uint64_t v38 = sub_1B40E21E0();
  sub_1B40E2178(v39, (uint64_t)v74);
  sub_1B40E2178((uint64_t)v74, (uint64_t)v75);
  if (sub_1B40E8ED0((uint64_t)v75) != 1)
  {
    char v40 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x268))();
    sub_1B4116134(v40 & 1);
  }
  ((void (*)(unsigned char *, void))v38)(v73, 0);
  uint64_t v41 = sub_1B40E21E0();
  sub_1B40E2178(v42, (uint64_t)v72);
  sub_1B40E2178((uint64_t)v72, (uint64_t)v73);
  if (sub_1B40E8ED0((uint64_t)v73) != 1)
  {
    uint64_t v43 = (void *)(*(uint64_t (**)(void))((*v13 & *v2) + 0x280))();
    sub_1B41167BC(v43);
  }
  ((void (*)(unsigned char *, void))v41)(v71, 0);
  id v44 = sub_1B40E21E0();
  sub_1B40E2178(v45, (uint64_t)v70);
  sub_1B40E2178((uint64_t)v70, (uint64_t)v71);
  if (sub_1B40E8ED0((uint64_t)v71) != 1)
  {
    char v46 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x298))();
    sub_1B4116A30(v46 & 1);
  }
  ((void (*)(unsigned char *, void))v44)(v69, 0);
  uint64_t v47 = sub_1B40E21E0();
  sub_1B40E2178(v48, (uint64_t)v68);
  sub_1B40E2178((uint64_t)v68, (uint64_t)v69);
  if (sub_1B40E8ED0((uint64_t)v69) != 1)
  {
    int v49 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x2C8))();
    sub_1B4116C4C(v49);
  }
  ((void (*)(unsigned char *, void))v47)(v67, 0);
  uint64_t v50 = sub_1B40E21E0();
  sub_1B40E2178(v51, (uint64_t)v66);
  sub_1B40E2178((uint64_t)v66, (uint64_t)v67);
  if (sub_1B40E8ED0((uint64_t)v67) != 1)
  {
    char v52 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x2E0))();
    sub_1B4116E6C(v52 & 1);
  }
  ((void (*)(unsigned char *, void))v50)(v65, 0);
  uint64_t v53 = sub_1B40E21E0();
  sub_1B40E2178(v54, (uint64_t)v64);
  sub_1B40E2178((uint64_t)v64, (uint64_t)v65);
  if (sub_1B40E8ED0((uint64_t)v65) != 1)
  {
    uint64_t v55 = (void *)(*(uint64_t (**)(void))((*v13 & *v2) + 0x2B0))();
    sub_1B4116428(v55);
  }
  ((void (*)(unsigned char *, void))v53)(v63, 0);
  uint64_t v56 = sub_1B40E21E0();
  sub_1B40E2178(v57, (uint64_t)v62);
  sub_1B40E2178((uint64_t)v62, (uint64_t)v63);
  if (sub_1B40E8ED0((uint64_t)v63) != 1)
  {
    char v58 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x2F8))();
    sub_1B411708C(v58 & 1);
  }
  uint64_t v59 = ((uint64_t (*)(unsigned char *, void))v56)(v61, 0);
  return (*(uint64_t (**)(uint64_t))((*v13 & *v2) + 0x140))(v59);
}

uint64_t sub_1B40E2DF8()
{
  id v1 = v0;
  uint64_t v2 = (uint64_t)&v0[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView];
  swift_beginAccess();
  sub_1B40E2178(v2, (uint64_t)v153);
  sub_1B40E2178((uint64_t)v153, (uint64_t)&v154);
  if (sub_1B40E8ED0((uint64_t)&v154) == 1) {
    goto LABEL_29;
  }
  long long v149 = v159;
  long long v150 = v160;
  long long v151 = v161;
  __int16 v152 = v162;
  long long v145 = v156;
  long long v146 = *(_OWORD *)v157;
  long long v147 = *(_OWORD *)&v157[16];
  long long v148 = v158;
  long long v143 = v154;
  long long v144 = v155;
  long long v3 = v154;
  long long v114 = *(_OWORD *)&v157[8];
  double v4 = *(void **)v157;
  uint64_t v113 = *(void *)&v157[24];
  char v112 = v158;
  char v111 = BYTE1(v158);
  uint64_t v5 = (void *)*((void *)&v158 + 1);
  char v110 = v159;
  uint64_t v109 = *((void *)&v159 + 1);
  char v108 = v160;
  char v107 = BYTE1(v160);
  uint64_t v6 = (void *)*((void *)&v160 + 1);
  uint64_t v94 = *(void *)v157;
  uint64_t v95 = *((void *)&v160 + 1);
  uint64_t v7 = (void *)v161;
  char v106 = BYTE8(v161);
  int v105 = HIDWORD(v161);
  char v104 = v162;
  char v103 = HIBYTE(v162);
  uint64_t v84 = *((void *)&v154 + 1);
  uint64_t v85 = v154;
  uint64_t v101 = v155;
  uint64_t v98 = v156;
  uint64_t v97 = v161;
  uint64_t v90 = *(void *)&v157[8];
  uint64_t v91 = *(void *)v157;
  uint64_t v88 = *(void *)&v157[24];
  uint64_t v89 = *(void *)&v157[16];
  char v141 = BYTE1(v158);
  char v142 = v158;
  char v140 = v159;
  uint64_t v86 = *((void *)&v159 + 1);
  uint64_t v87 = *((void *)&v158 + 1);
  char v138 = BYTE1(v160);
  char v139 = v160;
  char v137 = BYTE8(v161);
  char v135 = HIBYTE(v162);
  char v136 = v162;
  uint64_t v81 = *((void *)&v160 + 1);
  uint64_t v82 = v161;
  int v83 = HIDWORD(v161);
  uint64_t v8 = self;
  sub_1B40E8EE8((uint64_t)v153, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8F54);
  sub_1B40E8EE8((uint64_t)v153, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8F54);
  id v102 = v7;
  id v9 = *((id *)&v3 + 1);
  id v96 = v5;
  id v99 = v4;
  id v100 = v6;
  id v10 = objc_msgSend(v8, sel_shared);
  uint64_t v11 = sub_1B40F0AA0();
  id v12 = objc_msgSend(v10, sel_layoutDirectionOrOverride);
  uint64_t v13 = (void *)MEMORY[0x1E4FBC8C8];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v11) + 0xC8))(v12);

  uint64_t v14 = sub_1B40F0AA0();
  (*(void (**)(id))((*v13 & *v14) + 0xE0))(objc_msgSend(v10, sel_preferredContentSizeCategoryOrOverride));

  v80 = v10;
  id v15 = objc_msgSend(v10, sel_viewHierarchyOrOverride);
  double v16 = EKUIContainedControllerIdealWidth();
  EKUIContainedControllerIdealHeight();
  double v18 = CGSizeMake(v17, v16);
  double v20 = v19;
  id v21 = self;
  id v22 = objc_msgSend(v21, sel_systemBlueColor);
  char v23 = sub_1B40F0AA0();
  sub_1B40E8EE8((uint64_t)v153, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8E2C);
  id v24 = objc_msgSend(v15, sel_ekui_verticalSizeClass);
  id v25 = objc_msgSend(v15, sel_ekui_horizontalSizeClass);
  id v26 = objc_msgSend(v15, sel_ekui_interfaceOrientation);
  id v27 = v22;
  objc_msgSend(v15, sel_ekui_affineTransform);
  long long v92 = v127;
  long long v93 = v126;
  long long v28 = v128;
  id v29 = objc_allocWithZone((Class)EKUIViewHierarchyFromComponents);
  long long v126 = v93;
  long long v127 = v92;
  long long v128 = v28;
  id v30 = objc_msgSend(v29, sel_initWithSize_verticalSizeClass_horizontalSizeClass_interfaceOrientation_tintColor_affineTranform_, v24, v25, v26, v27, &v126, v18, v20);

  (*(void (**)(id))((*v13 & *v23) + 0xF8))(v30);
  uint64_t v31 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v98);
  uint64_t v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v101);
  *(void *)&long long v126 = v3;
  *((void *)&v126 + 1) = v9;
  *(void *)&long long v127 = sub_1B40E90FC;
  *((void *)&v127 + 1) = v32;
  *(void *)&long long v128 = sub_1B40E902C;
  *((void *)&v128 + 1) = v31;
  *(void *)v129 = v94;
  *(_OWORD *)&v129[8] = v114;
  *(void *)&v129[24] = v113;
  LOBYTE(v130) = v112;
  BYTE1(v130) = v111;
  *((void *)&v130 + 1) = v96;
  LOBYTE(v131) = v110;
  *((void *)&v131 + 1) = v109;
  LOBYTE(v132) = v108;
  BYTE1(v132) = v107;
  *((void *)&v132 + 1) = v95;
  *(void *)&long long v133 = v97;
  BYTE8(v133) = v106;
  HIDWORD(v133) = v105;
  LOBYTE(v134) = v104;
  HIBYTE(v134) = v103;
  sub_1B40E91A4((uint64_t)&v126);

  swift_release();
  swift_release();

  long long v122 = v131;
  long long v123 = v132;
  long long v124 = v133;
  __int16 v125 = v134;
  long long v118 = v128;
  long long v119 = *(_OWORD *)v129;
  long long v120 = *(_OWORD *)&v129[16];
  long long v121 = v130;
  long long v116 = v126;
  long long v117 = v127;
  id v33 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC410));
  uint64_t v34 = (void *)sub_1B411E658();
  objc_msgSend(v1, sel_addChildViewController_, v34);
  id v35 = objc_msgSend(v34, sel_view);
  if (!v35)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v36 = v35;
  objc_msgSend(v35, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  id v37 = objc_msgSend(v34, sel_view);
  if (!v37)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v38 = v37;
  id v39 = objc_msgSend(v21, sel_systemGroupedBackgroundColor);
  objc_msgSend(v38, sel_setBackgroundColor_, v39);

  id v40 = objc_msgSend(v1, sel_view);
  if (!v40)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v41 = v40;
  v115 = v27;
  id v42 = objc_msgSend(v34, sel_view);
  if (!v42)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v43 = v42;
  objc_msgSend(v41, sel_addSubview_, v42);

  objc_msgSend(v34, sel_didMoveToParentViewController_, v1);
  id v44 = *(void **)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController];
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController] = v34;
  id v45 = v34;

  id v46 = objc_msgSend(v45, sel_view);
  if (!v46)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v47 = v46;
  objc_msgSend(v46, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC420);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_1B413B4B0;
  id v49 = objc_msgSend(v45, sel_view);
  if (!v49)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v50 = v49;
  id v51 = objc_msgSend(v49, sel_leadingAnchor);

  id v52 = objc_msgSend(v1, sel_view);
  if (!v52)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v53 = v52;
  id v54 = objc_msgSend(v52, sel_leadingAnchor);

  id v55 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v54);
  *(void *)(v48 + 32) = v55;
  id v56 = objc_msgSend(v45, sel_view);
  if (!v56)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v57 = v56;
  id v58 = objc_msgSend(v56, sel_topAnchor);

  id v59 = objc_msgSend(v1, sel_view);
  if (!v59)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v60 = v59;
  id v61 = objc_msgSend(v59, sel_topAnchor);

  id v62 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v61);
  *(void *)(v48 + 40) = v62;
  id v63 = objc_msgSend(v45, sel_view);
  if (!v63)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  double v64 = v63;
  id v65 = objc_msgSend(v63, sel_trailingAnchor);

  id v66 = objc_msgSend(v1, sel_view);
  if (!v66)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v67 = v66;
  id v68 = objc_msgSend(v66, sel_trailingAnchor);

  id v69 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v68);
  *(void *)(v48 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v69;
  id v70 = objc_msgSend(v45, sel_view);
  if (v70)
  {
    CGRect v71 = v70;
    id v72 = objc_msgSend(v70, sel_bottomAnchor);

    id v73 = objc_msgSend(v1, sel_view);
    if (v73)
    {
      v74 = v73;
      v75 = self;
      id v76 = objc_msgSend(v74, sel_bottomAnchor);

      id v77 = objc_msgSend(v72, sel_constraintEqualToAnchor_, v76);
      *(void *)(v48 + 56) = v77;
      sub_1B411E938();
      sub_1B40E1BC8(0, &qword_1E9CFCD60);
      v78 = (void *)sub_1B411E908();
      swift_bridgeObjectRelease();
      objc_msgSend(v75, sel_activateConstraints_, v78);

      swift_unknownObjectRelease();
      *(void *)&long long v116 = v85;
      *((void *)&v116 + 1) = v84;
      *(void *)&long long v117 = sub_1B40E90FC;
      *((void *)&v117 + 1) = v32;
      *(void *)&long long v118 = sub_1B40E902C;
      *((void *)&v118 + 1) = v31;
      *(void *)&long long v119 = v91;
      *((void *)&v119 + 1) = v90;
      *(void *)&long long v120 = v89;
      *((void *)&v120 + 1) = v88;
      LOBYTE(v121) = v142;
      BYTE1(v121) = v141;
      *((void *)&v121 + 1) = v87;
      LOBYTE(v122) = v140;
      *((void *)&v122 + 1) = v86;
      LOBYTE(v123) = v139;
      BYTE1(v123) = v138;
      *((void *)&v123 + 1) = v81;
      *(void *)&long long v124 = v82;
      BYTE8(v124) = v137;
      HIDWORD(v124) = v83;
      LOBYTE(v125) = v136;
      HIBYTE(v125) = v135;
      return sub_1B40E9228((uint64_t)&v116);
    }
    goto LABEL_28;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = sub_1B411ECC8();
  __break(1u);
  return result;
}

void sub_1B40E3A48(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  os_log_type_t v10 = sub_1B411EA28();
  uint64_t v11 = (os_log_t *)sub_1B40EC57C();
  os_log_t v12 = *v11;
  if (os_log_type_enabled(*v11, v10))
  {
    swift_bridgeObjectRetain_n();
    log = v12;
    uint64_t v32 = a4;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v34 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B40DFA70(a1, a2, &v34);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3F4C000, log, v10, "EKCalendarChooserOOPImpl: Received remoteCalendarChooserRequestPresentView on the host app side. viewName: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v14, -1, -1);
    id v15 = v13;
    a4 = v32;
    MEMORY[0x1BA986180](v15, -1, -1);
  }
  id v16 = objc_msgSend(v5, sel_parentViewController);
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v16, sel_parentViewController);

    if (v18)
    {
      self;
      uint64_t v19 = swift_dynamicCastObjCClass();
      if (v19)
      {
        double v20 = (void *)v19;
        if (!a1 && a2 == 0xE000000000000000 || (sub_1B411ED48() & 1) != 0)
        {
          id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
          if (!v21)
          {

            return;
          }
        }
        else
        {
          sub_1B411EA18();
          char v23 = *v11;
          sub_1B411E578();

          type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
          swift_bridgeObjectRetain();
          id v21 = EKEventGenericDetailViewControllerOOPImpl.__allocating_init(hostViewID:)(a3, a4);
        }
        os_log_t v22 = (os_log_t)v21;
        id v24 = objc_msgSend(v20, sel_navigationDelegate);
        if (!v24) {
          goto LABEL_27;
        }
        id v25 = v24;
        if (!a5)
        {
          if ((objc_msgSend(v24, sel_respondsToSelector_, sel_pushViewController_animated_) & 1) == 0)
          {

            swift_unknownObjectRelease();
            return;
          }
          objc_msgSend(v25, sel_pushViewController_animated_, v22, 1);

          swift_unknownObjectRelease();
          goto LABEL_28;
        }
        if (a5 != 1)
        {
          if (a5 != 2)
          {
            os_log_type_t v26 = sub_1B411EA18();
            id v27 = *v11;
            os_log_type_t v28 = v26;
            if (os_log_type_enabled(v27, v26))
            {
              id v29 = v27;
              id v30 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)id v30 = 134217984;
              uint64_t v34 = a5;
              sub_1B411EAF8();
              _os_log_impl(&dword_1B3F4C000, v29, v28, "EKCalendarChooserOOPImpl: presentationStyle not recognized: %ld", v30, 0xCu);
              MEMORY[0x1BA986180](v30, -1, -1);
              swift_unknownObjectRelease();

LABEL_27:
LABEL_28:

              goto LABEL_13;
            }
LABEL_26:
            swift_unknownObjectRelease();
            goto LABEL_27;
          }
          [v22 setModalPresentationStyle:2];
        }
        objc_msgSend(v25, sel_presentViewController_animated_completion_, v22, 1, 0);
        goto LABEL_26;
      }
    }
  }
  sub_1B411EA18();
  os_log_t v22 = *v11;
  sub_1B411E578();
LABEL_13:
}

void sub_1B40E3EC0(unint64_t a1, char a2)
{
  long long v3 = v2;
  sub_1B411EA28();
  uint64_t v6 = sub_1B40EC57C();
  id v7 = (id)*v6;
  sub_1B411E578();

  id v8 = objc_msgSend(v3, sel_parentViewController);
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_msgSend(v8, sel_parentViewController);

    if (v10)
    {
      self;
      uint64_t v11 = swift_dynamicCastObjCClass();
      if (v11)
      {
        uint64_t v12 = v11;
        id v13 = objc_msgSend(v3, sel_parentViewController);
        if (v13)
        {
          id v22 = v13;
          self;
          uint64_t v14 = swift_dynamicCastObjCClass();
          if (v14)
          {
            id v15 = (void *)v14;
            id v16 = v3;
            unint64_t v17 = sub_1B40E92AC(a1, v16);

            uint64_t v18 = sub_1B40E9440(v17);
            swift_bridgeObjectRelease();
            *(void *)&v16[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars] = v18;
            swift_bridgeObjectRelease();
            sub_1B40E1BC8(0, &qword_1E9CFC438);
            sub_1B40E9594();
            swift_bridgeObjectRetain();
            uint64_t v19 = (void *)sub_1B411E9C8();
            swift_bridgeObjectRelease();
            objc_msgSend(v15, sel_remoteCalendarChooserSelectionChanged_allSelected_, v19, a2 & 1);

            double v20 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *(void *)v16) + 0x1D0))();
            if (v20)
            {
              id v21 = v20;
              if (objc_msgSend(v20, sel_respondsToSelector_, sel_calendarChooserSelectionDidChange_)) {
                objc_msgSend(v21, sel_calendarChooserSelectionDidChange_, v12);
              }

              swift_unknownObjectRelease();
              return;
            }
            goto LABEL_19;
          }
        }
        sub_1B411EA18();
        id v22 = (id)*v6;
        sub_1B411E578();
LABEL_19:

        goto LABEL_14;
      }
    }
  }
  sub_1B411EA18();
  id v22 = (id)*v6;
  sub_1B411E578();
LABEL_14:
}

uint64_t sub_1B40E4240()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B40E42A8(uint64_t a1)
{
  return sub_1B40E5B50(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle, (void (*)(void))sub_1B4114DF4);
}

uint64_t sub_1B40E42C8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x158))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E432C(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x160))(*a1);
}

void (*sub_1B40E438C(void *a1))(void **a1, char a2)
{
  long long v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E43F8;
}

void sub_1B40E43F8(void **a1, char a2)
{
}

uint64_t sub_1B40E4458()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B40E44C0(uint64_t a1)
{
  return sub_1B40E5B50(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle, (void (*)(void))sub_1B4115018);
}

uint64_t sub_1B40E44E0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x170))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E4544(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x178))(*a1);
}

void (*sub_1B40E45A4(void *a1))(void **a1, char a2)
{
  long long v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E4610;
}

void sub_1B40E4610(void **a1, char a2)
{
}

uint64_t sub_1B40E4670()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B40E46D8(uint64_t a1)
{
  return sub_1B40E5B50(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType, (void (*)(void))sub_1B4115234);
}

uint64_t sub_1B40E46F8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x188))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E475C(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x190))(*a1);
}

void (*sub_1B40E47BC(void *a1))(void **a1, char a2)
{
  long long v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E4828;
}

void sub_1B40E4828(void **a1, char a2)
{
}

id EKCalendarChooserOOPImpl.eventStore.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore);
}

uint64_t sub_1B40E48A8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E4910(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser, (void (*)(void))sub_1B4115454);
}

uint64_t sub_1B40E4930@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1A0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E4998(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1A8))(*a1);
}

void (*sub_1B40E49F8(void *a1))(void **a1, char a2)
{
  long long v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E4A64;
}

void sub_1B40E4A64(void **a1, char a2)
{
}

uint64_t sub_1B40E4AC4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E4B2C(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell, (void (*)(void))sub_1B4115674);
}

uint64_t sub_1B40E4B4C@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1B8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E4BB4(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1C0))(*a1);
}

void (*sub_1B40E4C14(void *a1))(void **a1, char a2)
{
  long long v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E4C80;
}

void sub_1B40E4C80(void **a1, char a2)
{
}

uint64_t sub_1B40E4CF4()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B40E4DA8(uint64_t a1)
{
  long long v3 = (void *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_1B40E4DFC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1D0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E4E60(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1D8);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B40E4ECC())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B40E4FA8()
{
  uint64_t v1 = MEMORY[0x1E4FBC870];
  uint64_t v7 = MEMORY[0x1E4FBC870];
  uint64_t v2 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
  if (v3 == 1)
  {
    uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars);
    swift_bridgeObjectRetain();
  }
  else if (!v3)
  {
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((*v2 & *v0) + 0x280))();
    if (v4)
    {
      sub_1B40E7A94(&v6, v4);

      return v7;
    }
  }
  return v1;
}

uint64_t sub_1B40E5140(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = a1;
  swift_bridgeObjectRelease();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_1B40E5410(v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B40E5198@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x200))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E51FC(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x208);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B40E5268(void *a1))(void *a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = MEMORY[0x1E4FBC870];
  uint64_t v9 = MEMORY[0x1E4FBC870];
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x158))();
  if (v5 == 1)
  {
    uint64_t v3 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars);
    swift_bridgeObjectRetain();
  }
  else if (!v5)
  {
    id v6 = (void *)(*(uint64_t (**)(void))((*v4 & *v1) + 0x280))();
    if (v6)
    {
      sub_1B40E7A94(&v8, v6);

      uint64_t v3 = v9;
    }
  }
  *a1 = v3;
  return sub_1B40E537C;
}

uint64_t sub_1B40E537C(void *a1, char a2)
{
  *(void *)(a1[1] + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v2 = swift_bridgeObjectRetain();
    sub_1B40E5410(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = swift_bridgeObjectRetain();
    sub_1B40E5410(v3);
  }

  return swift_bridgeObjectRelease();
}

void sub_1B40E5410(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA80]), sel_init);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B411EB68();
    sub_1B40E1BC8(0, &qword_1E9CFC438);
    sub_1B40E9594();
    sub_1B411EA08();
    a1 = v24[19];
    uint64_t v21 = v24[20];
    uint64_t v3 = v24[21];
    uint64_t v4 = v24[22];
    unint64_t v5 = v24[23];
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v21 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  int64_t v20 = (unint64_t)(v3 + 64) >> 6;
  while (a1 < 0)
  {
    uint64_t v12 = sub_1B411EBD8();
    if (!v12) {
      goto LABEL_32;
    }
    v23[0] = v12;
    sub_1B40E1BC8(0, &qword_1E9CFC438);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v13 = (id)v24[0];
    swift_unknownObjectRelease();
    uint64_t v11 = v4;
    uint64_t v9 = v5;
    if (!v24[0]) {
      goto LABEL_32;
    }
LABEL_30:
    id v17 = objc_msgSend(v13, sel_calendarIdentifier);
    if (!v17)
    {
      sub_1B411E8C8();
      id v17 = (id)sub_1B411E898();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v2, sel_addObject_, v17);

    uint64_t v4 = v11;
    unint64_t v5 = v9;
  }
  if (v5)
  {
    uint64_t v9 = (v5 - 1) & v5;
    unint64_t v10 = __clz(__rbit64(v5)) | (v4 << 6);
    uint64_t v11 = v4;
    goto LABEL_29;
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v20) {
    goto LABEL_32;
  }
  unint64_t v15 = *(void *)(v21 + 8 * v14);
  uint64_t v11 = v4 + 1;
  if (v15) {
    goto LABEL_28;
  }
  uint64_t v11 = v4 + 2;
  if (v4 + 2 >= v20) {
    goto LABEL_32;
  }
  unint64_t v15 = *(void *)(v21 + 8 * v11);
  if (v15) {
    goto LABEL_28;
  }
  uint64_t v11 = v4 + 3;
  if (v4 + 3 >= v20) {
    goto LABEL_32;
  }
  unint64_t v15 = *(void *)(v21 + 8 * v11);
  if (v15) {
    goto LABEL_28;
  }
  uint64_t v11 = v4 + 4;
  if (v4 + 4 >= v20) {
    goto LABEL_32;
  }
  unint64_t v15 = *(void *)(v21 + 8 * v11);
  if (v15)
  {
LABEL_28:
    uint64_t v9 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(a1 + 48) + 8 * v10);
    if (!v13) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  uint64_t v16 = v4 + 5;
  while (v20 != v16)
  {
    unint64_t v15 = *(void *)(v21 + 8 * v16++);
    if (v15)
    {
      uint64_t v11 = v16 - 1;
      goto LABEL_28;
    }
  }
LABEL_32:
  sub_1B40EA518();
  uint64_t v18 = sub_1B40E21E0();
  sub_1B40E2178(v19, (uint64_t)v23);
  sub_1B40E2178((uint64_t)v23, (uint64_t)v24);
  if (sub_1B40E8ED0((uint64_t)v24) != 1) {
    sub_1B4115878(v2);
  }
  ((void (*)(unsigned char *, void))v18)(v22, 0);
}

uint64_t sub_1B40E57C4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E582C(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories, (void (*)(void))sub_1B4115AD4);
}

uint64_t sub_1B40E584C@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x220))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E58B4(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x228))(*a1);
}

void (*sub_1B40E5914(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E5980;
}

void sub_1B40E5980(void **a1, char a2)
{
}

uint64_t sub_1B40E59E0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode;
  swift_beginAccess();
  return *(void *)v1;
}

void sub_1B40E5A48(char *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void))
{
  uint64_t v8 = &a1[*a4];
  swift_beginAccess();
  *(void *)uint64_t v8 = a3;
  uint64_t v9 = a1;
  unint64_t v10 = sub_1B40E21E0();
  sub_1B40E2178(v11, (uint64_t)v13);
  sub_1B40E2178((uint64_t)v13, (uint64_t)v14);
  if (sub_1B40E8ED0((uint64_t)v14) != 1)
  {
    swift_beginAccess();
    a5(*(void *)v8);
  }
  ((void (*)(char *, void))v10)(v12, 0);
}

uint64_t sub_1B40E5B30(uint64_t a1)
{
  return sub_1B40E5B50(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode, (void (*)(void))sub_1B4115CF4);
}

uint64_t sub_1B40E5B50(uint64_t a1, void *a2, void (*a3)(void))
{
  uint64_t v6 = (void *)(v3 + *a2);
  swift_beginAccess();
  *uint64_t v6 = a1;
  uint64_t v7 = sub_1B40E21E0();
  sub_1B40E2178(v8, (uint64_t)v11);
  sub_1B40E2178((uint64_t)v11, (uint64_t)v12);
  if (sub_1B40E8ED0((uint64_t)v12) != 1)
  {
    swift_beginAccess();
    a3(*v6);
  }
  return ((uint64_t (*)(unsigned char *, void))v7)(v10, 0);
}

uint64_t sub_1B40E5C1C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x238))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E5C80(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x240))(*a1);
}

void (*sub_1B40E5CE0(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E5D4C;
}

void sub_1B40E5D4C(void **a1, char a2)
{
}

void sub_1B40E5D64(void **a1, char a2, void (*a3)(void))
{
  uint64_t v3 = *a1;
  uint64_t v4 = (uint64_t)(*a1 + 38);
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    uint64_t v6 = sub_1B40E21E0();
    sub_1B40E2178(v7, (uint64_t)(v3 + 19));
    sub_1B40E2178((uint64_t)(v3 + 19), (uint64_t)v3);
    if (sub_1B40E8ED0((uint64_t)v3) != 1)
    {
      uint64_t v8 = (void *)(v3[45] + v3[46]);
      swift_beginAccess();
      a3(*v8);
    }
    ((void (*)(uint64_t, void))v6)(v4, 0);
  }

  free(v3);
}

uint64_t sub_1B40E5E8C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E5EF4(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus, (void (*)(void))sub_1B4115F14);
}

uint64_t sub_1B40E5F14@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x250))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E5F7C(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x258))(*a1);
}

void (*sub_1B40E5FDC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E6048;
}

void sub_1B40E6048(void **a1, char a2)
{
}

uint64_t sub_1B40E60A8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E6110(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh, (void (*)(void))sub_1B4116134);
}

uint64_t sub_1B40E6130@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x268))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E6198(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x270))(*a1);
}

void (*sub_1B40E61F8(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E6264;
}

void sub_1B40E6264(void **a1, char a2)
{
}

uint64_t sub_1B40E62E4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_1B40E6490(v0);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_1B40E6384(void *a1)
{
  sub_1B40E95FC(a1);
}

uint64_t sub_1B40E63BC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x280))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E6420(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x288);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_1B40E6490(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_1B411EB58();
    uint64_t v5 = v4;
    uint64_t v6 = sub_1B411EBE8();
    char v8 = MEMORY[0x1BA984730](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_1B40EA50C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_1B40E8800(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    sub_1B40EA50C(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_1B40E8A78(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_1B40E65A0(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_1B40E6490(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_1B40E6610;
}

void sub_1B40E6610(void **a1, char a2)
{
  id v4 = *a1;
  if (a2)
  {
    id v2 = v4;
    sub_1B40E95FC(v4);

    uint64_t v3 = v2;
  }
  else
  {
    sub_1B40E95FC(*a1);
    uint64_t v3 = v4;
  }
}

uint64_t sub_1B40E66C4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E672C(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting, (void (*)(void))sub_1B4116A30);
}

uint64_t sub_1B40E674C@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x298))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E67B4(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2A0))(*a1);
}

void (*sub_1B40E6814(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E6880;
}

void sub_1B40E6880(void **a1, char a2)
{
}

void *sub_1B40E68E4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40E6990(void *a1)
{
  sub_1B40E9728(a1);
}

uint64_t sub_1B40E69C8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2B0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E6A2C(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2B8);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B40E6A9C(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E6B08;
}

void sub_1B40E6B08(void **a1, char a2)
{
  id v2 = *a1;
  uint64_t v3 = (uint64_t)(*a1 + 38);
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    uint64_t v4 = sub_1B40E21E0();
    sub_1B40E2178(v5, (uint64_t)(v2 + 19));
    sub_1B40E2178((uint64_t)(v2 + 19), (uint64_t)v2);
    if (sub_1B40E8ED0((uint64_t)v2) != 1)
    {
      uint64_t v6 = (void **)(v2[45] + v2[46]);
      swift_beginAccess();
      uint64_t v7 = *v6;
      id v8 = v7;
      sub_1B4116428(v7);
    }
    ((void (*)(uint64_t, void))v4)(v3, 0);
  }

  free(v2);
}

uint64_t sub_1B40E6C30()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E6D54(int a1)
{
  uint64_t v3 = (int *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  int *v3 = a1;
  uint64_t v4 = sub_1B40E21E0();
  sub_1B40E2178(v5, (uint64_t)v8);
  sub_1B40E2178((uint64_t)v8, (uint64_t)v9);
  if (sub_1B40E8ED0((uint64_t)v9) != 1)
  {
    swift_beginAccess();
    sub_1B4116C4C(*v3);
  }
  return ((uint64_t (*)(unsigned char *, void))v4)(v7, 0);
}

uint64_t sub_1B40E6E1C@<X0>(void **a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2C8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40E6E80(unsigned int *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2D0))(*a1);
}

void (*sub_1B40E6EE0(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E6F4C;
}

void sub_1B40E6F4C(void **a1, char a2)
{
  id v2 = *a1;
  uint64_t v3 = (uint64_t)(*a1 + 38);
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    uint64_t v4 = sub_1B40E21E0();
    sub_1B40E2178(v5, (uint64_t)(v2 + 19));
    sub_1B40E2178((uint64_t)(v2 + 19), (uint64_t)v2);
    if (sub_1B40E8ED0((uint64_t)v2) != 1)
    {
      uint64_t v6 = (int *)(v2[45] + v2[46]);
      swift_beginAccess();
      sub_1B4116C4C(*v6);
    }
    ((void (*)(uint64_t, void))v4)(v3, 0);
  }

  free(v2);
}

uint64_t sub_1B40E706C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40E70D4(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus, (void (*)(void))sub_1B4116E6C);
}

uint64_t sub_1B40E70F4@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2E0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E715C(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2E8))(*a1);
}

void (*sub_1B40E71BC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E7228;
}

void sub_1B40E7228(void **a1, char a2)
{
}

uint64_t sub_1B40E7288()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts);
  swift_beginAccess();
  return *v1;
}

void sub_1B40E72F0(char *a1, uint64_t a2, char a3, void *a4, void (*a5)(void))
{
  id v8 = &a1[*a4];
  swift_beginAccess();
  *id v8 = a3;
  uint64_t v9 = a1;
  unint64_t v10 = sub_1B40E21E0();
  sub_1B40E2178(v11, (uint64_t)v13);
  sub_1B40E2178((uint64_t)v13, (uint64_t)v14);
  if (sub_1B40E8ED0((uint64_t)v14) != 1)
  {
    swift_beginAccess();
    a5(*v8);
  }
  ((void (*)(char *, void))v10)(v12, 0);
}

uint64_t sub_1B40E73D8(char a1)
{
  return sub_1B40E73F8(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts, (void (*)(void))sub_1B411708C);
}

uint64_t sub_1B40E73F8(char a1, void *a2, void (*a3)(void))
{
  uint64_t v6 = (unsigned char *)(v3 + *a2);
  swift_beginAccess();
  *uint64_t v6 = a1;
  uint64_t v7 = sub_1B40E21E0();
  sub_1B40E2178(v8, (uint64_t)v11);
  sub_1B40E2178((uint64_t)v11, (uint64_t)v12);
  if (sub_1B40E8ED0((uint64_t)v12) != 1)
  {
    swift_beginAccess();
    a3(*v6);
  }
  return ((uint64_t (*)(unsigned char *, void))v7)(v10, 0);
}

uint64_t sub_1B40E74C4@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2F8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40E752C(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x300))(*a1);
}

void (*sub_1B40E758C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x178uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1B40E75F8;
}

void sub_1B40E75F8(void **a1, char a2)
{
}

void sub_1B40E7610(void **a1, char a2, void (*a3)(void))
{
  uint64_t v3 = *a1;
  uint64_t v4 = (uint64_t)(*a1 + 38);
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    uint64_t v6 = sub_1B40E21E0();
    sub_1B40E2178(v7, (uint64_t)(v3 + 19));
    sub_1B40E2178((uint64_t)(v3 + 19), (uint64_t)v3);
    if (sub_1B40E8ED0((uint64_t)v3) != 1)
    {
      uint64_t v8 = (unsigned __int8 *)(v3[45] + v3[46]);
      swift_beginAccess();
      a3(*v8);
    }
    ((void (*)(uint64_t, void))v6)(v4, 0);
  }

  free(v3);
}

uint64_t sub_1B40E76F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView;
  swift_beginAccess();
  sub_1B40E2178(v1, (uint64_t)v15);
  sub_1B40E2178((uint64_t)v15, (uint64_t)v16);
  uint64_t result = sub_1B40E8ED0((uint64_t)v16);
  if (result != 1)
  {
    sub_1B40E2178((uint64_t)v15, (uint64_t)v3);
    long long v11 = v3[6];
    long long v12 = v3[7];
    long long v13 = v3[8];
    __int16 v14 = v4;
    long long v7 = v3[2];
    long long v8 = v3[3];
    long long v9 = v3[4];
    long long v10 = v3[5];
    long long v5 = v3[0];
    long long v6 = v3[1];
    sub_1B40E91A4((uint64_t)v3);
    sub_1B4117094();
    return sub_1B40E8EE8((uint64_t)v15, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1B40E8E2C);
  }
  return result;
}

id EKCalendarChooserOOPImpl.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  __int16 v4 = v3;
  if (a2)
  {
    long long v6 = (void *)sub_1B411E898();
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void EKCalendarChooserOOPImpl.init(nibName:bundle:)()
{
}

id EKCalendarChooserOOPImpl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKCalendarChooserOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B40E7A94(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1B411EBB8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1B40E1BC8(0, &qword_1E9CFC438);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1B411EBA8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_1B40E7D34(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_1B40E7F2C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_1B40E81CC((uint64_t)v8, v22);
    uint64_t *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1B411EAB8();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_1B40E1BC8(0, &qword_1E9CFC438);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_1B411EAC8();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_1B411EAC8();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *objc_super v2 = 0x8000000000000000;
    id v8 = a2;
    sub_1B40E8250((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *objc_super v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1B40E7D34(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F0);
    uint64_t v2 = sub_1B411EC38();
    uint64_t v14 = v2;
    sub_1B411EB68();
    if (sub_1B411EBD8())
    {
      sub_1B40E1BC8(0, &qword_1E9CFC438);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1B40E7F2C();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_1B411EAB8();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v_Block_object_dispose(&STACK[0x2D0], 8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_1B411EBD8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

uint64_t sub_1B40E7F2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F0);
  uint64_t v3 = sub_1B411EC28();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_1B411EAB8();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_1B40E81CC(uint64_t a1, uint64_t a2)
{
  sub_1B411EAB8();
  unint64_t result = sub_1B411EB48();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1B40E8250(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1B40E7F2C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1B40E83D8();
      goto LABEL_14;
    }
    sub_1B40E8584();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_1B411EAB8();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1B40E1BC8(0, &qword_1E9CFC438);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_1B411EAC8();

    if (v12)
    {
LABEL_13:
      sub_1B411ED58();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_1B411EAC8();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_1B40E83D8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B411EC18();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B40E8584()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F0);
  uint64_t v3 = sub_1B411EC28();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_1B411EAB8();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_1B40E8800(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x1BA984780](a1, a2, v7);
      sub_1B40E1BC8(0, &qword_1E9CFC438);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_1B411EB88() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_1B411EB98();
  sub_1B40E1BC8(0, &qword_1E9CFC438);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1B411EAB8();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_1B411EAC8();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_1B411EAC8();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  unint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v16 = v15;
}

uint64_t sub_1B40E8A78(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

id sub_1B40E8B00(void *a1)
{
  uint64_t v2 = v1;
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController] = 0;
  uint64_t v4 = (uint64_t)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView];
  sub_1B40E2158((uint64_t)v10);
  sub_1B40E2178((uint64_t)v10, v4);
  uint64_t v5 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel;
  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  unsigned int v6 = v2;
  *(void *)&v2[v5] = sub_1B4101D38();
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars] = MEMORY[0x1E4FBC870];
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource] = 0;
  *(_DWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore] = a1;
  id v7 = a1;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for EKCalendarChooserOOPImpl();
  return objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, 0, 0);
}

void sub_1B40E8C88()
{
  unint64_t v1 = v0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController] = 0;
  uint64_t v2 = (uint64_t)&v0[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView];
  sub_1B40E2158((uint64_t)v4);
  sub_1B40E2178((uint64_t)v4, v2);
  uint64_t v3 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel;
  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  *(void *)&v1[v3] = sub_1B4101D38();
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars] = MEMORY[0x1E4FBC870];
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource] = 0;
  *(_DWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts] = 0;

  sub_1B411ECC8();
  __break(1u);
}

uint64_t type metadata accessor for EKCalendarChooserOOPImpl()
{
  return self;
}

void sub_1B40E8E2C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  if (a2)
  {

    sub_1B40DA270(a3);
    sub_1B40DA270(a5);
  }
}

uint64_t sub_1B40E8ED0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_1B40E8EE8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))
{
  __int16 v4 = *(_WORD *)(a1 + 144);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), v4);
  return a1;
}

void sub_1B40E8F54(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  if (a2)
  {
    id v20 = a2;
    sub_1B40DA260(a3);
    sub_1B40DA260(a5);
    id v21 = a17;
    id v22 = a7;
    id v23 = a12;
    id v24 = a16;
  }
}

uint64_t sub_1B40E8FF4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B40E902C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  char v11 = (void *)MEMORY[0x1BA986210](v5 + 16);
  if (v11)
  {
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v11) + 0x148))(a1, a2, a3, a4, a5);
  }
}

void sub_1B40E90FC(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t v5 = (void *)MEMORY[0x1BA986210](v2 + 16);
  if (v5)
  {
    unsigned int v6 = v5;
    (*(void (**)(uint64_t, void))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x150))(a1, a2 & 1);
  }
}

uint64_t sub_1B40E91A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 88);
  unsigned int v6 = *(void **)(a1 + 120);
  id v7 = *(void **)(a1 + 128);
  id v8 = *(id *)(a1 + 8);
  sub_1B40DA260(v2);
  sub_1B40DA260(v3);
  id v9 = v7;
  id v10 = v4;
  id v11 = v5;
  id v12 = v6;
  return a1;
}

uint64_t sub_1B40E9228(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 88);
  unsigned int v6 = *(void **)(a1 + 120);
  id v7 = *(void **)(a1 + 128);

  sub_1B40DA270(v2);
  sub_1B40DA270(v3);

  return a1;
}

uint64_t sub_1B40E92AC(unint64_t a1, char *a2)
{
  uint64_t v11 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1B411ECD8())
  {
    uint64_t v5 = *(void *)&a2[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore];
    for (uint64_t i = 4; ; ++i)
    {
      id v7 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1BA984810](i - 4, a1)
         : (char *)*(id *)(a1 + 8 * i);
      a2 = v7;
      uint64_t v8 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v9 = objc_msgSend(v7, sel_calendarInEventStore_, v5);

      if (v9)
      {
        MEMORY[0x1BA9844B0]();
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B411E948();
        }
        sub_1B411E958();
        sub_1B411E938();
      }
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1B40E9440(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1B411ECD8();
    swift_bridgeObjectRelease();
  }
  sub_1B40E1BC8(0, &qword_1E9CFC438);
  sub_1B40E9594();
  uint64_t result = sub_1B411E9F8();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B411ECD8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        unsigned int v6 = (void *)MEMORY[0x1BA984810](i, a1);
        sub_1B40E7A94(&v9, v6);
      }
    }
    else
    {
      id v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_1B40E7A94(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1B40E9594()
{
  unint64_t result = qword_1E9CFC440;
  if (!qword_1E9CFC440)
  {
    sub_1B40E1BC8(255, &qword_1E9CFC438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC440);
  }
  return result;
}

uint64_t sub_1B40E95FC(void *a1)
{
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC420);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B413B4C0;
    *(void *)(inited + 32) = a1;
    v12[0] = inited;
    sub_1B411E938();
    id v4 = a1;
    uint64_t v5 = sub_1B40E9440(v12[0]);
    swift_bridgeObjectRelease();
    *(void *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = v5;
  }
  else
  {
    *(void *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = MEMORY[0x1E4FBC870];
  }
  swift_bridgeObjectRelease();
  unsigned int v6 = sub_1B40E21E0();
  sub_1B40E2178(v7, (uint64_t)v11);
  sub_1B40E2178((uint64_t)v11, (uint64_t)v12);
  if (sub_1B40E8ED0((uint64_t)v12) != 1)
  {
    id v8 = a1;
    sub_1B41167BC(a1);
  }
  return ((uint64_t (*)(unsigned char *, void))v6)(v10, 0);
}

uint64_t sub_1B40E9728(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource);
  swift_beginAccess();
  id v4 = *v3;
  uint64_t *v3 = a1;
  id v5 = a1;

  unsigned int v6 = sub_1B40E21E0();
  sub_1B40E2178(v7, (uint64_t)v12);
  sub_1B40E2178((uint64_t)v12, (uint64_t)v13);
  if (sub_1B40E8ED0((uint64_t)v13) != 1)
  {
    swift_beginAccess();
    id v8 = *v3;
    id v9 = v8;
    sub_1B4116428(v8);
  }
  return ((uint64_t (*)(unsigned char *, void))v6)(v11, 0);
}

uint64_t method lookup function for EKCalendarChooserOOPImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKCalendarChooserOOPImpl);
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.__allocating_init(eventStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectionStyle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectionStyle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectionStyle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.displayStyle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.displayStyle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.displayStyle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.entityType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.entityType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.entityType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showIdentityChooser.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showIdentityChooser.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showIdentityChooser.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDelegateSetupCell.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDelegateSetupCell.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDelegateSetupCell.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendars.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendars.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendars.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDetailAccessories.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDetailAccessories.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDetailAccessories.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.chooserMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.chooserMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.chooserMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.disableCalendarsUnselectedByFocus.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.disableCalendarsUnselectedByFocus.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.disableCalendarsUnselectedByFocus.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.allowsPullToRefresh.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.allowsPullToRefresh.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.allowsPullToRefresh.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendar.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendar.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendar.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showsDeclinedEventsSetting.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showsDeclinedEventsSetting.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showsDeclinedEventsSetting.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.limitedToSource.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.limitedToSource.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.limitedToSource.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.explanatoryTextMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.explanatoryTextMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.explanatoryTextMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showAccountStatus.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showAccountStatus.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showAccountStatus.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.onlyShowUnmanagedAccounts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.onlyShowUnmanagedAccounts.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x300))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.onlyShowUnmanagedAccounts.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.toggleAllCalendars()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x310))();
}

void type metadata accessor for EKCalendarChooserExplanatoryTextMode(uint64_t a1)
{
}

void type metadata accessor for CUIKCalendarChooserMode(uint64_t a1)
{
}

void type metadata accessor for EKEntityType(uint64_t a1)
{
}

void type metadata accessor for EKCalendarChooserDisplayStyle(uint64_t a1)
{
}

void type metadata accessor for EKCalendarChooserSelectionStyle(uint64_t a1)
{
}

void sub_1B40EA4C4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1B40EA50C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B40EA518()
{
  return swift_release();
}

id sub_1B40EA520(uint64_t a1)
{
  return sub_1B40EAB6C(a1, &protocolRef_EKEventViewHostInterface, &qword_1E9CFD798);
}

void *sub_1B40EA534()
{
  if (qword_1E9CFD790 != -1) {
    swift_once();
  }
  return &qword_1E9CFD798;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventViewHostInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD790, (void **)&qword_1E9CFD798);
}

void sub_1B40EA5A4()
{
  id v0 = objc_msgSend(objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F0DA10C0), sel_classesForSelector_argumentIndex_ofReply_, sel_setupEventViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, 0, 0);
  sub_1B411E9E8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B413B5C0;
  uint64_t v2 = sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC500);
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = sub_1B411E868();
  *(void *)(v1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC618);
  *(void *)(v1 + 64) = v3;
  uint64_t v4 = sub_1B40E1BC8(0, &qword_1E9CFC508);
  *(void *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC510);
  *(void *)(v1 + 96) = v4;
  uint64_t v5 = sub_1B40E1BC8(0, &qword_1E9CFC518);
  *(void *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC520);
  *(void *)(v1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v5;
  uint64_t v6 = sub_1B40E1BC8(0, &qword_1E9CFC528);
  *(void *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC530);
  *(void *)(v1 + 160) = v6;
  id v7 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  id v8 = (void *)sub_1B411E908();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_initWithArray_, v8);

  sub_1B411E9D8();
  __break(1u);
}

uint64_t sub_1B40EA8D8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v5 = result + 56;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v20 = a2;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v4;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v9) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v3;
    if (!v13)
    {
      int64_t v3 = v12 + 1;
      if (v12 + 1 >= v9) {
        goto LABEL_23;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v3);
      if (!v13)
      {
        int64_t v3 = v12 + 2;
        if (v12 + 2 >= v9) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v3);
        if (!v13)
        {
          int64_t v3 = v12 + 3;
          if (v12 + 3 >= v9) {
            goto LABEL_23;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v3);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v3 << 6);
LABEL_5:
    sub_1B40EBA50(*(void *)(v2 + 48) + 40 * v11, (uint64_t)v18);
    v15[0] = v18[0];
    v15[1] = v18[1];
    uint64_t v16 = v19;
    sub_1B40EBAAC((uint64_t)v17, (uint64_t)v15);
    uint64_t result = sub_1B40EBC28((uint64_t)v17);
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9)
  {
LABEL_23:
    swift_release();
    return v20;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v3 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v3 >= v9) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v3);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t *sub_1B40EAA64()
{
  if (qword_1E9CFD7A0 != -1) {
    swift_once();
  }
  return &qword_1E9CFD7A8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventViewRemoteInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD7A0, (void **)&qword_1E9CFD7A8);
}

id sub_1B40EAAD4(uint64_t a1)
{
  return sub_1B40EAB6C(a1, &protocolRef_EKEventGenericDetailViewHostInterface, &qword_1E9CFD7B8);
}

void *sub_1B40EAAE8()
{
  if (qword_1E9CFD7B0 != -1) {
    swift_once();
  }
  return &qword_1E9CFD7B8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventGenericDetailViewHostInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD7B0, (void **)&qword_1E9CFD7B8);
}

id sub_1B40EAB58(uint64_t a1)
{
  return sub_1B40EAB6C(a1, &protocolRef_EKEventGenericDetailViewRemoteInterface, &qword_1E9CFD7C8);
}

id sub_1B40EAB6C(uint64_t a1, void *a2, void *a3)
{
  id result = objc_msgSend(self, sel_interfaceWithProtocol_, *a2);
  *a3 = result;
  return result;
}

void *sub_1B40EABB8()
{
  if (qword_1E9CFD7C0 != -1) {
    swift_once();
  }
  return &qword_1E9CFD7C8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventGenericDetailViewRemoteInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD7C0, (void **)&qword_1E9CFD7C8);
}

void sub_1B40EAC28()
{
  id v0 = objc_msgSend(objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F0D837F0), sel_classesForSelector_argumentIndex_ofReply_, sel_didCompleteWithAction_oldToNewObjectIDMap_waitUntilTimestamp_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventConstraints_, 1, 0);
  sub_1B411E9E8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B413B5D0;
  uint64_t v2 = sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC500);
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = sub_1B411E868();
  *(void *)(v1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC618);
  *(void *)(v1 + 64) = v3;
  uint64_t v4 = sub_1B40E1BC8(0, &qword_1E9CFC508);
  *(void *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC510);
  *(void *)(v1 + 96) = v4;
  uint64_t v5 = sub_1B40E1BC8(0, &qword_1E9CFC518);
  *(void *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC520);
  *(void *)(v1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v5;
  uint64_t v6 = sub_1B40E1BC8(0, &qword_1E9CFC528);
  *(void *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC530);
  *(void *)(v1 + 160) = v6;
  uint64_t v7 = sub_1B40E1BC8(0, &qword_1E9CFC620);
  *(void *)(v1 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC628);
  *(void *)(v1 + 192) = v7;
  id v8 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  int64_t v9 = (void *)sub_1B411E908();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithArray_, v9);

  sub_1B411E9D8();
  __break(1u);
}

uint64_t *sub_1B40EAF88()
{
  if (qword_1E9CFD7D0 != -1) {
    swift_once();
  }
  return &qword_1E9CFD7D8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventEditViewHostInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD7D0, (void **)&qword_1E9CFD7D8);
}

void sub_1B40EAFF8()
{
  id v0 = objc_msgSend(objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F0DA1060), sel_classesForSelector_argumentIndex_ofReply_, sel_setupEventEditViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, 0, 0);
  sub_1B411E9E8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B413B5D0;
  uint64_t v2 = sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC500);
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = sub_1B411E868();
  *(void *)(v1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC618);
  *(void *)(v1 + 64) = v3;
  uint64_t v4 = sub_1B40E1BC8(0, &qword_1E9CFC508);
  *(void *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC510);
  *(void *)(v1 + 96) = v4;
  uint64_t v5 = sub_1B40E1BC8(0, &qword_1E9CFC518);
  *(void *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC520);
  *(void *)(v1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v5;
  uint64_t v6 = sub_1B40E1BC8(0, &qword_1E9CFC528);
  *(void *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC530);
  *(void *)(v1 + 160) = v6;
  uint64_t v7 = sub_1B40E1BC8(0, &qword_1E9CFC5A0);
  *(void *)(v1 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC5A8);
  *(void *)(v1 + 192) = v7;
  id v8 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  int64_t v9 = (void *)sub_1B411E908();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithArray_, v9);

  sub_1B411E9D8();
  __break(1u);
}

uint64_t *sub_1B40EB35C()
{
  if (qword_1E9CFD7E0 != -1) {
    swift_once();
  }
  return &qword_1E9CFD7E8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventEditViewRemoteInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD7E0, (void **)&qword_1E9CFD7E8);
}

void sub_1B40EB3CC()
{
  id v0 = objc_msgSend(objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F0D83910), sel_classesForSelector_argumentIndex_ofReply_, sel_calendarSelectionChanged_allSelected_, 0, 0);
  sub_1B411E9E8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B413B5D0;
  uint64_t v2 = sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC500);
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = sub_1B40E1BC8(0, &qword_1E9CFC508);
  *(void *)(v1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC510);
  *(void *)(v1 + 64) = v3;
  uint64_t v4 = sub_1B40E1BC8(0, &qword_1E9CFC518);
  *(void *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC520);
  *(void *)(v1 + 96) = v4;
  uint64_t v5 = sub_1B40E1BC8(0, &qword_1E9CFC528);
  *(void *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC530);
  *(void *)(v1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v5;
  uint64_t v6 = sub_1B40E1BC8(0, &qword_1E9CFC5A0);
  *(void *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC5A8);
  *(void *)(v1 + 160) = v6;
  uint64_t v7 = sub_1B40E1BC8(0, &qword_1E9CFCF00);
  *(void *)(v1 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC5B0);
  *(void *)(v1 + 192) = v7;
  id v8 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  int64_t v9 = (void *)sub_1B411E908();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithArray_, v9);

  sub_1B411E9D8();
  __break(1u);
}

uint64_t *sub_1B40EB6A0()
{
  if (qword_1E9CFD7F0 != -1) {
    swift_once();
  }
  return &qword_1E9CFD7F8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKCalendarChooserViewHostInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD7F0, (void **)&qword_1E9CFD7F8);
}

void sub_1B40EB710()
{
  id v0 = objc_msgSend(objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F0DA1000), sel_classesForSelector_argumentIndex_ofReply_, sel_updateCalendarChooserViewWithChangedViewConfigurationDictionary_, 0, 0);
  sub_1B411E9E8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC4F8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B413B5E0;
  uint64_t v2 = sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
  *(void *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC500);
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = sub_1B40E1BC8(0, &qword_1E9CFC508);
  *(void *)(v1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC510);
  *(void *)(v1 + 64) = v3;
  uint64_t v4 = sub_1B40E1BC8(0, &qword_1E9CFC518);
  *(void *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC520);
  *(void *)(v1 + 96) = v4;
  uint64_t v5 = sub_1B40E1BC8(0, &qword_1E9CFC528);
  *(void *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC530);
  *(void *)(v1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v5;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = (void *)sub_1B411E908();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_initWithArray_, v7);

  sub_1B411E9D8();
  __break(1u);
}

uint64_t *sub_1B40EB984()
{
  if (qword_1E9CFD800 != -1) {
    swift_once();
  }
  return &qword_1E9CFD808;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKCalendarChooserViewRemoteInterface.getter()
{
  return sub_1B40EB9F4(&qword_1E9CFD800, (void **)&qword_1E9CFD808);
}

id sub_1B40EB9F4(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

ValueMetadata *type metadata accessor for EKUIRemoteUIXPCInterface()
{
  return &type metadata for EKUIRemoteUIXPCInterface;
}

uint64_t sub_1B40EBA50(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B40EBAAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1B411EBF8();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    while (1)
    {
      sub_1B40EBA50(*(void *)(v6 + 48) + 40 * v9, (uint64_t)v16);
      char v11 = MEMORY[0x1BA9847C0](v16, a2);
      sub_1B40EBC28((uint64_t)v16);
      if (v11) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    sub_1B40EBC28(a2);
    sub_1B40EBA50(*(void *)(*v3 + 48) + 40 * v9, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1B40EBA50(a2, (uint64_t)v16);
    uint64_t v15 = *v3;
    void *v3 = 0x8000000000000000;
    sub_1B40EBF48((uint64_t)v16, v9, isUniquelyReferenced_nonNull_native);
    void *v3 = v15;
    swift_bridgeObjectRelease();
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_1B40EBC28(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B40EBC7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC538);
  uint64_t v3 = sub_1B411EC28();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v16 = v15 | (v12 << 6);
      }
      else
      {
        int64_t v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9) {
          goto LABEL_33;
        }
        unint64_t v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          int64_t v12 = v17 + 1;
          if (v17 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v18 = v6[v12];
          if (!v18)
          {
            int64_t v12 = v17 + 2;
            if (v17 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v18 = v6[v12];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v12 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v6[v12];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      uint64_t v20 = *(void *)(v2 + 48) + 40 * v16;
      long long v29 = *(_OWORD *)v20;
      long long v30 = *(_OWORD *)(v20 + 16);
      uint64_t v31 = *(void *)(v20 + 32);
      uint64_t result = sub_1B411EBF8();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
      *(_OWORD *)uint64_t v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(void *)(v14 + 32) = v31;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1B40EBF48(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1B40EBC7C();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_1B40EC0B4();
      goto LABEL_12;
    }
    sub_1B40EC284();
  }
  uint64_t v9 = *v3;
  uint64_t result = sub_1B411EBF8();
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    do
    {
      sub_1B40EBA50(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      char v12 = MEMORY[0x1BA9847C0](v19, v6);
      uint64_t result = sub_1B40EBC28((uint64_t)v19);
      if (v12) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v13 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v14 = *(void *)(v13 + 48) + 40 * a2;
  long long v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = *(void *)(v6 + 32);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    *(void *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1B411ED58();
  __break(1u);
  return result;
}

void *sub_1B40EC0B4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC538);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B411EC18();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t result = (void *)sub_1B40EBA50(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B40EC284()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC538);
  uint64_t v3 = sub_1B411EC28();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_1B40EBA50(*(void *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    uint64_t result = sub_1B411EBF8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
    long long v15 = v29[0];
    long long v16 = v29[1];
    *(void *)(v14 + 32) = v30;
    *(_OWORD *)uint64_t v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(void *)(v4 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1B40EC518()
{
  sub_1B40EC5D8();
  uint64_t result = sub_1B411EAD8();
  qword_1E9CFE5B8 = result;
  return result;
}

uint64_t *sub_1B40EC57C()
{
  if (qword_1E9CFD810 != -1) {
    swift_once();
  }
  return &qword_1E9CFE5B8;
}

ValueMetadata *type metadata accessor for EKUILog()
{
  return &type metadata for EKUILog;
}

unint64_t sub_1B40EC5D8()
{
  unint64_t result = qword_1E9CFC690;
  if (!qword_1E9CFC690)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9CFC690);
  }
  return result;
}

id EKEventGenericDetailViewControllerOOPImpl.__allocating_init(hostViewID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (char *)objc_allocWithZone(v3);
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController] = 0;
  uint64_t v7 = &v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  *(_OWORD *)uint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((void *)v7 + 10) = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor] = 0;
  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  unint64_t v8 = v6;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel] = sub_1B4100E54(a1, a2);

  v10.receiver = v8;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, 0, 0);
}

id EKEventGenericDetailViewControllerOOPImpl.init(hostViewID:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController] = 0;
  uint64_t v5 = &v2[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((void *)v5 + 10) = 0;
  *(void *)&v2[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor] = 0;
  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  uint64_t v6 = v2;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel] = sub_1B4100E54(a1, a2);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for EKEventGenericDetailViewControllerOOPImpl()
{
  return self;
}

void sub_1B40EC94C()
{
  uint64_t v1 = v0;
  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
  objc_msgSendSuper2(&v29, sel_viewDidLoad);
  id v2 = objc_retain(*(id *)((char *)v0
                         + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel));
  double v3 = sub_1B40DA280((uint64_t)v28);
  uint64_t v4 = (void *)(*(uint64_t (**)(double))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))(v3);
  sub_1B40DBAE8(v4);
  uint64_t v5 = (void *)v28[1];
  uint64_t v6 = v28[2];
  uint64_t v7 = v28[3];
  uint64_t v8 = v28[4];
  uint64_t v9 = v28[5];
  uint64_t v10 = v28[6];
  uint64_t v11 = v28[7];
  uint64_t v12 = v28[8];
  uint64_t v13 = v28[9];
  uint64_t v14 = (void *)v28[10];
  long long v15 = (void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  uint64_t v27 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  unint64_t v26 = *(void **)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  uint64_t v25 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 16);
  uint64_t v24 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 24);
  uint64_t v23 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 32);
  uint64_t v22 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 40);
  uint64_t v21 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 48);
  uint64_t v20 = *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 56);
  long long v17 = *(_OWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 64);
  long long v16 = *(void **)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 80);
  *long long v15 = v28[0];
  v15[1] = v5;
  _OWORD v15[2] = v6;
  v15[3] = v7;
  v15[4] = v8;
  v15[5] = v9;
  v15[6] = v10;
  v15[7] = v11;
  v15[8] = v12;
  v15[9] = v13;
  v15[10] = v14;
  id v19 = v5;
  sub_1B40DA260(v6);
  sub_1B40DA260(v8);
  sub_1B40DA260(v10);
  sub_1B40DA260(v12);
  id v18 = v14;
  sub_1B40ECB68(v27, v26, v25, v24, v23, v22, v21, v20, v17, *((uint64_t *)&v17 + 1), v16);
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0xC0))();

  sub_1B40DA270(v6);
  sub_1B40DA270(v8);
  sub_1B40DA270(v10);
  sub_1B40DA270(v12);
}

void sub_1B40ECB68(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2)
  {

    sub_1B40DA270(a3);
    sub_1B40DA270(a5);
    sub_1B40DA270(a7);
    sub_1B40DA270(a9);
  }
}

void sub_1B40ECC60()
{
  uint64_t v1 = v0;
  id v2 = (uint64_t *)&v0[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  double v3 = *(void **)&v0[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8];
  if (!v3) {
    goto LABEL_27;
  }
  uint64_t v5 = v2[9];
  uint64_t v4 = (void *)v2[10];
  uint64_t v6 = v2[6];
  uint64_t v57 = v2[7];
  uint64_t v7 = v2[4];
  uint64_t v56 = v2[5];
  uint64_t v8 = v2[2];
  uint64_t v9 = v2[3];
  uint64_t v10 = *v2;
  uint64_t v60 = v2[8];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v58 = v3;
  swift_retain();
  sub_1B40ED4F4(v10, v3, v8, v9, v7, v56, v6, v57, v60, v5, v4);
  id v55 = v4;
  sub_1B40DA270(v8);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v7);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v6);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v60);
  id v11 = v58;
  sub_1B40DA260((uint64_t)sub_1B40ED42C);
  sub_1B40DA260((uint64_t)sub_1B40ED5A4);
  sub_1B40DA260((uint64_t)sub_1B40ED65C);
  sub_1B40DA260((uint64_t)sub_1B40ED704);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v59 = v11;
  id v12 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6B8));
  uint64_t v13 = (void *)sub_1B411E658();
  objc_msgSend(v1, sel_addChildViewController_, v13);
  id v14 = objc_msgSend(v13, sel_view);
  if (!v14)
  {
    __break(1u);
    goto LABEL_16;
  }
  long long v15 = v14;
  objc_msgSend(v14, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  id v16 = objc_msgSend(v1, sel_view);
  if (!v16)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v17 = v16;
  id v18 = objc_msgSend(v13, sel_view);
  if (!v18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v19 = v18;
  objc_msgSend(v17, sel_addSubview_, v18);

  objc_msgSend(v13, sel_didMoveToParentViewController_, v1);
  uint64_t v20 = *(void **)&v1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController];
  *(void *)&v1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController] = v13;
  id v21 = v13;

  id v22 = objc_msgSend(v21, sel_view);
  if (!v22)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v23 = v22;
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC420);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1B413B4B0;
  id v25 = objc_msgSend(v21, sel_view);
  if (!v25)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v26 = v25;
  id v27 = objc_msgSend(v25, sel_leadingAnchor);

  id v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_super v29 = v28;
  id v30 = objc_msgSend(v28, sel_leadingAnchor);

  id v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
  *(void *)(v24 + 32) = v31;
  id v32 = objc_msgSend(v21, sel_view);
  if (!v32)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v33 = v32;
  id v34 = objc_msgSend(v32, sel_topAnchor);

  id v35 = objc_msgSend(v1, sel_view);
  if (!v35)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v36 = v35;
  id v37 = objc_msgSend(v35, sel_topAnchor);

  id v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);
  *(void *)(v24 + 40) = v38;
  id v39 = objc_msgSend(v21, sel_view);
  if (!v39)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v40 = v39;
  id v41 = objc_msgSend(v39, sel_trailingAnchor);

  id v42 = objc_msgSend(v1, sel_view);
  if (!v42)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v43 = v42;
  id v44 = objc_msgSend(v42, sel_trailingAnchor);

  id v45 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v44);
  *(void *)(v24 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v45;
  id v46 = objc_msgSend(v21, sel_view);
  if (v46)
  {
    uint64_t v47 = v46;
    id v48 = objc_msgSend(v46, sel_bottomAnchor);

    id v49 = objc_msgSend(v1, sel_view);
    if (v49)
    {
      uint64_t v50 = v49;
      id v51 = self;
      id v52 = objc_msgSend(v50, sel_bottomAnchor);

      id v53 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v52);
      *(void *)(v24 + 56) = v53;
      sub_1B411E938();
      sub_1B40E1BC8(0, &qword_1E9CFCD60);
      id v54 = (void *)sub_1B411E908();
      swift_bridgeObjectRelease();
      objc_msgSend(v51, sel_activateConstraints_, v54);

      sub_1B40DA270((uint64_t)sub_1B40ED42C);
      sub_1B40DA270((uint64_t)sub_1B40ED5A4);
      sub_1B40DA270((uint64_t)sub_1B40ED65C);
      sub_1B40DA270((uint64_t)sub_1B40ED704);

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  sub_1B411ECC8();
  __break(1u);
}

uint64_t sub_1B40ED3F4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B40ED42C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  id v11 = (void *)MEMORY[0x1BA986210](v5 + 16);
  if (v11)
  {
    id v12 = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v11) + 0xF8))(a1, a2, a3, a4, a5);
  }
}

void sub_1B40ED4F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2)
  {
    id v14 = a2;
    sub_1B40DA260(a3);
    sub_1B40DA260(a5);
    sub_1B40DA260(a7);
    sub_1B40DA260(a9);
    id v15 = a11;
  }
}

void sub_1B40ED5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = (void *)MEMORY[0x1BA986210](v3 + 16);
  if (v7)
  {
    uint64_t v8 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v7) + 0x100))(a1, a2, a3);
  }
}

void sub_1B40ED65C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = (void *)MEMORY[0x1BA986210](v2 + 16);
  if (v5)
  {
    uint64_t v6 = v5;
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x108))(a1, a2);
  }
}

void sub_1B40ED704(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1BA986210](v1 + 16);
  if (v3)
  {
    uint64_t v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x110))(a1);
  }
}

void *sub_1B40ED7E4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40ED890(void *a1)
{
  sub_1B40EF418(a1);
}

uint64_t sub_1B40ED8C8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xC8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40ED924(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xD0);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B40ED98C(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor;
  v3[3] = v1;
  void v3[4] = v4;
  swift_beginAccess();
  return sub_1B40ED9F8;
}

void sub_1B40ED9F8(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    uint64_t v5 = (uint64_t *)(v4 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
    uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
    if (v6)
    {
      uint64_t v9 = *(void **)(v4 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
      uint64_t v10 = v5[2];
      uint64_t v11 = v5[4];
      uint64_t v12 = v5[6];
      uint64_t v13 = v5[8];
      id v14 = (void *)v5[10];
      uint64_t v7 = *(void **)(v4 + v3[4]);
      sub_1B40ED4F4(*v5, v6, v10, v5[3], v11, v5[5], v12, v5[7], v13, v5[9], v14);
      id v8 = v7;
      sub_1B40DBAE8(v7);

      sub_1B40DA270(v10);
      sub_1B40DA270(v11);
      sub_1B40DA270(v12);
      sub_1B40DA270(v13);
    }
  }

  free(v3);
}

void sub_1B40EDB1C(uint64_t a1, uint64_t a2)
{
}

void sub_1B40EDB4C(uint64_t a1, uint64_t a2)
{
}

void sub_1B40EDB64(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  if (v5)
  {
    uint64_t v7 = v4[9];
    uint64_t v6 = (void *)v4[10];
    uint64_t v8 = v4[8];
    uint64_t v10 = v4[5];
    uint64_t v9 = v4[6];
    uint64_t v11 = v4[3];
    uint64_t v12 = v4[4];
    uint64_t v13 = v4[2];
    uint64_t v20 = *v4;
    uint64_t v17 = v4[7];
    id v14 = v5;
    sub_1B40DA260(v13);
    sub_1B40DA260(v12);
    sub_1B40DA260(v9);
    sub_1B40DA260(v8);
    id v15 = v6;
    a3(a1, a2);
    sub_1B40ECB68(v20, v5, v13, v11, v12, v10, v9, v17, v8, v7, v6);
  }
}

uint64_t sub_1B40EDC88(char *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1B411E8C8();
  uint64_t v25 = v7;
  uint64_t v8 = (uint64_t *)&a1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  uint64_t v9 = *(void **)&a1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8];
  if (v9)
  {
    uint64_t v24 = a4;
    uint64_t v11 = v8[9];
    uint64_t v10 = (void *)v8[10];
    uint64_t v12 = v8[7];
    uint64_t v13 = v8[8];
    uint64_t v14 = v8[5];
    uint64_t v15 = v8[6];
    uint64_t v16 = v8[4];
    uint64_t v19 = v8[2];
    uint64_t v20 = v8[3];
    uint64_t v17 = *v8;
    uint64_t v21 = *v8;
    uint64_t v22 = v6;
    uint64_t v23 = a1;
    sub_1B40ED4F4(v17, v9, v19, v20, v16, v14, v15, v12, v13, v11, v10);
    v24(v22, v25);
    sub_1B40ECB68(v21, v9, v19, v20, v16, v14, v15, v12, v13, v11, v10);
  }

  return swift_bridgeObjectRelease();
}

void sub_1B40EDDC8(uint64_t a1)
{
  id v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  if (v3)
  {
    uint64_t v5 = v2[9];
    uint64_t v4 = (void *)v2[10];
    uint64_t v6 = v2[8];
    uint64_t v8 = v2[5];
    uint64_t v7 = v2[6];
    uint64_t v10 = v2[3];
    uint64_t v9 = v2[4];
    uint64_t v11 = v2[2];
    uint64_t v16 = *v2;
    uint64_t v14 = v2[7];
    id v12 = v3;
    sub_1B40DA260(v11);
    sub_1B40DA260(v9);
    sub_1B40DA260(v7);
    sub_1B40DA260(v6);
    id v13 = v4;
    sub_1B40DBF3C(a1);
    sub_1B40ECB68(v16, v3, v11, v10, v9, v8, v7, v14, v6, v5, v4);
  }
}

void sub_1B40EDFF8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  os_log_type_t v8 = sub_1B411EA28();
  uint64_t v9 = (os_log_t *)sub_1B40EC57C();
  os_log_t v10 = *v9;
  if (os_log_type_enabled(*v9, v8))
  {
    swift_bridgeObjectRetain_n();
    loga = v10;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v68 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B40DFA70(a1, a2, &v68);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3F4C000, loga, v8, "EKEventGenericDetailViewControllerOOPImpl: Received remoteViewControllerRequestPresentView on the host app side. viewName: %s.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v12, -1, -1);
    MEMORY[0x1BA986180](v11, -1, -1);
  }
  id v13 = objc_msgSend(v5, sel_parentViewController);
  if (!v13) {
    goto LABEL_30;
  }
  uint64_t v14 = v13;
  self;
  uint64_t v15 = swift_dynamicCastObjCClass();
  if (!v15)
  {

LABEL_30:
    sub_1B411EA18();
    uint64_t v20 = *v9;
    sub_1B411E578();
LABEL_53:

    return;
  }
  uint64_t v16 = (void *)v15;
  id v62 = v9;
  if ((a1 != 0xD000000000000018 || a2 != 0x80000001B4147BF0) && (sub_1B411ED48() & 1) == 0)
  {
    if (a1 == 0xD000000000000016 && a2 == 0x80000001B4147C10 || (sub_1B411ED48() & 1) != 0)
    {
      uint64_t v47 = EventKitUIBundle();
      if (!v47) {
        goto LABEL_57;
      }
      id v48 = v47;
      sub_1B411E448();

      id v49 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      uint64_t v50 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
      unint64_t v26 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
      uint64_t v20 = objc_msgSend(v49, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, v50, v26, 0, 0, 0x80000001B4147C30);
    }
    else
    {
      id v60 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      unint64_t v26 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
      uint64_t v20 = objc_msgSend(v60, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v26, 0, 0);
    }
    goto LABEL_41;
  }
  v67 = v14;
  id v17 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
  swift_bridgeObjectRetain();
  id v18 = (void *)sub_1B411E898();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v17, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v18, 0, 0);

  uint64_t v20 = v19;
  id v21 = objc_msgSend(v5, sel_traitCollection);
  id v22 = objc_msgSend(v21, sel_userInterfaceIdiom);

  if (v22 != (id)1)
  {
    id v23 = objc_msgSend(v5, sel_traitCollection);
    id v24 = objc_msgSend(v23, sel_userInterfaceIdiom);

    if (v24 != (id)5)
    {
      id v51 = [v20 sheetPresentationController];

      if (!v51)
      {
        if (a5 != 2)
        {
LABEL_42:
          if (a5 != 1)
          {
            if (!a5)
            {
              id v53 = objc_msgSend(v16, sel_navigationController);
              if (v53)
              {
                id v54 = v53;
                objc_msgSend(v53, sel_pushViewController_animated_, v20, 1);
              }
              goto LABEL_52;
            }
            os_log_type_t v55 = sub_1B411EA18();
            os_log_t v56 = *v62;
            os_log_type_t v57 = v55;
            if (os_log_type_enabled(*v62, v55))
            {
              id v58 = v56;
              id v59 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)id v59 = 134217984;
              uint64_t v68 = a5;
              sub_1B411EAF8();
              _os_log_impl(&dword_1B3F4C000, v58, v57, "EKEventGenericDetailViewControllerOOPImpl: presentationStyle not recognized: %ld", v59, 0xCu);
              MEMORY[0x1BA986180](v59, -1, -1);

              goto LABEL_53;
            }
LABEL_52:

            goto LABEL_53;
          }
LABEL_51:
          objc_msgSend(v16, sel_presentViewController_animated_completion_, v20, 1, 0);
          goto LABEL_52;
        }
LABEL_50:
        [v20 setModalPresentationStyle:2];
        goto LABEL_51;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC420);
      uint64_t v52 = swift_allocObject();
      *(_OWORD *)(v52 + 16) = xmmword_1B413B4C0;
      *(void *)(v52 + 32) = objc_msgSend(self, sel_largeDetent);
      uint64_t v68 = v52;
      sub_1B411E938();
      sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFCD70);
      unint64_t v26 = (void *)sub_1B411E908();
      swift_bridgeObjectRelease();
      objc_msgSend(v51, sel_setDetents_, v26);

LABEL_41:
      if (a5 != 2) {
        goto LABEL_42;
      }
      goto LABEL_50;
    }
  }
  [v20 setModalPresentationStyle:7];
  id v25 = objc_msgSend(v5, sel_parentViewController);
  if (!v25)
  {
LABEL_40:
    unint64_t v26 = v20;
    goto LABEL_41;
  }
  unint64_t v26 = v25;
  self;
  id v27 = (void *)swift_dynamicCastObjCClass();
  if (!v27)
  {

    goto LABEL_40;
  }
  id v28 = v27;
  id v65 = v16;
  id v29 = objc_msgSend(v27, sel_rightBarButtonActions);
  uint64_t v30 = sub_1B411E918();

  uint64_t v31 = *(void *)(v30 + 16);
  swift_bridgeObjectRelease();
  if (!v31)
  {

    uint64_t v14 = v67;
    goto LABEL_41;
  }
  id v61 = v26;
  os_log_t log = (os_log_t)a5;
  uint64_t v32 = 0;
  unint64_t v33 = 0;
  while (1)
  {
    id v34 = objc_msgSend(v28, sel_rightBarButtonActions);
    uint64_t v35 = sub_1B411E918();

    if (v33 >= *(void *)(v35 + 16)) {
      break;
    }
    uint64_t v37 = *(void *)(v35 + v32 + 32);
    uint64_t v36 = *(void *)(v35 + v32 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v38 = objc_msgSend(v28, sel_rightBarButtonItems);
    sub_1B40E1BC8(0, &qword_1E9CFC6C0);
    uint64_t v39 = sub_1B411E918();

    if ((v39 & 0xC000000000000001) != 0)
    {
      id v40 = (id)MEMORY[0x1BA984810](v33, v39);
    }
    else
    {
      if (v33 >= *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_56;
      }
      id v40 = *(id *)(v39 + 8 * v33 + 32);
    }
    id v41 = v40;
    swift_bridgeObjectRelease();
    id v42 = sub_1B411BAEC();
    if (v37 == *v42 && v36 == v42[1])
    {
      swift_bridgeObjectRelease();
LABEL_26:
      id v45 = [v20 popoverPresentationController];
      if (v45)
      {
        id v46 = v45;
        objc_msgSend(v45, sel_setSourceItem_, v41);
      }
      goto LABEL_14;
    }
    char v44 = sub_1B411ED48();
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_26;
    }
LABEL_14:
    ++v33;

    v32 += 16;
    if (v31 == v33)
    {

      a5 = (uint64_t)log;
      uint64_t v16 = v65;
      uint64_t v14 = v67;
      unint64_t v26 = v61;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
}

void sub_1B40EE91C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  os_log_type_t v7 = sub_1B411EA28();
  os_log_type_t v8 = (os_log_t *)sub_1B40EC57C();
  os_log_t v9 = *v8;
  if (os_log_type_enabled(*v8, v7))
  {
    swift_bridgeObjectRetain_n();
    os_log_t log = v9;
    uint64_t v26 = a3;
    os_log_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v27 = v11;
    *(_DWORD *)os_log_t v10 = 136315138;
    if (a2)
    {
      unint64_t v12 = a2;
    }
    else
    {
      a1 = 7104878;
      unint64_t v12 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1B40DFA70(a1, v12, &v27);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B3F4C000, log, v7, "EKEventGenericDetailViewControllerOOPImpl: Received remoteViewControllerRequestDismissView on the host app side. viewName: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v11, -1, -1);
    id v13 = v10;
    a3 = v26;
    MEMORY[0x1BA986180](v13, -1, -1);
  }
  uint64_t v14 = objc_msgSend(v3, sel_parentViewController, log);
  if (!v14) {
    goto LABEL_11;
  }
  os_log_t v15 = v14;
  self;
  uint64_t v16 = (void *)swift_dynamicCastObjCClass();
  if (!v16)
  {

LABEL_11:
    sub_1B411EA18();
    os_log_t v15 = *v8;
    sub_1B411E578();
    goto LABEL_12;
  }
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      os_log_type_t v20 = sub_1B411EA18();
      id v21 = *v8;
      os_log_type_t v22 = v20;
      if (os_log_type_enabled(v21, v20))
      {
        id v23 = v21;
        id v24 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)id v24 = 134217984;
        uint64_t v27 = a3;
        sub_1B411EAF8();
        _os_log_impl(&dword_1B3F4C000, v23, v22, "EKEventGenericDetailViewControllerOOPImpl: presentationStyle not recognized: %ld", v24, 0xCu);
        MEMORY[0x1BA986180](v24, -1, -1);

        os_log_t v15 = v23;
      }
    }
    else
    {
      id v17 = objc_msgSend(v16, sel_navigationController);
      if (v17)
      {
        id v18 = v17;
        id v19 = objc_msgSend(v17, sel_popViewControllerAnimated_, 1);
      }
    }
  }
  else
  {
    objc_msgSend(v16, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
LABEL_12:
}

void sub_1B40EEC48(uint64_t a1, uint64_t a2)
{
  sub_1B411EA28();
  uint64_t v5 = sub_1B40EC57C();
  id v6 = (id)*v5;
  sub_1B411E578();

  id v7 = objc_msgSend(v2, sel_parentViewController);
  if (v7)
  {
    os_log_type_t v8 = v7;
    self;
    uint64_t v9 = swift_dynamicCastObjCClass();
    if (v9)
    {
      os_log_t v10 = (void *)v9;
      if (a1)
      {
        os_log_type_t v11 = sub_1B411EA28();
        id v12 = (id)*v5;
        os_log_type_t v13 = v11;
        if (os_log_type_enabled((os_log_t)*v5, v11))
        {
          swift_bridgeObjectRetain_n();
          loga = v12;
          uint64_t v14 = (uint8_t *)swift_slowAlloc();
          uint64_t v30 = swift_slowAlloc();
          uint64_t v34 = v30;
          *(_DWORD *)uint64_t v14 = 136315138;
          uint64_t v15 = swift_bridgeObjectRetain();
          uint64_t v16 = MEMORY[0x1BA9844E0](v15, MEMORY[0x1E4FBB1A0]);
          unint64_t v18 = v17;
          swift_bridgeObjectRelease();
          sub_1B40DFA70(v16, v18, &v34);
          sub_1B411EAF8();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1B3F4C000, loga, v13, "Setting leftBarButtonIDs: %s", v14, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1BA986180](v30, -1, -1);
          MEMORY[0x1BA986180](v14, -1, -1);
        }
        id v19 = (void *)sub_1B411E908();
        objc_msgSend(v10, sel_setLeftBarButtonActions_, v19);
      }
      if (a2)
      {
        os_log_type_t v20 = sub_1B411EA28();
        id v21 = *v5;
        os_log_type_t v22 = v20;
        if (os_log_type_enabled(v21, v20))
        {
          swift_bridgeObjectRetain_n();
          logb = v21;
          id v23 = (uint8_t *)swift_slowAlloc();
          uint64_t v24 = swift_slowAlloc();
          uint64_t v34 = v24;
          *(_DWORD *)id v23 = 136315138;
          uint64_t v25 = swift_bridgeObjectRetain();
          uint64_t v26 = MEMORY[0x1BA9844E0](v25, MEMORY[0x1E4FBB1A0]);
          unint64_t v28 = v27;
          swift_bridgeObjectRelease();
          sub_1B40DFA70(v26, v28, &v34);
          sub_1B411EAF8();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1B3F4C000, logb, v22, "Setting rightBarButtonIDs: %s", v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1BA986180](v24, -1, -1);
          MEMORY[0x1BA986180](v23, -1, -1);
        }
        id v29 = (void *)sub_1B411E908();
        objc_msgSend(v10, sel_setRightBarButtonActions_, v29);
      }
      return;
    }
  }
  sub_1B411EA18();
  os_log_t log = (os_log_t)(id)*v5;
  sub_1B411E578();
}

void sub_1B40EF06C(uint64_t a1)
{
  sub_1B411EA28();
  uint64_t v3 = sub_1B40EC57C();
  id v4 = (id)*v3;
  sub_1B411E578();

  id v5 = objc_msgSend(v1, sel_parentViewController);
  if (!v5) {
    goto LABEL_8;
  }
  id v20 = v5;
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (!v6)
  {

LABEL_8:
    sub_1B411EA18();
    id v20 = (id)*v3;
    sub_1B411E578();
    goto LABEL_9;
  }
  if (a1)
  {
    id v7 = (void *)v6;
    os_log_type_t v8 = sub_1B411EA28();
    uint64_t v9 = *v3;
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      swift_bridgeObjectRetain_n();
      os_log_type_t v11 = v9;
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v21 = v13;
      *(_DWORD *)id v12 = 136315138;
      uint64_t v14 = sub_1B40E1BC8(0, &qword_1E9CFC350);
      uint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v16 = MEMORY[0x1BA9844E0](v15, v14);
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      sub_1B40DFA70(v16, v18, &v21);
      sub_1B411EAF8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3F4C000, v11, v10, "Setting leftBarButtonIDs: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA986180](v13, -1, -1);
      MEMORY[0x1BA986180](v12, -1, -1);
    }
    sub_1B40E1BC8(0, &qword_1E9CFC350);
    id v19 = (void *)sub_1B411E908();
    objc_msgSend(v7, sel_setBottomStatusButtonActions_, v19);

    return;
  }
LABEL_9:
}

id EKEventGenericDetailViewControllerOOPImpl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1B40EF418(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor);
  swift_beginAccess();
  id v4 = *v3;
  uint64_t *v3 = a1;
  id v5 = a1;

  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  id v7 = *(void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  if (v7)
  {
    os_log_type_t v10 = *(void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
    uint64_t v11 = v6[2];
    uint64_t v12 = v6[4];
    uint64_t v13 = v6[6];
    uint64_t v14 = v6[8];
    uint64_t v15 = (void *)v6[10];
    os_log_type_t v8 = *v3;
    sub_1B40ED4F4(*v6, v7, v11, v6[3], v12, v6[5], v13, v6[7], v14, v6[9], v15);
    id v9 = v8;
    sub_1B40DBAE8(v8);

    sub_1B40DA270(v11);
    sub_1B40DA270(v12);
    sub_1B40DA270(v13);
    sub_1B40DA270(v14);
  }
}

uint64_t method lookup function for EKEventGenericDetailViewControllerOOPImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKEventGenericDetailViewControllerOOPImpl);
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.__allocating_init(hostViewID:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.oopContentBackgroundColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.oopContentBackgroundColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.oopContentBackgroundColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.leftBarButtonTapped(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.rightBarButtonTapped(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.bottomStatusButtonTapped(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t static EKRemoteUIUtilities.combineHostWithRemoteObjectIDChangeMaps(hostTempToRemoteTempObjectIDMap:remoteEventStoreTempToPermanentObjectIDMap:)(unint64_t a1, unint64_t a2)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    unint64_t v107 = 0;
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    unint64_t v4 = sub_1B411EC78() | 0x8000000000000000;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v2 = ~v5;
    unint64_t v107 = a1 + 64;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v3 = v7 & *(void *)(a1 + 64);
    unint64_t v4 = a1;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  int64_t v106 = (unint64_t)(v2 + 64) >> 6;
  unint64_t v109 = a2 & 0xC000000000000001;
  uint64_t v9 = MEMORY[0x1E4FBC868];
  unint64_t v110 = v4;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_1B411ECA8()) {
      goto LABEL_72;
    }
    sub_1B40F0A3C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v13 = v114;
    swift_unknownObjectRelease();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v14 = v114;
    swift_unknownObjectRelease();
    uint64_t v12 = v8;
    uint64_t v112 = v3;
    if (!v114) {
      goto LABEL_72;
    }
LABEL_31:
    if (v109)
    {
      id v20 = v14;
      if (!sub_1B411EC98()) {
        goto LABEL_43;
      }
      sub_1B40F0A3C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v21 = v114;
      swift_unknownObjectRelease();

      if (v114) {
        goto LABEL_38;
      }
    }
    else if (*(void *)(a2 + 16))
    {
      unint64_t v22 = sub_1B40F024C((uint64_t)v14);
      if ((v23 & 1) == 0)
      {
LABEL_43:

        goto LABEL_44;
      }
      id v21 = *(id *)(*(void *)(a2 + 56) + 8 * v22);

      if (v21)
      {
LABEL_38:
        if ((v9 & 0xC000000000000001) != 0)
        {
          if (v9 >= 0) {
            v9 &= 0xFFFFFFFFFFFFFF8uLL;
          }
          id v24 = v13;
          id v25 = v21;
          uint64_t v26 = sub_1B411EBA8();
          if (__OFADD__(v26, 1)) {
            goto LABEL_126;
          }
          uint64_t v9 = sub_1B40F0290(v9, v26 + 1);
        }
        else
        {
          id v54 = v13;
          id v55 = v21;
        }
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        long long v114 = (void *)v9;
        unint64_t v58 = sub_1B40F024C((uint64_t)v13);
        uint64_t v59 = *(void *)(v9 + 16);
        BOOL v60 = (v57 & 1) == 0;
        uint64_t v61 = v59 + v60;
        if (__OFADD__(v59, v60)) {
          goto LABEL_123;
        }
        char v62 = v57;
        if (*(void *)(v9 + 24) >= v61)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_1B40F0894();
          }
        }
        else
        {
          sub_1B40F04B4(v61, isUniquelyReferenced_nonNull_native);
          unint64_t v63 = sub_1B40F024C((uint64_t)v13);
          if ((v62 & 1) != (v64 & 1)) {
            goto LABEL_131;
          }
          unint64_t v58 = v63;
        }
        if (v62)
        {
          uint64_t v65 = *(void *)(v9 + 56);

          *(void *)(v65 + 8 * v5_Block_object_dispose(&STACK[0x2D0], 8) = v21;
        }
        else
        {
          *(void *)(v9 + 8 * (v58 >> 6) + 64) |= 1 << v58;
          *(void *)(*(void *)(v9 + 48) + 8 * v5_Block_object_dispose(&STACK[0x2D0], 8) = v13;
          *(void *)(*(void *)(v9 + 56) + 8 * v5_Block_object_dispose(&STACK[0x2D0], 8) = v21;
          uint64_t v66 = *(void *)(v9 + 16);
          BOOL v51 = __OFADD__(v66, 1);
          uint64_t v67 = v66 + 1;
          if (v51) {
            goto LABEL_127;
          }
          *(void *)(v9 + 16) = v67;
          id v68 = v13;
        }
        goto LABEL_9;
      }
    }
LABEL_44:
    os_log_type_t v27 = sub_1B411EA18();
    unint64_t v28 = *sub_1B40EC57C();
    if (os_log_type_enabled(v28, v27))
    {
      id v29 = v14;
      id v30 = v13;
      id v31 = v29;
      id v32 = v30;
      unint64_t v33 = v28;
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 138412546;
      *(void *)(v34 + 4) = v32;
      *uint64_t v35 = v13;

      *(_WORD *)(v34 + 12) = 2112;
      *(void *)(v34 + 14) = v31;
      v35[1] = v14;

      _os_log_impl(&dword_1B3F4C000, v33, v27, "EKRemoteUIUtilities Error while combining Host with Remote ObjectID change maps. Could not find permanent objectID for temporaryID [hostTempID: %@, remoteTempID: %@]", (uint8_t *)v34, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
      swift_arrayDestroy();
      MEMORY[0x1BA986180](v35, -1, -1);
      MEMORY[0x1BA986180](v34, -1, -1);
    }
    if ((v9 & 0xC000000000000001) != 0)
    {
      if (v9 >= 0) {
        v9 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      id v36 = v14;
      id v37 = v13;
      uint64_t v38 = sub_1B411EBA8();
      if (__OFADD__(v38, 1)) {
        goto LABEL_121;
      }
      uint64_t v9 = sub_1B40F0290(v9, v38 + 1);
    }
    else
    {
      id v39 = v14;
      id v40 = v13;
    }
    char v41 = swift_isUniquelyReferenced_nonNull_native();
    long long v114 = (void *)v9;
    unint64_t v43 = sub_1B40F024C((uint64_t)v13);
    uint64_t v44 = *(void *)(v9 + 16);
    BOOL v45 = (v42 & 1) == 0;
    uint64_t v46 = v44 + v45;
    if (__OFADD__(v44, v45))
    {
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      sub_1B40F0A3C();
      uint64_t result = sub_1B411ED68();
      __break(1u);
      return result;
    }
    char v47 = v42;
    if (*(void *)(v9 + 24) >= v46)
    {
      if ((v41 & 1) == 0) {
        sub_1B40F0894();
      }
    }
    else
    {
      sub_1B40F04B4(v46, v41);
      unint64_t v48 = sub_1B40F024C((uint64_t)v13);
      if ((v47 & 1) != (v49 & 1)) {
        goto LABEL_131;
      }
      unint64_t v43 = v48;
    }
    if (v47)
    {
      uint64_t v10 = *(void *)(v9 + 56);

      *(void *)(v10 + 8 * v43) = v14;
    }
    else
    {
      *(void *)(v9 + 8 * (v43 >> 6) + 64) |= 1 << v43;
      *(void *)(*(void *)(v9 + 48) + 8 * v43) = v13;
      *(void *)(*(void *)(v9 + 56) + 8 * v43) = v14;
      uint64_t v50 = *(void *)(v9 + 16);
      BOOL v51 = __OFADD__(v50, 1);
      uint64_t v52 = v50 + 1;
      if (v51) {
        goto LABEL_122;
      }
      *(void *)(v9 + 16) = v52;
      id v53 = v13;
    }
LABEL_9:

    swift_bridgeObjectRelease();
    uint64_t v8 = v12;
    unint64_t v4 = v110;
    unint64_t v3 = v112;
  }
  if (v3)
  {
    uint64_t v112 = (v3 - 1) & v3;
    unint64_t v11 = __clz(__rbit64(v3)) | (v8 << 6);
    uint64_t v12 = v8;
    goto LABEL_30;
  }
  int64_t v15 = v8 + 1;
  if (__OFADD__(v8, 1)) {
    goto LABEL_124;
  }
  if (v15 < v106)
  {
    unint64_t v16 = *(void *)(v107 + 8 * v15);
    uint64_t v12 = v8 + 1;
    if (!v16)
    {
      uint64_t v12 = v8 + 2;
      if (v8 + 2 >= v106) {
        goto LABEL_72;
      }
      unint64_t v16 = *(void *)(v107 + 8 * v12);
      if (!v16)
      {
        uint64_t v12 = v8 + 3;
        if (v8 + 3 >= v106) {
          goto LABEL_72;
        }
        unint64_t v16 = *(void *)(v107 + 8 * v12);
        if (!v16)
        {
          uint64_t v12 = v8 + 4;
          if (v8 + 4 >= v106) {
            goto LABEL_72;
          }
          unint64_t v16 = *(void *)(v107 + 8 * v12);
          if (!v16)
          {
            uint64_t v17 = v8 + 5;
            do
            {
              if (v106 == v17) {
                goto LABEL_72;
              }
              unint64_t v16 = *(void *)(v107 + 8 * v17++);
            }
            while (!v16);
            uint64_t v12 = v17 - 1;
            unint64_t v4 = v110;
          }
        }
      }
    }
    uint64_t v112 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v12 << 6);
LABEL_30:
    uint64_t v18 = 8 * v11;
    id v19 = *(void **)(*(void *)(v4 + 56) + v18);
    id v13 = *(id *)(*(void *)(v4 + 48) + v18);
    id v14 = v19;
    if (!v13) {
      goto LABEL_72;
    }
    goto LABEL_31;
  }
LABEL_72:
  sub_1B40EA518();
  if (v109)
  {
    unint64_t v113 = 0;
    uint64_t v69 = 0;
    unint64_t v70 = 0;
    unint64_t v71 = sub_1B411EC78() | 0x8000000000000000;
  }
  else
  {
    uint64_t v72 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v69 = ~v72;
    unint64_t v113 = a2 + 64;
    uint64_t v73 = -v72;
    if (v73 < 64) {
      uint64_t v74 = ~(-1 << v73);
    }
    else {
      uint64_t v74 = -1;
    }
    unint64_t v70 = v74 & *(void *)(a2 + 64);
    unint64_t v71 = a2;
  }
  swift_bridgeObjectRetain();
  uint64_t v75 = 0;
  int64_t v111 = (unint64_t)(v69 + 64) >> 6;
  id v76 = &selRef_genericViewBottomStatusButtonTapped_;
  while (1)
  {
    uint64_t v77 = v75;
    if ((v71 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_1B411ECA8()) {
      goto LABEL_119;
    }
    sub_1B40F0A3C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v80 = v114;
    swift_unknownObjectRelease();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v81 = v114;
    swift_unknownObjectRelease();
    id v76 = &selRef_genericViewBottomStatusButtonTapped_;
    if (!v114) {
      goto LABEL_119;
    }
LABEL_100:
    if ([v80 v76[24]])
    {
    }
    else
    {
      if ((v9 & 0xC000000000000001) != 0)
      {
        if (v9 >= 0) {
          v9 &= 0xFFFFFFFFFFFFFF8uLL;
        }
        id v87 = v80;
        id v88 = v81;
        uint64_t v89 = sub_1B411EBA8();
        if (__OFADD__(v89, 1)) {
          goto LABEL_129;
        }
        uint64_t v9 = sub_1B40F0290(v9, v89 + 1);
      }
      else
      {
        id v90 = v80;
        id v91 = v81;
      }
      char v92 = swift_isUniquelyReferenced_nonNull_native();
      long long v114 = (void *)v9;
      unint64_t v94 = sub_1B40F024C((uint64_t)v80);
      uint64_t v95 = *(void *)(v9 + 16);
      BOOL v96 = (v93 & 1) == 0;
      uint64_t v97 = v95 + v96;
      if (__OFADD__(v95, v96)) {
        goto LABEL_128;
      }
      char v98 = v93;
      if (*(void *)(v9 + 24) >= v97)
      {
        if ((v92 & 1) == 0) {
          sub_1B40F0894();
        }
      }
      else
      {
        sub_1B40F04B4(v97, v92);
        unint64_t v99 = sub_1B40F024C((uint64_t)v80);
        if ((v98 & 1) != (v100 & 1)) {
          goto LABEL_131;
        }
        unint64_t v94 = v99;
      }
      if (v98)
      {
        uint64_t v101 = *(void *)(v9 + 56);

        *(void *)(v101 + 8 * v94) = v81;
      }
      else
      {
        *(void *)(v9 + 8 * (v94 >> 6) + 64) |= 1 << v94;
        *(void *)(*(void *)(v9 + 48) + 8 * v94) = v80;
        *(void *)(*(void *)(v9 + 56) + 8 * v94) = v81;
        uint64_t v102 = *(void *)(v9 + 16);
        BOOL v51 = __OFADD__(v102, 1);
        uint64_t v103 = v102 + 1;
        if (v51) {
          goto LABEL_130;
        }
        *(void *)(v9 + 16) = v103;
        id v104 = v80;
      }

      swift_bridgeObjectRelease();
      id v76 = &selRef_genericViewBottomStatusButtonTapped_;
    }
  }
  if (v70)
  {
    unint64_t v78 = __clz(__rbit64(v70));
    v70 &= v70 - 1;
    unint64_t v79 = v78 | (v75 << 6);
    goto LABEL_99;
  }
  int64_t v82 = v75 + 1;
  if (__OFADD__(v75, 1)) {
    goto LABEL_125;
  }
  if (v82 >= v111) {
    goto LABEL_119;
  }
  unint64_t v83 = *(void *)(v113 + 8 * v82);
  ++v75;
  if (v83) {
    goto LABEL_98;
  }
  uint64_t v75 = v77 + 2;
  if (v77 + 2 >= v111) {
    goto LABEL_119;
  }
  unint64_t v83 = *(void *)(v113 + 8 * v75);
  if (v83) {
    goto LABEL_98;
  }
  uint64_t v75 = v77 + 3;
  if (v77 + 3 >= v111) {
    goto LABEL_119;
  }
  unint64_t v83 = *(void *)(v113 + 8 * v75);
  if (v83) {
    goto LABEL_98;
  }
  uint64_t v75 = v77 + 4;
  if (v77 + 4 >= v111) {
    goto LABEL_119;
  }
  unint64_t v83 = *(void *)(v113 + 8 * v75);
  if (v83)
  {
LABEL_98:
    unint64_t v70 = (v83 - 1) & v83;
    unint64_t v79 = __clz(__rbit64(v83)) + (v75 << 6);
LABEL_99:
    uint64_t v85 = 8 * v79;
    uint64_t v86 = *(void **)(*(void *)(v71 + 56) + v85);
    id v80 = *(id *)(*(void *)(v71 + 48) + v85);
    id v81 = v86;
    if (!v80) {
      goto LABEL_119;
    }
    goto LABEL_100;
  }
  uint64_t v84 = v77 + 5;
  while (v111 != v84)
  {
    unint64_t v83 = *(void *)(v113 + 8 * v84++);
    if (v83)
    {
      uint64_t v75 = v84 - 1;
      goto LABEL_98;
    }
  }
LABEL_119:
  sub_1B40EA518();
  return v9;
}

id EKRemoteUIUtilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id EKRemoteUIUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EKRemoteUIUtilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B40F024C(uint64_t a1)
{
  uint64_t v2 = sub_1B411EAB8();

  return sub_1B40F0788(a1, v2);
}

uint64_t sub_1B40F0290(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6C8);
    uint64_t v2 = sub_1B411ED08();
    uint64_t v18 = v2;
    sub_1B411EC78();
    uint64_t v3 = sub_1B411ECA8();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_1B40F0A3C();
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_1B40F04B4(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_1B411EAB8();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_1B411ECA8();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  return v2;
}

uint64_t sub_1B40F04B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6C8);
  uint64_t v6 = sub_1B411ECF8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    char v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    id v31 = *(void **)(*(void *)(v5 + 48) + v30);
    id v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_1B411EAB8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  char v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_1B40F0788(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_1B40F0A3C();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1B411EAC8();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1B411EAC8();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

id sub_1B40F0894()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B411ECE8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    unint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_1B40F0A3C()
{
  unint64_t result = qword_1E9CFC760;
  if (!qword_1E9CFC760)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9CFC760);
  }
  return result;
}

uint64_t type metadata accessor for EKRemoteUIUtilities()
{
  return self;
}

id sub_1B40F0AA0()
{
  return *(id *)(v0 + 8);
}

double sub_1B40F0AA8@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for EKEventOOPHostViewModel();
  sub_1B40F245C(&qword_1E9CFC6D0, (void (*)(uint64_t))type metadata accessor for EKEventOOPHostViewModel);
  *(void *)a1 = sub_1B411E628();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v2;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_WORD *)(a1 + 80) = 0;
  return result;
}

NSBundle *sub_1B40F0B38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6D8);
  MEMORY[0x1F4188790](v82);
  uint64_t v5 = (uint64_t *)&v73[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v79 = sub_1B411E618();
  MEMORY[0x1F4188790](v79);
  id v81 = &v73[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v86 = sub_1B411E9B8();
  uint64_t v80 = *(void *)(v86 - 8);
  MEMORY[0x1F4188790](v86);
  uint64_t v85 = &v73[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6E0);
  uint64_t v8 = MEMORY[0x1F4188790](v87);
  uint64_t v10 = &v73[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  unint64_t v12 = &v73[-v11];
  v88[0] = *v1;
  int64_t v13 = (void *)MEMORY[0x1E4FBC8C8];
  unint64_t v14 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **((void **)&v88[0] + 1)) + 0xD0);
  unint64_t v15 = *((id *)&v88[0] + 1);
  uint64_t v16 = (void *)v14();
  sub_1B40DA960((uint64_t)v88);

  unint64_t v83 = v5;
  uint64_t v84 = a1;
  if (v16)
  {
    unint64_t v17 = *(void (**)(void))((*v13 & *v15) + 0xA0);
    unint64_t v18 = v15;
    v17();
    sub_1B40DA960((uint64_t)v88);
    type metadata accessor for _AppExtensionEventHostView.Configuration(0);
    sub_1B40F245C(&qword_1E9CFC720, (void (*)(uint64_t))type metadata accessor for _AppExtensionEventHostView.Configuration);
    uint64_t v19 = sub_1B411E628();
    uint64_t v75 = v20;
    uint64_t v21 = swift_allocObject();
    long long v22 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v21 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v21 + 64) = v22;
    *(_OWORD *)(v21 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v21 + 96) = *(_WORD *)(v2 + 80);
    long long v23 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v21 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v21 + 32) = v23;
    uint64_t v24 = swift_allocObject();
    long long v25 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v24 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v24 + 64) = v25;
    *(_OWORD *)(v24 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v24 + 96) = *(_WORD *)(v2 + 80);
    long long v26 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v24 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v24 + 32) = v26;
    uint64_t v27 = swift_allocObject();
    long long v28 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v27 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v27 + 64) = v28;
    *(_OWORD *)(v27 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v27 + 96) = *(_WORD *)(v2 + 80);
    long long v29 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v27 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v27 + 32) = v29;
    uint64_t v76 = v27;
    sub_1B40F4F38(v2);
    sub_1B40F4F38(v2);
    sub_1B40F4F38(v2);
    LOBYTE(v17) = sub_1B411E718();
    char v30 = sub_1B411E728();
    char v31 = sub_1B411E748();
    int v32 = sub_1B411E738();
    sub_1B411E738();
    if (sub_1B411E738() != v17) {
      int v32 = sub_1B411E738();
    }
    sub_1B411E738();
    char v33 = sub_1B411E738();
    int v34 = v32;
    uint64_t v77 = v21;
    uint64_t v35 = v24;
    if (v33 != v30) {
      int v34 = sub_1B411E738();
    }
    uint64_t v36 = v79;
    uint64_t v37 = (uint64_t)v10;
    sub_1B411E738();
    char v38 = sub_1B411E738();
    unint64_t v78 = v12;
    uint64_t v39 = v75;
    if (v38 == v31) {
      int v74 = v34;
    }
    else {
      int v74 = sub_1B411E738();
    }
    uint64_t v79 = sub_1B411E638();
    uint64_t v63 = swift_allocObject();
    long long v64 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v63 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v63 + 64) = v64;
    *(_OWORD *)(v63 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v63 + 96) = *(_WORD *)(v2 + 80);
    long long v65 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v63 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v63 + 32) = v65;
    sub_1B40F4F38(v2);
    uint64_t v66 = v85;
    sub_1B411E9A8();
    uint64_t v67 = *(int *)(v36 + 20);
    uint64_t v68 = v80;
    uint64_t v69 = v81;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v80 + 16))(&v81[v67], v66, v86);
    *uint64_t v69 = &unk_1E9CFC730;
    v69[1] = v63;
    sub_1B40DC65C((uint64_t)v69, v37 + *(int *)(v87 + 36));
    *(void *)uint64_t v37 = v19;
    *(void *)(v37 + _Block_object_dispose(&STACK[0x2D0], 8) = v39;
    uint64_t v70 = v76;
    uint64_t v71 = v77;
    *(void *)(v37 + 16) = sub_1B40F4EC8;
    *(void *)(v37 + 24) = v70;
    *(void *)(v37 + 32) = sub_1B40F4D68;
    *(void *)(v37 + 40) = v71;
    *(void *)(v37 + 4_Block_object_dispose(&STACK[0x2D0], 8) = sub_1B40F4E38;
    *(void *)(v37 + 56) = v35;
    *(void *)(v37 + 64) = v79;
    *(unsigned char *)(v37 + 72) = v74;
    swift_retain();
    sub_1B40DA260((uint64_t)sub_1B40F4EC8);
    sub_1B40DA260((uint64_t)sub_1B40F4D68);
    sub_1B40DA260((uint64_t)sub_1B40F4E38);
    sub_1B40DC6C0((uint64_t)v69);
    (*(void (**)(unsigned char *, uint64_t))(v68 + 8))(v85, v86);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v72 = (uint64_t)v78;
    sub_1B40F50AC(v37, (uint64_t)v78);
    sub_1B40F5170(v72, (uint64_t)v83, &qword_1E9CFC6E0);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6E8);
    sub_1B40F22E0();
    sub_1B40E1AE8(&qword_1E9CFC718, &qword_1E9CFC6E8);
    sub_1B411E668();
    return (NSBundle *)sub_1B40E1C58(v72, &qword_1E9CFC6E0);
  }
  else
  {
    uint64_t v40 = sub_1B411E648();
    double result = EventKitUIBundle();
    if (result)
    {
      char v42 = result;
      uint64_t v43 = sub_1B411E448();
      uint64_t v45 = v44;

      uint64_t v89 = v43;
      uint64_t v90 = v45;
      sub_1B40FBF2C();
      uint64_t v46 = sub_1B411E778();
      uint64_t v48 = v47;
      char v50 = v49 & 1;
      uint64_t v89 = sub_1B411E7C8();
      uint64_t v51 = sub_1B411E758();
      uint64_t v53 = v52;
      char v55 = v54 & 1;
      sub_1B40FBF80(v46, v48, v50);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v56 = sub_1B411E768();
      uint64_t v58 = v57;
      LOBYTE(v45) = v59;
      uint64_t v61 = v60;
      sub_1B40FBF80(v51, v53, v55);
      swift_bridgeObjectRelease();
      char v62 = v83;
      *unint64_t v83 = v40;
      v62[1] = 0;
      *((unsigned char *)v62 + 16) = 1;
      v62[3] = v56;
      v62[4] = v58;
      *((unsigned char *)v62 + 40) = v45 & 1;
      v62[6] = v61;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6E8);
      sub_1B40F22E0();
      sub_1B40E1AE8(&qword_1E9CFC718, &qword_1E9CFC6E8);
      return (NSBundle *)sub_1B411E668();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1B40F1380(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_1B411E4F8();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_1B411E518();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_1B411E538();
  v1[12] = v4;
  v1[13] = *(void *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1B411E998();
  v1[16] = sub_1B411E988();
  uint64_t v6 = sub_1B411E968();
  v1[17] = v6;
  v1[18] = v5;
  return MEMORY[0x1F4188298](sub_1B40F1530, v6, v5);
}

uint64_t sub_1B40F1530()
{
  sub_1B411B9E4();
  swift_bridgeObjectRetain();
  sub_1B411E4E8();
  sub_1B411E528();
  sub_1B411E508();
  v0[19] = sub_1B411E988();
  uint64_t v1 = sub_1B40F245C((unint64_t *)&unk_1E9CFC370, MEMORY[0x1E4F25828]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1B40F1678;
  uint64_t v3 = v0[6];
  return MEMORY[0x1F4187C78](v0 + 2, v3, v1);
}

uint64_t sub_1B40F1678()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 16_Block_object_dispose(&STACK[0x2D0], 8) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  if (v0)
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B40F1AB0;
  }
  else
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B40F1810;
  }
  return MEMORY[0x1F4188298](v7, v4, v6);
}

uint64_t sub_1B40F1810()
{
  swift_release();
  v0[22] = v0[2];
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40F187C, v1, v2);
}

uint64_t sub_1B40F187C()
{
  if (v0[22])
  {
    return MEMORY[0x1F4188298](sub_1B40F19A8, 0, 0);
  }
  else
  {
    uint64_t v2 = v0[7];
    uint64_t v1 = v0[8];
    uint64_t v3 = v0[6];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    uint64_t v5 = v0[13];
    uint64_t v4 = v0[14];
    uint64_t v6 = v0[12];
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_1B40F19A8()
{
  *(void *)(v0 + 184) = sub_1B411E988();
  uint64_t v2 = sub_1B411E968();
  return MEMORY[0x1F4188298](sub_1B40F1A34, v2, v1);
}

uint64_t sub_1B40F1A34()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = (long long *)v0[5];
  swift_release();
  sub_1B40F1D5C(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40DB0BC, v3, v4);
}

uint64_t sub_1B40F1AB0()
{
  v0[3] = v0[21];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFCC80);
  swift_willThrowTypedImpl();
  swift_release();
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40F1B44, v1, v2);
}

uint64_t sub_1B40F1B44()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1B411EA18();
  uint64_t v4 = *sub_1B40EC57C();
  os_log_type_t v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    uint64_t v6 = (void *)v0[21];
    id v7 = v6;
    id v8 = v6;
    uint64_t v9 = v4;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v6;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v13;
    sub_1B411EAF8();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_1B3F4C000, v9, v5, "EKEventOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v11, -1, -1);
    MEMORY[0x1BA986180](v10, -1, -1);
  }
  else
  {
    uint64_t v6 = (void *)v0[21];
  }

  uint64_t v15 = v0[13];
  uint64_t v14 = v0[14];
  uint64_t v16 = v0[12];
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void sub_1B40F1D5C(uint64_t a1, long long *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1B411E568();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = &v38[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v14 = &v38[-v13];
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = &v38[-v15];
  if (!*(void *)(a1 + 16))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  unint64_t v17 = *(void (**)(unsigned char *, unint64_t, uint64_t))(v8 + 16);
  v17(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_1B40E1C58((uint64_t)v6, &qword_1E9CFC168);
    sub_1B411EA18();
    id v30 = (id)*sub_1B40EC57C();
    sub_1B411E578();

    return;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v16, v6, v7);
  long long v46 = *a2;
  unint64_t v18 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **((void **)&v46 + 1)) + 0x90);
  uint64_t v43 = *((void *)&v46 + 1);
  char v42 = *((id *)&v46 + 1);
  v18(1);
  sub_1B40DA960((uint64_t)&v46);
  os_log_type_t v19 = sub_1B411EA28();
  uint64_t v20 = *sub_1B40EC57C();
  v17(v14, (unint64_t)v16, v7);
  v17(v11, (unint64_t)v16, v7);
  if (os_log_type_enabled(v20, v19))
  {
    os_log_t v41 = v20;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v45 = v40;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v22 = sub_1B411E548();
    uint64_t v44 = sub_1B40DFA70(v22, v23, &v45);
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    int v39 = v19;
    uint64_t v24 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v24(v14, v7);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v25 = sub_1B411E558();
    uint64_t v44 = sub_1B40DFA70(v25, v26, &v45);
    uint64_t v27 = v24;
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    v24(v11, v7);
    os_log_t v28 = v41;
    _os_log_impl(&dword_1B3F4C000, v41, (os_log_type_t)v39, "EventKitUI AppExtensionQuery Found %s (%s) RemoteUI Extension", (uint8_t *)v21, 0x16u);
    uint64_t v29 = v40;
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v29, -1, -1);
    MEMORY[0x1BA986180](v21, -1, -1);
  }
  else
  {
    uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v27(v14, v7);
    v27(v11, v7);
  }
  char v31 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v42) + 0xA0);
  int v32 = v42;
  uint64_t v33 = v31();
  sub_1B40DA960((uint64_t)&v46);
  int v34 = (uint64_t *)sub_1B411B9F0();
  uint64_t v35 = *v34;
  uint64_t v36 = v34[1];
  uint64_t v37 = *(void (**)(unsigned char *, uint64_t, uint64_t, void *))(*(void *)v33 + 520);
  sub_1B40DC424((uint64_t)&v46);
  swift_bridgeObjectRetain();
  v37(v16, v35, v36, v32);
  sub_1B40DA960((uint64_t)&v46);
  swift_release();
  swift_bridgeObjectRelease();
  v27(v16, v7);
}

unint64_t sub_1B40F22E0()
{
  unint64_t result = qword_1E9CFC6F0;
  if (!qword_1E9CFC6F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFC6E0);
    sub_1B40F238C();
    sub_1B40F245C(&qword_1E9CFC710, MEMORY[0x1E4F3C908]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC6F0);
  }
  return result;
}

unint64_t sub_1B40F238C()
{
  unint64_t result = qword_1E9CFC6F8;
  if (!qword_1E9CFC6F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFC700);
    sub_1B40F2408();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC6F8);
  }
  return result;
}

unint64_t sub_1B40F2408()
{
  unint64_t result = qword_1E9CFC708;
  if (!qword_1E9CFC708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC708);
  }
  return result;
}

uint64_t sub_1B40F245C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B40F24A4()
{
  uint64_t v1 = v0;
  sub_1B411EA28();
  id v2 = (id)*sub_1B40EC57C();
  sub_1B411E578();

  long long v10 = *v0;
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void *))((*MEMORY[0x1E4FBC8C8] & **((void **)&v10 + 1)) + 0x88);
  uint64_t v5 = *((id *)&v10 + 1);
  LOBYTE(v4) = v4(v5);
  uint64_t result = sub_1B40DA960((uint64_t)&v10);
  if (v4)
  {
    uint64_t v7 = (*(uint64_t (**)(void *))((*v3 & *v5) + 0xA0))(v5);
    uint64_t v8 = sub_1B40DA960((uint64_t)&v10);
    (*(void (**)(uint64_t))(*(void *)v7 + 440))(v8);
    return swift_release();
  }
  else
  {
    uint64_t v9 = (void (*)(void))*((void *)v1 + 2);
    if (v9)
    {
      swift_retain();
      v9(0);
      return sub_1B40DA270((uint64_t)v9);
    }
  }
  return result;
}

uint64_t sub_1B40F262C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B411EA28();
  id v9 = (id)*sub_1B40EC57C();
  sub_1B411E578();

  long long v12 = *v4;
  uint64_t v10 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v12 + 1)) + 0xA0))(*((id *)&v12 + 1));
  sub_1B40DA960((uint64_t)&v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 472))(a1, a2, a3, a4);
  return swift_release();
}

uint64_t sub_1B40F2764(uint64_t a1)
{
  long long v5 = *v1;
  uint64_t v3 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v5 + 1)) + 0xA0))(*((id *)&v5 + 1));
  sub_1B40DA960((uint64_t)&v5);
  (*(void (**)(uint64_t))(*(void *)v3 + 504))(a1);
  return swift_release();
}

void sub_1B40F282C(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 8);
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0xD8);
  long long v5 = v3;
  v4(a1);
}

uint64_t sub_1B40F28BC()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0x644573776F6C6C61, 0xED0000676E697469, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F2ADC(char a1)
{
  *(unsigned char *)(v1 + 64) = a1;
  return sub_1B40F28BC();
}

uint64_t sub_1B40F2AE4()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000015, 0x80000001B41483F0, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F2CFC(char a1)
{
  *(unsigned char *)(v1 + 65) = a1;
  return sub_1B40F2AE4();
}

uint64_t sub_1B40F2D04()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD00000000000001ELL, 0x80000001B41483D0, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F2F1C(char a1)
{
  *(unsigned char *)(v1 + 66) = a1;
  return sub_1B40F2D04();
}

uint64_t sub_1B40F2F24()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD00000000000002CLL, 0x80000001B41483A0, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F313C(char a1)
{
  *(unsigned char *)(v1 + 67) = a1;
  return sub_1B40F2F24();
}

uint64_t sub_1B40F3144()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0x6976657250736369, 0xEA00000000007765, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F335C(char a1)
{
  *(unsigned char *)(v1 + 6_Block_object_dispose(&STACK[0x2D0], 8) = a1;
  return sub_1B40F3144();
}

uint64_t sub_1B40F3364()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000015, 0x80000001B4148380, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F357C(char a1)
{
  *(unsigned char *)(v1 + 69) = a1;
  return sub_1B40F3364();
}

uint64_t sub_1B40F3584()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD00000000000001FLL, 0x80000001B4148360, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F379C(char a1)
{
  *(unsigned char *)(v1 + 70) = a1;
  return sub_1B40F3584();
}

uint64_t sub_1B40F37A4()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000020, 0x80000001B4148330, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F39BC(char a1)
{
  *(unsigned char *)(v1 + 71) = a1;
  return sub_1B40F37A4();
}

uint64_t sub_1B40F39C4()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000018, 0x80000001B4148310, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F3BDC(char a1)
{
  *(unsigned char *)(v1 + 72) = a1;
  return sub_1B40F39C4();
}

uint64_t sub_1B40F3BE4()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0x755373776F6C6C61, 0xEE00736D65746962, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F3E04(char a1)
{
  *(unsigned char *)(v1 + 73) = a1;
  return sub_1B40F3BE4();
}

uint64_t sub_1B40F3E0C()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000015, 0x80000001B41482F0, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F4024(char a1)
{
  *(unsigned char *)(v1 + 75) = a1;
  return sub_1B40F3E0C();
}

uint64_t sub_1B40F402C()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000015, 0x80000001B41482D0, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F4244(char a1)
{
  *(unsigned char *)(v1 + 76) = a1;
  return sub_1B40F402C();
}

uint64_t sub_1B40F424C()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000014, 0x80000001B41482B0, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F4464(char a1)
{
  *(unsigned char *)(v1 + 77) = a1;
  return sub_1B40F424C();
}

uint64_t sub_1B40F446C()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD00000000000001BLL, 0x80000001B4148290, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F4684(char a1)
{
  *(unsigned char *)(v1 + 7_Block_object_dispose(&STACK[0x2D0], 8) = a1;
  return sub_1B40F446C();
}

uint64_t sub_1B40F468C()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0x4D6C616D696E696DLL, 0xEB0000000065646FLL, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F48A8(char a1)
{
  *(unsigned char *)(v1 + 79) = a1;
  return sub_1B40F468C();
}

uint64_t sub_1B40F48B0()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000019, 0x80000001B4148270, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F4AC8(char a1)
{
  *(unsigned char *)(v1 + 80) = a1;
  return sub_1B40F48B0();
}

uint64_t sub_1B40F4AD0()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  long long v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 360))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0x44656772614C7369, 0xEE00776569567961, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  long long v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 384))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B40F4CF0(char a1)
{
  *(unsigned char *)(v1 + 81) = a1;
  return sub_1B40F4AD0();
}

NSBundle *sub_1B40F4CF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1B40F0B38(a1);
}

uint64_t type metadata accessor for _AppExtensionEventHostView.Configuration(uint64_t a1)
{
  return sub_1B40E01B8(a1, (uint64_t *)&unk_1E9CFDA40);
}

uint64_t sub_1B40F4D68(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v9)
  {
    uint64_t v17 = result;
    swift_retain();
    v9(v17, a2, a3, a4, a5, a6, a7, a8);
    return sub_1B40DA270((uint64_t)v9);
  }
  return result;
}

uint64_t sub_1B40F4E38(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 64);
  if (v4)
  {
    uint64_t v7 = result;
    swift_retain();
    v4(v7, a2, a3);
    return sub_1B40DA270((uint64_t)v4);
  }
  return result;
}

uint64_t sub_1B40F4EC8(uint64_t result)
{
  id v2 = *(void (**)(uint64_t))(v1 + 32);
  if (v2)
  {
    uint64_t v3 = result;
    swift_retain();
    v2(v3);
    return sub_1B40DA270((uint64_t)v2);
  }
  return result;
}

uint64_t sub_1B40F4F38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 8);
  sub_1B40DA260(v2);
  sub_1B40DA260(v3);
  sub_1B40DA260(v4);
  return a1;
}

uint64_t objectdestroyTm_0()
{
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  if (*(void *)(v0 + 48)) {
    swift_release();
  }
  if (*(void *)(v0 + 64)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 98, 7);
}

uint64_t sub_1B40F5018()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1B40DC568;
  return sub_1B40F1380(v0 + 16);
}

uint64_t sub_1B40F50AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40F5114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1B40F5170(v3, a1, &qword_1E9CFC168);
}

uint64_t sub_1B40F5170(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B40F51D4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B40F5230())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40F528C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sceneID);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B40F52E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sceneID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B40F5344())()
{
  return j_j__swift_endAccess;
}

void *sub_1B40F53A0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_event);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40F53F0(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_event);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B40F5444())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40F54A0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_layoutDirection;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B40F54E8(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_layoutDirection);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_1B40F5534())()
{
  return j_j__swift_endAccess;
}

id sub_1B40F5590()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sizeCategory);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1B40F55E8(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sizeCategory);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B40F563C())()
{
  return j_j__swift_endAccess;
}

void *sub_1B40F5698()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40F56E8(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B40F573C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40F5798()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_hasInProcessNavBar);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B40F57E0(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_hasInProcessNavBar);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1B40F582C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40F5888()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B40F58D4(uint64_t a1)
{
  id v3 = (void *)(v1
                + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_changedCustomViewConfigurationDictionary);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B40F5928())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40F5984()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B40F59F8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 368))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B40F5A50(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 376))(*a1);
}

uint64_t sub_1B40F5AA0()
{
  return sub_1B411E5E8();
}

void (*sub_1B40F5B10(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B40DCEB0;
}

uint64_t sub_1B40F5B9C()
{
  return swift_endAccess();
}

uint64_t sub_1B40F5C00(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1B40F5D2C(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B40DD1B8;
}

uint64_t sub_1B40F5E3C()
{
  return sub_1B40F60CC(&OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback, (void (*)(void, void))sub_1B40DA260);
}

uint64_t sub_1B40F5E5C(uint64_t a1, uint64_t a2)
{
  return sub_1B40F6154(a1, a2, &OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40DA270);
}

uint64_t (*sub_1B40F5E7C())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B40F5ED8())(void)
{
  uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)v0 + 416))();
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1B40DA270(v2);
  }
  return result;
}

uint64_t sub_1B40F5F58()
{
  return sub_1B40F60CC(&OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback, (void (*)(void, void))sub_1B40E1D64);
}

uint64_t sub_1B40F5F78(uint64_t a1, uint64_t a2)
{
  return sub_1B40F6154(a1, a2, &OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40E1D68);
}

uint64_t (*sub_1B40F5F98())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B40F5FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t, uint64_t, uint64_t, uint64_t)
{
  uint64_t result = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(uint64_t (**)(void))(*(void *)v4 + 448))();
  if (result)
  {
    uint64_t v10 = (uint64_t)result;
    result(a1, a2, a3, a4);
    return (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1B40DA270(v10);
  }
  return result;
}

uint64_t sub_1B40F60AC()
{
  return sub_1B40F60CC(&OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback, (void (*)(void, void))sub_1B40E1D64);
}

uint64_t sub_1B40F60CC(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_1B40F6134(uint64_t a1, uint64_t a2)
{
  return sub_1B40F6154(a1, a2, &OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40E1D68);
}

uint64_t sub_1B40F6154(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_1B40F61B8())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B40F6214(char a1))(void)
{
  uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)v1 + 480))();
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    result(a1 & 1);
    return (void (*)(void))sub_1B40DA270(v4);
  }
  return result;
}

uint64_t sub_1B40F62A8()
{
  uint64_t v0 = swift_allocObject();
  sub_1B40F62E0();
  return v0;
}

uint64_t sub_1B40F62E0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity;
  uint64_t v6 = sub_1B411E568();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (void *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sceneID);
  *uint64_t v7 = 0;
  v7[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_event) = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_viewHierarchy) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_hasInProcessNavBar) = 0;
  *(void *)(v0
            + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_changedCustomViewConfigurationDictionary) = MEMORY[0x1E4FBC868];
  uint64_t v8 = v0
     + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration__customViewConfigurationChangedPublisher;
  v15[15] = 0;
  sub_1B411E598();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v2 + 32))(v8, v4, v1);
  uint64_t v9 = (void *)(v0
                + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback);
  void *v9 = 0;
  v9[1] = 0;
  uint64_t v10 = (void *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback);
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = (void *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback);
  *uint64_t v11 = 0;
  v11[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_layoutDirection) = 0;
  long long v12 = (void *)*MEMORY[0x1E4FB27F0];
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sizeCategory) = *MEMORY[0x1E4FB27F0];
  id v13 = v12;
  return v0;
}

uint64_t sub_1B40F64C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v10 - 8);
  long long v12 = &v30[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_1B411E568();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(unsigned char *))(*(void *)v5 + 184))(v12);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 208);
  swift_bridgeObjectRetain();
  uint64_t v16 = v15(a2, a3);
  uint64_t v17 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *a4) + 0xD0))(v16);
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 232))(v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x100))(v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 256))(v20);
  uint64_t v22 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x118))(v21);
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 280))(v22);
  uint64_t v24 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x130))(v23);
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 304))(v24);
  char v26 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x148))(v25);
  (*(void (**)(void))(*(void *)v5 + 328))(v26 & 1);
  uint64_t v27 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v5 + 384))(v30);
  *os_log_t v28 = !*v28;
  return v27(v30, 0);
}

uint64_t sub_1B40F6908()
{
  sub_1B40E1C58(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity, &qword_1E9CFC168);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration__customViewConfigurationChangedPublisher;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback));
  return v0;
}

uint64_t sub_1B40F6A18()
{
  sub_1B40F6908();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B40F6A70@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for _AppExtensionEventHostView.Configuration(0);
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

id sub_1B40F6AB0(_OWORD *a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity];
  uint64_t v5 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)&v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn] = 0;
  *(void *)&v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent];
  long long v7 = a1[1];
  *(_OWORD *)uint64_t v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  long long v8 = a1[3];
  *((_OWORD *)v6 + 2) = a1[2];
  *((_OWORD *)v6 + 3) = v8;
  v10.receiver = v3;
  v10.super_class = v1;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for _AppExtensionEventHostView.HostCoordinator(uint64_t a1)
{
  return sub_1B40E01B8(a1, qword_1E9CFDA50);
}

uint64_t sub_1B40F6BA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1B40F5170(v3, a1, &qword_1E9CFC168);
}

uint64_t sub_1B40F6BFC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B40F6C58())()
{
  return j_j__swift_endAccess;
}

void *sub_1B40F6CB4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40F6D04(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char *v3 = a1;
}

uint64_t (*sub_1B40F6D58())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B40F6DB4()
{
  return swift_retain();
}

uint64_t sub_1B40F6E00(uint64_t a1)
{
  id v3 = (void *)(v1
                + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_configurationChangedPublisherSink);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1B40F6E54())()
{
  return j__swift_endAccess;
}

void sub_1B40F6EB0(void *a1)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v99 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC748);
  MEMORY[0x1F4188790](v6 - 8);
  long long v8 = (char *)v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1B411E4B8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v112 = (char *)v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v99 - v13;
  id aBlock = 0;
  id v15 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (!v15)
  {
    id v57 = aBlock;
    uint64_t v58 = (void *)sub_1B411E458();

    swift_willThrow();
    os_log_type_t v59 = sub_1B411EA18();
    uint64_t v60 = *sub_1B40EC57C();
    if (!os_log_type_enabled(v60, v59))
    {

      return;
    }
    id v61 = v58;
    id v62 = v58;
    uint64_t v63 = v60;
    long long v64 = (uint8_t *)swift_slowAlloc();
    long long v65 = (void *)swift_slowAlloc();
    *(_DWORD *)long long v64 = 138412290;
    id v66 = v58;
    uint64_t v67 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id aBlock = v67;
    sub_1B411EAF8();
    *long long v65 = v67;

    _os_log_impl(&dword_1B3F4C000, v63, v59, "Error: _AppExtensionEventHostView Setup: Cannot make XPC Connection. %@", v64, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v65, -1, -1);
    MEMORY[0x1BA986180](v64, -1, -1);

    goto LABEL_21;
  }
  uint64_t v16 = v15;
  char v108 = v8;
  uint64_t v109 = v10;
  uint64_t v110 = v9;
  int64_t v111 = v14;
  uint64_t v17 = v113;
  uint64_t v18 = *(void (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v113) + 0x98);
  id v19 = aBlock;
  id v20 = v16;
  v18(v16);
  objc_msgSend(v20, sel_setExportedInterface_, *sub_1B40EA534());
  objc_msgSend(v20, sel_setRemoteObjectInterface_, *sub_1B40EAA64());
  objc_msgSend(v20, sel_setExportedObject_, v17);
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  long long v119 = sub_1B40F9C1C;
  uint64_t v120 = v21;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v116 = 1107296256;
  long long v117 = sub_1B40DE4D8;
  long long v118 = &block_descriptor_0;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v20, sel_setInterruptionHandler_, v22);
  _Block_release(v22);
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  long long v119 = sub_1B40F9D28;
  uint64_t v120 = v23;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v116 = 1107296256;
  long long v117 = sub_1B40DE4D8;
  long long v118 = &block_descriptor_37;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v20, sel_setInvalidationHandler_, v24);
  _Block_release(v24);
  objc_msgSend(v20, sel_resume);
  os_log_type_t v25 = sub_1B411EA28();
  char v26 = (os_log_t *)sub_1B40EC57C();
  os_log_t v27 = *v26;
  if (os_log_type_enabled(*v26, v25))
  {
    os_log_t v28 = v5;
    id v29 = v20;
    id v30 = v27;
    id v107 = v20;
    uint64_t v31 = v3;
    uint64_t v32 = v2;
    uint64_t v33 = v30;
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 67109376;
    LODWORD(aBlock) = objc_msgSend(v29, sel_processIdentifier);
    sub_1B411EAF8();
    *(_WORD *)(v34 + _Block_object_dispose(&STACK[0x2D0], 8) = 1024;
    LODWORD(aBlock) = objc_msgSend(v29, sel_effectiveUserIdentifier);
    sub_1B411EAF8();

    uint64_t v5 = v28;
    _os_log_impl(&dword_1B3F4C000, v33, v25, "_AppExtensionEventHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v34, 0xEu);
    MEMORY[0x1BA986180](v34, -1, -1);

    uint64_t v2 = v32;
    uint64_t v3 = v31;
    id v20 = v107;
  }
  id v35 = objc_msgSend(v20, sel_remoteObjectProxy);
  sub_1B411EB18();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC758);
  if (!swift_dynamicCast())
  {
    sub_1B411EA18();
    uint64_t v63 = *v26;
    sub_1B411E578();

LABEL_21:
    return;
  }
  id v104 = v5;
  uint64_t v105 = v2;
  uint64_t v36 = v114;
  uint64_t v37 = *(void *)((char *)v113 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 8);
  char v38 = *(uint64_t (**)(uint64_t))(*(void *)v37 + 224);
  uint64_t v39 = swift_retain();
  uint64_t v40 = v38(v39);
  if (!v40)
  {
LABEL_20:
    sub_1B411EA18();
    uint64_t v63 = *v26;
    sub_1B411E578();

    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_21;
  }
  os_log_t v41 = (void *)v40;
  id v106 = (id)(*(uint64_t (**)(void))(*(void *)v37 + 296))();
  if (!v106)
  {

    goto LABEL_20;
  }
  id v107 = v41;
  uint64_t v42 = (*(uint64_t (**)(void))(*(void *)v37 + 248))();
  uint64_t v43 = (void *)(*(uint64_t (**)(void))(*(void *)v37 + 272))();
  id v103 = (id)sub_1B411E8C8();
  uint64_t v45 = v44;

  uint64_t v46 = swift_retain();
  uint64_t v47 = (void *)v38(v46);
  swift_release();
  if (!v47)
  {
    id v48 = 0;
    unsigned int v102 = 0;
    goto LABEL_25;
  }
  id v48 = objc_msgSend(v47, sel_eventStore);

  if (!v48)
  {
    unsigned int v102 = 0;
LABEL_25:
    uint64_t v68 = (void *)sub_1B411E898();
    swift_bridgeObjectRelease();
    if (v48)
    {
      uint64_t v69 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v69 = 0;
    }
    objc_msgSend(v36, sel_setupViewContextWithViewHierarchy_layoutDirection_sizeCategory_sourceAccountManagement_sourceBundleID_, v106, v42, v68, v102, v69);

    id v70 = objc_msgSend(objc_allocWithZone((Class)sub_1B411E828()), sel_init);
    sub_1B411E4A8();
    id v71 = objc_msgSend(v107, sel_occurrenceDate);
    uint64_t v101 = v3;
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = (uint64_t)v108;
      int v74 = v112;
      sub_1B411E498();

      uint64_t v75 = v109;
      uint64_t v76 = *(void (**)(uint64_t, char *, uint64_t))(v109 + 32);
      uint64_t v77 = v74;
      uint64_t v78 = v110;
      v76(v73, v77, v110);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v75 + 56))(v73, 0, 1, v78);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48))(v73, 1, v78) != 1)
      {
        uint64_t v79 = *(void (**)(char *, uint64_t))(v75 + 8);
        uint64_t v80 = v111;
        v79(v111, v78);
        v76((uint64_t)v80, (char *)v73, v78);
LABEL_33:
        id v103 = v70;
        id v81 = (char *)sub_1B411E818();
        sub_1B411E838();
        uint64_t v82 = (void *)sub_1B411E878();
        swift_bridgeObjectRelease();
        uint64_t v112 = v81;
        sub_1B411E848();
        sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC768);
        sub_1B40F9D30();
        unint64_t v83 = (void *)sub_1B411E878();
        swift_bridgeObjectRelease();
        sub_1B411E858();
        uint64_t v84 = (void *)sub_1B411E878();
        swift_bridgeObjectRelease();
        uint64_t v85 = v111;
        uint64_t v86 = (void *)sub_1B411E488();
        objc_msgSend(v36, sel_setupEventViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, v82, v83, v84, v86);

        id v87 = objc_msgSend(v36, sel_setupEventViewContextWithNavBarExistence_, (*(uint64_t (**)(void))(*(void *)v37 + 320))() & 1);
        id v88 = v104;
        (*(void (**)(id))(*(void *)v37 + 392))(v87);
        uint64_t v89 = swift_allocObject();
        *(void *)(v89 + 16) = v36;
        *(void *)(v89 + 24) = v37;
        sub_1B40E1AE8(&qword_1E9CFC778, &qword_1E9CFC178);
        swift_retain();
        swift_unknownObjectRetain();
        uint64_t v90 = v105;
        uint64_t v91 = sub_1B411E608();
        swift_release();
        (*(void (**)(char *, uint64_t))(v101 + 8))(v88, v90);
        (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v113) + 0xB0))(v91);
        uint64_t v92 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v93 = swift_allocObject();
        *(void *)(v93 + 16) = v92;
        *(void *)(v93 + 24) = v36;
        unint64_t v94 = *(void (**)(void (*)(), uint64_t))(*(void *)v37 + 424);
        swift_unknownObjectRetain();
        swift_retain();
        v94(sub_1B40F9F70, v93);
        swift_release();
        uint64_t v95 = swift_allocObject();
        *(void *)(v95 + 16) = v36;
        BOOL v96 = *(void (**)(void (*)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t))(*(void *)v37 + 456);
        swift_unknownObjectRetain();
        v96(sub_1B40FA0B8, v95);
        uint64_t v97 = swift_allocObject();
        *(void *)(v97 + 16) = v36;
        char v98 = *(void (**)(id (*)(char), uint64_t))(*(void *)v37 + 488);
        swift_unknownObjectRetain();
        v98(sub_1B40FA130, v97);

        swift_unknownObjectRelease();
        swift_release();

        (*(void (**)(char *, uint64_t))(v109 + 8))(v85, v110);
        return;
      }
    }
    else
    {
      uint64_t v73 = (uint64_t)v108;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v108, 1, 1, v110);
    }
    sub_1B40E1C58(v73, &qword_1E9CFC748);
    goto LABEL_33;
  }
  v99[1] = v45;
  id v100 = v48;
  id v49 = objc_msgSend(v48, sel_connection);
  if (!v49)
  {
    __break(1u);
    goto LABEL_35;
  }
  char v50 = v49;
  id v51 = objc_msgSend(v49, sel_initializationOptions);

  if (!v51)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  unsigned int v102 = objc_msgSend(v51, sel_management);

  id v52 = objc_msgSend(v100, sel_connection);
  if (!v52)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v53 = v52;
  id v54 = objc_msgSend(v52, sel_initializationOptions);

  if (v54)
  {
    id v55 = objc_msgSend(v54, sel_managementBundleIdentifier);

    if (v55)
    {
      sub_1B411E8C8();
      id v48 = v56;
    }
    else
    {

      id v48 = 0;
    }
    goto LABEL_25;
  }
LABEL_37:
  __break(1u);
}

void sub_1B40F7EEC(uint64_t a1)
{
  uint64_t v2 = sub_1B411E7D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B411E7F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1 + 16;
  sub_1B411EA28();
  id v11 = (id)*sub_1B40EC57C();
  uint64_t v12 = MEMORY[0x1E4FBC860];
  sub_1B411E578();

  swift_beginAccess();
  uint64_t v13 = (void *)MEMORY[0x1BA986210](a1 + 16);
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v13) + 0x90))();

    if (v15)
    {
      objc_msgSend(v15, sel_setExportedObject_, 0);
    }
  }
  swift_beginAccess();
  uint64_t v16 = MEMORY[0x1BA986210](v10);
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = *(void *)(v16 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 16);
    uint64_t v19 = *(void *)(v16 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 24);
    sub_1B40DA260(v18);

    if (v18)
    {
      sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
      uint64_t v26 = sub_1B411EA38();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v18;
      *(void *)(v20 + 24) = v19;
      void aBlock[4] = sub_1B40FBF00;
      aBlock[5] = v20;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B40DE4D8;
      aBlock[3] = &block_descriptor_84;
      os_log_type_t v25 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1B411E7E8();
      aBlock[0] = v12;
      sub_1B40F245C((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
      uint64_t v24 = v6;
      sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
      sub_1B411EB28();
      uint64_t v22 = v25;
      uint64_t v21 = (void *)v26;
      MEMORY[0x1BA984600](0, v9, v5, v25);
      _Block_release(v22);

      sub_1B40DA270(v18);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
    }
  }
}

unint64_t sub_1B40F82F0(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFCC70);
    uint64_t v2 = (void *)sub_1B411ED18();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x1E4FBC838] + 8;
  uint64_t v11 = MEMORY[0x1E4FBC840] + 8;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1B40EA518();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    sub_1B40FBEB8(v6, v7);
    sub_1B40FBEB8(v7, v40);
    sub_1B40FBEB8(v40, &v38);
    unint64_t result = sub_1B40FA28C(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      unint64_t result = (unint64_t)sub_1B40FBEB8(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    os_log_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *os_log_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_1B40FBEB8(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1B40F86C0()
{
  uint64_t v1 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
  objc_msgSend(v2, sel_invalidate);

  uint64_t v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x98);

  return v3(0);
}

uint64_t sub_1B40F8858(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  uint64_t v44 = a8;
  uint64_t v45 = a7;
  os_log_t v41 = a3;
  uint64_t v42 = a5;
  uint64_t v43 = a2;
  uint64_t v12 = sub_1B411E7D8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1B411E7F8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t result = MEMORY[0x1F4188790](v16);
  int64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(v8 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 32);
  if (v21)
  {
    uint64_t v39 = v13;
    uint64_t v40 = result;
    uint64_t v22 = *(void *)(v8 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 40);
    uint64_t v38 = v17;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v37 = sub_1B411EA38();
    int64_t v23 = (void *)swift_allocObject();
    _OWORD v23[2] = v21;
    v23[3] = v22;
    v23[4] = a1;
    uint64_t v24 = v44;
    unint64_t v25 = v41;
    v23[5] = v43;
    v23[6] = v25;
    uint64_t v26 = v42;
    v23[7] = a4;
    v23[8] = v26;
    v23[9] = a6;
    os_log_t v41 = v15;
    uint64_t v42 = v12;
    os_log_t v27 = a6;
    uint64_t v28 = v45;
    v23[10] = v45;
    v23[11] = v24;
    void aBlock[4] = sub_1B40FA1A8;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_56_0;
    BOOL v29 = _Block_copy(aBlock);
    sub_1B40DA260(v21);
    id v30 = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v31 = v27;
    id v32 = v28;
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B40F245C((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    uint64_t v34 = v41;
    uint64_t v33 = v42;
    sub_1B411EB28();
    uint64_t v35 = (void *)v37;
    MEMORY[0x1BA984600](0, v20, v34, v29);
    _Block_release(v29);

    sub_1B40DA270(v21);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v33);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v20, v40);
  }
  return result;
}

uint64_t sub_1B40F8CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1B411E7D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v3 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 48);
  if (v16)
  {
    uint64_t v24 = v8;
    uint64_t v25 = result;
    uint64_t v17 = *(void *)(v3 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 56);
    uint64_t v18 = v13;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v23 = sub_1B411EA38();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v16;
    v19[3] = v17;
    void v19[4] = a1;
    v19[5] = a2;
    v19[6] = a3;
    void aBlock[4] = sub_1B40E04AC;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_62;
    int64_t v20 = _Block_copy(aBlock);
    sub_1B40DA260(v16);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B40F245C((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    uint64_t v21 = (void *)v23;
    MEMORY[0x1BA984600](0, v15, v10, v20);
    _Block_release(v20);

    sub_1B40DA270(v16);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v15, v25);
  }
  return result;
}

uint64_t sub_1B40F9074(uint64_t a1)
{
  uint64_t v3 = sub_1B411E7D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 16);
  if (v12)
  {
    uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 24);
    uint64_t v19 = v9;
    uint64_t v20 = result;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v18 = sub_1B411EA38();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = v12;
    v14[3] = v13;
    v14[4] = a1;
    void aBlock[4] = sub_1B40FA25C;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_68;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B40F245C((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    uint64_t v16 = (void *)v18;
    MEMORY[0x1BA984600](0, v11, v6, v15);
    _Block_release(v15);

    sub_1B40DA270(v12);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return result;
}

id sub_1B40F940C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionEventHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B40F9504()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F258A8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC7A0);
  sub_1B411E6F8();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1B40F957C(void *a1, uint64_t a2)
{
  sub_1B40FAA28(a1, a2, *(void *)(v2 + 8));
}

id sub_1B40F9584@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v15 = *v1;
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v9 = (objc_class *)type metadata accessor for _AppExtensionEventHostView.HostCoordinator(0);
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity];
  uint64_t v12 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn] = 0;
  *(void *)&v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  uint64_t v13 = &v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent];
  *(void *)uint64_t v13 = v15;
  *((void *)v13 + 1) = v2;
  *((void *)v13 + 2) = v3;
  *((void *)v13 + 3) = v4;
  *((void *)v13 + 4) = v5;
  *((void *)v13 + 5) = v6;
  *((void *)v13 + 6) = v8;
  *((void *)v13 + 7) = v7;
  swift_retain();
  sub_1B40DA260(v3);
  sub_1B40DA260(v5);
  sub_1B40DA260(v8);
  v17.receiver = v10;
  v17.super_class = v9;
  id result = objc_msgSendSuper2(&v17, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1B40F96C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B40FBE64();

  return MEMORY[0x1F40FAB68](a1, a2, a3, v6);
}

uint64_t sub_1B40F9724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B40FBE64();

  return MEMORY[0x1F40FAB30](a1, a2, a3, v6);
}

void sub_1B40F9788()
{
}

uint64_t sub_1B40F97B0(uint64_t a1, uint64_t a2)
{
  return sub_1B40F9A4C(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1B40F97C8(uint64_t a1, id *a2)
{
  uint64_t result = sub_1B411E8A8();
  *a2 = 0;
  return result;
}

uint64_t sub_1B40F9840(uint64_t a1, id *a2)
{
  char v3 = sub_1B411E8B8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B40F98C0@<X0>(uint64_t *a1@<X8>)
{
  sub_1B411E8C8();
  uint64_t v2 = sub_1B411E898();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B40F9904@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1B411E898();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B40F994C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B411E8C8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1B40F9978(uint64_t a1)
{
  uint64_t v2 = sub_1B40F245C((unint64_t *)&unk_1E9CFC860, type metadata accessor for UIContentSizeCategory);
  uint64_t v3 = sub_1B40F245C(&qword_1E9CFCC60, type metadata accessor for UIContentSizeCategory);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1B40F9A34(uint64_t a1, uint64_t a2)
{
  return sub_1B40F9A4C(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1B40F9A4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1B411E8C8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1B40F9A90()
{
  sub_1B411E8C8();
  sub_1B411E8D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B40F9AE4()
{
  sub_1B411E8C8();
  sub_1B411ED78();
  sub_1B411E8D8();
  uint64_t v0 = sub_1B411ED88();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B40F9B58()
{
  uint64_t v0 = sub_1B411E8C8();
  uint64_t v2 = v1;
  if (v0 == sub_1B411E8C8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1B411ED48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B40F9BE4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B40F9C1C()
{
  sub_1B411EA28();
  id v1 = (id)*sub_1B40EC57C();
  sub_1B411E578();

  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x1BA986210](v0 + 16);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90))();

    if (v4)
    {
      objc_msgSend(v4, sel_setExportedObject_, 0);
    }
  }
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_1B40F9D28()
{
  sub_1B40F7EEC(v0);
}

unint64_t sub_1B40F9D30()
{
  unint64_t result = qword_1E9CFC770;
  if (!qword_1E9CFC770)
  {
    sub_1B40E1BC8(255, (unint64_t *)&qword_1E9CFC760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC770);
  }
  return result;
}

uint64_t sub_1B40F9D98()
{
  return objectdestroy_39Tm(MEMORY[0x1E4FBC8F8], MEMORY[0x1E4FBC8D0]);
}

uint64_t sub_1B40F9DC4()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v2 + 344))();
  sub_1B40F82F0(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1B411E878();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_updateEventViewWithChangedViewConfigurationDictionary_, v4);

  char v5 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 360))(v9);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  *uint64_t v7 = MEMORY[0x1E4FBC868];
  return v5(v9, 0);
}

uint64_t sub_1B40F9EEC()
{
  return objectdestroy_39Tm(MEMORY[0x1E4FBC8D0], MEMORY[0x1E4FBC8F8]);
}

uint64_t objectdestroy_39Tm(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 24));

  return MEMORY[0x1F4186498](v2, 32, 7);
}

void sub_1B40F9F70()
{
  id v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1BA986210](v2);
  if (v3
    && (uint64_t v4 = v3,
        char v5 = (void *)MEMORY[0x1E4FBC8C8],
        unint64_t v6 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x90))(),
        v4,
        v6,
        v6))
  {
    swift_beginAccess();
    uint64_t v7 = (void *)MEMORY[0x1BA986210](v2);
    if (v7)
    {
      uint64_t v8 = v7;
      (*(void (**)(void))((*v5 & *v7) + 0xE0))(0);
    }
  }
  else
  {
    objc_msgSend(v1, sel_eventViewNavigationDoneButtonTapped);
  }
}

uint64_t sub_1B40FA080()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B40FA0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(v4 + 16);
  id v8 = (id)sub_1B411E898();
  objc_msgSend(v7, sel_eventViewEventEditViewCompletedWithAction_eventID_waitUntilTimestamp_, a1, v8, a4);
}

id sub_1B40FA130(char a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_eventViewEventEditViewPresented_, a1 & 1);
}

uint64_t sub_1B40FA148()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1B40FA1A8()
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
}

uint64_t sub_1B40FA1E4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B40FA224()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B40FA25C()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

unint64_t sub_1B40FA28C(uint64_t a1, uint64_t a2)
{
  sub_1B411ED78();
  sub_1B411E8D8();
  uint64_t v4 = sub_1B411ED88();

  return sub_1B40FA78C(a1, a2, v4);
}

uint64_t sub_1B40FA304(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCF10);
  char v36 = a2;
  uint64_t v6 = sub_1B411ECF8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_1B411ED78();
    sub_1B411E8D8();
    uint64_t result = sub_1B411ED88();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1B40FA61C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1B40FA28C(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B40FA870();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1B40FA304(v15, a4 & 1);
  unint64_t v21 = sub_1B40FA28C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1B411ED68();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v18[2] = v26;

  return swift_bridgeObjectRetain();
}

unint64_t sub_1B40FA78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B411ED48() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B411ED48() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1B40FA870()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCF10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B411ECE8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1B40FAA28(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B411E4C8();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v46 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v7 - 8);
  int64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1B411E568();
  uint64_t v10 = *(void *)(v49 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v49);
  int64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  id v48 = (char *)&v42 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC360);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v45 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v42 - v18;
  self;
  if (swift_dynamicCastObjCClass())
  {
    id v20 = a1;
    sub_1B411EA78();
    uint64_t v21 = sub_1B411EA68();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21) == 1)
    {
      id v44 = v20;
      sub_1B40E1C58((uint64_t)v19, (uint64_t *)&unk_1E9CFC360);
      unint64_t v23 = *(void (**)(uint64_t))(*(void *)a3 + 176);
      uint64_t v47 = v10;
      uint64_t v24 = swift_retain();
      v23(v24);
      uint64_t v25 = v47;
      swift_release();
      uint64_t v26 = v49;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v9, 1, v49) == 1)
      {

        sub_1B40E1C58((uint64_t)v9, &qword_1E9CFC168);
      }
      else
      {
        uint64_t v42 = v13;
        BOOL v27 = v48;
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v48, v9, v26);
        uint64_t v28 = *(uint64_t (**)(uint64_t))(*(void *)a3 + 200);
        uint64_t v29 = swift_retain();
        uint64_t v43 = v28(v29);
        unint64_t v31 = v30;
        swift_release();
        if (v31)
        {
          os_log_type_t v32 = sub_1B411EA28();
          uint64_t v33 = *sub_1B40EC57C();
          os_log_type_t v34 = v32;
          if (os_log_type_enabled(v33, v32))
          {
            swift_bridgeObjectRetain_n();
            uint64_t v35 = v33;
            char v36 = (uint8_t *)swift_slowAlloc();
            uint64_t v37 = swift_slowAlloc();
            uint64_t v51 = v37;
            *(_DWORD *)char v36 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v50 = sub_1B40DFA70(v43, v31, &v51);
            sub_1B411EAF8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1B3F4C000, v35, v34, "_AppExtensionEventHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v36, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1BA986180](v37, -1, -1);
            MEMORY[0x1BA986180](v36, -1, -1);
          }
          uint64_t v38 = v47;
          uint64_t v39 = v48;
          uint64_t v40 = v49;
          (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v42, v48, v49);
          sub_1B411E4D8();
          os_log_t v41 = v45;
          sub_1B411EA58();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v41, 0, 1, v21);
          sub_1B411EA88();

          (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v26);
        }
      }
    }
    else
    {

      sub_1B40E1C58((uint64_t)v19, (uint64_t *)&unk_1E9CFC360);
    }
  }
  else
  {
    sub_1B411ECC8();
    __break(1u);
  }
}

uint64_t sub_1B40FAFF4(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1B4159228, 1);
}

void destroy for EKEventOOPHostView(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  if (*(void *)(a1 + 32)) {
    swift_release();
  }
  if (*(void *)(a1 + 48))
  {
    swift_release();
  }
}

uint64_t initializeWithCopy for EKEventOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;
  uint64_t v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  id v7 = v4;
  if (v5)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v9 = *(void *)(a2 + 32);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  uint64_t v11 = *(void *)(a2 + 48);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 56);
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v11;
    *(void *)(a1 + 56) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 48);
  }
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  return a1;
}

uint64_t assignWithCopy for EKEventOOPHostView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v10;
      *(void *)(a1 + 40) = v11;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v12;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  uint64_t v13 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 56);
      *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v13;
      *(void *)(a1 + 56) = v15;
      swift_retain();
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v14 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v13;
  *(void *)(a1 + 56) = v14;
  swift_retain();
  swift_release();
LABEL_22:
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  *(unsigned char *)(a1 + 67) = *(unsigned char *)(a2 + 67);
  *(unsigned char *)(a1 + 6_Block_object_dispose(&STACK[0x2D0], 8) = *(unsigned char *)(a2 + 68);
  *(unsigned char *)(a1 + 69) = *(unsigned char *)(a2 + 69);
  *(unsigned char *)(a1 + 70) = *(unsigned char *)(a2 + 70);
  *(unsigned char *)(a1 + 71) = *(unsigned char *)(a2 + 71);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(unsigned char *)(a1 + 76) = *(unsigned char *)(a2 + 76);
  *(unsigned char *)(a1 + 77) = *(unsigned char *)(a2 + 77);
  *(unsigned char *)(a1 + 7_Block_object_dispose(&STACK[0x2D0], 8) = *(unsigned char *)(a2 + 78);
  *(unsigned char *)(a1 + 79) = *(unsigned char *)(a2 + 79);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  return a1;
}

__n128 __swift_memcpy82_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for EKEventOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  long long v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;

  uint64_t v6 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 40) = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v11;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  uint64_t v12 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v12)
    {
      uint64_t v14 = *(void *)(a2 + 56);
      *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v12;
      *(void *)(a1 + 56) = v14;
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v12)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v13 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v12;
  *(void *)(a1 + 56) = v13;
  swift_release();
LABEL_22:
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  *(unsigned char *)(a1 + 67) = *(unsigned char *)(a2 + 67);
  *(unsigned char *)(a1 + 6_Block_object_dispose(&STACK[0x2D0], 8) = *(unsigned char *)(a2 + 68);
  *(unsigned char *)(a1 + 69) = *(unsigned char *)(a2 + 69);
  *(unsigned char *)(a1 + 70) = *(unsigned char *)(a2 + 70);
  *(unsigned char *)(a1 + 71) = *(unsigned char *)(a2 + 71);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(unsigned char *)(a1 + 76) = *(unsigned char *)(a2 + 76);
  *(unsigned char *)(a1 + 77) = *(unsigned char *)(a2 + 77);
  *(unsigned char *)(a1 + 7_Block_object_dispose(&STACK[0x2D0], 8) = *(unsigned char *)(a2 + 78);
  *(unsigned char *)(a1 + 79) = *(unsigned char *)(a2 + 79);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventOOPHostView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 82)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKEventOOPHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(_WORD *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 82) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 82) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventOOPHostView()
{
  return &type metadata for EKEventOOPHostView;
}

uint64_t destroy for _AppExtensionEventHostView(void *a1)
{
  uint64_t result = swift_release();
  if (a1[2]) {
    uint64_t result = swift_release();
  }
  if (a1[4]) {
    uint64_t result = swift_release();
  }
  if (a1[6])
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for _AppExtensionEventHostView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  uint64_t v10 = a2[6];
  if (v10)
  {
    uint64_t v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  return a1;
}

void *assignWithCopy for _AppExtensionEventHostView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      uint64_t v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v10 = a2[6];
  if (!a1[6])
  {
    if (v10)
    {
      uint64_t v12 = a2[7];
      a1[6] = v10;
      a1[7] = v12;
      swift_retain();
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v11 = a2[7];
  a1[6] = v10;
  a1[7] = v11;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for _AppExtensionEventHostView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      uint64_t v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v11 = a2[6];
  if (!a1[6])
  {
    if (v11)
    {
      uint64_t v13 = a2[7];
      a1[6] = v11;
      a1[7] = v13;
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v12 = a2[7];
  a1[6] = v11;
  a1[7] = v12;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AppExtensionEventHostView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AppExtensionEventHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _AppExtensionEventHostView()
{
  return &type metadata for _AppExtensionEventHostView;
}

uint64_t sub_1B40FBA10()
{
  return type metadata accessor for _AppExtensionEventHostView.Configuration(0);
}

void sub_1B40FBA18()
{
  sub_1B40E1818();
  if (v0 <= 0x3F)
  {
    sub_1B40FBD40(319, (unint64_t *)&unk_1E9CFCB90, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_1B40FBB4C()
{
  return type metadata accessor for _AppExtensionEventHostView.HostCoordinator(0);
}

void sub_1B40FBB54()
{
  sub_1B40E1818();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_1B40FBC00()
{
  unint64_t result = qword_1E9CFC810;
  if (!qword_1E9CFC810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFC818);
    sub_1B40F22E0();
    sub_1B40E1AE8(&qword_1E9CFC718, &qword_1E9CFC6E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC810);
  }
  return result;
}

void type metadata accessor for EKEventEditViewAction(uint64_t a1)
{
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceLayoutDirection(uint64_t a1)
{
}

void type metadata accessor for EKEventRemoteViewAction(uint64_t a1)
{
}

void sub_1B40FBD40(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1B40FBD8C()
{
  return sub_1B40F245C((unint64_t *)&unk_1E9CFCC40, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_1B40FBDD4()
{
  return sub_1B40F245C((unint64_t *)&unk_1E9CFC850, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_1B40FBE1C()
{
  return sub_1B40F245C((unint64_t *)&unk_1E9CFCC50, type metadata accessor for UIContentSizeCategory);
}

unint64_t sub_1B40FBE64()
{
  unint64_t result = qword_1E9CFC870;
  if (!qword_1E9CFC870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC870);
  }
  return result;
}

_OWORD *sub_1B40FBEB8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B40FBEC8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B40FBF00()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

unint64_t sub_1B40FBF2C()
{
  unint64_t result = qword_1E9CFC890;
  if (!qword_1E9CFC890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFC890);
  }
  return result;
}

uint64_t sub_1B40FBF80(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t (*sub_1B40FBFBC())()
{
  return j_j__swift_endAccess;
}

id sub_1B40FC018(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((void *)v6 + 14) = 0;
  uint64_t v7 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventEditOOPHostViewModel();
  uint64_t v8 = v3;
  *(void *)&v3[v7] = sub_1B4101D38();
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor] = 0;

  if (a2)
  {
    uint64_t v9 = (void *)sub_1B411E898();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for EKEventEditViewControllerOOPImpl();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, a3);

  return v10;
}

uint64_t type metadata accessor for EKEventEditViewControllerOOPImpl()
{
  return self;
}

void sub_1B40FC21C()
{
  unint64_t v1 = v0;
  v62.receiver = v0;
  v62.super_class = (Class)type metadata accessor for EKEventEditViewControllerOOPImpl();
  id v2 = objc_msgSendSuper2(&v62, sel_viewDidLoad);
  long long v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))(v2);
  if (v4)
  {
    id v5 = v4;
    id v6 = v4;
LABEL_3:
    id v7 = v4;
    id v8 = objc_msgSend(v5, sel_insertedObjectIDs);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
      sub_1B40F9D30();
      uint64_t v10 = sub_1B411E9E8();
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs) = v10;
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v5, sel_updatedObjectIDs);
    if (v13)
    {
      uint64_t v14 = v13;
      sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
      sub_1B40F9D30();
      uint64_t v15 = sub_1B411E9E8();
    }
    else
    {
      uint64_t v15 = 0;
    }
    *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs) = v15;
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v5, sel_deletedObjectIDs);
    if (v16)
    {
      uint64_t v17 = v16;
      sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
      sub_1B40F9D30();
      uint64_t v18 = sub_1B411E9E8();
    }
    else
    {
      uint64_t v18 = 0;
    }
    *(void *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs) = v18;

    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v11 = (void *)(*(uint64_t (**)(void))((*v3 & *v0) + 0x168))();
  if (!v11)
  {
    id v6 = 0;
    goto LABEL_16;
  }
  objc_super v12 = v11;
  id v6 = objc_msgSend(v11, sel_eventStore);

  if (v6)
  {
    id v5 = v6;
    uint64_t v4 = 0;
    goto LABEL_3;
  }
LABEL_16:
  id v19 = *(id *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel);
  v20.n128_f64[0] = sub_1B41021C0((uint64_t)v54);
  uint64_t v21 = (*(uint64_t (**)(__n128))((*v3 & *v1) + 0x168))(v20);
  sub_1B410378C(v21);
  id v53 = v6;
  sub_1B41036FC((uint64_t)v6);
  uint64_t v22 = (void *)(*(uint64_t (**)(void))((*v3 & *v1) + 0x1B8))();
  sub_1B4103DBC(v22);
  uint64_t v43 = v54[0];
  uint64_t v23 = v54[2];
  uint64_t v25 = v54[3];
  uint64_t v24 = v54[4];
  uint64_t v26 = v54[5];
  uint64_t v27 = v54[6];
  uint64_t v28 = v54[7];
  uint64_t v29 = v55;
  unint64_t v30 = v56;
  uint64_t v40 = (void *)v54[1];
  uint64_t v41 = v57;
  uint64_t v37 = v59;
  uint64_t v38 = v60;
  uint64_t v39 = v58;
  unint64_t v31 = (char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView;
  uint64_t v35 = v55;
  uint64_t v36 = v61;
  swift_beginAccess();
  uint64_t v51 = (void *)*((void *)v31 + 1);
  uint64_t v52 = *(void *)v31;
  uint64_t v49 = *((void *)v31 + 3);
  uint64_t v50 = *((void *)v31 + 2);
  uint64_t v47 = *((void *)v31 + 5);
  uint64_t v48 = *((void *)v31 + 4);
  uint64_t v45 = *((void *)v31 + 7);
  uint64_t v46 = *((void *)v31 + 6);
  long long v42 = *((_OWORD *)v31 + 4);
  *(void *)unint64_t v31 = v43;
  *((void *)v31 + 1) = v40;
  *((void *)v31 + 2) = v23;
  *((void *)v31 + 3) = v25;
  *((void *)v31 + 4) = v24;
  *((void *)v31 + 5) = v26;
  *((void *)v31 + 6) = v27;
  *((void *)v31 + 7) = v28;
  *((void *)v31 + _Block_object_dispose(&STACK[0x2D0], 8) = v29;
  *((void *)v31 + 9) = v30;
  *((void *)v31 + 10) = v41;
  *((void *)v31 + 11) = v39;
  *((void *)v31 + 12) = v37;
  *((void *)v31 + 13) = v38;
  *((void *)v31 + 14) = v36;
  id v44 = v40;
  sub_1B40DA260(v23);
  sub_1B40DA260(v24);
  sub_1B40DA260(v27);
  swift_bridgeObjectRetain();
  id v32 = v35;
  id v33 = v30;
  uint64_t v34 = sub_1B40FFACC(v52, v51, v50, v49, v48, v47, v46, v45, (void *)v42, *((void **)&v42 + 1));
  (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x138))(v34);

  sub_1B40DA270(v23);
  sub_1B40DA270(v24);
  sub_1B40DA270(v27);
  swift_bridgeObjectRelease();
}

void sub_1B40FC7AC()
{
  unint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  swift_beginAccess();
  id v2 = (void *)v1[1];
  if (!v2) {
    goto LABEL_31;
  }
  uint64_t v3 = v1[2];
  uint64_t v101 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v4 = v1[5];
  uint64_t v96 = v1[7];
  uint64_t v97 = v1[6];
  id v6 = (void *)v1[8];
  id v7 = (void *)v1[9];
  uint64_t v8 = v1[10];
  uint64_t v9 = v1[11];
  uint64_t v11 = v1[12];
  uint64_t v10 = v1[13];
  uint64_t v12 = v1[14];
  uint64_t v120 = *v1;
  uint64_t v104 = v120;
  uint64_t v121 = v2;
  uint64_t v122 = v3;
  uint64_t v123 = v101;
  uint64_t v124 = v5;
  uint64_t v125 = v4;
  uint64_t v102 = v3;
  unint64_t v99 = v7;
  uint64_t v100 = v4;
  uint64_t v126 = v97;
  uint64_t v127 = v96;
  long long v128 = v6;
  v129 = v7;
  id v13 = v6;
  id v103 = v6;
  char v91 = v8 & 1;
  char v130 = v8 & 1;
  uint64_t v131 = v9;
  uint64_t v132 = v11;
  uint64_t v106 = v11;
  char v133 = v10 & 1;
  uint64_t v134 = v12;
  uint64_t v92 = self;
  sub_1B40FFB74(v120, v2, v102, v101, v5, v4, v97, v96, v13, v7);
  uint64_t v98 = v9;
  sub_1B40FFB74(v120, v2, v102, v101, v5, v4, v97, v96, v103, v7);
  id v90 = v2;
  sub_1B40DA260(v97);
  swift_bridgeObjectRetain();
  id v87 = v103;
  id v86 = v7;
  id v14 = objc_msgSend(v92, sel_shared);
  uint64_t v15 = sub_1B40F0AA0();
  id v16 = objc_msgSend(v14, sel_layoutDirectionOrOverride);
  uint64_t v17 = (void *)MEMORY[0x1E4FBC8C8];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v15) + 0x108))(v16);

  uint64_t v18 = sub_1B40F0AA0();
  (*(void (**)(id))((*v17 & *v18) + 0x120))(objc_msgSend(v14, sel_preferredContentSizeCategoryOrOverride));

  uint64_t v85 = v14;
  id v19 = objc_msgSend(v14, sel_viewHierarchyOrOverride);
  id v20 = objc_msgSend(v95, sel_view);
  if (!v20)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v21 = v20;
  objc_msgSend(v20, sel_bounds);
  double v23 = v22;
  double v25 = v24;

  id v88 = self;
  id v26 = objc_msgSend(v88, sel_systemBlueColor);
  uint64_t v27 = sub_1B40F0AA0();
  sub_1B40FFACC(v120, v2, v102, v101, v5, v100, v97, v96, v103, v7);
  id v28 = objc_msgSend(v19, sel_ekui_verticalSizeClass);
  id v29 = objc_msgSend(v19, sel_ekui_horizontalSizeClass);
  id v30 = objc_msgSend(v19, sel_ekui_interfaceOrientation);
  id v31 = v26;
  objc_msgSend(v19, sel_ekui_affineTransform);
  *(_OWORD *)uint64_t v93 = v107;
  long long v89 = v108;
  id v32 = v109;
  uint64_t v33 = v110;
  id v34 = objc_allocWithZone((Class)EKUIViewHierarchyFromComponents);
  long long v107 = *(_OWORD *)v93;
  long long v108 = v89;
  uint64_t v109 = v32;
  uint64_t v110 = v33;
  id v35 = objc_msgSend(v34, sel_initWithSize_verticalSizeClass_horizontalSizeClass_interfaceOrientation_tintColor_affineTranform_, v28, v29, v30, v31, &v107, v23, v25);
  unint64_t v94 = v31;

  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v27) + 0x138))(v35);
  uint64_t v36 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v5);
  uint64_t v37 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v102);
  id v38 = v90;
  sub_1B40DA260((uint64_t)sub_1B40FFD30);
  sub_1B40DA260((uint64_t)sub_1B40FFC60);
  sub_1B40DA260(v97);
  sub_1B40DA270(v97);

  swift_release();
  swift_release();
  *(void *)&long long v107 = v104;
  *((void *)&v107 + 1) = v38;
  *(void *)&long long v108 = sub_1B40FFD30;
  *((void *)&v108 + 1) = v37;
  uint64_t v109 = sub_1B40FFC60;
  uint64_t v110 = v36;
  uint64_t v111 = v97;
  uint64_t v112 = v96;
  unint64_t v113 = v103;
  long long v114 = v99;
  char v115 = v91;
  uint64_t v116 = v98;
  uint64_t v117 = v106;
  char v118 = v10 & 1;
  uint64_t v119 = v12;
  id v39 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC8F8));
  uint64_t v40 = (void *)sub_1B411E658();
  objc_msgSend(v95, sel_addChildViewController_, v40);
  id v41 = objc_msgSend(v40, sel_view);
  if (!v41)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  long long v42 = v41;
  objc_msgSend(v41, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  id v43 = objc_msgSend(v40, sel_view);
  if (!v43)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v44 = v43;
  id v45 = objc_msgSend(v88, sel_systemGroupedBackgroundColor);
  objc_msgSend(v44, sel_setBackgroundColor_, v45);

  id v46 = objc_msgSend(v95, sel_view);
  if (!v46)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v47 = v46;
  uint64_t v105 = v38;
  id v48 = objc_msgSend(v40, sel_view);
  if (!v48)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v49 = v48;
  objc_msgSend(v47, sel_addSubview_, v48);

  objc_msgSend(v40, sel_didMoveToParentViewController_, v95);
  uint64_t v50 = *(void **)&v95[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController];
  *(void *)&v95[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController] = v40;
  id v51 = v40;

  id v52 = objc_msgSend(v51, sel_view);
  if (!v52)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v53 = v52;
  objc_msgSend(v52, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC420);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_1B413B4B0;
  id v55 = objc_msgSend(v51, sel_view);
  if (!v55)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v56 = v55;
  id v57 = objc_msgSend(v55, sel_leadingAnchor);

  id v58 = objc_msgSend(v95, sel_view);
  if (!v58)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v59 = v58;
  id v60 = objc_msgSend(v58, sel_leadingAnchor);

  id v61 = objc_msgSend(v57, sel_constraintEqualToAnchor_, v60);
  *(void *)(v54 + 32) = v61;
  id v62 = objc_msgSend(v51, sel_view);
  if (!v62)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v63 = v62;
  id v64 = objc_msgSend(v62, sel_topAnchor);

  id v65 = objc_msgSend(v95, sel_view);
  if (!v65)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v66 = v65;
  id v67 = objc_msgSend(v65, sel_topAnchor);

  id v68 = objc_msgSend(v64, sel_constraintEqualToAnchor_, v67);
  *(void *)(v54 + 40) = v68;
  id v69 = objc_msgSend(v51, sel_view);
  if (!v69)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v70 = v69;
  id v71 = objc_msgSend(v69, sel_trailingAnchor);

  id v72 = objc_msgSend(v95, sel_view);
  if (!v72)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v73 = v72;
  id v74 = objc_msgSend(v72, sel_trailingAnchor);

  id v75 = objc_msgSend(v71, sel_constraintEqualToAnchor_, v74);
  *(void *)(v54 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v75;
  id v76 = objc_msgSend(v51, sel_view);
  if (v76)
  {
    uint64_t v77 = v76;
    id v78 = objc_msgSend(v76, sel_bottomAnchor);

    id v79 = objc_msgSend(v95, sel_view);
    if (v79)
    {
      uint64_t v80 = v79;
      id v81 = self;
      id v82 = objc_msgSend(v80, sel_bottomAnchor);

      id v83 = objc_msgSend(v78, sel_constraintEqualToAnchor_, v82);
      *(void *)(v54 + 56) = v83;
      *(void *)&long long v107 = v54;
      sub_1B411E938();
      sub_1B40E1BC8(0, &qword_1E9CFCD60);
      uint64_t v84 = (void *)sub_1B411E908();
      swift_bridgeObjectRelease();
      objc_msgSend(v81, sel_activateConstraints_, v84);

      swift_unknownObjectRelease();
      sub_1B40DA270((uint64_t)sub_1B40FFD30);
      sub_1B40DA270((uint64_t)sub_1B40FFC60);
      sub_1B40DA270(v97);
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_30;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  sub_1B411ECC8();
  __break(1u);
}

void sub_1B40FD364(uint64_t a1, unint64_t a2)
{
  os_log_type_t v5 = sub_1B411EA28();
  id v6 = (os_log_t *)sub_1B40EC57C();
  os_log_t v7 = *v6;
  if (os_log_type_enabled(*v6, v5))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v8 = v7;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1B40DFA70(a1, a2, &v17);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3F4C000, v8, v5, "EKEventEditViewControllerOOPImpl: Received remoteEventEditViewControllerRequestPresentView on the host app side. viewName: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v10, -1, -1);
    MEMORY[0x1BA986180](v9, -1, -1);
  }
  id v11 = objc_msgSend(v2, sel_parentViewController, v16, v17);
  if (!v11
    || (uint64_t v12 = v11,
        id v13 = objc_msgSend(v11, sel_parentViewController),
        v12,
        !v13)
    || (self, uint64_t v14 = swift_dynamicCastObjCClass(), v13, !v14))
  {
    sub_1B411EA18();
    uint64_t v15 = *v6;
    sub_1B411E578();
  }
}

void sub_1B40FD56C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v9 = v8;
  void aBlock[6] = *MEMORY[0x1E4F143B8];
  sub_1B411EA28();
  uint64_t v16 = sub_1B40EC57C();
  id v17 = (id)*v16;
  sub_1B411E578();

  id v18 = objc_msgSend(v9, sel_parentViewController);
  if (!v18) {
    goto LABEL_18;
  }
  id v19 = v18;
  id v106 = objc_msgSend(v18, sel_parentViewController);

  if (!v106) {
    goto LABEL_18;
  }
  self;
  uint64_t v20 = swift_dynamicCastObjCClass();
  if (!v20)
  {

LABEL_18:
    sub_1B411EA18();
    id v106 = (id)*v16;
    sub_1B411E578();
    goto LABEL_19;
  }
  uint64_t v102 = a1;
  uint64_t v99 = v20;
  uint64_t v21 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v22 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v9) + 0x150))();
  double v23 = (void *)v22;
  if (v22)
  {
    id v100 = (id)v22;
    id v24 = (id)v22;
    goto LABEL_6;
  }
  id v39 = (void *)(*(uint64_t (**)(void))((*v21 & *v9) + 0x168))();
  if (v39)
  {
    uint64_t v40 = v39;
    id v24 = objc_msgSend(v39, sel_eventStore);

    if (v24)
    {
      id v100 = v24;
LABEL_6:
      uint64_t v101 = v24;
      if (v102 == 2)
      {
        id v41 = (void *)MEMORY[0x1E4FBC8C8];
        long long v42 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v9) + 0x170);
        id v43 = v23;
        v42(0);
        id v44 = sub_1B40FBFBC();
        if (*(void *)(v45 + 8)) {
          sub_1B410378C(0);
        }
        id v46 = (id)((uint64_t (*)(uint64_t *, void))v44)(aBlock, 0);
        id v32 = v100;
        goto LABEL_37;
      }
      if (v102 == 1)
      {
        if (a2)
        {
          uint64_t v97 = *(uint64_t (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v9) + 0x168);
          uint64_t v25 = v97(v23);
          if (v25)
          {
            id v26 = (void *)v25;
            if (a4 && a5 && a6)
            {
              sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
              sub_1B40F9D30();
              id v27 = v26;
              uint64_t v98 = (void *)sub_1B411E878();
              id v28 = (void *)sub_1B411E878();
              id v29 = (void *)sub_1B411E878();
              id v30 = v27;
              id v31 = (void *)sub_1B411E878();
              id v32 = v100;
              uint64_t v33 = (uint64_t (*)(void *))objc_msgSend(v100, sel_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_, v30, v98, v28, v29, v31);

              uint64_t v97 = v33;
              if (!v33)
              {
LABEL_91:

                __break(1u);
                goto LABEL_92;
              }

              if (a8 >> 60 != 15)
              {
                id v34 = objc_allocWithZone(MEMORY[0x1E4F25620]);
                id v35 = v97;
                sub_1B40FFE8C(a7, a8);
                uint64_t v36 = (void *)sub_1B411E468();
                id v37 = objc_msgSend(v34, sel_initWithData_, v36);

                if (v37)
                {
                  id v38 = objc_msgSend(v35, sel_CADObjectID);

                  objc_msgSend(v100, sel_cacheConstraints_forObjectWithCADObjectID_, v37, v38);
                  sub_1B40FFEF8(a7, a8);
                  uint64_t v97 = v35;
                  goto LABEL_86;
                }

                sub_1B40FFEF8(a7, a8);
              }
              sub_1B411EA18();
              id v93 = (id)*v16;
              sub_1B411E578();

              goto LABEL_86;
            }
            uint64_t v97 = (uint64_t (*)(void *))v25;
            uint64_t v73 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs;
            if (*(void *)((char *)v9
                           + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs)
              && *(void *)((char *)v9
                           + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs)
              && *(void *)((char *)v9
                           + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs))
            {
              sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
              sub_1B40F9D30();
              id v74 = v97;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              id v75 = (void *)sub_1B411E878();
              id v76 = (void *)sub_1B411E9C8();
              swift_bridgeObjectRelease();
              uint64_t v77 = (void *)sub_1B411E9C8();
              swift_bridgeObjectRelease();
              id v78 = (void *)sub_1B411E9C8();
              swift_bridgeObjectRelease();
              id v32 = v100;
              id v79 = (uint64_t (*)(void *))objc_msgSend(v100, sel_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs_, v74, v75, v76, v77, v78);

              id v41 = (void *)MEMORY[0x1E4FBC8C8];
              uint64_t v97 = v79;
              if (!v79)
              {
LABEL_92:

                __break(1u);
                return;
              }

              goto LABEL_87;
            }
            os_log_type_t v80 = sub_1B411EA18();
            id v81 = *v16;
            id v82 = v9;
            if (os_log_type_enabled(v81, v80))
            {
              id v83 = v82;
              loga = v81;
              uint64_t v84 = swift_slowAlloc();
              uint64_t v85 = swift_slowAlloc();
              aBlock[0] = v85;
              uint64_t v86 = *(void *)((char *)v9 + v73);
              *(_DWORD *)uint64_t v84 = 136315650;
              if (v86) {
                uint64_t v87 = 20302;
              }
              else {
                uint64_t v87 = 5457241;
              }
              if (v86) {
                unint64_t v88 = 0xE200000000000000;
              }
              else {
                unint64_t v88 = 0xE300000000000000;
              }
              sub_1B40DFA70(v87, v88, aBlock);
              sub_1B411EAF8();

              swift_bridgeObjectRelease();
              *(_WORD *)(v84 + 12) = 2080;
              if (*(void *)&v83[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs]) {
                uint64_t v89 = 20302;
              }
              else {
                uint64_t v89 = 5457241;
              }
              if (*(void *)&v83[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs]) {
                unint64_t v90 = 0xE200000000000000;
              }
              else {
                unint64_t v90 = 0xE300000000000000;
              }
              sub_1B40DFA70(v89, v90, aBlock);
              sub_1B411EAF8();

              swift_bridgeObjectRelease();
              *(_WORD *)(v84 + 22) = 2080;
              if (*(void *)&v83[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs]) {
                uint64_t v91 = 20302;
              }
              else {
                uint64_t v91 = 5457241;
              }
              if (*(void *)&v83[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs]) {
                unint64_t v92 = 0xE200000000000000;
              }
              else {
                unint64_t v92 = 0xE300000000000000;
              }
              sub_1B40DFA70(v91, v92, aBlock);
              sub_1B411EAF8();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_1B3F4C000, loga, v80, "EKEventEditViewControllerOOPImpl remoteEventEditViewControllerDidComplete: some or all preCommit ObjectIDs are nil. nil states: [%s, %s, %s]", (uint8_t *)v84, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x1BA986180](v85, -1, -1);
              MEMORY[0x1BA986180](v84, -1, -1);
            }
            else
            {
            }
            id v32 = v100;
LABEL_86:
            id v41 = (void *)MEMORY[0x1E4FBC8C8];
LABEL_87:
            unint64_t v94 = sub_1B40FBFBC();
            if (*(void *)(v95 + 8))
            {
              uint64_t v96 = v97;
              sub_1B410378C((uint64_t)v97);
              ((void (*)(uint64_t *, void))v94)(aBlock, 0);
            }
            else
            {
              ((void (*)(uint64_t *, void))v94)(aBlock, 0);
            }
            goto LABEL_37;
          }
        }
        else
        {
          id v49 = v23;
        }
        os_log_type_t v50 = sub_1B411EA28();
        id v51 = *v16;
        id v52 = v9;
        if (os_log_type_enabled(v51, v50))
        {
          id v53 = v52;
          uint64_t v54 = v51;
          uint64_t v55 = swift_slowAlloc();
          uint64_t v56 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v55 = 138412546;
          aBlock[0] = (uint64_t)v53;
          id v57 = v53;
          sub_1B411EAF8();
          *uint64_t v56 = v9;

          *(_WORD *)(v55 + 12) = 2112;
          id v41 = (void *)MEMORY[0x1E4FBC8C8];
          uint64_t v58 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v57) + 0x168))();
          uint64_t v59 = v58;
          if (v58) {
            aBlock[0] = v58;
          }
          else {
            aBlock[0] = 0;
          }
          sub_1B411EAF8();
          v56[1] = v59;

          _os_log_impl(&dword_1B3F4C000, v54, v50, "EKEventEditViewControllerOOPImpl: vc might have disappeared after the waiting for the database update. self: %@, event: %@", (uint8_t *)v55, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
          swift_arrayDestroy();
          MEMORY[0x1BA986180](v56, -1, -1);
          MEMORY[0x1BA986180](v55, -1, -1);

          id v32 = v100;
          goto LABEL_37;
        }
      }
      else
      {
        id v46 = v23;
      }
      id v32 = v100;
      id v41 = (void *)MEMORY[0x1E4FBC8C8];
LABEL_37:
      id v60 = (void *)(*(uint64_t (**)(id))((*v41 & *v9) + 0x180))(v46);
      if (!v60)
      {
LABEL_57:

LABEL_58:
        return;
      }
      id v61 = v60;
      if (objc_msgSend(v60, sel_respondsToSelector_, sel_eventEditViewController_didCompleteWithAction_waitUntil_))
      {
        if (objc_msgSend(v61, sel_respondsToSelector_, sel_eventEditViewController_didCompleteWithAction_waitUntil_))
        {
          id v62 = v106;
          objc_msgSend(v61, sel_eventEditViewController_didCompleteWithAction_waitUntil_, v99, v102, a3);

          swift_unknownObjectRelease();
        }
        else
        {

          swift_unknownObjectRelease();
        }
        goto LABEL_58;
      }
      uint64_t v63 = (void *)(*(uint64_t (**)(void))((*v41 & *v9) + 0x168))();
      if (!v63)
      {
LABEL_56:
        objc_msgSend(v61, sel_eventEditViewController_didCompleteWithAction_, v99, v102, v97);
        swift_unknownObjectRelease();
        goto LABEL_57;
      }
      id v64 = v63;
      id v65 = objc_msgSend(v63, sel_calendar);
      if (!v65)
      {
        id v66 = v64;
        goto LABEL_55;
      }
      id v66 = v65;
      if (objc_msgSend(self, sel_realAuthorizationStatusForEntityType_, 0) != (id)3)
      {
LABEL_48:

LABEL_55:
        goto LABEL_56;
      }
      id v67 = objc_msgSend(v66, sel_source);
      if (v67)
      {
        id v68 = v67;
        unsigned __int8 v69 = objc_msgSend(v67, sel_isReadable);

        if (v69)
        {
          id v70 = (void *)swift_allocObject();
          v70[2] = v61;
          v70[3] = v99;
          v70[4] = v102;
          void aBlock[4] = (uint64_t)sub_1B40FFE60;
          aBlock[5] = (uint64_t)v70;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_1B40DE4D8;
          aBlock[3] = (uint64_t)&block_descriptor_1;
          id v71 = _Block_copy(aBlock);
          id v72 = v106;
          swift_unknownObjectRetain();
          swift_release();
          objc_msgSend(v32, sel_waitUntilDatabaseUpdatedToTimestamp_callback_, a3, v71);

          _Block_release(v71);
          swift_unknownObjectRelease();

          return;
        }
        goto LABEL_48;
      }

      __break(1u);
      goto LABEL_91;
    }
  }
  sub_1B411EA28();
  id v47 = (id)*v16;
  sub_1B411E578();

  id v48 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v9) + 0x180))();
  if (v48)
  {
    objc_msgSend(v48, sel_eventEditViewController_didCompleteWithAction_, v99, v102);
    swift_unknownObjectRelease();
  }
LABEL_19:
}

void *sub_1B40FE444()
{
  unint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40FE50C(void *a1)
{
  sub_1B40FFF64(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore, (void (*)(void *))sub_1B41036FC);
}

uint64_t sub_1B40FE560@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x150))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40FE5C4(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x158);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B40FE634(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B40FE6A0;
}

void sub_1B40FE6A0(void **a1, char a2)
{
}

void *sub_1B40FE6C4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40FE78C(void *a1)
{
  sub_1B40FFF64(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event, (void (*)(void *))sub_1B410378C);
}

uint64_t sub_1B40FE7E0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x168))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40FE844(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x170);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B40FE8B4(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B40FE920;
}

void sub_1B40FE920(void **a1, char a2)
{
}

uint64_t sub_1B40FE994()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B40FEA48(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_1B40FEA9C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x180))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40FEB00(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x188);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B40FEB6C())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B40FEBC8()
{
  return sub_1B40FF558((void (*)(void *))sub_1B410381C);
}

void *sub_1B40FEC04()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40FECCC(void *a1)
{
  sub_1B40FFF64(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar, sub_1B4103B48);
}

uint64_t sub_1B40FED20@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1A0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40FED84(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1A8);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B40FEDF4(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B40FEE60;
}

void sub_1B40FEE60(void **a1, char a2)
{
}

id sub_1B40FEE84(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *sub_1B40FEECC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B40FEF94(void *a1)
{
  sub_1B40FFF64(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor, sub_1B4103DBC);
}

uint64_t sub_1B40FEFE8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1B8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B40FF04C(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1C0);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B40FF0BC(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B40FF128;
}

void sub_1B40FF128(void **a1, char a2)
{
}

void sub_1B40FF140(void **a1, char a2, void (*a3)(void *))
{
  os_log_type_t v5 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    id v6 = sub_1B40FBFBC();
    if (*(void *)(v7 + 8))
    {
      uint64_t v8 = (void **)(v5[7] + v5[8]);
      swift_beginAccess();
      uint64_t v9 = *v8;
      id v10 = v9;
      a3(v9);
    }
    ((void (*)(void *, void))v6)(v5, 0);
  }

  free(v5);
}

uint64_t sub_1B40FF1F8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  swift_beginAccess();
  id v2 = (void *)v1[1];
  if (v2)
  {
    id v3 = (void *)v1[9];
    uint64_t v4 = (void *)v1[8];
    uint64_t v6 = v1[5];
    uint64_t v5 = v1[6];
    uint64_t v8 = v1[3];
    uint64_t v7 = v1[4];
    uint64_t v9 = v1[2];
    uint64_t v16 = *v1;
    uint64_t v15 = v1[7];
    id v10 = v2;
    sub_1B40DA260(v9);
    sub_1B40DA260(v7);
    sub_1B40DA260(v5);
    swift_bridgeObjectRetain();
    id v11 = v4;
    id v12 = v3;
    char v13 = sub_1B4103E18();
    sub_1B40FFACC(v16, v2, v9, v8, v7, v6, v5, v15, v4, v3);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1B40FF4E0()
{
  return sub_1B40FF558((void (*)(void *))sub_1B4103E74);
}

uint64_t sub_1B40FF510()
{
  return sub_1B40FF558((void (*)(void *))sub_1B4103F34);
}

uint64_t sub_1B40FF540()
{
  return sub_1B40FF558((void (*)(void *))sub_1B4103FF4);
}

uint64_t sub_1B40FF558(void (*a1)(void *))
{
  id v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  uint64_t result = swift_beginAccess();
  uint64_t v5 = (void *)v3[1];
  if (v5)
  {
    uint64_t v6 = (void *)v3[9];
    uint64_t v16 = a1;
    uint64_t v7 = (void *)v3[8];
    uint64_t v9 = v3[5];
    uint64_t v8 = v3[6];
    uint64_t v11 = v3[3];
    uint64_t v10 = v3[4];
    uint64_t v12 = v3[2];
    uint64_t v17 = *v3;
    uint64_t v13 = v3[7];
    id v14 = v5;
    sub_1B40DA260(v12);
    sub_1B40DA260(v10);
    sub_1B40DA260(v8);
    swift_bridgeObjectRetain();
    id v15 = v7;
    v16(v6);
    return sub_1B40FFACC(v17, v5, v12, v11, v10, v9, v8, v13, v7, v6);
  }
  return result;
}

void sub_1B40FF6CC(char *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = (uint64_t *)&a1[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView];
  swift_beginAccess();
  uint64_t v6 = (void *)v5[1];
  if (v6)
  {
    uint64_t v17 = a3;
    uint64_t v7 = (void *)v5[9];
    uint64_t v9 = v5[7];
    uint64_t v8 = (void *)v5[8];
    uint64_t v14 = v5[5];
    uint64_t v15 = v5[6];
    uint64_t v12 = v5[3];
    uint64_t v13 = v5[4];
    uint64_t v10 = *v5;
    uint64_t v11 = v5[2];
    uint64_t v16 = a1;
    sub_1B40FFB74(v10, v6, v11, v12, v13, v14, v15, v9, v8, v7);
    v17();
    sub_1B40FFACC(v10, v6, v11, v12, v13, v14, v15, v9, v8, v7);
  }
}

id EKEventEditViewControllerOOPImpl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventEditViewControllerOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_1B40FF998@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x2D0], 8) = 0;
  return result;
}

void sub_1B40FF9A8(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_1B40FF9B4()
{
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  *((_OWORD *)v1 + 6) = 0u;
  *((void *)v1 + 14) = 0;
  uint64_t v2 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventEditOOPHostViewModel();
  *(void *)&v0[v2] = sub_1B4101D38();
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor] = 0;

  sub_1B411ECC8();
  __break(1u);
}

uint64_t sub_1B40FFACC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  if (a2)
  {

    sub_1B40DA270(a3);
    sub_1B40DA270(a5);
    sub_1B40DA270(a7);

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1B40FFB74(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  if (a2)
  {
    id v13 = a2;
    sub_1B40DA260(a3);
    sub_1B40DA260(a5);
    sub_1B40DA260(a7);
    swift_bridgeObjectRetain();
    id v14 = a9;
    id v15 = a10;
  }
}

uint64_t sub_1B40FFC28()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B40FFC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t v11 = (void *)MEMORY[0x1BA986210](v5 + 16);
  if (v11)
  {
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v11) + 0x140))(a1, a2, a3, a4, a5);
  }
}

void sub_1B40FFD30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_beginAccess();
  uint64_t v17 = (void *)MEMORY[0x1BA986210](v8 + 16);
  if (v17)
  {
    id v18 = v17;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v17) + 0x148))(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t sub_1B40FFE20()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

id sub_1B40FFE60()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_eventEditViewController_didCompleteWithAction_, *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1B40FFE8C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B40FFEA0(a1, a2);
  }
  return a1;
}

uint64_t sub_1B40FFEA0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1B40FFEF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B40FFF0C(a1, a2);
  }
  return a1;
}

uint64_t sub_1B40FFF0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1B40FFF64(void *a1, void *a2, void (*a3)(void *))
{
  uint64_t v6 = (void **)(v3 + *a2);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *uint64_t v6 = a1;
  id v8 = a1;

  uint64_t v9 = sub_1B40FBFBC();
  if (*(void *)(v10 + 8))
  {
    swift_beginAccess();
    uint64_t v11 = *v6;
    id v12 = v11;
    a3(v11);
  }
  return ((uint64_t (*)(unsigned char *, void))v9)(v14, 0);
}

uint64_t method lookup function for EKEventEditViewControllerOOPImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKEventEditViewControllerOOPImpl);
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.eventStore.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.eventStore.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.eventStore.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.event.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.event.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.event.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editViewDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editViewDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editViewDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.cancelEditing()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.defaultCalendar.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.defaultCalendar.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.defaultCalendar.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editorBackgroundColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editorBackgroundColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editorBackgroundColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.hasUnsavedChanges()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.focusAndSelectTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.focusAndSelectStartDate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.focusTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E8))();
}

uint64_t sub_1B41004EC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B4100534(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel_remoteUIConfigured);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1B4100580())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B41005DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B4100650@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x80))();
  *a2 = result;
  return result;
}

uint64_t sub_1B41006AC(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x88);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1B4100710()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1B411E5E8();
}

void (*sub_1B410077C(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B4100808;
}

uint64_t sub_1B410080C()
{
  return sub_1B4100B90((uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__configuration, &qword_1E9CFCAE8);
}

uint64_t sub_1B4100820(uint64_t a1)
{
  return sub_1B4100C14(a1, &qword_1E9CFCAF0, (uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__configuration, &qword_1E9CFCAE8);
}

void (*sub_1B410083C(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCAF0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCAE8);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B410094C;
}

uint64_t sub_1B4100950()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B41009C4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xB0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B4100A20(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xB8);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1B4100A84()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1B411E5E8();
}

void (*sub_1B4100AF0(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B4100808;
}

uint64_t sub_1B4100B7C()
{
  return sub_1B4100B90((uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__backgroundColor, &qword_1E9CFCAF8);
}

uint64_t sub_1B4100B90(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_1B4100BF8(uint64_t a1)
{
  return sub_1B4100C14(a1, &qword_1E9CFCB00, (uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__backgroundColor, &qword_1E9CFCAF8);
}

uint64_t sub_1B4100C14(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

void (*sub_1B4100D44(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB00);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__backgroundColor;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCAF8);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B410094C;
}

id sub_1B4100E54(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1B4100E98(a1, a2);
}

id sub_1B4100E98(uint64_t a1, uint64_t a2)
{
  v2[OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel_remoteUIConfigured] = 0;
  type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
  id v5 = v2;
  sub_1B40DCAB8(a1, a2);
  swift_beginAccess();
  sub_1B411E598();
  swift_endAccess();
  id v6 = objc_msgSend(self, sel_whiteColor);
  uint64_t v7 = MEMORY[0x1BA984370](v6);
  swift_beginAccess();
  uint64_t v10 = v7;
  sub_1B411E598();
  swift_endAccess();

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for EKEventGenericDetailOOPHostViewModel()
{
  uint64_t result = qword_1E9CFDD10;
  if (!qword_1E9CFDD10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_1B4101048()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B410113C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

uint64_t sub_1B410117C()
{
  return type metadata accessor for EKEventGenericDetailOOPHostViewModel();
}

void sub_1B4101184()
{
  sub_1B410125C();
  if (v0 <= 0x3F)
  {
    sub_1B41012B4();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1B410125C()
{
  if (!qword_1E9CFCB08)
  {
    type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(255);
    unint64_t v0 = sub_1B411E5F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9CFCB08);
    }
  }
}

void sub_1B41012B4()
{
  if (!qword_1E9CFCB10)
  {
    unint64_t v0 = sub_1B411E5F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9CFCB10);
    }
  }
}

uint64_t sub_1B410130C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B4101354(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_remoteUIConfigured);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1B41013A0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B41013FC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B4101470@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B41014CC(uint64_t a1, void **a2)
{
  objc_super v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xA8);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1B4101530()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1B411E5E8();
}

void (*sub_1B410159C(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B40DCEB0;
}

uint64_t sub_1B4101628()
{
  return swift_endAccess();
}

uint64_t sub_1B410168C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB28);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB20);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1B41017B8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB28);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB20);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B40DD1B8;
}

void *sub_1B41018C8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_event);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4101918(void *a1)
{
}

uint64_t (*sub_1B4101924())()
{
  return j_j__swift_endAccess;
}

void *sub_1B4101980()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_eventStore);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B41019D0(void *a1)
{
}

uint64_t (*sub_1B41019DC())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B4101A38()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_layoutDirection;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B4101A80(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_layoutDirection);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_1B4101ACC())()
{
  return j_j__swift_endAccess;
}

id sub_1B4101B28()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1B4101B80(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B4101BD4())()
{
  return j_j__swift_endAccess;
}

void *sub_1B4101C30()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4101C80(void *a1)
{
}

void sub_1B4101C8C(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
}

uint64_t (*sub_1B4101CDC())()
{
  return j_j__swift_endAccess;
}

id sub_1B4101D38()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id sub_1B4101D6C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB20);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_remoteUIConfigured] = 0;
  uint64_t v5 = &v0[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel__configuration];
  type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
  size_t v6 = v0;
  uint64_t v13 = sub_1B4105BD0();
  sub_1B411E598();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_event] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_eventStore] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_layoutDirection] = 0;
  uint64_t v7 = (void *)*MEMORY[0x1E4FB27F0];
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_sizeCategory] = *MEMORY[0x1E4FB27F0];
  *(void *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_viewHierarchy] = 0;
  id v8 = v7;

  objc_super v9 = (objc_class *)type metadata accessor for EKEventEditOOPHostViewModel();
  v12.receiver = v6;
  v12.super_class = v9;
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t type metadata accessor for EKEventEditOOPHostViewModel()
{
  uint64_t result = qword_1E9CFDDC0;
  if (!qword_1E9CFDDC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_1B4101F64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventEditOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B4102050@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKEventEditOOPHostViewModel();
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

uint64_t sub_1B4102090()
{
  return type metadata accessor for EKEventEditOOPHostViewModel();
}

void sub_1B4102098()
{
  sub_1B4102158();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1B4102158()
{
  if (!qword_1E9CFCB30)
  {
    type metadata accessor for _AppExtensionEventEditHostView.Configuration(255);
    unint64_t v0 = sub_1B411E5F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9CFCB30);
    }
  }
}

UIColor_optional __swiftcall UIViewController.EKUI_oopContentBackgroundColor()()
{
  unint64_t v0 = 0;
  result.value.super.isa = v0;
  return result;
}

id sub_1B41021B8()
{
  return 0;
}

double sub_1B41021C0@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for EKEventEditOOPHostViewModel();
  sub_1B4104128(&qword_1E9CFCB40, (void (*)(uint64_t))type metadata accessor for EKEventEditOOPHostViewModel);
  *(void *)a1 = sub_1B411E628();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v2;
  *(void *)(a1 + 112) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(unsigned char *)(a1 + 80) = 0;
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = 0;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  return result;
}

uint64_t sub_1B410225C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v45 = a1;
  uint64_t v41 = sub_1B411E618();
  MEMORY[0x1F4188790](v41);
  long long v42 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B411E9B8();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  MEMORY[0x1F4188790](v4);
  size_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB48);
  MEMORY[0x1F4188790](v40);
  id v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v46 = *v1;
  objc_super v9 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & **((void **)&v46 + 1)) + 0xA0);
  id v10 = *((id *)&v46 + 1);
  v9();
  sub_1B40DA960((uint64_t)&v46);
  type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
  sub_1B4104128(&qword_1E9CFCB50, (void (*)(uint64_t))type metadata accessor for _AppExtensionEventEditHostView.Configuration);
  uint64_t v39 = sub_1B411E628();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v13 + 96) = v14;
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(v2 + 96);
  *(void *)(v13 + 12_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(v2 + 112);
  long long v15 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v13 + 32) = v15;
  long long v16 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v13 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v13 + 64) = v16;
  uint64_t v17 = swift_allocObject();
  long long v18 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v17 + 96) = v18;
  *(_OWORD *)(v17 + 112) = *(_OWORD *)(v2 + 96);
  *(void *)(v17 + 12_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(v2 + 112);
  long long v19 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v17 + 32) = v19;
  long long v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v17 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v17 + 64) = v20;
  uint64_t v21 = swift_allocObject();
  long long v22 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v21 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v21 + 64) = v22;
  long long v23 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v21 + 32) = v23;
  *(void *)(v21 + 12_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(v2 + 112);
  long long v24 = *(_OWORD *)(v2 + 96);
  long long v25 = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v21 + 96) = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v21 + 112) = v24;
  *(_OWORD *)(v21 + 80) = v25;
  id v26 = *(void (**)(uint64_t (*)(), uint64_t))(*(void *)v12 + 536);
  sub_1B41043E4(v2);
  sub_1B41043E4(v2);
  sub_1B41043E4(v2);
  swift_retain();
  swift_retain();
  v26(sub_1B41042F0, v21);
  swift_retain();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v26) = sub_1B411E718();
  unsigned __int8 v27 = sub_1B411E728();
  unsigned __int8 v28 = sub_1B411E748();
  char v29 = sub_1B411E738();
  sub_1B411E738();
  if (sub_1B411E738() != v26) {
    char v29 = sub_1B411E738();
  }
  sub_1B411E738();
  if (sub_1B411E738() != v27) {
    char v29 = sub_1B411E738();
  }
  sub_1B411E738();
  if (sub_1B411E738() != v28) {
    char v29 = sub_1B411E738();
  }
  uint64_t v38 = sub_1B411E638();
  uint64_t v30 = swift_allocObject();
  long long v31 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v30 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v30 + 96) = v31;
  *(_OWORD *)(v30 + 112) = *(_OWORD *)(v2 + 96);
  *(void *)(v30 + 12_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(v2 + 112);
  long long v32 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v30 + 32) = v32;
  long long v33 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v30 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v30 + 64) = v33;
  sub_1B41043E4(v2);
  sub_1B411E9A8();
  id v34 = v42;
  uint64_t v36 = v43;
  uint64_t v35 = v44;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(&v42[*(int *)(v41 + 20)], v6, v44);
  *id v34 = &unk_1E9CFCB60;
  v34[1] = v30;
  sub_1B40DC65C((uint64_t)v34, (uint64_t)&v8[*(int *)(v40 + 36)]);
  *(void *)id v8 = v39;
  *((void *)v8 + 1) = v12;
  *((void *)v8 + 2) = sub_1B4104220;
  *((void *)v8 + 3) = v17;
  *((void *)v8 + 4) = sub_1B4104174;
  *((void *)v8 + 5) = v13;
  *((void *)v8 + 6) = v38;
  v8[56] = v29;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1B40DC6C0((uint64_t)v34);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v35);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B4104590((uint64_t)v8, v45);
}

uint64_t sub_1B410279C(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_1B411E4F8();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_1B411E518();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_1B411E538();
  v1[12] = v4;
  v1[13] = *(void *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1B411E998();
  v1[16] = sub_1B411E988();
  uint64_t v6 = sub_1B411E968();
  v1[17] = v6;
  v1[18] = v5;
  return MEMORY[0x1F4188298](sub_1B410294C, v6, v5);
}

uint64_t sub_1B410294C()
{
  sub_1B411B9E4();
  swift_bridgeObjectRetain();
  sub_1B411E4E8();
  sub_1B411E528();
  sub_1B411E508();
  v0[19] = sub_1B411E988();
  uint64_t v1 = sub_1B4104128((unint64_t *)&unk_1E9CFC370, MEMORY[0x1E4F25828]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1B4102A94;
  uint64_t v3 = v0[6];
  return MEMORY[0x1F4187C78](v0 + 2, v3, v1);
}

uint64_t sub_1B4102A94()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 16_Block_object_dispose(&STACK[0x2D0], 8) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  if (v0)
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B4102ECC;
  }
  else
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B4102C2C;
  }
  return MEMORY[0x1F4188298](v7, v4, v6);
}

uint64_t sub_1B4102C2C()
{
  swift_release();
  v0[22] = v0[2];
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B4102C98, v1, v2);
}

uint64_t sub_1B4102C98()
{
  if (v0[22])
  {
    return MEMORY[0x1F4188298](sub_1B4102DC4, 0, 0);
  }
  else
  {
    uint64_t v2 = v0[7];
    uint64_t v1 = v0[8];
    uint64_t v3 = v0[6];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    uint64_t v5 = v0[13];
    uint64_t v4 = v0[14];
    uint64_t v6 = v0[12];
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_1B4102DC4()
{
  *(void *)(v0 + 184) = sub_1B411E988();
  uint64_t v2 = sub_1B411E968();
  return MEMORY[0x1F4188298](sub_1B4102E50, v2, v1);
}

uint64_t sub_1B4102E50()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = (long long *)v0[5];
  swift_release();
  sub_1B4103178(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40DB0BC, v3, v4);
}

uint64_t sub_1B4102ECC()
{
  v0[3] = v0[21];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFCC80);
  swift_willThrowTypedImpl();
  swift_release();
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B4102F60, v1, v2);
}

uint64_t sub_1B4102F60()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1B411EA18();
  uint64_t v4 = *sub_1B40EC57C();
  os_log_type_t v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    uint64_t v6 = (void *)v0[21];
    id v7 = v6;
    id v8 = v6;
    uint64_t v9 = v4;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v6;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v13;
    sub_1B411EAF8();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_1B3F4C000, v9, v5, "EKEventEditOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v11, -1, -1);
    MEMORY[0x1BA986180](v10, -1, -1);
  }
  else
  {
    uint64_t v6 = (void *)v0[21];
  }

  uint64_t v15 = v0[13];
  uint64_t v14 = v0[14];
  uint64_t v16 = v0[12];
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void sub_1B4103178(uint64_t a1, long long *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1B411E568();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = &v38[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v14 = &v38[-v13];
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = &v38[-v15];
  if (!*(void *)(a1 + 16))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  uint64_t v17 = *(void (**)(unsigned char *, unint64_t, uint64_t))(v8 + 16);
  v17(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_1B40E1C58((uint64_t)v6, &qword_1E9CFC168);
    sub_1B411EA18();
    id v30 = (id)*sub_1B40EC57C();
    sub_1B411E578();

    return;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v16, v6, v7);
  long long v46 = *a2;
  long long v18 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **((void **)&v46 + 1)) + 0x90);
  uint64_t v43 = *((void *)&v46 + 1);
  long long v42 = *((id *)&v46 + 1);
  v18(1);
  sub_1B40DA960((uint64_t)&v46);
  os_log_type_t v19 = sub_1B411EA28();
  long long v20 = *sub_1B40EC57C();
  v17(v14, (unint64_t)v16, v7);
  v17(v11, (unint64_t)v16, v7);
  if (os_log_type_enabled(v20, v19))
  {
    os_log_t v41 = v20;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v45 = v40;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v22 = sub_1B411E548();
    uint64_t v44 = sub_1B40DFA70(v22, v23, &v45);
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    int v39 = v19;
    long long v24 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v24(v14, v7);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v25 = sub_1B411E558();
    uint64_t v44 = sub_1B40DFA70(v25, v26, &v45);
    unsigned __int8 v27 = v24;
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    v24(v11, v7);
    os_log_t v28 = v41;
    _os_log_impl(&dword_1B3F4C000, v41, (os_log_type_t)v39, "EventKitUI AppExtensionQuery Found %s (%s) RemoteUI Extension", (uint8_t *)v21, 0x16u);
    uint64_t v29 = v40;
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v29, -1, -1);
    MEMORY[0x1BA986180](v21, -1, -1);
  }
  else
  {
    unsigned __int8 v27 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v27(v14, v7);
    v27(v11, v7);
  }
  long long v31 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v42) + 0xA0);
  long long v32 = v42;
  uint64_t v33 = v31();
  sub_1B40DA960((uint64_t)&v46);
  id v34 = (uint64_t *)sub_1B411BA40();
  uint64_t v35 = *v34;
  uint64_t v36 = v34[1];
  id v37 = *(void (**)(unsigned char *, uint64_t, uint64_t, void *))(*(void *)v33 + 656);
  sub_1B40DC424((uint64_t)&v46);
  swift_bridgeObjectRetain();
  v37(v16, v35, v36, v32);
  sub_1B40DA960((uint64_t)&v46);
  swift_release();
  swift_bridgeObjectRelease();
  v27(v16, v7);
}

void sub_1B41036FC(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 8);
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0xF0);
  uint64_t v5 = v3;
  v4(a1);
}

void sub_1B410378C(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 8);
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0xD8);
  uint64_t v5 = v3;
  v4(a1);
}

uint64_t sub_1B410381C()
{
  long long v4 = *v0;
  uint64_t v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  uint64_t v2 = sub_1B40DA960((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(void *)v1 + 520))(v2);
  return swift_release();
}

uint64_t sub_1B41038DC()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
  uint64_t v3 = *(void **)(v0 + 64);
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_calendarIdentifier);
    sub_1B411E8C8();

    uint64_t v5 = sub_1B411E898();
    swift_bridgeObjectRelease();

    id v2 = (id)v5;
  }
  uint64_t v6 = *(void **)(v1 + 8);
  uint64_t v7 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v8 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v6) + 0xA0);
  uint64_t v9 = v6;
  uint64_t v10 = v8();

  uint64_t v11 = *(uint64_t (**)(unsigned char *))(*(void *)v10 + 384);
  swift_unknownObjectRetain();
  uint64_t v12 = (void (*)(unsigned char *, void))v11(v24);
  uint64_t v14 = v13;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v14;
  uint64_t *v14 = 0x8000000000000000;
  sub_1B40FA61C((uint64_t)v2, 0xD000000000000011, 0x80000001B4148EE0, isUniquelyReferenced_nonNull_native);
  uint64_t *v14 = v23;
  swift_bridgeObjectRelease();
  v12(v24, 0);
  swift_release();
  uint64_t v16 = *(void **)(v1 + 8);
  uint64_t v17 = *(uint64_t (**)(void))((*v7 & *v16) + 0xA0);
  long long v18 = v16;
  uint64_t v19 = v17();

  long long v20 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v19 + 408))(v24);
  BOOL *v21 = !*v21;
  v20(v24, 0);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_1B4103B48(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 64);
  id v4 = a1;

  *(void *)(v1 + 64) = a1;
  sub_1B41038DC();
}

uint64_t sub_1B4103BA4()
{
  uint64_t v1 = v0;
  id v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xA0);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  uint64_t v7 = *(void **)(v1 + 72);
  if (v7)
  {
    id v8 = *(id *)(v1 + 72);
  }
  else
  {
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
    uint64_t v7 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(unsigned char *))(*(void *)v6 + 384);
  id v10 = v7;
  uint64_t v11 = (void (*)(unsigned char *, void))v9(v23);
  uint64_t v13 = v12;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v22 = *v13;
  *uint64_t v13 = 0x8000000000000000;
  sub_1B40FA61C((uint64_t)v8, 0xD000000000000015, 0x80000001B41488A0, isUniquelyReferenced_nonNull_native);
  *uint64_t v13 = v22;
  swift_bridgeObjectRelease();
  v11(v23, 0);
  swift_release();
  uint64_t v15 = *(void **)(v1 + 8);
  uint64_t v16 = *(uint64_t (**)(void))((*v3 & *v15) + 0xA0);
  uint64_t v17 = v15;
  uint64_t v18 = v16();

  uint64_t v19 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v18 + 408))(v23);
  BOOL *v20 = !*v20;
  v19(v23, 0);
  return swift_release();
}

void sub_1B4103DBC(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 72);
  id v4 = a1;

  *(void *)(v1 + 72) = a1;
  sub_1B4103BA4();
}

uint64_t sub_1B4103E18()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 48);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = swift_retain();
  char v3 = v1(v2);
  sub_1B40DA270((uint64_t)v1);
  return v3 & 1;
}

uint64_t sub_1B4103E74()
{
  long long v4 = *v0;
  uint64_t v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  uint64_t v2 = sub_1B40DA960((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(void *)v1 + 576))(v2);
  return swift_release();
}

uint64_t sub_1B4103F34()
{
  long long v4 = *v0;
  uint64_t v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  uint64_t v2 = sub_1B40DA960((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(void *)v1 + 608))(v2);
  return swift_release();
}

uint64_t sub_1B4103FF4()
{
  long long v4 = *v0;
  uint64_t v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  uint64_t v2 = sub_1B40DA960((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(void *)v1 + 640))(v2);
  return swift_release();
}

uint64_t sub_1B41040B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1B410225C(a1);
}

uint64_t type metadata accessor for _AppExtensionEventEditHostView.Configuration(uint64_t a1)
{
  return sub_1B40E01B8(a1, (uint64_t *)&unk_1E9CFE180);
}

uint64_t sub_1B4104128(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B4104174(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v6)
  {
    uint64_t v11 = result;
    swift_retain();
    v6(v11, a2, a3, a4, a5);
    return sub_1B40DA270((uint64_t)v6);
  }
  return result;
}

uint64_t sub_1B4104220(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 32);
  if (v9)
  {
    uint64_t v17 = result;
    swift_retain();
    v9(v17, a2, a3, a4, a5, a6, a7, a8);
    return sub_1B40DA270((uint64_t)v9);
  }
  return result;
}

uint64_t sub_1B41042F0()
{
  long long v7 = *(_OWORD *)(v0 + 16);
  uint64_t v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v7 + 1)) + 0xA0))(*((id *)&v7 + 1));
  uint64_t v2 = sub_1B40DA960((uint64_t)&v7);
  char v3 = (uint64_t (*)(uint64_t))(*(uint64_t (**)(uint64_t))(*(void *)v1 + 528))(v2);
  uint64_t v4 = swift_release();
  if (v3)
  {
    char v5 = v3(v4);
    sub_1B40DA270((uint64_t)v3);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_1B41043E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  char v5 = *(void **)(a1 + 64);
  uint64_t v6 = *(void **)(a1 + 72);
  id v7 = *(id *)(a1 + 8);
  sub_1B40DA260(v2);
  sub_1B40DA260(v3);
  sub_1B40DA260(v4);
  swift_bridgeObjectRetain();
  id v8 = v5;
  id v9 = v6;
  return a1;
}

uint64_t objectdestroyTm_1()
{
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  if (*(void *)(v0 + 48)) {
    swift_release();
  }
  if (*(void *)(v0 + 64)) {
    swift_release();
  }

  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 136, 7);
}

uint64_t sub_1B41044FC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1B40DC568;
  return sub_1B410279C(v0 + 16);
}

uint64_t sub_1B4104590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B41045F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1B40E00C8(v3, a1);
}

uint64_t sub_1B410464C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B41046A8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4104704()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sceneID);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B410475C(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)(v2 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sceneID);
  swift_beginAccess();
  *char v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B41047BC())()
{
  return j_j__swift_endAccess;
}

void *sub_1B4104818()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_event);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4104868(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_event);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B41048BC())()
{
  return j_j__swift_endAccess;
}

void *sub_1B4104918()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_eventStore);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4104968(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_eventStore);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B41049BC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4104A18()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_layoutDirection;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B4104A60(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_layoutDirection);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_1B4104AAC())()
{
  return j_j__swift_endAccess;
}

id sub_1B4104B08()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sizeCategory);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1B4104B60(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sizeCategory);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B4104BB4())()
{
  return j_j__swift_endAccess;
}

void *sub_1B4104C10()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4104C60(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B4104CB4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4104D10()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B4104D5C(uint64_t a1)
{
  id v3 = (void *)(v1
                + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_changedCustomViewConfigurationDictionary);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B4104DB0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4104E0C()
{
  return sub_1B41050A4();
}

uint64_t sub_1B4104E20@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 392))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B4104E78(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 400))(*a1);
}

uint64_t sub_1B4104EC8()
{
  return sub_1B41051CC();
}

void (*sub_1B4104EDC(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B4100808;
}

uint64_t sub_1B4104F68()
{
  return sub_1B41052D0();
}

uint64_t sub_1B4104F74(uint64_t a1)
{
  return sub_1B410533C(a1);
}

void (*sub_1B4104F80(void *a1))(uint64_t, char)
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B410094C;
}

uint64_t sub_1B4105090()
{
  return sub_1B41050A4();
}

uint64_t sub_1B41050A4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B4105110@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 440))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B4105168(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 448))(*a1);
}

uint64_t sub_1B41051B8()
{
  return sub_1B41051CC();
}

uint64_t sub_1B41051CC()
{
  return sub_1B411E5E8();
}

void (*sub_1B4105238(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B4100808;
}

uint64_t sub_1B41052C4()
{
  return sub_1B41052D0();
}

uint64_t sub_1B41052D0()
{
  return swift_endAccess();
}

uint64_t sub_1B4105330(uint64_t a1)
{
  return sub_1B410533C(a1);
}

uint64_t sub_1B410533C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1B4105468(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__navigationDoneButtonTapPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B410094C;
}

uint64_t sub_1B4105578()
{
  uint64_t v1 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v0 + 456))(v4);
  *uint64_t v2 = !*v2;
  return v1(v4, 0);
}

uint64_t sub_1B41055F8()
{
  return sub_1B4105A08(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback, (void (*)(void, void))sub_1B40DA260);
}

uint64_t sub_1B4105618(uint64_t a1, uint64_t a2)
{
  return sub_1B4105A90(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40DA270);
}

uint64_t (*sub_1B4105638())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B4105694())(void)
{
  uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)v0 + 496))();
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1B40DA270(v2);
  }
  return result;
}

uint64_t sub_1B4105714()
{
  return sub_1B4105A08(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction, (void (*)(void, void))sub_1B40E1D64);
}

uint64_t sub_1B4105734(uint64_t a1, uint64_t a2)
{
  return sub_1B4105A90(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction, (uint64_t (*)(uint64_t, uint64_t))sub_1B40E1D68);
}

uint64_t (*sub_1B4105754())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B41057B0()
{
  return sub_1B4105A08(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback, (void (*)(void, void))sub_1B40DA260);
}

uint64_t sub_1B41057D0(uint64_t a1, uint64_t a2)
{
  return sub_1B4105A90(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40DA270);
}

uint64_t (*sub_1B41057F0())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B410584C())(void)
{
  uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)v0 + 552))();
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1B40DA270(v2);
  }
  return result;
}

uint64_t sub_1B41058CC()
{
  return sub_1B4105A08(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback, (void (*)(void, void))sub_1B40DA260);
}

uint64_t sub_1B41058EC(uint64_t a1, uint64_t a2)
{
  return sub_1B4105A90(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40DA270);
}

uint64_t (*sub_1B410590C())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B4105968())(void)
{
  uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)v0 + 584))();
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1B40DA270(v2);
  }
  return result;
}

uint64_t sub_1B41059E8()
{
  return sub_1B4105A08(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback, (void (*)(void, void))sub_1B40DA260);
}

uint64_t sub_1B4105A08(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_1B4105A70(uint64_t a1, uint64_t a2)
{
  return sub_1B4105A90(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1B40DA270);
}

uint64_t sub_1B4105A90(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_1B4105AF4())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B4105B50())(void)
{
  uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)v0 + 616))();
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1B40DA270(v2);
  }
  return result;
}

uint64_t sub_1B4105BD0()
{
  uint64_t v0 = swift_allocObject();
  sub_1B4105C08();
  return v0;
}

uint64_t sub_1B4105C08()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity;
  uint64_t v6 = sub_1B411E568();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = (void *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sceneID);
  *id v7 = 0;
  v7[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_event) = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_eventStore) = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_viewHierarchy) = 0;
  *(void *)(v0
            + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_changedCustomViewConfigurationDictionary) = MEMORY[0x1E4FBC868];
  uint64_t v8 = v0
     + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__customViewConfigurationChangedPublisher;
  v19[15] = 0;
  sub_1B411E598();
  uint64_t v9 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v2 + 32);
  v9(v8, v4, v1);
  uint64_t v10 = v0
      + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__navigationDoneButtonTapPublisher;
  v19[14] = 0;
  sub_1B411E598();
  v9(v10, v4, v1);
  uint64_t v11 = (void *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback);
  *uint64_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = (void *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction);
  *uint64_t v12 = 0;
  v12[1] = 0;
  uint64_t v13 = (void *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback);
  *uint64_t v13 = 0;
  v13[1] = 0;
  uint64_t v14 = (void *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback);
  void *v14 = 0;
  v14[1] = 0;
  uint64_t v15 = (void *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback);
  *uint64_t v15 = 0;
  v15[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_layoutDirection) = 0;
  uint64_t v16 = (void *)*MEMORY[0x1E4FB27F0];
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sizeCategory) = *MEMORY[0x1E4FB27F0];
  id v17 = v16;
  return v0;
}

uint64_t sub_1B4105E4C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = &v30[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_1B411E568();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(unsigned char *))(*(void *)v5 + 208))(v12);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 232);
  swift_bridgeObjectRetain();
  uint64_t v16 = v15(a2, a3);
  id v17 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *a4) + 0xD0))(v16);
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 256))(v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0xE8))(v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 280))(v20);
  uint64_t v22 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x100))(v21);
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 304))(v22);
  uint64_t v24 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x118))(v23);
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 328))(v24);
  uint64_t v26 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x130))(v25);
  (*(void (**)(uint64_t))(*(void *)v5 + 352))(v26);
  unsigned __int8 v27 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v5 + 408))(v30);
  *os_log_t v28 = !*v28;
  return v27(v30, 0);
}

uint64_t sub_1B4106290()
{
  sub_1B40E1C58(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity, &qword_1E9CFC168);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__customViewConfigurationChangedPublisher;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__navigationDoneButtonTapPublisher, v2);
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback));
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback));
  return v0;
}

uint64_t sub_1B4106408()
{
  sub_1B4106290();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B4106460@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

id sub_1B41064A0(_OWORD *a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity];
  uint64_t v5 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)&v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn] = 0;
  *(void *)&v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent];
  long long v7 = a1[1];
  *(_OWORD *)uint64_t v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  *((_OWORD *)v6 + 2) = a1[2];
  v9.receiver = v3;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(uint64_t a1)
{
  return sub_1B40E01B8(a1, qword_1E9CFE190);
}

uint64_t sub_1B4106590@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1B40E00C8(v3, a1);
}

uint64_t sub_1B41065E4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B4106640())()
{
  return j_j__swift_endAccess;
}

void *sub_1B410669C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B41066EC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char *v3 = a1;
}

uint64_t (*sub_1B4106740())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B410679C()
{
  return swift_retain();
}

uint64_t sub_1B41067E8(uint64_t a1)
{
  id v3 = (void *)(v1
                + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_configurationChangedPublisherSink);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1B410683C())()
{
  return j__swift_endAccess;
}

void sub_1B4106898(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  long long v7 = (char *)v111 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC748);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v125 = (char *)v111 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B411E4B8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v124 = (char *)v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v111 - v14;
  id aBlock = 0;
  id v16 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (!v16)
  {
    id v60 = aBlock;
    id v61 = (void *)sub_1B411E458();

    swift_willThrow();
    os_log_type_t v62 = sub_1B411EA18();
    uint64_t v63 = *sub_1B40EC57C();
    if (!os_log_type_enabled(v63, v62))
    {

      return;
    }
    id v64 = v61;
    id v65 = v61;
    id v66 = v63;
    id v67 = (uint8_t *)swift_slowAlloc();
    id v68 = (void *)swift_slowAlloc();
    *(_DWORD *)id v67 = 138412290;
    id v69 = v61;
    id v70 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id aBlock = v70;
    sub_1B411EAF8();
    *id v68 = v70;

    _os_log_impl(&dword_1B3F4C000, v66, v62, "Error: _AppExtensionEventEditHostView Setup: Cannot make XPC Connection. %@", v67, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v68, -1, -1);
    MEMORY[0x1BA986180](v67, -1, -1);

    goto LABEL_19;
  }
  id v17 = v16;
  uint64_t v122 = v15;
  uint64_t v123 = v11;
  uint64_t v121 = v10;
  uint64_t v18 = *(void (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x98);
  id v19 = aBlock;
  id v20 = v17;
  v18(v17);
  objc_msgSend(v20, sel_setExportedInterface_, *sub_1B40EAF88());
  objc_msgSend(v20, sel_setRemoteObjectInterface_, *sub_1B40EB35C());
  objc_msgSend(v20, sel_setExportedObject_, v1);
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v131 = sub_1B4108DD8;
  uint64_t v132 = v21;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v128 = 1107296256;
  v129 = sub_1B40DE4D8;
  char v130 = &block_descriptor_2;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v20, sel_setInterruptionHandler_, v22);
  _Block_release(v22);
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v131 = sub_1B4108EE4;
  uint64_t v132 = v23;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v128 = 1107296256;
  v129 = sub_1B40DE4D8;
  char v130 = &block_descriptor_29;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v20, sel_setInvalidationHandler_, v24);
  _Block_release(v24);
  objc_msgSend(v20, sel_resume);
  os_log_type_t v25 = sub_1B411EA28();
  uint64_t v26 = sub_1B40EC57C();
  os_log_t v27 = (os_log_t)*v26;
  if (os_log_type_enabled((os_log_t)*v26, v25))
  {
    id v28 = v20;
    uint64_t v119 = (id *)v26;
    id v29 = v28;
    id v30 = v27;
    long long v31 = (_DWORD *)swift_slowAlloc();
    uint64_t v120 = v5;
    uint64_t v32 = v4;
    uint64_t v33 = v31;
    *long long v31 = 67109376;
    LODWORD(aBlock) = objc_msgSend(v29, sel_processIdentifier);
    sub_1B411EAF8();
    *((_WORD *)v33 + 4) = 1024;
    LODWORD(aBlock) = objc_msgSend(v29, sel_effectiveUserIdentifier);
    sub_1B411EAF8();

    uint64_t v26 = (uint64_t *)v119;
    _os_log_impl(&dword_1B3F4C000, v30, v25, "_AppExtensionEventEditHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v33, 0xEu);
    id v34 = v33;
    uint64_t v4 = v32;
    uint64_t v5 = v120;
    MEMORY[0x1BA986180](v34, -1, -1);
  }
  id v35 = objc_msgSend(v20, sel_remoteObjectProxy);
  sub_1B411EB18();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB78);
  if (!swift_dynamicCast())
  {
    sub_1B411EA18();
    id v66 = (id)*v26;
    sub_1B411E578();

LABEL_19:
    return;
  }
  uint64_t v116 = v7;
  uint64_t v117 = v4;
  uint64_t v36 = v126;
  uint64_t v37 = *(void *)((char *)v2
                  + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent
                  + 8);
  uint64_t v38 = *(uint64_t (**)(uint64_t))(*(void *)v37 + 344);
  uint64_t v39 = swift_retain();
  uint64_t v40 = v38(v39);
  if (!v40)
  {
    sub_1B411EA18();
    id v66 = (id)*v26;
    sub_1B411E578();

    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_19;
  }
  os_log_t v41 = (void *)v40;
  id v118 = v36;
  uint64_t v119 = (id *)v26;
  uint64_t v42 = (*(uint64_t (**)(void))(*(void *)v37 + 296))();
  uint64_t v43 = (void *)(*(uint64_t (**)(void))(*(void *)v37 + 320))();
  uint64_t v44 = sub_1B411E8C8();
  uint64_t v113 = v45;

  long long v46 = *(uint64_t (**)(void))(*(void *)v37 + 248);
  id v47 = (void *)(*(void *)v37 + 248);
  uint64_t v48 = swift_retain();
  long long v114 = v46;
  id v115 = v47;
  id v49 = (void *)((uint64_t (*)(uint64_t))v46)(v48);
  swift_release();
  if (!v49)
  {
    uint64_t v59 = 0;
    unsigned int v112 = 0;
    goto LABEL_23;
  }
  v111[1] = v44;
  id v50 = objc_msgSend(v49, sel_eventStore);

  if (!v50)
  {
    uint64_t v59 = 0;
    unsigned int v112 = 0;
LABEL_23:
    id v71 = (void *)sub_1B411E898();
    swift_bridgeObjectRelease();
    if (v59)
    {
      id v72 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v72 = 0;
    }
    objc_msgSend(v118, sel_setupViewContextWithViewHierarchy_layoutDirection_sizeCategory_sourceAccountManagement_sourceBundleID_, v41, v42, v71, v112, v72);

    uint64_t v73 = (*(uint64_t (**)(void))(*(void *)v37 + 272))();
    if (v73)
    {
      id v74 = (uint64_t (*)(void))v73;
      uint64_t v75 = v121;
      id v76 = v114;
    }
    else
    {
      id v76 = v114;
      uint64_t v77 = (void *)v114();
      uint64_t v75 = v121;
      if (!v77
        || (id v78 = v77,
            id v74 = (uint64_t (*)(void))objc_msgSend(v77, sel_eventStore),
            v78,
            !v74))
      {
        sub_1B411EA28();
        id v79 = *v119;
        sub_1B411E578();

        id v74 = (uint64_t (*)(void))objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F25550]), sel_init);
      }
    }
    os_log_type_t v80 = (id *)v76();
    if (!v80) {
      os_log_type_t v80 = (id *)objc_msgSend(self, sel_eventWithEventStore_, v74);
    }
    id v81 = v80;
    long long v114 = v74;
    id v115 = v41;
    sub_1B411E4A8();
    uint64_t v119 = v81;
    id v82 = objc_msgSend(v81, sel_occurrenceDate);
    uint64_t v120 = v5;
    if (v82)
    {
      id v83 = v82;
      uint64_t v84 = v124;
      sub_1B411E498();

      uint64_t v85 = v123;
      uint64_t v86 = *(void (**)(char *, char *, uint64_t))(v123 + 32);
      uint64_t v87 = v125;
      v86(v125, v84, v75);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v85 + 56))(v87, 0, 1, v75);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v85 + 48))(v87, 1, v75) != 1)
      {
        unint64_t v88 = v87;
        uint64_t v89 = v122;
        (*(void (**)(char *, uint64_t))(v123 + 8))(v122, v75);
        v86(v89, v88, v75);
LABEL_38:
        uint64_t v125 = (char *)objc_msgSend(objc_allocWithZone((Class)sub_1B411E828()), sel_init);
        unint64_t v90 = (char *)sub_1B411E818();
        sub_1B411E838();
        uint64_t v91 = (void *)sub_1B411E878();
        swift_bridgeObjectRelease();
        uint64_t v124 = v90;
        sub_1B411E848();
        sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC768);
        sub_1B40F9D30();
        unint64_t v92 = (void *)sub_1B411E878();
        swift_bridgeObjectRelease();
        sub_1B411E858();
        id v93 = (void *)sub_1B411E878();
        swift_bridgeObjectRelease();
        unint64_t v94 = v122;
        uint64_t v95 = (void *)sub_1B411E488();
        id v96 = v118;
        objc_msgSend(v118, sel_setupEventEditViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, v91, v92, v93, v95);

        uint64_t v97 = v116;
        (*(void (**)(void))(*(void *)v37 + 416))();
        uint64_t v98 = swift_allocObject();
        *(void *)(v98 + 16) = v96;
        *(void *)(v98 + 24) = v37;
        sub_1B40E1AE8(&qword_1E9CFC778, &qword_1E9CFC178);
        swift_retain();
        swift_unknownObjectRetain();
        uint64_t v99 = v117;
        uint64_t v100 = sub_1B411E608();
        swift_release();
        (*(void (**)(char *, uint64_t))(v120 + 8))(v97, v99);
        (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xB0))(v100);
        uint64_t v101 = swift_allocObject();
        *(void *)(v101 + 16) = v96;
        uint64_t v102 = *(void (**)(id (*)(), uint64_t))(*(void *)v37 + 504);
        swift_unknownObjectRetain();
        v102(sub_1B410908C, v101);
        uint64_t v103 = swift_allocObject();
        *(void *)(v103 + 16) = v96;
        uint64_t v104 = *(void (**)(id (*)(), uint64_t))(*(void *)v37 + 536);
        swift_unknownObjectRetain();
        v104(sub_1B410909C, v103);
        uint64_t v105 = swift_allocObject();
        *(void *)(v105 + 16) = v96;
        id v106 = *(void (**)(id (*)(), uint64_t))(*(void *)v37 + 560);
        swift_unknownObjectRetain();
        v106(sub_1B41090C0, v105);
        uint64_t v107 = swift_allocObject();
        *(void *)(v107 + 16) = v96;
        long long v108 = *(void (**)(id (*)(), uint64_t))(*(void *)v37 + 592);
        swift_unknownObjectRetain();
        v108(sub_1B41090D0, v107);
        uint64_t v109 = swift_allocObject();
        *(void *)(v109 + 16) = v96;
        uint64_t v110 = *(void (**)(id (*)(), uint64_t))(*(void *)v37 + 624);
        swift_unknownObjectRetain();
        v110(sub_1B410A5A0, v109);

        swift_unknownObjectRelease();
        swift_release();

        (*(void (**)(char *, uint64_t))(v123 + 8))(v94, v121);
        return;
      }
    }
    else
    {
      uint64_t v87 = v125;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v123 + 56))(v125, 1, 1, v75);
    }
    sub_1B40E1C58((uint64_t)v87, &qword_1E9CFC748);
    goto LABEL_38;
  }
  id v51 = objc_msgSend(v50, sel_connection);
  if (!v51)
  {
    __break(1u);
    goto LABEL_40;
  }
  id v52 = v51;
  id v53 = objc_msgSend(v51, sel_initializationOptions);

  if (!v53)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unsigned int v112 = objc_msgSend(v53, sel_management);

  id v54 = objc_msgSend(v50, sel_connection);
  if (!v54)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v55 = v54;
  id v56 = objc_msgSend(v54, sel_initializationOptions);

  if (v56)
  {
    id v57 = objc_msgSend(v56, sel_managementBundleIdentifier);

    if (v57)
    {
      sub_1B411E8C8();
      uint64_t v59 = v58;
    }
    else
    {

      uint64_t v59 = 0;
    }
    goto LABEL_23;
  }
LABEL_42:
  __break(1u);
}

void sub_1B4107A88(uint64_t a1)
{
  uint64_t v2 = sub_1B411E7D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B411E7F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1 + 16;
  sub_1B411EA28();
  id v11 = (id)*sub_1B40EC57C();
  sub_1B411E578();

  swift_beginAccess();
  uint64_t v12 = MEMORY[0x1BA986210](a1 + 16);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = *(void *)(v12 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 16);
    uint64_t v15 = *(void *)(v12 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 24);
    sub_1B40DA260(v14);

    if (v14)
    {
      sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
      uint64_t v26 = sub_1B411EA38();
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v14;
      *(void *)(v16 + 24) = v15;
      void aBlock[4] = sub_1B410A538;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B40DE4D8;
      aBlock[3] = &block_descriptor_74;
      uint64_t v24 = _Block_copy(aBlock);
      uint64_t v25 = v7;
      swift_retain();
      swift_release();
      sub_1B411E7E8();
      aBlock[0] = MEMORY[0x1E4FBC860];
      sub_1B4104128((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
      uint64_t v23 = v6;
      sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
      sub_1B411EB28();
      id v17 = v24;
      uint64_t v18 = (void *)v26;
      MEMORY[0x1BA984600](0, v9, v5, v24);
      _Block_release(v17);

      sub_1B40DA270(v14);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v23);
    }
  }
  swift_beginAccess();
  id v19 = (void *)MEMORY[0x1BA986210](v10);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v19) + 0x90))();

    if (v21)
    {
      objc_msgSend(v21, sel_setExportedObject_, 0);
    }
  }
}

uint64_t sub_1B4107EFC()
{
  uint64_t v1 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
  objc_msgSend(v2, sel_invalidate);

  uint64_t v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x98);

  return v3(0);
}

uint64_t sub_1B4108094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a3;
  uint64_t v10 = sub_1B411E7D8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v5 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 32);
  if (v19)
  {
    uint64_t v27 = v11;
    uint64_t v28 = result;
    uint64_t v20 = *(void *)(v5 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 40);
    uint64_t v25 = v16;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v26 = sub_1B411EA38();
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = v19;
    v21[3] = v20;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = v29;
    v21[7] = a4;
    v21[8] = a5;
    void aBlock[4] = sub_1B40E03EC;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_53;
    uint64_t v22 = _Block_copy(aBlock);
    sub_1B40DA260(v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B4104128((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    uint64_t v23 = (void *)v26;
    MEMORY[0x1BA984600](0, v18, v13, v22);
    _Block_release(v22);

    sub_1B40DA270(v19);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v18, v28);
  }
  return result;
}

uint64_t sub_1B4108480(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v45 = a3;
  unint64_t v46 = a8;
  uint64_t v42 = a7;
  uint64_t v43 = a6;
  uint64_t v44 = a2;
  uint64_t v12 = sub_1B411E7D8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v16);
  uint64_t v20 = *(void *)(v8 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 16);
  if (v20)
  {
    uint64_t v40 = v13;
    uint64_t v41 = result;
    uint64_t v21 = *(void *)(v8 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 24);
    uint64_t v37 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = v19;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v38 = sub_1B411EA38();
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = v20;
    v22[3] = v21;
    uint64_t v23 = v43;
    uint64_t v24 = v44;
    v22[4] = a1;
    v22[5] = v24;
    uint64_t v25 = v45;
    v22[6] = v45;
    v22[7] = a4;
    v22[8] = a5;
    v22[9] = v23;
    uint64_t v34 = a5;
    uint64_t v36 = v12;
    uint64_t v26 = v15;
    uint64_t v27 = v42;
    unint64_t v28 = v46;
    v22[10] = v42;
    v22[11] = v28;
    void aBlock[4] = sub_1B41091A0;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_59;
    id v35 = _Block_copy(aBlock);
    sub_1B40DA260(v20);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v29 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B40FFE8C(v27, v28);
    swift_release();
    id v30 = v37;
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B4104128((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    uint64_t v31 = v36;
    sub_1B411EB28();
    uint64_t v32 = v35;
    uint64_t v33 = (void *)v38;
    MEMORY[0x1BA984600](0, v30, v26, v35);
    _Block_release(v32);

    sub_1B40DA270(v20);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v31);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v30, v41);
  }
  return result;
}

id sub_1B4108A34()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B4108B14()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F258A8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCB80);
  sub_1B411E6F8();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1B4108B8C(void *a1, uint64_t a2)
{
  sub_1B41091DC(a1, a2, *(void *)(v2 + 8));
}

id sub_1B4108B94@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = (objc_class *)type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(0);
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity];
  uint64_t v12 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn] = 0;
  *(void *)&v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  uint64_t v13 = &v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent];
  *(void *)uint64_t v13 = v4;
  *((void *)v13 + 1) = v3;
  *((void *)v13 + 2) = v5;
  *((void *)v13 + 3) = v6;
  *((void *)v13 + 4) = v8;
  *((void *)v13 + 5) = v7;
  swift_retain();
  sub_1B40DA260(v5);
  sub_1B40DA260(v8);
  v15.receiver = v10;
  v15.super_class = v9;
  id result = objc_msgSendSuper2(&v15, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1B4108CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B410A4AC();

  return MEMORY[0x1F40FAB68](a1, a2, a3, v6);
}

uint64_t sub_1B4108D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B410A4AC();

  return MEMORY[0x1F40FAB30](a1, a2, a3, v6);
}

void sub_1B4108D78()
{
}

uint64_t sub_1B4108DA0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B4108DD8()
{
  sub_1B411EA28();
  id v1 = (id)*sub_1B40EC57C();
  sub_1B411E578();

  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x1BA986210](v0 + 16);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90))();

    if (v4)
    {
      objc_msgSend(v4, sel_setExportedObject_, 0);
    }
  }
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void sub_1B4108EE4()
{
  sub_1B4107A88(v0);
}

uint64_t sub_1B4108EEC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B4108F2C()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v2 + 368))();
  sub_1B40F82F0(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1B411E878();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_updateEventEditViewWithChangedViewConfigurationDictionary_, v4);

  uint64_t v5 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 384))(v9);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  *uint64_t v7 = MEMORY[0x1E4FBC868];
  return v5(v9, 0);
}

uint64_t sub_1B4109054()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1B410908C()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_cancelEditing);
}

id sub_1B410909C()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_hasUnsavedChanges);
}

id sub_1B41090C0()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_focusAndSelectTitle);
}

id sub_1B41090D0()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_focusAndSelectStartDate);
}

uint64_t sub_1B41090E0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1B4109128()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v1 = *(void *)(v0 + 88);
  if (v1 >> 60 != 15) {
    sub_1B40FFF0C(*(void *)(v0 + 80), v1);
  }

  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1B41091A0()
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
}

void sub_1B41091DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B411E4C8();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B411E568();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  objc_super v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v46 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC360);
  uint64_t v19 = MEMORY[0x1F4188790](v18 - 8);
  id v49 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)&v46 - v21;
  self;
  uint64_t v23 = swift_dynamicCastObjCClass();
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v50 = v15;
    id v51 = v7;
    id v53 = v17;
    id v25 = a1;
    id v26 = objc_msgSend(v24, sel_navigationController);
    if (v26)
    {
      uint64_t v27 = v26;
      objc_msgSend(v26, sel_setNavigationBarHidden_, 1);
    }
    sub_1B411EA78();
    uint64_t v28 = sub_1B411EA68();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v22, 1, v28) == 1)
    {
      sub_1B40E1C58((uint64_t)v22, (uint64_t *)&unk_1E9CFC360);
      id v30 = *(void (**)(uint64_t))(*(void *)a3 + 200);
      uint64_t v52 = v12;
      uint64_t v31 = swift_retain();
      v30(v31);
      uint64_t v32 = v52;
      swift_release();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v10, 1, v11) == 1)
      {

        sub_1B40E1C58((uint64_t)v10, &qword_1E9CFC168);
      }
      else
      {
        id v48 = v25;
        uint64_t v33 = v53;
        (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v53, v10, v11);
        uint64_t v34 = *(uint64_t (**)(uint64_t))(*(void *)a3 + 224);
        uint64_t v35 = swift_retain();
        uint64_t v47 = v34(v35);
        unint64_t v37 = v36;
        swift_release();
        if (v37)
        {
          os_log_type_t v38 = sub_1B411EA28();
          uint64_t v39 = *sub_1B40EC57C();
          if (os_log_type_enabled(v39, v38))
          {
            swift_bridgeObjectRetain_n();
            uint64_t v40 = v39;
            uint64_t v41 = (uint8_t *)swift_slowAlloc();
            uint64_t v42 = swift_slowAlloc();
            uint64_t v55 = v42;
            *(_DWORD *)uint64_t v41 = 136315138;
            unint64_t v46 = v41 + 4;
            swift_bridgeObjectRetain();
            uint64_t v54 = sub_1B40DFA70(v47, v37, &v55);
            sub_1B411EAF8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1B3F4C000, v40, v38, "_AppExtensionEventEditHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v41, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1BA986180](v42, -1, -1);
            MEMORY[0x1BA986180](v41, -1, -1);
          }
          uint64_t v43 = v52;
          uint64_t v44 = v53;
          (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v50, v53, v11);
          sub_1B411E4D8();
          uint64_t v45 = v49;
          sub_1B411EA58();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v45, 0, 1, v28);
          sub_1B411EA88();

          (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v11);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v11);
        }
      }
    }
    else
    {

      sub_1B40E1C58((uint64_t)v22, (uint64_t *)&unk_1E9CFC360);
    }
  }
  else
  {
    sub_1B411ECC8();
    __break(1u);
  }
}

uint64_t sub_1B41097D0(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1B4159910, 1);
}

unint64_t sub_1B41097F0()
{
  unint64_t result = qword_1E9CFCB88;
  if (!qword_1E9CFCB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCB88);
  }
  return result;
}

uint64_t destroy for EKEventEditOOPHostView(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  if (*(void *)(a1 + 32)) {
    swift_release();
  }
  if (*(void *)(a1 + 48)) {
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EKEventEditOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;
  uint64_t v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  id v7 = v4;
  if (v5)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v9 = *(void *)(a2 + 32);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  uint64_t v11 = *(void *)(a2 + 48);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 56);
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v11;
    *(void *)(a1 + 56) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 48);
  }
  uint64_t v13 = *(void **)(a2 + 64);
  uint64_t v14 = *(void **)(a2 + 72);
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 96);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v15;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  id v16 = v13;
  id v17 = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EKEventEditOOPHostView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v10;
      *(void *)(a1 + 40) = v11;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v12;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  uint64_t v13 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 56);
      *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v13;
      *(void *)(a1 + 56) = v15;
      swift_retain();
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v14 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v13;
  *(void *)(a1 + 56) = v14;
  swift_retain();
  swift_release();
LABEL_22:
  id v16 = *(void **)(a1 + 64);
  id v17 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v17;
  id v18 = v17;

  uint64_t v19 = *(void **)(a1 + 72);
  uint64_t v20 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v20;
  id v21 = v20;

  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for EKEventEditOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;

  uint64_t v6 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 40) = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v11;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  uint64_t v12 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v12)
    {
      uint64_t v14 = *(void *)(a2 + 56);
      *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v12;
      *(void *)(a1 + 56) = v14;
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v12)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v13 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v12;
  *(void *)(a1 + 56) = v13;
  swift_release();
LABEL_22:

  uint64_t v15 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v16 = *(void *)(a2 + 96);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v16;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventEditOOPHostView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKEventEditOOPHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 8_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventEditOOPHostView()
{
  return &type metadata for EKEventEditOOPHostView;
}

uint64_t destroy for _AppExtensionEventEditHostView(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 16)) {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + 32))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for _AppExtensionEventEditHostView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  return a1;
}

void *assignWithCopy for _AppExtensionEventEditHostView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (!a1[4])
  {
    if (v7)
    {
      uint64_t v9 = a2[5];
      a1[4] = v7;
      a1[5] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[5];
  a1[4] = v7;
  a1[5] = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for _AppExtensionEventEditHostView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (!a1[4])
  {
    if (v8)
    {
      uint64_t v10 = a2[5];
      a1[4] = v8;
      a1[5] = v10;
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = a2[5];
  a1[4] = v8;
  a1[5] = v9;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AppExtensionEventEditHostView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AppExtensionEventEditHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 4_Block_object_dispose(&STACK[0x2D0], 8) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 4_Block_object_dispose(&STACK[0x2D0], 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _AppExtensionEventEditHostView()
{
  return &type metadata for _AppExtensionEventEditHostView;
}

uint64_t sub_1B410A120()
{
  return type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
}

void sub_1B410A128()
{
  sub_1B40E1818();
  if (v0 <= 0x3F)
  {
    sub_1B410A460(319, (unint64_t *)&unk_1E9CFCB90, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_1B410A25C()
{
  return type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(0);
}

void sub_1B410A264()
{
  sub_1B40E1818();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_1B410A310()
{
  unint64_t result = qword_1E9CFCC00;
  if (!qword_1E9CFCC00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFCB48);
    sub_1B410A3BC();
    sub_1B4104128(&qword_1E9CFC710, MEMORY[0x1E4F3C908]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCC00);
  }
  return result;
}

unint64_t sub_1B410A3BC()
{
  unint64_t result = qword_1E9CFCC08;
  if (!qword_1E9CFCC08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1E9CFCC10);
    sub_1B41097F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCC08);
  }
  return result;
}

void type metadata accessor for EKEventEditRemoteViewAction(uint64_t a1)
{
}

void sub_1B410A460(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_1B410A4AC()
{
  unint64_t result = qword_1E9CFCC68;
  if (!qword_1E9CFCC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCC68);
  }
  return result;
}

uint64_t sub_1B410A500()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B410A538()
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void, unint64_t))(v0 + 16))(0, 0, 0, 0, 0, 0, 0, 0xF000000000000000);
}

uint64_t sub_1B410A5FC()
{
  unint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410A690(char a1)
{
  long long v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t sub_1B410A6DC@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x110))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410A744(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x118))(*a1);
}

uint64_t (*sub_1B410A7A4())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1B410A800())()
{
  return j__swift_endAccess;
}

id sub_1B410A85C(uint64_t a1, uint64_t a2, void *a3)
{
  v3[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar] = 0;
  *(void *)&v3[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_WORD *)v6 + 40) = 0;
  uint64_t v7 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventOOPHostViewModel();
  uint64_t v8 = v3;
  *(void *)&v3[v7] = sub_1B4101D38();
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing] = 0;
  *(void *)&v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview] = 1;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton] = 1;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView] = 0;

  if (a2)
  {
    uint64_t v9 = (void *)sub_1B411E898();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for EKEventViewControllerOOPImpl();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, a3);

  return v10;
}

uint64_t type metadata accessor for EKEventViewControllerOOPImpl()
{
  return self;
}

uint64_t sub_1B410AAFC()
{
  uint64_t v1 = v0;
  v105.receiver = v0;
  v105.super_class = (Class)type metadata accessor for EKEventViewControllerOOPImpl();
  objc_msgSendSuper2(&v105, sel_viewDidLoad);
  id v2 = *(id *)((char *)v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel);
  v3.n128_f64[0] = sub_1B40F0AA8((uint64_t)v86);
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = (*(uint64_t (**)(__n128))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))(v3);
  sub_1B40F282C(v5);
  char v6 = (*(uint64_t (**)(void))((*v4 & *v0) + 0x1C0))();
  uint64_t v7 = sub_1B40F2ADC(v6 & 1);
  char v8 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x1F0))(v7);
  uint64_t v9 = sub_1B40F2CFC(v8 & 1);
  char v10 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x220))(v9);
  uint64_t v11 = sub_1B40F2F1C(v10 & 1);
  char v12 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x238))(v11);
  uint64_t v13 = sub_1B40F313C(v12 & 1);
  char v14 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x250))(v13);
  uint64_t v15 = sub_1B40F335C(v14 & 1);
  char v16 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x268))(v15);
  uint64_t v17 = sub_1B40F357C(v16 & 1);
  char v18 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x280))(v17);
  uint64_t v19 = sub_1B40F379C(v18 & 1);
  char v20 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x298))(v19);
  uint64_t v21 = sub_1B40F39BC(v20 & 1);
  char v22 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2B0))(v21);
  uint64_t v23 = sub_1B40F3BDC(v22 & 1);
  char v24 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2C8))(v23);
  uint64_t v25 = sub_1B40F3E04(v24 & 1);
  char v26 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2E0))(v25);
  uint64_t v27 = sub_1B40F4024(v26 & 1);
  char v28 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2F8))(v27);
  uint64_t v29 = sub_1B40F4244(v28 & 1);
  char v30 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x310))(v29);
  uint64_t v31 = sub_1B40F4464(v30 & 1);
  char v32 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x328))(v31);
  uint64_t v33 = sub_1B40F4684(v32 & 1);
  char v34 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x340))(v33);
  uint64_t v35 = sub_1B40F48A8(v34 & 1);
  char v36 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x358))(v35);
  uint64_t v37 = sub_1B40F4AC8(v36 & 1);
  char v38 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x370))(v37);
  sub_1B40F4CF0(v38 & 1);
  uint64_t v39 = v86[2];
  uint64_t v84 = (void *)v86[1];
  uint64_t v85 = v86[0];
  uint64_t v40 = v86[3];
  uint64_t v41 = v86[4];
  uint64_t v42 = v86[5];
  uint64_t v43 = v86[6];
  uint64_t v44 = v86[7];
  if (v88) {
    uint64_t v45 = 256;
  }
  else {
    uint64_t v45 = 0;
  }
  uint64_t v46 = v45 | v87;
  uint64_t v47 = 0x10000;
  if (v89) {
    uint64_t v48 = 0x10000;
  }
  else {
    uint64_t v48 = 0;
  }
  uint64_t v49 = 0x1000000;
  if (v90) {
    uint64_t v50 = 0x1000000;
  }
  else {
    uint64_t v50 = 0;
  }
  uint64_t v51 = v46 | v48 | v50;
  if (v91) {
    uint64_t v52 = 0x100000000;
  }
  else {
    uint64_t v52 = 0;
  }
  if (v92) {
    uint64_t v53 = 0x10000000000;
  }
  else {
    uint64_t v53 = 0;
  }
  uint64_t v54 = v52 | v53;
  if (v93) {
    uint64_t v55 = 0x1000000000000;
  }
  else {
    uint64_t v55 = 0;
  }
  uint64_t v56 = v51 | v54 | v55;
  if (v94) {
    uint64_t v57 = 0x100000000000000;
  }
  else {
    uint64_t v57 = 0;
  }
  uint64_t v83 = v56 | v57;
  if (v96) {
    uint64_t v58 = 256;
  }
  else {
    uint64_t v58 = 0;
  }
  uint64_t v59 = v58 | v95;
  if (!v97) {
    uint64_t v47 = 0;
  }
  if (!v98) {
    uint64_t v49 = 0;
  }
  uint64_t v60 = v59 | v47 | v49;
  if (v99) {
    uint64_t v61 = 0x100000000;
  }
  else {
    uint64_t v61 = 0;
  }
  if (v100) {
    uint64_t v62 = 0x10000000000;
  }
  else {
    uint64_t v62 = 0;
  }
  uint64_t v63 = v61 | v62;
  if (v101) {
    uint64_t v64 = 0x1000000000000;
  }
  else {
    uint64_t v64 = 0;
  }
  uint64_t v65 = v60 | v63 | v64;
  if (v102) {
    uint64_t v66 = 0x100000000000000;
  }
  else {
    uint64_t v66 = 0;
  }
  uint64_t v75 = v65 | v66;
  if (v104) {
    __int16 v67 = 256;
  }
  else {
    __int16 v67 = 0;
  }
  __int16 v68 = v67 | v103;
  id v69 = (char *)v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView;
  swift_beginAccess();
  id v81 = (void *)*((void *)v69 + 1);
  uint64_t v82 = *(void *)v69;
  uint64_t v79 = *((void *)v69 + 3);
  uint64_t v80 = *((void *)v69 + 2);
  uint64_t v77 = *((void *)v69 + 5);
  uint64_t v78 = *((void *)v69 + 4);
  uint64_t v76 = *((void *)v69 + 6);
  *(void *)id v69 = v85;
  *((void *)v69 + 1) = v84;
  *((void *)v69 + 2) = v39;
  *((void *)v69 + 3) = v40;
  *((void *)v69 + 4) = v41;
  *((void *)v69 + 5) = v42;
  *((void *)v69 + 6) = v43;
  *((void *)v69 + 7) = v44;
  *((void *)v69 + _Block_object_dispose(&STACK[0x2D0], 8) = v83;
  *((void *)v69 + 9) = v75;
  *((_WORD *)v69 + 40) = v68;
  id v70 = v84;
  sub_1B40DA260(v39);
  sub_1B40DA260(v41);
  sub_1B40DA260(v43);
  sub_1B4110FF0(v82, v81, v80, v79, v78, v77, v76);
  (*(void (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x170))(v71, v72, v73);

  sub_1B40DA270(v39);
  sub_1B40DA270(v41);
  return sub_1B40DA270(v43);
}

uint64_t sub_1B410B3E0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView;
  swift_beginAccess();
  id v2 = *(void **)(v1 + 8);
  if (!v2) {
    goto LABEL_31;
  }
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v118 = *(void *)(v1 + 48);
  uint64_t v119 = *(void *)(v1 + 56);
  uint64_t v9 = *(void *)(v1 + 64);
  unint64_t v8 = *(void *)(v1 + 72);
  unsigned int v10 = *(unsigned __int16 *)(v1 + 80);
  uint64_t v143 = v3;
  long long v144 = v2;
  uint64_t v145 = v4;
  uint64_t v146 = v5;
  uint64_t v147 = v7;
  uint64_t v148 = v6;
  uint64_t v11 = v6;
  uint64_t v149 = v118;
  uint64_t v150 = v119;
  __int16 v151 = v9 & 0x101;
  char v152 = BYTE2(v9) & 1;
  char v153 = BYTE3(v9) & 1;
  char v154 = BYTE4(v9) & 1;
  char v155 = BYTE5(v9) & 1;
  char v156 = BYTE6(v9) & 1;
  char v157 = HIBYTE(v9) & 1;
  char v112 = v8 & 1;
  __int16 v158 = v8 & 0x101;
  unsigned int v111 = (v8 >> 8) & 1;
  unsigned int v110 = WORD1(v8) & 1;
  char v159 = BYTE2(v8) & 1;
  unsigned int v109 = BYTE3(v8) & 1;
  char v160 = BYTE3(v8) & 1;
  uint64_t v108 = HIDWORD(v8) & 1;
  char v161 = BYTE4(v8) & 1;
  uint64_t v107 = (v8 >> 40) & 1;
  char v162 = BYTE5(v8) & 1;
  uint64_t v106 = HIWORD(v8) & 1;
  char v163 = BYTE6(v8) & 1;
  uint64_t v105 = HIBYTE(v8) & 1;
  char v164 = HIBYTE(v8) & 1;
  char v104 = v10 & 1;
  __int16 v165 = v10 & 0x101;
  int v103 = (v10 >> 8) & 1;
  char v94 = v2;
  uint64_t v113 = self;
  sub_1B4111070(v3, v2, v4, v5, v7, v11, v118);
  __int16 v97 = v10;
  LOWORD(v91) = v10;
  uint64_t v98 = v8;
  uint64_t v116 = v3;
  uint64_t v102 = v4;
  uint64_t v100 = v11;
  uint64_t v101 = v7;
  sub_1B4111070(v3, v2, v4, v5, v7, v11, v118);
  char v12 = v2;
  id v99 = v2;
  id v13 = objc_msgSend(v113, sel_shared, v9, v8, v91);
  char v14 = sub_1B40F0AA0();
  id v15 = objc_msgSend(v13, sel_layoutDirectionOrOverride);
  char v16 = (void *)MEMORY[0x1E4FBC8C8];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v14) + 0x108))(v15);

  uint64_t v17 = sub_1B40F0AA0();
  (*(void (**)(id))((*v16 & *v17) + 0x120))(objc_msgSend(v13, sel_preferredContentSizeCategoryOrOverride));

  char v93 = v13;
  id v18 = objc_msgSend(v13, sel_viewHierarchyOrOverride);
  id v19 = objc_msgSend(v117, sel_view);
  if (!v19)
  {
    __break(1u);
    goto LABEL_18;
  }
  char v20 = v19;
  objc_msgSend(v19, sel_bounds);
  double v22 = v21;
  double v24 = v23;

  id v95 = self;
  id v25 = objc_msgSend(v95, sel_systemBlueColor);
  char v26 = sub_1B40F0AA0();
  id v27 = objc_msgSend(v18, sel_ekui_verticalSizeClass);
  id v28 = objc_msgSend(v18, sel_ekui_horizontalSizeClass);
  id v29 = objc_msgSend(v18, sel_ekui_interfaceOrientation);
  id v30 = v25;
  objc_msgSend(v18, sel_ekui_affineTransform);
  *(_OWORD *)long long v114 = v120;
  long long v96 = v121;
  uint64_t v31 = v122;
  uint64_t v32 = v123;
  id v33 = objc_allocWithZone((Class)EKUIViewHierarchyFromComponents);
  long long v120 = *(_OWORD *)v114;
  long long v121 = v96;
  uint64_t v122 = v31;
  uint64_t v123 = v32;
  id v34 = objc_msgSend(v33, sel_initWithSize_verticalSizeClass_horizontalSizeClass_interfaceOrientation_tintColor_affineTranform_, v27, v28, v29, v30, &v120, v22, v24);
  id v115 = v30;

  (*(void (**)(id))((*v16 & *v26) + 0x138))(v34);
  uint64_t v35 = sub_1B40F0AA0();
  LOWORD(v92) = v97;
  sub_1B4110FF0(v116, v12, v102, v5, v101, v100, v118);
  char v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*v16 & *v117) + 0x110))(v36, v37, v38);
  (*(void (**)(void))((*v16 & *v35) + 0x150))(v39 & 1);

  uint64_t v40 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v101);
  uint64_t v41 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v118);
  uint64_t v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1B40DA270(v102);
  id v43 = v99;
  sub_1B40DA260((uint64_t)sub_1B41112D0);
  sub_1B40DA260((uint64_t)sub_1B4111128);
  sub_1B40DA260((uint64_t)sub_1B4111218);

  swift_release();
  swift_release();
  swift_release();
  *(void *)&long long v120 = v116;
  *((void *)&v120 + 1) = v43;
  *(void *)&long long v121 = sub_1B41112D0;
  *((void *)&v121 + 1) = v42;
  uint64_t v122 = sub_1B4111128;
  uint64_t v123 = v40;
  uint64_t v124 = sub_1B4111218;
  uint64_t v125 = v41;
  __int16 v126 = v9 & 0x101;
  char v127 = BYTE2(v9) & 1;
  char v128 = BYTE3(v9) & 1;
  char v129 = BYTE4(v9) & 1;
  char v130 = BYTE5(v9) & 1;
  char v131 = BYTE6(v9) & 1;
  char v132 = HIBYTE(v9) & 1;
  char v133 = v112;
  char v134 = v111;
  char v135 = v110;
  char v136 = v109;
  char v137 = v108;
  char v138 = v107;
  char v139 = v106;
  char v140 = v105;
  char v141 = v104;
  char v142 = v103;
  id v44 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFCD50));
  uint64_t v45 = (void *)sub_1B411E658();
  objc_msgSend(v117, sel_addChildViewController_, v45, v9, v98, v92);
  id v46 = objc_msgSend(v45, sel_view);
  if (!v46)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v47 = v46;
  objc_msgSend(v46, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  id v48 = objc_msgSend(v45, sel_view);
  if (!v48)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v49 = v48;
  id v50 = objc_msgSend(v95, sel_systemBackgroundColor);
  objc_msgSend(v49, sel_setBackgroundColor_, v50);

  id v51 = objc_msgSend(v117, sel_view);
  if (!v51)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v52 = v51;
  id v53 = objc_msgSend(v45, sel_view);
  if (!v53)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v54 = v53;
  objc_msgSend(v52, sel_addSubview_, v53);

  objc_msgSend(v45, sel_didMoveToParentViewController_, v117);
  uint64_t v55 = *(void **)((char *)v117 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController);
  *(void *)((char *)v117 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController) = v45;
  id v56 = v45;

  id v57 = objc_msgSend(v56, sel_view);
  if (!v57)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v58 = v57;
  objc_msgSend(v57, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC420);
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_1B413B4B0;
  id v60 = objc_msgSend(v56, sel_view);
  if (!v60)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v61 = v60;
  id v62 = objc_msgSend(v60, sel_leadingAnchor);

  id v63 = objc_msgSend(v117, sel_view);
  if (!v63)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v64 = v63;
  id v65 = objc_msgSend(v63, sel_leadingAnchor);

  id v66 = objc_msgSend(v62, sel_constraintEqualToAnchor_, v65);
  *(void *)(v59 + 32) = v66;
  id v67 = objc_msgSend(v56, sel_view);
  if (!v67)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  __int16 v68 = v67;
  id v69 = objc_msgSend(v67, sel_topAnchor);

  id v70 = objc_msgSend(v117, sel_view);
  if (!v70)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v71 = v70;
  id v72 = objc_msgSend(v70, sel_topAnchor);

  id v73 = objc_msgSend(v69, sel_constraintEqualToAnchor_, v72);
  *(void *)(v59 + 40) = v73;
  id v74 = objc_msgSend(v56, sel_view);
  if (!v74)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v75 = v74;
  id v76 = objc_msgSend(v74, sel_trailingAnchor);

  id v77 = objc_msgSend(v117, sel_view);
  if (!v77)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v78 = v77;
  id v79 = objc_msgSend(v77, sel_trailingAnchor);

  id v80 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v79);
  *(void *)(v59 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v80;
  id v81 = objc_msgSend(v56, sel_view);
  if (v81)
  {
    uint64_t v82 = v81;
    id v83 = objc_msgSend(v81, sel_bottomAnchor);

    id v84 = objc_msgSend(v117, sel_view);
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = self;
      id v87 = objc_msgSend(v85, sel_bottomAnchor);

      id v88 = objc_msgSend(v83, sel_constraintEqualToAnchor_, v87);
      *(void *)(v59 + 56) = v88;
      *(void *)&long long v120 = v59;
      sub_1B411E938();
      sub_1B40E1BC8(0, &qword_1E9CFCD60);
      char v89 = (void *)sub_1B411E908();
      swift_bridgeObjectRelease();
      objc_msgSend(v86, sel_activateConstraints_, v89);

      swift_unknownObjectRelease();
      sub_1B40DA270((uint64_t)sub_1B41112D0);
      sub_1B40DA270((uint64_t)sub_1B4111128);
      return sub_1B40DA270((uint64_t)sub_1B4111218);
    }
    goto LABEL_30;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  uint64_t result = sub_1B411ECC8();
  __break(1u);
  return result;
}

void sub_1B410C0EC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8)
{
  os_log_type_t v11 = sub_1B411EA28();
  char v12 = (os_log_t *)sub_1B40EC57C();
  os_log_t v13 = *v12;
  os_log_type_t v14 = v11;
  if (os_log_type_enabled(*v12, v11))
  {
    swift_bridgeObjectRetain_n();
    id v15 = v13;
    char v16 = (uint8_t *)swift_slowAlloc();
    char v93 = v8;
    uint64_t v17 = v12;
    uint64_t v18 = a5;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v98 = v19;
    *(_DWORD *)char v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_1B40DFA70(a1, a2, &v98);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3F4C000, v15, v14, "EKEventViewControllerOOPImpl: Received remoteEventViewControllerRequestPresentView on the host app side. viewName: %s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v19;
    a5 = v18;
    char v12 = v17;
    unint64_t v8 = v93;
    MEMORY[0x1BA986180](v20, -1, -1);
    MEMORY[0x1BA986180](v16, -1, -1);
  }
  id v21 = objc_msgSend(v8, sel_parentViewController);
  if (!v21) {
    goto LABEL_20;
  }
  double v22 = v21;
  id v23 = objc_msgSend(v21, sel_parentViewController);

  if (!v23) {
    goto LABEL_20;
  }
  self;
  uint64_t v24 = swift_dynamicCastObjCClass();
  if (!v24)
  {

LABEL_20:
    sub_1B411EA18();
    char v39 = *v12;
    sub_1B411E578();
    goto LABEL_34;
  }
  id v25 = (void *)v24;
  if (a1 == 0xD000000000000027 && a2 == 0x80000001B4148FE0 || (sub_1B411ED48() & 1) != 0)
  {
    char v26 = v25;
    id v27 = EventKitUIBundle();
    if (v27)
    {
      id v28 = v27;
      sub_1B411E448();

      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCD68);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_1B413C090;
      id v30 = sub_1B411BAEC();
      uint64_t v31 = v30[1];
      *(void *)(v29 + 32) = *v30;
      *(void *)(v29 + 40) = v31;
      id v32 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v33 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
      id v34 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
      id v35 = (id)sub_1B411E908();
      swift_bridgeObjectRelease();
      id v36 = objc_msgSend(v32, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, v33, v34, 0, v35, 0x80000001B41491C0);

LABEL_11:
      uint64_t v38 = a8;
      uint64_t v37 = a7;
      id v25 = v26;
LABEL_12:

      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_73;
  }
  if ((a1 != 0xD000000000000018 || a2 != 0x80000001B4147BF0) && (sub_1B411ED48() & 1) == 0)
  {
    if (a1 == 0xD00000000000001FLL && a2 == 0x80000001B4149010 || (sub_1B411ED48() & 1) != 0)
    {
      id v65 = EventKitUIBundle();
      if (v65)
      {
        id v66 = v65;
        sub_1B411E448();

        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCD68);
        uint64_t v67 = swift_allocObject();
        *(_OWORD *)(v67 + 16) = xmmword_1B413C090;
        __int16 v68 = sub_1B411BB54();
        uint64_t v69 = v68[1];
        *(void *)(v67 + 32) = *v68;
        *(void *)(v67 + 40) = v69;
        id v70 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v8) + 0x1A8);
        swift_bridgeObjectRetain();
        uint64_t v71 = swift_bridgeObjectRetain();
        id v35 = (id)v70(v71);
        id v72 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
        id v73 = (void *)sub_1B411E898();
        swift_bridgeObjectRelease();
        id v74 = (void *)sub_1B411E898();
        swift_bridgeObjectRelease();
        uint64_t v75 = (void *)sub_1B411E908();
        swift_bridgeObjectRelease();
        id v36 = objc_msgSend(v72, sel_initWithTitle_viewID_event_leftBarButtonActions_rightBarButtonActions_, v73, v74, v35, 0, v75, 0x80000001B4149170);

        uint64_t v38 = a8;
        uint64_t v37 = a7;
        goto LABEL_12;
      }
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    if (a1 == 0xD000000000000022 && a2 == 0x80000001B4149030 || (sub_1B411ED48() & 1) != 0)
    {
      id v78 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      id v79 = (void *)sub_1B411E898();
      swift_bridgeObjectRelease();
      id v80 = objc_msgSend(v78, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v79, 0, 0);

      id v35 = v80;
      id v81 = objc_msgSend(v35, sel_view);
      BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v81);

      if (IsRegularInViewHierarchy)
      {
        id v83 = objc_msgSend(v35, sel_view);
        BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v83);

        if (IsRegular) {
          objc_msgSend(v35, sel_setModalPresentationStyle_, 3);
        }
      }
      id v36 = v35;
      goto LABEL_70;
    }
    if (a1 == 0xD000000000000023 && a2 == 0x80000001B4149060 || (sub_1B411ED48() & 1) != 0)
    {
      uint64_t v85 = EventKitUIBundle();
      if (!v85)
      {
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      uint64_t v86 = v85;
      unint64_t v92 = 0x80000001B4149110;
    }
    else if (a1 == 0xD000000000000023 && a2 == 0x80000001B4149090 || (sub_1B411ED48() & 1) != 0)
    {
      id v87 = EventKitUIBundle();
      if (!v87)
      {
LABEL_75:
        __break(1u);
        goto LABEL_76;
      }
      uint64_t v86 = v87;
      unint64_t v92 = 0x80000001B41490C0;
    }
    else
    {
      if ((a1 != 0xD000000000000016 || a2 != 0x80000001B4147C10) && (sub_1B411ED48() & 1) == 0)
      {
        id v91 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
        swift_bridgeObjectRetain();
        id v35 = (id)sub_1B411E898();
        swift_bridgeObjectRelease();
        id v36 = objc_msgSend(v91, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v35, 0, 0);
        goto LABEL_70;
      }
      id v88 = EventKitUIBundle();
      if (!v88)
      {
LABEL_76:
        __break(1u);
        return;
      }
      uint64_t v86 = v88;
      unint64_t v92 = 0x80000001B4147C30;
    }
    sub_1B411E448();

    id v89 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
    swift_bridgeObjectRetain();
    char v90 = (void *)sub_1B411E898();
    swift_bridgeObjectRelease();
    id v35 = (id)sub_1B411E898();
    swift_bridgeObjectRelease();
    id v36 = objc_msgSend(v89, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, v90, v35, 0, 0, v92);

LABEL_70:
    uint64_t v38 = a8;
    uint64_t v37 = a7;
    goto LABEL_12;
  }
  char v26 = v25;
  id v42 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
  swift_bridgeObjectRetain();
  id v43 = (void *)sub_1B411E898();
  swift_bridgeObjectRelease();
  id v44 = objc_msgSend(v42, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v43, 0, 0);

  id v36 = v44;
  id v45 = objc_msgSend(v8, sel_traitCollection);
  id v46 = objc_msgSend(v45, sel_userInterfaceIdiom);

  if (v46 == (id)1
    || (id v47 = objc_msgSend(v8, sel_traitCollection),
        id v48 = objc_msgSend(v47, sel_userInterfaceIdiom),
        v47,
        v48 == (id)5))
  {
    objc_msgSend(v36, sel_setModalPresentationStyle_, 7);
    id v49 = objc_msgSend(v36, sel_popoverPresentationController);
    if (v49)
    {
      id v50 = v49;
      id v51 = objc_msgSend(v8, sel_view);
      objc_msgSend(v50, sel_setSourceView_, v51);
    }
    objc_msgSend(a6, sel_CGRectValue);
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    id v35 = objc_msgSend(v36, sel_popoverPresentationController);

    uint64_t v38 = a8;
    if (v35)
    {
      objc_msgSend(v35, sel_setSourceRect_, v53 + v57 * 0.5, v55 + v59 * 0.5 + 64.0, 0.0, 0.0);
      uint64_t v37 = a7;
      goto LABEL_12;
    }
    uint64_t v37 = a7;
  }
  else
  {
    id v76 = objc_msgSend(v36, sel_sheetPresentationController);

    if (v76)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC420);
      uint64_t v77 = swift_allocObject();
      *(_OWORD *)(v77 + 16) = xmmword_1B413B4C0;
      *(void *)(v77 + 32) = objc_msgSend(self, sel_largeDetent);
      uint64_t v98 = v77;
      sub_1B411E938();
      sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFCD70);
      id v35 = (id)sub_1B411E908();
      swift_bridgeObjectRelease();
      objc_msgSend(v76, sel_setDetents_, v35);

      goto LABEL_11;
    }
    uint64_t v38 = a8;
    uint64_t v37 = a7;
  }
LABEL_13:
  objc_msgSend(v36, sel_setOopContentBackgroundColor_, v38);
  char v39 = v36;
  objc_msgSend(v37, sel_CGSizeValue);
  -[NSObject setPreferredContentSize:](v39, sel_setPreferredContentSize_);

  id v40 = objc_msgSend(v25, sel_navigationDelegate);
  if (!v40)
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v41 = v40;
  if (a5 == 2)
  {
    [v39 setModalPresentationStyle:2];
    goto LABEL_31;
  }
  if (a5 == 1)
  {
LABEL_31:
    objc_msgSend(v41, sel_presentViewController_animated_completion_, v39, 1, 0);
LABEL_32:
    swift_unknownObjectRelease();
    goto LABEL_33;
  }
  if (a5)
  {
    os_log_type_t v60 = sub_1B411EA18();
    os_log_t v61 = *v12;
    os_log_type_t v62 = v60;
    if (os_log_type_enabled(*v12, v60))
    {
      id v63 = v61;
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v64 = 134217984;
      uint64_t v98 = a5;
      sub_1B411EAF8();
      _os_log_impl(&dword_1B3F4C000, v63, v62, "EKEventViewControllerOOPImpl: presentationStyle not recognized: %ld", v64, 0xCu);
      MEMORY[0x1BA986180](v64, -1, -1);
      swift_unknownObjectRelease();

      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (objc_msgSend(v40, sel_respondsToSelector_, sel_pushViewController_animated_))
  {
    objc_msgSend(v41, sel_pushViewController_animated_, v39, 1);

    swift_unknownObjectRelease();
LABEL_34:

    return;
  }

  swift_unknownObjectRelease();
}

void sub_1B410CF68(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  os_log_type_t v8 = sub_1B411EA28();
  uint64_t v9 = (os_log_t *)sub_1B40EC57C();
  os_log_t v10 = *v9;
  if (os_log_type_enabled(*v9, v8))
  {
    swift_bridgeObjectRetain_n();
    os_log_t log = v10;
    uint64_t v27 = a3;
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v28 = v12;
    *(_DWORD *)os_log_type_t v11 = 136315138;
    if (a2)
    {
      unint64_t v13 = a2;
    }
    else
    {
      a1 = 7104878;
      unint64_t v13 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1B40DFA70(a1, v13, &v28);
    sub_1B411EAF8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B3F4C000, log, v8, "EKEventViewControllerOOPImpl: Received remoteViewControllerRequestDismissView on the host app side. viewName: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v12, -1, -1);
    os_log_type_t v14 = v11;
    a3 = v27;
    MEMORY[0x1BA986180](v14, -1, -1);
  }
  id v15 = objc_msgSend(v4, sel_parentViewController, log);
  if (v15
    && (char v16 = v15,
        os_log_t v17 = (os_log_t)objc_msgSend(v15, sel_parentViewController),
        v16,
        v17))
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if (a3)
      {
        os_log_type_t v21 = sub_1B411EA18();
        double v22 = *v9;
        os_log_type_t v23 = v21;
        if (os_log_type_enabled(v22, v21))
        {
          uint64_t v24 = v22;
          id v25 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)id v25 = 134217984;
          uint64_t v28 = a3;
          sub_1B411EAF8();
          _os_log_impl(&dword_1B3F4C000, v24, v23, "EKEventViewControllerOOPImpl: presentationStyle not recognized: %ld", v25, 0xCu);
          MEMORY[0x1BA986180](v25, -1, -1);
        }
      }
      else
      {
        id v18 = [v17 navigationController];
        if (v18)
        {
          uint64_t v19 = v18;
          id v20 = objc_msgSend(v18, sel_popViewControllerAnimated_, 1);
        }
      }
    }
    else
    {
      [v17 dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
    sub_1B411EA18();
    os_log_t v17 = *v9;
    sub_1B411E578();
  }
}

void sub_1B410D298(uint64_t a1)
{
  sub_1B411EA28();
  uint64_t v3 = sub_1B40EC57C();
  id v4 = (id)*v3;
  sub_1B411E578();

  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x1D8))();
  if (!v5) {
    return;
  }
  uint64_t v6 = (void *)v5;
  id v7 = objc_msgSend(v1, sel_parentViewController);
  if (!v7) {
    goto LABEL_8;
  }
  os_log_type_t v8 = v7;
  id v10 = objc_msgSend(v7, sel_parentViewController);

  if (!v10) {
    goto LABEL_8;
  }
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (!v9)
  {

LABEL_8:
    sub_1B411EA18();
    id v10 = (id)*v3;
    sub_1B411E578();
    goto LABEL_9;
  }
  objc_msgSend(v6, sel_eventViewController_didCompleteWithAction_, v9, a1);
LABEL_9:
  swift_unknownObjectRelease();
}

void sub_1B410D460()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  id v2 = (void *)v1[1];
  if (v2)
  {
    uint64_t v4 = v1[4];
    uint64_t v3 = v1[5];
    uint64_t v5 = v1[2];
    uint64_t v6 = v1[3];
    uint64_t v9 = *v1;
    uint64_t v7 = v1[6];
    id v8 = v2;
    sub_1B40DA260(v5);
    sub_1B40DA260(v4);
    sub_1B40DA260(v7);
    sub_1B40F24A4();
    sub_1B4110FF0(v9, v2, v5, v6, v4, v3, v7);
  }
}

void sub_1B410D7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  id v10 = (void *)v9[1];
  if (v10)
  {
    uint64_t v19 = a1;
    uint64_t v11 = v9[6];
    uint64_t v12 = v9[4];
    uint64_t v13 = v9[5];
    uint64_t v17 = a4;
    uint64_t v15 = v9[2];
    uint64_t v14 = v9[3];
    uint64_t v18 = *v9;
    id v16 = v10;
    sub_1B40DA260(v15);
    sub_1B40DA260(v12);
    sub_1B40DA260(v11);
    sub_1B40F262C(v19, a2, a3, v17);
    sub_1B4110FF0(v18, v10, v15, v14, v12, v13, v11);
  }
}

void sub_1B410DBD0(char a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  uint64_t v4 = (void *)v3[1];
  if (v4)
  {
    char v12 = a1;
    uint64_t v5 = v3[4];
    uint64_t v6 = v3[5];
    uint64_t v7 = v3[2];
    uint64_t v8 = v3[3];
    uint64_t v11 = *v3;
    uint64_t v9 = v3[6];
    id v10 = v4;
    sub_1B40DA260(v7);
    sub_1B40DA260(v5);
    sub_1B40DA260(v9);
    sub_1B40F2764(v12 & 1);
    sub_1B4110FF0(v11, v4, v7, v8, v5, v6, v9);
  }
}

void *sub_1B410DFC4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B410E070(void *a1)
{
  sub_1B4111364(a1);
}

uint64_t sub_1B410E0A8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1A8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B410E10C(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1B0);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B410E17C(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410E1E8;
}

void sub_1B410E1E8(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = sub_1B410A800();
    if (*(void *)(v5 + 8))
    {
      uint64_t v6 = (void **)(v3[7] + v3[8]);
      swift_beginAccess();
      uint64_t v7 = *v6;
      id v8 = v7;
      sub_1B40F282C((uint64_t)v7);
    }
    ((void (*)(void *, void))v4)(v3, 0);
  }

  free(v3);
}

uint64_t sub_1B410E2D8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410E340(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing, (void (*)(void))sub_1B40F2ADC);
}

uint64_t sub_1B410E360@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1C0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410E3C8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1C8))(*a1);
}

void (*sub_1B410E428(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410E494;
}

void sub_1B410E494(void **a1, char a2)
{
}

uint64_t sub_1B410E508()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B410E5BC(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_1B410E610@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1D8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B410E674(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1E0);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B410E6E0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B410E784()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410E7EC(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview, (void (*)(void))sub_1B40F2CFC);
}

uint64_t sub_1B410E80C@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1F0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410E874(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1F8))(*a1);
}

void (*sub_1B410E8D4(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410E940;
}

void sub_1B410E940(void **a1, char a2)
{
}

uint64_t sub_1B410E9A0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410EA34(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t sub_1B410EA80@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x208))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410EAE8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x210))(*a1);
}

uint64_t (*sub_1B410EB48())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B410EBEC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410EC54(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView, (void (*)(void))sub_1B40F2F1C);
}

uint64_t sub_1B410EC74@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x220))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410ECDC(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x228))(*a1);
}

void (*sub_1B410ED3C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410EDA8;
}

void sub_1B410EDA8(void **a1, char a2)
{
}

uint64_t sub_1B410EE08()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410EE70(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter, (void (*)(void))sub_1B40F313C);
}

uint64_t sub_1B410EE90@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x238))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410EEF8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x240))(*a1);
}

void (*sub_1B410EF58(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410EFC4;
}

void sub_1B410EFC4(void **a1, char a2)
{
}

uint64_t sub_1B410F024()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410F08C(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview, (void (*)(void))sub_1B40F335C);
}

uint64_t sub_1B410F0AC@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x250))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410F114(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x258))(*a1);
}

void (*sub_1B410F174(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410F1E0;
}

void sub_1B410F1E0(void **a1, char a2)
{
}

uint64_t sub_1B410F240()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410F2A8(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses, (void (*)(void))sub_1B40F357C);
}

uint64_t sub_1B410F2C8@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x268))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410F330(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x270))(*a1);
}

void (*sub_1B410F390(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410F3FC;
}

void sub_1B410F3FC(void **a1, char a2)
{
}

uint64_t sub_1B410F45C()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410F4C4(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview, (void (*)(void))sub_1B40F379C);
}

uint64_t sub_1B410F4E4@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x280))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410F54C(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x288))(*a1);
}

void (*sub_1B410F5AC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410F618;
}

void sub_1B410F618(void **a1, char a2)
{
}

uint64_t sub_1B410F678()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410F6E0(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview, (void (*)(void))sub_1B40F39BC);
}

uint64_t sub_1B410F700@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x298))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410F768(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2A0))(*a1);
}

void (*sub_1B410F7C8(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410F834;
}

void sub_1B410F834(void **a1, char a2)
{
}

uint64_t sub_1B410F894()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410F8FC(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview, (void (*)(void))sub_1B40F3BDC);
}

uint64_t sub_1B410F91C@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2B0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410F984(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2B8))(*a1);
}

void (*sub_1B410F9E4(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410FA50;
}

void sub_1B410FA50(void **a1, char a2)
{
}

uint64_t sub_1B410FAB0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410FB18(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems, (void (*)(void))sub_1B40F3E04);
}

uint64_t sub_1B410FB38@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2C8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410FBA0(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2D0))(*a1);
}

void (*sub_1B410FC00(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410FC6C;
}

void sub_1B410FC6C(void **a1, char a2)
{
}

uint64_t sub_1B410FCCC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410FD34(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage, (void (*)(void))sub_1B40F4024);
}

uint64_t sub_1B410FD54@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2E0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410FDBC(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2E8))(*a1);
}

void (*sub_1B410FE1C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B410FE88;
}

void sub_1B410FE88(void **a1, char a2)
{
}

uint64_t sub_1B410FEE8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B410FF50(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage, (void (*)(void))sub_1B40F4244);
}

uint64_t sub_1B410FF70@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2F8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B410FFD8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x300))(*a1);
}

void (*sub_1B4110038(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B41100A4;
}

void sub_1B41100A4(void **a1, char a2)
{
}

uint64_t sub_1B4110104()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B411016C(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage, (void (*)(void))sub_1B40F4464);
}

uint64_t sub_1B411018C@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x310))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B41101F4(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x318))(*a1);
}

void (*sub_1B4110254(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B41102C0;
}

void sub_1B41102C0(void **a1, char a2)
{
}

uint64_t sub_1B4110320()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B4110388(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem, (void (*)(void))sub_1B40F4684);
}

uint64_t sub_1B41103A8@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x328))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B4110410(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x330))(*a1);
}

void (*sub_1B4110470(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B41104DC;
}

void sub_1B41104DC(void **a1, char a2)
{
}

uint64_t sub_1B411053C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B41105A4(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode, (void (*)(void))sub_1B40F48A8);
}

uint64_t sub_1B41105C4@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x340))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B411062C(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x348))(*a1);
}

void (*sub_1B411068C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B41106F8;
}

void sub_1B41106F8(void **a1, char a2)
{
}

uint64_t sub_1B4110758()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B41107C0(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode, (void (*)(void))sub_1B40F4AC8);
}

uint64_t sub_1B41107E0@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x358))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B4110848(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x360))(*a1);
}

void (*sub_1B41108A8(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B4110914;
}

void sub_1B4110914(void **a1, char a2)
{
}

uint64_t sub_1B4110974()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView);
  swift_beginAccess();
  return *v1;
}

void sub_1B41109DC(char *a1, uint64_t a2, char a3, void *a4, void (*a5)(void))
{
  id v8 = &a1[*a4];
  swift_beginAccess();
  *id v8 = a3;
  uint64_t v9 = a1;
  id v10 = sub_1B410A800();
  if (*(void *)(v11 + 8))
  {
    swift_beginAccess();
    a5(*v8);
  }
  ((void (*)(char *, void))v10)(v12, 0);
}

uint64_t sub_1B4110A9C(char a1)
{
  return sub_1B4110ABC(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView, (void (*)(void))sub_1B40F4CF0);
}

uint64_t sub_1B4110ABC(char a1, void *a2, void (*a3)(void))
{
  uint64_t v6 = (unsigned char *)(v3 + *a2);
  swift_beginAccess();
  *uint64_t v6 = a1;
  uint64_t v7 = sub_1B410A800();
  if (*(void *)(v8 + 8))
  {
    swift_beginAccess();
    a3(*v6);
  }
  return ((uint64_t (*)(unsigned char *, void))v7)(v10, 0);
}

uint64_t sub_1B4110B68@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x370))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B4110BD0(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x378))(*a1);
}

void (*sub_1B4110C30(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1B4110C9C;
}

void sub_1B4110C9C(void **a1, char a2)
{
}

void sub_1B4110CB4(void **a1, char a2, void (*a3)(void))
{
  uint64_t v5 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = sub_1B410A800();
    if (*(void *)(v7 + 8))
    {
      uint64_t v8 = (unsigned __int8 *)(v5[7] + v5[8]);
      swift_beginAccess();
      a3(*v8);
    }
    ((void (*)(void *, void))v6)(v5, 0);
  }

  free(v5);
}

id EKEventViewControllerOOPImpl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventViewControllerOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1B4110E3C()
{
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_WORD *)v1 + 40) = 0;
  uint64_t v2 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventOOPHostViewModel();
  *(void *)&v0[v2] = sub_1B4101D38();
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview] = 1;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton] = 1;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView] = 0;

  sub_1B411ECC8();
  __break(1u);
}

void sub_1B4110FF0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {

    sub_1B40DA270(a3);
    sub_1B40DA270(a5);
    sub_1B40DA270(a7);
  }
}

void sub_1B4111070(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    id v10 = a2;
    sub_1B40DA260(a3);
    sub_1B40DA260(a5);
    sub_1B40DA260(a7);
  }
}

uint64_t sub_1B41110F0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B4111128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_beginAccess();
  uint64_t v17 = (void *)MEMORY[0x1BA986210](v8 + 16);
  if (v17)
  {
    uint64_t v18 = v17;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v17) + 0x178))(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

void sub_1B4111218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = (void *)MEMORY[0x1BA986210](v3 + 16);
  if (v7)
  {
    uint64_t v8 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v7) + 0x180))(a1, a2, a3);
  }
}

void sub_1B41112D0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1BA986210](v1 + 16);
  if (v3)
  {
    uint64_t v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x188))(a1);
  }
}

uint64_t sub_1B4111364(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
  id v5 = a1;

  uint64_t v6 = sub_1B410A800();
  if (*(void *)(v7 + 8))
  {
    swift_beginAccess();
    uint64_t v8 = *v3;
    id v9 = v8;
    sub_1B40F282C((uint64_t)v8);
  }
  return ((uint64_t (*)(unsigned char *, void))v6)(v11, 0);
}

uint64_t method lookup function for EKEventViewControllerOOPImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKEventViewControllerOOPImpl);
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.hasInProcessNavBar.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.hasInProcessNavBar.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.hasInProcessNavBar.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.doneButtonTapped()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.eventEditViewCompleted(with:eventID:waitUntil:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.eventEditViewPresented(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.event.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.event.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.event.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsEditing.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsEditing.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsEditing.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsCalendarPreview.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsCalendarPreview.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsCalendarPreview.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDoneButton.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDoneButton.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDoneButton.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.calendarPreviewIsInlineDayView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.calendarPreviewIsInlineDayView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.calendarPreviewIsInlineDayView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.inlineDayViewRespectsSelectedCalendarsFilter.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.inlineDayViewRespectsSelectedCalendarsFilter.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.inlineDayViewRespectsSelectedCalendarsFilter.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.ICSPreview.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.ICSPreview.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.ICSPreview.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsInviteResponses.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsInviteResponses.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsInviteResponses.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsAddToCalendarForICSPreview.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsAddToCalendarForICSPreview.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsAddToCalendarForICSPreview.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsUpdateCalendarForICSPreview.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsUpdateCalendarForICSPreview.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsUpdateCalendarForICSPreview.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDeleteForICSPreview.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDeleteForICSPreview.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDeleteForICSPreview.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsSubitems.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsSubitems.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsSubitems.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsOutOfDateMessage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsOutOfDateMessage.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsOutOfDateMessage.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegatorMessage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegatorMessage.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x300))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegatorMessage.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegateMessage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x310))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegateMessage.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x318))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegateMessage.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x320))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDetectedConferenceItem.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x328))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDetectedConferenceItem.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x330))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDetectedConferenceItem.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x338))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.minimalMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x340))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.minimalMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x348))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.minimalMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x350))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.noninteractivePlatterMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x358))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.noninteractivePlatterMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x360))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.noninteractivePlatterMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x368))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.isLargeDayView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x370))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.isLargeDayView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x378))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.isLargeDayView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x380))();
}

uint64_t sub_1B41123A8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B41123F0(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_remoteUIConfigured);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1B411243C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4112498()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B411250C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B4112568(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xA8);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1B41125CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1B411E5E8();
}

void (*sub_1B4112638(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B4100808;
}

uint64_t sub_1B41126C4()
{
  return sub_1B4100B90((uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration, &qword_1E9CFCDE8);
}

uint64_t sub_1B41126D8(uint64_t a1)
{
  return sub_1B4112A64(a1, &qword_1E9CFCDF0, (uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration, &qword_1E9CFCDE8);
}

void (*sub_1B41126F4(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCDF0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCDE8);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B410094C;
}

uint64_t sub_1B4112804()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B4112878@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xD0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B41128D4(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xD8);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_1B411293C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1B411E5E8();
}

void (*sub_1B41129A8(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B4100808;
}

uint64_t sub_1B4112A34()
{
  return sub_1B4100B90((uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event, &qword_1E9CFCE00);
}

uint64_t sub_1B4112A48(uint64_t a1)
{
  return sub_1B4112A64(a1, &qword_1E9CFCE08, (uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event, &qword_1E9CFCE00);
}

uint64_t sub_1B4112A64(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

void (*sub_1B4112B94(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCE08);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCE00);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B410094C;
}

uint64_t sub_1B4112CA4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_layoutDirection;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B4112CEC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_layoutDirection);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_1B4112D38())()
{
  return j_j__swift_endAccess;
}

id sub_1B4112D94()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void sub_1B4112DEC(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B4112E40())()
{
  return j__swift_endAccess;
}

void *sub_1B4112E9C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4112EEC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B4112F40())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4112F9C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_hasInProcessNavBar);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B4112FE4(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_hasInProcessNavBar);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1B4113030())()
{
  return j_j__swift_endAccess;
}

id sub_1B411308C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCE00);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCDE8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_remoteUIConfigured] = 0;
  id v9 = &v0[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration];
  type metadata accessor for _AppExtensionEventHostView.Configuration(0);
  uint64_t v10 = v0;
  uint64_t v18 = sub_1B40F62A8();
  sub_1B411E598();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  uint64_t v11 = &v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event];
  uint64_t v18 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCDF8);
  sub_1B411E598();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v11, v4, v1);
  *(void *)&v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_layoutDirection] = 0;
  char v12 = (void *)*MEMORY[0x1E4FB27F0];
  *(void *)&v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_sizeCategory] = *MEMORY[0x1E4FB27F0];
  *(void *)&v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_viewHierarchy] = 0;
  v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_hasInProcessNavBar] = 0;
  id v13 = v12;

  uint64_t v14 = (objc_class *)type metadata accessor for EKEventOOPHostViewModel();
  v17.receiver = v10;
  v17.super_class = v14;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for EKEventOOPHostViewModel()
{
  uint64_t result = qword_1E9CFE250;
  if (!qword_1E9CFE250) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_1B4113344()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B4113458@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKEventOOPHostViewModel();
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

uint64_t sub_1B4113498()
{
  return type metadata accessor for EKEventOOPHostViewModel();
}

void sub_1B41134A0()
{
  sub_1B4113598();
  if (v0 <= 0x3F)
  {
    sub_1B41135F0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1B4113598()
{
  if (!qword_1E9CFCE10)
  {
    type metadata accessor for _AppExtensionEventHostView.Configuration(255);
    unint64_t v0 = sub_1B411E5F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9CFCE10);
    }
  }
}

void sub_1B41135F0()
{
  if (!qword_1E9CFCE18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFCDF8);
    unint64_t v0 = sub_1B411E5F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9CFCE18);
    }
  }
}

double sub_1B411364C@<D0>(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CAD0]), sel_init);
  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  sub_1B41171D0(&qword_1E9CFCE20, (void (*)(uint64_t))type metadata accessor for EKCalendarChooserOOPHostViewModel);
  *(void *)a1 = sub_1B411E628();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v3;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_WORD *)(a1 + 80) = 0;
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = v2;
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_WORD *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = 0;
  *(unsigned char *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 140) = 0;
  *(_WORD *)(a1 + 144) = 0;
  return result;
}

uint64_t sub_1B4113718@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v44 = a1;
  uint64_t v41 = sub_1B411E618();
  MEMORY[0x1F4188790](v41);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1B411E9B8();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCE28);
  MEMORY[0x1F4188790](v40);
  id v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v45 = *(_OWORD *)v1;
  uint64_t v10 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & **((void **)&v45 + 1)) + 0x90);
  id v11 = *((id *)&v45 + 1);
  v10();
  sub_1B40DA960((uint64_t)&v45);
  type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
  sub_1B41171D0(&qword_1E9CFCE30, (void (*)(uint64_t))type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration);
  uint64_t v38 = sub_1B411E628();
  uint64_t v39 = v12;
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v13 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v14;
  *(_OWORD *)(v13 + 144) = *(_OWORD *)(v1 + 128);
  *(_WORD *)(v13 + 160) = *(_WORD *)(v1 + 144);
  long long v15 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v13 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v13 + 64) = v15;
  long long v16 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v13 + 96) = v16;
  long long v17 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v13 + 32) = v17;
  uint64_t v18 = swift_allocObject();
  long long v19 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v18 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v18 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v19;
  *(_OWORD *)(v18 + 144) = *(_OWORD *)(v1 + 128);
  *(_WORD *)(v18 + 160) = *(_WORD *)(v1 + 144);
  long long v20 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v18 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v18 + 64) = v20;
  long long v21 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v18 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v18 + 96) = v21;
  long long v22 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v18 + 32) = v22;
  sub_1B40E91A4(v1);
  sub_1B40E91A4(v1);
  unsigned __int8 v23 = sub_1B411E718();
  unsigned __int8 v24 = sub_1B411E728();
  unsigned __int8 v25 = sub_1B411E748();
  char v26 = sub_1B411E738();
  sub_1B411E738();
  if (sub_1B411E738() != v23) {
    char v26 = sub_1B411E738();
  }
  sub_1B411E738();
  if (sub_1B411E738() != v24) {
    char v26 = sub_1B411E738();
  }
  sub_1B411E738();
  if (sub_1B411E738() != v25) {
    char v26 = sub_1B411E738();
  }
  uint64_t v27 = sub_1B411E638();
  uint64_t v28 = swift_allocObject();
  long long v29 = *(_OWORD *)(v2 + 112);
  *(_OWORD *)(v28 + 112) = *(_OWORD *)(v2 + 96);
  *(_OWORD *)(v28 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v29;
  *(_OWORD *)(v28 + 144) = *(_OWORD *)(v2 + 128);
  *(_WORD *)(v28 + 160) = *(_WORD *)(v2 + 144);
  long long v30 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v28 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v28 + 64) = v30;
  long long v31 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v28 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v28 + 96) = v31;
  long long v32 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v28 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v28 + 32) = v32;
  sub_1B40E91A4(v2);
  sub_1B411E9A8();
  uint64_t v33 = v42;
  uint64_t v34 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(&v4[*(int *)(v41 + 20)], v7, v43);
  *(void *)uint64_t v4 = &unk_1E9CFCE40;
  *((void *)v4 + 1) = v28;
  sub_1B40DC65C((uint64_t)v4, (uint64_t)&v9[*(int *)(v40 + 36)]);
  uint64_t v35 = v39;
  *(void *)id v9 = v38;
  *((void *)v9 + 1) = v35;
  *((void *)v9 + 2) = sub_1B4117220;
  *((void *)v9 + 3) = v18;
  *((void *)v9 + 4) = sub_1B4104174;
  *((void *)v9 + 5) = v13;
  *((void *)v9 + 6) = v27;
  v9[56] = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1B40DC6C0((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v34);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B41173A8((uint64_t)v9, v44);
}

uint64_t sub_1B4113B9C(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_1B411E4F8();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_1B411E518();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_1B411E538();
  v1[12] = v4;
  v1[13] = *(void *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1B411E998();
  v1[16] = sub_1B411E988();
  uint64_t v6 = sub_1B411E968();
  v1[17] = v6;
  v1[18] = v5;
  return MEMORY[0x1F4188298](sub_1B4113D4C, v6, v5);
}

uint64_t sub_1B4113D4C()
{
  sub_1B411B9E4();
  swift_bridgeObjectRetain();
  sub_1B411E4E8();
  sub_1B411E528();
  sub_1B411E508();
  v0[19] = sub_1B411E988();
  uint64_t v1 = sub_1B41171D0((unint64_t *)&unk_1E9CFC370, MEMORY[0x1E4F25828]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1B4113E94;
  uint64_t v3 = v0[6];
  return MEMORY[0x1F4187C78](v0 + 2, v3, v1);
}

uint64_t sub_1B4113E94()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 16_Block_object_dispose(&STACK[0x2D0], 8) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  if (v0)
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B41142CC;
  }
  else
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_1B411E968();
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1B411402C;
  }
  return MEMORY[0x1F4188298](v7, v4, v6);
}

uint64_t sub_1B411402C()
{
  swift_release();
  v0[22] = v0[2];
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B4114098, v1, v2);
}

uint64_t sub_1B4114098()
{
  if (v0[22])
  {
    return MEMORY[0x1F4188298](sub_1B41141C4, 0, 0);
  }
  else
  {
    uint64_t v2 = v0[7];
    uint64_t v1 = v0[8];
    uint64_t v3 = v0[6];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    uint64_t v5 = v0[13];
    uint64_t v4 = v0[14];
    uint64_t v6 = v0[12];
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_1B41141C4()
{
  *(void *)(v0 + 184) = sub_1B411E988();
  uint64_t v2 = sub_1B411E968();
  return MEMORY[0x1F4188298](sub_1B4114250, v2, v1);
}

uint64_t sub_1B4114250()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = (long long *)v0[5];
  swift_release();
  sub_1B4114578(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  return MEMORY[0x1F4188298](sub_1B40DB0BC, v3, v4);
}

uint64_t sub_1B41142CC()
{
  v0[3] = v0[21];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFCC80);
  swift_willThrowTypedImpl();
  swift_release();
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  return MEMORY[0x1F4188298](sub_1B4114360, v1, v2);
}

uint64_t sub_1B4114360()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1B411EA18();
  uint64_t v4 = *sub_1B40EC57C();
  os_log_type_t v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    uint64_t v6 = (void *)v0[21];
    id v7 = v6;
    id v8 = v6;
    uint64_t v9 = v4;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v6;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v13;
    sub_1B411EAF8();
    *id v11 = v13;

    _os_log_impl(&dword_1B3F4C000, v9, v5, "EKCalendarChooserOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v11, -1, -1);
    MEMORY[0x1BA986180](v10, -1, -1);
  }
  else
  {
    uint64_t v6 = (void *)v0[21];
  }

  uint64_t v15 = v0[13];
  uint64_t v14 = v0[14];
  uint64_t v16 = v0[12];
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void sub_1B4114578(uint64_t a1, long long *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1B411E568();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  id v11 = &v38[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v14 = &v38[-v13];
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = &v38[-v15];
  if (!*(void *)(a1 + 16))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  long long v17 = *(void (**)(unsigned char *, unint64_t, uint64_t))(v8 + 16);
  v17(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_1B40E1C58((uint64_t)v6, &qword_1E9CFC168);
    sub_1B411EA18();
    id v30 = (id)*sub_1B40EC57C();
    sub_1B411E578();

    return;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v16, v6, v7);
  long long v46 = *a2;
  uint64_t v18 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **((void **)&v46 + 1)) + 0x80);
  uint64_t v43 = *((void *)&v46 + 1);
  uint64_t v42 = *((id *)&v46 + 1);
  v18(1);
  sub_1B40DA960((uint64_t)&v46);
  os_log_type_t v19 = sub_1B411EA28();
  long long v20 = *sub_1B40EC57C();
  v17(v14, (unint64_t)v16, v7);
  v17(v11, (unint64_t)v16, v7);
  if (os_log_type_enabled(v20, v19))
  {
    os_log_t v41 = v20;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v45 = v40;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v22 = sub_1B411E548();
    uint64_t v44 = sub_1B40DFA70(v22, v23, &v45);
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    int v39 = v19;
    unsigned __int8 v24 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v24(v14, v7);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v25 = sub_1B411E558();
    uint64_t v44 = sub_1B40DFA70(v25, v26, &v45);
    uint64_t v27 = v24;
    sub_1B411EAF8();
    swift_bridgeObjectRelease();
    v24(v11, v7);
    os_log_t v28 = v41;
    _os_log_impl(&dword_1B3F4C000, v41, (os_log_type_t)v39, "EKCalendarChooserOOPHostView: EventKitUI AppExtensionQuery Found: %s (%s) RemoteUI Extension", (uint8_t *)v21, 0x16u);
    uint64_t v29 = v40;
    swift_arrayDestroy();
    MEMORY[0x1BA986180](v29, -1, -1);
    MEMORY[0x1BA986180](v21, -1, -1);
  }
  else
  {
    uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v27(v14, v7);
    v27(v11, v7);
  }
  long long v31 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v42) + 0x90);
  long long v32 = v42;
  uint64_t v33 = v31();
  sub_1B40DA960((uint64_t)&v46);
  uint64_t v34 = (uint64_t *)sub_1B411BA68();
  uint64_t v35 = *v34;
  uint64_t v36 = v34[1];
  uint64_t v37 = *(void (**)(unsigned char *, uint64_t, uint64_t, void *))(*(void *)v33 + 408);
  sub_1B40DC424((uint64_t)&v46);
  swift_bridgeObjectRetain();
  v37(v16, v35, v36, v32);
  sub_1B40DA960((uint64_t)&v46);
  swift_release();
  swift_bridgeObjectRelease();
  v27(v16, v7);
}

uint64_t sub_1B4114AFC(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 48);
  id v4 = a1;

  *(void *)(v1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = a1;
  uint64_t v5 = *(void **)(v1 + 8);
  uint64_t v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x90);
  uint64_t v7 = v5;
  uint64_t v8 = v6();

  uint64_t v9 = *(void (**)(void *))(*(void *)v8 + 208);
  id v10 = v4;
  v9(a1);

  return swift_release();
}

uint64_t sub_1B4114BD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EAA8();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0x6F697463656C6573, 0xEE00656C7974536ELL, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4114DF4(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
  return sub_1B4114BD4();
}

uint64_t sub_1B4114DFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EAA8();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0x5379616C70736964, 0xEC000000656C7974, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4115018(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  return sub_1B4114DFC();
}

uint64_t sub_1B4115020()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t result = *(void *)(v1 + 72);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = sub_1B411EAA8();
    uint64_t v9 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
    id v11 = v10;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v11;
    *id v11 = 0x8000000000000000;
    sub_1B40FA61C(v8, 0x7954797469746E65, 0xEA00000000006570, isUniquelyReferenced_nonNull_native);
    *id v11 = v19;
    swift_bridgeObjectRelease();
    v9(v20, 0);
    swift_release();
    uint64_t v13 = *(void **)(v1 + 8);
    uint64_t v14 = *(uint64_t (**)(void))((*v3 & *v13) + 0x90);
    uint64_t v15 = v13;
    uint64_t v16 = v14();

    long long v17 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v16 + 336))(v20);
    BOOL *v18 = !*v18;
    v17(v20, 0);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B4115234(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  return sub_1B4115020();
}

uint64_t sub_1B411523C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000013, 0x80000001B4147610, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4115454(char a1)
{
  *(unsigned char *)(v1 + 80) = a1;
  return sub_1B411523C();
}

uint64_t sub_1B411545C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000015, 0x80000001B4147630, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4115674(char a1)
{
  *(unsigned char *)(v1 + 81) = a1;
  return sub_1B411545C();
}

uint64_t sub_1B411567C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  uint64_t v7 = *(uint64_t (**)(unsigned char *))(*(void *)v6 + 312);
  id v8 = *(id *)(v1 + 88);
  uint64_t v9 = (void (*)(unsigned char *, void))v7(v21);
  id v11 = v10;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v20 = *v11;
  *id v11 = 0x8000000000000000;
  sub_1B40FA61C((uint64_t)v8, 0xD000000000000013, 0x80000001B4149970, isUniquelyReferenced_nonNull_native);
  *id v11 = v20;
  swift_bridgeObjectRelease();
  v9(v21, 0);
  swift_release();
  uint64_t v13 = *(void **)(v1 + 8);
  uint64_t v14 = *(uint64_t (**)(void))((*v3 & *v13) + 0x90);
  uint64_t v15 = v13;
  uint64_t v16 = v14();

  long long v17 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v16 + 336))(v21);
  BOOL *v18 = !*v18;
  v17(v21, 0);
  return swift_release();
}

void sub_1B4115878(id obj)
{
  objc_storeStrong((id *)(v1 + 88), obj);
  sub_1B411567C();
}

uint64_t sub_1B41158BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  id v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000015, 0x80000001B4147670, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4115AD4(char a1)
{
  *(unsigned char *)(v1 + 96) = a1;
  return sub_1B41158BC();
}

uint64_t sub_1B4115ADC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  id v7 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)(v1 + 104));
  id v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C((uint64_t)v7, 0x4D7265736F6F6863, 0xEB0000000065646FLL, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4115CF4(uint64_t a1)
{
  *(void *)(v1 + 104) = a1;
  return sub_1B4115ADC();
}

uint64_t sub_1B4115CFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  id v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000021, 0x80000001B41476A0, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4115F14(char a1)
{
  *(unsigned char *)(v1 + 112) = a1;
  return sub_1B4115CFC();
}

uint64_t sub_1B4115F1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  id v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  id v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *id v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000013, 0x80000001B41476D0, isUniquelyReferenced_nonNull_native);
  *id v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  uint64_t v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4116134(char a1)
{
  *(unsigned char *)(v1 + 113) = a1;
  return sub_1B4115F1C();
}

id sub_1B411613C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 120);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  if (!v2)
  {
    uint64_t v15 = *(void **)(v0 + 8);
    uint64_t v16 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v15) + 0x90);
    long long v17 = v15;
    uint64_t v18 = v16();

    uint64_t v19 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v18 + 312))(v27);
    sub_1B411A798(0xD000000000000011, 0x80000001B4149950);
    swift_unknownObjectRelease();
    v19(v27, 0);
    goto LABEL_5;
  }
  id v4 = *(void **)(v0 + 8);
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x90);
  uint64_t v6 = v4;
  id v7 = v2;
  uint64_t v8 = v5();

  id result = objc_msgSend(v7, sel_sourceIdentifier);
  if (result)
  {
    uint64_t v10 = (uint64_t)result;
    id v11 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v8 + 312))(v27);
    uint64_t v13 = v12;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = *v13;
    *uint64_t v13 = 0x8000000000000000;
    sub_1B40FA61C(v10, 0xD000000000000011, 0x80000001B4149950, isUniquelyReferenced_nonNull_native);
    *uint64_t v13 = v26;
    swift_bridgeObjectRelease();
    v11(v27, 0);

LABEL_5:
    swift_release();
    uint64_t v20 = *(void **)(v1 + 8);
    uint64_t v21 = *(uint64_t (**)(void))((*v3 & *v20) + 0x90);
    uint64_t v22 = v20;
    uint64_t v23 = v21();

    unsigned __int8 v24 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v23 + 336))(v27);
    *uint64_t v25 = !*v25;
    v24(v27, 0);
    return (id)swift_release();
  }
  __break(1u);
  return result;
}

void sub_1B4116428(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 120);
  id v4 = a1;

  *(void *)(v1 + 120) = a1;
  sub_1B411613C();
}

id sub_1B4116484()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 128);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  if (!v2)
  {
    uint64_t v15 = *(void **)(v0 + 8);
    uint64_t v16 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v15) + 0x90);
    long long v17 = v15;
    uint64_t v18 = v16();

    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
    uint64_t v20 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v18 + 312))(v32);
    uint64_t v22 = v21;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v31 = *v22;
    uint64_t *v22 = 0x8000000000000000;
    sub_1B40FA61C((uint64_t)v19, 0xD000000000000010, 0x80000001B4147960, isUniquelyReferenced_nonNull_native);
    uint64_t *v22 = v31;
    swift_bridgeObjectRelease();
    v20(v32, 0);
    goto LABEL_5;
  }
  id v4 = *(void **)(v0 + 8);
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v4) + 0x90);
  uint64_t v6 = v4;
  id v7 = v2;
  uint64_t v8 = v5();

  id result = objc_msgSend(v7, sel_calendarIdentifier);
  if (result)
  {
    uint64_t v10 = (uint64_t)result;
    id v11 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v8 + 312))(v32);
    uint64_t v13 = v12;
    char v14 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v13;
    *uint64_t v13 = 0x8000000000000000;
    sub_1B40FA61C(v10, 0xD000000000000010, 0x80000001B4147960, v14);
    *uint64_t v13 = v30;
    swift_bridgeObjectRelease();
    v11(v32, 0);

LABEL_5:
    swift_release();
    unsigned __int8 v24 = *(void **)(v1 + 8);
    uint64_t v25 = *(uint64_t (**)(void))((*v3 & *v24) + 0x90);
    uint64_t v26 = v24;
    uint64_t v27 = v25();

    os_log_t v28 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v27 + 336))(v32);
    *uint64_t v29 = !*v29;
    v28(v32, 0);
    return (id)swift_release();
  }
  __break(1u);
  return result;
}

void sub_1B41167BC(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 128);
  id v4 = a1;

  *(void *)(v1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = a1;
  sub_1B4116484();
}

uint64_t sub_1B4116818()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD00000000000001ALL, 0x80000001B41476F0, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  char v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4116A30(char a1)
{
  *(unsigned char *)(v1 + 136) = a1;
  return sub_1B4116818();
}

uint64_t sub_1B4116A38()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  id v7 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, *(unsigned int *)(v1 + 140));
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C((uint64_t)v7, 0xD000000000000013, 0x80000001B4147720, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  char v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4116C4C(int a1)
{
  *(_DWORD *)(v1 + 140) = a1;
  return sub_1B4116A38();
}

uint64_t sub_1B4116C54()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000011, 0x80000001B4147740, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  char v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B4116E6C(char a1)
{
  *(unsigned char *)(v1 + 144) = a1;
  return sub_1B4116C54();
}

uint64_t sub_1B4116E74()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  uint64_t v5 = v2;
  uint64_t v6 = v4();

  sub_1B40E1BC8(0, &qword_1E9CFC350);
  uint64_t v7 = sub_1B411EA98();
  uint64_t v8 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 312))(v20);
  uint64_t v10 = v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1B40FA61C(v7, 0xD000000000000019, 0x80000001B4147760, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  uint64_t v12 = *(void **)(v1 + 8);
  uint64_t v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  char v14 = v12;
  uint64_t v15 = v13();

  uint64_t v16 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v15 + 336))(v20);
  BOOL *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1B411708C(char a1)
{
  *(unsigned char *)(v1 + 145) = a1;
  return sub_1B4116E74();
}

uint64_t sub_1B4117094()
{
  long long v4 = *v0;
  uint64_t v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **((void **)&v4 + 1)) + 0x90))(*((id *)&v4 + 1));
  uint64_t v2 = sub_1B40DA960((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(void *)v1 + 392))(v2);
  return swift_release();
}

uint64_t sub_1B4117154@<X0>(uint64_t a1@<X8>)
{
  return sub_1B4113718(a1);
}

uint64_t type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(uint64_t a1)
{
  return sub_1B40E01B8(a1, (uint64_t *)&unk_1E9CFE480);
}

uint64_t sub_1B41171D0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B4117220(uint64_t result, char a2)
{
  uint64_t v3 = *(void (**)(uint64_t, void))(v2 + 32);
  if (v3)
  {
    uint64_t v5 = result;
    swift_retain();
    v3(v5, a2 & 1);
    return sub_1B40DA270((uint64_t)v3);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 162, 7);
}

uint64_t sub_1B4117314()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1B40DC568;
  return sub_1B4113B9C(v0 + 16);
}

uint64_t sub_1B41173A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B4117410@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1B40E00C8(v3, a1);
}

uint64_t sub_1B4117464(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B41174C0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B411751C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sceneID);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B4117574(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sceneID);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B41175D4())()
{
  return j_j__swift_endAccess;
}

void *sub_1B4117630()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_eventStore);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4117680(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_eventStore);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B41176D4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4117730()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_layoutDirection;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B4117778(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_layoutDirection);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_1B41177C4())()
{
  return j_j__swift_endAccess;
}

id sub_1B4117820()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1B4117878(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B41178CC())()
{
  return j_j__swift_endAccess;
}

void *sub_1B4117928()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4117978(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B41179CC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4117A28()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B4117A74(uint64_t a1)
{
  id v3 = (void *)(v1
                + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_changedCustomViewConfigurationDictionary);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B4117AC8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4117B24()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B4117B98@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 320))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B4117BF0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 328))(*a1);
}

uint64_t sub_1B4117C40()
{
  return sub_1B411E5E8();
}

void (*sub_1B4117CB0(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B40DCEB0;
}

uint64_t sub_1B4117D3C()
{
  return swift_endAccess();
}

uint64_t sub_1B4117DA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1B4117ECC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B40DD1B8;
}

uint64_t sub_1B4117FDC()
{
  uint64_t v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_1B40DA260(*v1);
  return v2;
}

uint64_t sub_1B4118038(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_1B40DA270(v6);
}

uint64_t (*sub_1B4118098())()
{
  return j_j__swift_endAccess;
}

void (*sub_1B41180F4())(void)
{
  uint64_t result = (void (*)(void))(*(uint64_t (**)(void))(*(void *)v0 + 368))();
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1B40DA270(v2);
  }
  return result;
}

uint64_t sub_1B4118174()
{
  uint64_t v0 = swift_allocObject();
  sub_1B41181AC();
  return v0;
}

uint64_t sub_1B41181AC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity;
  uint64_t v6 = sub_1B411E568();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (void *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sceneID);
  *uint64_t v7 = 0;
  v7[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_eventStore) = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy) = 0;
  *(void *)(v0
            + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_changedCustomViewConfigurationDictionary) = MEMORY[0x1E4FBC868];
  uint64_t v8 = v0
     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration__customViewConfigurationChangedPublisher;
  v13[15] = 0;
  sub_1B411E598();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v2 + 32))(v8, v4, v1);
  uint64_t v9 = (void *)(v0
                + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback);
  void *v9 = 0;
  v9[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_layoutDirection) = 0;
  uint64_t v10 = (void *)*MEMORY[0x1E4FB27F0];
  *(void *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory) = *MEMORY[0x1E4FB27F0];
  id v11 = v10;
  return v0;
}

uint64_t sub_1B4118360(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_1B411E568();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(unsigned char *))(*(void *)v5 + 160))(v12);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 184);
  swift_bridgeObjectRetain();
  uint64_t v16 = v15(a2, a3);
  long long v17 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *a4) + 0xC0))(v16);
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 232))(v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0xD8))(v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 256))(v20);
  uint64_t v22 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0xF0))(v21);
  (*(void (**)(uint64_t))(*(void *)v5 + 280))(v22);
  uint64_t v23 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v5 + 336))(v26);
  *unsigned __int8 v24 = !*v24;
  return v23(v26, 0);
}

uint64_t sub_1B411867C()
{
  sub_1B40E1C58(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity, &qword_1E9CFC168);
  swift_bridgeObjectRelease();

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy));
  swift_bridgeObjectRelease();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration__customViewConfigurationChangedPublisher;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_1B40DA270(*(void *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback));
  return v0;
}

uint64_t sub_1B4118764()
{
  sub_1B411867C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B41187BC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

id sub_1B41187FC(_OWORD *a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity];
  uint64_t v5 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)&v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn] = 0;
  *(void *)&v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent];
  long long v7 = a1[1];
  *(_OWORD *)uint64_t v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  *((_OWORD *)v6 + 2) = a1[2];
  v9.receiver = v3;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(uint64_t a1)
{
  return sub_1B40E01B8(a1, qword_1E9CFE490);
}

uint64_t sub_1B41188EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1B40E00C8(v3, a1);
}

uint64_t sub_1B4118940(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1B40E0130(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1B411899C())()
{
  return j_j__swift_endAccess;
}

void *sub_1B41189F8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B4118A48(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char *v3 = a1;
}

uint64_t (*sub_1B4118A9C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B4118AF8()
{
  return swift_retain();
}

uint64_t sub_1B4118B44(uint64_t a1)
{
  id v3 = (void *)(v1
                + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_configurationChangedPublisherSink);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1B4118B98())()
{
  return j__swift_endAccess;
}

void sub_1B4118BF4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC178);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  long long v7 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id aBlock = 0;
  id v8 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (!v8)
  {
    id v44 = aBlock;
    uint64_t v45 = (void *)sub_1B411E458();

    swift_willThrow();
    os_log_type_t v46 = sub_1B411EA18();
    id v47 = *sub_1B40EC57C();
    if (os_log_type_enabled(v47, v46))
    {
      id v48 = v45;
      id v49 = v45;
      id v50 = v47;
      id v51 = (uint8_t *)swift_slowAlloc();
      double v52 = (void *)swift_slowAlloc();
      *(_DWORD *)id v51 = 138412290;
      id v53 = v45;
      double v54 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id aBlock = v54;
      sub_1B411EAF8();
      *double v52 = v54;

      _os_log_impl(&dword_1B3F4C000, v50, v46, "Error: _AppExtensionCalendarChooserHostView Setup: Cannot make XPC Connection. %@", v51, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC750);
      swift_arrayDestroy();
      MEMORY[0x1BA986180](v52, -1, -1);
      MEMORY[0x1BA986180](v51, -1, -1);
    }
    else
    {
    }
    return;
  }
  objc_super v9 = v8;
  uint64_t v72 = v5;
  uint64_t v73 = v4;
  uint64_t v10 = *(void (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x98);
  id v11 = aBlock;
  id v12 = v9;
  v10(v9);
  objc_msgSend(v12, sel_setExportedInterface_, *sub_1B40EB6A0());
  objc_msgSend(v12, sel_setRemoteObjectInterface_, *sub_1B40EB984());
  objc_msgSend(v12, sel_setExportedObject_, v2);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v79 = sub_1B411A408;
  uint64_t v80 = v13;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v76 = 1107296256;
  uint64_t v77 = sub_1B40DE4D8;
  id v78 = &block_descriptor_3;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v12, sel_setInterruptionHandler_, v14);
  _Block_release(v14);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v79 = sub_1B411A42C;
  uint64_t v80 = v15;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v76 = 1107296256;
  uint64_t v77 = sub_1B40DE4D8;
  id v78 = &block_descriptor_23_0;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v12, sel_setInvalidationHandler_, v16);
  _Block_release(v16);
  objc_msgSend(v12, sel_resume);
  os_log_type_t v17 = sub_1B411EA28();
  uint64_t v18 = (os_log_t *)sub_1B40EC57C();
  os_log_t v19 = *v18;
  if (os_log_type_enabled(*v18, v17))
  {
    id v20 = v12;
    uint64_t v21 = v19;
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 67109376;
    LODWORD(aBlock) = objc_msgSend(v20, sel_processIdentifier);
    sub_1B411EAF8();
    *(_WORD *)(v22 + _Block_object_dispose(&STACK[0x2D0], 8) = 1024;
    LODWORD(aBlock) = objc_msgSend(v20, sel_effectiveUserIdentifier);
    sub_1B411EAF8();

    _os_log_impl(&dword_1B3F4C000, v21, v17, "_AppExtensionCalendarChooserHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v22, 0xEu);
    MEMORY[0x1BA986180](v22, -1, -1);
  }
  id v23 = objc_msgSend(v12, sel_remoteObjectProxy);
  sub_1B411EB18();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFCEC0);
  if (!swift_dynamicCast())
  {
    sub_1B411EA18();
    double v55 = *v18;
    sub_1B411E578();

LABEL_18:
    return;
  }
  uint64_t v71 = v7;
  unsigned __int8 v24 = v74;
  uint64_t v25 = *(void *)((char *)v2
                  + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                  + 8);
  uint64_t v26 = *(uint64_t (**)(uint64_t))(*(void *)v25 + 272);
  uint64_t v27 = swift_retain();
  uint64_t v28 = v26(v27);
  if (!v28)
  {
    sub_1B411EA18();
    double v55 = *v18;
    sub_1B411E578();

    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_18;
  }
  id v68 = v24;
  uint64_t v69 = (void *)v28;
  uint64_t v70 = (*(uint64_t (**)(void))(*(void *)v25 + 224))();
  uint64_t v29 = (void *)(*(uint64_t (**)(void))(*(void *)v25 + 248))();
  uint64_t v30 = sub_1B411E8C8();

  uint64_t v31 = *(uint64_t (**)(uint64_t))(*(void *)v25 + 200);
  uint64_t v32 = swift_retain();
  uint64_t v33 = (void *)v31(v32);
  swift_release();
  if (!v33)
  {
    uint64_t v43 = 0;
    id v37 = 0;
    goto LABEL_21;
  }
  id v34 = objc_msgSend(v33, sel_connection, v30);
  if (!v34)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v35 = v34;
  id v36 = objc_msgSend(v34, sel_initializationOptions);

  if (!v36)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v37 = objc_msgSend(v36, sel_management);

  id v38 = objc_msgSend(v33, sel_connection);
  if (!v38)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int v39 = v38;
  id v40 = objc_msgSend(v38, sel_initializationOptions);

  if (!v40)
  {
LABEL_28:
    __break(1u);
    return;
  }
  id v41 = objc_msgSend(v40, sel_managementBundleIdentifier);

  if (v41)
  {
    sub_1B411E8C8();
    uint64_t v43 = v42;
  }
  else
  {

    uint64_t v43 = 0;
  }
LABEL_21:
  id v56 = objc_msgSend(self, sel_isLegacyEKUIClient);
  double v57 = (void *)sub_1B411E898();
  swift_bridgeObjectRelease();
  if (v43)
  {
    double v58 = (void *)sub_1B411E898();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v58 = 0;
  }
  id v59 = v68;
  os_log_type_t v60 = v69;
  objc_msgSend(v68, sel_setupViewContextWithViewHierarchy_layoutDirection_sizeCategory_sourceAccountManagement_sourceBundleID_isLegacyClient_, v69, v70, v57, v37, v58, v56);

  os_log_t v61 = v71;
  (*(void (**)(void))(*(void *)v25 + 344))();
  uint64_t v62 = swift_allocObject();
  *(void *)(v62 + 16) = v59;
  *(void *)(v62 + 24) = v25;
  sub_1B40E1AE8(&qword_1E9CFC778, &qword_1E9CFC178);
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v63 = v73;
  uint64_t v64 = sub_1B411E608();
  swift_release();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v61, v63);
  (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xB0))(v64);
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = v59;
  id v66 = *(void (**)(id (*)(), uint64_t))(*(void *)v25 + 376);
  swift_unknownObjectRetain();
  v66(sub_1B411A6CC, v65);
  swift_unknownObjectRelease();

  swift_release();
}

uint64_t sub_1B4119700()
{
  uint64_t v1 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
  objc_msgSend(v2, sel_invalidate);

  id v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x98);

  return v3(0);
}

uint64_t sub_1B4119898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a3;
  uint64_t v10 = sub_1B411E7D8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v5 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent + 32);
  if (v19)
  {
    uint64_t v27 = v11;
    uint64_t v28 = result;
    uint64_t v20 = *(void *)(v5
                    + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                    + 40);
    uint64_t v25 = v16;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v26 = sub_1B411EA38();
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = v19;
    v21[3] = v20;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = v29;
    v21[7] = a4;
    v21[8] = a5;
    void aBlock[4] = sub_1B40E03EC;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_35;
    uint64_t v22 = _Block_copy(aBlock);
    sub_1B40DA260(v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B41171D0((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    id v23 = (void *)v26;
    MEMORY[0x1BA984600](0, v18, v13, v22);
    _Block_release(v22);

    sub_1B40DA270(v19);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v18, v28);
  }
  return result;
}

uint64_t sub_1B4119C84(uint64_t a1, char a2)
{
  uint64_t v5 = sub_1B411E7D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1B411E7F8();
  uint64_t result = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent + 16);
  if (v14)
  {
    uint64_t v15 = *(void *)(v2
                    + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                    + 24);
    uint64_t v21 = v11;
    uint64_t v22 = result;
    sub_1B40E1BC8(0, (unint64_t *)&unk_1E9CFC780);
    swift_retain();
    uint64_t v20 = sub_1B411EA38();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v14;
    *(void *)(v16 + 24) = v15;
    *(void *)(v16 + 32) = a1;
    *(unsigned char *)(v16 + 40) = a2 & 1;
    void aBlock[4] = sub_1B411A764;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40DE4D8;
    aBlock[3] = &block_descriptor_41;
    uint64_t v17 = _Block_copy(aBlock);
    sub_1B40DA260(v14);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1B411E7E8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1B41171D0((unint64_t *)&unk_1E9CFC200, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC790);
    sub_1B40E1AE8(&qword_1E9CFC210, (uint64_t *)&unk_1E9CFC790);
    sub_1B411EB28();
    uint64_t v18 = (void *)v20;
    MEMORY[0x1BA984600](0, v13, v8, v17);
    _Block_release(v17);

    sub_1B40DA270(v14);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v13, v22);
  }
  return result;
}

id sub_1B411A064()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B411A144()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F258A8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCED0);
  sub_1B411E6F8();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1B411A1BC(void *a1, uint64_t a2)
{
  sub_1B411AA40(a1, a2, *(void *)(v2 + 8));
}

id sub_1B411A1C4@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = (objc_class *)type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(0);
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity];
  uint64_t v12 = sub_1B411E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn] = 0;
  *(void *)&v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  uint64_t v13 = &v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent];
  *(void *)uint64_t v13 = v4;
  *((void *)v13 + 1) = v3;
  *((void *)v13 + 2) = v5;
  *((void *)v13 + 3) = v6;
  *((void *)v13 + 4) = v8;
  *((void *)v13 + 5) = v7;
  swift_retain();
  sub_1B40DA260(v5);
  sub_1B40DA260(v8);
  v15.receiver = v10;
  v15.super_class = v9;
  id result = objc_msgSendSuper2(&v15, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1B411A2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B411B978();

  return MEMORY[0x1F40FAB68](a1, a2, a3, v6);
}

uint64_t sub_1B411A344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1B411B978();

  return MEMORY[0x1F40FAB30](a1, a2, a3, v6);
}

void sub_1B411A3A8()
{
}

uint64_t sub_1B411A3D0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B411A408()
{
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_1B411A42C()
{
}

void sub_1B411A438()
{
  sub_1B411EA28();
  id v1 = (id)*sub_1B40EC57C();
  sub_1B411E578();

  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x1BA986210](v0 + 16);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90))();

    if (v4)
    {
      objc_msgSend(v4, sel_setExportedObject_, 0);
    }
  }
}

uint64_t sub_1B411A52C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B411A56C()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v2 + 296))();
  sub_1B40F82F0(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1B411E878();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_updateCalendarChooserViewWithChangedViewConfigurationDictionary_, v4);

  uint64_t v5 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 312))(v9);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  *uint64_t v7 = MEMORY[0x1E4FBC868];
  return v5(v9, 0);
}

uint64_t sub_1B411A694()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1B411A6CC()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_toggleAllCalendars);
}

uint64_t sub_1B411A6DC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1B411A724()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 41, 7);
}

uint64_t sub_1B411A764()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

uint64_t sub_1B411A798(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1B40FA28C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B40FA870();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1B411A868(v6, v9);
  uint64_t *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1B411A868(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    id result = sub_1B411EB38();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1B411ED78();
        swift_bridgeObjectRetain();
        sub_1B411E8D8();
        uint64_t v9 = sub_1B411ED88();
        id result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          objc_super v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *objc_super v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1B411AA40(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B411E4C8();
  MEMORY[0x1F4188790](v5 - 8);
  os_log_type_t v46 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFC168);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1B411E568();
  uint64_t v10 = *(void *)(v49 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v49);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  id v48 = (char *)&v42 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CFC360);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v45 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v42 - v18;
  self;
  if (swift_dynamicCastObjCClass())
  {
    id v20 = a1;
    sub_1B411EA78();
    uint64_t v21 = sub_1B411EA68();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21) == 1)
    {
      id v44 = v20;
      sub_1B40E1C58((uint64_t)v19, (uint64_t *)&unk_1E9CFC360);
      id v23 = *(void (**)(uint64_t))(*(void *)a3 + 152);
      uint64_t v47 = v10;
      uint64_t v24 = swift_retain();
      v23(v24);
      uint64_t v25 = v47;
      swift_release();
      uint64_t v26 = v49;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v9, 1, v49) == 1)
      {

        sub_1B40E1C58((uint64_t)v9, &qword_1E9CFC168);
      }
      else
      {
        uint64_t v42 = v13;
        uint64_t v27 = v48;
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v48, v9, v26);
        uint64_t v28 = *(uint64_t (**)(uint64_t))(*(void *)a3 + 176);
        uint64_t v29 = swift_retain();
        uint64_t v43 = v28(v29);
        unint64_t v31 = v30;
        swift_release();
        if (v31)
        {
          os_log_type_t v32 = sub_1B411EA28();
          uint64_t v33 = *sub_1B40EC57C();
          os_log_type_t v34 = v32;
          if (os_log_type_enabled(v33, v32))
          {
            swift_bridgeObjectRetain_n();
            uint64_t v35 = v33;
            id v36 = (uint8_t *)swift_slowAlloc();
            uint64_t v37 = swift_slowAlloc();
            uint64_t v51 = v37;
            *(_DWORD *)id v36 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v50 = sub_1B40DFA70(v43, v31, &v51);
            sub_1B411EAF8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1B3F4C000, v35, v34, "_AppExtensionCalendarChooserHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v36, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1BA986180](v37, -1, -1);
            MEMORY[0x1BA986180](v36, -1, -1);
          }
          uint64_t v38 = v47;
          int v39 = v48;
          uint64_t v40 = v49;
          (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v42, v48, v49);
          sub_1B411E4D8();
          id v41 = v45;
          sub_1B411EA58();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v41, 0, 1, v21);
          sub_1B411EA88();

          (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v26);
        }
      }
    }
    else
    {

      sub_1B40E1C58((uint64_t)v19, (uint64_t *)&unk_1E9CFC360);
    }
  }
  else
  {
    sub_1B411ECC8();
    __break(1u);
  }
}

uint64_t sub_1B411B00C(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1B4159F4C, 1);
}

unint64_t sub_1B411B02C()
{
  unint64_t result = qword_1E9CFCED8;
  if (!qword_1E9CFCED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCED8);
  }
  return result;
}

void destroy for EKCalendarChooserOOPHostView(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  if (*(void *)(a1 + 32)) {
    swift_release();
  }

  uint64_t v2 = *(void **)(a1 + 128);
}

uint64_t initializeWithCopy for EKCalendarChooserOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;
  uint64_t v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  id v7 = v4;
  if (v5)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v9 = *(void *)(a2 + 32);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  uint64_t v11 = *(void **)(a2 + 48);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v11;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  uint64_t v12 = *(void **)(a2 + 88);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = v12;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_WORD *)(a1 + 112) = *(_WORD *)(a2 + 112);
  uint64_t v13 = *(void **)(a2 + 120);
  uint64_t v14 = *(void **)(a2 + 128);
  *(void *)(a1 + 120) = v13;
  *(void *)(a1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v14;
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(_WORD *)(a1 + 144) = *(_WORD *)(a2 + 144);
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  return a1;
}

uint64_t assignWithCopy for EKCalendarChooserOOPHostView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v10;
      *(void *)(a1 + 40) = v12;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_15;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v11 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  swift_retain();
  swift_release();
LABEL_15:
  uint64_t v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void **)(a2 + 48);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v14;
  id v15 = v14;

  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  id v16 = *(void **)(a2 + 88);
  id v17 = *(void **)(a1 + 88);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = v16;
  id v18 = v16;

  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  uint64_t v19 = *(void **)(a1 + 120);
  id v20 = *(void **)(a2 + 120);
  *(void *)(a1 + 120) = v20;
  id v21 = v20;

  uint64_t v22 = *(void **)(a1 + 128);
  id v23 = *(void **)(a2 + 128);
  *(void *)(a1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v23;
  id v24 = v23;

  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(unsigned char *)(a1 + 145) = *(unsigned char *)(a2 + 145);
  return a1;
}

__n128 __swift_memcpy146_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(_WORD *)(a1 + 144) = *(_WORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x2D0], 8) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for EKCalendarChooserOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  long long v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = v4;

  uint64_t v6 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 40) = v11;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_15;
  }
  if (!v9)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v10 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  swift_release();
LABEL_15:
  uint64_t v12 = *(void **)(a1 + 48);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(a2 + 48);

  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  uint64_t v13 = *(void **)(a1 + 88);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(a2 + 88);

  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);

  uint64_t v14 = *(void **)(a1 + 128);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);

  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(unsigned char *)(a1 + 145) = *(unsigned char *)(a2 + 145);
  return a1;
}

uint64_t getEnumTagSinglePayload for EKCalendarChooserOOPHostView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 146)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKCalendarChooserOOPHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 8_Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = 0u;
    *(_WORD *)(result + 144) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 146) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x2D0], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 146) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EKCalendarChooserOOPHostView()
{
  return &type metadata for EKCalendarChooserOOPHostView;
}

ValueMetadata *type metadata accessor for _AppExtensionCalendarChooserHostView()
{
  return &type metadata for _AppExtensionCalendarChooserHostView;
}

uint64_t sub_1B411B620()
{
  return type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
}

void sub_1B411B628()
{
  sub_1B40E1818();
  if (v0 <= 0x3F)
  {
    sub_1B411B92C(319, (unint64_t *)&unk_1E9CFCB90, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_1B411B750()
{
  return type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(0);
}

void sub_1B411B758()
{
  sub_1B40E1818();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_1B411B804()
{
  unint64_t result = qword_1E9CFCEE8;
  if (!qword_1E9CFCEE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFCE28);
    sub_1B411B8B0();
    sub_1B41171D0(&qword_1E9CFC710, MEMORY[0x1E4F3C908]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCEE8);
  }
  return result;
}

unint64_t sub_1B411B8B0()
{
  unint64_t result = qword_1E9CFCEF0;
  if (!qword_1E9CFCEF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CFCEF8);
    sub_1B411B02C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCEF0);
  }
  return result;
}

void sub_1B411B92C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_1B411B978()
{
  unint64_t result = qword_1E9CFCF08;
  if (!qword_1E9CFCF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CFCF08);
  }
  return result;
}

void *sub_1B411B9E4()
{
  return &unk_1E608B808;
}

void *sub_1B411B9F0()
{
  return &unk_1E608B818;
}

unint64_t EKEventViewSceneID.getter()
{
  return 0xD000000000000010;
}

void *sub_1B411BA18()
{
  return &unk_1E608B828;
}

unint64_t EKEventGenericDetailViewSceneID.getter()
{
  return 0xD00000000000001DLL;
}

void *sub_1B411BA40()
{
  return &unk_1E608B838;
}

unint64_t EKEventEditViewSceneID.getter()
{
  return 0xD000000000000014;
}

void *sub_1B411BA68()
{
  return &unk_1E608B848;
}

unint64_t EKCalendarChooserViewSceneID.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static EKRemoteUIButtonAction.Done.getter()
{
  return 0xD00000000000001ALL;
}

void *sub_1B411BAEC()
{
  return &unk_1E608B858;
}

unint64_t static EKRemoteUIButtonAction.PresentShareSheet.getter()
{
  return 0xD000000000000027;
}

void *sub_1B411BB54()
{
  return &unk_1E608B868;
}

unint64_t static EKRemoteUIButtonAction.PresentEmailCompose.getter()
{
  return 0xD000000000000029;
}

id EKRemoteUIButtonAction.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id EKRemoteUIButtonAction.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKRemoteUIButtonAction();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIButtonAction()
{
  return self;
}

id EKRemoteUIButtonAction.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKRemoteUIButtonAction();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B411BCC0()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1B411BD08(char a1)
{
  long long v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_remoteUIConfigured);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1B411BD54())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B411BDB0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B411E5D8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B411BE24@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t sub_1B411BE80(uint64_t a1, void **a2)
{
  objc_super v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x98);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1B411BEE4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1B411E5E8();
}

void (*sub_1B411BF50(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B411E5C8();
  return sub_1B40DCEB0;
}

uint64_t sub_1B411BFDC()
{
  return swift_endAccess();
}

uint64_t sub_1B411C040(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCF28);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCF20);
  sub_1B411E5B8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1B411C16C(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  _OWORD v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCF28);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCF20);
  sub_1B411E5A8();
  swift_endAccess();
  return sub_1B40DD1B8;
}

uint64_t sub_1B411C27C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_layoutDirection;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B411C2C4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_layoutDirection);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_1B411C310())()
{
  return j_j__swift_endAccess;
}

id sub_1B411C36C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_1B411C3C4(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B411C418())()
{
  return j__swift_endAccess;
}

void *sub_1B411C474()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1B411C4C4(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1B411C518())()
{
  return j_j__swift_endAccess;
}

id sub_1B411C574()
{
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_layoutDirection] = 0;
  uint64_t v1 = (void *)*MEMORY[0x1E4FB27F0];
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory] = *MEMORY[0x1E4FB27F0];
  *(void *)&v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_remoteUIConfigured] = 0;
  type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
  uint64_t v2 = v0;
  id v3 = v1;
  uint64_t v4 = sub_1B4118174();
  swift_beginAccess();
  uint64_t v7 = v4;
  sub_1B411E598();
  swift_endAccess();

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for EKCalendarChooserOOPHostViewModel();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for EKCalendarChooserOOPHostViewModel()
{
  uint64_t result = qword_1E9CFE540;
  if (!qword_1E9CFE540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_1B411C6CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKCalendarChooserOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B411C798@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  uint64_t result = sub_1B411E588();
  *a1 = result;
  return result;
}

uint64_t sub_1B411C7D8()
{
  return type metadata accessor for EKCalendarChooserOOPHostViewModel();
}

void sub_1B411C7E0()
{
  sub_1B411C89C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1B411C89C()
{
  if (!qword_1E9CFCF30)
  {
    type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(255);
    unint64_t v0 = sub_1B411E5F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9CFCF30);
    }
  }
}

uint64_t sub_1B411C8F4()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getREMObjectIDClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMObjectIDClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKExpandedReminderStackViewController.m", 42, @"Unable to find class %s", "REMObjectID");

  __break(1u);
}

void ReminderKitLibrary_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKExpandedReminderStackViewController.m", 39, @"%s", *a1);

  __break(1u);
}

void __getREMStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKExpandedReminderStackViewController.m", 40, @"Unable to find class %s", "REMStore");

  __break(1u);
}

void __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMRecurrenceRuleFormatterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKExpandedReminderStackViewController.m", 43, @"Unable to find class %s", "REMRecurrenceRuleFormatter");

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ContactsAutocompleteUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKEventAttendeesEditViewController.m", 24, @"%s", *a1);

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNComposeRecipientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttendeesEditViewController.m", 25, @"Unable to find class %s", "CNComposeRecipient");

  __break(1u);
}

void __getBMStreamsClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBMStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKUIDiscoverabilityUtilities.m", 22, @"Unable to find class %s", "BMStreams");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *BiomeStreamsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKUIDiscoverabilityUtilities.m", 21, @"%s", *a1);

  __break(1u);
}

void __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBMDiscoverabilitySignalEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKUIDiscoverabilityUtilities.m", 23, @"Unable to find class %s", "BMDiscoverabilitySignalEvent");

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_1_0(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ContactsAutocompleteUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKShareePickerViewController.m", 29, @"%s", *a1);

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNComposeRecipientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKShareePickerViewController.m", 30, @"Unable to find class %s", "CNComposeRecipient");

  __break(1u);
}

void __getREMObjectIDClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMObjectIDClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventViewControllerDefaultImpl.m", 94, @"Unable to find class %s", "REMObjectID");

  __break(1u);
}

void ReminderKitLibrary_cold_1_0(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKEventViewControllerDefaultImpl.m", 91, @"%s", *a1);

  __break(1u);
}

void __getREMStoreClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventViewControllerDefaultImpl.m", 92, @"Unable to find class %s", "REMStore");

  __break(1u);
}

void __getQLPreviewControllerClass_block_invoke_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *QuickLookLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKEventAttachmentCellController.m", 28, @"%s", *a1);

  __break(1u);
}

void __getQLPreviewControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getQLPreviewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttachmentCellController.m", 29, @"Unable to find class %s", "QLPreviewController");

  __break(1u);
}

void __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1_0(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKReminderTitleDetailCell.m", 19, @"%s", *a1);

  __break(1u);
}

void __getREMRecurrenceRuleFormatterClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMRecurrenceRuleFormatterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderTitleDetailCell.m", 20, @"Unable to find class %s", "REMRecurrenceRuleFormatter");

  __break(1u);
}

void __getCNAutocompleteResultsTableViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAutocompleteResultsTableViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttendeePicker.m", 64, @"Unable to find class %s", "CNAutocompleteResultsTableViewController");

  __break(1u);
}

void ContactsAutocompleteUILibrary_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *ContactsAutocompleteUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKEventAttendeePicker.m", 60, @"%s", *a1);

  __break(1u);
}

void __getCNComposeRecipientTextViewClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNComposeRecipientTextViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttendeePicker.m", 61, @"Unable to find class %s", "CNComposeRecipientTextView");

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_1_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNComposeRecipientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttendeePicker.m", 63, @"Unable to find class %s", "CNComposeRecipient");

  __break(1u);
}

void __getCNComposeRecipientGroupClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNComposeRecipientGroupClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttendeePicker.m", 65, @"Unable to find class %s", "CNComposeRecipientGroup");

  __break(1u);
}

void __getCNComposeRecipientOriginContextClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNComposeRecipientOriginContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttendeePicker.m", 68, @"Unable to find class %s", "CNComposeRecipientOriginContext");

  __break(1u);
}

void __getCNAutocompleteSearchManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAutocompleteSearchManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEventAttendeePicker.m", 62, @"Unable to find class %s", "CNAutocompleteSearchManager");

  __break(1u);
}

void __getPKScribbleInteractionClass_block_invoke_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *PencilKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKCalendarItemLocationInlineEditItem.m", 21, @"%s", *a1);

  __break(1u);
}

void __getPKScribbleInteractionClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPKScribbleInteractionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKCalendarItemLocationInlineEditItem.m", 22, @"Unable to find class %s", "PKScribbleInteraction");

  __break(1u);
}

uint64_t sub_1B411E448()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1B411E458()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B411E468()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B411E478()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B411E488()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B411E498()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1B411E4A8()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1B411E4B8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B411E4C8()
{
  return MEMORY[0x1F40E09F0]();
}

uint64_t sub_1B411E4D8()
{
  return MEMORY[0x1F40E09F8]();
}

uint64_t sub_1B411E4E8()
{
  return MEMORY[0x1F40E08D0]();
}

uint64_t sub_1B411E4F8()
{
  return MEMORY[0x1F40E08D8]();
}

uint64_t sub_1B411E508()
{
  return MEMORY[0x1F40E08E0]();
}

uint64_t sub_1B411E518()
{
  return MEMORY[0x1F40E08E8]();
}

uint64_t sub_1B411E528()
{
  return MEMORY[0x1F40E08F0]();
}

uint64_t sub_1B411E538()
{
  return MEMORY[0x1F40E08F8]();
}

uint64_t sub_1B411E548()
{
  return MEMORY[0x1F40E0980]();
}

uint64_t sub_1B411E558()
{
  return MEMORY[0x1F40E0988]();
}

uint64_t sub_1B411E568()
{
  return MEMORY[0x1F40E09A0]();
}

uint64_t sub_1B411E578()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1B411E588()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1B411E598()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1B411E5A8()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1B411E5B8()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1B411E5C8()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1B411E5D8()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1B411E5E8()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1B411E5F8()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1B411E608()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1B411E618()
{
  return MEMORY[0x1F40F8620]();
}

uint64_t sub_1B411E628()
{
  return MEMORY[0x1F40F87F8]();
}

uint64_t sub_1B411E638()
{
  return MEMORY[0x1F40F8C50]();
}

uint64_t sub_1B411E648()
{
  return MEMORY[0x1F40F9CD0]();
}

uint64_t sub_1B411E658()
{
  return MEMORY[0x1F40F9E18]();
}

uint64_t sub_1B411E668()
{
  return MEMORY[0x1F40F9FA0]();
}

uint64_t sub_1B411E678()
{
  return MEMORY[0x1F40FAAF8]();
}

uint64_t sub_1B411E688()
{
  return MEMORY[0x1F40FAB10]();
}

uint64_t sub_1B411E698()
{
  return MEMORY[0x1F40FAB20]();
}

uint64_t sub_1B411E6B8()
{
  return MEMORY[0x1F40FAB40]();
}

uint64_t sub_1B411E6C8()
{
  return MEMORY[0x1F40FAB50]();
}

uint64_t sub_1B411E6D8()
{
  return MEMORY[0x1F40FAB60]();
}

uint64_t sub_1B411E6F8()
{
  return MEMORY[0x1F40FACF8]();
}

uint64_t sub_1B411E708()
{
  return MEMORY[0x1F40FADC8]();
}

uint64_t sub_1B411E718()
{
  return MEMORY[0x1F40FADE8]();
}

uint64_t sub_1B411E728()
{
  return MEMORY[0x1F40FADF0]();
}

uint64_t sub_1B411E738()
{
  return MEMORY[0x1F40FAE08]();
}

uint64_t sub_1B411E748()
{
  return MEMORY[0x1F40FAE10]();
}

uint64_t sub_1B411E758()
{
  return MEMORY[0x1F40FB3B8]();
}

uint64_t sub_1B411E768()
{
  return MEMORY[0x1F40FB448]();
}

uint64_t sub_1B411E778()
{
  return MEMORY[0x1F40FB588]();
}

uint64_t sub_1B411E788()
{
  return MEMORY[0x1F40FB5C8]();
}

uint64_t sub_1B411E798()
{
  return MEMORY[0x1F40FB5E0]();
}

uint64_t sub_1B411E7A8()
{
  return MEMORY[0x1F40FB928]();
}

uint64_t sub_1B411E7B8()
{
  return MEMORY[0x1F40FC2E8]();
}

uint64_t sub_1B411E7C8()
{
  return MEMORY[0x1F40FC4A0]();
}

uint64_t sub_1B411E7D8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B411E7E8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B411E7F8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B411E808()
{
  return MEMORY[0x1F40E07C8]();
}

uint64_t sub_1B411E818()
{
  return MEMORY[0x1F40E07D0]();
}

uint64_t sub_1B411E828()
{
  return MEMORY[0x1F40E07D8]();
}

uint64_t sub_1B411E838()
{
  return MEMORY[0x1F40E07E0]();
}

uint64_t sub_1B411E848()
{
  return MEMORY[0x1F40E07E8]();
}

uint64_t sub_1B411E858()
{
  return MEMORY[0x1F40E07F0]();
}

uint64_t sub_1B411E868()
{
  return MEMORY[0x1F40E07F8]();
}

uint64_t sub_1B411E878()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B411E888()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B411E898()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B411E8A8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B411E8B8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B411E8C8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B411E8D8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B411E8E8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B411E8F8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B411E908()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B411E918()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B411E928()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B411E938()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B411E948()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B411E958()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B411E968()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B411E988()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1B411E998()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1B411E9A8()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1B411E9B8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B411E9C8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1B411E9D8()
{
  return MEMORY[0x1F40E6440]();
}

uint64_t sub_1B411E9E8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1B411E9F8()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B411EA08()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1B411EA18()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B411EA28()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B411EA38()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1B411EA48()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1B411EA58()
{
  return MEMORY[0x1F40E0A08]();
}

uint64_t sub_1B411EA68()
{
  return MEMORY[0x1F40E0A10]();
}

uint64_t sub_1B411EA78()
{
  return MEMORY[0x1F40E0A18]();
}

uint64_t sub_1B411EA88()
{
  return MEMORY[0x1F40E0A20]();
}

uint64_t sub_1B411EA98()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1B411EAA8()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1B411EAB8()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1B411EAC8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B411EAD8()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1B411EAE8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B411EAF8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B411EB08()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B411EB18()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B411EB28()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B411EB38()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B411EB48()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1B411EB58()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1B411EB68()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1B411EB78()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1B411EB88()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1B411EB98()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1B411EBA8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1B411EBB8()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1B411EBC8()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1B411EBD8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1B411EBE8()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1B411EBF8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B411EC08()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1B411EC18()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B411EC28()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B411EC38()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1B411EC48()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B411EC58()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B411EC68()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B411EC78()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1B411EC88()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1B411EC98()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1B411ECA8()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1B411ECB8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B411ECC8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B411ECD8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B411ECE8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B411ECF8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B411ED08()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1B411ED18()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B411ED28()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B411ED48()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B411ED58()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B411ED68()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B411ED78()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B411ED88()
{
  return MEMORY[0x1F4185EF8]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.float preferred = v5;
  result.float maximum = v4;
  result.float minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1F40D78D8](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1F40DA100]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPDateFormatStringForFormatType()
{
  return MEMORY[0x1F41092E0]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

uint64_t CUIKAbbreviatedEmDashDayStringForDate()
{
  return MEMORY[0x1F410F6A8]();
}

uint64_t CUIKAdjustedColorForBackgroundColor()
{
  return MEMORY[0x1F410F6B0]();
}

uint64_t CUIKAdjustedColorForColor()
{
  return MEMORY[0x1F410F6B8]();
}

uint64_t CUIKAllDayBackgroundColor()
{
  return MEMORY[0x1F410F6C0]();
}

uint64_t CUIKAppTintColor()
{
  return MEMORY[0x1F410F6C8]();
}

uint64_t CUIKBackgroundColorForCalendarColorWithOpaqueForStyle()
{
  return MEMORY[0x1F410F6D0]();
}

uint64_t CUIKBlendColorsSourceOver()
{
  return MEMORY[0x1F410F6D8]();
}

uint64_t CUIKCalendar()
{
  return MEMORY[0x1F410F6E0]();
}

uint64_t CUIKCheckEventStartDateAgainstOccurrenceCacheBounds()
{
  return MEMORY[0x1F410F6E8]();
}

uint64_t CUIKColorBarColor()
{
  return MEMORY[0x1F410F6F0]();
}

uint64_t CUIKColorDarkenedToPercentageWithFinalAlpha()
{
  return MEMORY[0x1F410F6F8]();
}

uint64_t CUIKColorIsWhite()
{
  return MEMORY[0x1F410F700]();
}

uint64_t CUIKColorLightenedToPercentageWithFinalAlpha()
{
  return MEMORY[0x1F410F708]();
}

uint64_t CUIKCreateStripedUIImage()
{
  return MEMORY[0x1F410F720]();
}

uint64_t CUIKCurrentLocaleRequiresIndianLanguageAdjustments()
{
  return MEMORY[0x1F410F728]();
}

uint64_t CUIKCurrentLocaleRequiresUnabbrevatedMonthNames()
{
  return MEMORY[0x1F410F730]();
}

uint64_t CUIKDeclinedEventBackgroundColor()
{
  return MEMORY[0x1F410F738]();
}

uint64_t CUIKDecomposedAttendeeName()
{
  return MEMORY[0x1F410F740]();
}

uint64_t CUIKDisplayStringForAvailability()
{
  return MEMORY[0x1F410F758]();
}

uint64_t CUIKDisplayStringForNotificationIdentity()
{
  return MEMORY[0x1F410F760]();
}

uint64_t CUIKDisplayStringForTravelTimeUsingShortFormat()
{
  return MEMORY[0x1F410F768]();
}

uint64_t CUIKDisplayStringTravelTimeAndDuration()
{
  return MEMORY[0x1F410F770]();
}

uint64_t CUIKDisplayedTitleForCalendar()
{
  return MEMORY[0x1F410F778]();
}

uint64_t CUIKDisplayedTitleForEvent()
{
  return MEMORY[0x1F410F780]();
}

uint64_t CUIKDisplayedTitleForSource()
{
  return MEMORY[0x1F410F788]();
}

uint64_t CUIKDurationStringForDates()
{
  return MEMORY[0x1F410F790]();
}

uint64_t CUIKDurationStringForTimeInterval()
{
  return MEMORY[0x1F410F798]();
}

uint64_t CUIKEventDisplaysAsDeclined()
{
  return MEMORY[0x1F410F7A0]();
}

uint64_t CUIKEventDisplaysAsNeedsReply()
{
  return MEMORY[0x1F410F7A8]();
}

uint64_t CUIKEventDisplaysAsTentative()
{
  return MEMORY[0x1F410F7B0]();
}

uint64_t CUIKGetAttributedStringForEventDetailWithURL()
{
  return MEMORY[0x1F410F7B8]();
}

uint64_t CUIKGetDefaultStartAndEndTimeForDate()
{
  return MEMORY[0x1F410F7C0]();
}

uint64_t CUIKGetOverlayCalendar()
{
  return MEMORY[0x1F410F7C8]();
}

uint64_t CUIKGetTypeAndEndDateForRecurrenceRules()
{
  return MEMORY[0x1F410F7D0]();
}

uint64_t CUIKGregorianUnitsForRecurrenceTypeAndInterval()
{
  return MEMORY[0x1F410F7D8]();
}

uint64_t CUIKIntervalForRepeatType()
{
  return MEMORY[0x1F410F7E0]();
}

uint64_t CUIKIsWeekdayNameFirst()
{
  return MEMORY[0x1F410F7F8]();
}

uint64_t CUIKLightStripeColorForColor()
{
  return MEMORY[0x1F410F800]();
}

uint64_t CUIKLocalizedStringForInteger()
{
  return MEMORY[0x1F410F810]();
}

uint64_t CUIKLocalizedStringForIntegerWithMinimumTwoDigits()
{
  return MEMORY[0x1F410F818]();
}

uint64_t CUIKLongDayStringForDate()
{
  return MEMORY[0x1F410F820]();
}

uint64_t CUIKLongDayStringForDateNoYear()
{
  return MEMORY[0x1F410F828]();
}

uint64_t CUIKLongEmDashDayStringForDate()
{
  return MEMORY[0x1F410F830]();
}

uint64_t CUIKLongStringForDateAndTime()
{
  return MEMORY[0x1F410F838]();
}

uint64_t CUIKLongStringForDateWithCommaAndYear()
{
  return MEMORY[0x1F410F840]();
}

uint64_t CUIKLongStringForMonth()
{
  return MEMORY[0x1F410F848]();
}

uint64_t CUIKLongStringForWeekday()
{
  return MEMORY[0x1F410F850]();
}

uint64_t CUIKLuminance()
{
  return MEMORY[0x1F410F858]();
}

uint64_t CUIKMessageStringForEventInvitationNotification()
{
  return MEMORY[0x1F410F860]();
}

uint64_t CUIKNSDateIsToday()
{
  return MEMORY[0x1F410F868]();
}

uint64_t CUIKNeedsReplyBackgroundColor()
{
  return MEMORY[0x1F410F870]();
}

uint64_t CUIKNeedsReplyStripeColor()
{
  return MEMORY[0x1F410F878]();
}

uint64_t CUIKNotesFieldHasInlineExchangeAttachments()
{
  return MEMORY[0x1F410F880]();
}

uint64_t CUIKNowComponents()
{
  return MEMORY[0x1F410F888]();
}

uint64_t CUIKNowComponentsSystemTime()
{
  return MEMORY[0x1F410F890]();
}

uint64_t CUIKNowDate()
{
  return MEMORY[0x1F410F898]();
}

uint64_t CUIKOccurrenceLeadingIconAlphaScale()
{
  return MEMORY[0x1F410F8A8]();
}

uint64_t CUIKOccurrenceSecondaryTextColor()
{
  return MEMORY[0x1F410F8B0]();
}

uint64_t CUIKOneIndexedWeekStart()
{
  return MEMORY[0x1F410F8C0]();
}

uint64_t CUIKRecurrenceFrequencyForRepeatType()
{
  return MEMORY[0x1F410F8D8]();
}

uint64_t CUIKRoundToScreenScale()
{
  return MEMORY[0x1F410F8E8]();
}

uint64_t CUIKSecondaryTextColorForCalendarColorForStyle()
{
  return MEMORY[0x1F410F8F0]();
}

uint64_t CUIKSelectedDeclinedBackgroundColor()
{
  return MEMORY[0x1F410F8F8]();
}

uint64_t CUIKSelectedNeedsReplyBackgroundColor()
{
  return MEMORY[0x1F410F900]();
}

uint64_t CUIKSelectedNeedsReplyStripeColor()
{
  return MEMORY[0x1F410F908]();
}

uint64_t CUIKSelectedTentativeStripeColor()
{
  return MEMORY[0x1F410F910]();
}

uint64_t CUIKShortStringForDateWithMonthAndYear()
{
  return MEMORY[0x1F410F918]();
}

uint64_t CUIKShortStringForDay()
{
  return MEMORY[0x1F410F920]();
}

uint64_t CUIKShortTZString()
{
  return MEMORY[0x1F410F928]();
}

uint64_t CUIKShouldDisplayNotes()
{
  return MEMORY[0x1F410F930]();
}

uint64_t CUIKShouldShowTimezoneClarification()
{
  return MEMORY[0x1F410F938]();
}

uint64_t CUIKShow24Hours()
{
  return MEMORY[0x1F410F940]();
}

uint64_t CUIKStringAbbreviationForMonth()
{
  return MEMORY[0x1F410F950]();
}

uint64_t CUIKStringForDate()
{
  return MEMORY[0x1F410F958]();
}

uint64_t CUIKStringForDateAndDayOfWeekInCalendarTimezone()
{
  return MEMORY[0x1F410F960]();
}

uint64_t CUIKStringForDateAndDayOfWeekInTimezone()
{
  return MEMORY[0x1F410F970]();
}

uint64_t CUIKStringForDateAndTime()
{
  return MEMORY[0x1F410F980]();
}

uint64_t CUIKStringForDateWithCommaAndYear()
{
  return MEMORY[0x1F410F988]();
}

uint64_t CUIKStringForDayOfWeek()
{
  return MEMORY[0x1F410F990]();
}

uint64_t CUIKStringForDayOfWeekNotStandalone()
{
  return MEMORY[0x1F410F998]();
}

uint64_t CUIKStringForGMTTime()
{
  return MEMORY[0x1F410F9A0]();
}

uint64_t CUIKStringForHour()
{
  return MEMORY[0x1F410F9A8]();
}

uint64_t CUIKStringForHourWithoutDesignator()
{
  return MEMORY[0x1F410F9B0]();
}

uint64_t CUIKStringForMonth()
{
  return MEMORY[0x1F410F9B8]();
}

uint64_t CUIKStringForMonthYear()
{
  return MEMORY[0x1F410F9C8]();
}

uint64_t CUIKStringForRecurrenceRule()
{
  return MEMORY[0x1F410F9D0]();
}

uint64_t CUIKStringForRecurrenceRuleAndDate()
{
  return MEMORY[0x1F410F9D8]();
}

uint64_t CUIKStringForRepeatType()
{
  return MEMORY[0x1F410F9E0]();
}

uint64_t CUIKStringForRepeatTypeDetail()
{
  return MEMORY[0x1F410F9E8]();
}

uint64_t CUIKStringForTime()
{
  return MEMORY[0x1F410F9F0]();
}

uint64_t CUIKStringForTimeWithTZ()
{
  return MEMORY[0x1F410F9F8]();
}

uint64_t CUIKStringForTimeWithTZIfDivergent()
{
  return MEMORY[0x1F410FA00]();
}

uint64_t CUIKStringForWeekdayNoYear()
{
  return MEMORY[0x1F410FA08]();
}

uint64_t CUIKStringMonthDayYearTime()
{
  return MEMORY[0x1F410FA18]();
}

uint64_t CUIKStringMonthDayYearWithComma()
{
  return MEMORY[0x1F410FA20]();
}

uint64_t CUIKStripInlineExchangeAttachmentsFromNotes()
{
  return MEMORY[0x1F410FA28]();
}

uint64_t CUIKTextColorForCalendarColorForStyle()
{
  return MEMORY[0x1F410FA30]();
}

uint64_t CUIKTimeIntervalStringForDates()
{
  return MEMORY[0x1F410FA38]();
}

uint64_t CUIKTimezoneClarificationStringForDates()
{
  return MEMORY[0x1F410FA40]();
}

uint64_t CUIKTimezonesDivergeAtDate()
{
  return MEMORY[0x1F410FA48]();
}

uint64_t CUIKTodayComponents()
{
  return MEMORY[0x1F410FA50]();
}

uint64_t CUIKTodayDate()
{
  return MEMORY[0x1F410FA58]();
}

uint64_t CUIKWeekdayVeryShortAbbreviations()
{
  return MEMORY[0x1F410FA60]();
}

uint64_t CUIKZeroIndexedWeekStart()
{
  return MEMORY[0x1F410FA68]();
}

uint64_t CalAbsoluteTimeAddGregorianUnits()
{
  return MEMORY[0x1F410F1F8]();
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1F410F230]();
}

uint64_t CalAnalyticsSendEvent()
{
  return MEMORY[0x1F410F260]();
}

uint64_t CalAnalyticsSendEventLazy()
{
  return MEMORY[0x1F410F268]();
}

uint64_t CalBooleanAsString()
{
  return MEMORY[0x1F410F280]();
}

uint64_t CalCopyCalendar()
{
  return MEMORY[0x1F410F2A0]();
}

uint64_t CalCopySystemTimeZone()
{
  return MEMORY[0x1F410F2B0]();
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x1F410F2B8]();
}

uint64_t CalDateTimeGetGregorianDate()
{
  return MEMORY[0x1F410F2C8]();
}

uint64_t CalEqualStrings()
{
  return MEMORY[0x1F410F2E8]();
}

uint64_t CalGenerateQualifiedIdentifierWithClassAndSubdomain()
{
  return MEMORY[0x1F410F2F0]();
}

uint64_t CalGregorianDateGetAbsoluteTime()
{
  return MEMORY[0x1F410F318]();
}

uint64_t CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1F410F320]();
}

uint64_t CalTimeZoneCopyCFTimeZone()
{
  return MEMORY[0x1F410F388]();
}

uint64_t CalendarFoundationPerformBlockOnSharedContactStore()
{
  return MEMORY[0x1F410F390]();
}

uint64_t EKAvailabilitySpanTypeAsString()
{
  return MEMORY[0x1F40E0800]();
}

uint64_t EKSymbolicColorToRGBMapping()
{
  return MEMORY[0x1F410F3F8]();
}

uint64_t EKUtils_AdjustedAttendeeAddress()
{
  return MEMORY[0x1F40E0808]();
}

uint64_t EKWeakLinkClass()
{
  return MEMORY[0x1F410F400]();
}

uint64_t EKWeakLinkStringConstant()
{
  return MEMORY[0x1F410F408]();
}

uint64_t EKWeakLinkSymbol()
{
  return MEMORY[0x1F410F410]();
}

uint64_t ICSRedactString()
{
  return MEMORY[0x1F4177BE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1F4166CF0]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x1F4166DC0]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t UISetColor()
{
  return MEMORY[0x1F4166ED8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1F4166F00]();
}

uint64_t UnzipArchive()
{
  return MEMORY[0x1F410F420]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return MEMORY[0x1F4166FD0]();
}

uint64_t _UIDragInteractionDefaultLiftDelay()
{
  return MEMORY[0x1F4167010]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _bitmaskContainsOption()
{
  return MEMORY[0x1F40E0810]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

uint64_t attributedStatusGlyph()
{
  return MEMORY[0x1F410FA70]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}