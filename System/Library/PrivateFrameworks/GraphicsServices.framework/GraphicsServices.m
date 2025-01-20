float GSMainScreenScaleFactor()
{
  float result;

  result = *(float *)&__screenScale;
  if (*(float *)&__screenScale == 0.0)
  {
    FetchScreenInfoFromCapabilities();
    return *(float *)&__screenScale;
  }
  return result;
}

void *GSEventRegisterEventCallBack(void *result)
{
  __eventCallBack = result;
  return result;
}

void GSEventInitialize()
{
}

CGFloat GSSetMainScreenInfo(double a1, double a2, float a3, float a4)
{
  __screenWidth = (int)a1;
  __screenHeight = (int)a2;
  __screenScale = LODWORD(a3);
  __screenOrientation = LODWORD(a4);
  return ResetTransforms();
}

uint64_t GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType(int a1, unsigned int a2, unsigned int a3)
{
  uint64_t result = GetHardwareKeyboardToken();
  if (result)
  {
    notify_set_state(result, ((unint64_t)a2 << 8) | ((unint64_t)a3 << 16) | (a1 != 0));
    v7 = (const char *)kGSEventHardwareKeyboardAvailabilityChangedNotification;
    return notify_post(v7);
  }
  return result;
}

uint64_t GSEventGetHardwareKeyboardCountry()
{
  uint64_t result = GetHardwareKeyboardToken();
  if (result)
  {
    uint64_t state64 = 0;
    if (notify_get_state(result, &state64))
    {
      uint64_t result = AttachedKeyboardToken;
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        uint64_t result = 0;
        AttachedKeyboardToken = 0;
      }
    }
    else
    {
      return BYTE1(state64);
    }
  }
  return result;
}

uint64_t GSEventGetHardwareKeyboardType()
{
  uint64_t result = GetHardwareKeyboardToken();
  if (result)
  {
    uint64_t state64 = 0;
    if (notify_get_state(result, &state64))
    {
      uint64_t result = AttachedKeyboardToken;
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        uint64_t result = 0;
        AttachedKeyboardToken = 0;
      }
    }
    else
    {
      return BYTE2(state64);
    }
  }
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  uint64_t result = GetHardwareKeyboardToken();
  if (result)
  {
    uint64_t state64 = 0;
    if (notify_get_state(result, &state64))
    {
      uint64_t result = AttachedKeyboardToken;
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        uint64_t result = 0;
        AttachedKeyboardToken = 0;
      }
    }
    else
    {
      return (_BYTE)state64 != 0;
    }
  }
  return result;
}

uint64_t GetHardwareKeyboardToken()
{
  uint64_t result = AttachedKeyboardToken;
  if (!AttachedKeyboardToken)
  {
    uint32_t v1 = notify_register_check((const char *)kGSEventHardwareKeyboardAvailabilityChangedNotification, &AttachedKeyboardToken);
    uint64_t result = AttachedKeyboardToken;
    if (v1)
    {
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        uint64_t result = 0;
        AttachedKeyboardToken = 0;
      }
    }
  }
  return result;
}

void GSSendAppPreferencesChanged(const __CFString *a1, const __CFString *a2)
{
  v15[1] = *(char **)MEMORY[0x1E4F143B8];
  CFIndex Length = CFStringGetLength(a1);
  CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  MEMORY[0x1F4188790]();
  v6 = (char *)v15 - v5;
  CFStringGetCString(a1, (char *)v15 - v5, v7, 0x8000100u);
  v15[0] = 0;
  asprintf(v15, "%s.gsEvents", v6);
  v8 = v15[0];
  if (v15[0])
  {
    LODWORD(v15[0]) = 0;
    if (bootstrap_look_up2()) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = v15[0];
    }
    if (v9 - 1 <= 0xFFFFFFFD)
    {
      CFIndex v10 = CFStringGetLength(a2);
      CFIndex v11 = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u) + 1;
      MEMORY[0x1F4188790]();
      v13 = (char *)v15 - v12;
      bzero((char *)v15 - v12, v14);
      *(_DWORD *)v13 = 60;
      CFStringGetCString(a2, v13 + 88, v11, 0x8000100u);
      *((_DWORD *)v13 + 18) = strlen(v13 + 88) + 1;
      GSSendEvent((unsigned int *)v13, v9);
      mach_port_deallocate(*MEMORY[0x1E4F14960], v9);
    }
    free(v8);
  }
}

void GSEventPushRunLoopMode(void *value)
{
  Mutable = (__CFArray *)__runLoopModeStack;
  if (!__runLoopModeStack)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    __runLoopModeStack = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, value);
  v3 = (__CFRunLoop *)__eventRunLoop;

  CFRunLoopStop(v3);
}

void GSInitialize()
{
  if ((GSInitialize_sInitialized & 1) == 0)
  {
    CFMachPortRef v0 = CFMachPortCreate(0, 0, 0, 0);
    if (v0) {
      CFRelease(v0);
    }
    __GSEventClassInitialize();
    __GSKeyboardClassInitialize();
    CGFontDBSetInitializer();
    GSInitialize_sInitialized = 1;
  }
}

uint64_t __GSKeyboardClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kGSKeyboardTypeID = result;
  return result;
}

uint64_t __GSEventClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kGSEventTypeID = result;
  return result;
}

void GSEventRunModal(int a1)
{
  while (!a1 || (__exitRunModal & 1) == 0)
  {
    if (!__runLoopModeStack
      || CFArrayGetCount((CFArrayRef)__runLoopModeStack) < 1
      || (CFArrayRef v2 = (const __CFArray *)__runLoopModeStack,
          CFIndex Count = CFArrayGetCount((CFArrayRef)__runLoopModeStack),
          (CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, Count - 1)) == 0))
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s: NULL run loop mode. Exiting loop\n", "GSEventRunModal");
      break;
    }
    CFStringRef v5 = ValueAtIndex;
    if (__timeEventHandling)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)timingObserver, v5);
    }
    CFRunLoopRunInMode(v5, 6.31139904e10, 0);
    if (__timeEventHandling)
    {
      CFIndex v7 = CFRunLoopGetCurrent();
      CFRunLoopRemoveObserver(v7, (CFRunLoopObserverRef)timingObserver, v5);
    }
  }
  __exitRunModal = 0;
}

void _GSEventInitializeApp(int a1, NSObject *a2)
{
  if ((_GSEventInitializeApp__initialized & 1) == 0)
  {
    _GSEventInitializeApp__initialized = 1;
    _GSEventInitializeShared(a2);
    IdentifierCString = GetIdentifierCString();
    if (!IdentifierCString) {
      _GSEventInitializeApp_cold_1();
    }
    if (strlen(IdentifierCString) >= 0x80) {
      _GSEventInitializeApp_cold_2(&v9);
    }
    if (a1)
    {
      if ((_GSEventInitializeApp__backboard & 1) == 0)
      {
        _GSEventInitializeApp__backboard = 1;
        int v8 = 256;
        uint64_t v5 = _GSRegisterPurpleNamedPortInPrivateNamespace(__PurpleWorkspacePortName);
        __workspacePort = v5;
        v6 = (unsigned int *)MEMORY[0x1E4F14960];
        MEMORY[0x1D25DF580](*MEMORY[0x1E4F14960], v5, 1, &v8, 1);
        AddSourceForEventPort(__workspacePort, a2);
        uint64_t v7 = _GSRegisterPurpleNamedPortInPrivateNamespace(__PurpleSystemEventPortName);
        __systemEventPort = v7;
        MEMORY[0x1D25DF580](*v6, v7, 1, &v8, 1);
        AddSourceForEventPort(__systemEventPort, a2);
      }
    }
  }
}

void _GSEventInitializeShared(NSObject *a1)
{
  if (a1)
  {
    __eventDeliveryQueue = (uint64_t)a1;
    dispatch_retain(a1);
  }
  else
  {
    __eventRunLoop = (uint64_t)CFRunLoopGetCurrent();
    CFRetain((CFTypeRef)__eventRunLoop);
  }
  if (__eventRunLoop)
  {
    CFRunLoopSourceContext v1 = *(CFRunLoopSourceContext *)byte_1F267AD10;
    __signalRunLoopSource = (uint64_t)CFRunLoopSourceCreate(0, -1, &v1);
    CFRunLoopAddSource((CFRunLoopRef)__eventRunLoop, (CFRunLoopSourceRef)__signalRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRunLoopAddSource((CFRunLoopRef)__eventRunLoop, (CFRunLoopSourceRef)__signalRunLoopSource, @"GSEventReceiveRunLoopMode");
  }
}

char *GetIdentifierCString()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = (char *)GetIdentifierCString___identifierCString;
  if (!GetIdentifierCString___identifierCString)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
      if (Identifier)
      {
        CFStringRef v3 = Identifier;
        CFIndex Length = CFStringGetLength(Identifier);
        CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
        MEMORY[0x1F4188790]();
        v6 = (char *)v9 - v5;
        if (CFStringGetCString(v3, (char *)v9 - v5, v7, 0x8000100u)) {
          GetIdentifierCString___identifierCString = (uint64_t)strdup(v6);
        }
      }
    }
    uint64_t result = (char *)GetIdentifierCString___identifierCString;
    if (!GetIdentifierCString___identifierCString)
    {
      int v8 = getprogname();
      if (v8)
      {
        uint64_t result = strdup(v8);
        GetIdentifierCString___identifierCString = (uint64_t)result;
      }
      else
      {
        return (char *)GetIdentifierCString___identifierCString;
      }
    }
  }
  return result;
}

void GSEventRun()
{
  if (__timeEventHandling) {
    BOOL v0 = timingObserver == 0;
  }
  else {
    BOOL v0 = 0;
  }
  if (v0) {
    timingObserver = (uint64_t)CFRunLoopObserverCreate(0, 0xFFFFFFFuLL, 1u, 9999, (CFRunLoopObserverCallBack)timingObserverCallback, 0);
  }

  GSEventRunModal(0);
}

CGFloat ResetTransforms()
{
  LODWORD(result) = __screenOrientation;
  if (*(float *)&__screenOrientation != 0.0)
  {
    CGAffineTransformMakeRotation(&v7, (float)-*(float *)&__screenOrientation);
    *(CGAffineTransform *)__screenWindowTransform = v7;
    double v1 = (float)((float)__screenWidth / *(float *)&__screenScale);
    double v2 = (float)((float)__screenHeight / *(float *)&__screenScale);
    CGFloat v3 = v7.c * v2 + v7.a * v1;
    CGFloat v4 = v7.d * v2 + v7.b * v1;
    *(float *)&double v1 = v3;
    *(float *)&CGFloat v4 = v4;
    CGAffineTransformMakeTranslation(&t2, fmaxf(-*(float *)&v1, 0.0), fmaxf(-*(float *)&v4, 0.0));
    CGAffineTransform v5 = *(CGAffineTransform *)__screenWindowTransform;
    CGAffineTransformConcat(&v7, &v5, &t2);
    *(CGAffineTransform *)__screenPositionTransform = v7;
    return v7.tx;
  }
  return result;
}

__CFString *GSSystemRootDirectory()
{
  return @"/";
}

CGColorRef GSColorCreateColorWithDeviceRGBA(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  DeviceRGB = (CGColorSpace *)GetDeviceRGBColorSpace_sDeviceRGBColorSpace;
  if (!GetDeviceRGBColorSpace_sDeviceRGBColorSpace)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    GetDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)DeviceRGB;
  }
  return CGColorCreate(DeviceRGB, components);
}

CGColorRef GSColorCreateColorWithDeviceRGBAInfo(uint64_t a1)
{
  if (*(unsigned char *)a1) {
    return GSColorCreateColorWithDeviceRGBA(*(float *)(a1 + 4), *(float *)(a1 + 8), *(float *)(a1 + 12), *(float *)(a1 + 16));
  }
  else {
    return 0;
  }
}

CGColorRef GSColorCreateWithDeviceWhite(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  components[0] = a1;
  components[1] = a2;
  DeviceGray = (CGColorSpace *)GetDeviceGrayColorSpace_sGenericGrayColorSpace;
  if (!GetDeviceGrayColorSpace_sGenericGrayColorSpace)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    GetDeviceGrayColorSpace_sGenericGrayColorSpace = (uint64_t)DeviceGray;
  }
  return CGColorCreate(DeviceGray, components);
}

void GSColorGetRGBAComponents(CGColor *a1, void *a2, void *a3, void *a4, void *a5)
{
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceRef DeviceRGB = (CGColorSpaceRef)GetDeviceRGBColorSpace_sDeviceRGBColorSpace;
  if (!GetDeviceRGBColorSpace_sDeviceRGBColorSpace)
  {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
    GetDeviceRGBColorSpace_sDeviceRGBCGColorSpaceRef ColorSpace = (uint64_t)DeviceRGB;
  }
  uint64_t v12 = a1;
  if (ColorSpace != DeviceRGB)
  {
    if (!DeviceRGB) {
      GetDeviceRGBColorSpace_sDeviceRGBCGColorSpaceRef ColorSpace = (uint64_t)CGColorSpaceCreateDeviceRGB();
    }
    uint64_t v13 = MEMORY[0x1D25DF2B0]();
    if (!v13) {
      goto LABEL_11;
    }
    size_t v14 = (const void *)v13;
    uint64_t v12 = (CGColor *)CGColorTransformConvertColor();
    CFRelease(v14);
  }
  if (!v12)
  {
LABEL_11:
    *a5 = 0;
    *a4 = 0;
    *a3 = 0;
    *a2 = 0;
    return;
  }
  Components = CGColorGetComponents(v12);
  if (Components)
  {
    *a2 = *(void *)Components;
    *a3 = *((void *)Components + 1);
    *a4 = *((void *)Components + 2);
    *a5 = *((void *)Components + 3);
  }
  else
  {
    *a5 = 0;
    *a4 = 0;
    *a3 = 0;
    *a2 = 0;
  }
  if (v12 != a1)
  {
    CFRelease(v12);
  }
}

void GSColorGetRGBAInfo(CGColor *a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    GSColorGetRGBAComponents(a1, &v10, &v9, &v8, &v7);
    *(unsigned char *)a2 = 1;
    float v3 = v10;
    float v4 = v9;
    *(float *)(a2 + 4) = v3;
    *(float *)(a2 + 8) = v4;
    float v5 = v8;
    float v6 = v7;
    *(float *)(a2 + 12) = v5;
    *(float *)(a2 + 16) = v6;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = 0;
  }
}

uint64_t GSEventGetTypeID()
{
  return __kGSEventTypeID;
}

__n128 GSEventCreateWithEventRecord(unsigned int *a1)
{
  uint64_t v1 = CreateWithEventRecord(a1);
  __n128 result = *(__n128 *)(v1 + 40);
  *(__n128 *)(v1 + 24) = result;
  *(void *)(v1 + 72) = 0;
  return result;
}

