uint64_t __AXSwitcherController_block_invoke(uint64_t a1)
{
  uint64_t vars8;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) switcherControllerForWindowScene:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

void sub_2425641A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242564278(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  if (accessibilityBundle_axBundle)
  {
    id v2 = (id)accessibilityBundle_axBundle;
LABEL_4:
    v8 = [v2 localizedStringForKey:v1 value:&stru_26F7D3690 table:@"Accessibility"];

    goto LABEL_5;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = MEMORY[0x245662C20]();
  v5 = [v4 stringByAppendingPathComponent:@"SpringBoard.axbundle"];
  uint64_t v6 = [v3 bundleWithPath:v5];
  v7 = (void *)accessibilityBundle_axBundle;
  accessibilityBundle_axBundle = v6;

  id v2 = (id)accessibilityBundle_axBundle;
  if (v2) {
    goto LABEL_4;
  }
  v8 = 0;
LABEL_5:

  return v8;
}

id AXSwitcherController(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = AXWindowScene(v3);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v8 = v4;
  id v9 = v5;
  AXPerformSafeBlock();
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void sub_2425655F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXWindowScene(void *a1)
{
  id v1 = a1;
  id v2 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"windowSceneManager"];
  id v3 = __UIAccessibilitySafeClass();

  id v4 = [v3 safeValueForKey:v1];
  v5 = __UIAccessibilitySafeClass();

  return v5;
}

id AXSBMainSwitcherControllerCoordinatorSharedInstance()
{
  if (!AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance
    && NSClassFromString(&cfstr_Sbmainswitcher.isa))
  {
    uint64_t v0 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
    id v1 = (void *)AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance;
    AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance = v0;
  }
  id v2 = (void *)AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance;

  return v2;
}

uint64_t _appTransitionOccurred()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void sub_2425664A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

uint64_t ___appTransitionOccurred_block_invoke()
{
  if (__axClient) {
    return +[AXSpringBoardGlue toggleVoiceOverInfoPanel];
  }
  return result;
}

void sub_2425665BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_242566BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 184));
  _Unwind_Resume(a1);
}

void sub_242566D48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242566E7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242566FB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2425670E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2425675DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _frontBoardCategoriesDidInstall()
{
  uint64_t v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 installSafeCategories:&__block_literal_global_1423 afterDelay:@"SB - SpringBoardAccessibility" validationTargetName:@"SB - SpringBoardAccessibility" overrideProcessName:0.0];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263F21468];

  CFNotificationCenterRemoveObserver(LocalCenter, 0, v2, 0);
}

uint64_t _StackshotTaken()
{
  v2[1] = *MEMORY[0x263EF8340];
  uint64_t result = UIAccessibilityIsVoiceOverRunning();
  if (result)
  {
    if (_StackshotTaken_onceToken != -1) {
      dispatch_once(&_StackshotTaken_onceToken, &__block_literal_global_1434);
    }
    uint64_t v1 = *MEMORY[0x263EFC0F0];
    v2[0] = &unk_26F7E5E60;
    [NSDictionary dictionaryWithObjects:v2 forKeys:&v1 count:1];
    return AudioServicesPlaySystemSoundWithOptions();
  }
  return result;
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

uint64_t AXSpringBoardFrameworkGlueSBLockScreenControllerInstance()
{
  if (AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_onceToken != -1) {
    dispatch_once(&AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_onceToken, &__block_literal_global_1391);
  }
  Class v0 = (void *)AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_SBLockScreenManagerClass;

  return [v0 safeValueForKey:@"sharedInstanceIfExists"];
}

Class __AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Sblockscreenma.isa);
  AXSpringBoardFrameworkGlueSBLockScreenControllerInstance_SBLockScreenManagerClass = (uint64_t)result;
  return result;
}

