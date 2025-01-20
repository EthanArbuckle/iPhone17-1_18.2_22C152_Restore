void _appTransitionOccurred()
{
  id v0;
  uint64_t vars8;

  v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:3];
}

void sub_226EBFF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXSBApplicationWithIdentifier(void *a1)
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  id v3 = a1;
  AXPerformSafeBlock();
  id v1 = (id)v5[5];

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_226EC015C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC07A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __AXSBApplicationWithIdentifier_block_invoke(uint64_t a1)
{
  AXSBApplicationControllerInstance();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 applicationWithBundleIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id AXSBApplicationControllerInstance()
{
  v0 = (void *)AXSBApplicationControllerInstance_AX_SBApplicationController;
  if (!AXSBApplicationControllerInstance_AX_SBApplicationController)
  {
    uint64_t v1 = [NSClassFromString(&cfstr_Sbapplicationc.isa) safeValueForKey:@"sharedInstance"];
    uint64_t v2 = (void *)AXSBApplicationControllerInstance_AX_SBApplicationController;
    AXSBApplicationControllerInstance_AX_SBApplicationController = v1;

    v0 = (void *)AXSBApplicationControllerInstance_AX_SBApplicationController;
  }
  return v0;
}

uint64_t screenDidDim(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return AXPerformSafeBlock();
  }
  return result;
}

uint64_t __screenDidDim_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockStateChanged];
}

id SBAXLocalizedString(void *a1)
{
  return SBAXLocalizedStringWithTable(a1, @"Accessibility");
}

id SBAXLocalizedStringWithTable(void *a1, void *a2)
{
  uint64_t v3 = SBAXLocalizedStringWithTable_onceToken;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&SBAXLocalizedStringWithTable_onceToken, &__block_literal_global_0);
  }
  uint64_t v6 = [(id)SBAXLocalizedStringWithTable_AXBundle localizedStringForKey:v5 value:v5 table:v4];

  return v6;
}

uint64_t __SBAXLocalizedStringWithTable_block_invoke()
{
  SBAXLocalizedStringWithTable_AXBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

BOOL AXSpringBoardIsReadyToBeProbed()
{
  v0 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];
  BOOL v1 = v0 != 0;

  return v1;
}

id SBAXBacklightControllerInstance()
{
  v0 = (void *)SBAXBacklightControllerInstance_SharedInstance;
  if (!SBAXBacklightControllerInstance_SharedInstance)
  {
    uint64_t v1 = [NSClassFromString(&cfstr_Sbbacklightcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
    uint64_t v2 = (void *)SBAXBacklightControllerInstance_SharedInstance;
    SBAXBacklightControllerInstance_SharedInstance = v1;

    v0 = (void *)SBAXBacklightControllerInstance_SharedInstance;
  }
  return v0;
}

uint64_t AXSpringBoardGlueSBLockScreenControllerInstance()
{
  Class v0 = (Class)AXSpringBoardGlueSBLockScreenControllerInstance_class;
  if (!AXSpringBoardGlueSBLockScreenControllerInstance_class)
  {
    Class v0 = NSClassFromString(&cfstr_Sblockscreenma.isa);
    AXSpringBoardGlueSBLockScreenControllerInstance_class = (uint64_t)v0;
  }
  return [(objc_class *)v0 safeValueForKey:@"sharedInstanceIfExists"];
}

id AXSBUIControllerSharedInstance()
{
  Class v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  if (!AXSBUIControllerSharedInstance_SharedInstance)
  {
    uint64_t v1 = [NSClassFromString(&cfstr_Sbuicontroller.isa) safeValueForKey:@"sharedInstanceIfExists"];
    uint64_t v2 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
    AXSBUIControllerSharedInstance_SharedInstance = v1;

    Class v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  }
  return v0;
}

id AXSBLockScreenEnvironment()
{
  Class v0 = (Class)AXSpringBoardGlueSBLockScreenControllerInstance_class;
  if (!AXSpringBoardGlueSBLockScreenControllerInstance_class)
  {
    Class v0 = NSClassFromString(&cfstr_Sblockscreenma.isa);
    AXSpringBoardGlueSBLockScreenControllerInstance_class = (uint64_t)v0;
  }
  uint64_t v1 = [(objc_class *)v0 safeValueForKey:@"sharedInstanceIfExists"];
  uint64_t v2 = [v1 safeValueForKey:@"_lockScreenEnvironment"];

  return v2;
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

id AXSBLockScreenViewController()
{
  Class v0 = AXSBLockScreenEnvironment();
  uint64_t v1 = [v0 safeValueForKey:@"rootViewController"];

  return v1;
}

void sub_226EC3B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226EC6CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226EC7EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC80E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC83D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC855C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC8E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC8FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC979C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_226EC9C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC9E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EC9F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECA04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SBAXIsViewVisible(void *a1)
{
  id v1 = a1;
  if ([v1 isHidden] & 1) != 0 || (objc_msgSend(v1, "isHiddenOrHasHiddenAncestor"))
  {
    uint64_t v2 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || ([v1 window], uint64_t v2 = objc_claimAutoreleasedReturnValue(), (id)v2, v2))
    {
      [v1 frame];
      BOOL v4 = fabs(v3) >= 0.001;
      uint64_t v2 = fabs(v5) >= 0.001 && v4;
    }
  }

  return v2;
}

void sub_226ECA2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECA3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECA554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECA878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECAB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECAD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECAF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECB09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECB598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECB748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECB8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECBA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECBB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECBD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECC018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECC20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECC368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECC4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECC67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECCD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECCF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECD0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECD200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECDB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECDE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECE9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECEAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_226ECEC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECED40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECEE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECEFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECF108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECF29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ECF3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHUComfortSoundsSettingsClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  Class v0 = (void *)getHUComfortSoundsSettingsClass_softClass;
  uint64_t v7 = getHUComfortSoundsSettingsClass_softClass;
  if (!getHUComfortSoundsSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHUComfortSoundsSettingsClass_block_invoke;
    v3[3] = &unk_2647F0860;
    v3[4] = &v4;
    __getHUComfortSoundsSettingsClass_block_invoke((uint64_t)v3);
    Class v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_226ECF648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED00A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED1020(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_226ED1760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED1860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED1BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED1F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_226ED3120(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_226ED3820(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_226ED4150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED4290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED43EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED4520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED467C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED47D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED4978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED4B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED52B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_226ED53F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED554C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED56C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED5834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226ED5AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSiriSimpleActivationSourceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SiriActivationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SiriActivationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2647F0DA8;
    uint64_t v5 = 0;
    SiriActivationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriActivationLibraryCore_frameworkLibrary) {
    __getSiriSimpleActivationSourceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SiriSimpleActivationSource");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSiriSimpleActivationSourceClass_block_invoke_cold_2();
  }
  getSiriSimpleActivationSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SiriActivationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriActivationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __PassKitCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2647F0DC0;
    uint64_t v5 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PassKitCoreLibraryCore_frameworkLibrary) {
    __getPKPassLibraryClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PKPassLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPKPassLibraryClass_block_invoke_cold_2();
  }
  getPKPassLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHUComfortSoundsSettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __HearingUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2647F0DD8;
    uint64_t v5 = 0;
    HearingUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HearingUtilitiesLibraryCore_frameworkLibrary) {
    __getHUComfortSoundsSettingsClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("HUComfortSoundsSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getHUComfortSoundsSettingsClass_block_invoke_cold_2();
  }
  getHUComfortSoundsSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HearingUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HearingUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSOSManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SOSLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SOSLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2647F0DF0;
    uint64_t v5 = 0;
    SOSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SOSLibraryCore_frameworkLibrary) {
    __getSOSManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SOSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSOSManagerClass_block_invoke_cold_2();
  }
  getSOSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SOSLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SOSLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAXRemoteViewServiceAdaptorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityRemoteUIServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityRemoteUIServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2647F0E08;
    uint64_t v5 = 0;
    AccessibilityRemoteUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityRemoteUIServicesLibraryCore_frameworkLibrary) {
    __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AXRemoteViewServiceAdaptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_2();
  }
  getAXRemoteViewServiceAdaptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityRemoteUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityRemoteUIServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t AccessibilityPhysicalInteractionLibraryCore()
{
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary) {
    AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary;
}

uint64_t __AccessibilityPhysicalInteractionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAXPISystemActionHelperClass_block_invoke(uint64_t a1)
{
  double v3 = 0;
  if (!AccessibilityPhysicalInteractionLibraryCore()) {
    __getAXPISystemActionHelperClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("AXPISystemActionHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXPISystemActionHelperClass_block_invoke_cold_2();
  }
  getAXPISystemActionHelperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
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

void sub_226EDC660(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void sub_226EDCF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 224), 8);
  _Block_object_dispose((const void *)(v61 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_226EDD620(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void callStateChanged(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = a2;
    id v3 = v4;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void incomingCallStateChanged(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = a2;
    id v4 = [MEMORY[0x263F22938] sharedInstance];
    int v5 = [v4 callAudioRoutingAutoAnswerEnabled];

    if (UIAccessibilityIsVoiceOverRunning())
    {
      uint64_t v6 = [v3 delegate];
      char v7 = [v6 isRingerMutedWithServerInstance:v3];

      if ((v7 & 1) == 0) {
        AXPerformBlockOnMainThread();
      }
    }
    if (!v5) {
      goto LABEL_19;
    }
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__2;
    v40 = __Block_byref_object_dispose__2;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2;
    v34 = __Block_byref_object_dispose__2;
    id v35 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    AXPerformBlockSynchronouslyOnMainThread();
    v8 = (void *)v37[5];
    if ((v8 || (v8 = (void *)v31[5]) != 0) && v27[3] == 1)
    {
      id v9 = v8;
      if ([v3 shouldAllowActiveWatchToAutoAnswer]
        && ([v9 isVideo] & 1) == 0)
      {
        v18 = [MEMORY[0x263F213B0] sharedInstance];
        char v19 = [v18 ignoreLogging];

        if ((v19 & 1) == 0)
        {
          v20 = [MEMORY[0x263F213B0] identifier];
          v21 = AXLoggerForFacility();

          os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v21, v22))
          {
            v23 = AXColorizeFormatLog();
            v24 = _AXStringForArgs();
            if (os_log_type_enabled(v21, v22))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v24;
              _os_log_impl(&dword_226EBC000, v21, v22, "%{public}@", buf, 0xCu);
            }
          }
        }

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v30, 8);

        _Block_object_dispose(&v36, 8);
        goto LABEL_19;
      }
      uint64_t v10 = [MEMORY[0x263F22938] sharedInstance];
      [v10 callAudioRoutingAutoAnswerDelay];

      id v25 = v9;
      AXPerformBlockOnMainThreadAfterDelay();
    }
    v11 = [MEMORY[0x263F213B0] sharedInstance];
    char v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      v13 = [MEMORY[0x263F213B0] identifier];
      v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = AXColorizeFormatLog();
        v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          v43 = v17;
          _os_log_impl(&dword_226EBC000, v14, v15, "%{public}@", buf, 0xCu);
        }
      }
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
LABEL_19:
  }
}

