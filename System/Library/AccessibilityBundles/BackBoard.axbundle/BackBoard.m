uint64_t _axBroadcastEventHandler()
{
  return MEMORY[0x270F09928]();
}

void updateGizmoAccessibilitySettings()
{
  v0 = dispatch_get_global_queue(0, 0);
  dispatch_async(v0, &__block_literal_global_499);
}

void sub_241F5E7A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v8 - 104));
  _Unwind_Resume(a1);
}

void unsetCaptureMode(int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v2 = AXLogSystemApp();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "Un-setting capture mode: %u", (uint8_t *)v3, 8u);
  }

  _SBAXCaptureMode &= ~a1;
  updateEventTapForNewCaptureMode();
}

void AXBSendEventRepresentationUntapped(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263F228B0];
  id v2 = a1;
  v3 = [v1 sharedManager];
  uint64_t v4 = _EventTapIdentifier;
  v6[0] = *MEMORY[0x263F225F0];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 sendEvent:v2 afterTap:v4 useGSEvent:0 namedTaps:v5 options:0];
}

void sub_241F5EFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void copyKeysToArray(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v4 = (id)[[NSString alloc] initWithUTF8String:a2];
    [a3 addObject:v4];
  }
}

void sub_241F5FB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void setCaptureMode(int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v2 = AXLogSystemApp();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "Setting capture mode: %u", (uint8_t *)v3, 8u);
  }

  _SBAXCaptureMode |= a1;
  updateEventTapForNewCaptureMode();
}

double AXConvertFromContextHostedPoint(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = +[AXBEventManager sharedManager];
  objc_msgSend(v8, "convertPoint:fromContextId:displayId:", a1, a2, a3, a4);

  return AXRotateFromScreen();
}

void BKPostAXEvent(void *a1, int a2)
{
  id v3 = a1;
  if (a2) {
    objc_msgSend(v3, "setAdditionalFlags:", objc_msgSend(v3, "additionalFlags") | 0x1000000);
  }
  [v3 dataRepresentation];
  AXPushNotificationToSystemForBroadcast();
}

void __updateGizmoAccessibilitySettings_block_invoke()
{
  id v1 = (id)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.Accessibility"];
  id v0 = (id)[v1 synchronize];
  [v1 BOOLForKey:@"ApplicationAccessibilityEnabled"];
  AXPerformBlockOnMainThread();
}

void __updateGizmoAccessibilitySettings_block_invoke_2()
{
  id v0 = [MEMORY[0x263F22938] sharedInstance];
  [v0 setGizmoApplicationAccessibilityEnabled:1];
}

void __updateGizmoAccessibilitySettings_block_invoke_3()
{
  id v0 = [MEMORY[0x263F22938] sharedInstance];
  [v0 setGizmoApplicationAccessibilityEnabled:0];
}

void updateEventTapForNewCaptureMode()
{
  if (_SBAXCaptureMode)
  {
    if (_EventTapIdentifier) {
      return;
    }
    uint64_t v4 = [MEMORY[0x263F228B0] sharedManager];
    uint64_t v0 = [v4 installEventTap:&__block_literal_global_514 identifier:@"BB-AX" type:0];
    id v1 = (void *)_EventTapIdentifier;
    _EventTapIdentifier = v0;

    id v2 = v4;
  }
  else
  {
    if (!_EventTapIdentifier) {
      return;
    }
    id v3 = [MEMORY[0x263F228B0] sharedManager];
    [v3 removeEventTap:_EventTapIdentifier];

    id v2 = (void *)_EventTapIdentifier;
    _EventTapIdentifier = 0;
  }
}

uint64_t __updateEventTapForNewCaptureMode_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AXBAccessibilityManager sharedManager];
  uint64_t v4 = [v3 _accessibilityEventTapCallback:v2];

  return v4;
}

void sub_241F632C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _updateBackTap()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_241F633DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241F634F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241F63DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t ___updateBackTap_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _backTapSettingsDidUpdate];
}

