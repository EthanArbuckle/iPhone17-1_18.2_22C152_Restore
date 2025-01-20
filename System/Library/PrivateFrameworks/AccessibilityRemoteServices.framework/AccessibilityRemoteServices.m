void sub_2249E1310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_2249E18C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXRDeviceRemoteActionsForCurrentDevice()
{
  v2[5] = *MEMORY[0x263EF8340];
  if (AXDeviceIsAudioAccessory())
  {
    v0 = AXRDeviceRemoteActionsForMediaForCurrentDevice();
  }
  else
  {
    v2[0] = @"Home";
    v2[1] = @"AppSwitcher";
    v2[2] = @"NotificationCenter";
    v2[3] = @"ControlCenter";
    v2[4] = @"Siri";
    v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  }

  return v0;
}

id AXRDeviceRemoteActionsForMediaForCurrentDevice()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"MediaPlayPause";
  v2[1] = @"MediaPreviousTrack";
  v2[2] = @"MediaNextTrack";
  v2[3] = @"MediaVolumeUp";
  v2[4] = @"MediaVolumeDown";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];

  return v0;
}

id AXRDeviceRemoteActionsForSwitchControlForCurrentDevice()
{
  v2[7] = *MEMORY[0x263EF8340];
  v2[0] = @"SwitchControlCommandMovePrevious";
  v2[1] = @"SwitchControlCommandMoveNext";
  v2[2] = @"SwitchControlCommandSelect";
  v2[3] = @"SwitchControlCommandMenu";
  v2[4] = @"SwitchControlCommandStartScanning";
  v2[5] = @"SwitchControlCommandStopScanning";
  void v2[6] = @"SwitchControlCommandActivate";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:7];

  return v0;
}

id AXRDeviceRemoteActionsForVoiceOverForCurrentDevice()
{
  v2[11] = *MEMORY[0x263EF8340];
  v2[0] = @"VoiceOverCommandPreviousElement";
  v2[1] = @"VoiceOverCommandNextElement";
  v2[2] = @"VoiceOverCommandSimpleTap";
  v2[3] = @"VoiceOverCommandPreviousRotorOption";
  v2[4] = @"VoiceOverCommandNextRotorOption";
  v2[5] = @"VoiceOverCommandPreviousRotorItem";
  void v2[6] = @"VoiceOverCommandNextRotorItem";
  v2[7] = @"VoiceOverCommandScrollUpPage";
  void v2[8] = @"VoiceOverCommandScrollDownPage";
  v2[9] = @"VoiceOverCommandScrollLeftPage";
  v2[10] = @"VoiceOverCommandScrollRightPage";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:11];

  return v0;
}

id AXRDevicePreferredRemoteActionsForCurrentDevice()
{
  v2[3] = *MEMORY[0x263EF8340];
  if (AXDeviceIsAudioAccessory())
  {
    v2[0] = @"MediaPreviousTrack";
    v2[1] = @"MediaNextTrack";
    v2[2] = @"MediaPlayPause";
    v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:3];
  }
  else if (_AXSAssistiveTouchScannerEnabled())
  {
    v0 = AXRDeviceRemoteActionsForSwitchControlForCurrentDevice();
  }
  else if (_AXSVoiceOverTouchEnabled() && (AXDeviceIsTV() & 1) == 0)
  {
    v0 = AXRDeviceRemoteActionsForVoiceOverForCurrentDevice();
  }
  else
  {
    v0 = AXRDeviceRemoteActionsForCurrentDevice();
  }

  return v0;
}

id AXRDeviceRemoteActionsPayloadForCurrentDevice()
{
  v28[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFF980];
  v26[0] = @"title";
  v1 = AXRLocalizedStringForKey(@"REMOTE_ACTION_SECTION_SYSTEM");
  v27[0] = v1;
  v27[1] = &unk_26D7C5EF8;
  v26[1] = @"preferredContextType";
  v26[2] = @"actionsList";
  v2 = AXRDeviceRemoteActionsForCurrentDevice();
  v27[2] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  v28[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  v5 = [v0 arrayWithArray:v4];

  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    v24[0] = @"title";
    v6 = AXRLocalizedStringForKey(@"REMOTE_ACTION_SECTION_MEDIA_CONTROL");
    v25[0] = v6;
    v25[1] = &unk_26D7C5F10;
    v24[1] = @"preferredContextType";
    v24[2] = @"actionsList";
    v7 = AXRDeviceRemoteActionsForMediaForCurrentDevice();
    v25[2] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
    [v5 addObject:v8];

    if (_AXSAssistiveTouchScannerEnabled())
    {
      v22[0] = @"title";
      v9 = AXRLocalizedStringForKey(@"REMOTE_ACTION_SECTION_SWITCH_CONTROL");
      v23[0] = v9;
      v23[1] = &unk_26D7C5F28;
      v22[1] = @"preferredContextType";
      v22[2] = @"actionsList";
      v10 = AXRDeviceRemoteActionsForSwitchControlForCurrentDevice();
      v23[2] = v10;
      v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
      [v5 addObject:v11];
    }
    if (_AXSVoiceOverTouchEnabled())
    {
      v16 = @"title";
      v12 = AXRLocalizedStringForKey(@"REMOTE_ACTION_SECTION_VOICEOVER");
      v19 = v12;
      v20 = &unk_26D7C5F40;
      v17 = @"preferredContextType";
      v18 = @"actionsList";
      v13 = AXRDeviceRemoteActionsForVoiceOverForCurrentDevice();
      v21 = v13;
      v14 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v16 count:3];
      objc_msgSend(v5, "addObject:", v14, v16, v17, v18, v19, v20);
    }
  }

  return v5;
}