void sub_226EDE33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void hidDeviceCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDDevice *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = a4;
    _os_log_impl(&dword_226EBC000, v6, OS_LOG_TYPE_DEFAULT, "Received assistive device callback: %@", buf, 0xCu);
  }

  if (a4)
  {
    buf[0] = 0;
    objc_opt_class();
    IOHIDDeviceGetProperty(a4, @"DeviceUsagePairs");
    uint64_t v7 = __UIAccessibilityCastAsClass();
    if (buf[0]) {
      abort();
    }
    v8 = (__IOHIDDevice *)v7;
    context = a1;
    id v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v8;
      _os_log_impl(&dword_226EBC000, v9, OS_LOG_TYPE_DEFAULT, "Usage pairs: %@", buf, 0xCu);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = v8;
    uint64_t v11 = [(__IOHIDDevice *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          os_log_type_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = [v15 objectForKey:@"DeviceUsage"];
          int v17 = [v16 intValue];

          v18 = [v15 objectForKey:@"DeviceUsagePage"];
          int v19 = [v18 intValue];

          if (v19 == 9)
          {
            if (objc_msgSend((id)IOHIDDeviceGetProperty(a4, @"IAPHIDAccessoryCategory"), "intValue") == 7)goto LABEL_26; {
          }
            }
          else if (v19 == 1 && v17 == 10)
          {
LABEL_26:

            if (!_AXSAssistiveTouchScannerEnabled()) {
              _AXSAssistiveTouchScannerSetEnabled();
            }
            if (IOHIDDeviceOpen(a4, 0)) {
              _AXLogWithFacility();
            }
            IOHIDDeviceRegisterInputValueCallback(a4, (IOHIDValueCallback)inputValueCallback, context);
            goto LABEL_31;
          }
        }
        uint64_t v12 = [(__IOHIDDevice *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    if (IOHIDDeviceConformsTo(a4, 1u, 0xBu) || IOHIDDeviceConformsTo(a4, 0x41u, 1u))
    {
      _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage();
      _AXSVoiceOverTouchSetUIEnabled();
      v21 = AXLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226EBC000, v21, OS_LOG_TYPE_DEFAULT, "Enabling VoiceOver for a braille display", buf, 2u);
      }
    }
LABEL_31:
  }
}

uint64_t inputValueCallback()
{
  uint64_t result = _AXSAssistiveTouchScannerEnabled();
  if (!result)
  {
    return _AXSAssistiveTouchScannerSetEnabled();
  }
  return result;
}

void sub_226EE1CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EE1EE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_226EE62A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_226EE7B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t liveTranscriptionStateChanged(uint64_t a1, void *a2)
{
  return [a2 _handleLiveTranscriptionStatusChange];
}

void sub_226EE91D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226EE94D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __callStateChanged_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = _AXSDefaultRouteForCall();
  if ([*(id *)(a1 + 32) hasActiveOrPendingCallOrFaceTime])
  {
    if (v2
      || ([MEMORY[0x263F47550] sharedInstance],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 pairedHearingAids],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v3,
          v4))
    {
      HAInitializeLogging();
      int v5 = [NSString stringWithFormat:@"Switching to default route"];
      uint64_t v6 = [NSString stringWithFormat:@"%s:%d %@", "void callStateChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)_block_invoke", 526, v5];
      uint64_t v7 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v6;
        id v9 = v7;
        *(_DWORD *)buf = 136446210;
        uint64_t v17 = [v8 UTF8String];
        _os_log_impl(&dword_226EBC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _setCallRoute:v2 ifCurrentlyRoutedTo:0 rampUp:0];
    }
  }
  else if (AXPreviousCallRoute)
  {
    HAInitializeLogging();
    uint64_t v10 = [NSString stringWithFormat:@"Call no longer active, switching to previous route"];
    uint64_t v11 = [NSString stringWithFormat:@"%s:%d %@", "void callStateChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)_block_invoke", 531, v10];
    uint64_t v12 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      uint64_t v14 = v12;
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = [v13 UTF8String];
      _os_log_impl(&dword_226EBC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _setAVCallRoute:AXPreviousCallRoute rampUp:0];
    os_log_type_t v15 = (void *)AXPreviousCallRoute;
    AXPreviousCallRoute = 0;
  }
}

void __incomingCallStateChanged_block_invoke()
{
  Class v0 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v1 = [v0 incomingCall];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v4 = [MEMORY[0x263F7E1A0] sharedInstance];
    id v3 = [v4 currentVideoCall];
  }
  if ([v3 status] == 4)
  {
    id v5 = v3;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __incomingCallStateChanged_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F21660];
  uint64_t v2 = [*(id *)(a1 + 32) displayName];
  id argument = [v1 axAttributedStringWithString:v2];

  [argument setAttribute:&unk_26DB20088 forKey:*MEMORY[0x263F216D8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F83188], argument);
}

void __incomingCallStateChanged_block_invoke_3(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v3 = [v2 incomingCall];
  uint64_t v4 = *(void *)(a1[4] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v7 = [v6 incomingVideoCall];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [MEMORY[0x263F7E1A0] sharedInstance];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v10 currentAudioAndVideoCallCount];
}

void __incomingCallStateChanged_block_invoke_1473(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) status] == 4)
  {
    uint64_t v2 = [MEMORY[0x263F213B0] sharedInstance];
    char v3 = [v2 ignoreLogging];

    if ((v3 & 1) == 0)
    {
      uint64_t v4 = [MEMORY[0x263F213B0] identifier];
      id v5 = AXLoggerForFacility();

      os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = AXColorizeFormatLog();
        id v10 = *(void **)(a1 + 32);
        uint64_t v11 = [v10 status];
        uint64_t v8 = _AXStringForArgs();
        if (os_log_type_enabled(v5, v6))
        {
          *(_DWORD *)buf = 138543362;
          id v13 = v8;
          _os_log_impl(&dword_226EBC000, v5, v6, "%{public}@", buf, 0xCu);
        }
      }
    }
    id v9 = objc_msgSend(MEMORY[0x263F7E1A0], "sharedInstance", v10, v11);
    [v9 answerCall:*(void *)(a1 + 32)];
  }
}

void AXSBPrepareWindowForTripleClickSpeaking(void *a1)
{
  id v2 = a1;
  uint64_t v1 = (void *)_AXSTripleClickCopyOptions();
  if ([v1 containsObject:&unk_26DB20118] && !UIAccessibilityIsVoiceOverRunning()) {
    [v2 setAccessibilityIdentifier:@"TripleClickAskWindow"];
  }
}

