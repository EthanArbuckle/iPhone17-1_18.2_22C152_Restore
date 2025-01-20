id _AALogSystem()
{
  void *v0;
  uint64_t vars8;

  if (_AALogSystem_onceToken != -1) {
    dispatch_once(&_AALogSystem_onceToken, &__block_literal_global);
  }
  v0 = (void *)_AALogSystem_log;

  return v0;
}

id _AAURLSessionCreateSession(void *a1, void *a2, uint64_t a3, char a4)
{
  id v7 = a1;
  id v8 = a2;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURLSession * _Nonnull _AAURLSessionCreateSession(id<NSURLSessionDelegate>  _Nonnull __strong, dispatch_queue_t  _Nonnull __strong, BOOL, BOOL)");
    [v16 handleFailureInFunction:v17, @"AAURLSession.m", 78, @"Invalid parameter not satisfying: %@", @"delegate" file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURLSession * _Nonnull _AAURLSessionCreateSession(id<NSURLSessionDelegate>  _Nonnull __strong, dispatch_queue_t  _Nonnull __strong, BOOL, BOOL)");
  [v18 handleFailureInFunction:v19, @"AAURLSession.m", 79, @"Invalid parameter not satisfying: %@", @"delegateQueue" file lineNumber description];

LABEL_3:
  id v10 = [[AAURLSessionContext alloc] initRequiringSigning:a3];
  v11 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  [v11 setWaitsForConnectivity:1];
  [v11 setTimeoutIntervalForResource:60.0];
  v12 = _AAURLSessionSharedCache(a4);
  [v11 setURLCache:v12];

  objc_msgSend(v11, "aa_registerProtocolClass:", objc_opt_class());
  objc_msgSend(v11, "set_appleIDContext:", v10);
  v13 = objc_msgSend(MEMORY[0x1E4F28F08], "aa_operationQueueWithUnderlyingQueue:", v9);
  v14 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v11 delegate:v7 delegateQueue:v13];

  return v14;
}

id _AAURLSessionSharedCache(char a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AAURLSessionSharedCache_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v4 = a1;
  if (_AAURLSessionSharedCache_onceToken != -1) {
    dispatch_once(&_AAURLSessionSharedCache_onceToken, block);
  }
  v1 = (void *)_AAURLSessionSharedCache_sharedCache;

  return v1;
}

id _AADeviceListLogSystem()
{
  if (_AADeviceListLogSystem_onceToken != -1) {
    dispatch_once(&_AADeviceListLogSystem_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)_AADeviceListLogSystem_log;

  return v0;
}

id _AASignpostLogSystem()
{
  if (_AASignpostLogSystem_onceToken != -1) {
    dispatch_once(&_AASignpostLogSystem_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)_AASignpostLogSystem_log;

  return v0;
}

id _AAAccountStoreLogSystem()
{
  if (_AAAccountStoreLogSystem_onceToken != -1) {
    dispatch_once(&_AAAccountStoreLogSystem_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)_AAAccountStoreLogSystem_log;

  return v0;
}

os_signpost_id_t _AASignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

unint64_t _AASignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  if (_AASignpostGetNanoseconds_onceToken != -1) {
    dispatch_once(&_AASignpostGetNanoseconds_onceToken, &__block_literal_global_34);
  }
  uint64_t v3 = mach_continuous_time();
  LODWORD(v4) = _AASignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1EB48BAF4;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

void sub_1A11DF214(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A11E05B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A11E8028(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A11EB024(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_1A11ED520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1A11F0C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A11F43D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A11FD61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A11FD9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A11FDD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A11FF9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_1A1200490(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A1201E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
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

void sub_1A1202420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A1204340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLFollowUpActionClass()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getFLFollowUpActionClass_softClass;
  uint64_t v7 = getFLFollowUpActionClass_softClass;
  if (!getFLFollowUpActionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpActionClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getFLFollowUpActionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A12046D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLFollowUpItemClass()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getFLFollowUpItemClass_softClass;
  uint64_t v7 = getFLFollowUpItemClass_softClass;
  if (!getFLFollowUpItemClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpItemClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getFLFollowUpItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A12047BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLGroupIdentifierAccount()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getFLGroupIdentifierAccountSymbolLoc_ptr;
  uint64_t v7 = getFLGroupIdentifierAccountSymbolLoc_ptr;
  if (!getFLGroupIdentifierAccountSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v5[3] = (uint64_t)dlsym(v1, "FLGroupIdentifierAccount");
    getFLGroupIdentifierAccountSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getFLGroupIdentifierAccount_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A12048C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _AAFollowUpControllerHandleSetupAssistantExited(__CFNotificationCenter *a1, const void *a2, const __CFString *a3, const void *a4)
{
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Received SetupAssistantExited notification, re-posting VerifyTerms follow up!", buf, 2u);
  }

  uint64_t v9 = objc_alloc_init(AAFollowUpController);
  id v10 = AAFollowUpIdentifierVerifyTerms[0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___AAFollowUpControllerHandleSetupAssistantExited_block_invoke;
  v12[3] = &unk_1E5A49018;
  v13 = v9;
  v11 = v9;
  [(AAFollowUpController *)v11 pendingFollowUpWithIdentifier:v10 completion:v12];
  CFNotificationCenterRemoveObserver(a1, a2, a3, a4);
}

id getFLFollowUpNotificationClass()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getFLFollowUpNotificationClass_softClass;
  uint64_t v7 = getFLFollowUpNotificationClass_softClass;
  if (!getFLFollowUpNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpNotificationClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getFLFollowUpNotificationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A1204FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionForce()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getFLNotificationOptionForceSymbolLoc_ptr;
  uint64_t v7 = getFLNotificationOptionForceSymbolLoc_ptr;
  if (!getFLNotificationOptionForceSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v5[3] = (uint64_t)dlsym(v1, "FLNotificationOptionForce");
    getFLNotificationOptionForceSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getFLNotificationOptionForce_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A12050EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionSpringboardAlert()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getFLNotificationOptionSpringboardAlertSymbolLoc_ptr;
  uint64_t v7 = getFLNotificationOptionSpringboardAlertSymbolLoc_ptr;
  if (!getFLNotificationOptionSpringboardAlertSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v5[3] = (uint64_t)dlsym(v1, "FLNotificationOptionSpringboardAlert");
    getFLNotificationOptionSpringboardAlertSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getFLNotificationOptionSpringboardAlert_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A12051F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionLockscreen()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getFLNotificationOptionLockscreenSymbolLoc_ptr;
  uint64_t v7 = getFLNotificationOptionLockscreenSymbolLoc_ptr;
  if (!getFLNotificationOptionLockscreenSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v5[3] = (uint64_t)dlsym(v1, "FLNotificationOptionLockscreen");
    getFLNotificationOptionLockscreenSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getFLNotificationOptionLockscreen_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A1205A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionBannerAlert()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  uint64_t v7 = getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  if (!getFLNotificationOptionBannerAlertSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v5[3] = (uint64_t)dlsym(v1, "FLNotificationOptionBannerAlert");
    getFLNotificationOptionBannerAlertSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getFLNotificationOptionBannerAlert_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A1208BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1209000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_1A1209638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1209B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A120B210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A120B748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A120C77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpControllerClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFLFollowUpControllerClass_block_invoke_cold_1();
  }
  getFLFollowUpControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreFollowUpLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreFollowUpLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreFollowUpLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5A48FB8;
    uint64_t v4 = 0;
    CoreFollowUpLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreFollowUpLibraryCore_frameworkLibrary;
  if (!CoreFollowUpLibraryCore_frameworkLibrary) {
    CoreFollowUpLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreFollowUpLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreFollowUpLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getFLFollowUpActionClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFLFollowUpActionClass_block_invoke_cold_1();
  }
  getFLFollowUpActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFLFollowUpItemClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFLFollowUpItemClass_block_invoke_cold_1();
  }
  getFLFollowUpItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLGroupIdentifierAccountSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLGroupIdentifierAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLGroupIdentifierAccountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFLFollowUpNotificationClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFLFollowUpNotificationClass_block_invoke_cold_1();
  }
  getFLFollowUpNotificationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLNotificationOptionForceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionForce");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionForceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLNotificationOptionSpringboardAlertSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionSpringboardAlert");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionSpringboardAlertSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLNotificationOptionLockscreenSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionLockscreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionLockscreenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLNotificationOptionBannerAlertSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionBannerAlert");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionBannerAlertSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A120E660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreCDPLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __CoreCDPLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5A49038;
    uint64_t v6 = 0;
    CoreCDPLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)CoreCDPLibraryCore_frameworkLibrary;
  if (!CoreCDPLibraryCore_frameworkLibrary) {
    __getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "kCDPRTCEventCategoryAccountDataAccessRecovery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

uint64_t __CoreCDPLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreCDPLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t AKTrustedContactStatusFromAATrustedContactStatus(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5) {
    return -1;
  }
  return result;
}

id _AAErrorUnderlyingError(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  uint64_t v2 = [v1 userInfo];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    _AAErrorUnderlyingError(v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v1;
  }
  uint64_t v6 = v5;

  return v6;
}

id AADeviceLocStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v3 = v1;
  if (_AADeviceModel_onceToken != -1) {
    dispatch_once(&_AADeviceModel_onceToken, &__block_literal_global_51);
  }
  uint64_t v4 = _AADeviceClassToKey_onceToken;
  id v5 = (id)_AADeviceModel_deviceModel;
  if (v4 != -1) {
    dispatch_once(&_AADeviceClassToKey_onceToken, &__block_literal_global_11);
  }
  uint64_t v6 = [(id)_AADeviceClassToKey_deviceMapping objectForKeyedSubscript:v5];

  uint64_t v7 = @"DEFAULT";
  if (v6) {
    uint64_t v7 = v6;
  }
  id v8 = v7;

  uint64_t v9 = [NSString stringWithFormat:@"%@_%@", v3, v8];

  uint64_t v10 = [v2 localizedStringForKey:v9 value:0 table:@"Localizable"];

  return v10;
}

void sub_1A1212450(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A12139E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
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

void sub_1A121600C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_1A1216984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

id AALocalizedStringForServiceType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F4D8E8]])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v3 = v2;
    uint64_t v4 = @"SERVICE_TYPE_ICLOUD";
LABEL_11:
    id v5 = [v2 localizedStringForKey:v4 value:0 table:@"Localizable"];

    goto LABEL_12;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F4D908]])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v3 = v2;
    uint64_t v4 = @"SERVICE_TYPE_STORE";
    goto LABEL_11;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F4D900]])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v3 = v2;
    uint64_t v4 = @"SERVICE_TYPE_IMESSAGE";
    goto LABEL_11;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F4D8F0]])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v3 = v2;
    uint64_t v4 = @"SERVICE_TYPE_FACETIME";
    goto LABEL_11;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F4D8F8]])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v3 = v2;
    uint64_t v4 = @"SERVICE_TYPE_GAMECENTER";
    goto LABEL_11;
  }
  id v5 = 0;
LABEL_12:

  return v5;
}

id _AANotificationQueue()
{
  if (_AANotificationQueue_onceToken != -1) {
    dispatch_once(&_AANotificationQueue_onceToken, &__block_literal_global_14);
  }
  uint64_t v0 = (void *)_AANotificationQueue_queue;

  return v0;
}

id _AANotificationHandlerMap()
{
  if (_AANotificationHandlerMap_onceToken != -1) {
    dispatch_once(&_AANotificationHandlerMap_onceToken, &__block_literal_global_37);
  }
  uint64_t v0 = (void *)_AANotificationHandlerMap_map;

  return v0;
}

