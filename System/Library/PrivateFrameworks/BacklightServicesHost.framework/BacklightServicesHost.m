void sub_21FCFE96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FCFF098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21FCFF20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCFF358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCFF4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCFF5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCFF6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCFF824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCFFA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FCFFE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21FD000F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _populateBacklightChangeEventStruct(void *a1, uint64_t a2)
{
  id v3 = a1;
  *(unsigned char *)a2 = *(unsigned char *)a2 & 0xFE | (v3 != 0);
  id v7 = v3;
  if (v3)
  {
    *(void *)(a2 + 8) = [v3 eventID];
    *(_DWORD *)(a2 + 16) = [v7 state];
    *(_DWORD *)(a2 + 20) = [v7 previousState];
    id v3 = v7;
  }
  v4 = [v3 changeRequest];
  v5 = v4;
  *(unsigned char *)(a2 + 24) = *(unsigned char *)(a2 + 24) & 0xFE | (v4 != 0);
  if (v4)
  {
    *(_DWORD *)(a2 + 28) = [v4 requestedActivityState];
    v6 = [v5 explanation];
    *(_DWORD *)(a2 + 32) = +[BLSHBacklightTransitionStateMachineAbortContext backlightChangeRequestExplanationIdentifierFromString:v6];

    *(void *)(a2 + 40) = [v5 timestamp];
    *(_DWORD *)(a2 + 48) = [v5 sourceEvent];
  }
}

uint64_t BLSBacklightFactorFromCBDisplayMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_21FD8B258[a1 - 1];
  }
}

__CFString *NSStringFromCBDisplayMode_bls(unint64_t a1)
{
  if (a1 > 4) {
    return @"Invalid";
  }
  else {
    return off_2645325D8[a1];
  }
}

__CFString *NSStringFromCBFlipbookState_bls(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"WillTurnOn";
  }
  else {
    return off_264532600[a1 - 1];
  }
}

void sub_21FD05320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_21FD06D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

__CFString *NSStringFromBLSHOnSystemSleepActionState(uint64_t a1)
{
  v1 = @"Idle";
  if (a1 == 1) {
    v1 = @"Performing";
  }
  if (a1 == 2) {
    return @"Completed";
  }
  else {
    return v1;
  }
}

void sub_21FD07EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void sub_21FD0D9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *location)
{
  if (v24) {
    objc_destroyWeak(v25);
  }
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v26 - 208));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_21FD0FA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

__CFString *NSStringFromBLSHAlwaysOnPresentationEngineState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Stopped";
  }
  else {
    return off_264532C70[a1 - 1];
  }
}

