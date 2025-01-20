BOOL AXColorsProbablyEqual(void *a1, void *a2)
{
  BOOL result;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  result = 0;
  if (a1 && a2)
  {
    v11 = 0.0;
    v12 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v4 = a2;
    [a1 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
    [v4 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];

    return vabdd_f64(v12, v8) < 0.001
        && vabdd_f64(v11, v7) < 0.001
        && vabdd_f64(v10, v6) < 0.001
        && vabdd_f64(v9, v5) < 0.001;
  }
  return result;
}

void sub_1C39D3FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C39D4180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39D424C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39D4618(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1C39D4684()
{
}

id getBFFStyleClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBFFStyleClass_softClass;
  uint64_t v7 = getBFFStyleClass_softClass;
  if (!getBFFStyleClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBFFStyleClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getBFFStyleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39D72B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39D7A8C(_Unwind_Exception *a1)
{
}

Class __getBFFStyleClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SetupAssistantUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E649BF20;
    uint64_t v6 = 0;
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (OS_os_log *)v4[0];
    if (!SetupAssistantUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = __getBFFStyleClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBFFStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSBSIsReachabilityEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E649BF38;
    uint64_t v7 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SBSIsReachabilityEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBSIsReachabilityEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL AXInvertColorsIsSystemWideDarkModeEnabled()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4FB3498]) initWithDelegate:0];
  [v0 modeValue];
  if (UISUserInterfaceStyleModeValueIsAutomatic()) {
    uint64_t v1 = [v0 override];
  }
  else {
    uint64_t v1 = [v0 modeValue];
  }
  BOOL v2 = v1 == 2;

  return v2;
}

void AXInvertColorsSetSystemWideDarkModeEnabled(int a1)
{
  if (AXInvertColorsIsSystemWideDarkModeEnabled() != a1)
  {
    id v1 = [MEMORY[0x1E4FB1E90] sharedInstance];
    [v1 toggleCurrentStyle];
  }
}

__CFString *AXInvertColorsUserInterfaceStyleDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"?";
  }
  else {
    return off_1E649BF78[a1];
  }
}

uint64_t _systemAppDidBecomeReady(uint64_t a1, void *a2)
{
  return [a2 _systemAppDidBecomeReady];
}

void sub_1C39D9888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

id sharedBFFStyle()
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v0 = (void *)getBFFStyleClass_softClass_0;
  uint64_t v8 = getBFFStyleClass_softClass_0;
  if (!getBFFStyleClass_softClass_0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getBFFStyleClass_block_invoke_0;
    v4[3] = &unk_1E649BF00;
    v4[4] = &v5;
    __getBFFStyleClass_block_invoke_0((uint64_t)v4);
    uint64_t v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  BOOL v2 = [v1 sharedStyle];
  return v2;
}

void sub_1C39DA240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SetupAssistantUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E649BFE8;
    uint64_t v6 = 0;
    SetupAssistantUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    BOOL v2 = (OS_os_log *)v4[0];
    if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = __getBFFStyleClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBFFStyleClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

CGFloat AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside()
{
  double v0 = AXUIKeyboardScreenFrame();
  double v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  remainder.origin.x = v0;
  remainder.origin.y = v1;
  remainder.size.width = v3;
  remainder.size.height = v5;
  uint64_t v7 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
  uint64_t v8 = [v7 firstResponder];

  uint64_t v9 = [v8 inputAccessoryView];
  if (v9)
  {
    v35.origin.x = v0;
    v35.origin.y = v2;
    v35.size.width = v4;
    v35.size.height = v6;
    if (!CGRectIsEmpty(v35))
    {
      [v9 accessibilityFrame];
      v39.origin.x = v10;
      v39.origin.y = v11;
      v39.size.width = v12;
      v39.size.height = v13;
      v36.origin.x = v0;
      v36.origin.y = v2;
      v36.size.width = v4;
      v36.size.height = v6;
      BOOL v14 = CGRectContainsRect(v36, v39);
      LOBYTE(slice.origin.x) = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15) {
        char v17 = v14;
      }
      else {
        char v17 = 1;
      }
      v18 = v15;
      if ((v17 & 1) == 0)
      {
        v19 = v15;
        do
        {
          BOOL v14 = v19 == v9;
          v18 = [v19 superview];

          if (!v18) {
            break;
          }
          BOOL v20 = v19 == v9;
          v19 = v18;
        }
        while (!v20);
      }
      if (v14)
      {
        v21 = [v9 window];
        [v9 frame];
        objc_msgSend(v9, "convertRect:toView:", 0);
        objc_msgSend(v21, "convertRect:toWindow:", 0);
        CGFloat v23 = v22;
        double v25 = v24;
        CGFloat v27 = v26;
        double v29 = v28;

        v37.origin.x = v23;
        v37.origin.y = v25;
        v37.size.width = v27;
        v37.size.height = v29;
        v40.origin.x = v0;
        v40.origin.y = v2;
        v40.size.width = v4;
        v40.size.height = v6;
        if (CGRectIntersectsRect(v37, v40))
        {
          double v30 = v29 + v25 - v2;
          if (v30 < 0.0) {
            _AXAssert();
          }
          memset(&slice, 0, sizeof(slice));
          if (v30 >= 0.0) {
            double v31 = v30;
          }
          else {
            double v31 = 0.0;
          }
          v38.origin.x = v0;
          v38.origin.y = v2;
          v38.size.width = v4;
          v38.size.height = v6;
          CGRectDivide(v38, &slice, &remainder, v31, CGRectMinYEdge);
        }
        else
        {
          _AXLogWithFacility();
        }
      }
    }
  }

  return remainder.origin.x;
}

double AXUIKeyboardScreenFrame()
{
  double v0 = AXUIKeyboardWindow();
  CGFloat v1 = v0;
  if (v0)
  {
    double v2 = [v0 rootViewController];
    NSClassFromString(&cfstr_Uiinputwindowc.isa);
    if (objc_opt_isKindOfClass())
    {
      [v2 safeCGRectForKey:@"visibleFrame"];
      double v4 = v3;
    }
    else
    {
      CGFloat v5 = [MEMORY[0x1E4FB18E0] activeKeyboard];
      [v5 bounds];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      BOOL v14 = [MEMORY[0x1E4FB18E0] activeKeyboard];
      v16.origin.x = v7;
      v16.origin.y = v9;
      v16.size.width = v11;
      v16.size.height = v13;
      *(void *)&double v4 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v16, v14);
    }
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
  }

  return v4;
}

id AXUIKeyboardWindow()
{
  if (AXUIKeyboardIsOOP())
  {
    double v0 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    CGFloat v1 = [v0 window];

    if (v1) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  double v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  double v3 = [v2 currentInputMode];
  char v4 = [v3 isExtensionInputMode];

  int v5 = [NSClassFromString(&cfstr_Uiremotekeyboa.isa) safeBoolForKey:@"enabled"];
  if ((v4 & 1) == 0 && !v5)
  {
LABEL_6:
    CGFloat v1 = AXUIFirstTextEffectsWindow();
    goto LABEL_13;
  }
  double v6 = [NSClassFromString(&cfstr_Uiremotekeyboa.isa) safeValueForKey:@"sharedRemoteKeyboards"];
  CGFloat v7 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  double v8 = [v7 safeValueForKey:@"inputViews"];
  CGFloat v9 = __UIAccessibilitySafeClass();

  double v10 = [v9 safeValueForKey:@"inputView"];
  CGFloat v1 = 0;
  if ([v6 safeBoolForKey:@"keyboardVisible"] && v10)
  {
    if ([v9 safeBoolForKey:@"isInputViewPlaceholder"])
    {
      CGFloat v1 = 0;
    }
    else
    {
      CGFloat v1 = [v6 safeValueForKey:@"keyboardWindow"];
    }
  }

LABEL_13:
  return v1;
}

double AXUIKeyboardVisibleInputScreenFrame()
{
  double v0 = AXUIKeyboardWindow();
  CGFloat v1 = v0;
  if (v0)
  {
    double v2 = [v0 rootViewController];
    [v2 safeCGRectForKey:@"visibleInputViewFrame"];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
  }

  return v4;
}

id AXUIFirstTextEffectsWindow()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v0 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "connectedScenes", 0);
  uint64_t v1 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v0);
        }
        uint64_t v5 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = [MEMORY[0x1E4FB1D68] activeTextEffectsWindowForWindowScene:v5];
          if (v6)
          {
            CGFloat v7 = (void *)v6;
            goto LABEL_12;
          }
        }
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  CGFloat v7 = 0;
LABEL_12:

  return v7;
}

uint64_t AXUIKeyboardIsOOP()
{
  if ([MEMORY[0x1E4FB18E0] safeBoolForKey:@"usesInputSystemUI"]) {
    return 1;
  }
  uint64_t v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 bundleIdentifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F482B0]];

  return v3;
}

id AXUIAllKeyboardWindows()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v0 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v1 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "connectedScenes", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CGFloat v7 = [MEMORY[0x1E4FB1D68] activeTextEffectsWindowForWindowScene:v6];
          [v0 axSafelyAddObject:v7];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }

  double v8 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  long long v9 = [v8 currentInputMode];
  char v10 = [v9 isExtensionInputMode];

  int v11 = [NSClassFromString(&cfstr_Uiremotekeyboa.isa) safeBoolForKey:@"enabled"];
  if ((v10 & 1) != 0 || v11)
  {
    long long v12 = [NSClassFromString(&cfstr_Uiremotekeyboa.isa) safeValueForKey:@"sharedRemoteKeyboards"];
    CGFloat v13 = [v12 safeValueForKey:@"keyboardWindow"];
    [v0 axSafelyAddObject:v13];
  }
  uint64_t v14 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  id v15 = [v14 window];

  if (v15 && ([v0 containsObject:v15] & 1) == 0) {
    [v0 addObject:v15];
  }

  return v0;
}

id AXUISentenceTextRangeForInput(void *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v6)
  {
    if (!v7) {
      id v8 = v5;
    }
    if (objc_opt_respondsToSelector())
    {
      long long v9 = [v6 start];
      char v10 = [v8 rangeEnclosingPosition:v9 withGranularity:2 inDirection:2];
LABEL_6:

      goto LABEL_26;
    }
    long long v9 = [v5 beginningOfDocument];
    int v11 = [v5 endOfDocument];
    long long v12 = [v5 textRangeFromPosition:v9 toPosition:v11];

    CGFloat v13 = [v5 textInRange:v12];
    uint64_t v14 = [MEMORY[0x1E4F48378] sharedInstance];
    char v15 = [v14 ignoreLogging];

    if ((v15 & 1) == 0)
    {
      CGRect v16 = [MEMORY[0x1E4F48378] identifier];
      long long v17 = AXLoggerForFacility();

      os_log_type_t v18 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v17, v18))
      {
        long long v19 = AXColorizeFormatLog();
        CGRect v38 = v12;
        CGRect v40 = v13;
        long long v20 = _AXStringForArgs();
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v20;
          _os_log_impl(&dword_1C39D1000, v17, v18, "%{public}@", buf, 0xCu);
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [v6 start];
      unint64_t v22 = [v5 offsetFromPosition:v9 toPosition:v21];

      NSUInteger v23 = objc_msgSend(v13, "ax_sentenceFromPosition:inDirection:", v22, v22 != 0, v38, v40);
      NSUInteger v25 = v24;
      v43 = v12;
      if (v23 + v24 <= v22)
      {
        uint64_t v26 = objc_msgSend(v13, "ax_sentenceFromPosition:inDirection:", v22, 0);
        if (v23 != 0x7FFFFFFF)
        {
          NSUInteger v23 = v26;
          NSUInteger v25 = v27;
        }
      }
      double v28 = [MEMORY[0x1E4F48378] sharedInstance];
      char v29 = [v28 ignoreLogging];

      if ((v29 & 1) == 0)
      {
        double v30 = [MEMORY[0x1E4F48378] identifier];
        double v31 = AXLoggerForFacility();

        os_log_type_t v32 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v31, v32))
        {
          AXColorizeFormatLog();
          uint64_t v33 = type = v32;
          v48.location = v23;
          v48.length = v25;
          CGRect v39 = NSStringFromRange(v48);
          v42 = (void *)v33;
          v34 = _AXStringForArgs();

          if (os_log_type_enabled(v31, type))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v34;
            _os_log_impl(&dword_1C39D1000, v31, type, "%{public}@", buf, 0xCu);
          }
        }
      }
      long long v12 = v43;
      if (v23 != 0x7FFFFFFF)
      {
        CGRect v36 = [v5 positionFromPosition:v9 offset:v23];
        CGRect v37 = [v5 positionFromPosition:v9 offset:v25 + v23];
        char v10 = [v5 textRangeFromPosition:v36 toPosition:v37];

        goto LABEL_6;
      }
    }
  }
  char v10 = 0;
LABEL_26:

  return v10;
}

id AXUIRepresentedKeyboardElement()
{
  if (AXUIRepresentedKeyboardElement_onceToken != -1) {
    dispatch_once(&AXUIRepresentedKeyboardElement_onceToken, &__block_literal_global_1);
  }
  double v0 = (void *)AXUIRepresentedKeyboardElement_RepresentedKeyboardElement;
  return v0;
}

uint64_t __AXUIRepresentedKeyboardElement_block_invoke()
{
  AXUIRepresentedKeyboardElement_RepresentedKeyboardElement = [objc_alloc(MEMORY[0x1E4F48910]) initWithUUID:@"KeyboardSingleton" andRemotePid:2147483637 andContextId:0];
  return MEMORY[0x1F41817F8]();
}

uint64_t AXUIKeyboardIsOnScreen()
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  double v0 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  if (!AXUIKeyboardIsOOP()
    || ![MEMORY[0x1E4FB18E0] serviceRole]
    || ![(UIView *)v0 isAutomatic])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v3 = AXUIAllKeyboardWindows();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v36 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          NSClassFromString(&cfstr_Uiremotekeyboa_0.isa);
          if (objc_opt_isKindOfClass())
          {
            long long v9 = [v8 rootViewController];
            char v10 = [v9 safeValueForKey:@"inputViewSet"];
            int v11 = [v10 safeValueForKey:@"inputView"];

            if (v11)
            {

              uint64_t v2 = 1;
              goto LABEL_30;
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    long long v12 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    CGFloat v13 = [v12 currentInputMode];
    int v14 = [v13 isExtensionInputMode];

    int v15 = [NSClassFromString(&cfstr_Uiremotekeyboa.isa) safeBoolForKey:@"enabled"];
    double x = AXUIKeyboardScreenFrame();
    CGFloat y = v17;
    CGFloat width = v19;
    CGFloat height = v21;
    uint64_t v23 = [(UIView *)v0 window];
    if (v23)
    {
      NSUInteger v24 = (void *)v23;
      NSUInteger v25 = AXUIKeyboardWindow();
      if (v25)
      {
      }
      else
      {
        v41.origin.double x = x;
        v41.origin.CGFloat y = y;
        v41.size.CGFloat width = width;
        v41.size.CGFloat height = height;
        IsEmptCGFloat y = CGRectIsEmpty(v41);

        if (IsEmpty)
        {
          [(UIView *)v0 bounds];
          CGRect v43 = UIAccessibilityConvertFrameToScreenCoordinates(v42, v0);
          double x = v43.origin.x;
          CGFloat y = v43.origin.y;
          CGFloat width = v43.size.width;
          CGFloat height = v43.size.height;
        }
      }
    }
    v44.origin.double x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    BOOL v27 = CGRectIsEmpty(v44);
    if (v0)
    {
      BOOL v28 = v27;
      if ([(UIView *)v0 isActive])
      {
        char v29 = [(UIView *)v0 window];
        double v30 = v29;
        if (v29) {
          int v31 = 1;
        }
        else {
          int v31 = v14;
        }
        if (((v31 | v15) ^ 1 | v28) == 1)
        {
        }
        else
        {
          os_log_type_t v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v32 bounds];
          v46.origin.double x = x;
          v46.origin.CGFloat y = y;
          v46.size.CGFloat width = width;
          v46.size.CGFloat height = height;
          BOOL v33 = CGRectIntersectsRect(v45, v46);

          if (v33)
          {
            uint64_t v2 = [(UIView *)v0 isMinimized] ^ 1;
            goto LABEL_30;
          }
        }
      }
    }
    uint64_t v2 = 0;
    goto LABEL_30;
  }
  uint64_t v1 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  uint64_t v2 = [v1 keyboardVisible];

LABEL_30:
  return v2;
}

uint64_t UIKeyboardCacheVersion()
{
  if (UIKeyboardCacheVersion_onceToken != -1) {
    dispatch_once(&UIKeyboardCacheVersion_onceToken, &__block_literal_global_340);
  }
  return UIKeyboardCacheVersion_buildVersion;
}

void __UIKeyboardCacheVersion_block_invoke()
{
  double v0 = (void *)MGCopyAnswerWithError();
  UIKeyboardCacheVersion_buildVersion = [v0 hash];
}

id UIKeyboardCachePath()
{
  double v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", @"com.apple.keyboards", 0);
  uint64_t v1 = [NSString pathWithComponents:v0];

  return v1;
}

void AXUIPurgeKeyboardCache()
{
  id v0 = objc_alloc(MEMORY[0x1E4F4BE48]);
  uint64_t v1 = UIKeyboardCachePath();
  if (UIKeyboardCacheVersion_onceToken != -1) {
    dispatch_once(&UIKeyboardCacheVersion_onceToken, &__block_literal_global_340);
  }
  id v2 = (id)[v0 initWithPath:v1 version:UIKeyboardCacheVersion_buildVersion];

  [v2 purge];
}

void sub_1C39DF01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C39DF1D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C39E1460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

