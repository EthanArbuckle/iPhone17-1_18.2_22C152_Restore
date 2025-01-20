uint64_t _SFShouldShowChineseFeatures()
{
  uint64_t vars8;

  if (_SFDeviceRegionCodeIsChina()) {
    return 1;
  }

  return _SFPreferredLanguagesIncludesAnyLanguage(&unk_1EFBDF970);
}

uint64_t _SFDeviceRegionCodeIsChina()
{
  v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  v1 = [v0 countryCode];

  uint64_t v2 = [v1 isEqualToString:@"CN"];
  return v2;
}

uint64_t _SFShouldShowRussianFeatures()
{
  v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  v1 = [v0 objectForKey:*MEMORY[0x1E4F1C400]];
  if (([v1 isEqualToString:@"RU"] & 1) != 0
    || ([v1 isEqualToString:@"UA"] & 1) != 0
    || ([v1 isEqualToString:@"TR"] & 1) != 0
    || ([v1 isEqualToString:@"KZ"] & 1) != 0
    || ([v1 isEqualToString:@"BY"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = _SFPreferredLanguagesIncludesAnyLanguage(&unk_1EFBDF988);
  }

  return v2;
}

uint64_t _SFPreferredLanguagesIncludesAnyLanguage(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  [MEMORY[0x1E4F1CA20] preferredLanguages];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        v7 = [v6 languageCode];
        char v8 = [v1 containsObject:v7];

        if (v8)
        {
          uint64_t v3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

uint64_t restrictedValueForKey(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  id v3 = v1;
  if ([v3 isEqualToString:*MEMORY[0x1E4F78940]])
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F74138];
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F78938]])
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F74140];
  }
  else
  {
    if (([v3 isEqualToString:*MEMORY[0x1E4F789E0]] & 1) == 0)
    {

      id v5 = 0;
LABEL_11:
      uint64_t v6 = 0;
      goto LABEL_12;
    }
    uint64_t v4 = (id *)MEMORY[0x1E4F74130];
  }
  id v5 = *v4;

  if (!v5 || ![v2 isBoolSettingLockedDownByRestrictions:v5]) {
    goto LABEL_11;
  }
  uint64_t v6 = [v2 BOOLRestrictionForFeature:v5];
LABEL_12:

  return v6;
}

id _SFLocalizedTitleStringForShortcutItemType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilesafari.shortcut.openNewTab"]
    || [v1 isEqualToString:@"com.apple.mobilesafari.shortcut.openNewPrivateTab"]
    || [v1 isEqualToString:@"com.apple.mobilesafari.shortcut.openBookmarksView"]
    || [v1 isEqualToString:@"com.apple.mobilesafari.shortcut.openReadingListView"])
  {
    id v2 = _WBSLocalizedString();
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_1A690FC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A690FD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A690FEA8(_Unwind_Exception *exception_object)
{
}

void sub_1A690FFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6910174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A691023C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69102A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD0C36A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD0C36A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

__n128 __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD0C36A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD0C36A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD0C36A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1A6913CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6914278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A6914564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6914634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6914758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69149E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6914CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6914E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXContentBlockers()
{
  if (WBS_LOG_CHANNEL_PREFIXContentBlockers_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXContentBlockers_onceToken, &__block_literal_global_31);
  }
  return WBS_LOG_CHANNEL_PREFIXContentBlockers_log;
}

void sub_1A691517C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6915430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A691563C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6915AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6915D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A69163B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A6916700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69170D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id pathToRecompilationInformation(void)
{
  v0 = _SFContentBlockerStoreURL();
  id v1 = [v0 URLByAppendingPathComponent:@"RecompiledBlockers.plist" isDirectory:0];

  return v1;
}

void sub_1A691717C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6917728(_Unwind_Exception *a1)
{
  v9 = v7;

  _Unwind_Resume(a1);
}

id metadataClasses(void)
{
  v0 = (void *)metadataClasses(void)::classes;
  if (!metadataClasses(void)::classes)
  {
    id v1 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v1, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
    long long v10 = (void *)metadataClasses(void)::classes;
    metadataClasses(void)::classes = v9;

    v0 = (void *)metadataClasses(void)::classes;
  }

  return v0;
}

void sub_1A6917C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6917E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6918038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69180D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6918338(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXPerSitePreferences()
{
  if (WBS_LOG_CHANNEL_PREFIXPerSitePreferences_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPerSitePreferences_onceToken, &__block_literal_global_76);
  }
  return WBS_LOG_CHANNEL_PREFIXPerSitePreferences_log;
}

void sub_1A6919984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6919CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6919DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _SFDeviceRegionCodeIsRussia()
{
  v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v1 = [v0 countryCode];

  uint64_t v2 = [v1 isEqualToString:@"RU"];
  return v2;
}

void sub_1A691A544(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A691A924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A691A9EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A691AA6C(_Unwind_Exception *a1)
{
}

void sub_1A691AAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A691ABFC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A691AD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A691AE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A691BCE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A691BFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _SFShouldShowLinkPreviews()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E4F789F0], (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 0;
  }
  return !v1;
}

id _SFUIActionForToggleShowLinkPreviews()
{
  v0 = [MEMORY[0x1E4F46770] elementActionWithType:11];
  if (objc_opt_respondsToSelector()) {
    [v0 uiActionForElementInfo:0];
  }
  else {
  BOOL v1 = [MEMORY[0x1E4FB13F0] actionWithTitle:@"Toggle Link Preview (Staging)" image:0 identifier:0 handler:&__block_literal_global];
  }

  return v1;
}

void sub_1A691DD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
}

void sub_1A691E88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location)
{
  objc_destroyWeak((id *)(v10 - 136));
  _Unwind_Resume(a1);
}

void sub_1A691EDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6920E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WebContentAnalysisLibraryCore()
{
  if (!WebContentAnalysisLibraryCore_frameworkLibrary) {
    WebContentAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return WebContentAnalysisLibraryCore_frameworkLibrary;
}

uint64_t __WebContentAnalysisLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebContentAnalysisLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getWFUserSettingsClass_block_invoke(uint64_t a1)
{
  if (!WebContentAnalysisLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("WFUserSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWFUserSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = (_SFTelephonyNavigationMitigationPolicy *)__getWFUserSettingsClass_block_invoke_cold_1();
    return (Class)[(_SFTelephonyNavigationMitigationPolicy *)v4 policyAppliesToURL:v6];
  }
  return result;
}

void sub_1A6924054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getASCLockupProductDetailsInteractionTypeSelectedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AppStoreComponentsLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AppStoreComponentsLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5C72468;
    uint64_t v7 = 0;
    AppStoreComponentsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)AppStoreComponentsLibraryCore_frameworkLibrary;
    if (AppStoreComponentsLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)AppStoreComponentsLibraryCore_frameworkLibrary;
LABEL_5:
  Class result = dlsym(v2, "ASCLockupProductDetailsInteractionTypeSelected");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASCLockupProductDetailsInteractionTypeSelectedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

uint64_t __AppStoreComponentsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppStoreComponentsLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A692509C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A69252E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69254D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6925ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

id getWebBookmarkClass(void)
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getWebBookmarkClass(void)::softClass;
  uint64_t v7 = getWebBookmarkClass(void)::softClass;
  if (!getWebBookmarkClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL19getWebBookmarkClassv_block_invoke;
    v3[3] = &unk_1E5C72498;
    v3[4] = &v4;
    ___ZL19getWebBookmarkClassv_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6925C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6925EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class ___ZL19getWebBookmarkClassv_block_invoke(uint64_t a1)
{
  WebBookmarksLibrary();
  Class result = objc_getClass("WebBookmark");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWebBookmarkClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL19getWebBookmarkClassv_block_invoke_cold_1();
    return (Class)WebBookmarksLibrary();
  }
  return result;
}

uint64_t WebBookmarksLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!WebBookmarksLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = ___ZL23WebBookmarksLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C724B8;
    uint64_t v5 = 0;
    WebBookmarksLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = WebBookmarksLibraryCore(char **)::frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!WebBookmarksLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL23WebBookmarksLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebBookmarksLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL35getkWebBookmarksAddressKeySymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)WebBookmarksLibrary();
  uint64_t result = dlsym(v2, "kWebBookmarksAddressKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWebBookmarksAddressKeySymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL33getkWebBookmarksTitleKeySymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)WebBookmarksLibrary();
  uint64_t result = dlsym(v2, "kWebBookmarksTitleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWebBookmarksTitleKeySymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL39getkWebBookmarksPreviewTextKeySymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)WebBookmarksLibrary();
  uint64_t result = dlsym(v2, "kWebBookmarksPreviewTextKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWebBookmarksPreviewTextKeySymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL52getkWebBookmarksAddToReadingListMessageNameSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)WebBookmarksLibrary();
  uint64_t result = dlsym(v2, "kWebBookmarksAddToReadingListMessageName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWebBookmarksAddToReadingListMessageNameSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *___ZL32getkWebBookmarksItemKeySymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)WebBookmarksLibrary();
  uint64_t result = dlsym(v2, "kWebBookmarksItemKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWebBookmarksItemKeySymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL32getSafariFetcherServerProxyClassv_block_invoke(uint64_t a1)
{
  WebBookmarksLibrary();
  Class result = objc_getClass("SafariFetcherServerProxy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSafariFetcherServerProxyClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = ___ZL32getSafariFetcherServerProxyClassv_block_invoke_cold_1();
    return (Class)___ZL33getWebBookmarksXPCConnectionClassv_block_invoke(v3);
  }
  return result;
}

Class ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke(uint64_t a1)
{
  WebBookmarksLibrary();
  Class result = objc_getClass("WebBookmarksXPCConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getWebBookmarksXPCConnectionClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke_cold_1();
    return (Class)___ZL37getkWebBookmarksdServiceNameSymbolLocv_block_invoke();
  }
  return result;
}

void *___ZL37getkWebBookmarksdServiceNameSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)WebBookmarksLibrary();
  Class result = dlsym(v2, "kWebBookmarksdServiceName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkWebBookmarksdServiceNameSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A6926DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6928E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v12 = v10;

  a9.super_class = (Class)_SFWebProcessPlugIn;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t mouseDidMoveOverElementCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = WKMutableDictionaryCreate();
  [@"linkURL" UTF8String];
  WKStringCreateWithUTF8CString();
  WKBundleHitTestResultCopyAbsoluteLinkURL();
  WKDictionarySetItem();
  uint64_t Frame = WKBundleHitTestResultGetFrame();
  uint64_t result = WKBundleHitTestResultGetTargetFrame();
  uint64_t v8 = result;
  if (Frame)
  {
    [@"frame" UTF8String];
    WKStringCreateWithUTF8CString();
    WKBundleFrameCreateFrameHandle();
    uint64_t result = WKDictionarySetItem();
  }
  if (v8)
  {
    [@"targetFrame" UTF8String];
    WKStringCreateWithUTF8CString();
    WKBundleFrameCreateFrameHandle();
    uint64_t result = WKDictionarySetItem();
  }
  *a4 = v5;
  return result;
}

void willAddMessageWithDetailsToConsoleCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a2) {
    uint64_t v8 = (__CFString *)WKStringCopyCFString();
  }
  else {
    uint64_t v8 = &stru_1EFB97EB8;
  }
  uint64_t Size = WKArrayGetSize();
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Size];
  if (Size)
  {
    for (uint64_t i = 0; i != Size; ++i)
    {
      WKArrayGetItemAtIndex();
      int v12 = WKGetTypeID();
      if (v12 == WKStringGetTypeID())
      {
        long long v13 = (void *)WKStringCopyCFString();
        [v10 addObject:v13];
      }
    }
  }
  if ([v10 count])
  {
    id v23 = [(__CFString *)v8 stringByAppendingString:@" "];

    v14 = [v10 componentsJoinedByString:@" "];
    uint64_t v8 = [v23 stringByAppendingString:v14];
  }
  if (a6) {
    uint64_t v15 = (__CFString *)WKStringCopyCFString();
  }
  else {
    uint64_t v15 = &stru_1EFB97EB8;
  }
  if ([(__CFString *)v15 length]) {
    [NSString stringWithFormat:@"%@:%u:%u: %@\n", v15, a4, a5, v8];
  }
  else {
  v16 = [NSString stringWithFormat:@"%@\n", v8];
  }
  v17 = [a7 webProcessPlugIn];
  v18 = (FILE *)v17[3];

  id v19 = v16;
  fprintf(v18, "%s\n", (const char *)[v19 cStringUsingEncoding:4]);
}

void sub_1A69291B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6929334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6929F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A692A154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A692A250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A692A2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A692A380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A692A410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL isDiffieHellmanError(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, "_web_errorIsInDomain:", *MEMORY[0x1E4F289A0])
    && [v1 code] == -1200)
  {
    uint64_t v2 = [v1 userInfo];
    uint64_t v3 = *MEMORY[0x1E4F18EE0];
    long long v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F18EE0]];

    if (v4)
    {
      BOOL v5 = [v4 integerValue] == -9850;
    }
    else
    {
      uint64_t v6 = [v1 userInfo];
      uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (v7
        && ([v7 userInfo],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            [v8 objectForKeyedSubscript:v3],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            v8,
            v9))
      {
        BOOL v5 = [v9 integerValue] == -9850;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

id newAlertToListPossibleClientSideCertificatesWithContext(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"authenticationChallenge"];
  uint64_t v3 = [v2 protectionSpace];

  long long v4 = NSString;
  BOOL v5 = _WBSLocalizedString();
  uint64_t v6 = [v3 host];
  uint64_t v7 = objc_msgSend(v6, "_webkit_decodeHostName");
  uint64_t v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);

  uint64_t v9 = objc_msgSend(v3, "_sf_identities");
  uint64_t v10 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = v10;
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = [v9 count];
    _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEFAULT, "Displaying identities picker of count: %lu", buf, 0xCu);
  }
  if ((unint64_t)[v9 count] < 2)
  {
    *(void *)buf = 0;
    uint64_t v15 = 0;
    if (!SecIdentityCopyCertificate((SecIdentityRef)[v9 objectAtIndex:0], (SecCertificateRef *)buf))
    {
      uint64_t v15 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
      CFRelease(*(CFTypeRef *)buf);
    }
    v16 = NSString;
    v17 = _WBSLocalizedString();
    v18 = &stru_1EFB97EB8;
    if (v15) {
      v18 = v15;
    }
    id v19 = objc_msgSend(v16, "stringWithFormat:", v17, v18);

    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB6F00]) initWithType:4 title:v8 bodyText:v19 defaultAction:5 otherAction:4 tableAction:0];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4FB6F00]);
    long long v13 = _WBSLocalizedString();
    v14 = (void *)[v12 initWithType:4 title:v8 bodyText:v13 defaultAction:4 otherAction:0 tableAction:5];

    [v14 setHideAction:4];
  }
  [v14 setIdentities:v9];
  [v14 setContext:v1];

  return v14;
}

void proceedWithClientCertificateIdentity(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = (void *)WBSSecIdentityCopySSLClientAuthenticationChain();
  BOOL v5 = [v3 objectForKey:@"completionHandler"];
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v3 objectForKey:@"reason"];
    if (![v6 isEqualToString:@"reasonAuthenticationChallenge"]
      || ([v3 objectForKey:@"authenticationChallenge"],
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v5) {
        v5[2](v5, 3, 0);
      }
      goto LABEL_18;
    }
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [v4 count];
    uint64_t v10 = (void *)MEMORY[0x1E4F18D88];
    if (v9 <= 1)
    {
      id v12 = [MEMORY[0x1E4F18D88] credentialWithIdentity:a1 certificates:0 persistence:1];
      if (v5) {
        goto LABEL_7;
      }
    }
    else
    {
      long long v11 = objc_msgSend(v4, "subarrayWithRange:", 1, v9 - 1);
      id v12 = [v10 credentialWithIdentity:a1 certificates:v11 persistence:1];

      if (v5)
      {
LABEL_7:
        ((void (**)(void, void, void *))v5)[2](v5, 0, v12);
LABEL_15:
        uint64_t v15 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 134217984;
          unint64_t v17 = v9;
          _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_DEFAULT, "Answered challenge with credential with certificate chain count=%lu", (uint8_t *)&v16, 0xCu);
        }

LABEL_18:
        goto LABEL_19;
      }
    }
    v14 = [v8 sender];
    [v14 useCredential:v12 forAuthenticationChallenge:v8];

    goto LABEL_15;
  }
  long long v13 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    proceedWithClientCertificateIdentity_cold_1(v13);
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  if (v5) {
LABEL_10:
  }
    v5[2](v5, 3, 0);
LABEL_19:
}

id newAlertToHandleClientSideCertificateErrorCode(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = [v3 objectForKey:@"authenticationChallenge"];
  BOOL v5 = [v4 protectionSpace];
  uint64_t v6 = objc_msgSend(v5, "_sf_identities");

  unint64_t v7 = [v6 count];
  if (a1 == -1205 && v7 <= 1)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      newAlertToHandleClientSideCertificateErrorCode_cold_1(v8);
    }
