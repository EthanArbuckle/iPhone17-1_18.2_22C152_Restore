uint64_t start(int a1, char **a2)
{
  return UIApplicationMain(a1, a2, @"WebSheetAppDelegate", @"WebSheetAppDelegate");
}

id sub_100003DE4()
{
  v0 = +[UMUserManager sharedManager];
  id v1 = [v0 isMultiUser];

  return v1;
}

uint64_t sub_100003E24()
{
  return 0;
}

uint64_t sub_100003E60(id *a1, const __CFDictionary *a2, int a3)
{
  dword_10000D208 = a3;
  if (sub_100003DE4() || !sub_100003E24())
  {
    Value = CFDictionaryGetValue(a2, @"Interface");
    v6 = +[NSURL URLWithString:CFDictionaryGetValue(a2, @"ProbeURL")];
    v7 = CFDictionaryGetValue(a2, @"SSID");
    if (!Value || !v6 || (v8 = v7) == 0)
    {
      [UIApp terminateWithSuccess];
      uint64_t v19 = 0;
LABEL_32:

      return v19;
    }
    CFDictionaryRef v9 = CFDictionaryCreate(kCFAllocatorDefault, &kSCProxiesNoGlobal, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      uint64_t v11 = SCDynamicStoreCopyProxiesWithOptions();
      if (v11)
      {
        v12 = (const void *)v11;
        CFArrayRef v13 = (const __CFArray *)SCNetworkProxiesCopyMatching();
        if (v13)
        {
          CFArrayRef v14 = v13;
          if (CFArrayGetCount(v13) >= 1
            && (CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, 0)) != 0
            && (CFDictionaryRef v16 = ValueAtIndex, TypeID = CFDictionaryGetTypeID(), CFGetTypeID(v16) == TypeID))
          {
            CFDictionaryRef Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, v16);
          }
          else
          {
            CFDictionaryRef Copy = 0;
          }
          CFRelease(v14);
        }
        else
        {
          CFDictionaryRef Copy = 0;
        }
        CFRelease(v12);
      }
      else
      {
        CFDictionaryRef Copy = 0;
      }
      CFRelease(v10);
      if (!a1) {
        goto LABEL_24;
      }
    }
    else
    {
      CFDictionaryRef Copy = 0;
      if (!a1) {
        goto LABEL_24;
      }
    }
    [*a1 setInterfaceName:Value];
    [a1[1] startWithURL:v6 ssid:v8 interface:Value proxyConfiguration:Copy showCancelMenu:1 delegate:*a1];
LABEL_24:
    if (Copy) {
      CFRelease(Copy);
    }
    id v20 = objc_alloc((Class)SBSRemoteAlertDefinition);
    v21 = +[NSBundle mainBundle];
    v22 = [v21 bundleIdentifier];
    id v23 = [v20 initWithServiceName:v22 viewControllerClassName:@"WebSheetRemoteAlertPresentationViewController"];

    if (a1)
    {
      id v24 = +[SBSRemoteAlertHandle newHandleWithDefinition:v23 configurationContext:0];
      id v25 = a1[2];
      a1[2] = v24;
    }
    id v26 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    [v26 setReason:@"CaptiveWebSheet"];
    if (a1)
    {
      id v27 = a1[2];
      if (v27)
      {
        [v27 registerObserver:*a1];
        [a1[2] activateWithContext:v26];
      }
    }

    uint64_t v19 = 1;
    goto LABEL_32;
  }
  [UIApp terminateWithSuccess];
  return 0;
}

void sub_1000047B4(uint64_t a1)
{
  v2 = *(void **)(a1 + 16);
}

void sub_1000047F8(void *a1, const void *a2, int a3)
{
  NSLog(@"captive probe completed");
  if (a2) {
    CFRelease(a2);
  }
  if (a1)
  {
    id v6 = a1;
    v7 = v6;
    if ((a3 - 1) > 6) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_100005EC8[a3 - 1];
    }
    CFDictionaryRef v9 = [v6 probeCompleteCompletionHandler];

    if (v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000048F4;
      v10[3] = &unk_1000082B0;
      id v11 = v7;
      uint64_t v12 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }
}