void _AACFNotificationCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _AANotificationQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___AACFNotificationCallback_block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void sub_1A121A4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMSCriterionClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMSCriterionClass_softClass;
  uint64_t v7 = getMSCriterionClass_softClass;
  if (!getMSCriterionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMSCriterionClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getMSCriterionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A121A5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMSCriterionQualifierContains()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getMSCriterionQualifierContainsSymbolLoc_ptr;
  uint64_t v7 = getMSCriterionQualifierContainsSymbolLoc_ptr;
  if (!getMSCriterionQualifierContainsSymbolLoc_ptr)
  {
    id v1 = (void *)MailServicesLibrary();
    v5[3] = (uint64_t)dlsym(v1, "MSCriterionQualifierContains");
    getMSCriterionQualifierContainsSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMSCriterionQualifierContains_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A121A6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMSResultsKeyDateSent()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getMSResultsKeyDateSentSymbolLoc_ptr;
  uint64_t v7 = getMSResultsKeyDateSentSymbolLoc_ptr;
  if (!getMSResultsKeyDateSentSymbolLoc_ptr)
  {
    id v1 = (void *)MailServicesLibrary();
    v5[3] = (uint64_t)dlsym(v1, "MSResultsKeyDateSent");
    getMSResultsKeyDateSentSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMSResultsKeyDateSent_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A121A7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMSCriterionClass_block_invoke(uint64_t a1)
{
  MailServicesLibrary();
  Class result = objc_getClass("MSCriterion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMSCriterionClass_block_invoke_cold_1();
  }
  getMSCriterionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MailServicesLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!MailServicesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __MailServicesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5A49B38;
    uint64_t v4 = 0;
    MailServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MailServicesLibraryCore_frameworkLibrary;
  if (!MailServicesLibraryCore_frameworkLibrary) {
    MailServicesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __MailServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MailServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMSCriterionTypeSenderSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MailServicesLibrary();
  uint64_t result = dlsym(v2, "MSCriterionTypeSender");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSCriterionTypeSenderSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMSCriterionQualifierContainsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MailServicesLibrary();
  uint64_t result = dlsym(v2, "MSCriterionQualifierContains");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSCriterionQualifierContainsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMSCriterionTypeAnyRecipientSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MailServicesLibrary();
  uint64_t result = dlsym(v2, "MSCriterionTypeAnyRecipient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSCriterionTypeAnyRecipientSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMSResultsKeySenderSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MailServicesLibrary();
  uint64_t result = dlsym(v2, "MSResultsKeySender");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSResultsKeySenderSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMSResultsKeySubjectSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MailServicesLibrary();
  uint64_t result = dlsym(v2, "MSResultsKeySubject");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSResultsKeySubjectSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMSResultsKeyDateSentSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MailServicesLibrary();
  uint64_t result = dlsym(v2, "MSResultsKeyDateSent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMSResultsKeyDateSentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMSSearchClass_block_invoke(uint64_t a1)
{
  MailServicesLibrary();
  Class result = objc_getClass("MSSearch");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMSSearchClass_block_invoke_cold_1();
  }
  getMSSearchClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCDPTermsInfoBackupControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCDPTermsInfoBackupControllerClass_softClass;
  uint64_t v7 = getCDPTermsInfoBackupControllerClass_softClass;
  if (!getCDPTermsInfoBackupControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCDPTermsInfoBackupControllerClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getCDPTermsInfoBackupControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A121CA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A121D598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getCDPTermsInfoBackupControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreCDPLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreCDPLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5A49C10;
    uint64_t v5 = 0;
    CoreCDPLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoreCDPLibraryCore_frameworkLibrary_0) {
    __getCDPTermsInfoBackupControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CDPTermsInfoBackupController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCDPTermsInfoBackupControllerClass_block_invoke_cold_2();
  }
  getCDPTermsInfoBackupControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreCDPLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreCDPLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getBYLicenseAgreementClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary();
  Class result = objc_getClass("BYLicenseAgreement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBYLicenseAgreementClass_block_invoke_cold_1();
  }
  getBYLicenseAgreementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void SetupAssistantLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __SetupAssistantLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5A49C28;
    uint64_t v2 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    SetupAssistantLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBYWarrantyClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary();
  Class result = objc_getClass("BYWarranty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBYWarrantyClass_block_invoke_cold_1();
  }
  getBYWarrantyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A121E7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A121ED80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A121EF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCIContextClass_block_invoke(uint64_t a1)
{
  CoreImageLibrary();
  Class result = objc_getClass("CIContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCIContextClass_block_invoke_cold_1();
  }
  getCIContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreImageLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __CoreImageLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5A49CB0;
    uint64_t v2 = 0;
    CoreImageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreImageLibraryCore_frameworkLibrary) {
    CoreImageLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __CoreImageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreImageLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCIFilterClass_block_invoke(uint64_t a1)
{
  CoreImageLibrary();
  Class result = objc_getClass("CIFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCIFilterClass_block_invoke_cold_1();
  }
  getCIFilterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A122323C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_1A1226F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    uint64_t v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v12 reason];
      -[NSMutableURLRequest(AppleAccount) aa_setJSONBodyWithParameters:](v14, v11, &buf, v13);
    }

    objc_end_catch();
    JUMPOUT(0x1A1226F00);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A1229E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1A122A4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A122AA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

Class __getACDPluginLoaderClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AccountsDaemonLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AccountsDaemonLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5A49F40;
    uint64_t v5 = 0;
    AccountsDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccountsDaemonLibraryCore_frameworkLibrary) {
    __getACDPluginLoaderClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("ACDPluginLoader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACDPluginLoaderClass_block_invoke_cold_2();
  }
  getACDPluginLoaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccountsDaemonLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccountsDaemonLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A122BFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
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

void sub_1A122C624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122CC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122D290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122D88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122DE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122E44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122EA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122F014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122F60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A122FC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A123025C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1230828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1230E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1231440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1231A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1231FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1232608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1232C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v14 - 120));
  _Unwind_Resume(a1);
}

void sub_1A1236C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1237050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SetupAssistantLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SetupAssistantLibraryCore_frameworkLibrary_0;
  uint64_t v5 = SetupAssistantLibraryCore_frameworkLibrary_0;
  if (!SetupAssistantLibraryCore_frameworkLibrary_0)
  {
    long long v6 = xmmword_1E5A4A3E0;
    long long v7 = *(_OWORD *)&off_1E5A4A3F0;
    v3[3] = _sl_dlopen();
    SetupAssistantLibraryCore_frameworkLibrary_0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1A123A984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SetupAssistantLibraryCore_block_invoke_0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SetupAssistantLibraryCore_frameworkLibrary_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary_0()
{
  long long v1 = 0;
  uint64_t result = SetupAssistantLibraryCore();
  if (!result) {
    SetupAssistantLibrary_cold_1_0(&v1);
  }
  return result;
}

uint64_t getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc_ptr;
  uint64_t v6 = getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc_ptr;
  if (!getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc_ptr)
  {
    long long v1 = (void *)SetupAssistantLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantIsRunningSilentTokenUpgrade");
    getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123AB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SetupAssistantLibrary_0();
  uint64_t result = dlsym(v2, "BYSetupAssistantIsRunningSilentTokenUpgrade");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t SBYSetupAssistantIsRunningSilentTokenUpgrade()
{
  IsRunningSilentTokenUpgradeSymbolLoc = (uint64_t (*)(void))getBYSetupAssistantIsRunningSilentTokenUpgradeSymbolLoc();
  if (!IsRunningSilentTokenUpgradeSymbolLoc) {
    SBYSetupAssistantIsRunningSilentTokenUpgrade_cold_1();
  }

  return IsRunningSilentTokenUpgradeSymbolLoc();
}

uint64_t getBYSetupAssistantHasCompletedInitialRunSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
  uint64_t v6 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
  if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
  {
    long long v1 = (void *)SetupAssistantLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantHasCompletedInitialRun");
    getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123ACC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SetupAssistantLibrary_0();
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SBYSetupAssistantHasCompletedInitialRun()
{
  HasCompletedInitialRunSymbolLoc = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc();
  if (!HasCompletedInitialRunSymbolLoc) {
    SBYSetupAssistantHasCompletedInitialRun_cold_1();
  }

  return HasCompletedInitialRunSymbolLoc();
}

id getBYFlowSkipControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBYFlowSkipControllerClass_softClass;
  uint64_t v7 = getBYFlowSkipControllerClass_softClass;
  if (!getBYFlowSkipControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBYFlowSkipControllerClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getBYFlowSkipControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A123AE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBYFlowSkipControllerClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary_0();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBYFlowSkipControllerClass_block_invoke_cold_1();
  }
  getBYFlowSkipControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getBYFlowSkipIdentifierAppleIDSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getBYFlowSkipIdentifierAppleIDSymbolLoc_ptr;
  uint64_t v6 = getBYFlowSkipIdentifierAppleIDSymbolLoc_ptr;
  if (!getBYFlowSkipIdentifierAppleIDSymbolLoc_ptr)
  {
    id v1 = (void *)SetupAssistantLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "BYFlowSkipIdentifierAppleID");
    getBYFlowSkipIdentifierAppleIDSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123AF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYFlowSkipIdentifierAppleIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SetupAssistantLibrary_0();
  Class result = dlsym(v2, "BYFlowSkipIdentifierAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYFlowSkipIdentifierAppleIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getBYFlowSkipIdentifierAppleID()
{
  BYFlowSkipIdentifierAppleIDSymbolLoc = (void **)getBYFlowSkipIdentifierAppleIDSymbolLoc();
  if (!BYFlowSkipIdentifierAppleIDSymbolLoc) {
    getBYFlowSkipIdentifierAppleID_cold_1();
  }
  id v1 = *BYFlowSkipIdentifierAppleIDSymbolLoc;

  return v1;
}

void sub_1A123B46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCDPRTCClientTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreCDPLibrary();
  Class result = dlsym(v2, "kCDPRTCClientType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCDPRTCClientTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreCDPLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreCDPLibraryCore_frameworkLibrary_1)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreCDPLibraryCore_block_invoke_1;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5A4A428;
    uint64_t v4 = 0;
    CoreCDPLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = CoreCDPLibraryCore_frameworkLibrary_1;
  if (!CoreCDPLibraryCore_frameworkLibrary_1) {
    CoreCDPLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreCDPLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CoreCDPLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getkCDPRTCClientNameDNUSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreCDPLibrary();
  uint64_t result = dlsym(v2, "kCDPRTCClientNameDNU");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCDPRTCClientNameDNUSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t IDSLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  long long v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = IDSLibraryCore_frameworkLibrary;
  uint64_t v5 = IDSLibraryCore_frameworkLibrary;
  if (!IDSLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E5A4A528;
    long long v7 = *(_OWORD *)&off_1E5A4A538;
    v3[3] = _sl_dlopen();
    IDSLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1A123E474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IDSLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  IDSLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IDSLibrary()
{
  id v1 = 0;
  uint64_t result = IDSLibraryCore();
  if (!result) {
    IDSLibrary_cold_1(&v1);
  }
  return result;
}

id getIDSServiceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIDSServiceClass_softClass;
  uint64_t v7 = getIDSServiceClass_softClass;
  if (!getIDSServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIDSServiceClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getIDSServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A123E63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIDSServiceClass_block_invoke(uint64_t a1)
{
  IDSLibrary();
  Class result = objc_getClass("IDSService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIDSServiceClass_block_invoke_cold_1();
  }
  getIDSServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getIDSIDQueryControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIDSIDQueryControllerClass_softClass;
  uint64_t v7 = getIDSIDQueryControllerClass_softClass;
  if (!getIDSIDQueryControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIDSIDQueryControllerClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getIDSIDQueryControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A123E778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIDSIDQueryControllerClass_block_invoke(uint64_t a1)
{
  IDSLibrary();
  Class result = objc_getClass("IDSIDQueryController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIDSIDQueryControllerClass_block_invoke_cold_1();
  }
  getIDSIDQueryControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getIDSServiceDelegatePropertiesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIDSServiceDelegatePropertiesClass_softClass;
  uint64_t v7 = getIDSServiceDelegatePropertiesClass_softClass;
  if (!getIDSServiceDelegatePropertiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIDSServiceDelegatePropertiesClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getIDSServiceDelegatePropertiesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A123E8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIDSServiceDelegatePropertiesClass_block_invoke(uint64_t a1)
{
  IDSLibrary();
  Class result = objc_getClass("IDSServiceDelegateProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIDSServiceDelegatePropertiesClass_block_invoke_cold_1();
  }
  getIDSServiceDelegatePropertiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc_ptr;
  uint64_t v6 = getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc_ptr;
  if (!getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IDSSendMessageOptionExpectsPeerResponseKey");
    getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123E9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IDSLibrary();
  Class result = dlsym(v2, "IDSSendMessageOptionExpectsPeerResponseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getIDSSendMessageOptionExpectsPeerResponseKey()
{
  IDSSendMessageOptionExpectsPeerResponseKeySymbolLoc = (void **)getIDSSendMessageOptionExpectsPeerResponseKeySymbolLoc();
  if (!IDSSendMessageOptionExpectsPeerResponseKeySymbolLoc) {
    getIDSSendMessageOptionExpectsPeerResponseKey_cold_1();
  }
  id v1 = *IDSSendMessageOptionExpectsPeerResponseKeySymbolLoc;

  return v1;
}

uint64_t getIDSSendMessageOptionFireAndForgetKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIDSSendMessageOptionFireAndForgetKeySymbolLoc_ptr;
  uint64_t v6 = getIDSSendMessageOptionFireAndForgetKeySymbolLoc_ptr;
  if (!getIDSSendMessageOptionFireAndForgetKeySymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IDSSendMessageOptionFireAndForgetKey");
    getIDSSendMessageOptionFireAndForgetKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123EB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIDSSendMessageOptionFireAndForgetKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IDSLibrary();
  Class result = dlsym(v2, "IDSSendMessageOptionFireAndForgetKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSSendMessageOptionFireAndForgetKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getIDSSendMessageOptionFireAndForgetKey()
{
  IDSSendMessageOptionFireAndForgetKeySymbolLoc = (void **)getIDSSendMessageOptionFireAndForgetKeySymbolLoc();
  if (!IDSSendMessageOptionFireAndForgetKeySymbolLoc) {
    getIDSSendMessageOptionFireAndForgetKey_cold_1();
  }
  id v1 = *IDSSendMessageOptionFireAndForgetKeySymbolLoc;

  return v1;
}

uint64_t getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc_ptr;
  uint64_t v6 = getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc_ptr;
  if (!getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IDSSendMessageOptionRequireAllRegistrationPropertiesKey");
    getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123ECE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IDSLibrary();
  Class result = dlsym(v2, "IDSSendMessageOptionRequireAllRegistrationPropertiesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

id getIDSSendMessageOptionRequireAllRegistrationPropertiesKey()
{
  IDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc = (void **)getIDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc();
  if (!IDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc) {
    getIDSSendMessageOptionRequireAllRegistrationPropertiesKey_cold_1();
  }
  id v1 = *IDSSendMessageOptionRequireAllRegistrationPropertiesKeySymbolLoc;

  return v1;
}

uint64_t getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc_ptr;
  uint64_t v6 = getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc_ptr;
  if (!getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey");
    getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123EE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IDSLibrary();
  Class result = dlsym(v2, "IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

id getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKey()
{
  IDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc = (void **)getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc();
  if (!IDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc) {
    getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKey_cold_1();
  }
  id v1 = *IDSSendMessageOptionRequireLackOfRegistrationPropertiesKeySymbolLoc;

  return v1;
}

uint64_t getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc_ptr;
  uint64_t v6 = getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc_ptr;
  if (!getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IDSSendMessageOptionPeerResponseIdentifierKey");
    getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123EFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IDSLibrary();
  Class result = dlsym(v2, "IDSSendMessageOptionPeerResponseIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

id getIDSSendMessageOptionPeerResponseIdentifierKey()
{
  IDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc = (void **)getIDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc();
  if (!IDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc) {
    getIDSSendMessageOptionPeerResponseIdentifierKey_cold_1();
  }
  id v1 = *IDSSendMessageOptionPeerResponseIdentifierKeySymbolLoc;

  return v1;
}

uint64_t getIDSServiceNameiMessageSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIDSServiceNameiMessageSymbolLoc_ptr;
  uint64_t v6 = getIDSServiceNameiMessageSymbolLoc_ptr;
  if (!getIDSServiceNameiMessageSymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IDSServiceNameiMessage");
    getIDSServiceNameiMessageSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123F140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIDSServiceNameiMessageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IDSLibrary();
  Class result = dlsym(v2, "IDSServiceNameiMessage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSServiceNameiMessageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getIDSServiceNameiMessage()
{
  IDSServiceNameiMessageSymbolLoc = (void **)getIDSServiceNameiMessageSymbolLoc();
  if (!IDSServiceNameiMessageSymbolLoc) {
    getIDSServiceNameiMessage_cold_1();
  }
  id v1 = *IDSServiceNameiMessageSymbolLoc;

  return v1;
}

uint64_t get_IDSCopyIDForEmailAddressSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_IDSCopyIDForEmailAddressSymbolLoc_ptr;
  uint64_t v6 = get_IDSCopyIDForEmailAddressSymbolLoc_ptr;
  if (!get_IDSCopyIDForEmailAddressSymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_IDSCopyIDForEmailAddress");
    get_IDSCopyIDForEmailAddressSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123F2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SIDSCopyIDForEmailAddress(void *a1)
{
  id v1 = a1;
  IDSCopyIDForEmailAddressSymbolLoc = (uint64_t (*)(id))get_IDSCopyIDForEmailAddressSymbolLoc();
  if (!IDSCopyIDForEmailAddressSymbolLoc) {
    _SIDSCopyIDForEmailAddress_cold_1();
  }
  uint64_t v3 = IDSCopyIDForEmailAddressSymbolLoc(v1);

  return v3;
}

uint64_t get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc_ptr;
  uint64_t v6 = get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc_ptr;
  if (!get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc_ptr)
  {
    id v1 = (void *)IDSLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_IDSCopyIDForPhoneNumberWithOptions");
    get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123F43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _SIDSCopyIDForPhoneNumberWithOptions(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  IDSCopyIDForPhoneNumberWithOptionsSymbolLoc = (void (*)(id, id, uint64_t))get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc();
  if (!IDSCopyIDForPhoneNumberWithOptionsSymbolLoc) {
    _SIDSCopyIDForPhoneNumberWithOptions_cold_1();
  }
  uint64_t v8 = IDSCopyIDForPhoneNumberWithOptionsSymbolLoc(v5, v6, a3);

  return v8;
}

uint64_t ContactsLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ContactsLibraryCore_frameworkLibrary;
  uint64_t v5 = ContactsLibraryCore_frameworkLibrary;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E5A4A548;
    long long v7 = *(_OWORD *)&off_1E5A4A558;
    v3[3] = _sl_dlopen();
    ContactsLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1A123F634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ContactsLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ContactsLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ContactsLibrary()
{
  id v1 = 0;
  uint64_t result = ContactsLibraryCore();
  if (!result) {
    ContactsLibrary_cold_1(&v1);
  }
  return result;
}

id getCNContactClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNContactClass_softClass;
  uint64_t v7 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNContactClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getCNContactClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A123F7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  Class result = objc_getClass("CNContact");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNContactClass_block_invoke_cold_1();
  }
  getCNContactClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNPhoneNumberClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNPhoneNumberClass_softClass;
  uint64_t v7 = getCNPhoneNumberClass_softClass;
  if (!getCNPhoneNumberClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNPhoneNumberClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getCNPhoneNumberClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A123F938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNPhoneNumberClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  Class result = objc_getClass("CNPhoneNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNPhoneNumberClass_block_invoke_cold_1();
  }
  getCNPhoneNumberClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactStoreClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNContactStoreClass_softClass;
  uint64_t v7 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNContactStoreClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getCNContactStoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A123FA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  Class result = objc_getClass("CNContactStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNContactStoreClass_block_invoke_cold_1();
  }
  getCNContactStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactIdentifierKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactIdentifierKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactIdentifierKeySymbolLoc_ptr;
  if (!getCNContactIdentifierKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactIdentifierKey");
    getCNContactIdentifierKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123FBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactIdentifierKey()
{
  CNContactIdentifierKeySymbolLoc = (void **)getCNContactIdentifierKeySymbolLoc();
  if (!CNContactIdentifierKeySymbolLoc) {
    getCNContactIdentifierKey_cold_1();
  }
  id v1 = *CNContactIdentifierKeySymbolLoc;

  return v1;
}

uint64_t getCNContactGivenNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactGivenNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactGivenNameKey");
    getCNContactGivenNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123FD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactGivenNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactGivenNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactGivenNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactGivenNameKey()
{
  CNContactGivenNameKeySymbolLoc = (void **)getCNContactGivenNameKeySymbolLoc();
  if (!CNContactGivenNameKeySymbolLoc) {
    getCNContactGivenNameKey_cold_1();
  }
  id v1 = *CNContactGivenNameKeySymbolLoc;

  return v1;
}

uint64_t getCNContactFamilyNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactFamilyNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactFamilyNameKey");
    getCNContactFamilyNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A123FEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactFamilyNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactFamilyNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactFamilyNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactFamilyNameKey()
{
  CNContactFamilyNameKeySymbolLoc = (void **)getCNContactFamilyNameKeySymbolLoc();
  if (!CNContactFamilyNameKeySymbolLoc) {
    getCNContactFamilyNameKey_cold_1();
  }
  id v1 = *CNContactFamilyNameKeySymbolLoc;

  return v1;
}

uint64_t getCNContactThumbnailImageDataKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactThumbnailImageDataKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactThumbnailImageDataKeySymbolLoc_ptr;
  if (!getCNContactThumbnailImageDataKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactThumbnailImageDataKey");
    getCNContactThumbnailImageDataKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A1240018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactThumbnailImageDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactThumbnailImageDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactThumbnailImageDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactThumbnailImageDataKey()
{
  CNContactThumbnailImageDataKeySymbolLoc = (void **)getCNContactThumbnailImageDataKeySymbolLoc();
  if (!CNContactThumbnailImageDataKeySymbolLoc) {
    getCNContactThumbnailImageDataKey_cold_1();
  }
  id v1 = *CNContactThumbnailImageDataKeySymbolLoc;

  return v1;
}

uint64_t getCNContactPhoneNumbersKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactPhoneNumbersKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactPhoneNumbersKeySymbolLoc_ptr;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A124018C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactPhoneNumbersKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactPhoneNumbersKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPhoneNumbersKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactPhoneNumbersKey()
{
  CNContactPhoneNumbersKeySymbolLoc = (void **)getCNContactPhoneNumbersKeySymbolLoc();
  if (!CNContactPhoneNumbersKeySymbolLoc) {
    getCNContactPhoneNumbersKey_cold_1();
  }
  id v1 = *CNContactPhoneNumbersKeySymbolLoc;

  return v1;
}

uint64_t getCNContactEmailAddressesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A1240300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactEmailAddressesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactEmailAddressesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactEmailAddressesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactEmailAddressesKey()
{
  CNContactEmailAddressesKeySymbolLoc = (void **)getCNContactEmailAddressesKeySymbolLoc();
  if (!CNContactEmailAddressesKeySymbolLoc) {
    getCNContactEmailAddressesKey_cold_1();
  }
  id v1 = *CNContactEmailAddressesKeySymbolLoc;

  return v1;
}

uint64_t getCNContactNamePrefixKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactNamePrefixKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactNamePrefixKeySymbolLoc_ptr;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactNamePrefixKey");
    getCNContactNamePrefixKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A1240474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactNamePrefixKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactNamePrefixKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactNamePrefixKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactNamePrefixKey()
{
  CNContactNamePrefixKeySymbolLoc = (void **)getCNContactNamePrefixKeySymbolLoc();
  if (!CNContactNamePrefixKeySymbolLoc) {
    getCNContactNamePrefixKey_cold_1();
  }
  id v1 = *CNContactNamePrefixKeySymbolLoc;

  return v1;
}

uint64_t getCNContactMiddleNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactMiddleNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A12405E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactMiddleNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactMiddleNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactMiddleNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactMiddleNameKey()
{
  CNContactMiddleNameKeySymbolLoc = (void **)getCNContactMiddleNameKeySymbolLoc();
  if (!CNContactMiddleNameKeySymbolLoc) {
    getCNContactMiddleNameKey_cold_1();
  }
  id v1 = *CNContactMiddleNameKeySymbolLoc;

  return v1;
}

uint64_t getCNContactNicknameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactNicknameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A124075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactNicknameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactNicknameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactNicknameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactNicknameKey()
{
  CNContactNicknameKeySymbolLoc = (void **)getCNContactNicknameKeySymbolLoc();
  if (!CNContactNicknameKeySymbolLoc) {
    getCNContactNicknameKey_cold_1();
  }
  id v1 = *CNContactNicknameKeySymbolLoc;

  return v1;
}

uint64_t getCNContactTypeKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactTypeKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactTypeKeySymbolLoc_ptr;
  if (!getCNContactTypeKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactTypeKey");
    getCNContactTypeKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A12408D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactTypeKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactTypeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactTypeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactTypeKey()
{
  CNContactTypeKeySymbolLoc = (void **)getCNContactTypeKeySymbolLoc();
  if (!CNContactTypeKeySymbolLoc) {
    getCNContactTypeKey_cold_1();
  }
  id v1 = *CNContactTypeKeySymbolLoc;

  return v1;
}

uint64_t getCNContactImageDataKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactImageDataKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactImageDataKeySymbolLoc_ptr;
  if (!getCNContactImageDataKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactImageDataKey");
    getCNContactImageDataKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A1240A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactImageDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactImageDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactImageDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactImageDataKey()
{
  CNContactImageDataKeySymbolLoc = (void **)getCNContactImageDataKeySymbolLoc();
  if (!CNContactImageDataKeySymbolLoc) {
    getCNContactImageDataKey_cold_1();
  }
  id v1 = *CNContactImageDataKeySymbolLoc;

  return v1;
}

uint64_t getCNContactCropRectKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactCropRectKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactCropRectKeySymbolLoc_ptr;
  if (!getCNContactCropRectKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactCropRectKey");
    getCNContactCropRectKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A1240BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactCropRectKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactCropRectKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactCropRectKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactCropRectKey()
{
  CNContactCropRectKeySymbolLoc = (void **)getCNContactCropRectKeySymbolLoc();
  if (!CNContactCropRectKeySymbolLoc) {
    getCNContactCropRectKey_cold_1();
  }
  id v1 = *CNContactCropRectKeySymbolLoc;

  return v1;
}

uint64_t getCNContactMemojiMetadataKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactMemojiMetadataKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactMemojiMetadataKeySymbolLoc_ptr;
  if (!getCNContactMemojiMetadataKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactMemojiMetadataKey");
    getCNContactMemojiMetadataKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A1240D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactMemojiMetadataKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  Class result = dlsym(v2, "CNContactMemojiMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactMemojiMetadataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactMemojiMetadataKey()
{
  CNContactMemojiMetadataKeySymbolLoc = (void **)getCNContactMemojiMetadataKeySymbolLoc();
  if (!CNContactMemojiMetadataKeySymbolLoc) {
    getCNContactMemojiMetadataKey_cold_1();
  }
  id v1 = *CNContactMemojiMetadataKeySymbolLoc;

  return v1;
}

void sub_1A1241A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_1A1245848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCDPCustodianRecoveryInfoClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCDPCustodianRecoveryInfoClass_softClass;
  uint64_t v7 = getCDPCustodianRecoveryInfoClass_softClass;
  if (!getCDPCustodianRecoveryInfoClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCDPCustodianRecoveryInfoClass_block_invoke;
    v3[3] = &unk_1E5A48F98;
    v3[4] = &v4;
    __getCDPCustodianRecoveryInfoClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A12468BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1246BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A124747C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCDPCustodianRecoveryInfoClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary_0();
  Class result = objc_getClass("CDPCustodianRecoveryInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCDPCustodianRecoveryInfoClass_block_invoke_cold_1();
  }
  getCDPCustodianRecoveryInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreCDPLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!CoreCDPLibraryCore_frameworkLibrary_2)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __CoreCDPLibraryCore_block_invoke_2;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5A4A9B0;
    uint64_t v2 = 0;
    CoreCDPLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!CoreCDPLibraryCore_frameworkLibrary_2) {
    CoreCDPLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __CoreCDPLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CoreCDPLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getCDPStateControllerClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary_0();
  Class result = objc_getClass("CDPStateController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCDPStateControllerClass_block_invoke_cold_1();
  }
  getCDPStateControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCDPContextClass_block_invoke(uint64_t a1)
{
  CoreCDPLibrary_0();
  Class result = objc_getClass("CDPContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCDPContextClass_block_invoke_cold_1();
  }
  getCDPContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return v0;
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

void sub_1A1250914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v27 - 160), 8);
  os_activity_scope_leave(&state);
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

void sub_1A1250FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1251690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1251DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125248C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1252B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125322C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1253910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1253FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1254650(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A1254CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1255390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A12559A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A125608C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v24 - 160), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v24 - 176));
  _Unwind_Resume(a1);
}

void sub_1A1256BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1257644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

void sub_1A1257D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
}

void sub_1A1258190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state,char a26)
{
}

void sub_1A12587F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1258E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1259470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A1259AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v27 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125A10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125A79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125ACE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 80));
  _Unwind_Resume(a1);
}

void sub_1A125B194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125B83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v27 - 160), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125BEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose((const void *)(v29 - 144), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A125DE08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A125E070(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125E1D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125E360(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125E5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A125E738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125E8C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125EA08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125EC38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125EE10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A125F1B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_1A1267C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

uint64_t sub_1A1268574(mach_port_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unint64_t *a5, void *a6, unsigned int *a7)
{
  int v18 = 1;
  uint64_t v19 = a3;
  int v20 = 16777472;
  unsigned int v21 = a4;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  unint64_t v23 = __PAIR64__(a4, a2);
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 3, 0x3Cu, 0x48u, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v15 = 4294966988;
  }
  else if (msg.msgh_id == 1300)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v15 = 4294966996;
      if (v18 == 1 && msg.msgh_size == 64 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
      {
        unsigned int v16 = v21;
        if (v21 == v24)
        {
          *a5 = v23;
          *a6 = v19;
          *a7 = v16;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      uint64_t v15 = 4294966996;
      if (HIDWORD(v19))
      {
        if (msg.msgh_remote_port) {
          uint64_t v15 = 4294966996;
        }
        else {
          uint64_t v15 = HIDWORD(v19);
        }
      }
    }
    else
    {
      uint64_t v15 = 4294966996;
    }
  }
  else
  {
    uint64_t v15 = 4294966995;
  }
  mach_msg_destroy(&msg);
  return v15;
}

uint64_t sub_1A126876C(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v11 = 1;
  uint64_t v12 = a4;
  int v13 = 16777472;
  int v14 = a5;
  uint64_t v15 = *MEMORY[0x1E4F14068];
  int v16 = a2;
  uint64_t v17 = a3;
  int v18 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&msg, 3, 0x44u, 0x2Cu, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v8;
  }
  if (v7)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id != 1301)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_17;
  }
  uint64_t v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v8 = HIDWORD(v12);
  if (HIDWORD(v12)) {
    goto LABEL_17;
  }
  return v8;
}

uint64_t sub_1A12688E8(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v17 = 1;
  uint64_t v18 = a4;
  int v19 = 16777472;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a2;
  uint64_t v23 = a3;
  int v24 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B200000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3, 0x44u, 0x40u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v12;
  }
  if (v11)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v12;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v14 = 4294966988;
  }
  else if (msg.msgh_id == 1302)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v14 = 4294966996;
      if (v17 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v19) == 1)
      {
        int v15 = v20;
        if (v20 == v22)
        {
          *a6 = v18;
          *a7 = v15;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      uint64_t v14 = 4294966996;
      if (HIDWORD(v18))
      {
        if (msg.msgh_remote_port) {
          uint64_t v14 = 4294966996;
        }
        else {
          uint64_t v14 = HIDWORD(v18);
        }
      }
    }
    else
    {
      uint64_t v14 = 4294966996;
    }
  }
  else
  {
    uint64_t v14 = 4294966995;
  }
  mach_msg_destroy(&msg);
  return v14;
}

uint64_t sub_1A1268ADC(mach_port_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F14068];
  unsigned int v10 = a2;
  uint64_t v11 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B300000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v5 = mach_msg(&msg, 3, 0x2Cu, 0x2Cu, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v6;
  }
  if (v5)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v6;
  }
  else
  {
    if (msg.msgh_id == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      uint64_t v6 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v6 = v10;
        if (!v10) {
          return v6;
        }
      }
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
    mach_msg_destroy(&msg);
    return v6;
  }
}

uint64_t Be81a395Bf0(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(&off_1E5A4B380
       + ((91 * ((dword_1E953E870 + dword_1E953E868) ^ 0x70)) ^ byte_1A12A7A70[byte_1A12A8470[(91 * ((dword_1E953E870 + dword_1E953E868) ^ 0x70))] ^ 0x94])
       + 8);
  uint64_t v2 = *(&off_1E5A4B380
       + ((91 * (*v1 ^ dword_1E953E870 ^ 0x70)) ^ byte_1A12A8070[byte_1A12A7C70[(91 * (*v1 ^ dword_1E953E870 ^ 0x70))] ^ 0x39])
       - 222);
  uint64_t v3 = *v2 - *v1 - (void)&v9;
  void *v1 = 1822798427 * v3 + 0x6E6E655B55E8ACD0;
  void *v2 = 1822798427 * (v3 ^ 0x8EC5F3EEF9E6FF70);
  uint64_t v4 = (uint64_t)*(&off_1E5A4B380
                + ((91 * ((dword_1E953E870 + dword_1E953E868) ^ 0x70)) ^ byte_1A12A8070[byte_1A12A7C70[(91 * ((dword_1E953E870 + dword_1E953E868) ^ 0x70))] ^ 0xB1])
                - 99);
  uint64_t v5 = *(void *)(v4 + 120);
  unint64_t v6 = 942846689 * ((unint64_t)&v10 ^ 0x2DF4282E8CBBA516);
  int v10 = v6 ^ 0xF067FA72;
  uint64_t v11 = a1;
  unint64_t v12 = v5 ^ v6;
  unsigned __int8 v7 = 91 * ((*(_DWORD *)v2 + *(_DWORD *)v1) ^ 0x70);
  (*(void (**)(int *))(v4 + 8
                                     * ((byte_1A12A8270[byte_1A12A7F78[v7 - 8] ^ 0x89] ^ v7) - 29)))(&v10);
  return v13;
}

uint64_t sub_1A1268E1C(unsigned int a1)
{
  return byte_1A12A7A70[byte_1A12A8470[a1] ^ 0x94] ^ a1;
}

uint64_t IW1PcFszqNK(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (uint64_t)*(&off_1E5A4B380
                + ((91 * (dword_1E953E860 ^ 0x70 ^ dword_1E953E870)) ^ byte_1A12A8170[byte_1A12A7D70[(91 * (dword_1E953E860 ^ 0x70 ^ dword_1E953E870))] ^ 0xB5])
                - 155);
  uint64_t v2 = *(void *)(v1 - 4);
  uint64_t v3 = (unint64_t *)*(&off_1E5A4B380
                           + ((91 * ((dword_1E953E870 - v2) ^ 0x70)) ^ byte_1A12A7970[byte_1A12A8370[(91 * ((dword_1E953E870 - v2) ^ 0x70))] ^ 0xAA])
                           - 63);
  unint64_t v4 = 1822798427 * ((unint64_t)&v10[*v3 ^ v2] ^ 0x8EC5F3EEF9E6FF70);
  *(void *)(v1 - 4) = v4;
  *uint64_t v3 = v4;
  uint64_t v5 = (uint64_t)*(&off_1E5A4B380
                + ((91 * ((dword_1E953E870 - dword_1E953E860) ^ 0x70)) ^ byte_1A12A7A70[byte_1A12A8470[(91 * ((dword_1E953E870 - dword_1E953E860) ^ 0x70))] ^ 0x52])
                - 196);
  uint64_t v6 = *(void *)(v5 + 248);
  unint64_t v7 = 942846689
     * ((((unint64_t)&v11 | 0xDBD392286209E2F0)
       - ((unint64_t)&v11 | 0x242C6DD79DF61D0FLL)
       + 0x242C6DD79DF61D0FLL) ^ 0xF627BA06EEB247E6);
  int v11 = v7 ^ 0xF067FA72;
  uint64_t v12 = a1;
  unint64_t v13 = v6 ^ v7;
  unsigned __int8 v8 = 91 * ((*(_DWORD *)v3 - *(_DWORD *)(v1 - 4)) ^ 0x70);
  (*(void (**)(int *))(v5
                                + 8
                                * ((byte_1A12A7E7C[(byte_1A12A7B7C[v8 - 12] ^ 0x24) - 12] ^ v8)
                                 + 68)))(&v11);
  return v14;
}

uint64_t sub_1A1269070(unsigned int a1)
{
  return byte_1A12A8070[byte_1A12A7C70[a1] ^ 0xB1] ^ a1;
}

uint64_t sub_1A126909C(char a1, unsigned int a2)
{
  return byte_1A12A7E7C[(byte_1A12A7B7C[a2 - 12] ^ a1) - 12] ^ a2;
}

uint64_t sub_1A12690C8(unsigned int a1)
{
  return byte_1A12A7E7C[(byte_1A12A7B7C[a1 - 12] ^ 0x24) - 12] ^ a1;
}

uint64_t sub_1A12690F8(char a1, unsigned int a2)
{
  return byte_1A12A8270[(byte_1A12A7F78[a2 - 8] ^ a1)] ^ a2;
}

uint64_t sub_1A1269124(unsigned int a1)
{
  return byte_1A12A8270[byte_1A12A7F78[a1 - 8] ^ 0x89] ^ a1;
}

uint64_t sub_1A1269150(char a1, unsigned int a2)
{
  return byte_1A12A8070[(byte_1A12A7C70[a2] ^ a1)] ^ a2;
}

uint64_t sub_1A126917C(unsigned int a1)
{
  return byte_1A12A8070[byte_1A12A7C70[a1] ^ 0x39] ^ a1;
}

uint64_t sub_1A12691A8(char a1, unsigned int a2)
{
  return byte_1A12A7970[(byte_1A12A8370[a2] ^ a1)] ^ a2;
}

uint64_t sub_1A12691D4(unsigned int a1)
{
  return byte_1A12A7970[byte_1A12A8370[a1] ^ 0xAA] ^ a1;
}

uint64_t sub_1A1269200(char a1, unsigned int a2)
{
  return byte_1A12A8170[(byte_1A12A7D70[a2] ^ a1)] ^ a2;
}

uint64_t sub_1A126922C(unsigned int a1)
{
  return byte_1A12A8170[byte_1A12A7D70[a1] ^ 0xB5] ^ a1;
}

uint64_t sub_1A1269258(char a1, unsigned int a2)
{
  return byte_1A12A7A70[(byte_1A12A8470[a2] ^ a1)] ^ a2;
}

uint64_t sub_1A1269284(unsigned int a1)
{
  return byte_1A12A7A70[byte_1A12A8470[a1] ^ 0x52] ^ a1;
}

void sub_1A12692B0(uint64_t a1)
{
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1A126936C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v1 - 1531033816) & 0x6AD9BE7F) + 27) * (v2 != 0)) ^ (a1 + v1 - 13))))();
}

uint64_t sub_1A12693AC()
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v0 + 61)))(v2);
  *(_DWORD *)(v1 + 24) = 0;
  return result;
}

void KxmB0CKvgWt(uint64_t a1, int a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A12695A0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = *(void *)(v5 + 16);
  unsigned int v18 = 1829790799
      * (((&v16 | 0xD30D353F) - &v16 + (&v16 & 0x2CF2CAC0)) ^ 0x11C49574)
      + 463207035;
  int v17 = v12;
  (*(void (**)(int *))(v5 + 528))(&v16);
  v12[0] = *(void *)(v5 + 280);
  v12[1] = a1;
  int v13 = a2;
  v12[2] = a3;
  uint64_t v14 = a4;
  uint64_t v15 = a5;
  unsigned int v18 = 1829790799
      * ((((&v16 | 0xC30BD196) ^ 0xFFFFFFFE) - (~&v16 | 0x3CF42E69)) ^ 0xFE3D8E22)
      + 463207035;
  int v17 = v12;
  (*(void (**)(int *))(v5 + 528))(&v16);
  return (v16 - 955058042);
}

void sub_1A12696D4(uint64_t a1)
{
  *(void *)&v6[15] = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)a1 ^ (646995413 * ((((2 * a1) | 0x8F18737E) - a1 + 947111489) ^ 0x534DB4D5));
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)*(&off_1E5A4B380 + (v1 ^ 0xA));
  strcpy(v6, "com.apple.absd");
  uint64_t v4 = (uint64_t)*(&off_1E5A4B380 + v1 + 2);
  int v5 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v4 + 8 * (v1 ^ 0x69)))(v3, v6, v2);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A12697F4()
{
  uint64_t v7 = *v5;
  uint64_t v9 = v4;
  strcpy(v10, "e.absinthed");
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(v6 + 8 * (v3 ^ 0x59)))(v7, &v9, v1);
  if (result != v3 - 48) {
    int v2 = 955013739;
  }
  *(_DWORD *)(v0 + 4) = v2;
  return result;
}

void nDYmeMqvWb(uint64_t a1, uint64_t a2, int a3)
{
  if (a1) {
    BOOL v3 = a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v5 = !v3 && a3 != 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A12698F0(uint64_t a1, uint64_t a2, int a3)
{
  v8[0] = *(void *)(v3 + 16);
  unsigned int v12 = 1829790799 * (&v10 ^ 0xC2C9A04B) + 463207035;
  int v11 = v8;
  (*(void (**)(int *))(v3 + 528))(&v10);
  v8[0] = *(void *)(v3 + 224);
  v8[1] = a1;
  v8[2] = a2;
  int v9 = a3;
  int v11 = v8;
  unsigned int v12 = 1829790799 * ((2 * (&v10 & 0x21EBD450) - &v10 + 1578380203) ^ 0x9CDD8BE0)
      + 463207035;
  (*(void (**)(int *))(v3 + 528))(&v10);
  return (v10 - 955058042);
}

void sub_1A12699F4(uint64_t a1)
{
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1A1269A9C()
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t (*)()))(v2 + 8 * (int)(v0 & 0xC4000437)))(*(void *)(v3 + 8 * (v0 ^ 0x1B9BFA72)) - 8, nullsub_1);
  _DWORD *v1 = -1133814153;
  return result;
}

void t1BoNctgaUu66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1A126AC30()
{
  return 4294923273;
}

uint64_t sub_1A126AD50(mach_port_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  int v15 = 1;
  uint64_t v16 = a2;
  int v17 = 16777472;
  int v18 = a3;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  int v20 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = reply_port;
  v14.msgh_bits = -2147478253;
  *(void *)&v14.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v14);
    mach_port_t reply_port = v14.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&v14, 3, 0x38u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v14.msgh_local_port);
    return v10;
  }
  if (v9)
  {
    mig_dealloc_reply_port(v14.msgh_local_port);
    return v10;
  }
  if (v14.msgh_id == 71)
  {
    uint64_t v12 = 4294966988;
  }
  else if (v14.msgh_id == 1300)
  {
    if ((v14.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v12 = 4294966996;
      if (v15 == 1 && v14.msgh_size == 56 && !v14.msgh_remote_port && HIBYTE(v17) == 1)
      {
        int v13 = v18;
        if (v18 == v20)
        {
          *a4 = v16;
          *a5 = v13;
          return 0;
        }
      }
    }
    else if (v14.msgh_size == 36)
    {
      uint64_t v12 = 4294966996;
      if (HIDWORD(v16))
      {
        if (v14.msgh_remote_port) {
          uint64_t v12 = 4294966996;
        }
        else {
          uint64_t v12 = HIDWORD(v16);
        }
      }
    }
    else
    {
      uint64_t v12 = 4294966996;
    }
  }
  else
  {
    uint64_t v12 = 4294966995;
  }
  mach_msg_destroy(&v14);
  return v12;
}

uint64_t sub_1A126AF3C(char a1, unsigned int a2)
{
  return byte_1A12A8594[(byte_1A12A900C[a2 - 12] ^ a1) - 4] ^ a2;
}

uint64_t sub_1A126AF68(unsigned int a1)
{
  return byte_1A12A8698[(byte_1A12A910C[a1 - 12] ^ 0xC0) - 8] ^ a1;
}

uint64_t sub_1A126AF94(char a1, unsigned int a2)
{
  return byte_1A12A8CC0[(byte_1A12A88A8[a2 - 8] ^ a1)] ^ a2;
}

uint64_t sub_1A126AFC0(unsigned int a1)
{
  return byte_1A12A8DC4[(byte_1A12A89A4[a1 - 4] ^ 0x5E) - 4] ^ a1;
}

uint64_t sub_1A126AFF0(unsigned int a1)
{
  return byte_1A12A8698[(byte_1A12A910C[a1 - 12] ^ 0xF2) - 8] ^ a1;
}

uint64_t sub_1A126B020(unsigned int a1)
{
  return byte_1A12A8BC8[(byte_1A12A87A8[a1 - 8] ^ 0xD) - 8] ^ a1;
}

uint64_t sub_1A126B050(unsigned int a1)
{
  return byte_1A12A8590[byte_1A12A9000[a1] ^ 0x92] ^ a1;
}

uint64_t sub_1A126B07C(unsigned int a1)
{
  return byte_1A12A8BC8[(byte_1A12A87A8[a1 - 8] ^ 0x19) - 8] ^ a1;
}

uint64_t sub_1A126B0AC(unsigned int a1)
{
  return byte_1A12A8594[(byte_1A12A900C[a1 - 12] ^ 0xB1) - 4] ^ a1;
}

uint64_t sub_1A126B0DC(char a1, unsigned int a2)
{
  return byte_1A12A8BC8[(byte_1A12A87A8[a2 - 8] ^ a1) - 8] ^ a2;
}

uint64_t sub_1A126B108(unsigned int a1)
{
  return byte_1A12A8CC0[byte_1A12A88A8[a1 - 8] ^ 0xF5] ^ a1;
}

uint64_t sub_1A126B134(char a1, unsigned int a2)
{
  return byte_1A12A8EC4[(byte_1A12A8AA0[a2] ^ a1) - 4] ^ a2;
}

uint64_t sub_1A126B160(unsigned int a1)
{
  return byte_1A12A8594[(byte_1A12A900C[a1 - 12] ^ 0x84) - 4] ^ a1;
}

uint64_t sub_1A126B190(unsigned int a1)
{
  return byte_1A12A8CC0[byte_1A12A88A8[a1 - 8] ^ 0x6E] ^ a1;
}

uint64_t sub_1A126B1BC(unsigned int a1)
{
  return byte_1A12A8594[(byte_1A12A900C[a1 - 12] ^ 0x8A) - 4] ^ a1;
}

uint64_t sub_1A126B1EC(unsigned int a1)
{
  return byte_1A12A8DC4[(byte_1A12A89A4[a1 - 4] ^ 0xC8) - 4] ^ a1;
}

uint64_t sub_1A126B21C(char a1, unsigned int a2)
{
  return byte_1A12A8698[(byte_1A12A910C[a2 - 12] ^ a1) - 8] ^ a2;
}

uint64_t sub_1A126B248(unsigned int a1)
{
  return byte_1A12A8BC8[(byte_1A12A87A8[a1 - 8] ^ 0xB5) - 8] ^ a1;
}

uint64_t sub_1A126B278(char a1, unsigned int a2)
{
  return byte_1A12A8DC4[(byte_1A12A89A4[a2 - 4] ^ a1) - 4] ^ a2;
}

uint64_t sub_1A126B2A4(unsigned int a1)
{
  return byte_1A12A8EC4[(byte_1A12A8AA0[a1] ^ 0x81) - 4] ^ a1;
}

uint64_t sub_1A126B2D4(unsigned int a1)
{
  return byte_1A12A8594[(byte_1A12A900C[a1 - 12] ^ 0x1A) - 4] ^ a1;
}

uint64_t sub_1A126B304(unsigned int a1)
{
  return byte_1A12A8CC0[byte_1A12A88A8[a1 - 8] ^ 0x78] ^ a1;
}

uint64_t sub_1A126B32C(unsigned int a1)
{
  return byte_1A12A8EC4[(byte_1A12A8AA0[a1] ^ 0x60) - 4] ^ a1;
}

uint64_t jkag7Bg01u(uint64_t a1, uint64_t a2)
{
  if (unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8))) {
    __asm { BRAA            X8, X17 }
  }
  return 4294922295;
}

void sub_1A126B86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _DWORD *a15, uint64_t a16, int a17, int a18)
{
  *(void *)(v21 - 20_Block_object_dispose(&a9, 8) = v18;
  int v22 = *(void **)(v21 - 136);
  (*(void (**)(void))(v19 + 8 * (v20 ^ (v20 - 1871))))(*v22);
  *int v22 = a14;
  *a15 = a18;
  JUMPOUT(0x1A126B8B0);
}

uint64_t sub_1A126B950()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)((((((v0 - 410) | 0x119) ^ 0xFFFFFE3A) + v0 - 132) * (v1 == 0)) ^ v0)))();
}

uint64_t sub_1A126B990()
{
  unsigned int v3 = ((v0 - 82150104) & 0x4E585D9) - 437759 + *(_DWORD *)(v1 + 12) - 1044;
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 1123084877;
  BOOL v5 = v3 < 0xFFF95201;
  BOOL v6 = v3 > v4;
  if (v4 < 0xFFF95201 != v5) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((63 * !v6) ^ v0)))();
}

uint64_t sub_1A126BA18@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v31 = *(void *)(v30 - 144);
  int v32 = v27 + 3;
  *(void *)(v30 - 144) = v31;
  uint64_t v33 = *(void *)(v31 - 0x3B66C28959A1DD8DLL);
  unsigned int v34 = ((2 * a9) & 0x7FAEFDDE) + (a9 ^ 0xBFD77EEF);
  *(unsigned char *)(v33 + v34 + (v32 ^ 0x40288008)) = -123;
  v34 += 1076396040;
  *(unsigned char *)(v33 + v34 + 266) = -2;
  *(unsigned char *)(v33 + v34 + 267) = 99;
  *(unsigned char *)(v33 + v34 + 26_Block_object_dispose(&a9, 8) = -80;
  *a1 += 4;
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((v32 + 554792680) | 0x5E208106) ^ (v29 + 950) ^ v32)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A126BCF8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v1 - 1569420586) & 0x5D8B77FA) + ((v1 + 247399078) & 0xF140FEEF) - 1659)
                                     * (v0 == 0)) ^ (v1 + 1549))))();
}