uint64_t CreateWithEventRecord(unsigned int *a1)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance) {
    memcpy((void *)(Instance + 16), a1, a1[18] + 88);
  }
  return v3;
}

uint64_t GSEventCopy(uint64_t a1)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance) {
    memcpy((void *)(Instance + 16), (const void *)(a1 + 16), *(unsigned int *)(a1 + 88) + 88);
  }
  return v3;
}

__CFDictionary *GSEventCreatePlistRepresentation(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(0, 8, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFIndex v3 = *(unsigned int *)(a1 + 88);
  if (v3)
  {
    CFDataRef v4 = CFDataCreate(0, (const UInt8 *)(a1 + 104), v3);
    CFDictionarySetValue(Mutable, @"Data", v4);
    CFRelease(v4);
  }
  if (*(void *)(a1 + 64))
  {
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, (const void *)(a1 + 64));
    CFDictionarySetValue(Mutable, @"Time", v5);
    CFRelease(v5);
  }
  if (*(_DWORD *)(a1 + 16))
  {
    CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a1 + 16));
    CFDictionarySetValue(Mutable, @"Type", v6);
    CFRelease(v6);
  }
  if (*(_DWORD *)(a1 + 80))
  {
    CFNumberRef v7 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a1 + 80));
    CFDictionarySetValue(Mutable, @"Flags", v7);
    CFRelease(v7);
  }
  if (*(_DWORD *)(a1 + 20))
  {
    CFNumberRef v8 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a1 + 20));
    CFDictionarySetValue(Mutable, @"Subtype", v8);
    CFRelease(v8);
  }
  double v9 = *(double *)(a1 + 24);
  double v10 = *(double *)(a1 + 32);
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v9 != *MEMORY[0x1E4F1DAD8] || v10 != v12)
  {
    CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(*(CGPoint *)&v9);
    CFDictionarySetValue(Mutable, @"Location", DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
  }
  double v15 = *(double *)(a1 + 40);
  double v16 = *(double *)(a1 + 48);
  if (v15 != v11 || v16 != v12)
  {
    CFDictionaryRef v18 = CGPointCreateDictionaryRepresentation(*(CGPoint *)&v15);
    CFDictionarySetValue(Mutable, @"WindowLocation", v18);
    CFRelease(v18);
  }
  return Mutable;
}

uint64_t GSEventCreateWithPlist(const __CFDictionary *a1)
{
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a1, @"Data");
  if (Value) {
    DWORD2(v22) = CFDataGetLength(Value);
  }
  CFNumberRef v3 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Time");
  if (v3) {
    CFNumberGetValue(v3, kCFNumberSInt64Type, &v21);
  }
  CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Type");
  if (v4) {
    CFNumberGetValue(v4, kCFNumberIntType, &v18);
  }
  CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Flags");
  if (v5) {
    CFNumberGetValue(v5, kCFNumberSInt32Type, &v22);
  }
  CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Subtype");
  if (v6) {
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)&v18 + 4);
  }
  CFDictionaryRef v7 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"Location");
  if (v7) {
    CGPointMakeWithDictionaryRepresentation(v7, (CGPoint *)((char *)&v18 + 8));
  }
  CFDictionaryRef v8 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"WindowLocation");
  if (v8) {
    CGPointMakeWithDictionaryRepresentation(v8, (CGPoint *)((char *)&v19 + 8));
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v10 = Instance;
  if (Instance)
  {
    long long v11 = v19;
    *(_OWORD *)(Instance + 16) = v18;
    *(_OWORD *)(Instance + 32) = v11;
    *(void *)(Instance + 96) = v23;
    long long v12 = v22;
    long long v13 = v20;
    *(_OWORD *)(Instance + 64) = v21;
    *(_OWORD *)(Instance + 8_GSEventInitializeApp(0, 0) = v12;
    *(_OWORD *)(Instance + 48) = v13;
    if (DWORD2(v22))
    {
      CFDataRef v14 = (const __CFData *)CFDictionaryGetValue(a1, @"Data");
      BytePtr = CFDataGetBytePtr(v14);
      size_t Length = CFDataGetLength(v14);
      memcpy((void *)(v10 + 104), BytePtr, Length);
    }
    *(_OWORD *)(v10 + 24) = *(_OWORD *)(v10 + 40);
    *(void *)(v10 + 72) = 0;
  }
  return v10;
}

__n128 GSEventGetHandInfo@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)(a1 + 104);
  long long v3 = *(_OWORD *)(a1 + 120);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 136);
  return result;
}

__n128 GSEventGetPathInfoAtIndex@<Q0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3 = a1 + 48 * a2;
  long long v4 = *(_OWORD *)(v3 + 160);
  *(_OWORD *)a3 = *(_OWORD *)(v3 + 144);
  *(_OWORD *)(a3 + 16) = v4;
  __n128 result = *(__n128 *)(v3 + 176);
  *(__n128 *)(a3 + 32) = result;
  return result;
}

__n128 GSEventSetPathInfoAtIndex(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a1 + 48 * a3;
  __n128 result = *(__n128 *)a2;
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 16_GSEventInitializeApp(0, 0) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 176) = v5;
  *(__n128 *)(v3 + 144) = result;
  return result;
}

uint64_t GSEventDisableHandEventCoalescing(uint64_t result)
{
  __disableHandEventCoalescing = result;
  return result;
}

double GSEventGetInnerMostPathPosition(uint64_t a1)
{
  uint64_t v1 = 160;
  if (!*(unsigned char *)(a1 + 138)) {
    uint64_t v1 = 40;
  }
  return *(double *)(a1 + v1);
}

double GSEventGetLocationInWindow(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

double GSEventGetOuterMostPathPosition(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 138)) {
    uint64_t v1 = a1 + 48 * (*(unsigned __int8 *)(a1 + 138) - 1) + 160;
  }
  else {
    uint64_t v1 = a1 + 40;
  }
  return *(double *)v1;
}

BOOL GSEventIsHandEvent(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) == 3001;
}

BOOL GSEventIsChordingHandEvent(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) != 3001) {
    return 0;
  }
  int v1 = *(unsigned __int16 *)(a1 + 110);
  if (*(unsigned __int16 *)(a1 + 108) <= 1u)
  {
    BOOL v2 = v1 != 0;
    BOOL v3 = v1 == 1;
  }
  else
  {
    BOOL v2 = 1;
    BOOL v3 = 0;
  }
  return !v3 && v2;
}

uint64_t GSEventShouldRouteToFrontMost(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 16) >> 17) & 1;
}

uint64_t GSEventRemoveShouldRouteToFrontMost(uint64_t result)
{
  *(_DWORD *)(result + 16) &= ~0x20000u;
  return result;
}

uint64_t GSEventGetType(uint64_t a1)
{
  uint64_t result = *(_DWORD *)(a1 + 16) & 0xFFFDFFFF;
  if (result == 3001)
  {
    int v3 = *(_DWORD *)(a1 + 104) - 1;
    if (v3 > 5) {
      return 0;
    }
    else {
      return dword_1CFDD7C70[v3];
    }
  }
  return result;
}

uint64_t GSEventGetSubType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t GSEventSetLocationInWindow(uint64_t result, double a2, double a3)
{
  *(double *)(result + 4_GSEventInitializeApp(0, 0) = a2;
  *(double *)(result + 48) = a3;
  return result;
}

uint64_t GSEventSetType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

float GSEventGetDeltaX(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 22) {
    return (float)*(int *)(a1 + 108);
  }
  else {
    return (float)*(__int16 *)(a1 + 108);
  }
}

float GSEventGetDeltaY(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 22) {
    return (float)*(int *)(a1 + 104);
  }
  else {
    return (float)*(__int16 *)(a1 + 110);
  }
}

float GSEventAccelerometerAxisX(uint64_t a1)
{
  return *(float *)(a1 + 104);
}

float GSEventAccelerometerAxisY(uint64_t a1)
{
  return *(float *)(a1 + 108);
}

float GSEventAccelerometerAxisZ(uint64_t a1)
{
  return *(float *)(a1 + 112);
}

uint64_t GSEventDeviceOrientation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t GSEventGetClickCount()
{
  return 1;
}

double GSEventGetTimestamp(uint64_t a1)
{
  return (double)*(unint64_t *)(a1 + 64) / 1000000000.0;
}

uint64_t GSEventGetHIDTimestamp(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t GSEventGetWindow(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t GSEventIsForceQuitEvent(uint64_t result)
{
  if (result)
  {
    if ((*(_DWORD *)(result + 16) & 0xFFFDFFFF) == 0x7D7) {
      return (*(unsigned __int8 *)(result + 108) >> 3) & 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _GSEventGetGSEventRecord(uint64_t a1)
{
  return a1 + 16;
}

uint64_t GSEventGetUsagePage(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 88);
  if (v1 == 4 || v1 == 8) {
    return *(unsigned int *)(a1 + 104);
  }
  else {
    return 12;
  }
}

CFStringRef GSEventCopyCharacters(uint64_t a1)
{
  return CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 114), *(unsigned __int16 *)(a1 + 112));
}

CFStringRef GSEventCopyCharactersIgnoringModifiers(uint64_t a1)
{
  return CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 164), *(unsigned __int16 *)(a1 + 162));
}

CFStringRef GSEventCopyMarkedCharacters(uint64_t a1)
{
  return CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 214), *(unsigned __int16 *)(a1 + 212));
}

uint64_t GSEventGetCharacterSet(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 110);
}

uint64_t GSEventGetModifierFlags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 80);
}

uint64_t GSEventGetKeyFlags(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 262);
}

uint64_t GSEventIsKeyRepeating(uint64_t a1)
{
  return *(_WORD *)(a1 + 262) & 1;
}

BOOL GSEventIsHardwareKeyboardEvent(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 16);
  BOOL v2 = v1 >= 0xE;
  BOOL v4 = v1 == 14;
  int v3 = (1 << v1) & 0x4C00;
  BOOL v4 = !v4 && v2 || v3 == 0;
  return !v4 && *(unsigned __int16 *)(a1 + 264) == 1;
}

BOOL GSEventSourceIsHardware(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 16);
  BOOL v2 = (v1 & 0xFFFDFFFF) - 1000 > 0x13 || ((1 << (v1 + 24)) & 0xC3FC3) == 0;
  if (v2 && ((v1 & 0xFFFDFFFF) == 0xBB9 || (v1 & 0xFFFDFFFE) != 0x3FE))
  {
    BOOL v4 = v1 > 0xE;
    int v5 = (1 << v1) & 0x5C00;
    BOOL v6 = v4 || v5 == 0;
    if (!v6 && *(_DWORD *)(a1 + 88) == 162)
    {
      int v3 = *(unsigned __int16 *)(a1 + 264);
      return v3 == 1;
    }
LABEL_15:
    int v3 = 0;
    return v3 == 1;
  }
  if (*(_DWORD *)(a1 + 88) != 8) {
    goto LABEL_15;
  }
  int v3 = *(unsigned __int16 *)(a1 + 108);
  return v3 == 1;
}

uint64_t GSEventSetHardwareKeyboardAttached(int a1, unsigned int a2)
{
  return GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType(a1, a2, 0);
}

void GSEventSetCharacters(uint64_t a1, CFStringRef theString)
{
  unsigned int Length = (unsigned __int16)CFStringGetLength(theString);
  if (Length >= 0x18) {
    v5.length = 24;
  }
  else {
    v5.length = Length;
  }
  *(_WORD *)(a1 + 112) = v5.length;
  v5.location = 0;

  CFStringGetCharacters(theString, v5, (UniChar *)(a1 + 114));
}

uint64_t GSEventGetSenderPID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 84);
}

uint64_t GSEventIsTabKeyEvent(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = *(_DWORD *)(result + 16) & 0xFFFDFFFF;
    if (v2 == 3001)
    {
      unsigned int v3 = *(_DWORD *)(result + 104) - 1;
      if (v3 > 5) {
        unsigned int v2 = 0;
      }
      else {
        unsigned int v2 = dword_1CFDD7C70[v3];
      }
    }
    if (v2 == 14 || (v2 & 0xFFFDFFFE) == 10) {
      return GSEventIsKeyCharacterEventType(result, 9) || GSEventIsKeyCharacterEventType(v1, 25);
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL GSEventIsKeyCharacterEventType(uint64_t a1, int a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16) & 0xFFFDFFFF;
  if (v3 == 3001)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 104) - 1;
    if (v4 > 5) {
      unsigned int v3 = 0;
    }
    else {
      unsigned int v3 = dword_1CFDD7C70[v4];
    }
  }
  if (v3 != 14 && (v3 & 0xFFFDFFFE) != 10) {
    return 0;
  }
  CFStringRef v6 = CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 164), *(unsigned __int16 *)(a1 + 162));
  if (!v6) {
    return 0;
  }
  CFStringRef v7 = v6;
  BOOL v8 = CFStringGetLength(v6) == 1 && CFStringGetCharacterAtIndex(v7, 0) == a2;
  CFRelease(v7);
  return v8;
}