uint64_t AXSpringBoardIsAssistantVisible()
{
  uint64_t v0 = [NSClassFromString(&cfstr_Sbassistantcon.isa) safeBoolForKey:@"isVisible"];
  uint64_t v1 = [NSClassFromString(&cfstr_Sbassistantcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
  CFStringRef v2 = v1;
  if (v0) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    id v4 = [v1 safeValueForKey:@"currentSession"];
    v5 = [v4 safeValueForKey:@"presentationContext"];
    uint64_t v0 = [v5 safeIntForKey:@"modality"] - 4 < 0xFFFFFFFE;
  }
  return v0;
}

Class AXSpringBoardGlueSBTelephonyManagerClass()
{
  Class v0 = (Class)AXSpringBoardGlueSBTelephonyManagerClass_class;
  if (!AXSpringBoardGlueSBTelephonyManagerClass_class)
  {
    Class v0 = NSClassFromString(&cfstr_Sbtelephonyman.isa);
    AXSpringBoardGlueSBTelephonyManagerClass_class = (uint64_t)v0;
  }

  return v0;
}

Class AXSpringBoardGlueSBUIControllerClass()
{
  Class v0 = (Class)AXSpringBoardGlueSBUIControllerClass_class;
  if (!AXSpringBoardGlueSBUIControllerClass_class)
  {
    Class v0 = NSClassFromString(&cfstr_Sbuicontroller.isa);
    AXSpringBoardGlueSBUIControllerClass_class = (uint64_t)v0;
  }

  return v0;
}

id AXSBUIControllerSharedInstance()
{
  Class v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  if (!AXSBUIControllerSharedInstance_SharedInstance)
  {
    uint64_t v1 = [NSClassFromString(&cfstr_Sbuicontroller.isa) safeValueForKey:@"sharedInstanceIfExists"];
    CFStringRef v2 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
    AXSBUIControllerSharedInstance_SharedInstance = v1;

    Class v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  }

  return v0;
}

id AXSBLockScreenViewController()
{
  Class v0 = AXSBLockScreenEnvironment();
  uint64_t v1 = [v0 safeValueForKey:@"rootViewController"];

  return v1;
}

BOOL AXSpringBoardIsReadyToBeProbed()
{
  Class v0 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];
  BOOL v1 = v0 != 0;

  return v1;
}

Class AXSpringBoardGlueSBPlatformController()
{
  Class v0 = (Class)AXSpringBoardGlueSBPlatformController_class;
  if (!AXSpringBoardGlueSBPlatformController_class)
  {
    Class v0 = NSClassFromString(&cfstr_Sbplatformcont.isa);
    AXSpringBoardGlueSBPlatformController_class = (uint64_t)v0;
  }

  return v0;
}

uint64_t ___frontBoardCategoriesDidInstall_block_invoke(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"SpringBoardAccessibility" canInteractWithTargetClass:1];
}

id AXSBFloatingDockControllerFromActiveDisplayWindowScene()
{
  Class v0 = AXWindowScene(@"activeDisplayWindowScene");
  BOOL v1 = [v0 safeValueForKey:@"floatingDockController"];

  return v1;
}

Class AXSpringBoardGlueSBIconControllerClass()
{
  Class v0 = (Class)AXSpringBoardGlueSBIconControllerClass_class;
  if (!AXSpringBoardGlueSBIconControllerClass_class)
  {
    Class v0 = NSClassFromString(&cfstr_Sbiconcontroll.isa);
    AXSpringBoardGlueSBIconControllerClass_class = (uint64_t)v0;
  }

  return v0;
}

uint64_t AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession()
{
  Class v0 = [MEMORY[0x263F22968] server];
  int v1 = [v0 isContinuitySessionActive];

  BOOL v2 = soft_AXRequestingClient() == 16 || soft_AXRequestingClient() == 2;
  return v1 & v2;
}

uint64_t soft_AXRequestingClient()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  Class v0 = (uint64_t (*)(void))getAXRequestingClientSymbolLoc_ptr;
  id v6 = getAXRequestingClientSymbolLoc_ptr;
  if (!getAXRequestingClientSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    void v2[2] = __getAXRequestingClientSymbolLoc_block_invoke;
    v2[3] = &unk_265153E40;
    v2[4] = &v3;
    __getAXRequestingClientSymbolLoc_block_invoke((uint64_t)v2);
    Class v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXRequestingClient_cold_1();
  }
  return v0();
}

void sub_24256D404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXSBHIconManagerFromSharedIconController()
{
  Class v0 = AXSBIconControllerSharedInstance();
  if (AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession())
  {
    int v1 = AXSBHomeScreenControllerForContinuityDisplay();
    BOOL v2 = [v1 safeValueForKey:@"iconManager"];
  }
  else
  {
    BOOL v2 = [v0 safeValueForKey:@"iconManager"];
  }

  return v2;
}