uint64_t sub_1A126BD58()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1642909503;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 1529410671;
  BOOL v5 = v3 < 0x9E1330BD;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < (((v0 - 1000) | 0x234) ^ 0x9E132B7A) + 15 * (v0 ^ 0x395)) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1050 * v6) ^ v0)))();
}

uint64_t sub_1A126BDE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  HIDWORD(a25) = v25;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((((v26 - 1367) | 0x40) ^ (v26 - 1313)) * (v27 != 0)) | v26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A126BE28()
{
  unsigned int v3 = v0 - 1793147892;
  BOOL v4 = (v0 - 1793147892) < 0xD808F856;
  unsigned int v5 = (((2 * v1) ^ 0xA5F7FD48) & (2 * (2 * v0 + 2049673060))) + ((2 * v0 + 2049673060) ^ 0x52FBFCFE);
  if (v4 != v5 - 2062746792 < 0xD808F856) {
    BOOL v6 = v5 - 2062746792 < 0xD808F856;
  }
  else {
    BOOL v6 = v5 - 2062746792 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((367 * v6) ^ v1)))();
}

uint64_t sub_1A126BED0@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v30 = *(void *)(v29 - 144);
  int v31 = (v26 - 11) | 0x84;
  *(void *)(v29 - 144) = v30;
  uint64_t v32 = *(void *)(v30 - 0x3B66C28959A1DD8DLL);
  unsigned int v33 = (a9 ^ 0x6BDF3CEF) - 1809792925 + ((2 * a9) & 0xD7BE79DE);
  *(unsigned char *)(v32 + v33 + 686) = 0;
  *(unsigned char *)(v32 + v33 + v31) = 0;
  *(unsigned char *)(v32 + v33 + 68_Block_object_dispose(&a9, 8) = 0;
  *(unsigned char *)(v32 + v33 + 689) = 1;
  *a1 += 4;
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * ((v31 - 197) ^ (v28 + 143) ^ v31 ^ (v28 + 673) ^ v31)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A126C094()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((3 * (v0 ^ 0xB7) - 52) * (v1 == 0)) ^ v0)))();
}

uint64_t sub_1A126C0D0()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + 1189778007;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 67130881;
  BOOL v5 = v3 < (v0 ^ 0x61Eu) + 1189777478;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x46EA924F) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((49 * !v6) ^ v0)))();
}

uint64_t sub_1A126C150@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v30 = *(void *)(v29 - 144);
  uint64_t v31 = (v25 - 240);
  unint64_t v32 = v26 - ((v31 ^ 0xF99431D3CA63CD40) & (2 * v26)) + 0x7CCA18E9E531E62CLL;
  *(void *)(v29 - 144) = v30;
  unsigned int v33 = (unsigned char *)(*(void *)(v30 - 0x3B66C28959A1DD8DLL)
                + ((2 * a9) & 0x1F6BAFABALL)
                + (a9 ^ 0x67AF3FFFFB5D7D5DLL)
                - 0x67AF3FFFFB5D7D5DLL);
  *unsigned int v33 = HIBYTE(v32) ^ 0x7C;
  v33[1] = BYTE6(v32) ^ 0xCA;
  v33[2] = BYTE5(v32) ^ 0x18;
  v33[3] = BYTE4(v32) ^ 0xE9;
  v33[4] = ((v26 - ((v31 ^ 0xCA63CD40) & (2 * v26)) - 449714644) >> 24) ^ 0xE5;
  v33[5] = ((v26 - ((v31 ^ 0xCA63CD40) & (2 * v26)) - 449714644) >> 16) ^ 0x31;
  v33[6] = ((unsigned __int16)(v26 - ((v31 ^ 0xCD40) & (2 * v26)) - 6612) >> 8) ^ 0xE6;
  v33[7] = v32 ^ 0x2C;
  *a1 += 8;
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (int)(v31 ^ (v28 - 233) ^ (v28 + 1628) ^ ((v31 - 279) | 0x61C) ^ v31)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A126C4A8()
{
  *(void *)(v4 - 120) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((46 * (((v1 == 0) ^ (v3 + v0)) & 1)) ^ v0)))();
}

uint64_t sub_1A126C4EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v32 = v28 ^ 0x5A8;
  uint64_t v33 = (*(uint64_t (**)(void))(v29 + 8 * ((v28 ^ 0x5A8) + 1387)))();
  (*(void (**)(uint64_t, char *, void, void))(v29 + 8 * (v32 ^ 0xB5F)))(v33, &(**(&off_1E5A4B410 + (v32 ^ 0x3B3)))[-3], **(void **)(v31 - 136), *(unsigned int *)(*(void *)(v31 - 136) + 12));
  uint64_t v34 = (*(uint64_t (**)(void, void))(v29 + 8 * (v32 ^ 0xB49)))(*(void *)(v31 - 160), 0);
  *(void *)(v31 - 184) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v34 == 0) * ((v32 + 2134898241) & 0xFFF1FF0F ^ (v30 + 2))) ^ v32)))(v34, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A126C5BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  *(void *)(v29 - 192) = a1;
  uint64_t v30 = (*(uint64_t (**)(void, void, void))(v28 + 8 * (v27 + 1358)))(*(void *)(v29 - 160), *(void *)(v29 - 192), 0);
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((((v30 == 0) ^ (v27 - 47)) & 1) * (((v27 + 2147219409) ^ 0x7FFBFA0C) - 268)) ^ (v27 - 247)));
  *(void *)(v29 - 184) = *(void *)(v29 - 192);
  return v31(v30, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A126C63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  (*(void (**)(uint64_t, char *))(v37 + 8 * (v36 ^ 0x8B8)))(a1, &(**(&off_1E5A4B410 + v36 - 364))[-12]);
  (*(void (**)(uint64_t))(v37 + 8 * (v36 + 1830)))(a1);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v36 ^ 0x8A7)))(a1, a36);
  uint64_t v39 = (char (*)[256])(*(uint64_t (**)(void))(v37 + 8 * (v36 + 1927)))();
  return (*(uint64_t (**)(char (*)[256], uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (int)(((v39 == *(&off_1E5A4B410 + (v36 ^ 0x181))) * ((v36 + 497444452) & 0xE2599FFF ^ ((v36 ^ 0xA4) + 188))) ^ v36)))(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A126C700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  return (*(uint64_t (**)(void))(v31
                              + 8
                              * (((a31 == (void)*(&off_1E5A4B410 + v32 - 284) - 8)
                                * (5 * (v32 ^ 0x160) + ((v32 + 2133981144) ^ 0x7F31FEA1))) ^ v32)))();
}

uint64_t sub_1A126C778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v38 ^ 0x8A7)))(a28, a36);
  uint64_t v39 = (*(uint64_t (**)(void))(v37 + 8 * (v38 ^ 0x899)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (((v39 == v36) * ((((v38 - 1633085932) & 0x6156EF60) + 239) ^ 0x560)) ^ v38)))(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A126C7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  return (*(uint64_t (**)(void))(v32
                              + 8
                              * ((((v33 ^ 0x7F31FE07) - 2133979208 + ((v33 - 8035729) & 0x7A97FF) - 2600) * (a31 == v31)) ^ v33)))();
}

uint64_t sub_1A126C858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v38 + 1981)))(a28, a36);
  uint64_t v39 = (*(uint64_t (**)(void))(v37 + 8 * (v38 + 1955)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * ((228 * (((v38 + 52) ^ (v39 == v36)) & 1)) ^ v38)))(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A126C8B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 8 * (v33 + 295)))(a31, v32, v34 - 120);
  uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (((((v33 + 24) ^ (v35 == 0)) & 1) * ((v33 - 339) ^ 0x684)) ^ v33));
  *(void *)(v34 - 200) = 0x50417EF54FC55D4FLL;
  return v36(v35, v37, v38, v39, v40, v41, v42, v43);
}

uint64_t sub_1A126C940()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 + 623)))(24, 4101018099);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (((v3 == 0) * (((v0 + 254851689) | 0x70013802) ^ 0x7F31FE07 ^ ((v0 - 658) | 0x330))) ^ v0));
  *(void *)(v2 - 200) = 0x50417EF54FC55D4FLL;
  return v4(v3, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1A126C9DC(uint64_t a1)
{
  *(void *)(v3 - 176) = a1 + 0x50417EF54FC55D4FLL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = 917342576;
  *(_DWORD *)(a1 + 12) = 437737774;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 ^ 0xE31)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v1 - 1) ^ (v5 == 0)) & 1) * (((v1 - 1786) | 0x482) - 1212)) ^ v1)))();
}

uint64_t sub_1A126CA70()
{
  *(_DWORD *)(v3 + _Block_object_dispose(&a9, 8) = v1 + 4096;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 + 37) ^ (*(void *)(v4 - 120) > (unint64_t)(v1 - 917338480))) & 1)
                                * ((v0 - 1038699979) & 0x3DE94D9F ^ 0x491)) ^ v0)))();
}

uint64_t sub_1A126CAE8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  *(void *)(v28 - 200) = 0x50417EF54FC55D4FLL;
  *(void *)(v28 - 184) = *(void *)(v28 - 192);
  uint64_t v29 = *(void *)(v28 - 176);
  *(void *)(v28 - 176) = v29;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (int)(((a16 <= *(void *)(v29 - 0x50417EF54FC55D4FLL)) * ((a8 & 0xBE1EC43B ^ 0x289) + 326 + 3 * (a8 & 0xBE1EC43B ^ 0x14C) - 1996)) ^ a8 & 0xBE1EC43B ^ 0x289)))(*(void *)(v29 - 0x50417EF54FC55D4FLL), a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, v29, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

void sub_1A126D114()
{
  uint64_t v2 = *(void *)(v1 - 176);
  *(_DWORD *)(v2 - 0x50417EF54FC55D47) = (*(_DWORD *)(v1 - 120) ^ 0x3EFDEB73)
                                         - 139485699
                                         + ((2 * *(_DWORD *)(v1 - 120)) & 0x7DFBD6E6);
  *(_DWORD *)(v2 - 0x50417EF54FC55D43) = 437737774;
  *(void *)(v1 - 152) = v0;
  uint64_t v3 = *(void *)(v1 - 184);
  *(void *)(v1 - 200) = v2;
  *(void *)(v1 - 192) = v3;
  JUMPOUT(0x1A126D194);
}

uint64_t sub_1A126D20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v36 = (*(uint64_t (**)(void))(v33 + 8 * v34))();
  uint64_t v37 = *(uint64_t (**)(uint64_t))(v33 + 8 * ((v32 - 504) ^ ((2 * (a31 == 0)) | (8 * (a31 == 0)))));
  *(void *)(v35 - 184) = v31;
  return v37(v36);
}

uint64_t sub_1A126D264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v39 = (*(uint64_t (**)(uint64_t))(v34 + 8 * (*(_DWORD *)(v38 - 168) ^ v31)))(a31);
  uint64_t v40 = *(void *)(v38 - 136);
  *(void *)(v38 - 184) = v32;
  if (v35 == -45004)
  {
    *(void *)(v38 - 176) = v33;
    *(void *)(v38 - 12_Block_object_dispose(&a9, 8) = 0;
    *(_DWORD *)(v38 - 112) = 0;
    uint64_t v41 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v34 + 8 * (v37 ^ (v37 - 2278))))(*(unsigned int *)*(&off_1E5A4B410 + (v37 ^ (v37 + 8))), *(void *)v40, *(unsigned int *)(v40 + 12), v38 - 128, v38 - 112);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((1119 * ((v41 ^ 0x4FDFFACD) - 92409924 + ((2 * v41) & 0x9FBFF59A) == 1516104332)) ^ (v36 + v37 - 1898))))(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27);
  }
  else if (v35)
  {
    return (*(uint64_t (**)(uint64_t))(v34 + 8 * ((v36 + 2133979614) ^ (v40 == 0))))(v39);
  }
  else
  {
    return (*(uint64_t (**)(uint64_t))(v34
                                              + 8
                                              * (((*(void *)(v38 - 200) == 0x50417EF54FC55D4FLL)
                                                * ((2133983642 - v37) ^ 0x97C)) ^ (v36 + 2133979454))))(v39);
  }
}

uint64_t sub_1A126D8F4()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((((v0 - v1 + 2076) ^ 0xFFFFF1B0) + v0 - v1 + 2076) * (v3 == 0)) ^ v0)))();
}

uint64_t sub_1A126D928()
{
  (*(void (**)(uint64_t))(v1 + 8 * (v0 ^ (v4 - 1871))))(v3);
  uint64_t v6 = (*(uint64_t (**)(void, void, void))(v1 + 8 * (v0 ^ (v4 - 2286))))(*(unsigned int *)*(&off_1E5A4B410 + (v0 ^ (v4 + 18))), *(void *)(v5 - 128), *(unsigned int *)(v5 - 112));
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v1 + 8 * ((417 * (v2 == 0)) ^ (v0 - 2133980316)));
  *(void *)(v5 - 200) = 0x50417EF54FC55D4FLL;
  return v7(v6);
}

uint64_t sub_1A126D954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29,int a30,int a31)
{
  uint64_t v37 = (*(uint64_t (**)(void))(v32 + 8 * (v35 + v34)))(*(void *)(v31 - 0x50417EF54FC55D4FLL));
  *(void *)(v31 - 0x50417EF54FC55D4FLL) = a23;
  *a29 = a31;
  *(void *)(v36 - 152) = v33;
  return (*(uint64_t (**)(uint64_t))(v32
                                            + 8
                                            * ((117 * ((((v35 + v34 - 2228) ^ 0x42E) & 1) == 0)) ^ (v35 + v34 - 267))))(v37);
}

void sub_1A126D9E0()
{
  *(void *)(v1 - 16_Block_object_dispose(&a9, 8) = v0;
  JUMPOUT(0x1A126DA14);
}

uint64_t sub_1A126DA74()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((233 * (((v0 == 0) ^ (v1 + 58) & 0x7F) & 1)) ^ v1)))();
}

uint64_t sub_1A126DABC()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((143 * ((v0 ^ (v1 < ((v0 + 2143287426) & 0xFF71FD5F ^ (v3 + 8)))) & 1)) ^ v0)))();
}

uint64_t sub_1A126DB08()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((472
                                * (v1 >= (((v0 ^ 0x5D2) + 649353352) & 0xD94BA6C6 ^ 0xFFFFFFFF80CE015FLL)
                                       + (((v0 ^ 0x5D2) + 2134766672) & 0xFFF3FDBF))) ^ v0 ^ 0x5D2)))();
}

uint64_t sub_1A126DB74()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((46 * (v0 >= ((v1 + 86010557) | 0x7A118804u) - v3 + 32)) ^ v1)))();
}

uint64_t sub_1A126DBBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = a2 + (v2 - 1);
  long long v8 = *(_OWORD *)(v7 - 31);
  uint64_t v9 = a1 + (v2 - 1);
  *(_OWORD *)(v9 - 15) = *(_OWORD *)(v7 - 15);
  *(_OWORD *)(v9 - 31) = v8;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v2 & 0xFFFFFFE0) == 32) * ((251 * (v3 ^ (v6 - 7))) ^ 0x2B8)) ^ (v5 + v3 - 1728))))();
}

void sub_1A126DC20()
{
}

uint64_t sub_1A126DC2C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v1 - 375861489) & 0x16672FFB) - 760) * (v0 != 0)) | v1)))();
}

uint64_t sub_1A126DC64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v7 = v2 > 7 && (unint64_t)(a1 - a2) > 0x1F;
  return (*(uint64_t (**)(void))(v4 + 8 * (((((v3 + 503442954) | 0x61300802) + ((v3 + 316) ^ (v5 - 877))) * v7) ^ v3)))();
}

uint64_t sub_1A126DCB4()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 > 0x1F) * (((v1 - 805) | 0x424) ^ 0x540)) ^ v1)))();
}

uint64_t sub_1A126DCE8@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((957
                                * (((((v3 + 1291863241) | 0x3231B007) - 82874673) & 0x85BE9E7F) - 1590 != (v2 & 0xFFFFFFE0))) ^ (v5 + ((v3 + 1291863241) | 0x3231B007) - 1811))))();
}

uint64_t sub_1A126DD64()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v0 == v1) ^ (v4 + v2)) & 1) * (v2 - 1576)) ^ v2)))();
}

uint64_t sub_1A126DD90()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v1 - 576) | 0x120) ^ (v3 + 1584) ^ (v1 + 2142630713) & 0xFF7BFF77)
                                     * ((v0 & 0x18) == 0)) ^ (v1 - 543))))();
}

uint64_t sub_1A126DDE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 - (v3 & 0xFFFFFFF8) == -8) * ((7 * (v4 ^ 0x55B)) ^ 0x8F)) ^ v4)))();
}

uint64_t sub_1A126DE34(uint64_t a1, uint64_t a2)
{
  *int v3 = *v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8 * (((a2 == 0) * v5) ^ v2)))(a1, a2 + 8);
}

uint64_t sub_1A126DE5C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v2 + 335607052) | 0x6B310100) ^ (v2 - 4719404) & 0x7F79F937 ^ 0x482) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A126DEB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + v2) = *(unsigned char *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * ((1482 * (v2 + 1 == v3)) ^ (v6 + v4 - 1598))))();
}

uint64_t sub_1A126DEE4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v0 == v1) ^ (v4 + v2 + 1)) & 1) * ((v2 - 515) ^ 0x4E3)) ^ v2)))();
}

uint64_t sub_1A126DF1C()
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((407 * ((v0 & 0x18) == (((v1 + 588330028) | 0x5C20C001u) ^ 0x7F31F907))) ^ v1)))();
}

uint64_t sub_1A126DF70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 - 7 + ((((2 * (v4 ^ 0xF)) ^ 0x42E) - 879) ^ v2) + v3) = *(void *)(a2
                                                                                                 - 7
                                                                                                 + ((((2 * (v4 ^ 0xF)) ^ 0x42E) - 879) ^ v2)
                                                                                                 + v3);
  return (*(uint64_t (**)(void))(v5 + 8 * ((15 * ((v3 & 0xFFFFFFF8) - 8 != v2)) ^ v4 ^ 0xF)))();
}

void sub_1A126DFC8()
{
}

uint64_t sub_1A126DFD0()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v2 ^ (v1 == v0))))();
}

uint64_t sub_1A126DFF0()
{
  return v0();
}

uint64_t sub_1A126DFF8()
{
  uint64_t v3 = *(void *)(v2 - 168);
  *(_DWORD *)(v3 - 0x50417EF54FC55D47) = (*(_DWORD *)(v2 - 112) ^ 0x76FDD9F0)
                                         - 1079005312
                                         + ((2 * *(_DWORD *)(v2 - 112)) & 0xEDFBB3E0);
  *(_DWORD *)(v3 - 0x50417EF54FC55D43) = 437737774;
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(v0 + 8 * ((v1 - 2286) ^ 0x7F31F907)))(*(unsigned int *)*(&off_1E5A4B410 + ((v1 + 18) ^ 0x7F31F907)), *(void *)(v2 - 128), *(unsigned int *)(v2 - 112));
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 11856);
  *(void *)(v2 - 200) = v3;
  return v5(v4);
}

uint64_t sub_1A126E068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v6 = v2 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a2 + v6);
  return (*(uint64_t (**)(void))(v4 + 8 * ((v5 + v3 - 643) ^ (2 * (v6 != 0)))))();
}

uint64_t sub_1A126E094()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((((v2 == 0x50417EF54FC55D4FLL) ^ (v0 ^ (v3 + 28))) & 1)
                                * ((v0 - 956) ^ 0x2F)) ^ v0)))();
}

uint64_t sub_1A126E0E0@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((((a1 + 1244690586) | 0x35018005) - 2133981210)
                                * (*(void *)(v2 - 0x50417EF54FC55D4FLL) == 0)) ^ a1)))();
}

void sub_1A126E13C()
{
  void *v2 = 0;
  *(_DWORD *)(v4 - 0x50417EF54FC55D47) = 917342576;
  *(_DWORD *)(v4 - 0x50417EF54FC55D43) = 437737774;
  (*(void (**)(void *))(v3 + 8 * (v0 + v1)))(v2);
  JUMPOUT(0x1A126E1A4);
}

uint64_t sub_1A126E264()
{
  uint64_t v4 = *(void *)(v3 - 200);
  int v5 = *(_DWORD *)(v4 - 0x50417EF54FC55D47);
  LODWORD(v4) = *(_DWORD *)(v4 - 0x50417EF54FC55D43) + 68792889;
  BOOL v6 = v4 < 0x1E310B63;
  BOOL v7 = v4 > v5 - 410811917;
  if (v6 != v5 - 410811917 < ((v2 + v0 - 2195) ^ 0x6100F264u)) {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((67 * (((v0 ^ (v2 - 1)) ^ v7) & 1)) ^ v0)))();
}

uint64_t sub_1A126E31C@<X0>(int a1@<W8>)
{
  BOOL v6 = (void *)(*(void *)(v5 - 200) - 0x50417EF54FC55D4FLL);
  int v7 = (*(unsigned __int8 *)(*v6 + (a1 - 437737774)) << 24) | (*(unsigned __int8 *)(*v6
                                                                                                + (a1 - 437737773)) << 16) | (*(unsigned __int8 *)(*v6 + (a1 - 437737772)) << 8);
  int v8 = *(unsigned __int8 *)(*v6 + (a1 - 437737771));
  _DWORD *v1 = a1 + 4;
  if (!(v7 | v8)) {
    return (*(uint64_t (**)(void))(v2 + 8 * ((53 * (*(void *)(v5 - 200) == 0x50417EF54FC55D4FLL)) ^ (v3 + v4 + 20))))();
  }
  if ((v7 | v8) == 0xFFFF4FFB) {
    return (*(uint64_t (**)(void))(v2
  }
                                + 8
                                * (((*(void *)&(**(&off_1E5A4B410 + (v4 ^ (v4 + 10))))[8] == 0)
                                  * ((v3 + v4 - 374) ^ 0x725)) ^ (v3 + v4 - 771))))();
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((111 * ((v4 - 7) ^ 0x7F31F907)) ^ 0x360)
                                * (*(void *)(v5 - 200) == 0x50417EF54FC55D4FLL)) ^ (v3 + 2133980234))))();
}

uint64_t sub_1A126E794@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((*v1 == 0) ^ (a1 ^ (v4 + 7))) & 1)
                                * (v3 + ((a1 + 907035900) | 0x4921B102) - 2232)) ^ a1)))();
}

void sub_1A126E7E4()
{
  (*(void (**)(void))(v4 + 8 * (v2 + v5)))();
  void *v1 = 0;
  *int v3 = 917342576;
  _DWORD *v0 = 437737774;
  (*(void (**)(void *))(v4 + 8 * (v2 + v5)))(v1);
  JUMPOUT(0x1A126E82CLL);
}

uint64_t sub_1A126E850()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((((v1 - v4 + 1445046535) | 0x29105000) ^ 0xFFFFFED2) + v1 - v4 + 1631 - v3 + 608)
                                     * (*v0 == 0)) ^ (v1 - v4 + 1631))))();
}

void sub_1A126E8A4()
{
  *(void *)uint64_t v0 = 0;
  *(_DWORD *)(v0 + _Block_object_dispose(&a9, 8) = 1122647118;
  *(_DWORD *)(v0 + 12) = 0;
  JUMPOUT(0x1A126E8D8);
}

void uv5t6nhkui()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t *)*(&off_1E5A4B410
                  + ((9 * ((dword_1E953E880 - dword_1E953E878) ^ 0x7D)) ^ byte_1A12A8590[byte_1A12A9000[(9 * ((dword_1E953E880 - dword_1E953E878) ^ 0x7D))] ^ 0x92])
                  - 198);
  unsigned __int8 v1 = 9 * (*v0 ^ dword_1E953E880 ^ 0x7D);
  uint64_t v2 = (uint64_t)*(&off_1E5A4B410 + (byte_1A12A8DC4[(byte_1A12A89A4[v1 - 4] ^ 0xC8) - 4] ^ v1) - 130);
  uint64_t v3 = *v0 - (void)&v8 + *(void *)(v2 - 4);
  uint64_t v4 = 1787074057 * v3 - 0x6585E11862ED39BLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  uint64_t *v0 = v4;
  *(void *)(v2 - 4) = v5;
  LOBYTE(v2) = 9 * ((v5 + *(_DWORD *)v0) ^ 0x7D);
  BOOL v6 = &(**(&off_1E5A4B410
          + ((9 * (dword_1E953E878 ^ 0x7D ^ dword_1E953E880)) ^ byte_1A12A8690[byte_1A12A9100[(9 * (dword_1E953E878 ^ 0x7D ^ dword_1E953E880))] ^ 0xF2])
          - 58))[-4];
  uint64_t v7 = *(void *)&v6[8
                    * ((29
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v6[8
                                                                        * (byte_1A12A8698[(byte_1A12A910C[v2 - 12] ^ 0xF2) - 8] ^ v2)
                                                                        + 17776])(24, 4101018099) != 0)) ^ 0x586)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A126EACC(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 378813108;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((46 * (v3 != 0)) ^ 0x3C8u)))();
}

uint64_t sub_1A126EB28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(v13 - 244) = v12;
  *(void *)(v13 - 192) = v11;
  *(_DWORD *)(v13 - 224) = v8;
  *(_DWORD *)(v13 - 220) = v10;
  *(void *)(v13 - 20_Block_object_dispose(&a9, 8) = v9;
  *(_DWORD *)(v5 + _Block_object_dispose(&a9, 8) = v6 + 4096;
  mach_msg_header_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                                       + 8
                                                                                       * ((43 * (((v5 == 0) ^ 0xE7) & 1)) ^ 0x4D2));
  *(void *)(v13 - 200) = 0x3972785B6BCAF92ALL;
  return v14(a1, a2, a3, a4, a5, 3793274687);
}

uint64_t sub_1A126EBCC()
{
  int v3 = v0 & 0xEBD;
  unsigned int v4 = ((v3 - 428) ^ 0x81BC0EF4) + *(_DWORD *)(v1 + 12);
  unsigned int v5 = *(_DWORD *)(v1 + 8) + 1797771605;
  BOOL v6 = v4 < (((v3 - 1164) | 0x2E0) ^ 0x81BC0EF0);
  BOOL v7 = v4 > v5;
  if (v6 != v5 < 0x81BC0C09) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v7;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((111 * v8) ^ v3)))(v1 + 8);
}

uint64_t sub_1A126EC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8 * (((((v16 == 0) ^ (a6 + v15 + 7)) & 1) * (v15 ^ 0x319)) ^ v15));
  *(void *)(v18 - 200) = 0x3972785B6BCAF92ALL;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a1);
}

uint64_t sub_1A126ECB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  int v23 = (a20 << ((v20 ^ (a6 + 100)) + 101)) - 757626216;
  unsigned int v24 = ((2 * v23) & 0x2FAFF5F8) + (v23 ^ 0x97D7FAFC);
  if ((a20 + 26154070) < 0x18234F06 != v24 - 2142546934 < 0x18234F06) {
    BOOL v25 = v24 - 2142546934 < 0x18234F06;
  }
  else {
    BOOL v25 = v24 - 2142546934 > a20 + 26154070;
  }
  return (*(uint64_t (**)(void))(v21 + 8 * (((2 * !v25) | (16 * !v25)) ^ (v22 + v20 - 2003))))();
}

uint64_t sub_1A126ED6C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (int)((((v2 - 24) ^ 0xE218C73F) * (v0 == 0)) ^ 0x66B)))();
}

uint64_t sub_1A126EDAC@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v2 + 8 * (int)(a1 ^ 0xE218CF80)))(v1);
  return v3;
}

void Gg9q7vHg34(unint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 > 0xFFFFFFFFFFFFFFEFLL && a2 != 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A127246C(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
  BOOL v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 18520))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((120 * v3) ^ 0x599u)))();
}

uint64_t sub_1A12724B8(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 35853729;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((103 * (v3 != 0)) ^ 0x137)))();
}

uint64_t sub_1A1272528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  *(void *)(v35 - 152) = v34 + 0x1F534F2566915141;
  *(_DWORD *)(v34 + _Block_object_dispose(&a9, 8) = v31 + 4096;
  uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8 * (int)(((((v34 == 0) ^ (v29 + 102)) & 1) * (((v29 - 316339610) ^ 0xED250A23) - 321)) ^ (v29 + 1540)));
  *(void *)(v35 - 16_Block_object_dispose(&a9, 8) = (char *)*(&off_1E5A4B410 + v29 - 298) - 8;
  *(void *)(v35 - 200) = 0x2B2216E748EAFB5FLL;
  *(void *)(v35 - 144) = v34;
  return v36(a1, a2, a3, a4, a5, a6, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           v30,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           v32);
}

uint64_t sub_1A12725D8()
{
  int v3 = v0 & 0x17FB;
  unsigned int v4 = *(_DWORD *)(v2 + 12) + 255685404;
  unsigned int v5 = *(_DWORD *)(v2 + 8) + 219831671;
  BOOL v6 = v4 < 0xF3D7318;
  BOOL v7 = v4 > v5;
  if (v6 != v5 < 0xF3D7318) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v7;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((!v8 * (((v3 - 647) | 0x629) ^ 0x70C)) ^ v3)))();
}

void sub_1A127265C(int a1@<W6>, int a2@<W7>, int a3@<W8>)
{
  *(void *)(v8 - 200) = 0x2B2216E748EAFB5FLL;
  uint64_t v9 = *v7;
  unsigned int v10 = ((a3 << (v4 ^ 0x3A)) & 0x4FFE7BFE) + (a3 ^ 0x27FF3DFF) - 671038975;
  *(unsigned char *)(*v7 + v10) = 0;
  *(unsigned char *)(v9 + v10 + 1) = 0;
  *(unsigned char *)(v9 + v10 + 2) = 0;
  *(unsigned char *)(v9 + v10 + 3) = 1;
  *v3 += 4;
  *(void *)(v8 - 160) = v6;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A127299C()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)((((v0 - 137) ^ 0x9A3 ^ (v0 + 1825921279) & 0x932A9FFF) * (v2 == 0)) ^ (v0 - 119))))();
}

uint64_t sub_1A12729EC()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) - 1129964345;
  unsigned int v4 = *(_DWORD *)(v2 + 8) - 1165818078;
  BOOL v5 = v3 < 0xBCA61CC3;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((v0 + 522693193) & 0xE0D84DFF ^ 0xBCA61CBC)) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((89 * v6) ^ v0)))();
}