LABEL_11:
    long long v13 = 0;
    goto LABEL_20;
  }
  if (a1 == -1206 && v7 == 1)
  {
    unint64_t v9 = [v3 objectForKeyedSubscript:@"useOnlyAvailableIdentityWithoutPrompting"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      long long v11 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEFAULT, "Found one matching identity with preference to skip prompting", (uint8_t *)&v19, 2u);
      }
      id v12 = [v6 firstObject];
      proceedWithClientCertificateIdentity((uint64_t)v12, v3);

      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (v7)
  {
LABEL_13:
    long long v13 = newAlertToListPossibleClientSideCertificatesWithContext(v3);
    goto LABEL_20;
  }
  if (v4)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138739971;
      v20 = v4;
      _os_log_impl(&dword_1A690B000, v14, OS_LOG_TYPE_DEFAULT, "No identities, but we have a challenge %{sensitive}@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v15 = [v4 sender];
    [v15 continueWithoutCredentialForAuthenticationChallenge:v4];

    long long v13 = 0;
    int v16 = 0;
  }
  else
  {
    unint64_t v17 = _WBSLocalizedString();
    int v16 = _WBSLocalizedString();
    long long v13 = (void *)[objc_alloc(MEMORY[0x1E4FB6F00]) initWithType:5 title:v17 bodyText:v16 defaultAction:7 otherAction:0];
  }
LABEL_20:

  return v13;
}

uint64_t attemptRecovery(void *a1)
{
  id v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x1E4F46818]];

  if ([v2 conformsToProtocol:&unk_1EFCBA1B8]) {
    uint64_t v3 = [v2 attemptRecovery];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1A692E6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCertificateViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CertInfoLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CertInfoLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C72828;
    uint64_t v6 = 0;
    CertInfoLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CertInfoLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CertificateViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCertificateViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCertificateViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CertInfoLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CertInfoLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A692F39C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A692F570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6930798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
}

void sub_1A6930ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6931024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6932E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6934CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6936F08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1A69382C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6939A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1A693A2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A693A8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A693B21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A693C560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1A693CDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

id getCRCameraReaderClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCRCameraReaderClass_softClass;
  uint64_t v7 = getCRCameraReaderClass_softClass;
  if (!getCRCameraReaderClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCRCameraReaderClass_block_invoke;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getCRCameraReaderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A693EA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A693EEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRCameraReaderClass_block_invoke(uint64_t a1)
{
  CoreRecognitionLibrary();
  Class result = objc_getClass("CRCameraReader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCRCameraReaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCRCameraReaderClass_block_invoke_cold_1();
    return (Class)CoreRecognitionLibrary();
  }
  return result;
}

uint64_t CoreRecognitionLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreRecognitionLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreRecognitionLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5C72B68;
    uint64_t v5 = 0;
    CoreRecognitionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreRecognitionLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!CoreRecognitionLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreRecognitionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreRecognitionLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCROutputTypeCreditCardCardholderNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreRecognitionLibrary();
  uint64_t result = dlsym(v2, "CROutputTypeCreditCardCardholderName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCROutputTypeCreditCardExpirationDateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreRecognitionLibrary();
  uint64_t result = dlsym(v2, "CROutputTypeCreditCardExpirationDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCROutputTypeCreditCardNumberSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreRecognitionLibrary();
  uint64_t result = dlsym(v2, "CROutputTypeCreditCardNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCROutputTypeCreditCardNumberSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id localObjectLoader(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "_sf_localBookmark");
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "_sf_localURL");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;

  return v5;
}

void objectLoader(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  v9[0] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __objectLoader_block_invoke;
  v7[3] = &unk_1E5C72D28;
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v4, "safari_loadObjectOfClasses:completionHandler:", v5, v7);
}

void sub_1A6940C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

uint64_t __objectLoader_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1A6941AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLPLinkMetadataClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLPLinkMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLPLinkMetadataClass_block_invoke_cold_1();
    LinkPresentationLibrary();
  }
}

void LinkPresentationLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __LinkPresentationLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C72D98;
    uint64_t v3 = 0;
    LinkPresentationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!LinkPresentationLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __LinkPresentationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary = result;
  return result;
}

void __getLPFileMetadataClass_block_invoke(uint64_t a1)
{
  LinkPresentationLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPFileMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLPFileMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (_SFExternalPasswordCredentialViewController *)__getLPFileMetadataClass_block_invoke_cold_1();
    [(_SFExternalPasswordCredentialViewController *)v2 autoFillWithExternalCredential:v4];
  }
}

void sub_1A6943400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6945678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6945704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)_SFBrowserView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A6945D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6945E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6945EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6945F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6945FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6946044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6946120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69462A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69465D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6946690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A694680C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69468F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6946A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6946B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6946C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6946CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6946E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6946FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getTPDialPromptAlertClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getTPDialPromptAlertClass_softClass;
  uint64_t v7 = getTPDialPromptAlertClass_softClass;
  if (!getTPDialPromptAlertClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getTPDialPromptAlertClass_block_invoke;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getTPDialPromptAlertClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A69475BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTPDialPromptAlertClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!TelephonyUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __TelephonyUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C72EC8;
    uint64_t v6 = 0;
    TelephonyUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!TelephonyUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("TPDialPromptAlert");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getTPDialPromptAlertClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getTPDialPromptAlertClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TelephonyUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TelephonyUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A6948670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694882C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A69488CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6948958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6948A88(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6948B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6948C88(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6948E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694903C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69490F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69493E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1A6949648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6949874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69499D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6949AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6949B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6949C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6949CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6949DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1A6949EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A694A030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A694A1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A694A308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694A440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694A5C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694A700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694AA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694AC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A694AD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694AF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694B0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A694B30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A694B414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694B530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A694B5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694B6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A694B748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694BA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A694BB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A694BC20(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A694BD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A694BE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694BF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694C1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1A694C2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A694C558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_1A694CAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

Class ___ZL36getCSSearchableItemAttributeSetClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreSpotlightLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL24CoreSpotlightLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C732E0;
    uint64_t v6 = 0;
    CoreSpotlightLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!CoreSpotlightLibraryCore(char **)::frameworkLibrary)
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
    Class result = objc_getClass("CSSearchableItemAttributeSet");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)___ZL36getCSSearchableItemAttributeSetClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCSSearchableItemAttributeSetClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL24CoreSpotlightLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

id subtitleFont()
{
  uint64_t v0 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  id v1 = (void *)MEMORY[0x1E4FB1798];
  [v0 pointSize];
  long long v2 = objc_msgSend(v1, "monospacedDigitSystemFontOfSize:weight:");

  return v2;
}

id verificationCodeFont()
{
  uint64_t v0 = (void *)MEMORY[0x1E4FB1798];
  id v1 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  long long v2 = objc_msgSend(v0, "_sf_highLegibilityAlternateFont:", v1);

  return v2;
}

void sub_1A694F480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6950238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id estimatedBarMetrics()
{
  uint64_t v0 = (void *)estimatedBarMetrics_metrics;
  if (!estimatedBarMetrics_metrics)
  {
    id v1 = objc_alloc_init(SFNavigationBarMetrics);
    long long v2 = (void *)estimatedBarMetrics_metrics;
    estimatedBarMetrics_metrics = (uint64_t)v1;

    uint64_t v0 = (void *)estimatedBarMetrics_metrics;
  }

  return v0;
}

void sub_1A6953890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id reverseAnimation(void *a1)
{
  id v1 = a1;
  [v1 beginTime];
  double v3 = v2;
  uint64_t v4 = [v1 beginTimeMode];
  if (([v4 isEqualToString:*MEMORY[0x1E4F39D60]] & 1) != 0
    || (double v5 = -v3, [v4 isEqualToString:*MEMORY[0x1E4F39D88]]) && v3 != 0.0)
  {
    double v5 = CACurrentMediaTime() - v3;
  }
  [v1 duration];
  double v7 = v6;
  id v8 = (void *)[v1 copy];
  [v8 speed];
  *(float *)&double v10 = -v9;
  [v8 setSpeed:v10];
  [v8 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  [v8 setBeginTime:v5 - v7];

  return v8;
}

void sub_1A6958F90(_Unwind_Exception *a1)
{
}

void scaleView(void *a1, CGFloat a2)
{
  id v3 = a1;
  CGAffineTransformMakeScale(&v4, a2, a2);
  [v3 setTransform:&v4];
}

void sub_1A695D378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __initializeConstants_block_invoke()
{
  uint64_t result = _SFOnePixel();
  kSeparatorHeight = v1;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1A69602B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69603A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6960534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6960620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6960694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6960FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6961084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _SFRequestDesktopSiteActivitySourceJavaScriptString()
{
  id v0 = [NSString alloc];
  uint64_t v1 = (void *)[v0 initWithBytesNoCopy:requestDesktopSiteUIActivitySource length:requestDesktopSiteUIActivitySourceLength encoding:4 freeWhenDone:0];

  return v1;
}

void sub_1A6962A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69646F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69647DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A696486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6964930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x1AD0C30D0](v10, 0x10A1C40D746C084);

  _Unwind_Resume(a1);
}

void sub_1A69649F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6964A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6964B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6964C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6964D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A696657C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1A6966868(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A6966970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A69672E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A6967A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void addURLsInFrameTreeToArray(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 URL];
  if (v5) {
    [v4 addObject:v5];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = objc_msgSend(v3, "childFrames", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        addURLsInFrameTreeToArray(*(void *)(*((void *)&v11 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

uint64_t frameIsDescendantOfFrame(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 == v4)
  {
    uint64_t v7 = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v6 = objc_msgSend(v4, "childFrames", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (frameIsDescendantOfFrame(v3, *(void *)(*((void *)&v11 + 1) + 8 * i)))
          {
            uint64_t v7 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v7;
}

void sub_1A696AFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A696CADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

Class __getOBWelcomeControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C73AA0;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("OBWelcomeController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getOBWelcomeControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBWelcomeControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A696DDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A696EB74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A696F2BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A696F548(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A696F6E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A6972BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v11 = v10;

  a9.super_class = (Class)_SFFormAutoFillController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A6972D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6972D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6972E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6972F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69730CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1A69731A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6973284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697340C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69736A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A6973728()
{
}

void sub_1A6973808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  unint64_t v17 = v16;

  _Unwind_Resume(a1);
}

void sub_1A6973920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  unint64_t v17 = v16;

  _Unwind_Resume(a1);
}

void sub_1A6973A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6973AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6973BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6973D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A6973E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6974208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19)
{
  v27 = v25;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v26 - 112));

  _Unwind_Resume(a1);
}

void sub_1A6974300()
{
}

void sub_1A6974368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69745F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69746F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69749D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6974CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6974DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6974E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6974F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6975038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69750D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6975154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69752D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697549C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1A6975670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A697572C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69757A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69758B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A697594C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6975CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6976128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v44 - 144));
  _Block_object_dispose((const void *)(v44 - 136), 8);

  _Unwind_Resume(a1);
}

void sub_1A69764FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A6976650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__215(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD0C36A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__216(uint64_t a1)
{
}

void sub_1A6976908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1A6976AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6976C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6976D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6976E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6977038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69770F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69771B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697724C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69773EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69774F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69775F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69777FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6977860()
{
}

void sub_1A69779A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6977B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A6977CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  int v19 = v16;

  _Unwind_Resume(a1);
}

void sub_1A6977F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A6978144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697822C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A697849C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6978614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6978744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A69789A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6978B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6978BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6978D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6978E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6978FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6979098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6979358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

void sub_1A697963C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69796C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6979790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6979D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33)
{
  _Unwind_Resume(a1);
}

void sub_1A697A43C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697A5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A697A7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697AA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak((id *)(v26 - 88));

  _Unwind_Resume(a1);
}

void sub_1A697AAD0()
{
  JUMPOUT(0x1A697AAACLL);
}

void sub_1A697AAE0()
{
}

void sub_1A697AAEC()
{
}

void sub_1A697AF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697B138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A697B1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697B324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A697B3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697B470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697B504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697B57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697B71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A697B7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697B8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 40));

  _Unwind_Resume(a1);
}

void sub_1A697B988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697BA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697BAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697BB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697BC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697BD60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697BDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697BE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697BF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697C018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697C1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A697C24C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697C2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A697C3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697C454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697C67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A697C8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A697C9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getOBWelcomeControllerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getOBWelcomeControllerClass_softClass_0;
  uint64_t v7 = getOBWelcomeControllerClass_softClass_0;
  if (!getOBWelcomeControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getOBWelcomeControllerClass_block_invoke_0;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getOBWelcomeControllerClass_block_invoke_0((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A697E8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBBoldTrayButtonClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getOBBoldTrayButtonClass_softClass;
  uint64_t v7 = getOBBoldTrayButtonClass_softClass;
  if (!getOBBoldTrayButtonClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getOBBoldTrayButtonClass_block_invoke;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getOBBoldTrayButtonClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A697E9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void enableTrackerProtection()
{
  id v0 = [MEMORY[0x1E4F74230] sharedConnection];
  [v0 setValue:&unk_1EFBDFBB8 forSetting:*MEMORY[0x1E4F74120]];

  id v1 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  objc_msgSend(v1, "webui_applySafariCookieAcceptPolicy");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4FB6F30];

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 0);
}

id createPromptCancelButtonWithCompletionHandler(void *a1)
{
  id v1 = a1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v2 = (void *)getOBTrayButtonClass_softClass;
  uint64_t v20 = getOBTrayButtonClass_softClass;
  if (!getOBTrayButtonClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getOBTrayButtonClass_block_invoke;
    v16[3] = &unk_1E5C723B0;
    v16[4] = &v17;
    __getOBTrayButtonClass_block_invoke((uint64_t)v16);
    uint64_t v2 = (void *)v18[3];
  }
  CFStringRef v3 = v2;
  _Block_object_dispose(&v17, 8);
  id v4 = objc_alloc_init(v3);
  long long v5 = _WBSLocalizedString();
  [v4 setTitle:v5 forState:0];

  uint64_t v6 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __createPromptCancelButtonWithCompletionHandler_block_invoke;
  long long v14 = &unk_1E5C72C88;
  id v15 = v1;
  id v7 = v1;
  uint64_t v8 = [v6 actionWithTitle:&stru_1EFB97EB8 image:0 identifier:0 handler:&v11];
  objc_msgSend(v4, "addAction:forControlEvents:", v8, 0x2000, v11, v12, v13, v14);

  uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v4 setTitleColor:v9 forState:0];

  return v4;
}

void sub_1A697ECA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __getOBWelcomeControllerClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("OBWelcomeController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBWelcomeControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBWelcomeControllerClass_block_invoke_cold_1();
    OnBoardingKitLibrary();
  }
}

void OnBoardingKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __OnBoardingKitLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C74108;
    uint64_t v3 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getOBBoldTrayButtonClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  Class result = objc_getClass("OBBoldTrayButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBBoldTrayButtonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getOBBoldTrayButtonClass_block_invoke_cold_1();
    return (Class)__createPromptCancelButtonWithCompletionHandler_block_invoke(v3);
  }
  return result;
}

uint64_t __createPromptCancelButtonWithCompletionHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

SFPrivacyReportTrackerDetailViewController *__getOBTrayButtonClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  Class result = (SFPrivacyReportTrackerDetailViewController *)objc_getClass("OBTrayButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBTrayButtonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SFPrivacyReportTrackerDetailViewController *)__getOBTrayButtonClass_block_invoke_cold_1();
    return [(SFPrivacyReportTrackerDetailViewController *)v3 initWithTracker:v5];
  }
  return result;
}

void sub_1A69816BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void highlightMatchingRanges(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1 && [v10 length])
  {
    if (a4 == 1)
    {
      uint64_t v12 = [MEMORY[0x1E4F98DD0] searchPatternForWebsiteComparisonFromSearchPattern:v10];

      id v10 = (id)v12;
    }
    uint64_t v13 = *MEMORY[0x1E4FB12B8];
    long long v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    objc_msgSend(v9, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v9, "length"));

    id v15 = objc_opt_class();
    uint64_t v16 = [v9 string];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __highlightMatchingRanges_block_invoke;
    v17[3] = &unk_1E5C74270;
    id v18 = v9;
    [v15 enumerateRangesMatchingPatternWithTokenizer:a1 string:v16 pattern:v10 matchingType:a4 withBlock:v17];
  }
}

void __highlightMatchingRanges_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  uint64_t v8 = *MEMORY[0x1E4FB12B8];
  uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
  v9[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  objc_msgSend(v5, "addAttributes:range:", v7, a2, a3);
}