uint64_t GSEventGetKeyCode(uint64_t result)
{
  if (result)
  {
    unsigned int v1 = *(_DWORD *)(result + 16) & 0xFFFDFFFF;
    if (v1 == 3001)
    {
      unsigned int v2 = *(_DWORD *)(result + 104) - 1;
      if (v2 > 5) {
        unsigned int v1 = 0;
      }
      else {
        unsigned int v1 = dword_1CFDD7C70[v2];
      }
    }
    if (v1 == 14 || (v1 & 0xFFFDFFFE) == 10) {
      return *(unsigned __int16 *)(result + 104);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t GSEventCreateKeyEvent(unsigned int a1, const __CFString *a2, const __CFString *a3, int a4, __int16 a5, __int16 a6, __int16 a7, double a8, double a9)
{
  uint64_t result = 0;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1 <= 0xE && ((1 << a1) & 0x4C00) != 0)
  {
    long long v25 = 0u;
    memset(v26, 0, 154);
    long long v23 = 0u;
    long long v24 = 0u;
    memset(v22, 0, sizeof(v22));
    DWORD2(v24) = 162;
    LODWORD(v24) = a4;
    *(void *)&long long v23 = GSCurrentEventTimestamp();
    unsigned __int16 Length = CFStringGetLength(a2);
    if (Length <= 0x18uLL) {
      unsigned __int16 v19 = Length;
    }
    else {
      unsigned __int16 v19 = 24;
    }
    LOWORD(v26[0]) = v19;
    v28.length = v19;
    v28.location = 0;
    CFStringGetCharacters(a2, v28, (UniChar *)v26 + 1);
    unsigned __int16 v20 = CFStringGetLength(a3);
    if (v20 <= 0x18uLL) {
      unsigned __int16 v21 = v20;
    }
    else {
      unsigned __int16 v21 = 24;
    }
    WORD1(v26[3]) = v21;
    v29.length = v21;
    v29.location = 0;
    CFStringGetCharacters(a3, v29, (UniChar *)&v26[3] + 2);
    WORD4(v25) = a5;
    WORD3(v26[9]) = a6;
    WORD4(v26[9]) = a7;
    uint64_t result = CreateWithEventRecord((unsigned int *)v22);
    *(_OWORD *)(result + 24) = *(_OWORD *)(result + 40);
    *(void *)(result + 72) = 0;
    *(_DWORD *)(result + 16) = a1;
    *(double *)(result + 4_GSEventInitializeApp(0, 0) = a8;
    *(double *)(result + 48) = a9;
  }
  return result;
}

unint64_t GSCurrentEventTimestamp()
{
  uint64_t v0 = mach_absolute_time();
  if (GetTimebase_once != -1) {
    dispatch_once(&GetTimebase_once, &__block_literal_global_44);
  }
  return v0 * GetTimebase___timebase / HIDWORD(GetTimebase___timebase);
}

void GSEventSendKeyEvent(unsigned int a1, const __CFString *a2, const __CFString *a3, int a4, __int16 a5, __int16 a6, __int16 a7, double a8, double a9)
{
  if (a1 <= 0xE && ((1 << a1) & 0x4C00) != 0)
  {
    uint64_t KeyEvent = GSEventCreateKeyEvent(a1, a2, a3, a4, a5, a6, a7, a8, a9);
    if (KeyEvent)
    {
      uint64_t v10 = (const void *)KeyEvent;
      GSGetPurpleApplicationPort();
      CFRelease(v10);
    }
  }
}

uint64_t GSSendEvent(unsigned int *a1, unsigned int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2 - 1 > 0xFFFFFFFD) {
    return 268435459;
  }
  pthread_mutex_lock(&__dispatchQueuesLock);
  if (__dispatchQueues && (CFIndex v4 = CFArrayGetCount((CFArrayRef)__dispatchQueues), v4 >= 1))
  {
    CFIndex v5 = v4;
    CFIndex v6 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__dispatchQueues, v6);
      if (ValueAtIndex[4] == a2) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    CFDataRef v14 = ValueAtIndex;
    uint64_t v15 = CreateWithEventRecord(a1);
    PurplePushEvent(v14, v15);
    uint64_t v8 = 0;
  }
  else
  {
LABEL_7:
    uint64_t v8 = _GSSendEvent((int *)a1, a2, 0);
    if (v8 == 268435460)
    {
      if (!__dispatchQueues) {
        __dispatchQueues = (uint64_t)CFArrayCreateMutable(0, 0, 0);
      }
      double v9 = malloc_type_malloc(0x18uLL, 0x1020040EDCEB4C7uLL);
      *double v9 = 0;
      v9[1] = 0;
      *((_DWORD *)v9 + 4) = a2;
      CFArrayAppendValue((CFMutableArrayRef)__dispatchQueues, v9);
      memset(&v20, 0, sizeof(v20));
      pthread_attr_init(&v20);
      pthread_attr_setdetachstate(&v20, 2);
      pthread_t v19 = 0;
      pthread_create(&v19, &v20, (void *(__cdecl *)(void *))DispatchThread, (void *)a2);
      pthread_attr_destroy(&v20);
      if (__dispatchQueues)
      {
        CFIndex Count = CFArrayGetCount((CFArrayRef)__dispatchQueues);
        if (Count >= 1)
        {
          CFIndex v11 = Count;
          CFIndex v12 = 0;
          while (1)
          {
            long long v13 = CFArrayGetValueAtIndex((CFArrayRef)__dispatchQueues, v12);
            if (v13[4] == a2) {
              break;
            }
            if (v11 == ++v12) {
              goto LABEL_19;
            }
          }
          double v16 = v13;
          uint64_t v17 = CreateWithEventRecord(a1);
          PurplePushEvent(v16, v17);
        }
      }
LABEL_19:
      uint64_t v8 = 268435460;
    }
  }
  pthread_mutex_unlock(&__dispatchQueuesLock);
  return v8;
}

uint64_t GSGetPurpleApplicationPort()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    GSGetPurpleApplicationPort_cold_1();
  }
  return 0;
}

BOOL GSEventQueueContainsMouseEvent()
{
  uint64_t v0 = &_queue;
  do
  {
    uint64_t v0 = (uint64_t *)*v0;
    if (!v0) {
      break;
    }
    uint64_t v1 = v0[1];
    unsigned int v2 = *(_DWORD *)(v1 + 16) & 0xFFFDFFFF;
    if (v2 == 3001)
    {
      if ((*(_DWORD *)(v1 + 104) - 1) < 6) {
        return v0 != 0;
      }
      unsigned int v2 = 0;
    }
  }
  while (v2 - 7 < 0xFFFFFFFA);
  return v0 != 0;
}

void GSEventInitializeAsExtension()
{
  if ((GSEventInitializeAsExtension__initialized & 1) == 0)
  {
    GSEventInitializeAsExtension__initialized = 1;
    _GSEventInitializeShared(0);
  }
}

void GSEventInitializeWorkspaceWithQueue(NSObject *a1)
{
}

uint64_t GSEventFinishedActivating(int a1, int a2, char a3, char a4)
{
  BOOL v7 = a1 != 0;
  v16[1] = *MEMORY[0x1E4F143B8];
  IdentifierCString = GetIdentifierCString();
  size_t v9 = strlen(IdentifierCString);
  int v10 = v9;
  size_t v11 = v9 + 1;
  CFIndex v12 = (_DWORD *)((char *)v16 - ((MEMORY[0x1F4188790]() + 114) & 0xFFFFFFFFFFFFFFF0));
  bzero(v12, v13);
  *CFIndex v12 = 2001;
  v12[18] = v10 + 11;
  v12[22] = a2;
  v12[23] = 2 * v7;
  *((unsigned char *)v12 + 96) = a3;
  *((unsigned char *)v12 + 97) = a4;
  memcpy((char *)v12 + 98, IdentifierCString, v11);
  unsigned int v14 = GSGetPurpleSystemEventPort();
  return GSSendEvent(v12, v14);
}

uint64_t GSSendSystemEvent(unsigned int *a1)
{
  unsigned int v2 = GSGetPurpleSystemEventPort();

  return GSSendEvent(a1, v2);
}

uint64_t GSEventCreateApplicationSuspendEvent(int a1, int a2, char a3, char a4, char a5, const __CFString *a6, double a7)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  IdentifierCString = GetIdentifierCString();
  size_t v15 = strlen(IdentifierCString);
  MEMORY[0x1F4188790]();
  uint64_t v17 = (char *)v19 - ((v16 + 15) & 0x1FFFFFFF0);
  bzero(v17, v16);
  *(_DWORD *)uint64_t v17 = a1;
  *((_DWORD *)v17 + 18) = v15 + 153;
  if (a6) {
    CFStringGetCString(a6, v17 + 96, 128, 0x8000100u);
  }
  *((double *)v17 + 28) = a7;
  *((_DWORD *)v17 + 58) = a2;
  v17[236] = a3;
  v17[237] = a4;
  v17[238] = a5;
  memcpy(v17 + 239, IdentifierCString, v15 + 1);
  uint64_t result = CreateWithEventRecord((unsigned int *)v17);
  *(_OWORD *)(result + 24) = *(_OWORD *)(result + 40);
  *(void *)(result + 72) = 0;
  return result;
}

void GSSendApplicationSuspendEvent(int a1, int a2, char a3, char a4, char a5, const __CFString *a6, double a7)
{
  uint64_t ApplicationSuspendEvent = GSEventCreateApplicationSuspendEvent(a1, a2, a3, a4, a5, a6, a7);
  if (ApplicationSuspendEvent)
  {
    uint64_t v8 = (const void *)ApplicationSuspendEvent;
    size_t v9 = (unsigned int *)(ApplicationSuspendEvent + 16);
    unsigned int v10 = GSGetPurpleSystemEventPort();
    GSSendEvent(v9, v10);
    CFRelease(v8);
  }
}

void GSSendApplicationFinishedBackgroundContentFetchingEvent(int a1, int a2)
{
}

void GSSendApplicationFinishedBackgroundContentFetchingEventWithSequenceNumber(int a1, int a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(v10, 0, 28);
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  unsigned int v5 = 2017;
  v10[5] = a1;
  v10[1] = 16;
  v10[7] = a2;
  v10[8] = a3;
  uint64_t v3 = CreateWithEventRecord(&v5);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v3 + 40);
  *(void *)(v3 + 72) = 0;
  unsigned int v4 = GSGetPurpleSystemEventPort();
  GSSendEvent((unsigned int *)(v3 + 16), v4);

  CFRelease((CFTypeRef)v3);
}

uint64_t GSSendWorkspaceEvent(unsigned int *a1)
{
  unsigned int v2 = GSGetPurpleSystemEventPort();

  return GSSendEvent(a1, v2);
}

void GSSendApplicationFinishedBackgroundNotificationActionEvent()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  long long v6 = 0u;
  long long v5 = 0u;
  long long v4 = 0u;
  long long v3 = 0u;
  unsigned int v2 = 2020;
  v7[1] = 8;
  uint64_t v0 = CreateWithEventRecord(&v2);
  *(_OWORD *)(v0 + 24) = *(_OWORD *)(v0 + 40);
  *(void *)(v0 + 72) = 0;
  unsigned int v1 = GSGetPurpleSystemEventPort();
  GSSendEvent((unsigned int *)(v0 + 16), v1);

  CFRelease((CFTypeRef)v0);
}

void GSSendApplicationSuspendedSettingsUpdatedEvent(int a1, char a2, char a3, char a4, const __CFString *a5, double a6)
{
}

uint64_t GSCopyPurpleNamedPort()
{
  if (bootstrap_look_up2()) {
    return 0;
  }
  else {
    return 0;
  }
}

void GSEventSendApplicationOpenURL(const __CFURL *a1, unsigned int a2)
{
  v12[116] = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = CFURLGetString(a1);
  if (v3)
  {
    CFStringRef v4 = v3;
    CFIndex Length = CFStringGetLength(v3);
    CFIndex v6 = Length;
    size_t v7 = Length + 97;
    if ((unint64_t)(Length + 97) < 0x401)
    {
      unsigned int v10 = (UInt8 *)v12;
      long long v9 = v11;
    }
    else
    {
      uint64_t v8 = (char *)malloc_type_malloc(Length + 97, 0x6E501A1BuLL);
      if (!v8) {
        return;
      }
      long long v9 = v8;
      unsigned int v10 = (UInt8 *)(v8 + 96);
    }
    bzero(v9, v7);
    *long long v9 = 2006;
    v9[18] = v6 + 9;
    v13.location = 0;
    v13.length = v6;
    CFStringGetBytes(v4, v13, 0x8000100u, 0, 0, v10, v6 + 1, 0);
    GSSendEvent(v9, a2);
    if (v9 != (_DWORD *)v11) {
      free(v9);
    }
  }
}

uint64_t GSGetPurpleSystemAppPort()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    GSGetPurpleSystemAppPort_cold_1();
  }
  return 0;
}

uint64_t GSGetPurpleSystemEventPort()
{
  pthread_mutex_lock(&GSGetPurpleSystemEventPort_portLock);
  mach_port_type_t ptype = 0;
  uint64_t v0 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (mach_port_type(*MEMORY[0x1E4F14960], GSGetPurpleSystemEventPort_port, &ptype) || (ptype & 0x100000) != 0)
  {
    if ((GSGetPurpleSystemEventPort_port + 1) >= 2) {
      mach_port_deallocate(*v0, GSGetPurpleSystemEventPort_port);
    }
    int v5 = 0;
    int v1 = bootstrap_look_up2();
    int v2 = v5;
    if (v1) {
      int v2 = 0;
    }
    GSGetPurpleSystemEventPort_port = v2;
  }
  pthread_mutex_unlock(&GSGetPurpleSystemEventPort_portLock);
  return GSGetPurpleSystemEventPort_port;
}

uint64_t GSCopyPurpleNamedPerPIDPort()
{
  if (bootstrap_look_up2()) {
    return 0;
  }
  else {
    return 0;
  }
}

uint64_t GSRegisterPurpleNamedPort(const char *a1)
{
  return _GSRegisterPurpleNamedPortInPrivateNamespace(a1);
}

uint64_t _GSRegisterPurpleNamedPortInPrivateNamespace(const char *a1)
{
  kern_return_t inserted;
  mach_error_t v4;
  char *v6;
  char *v7;
  mach_port_name_t name;

  name = 0;
  if (bootstrap_check_in2())
  {
    int v2 = (ipc_space_t *)MEMORY[0x1E4F14960];
    inserted = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name);
    if (inserted || (inserted = mach_port_insert_right(*v2, name, name, 0x14u)) != 0)
    {
      CFStringRef v4 = inserted;
    }
    else
    {
      CFStringRef v4 = bootstrap_register2();
      mach_port_deallocate(*v2, name);
      if (!v4) {
        return name;
      }
    }
    mach_port_mod_refs(*v2, name, 1u, -1);
    size_t v7 = 0;
    CFIndex v6 = mach_error_string(v4);
    asprintf(&v7, "Couldn't register %s with the bootstrap server. Error: %s (%d).\nThis generally means that another instance of this process was already running or is hung in the debugger.", a1, v6, v4);
    syslog(3, "%s %s", "_GSRegisterPurpleNamedPortInPrivateNamespace", v7);
    _GSWriteStackshot(v7);
    *MEMORY[0x1E4F1CC20] = v7;
    abort();
  }
  return name;
}

uint64_t GSRegisterPurpleNamedPerPIDPort(const char *a1)
{
  return _GSRegisterPurpleNamedPortInPrivateNamespace(a1);
}

uint64_t GSSetTimeEventHandling(uint64_t result)
{
  __timeEventHandling = result;
  if ((result & 1) == 0)
  {
    uint64_t result = firstTimeBlock;
    if (firstTimeBlock)
    {
      do
      {
        uint64_t v1 = *(void *)(result + 196616);
        free((void *)result);
        uint64_t result = v1;
      }
      while (v1);
    }
    firstTimeBlock = 0;
  }
  return result;
}

uint64_t GSGetTimeEventHandling()
{
  return __timeEventHandling;
}

void *GSSaveEventHandlingTimes()
{
  if (__timeEventHandling) {
    return saveEventTimes();
  }
  return result;
}

void *saveEventTimes()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = firstTimeBlock;
  IdentifierCString = GetIdentifierCString();
  pid_t v2 = getpid();
  int v3 = saveEventTimes_fileCount++;
  snprintf(__str, 0x400uLL, "/tmp/%s-%d-%d.txt", IdentifierCString, v2, v3);
  for (i = fopen(__str, "w"); v0; uint64_t v0 = *((void *)v5 + 1))
  {
    int v5 = (int *)(v0 + 196608);
    if (i && *v5 >= 1)
    {
      uint64_t v6 = 0;
      size_t v7 = (double *)(v0 + 8);
      do
      {
        fprintf(i, "%f %f %f\n", *(v7 - 1), *v7, *v7 - *(v7 - 1));
        ++v6;
        v7 += 2;
      }
      while (v6 < *v5);
    }
  }
  if (i) {
    fclose(i);
  }
  uint64_t result = (void *)firstTimeBlock;
  if (firstTimeBlock)
  {
    do
    {
      long long v9 = (void *)result[24577];
      free(result);
      uint64_t result = v9;
    }
    while (v9);
  }
  firstTimeBlock = 0;
  return result;
}

