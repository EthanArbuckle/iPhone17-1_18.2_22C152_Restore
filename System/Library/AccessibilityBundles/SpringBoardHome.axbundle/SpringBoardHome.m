id AXSBIconControllerSharedInstance()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t vars8;

  if (!AXSBIconControllerSharedInstance_SharedInstance && NSClassFromString(&cfstr_Sbiconcontroll.isa))
  {
    v0 = [NSClassFromString(&cfstr_Sbiconcontroll.isa) safeValueForKey:@"sharedInstance"];
    v1 = (void *)AXSBIconControllerSharedInstance_SharedInstance;
    AXSBIconControllerSharedInstance_SharedInstance = v0;
  }
  v2 = (void *)AXSBIconControllerSharedInstance_SharedInstance;

  return v2;
}

void sub_2425C28F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425C2DE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t SBAccessibilityGridSizeComparison(void *a1, void *a2)
{
  uint64_t v3 = SBAccessibilityGridSizeComparison_onceToken;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&SBAccessibilityGridSizeComparison_onceToken, &__block_literal_global);
  }
  uint64_t v6 = [(id)SBAccessibilityGridSizeComparison_Items indexOfObject:v5];

  uint64_t v7 = [(id)SBAccessibilityGridSizeComparison_Items indexOfObject:v4];
  v8 = [NSNumber numberWithUnsignedInteger:v6];
  v9 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v10 = [v8 compare:v9];

  return v10;
}

void __SBAccessibilityGridSizeComparison_block_invoke()
{
  v5[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F79310];
  v5[0] = *MEMORY[0x263F792D0];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263F792E0];
  v5[2] = *MEMORY[0x263F792E8];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x263F792F0];
  v5[4] = *MEMORY[0x263F792D8];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:6];
  id v4 = (void *)SBAccessibilityGridSizeComparison_Items;
  SBAccessibilityGridSizeComparison_Items = v3;
}

uint64_t SBAXIsIconViewIgnoreLocation(void *a1)
{
  id v1 = a1;
  if (([v1 hasPrefix:@"SBIconLocationAppLibrary"] & 1) != 0
    || (AXSBHIconManagerFromSharedIconController(),
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 safeBoolForKey:@"isMainDisplayLibraryViewVisible"],
        v2,
        (v3 & 1) != 0))
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [v1 isEqualToString:@"SBIconLocationFloatingDockSuggestions"];
  }

  return v4;
}

void SBHAXCancelSBAXIconMoveSpeakTimer()
{
  uint64_t v0 = (void *)SBAXIconMovedFolderLabel;
  SBAXIconMovedFolderLabel = 0;

  id v1 = (void *)SBAXIconMovedIconLabel;
  SBAXIconMovedIconLabel = 0;

  [(id)SBAXIconMoveSpeakTimer invalidate];
  uint64_t v2 = (void *)SBAXIconMoveSpeakTimer;
  SBAXIconMoveSpeakTimer = 0;
}

void sub_2425C46B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2425C4828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_destroyWeak(v21);
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

void sub_2425C51FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary();
  result = dlsym(v2, "kSBHIconChangeWidgetSizeToSmallApplicationShortcutItemType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
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
    long long v3 = xmmword_265157E28;
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

void *__getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "kSBHIconChangeWidgetSizeToMediumApplicationShortcutItemType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                          + 24);
  return result;
}

void *__getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "kSBHIconChangeWidgetSizeToLargeApplicationShortcutItemType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

void *__getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "kSBHIconChangeWidgetToAppIconApplicationShortcutItemType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void sub_2425C60C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

id AXSBFloatingDockControllerFromActiveDisplayWindowScene()
{
  uint64_t v0 = AXWindowScene(@"activeDisplayWindowScene");
  id v1 = [v0 safeValueForKey:@"floatingDockController"];

  return v1;
}

id AXWindowScene(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"windowSceneManager"];
  long long v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = [v3 safeValueForKey:v1];
  uint64_t v5 = __UIAccessibilitySafeClass();

  return v5;
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
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  Class v0 = (uint64_t (*)(void))getAXRequestingClientSymbolLoc_ptr;
  uint64_t v6 = getAXRequestingClientSymbolLoc_ptr;
  if (!getAXRequestingClientSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getAXRequestingClientSymbolLoc_block_invoke;
    v2[3] = &unk_265157D98;
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

void sub_2425C6DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id AXSBHomeScreenControllerForContinuityDisplay()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v15 = 0;
  Class v0 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"windowSceneManager"];
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
      uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
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
    v9 = [v8 safeValueForKey:@"homeScreenController"];
  }
  else
  {
LABEL_9:

    id v8 = 0;
LABEL_12:
    v9 = 0;
  }

  return v9;
}

