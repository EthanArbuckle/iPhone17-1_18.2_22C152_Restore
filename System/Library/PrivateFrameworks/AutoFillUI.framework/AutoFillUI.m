void sub_248A93428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A938B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_248A93AE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_248A93EEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_248A9404C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_248A95FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 104));
  _Unwind_Resume(a1);
}

void sub_248A961F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A96408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A96788(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
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

uint64_t _AFUIShouldDisableDetectingNonInteractiveFields()
{
  if (_AFUIShouldDisableDetectingNonInteractiveFields_onceToken != -1) {
    dispatch_once(&_AFUIShouldDisableDetectingNonInteractiveFields_onceToken, &__block_literal_global_3);
  }
  return _AFUIShouldDisableDetectingNonInteractiveFields_disableDetectingNonInteractiveFields;
}

id AFUIServiceDelegateOSLogFacility()
{
  if (AFUIServiceDelegateOSLogFacility_onceToken != -1) {
    dispatch_once(&AFUIServiceDelegateOSLogFacility_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)AFUIServiceDelegateOSLogFacility_logFacility;

  return v0;
}

uint64_t __AFUIServiceDelegateOSLogFacility_block_invoke()
{
  AFUIServiceDelegateOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.AutoFillUI", "AFUIServiceDelegate");

  return MEMORY[0x270F9A758]();
}

id AFUIPanelOSLogFacility()
{
  if (AFUIPanelOSLogFacility_onceToken != -1) {
    dispatch_once(&AFUIPanelOSLogFacility_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)AFUIPanelOSLogFacility_logFacility;

  return v0;
}

uint64_t __AFUIPanelOSLogFacility_block_invoke()
{
  AFUIPanelOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.AutoFillUI", "AFUIPanel");

  return MEMORY[0x270F9A758]();
}

id AFUIAutoFillPopoverControllerOSLogFacility()
{
  if (AFUIAutoFillPopoverControllerOSLogFacility_onceToken != -1) {
    dispatch_once(&AFUIAutoFillPopoverControllerOSLogFacility_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)AFUIAutoFillPopoverControllerOSLogFacility_logFacility;

  return v0;
}

uint64_t __AFUIAutoFillPopoverControllerOSLogFacility_block_invoke()
{
  AFUIAutoFillPopoverControllerOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.AutoFillUI", "AFUIAutoFillPopoverController");

  return MEMORY[0x270F9A758]();
}

uint64_t AFKeyboardTypeIsNumberPad(unsigned int a1)
{
  return (a1 < 0xE) & (0x2930u >> a1);
}

uint64_t AFTextContentTypeExpectsNumberPads(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"one-time-code"] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F295A0]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29560]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F294C8]] & 1) != 0
    || ([v1 isEqualToString:@"cc-csc"] & 1) != 0
    || ([v1 isEqualToString:@"cc-exp"] & 1) != 0
    || ([v1 isEqualToString:@"cc-exp-month"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"cc-exp-year"];
  }

  return v2;
}

void sub_248A990B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t AFUITextSignalsFoundInKeywordsList(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __AFUITextSignalsFoundInKeywordsList_block_invoke;
  v8[3] = &unk_265249348;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [v3 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_248A9A6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_248A9B818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_248A9B954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_248A9BED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 256), 8);
  _Block_object_dispose((const void *)(v51 - 128), 8);
  _Unwind_Resume(a1);
}

id get_SFAppPasswordSavingViewControllerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)get_SFAppPasswordSavingViewControllerClass_softClass;
  uint64_t v7 = get_SFAppPasswordSavingViewControllerClass_softClass;
  if (!get_SFAppPasswordSavingViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_SFAppPasswordSavingViewControllerClass_block_invoke;
    v3[3] = &unk_265249370;
    v3[4] = &v4;
    __get_SFAppPasswordSavingViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_248A9E0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __AFUITextSignalsFoundInKeywordsList_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __AFUIRegularExpressionForEmail_block_invoke()
{
  if (!AFUIRegularExpressionForEmail_regEx)
  {
    AFUIRegularExpressionForEmail_regEx = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" options:1 error:0];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __AFUISupportsCarPlayMaps_block_invoke()
{
  uint64_t result = AFUISelfTaskHasEntitlement(@"com.apple.developer.carplay-maps");
  AFUISupportsCarPlayMaps__hasCarPlayMapsEntitlement = result;
  return result;
}

uint64_t __SafariServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariServicesLibraryCore_frameworkLibrary = result;
  return result;
}

id get_SFAppAutoFillPasswordViewControllerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)get_SFAppAutoFillPasswordViewControllerClass_softClass;
  uint64_t v7 = get_SFAppAutoFillPasswordViewControllerClass_softClass;
  if (!get_SFAppAutoFillPasswordViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_SFAppAutoFillPasswordViewControllerClass_block_invoke;
    v3[3] = &unk_265249370;
    v3[4] = &v4;
    __get_SFAppAutoFillPasswordViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_248A9EC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SafariServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SafariServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_248A9F2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AFUIIsAppleApp()
{
  if (AFUIIsAppleApp_onceToken != -1) {
    dispatch_once(&AFUIIsAppleApp_onceToken, &__block_literal_global_6);
  }
  return AFUIIsAppleApp_isAppleApp;
}

void __AFUIIsAppleApp_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  AFUIIsAppleApp_isAppleApp = [v0 hasPrefix:@"com.apple."];
}

BOOL AFUICanDisplayAllSuggestions()
{
  v0 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x263F82E88] _applicationKeyWindow];
  id v3 = [v2 traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] != 1;

  return v4;
}