id AXColorStringForColor(void *a1, char a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 CGColor])
    {
      id v5 = v4;
      uint64_t v6 = AXNameFromColor((CGColorRef)[v5 CGColor]);
      id v7 = [v6 mutableCopy];

      if (a2)
      {
        if (AXColorStringForColor_onceToken != -1) {
          dispatch_once(&AXColorStringForColor_onceToken, &__block_literal_global_2);
        }
        double Luma = AXColorGetLuma(v5);
        long long v9 = (void *)AXColorStringForColor__lumaNumberFormatter;
        char v10 = [NSNumber numberWithUnsignedInteger:vcvtad_u64_f64(Luma * 100.0)];
        int v11 = [v9 stringFromNumber:v10];

        [v7 appendFormat:@" %@", v11];
      }
      if (v7)
      {
        uint64_t v12 = [NSString stringWithString:v7];
        goto LABEL_17;
      }
      NSUInteger v25 = AXLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        AXColorStringForColor_cold_2((uint64_t)v5, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else
    {
      id v7 = AXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        AXColorStringForColor_cold_1((uint64_t)v4, v7, v19, v20, v21, v22, v23, v24);
      }
    }
  }
  else
  {
    id v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      AXColorStringForColor_cold_3((uint64_t)v3, v7, v13, v14, v15, v16, v17, v18);
    }
  }
  uint64_t v12 = 0;
LABEL_17:

  return v12;
}

uint64_t __AXColorStringForColor_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = (void *)AXColorStringForColor__lumaNumberFormatter;
  AXColorStringForColor__lumaNumberFormatter = (uint64_t)v0;

  id v2 = (void *)AXColorStringForColor__lumaNumberFormatter;
  return [v2 setNumberStyle:1];
}

double AXColorGetLuma(void *a1)
{
  double v5 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v2 = 0.0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  double result = fmax(v2 * (v4 * 0.715200007 + v5 * 0.212599993 + v3 * 0.0722000003), 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

id AXSlightlyDarkerColorForColor(void *a1)
{
  id v1 = a1;
  double v2 = (CGColor *)[v1 CGColor];
  ColorSpace = CGColorGetColorSpace(v2);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  id v5 = v1;
  uint64_t v6 = v5;
  if (Model == kCGColorSpaceModelRGB)
  {
    Components = CGColorGetComponents(v2);
    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:*Components + -0.25 green:Components[1] + -0.25 blue:Components[2] + -0.25 alpha:Components[3]];
  }
  return v6;
}

id AXSlightlyBrighterColorForColor(void *a1)
{
  id v1 = a1;
  double v13 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v10 = 0.0;
  if ([v1 getRed:&v13 green:&v12 blue:&v11 alpha:&v10])
  {
    double v2 = [MEMORY[0x1E4FB1618] colorWithRed:v13 green:v12 blue:v11 alpha:v10];
    double v8 = 0.0;
    double v9 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    if ([v2 getHue:&v9 saturation:&v8 brightness:&v7 alpha:&v6])
    {
      id v3 = [MEMORY[0x1E4FB1618] colorWithHue:v9 saturation:v8 brightness:v7 * 1.5 alpha:v6];
    }
    else
    {
      id v3 = v1;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = v1;
  }

  return v4;
}

id _AXInvertColorForColor(void *a1, int a2)
{
  id v3 = a1;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v3 CGColor]);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  double v6 = [MEMORY[0x1E4FB1618] blackColor];
  if (Model == kCGColorSpaceModelRGB)
  {
    Components = CGColorGetComponents((CGColorRef)[v3 CGColor]);
    double v10 = Components[3];
    if (!a2) {
      double v10 = 1.0;
    }
    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 - *Components green:1.0 - Components[1] blue:1.0 - Components[2] alpha:v10];
  }
  else
  {
    if (Model) {
      goto LABEL_10;
    }
    double v13 = 1.0;
    double v14 = 1.0;
    [v3 getWhite:&v14 alpha:&v13];
    double v7 = 1.0;
    if (a2) {
      double v7 = v13;
    }
    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 - v14 alpha:v7];
  }
  double v11 = (void *)v8;

  double v6 = v11;
LABEL_10:

  return v6;
}

id AXInvertColorForColor(void *a1)
{
  return _AXInvertColorForColor(a1, 0);
}

id AXInvertColorForColorPreservingAlpha(void *a1)
{
  return _AXInvertColorForColor(a1, 1);
}

AXUISettingsWelcomeController *AXUISettingsCreateWelcomeController(void *a1, void *a2, void *a3)
{
  v55[4] = *MEMORY[0x1E4F143B8];
  id v51 = a1;
  id v5 = a2;
  id v6 = a3;
  double v7 = [[AXUISettingsWelcomeController alloc] initWithTitle:v6 detailText:0 icon:0 contentLayout:3];

  v49 = v5;
  uint64_t v8 = [v5 view];
  [(AXUISettingsWelcomeController *)v7 addChildViewController:v5];
  double v9 = [(AXUISettingsWelcomeController *)v7 contentView];
  [v9 addSubview:v8];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v10 = [(AXUISettingsWelcomeController *)v7 contentView];
  v52 = v7;
  double v11 = [(AXUISettingsWelcomeController *)v7 view];
  [v11 frame];
  objc_msgSend(v8, "setFrame:");

  double v12 = [MEMORY[0x1E4F1CA48] array];
  v47 = [v8 topAnchor];
  CGRect v46 = [v10 topAnchor];
  CGRect v45 = [v47 constraintEqualToAnchor:v46];
  v55[0] = v45;
  CGRect v44 = [v8 bottomAnchor];
  double v13 = [v10 bottomAnchor];
  double v14 = [v44 constraintEqualToAnchor:v13];
  v55[1] = v14;
  uint64_t v15 = [v8 leadingAnchor];
  uint64_t v16 = [v10 leadingAnchor];
  uint64_t v17 = [v15 constraintEqualToAnchor:v16];
  v55[2] = v17;
  v50 = v8;
  uint64_t v18 = [v8 trailingAnchor];
  v53 = v10;
  uint64_t v19 = [v10 trailingAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];
  v55[3] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
  [v12 addObjectsFromArray:v21];

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v49, "ax_handlesOwnScrollingInSetup"))
  {
    uint64_t v22 = [v53 superview];
    uint64_t v23 = [v22 superview];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = AXLogSettings();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        AXUISettingsCreateWelcomeController_cold_1((uint64_t)v52, v24);
      }
    }
    NSRange v48 = [v22 heightAnchor];
    NSUInteger v25 = [v23 heightAnchor];
    uint64_t v26 = [v48 constraintEqualToAnchor:v25];
    v54[0] = v26;
    uint64_t v27 = [v53 bottomAnchor];
    uint64_t v28 = [v22 bottomAnchor];
    uint64_t v29 = [v27 constraintEqualToAnchor:v28];
    v54[1] = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    uint64_t v31 = v12;
    [v12 addObjectsFromArray:v30];

    os_log_type_t v32 = v52;
    [(AXUISettingsWelcomeController *)v52 setScrollingDisabled:1];
    v34 = v50;
    BOOL v33 = v51;
  }
  else
  {
    uint64_t v22 = [v49 table];
    v34 = v50;
    long long v35 = [v50 heightAnchor];
    [v22 contentSize];
    uint64_t v23 = [v35 constraintGreaterThanOrEqualToConstant:v36];

    BOOL v33 = v51;
    uint64_t v31 = v12;
    if (v22 && v23)
    {
      long long v37 = objc_msgSend(v51, "ax_buddyObservedTableViews");

      if (!v37)
      {
        long long v38 = [MEMORY[0x1E4F1CA48] array];
        objc_msgSend(v51, "ax_setBuddyObservedTableViews:", v38);

        CGRect v39 = [MEMORY[0x1E4F1CA48] array];
        objc_msgSend(v51, "ax_setBuddyDynamicHeightConstraints:", v39);
      }
      uint64_t v40 = objc_msgSend(v51, "ax_buddyObservedTableViews");
      [v40 addObject:v22];

      CGRect v41 = objc_msgSend(v51, "ax_buddyDynamicHeightConstraints");
      [v41 addObject:v23];

      CGRect v42 = NSStringFromSelector(sel_contentSize);
      [v22 addObserver:v51 forKeyPath:v42 options:0 context:0];

      [v22 setScrollEnabled:0];
    }
    [v12 addObject:v23];
    os_log_type_t v32 = v52;
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v31];
  [v49 didMoveToParentViewController:v32];

  return v32;
}

uint64_t AXUISettingsHandleWelcomeControllerTableViewUpdate(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = a2;
  NSStringFromSelector(sel_contentSize);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    id v8 = v6;
    double v11 = objc_msgSend(v5, "ax_buddyObservedTableViews");
    uint64_t v12 = [v11 indexOfObject:v8];

    uint64_t v9 = v12 != 0x7FFFFFFFFFFFFFFFLL;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v13 = objc_msgSend(v5, "ax_buddyDynamicHeightConstraints");
      double v14 = [v13 objectAtIndexedSubscript:v12];

      [v8 contentSize];
      [v14 setConstant:v15];

      uint64_t v9 = 1;
    }
  }

LABEL_7:
  return v9;
}

void AXUISettingsCleanUpWelcomeControllerTableViewObservations(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = objc_msgSend(v1, "ax_buddyObservedTableViews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v8 = NSStringFromSelector(sel_contentSize);
        [v7 removeObserver:v1 forKeyPath:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_1C39E2AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C39E4E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C39E9C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id *a9, id *a10, id *location, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak(a12);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a65);
  _Unwind_Resume(a1);
}

void sub_1C39EA140(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void AXIteratePixelDataDeviceRGBWithBlock(void *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = (CGImage *)[a1 CGImage];
  unint64_t Width = CGImageGetWidth(v4);
  unint64_t Height = CGImageGetHeight(v4);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v8 = (char *)malloc_type_calloc(4 * Width * Height, 1uLL, 0x100004077774924uLL);
  long long v9 = CGBitmapContextCreate(v8, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v20.size.CGFloat width = (double)Width;
  v20.size.CGFloat height = (double)Height;
  v20.origin.double x = 0.0;
  v20.origin.CGFloat y = 0.0;
  CGContextDrawImage(v9, v20, v4);
  CGContextRelease(v9);
  char v19 = 0;
  if (Height)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v8 + 3;
    while (!Width)
    {
LABEL_7:
      ++v13;
      v14 += 4 * Width;
      if (v13 == Height) {
        goto LABEL_8;
      }
    }
    uint64_t v15 = 0;
    uint64_t v16 = v14;
    while (1)
    {
      LOBYTE(v10) = *v16;
      *(double *)&unint64_t v17 = (double)v10;
      double v18 = *(double *)&v17 / 255.0;
      LOBYTE(v17) = *(v16 - 3);
      LOBYTE(v11) = *(v16 - 2);
      LOBYTE(v12) = *(v16 - 1);
      v3[2](v3, v13, v15, &v19, (double)v17 / 255.0, (double)v11 / 255.0, (double)v12 / 255.0, v18);
      if (v19) {
        break;
      }
      v16 += 4;
      if (Width == ++v15) {
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  free(v8);
}

id AXResizeImageWithSize(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a2, a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __AXResizeImageWithSize_block_invoke;
  v11[3] = &unk_1E649C3D0;
  id v12 = v5;
  double v13 = a2;
  double v14 = a3;
  id v7 = v5;
  id v8 = [v6 imageWithActions:v11];
  long long v9 = objc_msgSend(v8, "imageWithRenderingMode:", objc_msgSend(v7, "renderingMode"));

  return v9;
}

uint64_t __AXResizeImageWithSize_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id _AXUIMakeTouch(double a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    unint64_t v17 = __Block_byref_object_copy_;
    double v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    id v8 = [v6 window];
    long long v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "convertPoint:fromView:", v7, a1, a2);
      id v12 = v9;
      id v13 = v7;
      AXPerformSafeBlock();
      id v10 = (id)v15[5];
    }
    else
    {
      _AXLogWithFacility();
      id v10 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_1C39EB5CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

id AXUIMakeTouchForTouchesBeganAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 0, a1);
}

id AXUIMakeTouchForTouchesMovedAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 1, a1);
}

id AXUIMakeTouchForTouchesEndedAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 3, a1);
}

id AXUIMakeTouchForTouchesCancelledAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 4, a1);
}

id AXUIMakeTouchForTouchesBegan(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  double MidX = CGRectGetMidX(v7);
  [v1 bounds];
  double MidY = CGRectGetMidY(v8);
  uint64_t v4 = _AXUIMakeTouch(MidX, MidY, 0, v1);

  return v4;
}

id AXUIMakeTouchForTouchesMoved(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  double MidX = CGRectGetMidX(v7);
  [v1 bounds];
  double MidY = CGRectGetMidY(v8);
  uint64_t v4 = _AXUIMakeTouch(MidX, MidY, 1, v1);

  return v4;
}

id AXUIMakeTouchForTouchesEnded(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  double MidX = CGRectGetMidX(v7);
  [v1 bounds];
  double MidY = CGRectGetMidY(v8);
  uint64_t v4 = _AXUIMakeTouch(MidX, MidY, 3, v1);

  return v4;
}

id AXUIMakeTouchForTouchesCancelled(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  double MidX = CGRectGetMidX(v7);
  [v1 bounds];
  double MidY = CGRectGetMidY(v8);
  uint64_t v4 = _AXUIMakeTouch(MidX, MidY, 4, v1);

  return v4;
}

id getAXUIDisplayManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAXUIDisplayManagerClass_softClass;
  uint64_t v7 = getAXUIDisplayManagerClass_softClass;
  if (!getAXUIDisplayManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAXUIDisplayManagerClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getAXUIDisplayManagerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39EC37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXUIDisplayManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccessibilityUIServiceLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUIServiceLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E649C418;
    uint64_t v6 = 0;
    AccessibilityUIServiceLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!AccessibilityUIServiceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AXUIDisplayManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)__getAXUIDisplayManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXUIDisplayManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUIServiceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUIServiceLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1C39EF92C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

Class __getTTSPerVoiceSettingsViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __TextToSpeechVoiceBankingUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E649C458;
    uint64_t v6 = 0;
    TextToSpeechVoiceBankingUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("TTSPerVoiceSettingsViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)__getTTSPerVoiceSettingsViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getTTSPerVoiceSettingsViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TextToSpeechVoiceBankingUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TextToSpeechVoiceBankingUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1C39EFF14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id getAVTAnimojiClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAVTAnimojiClass_softClass;
  uint64_t v7 = getAVTAnimojiClass_softClass;
  if (!getAVTAnimojiClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVTAnimojiClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getAVTAnimojiClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39EFFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVTPresetClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAVTPresetClass_softClass;
  uint64_t v7 = getAVTPresetClass_softClass;
  if (!getAVTPresetClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVTPresetClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getAVTPresetClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39F00DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVTColorPresetClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAVTColorPresetClass_softClass;
  uint64_t v7 = getAVTColorPresetClass_softClass;
  if (!getAVTColorPresetClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVTColorPresetClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getAVTColorPresetClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39F01C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVTMemojiClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAVTMemojiClass_softClass;
  uint64_t v7 = getAVTMemojiClass_softClass;
  if (!getAVTMemojiClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVTMemojiClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getAVTMemojiClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39F0660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AvatarKitLibraryCore()
{
  if (!AvatarKitLibraryCore_frameworkLibrary) {
    AvatarKitLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  return AvatarKitLibraryCore_frameworkLibrary;
}

uint64_t __AvatarKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AvatarKitLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

uint64_t AvatarUILibraryCore()
{
  if (!AvatarUILibraryCore_frameworkLibrary) {
    AvatarUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  return AvatarUILibraryCore_frameworkLibrary;
}

uint64_t __AvatarUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AvatarUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void __getAVTAnimojiClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAnimoji");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVTAnimojiClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAVTAnimojiClass_block_invoke_cold_1();
    AvatarKitLibrary();
  }
}

void AvatarKitLibrary()
{
  if (!AvatarKitLibraryCore())
  {
    id v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAVTPresetClass_block_invoke(uint64_t a1)
{
  AvatarKitLibrary();
  Class result = objc_getClass("AVTPreset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVTPresetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVTPresetClass_block_invoke_cold_1();
    return (Class)__getAVTColorPresetClass_block_invoke(v3);
  }
  return result;
}

Class __getAVTColorPresetClass_block_invoke(uint64_t a1)
{
  AvatarKitLibrary();
  Class result = objc_getClass("AVTColorPreset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVTColorPresetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVTColorPresetClass_block_invoke_cold_1();
    return (Class)__getAVTAvatarPuppetRecordClass_block_invoke(v3);
  }
  return result;
}

Class __getAVTAvatarPuppetRecordClass_block_invoke(uint64_t a1)
{
  if (!AvatarUILibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("AVTAvatarPuppetRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarPuppetRecordClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __getAVTAvatarPuppetRecordClass_block_invoke_cold_1();
    return (Class)__getAVTMemojiClass_block_invoke(v4);
  }
  return result;
}

void __getAVTMemojiClass_block_invoke(uint64_t a1)
{
  AvatarKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AVTMemoji");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVTMemojiClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    double v2 = (AXDynamicTypeImageView *)__getAVTMemojiClass_block_invoke_cold_1();
    [(AXDynamicTypeImageView *)v2 _commonInit];
  }
}

void sub_1C39F15FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getIKListItemLockupElementClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getIKListItemLockupElementClass_softClass;
  uint64_t v7 = getIKListItemLockupElementClass_softClass;
  if (!getIKListItemLockupElementClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIKListItemLockupElementClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getIKListItemLockupElementClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39F2110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39F23BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIKListItemLockupElementClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("IKListItemLockupElement");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIKListItemLockupElementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIKListItemLockupElementClass_block_invoke_cold_1();
    ITMLKitLibrary();
  }
}

void ITMLKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ITMLKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ITMLKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E649C628;
    uint64_t v3 = 0;
    ITMLKitLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!ITMLKitLibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ITMLKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ITMLKitLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getIKViewElementClass_block_invoke(uint64_t a1)
{
  ITMLKitLibrary();
  Class result = objc_getClass("IKViewElement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIKViewElementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getIKViewElementClass_block_invoke_cold_1();
    return (Class)__getIKListTemplateClass_block_invoke(v3);
  }
  return result;
}

Class __getIKListTemplateClass_block_invoke(uint64_t a1)
{
  ITMLKitLibrary();
  Class result = objc_getClass("IKListTemplate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIKListTemplateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    double v3 = __getIKListTemplateClass_block_invoke_cold_1();
    return (Class)AXUIIconImageWithBackgroundForImage(v3);
  }
  return result;
}

id AXUIIconImageWithBackgroundForImage(void *a1, void *a2, double a3, double a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1618];
  id v8 = a2;
  id v9 = a1;
  id v10 = [v7 systemWhiteColor];
  unint64_t v11 = [v9 imageWithTintColor:v10 renderingMode:1];

  double v28 = 0.0;
  [MEMORY[0x1E4FB1818] _iconVariantForUIApplicationIconFormat:0 scale:&v28];
  id v12 = (const void *)LICreateDefaultIcon();
  id v13 = [MEMORY[0x1E4FB1818] imageWithCGImage:v12];
  uint64_t v14 = [v13 imageWithTintColor:v8 renderingMode:1];

  CFRelease(v12);
  uint64_t v15 = [MEMORY[0x1E4FB17E0] preferredFormat];
  uint64_t v16 = (void *)[v15 copy];

  [v16 setScale:v28];
  id v17 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [v14 size];
  double v18 = objc_msgSend(v17, "initWithSize:format:", v16);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __AXUIIconImageWithBackgroundForImage_block_invoke;
  v23[3] = &unk_1E649C648;
  id v24 = v14;
  id v25 = v11;
  double v26 = a3;
  double v27 = a4;
  id v19 = v11;
  id v20 = v14;
  uint64_t v21 = [v18 imageWithActions:v23];

  return v21;
}

uint64_t __AXUIIconImageWithBackgroundForImage_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) size];
  double v3 = v2;
  [*(id *)(a1 + 40) size];
  double v5 = *(double *)(a1 + 48) + (v3 - v4) * 0.5;
  [*(id *)(a1 + 32) size];
  double v7 = v6;
  [*(id *)(a1 + 40) size];
  double v9 = *(double *)(a1 + 56) + (v7 - v8) * 0.5;
  id v10 = *(void **)(a1 + 32);
  [v10 size];
  double v12 = v11;
  [*(id *)(a1 + 32) size];
  objc_msgSend(v10, "drawInRect:", 0.0, 0.0, v12, v13);
  uint64_t v14 = *(void **)(a1 + 40);
  [v14 size];
  double v16 = v15;
  [*(id *)(a1 + 40) size];
  return objc_msgSend(v14, "drawInRect:", v5, v9, v16, v17);
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  double v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    double v4 = [v2 localizedStringForKey:v1 value:&stru_1F1F0EB90 table:@"Accessibility"];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

id AXLocalizedTimeSummary(int a1, double a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  double v5 = [MEMORY[0x1E4F49440] sharedInstance];
  double v6 = [v5 dialectForCurrentLocale];
  double v7 = [v6 specificLanguageID];
  int v8 = [v7 hasPrefix:@"ja"];

  uint64_t v9 = 5;
  if (!v8) {
    uint64_t v9 = 1;
  }
  if (a1) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = v9;
  }
  [v4 setUnitsStyle:v10];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v11 setSecond:(uint64_t)a2];
  objc_msgSend(v11, "setNanosecond:", (uint64_t)((a2 - (double)objc_msgSend(v11, "second")) * 1000000000.0));
  double v12 = [v4 stringFromDateComponents:v11];
  if (!a1)
  {
    double v13 = a2 - (double)[v11 second];
    uint64_t v14 = NSString;
    double v15 = accessibilityLocalizedString(@"SUB_SECOND_ABBREVIATION");
    if (v13 <= 0.0) {
      AXFormatInteger();
    }
    else {
    double v16 = AXFormatFloat();
    }
    uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

    double v12 = (void *)v17;
  }

  return v12;
}

double AXUINormalizedSafeAreaInsetsForOrientation(uint64_t a1)
{
  objc_opt_class();
  double v2 = [MEMORY[0x1E4FB33B0] safeValueForKey:@"defaultDisplayEdgeInfo"];
  double v3 = __UIAccessibilityCastAsClass();

  id v4 = [v3 safeAreaInsetsPortrait];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  double v6 = v5;

  double v7 = [v3 homeAffordanceOverlayAllowance];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11) {
    goto LABEL_2;
  }
  if (a1 != 2)
  {
    if (a1 == 3)
    {
      if (v9 > 0.0) {
        goto LABEL_11;
      }
      id v14 = v3;
      id v20 = [v14 safeAreaInsetsLandscapeRight];

      double v16 = v14;
      if (v20)
      {
LABEL_18:
        uint64_t v21 = [v16 safeAreaInsetsLandscapeRight];
LABEL_24:
        id v25 = (void *)v21;
        UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
        double v6 = v26;

        goto LABEL_2;
      }
      id v24 = [v14 safeAreaInsetsLandscapeLeft];

      double v16 = v14;
      if (!v24)
      {
LABEL_23:
        uint64_t v21 = [v16 safeAreaInsetsPortrait];
        goto LABEL_24;
      }
    }
    else
    {
      if (a1 != 4) {
        goto LABEL_2;
      }
      if (v9 > 0.0)
      {
LABEL_11:
        UIEdgeInsetsRotate();
        double v6 = v13;
        goto LABEL_2;
      }
      id v14 = v3;
      double v15 = [v14 safeAreaInsetsLandscapeLeft];

      double v16 = v14;
      if (!v15)
      {
        uint64_t v17 = [v14 safeAreaInsetsLandscapeRight];

        double v16 = v14;
        if (!v17) {
          goto LABEL_23;
        }
        goto LABEL_18;
      }
    }
    uint64_t v21 = [v16 safeAreaInsetsLandscapeLeft];
    goto LABEL_24;
  }
  if (v9 > 0.0) {
    goto LABEL_11;
  }
  id v18 = v3;
  id v19 = [v18 safeAreaInsetsPortraitUpsideDown];

  if (v19) {
    [v18 safeAreaInsetsPortraitUpsideDown];
  }
  else {
  uint64_t v22 = [v18 safeAreaInsetsPortrait];
  }

  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  double v6 = v23;

LABEL_2:
  return v6;
}

double AXUIConvertPointFromScreenToContextSpace(void *a1, double a2, double a3)
{
  id v5 = a1;
  objc_opt_class();
  double v6 = [v5 safeValueForKey:@"_transformLayer"];
  double v7 = __UIAccessibilityCastAsClass();

  objc_msgSend(v7, "convertPoint:toLayer:", 0, a2, a3);
  double v9 = v8;

  return v9;
}

double AXUIConvertRectFromScreenToContextSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  objc_opt_class();
  uint64_t v10 = [v9 safeValueForKey:@"_transformLayer"];
  uint64_t v11 = __UIAccessibilityCastAsClass();

  objc_msgSend(v11, "convertRect:toLayer:", 0, a2, a3, a4, a5);
  double v13 = v12;

  return v13;
}

double AXUIConvertPointFromContextToScreenSpace(void *a1, double a2, double a3)
{
  id v5 = a1;
  objc_opt_class();
  double v6 = [v5 safeValueForKey:@"_transformLayer"];
  double v7 = __UIAccessibilityCastAsClass();

  objc_msgSend(v7, "convertPoint:fromLayer:", 0, a2, a3);
  double v9 = v8;

  return v9;
}

double AXUIConvertRectFromContextToScreenSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  objc_opt_class();
  uint64_t v10 = [v9 safeValueForKey:@"_transformLayer"];
  uint64_t v11 = __UIAccessibilityCastAsClass();

  objc_msgSend(v11, "convertRect:fromLayer:", 0, a2, a3, a4, a5);
  double v13 = v12;

  return v13;
}

id AXUIApplicationWindows()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v0 = objc_opt_new();
  id v1 = (id *)MEMORY[0x1E4FB2608];
  double v2 = [(id)*MEMORY[0x1E4FB2608] connectedScenes];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v8 = [v7 windows];
          [v0 axSafelyAddObjectsFromArray:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  if (![v0 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = [*v1 _accessibilityAllWindowsOnlyVisibleWindows:0];
    [v0 axSafelyAddObjectsFromArray:v9];
  }
  return v0;
}

void sub_1C39F514C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t HardwareKeyboardAvailabilityChanged(uint64_t a1, void *a2)
{
  return [a2 updateKeyboardHardwareState];
}

id getSUUIItemOfferButtonClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getSUUIItemOfferButtonClass_softClass;
  uint64_t v7 = getSUUIItemOfferButtonClass_softClass;
  if (!getSUUIItemOfferButtonClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSUUIItemOfferButtonClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getSUUIItemOfferButtonClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39FE2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A00080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

Class __getSUUIItemOfferButtonClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MobileStoreUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MobileStoreUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E649C7F0;
    uint64_t v6 = 0;
    MobileStoreUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!MobileStoreUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SUUIItemOfferButton");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)__getSUUIItemOfferButtonClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSUUIItemOfferButtonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileStoreUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileStoreUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1C3A01318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _accessibilityiTunesSettings(uint64_t a1, void *a2)
{
  return [a2 performSelector:sel_reloadSpecifiers withObject:0 afterDelay:0.5];
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1C3A07C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXUICreateFloatingShadowImageWithRadius(void *a1, double a2)
{
  double v3 = a2 + 10.0;
  uint64_t v4 = (void *)MEMORY[0x1E4FB1BA8];
  id v5 = a1;
  uint64_t v6 = [v4 mainScreen];
  [v6 scale];
  CGFloat v8 = v7;
  v17.CGFloat width = v3 + v3;
  v17.CGFloat height = v3 + v3;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v8);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  id v10 = v5;
  long long v11 = (CGColor *)[v10 CGColor];
  CGContextSetShadowWithColor(CurrentContext, *MEMORY[0x1E4F1DB30], 10.0, v11);
  long long v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 10.0, 10.0, a2 + a2, a2 + a2);
  [v10 set];

  [v12 fill];
  CGContextRestoreGState(CurrentContext);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceOut);
  [v12 fill];
  long long v13 = UIGraphicsGetImageFromCurrentImageContext();
  long long v14 = objc_msgSend(v13, "resizableImageWithCapInsets:", v3, v3, v3, v3);

  UIGraphicsEndImageContext();
  return v14;
}

void sub_1C3A0B2A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

BOOL AXGestureRecorderTypeIsForRealTimeGesture(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

void sub_1C3A0DEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXNamesForDrags(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AXUILocalizedStringForKey(@"UNNAMED_DRAG");
  double v3 = AXUILocalizedStringForKey(@"UNNAMED_DRAG_ORDINAL");
  uint64_t v4 = _AXNamesForDragAndDropItems(v1, v2, v3);

  return v4;
}

id _AXNamesForDragAndDropItems(void *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v32 = a2;
  id v30 = a3;
  uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v39;
    long long v11 = (uint64_t *)MEMORY[0x1E4F48848];
    uint64_t v12 = *MEMORY[0x1E4F48848];
    uint64_t v13 = *MEMORY[0x1E4F48860];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v6);
        }
        double v15 = [*(id *)(*((void *)&v38 + 1) + 8 * i) objectForKeyedSubscript:v12];
        unsigned int v16 = [v15 isEqual:v13];

        v9 += v16;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }
  else
  {
    long long v11 = (uint64_t *)MEMORY[0x1E4F48848];
    uint64_t v9 = 0;
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v6;
  uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  id v18 = (void *)v31;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v35;
    uint64_t v22 = *v11;
    uint64_t v23 = *MEMORY[0x1E4F48860];
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        id v25 = [*(id *)(*((void *)&v34 + 1) + 8 * j) objectForKeyedSubscript:v22];
        if ([v25 isEqualToString:v23])
        {
          ++v20;
          if (v9 == 1)
          {
            id v26 = v32;
          }
          else
          {
            double v27 = NSString;
            uint64_t v28 = AXFormatInteger();
            objc_msgSend(v27, "localizedStringWithFormat:", v30, v28);
            id v26 = (id)objc_claimAutoreleasedReturnValue();

            id v25 = (void *)v28;
            id v18 = (void *)v31;
          }

          id v25 = v26;
        }
        [v18 addObject:v25];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v19);
  }

  return v18;
}

id AXNamesForDrops(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AXUILocalizedStringForKey(@"UNNAMED_DROP");
  double v3 = AXUILocalizedStringForKey(@"UNNAMED_DROP_ORDINAL");
  uint64_t v4 = _AXNamesForDragAndDropItems(v1, v2, v3);

  return v4;
}

id AXUIContentSizeCategoryMin(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (id)*MEMORY[0x1E4FB27F0];
  char v6 = [v3 isEqual:*MEMORY[0x1E4FB27F0]];
  uint64_t v7 = v4;
  if ((v6 & 1) == 0)
  {
    char v8 = [v4 isEqual:v5];
    uint64_t v7 = v3;
    if ((v8 & 1) == 0)
    {
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)v4);
      uint64_t v7 = v3;
      if ((unint64_t)(v9 + 1) >= 2)
      {
        if (v9 != NSOrderedDescending) {
          goto LABEL_7;
        }
        uint64_t v7 = v4;
      }
    }
  }
  id v5 = v7;
LABEL_7:

  return v5;
}

id AXUIContentSizeCategoryMax(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (id)*MEMORY[0x1E4FB27F0];
  char v6 = [v3 isEqual:*MEMORY[0x1E4FB27F0]];
  uint64_t v7 = v4;
  if ((v6 & 1) != 0
    || (v8 = [v4 isEqual:v5], uint64_t v7 = v3, (v8 & 1) != 0)
    || (NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)v4),
        uint64_t v7 = v4,
        v9 == NSOrderedAscending)
    || (uint64_t v7 = v3, (unint64_t)v9 <= NSOrderedDescending))
  {
    id v5 = v7;
  }

  return v5;
}

id getHUAccessoryHearingSettingsClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getHUAccessoryHearingSettingsClass_softClass;
  uint64_t v7 = getHUAccessoryHearingSettingsClass_softClass;
  if (!getHUAccessoryHearingSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getHUAccessoryHearingSettingsClass_block_invoke;
    v3[3] = &unk_1E649BF00;
    v3[4] = &v4;
    __getHUAccessoryHearingSettingsClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C3A17C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id accessibilityHearingAidSupportBundle_Soft()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void (*)(void))getaccessibilityHearingAidSupportBundleSymbolLoc_ptr;
  char v8 = getaccessibilityHearingAidSupportBundleSymbolLoc_ptr;
  if (!getaccessibilityHearingAidSupportBundleSymbolLoc_ptr)
  {
    id v1 = (void *)HearingUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "accessibilityHearingAidSupportBundle");
    getaccessibilityHearingAidSupportBundleSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    id v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = -[AXUISettingsInstructionsView textView:primaryActionForTextItem:defaultAction:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume((_Unwind_Exception *)v4);
  }
  uint64_t v2 = v0();
  return v2;
}

Class __getHUAccessoryHearingSettingsClass_block_invoke(uint64_t a1)
{
  HearingUtilitiesLibrary();
  Class result = objc_getClass("HUAccessoryHearingSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHUAccessoryHearingSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHUAccessoryHearingSettingsClass_block_invoke_cold_1();
    return (Class)HearingUtilitiesLibrary();
  }
  return result;
}

uint64_t HearingUtilitiesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __HearingUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E649C9D0;
    uint64_t v5 = 0;
    HearingUtilitiesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = HearingUtilitiesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HearingUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HearingUtilitiesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getaccessibilityHearingAidSupportBundleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HearingUtilitiesLibrary();
  uint64_t result = dlsym(v2, "accessibilityHearingAidSupportBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getaccessibilityHearingAidSupportBundleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void QSInstallSharedSafeCategoriesIfNeeded()
{
  if (QSInstallSharedSafeCategoriesIfNeeded_onceToken != -1) {
    dispatch_once(&QSInstallSharedSafeCategoriesIfNeeded_onceToken, &__block_literal_global_12);
  }
}

void __QSInstallSharedSafeCategoriesIfNeeded_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F483A8] sharedInstance];
  [v0 installSafeCategory:@"NSObject_QSSupport" canInteractWithTargetClass:1];

  id v1 = [MEMORY[0x1E4F483A8] sharedInstance];
  [v1 installSafeCategory:@"UIPasteboard_QSExtras" canInteractWithTargetClass:1];
}

void QSUnionRectsWithRect(void *a1, CGFloat a2, double a3, CGFloat a4, CGFloat a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  uint64_t v10 = v9;
  if (v9)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        objc_msgSend(v16, "rectValue", (void)v25);
        if (vabdd_f64(a3, v17) < 0.001) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v18 = v16;
      uint64_t v19 = (void *)MEMORY[0x1E4F29238];
      [v18 rectValue];
      v33.origin.double x = v20;
      v33.origin.CGFloat y = v21;
      v33.size.CGFloat width = v22;
      v33.size.CGFloat height = v23;
      v31.origin.double x = a2;
      v31.origin.CGFloat y = a3;
      v31.size.CGFloat width = a4;
      v31.size.CGFloat height = a5;
      CGRect v32 = CGRectUnion(v31, v33);
      id v24 = objc_msgSend(v19, "valueWithRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);

      if (!v24) {
        goto LABEL_13;
      }
      objc_msgSend(v11, "replaceObjectAtIndex:withObject:", objc_msgSend(v11, "indexOfObject:", v18), v24);
    }
    else
    {
LABEL_10:

      id v18 = 0;
LABEL_13:
      id v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", a2, a3, a4, a5, (void)v25);
      [v11 addObject:v24];
    }
  }
}