id AXSBIconControllerSharedInstance()
{
  if (!AXSBIconControllerSharedInstance_SharedInstance && NSClassFromString(&cfstr_Sbiconcontroll.isa))
  {
    uint64_t v0 = [NSClassFromString(&cfstr_Sbiconcontroll.isa) safeValueForKey:@"sharedInstance"];
    int v1 = (void *)AXSBIconControllerSharedInstance_SharedInstance;
    AXSBIconControllerSharedInstance_SharedInstance = v0;
  }
  BOOL v2 = (void *)AXSBIconControllerSharedInstance_SharedInstance;

  return v2;
}

id AXSBHomeScreenControllerForContinuityDisplay()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v15 = 0;
  uint64_t v0 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"windowSceneManager"];
  int v1 = __UIAccessibilitySafeClass();

  [v1 safeSetForKey:@"connectedWindowScenes"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
      if (objc_msgSend(v7, "safeBoolForKey:", @"isContinuityDisplayWindowScene", (void)v11)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v8 = v7;

    if (!v8) {
      goto LABEL_12;
    }
    id v9 = [v8 safeValueForKey:@"homeScreenController"];
  }
  else
  {
LABEL_9:

    id v8 = 0;
LABEL_12:
    id v9 = 0;
  }

  return v9;
}

id AXSBHomeScreenOverlayController()
{
  if (AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession()) {
    AXSBHomeScreenControllerForContinuityDisplay();
  }
  else {
  uint64_t v0 = [NSClassFromString(&cfstr_Sbiconcontroll.isa) safeValueForKey:@"sharedInstance"];
  }
  int v1 = [v0 safeValueForKey:@"homeScreenOverlayController"];

  return v1;
}

id AXSBCurrentFolderController()
{
  if (AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession()) {
    AXSBHomeScreenControllerForContinuityDisplay();
  }
  else {
  uint64_t v0 = AXSBIconControllerSharedInstance();
  }
  int v1 = [v0 safeValueForKey:@"_currentFolderController"];

  return v1;
}

id AXSBRootFolderController()
{
  if (AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession()) {
    AXSBHomeScreenControllerForContinuityDisplay();
  }
  else {
  uint64_t v0 = AXSBIconControllerSharedInstance();
  }
  int v1 = [v0 safeValueForKey:@"_rootFolderController"];

  return v1;
}

