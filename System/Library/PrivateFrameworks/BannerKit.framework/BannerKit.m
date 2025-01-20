void sub_1BEC0623C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *_MachNameForDestination(unint64_t a1)
{
  if (a1 >= 2)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"NSString *_MachNameForDestination(BNBannerDestination)"];
    [v2 handleFailureInFunction:v3, @"BNBannerSource.m", 74, @"Invalid destination: %@", @"[INVALID]" file lineNumber description];
  }
  else if (a1 == 1)
  {
    v1 = @"com.apple.CarPlayApp.service";
    goto LABEL_6;
  }
  v1 = [MEMORY[0x1E4F623E8] defaultShellMachName];
LABEL_6:
  return v1;
}

void BNRegisterBannerKitLogging()
{
  if (BNRegisterBannerKitLogging_onceToken != -1) {
    dispatch_once(&BNRegisterBannerKitLogging_onceToken, &__block_literal_global_2);
  }
}

uint64_t __BNRegisterBannerKitLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)BNLogSubsystem, "Presentable");
  v1 = (void *)BNLogPresentable;
  BNLogPresentable = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)BNLogSubsystem, "Posting");
  v3 = (void *)BNLogPosting;
  BNLogPosting = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)BNLogSubsystem, "Considering");
  v5 = (void *)BNLogConsidering;
  BNLogConsidering = (uint64_t)v4;

  os_log_t v6 = os_log_create((const char *)BNLogSubsystem, "Pending");
  v7 = (void *)BNLogPending;
  BNLogPending = (uint64_t)v6;

  os_log_t v8 = os_log_create((const char *)BNLogSubsystem, "Presenting");
  v9 = (void *)BNLogPresenting;
  BNLogPresenting = (uint64_t)v8;

  os_log_t v10 = os_log_create((const char *)BNLogSubsystem, "Suspending");
  v11 = (void *)BNLogSuspending;
  BNLogSuspending = (uint64_t)v10;

  os_log_t v12 = os_log_create((const char *)BNLogSubsystem, "Hosting-service");
  v13 = (void *)BNLogHostingService;
  BNLogHostingService = (uint64_t)v12;

  os_log_t v14 = os_log_create((const char *)BNLogSubsystem, "Hosting-host");
  v15 = (void *)BNLogHostingHost;
  BNLogHostingHost = (uint64_t)v14;

  os_log_t v16 = os_log_create((const char *)BNLogSubsystem, "Context-service");
  v17 = (void *)BNLogContextService;
  BNLogContextService = (uint64_t)v16;

  BNLogContextHost = (uint64_t)os_log_create((const char *)BNLogSubsystem, "Context-host");
  return MEMORY[0x1F41817F8]();
}

id BNBundleIdentifier()
{
  if (BNBundleIdentifier_onceToken != -1) {
    dispatch_once(&BNBundleIdentifier_onceToken, &__block_literal_global);
  }
  os_log_t v0 = (void *)BNBundleIdentifier___bundleID;
  return v0;
}

void __BNBundleIdentifier_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)BNBundleIdentifier___bundleID;
  BNBundleIdentifier___bundleID = v0;
}

