void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_226A60534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A60908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_226A60EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226A614F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226A61800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226A61D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_226A62EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_226A636C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A637F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_226A63A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A63B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A64874(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
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

void sub_226A663D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226A67E90(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_226A69FF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_226A6A398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL AVTIsPersistentChangeOfInterest_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 changeType] && objc_msgSend(v2, "changeType") != 2)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    uint64_t v4 = [v2 updatedProperties];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = AVTIsPersistentChangeOfInterest_block_invoke_2;
    v6[3] = &unk_2647C3A70;
    v6[4] = &v7;
    [v4 enumerateObjectsUsingBlock:v6];

    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

void sub_226A6AD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVTIsPersistentChangeOfInterest_block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v9 = @"orderDate";
  char v10 = @"avatarData";
  v11 = @"identifier";
  v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a2;
  uint64_t v7 = [v5 arrayWithObjects:&v9 count:3];
  v8 = objc_msgSend(v6, "name", v9, v10, v11, v12);

  LODWORD(v6) = [v7 containsObject:v8];
  if (v6)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

uint64_t AVTAnyTransactionHasChangesFromAuthor_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "author", (void)v15);
        if ([v11 isEqual:v5])
        {
          uint64_t v12 = [v10 changes];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            uint64_t v7 = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
LABEL_12:

  return v7;
}

uint64_t AVTAnyTransactionHasChangesFromOtherThanAuthor_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "author", (void)v15);
        if ([v11 isEqual:v5])
        {
        }
        else
        {
          uint64_t v12 = [v10 changes];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            uint64_t v7 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

uint64_t AVTAnyTransactionHasChangesFromOtherThanBundleID_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "bundleID", (void)v15);
        if ([v11 isEqual:v5])
        {
        }
        else
        {
          uint64_t v12 = [v10 changes];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            uint64_t v7 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

uint64_t AVTAnyTransactionHasAvatarChange_block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = a2;
  uint64_t v18 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v3 = *(void *)v25;
    v19 = v2;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v3) {
          objc_enumerationMutation(v2);
        }
        id v5 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v6 = [v5 changes];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = [*(id *)(*((void *)&v20 + 1) + 8 * j) changedObjectID];
              uint64_t v12 = [v11 entity];
              uint64_t v13 = [v12 name];
              char v14 = [v13 isEqualToString:@"Avatar"];

              if (v14)
              {

                uint64_t v15 = 1;
                id v2 = v19;
                goto LABEL_19;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }

        id v2 = v19;
        uint64_t v3 = v17;
      }
      uint64_t v15 = 0;
      uint64_t v18 = [v19 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_19:

  return v15;
}

void sub_226A6B8F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226A6B988(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226A6BA98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226A6BB30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _AVTUISetPropertyListObjectForInternalSettingsKey(void *a1, void *a2)
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE50];
  id v5 = a2;
  id value = a1;
  _CFPreferencesSetBackupDisabled();
  CFPreferencesSetValue(v5, value, @"com.apple.AvatarUI.Staryu", v3, v4);
}

id _AVTUIPropertyListObjectForInternalSettingsKey(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyValue(a1, @"com.apple.AvatarUI.Staryu", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);

  return v1;
}