void timingObserverCallback(uint64_t a1, uint64_t a2)
{
  if (firstTimeBlock)
  {
    if (*(int *)(currentTimeBlock + 196608) < 12288) {
      goto LABEL_6;
    }
    int v3 = malloc_type_malloc(0x30010uLL, 0x10200404C3AE429uLL);
    *(void *)(currentTimeBlock + 196616) = v3;
  }
  else
  {
    int v3 = malloc_type_malloc(0x30010uLL, 0x10200404C3AE429uLL);
    firstTimeBlock = (uint64_t)v3;
  }
  currentTimeBlock = (uint64_t)v3;
  v3[49152] = 0;
  *((void *)v3 + 24577) = 0;
LABEL_6:
  if (a2 == 1)
  {
LABEL_9:
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = currentTimeBlock + 16 * *(int *)(currentTimeBlock + 196608);
    *(CFAbsoluteTime *)uint64_t v5 = Current;
    *(void *)(v5 + 8) = 0;
    return;
  }
  if (a2 != 128)
  {
    if (a2 != 64) {
      return;
    }
    goto LABEL_9;
  }
  CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = currentTimeBlock;
  uint64_t v8 = *(int *)(currentTimeBlock + 196608);
  *(CFAbsoluteTime *)(currentTimeBlock + 16 * v8 + 8) = v6;
  *(_DWORD *)(v7 + 196608) = v8 + 1;
}

void GSEventStopModal()
{
  __exitRunModal = 1;
  CFAbsoluteTime Current = CFRunLoopGetCurrent();

  CFRunLoopStop(Current);
}

void GSEventPopRunLoopMode(const __CFString *a1)
{
  CFArrayRef v1 = (const __CFArray *)__runLoopModeStack;
  if (__runLoopModeStack)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)__runLoopModeStack);
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, Count - 1);
    if (ValueAtIndex)
    {
      if (CFEqual(a1, ValueAtIndex))
      {
        uint64_t v5 = (__CFArray *)__runLoopModeStack;
        CFIndex v6 = CFArrayGetCount((CFArrayRef)__runLoopModeStack);
        CFArrayRemoveValueAtIndex(v5, v6 - 1);
      }
    }
  }
  uint64_t v7 = (__CFRunLoop *)__eventRunLoop;

  CFRunLoopStop(v7);
}

uint64_t GSSendSystemAppEvent()
{
  return 268435459;
}

uint64_t _GSSendEvent(int *a1, int a2, int a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (*a1 == 3001) {
    size_t v6 = 28 * *((unsigned __int8 *)a1 + 122) + 120;
  }
  else {
    size_t v6 = a1[18] + 84;
  }
  MEMORY[0x1F4188790]();
  long long v9 = (char *)v22 - v8;
  if (v6 < 0x401)
  {
    unsigned int v10 = (char *)v22 - v8;
  }
  else
  {
    unsigned int v10 = (char *)malloc_type_malloc(v6, 0x1B5451E2uLL);
    int v7 = *a1;
  }
  *((_DWORD *)v10 + 6) = v7;
  *((_DWORD *)v10 + 7) = a1[1];
  *((float32x4_t *)v10 + 2) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 2)), *(float64x2_t *)(a1 + 6));
  *((_DWORD *)v10 + 12) = 0;
  *((_DWORD *)v10 + 15) = 0;
  *((_DWORD *)v10 + 16) = a1[16];
  *((_DWORD *)v10 + 17) = 0;
  *((_DWORD *)v10 + 18) = v6 - 84;
  *(void *)(v10 + 76) = *((void *)a1 + 10);
  uint64_t v11 = *((void *)a1 + 10);
  if (v11)
  {
    if (GetTimebase_once != -1) {
      dispatch_once(&GetTimebase_once, &__block_literal_global_44);
    }
    unint64_t v12 = v11 * (unint64_t)GetTimebase___timebase / HIDWORD(GetTimebase___timebase);
  }
  else
  {
    unint64_t v12 = GSCurrentEventTimestamp();
  }
  *(void *)(v10 + 52) = v12;
  size_t v13 = *((unsigned int *)v10 + 18);
  if (*a1 == 3001 && v13 >= 0x28)
  {
    *((_DWORD *)v10 + 21) = a1[22];
    *((_WORD *)v10 + 44) = *((_WORD *)a1 + 46);
    *((_WORD *)v10 + 45) = *((_WORD *)a1 + 47);
    *((_DWORD *)v10 + 23) = a1[24];
    *((_DWORD *)v10 + 24) = a1[25];
    *((_DWORD *)v10 + 25) = a1[26];
    *((_DWORD *)v10 + 26) = a1[27];
    *((_DWORD *)v10 + 27) = a1[28];
    *((_DWORD *)v10 + 28) = a1[29];
    v10[116] = *((unsigned char *)a1 + 120);
    v10[117] = *((unsigned char *)a1 + 121);
    uint64_t v14 = *((unsigned __int8 *)a1 + 122);
    v10[118] = v14;
    if (v14 && 8 * v14 + 40 <= v13)
    {
      uint64_t v15 = 0;
      size_t v16 = a1 + 32;
      uint64_t v17 = 28 * v14;
      do
      {
        long long v18 = &v10[v15];
        v18[120] = *(unsigned char *)v16;
        *(_WORD *)(v18 + 121) = *(_WORD *)((char *)v16 + 1);
        *(void *)(v18 + 124) = *(void *)(v16 + 1);
        *(float32x2_t *)(v18 + 132) = vcvt_f32_f64(*((float64x2_t *)v16 + 1));
        *(void *)(v18 + 14_GSEventInitializeApp(0, 0) = v16[8];
        v15 += 28;
        v16 += 12;
      }
      while (v17 != v15);
    }
  }
  else
  {
    memcpy(v10 + 84, a1 + 22, v13);
  }
  *(_DWORD *)unsigned int v10 = 19;
  *((_DWORD *)v10 + 1) = v6;
  *((_DWORD *)v10 + 2) = a2;
  *((_DWORD *)v10 + 3) = 0;
  if (a3) {
    mach_msg_option_t v19 = 1;
  }
  else {
    mach_msg_option_t v19 = 17;
  }
  *((_DWORD *)v10 + 4) = 0;
  *((_DWORD *)v10 + 5) = 123;
  uint64_t v20 = mach_msg((mach_msg_header_t *)v10, v19, (v6 + 3) & 0xFFFFFFFC, 0, 0, 0, 0);
  if (v10 != v9) {
    free(v10);
  }
  return v20;
}

uint64_t GSSendSimpleEventWithSubtype(unsigned int a1, unsigned int a2, unsigned int a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  v4[0] = a1;
  v4[1] = a2;
  return GSSendEvent(v4, a3);
}

uint64_t GSSendSimpleEvent(unsigned int a1, unsigned int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  long long v4 = 0u;
  v3[0] = a1;
  v3[1] = 0;
  return GSSendEvent(v3, a2);
}

uint64_t GSEventVibrateForDuration(int a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  unsigned int v3 = 1100;
  int v9 = 0;
  int v10 = a1;
  DWORD1(v8) = 4;
  unsigned int v1 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v3, v1);
}

uint64_t GSEventStopVibrator()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  uint64_t v8 = 0;
  unsigned int v2 = 1100;
  DWORD1(v7) = 4;
  unsigned int v0 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v2, v0);
}

uint64_t GSEventLockDevice()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unsigned int v0 = GSGetPurpleSystemEventPort();
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  long long v4 = 0u;
  long long v3 = 0u;
  uint64_t v2 = 1014;
  return GSSendEvent((unsigned int *)&v2, v0);
}

uint64_t GSEventResetIdleTimer()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (GSEventsIdleTimerLog_onceToken != -1) {
    dispatch_once(&GSEventsIdleTimerLog_onceToken, &__block_literal_global_47);
  }
  unsigned int v0 = GSEventsIdleTimerLog_logTag;
  if (os_log_type_enabled((os_log_t)GSEventsIdleTimerLog_logTag, OS_LOG_TYPE_FAULT)) {
    GSEventResetIdleTimer_cold_1(v0);
  }
  int v9 = 0;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  long long v4 = 0u;
  unsigned int v3 = 100;
  unsigned int v1 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v3, v1);
}

uint64_t GSEventAccessoryAvailabilityChanged(int a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  unsigned int v4 = 4000;
  int v10 = 0;
  int v11 = a1;
  DWORD1(v9) = 8;
  int v12 = a2;
  unsigned int v2 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v4, v2);
}

uint64_t GSEventGetAccessoryKeyStateInfo(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

uint64_t GSEventCreateAccessoryKeyStateEvent(uint64_t result, int a2)
{
  if (result)
  {
    if ((*(_DWORD *)(result + 16) & 0xFFFDFFFF) == 0xFA1)
    {
      uint64_t result = GSEventCopy(result);
      *(_DWORD *)(result + 8_GSEventInitializeApp(0, 0) = a2;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double GSMainScreenPixelSize()
{
  if (*(float *)&__screenScale == 0.0) {
    FetchScreenInfoFromCapabilities();
  }
  return (float)__screenWidth;
}

CGFloat FetchScreenInfoFromCapabilities()
{
  __screenScale = 1065353216;
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v0, @"main-screen-width");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, &__screenWidth);
    }
    CFNumberRef v3 = (const __CFNumber *)CFDictionaryGetValue(v1, @"main-screen-height");
    if (v3) {
      CFNumberGetValue(v3, kCFNumberIntType, &__screenHeight);
    }
    CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(v1, @"main-screen-scale");
    if (v4) {
      CFNumberGetValue(v4, kCFNumberFloatType, &__screenScale);
    }
    CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(v1, @"main-screen-orientation");
    if (v5) {
      CFNumberGetValue(v5, kCFNumberFloatType, &__screenOrientation);
    }
    CFRelease(v1);
  }
  CFDataRef v6 = (const __CFData *)MGCopyAnswer();
  if (v6)
  {
    CFDataRef v7 = v6;
    BytePtr = CFDataGetBytePtr(v6);
    unint64_t Length = CFDataGetLength(v7);
    if (Length >= 0x10)
    {
      int v10 = &BytePtr[Length & 0xFFFFFFFFFFFFFFF0];
      double v11 = *((double *)v10 - 2);
      double v12 = *(float *)&__screenOrientation;
      if (fabs(*(float *)&__screenOrientation) >= 0.00000011920929
        && (fabs(v12 + -1.57079633) < 0.00000011920929 || fabs(v12 + -4.71238898) < 0.00000011920929))
      {
        double v13 = *((double *)v10 - 1);
      }
      else
      {
        double v13 = *((double *)v10 - 2);
        double v11 = *((double *)v10 - 1);
      }
      if (v13 != (double)__screenWidth && v11 != (double)__screenHeight)
      {
        __screenWidth = (int)v13;
        __screenHeight = (int)v11;
      }
    }
    CFRelease(v7);
  }
  if (*(float *)&__screenScale == 1.0)
  {
    BOOL v14 = __screenHeight == 960 || __screenHeight == 1136;
    BOOL v15 = v14;
    if (__screenWidth == 640 && v15
      || __screenWidth == 1536 && __screenHeight == 2048
      || __screenWidth == 2048 && __screenHeight == 1536)
    {
      __screenScale = 0x40000000;
    }
  }

  return ResetTransforms();
}

double GSMainScreenPointSize()
{
  float v0 = *(float *)&__screenScale;
  if (*(float *)&__screenScale == 0.0)
  {
    FetchScreenInfoFromCapabilities();
    float v0 = *(float *)&__screenScale;
  }
  return (float)((float)__screenWidth / v0);
}

float GSMainScreenOrientation()
{
  if (*(float *)&__screenScale == 0.0) {
    FetchScreenInfoFromCapabilities();
  }
  return *(float *)&__screenOrientation;
}

double GSMainScreenWindowTransform@<D0>(_OWORD *a1@<X8>)
{
  if (*(float *)&__screenScale == 0.0) {
    FetchScreenInfoFromCapabilities();
  }
  long long v2 = *(_OWORD *)&__screenWindowTransform[16];
  *a1 = *(_OWORD *)__screenWindowTransform;
  a1[1] = v2;
  double result = *(double *)&__screenWindowTransform[32];
  a1[2] = *(_OWORD *)&__screenWindowTransform[32];
  return result;
}

double GSMainScreenPositionTransform@<D0>(_OWORD *a1@<X8>)
{
  if (*(float *)&__screenScale == 0.0) {
    FetchScreenInfoFromCapabilities();
  }
  long long v2 = *(_OWORD *)&__screenPositionTransform[16];
  *a1 = *(_OWORD *)__screenPositionTransform;
  a1[1] = v2;
  double result = *(double *)&__screenPositionTransform[32];
  a1[2] = *(_OWORD *)&__screenPositionTransform[32];
  return result;
}

BOOL __GSEventEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16) && *(void *)(a1 + 64) == *(void *)(a2 + 64);
}

unint64_t __GSEventHash(uint64_t a1)
{
  return *(void *)(a1 + 64) / 0x3E8uLL;
}

CFStringRef __GSEventCopyDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, @"<GSEvent %p>{type = %x, windowLoc = (%f, %f)}", a1, *(unsigned int *)(a1 + 16), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void PurpleEventSignalCallback()
{
}

uint64_t PurpleEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    __lastRecievedPort = a4;
  }
  if (a1) {
    a1 = CreateWithMachMessage(a1);
  }
  _PurpleEventCallback(a1);
  return 0;
}

uint64_t CreateWithMachMessage(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 4);
  if (v1 < 0x54) {
    return 0;
  }
  unint64_t v3 = v1 - 84;
  if (*(_DWORD *)(a1 + 24) != 3001)
  {
    if (v3 >= *(unsigned int *)(a1 + 72)) {
      goto LABEL_9;
    }
    return 0;
  }
  if (v3 < 0x24 || 28 * (unint64_t)*(unsigned __int8 *)(a1 + 118) + 36 > v3) {
    return 0;
  }
