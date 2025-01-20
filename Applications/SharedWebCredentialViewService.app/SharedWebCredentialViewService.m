uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100002AD8(CFIndex a1, const __CFString *a2, __CFString *cf, CFTypeRef *a4, CFStringRef format, va_list arguments)
{
  if (!a4) {
    return;
  }
  if (*a4)
  {
    if (cf && *a4 != cf)
    {
      CFRelease(cf);
    }
    return;
  }
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  uint64_t v28 = 0;
  if (!cf) {
    goto LABEL_30;
  }
  CFDictionaryRef v11 = CFErrorCopyUserInfo((CFErrorRef)cf);
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v11, kCFErrorDescriptionKey);
  if (Value)
  {
    BOOL v13 = CFEqual(v10, Value);
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v13 = 0;
  if (v11) {
LABEL_11:
  }
    CFRelease(v11);
LABEL_12:
  CFIndex Code = CFErrorGetCode((CFErrorRef)cf);
  CFStringRef Domain = CFErrorGetDomain((CFErrorRef)cf);
  CFComparisonResult v16 = CFStringCompare(a2, Domain, 0);
  BOOL v18 = Code == a1 && v16 == kCFCompareEqualTo && v13;
  v19 = cf;
  if (v18) {
    goto LABEL_19;
  }
  CFDictionaryRef v21 = CFErrorCopyUserInfo((CFErrorRef)cf);
  if (v21)
  {
    CFDictionaryRef v22 = v21;
    v23 = (const void *)kSOSCountKey;
    if (CFDictionaryContainsKey(v21, kSOSCountKey) == 1)
    {
      CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(v22, v23);
      if (v24)
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v24, kCFNumberLongType, &valuePtr);
        if (valuePtr > 199)
        {
          CFRelease(v22);
          v19 = cf;
LABEL_19:
          CFRetain(v19);
          *a4 = cf;
          CFRelease(cf);
          if (!v10) {
            return;
          }
          CFStringRef v20 = v10;
          goto LABEL_44;
        }
        uint64_t v28 = valuePtr + 1;
      }
    }
    CFRelease(v22);
  }
LABEL_30:
  CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v28);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v27 = Mutable;
  if (cf) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, cf);
  }
  if (v25) {
    CFDictionaryAddValue(v27, kSOSCountKey, v25);
  }
  if (v10) {
    CFDictionaryAddValue(v27, kCFErrorDescriptionKey, v10);
  }
  *a4 = CFErrorCreate(kCFAllocatorDefault, a2, a1, v27);
  if (v25) {
    CFRelease(v25);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (cf)
  {
    CFStringRef v20 = cf;
LABEL_44:
    CFRelease(v20);
  }
}

void sub_100002D88(CFIndex a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, CFStringRef format, ...)
{
  va_start(va, format);
  sub_100002AD8(a1, @"com.apple.security.swcagent", 0, a4, format, va);
}

void sub_100002DC4(uint64_t a1, __CFString **a2, CFStringRef format, ...)
{
  va_start(va, format);
  CFTypeRef cf = 0;
  if (a2)
  {
    sub_100002AD8(-50, kCFErrorDomainOSStatus, *a2, &cf, format, va);
    *a2 = (__CFString *)cf;
  }
  else
  {
    sub_100002AD8(-50, kCFErrorDomainOSStatus, 0, &cf, format, va);
    CFTypeRef v4 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v4);
    }
  }
}

uint64_t sub_100002E4C()
{
  if (!qword_10000DF30) {
    qword_10000DF30 = _sl_dlopen();
  }
  return qword_10000DF30;
}