uint64_t _AVTUIBoolForInternalSettingKey(const __CFString *a1, uint64_t a2)
{
  CFStringRef v3 = (void *)CFPreferencesCopyValue(a1, @"com.apple.AvatarUI.Staryu", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFStringRef v4 = v3;
  if (v3) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

void _AVTUISetBoolForInternalSettingsKey(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if ((a1 & 1) != 0 || a3)
  {
    id v5 = [NSNumber numberWithBool:a1];
  }
  else
  {
    id v5 = 0;
  }
  _AVTUISetPropertyListObjectForInternalSettingsKey(v5, v6);
}

uint64_t _AVTUIIntegerForInternalSettingsKey(const __CFString *a1)
{
  uint64_t v1 = _AVTUIPropertyListObjectForInternalSettingsKey(a1);
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void _AVTUISetIntegerForInternalSettingsKey(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a2;
  id v5 = [v3 numberWithInteger:a1];
  _AVTUISetPropertyListObjectForInternalSettingsKey(v5, v4);
}

void _AVTUIRemoveInternalSettingsKey(void *a1)
{
}

id _AVTUIPropertyListObjectForGlobalKey(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyValue(a1, @".GlobalPreferences", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);

  return v1;
}

uint64_t _AVTUIIntegerForGlobalKey(const __CFString *a1)
{
  uint64_t v1 = _AVTUIPropertyListObjectForGlobalKey(a1);
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void _AVTUISetPropertyListObjectForGlobalKey(CFPropertyListRef value, CFStringRef key)
{
}

void _AVTUISetIntegerForGlobalKey(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a2;
  id v5 = [v3 numberWithInteger:a1];
  CFPreferencesSetValue(v4, v5, @".GlobalPreferences", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

void _AVTUIRemoveGlobalKey(const __CFString *a1)
{
}

void AVTUIResetInternalSettings()
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIRestrictMaxAvatarCount");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIShowPerfHUD");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIThumbnailCaching");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIFlushThumbnailCache");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIRestrictMaxAvatarCount");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarShowTrackingLostReticle");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarAlwaysShowSplashScreen");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarAlwaysShowPaddleView");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarPreLoadOnLaunch");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAdaptativeFrameRate");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIEditorShowAssetsName");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesGroupDialUsesMasking");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesDisableDeleteConfirmation");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesDisablEditAfterDuplicate");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIShowAssetsWarning");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesMemojiClassicDisclosureWarning");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesStickersDisclosureWarning");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesStickersCaching");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesFlushStickersCache");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesShowPrereleaseStickerPack");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesShowPrereleaseStickerLabel");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesStickersHEICSSequence");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesStickerRecentsDisclosureWarning");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesAlwaysShowStickerRecentsSplashScreen");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesStickersDisclosureWarning");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTSyncEnabled");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIWipeCloudKitContainer");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIUseTestCloudKitContainer");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIWipeDatabase");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUISyncPreserveContentOnAccountChange");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUIWipeCloudKitContainer");

  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarUseLocalEditorModel");
}

void AVTUIFlushCaches()
{
  _AVTUISetBoolForInternalSettingsKey(1, @"AVTAvatarUIFlushThumbnailCache", 0);

  _AVTUISetBoolForInternalSettingsKey(1, @"AVTUIGlobalPreferencesFlushStickersCache", 0);
}

void AVTUISetFlushThumbnailCache(uint64_t a1)
{
}

void AVTUISetFlushStickersCache(uint64_t a1)
{
}

void AVTUIResetFirstTimeExperience()
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarHasDisplayedSplashScreen");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarHasDisplayedPaddleView");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarHasDisplayedCameraEffectsSplashScreen");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTAvatarHasDisplayedAnimojiSplashScreen");
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, @"AVTUIGlobalPreferencesHasDisplayedCategoriesDiscoverability");
  CFPreferencesSetValue(@"com.apple.Animoji.StickerRecents.SplashVersion", 0, @".GlobalPreferences", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  _AVTUISetBoolForInternalSettingsKey(1, @"AVTAvatarUIFlushThumbnailCache", 0);

  _AVTUISetBoolForInternalSettingsKey(1, @"AVTUIGlobalPreferencesFlushStickersCache", 0);
}

uint64_t AVTUIIsAvatarUIEnabled()
{
  return 1;
}

void AVTUISetShowAssetsWarning(uint64_t a1)
{
}

uint64_t AVTUIShowAssetsWarning()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIShowAssetsWarning", 0);
}

void AVTUISetShowPerfHUD(uint64_t a1)
{
}

uint64_t AVTUIShowPerfHUD()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIShowPerfHUD", 0);
}

void AVTUISetEditorShowAssetsName(uint64_t a1)
{
}

uint64_t AVTUIEditorShowAssetsName()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIEditorShowAssetsName", 0);
}

uint64_t AVTUILastCacheVersion()
{
  return _AVTUIIntegerForInternalSettingsKey(@"AVTAvatarUILastCacheVersion");
}