BOOL BLSHAlwaysOnPresentationEngineStateIsFlipbook(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

BOOL BLSHAlwaysOnPresentationEngineStateIsPredictiveFlipbook(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

void sub_21FD11604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD11EF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
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

void sub_21FD16718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD17364(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 168));
  _Block_object_dispose((const void *)(v3 - 160), 8);
  _Block_object_dispose((const void *)(v3 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21FD17548(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FD1B274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_21FD1B3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t _triggerTestCriticalAssert(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_triggerTestCriticalAssert:");
}

void sub_21FD24340(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21FD24794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_21FD261DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_21FD272CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

__CFString *NSStringFromBLSBacklightDisplayMode(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected display mode:%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2645332E0[a1];
  }

  return v1;
}

uint64_t BLSBacklightStateForBLSBacklightDisplayMode(unint64_t a1)
{
  if (a1 < 7) {
    return qword_21FD8B378[a1];
  }
  uint64_t v3 = bls_backlight_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    BLSBacklightStateForBLSBacklightDisplayMode_cold_1(a1, v3);
  }

  return 0;
}

BOOL IsBlankedForBLSBacklightDisplayMode(uint64_t a1)
{
  return (unint64_t)(a1 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

uint64_t WouldUserExpectDisplayToBeActiveForBLSBacklightDisplayMode(unint64_t a1)
{
  return (a1 < 7) & (0x70u >> a1);
}

uint64_t IsOffForBLSBacklightDisplayMode(unint64_t a1)
{
  return (a1 > 6) | (3u >> a1) & 1;
}

BOOL CanRenderFlipbookForBLSBacklightDisplayMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL IsAlwaysOnBrightnessForBLSBacklightDisplayMode(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

uint64_t IsActiveOnBrightnessForBLSBacklightDisplayMode(unint64_t a1)
{
  return (a1 < 7) & (0x70u >> a1);
}

BOOL IsDisplayModeTransitionToAlwaysOn(uint64_t a1, uint64_t a2)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2 && (unint64_t)(a2 - 4) < 3;
}

uint64_t IsDisplayModeTransitionToActiveOn(unint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 2 || a1 > 6) {
    return 0;
  }
  else {
    return (0x70u >> a1) & 1;
  }
}

BOOL WillBlankForDisplayModeTransition(uint64_t a1, uint64_t a2)
{
  return (unint64_t)(a1 - 3) < 4 && (unint64_t)(a2 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

BOOL WillUnblankForDisplayModeTransition(uint64_t a1, uint64_t a2)
{
  return (unint64_t)(a1 - 7) < 0xFFFFFFFFFFFFFFFCLL && (unint64_t)(a2 - 3) < 4;
}

void _springboardDidFinishStartup(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v3 = dispatch_time(0, 120000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___springboardDidFinishStartup_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void ___springboardDidFinishStartup_block_invoke(uint64_t a1)
{
  +[BLSHWatchdogProvider checkForWatchdogDidFire:0];
  BLSHCheckForCriticalAssertFailureAndPrompt(1, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___springboardDidFinishStartup_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_classLock_block_invoke_onceToken != -1) {
    dispatch_once(&_classLock_block_invoke_onceToken, block);
  }
}

void ___springboardDidFinishStartup_block_invoke_2(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  dispatch_time_t v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_criticalAssertDidFail, @"BLSHCriticalAssertDidFailNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void _criticalAssertDidFail()
{
  dispatch_time_t v0 = dispatch_time(0, 1000000000);
  uint64_t v1 = MEMORY[0x263EF83A0];

  dispatch_after(v0, v1, &__block_literal_global_9);
}

BOOL ___criticalAssertDidFail_block_invoke()
{
  return BLSHCheckForCriticalAssertFailureAndPrompt(1, 0);
}

void sub_21FD343F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD34B5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FD34BD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FD35464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

void _blsAlertCallback(uint64_t a1, uint64_t a2)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  dispatch_time_t v3 = (id)__dialog;
  uint64_t v4 = v3;
  if (a2 == 2)
  {
    uint64_t v5 = 2;
  }
  else if (a2 == 1)
  {
    uint64_t v5 = 0;
  }
  else if (a2)
  {
    v6 = v3[2];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      _blsAlertCallback_cold_1(a2, v6);
    }
    dispatch_time_t v3 = v4;
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 1;
  }
  [v3 _alertDidDismiss:v5];
}

void sub_21FD39A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD3BDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void sub_21FD3E438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _blsWatchdogLockStatusDidChange()
{
  dispatch_time_t v0 = bls_diagnostics_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    _blsWatchdogLockStatusDidChange_cold_1();
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v2 = (const void *)objc_opt_class();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v2, @"com.apple.mobile.keybagd.lock_status", 0);
  return +[BLSHWatchdogProvider checkForWatchdogDidFire:0];
}

void sub_21FD403E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21FD4232C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21FD43184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_21FD44198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id location)
{
}

void sub_21FD44328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD444F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_21FD447B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_21FD48464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_21FD4B630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void BLSHGetRequestedFidelityForBacklightState(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void (**)(void, void))v6;
  if ((unint64_t)(a1 - 2) < 2)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 3);
    goto LABEL_9;
  }
  if (!a1) {
    goto LABEL_8;
  }
  if (a1 != 1) {
    goto LABEL_9;
  }
  if (([v5 isAlwaysOnEnabledForEnvironment] & 1) == 0)
  {
LABEL_8:
    v7[2](v7, 0);
    goto LABEL_9;
  }
  if (v5)
  {
    v8 = [v5 identifier];
    BLSEncode4Chars();
    uint64_t v9 = [v5 identifier];
    BLSEncode4Chars();
    kdebug_trace();

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __BLSHGetRequestedFidelityForBacklightState_block_invoke;
    v10[3] = &unk_264533C10;
    uint64_t v11 = v7;
    [v5 requestedFidelityForInactiveContentWithCompletion:v10];
  }
  else
  {
    v7[2](v7, 1);
  }
LABEL_9:
}

void __BLSHGetRequestedFidelityForBacklightState_block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __BLSHGetRequestedFidelityForBacklightState_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_21FD4F488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD50E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_4_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_5_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_21FD52EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_11_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x22u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x22u);
}