void sub_1A6984684(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

SafariServices::WebProcessPlugInReaderJSController *SafariServices::WebProcessPlugInReaderJSController::WebProcessPlugInReaderJSController(SafariServices::WebProcessPlugInReaderJSController *this, WKWebProcessPlugInFrame *a2, _SFReaderWebProcessPlugInPageController *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  *(_OWORD *)((char *)this + _Block_object_dispose(&STACK[0x510], 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *(void *)this = &unk_1EFB96980;
  id v7 = v5;
  *((void *)this + 7) = v7;
  uint64_t v8 = v6;
  *((void *)this + _Block_object_dispose(&STACK[0x510], 8) = v8;
  *((void *)this + 9) = 0;
  id v9 = (void *)*((void *)this + 7);
  id v10 = [MEMORY[0x1E4F466E8] normalWorld];
  id v11 = [v9 jsContextForWorld:v10];

  SafariShared::ReaderJSController::evaluateSharedUINormalWorldScript(this, (const OpaqueJSContext *)[v11 JSGlobalContextRef]);
  uint64_t v12 = (void *)*((void *)this + 7);
  uint64_t v13 = SafariServices::WebProcessPlugInReaderJSController::isolatedWorld(this);
  long long v14 = [v12 jsContextForWorld:v13];

  id v15 = (const OpaqueJSContext *)[v14 JSGlobalContextRef];
  SafariShared::ReaderJSController::evaluateLocalizedStringsScript(this, v15);
  [MEMORY[0x1E4F98D80] sharedUIScriptForContext:v15];
  JSScriptEvaluate();
  +[_SFReaderCustomProtocols readerUserInterfaceScriptForContext:v15];
  JSScriptEvaluate();
  SafariShared::JSController::addScriptObjectToGlobalObject(this, v15);
  SafariShared::JSController::scriptObjectReady(this, v15);

  return this;
}

void sub_1A69852FC(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  SafariShared::ReaderJSController::~ReaderJSController((SafariShared::ReaderJSController *)v1);
  _Unwind_Resume(a1);
}

id SafariServices::WebProcessPlugInReaderJSController::isolatedWorld(SafariServices::WebProcessPlugInReaderJSController *this)
{
  uint64_t v2 = (void *)*((void *)this + 9);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F466E8] world];
    SEL v4 = (void *)*((void *)this + 9);
    *((void *)this + 9) = v3;

    uint64_t v2 = (void *)*((void *)this + 9);
  }

  return v2;
}

void SafariShared::ReaderJSController::~ReaderJSController(SafariShared::ReaderJSController *this)
{
  *(void *)this = MEMORY[0x1E4F997E0] + 16;
  uint64_t v2 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  SafariShared::JSController::~JSController(this);
}

void SafariServices::WebProcessPlugInReaderJSController::~WebProcessPlugInReaderJSController(id *this)
{
  *this = &unk_1EFB96980;
  [this[9] clearWrappers];
  id v2 = this[9];
  this[9] = 0;

  *this = (id)(MEMORY[0x1E4F997E0] + 16);
  id v3 = this[6];
  this[6] = 0;
  if (v3) {
    (*(void (**)(id))(*(void *)v3 + 8))(v3);
  }

  SafariShared::JSController::~JSController((SafariShared::JSController *)this);
}

{
  uint64_t vars8;

  SafariServices::WebProcessPlugInReaderJSController::~WebProcessPlugInReaderJSController(this);

  JUMPOUT(0x1AD0C30D0);
}

id SafariServices::WebProcessPlugInReaderJSController::initialConfiguration(id *this)
{
  uint64_t v1 = [this[8] originalPageController];
  id v2 = [v1 initialReaderConfiguration];

  return v2;
}

void sub_1A69855B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::makeFontAvailableIfNecessary(SafariServices::WebProcessPlugInReaderJSController *this, NSString *a2)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x1E4F24510];
  v7[0] = *MEMORY[0x1E4F24538];
  v7[1] = v3;
  v8[0] = v2;
  v8[1] = MEMORY[0x1E4F1CC38];
  v7[2] = *MEMORY[0x1E4F24518];
  v8[2] = MEMORY[0x1E4F1CC38];
  CTFontDescriptorRef v4 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3]);
  CTFontDescriptorRef v6 = v4;
  CFArrayRef v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  CFRelease(v4);
  CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v5, 0, &__block_literal_global_17);
}

void sub_1A69856C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14SafariServices34WebProcessPlugInReaderJSController28makeFontAvailableIfNecessaryEP8NSString_block_invoke()
{
  return 1;
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::isInStickyMode(SafariServices::WebProcessPlugInReaderJSController *this)
{
  return 0;
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::originalArticleFinder(id *this)
{
  uint64_t v1 = [this[8] originalPageController];
  uint64_t v2 = [v1 originalArticleFinder];

  return v2;
}

void sub_1A6985740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SafariServices::WebProcessPlugInReaderJSController::subframeByIFrameElementId(SafariServices::WebProcessPlugInReaderJSController *this, NSString *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  CTFontDescriptorRef v4 = (const OpaqueJSContext *)*((void *)this + 5);
  CFArrayRef v5 = [MEMORY[0x1E4F30920] contextWithJSGlobalContextRef:JSContextGetGlobalContext(v4)];
  CTFontDescriptorRef v6 = [MEMORY[0x1E4F30938] valueWithObject:v3 inContext:v5];
  uint64_t v15 = [v6 JSValueRef];
  uint64_t v8 = (const OpaqueJSContext *)SafariShared::JSUtilities::globalJSObjectByName(v4, (const OpaqueJSContext *)"document", v7);
  uint64_t v9 = SafariShared::JSUtilities::callJSMethodWithArguments(v4, v8, (OpaqueJSValue *)"getElementById", (const char *)&v15, (const OpaqueJSValue *const *)1);
  id v10 = objc_msgSend(MEMORY[0x1E4F30938], "valueWithJSValueRef:inContext:", v9, v5, v15, v16);
  id v11 = [MEMORY[0x1E4F466E0] nodeHandleWithJSValue:v10 inContext:v5];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 htmlIFrameElementContentFrame];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void sub_1A69858AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::prepareNextPageFrame(id *this, NSString *a2)
{
  CTFontDescriptorRef v4 = a2;
  uint64_t v3 = SafariServices::WebProcessPlugInReaderJSController::subframeByIFrameElementId((SafariServices::WebProcessPlugInReaderJSController *)this, v4);
  if (v3)
  {
    [this[8] isolatedWorldForNextPageDetection];
    [v3 jsContextForWorld:objc_claimAutoreleasedReturnValue()];
    objc_msgSend(MEMORY[0x1E4F98D80], "articleFinderScriptForContext:", objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "JSGlobalContextRef"));
    JSScriptEvaluate();
    operator new();
  }
}

void sub_1A6985A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x1AD0C30D0](v13, 0x10A1C406DF74740);

  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::readerOperationMode(id *this)
{
  uint64_t v1 = [this[8] originalPageController];
  if ([v1 isViewingReadingListArchive]) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1A6985ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::useSmoothScrolling(SafariServices::WebProcessPlugInReaderJSController *this)
{
  return 0;
}

void SafariServices::WebProcessPlugInReaderJSController::contentDidBecomeReady(id *this, NSString *a2)
{
  CTFontDescriptorRef v4 = a2;
  uint64_t v3 = [this[8] originalPageController];
  [v3 readerContentDidBecomeReadyWithArticleText:v4];
}

void sub_1A6985B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::requestOnDeviceSummary(id *this)
{
  id v1 = [this[8] originalPageController];
  [v1 didRequestOnDeviceSummary];
}

void sub_1A6985BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::didSetSummary(id *this)
{
  id v1 = [this[8] originalPageController];
  [v1 didSetSummary];
}

void sub_1A6985C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::reportReaderEvent(id *this, uint64_t a2, NSDictionary *a3)
{
  CTFontDescriptorRef v6 = a3;
  CFArrayRef v5 = [this[8] originalPageController];
  [v5 reportReaderEvent:a2 dataToReport:v6];
}

void sub_1A6985C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id SafariServices::WebProcessPlugInReaderJSController::initialArticleScrollPositionAsDictionary(id *this)
{
  id v1 = [this[8] originalPageController];
  uint64_t v2 = [v1 initalArticleScrollPositionAsDictionary];
  [v1 setInitalArticleScrollPositionAsDictionary:0];

  return v2;
}

void sub_1A6985D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariServices::WebProcessPlugInReaderJSController::replaceSimpleTweetsWithRichTweets(SafariServices::WebProcessPlugInReaderJSController *this, NSDictionary *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  CTFontDescriptorRef v4 = (void *)*((void *)this + 7);
  CFArrayRef v5 = [MEMORY[0x1E4F466E8] normalWorld];
  CTFontDescriptorRef v6 = [v4 jsContextForWorld:v5];

  id v7 = (SafariShared::JSUtilities *)[v6 JSGlobalContextRef];
  v10[0] = SafariShared::JSUtilities::translateNSToJSValue(v7, (const OpaqueJSContext *)v3, v8);
  GlobalObject = JSContextGetGlobalObject(v7);
  SafariShared::JSUtilities::callJSMethodWithArguments(v7, GlobalObject, (OpaqueJSValue *)"replaceSimpleTweetsWithRichTweets", (const char *)v10, (const OpaqueJSValue *const *)1);
}

void sub_1A6985E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::JSUtilities::translateNSToJSValue(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, objc_object *a3)
{
  CTFontDescriptorRef v4 = a2;
  CFArrayRef v5 = (void *)MEMORY[0x1E4F30938];
  CTFontDescriptorRef v6 = [MEMORY[0x1E4F30920] contextWithJSGlobalContextRef:JSContextGetGlobalContext(this)];
  id v7 = [v5 valueWithObject:v4 inContext:v6];
  uint64_t v8 = [v7 JSValueRef];

  return v8;
}

void sub_1A6985EDC(_Unwind_Exception *a1)
{
  CTFontDescriptorRef v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::cachedTopScrollOffset(id *this)
{
  id v1 = [this[8] originalPageController];
  uint64_t v2 = [v1 cachedReaderTopScrollOffset];
  [v1 setCachedReaderTopScrollOffset:0];

  return v2;
}

void sub_1A6985F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariServices::WebProcessPlugInReaderJSController::maxDistanceForLoadingNextPage(SafariServices::WebProcessPlugInReaderJSController *this)
{
  return 0x7FFFFFFFLL;
}

const OpaqueJSValue *SafariServices::WebProcessPlugInReaderJSController::contentInPrintingMailingFrame(SafariServices::WebProcessPlugInReaderJSController *this)
{
  id v1 = (const OpaqueJSContext *)*((void *)this + 5);
  GlobalObject = JSContextGetGlobalObject(v1);
  uint64_t v3 = (const OpaqueJSValue *)SafariShared::JSUtilities::callJSMethodWithArguments(v1, GlobalObject, (OpaqueJSValue *)"contentInPrintingMailingFrame", 0, 0);
  if (v3)
  {
    CTFontDescriptorRef v4 = v3;
    if (JSValueIsString(v1, v3))
    {
      SafariShared::JSUtilities::translateJSValueToNS(v1, v4, v5);
      uint64_t v3 = (const OpaqueJSValue *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

id SafariServices::WebProcessPlugInReaderJSController::printingMailingFrame(SafariShared::JSUtilities **this)
{
  SafariShared::JSUtilities::callJSMethodWithArguments(this[5], this[3], (OpaqueJSValue *)"preparePrintingMailingFrame", 0, 0);

  return SafariServices::WebProcessPlugInReaderJSController::subframeByIFrameElementId((SafariServices::WebProcessPlugInReaderJSController *)this, &cfstr_PrintingMailin.isa);
}

void sub_1A6986E3C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 248));
  _Unwind_Resume(a1);
}

void sub_1A69874C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_1A698883C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void tryOpeningInDefaultApp(void *a1, void *a2, unsigned int a3, void *a4, void *a5, void *a6)
{
  v82[7] = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  id v67 = a2;
  id v11 = a4;
  id v12 = a5;
  id v68 = a6;
  id v13 = v10;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = v15;
  *(void *)&long long v70 = 0;
  *((void *)&v70 + 1) = &v70;
  *(void *)&long long v71 = 0x3032000000;
  *((void *)&v71 + 1) = __Block_byref_object_copy__1;
  *(void *)&long long v72 = __Block_byref_object_dispose__1;
  *((void *)&v72 + 1) = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v75 = __containerAppBundleIdentifiersForURL_block_invoke;
  v76 = &unk_1E5C74418;
  id v18 = v16;
  id v77 = v18;
  v79 = &v70;
  id v19 = v17;
  id v78 = v19;
  objc_msgSend(v18, "safari_accessingSecurityScopedResource:", &buf);
  id v69 = *(id *)(*((void *)&v70 + 1) + 40);

  _Block_object_dispose(&v70, 8);
  if ([v69 count])
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v20 = v69;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:&buf count:16];
    uint64_t v22 = v21;
    if (v21)
    {
      uint64_t v23 = *(void *)v71;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v71 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v70 + 1) + 8 * v24);
          uint64_t v21 = __appToLaunch_block_invoke(v21, v25, v14);
          if (v21)
          {
            uint64_t v26 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v25];
            id v27 = v26;
            if (v26 && ([v26 supportsOpenInPlace] & 1) != 0) {
              goto LABEL_51;
            }
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:&buf count:16];
        uint64_t v22 = v21;
      }
      while (v21);
    }
    id v27 = 0;
    goto LABEL_51;
  }
  id v20 = v18;
  *(void *)&long long buf = *MEMORY[0x1E4F1C728];
  uint64_t v28 = buf;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:1];
  *(void *)&long long v70 = 0;
  v30 = [v20 promisedItemResourceValuesForKeys:v29 error:&v70];
  id v31 = (id)v70;
  v32 = [v30 objectForKeyedSubscript:v28];

  if (v31)
  {
    v33 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      tryOpeningInDefaultApp_cold_2((uint64_t)v20, v33, v31);
    }
  }
  else if (v32)
  {
    PreferredIdentifierForTag = v32;
    goto LABEL_23;
  }
  v34 = [v20 pathExtension];
  if ([(__CFString *)v34 length]) {
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v34, 0);
  }
  else {
    PreferredIdentifierForTag = 0;
  }

LABEL_23:
  if (PreferredIdentifierForTag)
  {
    v35 = PreferredIdentifierForTag;
    uint64_t v36 = *MEMORY[0x1E4F22660];
    v82[0] = *MEMORY[0x1E4F225F8];
    v82[1] = v36;
    uint64_t v37 = *MEMORY[0x1E4F22668];
    v82[2] = *MEMORY[0x1E4F22538];
    v82[3] = v37;
    uint64_t v38 = *MEMORY[0x1E4F22568];
    v82[4] = *MEMORY[0x1E4F22580];
    v82[5] = v38;
    v82[6] = *MEMORY[0x1E4F225B0];
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:7];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v70 objects:&buf count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v71;
      while (2)
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v71 != v42) {
            objc_enumerationMutation(v40);
          }
          if (UTTypeConformsTo(v35, *(CFStringRef *)(*((void *)&v70 + 1) + 8 * i)))
          {

            v55 = WBS_LOG_CHANNEL_PREFIXDownloads();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138477827;
              *(void *)((char *)&buf + 4) = v35;
              _os_log_impl(&dword_1A690B000, v55, OS_LOG_TYPE_INFO, "Preferring QuickLook for type %{private}@", (uint8_t *)&buf, 0xCu);
            }
            id v27 = 0;
            goto LABEL_50;
          }
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v70 objects:&buf count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }
  }
  id v44 = [MEMORY[0x1E4F22430] documentProxyForURL:v20 isContentManaged:a3 sourceAuditToken:0];
  uint64_t v45 = *MEMORY[0x1E4F224A8];
  v46 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F224A8]];
  *(void *)&long long buf = 0;
  v47 = [v44 applicationsAvailableForOpeningWithHandlerRanks:v46 error:&buf];
  id v48 = (id)buf;

  if (v48)
  {
    v49 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      tryOpeningInDefaultApp_cold_1(v49, v44, v48);
    }
  }
  v50 = [v47 objectForKeyedSubscript:v45];
  v51 = [v50 firstObject];

  if (v51 && [v51 supportsOpenInPlace]) {
    id v52 = v51;
  }
  else {
    id v52 = 0;
  }

  if (v52)
  {
    v53 = [v52 bundleIdentifier];
    char v54 = [v53 isEqualToString:@"com.apple.mobilesafari"];

    if ((v54 & 1) == 0)
    {
      id v27 = v52;
      goto LABEL_49;
    }
  }
  else
  {
    v56 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = PreferredIdentifierForTag;
      _os_log_impl(&dword_1A690B000, v56, OS_LOG_TYPE_INFO, "Didn't find owning app to open type %{private}@; falling back to QuickLook",
        (uint8_t *)&buf,
        0xCu);
    }
  }
  id v27 = 0;
LABEL_49:

LABEL_50:
LABEL_51:

  if (v67)
  {
    v57 = [v27 bundleIdentifier];
    id v58 = v18;
    id v59 = v57;
    id v60 = v68;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v75 = __tryOpeningInApp_block_invoke;
    v76 = &unk_1E5C74490;
    char v80 = 1;
    id v77 = v58;
    v61 = (long long *)v60;
    id v78 = v59;
    v79 = v61;
    char v81 = a3;
    v62 = (void *)MEMORY[0x1AD0C36A0](&buf);
    *(void *)&long long v70 = MEMORY[0x1E4F143A8];
    *((void *)&v70 + 1) = 3221225472;
    *(void *)&long long v71 = __tryOpeningInApp_block_invoke_4;
    *((void *)&v71 + 1) = &unk_1E5C744B8;
    *(void *)&long long v72 = v61;
    *((void *)&v72 + 1) = v62;
    v63 = v61;
    id v64 = v62;
    FPExtendBookmarkForDocumentURL();
  }
  else
  {
    id v59 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    objc_msgSend(v59, "_sf_openURL:inApplication:withOptions:completionHandler:", v18, v27, 0, v68);
  }
}

void sub_1A69895DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __appToLaunch_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CTFontDescriptorRef v6 = v5;
  if (v5 && ([v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F5F7C8] defaultPermission];
    uint64_t v7 = [v8 canAppWithBundleIdentifier:v4 performAction:2 bundleIdentifier:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

void __containerAppBundleIdentifiersForURL_block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "br_cloudDocsContainer");
  uint64_t v3 = v2;
  if (v2
    && ([v2 identifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqualToString:@"com.apple.icloud.applecorporate"],
        v4,
        (v5 & 1) == 0))
  {
    uint64_t v9 = [v3 bundleIdentifiers];
    id v10 = [v9 allObjects];

    if ([v10 count]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    v11[0] = *(void *)(a1 + 40);
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __tryOpeningInApp_block_invoke(uint64_t a1, void *a2)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F22340];
    v28[0] = v3;
    uint64_t v6 = *MEMORY[0x1E4F22378];
    v27[0] = v5;
    v27[1] = v6;
    uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    v28[1] = v7;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = (void **)v28;
    id v10 = v27;
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F22378];
    uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v26 = v7;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = &v26;
    id v10 = &v25;
    uint64_t v11 = 1;
  }
  id v12 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:v11];

  char v13 = [*(id *)(a1 + 32) startAccessingSecurityScopedResource];
  id v14 = [_SFOpenURLOperationDelegate alloc];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __tryOpeningInApp_block_invoke_2;
  uint64_t v21 = &unk_1E5C74468;
  id v22 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 48);
  char v24 = v13;
  id v15 = [(_SFOpenURLOperationDelegate *)v14 initWithCompletionHandler:&v18];
  id v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v17 = objc_msgSend(v16, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", *(void *)(a1 + 32), *(void *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 57), 0, v12, 0, v15, v18, v19, v20, v21);

  [v17 start];
}

