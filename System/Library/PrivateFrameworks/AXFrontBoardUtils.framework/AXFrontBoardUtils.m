id AXLocalizedApplicationName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = (void *)MEMORY[0x263F086E0];
  v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:v2 value:&stru_26D829510 table:@"FrontBoardUtilsStrings"];

  return v4;
}

id AXApplicationNameLabelForBundleIdentifier(uint64_t a1)
{
  if (a1)
  {
    id v9 = 0;
    v1 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:a1 error:&v9];
    id v2 = v9;
    if (v2)
    {
      v3 = AXLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        AXApplicationNameLabelForBundleIdentifier_cold_1((uint64_t)v2, v3);
      }
    }
    v4 = [v1 URL];
    v5 = AXSpokenNameLabelForBundleURL(v4);

    if ([v5 length])
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [v1 localizedName];
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id AXSpokenNameLabelForBundleURL(void *a1)
{
  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x263F29C00];
    id v2 = a1;
    v3 = (void *)[[v1 alloc] initWithURL:v2];

    v4 = [v3 localizedInfoDictionary];
    v5 = [v4 objectForKey:@"CFBundleSpokenName"];

    if (![v5 length])
    {
      id v6 = [v3 infoDictionary];
      uint64_t v7 = [v6 objectForKey:@"CFBundleSpokenName"];

      v5 = (void *)v7;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id AXFrontBoardSystemAppProcess()
{
  v0 = [NSClassFromString(&cfstr_Fbprocessmanag.isa) safeValueForKey:@"sharedInstance"];
  v1 = [v0 safeValueForKey:@"systemApplicationProcess"];

  return v1;
}

id AXFrontBoardSystemAppPID()
{
  v0 = AXFrontBoardSystemAppProcess();
  v1 = [v0 safeValueForKey:@"pid"];

  return v1;
}

uint64_t AXFrontBoardFBSceneManager()
{
  Class v0 = NSClassFromString(&cfstr_Fbscenemanager.isa);

  return [(objc_class *)v0 safeValueForKey:@"sharedInstance"];
}

id AXFrontBoardSystemAppAlertWindow()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_3;
  }
  uint64_t v27 = 0;
  v28 = (double *)&v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __AXFrontBoardSystemAppAlertWindow_block_invoke;
  v25 = &unk_2647020B0;
  v26 = &v27;
  AXPerformSafeBlock();
  id v0 = *((id *)v28 + 5);
  _Block_object_dispose(&v27, 8);

  if (!v0)
  {
LABEL_3:
    uint64_t v27 = 0;
    v28 = (double *)&v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy_;
    v31 = __Block_byref_object_dispose_;
    id v32 = 0;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __AXFrontBoardSystemAppAlertWindow_block_invoke_2;
    v20 = &unk_2647020B0;
    v21 = &v27;
    AXPerformSafeBlock();
    id v0 = *((id *)v28 + 5);
    _Block_object_dispose(&v27, 8);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = v0;
  id v1 = (id)[obj countByEnumeratingWithState:&v13 objects:v33 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v1; i = (char *)i + 1)
      {
        if (*(void *)v14 != v2) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v5 = [v4 safeValueForKey:@"rootViewController"];
        id v6 = [v5 safeValueForKey:@"presentedViewController"];

        NSClassFromString(&cfstr_Uialertcontrol.isa);
        int isKindOfClass = objc_opt_isKindOfClass();
        int IsSpringBoard = AXProcessIsSpringBoard();
        if (IsSpringBoard)
        {
          NSClassFromString(&cfstr_Sbalertitemwin.isa);
          int IsSpringBoard = objc_opt_isKindOfClass();
        }
        if ((isKindOfClass | IsSpringBoard))
        {
          uint64_t v27 = 0;
          v28 = (double *)&v27;
          uint64_t v29 = 0x2020000000;
          v30 = 0;
          AXPerformSafeBlock();
          double v9 = v28[3];
          _Block_object_dispose(&v27, 8);
          uint64_t v27 = 0;
          v28 = (double *)&v27;
          uint64_t v29 = 0x2020000000;
          LOBYTE(v30) = 0;
          AXPerformSafeBlock();
          int v10 = *((unsigned __int8 *)v28 + 24);
          _Block_object_dispose(&v27, 8);
          if (v9 > 0.0 && !v10)
          {
            id v1 = v4;

            goto LABEL_18;
          }
        }
      }
      id v1 = (id)[obj countByEnumeratingWithState:&v13 objects:v33 count:16];
      if (v1) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v1;
}