uint64_t sub_1A1272A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (((((v28 == 0) ^ (v25 - 119)) & 1) * ((v25 - 1975) ^ 0x9E)) ^ (v25 - 1975)));
  *(void *)(v29 - 160) = v27;
  return v30(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A1272AD8()
{
  int v3 = ((v1 ^ 0x329) - 334) | 0x130;
  unsigned int v4 = (v3 ^ 0x1425AD21) + v0;
  unsigned int v5 = ((v3 - 1536722772) & (2 * (2 * v0 - 71707458))) + ((2 * v0 - 71707458) ^ 0xD233BDF3);
  if (v4 < 0x1648C3B6 != v5 + 1142228419 < 0x1648C3B6) {
    BOOL v6 = v5 + 1142228419 < 0x1648C3B6;
  }
  else {
    BOOL v6 = v5 + 1142228419 > v4;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((110 * !v6) ^ v3)))();
}

uint64_t sub_1A1272B90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v30 = *(void *)(v29 - 152);
  int v31 = (v27 - 2030371456) & 0x790503BE;
  *(void *)(v29 - 152) = v30;
  uint64_t v32 = *(void *)(v30 - 0x1F534F2566915141);
  int v33 = ((2 * a9) & 0x57DFFDDE) + (a9 ^ 0x2BEFFEEF);
  *(unsigned char *)(v32 + v33 + (v31 ^ 0xD41000AF)) = 56;
  v33 -= 737148753;
  *(unsigned char *)(v32 + (v33 + 99)) = 91;
  *(unsigned char *)(v32 + (v33 + 100)) = 44;
  *(unsigned char *)(v32 + (v33 + 101)) = -24;
  *v26 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (int)((a7 + a8 + (v31 ^ 0x5E9) - 1111 - 1238) ^ v31)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A1272D78()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((((v0 ^ 0x440) + 931) ^ (39 * (v0 ^ 0x440))) * (v2 == 0)) ^ v0)))();
}

uint64_t sub_1A1272DB8()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) + 2103532965;
  unsigned int v4 = *(_DWORD *)(v2 + 8) + 2067679232;
  BOOL v5 = v3 < (v0 ^ 0x7D615E20u);
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((v0 - 373) | 0x42u) + 2103532371) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((1844 * v6) ^ v0)))();
}

uint64_t sub_1A1272E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  HIDWORD(a23) = v24;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * ((((v25 ^ 0x28) - 582) * (v27 != 0)) ^ v25)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_1A1272E7C()
{
  int v3 = 3 * (v1 ^ 0x2AC);
  unsigned int v4 = v0 - 1615262585 + v3;
  unsigned int v5 = (((2 * v0 - 71707458) << ((v3 + 75) ^ 0xA8)) & 0xA776EB70) + ((2 * v0 - 71707458) ^ 0xD3BB75B9);
  if (v4 < 0xA1DC2482 != v5 - 836718903 < 0xA1DC2482) {
    BOOL v6 = v5 - 836718903 < 0xA1DC2482;
  }
  else {
    BOOL v6 = v5 - 836718903 > v4;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((56 * !v6) ^ v3)))();
}

uint64_t sub_1A1272F4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v29 = *(void *)(v28 - 152);
  int v30 = (v26 - 589) | 0x38A;
  *(void *)(v28 - 152) = v29;
  uint64_t v31 = *(void *)(v29 - 0x1F534F2566915141);
  unsigned int v32 = ((2 * a9) & 0x478E7FDE) + (a9 ^ 0x23C73FEF);
  unsigned int v33 = v32 + (v30 ^ 0xDC38C399);
  v32 -= 600260591;
  *(unsigned char *)(v31 + v32) = 0;
  *(unsigned char *)(v31 + v33) = 0;
  *(unsigned char *)(v31 + v32 + 2) = 0;
  *(unsigned char *)(v31 + v32 + 3) = 1;
  *v25 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (int)((((9 * (v30 ^ 0x33C)) ^ (a7 + 557)) + v30 - a7 + 1332) ^ v30)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A127312C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((((((2 * v0) ^ 0xD60) - 312) | 0x618) ^ 0x684) * (v2 == 0)) ^ v0)))();
}

uint64_t sub_1A127316C()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) + 1658655541;
  unsigned int v4 = *(_DWORD *)(v2 + 8) + ((v0 + 190) ^ 0x60B9FAD0);
  BOOL v5 = v3 < ((v0 - 1534) | 0x10Au) + 1658655107;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x62DD132D) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((3611 * v6) ^ v0)))();
}

uint64_t sub_1A12731F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  LODWORD(a23) = v23;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8 * (((((2 * v24) ^ 0xF06) + ((v24 - 1704) | 0x509) - 1852) * (v26 == 0)) ^ v24)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A1273238()
{
  unsigned int v3 = v0 - 1610165446;
  BOOL v4 = (v0 - 1610165446) < 0xA229E8D3;
  unsigned int v5 = ((2 * (2 * v0 - 71707458)) & 0xB677EFD4) + ((2 * v0 - 71707458) ^ ((v1 ^ 0x29A) - 616828732));
  if (v4 != v5 - 957484824 < 0xA229E8D3) {
    BOOL v6 = v5 - 957484824 < 0xA229E8D3;
  }
  else {
    BOOL v6 = v5 - 957484824 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((527 * v6) ^ v1)))();
}

uint64_t sub_1A12732DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v35 = *(void *)(v34 - 152);
  uint64_t v36 = (v32 + 20);
  *(void *)(v34 - 152) = v35;
  uint64_t v37 = *(void *)(v35 - 0x1F534F2566915141);
  uint64_t v38 = ((2 * a9) & 0x1CAB9FBB6) + (a9 ^ 0x7BAFA3BFE55CFDDBLL);
  *(unsigned char *)(v37 + v38 + (v36 ^ 0x84505C401AA3039BLL)) = -1;
  uint64_t v39 = v37 - 0x7BAFA3BFE55CFDDALL + v38;
  *(_WORD *)uint64_t v39 = -1;
  *(_DWORD *)(v39 + 2) = -1;
  *(unsigned char *)(v39 + 6) = (a31 - ((2 * a31) & 0x58) + 44) ^ 0x2C;
  *v31 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8 * (int)((v36 - a7 + 1793) ^ (a8 + 46) ^ v36 ^ 0x571 ^ v36)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_1A1273508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  *(void *)(v10 - 12_Block_object_dispose(&a9, 8) = 0;
  return (*(uint64_t (**)(void))(v8 + 8 * (int)(((a7 + ((v7 - 4851920) & 0xB47F2FBF) - 2216) * (v9 == 0)) ^ v7)))();
}

uint64_t sub_1A1273560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v31 = v27 - 796;
  uint64_t v32 = (*(uint64_t (**)(void))(v28 + 8 * ((v27 - 796) ^ 0x892)))();
  (*(void (**)(uint64_t, uint64_t, void, void))(v28 + 8 * (v31 + 1846)))(v32, *(void *)(v29 + 8 * (v31 - 430)) - 3, **(void **)(v30 - 144), *(unsigned int *)(*(void *)(v30 - 144) + 12));
  uint64_t v33 = (*(uint64_t (**)(void, void))(v28 + 8 * (v31 + 1868)))(*(void *)(v30 - 168), 0);
  *(void *)(v30 - 192) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((v33 == 0) * (v31 + (v31 ^ 0x7F) + 33)) ^ v31)))(v33, v34, v35, v36, v37, v38, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A1273610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v30 = (*(uint64_t (**)(void, uint64_t, void))(v27 + 8 * (v26 + 1848)))(*(void *)(v28 - 168), a1, 0);
  int v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * ((v30 == 0) ^ v26));
  *(void *)(v28 - 192) = a1;
  return v31(v30, v32, v33, v34, v35, v36, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A1273670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  int v39 = v35 ^ 0x248;
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v39 + 1455)))(a1, *(void *)(v37 + 8 * (v39 - 869)) - 12);
  (*(void (**)(uint64_t))(v36 + 8 * (v39 + 1325)))(a1);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v39 ^ 0xAA8)))(a1, a35);
  uint64_t v40 = (*(uint64_t (**)(void))(v36 + 8 * (v39 ^ 0xA96)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (int)(((v40 != *(void *)(v37 + 8 * (v39 - 890))) * ((v39 - 1176667641) ^ 0xB9DD7D70 ^ (v39 - 1176667641) & 0x462282FC ^ 0x66)) ^ v39)))(v40, v41, v42, v43, v44, v45, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A1273748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  unsigned int v33 = (a8 + v30 - 1321618659) & 0x9A9128FD;
  uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 8 * (v30 + 2075)))(a29, v31, v32 - 128);
  int v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29
                                                                                                + 8
                                                                                                * (int)(((v34 == 0) * (v33 ^ 0x946)) ^ v30));
  *(void *)(v32 - 200) = 0x2B2216E748EAFB5FLL;
  return v35(v34, v36, v37, v38, v39, v40, 1271586048);
}

uint64_t sub_1A12737E4()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 + 54)))(24, 4101018099);
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1
                                                                                               + 8
                                                                                               * (((v3 != 0)
                                                                                                 * (((v0 - 2078269644) | 0x301503B6)
                                                                                                  + 1271583817)) ^ v0));
  *(void *)(v2 - 200) = 0x2B2216E748EAFB5FLL;
  return v4(v3, v5, v6, v7, v8, v9, 1271586048);
}

uint64_t sub_1A1273878(uint64_t a1)
{
  *(void *)(v3 - 176) = a1 + 0x2B2216E748EAFB5FLL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = 445517218;
  *(_DWORD *)(a1 + 12) = 661609844;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 54)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v5 != 0) * ((v1 - 1723) ^ 0x27F)) ^ (v1 - 2070))))();
}

uint64_t sub_1A12738FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_DWORD *)(v9 + _Block_object_dispose(&a9, 8) = v8 + 4096;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8 * (((*(void *)(v10 - 128) > (unint64_t)(v8 - 445513122)) * ((5 * ((v6 | 0x21) ^ 0x22D)) ^ 0xB4C)) ^ (v6 | 0x21))))(a1, a2, a3, a4, a5, a6, 1271586048, 3023383487);
}

uint64_t sub_1A1273964(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2
                                                     + 8
                                                     * (((((v4 == 0) ^ ((v3 ^ 7) + 59) ^ 0x69) & 1)
                                                       * ((((v3 ^ 0x707) - 1211718341) & 0x48395B7F) - 2080)) ^ v3 ^ 0x707)))(a1, a2);
}

uint64_t sub_1A12739C4@<X0>(int a1@<W8>)
{
  int v5 = v2 - 108;
  unsigned int v6 = v1 + v3 + a1;
  int v7 = ((2 * ((a1 << (v5 ^ 0x60)) - 891034436)) & 0x3D1E9BCC) + (((a1 << (v5 ^ 0x60)) - 891034436) ^ 0x1E8F4DE7);
  if (v6 > 0xA80F72B4 != (v7 + 962674532) < 0x57F08D4B) {
    BOOL v8 = (v7 + 962674532) < 0x57F08D4B;
  }
  else {
    BOOL v8 = v7 + 962674532 > (v5 ^ 0x57F08E2A) + v6;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8 * ((172 * !v8) ^ v5)))(1025416140, 4227776443, 962674532);
}

uint64_t sub_1A1273A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v29
                              + 8
                              * (int)(((a29 == (void)*(&off_1E5A4B410 + v30 - 117) - 8)
                                     * ((a8 + ((v30 + 376) | 0x191) - 1689) ^ (v30 - 1258295497) & 0xFF353BFF)) ^ v30)))();
}

uint64_t sub_1A1273B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v37 + 8 * (v36 + 1435));
  *(void *)(v38 - 176) = v35;
  v39(a26, a35);
  uint64_t v40 = (*(uint64_t (**)(void))(v37 + 8 * (v36 ^ 0xA83)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (int)(((v40 == *(void *)(v38 - 176)) * (v36 - 553 + ((v36 + 1399813486) & 0xAC9087FB) + 966)) ^ v36)))(v40, v41, v42, v43, v44, v45, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A1273B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v30 + 8 * (((a7 + ((v31 + 521) ^ (a8 - 753)) - 989) * (a29 == v29)) ^ v31)))();
}

uint64_t sub_1A1273BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v35 + 1467)))(a26, a35);
  uint64_t v38 = (*(uint64_t (**)(void))(v36 + 8 * (v35 ^ 0xA63)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (((((v35 - 20) ^ (v38 == *(void *)(v37 - 176))) & 1) * ((v35 + 1550007276) ^ 0x5C633FBD)) ^ v35)))(v38, v39, v40, v41, v42, v43, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A1273C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v30
                              + 8
                              * (int)(((((a29 == v29) ^ (v31 + 52)) & 1)
                                     * (((v31 & 0xA39CC0FF) - 42599518) & 0xB6BF2FBF ^ (a8 - 85))) ^ v31 & 0xA39CC0FF)))();
}

uint64_t sub_1A1273CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v35 + 1435)))(a26, a35);
  uint64_t v38 = (*(uint64_t (**)(void))(v36 + 8 * (v35 + 1409)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (int)(((v38 == *(void *)(v37 - 176)) * (((v35 + 1187161198) & 0xB93D58FB) + (v35 ^ 0x7D))) ^ v35)))(v38, v39, v40, v41, v42, v43, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A1273D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v31
                              + 8
                              * (int)((((((v29 ^ 0x319) + 248) | 0x211) ^ (a8 + 659) ^ ((v29 ^ 0x319) - 33706121) & 0xB6377BBF)
                                     * (a29 == v30)) ^ v29 ^ 0x319)))();
}

uint64_t sub_1A1273DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v38 = v35;
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v36 ^ 0xABD)))(a26, a35);
  uint64_t v39 = (*(uint64_t (**)(void))(v37 + 8 * (v36 ^ 0xA83)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (int)(((v39 == v38) * ((v36 ^ 0x36A) + 1271586048 + ((v36 - 1119912850) & 0xF6F5ABBF) - 1392)) ^ v36)))(v39, v40, v41, v42, v43, v44, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A1273E50()
{
  uint64_t v4 = *(uint64_t (**)(void))(v1 + 8 * (int)((((v0 ^ 0xB43529A5) + 1271584009) * (v2 == 0)) ^ v0 ^ 0x25A));
  *(void *)(v3 - 200) = 0x2B2216E748EAFB5FLL;
  return v4();
}

uint64_t sub_1A1273EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  (*(void (**)(uint64_t))(v36 + 8 * (v37 ^ (a8 - 2239))))(v38);
  *(void *)(v39 - 200) = 0x2B2216E748EAFB5FLL;
  (*(void (**)(uint64_t))(v36 + 8 * (int)(v37 ^ 0xB43522BA)))(v35);
  (*(void (**)(uint64_t))(v36 + 8 * (v37 & 0x4240C905)))(a26);
  return (*(uint64_t (**)(void))(v36 + 8 * ((4033 * (a35 != 0)) ^ (v37 + 1271585819))))();
}

uint64_t sub_1A1274288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v34 = (*(uint64_t (**)(void))(v32 + 8 * v30))();
  uint64_t v35 = *(uint64_t (**)(uint64_t))(v32 + 8 * ((v29 - 1233) ^ (1982 * (a29 != 0))));
  *(void *)(v33 - 192) = v31;
  return v35(v34);
}

uint64_t sub_1A12742E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v36 = (*(uint64_t (**)(uint64_t))(v31 + 8 * (v34 & 0x88905)))(a29);
  *(void *)(v35 - 192) = v30;
  if (v32 == -45004)
  {
    *(void *)(v35 - 176) = v29;
    *(void *)(v35 - 120) = 0;
    *(_DWORD *)(v35 - 132) = 0;
    uint64_t v37 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v31 + 18736))(**(unsigned int **)(v33 + 64), **(void **)(v35 - 144), *(unsigned int *)(*(void *)(v35 - 144) + 12), v35 - 120, v35 - 132);
    int v38 = (v37 ^ 0x5B5FEEA9) - 285344800 + ((2 * v37) & 0xB6BFDD52) != 1516104332;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * ((v38 | (v38 << 6)) ^ 0x419)))(v37, v39, v40, v41, v42, v43, v44, v45, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26);
  }
  else if (v32)
  {
    return (*(uint64_t (**)(uint64_t))(v31
                                              + 8 * ((32 * (((*(void *)(v35 - 144) == 0) ^ 0x43) & 1)) | 0x107)))(v36);
  }
  else
  {
    return (*(uint64_t (**)(uint64_t))(v31
                                              + 8 * ((63 * (*(void *)(v35 - 200) == 0x2B2216E748EAFB5FLL)) ^ 0x29D)))(v36);
  }
}

uint64_t sub_1A1274A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = ((((v3 + 483) ^ 0x749) - 810) ^ 0x76B21497) + *(_DWORD *)(a3 - 0x2B2216E748EAFB53);
  unsigned int v6 = *(_DWORD *)(a3 - 0x2B2216E748EAFB57) - 2087492361;
  BOOL v7 = v5 < 0x9E217299;
  BOOL v8 = v5 > v6;
  if (v6 < 0x9E217299 != v7) {
    BOOL v8 = v7;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((87 * !v8) ^ (v3 + 483))))();
}

uint64_t sub_1A1274AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 - 0x2B2216E748EAFB5FLL);
  int v8 = (*(unsigned __int8 *)(v7 + ((((v5 + 1353215190) & 0xAF578FFF) - 661607984) ^ (v5 + 790672959) & 0xD0DF4DDA) + v4) << 24) | (*(unsigned __int8 *)(v7 + (v4 - 661609843)) << 16) | (*(unsigned __int8 *)(v7 + (v4 - 661609842)) << 8) | *(unsigned __int8 *)(v7 + (v4 - 661609841));
  *int v3 = v4 + 4;
  return (*(uint64_t (**)(void))(v6 + 8 * ((3178 * (v8 == 0)) ^ v5)))();
}

uint64_t sub_1A1274BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((((86 * (v3 ^ 0x90C)) ^ 0x4A5) * (a3 != 0x2B2216E748EAFB5FLL)) | v3)))();
}

uint64_t sub_1A1274BF4(int a1)
{
  unsigned int v4 = ((((a1 + 1570025802) & 0xA26B4BBF) + 810) ^ 0x686C2B9) + v2;
  int v5 = ((v1 - 106596729) < 0x2114D3F3) ^ (v4 < 0x2114D3F3);
  BOOL v6 = v1 - 106596729 > v4;
  if (v5) {
    BOOL v6 = (v1 - 106596729) < 0x2114D3F3;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((92 * v6) ^ a1)))();
}

uint64_t sub_1A1274C74@<X0>(uint64_t a1@<X2>, int a2@<W6>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int *a15)
{
  int v21 = (*(unsigned __int8 *)(v17 + (v18 + v16 + 3)) << (v19 + 48)) | (*(unsigned __int8 *)(v17 + (v18 + v16 + 4)) << 16) | (*(unsigned __int8 *)(v17 + (v18 + v16 + 5)) << 8) | *(unsigned __int8 *)(v17 + (v18 + v16 + 6));
  *int v15 = v16 + 8;
  *a15 = v21;
  return (*(uint64_t (**)(void))(v20
                              + 8
                              * (int)(((a2 + v19 - 591 + ((v19 - 188926185) & 0xBF77EFBF) - 2786) * (a1 != a3)) ^ (v19 - 810))))();
}

uint64_t sub_1A1274D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  BOOL v11 = *(void *)(*(void *)(v10 - 200) - 0x2B2216E748EAFB5FLL) == 0;
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (((v11 ^ (a8 + v8 + 103)) & 1 | (32
                                                                                * ((v11 ^ (a8 + v8 + 103)) & 1))) ^ v8)))();
}

void sub_1A1274D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  (*(void (**)(void))(v11 + 8 * (v10 ^ (a8 - 2239))))();
  void *v9 = 0;
  *(_DWORD *)(v8 - 0x2B2216E748EAFB57) = 445517218;
  *(_DWORD *)(v8 - 0x2B2216E748EAFB53) = 661609844;
  (*(void (**)(void *))(v11 + 8 * (v10 + 1271586048)))(v9);
  JUMPOUT(0x1A1275628);
}

uint64_t sub_1A1274DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,_DWORD *a27,int a28,int a29)
{
  unsigned int v33 = (a8 - 1337304249) & 0x9B807CF9;
  uint64_t v34 = (*(uint64_t (**)(void))(v30 + 8 * (a8 ^ (a8 - 2239))))(*(void *)(v29 - 0x2B2216E748EAFB5FLL));
  *(void *)(v29 - 0x2B2216E748EAFB5FLL) = a22;
  *a27 = a29;
  *(void *)(v32 - 160) = v31;
  return (*(uint64_t (**)(uint64_t))(v30 + 8 * (int)(((v33 ^ 0x5C0) - 342) | v33)))(v34);
}

void sub_1A1274E6C()
{
  *(void *)(v1 - 184) = v0;
  JUMPOUT(0x1A1274E98);
}

uint64_t sub_1A1274F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (int)((((v9 - 159553200) ^ 0xF67D6DC8 ^ (a8 - 449) ^ (v9 - 159553200) & 0xBDB7BBBF)
                                     * (v8 != 0)) ^ v9)))();
}

uint64_t sub_1A1274F50@<X0>(uint64_t a1@<X0>, int a2@<W7>, uint64_t a3@<X8>)
{
  BOOL v7 = v3 < 8 || a1 - a3 < ((v4 - 2023158380) & 0x7896F5B7 ^ 0x5A3uLL);
  return (*(uint64_t (**)(void))(v5 + 8 * (int)((v7 * ((v4 - 1133041272) & 0xF7BDFFFF ^ (a2 + 38))) ^ v4)))();
}

uint64_t sub_1A1274FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v10 + 8 * (((a7 + a8 + (v9 ^ 0x2E2) - 1889 - 2202) * (v8 > 0x1F)) ^ v9)))();
}

uint64_t sub_1A1274FEC@<X0>(_OWORD *a1@<X0>, int a2@<W6>, int a3@<W7>, _OWORD *a4@<X8>)
{
  long long v7 = a4[1];
  *a1 = *a4;
  a1[1] = v7;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((37 * (((v5 - a3 + 910) ^ 0x3AELL) == (v4 & 0xFFFFFFE0))) ^ (a2 + v5 - 618))))();
}

uint64_t sub_1A1275044()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v0 == 0) ^ (5 * (v1 ^ 0xEE))) & 1) * (v1 - 1908)) ^ v1)))();
}

uint64_t sub_1A1275078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v11 = v8 < ((((v9 - 2147212921) | 0x34310817) - a8 + 1057) ^ 0x429u);
  return (*(uint64_t (**)(void))(v10 + 8 * ((v11 | (4 * v11)) ^ v9)))();
}

uint64_t sub_1A12750C0()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((14 * (v1 >= ((v0 + 178) ^ 0x4F3uLL))) | v0)))();
}

uint64_t sub_1A12750F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v9 + 8 * (((v7 >= a7 + ((v8 - 1128928468) & 0xF77F3BBF) - 2207) * (v8 ^ 0x4D5)) ^ v8)))();
}

uint64_t sub_1A1275148@<X0>(uint64_t a1@<X0>, int a2@<W6>, int a3@<W7>, uint64_t a4@<X8>)
{
  uint64_t v7 = (v4 - 1);
  long long v8 = *(_OWORD *)(a4 + v7 - 15);
  long long v9 = *(_OWORD *)(a4 + v7 - 31);
  uint64_t v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((633 * (2 * (v5 ^ (a3 - 299)) - 566 == (v4 & 0xFFFFFFE0))) ^ (a2 + v5 - 1147))))();
}

uint64_t sub_1A12751B0()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 ^ 0x60D) - 1381) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A12751D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8 * (int)((((v9 - 151669188) & 0xBD3F6FFF ^ (a8 - 950)) * ((v8 & 0x18) == 0)) ^ v9)))();
}

uint64_t sub_1A1275218@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * ((3867 * (((27 * (v4 ^ 0x776u)) ^ 0x265) + v2 == (v3 & 0xFFFFFFF8))) ^ v4)))();
}

uint64_t sub_1A1275268()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v2 - 386) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A1275290@<X0>(uint64_t a1@<X0>, int a2@<W6>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a1 + v3) = *(unsigned char *)(a3 + v3);
  return (*(uint64_t (**)(void))(v6 + 8 * ((29 * (v3 + 1 != v4)) | (a2 + v5 - 1695))))();
}

uint64_t sub_1A12752C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v11 + 8 * ((((v10 - a7 + 1641) ^ (a8 + 941) ^ 0x4D9) * (v8 == v9)) ^ v10)))();
}

uint64_t sub_1A12752F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8 * ((711 * ((v8 & 0x18) == ((a8 + v9 + 1295515245) & 0xFE92D59E) - 1182)) ^ v9)))();
}

uint64_t sub_1A1275344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 - 7 + (v2 ^ 0xFFFFFDDB ^ ((v4 - 638) | 4)) + v3) = *(void *)(a2
                                                                                            - 7
                                                                                            + (v2 ^ 0xFFFFFDDB ^ ((v4 - 638) | 4))
                                                                                            + v3);
  return (*(uint64_t (**)(void))(v5 + 8 * ((726 * ((v3 & 0xFFFFFFF8) - 8 == v2)) ^ v4)))();
}

void sub_1A1275398()
{
}

uint64_t sub_1A12753A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v11 + 8 * (((v10 ^ (a8 - 548) ^ (v10 - a7 + 2022)) * (v9 == v8)) ^ v10)))();
}

uint64_t sub_1A12753D4()
{
  return v0();
}

uint64_t sub_1A12753DC()
{
  uint64_t v2 = *(void *)(v1 - 184);
  *(_DWORD *)(v2 - 0x2B2216E748EAFB57) = (*(_DWORD *)(v1 - 132) ^ 0x7AAF7FB3)
                                         - 1612804625
                                         + ((2 * *(_DWORD *)(v1 - 132)) & 0xF55EFF66);
  *(_DWORD *)(v2 - 0x2B2216E748EAFB53) = 661609844;
  uint64_t v3 = v2;
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(v0 + 18672))(MEMORY[0x1EB1CB748], *(void *)(v1 - 120), *(unsigned int *)(v1 - 132));
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 7448);
  *(void *)(v1 - 200) = v3;
  return v5(v4);
}

uint64_t sub_1A127544C@<X0>(uint64_t a1@<X0>, int a2@<W6>, uint64_t a3@<X8>)
{
  unsigned int v6 = v3 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a3 + v6);
  return (*(uint64_t (**)(void))(v5 + 8 * ((225 * (v6 == 0)) ^ (a2 + v4 - 423))))();
}

uint64_t sub_1A1275480()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((v1 != 0x2B2216E748EAFB5FLL) | v0)))();
}

uint64_t sub_1A12754BC@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((((a1 | 0xC9) - 1124648714) & 0xF73DEFFF) - 21) ^ (a1 | 0xC9) ^ 0xB4352976)
                                     * (*(void *)(v1 - 0x2B2216E748EAFB5FLL) == 0)) ^ (a1 | 0xC9))))();
}

void sub_1A1275528(int a1@<W8>)
{
  void *v2 = 0;
  *(_DWORD *)(v3 - 0x2B2216E748EAFB57) = 445517218;
  *(_DWORD *)(v3 - 0x2B2216E748EAFB53) = 661609844;
  (*(void (**)(void *))(v4 + 8 * (a1 ^ (v1 - 2239))))(v2);
  JUMPOUT(0x1A12755A8);
}

uint64_t sub_1A127565C@<X0>(int a1@<W6>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((*v3 != 0) * (a1 + ((a2 + 607126217) | 0x900523B3) - 2187)) | a2)))();
}

void sub_1A127569C()
{
  (*(void (**)(void))(v1 + 8 * (v0 & 0x200CCFF)))();
  *(void *)uint64_t v2 = 0;
  *(_DWORD *)(v2 + _Block_object_dispose(&a9, 8) = 35853729;
  *(_DWORD *)(v2 + 12) = 0;
  JUMPOUT(0x1A12756D0);
}

void p435tmhbla()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1E5A4B410
                + ((9 * ((dword_1E953E880 + dword_1E953E8A0) ^ 0x7D)) ^ byte_1A12A8590[byte_1A12A9000[(9 * ((dword_1E953E880 + dword_1E953E8A0) ^ 0x7D))] ^ 0x1A])
                - 159);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8DC4[(byte_1A12A89A4[(9 * ((dword_1E953E880 + v1) ^ 0x7D))
                                                                 - 4] ^ 0xC8)
                                                 - 4] ^ (9 * ((dword_1E953E880 + v1) ^ 0x7D)))
                - 130);
  unint64_t v3 = 1787074057 * ((*(void *)(v2 - 4) - v1 - (void)&v6) ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v3;
  *(void *)(v2 - 4) = v3;
  LOBYTE(v2) = 9 * ((v3 + *(_DWORD *)(v0 - 4)) ^ 0x7D);
  uint64_t v4 = &(**(&off_1E5A4B410
          + ((9 * ((dword_1E953E880 + dword_1E953E8A0) ^ 0x7D)) ^ byte_1A12A8590[byte_1A12A9000[(9 * ((dword_1E953E880 + dword_1E953E8A0) ^ 0x7D))] ^ 0x92])
          - 183))[-4];
  uint64_t v5 = *(void *)&v4[8
                    * ((8
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v4[8
                                                                        * (byte_1A12A8CC0[byte_1A12A88A8[v2 - 8] ^ 0xF5] ^ v2)
                                                                        + 16592])(24, 4101018099) != 0)) | 0x740)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A12758D4(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 1640180093;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * (((2 * (v3 == 0)) | (8 * (v3 == 0))) ^ 0x6C2u)))();
}

uint64_t sub_1A1275928()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((15 * (((v0 == 0) ^ 0xED) & 1)) ^ 0x486u)))();
}

uint64_t sub_1A1275960@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * ((a1 & 0x36DFEF7) - 57533478)))(v1);
  return v2;
}

int *sub_1A127917C(int *result)
{
  int v1 = 1607344658;
  unsigned int v2 = result[2] ^ (2052531167
                  * (((result | 0x5A1B0962) - result + (result & 0xA5E4F69D)) ^ 0x9F91BE4E));
  if (v2 - 1830816770 > 0x39
    || ((1 << ((*((unsigned char *)result + 8) ^ (-33
                                                           * (((result | 0x62)
                                                             - (_BYTE)result
                                                             + (result & 0x9D)) ^ 0x4E)))
               - 2)) & 0x3C8E3C03CE503CFLL) == 0)
  {
    unsigned int v4 = v2 - 1830818786;
    BOOL v5 = v4 > 0xD;
    int v6 = (1 << v4) & 0x203F;
    if (v5 || v6 == 0) {
      int v1 = 1607344657;
    }
  }
  *uint64_t result = v1;
  return result;
}

void tn46gtiuhw(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4) {
    BOOL v7 = a5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v10 = v7 || a6 == 0 || a7 == 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A12792E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  return (*(uint64_t (**)(void))(v7 + 8 * ((50 * (qword_1E953EC30 == 0)) ^ 0x45Au)))();
}

uint64_t sub_1A1279340()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((4 * (*(void *)(v3 + 24) == 0)) | (8 * (*(void *)(v3 + 24) == 0))) ^ (v0 + v1 - 986))))();
}