void sub_1C3A19BC8(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v4 = objc_begin_catch(exception_object);
    [*(id *)(v3 + 2680) _accessibilitySetUseQuickSpeakPasteBoard:v2];

    objc_end_catch();
    JUMPOUT(0x1C3A19B64);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C3A1AA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1C3A1AC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIKViewElementClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("IKViewElement");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIKViewElementClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIKViewElementClass_block_invoke_cold_1();
    ITMLKitLibrary_0();
  }
}

void ITMLKitLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ITMLKitLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ITMLKitLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E649CA58;
    uint64_t v3 = 0;
    ITMLKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ITMLKitLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ITMLKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ITMLKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getIKImageElementClass_block_invoke(uint64_t a1)
{
  ITMLKitLibrary_0();
  Class result = objc_getClass("IKImageElement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIKImageElementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getIKImageElementClass_block_invoke_cold_1();
    return (Class)__getIKTextElementClass_block_invoke(v3);
  }
  return result;
}

Class __getIKTextElementClass_block_invoke(uint64_t a1)
{
  ITMLKitLibrary_0();
  Class result = objc_getClass("IKTextElement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getIKTextElementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getIKTextElementClass_block_invoke_cold_1();
    return (Class)AXUIToggleIncomingCall(v3);
  }
  return result;
}

uint64_t AXUIToggleIncomingCall()
{
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  char v5 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  uint64_t v0 = *((unsigned __int8 *)v3 + 24);
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C3A1B234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __AXUIToggleIncomingCall_block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v1 = [MEMORY[0x1E4FADA90] sharedInstance];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [v1 incomingCall];
  [v2 axSafelyAddObject:v3];

  uint64_t v4 = [v1 incomingVideoCall];
  [v2 axSafelyAddObject:v4];

  char v5 = [v2 firstObject];
  LOBYTE(v67) = 1;
  _AXLogWithFacility();
  uint64_t v6 = [MEMORY[0x1E4F48370] sharedInstance:v67, @"Incoming call: %@", v5];
  char v7 = [v6 ignoreLogging];

  if ((v7 & 1) == 0)
  {
    char v8 = [MEMORY[0x1E4F48370] identifier];
    id v9 = AXLoggerForFacility();

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = AXColorizeFormatLog();
      v68 = NSStringFromBOOL();
      uint64_t v12 = _AXStringForArgs();

      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v74 = v12;
        _os_log_impl(&dword_1C39D1000, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F48370] sharedInstance];
    char v14 = [v13 ignoreLogging];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = [MEMORY[0x1E4F48370] identifier];
      unsigned int v16 = AXLoggerForFacility();

      os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v16, v17))
      {
        id v18 = AXColorizeFormatLog();
        v68 = (void *)[v5 status];
        uint64_t v19 = _AXStringForArgs();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138543362;
          v74 = v19;
          _os_log_impl(&dword_1C39D1000, v16, v17, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (objc_msgSend(v5, "status", v68) == 4)
    {
      CGFloat v20 = [MEMORY[0x1E4F48370] sharedInstance];
      char v21 = [v20 ignoreLogging];

      if ((v21 & 1) == 0)
      {
        CGFloat v22 = [MEMORY[0x1E4F48370] identifier];
        CGFloat v23 = AXLoggerForFacility();

        os_log_type_t v24 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v23, v24))
        {
          long long v25 = AXColorizeFormatLog();
          long long v26 = _AXStringForArgs();
          if (os_log_type_enabled(v23, v24))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v26;
            _os_log_impl(&dword_1C39D1000, v23, v24, "%{public}@", buf, 0xCu);
          }
        }
      }
      [v1 answerCall:v5];
      long long v27 = [MEMORY[0x1E4F48370] sharedInstance];
      char v28 = [v27 ignoreLogging];

      if ((v28 & 1) == 0)
      {
        uint64_t v29 = [MEMORY[0x1E4F48370] identifier];
        uint64_t v30 = AXLoggerForFacility();

        os_log_type_t v31 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v30, v31))
        {
          CGRect v32 = AXColorizeFormatLog();
          [v5 status];
          CGRect v33 = _AXStringForArgs();
          if (os_log_type_enabled(v30, v31))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v33;
            _os_log_impl(&dword_1C39D1000, v30, v31, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    long long v34 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = [v1 currentCalls];
    [v34 axSafelyAddObjectsFromArray:v35];

    long long v36 = [v1 currentVideoCalls];
    [v34 axSafelyAddObjectsFromArray:v36];

    LOBYTE(v6_Block_object_dispose(&STACK[0x200], 8) = 1;
    _AXLogWithFacility();
    long long v37 = [MEMORY[0x1E4F48370] sharedInstance:v68, @"Existing calls: %@", v34];
    char v38 = [v37 ignoreLogging];

    if ((v38 & 1) == 0)
    {
      long long v39 = [MEMORY[0x1E4F48370] identifier];
      long long v40 = AXLoggerForFacility();

      os_log_type_t v41 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v40, v41))
      {
        CGRect v42 = AXColorizeFormatLog();
        uint64_t v69 = [v34 count];
        CGRect v43 = _AXStringForArgs();
        if (os_log_type_enabled(v40, v41))
        {
          *(_DWORD *)buf = 138543362;
          v74 = v43;
          _os_log_impl(&dword_1C39D1000, v40, v41, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (objc_msgSend(v34, "count", v69))
    {
      uint64_t v44 = [v34 firstObject];
      uint64_t v45 = [v44 status];
      CGRect v46 = [MEMORY[0x1E4F48370] sharedInstance];
      char v47 = [v46 ignoreLogging];

      if ((v47 & 1) == 0)
      {
        NSRange v48 = [MEMORY[0x1E4F48370] identifier];
        v49 = AXLoggerForFacility();

        os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v49, v50))
        {
          v71 = v44;
          id v51 = AXColorizeFormatLog();
          uint64_t v70 = v45;
          v52 = _AXStringForArgs();
          if (os_log_type_enabled(v49, v50))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v52;
            _os_log_impl(&dword_1C39D1000, v49, v50, "%{public}@", buf, 0xCu);
          }

          uint64_t v44 = v71;
        }
      }
      if (v45 <= 3)
      {
        v53 = [MEMORY[0x1E4F48370] sharedInstance];
        char v54 = [v53 ignoreLogging];

        if ((v54 & 1) == 0)
        {
          v55 = [MEMORY[0x1E4F48370] identifier];
          v56 = AXLoggerForFacility();

          os_log_type_t v57 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v56, v57))
          {
            v58 = AXColorizeFormatLog();
            v59 = _AXStringForArgs();
            if (os_log_type_enabled(v56, v57))
            {
              *(_DWORD *)buf = 138543362;
              v74 = v59;
              _os_log_impl(&dword_1C39D1000, v56, v57, "%{public}@", buf, 0xCu);
            }
          }
        }
        objc_msgSend(v1, "disconnectCall:withReason:", v44, 2, v70);
        v60 = [MEMORY[0x1E4F48370] sharedInstance];
        char v61 = [v60 ignoreLogging];

        if ((v61 & 1) == 0)
        {
          v62 = [MEMORY[0x1E4F48370] identifier];
          v63 = AXLoggerForFacility();

          os_log_type_t v64 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v63, v64))
          {
            v65 = AXColorizeFormatLog();
            [v44 status];
            v66 = _AXStringForArgs();
            if (os_log_type_enabled(v63, v64))
            {
              *(_DWORD *)buf = 138543362;
              v74 = v66;
              _os_log_impl(&dword_1C39D1000, v63, v64, "%{public}@", buf, 0xCu);
            }
          }
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

id AXSortedDialectsForDisplay(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 dialects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __AXSortedDialectsForDisplay_block_invoke;
  v8[3] = &unk_1E649CA78;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 sortedArrayUsingComparator:v8];

  return v6;
}

uint64_t __AXSortedDialectsForDisplay_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 locale];
  char v8 = [v7 localeIdentifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  os_log_type_t v10 = [v6 locale];
  id v11 = [v10 localeIdentifier];
  int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

  if (!v9 || v12)
  {
    if ((v12 ^ 1 | v9) == 1)
    {
      char v14 = [v5 languageNameAndLocaleInCurrentLocale];
      uint64_t v15 = [v6 languageNameAndLocaleInCurrentLocale];
      uint64_t v13 = [v14 localizedCompare:v15];
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = -1;
  }

  return v13;
}

void AXAddVoiceFootprintsToArrayForDialect(void *a1, void *a2, void *a3, int a4, int a5)
{
  int v9 = (void *)MEMORY[0x1E4FAF278];
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  uint64_t v13 = [v9 sharedInstance];
  id v14 = [v13 resourcesWithType:1 subType:1];

  AXAddVoiceFootprintsToArrayForDialectWithResources(v12, v11, v14, v10, a4, a5);
}

void AXAddVoiceFootprintsToArrayForDialectWithResources(void *a1, void *a2, void *a3, void *a4, int a5, int a6)
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v100 = a1;
  id v108 = a2;
  id v9 = a3;
  id v10 = a4;
  id v94 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F1CA80] set];
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v126 objects:v137 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = *(id *)v127;
    id v101 = *(id *)v127;
    do
    {
      uint64_t v15 = 0;
      uint64_t v103 = v13;
      do
      {
        if (*(id *)v127 != v14) {
          objc_enumerationMutation(obj);
        }
        unsigned int v16 = *(void **)(*((void *)&v126 + 1) + 8 * v15);
        os_log_type_t v17 = [v16 voiceId];
        char v18 = [v11 containsObject:v17];

        if ((v18 & 1) == 0)
        {
          uint64_t v19 = [v16 primaryLanguage];
          CGFloat v20 = [v108 specificLanguageID];
          char v21 = [v19 isEqualToString:v20];

          if (v21) {
            goto LABEL_26;
          }
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          CGFloat v22 = [v108 langMap];
          CGFloat v23 = [v22 alternateLanguageIDs];

          uint64_t v24 = [v23 countByEnumeratingWithState:&v122 objects:v136 count:16];
          if (!v24)
          {

            goto LABEL_7;
          }
          uint64_t v25 = v24;
          uint64_t v106 = v15;
          int v26 = 0;
          uint64_t v27 = *(void *)v123;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v123 != v27) {
                objc_enumerationMutation(v23);
              }
              uint64_t v29 = *(void *)(*((void *)&v122 + 1) + 8 * i);
              uint64_t v30 = [v16 primaryLanguage];
              if ([v30 isEqualToString:v29])
              {
                os_log_type_t v31 = [v16 voiceId];
                v26 |= [v11 containsObject:v31] ^ 1;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v122 objects:v136 count:16];
          }
          while (v25);

          id v14 = v101;
          uint64_t v13 = v103;
          uint64_t v15 = v106;
          if (v26)
          {
LABEL_26:
            if (([v16 type] != 3 || objc_msgSend(v16, "subtype") != 6 || a5)
              && ([v16 type] != 3 || objc_msgSend(v16, "subtype") != 7 || a6)
              && ([v16 shouldFilterResourceFromUI] & 1) == 0)
            {
              CGRect v32 = [v16 voiceId];
              [v11 addObject:v32];

              [v94 addObject:v16];
            }
          }
        }
LABEL_7:
        ++v15;
      }
      while (v15 != v13);
      uint64_t v33 = [obj countByEnumeratingWithState:&v126 objects:v137 count:16];
      uint64_t v13 = v33;
    }
    while (v33);
  }

  [v94 sortUsingComparator:&__block_literal_global_14];
  long long v34 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v102 = v94;
  uint64_t v35 = [v102 countByEnumeratingWithState:&v118 objects:v135 count:16];
  v107 = v34;
  if (!v35) {
    goto LABEL_75;
  }
  uint64_t v36 = v35;
  uint64_t v104 = *(void *)v119;
  do
  {
    uint64_t v37 = 0;
    uint64_t v98 = v36;
    do
    {
      if (*(void *)v119 != v104) {
        objc_enumerationMutation(v102);
      }
      char v38 = *(void **)(*((void *)&v118 + 1) + 8 * v37);
      uint64_t v39 = [v38 type];
      if (v39 != 3) {
        goto LABEL_42;
      }
      if ([v38 subtype] == 7) {
        goto LABEL_42;
      }
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke_2;
      v117[3] = &unk_1E649CAC0;
      v117[4] = v38;
      long long v40 = objc_msgSend(v102, "ax_filteredArrayUsingBlock:", v117);
      uint64_t v41 = [v40 count];

      if (!v41)
      {
LABEL_42:
        if ([v38 type] == 10 && objc_msgSend(v38, "footprint") == 4)
        {
          CGRect v43 = [v38 name];
          if ([v43 isEqualToString:@"Yu-shu"])
          {
          }
          else
          {
            uint64_t v44 = [v38 name];
            int v45 = [v44 isEqualToString:@"Nicky"];

            if (!v45) {
              goto LABEL_70;
            }
          }
        }
        uint64_t v46 = [v38 localizedName];
        if (v46)
        {
          char v47 = (void *)v46;
          if ([v38 footprint] == 3
            && [v38 type] == 4
            && ([v38 speechVoice],
                NSRange v48 = objc_claimAutoreleasedReturnValue(),
                char v49 = [v48 isDefault],
                v48,
                (v49 & 1) == 0))
          {
            v63 = [v38 voiceId];
            os_log_type_t v64 = [v63 stringByReplacingOccurrencesOfString:@"compact" withString:@"super-compact"];

            v65 = [MEMORY[0x1E4FAF278] sharedInstance];
            v66 = [v65 resourceWithVoiceId:v64];

            if (!v66)
            {
LABEL_54:
              id v51 = [v38 speechVoice];
              char v54 = [v51 synthesisProviderVoice];

              if (v54)
              {
                v55 = [v51 synthesisProviderVoice];
                v56 = [v55 groupName];
                os_log_type_t v57 = v56;
                if (v56)
                {
                  id v58 = v56;
                }
                else
                {
                  AXLocalizedString();
                  id v58 = (id)objc_claimAutoreleasedReturnValue();
                }
                id v59 = v58;

                char v47 = v59;
                long long v34 = v107;
              }
              if (v39 == 3)
              {
                uint64_t v60 = AXLocalizedString();

                char v47 = (void *)v60;
              }
              char v61 = [v34 objectForKey:v47];
              v53 = (void *)[v61 mutableCopy];

              if (v53)
              {
                [v53 addObject:v38];
                [v34 setObject:v53 forKey:v47];
              }
              else
              {
                v132 = v38;
                v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
                [v34 setObject:v62 forKey:v47];
              }
              goto LABEL_67;
            }
            uint64_t v36 = v98;
          }
          else
          {
            if ([v38 footprint] != 2) {
              goto LABEL_54;
            }
            os_log_type_t v50 = [v38 voiceId];
            id v51 = [v50 stringByReplacingOccurrencesOfString:@"super-compact" withString:@"compact"];

            v52 = [MEMORY[0x1E4FAF278] sharedInstance];
            v53 = [v52 resourceWithVoiceId:v51];

            if (!v53 || ([v53 isInstalled] & 1) == 0)
            {

              goto LABEL_54;
            }
LABEL_67:

            uint64_t v36 = v98;
LABEL_68:
          }
          goto LABEL_70;
        }
        id v51 = AXLogSpeechAssetDownload();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v134 = v38;
          _os_log_error_impl(&dword_1C39D1000, v51, OS_LOG_TYPE_ERROR, "This resource had no name!: %{public}@", buf, 0xCu);
        }
        char v47 = 0;
        goto LABEL_68;
      }
      CGRect v42 = AXLogSpeechAssetDownload();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C39D1000, v42, OS_LOG_TYPE_INFO, "Excluding siri voice because a higher priority siri voice is available (gryphon -> neural -> neuralAX)", buf, 2u);
      }

LABEL_70:
      ++v37;
    }
    while (v36 != v37);
    uint64_t v67 = [v102 countByEnumeratingWithState:&v118 objects:v135 count:16];
    uint64_t v36 = v67;
  }
  while (v67);
LABEL_75:

  v68 = [v34 allKeys];
  uint64_t v69 = [v68 sortedArrayUsingComparator:&__block_literal_global_332];

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v95 = v69;
  uint64_t v105 = [v95 countByEnumeratingWithState:&v113 objects:v131 count:16];
  if (v105)
  {
    uint64_t v99 = *(void *)v114;
    do
    {
      for (uint64_t j = 0; j != v105; ++j)
      {
        if (*(void *)v114 != v99) {
          objc_enumerationMutation(v95);
        }
        uint64_t v71 = *(void *)(*((void *)&v113 + 1) + 8 * j);
        v72 = objc_alloc_init(AXSettingsVoiceResourceFootprintSpecifierData);
        [(AXSettingsVoiceResourceFootprintSpecifierData *)v72 setName:v71];
        [(AXSettingsVoiceResourceFootprintSpecifierData *)v72 setDialect:v108];
        v73 = [v34 objectForKey:v71];
        [(AXSettingsVoiceResourceFootprintSpecifierData *)v72 setResources:v73];
        v74 = [MEMORY[0x1E4F48388] sharedInstance];
        char v75 = [v74 ignoreLogging];

        if ((v75 & 1) == 0)
        {
          v76 = [MEMORY[0x1E4F48388] identifier];
          v77 = AXLoggerForFacility();

          os_log_type_t v78 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v77, v78))
          {
            v79 = AXColorizeFormatLog();
            v91 = v73;
            uint64_t v92 = v71;
            v80 = _AXStringForArgs();
            if (os_log_type_enabled(v77, v78))
            {
              *(_DWORD *)buf = 138543362;
              v134 = v80;
              _os_log_impl(&dword_1C39D1000, v77, v78, "%{public}@", buf, 0xCu);
            }

            long long v34 = v107;
          }
        }
        if (_AXSInUnitTestMode() && ![v73 count])
        {
          v81 = (void *)MEMORY[0x1E4F1CA00];
          v82 = [NSString stringWithFormat:@"No voices? %@\n languageResources: %@\n resources:%@", v34, v102, v73];
          v83 = [v81 exceptionWithName:@"SpeechTest" reason:v82 userInfo:0];

          [v83 raise];
        }
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v84 = v73;
        uint64_t v85 = [v84 countByEnumeratingWithState:&v109 objects:v130 count:16];
        if (v85)
        {
          uint64_t v86 = v85;
          uint64_t v87 = *(void *)v110;
          do
          {
            for (uint64_t k = 0; k != v86; ++k)
            {
              if (*(void *)v110 != v87) {
                objc_enumerationMutation(v84);
              }
              v89 = objc_msgSend(*(id *)(*((void *)&v109 + 1) + 8 * k), "voiceId", v91, v92);
              int v90 = [v10 isEqualToString:v89];

              if (v90) {
                [(AXSettingsVoiceResourceFootprintSpecifierData *)v72 setIsSelected:1];
              }
            }
            uint64_t v86 = [v84 countByEnumeratingWithState:&v109 objects:v130 count:16];
          }
          while (v86);
        }

        [v100 addObject:v72];
        long long v34 = v107;
      }
      uint64_t v105 = [v95 countByEnumeratingWithState:&v113 objects:v131 count:16];
    }
    while (v105);
  }
}

