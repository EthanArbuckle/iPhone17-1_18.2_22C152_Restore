void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  uint64_t v4;
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void __HSCapturePlugInVersion_block_invoke()
{
  id v3 = 0;
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"Apple(H\\d+)CamIn" options:0 error:&v3];
  id v1 = v3;
  v2 = (void *)HSCapturePlugInVersion_regex;
  HSCapturePlugInVersion_regex = v0;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id HSLogHandle()
{
  if (HSLogHandle_onceToken != -1) {
    dispatch_once(&HSLogHandle_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)HSLogHandle__handle;

  return v0;
}

uint64_t __HSLogHandle_block_invoke()
{
  HSLogHandle__handle = (uint64_t)os_log_create("com.apple.osdiags", "hardware-support");

  return MEMORY[0x270F9A758]();
}

__CFString *__HSDescribeFigStreamStatus(int a1)
{
  switch(a1)
  {
    case -12689:
      id v1 = NSString;
      v2 = NSStringFromSelector(sel_requestControlOfStreams_error_);
      id v3 = [v1 stringWithFormat:@"Stream not controlled! Please ensure to request with %@.", v2];

      break;
    case -12688:
      id v3 = @"Stream is busy!";
      break;
    case -12687:
      id v3 = @"Data was dropped!";
      break;
    case -12686:
      id v3 = @"Buffer allocation failed!";
      break;
    case -12685:
      id v3 = @"Unknown stream error!";
      break;
    case -12684:
      id v3 = @"Not available while streaming!";
      break;
    default:
      id v3 = 0;
      break;
  }

  return v3;
}

id _unwrapFigCaptureValue(void *a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 underlyingStream];
LABEL_5:
    id v3 = (void *)v2;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 underlyingSyncStreamsGroup];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v1;
    v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = _unwrapFigCaptureValue(*(void *)(*((void *)&v29 + 1) + 8 * i));
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
LABEL_29:
    id v3 = (void *)v13;

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v1 allObjects];
    id v3 = _unwrapFigCaptureValue(v14);

    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v16 = v1;
  id v3 = v16;
  if (isKindOfClass)
  {
    v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = v3;
    uint64_t v17 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v7);
          }
          uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
          v22 = objc_msgSend(v7, "objectForKeyedSubscript:", v21, (void)v25);
          v23 = ((void (*)(void))_unwrapFigCaptureValue)();
          v24 = _unwrapFigCaptureValue(v21);
          [v6 setObject:v23 forKey:v24];
        }
        uint64_t v18 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }

    uint64_t v13 = [NSDictionary dictionaryWithDictionary:v6];
    goto LABEL_29;
  }
LABEL_6:

  return v3;
}

id _wrapFigCaptureValue(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_8;
  }
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 == FigCaptureStreamGetTypeID())
  {
    v6 = [[HSFigCaptureStream alloc] initWithCaptureStream:v3 fromDevice:v4];
LABEL_7:
    id v7 = v6;
    goto LABEL_8;
  }
  CFTypeID v8 = CFGetTypeID(v3);
  if (v8 == FigCaptureSynchronizedStreamsGroupGetTypeID())
  {
    v6 = [[HSFigCaptureSyncStreamsGroup alloc] initWithCaptureSyncStreamsGroup:v3 fromDevice:v4];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v3;
    v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = _wrapFigCaptureValue(*(void *)(*((void *)&v34 + 1) + 8 * i), v4);
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
LABEL_20:
    id v7 = (void *)v18;

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = [v3 allObjects];
    id v7 = _wrapFigCaptureValue(v19, v4);
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v21 = v3;
    id v7 = v21;
    if (isKindOfClass)
    {
      v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v12 = v7;
      uint64_t v22 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v12);
            }
            uint64_t v26 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            long long v27 = objc_msgSend(v12, "objectForKeyedSubscript:", v26, (void)v30);
            long long v28 = _wrapFigCaptureValue(v27, v4);
            long long v29 = _wrapFigCaptureValue(v26, v4);
            [v11 setObject:v28 forKey:v29];
          }
          uint64_t v23 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v23);
      }

      uint64_t v18 = [NSDictionary dictionaryWithDictionary:v11];
      goto LABEL_20;
    }
  }
LABEL_8:

  return v7;
}

