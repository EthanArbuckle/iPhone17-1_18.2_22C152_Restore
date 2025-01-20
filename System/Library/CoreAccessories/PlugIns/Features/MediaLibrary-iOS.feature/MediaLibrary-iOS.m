uint64_t __receivedNotification(uint64_t a1, void *a2)
{
  return [a2 update];
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
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

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = "yUpdateQ";
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    v6 = MEMORY[0x263EF8438];
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
          _os_log_error_impl(&dword_2269CB000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
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
          v15 = v9;
          _os_log_debug_impl(&dword_2269CB000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_2269CB000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = "com.apple.accml.mediaLibraryUpdateQ" + 27;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 195);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_2269CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

void *WeakLinkSymbol(const char *a1, unint64_t a2)
{
  result = (void *)__HandleForSource(a2);
  if (result)
  {
    return dlsym(result, a1);
  }
  return result;
}

const void *__HandleForSource(unint64_t a1)
{
  pthread_mutex_lock(&__HandlesLock);
  CFDictionaryRef Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, (const void *)a1);
  if (!Value)
  {
    if (a1 <= 8
      && ((0x1BFu >> a1) & 1) != 0
      && (unint64_t v4 = dlopen((const char *)[(__CFString *)off_2647C0100[a1] UTF8String], 1)) != 0)
    {
      Value = v4;
      CFDictionarySetValue((CFMutableDictionaryRef)__Handles, (const void *)a1, v4);
    }
    else
    {
      NSLog(&cfstr_CouldNotLoadSo.isa, a1);
      Value = 0;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

id WeakLinkClass(void *a1, unint64_t a2)
{
  uint64_t v3 = a1;
  if (__HandleForSource(a2))
  {
    unint64_t v4 = NSClassFromString(v3);
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

id *WeakLinkStringConstant(const char *a1, unint64_t a2)
{
  uint64_t v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    uint64_t v3 = (id *)dlsym(v3, a1);
    if (v3) {
      uint64_t v3 = (id *)*v3;
    }
  }
  return v3;
}

uint64_t IsAppVisibleInCurrentMode(uint64_t a1)
{
  v1 = [NSString stringWithUTF8String:a1];
  id v2 = WeakLinkClass(@"LSApplicationProxy", 1uLL);
  id v3 = WeakLinkClass(@"LSApplicationWorkspace", 1uLL);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  unint64_t v4 = [v3 defaultWorkspace];
  int v5 = [v4 applicationIsInstalled:v1];

  if (v5)
  {
    v6 = [v2 applicationProxyForIdentifier:v1];
    uint64_t v7 = [v3 defaultWorkspace];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __IsAppVisibleInCurrentMode_block_invoke;
    v11[3] = &unk_2647C0150;
    v13 = &v14;
    id v8 = v6;
    id v12 = v8;
    [v7 enumerateBundlesOfType:4 block:v11];
  }
  uint64_t v9 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

void sub_2269CCD6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IsAppVisibleInCurrentMode_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t IsExistAppMusic()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.Music");
}

uint64_t IsExistAppPodcasts()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.podcasts");
}

uint64_t IsExistAppiBooks()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.iBooks");
}

id ACCGetOSVersion()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v0 = (const void *)MGCopyAnswerWithError();
  v1 = v0;
  if (v0)
  {
    CFTypeID v4 = CFGetTypeID(v0);
    if (v4 == CFStringGetTypeID())
    {
      uint64_t v5 = [NSString stringWithString:v1];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          ACCGetOSVersion_cold_1();
        }
        id v8 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v12 = "ACCGetOSVersion";
        _os_log_impl(&dword_2269CB000, v8, OS_LOG_TYPE_DEFAULT, "%s got non-string when querying key", buf, 0xCu);
      }

      uint64_t v5 = 0;
    }
    goto LABEL_25;
  }
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ACCGetOSVersion_cold_1();
    }
    v6 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v12 = "ACCGetOSVersion";
    __int16 v13 = 1024;
    int v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = @"ProductVersion";
    _os_log_impl(&dword_2269CB000, v6, OS_LOG_TYPE_DEFAULT, "%s MG error: 0x%08x retrieving key:(%@)", buf, 0x1Cu);
  }

  uint64_t v5 = 0;
  uint64_t v7 = 0;
  if (v1)
  {
LABEL_25:
    CFRelease(v1);
    uint64_t v7 = (void *)v5;
  }
  return v7;
}

uint64_t ACCMediaLibraryShimGetCurTimeMs()
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  return (v0 * 1000.0);
}