id AXRLocalizedStringForRemoteAction(void *a1)
{
  id v1 = a1;
  uint64_t Type = AXDeviceGetType();
  v3 = AXRLocalizedStringForRemoteActionWithDeviceType(v1, Type);

  return v3;
}

id AXRLocalizedStringForRemoteActionWithDeviceType(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([v3 isEqualToString:@"None"])
  {
    v4 = @"REMOTE_ACTION_NONE";
LABEL_63:
    AXRLocalizedStringForKeyWithDeviceType(v4, a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_64;
  }
  if ([v3 isEqualToString:@"Home"])
  {
    v4 = @"REMOTE_ACTION_HOME";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"AppSwitcher"])
  {
    v4 = @"REMOTE_ACTION_APP_SWITCHER";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"NotificationCenter"])
  {
    v4 = @"REMOTE_ACTION_NOTIFICATION_CENTER";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"ControlCenter"])
  {
    v4 = @"REMOTE_ACTION_CONTROL_CENTER";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"Siri"])
  {
    v4 = @"REMOTE_ACTION_SIRI";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"TVMenu"])
  {
    v4 = @"REMOTE_ACTION_TV_MENU";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"TVSelect"])
  {
    v4 = @"REMOTE_ACTION_TV_SELECT";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"SwitchControlCommandActivate"])
  {
    v4 = @"REMOTE_ACTION_SWITCH_CONTROL_ACTIVATE";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"SwitchControlCommandMenu"])
  {
    v4 = @"REMOTE_ACTION_SWITCH_CONTROL_MENU";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"SwitchControlCommandStartScanning"])
  {
    v4 = @"REMOTE_ACTION_SWITCH_CONTROL_START_SCANNING";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"SwitchControlCommandSelect"])
  {
    v4 = @"REMOTE_ACTION_SWITCH_CONTROL_SELECT";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"SwitchControlCommandMoveNext"])
  {
    v4 = @"REMOTE_ACTION_SWITCH_CONTROL_MOVE_NEXT";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"SwitchControlCommandMovePrevious"])
  {
    v4 = @"REMOTE_ACTION_SWITCH_CONTROL_MOVE_PREVIOUS";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"SwitchControlCommandStopScanning"])
  {
    v4 = @"REMOTE_ACTION_SWITCH_CONTROL_STOP_SCANNING";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandSimpleTap"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_SIMPLE_TAP";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandNextElement"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_NEXT_ELEMENT";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandPreviousElement"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_PREVIOUS_ELEMENT";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandNextRotorOption"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_NEXT_ROTOR_OPTION";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandPreviousRotorOption"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_PREVIOUS_ROTOR_OPTION";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandNextRotorItem"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_NEXT_ROTOR_ITEM";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandPreviousRotorItem"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_PREVIOUS_ROTOR_ITEM";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandScrollUpPage"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_UP";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandScrollDownPage"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_DOWN";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandScrollLeftPage"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_LEFT";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"VoiceOverCommandScrollRightPage"])
  {
    v4 = @"REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_RIGHT";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"MediaPlayPause"])
  {
    v4 = @"REMOTE_ACTION_MEDIA_PLAY_PAUSE";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"MediaNextTrack"])
  {
    v4 = @"REMOTE_ACTION_MEDIA_NEXT_TRACK";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"MediaPreviousTrack"])
  {
    v4 = @"REMOTE_ACTION_MEDIA_PREVIOUS_TRACK";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"MediaVolumeUp"])
  {
    v4 = @"REMOTE_ACTION_MEDIA_VOLUME_UP";
    goto LABEL_63;
  }
  if ([v3 isEqualToString:@"MediaVolumeDown"])
  {
    v4 = @"REMOTE_ACTION_MEDIA_VOLUME_DOWN";
    goto LABEL_63;
  }
  id v5 = v3;