id AXSBAssistantControllerSharedInstance()
{
  if (!AXSBAssistantControllerSharedInstance_SharedInstance && NSClassFromString(&cfstr_Sbassistantcon.isa))
  {
    uint64_t v0 = [NSClassFromString(&cfstr_Sbassistantcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
    int v1 = (void *)AXSBAssistantControllerSharedInstance_SharedInstance;
    AXSBAssistantControllerSharedInstance_SharedInstance = v0;
  }
  id v2 = (void *)AXSBAssistantControllerSharedInstance_SharedInstance;

  return v2;
}

id AXSBApplicationControllerSharedInstance()
{
  uint64_t v0 = (void *)AXSBApplicationControllerSharedInstance_SharedInstance;
  if (!AXSBApplicationControllerSharedInstance_SharedInstance)
  {
    uint64_t v1 = [NSClassFromString(&cfstr_Sbapplicationc.isa) safeValueForKey:@"sharedInstance"];
    id v2 = (void *)AXSBApplicationControllerSharedInstance_SharedInstance;
    AXSBApplicationControllerSharedInstance_SharedInstance = v1;

    uint64_t v0 = (void *)AXSBApplicationControllerSharedInstance_SharedInstance;
  }

  return v0;
}

id AXSBScrollDescriptionForCurrentPage(uint64_t a1)
{
  id v2 = AXSBIconControllerSharedInstance();
  uint64_t v3 = [v2 safeIntegerForKey:@"_accessibilityIconListCount"];
  uint64_t v4 = NSString;
  uint64_t v5 = accessibilityLocalizedString(@"springboard.page.status");
  uint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a1, v3);

  if (AXSBFolderControllerIsRootFolder())
  {
    v7 = AXSBCurrentFolderController();
    id v8 = [v7 safeValueForKey:@"_contentView"];
    uint64_t v9 = [v8 safeIntegerForKey:@"firstIconPageIndex"];
    if (v9 - [v8 safeIntegerForKey:@"minimumPageIndex"] == a1)
    {
      uint64_t v10 = @"home";
    }
    else
    {
      uint64_t v11 = [v8 safeIntegerForKey:@"leadingCustomViewPageIndex"];
      if (v11 - [v8 safeIntegerForKey:@"minimumPageIndex"] != a1)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v10 = @"today.visible.key";
    }
    long long v12 = accessibilityLocalizedString(v10);
    uint64_t v13 = __UIAXStringForVariables();

    uint64_t v6 = (void *)v13;
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

BOOL AXSBFolderControllerIsRootFolder()
{
  uint64_t v0 = AXSBCurrentFolderController();
  BOOL v1 = [v0 safeUnsignedIntegerForKey:@"_depth"] == 0;

  return v1;
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

id AXSwitcherViewController(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  AXSwitcherController(v3, v4);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  long long v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_24256DC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AXSwitcherViewController_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) safeValueForKey:@"switcherViewController"];

  return MEMORY[0x270F9A758]();
}

id AXLibraryViewController(void *a1)
{
  id v1 = a1;
  id v2 = AXSBIconControllerSharedInstance();
  id v3 = [v2 safeValueForKey:@"overlayLibraryViewController"];

  id v4 = AXSBIconControllerSharedInstance();
  int v5 = [v4 safeBoolForKey:@"isModalAppLibrarySupported"];

  if (v5)
  {
    uint64_t v6 = AXWindowScene(v1);
    uint64_t v7 = [v6 safeValueForKeyPath:@"modalLibraryController.libraryViewController"];

    id v3 = (void *)v7;
  }

  return v3;
}

id AXControlCenterPageStatus(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 isEqualToString:@"favorite"])
  {
    uint64_t v6 = @"favorites";
LABEL_9:
    uint64_t v7 = accessibilityLocalizedString(v6);
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"nowPlaying"])
  {
    uint64_t v6 = @"now.playing";
    goto LABEL_9;
  }
  uint64_t v6 = @"home";
  if ([v5 isEqualToString:@"home"]) {
    goto LABEL_9;
  }
  uint64_t v6 = @"connectivity";
  if ([v5 isEqualToString:@"connectivity"]) {
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"tvRemote"])
  {
    uint64_t v6 = @"tv.remote";
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_10:

  uint64_t v8 = NSString;
  uint64_t v9 = accessibilityLocalizedString(@"springboard.page.status");
  uint64_t v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, a1 + 1, a2);
  uint64_t v11 = __UIAXStringForVariables();

  return v11;
}