void _toggleAXSetting(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B2C8]];
  int v5 = [a3 isEqualToString:v4];

  if (v5)
  {
    _AXSInvertColorsEnabled();
    _AXSInvertColorsSetEnabled();
  }
  else
  {
    v6 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B1C8]];
    int v7 = [a3 isEqualToString:v6];

    if (v7)
    {
      _AXSGrayscaleEnabled();
      _AXSGrayscaleSetEnabled();
    }
    else
    {
      uint64_t v8 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B348]];
      int v9 = [a3 isEqualToString:v8];

      if (v9)
      {
        BOOL v10 = _AXSRedGreenFilterEnabled() == 0;
        MEMORY[0x270F90990](v10);
      }
      else
      {
        uint64_t v11 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B1D0]];
        int v12 = [a3 isEqualToString:v11];

        if (v12)
        {
          BOOL v13 = _AXSGreenRedFilterEnabled() == 0;
          MEMORY[0x270F90798](v13);
        }
        else
        {
          v14 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B150]];
          int v15 = [a3 isEqualToString:v14];

          if (v15)
          {
            BOOL v16 = _AXSBlueYellowFilterEnabled() == 0;
            MEMORY[0x270F90638](v16);
          }
          else
          {
            v17 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B3A8]];
            int v18 = [a3 isEqualToString:v17];

            if (v18)
            {
              BOOL v19 = _AXSColorTintFilterEnabled() == 0;
              MEMORY[0x270F906A8](v19);
            }
          }
        }
      }
    }
  }
}

void _displayFiltersChanged()
{
  uint64_t v0 = +[AXBDisplayFilterManager sharedInstance];
  [v0 _repostNotificationIfNeeded];

  id v1 = +[AXBDisplayFilterManager sharedInstance];
  [v1 updateSettings];
}

double AXRotateToScreen()
{
  uint64_t v2 = 0;
  id v3 = (double *)&v2;
  uint64_t v4 = 0x3010000000;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v5 = "";
  AXPerformSafeBlock();
  double v0 = v3[4];
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_241F66E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241F6782C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __AXRotateToScreen_block_invoke(uint64_t a1)
{
  uint64_t result = +[AXBackBoardGlue displayConvertToCAScreen:withDisplayIntegerId:](AXBackBoardGlue, "displayConvertToCAScreen:withDisplayIntegerId:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

double AXRotateFromScreen()
{
  uint64_t v2 = 0;
  uint64_t v3 = (double *)&v2;
  uint64_t v4 = 0x3010000000;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v5 = "";
  AXPerformSafeBlock();
  double v0 = v3[4];
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_241F6802C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AXRotateFromScreen_block_invoke(uint64_t a1)
{
  uint64_t result = +[AXBackBoardGlue displayConvertFromCAScreen:withDisplayIntegerId:](AXBackBoardGlue, "displayConvertFromCAScreen:withDisplayIntegerId:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 localizedStringForKey:v1 value:&stru_26F633208 table:@"Accessibility"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_241F699A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241F69B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241F6AA3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

uint64_t _updateSoundDetection()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t ___updateSoundDetection_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _soundDetectionSettingsDidUpdate];
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void _toggleAXSetting_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B2C8]];
  int v5 = [a3 isEqualToString:v4];

  if (v5)
  {
    _AXSInvertColorsEnabled();
    _AXSInvertColorsSetEnabled();
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B1C8]];
    int v7 = [a3 isEqualToString:v6];

    if (v7)
    {
      _AXSGrayscaleEnabled();
      _AXSGrayscaleSetEnabled();
    }
  }
}

id getLiveSpeechServicesObjcClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  double v0 = (void *)getLiveSpeechServicesObjcClass_softClass;
  uint64_t v7 = getLiveSpeechServicesObjcClass_softClass;
  if (!getLiveSpeechServicesObjcClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    _DWORD v3[2] = __getLiveSpeechServicesObjcClass_block_invoke;
    v3[3] = &unk_26510B818;
    v3[4] = &v4;
    __getLiveSpeechServicesObjcClass_block_invoke((uint64_t)v3);
    double v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_241F6BBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLiveSpeechServicesObjcClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    _DWORD v3[2] = (void *)3221225472;
    v3[3] = __LiveSpeechServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26510B838;
    uint64_t v5 = 0;
    LiveSpeechServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary) {
    __getLiveSpeechServicesObjcClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("LiveSpeechServicesObjc");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLiveSpeechServicesObjcClass_block_invoke_cold_2();
  }
  getLiveSpeechServicesObjcClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LiveSpeechServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LiveSpeechServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_241F6C0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getAXMotionCuesManagerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AXMotionCuesServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __AXMotionCuesServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26510B870;
    uint64_t v6 = 0;
    AXMotionCuesServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)AXMotionCuesServicesLibraryCore_frameworkLibrary;
  if (!AXMotionCuesServicesLibraryCore_frameworkLibrary) {
    __getAXMotionCuesManagerSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "AXMotionCuesManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXMotionCuesManagerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXMotionCuesServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXMotionCuesServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_241F6C870(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void _handleContinuityDisplayStateChanged(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 springboardContinuityCheckQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___handleContinuityDisplayStateChanged_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a2;
    dispatch_async(v3, block);
  }
}

uint64_t ___handleContinuityDisplayStateChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForContinuityStateChange];
}

id getLiveCaptionsServicesClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  double v0 = (void *)getLiveCaptionsServicesClass_softClass;
  uint64_t v7 = getLiveCaptionsServicesClass_softClass;
  if (!getLiveCaptionsServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    _DWORD v3[2] = __getLiveCaptionsServicesClass_block_invoke;
    v3[3] = &unk_26510B818;
    v3[4] = &v4;
    __getLiveCaptionsServicesClass_block_invoke((uint64_t)v3);
    double v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_241F6DE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLiveCaptionsServicesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    _DWORD v3[2] = (void *)3221225472;
    v3[3] = __LiveSpeechServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26510B8F8;
    uint64_t v5 = 0;
    LiveSpeechServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary_0) {
    __getLiveCaptionsServicesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("LiveCaptionsServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLiveCaptionsServicesClass_block_invoke_cold_2();
  }
  getLiveCaptionsServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LiveSpeechServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  LiveSpeechServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t _isBuddyRunning()
{
  v9[1] = *MEMORY[0x263EF8340];
  if (AXInPreboardScenario()) {
    return 0;
  }
  id v1 = objc_alloc(MEMORY[0x263F297F0]);
  uint64_t v2 = [MEMORY[0x263F213F8] setupProcessName];
  v9[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  long long v4 = (void *)[v1 initWithBundleIDs:v3 states:*MEMORY[0x263F297C8]];

  uint64_t v5 = [MEMORY[0x263F213F8] setupProcessName];
  int v6 = [v4 applicationStateForApplication:v5];

  if (v6 == 8 || v6 == 4) {
    uint64_t v0 = AXIsBuddyCompleted() ^ 1;
  }
  else {
    uint64_t v0 = 0;
  }
  [v4 invalidate];

  return v0;
}

void sub_241F6F810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _postHomeButtonPress(int a1, int a2, void *a3)
{
  id v13 = a3;
  if (AXDeviceHasHomeButton()) {
    unsigned int v5 = 1001;
  }
  else {
    unsigned int v5 = 1011;
  }
  if (AXDeviceHasHomeButton()) {
    unsigned int v6 = 1000;
  }
  else {
    unsigned int v6 = 1010;
  }
  if (a1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = [MEMORY[0x263F228A8] buttonRepresentationWithType:v7];
  objc_msgSend(v8, "setAdditionalFlags:", objc_msgSend(v8, "additionalFlags") | 0x1000000);
  uint64_t v9 = [v13 clientId];
  [v8 setClientId:v9];

  uint64_t v10 = [v13 HIDAttributeData];
  [v8 setHIDAttributeData:v10];

  if (a1 && a2) {
    objc_msgSend(v8, "setAdditionalFlags:", objc_msgSend(v8, "additionalFlags") | 0x880000);
  }
  objc_msgSend(v8, "setHIDTime:", objc_msgSend(v13, "HIDTime"));
  [v8 setUseOriginalHIDTime:1];
  uint64_t v11 = objc_msgSend(MEMORY[0x263F228B0], "sharedManager", CFAbsoluteTimeGetCurrent());
  int v12 = [(id)_Controller _eventTapIdentifier];
  [v11 sendEvent:v8 afterTap:v12 useGSEvent:0 namedTaps:0 options:0];
}

void _accessibilityTripleHomeStatusChange()
{
  uint64_t v0 = +[AXBHomeClickController controller];
  [v0 _updateTripleHomeSettings:0];

  id v1 = +[AXBHomeClickController controller];
  [v1 _writeNoteToNewUserSession];
}

uint64_t _accessibilityTripleHomeFired()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

void _accessibilityHomeClickEnabled()
{
  id v0 = +[AXBHomeClickController controller];
  [v0 _updateHomeClickEnabled];
}

void _accessibilityHomeClickSpeedChanged()
{
  id v0 = +[AXBHomeClickController controller];
  [v0 _updateHomeClickSpeed];
}

void _appTransitionOccurred()
{
  id v0 = +[AXBHomeClickController controller];
  [v0 _triggerAppTransition];
}

uint64_t _handleInPreBoardModeUpdate()
{
  uint64_t result = AXInPreboardScenario();
  if (result)
  {
    _AXSVoiceOverTouchEnabled();
    _AXSVoiceOverTouchSetEnabled();
    _AXSAssistiveTouchScannerEnabled();
    _AXSAssistiveTouchScannerSetEnabled();
    _AXSAssistiveTouchEnabled();
    _AXSAssistiveTouchSetEnabled();
    _AXSCommandAndControlEnabled();
    _AXSCommandAndControlSetEnabled();
    uint64_t v1 = _AXSFullKeyboardAccessEnabled();
    return MEMORY[0x270F90770](v1);
  }
  return result;
}

uint64_t _handleInCheckerBoardModeUpdate()
{
  uint64_t result = AXInCheckerBoardScenario();
  if (result)
  {
    _AXSVoiceOverTouchEnabled();
    _AXSVoiceOverTouchSetEnabled();
    _AXSAssistiveTouchScannerEnabled();
    _AXSAssistiveTouchScannerSetEnabled();
    _AXSAssistiveTouchEnabled();
    return _AXSAssistiveTouchSetEnabled();
  }
  return result;
}

void _handleSessionIsLoginSessionUpdate()
{
  id v0 = +[AXBHomeClickController controller];
  [v0 _triggerAppTransition];
}

void ___accessibilityTripleHomeFired_block_invoke()
{
  id v3 = (id)_AXSTripleClickCopyOptions();
  BOOL v0 = [v3 count] == 2
    && _AXSTripleClickContainsOption()
    && _AXSTripleClickContainsOption() != 0;
  if ([v3 count] == 1 || v0)
  {
    uint64_t v2 = [v3 objectAtIndex:0];
    uint64_t v1 = [v2 intValue];
  }
  else if ((unint64_t)[v3 count] <= 1)
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = 3;
  }
  if ((AXInPreboardScenario() & 1) != 0 || AXInCheckerBoardScenario())
  {
    if (_AXSAssistiveTouchScannerEnabled())
    {
LABEL_14:
      uint64_t v1 = 9;
LABEL_15:
      [MEMORY[0x263F229B8] registerObserverForTripleClickOption:v1];
LABEL_16:
      [MEMORY[0x263F229B8] toggleTripleClickOption:v1];
      goto LABEL_28;
    }
    if (!_AXSVoiceOverTouchEnabled() && ([v3 containsObject:&unk_26F637740] & 1) == 0)
    {
      if (([v3 containsObject:&unk_26F637770] & 1) == 0)
      {
        if ([v3 containsObject:&unk_26F637788])
        {
          uint64_t v1 = 4;
        }
        else if ([v3 containsObject:&unk_26F6377A0])
        {
          uint64_t v1 = 27;
        }
        else if ([v3 containsObject:&unk_26F6377B8])
        {
          uint64_t v1 = 40;
        }
        else if ([v3 containsObject:&unk_26F6377D0])
        {
          uint64_t v1 = 2;
        }
        else if ([v3 containsObject:&unk_26F6377E8])
        {
          uint64_t v1 = 34;
        }
        else
        {
          uint64_t v1 = 0;
        }
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    [MEMORY[0x263F229B8] registerObserverForTripleClickOption:1];
    goto LABEL_20;
  }
  if (+[AXBGuidedAccessManager inGuidedAccess])
  {
    if (!+[AXBGuidedAccessManager allowsTripleClickSheet])
    {
      uint64_t v1 = 7;
      goto LABEL_15;
    }
  }
  else if (_AXSAssistiveTouchScannerEnabled() {
         && ([MEMORY[0x263F229B8] switchControlRendersDeviceUnusable] & 1) != 0)
  }
  {
    goto LABEL_14;
  }
  if (v1 == 3)
  {
    [(id)_Controller _toggleDisplayAskSheet];
  }
  else
  {
    [MEMORY[0x263F229B8] registerObserverForTripleClickOption:v1];
    if ((int)v1 <= 11)
    {
      if (v1 != 1)
      {
        if (v1 != 5) {
          goto LABEL_16;
        }
        if ((!_isBuddyRunning() || AXIsBuddyCompleted())
          && !AXSessionIsLoginSession())
        {
          goto LABEL_28;
        }
      }
LABEL_20:
      [(id)_Controller _startVoiceOverSequence];
      goto LABEL_28;
    }
    switch(v1)
    {
      case 0xC:
        [(id)_Controller _toggleMagnifier];
        break;
      case 0x10:
        [(id)_Controller _showLookingGlassMenu];
        break;
      case 0x16:
        [(id)_Controller _toggleDetectionMode];
        break;
      default:
        goto LABEL_16;
    }
  }
LABEL_28:
}

id getLookingGlassServicesClass()
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  BOOL v0 = (void *)getLookingGlassServicesClass_softClass;
  uint64_t v7 = getLookingGlassServicesClass_softClass;
  if (!getLookingGlassServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    _DWORD v3[2] = __getLookingGlassServicesClass_block_invoke;
    v3[3] = &unk_26510B818;
    v3[4] = &v4;
    __getLookingGlassServicesClass_block_invoke((uint64_t)v3);
    BOOL v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_241F71870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t LookingGlassServicesLibraryCore()
{
  if (!LookingGlassServicesLibraryCore_frameworkLibrary) {
    LookingGlassServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return LookingGlassServicesLibraryCore_frameworkLibrary;
}

uint64_t __LookingGlassServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LookingGlassServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLookingGlassServicesClass_block_invoke(uint64_t a1)
{
  id v3 = 0;
  if (!LookingGlassServicesLibraryCore()) {
    __getLookingGlassServicesClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("LookingGlassServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLookingGlassServicesClass_block_invoke_cold_2();
  }
  getLookingGlassServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void _AXBValidateMethods()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_16 withPreValidationHandler:&__block_literal_global_414 postValidationHandler:0];
}

void sub_241F723F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSpeakThisServicesClass()
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getSpeakThisServicesClass_softClass;
  uint64_t v7 = getSpeakThisServicesClass_softClass;
  if (!getSpeakThisServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    _DWORD v3[2] = __getSpeakThisServicesClass_block_invoke;
    v3[3] = &unk_26510B818;
    v3[4] = &v4;
    __getSpeakThisServicesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_241F727F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241F729FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

Class __getSpeakThisServicesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpeakThisServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    _DWORD v3[2] = (void *)3221225472;
    v3[3] = __SpeakThisServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26510B998;
    uint64_t v5 = 0;
    SpeakThisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeakThisServicesLibraryCore_frameworkLibrary) {
    __getSpeakThisServicesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SpeakThisServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSpeakThisServicesClass_block_invoke_cold_2();
  }
  getSpeakThisServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpeakThisServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpeakThisServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_241F734E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getHoverTextObjcSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!HoverTextServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __HoverTextServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26510B9B0;
    uint64_t v6 = 0;
    HoverTextServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)HoverTextServicesLibraryCore_frameworkLibrary;
  if (!HoverTextServicesLibraryCore_frameworkLibrary) {
    __getHoverTextObjcSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "HoverTextObjc");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHoverTextObjcSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HoverTextServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HoverTextServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_241F74428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AXWatchRemoteScreenServicesLibrary();
  uint64_t result = dlsym(v2, "AXWatchRemoteScreenIsTwiceFeatureOn");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXWatchRemoteScreenServicesLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AXWatchRemoteScreenServicesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26510B9C8;
    uint64_t v4 = 0;
    AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary;
  if (!AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary) {
    AXWatchRemoteScreenServicesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AXWatchRemoteScreenServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXTwiceRemoteScreenServiceObjcSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AXWatchRemoteScreenServicesLibrary();
  uint64_t result = dlsym(v2, "AXTwiceRemoteScreenServiceObjc");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_241F78494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241F792DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241F7AB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void _prefChangedCallback()
{
  id v0 = +[AXBOpaqueTouchSettingsManager sharedInstance];
  [v0 _resendPreferencesToServices];
}

uint64_t _deviceMatchedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  _AXSSetAccessibilityHasNoticedOpaqueTouchDevice();

  return [a1 deviceServiceAppeared:a3];
}

void __getLiveSpeechServicesObjcClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *LiveSpeechServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXBLiveSpeechManager.m", 24, @"%s", *a1);

  __break(1u);
}

void __getLiveSpeechServicesObjcClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLiveSpeechServicesObjcClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBLiveSpeechManager.m", 25, @"Unable to find class %s", "LiveSpeechServicesObjc");

  __break(1u);
}

void __getAXMotionCuesManagerSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AXMotionCuesServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXBMotionCuesManager.m", 16, @"%s", *a1);

  __break(1u);
}

void __getLiveCaptionsServicesClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *LiveSpeechServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXBLiveCaptionsManager.m", 17, @"%s", *a1);

  __break(1u);
}

void __getLiveCaptionsServicesClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLiveCaptionsServicesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBLiveCaptionsManager.m", 18, @"Unable to find class %s", "LiveCaptionsServices");

  __break(1u);
}

