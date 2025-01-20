uint64_t AXShouldCreateRemoteViewForIdentityAndSceneIdentifier(void *a1, void *a2, void *a3)
{
  char v4;
  id v7;
  id v8;
  id location;
  char v10;

  location = 0;
  objc_storeStrong(&location, a1);
  v8 = 0;
  objc_storeStrong(&v8, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  if (([v8 containsString:@"SUIS-VoiceControlUI"] & 1) != 0
    || ([v8 containsString:@"com.apple.PaperBoard-wallpaper"] & 1) != 0
    || ([v8 containsString:@"SUIS-AssistiveTouchUI"] & 1) != 0
    || ([v8 containsString:@"com.apple.accessibility.AccessibilityUIServer"] & 1) != 0
    || ([v8 containsString:@"com.apple.AccessibilityUIServer"] & 1) != 0
    || ([v8 containsString:@"com.apple.fullkeyboardaccess"] & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    NSClassFromString(&cfstr_Rbsprocessiden.isa);
    if (objc_opt_isKindOfClass())
    {
      v4 = 1;
      if (([location safeBoolForKey:@"isDaemon"] & 1) == 0)
      {
        v4 = 1;
        if (([v8 containsString:@"searchBar"] & 1) == 0)
        {
          v4 = 1;
          if (([v8 containsString:@"SiriHostedScene"] & 1) == 0)
          {
            v4 = 1;
            if (!AXIsXcodeLivePreviewsScene(v8))
            {
              v4 = 1;
              if (([v8 containsString:*MEMORY[0x263F21248]] & 1) == 0)
              {
                v4 = 1;
                if (([v8 containsString:*MEMORY[0x263F22640]] & 1) == 0)
                {
                  v4 = 1;
                  if (([v8 containsString:@"UIHostedScene"] & 1) == 0)
                  {
                    v4 = 1;
                    if (([v7 containsString:@"PosterKit"] & 1) == 0)
                    {
                      v4 = 1;
                      if (([v7 containsString:@"com.apple.chrono"] & 1) == 0) {
                        v4 = [v7 containsString:@"com.apple.ActivityUIServices"];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v10 = v4 & 1;
    }
    else
    {
      v10 = 0;
    }
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  return v10 & 1;
}

BOOL AXIsXcodeLivePreviewsScene(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  char v2 = 1;
  if (([location hasPrefix:@"XcodePreviews"] & 1) == 0)
  {
    char v2 = 1;
    if (([location hasPrefix:@"PreviewAgent"] & 1) == 0)
    {
      char v2 = 1;
      if (([location hasPrefix:@"SimDisplayScene"] & 1) == 0) {
        char v2 = [location containsString:@"UV-InjectedScene"];
      }
    }
  }
  BOOL v4 = (v2 & 1) != 0 && ([location hasSuffix:@"static"] & 1) == 0;
  objc_storeStrong(&location, 0);
  return v4;
}

void sub_2402BBED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
}

double AXCGFAbs(double a1)
{
  return fabs(a1);
}

double AXCGFAbs_0(double a1)
{
  return fabs(a1);
}

double AXCGFAbs_1(double a1)
{
  return fabs(a1);
}

double AXCGFAbs_2(double a1)
{
  return fabs(a1);
}

void sub_2402BD100()
{
  _Unwind_Resume(v0);
}

uint64_t axShouldDisableHitpointWarping()
{
  char v2 = 1;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    BOOL v1 = 0;
    if (_AXSAutomationEnabled()) {
      BOOL v1 = _AXSAutomationHitpointWarpingEnabled() == 0;
    }
    char v2 = v1;
  }
  return v2 & 1;
}

double CGFloatMinMax(double a1, double a2, double a3)
{
  double v3 = CGFloatMin(a3, a1);
  return CGFloatMax(a2, v3);
}

double CGFloatMax(double a1, double a2)
{
  return fmax(a1, a2);
}

double CGFloatMin(double a1, double a2)
{
  return fmin(a1, a2);
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t AX_IS_DEBUG_BUILD()
{
  return 0;
}

id AXUITextRangeImplClass()
{
  if (!AXUITextRangeImplClass_class) {
    AXUITextRangeImplClass_class = (uint64_t)NSClassFromString(&cfstr_Uitextrangeimp.isa);
  }
  v0 = (void *)AXUITextRangeImplClass_class;

  return v0;
}

BOOL AXUIKeyboardTypeSupportsMisspelledRotor(uint64_t a1)
{
  return a1 != 2 && (unint64_t)(a1 - 4) > 3;
}

uint64_t AXShouldCreateRemoteViewForEachLayer(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  objc_storeStrong(&location, 0);
  return 1;
}

void AXHandleUserInteractionForDictation(char a1)
{
  char v8 = a1 & 1;
  id v7 = (id)[NSClassFromString(&cfstr_Uidictationcon.isa) safeValueForKey:@"activeInstance"];
  if (v8 & 1) == 0 || (AXHandleUserInteractionForDictation_DidBegin)
  {
    if (AXHandleUserInteractionForDictation_DidBegin)
    {
      v1[0] = v7;
      AXPerformSafeBlock();
      AXHandleUserInteractionForDictation_DidBegin = 0;
      objc_storeStrong(v1, 0);
    }
  }
  else
  {
    v1[1] = (id)MEMORY[0x263EF8330];
    int v2 = -1073741824;
    int v3 = 0;
    BOOL v4 = __AXHandleUserInteractionForDictation_block_invoke;
    v5 = &unk_2650ADF18;
    id v6 = v7;
    AXPerformSafeBlock();
    AXHandleUserInteractionForDictation_DidBegin = 1;
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(&v7, 0);
}

uint64_t __AXHandleUserInteractionForDictation_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginUserInteraction:", 0, a1, a1);
}

uint64_t __AXHandleUserInteractionForDictation_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endUserInteraction", a1, a1);
}

BOOL AXIsDictationListening()
{
  id v3 = (id)[NSClassFromString(&cfstr_Uidictationcon.isa) safeValueForKey:@"activeInstance"];
  id v1 = (id)[v3 safeValueForKey:@"state"];
  BOOL v2 = [v1 intValue] == 2;

  objc_storeStrong(&v3, 0);
  return v2;
}

void sub_2402C9508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v25 - 104));
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  BOOL v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  BOOL v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_3_2_8_69_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 3;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 69;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void voiceOverDidEnableHandwriting(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v8[5] = a1;
  v8[4] = a2;
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a5;
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsSafeCategory();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  [v5 _axSetIsHandwritingEnabled:1];
  -[_UIKeyboardStateManagerAccessibility _axUpdateAutocorrectionSettings](v8[0]);
  objc_storeStrong(v8, 0);
}

void voiceOverDidDisableHandwriting(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v8[5] = a1;
  v8[4] = a2;
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a5;
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsSafeCategory();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  [v5 _axSetIsHandwritingEnabled:0];
  -[_UIKeyboardStateManagerAccessibility _axUpdateAutocorrectionSettings](v8[0]);
  objc_storeStrong(v8, 0);
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_2402D28A0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 48) = a1;
  *(_DWORD *)(v10 - 52) = a2;
  objc_destroyWeak((id *)(v10 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 48));
}

void sub_2402D4704(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, id *a19, uint64_t a20,uint64_t a21,id *a22,uint64_t a23,uint64_t a24,uint64_t a25,id *location)
{
  *(void *)(v26 - 184) = a1;
  *(_DWORD *)(v26 - 188) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v26 - 136));
  _Unwind_Resume(*(_Unwind_Exception **)(v26 - 184));
}

id getRTIInputUIServiceMachNameiOS()
{
  RTIInputUIServiceMachNameiOSSymbolLoc = (void **)getRTIInputUIServiceMachNameiOSSymbolLoc();
  if (!RTIInputUIServiceMachNameiOSSymbolLoc)
  {
    id v3 = (id)[MEMORY[0x263F08690] currentHandler];
    id v2 = (id)[NSString stringWithUTF8String:"NSString *getRTIInputUIServiceMachNameiOS(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, @"_UIRemoteKeyboardPlaceholderViewAccessibility.m", 16, @"%s", dlerror());

    __break(1u);
    JUMPOUT(0x2402D5878);
  }
  v0 = *RTIInputUIServiceMachNameiOSSymbolLoc;

  return v0;
}

uint64_t getRTIInputUIServiceMachNameiOSSymbolLoc()
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getRTIInputUIServiceMachNameiOSSymbolLoc_ptr;
  uint64_t v13 = getRTIInputUIServiceMachNameiOSSymbolLoc_ptr;
  if (!getRTIInputUIServiceMachNameiOSSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    id v5 = __getRTIInputUIServiceMachNameiOSSymbolLoc_block_invoke;
    id v6 = &unk_2650AE158;
    char v7 = &v9;
    __getRTIInputUIServiceMachNameiOSSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getRTIInputUIServiceMachNameiOSSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)RemoteTextInputLibrary();
  uint64_t v2 = dlsym(v1, "RTIInputUIServiceMachNameiOS");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getRTIInputUIServiceMachNameiOSSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RemoteTextInputLibrary()
{
  uint64_t v3 = RemoteTextInputLibraryCore();
  if (!v3)
  {
    id v2 = (id)[MEMORY[0x263F08690] currentHandler];
    id v1 = (id)[NSString stringWithUTF8String:"void *RemoteTextInputLibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x2402D5B30);
  }
  return v3;
}

uint64_t RemoteTextInputLibraryCore()
{
  if (!RemoteTextInputLibraryCore_frameworkLibrary) {
    __RemoteTextInputLibraryCore_block_invoke();
  }
  return RemoteTextInputLibraryCore_frameworkLibrary;
}

uint64_t __RemoteTextInputLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RemoteTextInputLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2402D64F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  objc_destroyWeak((id *)(v21 - 56));
  objc_destroyWeak((id *)(v21 - 48));
  _Unwind_Resume(a1);
}

void sub_2402D6604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, int a13, int a14, _Unwind_Exception *exception_object)
{
}

void sub_2402DB758(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 104) = a1;
  *(_DWORD *)(v11 - 108) = a2;
  objc_destroyWeak((id *)(v11 - 64));
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 104));
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_2402DE860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v19 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_2402DF13C()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2402DF930()
{
  _Unwind_Resume(v0);
}

void sub_2402DFB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, _Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v20 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_2402E01A8()
{
  _Unwind_Resume(v0);
}

void sub_2402E50E4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id *location)
{
  *(void *)(v30 - 96) = a1;
  *(_DWORD *)(v30 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v30 - 56));
  objc_destroyWeak((id *)(v30 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 96));
}

void sub_2402E5100(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *a24,uint64_t a25,uint64_t a26,id *location,uint64_t a28,uint64_t a29,id *a30)
{
  *(void *)(v30 - 96) = a1;
  *(_DWORD *)(v30 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak(a30);
  objc_destroyWeak((id *)(v30 - 56));
  objc_destroyWeak((id *)(v30 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 96));
}

void sub_2402E543C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

void sub_2402E575C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
}

void sub_2402E59C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, _Unwind_Exception *exception_object, char a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

void sub_2402E5FC4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *a24,uint64_t a25,uint64_t a26,id *a27,uint64_t a28,uint64_t a29,id *location)
{
  *(void *)(v30 - 96) = a1;
  *(_DWORD *)(v30 - 100) = a2;
  objc_destroyWeak((id *)(v30 - 56));
  objc_destroyWeak((id *)(v30 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 96));
}