id BLSHSubhostedEnvironmentIdentifierForEnvironment(void *a1)
{
  uint64_t v1 = NSString;
  v2 = [a1 identifier];
  dispatch_time_t v3 = [v1 stringWithFormat:@"subhosted: %@", v2];

  return v3;
}

void sub_21FD5D428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD5D7B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21FD5E930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
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

void sub_21FD60740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

uint64_t BLSIs1HzFlipbookForEnvironment(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 is1HzFlipbook];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t BLSCacheFlipbookOnDisplayWakeForEnvironment(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 cacheFlipbookOnDisplayWake];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t BLSDefaultFidelityForBacklightState(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 isAlwaysOnEnabledForEnvironment];
  char v5 = [v3 isLiveUpdating];
  int v6 = [v3 hasUnrestrictedFramerateUpdates];
  int v7 = BLSIs1HzFlipbookForEnvironment(v3);

  uint64_t v8 = v4;
  if (a1 != 1) {
    uint64_t v8 = a1;
  }
  unint64_t v9 = v8 - 2;
  uint64_t v10 = 2;
  uint64_t v11 = 1;
  if (v6 | v7) {
    uint64_t v11 = 2;
  }
  if ((v5 & 1) == 0) {
    uint64_t v10 = v11;
  }
  if (v8 == 1) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v9 >= 2) {
    return v12;
  }
  else {
    return 3;
  }
}

id BLSVisualStateForBacklightState(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  unsigned int v12 = [v11 isAlwaysOnEnabledForEnvironment];
  char v13 = [v11 isLiveUpdating];
  int v14 = [v11 hasUnrestrictedFramerateUpdates];
  int v15 = BLSIs1HzFlipbookForEnvironment(v11);
  uint64_t v16 = BLSVisualStateForBacklightStateAndExplictOptions(a1, a2, v12, v13, v14, v15, v11, v10, v9);

  return v16;
}

id BLSVisualStateForBacklightStateAndExplictOptions(uint64_t a1, uint64_t a2, unsigned int a3, char a4, int a5, int a6, void *a7, void *a8, void *a9)
{
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = v18;
  uint64_t v20 = a3;
  if (a1 != 1) {
    uint64_t v20 = a1;
  }
  unint64_t v21 = v20 - 2;
  uint64_t v22 = 2;
  uint64_t v23 = 1;
  if (a5 | a6) {
    uint64_t v23 = 2;
  }
  if ((a4 & 1) == 0) {
    uint64_t v22 = v23;
  }
  unint64_t v24 = v20 - 1;
  if (v20 == 1) {
    uint64_t v25 = v22;
  }
  else {
    uint64_t v25 = 0;
  }
  if (v21 >= 2) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = 3;
  }
  if (v17)
  {
    if (!v18) {
      id v18 = (id)MEMORY[0x263EFF910];
    }
    v27 = [v18 now];
    uint64_t v26 = [v17 allowedFidelityAtDate:v27 forEnvironment:v16 expectedFidelity:v26];
  }
  if (v24 > 2)
  {
    uint64_t v29 = 0;
    uint64_t v28 = 1;
  }
  else
  {
    uint64_t v28 = qword_21FD8B468[v24];
    uint64_t v29 = qword_21FD8B480[v24];
  }
  if (v26 < a2) {
    a2 = v26;
  }
  v30 = (void *)[objc_alloc(MEMORY[0x263F299C0]) initWithActiveAppearance:v28 updateFidelity:a2 adjustedLuminance:v29 dimmed:a1 == 3];

  return v30;
}