uint64_t __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 name];
  char v7 = [v4 name];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [v5 footprint];

    uint64_t v10 = v9 < [v4 footprint];
  }
  else
  {
    id v11 = [v5 name];

    uint64_t v12 = [v4 name];
    uint64_t v10 = [v11 localizedCompare:v12];
  }
  return v10;
}

BOOL __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 subtype];
  unint64_t v5 = [*(id *)(a1 + 32) subtype];
  if ([v3 type] == 3)
  {
    id v6 = [v3 name];
    char v7 = [*(id *)(a1 + 32) name];
    if ([v6 isEqualToString:v7]) {
      BOOL v9 = *(id *)(a1 + 32) != v3 && v4 > v5;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke_329(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

id AXSortTTSAXResourcesForSiriVoicesIfNeeded(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 firstObject];
  uint64_t v3 = [v2 type];

  if (v3 == 3)
  {
    uint64_t v4 = [v1 sortedArrayUsingComparator:&__block_literal_global_346];

    id v1 = (id)v4;
  }
  return v1;
}

uint64_t __AXSortTTSAXResourcesForSiriVoicesIfNeeded_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = AXLocalizedVoiceVariantNameForResource(a2);
  id v6 = AXLocalizedVoiceVariantNameForResource(v4);

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

id AXLocalizedVoiceVariantNameForResource(void *a1)
{
  id v1 = a1;
  if ([v1 type] != 3
    || ([v1 voiceId],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        AXSiriDisplayNameForIdentifier(),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v3))
  {
    uint64_t v3 = [v1 localizedNameWithFootprint];
  }

  return v3;
}

uint64_t AXSortedVoiceVariantsForDisplay(void *a1, const char *a2)
{
  return [a1 sortedArrayUsingComparator:&__block_literal_global_348];
}

uint64_t __AXSortedVoiceVariantsForDisplay_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 footprint];
  if (v6 == [v4 footprint])
  {
    uint64_t v7 = [v5 name];

    int v8 = [v4 name];
    uint64_t v9 = [v7 localizedCompare:v8];
  }
  else
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = [v5 footprint];

    uint64_t v7 = [v10 numberWithInteger:v11];
    int v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "footprint"));
    uint64_t v9 = [v7 compare:v8];
  }
  uint64_t v12 = v9;

  return v12;
}

id AXLocalizedTileForResourceDownloadSizeRequired(void *a1)
{
  id v1 = (void *)[a1 assetSize];
  if (v1)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = AXUILocalizedStringForKey(@"DOWNLOADED_VOICE_REQUIRES");
    id v4 = [MEMORY[0x1E4F28B68] stringFromByteCount:v1 countStyle:0];
    id v1 = objc_msgSend(v2, "stringWithFormat:", v3, v4);
  }
  return v1;
}

id AXLocalizedTileForResourceOnDiskSizeUsed(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)[v1 assetSize];
  if (v2
    || ([v1 axAsset],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 computedOnDiskSize],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v2 = (void *)[v4 unsignedLongLongValue],
        v4,
        v3,
        v2))
  {
    id v5 = NSString;
    uint64_t v6 = AXUILocalizedStringForKey(@"DOWNLOADED_VOICE_USING");
    uint64_t v7 = [MEMORY[0x1E4F28B68] stringFromByteCount:v2 countStyle:0];
    uint64_t v2 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  return v2;
}

id AXLanguagesAvailableForPronuncationEditor()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  id v1 = [MEMORY[0x1E4F49440] sharedInstance];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [MEMORY[0x1E4FAF278] sharedInstance];
  uint64_t v3 = [v2 resourcesWithType:1 subType:1];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(*((void *)&v17 + 1) + 8 * i) primaryLanguage];
        uint64_t v9 = AXCLanguageConvertToCanonicalForm();

        if (([v0 containsObject:v9] & 1) == 0)
        {
          uint64_t v10 = [v1 dialectForLanguageID:v9];
          uint64_t v11 = [v10 languageNameAndLocaleInCurrentLocale];
          uint64_t v12 = (void *)v11;
          if (v11) {
            BOOL v13 = v9 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13)
          {
            v21[0] = v9;
            v21[1] = v11;
            id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
            [v16 addObject:v14];

            [v0 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  [v16 sortUsingComparator:&__block_literal_global_360];
  return v16;
}

uint64_t __AXLanguagesAvailableForPronuncationEditor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectAtIndexedSubscript:1];
  uint64_t v6 = [v4 objectAtIndexedSubscript:1];

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

void _AXCheckForCatalogUpdate()
{
  if (_AXCheckForCatalogUpdate_onceToken != -1) {
    dispatch_once(&_AXCheckForCatalogUpdate_onceToken, &__block_literal_global_363);
  }
}

void sub_1C3A1E6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3A1ECF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsVoiceAssetManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AXSpeechAssetServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AXSpeechAssetServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E649CB98;
    uint64_t v6 = 0;
    AXSpeechAssetServicesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AXSpeechAssetServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AXSettingsVoiceAssetManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getAXSettingsVoiceAssetManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXSettingsVoiceAssetManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXSpeechAssetServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXSpeechAssetServicesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1C3A1FDA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1C3A21E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _AXUISettingsAccessibilityBundle()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B50];
  id v1 = AXSystemRootDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"/System/Library/PreferenceBundles/AccessibilitySettings.bundle"];
  uint64_t v3 = [v0 bundleWithPath:v2];

  return v3;
}

id AXUILocalizedStringForKey(void *a1)
{
  return AXUILocalizedStringForKeyWithTable(a1, @"AXUILocalizedStrings");
}

id AXUILocalizedStringForKeyWithTable(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = (void *)AXUILocalizedStringForKeyWithTable_Bundle;
  if (!AXUILocalizedStringForKeyWithTable_Bundle)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AccessibilityUIUtilities"];
    uint64_t v7 = (void *)AXUILocalizedStringForKeyWithTable_Bundle;
    AXUILocalizedStringForKeyWithTable_Bundle = v6;

    long long v5 = (void *)AXUILocalizedStringForKeyWithTable_Bundle;
  }
  int v8 = [v5 localizedStringForKey:v3 value:v3 table:v4];

  return v8;
}

id AXUILocalizedTitleForZoomLensEffect(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F48268]])
  {
    uint64_t v2 = @"ZOOM_LENS_EFFECT_NONE";
LABEL_13:
    id v3 = AXUILocalizedStringForKeyWithTable(v2, @"AXUILocalizedStrings");
    goto LABEL_14;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48240]])
  {
    uint64_t v2 = @"ZOOM_LENS_EFFECT_BLACK_AND_WHITE";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48260]])
  {
    uint64_t v2 = @"ZOOM_LENS_EFFECT_LOW_LIGHT";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48248]])
  {
    uint64_t v2 = @"ZOOM_LENS_EFFECT_BLACK_AND_WHITE_INVERTED";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48258]])
  {
    uint64_t v2 = @"ZOOM_LENS_EFFECT_INVERTED";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48250]])
  {
    uint64_t v2 = @"ZOOM_LENS_EFFECT_HUE_ADJUST";
    goto LABEL_13;
  }
  _AXAssert();
  id v3 = 0;
LABEL_14:

  return v3;
}

id AXUILocalizedTitleForZoomLensMode(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F48270]])
  {
    uint64_t v2 = @"ZOOM_LENS_MODE_FULLSCREEN";
LABEL_7:
    id v3 = AXUILocalizedStringForKeyWithTable(v2, @"AXUILocalizedStrings");
    goto LABEL_8;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48278]])
  {
    uint64_t v2 = @"ZOOM_LENS_MODE_WINDOW";
    goto LABEL_7;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48280]])
  {
    uint64_t v2 = @"ZOOM_LENS_MODE_DOCKED";
    goto LABEL_7;
  }
  _AXAssert();
  id v3 = 0;
LABEL_8:

  return v3;
}

id AXUILocalizedTitleForDockPosition(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F48238]])
  {
    uint64_t v2 = @"DOCK_POSITION_TOP";
LABEL_9:
    id v3 = AXUILocalizedStringForKeyWithTable(v2, @"AXUILocalizedStrings");
    goto LABEL_10;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48228]])
  {
    uint64_t v2 = @"DOCK_POSITION_LEFT";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48230]])
  {
    uint64_t v2 = @"DOCK_POSITION_RIGHT";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F48220]])
  {
    uint64_t v2 = @"DOCK_POSITION_BOTTOM";
    goto LABEL_9;
  }
  _AXAssert();
  id v3 = 0;
LABEL_10:

  return v3;
}

id AXAssistiveTouchBundle()
{
  if (AXAssistiveTouchBundle_onceToken != -1) {
    dispatch_once(&AXAssistiveTouchBundle_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)AXAssistiveTouchBundle_ASTBundle;
  return v0;
}

void __AXAssistiveTouchBundle_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B50];
  AXSystemRootDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [v4 stringByAppendingPathComponent:@"System/Library/CoreServices/AssistiveTouch.app"];
  uint64_t v2 = [v0 bundleWithPath:v1];
  id v3 = (void *)AXAssistiveTouchBundle_ASTBundle;
  AXAssistiveTouchBundle_ASTBundle = v2;
}

id AXUIAssistiveTouchStringForName(void *a1, int a2)
{
  id v3 = a1;
  if (AXUIAssistiveTouchStringForName_onceToken != -1) {
    dispatch_once(&AXUIAssistiveTouchStringForName_onceToken, &__block_literal_global_337);
  }
  if ([v3 hasPrefix:@"CustomGesture-"])
  {
    uint64_t v4 = [v3 rangeOfString:@"CustomGesture-"];
    uint64_t v6 = [v3 substringFromIndex:v4 + v5];
    goto LABEL_46;
  }
  uint64_t v7 = *MEMORY[0x1E4F49040];
  if (![v3 hasPrefix:*MEMORY[0x1E4F49040]]
    || ([NSString stringWithFormat:@"%@-", v7],
        int v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v3 rangeOfString:v8],
        [v3 substringFromIndex:v9 + v10],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v11))
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F491C0]])
    {
      id v14 = _AXUISettingsAccessibilityBundle();
      uint64_t v6 = [v14 localizedStringForKey:@"FORCE_TOUCH" value:0 table:@"Accessibility"];

      goto LABEL_46;
    }
    if (a2)
    {
      uint64_t v15 = [(id)AXUIAssistiveTouchStringForName_ASTMapping objectForKeyedSubscript:v3];
      uint64_t v11 = [v15 stringByAppendingFormat:@"_FULL_WIDTH"];

      if (AXDeviceHasStaccato()
        && [v3 isEqualToString:*MEMORY[0x1E4F490A0]])
      {
        unsigned int v16 = AXAssistiveTouchBundle();
        long long v17 = v16;
        long long v18 = @"LocalizedStrings-Staccato";
      }
      else if (AXDeviceSupportsCameraButton() {
             && (([v3 isEqualToString:*MEMORY[0x1E4F490E0]] & 1) != 0
      }
              || ([v3 isEqualToString:*MEMORY[0x1E4F490F0]] & 1) != 0
              || [v3 isEqualToString:*MEMORY[0x1E4F490E8]])
             || AXDeviceSupportsCameraButton()
             && AXDeviceHasGreyMatterEnabled()
             && [v3 isEqualToString:*MEMORY[0x1E4F49370]])
      {
        unsigned int v16 = AXAssistiveTouchBundle();
        long long v17 = v16;
        long long v18 = @"LocalizedStrings-D94";
      }
      else
      {
        unsigned int v16 = AXAssistiveTouchBundle();
        long long v17 = v16;
        long long v18 = @"LocalizedStrings";
      }
      uint64_t v6 = [v16 localizedStringForKey:v11 value:v11 table:v18];

      if (v6 && ![v6 isEqualToString:v11]) {
        goto LABEL_45;
      }
    }
    uint64_t v11 = [(id)AXUIAssistiveTouchStringForName_ASTMapping objectForKeyedSubscript:v3];
    if (AXDeviceHasStaccato() && [v3 isEqualToString:*MEMORY[0x1E4F490A0]])
    {
      long long v19 = AXAssistiveTouchBundle();
      long long v20 = v19;
      char v21 = @"LocalizedStrings-Staccato";
    }
    else if (AXDeviceSupportsCameraButton() {
           && (([v3 isEqualToString:*MEMORY[0x1E4F490E0]] & 1) != 0
    }
            || ([v3 isEqualToString:*MEMORY[0x1E4F490F0]] & 1) != 0
            || [v3 isEqualToString:*MEMORY[0x1E4F490E8]])
           || AXDeviceSupportsCameraButton()
           && AXDeviceHasGreyMatterEnabled()
           && [v3 isEqualToString:*MEMORY[0x1E4F49370]])
    {
      long long v19 = AXAssistiveTouchBundle();
      long long v20 = v19;
      char v21 = @"LocalizedStrings-D94";
    }
    else
    {
      long long v19 = AXAssistiveTouchBundle();
      long long v20 = v19;
      char v21 = @"LocalizedStrings";
    }
    uint64_t v6 = [v19 localizedStringForKey:v11 value:v11 table:v21];

    if ([v11 isEqualToString:v6])
    {
      CGFloat v22 = [MEMORY[0x1E4F49458] sharedInstance];
      int v23 = [v22 laserEnabled];

      if (v23)
      {
        uint64_t v24 = AXAssistiveTouchBundle();
        uint64_t v25 = [v24 localizedStringForKey:v11 value:v11 table:@"LocalizedStrings-hello"];

        uint64_t v6 = (void *)v25;
      }
      if ([v11 isEqualToString:v6])
      {
        if (a2)
        {
          uint64_t v26 = [v11 stringByAppendingFormat:@"_FULL_WIDTH"];

          uint64_t v11 = (void *)v26;
        }
        uint64_t v27 = AXAssistiveTouchBundle();
        uint64_t v28 = [v27 localizedStringForKey:v11 value:v11 table:@"LocalizedStrings-DetectionMode"];

        uint64_t v6 = (void *)v28;
      }
    }
    goto LABEL_45;
  }
  uint64_t v12 = [MEMORY[0x1E4F49460] sharedManager];
  BOOL v13 = [v12 shortcutForIdentifier:v11];
  uint64_t v6 = [v13 shortcutName];

LABEL_45:
LABEL_46:

  return v6;
}