LABEL_9:
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v4 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = *(_DWORD *)(a1 + 24);
    float32x2_t v7 = *(float32x2_t *)(a1 + 40);
    *(float64x2_t *)(Instance + 24) = vcvtq_f64_f32(*(float32x2_t *)(a1 + 32));
    *(_DWORD *)(Instance + 2_GSEventInitializeApp(0, 0) = *(_DWORD *)(a1 + 28);
    *(float64x2_t *)(Instance + 4_GSEventInitializeApp(0, 0) = vcvtq_f64_f32(v7);
    *(_DWORD *)(Instance + 56) = 0;
    *(void *)(Instance + 64) = *(void *)(a1 + 52);
    *(void *)(Instance + 72) = 0;
    *(_DWORD *)(Instance + 8_GSEventInitializeApp(0, 0) = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(Instance + 84) = 0;
    size_t v8 = *(unsigned int *)(a1 + 72);
    *(_DWORD *)(Instance + 88) = v8;
    *(void *)(Instance + 96) = *(void *)(a1 + 76);
    if (*(_DWORD *)(a1 + 24) == 3001)
    {
      *(_DWORD *)(Instance + 104) = *(_DWORD *)(a1 + 84);
      *(_WORD *)(Instance + 108) = *(_WORD *)(a1 + 88);
      *(_WORD *)(Instance + 11_GSEventInitializeApp(0, 0) = *(_WORD *)(a1 + 90);
      *(_DWORD *)(Instance + 112) = *(_DWORD *)(a1 + 92);
      *(_DWORD *)(Instance + 116) = *(_DWORD *)(a1 + 96);
      *(_DWORD *)(Instance + 12_GSEventInitializeApp(0, 0) = *(_DWORD *)(a1 + 100);
      *(_DWORD *)(Instance + 124) = *(_DWORD *)(a1 + 104);
      *(_DWORD *)(Instance + 128) = *(_DWORD *)(a1 + 108);
      *(_DWORD *)(Instance + 132) = *(_DWORD *)(a1 + 112);
      *(unsigned char *)(Instance + 136) = *(unsigned char *)(a1 + 116);
      *(unsigned char *)(Instance + 137) = *(unsigned char *)(a1 + 117);
      *(unsigned char *)(Instance + 138) = *(unsigned char *)(a1 + 118);
      if (*(unsigned char *)(a1 + 118))
      {
        unint64_t v9 = 0;
        uint64_t v10 = a1 + 120;
        double v11 = (void *)(Instance + 184);
        do
        {
          *((unsigned char *)v11 - 4_GSEventInitializeApp(0, 0) = *(unsigned char *)v10;
          *(_WORD *)((char *)v11 - 39) = *(_WORD *)(v10 + 1);
          *(void *)((char *)v11 - 36) = *(void *)(v10 + 4);
          *(float64x2_t *)(v11 - 3) = vcvtq_f64_f32(*(float32x2_t *)(v10 + 12));
          *((_DWORD *)v11 - 2) = *(_DWORD *)(v10 + 20);
          *double v11 = 0;
          v11 += 6;
          ++v9;
          v10 += 28;
        }
        while (v9 < *(unsigned __int8 *)(a1 + 118));
      }
    }
    else
    {
      memcpy((void *)(Instance + 104), (const void *)(a1 + 84), v8);
    }
    double v12 = (_DWORD *)(((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL) + a1);
    if (!*v12 && v12[1] >= 0x20u) {
      *(_DWORD *)(v4 + 84) = v12[10];
    }
  }
  return v4;
}

void _PurpleEventCallback(uint64_t cf)
{
  uint64_t v1 = (char *)cf;
  if (cf && _queue)
  {
    PurplePushEvent(&_queue, cf);
    uint64_t v1 = 0;
  }
  if (__lastRecievedPort)
  {
    uint64_t v2 = ReceiveEvent(__lastRecievedPort);
    if (v2)
    {
      uint64_t v3 = v2;
      do
      {
        PurplePushEvent(&_queue, v3);
        uint64_t v3 = ReceiveEvent(__lastRecievedPort);
      }
      while (v3);
    }
  }
  if (!v1)
  {
    if (!_queue) {
      return;
    }
    uint64_t v6 = *(void *)_queue;
    uint64_t v1 = *(char **)(_queue + 8);
    free((void *)_queue);
    _queue = v6;
    if (v6)
    {
      if (v1) {
        goto LABEL_9;
      }
    }
    else
    {
      qword_1EA622790 = 0;
      if (v1) {
        goto LABEL_9;
      }
    }
    if (!v6) {
      return;
    }
    goto LABEL_97;
  }
LABEL_9:
  int v4 = *((_DWORD *)v1 + 4);
  if (__disableHandEventCoalescing && v4 == 3001)
  {
    if (*((_DWORD *)v1 + 26) != 2) {
      __disableHandEventCoalescing = 0;
    }
LABEL_14:
    int v5 = *((_DWORD *)v1 + 26);
    if (v5 != 2 && v5 != 5) {
      goto LABEL_52;
    }
    goto LABEL_22;
  }
  if ((v4 & 0xFFFDFFFF) == 0xBB9) {
    goto LABEL_14;
  }
  if ((v4 & 0xFFFDFFFF) - 5 <= 1)
  {
LABEL_22:
    uint64_t v7 = _queue;
    if (!_queue) {
      goto LABEL_52;
    }
    size_t v8 = (void *)_queue;
    while (1)
    {
      unint64_t v9 = v8;
      size_t v8 = (void *)*v8;
      uint64_t v10 = (char *)v9[1];
      int v11 = *((_DWORD *)v1 + 4);
      int v12 = *((_DWORD *)v10 + 4);
      if (v11 == 3001 && v12 == 3001)
      {
        int v13 = *((_DWORD *)v1 + 26);
        unsigned int v14 = *((_DWORD *)v10 + 26);
        if (v13 != 5 && v14 != 5 && v13 == v14 && __disableHandEventCoalescing == 0)
        {
LABEL_43:
          CFRelease(v1);
          if ((void *)_queue == v9) {
            uint64_t v20 = &_queue;
          }
          else {
            uint64_t v20 = (uint64_t *)v7;
          }
          if ((void *)_queue == v9) {
            uint64_t v7 = (uint64_t)v8;
          }
          *uint64_t v20 = (uint64_t)v8;
          if ((void *)qword_1EA622790 == v9) {
            qword_1EA622790 = v7;
          }
          free(v9);
          uint64_t v1 = v10;
          unint64_t v9 = (void *)v7;
          goto LABEL_51;
        }
        BOOL v17 = v13 != 2 || v14 > 6;
        int v18 = (1 << v14) & 0x62;
        if (!v17 && v18 != 0) {
          goto LABEL_52;
        }
      }
      else if (v11 == v12)
      {
        goto LABEL_43;
      }
LABEL_51:
      uint64_t v7 = (uint64_t)v9;
      if (!v8) {
        goto LABEL_52;
      }
    }
  }
  if ((v4 & 0xFFFDFFFE) == 0x3F2)
  {
    uint64_t v21 = (void *)_queue;
    uint64_t v38 = 0;
    uint64_t v39 = _queue;
    if (_queue)
    {
      long long v22 = 0;
      char v23 = 0;
      do
      {
        uint64_t v24 = (uint64_t)v21;
        uint64_t v21 = (void *)*v21;
        uint64_t v25 = *(void *)(v24 + 8);
        int v26 = *((_DWORD *)v1 + 4);
        if (!v22)
        {
          int v34 = *(_DWORD *)(v25 + 16);
          if (v26 == 1010 && v34 == 1011 || (long long v22 = 0, v26 == 1011) && v34 == 1010)
          {
            uint64_t v38 = v39;
            long long v22 = (CFTypeRef *)v24;
          }
          goto LABEL_85;
        }
        int v27 = *(_DWORD *)(v25 + 16);
        if (v26 == 3001 && v27 == 3001)
        {
          int v28 = *((_DWORD *)v1 + 26);
          int v29 = *(_DWORD *)(v25 + 104);
          if (v28 == 5 || v29 == 5) {
            goto LABEL_85;
          }
          BOOL v32 = v28 == v29 && __disableHandEventCoalescing == 0;
          if (v32) {
            v33 = 0;
          }
          else {
            v33 = v22;
          }
          if ((v32 & v23) == 1) {
            goto LABEL_90;
          }
        }
        else
        {
          BOOL v32 = v26 == v27;
          char v35 = (v26 == v27) & v23;
          if (v32) {
            v33 = 0;
          }
          else {
            v33 = v22;
          }
          if (v35)
          {
LABEL_90:
            CFTypeRef v36 = *v22;
            RemoveNode((CFTypeRef *)v24, &v39, (uint64_t)v21);
            RemoveNode(v22, &v38, (uint64_t)*v22);
            long long v22 = 0;
            if (v36 == (CFTypeRef)v24) {
              uint64_t v39 = v38;
            }
            char v23 = 1;
            continue;
          }
        }
        v23 |= v32;
        long long v22 = v33;
LABEL_85:
        uint64_t v39 = v24;
      }
      while (v21);
    }
  }
LABEL_52:
  *(_OWORD *)(v1 + 24) = *(_OWORD *)(v1 + 40);
  *((void *)v1 + 9) = 0;
  if (__timeEventHandling && *((_DWORD *)v1 + 4) == 2007) {
    saveEventTimes();
  }
  if (__eventCallBack) {
    __eventCallBack(v1);
  }
  CFRelease(v1);
  if (_queue)
  {
LABEL_97:
    v37 = (__CFRunLoopSource *)__signalRunLoopSource;
    if (__signalRunLoopSource)
    {
      CFRunLoopSourceSignal(v37);
    }
  }
}

void *PurplePushEvent(void *a1, uint64_t a2)
{
  double result = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
  *double result = 0;
  result[1] = a2;
  int v5 = (void *)a1[1];
  if (v5) {
    *int v5 = result;
  }
  a1[1] = result;
  if (!*a1) {
    *a1 = result;
  }
  return result;
}

uint64_t ReceiveEvent(mach_port_name_t rcv_name)
{
  mach_msg_return_t v3;
  mach_msg_size_t v4;
  mach_msg_header_t *v5;
  mach_msg_size_t v6;
  uint64_t v7;
  mach_msg_header_t msg;
  uint64_t v10;

  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(void *)&msg.msgh_bits = 0x40000000000;
  msg.msgh_remote_port = 0;
  msg.msgh_local_port = rcv_name;
  p_msg = &msg;
  uint64_t v3 = mach_msg(&msg, 50331910, 0, 0x400u, rcv_name, 0, 0);
  if (v3 == 268451844)
  {
    int v4 = ((msg.msgh_size + 3) & 0xFFFFFFFC) + 52;
    int v5 = (mach_msg_header_t *)malloc_type_malloc(v4, 0x29910CD4uLL);
    if (v5)
    {
      p_msg = v5;
      uint64_t v6 = v4;
    }
    else
    {
      uint64_t v6 = 1024;
    }
    p_msg->msgh_bits = 0;
    p_msg->msgh_size = v6;
    p_msg->msgh_remote_port = 0;
    p_msg->msgh_local_port = rcv_name;
    uint64_t v3 = mach_msg(p_msg, 2, 0, v6, rcv_name, 0, 0);
  }
  if (v3 == 268451843)
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (v3) {
      ReceiveEvent_cold_1(v3);
    }
    uint64_t v7 = CreateWithMachMessage((uint64_t)p_msg);
  }
  if (p_msg != &msg) {
    free(p_msg);
  }
  return v7;
}

void RemoveNode(CFTypeRef *a1, uint64_t *a2, uint64_t a3)
{
  if ((CFTypeRef *)_queue == a1) {
    _queue = a3;
  }
  else {
    a2 = (uint64_t *)*a2;
  }
  *a2 = a3;
  if ((CFTypeRef *)qword_1EA622790 == a1) {
    qword_1EA622790 = 0;
  }
  CFRelease(a1[1]);

  free(a1);
}

void AddSourceForEventPort(uintptr_t handle, dispatch_queue_t queue)
{
  unsigned int v2 = handle;
  if (queue)
  {
    uint64_t v3 = dispatch_source_create(MEMORY[0x1E4F14458], handle, 0, queue);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = ___AddDispatchSourceForEventPort_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = v3;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(v3);
  }
  else
  {
    _AddRunLoopSourceForEventPort(handle, (const __CFString *)*MEMORY[0x1E4F1D410]);
    _AddRunLoopSourceForEventPort(v2, @"GSEventReceiveRunLoopMode");
  }
}

void _AddRunLoopSourceForEventPort(unsigned int a1, const __CFString *a2)
{
  context.version = 1;
  context.info = (void *)a1;
  memset(&context.retain, 0, 40);
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))GetPortForInfo;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))PurpleEventCallback;
  uint64_t v3 = CFRunLoopSourceCreate(0, -1, &context);
  CFRunLoopAddSource((CFRunLoopRef)__eventRunLoop, v3, a2);
  CFRelease(v3);
}

void _GSWriteStackshot(const char *a1)
{
  uint64_t v1 = a1;
  if (_GSWriteStackshot_once == -1)
  {
    if (a1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&_GSWriteStackshot_once, &__block_literal_global);
    if (v1)
    {
LABEL_3:
      if (*v1) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v1 = "(Unknown)";
LABEL_5:
  unsigned int v2 = (void (*)(const char *, uint64_t))_GSWriteStackshot_dyfunc_WriteStackshotReport_stdc;
  if (_GSWriteStackshot_dyfunc_WriteStackshotReport_stdc)
  {
    v2(v1, 3131936839);
  }
}

uint64_t __GetTimebase_block_invoke()
{
  uint64_t result = mach_timebase_info((mach_timebase_info_t)&GetTimebase___timebase);
  if (result)
  {
    GetTimebase___timebase = 0x100000001;
  }
  else if (GetTimebase___timebase != HIDWORD(GetTimebase___timebase))
  {
    if (GetTimebase___timebase >= HIDWORD(GetTimebase___timebase)) {
      unint64_t v1 = HIDWORD(GetTimebase___timebase);
    }
    else {
      unint64_t v1 = GetTimebase___timebase;
    }
    if (GetTimebase___timebase <= HIDWORD(GetTimebase___timebase)) {
      unint64_t v2 = HIDWORD(GetTimebase___timebase);
    }
    else {
      unint64_t v2 = GetTimebase___timebase;
    }
    if (v1)
    {
      do
      {
        unint64_t v3 = v1;
        unint64_t v1 = v2 % v1;
        unint64_t v2 = v3;
      }
      while (v1);
    }
    else
    {
      unint64_t v3 = v2;
    }
    LODWORD(GetTimebase___timebase) = GetTimebase___timebase / v3;
    HIDWORD(GetTimebase___timebase) = HIDWORD(GetTimebase___timebase) / v3;
  }
  return result;
}

uint64_t DispatchThread(int a1)
{
  sched_param v15 = (sched_param)63;
  unint64_t v2 = pthread_self();
  pthread_setschedparam(v2, 2, &v15);
  BOOL v3 = 0;
  while (1)
  {
    pthread_mutex_lock(&__dispatchQueuesLock);
    if (__dispatchQueues && (CFIndex Count = CFArrayGetCount((CFArrayRef)__dispatchQueues), Count >= 1))
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = (uint64_t **)CFArrayGetValueAtIndex((CFArrayRef)__dispatchQueues, v6);
        if (*((_DWORD *)ValueAtIndex + 4) == a1) {
          break;
        }
        if (v5 == ++v6) {
          goto LABEL_7;
        }
      }
      size_t v8 = ValueAtIndex;
    }
    else
    {
LABEL_7:
      size_t v8 = 0;
    }
    unint64_t v9 = *v8;
    if (!*v8) {
      break;
    }
    int v11 = (uint64_t *)*v9;
    uint64_t v10 = (int *)v9[1];
    free(v9);
    void *v8 = v11;
    if (!v11) {
      v8[1] = 0;
    }
    pthread_mutex_unlock(&__dispatchQueuesLock);
    if (v10 != 0 && !v3)
    {
      BOOL v3 = _GSSendEvent(v10 + 4, a1, 1) == 268435459;
      goto LABEL_16;
    }
    if (v10) {
LABEL_16:
    }
      CFRelease(v10);
  }
  CFArrayRef v12 = (const __CFArray *)__dispatchQueues;
  v16.length = CFArrayGetCount((CFArrayRef)__dispatchQueues);
  v16.location = 0;
  FirstIndexOfCFNumberRef Value = CFArrayGetFirstIndexOfValue(v12, v16, v8);
  CFArrayRemoveValueAtIndex((CFMutableArrayRef)__dispatchQueues, FirstIndexOfValue);
  free(v8);
  if (!CFArrayGetCount((CFArrayRef)__dispatchQueues))
  {
    CFRelease((CFTypeRef)__dispatchQueues);
    __dispatchQueues = 0;
  }
  pthread_mutex_unlock(&__dispatchQueuesLock);
  return 0;
}