void *__getAXRequestingClientSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AXRuntimeLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __AXRuntimeLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265153E60;
    uint64_t v6 = 0;
    AXRuntimeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
  if (!AXRuntimeLibraryCore_frameworkLibrary) {
    __getAXRequestingClientSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "AXRequestingClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXRequestingClientSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXRuntimeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXRuntimeLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_24256EE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_24256FC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_242570270(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2425703EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257190C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242572D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242573FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_242575594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
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

void sub_2425763A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_242579D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257A05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_24257A348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257A748(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_24257A828(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24257A9B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24257AE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257B92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257BB90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

void sub_24257BDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257CF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257DCD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_24257E2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24257E838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24257F360(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2425870EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_242587930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242587C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_242588240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_242588780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t _SERVER_SBVOTMIGRegisterSpringBoardVoiceOver(mach_port_t a1, _DWORD *a2)
{
  *(void *)name = 0;
  id v4 = (ipc_space_t *)MEMORY[0x263EF8960];
  uint64_t v5 = *MEMORY[0x263EF8960];
  int v8 = 1;
  mach_port_allocate(v5, 1u, &name[1]);
  mach_port_insert_right(v5, name[1], name[1], 0x14u);
  MEMORY[0x245663370](v5, name[1], 1, &v8, 4);
  mach_port_request_notification(*v4, name[1], 72, 0, a1, 0x15u, name);
  uint64_t v6 = +[SBVoiceOverTouchConnection defaultConnection];
  [v6 _registerVOTConnectionWithPort:name[1]];

  *a2 = name[1];
  return 0;
}

uint64_t _SERVER_SBVOTMIGPostSpringBoardVoiceOverData(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, unsigned int a6)
{
  if (!_SBVOTPort) {
    return 5;
  }
  AXUnserializeWrapper();
  if (a2 > 1520)
  {
    if (a2 == 1521)
    {
      uint64_t v9 = +[SBVoiceOverTouchConnection defaultConnection];
      objc_msgSend(v9, "_programmaticAppSwitch:", objc_msgSend(0, "BOOLValue"));
    }
    else
    {
      if (a2 != 1524) {
        goto LABEL_19;
      }
      uint64_t v15 = [0 BOOLValue];
      uint64_t v9 = +[SBVoiceOverTouchConnection defaultConnection];
      [v9 setInVoiceOverPassthroughMode:v15];
    }
LABEL_18:

    goto LABEL_19;
  }
  if (a2 == 1512)
  {
    uint64_t v9 = +[SBVoiceOverTouchConnection defaultConnection];
    objc_msgSend(v9, "setScreenCurtainEnabled:", objc_msgSend(0, "BOOLValue"));
    goto LABEL_18;
  }
  if (a2 == 1519)
  {
    uint64_t v9 = +[AXSpringBoardGlue sharedInstance];
    if (([v9 isUILocked] & 1) == 0)
    {
      BOOL v10 = +[AXSpringBoardGlue isBuddyRunning];

      if (v10) {
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![0 count]) {
        goto LABEL_19;
      }
      uint64_t v11 = [0 objectAtIndex:0];
      uint64_t v12 = [v11 BOOLValue];

      uint64_t v9 = 0;
      if ([0 count] == 2)
      {
        uint64_t v9 = [0 objectAtIndex:1];
      }
      uint64_t v13 = +[SBVoiceOverTouchConnection defaultConnection];
      [v13 setLabelElementPanelVisible:v12 initialValue:v9];
    }
    goto LABEL_18;
  }
LABEL_19:
  if (a5)
  {
    if (a6) {
      munmap(a5, a6);
    }
  }
  return 0;
}

void _voiceOverTouchDied()
{
  uint64_t v0 = (void *)MEMORY[0x2456633D0]();
  LOBYTE(v2) = 1;
  _AXLogWithFacility();
  uint64_t v1 = +[SBVoiceOverTouchConnection defaultConnection];
  [v1 tearDownVoiceOverTouchConnection];
}

void sub_24258BEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24258C848(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void sub_24258FBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242590440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
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

void sub_242590D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242591630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242591A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242591D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXSpringBoardScreenCurtainEnabled()
{
  return _SBAXScreenCurtainEnabled;
}

uint64_t AXSpringBoardSetScreenCurtainIsBeingEnabled(uint64_t result)
{
  _IsScreenCurtainBeingEnabled = result;
  return result;
}

uint64_t AXSpringBoardScreenCurtainIsBeingEnabled()
{
  return _IsScreenCurtainBeingEnabled;
}

uint64_t AXSpringBoardSetScreenCurtainEnabled(uint64_t result)
{
  if (_SBAXScreenCurtainEnabled != result)
  {
    char v1 = result;
    _IsScreenCurtainBeingEnabled = 1;
    uint64_t v2 = [MEMORY[0x263F22968] server];
    int v3 = [v2 isScreenLockedWithPasscode:0];

    if (v3) {
      AXPerformSafeBlock();
    }
    _SBAXScreenCurtainEnabled = v1;
    uint64_t result = AXPerformSafeBlock();
    _IsScreenCurtainBeingEnabled = 0;
  }
  return result;
}

void __AXSpringBoardSetScreenCurtainEnabled_block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [NSClassFromString(&cfstr_Sblockscreenma.isa) safeValueForKey:@"sharedInstanceIfExists"];
  uint64_t v2 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
  v3[0] = MEMORY[0x263EFFA88];
  char v1 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 unlockUIFromSource:8 withOptions:v1];
}

void __AXSpringBoardSetScreenCurtainEnabled_block_invoke_2()
{
  BKSHIDServicesSetBacklightFactorWithFadeDuration();
  id v0 = [NSClassFromString(&cfstr_Sbbacklightcon.isa) safeValueForKey:@"sharedInstanceIfExists"];
  [v0 setBacklightState:1 source:1 animated:1 completion:&__block_literal_global_1043];
}

id accessibilityBundle()
{
  id v0 = (void *)accessibilityBundle_axBundle_0;
  if (!accessibilityBundle_axBundle_0)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v2 = (void *)accessibilityBundle_axBundle_0;
    accessibilityBundle_axBundle_0 = v1;

    id v0 = (void *)accessibilityBundle_axBundle_0;
  }

  return v0;
}

double SBMainScreenSize()
{
  if ((SBMainScreenSize_DidInit & 1) == 0)
  {
    id v0 = [MEMORY[0x263F1C920] mainScreen];
    [v0 bounds];
    SBMainScreenSize_ScreenSize_0 = v1;
    SBMainScreenSize_ScreenSize_1 = v2;

    SBMainScreenSize_DidInit = 1;
  }
  return *(double *)&SBMainScreenSize_ScreenSize_0;
}

id AXSBLayoutState()
{
  id v0 = [MEMORY[0x263F21DB8] sharedServerHelper];
  uint64_t v1 = [v0 sceneLayoutState];

  return v1;
}

id AXSpringBoardFloatingAppLabel()
{
  id v0 = AXSpringBoardAppForLayoutRole(3);
  uint64_t v1 = [v0 safeStringForKey:@"displayName"];

  return v1;
}

id AXSpringBoardAppForLayoutRole(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F21DB8] sharedServerHelper];
  int v3 = [v2 appForLayoutRole:a1];

  return v3;
}