id BLSVisualStateForBacklightStateAndSettings(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  unsigned int v13 = objc_msgSend(v12, "bls_isAlwaysOnEnabledForEnvironment");
  char v14 = objc_msgSend(v12, "bls_isLiveUpdating");
  int v15 = objc_msgSend(v12, "bls_hasUnrestrictedFramerateUpdates");

  int v16 = BLSIs1HzFlipbookForEnvironment(v11);
  id v17 = BLSVisualStateForBacklightStateAndExplictOptions(a1, 3, v13, v14, v15, v16, v11, v10, v9);

  return v17;
}

uint64_t __BLSHEncodePresentationTime_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  uint64_t v1 = BLSHEncodePresentationTime_calendar;
  BLSHEncodePresentationTime_calendar = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21FD65474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBLSBacklightBrightnessCurve(uint64_t a1)
{
  if (a1) {
    return @"AlwaysOn";
  }
  else {
    return @"Normal";
  }
}

void sub_21FD669C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD6CBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
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

void sub_21FD6D250(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Au);
}

void OUTLINED_FUNCTION_7_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void BLSHRecordCriticalAssertFailure(void *a1)
{
  void v10[4] = *MEMORY[0x263EF8340];
  id v1 = a1;
  v9[0] = @"BLSHCriticalAssertDidFailDate";
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  v10[0] = v2;
  v10[1] = v1;
  v9[1] = @"BLSHCriticalAssertDidFailDescription";
  v9[2] = @"BLSHCriticalAssertDidFailBuildVersion";
  id v3 = (void *)MGCopyAnswer();
  v10[2] = v3;
  v9[3] = @"BLSHCriticalAssertDidFailProcess";
  uint64_t v4 = [MEMORY[0x263F08AB0] processInfo];
  char v5 = [v4 processName];
  v10[3] = v5;
  int v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  int v7 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  [v7 setObject:v6 forKey:@"BLSHCriticalAssertDidFail"];

  uint64_t v8 = bls_diagnostics_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    BLSHRecordCriticalAssertFailure_cold_1((uint64_t)v1, v8);
  }
}

BOOL BLSHCheckForCriticalAssertFailureAndPrompt(int a1, void *a2)
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  char v5 = [v4 dictionaryForKey:@"BLSHCriticalAssertDidFail"];

  if (v5)
  {
    int v6 = [[BLSHCriticalAssertDidFailDetails alloc] initWithCriticalAssertDidFailDictionary:v5];
    int v7 = v6;
    if (a2)
    {
      *a2 = [(BLSHCriticalAssertDidFailDetails *)v6 explanation];
    }
    uint64_t v8 = bls_diagnostics_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      BLSHCheckForCriticalAssertFailureAndPrompt_cold_4(v7, v8);
    }

    if (!os_variant_has_internal_diagnostics() || !a1) {
      goto LABEL_18;
    }
    if (+[BLSHInternalTapToRadarIgnorer shouldIgnoreDesignation:2])
    {
      BLSHResetCriticalAssertFailure();
      id v9 = bls_diagnostics_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        BLSHCheckForCriticalAssertFailureAndPrompt_cold_1(v9);
      }
    }
    else
    {
      id v10 = [(BLSHCriticalAssertDidFailDetails *)v7 date];
      [v10 timeIntervalSinceNow];
      double v12 = v11;

      if (v12 >= -86400.0)
      {
        unsigned int v13 = bls_diagnostics_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          BLSHCheckForCriticalAssertFailureAndPrompt_cold_3(v13, v14, v15, v16, v17, v18, v19, v20);
        }

        _BLSHShowCriticalAssertFailureAlert(v7);
        goto LABEL_18;
      }
      BLSHResetCriticalAssertFailure();
      id v9 = bls_diagnostics_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        BLSHCheckForCriticalAssertFailureAndPrompt_cold_2(v7, v9);
      }
    }

