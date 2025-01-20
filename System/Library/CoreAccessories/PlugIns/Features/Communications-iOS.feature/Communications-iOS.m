uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = +[ACCUserDefaults sharedDefaults];
  v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
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
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsLogging];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  return MEMORY[0x270F0A4E8]();
}

CFStringRef CFCreateUUIDString()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  CFStringRef v2 = CFUUIDCreateString(v0, v1);
  if (v1) {
    CFRelease(v1);
  }
  return v2;
}

CFStringRef CFArrayCreateRawValuesString(const __CFArray *a1, int a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppend(Mutable, @"{\n");
  v6.length = CFArrayGetCount(a1);
  if (a2) {
    v7 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    v7 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  v6.location = 0;
  CFArrayApplyFunction(a1, v6, v7, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

void _CFArraySetPrintRawValuesApplierFunctionHex(uint64_t a1, CFMutableStringRef theString)
{
}

void _CFArraySetPrintRawValuesApplierFunctionDecimal(uint64_t a1, CFMutableStringRef theString)
{
}

CFStringRef CFSetCreateRawValuesString(const __CFSet *a1, int a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    CFRange v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  CFSetApplyFunction(a1, v6, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFStringRef CFDictCreateRawKeyValueString(const __CFDictionary *a1, int a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v6 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionHex;
  }
  else {
    CFRange v6 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionDecimal;
  }
  CFDictionaryApplyFunction(a1, v6, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

void _CFDictPrintRawKeyValueApplierFunctionHex(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, @"\t%p = %p;\n", a1, a2);
}

void _CFDictPrintRawKeyValueApplierFunctionDecimal(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, @"\t%lu = %lu;\n", a1, a2);
}

__CFString *CFStringCreateFromCFData(const __CFData *a1, const __CFString *a2)
{
  if (!a1) {
    return &stru_26D8469B0;
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (Length >= 1)
  {
    do
    {
      unsigned int v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, a2, v8);
      --Length;
    }
    while (Length);
  }
  CFStringRef Copy = CFStringCreateCopy(v6, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return (__CFString *)Copy;
}

CFStringRef CFStringCreateFromFormat(uint64_t a1, const __CFString *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendFormat(Mutable, 0, a2, a1);
  CFStringRef Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFSetRef CFDictionaryGetKeys(const __CFDictionary *a1, int a2)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAllocatorRef v4 = a2 ? (const CFSetCallBacks *)MEMORY[0x263EFFFA0] : 0;
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v4);
  if (!Mutable) {
    return 0;
  }
  CFSetRef v6 = Mutable;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryApplierFunction_addKeyToMutableSet, Mutable);
  CFSetRef Copy = CFSetCreateCopy(v3, v6);
  CFRelease(v6);
  return Copy;
}

void CFDictionaryApplierFunction_addKeyToMutableSet(void *value, int a2, CFMutableSetRef theSet)
{
  if (value)
  {
    if (theSet) {
      CFSetAddValue(theSet, value);
    }
  }
}

char *createCStringFromCFString(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex bufferSize = 0;
  if (!a1) {
    return 0;
  }
  v9.length = CFStringGetLength(a1);
  v9.location = 0;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0, 0, &bufferSize);
  CFAllocatorRef v4 = (char *)malloc_type_malloc(++bufferSize, 0x4FF45A26uLL);
  int CString = CFStringGetCString(a1, v4, bufferSize, a2);
  if (v4) {
    BOOL v6 = CString == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    free(v4);
    return 0;
  }
  return v4;
}

void CFDictionaryApplierFunction_addValueToMutableDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict) {
      CFDictionaryAddValue(theDict, key, value);
    }
  }
}

void CFDictionaryApplierFunction_setValueInMutableDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict) {
      CFDictionarySetValue(theDict, key, value);
    }
  }
}

void CFSetApplierFunction_removeValueFromMutableDictionary(void *key, CFMutableDictionaryRef theDict)
{
}