id AXSpringBoardSideAppLabel()
{
  id v0 = AXSpringBoardAppForLayoutRole(2);
  uint64_t v1 = [v0 safeStringForKey:@"displayName"];

  return v1;
}

id AXSpringBoardPrimaryAppLabel()
{
  id v0 = AXSpringBoardAppForLayoutRole(1);
  uint64_t v1 = [v0 safeStringForKey:@"displayName"];

  return v1;
}

id AXSpringBoardFloatingBundleID()
{
  id v0 = AXSpringBoardAppForLayoutRole(3);
  uint64_t v1 = [v0 safeStringForKey:@"bundleIdentifier"];

  return v1;
}

id AXSpringBoardSideAppBundleID()
{
  id v0 = AXSpringBoardAppForLayoutRole(2);
  uint64_t v1 = [v0 safeStringForKey:@"bundleIdentifier"];

  return v1;
}

id AXSpringBoardPrimaryBundleID()
{
  id v0 = AXSpringBoardAppForLayoutRole(1);
  uint64_t v1 = [v0 safeStringForKey:@"bundleIdentifier"];

  return v1;
}

Class __getFCActivityManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!FocusLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    void v3[2] = (void *)3221225472;
    v3[3] = __FocusLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_265154780;
    uint64_t v5 = 0;
    FocusLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FocusLibraryCore_frameworkLibrary) {
    __getFCActivityManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("FCActivityManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFCActivityManagerClass_block_invoke_cold_2();
  }
  getFCActivityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FocusLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FocusLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2425941E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_242595E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t (*SBVOTDefs_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 6738136) >= 0xFFFFFFFE) {
    return _SERVER_SBVOTMIGSBVOTDefs_subsystem[5 * (v1 - 6738134) + 5];
  }
  else {
    return 0;
  }
}

_DWORD *_XRegisterSpringBoardVoiceOver(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(void *)(a2 + 32) = 0x10000000000000;
  uint64_t result = (_DWORD *)_SERVER_SBVOTMIGRegisterSpringBoardVoiceOver(result[3], (_DWORD *)(a2 + 28));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return result;
  }
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 40;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XPostSpringBoardVoiceOverData(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  unsigned int v4 = *(_DWORD *)(result + 4);
  if (v4 < 0x40 || v4 > 0x1040) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_15;
  }
  uint64_t v6 = *(unsigned int *)(result + 56);
  if (v6 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return result;
  }
  int v3 = -304;
  if (v4 - 64 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 64) {
    goto LABEL_3;
  }
  unsigned int v8 = *(_DWORD *)(result + 40);
  if (v8 != *(_DWORD *)(result + v7 + 60))
  {
LABEL_15:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t result = _SERVER_SBVOTMIGPostSpringBoardVoiceOverData(*(unsigned int *)(result + 12), *(_DWORD *)(result + 52), result + 60, v6, *(void **)(result + 28), v8);
  *(_DWORD *)(a2 + 32) = result;
  return result;
}

uint64_t SBVOTDefs_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 6738136) >= 0xFFFFFFFE
    && (uint64_t v5 = (void (*)(void))_SERVER_SBVOTMIGSBVOTDefs_subsystem[5 * (v4 - 6738134) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void soft_AXRequestingClient_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"AXRequestingClientType soft_AXRequestingClient(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardUtilities.m", 11, @"%s", dlerror());

  __break(1u);
}

void __getAXRequestingClientSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *AXRuntimeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardUtilities.m", 10, @"%s", *a1);

  __break(1u);
}

void __getFCActivityManagerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *FocusLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SpringBoardAccessibility.m", 46, @"%s", *a1);

  __break(1u);
}