void sub_2402E63CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
}

void sub_2402E663C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
}

void sub_2402E687C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, _Unwind_Exception *exception_object, char a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

void sub_2402E7DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,_Unwind_Exception *exception_object,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
  objc_destroyWeak(&a31);
  objc_destroyWeak((id *)(v31 - 128));
  _Unwind_Resume(a1);
}

void sub_2402E93F4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *a23,uint64_t a24,uint64_t a25,id *a26,uint64_t a27,uint64_t a28,id *a29,uint64_t a30,uint64_t a31,id *location)
{
  *(void *)(v32 - 48) = a1;
  *(_DWORD *)(v32 - 52) = a2;
  objc_destroyWeak((id *)(v32 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v32 - 48));
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2402ECD1C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 48) = a1;
  *(_DWORD *)(v11 - 52) = a2;
  objc_destroyWeak((id *)(v11 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 48));
}

BOOL AXKBElementWasForcedToUseForeignKB()
{
  BOOL v9 = 0;
  id v5 = (id)[MEMORY[0x263F1C738] sharedInstance];
  id v4 = (id)[v5 textInputTraits];
  char v6 = [v4 isSecureTextEntry];

  if (v6)
  {
    id v1 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id v8 = (id)[v1 currentInputMode];

    id location = (id)UIKeyboardGetCurrentUILanguage();
    id v2 = (id)[v8 primaryLanguage];
    char v3 = [v2 hasPrefix:location];

    BOOL v9 = (v3 & 1) == 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  return v9;
}

id AXKBElementLocalizedForKeyboardLocale(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v7 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  id v9 = (id)[v7 currentInputMode];

  id v8 = 0;
  if (!AXKBElementWasForcedToUseForeignKB())
  {
    id v1 = (id)[v9 primaryLanguage];
    id v2 = v8;
    id v8 = v1;
  }
  if (!AXKBElementLocalizedForKeyboardLocale_axBundle)
  {
    id v3 = (id)[MEMORY[0x263F086E0] accessibilityBundleWithLastPathComponent:@"UIKit.axbundle"];
    id v4 = (void *)AXKBElementLocalizedForKeyboardLocale_axBundle;
    AXKBElementLocalizedForKeyboardLocale_axBundle = (uint64_t)v3;
  }
  id v6 = (id)AXNSLocalizedStringForLocale();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);

  return v6;
}

BOOL UIAXRequiresTwoNextKeyboardKeys()
{
  BOOL v3 = 0;
  if (AXDeviceHasHomeButton() & 1) == 0 && (AXDeviceIsPhone())
  {
    id v1 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id location = (id)[v1 normalizedEnabledInputModeIdentifiers];

    if ((unint64_t)[location count] > 2) {
      BOOL v3 = ([location containsObject:*MEMORY[0x263F1D430]] & 1) != 0;
    }
    objc_storeStrong(&location, 0);
  }
  return v3;
}