void __getLookingGlassServicesClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *LookingGlassServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXBLookingGlassManager.m", 17, @"%s", *a1);

  __break(1u);
}

void __getLookingGlassServicesClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getLookingGlassServicesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBLookingGlassManager.m", 18, @"Unable to find class %s", "LookingGlassServices");

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *SpeakThisServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXBSpeakThisManager.m", 16, @"%s", *a1);

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSpeakThisServicesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBSpeakThisManager.m", 17, @"Unable to find class %s", "SpeakThisServices");

  __break(1u);
}

void __getHoverTextObjcSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *HoverTextServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXBHoverTextManager.m", 24, @"%s", *a1);

  __break(1u);
}

void AXWatchRemoteScreenServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AXWatchRemoteScreenServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXBTwiceRemoteScreenManager.m", 15, @"%s", *a1);

  __break(1u);
}

uint64_t AXBeginListeningToUserDefaultsChanges()
{
  return MEMORY[0x270F90500]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x270F09178]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x270F09FB0]();
}

uint64_t AXDeviceIsJ5XX()
{
  return MEMORY[0x270F09FD8]();
}

uint64_t AXDeviceIsMultiUser()
{
  return MEMORY[0x270F091D0]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x270F091E8]();
}

uint64_t AXDeviceSupportsAssistiveTouch()
{
  return MEMORY[0x270F09218]();
}