void __AXUIAssistiveTouchStringForName_block_invoke()
{
  v35[97] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F49250];
  v34[0] = *MEMORY[0x1E4F491E8];
  v34[1] = v0;
  v35[0] = @"HOME";
  v35[1] = @"NOTIFICATION_CENTER";
  uint64_t v1 = *MEMORY[0x1E4F49140];
  v34[2] = *MEMORY[0x1E4F49130];
  v34[3] = v1;
  v35[2] = @"CUSTOM";
  v35[3] = @"DEVICE";
  uint64_t v2 = *MEMORY[0x1E4F49368];
  v34[4] = *MEMORY[0x1E4F49300];
  v34[5] = v2;
  v35[4] = @"SIRI";
  v35[5] = @"TYPE_TO_SIRI";
  uint64_t v3 = *MEMORY[0x1E4F49208];
  v34[6] = *MEMORY[0x1E4F49128];
  v34[7] = v3;
  v35[6] = @"CONTROL_CENTER";
  v35[7] = @"LOCK";
  uint64_t v4 = *MEMORY[0x1E4F49390];
  v34[8] = *MEMORY[0x1E4F492A0];
  v34[9] = v4;
  v35[8] = @"ORIENTATION";
  v35[9] = @"VOLUME_UP_ASSISTIVE_TOUCH";
  uint64_t v5 = *MEMORY[0x1E4F49240];
  v34[10] = *MEMORY[0x1E4F49388];
  v34[11] = v5;
  v35[10] = @"VOLUME_DOWN_ASSISTIVE_TOUCH";
  v35[11] = @"MUTE";
  uint64_t v6 = *MEMORY[0x1E4F49360];
  v34[12] = *MEMORY[0x1E4F491D8];
  v34[13] = v6;
  v35[12] = @"GESTURES";
  v35[13] = @"TRIPLE_CLICK";
  uint64_t v7 = *MEMORY[0x1E4F490A8];
  v34[14] = *MEMORY[0x1E4F492F0];
  v34[15] = v7;
  v35[14] = @"SHAKE";
  v35[15] = @"APP_SWITCHER";
  uint64_t v8 = *MEMORY[0x1E4F49268];
  v34[16] = *MEMORY[0x1E4F492B0];
  v34[17] = v8;
  v35[16] = @"SCREENSHOT";
  v35[17] = @"ORIENTATION_LOCKED";
  uint64_t v9 = *MEMORY[0x1E4F49108];
  v34[18] = *MEMORY[0x1E4F49378];
  v34[19] = v9;
  v35[18] = @"VOICE_CONTROL";
  v35[19] = @"COMMAND_AND_CONTROL";
  uint64_t v10 = *MEMORY[0x1E4F49298];
  v34[20] = *MEMORY[0x1E4F49278];
  v34[21] = v10;
  v35[20] = @"PINCH";
  v35[21] = @"ROTATE";
  uint64_t v11 = *MEMORY[0x1E4F491C0];
  v34[22] = *MEMORY[0x1E4F49280];
  v34[23] = v11;
  v35[22] = @"PINCH_ROTATE";
  v35[23] = @"FORCE_TAP";
  uint64_t v12 = *MEMORY[0x1E4F49340];
  v34[24] = *MEMORY[0x1E4F49168];
  v34[25] = v12;
  v35[24] = @"TAP";
  v35[25] = @"TAP";
  uint64_t v13 = *MEMORY[0x1E4F49210];
  v34[26] = *MEMORY[0x1E4F49150];
  v34[27] = v13;
  v35[26] = @"DOUBLE_TAP";
  v35[27] = @"LONG_PRESS";
  uint64_t v14 = *MEMORY[0x1E4F49238];
  v34[28] = *MEMORY[0x1E4F49158];
  v34[29] = v14;
  v35[28] = @"HOLD_AND_DRAG";
  v35[29] = @"MOVE_MENU";
  uint64_t v15 = *MEMORY[0x1E4F492A8];
  v34[30] = *MEMORY[0x1E4F49328];
  v34[31] = v15;
  v35[30] = @"SPOTLIGHT";
  v35[31] = @"SOS";
  uint64_t v16 = *MEMORY[0x1E4F49288];
  v34[32] = *MEMORY[0x1E4F49338];
  v34[33] = v16;
  v35[32] = @"SYSDIAGNOSE";
  v35[33] = @"REACHABILITY";
  uint64_t v17 = *MEMORY[0x1E4F49348];
  v34[34] = *MEMORY[0x1E4F49290];
  v34[35] = v17;
  v35[34] = @"REBOOT_DEVICE";
  v35[35] = @"DOCK";
  uint64_t v18 = *MEMORY[0x1E4F491F0];
  v34[36] = *MEMORY[0x1E4F490B0];
  v34[37] = v18;
  v35[36] = @"APPLE_PAY";
  v35[37] = @"HOVERTEXT_TYPING";
  uint64_t v19 = *MEMORY[0x1E4F49110];
  v34[38] = *MEMORY[0x1E4F49358];
  v34[39] = v19;
  v35[38] = @"VIRTUAL_TRACKPAD";
  v35[39] = @"APPLE_PAY_CONFIRM";
  uint64_t v20 = *MEMORY[0x1E4F49260];
  v34[40] = *MEMORY[0x1E4F49320];
  v34[41] = v20;
  v35[40] = @"SPEAK_SCREEN";
  v35[41] = @"OPEN_MENU";
  uint64_t v21 = *MEMORY[0x1E4F49228];
  v34[42] = *MEMORY[0x1E4F49270];
  v34[43] = v21;
  v35[42] = @"PASS_THROUGH";
  v35[43] = @"MOUSE_PRIMARY_CLICK";
  uint64_t v22 = *MEMORY[0x1E4F492F8];
  v34[44] = *MEMORY[0x1E4F49230];
  v34[45] = v22;
  v35[44] = @"MOUSE_SECONDARY_CLICK";
  v35[45] = @"SIDE_APP";
  uint64_t v23 = *MEMORY[0x1E4F491A0];
  v34[46] = *MEMORY[0x1E4F49160];
  v34[47] = v23;
  v35[46] = @"DWELL";
  v35[47] = @"DWELL_RESUME";
  uint64_t v24 = *MEMORY[0x1E4F49198];
  v34[48] = *MEMORY[0x1E4F49190];
  v34[49] = v24;
  v35[48] = @"DWELL_PAUSE";
  v35[49] = @"DWELL_PAUSE_TOGGLE";
  uint64_t v25 = *MEMORY[0x1E4F491A8];
  v34[50] = *MEMORY[0x1E4F49180];
  v34[51] = v25;
  v35[50] = @"DWELL_LOCK";
  v35[51] = @"DWELL_UNLOCK";
  uint64_t v26 = *MEMORY[0x1E4F49178];
  v34[52] = *MEMORY[0x1E4F49188];
  v34[53] = v26;
  v35[52] = @"DWELL_LOCK_TOGGLE";
  v35[53] = @"DWELL_TIME_INCREASE";
  uint64_t v27 = *MEMORY[0x1E4F492B8];
  v34[54] = *MEMORY[0x1E4F49170];
  v34[55] = v27;
  v35[54] = @"DWELL_TIME_DECREASE";
  v35[55] = @"SCROLL";
  uint64_t v28 = *MEMORY[0x1E4F492C0];
  v34[56] = *MEMORY[0x1E4F492E8];
  v34[57] = v28;
  v35[56] = @"Scroll-Up";
  v35[57] = @"Scroll-Down";
  uint64_t v29 = *MEMORY[0x1E4F492D0];
  v34[58] = *MEMORY[0x1E4F492C8];
  v34[59] = v29;
  v35[58] = @"Scroll-Left";
  v35[59] = @"Scroll-Right";
  uint64_t v30 = *MEMORY[0x1E4F492D8];
  v34[60] = *MEMORY[0x1E4F492E0];
  v34[61] = v30;
  v35[60] = @"SCROLL_TO_TOP";
  v35[61] = @"SCROLL_TO_BOTTOM";
  uint64_t v31 = *MEMORY[0x1E4F49120];
  v34[62] = *MEMORY[0x1E4F49118];
  v34[63] = v31;
  v35[62] = @"SCROLL_CONTINUOUS_HORIZONTAL";
  v35[63] = @"SCROLL_CONTINUOUS_VERTICAL";
  v34[64] = *MEMORY[0x1E4F490D8];
  v35[64] = @"CAMERA";
  v34[65] = *MEMORY[0x1E4F491C8];
  v35[65] = @"CAMERA_FRONT";
  v34[66] = *MEMORY[0x1E4F49350];
  v35[66] = @"TORCH";
  v34[67] = *MEMORY[0x1E4F491B8];
  v35[67] = @"EYE_TRACKING_BUBBLE_MODE_TOGGLE";
  v34[68] = *MEMORY[0x1E4F491B0];
  v35[68] = @"EYE_TRACKING_AUTO_HIDE_TOGGLE";
  v34[69] = *MEMORY[0x1E4F490C0];
  v35[69] = @"ASSSISTIVETOUCH";
  v34[70] = *MEMORY[0x1E4F49380];
  v35[70] = @"VOICEOVER";
  v34[71] = *MEMORY[0x1E4F490F8];
  v35[71] = @"CLASSIC_INVERT";
  v34[72] = *MEMORY[0x1E4F49100];
  v35[72] = @"COLOR_FILTERS";
  v34[73] = *MEMORY[0x1E4F49318];
  v35[73] = @"SMART_INVERT";
  v34[74] = *MEMORY[0x1E4F493A0];
  v35[74] = @"ZOOM";
  v34[75] = *MEMORY[0x1E4F493A8];
  v35[75] = @"ZOOM_CONTROLLER";
  v34[76] = *MEMORY[0x1E4F49218];
  v35[76] = @"MAGNIFIER";
  v34[77] = *MEMORY[0x1E4F49330];
  v35[77] = @"SWITCH_CONTROL";
  v34[78] = *MEMORY[0x1E4F49138];
  v35[78] = @"DETECTION_MODE";
  v34[79] = *MEMORY[0x1E4F490C8];
  v35[79] = @"BACKGROUND_SOUNDS";
  v34[80] = *MEMORY[0x1E4F49248];
  v35[80] = @"NEARBY_DEVICE_CONTROL";
  v34[81] = *MEMORY[0x1E4F49398];
  v35[81] = @"REMOTE_SCREEN";
  v34[82] = *MEMORY[0x1E4F491E0];
  v35[82] = @"HAPTIC_MUSIC";
  v34[83] = *MEMORY[0x1E4F49220];
  v35[83] = @"MOTION_CUES";
  v34[84] = *MEMORY[0x1E4F491F8];
  v35[84] = @"LIVE_TRANSCRIPTIONS";
  v34[85] = *MEMORY[0x1E4F49200];
  v35[85] = @"LIVE_SPEECH";
  v34[86] = *MEMORY[0x1E4F491D0];
  v35[86] = @"FULL_KEYBOARD_ACCESS";
  v34[87] = *MEMORY[0x1E4F49310];
  v35[87] = @"SIRI_SHORTCUTS";
  v34[88] = *MEMORY[0x1E4F49148];
  v35[88] = @"DIM_FLASHING_LIGHTS";
  v34[89] = *MEMORY[0x1E4F490A0];
  v35[89] = @"ACTION_BUTTON";
  v34[90] = *MEMORY[0x1E4F490E0];
  v35[90] = @"CAMERA_BUTTON";
  v34[91] = *MEMORY[0x1E4F490F0];
  v35[91] = @"CAMERA_BUTTON_LIGHT_PRESS";
  v34[92] = *MEMORY[0x1E4F490E8];
  v35[92] = @"CAMERA_BUTTON_DOUBLE_LIGHT_PRESS";
  v34[93] = *MEMORY[0x1E4F49370];
  v35[93] = @"CAMERA_BUTTON_VISUAL_INTELLIGENCE";
  v34[94] = *MEMORY[0x1E4F490D0];
  v35[94] = @"CALIBRATE_ON_DEVICE_EYE_TRACKING";
  v34[95] = *MEMORY[0x1E4F49258];
  v35[95] = @"ZOOM_SCREEN_ON_DEVICE_EYE_TRACKING";
  v34[96] = *MEMORY[0x1E4F490B8];
  v35[96] = @"ASSISTIVE_ACCESS";
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:97];
  uint64_t v33 = (void *)AXUIAssistiveTouchStringForName_ASTMapping;
  AXUIAssistiveTouchStringForName_ASTMapping = v32;
}

id AXUIAssistiveTouchDeviceImageNameForImageName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = NSString;
  if (AXDeviceHasJindo())
  {
    uint64_t v3 = @"_DI";
  }
  else if (AXDeviceHasHomeButton())
  {
    uint64_t v3 = &stru_1F1F0EB90;
  }
  else
  {
    int IsPad = AXDeviceIsPad();
    uint64_t v3 = @"_NHB";
    if (IsPad) {
      uint64_t v3 = @"_NHB_IPAD";
    }
  }
  uint64_t v5 = [v2 stringWithFormat:@"%@%@", v1, v3];

  return v5;
}

uint64_t AXUIAssistiveTouchIconRequiresRTLFlipping(void *a1)
{
  uint64_t v1 = AXUIAssistiveTouchIconRequiresRTLFlipping_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AXUIAssistiveTouchIconRequiresRTLFlipping_onceToken, &__block_literal_global_676);
  }
  uint64_t v3 = [(id)AXUIAssistiveTouchIconRequiresRTLFlipping_ImageNamesToFlip containsObject:v2];

  return v3;
}

void __AXUIAssistiveTouchIconRequiresRTLFlipping_block_invoke()
{
  v7[22] = *MEMORY[0x1E4F143B8];
  v7[0] = @"BackArrow";
  uint64_t v0 = AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E4F49250]);
  v7[1] = v0;
  uint64_t v1 = AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E4F49128]);
  v7[2] = v1;
  id v2 = AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E4F49348]);
  v7[3] = v2;
  v7[4] = @"AT_LaunchFloatFromDock";
  v7[5] = @"AT_pinned_narrow";
  v7[6] = @"AT_pinned_narrow_for_flipping";
  v7[7] = @"AT_promote_sideapp_half";
  v7[8] = @"AT_dismiss_pinned_half";
  v7[9] = @"AT_PinFloatAppLeft";
  v7[10] = @"AT_PinFloatAppRight";
  v7[11] = @"AT_UnpinAppLeft";
  v7[12] = @"AT_UnpinAppRight";
  v7[13] = @"AT_SlideOpenFloatApp";
  v7[14] = @"AT_dismiss_overlay";
  v7[15] = @"AT_MoveFloatAppLeft";
  v7[16] = @"AT_MoveFloatAppRight";
  v7[17] = @"AT_Multitask";
  uint64_t v3 = AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E4F49388]);
  v7[18] = v3;
  uint64_t v4 = AXUIAssistiveTouchImageNameForName((void *)*MEMORY[0x1E4F49390]);
  v7[19] = v4;
  v7[20] = @"SCATIcon_device_volumeDown";
  v7[21] = @"SCATIcon_device_volumeUp";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:22];
  uint64_t v6 = (void *)AXUIAssistiveTouchIconRequiresRTLFlipping_ImageNamesToFlip;
  AXUIAssistiveTouchIconRequiresRTLFlipping_ImageNamesToFlip = v5;
}

id AXUIAssistiveTouchImageNameForName(void *a1)
{
  id v1 = a1;
  if (AXUIAssistiveTouchImageNameForName_onceToken[0] != -1) {
    dispatch_once(AXUIAssistiveTouchImageNameForName_onceToken, &__block_literal_global_730);
  }
  id v2 = [(id)AXUIAssistiveTouchImageNameForName_ASTMapping objectForKeyedSubscript:v1];
  if ([v1 hasPrefix:@"CustomGesture-"])
  {
    uint64_t v3 = [(id)AXUIAssistiveTouchImageNameForName_ASTMapping objectForKeyedSubscript:*MEMORY[0x1E4F49130]];

    id v2 = (void *)v3;
  }
  if ([v1 hasPrefix:*MEMORY[0x1E4F49040]])
  {
    uint64_t v4 = [(id)AXUIAssistiveTouchImageNameForName_ASTMapping objectForKeyedSubscript:*MEMORY[0x1E4F49308]];

    id v2 = (void *)v4;
  }

  return v2;
}