id UIAXNextKeyboardValue(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v50 = a1;
  id v49 = (id)[MEMORY[0x263F1C738] activeInstance];
  char v47 = 0;
  id v25 = (id)[v49 safeValueForKey:@"_layout"];
  id v46 = (id)__UIAccessibilitySafeClass();

  id v45 = v46;
  objc_storeStrong(&v46, 0);
  id v48 = v45;
  id v44 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  id v43 = (id)[v44 currentInputMode];
  id v24 = (id)[MEMORY[0x263F1C738] sharedInstance];
  id v23 = (id)[v24 textInputTraits];
  id v42 = (id)objc_msgSend(v44, "nextInputModeInPreferenceListForTraits:updatePreference:skipEmoji:", v23, 0, objc_msgSend(v48, "keyplaneContainsEmojiKey") & 1);

  if (v50 == 1)
  {
    id v21 = (id)[v43 normalizedIdentifier];
    char v22 = [v21 isEqualToString:*MEMORY[0x263F1D430]];

    if ((v22 & 1) == 0)
    {
      id v41 = (id)AXLogAppAccessibility();
      char v40 = 17;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_FAULT))
      {
        log = v41;
        os_log_type_t type = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_fault_impl(&dword_2402B7000, log, type, "Asked for the next keyboard for the emoji key, but shouldn't have needed it because the label includes that info already.", v39, 2u);
      }
      objc_storeStrong(&v41, 0);
    }
  }
  else if (v50 == 2)
  {
    id v17 = (id)[v42 normalizedIdentifier];
    char v18 = [v17 isEqualToString:*MEMORY[0x263F1D430]];

    if (v18)
    {
      id v38 = (id)[v44 activeInputModes];
      if ((unint64_t)[v38 count] <= 2)
      {
        id v37 = (id)AXLogAppAccessibility();
        os_log_type_t v36 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v38);
          _os_log_fault_impl(&dword_2402B7000, (os_log_t)v37, v36, "Unexpectedly tried to skip emoji but had only active input modes: %@", v52, 0xCu);
        }
        objc_storeStrong(&v37, 0);
      }
      if ((unint64_t)[v38 count] > 2)
      {
        uint64_t v35 = [v38 indexOfObject:v43];
        if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v34 = (id)AXLogAppAccessibility();
          os_log_type_t v33 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v51, (uint64_t)v43, (uint64_t)v38);
            _os_log_impl(&dword_2402B7000, (os_log_t)v34, v33, "Unable to find current input mode: %@ in list of active inputmodes: %@.\nThis list of keyboards may have been modified in Settings after last choosing an inputmode.", v51, 0x16u);
          }
          objc_storeStrong(&v34, 0);
        }
        unint64_t v32 = 0;
        if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v16 = 0;
        }
        else
        {
          unint64_t v15 = v35 + 1;
          unint64_t v16 = v15 % [v38 count];
        }
        unint64_t v32 = v16;
        char v31 = 0;
        objc_opt_class();
        id v14 = (id)[v38 objectAtIndexedSubscript:v16];
        id v30 = (id)__UIAccessibilityCastAsClass();

        id v29 = v30;
        objc_storeStrong(&v30, 0);
        id v12 = (id)[v29 normalizedIdentifier];
        char v13 = [v12 isEqualToString:*MEMORY[0x263F1D430]];

        if (v13)
        {
          unint64_t v11 = v32 + 1;
          unint64_t v32 = v11 % [v38 count];
        }
        id v1 = (id)[v38 objectAtIndexedSubscript:v32];
        id v2 = v42;
        id v42 = v1;
      }
      objc_storeStrong(&v38, 0);
    }
  }
  id v28 = 0;
  if (v42)
  {
    id v3 = (id)[v42 displayName];
    id v4 = v28;
    id v28 = v3;

    id v27 = (id)[v42 primaryLanguage];
    id v5 = (id)[v27 lowercaseString];
    id v6 = v27;
    id v27 = v5;

    id v7 = (id)[v27 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    id v8 = v27;
    id v27 = v7;

    id obj = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v28];
    [obj setAttribute:v27 forKey:*MEMORY[0x263F217A8]];
    objc_storeStrong(&v28, obj);
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v27, 0);
  }
  id v10 = v28;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);

  return v10;
}

id _TraditionalStrokeDictionary()
{
  v0 = objc_msgSend(objc_allocWithZone(NSDictionary), "initWithObjectsAndKeys:", @"一", @"橫", @"㆒", @"橫", @"⼀", @"豎", @"丨", @"豎", @"⼁", @"丿", @"丿", @"撇", @"⼃", @"點", @"丶", @"點", @"⼂",
                 @"折",
                 @"乛",
                 0);

  return v0;
}

id _SimplifiedStrokeDictionary()
{
  v0 = objc_msgSend(objc_allocWithZone(NSDictionary), "initWithObjectsAndKeys:", @"一", @"横", @"㆒", @"横", @"⼀", @"竖", @"丨", @"竖", @"⼁", @"撇", @"丿", @"撇", @"⼃", @"点", @"丶", @"点", @"⼂",
                 @"折",
                 @"乛",
                 0);

  return v0;
}

id _ZhuyinTraditionalStrokeDictionary()
{
  v0 = objc_msgSend(objc_allocWithZone(NSDictionary), "initWithObjectsAndKeys:", @"三聲、", @"ˇ", 0);

  return v0;
}

void sub_2402F9E20()
{
  _Unwind_Resume(v0);
}

void sub_2402F9FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v21 - 104), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t __os_log_helper_16_0_2_4_0_4_0(uint64_t result, int a2, int a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

void sub_240300134()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_1_8_66(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_2403029FC()
{
  _Unwind_Resume(v0);
}

void sub_240302F00()
{
  _Unwind_Resume(v0);
}

void sub_2403049B8()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_3_1_8_69(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 3;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 69;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_240307D48()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_3_3_4_0_4_0_8_65(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 3;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 65;
  *(unsigned char *)(result + 15) = 8;
  *(void *)(result + 16) = a4;
  return result;
}

uint64_t __os_log_helper_16_0_4_4_0_4_0_4_0_4_0(uint64_t result, int a2, int a3, int a4, int a5)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 0;
  *(unsigned char *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(unsigned char *)(result + 20) = 0;
  *(unsigned char *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  return result;
}

uint64_t __os_log_helper_16_3_1_8_65(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 3;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 65;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void _accessibilityReceiveDictationLifecycleNotfication(uint64_t a1, uint64_t a2, const __CFString *a3, void *a4, void *a5)
{
  uint64_t v11 = a1;
  uint64_t v10 = a2;
  CFStringRef v9 = a3;
  obj[2] = a4;
  obj[1] = a5;
  obj[0] = (id)[a5 objectForKey:*MEMORY[0x263F215E0]];
  if (CFStringCompare(v9, (CFStringRef)*MEMORY[0x263F215E8], 0) || !obj[0])
  {
    if (CFEqual(v9, (CFStringRef)*MEMORY[0x263F215F0])
      && (id)_lastActiveDictationController == obj[0])
    {
      objc_storeStrong((id *)&_lastActiveDictationController, 0);
    }
  }
  else
  {
    id location = 0;
    objc_storeStrong(&location, obj[0]);
    id v7 = location;
    objc_storeStrong(&location, 0);
    id v12 = v7;
    id v5 = v7;
    id v6 = (void *)_lastActiveDictationController;
    _lastActiveDictationController = (uint64_t)v5;
  }
  objc_storeStrong(obj, 0);
}

void sub_2403118E0()
{
  _Unwind_Resume(v0);
}

void sub_240316AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v19 - 72), 8);
  _Unwind_Resume(a1);
}

BOOL __CGSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

void sub_24031F708()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

BOOL AX_CGSizeIsProbablyEmpty(double a1, double a2)
{
  return AXCGFAbs(a1 - 0.0) < 0.001 || AXCGFAbs(a2 - 0.0) < 0.001 || AX_CGSizeIsEmpty(a1, a2);
}

void sub_240322AA0()
{
  _Unwind_Resume(v0);
}

double CGFAbs(double a1)
{
  return fabs(a1);
}

void sub_2403278EC()
{
  _Unwind_Resume(v0);
}

void sub_240327DAC()
{
  _Unwind_Resume(v0);
}

BOOL AX_CGSizeIsEmpty(double a1, double a2)
{
  BOOL v3 = 1;
  if (a1 > 0.0) {
    return a2 <= 0.0;
  }
  return v3;
}

void sub_24032C590()
{
  _Unwind_Resume(v0);
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_24032EFBC(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  *(void *)(v11 - 64) = a1;
  *(_DWORD *)(v11 - 68) = a2;
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 64));
}

BOOL __CGSizeEqualToSize_0(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

BOOL __CGPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

void sub_240335E9C()
{
  _Unwind_Resume(v0);
}

void sub_240336AA8()
{
  _Unwind_Resume(v0);
}

void sub_240336D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
}

void sub_240336F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, _Unwind_Exception *exception_object, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_24033F380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 48));
  _Unwind_Resume(a1);
}

void sub_24033FB68()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

BOOL __CGPointEqualToPoint_0(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_24034D2D0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, id *a19, uint64_t a20,uint64_t a21,id *location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  *(void *)(v34 - 112) = a1;
  *(_DWORD *)(v34 - 116) = a2;
  objc_destroyWeak((id *)(v34 - 72));
  objc_destroyWeak((id *)(v34 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v34 - 112));
}

void sub_24034DFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v22 - 72), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

