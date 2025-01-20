id MTLoggingTouchSensitiveButtonHIDService()
{
  void *v0;
  uint64_t vars8;

  if (MTLoggingTouchSensitiveButtonHIDService_onceToken != -1) {
    dispatch_once(&MTLoggingTouchSensitiveButtonHIDService_onceToken, &__block_literal_global);
  }
  v0 = (void *)MTLoggingTouchSensitiveButtonHIDService___logObj;
  return v0;
}

id TouchSensitiveButtonGetNumberProperty(io_registry_entry_t a1, const __CFString *a2)
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, a2, 0, 0);
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass()) {
    id v3 = [CFProperty unsignedShortValue];
  }

  return v3;
}

void sub_3144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id MTLoggingTouchSensitiveButtonHIDService(void)
{
  if (MTLoggingTouchSensitiveButtonHIDService(void)::onceToken != -1) {
    dispatch_once(&MTLoggingTouchSensitiveButtonHIDService(void)::onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)MTLoggingTouchSensitiveButtonHIDService(void)::__logObj;
  return v0;
}

void ___Z39MTLoggingTouchSensitiveButtonHIDServicev_block_invoke(id a1)
{
  MTLoggingTouchSensitiveButtonHIDService(void)::__logObj = (uint64_t)os_log_create("com.apple.Multitouch", "TouchSensitiveButtonHIDService");
  _objc_release_x1();
}

void sub_41F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38)
{
  objc_destroyWeak(v38);
  objc_destroyWeak((id *)(v44 - 152));

  _Unwind_Resume(a1);
}

void sub_43CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SABinaryWriter::initHostRequest(SABinaryWriter *this, char a2, size_t __n, const void *__src)
{
  if (__n && !__src || *((unsigned char *)this + 24)) {
    return 0;
  }
  *((void *)this + 2) = 0;
  *((unsigned char *)this + 24) = 4;
  if (*(void *)this)
  {
    if (*((void *)this + 1) <= 1uLL) {
      goto LABEL_14;
    }
    **(_WORD **)this = 1025;
    uint64_t v6 = *((void *)this + 2) + 2;
    uint64_t v7 = *(void *)this;
    *((void *)this + 2) = v6;
    if (!v7) {
      goto LABEL_11;
    }
    if ((unint64_t)(*((void *)this + 1) - v6) < 3)
    {
LABEL_14:
      uint64_t result = 0;
      *((unsigned char *)this + 24) = 0;
      return result;
    }
    uint64_t v8 = v7 + v6;
    *(unsigned char *)uint64_t v8 = a2;
    *(_WORD *)(v8 + 1) = __n;
    uint64_t v6 = *((void *)this + 2);
  }
  else
  {
    uint64_t v6 = 2;
  }
LABEL_11:
  uint64_t v9 = v6 + 3;
  *((void *)this + 2) = v9;
  if (__n)
  {
    uint64_t v10 = __n;
    if (*(void *)this)
    {
      if (*((void *)this + 1) - v9 < (unint64_t)__n) {
        goto LABEL_14;
      }
      memcpy((void *)(*(void *)this + v9), __src, __n);
      uint64_t v9 = *((void *)this + 2);
    }
    *((void *)this + 2) = v9 + v10;
  }
  return 1;
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return _IOHIDDeviceCreate(allocator, service);
}