id ACCMediaLibraryShimUIDString(void *a1, int a2)
{
  id v3 = a1;
  int AppBooleanValue = __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting;
  if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"allowCachedTracksForAppleMusic", @"com.apple.iapd", 0);
    __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = AppBooleanValue;
  }
  uint64_t v5 = @"LM";
  if (a2) {
    uint64_t v5 = @"AM";
  }
  if (!AppBooleanValue) {
    uint64_t v5 = &stru_26DA84CD0;
  }
  v6 = v5;
  uint64_t v7 = GetMediaLibraryHelper();
  id v8 = ACCGetOSVersion();
  id v9 = [v3 uniqueIdentifier];
  int v10 = [v7 showMusic];
  unint64_t v11 = @"M";
  if (!v10) {
    unint64_t v11 = @"N";
  }
  id v12 = v11;
  int v13 = [v7 showPodcasts];
  int v14 = @"P";
  if (!v13) {
    int v14 = @"N";
  }
  __int16 v15 = v14;
  int v16 = [v7 showAudioBooks];
  uint64_t v17 = @"B";
  if (!v16) {
    uint64_t v17 = @"N";
  }
  uint64_t v18 = v17;
  if (!v8) {
    ACCMediaLibraryShimUIDString_cold_1();
  }
  if (!v9) {
    ACCMediaLibraryShimUIDString_cold_1();
  }
  v19 = v18;
  v20 = [NSString stringWithFormat:@"%@-%@%@%@%@-%@", v9, v6, v12, v15, v18, v8];

  return v20;
}

id ACCRadioLibraryUIDString()
{
  double v0 = ACCGetOSVersion();
  v1 = [MEMORY[0x263F11E40] deviceMediaLibrary];
  BOOL v2 = [v1 uniqueIdentifier];

  id v3 = [NSString stringWithFormat:@"%@-%@-%@", v2, @"4954524C", v0];

  return v3;
}

uint64_t _sendOnlyInLibraryItemsForPlaylist()
{
  double v0 = (void *)_sendOnlyInLibraryItemsForPlaylist_state;
  if (!_sendOnlyInLibraryItemsForPlaylist_state)
  {
    v1 = [[ACCSettingsState alloc] initWithKey:@"SendOnlyInLibraryItems" applicationID:@"com.apple.iapd" notification:@"com.apple.iapd.LoggingPreferencesChangedNotification" defaultValue:0 invalidValue:-1];
    BOOL v2 = (void *)_sendOnlyInLibraryItemsForPlaylist_state;
    _sendOnlyInLibraryItemsForPlaylist_state = (uint64_t)v1;

    double v0 = (void *)_sendOnlyInLibraryItemsForPlaylist_state;
  }
  return [v0 BOOLValue];
}

void sub_2269D3030(_Unwind_Exception *a1)
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

id GetMediaLibraryHelper()
{
  if (GetMediaLibraryHelper___mediaLibraryHelperInitOnce != -1) {
    dispatch_once(&GetMediaLibraryHelper___mediaLibraryHelperInitOnce, &__block_literal_global_430);
  }
  double v0 = (void *)GetMediaLibraryHelper___mediaLibraryHelper;
  return v0;
}

uint64_t __GetMediaLibraryHelper_block_invoke()
{
  GetMediaLibraryHelper___mediaLibraryHelper = objc_alloc_init(MediaLibraryHelper);
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x3Cu);
}

uint64_t OUTLINED_FUNCTION_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return *(void *)(a1 + 40);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id ACCMediaLibraryFeatureRequestedInfoDesc(void *a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x263F22E28]];
  id v3 = [v1 objectForKey:*MEMORY[0x263F22E40]];
  v28 = v1;
  uint64_t v4 = [v1 objectForKey:*MEMORY[0x263F22E48]];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= 1 << [*(id *)(*((void *)&v37 + 1) + 8 * i) intValue];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v11);
        }
        v14 |= 1 << [*(id *)(*((void *)&v33 + 1) + 8 * j) intValue];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v17);
        }
        v20 |= 1 << [*(id *)(*((void *)&v29 + 1) + 8 * k) intValue];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }

  v23 = NSString;
  v24 = [v28 objectForKey:*MEMORY[0x263F22E20]];
  v25 = [v28 objectForKey:*MEMORY[0x263F22E30]];
  v26 = [v23 stringWithFormat:@"[properties(item=%llxh playlist=%llxh content=%llxh) hideNonLocal=%@ playAllSongsCapable=%@]", v8, v14, v20, v24, v25];

  return v26;
}