os_log_t __GSEventsIdleTimerLog_block_invoke()
{
  os_log_t result = os_log_create("GraphicsServices", "IdleTimer");
  GSEventsIdleTimerLog_logTag = (uint64_t)result;
  return result;
}

uint64_t GSSystemHasCapability(const __CFString *a1)
{
  if (CFStringCompare(a1, @"explicitContentRestriction", 0)) {
    abort();
  }
  return MGGetBoolAnswer();
}

uint64_t GSKeyboardGetTypeID()
{
  return __kGSKeyboardTypeID;
}

uint64_t GSKeyboardHWKeyboardLayoutsPlist()
{
  format[1] = *(CFPropertyListFormat *)MEMORY[0x1E4F143B8];
  uint64_t result = GSKeyboardHWKeyboardLayoutsPlist_plist;
  if (!GSKeyboardHWKeyboardLayoutsPlist_plist)
  {
    CFStringRef v1 = KeyboardLayoutsResourcePath();
    CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%@/USBKeyboardLayouts.plist", v1);
    CFStringGetMaximumSizeOfFileSystemRepresentation(v2);
    MEMORY[0x1F4188790]();
    int v4 = (char *)format - v3;
    CFStringGetFileSystemRepresentation(v2, (char *)format - v3, v5);
    size_t v6 = strlen(v4);
    CFURLRef v7 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)v4, v6, 0);
    size_t v8 = CFReadStreamCreateWithFile(0, v7);
    CFRelease(v2);
    CFRelease(v7);
    if (v8)
    {
      CFReadStreamOpen(v8);
      format[0] = 0;
      GSKeyboardHWKeyboardLayoutsPlist_plist = (uint64_t)CFPropertyListCreateWithStream(0, v8, 0, 0, format, 0);
      CFReadStreamClose(v8);
      CFRelease(v8);
      return GSKeyboardHWKeyboardLayoutsPlist_plist;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "*** error: cannot create stream: %s\n", v4);
      return 0;
    }
  }
  return result;
}

CFStringRef KeyboardLayoutsResourcePath()
{
  CFStringRef result = (CFStringRef)KeyboardLayoutsResourcePath_path;
  if (!KeyboardLayoutsResourcePath_path)
  {
    CFStringRef v1 = GSSystemRootDirectory();
    CFStringRef result = CFStringCreateWithFormat(0, 0, @"%@/System/Library/KeyboardLayouts/USBKeyboardLayouts.bundle", v1);
    KeyboardLayoutsResourcePath_path = (uint64_t)result;
  }
  return result;
}

uint64_t GSKeyboardCreate(const __CFString *a1, int a2)
{
  return GSKeyboardCreateWithCountryCode(a1, a2, 0);
}