void __tryOpeningInApp_block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(id *)(a1 + 40);
    FPUpdateLastUsedDate();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
}

uint64_t __tryOpeningInApp_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __tryOpeningInApp_block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __tryOpeningInApp_block_invoke_5;
    v6[3] = &unk_1E5C73300;
    id v8 = *(id *)(a1 + 40);
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __tryOpeningInApp_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void *__getQLPreviewGetSupportedMIMETypesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!QuickLookLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __QuickLookLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5C744D8;
    uint64_t v7 = 0;
    QuickLookLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)QuickLookLibraryCore_frameworkLibrary;
    if (QuickLookLibraryCore_frameworkLibrary)
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
  uint64_t v2 = (void *)QuickLookLibraryCore_frameworkLibrary;
LABEL_5:
  Class result = dlsym(v2, "QLPreviewGetSupportedMIMETypes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getQLPreviewGetSupportedMIMETypesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuickLookLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuickLookLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A698B190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A698DB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1A698E02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A698EF94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 160), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__271(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__272(uint64_t a1)
{
}

void getAndProcessPendingPushMessage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __getAndProcessPendingPushMessage_block_invoke;
  void v7[3] = &unk_1E5C74728;
  id v8 = v3;
  id v9 = v4;
  id v5 = v4;
  id v6 = v3;
  [v6 _getPendingPushMessage:v7];
}

void sub_1A6990254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getAndProcessPendingPushMessage_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = v4;
      id v8 = [v6 _webPushPartition];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "Fetched a pending push message for web clip %{public}@", buf, 0xCu);
    }
    id v9 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getAndProcessPendingPushMessage_block_invoke_444;
    v13[3] = &unk_1E5C74700;
    id v14 = v9;
    id v15 = v3;
    id v16 = *(id *)(a1 + 40);
    [v14 _processPushMessage:v15 completionHandler:v13];
  }
  else
  {
    if (v5)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = v4;
      id v12 = [v10 _webPushPartition];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEFAULT, "Finished fetching push messages for web clip %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __getAndProcessPendingPushMessage_block_invoke_444(void *a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)a1[4];
    id v6 = v4;
    uint64_t v7 = [v5 _webPushPartition];
    uint64_t v8 = a1[5];
    int v10 = 138543875;
    uint64_t v11 = v7;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2117;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEFAULT, "Processed push event for web clip %{public}@ with result: %d payload: %{sensitive}@", (uint8_t *)&v10, 0x1Cu);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1A6993530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t previewContentForElementInfo(_WKActivatedElementInfo *a1)
{
  uint64_t v1 = a1;
  if ([(_WKActivatedElementInfo *)v1 type] == 1)
  {
    uint64_t v2 = +[_SFQRCodeDetectionController sharedController];
    id v3 = [v2 actionForElement:v1];
    if (v3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1A69935EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t shouldProvideActionsForQRCodes(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getVKImageAnalyzerClass(void)::softClass;
  uint64_t v7 = getVKImageAnalyzerClass(void)::softClass;
  if (!getVKImageAnalyzerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL23getVKImageAnalyzerClassv_block_invoke;
    v3[3] = &unk_1E5C72498;
    v3[4] = &v4;
    ___ZL23getVKImageAnalyzerClassv_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return [v1 deviceSupportsImageAnalysis] ^ 1;
}

void sub_1A69936CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A69937F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6993890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6993920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6993A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6993AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6993BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6993E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6993FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6994070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6994154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6994264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69943A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69943FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_SFLinkPreviewHelper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A69945B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69946D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69947D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69948B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6994938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69949A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6994A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6994B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69955C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1A699592C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6995A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6995AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6995C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6995ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6995F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69961A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_1A6996288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6996458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6996544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69966A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6996934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6996A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6996BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6996D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6996E90(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

Class ___ZL23getVKImageAnalyzerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL24VisionKitCoreLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C74948;
    uint64_t v6 = 0;
    VisionKitCoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
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
    Class result = objc_getClass("VKImageAnalyzer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVKImageAnalyzerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL24VisionKitCoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke(void *a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a2 + 1) >= 4)
  {
    if (a2 == 3)
    {
      id v3 = (void *)a1[4];
      uint64_t v7 = *MEMORY[0x1E4FA6E98];
      v8[0] = MEMORY[0x1E4F1CC38];
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      [v3 openExternallyWithWebBrowserState:v4 referrerURL:0 completionHandler:0];
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke_2;
    block[3] = &unk_1E5C72628;
    uint64_t v2 = (void *)a1[6];
    block[4] = a1[5];
    id v6 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void sub_1A699725C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) openURL:*(void *)(a1 + 40) forAction:2 withTabOrder:0];
}

id privacyReportTitleForCurrentStatus(int a1)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4FB12B8];
  uint64_t v2 = [MEMORY[0x1E4FB1618] labelColor];
  v24[0] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB12B0];
  v23[1] = *MEMORY[0x1E4FB12B0];
  uint64_t v4 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  v24[1] = v4;
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  id v6 = [MEMORY[0x1E4F98CF0] sharedManager];
  if (![v6 isPrivacyProxyActive]
    || ![v6 isPrivacyProxyOnForEitherTier])
  {
    goto LABEL_6;
  }
  if ([v6 isPrivacyProxyOnInICloudSettings]) {
    [v6 isPrivacyProxyRestrictedToTrackersByUser];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v8 = _WBSLocalizedString();
  id v9 = (void *)[v7 initWithString:v8 attributes:v5];

  if (!v9)
  {
LABEL_6:
    id v10 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v11 = _WBSLocalizedString();
    id v9 = (void *)[v10 initWithString:v11 attributes:v5];
  }
  __int16 v12 = [v9 string];
  uint64_t v13 = [v12 rangeOfString:@"{show-more-less-link}"];
  uint64_t v15 = v14;

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = v3;
    uint64_t v16 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    id v22 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    objc_msgSend(v9, "setAttributes:range:", v17, v13, v15);
  }
  _WBSLocalizedString();
  if (a1) {
    uint64_t v18 = {;
  }
    uint64_t v19 = @"show-less://";
  }
  else {
    uint64_t v18 = {;
  }
    uint64_t v19 = @"show-more://";
  }
  objc_msgSend(v9, "safari_replaceOccurrenceOfString:withString:link:", @"{show-more-less-link}", v18, v19);

  return v9;
}

void sub_1A6998598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6998770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
  _Unwind_Resume(a1);
}

void sub_1A6998888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);

  _Unwind_Resume(a1);
}

void sub_1A6998944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6998AA8(_Unwind_Exception *a1)
{
  long long v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A6998C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)SFBrowserServiceViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

id safariViewControllerProcessPoolStorage(void)
{
  if (safariViewControllerProcessPoolStorage(void)::onceToken != -1) {
    dispatch_once(&safariViewControllerProcessPoolStorage(void)::onceToken, &__block_literal_global_371);
  }
  id v0 = (void *)safariViewControllerProcessPoolStorage(void)::dictionary;

  return v0;
}

id safariViewControllerDataStoreStorage(void)
{
  if (safariViewControllerDataStoreStorage(void)::onceToken != -1) {
    dispatch_once(&safariViewControllerDataStoreStorage(void)::onceToken, &__block_literal_global_374);
  }
  id v0 = (void *)safariViewControllerDataStoreStorage(void)::dictionary;

  return v0;
}

void sub_1A6998EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6998FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69990C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6999194(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A6999224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69992F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6999468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69995C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6999844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6999A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6999C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6999D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699A28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  objc_destroyWeak((id *)(v16 - 152));
  _Unwind_Resume(a1);
}

void sub_1A699A470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699A568(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A699A604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699A7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A699A888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699A94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A699AAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699AC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699ACF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699AD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699AE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699AFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699B090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699B130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699B1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699B2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699B354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699B54C(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A699B91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699BAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A699BCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699BF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699C084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A699C154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A699C200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699C270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699C380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699C470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699C4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699C578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699C6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699C778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699C93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699C9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699CB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699CD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A699CF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A699D0DC(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A699D210(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A699D36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699D4B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699D5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699D648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699D6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699D7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1A699D8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699D9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL25webBrowsingServicesBundlev_block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F28B50];
  id v1 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v2 = MEMORY[0x1AD0C28C0]();
  v7[0] = v2;
  v7[1] = @"System/Library/LocationBundles/WebBrowsingServices.bundle";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v4 = [v1 fileURLWithPathComponents:v3];
  uint64_t v5 = [v0 bundleWithURL:v4];
  id v6 = (void *)webBrowsingServicesBundle(void)::bundle;
  webBrowsingServicesBundle(void)::bundle = v5;
}

void sub_1A699DC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void updatePowerLogEventForAllHostApps(void)
{
  v2[1] = *MEMORY[0x1E4F143B8];
  if ([(id)allHostAppBundleIDs count])
  {
    if (PLShouldLogRegisteredEvent())
    {
      id v1 = @"bundleIDs";
      id v0 = [(id)allHostAppBundleIDs allObjects];
      v2[0] = v0;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:&v1 count:1];
      PLLogRegisteredEvent();
    }
  }
}

void sub_1A699DD0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL38safariViewControllerProcessPoolStoragev_block_invoke()
{
  id v0 = [[SFProcessDictionary alloc] initWithCacheCapacity:10];
  id v1 = (void *)safariViewControllerProcessPoolStorage(void)::dictionary;
  safariViewControllerProcessPoolStorage(void)::dictionary = (uint64_t)v0;
}

void ___ZL36safariViewControllerDataStoreStoragev_block_invoke()
{
  id v0 = [[SFProcessDictionary alloc] initWithCacheCapacity:10];
  id v1 = (void *)safariViewControllerDataStoreStorage(void)::dictionary;
  safariViewControllerDataStoreStorage(void)::dictionary = (uint64_t)v0;
}

uint64_t SFDebugMenuEnabled()
{
  uint64_t result = [MEMORY[0x1E4F98AF8] hasInternalContent];
  if (result)
  {
    id v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v2 = [v1 BOOLForKey:@"DebugShowInternalActions"];

    return v2;
  }
  return result;
}

void sub_1A699DEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A699EEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A699EF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699EFAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699F06C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699F0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699F348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A699F590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699F72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A699F7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A699FA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1A699FBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A699FCDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A699FF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A011C(_Unwind_Exception *a1)
{
  uint64_t v5 = v2;

  _Unwind_Resume(a1);
}

void sub_1A69A0318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A69A0400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A0550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1A69A0750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A08C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A0C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_1A69A1CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43)
{
  _Unwind_Resume(a1);
}

void sub_1A69A2A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1A69A2FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A322C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A32B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A33BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A34F4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A69A369C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A69A378C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A385C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A3E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A402C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A40C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A43F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A69A469C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A69A4700()
{
}

void sub_1A69A4708()
{
}

void sub_1A69A4870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A69A4C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1A69A4F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A69A4F98()
{
}

void sub_1A69A4FA0()
{
}

void sub_1A69A50D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A51F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A5310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A53E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A54A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A5528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A55DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2113;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_1A69A6B3C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_1A69A6CA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A69A7C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t contentBlockerDidChange(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return objc_msgSend(a2, "reloadContentBlockers", a3, a4, a5);
}

void sub_1A69A7EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A7FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A81CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v11 = v10;

  a9.super_class = (Class)SFWebViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A69A83D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A85F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A868C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A88D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A89A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A8F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A904C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A92B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A93FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A94A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A95A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A96D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69A9F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA0E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AA9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AAA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AAAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AAB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AAC1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AACA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AADE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1A69AAEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AAFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  uint64_t v21 = v20;

  _Unwind_Resume(a1);
}

void sub_1A69AB484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69AB9F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69ABA64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69ABB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69ABB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69B0E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1A69B1320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69B2230(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A69B3C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69B4568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id detailStringForPasskey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 customTitle];
  uint64_t v3 = [v2 length];

  if (v3) {
    [v1 customTitle];
  }
  else {
  uint64_t v4 = _WBSLocalizedString();
  }

  return v4;
}

void sub_1A69B74CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__162(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1AD0C36A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__163(uint64_t a1)
{
}

void sub_1A69B8B20(_Unwind_Exception *a1)
{
}

void sub_1A69B9340(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A69B989C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  _Block_object_dispose((const void *)(v24 - 224), 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v24 - 128));
  _Unwind_Resume(a1);
}

void sub_1A69BAB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A69BC268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A69BD10C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1A69BD20C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A69BD7C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A69BDB18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A69BF170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69BF53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69C0688(_Unwind_Exception *a1)
{
}

void sub_1A69C0F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1A69C0FF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A69C1260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Block_object_dispose((const void *)(v18 - 96), 8);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69C1390(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A69C2C28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

Class __getCNContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ContactsUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C75AF0;
    uint64_t v6 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ContactsUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CNContactPickerViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getCNContactPickerViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCNContactPickerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A69C6718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A69C7F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69C88FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1A69CFC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A69CFF74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69D02CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKEventStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!EventKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __EventKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C75CA0;
    uint64_t v6 = 0;
    EventKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!EventKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("EKEventStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getEKEventStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getEKEventStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EventKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EventKitLibraryCore_frameworkLibrary = result;
  return result;
}

void __getEKICSPreviewControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("EKICSPreviewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKICSPreviewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getEKICSPreviewControllerClass_block_invoke_cold_1();
    EventKitUILibrary();
  }
}

void EventKitUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!EventKitUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __EventKitUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C75CB8;
    uint64_t v3 = 0;
    EventKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!EventKitUILibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __EventKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EventKitUILibraryCore_frameworkLibrary = result;
  return result;
}

SFAccountTableViewCell *__getEKEventViewControllerClass_block_invoke(uint64_t a1)
{
  EventKitUILibrary();
  uint64_t result = (SFAccountTableViewCell *)objc_getClass("EKEventViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKEventViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SFAccountTableViewCell *)__getEKEventViewControllerClass_block_invoke_cold_1();
    return [(SFAccountTableViewCell *)v3 initWithStyle:v5 reuseIdentifier:v6];
  }
  return result;
}

void __blankImage_block_invoke()
{
  [MEMORY[0x1E4F18B30] tableViewIconSize];
  UIGraphicsBeginImageContextWithOptions(v3, 0, 0.0);
  uint64_t v0 = UIGraphicsGetImageFromCurrentImageContext();
  id v1 = (void *)blankImage_image;
  blankImage_image = v0;

  UIGraphicsEndImageContext();
}

void sub_1A69D2038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69D22D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A69D2860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SFWebProcessPlugInPageExtensionController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A69D2918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69D2A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69D2E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A69D2FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69D318C(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

id fileURLForReaderURL(NSURL *a1)
{
  id v1 = a1;
  if ([(NSURL *)v1 safari_hasScheme:@"safari-reader"])
  {
    uint64_t v2 = [MEMORY[0x1E4F98D80] readerHTMLSourceURL];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1A69D33AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id fileURLForResourceURL(NSURL *a1)
{
  id v1 = a1;
  if ([(NSURL *)v1 safari_hasScheme:@"safari-resource"])
  {
    uint64_t v2 = [(NSURL *)v1 lastPathComponent];
    CGSize v3 = [MEMORY[0x1E4F28B50] mainBundle];
    SEL v4 = [v3 URLForResource:v2 withExtension:&stru_1EFB97EB8];

    if (!v4)
    {
      int64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Safari.Shared"];
      SEL v4 = [v5 URLForResource:v2 withExtension:&stru_1EFB97EB8];

      if (!v4)
      {
        id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        SEL v4 = [v6 URLForResource:v2 withExtension:&stru_1EFB97EB8];
      }
    }
  }
  else
  {
    SEL v4 = 0;
  }

  return v4;
}

void sub_1A69D34E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69D35AC(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A69DBE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1A69DC85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

SafariServices::ReaderAvailabilityController *SafariServices::ReaderAvailabilityController::ReaderAvailabilityController(SafariServices::ReaderAvailabilityController *this, _SFWebProcessPlugInReaderEnabledPageController *a2)
{
  CGSize v3 = a2;
  SafariShared::ReaderAvailabilityController::ReaderAvailabilityController(this);
  *(void *)this = &unk_1EFB96F20;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = v3;
  *((unsigned char *)this + 104) = 0;
  return this;
}

void sub_1A69DEB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariServices::ReaderAvailabilityController::createArticleFinderJSController(id *this)
{
}

void sub_1A69DEC24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x1AD0C30D0](v11, 0x10A1C406DF74740);

  _Unwind_Resume(a1);
}

id SafariServices::ReaderAvailabilityController::isolatedWorld(SafariServices::ReaderAvailabilityController *this)
{
  uint64_t v2 = (void *)*((void *)this + 11);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F466E8] world];
    SEL v4 = (void *)*((void *)this + 11);
    *((void *)this + 11) = v3;

    [*((id *)this + 11) makeAllShadowRootsOpen];
    [*((id *)this + 11) disableOverrideBuiltinsBehavior];
    uint64_t v2 = (void *)*((void *)this + 11);
  }

  return v2;
}

uint64_t SafariServices::ReaderAvailabilityController::canInjectArticleFinder(id *this)
{
  id v1 = [this[12] mainFrame];
  if ([v1 _hasCustomContentProvider])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v3 = [v1 URL];
    if (objc_msgSend(v3, "safari_isHTTPFamilyURL")) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = [v3 isFileURL];
    }
  }
  return v2;
}

