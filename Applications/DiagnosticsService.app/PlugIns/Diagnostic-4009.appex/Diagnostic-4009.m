void sub_1000047D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t vars8;

  [a2 _receivedNotification:a3 notificationObject:a4 notificationPayload:a5];
}

void sub_100004B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100004B44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (CFEqual(*(CFStringRef *)(a1 + 40), kFigCaptureStreamNotification_StreamStarted))
  {
    v4 = [WeakRetained streamStartSemaphore];

    if (!v4) {
      goto LABEL_8;
    }
    v3 = [WeakRetained streamStartSemaphore];
    goto LABEL_7;
  }
  if (CFEqual(*(CFStringRef *)(a1 + 40), kFigCaptureStreamNotification_StreamStopped))
  {
    v2 = [WeakRetained streamStopSemaphore];

    if (v2)
    {
      v3 = [WeakRetained streamStopSemaphore];
LABEL_7:
      v5 = v3;
      dispatch_semaphore_signal(v3);
    }
  }
LABEL_8:
}

void sub_100004DDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004FB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

char **sub_1000050EC()
{
  v0 = off_1000160A0;
  v1 = off_1000160A0[0];
  while (1)
  {
    if (!v1) {
      goto LABEL_5;
    }
    CFDictionaryRef v2 = IOServiceMatching(v1);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
    if (MatchingService) {
      break;
    }
    v4 = v0[5];
    v0 += 5;
    v1 = v4;
    if (!v4)
    {
LABEL_5:
      v1 = 0;
      if (!v0[1])
      {
        v1 = 0;
        if (!v0[2])
        {
          v1 = 0;
          if (!*((_DWORD *)v0 + 6)) {
            return v0;
          }
        }
      }
    }
  }
  IOObjectRelease(MatchingService);
  return v0;
}

void sub_10000528C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005AA0(id a1, NSString *a2, OSDCaptureStream *a3, BOOL *a4)
{
}

id sub_100005E30(uint64_t a1)
{
  [*(id *)(a1 + 32) runCameraTest];
  CFDictionaryRef v2 = *(void **)(a1 + 32);

  return [v2 setFinished:1];
}

void sub_100006DEC(uint64_t a1)
{
  [*(id *)(a1 + 32) setSoloFrameCount: [*(id *)(a1 + 32) soloFrameCount] + 1];
  unsigned int v2 = [*(id *)(a1 + 32) soloFrameCount];
  v3 = [*(id *)(a1 + 32) inputs];
  unsigned int v4 = [v3 framesToSample];

  if (v2 == v4)
  {
    v5 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v5);
  }
}

void sub_1000071A4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlphaSyncFrameCount:[*(id *)(a1 + 32) alphaSyncFrameCount] + 1];
  unsigned int v2 = [*(id *)(a1 + 32) alphaSyncFrameCount];
  v3 = [*(id *)(a1 + 32) inputs];
  unsigned int v4 = [v3 framesToSample];

  if (v2 == v4)
  {
    v5 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v5);
  }
}

void sub_100007238(uint64_t a1)
{
  [*(id *)(a1 + 32) setBravoSyncFrameCount: [*(id *)(a1 + 32) bravoSyncFrameCount] + 1];
  unsigned int v2 = [*(id *)(a1 + 32) bravoSyncFrameCount];
  v3 = [*(id *)(a1 + 32) inputs];
  unsigned int v4 = [v3 framesToSample];

  if (v2 == v4)
  {
    v5 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v5);
  }
}

void sub_1000074B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007EE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000815C(id a1)
{
  uint64_t v1 = objc_opt_new();
  unsigned int v2 = (void *)qword_1000163A8;
  qword_1000163A8 = v1;

  v3 = objc_alloc_init(OSDCaptureDevice);
  [(id)qword_1000163A8 setDevice:v3];
}

void sub_100008CD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008D60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000098A8(uint64_t a1, uint64_t a2, long long *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v6 = *a3;
  uint64_t v7 = *((void *)a3 + 2);
  [WeakRetained _receivedPixelBuffer:a2 time:&v6];
}

void sub_100009908(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  [WeakRetained _receivedEvent:a2 timestamp:&v8 info:a4];
}