id getEMFEmojiTokenClass()
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getEMFEmojiTokenClass_softClass;
  uint64_t v13 = getEMFEmojiTokenClass_softClass;
  if (!getEMFEmojiTokenClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    BOOL v5 = __getEMFEmojiTokenClass_block_invoke;
    id v6 = &unk_2650AE158;
    id v7 = &v9;
    __getEMFEmojiTokenClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

uint64_t __getEMFEmojiTokenClass_block_invoke(uint64_t a1)
{
  EmojiFoundationLibrary();
  Class Class = objc_getClass("EMFEmojiToken");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v4 = (id)[MEMORY[0x263F08690] currentHandler];
    id v3 = (id)[NSString stringWithUTF8String:"Class getEMFEmojiTokenClass(void)_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "EMFEmojiToken");

    __break(1u);
    JUMPOUT(0x240351A20);
  }
  getEMFEmojiTokenClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t EmojiFoundationLibrary()
{
  uint64_t v3 = EmojiFoundationLibraryCore();
  if (!v3)
  {
    id v2 = (id)[MEMORY[0x263F08690] currentHandler];
    id v1 = (id)[NSString stringWithUTF8String:"void *EmojiFoundationLibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x240351B48);
  }
  return v3;
}

uint64_t EmojiFoundationLibraryCore()
{
  if (!EmojiFoundationLibraryCore_frameworkLibrary) {
    __EmojiFoundationLibraryCore_block_invoke();
  }
  return EmojiFoundationLibraryCore_frameworkLibrary;
}

uint64_t __EmojiFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EmojiFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_240353B64(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 64) = a1;
  *(_DWORD *)(v10 - 68) = a2;
  objc_destroyWeak((id *)(v10 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 64));
}

void __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_2403566D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v18 - 72), 8);
  _Unwind_Resume(a1);
}

double CGFAbs_0(double a1)
{
  return fabs(a1);
}

uint64_t accessibilityRTLKeyPositionSort(void *a1, void *a2, void *a3)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v26 = 0;
  objc_storeStrong(&v26, a2);
  v25[1] = a3;
  char v24 = 0;
  objc_opt_class();
  id v23 = (id)__UIAccessibilityCastAsClass();
  id v22 = v23;
  objc_storeStrong(&v23, 0);
  v25[0] = v22;
  char v20 = 0;
  objc_opt_class();
  id v19 = (id)__UIAccessibilityCastAsClass();
  id v18 = v19;
  objc_storeStrong(&v19, 0);
  id v21 = v18;
  [v25[0] frame];
  double v15 = v3;
  [v21 frame];
  if (v15 <= v4)
  {
    objc_msgSend(v25[0], "frame", v15);
    double v14 = v5;
    [v21 frame];
    if (v14 >= v6)
    {
      objc_msgSend(v25[0], "frame", v14);
      double v13 = v7;
      [v21 frame];
      if (v13 <= v8)
      {
        objc_msgSend(v25[0], "frame", v13);
        double v12 = v9;
        [v21 frame];
        uint64_t v28 = v12 < v10;
      }
      else
      {
        uint64_t v28 = -1;
      }
    }
    else
    {
      uint64_t v28 = -1;
    }
  }
  else
  {
    uint64_t v28 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
  return v28;
}

void sub_24035C408(uint64_t a1, int a2)
{
  *(void *)(v2 - 112) = a1;
  *(_DWORD *)(v2 - 116) = a2;
  _Block_object_dispose((const void *)(v2 - 96), 8);
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 112));
}

id accessibilityLocalizedString(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong(&location, 0);

  return v2;
}

id accessibilityLocalizedStringInTable(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v5 = 0;
  objc_storeStrong(&v5, a2);
  id v4 = (id)UIKitAccessibilityLocalizedStringInTable();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);

  return v4;
}

id axAnnotateDataNetworkViewWithType(void *a1)
{
  v31[1] = a1;
  v31[0] = 0;
  if (a1)
  {
    id v2 = a1;
    char v1 = 1;
  }
  else
  {
    id v2 = 0;
    char v1 = 0;
  }
  if ((v1 & 1) == 0)
  {
    switch((unint64_t)v2)
    {
      case 0uLL:
        break;
      case 1uLL:
        id v13 = accessibilityLocalizedString(@"status.network.1x");
        id v14 = v31[0];
        v31[0] = v13;

        break;
      case 2uLL:
        id v5 = accessibilityLocalizedString(@"status.network.gprs");
        id v6 = v31[0];
        v31[0] = v5;

        break;
      case 3uLL:
        id v3 = accessibilityLocalizedString(@"status.network.edge");
        id v4 = v31[0];
        v31[0] = v3;

        break;
      case 4uLL:
        id v7 = accessibilityLocalizedString(@"status.network.umts");
        id v8 = v31[0];
        v31[0] = v7;

        break;
      case 5uLL:
        id v9 = accessibilityLocalizedString(@"status.network.4g");
        id v10 = v31[0];
        v31[0] = v9;

        break;
      case 6uLL:
        id v11 = accessibilityLocalizedString(@"status.network.lte");
        id v12 = v31[0];
        v31[0] = v11;

        break;
      case 7uLL:
        id v15 = accessibilityLocalizedString(@"status.network.5ge");
        id v16 = v31[0];
        v31[0] = v15;

        break;
      case 8uLL:
        id v17 = accessibilityLocalizedString(@"status.network.lte.a");
        id v18 = v31[0];
        v31[0] = v17;

        break;
      case 9uLL:
        id v19 = accessibilityLocalizedString(@"status.network.lte.plus");
        id v20 = v31[0];
        v31[0] = v19;

        break;
      case 0xAuLL:
        id v21 = accessibilityLocalizedString(@"status.network.5g");
        id v22 = v31[0];
        v31[0] = v21;

        break;
      case 0xBuLL:
        id v23 = accessibilityLocalizedString(@"status.network.5g.plus");
        id v24 = v31[0];
        v31[0] = v23;

        break;
      case 0xCuLL:
        id v25 = accessibilityLocalizedString(@"status.network.5g.uwb");
        id v26 = v31[0];
        v31[0] = v25;

        break;
      case 0xDuLL:
        id v27 = accessibilityLocalizedString(@"status.network.5g.ugc");
        id v28 = v31[0];
        v31[0] = v27;

        break;
      default:
        JUMPOUT(0);
    }
  }
  id v30 = v31[0];
  objc_storeStrong(v31, 0);

  return v30;
}

uint64_t axIsAutomaticArbiterClientKeyboardActive()
{
  id v1 = (id)[MEMORY[0x263F1C760] safeValueForKey:@"automaticKeyboardArbiterClient"];
  char v2 = [v1 safeBoolForKey:@"keyboardActive"];

  return v2 & 1;
}

uint64_t axKeyboardInSeparateProcessAndScene(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  char v6 = [location safeBoolForKey:@"_isHostedInAnotherProcess"] & 1;
  id v4 = (id)[location windowScene];
  id v5 = (id)[v4 safeValueForKey:@"_FBSScene"];

  if ((v6 & 1) == 0 || (char v3 = 1, !v5))
  {
    BOOL v2 = 0;
    if ((v6 & 1) == 0) {
      BOOL v2 = v5 == 0;
    }
    char v3 = v2;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  return v3 & 1;
}

uint64_t _accessibilityFindDurationRangeInString(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v12 = a2;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v20 = 0;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v23 = 0;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v15 = 0;
  id v11 = (id)[MEMORY[0x263F08708] decimalDigitCharacterSet];
  unint64_t i = 0;
  unint64_t v9 = [location length];
  while (i < v9)
  {
    unint64_t v17 = i;
    unint64_t v16 = v9 - i;
    unint64_t v18 = i;
    unint64_t v19 = v9 - i;
    uint64_t v8 = objc_msgSend(location, "rangeOfCharacterFromSet:options:range:", v11, 0, i, v9 - i);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    unsigned __int8 v7 = 0;
    char v6 = 1;
    for (unint64_t i = v8 + 1; ; ++i)
    {
      BOOL v4 = 0;
      if (i < v9) {
        BOOL v4 = v7 < 3u;
      }
      if (!v4) {
        break;
      }
      if (v6 && v6 != 1)
      {
        if ((unsigned __int16)[location characterAtIndex:i] != 58) {
          break;
        }
        char v6 = 0;
      }
      else
      {
        if ((objc_msgSend(v11, "characterIsMember:", (unsigned __int16)objc_msgSend(location, "characterAtIndex:", i)) & 1) == 0) {
          break;
        }
        if (++v6 == 2) {
          ++v7;
        }
      }
    }
    if (v7 >= 2u)
    {
      uint64_t v14 = v8;
      uint64_t v15 = 2 * v7 + v7 - 1;
      if (v12)
      {
        if (v7 == 2) {
          id v2 = (id) *MEMORY[0x263F21740];
        }
        else {
          id v2 = (id) *MEMORY[0x263F21730];
        }
        *id v12 = v2;
      }
      break;
    }
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  return v14;
}

id _createFormatDurationString(double a1, double a2)
{
  double v17 = a1;
  double v16 = a2;
  id v15 = _createDurationString(a1);
  id v14 = _createDurationString(v16);
  id v6 = objc_allocWithZone(NSString);
  id v7 = accessibilityLocalizedString(@"slider.time.position");
  id v13 = (id)objc_msgSend(v6, "initWithFormat:", v15, v14);

  *(void *)&long long v10 = [v13 rangeOfString:v15];
  *((void *)&v10 + 1) = v2;
  long long v12 = v10;
  *(void *)&long long v9 = [v13 rangeOfString:v14 options:4];
  *((void *)&v9 + 1) = v3;
  long long v11 = v9;
  id v8 = (id)[objc_allocWithZone(MEMORY[0x263F21660]) initWithString:v13];
  if ((void)v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v8 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21740] withRange:v12];
  }
  if ((void)v11 != 0x7FFFFFFFFFFFFFFFLL) {
    [v8 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21740] withRange:v11];
  }
  id v5 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);

  return v5;
}