LABEL_18:
  }

  return v5 != 0;
}

void _BLSHShowCriticalAssertFailureAlert(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 processName];
  id v3 = v2;
  if (v2)
  {
    id v33 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F08AB0] processInfo];
    id v33 = [v4 processName];
  }
  char v5 = NSString;
  int v6 = [v1 device];
  int v7 = [v1 buildVersion];
  uint64_t v8 = [v1 explanation];
  if ([v1 debugLogsEnabled]) {
    id v9 = @"with";
  }
  else {
    id v9 = @"without";
  }
  id v10 = [v1 date];
  double v11 = objc_msgSend(v10, "bls_loggingString");
  uint64_t v12 = [v5 stringWithFormat:@"%@/%@: BacklightServices %@ critical assert failed in %@ %@ debug logs at %@", v6, v7, v8, v33, v9, v11];
  v32 = (void *)v12;

  unsigned int v13 = NSString;
  if ([v1 debugLogsEnabled]) {
    uint64_t v14 = @"with";
  }
  else {
    uint64_t v14 = @"without";
  }
  uint64_t v15 = [v1 date];
  uint64_t v16 = objc_msgSend(v15, "bls_loggingString");
  uint64_t v17 = [v1 buildVersion];
  uint64_t v18 = [v1 explanation];
  uint64_t v19 = [v13 stringWithFormat:@"BacklightServices critical assert failed in %@ %@ debug logs at %@ on %@\n\nExplanation: %@", v33, v14, v16, v17, v18];

  uint64_t v20 = [[BLSHTapToRadarDescriptor alloc] initWithDesignation:2 radarTitle:v12 radarDescription:v19];
  unint64_t v21 = [v1 date];
  [(BLSHTapToRadarDescriptor *)v20 setTimeOfIssue:v21];

  uint64_t v22 = NSString;
  if ([v1 debugLogsEnabled]) {
    uint64_t v23 = @"with";
  }
  else {
    uint64_t v23 = @"without";
  }
  unint64_t v24 = [v1 date];
  uint64_t v25 = objc_msgSend(v24, "bls_loggingString");
  uint64_t v26 = [v1 buildVersion];
  v27 = [v1 explanation];

  uint64_t v28 = [v22 stringWithFormat:@"%@ abort: BacklightServices critical assert failed %@ debug logs at %@ on %@:\"%@\".\nPlease file a radar against BacklightServices | All with a sysdiagnose.\n\nTo disable this prompt from CLI:\n\nlogin -f mobile defaults write com.apple.BacklightServices IgnoredTapToRadarDesignations -array -int 0", v33, v23, v25, v26, v27];
  [(BLSHTapToRadarDescriptor *)v20 setTtrPromptMessage:v28];

  uint64_t v29 = [NSString stringWithFormat:@"BacklightServices critical assert failed in %@", v33];
  [(BLSHTapToRadarDescriptor *)v20 setTtrDisplayReason:v29];

  v30 = +[BLSHInternalTapToRadarManager sharedTapToRadarManager];
  v31 = bls_diagnostics_log();
  [v30 requestTapToRadar:v20 log:v31 completion:&__block_literal_global_28];
}

