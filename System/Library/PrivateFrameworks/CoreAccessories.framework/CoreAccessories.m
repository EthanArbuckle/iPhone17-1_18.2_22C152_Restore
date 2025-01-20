void sub_1B3C235F0(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 128));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t accessoryServer_isServerAvailableForServiceEntry(unsigned int a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1 > 1) {
    return 0;
  }
  pthread_rwlock_rdlock(&_gServerAvailableTokenLock);
  if (_gServerAvailableToken[a1] == -1)
  {
    v3 = (const char *)_gNotificationName[a1];
    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v6 = *(NSObject **)gLogObjects;
      }
      else
      {
        v6 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (const char *)_gNotificationName[a1];
        *(void *)&state64[4] = "accessoryServer_isServerAvailableForServiceEntry";
        *(_DWORD *)state64 = 136315650;
        if (!v7) {
          v7 = "null";
        }
        __int16 v10 = 1024;
        unsigned int v11 = a1;
        __int16 v12 = 2080;
        v13 = v7;
        _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "%s cannot get server state (%d, %s)", state64, 0x1Cu);
      }
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    int out_token = -1431655766;
    *(void *)state64 = 0xAAAAAAAAAAAAAAAALL;
    notify_register_check(v3, &out_token);
    notify_get_state(out_token, (uint64_t *)state64);
    notify_cancel(out_token);
    BOOL v2 = *(void *)state64 == 0;
  }
  else
  {
    BOOL v2 = _gServerAvailable[a1] == 0;
  }
  uint64_t v4 = !v2;
LABEL_9:
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  return v4;
}

uint64_t accessoryServer_registerAvailabilityChangedHandlerForServiceEntry(const char *a1, const void *a2, unsigned int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
  }
  else
  {
    v7 = *(NSObject **)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "null";
    if (a1) {
      v8 = a1;
    }
    v11[0] = 67109378;
    v11[1] = a3;
    __int16 v12 = 2080;
    v13 = v8;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "Register AvailabilityChangedHandler (%d, %s)", (uint8_t *)v11, 0x12u);
  }
  uint64_t result = 0;
  if (a2 && a1 && a3 <= 1)
  {
    pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
    _gNotificationName[a3] = a1;
    if (*((void *)&_gServerAvailabilityChangedHandler + a3))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        __int16 v10 = *(NSObject **)gLogObjects;
      }
      else
      {
        __int16 v10 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_1((const char **)&_gNotificationName[a3], a3, v10);
      }
      _Block_release(*((const void **)&_gServerAvailabilityChangedHandler + a3));
    }
    *((void *)&_gServerAvailabilityChangedHandler + a3) = _Block_copy(a2);
    pthread_rwlock_unlock(&_gServerAvailableTokenLock);
    return _SetupAvailabilityChangedHandlerForServiceEntry(a3);
  }
  return result;
}

uint64_t _SetupAvailabilityChangedHandlerForServiceEntry(unsigned int a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    v3 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
  }
  else
  {
    v3 = *(NSObject **)gLogObjects;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
    __int16 v17 = 1024;
    unsigned int v18 = a1;
    _os_log_impl(&dword_1B3C21000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d)", buf, 0x12u);
  }
  if (a1 > 1) {
    return 0;
  }
  pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v4 = *(NSObject **)gLogObjects;
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
  }
  uint64_t v5 = a1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = (const char *)_gNotificationName[a1];
    *(void *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
    *(_DWORD *)buf = 136315650;
    if (!v6) {
      BOOL v6 = "null";
    }
    __int16 v17 = 1024;
    unsigned int v18 = a1;
    __int16 v19 = 2080;
    v20 = v6;
    _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_INFO, "%s (%d, %s)", buf, 0x1Cu);
  }
  v7 = (const char *)_gNotificationName[a1];
  if (v7 && *((void *)&_gServerAvailabilityChangedHandler + a1))
  {
    v8 = &_gServerAvailableToken[a1];
    if (*v8 == -1
      || (notify_cancel(*v8),
          _gServerAvailableToken[a1] = -1,
          pthread_rwlock_unlock(&_gServerAvailableTokenLock),
          usleep(0x186A0u),
          pthread_rwlock_wrlock(&_gServerAvailableTokenLock),
          (v7 = (const char *)_gNotificationName[a1]) != 0)
      && *v8 == -1)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 0x40000000;
      handler[2] = ___SetupAvailabilityChangedHandlerForServiceEntry_block_invoke;
      handler[3] = &__block_descriptor_tmp_1;
      char v15 = a1;
      if (notify_register_dispatch(v7, &_gServerAvailableToken[a1], MEMORY[0x1E4F14428], handler))
      {
        _Block_release(*((const void **)&_gServerAvailabilityChangedHandler + a1));
        uint64_t v10 = 0;
        *((void *)&_gServerAvailabilityChangedHandler + v5) = 0;
        _gNotificationName[v5] = 0;
      }
      else
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        notify_get_state(_gServerAvailableToken[a1], (uint64_t *)buf);
        _gServerAvailable[a1] = *(void *)buf != 0;
        uint64_t v10 = 1;
      }
      goto LABEL_38;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(NSObject **)gLogObjects;
    }
    else
    {
      v9 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = (const char *)_gNotificationName[a1];
      int v12 = _gServerAvailableToken[a1];
      *(_DWORD *)buf = 136315906;
      if (!v11) {
        unsigned int v11 = "null";
      }
      *(void *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
      __int16 v17 = 1024;
      unsigned int v18 = a1;
      __int16 v19 = 2080;
      v20 = v11;
      __int16 v21 = 1024;
      BOOL v22 = v12 != -1;
      _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_INFO, "%s did not register for notification (%d, %s), token (%d)", buf, 0x22u);
    }
  }
  uint64_t v10 = 0;
LABEL_38:
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  return v10;
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 9, (uint64_t)_kLoggingModuleEntries);

  init_logging_signposts();
}

uint64_t accessoryServer_registerAvailabilityChangedHandler(const char *a1, const void *a2)
{
  return accessoryServer_registerAvailabilityChangedHandlerForServiceEntry(a1, a2, 0);
}

uint64_t accessoryServer_isServerAvailable()
{
  return accessoryServer_isServerAvailableForServiceEntry(0);
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v2 = &OBJC_INSTANCE_METHODS_ACCUserDefaults;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    BOOL v6 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          __int16 v14 = 2080;
          char v15 = v9;
          _os_log_debug_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        char v15 = v9;
        _os_log_error_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    BOOL v2 = &OBJC_INSTANCE_METHODS_ACCUserDefaults;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[75];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v2 = &OBJC_INSTANCE_METHODS_ACCUserDefaults;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    BOOL v6 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          __int16 v14 = 2080;
          char v15 = v9;
          _os_log_debug_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        char v15 = v9;
        _os_log_error_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    BOOL v2 = &OBJC_INSTANCE_METHODS_ACCUserDefaults;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[75];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

void sub_1B3C24B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id acc_strings_bundle()
{
  v0 = (void *)acc_strings_bundle_bundle;
  if (!acc_strings_bundle_bundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreAccessories"];
    BOOL v2 = (void *)acc_strings_bundle_bundle;
    acc_strings_bundle_bundle = v1;

    v0 = (void *)acc_strings_bundle_bundle;
  }

  return v0;
}

id acc_strings_placeholder_Unknown()
{
  v0 = acc_strings_bundle();
  uint64_t v1 = [v0 localizedStringForKey:@"Unknown" value:&stru_1F0C6F1D8 table:0];

  return v1;
}

CFBundleRef acc_strings_bundleCF()
{
  CFBundleRef result = (CFBundleRef)acc_strings_bundleCF_bundle;
  if (!acc_strings_bundleCF_bundle)
  {
    CFBundleRef result = CFBundleGetBundleWithIdentifier(@"com.apple.CoreAccessories");
    acc_strings_bundleCF_bundle = (uint64_t)result;
  }
  return result;
}

uint64_t acc_strings_copyPlaceholder_Unknown()
{
  return objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t acc_policies_shouldHideAccessoryWithModelNumber(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ACCUserDefaults sharedDefaults];
  int v3 = [v2 BOOLForKey:@"ShowHiddenAccessories"];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    if (acc_policies_shouldHideAccessoryWithModelNumber_onceToken != -1) {
      dispatch_once(&acc_policies_shouldHideAccessoryWithModelNumber_onceToken, &__block_literal_global);
    }
    uint64_t v4 = [(id)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers containsObject:a1];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = "NO";
    if (v4) {
      BOOL v6 = "YES";
    }
    else {
      BOOL v6 = "NO";
    }
    if (v3) {
      int v5 = "YES";
    }
    int v8 = 136315394;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    unint64_t v11 = v5;
    _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "shouldHideAccessory: %s, showHiddenAccessories: %s", (uint8_t *)&v8, 0x16u);
  }
  return v4;
}