void sub_1A69DED48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariServices::ReaderAvailabilityController::targetFrameJSContext(id *this)
{
  uint64_t v2 = [this[12] mainFrame];
  uint64_t v3 = SafariServices::ReaderAvailabilityController::isolatedWorld((SafariServices::ReaderAvailabilityController *)this);
  SEL v4 = [v2 jsContextForWorld:v3];
  uint64_t v5 = [v4 JSGlobalContextRef];

  return v5;
}

void sub_1A69DEDDC(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t SafariServices::ReaderAvailabilityController::clearIsolatedWorld(id *this)
{
  return [this[11] clearWrappers];
}

uint64_t SafariServices::ReaderAvailabilityController::availabilityWasDetermined(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 96) didDetermineReaderAvailability:a2];
  *(unsigned char *)(a1 + 104) = 1;
  return result;
}

uint64_t SafariServices::ReaderAvailabilityController::additionalTextSamplesWereDetermined(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 96) didDetermineAdditionalTextSamples:a2];
}

uint64_t SafariServices::ReaderAvailabilityController::determineAvailabilityForDynamicCheck(SafariServices::ReaderAvailabilityController *this)
{
  uint64_t result = SafariShared::ReaderAvailabilityController::prepareArticleFinder(this);
  if (result)
  {
    SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(this);
    JUMPOUT(0x1AD0C2FA0);
  }
  return result;
}

uint64_t SafariServices::ReaderAvailabilityController::articleContentDidChange(id *this)
{
  return [this[12] articleContentDidChange];
}

uint64_t SafariServices::ReaderAvailabilityController::didExtractReaderTextAndPageMetadata(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return [*(id *)(a1 + 96) readerTextWasExtracted:a2 withMetadata:a3 wasDeterminingAvailability:a4 == 1];
}

uint64_t SafariServices::ReaderAvailabilityController::clearAvailability(SafariServices::ReaderAvailabilityController *this)
{
  uint64_t result = SafariShared::ReaderAvailabilityController::clearAvailability(this);
  *((unsigned char *)this + 104) = 0;
  return result;
}

id SafariServices::ReaderAvailabilityController::collectReadingListItemInformation(SafariServices::ReaderAvailabilityController *this)
{
  if (SafariShared::ReaderAvailabilityController::prepareArticleFinder(this))
  {
    uint64_t v2 = (SafariShared::ArticleFinderJSController *)SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(this);
    uint64_t v3 = (const OpaqueJSContext *)SafariShared::ArticleFinderJSController::collectReadingListItemInformation(v2);
    SEL v4 = (SafariShared::JSUtilities *)(*(uint64_t (**)(SafariServices::ReaderAvailabilityController *))(*(void *)this + 96))(this);
    if (JSValueIsObject(v4, v3)) {
      SafariShared::JSUtilities::translateJSValueToNS(v4, v3, v5);
    }
    else {
    id v6 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id SafariServices::ReaderAvailabilityController::articleContent(SafariServices::ReaderAvailabilityController *this)
{
  if (SafariShared::ReaderAvailabilityController::prepareArticleFinder(this))
  {
    uint64_t v2 = (SafariShared::ArticleFinderJSController *)SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(this);
    uint64_t v3 = (const OpaqueJSContext *)SafariShared::ArticleFinderJSController::articleContent(v2);
    SEL v4 = (SafariShared::JSUtilities *)(*(uint64_t (**)(SafariServices::ReaderAvailabilityController *))(*(void *)this + 96))(this);
    if (JSValueIsObject(v4, v3)) {
      SafariShared::JSUtilities::translateJSValueToNS(v4, v3, v5);
    }
    else {
    id v6 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void SafariServices::ReaderAvailabilityController::~ReaderAvailabilityController(id *this)
{
  SafariShared::ReaderAvailabilityController::~ReaderAvailabilityController((SafariShared::ReaderAvailabilityController *)this);
}

{
  uint64_t vars8;

  SafariShared::ReaderAvailabilityController::~ReaderAvailabilityController((SafariShared::ReaderAvailabilityController *)this);

  JUMPOUT(0x1AD0C30D0);
}

void sub_1A69DF830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69E3A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69E3AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E3B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E3BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E3C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E3D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E3EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4004(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A69E40B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E41B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E423C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E43DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E456C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E46D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E476C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4884(_Unwind_Exception *a1)
{
  MEMORY[0x1AD0C30D0](v3, 0x10A1C405B7E95FFLL);

  _Unwind_Resume(a1);
}

void sub_1A69E495C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1A69E4D74(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1A69E4E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A69E4EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69E5014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69E518C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A69E7404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69E8604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69E8868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69E913C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69E9708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69E9944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69EA8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v19 - 112));
  _Unwind_Resume(a1);
}

void sub_1A69EE268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void sub_1A69EF08C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69F08DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1A69F101C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_1A69F1744(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A69F1BDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A69F241C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSearchUIClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SearchUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C766F8;
    uint64_t v6 = 0;
    SearchUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SearchUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SearchUI");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSearchUIClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSearchUIClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t _SFPreferredMailContentTypeForActivityContentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) < 2) {
    return 1;
  }
  if (a1 != 5 && a1) {
    return 3;
  }
  return 0;
}

void sub_1A69F3BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLPLinkMetadataClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLPLinkMetadataClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLPLinkMetadataClass_block_invoke_cold_1();
    LinkPresentationLibrary_0();
  }
}

void LinkPresentationLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!LinkPresentationLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __LinkPresentationLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C767F8;
    uint64_t v3 = 0;
    LinkPresentationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!LinkPresentationLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __LinkPresentationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  LinkPresentationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

_SFReaderExtractor *__getLPFileMetadataClass_block_invoke_0(uint64_t a1)
{
  LinkPresentationLibrary_0();
  uint64_t result = (_SFReaderExtractor *)objc_getClass("LPFileMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLPFileMetadataClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (_SFReaderExtractor *)__getLPFileMetadataClass_block_invoke_cold_1();
    return [(_SFReaderExtractor *)v3 init];
  }
  return result;
}

void sub_1A69F4A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69F4BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SFViewControllerViewEmbeddedByPreviewController(void *a1)
{
  uint64_t result = a1;
  if (result)
  {
    long long v2 = (void *)result;
    while (1)
    {
      uint64_t v3 = [v2 _existingPresentationControllerImmediate:0 effective:1];
      if ([v3 presentationStyle] == 20) {
        break;
      }
      SEL v4 = [v2 parentViewController];
      long long v5 = v4;
      if (v4)
      {
        id v6 = v4;
      }
      else
      {
        id v6 = [v2 presentingViewController];
      }
      id v7 = v6;

      long long v2 = v7;
      if (!v7) {
        return 0;
      }
    }

    return 1;
  }
  return result;
}

BOOL SFViewControllerViewIsVisible(void *a1, unsigned char *a2)
{
  id v3 = a1;
  SEL v4 = [v3 view];
  long long v5 = [v4 window];

  if (v5)
  {
    id v6 = [v5 rootViewController];
    if (v6)
    {
      if (SFViewControllerViewEmbeddedByPreviewController(v3))
      {
        BOOL v7 = 1;
        if (a2) {
          *a2 = 1;
        }
        goto LABEL_31;
      }
      uint64_t v8 = [v3 view];
      if (v8)
      {
        id v9 = (void *)v8;
        while (1)
        {
          [v9 bounds];
          objc_msgSend(v9, "convertRect:toView:", v5);
          CGFloat v11 = v10;
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          [v5 bounds];
          v38.origin.x = v18;
          v38.origin.y = v19;
          v38.size.double width = v20;
          v38.size.double height = v21;
          v36.origin.x = v11;
          v36.origin.y = v13;
          v36.size.double width = v15;
          v36.size.double height = v17;
          CGRect v37 = CGRectIntersection(v36, v38);
          double width = v37.size.width;
          double height = v37.size.height;
          objc_msgSend(v9, "alpha", v37.origin.x, v37.origin.y);
          BOOL v25 = v24 < 0.05 || width < 1.0;
          BOOL v26 = v25 || height < 1.0;
          if (v26 || ([v9 isHidden] & 1) != 0) {
            break;
          }
          uint64_t v27 = [v9 superview];

          id v9 = (void *)v27;
          if (!v27) {
            goto LABEL_18;
          }
        }
        BOOL v7 = 0;
        goto LABEL_21;
      }
LABEL_18:
      uint64_t v28 = [v3 traitCollection];
      uint64_t v29 = [v28 userInterfaceIdiom];

      if (v29 == 6)
      {
        id v9 = [v5 windowScene];
        BOOL v7 = v9 != 0;
LABEL_21:

LABEL_31:
        goto LABEL_32;
      }
      if (v3)
      {
        v30 = v3;
        while (1)
        {
          BOOL v7 = v30 == v6;
          if (v30 == v6) {
            break;
          }
          id v31 = [v30 presentingViewController];
          v32 = v31;
          if (v31)
          {
            id v33 = v31;
          }
          else
          {
            id v33 = [v30 parentViewController];
          }
          id v34 = v33;

          id v3 = 0;
          v30 = v34;
          if (!v34) {
            goto LABEL_31;
          }
        }
        id v3 = v6;
        goto LABEL_31;
      }
    }
    BOOL v7 = 0;
    goto LABEL_31;
  }
  BOOL v7 = 0;
LABEL_32:

  return v7;
}

uint64_t performViewWillAppearInLoadView()
{
  if (dyld_program_sdk_at_least()) {
    return 0;
  }
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v2 = [v1 bundleIdentifier];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

void sub_1A69FB4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t eligibleForSlideInPresentation()
{
  if (dyld_program_sdk_at_least()) {
    return 0;
  }
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v2 = [v1 bundleIdentifier];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

void sub_1A69FD970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1A69FE98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A69FEE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A69FEF24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A6A004BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6A005BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6A00718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6A0079C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A6A0083C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A6A02098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A02844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1A6A03824(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t isLiveCameraOnlyAction(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 isLiveCameraOnlyAction];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1A6A03CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBCSQRCodeParserClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BarcodeSupportLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __BarcodeSupportLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C76D90;
    uint64_t v6 = 0;
    BarcodeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!BarcodeSupportLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("BCSQRCodeParser");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getBCSQRCodeParserClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBCSQRCodeParserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BarcodeSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BarcodeSupportLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A6A06B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A06D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A06FDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id getMFMailComposeViewControllerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMFMailComposeViewControllerClass_softClass;
  uint64_t v7 = getMFMailComposeViewControllerClass_softClass;
  if (!getMFMailComposeViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMFMailComposeViewControllerClass_block_invoke;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getMFMailComposeViewControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6A091F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMFMailComposeViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MessageUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MessageUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C76EC0;
    uint64_t v6 = 0;
    MessageUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MessageUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("MFMailComposeViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getMFMailComposeViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMFMailComposeViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MessageUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MessageUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A6A0E698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6A0E8F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0EAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)_SFBrowserContentViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A6A0EE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0EFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0F0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0F13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0F1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0F530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMFMailComposeViewControllerClass(void)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMFMailComposeViewControllerClass(void)::softClass;
  uint64_t v7 = getMFMailComposeViewControllerClass(void)::softClass;
  if (!getMFMailComposeViewControllerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL35getMFMailComposeViewControllerClassv_block_invoke;
    v3[3] = &unk_1E5C72498;
    v3[4] = &v4;
    ___ZL35getMFMailComposeViewControllerClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6A0F640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A0F760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0F99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0FA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0FB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0FC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0FD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A0FF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A10094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1035C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A10470(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

id mobileSafariDefaultDataStore(void)
{
  uint64_t v0 = (void *)mobileSafariDefaultDataStore(void)::dataStore;
  if (!mobileSafariDefaultDataStore(void)::dataStore)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F467D8]);
    [v1 setSourceApplicationBundleIdentifier:@"com.apple.mobilesafari"];
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreWithConfiguration:", v1);
    uint64_t v3 = (void *)mobileSafariDefaultDataStore(void)::dataStore;
    mobileSafariDefaultDataStore(void)::dataStore = v2;

    uint64_t v0 = (void *)mobileSafariDefaultDataStore(void)::dataStore;
  }

  return v0;
}

void sub_1A6A105A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A106C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id mobileSafariNonPersistentDataStore(SFSafariViewControllerConfiguration *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F467D8]) initNonPersistentConfiguration];
  [v2 setSourceApplicationBundleIdentifier:@"com.apple.mobilesafari"];
  if ([(SFSafariViewControllerConfiguration *)v1 _isBeingUsedForCellularServiceBootstrap])
  {
    [v2 setSourceApplicationSecondaryIdentifier:@"com.apple.CommCenter.CellularPlanProvisioning"];
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreWithConfiguration:", v2);

  return v3;
}

void sub_1A6A10770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A108D0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6A10C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A10D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A10E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A10FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1118C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11234(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6A112B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1165C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A119B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A6A11FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A12158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1222C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A122C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A12638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1A6A12724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A127A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A12804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A12DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Unwind_Resume(a1);
}

void sub_1A6A12F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1302C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A13114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1323C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A134FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A135D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A136BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A13840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A138DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A13988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A13B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1A6A13DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A13EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A13F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A14000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1429C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A14364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A14444(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6A14568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A145E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A146E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A14C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A14FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A15258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A15300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A154F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6A156C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A6A157AC(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1A6A1588C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A15940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A15A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A15E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A15F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1608C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1615C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A163EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A169C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A16F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A171A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A172B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A174AC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6A17600(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A6A1773C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  CGFloat v18 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A17888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A179FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_1A6A17B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A17BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A17D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_1A6A17E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A17ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1802C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  CGFloat v19 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A18164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A18248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A6A18354(_Unwind_Exception *exception_object)
{
}

id getSLComposeViewControllerClass(void)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSLComposeViewControllerClass(void)::softClass;
  uint64_t v7 = getSLComposeViewControllerClass(void)::softClass;
  if (!getSLComposeViewControllerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL31getSLComposeViewControllerClassv_block_invoke;
    v3[3] = &unk_1E5C72498;
    v3[4] = &v4;
    ___ZL31getSLComposeViewControllerClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6A18444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A187E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1894C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A18A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A18B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A18BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A18CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A18D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A18D94(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6A18E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A6A18FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A191A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A19324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A19404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A6A19708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A198F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A199C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A19B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  CGFloat v20 = v18;

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v19 - 56));

  _Unwind_Resume(a1);
}

void sub_1A6A19F70(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers);

  _Unwind_Resume(a1);
}

void sub_1A6A1A0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A6A1A1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1A33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1A408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1A688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  CGFloat v21 = v17;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6A1A8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1AA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6A1AC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1AD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1ADEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1AEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1B024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1B1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6A1B33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1B6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1B880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1BA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1BB24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1BCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1BD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1BED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1C080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1C2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1C468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1CA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, id *location, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v36 - 112));

  _Unwind_Resume(a1);
}

void sub_1A6A1CC1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1CD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_1A6A1D328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1D460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1D87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1D9FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1DAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1DB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1DC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1DCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1E234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

id getPKAddPassesViewControllerClass(void)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKAddPassesViewControllerClass(void)::softClass;
  uint64_t v7 = getPKAddPassesViewControllerClass(void)::softClass;
  if (!getPKAddPassesViewControllerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL33getPKAddPassesViewControllerClassv_block_invoke;
    v3[3] = &unk_1E5C72498;
    v3[4] = &v4;
    ___ZL33getPKAddPassesViewControllerClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6A1E480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A1E54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1E6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1E7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1E884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1EA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1EC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1ED08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1EDE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1F074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1F428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1F5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1F670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1F950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1FB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1FBEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1FCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A6A1FD54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1FDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A1FEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2000C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A6A200B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2012C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A20450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A206A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A20774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2081C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A208C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A209C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A20A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A20BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A20C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A20CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A20E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A210C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A213A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A216D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A21FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2211C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A221FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2234C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v11;

  _Unwind_Resume(a1);
}

void sub_1A6A225F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A226A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A227BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1A6A228FC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6A22994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A22FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A23138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A232F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6A233D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A234A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A6A23594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A23D7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v7 - 120), 8);

  _Unwind_Resume(a1);
}

void sub_1A6A23FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A240FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A241B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A24348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v17 - 80), 8);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A6A244A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2458C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2464C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A24768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6A24814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A24A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A24BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6A24D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6A250D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A256D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A258DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2599C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A25FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2613C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2628C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A263EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A26FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A27024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A270FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A271AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A27240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2746C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A27638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1A6A27684()
{
}

void sub_1A6A2768C()
{
}

void sub_1A6A277DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A27B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A27D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A27E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A27F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A281BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A285F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2866C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A28FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1A6A291C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__406(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__407(uint64_t a1)
{
}

void sub_1A6A29300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A293AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A295E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A296C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A6A298E0()
{
  JUMPOUT(0x1A6A298D0);
}

void sub_1A6A298EC()
{
}

void sub_1A6A29A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29AAC()
{
}

void sub_1A6A29AB4()
{
}

void sub_1A6A29ABC()
{
}

void sub_1A6A29B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A6A29BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A29FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class ___ZL35getMFMailComposeViewControllerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MessageUILibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL20MessageUILibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C776F8;
    uint64_t v6 = 0;
    MessageUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MessageUILibraryCore(char **)::frameworkLibrary)
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
    Class result = objc_getClass("MFMailComposeViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getMFMailComposeViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMFMailComposeViewControllerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL20MessageUILibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MessageUILibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL31getSLComposeViewControllerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SocialLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL17SocialLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C77710;
    uint64_t v6 = 0;
    SocialLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SocialLibraryCore(char **)::frameworkLibrary)
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
    Class result = objc_getClass("SLComposeViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)___ZL31getSLComposeViewControllerClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSLComposeViewControllerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL17SocialLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL33getPKAddPassesViewControllerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitUILibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL20PassKitUILibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C77728;
    uint64_t v6 = 0;
    PassKitUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PassKitUILibraryCore(char **)::frameworkLibrary)
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
    Class result = objc_getClass("PKAddPassesViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPKAddPassesViewControllerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL20PassKitUILibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUILibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void ___ZL14getPKPassClassv_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKPass");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPassClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL14getPKPassClassv_block_invoke_cold_1();
    PassKitCoreLibrary();
  }
}