void BLSHResetCriticalAssertFailure()
{
  id v0 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  [v0 removeObjectForKey:@"BLSHCriticalAssertDidFail"];
}

BOOL _blsCriticalAssertLockStatusDidChange()
{
  id v0 = bls_diagnostics_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    _blsCriticalAssertLockStatusDidChange_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v9 = (const void *)objc_opt_class();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v9, @"com.apple.mobile.keybagd.lock_status", 0);
  return BLSHCheckForCriticalAssertFailureAndPrompt(1, 0);
}

BOOL BLSHIsUnitTestRunning()
{
  Class v0 = NSClassFromString(&cfstr_Xctestprobe.isa);
  if (!v0) {
    return 0;
  }
  uint64_t v1 = [(objc_class *)v0 valueForKey:@"isTesting"];
  BOOL v2 = v1 != 0;

  return v2;
}

void sub_21FD7039C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v26);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak((id *)(v27 - 104));
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

void sub_21FD706EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

uint64_t _triggerTestWatchdog(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_triggerTestWatchdog:");
}

void sub_21FD72C70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
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

void _BLSHShowWatchdogFailureAlert(void *a1, int a2, int a3)
{
  id v3 = a1;
  uint64_t v4 = (void *)MGCopyAnswer();
  uint64_t v5 = (void *)[v4 copy];

  if ([v5 hasSuffix:@"AP"])
  {
    uint64_t v6 = [v5 substringToIndex:objc_msgSend(v5, "length") - objc_msgSend(@"AP", "length")];

    uint64_t v5 = (void *)v6;
  }
  uint64_t v7 = (void *)MGCopyAnswer();
  uint64_t v8 = (void *)[v7 copy];

  id v9 = [v3 radarTitle];
  char v10 = [v9 containsString:v5];

  if ((v10 & 1) == 0)
  {
    double v11 = NSString;
    uint64_t v12 = [v3 radarTitle];
    unsigned int v13 = [v11 stringWithFormat:@"%@%@ - %@", v5, v8, v12];
    [v3 setRadarTitle:v13];
  }
  v40 = v5;
  uint64_t v14 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v15 = [v14 processName];

  uint64_t v16 = bls_backlight_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

  uint64_t v18 = [BLSHTapToRadarDescriptor alloc];
  uint64_t v19 = [v3 radarTitle];
  uint64_t v20 = [v3 radarDescription];
  unint64_t v21 = [(BLSHTapToRadarDescriptor *)v18 initWithDesignation:1 radarTitle:v19 radarDescription:v20];

  uint64_t v22 = [v3 timeOfIssue];
  [(BLSHTapToRadarDescriptor *)v21 setTimeOfIssue:v22];

  uint64_t v23 = NSString;
  unint64_t v24 = [v3 identifier];
  if (v17) {
    uint64_t v25 = @"with";
  }
  else {
    uint64_t v25 = @"without";
  }
  uint64_t v26 = [v3 timeOfIssue];
  uint64_t v27 = objc_msgSend(v26, "bls_loggingString");
  uint64_t v28 = [v23 stringWithFormat:@"%@ abort: BacklightServices %@ watchdog failed %@ debug logs at %@ on %@.\nPlease file a radar against BacklightServices | All with a sysdiagnose.", v15, v24, v25, v27, v8];
  [(BLSHTapToRadarDescriptor *)v21 setTtrPromptMessage:v28];

  uint64_t v29 = NSString;
  v30 = [v3 displayReason];
  v31 = [v29 stringWithFormat:@"%@ in %@", v30, v15];
  [(BLSHTapToRadarDescriptor *)v21 setTtrDisplayReason:v31];

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = ___BLSHShowWatchdogFailureAlert_block_invoke;
  v47[3] = &unk_2645322A8;
  id v32 = v3;
  id v48 = v32;
  char v49 = a2;
  id v33 = (void (**)(void))MEMORY[0x223C5E2B0](v47);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = ___BLSHShowWatchdogFailureAlert_block_invoke_111;
  v45[3] = &unk_264532258;
  id v34 = v32;
  id v46 = v34;
  uint64_t v35 = MEMORY[0x223C5E2B0](v45);
  v36 = (void *)v35;
  if (a2)
  {
    v33[2](v33);
  }
  else if (a3)
  {
    (*(void (**)(uint64_t))(v35 + 16))(v35);
  }
  else
  {
    v37 = +[BLSHInternalTapToRadarManager sharedTapToRadarManager];
    v38 = bls_diagnostics_log();
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = ___BLSHShowWatchdogFailureAlert_block_invoke_2;
    v42[3] = &unk_264534620;
    v43 = v33;
    id v44 = v36;
    [v37 requestTapToRadar:v21 log:v38 completion:v42];
  }
}

