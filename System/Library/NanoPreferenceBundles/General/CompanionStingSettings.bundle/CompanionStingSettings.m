void sub_36A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_36C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_36D0(uint64_t a1)
{
}

void sub_36D8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "identifier", (void)v17);
        unsigned int v13 = [v12 isEqualToString:*(void *)(a1 + 32)];

        if (v13)
        {
          uint64_t v14 = [v11 title];
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
          v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          *a4 = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_46A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_46C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isViewLoaded]) {
    [WeakRetained reloadSpecifiers];
  }
}

void sub_6B50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = PSRadioGroupCheckedSpecifierKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        v12 = [v10 title];
        unsigned int v13 = [v10 identifier];
        uint64_t v14 = [v11 _makeListItemSpecifier:v12 value:v13];

        uint64_t v15 = [v10 identifier];
        LODWORD(v12) = [v15 isEqualToString:*(void *)(a1 + 40)];

        if (v12) {
          [*(id *)(*(void *)(a1 + 32) + 192) setProperty:v14 forKey:v8];
        }
        [*(id *)(a1 + 48) addObject:v14];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

void sub_87A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "the currently configured sting bundleID:%@ is missing from app library", (uint8_t *)&v2, 0xCu);
}

uint64_t CSLActionTypeToSettingsActionType()
{
  return _CSLActionTypeToSettingsActionType();
}

uint64_t CSLChordAction()
{
  return _CSLChordAction();
}

uint64_t CSLHasChordActionInstructions()
{
  return _CSLHasChordActionInstructions();
}

uint64_t CSLSettingsActionTypeToLinkActionType()
{
  return _CSLSettingsActionTypeToLinkActionType();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t cslprf_sting_settings_log()
{
  return _cslprf_sting_settings_log();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__deregisterMandrakeSettingsListener(void *a1, const char *a2, ...)
{
  return [a1 _deregisterMandrakeSettingsListener];
}

id objc_msgSend__mandrakeSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _mandrakeSpecifiers];
}

id objc_msgSend__quickSwitchSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _quickSwitchSpecifiers];
}

id objc_msgSend__registerMandrakeSettingsListener(void *a1, const char *a2, ...)
{
  return [a1 _registerMandrakeSettingsListener];
}

id objc_msgSend__selectedAccessibilitySpecifier(void *a1, const char *a2, ...)
{
  return [a1 _selectedAccessibilitySpecifier];
}

id objc_msgSend__selectedShortcutSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _selectedShortcutSpecifier];
}

id objc_msgSend__settingsModel(void *a1, const char *a2, ...)
{
  return [a1 _settingsModel];
}

id objc_msgSend__specifiersForUnconfiguredAction(void *a1, const char *a2, ...)
{
  return [a1 _specifiersForUnconfiguredAction];
}

id objc_msgSend_accessibilityItems(void *a1, const char *a2, ...)
{
  return [a1 accessibilityItems];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return [a1 actionType];
}

id objc_msgSend_activeDeviceHasMandrake(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceHasMandrake];
}

id objc_msgSend_allQuickSwitchItems(void *a1, const char *a2, ...)
{
  return [a1 allQuickSwitchItems];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetName(void *a1, const char *a2, ...)
{
  return [a1 assetName];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cellStyle(void *a1, const char *a2, ...)
{
  return [a1 cellStyle];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_hasSubtitle(void *a1, const char *a2, ...)
{
  return [a1 hasSubtitle];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAvailableForQuickSwitch(void *a1, const char *a2, ...)
{
  return [a1 isAvailableForQuickSwitch];
}

id objc_msgSend_isQuickSwitchEnabled(void *a1, const char *a2, ...)
{
  return [a1 isQuickSwitchEnabled];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedUppercaseString];
}

id objc_msgSend_longPressTriggersMandrake(void *a1, const char *a2, ...)
{
  return [a1 longPressTriggersMandrake];
}

id objc_msgSend_preferredCellHeight(void *a1, const char *a2, ...)
{
  return [a1 preferredCellHeight];
}

id objc_msgSend_quickActionItems(void *a1, const char *a2, ...)
{
  return [a1 quickActionItems];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_settingsItem(void *a1, const char *a2, ...)
{
  return [a1 settingsItem];
}

id objc_msgSend_shortcutItems(void *a1, const char *a2, ...)
{
  return [a1 shortcutItems];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_workoutIdentifier(void *a1, const char *a2, ...)
{
  return [a1 workoutIdentifier];
}