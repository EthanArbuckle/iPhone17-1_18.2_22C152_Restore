void handleNotification(int a1, void *a2, CFStringRef theString1)
{
  id v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void v13[4];
  id v14;
  void block[4];
  id v16;

  if (CFStringCompare(theString1, @"com.apple.coreaccessories.AcctoolTestGetTime", 0))
  {
    if (CFStringCompare(theString1, @"com.apple.coreaccessories.AcctoolTestSendTime", 0)) {
      return;
    }
    v5 = a2;
    v6 = [v5 daemonCore];
    v7 = [v6 workloop];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __handleNotification_block_invoke_5;
    v13[3] = &unk_C518;
    v8 = &v14;
    v14 = v5;
    v9 = v5;
    v10 = v13;
  }
  else
  {
    v11 = a2;
    v6 = [v11 daemonCore];
    v7 = [v6 workloop];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __handleNotification_block_invoke;
    block[3] = &unk_C518;
    v8 = &v16;
    v16 = v11;
    v12 = v11;
    v10 = block;
  }
  dispatch_async(v7, v10);
}

id __handleNotification_block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Acctool requested a gettime", v3, 2u);
  }
  return [*(id *)(a1 + 32) _getTimeFromAccessory];
}

void __handleNotification_block_invoke_5(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Acctool requested a sendtime", v3, 2u);
  }
  v2 = [*(id *)(a1 + 32) daemonCore];
  [v2 testAndApplySystemTime];
}

void handleServerArrivedNotification(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 daemonCore];
  v4 = [v3 workloop];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __handleServerArrivedNotification_block_invoke;
  block[3] = &unk_C518;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, block);
}

id __handleServerArrivedNotification_block_invoke(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server arrived notification received. Attempting to connect...", (uint8_t *)v4, 2u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v2 = [*(id *)(a1 + 32) _connectToServer];
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "returning from connectToSErver: %d", (uint8_t *)v4, 8u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sync time with accessory", (uint8_t *)v4, 2u);
  }
  return [*(id *)(a1 + 32) _getTimeFromAccessory];
}

void sub_48B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