__CFString *__HSDescribeFigDeviceStatus(int a1)
{
  if ((a1 + 12683) > 3) {
    return 0;
  }
  else {
    return off_26484C9A8[a1 + 12683];
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void HSRequestConcreteImplementation(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  Name = sel_getName(a2);
  id v7 = (objc_class *)objc_opt_class();
  CFTypeID v8 = class_getName(v7);
  objc_msgSend(v4, "raise:format:", v5, @"-%s is abstract. Define -[%s %s]!", Name, v8, sel_getName(a2));
  abort();
}

void sub_2289F9718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __deviceRemovedCallback(void *a1, int a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (a2)
  {
    id v4 = [NSString stringWithFormat:@"Device removal failed!"];
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F08350];
    uint64_t v11 = *MEMORY[0x263F08320];
    v12[0] = v4;
    id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    CFTypeID v8 = [v5 errorWithDomain:v6 code:a2 userInfo:v7];
  }
  else
  {
    CFTypeID v8 = 0;
  }
  uint64_t v9 = [v3 deviceRemovedCallback];

  if (v9)
  {
    id v10 = [v3 deviceRemovedCallback];
    ((void (**)(void, void *))v10)[2](v10, v8);
  }
}

void __deviceInputReportCallback(void *a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v11 = a1;
  if (a2)
  {
    id v12 = [NSString stringWithFormat:@"Input report callback failed!"];
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08350];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = v12;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v16 = [v13 errorWithDomain:v14 code:a2 userInfo:v15];
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v17 = [v11 inputReportCallback];

  if (v17)
  {
    uint64_t v18 = [MEMORY[0x263EFF8F8] dataWithBytes:a6 length:a7];
    uint64_t v19 = [v11 inputReportCallback];
    ((void (**)(void, void, void *, void *))v19)[2](v19, a5, v18, v16);
  }
}

void __managerDeviceMatchingCallback(void *a1, int a2, uint64_t a3, const void *a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a1;
  if (a2)
  {
    id v7 = [NSString stringWithFormat:@"Device failed to enumerate!"];
    CFTypeID v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08350];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = v7;
    id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v11 = [v8 errorWithDomain:v9 code:a2 userInfo:v10];
  }
  else
  {
    id v11 = 0;
  }
  CFRetain(a4);
  id v12 = [[HSHIDDevice alloc] initWithDeviceRef:a4];
  uint64_t v13 = [v6 deviceEnumeratedCallback];

  if (v13)
  {
    uint64_t v14 = [v6 deviceEnumeratedCallback];
    ((void (**)(void, HSHIDDevice *, void *))v14)[2](v14, v12, v11);
  }
}

void __managerDeviceRemovalCallback(void *a1, int a2, uint64_t a3, const void *a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a1;
  if (a2)
  {
    id v7 = [NSString stringWithFormat:@"Device removal failed!"];
    CFTypeID v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08350];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = v7;
    id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v11 = [v8 errorWithDomain:v9 code:a2 userInfo:v10];
  }
  else
  {
    id v11 = 0;
  }
  CFRetain(a4);
  id v12 = [[HSHIDDevice alloc] initWithDeviceRef:a4];
  uint64_t v13 = [v6 deviceRemovedCallback];

  if (v13)
  {
    uint64_t v14 = [v6 deviceRemovedCallback];
    ((void (**)(void, HSHIDDevice *, void *))v14)[2](v14, v12, v11);
  }
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x270EE79D0]();
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return MEMORY[0x270F12C50]();
}

uint64_t FigCaptureDeviceGetTypeID()
{
  return MEMORY[0x270F12C60]();
}

uint64_t FigCaptureStreamGetFigBaseObject()
{
  return MEMORY[0x270F12CF0]();
}

uint64_t FigCaptureStreamGetTypeID()
{
  return MEMORY[0x270F12CF8]();
}

uint64_t FigCaptureSynchronizedStreamsGroupGetFigBaseObject()
{
  return MEMORY[0x270F12D08]();
}

uint64_t FigCaptureSynchronizedStreamsGroupGetTypeID()
{
  return MEMORY[0x270F12D10]();
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF4050](device, *(void *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x270EF4070](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4078](device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x270EF4080](device, *(void *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF40A0](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputReportCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportCallback callback, void *context)
{
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
}

void IOHIDDeviceScheduleWithRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

Boolean IOHIDDeviceSetProperty(IOHIDDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF40E8](device, key, property);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x270EF40F0](device, *(void *)&reportType, reportID, report, reportLength);
}

void IOHIDDeviceUnscheduleFromRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x270EF4528](manager, *(void *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x270EF4530](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x270EF4540](allocator, *(void *)&options);
}

CFTypeRef IOHIDManagerGetProperty(IOHIDManagerRef manager, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4548](manager, key);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x270EF4550](manager, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

Boolean IOHIDManagerSetProperty(IOHIDManagerRef manager, CFStringRef key, CFTypeRef value)
{
  return MEMORY[0x270EF45B8](manager, key, value);
}

void IOHIDManagerUnscheduleFromRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x270EF47F0](*(void *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

uint64_t IOReportChannelCopyDescription()
{
  return MEMORY[0x270F92700]();
}

uint64_t IOReportChannelGetChannelID()
{
  return MEMORY[0x270F92710]();
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x270F92718]();
}

uint64_t IOReportChannelGetDriverName()
{
  return MEMORY[0x270F92720]();
}

uint64_t IOReportChannelGetFormat()
{
  return MEMORY[0x270F92728]();
}

uint64_t IOReportChannelGetGroup()
{
  return MEMORY[0x270F92730]();
}

uint64_t IOReportChannelGetSubGroup()
{
  return MEMORY[0x270F92738]();
}

uint64_t IOReportCopyAllChannels()
{
  return MEMORY[0x270F92748]();
}

uint64_t IOReportCopyChannelsOfFormat()
{
  return MEMORY[0x270F92768]();
}

uint64_t IOReportCreateAggregate()
{
  return MEMORY[0x270F92778]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x270F92780]();
}

uint64_t IOReportCreateSamplesDelta()
{
  return MEMORY[0x270F92788]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x270F92798]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x270F927D8]();
}

uint64_t IOReportMergeChannels()
{
  return MEMORY[0x270F927E0]();
}

uint64_t IOReportPrune()
{
  return MEMORY[0x270F927E8]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x270F92800]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
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

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}