void PassKitCoreLibrary(void)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PassKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = ___ZL22PassKitCoreLibraryCorePPc_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C77740;
    uint64_t v3 = 0;
    PassKitCoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!PassKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t ___ZL22PassKitCoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL28getPKPassesXPCContainerClassv_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  Class result = objc_getClass("PKPassesXPCContainer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPassesXPCContainerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1();
    return (Class)___ZL27getCLKWatchFaceLibraryClassv_block_invoke(v3);
  }
  return result;
}

Class ___ZL27getCLKWatchFaceLibraryClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ClockKitLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL19ClockKitLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C77758;
    uint64_t v6 = 0;
    ClockKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!ClockKitLibraryCore(char **)::frameworkLibrary)
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
    Class result = objc_getClass("CLKWatchFaceLibrary");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCLKWatchFaceLibraryClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL19ClockKitLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClockKitLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL19getFKSaveOrderClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FinanceKitUILibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL23FinanceKitUILibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C77770;
    uint64_t v6 = 0;
    FinanceKitUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!FinanceKitUILibraryCore(char **)::frameworkLibrary)
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
    Class result = objc_getClass("FKSaveOrder");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    ___ZL19getFKSaveOrderClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFKSaveOrderClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL23FinanceKitUILibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FinanceKitUILibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void sub_1A6A2D5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_SFStringFromRequestDesktopSiteSetting(void *a1)
{
  id v1 = a1;
  long long v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 integerValue];
    uint64_t v4 = @"Unknown";
    if (v3 == 1) {
      uint64_t v4 = @"Desktop";
    }
    if (v3) {
      long long v5 = v4;
    }
    else {
      long long v5 = @"Mobile";
    }
  }
  else
  {
    long long v5 = @"Unspecified";
  }

  return v5;
}

void sub_1A6A2E7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A2ED3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SFReaderEnabledWebViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A6A2EE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2EF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A2F5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill_onceToken, &__block_literal_global_47);
  }
  return WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAppStoreBanner()
{
  if (WBS_LOG_CHANNEL_PREFIXAppStoreBanner_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAppStoreBanner_onceToken, &__block_literal_global_4_0);
  }
  return WBS_LOG_CHANNEL_PREFIXAppStoreBanner_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAuthenticationSession()
{
  if (WBS_LOG_CHANNEL_PREFIXAuthenticationSession_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAuthenticationSession_onceToken, &__block_literal_global_7);
  }
  return WBS_LOG_CHANNEL_PREFIXAuthenticationSession_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken, &__block_literal_global_10);
  }
  return WBS_LOG_CHANNEL_PREFIXAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_onceToken, &__block_literal_global_13);
  }
  return WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXBookmarkSync()
{
  if (WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken, &__block_literal_global_16);
  }
  return WBS_LOG_CHANNEL_PREFIXBookmarkSync_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen()
{
  if (WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen_onceToken, &__block_literal_global_19);
  }
  return WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCalendarEventDetection()
{
  if (WBS_LOG_CHANNEL_PREFIXCalendarEventDetection_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCalendarEventDetection_onceToken, &__block_literal_global_22);
  }
  return WBS_LOG_CHANNEL_PREFIXCalendarEventDetection_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCertificates()
{
  if (WBS_LOG_CHANNEL_PREFIXCertificates_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCertificates_onceToken, &__block_literal_global_25);
  }
  return WBS_LOG_CHANNEL_PREFIXCertificates_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXClientAuthentication()
{
  if (WBS_LOG_CHANNEL_PREFIXClientAuthentication_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXClientAuthentication_onceToken, &__block_literal_global_28);
  }
  return WBS_LOG_CHANNEL_PREFIXClientAuthentication_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXContinuity()
{
  if (WBS_LOG_CHANNEL_PREFIXContinuity_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXContinuity_onceToken, &__block_literal_global_34);
  }
  return WBS_LOG_CHANNEL_PREFIXContinuity_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDownloads()
{
  if (WBS_LOG_CHANNEL_PREFIXDownloads_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDownloads_onceToken, &__block_literal_global_37);
  }
  return WBS_LOG_CHANNEL_PREFIXDownloads_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXEventAttribution()
{
  if (WBS_LOG_CHANNEL_PREFIXEventAttribution_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXEventAttribution_onceToken, &__block_literal_global_40);
  }
  return WBS_LOG_CHANNEL_PREFIXEventAttribution_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXExtensions_onceToken, &__block_literal_global_43_0);
  }
  return WBS_LOG_CHANNEL_PREFIXExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill_onceToken, &__block_literal_global_55);
  }
  return WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXOther()
{
  if (WBS_LOG_CHANNEL_PREFIXOther_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXOther_onceToken, &__block_literal_global_58);
  }
  return WBS_LOG_CHANNEL_PREFIXOther_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswords()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswords_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswords_onceToken, &__block_literal_global_61);
  }
  return WBS_LOG_CHANNEL_PREFIXPasswords_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordsIcons()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordsIcons_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordsIcons_onceToken, &__block_literal_global_64);
  }
  return WBS_LOG_CHANNEL_PREFIXPasswordsIcons_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordSharing()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken, &__block_literal_global_67);
  }
  return WBS_LOG_CHANNEL_PREFIXPasswordSharing_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPageLoading()
{
  if (WBS_LOG_CHANNEL_PREFIXPageLoading_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPageLoading_onceToken, &__block_literal_global_70);
  }
  return WBS_LOG_CHANNEL_PREFIXPageLoading_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPencilInput()
{
  if (WBS_LOG_CHANNEL_PREFIXPencilInput_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPencilInput_onceToken, &__block_literal_global_73);
  }
  return WBS_LOG_CHANNEL_PREFIXPencilInput_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrewarming()
{
  if (WBS_LOG_CHANNEL_PREFIXPrewarming_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrewarming_onceToken, &__block_literal_global_79);
  }
  return WBS_LOG_CHANNEL_PREFIXPrewarming_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrinting()
{
  if (WBS_LOG_CHANNEL_PREFIXPrinting_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrinting_onceToken, &__block_literal_global_82);
  }
  return WBS_LOG_CHANNEL_PREFIXPrinting_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXProcessDictionary()
{
  if (WBS_LOG_CHANNEL_PREFIXProcessDictionary_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXProcessDictionary_onceToken, &__block_literal_global_85);
  }
  return WBS_LOG_CHANNEL_PREFIXProcessDictionary_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReaderExtraction()
{
  if (WBS_LOG_CHANNEL_PREFIXReaderExtraction_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReaderExtraction_onceToken, &__block_literal_global_91);
  }
  return WBS_LOG_CHANNEL_PREFIXReaderExtraction_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReadingList()
{
  if (WBS_LOG_CHANNEL_PREFIXReadingList_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReadingList_onceToken, &__block_literal_global_94);
  }
  return WBS_LOG_CHANNEL_PREFIXReadingList_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXRequestDesktopSite()
{
  if (WBS_LOG_CHANNEL_PREFIXRequestDesktopSite_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXRequestDesktopSite_onceToken, &__block_literal_global_97);
  }
  return WBS_LOG_CHANNEL_PREFIXRequestDesktopSite_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSearchEngine()
{
  if (WBS_LOG_CHANNEL_PREFIXSearchEngine_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSearchEngine_onceToken, &__block_literal_global_100);
  }
  return WBS_LOG_CHANNEL_PREFIXSearchEngine_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSVCPrivacy()
{
  if (WBS_LOG_CHANNEL_PREFIXSVCPrivacy_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSVCPrivacy_onceToken, &__block_literal_global_103_0);
  }
  return WBS_LOG_CHANNEL_PREFIXSVCPrivacy_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSVCDeletion()
{
  if (WBS_LOG_CHANNEL_PREFIXSVCDeletion_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSVCDeletion_onceToken, &__block_literal_global_106);
  }
  return WBS_LOG_CHANNEL_PREFIXSVCDeletion_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUniversalLinks()
{
  if (WBS_LOG_CHANNEL_PREFIXUniversalLinks_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUniversalLinks_onceToken, &__block_literal_global_118);
  }
  return WBS_LOG_CHANNEL_PREFIXUniversalLinks_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserInteraction()
{
  if (WBS_LOG_CHANNEL_PREFIXUserInteraction_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserInteraction_onceToken, &__block_literal_global_124);
  }
  return WBS_LOG_CHANNEL_PREFIXUserInteraction_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserInterface()
{
  if (WBS_LOG_CHANNEL_PREFIXUserInterface_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserInterface_onceToken, &__block_literal_global_127);
  }
  return WBS_LOG_CHANNEL_PREFIXUserInterface_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserTrackingDetection()
{
  if (WBS_LOG_CHANNEL_PREFIXUserTrackingDetection_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserTrackingDetection_onceToken, &__block_literal_global_130_0);
  }
  return WBS_LOG_CHANNEL_PREFIXUserTrackingDetection_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserMediaCapture()
{
  if (WBS_LOG_CHANNEL_PREFIXUserMediaCapture_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserMediaCapture_onceToken, &__block_literal_global_133);
  }
  return WBS_LOG_CHANNEL_PREFIXUserMediaCapture_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXViewService()
{
  if (WBS_LOG_CHANNEL_PREFIXViewService_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXViewService_onceToken, &__block_literal_global_136);
  }
  return WBS_LOG_CHANNEL_PREFIXViewService_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebApp()
{
  if (WBS_LOG_CHANNEL_PREFIXWebApp_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebApp_onceToken, &__block_literal_global_139);
  }
  return WBS_LOG_CHANNEL_PREFIXWebApp_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken, &__block_literal_global_142);
  }
  return WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXTranslation()
{
  if (WBS_LOG_CHANNEL_PREFIXTranslation_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTranslation_onceToken, &__block_literal_global_145_0);
  }
  return WBS_LOG_CHANNEL_PREFIXTranslation_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_onceToken, &__block_literal_global_148);
  }
  return WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken, &__block_literal_global_160);
  }
  return WBS_LOG_CHANNEL_PREFIXWebExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebPush()
{
  if (WBS_LOG_CHANNEL_PREFIXWebPush_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebPush_onceToken, &__block_literal_global_163);
  }
  return WBS_LOG_CHANNEL_PREFIXWebPush_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXManagedExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXManagedExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXManagedExtensions_onceToken, &__block_literal_global_169);
  }
  return WBS_LOG_CHANNEL_PREFIXManagedExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXESim()
{
  if (WBS_LOG_CHANNEL_PREFIXESim_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXESim_onceToken, &__block_literal_global_172);
  }
  return WBS_LOG_CHANNEL_PREFIXESim_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXBrowsingAssistant()
{
  if (WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_onceToken, &__block_literal_global_175);
  }
  return WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_log;
}

void sub_1A6A319F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __blankImage_block_invoke_0()
{
  [MEMORY[0x1E4F18B30] tableViewIconSize];
  UIGraphicsBeginImageContextWithOptions(v3, 0, 0.0);
  uint64_t v0 = UIGraphicsGetImageFromCurrentImageContext();
  id v1 = (void *)blankImage_image_0;
  blankImage_image_0 = v0;

  UIGraphicsEndImageContext();
}

void sub_1A6A33E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getASDInstallAppsClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getASDInstallAppsClass_softClass;
  uint64_t v7 = getASDInstallAppsClass_softClass;
  if (!getASDInstallAppsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getASDInstallAppsClass_block_invoke;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getASDInstallAppsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6A33F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A340B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id getASDAppQueryClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getASDAppQueryClass_softClass;
  uint64_t v7 = getASDAppQueryClass_softClass;
  if (!getASDAppQueryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getASDAppQueryClass_block_invoke;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getASDAppQueryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6A34618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A349AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A34E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A35388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A354B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAMSUIEngagementTaskClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAMSUIEngagementTaskClass_softClass;
  uint64_t v7 = getAMSUIEngagementTaskClass_softClass;
  if (!getAMSUIEngagementTaskClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAMSUIEngagementTaskClass_block_invoke;
    v3[3] = &unk_1E5C723B0;
    v3[4] = &v4;
    __getAMSUIEngagementTaskClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A6A35660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getASDNotificationCenterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ASDNotificationCenter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDNotificationCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getASDNotificationCenterClass_block_invoke_cold_1();
    AppStoreDaemonLibrary();
  }
}

void AppStoreDaemonLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppStoreDaemonLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C779E0;
    uint64_t v3 = 0;
    AppStoreDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppStoreDaemonLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppStoreDaemonLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getASDInstallAppsClass_block_invoke(uint64_t a1)
{
  AppStoreDaemonLibrary();
  Class result = objc_getClass("ASDInstallApps");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDInstallAppsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getASDInstallAppsClass_block_invoke_cold_1();
    return (Class)__getASDSystemAppMetadataClass_block_invoke(v3);
  }
  return result;
}

Class __getASDSystemAppMetadataClass_block_invoke(uint64_t a1)
{
  AppStoreDaemonLibrary();
  Class result = objc_getClass("ASDSystemAppMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDSystemAppMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getASDSystemAppMetadataClass_block_invoke_cold_1();
    return __getASDAppQueryClass_block_invoke(v3);
  }
  return result;
}

Class __getASDAppQueryClass_block_invoke(uint64_t a1)
{
  AppStoreDaemonLibrary();
  Class result = objc_getClass("ASDAppQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDAppQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getASDAppQueryClass_block_invoke_cold_1();
    return (Class)__getAMSDeviceClass_block_invoke(v3);
  }
  return result;
}

void __getAMSDeviceClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AMSDevice");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSDeviceClass_block_invoke_cold_1();
    AppleMediaServicesLibrary();
  }
}

void AppleMediaServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C779F8;
    uint64_t v3 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccountsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AccountsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C77A10;
    uint64_t v6 = 0;
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AccountsLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("ACAccountStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getACAccountStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getACAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccountsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccountsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getASDPurchaseClass_block_invoke(uint64_t a1)
{
  AppStoreDaemonLibrary();
  Class result = objc_getClass("ASDPurchase");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDPurchaseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getASDPurchaseClass_block_invoke_cold_1();
    return (Class)__getASDPurchaseManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getASDPurchaseManagerClass_block_invoke(uint64_t a1)
{
  AppStoreDaemonLibrary();
  Class result = objc_getClass("ASDPurchaseManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASDPurchaseManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getASDPurchaseManagerClass_block_invoke_cold_1();
    return (Class)__getAMSUIAuthenticateTaskClass_block_invoke(v3);
  }
  return result;
}

void __getAMSUIAuthenticateTaskClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AMSUIAuthenticateTask");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSUIAuthenticateTaskClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSUIAuthenticateTaskClass_block_invoke_cold_1();
    AppleMediaServicesUILibrary();
  }
}

void AppleMediaServicesUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleMediaServicesUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C77A28;
    uint64_t v3 = 0;
    AppleMediaServicesUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppleMediaServicesUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAMSSystemAlertDialogTaskClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("AMSSystemAlertDialogTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSSystemAlertDialogTaskClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAMSSystemAlertDialogTaskClass_block_invoke_cold_1();
    return (Class)__getAMSUIEngagementTaskClass_block_invoke(v3);
  }
  return result;
}

_SFAddToHomeScreenActivity *__getAMSUIEngagementTaskClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesUILibrary();
  Class result = (_SFAddToHomeScreenActivity *)objc_getClass("AMSUIEngagementTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSUIEngagementTaskClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (_SFAddToHomeScreenActivity *)__getAMSUIEngagementTaskClass_block_invoke_cold_1();
    return [(_SFAddToHomeScreenActivity *)v3 initWithWebView:v5];
  }
  return result;
}

void sub_1A6A3D7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1A6A42100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBEKeyEntryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BrowserEngineKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __BrowserEngineKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C77D38;
    uint64_t v6 = 0;
    BrowserEngineKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!BrowserEngineKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("BEKeyEntry");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getBEKeyEntryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBEKeyEntryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BrowserEngineKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BrowserEngineKitLibraryCore_frameworkLibrary = result;
  return result;
}

id redTextColorForDarkBackground(int a1)
{
  long long v2 = [MEMORY[0x1E4FB1618] systemRedColor];
  if (a1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  SEL v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v3];
  long long v5 = [v2 resolvedColorWithTraitCollection:v4];

  return v5;
}

id greenTextColorForDarkBackground(char a1)
{
  if (a1)
  {
    double v1 = 0.501960784;
    double v2 = 0.780392157;
    double v3 = 0.509803922;
  }
  else
  {
    double v1 = 0.262745098;
    double v2 = 0.749019608;
    double v3 = 0.345098039;
  }
  SEL v4 = [MEMORY[0x1E4FB1618] colorWithRed:v1 green:v2 blue:v3 alpha:1.0];

  return v4;
}