void __acc_policies_shouldHideAccessoryWithModelNumber_block_invoke()
{
  v0 = (void *)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_1F0C75928;
}

BOOL acc_policies_endpointRequiresUserAuthorization(uint64_t a1)
{
  return !a1 || !*(void *)a1 || *(_DWORD *)(*(void *)a1 + 8) != 2;
}

uint64_t acc_policies_shouldOverrideNameOnAccessoryWithModelNumber(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken != -1) {
    dispatch_once(&acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken, &__block_literal_global_74);
  }
  uint64_t v2 = [(id)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers containsObject:a1];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v3 = "NO";
    if (v2) {
      int v3 = "YES";
    }
    int v5 = 136315138;
    BOOL v6 = v3;
    _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "shouldOverrideName: %s", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

void __acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_block_invoke()
{
  v0 = (void *)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_1F0C75940;
}

BOOL acc_policies_isTransportSupervised(unsigned int a1, int a2)
{
  BOOL v2 = ((1 << a1) & 0x1C3) != 0 && a2 == 1;
  return a1 <= 8 && v2;
}

uint64_t acc_policies_shouldResetLightningBusWhenTransportIsNoLongerRestricted(unsigned int a1, int a2)
{
  if ((a2 - 3) < 0xFFFFFFFE) {
    return (a1 < 9) & (0x1C3u >> a1);
  }
  else {
    return 0;
  }
}

BOOL acc_policies_endpointRequiresChargingCurrentLimit(uint64_t a1, int a2, int a3, unsigned int a4, unsigned int a5, _WORD *a6)
{
  v87[6] = *MEMORY[0x1E4F143B8];
  v85[0] = @"nameMatch";
  v85[1] = @"modelContain";
  v86[0] = @"IntelliLink";
  v86[1] = @"1.0";
  v85[2] = @"overrideCurrentLimit";
  v86[2] = &unk_1F0C75958;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:3];
  v87[0] = v6;
  v83[0] = @"nameMatch";
  v83[1] = @"modelContain";
  v84[0] = @"MyLink";
  v84[1] = @"1.0";
  v83[2] = @"overrideCurrentLimit";
  v84[2] = &unk_1F0C75958;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
  v87[1] = v7;
  v81[0] = @"nameMatch";
  v81[1] = @"manufacturerMatch";
  v82[0] = @"iPL24Z";
  v82[1] = @"SDI Technologies";
  v81[2] = @"overrideCurrentLimit";
  v82[2] = &unk_1F0C75958;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v87[2] = v8;
  v79[0] = @"modelMatch";
  v79[1] = @"manufacturerMatch";
  v80[0] = @"MIB2";
  v80[1] = @"HARMAN";
  v79[2] = @"overrideCurrentLimit";
  v80[2] = &unk_1F0C75970;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v87[3] = v9;
  v77[0] = @"modelMatch";
  v77[1] = @"manufacturerMatch";
  v78[0] = @"Range Rover Velar";
  v78[1] = @"Land Rover";
  v77[2] = @"overrideCurrentLimit";
  v78[2] = &unk_1F0C75958;
  __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];
  v87[4] = v10;
  v75[0] = @"modelMatch";
  v75[1] = @"manufacturerMatch";
  v76[0] = @"Jaguar I-PACE";
  v76[1] = @"Jaguar";
  v75[2] = @"overrideCurrentLimit";
  v76[2] = &unk_1F0C75958;
  unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  v87[5] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:6];

  unsigned __int16 v13 = acc_userDefaultsIapd_copyIntegerForKey(@"ChargingPowerOverride");
  int v14 = acc_userDefaultsIapd_copyIntegerForKey(@"ChargingPowerBehavior");
  int v15 = acc_userDefaultsIapd_copyIntegerForKey(@"ChargingPowerBehavior");
  if (v15 <= 0) {
    int v16 = a5;
  }
  else {
    int v16 = v15;
  }
  if ((v14 - 3) < 6)
  {
    int v17 = 10 * v14 - 5;
    unsigned int v18 = a4;
LABEL_7:
    int v19 = 1;
    goto LABEL_8;
  }
  int v17 = 45;
  unsigned int v18 = a4;
  if (v14 != 1) {
    goto LABEL_7;
  }
  int v19 = 0;
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110656;
    int v62 = a2;
    __int16 v63 = 1024;
    int v64 = a3;
    __int16 v65 = 1024;
    unsigned int v66 = v19;
    __int16 v67 = 1024;
    unsigned int v68 = v13;
    __int16 v69 = 1024;
    unsigned int v70 = v18;
    __int16 v71 = 1024;
    int v72 = v14;
    __int16 v73 = 1024;
    int v74 = v17;
    _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d checkChargingCurrentLimit=%d chargingCurrentLimit=%d inLimit=%d behavior=%d batteryThreshold=%d", buf, 0x2Cu);
  }
  if (!v19) {
    goto LABEL_66;
  }
  v55 = 0;
  unsigned int v20 = v13;
  BOOL v21 = v13 < v18 && v13 != 0;
  if (a1 && !v21)
  {
    BOOL v22 = *(CFTypeRef **)(a1 + 64);
    if (v22)
    {
      if (*v22) {
        v55 = (void *)CFRetain(*v22);
      }
      else {
        v55 = 0;
      }
      uint64_t v23 = *(const void **)(*(void *)(a1 + 64) + 16);
      if (v23) {
        v54 = (void *)CFRetain(v23);
      }
      else {
        v54 = 0;
      }
      v24 = *(const void **)(*(void *)(a1 + 64) + 8);
      if (v24) {
        v53 = (void *)CFRetain(v24);
      }
      else {
        v53 = 0;
      }
      if (v55 && v54)
      {
        int v45 = v17;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id obj = v12;
        uint64_t v25 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          LODWORD(v44) = v13;
          HIDWORD(v44) = v16;
          uint64_t v27 = *(void *)v57;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v57 != v27) {
                objc_enumerationMutation(obj);
              }
              v29 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              v30 = objc_msgSend(v29, "objectForKey:", @"nameMatch", v44);
              v31 = [v29 objectForKey:@"nameContain"];
              BOOL v32 = _matchOrContainString(v55, v30, v31);

              v33 = [v29 objectForKey:@"modelMatch"];
              v34 = [v29 objectForKey:@"modelContain"];
              BOOL v35 = _matchOrContainString(v54, v33, v34);

              v36 = [v29 objectForKey:@"manufacturerMatch"];
              v37 = [v29 objectForKey:@"manufacturerContain"];
              BOOL v38 = _matchOrContainString(v53, v36, v37);

              if (v32 && v35 && v38)
              {
                v39 = [v29 objectForKey:@"overrideCurrentLimit"];
                unsigned int v20 = (unsigned __int16)[v39 intValue];

                unsigned int v18 = a4;
                int v16 = HIDWORD(v44);
                goto LABEL_40;
              }
            }
            uint64_t v26 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
            if (v26) {
              continue;
            }
            break;
          }
          unsigned int v18 = a4;
          unsigned int v20 = v44;
          int v16 = HIDWORD(v44);
        }
LABEL_40:

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67110400;
          int v62 = a2;
          __int16 v63 = 1024;
          int v64 = a3;
          __int16 v65 = 1024;
          unsigned int v66 = v20;
          __int16 v67 = 1024;
          unsigned int v68 = v18;
          __int16 v69 = 1024;
          unsigned int v70 = v16;
          __int16 v71 = 1024;
          int v72 = v45;
          _os_log_debug_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d chargingCurrentLimit=%d inLimit=%d battery=%d threshold=%d", buf, 0x26u);
        }
        if (a3 != 3 && v16 >= v45 && (a2 & 1) == 0 && (v18 > 0x5DC || v20 >= 0x5DD) && v20 - 1501 < 0xFFFFFA24) {
          unsigned int v20 = 1500;
        }
        if (v20) {
          BOOL v40 = v20 >= v18;
        }
        else {
          BOOL v40 = 1;
        }
        BOOL v21 = !v40;
        goto LABEL_55;
      }
LABEL_67:
      BOOL v21 = 0;
      BOOL v41 = a6 != 0;
      goto LABEL_58;
    }
LABEL_66:
    v54 = 0;
    v55 = 0;
    v53 = 0;
    goto LABEL_67;
  }
  v53 = 0;
  v54 = 0;