void sub_224D53E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
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

uint64_t __AXFrontBoardSystemAppAlertWindow_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)*MEMORY[0x263F1D020] _accessibilityAllWindowsOnlyVisibleWindows:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __AXFrontBoardSystemAppAlertWindow_block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __AXFrontBoardSystemAppAlertWindow_block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __AXFrontBoardSystemAppAlertWindow_block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isHidden];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL AXFrontBoardIsSystemAppShowingAlert()
{
  return _AXFrontBoardIsSystemAppShowingAlertIgnoringServiceBundleIdentifiers(0);
}

BOOL _AXFrontBoardIsSystemAppShowingAlertIgnoringServiceBundleIdentifiers(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = AXFrontBoardSystemAppAlertWindow();
  BOOL v3 = v2 != 0;
  if (v2)
  {
    v4 = AXLogUIA();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      long long v13 = v2;
      _os_log_impl(&dword_224D52000, v4, OS_LOG_TYPE_INFO, "System alert window: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (AXProcessIsSpringBoard())
  {
    v5 = [NSClassFromString(&cfstr_Sbmainworkspac.isa) safeValueForKey:@"_instanceIfExists"];
    id v6 = [v5 safeValueForKey:@"transientOverlayPresentationManager"];
    uint64_t v7 = [v6 safeValueForKey:@"topmostPresentedViewController"];

    NSClassFromString(&cfstr_Sbincalltransi.isa);
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(&cfstr_Sbspotlighttra.isa), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v3 = 0;
LABEL_24:

      goto LABEL_25;
    }
    NSClassFromString(&cfstr_Sbremotetransi.isa);
    if (objc_opt_isKindOfClass())
    {
      v8 = [v7 safeValueForKeyPath:@"_hostContentAdapter.serviceBundleIdentifier"];
      if (!v7)
      {
LABEL_13:
        if (![v8 isEqualToString:*MEMORY[0x263F227A8]]) {
          goto LABEL_23;
        }
      }
    }
    else
    {
      v8 = 0;
      if (!v7) {
        goto LABEL_13;
      }
    }
    if (![v1 count]
      || (NSClassFromString(&cfstr_Sbremotetransi.isa), (objc_opt_isKindOfClass() & 1) == 0))
    {
      double v9 = AXLogUIA();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        long long v13 = v7;
        int v10 = "top most alert controller: %@";
        goto LABEL_21;
      }
LABEL_22:

      BOOL v3 = 1;
      goto LABEL_23;
    }
    if (([v1 containsObject:v8] & 1) == 0)
    {
      double v9 = AXLogUIA();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        long long v13 = v8;
        int v10 = "top most alert service identifier: %@";
LABEL_21:
        _os_log_impl(&dword_224D52000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 0xCu);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

  return v3;
}

id _AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri(char a1, void *a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v14 = 0;
  long long v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri_block_invoke;
  v9[3] = &unk_264702100;
  v9[4] = &v18;
  v9[5] = &v10;
  v9[6] = &v14;
  [v3 enumerateObjectsUsingBlock:v9];
  if (v19[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((a1 & 1) == 0 && v15[3] == v11[3])
    {
      id v6 = objc_msgSend(v4, "objectAtIndex:");
      v22[0] = v6;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      uint64_t v8 = [v7 mutableCopy];

      v4 = (void *)v8;
    }
    else
    {
      objc_msgSend(v4, "removeObjectAtIndex:");
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v4;
}

void sub_224D543C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id AXFrontBoardFocusedAppPID()
{
  id v0 = _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
  id v1 = [v0 firstObject];
  uint64_t v2 = [v1 safeValueForKey:@"pid"];

  return v2;
}

id AXFrontBoardFocusedAppPIDs()
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    _AXAssert();
  }
  id v0 = _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
  id v1 = [v0 safeValueForKey:@"state"];
  uint64_t v2 = [v1 safeValueForKey:@"pid"];

  return v2;
}

id _AXFrontBoardFrontmostAppProcesses(char a1, char a2, void *a3)
{
  id v6 = 0;
  _AXFrontBoardGetFrontmostAppProcessesAndScenes(a1, &v6, 0, a2, a3);
  id v3 = v6;
  v4 = objc_msgSend(v3, "ax_arrayByRemovingDuplicates");

  return v4;
}

id AXFrontBoardFocusedAppPIDsIgnoringSiri()
{
  id v0 = _AXFrontBoardFrontmostAppProcesses(1, 0, 0);
  id v1 = [v0 safeValueForKey:@"state"];
  uint64_t v2 = [v1 safeValueForKey:@"pid"];

  return v2;
}

id AXFrontBoardFocusedApps()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263EFF980] array];
  id v1 = _AXFrontBoardFrontmostAppProcesses(0, 1, 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = [v6 safeIntForKey:@"pid"];
        uint64_t v8 = [v6 safeStringForKey:@"bundleIdentifier"];
        uint64_t v9 = [MEMORY[0x263F22810] appWithPID:v7 bundleID:v8];
        [v0 addObject:v9];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  return v0;
}

uint64_t AXFrontBoardPurpleBuddyPID()
{
  id v0 = [MEMORY[0x263F229C8] setupProcessName];
  uint64_t v1 = AXFrontBoardPIDForApplicationWithBundleID(v0);

  return v1;
}

uint64_t AXFrontBoardPIDForApplicationWithBundleID(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = AXFrontBoardRunningAppProcesses();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "safeValueForKey:", @"bundleIdentifier", (void)v12);
        int v9 = [v8 isEqualToString:v1];

        if (v9)
        {
          uint64_t v10 = [v7 safeIntForKey:@"pid"];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0xFFFFFFFFLL;
LABEL_11:

  return v10;
}

id AXFrontBoardFocusedAppProcesses()
{
  return _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
}

id AXFrontBoardFocusedAppProcessesExcludingSiri()
{
  return _AXFrontBoardFrontmostAppProcesses(1, 0, 0);
}

id AXFrontBoardFocusedAppProcessesForGuidedAccess(char a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = @"com.apple.shortcuts.runtime";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  uint64_t v3 = _AXFrontBoardFrontmostAppProcesses(a1, 0, v2);

  return v3;
}

id AXFrontBoardVisibleAppProcesses()
{
  return _AXFrontBoardFrontmostAppProcesses(1, 1, 0);
}

id AXFrontBoardFocusedAppProcess()
{
  id v0 = _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
  id v1 = [v0 firstObject];

  return v1;
}

id AXFrontBoardSpeakThisAppPIDs()
{
  id v0 = _AXFrontBoardFrontmostAppProcesses(1, 0, 0);
  id v1 = [v0 safeValueForKey:@"pid"];

  return v1;
}

id AXFrontBoardFocusedAppPidsForContinuity()
{
  id v0 = [MEMORY[0x263EFF980] array];
  id v14 = 0;
  id v15 = 0;
  _AXFrontBoardGetFrontmostAppProcessesAndScenes(0, &v15, &v14, 0, 0);
  id v1 = v15;
  id v2 = v14;
  if ([v2 count])
  {
    unint64_t v3 = 0;
    while (v3 < [v1 count])
    {
      objc_opt_class();
      uint64_t v4 = [v2 objectAtIndexedSubscript:v3];
      uint64_t v5 = __UIAccessibilityCastAsClass();

      id v6 = [v1 objectAtIndexedSubscript:v3];
      if ([v1 count] == 1)
      {
        uint64_t v7 = AXFrontBoardSystemAppProcess();
        char v8 = [v6 isEqual:v7];

        if (v8)
        {
          [v0 addObject:v6];

          break;
        }
      }
      if (_AXFrontBoardSceneBelongsToContinuityDisplay(v5)) {
        [v0 addObject:v6];
      }

      if (++v3 >= [v2 count]) {
        break;
      }
    }
  }
  id v9 = (id)objc_msgSend(v0, "ax_arrayByRemovingDuplicates");
  uint64_t v10 = [v0 safeValueForKey:@"state"];
  long long v11 = [v10 safeValueForKey:@"pid"];
  long long v12 = __UIAccessibilitySafeClass();

  return v12;
}

void _AXFrontBoardGetFrontmostAppProcessesAndScenes(char a1, void *a2, void *a3, char a4, void *a5)
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v5 = a5;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy_;
  v103 = __Block_byref_object_dispose_;
  id v104 = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy_;
  v97 = __Block_byref_object_dispose_;
  id v98 = 0;
  id v6 = [MEMORY[0x263F3F440] sharedInstance];
  uint64_t v7 = [v6 currentLayout];
  char v8 = [v7 elements];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v105 objects:v125 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v106;
    uint64_t v12 = *MEMORY[0x263F79500];
    uint64_t v13 = *MEMORY[0x263F79508];
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v106 != v11) {
          objc_enumerationMutation(v9);
        }
        id v15 = [*(id *)(*((void *)&v105 + 1) + 8 * i) identifier];
        if ([v15 isEqualToString:v12])
        {

          int v18 = 0;
          int v17 = 1;
          goto LABEL_14;
        }
        char v16 = [v15 isEqualToString:v13];

        if (v16)
        {
          int v17 = 0;
          int v18 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v105 objects:v125 count:16];
      int v17 = 0;
      int v18 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v17 = 0;
    int v18 = 0;
  }