void executeOnMainThreadSync(uint64_t a1)
{
  if (pthread_main_np())
  {
    CFStringRef v2 = *(void (**)(uint64_t))(a1 + 16);
    v2(a1);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __executeOnMainThreadSync_block_invoke;
    block[3] = &unk_264709840;
    block[4] = a1;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __executeOnMainThreadSync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void executeOnMainThreadAsync(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __executeOnMainThreadAsync_block_invoke;
  block[3] = &unk_264709868;
  block[4] = a1;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __executeOnMainThreadAsync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  void block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFStringRef v2 = &off_224EBA000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    BOOL v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      unsigned int v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        unsigned int v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_224EAC000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          unsigned int v8 = "<Undefined>";
        }
      }
      CFRange v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        CFRange v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          CFRange v9 = "<Undefined>";
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
          _os_log_debug_impl(&dword_224EAC000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_224EAC000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    CFStringRef v2 = &off_224EBA000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 351);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_224EAC000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
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
    CFRange v9 = [NSString stringWithString:v7];
  }
  else
  {
    CFRange v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  CFUUIDRef v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  CFUUIDRef v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  id v5 = [v4 componentsJoinedByString:&stru_26D8469B0];

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
    id v5 = [v4 componentsJoinedByString:&stru_26D8469B0];

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
    v20 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v7];
    if (v8) {
      free(v8);
    }
  }
  else
  {
    v20 = 0;
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
        result = (unsigned __int8 *)printf(a3, v8);
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
          long long v14 = v7;
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
      result = (char *)malloc_type_malloc(0xEuLL, 0xD85E358FuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }
  result = (char *)malloc_type_malloc(7uLL, 0x55AA73BCuLL);
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
  __int16 v22 = v6;
  unint64_t v19 = v6;
  v20 = v6;
  char v18 = v6;
  uint64_t v16 = v6;
  uint64_t v17 = v6;
  long long v14 = v6;
  long long v15 = v6;
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

void _CFNotificationCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    unsigned int v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    unsigned int v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    char v18 = a3;
    __int16 v19 = 2112;
    v20 = a5;
    _os_log_impl(&dword_224EAC000, v10, OS_LOG_TYPE_INFO, "CFNotification received: <name: %@, userInfo: %@>", (uint8_t *)&v17, 0x16u);
  }

  if (a2 && a3)
  {
    id v11 = a2;
    id v12 = a3;
    id v13 = a5;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      long long v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      long long v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      _CFNotificationCallback_cold_1();
    }

    uint64_t v16 = [MEMORY[0x263F089F8] notificationWithName:v12 object:0 userInfo:v13];
    [v11 commStatusDidChangeNotification:v16];
  }
}

id _callStateDictionaryForCall(void *a1)
{
  v87[12] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy_;
  v84 = __Block_byref_object_dispose_;
  id v85 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  int v79 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  int v75 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  id v71 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy_;
  v64 = __Block_byref_object_dispose_;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy_;
  v58 = __Block_byref_object_dispose_;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  id v53 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  int v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = ___callStateDictionaryForCall_block_invoke;
  v19[3] = &unk_264709A18;
  uint64_t v21 = &v80;
  id v18 = v1;
  id v20 = v18;
  __int16 v22 = &v76;
  v23 = &v72;
  v24 = &v66;
  v25 = &v60;
  v26 = &v54;
  v27 = &v44;
  v28 = &v48;
  v29 = &v40;
  v30 = &v36;
  v31 = &v32;
  executeOnMainThreadSync((uint64_t)v19);
  uint64_t v2 = v81[5];
  uint64_t v3 = *MEMORY[0x263F22CE8];
  v86[0] = *MEMORY[0x263F22D00];
  v86[1] = v3;
  uint64_t v4 = v55[5];
  v87[0] = v2;
  v87[1] = v4;
  v86[2] = *MEMORY[0x263F22D18];
  size_t v5 = [NSNumber numberWithInt:*((unsigned int *)v77 + 6)];
  v87[2] = v5;
  v86[3] = *MEMORY[0x263F22CD8];
  long long v6 = [NSNumber numberWithInt:*((unsigned int *)v73 + 6)];
  uint64_t v7 = *MEMORY[0x263F22CC8];
  uint64_t v8 = v67[5];
  v87[3] = v6;
  v87[4] = v8;
  uint64_t v9 = *MEMORY[0x263F22CC0];
  v86[4] = v7;
  v86[5] = v9;
  v87[5] = v61[5];
  v86[6] = *MEMORY[0x263F22CF8];
  v87[6] = v49[5];
  v86[7] = *MEMORY[0x263F22D08];
  unsigned int v10 = [NSNumber numberWithInt:*((unsigned int *)v45 + 6)];
  v87[7] = v10;
  v86[8] = *MEMORY[0x263F22CF0];
  id v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v41 + 24)];
  uint64_t v12 = *MEMORY[0x263F22CD0];
  v87[8] = v11;
  v87[9] = &unk_26D847600;
  uint64_t v13 = *MEMORY[0x263F22CE0];
  v86[9] = v12;
  v86[10] = v13;
  long long v14 = [NSNumber numberWithInt:*((unsigned int *)v37 + 6)];
  v87[10] = v14;
  v86[11] = *MEMORY[0x263F22D10];
  id v15 = [NSNumber numberWithLongLong:v33[3]];
  v87[11] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:12];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);

  return v16;
}