void *sub_100002F1C(uint64_t a1)
{
  v2 = sub_100002F6C();
  result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000DF38 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100002F6C()
{
  uint64_t v0 = sub_100002E4C();
  if (v0) {
    return (void *)v0;
  }
  v1 = +[NSAssertionHandler currentHandler];
  v3 = +[NSString stringWithUTF8String:"void *CrashReporterSupportLibrary(void)"];
  [v1 handleFailureInFunction:v3 file:@"simulate_crash.m" lineNumber:18 description:@"%s"];

  __break(1u);
  free(v4);
  return v1;
}

uint64_t sub_10000301C()
{
  uint64_t result = _sl_dlopen();
  qword_10000DF30 = result;
  return result;
}

BOOL sub_100003090(void *a1, void *a2, __CFString **a3)
{
  size_t length = 0;
  if (xpc_dictionary_get_data(a1, "status", &length))
  {
    size_t v24 = 0;
    CFTypeRef cf = 0;
    data = xpc_dictionary_get_data(a1, "status", &v24);
    if (!data)
    {
      sub_100002DC4(0, a3, @"no object for key %s", "status");
      CFTypeRef v13 = 0;
LABEL_23:
      BOOL result = v13 != 0;
      goto LABEL_24;
    }
    size_t v7 = (size_t)data + v24;
    SecCFAllocatorZeroize();
    if (der_decode_plist() == v7)
    {
LABEL_22:
      cc_clear();
      CFTypeRef v13 = cf;
      goto LABEL_23;
    }
    v8 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"trailing garbage after der decoded object for key %s", "status");
    sub_100002DC4((uint64_t)v8, a3, @"%@", v8);
    if (a3)
    {
      v9 = secLogObjForScope();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v10 = *a3;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "xpc: %@", buf, 0xCu);
      }
    }
    CFDictionaryRef v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1405091842;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
    }

    int v12 = dword_10000DF28;
    if (dword_10000DF28 == -1)
    {
      if (sub_100002E4C())
      {
        uint64_t v15 = getpid();
        CFComparisonResult v16 = v8;
        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x2020000000;
        v17 = (void (*)(uint64_t, uint64_t, __CFString *))off_10000DF38;
        v29 = off_10000DF38;
        if (!off_10000DF38)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100002F1C;
          v31 = &unk_1000083C0;
          v32 = &v26;
          BOOL v18 = sub_100002F6C();
          v19 = dlsym(v18, "SimulateCrash");
          *(void *)(v32[1] + 24) = v19;
          off_10000DF38 = *(_UNKNOWN **)(v32[1] + 24);
          v17 = (void (*)(uint64_t, uint64_t, __CFString *))v27[3];
        }
        _Block_object_dispose(&v26, 8);
        if (!v17)
        {
          CFDictionaryRef v21 = +[NSAssertionHandler currentHandler];
          CFDictionaryRef v22 = +[NSString stringWithUTF8String:"BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"];
          [v21 handleFailureInFunction:v22 file:@"simulate_crash.m" lineNumber:22 description:@"%s" dlerror()];

          __break(1u);
        }
        v17(v15, 1405091842, v16);

        goto LABEL_18;
      }
      int v12 = dword_10000DF28;
    }
    dword_10000DF28 = v12 + 1;
LABEL_18:
    if (v8) {
      CFRelease(v8);
    }
    CFTypeRef v20 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v20);
    }
    goto LABEL_22;
  }
  CFTypeRef v13 = 0;
  BOOL result = 1;
LABEL_24:
  *a2 = v13;
  return result;
}

void sub_100003438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

xpc_object_t sub_100003458(xpc_object_t message, CFTypeRef *a2)
{
  if (qword_10000DF40 != -1) {
    dispatch_once(&qword_10000DF40, &stru_100008400);
  }
  CFTypeRef v4 = 0;
  v5 = (_xpc_connection_s *)qword_10000DF48;
  char v6 = 1;
  int v7 = -3;
  do
  {
    if ((v6 & 1) == 0) {
      xpc_release(v4);
    }
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v5, message);
    char v6 = 0;
    BOOL v9 = v8 != &_xpc_error_connection_interrupted || v7++ == 0;
    CFTypeRef v4 = &_xpc_error_connection_interrupted;
  }
  while (!v9);
  if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_error)
  {
    if (v8 == &_xpc_error_connection_invalid || v8 == &_xpc_error_connection_interrupted) {
      CFIndex v11 = 3;
    }
    else {
      CFIndex v11 = 4;
    }
    int v12 = xpc_copy_description(v5);
    string = xpc_dictionary_get_string(v8, _xpc_error_key_description);
    sub_100002D88(v11, v14, v15, a2, v16, @"%s: %s", v12, string);
    free(v12);
    xpc_release(v8);
    return 0;
  }
  return v8;
}