void _blsWatchdogTimerLockStatusDidChange()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  Class v0 = bls_diagnostics_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    _blsWatchdogTimerLockStatusDidChange_cold_1(v0);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  BOOL v2 = (const void *)objc_opt_class();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v2, @"com.apple.mobile.keybagd.lock_status", 0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = objc_msgSend((id)__blsh_ttrwatchdog_lastFailureDetails, "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        _BLSHShowWatchdogFailureAlert(*(void *)(*((void *)&v8 + 1) + 8 * v7++), 0, 0);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_21FD74C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void BLSBacklightStateForBLSBacklightDisplayMode_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "Unexpected display mode:%ld", (uint8_t *)&v2, 0xCu);
}

void _blsAlertCallback_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "Got unpexpected response in _blsAlertCallback(): %lu", (uint8_t *)&v2, 0xCu);
}

void _blsWatchdogLockStatusDidChange_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_21FCFC000, v0, v1, "_blsWatchdogLockStatusDidChange: will stop listening for kMobileKeyBagLockStatusNotificationID and check for BLS watchdog", v2, v3, v4, v5, v6);
}

void BLSHRecordCriticalAssertFailure_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "BLSHCriticalAssert failure: %{public}@", (uint8_t *)&v2, 0xCu);
}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  int v2 = @"BLSHCriticalAssertDidFail";
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "not prompting to file radars for BLS critical assert failures on this device due to user preferences so clearing %@{public}@", (uint8_t *)&v1, 0xCu);
}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 date];
  uint64_t v4 = objc_msgSend(v3, "bls_loggingString");
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "not prompting to file radar for BLS critical assert failure from %{public}@ because it's too old", (uint8_t *)&v5, 0xCu);
}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void BLSHCheckForCriticalAssertFailureAndPrompt_cold_4(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 date];
  int v5 = objc_msgSend(v4, "bls_loggingString");
  uint8_t v6 = [a1 buildVersion];
  uint64_t v7 = [a1 explanation];
  int v8 = 138543874;
  long long v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "BLSH Critical Assert did fail at %{public}@ on build %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
}

void _blsCriticalAssertLockStatusDidChange_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _blsWatchdogTimerLockStatusDidChange_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "_blsWatchdogTimerLockStatusDidChange: will stop listening for kMobileKeyBagLockStatusNotificationID and check for stored failed watchdog details", v1, 2u);
}

uint64_t BKSHIDServicesGetBacklightFactor()
{
  return MEMORY[0x270F104F8]();
}

