uint64_t sub_213C0280C()
{
  void *v0;
  uint64_t v1;
  v1 = ;

  return v1;
}

void sub_213C05B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_213C06610(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213C0DC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C0DFE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213C0E28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C0E6F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213C0EC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C0F608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_213C10DD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213C12198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_213C14788(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
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

void sub_213C15D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CDVPLog(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CDVPLogV(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a1;
  id v9 = +[CoreDAVLogging sharedLogging];
  [v9 logDiagnosticForProvider:v8 withLevel:a2 format:v7 args:a4];
}

void CDVLog(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

CFTypeRef _CoreDAVSecCopyIdentityFromPersist(CFTypeRef a1)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  if (a1)
  {
    v1 = (void *)*MEMORY[0x263F175B0];
    keys[0] = *(void **)MEMORY[0x263F17530];
    keys[1] = v1;
    values[0] = *(void **)MEMORY[0x263EFFB40];
    values[1] = (void *)a1;
    CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, 0, 0);
    CFTypeRef result = 0;
    OSStatus v3 = SecItemCopyMatching(v2, &result);
    if (v2) {
      CFRelease(v2);
    }
    if (v3)
    {
      v4 = +[CoreDAVLogging sharedLogging];
      v5 = [v4 logHandleForAccountInfoProvider:0];
      v6 = v5;
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          OSStatus v9 = v3;
          _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_ERROR, "Could not find identity for persistent ref. %d", buf, 8u);
        }
      }
    }
    return result;
  }
  return a1;
}

uint64_t _CoreDAVSecDeleteIdentityByPersistentRef()
{
  v0 = +[CoreDAVLogging sharedLogging];
  v1 = [v0 logHandleForAccountInfoProvider:0];
  CFDictionaryRef v2 = v1;
  if (v1 && os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213BFC000, v2, OS_LOG_TYPE_ERROR, "Intentionally not deleting identity by persistent ref", v4, 2u);
  }

  return 0;
}

__CFArray *_CoreDAVSecIdentityCopySSLClientAuthenticationChain(void *a1)
{
  SecPolicyRef SSL = SecPolicyCreateSSL(0, 0);
  if (!SSL) {
    return 0;
  }
  SecPolicyRef v3 = SSL;
  SecCertificateRef certificateRef = 0;
  Mutable = 0;
  if (!SecIdentityCopyCertificate((SecIdentityRef)a1, &certificateRef))
  {
    v5 = [MEMORY[0x263EFF980] arrayWithObject:certificateRef];
    CFRelease(certificateRef);
    SecTrustRef trust = 0;
    Mutable = 0;
    if (!SecTrustCreateWithCertificates(v5, v3, &trust))
    {
      int v12 = 0;
      if (MEMORY[0x216693C00](trust, &v12))
      {
        Mutable = 0;
      }
      else
      {
        uint64_t CertificateCount = SecTrustGetCertificateCount(trust);
        Mutable = CFArrayCreateMutable(0, CertificateCount, MEMORY[0x263EFFF70]);
        CFArrayAppendValue(Mutable, a1);
        uint64_t v7 = CertificateCount - 2;
        if (CertificateCount >= 2)
        {
          uint64_t v8 = 0;
          uint64_t v9 = CertificateCount - 1;
          do
          {
            if (v7 != v8 || v12 != 4)
            {
              SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, v8 + 1);
              CFArrayAppendValue(Mutable, CertificateAtIndex);
            }
            ++v8;
          }
          while (v9 != v8);
        }
      }
      CFRelease(trust);
    }
  }
  CFRelease(v3);
  return Mutable;
}

uint64_t CalDAVServerSimulatorLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  SecPolicyRef v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CalDAVServerSimulatorLibraryCore_frameworkLibrary;
  uint64_t v5 = CalDAVServerSimulatorLibraryCore_frameworkLibrary;
  if (!CalDAVServerSimulatorLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_2641DFE48;
    long long v7 = *(_OWORD *)&off_2641DFE58;
    v3[3] = _sl_dlopen();
    CalDAVServerSimulatorLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_213C19850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CalDAVServerSimulatorLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CalDAVServerSimulatorLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CalDAVServerSimulatorLibrary()
{
  v1 = 0;
  uint64_t result = CalDAVServerSimulatorLibraryCore();
  if (!result) {
    CalDAVServerSimulatorLibrary_cold_1(&v1);
  }
  return result;
}

void sub_213C1AE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

Class __getCalDAVServerSimulatorClass_block_invoke(uint64_t a1)
{
  CalDAVServerSimulatorLibrary();
  Class result = objc_getClass("CalDAVServerSimulator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCalDAVServerSimulatorClass_block_invoke_cold_1();
  }
  getCalDAVServerSimulatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_213C26310(void *a1)
{
  return a1;
}

uint64_t CDVHTTPStatusCodeFromStatusLine(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = [v1 componentsSeparatedByString:@" "];
    if ((unint64_t)[v2 count] < 3)
    {
      uint64_t v4 = 0;
    }
    else
    {
      SecPolicyRef v3 = [v2 objectAtIndex:0];
      uint64_t v4 = 0;
      if ([v3 hasPrefix:@"HTTP/"])
      {
        uint64_t v5 = [v2 objectAtIndex:1];
        if ([v5 length] == 3)
        {
          uint64_t v6 = [v5 integerValue];
          if ((unint64_t)(v6 - 600) >= 0xFFFFFFFFFFFFFE0CLL) {
            uint64_t v4 = v6;
          }
          else {
            uint64_t v4 = 0;
          }
        }
        else
        {
          uint64_t v4 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL CDVHTTPStatusCodeRepresentsRedirection(uint64_t a1)
{
  return (unint64_t)(a1 - 300) < 0x64;
}

BOOL CDVHTTPStatusCodeRepresentsClientError(uint64_t a1)
{
  return (unint64_t)(a1 - 400) < 0x64;
}

BOOL CDVHTTPStatusCodeRepresentsServerError(uint64_t a1)
{
  return (unint64_t)(a1 - 500) < 0x64;
}

__CFString *CDVHTTPStatusCodeAsStatusString(uint64_t a1)
{
  if (a1 <= 299)
  {
    switch(a1)
    {
      case 200:
        Class result = @"OK";
        break;
      case 201:
        Class result = @"Created";
        break;
      case 202:
        Class result = @"Accepted";
        break;
      case 203:
        Class result = @"Non Authoritative Information";
        break;
      case 204:
        Class result = @"No Content";
        break;
      case 205:
        Class result = @"Reset Content";
        break;
      case 206:
        Class result = @"Partial Content";
        break;
      case 207:
        Class result = @"Multi-Status";
        break;
      default:
        if (a1 == 100)
        {
          Class result = @"Continue";
        }
        else if (a1 == 101)
        {
          Class result = @"Switching Protocols";
        }
        else
        {
LABEL_19:
          Class result = 0;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 400:
        Class result = @"Bad Request";
        break;
      case 401:
        Class result = @"Unauthorized";
        break;
      case 402:
        Class result = @"Payment Required";
        break;
      case 403:
        Class result = @"Forbidden";
        break;
      case 404:
        Class result = @"Not Found";
        break;
      case 405:
        Class result = @"Method Not Allowed";
        break;
      case 406:
        Class result = @"Not Acceptable";
        break;
      case 407:
        Class result = @"Proxy Authentication Required";
        break;
      case 408:
        Class result = @"Request Timeout";
        break;
      case 409:
        Class result = @"Conflict";
        break;
      case 410:
        Class result = @"Gone";
        break;
      case 411:
        Class result = @"Length Required";
        break;
      case 412:
        Class result = @"Precondition Failed";
        break;
      case 413:
        Class result = @"Request Entity Too Large";
        break;
      case 414:
        Class result = @"Request URI Too Long";
        break;
      case 415:
        Class result = @"Unsupported Media Type";
        break;
      case 416:
        Class result = @"Requested Range Not Satisfiable";
        break;
      case 417:
        Class result = @"Expectation Failed";
        break;
      case 418:
        Class result = @"I'm a teapot";
        break;
      case 419:
      case 420:
      case 421:
        goto LABEL_19;
      case 422:
        Class result = @"Unprocessable Entity";
        break;
      case 423:
        Class result = @"Locked";
        break;
      case 424:
        Class result = @"Failed Dependency";
        break;
      default:
        switch(a1)
        {
          case 500:
            Class result = @"Internal Server Error";
            break;
          case 501:
            Class result = @"Not Implemented";
            break;
          case 502:
            Class result = @"Bad Gateway";
            break;
          case 503:
            Class result = @"Service Unavailable";
            break;
          case 504:
            Class result = @"Gateway Timeout";
            break;
          case 505:
            Class result = @"HTTP Version Not Supported";
            break;
          case 507:
            Class result = @"Insufficient Storage";
            break;
          default:
            goto LABEL_19;
        }
        break;
    }
  }
  return result;
}

void CDVInheritedInitializerUsageDisallowed()
{
  id v0 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Initializing this class instance with an inherited initializer not allowed." userInfo:0];
  objc_exception_throw(v0);
}

void CDVAbstractMethod()
{
  id v0 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"This is an abstract method that should be implemented by subclasses." userInfo:0];
  objc_exception_throw(v0);
}

void CDVUnimplemented()
{
  id v0 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"This section is unimplemented." userInfo:0];
  objc_exception_throw(v0);
}

id CDVExtractValuesFromRedirectString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [v1 rangeOfString:@" "];
  if (v4)
  {
    uint64_t v5 = v3;
    uint64_t v6 = [v1 substringToIndex:v3];
    unint64_t v7 = [v1 length];
    if (v5 + 1 < v7) {
      unint64_t v8 = v5 + 1;
    }
    else {
      unint64_t v8 = v7;
    }
    uint64_t v9 = [v1 substringFromIndex:v8];
    [v2 setObject:v9 forKey:@"kCDVRedirectReasonKey"];
  }
  else
  {
    uint64_t v6 = objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length"));
  }
  v10 = [NSURL URLWithString:v6];
  [v2 setObject:v10 forKey:@"kCDVRedirectURLKey"];

  return v2;
}

id _systemVersionDict()
{
  if (_systemVersionDict_once != -1) {
    dispatch_once(&_systemVersionDict_once, &__block_literal_global_331);
  }
  id v0 = (void *)_systemVersionDict_versionDictionary;
  return v0;
}

void ___systemVersionDict_block_invoke()
{
  uint64_t v0 = _CFCopyServerVersionDictionary();
  id v1 = (void *)_systemVersionDict_versionDictionary;
  _systemVersionDict_versionDictionary = v0;

  if (!_systemVersionDict_versionDictionary)
  {
    uint64_t v2 = _CFCopySystemVersionDictionary();
    uint64_t v3 = _systemVersionDict_versionDictionary;
    _systemVersionDict_versionDictionary = v2;
    MEMORY[0x270F9A758](v2, v3);
  }
}

id CDVDefaultUserAgent()
{
  uint64_t v0 = (void *)CDVDefaultUserAgent__sUserAgentString;
  if (!CDVDefaultUserAgent__sUserAgentString)
  {
    id v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v2 = [v1 infoDictionary];
    uint64_t v3 = [v2 objectForKey:@"CFBundleVersion"];

    if (![(__CFString *)v3 length])
    {

      uint64_t v3 = @"1.0";
    }
    uint64_t v4 = _systemVersionDict();
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
    uint64_t v6 = [[NSString alloc] initWithFormat:@"CoreDAV/%@ (%@)", v3, v5];
    unint64_t v7 = (void *)CDVDefaultUserAgent__sUserAgentString;
    CDVDefaultUserAgent__sUserAgentString = v6;

    uint64_t v0 = (void *)CDVDefaultUserAgent__sUserAgentString;
  }
  return v0;
}

id CDVAppleClientInfoString()
{
  if (CDVAppleClientInfoString_gotVersionString != -1) {
    dispatch_once(&CDVAppleClientInfoString_gotVersionString, &__block_literal_global_344);
  }
  uint64_t v0 = (void *)CDVAppleClientInfoString__sVersionString;
  return v0;
}

void __CDVAppleClientInfoString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v1 = MGCopyAnswer();
  if (v1) {
    uint64_t v2 = (__CFString *)v1;
  }
  else {
    uint64_t v2 = @"UNKNOWN";
  }
  v23 = v0;
  [v0 appendFormat:@"<%@>", v2];
  CFRelease(v2);
  uint64_t v3 = MGCopyAnswer();
  uint64_t v4 = (__CFString *)MGCopyAnswer();
  uint64_t v5 = MGCopyAnswer();
  v25 = (void *)v3;
  id v26 = (id)v5;
  if (v5) {
    uint64_t v6 = (__CFString *)v5;
  }
  else {
    uint64_t v6 = @"UNKNOWN";
  }
  if (v3) {
    unint64_t v7 = (__CFString *)v3;
  }
  else {
    unint64_t v7 = @"UNKNOWN";
  }
  if (v4) {
    unint64_t v8 = v4;
  }
  else {
    unint64_t v8 = @"UNKNOWN";
  }
  [v0 appendFormat:@" <%@;%@;%@>", v6, v7, v8];
  v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v24 infoDictionary];
  uint64_t v10 = *MEMORY[0x263EFFB58];
  v11 = [v9 objectForKey:*MEMORY[0x263EFFB58]];
  uint64_t v12 = *MEMORY[0x263EFFAA0];
  v13 = [v9 objectForKey:*MEMORY[0x263EFFAA0]];
  v22 = [MEMORY[0x263F086E0] mainBundle];
  v14 = [v22 infoDictionary];
  v15 = [v14 objectForKey:v10];
  v16 = [v14 objectForKey:v12];
  v17 = @"UNKNOWN";
  if ([(__CFString *)v11 length]) {
    v18 = v11;
  }
  else {
    v18 = @"UNKNOWN";
  }
  if ([(__CFString *)v13 length]) {
    v19 = v13;
  }
  else {
    v19 = @"1.0";
  }
  if ([(__CFString *)v15 length]) {
    v17 = v15;
  }
  if ([(__CFString *)v16 length]) {
    v20 = v16;
  }
  else {
    v20 = @"1.0";
  }
  [v23 appendFormat:@" <%@/%@ (%@/%@)>", v18, v19, v17, v20];
  v21 = (void *)CDVAppleClientInfoString__sVersionString;
  CDVAppleClientInfoString__sVersionString = (uint64_t)v23;
}

id CDVRunLoopModesToPerformDelayedSelectorsIn()
{
  id v0 = [MEMORY[0x263EFF9F0] currentRunLoop];
  uint64_t v1 = CDVRunLoopModesToPerformDelayedSelectorsInFromRunLoop(v0);

  return v1;
}

id CDVRunLoopModesToPerformDelayedSelectorsInFromRunLoop(void *a1)
{
  uint64_t v1 = [a1 currentMode];
  uint64_t v2 = v1;
  uint64_t v3 = *MEMORY[0x263EFF478];
  if (v1 && ![v1 isEqualToString:*MEMORY[0x263EFF478]])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, v2, 0);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObject:v3];
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

void initializeLibXMLParser()
{
  if (initializeLibXMLParser_didInitializeXMLParser != -1) {
    dispatch_once(&initializeLibXMLParser_didInitializeXMLParser, &__block_literal_global_372);
  }
}

id CDVCleanedStringsFromResponseHeaders(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v16 = a2;
  uint64_t v4 = objc_msgSend(v3, "CDVObjectForKeyCaseInsensitive:");
  uint64_t v5 = [v4 lowercaseString];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 componentsSeparatedByString:@","];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        v14 = [v12 stringByTrimmingCharactersInSet:v13];

        if ([v14 length])
        {
          if (v9)
          {
            [v9 addObject:v14];
          }
          else
          {
            uint64_t v9 = [MEMORY[0x263EFF9C0] setWithObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id CDVRelativeOrderHeaderString()
{
  if (CDVRelativeOrderHeaderString_onceToken != -1) {
    dispatch_once(&CDVRelativeOrderHeaderString_onceToken, &__block_literal_global_381);
  }
  id v0 = (void *)CDVRelativeOrderHeaderString__sRelativeOrderString;
  return v0;
}

void __CDVRelativeOrderHeaderString_block_invoke()
{
  id v0 = (void *)CFPreferencesCopyAppValue(@"BehaviorOptions", @"com.apple.DataAccess.BehaviorOptions");
  if (v0)
  {
    id v4 = v0;
    uint64_t v1 = [v0 objectForKey:@"Use1DOrdering"];
    int v2 = [v1 BOOLValue];

    id v0 = v4;
    if (v2)
    {
      id v3 = (void *)CDVRelativeOrderHeaderString__sRelativeOrderString;
      CDVRelativeOrderHeaderString__sRelativeOrderString = @"After: ";

      id v0 = v4;
    }
  }
}

void ___logFormater_block_invoke()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v1 = [MEMORY[0x263EFF960] currentLocale];
  _logFormater___logFormatter = (uint64_t)CFDateFormatterCreate(v0, v1, kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);

  int v2 = (__CFDateFormatter *)_logFormater___logFormatter;
  if (_logFormater___logFormatter)
  {
    CFDateFormatterSetFormat(v2, @"yyyy-MM-dd HH:mm:ss.SSS");
  }
  else
  {
    id v3 = +[CoreDAVLogging sharedLogging];
    id v4 = [v3 logHandleForAccountInfoProvider:0];
    uint64_t v5 = v4;
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_213BFC000, v5, OS_LOG_TYPE_ERROR, "Could not create a date formatter", v6, 2u);
    }
  }
}

void sub_213C2BBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213C2D850()
{
  uint64_t v1 = ;

  return v1;
}

id sub_213C2DFA4(void *a1)
{
  return a1;
}

uint64_t sub_213C2E500()
{
  uint64_t v1 = ;

  return v1;
}

uint64_t sub_213C324F0()
{
  uint64_t v1 = ;

  return v1;
}

uint64_t sub_213C33D1C()
{
  uint64_t v1 = ;

  return v1;
}

uint64_t sub_213C48B30()
{
  uint64_t v1 = ;

  return v1;
}

void sub_213C4AD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C4B18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C4B558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C4BBE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213C4BF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_213C4CC20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C4D4F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_213C4D98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213C4DC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CalDAVServerSimulatorLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *CalDAVServerSimulatorLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CoreDAVTask.m", 28, @"%s", *a1);

  __break(1u);
}