id _createDurationString(double a1)
{
  double v10 = a1;
  double v11 = a1;
  unint64_t v9 = vcvtmd_u64_f64(a1);
  double v8 = a1 - (double)v9;
  unint64_t v7 = v9 / 0x3C;
  unint64_t v6 = 0;
  if (v9 / 0x3C)
  {
    v9 %= 60 * v7;
    unint64_t v6 = v7 / 0x3C;
    if (v7 / 0x3C) {
      v7 %= 60 * v6;
    }
  }
  id v1 = objc_allocWithZone(NSString);
  float v2 = v8;
  double v5 = (float)((float)v9 + v2);
  uint64_t v3 = (void *)[v1 initWithFormat:@"%lu:%lu:%.2f", v6, v7, *(void *)&v5];

  return v3;
}

void sub_24036A914()
{
  _Unwind_Resume(v0);
}

id trimWhitespaceToNil(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v6 = location;
  id v7 = (id)[MEMORY[0x263F08708] whitespaceCharacterSet];
  id v1 = (id)objc_msgSend(v6, "stringByTrimmingCharactersInSet:");
  id v2 = location;
  id location = v1;

  if ([location length]) {
    id v3 = location;
  }
  else {
    id v3 = 0;
  }
  id v5 = v3;
  objc_storeStrong(&location, 0);

  return v5;
}

void __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_240372210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, _Unwind_Exception *exception_object)
{
  objc_destroyWeak((id *)(v20 - 24));
  _Unwind_Resume(a1);
}

void sub_2403737F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v24 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_240379A60()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_3_8_64_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_3_2_8_69_8_69(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 3;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 69;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 69;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

double CGFloatMin_0(double a1, double a2)
{
  return fmin(a1, a2);
}

double UIEdgeInsetsInsetRect_0(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t __os_log_helper_16_2_2_8_66_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

double UIRectGetWidth(double a1, double a2, double a3)
{
  return a3;
}

double UIRectGetMaxX(double a1, double a2, double a3)
{
  return a1 + a3;
}

double UIRectGetHeight(double a1, double a2, double a3, double a4)
{
  return a4;
}

double UIRectGetMinY(double a1, double a2)
{
  return a2;
}

double UIRectGetMaxY(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

BOOL __CGPointEqualToPoint_1(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

double CGFloatMinMax_0(double a1, double a2, double a3)
{
  double v3 = CGFloatMin_0(a3, a1);
  return CGFloatMax_0(a2, v3);
}

uint64_t __os_log_helper_16_2_2_4_0_8_64(uint64_t result, int a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 64;
  *(unsigned char *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

double CGFloatMax_0(double a1, double a2)
{
  return fmax(a1, a2);
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  double v3 = (id *)(a1 + 40);
  *double v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_24038BCA4(uint64_t a1, int a2)
{
  *(void *)(v2 - 96) = a1;
  *(_DWORD *)(v2 - 100) = a2;
  objc_destroyWeak((id *)(v2 - 56));
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 96));
}

id _containerForDimmingView(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = (id)[location _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uisearchdispla.isa)];
  objc_storeStrong(&location, 0);

  return v2;
}

void _toggleDimmingView(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v9 = 0;
  objc_storeStrong(&v9, a2);
  id v8 = _containerForDimmingView(location);
  if (v8 && ([location alpha], v2 != 0.0))
  {
    if (v8)
    {
      id v6 = (id)[v8 _accessibilityDescendantOfType:objc_opt_class()];
      id v4 = (id)[v6 safeValueForKey:@"_setAccessibilitySearchControllerDimmingViewVisible"];
      [v8 setAccessibilityViewIsModal:1];
      [location setIsAccessibilityElement:1];
      objc_storeStrong(&v6, 0);
    }
  }
  else
  {
    id v7 = (id)[v9 _accessibilityDescendantOfType:objc_opt_class()];
    id v3 = (id)[v7 safeValueForKey:@"_setAccessibilitySearchControllerDimmingViewHidden"];
    [v9 setAccessibilityViewIsModal:0];
    [location setIsAccessibilityElement:0];
    objc_storeStrong(&v7, 0);
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

id AXNoLoc(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = location;
  objc_storeStrong(&location, 0);

  return v2;
}

void sub_240393A48(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  *(void *)(v15 - 96) = a1;
  *(_DWORD *)(v15 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v15 - 96));
}

id AXStatusBarItemHint(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v29 = (id)[location _accessibilityAncestorIsKindOf:objc_opt_class()];
  uint64_t v28 = [v29 currentStyle];
  char v27 = 0;
  char v27 = [(id)*MEMORY[0x263F1D020] _accessibilityIsSystemAppServer] & 1;
  id v26 = accessibilityLocalizedString(@"status.bar.scroll.to.top.hint");
  id v25 = 0;
  if (v28 == 207)
  {
    id v1 = accessibilityLocalizedString(@"opens.preferences");
    id v2 = v25;
    id v25 = v1;

    objc_storeStrong(&v26, 0);
  }
  else
  {
    char v23 = 0;
    char v15 = 1;
    if ((UIStatusBarStyleIsDoubleHeight() & 1) == 0)
    {
      char v14 = 0;
      if (v27)
      {
        id v24 = (id)[MEMORY[0x263F22968] server];
        char v23 = 1;
        char v14 = [v24 isScreenLockedWithPasscode:0];
      }
      char v15 = v14;
    }
    if (v23) {

    }
    if (v15) {
      objc_storeStrong(&v26, 0);
    }
  }
  id v22 = accessibilityLocalizedString(@"notification.center.hint");
  BOOL v21 = 0;
  char v19 = 0;
  if (v27)
  {
    id v20 = (id)[MEMORY[0x263F22968] server];
    char v19 = 1;
    int v13 = [v20 isNotificationCenterVisible] & 1;
  }
  else
  {
    int v13 = 0;
  }
  if (v19) {

  }
  BOOL v21 = v13 != 0;
  id v18 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v11 = (id)[v18 bundleIdentifier];
  char v12 = 1;
  if (([v11 isEqualToString:@"com.apple.purplebuddy"] & 1) == 0)
  {
    char v10 = 0;
    if (v27) {
      char v10 = v21;
    }
    char v12 = v10;
  }

  if (v12) {
    objc_storeStrong(&v22, 0);
  }
  id v17 = accessibilityLocalizedString(@"control.center.hint");
  if ((v27 & 1) != 0 && v21) {
    objc_storeStrong(&v17, 0);
  }
  id v16 = 0;
  uint64_t v31 = 0;
  id v7 = (id)[MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  uint64_t v31 = v8;
  BOOL v9 = 1;
  if (v8 != 1) {
    BOOL v9 = v31 == 5;
  }
  if (v9)
  {
    id v3 = accessibilityLocalizedString(@"dock.hint");
    id v4 = v16;
    id v16 = v3;
  }
  id v6 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&location, 0);

  return v6;
}

id AXStatusBarPillTimeView(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v7 = (id)[location _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uistatusbar_0.isa)];
  id v2 = (id)[v7 safeDictionaryForKey:@"items"];
  id v6 = (id)[v2 allValues];

  id v3 = (id)objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global_32);
  id v5 = (id)[v3 firstObject];

  id v4 = (id)[v5 safeValueForKey:@"pillTimeView"];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);

  return v4;
}

BOOL __AXStatusBarPillTimeView_block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uistatusbartim_0.isa);
  char v4 = 0;
  BOOL v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id)[location[0] safeValueForKey:@"pillTimeView"];
    char v4 = 1;
    BOOL v3 = v5 != 0;
  }
  BOOL v7 = v3;
  if (v4) {

  }
  objc_storeStrong(location, 0);
  return v7;
}

