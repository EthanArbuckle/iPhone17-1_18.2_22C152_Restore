void sub_100006520(id a1)
{
  qword_1000159D0 = (uint64_t)os_log_create("com.apple.telephony.abm", "diagext");
}

void sub_1000066B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000066C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RFSelfDiagExtensionHelper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100006790(void *a1)
{
}

void sub_1000076B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000078BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_100007C2C(void *a1)
{
  v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

void sub_100008028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000082F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000087EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008968(uint64_t a1)
{
  return a1;
}

void sub_100008994(id *a1)
{
  operator delete(a1);
}

void *sub_1000089D0(uint64_t a1)
{
  v2 = operator new(0x10uLL);
  v3 = *(void **)(a1 + 8);
  void *v2 = off_100010470;
  v2[1] = v3;
  return v2;
}

id sub_100008A28(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 8);
  *a2 = off_100010470;
  id result = v3;
  a2[1] = result;
  return result;
}

void sub_100008A70(uint64_t a1)
{
}

void sub_100008A78(id *a1)
{
  operator delete(a1);
}

void sub_100008AB4(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  v5 = +[NSData dataWithBytes:v4 length:v3 - (void)v4];
  v6 = [*(id *)(a1 + 8) delegate];

  if (v6)
  {
    v7 = [*(id *)(a1 + 8) delegate];
    [v7 handleAWDMetricEvent:v5];
  }
  if (v4)
  {
    operator delete(v4);
  }
}

void sub_100008B64(_Unwind_Exception *a1)
{
  v4 = v3;

  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100008B98(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z49-[RFSelfDiagExtensionHelper addAWDConfiguration:]E3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

_UNKNOWN **sub_100008C08()
{
  return &off_1000104E0;
}

intptr_t sub_100008DAC(uint64_t a1)
{
  pthread_setname_np("DE.WifiScanner.RunLoop");
  [*(id *)(a1 + 32) setFServerRunLoopRef:CFRunLoopGetCurrent()];
  v2 = [*(id *)(a1 + 32) fWaitForResult];

  return dispatch_semaphore_signal(v2);
}

uint64_t sub_100008E00(void *a1)
{
  memset(&v8, 0, sizeof(v8));
  CFRunLoopSourceRef v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &v8);
  if (v2)
  {
    unint64_t v3 = v2;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v3, kCFRunLoopDefaultMode);
    v5 = objc_retainBlock(a1);
    v5[2]();
    while ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u) - 1) > 1)
      ;
    v6 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v6, v3, kCFRunLoopDefaultMode);
    CFRelease(v3);
  }
  return 0;
}

id sub_100009EF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id result = a4;
  if (a4) {
    return [a4 wifiScanCompleted:a2 withError:a3];
  }
  return result;
}

id sub_10000A298(id result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    if (a4)
    {
      v4 = result;
      id result = (id)IOHIDEventGetType();
      if (result == 12)
      {
        id result = [v4 fIsMonitoring];
        if (result)
        {
          IOHIDEventGetFloatValue();
          double v6 = v5;
          v7 = [v4 valueQueue];
          CFRunLoopSourceContext v8 = +[NSNumber numberWithInt:(int)v6];
          [v7 addObject:v8];

          return [v4 determineEnclosureState];
        }
      }
    }
  }
  return result;
}

void sub_10000A6B8(uint64_t a1)
{
  CFRunLoopSourceRef v2 = *(const void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
    unint64_t v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: release system client", buf, 2u);
    }
  }
  v4 = *(const void **)(*(void *)(a1 + 32) + 16);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    double v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "ALSDataMonitor: release service client", v6, 2u);
    }
  }
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return _AudioServicesPlaySystemSoundWithOptions();
}