LABEL_14:

  v19 = AXLogUIA();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v120 = v18;
    __int16 v121 = 1024;
    int v122 = v17;
    __int16 v123 = 2112;
    id v124 = v9;
    _os_log_impl(&dword_224D52000, v19, OS_LOG_TYPE_INFO, "Spotlight status: %d, %d %@", buf, 0x18u);
  }

  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v20 = [MEMORY[0x263F3F440] sharedInstance];
  uint64_t v21 = [v20 currentLayout];
  uint64_t v22 = [v21 elements];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v105 objects:v125 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v106;
    uint64_t v25 = *MEMORY[0x263F227A8];
    while (2)
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v106 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v105 + 1) + 8 * j) identifier];
        char v28 = [v27 isEqualToString:v25];

        if (v28)
        {
          int v29 = 0;
          goto LABEL_26;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v105 objects:v125 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
  int v29 = 1;
LABEL_26:

  v30 = [MEMORY[0x263F229A0] server];
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = ___AXFrontBoardGetFrontmostAppProcessesAndScenes_block_invoke;
  v89[3] = &unk_264702178;
  v91 = &v93;
  v92 = &v99;
  id v31 = v30;
  id v90 = v31;
  id v32 = (void (**)(void))MEMORY[0x22A621BE0](v89);
  if (_AXFrontBoardIsSystemAppShowingAlertIgnoringServiceBundleIdentifiers(v5))
  {
    if ([(id)v94[5] count]) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if ((AXProcessIsCarPlay() & 1) == 0 && ([v31 isAppSwitcherVisible] & 1) != 0
    || (AXProcessIsCarPlay() & 1) == 0 && ([v31 isControlCenterVisible] & 1) != 0
    || (AXProcessIsCarPlay() & 1) == 0 && ([v31 isNotificationCenterVisible] & 1) != 0
    || ([v31 isSoftwareUpdateUIVisible] & 1) != 0
    || (AXProcessIsCarPlay() & 1) == 0 && [v31 isPasscodeLockVisible])
  {
LABEL_36:
    v32[2](v32);
    goto LABEL_37;
  }
  if ((v29 & (v17 ^ 1) & 1) == 0)
  {
    if ((v17 | v29 ^ 1) == 1)
    {
      v46 = (id *)MEMORY[0x263F227D0];
      if (!v17) {
        v46 = (id *)MEMORY[0x263F227A8];
      }
      id v43 = *v46;
    }
    else
    {
      id v43 = 0;
    }
    id v87 = 0;
    id v88 = 0;
    _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(v43, &v88, &v87);
    v38 = (AXFBFakeProcess *)v88;
    v47 = (AXFBFakeProcessState *)v87;
    v39 = v47;
    if (v38 && v47)
    {
      v118 = v38;
      uint64_t v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v118 count:1];
      v49 = (void *)v94[5];
      v94[5] = v48;

      v117 = v39;
      uint64_t v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v117 count:1];
      v51 = (void *)v100[5];
      v100[5] = v50;
    }
    goto LABEL_87;
  }
  v35 = [NSClassFromString(&cfstr_Gaxspringboard.isa) safeValueForKey:@"sharedInstanceIfExists"];
  v36 = [v35 safeValueForKey:@"isInWorkspace"];
  int v37 = [v36 BOOLValue];

  if (!v37)
  {
    v52 = [MEMORY[0x263F22968] server];
    if ([v52 isAppleWatchRemoteScreenActive])
    {
      v53 = [MEMORY[0x263F22968] server];
      char v54 = [v53 isScreenLockedWithPasscode:0];

      if ((v54 & 1) == 0)
      {
        v55 = (void *)*MEMORY[0x263F22750];
        id v85 = 0;
        id v86 = 0;
        _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(v55, &v86, &v85);
        v38 = (AXFBFakeProcess *)v86;
        v56 = (AXFBFakeProcessState *)v85;
        v39 = v56;
        if (!v38 || !v56) {
          goto LABEL_88;
        }
        v114 = v38;
        uint64_t v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
        v58 = (void *)v94[5];
        v94[5] = v57;

        v113 = v39;
        uint64_t v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
        goto LABEL_86;
      }
    }
    else
    {
    }
    v60 = _AXFrontBoardSortedNonSystemAppProcessesAndScenes(a4);
    _AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri(a1, v60);
    v38 = (AXFBFakeProcess *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v61 = (void *)*MEMORY[0x263F227D0];
      id v83 = 0;
      id v84 = 0;
      _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(v61, &v84, &v83);
      id v62 = v84;
      id v63 = v83;
      v64 = v63;
      if (v62 && v63)
      {
        v111[0] = @"scene";
        v111[1] = @"process";
        v112[0] = v63;
        v112[1] = v62;
        v65 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];
        [(AXFBFakeProcess *)v38 addObject:v65];
      }
    }
    if (AXProcessIsCarPlay()) {
      int IsCarPlay = AXProcessIsCarPlay();
    }
    else {
      int IsCarPlay = [v31 isNonExclusiveSystemUIFocusableIncludingPIPWindow:0];
    }
    int v67 = IsCarPlay;
    if ([(AXFBFakeProcess *)v38 ax_containsObjectUsingBlock:&__block_literal_global])
    {
      v68 = [MEMORY[0x263F22968] server];
      int v69 = [v68 isSpotlightVisible];

      if (v69)
      {
        v70 = AXLogUIA();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v125 = 0;
          _os_log_impl(&dword_224D52000, v70, OS_LOG_TYPE_INFO, "Spotlight frontmost, but spotlight is not visible", v125, 2u);
        }
      }
      else
      {
        int v67 = 1;
      }
    }
    if (AXProcessIsCarPlay()) {
      goto LABEL_80;
    }
    int v75 = [v31 isSiriVisible];
    v39 = 0;
    if (a1 & 1) != 0 || ((v75 ^ 1)) {
      goto LABEL_81;
    }
    if (AXDeviceIsPad())
    {
LABEL_80:
      v39 = 0;
    }
    else
    {
      v76 = AXFrontBoardSystemAppProcess();
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = ___AXFrontBoardGetFrontmostAppProcessesAndScenes_block_invoke_439;
      v81[3] = &unk_2647021C0;
      v39 = v76;
      v82 = v39;
      [(AXFBFakeProcess *)v38 ax_removeObjectsFromArrayUsingBlock:v81];
    }
