void *WeakLinkSymbol(const char *a1, unint64_t a2)
{
  void *result;
  uint64_t vars8;

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
      && (v4 = dlopen((const char *)[(__CFString *)off_26479D608[a1] UTF8String], 1)) != 0)
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
  v3 = a1;
  if (__HandleForSource(a2))
  {
    v4 = NSClassFromString(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id *WeakLinkStringConstant(const char *a1, unint64_t a2)
{
  v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    v3 = (id *)dlsym(v3, a1);
    if (v3) {
      v3 = (id *)*v3;
    }
  }
  return v3;
}

uint64_t __receivedNotification(uint64_t a1, void *a2)
{
  return [a2 update];
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
  v4 = [v3 defaultWorkspace];
  int v5 = [v4 applicationIsInstalled:v1];

  if (v5)
  {
    v6 = [v2 applicationProxyForIdentifier:v1];
    v7 = [v3 defaultWorkspace];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __IsAppVisibleInCurrentMode_block_invoke;
    v11[3] = &unk_26479D658;
    v13 = &v14;
    id v8 = v6;
    id v12 = v8;
    [v7 enumerateBundlesOfType:4 block:v11];
  }
  uint64_t v9 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

void sub_22632E5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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
        _os_log_impl(&dword_22632B000, v8, OS_LOG_TYPE_DEFAULT, "%s got non-string when querying key", buf, 0xCu);
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
    _os_log_impl(&dword_22632B000, v6, OS_LOG_TYPE_DEFAULT, "%s MG error: 0x%08x retrieving key:(%@)", buf, 0x1Cu);
  }

  uint64_t v5 = 0;
  v7 = 0;
  if (v1)
  {
LABEL_25:
    CFRelease(v1);
    v7 = (void *)v5;
  }
  return v7;
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
  BOOL v2 = "iapd.LoggingPreferencesChangedNotification";
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        id v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_22632B000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          id v8 = "<Undefined>";
        }
      }
      id v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        id v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          id v9 = "<Undefined>";
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
          __int16 v13 = v8;
          __int16 v14 = 2080;
          __int16 v15 = v9;
          _os_log_debug_impl(&dword_22632B000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = v8;
        __int16 v14 = 2080;
        __int16 v15 = v9;
        _os_log_error_impl(&dword_22632B000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    BOOL v2 = "com.apple.iapd.LoggingPreferencesChangedNotification" + 10;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 84);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_22632B000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
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
          __int16 v14 = v7;
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

  v33 = -1431655766;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  v21 = v6;
  v22 = v6;
  v19 = v6;
  v20 = v6;
  uint64_t v18 = v6;
  uint64_t v16 = v6;
  int v17 = v6;
  __int16 v14 = v6;
  __int16 v15 = v6;
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

id logObjectForModule()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      logObjectForModule_cold_1();
    }
    id v2 = (id)MEMORY[0x263EF8438];
    id v1 = MEMORY[0x263EF8438];
  }
  else
  {
    id v2 = *(id *)gLogObjects;
  }
  return v2;
}

void sub_226332130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226332448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2263327D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226332D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t convertTimeToMS(double a1)
{
  return [NSNumber numberWithUnsignedLong:(unint64_t)(a1 * 1000.0)];
}

void sub_226333B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226334548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double calculateCurrentElapsedTime(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  size_t v11 = [MEMORY[0x263EFF910] date];
  if (v7 && v10)
  {
    [v7 doubleValue];
    double v13 = v12;
    if (v9)
    {
      [v9 floatValue];
      double v15 = v14;
    }
    else
    {
      double v15 = 1.0;
    }
    [v11 timeIntervalSinceDate:v10];
    double v20 = v13 + v19 * v15;
    if (v20 >= 0.0) {
      double v18 = v20;
    }
    else {
      double v18 = 0.0;
    }
    if (v8)
    {
      [v8 doubleValue];
      if (v18 > v21 && v21 > 0.0) {
        double v18 = v21;
      }
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      uint64_t v16 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_22632B000, v16, OS_LOG_TYPE_INFO, "Cannot calculate currentElapsedTime without elapsedTime and timestamp!", (uint8_t *)&v26, 2u);
    }

    double v18 = 0.0;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v23 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    v23 = MEMORY[0x263EF8438];
    id v24 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138413570;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    v35 = v11;
    __int16 v36 = 2048;
    double v37 = v18;
    _os_log_debug_impl(&dword_22632B000, v23, OS_LOG_TYPE_DEBUG, "Calculated elapsedTime: %@, duration: %@, playbackRate: %@, timestamp: %@, currentTimestamp: %@ -> currentElapsedTime: %f", (uint8_t *)&v26, 0x3Eu);
  }

  return v18;
}