void AVTUISetLastCacheVersion(uint64_t a1)
{
}

uint64_t AVTUIThumbnailCaching()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIThumbnailCaching", 1);
}

void AVTUISetThumbnailCaching(uint64_t a1)
{
}

uint64_t AVTUIFlushThumbnailCache()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIFlushThumbnailCache", 0);
}

void AVTUISetShowTrackingLostReticle(uint64_t a1)
{
}

uint64_t AVTUIShowTrackingLostReticle()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarShowTrackingLostReticle", 0);
}

void AVTUISetHasDisplayedSplashScreen(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedSplashScreen", 0);
}

void AVTUISetHasDisplayedCameraDisclosureSplashScreen(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedCameraDisclosureSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedCameraDisclosureSplashScreen", 0);
}

void AVTUISetHasDisplayedPaddleView(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedPaddleView()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedPaddleView", 0);
}

void AVTUISetAlwaysShowPaddleView(uint64_t a1)
{
}

uint64_t AVTUIAlwaysShowPaddleView()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarAlwaysShowPaddleView", 0);
}

void AVTUISetHasDisplayedAnimojiSplashScreen(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedAnimojiSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedAnimojiSplashScreen", 0);
}

void AVTUISetHasDisplayedAnimojiCameraDisclosureSplashScreen(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedAnimojiCameraDisclosureSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedAnimojiCameraDisclosureSplashScreen", 0);
}

void AVTUISetHasDisplayedCameraEffectsSplashScreen(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedCameraEffectsSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedCameraEffectsSplashScreen", 0);
}

void AVTUISetHasDisplayedCameraEffectsCameraDisclosureSplashScreen(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedCameraEffectsCameraDisclosureSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedCameraEffectsCameraDisclosureSplashScreen", 0);
}

void AVTUISetAlwaysShowSplashScreen(uint64_t a1)
{
}

uint64_t AVTUIAlwaysShowSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarAlwaysShowSplashScreen", 0);
}

uint64_t AVTUIForceCameraDisclosures()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarForceCameraDisclosures", 0);
}

void AVTUISetForceCameraDisclosures(uint64_t a1)
{
}

void AVTUISetHasDisplayedCategoriesDiscoverability(uint64_t a1)
{
}

uint64_t AVTUIHasDisplayedCategoriesDiscoverability()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesHasDisplayedCategoriesDiscoverability", 0);
}

void AVTUISetDisableDeleteConfirmation(uint64_t a1)
{
}

uint64_t AVTUIDisableDeleteConfirmation()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesDisableDeleteConfirmation", 0);
}

void AVTUISetDisableEditAfterDuplicate(uint64_t a1)
{
}

uint64_t AVTUIDisableEditAfterDuplicate()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesDisablEditAfterDuplicate", 0);
}

void AVTUISetGroupDialUsesMasking(uint64_t a1)
{
}

uint64_t AVTUIGroupDialUsesMasking()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesGroupDialUsesMasking", 1);
}

uint64_t AVTUIAvatarPreLoadOnLaunch()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarPreLoadOnLaunch", 0);
}

void AVTUISetAvatarPreLoadOnLaunch(uint64_t a1)
{
}

void AVTUISetAdaptativeFrameRate(uint64_t a1)
{
}

uint64_t AVTUIAdaptativeFrameRate()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAdaptativeFrameRate", 0);
}

void AVTUISetWipeCloudKitContainer(uint64_t a1)
{
}

uint64_t AVTUIWipeCloudKitContainer()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIWipeCloudKitContainer", 0);
}

void AVTUISetUseTestCloudKitContainer(uint64_t a1)
{
}

uint64_t AVTUIUseTestCloudKitContainer()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIUseTestCloudKitContainer", 0);
}

void AVTUISetWipeLocalDatabase(uint64_t a1)
{
}

uint64_t AVTUIWipeLocalDatabase()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUIWipeDatabase", 0);
}

void AVTUISetAvatarSyncEnabled(uint64_t a1)
{
}

uint64_t AVTUIIsAvatarSyncEnabled()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTSyncEnabled", 1);
}

