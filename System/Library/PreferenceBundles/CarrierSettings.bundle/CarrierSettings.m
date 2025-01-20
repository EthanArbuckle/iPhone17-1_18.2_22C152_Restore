id PHPreferencesGetValue(void *a1)
{
  return PHPreferencesGetValueInDomain(a1, 0);
}

id PHPreferencesGetValueInDomain(void *a1, void *a2)
{
  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v4 = [v5 bundleIdentifier];
  }
  if ([(__CFString *)v3 length] && [(__CFString *)v4 length]) {
    v6 = (void *)CFPreferencesCopyValue(v3, v4, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  }
  else {
    v6 = 0;
  }

  return v6;
}

void PHPreferencesSetValue(void *a1, void *a2)
{
}

void PHPreferencesSetValueInDomain(void *a1, void *a2, void *a3)
{
  key = a1;
  id v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v7 bundleIdentifier];
  }
  if ([(__CFString *)key length] && [(__CFString *)v6 length])
  {
    CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE68];
    CFPreferencesSetValue(key, v5, v6, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    CFPreferencesSynchronize(v6, v8, v9);
  }
}

id PHDefaultLog()
{
  if (PHDefaultLog_onceToken != -1) {
    dispatch_once(&PHDefaultLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)PHDefaultLog_PHDefaultLog;

  return v0;
}

uint64_t __PHDefaultLog_block_invoke()
{
  PHDefaultLog_PHDefaultLog = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  return MEMORY[0x270F9A758]();
}

id PHOversizedLog()
{
  if (PHOversizedLog_onceToken != -1) {
    dispatch_once(&PHOversizedLog_onceToken, &__block_literal_global_44);
  }
  v0 = (void *)PHOversizedLog_PHOversizedLog;

  return v0;
}

uint64_t __PHOversizedLog_block_invoke()
{
  PHOversizedLog_PHOversizedLog = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  return MEMORY[0x270F9A758]();
}

id PHOversizedLogQueue()
{
  if (PHOversizedLogQueue_onceToken != -1) {
    dispatch_once(&PHOversizedLogQueue_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)PHOversizedLogQueue_PHOversizedLogQueue;

  return v0;
}

void __PHOversizedLogQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v2);
  v1 = (void *)PHOversizedLogQueue_PHOversizedLogQueue;
  PHOversizedLogQueue_PHOversizedLogQueue = (uint64_t)v0;
}

void SettingRequestCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  int v10 = [v8 isEqualToString:*MEMORY[0x263F033D8]];
  v11 = [v9 objectForKey:*MEMORY[0x263F033F0]];
  uint64_t v12 = *MEMORY[0x263F033F8];
  if ([v11 isEqual:*MEMORY[0x263F033F8]])
  {
    id v13 = [v9 objectForKey:*MEMORY[0x263F03338]];
  }
  else
  {
    id v13 = v11;
  }
  v14 = v13;
  v15 = [v7 pendingRequestForUniqueSettingType:v13];
  if (v15)
  {
    v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2112;
      v23 = v15;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_22C120000, v16, OS_LOG_TYPE_DEFAULT, "Request %@ completed with status %@ and response %@", (uint8_t *)&v20, 0x20u);
    }

    [v7 receivedRequestResponseForUniqueSettingType:v14];
    if ([v11 isEqualToString:v12])
    {
      if (v10) {
        id v17 = v9;
      }
      else {
        id v17 = 0;
      }
      [v7 _handleCallForwardingSettings:v17 didAttemptToSet:0 forwardingReason:v14];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F03400]])
    {
      if (v10) {
        id v18 = v9;
      }
      else {
        id v18 = 0;
      }
      [v7 _handleCallWaitingSettings:v18];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F03408]])
    {
      [v7 _handleCallerIDSettings:v9];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F03418]])
    {
      if (v10) {
        id v19 = v9;
      }
      else {
        id v19 = 0;
      }
      [v7 _handleSIMLockSettings:v19];
    }
  }
}

void SettingSaveCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "SettingSaveCallback: %@: %@", (uint8_t *)&v22, 0x16u);
  }

  int v11 = [v8 isEqualToString:*MEMORY[0x263F033E8]];
  uint64_t v12 = [v9 objectForKey:*MEMORY[0x263F033F0]];
  uint64_t v13 = *MEMORY[0x263F033F8];
  if ([v12 isEqualToString:*MEMORY[0x263F033F8]])
  {
    id v14 = [v9 objectForKey:*MEMORY[0x263F03338]];
  }
  else
  {
    id v14 = v12;
  }
  v15 = v14;
  v16 = [v7 pendingSaveForUniqueSettingType:v14];
  if (v16)
  {
    [v7 receivedSaveResponseForUniqueSettingType:v15];
    if ([v12 isEqualToString:v13])
    {
      if (v11) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
      [v7 _handleCallForwardingSettings:v17 didAttemptToSet:1 forwardingReason:v15];
    }
    else if ([v12 isEqualToString:*MEMORY[0x263F03400]])
    {
      if (v11) {
        id v18 = v16;
      }
      else {
        id v18 = 0;
      }
      [v7 _handleCallWaitingSettings:v18];
    }
    else if ([v12 isEqualToString:*MEMORY[0x263F03408]])
    {
      if (v11) {
        id v19 = v16;
      }
      else {
        id v19 = 0;
      }
      [v7 _handleCallerIDSettings:v19];
    }
    else if ([v12 isEqualToString:*MEMORY[0x263F03418]])
    {
      if (v11) {
        int v20 = v16;
      }
      else {
        int v20 = 0;
      }
      [v7 _handleSIMLockSettings:v20];
    }
    else if ([v12 isEqualToString:*MEMORY[0x263F03410]])
    {
      if (v11) {
        id v21 = v16;
      }
      else {
        id v21 = 0;
      }
      [v7 _handlePINSettings:v21];
    }
  }
  else if (([v12 isEqualToString:v13] & 1) == 0 {
         && ([v12 isEqualToString:*MEMORY[0x263F03418]] & 1) == 0)
  }
  {
    [v12 isEqualToString:*MEMORY[0x263F03410]];
  }
}

void SettingChangedCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "SettingChangedCallback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  int v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F033F0]];
  if ([v11 isEqualToString:*MEMORY[0x263F03408]]) {
    [v7 _handleCallerIDChanged];
  }
}

void NetworkListCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "NetworkListCallback: %@: %@", (uint8_t *)&v13, 0x16u);
  }

  if ([v8 isEqualToString:*MEMORY[0x263F02F58]])
  {
    [v7 _handleNetworkList:0];
  }
  else
  {
    int v11 = [v9 objectForKey:*MEMORY[0x263F02F40]];
    if (v11)
    {
      [v7 _handleNetworkList:v11];
    }
    else
    {
      int v12 = [MEMORY[0x263EFF8C0] array];
      [v7 _handleNetworkList:v12];
    }
  }
}

void OperatorNameChangeCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = a2;
  int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "OperatorNameChangeCallback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  int v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"SettingsTelephonyOperatorNameChangedNotification" object:v9];
}

void RadioModuleOffErrorCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = a2;
  int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "RadioModuleOffErrorCallback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  int v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"SettingsTelephonyRadioModuleOffErrorNotification" object:v9];
}

void SIMStatusChangedCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  int v10 = [v7 simLocked:0];
  int v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    _os_log_impl(&dword_22C120000, v11, OS_LOG_TYPE_DEFAULT, "SIMStatusChangedCallback: name: %@ userInfo: %@ currentSimLockedValue: %u", (uint8_t *)&v13, 0x1Cu);
  }

  if (v10)
  {
    if ([v8 isEqualToString:*MEMORY[0x263F03040]]) {
      [v7 _handleSIMLockSettings:0];
    }
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F03050]])
  {
    int v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F03048]];
    if ([v12 isEqualToString:*MEMORY[0x263F03078]])
    {
      [v7 _simRemoved];
LABEL_12:
      [v7 _invalidateSIMLockedSetting];
LABEL_15:

      goto LABEL_16;
    }
    if (![v12 isEqualToString:*MEMORY[0x263F030B8]])
    {
      if ([v12 isEqualToString:*MEMORY[0x263F030A8]])
      {
        [v7 _simPUKLocked];
        goto LABEL_12;
      }
      if (![v12 isEqualToString:*MEMORY[0x263F030A0]]) {
        goto LABEL_15;
      }
    }
    [v7 _invalidateSIMLockedSetting];
    [v7 simLocked:1];
    goto LABEL_15;
  }