uint64_t sub_1A127936C()
{
  (*(void (**)(void))(v2 + 8 * (v1 + v0)))();
  *(void *)(v3 + 24) = 0;
  *(_DWORD *)(v3 + 36) = 0;
  *(void *)uint64_t v3 = 0;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((4 * (*(void *)(v3 + 48) != 0)) | (16 * (*(void *)(v3 + 48) != 0)) | (v0 + v1 - 733))))();
}

uint64_t sub_1A12793B4()
{
  (*(void (**)(void))(v2 + 8 * (v1 ^ (v1 - 2221))))();
  *(void *)(v3 + 4_Block_object_dispose(&a9, 8) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((63 * (*(void *)(v3 + 64) == 0)) ^ (v0 + v1 - 1451))))();
}

uint64_t sub_1A12793F8()
{
  *(_DWORD *)(v3 + 76) = 0;
  *(void *)(v3 + 40) = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v0 + v1 + 76)))(24, 4101018099);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 8 * (((v4 == 0) * ((v1 ^ (v1 + 12)) - 980)) | (v0 + v1 - 1126))))(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1A1279510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 120617518;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8 * (v9 + 1303)))(4096, 1358311088);
  *(void *)a1 = v12;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8 * (int)(((v12 == 0) * ((2 * v9) ^ 0x186 ^ (v9 + 492302575) & 0xE2A80FBE ^ 0x2C5)) ^ v9)))(v12, v13, v14, v15, v16, v17, v18, v19, a9);
}

uint64_t sub_1A127959C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 + v0 - 1261) ^ (v0 - v4 + 1053)) * (v3 == 0)) | v0)))();
}

uint64_t sub_1A12795D0@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v2 + 8 * ((a1 - 1186) ^ (v1 - 2221))))(v3);
  return v4;
}

void fy34trz2st()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8CC0[byte_1A12A88A8[(9 * ((dword_1E953E880 + dword_1E953E898) ^ 0x7D))
                                                                                               - 8] ^ 0x6E] ^ (9 * ((dword_1E953E880 + dword_1E953E898) ^ 0x7D)))
                + 15);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8BC0[byte_1A12A87A0[(9 * (v1 ^ dword_1E953E880 ^ 0x7D))] ^ 0x19] ^ (9 * (v1 ^ dword_1E953E880 ^ 0x7D)))
                - 39);
  uint64_t v3 = *(void *)(v2 - 4) - v1 - (void)&v8;
  unint64_t v4 = (1787074057 * v3) ^ 0xEDEBC87B5EDF1A7DLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v4;
  *(void *)(v2 - 4) = v5;
  uint64_t v6 = &(**(&off_1E5A4B410
          + ((9 * ((dword_1E953E880 + dword_1E953E898) ^ 0x7D)) ^ byte_1A12A8EC0[byte_1A12A8AA0[(9 * ((dword_1E953E880 + dword_1E953E898) ^ 0x7D))] ^ 0x81])
          - 132))[-4];
  uint64_t v7 = *(void *)&v6[8
                    * ((1009
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v6[8
                                                                        * ((9
                                                                                           * ((v5 - *(_DWORD *)(v0 - 4)) ^ 0x7D)) ^ byte_1A12A8BC0[byte_1A12A87A0[(9 * ((v5 - *(_DWORD *)(v0 - 4)) ^ 0x7D))] ^ 0xB5])
                                                                        + 17320])(24, 4101018099) != 0)) ^ 0x5F2)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A127D4EC(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 933984072;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((40 * (v3 == 0)) ^ 0x480u)))();
}

uint64_t sub_1A127D564()
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v1 - v2 - 509) ^ v1 ^ (v3 + 1040) ^ 0xA3) * (v0 == 0)) ^ v1)))();
}

uint64_t sub_1A127D5A0@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a1 - 937701277)))(v1);
  return v2;
}

void jk24uiwqrg(uint64_t a1)
{
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1A1280600@<X0>(uint64_t a1@<X8>)
{
  return 0;
}

void asabc800ag(uint64_t a1, uint64_t a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = v2;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A1280684(void *a1, _DWORD *a2)
{
  *a1 = 0;
  *a2 = 0;
  BOOL v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 18520))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((4085 * v3) ^ 0x7E7u)))();
}

uint64_t sub_1A12806D4(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 1411182149;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((2 * (((v3 == 0) ^ 0xF7) & 1)) ^ 0x40Du)))();
}

uint64_t sub_1A1280740(uint64_t a1, uint64_t a2)
{
  *(void *)(v7 - 152) = v5;
  *(void *)(v7 - 232) = v6 + 0x3797084C688F39EALL;
  *(_DWORD *)(v6 + _Block_object_dispose(&a9, 8) = v3 + 4096;
  char v8 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void))(v4
                                                                           + 8
                                                                           * ((((179 * (v2 & 0x46B7 ^ 0x6A5)) ^ 0x173)
                                                                             * (v6 == 0)) ^ v2 & 0x46B7u));
  uint64_t v9 = &(**(&off_1E5A4B410 + (v2 & 0x46B7 ^ 0x6AAu)))[-8];
  *(void *)(v7 - 224) = v9;
  *(void *)(v7 - 216) = v6;
  *(void *)(v7 - 20_Block_object_dispose(&a9, 8) = v9;
  return v8(a1, a2, 0, 0x3935222BFCD46514, 0);
}

uint64_t sub_1A12807EC()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) + 1775094903;
  unsigned int v4 = (v0 ^ 0x1C8) + 363912576 + *(_DWORD *)(v2 + 8);
  BOOL v5 = v3 < 0x69CDCC73;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x69CDCC73) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((v7 * ((((v0 ^ 0x1C8) - 792126199) & 0x136E65C) + 765)) ^ v0 ^ 0x1C8u)))(v2 + 8);
}

uint64_t sub_1A128087C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (2 * (v4 ^ 0x4A7)) ^ 0x16D;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void))(v5 + 8 * ((v8 * (v6 == 0)) | v4));
  *(void *)(v7 - 20_Block_object_dispose(&a9, 8) = v8;
  return v9(a1, a2, 0, a4, 0);
}

uint64_t sub_1A12808C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,int a29)
{
  unsigned int v31 = ((2 * (2 * a29 + 1472602998)) & 0xE9FFDCF8) + ((2 * a29 + 1472602998) ^ 0x74FFEE7D);
  if ((a29 + 296586160) < 0x65CA79F1 != v31 - 255161484 < (((v29 ^ 0x9A) - 460) ^ 0x65CA7B33u)) {
    BOOL v32 = v31 - 255161484 < (((v29 ^ 0x9A) - 460) ^ 0x65CA7B33u);
  }
  else {
    BOOL v32 = v31 - 255161484 > a29 + 296586160;
  }
  return (*(uint64_t (**)(void))(v30 + 8 * ((348 * v32) ^ v29 ^ 0x9Au)))();
}

uint64_t sub_1A1280974()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((((((v0 | 0x262) - 771456489) | 0x20284704) - 2) ^ (((v0 | 0x262) + 51350) | 0xF22C0085))
                                     * (v2 == 0)) ^ (v0 | 0x262))))();
}

uint64_t sub_1A12809CC@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v1 + 8 * (int)(a1 ^ 0xF22CC72A)))(v3);
  return v2;
}

void zcamdt242h(uint64_t a1, int a2)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A128403C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((233 * (((*(void *)(v0 + 16) == 0) ^ 0x91) & 1)) ^ 0x27D)))();
}

uint64_t sub_1A1284084()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v0 + 234) ^ 0x1EE ^ (14 * (v0 ^ 0x99))) * (*(void *)(v1 + 32 * v3 + 24) == 0)) ^ v0)))();
}

uint64_t sub_1A12840C8@<X0>(int a1@<W8>)
{
  unsigned int v4 = (a1 + 2125858659) & 0x8149F97E;
  uint64_t v5 = (*(uint64_t (**)(void))(v1 + 8 * (a1 | 0x825)))();
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (int)((((((v4 + 196) | 0x3D) ^ 0xFFFFFFE4) + v4 + 481) * (v2 + 1 == v3)) ^ v4)))(v5);
}

uint64_t sub_1A1284130()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((727 * (v0 == 0)) ^ 0x18A)))();
}

uint64_t sub_1A1284168@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((233 * (((*(void *)(v1 + 32 * v3 + 16) == 0) ^ (a1 + 20)) & 1)) ^ a1)))();
}

uint64_t sub_1A12841A4@<X0>(int a1@<W8>)
{
  int v4 = 73 * (a1 ^ 0x27F);
  (*(void (**)(void))(v2 + 8 * (a1 + 1602)))();
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v4 + 234) ^ 0x1EE ^ (14 * (v4 ^ 0x99))) * (*(void *)(v1 + 32 * v3 + 24) == 0)) ^ v4)))();
}

uint64_t sub_1A1284208()
{
  return (*(uint64_t (**)(void))(v1 + 8
                                   * (int)((((((v0 + 196) | 0x3D) ^ 0xFFFFFFE4) + v0 + 481) * (v2 + 1 == v3)) ^ v0)))();
}

uint64_t sub_1A1284244()
{
  (*(void (**)(uint64_t))(v2 + 8 * (v0 + 1378)))(v1);
  return 0;
}

uint64_t sub_1A1284270()
{
  uint64_t v0 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8CC0[byte_1A12A87A8[(9
                                                                                  * (dword_1E953E888 ^ 0x7D ^ dword_1E953E880))
                                                                + 248] ^ 0xF5] ^ (9
                                                                                * (dword_1E953E888 ^ 0x7D ^ dword_1E953E880)))
                - 238);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8EC4[(byte_1A12A8AA0[(9 * ((dword_1E953E880 - v1) ^ 0x7D))] ^ 0x60)
                                                 - 4] ^ (9 * ((dword_1E953E880 - v1) ^ 0x7D)))
                - 113);
  unint64_t v3 = v1 ^ (unint64_t)&v13 ^ *(void *)(v2 - 4);
  uint64_t v4 = 1787074057 * v3 - 0x6585E11862ED39BLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v4;
  *(void *)(v2 - 4) = v5;
  LOBYTE(v4) = *(_DWORD *)(v0 - 4);
  uint64_t v6 = &(**(&off_1E5A4B410
          + ((9 * (dword_1E953E888 ^ 0x7D ^ dword_1E953E880)) ^ byte_1A12A8590[byte_1A12A9000[(9 * (dword_1E953E888 ^ 0x7D ^ dword_1E953E880))] ^ 0x92])
          - 183))[-4];
  (*(void (**)(void))&v6[8
                                    * ((9 * ((v5 - v4) ^ 0x7D)) ^ byte_1A12A8590[byte_1A12A9000[(9 * ((v5 - v4) ^ 0x7D))] ^ 0x84])
                                    + 18800])(*(unsigned int *)*(&off_1E5A4B410
                                                               + (byte_1A12A8590[byte_1A12A9000[(9 * ((v5 + v4) ^ 0x7D))] ^ 0x8A] ^ (9 * ((v5 + v4) ^ 0x7D)))
                                                               - 29));
  char v7 = *(_DWORD *)(v0 - 4);
  char v8 = *(_DWORD *)(v2 - 4);
  (*(void (**)(void))&v6[8
                                    * (byte_1A12A8DC4[(byte_1A12A89A4[(9 * ((v8 + v7) ^ 0x7D))
                                                                                     - 4] ^ 0x5E)
                                                                     - 4] ^ (9 * ((v8 + v7) ^ 0x7D)))
                                    + 18208])(*(unsigned int *)*(&off_1E5A4B410
                                                               + (byte_1A12A8BC8[(byte_1A12A87A8[(9 * (v7 ^ 0x7D ^ v8)) - 8] ^ 0xD)
                                                                                                - 8] ^ (9 * (v7 ^ 0x7D ^ v8)))
                                                               - 101));
  unsigned __int8 v9 = 9 * (*(_DWORD *)(v0 - 4) ^ 0x7D ^ *(_DWORD *)(v2 - 4));
  uint64_t v10 = *(unsigned int *)*(&off_1E5A4B410 + (v9 ^ byte_1A12A8CC0[byte_1A12A87A8[v9 + 248] ^ 0x78])
                                          - 173);
  uint64_t v11 = *(uint64_t (**)(uint64_t))&v6[8
                                             * (byte_1A12A8698[(byte_1A12A910C[v9 - 12] ^ 0xC0) - 8] ^ v9)
                                             + 18344];

  return v11(v10);
}

void rsegvyrt87(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A12845B0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5)
{
  *a4 = 0;
  *a5 = 0;
  BOOL v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 18520))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v5 + 8 * ((115 * v6) ^ 0x333u)))();
}

uint64_t sub_1A1284610(uint64_t a1)
{
  *(void *)(v5 - 216) = v3;
  *(void *)(v5 - 16_Block_object_dispose(&a9, 8) = v2;
  *(_DWORD *)(v5 - 184) = v1;
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 650052673;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 18520))(4096, 1358311088);
  *(void *)a1 = v7;
  return (*(uint64_t (**)(void))(v4 + 8 * ((255 * (v7 != 0)) ^ 0x66A)))();
}

uint64_t sub_1A1284688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v26 - 224) = v25;
  *(void *)(v26 - 176) = 0;
  *(_DWORD *)(v26 - 180) = 0;
  *(void *)(v26 - 136) = v21 + 0x5B68E37D168561B2;
  *(_DWORD *)(v21 + _Block_object_dispose(&a9, 8) = v24 + 4096;
  uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8 * (((((v22 - 648) | 0x142) - 83) * (v21 == 0)) ^ (v22 + 1271)));
  uint64_t v28 = (uint64_t)*(&off_1E5A4B410 + ((v22 + 1271) ^ 0x769u));
  *(void *)(v26 - 200) = (char *)*(&off_1E5A4B410 + ((v22 + 1271) ^ 0x772u)) - 8;
  *(void *)(v26 - 192) = v28;
  *(void *)(v26 - 152) = 0x7D34AE117A9B271ALL;
  return v27(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_1A1284730()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + 2057538897;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + ((v0 + 793321141) & 0xD0B6E37E) + (((v0 + 1855) | 0x42) ^ 0x53E48D55);
  BOOL v5 = v3 < 0x7AA38D4D;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x7AA38D4D) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((1595 * v7) ^ v0)))(v1 + 8);
}

uint64_t sub_1A12847C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(void *)(v21 - 176) = 0;
  *(_DWORD *)(v21 - 180) = 0;
  int v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 8 * (int)((((v18 + 1606807577) ^ 0x56000807 ^ (v18 + 1606807577) & 0xA9FFF7FF) * (v19 == 0)) ^ v18));
  *(void *)(v21 - 152) = 0x7D34AE117A9B271ALL;
  return v22(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a1);
}

uint64_t sub_1A1284840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27)
{
  unsigned int v29 = ((2 * (2 * a27 - 1300105346)) & 0x7FFE9AD4) + ((2 * a27 - 1300105346) ^ 0xBFFF4D6B);
  if ((a27 + 1884709690) < 0x97156777 != v29 - 686417396 < ((v27 - 163965510) | 0x48u) - 1760206695) {
    BOOL v30 = v29 - 686417396 < ((v27 - 163965510) | 0x48u) - 1760206695;
  }
  else {
    BOOL v30 = v29 - 686417396 > a27 + 1884709690;
  }
  return (*(uint64_t (**)(void))(v28 + 8 * ((219 * v30) ^ (v27 - 163965034))))();
}

uint64_t sub_1A1284908()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((69 * ((((v1 + 138464844) ^ v1 ^ (v2 + 376) ^ (v0 == 0)) & 1) == 0)) | v1)))();
}

uint64_t sub_1A128494C@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a1 ^ (v2 + 1927))))(v1);
  return v4;
}

uint64_t gJa8aF901k(uint64_t a1)
{
  if (unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8)))
  {
    uint64_t v1 = *((void *)&unk_1EF451D60
         + ((16
           * ((*(uint64_t (**)(uint64_t, uint64_t))((char *)&unk_1EF451D64 + 18516))(24, 4101018099) != 0)) | 0x568EF585u)
         - 1452207770);
    __asm { BRAA            X8, X17 }
  }
  return 4294922295;
}

void sub_1A12889EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  (*(void (**)(void))(v22 + 8 * (v24 + v23)))(*v21);
  *uint64_t v21 = a13;
  *a14 = a21;
  JUMPOUT(0x1A1288A20);
}

uint64_t sub_1A1288AE0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v1 == 0) ^ (5 * (v0 ^ 0xA))) & 1)
                                * (((v0 + 158939080) & 0x7686C7E4) - 23)) ^ v0)))();
}

uint64_t sub_1A1288B34()
{
  unsigned int v3 = ((v0 - 1146) ^ 0x5867432D) + *(_DWORD *)(v1 + 12);
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 337859105;
  BOOL v5 = v3 < v0 + 1483160741;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x58674236) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((615 * v6) ^ v0)))();
}

uint64_t sub_1A1288BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8 * ((50 * (v24 != 0)) ^ v23));
  HIDWORD(a22) = v22;
  *(void *)(v27 - 144) = v26;
  return v28(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22);
}

uint64_t sub_1A1288C04()
{
  unsigned int v3 = v1 - 1239118730;
  BOOL v4 = (v1 - 1239118730) < 0xFA687C87;
  unsigned int v5 = ((2 * (2 * v1 + 2004361174)) & 0x9DAFFA3C)
     + ((2 * v1 + 2004361174) ^ (((v0 - 2141645342) & 0xD635ED3F) - 824707069));
  if (v4 != v5 + 730890088 < 0xFA687C87) {
    BOOL v6 = v5 + 730890088 < 0xFA687C87;
  }
  else {
    BOOL v6 = v5 + 730890088 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((19 * !v6) ^ (v0 + 1452212725))))();
}

uint64_t sub_1A1288CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v28 = *(void *)(v27 - 136);
  int v29 = 98 * (v24 ^ 0x115);
  *(void *)(v27 - 136) = v28;
  uint64_t v30 = *(void *)(v28 - 0x29BAE573B9AE997FLL);
  int v31 = ((2 * a9) & 0x7FBEFFDE) + (a9 ^ 0x3FDF7FEF) - 1071612081;
  *(unsigned char *)(v30 + (v31 + 194)) = 99;
  *(unsigned char *)(v30 + (v31 + 195)) = 43;
  *(unsigned char *)(v30 + (v31 + v29)) = -115;
  *(unsigned char *)(v30 + (v31 + 197)) = 110;
  *v23 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8 * ((v29 + 1851) ^ (v26 + 799) ^ (v29 - 1452211914) ^ v29)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A1288E90()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((6 * (v0 ^ 0x735) + ((v0 - 1982) | 0x306) + 2036) * (v1 == 0)) ^ v0)))();
}

uint64_t sub_1A1288ED8()
{
  unsigned int v3 = ((v0 + 214) ^ 0xC898193A) + *(_DWORD *)(v1 + 12);
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 2074858353;
  BOOL v5 = v3 < 0xC8981CA4;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0xC8981CA4) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v6 * (10 * (v0 ^ 0x4E9) - 487)) ^ v0)))();
}

uint64_t sub_1A1288F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  HIDWORD(a24) = v25;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((((v26 - 421) ^ 0x199) * (v27 != 0)) ^ v26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           v28);
}

uint64_t sub_1A1288F98()
{
  unsigned int v3 = v1 - 641974977;
  BOOL v4 = (v1 - 641974977) < 0x1E002D50;
  unsigned int v5 = ((2 * (((v0 + 731) | 0x104) + 2004361174 + 2 * v1 - 1420)) & 0xD88FF0A8)
     + ((((v0 + 731) | 0x104) + 2004361174 + 2 * v1 - 1420) ^ 0xEC47F855);
  if (v4 != v5 + 834155771 < 0x1E002D50) {
    BOOL v6 = v5 + 834155771 < 0x1E002D50;
  }
  else {
    BOOL v6 = v5 + 834155771 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1113 * v6) ^ v0)))();
}

uint64_t sub_1A1289044@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v32 = *(void *)(v31 - 136);
  int v33 = v28 - 587;
  *(void *)(v31 - 136) = v32;
  uint64_t v34 = *(void *)(v32 - 0x29BAE573B9AE997FLL);
  unsigned int v35 = ((a9 << (v33 ^ 0x46)) & 0xDFFFF9FE) + (a9 ^ 0x6FFFFCFF) - 1879047423;
  *(unsigned char *)(v34 + v35) = 0;
  *(unsigned char *)(v34 + v35 + 1) = 0;
  *(unsigned char *)(v34 + v35 + 2) = 0;
  *(unsigned char *)(v34 + v35 + 3) = 1;
  *v27 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((v30 + ((v33 - 830) | 0x3A2) - 330) ^ v33 ^ (v30 + 195) ^ v33)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A1289200()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v0 ^ 0x161) - 360) ^ 0x173) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_1A1289238()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1382934046;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + (v0 ^ 0x694E2B0F);
  BOOL v5 = v3 < 0xAD9219DA;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0xAD9219DA) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v6 * ((v0 + 1354) ^ 0x83D)) ^ v0)))();
}

uint64_t sub_1A12892AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  LODWORD(a25) = v27;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (((v28 - 995 + 177 * (v28 ^ 0x816) - 1425) * (v29 == 0)) | v28)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A12892F4()
{
  unsigned int v3 = v0 + 477223401;
  BOOL v4 = (v0 + 477223401) < 0x60B5C9F6;
  unsigned int v5 = ((2 * (2 * v0 + 2004361174)) & 0xEDF7E8F8) + ((v1 + 958998766) & 0xC6D6D7FF ^ (2 * v0 + 2004361174) ^ 0x76FBF162);
  if (v4 != v5 - 373697159 < 0x60B5C9F6) {
    BOOL v6 = v5 - 373697159 < 0x60B5C9F6;
  }
  else {
    BOOL v6 = v5 - 373697159 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((3291 * v6) ^ v1)))();
}

uint64_t sub_1A12893A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v33 = *(void *)(v32 - 136);
  uint64_t v34 = *(void *)(v32 - 216);
  unint64_t v35 = v34 - ((2 * v34) & 0xF99431D3CA63CC58) + (v28 ^ 0x7CCA18E9E531E4E6);
  *(void *)(v32 - 136) = v33;
  uint64_t v36 = (unsigned char *)(((2 * a9) & 0x1D3F8DBB6)
                + (a9 ^ 0xA3BF793FE9FC6DDBLL)
                + *(void *)(v33 - 0x29BAE573B9AE997FLL)
                + 0x5C4086C016039225);
  *uint64_t v36 = HIBYTE(v35) ^ 0x7C;
  v36[1] = BYTE6(v35) ^ 0xCA;
  v36[2] = BYTE5(v35) ^ 0x18;
  v36[3] = BYTE4(v35) ^ 0xE9;
  v36[4] = ((v34 - ((2 * v34) & 0xCA63CC58) + (v28 ^ 0xE531E4E6)) >> 24) ^ 0xE5;
  v36[5] = BYTE2(v35) ^ 0x31;
  v36[6] = BYTE1(v35) ^ 0xE6;
  v36[7] = v35 ^ 0x2C;
  *v29 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (int)(((v28 ^ 0x3A8 ^ (v31 - 354)) - v31 + 189) ^ v28 ^ 0x3A8)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A12895E8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((((v0 + 229) ^ 0xE0) + 349) ^ 0xFFFFFD8E) + 251 * ((v0 + 229) ^ 0xE0))
                                     * (v1 == 0)) ^ (v0 + 229))))();
}

uint64_t sub_1A128962C()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1452124039;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + ((v0 - 452) ^ 0x652E6B7F);
  BOOL v5 = v3 < 0xA9725871;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 73 * (v0 ^ 0x4ECu) - 1452124850) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((3568 * v6) ^ v0)))();
}

uint64_t sub_1A12896B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  HIDWORD(a25) = v28;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (((4 * (((v30 == 0) ^ (v29 + 48)) & 1)) & 0xF7 | (8 * (((v30 == 0) ^ (v29 - 720)) & 1))) ^ v29)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A12896FC()
{
  unsigned int v3 = v1 + 1498273165;
  BOOL v4 = (v1 + 1498273165) < 0x9D91C59A;
  unsigned int v5 = ((2 * ((v0 ^ 0x77781F84) + 2 * v1)) & 0x9DA7E77C) + (((v0 ^ 0x77781F84) + 2 * v1) ^ 0xCED3F3BF);
  if (v4 != v5 - 826420773 < 0x9D91C59A) {
    BOOL v6 = v5 - 826420773 < 0x9D91C59A;
  }
  else {
    BOOL v6 = v5 - 826420773 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1763 * v6) ^ v0)))();
}

uint64_t sub_1A12897A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v34 = *(void *)(v33 - 136);
  int v35 = 118 * (v30 ^ 0x320);
  unint64_t v36 = *(void *)(v33 - 208)
      + 0x7CCA18E9E531E62CLL
      - ((*(void *)(v33 - 208) << (v35 ^ 0x63u)) & 0xF99431D3CA63CC58);
  *(void *)(v33 - 136) = v34;
  uint64_t v37 = (unsigned char *)(((2 * a9) & 0x1CFBF7B3ELL)
                + (a9 ^ 0x7BEFE7FBE7DFBD9FLL)
                + *(void *)(v34 - 0x29BAE573B9AE997FLL)
                - 0x7BEFE7FBE7DFBD9FLL);
  *uint64_t v37 = HIBYTE(v36) ^ 0x7C;
  v37[1] = BYTE6(v36) ^ 0xCA;
  v37[2] = BYTE5(v36) ^ 0x18;
  v37[3] = BYTE4(v36) ^ 0xE9;
  v37[4] = BYTE3(v36) ^ 0xE5;
  v37[5] = BYTE2(v36) ^ 0x31;
  v37[6] = BYTE1(v36) ^ 0xE6;
  v37[7] = v36 ^ 0x2C;
  *v29 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (int)((((v35 - 1459617898) ^ 0xA9000418 ^ (v32 + 285)) + ((v35 - 1459617898) | 0x710102)) ^ v35)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1A1289A18()
{
  *(void *)(v5 - 192) = v2;
  *(void *)(v5 - 12_Block_object_dispose(&a9, 8) = 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v0 ^ (v4 + 800)) - v4 + 2) * (v1 == 0)) | v0)))();
}

uint64_t sub_1A1289A60@<X0>(int a1@<W8>)
{
  int v4 = a1 + 2034;
  uint64_t v5 = (*(uint64_t (**)(void))(v1 + 8 * (a1 + 2337)))();
  BOOL v6 = *(void (**)(void))(v1 + 8 * (v4 + 247));
  *(void *)(v3 - 200) = v5;
  v6();
  uint64_t v7 = (*(uint64_t (**)(void, void))(v1 + 8 * (v4 ^ 0xF0D)))(*(void *)(v3 - 160), 0);
  *(void *)(v3 - 176) = 0;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v7 == 0) * ((v4 ^ (v2 + 1038)) - v2 + 4091)) ^ v4)))();
}

uint64_t sub_1A1289AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v33 = v29 + 433;
  uint64_t v34 = (*(uint64_t (**)(void, uint64_t, void))(v30 + 8 * (v33 + 1875)))(*(void *)(v31 - 160), a1, 0);
  int v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (((v34 == 0) * (((7 * (v33 ^ 0x1D4)) ^ 0x568EFCAE) + ((v33 - 1993343167) | 0x20410108))) ^ v33));
  *(void *)(v31 - 176) = a1;
  return v35(v34, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1A1289B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  (*(void (**)(uint64_t, char *))(v26 + 8 * (v25 ^ 0xBF0)))(a1, &(**(&off_1E5A4B410 + (v25 ^ 0x2DC)))[-12]);
  (*(void (**)(uint64_t))(v26 + 8 * (v25 ^ 0xA72)))(a1);
  (*(void (**)(uint64_t, void))(v26 + 8 * (v25 + 1641)))(a1, *(void *)(v27 - 200));
  int v29 = (char (*)[256])(*(uint64_t (**)(void))(v26 + 8 * (v25 + 1615)))();
  return (*(uint64_t (**)(char (*)[256], uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (((((v25 ^ 0x36B ^ (v29 == *(&off_1E5A4B410 + v25 - 697))) & 1) == 0) * (((v25 - 651) | 0x586) - 1001)) ^ v25)))(v29, v30, v31, v32, v33, v34, v35, v36, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A1289C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 8 * (v35 + 856)))(a33, v34, v36 - 128);
  uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33
                                                                                                + 8
                                                                                                * (int)(((v37 == 0) * (v35 + ((v35 + 550736449) & 0xDF2C6BDB) - 2357)) ^ v35));
  *(void *)(v36 - 184) = 0x79483BA612D83A8ELL;
  *(void *)(v36 - 152) = 0x79483BA612D83A8ELL;
  return v38(v37, v39, v40, v41, v42, v43, v44);
}

uint64_t sub_1A1289CD8()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 ^ 0xAD0)))(24, 4101018099);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1
                                                                                               + 8
                                                                                               * (((2
                                                                                                  * (((v3 == 0) ^ (v0 - 59 + v0 - 75 + 1)) & 1)) & 0xDF | (32 * (((v3 == 0) ^ (v0 - 59 + v0 - 75 + 1)) & 1))) ^ v0));
  *(void *)(v2 - 184) = 0x79483BA612D83A8ELL;
  *(void *)(v2 - 152) = 0x79483BA612D83A8ELL;
  return v4(v3, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1A1289D64(uint64_t a1)
{
  *(void *)(v3 - 152) = a1 + 0x79483BA612D83A8ELL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = 1171913814;
  *(void *)(a1 + 12) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 107)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v5 == 0) * ((13 * (v1 ^ 0x833) - 1036) ^ (v1 - 1341))) | v1)))();
}

uint64_t sub_1A1289DEC()
{
  int v4 = *(uint64_t (**)(void))(v0 + 8 * (int)((((v1 - 1451809149) & 0xFFF9D3FF ^ 0xA9710120) * (v2 != 0)) ^ v1));
  *(void *)(v3 - 184) = 0x79483BA612D83A8ELL;
  return v4();
}

uint64_t sub_1A1289E50@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v24 = a1 - 4088;
  (*(void (**)(uint64_t))(v21 + 8 * (a1 + 1452209869)))(v22);
  *(void *)(v23 - 184) = 0x79483BA612D83A8ELL;
  *(void *)(v23 - 152) = 0x79483BA612D83A8ELL;
  (*(void (**)(uint64_t))(v21 + 8 * (v24 + 1452214027)))(v20);
  (*(void (**)(uint64_t))(v21 + 8 * (int)(v24 ^ 0xA97108FF)))(a20);
  return (*(uint64_t (**)(void))(v21
                              + 8
                              * (((4 * (*(void *)(v23 - 200) == 0)) | (8 * (*(void *)(v23 - 200) == 0))) ^ (v24 + 1452212699))))();
}

uint64_t sub_1A128A750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 8 * ((v34 + 3496) ^ (79 * (a33 == 0))));
  *(void *)(v36 - 176) = v33;
  return v37(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1A128A784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v38 = (*(uint64_t (**)(void))(v36 + 8 * v35))();
  uint64_t v39 = *(uint64_t (**)(uint64_t))(v36 + 8 * ((v34 + 3496) ^ (79 * (a33 == 0))));
  *(void *)(v37 - 176) = v33;
  return v39(v38);
}