void AVTUISetUseLocalEditorModel(uint64_t a1)
{
}

uint64_t AVTUIUseLocalEditorModel()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTAvatarUseLocalEditorModel", 0);
}

void AVTUISetPreserveContentOnAccountChange(uint64_t a1)
{
}

uint64_t AVTUIPreserveContentOnAccountChange()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUISyncPreserveContentOnAccountChange", 0);
}

void AVTUISetRestrictMaximumAvatarCount(uint64_t a1)
{
}

uint64_t AVTUIRestrictMaximumAvatarCount()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIRestrictMaxAvatarCount", 0);
}

uint64_t AVTUIIsAvatarUIEnabled_once()
{
  if (AVTUIIsAvatarUIEnabled_once_onceToken != -1) {
    dispatch_once(&AVTUIIsAvatarUIEnabled_once_onceToken, &__block_literal_global_5);
  }
  return AVTUIIsAvatarUIEnabled_once_enabled;
}

uint64_t AVTUIShowAssetsWarning_once()
{
  if (AVTUIShowAssetsWarning_once_onceToken != -1) {
    dispatch_once(&AVTUIShowAssetsWarning_once_onceToken, &__block_literal_global_147);
  }
  return AVTUIShowAssetsWarning_once_enabled;
}

uint64_t AVTUIShowPerfHUD_once()
{
  if (AVTUIShowPerfHUD_once_onceToken != -1) {
    dispatch_once(&AVTUIShowPerfHUD_once_onceToken, &__block_literal_global_149);
  }
  return AVTUIShowPerfHUD_once_enabled;
}

uint64_t AVTUIEditorShowAssetsName_once()
{
  if (AVTUIEditorShowAssetsName_once_onceToken != -1) {
    dispatch_once(&AVTUIEditorShowAssetsName_once_onceToken, &__block_literal_global_151);
  }
  return AVTUIEditorShowAssetsName_once_enabled;
}

uint64_t AVTUIThumbnailCaching_once()
{
  if (AVTUIThumbnailCaching_once_onceToken != -1) {
    dispatch_once(&AVTUIThumbnailCaching_once_onceToken, &__block_literal_global_153);
  }
  return AVTUIThumbnailCaching_once_enabled;
}

uint64_t AVTUIFlushThumbnailCache_once()
{
  if (AVTUIFlushThumbnailCache_once_onceToken != -1) {
    dispatch_once(&AVTUIFlushThumbnailCache_once_onceToken, &__block_literal_global_155);
  }
  return AVTUIFlushThumbnailCache_once_enabled;
}

uint64_t AVTUIShowTrackingLostReticle_once()
{
  if (AVTUIShowTrackingLostReticle_once_onceToken != -1) {
    dispatch_once(&AVTUIShowTrackingLostReticle_once_onceToken, &__block_literal_global_157);
  }
  return AVTUIShowTrackingLostReticle_once_enabled;
}

uint64_t AVTUIAlwaysShowSplashScreen_once()
{
  if (AVTUIAlwaysShowSplashScreen_once_onceToken != -1) {
    dispatch_once(&AVTUIAlwaysShowSplashScreen_once_onceToken, &__block_literal_global_159);
  }
  return AVTUIAlwaysShowSplashScreen_once_enabled;
}

uint64_t AVTUIForceCameraDisclosures_once()
{
  if (AVTUIForceCameraDisclosures_once_onceToken != -1) {
    dispatch_once(&AVTUIForceCameraDisclosures_once_onceToken, &__block_literal_global_161);
  }
  return AVTUIForceCameraDisclosures_once_enabled;
}

uint64_t AVTUIDisableDeleteConfirmation_once()
{
  if (AVTUIDisableDeleteConfirmation_once_onceToken != -1) {
    dispatch_once(&AVTUIDisableDeleteConfirmation_once_onceToken, &__block_literal_global_163);
  }
  return AVTUIDisableDeleteConfirmation_once_enabled;
}