id BNSceneIdentifierForRequest(void *a1, void *a2, void *a3)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_8:
    os_log_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *BNSceneIdentifierForRequest(NSString *__strong, NSString *__strong, NSUUID *__strong)");
    [v14 handleFailureInFunction:v15, @"BNUtilities.m", 37, @"Invalid parameter not satisfying: %@", @"requestID" file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  os_log_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
  v13 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *BNSceneIdentifierForRequest(NSString *__strong, NSString *__strong, NSUUID *__strong)");
  [v12 handleFailureInFunction:v13, @"BNUtilities.m", 36, @"Invalid parameter not satisfying: %@", @"requesterID" file lineNumber description];

  if (!v6) {
    goto LABEL_8;
  }
LABEL_3:
  if (v7) {
    goto LABEL_4;
  }
LABEL_9:
  os_log_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *BNSceneIdentifierForRequest(NSString *__strong, NSString *__strong, NSUUID *__strong)");
  [v16 handleFailureInFunction:v17, @"BNUtilities.m", 38, @"Invalid parameter not satisfying: %@", @"uniqueID" file lineNumber description];

LABEL_4:
  v18[0] = v5;
  v18[1] = v6;
  os_log_t v8 = [v7 UUIDString];
  v18[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  os_log_t v10 = [v9 componentsJoinedByString:@"."];

  return v10;
}

id BNUniqueIdentifierForSceneIdentifier(void *a1)
{
  v1 = (objc_class *)MEMORY[0x1E4F29128];
  id v2 = a1;
  id v3 = [v1 alloc];
  os_log_t v4 = [v2 componentsSeparatedByString:@"."];

  id v5 = [v4 lastObject];
  id v6 = (void *)[v3 initWithUUIDString:v5];

  return v6;
}

__CFString *BNStringFromUIInterfaceOrientation(unint64_t a1)
{
  if (a1 > 4) {
    return @"[invalid]";
  }
  else {
    return off_1E63B9410[a1];
  }
}

uint64_t BNInterfaceOrientationFromTransform(long long *a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  do
  {
    long long v4 = a1[1];
    long long v9 = *a1;
    long long v10 = v4;
    long long v11 = a1[2];
    UIIntegralTransform();
    CGFloat v5 = 3.14159265;
    if (v2 <= 2) {
      CGFloat v5 = dbl_1BEC34E68[v2];
    }
    CGAffineTransformMakeRotation(&v7, v5);
    UIIntegralTransform();
    if (CGAffineTransformEqualToTransform(&t1, &t2)) {
      uint64_t v3 = qword_1BEC34E48[v2];
    }
    ++v2;
  }
  while (v2 != 4);
  return v3;
}

__CFString *BNStringFromBNPresentableBehavior(uint64_t a1)
{
  v1 = @"[invalid]";
  if (a1 == 1) {
    v1 = @"Notice";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Default";
  }
}

__CFString *BNStringFromBNPresentableType(uint64_t a1)
{
  v1 = @"[invalid]";
  if (a1 == 1) {
    v1 = @"HUD";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Custom";
  }
}

__CFString *BNStringForAppearState(unsigned int a1)
{
  if (a1 > 3) {
    return @"[Invalid]";
  }
  else {
    return off_1E63B9438[a1];
  }
}

uint64_t BNIsPrototypeFeatureDevelopmentEnabled()
{
  if (!os_variant_has_internal_content()) {
    return 0;
  }
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.bannerkit"];
  uint64_t v1 = [v0 BOOLForKey:@"BNBannerKitPrototypeFeaturesEnabled"];
  if (v1)
  {
    uint64_t v2 = BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v4 = 0;
      _os_log_impl(&dword_1BEC04000, v2, OS_LOG_TYPE_DEFAULT, "Prototype features enabled", v4, 2u);
    }
  }

  return v1;
}

void sub_1BEC08C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
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

void sub_1BEC09674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC097C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC0A050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC0A8A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC0AA98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1BEC0AE2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC0B20C(_Unwind_Exception *exception_object)
{
}

void sub_1BEC0B2A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC0B4B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC0BBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1BEC0C01C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC0C0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC0C178(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1BEC0F064(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC0FAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

void sub_1BEC0FDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

void sub_1BEC10084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

void sub_1BEC1035C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

void sub_1BEC105DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC10708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_4_0()
{
  return objc_loadWeakRetained(v0);
}

id OUTLINED_FUNCTION_5(uint64_t a1, void *a2)
{
  return a2;
}

void sub_1BEC10EE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC1131C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_1BEC119AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC125C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC12848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC12AA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC12F04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC132C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC134B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1BEC137AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC138A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC13FB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1BEC147AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC14828(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC14AD8(_Unwind_Exception *exception_object)
{
}

void sub_1BEC14C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC14DA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC14EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BEC156D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC159E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC15C30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC16438(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BEC16824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC16BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC171E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1BEC1764C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC179C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC17A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC17ADC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC17B5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC17CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC17D40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC17F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1BEC180B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC182A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC18464(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC1AF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC1E29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1BEC1F5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
}

void sub_1BEC1FB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC208B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id a49)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a49);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1BEC21984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 144));
  _Unwind_Resume(a1);
}

uint64_t _RubberBandedTranslationInContainerView(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  CGRectGetHeight(v11);
  BSUIConstrainValueWithRubberBand();
  unint64_t v3 = v2;
  [v1 contentScaleFactor];
  unint64_t v5 = v4;

  v6.n128_u64[0] = 0;
  v7.n128_u64[0] = v3;
  v8.n128_u64[0] = v5;
  return MEMORY[0x1F4102D40](v6, v7, v8);
}

void sub_1BEC24060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v10 - 168));
  _Unwind_Resume(a1);
}

