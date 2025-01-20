void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

double _interiorPointForCorner(uint64_t a1, double result, double a3, double a4)
{
  switch(a1)
  {
    case 1:
      double v4 = a3 + a4;
      goto LABEL_6;
    case 2:
      result = a4 - result;
      break;
    case 4:
      result = result + a4;
      break;
    case 8:
      double v4 = a4 - a3;
LABEL_6:
      result = v4;
      break;
    default:
      return result;
  }
  return result;
}

void sub_1C38C435C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C38C45D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1C38C49C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C38C5404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C38C57BC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t LocalAuthenticationEmbeddedUILibraryCore()
{
  if (!LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary) {
    LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary;
}

uint64_t __LocalAuthenticationEmbeddedUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLARatchetViewControllerClass_block_invoke(uint64_t a1)
{
  LocalAuthenticationEmbeddedUILibraryCore();
  Class result = objc_getClass("LARatchetViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLARatchetViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1C38C6C44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C38C70DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C38C7304(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C38C74E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t CoreFollowUpLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CoreFollowUpLibraryCore_frameworkLibrary;
  uint64_t v5 = CoreFollowUpLibraryCore_frameworkLibrary;
  if (!CoreFollowUpLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F0F8;
    long long v7 = *(_OWORD *)&off_1E648F108;
    v3[3] = _sl_dlopen();
    CoreFollowUpLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38CB328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CoreFollowUpLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreFollowUpLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreFollowUpLibrary()
{
  uint64_t v0 = CoreFollowUpLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getFLFollowUpActionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFLFollowUpActionClass_softClass;
  uint64_t v7 = getFLFollowUpActionClass_softClass;
  if (!getFLFollowUpActionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpActionClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getFLFollowUpActionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38CB4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpActionClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getFLFollowUpActionClass_block_invoke_cold_1();
    return (Class)getFLFollowUpControllerClass(v3);
  }
  return result;
}

id getFLFollowUpControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFLFollowUpControllerClass_softClass;
  uint64_t v7 = getFLFollowUpControllerClass_softClass;
  if (!getFLFollowUpControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpControllerClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getFLFollowUpControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38CB634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpControllerClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getFLFollowUpControllerClass_block_invoke_cold_1();
    return (Class)getFLFollowUpItemClass(v3);
  }
  return result;
}

id getFLFollowUpItemClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFLFollowUpItemClass_softClass;
  uint64_t v7 = getFLFollowUpItemClass_softClass;
  if (!getFLFollowUpItemClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpItemClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getFLFollowUpItemClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38CB770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpItemClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getFLFollowUpItemClass_block_invoke_cold_1();
    return (Class)getFLFollowUpNotificationClass();
  }
  return result;
}

id getFLFollowUpNotificationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFLFollowUpNotificationClass_softClass;
  uint64_t v7 = getFLFollowUpNotificationClass_softClass;
  if (!getFLFollowUpNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLFollowUpNotificationClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getFLFollowUpNotificationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38CB8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpNotificationClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpNotificationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getFLFollowUpNotificationClass_block_invoke_cold_1();
    return (Class)getFLHSA2LoginNotificationClass(v3);
  }
  return result;
}

id getFLHSA2LoginNotificationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFLHSA2LoginNotificationClass_softClass;
  uint64_t v7 = getFLHSA2LoginNotificationClass_softClass;
  if (!getFLHSA2LoginNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLHSA2LoginNotificationClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getFLHSA2LoginNotificationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38CB9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLHSA2LoginNotificationClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLHSA2LoginNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLHSA2LoginNotificationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getFLHSA2LoginNotificationClass_block_invoke_cold_1();
    return (Class)getFLHSA2PasswordResetNotificationClass(v3);
  }
  return result;
}

id getFLHSA2PasswordResetNotificationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getFLHSA2PasswordResetNotificationClass_softClass;
  uint64_t v7 = getFLHSA2PasswordResetNotificationClass_softClass;
  if (!getFLHSA2PasswordResetNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFLHSA2PasswordResetNotificationClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getFLHSA2PasswordResetNotificationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38CBB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLHSA2PasswordResetNotificationClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLHSA2PasswordResetNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLHSA2PasswordResetNotificationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getFLHSA2PasswordResetNotificationClass_block_invoke_cold_1();
    return (Class)getFLGroupIdentifierAccountSymbolLoc(v3);
  }
  return result;
}

uint64_t getFLGroupIdentifierAccountSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLGroupIdentifierAccountSymbolLoc_ptr;
  uint64_t v6 = getFLGroupIdentifierAccountSymbolLoc_ptr;
  if (!getFLGroupIdentifierAccountSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLGroupIdentifierAccount");
    getFLGroupIdentifierAccountSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CBC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLGroupIdentifierAccountSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLGroupIdentifierAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLGroupIdentifierAccountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getFLGroupIdentifierAccount()
{
  FLGroupIdentifierAccountSymbolLoc = (void **)getFLGroupIdentifierAccountSymbolLoc();
  if (FLGroupIdentifierAccountSymbolLoc)
  {
    id v1 = *FLGroupIdentifierAccountSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
    return (id)getFLNotificationOptionForceSymbolLoc(FLGroupIdentifierAccount_cold_1);
  }
}

uint64_t getFLNotificationOptionForceSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLNotificationOptionForceSymbolLoc_ptr;
  uint64_t v6 = getFLNotificationOptionForceSymbolLoc_ptr;
  if (!getFLNotificationOptionForceSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionForce");
    getFLNotificationOptionForceSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CBDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLNotificationOptionForceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionForce");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionForceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getFLNotificationOptionForce()
{
  FLNotificationOptionForceSymbolLoc = (void **)getFLNotificationOptionForceSymbolLoc();
  if (FLNotificationOptionForceSymbolLoc)
  {
    id v1 = *FLNotificationOptionForceSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
    return (id)getFLNotificationOptionSpringboardAlertSymbolLoc(FLGroupIdentifierAccount_cold_1);
  }
}

uint64_t getFLNotificationOptionSpringboardAlertSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLNotificationOptionSpringboardAlertSymbolLoc_ptr;
  uint64_t v6 = getFLNotificationOptionSpringboardAlertSymbolLoc_ptr;
  if (!getFLNotificationOptionSpringboardAlertSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionSpringboardAlert");
    getFLNotificationOptionSpringboardAlertSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CBF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLNotificationOptionSpringboardAlertSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionSpringboardAlert");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionSpringboardAlertSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getFLNotificationOptionSpringboardAlert()
{
  FLNotificationOptionSpringboardAlertSymbolLoc = (void **)getFLNotificationOptionSpringboardAlertSymbolLoc();
  if (FLNotificationOptionSpringboardAlertSymbolLoc)
  {
    id v1 = *FLNotificationOptionSpringboardAlertSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
    return (id)getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc(FLGroupIdentifierAccount_cold_1);
  }
}

uint64_t getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr;
  uint64_t v6 = getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr;
  if (!getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionSpringboardAlertActionOnly");
    getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CC0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionSpringboardAlertActionOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

id getFLNotificationOptionSpringboardAlertActionOnly()
{
  FLNotificationOptionSpringboardAlertActionOnlySymbolLoc = (void **)getFLNotificationOptionSpringboardAlertActionOnlySymbolLoc();
  if (FLNotificationOptionSpringboardAlertActionOnlySymbolLoc)
  {
    id v1 = *FLNotificationOptionSpringboardAlertActionOnlySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
    return (id)getFLHSA2ActionChangePasswordSymbolLoc(FLGroupIdentifierAccount_cold_1);
  }
}

uint64_t getFLHSA2ActionChangePasswordSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLHSA2ActionChangePasswordSymbolLoc_ptr;
  uint64_t v6 = getFLHSA2ActionChangePasswordSymbolLoc_ptr;
  if (!getFLHSA2ActionChangePasswordSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLHSA2ActionChangePassword");
    getFLHSA2ActionChangePasswordSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CC23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLHSA2ActionChangePasswordSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLHSA2ActionChangePassword");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLHSA2ActionChangePasswordSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getFLHSA2ActionChangePassword()
{
  uint64_t v0 = (void **)getFLHSA2ActionChangePasswordSymbolLoc();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
    return (id)getFLNotificationOptionExtensionForNotificationSymbolLoc(FLGroupIdentifierAccount_cold_1);
  }
}

uint64_t getFLNotificationOptionExtensionForNotificationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr;
  uint64_t v6 = getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr;
  if (!getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionExtensionForNotification");
    getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CC3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLNotificationOptionExtensionForNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionExtensionForNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionExtensionForNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

id getFLNotificationOptionExtensionForNotification()
{
  FLNotificationOptionExtensionForNotificationSymbolLoc = (void **)getFLNotificationOptionExtensionForNotificationSymbolLoc();
  if (FLNotificationOptionExtensionForNotificationSymbolLoc)
  {
    id v1 = *FLNotificationOptionExtensionForNotificationSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
    return (id)getFLNotificationOptionExtensionActionsSymbolLoc(FLGroupIdentifierAccount_cold_1);
  }
}

uint64_t getFLNotificationOptionExtensionActionsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLNotificationOptionExtensionActionsSymbolLoc_ptr;
  uint64_t v6 = getFLNotificationOptionExtensionActionsSymbolLoc_ptr;
  if (!getFLNotificationOptionExtensionActionsSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionExtensionActions");
    getFLNotificationOptionExtensionActionsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CC524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLNotificationOptionExtensionActionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionExtensionActions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionExtensionActionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getFLNotificationOptionExtensionActions()
{
  FLNotificationOptionExtensionActionsSymbolLoc = (void **)getFLNotificationOptionExtensionActionsSymbolLoc();
  if (FLNotificationOptionExtensionActionsSymbolLoc)
  {
    id v1 = *FLNotificationOptionExtensionActionsSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = getFLGroupIdentifierAccount_cold_1();
    return (id)getFLNotificationOptionBannerAlertSymbolLoc(FLGroupIdentifierAccount_cold_1);
  }
}

uint64_t getFLNotificationOptionBannerAlertSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  uint64_t v6 = getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  if (!getFLNotificationOptionBannerAlertSymbolLoc_ptr)
  {
    id v1 = (void *)CoreFollowUpLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionBannerAlert");
    getFLNotificationOptionBannerAlertSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38CC698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLNotificationOptionBannerAlertSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  Class result = dlsym(v2, "FLNotificationOptionBannerAlert");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionBannerAlertSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getFLNotificationOptionBannerAlert()
{
  FLNotificationOptionBannerAlertSymbolLoc = (void **)getFLNotificationOptionBannerAlertSymbolLoc();
  if (FLNotificationOptionBannerAlertSymbolLoc)
  {
    id v1 = *FLNotificationOptionBannerAlertSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = (void *)getFLGroupIdentifierAccount_cold_1();
    return +[AKAuthorizationBiometricImage biometricImage];
  }
}

uint64_t ProximityAppleIDSetupUILibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ProximityAppleIDSetupUILibraryCore_frameworkLibrary;
  uint64_t v5 = ProximityAppleIDSetupUILibraryCore_frameworkLibrary;
  if (!ProximityAppleIDSetupUILibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F140;
    long long v7 = *(_OWORD *)&off_1E648F150;
    v3[3] = _sl_dlopen();
    ProximityAppleIDSetupUILibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38CCB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ProximityAppleIDSetupUILibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ProximityAppleIDSetupUILibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ProximityAppleIDSetupUILibrary()
{
  uint64_t v0 = ProximityAppleIDSetupUILibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPASUIDependentViewPresenterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPASUIDependentViewPresenterClass_softClass;
  uint64_t v7 = getPASUIDependentViewPresenterClass_softClass;
  if (!getPASUIDependentViewPresenterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPASUIDependentViewPresenterClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getPASUIDependentViewPresenterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38CCCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPASUIDependentViewPresenterClass_block_invoke(uint64_t a1)
{
  ProximityAppleIDSetupUILibrary();
  Class result = objc_getClass("PASUIDependentViewPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPASUIDependentViewPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPASUIDependentViewPresenterClass_block_invoke_cold_1();
    return (Class)+[NSLayoutConstraint(AuthKitUI) ak_constraintsForView:v5 equalToView:v6];
  }
  return result;
}

void sub_1C38CE2C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C38CEA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double AKSizeAlignedInRectWithScale(uint64_t a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  switch(a1)
  {
    case 0:
    case 3:
      double v18 = a5;
      break;
    case 1:
      AKFloatRoundToPixelWithScale(a5 + (a7 - a3) * 0.5, a9);
      double v18 = v17;
      break;
    case 2:
      v20.origin.x = a5;
      v20.origin.y = a6;
      v20.size.width = a7;
      v20.size.height = a8;
      double v18 = CGRectGetMaxX(v20) - a3;
      break;
    default:
      double v18 = 0.0;
      break;
  }
  switch(a2)
  {
    case 1:
      AKFloatRoundToPixelWithScale(a6 + (a8 - a4) * 0.5, a9);
      break;
    case 2:
      v21.origin.x = a5;
      v21.origin.y = a6;
      v21.size.width = a7;
      v21.size.height = a8;
      CGRectGetMaxY(v21);
      break;
    default:
      return v18;
  }
  return v18;
}

void AKFloatRoundToPixelWithScale(double a1, double a2)
{
  if (a2 == 0.0)
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 scale];
  }
}

double AKSizeScaleAspectFit(double result, double a2, double a3, double a4)
{
  double v4 = a3 / result;
  if (result == 0.0) {
    double v4 = 1.0;
  }
  double v5 = a4 / a2;
  if (a2 == 0.0) {
    double v5 = 1.0;
  }
  if (fmin(v4, v5) != 1.0)
  {
    if (v4 >= v5) {
      return a4 * (result / a2);
    }
    else {
      return a3;
    }
  }
  return result;
}

double AKRectRoundToPixelWithScale(double a1, double a2, double a3, double a4, double a5)
{
  AKFloatRoundToPixelWithScale(a1, a5);
  double v10 = v9;
  AKFloatRoundToPixelWithScale(a2, a5);
  AKFloatRoundToPixelWithScale(a3, a5);
  AKFloatRoundToPixelWithScale(a4, a5);
  return v10;
}

double AKPointRoundToPixelWithScale(double a1, double a2, double a3)
{
  AKFloatRoundToPixelWithScale(a1, a3);
  double v6 = v5;
  AKFloatRoundToPixelWithScale(a2, a3);
  return v6;
}

double AKSizeRoundToPixelWithScale(double a1, double a2, double a3)
{
  AKFloatRoundToPixelWithScale(a1, a3);
  double v6 = v5;
  AKFloatRoundToPixelWithScale(a2, a3);
  return v6;
}

uint64_t BridgePreferencesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = BridgePreferencesLibraryCore_frameworkLibrary;
  uint64_t v5 = BridgePreferencesLibraryCore_frameworkLibrary;
  if (!BridgePreferencesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F250;
    long long v7 = *(_OWORD *)&off_1E648F260;
    v3[3] = _sl_dlopen();
    BridgePreferencesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38D38F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __BridgePreferencesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  BridgePreferencesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BridgePreferencesLibrary()
{
  uint64_t v0 = BridgePreferencesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getBPSRemoteUISetupStyleClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBPSRemoteUISetupStyleClass_softClass;
  uint64_t v7 = getBPSRemoteUISetupStyleClass_softClass;
  if (!getBPSRemoteUISetupStyleClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBPSRemoteUISetupStyleClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getBPSRemoteUISetupStyleClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38D3AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBPSRemoteUISetupStyleClass_block_invoke(uint64_t a1)
{
  BridgePreferencesLibrary();
  Class result = objc_getClass("BPSRemoteUISetupStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBPSRemoteUISetupStyleClass_block_invoke_cold_1();
  }
  getBPSRemoteUISetupStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getBPSApplyStyleToNavBarSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getBPSApplyStyleToNavBarSymbolLoc_ptr;
  uint64_t v6 = getBPSApplyStyleToNavBarSymbolLoc_ptr;
  if (!getBPSApplyStyleToNavBarSymbolLoc_ptr)
  {
    id v1 = (void *)BridgePreferencesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "BPSApplyStyleToNavBar");
    getBPSApplyStyleToNavBarSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38D3C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBPSApplyStyleToNavBarSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BridgePreferencesLibrary();
  Class result = dlsym(v2, "BPSApplyStyleToNavBar");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBPSApplyStyleToNavBarSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void SBPSApplyStyleToNavBar(void *a1)
{
  id v5 = a1;
  BPSApplyStyleToNavBarSymbolLoc = (void (*)(id))getBPSApplyStyleToNavBarSymbolLoc();
  if (BPSApplyStyleToNavBarSymbolLoc)
  {
    BPSApplyStyleToNavBarSymbolLoc(v5);
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = (AKAppleIDAuthenticationWatchBuddyContext *)getFLGroupIdentifierAccount_cold_1();
    [(AKAppleIDAuthenticationWatchBuddyContext *)FLGroupIdentifierAccount_cold_1 presentBasicLoginUIWithCompletion:v4];
  }
}

uint64_t SafariFoundationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  SEL v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SafariFoundationLibraryCore_frameworkLibrary;
  uint64_t v5 = SafariFoundationLibraryCore_frameworkLibrary;
  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F3B8;
    long long v7 = *(_OWORD *)&off_1E648F3C8;
    v3[3] = _sl_dlopen();
    SafariFoundationLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38D97A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SafariFoundationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SafariFoundationLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SafariFoundationLibrary()
{
  uint64_t v0 = SafariFoundationLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getSFStrongPasswordGeneratorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSFStrongPasswordGeneratorClass_softClass;
  uint64_t v7 = getSFStrongPasswordGeneratorClass_softClass;
  if (!getSFStrongPasswordGeneratorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSFStrongPasswordGeneratorClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getSFStrongPasswordGeneratorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38D9978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKPasswordGeneratorHook *__getSFStrongPasswordGeneratorClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  uint64_t result = (AKPasswordGeneratorHook *)objc_getClass("SFStrongPasswordGenerator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFStrongPasswordGeneratorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    SEL v3 = (AKPasswordGeneratorHook *)__getSFStrongPasswordGeneratorClass_block_invoke_cold_1();
    return [(AKPasswordGeneratorHook *)v3 init];
  }
  return result;
}

uint64_t AVKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  SEL v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AVKitLibraryCore_frameworkLibrary;
  uint64_t v5 = AVKitLibraryCore_frameworkLibrary;
  if (!AVKitLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F420;
    long long v7 = *(_OWORD *)&off_1E648F430;
    v3[3] = _sl_dlopen();
    AVKitLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38DBF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AVKitLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AVKitLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AVKitLibrary()
{
  uint64_t v0 = AVKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAVPlayerViewControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAVPlayerViewControllerClass_softClass;
  uint64_t v7 = getAVPlayerViewControllerClass_softClass;
  if (!getAVPlayerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVPlayerViewControllerClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getAVPlayerViewControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38DC15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKBasicLoginOptionsViewController *__getAVPlayerViewControllerClass_block_invoke(uint64_t a1)
{
  AVKitLibrary();
  uint64_t result = (AKBasicLoginOptionsViewController *)objc_getClass("AVPlayerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVPlayerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAVPlayerViewControllerClass_block_invoke_cold_1();
    return [(AKBasicLoginOptionsViewController *)v3 initWithContext:v5];
  }
  return result;
}

void sub_1C38DC384(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C38DE74C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C38E2528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C38E25F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C38E6334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v11 - 152));
  _Unwind_Resume(a1);
}

void sub_1C38E8904(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    double v10 = [v9 description];
    NSLog(&cfstr_UnableToCopyAk.isa);

    objc_end_catch();
    JUMPOUT(0x1C38E88E4);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C38E963C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AuthenticationServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  SEL v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AuthenticationServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = AuthenticationServicesLibraryCore_frameworkLibrary;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F628;
    long long v7 = *(_OWORD *)&off_1E648F638;
    v3[3] = _sl_dlopen();
    AuthenticationServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38EA804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AuthenticationServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AuthenticationServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AuthenticationServicesLibrary()
{
  uint64_t v0 = AuthenticationServicesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getASWebAuthenticationSessionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getASWebAuthenticationSessionClass_softClass;
  uint64_t v7 = getASWebAuthenticationSessionClass_softClass;
  if (!getASWebAuthenticationSessionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getASWebAuthenticationSessionClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getASWebAuthenticationSessionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38EA9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASWebAuthenticationSessionClass_block_invoke(uint64_t a1)
{
  AuthenticationServicesLibrary();
  Class result = objc_getClass("ASWebAuthenticationSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASWebAuthenticationSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getASWebAuthenticationSessionClass_block_invoke_cold_1();
    return (Class)getASWebAuthenticationSessionErrorDomainSymbolLoc();
  }
  return result;
}

uint64_t getASWebAuthenticationSessionErrorDomainSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr;
  uint64_t v6 = getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr;
  if (!getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr)
  {
    id v1 = (void *)AuthenticationServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ASWebAuthenticationSessionErrorDomain");
    getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C38EAB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getASWebAuthenticationSessionErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AuthenticationServicesLibrary();
  Class result = dlsym(v2, "ASWebAuthenticationSessionErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASWebAuthenticationSessionErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getASWebAuthenticationSessionErrorDomain()
{
  ASWebAuthenticationSessionErrorDomainSymbolLoc = (void **)getASWebAuthenticationSessionErrorDomainSymbolLoc();
  if (ASWebAuthenticationSessionErrorDomainSymbolLoc)
  {
    id v1 = *ASWebAuthenticationSessionErrorDomainSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t FLGroupIdentifierAccount_cold_1 = (void *)getFLGroupIdentifierAccount_cold_1();
    return +[AKIDPUtility convertError:v5];
  }
}

void sub_1C38F5030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C38F5D1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1C38FA518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C38FD4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t VisualPairingLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = VisualPairingLibraryCore_frameworkLibrary;
  uint64_t v5 = VisualPairingLibraryCore_frameworkLibrary;
  if (!VisualPairingLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F9C0;
    long long v7 = *(_OWORD *)&off_1E648F9D0;
    v3[3] = _sl_dlopen();
    VisualPairingLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38FF87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __VisualPairingLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  VisualPairingLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t VisualPairingLibrary()
{
  uint64_t v0 = VisualPairingLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getVPPresenterViewClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVPPresenterViewClass_softClass;
  uint64_t v7 = getVPPresenterViewClass_softClass;
  if (!getVPPresenterViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVPPresenterViewClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getVPPresenterViewClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38FFA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVPPresenterViewClass_block_invoke(uint64_t a1)
{
  VisualPairingLibrary();
  Class result = objc_getClass("VPPresenterView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVPPresenterViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVPPresenterViewClass_block_invoke_cold_1();
    return (Class)+[UIColor(AuthKit) ak_colorWithServerRGBRepresentation:v5];
  }
  return result;
}

uint64_t AppleAccountUILibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AppleAccountUILibraryCore_frameworkLibrary;
  uint64_t v5 = AppleAccountUILibraryCore_frameworkLibrary;
  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E648F9E0;
    long long v7 = *(_OWORD *)&off_1E648F9F0;
    v3[3] = _sl_dlopen();
    AppleAccountUILibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1C38FFD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AppleAccountUILibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AppleAccountUILibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppleAccountUILibrary()
{
  uint64_t v0 = AppleAccountUILibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAAUICDPStingrayRemoteUIControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAAUICDPStingrayRemoteUIControllerClass_softClass;
  uint64_t v7 = getAAUICDPStingrayRemoteUIControllerClass_softClass;
  if (!getAAUICDPStingrayRemoteUIControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAAUICDPStingrayRemoteUIControllerClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __getAAUICDPStingrayRemoteUIControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C38FFF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKInAppAuthenticationRemoteUIProvider *__getAAUICDPStingrayRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  AppleAccountUILibrary();
  uint64_t result = (AKInAppAuthenticationRemoteUIProvider *)objc_getClass("AAUICDPStingrayRemoteUIController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAAUICDPStingrayRemoteUIControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAAUICDPStingrayRemoteUIControllerClass_block_invoke_cold_1();
    return [(AKInAppAuthenticationRemoteUIProvider *)v3 initWithContext:v5];
  }
  return result;
}

void sub_1C390100C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1C3905398(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void sub_1C39053F4()
{
}

void sub_1C3905C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C390C1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C390C71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C390CCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C390D1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C390D740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1C390DD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1C390E0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C390F04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3912C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _AKUIMainBundle()
{
  if (_AKUIMainBundle_onceToken != -1) {
    dispatch_once(&_AKUIMainBundle_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)_AKUIMainBundle_mainBundle;

  return v0;
}

uint64_t _ColorSpaceStandardRGB()
{
  if (_InitializeRGBColorSpace_onceToken != -1) {
    dispatch_once(&_InitializeRGBColorSpace_onceToken, &__block_literal_global_7);
  }
  return StandardRGB;
}

CGImageRef AKCreateAppleIDButtonImage(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6)
{
  return AKCreateAppleIDButtonImageWithCornerRadius(a1, a2, a3, a4, a5, a6, 4.0);
}

CGImageRef AKCreateAppleIDButtonImageWithCornerRadius(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = _InitializeRGBColorSpace_onceToken;
  id v14 = a3;
  if (v13 != -1) {
    dispatch_once(&_InitializeRGBColorSpace_onceToken, &__block_literal_global_7);
  }
  uint64_t v15 = (CGColorSpace *)StandardRGB;
  double v16 = AKSizeRoundToPixelWithScale(a4 * a6, a5 * a6, 1.0);
  CGFloat v18 = v17;
  v19 = CGBitmapContextCreate(0, (unint64_t)v16, (unint64_t)v17, 8uLL, 0, v15, 1u);
  CGContextTranslateCTM(v19, 0.0, v18);
  CGContextScaleCTM(v19, 1.0, -1.0);
  AKDrawAppleIDButtonWithCornerRadius(v19, a1, a2, 0.0, 0.0, v16, v18, a6, a7);

  CGImageRef Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

void AKDrawAppleIDButtonWithCornerRadius(CGContext *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9 = a3;
  _DrawBorder(a1, a3, a4, a5, a6, a7, a8, a9);
  if (a2 == 1)
  {
    double v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
    CGFloat v18 = v17;
    v19 = @"SIGN_UP_WITH_APPLE";
  }
  else
  {
    double v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
    if (a2 == 2)
    {
      CGFloat v18 = v17;
      v19 = @"CONTINUE_WITH_APPLE";
    }
    else
    {
      CGFloat v18 = v17;
      v19 = @"SIGN_IN_WITH_APPLE";
    }
  }
  CGRect v20 = [v17 localizedStringForKey:v19 value:&stru_1F1EE8138 table:@"Localizable"];

  CGRect v21 = [NSString stringWithFormat:@"%@ %@", @"%@", v20];

  v22 = (void *)MEMORY[0x1E4F1CA20];
  v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  v24 = [v23 preferredLocalizations];
  v25 = [v24 firstObject];
  v26 = [v22 localeWithLocaleIdentifier:v25];

  id v80 = [v26 languageCode];
  uint64_t v27 = [v21 rangeOfString:@"%@"];
  uint64_t v28 = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v80];
  if (v28 == 2) {
    uint64_t v29 = [v21 length] - 2;
  }
  else {
    uint64_t v29 = 0;
  }
  v30 = [v21 componentsSeparatedByString:@"%@"];
  if ([v30 count] == 2)
  {
    BOOL v31 = v28 == 2;
    BOOL v32 = v28 != 2;
    uint64_t v33 = v31;
    v34 = [v30 objectAtIndex:v33];
    v35 = [v30 objectAtIndex:v32];
  }
  else
  {
    uint64_t v36 = [v30 firstObject];
    if (v27 == v29) {
      v35 = (__CFString *)v36;
    }
    else {
      v35 = &stru_1F1EE8138;
    }
    if (v27 == v29) {
      v34 = &stru_1F1EE8138;
    }
    else {
      v34 = (__CFString *)v36;
    }
  }
  v37 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  if ([(__CFString *)v35 length])
  {
    v38 = [(__CFString *)v35 stringByTrimmingCharactersInSet:v37];

    v35 = [NSString stringWithFormat:@"\u200E %@", v38];
  }
  CGFloat v78 = a4;
  CGFloat v79 = a5;
  if ([(__CFString *)v34 length])
  {
    v39 = [(__CFString *)v34 stringByTrimmingCharactersInSet:v37];

    v34 = [NSString stringWithFormat:@"%@\u200E ", v39];
  }
  double v40 = a6 + a6 * -0.16;
  double v41 = AKSizeScaleAspectFit(477.0, 658.0, v40, a7 * 0.34);
  double v43 = AKSizeRoundToPixelWithScale(v41, v42, 1.0);
  double v45 = v44;
  v46 = [(__CFString *)v34 stringByAppendingString:v35];
  if ([(__CFString *)v46 length]
    && (double v47 = AKRectRoundToPixelWithScale(0.0, 0.0, v40 - v43, v45 * 1.38, 1.0),
        double v51 = _MaximumFontSizeForStringInRect(v46, v47, v48, v49, v50, a8),
        v51 != 0.0))
  {
    double v57 = v51;
    double width = *MEMORY[0x1E4F1DB30];
    double v58 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v77 = v9;
    double v74 = *MEMORY[0x1E4F1DB30];
    if ([(__CFString *)v35 length])
    {
      CFAttributedStringRef AttributedStringWithFontSize = _CreateAttributedStringWithFontSize(v35, v9, v57);
      v76 = CTLineCreateWithAttributedString(AttributedStringWithFontSize);
      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v76, 0);
      double width = BoundsWithOptions.size.width;
      double height = BoundsWithOptions.size.height;
      CFRelease(AttributedStringWithFontSize);
    }
    else
    {
      v76 = 0;
      double height = v58;
    }
    if ([(__CFString *)v34 length])
    {
      CFAttributedStringRef v61 = _CreateAttributedStringWithFontSize(v34, v77, v57);
      v62 = CTLineCreateWithAttributedString(v61);
      CGRect v83 = CTLineGetBoundsWithOptions(v62, 0);
      double v63 = v83.size.width;
      double v58 = v83.size.height;
      CFRelease(v61);
    }
    else
    {
      v62 = 0;
      double v63 = v74;
    }
    double v64 = height;
    if (height < v58) {
      double v64 = v58;
    }
    if (v45 * 1.38 > v64)
    {
      double v65 = AKSizeScaleAspectFit(v43, v45, v43, v64 / 1.38);
      double v43 = AKSizeRoundToPixelWithScale(v65, v66, 1.0);
      double v45 = v67;
    }
    double v68 = AKSizeAlignedInRectWithScale(1, 1, width + v63 + v43, v45, v78, v79, a6, a7, 1.0);
    double v70 = v69;
    AKFloatRoundToPixelWithScale(v45 * 0.085 * 0.5, 1.0);
    double v54 = v70 - v71;
    if (v62)
    {
      AKFloatRoundToPixelWithScale(v54 + v45 * 0.135, 1.0);
      CGContextSetTextPosition(a1, v68, v72);
      CTLineDraw(v62, a1);
      CFRelease(v62);
    }
    double v52 = v63 + v68;
    if (v76)
    {
      AKFloatRoundToPixelWithScale(v54 + v45 * 0.135, 1.0);
      CGContextSetTextPosition(a1, v43 + v52, v73);
      CTLineDraw(v76, a1);
      CFRelease(v76);
    }
    uint64_t v9 = v77;
  }
  else
  {
    double v52 = AKSizeAlignedInRectWithScale(1, 1, a7 * 0.34 / 1.37945493, a7 * 0.34, v78, a5, a6, a7, 1.0);
    double v54 = v53;
    double v43 = v55;
    double v45 = v56;
  }
  _DrawLogoPDFIntoContext(v9, a1, v52, v54, v43, v45);
}

void AKDrawAppleIDButton(CGContext *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8)
{
}

void _DrawBorder(CGContext *a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  AKFloatRoundToPixelWithScale(a7 * 0.5, 1.0);
  double v17 = v16;
  v27.origin.x = AKRectRoundToPixelWithScale(a3, a4, a5, a6, 1.0);
  CGRect v28 = CGRectInset(v27, v17 * 0.5, v17 * 0.5);
  CGFloat v18 = +[AKRoundedPath pathWithRoundedRect:cornerRadius:](AKRoundedPath, "pathWithRoundedRect:cornerRadius:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height, a7 * a8);
  v19 = (const CGPath *)[v18 CGPath];

  CGContextBeginPath(a1);
  CGContextAddPath(a1, v19);
  CGContextClosePath(a1);
  if (a2)
  {
    if (a2 == 2)
    {
      CGFloat v20 = 0.0;
      CGFloat v21 = 0.0;
      CGFloat v22 = 0.0;
    }
    else
    {
      if (a2 != 1) {
        goto LABEL_9;
      }
      CGFloat v20 = 1.0;
      CGFloat v21 = 1.0;
      CGFloat v22 = 1.0;
    }
    CGContextSetRGBFillColor(a1, v20, v21, v22, 1.0);
    CGFloat v23 = 0.0;
    CGFloat v24 = 0.0;
    CGFloat v25 = 0.0;
  }
  else
  {
    CGContextSetRGBFillColor(a1, 1.0, 1.0, 1.0, 1.0);
    CGFloat v23 = 1.0;
    CGFloat v24 = 1.0;
    CGFloat v25 = 1.0;
  }
  CGContextSetRGBStrokeColor(a1, v23, v24, v25, 1.0);
LABEL_9:
  CGContextSetLineWidth(a1, v17);

  CGContextDrawPath(a1, kCGPathFillStroke);
}

double _MaximumFontSizeForStringInRect(const __CFString *a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9 = a6 * 10.0;
  double v10 = a6 * 10.0;
  do
  {
    double v11 = v10;
    CFAttributedStringRef AttributedStringWithFontSize = _CreateAttributedStringWithFontSize(a1, 2, v10);
    uint64_t v13 = CTLineCreateWithAttributedString(AttributedStringWithFontSize);
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v13, 0);
    double width = BoundsWithOptions.size.width;
    double height = BoundsWithOptions.size.height;
    double v10 = v10 + 1.0;
    CFRelease(v13);
    CFRelease(AttributedStringWithFontSize);
  }
  while (width <= a4 && height <= a5);
  double v17 = 0.0;
  if (v11 != v9) {
    double v17 = v11;
  }
  return floor(v17);
}

void _DrawLogoPDFIntoContext(uint64_t a1, CGContextRef c, CGFloat a3, CGFloat a4, double a5, double a6)
{
  CGContextSaveGState(c);
  if (a1 == 2 || a1 == 100) {
    uint64_t v13 = @"AKAppleLogoWhite";
  }
  else {
    uint64_t v13 = @"AKAppleLogoBlack";
  }
  id v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  CFURLRef v15 = [v14 URLForResource:v13 withExtension:@"pdf"];
  double v16 = CGPDFDocumentCreateWithURL(v15);
  if (!v16
    || (double v17 = v16, !CGPDFDocumentGetNumberOfPages(v16))
    || (Page = CGPDFDocumentGetPage(v17, 1uLL), (v19 = CGPDFPageRetain(Page)) == 0))
  {
    _DrawLogoPDFIntoContext_cold_1();
  }
  CGFloat v20 = v19;
  CGRect BoxRect = CGPDFPageGetBoxRect(v19, kCGPDFCropBox);
  if (a5 / BoxRect.size.width >= a6 / BoxRect.size.height) {
    double v21 = a6 / BoxRect.size.height;
  }
  else {
    double v21 = a5 / BoxRect.size.width;
  }
  CGContextTranslateCTM(c, a3, a4);
  CGAffineTransformMakeScale(&v22, v21, v21);
  CGContextConcatCTM(c, &v22);
  CGContextDrawPDFPage(c, v20);
  CGPDFDocumentRelease(v17);
  CGPDFPageRelease(v20);
  CGContextRestoreGState(c);
}

CFAttributedStringRef _CreateAttributedStringWithFontSize(const __CFString *a1, uint64_t a2, double a3)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F24620];
  uint64_t v6 = *MEMORY[0x1E4F24660];
  v25[0] = *MEMORY[0x1E4F24640];
  uint64_t v7 = *MEMORY[0x1E4F246D8];
  v24[0] = v6;
  v24[1] = v7;
  uint64_t v8 = [NSNumber numberWithDouble:*MEMORY[0x1E4F246B8]];
  v25[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v27[0] = v9;
  v26[1] = *MEMORY[0x1E4F245F0];
  double v10 = [NSNumber numberWithDouble:a3];
  v27[1] = v10;
  CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  uint64_t v12 = CTFontDescriptorCreateWithAttributes(v11);
  CTFontRef v13 = CTFontCreateWithFontDescriptor(v12, 0.0, 0);
  if (_InitializeRGBColorSpace_onceToken != -1) {
    dispatch_once(&_InitializeRGBColorSpace_onceToken, &__block_literal_global_7);
  }
  if (a2 == 100 || a2 == 2) {
    id v14 = &xmmword_1C392E4D8;
  }
  else {
    id v14 = &xmmword_1C392E4F8;
  }
  long long v15 = v14[1];
  *(_OWORD *)components = *v14;
  long long v23 = v15;
  CGColorRef v16 = CGColorCreate((CGColorSpaceRef)StandardRGB, components);
  CGFloat v17 = *MEMORY[0x1E4F24740];
  components[0] = *(CGFloat *)MEMORY[0x1E4F243F0];
  components[1] = v17;
  v21[0] = v13;
  v21[1] = v16;
  CFDictionaryRef v18 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)components, v21, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFAttributedStringRef v19 = CFAttributedStringCreate(0, a1, v18);
  CFRelease(v12);
  CFRelease(v18);
  CFRelease(v13);
  CGColorRelease(v16);

  return v19;
}

void sub_1C391C128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C391C7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id get_ASAccountSharingGroupMemberDataManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_ASAccountSharingGroupMemberDataManagerClass_softClass;
  uint64_t v7 = get_ASAccountSharingGroupMemberDataManagerClass_softClass;
  if (!get_ASAccountSharingGroupMemberDataManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke;
    v3[3] = &unk_1E648EFF8;
    v3[4] = &v4;
    __get_ASAccountSharingGroupMemberDataManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1C3922010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3922444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 80));
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

void sub_1C3922750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 80));
  _Unwind_Resume(a1);
}

void sub_1C3922A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 80));
  _Unwind_Resume(a1);
}

void sub_1C3922D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 80));
  _Unwind_Resume(a1);
}

uint64_t __getFLFollowUpActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFLFollowUpControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getFLFollowUpControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFLFollowUpItemClass_block_invoke_cold_1(v0);
}

uint64_t __getFLFollowUpItemClass_block_invoke_cold_1()
{
  return __getFLFollowUpNotificationClass_block_invoke_cold_1();
}

uint64_t __getFLFollowUpNotificationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFLHSA2LoginNotificationClass_block_invoke_cold_1(v0);
}

uint64_t __getFLHSA2LoginNotificationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFLHSA2PasswordResetNotificationClass_block_invoke_cold_1(v0);
}

uint64_t __getFLHSA2PasswordResetNotificationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return getFLGroupIdentifierAccount_cold_1(v0);
}

uint64_t getFLGroupIdentifierAccount_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[AKAppleIDProximityAuthenticationContext presentBasicLoginUIWithCompletion:](v0);
}

void __getPASUIDependentViewPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  -[AKFidoHook _startFidoRegistrationWithAttributes:completion:](v0);
}

void __getBPSRemoteUISetupStyleClass_block_invoke_cold_1()
{
}

uint64_t __getSFStrongPasswordGeneratorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AKPasswordGeneratorHook processElement:attributes:objectModel:completion:](v0);
}

void __getAVPlayerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[AKBasicLoginOptionsViewController _setupPrivacyLinkControllerWithContext:](v0);
}

void __getASWebAuthenticationSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  +[AKBiometricRatchetUtility setRatchetIdentifier:](v0);
}

void __getVPPresenterViewClass_block_invoke_cold_1()
{
}

void __getAAUICDPStingrayRemoteUIControllerClass_block_invoke_cold_1()
{
}

void _DrawLogoPDFIntoContext_cold_1()
{
}

uint64_t AKErrorUnderlyingError()
{
  return MEMORY[0x1F410BCC0]();
}

uint64_t AKLocStringFromServiceType()
{
  return MEMORY[0x1F410BCC8]();
}

uint64_t AKSharedDevicePasscodePromptAlertMessageWithServiceType()
{
  return MEMORY[0x1F410BCD0]();
}

uint64_t AKSignInStringFromServiceType()
{
  return MEMORY[0x1F410BCD8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
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

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageRelease(CGImageRef image)
{
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC50](url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC88](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void CGPDFPageRelease(CGPDFPageRef page)
{
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return (CGPDFPageRef)MEMORY[0x1F40DADE8](page);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4102DC0]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4102DF8]();
}

uint64_t _AKLogFido()
{
  return MEMORY[0x1F410BCE0]();
}

uint64_t _AKLogSiwa()
{
  return MEMORY[0x1F410BCE8]();
}

uint64_t _AKLogSystem()
{
  return MEMORY[0x1F410BCF0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
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

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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
  return (id)MEMORY[0x1F4181A18](location, obj);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}