void __AXUIAssistiveTouchImageNameForName_block_invoke()
{
  v74[80] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F49250];
  v73[0] = *MEMORY[0x1E4F491E8];
  v73[1] = v0;
  v74[0] = @"IconHome";
  v74[1] = @"IconNotificationCenter";
  uint64_t v1 = *MEMORY[0x1E4F49308];
  v73[2] = *MEMORY[0x1E4F49130];
  v73[3] = v1;
  v74[2] = @"IconFavorites";
  v74[3] = @"SCATIcon_siri_shortcuts";
  v73[4] = *MEMORY[0x1E4F49140];
  v72 = AXUIAssistiveTouchDeviceImageNameForImageName(@"IconDevice");
  uint64_t v2 = *MEMORY[0x1E4F49300];
  v74[4] = v72;
  v74[5] = @"IconSiri";
  uint64_t v3 = *MEMORY[0x1E4F49368];
  v73[5] = v2;
  v73[6] = v3;
  uint64_t v4 = *MEMORY[0x1E4F49128];
  v74[6] = @"siri";
  v74[7] = @"IconControlCenter";
  uint64_t v5 = *MEMORY[0x1E4F49208];
  v73[7] = v4;
  v73[8] = v5;
  uint64_t v6 = *MEMORY[0x1E4F492A0];
  v74[8] = @"IconLock";
  v74[9] = @"IconRotate";
  uint64_t v7 = *MEMORY[0x1E4F49390];
  v73[9] = v6;
  v73[10] = v7;
  uint64_t v8 = *MEMORY[0x1E4F49388];
  v74[10] = @"IconVolumeUp";
  v74[11] = @"IconVolumeDown";
  uint64_t v9 = *MEMORY[0x1E4F49240];
  v73[11] = v8;
  v73[12] = v9;
  uint64_t v10 = *MEMORY[0x1E4F49360];
  v74[12] = @"IconMuted";
  v74[13] = @"IconTripleClick";
  uint64_t v11 = *MEMORY[0x1E4F491D8];
  v73[13] = v10;
  v73[14] = v11;
  v74[14] = @"IconGestures";
  v73[15] = *MEMORY[0x1E4F492F0];
  uint64_t v71 = AXUIAssistiveTouchDeviceImageNameForImageName(@"IconShake");
  v74[15] = v71;
  v73[16] = *MEMORY[0x1E4F490A8];
  uint64_t v70 = AXUIAssistiveTouchDeviceImageNameForImageName(@"IconAppSwitcher");
  v74[16] = v70;
  v73[17] = *MEMORY[0x1E4F492B0];
  uint64_t v69 = AXUIAssistiveTouchDeviceImageNameForImageName(@"IconScreenshot");
  uint64_t v12 = *MEMORY[0x1E4F49268];
  v74[17] = v69;
  v74[18] = @"IconRotationLock";
  uint64_t v13 = *MEMORY[0x1E4F49378];
  v73[18] = v12;
  v73[19] = v13;
  uint64_t v14 = *MEMORY[0x1E4F49108];
  v74[19] = @"IconVoiceControl";
  v74[20] = @"IconCommandAndControl";
  uint64_t v15 = *MEMORY[0x1E4F49278];
  v73[20] = v14;
  v73[21] = v15;
  uint64_t v16 = *MEMORY[0x1E4F49298];
  v74[21] = @"IconPinch";
  v74[22] = @"SCATIcon_gestures_rotateClockwise";
  uint64_t v17 = *MEMORY[0x1E4F49280];
  v73[22] = v16;
  v73[23] = v17;
  uint64_t v18 = *MEMORY[0x1E4F491C0];
  v74[23] = @"IconPinch";
  v74[24] = @"IconOrb";
  uint64_t v19 = *MEMORY[0x1E4F49168];
  v73[24] = v18;
  v73[25] = v19;
  uint64_t v20 = *MEMORY[0x1E4F49150];
  v74[25] = @"SCATIcon_gestures_tap";
  v74[26] = @"IconDoubleTap";
  uint64_t v21 = *MEMORY[0x1E4F49210];
  v73[26] = v20;
  v73[27] = v21;
  uint64_t v22 = *MEMORY[0x1E4F49158];
  v74[27] = @"IconOrb";
  v74[28] = @"SCATIcon_gestures_holdAndDrag";
  uint64_t v23 = *MEMORY[0x1E4F49238];
  v73[28] = v22;
  v73[29] = v23;
  uint64_t v24 = *MEMORY[0x1E4F49328];
  v74[29] = @"SCATIcon_gestures_holdAndDrag";
  v74[30] = @"SCATIcon_device_spotlightSearch";
  uint64_t v25 = *MEMORY[0x1E4F492A8];
  v73[30] = v24;
  v73[31] = v25;
  uint64_t v26 = *MEMORY[0x1E4F49338];
  v74[31] = @"IconSOS";
  v74[32] = @"IconDiagnostics";
  uint64_t v27 = *MEMORY[0x1E4F49288];
  v73[32] = v26;
  v73[33] = v27;
  v68 = AXUIAssistiveTouchDeviceImageNameForImageName(@"IconReachability");
  uint64_t v28 = *MEMORY[0x1E4F49290];
  v74[33] = v68;
  v74[34] = @"IconRebootDevice";
  uint64_t v29 = *MEMORY[0x1E4F49348];
  v73[34] = v28;
  v73[35] = v29;
  uint64_t v67 = AXUIAssistiveTouchDeviceImageNameForImageName(@"IconDock");
  uint64_t v30 = *MEMORY[0x1E4F490B0];
  v74[35] = v67;
  v74[36] = @"IconApplePay";
  uint64_t v31 = *MEMORY[0x1E4F491F0];
  v73[36] = v30;
  v73[37] = v31;
  v66 = [NSString stringWithFormat:@"%@keyboard", @"system-image-"];
  v74[37] = v66;
  v73[38] = *MEMORY[0x1E4F49358];
  v65 = [NSString stringWithFormat:@"%@rectangle.and.hand.point.up.left.filled", @"system-image-"];
  uint64_t v32 = *MEMORY[0x1E4F49110];
  v74[38] = v65;
  v74[39] = @"SCATIcon_device_faceID";
  uint64_t v33 = *MEMORY[0x1E4F49320];
  v73[39] = v32;
  v73[40] = v33;
  v74[40] = @"IconSpeakScreen";
  v73[41] = *MEMORY[0x1E4F492F8];
  os_log_type_t v64 = AXUIAssistiveTouchDeviceImageNameForImageName(@"AT_Multitask");
  uint64_t v34 = *MEMORY[0x1E4F49160];
  v74[41] = v64;
  v74[42] = @"IconDwell";
  uint64_t v35 = *MEMORY[0x1E4F491A0];
  v73[42] = v34;
  v73[43] = v35;
  uint64_t v36 = *MEMORY[0x1E4F49190];
  v74[43] = @"SCATIcon_mediacontrols_play";
  v74[44] = @"IconDwellPause";
  uint64_t v37 = *MEMORY[0x1E4F49198];
  v73[44] = v36;
  v73[45] = v37;
  uint64_t v38 = *MEMORY[0x1E4F49180];
  v74[45] = @"IconDwellPause";
  v74[46] = @"IconDwellFallbackDisable";
  uint64_t v39 = *MEMORY[0x1E4F491A8];
  v73[46] = v38;
  v73[47] = v39;
  uint64_t v40 = *MEMORY[0x1E4F49188];
  v74[47] = @"IconDwellFallbackEnable";
  v74[48] = @"IconDwellFallbackEnable";
  uint64_t v41 = *MEMORY[0x1E4F49178];
  v73[48] = v40;
  v73[49] = v41;
  uint64_t v42 = *MEMORY[0x1E4F49170];
  v74[49] = @"SCATIcon_settings_increaseScanSpeed";
  v74[50] = @"SCATIcon_settings_decreaseScanSpeed";
  uint64_t v43 = *MEMORY[0x1E4F492B8];
  v73[50] = v42;
  v73[51] = v43;
  uint64_t v44 = *MEMORY[0x1E4F492E8];
  v74[51] = @"SCATIcon_action_scroll";
  v74[52] = @"SCATIcon_action_scrollUp";
  uint64_t v45 = *MEMORY[0x1E4F492C0];
  v73[52] = v44;
  v73[53] = v45;
  uint64_t v46 = *MEMORY[0x1E4F492C8];
  v74[53] = @"SCATIcon_action_scrollDown";
  v74[54] = @"SCATIcon_action_scrollLeft";
  uint64_t v47 = *MEMORY[0x1E4F492D0];
  v73[54] = v46;
  v73[55] = v47;
  uint64_t v48 = *MEMORY[0x1E4F492E0];
  v74[55] = @"SCATIcon_action_scrollRight";
  v74[56] = @"SCATIcon_action_scrollToTop";
  uint64_t v49 = *MEMORY[0x1E4F492D8];
  v73[56] = v48;
  v73[57] = v49;
  v74[57] = @"SCATIcon_action_scrollToBottom";
  v74[58] = @"SCATIcon_action_continuousScrollHorizontal";
  uint64_t v50 = *MEMORY[0x1E4F49120];
  v73[58] = *MEMORY[0x1E4F49118];
  v73[59] = v50;
  v74[59] = @"SCATIcon_action_continuousScrollVertical";
  v73[60] = *MEMORY[0x1E4F49138];
  v63 = [NSString stringWithFormat:@"%@viewfinder", @"system-image-"];
  v74[60] = v63;
  v73[61] = *MEMORY[0x1E4F49398];
  v62 = [NSString stringWithFormat:@"%@rectangle.on.rectangle", @"system-image-"];
  v74[61] = v62;
  v73[62] = *MEMORY[0x1E4F490C8];
  id v51 = [NSString stringWithFormat:@"%@ear.and.waveform", @"system-image-"];
  v74[62] = v51;
  v73[63] = *MEMORY[0x1E4F49248];
  v52 = [NSString stringWithFormat:@"%@wave.3.forward", @"system-image-"];
  v74[63] = v52;
  v73[64] = *MEMORY[0x1E4F491F8];
  v53 = [NSString stringWithFormat:@"%@waveform", @"system-image-"];
  v74[64] = v53;
  v73[65] = *MEMORY[0x1E4F49200];
  char v54 = [NSString stringWithFormat:@"%@keyboard.badge.waveform", @"internal-system-image-"];
  v74[65] = v54;
  v73[66] = *MEMORY[0x1E4F49148];
  v55 = [NSString stringWithFormat:@"%@sun.lefthalf.filled", @"system-image-"];
  v74[66] = v55;
  v73[67] = *MEMORY[0x1E4F490D8];
  v56 = [NSString stringWithFormat:@"%@camera.fill", @"system-image-"];
  v74[67] = v56;
  v73[68] = *MEMORY[0x1E4F491C8];
  os_log_type_t v57 = [NSString stringWithFormat:@"%@person.crop.square.badge.camera.fill", @"system-image-"];
  v74[68] = v57;
  v73[69] = *MEMORY[0x1E4F49310];
  v74[69] = @"SCATIcon_siri_shortcuts";
  v73[70] = *MEMORY[0x1E4F490A0];
  v74[70] = @"iphone.action.button.arrow.right";
  v73[71] = *MEMORY[0x1E4F490E0];
  v74[71] = @"SCATIcon_device_cameraButton";
  v73[72] = *MEMORY[0x1E4F490F0];
  v74[72] = @"SCATIcon_device_cameraButton";
  v73[73] = *MEMORY[0x1E4F490E8];
  v74[73] = @"SCATIcon_device_cameraButton";
  v73[74] = *MEMORY[0x1E4F49370];
  id v58 = [NSString stringWithFormat:@"%@apple.intelligence", @"system-image-"];
  v74[74] = v58;
  v73[75] = *MEMORY[0x1E4F490D0];
  v74[75] = @"dot.scope";
  v73[76] = *MEMORY[0x1E4F49258];
  v74[76] = @"square.arrowtriangle.4.outward";
  v73[77] = *MEMORY[0x1E4F491E0];
  id v59 = [NSString stringWithFormat:@"%@apple.haptics.and.music.note", @"system-image-"];
  v74[77] = v59;
  v73[78] = *MEMORY[0x1E4F49220];
  v74[78] = @"IconMotionCues";
  v73[79] = *MEMORY[0x1E4F490B8];
  v74[79] = @"IconAssistiveAccess";
  uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:80];
  char v61 = (void *)AXUIAssistiveTouchImageNameForName_ASTMapping;
  AXUIAssistiveTouchImageNameForName_ASTMapping = v60;
}

id AXUIAssistiveTouchImageForName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AXUIAssistiveTouchImageNameForName(v1);
  if (v2
    && AXDeviceIsPhone()
    && ([MEMORY[0x1E4FB1BA8] mainScreen],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _referenceBounds],
        double v5 = v4,
        v3,
        v5 > 480.0))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v7 = [v2 stringByAppendingString:@"-tall"];
    uint64_t v8 = AXAssistiveTouchBundle();
    id v9 = [v6 _deviceSpecificImageNamed:v7 inBundle:v8];
  }
  else
  {
    id v9 = 0;
  }
  if (([v2 hasPrefix:@"system-image-"] & 1) != 0
    || [v1 hasPrefix:@"system-image-"])
  {
    if (v2) {
      uint64_t v10 = v2;
    }
    else {
      uint64_t v10 = v1;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v12 = [v10 stringByReplacingOccurrencesOfString:@"system-image-" withString:&stru_1F1F0EB90];
    uint64_t v13 = [MEMORY[0x1E4FB1830] configurationWithPointSize:30.0];
    uint64_t v14 = [v11 systemImageNamed:v12 withConfiguration:v13];

    id v9 = (id)v14;
  }
  if (([v2 hasPrefix:@"internal-system-image-"] & 1) != 0
    || [v1 hasPrefix:@"internal-system-image-"])
  {
    if (v2) {
      uint64_t v15 = v2;
    }
    else {
      uint64_t v15 = v1;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v17 = [v15 stringByReplacingOccurrencesOfString:@"internal-system-image-" withString:&stru_1F1F0EB90];
    uint64_t v18 = [MEMORY[0x1E4FB1830] configurationWithPointSize:30.0];
    uint64_t v19 = [v16 _systemImageNamed:v17 withConfiguration:v18];

    id v9 = (id)v19;
  }
  if (!v9)
  {
    int v20 = AXUIAssistiveTouchRequiresSystemImageForName(v1);
    uint64_t v21 = (void *)MEMORY[0x1E4FB1818];
    if (v20)
    {
      uint64_t v22 = [MEMORY[0x1E4FB1818] _systemImageNamed:v2];
    }
    else
    {
      uint64_t v23 = AXAssistiveTouchBundle();
      uint64_t v22 = [v21 _deviceSpecificImageNamed:v2 inBundle:v23];
    }
    uint64_t v24 = objc_msgSend(v22, "imageByPreparingThumbnailOfSize:", 60.0, 60.0);
    uint64_t v25 = v24;
    if (v24)
    {
      id v9 = v24;
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4FB1830] configurationWithPointSize:30.0];
      id v9 = [v22 imageByApplyingSymbolConfiguration:v26];

      uint64_t v22 = (void *)v26;
    }
  }
  return v9;
}

uint64_t AXUIAssistiveTouchRequiresSystemImageForName(void *a1)
{
  id v1 = a1;
  if (AXDeviceHasStaccato()) {
    int v2 = [v1 isEqualToString:*MEMORY[0x1E4F490A0]];
  }
  else {
    int v2 = 0;
  }
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    if ([v1 isEqualToString:*MEMORY[0x1E4F49258]]) {
      int v2 = 1;
    }
    else {
      v2 |= [v1 isEqualToString:*MEMORY[0x1E4F490D0]];
    }
  }
  uint64_t v3 = [v1 isEqualToString:*MEMORY[0x1E4F49368]] | v2;

  return v3;
}

BOOL AXPreferredContentSizeCategoryIsAccessibilityCategory()
{
  uint64_t v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v1 = [v0 preferredContentSizeCategory];

  BOOL v2 = ([v1 isEqualToString:*MEMORY[0x1E4FB2798]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4FB2790]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4FB2788]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4FB2780]] & 1) != 0
    || [v1 isEqualToString:*MEMORY[0x1E4FB2778]];

  return v2;
}

uint64_t AXUISettingsSpeakingRateSlowImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"tortoise.fill"];
}

uint64_t AXUISettingsSpeakingRateFastImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"hare.fill"];
}

uint64_t AXUIZoomControllerColor(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      id v1 = [MEMORY[0x1E4FB1618] systemBlueColor];
      break;
    case 3:
      id v1 = [MEMORY[0x1E4FB1618] systemRedColor];
      break;
    case 4:
      id v1 = [MEMORY[0x1E4FB1618] systemGreenColor];
      break;
    case 5:
      id v1 = [MEMORY[0x1E4FB1618] systemYellowColor];
      break;
    case 6:
      id v1 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      break;
    default:
      id v1 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      break;
  }
  id v2 = v1;
  uint64_t v3 = [v2 CGColor];

  return v3;
}

double AXUIRectForZoomFocusChangeNotification(void *a1)
{
  id v1 = a1;
  id v2 = [v1 userInfo];
  uint64_t v3 = [v2 objectForKey:@"frame"];
  NSRect v17 = NSRectFromString(v3);
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;

  uint64_t v8 = [v1 userInfo];

  id v9 = [v8 objectForKey:@"window"];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F49458] sharedInstance];
    int v11 = [v10 zoomShouldFollowFocus];

    if (v11)
    {
      objc_msgSend(v9, "convertRect:toWindow:", 0, x, y, width, height);
      double x = AXUIConvertRectFromScreenToContextSpace(v9, v12, v13, v14, v15);
    }
  }

  return x;
}

uint64_t AXSpeakerMaxImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"speaker.wave.2"];
}

uint64_t AXSpeakerMuteImage()
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"speaker"];
}

id AXAppNameForBundleId(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F482D0]])
  {
    id v2 = @"HOME_SCREEN";
LABEL_7:
    uint64_t v3 = AXUILocalizedStringForKeyWithTable(v2, @"AXUILocalizedStrings");
    goto LABEL_8;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F482B8]])
  {
    id v2 = @"LIVE_TRANSCRIPTION_TITLE";
    goto LABEL_7;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F482C0]])
  {
    id v2 = @"WALLET_TITLE";
    goto LABEL_7;
  }
  id v8 = 0;
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:&v8];
  id v6 = v8;
  if (v6)
  {
    uint64_t v7 = AXLogSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      AXAppNameForBundleId_cold_1(v6, v7);
    }
  }
  uint64_t v3 = [v5 localizedName];

LABEL_8:
  return v3;
}

float AXTextSizePercentage(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v2 = *MEMORY[0x1E4FB27D0];
  id v3 = a1;
  double v4 = [v1 traitCollectionWithPreferredContentSizeCategory:v2];
  double v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v3];

  uint64_t v6 = *MEMORY[0x1E4FB28C8];
  uint64_t v7 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v4];
  id v8 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v6 compatibleWithTraitCollection:v5];
  [v8 pointSize];
  double v10 = v9;
  [v7 pointSize];
  double v12 = v10 / v11 * 100.0;
  uint64_t v13 = (5 * ((int)v12 / 5));
  double v14 = AXLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    double v15 = NSNumber;
    [v8 pointSize];
    uint64_t v16 = objc_msgSend(v15, "numberWithDouble:");
    NSRect v17 = NSNumber;
    [v7 pointSize];
    uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
    uint64_t v19 = [NSNumber numberWithDouble:v12];
    int v20 = [NSNumber numberWithInt:v13];
    int v22 = 138413058;
    uint64_t v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v18;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    uint64_t v29 = v20;
    _os_log_impl(&dword_1C39D1000, v14, OS_LOG_TYPE_INFO, "Text size: %@/%@=%@ => %@", (uint8_t *)&v22, 0x2Au);
  }
  return (float)(int)v13 / 100.0;
}

void type metadata accessor for CVBuffer()
{
  if (!qword_1EA383090)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA383090);
    }
  }
}

void sub_1C3A25AB0()
{
  uint64_t v1 = &selRef_capInsets;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F16498]), sel_init);
  uint64_t v3 = OBJC_IVAR___AXCameraManager_session;
  double v4 = *(void **)&v0[OBJC_IVAR___AXCameraManager_session];
  *(void *)&v0[OBJC_IVAR___AXCameraManager_session] = v2;

  objc_msgSend(*(id *)&v0[v3], sel_beginConfiguration);
  double v5 = *(void **)&v0[v3];
  if (v5) {
    objc_msgSend(v5, sel_setSessionPreset_, *MEMORY[0x1E4F159C0]);
  }
  uint64_t v6 = (id)AXLogCommon();
  if (!v6) {
    __break(1u);
  }
  uint64_t v7 = v6;
  id v8 = v0;
  os_log_type_t v9 = sub_1C3A28E48();
  if (os_log_type_enabled(v7, v9))
  {
    double v10 = (uint8_t *)swift_slowAlloc();
    double v11 = (void *)swift_slowAlloc();
    *(_DWORD *)double v10 = 138412290;
    double v12 = *(void **)&v0[v3];
    if (v12)
    {
      id v13 = v12;
      uint64_t v1 = &selRef_capInsets;
    }
    sub_1C3A28E98();
    *double v11 = v12;

    _os_log_impl(&dword_1C39D1000, v7, v9, "Initialize camera capture session %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA383150);
    swift_arrayDestroy();
    MEMORY[0x1C87795D0](v11, -1, -1);
    MEMORY[0x1C87795D0](v10, -1, -1);
  }
  else
  {
  }
  double v14 = *(void **)&v0[v3];
  if (v14)
  {
    double v15 = self;
    id v16 = v14;
    id v17 = objc_msgSend(v15, sel_systemPreferredCamera);
    uint64_t v18 = sub_1C3A26974(v17, v16);

    id v19 = [objc_allocWithZone(MEMORY[0x1E4F164C0]) v1[378]];
    objc_msgSend(v19, sel_setSampleBufferDelegate_queue_, v8, *(void *)&v8[OBJC_IVAR___AXCameraManager_queue]);
    if (objc_msgSend(v16, sel_canAddOutput_, v19)) {
      objc_msgSend(v16, sel_addOutput_, v19);
    }
    objc_msgSend(v16, sel_commitConfiguration);
    objc_msgSend(v16, sel_startRunning);
  }
}