LABEL_81:
    if (v67)
    {
      if (v39
        || (AXFrontBoardSystemAppProcess(), (v39 = (AXFBFakeProcessState *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v109[0] = @"scene";
        v71 = [MEMORY[0x263EFF9D0] null];
        v109[1] = @"process";
        v110[0] = v71;
        v110[1] = v39;
        v72 = [NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:2];
        [(AXFBFakeProcess *)v38 addObject:v72];
      }
    }
    uint64_t v73 = [(AXFBFakeProcess *)v38 valueForKey:@"process"];
    v74 = (void *)v94[5];
    v94[5] = v73;

    uint64_t v59 = [(AXFBFakeProcess *)v38 valueForKey:@"scene"];
LABEL_86:
    id v43 = (id)v100[5];
    v100[5] = v59;
    goto LABEL_87;
  }
  v38 = objc_alloc_init(AXFBFakeProcess);
  v39 = objc_alloc_init(AXFBFakeProcessState);
  v40 = [MEMORY[0x263F22838] server];
  -[AXFBFakeProcessState setPid:](v39, "setPid:", [v40 accessibilityUIServicePID]);

  [(AXFBFakeProcess *)v38 setState:v39];
  [(AXFBFakeProcess *)v38 setBundleIdentifier:*MEMORY[0x263F22758]];
  v116 = v38;
  uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v116 count:1];
  v42 = (void *)v94[5];
  v94[5] = v41;

  id v43 = [MEMORY[0x263EFF9D0] null];
  id v115 = v43;
  uint64_t v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
  v45 = (void *)v100[5];
  v100[5] = v44;

LABEL_87:
LABEL_88:

LABEL_37:
  v33 = [MEMORY[0x263F22968] server];
  int v34 = [v33 isRemoteAlertVisible];

  if (v34) {
    v32[2](v32);
  }
  if (![(id)v94[5] count]) {
    v32[2](v32);
  }
  if (a2) {
    *a2 = (id) v94[5];
  }
  if (a3) {
    *a3 = (id) v100[5];
  }

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);
}