LABEL_55:
  BOOL v41 = a6 != 0;
  if (a6 && v21)
  {
    *a6 = v20;
    BOOL v41 = 1;
    BOOL v21 = 1;
  }
LABEL_58:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if (v41) {
      int v42 = (unsigned __int16)*a6;
    }
    else {
      int v42 = -1;
    }
    *(_DWORD *)buf = 67110656;
    int v62 = a2;
    __int16 v63 = 1024;
    int v64 = a3;
    __int16 v65 = 1024;
    unsigned int v66 = a5;
    __int16 v67 = 1024;
    unsigned int v68 = v16;
    __int16 v69 = 1024;
    unsigned int v70 = v18;
    __int16 v71 = 1024;
    int v72 = v42;
    __int16 v73 = 1024;
    int v74 = v21;
    _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d, deviceType=%d, batt=%d(%d), %d->%d, return %d", buf, 0x2Cu);
  }

  return v21;
}

BOOL _matchOrContainString(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  unint64_t v6 = a2;
  unint64_t v7 = a3;
  int v8 = (void *)v7;
  BOOL v9 = (v6 | v7) == 0;
  if (v5)
  {
    if (v6)
    {
      uint64_t v10 = [v5 isEqualToString:v6];
LABEL_6:
      BOOL v9 = v10;
      goto LABEL_7;
    }
    if (v7)
    {
      uint64_t v10 = [v5 containsString:v7];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v9;
}

BOOL acc_policies_shouldFailAuthOnOOBPairingFailure(BOOL result)
{
  if (result) {
    return *(_DWORD *)(result + 24) == 9;
  }
  return result;
}

uint64_t acc_policies_allowACCAuthProtocolOnAllTransport()
{
  v0 = +[ACCUserDefaults sharedDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"AllowACCAuthProtocolOnAllTransport"];

  return v1;
}

uint64_t acc_policies_allowACCAuthProtocolOnTransport(int a1)
{
  BOOL v2 = +[ACCUserDefaults sharedDefaults];
  char v3 = [v2 BOOLForKey:@"EnableACCAuthProtocolOnNFC"];

  uint64_t v4 = +[ACCUserDefaults sharedDefaults];
  int v5 = [v4 BOOLForKey:@"DisableACCAuthProtocolOnInductive"];

  unint64_t v6 = +[ACCUserDefaults sharedDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"AllowACCAuthProtocolOnAllTransport"];

  if (a1 == 13 && (v3 & 1) != 0) {
    return 1;
  }
  int v9 = v5 ^ 1;
  if (a1 != 12) {
    int v9 = 0;
  }
  return v9 | v7;
}

uint64_t acc_policies_productTypeNeedsPreArmDeviceIdentity(const __CFString *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    if (v2 == CFStringGetTypeID())
    {
      BOOL v3 = CFEqual(a1, @"iPhone13,1")
        || CFEqual(a1, @"iPhone13,2")
        || CFEqual(a1, @"iPhone13,3")
        || CFEqual(a1, @"iPhone13,4");
      acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm = v3;
    }
  }
  return acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm;
}

uint64_t acc_policies_deviceNeedsPreArmDeviceIdentity()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    uint64_t v18 = 0;
    int v16 = 0;
  }
  else
  {
    v0 = +[ACCUserDefaults sharedDefaults];
    uint64_t v1 = [v0 stringForKey:@"DeviceIdentityPreArmDateOverride"];

    if (v1)
    {
      id v2 = v1;
      BOOL v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate", (uint8_t *)&v21, 2u);
      }
      uint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      int v5 = [v2 stringByTrimmingCharactersInSet:v4];

      unint64_t v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      unsigned int v7 = [v5 componentsSeparatedByCharactersInSet:v6];

      unint64_t v8 = [v7 count];
      BOOL v9 = v8 > 2;
      if (v8 < 3)
      {
        id v14 = 0;
      }
      else
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        unint64_t v11 = [v7 objectAtIndexedSubscript:2];
        objc_msgSend(v10, "setDay:", objc_msgSend(v11, "integerValue"));

        uint64_t v12 = [v7 objectAtIndexedSubscript:1];
        objc_msgSend(v10, "setMonth:", objc_msgSend(v12, "integerValue"));

        unsigned __int16 v13 = [v7 objectAtIndexedSubscript:0];
        objc_msgSend(v10, "setYear:", objc_msgSend(v13, "integerValue"));

        id v14 = [v3 dateFromComponents:v10];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          id v22 = v14;
          _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    else
    {
      id v14 = 0;
      BOOL v9 = 0;
    }
    id v15 = v14;
    int v16 = v15;
    if (v9 && v15)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: override", (uint8_t *)&v21, 2u);
      }
      objc_storeStrong((id *)&acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, v14);
      int v17 = +[ACCUserDefaults sharedDefaults];
      [v17 setObject:acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate forKey:@"PreArmDeviceIdentityDate"];
    }
    uint64_t v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate) {
      goto LABEL_19;
    }
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken != -1) {
      dispatch_once(&acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken, &__block_literal_global_156);
    }
    uint64_t v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
LABEL_19:
      int v19 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v18 = [(id)v18 compare:v19] == -1;
    }
  }

  return v18;
}

void __acc_policies_deviceNeedsPreArmDeviceIdentity_block_invoke()
{
  v0 = +[ACCUserDefaults sharedDefaults];
  acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed = [v0 BOOLForKey:@"DidPreArmDeviceIdentity"];

  if (!acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    uint64_t v1 = +[ACCUserDefaults sharedDefaults];
    uint64_t v2 = [v1 objectForKey:@"PreArmDeviceIdentityDate"];
    BOOL v3 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v2;

    if (!acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
      id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v4 setDay:1];
      [v4 setMonth:3];
      [v4 setYear:2021];
      int v5 = [v13 dateFromComponents:v4];
      id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v6 setDay:1];
      [v6 setMonth:9];
      [v6 setYear:2021];
      unsigned int v7 = [v13 dateFromComponents:v6];
      unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v7];
      [v8 duration];
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v5 sinceDate:(double)(int)(arc4random() % (int)v9)];
      unint64_t v11 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
      acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v10;

      uint64_t v12 = +[ACCUserDefaults sharedDefaults];
      [v12 setObject:acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate forKey:@"PreArmDeviceIdentityDate"];
    }
  }
}

void acc_policies_deviceDidPreArmDeviceIdentity()
{
  id v0 = +[ACCUserDefaults sharedDefaults];
  [v0 setBool:1 forKey:@"DidPreArmDeviceIdentity"];
}

BOOL acc_policies_allowAudioProductCertsOnTransport(int a1)
{
  return (a1 & 0xFFFFFFFE) == 2;
}

uint64_t acc_policies_supportInductivePowerTX(int a1, unsigned int a2)
{
  if (a1 == 2) {
    unsigned int v2 = 1;
  }
  else {
    unsigned int v2 = a2;
  }
  if (a1 == 3) {
    unsigned int v2 = a2;
  }
  if (a1 == 1) {
    return 0;
  }
  else {
    return v2;
  }
}

CFDataRef acc_policies_nfcTagUseKeys(const __CFData *result)
{
  if (result)
  {
    CFDataRef v1 = result;
    CFBundleRef result = (const __CFData *)CFDataGetLength(result);
    if (result) {
      return (const __CFData *)(*CFDataGetBytePtr(v1) - 87 < 2);
    }
  }
  return result;
}

unint64_t systemInfo_getCurrentUnixTime()
{
  id v0 = [MEMORY[0x1E4F1C9C8] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  id v0 = [MEMORY[0x1E4F1C9C8] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_0);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_3);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  id v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    double v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, @"Beta") != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_11);
  }
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_16);
  }
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  id v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 isEqualToString:@"AudioAccessory"];

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  if (systemInfo_copyRegionCode_onceToken != -1) {
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_24);
  }
  if (systemInfo_copyRegionCode_regionCode)
  {
    CFTypeID v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID()) {
      return systemInfo_copyRegionCode_regionCode;
    }
  }
  uint64_t result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

void sub_1B3C29630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3C29D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
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