double CGFAbs_1(double a1)
{
  return fabs(a1);
}

void sub_24039C43C()
{
  _Unwind_Resume(v0);
}

void sub_2403A0B20(uint64_t a1, int a2)
{
  char v4 = *(id **)(v2 - 152);
  *(void *)(v2 - 88) = a1;
  *(_DWORD *)(v2 - 92) = a2;
  objc_destroyWeak(v4);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 88));
}

void sub_2403A2488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__19(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

double CGFloor(double a1)
{
  return floor(a1);
}

void AXApplyTabBarItemPropertiesToView(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v15 = 0;
  objc_storeStrong(&v15, a2);
  id v13 = (id)[location safeValueForKey:@"systemItem"];
  unsigned int v14 = [v13 intValue];

  if (v14)
  {
    id v10 = v15;
    id v11 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", v14);
    objc_msgSend(v10, "accessibilitySetIdentification:");
  }
  id v2 = v15;
  id v3 = (id)[location _accessibilityAXAttributedHint];
  objc_msgSend(v2, "setAccessibilityHint:");

  id v4 = v15;
  id v5 = (id)[location _accessibilityAXAttributedValue];
  objc_msgSend(v4, "setAccessibilityValue:");

  id v6 = v15;
  id v7 = (id)[location _accessibilityAXAttributedLabel];
  objc_msgSend(v6, "setAccessibilityLabel:");

  id v8 = v15;
  id v9 = (id)[location accessibilityIdentifier];
  objc_msgSend(v8, "setAccessibilityIdentifier:");

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
}

double UIEdgeInsetsInsetRect_1(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t _UIAXElementIsHeaderInSearchContexts(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v3 = (id)[location _iosAccessibilityAttributeValue:2004];
  uint64_t v1 = [v3 unsignedLongLongValue];
  char v4 = 1;
  if ((v1 & *MEMORY[0x263F1CEF8]) != *MEMORY[0x263F1CEF8]) {
    char v4 = [location _accessibilityElementServesAsHeadingLandmark];
  }

  objc_storeStrong(&location, 0);
  return v4 & 1;
}

void sub_2403AA954()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__20(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_2_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_2403AB920()
{
  _Unwind_Resume(v0);
}

void sub_2403B2A00()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_0_2_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void __Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void sub_2403BE210(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  *(void *)(v11 - 64) = a1;
  *(_DWORD *)(v11 - 68) = a2;
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 64));
}

BOOL UIInterfaceOrientationIsLandscape(uint64_t a1)
{
  BOOL v2 = 1;
  if (a1 != 4) {
    return a1 == 3;
  }
  return v2;
}

void sub_2403C6714()
{
  _Unwind_Resume(v0);
}

double UIEdgeInsetsInsetRect_2(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

BOOL UIEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9 = 0;
  if (a2 == a6)
  {
    BOOL v9 = 0;
    if (a1 == a5)
    {
      BOOL v9 = 0;
      if (a4 == a8) {
        return a3 == a7;
      }
    }
  }
  return v9;
}

void sub_2403D0B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, int a12, _Unwind_Exception *exception_object, char a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
}

void sub_2403D21D0()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  BOOL v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

double UIEdgeInsetsInsetRect_3(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

BOOL UIEdgeInsetsEqualToEdgeInsets_0(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9 = 0;
  if (a2 == a6)
  {
    BOOL v9 = 0;
    if (a1 == a5)
    {
      BOOL v9 = 0;
      if (a4 == a8) {
        return a3 == a7;
      }
    }
  }
  return v9;
}

uint64_t __os_log_helper_16_2_4_4_0_4_0_8_64_8_64(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 64;
  *(unsigned char *)(result + 15) = 8;
  *(void *)(result + 16) = a4;
  *(unsigned char *)(result + 24) = 64;
  *(unsigned char *)(result + 25) = 8;
  *(void *)(result + 26) = a5;
  return result;
}

BOOL __CGSizeEqualToSize_1(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

uint64_t AXIgnoresTextOperations()
{
  predicate = (dispatch_once_t *)&AXIgnoresTextOperations_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_733_0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return AXIgnoresTextOperations_Ignores & 1;
}

void __AXIgnoresTextOperations_block_invoke(void *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  id v1 = (id)[MEMORY[0x263F086E0] mainBundle];
  v2[0] = (id)[v1 bundleIdentifier];

  AXIgnoresTextOperations_Ignores = [v2[0] isEqualToString:@"com.apple.AssetViewer.ASVAssetViewer"] & 1;
  objc_storeStrong(v2, 0);
}

void sub_2403F3FA4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  *(void *)(v38 - 208) = a1;
  *(_DWORD *)(v38 - 212) = a2;
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v38 - 208));
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  BOOL v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

BOOL AX_CGSizeIsEmpty_0(double a1, double a2)
{
  BOOL v3 = 1;
  if (a1 > 0.0) {
    return a2 <= 0.0;
  }
  return v3;
}

BOOL __CGPointEqualToPoint_2(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

void sub_2403FC32C()
{
  _Unwind_Resume(v0);
}

BOOL __CGSizeEqualToSize_2(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

void sub_2403FCDB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,int a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37,id a38)
{
}

void __Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  BOOL v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void sub_2403FF17C()
{
  _Unwind_Resume(v0);
}

void sub_2403FF2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

void sub_2403FF63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, id *a11, uint64_t a12, id *a13, id *location, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,int a35,uint64_t a36)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak((id *)(v36 - 248));
  _Unwind_Resume(a1);
}

id AXNoLoc_0(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = location;
  objc_storeStrong(&location, 0);

  return v2;
}

BOOL __CGSizeEqualToSize_3(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

uint64_t __os_log_helper_16_3_3_8_69_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 3;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 69;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_3_3_8_69_8_69_8_69(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 3;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 69;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 69;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 69;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_3_3_8_69_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(unsigned char *)uint64_t result = 3;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 69;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

void __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

double CGFAbs_2(double a1)
{
  return fabs(a1);
}

void __Block_byref_object_copy__26(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void sub_24041574C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v24 - 80));
  objc_destroyWeak((id *)(v24 - 72));
  _Unwind_Resume(a1);
}

void sub_24041660C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  *(void *)(v13 - 168) = a1;
  *(_DWORD *)(v13 - 172) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 96));
  _Unwind_Resume(*(_Unwind_Exception **)(v13 - 168));
}

uint64_t __os_log_helper_16_2_2_8_64_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_4_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 64;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t _isDevicePasscodeLocked()
{
  char v2 = 0;
  id v1 = (id)[MEMORY[0x263F22968] server];
  [v1 isScreenLockedWithPasscode:&v2];

  return v2 & 1;
}

BOOL __CGSizeEqualToSize_4(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

void sub_240425C70(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  *(void *)(v9 - 56) = a1;
  *(_DWORD *)(v9 - 60) = a2;
  objc_destroyWeak((id *)(v9 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 56));
}

void __Block_byref_object_copy__28(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  char v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  char v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_4_8_64_4_0_8_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_24043224C()
{
  _Unwind_Resume(v0);
}

void sub_240432FB4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 32) = a1;
  *(_DWORD *)(v10 - 36) = a2;
  objc_destroyWeak((id *)(v10 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 32));
}

void sub_240436490(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *a15, uint64_t a16, uint64_t a17, id *a18, uint64_t a19, uint64_t a20,uint64_t a21,id *location)
{
  *(void *)(v22 - 112) = a1;
  *(_DWORD *)(v22 - 116) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v22 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v22 - 112));
}