void sub_224D558CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

BOOL _AXFrontBoardSceneBelongsToContinuityDisplay(void *a1)
{
  id v1 = [a1 safeValueForKey:@"parentScene"];
  BOOL v2 = 0;
  if (v1)
  {
    NSClassFromString(&cfstr_Fbsscene.isa);
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v1 accessibilityIsSceneOnContinuityDisplay]) {
      BOOL v2 = 1;
    }
  }

  return v2;
}

id AXFrontBoardSpeakThisAppPIDForPoint(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    v35 = @"Finding the Speak Screen app for portrait-up coordinate: %@";
    id v36 = v1;
    LOBYTE(v33) = 1;
    _AXLogWithFacility();
  }
  v39 = v2;
  id v40 = 0;
  id v41 = 0;
  _AXFrontBoardGetFrontmostAppProcessesAndScenes(1, &v41, &v40, 0, 0);
  id v3 = v41;
  id v4 = v40;
  uint64_t v5 = [v3 count];
  if (v5 != [v4 count])
  {
    uint64_t v33 = [v3 count];
    v35 = (__CFString *)[v4 count];
    _AXAssert();
  }
  uint64_t v6 = objc_msgSend(v4, "count", v33, v35, v36);
  if (!v6)
  {
LABEL_18:
    LOBYTE(v34) = 1;
    _AXLogWithFacility();
    id v31 = objc_msgSend(NSNumber, "numberWithInt:", getpid(), v34, @"Using system app as Speak Screen app");
    uint64_t v11 = 0;
    v30 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  id v38 = 0;
  double v9 = 0.0;
  while (1)
  {
    uint64_t v10 = [v4 objectAtIndexedSubscript:v8];
    uint64_t v11 = [v3 objectAtIndexedSubscript:v8];
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
    if (v10 == (void *)v12)
    {
      int v29 = v10;
      goto LABEL_14;
    }
    uint64_t v13 = (void *)v12;
    id v14 = [v10 accessibilitySceneIdentifier];
    char v15 = [v14 isEqualToString:@"searchBar-todayView"];

    if ((v15 & 1) == 0) {
      break;
    }
LABEL_15:

    if (v7 == ++v8) {
      goto LABEL_16;
    }
  }
  [v10 accessibilitySceneFrame];
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = v39;
  if (!v39) {
    goto LABEL_11;
  }
  CGFloat v23 = v16;
  CGFloat v24 = v17;
  [v39 CGPointValue];
  v43.x = v25;
  v43.y = v26;
  v44.origin.x = v23;
  v44.origin.y = v24;
  v44.size.width = v19;
  v44.size.height = v21;
  if (!CGRectContainsPoint(v44, v43))
  {
LABEL_11:
    double v27 = v19 * v21;
    if (v27 > v9)
    {
      id v28 = v11;
      int v29 = v38;
      id v38 = v28;
      double v9 = v27;
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v45.origin.x = v23;
  v45.origin.y = v24;
  v45.size.width = v19;
  v45.size.height = v21;
  int v37 = NSStringFromCGRect(v45);
  LOBYTE(v34) = 1;
  _AXLogWithFacility();

  if (v11)
  {
    id v31 = [v11 safeValueForKey:@"pid", v34, @"Found app %@ which contained that point in its frame %@", v11, v37];
    v30 = v38;
    goto LABEL_20;
  }
LABEL_16:
  v30 = v38;
  if (!v38) {
    goto LABEL_18;
  }
  LOBYTE(v34) = 1;
  _AXLogWithFacility();
  id v31 = [v38 safeValueForKey:@"pid", v34, @"Using app with largest area as Speak Screen app: %@", v38];
  uint64_t v11 = 0;
LABEL_19:
  uint64_t v22 = v39;
LABEL_20:

  return v31;
}

uint64_t AXFrontBoardIsSystemAppUINonExclusive()
{
  id v0 = [MEMORY[0x263F229A0] server];
  uint64_t v1 = [v0 isNonExclusiveSystemUIFocusableIncludingPIPWindow:1];

  return v1;
}

id AXFrontBoardRunningAppPIDs()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263EFF980] array];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = AXFrontBoardRunningAppProcesses();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "safeValueForKey:", @"pid", (void)v8);
        if (v6) {
          [v0 addObject:v6];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  return v0;
}