void sub_1B3C2B6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_1B3C2D994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C2DBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C2E584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C2EB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C2F084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C2F2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C2F7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1B3C37CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsLogging];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t TLV8Get(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, void *a5, unsigned __int8 **a6)
{
  do
  {
    if (a1 == a2) {
      return 4294960569;
    }
    if (a1 >= a2) {
      return 4294960591;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      return 4294960569;
    }
    id v6 = a1 + 2;
    uint64_t v7 = a1[1];
    unint64_t v8 = &a1[v7 + 2];
    if (v8 > a2) {
      return 4294960546;
    }
    int v9 = *a1;
    a1 += v7 + 2;
  }
  while (v9 != a3);
  if (a4) {
    *a4 = v6;
  }
  if (a5) {
    *a5 = v7;
  }
  uint64_t result = 0;
  if (a6) {
    *a6 = v8;
  }
  return result;
}

uint64_t TLV8GetNext(unsigned char *a1, unsigned char *a2, unsigned char *a3, void *a4, void *a5, void *a6)
{
  if (a1 == a2) {
    return 4294960569;
  }
  if (a1 >= a2) {
    return 4294960591;
  }
  if ((unint64_t)(a2 - a1) < 2) {
    return 4294960569;
  }
  uint64_t v6 = a1[1];
  uint64_t v7 = &a1[v6 + 2];
  if (v7 > a2) {
    return 4294960546;
  }
  *a3 = *a1;
  *a4 = a1 + 2;
  *a5 = v6;
  uint64_t result = 0;
  if (a6) {
    *a6 = v7;
  }
  return result;
}

uint64_t TLV8GetBytes(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unint64_t a4, size_t a5, char *__dst, void *a7, unsigned __int8 **a8)
{
  do
  {
    if (a1 == a2) {
      return 4294960569;
    }
    if (a1 >= a2) {
      return 4294960591;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      return 4294960569;
    }
    id v14 = a1 + 2;
    size_t v15 = a1[1];
    int v16 = &a1[v15 + 2];
    if (v16 > a2) {
      return 4294960546;
    }
    int v17 = *a1;
    a1 += v15 + 2;
  }
  while (v17 != a3);
  if (v15 > a5) {
    return 4294960545;
  }
  uint64_t v18 = &__dst[a5];
  memcpy(__dst, v14, v15);
  int v19 = &__dst[v15];
LABEL_8:
  unsigned int v20 = v16;
  while (a2 > v20)
  {
    if ((unint64_t)(a2 - v20) < 2) {
      break;
    }
    int v21 = v20 + 2;
    size_t v22 = v20[1];
    int v16 = &v20[v22 + 2];
    if (v16 > a2 || *v20 != a3) {
      break;
    }
    v20 += v22 + 2;
    if (v22)
    {
      if (v18 - v19 < v22) {
        return 4294960545;
      }
      memcpy(v19, v21, v22);
      v19 += v22;
      goto LABEL_8;
    }
  }
  if (v19 - __dst < a4) {
    return 4294960546;
  }
  if (a7) {
    *a7 = v19 - __dst;
  }
  uint64_t result = 0;
  if (a8) {
    *a8 = v20;
  }
  return result;
}

unint64_t TLV8GetSInt64(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int *a4, unsigned __int8 **a5)
{
  do
  {
    if (a1 == a2)
    {
LABEL_16:
      unint64_t result = 0;
      int v9 = -6727;
      goto LABEL_13;
    }
    uint64_t v5 = a1;
    if (a1 >= a2)
    {
      unint64_t result = 0;
      int v9 = -6705;
      goto LABEL_13;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      goto LABEL_16;
    }
    uint64_t v6 = (char *)(a1 + 2);
    uint64_t v7 = a1[1];
    a1 += v7 + 2;
    if (a1 > a2)
    {
      unint64_t result = 0;
      int v9 = -6750;
      goto LABEL_13;
    }
  }
  while (*v5 != a3);
  if (a5) {
    *a5 = a1;
  }
  unint64_t result = 0;
  int v9 = -6743;
  switch((int)v7)
  {
    case 1:
      int v9 = 0;
      unint64_t result = *v6;
      break;
    case 2:
      int v9 = 0;
      unint64_t result = (__int16)(v5[3] << 8) | (unint64_t)v5[2];
      break;
    case 4:
      int v9 = 0;
      unint64_t result = *(int *)v6;
      break;
    case 8:
      int v9 = 0;
      unint64_t result = *(void *)v6;
      break;
    default:
      break;
  }
LABEL_13:
  if (a4) {
    *a4 = v9;
  }
  return result;
}