void sub_226EECB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_226EED500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EED9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EEDDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Block_object_dispose((const void *)(v33 - 96), 8);
  _Block_object_dispose((const void *)(v33 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_226EEECE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EEEEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EEF43C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_226EEF7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBIconLocationDockSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "SBIconLocationDock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationDockSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpringBoardHomeLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __SpringBoardHomeLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_2647F1418;
    uint64_t v4 = 0;
    SpringBoardHomeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SpringBoardHomeLibraryCore_frameworkLibrary;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary) {
    SpringBoardHomeLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __SpringBoardHomeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardHomeLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSBIconLocationFloatingDockSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "SBIconLocationFloatingDock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationFloatingDockSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void _UIAXLoadVisualAlertsBundle()
{
  if ((_UIAXLoadVisualAlertsBundle_didLoad & 1) == 0)
  {
    uint64_t v0 = (void *)MEMORY[0x263F086E0];
    uint64_t v1 = AXSystemRootDirectory();
    id v2 = [v1 stringByAppendingPathComponent:@"/System/Library/AccessibilityBundles/VisualAlerts.bundle"];
    id v3 = [v0 bundleWithPath:v2];

    if (([v3 isLoaded] & 1) == 0)
    {
      [v3 load];
      _UIAXLoadVisualAlertsBundle_didLoad = 1;
    }
  }
}

uint64_t _accessibilityiTunesSettings()
{
  return +[AXSBSettingsLoader checkAccessibilityOptions];
}

uint64_t _accessibilityCheckContrast()
{
  return +[AXSBSettingsLoader checkScreenContrast];
}

void _accessibilityVisualAlertChanged()
{
  if (_AXSVisualAlertEnabled() && _accessibilityHasCameraFlash())
  {
    _UIAXLoadVisualAlertsBundle();
  }
}

void _accessibilityEnhanceTextLegibilityChanged()
{
  if (_accessibilityEnhanceTextLegibilityChanged_onceToken != -1) {
    dispatch_once(&_accessibilityEnhanceTextLegibilityChanged_onceToken, &__block_literal_global_695);
  }
  uint64_t v0 = _accessibilityEnhanceTextLegibilityChanged_KeyboardPurgeQueue;
  dispatch_async(v0, &__block_literal_global_698);
}

BOOL _accessibilityHasCameraFlash()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

id _accessibilityInitializeSpeakTypingServer()
{
  if (_AXSWordFeedbackEnabled()) {
    return (id)[MEMORY[0x263F78B88] sharedInstance];
  }
  if (_AXSLetterFeedbackEnabled()) {
    return (id)[MEMORY[0x263F78B88] sharedInstance];
  }
  id result = (id)_AXSPhoneticFeedbackEnabled();
  if (result) {
    return (id)[MEMORY[0x263F78B88] sharedInstance];
  }
  return result;
}

uint64_t _accessibilityTripleHomeEnabled()
{
  return [(id)_AXSettingsLoaderDelegate _updateAXSettings];
}

void sub_226EF1F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id deviceUsagePairs(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [MEMORY[0x263EFF980] array];
  uint64_t v14 = (id *)&a9;
  if (v9)
  {
    do
    {
      [v10 addObject:v9];
      uint64_t v11 = v14++;
      id v12 = *v11;

      id v9 = v12;
    }
    while (v12);
  }
  return v10;
}

void _homeButtonBreakageMessageHandler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263F213B8] sharedInstance];
  char v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    os_log_type_t v6 = [MEMORY[0x263F213B8] identifier];
    uint64_t v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = AXColorizeFormatLog();
      id v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138543362;
        int v19 = v10;
        _os_log_impl(&dword_226EBC000, v7, v8, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (a3 == -536870608)
  {
    uint64_t v11 = [MEMORY[0x263F213B8] sharedInstance];
    char v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      id v13 = [MEMORY[0x263F213B8] identifier];
      uint64_t v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = AXColorizeFormatLog();
        uint64_t v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          int v19 = v17;
          _os_log_impl(&dword_226EBC000, v14, v15, "%{public}@", buf, 0xCu);
        }
      }
    }
    [(id)objc_opt_class() _checkForHomeButtonBreakage:0];
  }
}

uint64_t _voiceOverVibrateEnable(uint64_t a1, void *a2)
{
  return [a2 _showVibrationVoiceOverEnablerView];
}

uint64_t _voiceOverSwipeEnable(uint64_t a1, void *a2)
{
  return [a2 _showSwipeDetectionEnablerView];
}

uint64_t ___accessibilityEnhanceTextLegibilityChanged_block_invoke()
{
  _accessibilityEnhanceTextLegibilityChanged_KeyboardPurgeQueue = (uint64_t)dispatch_queue_create("AXKeyboardPurgeQueue", 0);
  return MEMORY[0x270F9A758]();
}

uint64_t ___accessibilityEnhanceTextLegibilityChanged_block_invoke_2()
{
  return MEMORY[0x270F09DB8]();
}

void __AXAssetAndDataClient_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F22198]);
  CFBooleanRef v1 = NSString;
  id v5 = [NSNumber numberWithInt:getpid()];
  CFTypeID v2 = [v1 stringWithFormat:@"AXAssetClient-springBoard-client-%@", v5];
  uint64_t v3 = [v0 initWithIdentifier:v2 serviceBundleName:@"AXAssetAndDataServer"];
  uint64_t v4 = (void *)AXAssetAndDataClient_Client;
  AXAssetAndDataClient_Client = v3;
}

void *sub_226EF50DC()
{
  return &unk_268160FE0;
}

uint64_t static HearingActivityContentState.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_226EF5108()
{
  return 1;
}

uint64_t sub_226EF5148()
{
  return 1;
}

uint64_t sub_226EF5160()
{
  return 0;
}

uint64_t sub_226EF516C()
{
  return sub_226EFECD0();
}

uint64_t sub_226EF5198()
{
  return sub_226EF516C();
}

uint64_t sub_226EF51B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_226EF5108();
  *a1 = result & 1;
  return result;
}

uint64_t sub_226EF51E4()
{
  return sub_226EF5160();
}

uint64_t sub_226EF5200@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_226EF5148();
  *a1 = result & 1;
  return result;
}

uint64_t sub_226EF5234()
{
  return sub_226EFEE40();
}

uint64_t sub_226EF5264()
{
  return sub_226EFEE50();
}

uint64_t HearingActivityContentState.encode(to:)(uint64_t a1)
{
  uint64_t v2 = a1;
  id v10 = 0;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268161040);
  uint64_t v6 = *(void *)(v9 - 8);
  uint64_t v7 = v9 - 8;
  unint64_t v3 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  os_log_type_t v8 = (char *)&v2 - v3;
  id v10 = (void *)MEMORY[0x270FA5388](v2);
  uint64_t v4 = v10[3];
  uint64_t v5 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v4);
  sub_226EF5DB0();
  sub_226EFEE30();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v9);
}

uint64_t HearingActivityContentState.hashValue.getter()
{
  return sub_226EFEDD0();
}

uint64_t HearingActivityContentState.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_226EF5418()
{
  return HearingActivityContentState.hashValue.getter();
}

void sub_226EF5430()
{
}

uint64_t sub_226EF5448()
{
  return sub_226EFECB0();
}

uint64_t sub_226EF5460(uint64_t a1)
{
  return HearingActivityContentState.init(from:)(a1);
}

uint64_t sub_226EF54B8(uint64_t a1)
{
  return HearingActivityContentState.encode(to:)(a1);
}

uint64_t sub_226EF5504()
{
  return static HearingActivityContentState.== infix(_:_:)() & 1;
}

uint64_t sub_226EF5520()
{
  return sub_226EFEB30();
}

uint64_t sub_226EF5540(uint64_t a1)
{
  uint64_t v2 = a1;
  id v10 = 0;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268161180);
  uint64_t v6 = *(void *)(v9 - 8);
  uint64_t v7 = v9 - 8;
  unint64_t v3 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  os_log_type_t v8 = (char *)&v2 - v3;
  id v10 = (void *)MEMORY[0x270FA5388](v2);
  uint64_t v4 = v10[3];
  uint64_t v5 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v4);
  sub_226EF6044();
  sub_226EFEE30();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v9);
}

uint64_t sub_226EF5658(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_226EF568C()
{
  return sub_226EFEE40();
}

uint64_t sub_226EF56BC()
{
  return sub_226EFEE50();
}

uint64_t sub_226EF56EC(uint64_t a1)
{
  return sub_226EF5658(a1);
}

uint64_t sub_226EF5744(uint64_t a1)
{
  return sub_226EF5540(a1);
}

uint64_t sub_226EF579C()
{
  return sub_226EF57D8();
}

uint64_t sub_226EF57D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268161058);
  *(void *)(v1 + 16) = sub_226EFEC40();
  sub_226EFEB50();
  sub_226EFEC80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268161060);
  sub_226EF60C4();
  sub_226EFED50();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268161070);
    sub_226EFEE00();
    if (!v2) {
      break;
    }
    sub_226EF5AEC();
    swift_release();
  }
  sub_226EF61C0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_226EF5908()
{
  type metadata accessor for ActivityStore();
  uint64_t result = sub_226EF579C();
  qword_268160FF0 = result;
  return result;
}

uint64_t *sub_226EF593C()
{
  if (qword_268160FE8 != -1) {
    swift_once();
  }
  return &qword_268160FF0;
}

uint64_t sub_226EF59A0()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 16);
  sub_226EFEC80();
  swift_endAccess();
  return v2;
}

uint64_t sub_226EF59F0(uint64_t a1)
{
  sub_226EFEC80();
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_226EF5A50())()
{
  return sub_226EF5AAC;
}

uint64_t sub_226EF5AAC()
{
  return swift_endAccess();
}

uint64_t sub_226EF5AEC()
{
  return swift_endAccess();
}

uint64_t sub_226EF5BB8()
{
  sub_226EF61C0();
  return v1;
}

uint64_t sub_226EF5BEC()
{
  return swift_deallocClassInstance();
}

uint64_t sub_226EF5C2C()
{
  type metadata accessor for HearingActivityGateway();
  uint64_t result = sub_226EF5C60();
  qword_268161A20 = result;
  return result;
}

uint64_t sub_226EF5C60()
{
  return sub_226EF628C();
}

uint64_t *sub_226EF5C9C()
{
  if (qword_268160FF8 != -1) {
    swift_once();
  }
  return &qword_268161A20;
}

uint64_t sub_226EF5D00()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 16);
  swift_retain();
  swift_endAccess();
  return v2;
}

uint64_t sub_226EF5D50(uint64_t a1)
{
  swift_retain();
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

unint64_t sub_226EF5DB0()
{
  uint64_t v2 = qword_268161038;
  if (!qword_268161038)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161038);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

unint64_t sub_226EF5F18()
{
  uint64_t v2 = qword_268161048;
  if (!qword_268161048)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161048);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

unint64_t sub_226EF6044()
{
  uint64_t v2 = qword_268161050;
  if (!qword_268161050)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161050);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EF60C4()
{
  uint64_t v2 = qword_268161068;
  if (!qword_268161068)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268161060);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161068);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_226EF61C0()
{
}

uint64_t type metadata accessor for ActivityStore()
{
  return self;
}