LABEL_16:
}

void CustomerServiceProfileUpdated(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  int v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_22C120000, v10, OS_LOG_TYPE_DEFAULT, "CustomerServiceProfileUpdated: %@: %@", (uint8_t *)&v13, 0x16u);
  }

  int v11 = [v9 objectForKey:*MEMORY[0x263F02F68]];
  int v12 = (void *)*MEMORY[0x263EFFB38];

  if (v11 == v12) {
    [v7 _networkSettingsDisabled];
  }
}

void SIMPhoneBookCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a5;
  if ((id)*MEMORY[0x263F02E90] == v7)
  {
    [v9 _phoneBookSelected];
  }
  else if ((id)*MEMORY[0x263F02E88] == v7)
  {
    [v9 _phoneNumberSaveFinishedWithSuccess:0];
  }
  else if ((id)*MEMORY[0x263F02E98] == v7)
  {
    [v9 _phoneNumberWritten];
  }
  else if ((id)*MEMORY[0x263F033C8] == v7)
  {
    [v9 _phoneNumberChanged];
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_22C126BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x270F0CD98]();
}

uint64_t CTRegistrationAutomaticallySelectNetwork()
{
  return MEMORY[0x270EE8690]();
}

uint64_t CTRegistrationCopyLocalizedOperatorName()
{
  return MEMORY[0x270EE86A0]();
}

uint64_t CTRegistrationCopyManualNetworkSelection()
{
  return MEMORY[0x270EE86A8]();
}

uint64_t CTRegistrationGetNetworkSelectionMode()
{
  return MEMORY[0x270EE86B8]();
}

uint64_t CTRegistrationGetNetworkSelectionState()
{
  return MEMORY[0x270EE86C0]();
}

uint64_t CTRegistrationGetStatus()
{
  return MEMORY[0x270EE86C8]();
}

uint64_t CTRegistrationManuallySelectNetwork()
{
  return MEMORY[0x270EE86D0]();
}

uint64_t CTRegistrationNetworkSelectionMenuAvailable()
{
  return MEMORY[0x270EE86D8]();
}

uint64_t CTRegistrationRequestNetworkList()
{
  return MEMORY[0x270EE86E0]();
}

uint64_t CTSIMSupportGetRemainingPINAttempts()
{
  return MEMORY[0x270EE86E8]();
}

uint64_t CTSIMSupportGetSIMStatus()
{
  return MEMORY[0x270EE86F0]();
}

uint64_t CTSettingCopyMyPhoneNumber()
{
  return MEMORY[0x270EE8700]();
}

uint64_t CTSettingRequest()
{
  return MEMORY[0x270EE8708]();
}

uint64_t CTSettingSave()
{
  return MEMORY[0x270EE8710]();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return MEMORY[0x270EE8728]();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return MEMORY[0x270EE8730]();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return MEMORY[0x270EE8738]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x270F0CDF0]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x270F0CDF8]();
}

uint64_t UIFormattedPhoneNumberFromStringWithCountry()
{
  return MEMORY[0x270F06010]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x270F062B0]();
}

uint64_t _CTServerConnectionCopyManualNetworkSelection()
{
  return MEMORY[0x270EE8780]();
}

uint64_t _CTServerConnectionCopyMobileEquipmentInfo()
{
  return MEMORY[0x270EE8788]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

uint64_t _CTServerConnectionCreateOnRunLoop()
{
  return MEMORY[0x270EE87B8]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionFetchNetworkList()
{
  return MEMORY[0x270EE87F8]();
}

uint64_t _CTServerConnectionGetNetworkSelectionState()
{
  return MEMORY[0x270EE8828]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x270EE8860]();
}

uint64_t _CTServerConnectionSavePhonebookEntry()
{
  return MEMORY[0x270EE8870]();
}

uint64_t _CTServerConnectionSelectNetwork()
{
  return MEMORY[0x270EE8878]();
}

uint64_t _CTServerConnectionSelectPhonebook()
{
  return MEMORY[0x270EE8880]();
}

uint64_t _CTServerConnectionUnregisterForAllNotifications()
{
  return MEMORY[0x270EE88C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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