CFStringRef CFCreateUUIDString()
{
  CFUUIDRef v0 = CFUUIDCreate(kCFAllocatorDefault);
  CFStringRef v1 = CFUUIDCreateString(kCFAllocatorDefault, v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

CFStringRef CFArrayCreateRawValuesString(const __CFArray *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, @"{\n");
  v5.length = CFArrayGetCount(a1);
  if (a2) {
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  v5.location = 0;
  CFArrayApplyFunction(a1, v5, v6, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
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
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v5 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    CFRange v5 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  CFSetApplyFunction(a1, v5, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFStringRef CFDictCreateRawKeyValueString(const __CFDictionary *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v5 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionHex;
  }
  else {
    CFRange v5 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionDecimal;
  }
  CFDictionaryApplyFunction(a1, v5, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
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

CFStringRef CFStringCreateFromCFData(const __CFData *a1, const __CFString *a2)
{
  if (!a1) {
    return &stru_C888;
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Length >= 1)
  {
    do
    {
      unsigned int v7 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, a2, v7);
      --Length;
    }
    while (Length);
  }
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFStringRef CFStringCreateFromFormat(uint64_t a1, const __CFString *a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, a2, a1);
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
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
  v3 = a2 ? &kCFTypeSetCallBacks : 0;
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, v3);
  if (!Mutable) {
    return 0;
  }
  CFSetRef v5 = Mutable;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryApplierFunction_addKeyToMutableSet, Mutable);
  CFSetRef Copy = CFSetCreateCopy(kCFAllocatorDefault, v5);
  CFRelease(v5);
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
  v4 = (char *)malloc_type_malloc(++bufferSize, 0x4FF45A26uLL);
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
    unsigned int v2 = *(void (**)(uint64_t))(a1 + 16);
    v2(a1);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = __executeOnMainThreadSync_block_invoke;
    block[3] = &unk_C620;
    void block[4] = a1;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t __executeOnMainThreadSync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void executeOnMainThreadAsync(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __executeOnMainThreadAsync_block_invoke;
  block[3] = &unk_C648;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t __executeOnMainThreadAsync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unint64_t sntp_timestamp_gettime()
{
  v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v3.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  if (clock_gettime(_CLOCK_REALTIME, &v3)) {
    sntp_timestamp_gettime_cold_1();
  }
  v3.tv_sec += 2208988800;
  unsigned int v0 = sntp_datestamp_from_timespec(v3.tv_sec);
  return sntp_timestamp_from_datestamp(v0, v1);
}

double create_sntp_request_payload@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(unsigned char *)a2 = 35;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = a1;
  *(void *)(a2 + 24) = a1;
  return result;
}

uint64_t create_sntp_time_payload@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(unsigned char *)a2 = 35;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = a1;
  *(void *)(a2 + 24) = a1;
  sntp_datestamp_from_double(a3);
  unint64_t v6 = sntp_timestamp_from_datestamp(v4, v5);
  uint64_t result = sntp_timestamp_to_shortstamp(v6);
  *(_DWORD *)(a2 + 8) = result;
  *(_DWORD *)(a2 + 12) = 1;
  return result;
}

double get_time_from_timespec(uint64_t *a1)
{
  return (double)*a1 + (double)(a1[1] / 0x3B9ACA00uLL) - kCFAbsoluteTimeIntervalSince1970;
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v3;
    unint64_t v6 = (unsigned __int8 *)[v5 bytes];
    id v7 = objc_alloc_init((Class)NSMutableString);
    if ([v5 length])
    {
      unint64_t v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, v6[v8++]);
      while (v8 < (unint64_t)[v5 length]);
    }
    CFRange v9 = +[NSString stringWithString:v7];
  }
  else
  {
    CFRange v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = a1;
  unsigned int v2 = +[NSCharacterSet characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v3 = [v1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  id v1 = a1;
  unsigned int v2 = +[NSCharacterSet characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v3 = [v1 componentsSeparatedByCharactersInSet:v2];

  id v4 = [v3 componentsJoinedByString:&stru_C888];

  return v4;
}

id convertNSStringToNSData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    unsigned int v2 = +[NSCharacterSet hexadecimalCharacterSet];
    id v3 = [v2 invertedSet];
    id v4 = [v1 componentsSeparatedByCharactersInSet:v3];
    id v5 = [v4 componentsJoinedByString:&stru_C888];

    id v1 = v5;
    unint64_t v6 = (const char *)[v1 UTF8String];
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
        unint64_t v19 = (unint64_t)[v1 length];
        int v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    v20 = +[NSData dataWithBytes:v8 length:v7];
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
  int v10 = +[NSMutableSet set];
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
    *a5 = +[NSSet setWithSet:v10];
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = a1;
  unsigned int v2 = +[NSNull null];
  id v3 = [v1 isEqual:v2];

  return (uint64_t)v3;
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

id isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return &dword_0 + 1;
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
    id v1 = +[NSData dataWithContentsOfFile:a1];
    if (v1)
    {
      uint64_t v5 = 0;
      id v2 = +[NSJSONSerialization JSONObjectWithData:v1 options:0 error:&v5];
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

id writeJSONFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4) {
    goto LABEL_7;
  }
  if (!v3) {
    id v3 = &__NSDictionary0__struct;
  }
  if (+[NSJSONSerialization isValidJSONObject:v3])
  {
    uint64_t v9 = 0;
    uint64_t v5 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:&v9];
    unint64_t v6 = v5;
    if (v9) {
      id v7 = 0;
    }
    else {
      id v7 = [v5 writeToFile:v4 atomically:1];
    }
  }
  else
  {
LABEL_7:
    id v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0, (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_alloc((Class)NSData);
        id v10 = objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (void)v12);
        if (v10) {
          [v2 addObject:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
  __int16 v22 = v6;
  unint64_t v19 = v6;
  v20 = v6;
  char v18 = v6;
  uint64_t v16 = v6;
  char v17 = v6;
  long long v14 = v6;
  long long v15 = v6;
  char v12 = v6;
  size_t v13 = v6;
  *(_OWORD *)task_info_out = v6;
  size_t v11 = v6;
  task_info_outCnt = 93;
  char v7 = task_info(mach_task_self_, 0x16u, task_info_out, &task_info_outCnt);
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

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  void block[4] = a3;
  void block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend_isEqual_;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      char v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        char v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          char v7 = "<Undefined>";
        }
      }
      unint64_t v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        unint64_t v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v15, v4, &v16);
          unint64_t v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          char v12 = v7;
          __int16 v13 = 2080;
          long long v14 = v8;
          _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        char v12 = v7;
        __int16 v13 = 2080;
        long long v14 = v8;
        _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    uint64_t v2 = objc_msgSend_isEqual_;
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 143);
    LODWORD(v12) = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v10;
}

uint64_t sntp_shortstamp_hton(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t sntp_shortstamp_ntoh(unsigned int a1)
{
  return __rev16(a1);
}

unint64_t sntp_timestamp_hton(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_ntoh(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_from_shortstamp(int a1)
{
  return (unsigned __int16)a1 | ((unint64_t)HIWORD(a1) << 48);
}

uint64_t sntp_timestamp_to_shortstamp(uint64_t a1)
{
  return HIDWORD(a1) & 0xFFFF0000 | (unsigned __int16)a1;
}

uint64_t sntp_timestamp_to_datestamp(uint64_t result)
{
  return result;
}

unint64_t sntp_timestamp_from_datestamp(unsigned int a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFF00000000 | a1;
}

uint64_t sntp_datestamp_to_nsec(unint64_t a1, unint64_t a2)
{
  return 1000000000 * a1
       + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
       + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64);
}

uint64_t sntp_datestamp_subsecs_to_nsec(unint64_t a1)
{
  uint64_t v1 = (a1 * (unsigned __int128)0x3B9ACA00uLL) >> 64;
  if (1000000000 * a1 < 0x8000000000000000) {
    return v1;
  }
  else {
    return (v1 + 1);
  }
}

uint64_t sntp_datestamp_to_timespec(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

uint64_t sntp_datestamp_from_timespec(uint64_t a1)
{
  return a1;
}

uint64_t sntp_datestamp_to_timeval(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

double sntp_datestamp_to_double(uint64_t a1, unint64_t a2)
{
  return (double)a2 * 5.42101086e-20 + (double)a1;
}

double sntp_datestamp_from_double(double a1)
{
  return a1 - (double)(uint64_t)a1;
}

uint64_t sntp_calc_offset(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  uint64_t v11 = v10;
  uint64_t v12 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  unsigned long long v14 = __PAIR128__(v5 - (v4 != 0) + __CFADD__(-v4, v8) + v6 + (unint64_t)__CFADD__(v8 - v4, v11) + v9, v8 - v4 + v11)- v13;
  return (__CFADD__((void)v14, (unint64_t)(*((void *)&v14 + 1) - v12) >> 63) + *((void *)&v14 + 1) - v12) >> 1;
}

uint64_t sntp_calc_delay(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  unint64_t v11 = v10;
  uint64_t v12 = -v9;
  uint64_t v13 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  return v13
       + ((__PAIR128__(v5 - (v4 != 0) + (unint64_t)__CFADD__(-v4, v8) + v6, v8 - v4) - v11 + __PAIR128__(v12, v14)) >> 64);
}

uint64_t sntp_calc_mean(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v4 = v3;
  uint64_t v5 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  if (__CFADD__(v4, v6)) {
    uint64_t v7 = v2 + 1;
  }
  else {
    uint64_t v7 = v2;
  }
  return (uint64_t)((__PAIR128__(v7, v4 + v6) + __PAIR128__(v5, (v2 + (unint64_t)__CFADD__(v4, v6) + v5) >> 63)) >> 64) >> 1;
}

uint64_t sntp_calc_error(uint64_t a1)
{
  unint64_t v2 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 40));
  unint64_t v3 = sntp_timestamp_to_datestamp(v2);
  uint64_t v5 = v4;
  unint64_t v6 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 44));
  uint64_t v7 = sntp_timestamp_to_datestamp(v6);
  if (__CFADD__(v5, v3 >> 63)) {
    unint64_t v9 = v3 + 1;
  }
  else {
    unint64_t v9 = v3;
  }
  *((void *)&v10 + 1) = v9;
  *(void *)&long long v10 = v5 + (v3 >> 63);
  return ((v10 >> 1) + __PAIR128__(v7, v8)) >> 64;
}

unint64_t sntp_clock_select(unint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v2 = a1;
  unsigned int v3 = 0;
  unint64_t v4 = a1 + 80 * a2;
  unint64_t v5 = a1;
  do
  {
    if (!*(_DWORD *)v5 && *(unsigned char *)(v5 + 37)) {
      ++v3;
    }
    v5 += 80;
  }
  while (v5 < v4);
  unint64_t result = 0;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  unsigned int v31 = v3 >> 1;
  do
  {
    if (!*(_DWORD *)v2 && *(unsigned char *)(v2 + 37))
    {
      uint64_t v32 = v8;
      unint64_t v33 = v7;
      unint64_t v34 = result;
      uint64_t v9 = sntp_calc_delay(v2);
      long long v10 = (_DWORD *)(v2 + 80);
      unint64_t v37 = v11;
      if (v2 + 80 >= v4)
      {
        unsigned int v36 = 1;
        unint64_t v35 = v2;
      }
      else
      {
        unsigned int v36 = 1;
        unint64_t v35 = v2;
        do
        {
          if (!*v10)
          {
            uint64_t v12 = sntp_calc_offset(v2);
            unint64_t v14 = v13;
            uint64_t v15 = sntp_calc_offset((uint64_t)v10);
            unint64_t v17 = v16;
            uint64_t v18 = sntp_calc_delay(v2);
            unint64_t v20 = v19;
            uint64_t v21 = sntp_calc_delay((uint64_t)v10);
            if ((__int128)(__PAIR128__(v18, v20) + __PAIR128__(v12, v14)) >= (__int128)(__PAIR128__(v15, v17)
                                                                                       - __PAIR128__(v21, v22))
              && (__int128)(__PAIR128__(v21, v22) + __PAIR128__(v15, v17)) >= (__int128)(__PAIR128__(v12, v14)
                                                                                       - __PAIR128__(v18, v20)))
            {
              ++v36;
              uint64_t v23 = sntp_calc_delay((uint64_t)v10);
              unint64_t v25 = v37;
              v26 = (_DWORD *)v35;
              if ((__int128)__PAIR128__(v23, v24) < (__int128)__PAIR128__(v9, v37)) {
                v26 = v10;
              }
              unint64_t v35 = (unint64_t)v26;
              if ((__int128)__PAIR128__(v23, v24) < (__int128)__PAIR128__(v9, v37))
              {
                uint64_t v9 = v23;
                unint64_t v25 = v24;
              }
              unint64_t v37 = v25;
            }
          }
          v10 += 20;
        }
        while ((unint64_t)v10 < v4);
      }
      uint64_t v8 = v32;
      unint64_t v7 = v33;
      unint64_t v27 = v37;
      unint64_t result = v34;
      unint64_t v28 = v35;
      BOOL v29 = (__int128)__PAIR128__(v9, v37) < (__int128)__PAIR128__(v32, v33) || v34 == 0;
      if (v29) {
        uint64_t v30 = v9;
      }
      else {
        uint64_t v30 = v32;
      }
      if (!v29)
      {
        unint64_t v27 = v33;
        unint64_t v28 = v34;
      }
      if (v36 > v31)
      {
        unint64_t v7 = v27;
        uint64_t v8 = v30;
        unint64_t result = v28;
      }
    }
    v2 += 80;
  }
  while (v2 < v4);
  return result;
}

unint64_t sntp_packet_hton@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  long long v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_hton((int *)&v5, a2);
  *(void *)(a2 + 24) = sntp_timestamp_hton(*((void *)a1 + 3));
  *(void *)(a2 + 32) = sntp_timestamp_hton(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_hton(*((void *)a1 + 5));
  *(void *)(a2 + 40) = result;
  return result;
}

unint64_t sntp_packet_ntoh@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  long long v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_ntoh((int *)&v5, a2);
  *(void *)(a2 + 24) = sntp_timestamp_ntoh(*((void *)a1 + 3));
  *(void *)(a2 + 32) = sntp_timestamp_ntoh(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 5));
  *(void *)(a2 + 40) = result;
  return result;
}