uint64_t type metadata accessor for HearingActivityGateway()
{
  uint64_t v1 = qword_268161130;
  if (!qword_268161130) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_226EF628C()
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v12 = v0;
  *(void *)(v0 + 16) = 0;
  sub_226EFECD0();
  sub_226EFECD0();
  sub_226EFEC20();
  sub_226EF593C();
  swift_retain();
  swift_beginAccess();
  sub_226EFEC80();
  swift_endAccess();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268161058);
  sub_226EFEC80();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_226EFEC60();
  swift_bridgeObjectRelease();
  if (v5 > 0)
  {
    sub_226EF593C();
    swift_retain();
    swift_beginAccess();
    sub_226EFEC80();
    swift_endAccess();
    swift_release();
    uint64_t v3 = sub_226EFEC80();
    swift_bridgeObjectRelease();
    sub_226EFEC80();
    uint64_t v9 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268161080);
    sub_226EF6630();
    sub_226EFED40();
    sub_226EF61C0();
    if (v11)
    {
      uint64_t v7 = v10;
      uint64_t v8 = v11;
      swift_bridgeObjectRelease();
      sub_226EF593C();
      swift_retain();
      sub_226EFEC80();
      swift_beginAccess();
      sub_226EFEC80();
      swift_endAccess();
      MEMORY[0x22A66D5A0](&v6);
      sub_226EF66B4();
      uint64_t v2 = v6;
      swift_beginAccess();
      *(void *)(v4 + 16) = v2;
      swift_release();
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v4;
}

unint64_t sub_226EF6630()
{
  uint64_t v2 = qword_268161088;
  if (!qword_268161088)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268161080);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161088);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_226EF66B4()
{
}

uint64_t sub_226EF66E0()
{
  v1[15] = v0;
  v1[8] = v1;
  v1[9] = 0;
  v1[11] = 0;
  v1[13] = 0;
  uint64_t v2 = sub_226EFEC30();
  v1[16] = v2;
  v1[17] = *(void *)(v2 - 8);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268161098);
  v1[20] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681610A0);
  v1[21] = v3;
  v1[22] = *(void *)(v3 - 8);
  v1[23] = swift_task_alloc();
  uint64_t v4 = sub_226EFEBD0();
  v1[24] = v4;
  v1[25] = *(void *)(v4 - 8);
  v1[26] = swift_task_alloc();
  v1[9] = v0;
  return MEMORY[0x270FA2498](sub_226EF6900, 0);
}

uint64_t sub_226EF6900()
{
  v48 = v0;
  uint64_t v41 = v0[15];
  v0[8] = v0;
  swift_beginAccess();
  uint64_t v42 = *(void *)(v41 + 16);
  swift_retain();
  swift_endAccess();
  v0[10] = v42;
  if (v0[10])
  {
    sub_226EF8824();
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v40 + 216) = v6;
    *uint64_t v6 = *(void *)(v40 + 64);
    v6[1] = sub_226EF7880;
    return sub_226EF8B0C();
  }
  else
  {
    sub_226EF8824();
    uint64_t v36 = *(void *)(v40 + 160);
    uint64_t v35 = sub_226EFEBB0();
    sub_226EFEE10();
    (*(void (**)(uint64_t, void))(*(void *)(v35 - 8) + 104))(v1, *MEMORY[0x263EFB560]);
    sub_226EF8850();
    sub_226EFEBC0();
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268161058);
    uint64_t v3 = nullsub_1(v2);
    nullsub_1(v3);
    sub_226EF5520();
    uint64_t v4 = sub_226EFEB40();
    (*(void (**)(uint64_t))(*(void *)(v4 - 8) + 56))(v36);
    sub_226EF88A8();
    sub_226EF8928();
    sub_226EF5F18();
    sub_226EF8894();
    sub_226EFEBE0();
    uint64_t v37 = sub_226EFECD0();
    unint64_t v38 = v5;
    sub_226EFEB80();
    sub_226EFEE10();
    uint64_t v39 = sub_226EFEB70();
    uint64_t v22 = *(void *)(v40 + 184);
    uint64_t v23 = *(void *)(v40 + 168);
    uint64_t v8 = *(void *)(v40 + 152);
    uint64_t v26 = *(void *)(v40 + 128);
    uint64_t v24 = *(void *)(v40 + 120);
    uint64_t v21 = *(void *)(v40 + 176);
    uint64_t v25 = *(void *)(v40 + 136);
    swift_bridgeObjectRelease();
    sub_226EF89A8(v37, v38);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v23);
    *(void *)(v40 + 104) = v39;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v8, v24 + OBJC_IVAR____TtC27AXSpringBoardServerInstance22HearingActivityGateway_logger, v26);
    swift_retain();
    oslog = sub_226EFEC10();
    os_log_type_t v34 = sub_226EFED70();
    *(void *)(v40 + 112) = 12;
    sub_226EFA1CC();
    sub_226EFA248();
    sub_226EFA2C4();
    sub_226EFECF0();
    uint32_t size = *(_DWORD *)(v40 + 228);
    uint64_t v29 = swift_allocObject();
    *(unsigned char *)(v29 + 16) = 32;
    uint64_t v30 = swift_allocObject();
    *(unsigned char *)(v30 + 16) = 8;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_226EFBC5C;
    *(void *)(v28 + 24) = v39;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_226EFBC04;
    *(void *)(v31 + 24) = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681610D0);
    sub_226EFEE10();
    uint64_t v32 = v9;
    swift_retain();
    *uint64_t v32 = sub_226EFBB90;
    v32[1] = v29;
    swift_retain();
    v32[2] = sub_226EFBB90;
    v32[3] = v30;
    swift_retain();
    v32[4] = sub_226EFBC50;
    v32[5] = v31;
    sub_226EF8850();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v34))
    {
      buf = (uint8_t *)sub_226EFEDA0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681610D8);
      uint64_t v19 = sub_226EFA340(0);
      uint64_t v20 = sub_226EFA340(1);
      v43 = buf;
      uint64_t v44 = v19;
      uint64_t v45 = v20;
      sub_226EFA39C(2, &v43);
      sub_226EFA39C(1, &v43);
      v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFBB90;
      uint64_t v47 = v29;
      sub_226EFA3B0(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
      v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFBB90;
      uint64_t v47 = v30;
      sub_226EFA3B0(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
      v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFBC50;
      uint64_t v47 = v31;
      sub_226EFA3B0(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
      _os_log_impl(&dword_226EBC000, oslog, v34, "Requested activity (%s) successfully.", buf, size);
      sub_226EFA3FC(v19);
      sub_226EFA3FC(v20);
      sub_226EFED80();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v16 = *(void *)(v40 + 208);
    uint64_t v17 = *(void *)(v40 + 192);
    uint64_t v12 = *(void *)(v40 + 152);
    uint64_t v13 = *(void *)(v40 + 128);
    uint64_t v14 = *(void *)(v40 + 120);
    uint64_t v15 = *(void *)(v40 + 200);
    uint64_t v11 = *(void *)(v40 + 136);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
    swift_retain();
    swift_retain();
    swift_beginAccess();
    *(void *)(v14 + 16) = v39;
    swift_release();
    swift_endAccess();
    swift_release();
    sub_226EF593C();
    swift_retain();
    sub_226EF5AEC();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(*(void *)(v40 + 64) + 8);
    return v10();
  }
}

uint64_t sub_226EF7880()
{
  *(void *)(*(void *)v0 + 64) = *(void *)v0;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_226EF7998, 0);
}