void sub_224EB1EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t _convertCTGradedSignalToCommSignal(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1 || ([v1 intValue] & 0x80000000) != 0)
  {
    uint64_t v3 = 0;
  }
  else if ((int)[v2 intValue] <= 5)
  {
    uint64_t v3 = [v2 intValue];
  }
  else
  {
    uint64_t v3 = 5;
  }

  return v3;
}

uint64_t _convertCTRegStatusToCommRegStatus(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && ([v1 isEqualToString:*MEMORY[0x263F03020]] & 1) == 0)
  {
    if ([v2 isEqualToString:*MEMORY[0x263F03000]])
    {
      uint64_t v3 = 1;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F03018]])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F02FF0]])
    {
      uint64_t v3 = 3;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F03008]])
    {
      uint64_t v3 = 4;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F03010]])
    {
      uint64_t v3 = 5;
    }
    else if ([v2 isEqualToString:*MEMORY[0x263F02FF8]])
    {
      uint64_t v3 = 6;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_224EB3BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_224EB3CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB3ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB41EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB4344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB4460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB4674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB4888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB579C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_224EB626C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_224EB6868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB6A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB6C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB70A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_224EB767C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224EB78BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id _recentCallsPredicate()
{
  v10[3] = *MEMORY[0x263EF8340];
  BOOL v0 = [MEMORY[0x263F30598] predicateForCallsWithAnyMediaTypes:&unk_26D847660];
  v10[0] = v0;
  uint64_t v1 = (void *)MEMORY[0x263F30598];
  uint64_t v2 = *MEMORY[0x263F30620];
  v9[0] = *MEMORY[0x263F30628];
  v9[1] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  uint64_t v4 = [v1 predicateForCallsWithAnyServiceProviders:v3];
  v10[1] = v4;
  size_t v5 = [MEMORY[0x263F30598] predicateForCallsWithRemoteParticipantCount:1];
  v10[2] = v5;
  long long v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];

  uint64_t v7 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v6];

  return v7;
}

__CFString *_overrideLabelForFaceTime(void *a1, int a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = v3;
  if (a2 == 3)
  {
    TUBundle();
    size_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v6 = v5;
    uint64_t v7 = @"DIAL_CALL_FACETIME";
    goto LABEL_5;
  }
  if (a2 == 2)
  {
    TUBundle();
    size_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v6 = v5;
    uint64_t v7 = @"DIAL_CALL_FACETIME_AUDIO";
LABEL_5:
    uint64_t v8 = [(__CFString *)v5 localizedStringForKey:v7 value:&stru_26D8469B0 table:@"TelephonyUtilities"];

    uint64_t v4 = v6;
    goto LABEL_9;
  }
  uint64_t v9 = &stru_26D8469B0;
  if (v3) {
    uint64_t v9 = v3;
  }
  uint64_t v8 = v9;
LABEL_9:

  return v8;
}