Boolean IOHIDDeviceSetProperty(IOHIDDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return _IOHIDDeviceSetProperty(device, key, property);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_configurationCallback(void *a1, const char *a2, ...)
{
  return [a1 configurationCallback];
}

id objc_msgSend_createUserDevice(void *a1, const char *a2, ...)
{
  return [a1 createUserDevice];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_recordingEnabled(void *a1, const char *a2, ...)
{
  return [a1 recordingEnabled];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_vendorDefinedEvent_usagePage_usage_version_data_length_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorDefinedEvent:usagePage:usage:version:data:length:options:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if ([v7 isEqualToString:@"HIDContinuousRecordingEnable"])
    {
      uint64_t v9 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      -[TouchSensitiveButtonHIDService setRecordingEnabled:](self, "setRecordingEnabled:", [v9 BOOLValue]);
    }
    else
    {
      dispatchQueue = self->_dispatchQueue;
      if (dispatchQueue)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __53__TouchSensitiveButtonHIDService_setProperty_forKey___block_invoke;
        block[3] = &unk_8420;
        block[4] = self;
        v15 = v7;
        v16 = v6;
        dispatch_async(dispatchQueue, block);
      }
      else
      {
        [(SASInterfaceProtocol *)self->_algs injectProperty:v7 value:v6];
      }
    }
LABEL_20:
    uint64_t v8 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    uint64_t v8 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = [(TouchSensitiveButtonHIDService *)self setHostState:v6];
LABEL_21:

  return v8;
}

id __53__TouchSensitiveButtonHIDService_setProperty_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) injectProperty:a1[5] value:a1[6]];
}

- (void)parseInputReport:(id)a3
{
  id v9 = a3;
  if (!self->_algsDisabled) {
    [(SASInterfaceProtocol *)self->_algs handleInputStream:v9];
  }
  if ([(TouchSensitiveButtonHIDService *)self recordingEnabled])
  {
    id v4 = v9;
    v5 = [v4 bytes];
    id v6 = [v4 length];
    if (v6)
    {
      if (*v5 == 92)
      {
        LODWORD(v8) = 0;
        uint64_t v7 = +[HIDEvent vendorDefinedEvent:mach_absolute_time() usagePage:65308 usage:256 version:1 data:v5 length:v6 options:v8];
        [(HIDEventDispatcher *)self->_eventDispatcher dispatchEvent:v7];
      }
    }
  }
}

- (void)handleResetRequest:(unsigned __int8)a3
{
  unsigned __int8 __src = a3;
  if (self->_configurationCallback)
  {
    v12[0] = xmmword_66C0;
    v12[1] = *(_OWORD *)algn_66D0;
    uint64_t v7 = (char *)v12 + 1;
    long long v8 = xmmword_66B0;
    unint64_t v9 = 0xAAAAAAAAAA00AA00;
    uint64_t v10 = 0;
    int inited = SABinaryWriter::initHostRequest((SABinaryWriter *)&v7, 1, 1uLL, &__src);
    log = self->_log;
    if (inited)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_0, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "FW SA Reset Request", v6, 2u);
      }
      (*((void (**)(void))self->_configurationCallback + 2))();
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[TouchSensitiveButtonHIDService handleResetRequest:]((os_log_t)log);
    }
  }
}

- (void)reset
{
}

- (HIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setEventDispatcher:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)configurationCallback
{
  return self->_configurationCallback;
}

- (void)setConfigurationCallback:(id)a3
{
}

- (BOOL)recordingEnabled
{
  return self->_recordingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationCallback, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_algs, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithLog:(os_log_t)log usagePage:usage:streamCallback:algsInterface:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "TouchSensitiveButtonHIDService: Provided InterfaceClass does not conform to SASInterfaceProtocol", v1, 2u);
}

- (void)initWithLog:(uint64_t)a1 usagePage:(NSObject *)a2 usage:streamCallback:algsInterface:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "TouchSensitiveButtonHIDService: Unable to load bundle from %{public}@", (uint8_t *)&v2, 0xCu);
}

void __91__TouchSensitiveButtonHIDService_initWithLog_usagePage_usage_streamCallback_algsInterface___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "CoreAnalyticsCallback: %@:%@", (uint8_t *)&v3, 0x16u);
}

- (void)setHostState:(unsigned __int8 *)a1 .cold.1(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to set host state report 0x%02Xu", (uint8_t *)v3, 8u);
}

- (void)setRecordingEnabled:(unsigned __int8 *)a1 .cold.1(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to set continuous recording report 0x%02Xu", (uint8_t *)v3, 8u);
}

- (void)handleResetRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to generate SA reset request", v1, 2u);
}

@end