BOOL colorIsSimilarToColor(void *a1, void *a2)
{
  id v3 = a2;
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if ([a1 getHue:&v9 saturation:&v8 brightness:&v7 alpha:0]
    && [v3 getHue:&v10 saturation:0 brightness:0 alpha:0])
  {
    BOOL v4 = 0;
    if (v8 >= 0.1 && v7 >= 0.2)
    {
      double v5 = vabdd_f64(v9, v10);
      BOOL v4 = 1.0 - v5 < 0.15 || v5 < 0.15;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

id textColorForDarkBackground(char a1)
{
  if (a1) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  double v1 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v1;
}

id annotationTextColorForDarkBackground(char a1)
{
  if (a1)
  {
    double v1 = 0.6;
    double v2 = 1.0;
  }
  else
  {
    double v1 = 0.4;
    double v2 = 0.0;
  }
  id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:v2 alpha:v1];

  return v3;
}

void sub_1A6A44CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void dialRequestNotificationHandler(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = objc_msgSend(v4, "pendingRequests", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 successNotificationName];
        int v12 = [v11 isEqualToString:a3];

        if (!v12)
        {
          uint64_t v13 = [v10 failureNotificationName];
          int v14 = [v13 isEqualToString:a3];

          if (!v14) {
            continue;
          }
        }
        CGFloat v15 = [v10 completionHandler];
        v15[2]();

        [v4 removeObserverForRequest:v10];
        goto LABEL_12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

void sub_1A6A48964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A490E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A49440(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A6A49590(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A6A499EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1A6A4C3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1A6A4C4BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A6A4D280(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t categoryForURL(void *a1)
{
  id v1 = a1;
  if (([v1 hasTelephonyScheme] & 1) != 0
    || ([v1 isFaceTimeURL] & 1) != 0
    || ([v1 isFaceTimeAudioURL] & 1) != 0
    || ([v1 isFaceTimeMultiwayURL] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else if (objc_msgSend(v1, "safari_hasScheme:", @"itms-apps"))
  {
    uint64_t v2 = 2;
  }
  else if (objc_msgSend(v1, "safari_isAppleOneURL"))
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void __navigationResultQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SafariServices._SFNavigationResult", v2);
  id v1 = (void *)navigationResultQueue_navigationResultQueue;
  navigationResultQueue_navigationResultQueue = (uint64_t)v0;
}

void __deviceSupportedBiometryType_block_invoke()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F50518] availableDevices];
  id v3 = [v0 firstObject];

  id v1 = v3;
  if (!v3)
  {
    uint64_t v2 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = [v3 type];
  if (v2 == 2)
  {
    id v1 = v3;
    goto LABEL_7;
  }
  id v1 = v3;
  if (v2 == 1) {
LABEL_7:
  }
    deviceSupportedBiometryType_deviceSupportedBiometryType = v2;
}

uint64_t AppStoreComponentsLibraryCore()
{
  if (!AppStoreComponentsLibraryCore_frameworkLibrary_0) {
    AppStoreComponentsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return AppStoreComponentsLibraryCore_frameworkLibrary_0;
}

uint64_t getASCLockupContextWebBrowserSymbolLoc()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getASCLockupContextWebBrowserSymbolLoc_ptr;
  uint64_t v6 = getASCLockupContextWebBrowserSymbolLoc_ptr;
  if (!getASCLockupContextWebBrowserSymbolLoc_ptr)
  {
    id v1 = (void *)AppStoreComponentsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ASCLockupContextWebBrowser");
    getASCLockupContextWebBrowserSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A6A53958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AppStoreComponentsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AppStoreComponentsLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getASCLockupContextWebBrowserSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppStoreComponentsLibrary();
  uint64_t result = dlsym(v2, "ASCLockupContextWebBrowser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASCLockupContextWebBrowserSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppStoreComponentsLibrary()
{
  uint64_t v0 = AppStoreComponentsLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getASCCollectionIDWebBrowsersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppStoreComponentsLibrary();
  uint64_t result = dlsym(v2, "ASCCollectionIDWebBrowsers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASCCollectionIDWebBrowsersSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _SFAutoFillInputViewLabelFont()
{
  return [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

void sub_1A6A563D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A569BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1A6A57220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getDMGetUserDataDispositionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!DataMigrationLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __DataMigrationLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5C78330;
    uint64_t v7 = 0;
    DataMigrationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)DataMigrationLibraryCore_frameworkLibrary;
    if (DataMigrationLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)DataMigrationLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "DMGetUserDataDisposition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDMGetUserDataDispositionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DataMigrationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataMigrationLibraryCore_frameworkLibrary = result;
  return result;
}

void __getOBWelcomeControllerClass_block_invoke_1(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("OBWelcomeController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBWelcomeControllerClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBWelcomeControllerClass_block_invoke_cold_1();
    OnBoardingKitLibrary_0();
  }
}

void OnBoardingKitLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __OnBoardingKitLibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5C78348;
    uint64_t v3 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getOBBoldTrayButtonClass_block_invoke_0(uint64_t a1)
{
  OnBoardingKitLibrary_0();
  Class result = objc_getClass("OBBoldTrayButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBBoldTrayButtonClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getOBBoldTrayButtonClass_block_invoke_cold_1_0();
    return (Class)-[WBSAnalyticsLogger(_SFAnalyticsLogger) _sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:](v3);
  }
  return result;
}

SafariServices::ArticleFinderJSController *SafariServices::ArticleFinderJSController::ArticleFinderJSController(SafariServices::ArticleFinderJSController *this, WKWebProcessPlugInFrame *a2, WKWebProcessPlugInScriptWorld *a3)
{
  uint64_t v5 = a2;
  long long v6 = a3;
  *(_OWORD *)((char *)this + _Block_object_dispose(&a9, 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = v5;
  *(void *)this = &unk_1EFB97C98;
  *((void *)this + 7) = v6;
  return this;
}

uint64_t SafariServices::ArticleFinderJSController::nodeAtPoint(id *this, double a2, double a3)
{
  uint64_t v4 = objc_msgSend(this[6], "hitTest:", a2, a3);
  uint64_t v5 = [v4 nodeHandle];
  if (v5)
  {
    long long v6 = [this[6] jsNodeForNodeHandle:v5 inWorld:this[7]];
    uint64_t v7 = [v6 JSValueRef];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1A6A58BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariServices::ArticleFinderJSController::substituteURLForNextPageURL(SafariServices::ArticleFinderJSController *this, const OpaqueJSContext *a2, const OpaqueJSValue *const *a3)
{
  return (uint64_t)*a3;
}

void SafariServices::ArticleFinderJSController::~ArticleFinderJSController(id *this)
{
  SafariShared::JSController::~JSController((SafariShared::JSController *)this);
}

{
  uint64_t vars8;

  SafariShared::JSController::~JSController((SafariShared::JSController *)this);

  JUMPOUT(0x1AD0C30D0);
}

void sub_1A6A59980(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getSBSHomeScreenServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5C78650;
    uint64_t v6 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SBSHomeScreenService");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSBSHomeScreenServiceClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSBSHomeScreenServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A6A5B720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A6A5BBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A5C2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

id headerIconForUserInterfaceStyle(unint64_t a1)
{
  long long v2 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
  if (!headerIconForUserInterfaceStyle_iconsForStyle)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
    headerIconForUserInterfaceStyle_iconsForStyle = v3;

    long long v2 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
  }
  if (a1 <= 1) {
    a1 = 1;
  }
  long long v5 = [NSNumber numberWithInteger:a1];
  uint64_t v6 = [v2 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"QRImageHeader");
    uint64_t v8 = [v7 imageAsset];
    double v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:a1];
    double v10 = [v8 imageWithTraitCollection:v9];

    uint64_t v6 = [v10 _applicationIconImageForFormat:5 precomposed:1];

    uint64_t v11 = (void *)headerIconForUserInterfaceStyle_iconsForStyle;
    int v12 = [NSNumber numberWithInteger:a1];
    [v11 setObject:v6 forKeyedSubscript:v12];
  }
  id v13 = v6;

  return v13;
}

__CFString *typeIdentifierForDownloadFromResponse(void *a1)
{
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F22500];
  id v2 = a1;
  uint64_t v3 = [v2 MIMEType];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v1, v3, 0);

  long long v5 = [v2 suggestedFilename];

  uint64_t v6 = [v5 pathExtension];

  uint64_t v7 = [(__CFString *)v6 length];
  uint64_t v8 = PreferredIdentifierForTag;
  double v9 = v8;
  double v10 = v8;
  if (v7)
  {
    uint64_t v11 = v8;
    if ([(__CFString *)v8 isEqualToString:*MEMORY[0x1E4F22688]])
    {
      uint64_t v11 = (__CFString *)(id)*MEMORY[0x1E4F226F0];
    }
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F224F8];
    CFStringRef v13 = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v6, v11);
    int v14 = (__CFString *)v13;
    if (v13 && !UTTypeIsDynamic(v13))
    {
      double v10 = v14;
    }
    else
    {
      CGFloat v15 = (__CFString *)*MEMORY[0x1E4F22590];
      long long v16 = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v12, v6, (CFStringRef)*MEMORY[0x1E4F22590]);
      if (![(__CFString *)v9 isEqualToString:*MEMORY[0x1E4F22748]]
        || (int v17 = UTTypeConformsTo(v16, (CFStringRef)*MEMORY[0x1E4F224D0]), v18 = v16, !v17)
        && (int v19 = UTTypeConformsTo(v16, (CFStringRef)[(id)*MEMORY[0x1E4F44580] identifier]),
            long long v18 = v16,
            !v19)
        && (v20 = UTTypeConformsTo(v16, @"com.apple.watchface"), long long v18 = v16, !v20))
      {
        int IsDynamic = UTTypeIsDynamic(v9);
        long long v18 = v9;
        if (IsDynamic)
        {
          if (UTTypeIsDynamic(v16)) {
            long long v18 = v15;
          }
          else {
            long long v18 = v16;
          }
        }
      }
      double v10 = v18;
    }
  }

  return v10;
}

uint64_t _SFTypeIsExtractableArchive(void *a1)
{
  v9[8] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F225E0];
  v9[0] = @"org.gnu.gnu-tar-archive";
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F22560];
  void v9[2] = @"org.gnu.gnu-zip-tar-archive";
  v9[3] = v2;
  v9[4] = @"public.cpio-archive";
  v9[5] = @"public.tar-archive";
  uint64_t v3 = *MEMORY[0x1E4F22748];
  v9[6] = @"public.tar-bzip2-archive";
  v9[7] = v3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a1;
  uint64_t v6 = [v4 arrayWithObjects:v9 count:8];
  uint64_t v7 = [v6 containsObject:v5];

  return v7;
}

uint64_t _SFDownloadingFileTypeFromUTIAndMIMEType(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    if (UTTypeConformsTo(v3, @"com.apple.watchface"))
    {
      uint64_t v5 = 6;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F224C8])
      || UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F224D0])
      || UTTypeConformsTo(v3, (CFStringRef)[(id)*MEMORY[0x1E4F44580] identifier]))
    {
      uint64_t v5 = 3;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, @"com.apple.finance.order"))
    {
      uint64_t v5 = 7;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, @"com.apple.ical.ics"))
    {
      uint64_t v5 = 4;
      goto LABEL_19;
    }
    if (UTTypeConformsTo(v3, @"public.vcard"))
    {
      uint64_t v5 = 5;
      goto LABEL_19;
    }
    if (!v4) {
      uint64_t v4 = (__CFString *)UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x1E4F22500]);
    }
  }
  if ([(__CFString *)v4 safari_isConfigProfileMIMEType]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
LABEL_19:

  return v5;
}

void sub_1A6A601DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A6A604B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A6A623C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A6A626EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6A62CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1A6A64ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A69080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A6962C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A6A6A9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A6AA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A6AB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A6A6ACDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1A6A6ADEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6A6AF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A6A6AFB0()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getWFUserSettingsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SFDefaultBrowserListView _didFinishAppInstallation:browserChoiceResult:](v0);
}

uint64_t ___ZL19getWebBookmarkClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL32getSafariFetcherServerProxyClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL32getSafariFetcherServerProxyClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke_cold_1(v0);
}

void ___ZL33getWebBookmarksXPCConnectionClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[_SFWebProcessPlugIn webProcessPlugIn:initializeWithObject:](v0, v1);
}

void proceedWithClientCertificateIdentity_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Challenge rejected due to empty authentication chain", v1, 2u);
}

void newAlertToHandleClientSideCertificateErrorCode_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "The one identity installed was rejected by the server", v1, 2u);
}

uint64_t __getCertificateViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __94__SFAccountDetailViewController__sharePasswordWithPopoverPresentationControllerConfiguration___block_invoke_cold_1(v0);
}

uint64_t __getCRCameraReaderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __60___SFWebArchiveActivityItemProvider__webArchiveItemProvider__block_invoke_2_cold_1(v0);
}

uint64_t __getLPLinkMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLPFileMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getLPFileMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_SFExternalPasswordCredentialViewController _autoFillWithExternalCredential:pageID:frameID:](v0);
}

uint64_t __getTPDialPromptAlertClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __70___SFAppPasswordSavingViewController__connectToServiceWithCompletion___block_invoke_cold_1(v0);
}

uint64_t ___ZL36getCSSearchableItemAttributeSetClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __73__SFSafariViewControllerDataStore_clearWebsiteDataWithCompletionHandler___block_invoke_2_cold_1(v0);
}

uint64_t __getOBWelcomeControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SFSafariView setTintColor:](v0);
}

uint64_t __getOBBoldTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBTrayButtonClass_block_invoke_cold_1(v0);
}

uint64_t __getOBTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:](v0);
}

void tryOpeningInDefaultApp_cold_1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 URL];
  uint64_t v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v8, v9, "Failed to lookup applications available for opening %{sensitive}@: %{public}@", v10, v11, v12, v13, 3u);
}

void tryOpeningInDefaultApp_cold_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A690B000, v6, v7, "Failed to lookup type identifier for %{sensitive}@: %{public}@", v8, v9, v10, v11, 3u);
}

uint64_t ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_SFManagedFeatureObserver isUserEnrolledInBiometricAuthentication](v0);
}

void __getCNContactPickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:](v0, v1);
}

uint64_t __getEKEventStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getEKICSPreviewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getEKICSPreviewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getEKEventViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getEKEventViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_cold_1(v0);
}

uint64_t __getSearchUIClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return -[_SFReaderExtractor _finishWithContent:error:](v0, v1, v2);
}

uint64_t __getBCSQRCodeParserClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __131__SFPasswordSavingServiceViewController_credentialsSubmittedForWebsiteURL_user_password_passwordIsAutoGenerated_completionHandler___block_invoke_cold_1(v0);
}

uint64_t __getMFMailComposeViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __57__SFWebAppDataController_clearWebsiteDataWithCompletion___block_invoke_3_cold_1(v0);
}

uint64_t ___ZL31getSLComposeViewControllerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL14getPKPassClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL14getPKPassClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL19getFKSaveOrderClassv_block_invoke_cold_1(v0);
}

void ___ZL19getFKSaveOrderClassv_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  -[_SFReloadOptionsController didUpdateRequestDesktopSiteDefaultValue:](v0, v1);
}

uint64_t __getASDNotificationCenterClass_block_invoke_cold_1()
{
  return __getASDInstallAppsClass_block_invoke_cold_1();
}

uint64_t __getASDInstallAppsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getASDSystemAppMetadataClass_block_invoke_cold_1(v0);
}

uint64_t __getASDSystemAppMetadataClass_block_invoke_cold_1()
{
  return __getASDAppQueryClass_block_invoke_cold_1();
}

uint64_t __getASDAppQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSDeviceClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getACAccountStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getACAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getASDPurchaseClass_block_invoke_cold_1(v0);
}

uint64_t __getASDPurchaseClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getASDPurchaseManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getASDPurchaseManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSUIAuthenticateTaskClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSUIAuthenticateTaskClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSSystemAlertDialogTaskClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSSystemAlertDialogTaskClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSUIEngagementTaskClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSUIEngagementTaskClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:](v0);
}

uint64_t __getBEKeyEntryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_SFSaveToFilesOperation dealloc](v0);
}

uint64_t __getOBBoldTrayButtonClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  return __53__SFDefaultBrowserPromptController__connectToService__block_invoke_cold_1(v0);
}

uint64_t __getSBSHomeScreenServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[NSURLProtectionSpace(SafariServicesExtras) _sf_canAuthenticate](v0);
}

uint64_t ASCLockupViewSizeGetEstimatedSize()
{
  return MEMORY[0x1F4109228]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1F4109310]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1F40DF300]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

BOOL CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArrayRef descriptors, CFSetRef mandatoryAttributes, CTFontDescriptorProgressHandler progressBlock)
{
  return MEMORY[0x1F40DF468](descriptors, mandatoryAttributes, progressBlock);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
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

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  MEMORY[0x1F40DF7F0](line, charIndex, secondaryOffset);
  return result;
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x1F40E0AA0]();
}

uint64_t FPUpdateLastUsedDate()
{
  return MEMORY[0x1F40E0C18]();
}

uint64_t GSCurrentEventTimestamp()
{
  return MEMORY[0x1F411C878]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1F411C8F8]();
}

JSGlobalContextRef JSContextGetGlobalContext(JSContextRef ctx)
{
  return (JSGlobalContextRef)MEMORY[0x1F40E9BD8](ctx);
}

JSObjectRef JSContextGetGlobalObject(JSContextRef ctx)
{
  return (JSObjectRef)MEMORY[0x1F40E9BE0](ctx);
}

JSContextGroupRef JSContextGetGroup(JSContextRef ctx)
{
  return (JSContextGroupRef)MEMORY[0x1F40E9BE8](ctx);
}

uint64_t JSRemoteInspectorStart()
{
  return MEMORY[0x1F40E9D70]();
}

uint64_t JSScriptCreateReferencingImmortalASCIIText()
{
  return MEMORY[0x1F40E9D78]();
}