void sub_100003588(id a1)
{
  mach_service = xpc_connection_create_mach_service("com.apple.security.swcagent", 0, 0);
  xpc_connection_set_event_handler(mach_service, &stru_100008440);
  xpc_connection_resume(mach_service);
  qword_10000DF48 = (uint64_t)mach_service;
}

void sub_1000035D8(id a1, void *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
  v3 = secLogObjForScope();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "got event: %s", (uint8_t *)&v4, 0xCu);
  }
}

xpc_object_t sub_100003690(unsigned int a1, CFTypeRef *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v8 = v4;
  if (v4) {
    xpc_dictionary_set_uint64(v4, "operation", a1);
  }
  else {
    sub_100002D88(3, v5, v6, a2, v7, @"xpc_dictionary_create returned NULL");
  }
  return v8;
}

BOOL sub_100003704(void *a1, uint64_t *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, "error");
  xpc_object_t v4 = value;
  if (a2 && value) {
    *a2 = SecCreateCFErrorWithXPCObject();
  }
  return v4 == 0;
}

BOOL sub_100003750(const void *a1, uint64_t a2, CFTypeRef *a3)
{
  xpc_object_t v6 = sub_100003690(6u, a3);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_dictionary_set_data(v6, "client", a1, 0x20uLL);
    if (a2)
    {
      size_t v9 = der_sizeof_plist();
      if (v9)
      {
        size_t v10 = v9;
        CFIndex v11 = (char *)malloc_type_malloc(v9, 0x91A96E61uLL);
        int v12 = &v11[v10];
        CFTypeRef v13 = (char *)der_encode_plist_repair();
        if (v13 && v12 > v13)
        {
          xpc_dictionary_set_data(v7, "query", v13, v12 - v13);
          free(v11);
          xpc_object_t v14 = sub_100003458(v7, a3);
          if (v14)
          {
            uint64_t v15 = v14;
            int valuePtr = -1;
            CFTypeRef cf = 0;
            if (!sub_100003704(v14, (uint64_t *)a3)) {
              goto LABEL_22;
            }
            if (!sub_100003090(v15, &cf, (__CFString **)a3)) {
              goto LABEL_22;
            }
            CFTypeRef v16 = cf;
            if (!cf) {
              goto LABEL_22;
            }
            CFTypeID v17 = CFGetTypeID(cf);
            if (v17 == CFBooleanGetTypeID())
            {
              int v18 = CFEqual(v16, kCFBooleanTrue) != 0;
            }
            else
            {
              if (v17 != CFNumberGetTypeID() || CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &valuePtr)) {
                goto LABEL_21;
              }
              int v18 = -1;
            }
            int valuePtr = v18;
LABEL_21:
            CFRelease(v16);
LABEL_22:
            BOOL v19 = valuePtr != 0;
            xpc_release(v15);
            goto LABEL_17;
          }
        }
        else
        {
          free(v11);
        }
      }
    }
    else
    {
      sub_100002DC4(v8, (__CFString **)a3, @"object for key %s is NULL", "query");
    }
    BOOL v19 = 0;
LABEL_17:
    xpc_release(v7);
    return v19;
  }
  return 0;
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SecCFAllocatorZeroize()
{
  return _SecCFAllocatorZeroize();
}

uint64_t SecCreateCFErrorWithXPCObject()
{
  return _SecCreateCFErrorWithXPCObject();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t cc_clear()
{
  return _cc_clear();
}

uint64_t der_decode_plist()
{
  return _der_decode_plist();
}

uint64_t der_encode_plist_repair()
{
  return _der_encode_plist_repair();
}

uint64_t der_sizeof_plist()
{
  return _der_sizeof_plist();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

uint64_t secLogObjForScope()
{
  return _secLogObjForScope();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
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

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_opaqueSeparatorColor(void *a1, const char *a2, ...)
{
  return [a1 opaqueSeparatorColor];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_selectedBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 selectedBackgroundView];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}