uint64_t AFUIResponderIsExemptFromDetectionHints(Class aClass)
{
  if (AFUIResponderIsExemptFromDetectionHints_onceToken == -1)
  {
    if (aClass)
    {
LABEL_3:
      uint64_t v2 = (void *)AFUIResponderIsExemptFromDetectionHints__exemptClasses;
      id v3 = NSStringFromClass(aClass);
      uint64_t v4 = [v2 containsObject:v3];

      return v4;
    }
  }
  else
  {
    dispatch_once(&AFUIResponderIsExemptFromDetectionHints_onceToken, &__block_literal_global_61);
    if (aClass) {
      goto LABEL_3;
    }
  }
  return 0;
}

uint64_t __AFUIResponderIsExemptFromDetectionHints_block_invoke()
{
  AFUIResponderIsExemptFromDetectionHints__exemptClasses = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"CKMessageEntryRichTextView", @"Reminders.TTRIReminderTitleTextView", @"UnifiedField", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t _AFUITaskHasEntitlement(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(void (**)(uint64_t))(a2 + 16))(a2);
  id v3 = v2;
  if (v2 && (CFTypeID v4 = CFGetTypeID(v2), v4 == CFBooleanGetTypeID())) {
    uint64_t v5 = [v3 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t AFUISelfTaskHasEntitlement(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __AFUISelfTaskHasEntitlement_block_invoke;
  v5[3] = &unk_265249520;
  id v6 = v1;
  id v2 = v1;
  uint64_t HasEntitlement = _AFUITaskHasEntitlement((uint64_t)v2, (uint64_t)v5);

  return HasEntitlement;
}

id __AFUISelfTaskHasEntitlement_block_invoke(uint64_t a1)
{
  return _AFUICopyValueForEntitlementUsingTaskCreationBlock(*(void **)(a1 + 32), (uint64_t)&__block_literal_global_81_0);
}

uint64_t AFUICopyValueForEntitlementFromSelf(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

id _AFUICopyValueForEntitlementUsingTaskCreationBlock(void *a1, uint64_t a2)
{
  id v3 = *(uint64_t (**)(uint64_t))(a2 + 16);
  CFTypeID v4 = a1;
  uint64_t v5 = (__SecTask *)v3(a2);
  if (v5)
  {
    id v6 = v5;
    CFErrorRef error = 0;
    uint64_t v7 = (void *)SecTaskCopyValueForEntitlement(v5, v4, &error);

    if (error)
    {
      NSLog(&cfstr_UnableToGetEnt.isa, error);
      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    NSLog(&cfstr_UnableToCreate.isa, v4);

    uint64_t v7 = 0;
  }

  return v7;
}

SecTaskRef __AFUICopyValueForEntitlementFromSelf_block_invoke()
{
  return SecTaskCreateFromSelf(0);
}

uint64_t AFTextContentTypeIsInNameSet(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x263F29518]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F294F8]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F294E8]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29510]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29520]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29528]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F29538]];
  }

  return v2;
}

uint64_t AFTextContentTypeIsInPhoneSet(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x263F295A0]] & 1) != 0
    || ([v1 isEqualToString:@"tel-national"] & 1) != 0
    || ([v1 isEqualToString:@"tel-country-code"] & 1) != 0
    || ([v1 isEqualToString:@"tel-area-code"] & 1) != 0
    || ([v1 isEqualToString:@"tel-local"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"tel-extension"];
  }

  return v2;
}

uint64_t AFTextContentTypeIsInBirthdaySet(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x263F29468]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29470]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29478]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F29480]];
  }

  return v2;
}

uint64_t AFTextContentTypeIsInContactSet(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x263F294E0]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F295A8]] & 1) != 0
    || (AFTextContentTypeIsInNameSet(v1) & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29500]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29550]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F295A0]] & 1) != 0
    || (AFTextContentTypeIsInAddressSet(v1) & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = AFTextContentTypeIsInBirthdaySet(v1);
  }

  return v2;
}

uint64_t AFTextContentTypeIsInAddressSet(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x263F294F0]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29568]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29570]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29450]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29460]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29458]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29578]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F29488]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F29560]];
  }

  return v2;
}

uint64_t AFTextContentTypeIsInCreditCardSet(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x263F294C8]] & 1) != 0
    || ([v1 isEqualToString:@"cc-name"] & 1) != 0
    || ([v1 isEqualToString:@"cc-given-name"] & 1) != 0
    || ([v1 isEqualToString:@"cc-additional-name"] & 1) != 0
    || ([v1 isEqualToString:@"cc-family-name"] & 1) != 0
    || ([v1 isEqualToString:@"cc-csc"] & 1) != 0
    || ([v1 isEqualToString:@"cc-exp"] & 1) != 0
    || ([v1 isEqualToString:@"cc-exp-month"] & 1) != 0
    || ([v1 isEqualToString:@"cc-exp-year"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"cc-type"];
  }

  return v2;
}