uint64_t sub_1A128A7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v41 = (*(uint64_t (**)(uint64_t))(v36 + 8 * (v38 + 1452214027)))(a33);
  *(void *)(v40 - 176) = v34;
  if (v37 == -45004)
  {
    *(void *)(v40 - 152) = v35;
    *(void *)(v40 - 120) = 0;
    *(_DWORD *)(v40 - 112) = 0;
    uint64_t v42 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v36 + 8 * (v39 + 1452214060)))(*(unsigned int *)*(&off_1E5A4B410 + (v39 ^ (v39 - 8))), *(void *)v33, *(unsigned int *)(v33 + 12), v40 - 120, v40 - 112);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * ((824 * ((v42 ^ 0x5E5DEEB9) - 335545392 + ((2 * v42) & 0xBCBBDD72) == 1516104332)) ^ (v39 + 1452212148))))(v42, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29);
  }
  else if (v37)
  {
    return (*(uint64_t (**)(uint64_t))(v36 + 8 * ((120 * (v33 == 0)) ^ 0x5B7)))(v41);
  }
  else
  {
    return (*(uint64_t (**)(uint64_t))(v36
                                              + 8 * ((25 * (*(void *)(v40 - 184) != 0x79483BA612D83A8ELL)) ^ 0x347)))(v41);
  }
}

uint64_t sub_1A128AEF0()
{
  uint64_t v3 = *(void *)(v2 - 184);
  unsigned int v4 = *(_DWORD *)(v3 - 0x79483BA612D83A82) - 886711989;
  unsigned int v5 = *(_DWORD *)(v3 - 0x79483BA612D83A86) - 2058625807;
  int v6 = (v4 < 0xCB25D947) ^ (v5 < ((v0 - 1989083064) | 0x20000050u) + 565499725);
  BOOL v7 = v4 > v5;
  if (v6) {
    BOOL v7 = v4 < 0xCB25D947;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((!v7 * ((v0 ^ 0x99F) - 2290)) ^ v0)))();
}

uint64_t sub_1A128AFB0@<X0>(int a1@<W8>)
{
  uint64_t v5 = *(void *)(v4 - 184);
  _DWORD *v2 = v1 + 4;
  return (*(uint64_t (**)(void))(v3 + 8 * (a1 ^ ((v5 == 0x79483BA612D83A8ELL) | (2 * (v5 == 0x79483BA612D83A8ELL))))))();
}

void sub_1A128B07C(int a1@<W8>)
{
  uint64_t v5 = 8 * (a1 - 62);
  (*(void (**)(void))(v4 + v5))();
  void *v1 = 0;
  *uint64_t v3 = 1171913814;
  _DWORD *v2 = 0;
  (*(void (**)(void *))(v4 + v5))(v1);
  JUMPOUT(0x1A128B9D8);
}

uint64_t sub_1A128B0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,_DWORD *a31,int a32,int a33)
{
  uint64_t v39 = (*(uint64_t (**)(void))(v35 + 8 * (v37 ^ (v37 + 1867))))(*(void *)(v33 - 0x79483BA612D83A8ELL));
  *(void *)(v33 - 0x79483BA612D83A8ELL) = a23;
  *a31 = a33;
  *(void *)(v38 - 144) = v36;
  return (*(uint64_t (**)(uint64_t))(v35 + 8 * (v34 + v37 + 4103)))(v39);
}

void sub_1A128B174()
{
  *(void *)(v1 - 16_Block_object_dispose(&a9, 8) = v0;
  JUMPOUT(0x1A128B1A4);
}

uint64_t sub_1A128B220()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v3 + ((v1 - 177) | 2) - 341) ^ ((v1 - 2127495305) | 0x2840010A)) * (v0 != 0)) ^ v1)))();
}

uint64_t sub_1A128B268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v7 = (unint64_t)(a1 - a2) < 0x20 || v2 < v4 + ((40 * (v3 ^ 0xD0) - 1418502162) & 0xFDFD9DFA) + 2185;
  return (*(uint64_t (**)(void))(v5 + 8 * (((2 * v7) | (32 * v7)) ^ v3)))();
}

uint64_t sub_1A128B2C4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((51
                                * (v0 < v2 + ((v1 - 919523605) ^ 0x60403301) + ((v1 - 919523605) & 0x36CECDFDu) + 1960)) ^ v1)))();
}

uint64_t sub_1A128B318@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v2 & 0xFFFFFFE0) == 32) * (((v3 + 2690) | 0x52) - 579)) ^ (v3 + 2914))))();
}

void sub_1A128B360()
{
}

uint64_t sub_1A128B370()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v3 + ((v1 - 1605304555) | 0x92000DA) - 67) ^ (63 * (v1 ^ 0x229))) * (v0 == 0)) ^ v1)))();
}

uint64_t sub_1A128B3C0()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * ((58 * (v1 >= ((v0 - 1451527264) & 0xFFF585FB) + v2 + 115 * (v0 ^ 0x84D))) ^ v0)))();
}

uint64_t sub_1A128B414()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 - v3 + 54) ^ (v4 + 32) ^ 0x3D9) * (v0 < 0x20)) ^ v1)))();
}

uint64_t sub_1A128B44C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v0 < 0x20) ^ (v1 - v2 - 96)) & 1) * (((v1 - 722) | 1) + 1718)) ^ v1)))();
}

uint64_t sub_1A128B488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v8 = (v3 - 3169 - v7 + 1975) ^ v6;
  uint64_t v9 = a2 + (v8 & (v2 - 1));
  long long v10 = *(_OWORD *)(v9 - 31);
  uint64_t v11 = a1 + (v8 & (v2 - 1));
  *(_OWORD *)(v11 - 15) = *(_OWORD *)(v9 - 15);
  *(_OWORD *)(v11 - 31) = v10;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((2 * ((v2 & 0xFFFFFFE0) == 32)) | (32 * ((v2 & 0xFFFFFFE0) == 32)) | (v4 + v3 - 3169 + 3841))))();
}

void sub_1A128B4E8()
{
}

uint64_t sub_1A128B4F4(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((((a2 ^ (v5 - 1) ^ (v2 == v3)) & 1) == 0) * (a2 - 547)) ^ a2)))();
}

uint64_t sub_1A128B528(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((a2 - 346) ^ (v4 - 247) ^ (v4 - 3)) * ((v2 & 0x18) == 0)) | (a2 + 221))))();
}

uint64_t sub_1A128B55C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((53 * (((v4 + 1196036742) & 0xB8B5EFBD ^ 0x335) + v2 != ((v6 + v4 - 45 + 1764) & v3))) ^ (v4 - 45))))();
}

uint64_t sub_1A128B5C0()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (int)(((v4 + v2 + ((v2 + 155188541) | 0xA0310180) - 38) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A128B600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + v2) = *(unsigned char *)(a2 + v2);
  return (*(uint64_t (**)(void))(v6 + 8 * ((61 * (v2 + 1 == v3)) ^ (v5 + v4 + 4038))))();
}

uint64_t sub_1A128B634()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((127 * (v0 != v1)) ^ v2)))();
}

uint64_t sub_1A128B654()
{
  int v4 = 2 * ((v1 - 335606200) & 0x3D71EBFA ^ (v3 - 246));
  return (*(uint64_t (**)(void))(v2 + 8 * ((973 * ((v0 & 0x18) == (v4 - 237) - 271)) ^ v4)))();
}

uint64_t sub_1A128B6BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = (v6 + 33 * (v4 ^ 0x11Eu) + 1414) & (~v2 + v3);
  *(void *)(a1 - 7 + v7) = *(void *)(a2 - 7 + v7);
  return (*(uint64_t (**)(void))(v5 + 8 * ((1711 * (v2 - (v3 & 0xFFFFFFF8) == -8)) ^ v4)))();
}

void sub_1A128B71C()
{
}

uint64_t sub_1A128B728(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)((((((a3 - 2006909079) | 0x21100060) ^ 0xFFFE0319) + ((a3 - 34363954) & 0xAB7D59FA))
                                     * (v4 == v3)) ^ a3)))();
}

uint64_t sub_1A128B784()
{
  return v0();
}

uint64_t sub_1A128B78C()
{
  uint64_t v3 = *(void *)(v2 - 168);
  *(_DWORD *)(v3 - 0x79483BA612D83A86) = (*(_DWORD *)(v2 - 112) ^ 0xF7FDFE57)
                                         + 1306263039
                                         + ((2 * *(_DWORD *)(v2 - 112)) & 0xEFFBFCAE);
  *(_DWORD *)(v3 - 0x79483BA612D83A82) = 0;
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(v0 + 18672))(*(unsigned int *)*(&off_1E5A4B410 + (int)((v1 - 22) ^ 0xA97101FA)), *(void *)(v2 - 120), *(unsigned int *)(v2 - 112));
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 13320);
  *(void *)(v2 - 184) = v3;
  return v5(v4);
}

uint64_t sub_1A128B7F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v6 = v2 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a2 + v6);
  return (*(uint64_t (**)(void))(v5 + 8 * ((3401 * (v6 == 0)) ^ (v4 + v3 + 3606))))();
}

uint64_t sub_1A128B828()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((872 * (v0 ^ 0x32) - 1452213462) ^ 0xA971030E) - 708)
                                     * (v1 == 0x79483BA612D83A8ELL)) ^ (872 * (v0 ^ 0x32)))))();
}

uint64_t sub_1A128B884@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((*(void *)(v1 - 0x79483BA612D83A8ELL) == 0) ^ (a1 - 1)) & 1)
                                * (v3 + a1 + 1452210976)) ^ a1)))();
}

void sub_1A128B8DC(int a1@<W8>)
{
  unsigned int v5 = (a1 + 24116700) | 0xA801012A;
  (*(void (**)(void))(v3 + 8 * (int)(v5 ^ (v4 + 1867))))();
  void *v1 = 0;
  *(_DWORD *)(v2 - 0x79483BA612D83A86) = 1171913814;
  *(_DWORD *)(v2 - 0x79483BA612D83A82) = 0;
  (*(void (**)(void *))(v3 + 8 * (int)(v5 + 1452213957)))(v1);
  JUMPOUT(0x1A128B95CLL);
}

uint64_t sub_1A128BA0C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((*v1 == 0) * ((v4 + a1 - 215 - 2040) ^ (a1 - v3))) ^ (a1 - 215))))();
}

void sub_1A128BA44(int a1@<W8>)
{
  (*(void (**)(void))(v2 + 8 * (a1 - 2024 + v3)))();
  *(void *)uint64_t v1 = 0;
  *(_DWORD *)(v1 + _Block_object_dispose(&a9, 8) = 1145303061;
  *(_DWORD *)(v1 + 12) = 0;
  JUMPOUT(0x1A128BA6CLL);
}

void aslgmuibau()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8BC8[(byte_1A12A87A8[(9
                                                                                   * ((dword_1E953E880 - dword_1E953E890) ^ 0x7D))
                                                                 - 8] ^ 0x19)
                                                 - 8] ^ (9 * ((dword_1E953E880 - dword_1E953E890) ^ 0x7D)))
                - 29);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8CC0[byte_1A12A88A8[(9 * ((dword_1E953E880 - v1) ^ 0x7D))
                                                                                 - 8] ^ 0x78] ^ (9
                                                                                               * ((dword_1E953E880 - v1) ^ 0x7D)))
                - 187);
  unint64_t v3 = (unint64_t)&v8[v1 + *(void *)(v2 - 4)];
  uint64_t v4 = 1787074057 * v3 - 0x6585E11862ED39BLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v4;
  *(void *)(v2 - 4) = v5;
  LOBYTE(v2) = 9 * ((v5 - *(_DWORD *)(v0 - 4)) ^ 0x7D);
  unsigned int v6 = &(**(&off_1E5A4B410
          + ((9 * ((dword_1E953E880 - dword_1E953E890) ^ 0x7D)) ^ byte_1A12A8590[byte_1A12A9000[(9 * ((dword_1E953E880 - dword_1E953E890) ^ 0x7D))] ^ 0x8A])
          - 1))[-4];
  uint64_t v7 = *(void *)&v6[8
                    * ((84
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v6[8
                                                                        * (byte_1A12A8594[(byte_1A12A900C[v2 - 12] ^ 0xB1) - 4] ^ v2)
                                                                        + 16728])(24, 4101018099) == 0)) ^ 0x412)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A128BC44(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + _Block_object_dispose(&a9, 8) = 912148809;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((213 * (v3 != 0)) ^ 0x67Du)))();
}

uint64_t sub_1A128BC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v25 - 152) = v21 + 0x2A5C32E9989AD503;
  *(_DWORD *)(v21 + _Block_object_dispose(&a9, 8) = v22 + 4096;
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8 * ((57 * (v21 == 0)) ^ 0x4C8));
  *(void *)(v25 - 16_Block_object_dispose(&a9, 8) = *(void *)(v23 + 104) - 8;
  *(void *)(v25 - 200) = 0x1A44E0EB4FC706ALL;
  return v26(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_1A128BD38()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + ((v0 + 1147767190) & 0x154D) - 312355264 - 1288;
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 1224504073;
  BOOL v5 = v3 < 0xED61D640;
  BOOL v6 = v3 > v4;
  if (v4 < 0xED61D640 != v5) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((2 * (((v0 - 125) ^ v7) & 1)) & 0xFB | (4 * (((v0 - 1149) ^ v7) & 1)) | v0)))();
}

void sub_1A128BDC4(int a1@<W8>)
{
  *(void *)(v7 - 200) = 0x1A44E0EB4FC706ALL;
  int v8 = ((v1 | 0x10) + 71) | 0x24;
  uint64_t v9 = *v3;
  unsigned int v10 = ((v8 - 806356520) & (2 * a1)) + (a1 ^ 0xE7F7FDFF) + 403177985;
  *(unsigned char *)(*v3 + v10) = 0;
  *(unsigned char *)(v9 + v10 + 1) = 0;
  *(unsigned char *)(v9 + v10 + 2) = 0;
  *(unsigned char *)(v9 + v10 + 3) = 1;
  *v2 += 4;
  *(void *)(v7 - 160) = v5;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A128C104()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v1 == 0) ^ (v0 + 43)) & 1) * ((v0 - 33160169) & 0x1F9F5FB ^ 0x1E7)) ^ v0)))();
}

uint64_t sub_1A128C158()
{
  unsigned int v3 = (v0 ^ 0x7FEF5C30) + *(_DWORD *)(v1 + 12);
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 1234244748;
  BOOL v5 = v3 < 0x7FEF5DD5;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((v0 + 1028) ^ 0x7FEF5838)) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1889 * v6) ^ v0)))();
}

uint64_t sub_1A128C1D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (int)(((((v28 - 1544683122) & 0x411FC95) + (v28 ^ 0xFFFFFA32)) * (v29 == 0)) ^ v28));
  HIDWORD(a23) = v27;
  *(void *)(v32 - 160) = v30;
  return v33(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A128C228()
{
  unsigned int v3 = v0 + 262598220;
  BOOL v4 = (v0 + 262598220) < 0x46053791;
  int v5 = ((2 * ((v0 << (v1 ^ 0xEC)) - 1824297618)) & 0x7DBD96D0) + (((v0 << (v1 ^ 0xEC)) - 1824297618) ^ 0x3EDECB69);
  if (v4 != (v5 + 119958568) < 0x46053791) {
    BOOL v6 = (v5 + 119958568) < 0x46053791;
  }
  else {
    BOOL v6 = v5 + 119958568 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((3447 * v6) ^ v1 ^ 0x17u)))();
}

uint64_t sub_1A128C2DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v33 = *(void *)(v32 - 152);
  int v34 = (v29 - 643) | 0x401;
  *(void *)(v32 - 152) = v33;
  uint64_t v35 = *(void *)(v33 - 0x2A5C32E9989AD503);
  unsigned int v36 = ((a9 << (v34 - 16)) & 0x47FF7FFE) + (a9 ^ 0xA3FFBFFF) + 1543520257;
  *(unsigned char *)(v35 + v36 + 1) = -19;
  *(unsigned char *)(v35 + v36 + 2) = -89;
  *(unsigned char *)(v35 + v36) = -80;
  *(unsigned char *)(v35 + v36 + 3) = -81;
  *v28 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (((v34 ^ 0x55BE1C0F) + v34 - v30 + 1198) ^ v34)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A128C49C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 ^ 0x637) + 3 * (v1 ^ 0x508) - 1375) * (v0 == 0)) ^ v1 ^ 0x7F)))();
}

uint64_t sub_1A128C4E0()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1729931730 + ((v0 + 1039902712) & 0xC20456FD) + ((v0 - 875780956) & 0x34335DFB) - 2088;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 1652886757;
  BOOL v5 = v3 < 0x98E3562E;
  BOOL v6 = v3 > v4;
  if (v4 < 0x98E3562E != v5) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((240 * v6) ^ v0)))();
}

uint64_t sub_1A128C580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  LODWORD(a24) = v25;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v26 + 868 + ((v26 + 1787091309) & 0x957B2677) - 1958) * (v27 == 0)) ^ v26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           v28);
}

uint64_t sub_1A128C5D0()
{
  unsigned int v3 = v1 + 63784098;
  BOOL v4 = (v1 + 63784098) < 0x3A2B8DE7;
  unsigned int v5 = ((2 * (((v0 + 58) ^ 0x934368B1) + 2 * v1)) & 0x6FFFDEDC) + ((((v0 + 58) ^ 0x934368B1) + 2 * v1) ^ 0xB7FFEF6F);
  if (v4 != v5 - 2111070600 < 0x3A2B8DE7) {
    BOOL v6 = v5 - 2111070600 < 0x3A2B8DE7;
  }
  else {
    BOOL v6 = v5 - 2111070600 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * (((2 * v6) | (8 * v6)) ^ v0)))();
}

uint64_t sub_1A128C674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v32 = *(void *)(v31 - 152);
  *(void *)(v31 - 152) = v32;
  uint64_t v33 = *(void *)(v32 - 0x2A5C32E9989AD503);
  unsigned int v34 = ((v28 ^ 0xDFCEFE15) & (2 * a9)) + (a9 ^ 0xEFE77DFF) + 270041601;
  *(unsigned char *)(v33 + v34) = 0;
  *(unsigned char *)(v33 + v34 + 1) = 0;
  *(unsigned char *)(v33 + v34 + 2) = 0;
  *(unsigned char *)(v33 + v34 + 3) = 1;
  *v27 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (int)((v29 + (((v28 ^ 0x7CD) + 561505745) & 0xDE881EDA) - 1443) ^ ((v28 ^ 0x7CD) - 338166480) & 0xBE69F4EF ^ v28 ^ 0x7CD)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A128C854()
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * (int)((((v0 - 1152) ^ 0x746 ^ (v0 + 2074093803) & 0x845FD567) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_1A128C8A0()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + 60653252;
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 851495565;
  BOOL v5 = v3 < 0x39D7EBC;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x39D7EBC) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v6 * ((v0 + 774) ^ 0x560)) ^ v0)))();
}

uint64_t sub_1A128C910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  HIDWORD(a24) = v24;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((((v25 == 0) ^ v27 ^ 0x7D) & 1) * ((v27 ^ 0x22B) - 1848)) ^ v27)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           v26);
}

uint64_t sub_1A128C958()
{
  unsigned int v3 = v1 + 724353512;
  BOOL v4 = (v1 + 724353512) < 0x618B0B29;
  unsigned int v5 = (((v0 - 1066) ^ 0x6FFFB89D) & (2 * (2 * v1 - 1824297618))) + ((2 * v1 - 1824297618) ^ 0xB7FFDDEB);
  if (v4 != v5 - 1450496706 < 0x618B0B29) {
    BOOL v6 = v5 - 1450496706 < 0x618B0B29;
  }
  else {
    BOOL v6 = v5 - 1450496706 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((188 * v6) ^ v0)))();
}

uint64_t sub_1A128C9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v36 = *(void *)(v35 - 152);
  uint64_t v37 = (v31 + 1721066143) & 0x996A9D2D;
  unint64_t v38 = a30 - ((2 * a30) & 0xF99431D3CA63CC58) + 0x7CCA18E9E531E62CLL;
  *(void *)(v35 - 152) = v36;
  uint64_t v39 = (unsigned char *)(*(void *)(v36 - 0x2A5C32E9989AD503)
                + (a9 ^ 0x7BAEB7BBF9DF2D9FLL)
                - 0x7BAEB7BBF9DF2D9FLL
                + ((v37 ^ 0x1F3BE5E1ALL) & (2 * a9)));
  *uint64_t v39 = HIBYTE(v38) ^ 0x7C;
  v39[1] = BYTE6(v38) ^ 0xCA;
  v39[2] = BYTE5(v38) ^ 0x18;
  v39[3] = BYTE4(v38) ^ 0xE9;
  v39[4] = ((a30 - ((2 * a30) & 0xCA63CC58) - 449714644) >> 24) ^ 0xE5;
  v39[5] = BYTE2(v38) ^ 0x31;
  v39[6] = BYTE1(v38) ^ 0xE6;
  v39[7] = v38 ^ 0x2C;
  *v30 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * (int)((v32 + v33 + v37 - 1317 - 1681) ^ (v37 - 1189) ^ v37)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A128CC6C()
{
  *(void *)(v4 - 12_Block_object_dispose(&a9, 8) = 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 + v0 - 128) ^ (v2 + 782) ^ ((v0 - 64) | 0x30C)) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_1A128CCC8()
{
  uint64_t v3 = (*(uint64_t (**)(void))(v1 + 8 * (v0 + 1493)))();
  uint64_t v4 = *(void (**)(void))(v1 + 8 * (v0 ^ 0xBA5));
  *(void *)(v2 - 20_Block_object_dispose(&a9, 8) = v3;
  v4();
  uint64_t v5 = (*(uint64_t (**)(void, void))(v1 + 8 * (v0 + 1459)))(*(void *)(v2 - 168), 0);
  *(void *)(v2 - 192) = 0;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v5 == 0) * (((v0 - 2143211338) | 0x2A00C044) + 1438518261)) ^ v0)))();
}

uint64_t sub_1A128CD80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v32 = v28 - 625;
  uint64_t v33 = (*(uint64_t (**)(void, uint64_t, void))(v29 + 8 * (v32 ^ 0x9DF)))(*(void *)(v30 - 168), a1, 0);
  uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v33 != 0) * (v32 ^ 0xAA41F49D ^ (v32 - 1438518427))) ^ v32));
  *(void *)(v30 - 192) = a1;
  return v34(v33, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A128CE00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  (*(void (**)(uint64_t, uint64_t))(v22 + 8 * (v20 ^ 0x8A1)))(a1, *(void *)(v21 + 8 * (v20 - 371)) - 12);
  (*(void (**)(uint64_t))(v22 + 8 * (v20 ^ 0x923)))(a1);
  (*(void (**)(uint64_t, void))(v22 + 8 * (v20 ^ 0x8BE)))(a1, *(void *)(v23 - 208));
  uint64_t v25 = (*(uint64_t (**)(void))(v22 + 8 * (v20 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8 * (((v25 == *(void *)(v21 + 8 * (v20 ^ 0x198))) * (v20 + 1126 + 5 * (v20 ^ 0x18C) - 694)) ^ v20)))(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A128CEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v29
                              + 8
                              * (int)(((a28 == (void)*(&off_1E5A4B410 + (v28 ^ 0x85)) - 8)
                                     * (v28 ^ 0xAA41F1EA ^ ((v28 + 541156268) | 0x8A009004))) ^ v28)))();
}

uint64_t sub_1A128CF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 + 1946)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 + 1920)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v31 == v28) * (((v27 - 254) ^ 0xFFFFFF26) + (v27 ^ 0x46A))) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A128CF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v30 + 8 * (((a28 != v29) * ((v28 + 254) ^ 0x190)) | v28)))();
}

uint64_t sub_1A128CFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 ^ 0x8BE)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (((v31 == v28) * (((v27 ^ 0x46A) - 710) ^ 0x1E8)) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A128D04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v30
                              + 8
                              * (int)((((((v28 + 1126639268) & 0xBCD8D7BB) - 1438518604) ^ 0xAA41F073) * (a28 == v29)) ^ v28)))();
}

uint64_t sub_1A128D0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 + 1946)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v31 == v28) * (((v27 + 333592173) & 0xEC1DCDF8 ^ 0xFFFFFA8C) + v27 - 252)) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A128D124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v30 + 8 * ((((v28 + 252) ^ 0x75A) * (a28 == v29)) ^ v28)))();
}

uint64_t sub_1A128D180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 + 1946)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (((v31 == v28) * (v27 + 1438521567 + v27 - 1438518604 - 3095)) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A128D200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 8 * (v28 ^ 0xCEE)))(a28, v29, v31 - 128);
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (((v32 == 0) * ((v28 + 68) ^ (v28 + 66))) | v28));
  *(void *)(v31 - 200) = 0x1A44E0EB4FC706ALL;
  return v33(v32, v34, v35, v36, v37, v38, v39, v40);
}

uint64_t sub_1A128D284()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 ^ 0xF31)))(24, 4101018099);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (((v3 == 0) * ((v0 + 156) ^ v0 ^ 0x96)) ^ v0));
  *(void *)(v2 - 200) = 0x1A44E0EB4FC706ALL;
  return v4(v3, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1A128D30C(uint64_t a1)
{
  *(void *)(v3 - 184) = a1 + 0x1A44E0EB4FC706ALL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = 1814571000;
  *(void *)(a1 + 12) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 ^ 0xFA7)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2
                              + 8 * (((((v1 - 107) ^ (v5 == 0)) & 1) * ((v1 ^ 0x664) - 178)) ^ v1)))();
}

uint64_t sub_1A128D394()
{
  *(_DWORD *)(v2 + _Block_object_dispose(&a9, 8) = v1 + 4096;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((*(void *)(v4 - 128) > (unint64_t)(v0
                                                                                          - 652
                                                                                          + v1
                                                                                          - 1814566904
                                                                                          - 693))
                                * ((v0 ^ 0x504) + 515)) ^ v0)))();
}

uint64_t sub_1A128D3E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8 * ((((v3 + 360) ^ 0x413) * (v4 != 0)) ^ v3)))(a1, a2, a3);
}

uint64_t sub_1A128D420@<X0>(int a1@<W8>)
{
  unsigned int v5 = v1 + v2 + a1;
  unsigned int v6 = (((2 * a1 + 665825296) << (v3 ^ 0x1C)) & 0xFD5FDFF8) + ((2 * a1 + 665825296) ^ 0x7EAFEFFC);
  if (v5 > 0x4762EDD != v6 + 2094653734 < 0xFB89D122) {
    BOOL v7 = v6 + 2094653734 < 0xFB89D122;
  }
  else {
    BOOL v7 = v6 + 2094653734 > v5 - 74854110;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8 * ((367 * v7) ^ v3 ^ 0x2B4)))(4250918904, 3984078844, 2094653734);
}

uint64_t sub_1A128D4E0()
{
  uint64_t v4 = *(uint64_t (**)(void))(v2 + 8 * (int)((((v0 - 95685618) & 0xAFF5FF6F ^ 0xAA41F451) * (v1 == 0)) | v0));
  *(void *)(v3 - 200) = 0x1A44E0EB4FC706ALL;
  return v4();
}

uint64_t sub_1A128D544@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v24 = a1 - 200;
  (*(void (**)(uint64_t))(v22 + 8 * (a1 + 1438520241)))(v21);
  *(void *)(v23 - 200) = 0x1A44E0EB4FC706ALL;
  (*(void (**)(uint64_t))(v22 + 8 * (v24 + 1438520511)))(v20);
  (*(void (**)(uint64_t))(v22 + 8 * (int)(v24 ^ 0xAA41FD43)))(a20);
  return (*(uint64_t (**)(void))(v22 + 8 * ((74 * (*(void *)(v23 - 208) != 0)) | (v24 + 1438519375))))();
}

uint64_t sub_1A128D8EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v33 = (*(uint64_t (**)(void))(v31 + 8 * v29))();
  uint64_t v34 = *(uint64_t (**)(uint64_t))(v31 + 8 * ((v28 - 510) ^ ((a28 == 0) | (4 * (a28 == 0)))));
  *(void *)(v32 - 192) = v30;
  return v34(v33);
}

uint64_t sub_1A128D930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v36 = (*(uint64_t (**)(uint64_t))(v34 + 8 * (int)(v29 ^ 0xAA41FD43)))(a28);
  *(void *)(v35 - 192) = v30;
  if (v31 == -45004)
  {
    *(void *)(v35 - 184) = v33;
    *(void *)(v35 - 144) = 0;
    *(_DWORD *)(v35 - 132) = 0;
    uint64_t v44 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v34 + 18736))(**(unsigned int **)(v32 + 64), *(void *)v28, *(unsigned int *)(v28 + 12), v35 - 144, v35 - 132);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((1320 * ((v44 ^ 0x7FFFFEAB) - 899814434 + ((2 * v44) & 0xFFFFFD56) == 1516104332)) ^ 0x153)))(v44, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28);
  }
  else if (v31)
  {
    return (*(uint64_t (**)(uint64_t))(v34 + 8 * ((10 * (v28 == 0)) ^ 0x83)))(v36);
  }
  else
  {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((462 * (*(void *)(v35 - 200) != 0x1A44E0EB4FC706ALL)) ^ 0xED)))(*(void *)(v35 - 200), v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28);
  }
}

uint64_t sub_1A128E060(uint64_t a1)
{
  int v3 = (v1 - 469144713) & 0x71B4A762;
  unsigned int v4 = *(_DWORD *)(a1 - 0x1A44E0EB4FC705ELL) + 2002279202;
  unsigned int v5 = ((v3 - 1420259747) & 0x54A76E93 ^ 0xB303737) + *(_DWORD *)(a1 - 0x1A44E0EB4FC7062);
  int v6 = (v4 < 0x77585B1E) ^ (v5 < 0x77585B1E);
  BOOL v7 = v4 > v5;
  if (v6) {
    BOOL v7 = v4 < 0x77585B1E;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v7 * (v3 - 1702)) ^ v3)))();
}

uint64_t sub_1A128E11C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2 = v3 + 4;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (int)(((((a1 == a2) ^ (((v4 + 81) & 0x9F) - 82)) & 1)
                                     * ((v5 + ((v4 + 575506257) & 0xDDB2759F) - 1041) ^ (v5 - 22))) ^ (v4 + 575506257) & 0xDDB2759F)))();
}

uint64_t sub_1A128E1EC()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((*(void *)(*(void *)(v3 - 200) - 0x1A44E0EB4FC706ALL) == 0) ^ ((v0 & 0xC9) - 68)) & 1)
                                     * (v0 & 0x8E77A3C9 ^ (v1 + 905) ^ (v1 + 36))) ^ v0 & 0x8E77A3C9)))();
}