uint64_t AVTUIDisableEditAfterDuplicate_once()
{
  if (AVTUIDisableEditAfterDuplicate_once_onceToken != -1) {
    dispatch_once(&AVTUIDisableEditAfterDuplicate_once_onceToken, &__block_literal_global_165);
  }
  return AVTUIDisableEditAfterDuplicate_once_enabled;
}

uint64_t AVTUIGroupDialUsesMasking_once()
{
  if (AVTUIGroupDialUsesMasking_once_onceToken != -1) {
    dispatch_once(&AVTUIGroupDialUsesMasking_once_onceToken, &__block_literal_global_167);
  }
  return AVTUIGroupDialUsesMasking_once_enabled;
}

uint64_t AVTUIRestrictMaximumAvatarCount_once()
{
  if (AVTUIRestrictMaximumAvatarCount_once_onceToken != -1) {
    dispatch_once(&AVTUIRestrictMaximumAvatarCount_once_onceToken, &__block_literal_global_169);
  }
  return AVTUIRestrictMaximumAvatarCount_once_enabled;
}

uint64_t AVTUIAlwaysShowPaddleView_once()
{
  if (AVTUIAlwaysShowPaddleView_once_onceToken != -1) {
    dispatch_once(&AVTUIAlwaysShowPaddleView_once_onceToken, &__block_literal_global_171);
  }
  return AVTUIAlwaysShowPaddleView_once_enabled;
}

uint64_t AVTUIHasDisplayedSplashScreen_once()
{
  if (AVTUIHasDisplayedSplashScreen_once_onceToken != -1) {
    dispatch_once(&AVTUIHasDisplayedSplashScreen_once_onceToken, &__block_literal_global_173);
  }
  return AVTUIHasDisplayedSplashScreen_once_enabled;
}

uint64_t AVTUIHasDisplayedAnimojiSplashScreen_once()
{
  if (AVTUIHasDisplayedAnimojiSplashScreen_once_onceToken != -1) {
    dispatch_once(&AVTUIHasDisplayedAnimojiSplashScreen_once_onceToken, &__block_literal_global_175);
  }
  return AVTUIHasDisplayedAnimojiSplashScreen_once_enabled;
}

uint64_t AVTUIHasDisplayedCameraEffectsSplashScreen_once()
{
  if (AVTUIHasDisplayedCameraEffectsSplashScreen_once_onceToken != -1) {
    dispatch_once(&AVTUIHasDisplayedCameraEffectsSplashScreen_once_onceToken, &__block_literal_global_177);
  }
  return AVTUIHasDisplayedCameraEffectsSplashScreen_once_enabled;
}

uint64_t AVTUIAlwaysShowRecentStickersSplashScreen_once()
{
  if (AVTUIAlwaysShowRecentStickersSplashScreen_once_onceToken != -1) {
    dispatch_once(&AVTUIAlwaysShowRecentStickersSplashScreen_once_onceToken, &__block_literal_global_179);
  }
  return AVTUIAlwaysShowRecentStickersSplashScreen_once_enabled;
}

uint64_t AVTUIAlwaysShowRecentStickersSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesAlwaysShowStickerRecentsSplashScreen", 0);
}

uint64_t AVTUIForceNoMemojiRecentStickersSplashScreen_once()
{
  if (AVTUIForceNoMemojiRecentStickersSplashScreen_once_onceToken != -1) {
    dispatch_once(&AVTUIForceNoMemojiRecentStickersSplashScreen_once_onceToken, &__block_literal_global_181);
  }
  return AVTUIForceNoMemojiRecentStickersSplashScreen_once_enabled;
}

uint64_t AVTUIForceNoMemojiRecentStickersSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesForceNoMemojiStickerRecentsSplashScreen", 0);
}

uint64_t AVTUIStickerRecentsMigrationVersion_once()
{
  if (AVTUIStickerRecentsMigrationVersion_once_onceToken != -1) {
    dispatch_once(&AVTUIStickerRecentsMigrationVersion_once_onceToken, &__block_literal_global_183);
  }
  return AVTUIStickerRecentsMigrationVersion_once_value;
}