uint64_t JSScriptEvaluate()
{
  return MEMORY[0x1F40E9D80]();
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x1F40E9E20](ctx, value);
}

BOOL JSValueIsString(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x1F40E9E30](ctx, value);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1F40E72F0]();
}

uint64_t PKPeerPaymentGetTopUpSensitiveURL()
{
  return MEMORY[0x1F413B690]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1F4145DA8]();
}

uint64_t PSShouldInsetListView()
{
  return MEMORY[0x1F4145EB0]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x1F4145EE0]();
}

uint64_t SFAccessibilityTitleForBarItem()
{
  return MEMORY[0x1F412FA38]();
}

uint64_t SFBarBackgroundAlphaForSquishTransformFactor()
{
  return MEMORY[0x1F412FA40]();
}

uint64_t SFChromeVisibilityForScrollDistance()
{
  return MEMORY[0x1F412FA50]();
}

uint64_t SFCreateAppSuggestionBannerFromMetaTagContent()
{
  return MEMORY[0x1F412FA60]();
}

uint64_t SFCreditCardIconForType()
{
  return MEMORY[0x1F412FA68]();
}

uint64_t SFDefaultBrowserSelectionStateKey()
{
  return MEMORY[0x1F412FA78]();
}

uint64_t SFDefaultWebExtensionsPreferenceValues()
{
  return MEMORY[0x1F412FA80]();
}

uint64_t SFDeferrableUpdateViewCanUpdateContents()
{
  return MEMORY[0x1F412FA88]();
}

uint64_t SFDeferrableUpdateViewDidMoveToWindow()
{
  return MEMORY[0x1F412FA90]();
}

uint64_t SFDeferrableUpdateViewShouldAttemptToUpdateContents()
{
  return MEMORY[0x1F412FA98]();
}

uint64_t SFFocusGroupIdentifierForOwner()
{
  return MEMORY[0x1F412FAB8]();
}

uint64_t SFIsMenuActionConfigurable()
{
  return MEMORY[0x1F412FAC0]();
}

uint64_t SFLargeCreditCardIconForType()
{
  return MEMORY[0x1F412FAC8]();
}

uint64_t SFMorePageMenuSections()
{
  return MEMORY[0x1F412FAD0]();
}

uint64_t SFSectionToConfigurableMenuActions()
{
  return MEMORY[0x1F412FAE0]();
}

uint64_t SFShouldHandleSelectionForPresses()
{
  return MEMORY[0x1F412FAE8]();
}

uint64_t SFStringFromCredentialIdentityType()
{
  return MEMORY[0x1F414A278]();
}

uint64_t SFSystemImageNameForBarItem()
{
  return MEMORY[0x1F412FAF0]();
}

uint64_t SFSystemImageNameForTogglingMediaStateIcon()
{
  return MEMORY[0x1F412FB00]();
}

uint64_t SFTitleForTogglingMediaStateIcon()
{
  return MEMORY[0x1F412FB48]();
}

uint64_t SFUnconfigurableMenuAcitons()
{
  return MEMORY[0x1F412FB50]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1F40F6B68](certificate);
}

uint64_t SecCertificateIsValid()
{
  return MEMORY[0x1F40F6BC8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1F40F6DD0]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1F40F7088](server, hostname);
}

uint64_t SecTrustCopyInfo()
{
  return MEMORY[0x1F40F71B0]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1F40F71E8]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1F40F7220](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1F40F7228](trust);
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1F40F7250]();
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1F4166AD8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1F4166BD8]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1F4166BE0]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x1F4166C00]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

uint64_t UIKeyboardGetDefaultInputModesForLanguage()
{
  return MEMORY[0x1F4166D18]();
}

uint64_t UIKeyboardGetKeyboardKeyImage()
{
  return MEMORY[0x1F4166D30]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4166E88]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1F4166F00]();
}

uint64_t UIWebClipStatusBarStyleForMetaTagContent()
{
  return MEMORY[0x1F4166F20]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1F40DEE68](inUTI1, inUTI2);
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1F40DEE78](inUTI);
}

uint64_t WBSAXShouldShowAnimatedImageControls()
{
  return MEMORY[0x1F414A328]();
}

uint64_t WBSApplicationIdentifierFromAuditToken()
{
  return MEMORY[0x1F414A338]();
}

uint64_t WBSAuditTokenHasEntitlement()
{
  return MEMORY[0x1F414A340]();
}

uint64_t WBSAuditTokenValueArrayForEntitlement()
{
  return MEMORY[0x1F414A348]();
}

uint64_t WBSAuthenticationPolicyForPasswordManager()
{
  return MEMORY[0x1F414A350]();
}

uint64_t WBSCreditCardTypeFromNumber()
{
  return MEMORY[0x1F414A388]();
}

uint64_t WBSCreditCardTypeLocalizedName()
{
  return MEMORY[0x1F414A390]();
}

uint64_t WBSCurrentPasswordSavingBehavior()
{
  return MEMORY[0x1F414A398]();
}

uint64_t WBSDispatchAsyncAndReleaseOnMainQueue()
{
  return MEMORY[0x1F414A3A0]();
}

uint64_t WBSDisplayTextForCreditCardNumber()
{
  return MEMORY[0x1F414A3A8]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x1F414A3B8]();
}

uint64_t WBSLastDigitsOfCreditCardNumber()
{
  return MEMORY[0x1F414A3C8]();
}

uint64_t WBSLoadBuiltInContentBlockersWithStore()
{
  return MEMORY[0x1F414A3D0]();
}

uint64_t WBSLogWithDifferentialPrivacy()
{
  return MEMORY[0x1F414A3D8]();
}

uint64_t WBSMakeAccessibilityIdentifier()
{
  return MEMORY[0x1F414A3E0]();
}

uint64_t WBSReaderThemeColor()
{
  return MEMORY[0x1F414A3F8]();
}

uint64_t WBSReaderThemeLocalizedName()
{
  return MEMORY[0x1F414A408]();
}

uint64_t WBSRespondWithRandomDelay()
{
  return MEMORY[0x1F414A420]();
}

uint64_t WBSSearchProviderBaiduTrackingCodeTemplateParameterValues()
{
  return MEMORY[0x1F414A428]();
}

uint64_t WBSSearchProviderDefinitions()
{
  return MEMORY[0x1F414A430]();
}

uint64_t WBSSecIdentityCopySSLClientAuthenticationChain()
{
  return MEMORY[0x1F414A438]();
}

uint64_t WBSTabOrderManagerDefaultPreferenceValues()
{
  return MEMORY[0x1F414A450]();
}

uint64_t WBSTimeUntilNextWeeklyAnalyticsReportForKey()
{
  return MEMORY[0x1F414A458]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecision()
{
  return MEMORY[0x1F414A478]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecisionCamera()
{
  return MEMORY[0x1F414A480]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecisionMicrophone()
{
  return MEMORY[0x1F414A488]();
}

uint64_t WKArrayGetItemAtIndex()
{
  return MEMORY[0x1F4103E50]();
}

uint64_t WKArrayGetSize()
{
  return MEMORY[0x1F4103E58]();
}

uint64_t WKBundleFrameCreateFrameHandle()
{
  return MEMORY[0x1F4103E60]();
}

uint64_t WKBundleHitTestResultCopyAbsoluteLinkURL()
{
  return MEMORY[0x1F4103E68]();
}

uint64_t WKBundleHitTestResultGetFrame()
{
  return MEMORY[0x1F4103E70]();
}

uint64_t WKBundleHitTestResultGetTargetFrame()
{
  return MEMORY[0x1F4103E78]();
}

uint64_t WKBundlePageIsUsingEphemeralSession()
{
  return MEMORY[0x1F4103E80]();
}

uint64_t WKBundlePageSetUIClient()
{
  return MEMORY[0x1F4103E88]();
}

uint64_t WKDictionarySetItem()
{
  return MEMORY[0x1F4103E90]();
}

uint64_t WKGetTypeID()
{
  return MEMORY[0x1F4103E98]();
}

uint64_t WKMutableDictionaryCreate()
{
  return MEMORY[0x1F4103EA0]();
}

uint64_t WKStringCopyCFString()
{
  return MEMORY[0x1F4103EA8]();
}

uint64_t WKStringCreateWithUTF8CString()
{
  return MEMORY[0x1F4103EB0]();
}

uint64_t WKStringGetTypeID()
{
  return MEMORY[0x1F4103EB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SFAccessibilityIdentifierForBarItem()
{
  return MEMORY[0x1F412FB58]();
}

uint64_t _SFApplicationNameForDesktopUserAgent()
{
  return MEMORY[0x1F412FB60]();
}

uint64_t _SFApplicationNameForUserAgent()
{
  return MEMORY[0x1F412FB68]();
}

uint64_t _SFBackdropGroupNameForOwner()
{
  return MEMORY[0x1F412FB70]();
}

uint64_t _SFBarItemEnumerateCases()
{
  return MEMORY[0x1F412FB78]();
}

uint64_t _SFCGRectOfSizeAlignedWithinRect()
{
  return MEMORY[0x1F412FB90]();
}

uint64_t _SFCeilingFloatToPixels()
{
  return MEMORY[0x1F412FB98]();
}

uint64_t _SFClamp()
{
  return MEMORY[0x1F412FBA0]();
}

uint64_t _SFContentBlockerStoreURL()
{
  return MEMORY[0x1F412FBB0]();
}

uint64_t _SFContextInfoWithComment()
{
  return MEMORY[0x1F412FBB8]();
}

uint64_t _SFCustomUserAgentStringIfNeeded()
{
  return MEMORY[0x1F412FBC0]();
}

uint64_t _SFDeviceAlertStyle()
{
  return MEMORY[0x1F412FBD8]();
}

uint64_t _SFDeviceIsPad()
{
  return MEMORY[0x1F412FBE8]();
}

uint64_t _SFDeviceStatusBarHasNonTransparentBackground()
{
  return MEMORY[0x1F412FBF0]();
}

uint64_t _SFDeviceSupportsDesktopSitesByDefault()
{
  return MEMORY[0x1F412FBF8]();
}

uint64_t _SFEqualWithEpsilon()
{
  return MEMORY[0x1F412FC08]();
}

uint64_t _SFFloorFloatToPixels()
{
  return MEMORY[0x1F412FC18]();
}

uint64_t _SFIPhoneSafariUserAgentString()
{
  return MEMORY[0x1F412FC28]();
}

uint64_t _SFImageForMediaStateIcon()
{
  return MEMORY[0x1F412FC30]();
}

uint64_t _SFInsetIsInvalid()
{
  return MEMORY[0x1F412FC38]();
}

uint64_t _SFInterpolate()
{
  return MEMORY[0x1F412FC40]();
}

uint64_t _SFIsPrivateTintStyle()
{
  return MEMORY[0x1F412FC50]();
}

uint64_t _SFMacSafariUserAgentString()
{
  return MEMORY[0x1F412FC60]();
}

uint64_t _SFMediaStateIconIsMuted()
{
  return MEMORY[0x1F412FC68]();
}

uint64_t _SFMediaStateIconMutedVariant()
{
  return MEMORY[0x1F412FC70]();
}

uint64_t _SFOnePixel()
{
  return MEMORY[0x1F412FC78]();
}

uint64_t _SFPopoverSourceInfoForViewController()
{
  return MEMORY[0x1F412FC80]();
}

uint64_t _SFPopoverSourceInfoUnwrap()
{
  return MEMORY[0x1F412FC88]();
}

uint64_t _SFRoundEdgeInsetsToPixels()
{
  return MEMORY[0x1F412FC98]();
}

uint64_t _SFRoundFloatToPixels()
{
  return MEMORY[0x1F412FCA0]();
}

uint64_t _SFRoundPointToPixels()
{
  return MEMORY[0x1F412FCA8]();
}

uint64_t _SFRoundRectToPixels()
{
  return MEMORY[0x1F412FCB0]();
}

uint64_t _SFSFAppContainerURL()
{
  return MEMORY[0x1F412FCB8]();
}

uint64_t _SFSafariContainerPath()
{
  return MEMORY[0x1F412FCC0]();
}

uint64_t _SFSafariContainerURL()
{
  return MEMORY[0x1F412FCC8]();
}

uint64_t _SFSafariGroupContainerURL()
{
  return MEMORY[0x1F412FCD0]();
}

uint64_t _SFSafariIconLinkImage()
{
  return MEMORY[0x1F412FCE0]();
}

uint64_t _SFScreenScale()
{
  return MEMORY[0x1F412FCF8]();
}

uint64_t _SFSizeClassForWidth()
{
  return MEMORY[0x1F412FD00]();
}

uint64_t _SFToolbarContentSizeCategoryForPreferredCategory()
{
  return MEMORY[0x1F412FD10]();
}

uint64_t _SFWidthIsCompactSizeClass()
{
  return MEMORY[0x1F412FD20]();
}

uint64_t _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection()
{
  return MEMORY[0x1F4166F60]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x1F414A490]();
}

uint64_t SafariShared::JSUtilities::globalJSObjectByName(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, const char *a3)
{
  return MEMORY[0x1F414A498](this, a2, a3);
}

uint64_t SafariShared::JSUtilities::translateJSValueToNS(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, const OpaqueJSValue *a3)
{
  return MEMORY[0x1F414A4A0](this, a2, a3);
}

uint64_t SafariShared::JSUtilities::callJSMethodWithArguments(SafariShared::JSUtilities *this, const OpaqueJSContext *a2, OpaqueJSValue *a3, const char *a4, const OpaqueJSValue *const *a5)
{
  return MEMORY[0x1F414A4A8](this, a2, a3, a4, a5);
}

uint64_t SafariShared::JSController::scriptObjectReady(SafariShared::JSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1F414A4B0](this, a2);
}

uint64_t SafariShared::JSController::addScriptObjectToGlobalObject(SafariShared::JSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1F414A4B8](this, a2);
}

void SafariShared::JSController::~JSController(SafariShared::JSController *this)
{
}

uint64_t SafariShared::ReaderJSController::setArticleLocale(SafariShared::ReaderJSController *this, NSString *a2)
{
  return MEMORY[0x1F414A4D0](this, a2);
}

uint64_t SafariShared::ReaderJSController::setConfiguration(SafariShared::ReaderJSController *this, NSDictionary *a2)
{
  return MEMORY[0x1F414A4D8](this, a2);
}

uint64_t SafariShared::ReaderJSController::setArticleSummary()
{
  return MEMORY[0x1F414A4E0]();
}

uint64_t SafariShared::ReaderJSController::evaluateLocalizedStringsScript(SafariShared::ReaderJSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1F414A4F0](this, a2);
}

uint64_t SafariShared::ReaderJSController::evaluateSharedUINormalWorldScript(SafariShared::ReaderJSController *this, const OpaqueJSContext *a2)
{
  return MEMORY[0x1F414A4F8](this, a2);
}

uint64_t SafariShared::ReaderJSController::setOnDeviceSummaryButtonWithTitle(SafariShared::ReaderJSController *this, NSString *a2)
{
  return MEMORY[0x1F414A500](this, a2);
}

uint64_t SafariShared::ArticleFinderJSController::articleContent(SafariShared::ArticleFinderJSController *this)
{
  return MEMORY[0x1F414A508](this);
}

uint64_t SafariShared::ArticleFinderJSController::collectReadingListItemInformation(SafariShared::ArticleFinderJSController *this)
{
  return MEMORY[0x1F414A510](this);
}

uint64_t SafariShared::ArticleFinderJSController::detectAvailabilityForUIProcessDrivenCheck(SafariShared::ArticleFinderJSController *this)
{
  return MEMORY[0x1F414A518](this);
}

uint64_t SafariShared::TranslatedFileURLProtocol::registerProtocol()
{
  return MEMORY[0x1F414A520]();
}

uint64_t SafariShared::ReaderAvailabilityController::didFinishLoad(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1F414A528](this);
}

uint64_t SafariShared::ReaderAvailabilityController::clearAvailability(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1F414A530](this);
}

uint64_t SafariShared::ReaderAvailabilityController::configureProcessPool(SafariShared::ReaderAvailabilityController *this, WKProcessPool *a2)
{
  return MEMORY[0x1F414A538](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::prepareArticleFinder(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1F414A540](this);
}

uint64_t SafariShared::ReaderAvailabilityController::didFinishDocumentLoad(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1F414A548](this);
}

uint64_t SafariShared::ReaderAvailabilityController::readerHasBeenActivatedRecently(SafariShared::ReaderAvailabilityController *this, NSDate *a2)
{
  return MEMORY[0x1F414A568](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1F414A570](this);
}

uint64_t SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(SafariShared::ReaderAvailabilityController *this, WKProcessPool *a2)
{
  return MEMORY[0x1F414A578](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::ReaderAvailabilityController(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1F414A588](this);
}

void SafariShared::ReaderAvailabilityController::~ReaderAvailabilityController(SafariShared::ReaderAvailabilityController *this)
{
}

uint64_t SafariShared::ReaderAvailabilityController::originalArticleFinderJSController(SafariShared::ReaderAvailabilityController *this)
{
  return MEMORY[0x1F414A5A8](this);
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

uint64_t __UIApplicationLinkedOnOrAfter()
{
  return MEMORY[0x1F4167120]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1F40CB3D0](*(void *)&__clock_id, __tp);
}

uint64_t defaultTranslationPreferenceValues()
{
  return MEMORY[0x1F414A5B0]();
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

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x1F40CBEC0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

void objc_moveWeak(id *to, id *from)
{
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

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1F40CDFD0](a1, a2, *(void *)&a3, a4);
}

uint64_t showInternalTranslationActions()
{
  return MEMORY[0x1F414A5B8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}