unint64_t TLVParseSInt64(unsigned __int8 *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result = 0;
  int v6 = -6743;
  if (a3)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        int v6 = 0;
        unint64_t result = (char)*a1;
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 2:
        int v6 = 0;
        unint64_t result = (__int16)(*a1 << 8) | (unint64_t)a1[1];
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 4:
        int v6 = 0;
        unint64_t result = (*a1 << 24) | ((unint64_t)a1[1] << 16) | ((unint64_t)a1[2] << 8) | a1[3];
        goto LABEL_15;
      case 8:
        int v6 = 0;
        unint64_t result = bswap64(*(void *)a1);
        if (!a4) {
          return result;
        }
        goto LABEL_16;
      default:
LABEL_15:
        if (a4) {
LABEL_16:
        }
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        int v6 = 0;
        unint64_t result = (__int16)(a1[1] << 8) | (unint64_t)*a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 4:
        int v6 = 0;
        unint64_t result = *(int *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 8:
        int v6 = 0;
        unint64_t result = *(void *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

uint64_t TLV8GetUInt64(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int *a4, unsigned __int8 **a5)
{
  do
  {
    if (a1 == a2)
    {
LABEL_16:
      uint64_t result = 0;
      int v9 = -6727;
      goto LABEL_13;
    }
    uint64_t v5 = a1;
    if (a1 >= a2)
    {
      uint64_t result = 0;
      int v9 = -6705;
      goto LABEL_13;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      goto LABEL_16;
    }
    int v6 = a1 + 2;
    uint64_t v7 = a1[1];
    a1 += v7 + 2;
    if (a1 > a2)
    {
      uint64_t result = 0;
      int v9 = -6750;
      goto LABEL_13;
    }
  }
  while (*v5 != a3);
  if (a5) {
    *a5 = a1;
  }
  uint64_t result = 0;
  int v9 = -6743;
  switch((int)v7)
  {
    case 1:
      int v9 = 0;
      uint64_t result = *v6;
      break;
    case 2:
      int v9 = 0;
      uint64_t result = *((unsigned __int16 *)v5 + 1);
      break;
    case 4:
      int v9 = 0;
      uint64_t result = *(unsigned int *)v6;
      break;
    case 8:
      int v9 = 0;
      uint64_t result = *(void *)v6;
      break;
    default:
      break;
  }
LABEL_13:
  if (a4) {
    *a4 = v9;
  }
  return result;
}

unint64_t TLVParseUInt64(unsigned int *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result = 0;
  int v6 = -6743;
  if (a3)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        int v6 = 0;
        unint64_t result = *(unsigned __int8 *)a1;
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 2:
        int v6 = 0;
        unint64_t result = __rev16(*(unsigned __int16 *)a1);
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 4:
        int v6 = 0;
        unint64_t result = bswap32(*a1);
        goto LABEL_15;
      case 8:
        int v6 = 0;
        unint64_t result = bswap64(*(void *)a1);
        if (!a4) {
          return result;
        }
        goto LABEL_16;
      default:
LABEL_15:
        if (a4) {
LABEL_16:
        }
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        int v6 = 0;
        unint64_t result = *(unsigned __int16 *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 4:
        int v6 = 0;
        unint64_t result = *a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 8:
        int v6 = 0;
        unint64_t result = *(void *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

unsigned __int8 *TLV8CopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, unsigned __int8 **a5, int *a6)
{
  memset(v16, 170, sizeof(v16));
  int v10 = TLV8GetOrCopyCoalesced(a1, a2, a3, &v16[3], (size_t *)&v16[2], &v16[1], v16);
  if (v10)
  {
    unint64_t v11 = 0;
    goto LABEL_10;
  }
  unint64_t v11 = v16[1];
  uint64_t v12 = v16[2];
  if (!v16[1])
  {
    if (v16[2] <= (unsigned __int8 *)1) {
      size_t v13 = 1;
    }
    else {
      size_t v13 = (size_t)v16[2];
    }
    id v14 = (unsigned __int8 *)malloc_type_malloc(v13, 0xA969B135uLL);
    unint64_t v11 = v14;
    if (!v14)
    {
      int v10 = -6728;
      goto LABEL_10;
    }
    memcpy(v14, v16[3], (size_t)v12);
  }
  *a4 = v12;
  int v10 = 0;
  if (a5) {
    *a5 = a1;
  }
LABEL_10:
  if (a6) {
    *a6 = v10;
  }
  return v11;
}

uint64_t TLV8GetOrCopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, void *a4, size_t *a5, void *a6, unsigned __int8 **a7)
{
  do
  {
    if (a1 == a2) {
      return 4294960569;
    }
    if (a1 >= a2) {
      return 4294960591;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      return 4294960569;
    }
    int v9 = a1 + 2;
    size_t v10 = a1[1];
    unint64_t v11 = &a1[v10 + 2];
    if (v11 > a2) {
      return 4294960546;
    }
    int v12 = *a1;
    a1 += v10 + 2;
  }
  while (v12 != a3);
  size_t v13 = 0;
  while (2)
  {
    id v14 = v13;
    size_t v15 = v10;
    while (2)
    {
      size_t v16 = v15;
      int v17 = v9;
      uint64_t v18 = v11;
      do
      {
        if (a2 <= v18
          || (unint64_t)(a2 - v18) < 2
          || (v9 = v18 + 2, v15 = v18[1], unint64_t v11 = &v18[v15 + 2], v11 > a2)
          || *v18 != a3)
        {
          *a4 = v17;
          *a5 = v16;
          *a6 = v13;
          uint64_t result = 0;
          if (a7) {
            *a7 = v18;
          }
          return result;
        }
        v18 += v15 + 2;
      }
      while (!v15);
      if (!v16) {
        continue;
      }
      break;
    }
    int v21 = a4;
    size_t v22 = a5;
    uint64_t v23 = a6;
    v24 = a7;
    size_t v10 = v16 + v15;
    int v19 = (char *)malloc_type_malloc(v16 + v15, 0x9D9E81ACuLL);
    if (v19)
    {
      size_t v13 = v19;
      memcpy(v19, v17, v16);
      memcpy(&v13[v16], v9, v15);
      int v9 = v13;
      a6 = v23;
      a7 = v24;
      a4 = v21;
      a5 = v22;
      if (v14)
      {
        free(v14);
        a4 = v21;
        a5 = v22;
        a6 = v23;
        a7 = v24;
        int v9 = v13;
      }
      continue;
    }
    break;
  }
  if (v13) {
    free(v13);
  }
  return 4294960568;
}

void *TLV8BufferInit(void *result, uint64_t a2)
{
  *uint64_t result = result + 4;
  result[1] = 0;
  result[2] = a2;
  result[3] = 0;
  return result;
}

void TLV8BufferFree(uint64_t a1)
{
  CFTypeID v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
}

uint64_t TLV8BufferAppend(uint64_t a1, char a2, char *__s, size_t a4)
{
  size_t v4 = a4;
  uint64_t v5 = __s;
  if (a4 == -1) {
    size_t v4 = strlen(__s);
  }
  if (v4 >= 0x100)
  {
    unint64_t v9 = v4 / 0xFF;
    if (v4 % 0xFF) {
      ++v9;
    }
    uint64_t v8 = 2 * v9;
  }
  else
  {
    uint64_t v8 = 2;
  }
  size_t v10 = v8 + v4;
  size_t v11 = *(void *)(a1 + 8);
  size_t v12 = v10 + v11;
  if (v10 + v11 > *(void *)(a1 + 16)) {
    return 4294960553;
  }
  if (v12 < v11) {
    return 4294960545;
  }
  if (v12 > 0x12C)
  {
    id v14 = (char *)malloc_type_malloc(v12, 0xC0D9A027uLL);
    if (!v14) {
      return 4294960568;
    }
    size_t v15 = v14;
    size_t v16 = *(const void **)(a1 + 24);
    size_t v17 = *(void *)(a1 + 8);
    if (v16)
    {
      memcpy(v14, v16, v17);
      free(*(void **)(a1 + 24));
    }
    else if (v17)
    {
      memcpy(v14, (const void *)(a1 + 32), v17);
    }
    *(void *)a1 = v15;
    *(void *)(a1 + 24) = v15;
    size_t v13 = &v15[*(void *)(a1 + 8)];
  }
  else
  {
    size_t v13 = (char *)(a1 + v11 + 32);
  }
  uint64_t v18 = &v5[v4];
  do
  {
    if ((unint64_t)(v18 - v5) >= 0xFF) {
      size_t v19 = 255;
    }
    else {
      size_t v19 = v18 - v5;
    }
    char *v13 = a2;
    v13[1] = v19;
    if (v19) {
      memcpy(v13 + 2, v5, v19);
    }
    v5 += v19;
    v13 += v19 + 2;
  }
  while (v5 != v18);
  uint64_t result = 0;
  *(void *)(a1 + 8) = &v13[-*(void *)a1];
  return result;
}

uint64_t TLV8BufferAppendSInt64(uint64_t a1, char a2, uint64_t a3)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == (char)a3)
  {
    LOBYTE(v5[0]) = a3;
    size_t v3 = 1;
  }
  else
  {
    v5[0] = a3;
    size_t v3 = 8;
  }
  return TLV8BufferAppend(a1, a2, (char *)v5, v3);
}

uint64_t TLV8BufferAppendUInt64(uint64_t a1, char a2, unint64_t a3)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a3 > 0xFF)
  {
    if (a3 >> 16)
    {
      LODWORD(v5[0]) = a3;
      if (HIDWORD(a3))
      {
        BYTE4(v5[0]) = BYTE4(a3);
        BYTE5(v5[0]) = BYTE5(a3);
        BYTE6(v5[0]) = BYTE6(a3);
        HIBYTE(v5[0]) = HIBYTE(a3);
        size_t v3 = 8;
      }
      else
      {
        size_t v3 = 4;
      }
    }
    else
    {
      LOWORD(v5[0]) = a3;
      size_t v3 = 2;
    }
  }
  else
  {
    LOBYTE(v5[0]) = a3;
    size_t v3 = 1;
  }
  return TLV8BufferAppend(a1, a2, (char *)v5, v3);
}

uint64_t TLV8BufferDetach(uint64_t a1, void *a2, size_t *a3)
{
  size_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void **)(a1 + 24);
  if (v7) {
    goto LABEL_8;
  }
  if (v6 <= 1) {
    size_t v8 = 1;
  }
  else {
    size_t v8 = *(void *)(a1 + 8);
  }
  unint64_t v9 = malloc_type_malloc(v8, 0xDF1AB553uLL);
  if (v9)
  {
    uint64_t v7 = v9;
    if (v6) {
      memcpy(v9, *(const void **)a1, v6);
    }
LABEL_8:
    uint64_t result = 0;
    *(void *)a1 = a1 + 32;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 24) = 0;
    *a2 = v7;
    *a3 = v6;
    return result;
  }
  return 4294960568;
}

unint64_t TLV8MaxPayloadBytesForTotalBytes(unint64_t a1)
{
  if (a1 < 2) {
    return 0;
  }
  unint64_t v2 = a1 - 2 * (a1 / 0x101);
  if (a1 % 0x101 < 2) {
    return v2 - (a1 % 0x101 != 0);
  }
  else {
    return v2 - 2;
  }
}

uint64_t TLV8x16Get(unsigned __int8 *a1, unsigned __int8 *a2, char a3, int a4, unsigned __int8 **a5, unint64_t *a6, unsigned __int8 **a7)
{
  while (a1 != a2)
  {
    if (a2 - a1 < 1
      || (int v7 = *a1, a2 - (a1 + 1) < 2)
      || ((uint64_t v8 = a1[1], (a3 & 1) != 0)
        ? (unint64_t v9 = a1[2] | (unint64_t)(v8 << 8))
        : (unint64_t v9 = v8 | ((unint64_t)a1[2] << 8)),
          size_t v10 = a1 + 3,
          a2 - (a1 + 3) < v9))
    {
      uint64_t v11 = 4294960546;
      goto LABEL_10;
    }
    a1 = &v10[v9];
    if (v7 == a4)
    {
      uint64_t v11 = 0;
      *a5 = v10;
      *a6 = v9;
LABEL_10:
      a2 = a1;
      if (!a7) {
        return v11;
      }
LABEL_11:
      *a7 = a2;
      return v11;
    }
  }
  uint64_t v11 = 4294960569;
  if (a7) {
    goto LABEL_11;
  }
  return v11;
}

uint64_t TLV8x16GetNext(unsigned __int8 *a1, unsigned __int8 *a2, char a3, _WORD *a4, unsigned __int8 **a5, unint64_t *a6, void *a7)
{
  if (a1 == a2) {
    return 4294960569;
  }
  if (a2 - a1 < 1 || a2 - (a1 + 1) < 2) {
    return 4294960546;
  }
  uint64_t v7 = a1[1];
  unint64_t v8 = (a3 & 1) != 0 ? a1[2] | (unint64_t)(v7 << 8) : v7 | ((unint64_t)a1[2] << 8);
  unint64_t v9 = a1 + 3;
  if (a2 - (a1 + 3) < v8) {
    return 4294960546;
  }
  *a4 = *a1;
  *a5 = v9;
  *a6 = v8;
  uint64_t result = 0;
  if (a7) {
    *a7 = &v9[v8];
  }
  return result;
}