void sub_240436FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v21 - 136), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  char v2 = *(void **)(a2 + 40);
  BOOL v3 = (id *)(a1 + 40);
  *BOOL v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void sub_240437ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,int a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXColorGetLuma()
{
  return MEMORY[0x270F09D38]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x270F09178]();
}

uint64_t AXColorsProbablyEqual()
{
  return MEMORY[0x270F09D48]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDateStringForFormatWithTimeZone()
{
  return MEMORY[0x270F09F58]();
}

uint64_t AXDeviceGetMainScreenPixelBounds()
{
  return MEMORY[0x270F09F80]();
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x270F091A0]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x270F09FB0]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x270F091A8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x270F091E8]();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x270F091F0]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXFormatFloat()
{
  return MEMORY[0x270F09238]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F09248]();
}

uint64_t AXFormatNumber()
{
  return MEMORY[0x270F09258]();
}

uint64_t AXFrontBoardFocusedAppPID()
{
  return MEMORY[0x270F096E8]();
}

uint64_t AXFrontBoardFocusedAppPIDs()
{
  return MEMORY[0x270F096F0]();
}

uint64_t AXFrontBoardFocusedAppPIDsIgnoringSiri()
{
  return MEMORY[0x270F096F8]();
}

uint64_t AXFrontBoardFocusedAppPidsForContinuity()
{
  return MEMORY[0x270F09700]();
}

uint64_t AXFrontBoardFocusedApps()
{
  return MEMORY[0x270F09720]();
}

uint64_t AXFrontBoardIsSystemAppUINonExclusive()
{
  return MEMORY[0x270F09738]();
}

uint64_t AXFrontBoardPIDForApplicationWithBundleID()
{
  return MEMORY[0x270F09740]();
}

uint64_t AXFrontBoardRunningAppPIDs()
{
  return MEMORY[0x270F09760]();
}

uint64_t AXFrontBoardSpeakThisAppPIDForPoint()
{
  return MEMORY[0x270F09770]();
}

uint64_t AXFrontBoardSpeakThisAppPIDs()
{
  return MEMORY[0x270F09778]();
}

uint64_t AXGuaranteedMutableArray()
{
  return MEMORY[0x270F09268]();
}

uint64_t AXLanguageConvertToCanonicalForm()
{
  return MEMORY[0x270F0A168]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F092A0]();
}

uint64_t AXLogBrailleHW()
{
  return MEMORY[0x270F092D0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXLogElementTraversal()
{
  return MEMORY[0x270F092F0]();
}

uint64_t AXLogFirstElement()
{
  return MEMORY[0x270F092F8]();
}

uint64_t AXLogFocusEngine()
{
  return MEMORY[0x270F09300]();
}

uint64_t AXLogLoading()
{
  return MEMORY[0x270F09328]();
}

uint64_t AXLogOpaqueElements()
{
  return MEMORY[0x270F09348]();
}

uint64_t AXLogRemoteElement()
{
  return MEMORY[0x270F09360]();
}

uint64_t AXLogScrollToVisible()
{
  return MEMORY[0x270F09368]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x270F09380]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x270F093D0]();
}

uint64_t AXLogValidations()
{
  return MEMORY[0x270F093F0]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x270F093F8]();
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

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x270F09468]();
}

uint64_t AXPidSuspend()
{
  return MEMORY[0x270F09840]();
}

uint64_t AXPidUnsuspend()
{
  return MEMORY[0x270F09848]();
}

uint64_t AXProcessIsFullKeyboardAccess()
{
  return MEMORY[0x270F094A0]();
}

uint64_t AXProcessIsInCallService()
{
  return MEMORY[0x270F094A8]();
}

uint64_t AXProcessIsInputUI()
{
  return MEMORY[0x270F094B0]();
}

uint64_t AXProcessIsPineBoard()
{
  return MEMORY[0x270F094C8]();
}

uint64_t AXProcessIsShortcuts()
{
  return MEMORY[0x270F094D0]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F094D8]();
}

uint64_t AXProcessIsStickerPickerService()
{
  return MEMORY[0x270F094E0]();
}

uint64_t AXProcessIsSystemApplication()
{
  return MEMORY[0x270F094E8]();
}

uint64_t AXRemoteElementConcatSceneUUIDAndContextId()
{
  return MEMORY[0x270F09858]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXRetainAutorelease()
{
  return MEMORY[0x270F0A2F0]();
}

uint64_t AXSSAccessibilityDescriptionForSymbolName()
{
  return MEMORY[0x270F09C50]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXSafeProtocolFromString()
{
  return MEMORY[0x270F09548]();
}

uint64_t AXSelectionModeVoiceOverSelectionMovement()
{
  return MEMORY[0x270F808A0]();
}

uint64_t AXUIAllKeyboardWindows()
{
  return MEMORY[0x270F09D78]();
}

uint64_t AXUIApplicationWindows()
{
  return MEMORY[0x270F09D80]();
}

uint64_t AXUIAutomationHandleKeyComplete()
{
  return MEMORY[0x270F808B0]();
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x270F098A8]();
}

uint64_t AXUIElementPerformFencedActionWithValue()
{
  return MEMORY[0x270F098B8]();
}

AXError AXUIElementSetMessagingTimeout(AXUIElementRef element, float timeoutInSeconds)
{
  return MEMORY[0x270F098C8](element, timeoutInSeconds);
}

uint64_t AXUIKeyboardEntryNotificationBlockTimer()
{
  return MEMORY[0x270F808B8]();
}

uint64_t AXUIKeyboardIsOOP()
{
  return MEMORY[0x270F09D88]();
}

uint64_t AXUIKeyboardIsOnScreen()
{
  return MEMORY[0x270F09D90]();
}

uint64_t AXUIKeyboardScreenFrame()
{
  return MEMORY[0x270F09D98]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x270F09DA0]();
}

uint64_t AXUIMakeTouchForTouchesBeganAtLocation()
{
  return MEMORY[0x270F09DB0]();
}

uint64_t AXUIRepresentedKeyboardElement()
{
  return MEMORY[0x270F09DC0]();
}

uint64_t AXUIUnblockKeyboardEntryNotifications()
{
  return MEMORY[0x270F808C0]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x270F098E8](*(void *)&theType, valuePtr);
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x270F0A378]();
}

uint64_t AX_CGRectAlmostEqualToRect()
{
  return MEMORY[0x270F0A398]();
}

uint64_t AX_CGRectBySubtractingRect()
{
  return MEMORY[0x270F0A3A0]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x270F0A3B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E90](allocator, activities, repeats, order, block);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x270EE63E8]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGSize CGSizeFromString(NSString *string)
{
  MEMORY[0x270F05E80](string);
  result.height = v2;
  result.width = v1;
  return result;
}

uint64_t FKALogCommon()
{
  return MEMORY[0x270F09590]();
}

uint64_t GSCurrentEventTimestamp()
{
  return MEMORY[0x270F30608]();
}

uint64_t IOHIDEventCreateScrollEvent()
{
  return MEMORY[0x270EF42C0]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x270EF4368]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MRMediaRemoteSendCommand()
{
  return MEMORY[0x270F4A040]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.id location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t QSInstallSharedSafeCategoriesIfNeeded()
{
  return MEMORY[0x270F09DD8]();
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x270F808D0]();
}

uint64_t UIAXFrameForElements()
{
  return MEMORY[0x270F808E8]();
}

uint64_t UIAXKeyboardIsOnScreen()
{
  return MEMORY[0x270F808F0]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAXLocalizedStringForKnownAXIdentifier()
{
  return MEMORY[0x270F80900]();
}

uint64_t UIAXMassageElementDescription()
{
  return MEMORY[0x270F80908]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x270F80938]();
}

uint64_t UIAccessibilityColorEqualToColor()
{
  return MEMORY[0x270F80948]();
}

uint64_t UIAccessibilityConvertAccessibilityPathToViewCoordinates()
{
  return MEMORY[0x270F05ED0]();
}