void sub_100009E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100009E40(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  [v7 doubleValue];
  if (v5 > *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    [v7 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void sub_10000A24C(uint64_t a1)
{
  [*(id *)(a1 + 32) _processBuffer:*(void *)(a1 + 40)];
  unsigned int v2 = *(__CVBuffer **)(a1 + 40);

  CVPixelBufferRelease(v2);
}

void sub_10000A74C()
{
  __assert_rtn("-[OSDCaptureStream initWithStream:]", "OSDCaptureDevice.m", 219, "stream != NULL");
}

void sub_10000A778(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A7E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A854(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A8C0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NSError variable was nil.  New unsaved error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000A938(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NSError variable was previously assigned.  New unsaved error: %@", (uint8_t *)&v2, 0xCu);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

uint64_t CAImageQueueCollect()
{
  return _CAImageQueueCollect();
}

uint64_t CAImageQueueCreate()
{
  return _CAImageQueueCreate();
}

uint64_t CAImageQueueInvalidate()
{
  return _CAImageQueueInvalidate();
}

uint64_t CAImageQueueRegisterIOSurfaceBuffer()
{
  return _CAImageQueueRegisterIOSurfaceBuffer();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

uint64_t CMNotificationCenterAddListener()
{
  return _CMNotificationCenterAddListener();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return _CMNotificationCenterRemoveListener();
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return _CVBufferCopyAttachment(buffer, key, attachmentMode);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return _CVPixelBufferRetain(texture);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return _FigCaptureDeviceGetFigBaseObject();
}

uint64_t FigCaptureStreamGetFigBaseObject()
{
  return _FigCaptureStreamGetFigBaseObject();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return __AXSAttentionAwarenessFeaturesEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__frameCounter(void *a1, const char *a2, ...)
{
  return [a1 _frameCounter];
}

id objc_msgSend__imageQueue(void *a1, const char *a2, ...)
{
  return [a1 _imageQueue];
}

id objc_msgSend_alphaCamera(void *a1, const char *a2, ...)
{
  return [a1 alphaCamera];
}

id objc_msgSend_alphaSyncFrameCount(void *a1, const char *a2, ...)
{
  return [a1 alphaSyncFrameCount];
}

id objc_msgSend_attentionDetectionSetting(void *a1, const char *a2, ...)
{
  return [a1 attentionDetectionSetting];
}

id objc_msgSend_backCamera(void *a1, const char *a2, ...)
{
  return [a1 backCamera];
}

id objc_msgSend_backingRef(void *a1, const char *a2, ...)
{
  return [a1 backingRef];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bravoCamera(void *a1, const char *a2, ...)
{
  return [a1 bravoCamera];
}

id objc_msgSend_bravoSyncFrameCount(void *a1, const char *a2, ...)
{
  return [a1 bravoSyncFrameCount];
}

id objc_msgSend_cameraImp(void *a1, const char *a2, ...)
{
  return [a1 cameraImp];
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return [a1 captureDevice];
}

id objc_msgSend_captureStream(void *a1, const char *a2, ...)
{
  return [a1 captureStream];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceRef(void *a1, const char *a2, ...)
{
  return [a1 deviceRef];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableAttentionDetection(void *a1, const char *a2, ...)
{
  return [a1 disableAttentionDetection];
}

id objc_msgSend_doneWithDeviceAndStreams(void *a1, const char *a2, ...)
{
  return [a1 doneWithDeviceAndStreams];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enableMaxDataRate(void *a1, const char *a2, ...)
{
  return [a1 enableMaxDataRate];
}

id objc_msgSend_enableTestPatternPN9(void *a1, const char *a2, ...)
{
  return [a1 enableTestPatternPN9];
}

id objc_msgSend_formatIndex(void *a1, const char *a2, ...)
{
  return [a1 formatIndex];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameCount(void *a1, const char *a2, ...)
{
  return [a1 frameCount];
}

id objc_msgSend_frameHandler(void *a1, const char *a2, ...)
{
  return [a1 frameHandler];
}

id objc_msgSend_frameSampleTimeout(void *a1, const char *a2, ...)
{
  return [a1 frameSampleTimeout];
}

id objc_msgSend_framesToSample(void *a1, const char *a2, ...)
{
  return [a1 framesToSample];
}

id objc_msgSend_frontCamera(void *a1, const char *a2, ...)
{
  return [a1 frontCamera];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isStreaming(void *a1, const char *a2, ...)
{
  return [a1 isStreaming];
}

id objc_msgSend_ispVersion(void *a1, const char *a2, ...)
{
  return [a1 ispVersion];
}

id objc_msgSend_minimumFrameRate(void *a1, const char *a2, ...)
{
  return [a1 minimumFrameRate];
}

id objc_msgSend_owners(void *a1, const char *a2, ...)
{
  return [a1 owners];
}

id objc_msgSend_portToStreamMap(void *a1, const char *a2, ...)
{
  return [a1 portToStreamMap];
}

id objc_msgSend_previewLayer(void *a1, const char *a2, ...)
{
  return [a1 previewLayer];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_runCameraTest(void *a1, const char *a2, ...)
{
  return [a1 runCameraTest];
}

id objc_msgSend_sharedCenter(void *a1, const char *a2, ...)
{
  return [a1 sharedCenter];
}

id objc_msgSend_soloFrameCount(void *a1, const char *a2, ...)
{
  return [a1 soloFrameCount];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_streamRef(void *a1, const char *a2, ...)
{
  return [a1 streamRef];
}

id objc_msgSend_streamStartSemaphore(void *a1, const char *a2, ...)
{
  return [a1 streamStartSemaphore];
}

id objc_msgSend_streamStopSemaphore(void *a1, const char *a2, ...)
{
  return [a1 streamStopSemaphore];
}

id objc_msgSend_streamTime(void *a1, const char *a2, ...)
{
  return [a1 streamTime];
}

id objc_msgSend_streamingOptions(void *a1, const char *a2, ...)
{
  return [a1 streamingOptions];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return [a1 teardown];
}

id objc_msgSend_telephotoCamera(void *a1, const char *a2, ...)
{
  return [a1 telephotoCamera];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}