unint64_t TLV8x16GetSInt64(unsigned __int8 *a1, unsigned __int8 *a2, char a3, int a4, _DWORD *a5, unsigned __int8 **a6)
{
  uint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  size_t v10 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  int v11 = TLV8x16Get(a1, a2, a3, a4, &v10, (unint64_t *)&v9, a6);
  if (v11)
  {
    unint64_t result = 0;
    if (!a5) {
      return result;
    }
  }
  else
  {
    unint64_t result = TLVParseSInt64(v10, v9, a3, &v11);
    if (!a5) {
      return result;
    }
  }
  *a5 = v11;
  return result;
}

unint64_t TLV8x16GetUInt64(unsigned __int8 *a1, unsigned __int8 *a2, char a3, int a4, _DWORD *a5, unsigned __int8 **a6)
{
  uint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  size_t v10 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
  int v11 = TLV8x16Get(a1, a2, a3, a4, (unsigned __int8 **)&v10, (unint64_t *)&v9, a6);
  if (v11)
  {
    unint64_t result = 0;
    if (!a5) {
      return result;
    }
  }
  else
  {
    unint64_t result = TLVParseUInt64(v10, v9, a3, &v11);
    if (!a5) {
      return result;
    }
  }
  *a5 = v11;
  return result;
}

uint64_t TLV8x16Append(CFMutableDataRef theData, char a2, UInt8 a3, char *__s, size_t a5)
{
  size_t v5 = a5;
  if (a5 == -1) {
    size_t v5 = strlen(__s);
  }
  if (v5 >> 16) {
    return 4294960553;
  }
  bytes[0] = a3;
  size_t v10 = v5 >> 8;
  if (a2) {
    size_t v11 = v5 >> 8;
  }
  else {
    LOBYTE(v11) = v5;
  }
  if (a2) {
    LOBYTE(v10) = v5;
  }
  bytes[1] = v11;
  bytes[2] = v10;
  CFDataAppendBytes(theData, bytes, 3);
  CFDataAppendBytes(theData, (const UInt8 *)__s, v5);
  return 0;
}

uint64_t TLV8x16AppendSInt64(__CFData *a1, char a2, UInt8 a3, uint64_t a4)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a4 == (char)a4)
  {
    LOBYTE(v6[0]) = a4;
    size_t v4 = 1;
  }
  else
  {
    v6[0] = a4;
    size_t v4 = 8;
  }
  return TLV8x16Append(a1, a2, a3, (char *)v6, v4);
}

uint64_t TLV8x16AppendUInt64(__CFData *a1, char a2, UInt8 a3, unint64_t a4)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a4 > 0xFF)
  {
    if (a4 >> 16)
    {
      LODWORD(v6[0]) = a4;
      if (HIDWORD(a4))
      {
        BYTE4(v6[0]) = BYTE4(a4);
        BYTE5(v6[0]) = BYTE5(a4);
        BYTE6(v6[0]) = BYTE6(a4);
        HIBYTE(v6[0]) = HIBYTE(a4);
        size_t v4 = 8;
      }
      else
      {
        size_t v4 = 4;
      }
    }
    else
    {
      LOWORD(v6[0]) = a4;
      size_t v4 = 2;
    }
  }
  else
  {
    LOBYTE(v6[0]) = a4;
    size_t v4 = 1;
  }
  return TLV8x16Append(a1, a2, a3, (char *)v6, v4);
}

uint64_t TLV16Get(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int a4, void *a5, void *a6, void *a7)
{
  size_t v17 = a1;
  unsigned __int16 v16 = -21846;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  size_t v15 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  while (1)
  {
    uint64_t result = TLV16GetNext(v17, a2, a3, &v16, &v15, &v14, &v17);
    if (result) {
      break;
    }
    if (v16 == a4)
    {
      *a5 = v15;
      *a6 = v14;
      break;
    }
  }
  if (a7) {
    *a7 = v17;
  }
  return result;
}

uint64_t TLV16GetNext(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int16 *a4, unsigned __int8 **a5, unint64_t *a6, void *a7)
{
  if (a1 == a2) {
    return 4294960569;
  }
  if (a1 >= a2) {
    return 4294960591;
  }
  if ((unint64_t)(a2 - a1) < 4) {
    return 4294960546;
  }
  uint64_t v7 = a1[2];
  if (a3)
  {
    unsigned __int16 v8 = _byteswap_ushort(*(_WORD *)a1);
    unint64_t v9 = a1[3] | (unint64_t)(v7 << 8);
  }
  else
  {
    unsigned __int16 v8 = *a1 | (a1[1] << 8);
    unint64_t v9 = v7 | ((unint64_t)a1[3] << 8);
  }
  size_t v10 = a1 + 4;
  if (a2 - (a1 + 4) < v9) {
    return 4294960546;
  }
  *a4 = v8;
  *a5 = v10;
  *a6 = v9;
  uint64_t result = 0;
  if (a7) {
    *a7 = &v10[v9];
  }
  return result;
}

CFDataRef copyCertificateForFDRData(const __CFData *Copy)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  init_logging();
  if (Copy)
  {
    CFIndex Length = CFDataGetLength(Copy);
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects <= 3;
    }
    else {
      BOOL v3 = 1;
    }
    int v4 = !v3;
    if (Length < 611)
    {
      if (v4)
      {
        uint64_t v7 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        uint64_t v7 = MEMORY[0x1E4F14500];
        id v12 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "dataLength matches Roswell data length, return copy of fdr data", (uint8_t *)&v26, 2u);
      }

      Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Copy);
    }
    else
    {
      uint64_t v5 = Length;
      if (v4)
      {
        size_t v6 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportPlugin initWithDelegate:]();
        }
        size_t v6 = MEMORY[0x1E4F14500];
        id v8 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "Have a custom Roswell data structure", (uint8_t *)&v26, 2u);
      }

      if (gLogObjects) {
        BOOL v9 = gNumLogObjects <= 3;
      }
      else {
        BOOL v9 = 1;
      }
      int v10 = !v9;
      if (v5 == 704)
      {
        if (v10)
        {
          size_t v11 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportPlugin initWithDelegate:]();
          }
          size_t v11 = MEMORY[0x1E4F14500];
          id v14 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "Have a match for (t_bpFDRData_v1)", (uint8_t *)&v26, 2u);
        }

        size_t v15 = (UInt8 *)malloc_type_calloc(1uLL, 0x2C0uLL, 0x100004033510130uLL);
        BytePtr = CFDataGetBytePtr(Copy);
        memcpy(v15, BytePtr, 0x2C0uLL);
        if (gLogObjects && gNumLogObjects >= 4)
        {
          size_t v17 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportPlugin initWithDelegate:]();
          }
          size_t v17 = MEMORY[0x1E4F14500];
          id v19 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *((unsigned __int16 *)v15 + 30);
          int v26 = 67109120;
          LODWORD(v27) = v20;
          _os_log_impl(&dword_1B3C21000, v17, OS_LOG_TYPE_DEFAULT, "pRoswellDataStructure->roswell_cert_len = %d", (uint8_t *)&v26, 8u);
        }

        Copy = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v15 + 62, *((unsigned __int16 *)v15 + 30));
        free(v15);
      }
      else
      {
        if (v10)
        {
          size_t v13 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportPlugin initWithDelegate:]();
          }
          size_t v13 = MEMORY[0x1E4F14500];
          id v18 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          copyCertificateForFDRData_cold_4(v5, v13);
        }

        Copy = 0;
      }
    }
  }
  if (gLogObjects) {
    BOOL v21 = gNumLogObjects < 4;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v23 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v23 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    if (Copy) {
      CFIndex v24 = CFDataGetLength(Copy);
    }
    else {
      CFIndex v24 = 0;
    }
    int v26 = 134217984;
    CFIndex v27 = v24;
    _os_log_impl(&dword_1B3C21000, v23, OS_LOG_TYPE_INFO, "Returning Roswell data of length %ld", (uint8_t *)&v26, 0xCu);
  }

  return Copy;
}

void init_logging_signposts()
{
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t acc_transportClient_createConnection(uint64_t a1, uint64_t a2)
{
  int v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 createConnectionWithType:a1 andIdentifier:a2];

  return v6;
}

