id AXSBFloatingDockControllerFromActiveDisplayWindowScene()
{
  void *v0;
  void *v1;
  uint64_t vars8;

  v0 = AXWindowScene(@"activeDisplayWindowScene");
  v1 = [v0 safeValueForKey:@"floatingDockController"];

  return v1;
}

id AXWindowScene(void *a1)
{
  id v1 = a1;
  v2 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"windowSceneManager"];
  v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:v1];
  v5 = __UIAccessibilitySafeClass();

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
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  Class v0 = (uint64_t (*)(void))getAXRequestingClientSymbolLoc_ptr;
  v6 = getAXRequestingClientSymbolLoc_ptr;
  if (!getAXRequestingClientSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getAXRequestingClientSymbolLoc_block_invoke;
    v2[3] = &unk_265146B00;
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

void sub_2424531D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
    id v8 = [v2 localizedStringForKey:v1 value:&stru_26F785E80 table:@"Accessibility"];

    goto LABEL_5;
  }
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = MEMORY[0x24565C590]();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"SpringBoard.axbundle"];
  uint64_t v6 = [v3 bundleWithPath:v5];
  v7 = (void *)accessibilityBundle_axBundle;
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
    v7 = AXSBCurrentFolderController();
    id v8 = [v7 safeValueForKey:@"_contentView"];
    uint64_t v9 = [v8 safeIntegerForKey:@"firstIconPageIndex"];
    if (v9 - [v8 safeIntegerForKey:@"minimumPageIndex"] == a1)
    {
      v10 = @"home";
    }
    else
    {
      uint64_t v11 = [v8 safeIntegerForKey:@"leadingCustomViewPageIndex"];
      if (v11 - [v8 safeIntegerForKey:@"minimumPageIndex"] != a1)
      {
LABEL_7:

        goto LABEL_8;
      }
      v10 = @"today.visible.key";
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
  uint64_t v13 = __Block_byref_object_copy_;
  long long v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v8 = v4;
  id v9 = v5;
  AXPerformSafeBlock();
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void sub_242453B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_242453CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AXRuntimeLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AXRuntimeLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_265146B20;
    uint64_t v7 = 0;
    AXRuntimeLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
    if (AXRuntimeLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "AXRequestingClient");
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

void sub_242454748(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void soft_AXRequestingClient_cold_1()
{
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F0A320]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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