uint64_t GSKeyboardCreateWithCountryCode(const __CFString *a1, int a2, int a3)
{
  int v15 = 0;
  int v13 = 0;
  size_t v14 = 0;
  if (!InitFileDataForLayoutName(a1, &v15, &v14, &v13)) {
    return 0;
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v7 = Instance;
  if (Instance)
  {
    int v8 = 2 * (a3 == 15);
    if (a2 != 255) {
      int v8 = a2;
    }
    *(_DWORD *)(Instance + 16) = v15;
    unint64_t v9 = v13;
    size_t v10 = v14;
    *(void *)(Instance + 24) = v13;
    *(void *)(Instance + 32) = v10;
    *(void *)(Instance + 4_GSEventInitializeApp(0, 0) = v9;
    *(_DWORD *)(Instance + 48) = v8;
    *(unsigned char *)(Instance + 62) = a3;
    *(void *)(Instance + 52) = 0;
    *(_WORD *)(Instance + 6_GSEventInitializeApp(0, 0) = 0;
    if (a1)
    {
      *(void *)(Instance + 72) = CFRetain(a1);
      CFDictionaryRef Locale = KeyboardLayoutCreateLocale((uint64_t)a1);
    }
    else
    {
      CFDictionaryRef Locale = 0;
      *(void *)(v7 + 72) = 0;
    }
    *(void *)(v7 + 16_GSEventInitializeApp(0, 0) = Locale;
    *(void *)(v7 + 168) = 0;
    *(void *)(v7 + 144) = 0;
    *(void *)(v7 + 152) = 0;
    *(_DWORD *)(v7 + 64) = 1490092032;
    pthread_mutex_init((pthread_mutex_t *)(v7 + 80), 0);
  }
  else
  {
    munmap(v13, v14);
    close(v15);
  }
  return v7;
}

uint64_t InitFileDataForLayoutName(const __CFString *a1, int *a2, size_t *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v8 = (const __CFDictionary *)GSKeyboardHWKeyboardLayoutsForName((uint64_t)a1);
  if (v8
    && (CFNumberRef Value = CFDictionaryGetValue(v8, @"KeyLayoutFileName"),
        CFStringRef v10 = KeyboardLayoutsResourcePath(),
        (CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%@/uchrs/%@", v10, Value)) != 0)
    || (CFArrayRef v12 = GSSystemRootDirectory(),
        (CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%@/System/Library/CoreServices/SpringBoard.app/US.uchr", v12)) != 0))
  {
    CFStringGetMaximumSizeOfFileSystemRepresentation(v11);
    int v13 = (char *)&v27 - ((MEMORY[0x1F4188790]() + 16) & 0xFFFFFFFFFFFFFFF0);
    CFStringGetFileSystemRepresentation(v11, v13, v14);
    CFRelease(v11);
    int v15 = open(v13, 0, 256);
    if (v15 < 0)
    {
      uint64_t v20 = (FILE *)*MEMORY[0x1E4F143C8];
      uint64_t v21 = __error();
      long long v22 = strerror(*v21);
      fprintf(v20, "GSKeyboardRef: file open error: %s, (%s)\n", v13, v22);
      return 0;
    }
    int v16 = v15;
    memset(&v27, 0, sizeof(v27));
    if (stat(v13, &v27)) {
      goto LABEL_6;
    }
    LODWORD(v24) = v27.st_size;
    if (!v27.st_size) {
      goto LABEL_7;
    }
    unsigned int v25 = getpagesize();
    size_t v24 = v24 % v25 ? v25 + v25 * (v24 / v25) : v24;
    int v26 = mmap(0, v24, 1, 1, v16, 0);
    if (v26 == -1)
    {
LABEL_6:
      BOOL v17 = (FILE *)*MEMORY[0x1E4F143C8];
      int v18 = __error();
      mach_msg_option_t v19 = strerror(*v18);
      fprintf(v17, "GSKeyboardRef: stat error: %s\n", v19);
LABEL_7:
      close(v16);
      return 0;
    }
    *a2 = v16;
    *a3 = v24;
    uint64_t result = 1;
    *a4 = v26;
  }
  else
  {
    CFStringGetCString(a1, (char *)&v27, 127, 0x8000100u);
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "GSKeyboardRef: cannot find keylayout for: %s\n", (const char *)&v27);
    return 0;
  }
  return result;
}

CFDictionaryRef KeyboardLayoutCreateLocale(uint64_t a1)
{
  CFDictionaryRef result = (const __CFDictionary *)GSKeyboardHWKeyboardLayoutsForName(a1);
  if (result)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(result, @"Locale");
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    return CFLocaleCreate(v3, Value);
  }
  return result;
}

void GSKeyboardRelease(uint64_t a1)
{
  if (a1)
  {
    CFStringRef v2 = *(const void **)(a1 + 144);
    if (v2) {
      CFRelease(v2);
    }
    CFAllocatorRef v3 = *(const void **)(a1 + 152);
    if (v3) {
      CFRelease(v3);
    }
    int v4 = *(const void **)(a1 + 168);
    if (v4) {
      CFRelease(v4);
    }
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 80));
    munmap(*(void **)(a1 + 24), *(void *)(a1 + 32));
    close(*(_DWORD *)(a1 + 16));
    CFRelease((CFTypeRef)a1);
  }
}

uint64_t GSKeyboardReset(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFStringRef v2 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    CFAllocatorRef v3 = *(const void **)(v1 + 144);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(v1 + 144) = 0;
    }
    int v4 = *(const void **)(v1 + 152);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(v1 + 152) = 0;
    }
    CFIndex v5 = *(const void **)(v1 + 168);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(v1 + 168) = 0;
    }
    *(_WORD *)(v1 + 6_GSEventInitializeApp(0, 0) = 0;
    *(void *)(v1 + 52) = 0;
    return pthread_mutex_unlock(v2);
  }
  return result;
}

void GSKeyboardSetLayout(uint64_t a1, const __CFString *a2)
{
  if (a1)
  {
    if (a2)
    {
      int v4 = (pthread_mutex_t *)(a1 + 80);
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
      CFStringRef v5 = *(const __CFString **)(a1 + 72);
      pthread_mutex_unlock(v4);
      if (CFStringCompare(v5, a2, 0))
      {
        int v15 = 0;
        uint64_t v13 = 0;
        size_t v14 = 0;
        if (InitFileDataForLayoutName(a2, &v15, &v14, &v13))
        {
          pthread_mutex_lock(v4);
          size_t v6 = *(void **)(a1 + 24);
          size_t v7 = *(void *)(a1 + 32);
          int v8 = *(_DWORD *)(a1 + 16);
          unint64_t v9 = *(const void **)(a1 + 72);
          *(_DWORD *)(a1 + 16) = v15;
          uint64_t v10 = v13;
          size_t v11 = v14;
          *(void *)(a1 + 24) = v13;
          *(void *)(a1 + 32) = v11;
          *(void *)(a1 + 4_GSEventInitializeApp(0, 0) = v10;
          *(_DWORD *)(a1 + 52) = 0;
          *(void *)(a1 + 72) = CFRetain(a2);
          *(void *)(a1 + 16_GSEventInitializeApp(0, 0) = KeyboardLayoutCreateLocale((uint64_t)a2);
          CFArrayRef v12 = *(const void **)(a1 + 168);
          if (v12)
          {
            CFRelease(v12);
            *(void *)(a1 + 168) = 0;
          }
          pthread_mutex_unlock(v4);
          munmap(v6, v7);
          close(v8);
          CFRelease(v9);
        }
      }
    }
  }
}

uint64_t GSKeyboardGetLayout(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    CFStringRef v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    uint64_t v1 = *(void *)(v1 + 72);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetLocale(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    CFStringRef v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    uint64_t v1 = *(void *)(v1 + 160);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardSetHardwareKeyboardAttached(uint64_t result, int a2)
{
  if (result) {
    return GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType(a2, *(unsigned __int8 *)(result + 62), *(unsigned __int8 *)(result + 48));
  }
  return result;
}

uint64_t GSKeyboardSetTranslationOptions(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    if (a2 & 1) == 0 && (*(unsigned char *)(v3 + 64))
    {
      *(_DWORD *)(v3 + 58) = 0;
      *(_WORD *)(v3 + 56) &= ~4u;
    }
    *(_DWORD *)(v3 + 64) = a2;
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t GSKeyboardGetTranslationOptions(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    CFStringRef v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    uint64_t v1 = *(unsigned int *)(v1 + 64);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetModifierState(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    CFStringRef v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    uint64_t v1 = *(unsigned __int16 *)(v1 + 56) << 16;
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetLiveModifierState(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    CFStringRef v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    uint64_t v1 = *(unsigned __int16 *)(v1 + 58) << 16;
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetStickyLockModifierState(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    CFStringRef v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    uint64_t v1 = *(unsigned __int16 *)(v1 + 60) << 16;
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetHWKeyboardType(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 48);
  if ((int)result <= 201)
  {
    switch(result)
    {
      case 0:
        LODWORD(result) = 202;
        goto LABEL_16;
      case 1:
        LODWORD(result) = 203;
        goto LABEL_16;
      case 2:
        LODWORD(result) = 207;
LABEL_16:
        if ((result - 204) >= 0xFFFFFFFE || result == 207 || result == 0) {
          return result;
        }
        else {
          return 0;
        }
    }
LABEL_13:
    if (result > 0xCF || (result - 194) >= 0xFFFFFF5D) {
      LODWORD(result) = (((int)result - 1) % 3u) | 0xCC;
    }
    goto LABEL_16;
  }
  if ((result - 202) > 5 || ((1 << (result + 54)) & 0x23) == 0) {
    goto LABEL_13;
  }
  return result;
}

uint64_t GSKeyboardSetLayoutContext(uint64_t result, const void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    CFStringRef v5 = *(const void **)(v3 + 168);
    if (v5 != a2)
    {
      if (v5) {
        CFRelease(v5);
      }
      if (a2) {
        CFTypeRef v6 = CFRetain(a2);
      }
      else {
        CFTypeRef v6 = 0;
      }
      *(void *)(v3 + 168) = v6;
    }
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t GSKeyboardGetLayoutContext(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    CFStringRef v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    uint64_t v1 = *(void *)(v1 + 168);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardHWKeyboardNormalizeInput(uint64_t a1, const void **a2, _DWORD *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFTypeRef v6 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  GSKeyboardEnsureHWKeyboardNormalizationMap(a1);
  unsigned __int16 Value = (unsigned __int16)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), *a2);
  if (Value)
  {
    unsigned int v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 152), *a2);
    unsigned __int16 v12 = 8;
    MEMORY[0x1F4188790]();
    int v11 = 0;
    if (!GSKeyTranslate(a1, Value, 0, 0, 1, &v11, 8u, &v12, (uint64_t)v10))
    {
      *a2 = (id)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, v12);
      *a3 |= v8;
    }
  }
  return pthread_mutex_unlock(v6);
}

void GSKeyboardEnsureHWKeyboardNormalizationMap(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 144))
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
    int v4 = CFDictionaryCreateMutable(v2, 0, v3, 0);
    for (uint64_t i = 0; i != 16; ++i)
    {
      CFTypeRef v6 = (const void *)GSKeyboardEnsureHWKeyboardNormalizationMap_modifierCombinations[i];
      for (uint64_t j = 4; j != 57; ++j)
      {
        unsigned __int16 v12 = 8;
        MEMORY[0x1F4188790]();
        int v11 = 0;
        if (!GSKeyTranslate(a1, (unsigned __int16)j, 0, SWORD1(v6), 1, &v11, v12, &v12, (uint64_t)v9))
        {
          CFStringRef v8 = CFStringCreateWithCharacters(v2, v9, v12);
          if (!CFDictionaryContainsKey(v4, v8))
          {
            CFDictionarySetValue(v4, v8, v6);
            CFDictionarySetValue(Mutable, v8, (const void *)j);
          }
          CFRelease(v8);
        }
      }
    }
    *(void *)(a1 + 144) = Mutable;
    *(void *)(a1 + 152) = v4;
  }
}

uint64_t GSKeyTranslate(uint64_t a1, unsigned int a2, unsigned int a3, __int16 a4, char a5, int *a6, unsigned int a7, unsigned __int16 *a8, uint64_t a9)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  __int16 v11 = a4 & 0xFAFE | 0x101;
  if ((a4 & 0x400) == 0) {
    __int16 v11 = a4;
  }
  if ((v11 & 0x100) != 0) {
    LOBYTE(v11) = v11 & 0xFE | 1;
  }
  if ((v11 & 0x80) != 0) {
    LOBYTE(v11) = v11 & 0x6F | 0x10;
  }
  if ((v11 & 0x20) != 0) {
    LOBYTE(v11) = v11 & 0xDD | 2;
  }
  if ((v11 & 0x40) != 0) {
    unsigned __int8 v12 = v11 & 0xB7 | 8;
  }
  else {
    unsigned __int8 v12 = v11;
  }
  if (!v10 || *(_WORD *)v10 != 4098) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a9)
  {
    if (a8)
    {
      if (a6)
      {
        if (a3 <= 3)
        {
          int v17 = *(_DWORD *)(v10 + 8);
          if (v17)
          {
            *a8 = 0;
            unsigned int v21 = (unsigned __int16)*a6;
            if (a3) {
              unsigned int v22 = 0;
            }
            else {
              unsigned int v22 = (unsigned __int16)*a6;
            }
            unsigned int v23 = HIWORD(*a6);
            int v70 = (unsigned __int16)*a6;
            if (a3 == 2) {
              unsigned int v21 = HIWORD(*a6);
            }
            unsigned int v67 = v21;
            if (a3 != 2) {
              unsigned int v23 = v22;
            }
            int v69 = v23;
            unsigned int HWKeyboardType = GSKeyboardGetHWKeyboardType(a1);
            unsigned int v25 = (unsigned int *)(v10 + 12);
            int v26 = v17 - 1;
            if (v17 != 1)
            {
              stat v27 = (unsigned int *)(v10 + 40);
              while (HWKeyboardType < *v27 || HWKeyboardType > v27[1])
              {
                v27 += 7;
                if (!--v26) {
                  goto LABEL_37;
                }
              }
              unsigned int v25 = v27;
            }
LABEL_37:
            uint64_t v28 = v25[2];
            int v29 = (unsigned __int16 *)(v10 + v28);
            v30 = (FILE **)MEMORY[0x1E4F143C8];
            if (v28 > 0x4000)
            {
              v31 = v25;
              fprintf((FILE *)*MEMORY[0x1E4F143C8], "GSKeyTranslate - uchr may be corrupt, keyLayoutPtr %08lX, keyModsToTableNumPtr %08lX, keyModifiersToTableNumOffset %08X\n", v10, v10 + v28, v28);
              v30 = (FILE **)MEMORY[0x1E4F143C8];
              unsigned int v25 = v31;
            }
            if (*v29 != 12289)
            {
              fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, keyModifiersToTableNumFormat %04X\n", *v29);
              uint64_t result = 0xFFFFFFFFLL;
              int v33 = v69;
              int v34 = v70;
LABEL_83:
              *a6 = v34 | (v33 << 16);
              return result;
            }
            if (v12 >= *((_DWORD *)v29 + 1)) {
              unsigned int v32 = v29[1];
            }
            else {
              unsigned int v32 = *((unsigned __int8 *)v29 + v12 + 8);
            }
            uint64_t v35 = v10 + v25[3];
            int v34 = v70;
            if (*(_WORD *)v35 == 16385)
            {
              if (*(unsigned __int16 *)(v35 + 2) <= a2)
              {
                LOWORD(v37) = -1;
                __int16 v38 = -16385;
                uint64_t v36 = a9;
              }
              else
              {
                uint64_t v36 = a9;
                if (*(_DWORD *)(v35 + 4) <= v32)
                {
                  LOWORD(v37) = -1;
                  __int16 v38 = -16385;
                }
                else
                {
                  int v37 = *(__int16 *)(v10 + *(unsigned int *)(v35 + 4 * v32 + 8) + 2 * a2);
                  __int16 v38 = v37 - 0x4000;
                  if (v37 >= 0x4000)
                  {
                    uint64_t v39 = v25[4];
                    if (v39)
                    {
                      v40 = (_WORD *)(v10 + v39);
                      if (*v40 == 20481)
                      {
                        uint64_t v41 = v37 & 0x3FFF;
                        if (v41 >= (unsigned __int16)v40[1])
                        {
                          fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, stateRecordIndex %04X >= keyStateRecordCount %04X\n");
                        }
                        else
                        {
                          uint64_t v42 = *(unsigned int *)&v40[2 * v41 + 2];
                          v43 = (unsigned __int16 *)(v10 + v42);
                          BOOL v45 = (a5 & 1) == 0 && a3 != 1;
                          if (v67)
                          {
                            int v46 = v43[2];
                            if (v43[2])
                            {
                              int v47 = v43[3];
                              if (v47 != 2)
                              {
                                if (v47 == 1)
                                {
                                  v48 = (unsigned __int16 *)(v42 + v10 + 10);
                                  while (1)
                                  {
                                    unsigned int v49 = *(v48 - 1);
                                    if (v67 <= v49) {
                                      break;
                                    }
                                    --v46;
                                    v48 += 2;
                                    if (!(_WORD)v46) {
                                      goto LABEL_101;
                                    }
                                  }
                                  if (v67 == v49)
                                  {
                                    uint64_t result = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, *v48, a7, a8, a9);
                                    int v55 = 0;
LABEL_123:
                                    int v33 = v69;
                                    if (a3 == 3 && v55 == 0)
                                    {
                                      int v33 = 0x8000;
                                      int v34 = 0;
                                    }
                                    else
                                    {
                                      int v34 = v55;
                                    }
                                    goto LABEL_83;
                                  }
                                  goto LABEL_101;
                                }
                                fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, invalid stateEntryFormat %04X\n");
                                goto LABEL_66;
                              }
                              v53 = (unsigned __int16 *)(v42 + v10 + 14);
                              do
                              {
                                unsigned int v54 = *(v53 - 3);
                                if (v67 < v54) {
                                  break;
                                }
                                if (*((unsigned __int8 *)v53 - 4) + v54 >= v67)
                                {
                                  __int16 v58 = (v67 - v54) * *((unsigned __int8 *)v53 - 3);
                                  unsigned int v59 = *(v53 - 1);
                                  if (v59 >= 0xFFFE) {
                                    __int16 v60 = 0;
                                  }
                                  else {
                                    __int16 v60 = (v67 - v54) * *((unsigned __int8 *)v53 - 3);
                                  }
                                  unsigned __int16 v61 = v60 + v59;
                                  int v62 = *v53;
                                  unsigned __int16 v63 = v62 + v58;
                                  if (v62) {
                                    unsigned __int16 v64 = v63;
                                  }
                                  else {
                                    unsigned __int16 v64 = 0;
                                  }
                                  uint64_t v65 = (uint64_t)v25;
                                  int v66 = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, v61, a7, a8, a9);
                                  if (v45) {
                                    int v55 = v64;
                                  }
                                  else {
                                    int v55 = 0;
                                  }
                                  if (v66)
                                  {
                                    uint64_t result = 0xFFFFFFFFLL;
                                  }
                                  else if ((a5 & 1) != 0 || (a3 | 2) == 3)
                                  {
                                    uint64_t result = GSKeyEmitStateTerminator(v10, v65, v64, a7, a8, a9);
                                  }
                                  else
                                  {
                                    uint64_t result = 0;
                                  }
                                  goto LABEL_123;
                                }
                                --v46;
                                v53 += 4;
                              }
                              while ((_WORD)v46);
                            }
LABEL_101:
                            if (a3 == 3
                              || (v56 = v25,
                                  int v57 = GSKeyEmitStateTerminator(v10, (uint64_t)v25, v67, a7, a8, a9),
                                  unsigned int v25 = v56,
                                  !v57))
                            {
                              uint64_t result = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, *v43, a7, a8, a9);
                            }
                            else
                            {
                              uint64_t result = 0xFFFFFFFFLL;
                            }
                            int v33 = 0;
                            if (v45) {
                              int v34 = v43[1];
                            }
                            else {
                              int v34 = 0;
                            }
                            goto LABEL_83;
                          }
                          uint64_t v68 = (uint64_t)v25;
                          int v52 = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, *v43, a7, a8, a9);
                          if (v45) {
                            int v34 = v43[1];
                          }
                          if (!v52)
                          {
                            if ((a5 & 1) != 0 || (a3 | 2) == 3) {
                              uint64_t result = GSKeyEmitStateTerminator(v10, v68, v43[1], a7, a8, a9);
                            }
                            else {
                              uint64_t result = 0;
                            }
                            goto LABEL_67;
                          }
                        }
                      }
                      else
                      {
                        fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, keyStateRecordsIndexFormat %04X\n");
                      }
                    }
                    else
                    {
                      fwrite("GSKeyTranslate - uchr may be corrupt, keyStateRecordsIndexOffset 0\n", 0x43uLL, 1uLL, *v30);
                    }
LABEL_66:
                    uint64_t result = 0xFFFFFFFFLL;
LABEL_67:
                    int v33 = v69;
                    goto LABEL_83;
                  }
                }
              }
              int v33 = v69;
              if (v67)
              {
                if (a3 == 3)
                {
                  int v33 = 0;
                  int v34 = 0;
                }
                else
                {
                  v50 = v25;
                  int v33 = 0;
                  if (GSKeyEmitStateTerminator(v10, (uint64_t)v25, v67, a7, a8, v36))
                  {
                    uint64_t result = 0xFFFFFFFFLL;
                    int v34 = 0;
                    goto LABEL_83;
                  }
                  int v34 = 0;
                  unsigned int v25 = v50;
                }
              }
              if (v38 < 0)
              {
                if ((unsigned __int16)v37 > 0xFFFDu)
                {
                  uint64_t result = 0;
                }
                else
                {
                  uint64_t v51 = *a8;
                  if (v51 >= a7)
                  {
                    uint64_t result = 0xFFFFFFFFLL;
                  }
                  else
                  {
                    uint64_t result = 0;
                    *a8 = v51 + 1;
                    *(_WORD *)(v36 + 2 * v51) = v37;
                  }
                }
              }
              else
              {
                uint64_t result = GSKeyEmitSequence(v10, (uint64_t)v25, (unsigned __int16)v37, a7, a8, v36);
              }
              goto LABEL_83;
            }
            fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, keyToCharTableIndexFormat %04X\n");
            goto LABEL_66;
          }
        }
      }
    }
  }
  return result;
}

uint64_t GSKeyboardGetKeyCodeForChar(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFTypeRef v6 = (pthread_mutex_t *)(a1 + 80);
  uint64_t v7 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  unsigned int v8 = HIWORD(a3);
  int v9 = 4;
  do
  {
    unsigned __int16 v19 = 8;
    MEMORY[0x1F4188790](v7);
    int v18 = 0;
    uint64_t v7 = GSKeyTranslate(a1, (unsigned __int16)v9, 0, v8, 1, &v18, v19, &v19, (uint64_t)v17);
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v19 == 0;
    }
    BOOL v11 = !v10 && v17[0] == a2;
    int v12 = v11;
    int v13 = v9 + 1;
    if (v11) {
      break;
    }
    BOOL v10 = v9++ == 56;
  }
  while (!v10);
  unsigned int v14 = v13 - 1;
  if (v12) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0xFFFFFFFFLL;
  }
  pthread_mutex_unlock(v6);
  return v15;
}

uint64_t GSKeyboardTranslateKeyWithModifiers(uint64_t a1, int a2, unsigned int a3, int a4, char a5, unsigned int a6, unsigned __int16 *a7, uint64_t a8)
{
  __int16 v12 = HIWORD(a4);
  int v16 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  if (a2 == 88) {
    int v17 = 40;
  }
  else {
    int v17 = a2;
  }
  if (a2 == 133) {
    int v18 = 54;
  }
  else {
    int v18 = v17;
  }
  if (a2 == 50) {
    unsigned int v19 = 49;
  }
  else {
    unsigned int v19 = v18;
  }
  if (a3 == 1)
  {
    uint64_t v20 = 0;
  }
  else
  {
    int v22 = 0;
    uint64_t v20 = GSKeyTranslate(a1, v19, a3, v12, a5, &v22, a6, a7, a8);
  }
  pthread_mutex_unlock(v16);
  return v20;
}

uint64_t GSKeyboardTranslateKey(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned __int16 *a6, uint64_t a7, unsigned __int16 *a8, uint64_t a9, unsigned __int16 *a10, uint64_t a11)
{
  int v12 = 0;
  return GSKeyboardTranslateKeyExtendedCommandWithUsagePage(a1, a2, a3, a5, a6, a7, a8, a9, (unsigned __int16 *)&v12 + 1, 0, (unsigned __int16 *)&v12, 0, a10, a11, 7);
}

uint64_t GSKeyboardTranslateKeyExtendedCommand(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5, uint64_t a6, unsigned __int16 *a7, uint64_t a8, unsigned __int16 *a9, uint64_t a10, unsigned __int16 *a11, uint64_t a12, unsigned __int16 *a13, uint64_t a14)
{
  return GSKeyboardTranslateKeyExtendedCommandWithUsagePage(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, 7);
}