uint64_t acc_transportClient_setPropertiesForConnectionWithUUID(uint64_t a1, uint64_t a2)
{
  int v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 setProperties:a1 forConnectionWithUUID:a2];

  return v6;
}

uint64_t acc_transportClient_setPropertyForConnectionWithUUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v7 = [v6 transportClient];
  uint64_t v11 = a1;
  v12[0] = a2;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [v7 setProperties:v8 forConnectionWithUUID:a3];

  return v9;
}

uint64_t acc_transportClient_removePropertyForConnectionWithUUID(uint64_t a1, uint64_t a2)
{
  int v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 removeProperty:a1 forConnectionWithUUID:a2];

  return v6;
}

id acc_transportClient_createEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v11 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __acc_transportClient_createEndpoint_block_invoke;
  aBlock[3] = &unk_1E6073F30;
  id v20 = v11;
  id v12 = v11;
  size_t v13 = _Block_copy(aBlock);
  id v14 = +[ACCTransportClientBridge sharedBridge];
  size_t v15 = [v14 transportClient];
  unsigned __int16 v16 = [v15 createEndpointWithTransportType:a2 andProtocol:a3 andIdentifier:a4 andDataOutHandler:v13 forConnectionWithUUID:a1 publishConnection:a6];

  id v17 = v16;
  return v17;
}

uint64_t __acc_transportClient_createEndpoint_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t acc_transportClient_setAccessoryInfo(uint64_t a1, uint64_t a2)
{
  int v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 setAccessoryInfo:a2 forEndpointWithUUID:a1];

  return v6;
}

uint64_t acc_transportClient_setPropertiesForEndpointWithUUID(uint64_t a1, uint64_t a2)
{
  int v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 setProperties:a1 forEndpointWithUUID:a2];

  return v6;
}

uint64_t acc_transportClient_setPropertyForEndpointWithUUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v7 = [v6 transportClient];
  uint64_t v11 = a1;
  v12[0] = a2;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [v7 setProperties:v8 forEndpointWithUUID:a3];

  return v9;
}

uint64_t acc_transportClient_removePropertyForEndpointWithUUID(uint64_t a1, uint64_t a2)
{
  int v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 removeProperty:a1 forEndpointWithUUID:a2];

  return v6;
}

uint64_t acc_transportClient_publishConnection(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 publishConnectionWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_destroyEndpoint(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 destroyEndpointWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_destroyConnection(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 destroyConnectionWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_copyConnectionUUIDForEndpointUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 connectionUUIDForEndpointWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_copyEndpointUUIDsForConnectionUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 endpointUUIDsForConnectionWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_getAuthStateForConnectionUUID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 authStateForConnectionWithUUID:a1 authType:a2];

  return v6;
}

uint64_t acc_transportClient_isConnectionAuthenticated(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 isConnectionAuthenticated:a1];

  return v4;
}

uint64_t acc_transportClient_copyAccessoryInfoForConnectionWithUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 accessoryInfoForConnectionWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_copyAccessoryInfoForEndpointWithUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 accessoryInfoForEndpointWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_copyPropertiesForConnectionWithUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 propertiesForConnectionWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_copyPropertiesForEndpointWithUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 propertiesForEndpointWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_copyIdentifierForConnectionWithUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 identifierForConnectionWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_copyIdentifierForEndpointWithUUID(uint64_t a1)
{
  unint64_t v2 = +[ACCTransportClientBridge sharedBridge];
  BOOL v3 = [v2 transportClient];
  uint64_t v4 = [v3 identifierForEndpointWithUUID:a1];

  return v4;
}

uint64_t acc_transportClient_processIncomingData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v5 = [v4 transportClient];
  uint64_t v6 = [v5 processIncomingData:a1 forEndpointWithUUID:a2];

  return v6;
}

void acc_transportClient_setConnectionAuthStatusDidChangeHandler(void *a1)
{
  id v1 = a1;
  id v2 = +[ACCTransportClientBridge sharedBridge];
  [v2 setConnectionAuthStatusChangedHandler:v1];
}

void acc_transportClient_setConnectionPropertiesDidChangeHandler(void *a1)
{
  id v1 = a1;
  id v2 = +[ACCTransportClientBridge sharedBridge];
  [v2 setConnectionPropertiesChangedHandler:v1];
}

void acc_transportClient_setConnectionPropertyDidChangeHandler(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    uint64_t v4 = +[ACCTransportClientBridge sharedBridge];
    uint64_t v5 = [v4 transportClient];
    uint64_t v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __acc_transportClient_setConnectionPropertyDidChangeHandler_block_invoke;
      v7[3] = &unk_1E6073F58;
      id v8 = v3;
      [v6 setHandler:v7 forConnectionProperty:a2];
    }
    else
    {
      [v5 setHandler:0 forConnectionProperty:a2];
    }
  }
}

uint64_t __acc_transportClient_setConnectionPropertyDidChangeHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void acc_transportClient_setEndpointPropertiesDidChangeHandler(void *a1)
{
  id v1 = a1;
  id v2 = +[ACCTransportClientBridge sharedBridge];
  [v2 setEndpointPropertiesChangedHandler:v1];
}

void acc_transportClient_setEndpointPropertyDidChangeHandler(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    uint64_t v4 = +[ACCTransportClientBridge sharedBridge];
    uint64_t v5 = [v4 transportClient];
    uint64_t v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __acc_transportClient_setEndpointPropertyDidChangeHandler_block_invoke;
      v7[3] = &unk_1E6073F80;
      id v8 = v3;
      [v6 setHandler:v7 forEndpointProperty:a2];
    }
    else
    {
      [v5 setHandler:0 forEndpointProperty:a2];
    }
  }
}

uint64_t __acc_transportClient_setEndpointPropertyDidChangeHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void acc_transportClient_serverDisconnectedHandler(void *a1)
{
  id v1 = a1;
  id v2 = +[ACCTransportClientBridge sharedBridge];
  [v2 setServerDisconnectedHandler:v1];
}

void acc_transportClient_setEndpointSecureTunnelDataReceiveHandler(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[ACCTransportClientBridge sharedBridge];
    uint64_t v5 = [v4 transportClient];
    uint64_t v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __acc_transportClient_setEndpointSecureTunnelDataReceiveHandler_block_invoke;
      v7[3] = &unk_1E6073FA8;
      id v8 = v3;
      [v6 setSecureTunnelDataReceiveHandler:v7 forEndpoint:a1];
    }
    else
    {
      [v5 setSecureTunnelDataReceiveHandler:0 forEndpoint:a1];
    }
  }
}

uint64_t __acc_transportClient_setEndpointSecureTunnelDataReceiveHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void acc_transportClient_endpointSecureTunnelDataSend(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = +[ACCTransportClientBridge sharedBridge];
  uint64_t v6 = [v7 transportClient];
  [v6 processOutgoingSecureTunnelData:a3 forEndpoint:a1 forType:a2];
}

uint64_t accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result <= 1)
  {
    unsigned int v1 = result;
    pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 1;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      id v3 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
    }
    else
    {
      id v3 = *(NSObject **)gLogObjects;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (const char *)_gNotificationName[v1];
      uint64_t v5 = v1;
      if (!v4) {
        uint64_t v4 = "null";
      }
      v8[0] = 67109378;
      v8[1] = v1;
      __int16 v9 = 2080;
      int v10 = v4;
      _os_log_impl(&dword_1B3C21000, v3, OS_LOG_TYPE_DEFAULT, "Unregister AvailabilityChangedHandler (%d, %s)", (uint8_t *)v8, 0x12u);
    }
    else
    {
      uint64_t v5 = v1;
    }
    int v6 = _gServerAvailableToken[v5];
    if (v6 != -1)
    {
      notify_cancel(v6);
      _gServerAvailableToken[v5] = -1;
    }
    id v7 = (const void *)_gServerAvailabilityChangedHandler[v5];
    if (v7)
    {
      _Block_release(v7);
      _gServerAvailabilityChangedHandler[v5] = 0;
    }
    _gNotificationName[v5] = 0;
    return pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  }
  return result;
}

uint64_t accessoryServer_unregisterAvailabilityChangedHandler()
{
  return accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(0);
}

uint64_t accessoryServer_serverIsUnreachableForServiceEntry(uint64_t a1)
{
  if (a1 <= 1) {
    return _SetupAvailabilityChangedHandlerForServiceEntry(a1);
  }
  return a1;
}