uint64_t AXDeviceSupportsCameraButton()
{
  return MEMORY[0x270F0A030]();
}

uint64_t AXDeviceSupportsHapticMusic()
{
  return MEMORY[0x270F09220]();
}

uint64_t AXDeviceSupportsLiveCaptions()
{
  return MEMORY[0x270F0A058]();
}

uint64_t AXDeviceSupportsLiveSpeech()
{
  return MEMORY[0x270F0A060]();
}

uint64_t AXDeviceSupportsMotionCues()
{
  return MEMORY[0x270F0A078]();
}

uint64_t AXEventTypeIsKeyboardKey()
{
  return MEMORY[0x270F0A0C0]();
}

uint64_t AXEventTypeShouldLetBackboardProcess()
{
  return MEMORY[0x270F0A0C8]();
}

uint64_t AXHasCapability()
{
  return MEMORY[0x270F0A130]();
}

uint64_t AXInCheckerBoardScenario()
{
  return MEMORY[0x270F0A138]();
}

uint64_t AXInPreboardScenario()
{
  return MEMORY[0x270F0A148]();
}

uint64_t AXIsBuddyCompleted()
{
  return MEMORY[0x270F09270]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x270F09278]();
}

uint64_t AXIsLookingGlassAvailable()
{
  return MEMORY[0x270F09280]();
}