void sub_1A128E254(int a1@<W8>)
{
  unsigned int v5 = (a1 + 171965627) | 0xA001F402;
  (*(void (**)(void))(v4 + 8 * (int)(v5 ^ (v3 + 2227))))();
  void *v1 = 0;
  *(_DWORD *)(v2 - 0x1A44E0EB4FC7062) = 1814571000;
  *(_DWORD *)(v2 - 0x1A44E0EB4FC705ELL) = 0;
  (*(void (**)(void *))(v4 + 8 * (int)(v5 ^ (v3 + 2227))))(v1);
  JUMPOUT(0x1A128EBDCLL);
}

uint64_t sub_1A128E2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,_DWORD *a30,int a31,int a32)
{
  uint64_t v37 = (*(uint64_t (**)(void))(v35 + 8 * (v34 ^ (v34 + 2227))))(*(void *)(v33 - 0x1A44E0EB4FC706ALL));
  *(void *)(v33 - 0x1A44E0EB4FC706ALL) = a22;
  *a30 = a32;
  *(void *)(v36 - 160) = v32;
  return (*(uint64_t (**)(uint64_t))(v35
                                            + 8
                                            * ((((((167 * (v34 ^ (v34 + 8)) - 1270) ^ 1) & 1) == 0)
                                              * (((167 * (v34 ^ (v34 + 8)) - 1304) | 0x41) ^ 9)) ^ (167
                                                                                                  * (v34 ^ (v34 + 8))))))(v37);
}

void sub_1A128E374()
{
  *(void *)(v1 - 176) = v0;
  JUMPOUT(0x1A128E3A8);
}

uint64_t sub_1A128E410()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((((v1 - 1476338727) | 0x2411404) ^ (v3 + 168)) * (v0 == v2)) ^ v1)))();
}

uint64_t sub_1A128E454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v6 = v3 - 524;
  unsigned int v7 = 5 * ((v3 - 344459283) & 0xBEC9F7EF ^ (v4 - 57));
  BOOL v9 = v2 > 7 && (unint64_t)(a1 - a2) > 0x1F;
  return (*(uint64_t (**)(void))(v5 + 8 * (int)(((v7 - 323) * v9) ^ v6)))();
}

uint64_t sub_1A128E4A8()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * ((213 * (v0 >= (v1 ^ 0x2EC ^ (v2 + 951) ^ ((v1 + 37868175) | 0xA8002040)))) ^ v1)))();
}

uint64_t sub_1A128E4F8@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((1533 * ((v2 & 0xFFFFFFE0) - (unint64_t)(v4 + v3 - 157) == -2050)) ^ (v4 + v3 - 1401))))();
}

uint64_t sub_1A128E548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v7 = *(_OWORD *)(a3 + a2 + 16);
  uint64_t v8 = (_OWORD *)(a1 + a2);
  *uint64_t v8 = *(_OWORD *)(a3 + a2);
  v8[1] = v7;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 == a2) * v5) ^ v4)))();
}

uint64_t sub_1A128E578()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 + ((v2 - 2109649952) | 0x2800A044) - 2214) * (v0 != v1)) | v2)))();
}

uint64_t sub_1A128E5B4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((194 * (((v1 - 1707 - v2 + 1864 + ((v1 - 1952) | 0x319) + 1438517303) & v0) == 0)) ^ (v1 - 1707))))();
}

uint64_t sub_1A128E5FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((((v4 ^ 3 ^ (v5 + 941)) & v3) - 8 != v2) * ((((v4 ^ 3) - 828) | 0x201) - 602)) | v4 ^ 3)))();
}

uint64_t sub_1A128E64C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v5) = *(void *)(a2 + v5);
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 != v5) * v4) | v2)))();
}

uint64_t sub_1A128E674()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 ^ (v3 + 469) ^ (v3 - 819)) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A128E6A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + v2) = *(unsigned char *)(a2 + v2);
  return (*(uint64_t (**)(void))(v6 + 8 * ((44 * (v2 + 1 == v3)) ^ (v5 + v4 - 1074))))();
}

uint64_t sub_1A128E6D4()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)((((v3 + ((v1 + 117195770) & 0xF903BBFF) - 982) ^ (v3 + 26)) * (v0 != v2)) ^ v1)))();
}

uint64_t sub_1A128E720()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 + v3 + ((v0 - 925) | 0x500) - 1337 - 225) * (v1 > 7)) ^ v0)))();
}

uint64_t sub_1A128E75C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 ^ (v2 - 711) ^ (v2 - 13)) * (v0 > 0x1F)) ^ v1)))();
}

uint64_t sub_1A128E78C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((247
                                * (v0 < ((v1 - 278529498) & 0xBADBF4E6 ^ (v2 + 950) ^ (v1 - 1783889306) & 0x6A53FBFA))) ^ (v1 + 300))))();
}

uint64_t sub_1A128E7F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = (v4 + (v3 ^ (v6 + 210)) + 1518) & (v2 - 1);
  long long v9 = *(_OWORD *)(a2 + v8 - 15);
  long long v10 = *(_OWORD *)(a2 + v8 - 31);
  uint64_t v11 = a1 + v8;
  *(_OWORD *)(v11 - 15) = v9;
  *(_OWORD *)(v11 - 31) = v10;
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((4 * ((v2 & 0xFFFFFFE0) == 32)) | (8 * ((v2 & 0xFFFFFFE0) == 32)) | (v5 + v3 - 1468))))();
}

void sub_1A128E850()
{
}

uint64_t sub_1A128E85C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v2 ^ (v0 == v1)) & 1) == 0) * (((v2 - 285) | 0x80) - 147)) ^ v2)))();
}

uint64_t sub_1A128E890()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((39
                                * ((v0 & 0x18) == ((v1 - v2 + 2046) ^ 0xFFFFFFFF55BE0820)
                                                + (v1 + 729))) ^ v1)))();
}

uint64_t sub_1A128E8D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 - 7 + (~v2 + v3)) = *(void *)(a2 - 7 + (~v2 + v3));
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 - (v3 & 0xFFFFFFF8) == -8) * ((v4 + 415) ^ 0x189)) ^ v4)))();
}

uint64_t sub_1A128E92C(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  *(void *)(v6 + a3) = *(void *)(v5 + a3);
  return (*(uint64_t (**)(void))(v7 + 8 * (((a4 == 0) * a2) ^ v4)))();
}

uint64_t sub_1A128E95C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v0 + v0 + 902 - 2685) * (v2 == v1)) ^ v0)))();
}

uint64_t sub_1A128E98C()
{
  return v0();
}

uint64_t sub_1A128E994()
{
  uint64_t v4 = *(void *)(v3 - 176);
  *(_DWORD *)(v4 - 0x1A44E0EB4FC7062) = (*(_DWORD *)(v3 - 132) ^ 0xEE787FFD)
                                        + 2108663803
                                        + ((2 * *(_DWORD *)(v3 - 132)) & 0xDCF0FFFA);
  *(_DWORD *)(v4 - 0x1A44E0EB4FC705ELL) = 0;
  uint64_t v5 = (*(uint64_t (**)(void, void, void))(v2 + 8 * (int)((v1 + 2322) ^ 0xAA41F446)))(*(unsigned int *)*(&off_1E5A4B410 + v0 - 1438520411), *(void *)(v3 - 144), *(unsigned int *)(v3 - 132));
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v2 + 8 * ((v0 - 1438519891) ^ 0x7C5));
  *(void *)(v3 - 200) = v4;
  return v6(v5);
}

uint64_t sub_1A128E9FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v6 = v2 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a2 + v6);
  return (*(uint64_t (**)(void))(v5 + 8 * (((2 * (v6 != 0)) | (8 * (v6 != 0))) ^ (v4 + v3 - 763))))();
}

uint64_t sub_1A128EA30()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v1 == 0x1A44E0EB4FC706ALL) ^ ((v0 | 0xAC) - 35)) & 1)
                                     * (((v0 | 0x1AC) - 1438518696) ^ 0xAA41F45E)) ^ (v0 | 0x1AC))))();
}

uint64_t sub_1A128EA94@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((*(void *)(v1 - 0x1A44E0EB4FC706ALL) == 0) ^ (a1 + 58)) & 1)
                                     * ((a1 - 1100091773) & 0xEBD3FFF7 ^ (v2 + 859))) ^ a1)))();
}

void sub_1A128EAFC(int a1@<W8>)
{
  int v5 = (a1 - 1572753863) | 0x8004042;
  (*(void (**)(void))(v4 + 8 * (v5 ^ (v3 + 2227))))();
  void *v2 = 0;
  *(_DWORD *)(v1 - 0x1A44E0EB4FC7062) = 1814571000;
  *(_DWORD *)(v1 - 0x1A44E0EB4FC705ELL) = 0;
  (*(void (**)(void *))(v4 + 8 * (v5 ^ (v3 + 2227))))(v2);
  JUMPOUT(0x1A128EB7CLL);
}

uint64_t sub_1A128EC1C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((a1 - 1149634183) ^ (*v1 == 0)) & 1) == 0)
                                     * ((a1 - 1149634183) & 0xEEC7F55F ^ (v2 + 19))) ^ a1)))();
}

void sub_1A128EC68()
{
  (*(void (**)(void))(v3 + 8 * (v1 ^ (v2 + 2227))))();
  *(void *)uint64_t v0 = 0;
  *(_DWORD *)(v0 + _Block_object_dispose(&a9, 8) = 912148809;
  *(_DWORD *)(v0 + 12) = 0;
  JUMPOUT(0x1A128ECA4);
}

void qi864985u0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2) {
    BOOL v5 = a3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v8 = v5 || a4 == 0 || a5 == 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A128EDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_DWORD *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  *a30 = 0;
  *a29 = 0;
  *a31 = 0;
  *a24 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, void *, _DWORD *, void *, void *, void *, uint64_t, uint64_t))(v34 + 8 * ((59 * (a1 == 0)) ^ 0x2D1)))(a1, a2, a3, a4, 992817389, 3302152146, a7, a8, a9, a10, &byte_1A12A8470[256], 0x1E953EC78, &unk_1E953EC7C, 0x1E953EC24, a15, a16, a17, a18, a19,
           a20,
           a21,
           &unk_1E953EC80,
           a23,
           a24,
           a25,
           a1,
           a27,
           &unk_1E953EC7C,
           a29,
           a30,
           a31,
           &unk_1E953EC28,
           a33,
           a34);
}

uint64_t sub_1A128EE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((38 * (v5 == (((v6 + 452984265) | 0x202D3005) ^ a5))) ^ v6)))();
}

uint64_t sub_1A128EECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v7 = v5 + 76;
  int v8 = v7 ^ (a5 + 665);
  BOOL v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8 * (v7 ^ 0xA60)))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v6 + 8 * ((v9 * (v8 - 992815150 + 134 * (v7 ^ 0x36E) - 2677)) ^ v7)))();
}

uint64_t sub_1A128EF3C(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = 1337481487;
  *(void *)(a1 + 12) = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 1645)))(4096, 1358311088);
  *(void *)a1 = v4;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v4 == 0) * ((v1 ^ 0x39B) - 200)) ^ v1)))();
}

uint64_t sub_1A128EF9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(v4 + _Block_object_dispose(&a9, 8) = v7 + 4096;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                         + 8
                                                                                         * (((((14
                                                                                              * ((v5 + 1727) ^ 0x7D5)) ^ 0x3F6)
                                                                                            - 783)
                                                                                           * (v4 == 0)) | (v5 + 1727))))(a1, a2, a3, a4, 992817389, 3302152146);
}

uint64_t sub_1A128F014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46)
{
  unsigned int v49 = *(_DWORD *)(v47 + 12) - 130544155;
  unsigned int v50 = *(_DWORD *)(v47 + 8) - 1468025646;
  BOOL v51 = v49 < 0xF8380DE1;
  BOOL v52 = v49 > v50;
  if (v51 != v50 < 0xF8380DE1) {
    unsigned __int8 v53 = v51;
  }
  else {
    unsigned __int8 v53 = v52;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 8 * (((((5 * (v46 ^ 0x3D)) ^ v53) & 1) * (55 * (v46 ^ 0x31C) - 162)) ^ v46)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46);
}

void sub_1A128F0A4(int a1@<W8>)
{
  int v5 = (v2 - 81) | 0x86;
  uint64_t v6 = *(void *)(v3 - 0x53F82AF96D6B682ELL);
  unsigned int v7 = ((2 * a1) & 0x6FBFFBDE) + (a1 ^ 0x37DFFDEF);
  *(unsigned char *)(v6 + v7 + (v5 ^ 0xC82002FF)) = 0;
  v7 -= 937426414;
  *(unsigned char *)(v6 + v7) = 0;
  *(unsigned char *)(v6 + v7 + 1) = 0;
  *(unsigned char *)(v6 + v7 + 2) = 1;
  *v1 += 4;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A12908A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 8 * ((45 * (a39 != 0x53F82AF96D6B682ELL)) ^ v49)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49);
}

uint64_t sub_1A12908E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  unsigned int v53 = (v50 + 1211070133) & 0xB7D087FE;
  unsigned int v54 = *(_DWORD *)(v51 - 0x53F82AF96D6B6822) - 1322609147;
  unsigned int v55 = *(_DWORD *)(v51 - 0x53F82AF96D6B6826) + 1634876658;
  BOOL v56 = v54 < (((v53 ^ 0x7F8) - 1322611214) ^ (v53 + 91));
  BOOL v57 = v54 > v55;
  if (v56 != v55 < 0xB12A9601) {
    BOOL v58 = v56;
  }
  else {
    BOOL v58 = v57;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 8 * (int)((41 * v58) ^ v53)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_1A12909A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  LODWORD(a43) = v51;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 8 * (int)((((v52 - 850) ^ (a5 - 181) ^ (a5 + 17)) * (v53 == 0x53F82AF96D6B682ELL)) ^ v52)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51);
}

uint64_t sub_1A12909EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v9 = ((2 * (a6 + v7 + 1620003779 + 2 * v6 - 1696)) & 0xFFF8B73C)
     + ((a6 + v7 + 1620003779 + 2 * v6 - 1696) ^ 0x7FFC5B9F)
     + 784619079;
  BOOL v10 = v9 < 0xAEC0B1E6;
  BOOL v11 = v9 > v6 + 1594382555;
  if ((v6 + 1594382555) < 0xAEC0B1E6 != v10) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * ((28 * !v12) ^ (a6 + v7 - 981))))(784619079);
}

uint64_t sub_1A1290A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  LODWORD(a43) = v52;
  uint64_t v62 = (*(uint64_t (**)(void, uint64_t))(v54 + 8 * (v55 + 619)))(v53 + ((v55 + 1719611453) & 0x9980C9F7) + ((v55 - 1632) | 0x22) - 2147245270, 1120292948);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 8 * ((v62 == 0) ^ v55)))(v62, v56, v57, v58, 992817389, 3302152146, v59, v60, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52);
}

void sub_1A1290B2C()
{
}

uint64_t sub_1A1290B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,_DWORD *a59,uint64_t a60)
{
  uint64_t v61 = (*(uint64_t (**)(void))(v60 + 8 * (a5 + a6)))(*(void *)(a57 - 0x53F82AF96D6B682ELL));
  *(void *)(a57 - 0x53F82AF96D6B682ELL) = a60;
  *a59 = a43;
  return sub_1A1290BDC(v61);
}

uint64_t sub_1A1290BDC@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v5 = *(void *)(v2 - 0x53F82AF96D6B682ELL);
  unsigned int v6 = ((v1 << (((v3 - 55) & 0xD7) + 44)) & 0x7FAFFDFE) + (v1 ^ 0x3FD7FEFF) - 1071120127;
  *(unsigned char *)(v5 + v6 + 1) = -32;
  *(unsigned char *)(v5 + v6 + 2) = -76;
  *(unsigned char *)(v5 + v6) = -49;
  *(unsigned char *)(v5 + v6 + 3) = 106;
  *a1 += 4;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)((((((v3 + 1679218889) & 0x9BE923D7 ^ 0x786) & 1) == 0)
                                     * (13 * ((v3 + 1679218889) & 0x9BE923D7 ^ 0xB2) - 1280)) ^ (v3 + 1679218889) & 0x9BE923D7)))();
}

uint64_t sub_1A1290CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 8 * (((v54 & ~((17 * (v53 ^ 0x75C)) ^ (a39 == 0x53F82AF96D6B682ELL))) * ((v53 ^ 0x11E) - 1550)) ^ v53)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53);
}

uint64_t sub_1A1290D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  unsigned int v57 = *(_DWORD *)(v55 - 0x53F82AF96D6B6822) + 58686617;
  unsigned int v58 = ((v54 + 1014413480) & 0xC389497F) - 1278797038 + *(_DWORD *)(v55 - 0x53F82AF96D6B6826);
  BOOL v59 = v57 < ((v54 + 866148595) & 0xCC5F9AFF) + 58686038;
  BOOL v60 = v57 > v58;
  if (v59 != v58 < 0x37F7C95) {
    BOOL v61 = v59;
  }
  else {
    BOOL v61 = v60;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 8 * ((50 * v61) | v54)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54);
}

uint64_t sub_1A1290DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  HIDWORD(a4_Block_object_dispose(&a9, 8) = v55;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8 * (int)(((((v57 == 0x53F82AF96D6B682ELL) ^ (v56 - 1)) & 1) * (a6 + (v56 ^ (a5 + 1964)) - 2002)) ^ v56)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_1A1290E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v9 = ((2 * (2 * v6 + 1620004322)) & 0xFF73B31C) + ((2 * v6 + 1620004322) ^ 0xFFB9D98F) + 350686845;
  BOOL v10 = v9 < 0x14A0E80C;
  BOOL v11 = v9 > v6 - 991391999;
  if ((v6 - 991391999) < 0x14A0E80C != v10) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((2982 * v12) ^ (a6 + v7 - 1299))))();
}

uint64_t sub_1A1290EF0@<X0>(int a1@<W8>)
{
  uint64_t v5 = *(void *)(v2 - 0x53F82AF96D6B682ELL);
  int v6 = v3 - 337;
  unsigned int v7 = ((2 * a1) & 0xD7BE7BFE) + (a1 ^ 0x6BDF3DFF) - 1809792749;
  *(unsigned char *)(v5 + v7 + v6) = 0;
  *(unsigned char *)(v5 + v7 + 239) = 0;
  *(unsigned char *)(v5 + v7 + 240) = 0;
  *(unsigned char *)(v5 + v7 + 241) = 1;
  *v1 += 4;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((233 * (v6 ^ 0xEC)) ^ 0x5D) + ((v3 - 517) | 0x501)) ^ v6)))();
}

uint64_t sub_1A12910E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8 * (((a39 == 0x53F82AF96D6B682ELL) * (v57 ^ 0x59D ^ v57 ^ 0x13C ^ 0x491)) ^ v57)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

uint64_t sub_1A129113C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  unsigned int v61 = (((v58 - 604) | 0x608) ^ 0x16946541) + *(_DWORD *)(v59 - 0x53F82AF96D6B6822);
  unsigned int v62 = *(_DWORD *)(v59 - 0x53F82AF96D6B6826) - 958658141;
  BOOL v63 = v61 < v58 + 378822243;
  BOOL v64 = v61 > v62;
  if (v63 != v62 < 0x169462B2) {
    BOOL v65 = v63;
  }
  else {
    BOOL v65 = v64;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 8 * ((753 * v65) ^ v58)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58);
}

uint64_t sub_1A12911E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  LODWORD(a44) = v59;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 8 * ((4085 * (((v61 == 0x53F82AF96D6B682ELL) ^ (v60 + 4)) & 1)) ^ v60)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59);
}

uint64_t sub_1A1291238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  unsigned int v9 = ((2 * (2 * v6 + 1620004322)) & 0x9F79FE9C)
     + ((2 * v6 + 1620004322) ^ 0x4FBCFF4F)
     + (((v7 & 0xFF3DBDED) - a5 + 1930) ^ 0x737EEADB);
  BOOL v10 = v9 < 0xC33BECA0;
  BOOL v11 = v9 > v6 + 1938002841;
  if ((v6 + 1938002841) < 0xC33BECA0 != v10) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * (int)((2057 * v12) ^ (a6 + (v7 & 0xFF3DBDED) - 2075))))();
}

uint64_t sub_1A12912EC@<X0>(_DWORD *a1@<X8>)
{
  int v6 = v3 ^ 0x764;
  unint64_t v7 = v5 - ((2 * v5) & 0xF99431D3CA63CC58) + 0x7CCA18E9E531E62CLL;
  uint64_t v8 = (unsigned char *)((((unint64_t)v1 << (v6 + 19)) & 0x1EFFD5FF2)
               + (v1 ^ 0x23FE2B3FF7FEAFF9)
               + *(void *)(v2 - 0x53F82AF96D6B682ELL)
               - 0x23FE2B3FF7FEAFF9);
  *uint64_t v8 = HIBYTE(v7) ^ 0x7C;
  v8[1] = BYTE6(v7) ^ 0xCA;
  v8[2] = BYTE5(v7) ^ 0x18;
  void v8[3] = BYTE4(v7) ^ 0xE9;
  v8[4] = ((v5 - ((2 * v5) & 0xCA63CC58) - 449714644) >> 24) ^ 0xE5;
  v8[5] = ((v5 - ((2 * v5) & 0xCA63CC58) - 449714644) >> 16) ^ 0x31;
  v8[6] = ((unsigned __int16)(v5 - ((2 * v5) & 0xCC58) - 6612) >> 8) ^ 0xE6;
  v8[7] = v7 ^ 0x2C;
  *a1 += 8;
  return (*(uint64_t (**)(void))(v4 + 8 * (int)((v6 + 1299785425) & 0xB286DD7B ^ 0x9E ^ v6)))();
}

uint64_t sub_1A1291598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t))(v40 + 8 * (int)(((a39 == 0x53F82AF96D6B682ELL) * ((v39 + 2072) ^ 0x3B2D39EB ^ (a5 + 1780) ^ (5 * ((v39 + 2072) ^ 0x861)))) ^ (v39 + 2072))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           0,
           a39);
}

uint64_t sub_1A1291618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  int v64 = (v63 - 635) ^ (a5 + 888);
  (*(void (**)(void))(v62 + 8 * (v63 + 542)))();
  (*(void (**)(void))(v62 + 8 * (v63 ^ 0xFEA)))();
  uint64_t v71 = (*(uint64_t (**)(uint64_t, void))(v62 + 8 * (v63 ^ 0xFFC)))(a11, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 8 * (((v71 != 0) * (v64 - 992815150 + ((v63 - 635) | 0x30) - 3430)) ^ v63)))(v71, v65, v66, v67, 992817389, 3302152146, v68, v69, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

uint64_t sub_1A12916E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned __int8 v65 = v63 ^ (a5 + 104);
  uint64_t v72 = (*(uint64_t (**)(uint64_t, uint64_t, void))(v64 + 8 * (v63 ^ 0xDBC)))(a11, a1, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v64 + 8 * ((((v65 ^ (v72 == 0)) & 1) * ((17 * (v63 ^ 0x4A5)) ^ 0x188)) ^ v63)))(v72, v66, v67, v68, 992817389, 3302152146, v69, v70, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

#error "1A1291808: call analysis failed (funcsize=42)"

uint64_t sub_1A129180C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10 = v8 - 1727;
  int v11 = 181 * ((v8 - 68324306) & 0x3F3FB3FF ^ (v5 - 3));
  BOOL v12 = v7 == *(void *)(v9 + 8 * (v10 - 493)) - 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                         + 8
                                                                                         * (((4
                                                                                            * ((v12 ^ v11) & 1)) & 0xF7 | (8 * ((v12 ^ v11) & 1))) ^ v10)))(a1, a2, a3, a4, a5, 3302152146);
}

uint64_t sub_1A1291874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v31 = a6 + ((v30 + 1073689354) & 0xFB2DF8EF);
  uint64_t v32 = v27;
  (*(void (**)(uint64_t, uint64_t))(v29 + 8 * (v30 + 1081)))(a27, v28);
  BOOL v33 = (*(uint64_t (**)(void))(v29 + 8 * (v30 + 1055)))() == v32;
  return (*(uint64_t (**)(void))(v29 + 8 * ((v33 * (v31 - 1691)) ^ v30)))();
}

uint64_t sub_1A12918EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((a6 + ((v9 + 36444165) | 0x39011029) + 329) * (v8 == v7)) ^ (v9 - 1715))))();
}

uint64_t sub_1A129192C@<X0>(int a1@<W5>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v24 = a2 + 743;
  int v25 = ((a2 + 743) ^ 0x4F1) - a1 + 2237;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8 * ((a2 + 743) ^ 0xDDF)))(a21, v21);
  BOOL v26 = (*(uint64_t (**)(void))(v23 + 8 * (v24 + 1055)))() == v22;
  return (*(uint64_t (**)(void))(v23 + 8 * ((v26 * (v25 ^ 0x3B2D3E45 ^ (262 * (v24 ^ 0x4F1)))) ^ v24)))();
}

uint64_t sub_1A12919B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((((a6 + ((v9 + 957152885) | 0x220306C) - 2117) ^ (v9 - 423651853) & 0x19406CF3)
                                * (v8 == v7)) ^ v9)))();
}

uint64_t sub_1A1291A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, uint64_t))(v29 + 8 * (v30 + 1081)))(a27, v27);
  BOOL v31 = (*(uint64_t (**)(void))(v29 + 8 * (v30 ^ 0xDE1u)))() == v28;
  return (*(uint64_t (**)(void))(v29 + 8 * ((v31 * ((v30 - 743) ^ 0x3EC)) ^ v30)))();
}

uint64_t sub_1A1291A84()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((((v3 + 992816865) ^ 0x3B2D33DB ^ (7 * (v3 ^ 0x2B9))) * (v2 == v1)) ^ v3)))();
}

uint64_t sub_1A1291AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v32 = v31 ^ (v27 + 817);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8 * (v31 + 1081)))(a27, v28);
  BOOL v33 = (*(uint64_t (**)(void))(v30 + 8 * (v31 + 1055)))() == v29;
  return (*(uint64_t (**)(void))(v30 + 8 * ((v33 * (v32 ^ 0x3B2D3C34)) ^ v31)))();
}

uint64_t sub_1A1291B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v31 = a6 + v27;
  (*(void (**)(uint64_t))(v29 + 8 * (a6 + v27 + 70)))(v30);
  uint64_t v32 = (*(uint64_t (**)(uint64_t))(v29 + 8 * (v27 ^ 0x3B2D39E8)))(a27);
  return (*(uint64_t (**)(uint64_t))(v29 + 8 * ((27 * (v28 != 0)) | (v31 - 123))))(v32);
}

void sub_1A1291B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,int a37)
{
  unint64_t v38 = STACK[0x208];
  (*(void (**)(void))(v37 + 8 * (a5 ^ (a5 + 1893))))(*(void *)(STACK[0x208]
                                                                                            - 0xE22A8927A3C9258));
  *(void *)(v38 - 0xE22A8927A3C925_Block_object_dispose(&a9, 8) = STACK[0x218];
  *(_DWORD *)STACK[0x210] = a37;
  JUMPOUT(0x1A1293298);
}

uint64_t sub_1A1291BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(a47 - 0xE22A8927A3C9250) = (a38 ^ 0x7FDE7DAB) - 268964865 + ((2 * a38) & 0xFFBCFB56);
  *(_DWORD *)(a47 - 0xE22A8927A3C924CLL) = 1241410955;
  int v72 = a6 + 992817266;
  (*(void (**)(uint64_t))(v71 + 8 * (a6 + 992817459)))(a70);
  uint64_t v73 = (*(uint64_t (**)(uint64_t))(v71 + 18472))(a71);
  return (*(uint64_t (**)(uint64_t))(v71 + 8 * ((27 * (a69 != 0)) | v72)))(v73);
}

void sub_1A1291C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41)
{
  unint64_t v42 = STACK[0x220];
  (*(void (**)(void))(v41 + 8 * (a5 ^ (a5 + 1893))))(*(void *)(STACK[0x220]
                                                                                            - 0xE22A8927A3C9258));
  *(void *)(v42 - 0xE22A8927A3C925_Block_object_dispose(&a9, 8) = STACK[0x230];
  *(_DWORD *)STACK[0x228] = a41;
  LODWORD(STACK[0x238]) = 0;
  JUMPOUT(0x1A128F9B4);
}

uint64_t sub_1A1291CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,unsigned int a47)
{
  *(_DWORD *)(a45 - 0xE22A8927A3C9250) = (a47 ^ 0x6FFEF9FE) - 2658388 + ((a6 + a5 - 537007299) & (2 * a47));
  *(_DWORD *)(a45 - 0xE22A8927A3C924CLL) = 1241410955;
  int v48 = STACK[0x238];
  uint64_t v50 = (*(uint64_t (**)(void, uint64_t, void))(v47 + 8 * ((a6 + a5 - 1682) ^ 0xB33)))(*(unsigned int *)*(&off_1E5A4B410 + ((a6 + a5 - 1682) ^ 0x233)), a34, a47);
  return (*(uint64_t (**)(uint64_t))(v47
                                            + 8
                                            * (((v48 == 0)
                                              * (((a5 - 2130254574) & 0x43CBEAEE ^ 0x203)
                                               + ((a5 - 2130254574) & 0x43CBEAEE ^ 0x5D5)
                                               - 475)) ^ (a5 - 2130254574) & 0x43CBEAEE)))(v50);
}

uint64_t sub_1A1291D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v42 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(v39 + 8 * (v38 - 992815063)))(v40, v41, &a38);
  STACK[0x200] = v42;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 8 * (((v42 != 0) * (v38 - 992813338)) ^ (v38 - 992815352))))(v42, v43, v44, v45, v46, 3302152146, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A1291D60@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((v1 - 2050267004) ^ 0x85CB68A7 ^ (v1 - 2050267004) & 0x7A349774 ^ 7) * (a1 == 0)) ^ v1)))();
}

void sub_1A1291DA8(uint64_t a1@<X8>, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unsigned int a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  (*(void (**)(uint64_t))(v27 + 8 * (v25 + 1347)))(a1);
  *BOOL v26 = 0;
  *a3 = 0;
  *(_DWORD *)(a25 + 40 * a18 + 36) = 0;
  JUMPOUT(0x1A1291DF8);
}

uint64_t sub_1A1291E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * (int)(((a6 + ((a5 + ((v6 + 1668856151) & 0x9C8746BD) + 12583246) & 0xFF3FF7FD) - 2123)
                                     * (*(void *)(v8 - 0xE22A8927A3C9258) == 0)) ^ (v6 + 1668856151) & 0x9C8746BD)))();
}

uint64_t sub_1A1291EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  *uint64_t v39 = 0;
  *(_DWORD *)(v42 - 0xE22A8927A3C9250) = 1876322730;
  *(_DWORD *)(v42 - 0xE22A8927A3C924CLL) = 1241410955;
  uint64_t v43 = (*(uint64_t (**)(void *))(v41 + 8 * (v40 + a6)))(v39);
  return (*(uint64_t (**)(uint64_t))(v41
                                            + 8
                                            * (((((v40 - 50) & 0x7F ^ (a39 == 0x53F82AF96D6B682ELL) ^ 0xEC) & 1)
                                              * (((v40 - 1036569394) & 0x29B9F7F) - 1193)) ^ (v40 - 1036569394) & 0x29B9F7F)))(v43);
}