uint64_t GSKeyboardTranslateKeyExtended(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5, uint64_t a6, unsigned __int16 *a7, uint64_t a8, unsigned __int16 *a9, uint64_t a10, unsigned __int16 *a11, uint64_t a12)
{
  unsigned __int16 v13 = 0;
  return GSKeyboardTranslateKeyExtendedCommandWithUsagePage(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, &v13, 0, a11, a12, 7);
}

uint64_t GSKeyboardTranslateKeyExtendedCommandWithUsagePage(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5, uint64_t a6, unsigned __int16 *a7, uint64_t a8, unsigned __int16 *a9, uint64_t a10, unsigned __int16 *a11, uint64_t a12, unsigned __int16 *a13, uint64_t a14, uint64_t a15)
{
  unsigned int v23 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  unsigned int v24 = *(_DWORD *)(a1 + 64);
  switch(a2)
  {
    case 0xE0u:
    case 0xE4u:
      int v25 = 16;
      a2 = 224;
      switch((v24 >> 22) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    case 0xE1u:
    case 0xE5u:
      int v25 = 16;
      a2 = 224;
      switch((v24 >> 19) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    case 0xE2u:
    case 0xE6u:
      int v25 = 16;
      a2 = 224;
      switch((v24 >> 25) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    case 0xE3u:
    case 0xE7u:
      int v25 = 16;
      a2 = 224;
      switch((v24 >> 28) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    default:
      if (!a2)
      {
LABEL_11:
        pthread_mutex_unlock(v23);
        return 0;
      }
      if (a2 == 57)
      {
        int v25 = 16;
        a2 = 224;
        switch(HIWORD(v24) & 7)
        {
          case 1:
LABEL_9:
            if (a3)
            {
              *(_WORD *)(a1 + 58) &= ~4u;
              __int16 v26 = *(_WORD *)(a1 + 56);
            }
            else
            {
              __int16 v26 = *(_WORD *)(a1 + 56) ^ 4;
              *(_WORD *)(a1 + 56) = v26;
              *(_WORD *)(a1 + 58) |= 4u;
            }
            int v25 = 4;
            a2 = 57;
            goto LABEL_49;
          case 2:
LABEL_12:
            int v25 = 2;
            a2 = 225;
            goto LABEL_16;
          case 3:
            goto LABEL_16;
          case 4:
LABEL_13:
            int v25 = 8;
            a2 = 226;
            goto LABEL_16;
          case 5:
LABEL_14:
            int v25 = 1;
            a2 = 227;
            goto LABEL_16;
          default:
            goto LABEL_11;
        }
      }
      int v25 = 0;
LABEL_16:
      BOOL v28 = a15 == 255;
      BOOL v29 = a15 == 65281;
      if (a2 == 3)
      {
        BOOL v30 = a15 == 65281;
      }
      else
      {
        BOOL v28 = 0;
        BOOL v30 = 0;
      }
      if (a2 != 48) {
        BOOL v29 = 0;
      }
      BOOL v31 = a15 == 12 && a2 == 669;
      int v32 = v28 || v29;
      if (v31) {
        int v32 = 1;
      }
      if (v30 | v32) {
        int v25 = 1024;
      }
      if (!v25)
      {
        if ((v24 & 1) == 0) {
          goto LABEL_41;
        }
        __int16 v34 = *(_WORD *)(a1 + 60);
        *(_WORD *)(a1 + 56) &= v34;
        __int16 v33 = *(_WORD *)(a1 + 58) & v34;
        goto LABEL_40;
      }
      if ((v24 & 1) == 0)
      {
        if (a3)
        {
          *(_WORD *)(a1 + 56) &= ~(_WORD)v25;
          __int16 v33 = *(_WORD *)(a1 + 58) & ~(_WORD)v25;
LABEL_40:
          *(_WORD *)(a1 + 58) = v33;
          goto LABEL_41;
        }
        __int16 v37 = *(_WORD *)(a1 + 56) | v25;
LABEL_39:
        *(_WORD *)(a1 + 56) = v37;
        __int16 v33 = *(_WORD *)(a1 + 58) | v25;
        goto LABEL_40;
      }
      if (a3) {
        goto LABEL_41;
      }
      int v35 = *(unsigned __int16 *)(a1 + 60);
      if ((v35 & v25) != 0)
      {
        *(_WORD *)(a1 + 56) &= ~(_WORD)v25;
        *(_WORD *)(a1 + 58) &= ~(_WORD)v25;
        __int16 v36 = v35 & ~(_WORD)v25;
      }
      else
      {
        int v49 = *(unsigned __int16 *)(a1 + 56);
        if ((v49 & v25) == 0)
        {
          __int16 v37 = v49 | v25;
          goto LABEL_39;
        }
        __int16 v36 = v35 | v25;
      }
      *(_WORD *)(a1 + 6_GSEventInitializeApp(0, 0) = v36;
LABEL_41:
      __int16 v26 = *(_WORD *)(a1 + 56);
      switch(a2)
      {
        case 0x32u:
          a2 = 49;
          break;
        case 0x85u:
          v26 &= 0xFFDDu;
          a2 = 54;
          break;
        case 0x58u:
          a2 = 40;
          break;
      }
LABEL_49:
      uint64_t v27 = 0;
      *a7 = 0;
      *a5 = 0;
      *a13 = 0;
      if (a3 != 1 && !v25)
      {
        v50 = v23;
        uint64_t v38 = a6;
        __int16 v39 = v26;
        uint64_t v51 = (int *)(a1 + 52);
        uint64_t v27 = GSKeyTranslate(a1, a2, a3, v26, 0, (int *)(a1 + 52), a4, a5, v38);
        int v40 = a2 & 0xFFFC;
        if (v38 && v40 == 108)
        {
          uint64_t v41 = *a5;
          if (v41 < a4)
          {
            *a5 = v41 + 1;
            *(_WORD *)(v38 + 2 * v41) = 16;
          }
          *uint64_t v51 = 0;
        }
        int v52 = 0;
        GSKeyTranslate(a1, a2, 3u, 0, 1, &v52, a4, a7, a8);
        if (a8)
        {
          if (v40 == 108)
          {
            uint64_t v42 = *a7;
            if (v42 < a4)
            {
              *a7 = v42 + 1;
              *(_WORD *)(a8 + 2 * v42) = 16;
            }
          }
        }
        if ((v39 & 0x22) != 0)
        {
          int v52 = 0;
          GSKeyTranslate(a1, a2, 3u, v39 & 0x22, 1, &v52, a4, a9, a10);
          if (a9)
          {
            if (a10)
            {
              if (v40 == 108)
              {
                uint64_t v43 = *a9;
                if (v43 < a4)
                {
                  *a9 = v43 + 1;
                  *(_WORD *)(a10 + 2 * v43) = 16;
                }
              }
            }
          }
        }
        else
        {
          *a9 = 0;
        }
        if ((v39 & 0x501) != 0)
        {
          int v52 = 0;
          GSKeyTranslate(a1, a2, 3u, 257, 1, &v52, a4, a11, a12);
          if (a11)
          {
            if (a12)
            {
              if (v40 == 108)
              {
                uint64_t v44 = *a11;
                if (v44 < a4)
                {
                  *a11 = v44 + 1;
                  *(_WORD *)(a12 + 2 * v44) = 16;
                }
              }
            }
          }
        }
        else
        {
          *a11 = 0;
        }
        int v45 = *v51;
        if ((unsigned __int16)*v51)
        {
          int v52 = *v51;
          GSKeyTranslate(a1, a2, 1u, v39, 0, &v52, a4, a13, a14);
          LOWORD(v45) = *(_WORD *)(a1 + 52);
        }
        unsigned int v23 = v50;
        __int16 v46 = *(_WORD *)(a1 + 56);
        if ((_WORD)v45)
        {
          *(_WORD *)(a1 + 56) = v46 | 0x200;
          __int16 v47 = *(_WORD *)(a1 + 58) | 0x200;
        }
        else
        {
          *(_WORD *)(a1 + 56) = v46 & 0xFDFF;
          __int16 v47 = *(_WORD *)(a1 + 58) & 0xFDFF;
        }
        *(_WORD *)(a1 + 58) = v47;
      }
      pthread_mutex_unlock(v23);
      return v27;
  }
}

uint64_t GSKeyboardIsGlobeKeyUsagePair(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 255;
  BOOL v3 = a1 == 65281;
  if (a2 == 3)
  {
    BOOL v4 = a1 == 65281;
  }
  else
  {
    BOOL v2 = 0;
    BOOL v4 = 0;
  }
  if (a2 != 48) {
    BOOL v3 = 0;
  }
  BOOL v5 = a1 == 12 && a2 == 669;
  int v6 = v2 || v3;
  if (v5) {
    int v6 = 1;
  }
  return v4 | v6;
}

BOOL __GSKeyboardEqual(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 40) == *(void *)(a2 + 40);
}

CFStringRef __GSKeyboardCopyDescription(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<GSKeyboard %p>{layout = %p}", a1, a1[5]);
}

uint64_t GSKeyboardHWKeyboardLayoutsForName(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if (GSKeyboardHWKeyboardLayoutsForName_onceToken != -1) {
    dispatch_once(&GSKeyboardHWKeyboardLayoutsForName_onceToken, &__block_literal_global_0);
  }
  CFAllocatorRef v2 = (void *)GSKeyboardHWKeyboardLayoutsForName_loadedHWLayouts;
  objc_sync_enter((id)GSKeyboardHWKeyboardLayoutsForName_loadedHWLayouts);
  uint64_t v3 = [(id)GSKeyboardHWKeyboardLayoutsForName_loadedHWLayouts objectForKey:a1];
  if (!v3)
  {
    uint64_t v5 = [(__CFString *)(id)KeyboardLayoutsResourcePath() stringByAppendingPathComponent:@"USBKeyboardLayouts.plist"];
    if (v5)
    {
      int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:1 error:0];
      if (v6)
      {
        uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", a1, 0);
        _CFPropertyListCreateFiltered();
        uint64_t v3 = 0;
      }
    }
  }
  objc_sync_exit(v2);
  return v3;
}

void sub_1CFDD6FA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id __GSKeyboardHWKeyboardLayoutsForName_block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  GSKeyboardHWKeyboardLayoutsForName_loadedHWLayouts = (uint64_t)result;
  return result;
}

uint64_t GSKeyEmitStateTerminator(uint64_t a1, uint64_t a2, int a3, unsigned int a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6 = *(unsigned int *)(a2 + 20);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = (unsigned __int16 *)(a1 + v6);
  int v8 = *v7;
  if (v8 != 24577)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "GSKeyTranslate - uchr may be corrupt, keyStateTerminatorsFormat %04X\n", v8);
    return 0xFFFFFFFFLL;
  }
  if (!a3 || v7[1] <= (unsigned __int16)(a3 - 1)) {
    return 0;
  }
  unsigned int v9 = v7[(unsigned __int16)(a3 - 1) + 2];

  return GSKeyEmitCharOrSequence(a1, a2, v9, a4, a5, a6);
}

uint64_t GSKeyEmitSequence(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6 = *(unsigned int *)(a2 + 24);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = (unsigned __int16 *)(a1 + v6);
  int v8 = *v7;
  if (v8 != 28673)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "GSKeyTranslate - uchr may be corrupt, keySequenceDataIndexFormat %04X\n", v8);
    return 0xFFFFFFFFLL;
  }
  if ((a3 & 0x3FFF) >= v7[1])
  {
LABEL_14:
    if (a3 > 0xFFFD) {
      return 0;
    }
    uint64_t v18 = (unsigned __int16)*a5;
    if (v18 < a4)
    {
      uint64_t result = 0;
      *a5 = v18 + 1;
      *(_WORD *)(a6 + 2 * v18) = a3;
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = &v7[a3 & 0x3FFF];
  uint64_t v10 = v9[2];
  unsigned int v11 = (v9[3] - v10) >> 1;
  uint64_t v12 = (unsigned __int16)*a5;
  if ((unsigned __int16)v11 <= (unsigned __int16)(a4 - v12)) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = 0xFFFFFFFFLL;
  }
  if ((unsigned __int16)v11 <= (unsigned __int16)(a4 - v12)) {
    unsigned int v14 = (v9[3] - v10) >> 1;
  }
  else {
    unsigned int v14 = a4 - v12;
  }
  *a5 = v14 + v12;
  if ((_WORD)v14)
  {
    uint64_t v15 = (_WORD *)(a6 + 2 * v12);
    int v16 = (__int16 *)((char *)v7 + v10);
    do
    {
      --v14;
      __int16 v17 = *v16++;
      *v15++ = v17;
    }
    while ((_WORD)v14);
  }
  return result;
}

uint64_t GSKeyEmitCharOrSequence(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _WORD *a5, uint64_t a6)
{
  if ((__int16)a3 < -16384) {
    return GSKeyEmitSequence(a1, a2, a3, a4, a5, a6);
  }
  if (a3 > 0xFFFD) {
    return 0;
  }
  uint64_t v6 = (unsigned __int16)*a5;
  if (v6 >= a4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a5 = v6 + 1;
  *(_WORD *)(a6 + 2 * v6) = a3;
  return result;
}

void GSGetPurpleApplicationPort_cold_1()
{
  *(_WORD *)float v0 = 0;
  _os_log_error_impl(&dword_1CFDD0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "GSGetPurpleApplicationPort() is no longer supported, and always returns MACH_PORT_NULL.", v0, 2u);
}

void _GSEventInitializeApp_cold_1()
{
  *MEMORY[0x1E4F1CC20] = "Unable to determine CFBundleIdentifier or process name for current process\n";
  abort();
}

void _GSEventInitializeApp_cold_2(char **a1)
{
  *a1 = 0;
  asprintf(a1, "CFBundleIdentifier must be less than %i UTF8 bytes\n", 128);
  fputs(*a1, (FILE *)*MEMORY[0x1E4F143C8]);
  *MEMORY[0x1E4F1CC20] = *a1;
  abort();
}

void GSGetPurpleSystemAppPort_cold_1()
{
  *(_WORD *)float v0 = 0;
  _os_log_error_impl(&dword_1CFDD0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "GSGetPurpleSystemAppPort() is no longer supported, and always returns MACH_PORT_NULL.", v0, 2u);
}

void GSEventResetIdleTimer_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1CFDD0000, log, OS_LOG_TYPE_FAULT, "See rdar://56333187 - Call to deprecated GSEventResetIdleTimer() which will be removed in iOS 14.0. See the radar for replacement options.", v1, 2u);
}

void ReceiveEvent_cold_1(int a1)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C58](allocator, callout, context, shouldFreeInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1F40D9C90]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGFontDBSetInitializer()
{
  return MEMORY[0x1F40DA4A0]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1F40D9030]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1F40CA540]();
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1F40CA550]();
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1F40CA560]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA8](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x1F40CC480]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

void syslog(int a1, const char *a2, ...)
{
}