id sub_1000048F4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) probeCompleteCompletionHandler];
  v2[2](v2, *(void *)(a1 + 40));

  v3 = *(void **)(a1 + 32);

  return [v3 setProbeCompleteCompletionHandler:0];
}

void sub_1000049C8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v2 setWallpaperTunnelActive:0];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004A84;
  v6[3] = &unk_100008318;
  id v7 = v2;
  id v5 = v2;
  [v3 dismissViewControllerAnimated:v4 completion:v6];
}

void sub_100004A84(uint64_t a1)
{
  [*(id *)(a1 + 32) dismiss];

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000082F0);
}

void sub_100004AC0(id a1)
{
}

void sub_100004D30(uint64_t a1)
{
  NSLog(@"WebSheet view controller presentation finished.");
  id v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v2 setWallpaperStyle:1 withDuration:0.0];
  [v2 setWallpaperTunnelActive:1];
}

const char *sub_100004DA0()
{
  return "WebSheet";
}

const char *sub_100004DB4(char a1)
{
  if (a1) {
    return "Exclusive";
  }
  else {
    return "BuddyAnchor";
  }
}

uint64_t sub_100004DE0(char a1)
{
  char v1 = a1 & 1;
  v4[3] = &type metadata for WebSheetFeatureFlags;
  v4[4] = sub_100004E38();
  LOBYTE(v4[0]) = v1;
  char v2 = isFeatureEnabled(_:)();
  sub_100004E8C(v4);
  return v2 & 1;
}

unint64_t sub_100004E38()
{
  unint64_t result = qword_10000D1F8;
  if (!qword_10000D1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000D1F8);
  }
  return result;
}

uint64_t sub_100004E8C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

BOOL sub_100004EDC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100004EEC(uint64_t a1, char a2)
{
}

Swift::Int sub_100004F14(char a1)
{
  return Hasher._finalize()();
}

BOOL sub_100004F5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100004F74()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004FBC()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100004FE8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_100005030()
{
  unint64_t result = qword_10000D200;
  if (!qword_10000D200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000D200);
  }
  return result;
}

const char *sub_100005084()
{
  if (*v0) {
    return "Exclusive";
  }
  else {
    return "BuddyAnchor";
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for WebSheetFeatureFlags(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WebSheetFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WebSheetFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100005220);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100005248(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005254(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WebSheetFeatureFlags()
{
  return &type metadata for WebSheetFeatureFlags;
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

uint64_t CNIAmTheWebsheetApp2()
{
  return _CNIAmTheWebsheetApp2();
}

uint64_t CNProberCreate()
{
  return _CNProberCreate();
}

uint64_t CNProberCreateRunLoopSource()
{
  return _CNProberCreateRunLoopSource();
}

uint64_t CNScrapeCredentials()
{
  return _CNScrapeCredentials();
}

uint64_t CNWebsheetNotifyCompleteWithOptions()
{
  return _CNWebsheetNotifyCompleteWithOptions();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBGetScreenLockStatus()
{
  return _SBGetScreenLockStatus();
}

uint64_t SBSSpringBoardServerPort()
{
  return _SBSSpringBoardServerPort();
}

uint64_t SCDynamicStoreCopyProxiesWithOptions()
{
  return _SCDynamicStoreCopyProxiesWithOptions();
}

uint64_t SCNetworkProxiesCopyMatching()
{
  return _SCNetworkProxiesCopyMatching();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_probeCompleteCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 probeCompleteCompletionHandler];
}

id objc_msgSend_remotePresentationController(void *a1, const char *a2, ...)
{
  return [a1 remotePresentationController];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_terminateWithSuccess(void *a1, const char *a2, ...)
{
  return [a1 terminateWithSuccess];
}

id objc_msgSend_webSheetCont(void *a1, const char *a2, ...)
{
  return [a1 webSheetCont];
}