id AXSBHomeScreenOverlayController()
{
  if (AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession()) {
    AXSBHomeScreenControllerForContinuityDisplay();
  }
  else {
  Class v0 = [NSClassFromString(&cfstr_Sbiconcontroll.isa) safeValueForKey:@"sharedInstance"];
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
  Class v0 = AXSBIconControllerSharedInstance();
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
  Class v0 = AXSBIconControllerSharedInstance();
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

id AXSBMainSwitcherControllerCoordinatorSharedInstance()
{
  if (!AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance
    && NSClassFromString(&cfstr_Sbmainswitcher.isa))
  {
    uint64_t v0 = [NSClassFromString(&cfstr_Sbmainswitcher.isa) safeValueForKey:@"sharedInstanceIfExists"];
    int v1 = (void *)AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance;
    AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance = v0;
  }
  id v2 = (void *)AXSBMainSwitcherControllerCoordinatorSharedInstance_SharedInstance;

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

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  if (accessibilityBundle_axBundle)
  {
    id v2 = (id)accessibilityBundle_axBundle;
LABEL_4:
    id v8 = [v2 localizedStringForKey:v1 value:&stru_26F7E8EF8 table:@"Accessibility"];

    goto LABEL_5;
  }
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = MEMORY[0x245663BD0]();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"SpringBoard.axbundle"];
  uint64_t v6 = [v3 bundleWithPath:v5];
  uint64_t v7 = (void *)accessibilityBundle_axBundle;
  accessibilityBundle_axBundle = v6;

  id v2 = (id)accessibilityBundle_axBundle;
  if (v2) {
    goto LABEL_4;
  }
  id v8 = 0;
LABEL_5:

  return v8;
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
    uint64_t v7 = AXSBCurrentFolderController();
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

id AXSwitcherController(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = AXWindowScene(v3);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  long long v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  id v8 = v4;
  id v9 = v5;
  AXPerformSafeBlock();
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void sub_2425C76CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __AXSwitcherController_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) switcherControllerForWindowScene:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

id AXSwitcherViewController(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  AXSwitcherController(v3, v4);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_2425C7880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
    id v6 = AXWindowScene(v1);
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
    id v6 = @"favorites";
LABEL_9:
    uint64_t v7 = accessibilityLocalizedString(v6);
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"nowPlaying"])
  {
    id v6 = @"now.playing";
    goto LABEL_9;
  }
  id v6 = @"home";
  if ([v5 isEqualToString:@"home"]) {
    goto LABEL_9;
  }
  id v6 = @"connectivity";
  if ([v5 isEqualToString:@"connectivity"]) {
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"tvRemote"])
  {
    id v6 = @"tv.remote";
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_10:

  uint64_t v8 = NSString;
  id v9 = accessibilityLocalizedString(@"springboard.page.status");
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
    long long v5 = xmmword_265157F08;
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
  uint64_t result = dlsym(v2, "AXRequestingClient");
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

void sub_2425C87F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_2425CAE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2425CB028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425CB528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id initSBIconLocationNone()
{
  if (LoadSpringBoardHome_loadPredicate != -1) {
    dispatch_once(&LoadSpringBoardHome_loadPredicate, &__block_literal_global_3);
  }
  uint64_t v0 = (id *)dlsym((void *)LoadSpringBoardHome_frameworkLibrary, "SBIconLocationNone");
  objc_storeStrong((id *)&constantSBIconLocationNone, *v0);
  getSBIconLocationNone = (uint64_t (*)())SBIconLocationNoneFunction;
  id v1 = (void *)constantSBIconLocationNone;

  return v1;
}

id SBIconLocationNoneFunction()
{
  return (id)constantSBIconLocationNone;
}

void __LoadSpringBoardHome_block_invoke()
{
  LoadSpringBoardHome_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SpringBoardHome.framework/SpringBoardHome", 2);
  if (!LoadSpringBoardHome_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

void sub_2425CC334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_2425CC744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425CD1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425CDBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_2425CDF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425CE28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425CE520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425CF024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2425D0258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_2425D03EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D11C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
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

void sub_2425D1888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_2425D19B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D1B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D1D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D1EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D2104(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2425D2240(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2425D2658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  objc_destroyWeak(v20);
  _Block_object_dispose(&a20, 8);
  _Unwind_Resume(a1);
}

void sub_2425D2F34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2425D31BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_2425D3954(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2425D3C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_2425D456C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2425D4950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_2425D4C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D4E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D63DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_2425D6764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBIconLocationAppLibrary()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getSBIconLocationAppLibrarySymbolLoc_ptr;
  uint64_t v7 = getSBIconLocationAppLibrarySymbolLoc_ptr;
  if (!getSBIconLocationAppLibrarySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SpringBoardHomeLibrary_0();
    v5[3] = (uint64_t)dlsym(v1, "SBIconLocationAppLibrary");
    getSBIconLocationAppLibrarySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getSBIconLocationAppLibrary_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_2425D6A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D6BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D7020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_2425D7DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

id getSBIconLocationAppLibrarySearch()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getSBIconLocationAppLibrarySearchSymbolLoc_ptr;
  uint64_t v7 = getSBIconLocationAppLibrarySearchSymbolLoc_ptr;
  if (!getSBIconLocationAppLibrarySearchSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SpringBoardHomeLibrary_0();
    v5[3] = (uint64_t)dlsym(v1, "SBIconLocationAppLibrarySearch");
    getSBIconLocationAppLibrarySearchSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getSBIconLocationAppLibrarySearch_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_2425D7EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAPUIIconLocationAppPredictions()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getAPUIIconLocationAppPredictionsSymbolLoc_ptr;
  uint64_t v7 = getAPUIIconLocationAppPredictionsSymbolLoc_ptr;
  if (!getAPUIIconLocationAppPredictionsSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke;
    v3[3] = &unk_265157D98;
    v3[4] = &v4;
    __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke((uint64_t)v3);
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getAPUIIconLocationAppPredictions_cold_1();
  }
  uint64_t v1 = *v0;

  return v1;
}

void sub_2425D7FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBIconLocationRoot()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getSBIconLocationRootSymbolLoc_ptr;
  uint64_t v7 = getSBIconLocationRootSymbolLoc_ptr;
  if (!getSBIconLocationRootSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SpringBoardHomeLibrary_0();
    v5[3] = (uint64_t)dlsym(v1, "SBIconLocationRoot");
    getSBIconLocationRootSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getSBIconLocationRoot_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_2425D8728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425D9224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

id getSBIconLocationDock()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getSBIconLocationDockSymbolLoc_ptr;
  uint64_t v7 = getSBIconLocationDockSymbolLoc_ptr;
  if (!getSBIconLocationDockSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SpringBoardHomeLibrary_0();
    v5[3] = (uint64_t)dlsym(v1, "SBIconLocationDock");
    getSBIconLocationDockSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getSBIconLocationDock_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_2425D9418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBIconLocationAppLibraryCategoryPodExpanded()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getSBIconLocationAppLibraryCategoryPodExpandedSymbolLoc_ptr;
  uint64_t v7 = getSBIconLocationAppLibraryCategoryPodExpandedSymbolLoc_ptr;
  if (!getSBIconLocationAppLibraryCategoryPodExpandedSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SpringBoardHomeLibrary_0();
    v5[3] = (uint64_t)dlsym(v1, "SBIconLocationAppLibraryCategoryPodExpanded");
    getSBIconLocationAppLibraryCategoryPodExpandedSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getSBIconLocationAppLibraryCategoryPodExpanded_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_2425D9E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425DAFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425DB200(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2425DB758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425DCFAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_2425DD674(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2425DDCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2425DE780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBIconLocationAddWidgetSheetSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationAddWidgetSheet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationAddWidgetSheetSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpringBoardHomeLibrary_0()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __SpringBoardHomeLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    void v2[5] = v2;
    long long v3 = xmmword_2651583E8;
    uint64_t v4 = 0;
    SpringBoardHomeLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = SpringBoardHomeLibraryCore_frameworkLibrary_0;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary_0) {
    SpringBoardHomeLibrary_cold_1_0(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __SpringBoardHomeLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SpringBoardHomeLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getSBIconLocationAppLibrarySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationAppLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationAppLibrarySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBIconLocationAppLibrarySearchSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationAppLibrarySearch");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationAppLibrarySearchSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __AppPredictionUIWidgetLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265158400;
    uint64_t v6 = 0;
    AppPredictionUIWidgetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)AppPredictionUIWidgetLibraryCore_frameworkLibrary;
  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary) {
    __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "APUIIconLocationAppPredictions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAPUIIconLocationAppPredictionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppPredictionUIWidgetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppPredictionUIWidgetLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSBIconLocationRootSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationRoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationRootSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBIconLocationDockSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationDock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationDockSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBIconLocationAppLibraryCategoryPodExpandedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationAppLibraryCategoryPodExpanded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationAppLibraryCategoryPodExpandedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__getSBIconLocationFloatingDockSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationFloatingDock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationFloatingDockSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBIconLocationTodayViewSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpringBoardHomeLibrary_0();
  uint64_t result = dlsym(v2, "SBIconLocationTodayView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationTodayViewSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2425E0B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_2425E1174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_2425E12A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBIconLocationNoneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary_1)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __SpringBoardHomeLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265158480;
    uint64_t v6 = 0;
    SpringBoardHomeLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v2 = (void *)SpringBoardHomeLibraryCore_frameworkLibrary_1;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary_1) {
    __getSBIconLocationNoneSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "SBIconLocationNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBIconLocationNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardHomeLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SpringBoardHomeLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void SpringBoardHomeLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *SpringBoardHomeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIActionAccessibility.m", 18, @"%s", *a1);

  __break(1u);
}

void soft_AXRequestingClient_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"AXRequestingClientType soft_AXRequestingClient(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSpringBoardUtilities.m", 11, @"%s", dlerror());

  __break(1u);
}

void __getAXRequestingClientSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AXRuntimeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardUtilities.m", 10, @"%s", *a1);

  __break(1u);
}

void getSBIconLocationAppLibrary_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationAppLibrary(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 27, @"%s", dlerror());

  __break(1u);
}

void getSBIconLocationAppLibrarySearch_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationAppLibrarySearch(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 29, @"%s", dlerror());

  __break(1u);
}

void getAPUIIconLocationAppPredictions_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAPUIIconLocationAppPredictions(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 35, @"%s", dlerror());

  __break(1u);
}

void getSBIconLocationRoot_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationRoot(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 32, @"%s", dlerror());

  __break(1u);
}

void getSBIconLocationDock_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationDock(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 24, @"%s", dlerror());

  __break(1u);
}

void getSBIconLocationAppLibraryCategoryPodExpanded_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationAppLibraryCategoryPodExpanded(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 30, @"%s", dlerror());

  __break(1u);
}

void SpringBoardHomeLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *SpringBoardHomeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBIconViewAccessibility.m", 23, @"%s", *a1);

  __break(1u);
}