uint64_t AXLogAVS()
{
  return MEMORY[0x270F09288]();
}

uint64_t AXLogAccessories()
{
  return MEMORY[0x270F09290]();
}

uint64_t AXLogBackTap()
{
  return MEMORY[0x270F092C0]();
}

uint64_t AXLogBackboardServer()
{
  return MEMORY[0x270F092C8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXLogDisplayFilters()
{
  return MEMORY[0x270F092E8]();
}

uint64_t AXLogHapticMusic()
{
  return MEMORY[0x270F09308]();
}

uint64_t AXLogLiveTranscription()
{
  return MEMORY[0x270F09320]();
}

uint64_t AXLogLookingGlass()
{
  return MEMORY[0x270F09330]();
}

uint64_t AXLogLookingGlassUI()
{
  return MEMORY[0x270F09338]();
}

uint64_t AXLogMotionCues()
{
  return MEMORY[0x270F09340]();
}

uint64_t AXLogSoundActions()
{
  return MEMORY[0x270F09378]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x270F09380]();
}

uint64_t AXLogSystemApp()
{
  return MEMORY[0x270F093A0]();
}

uint64_t AXLogTouchAccommodations()
{
  return MEMORY[0x270F093B8]();
}

uint64_t AXLogTwiceRemoteScreen()
{
  return MEMORY[0x270F093C0]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x270F093E0]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x270F093F8]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x270F09420]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  return MEMORY[0x270F09850]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXSessionIsLoginSession()
{
  return MEMORY[0x270F0A318]();
}

uint64_t AX_CGPathCopyDataRepresentation()
{
  return MEMORY[0x270F0A350]();
}

uint64_t BKSHIDDigitizerEventIsFirstTouchDown()
{
  return MEMORY[0x270F10478]();
}

uint64_t BKSHIDEventGetDigitizerAttributes()
{
  return MEMORY[0x270F10488]();
}

uint64_t BKSHIDEventSetAttributes()
{
  return MEMORY[0x270F104A8]();
}

uint64_t BKSHIDEventSetDigitizerInfo()
{
  return MEMORY[0x270F104B0]();
}

uint64_t BKSHIDEventSetDigitizerInfoWithSubEventInfos()
{
  return MEMORY[0x270F104B8]();
}