uint64_t sub_226EF7998()
{
  uint64_t v44 = v0;
  *(void *)(v0 + 64) = v0;
  uint64_t v35 = *(void *)(v0 + 160);
  uint64_t v34 = sub_226EFEBB0();
  sub_226EFEE10();
  (*(void (**)(uint64_t, void))(*(void *)(v34 - 8) + 104))(v1, *MEMORY[0x263EFB560]);
  sub_226EF8850();
  sub_226EFEBC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268161058);
  uint64_t v2 = ((uint64_t (*)(void))nullsub_1)();
  nullsub_1(v2);
  sub_226EF5520();
  uint64_t v3 = sub_226EFEB40();
  (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 56))(v35);
  sub_226EF88A8();
  sub_226EF8928();
  sub_226EF5F18();
  sub_226EF8894();
  sub_226EFEBE0();
  uint64_t v36 = sub_226EFECD0();
  unint64_t v37 = v4;
  sub_226EFEB80();
  sub_226EFEE10();
  uint64_t v38 = sub_226EFEB70();
  uint64_t v20 = *(void *)(v33 + 184);
  uint64_t v21 = *(void *)(v33 + 168);
  uint64_t v5 = *(void *)(v33 + 152);
  uint64_t v24 = *(void *)(v33 + 128);
  uint64_t v22 = *(void *)(v33 + 120);
  uint64_t v19 = *(void *)(v33 + 176);
  uint64_t v23 = *(void *)(v33 + 136);
  swift_bridgeObjectRelease();
  sub_226EF89A8(v36, v37);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
  *(void *)(v33 + 104) = v38;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v5, v22 + OBJC_IVAR____TtC27AXSpringBoardServerInstance22HearingActivityGateway_logger, v24);
  swift_retain();
  oslog = sub_226EFEC10();
  os_log_type_t v32 = sub_226EFED70();
  *(void *)(v33 + 112) = 12;
  sub_226EFA1CC();
  sub_226EFA248();
  sub_226EFA2C4();
  sub_226EFECF0();
  uint32_t size = *(_DWORD *)(v33 + 228);
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 32;
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_226EFBC5C;
  *(void *)(v26 + 24) = v38;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_226EFBC04;
  *(void *)(v29 + 24) = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681610D0);
  sub_226EFEE10();
  uint64_t v30 = v6;
  swift_retain();
  *uint64_t v30 = sub_226EFBB90;
  v30[1] = v27;
  swift_retain();
  v30[2] = sub_226EFBB90;
  v30[3] = v28;
  swift_retain();
  v30[4] = sub_226EFBC50;
  v30[5] = v29;
  sub_226EF8850();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v32))
  {
    buf = (uint8_t *)sub_226EFEDA0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681610D8);
    uint64_t v17 = sub_226EFA340(0);
    uint64_t v18 = sub_226EFA340(1);
    uint64_t v39 = buf;
    uint64_t v40 = v17;
    uint64_t v41 = v18;
    sub_226EFA39C(2, &v39);
    sub_226EFA39C(1, &v39);
    uint64_t v42 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFBB90;
    uint64_t v43 = v27;
    sub_226EFA3B0(&v42, (uint64_t)&v39, (uint64_t)&v40, (uint64_t)&v41);
    uint64_t v42 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFBB90;
    uint64_t v43 = v28;
    sub_226EFA3B0(&v42, (uint64_t)&v39, (uint64_t)&v40, (uint64_t)&v41);
    uint64_t v42 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_226EFBC50;
    uint64_t v43 = v29;
    sub_226EFA3B0(&v42, (uint64_t)&v39, (uint64_t)&v40, (uint64_t)&v41);
    _os_log_impl(&dword_226EBC000, oslog, v32, "Requested activity (%s) successfully.", buf, size);
    sub_226EFA3FC(v17);
    sub_226EFA3FC(v18);
    sub_226EFED80();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v14 = *(void *)(v33 + 208);
  uint64_t v15 = *(void *)(v33 + 192);
  uint64_t v10 = *(void *)(v33 + 152);
  uint64_t v11 = *(void *)(v33 + 128);
  uint64_t v12 = *(void *)(v33 + 120);
  uint64_t v13 = *(void *)(v33 + 200);
  uint64_t v9 = *(void *)(v33 + 136);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  swift_retain();
  swift_retain();
  swift_beginAccess();
  *(void *)(v12 + 16) = v38;
  swift_release();
  swift_endAccess();
  swift_release();
  sub_226EF593C();
  swift_retain();
  sub_226EF5AEC();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(v33 + 64) + 8);
  return v7();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_226EF8824()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_226EF8850()
{
}

double sub_226EF8894()
{
  return 0.0;
}

unint64_t sub_226EF88A8()
{
  uint64_t v2 = qword_2681610A8;
  if (!qword_2681610A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2681610A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EF8928()
{
  uint64_t v2 = qword_2681610B0;
  if (!qword_2681610B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2681610B0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_226EF89A8(uint64_t a1, unint64_t a2)
{
  return sub_226EF89F4(a1, a2);
}

uint64_t sub_226EF89F4(uint64_t a1, unint64_t a2)
{
  if (a2 > 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_226EF8A34()
{
  sub_226EFEB60();
  uint64_t v1 = sub_226EFECC0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_226EF8A84()
{
  return sub_226EFEE20();
}

uint64_t sub_226EF8AC4()
{
  return swift_deallocObject();
}

uint64_t sub_226EF8B04()
{
  return sub_226EF8A84();
}

uint64_t sub_226EF8B0C()
{
  v1[24] = v1;
  v1[25] = 0;
  memset(v1 + 7, 0, 0x28uLL);
  v1[20] = 0;
  v1[21] = 0;
  uint64_t v2 = sub_226EFEBA0();
  v1[27] = v2;
  v1[28] = *(void *)(v2 - 8);
  v1[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268161098);
  v1[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681610E8);
  v1[31] = swift_task_alloc();
  v1[25] = v0;
  return MEMORY[0x270FA2498](sub_226EF8C7C, 0);
}

uint64_t sub_226EF8C7C()
{
  v0[24] = v0;
  sub_226EF593C();
  swift_retain();
  swift_beginAccess();
  sub_226EFEC80();
  swift_endAccess();
  swift_release();
  v0[32] = __swift_instantiateConcreteTypeFromMangledName(&qword_268161058);
  sub_226EFEC80();
  swift_bridgeObjectRelease();
  sub_226EFEC50();
  memcpy(v0 + 7, v0 + 2, 0x28uLL);
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681610F0);
    sub_226EFEC70();
    uint64_t v13 = v15[18];
    uint64_t v14 = v15[19];
    v15[33] = v14;
    if (!v14) {
      break;
    }
    v15[20] = v13;
    v15[21] = v14;
    uint64_t v12 = *sub_226EF593C();
    swift_retain();
    sub_226EFEC80();
    swift_beginAccess();
    v15[34] = *(void *)(v12 + 16);
    sub_226EFEC80();
    swift_endAccess();
    v15[22] = v13;
    v15[23] = v14;
    MEMORY[0x22A66D5A0]();
    sub_226EF66B4();
    if (v15[26])
    {
      uint64_t v10 = v15[31];
      uint64_t v9 = v15[30];
      v15[35] = v15[26];
      swift_retain();
      sub_226EF8824();
      uint64_t v1 = swift_release();
      nullsub_1(v1);
      sub_226EF5520();
      uint64_t v2 = sub_226EFEB40();
      (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 56))(v9);
      sub_226EF88A8();
      sub_226EF8928();
      sub_226EF5F18();
      sub_226EF8894();
      sub_226EFEBE0();
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681610A0);
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 0, 1);
      sub_226EFEB90();
      uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))(MEMORY[0x263EFB4F8] + (int)*MEMORY[0x263EFB4F8]);
      uint64_t v4 = (void *)swift_task_alloc();
      v15[36] = v4;
      *uint64_t v4 = v15[24];
      v4[1] = sub_226EF913C;
      uint64_t v5 = v15[31];
      uint64_t v6 = v15[29];
      return v11(v5, v6);
    }
    sub_226EF8824();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  sub_226EFBD3C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v15[24] + 8);
  return v8();
}

uint64_t sub_226EF913C()
{
  uint64_t v5 = *(void *)(*(void *)v0 + 248);
  uint64_t v3 = *(void *)(*(void *)v0 + 232);
  uint64_t v2 = *(void *)(*(void *)v0 + 224);
  uint64_t v4 = *(void *)(*(void *)v0 + 216);
  *(void *)(*(void *)v0 + 192) = *(void *)v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  sub_226EFBDC0(v5);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_226EF9318, 0);
}

uint64_t sub_226EF9318()
{
  v0[24] = v0;
  while (1)
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681610F0);
    sub_226EFEC70();
    uint64_t v14 = v0[18];
    uint64_t v12 = v0[19];
    v0[33] = v12;
    if (!v12) {
      break;
    }
    v0[20] = v14;
    v0[21] = v12;
    uint64_t v13 = *sub_226EF593C();
    swift_retain();
    sub_226EFEC80();
    swift_beginAccess();
    v0[34] = *(void *)(v13 + 16);
    sub_226EFEC80();
    swift_endAccess();
    v0[22] = v14;
    v0[23] = v12;
    MEMORY[0x22A66D5A0]();
    sub_226EF66B4();
    if (v0[26])
    {
      uint64_t v10 = v0[31];
      uint64_t v9 = v0[30];
      v0[35] = v0[26];
      swift_retain();
      sub_226EF8824();
      uint64_t v1 = swift_release();
      nullsub_1(v1);
      sub_226EF5520();
      uint64_t v2 = sub_226EFEB40();
      (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 56))(v9);
      sub_226EF88A8();
      sub_226EF8928();
      sub_226EF5F18();
      sub_226EF8894();
      sub_226EFEBE0();
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681610A0);
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v3 - 8) + 56))(v10, 0, 1);
      sub_226EFEB90();
      uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))(MEMORY[0x263EFB4F8] + (int)*MEMORY[0x263EFB4F8]);
      uint64_t v4 = (void *)swift_task_alloc();
      v0[36] = v4;
      *uint64_t v4 = v0[24];
      v4[1] = sub_226EF913C;
      uint64_t v5 = v0[31];
      uint64_t v6 = v0[29];
      return v11(v5, v6);
    }
    sub_226EF8824();
    swift_bridgeObjectRelease();
    swift_release();
  }
  sub_226EFBD3C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0[24] + 8);
  return v8();
}

uint64_t sub_226EF9704()
{
  sub_226EF8824();
  uint64_t v3 = OBJC_IVAR____TtC27AXSpringBoardServerInstance22HearingActivityGateway_logger;
  uint64_t v1 = sub_226EFEC30();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

uint64_t sub_226EF9784()
{
  return swift_deallocClassInstance();
}

uint64_t sub_226EF97EC()
{
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_226EF9820, 0);
}

uint64_t sub_226EF9820()
{
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 32) = *sub_226EF5C9C();
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 40) = v1;
  *uint64_t v1 = *(void *)(v3 + 16);
  v1[1] = sub_226EF98DC;
  return sub_226EF66E0();
}

uint64_t sub_226EF98DC()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_226EF9AB0(const void *a1, void *a2)
{
  v2[3] = a2;
  v2[2] = v2;
  v2[4] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 40) = v5;
  void *v5 = *(void *)(v7 + 16);
  v5[1] = sub_226EF9B74;
  return sub_226EF97EC();
}

uint64_t sub_226EF9B74()
{
  uint64_t v5 = *v0;
  aBlock = *(void (***)(void))(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 24);
  *(void *)(v5 + 16) = *v0;
  swift_task_dealloc();

  aBlock[2]();
  _Block_release(aBlock);
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v5 + 16) + 8);
  return v1();
}