void __getFCActivityManagerClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFCActivityManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SpringBoardAccessibility.m", 47, @"Unable to find class %s", "FCActivityManager");

  __break(1u);
  AXCFormattedString();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x270F09178]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x270F09FB0]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x270F091A8]();
}

uint64_t AXDeviceIsD7x()
{
  return MEMORY[0x270F091C8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x270F091F0]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F09248]();
}

uint64_t AXFrontBoardFocusedAppProcesses()
{
  return MEMORY[0x270F09710]();
}

uint64_t AXFrontBoardRunningAppProcesses()
{
  return MEMORY[0x270F09768]();
}

uint64_t AXFrontBoardSystemAppProcess()
{
  return MEMORY[0x270F09788]();
}

uint64_t AXGuaranteedMutableArray()
{
  return MEMORY[0x270F09268]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXLogLoading()
{
  return MEMORY[0x270F09328]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x270F09380]();
}

uint64_t AXLogSpringboardServer()
{
  return MEMORY[0x270F09398]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x270F093F8]();
}

uint64_t AXMediaLogCommon()
{
  return MEMORY[0x270F09410]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x270F90518]();
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

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x270F09458]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXProcessIsCarPlay()
{
  return MEMORY[0x270F09490]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F094D8]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSBApplicationWithIdentifier()
{
  return MEMORY[0x270F09A30]();
}

uint64_t AXSBLockScreenEnvironment()
{
  return MEMORY[0x270F09A38]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXSetPipPid()
{
  return MEMORY[0x270F09870]();
}

uint64_t AXSpokenNameLabelForBundleURL()
{
  return MEMORY[0x270F09798]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F09558]();
}

uint64_t AXTentativePidSuspend()
{
  return MEMORY[0x270F09878]();
}

uint64_t AXUIKeyboardIsOnScreen()
{
  return MEMORY[0x270F09D90]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x270F09DA0]();
}

uint64_t AXUnserializeWrapper()
{
  return MEMORY[0x270F098E0]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x270EE2200](inFileURL, outSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x270F10438]();
}

uint64_t BKSHIDEventGetSourceFromKeyboardEvent()
{
  return MEMORY[0x270F10498]();
}

uint64_t BKSHIDServicesSetBacklightFactorPending()
{
  return MEMORY[0x270F10548]();
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDuration()
{
  return MEMORY[0x270F10550]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x270EE4B00](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t FKALogCommon()
{
  return MEMORY[0x270F09590]();
}

uint64_t MSHCreateMIGServerSource()
{
  return MEMORY[0x270F09908]();
}

uint64_t MSHGetMachPortFromSource()
{
  return MEMORY[0x270F09918]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SBProgrammaticSwitchAppGestureMoveToLeft()
{
  return MEMORY[0x270F77110]();
}

uint64_t SBProgrammaticSwitchAppGestureMoveToRight()
{
  return MEMORY[0x270F77118]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x270F771E8]();
}

uint64_t UIAXFormatFloatWithPercentage()
{
  return MEMORY[0x270F808D8]();
}

uint64_t UIAXPrivateLocalizedString()
{
  return MEMORY[0x270F80918]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x270F05ED8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x270F05EE0](path, view);
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x270F05EF0](assistiveTechnologyIdentifier);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

BOOL UIAccessibilityIsSpeakScreenEnabled(void)
{
  return MEMORY[0x270F05F38]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F80A10]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x270F06250]();
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

uint64_t _AXSAccessibilityGetBooleaniTunesPreference()
{
  return MEMORY[0x270F90530]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90570]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSAssistiveTouchHardwareEnabled()
{
  return MEMORY[0x270F90598]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSForcePreferenceUpdate()
{
  return MEMORY[0x270F90750]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

uint64_t _AXSHearingAidsPaired()
{
  return MEMORY[0x270F907E8]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x270F90AE0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x270F095F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityFocusedElements()
{
  return MEMORY[0x270F80AC0]();
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F062D8]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x270F06310]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F09610]();
}

uint64_t __UIAccessibilityGetAssociatedInt()
{
  return MEMORY[0x270F09638]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F09658]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

uint64_t __UIAccessibilitySetAssociatedCopiedObject()
{
  return MEMORY[0x270F09690]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x270F096D0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8768](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x270ED8788]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x270ED9188](dirp);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x270EDA220](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x270EDA228](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}