void sub_1BEC25840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_1(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

id BNPresentableDescription(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    unint64_t v5 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v6 = objc_opt_class();
    __n128 v7 = [v3 requesterIdentifier];
    __n128 v8 = [v3 requestIdentifier];
    objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; requesterIdentifier: %@; requestIdentifier: %@",
      v6,
      v3,
      v7,
    uint64_t v9 = v8);

    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v3 uniquePresentableIdentifier];
      [v9 appendFormat:@"; uniquePresentableIdentifier: %@", v10];
    }
    if (objc_opt_respondsToSelector())
    {
      id v11 = [v3 viewController];
      if (v11 == v3)
      {
        [v9 appendFormat:@"; viewController: %@", @"self"];
      }
      else
      {
        uint64_t v12 = [v3 viewController];
        [v9 appendFormat:@"; viewController: %@", v12];
      }
    }
    if ([v4 count])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v13 = v4;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            v19 = [v13 objectForKeyedSubscript:v18];
            [v9 appendFormat:@"; %@: %@", v18, v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v15);
      }
    }
    [v9 appendString:@">"];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id BNEffectivePresentableDescription(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    [v1 presentableDescription];
  }
  else {
  uint64_t v2 = BNPresentableDescription(v1, 0);
  }

  return v2;
}

void sub_1BEC2774C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC27964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BEC27DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BEC287DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC289D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1BEC28B20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC28C58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC28D90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC28E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id UIViewControllerFromPresentable(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 viewController];
  }
  else
  {
    uint64_t v3 = objc_opt_class();
    id v4 = v1;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v5 = v4;
      }
      else {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
    id v2 = v5;
  }
  return v2;
}

void sub_1BEC29F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC2C848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC2CA5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC2CBC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC2CDC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC2CFF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC2D1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_1BEC2D4F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t BNIsPresentableIdentifiedByIdentification(void *a1, void *a2, char a3)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = [v7 requesterIdentifier];
  uint64_t v10 = [v8 requesterIdentifier];
  if (![v9 isEqualToString:v10])
  {
    uint64_t v12 = 0;
    goto LABEL_32;
  }
  if ((a3 & 1) != 0
    || ([v8 requestIdentifier],
        long long v22 = objc_claimAutoreleasedReturnValue(),
        [v22 length]))
  {
    uint64_t v3 = [v7 requestIdentifier];
    id v4 = [v8 requestIdentifier];
    if (([v3 isEqualToString:v4] & 1) == 0)
    {

      uint64_t v12 = 0;
      if (a3) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    if (a3)
    {
      uint64_t v11 = 0;
      if (objc_opt_respondsToSelector())
      {
        char v20 = 1;
        char v21 = 0;
        goto LABEL_18;
      }
      long long v22 = v3;
      goto LABEL_30;
    }
    char v13 = 1;
    uint64_t v11 = 1;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_29:

      id v4 = v3;
LABEL_30:

      uint64_t v12 = v11;
      goto LABEL_31;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v12 = 1;
      goto LABEL_31;
    }
    char v13 = 0;
  }
  uint64_t v14 = [v8 uniquePresentableIdentifier];
  if (!v14)
  {
    uint64_t v11 = 1;
    uint64_t v12 = 1;
    if ((v13 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  uint64_t v15 = (void *)v14;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    uint64_t v11 = 0;
    uint64_t v12 = 0;
    if (v13) {
      goto LABEL_29;
    }
LABEL_31:

    goto LABEL_32;
  }
  v19 = v15;
  char v20 = v13;
  char v21 = 1;
LABEL_18:
  uint64_t v16 = [v7 uniquePresentableIdentifier];
  uint64_t v17 = [v8 uniquePresentableIdentifier];
  uint64_t v12 = [v16 isEqual:v17];

  if ((a3 & 1) == 0) {
  if (v20)
  }
  {
  }
  if (v21) {
    goto LABEL_31;
  }
LABEL_32:

  return v12;
}

uint64_t BNIsPresentableIdentifiedByIdentifier(void *a1, void *a2)
{
  return BNIsPresentableIdentifiedByIdentification(a1, a2, 0);
}

id BNPresentableIdentificationDescription(void *a1)
{
  id v1 = a1;
  id v2 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v3 = objc_opt_class();
  id v4 = [v1 requesterIdentifier];
  unint64_t v5 = [v1 requestIdentifier];
  objc_msgSend(v2, "stringWithFormat:", @"<%@: %p; requesterIdentifier: %@; requestIdentifier: %@",
    v3,
    v1,
    v4,
  uint64_t v6 = v5);

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v1 uniquePresentableIdentifier];
    [v6 appendFormat:@"; uniqueIdentifier: %@", v7];
  }
  [v6 appendString:@">"];

  return v6;
}

void sub_1BEC2EE9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BEC2F218(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1BEC2FC20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC2FCA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC2FE70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC30010(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1BEC30478(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC3062C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x1F410C5D8]();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return MEMORY[0x1F410C700]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4102B10](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t UIEdgeInsetsRotate()
{
  return MEMORY[0x1F4102C08]();
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4102C98]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4102D80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4102DC0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4102DD0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4102DF0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4102E10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}