uint64_t sub_1C3A25D8C()
{
  uint64_t v1 = sub_1C3A28DF8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  double v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C3A28E18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  id v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(void *)&v0[OBJC_IVAR___AXCameraManager_queue];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_1C3A26EAC;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C3A26170;
  aBlock[3] = &block_descriptor;
  double v10 = _Block_copy(aBlock);
  double v11 = v0;
  sub_1C3A28E08();
  v13[1] = MEMORY[0x1E4FBC860];
  sub_1C3A26ECC(&qword_1EA383158, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA383160);
  sub_1C3A26F14(&qword_1EA383168, &qword_1EA383160);
  sub_1C3A28EA8();
  MEMORY[0x1C87783F0](0, v8, v4, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_1C3A26038(unsigned char *a1)
{
  if ((a1[OBJC_IVAR___AXCameraManager_shouldPublish] & 1) == 0)
  {
    a1[OBJC_IVAR___AXCameraManager_shouldPublish] = 1;
    sub_1C3A25AB0();
    os_log_type_t v2 = sub_1C3A28E28();
    uint64_t v3 = (id)AXLogCommon();
    if (v3)
    {
      log = v3;
      if (os_log_type_enabled(v3, v2))
      {
        double v4 = a1;
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 67109120;
        sub_1C3A28E98();

        _os_log_impl(&dword_1C39D1000, log, v2, "Roya: Started capture %{BOOL}d", v5, 8u);
        MEMORY[0x1C87795D0](v5, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_1C3A26170(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1C3A261B4()
{
  if (v0[OBJC_IVAR___AXCameraManager_shouldPublish] == 1)
  {
    v0[OBJC_IVAR___AXCameraManager_shouldPublish] = 0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR___AXCameraManager_session], sel_stopRunning);
    os_log_type_t v1 = sub_1C3A28E28();
    uint64_t v2 = (id)AXLogCommon();
    if (v2)
    {
      log = v2;
      if (os_log_type_enabled(v2, v1))
      {
        uint64_t v3 = v0;
        double v4 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)double v4 = 67109120;
        sub_1C3A28E98();

        _os_log_impl(&dword_1C39D1000, log, v1, "Roya: Stopped capture %{BOOL}d", v4, 8u);
        MEMORY[0x1C87795D0](v4, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      __break(1u);
    }
  }
}

id AccessibilityCameraManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AccessibilityCameraManager.init()()
{
  uint64_t v10 = sub_1C3A28E68();
  uint64_t v1 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3A28E58();
  MEMORY[0x1F4188790]();
  sub_1C3A28E18();
  MEMORY[0x1F4188790]();
  uint64_t v9 = OBJC_IVAR___AXCameraManager_queue;
  v8[1] = sub_1C3A265DC();
  double v4 = v0;
  sub_1C3A28E08();
  uint64_t v12 = MEMORY[0x1E4FBC860];
  sub_1C3A26ECC(&qword_1EA3830B0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3830B8);
  sub_1C3A26F14(&qword_1EA3830C0, &qword_1EA3830B8);
  sub_1C3A28EA8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v10);
  *(void *)(v8[2] + v9) = sub_1C3A28E88();
  v4[OBJC_IVAR___AXCameraManager_shouldPublish] = 0;
  v4[OBJC_IVAR___AXCameraManager_isInitialized] = 0;
  uint64_t v5 = &v4[OBJC_IVAR___AXCameraManager_frameHandler];
  void *v5 = 0;
  v5[1] = 0;
  *(void *)&v4[OBJC_IVAR___AXCameraManager_session] = 0;

  uint64_t v6 = (objc_class *)type metadata accessor for AccessibilityCameraManager();
  v11.receiver = v4;
  v11.super_class = v6;
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t sub_1C3A265DC()
{
  unint64_t result = qword_1EA3830A8;
  if (!qword_1EA3830A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA3830A8);
  }
  return result;
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

uint64_t type metadata accessor for AccessibilityCameraManager()
{
  return self;
}

uint64_t sub_1C3A266F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR___AXCameraManager_frameHandler);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___AXCameraManager_frameHandler);
  void *v3 = a1;
  v3[1] = a2;
  swift_retain();
  sub_1C3A2674C(v4);
  return sub_1C3A25D8C();
}

uint64_t sub_1C3A2674C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

id AccessibilityCameraManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessibilityCameraManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C3A268A0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccessibilityCameraManager();
  uint64_t result = sub_1C3A28DE8();
  *a1 = result;
  return result;
}

Swift::Void __swiftcall AccessibilityCameraManager.captureOutput(_:didOutput:from:)(AVCaptureOutput _, CMSampleBufferRef didOutput, AVCaptureConnection from)
{
}

NSObject *sub_1C3A26974(void *a1, void *a2)
{
  v20[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = objc_allocWithZone(MEMORY[0x1E4F16450]);
  v20[0] = 0;
  uint64_t v5 = a1;
  id v6 = objc_msgSend(v4, sel_initWithDevice_error_, v5, v20);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = v20[0];
    uint64_t v9 = v7;
    if (objc_msgSend(a2, sel_canAddInput_, v9))
    {
      objc_msgSend(a2, sel_addInput_, v9);

LABEL_12:
      return v7;
    }

LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  id v10 = v20[0];
  objc_super v11 = (void *)sub_1C3A28DC8();

  swift_willThrow();
  uint64_t result = (id)AXLogCommon();
  if (result)
  {
    uint64_t v9 = result;
    id v13 = v11;
    id v14 = v11;
    os_log_type_t v15 = sub_1C3A28E48();
    if (!os_log_type_enabled(v9, v15))
    {

      uint64_t v7 = 0;
      uint64_t v9 = v5;
      goto LABEL_12;
    }
    id v16 = (uint8_t *)swift_slowAlloc();
    id v17 = (void *)swift_slowAlloc();
    *(_DWORD *)id v16 = 138412290;
    id v18 = v11;
    id v19 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v20[0] = v19;
    sub_1C3A28E98();
    *id v17 = v19;

    _os_log_impl(&dword_1C39D1000, v9, v15, "Couldn't get input device: %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA383150);
    swift_arrayDestroy();
    MEMORY[0x1C87795D0](v17, -1, -1);
    MEMORY[0x1C87795D0](v16, -1, -1);

    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1C3A26C00(opaqueCMSampleBuffer *a1)
{
  uint64_t v3 = (id)AXLogCommon();
  if (!v3)
  {
    __break(1u);
    goto LABEL_15;
  }
  id v4 = v3;
  uint64_t v5 = v1;
  os_log_type_t v6 = sub_1C3A28E48();
  if (os_log_type_enabled(v4, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_1C3A28E98();

    _os_log_impl(&dword_1C39D1000, v4, v6, "Video capture session didProduce %{BOOL}d", v7, 8u);
    MEMORY[0x1C87795D0](v7, -1, -1);
  }
  else
  {
  }
  if (v5[OBJC_IVAR___AXCameraManager_shouldPublish] == 1)
  {
    id v8 = (void *)MEMORY[0x1C8778F30]();
    uint64_t v9 = CMSampleBufferGetImageBuffer(a1);
    if (v9)
    {
      id v10 = v9;
      sub_1C3A261B4();
      objc_super v11 = *(void (**)(__CVBuffer *))&v5[OBJC_IVAR___AXCameraManager_frameHandler];
      if (v11)
      {
        swift_retain();
        v11(v10);

        sub_1C3A2674C((uint64_t)v11);
LABEL_12:
        return;
      }
LABEL_11:

      goto LABEL_12;
    }
    sub_1C3A28E38();
    uint64_t v12 = (__CVBuffer *)(id)AXLogCommon();
    if (v12)
    {
      id v10 = v12;
      sub_1C3A28DD8();
      goto LABEL_11;
    }
LABEL_15:
    __break(1u);
  }
}

uint64_t sub_1C3A26DD0()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t method lookup function for AccessibilityCameraManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AccessibilityCameraManager);
}

uint64_t dispatch thunk of AccessibilityCameraManager.fetchCurrentCameraSceneBuffer(handler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t sub_1C3A26E28()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C3A26E60()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1C3A26E74()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C3A26EAC()
{
  sub_1C3A26038(*(unsigned char **)(v0 + 16));
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

uint64_t sub_1C3A26ECC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C3A26F14(unint64_t *a1, uint64_t *a2)
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

OS_os_log *__getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  return +[AXUIDaemonApplicationDelegate loggingFacility];
}

void AXColorStringForColor_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AXColorStringForColor_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AXColorStringForColor_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AXUISettingsCreateWelcomeController_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1C39D1000, a2, OS_LOG_TYPE_FAULT, "Unexpected view hierarchy for welcome controller: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __getAXUIDisplayManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getTTSPerVoiceSettingsViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getTTSPerVoiceSettingsViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVTAnimojiClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTAnimojiClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVTPresetClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTPresetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVTColorPresetClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTColorPresetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVTAvatarPuppetRecordClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTAvatarPuppetRecordClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAVTMemojiClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTMemojiClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIKListItemLockupElementClass_block_invoke_cold_1(v0);
}

uint64_t __getIKListItemLockupElementClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIKViewElementClass_block_invoke_cold_1(v0);
}

uint64_t __getIKViewElementClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIKListTemplateClass_block_invoke_cold_1(v0);
}

double __getIKListTemplateClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  return +[AXUIDaemonApplication preferredWindowLevel];
}

uint64_t __getSUUIItemOfferButtonClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXElementNamesView setItems:](v0);
}

uint64_t __getHUAccessoryHearingSettingsClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(NSObject_QSSupport *)v0 _accessibilityQuickSpeakContent];
}

uint64_t __getIKImageElementClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getIKTextElementClass_block_invoke_cold_1(v0);
}

uint64_t __getIKTextElementClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXSpeechSettingsModelController isResourceUserDeletable:](v0);
}

void __getAXSettingsVoiceAssetManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  AXAppNameForBundleId_cold_1(v0, v1);
}

void AXAppNameForBundleId_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  os_log_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1C39D1000, a2, OS_LOG_TYPE_ERROR, "Error in getting app name: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_1C3A28DC8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C3A28DD8()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1C3A28DE8()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1C3A28DF8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C3A28E08()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C3A28E18()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C3A28E28()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C3A28E38()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C3A28E48()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C3A28E58()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C3A28E68()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C3A28E78()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C3A28E88()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C3A28E98()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C3A28EA8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t ASTLogCommon()
{
  return MEMORY[0x1F4105E18]();
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x1F4105E28]();
}

uint64_t AXAirPodsB494LocalizedStringForKey()
{
  return MEMORY[0x1F4106690]();
}

uint64_t AXAirPodsB698LocalizedStringForKey()
{
  return MEMORY[0x1F4106698]();
}

uint64_t AXAirPodsLocalizedStringForKey()
{
  return MEMORY[0x1F41066A0]();
}

uint64_t AXAssistiveTouchLocationsForLayout()
{
  return MEMORY[0x1F41066B0]();
}

uint64_t AXAssistiveTouchNamedLayout()
{
  return MEMORY[0x1F41066B8]();
}

uint64_t AXAssitiveTouchPosition()
{
  return MEMORY[0x1F41066C0]();
}

uint64_t AXBeats463LocalizedStringForKey()
{
  return MEMORY[0x1F41066C8]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x1F4105E38]();
}

uint64_t AXCLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x1F4105E40]();
}

uint64_t AXCLanguageConvertToCanonicalForm()
{
  return MEMORY[0x1F4105E50]();
}

uint64_t AXCRemapLanguageCodeToFallbackIfNeccessary()
{
  return MEMORY[0x1F4105E58]();
}

uint64_t AXClientsForSiriResource()
{
  return MEMORY[0x1F41066D0]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x1F4105E90]();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return MEMORY[0x1F41066D8]();
}

uint64_t AXDeviceHasGreyMatterEnabled()
{
  return MEMORY[0x1F41066E0]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x1F41066E8]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x1F4105E98]();
}

uint64_t AXDeviceHasStaccato()
{
  return MEMORY[0x1F4105EA0]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x1F4105EE0]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x1F4105EE8]();
}

uint64_t AXDeviceIsRealityDevice()
{
  return MEMORY[0x1F4105EF8]();
}

uint64_t AXDeviceSupportsCameraButton()
{
  return MEMORY[0x1F41066F8]();
}

uint64_t AXDeviceSupportsOnDeviceEyeTracking()
{
  return MEMORY[0x1F4105F28]();
}

uint64_t AXDeviceSupportsVoiceBankingSpeech()
{
  return MEMORY[0x1F4105F30]();
}

uint64_t AXFormatFloat()
{
  return MEMORY[0x1F4105F40]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x1F4105F48]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x1F4105F50]();
}

uint64_t AXFormatMagnificationFactor()
{
  return MEMORY[0x1F4105F58]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x1F4105F60]();
}

uint64_t AXHomeClickHapticsSupported()
{
  return MEMORY[0x1F4106710]();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x1F4106718]();
}

uint64_t AXLanguageConvertToCanonicalForm()
{
  return MEMORY[0x1F4106720]();
}

uint64_t AXLocStringForDeviceVariant()
{
  return MEMORY[0x1F4106728]();
}

uint64_t AXLocStringKeyForHomeButton()
{
  return MEMORY[0x1F4106730]();
}

uint64_t AXLocStringKeyForModel()
{
  return MEMORY[0x1F4106738]();
}

uint64_t AXLocalizedString()
{
  return MEMORY[0x1F4106740]();
}

uint64_t AXLogAirPodSettings()
{
  return MEMORY[0x1F4105F98]();
}

uint64_t AXLogBrailleHW()
{
  return MEMORY[0x1F4105FD0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1F4105FE0]();
}

uint64_t AXLogDragging()
{
  return MEMORY[0x1F4105FF0]();
}

uint64_t AXLogSettings()
{
  return MEMORY[0x1F4106068]();
}

uint64_t AXLogSpeakSelection()
{
  return MEMORY[0x1F4106088]();
}

uint64_t AXLogSpeechAssetDownload()
{
  return MEMORY[0x1F4106090]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x1F41060E8]();
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  return (NSString *)MEMORY[0x1F40D3198](color);
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x1F4106188]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x1F4106190]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x1F41061A0]();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x1F41061A8]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x1F41061B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x1F41061B8]();
}

uint64_t AXProcessIsAXUIServer()
{
  return MEMORY[0x1F41061C8]();
}

uint64_t AXProcessIsSetup()
{
  return MEMORY[0x1F4106218]();
}

uint64_t AXResourceActivelyUsed()
{
  return MEMORY[0x1F4106748]();
}

uint64_t AXRuntimeCheck_PerVoiceSettings()
{
  return MEMORY[0x1F4106258]();
}

uint64_t AXSBTitleForMedusaGesture()
{
  return MEMORY[0x1F4106750]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x1F41062B8]();
}

uint64_t AXSiriDisplayNameForIdentifier()
{
  return MEMORY[0x1F4106758]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x1F41062D8]();
}

uint64_t AXTTSLogCommon()
{
  return MEMORY[0x1F41062E0]();
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return MEMORY[0x1F4106498](value, *(void *)&theType, valuePtr);
}

uint64_t AXVoiceNameForVoiceId()
{
  return MEMORY[0x1F4106760]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x1F4106770]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
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

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x1F4166A78](string);
  result.double y = v2;
  result.double x = v1;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
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
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t CLFLogCommon()
{
  return MEMORY[0x1F4106318]();
}

uint64_t CLFSortedCommunicationLimits()
{
  return MEMORY[0x1F4111B78]();
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t GSEventCreateWithEventRecord()
{
  return MEMORY[0x1F411C898]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1F411C8F8]();
}

uint64_t GSEventSetHardwareKeyboardAttached()
{
  return MEMORY[0x1F411C938]();
}

uint64_t LICreateDefaultIcon()
{
  return MEMORY[0x1F412F8B0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x1F40E7220](aString);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x1F4145EA8]();
}

uint64_t TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences()
{
  return MEMORY[0x1F4163FD0]();
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1F4166AD8]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x1F4166AE0](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4166B00]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4166B50]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper()
{
  return MEMORY[0x1F4166BC8]();
}

uint64_t UIEdgeInsetsRotate()
{
  return MEMORY[0x1F4166BF8]();
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

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return MEMORY[0x1F4167188]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x1F4106350]();
}

uint64_t VOTLogKeyboard()
{
  return MEMORY[0x1F4106358]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x1F4106368]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x1F4106378]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1F4178A88]();
}

uint64_t _AXSGetUSBRMDisablers()
{
  return MEMORY[0x1F4178AF8]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1F4178CC0]();
}

uint64_t _AXSQuickSpeakCopyPreferredLocalesForLanguages()
{
  return MEMORY[0x1F4178E28]();
}

uint64_t _AXSSpatialAudioHeadTracking()
{
  return MEMORY[0x1F4179040]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x1F4106380]();
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

uint64_t _DUINewClientSessionAccessibilityInterface()
{
  return MEMORY[0x1F4166F28]();
}

uint64_t _DUINewServerSessionAccessibilityInterface()
{
  return MEMORY[0x1F4166F30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x1F4106558]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x1F4106388]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x1F41063B8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x1F41063C8]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
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

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1F40CE780]();
}