uint64_t accessoryServer_serverIsUnreachable()
{
  return _SetupAvailabilityChangedHandlerForServiceEntry(0);
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if ([v5 length])
    {
      unint64_t v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, *(unsigned __int8 *)(v6 + v8++));
      while (v8 < [v5 length]);
    }
    __int16 v9 = [NSString stringWithString:v7];
  }
  else
  {
    __int16 v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  unsigned int v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  unsigned int v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  id v5 = [v4 componentsJoinedByString:&stru_1F0C6F1D8];

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28B88] hexadecimalCharacterSet];
    id v3 = [v2 invertedSet];
    id v4 = [v1 componentsSeparatedByCharactersInSet:v3];
    id v5 = [v4 componentsJoinedByString:&stru_1F0C6F1D8];

    id v1 = v5;
    uint64_t v6 = (const char *)[v1 UTF8String];
    size_t v7 = strlen(v6) >> 1;
    unint64_t v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)[v1 length] >= 2)
    {
      unint64_t v9 = 0;
      int v10 = 0;
      do
      {
        uint64_t v11 = 0;
        __int16 v22 = -21846;
        char v12 = 1;
        do
        {
          char v13 = v12;
          int v14 = v6[v11 | (2 * v10)];
          unsigned int v15 = v14 - 48;
          unsigned int v16 = v14 - 65;
          if ((v14 - 97) >= 6) {
            char v17 = 0;
          }
          else {
            char v17 = v14 - 87;
          }
          char v18 = v14 - 55;
          if (v16 > 5) {
            char v18 = v17;
          }
          if (v15 < 0xA) {
            char v18 = v15;
          }
          *((unsigned char *)&v22 + v11) = v18;
          uint64_t v11 = 1;
          char v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        unint64_t v9 = (v10 + 1);
        unint64_t v19 = [v1 length];
        int v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    id v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:v7];
    if (v8) {
      free(v8);
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, void *a5)
{
  unint64_t v9 = a2;
  int v10 = [MEMORY[0x1E4F1CA80] set];
  unsigned int outCount = 0;
  uint64_t v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  char v12 = v11;
  if (outCount)
  {
    unint64_t v13 = 0;
    p_name = &v11->name;
    do
    {
      if (([a1 instancesRespondToSelector:*p_name] & 1) == 0)
      {
        unsigned int v15 = NSStringFromSelector(*p_name);
        [v10 addObject:v15];
      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && [v10 count])
  {
    uint64_t v16 = 0;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v16 = 1;
  if (a5)
  {
LABEL_11:
    *a5 = [MEMORY[0x1E4F1CAD0] setWithSet:v10];
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = (void *)MEMORY[0x1E4F1CA98];
  id v2 = a1;
  id v3 = [v1 null];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

id NSObjectIfNotNull(void *a1)
{
  id v1 = a1;
  if (isNSObjectNull(v1)) {
    id v2 = 0;
  }
  else {
    id v2 = v1;
  }

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return 1;
  }
}

id castNSObjectToType(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id readJSONFile(uint64_t a1)
{
  if (a1)
  {
    id v1 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a1];
    if (v1)
    {
      uint64_t v5 = 0;
      id v2 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v1 options:0 error:&v5];
      id v3 = v2;
      if (!v5)
      {
LABEL_6:

        goto LABEL_8;
      }
    }
    id v3 = 0;
    goto LABEL_6;
  }
  id v3 = 0;
LABEL_8:

  return v3;
}

uint64_t writeJSONFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4) {
    goto LABEL_7;
  }
  if (!v3) {
    id v3 = (id)MEMORY[0x1E4F1CC08];
  }
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v3])
  {
    uint64_t v9 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:&v9];
    uint64_t v6 = v5;
    if (v9) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v5 writeToFile:v4 atomically:1];
    }
  }
  else
  {
LABEL_7:
    uint64_t v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0, (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        long long v10 = objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (void)v12);
        if (v10) {
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_1B3C3E70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_1B3C3FBEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B3C40230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1B3C408C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C40FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C414D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C41808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C41E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C4257C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C42944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C42D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C431C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C434F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C43704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C43920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C43AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C43F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C4412C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C44340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C44554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C44768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C4497C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C44CCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3C44EF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3C451F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3C454B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

id ACCConnectionInfoCopyLocalizedAccessoryName(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && (isNSObjectNull(v1) & 1) == 0)
  {
    uint64_t v4 = +[ACCConnectionInfo sharedInstance];
    id v3 = (void *)[v4 copyLocalizedAccessoryNameFromDaemon:v2];

    if (v3)
    {
      NSLog(&cfstr_LocalizeName.isa, v2, v3);
    }
    else
    {
      NSLog(&cfstr_FailedLocalize.isa, v2, 0);
      id v3 = (void *)[v2 copy];
    }
  }
  else
  {
    NSLog(&cfstr_InvalidAccesso.isa, v2, 0);
    id v3 = 0;
  }

  return v3;
}

uint64_t ACCConnectionInfoCopyLocalizedAccessoryNameCF(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

id ACCConnectionInfoCopyLocalizedAccessoryNamePrivate(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && (isNSObjectNull(v1) & 1) == 0)
  {
    uint64_t v4 = acc_strings_bundle();
    uint64_t v5 = [&unk_1F0C75988 objectForKeyedSubscript:v2];
    id v3 = [v4 localizedStringForKey:v2 value:&stru_1F0C6F1D8 table:v5];

    if (v3)
    {
      NSLog(&cfstr_LocalizeName.isa, v2, v3);
    }
    else
    {
      NSLog(&cfstr_FailedLocalize.isa, v2, 0);
      id v3 = (void *)[v2 copy];
    }
  }
  else
  {
    NSLog(&cfstr_InvalidAccesso.isa, v2, 0);
    id v3 = 0;
  }

  return v3;
}

uint64_t ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

void signVeridianChallenge(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  init_logging();
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = a1;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "challenging Veridian using data %@", buf, 0xCu);
  }

  uint64_t v7 = +[ACCHWComponentAuth sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __signVeridianChallenge_block_invoke;
  v9[3] = &unk_1E60748D8;
  id v10 = v3;
  id v8 = v3;
  [v7 signVeridianChallenge:a1 completionHandler:v9];
}

void __signVeridianChallenge_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 4;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    long long v11 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  else
  {
    long long v11 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 1024;
    int v17 = a4;
    _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "received response. signature=%@, deviceNonce=%@, authError=%d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void verifyBatteryMatch(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  init_logging();
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = a1;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "verifying battery match using cert %@", buf, 0xCu);
  }

  id v7 = +[ACCHWComponentAuth sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __verifyBatteryMatch_block_invoke;
  v9[3] = &unk_1E6074900;
  id v10 = v3;
  id v8 = v3;
  [v7 verifyBatteryMatch:a1 completionHandler:v9];
}

uint64_t __verifyBatteryMatch_block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "received response. authError=%d", (uint8_t *)v8, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void CoreAccessoriesInitForHID()
{
  init_logging();
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 4;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v2 = MEMORY[0x1E4F14500];
    id v1 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v2 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1B3C21000, v2, OS_LOG_TYPE_DEFAULT, "CoreAccessoriesInitForHID", v4, 2u);
  }

  id v3 = +[ACCHWComponentAuth sharedManager];
  [v3 authenticateTouchControllerWithChallenge:0 completionHandler:&__block_literal_global_6 updateRegistry:1];
}

void reauthenticateBattery()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  init_logging();
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 4;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v2 = MEMORY[0x1E4F14500];
    id v1 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v2 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1B3C21000, v2, OS_LOG_TYPE_DEFAULT, "reauthenticateBattery", (uint8_t *)v6, 2u);
  }

  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v3;
  v6[1] = v3;
  arc4random_buf(v6, 0x20uLL);
  BOOL v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:32];
  id v5 = +[ACCHWComponentAuth sharedManager];
  [v5 authenticateVeridianWithChallenge:v4 completionHandler:&__block_literal_global_52 updateRegistry:1 updateUIProperty:0 logToAnalytics:1];
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void copyCertificateForFDRData_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 704;
  _os_log_error_impl(&dword_1B3C21000, a2, OS_LOG_TYPE_ERROR, "auth length = %ld, sizeof(t_bpFDRData_v1) = %lu, does not match", (uint8_t *)&v2, 0x16u);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_1(const char **a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  if (!*a1) {
    uint64_t v3 = "null";
  }
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2080;
  uint64_t v6 = v3;
  _os_log_fault_impl(&dword_1B3C21000, log, OS_LOG_TYPE_FAULT, "AccessoryServerAvailabilityChangedHandler already set! (%d, %s)", (uint8_t *)v4, 0x12u);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}