uint64_t BKSHIDEventSetSimpleInfo()
{
  return MEMORY[0x270F104C8]();
}

uint64_t BKSHIDServicesCancelTouchesOnMainDisplay()
{
  return MEMORY[0x270F104E8]();
}

uint64_t BKSHIDServicesSetDeviceOrientationForAutomation()
{
  return MEMORY[0x270F10560]();
}

uint64_t BKSHIDServicesSetPersistentServiceProperties()
{
  return MEMORY[0x270F10568]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t CLFLogCommon()
{
  return MEMORY[0x270F09588]();
}

uint64_t FKALogCommon()
{
  return MEMORY[0x270F09590]();
}

uint64_t GAXLogCommon()
{
  return MEMORY[0x270F09598]();
}

uint64_t GSGetPurpleSystemEventPort()
{
  return MEMORY[0x270F30630]();
}

uint64_t GSSendEvent()
{
  return MEMORY[0x270F30698]();
}

uint64_t HTLogCommon()
{
  return MEMORY[0x270F095A0]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x270EF4368]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x270EF4370]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x270EF43F0]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x270EF4418](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x270EF4420]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingCallback()
{
  return MEMORY[0x270EF4440]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x270EF4478]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x270EF4490]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x270EF4498]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x270EF44D0]();
}

uint64_t IOHIDEventSystemConnectionDispatchEvent()
{
  return MEMORY[0x270EF44D8]();
}

uint64_t IOHIDEventSystemConnectionGetAttribute()
{
  return MEMORY[0x270EF44E0]();
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x270EF4648](service, *(void *)&usagePage, *(void *)&usage);
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return MEMORY[0x270EF4670]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF4680](service, key, property);
}

uint64_t LiveSpeechLogCommon()
{
  return MEMORY[0x270F095A8]();
}

uint64_t MADisplayFilterCopySystemFilter()
{
  return MEMORY[0x270EF5AE0]();
}

uint64_t MADisplayFilterCreateIdentity()
{
  return MEMORY[0x270EF5AE8]();
}

uint64_t MADisplayFilterGetGain()
{
  return MEMORY[0x270EF5AF0]();
}

uint64_t MADisplayFilterGetMatrix()
{
  return MEMORY[0x270EF5AF8]();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return MEMORY[0x270EF5B08]();
}

uint64_t MADisplayFilterPrefGetReduceWhitePointIntensity()
{
  return MEMORY[0x270EF5B28]();
}

uint64_t MAPreferencesSetDomainOverride()
{
  return MEMORY[0x270EF5B78]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MobileStorageCopyDevices()
{
  return MEMORY[0x270F4B380]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSPoint NSPointFromString(NSString *aString)
{
  MEMORY[0x270EF2B80](aString);
  result.y = v2;
  result.x = v1;
  return result;
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x270EF2BB0](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t VOTLogLifeCycle()
{
  return MEMORY[0x270F095C8]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F095E8]();
}

uint64_t _AXSAccessibilityEnabled()
{
  return MEMORY[0x270F90528]();
}

uint64_t _AXSAccessibilityNeedsMiniServer()
{
  return MEMORY[0x270F90538]();
}

uint64_t _AXSAccessibilitySetiTunesPreference()
{
  return MEMORY[0x270F90550]();
}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  return MEMORY[0x270F90558]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90570]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x270F90580]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSAssistiveTouchScannerSetEnabled()
{
  return MEMORY[0x270F905B8]();
}

uint64_t _AXSAssistiveTouchSetEnabled()
{
  return MEMORY[0x270F905C0]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXSBlueYellowFilterEnabled()
{
  return MEMORY[0x270F90630]();
}

uint64_t _AXSCachedValueForBrightnessFilter()
{
  return MEMORY[0x270F90648]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x270F90650]();
}

uint64_t _AXSClarityBoardEnabled()
{
  return MEMORY[0x270F90660]();
}

uint64_t _AXSColorTintFilterEnabled()
{
  return MEMORY[0x270F906A0]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x270F906C8]();
}