uint64_t BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync()
{
  return MEMORY[0x270F10530]();
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationAsync()
{
  return MEMORY[0x270F10558]();
}

uint64_t BLSBacklightActivityStateForBLSBacklightState()
{
  return MEMORY[0x270F10590]();
}

uint64_t BLSBacklightFBSSceneEnvironmentDeltaDescription()
{
  return MEMORY[0x270F10598]();
}

uint64_t BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable()
{
  return MEMORY[0x270F105A0]();
}

uint64_t BLSBacklightStateForVisuaState()
{
  return MEMORY[0x270F105A8]();
}

uint64_t BLSBacklightStateIsActive()
{
  return MEMORY[0x270F105B0]();
}

uint64_t BLSDeviceSupports1HzFlipbook()
{
  return MEMORY[0x270F105B8]();
}

uint64_t BLSEncode4Chars()
{
  return MEMORY[0x270F105C0]();
}

uint64_t BLSLoggingStringForContinuousMachTime()
{
  return MEMORY[0x270F105C8]();
}

uint64_t BLSLoggingStringForMachTime()
{
  return MEMORY[0x270F105D0]();
}

uint64_t BLSMachContinuousTimeFromMachAbsoluteTime()
{
  return MEMORY[0x270F105D8]();
}

uint64_t BLSMachTimeFromNSTimeInterval()
{
  return MEMORY[0x270F105E0]();
}

uint64_t BLSShortLoggingStringForContinuousMachTime()
{
  return MEMORY[0x270F105E8]();
}

uint64_t BLSShortLoggingStringForMachTime()
{
  return MEMORY[0x270F105F0]();
}

uint64_t BLSStateDataWithTitleDescriptionAndHints()
{
  return MEMORY[0x270F105F8]();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x270F106E8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x270F10770]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSIsBeingDebugged()
{
  return MEMORY[0x270F10860]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x270F10978]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A28](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSStringFromBLSAlwaysOnSuppressionReason()
{
  return MEMORY[0x270F10600]();
}

uint64_t NSStringFromBLSAlwaysOnSuppressionType()
{
  return MEMORY[0x270F10608]();
}

uint64_t NSStringFromBLSAssertingObject()
{
  return MEMORY[0x270F10610]();
}

uint64_t NSStringFromBLSBacklightActivityState()
{
  return MEMORY[0x270F10618]();
}

uint64_t NSStringFromBLSBacklightChangeEvents()
{
  return MEMORY[0x270F10620]();
}

uint64_t NSStringFromBLSBacklightChangeSourceEvent()
{
  return MEMORY[0x270F10628]();
}

uint64_t NSStringFromBLSBacklightState()
{
  return MEMORY[0x270F10630]();
}

uint64_t NSStringFromBLSFlipbookState()
{
  return MEMORY[0x270F10638]();
}

uint64_t NSStringFromBLSUpdateFidelity()
{
  return MEMORY[0x270F10640]();
}

uint64_t NSStringFromCADisplayState()
{
  return MEMORY[0x270EFB998]();
}

uint64_t NSStringFromCADisplayStateTransitionStatus()
{
  return MEMORY[0x270EFB9A0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t OSLogFlushBuffers()
{
  return MEMORY[0x270F47B48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
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

uint64_t abort_with_payload()
{
  return MEMORY[0x270ED8460]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x270ED8468]();
}

uint64_t bls_assertions_log()
{
  return MEMORY[0x270F10648]();
}

uint64_t bls_backlight_log()
{
  return MEMORY[0x270F10650]();
}

uint64_t bls_budget_log()
{
  return MEMORY[0x270F10658]();
}

uint64_t bls_diagnostics_log()
{
  return MEMORY[0x270F10660]();
}

uint64_t bls_environment_log()
{
  return MEMORY[0x270F10668]();
}

uint64_t bls_flipbook_log()
{
  return MEMORY[0x270F10670]();
}

uint64_t bls_scenes_log()
{
  return MEMORY[0x270F10678]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
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
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x270ED9600]();
}

BOOL dlopen_preflight(const char *__path)
{
  return MEMORY[0x270ED9638](__path);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

int reboot_np(int howto, const char *message)
{
  return MEMORY[0x270EDB188](*(void *)&howto, message);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

uint64_t tailspin_dump_output_with_options()
{
  return MEMORY[0x270F9B9A8]();
}