void ___callStateDictionaryForCall_block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) handle];
  uint64_t v3 = [v2 value];
  uint64_t v4 = (void *)v3;
  if (v3) {
    size_t v5 = (__CFString *)v3;
  }
  else {
    size_t v5 = &stru_26D8469B0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);

  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = v6;
  if (v6)
  {
    switch([v6 status])
    {
      case 1u:
        if ([v7 isScreening]) {
          goto LABEL_7;
        }
        if ([v7 isConnected]) {
          int v8 = 4;
        }
        else {
          int v8 = 3;
        }
        break;
      case 2u:
        int v8 = 5;
        break;
      case 3u:
        int v8 = 1;
        break;
      case 4u:
        int v8 = 2;
        break;
      case 5u:
        int v8 = 6;
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    int v8 = 0;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  if ([*(id *)(a1 + 32) isOutgoing]) {
    int v9 = 2;
  }
  else {
    int v9 = 1;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
  uint64_t v10 = [*(id *)(a1 + 32) callUUID];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = &stru_26D8469B0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v12);

  uint64_t v13 = [*(id *)(a1 + 32) contactIdentifier];
  long long v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_26D8469B0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v15);

  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = [v16 displayName];
    if ([v17 isConferenced])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        __int16 v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        __int16 v19 = MEMORY[0x263EF8438];
        id v20 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        ___callStateDictionaryForCall_block_invoke_cold_1(v17);
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v21 = objc_msgSend(MEMORY[0x263F7E1A0], "sharedInstance", 0);
      __int16 v22 = [v21 currentCallGroups];

      uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v50 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            v28 = [v27 calls];
            int v29 = [v28 containsObject:v17];

            if (v29)
            {
              uint64_t v30 = [v27 displayName];

              id v18 = (void *)v30;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v24);
      }
    }
  }
  else
  {
    id v18 = 0;
  }

  uint64_t v31 = removeBidirectionalUnicodeCharacters(v18);
  uint64_t v32 = (void *)v31;
  if (v31) {
    v33 = (__CFString *)v31;
  }
  else {
    v33 = &stru_26D8469B0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v33);

  id v34 = *(id *)(a1 + 32);
  uint64_t v35 = v34;
  if (v34)
  {
    int v36 = [v34 service];
    if ((v36 - 1) >= 3) {
      int v37 = 0;
    }
    else {
      int v37 = v36;
    }
  }
  else
  {
    int v37 = 0;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v37;
  uint64_t v38 = [*(id *)(a1 + 32) localizedLabel];
  uint64_t v39 = _overrideLabelForFaceTime(v38, *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
  uint64_t v40 = *(void *)(*(void *)(a1 + 96) + 8);
  v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v39;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = [*(id *)(a1 + 32) isConferenced];
  id v42 = *(id *)(a1 + 32);
  char v43 = v42;
  if (v42)
  {
    int v44 = [v42 disconnectedReason];
    if ((v44 - 2) < 3)
    {
      int v45 = 1;
      goto LABEL_51;
    }
    int v45 = 2;
    if (v44 == 8 || v44 == 14) {
      goto LABEL_51;
    }
  }
  int v45 = 0;
LABEL_51:

  *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v45;
  uint64_t v46 = [*(id *)(a1 + 32) dateConnected];
  if (v46)
  {
    int v47 = [*(id *)(a1 + 32) dateConnected];
    [v47 timeIntervalSince1970];
    *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = (unint64_t)v48;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 0;
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_224EAC000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_224EAC000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void _CFNotificationCallback_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_224EAC000, v0, v1, "Converting CFNotification to NSNotification...", v2, v3, v4, v5, v6);
}

void ___callStateDictionaryForCall_block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 callUUID];
  OUTLINED_FUNCTION_7(&dword_224EAC000, v2, v3, "Call is conferenced, trying to find name of call group... (callUUID: %@)", v4, v5, v6, v7, 2u);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

uint64_t CTIndicatorsGetSignalStrength()
{
  return MEMORY[0x270EE8688]();
}

uint64_t CTRegistrationCopyOperatorName()
{
  return MEMORY[0x270EE86B0]();
}

uint64_t CTRegistrationGetStatus()
{
  return MEMORY[0x270EE86C8]();
}

uint64_t CTSIMSupportGetSIMStatus()
{
  return MEMORY[0x270EE86F0]();
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

uint64_t CTTelephonyCenterSetDefaultDispatchQueue()
{
  return MEMORY[0x270EE8740]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t TUBundle()
{
  return MEMORY[0x270F7CB18]();
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

uint64_t acc_strings_bundle()
{
  return MEMORY[0x270F18A28]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
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