unint64_t sntp_header_hton@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_hton(v4);
  int v6 = sntp_shortstamp_hton(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_hton(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

unint64_t sntp_header_ntoh@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_ntoh(v4);
  int v6 = sntp_shortstamp_ntoh(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

void *sntp_header_mmap(const char *a1, uint64_t a2, int a3)
{
  int v6 = open(a1, 2);
  if (v6 < 0)
  {
    if (*__error() != 2 || (v8 = umask(0), int v7 = open(a1, 514, 436), umask(v8), v7 < 0))
    {
      warn("open");
      return 0;
    }
    unsigned int v9 = *(_DWORD *)(a2 + 8);
    unsigned int v10 = *(_DWORD *)(a2 + 12);
    unint64_t v11 = *(void *)(a2 + 16);
    unsigned int v12 = *(_DWORD *)(a2 + 4);
    __buf[0] = *(_DWORD *)a2;
    __buf[1] = sntp_shortstamp_hton(v12);
    __buf[2] = sntp_shortstamp_hton(v9);
    __buf[3] = bswap32(v10);
    unint64_t v17 = sntp_timestamp_hton(v11);
    if (write(v7, __buf, 0x18uLL) != 24)
    {
      warn("write");
      return 0;
    }
  }
  else
  {
    int v7 = v6;
    if (ftruncate(v6, 24))
    {
      warn("ftruncate");
      return 0;
    }
  }
  if (a3) {
    int v13 = 3;
  }
  else {
    int v13 = 1;
  }
  unint64_t v14 = mmap(0, 0x18uLL, v13, 1, v7, 0);
  if (v14 == (void *)-1)
  {
    warn("mmap");
    unint64_t v14 = 0;
  }
  if (close(v7)) {
    warn("close");
  }
  return v14;
}

void sntp_header_unmap(void *a1)
{
  if (munmap(a1, 0x18uLL))
  {
    warn("munmap");
  }
}

float sntp_precision_decode(int a1)
{
  LODWORD(result) = (a1 << 23) + 1065353216;
  return result;
}

unint64_t sntp_server_respond@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8 = a3();
  *(_OWORD *)a4 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a4 + 16) = *(void *)(a2 + 16);
  *(void *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = sntp_timestamp_hton(v8);
  unint64_t v10 = a3();
  unint64_t result = sntp_timestamp_hton(v10);
  *(void *)(a4 + 40) = result;
  if (__ROR8__(v10, 32) < __ROR8__(v8, 32))
  {
    *(unsigned char *)(a4 + 1) = 0;
    *(_DWORD *)(a4 + 12) = 1398031696;
  }
  return result;
}

uint64_t sntp_server_exchange@<X0>(sockaddr *a1@<X1>, socklen_t *a2@<X2>, int a3@<W0>, long long *a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X8>)
{
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  if (!a5) {
    sntp_server_exchange_cold_1();
  }
  long long v23 = 0uLL;
  long long v24 = 0uLL;
  long long v22 = 0uLL;
  uint64_t result = recvfrom(a3, &v22, 0x30uLL, 64, a1, a2);
  if (result == 48)
  {
    if (a1 && a2)
    {
      socklen_t v13 = *a2;
      int sa_family = a1->sa_family;
      *(_DWORD *)(a6 + 76) = sa_family;
      if (v13 == 16 && sa_family == 2)
      {
        *(_DWORD *)(a6 + 60) = *(_DWORD *)&a1->sa_data[2];
      }
      else if (v13 == 28 && sa_family == 30)
      {
        *(sockaddr *)(a6 + 60) = *(sockaddr *)&a1->sa_data[6];
      }
    }
    long long v21 = 0u;
    v19[0] = v22;
    v19[1] = v23;
    v19[2] = v24;
    memset(v20, 0, sizeof(v20));
    long long v17 = *a4;
    uint64_t v18 = *((void *)a4 + 2);
    sntp_server_respond((uint64_t)v19, (uint64_t)&v17, a5, (uint64_t)v20);
    if (a2) {
      socklen_t v15 = *a2;
    }
    else {
      socklen_t v15 = 0;
    }
    if (sendto(a3, v20, 0x30uLL, 0, a1, v15) != 48) {
      *(_DWORD *)a6 = 5;
    }
    *(_OWORD *)(a6 + 36) = v22;
    unint64_t v16 = *((void *)&v24 + 1);
    *(void *)(a6 + 52) = v23;
    *(void *)(a6 + 4) = sntp_timestamp_ntoh(v16);
    *(void *)(a6 + 12) = sntp_timestamp_ntoh(v21);
    uint64_t result = sntp_timestamp_ntoh(*((unint64_t *)&v21 + 1));
    *(void *)(a6 + 20) = result;
  }
  else
  {
    *(_DWORD *)a6 = 7;
  }
  return result;
}

__n128 sntp_client_exchange@<Q0>(int a1@<W0>, timeval *a2@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  long long v19 = 0u;
  long long v20 = 0u;
  memset(v18, 0, sizeof(v18));
  memset(&v17, 0, sizeof(v17));
  if (__darwin_check_fd_set_overflow(a1, &v17, 0)) {
    *(__int32_t *)((char *)v17.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  long long v16 = 0u;
  memset(v15, 0, sizeof(v15));
  LOBYTE(v15[0]) = 35;
  if (a3)
  {
    *(void *)((char *)v18 + 4) = a3();
    *((void *)&v16 + 1) = sntp_timestamp_hton(*(unint64_t *)((char *)v18 + 4));
  }
  if (send(a1, v15, 0x30uLL, 0) != 48)
  {
    int v9 = 5;
LABEL_17:
    LODWORD(v18[0]) = v9;
    long long v10 = v19;
    *(_OWORD *)(a4 + 32) = v18[2];
    *(_OWORD *)(a4 + 48) = v10;
    *(_OWORD *)(a4 + 64) = v20;
    __n128 result = (__n128)v18[1];
    *(_OWORD *)a4 = v18[0];
    *(__n128 *)(a4 + 16) = result;
    return result;
  }
  if (a2 && (a2->tv_sec || a2->tv_usec) && select(a1 + 1, &v17, 0, &v17, a2) != 1)
  {
    int v9 = 6;
    goto LABEL_17;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  if (recv(a1, &v12, 0x30uLL, 0) != 48)
  {
    int v9 = 7;
    goto LABEL_17;
  }
  if (a3) {
    *(void *)((char *)&v18[1] + 12) = a3();
  }
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  sntp_client_process_response((unsigned __int8 *)v11, (unint64_t *)((char *)v18 + 4), (_OWORD *)((char *)&v18[1] + 12), a4);
  return result;
}

unint64_t sntp_client_process_response@<X0>(unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  if (a2)
  {
    unint64_t v8 = *a2;
    *(void *)(a4 + 4) = *a2;
    unint64_t v9 = HIDWORD(v8);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  LODWORD(v9) = 0;
  LODWORD(v8) = 0;
  if (a3) {
LABEL_3:
  }
    *(void *)(a4 + 28) = *a3;
LABEL_4:
  long long v10 = *((_OWORD *)a1 + 1);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v10;
  v16[2] = *((_OWORD *)a1 + 2);
  unint64_t result = sntp_packet_ntoh(v16, (uint64_t)v17);
  long long v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *((_OWORD *)a1 + 1) = v12;
  *((_OWORD *)a1 + 2) = v17[2];
  *(_OWORD *)(a4 + 36) = *(_OWORD *)a1;
  *(void *)(a4 + 52) = *((void *)a1 + 2);
  uint64_t v13 = *((void *)a1 + 4);
  uint64_t v14 = *((void *)a1 + 5);
  *(void *)(a4 + 12) = v13;
  *(void *)(a4 + 20) = v14;
  if (*a1 <= 0xBFu)
  {
    if (a1[1])
    {
      if (__ROR8__(v14, 32) >= __ROR8__(v13, 32))
      {
        if (a2)
        {
          if (*((_DWORD *)a1 + 6) != v8 || *((_DWORD *)a1 + 7) != v9)
          {
            int v15 = 10;
            goto LABEL_19;
          }
          if (a3)
          {
            unint64_t result = sntp_calc_delay(a4);
            if ((result & 0x8000000000000000) != 0)
            {
              int v15 = 11;
              goto LABEL_19;
            }
          }
        }
        int v15 = 0;
      }
      else
      {
        int v15 = 12;
      }
    }
    else
    {
      int v15 = 8;
    }
  }
  else
  {
    int v15 = 9;
  }
LABEL_19:
  *(_DWORD *)a4 = v15;
  return result;
}

void sntp_client_unicast(const char *a1@<X0>, unsigned int a2@<W1>, int a3@<W2>, timeval *a4@<X3>, uint64_t (*a5)(void)@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)a7 = 0u;
  snprintf(__str, 6uLL, "%u", a3);
  unint64_t v28 = 0;
  if (getaddrinfo(a1, __str, 0, &v28))
  {
    *(_DWORD *)a7 = 1;
    return;
  }
  if (!v28) {
    sntp_client_unicast_cold_1();
  }
  if (a2)
  {
    int v13 = 0;
    uint64_t v14 = v28;
    while (1)
    {
      uint64_t v14 = v14->ai_next;
      if (!v14) {
        break;
      }
      if (++v13 >= a2) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v14 = v28;
LABEL_10:
  ai_addr = v14->ai_addr;
  socklen_t ai_addrlen = v14->ai_addrlen;
  int ai_family = v14->ai_family;
  int sa_family = ai_addr->sa_family;
  *(_DWORD *)(a7 + 76) = sa_family;
  if (ai_addrlen == 16 && sa_family == 2)
  {
    *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
  }
  else if (ai_addrlen == 28 && sa_family == 30)
  {
    *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
  }
  int v21 = socket(ai_family, 2, 17);
  if (v21)
  {
    int v22 = v21;
    if (!a6) {
      goto LABEL_29;
    }
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    memset(v27, 0, 28);
    if (ai_family == 2)
    {
      uint64_t v30 = 2063598080;
      uint64_t v31 = 0;
      long long v23 = (sockaddr *)&v30;
      socklen_t v24 = 16;
    }
    else
    {
      memset(&v27[0].sa_data[2], 0, 24);
      *(sockaddr *)&v27[0].sa_data[6] = (sockaddr)in6addr_any;
      *(_DWORD *)&v27[0].sa_len = 2063605276;
      long long v23 = v27;
      socklen_t v24 = 28;
    }
    if (bind(v21, v23, v24))
    {
      int v25 = 3;
    }
    else
    {
LABEL_29:
      if (!connect(v22, ai_addr, ai_addrlen))
      {
        sntp_client_exchange(v22, a4, a5, a7);
        int v26 = ai_addr->sa_family;
        *(_DWORD *)(a7 + 76) = v26;
        if (ai_addrlen == 16 && v26 == 2)
        {
          *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
        }
        else if (ai_addrlen == 28 && v26 == 30)
        {
          *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
        }
        goto LABEL_32;
      }
      int v25 = 4;
    }
    *(_DWORD *)a7 = v25;
LABEL_32:
    close(v22);
    goto LABEL_33;
  }
  *(_DWORD *)a7 = 2;
LABEL_33:
  freeaddrinfo(v28);
}

void sntp_server_exchange_cold_1()
{
}

void sntp_client_unicast_cold_1()
{
}

void sntp_timestamp_gettime_cold_1()
{
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
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

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
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
  return _CFSetCreateCopy(allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t TMGetKernelMonotonicClock()
{
  return _TMGetKernelMonotonicClock();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

uint64_t __udivti3()
{
  return ___udivti3();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return _protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

int putchar(int a1)
{
  return _putchar(a1);
}

uint64_t random(void)
{
  return _random();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return _recvfrom(a1, a2, a3, a4, a5, a6);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

void warn(const char *a1, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return _xpc_data_get_bytes(xdata, buffer, off, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__addNotificationObservers(void *a1, const char *a2, ...)
{
  return [a1 _addNotificationObservers];
}

id objc_msgSend__connectToServer(void *a1, const char *a2, ...)
{
  return [a1 _connectToServer];
}

id objc_msgSend__getTimeFromAccessory(void *a1, const char *a2, ...)
{
  return [a1 _getTimeFromAccessory];
}

id objc_msgSend__sendClientArrivedToServer(void *a1, const char *a2, ...)
{
  return [a1 _sendClientArrivedToServer];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attemptConnect(void *a1, const char *a2, ...)
{
  return [a1 attemptConnect];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_daemonCore(void *a1, const char *a2, ...)
{
  return [a1 daemonCore];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_hexadecimalCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 hexadecimalCharacterSet];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isAutomaticTimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticTimeEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_machTime(void *a1, const char *a2, ...)
{
  return [a1 machTime];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_syncState(void *a1, const char *a2, ...)
{
  return [a1 syncState];
}

id objc_msgSend_testAndApplySystemTime(void *a1, const char *a2, ...)
{
  return [a1 testAndApplySystemTime];
}

id objc_msgSend_workloop(void *a1, const char *a2, ...)
{
  return [a1 workloop];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}