uint64_t sub_1A1291FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (((*(void *)(v6 - 0x53F82AF96D6B682ELL) == 0) * ((v7 - 70 - a6 + 970) ^ (a5 - 7))) ^ (v7 - 70))))();
}

void sub_1A1292020()
{
  void *v1 = 0;
  *(_DWORD *)(v0 - 0x53F82AF96D6B6826) = 1337481487;
  *(_DWORD *)(v0 - 0x53F82AF96D6B6822) = 0;
  JUMPOUT(0x1A129207CLL);
}

uint64_t sub_1A12920D0()
{
  int v4 = 171 * (v0 & 0xC35A7B7 ^ 0x303);
  uint64_t v5 = (*(uint64_t (**)(void))(v2 + 8 * ((v0 & 0xC35A7B7u) + 1465)))();
  *int v3 = 0;
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (int)((((v4 - 2050267004) ^ 0x85CB68A7 ^ (v4 - 2050267004) & 0x7A349774 ^ 7)
                                                   * (*v1 == 0)) ^ v4)))(v5);
}

void sub_1A129214C()
{
}

uint64_t sub_1A12921CC()
{
  BOOL v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * ((v0 + 2029) ^ 0xEE6)))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v1 + 8 * ((v3 * (((v2 + v0) ^ 0x3B2D3B26) + ((v0 + 2029) ^ 0x3F8))) ^ (v0 + 2029))))();
}

uint64_t sub_1A129223C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = 1876322730;
  *(void *)(a1 + 12) = 1241410955;
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8 * (v15 ^ 0xD1E)))(4096, 1358311088);
  *(void *)a1 = v17;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 8 * (((v17 == 0) * (v15 - 696 + ((2 * v15) ^ 0xF3C) - 2110)) ^ v15)))(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1A12922D4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (int)(((((v3 + v2 + 5393845) & 0xFFADB0ED) - 992817348) * (v0 != 0)) ^ v2)))();
}

void sub_1A1292318(int a1@<W5>, int a2@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a2 - 349 + a1)))(v2);
  JUMPOUT(0x1A1292490);
}

uint64_t sub_1A12924EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  (*(void (**)(uint64_t))(v74 + 8 * v75))(v72);
  return (*(uint64_t (**)(void))(v74 + 8 * ((15 * (a72 != 0)) ^ (v73 - 1261))))();
}

uint64_t sub_1A129253C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9 = (*(uint64_t (**)(void))(v7 + 8 * (a6 + v6 + 70)))();
  return (*(uint64_t (**)(uint64_t))(v7
                                            + 8
                                            * (((v8 == v6 - 992862393) * ((v6 - 992816798) ^ 0xF55)) ^ (v6 - 992815916))))(v9);
}

uint64_t sub_1A129259C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,int a47)
{
  unsigned int v50 = ((v48 + 992965294) & 0xFFFDBBEF) - a5 + 593;
  a34 = 0;
  a47 = 0;
  a45 = 0xE22A8927A3C9258;
  uint64_t v51 = (*(uint64_t (**)(void, void, void, uint64_t *, int *))(v47 + 8 * (v48 + 1751)))(**(unsigned int **)(v49 + 8 * (v48 - 583)), *(void *)(a39 - 0x53F82AF96D6B682ELL), *(unsigned int *)(a39 - 0x53F82AF96D6B6822), &a34, &a47);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 8 * ((30 * ((v51 ^ 0x7F5DEF89) - 889193728 + ((2 * v51) & 0xFEBBDF12) != (v50 ^ 0x5A5DE8DD))) ^ v48)))(v51, v52, v53, v54, v55, v56, v57, v58, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_1A1292690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  BOOL v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v12 + 8 * (v11 ^ 0xB63)))(**(unsigned int **)(v15 + 8 * (v11 ^ 0x244)), a11, v13) == 0;
  return (*(uint64_t (**)(void))(v12 + 8 * ((v16 * (v14 + ((v11 + 941956527) | 0x30810ED) - 398)) ^ v11)))();
}

uint64_t sub_1A1292700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,int a47)
{
  int v53 = (*(uint64_t (**)(void, void, void, char *, int *))(v48 + 8 * (v47 ^ 0xB77)))(*v50, *v49, *v51, &a34, &a47);
  unsigned int v54 = (v53 ^ 0xEEDDEBCD) + 1535114940 + ((((v47 + 34340311) | 0x392130C5) ^ 0xE696E777) & (2 * v53));
  if (v54 == 1516104332) {
LABEL_6:
  }
    JUMPOUT(0x1A1292C90);
  if (v54 != 1247668873)
  {
    int v57 = 2052531167 * (((v52 - 108) & 0xAC0229D1 | ~((v52 - 108) | 0xAC0229D1)) ^ 0x96776102);
    *(_DWORD *)(v52 - 104) = -1239432284 - v57;
    *(_DWORD *)(v52 - 100) = (v54 - ((2 * v54 + 725887726) & 0x25BEB83A) + 1216442772) ^ v57;
    (*(void (**)(uint64_t))(v48 + 18568))(v52 - 108);
    goto LABEL_6;
  }
  uint64_t v55 = *(uint64_t (**)(void))(v48
                            + 8
                            * ((110
                              * ((*(uint64_t (**)(uint64_t, uint64_t))(v48 + 18520))(24, 4101018099) != 0)) ^ 0x1B2));
  return v55();
}

uint64_t sub_1A1292B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(void))(v73 + 8 * ((15 * (a72 != 0)) ^ (v72 - 1261))))();
}

uint64_t sub_1A1292B78()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 - 80777191) & 0x3FFDBEED ^ (v1 + 992816921)) * (v0 != 0)) ^ v1)))();
}

void sub_1A1292BC0(int a1@<W5>, int a2@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a2 + 1753 + a1)))(v2);
  JUMPOUT(0x1A1292C4CLL);
}

uint64_t sub_1A1292D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34
                                                                                                  + 8 * (((a33 == 0xE22A8927A3C9258) * ((13 * (v33 ^ 0x27A)) ^ (v33 + 854))) ^ v33)))(a1, a2, a3, a4, a5, a6, 3053556341);
}

uint64_t sub_1A1292D58@<X0>(int a1@<W8>)
{
  unsigned int v3 = *(_DWORD *)(v2 - 0xE22A8927A3C924CLL) + 90537754;
  unsigned int v4 = *(_DWORD *)(v2 - 0xE22A8927A3C9250) - 544374025;
  BOOL v5 = v3 < ((a1 - 268) ^ 0x4F63EA3Eu);
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x4F63ECA1) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((!v6 * (a1 - 1956)) ^ a1)))();
}

uint64_t sub_1A1292DF4@<X0>(int a1@<W6>, int a2@<W8>)
{
  uint64_t v6 = *(void *)(v5 - 0xE22A8927A3C9258);
  int v7 = (*(unsigned __int8 *)(v6 + (v3 + a1 + 1)) << (((a2 + 52) & 0xBF) + 113)) | (*(unsigned __int8 *)(v6 + (v3 + a1)) << (a2 + 109)) | (*(unsigned __int8 *)(v6 + (v3 + a1 + 2)) << 8) | *(unsigned __int8 *)(v6 + (v3 + a1 + 3));
  _DWORD *v2 = v3 + 4;
  return (*(uint64_t (**)(void))(v4 + 8 * ((1774 * (v7 == 0)) ^ (a2 - 1036))))();
}

uint64_t sub_1A1292E88()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((((v0 + 230) ^ 0x7E8) + 818) ^ 0x68C) * (v2 == 0xE22A8927A3C9258)) ^ (v0 + 230))))();
}

uint64_t sub_1A1292ED0()
{
  BOOL v4 = v0 - 1551494817 > (v1 + 2108560696);
  if ((v1 + 2108560696) < 0xED847EE2 != v0 - 1551494817 < ((v2 + 1063) ^ 0x10Bu) - 310085565) {
    BOOL v4 = v0 - 1551494817 < ((v2 + 1063) ^ 0x10Bu) - 310085565;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((242 * v4) ^ v2)))();
}

uint64_t sub_1A1292F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v33 = *(unsigned __int8 *)(v29 + (a7 + v28 + 6));
  *uint64_t v27 = v28 + 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (v30 ^ (53 * (v32 != 0xE22A8927A3C9258)))))(53, v33, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A1292FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v12 = v10 + v9 + ((v8 + 897) ^ (a7 + 629));
  unsigned int v13 = v12 + 1862066372;
  unsigned int v14 = v7 - 14256479 + (v8 ^ 0x367);
  BOOL v15 = v12 > 0x91031F3B;
  BOOL v16 = v13 > v14;
  if (v14 < 0x6EFCE0C4 == v15) {
    BOOL v15 = v16;
  }
  return (*(uint64_t (**)(void))(v11 + 8 * ((47 * !v15) ^ v8)))();
}

uint64_t sub_1A1293050(int a1)
{
  _DWORD *v1 = v2;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v4 == 0xE22A8927A3C9258) ^ (a1 - 80)) & 1)
                                * ((a1 + 1574) ^ 0x667)) ^ a1)))();
}

uint64_t sub_1A129309C()
{
  BOOL v4 = v1 - 412460064 > (v0 - 1047371843);
  if ((v0 - 1047371843) < 0x3168C967 != v1 - 412460064 < ((v2 + 94) | 0x218u) + 828949192) {
    BOOL v4 = v1 - 412460064 < ((v2 + 94) | 0x218u) + 828949192;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((!v4 * (((v2 - 752) | 0x42) ^ 0x17E)) ^ v2)))();
}

uint64_t sub_1A1293124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v39 = (*(unsigned __int8 *)(v34 + a7 + v35 + (v36 ^ 0x102u) - 121) << (((v36 - 111) | 0x12) - 6)) | (*(unsigned __int8 *)(v34 + (a7 + v35 + 1)) << 16) | (*(unsigned __int8 *)(v34 + (a7 + v35 + 2)) << 8) | *(unsigned __int8 *)(v34 + (a7 + v35 + 3));
  uint64_t v40 = (v35 + 4);
  *uint64_t v33 = v40;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (v36 ^ (229 * (v38 != 0xE22A8927A3C9258)))))(v39, v40, 229, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33);
}

uint64_t sub_1A12931B4(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v10 = a1 + a2 + a7;
  unsigned int v11 = v10 + 1495197972;
  unsigned int v12 = v7 - 381124815 + 3 * (v8 ^ 0x70D);
  BOOL v13 = v10 > 0xA6E116EB;
  int v14 = v13 ^ (v12 < 0x591EE914);
  BOOL v15 = v11 > v12;
  if (v14) {
    BOOL v15 = v13;
  }
  return (*(uint64_t (**)(void))(v9 + 8 * ((!v15 * ((v8 ^ 0x70D) + 26)) ^ v8)))();
}

void sub_1A1293234(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _DWORD *v23 = v24;
  LODWORD(STACK[0x23C]) = 0;
  *a23 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8 * (a1 + 352)))(v25, 925082483);
  JUMPOUT(0x1A1293294);
}

void sub_1A129334C()
{
  LODWORD(STACK[0x23C]) = v0;
  JUMPOUT(0x1A1291E28);
}

uint64_t sub_1A129335C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v35 = (*(uint64_t (**)(void, uint64_t))(v34 + 8 * (v33 + 239)))(v32 - 2144798872 + 1103 * (v33 ^ 0x81Eu), 1120292948);
  STACK[0x230] = v35;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * (((v35 == 0) * (v33 - 2013)) ^ v33)))(v35, v36, v37, v38, v39, 3302152146, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_1A12933C8()
{
  LODWORD(STACK[0x238]) = v2;
  return (*(uint64_t (**)(void))(v1 + 8 * (((((v3 ^ 0x959) + 102) ^ 0x216) * (v0 == 0)) ^ v3)))();
}

uint64_t sub_1A12933FC@<X0>(int a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * (int)(((*v2 == 0) * (((a2 - a1 + 1784) ^ 0xFFFFFFF6) + a2 + 992816934)) ^ a2)))();
}

uint64_t sub_1A1293440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,unsigned int a47)
{
  int v57 = a6 + v49 - 1682;
  *(void *)uint64_t v51 = 0;
  *(_DWORD *)(v51 + _Block_object_dispose(&a9, 8) = v55;
  *(_DWORD *)(v51 + 12) = v53;
  (*(void (**)(uint64_t))(v52 + 8 * (v49 ^ (v50 + 1893))))(v51);
  uint64_t v47 = (*(uint64_t (**)(void, uint64_t, void))(v52 + 8 * (v57 ^ 0xB33)))(**(unsigned int **)(v56 + 8 * (v57 ^ 0x233)), a34, a47);
  return (*(uint64_t (**)(uint64_t))(v52
                                            + 8
                                            * (((v54 == 0)
                                              * (((v57 - 1137437742) & 0x43CBEAEE ^ 0x203)
                                               + ((v57 - 1137437742) & 0x43CBEAEE ^ 0x5D5)
                                               - 475)) ^ (v57 - 1137437742) & 0x43CBEAEE)))(v47);
}

uint64_t sub_1A12934E0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v30 = v28 + 133;
  uint64_t v31 = (*(uint64_t (**)(void, uint64_t))(v29 + 8 * (v28 + 432)))(((v28 - 1172) ^ 0x90089486) + a2, 1120292948);
  STACK[0x218] = v31;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (((v31 == 0) * ((v30 ^ 0x7A9) - 56)) | v30)))(v31, v32, v33, v34, 992817389, 3302152146, v35, v36, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A1293558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (((a6 + (v8 ^ (a5 + 317)) + (v8 ^ 0x226) - 2449) * (v6 == 0)) ^ v8)))();
}

uint64_t sub_1A1293590@<X0>(char a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((*v2 == 0) ^ (a2 - a1 - 34)) & 1)
                                * ((a2 - 8425460) & 0x3BADBFFF ^ 0x3B2D30E3)) | a2)))();
}

uint64_t sub_1A12935E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(void))(v31 + 8 * (v29 + a6)))();
  *(void *)a23 = 0;
  *(_DWORD *)(a23 + _Block_object_dispose(&a9, 8) = a20;
  *(_DWORD *)(a23 + 12) = 1241410955;
  (*(void (**)(uint64_t))(v31 + 8 * (v29 ^ 0x3B2D3852)))(a23);
  (*(void (**)(uint64_t))(v31 + 8 * (v29 - 992815080)))(v32);
  uint64_t v27 = (*(uint64_t (**)(uint64_t))(v31 + 8 * (v29 ^ 0x3B2D39E8)))(a27);
  return (*(uint64_t (**)(uint64_t))(v31 + 8 * ((27 * (v30 != 0)) | (v29 - 992815273))))(v27);
}

uint64_t sub_1A1293664(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t)*(&off_1E5A4B410
                + ((9 * ((dword_1E953E880 + dword_1E953E8A8) ^ 0x7D)) ^ byte_1A12A8690[byte_1A12A9100[(9 * ((dword_1E953E880 + dword_1E953E8A8) ^ 0x7D))] ^ 0xC0])
                - 30);
  uint64_t v3 = *(void *)(v2 - 4);
  uint64_t v4 = (uint64_t)*(&off_1E5A4B410
                + (byte_1A12A8BC8[(byte_1A12A87A8[(9 * ((dword_1E953E880 + v3) ^ 0x7D))
                                                                 - 8] ^ 0x19)
                                                 - 8] ^ (9 * ((dword_1E953E880 + v3) ^ 0x7D)))
                - 39);
  unint64_t v5 = (unint64_t)&v13[*(void *)(v4 - 4) ^ v3];
  uint64_t v6 = 1787074057 * v5 + 0x12143784A120E583;
  unint64_t v7 = 1787074057 * (v5 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v2 - 4) = v6;
  *(void *)(v4 - 4) = v7;
  LOBYTE(v7) = 9 * ((v7 - *(_DWORD *)(v2 - 4)) ^ 0x7D);
  int v8 = &(**(&off_1E5A4B410
          + ((9 * ((dword_1E953E880 + dword_1E953E8A8) ^ 0x7D)) ^ byte_1A12A8590[byte_1A12A9000[(9 * ((dword_1E953E880 + dword_1E953E8A8) ^ 0x7D))] ^ 0xB1])
          - 189))[-4];
  uint64_t v9 = (*(uint64_t (**)(uint64_t))&v8[8
                                             * (byte_1A12A8EC4[(byte_1A12A8AA0[v7] ^ 0x81)
                                                                              - 4] ^ v7)
                                             + 16984])(a2);
  unsigned __int8 v10 = 9 * ((*(_DWORD *)(v4 - 4) - *(_DWORD *)(v2 - 4)) ^ 0x7D);
  unsigned int v11 = *(uint64_t (**)(uint64_t))&v8[8
                                             * (byte_1A12A8594[(byte_1A12A900C[v10 - 12] ^ 0x1A)
                                                                              - 4] ^ v10)
                                             + 16440];

  return v11(v9);
}

void fm23w5mn5o()
{
  uint64_t v0 = (uint64_t)*(&off_1E5A4B410
                + ((9 * ((dword_1E953E880 - qword_1E953E8B0) ^ 0x7D)) ^ byte_1A12A8590[byte_1A12A9000[(9 * ((dword_1E953E880 - qword_1E953E8B0) ^ 0x7D))] ^ 0x92])
                - 204);
  unint64_t v1 = (unint64_t)&v4 ^ qword_1E953E8B0 ^ *(void *)(v0 - 4);
  unint64_t v2 = (1787074057 * v1) ^ 0xEDEBC87B5EDF1A7DLL;
  unint64_t v3 = 1787074057 * (v1 ^ 0xEDEBC87B5EDF1A7DLL);
  qword_1E953E8B0 = v2;
  *(void *)(v0 - 4) = v3;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A1293978()
{
  (*(void (**)(void))(v1 + 17912))();
  *(void *)(v0 + _Block_object_dispose(&a9, 8) = 0;
  return (*(uint64_t (**)(void))(v1 + 8 * ((127 * (*(void *)(v0 + 24) == 0)) ^ 0x827)))();
}

uint64_t sub_1A12939D4()
{
  *(_DWORD *)(v0 + 36) = 0;
  *(void *)uint64_t v0 = 0;
  return (*(uint64_t (**)(void))(v1
                              + 8 * ((980 * ((v2 ^ 0xD7 ^ (*(void *)(v0 + 48) == 0)) & 1)) ^ v2)))();
}

uint64_t sub_1A1293A10@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((*(void *)(v1 + 64) == 0) * ((a1 + 3) ^ (a1 - 1169327030) ^ 0xBA4D845A)) ^ a1)))();
}

uint64_t sub_1A1293A50()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((127 * (*(void *)(v0 + 24) == 0)) ^ 0x827)))();
}

uint64_t sub_1A1293A9C@<X0>(int a1@<W8>)
{
  unsigned int v3 = a1 + 1057;
  (*(void (**)(void))(v2 + 8 * (a1 ^ 0x902u)))();
  *(void *)(v1 + 24) = 0;
  *(_DWORD *)(v1 + 36) = 0;
  *(void *)uint64_t v1 = 0;
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((980 * ((v3 ^ 0xD7 ^ (*(void *)(v1 + 48) == 0)) & 1)) ^ v3)))();
}

uint64_t sub_1A1293AF4()
{
  (*(void (**)(void))(v1 + 8 * (v2 + 737)))();
  *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = 0;
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((*(void *)(v0 + 64) == 0) * ((v2 - 466) ^ (v2 - 1169327499) ^ 0xBA4D845A)) ^ (v2 - 469))))();
}

uint64_t sub_1A1293B4C()
{
  (*(void (**)(void))(v2 + 8 * (v0 + 1203)))();
  *(void *)(v1 + 64) = 0;
  *(_DWORD *)(v1 + 76) = 0;
  *(void *)(v1 + 40) = 0;
  return 0;
}

void getFLGroupIdentifierAccount_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFLGroupIdentifierAccount(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 34, @"%s", dlerror());

  __break(1u);
}

void getFLNotificationOptionForce_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFLNotificationOptionForce(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 35, @"%s", dlerror());

  __break(1u);
}

void getFLNotificationOptionSpringboardAlert_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFLNotificationOptionSpringboardAlert(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 38, @"%s", dlerror());

  __break(1u);
}

void getFLNotificationOptionLockscreen_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFLNotificationOptionLockscreen(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 36, @"%s", dlerror());

  __break(1u);
}

void getFLNotificationOptionBannerAlert_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFLNotificationOptionBannerAlert(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 37, @"%s", dlerror());

  __break(1u);
}

void __getFLFollowUpControllerClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFLFollowUpControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 30, @"Unable to find class %s", "FLFollowUpController");

  __break(1u);
}

void CoreFollowUpLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreFollowUpLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAFollowUpController.m", 28, @"%s", *a1);

  __break(1u);
}

void __getFLFollowUpActionClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFLFollowUpActionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 29, @"Unable to find class %s", "FLFollowUpAction");

  __break(1u);
}

void __getFLFollowUpItemClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFLFollowUpItemClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 31, @"Unable to find class %s", "FLFollowUpItem");

  __break(1u);
}

void __getFLFollowUpNotificationClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFLFollowUpNotificationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAFollowUpController.m", 32, @"Unable to find class %s", "FLFollowUpNotification");

  __break(1u);
}

void __getkCDPRTCEventCategoryAccountDataAccessRecoverySymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreCDPLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAFAnalyticsEvent+AppleAccount.m", 16, @"%s", *a1);

  __break(1u);
}

void getMSCriterionQualifierContains_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMSCriterionQualifierContains(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAutoAccountVerifier.m", 28, @"%s", dlerror());

  __break(1u);
}

void getMSResultsKeyDateSent_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMSResultsKeyDateSent(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAutoAccountVerifier.m", 36, @"%s", dlerror());

  __break(1u);
}

void __getMSCriterionClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMSCriterionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAutoAccountVerifier.m", 23, @"Unable to find class %s", "MSCriterion");

  __break(1u);
}

void MailServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *MailServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAAutoAccountVerifier.m", 20, @"%s", *a1);

  __break(1u);
}

void __getMSSearchClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMSSearchClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAutoAccountVerifier.m", 21, @"Unable to find class %s", "MSSearch");

  __break(1u);
}

void __getCDPTermsInfoBackupControllerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreCDPLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAAcceptedTermsController.m", 22, @"%s", *a1);

  __break(1u);
}

void __getCDPTermsInfoBackupControllerClass_block_invoke_cold_2()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCDPTermsInfoBackupControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAAcceptedTermsController.m", 23, @"Unable to find class %s", "CDPTermsInfoBackupController");

  __break(1u);
}

void __getBYLicenseAgreementClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBYLicenseAgreementClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLinks.h", 19, @"Unable to find class %s", "BYLicenseAgreement");

  __break(1u);
}

void SetupAssistantLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AASetupAssistantSoftLinks.h", 18, @"%s", *a1);

  __break(1u);
}

void __getBYWarrantyClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBYWarrantyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLinks.h", 27, @"Unable to find class %s", "BYWarranty");

  __break(1u);
}

void __getCIContextClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCIContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAInheritanceContactController.m", 19, @"Unable to find class %s", "CIContext");

  __break(1u);
}

void CoreImageLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreImageLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAInheritanceContactController.m", 18, @"%s", *a1);

  __break(1u);
}

void __getCIFilterClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCIFilterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAInheritanceContactController.m", 20, @"Unable to find class %s", "CIFilter");

  __break(1u);
}

void __getACDPluginLoaderClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *AccountsDaemonLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AALoginPluginManager.m", 24, @"%s", *a1);

  __break(1u);
}

void __getACDPluginLoaderClass_block_invoke_cold_2()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getACDPluginLoaderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AALoginPluginManager.m", 25, @"Unable to find class %s", "ACDPluginLoader");

  __break(1u);
}

void SetupAssistantLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AASetupAssistantSoftLink.m", 12, @"%s", *a1);

  __break(1u);
}

void SBYSetupAssistantIsRunningSilentTokenUpgrade_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL SBYSetupAssistantIsRunningSilentTokenUpgrade(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 13, @"%s", dlerror());

  __break(1u);
}

void SBYSetupAssistantHasCompletedInitialRun_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL SBYSetupAssistantHasCompletedInitialRun(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 14, @"%s", dlerror());

  __break(1u);
}

void __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBYFlowSkipControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 17, @"Unable to find class %s", "BYFlowSkipController");

  __break(1u);
}

void getBYFlowSkipIdentifierAppleID_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (BYFlowSkipIdentifierAppleID) (*)(void))0)()) getBYFlowSkipIdentifierAppleID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASetupAssistantSoftLink.m", 18, @"%s", dlerror());

  __break(1u);
}

void CoreCDPLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreCDPLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAAnalyticsRTCReporter.m", 14, @"%s", *a1);

  __break(1u);
}

void IDSLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *IDSLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAIDSSoftLinks.m", 11, @"%s", *a1);

  __break(1u);
}

void __getIDSServiceClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getIDSServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 12, @"Unable to find class %s", "IDSService");

  __break(1u);
}

void __getIDSIDQueryControllerClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getIDSIDQueryControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 13, @"Unable to find class %s", "IDSIDQueryController");

  __break(1u);
}

void __getIDSServiceDelegatePropertiesClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getIDSServiceDelegatePropertiesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 14, @"Unable to find class %s", "IDSServiceDelegateProperties");

  __break(1u);
}

void getIDSSendMessageOptionExpectsPeerResponseKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (IDSSendMessageOptionExpectsPeerResponseKey) (*)(void))0)()) getIDSSendMessageOptionExpectsPeerResponseKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 15, @"%s", dlerror());

  __break(1u);
}

void getIDSSendMessageOptionFireAndForgetKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (IDSSendMessageOptionFireAndForgetKey) (*)(void))0)()) getIDSSendMessageOptionFireAndForgetKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 16, @"%s", dlerror());

  __break(1u);
}

void getIDSSendMessageOptionRequireAllRegistrationPropertiesKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (IDSSendMessageOptionRequireAllRegistrationPropertiesKey) (*)(void))0)()) getIDSSendMessageOptionRequireAllRegistrationPropertiesKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 17, @"%s", dlerror());

  __break(1u);
}

void getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey) (*)(void))0)()) getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 18, @"%s", dlerror());

  __break(1u);
}

void getIDSSendMessageOptionPeerResponseIdentifierKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (IDSSendMessageOptionPeerResponseIdentifierKey) (*)(void))0)()) getIDSSendMessageOptionPeerResponseIdentifierKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 19, @"%s", dlerror());

  __break(1u);
}

void getIDSServiceNameiMessage_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (IDSServiceNameiMessage) (*)(void))0)()) getIDSServiceNameiMessage(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 20, @"%s", dlerror());

  __break(1u);
}

void _SIDSCopyIDForEmailAddress_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *_SIDSCopyIDForEmailAddress(NSString *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 22, @"%s", dlerror());

  __break(1u);
}

void _SIDSCopyIDForPhoneNumberWithOptions_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *_SIDSCopyIDForPhoneNumberWithOptions(NSString *__strong, NSString *__strong, BOOL)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAIDSSoftLinks.m", 23, @"%s", dlerror());

  __break(1u);
}

void ContactsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *ContactsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AAContactsSoftLinks.m", 12, @"%s", *a1);

  __break(1u);
}

void __getCNContactClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNContactClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 13, @"Unable to find class %s", "CNContact");

  __break(1u);
}

void __getCNPhoneNumberClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNPhoneNumberClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 14, @"Unable to find class %s", "CNPhoneNumber");

  __break(1u);
}

void __getCNContactStoreClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNContactStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 15, @"Unable to find class %s", "CNContactStore");

  __break(1u);
}

void getCNContactIdentifierKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactIdentifierKey) (*)(void))0)()) getCNContactIdentifierKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 16, @"%s", dlerror());

  __break(1u);
}

void getCNContactGivenNameKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactGivenNameKey) (*)(void))0)()) getCNContactGivenNameKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 17, @"%s", dlerror());

  __break(1u);
}

void getCNContactFamilyNameKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactFamilyNameKey) (*)(void))0)()) getCNContactFamilyNameKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 18, @"%s", dlerror());

  __break(1u);
}

void getCNContactThumbnailImageDataKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactThumbnailImageDataKey) (*)(void))0)()) getCNContactThumbnailImageDataKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 19, @"%s", dlerror());

  __break(1u);
}

void getCNContactPhoneNumbersKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactPhoneNumbersKey) (*)(void))0)()) getCNContactPhoneNumbersKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 20, @"%s", dlerror());

  __break(1u);
}

void getCNContactEmailAddressesKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactEmailAddressesKey) (*)(void))0)()) getCNContactEmailAddressesKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 21, @"%s", dlerror());

  __break(1u);
}

void getCNContactNamePrefixKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactNamePrefixKey) (*)(void))0)()) getCNContactNamePrefixKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 22, @"%s", dlerror());

  __break(1u);
}

void getCNContactMiddleNameKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactMiddleNameKey) (*)(void))0)()) getCNContactMiddleNameKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 23, @"%s", dlerror());

  __break(1u);
}

void getCNContactNicknameKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactNicknameKey) (*)(void))0)()) getCNContactNicknameKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 24, @"%s", dlerror());

  __break(1u);
}

void getCNContactTypeKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactTypeKey) (*)(void))0)()) getCNContactTypeKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 25, @"%s", dlerror());

  __break(1u);
}

void getCNContactImageDataKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactImageDataKey) (*)(void))0)()) getCNContactImageDataKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 26, @"%s", dlerror());

  __break(1u);
}

void getCNContactCropRectKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactCropRectKey) (*)(void))0)()) getCNContactCropRectKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 27, @"%s", dlerror());

  __break(1u);
}

void getCNContactMemojiMetadataKey_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (CNContactMemojiMetadataKey) (*)(void))0)()) getCNContactMemojiMetadataKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AAContactsSoftLinks.m", 28, @"%s", dlerror());

  __break(1u);
}

void __getCDPCustodianRecoveryInfoClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCDPCustodianRecoveryInfoClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASignInFlowController.m", 28, @"Unable to find class %s", "CDPCustodianRecoveryInfo");

  __break(1u);
}

void CoreCDPLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreCDPLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AASignInFlowController.m", 25, @"%s", *a1);

  __break(1u);
}

void __getCDPStateControllerClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCDPStateControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASignInFlowController.m", 27, @"Unable to find class %s", "CDPStateController");

  __break(1u);
}

void __getCDPContextClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCDPContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AASignInFlowController.m", 26, @"Unable to find class %s", "CDPContext");

  __break(1u);
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1F414B088]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

uint64_t CFURLRequestSetHTTPCookieStorage()
{
  return MEMORY[0x1F40D5480]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x1F4122C10]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1F412FA18]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F71F0](trust, result);
}

uint64_t SecTrustSetPinningPolicyName()
{
  return MEMORY[0x1F40F7288]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x1F40D31B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFURLCacheCopyCacheDirectory()
{
  return MEMORY[0x1F40D5728]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
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

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
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

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_exception_throw(id exception)
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}