uint64_t AFTextContentTypeIsInJobSet(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263F29550]]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F29500]];
  }

  return v2;
}

uint64_t AFTextContentTypeIsInCellularSet(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"esim-eid"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"esim-imei"];
  }

  return v2;
}

id AFUIPreferredSubtitleOrder()
{
  v9[15] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F294F8];
  v9[0] = *MEMORY[0x263F29518];
  v9[1] = v0;
  uint64_t v1 = *MEMORY[0x263F294E8];
  v9[2] = *MEMORY[0x263F29510];
  v9[3] = v1;
  uint64_t v2 = *MEMORY[0x263F29568];
  v9[4] = *MEMORY[0x263F294F0];
  v9[5] = v2;
  uint64_t v3 = *MEMORY[0x263F29450];
  v9[6] = *MEMORY[0x263F29570];
  v9[7] = v3;
  uint64_t v4 = *MEMORY[0x263F29458];
  v9[8] = *MEMORY[0x263F29460];
  v9[9] = v4;
  uint64_t v5 = *MEMORY[0x263F29488];
  v9[10] = *MEMORY[0x263F29578];
  v9[11] = v5;
  uint64_t v6 = *MEMORY[0x263F295A0];
  v9[12] = *MEMORY[0x263F29560];
  v9[13] = v6;
  v9[14] = *MEMORY[0x263F294E0];
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:15];

  return v7;
}

id _AFUIUIAppLocalizedStringWithDefaultValue(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 bundleForClass:_AFUIApplicationClass()];
  uint64_t v7 = [v6 localizedStringForKey:v5 value:v4 table:@"Localizable"];

  return v7;
}

void _AFUICacheRuntimeObjects()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
}

id _AFUIColorClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUIColorClass;

  return v0;
}

id _AFUIFontClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUIFontClass;

  return v0;
}

id _AFUIResponderClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUIResponderClass;

  return v0;
}

id _AFUIViewClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUIViewClass;

  return v0;
}

id _AFUIViewControllerClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUIViewControllerClass;

  return v0;
}

id _AFUINavigationControllerClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUINavigationControllerClass;

  return v0;
}

id _AFUIApplicationClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUIApplicationClass;

  return v0;
}

id _AFUITextFieldClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUITextFieldClass;

  return v0;
}

id _AFUISecureTextFieldClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUISecureTextFieldClass;

  return v0;
}

id _AFUITextViewClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUITextViewClass;

  return v0;
}

id _AFUIButtonClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUIButtonClass;

  return v0;
}

id _AFUITraitsClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUITraitsClass;

  return v0;
}

id _AFUITraitsProtocol()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUITraitsProtocol;

  return v0;
}

id _AFUITextInputProtocol()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1) {
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)__AFUITextInputProtocol;

  return v0;
}

void sub_248AA2498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
}

void sub_248AA32D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFSafariCreditCardStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SafariFoundationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265249580;
    uint64_t v6 = 0;
    SafariFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SafariFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFSafariCreditCardStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSFSafariCreditCardStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFSafariCreditCardStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SafariFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_248AA502C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248AA5638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248AA5DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFSafariCreditCardStoreClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SafariFoundationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SafariFoundationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2652495C0;
    uint64_t v6 = 0;
    SafariFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SafariFoundationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFSafariCreditCardStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSFSafariCreditCardStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFSafariCreditCardStoreClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SafariFoundationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SafariFoundationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_248AA6A38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_248AA7668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

uint64_t __isAutoFillPanelAlwaysBlockedForBundleID_block_invoke()
{
  isAutoFillPanelAlwaysBlockedForBundleID_blockedBundleIDs = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.mobilesafari", @"com.apple.SafariViewService", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __isAutoFillPanelAlwaysAllowedForBundleID_block_invoke()
{
  isAutoFillPanelAlwaysAllowedForBundleID_allowedBundleIDs = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.quicklook", @"com.apple.quicklook.extension.previewUI", @"com.apple.quicklook.UIExtension", @"com.apple.mobilenotes", 0);

  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_debug_impl(a1, v13, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

void OUTLINED_FUNCTION_7(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_debug_impl(a1, v13, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

void sub_248AACBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248AAD0B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_248AAD2A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_248AAFD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_248AB02E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_248AB04B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_248AB0A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_248AB12C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void OUTLINED_FUNCTION_0_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

uint64_t __getSFSafariCreditCardStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:](v0);
}

uint64_t BKSHIDServicesGetCALayerTransform()
{
  return MEMORY[0x270F10500]();
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x270EFB850]();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x270EFB918](retstr, t);
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x270EFB990]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x270EF2B98](namestr);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t UIPointIsDiscrete()
{
  return MEMORY[0x270F82E40]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F82EC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x270EE56D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}