void __getCalDAVServerSimulatorClass_block_invoke_cold_1()
{
  CFAllocatorRef v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCalDAVServerSimulatorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CoreDAVTask.m", 33, @"Unable to find class %s", "CalDAVServerSimulator");

  __break(1u);
  AnalyticsIsEventUsed();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x270F18A30]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4730](alloc);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x270EE4898](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

uint64_t CFURLRequestCopyHTTPCookieStorage()
{
  return MEMORY[0x270EE2968]();
}

uint64_t CFURLRequestCreateMutableCopy()
{
  return MEMORY[0x270EE2978]();
}

uint64_t CFURLRequestGetSSLProperties()
{
  return MEMORY[0x270EE2980]();
}

uint64_t CFURLRequestSetSSLProperties()
{
  return MEMORY[0x270EE2998]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x270EFDBB0](server, hostname);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x270EFDD70](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x270EFDD78](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x270EE55E0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CFHTTPCookieStorageCopyRequestHeaderFieldsForURL()
{
  return MEMORY[0x270EE29B0]();
}

uint64_t _CFURLCredentialCreateOAuth2()
{
  return MEMORY[0x270EE2A80]();
}

uint64_t _CFURLCredentialCreateXMobileMeAuthToken()
{
  return MEMORY[0x270EE2A88]();
}

uint64_t _CFURLRequestSetStorageSession()
{
  return MEMORY[0x270EE2AA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void bzero(void *a1, size_t a2)
{
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint64_t nw_array_apply()
{
  return MEMORY[0x270EF7A60]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x270EF7A88]();
}

uint64_t nw_endpoint_create_srv()
{
  return MEMORY[0x270EF7EC8]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F30](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F48](endpoint);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8518]();
}

uint64_t nw_resolver_cancel()
{
  return MEMORY[0x270EF93A8]();
}

uint64_t nw_resolver_create_srv_weighted_variant()
{
  return MEMORY[0x270EF9470]();
}

uint64_t nw_resolver_create_with_endpoint()
{
  return MEMORY[0x270EF9478]();
}

uint64_t nw_resolver_get_error()
{
  return MEMORY[0x270EF9488]();
}

uint64_t nw_resolver_set_cancel_handler()
{
  return MEMORY[0x270EF9490]();
}

uint64_t nw_resolver_set_update_handler()
{
  return MEMORY[0x270EF9498]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void xmlDocDumpFormatMemory(xmlDocPtr cur, xmlChar **mem, int *size, int format)
{
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
}

void xmlInitParser(void)
{
}

xmlTextWriterPtr xmlNewTextWriterDoc(xmlDocPtr *doc, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x270F9BEE0](doc, *(void *)&compression);
}

int xmlTextWriterEndAttribute(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C218](writer);
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C230](writer);
}

int xmlTextWriterFullEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C250](writer);
}

int xmlTextWriterStartAttributeNS(xmlTextWriterPtr writer, const xmlChar *prefix, const xmlChar *name, const xmlChar *namespaceURI)
{
  return MEMORY[0x270F9C268](writer, prefix, name, namespaceURI);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x270F9C280](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x270F9C288](writer, name);
}

int xmlTextWriterStartElementNS(xmlTextWriterPtr writer, const xmlChar *prefix, const xmlChar *name, const xmlChar *namespaceURI)
{
  return MEMORY[0x270F9C290](writer, prefix, name, namespaceURI);
}

int xmlTextWriterWriteCDATA(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x270F9C2B8](writer, content);
}

int xmlTextWriterWriteString(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x270F9C2E0](writer, content);
}