uint64_t AVTUIStickerRecentsMigrationVersion()
{
  v0 = _AVTUIPropertyListObjectForInternalSettingsKey(@"AVTUIGlobalPreferencesStickerRecentsMigrationVersion");
  uint64_t v1 = [v0 integerValue];

  return v1;
}

uint64_t AVTUIHasDisplayedPaddleView_once()
{
  if (AVTUIHasDisplayedPaddleView_once_onceToken != -1) {
    dispatch_once(&AVTUIHasDisplayedPaddleView_once_onceToken, &__block_literal_global_185);
  }
  return AVTUIHasDisplayedPaddleView_once_enabled;
}

uint64_t AVTUIMemojiClassicShowDisclosureWarning_once()
{
  if (AVTUIMemojiClassicShowDisclosureWarning_once_onceToken != -1) {
    dispatch_once(&AVTUIMemojiClassicShowDisclosureWarning_once_onceToken, &__block_literal_global_187);
  }
  return AVTUIMemojiClassicShowDisclosureWarning_once_enabled;
}

uint64_t AVTUIMemojiClassicShowDisclosureWarning()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesMemojiClassicDisclosureWarning", 0);
}

uint64_t AVTUIStickersShowDisclosureWarning_once()
{
  if (AVTUIStickersShowDisclosureWarning_once_onceToken != -1) {
    dispatch_once(&AVTUIStickersShowDisclosureWarning_once_onceToken, &__block_literal_global_189);
  }
  return AVTUIStickersShowDisclosureWarning_once_enabled;
}

uint64_t AVTUIStickersShowDisclosureWarning()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesStickersDisclosureWarning", 0);
}

uint64_t AVTUIStickerRecentsShowDisclosureWarning_once()
{
  if (AVTUIStickerRecentsShowDisclosureWarning_once_onceToken != -1) {
    dispatch_once(&AVTUIStickerRecentsShowDisclosureWarning_once_onceToken, &__block_literal_global_191);
  }
  return AVTUIStickerRecentsShowDisclosureWarning_once_enabled;
}

uint64_t AVTUIStickerRecentsShowDisclosureWarning()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesStickerRecentsDisclosureWarning", 0);
}

uint64_t AVTUIShowPrereleaseStickerPack_once()
{
  if (AVTUIShowPrereleaseStickerPack_once_onceToken != -1) {
    dispatch_once(&AVTUIShowPrereleaseStickerPack_once_onceToken, &__block_literal_global_193);
  }
  return AVTUIShowPrereleaseStickerPack_once_enabled;
}

uint64_t AVTUIShowPrereleaseStickerPack()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesShowPrereleaseStickerPack", 0);
}

uint64_t AVTUIShowPrereleaseStickerLabel_once()
{
  if (AVTUIShowPrereleaseStickerLabel_once_onceToken != -1) {
    dispatch_once(&AVTUIShowPrereleaseStickerLabel_once_onceToken, &__block_literal_global_195);
  }
  return AVTUIShowPrereleaseStickerLabel_once_enabled;
}

uint64_t AVTUIShowPrereleaseStickerLabel()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesShowPrereleaseStickerLabel", 0);
}

uint64_t AVTUIUseLocalEditorModel_once()
{
  if (AVTUIUseLocalEditorModel_once_onceToken != -1) {
    dispatch_once(&AVTUIUseLocalEditorModel_once_onceToken, &__block_literal_global_197);
  }
  return AVTUIUseLocalEditorModel_once_enabled;
}

id AVTUIEditorMostRecentGroupName()
{
  return _AVTUIPropertyListObjectForInternalSettingsKey(@"AVTUIEditorGroupName");
}

void AVTUIEditorSetMostRecentGroupName(void *a1)
{
}

void AVTUISyncSetSuccessfulImportDate(void *a1)
{
}

id AVTUISyncSuccessfulImportDate()
{
  return _AVTUIPropertyListObjectForInternalSettingsKey(@"AVTSyncImportDate");
}

void AVTUISyncSetExportRequired(uint64_t a1)
{
}

uint64_t AVTUISyncExportRequired()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUISyncExportRequired", 0);
}