void __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AppPredictionUIWidgetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBIconViewAccessibility.m", 34, @"%s", *a1);

  __break(1u);
}

void __getSBIconLocationNoneSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *SpringBoardHomeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBHProxiedApplicationPlaceholderAccessibility.m", 16, @"%s", *a1);

  __break(1u);
  AXCFormattedString();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09F10]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x270F09FE8]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXForceTouchAvailableAndEnabled()
{
  return MEMORY[0x270F0A0D0]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F0A1B8]();
}

uint64_t AXLogSpringboardServer()
{
  return MEMORY[0x270F0A208]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x270F0A220]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F0A250]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXProcessIsCarPlay()
{
  return MEMORY[0x270F0A2B0]();
}

uint64_t AXProcessIsPosterBoard()
{
  return MEMORY[0x270F0A2C0]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F0A2E8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t AXSpokenNameLabelForBundleURL()
{
  return MEMORY[0x270F09798]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F0A320]();
}

uint64_t AX_CGRectAlmostEqualToRect()
{
  return MEMORY[0x270F0A398]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x270F0A3B0]();
}

uint64_t CCUINumberOfColumnsForGridSizeClass()
{
  return MEMORY[0x270F18888]();
}

uint64_t CCUINumberOfRowsForGridSizeClass()
{
  return MEMORY[0x270F18890]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t UIAXFormatFloatWithPercentage()
{
  return MEMORY[0x270F808D8]();
}

uint64_t UIAXFormatInteger()
{
  return MEMORY[0x270F808E0]();
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
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

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x270F80A18]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x270F06250]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x270F09968]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityCustomActionLaunchAppFloatImage()
{
  return MEMORY[0x270F80AA0]();
}

uint64_t _UIAccessibilityCustomActionLaunchAppPinLeftImage()
{
  return MEMORY[0x270F80AA8]();
}

uint64_t _UIAccessibilityCustomActionLaunchAppPinRightImage()
{
  return MEMORY[0x270F80AB0]();
}

uint64_t _UIAccessibilityIgnoreNextNotification()
{
  return MEMORY[0x270F80AC8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}