char *calculatePlaybackSpeed(void *a1, void *a2, int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  if (v6)
  {
    [v6 floatValue];
    float v9 = v8;
    if (v5)
    {
LABEL_3:
      [v5 floatValue];
      float v11 = v10;
      goto LABEL_24;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 1;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
      }
      float v14 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      float v14 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      calculatePlaybackSpeed_cold_5();
    }

    float v9 = 1.0;
    if (v5) {
      goto LABEL_3;
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    double v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    double v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    calculatePlaybackSpeed_cold_3();
  }

  float v11 = 1.0;
LABEL_24:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v17 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v17 = MEMORY[0x263EF8438];
    id v18 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v24 = "NO";
    *(_DWORD *)v25 = 134218498;
    *(double *)&v25[4] = v9;
    if (a3) {
      id v24 = "YES";
    }
    *(_WORD *)&v25[12] = 2048;
    *(double *)&v25[14] = v11;
    __int16 v26 = 2080;
    id v27 = v24;
    _os_log_debug_impl(&dword_22632B000, v17, OS_LOG_TYPE_DEBUG, "defaultRate: %f, rate: %f, isMusicApp: %s", v25, 0x20u);
  }

  if (v7) {
    float v19 = v9;
  }
  else {
    float v19 = v11;
  }
  objc_msgSend(NSNumber, "numberWithUnsignedShort:", (int)(float)(v19 * 100.0), *(_OWORD *)v25);
  double v20 = (char *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    double v21 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    double v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v25 = 134218498;
    *(double *)&v25[4] = v9;
    *(_WORD *)&v25[12] = 2048;
    *(double *)&v25[14] = v11;
    __int16 v26 = 2112;
    id v27 = v20;
    _os_log_debug_impl(&dword_22632B000, v21, OS_LOG_TYPE_DEBUG, "Converted defaultRate: %f, rate: %f -> playbackSpeed: %@", v25, 0x20u);
  }

  return v20;
}

id convertPlaybackStatus(int a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = 0;
  switch(a1)
  {
    case 1:
      uint64_t v8 = 1;
      break;
    case 2:
    case 4:
      goto LABEL_2;
    case 5:
      float v9 = 1.0;
      float v10 = 1.0;
      if (v6)
      {
        [v6 floatValue];
        float v10 = v11;
      }
      if (v5 && ([v5 floatValue], float v9 = v12, v12 == 0.0) && v10 != 0.0)
      {
LABEL_2:
        uint64_t v8 = 2;
      }
      else
      {
        if (v9 >= v10) {
          unsigned int v13 = 1;
        }
        else {
          unsigned int v13 = 4;
        }
        if (v9 <= v10) {
          uint64_t v8 = v13;
        }
        else {
          uint64_t v8 = 3;
        }
      }
      break;
    default:
      break;
  }
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects < 1;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v16 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  else
  {
    id v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    convertPlaybackStatus_cold_1(a1, v8, v16);
  }

  id v17 = [NSNumber numberWithInt:v8];

  return v17;
}

id convertRepeatMode(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    int v3 = [v1 intValue];
    if (v3 == 3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v3 == 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    convertRepeatMode_cold_1();
  }

  uint64_t v8 = [NSNumber numberWithInt:v4];

  return v8;
}