uint64_t UIAccessibilityConvertAttachmentsInAttributedStringToAX()
{
  return MEMORY[0x270F80970]();
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

uint64_t UIAccessibilityConvertRectToPortraitCoordinates()
{
  return MEMORY[0x270F80988]();
}

uint64_t UIAccessibilityCreateEventForSceneReferencePoint()
{
  return MEMORY[0x270F80990]();
}

uint64_t UIAccessibilityEmojiDescription()
{
  return MEMORY[0x270F097D0]();
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x270F05EF0](assistiveTechnologyIdentifier);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

uint64_t UIAccessibilityFrameToBounds()
{
  return MEMORY[0x270F809A0]();
}

uint64_t UIAccessibilityGetKeyboardLayoutStar()
{
  return MEMORY[0x270F809A8]();
}

uint64_t UIAccessibilityIsAppExtension()
{
  return MEMORY[0x270F809B0]();
}

uint64_t UIAccessibilityIsImageScreenshot()
{
  return MEMORY[0x270F097D8]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

uint64_t UIAccessibilityIsWidgetExtension()
{
  return MEMORY[0x270F809B8]();
}

uint64_t UIAccessibilityLanguageForLanguage()
{
  return MEMORY[0x270F809C8]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x270F097E0]();
}

uint64_t UIAccessibilityPhotoCreationDate()
{
  return MEMORY[0x270F097F0]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x270F809D8]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x270F809E0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilityRelateElements()
{
  return MEMORY[0x270F809E8]();
}

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x270F80A08]();
}

uint64_t UIAccessibilityUnrelateAllElements()
{
  return MEMORY[0x270F80A28]();
}

uint64_t UIAccessibilityViewHasHiddenOrZeroAlphaAncestor()
{
  return MEMORY[0x270F80A30]();
}

uint64_t UIAccessibilityWindowForContextId()
{
  return MEMORY[0x270F80A38]();
}

void UIAccessibilityZoomFocusChanged(UIAccessibilityZoomType type, CGRect frame, UIView *view)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

uint64_t UIImageGetTableNextButton()
{
  return MEMORY[0x270F06060]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIKeyboardGetCurrentUILanguage()
{
  return MEMORY[0x270F060D0]();
}

uint64_t UIKeyboardInputModeGetLanguage()
{
  return MEMORY[0x270F06128]();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return MEMORY[0x270F06130]();
}

uint64_t UIKeyboardPredictionEnabledForCurrentInputMode()
{
  return MEMORY[0x270F06198]();
}

uint64_t UIKeyboardSetSplit()
{
  return MEMORY[0x270F061B0]();
}

uint64_t UIKeyboardSupportsSplit()
{
  return MEMORY[0x270F061B8]();
}

uint64_t UIKeyboardTypeIsNumberPad()
{
  return MEMORY[0x270F061C0]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t UIKitAccessibilityLocalizedStringInTable()
{
  return MEMORY[0x270F80A48]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x270F061E0]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F06270]();
}

uint64_t UISLocalizedStringForSecureName()
{
  return MEMORY[0x270F83050]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x270F06288]();
}

uint64_t UIStatusBarStyleIsDoubleHeight()
{
  return MEMORY[0x270F06298]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x270F095B8]();
}

uint64_t VOTLogHandwriting()
{
  return MEMORY[0x270F095C0]();
}

uint64_t _AXAddToElementCache()
{
  return MEMORY[0x270F09920]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t _AXFeatureSupportsScrollBars()
{
  return MEMORY[0x270F0A400]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F095E8]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90570]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSAuditInspectionModeEnabled()
{
  return MEMORY[0x270F905F0]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXSAutomationFauxCollectionViewCellsEnabled()
{
  return MEMORY[0x270F90608]();
}

uint64_t _AXSAutomationFauxTableViewCellsEnabled()
{
  return MEMORY[0x270F90610]();
}

uint64_t _AXSAutomationHitpointWarpingEnabled()
{
  return MEMORY[0x270F90618]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSFullKeyboardAccessFocusRingEnabled()
{
  return MEMORY[0x270F90760]();
}

uint64_t _AXSFullKeyboardAccessPassthroughModeEnabled()
{
  return MEMORY[0x270F90768]();
}

uint64_t _AXSHoverTextTypingEnabled()
{
  return MEMORY[0x270F90868]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x270F90870]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x270F908F0]();
}

uint64_t _AXSQuickSpeakEnabled()
{
  return MEMORY[0x270F90970]();
}

uint64_t _AXSQuickSpeakHighlightTextEnabled()
{
  return MEMORY[0x270F90978]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x270F90AE0]();
}

uint64_t _AXSSpeakThisHighlightVisible()
{
  return MEMORY[0x270F90AE8]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x270F095F8]();
}

uint64_t _AXUIElementCreateAppElementWithPid()
{
  return MEMORY[0x270F09978]();
}

uint64_t _AXUIElementRemoteBridgeMachPortForAXServer()
{
  return MEMORY[0x270F099B0]();
}

uint64_t _AXUIElementSetMachPortForNextMessage()
{
  return MEMORY[0x270F099C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x270EE5648]();
}

uint64_t _UIAXAssignFocusToItem()
{
  return MEMORY[0x270F062C8]();
}

uint64_t _UIAXDismissKeyboardIfNecessary()
{
  return MEMORY[0x270F80A60]();
}

uint64_t _UIAXLastKeyboardUsed()
{
  return MEMORY[0x270F80A70]();
}

uint64_t _UIAXObjectIsBehindKeyboard()
{
  return MEMORY[0x270F80A78]();
}

uint64_t _UIAXSetLastKeyboardUsed()
{
  return MEMORY[0x270F80A80]();
}

uint64_t _UIAccessibilityBlockPostingOfAllNotifications()
{
  return MEMORY[0x270F80A88]();
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x270F80A90]();
}

uint64_t _UIAccessibilityFocusedElementForAssistiveTech()
{
  return MEMORY[0x270F80AB8]();
}

uint64_t _UIAccessibilityFocusedElements()
{
  return MEMORY[0x270F80AC0]();
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F062D8]();
}

uint64_t _UIAccessibilityIgnoreNextNotification()
{
  return MEMORY[0x270F80AC8]();
}

uint64_t _UIAccessibilityNextIgnoredNotification()
{
  return MEMORY[0x270F80AD0]();
}

uint64_t _UIAccessibilitySetAssociatedElementContextForNextNotification()
{
  return MEMORY[0x270F80AD8]();
}

uint64_t _UIAccessibilityStartedWithInitialization()
{
  return MEMORY[0x270F062F8]();
}

uint64_t _UIAccessibilityUnblockPostingOfNotification()
{
  return MEMORY[0x270F80AE8]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x270F06310]();
}

uint64_t _UIApplicationIsWebKitLoaded()
{
  return MEMORY[0x270F06318]();
}

uint64_t _UIImageIsSystemSymbol()
{
  return MEMORY[0x270F06368]();
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

uint64_t __UIAccessibilityCastAsProtocol()
{
  return MEMORY[0x270F09608]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F09610]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x270F09620]();
}

uint64_t __UIAccessibilityGetAssociatedInt()
{
  return MEMORY[0x270F09638]();
}

uint64_t __UIAccessibilityGetAssociatedInteger()
{
  return MEMORY[0x270F09640]();
}

uint64_t __UIAccessibilityGetAssociatedLong()
{
  return MEMORY[0x270F09648]();
}

uint64_t __UIAccessibilityGetAssociatedNonRetainedObject()
{
  return MEMORY[0x270F09650]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F09658]();
}

uint64_t __UIAccessibilityGetAssociatedUnsignedInt()
{
  return MEMORY[0x270F09660]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x270F09678]();
}

uint64_t __UIAccessibilitySetAssociatedInt()
{
  return MEMORY[0x270F09698]();
}

uint64_t __UIAccessibilitySetAssociatedInteger()
{
  return MEMORY[0x270F096A0]();
}

uint64_t __UIAccessibilitySetAssociatedLong()
{
  return MEMORY[0x270F096A8]();
}

uint64_t __UIAccessibilitySetAssociatedNonRetainedObject()
{
  return MEMORY[0x270F096B0]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x270F096B8]();
}

uint64_t __UIAccessibilitySetAssociatedUnsignedInt()
{
  return MEMORY[0x270F096C0]();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x270F096D0]();
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

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x270F80B08]();
}

uint64_t accessibilityUIKitSymbolNamesLocalizedString()
{
  return MEMORY[0x270F80B10]();
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x270F9A428](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x270F9A4C8](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x270F9A4D0](v);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}