uint64_t sub_226EF9CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v15 = 0;
  uint64_t v23 = &unk_268161198;
  uint64_t v25 = &unk_2681611A8;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268161188) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v26 = (char *)&v15 - v16;
  uint64_t v2 = sub_226EFED30();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 56))(v26, 1);
  uint64_t v19 = 48;
  uint64_t v20 = 7;
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = v17;
  uint64_t v5 = (void *)v3;
  uint64_t v6 = v18;
  uint64_t v24 = v5;
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v6;
  v5[5] = v4;
  uint64_t v21 = v5[2];
  uint64_t v22 = v5[3];
  swift_unknownObjectRetain();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  uint64_t v10 = v24;
  uint64_t v11 = (uint64_t)v25;
  uint64_t v12 = (void *)v7;
  uint64_t v13 = (uint64_t)v26;
  v12[2] = v21;
  v12[3] = v8;
  v12[4] = v9;
  v12[5] = v10;
  sub_226EFA794(v13, v11, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_226EF9E88()
{
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_226EF9EBC, 0);
}

uint64_t sub_226EF9EBC()
{
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 32) = *sub_226EF5C9C();
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 40) = v1;
  *uint64_t v1 = *(void *)(v3 + 16);
  v1[1] = sub_226EF98DC;
  return sub_226EF8B0C();
}

uint64_t sub_226EFA000(const void *a1, void *a2)
{
  v2[3] = a2;
  v2[2] = v2;
  v2[4] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 40) = v5;
  void *v5 = *(void *)(v7 + 16);
  v5[1] = sub_226EF9B74;
  return sub_226EF9E88();
}

id HearingActivityProxy.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HearingActivityProxy.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for HearingActivityProxy();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id HearingActivityProxy.__deallocating_deinit()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingActivityProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_226EFA1CC()
{
  uint64_t v2 = qword_2681610B8;
  if (!qword_2681610B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2681610B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EFA248()
{
  uint64_t v2 = qword_2681610C0;
  if (!qword_2681610C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2681610C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EFA2C4()
{
  uint64_t v2 = qword_2681610C8;
  if (!qword_2681610C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2681610C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_226EFA340(uint64_t a1)
{
  if (a1) {
    return sub_226EFEDA0();
  }
  else {
    return 0;
  }
}

uint64_t sub_226EFA39C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_226EFA3B0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_226EFA3FC(uint64_t result)
{
  if (result)
  {
    sub_226EFED90();
    return sub_226EFED80();
  }
  return result;
}

void sub_226EFA46C()
{
  void *v0 = *v0;
}

uint64_t sub_226EFA478(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v7 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *id v4 = *(void *)(v6 + 16);
  v4[1] = sub_226EFA570;
  return v7();
}

uint64_t sub_226EFA570()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_226EFA69C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  void *v5 = *(void *)(v7 + 16);
  v5[1] = sub_226EFA570;
  return v8();
}

uint64_t sub_226EFA794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = sub_226EFED30();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 48))(a1, 1) == 1)
  {
    sub_226EFCBC0(a1);
  }
  else
  {
    sub_226EFED20();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  uint64_t v5 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v5)
  {
    swift_getObjectType();
    sub_226EFED10();
    swift_unknownObjectRelease();
  }
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_226EFAA04(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_226EFAB04;
  return v6(a1);
}

uint64_t sub_226EFAB04()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_226EFAC34(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_226EFAC5C(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  sub_226EFACE0(v4, v5, a3);
  uint64_t v8 = *a1;
  sub_226EFEDB0();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_226EFACE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_226EFAE54((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_226EFCD98((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x263F8DBE0];
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_226EFCD98((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    sub_226EFEC80();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_226EFAE54(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_226EFB1CC(v21, v15, a2);
          sub_226EFEDC0();
          void *v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = sub_226EFB20C(a5, a6);
    void *v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = sub_226EFEDF0();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  void *v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_226EFB1CC(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_226EFB20C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_226EFB2C0(a1, a2);
  sub_226EFB43C();
  uint64_t v4 = v6[2];
  sub_226EFB4B4(v4);
  sub_226EFB538(v4, 0);
  sub_226EFA46C();
  swift_retain();
  uint64_t v5 = sub_226EFB5A8((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_226EFB2C0(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = sub_226EFECE0();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return (void *)sub_226EFB72C();
  }
  uint64_t v5 = sub_226EFB5C0(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)sub_226EFEDE0();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    sub_226EFEC80();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_226EF66B4();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_226EFB43C()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_226EFB5A8(*v3);
    uint64_t result = sub_226EFB75C(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t sub_226EFB4B4(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = sub_226EFB75C(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_226EFB538(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  sub_226EFEC80();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

uint64_t sub_226EFB5A8(uint64_t a1)
{
  return sub_226EFBA5C(a1);
}

void *sub_226EFB5C0(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681611C0);
    uint64_t v6 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    swift_retain();
    return (void *)v3;
  }
}

uint64_t sub_226EFB72C()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  swift_retain();
  return v1;
}

uint64_t sub_226EFB75C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681611C0);
    uint64_t v8 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * (v6 - (void)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * v9;
    }
    swift_release();
    uint64_t v7 = (char *)v8;
  }
  else
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v7 = v5;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_226EFBA9C((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_226EFBA64((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_226EFBA5C(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_226EFBA64(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_226EFBA9C(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **sub_226EFBB50(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_226EFBB64()
{
  return swift_deallocObject();
}

unsigned char **sub_226EFBB90(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_226EFBB50(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_226EFBB98()
{
  return swift_deallocObject();
}

uint64_t sub_226EFBBC4()
{
  return swift_deallocObject();
}

uint64_t sub_226EFBC04()
{
  return sub_226EFAC34(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_226EFBC10()
{
  return swift_deallocObject();
}

void *sub_226EFBC50(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_226EFAC5C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_226EFBC5C()
{
  return sub_226EF8A34();
}

uint64_t sub_226EFBC64()
{
  return swift_deallocObject();
}

uint64_t sub_226EFBC90()
{
  return swift_deallocObject();
}

uint64_t sub_226EFBCBC()
{
  return swift_deallocObject();
}

uint64_t sub_226EFBCFC()
{
  return swift_deallocObject();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_226EFBD3C()
{
}

uint64_t sub_226EFBD7C()
{
  return swift_release();
}

uint64_t sub_226EFBDC0(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681610A0);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_226EFBE74()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_226EFBEBC()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v7 = *(const void **)(v0 + 16);
  size_t v6 = *(void **)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_226EFA570;
  uint64_t v3 = dword_268161100;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_268161100 + v3))(v7, v6);
}

uint64_t sub_226EFBF9C()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_226EFBFE4()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v7 = *(const void **)(v0 + 16);
  size_t v6 = *(void **)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_226EFA570;
  uint64_t v3 = dword_268161118;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_268161118 + v3))(v7, v6);
}

uint64_t type metadata accessor for HearingActivityProxy()
{
  return self;
}

unint64_t sub_226EFC0EC()
{
  return sub_226EFC104();
}

unint64_t sub_226EFC104()
{
  uint64_t v2 = qword_268161128;
  if (!qword_268161128)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161128);
    return WitnessTable;
  }
  return v2;
}

ValueMetadata *type metadata accessor for HearingActivityContentState()
{
  return &type metadata for HearingActivityContentState;
}

void *type metadata accessor for HearingActivityContentState.CodingKeys()
{
  return &unk_26DB14D08;
}

void *type metadata accessor for HearingActivityAttributes()
{
  return &unk_26DB14D28;
}

void *type metadata accessor for HearingActivityAttributes.CodingKeys()
{
  return &unk_26DB14D48;
}

uint64_t sub_226EFC1D4()
{
  return type metadata accessor for HearingActivityGateway();
}

uint64_t sub_226EFC1F0()
{
  uint64_t updated = sub_226EFEC30();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for HearingActivityProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HearingActivityProxy.start()()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v4 = *(int **)((*v0 & *MEMORY[0x263F8EED0]) + 0x50);
  size_t v6 = (uint64_t (*)(void))((char *)v4 + *v4);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_226EFA570;
  return v6();
}

uint64_t dispatch thunk of HearingActivityProxy.finish()()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v4 = *(int **)((*v0 & *MEMORY[0x263F8EED0]) + 0x58);
  size_t v6 = (uint64_t (*)(void))((char *)v4 + *v4);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_226EFA570;
  return v6();
}

unint64_t sub_226EFC560()
{
  return sub_226EFC578();
}

unint64_t sub_226EFC578()
{
  uint64_t v2 = qword_268161150;
  if (!qword_268161150)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161150);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EFC5F8()
{
  return sub_226EFC610();
}

unint64_t sub_226EFC610()
{
  uint64_t v2 = qword_268161158;
  if (!qword_268161158)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161158);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EFC690()
{
  return sub_226EF88A8();
}

unint64_t sub_226EFC6A8()
{
  return sub_226EF8928();
}

unint64_t sub_226EFC6C0()
{
  return sub_226EF5F18();
}

unint64_t sub_226EFC6D8()
{
  return sub_226EFC6F0();
}

unint64_t sub_226EFC6F0()
{
  uint64_t v2 = qword_268161160;
  if (!qword_268161160)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161160);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EFC770()
{
  return sub_226EFC788();
}

unint64_t sub_226EFC788()
{
  uint64_t v2 = qword_268161168;
  if (!qword_268161168)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161168);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EFC808()
{
  return sub_226EFC820();
}

unint64_t sub_226EFC820()
{
  uint64_t v2 = qword_268161170;
  if (!qword_268161170)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161170);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_226EFC8A0()
{
  return sub_226EFC8B8();
}

unint64_t sub_226EFC8B8()
{
  uint64_t v2 = qword_268161178;
  if (!qword_268161178)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_268161178);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_226EFC938()
{
  return swift_deallocObject();
}

uint64_t sub_226EFC980()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v7 = (int *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_226EFA570;
  uint64_t v3 = dword_268161190;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268161190 + v3))(v8, v6, v7);
}

uint64_t sub_226EFCA78()
{
  return swift_deallocObject();
}

uint64_t sub_226EFCAC0(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_226EFA570;
  uint64_t v4 = dword_2681611A0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2681611A0 + v4))(a1, v7, v8, v9);
}

uint64_t sub_226EFCBC0(uint64_t a1)
{
  uint64_t v3 = sub_226EFED30();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_226EFCC70()
{
  return swift_deallocObject();
}

uint64_t sub_226EFCCB0(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_226EFA570;
  uint64_t v4 = dword_2681611B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2681611B0 + v4))(a1, v7);
}

uint64_t sub_226EFCD98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

uint64_t sub_226EFCE30()
{
  return v0;
}

uint64_t sub_226EFCE54()
{
  return swift_deallocClassInstance();
}

uint64_t sub_226EFCE94()
{
  return sub_226EFCE30();
}

id sub_226EFCED0()
{
  sub_226EFD708();
  type metadata accessor for ResourceBundleClass();
  id result = sub_226EFCF18();
  qword_2681611C8 = (uint64_t)result;
  return result;
}

id sub_226EFCF18()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
  return v0;
}

uint64_t *sub_226EFCF70()
{
  if (qword_268161000 != -1) {
    swift_once();
  }
  return &qword_2681611C8;
}

uint64_t sub_226EFCFD4()
{
  uint64_t v2 = sub_226EFEC00();
  __swift_allocate_value_buffer(v2, qword_268161A30);
  __swift_project_value_buffer(v2, (uint64_t)qword_268161A30);
  sub_226EFECD0();
  id v0 = (id)*sub_226EFCF70();
  return sub_226EFEBF0();
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_226EFD170()
{
  if (qword_268161008 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_226EFEC00();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268161A30);
}

uint64_t sub_226EFD1E0()
{
  uint64_t v2 = sub_226EFEC00();
  __swift_allocate_value_buffer(v2, qword_268161A48);
  __swift_project_value_buffer(v2, (uint64_t)qword_268161A48);
  sub_226EFECD0();
  id v0 = (id)*sub_226EFCF70();
  return sub_226EFEBF0();
}

uint64_t sub_226EFD270()
{
  if (qword_268161010 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_226EFEC00();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268161A48);
}

uint64_t sub_226EFD2E0()
{
  uint64_t v2 = sub_226EFEC00();
  __swift_allocate_value_buffer(v2, qword_268161A60);
  __swift_project_value_buffer(v2, (uint64_t)qword_268161A60);
  sub_226EFECD0();
  id v0 = (id)*sub_226EFCF70();
  return sub_226EFEBF0();
}

uint64_t sub_226EFD370()
{
  if (qword_268161018 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_226EFEC00();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268161A60);
}

uint64_t sub_226EFD3E0()
{
  uint64_t v2 = sub_226EFEC00();
  __swift_allocate_value_buffer(v2, qword_268161A78);
  __swift_project_value_buffer(v2, (uint64_t)qword_268161A78);
  sub_226EFECD0();
  id v0 = (id)*sub_226EFCF70();
  return sub_226EFEBF0();
}

uint64_t sub_226EFD470()
{
  if (qword_268161020 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_226EFEC00();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268161A78);
}

uint64_t sub_226EFD4E0()
{
  uint64_t v2 = sub_226EFEC00();
  __swift_allocate_value_buffer(v2, qword_268161A90);
  __swift_project_value_buffer(v2, (uint64_t)qword_268161A90);
  sub_226EFECD0();
  id v0 = (id)*sub_226EFCF70();
  return sub_226EFEBF0();
}

uint64_t sub_226EFD570()
{
  if (qword_268161028 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_226EFEC00();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268161A90);
}

uint64_t sub_226EFD5E0()
{
  uint64_t v2 = sub_226EFEC00();
  __swift_allocate_value_buffer(v2, qword_268161AA8);
  __swift_project_value_buffer(v2, (uint64_t)qword_268161AA8);
  sub_226EFECD0();
  id v0 = (id)*sub_226EFCF70();
  return sub_226EFEBF0();
}

uint64_t sub_226EFD670()
{
  if (qword_268161030 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_226EFEC00();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268161AA8);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

unint64_t sub_226EFD708()
{
  uint64_t v2 = qword_2681611D0;
  if (!qword_2681611D0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2681611D0);
    return ObjCClassMetadata;
  }
  return v2;
}

void __getSiriSimpleActivationSourceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SiriActivationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardServerHelper.m", 124, @"%s", *a1);

  __break(1u);
}

void __getSiriSimpleActivationSourceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSiriSimpleActivationSourceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerHelper.m", 125, @"Unable to find class %s", "SiriSimpleActivationSource");

  __break(1u);
}

void __getPKPassLibraryClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PassKitCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardServerHelper.m", 92, @"%s", *a1);

  __break(1u);
}

void __getPKPassLibraryClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPKPassLibraryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerHelper.m", 93, @"Unable to find class %s", "PKPassLibrary");

  __break(1u);
}

void __getHUComfortSoundsSettingsClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *HearingUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardServerHelper.m", 85, @"%s", *a1);

  __break(1u);
}

void __getHUComfortSoundsSettingsClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getHUComfortSoundsSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerHelper.m", 86, @"Unable to find class %s", "HUComfortSoundsSettings");

  __break(1u);
}

void __getSOSManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SOSLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardServerHelper.m", 103, @"%s", *a1);

  __break(1u);
}

void __getSOSManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSOSManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerHelper.m", 104, @"Unable to find class %s", "SOSManager");

  __break(1u);
}

void __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityRemoteUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardServerHelper.m", 110, @"%s", *a1);

  __break(1u);
}

void __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAXRemoteViewServiceAdaptorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerHelper.m", 111, @"Unable to find class %s", "AXRemoteViewServiceAdaptor");

  __break(1u);
}

void __getAXPISystemActionHelperClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityPhysicalInteractionLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardServerHelper.m", 98, @"%s", *a1);

  __break(1u);
}

void __getAXPISystemActionHelperClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAXPISystemActionHelperClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardServerHelper.m", 99, @"Unable to find class %s", "AXPISystemActionHelper");

  __break(1u);
}

void SpringBoardHomeLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SpringBoardHomeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardServerSideAppManager.m", 19, @"%s", *a1);

  __break(1u);
}

uint64_t sub_226EFEB30()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_226EFEB40()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_226EFEB50()
{
  return MEMORY[0x270EE06B0]();
}

uint64_t sub_226EFEB60()
{
  return MEMORY[0x270EE06E8]();
}

uint64_t sub_226EFEB70()
{
  return MEMORY[0x270EE0700]();
}

uint64_t sub_226EFEB80()
{
  return MEMORY[0x270EE0740]();
}

uint64_t sub_226EFEB90()
{
  return MEMORY[0x270EE0790]();
}

uint64_t sub_226EFEBA0()
{
  return MEMORY[0x270EE0798]();
}

uint64_t sub_226EFEBB0()
{
  return MEMORY[0x270EE07A8]();
}

uint64_t sub_226EFEBC0()
{
  return MEMORY[0x270EE07B0]();
}

uint64_t sub_226EFEBD0()
{
  return MEMORY[0x270EE07C8]();
}

uint64_t sub_226EFEBE0()
{
  return MEMORY[0x270EE0828]();
}

uint64_t sub_226EFEBF0()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_226EFEC00()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_226EFEC10()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_226EFEC20()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_226EFEC30()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_226EFEC40()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_226EFEC50()
{
  return MEMORY[0x270F9D0C0]();
}

uint64_t sub_226EFEC60()
{
  return MEMORY[0x270F9D0D0]();
}

uint64_t sub_226EFEC70()
{
  return MEMORY[0x270F9D0E0]();
}

uint64_t sub_226EFEC80()
{
  return MEMORY[0x270F9D0F0]();
}

uint64_t sub_226EFEC90()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_226EFECA0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_226EFECB0()
{
  return MEMORY[0x270F9D330]();
}

uint64_t sub_226EFECC0()
{
  return MEMORY[0x270F9D618]();
}

uint64_t sub_226EFECD0()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_226EFECE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_226EFECF0()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_226EFED00()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_226EFED10()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_226EFED20()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_226EFED30()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_226EFED40()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_226EFED50()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t sub_226EFED60()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_226EFED70()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_226EFED80()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_226EFED90()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_226EFEDA0()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_226EFEDB0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_226EFEDC0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_226EFEDD0()
{
  return MEMORY[0x270F9E898]();
}

uint64_t sub_226EFEDE0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_226EFEDF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_226EFEE00()
{
  return MEMORY[0x270F9ED88]();
}

uint64_t sub_226EFEE10()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_226EFEE20()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_226EFEE30()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_226EFEE40()
{
  return MEMORY[0x270FA00B0]();
}

uint64_t sub_226EFEE50()
{
  return MEMORY[0x270FA00B8]();
}

uint64_t ASTLogCommon()
{
  return MEMORY[0x270F09130]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x270F09178]();
}

uint64_t AXCurrentProcessExistsInLoginSessionSBOnly()
{
  return MEMORY[0x270F09180]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x270F091A8]();
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

uint64_t AXDeviceIsPod()
{
  return MEMORY[0x270F091F8]();
}

uint64_t AXDeviceSupportsSideApp()
{
  return MEMORY[0x270F0A090]();
}