uint64_t _AXSCopyPreferenceValueWithDomain()
{
  return MEMORY[0x270F906D8]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

uint64_t _AXSGrayscaleEnabled()
{
  return MEMORY[0x270F90780]();
}

uint64_t _AXSGrayscaleSetEnabled()
{
  return MEMORY[0x270F90788]();
}

uint64_t _AXSGreenRedFilterEnabled()
{
  return MEMORY[0x270F90790]();
}

uint64_t _AXSGuidedAccessEnabled()
{
  return MEMORY[0x270F907A0]();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return MEMORY[0x270F907B0]();
}

uint64_t _AXSHapticMusicEnabled()
{
  return MEMORY[0x270F907D0]();
}

uint64_t _AXSHomeClickEnabled()
{
  return MEMORY[0x270F90850]();
}

uint64_t _AXSHomeClickSpeed()
{
  return MEMORY[0x270F90858]();
}

uint64_t _AXSHoverTextEnabled()
{
  return MEMORY[0x270F90860]();
}

uint64_t _AXSHoverTextTypingEnabled()
{
  return MEMORY[0x270F90868]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x270F90880]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x270F90898]();
}

uint64_t _AXSLiveSpeechEnabled()
{
  return MEMORY[0x270F908C0]();
}

uint64_t _AXSLiveSpeechSetEnabled()
{
  return MEMORY[0x270F908C8]();
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  return MEMORY[0x270F908D0]();
}

uint64_t _AXSMotionCuesEnabled()
{
  return MEMORY[0x270F90900]();
}

uint64_t _AXSMotionCuesMode()
{
  return MEMORY[0x270F90908]();
}

uint64_t _AXSOnDeviceEyeTrackingEnabled()
{
  return MEMORY[0x270F90910]();
}

uint64_t _AXSOpaqueTouchTapSpeed()
{
  return MEMORY[0x270F90918]();
}

uint64_t _AXSRedGreenFilterEnabled()
{
  return MEMORY[0x270F90988]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x270F909A0]();
}

uint64_t _AXSScreenFilterApplied()
{
  return MEMORY[0x270F909B0]();
}

uint64_t _AXSSetAccessibilityHasNoticedOpaqueTouchDevice()
{
  return MEMORY[0x270F909C8]();
}

uint64_t _AXSSetAutomationEnabled()
{
  return MEMORY[0x270F909E8]();
}

uint64_t _AXSSetCacheForBrightnessFilter()
{
  return MEMORY[0x270F909F8]();
}

uint64_t _AXSSetReduceWhitePointEnabled()
{
  return MEMORY[0x270F90A78]();
}

uint64_t _AXSSetTripleClickOptions()
{
  return MEMORY[0x270F90A90]();
}

uint64_t _AXSSetWriteableClient()
{
  return MEMORY[0x270F90AA8]();
}

uint64_t _AXSSlowKeysAcceptanceDelay()
{
  return MEMORY[0x270F90AC0]();
}

uint64_t _AXSSlowKeysEnabled()
{
  return MEMORY[0x270F90AC8]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x270F90AE0]();
}

uint64_t _AXSSpeakThisSetHighlightVisible()
{
  return MEMORY[0x270F90AF0]();
}

uint64_t _AXSSpeechSettingsSetDisabledByManagedConfiguration()
{
  return MEMORY[0x270F90AF8]();
}

uint64_t _AXSTripleClickAddOption()
{
  return MEMORY[0x270F90B10]();
}

uint64_t _AXSTripleClickContainsOption()
{
  return MEMORY[0x270F90B18]();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return MEMORY[0x270F90B20]();
}

uint64_t _AXSTripleClickRemoveOption()
{
  return MEMORY[0x270F90B28]();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  return MEMORY[0x270F90B30]();
}

uint64_t _AXSTwiceRemoteScreenSetEnabled()
{
  return MEMORY[0x270F90B40]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x270F90B80]();
}

uint64_t _AXSVoiceOverTouchSetUIEnabled()
{
  return MEMORY[0x270F90BB0]();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return MEMORY[0x270F90BB8]();
}

uint64_t _AXSVoiceOverTouchUsageConfirmed()
{
  return MEMORY[0x270F90BE0]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x270F90C18]();
}

uint64_t _AXSetPreferenceWithNotification()
{
  return MEMORY[0x270F90C20]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x270F095F8]();
}

uint64_t _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback()
{
  return MEMORY[0x270F099A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t __UIAccessibilityCastAsProtocol()
{
  return MEMORY[0x270F09608]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void launch_data_dict_iterate(const launch_data_t ldict, launch_data_dict_iterator_t iterator, void *ctx)
{
}

void launch_data_free(launch_data_t ld)
{
}

launch_data_type_t launch_data_get_type(const launch_data_t ld)
{
  return MEMORY[0x270ED9FE8](ld);
}

launch_data_t launch_data_new_string(const char *val)
{
  return (launch_data_t)MEMORY[0x270ED9FF0](val);
}

launch_data_t launch_msg(const launch_data_t request)
{
  return (launch_data_t)MEMORY[0x270ED9FF8](request);
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}