uint64_t AudioServicesStopSystemSound()
{
  return _AudioServicesStopSystemSound();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return _CFRunLoopSourceCreate(allocator, order, context);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return _IOHIDEventSystemClientActivate();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return _IOHIDEventSystemClientCopyServices(client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return _IOHIDEventSystemClientRegisterEventCallback();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return _IOHIDEventSystemClientScheduleWithDispatchQueue();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return _IOHIDEventSystemClientSetCancelHandler();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return _IOHIDEventSystemClientSetMatchingMultiple();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return _IOHIDEventSystemClientUnregisterEventCallback();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return _IOHIDServiceClientSetProperty(service, key, property);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return _WiFiDeviceClientScanAsync();
}

uint64_t WiFiDeviceClientScanCancel()
{
  return _WiFiDeviceClientScanCancel();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return _WiFiManagerClientUnscheduleFromRunLoop();
}

uint64_t WiFiNetworkGetSSID()
{
  return _WiFiNetworkGetSSID();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t BasebandDiagnostics::getRadioType(BasebandDiagnostics *this)
{
  return BasebandDiagnostics::getRadioType(this);
}

uint64_t BasebandDiagnostics::resetBaseband()
{
  return BasebandDiagnostics::resetBaseband();
}

uint64_t BasebandDiagnostics::removeAWDConfig(BasebandDiagnostics *this)
{
  return BasebandDiagnostics::removeAWDConfig(this);
}

uint64_t BasebandDiagnostics::addAWDConfigPayload(BasebandDiagnostics *this, char *a2, unint64_t a3)
{
  return BasebandDiagnostics::addAWDConfigPayload(this, a2, a3);
}

uint64_t BasebandDiagnostics::registerAWDMetricHandler()
{
  return BasebandDiagnostics::registerAWDMetricHandler();
}

uint64_t BasebandDiagnostics::readIntegerFromUserDefaults()
{
  return BasebandDiagnostics::readIntegerFromUserDefaults();
}

uint64_t BasebandDiagnostics::updateBasebandOperatingMode()
{
  return BasebandDiagnostics::updateBasebandOperatingMode();
}

uint64_t BasebandRFDiagnostics::isRFTestSupported()
{
  return BasebandRFDiagnostics::isRFTestSupported();
}

uint64_t BasebandRFDiagnostics::setBasebandRFSelfTestTicket(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::setBasebandRFSelfTestTicket(this);
}

uint64_t BasebandRFDiagnostics::getBasebandEstimatedTestTime(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::getBasebandEstimatedTestTime(this);
}

uint64_t BasebandRFDiagnostics::startBasebandRFSelfTestFTMMode()
{
  return BasebandRFDiagnostics::startBasebandRFSelfTestFTMMode();
}

uint64_t BasebandRFDiagnostics::startBasebandRFSelfTestAST2Mode(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::startBasebandRFSelfTestAST2Mode(this);
}

uint64_t BasebandRFDiagnostics::create(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::create(this);
}

uint64_t BasebandRFDiagnostics::asString()
{
  return BasebandRFDiagnostics::asString();
}

uint64_t BasebandRFDiagnostics::resetAll(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::resetAll(this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_averageSampleQueue(void *a1, const char *a2, ...)
{
  return [a1 averageSampleQueue];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_commandDescription(void *a1, const char *a2, ...)
{
  return [a1 commandDescription];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentALSEnclosedState(void *a1, const char *a2, ...)
{
  return [a1 currentALSEnclosedState];
}

id objc_msgSend_currentWifiAvailabilityState(void *a1, const char *a2, ...)
{
  return [a1 currentWifiAvailabilityState];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detectChamberReadyALSThreshold(void *a1, const char *a2, ...)
{
  return [a1 detectChamberReadyALSThreshold];
}

id objc_msgSend_detectChamberReadyWaitTime(void *a1, const char *a2, ...)
{
  return [a1 detectChamberReadyWaitTime];
}

id objc_msgSend_detectChamberSensor(void *a1, const char *a2, ...)
{
  return [a1 detectChamberSensor];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableAutoJoin(void *a1, const char *a2, ...)
{
  return [a1 disableAutoJoin];
}

id objc_msgSend_disableNetworkReconnect(void *a1, const char *a2, ...)
{
  return [a1 disableNetworkReconnect];
}

id objc_msgSend_enableAutoJoin(void *a1, const char *a2, ...)
{
  return [a1 enableAutoJoin];
}

id objc_msgSend_enableNetworkReconnect(void *a1, const char *a2, ...)
{
  return [a1 enableNetworkReconnect];
}

id objc_msgSend_fALSEnclosedLimit(void *a1, const char *a2, ...)
{
  return [a1 fALSEnclosedLimit];
}

id objc_msgSend_fALSEnclosedSampleCount(void *a1, const char *a2, ...)
{
  return [a1 fALSEnclosedSampleCount];
}

id objc_msgSend_fAlertTestComplete(void *a1, const char *a2, ...)
{
  return [a1 fAlertTestComplete];
}

id objc_msgSend_fAvailabilityState(void *a1, const char *a2, ...)
{
  return [a1 fAvailabilityState];
}

id objc_msgSend_fEnclosedStateFlag(void *a1, const char *a2, ...)
{
  return [a1 fEnclosedStateFlag];
}

id objc_msgSend_fIsMonitoring(void *a1, const char *a2, ...)
{
  return [a1 fIsMonitoring];
}

id objc_msgSend_fIsScanning(void *a1, const char *a2, ...)
{
  return [a1 fIsScanning];
}

id objc_msgSend_fMonitoring(void *a1, const char *a2, ...)
{
  return [a1 fMonitoring];
}

id objc_msgSend_fScanIntervalInSec(void *a1, const char *a2, ...)
{
  return [a1 fScanIntervalInSec];
}

id objc_msgSend_fScanRepeatRequired(void *a1, const char *a2, ...)
{
  return [a1 fScanRepeatRequired];
}

id objc_msgSend_fSensor(void *a1, const char *a2, ...)
{
  return [a1 fSensor];
}

id objc_msgSend_fServerRunLoopRef(void *a1, const char *a2, ...)
{
  return [a1 fServerRunLoopRef];
}

id objc_msgSend_fWaitForResult(void *a1, const char *a2, ...)
{
  return [a1 fWaitForResult];
}

id objc_msgSend_getBasebandResultWaitTime(void *a1, const char *a2, ...)
{
  return [a1 getBasebandResultWaitTime];
}

id objc_msgSend_getOSLogHandler(void *a1, const char *a2, ...)
{
  return [a1 getOSLogHandler];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return [a1 isCheckerBoardActive];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadTestConfigFromUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 loadTestConfigFromUserDefaults];
}

id objc_msgSend_measureType(void *a1, const char *a2, ...)
{
  return [a1 measureType];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_prepareSetupForTest(void *a1, const char *a2, ...)
{
  return [a1 prepareSetupForTest];
}

id objc_msgSend_releaseALSClient(void *a1, const char *a2, ...)
{
  return [a1 releaseALSClient];
}

id objc_msgSend_releaseWifiManagerClient(void *a1, const char *a2, ...)
{
  return [a1 releaseWifiManagerClient];
}

id objc_msgSend_removeAWDConfiguration(void *a1, const char *a2, ...)
{
  return [a1 removeAWDConfiguration];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resetAll(void *a1, const char *a2, ...)
{
  return [a1 resetAll];
}

id objc_msgSend_restoreSetup(void *a1, const char *a2, ...)
{
  return [a1 restoreSetup];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_runRFSelfDiag(void *a1, const char *a2, ...)
{
  return [a1 runRFSelfDiag];
}

id objc_msgSend_setBasebandFTM(void *a1, const char *a2, ...)
{
  return [a1 setBasebandFTM];
}

id objc_msgSend_setFactoryTest(void *a1, const char *a2, ...)
{
  return [a1 setFactoryTest];
}

id objc_msgSend_setTimeForNextScan(void *a1, const char *a2, ...)
{
  return [a1 setTimeForNextScan];
}

id objc_msgSend_setupALSClient(void *a1, const char *a2, ...)
{
  return [a1 setupALSClient];
}

id objc_msgSend_setupHIDClient(void *a1, const char *a2, ...)
{
  return [a1 setupHIDClient];
}

id objc_msgSend_setupWifiManagerClient(void *a1, const char *a2, ...)
{
  return [a1 setupWifiManagerClient];
}

id objc_msgSend_startMonitorChamberOpen(void *a1, const char *a2, ...)
{
  return [a1 startMonitorChamberOpen];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_startWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return [a1 startWiFiNetworkScan];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopAlertsTestComplete(void *a1, const char *a2, ...)
{
  return [a1 stopAlertsTestComplete];
}

id objc_msgSend_stopMonitorChamber(void *a1, const char *a2, ...)
{
  return [a1 stopMonitorChamber];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_stopWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return [a1 stopWiFiNetworkScan];
}

id objc_msgSend_testCompleteAlertTime(void *a1, const char *a2, ...)
{
  return [a1 testCompleteAlertTime];
}

id objc_msgSend_testCompleteChimeAlertEnabled(void *a1, const char *a2, ...)
{
  return [a1 testCompleteChimeAlertEnabled];
}

id objc_msgSend_testCompleteVibrationAlertEnabled(void *a1, const char *a2, ...)
{
  return [a1 testCompleteVibrationAlertEnabled];
}

id objc_msgSend_testConfiguration(void *a1, const char *a2, ...)
{
  return [a1 testConfiguration];
}

id objc_msgSend_valueQueue(void *a1, const char *a2, ...)
{
  return [a1 valueQueue];
}

id objc_msgSend_waitForChamberClosed_(void *a1, const char *a2, ...)
{
  return [a1 waitForChamberClosed:];
}