id AXFrontBoardRunningAppProcesses()
{
  id v0 = [MEMORY[0x263EFF9C0] set];
  uint64_t v1 = AXFrontBoardSystemAppProcess();
  if (v1) {
    [v0 addObject:v1];
  }
  uint64_t v2 = [NSClassFromString(&cfstr_Fbscenemanager.isa) safeValueForKey:@"sharedInstance"];
  uint64_t v7 = MEMORY[0x263EF8330];
  long long v8 = v2;
  id v3 = v0;
  long long v9 = v3;
  id v4 = v2;
  AXPerformSafeBlock();
  if (!objc_msgSend(v3, "count", v7, 3221225472, __AXFrontBoardRunningAppProcesses_block_invoke, &unk_264702150))
  {

    id v3 = 0;
  }
  uint64_t v5 = [v3 allObjects];

  return v5;
}

void __AXFrontBoardRunningAppProcesses_block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __AXFrontBoardRunningAppProcesses_block_invoke_2;
  v2[3] = &unk_264702128;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateScenesWithBlock:v2];
}

void __AXFrontBoardRunningAppProcesses_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 accessibilitySceneOwnerIsAUIApplication]
    && (([v4 accessibilityIsSceneOnMainScreen] & 1) != 0
     || [v4 accessibilityIsSceneOnExternalScreen]))
  {
    id v3 = [v4 accessibilitySceneProcess];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

uint64_t AXIsPurpleBuddyFrontmost()
{
  id v0 = AXFrontBoardFocusedAppProcess();
  uint64_t v1 = [v0 safeValueForKey:@"bundleIdentifier"];
  uint64_t v2 = [MEMORY[0x263F229C8] setupProcessName];
  uint64_t v3 = [v1 isEqualToString:v2];

  return v3;
}

void AXFrontBoardRebootDevice()
{
  id v1 = (id)[objc_alloc(MEMORY[0x263F3F4D8]) initWithReason:@"Accessibility reboot"];
  [v1 setRebootType:1];
  [v1 setSource:1];
  id v0 = [MEMORY[0x263F3F508] sharedInstance];
  [v0 shutdownUsingOptions:v1];
}

void _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F3F460];
  id v6 = a1;
  uint64_t v7 = [v5 sharedInstance];
  long long v8 = [v7 processesForBundleIdentifier:v6];

  long long v9 = [v8 firstObject];

  if (v9)
  {
    id v10 = v9;
    long long v11 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    uint64_t v12 = AXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier_cold_1(v12);
    }

    long long v11 = 0;
  }
  id v13 = v9;
  *a2 = v13;
  id v14 = v11;
  *a3 = v14;
}