id convertShuffleMode(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    int v3 = [v1 intValue];
    if (v3 == 2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v3 == 3;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    convertShuffleMode_cold_1();
  }

  uint64_t v8 = [NSNumber numberWithInt:v4];

  return v8;
}

void sub_226337204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_2263398C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
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

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v5 length])
    {
      unint64_t v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, *(unsigned __int8 *)(v6 + v8++));
      while (v8 < [v5 length]);
    }
    uint64_t v9 = [NSString stringWithString:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  id v5 = [v4 componentsJoinedByString:&stru_26DA06AE8];

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = [MEMORY[0x263F08708] hexadecimalCharacterSet];
    id v3 = [v2 invertedSet];
    id v4 = [v1 componentsSeparatedByCharactersInSet:v3];
    id v5 = [v4 componentsJoinedByString:&stru_26DA06AE8];

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
    double v20 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v7];
    if (v8) {
      free(v8);
    }
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, void *a5)
{
  unint64_t v9 = a2;
  int v10 = [MEMORY[0x263EFF9C0] set];
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
    *a5 = [MEMORY[0x263EFFA08] setWithSet:v10];
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = (void *)MEMORY[0x263EFF9D0];
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
    id v1 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a1];
    if (v1)
    {
      uint64_t v5 = 0;
      id v2 = [MEMORY[0x263F08900] JSONObjectWithData:v1 options:0 error:&v5];
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
    id v3 = (id)MEMORY[0x263EFFA78];
  }
  if ([MEMORY[0x263F08900] isValidJSONObject:v3])
  {
    uint64_t v9 = 0;
    uint64_t v5 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v9];
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
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
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
        id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
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

uint64_t init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  return MEMORY[0x270F0A500]();
}

void ACCGetOSVersion_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22632B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v0, 0x12u);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_22632B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_22632B000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void calculatePlaybackSpeed_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_22632B000, v0, v1, "playbackRate is nil!", v2, v3, v4, v5, v6);
}

void calculatePlaybackSpeed_cold_5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_22632B000, v0, v1, "defaultPlaybackRate is nil!", v2, v3, v4, v5, v6);
}

void convertPlaybackStatus_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl(&dword_22632B000, log, OS_LOG_TYPE_DEBUG, "Converted playbackStateMR: %d -> playbackStatus: %{coreacc:ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_PlaybackStatus_t}d", (uint8_t *)v3, 0xEu);
}

void convertRepeatMode_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_22632B000, v0, v1, "Converted repeatModeMR: %@ -> repeatMode: %{coreacc:ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_RepeatMode_t}d");
}

void convertShuffleMode_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_22632B000, v0, v1, "Converted shuffleModeMR: %@ -> shuffleMode: %{coreacc:ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_ShuffleMode_t}d");
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
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

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return MEMORY[0x270F49E98]();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return MEMORY[0x270F49EB0]();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return MEMORY[0x270F49EB8]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x270F49F68]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x270F49F88]();
}

uint64_t MRMediaRemoteGetNowPlayingArtwork()
{
  return MEMORY[0x270F49F98]();
}

uint64_t MRMediaRemoteGetNowPlayingClientForOrigin()
{
  return MEMORY[0x270F49FA8]();
}

uint64_t MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork()
{
  return MEMORY[0x270F49FB8]();
}

uint64_t MRMediaRemoteGetSupportedCommands()
{
  return MEMORY[0x270F49FD0]();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return MEMORY[0x270F4A018]();
}

uint64_t MRMediaRemoteSetElapsedTime()
{
  return MEMORY[0x270F4A080]();
}

uint64_t MRMediaRemoteSetWantsSupportedCommandsChangedNotifications()
{
  return MEMORY[0x270F4A0A0]();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return MEMORY[0x270F4A0A8]();
}

uint64_t MRNowPlayingArtworkCopyImageData()
{
  return MEMORY[0x270F4A0B0]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x270F4A0C8]();
}

uint64_t MRNowPlayingClientGetDisplayName()
{
  return MEMORY[0x270F4A0D0]();
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

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
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

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

void free(void *a1)
{
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
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