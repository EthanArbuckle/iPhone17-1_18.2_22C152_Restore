id accessibilitySBLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)MEMORY[0x263F086E0];
  v3 = MEMORY[0x245649FE0]();
  v4 = [v3 stringByAppendingPathComponent:@"System/Library/AccessibilityBundles/SpringBoard.axbundle"];
  v5 = [v2 bundleWithPath:v4];

  if (v5)
  {
    v6 = [v5 localizedStringForKey:v1 value:&stru_26F688DC8 table:@"Accessibility"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_2420BFA6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2420BFB38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id AXSBFloatingDockControllerFromActiveDisplayWindowScene()
{
  v0 = AXWindowScene(@"activeDisplayWindowScene");
  v1 = [v0 safeValueForKey:@"floatingDockController"];

  return v1;
}

id AXWindowScene(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"windowSceneManager"];
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
    v2[3] = &unk_26511B670;
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

void sub_2420C0624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
    id v8 = [v2 localizedStringForKey:v1 value:&stru_26F688DC8 table:@"Accessibility"];

    goto LABEL_5;
  }
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = MEMORY[0x245649F70]();
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

void sub_2420C0F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_2420C1148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
    long long v5 = xmmword_26511B690;
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

void sub_2420C25B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2420C2CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2420C2DA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2420C3684(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2420C37B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2420C3A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2420C3B18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
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
  id v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AXRuntimeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSpringBoardUtilities.m", 10, @"%s", *a1);

  __break(1u);
  AXDeviceIsPad();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x270F0A0B0]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F0A1B8]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
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

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
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

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F062A8]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F0A428]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}