uint64_t ascii_to_hex(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >= 2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = a3 >> 1;
    do
    {
      uint64_t v5 = 0;
      __int16 v13 = -21846;
      char v6 = 1;
      do
      {
        char v7 = v6;
        int v8 = *(unsigned __int8 *)(a2 + (v5 | (2 * v3)));
        unsigned int v9 = v8 - 48;
        unsigned int v10 = v8 - 65;
        if ((v8 - 97) >= 6) {
          char v11 = 0;
        }
        else {
          char v11 = v8 - 87;
        }
        char v12 = v8 - 55;
        if (v10 > 5) {
          char v12 = v11;
        }
        if (v9 < 0xA) {
          char v12 = v9;
        }
        *((unsigned char *)&v13 + v5) = v12;
        uint64_t v5 = 1;
        char v6 = 0;
      }
      while ((v7 & 1) != 0);
      *(unsigned char *)(result + v3++) = HIBYTE(v13) | (16 * v13);
    }
    while (v3 != v4);
  }
  return result;
}

unsigned __int8 *printBytes(unsigned __int8 *result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    uint64_t v4 = a2;
    if (a2)
    {
      char v7 = result;
      do
      {
        unsigned int v8 = *v7++;
        uint64_t result = (unsigned __int8 *)printf(a3, v8);
        --v4;
      }
      while (v4);
      if (a4)
      {
        return (unsigned __int8 *)putchar(10);
      }
    }
  }
  return result;
}

const char *removeNewline(const char *a1)
{
  size_t v2 = strlen(a1);
  if (v2 && a1[v2 - 1] == 10) {
    a1[v2 - 1] = 0;
  }
  return a1;
}

char *createHexString(uint64_t a1, unint64_t a2, int a3)
{
  if (a1 && a2)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (!a3)
      {
        size_t v5 = (2 * a2) | 1;
LABEL_10:
        char v7 = (char *)malloc_type_malloc(v5, 0xA799D077uLL);
        if (v7)
        {
          unint64_t v8 = 0;
          unsigned int v9 = v7;
          uint64_t v14 = v7;
          unsigned int v10 = v7;
          size_t v11 = v5;
          while (a3)
          {
            if (v8 >= a2 - 1)
            {
              char v12 = v10;
              size_t v13 = v11;
              goto LABEL_17;
            }
            snprintf(v10, v11, "%02X ");
LABEL_18:
            ++v8;
            v11 -= 3;
            v10 += 3;
            v9 += 2;
            v5 -= 2;
            if (a2 == v8) {
              return v14;
            }
          }
          char v12 = v9;
          size_t v13 = v5;
LABEL_17:
          snprintf(v12, v13, "%02X");
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (is_mul_ok(a2, 3uLL))
      {
        size_t v5 = 3 * a2;
        goto LABEL_10;
      }
    }
    do
LABEL_21:
      uint64_t result = (char *)malloc_type_malloc(0xEuLL, 0xD85E358FuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }
  uint64_t result = (char *)malloc_type_malloc(7uLL, 0x55AA73BCuLL);
  if (result) {
    strcpy(result, "(null)");
  }
  return result;
}

uint64_t obfuscatedPointer(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = obfuscatedPointer_salt;
    if (!obfuscatedPointer_salt)
    {
      uint64_t v2 = random();
      obfuscatedPointer_salt = v2;
    }
    return v1 + v2;
  }
  return result;
}

BOOL getMemoryUse(void *a1, void *a2, void *a3)
{
  kern_return_t v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  int v33;

  long long v33 = -1431655766;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v31 = v6;
  long long v32 = v6;
  long long v29 = v6;
  long long v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  uint64_t v21 = v6;
  v22 = v6;
  uint64_t v19 = v6;
  uint64_t v20 = v6;
  uint64_t v18 = v6;
  int v16 = v6;
  id v17 = v6;
  uint64_t v14 = v6;
  uint64_t v15 = v6;
  char v12 = v6;
  size_t v13 = v6;
  *(_OWORD *)task_info_out = v6;
  size_t v11 = v6;
  task_info_outCnt = 93;
  char v7 = task_info(*MEMORY[0x263EF8960], 0x16u, task_info_out, &task_info_outCnt);
  if (!v7)
  {
    if (a1) {
      *a1 = v11;
    }
    if (a2) {
      *a2 = *(void *)task_info_out;
    }
    if (a3) {
      *a3 = v19;
    }
  }
  return v7 == 0;
}

uint64_t init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  return MEMORY[0x270F0A4F8]();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_2269CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void ACCGetOSVersion_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2269CB000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v0, 0x12u);
}

void ACCMediaLibraryShimUIDString_cold_1()
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x270F4A050]();
}

uint64_t MRMediaRemoteSetAppPlaybackQueue()
{
  return MEMORY[0x270F4A070]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x270F4A210]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x270F4A228]();
}

uint64_t MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback()
{
  return MEMORY[0x270F4A230]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryData()
{
  return MEMORY[0x270F4A260]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID()
{
  return MEMORY[0x270F4A268]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
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

uint64_t acc_strings_bundle()
{
  return MEMORY[0x270F18A28]();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}