id _AXFrontBoardSortedNonSystemAppProcessesAndScenes(char a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = (id *)MEMORY[0x263F1D020];
  id v4 = (id)*MEMORY[0x263F1D020];
  uint64_t v5 = AXFrontBoardSystemAppProcess();
  id v6 = [v5 bundleIdentifier];

  char v7 = [v6 isEqualToString:*MEMORY[0x263F227A0]];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke;
  v19[3] = &unk_2647021E8;
  char v22 = v7;
  char v23 = a1;
  char v24 = 0;
  id v20 = v4;
  id v8 = v2;
  id v21 = v8;
  id v9 = v4;
  id v10 = (void *)MEMORY[0x22A621BE0](v19);
  long long v11 = [NSClassFromString(&cfstr_Fbscenemanager.isa) safeValueForKey:@"sharedInstance"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_2;
  v17[3] = &unk_264702210;
  id v18 = v10;
  id v12 = v10;
  [v11 enumerateScenesWithBlock:v17];

  uint64_t v13 = [*v3 activeInterfaceOrientation];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_3;
  v16[3] = &__block_descriptor_40_e39_q24__0__NSDictionary_8__NSDictionary_16l;
  v16[4] = v13;
  [v8 sortUsingComparator:v16];
  id v14 = v8;

  return v14;
}

void sub_224D56ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const char *_stringForValidationEvent()
{
  return "AXValidateFocusedAppsEventAppStateVisibilityDidChange";
}

void sub_224D57B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224D57D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void AXApplicationNameLabelForBundleIdentifier_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224D52000, a2, OS_LOG_TYPE_ERROR, "Error fetching record: %@", (uint8_t *)&v2, 0xCu);
}

void _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_224D52000, log, OS_LOG_TYPE_ERROR, "Could not get transient process", v1, 2u);
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F0A1C8]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x270F0A220]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXPidSuspend()
{
  return MEMORY[0x270F09840]();
}

uint64_t AXPidUnsuspend()
{
  return MEMORY[0x270F09848]();
}

uint64_t AXProcessIsCarPlay()
{
  return MEMORY[0x270F0A2B0]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F0A2E8]();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  return MEMORY[0x270F09850]();
}

uint64_t AXRuntimeLogPID()
{
  return MEMORY[0x270F0A300]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t AXTentativePidSuspend()
{
  return MEMORY[0x270F09878]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F0A408]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
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

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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