void AVTUISetStickersLastSelected(void *a1)
{
}

id AVTUIStickersLastSelected()
{
  return _AVTUIPropertyListObjectForInternalSettingsKey(@"AVTUIGlobalPreferencesStickersLastSelected");
}

void AVTUISetMemojiClassicShowDisclosureWarning(uint64_t a1)
{
}

void AVTUISetStickersShowDisclosureWarning(uint64_t a1)
{
}

void AVTUISetStickerRecentsShowDisclosureWarning(uint64_t a1)
{
}

uint64_t AVTUIStickersCaching()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesStickersCaching", 1);
}

void AVTUISetStickersCaching(uint64_t a1)
{
}

uint64_t AVTUIFlushStickersCache()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesFlushStickersCache", 0);
}

void AVTUISetShowPrereleaseStickerPack(uint64_t a1)
{
}

void AVTUISetShowPrereleaseStickerLabel(uint64_t a1)
{
}

uint64_t AVTUIStickersUseHEICSSequence()
{
  return _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesStickersHEICSSequence", 0);
}

void AVTUISetStickersUseHEICSSequence(uint64_t a1)
{
}

BOOL AVTUIHasShownStickerRecentsSplashView()
{
  return _AVTUIIntegerForGlobalKey(@"com.apple.Animoji.StickerRecents.SplashVersion") > 0;
}

void AVTUISetHasShownStickerRecentsSplashView(unsigned int a1)
{
}

void AVTUISetAlwaysShowRecentStickersSplashScreen(uint64_t a1)
{
}

void AVTUISetForceNoMemojiRecentStickersSplashScreen(uint64_t a1)
{
}

void AVTUISetStickerRecentsMigrationVersion(uint64_t a1)
{
  id v1 = [NSNumber numberWithInteger:a1];
  _AVTUISetPropertyListObjectForInternalSettingsKey(v1, @"AVTUIGlobalPreferencesStickerRecentsMigrationVersion");
}

void sub_226A6E39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x22A660070](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_226A6E768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226A6EB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AVTAvatarRecordChangeEqualToChange(void *a1, void *a2)
{
  id v4 = a1;
  id v5 = a2;
  id v6 = [v4 recordIdentifier];
  if (!v6)
  {
    id v2 = [v5 recordIdentifier];
    if (!v2) {
      goto LABEL_5;
    }
  }
  uint64_t v7 = [v4 recordIdentifier];
  uint64_t v8 = [v5 recordIdentifier];
  int v9 = [v7 isEqual:v8];

  if (!v6)
  {

    if (v9) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }

  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v10 = [v4 changeType];
  BOOL v11 = v10 == [v5 changeType];
LABEL_8:

  return v11;
}

uint64_t AVTAvatarRecordChangeHash(void *a1)
{
  id v1 = a1;
  id v2 = [v1 recordIdentifier];
  uint64_t v3 = [v2 hash];
  id v4 = [v1 recordIdentifier];
  *((void *)&v5 + 1) = v3;
  *(void *)&long long v5 = [v4 hash];
  uint64_t v6 = [v1 changeType];

  return (v5 >> 32) ^ v6;
}

void sub_226A723D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
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

void sub_226A729DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_226A73598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226A73B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226A7405C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id AVTDefaultFileProtectionType()
{
  return (id)*MEMORY[0x263F08098];
}

uint64_t AVTDefaultFileProtectionDataWritingOptions()
{
  return 0x40000000;
}

uint64_t AVTIsRunningAsSetupUser()
{
  return 0;
}

uint64_t _RecentStickersChangedExternally(uint64_t a1, void *a2)
{
  return [a2 _recentStickersChangedExternally];
}

void sub_226A74B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_226A782C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
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

void sub_226A78B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_226A795B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
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

void sub_226A7A4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
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

void sub_226A7AEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226A7B59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226A7C3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_226A7C528(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226A86FE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

uint64_t AVTAvatarKitSnapshotVersionNumber()
{
  return MEMORY[0x270F10258]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x270EE5460](url, key, propertyValue, error);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return MEMORY[0x270EE5698]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}