LABEL_64:
  v6 = v5;

  return v6;
}

id AXRLocalizedSectionTitleForPreferredContextType(unint64_t a1)
{
  if (a1 > 3)
  {
    v2 = 0;
  }
  else
  {
    v2 = AXRLocalizedStringForKey(off_2646E8518[a1]);
  }
  return v2;
}

void sub_2249E3934(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_2249E3D68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2249E4408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2249E46B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ax_remote_general_log()
{
  if (ax_remote_general_log_onceToken != -1) {
    dispatch_once(&ax_remote_general_log_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)ax_remote_general_log___logger;

  return v0;
}

void __ax_remote_general_log_block_invoke()
{
  objc_msgSend(NSString, "stringWithFormat:", @"remote_%s", "general");
  id v2 = objc_claimAutoreleasedReturnValue();
  os_log_t v0 = os_log_create("com.apple.Accessibility", (const char *)[v2 UTF8String]);
  uint64_t v1 = (void *)ax_remote_general_log___logger;
  ax_remote_general_log___logger = (uint64_t)v0;
}

id ax_remote_connection_log()
{
  if (ax_remote_connection_log_onceToken != -1) {
    dispatch_once(&ax_remote_connection_log_onceToken, &__block_literal_global_5);
  }
  os_log_t v0 = (void *)ax_remote_connection_log___logger;

  return v0;
}

void __ax_remote_connection_log_block_invoke()
{
  objc_msgSend(NSString, "stringWithFormat:", @"remote_%s", "connection");
  id v2 = objc_claimAutoreleasedReturnValue();
  os_log_t v0 = os_log_create("com.apple.Accessibility", (const char *)[v2 UTF8String]);
  uint64_t v1 = (void *)ax_remote_connection_log___logger;
  ax_remote_connection_log___logger = (uint64_t)v0;
}

id ax_remote_daemon_log()
{
  if (ax_remote_daemon_log_onceToken != -1) {
    dispatch_once(&ax_remote_daemon_log_onceToken, &__block_literal_global_8);
  }
  os_log_t v0 = (void *)ax_remote_daemon_log___logger;

  return v0;
}

void __ax_remote_daemon_log_block_invoke()
{
  objc_msgSend(NSString, "stringWithFormat:", @"remote_%s", "daemon");
  id v2 = objc_claimAutoreleasedReturnValue();
  os_log_t v0 = os_log_create("com.apple.Accessibility", (const char *)[v2 UTF8String]);
  uint64_t v1 = (void *)ax_remote_daemon_log___logger;
  ax_remote_daemon_log___logger = (uint64_t)v0;
}

id ax_remote_event_log()
{
  if (ax_remote_event_log_onceToken != -1) {
    dispatch_once(&ax_remote_event_log_onceToken, &__block_literal_global_11);
  }
  os_log_t v0 = (void *)ax_remote_event_log___logger;

  return v0;
}

void __ax_remote_event_log_block_invoke()
{
  objc_msgSend(NSString, "stringWithFormat:", @"remote_%s", "event");
  id v2 = objc_claimAutoreleasedReturnValue();
  os_log_t v0 = os_log_create("com.apple.Accessibility", (const char *)[v2 UTF8String]);
  uint64_t v1 = (void *)ax_remote_event_log___logger;
  ax_remote_event_log___logger = (uint64_t)v0;
}

id _AXRBundle()
{
  if (_AXRBundle_onceToken != -1) {
    dispatch_once(&_AXRBundle_onceToken, &__block_literal_global_2);
  }
  os_log_t v0 = (void *)_AXRBundle__AXRBundle;

  return v0;
}

id AXRLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t Type = AXDeviceGetType();
  id v3 = AXRLocalizedStringForKeyWithDeviceType(v1, Type);

  return v3;
}

id AXRLocalizedStringForKeyWithDeviceType(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if ((unint64_t)(a2 - 1) <= 5)
  {
    id v5 = [v3 stringByAppendingString:off_2646E87A0[a2 - 1]];
    v6 = _AXRBundle();
    v7 = [v6 localizedStringForKey:v5 value:&stru_26D7C57B8 table:@"Localizable"];

    if (![v7 isEqualToString:v5]) {
      goto LABEL_5;
    }
  }
  id v5 = _AXRBundle();
  v7 = [v5 localizedStringForKey:v4 value:&stru_26D7C57B8 table:@"Localizable"];
LABEL_5:

  return v7;
}

void sub_2249E5348(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x270F091A0]();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x270F091C0]();
}

uint64_t AXDeviceIsTV()
{
  return MEMORY[0x270F09208]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x270F09570]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}