uint64_t AXFrontBoardFocusedAppPID()
{
  return MEMORY[0x270F096E0]();
}

uint64_t AXFrontBoardFocusedAppProcess()
{
  return MEMORY[0x270F09708]();
}

uint64_t AXFrontBoardFocusedAppProcessesForGuidedAccess()
{
  return MEMORY[0x270F09718]();
}

uint64_t AXFrontBoardFocusedApps()
{
  return MEMORY[0x270F09728]();
}

uint64_t AXFrontBoardIsSystemAppShowingAlert()
{
  return MEMORY[0x270F09730]();
}

uint64_t AXFrontBoardPurpleBuddyPID()
{
  return MEMORY[0x270F09748]();
}

uint64_t AXFrontBoardRunningAppPIDs()
{
  return MEMORY[0x270F09758]();
}

uint64_t AXFrontBoardRunningAppProcesses()
{
  return MEMORY[0x270F09768]();
}

uint64_t AXFrontBoardSystemAppAlertWindow()
{
  return MEMORY[0x270F09780]();
}

uint64_t AXFrontBoardSystemAppProcess()
{
  return MEMORY[0x270F09788]();
}

uint64_t AXHACHearingAidComplianceEnabled()
{
  return MEMORY[0x270F39478]();
}

uint64_t AXHasCapability()
{
  return MEMORY[0x270F0A130]();
}

uint64_t AXInPreboardScenario()
{
  return MEMORY[0x270F0A148]();
}

uint64_t AXIncrefSendRight()
{
  return MEMORY[0x270F0A150]();
}

uint64_t AXIsBuddyCompleted()
{
  return MEMORY[0x270F09270]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x270F09278]();
}

uint64_t AXIsPurpleBuddyFrontmost()
{
  return MEMORY[0x270F09790]();
}

uint64_t AXLocStringKeyForHomeButton()
{
  return MEMORY[0x270F0A180]();
}

uint64_t AXLocStringKeyForHomeButtonAndExclusiveModel()
{
  return MEMORY[0x270F0A188]();
}

uint64_t AXLocStringKeyForModel()
{
  return MEMORY[0x270F0A190]();
}

uint64_t AXLogAssertions()
{
  return MEMORY[0x270F092A8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXLogIPC()
{
  return MEMORY[0x270F09318]();
}

uint64_t AXLogLiveTranscription()
{
  return MEMORY[0x270F09320]();
}

uint64_t AXLogRTT()
{
  return MEMORY[0x270F09358]();
}

uint64_t AXLogSpringboardServer()
{
  return MEMORY[0x270F09398]();
}

uint64_t AXLogSystemApp()
{
  return MEMORY[0x270F093A0]();
}

uint64_t AXLogUI()
{
  return MEMORY[0x270F093C8]();
}

uint64_t AXLogUIViewService()
{
  return MEMORY[0x270F093D8]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x270F093E0]();
}

uint64_t AXLogValidations()
{
  return MEMORY[0x270F093F0]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x270F093F8]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x270F09420]();
}

uint64_t AXParameterizedLocalizedString()
{
  return MEMORY[0x270F0A240]();
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

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x270F09458]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXPidSuspend()
{
  return MEMORY[0x270F09840]();
}

uint64_t AXPidUnsuspend()
{
  return MEMORY[0x270F09848]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F094D8]();
}

uint64_t AXRuntimeCheck_HasANE()
{
  return MEMORY[0x270F094F8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXSessionIsLoginSession()
{
  return MEMORY[0x270F0A318]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x270F09560]();
}

uint64_t AXUIApplicationWindows()
{
  return MEMORY[0x270F09D80]();
}

uint64_t AXUILocalizedStringForKey()
{
  return MEMORY[0x270F09DA8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x270EE2200](inFileURL, outSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t GAXLogCommon()
{
  return MEMORY[0x270F09598]();
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x270F39078]();
}

Boolean IOHIDDeviceConformsTo(IOHIDDeviceRef device, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x270EF4058](device, *(void *)&usagePage, *(void *)&usage);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4078](device, key);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF40A0](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x270EF4540](allocator, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterInputValueCallback(IOHIDManagerRef manager, IOHIDValueCallback callback, void *context)
{
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

void IOHIDManagerUnscheduleFromRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x270F49F68]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPID()
{
  return MEMORY[0x270F49F80]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x270F49F88]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin()
{
  return MEMORY[0x270F49F90]();
}

uint64_t MRMediaRemoteGetNowPlayingClientForOrigin()
{
  return MEMORY[0x270F49FA8]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x270F4A050]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x270F4A0C8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t RBSTaskStateIsRunning()
{
  return MEMORY[0x270F5BE60]();
}

uint64_t SBSCopyInfoForApplicationWithProcessID()
{
  return MEMORY[0x270F77148]();
}

BOOL UIAccessibilityIsGuidedAccessEnabled(void)
{
  return MEMORY[0x270F82C28]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F82C70]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x270F82DE8]();
}

uint64_t UISystemFontBoldForSize()
{
  return MEMORY[0x270F82F20]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x270F095B8]();
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

uint64_t _AXSAccessibilityGetBooleaniTunesPreference()
{
  return MEMORY[0x270F90530]();
}

uint64_t _AXSAccessibilitySetiTunesPreference()
{
  return MEMORY[0x270F90550]();
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

uint64_t _AXSAssistiveTouchRepairIncarnationModeEnabled()
{
  return MEMORY[0x270F905A8]();
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

uint64_t _AXSAssistiveTouchSetHardwareEnabled()
{
  return MEMORY[0x270F905C8]();
}

uint64_t _AXSAssistiveTouchSetRepairIncarnationModeEnabled()
{
  return MEMORY[0x270F905D0]();
}

uint64_t _AXSAssistiveTouchSetUIEnabled()
{
  return MEMORY[0x270F905D8]();
}

uint64_t _AXSBackTapEnabled()
{
  return MEMORY[0x270F90620]();
}

uint64_t _AXSBackTapSetEnabled()
{
  return MEMORY[0x270F90628]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x270F90650]();
}

uint64_t _AXSClosedCaptionsSetEnabled()
{
  return MEMORY[0x270F90698]();
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return MEMORY[0x270F906B0]();
}

uint64_t _AXSCommandAndControlCarPlaySetEnabled()
{
  return MEMORY[0x270F906B8]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x270F906C8]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryNameGlobal()
{
  return MEMORY[0x270F906F0]();
}

uint64_t _AXSDefaultRouteForCall()
{
  return MEMORY[0x270F90708]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

uint64_t _AXSFullKeyboardAccessSetEnabled()
{
  return MEMORY[0x270F90770]();
}

uint64_t _AXSGuidedAccessEnabledByManagedConfiguration()
{
  return MEMORY[0x270F907A8]();
}

uint64_t _AXSGuidedAccessSetEnabledByManagedConfiguration()
{
  return MEMORY[0x270F907B8]();
}

uint64_t _AXSHomeButtonRestingUnlock()
{
  return MEMORY[0x270F90838]();
}

uint64_t _AXSHomeButtonRestingUnlockEverSet()
{
  return MEMORY[0x270F90840]();
}

uint64_t _AXSHomeButtonSetRestingUnlock()
{
  return MEMORY[0x270F90848]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x270F90880]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x270F90898]();
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return MEMORY[0x270F908B0]();
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

uint64_t _AXSLiveTranscriptionSetEnabled()
{
  return MEMORY[0x270F908D8]();
}

uint64_t _AXSMonoAudioEnabled()
{
  return MEMORY[0x270F908E0]();
}

uint64_t _AXSMonoAudioSetEnabled()
{
  return MEMORY[0x270F908E8]();
}

uint64_t _AXSPearlRestingUnlock()
{
  return MEMORY[0x270F90928]();
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return MEMORY[0x270F90938]();
}

uint64_t _AXSScreenContrast()
{
  return MEMORY[0x270F909A8]();
}

uint64_t _AXSSetLetterFeedbackEnabled()
{
  return MEMORY[0x270F90A40]();
}

uint64_t _AXSSetPhoneticFeedbackEnabled()
{
  return MEMORY[0x270F90A58]();
}

uint64_t _AXSSetSpeakThisEnabled()
{
  return MEMORY[0x270F90A88]();
}

uint64_t _AXSSetTripleClickOptions()
{
  return MEMORY[0x270F90A90]();
}

uint64_t _AXSSetWordFeedbackEnabled()
{
  return MEMORY[0x270F90AA0]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x270F90AE0]();
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

uint64_t _AXSVisualAlertEnabled()
{
  return MEMORY[0x270F90B58]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x270F90B80]();
}

uint64_t _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage()
{
  return MEMORY[0x270F90B88]();
}

uint64_t _AXSVoiceOverTouchSetUIEnabled()
{
  return MEMORY[0x270F90BB0]();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return MEMORY[0x270F90BB8]();
}

uint64_t _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity()
{
  return MEMORY[0x270F90BC0]();
}

uint64_t _AXSVoiceOverTouchSpeakingRate()
{
  return MEMORY[0x270F90BC8]();
}

uint64_t _AXSWordFeedbackEnabled()
{
  return MEMORY[0x270F90C08]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x270F90C18]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x270F095F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F82F50]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F09610]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F09658]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t hearingDeamonShouldBeRunning()
{
  return MEMORY[0x270F394C0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x270F9A550](superclass, name, extraBytes);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

void objc_registerClassPair(Class cls)
{
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

uint64_t paBluetoothDeviceSupportsSSL()
{
  return MEMORY[0x270F53630]();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodations()
{
  return MEMORY[0x270F53638]();
}

uint64_t paCurrentRouteSupportsTransparencyAccommodations()
{
  return MEMORY[0x270F53648]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x270FA04D0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}