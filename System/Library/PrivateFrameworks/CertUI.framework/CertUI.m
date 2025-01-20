uint64_t start()
{
  id v0;
  CertUIRelay *v1;

  v0 = objc_alloc_init((Class)NSAutoreleasePool);
  CertUILoggingInitialize();
  v1 = objc_alloc_init(CertUIRelay);
  [+[NSRunLoop currentRunLoop] run];

  [v0 drain];
  return 0;
}

void sub_100005138(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005200;
  v4[3] = &unk_1000082E8;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 showPromptWithCompletion:v4];
}

void sub_100005200(uint64_t a1, void *a2)
{
  id v9 = a2;
  int8x16_t v3 = [*(id *)(a1 + 32) _relayCenter];
  v4 = [*(id *)(a1 + 40) replyContext];
  [v3 sendDelayedReply:v4 dictionary:v9];

  [*(id *)(a1 + 32) _registerReply];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  if ((unint64_t)[*(id *)(a1 + 48) count] >= 2)
  {
    unint64_t v5 = 1;
    do
    {
      id v6 = [*(id *)(a1 + 48) objectAtIndex:v5];
      id v7 = [*(id *)(a1 + 32) _relayCenter];
      v8 = [v6 replyContext];
      [v7 sendDelayedReply:v8 dictionary:v9];

      [*(id *)(a1 + 32) _registerReply];
      ++v5;
    }
    while ((unint64_t)[*(id *)(a1 + 48) count] > v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 56)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count]) {
    [*(id *)(a1 + 32) _showNextPrompt];
  }
}

void sub_10000629C(const __CFDictionary *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  SInt32 error = 0;
  CFUserNotificationRef v7 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, a1);
  if (!qword_10000C5D8) {
    qword_10000C5D8 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  }
  v8 = malloc_type_malloc(0x10uLL, 0x80040803F642BuLL);
  void *v8 = a2;
  v8[1] = a3;
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C5D8, v7, v8);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v7, (CFUserNotificationCallBack)sub_100006418, 0);
  Current = CFRunLoopGetCurrent();
  CFStringRef v11 = CFRunLoopCopyCurrentMode(Current);
  CFRunLoopAddSource(Current, RunLoopSource, v11);
  if (v11) {
    CFRelease(v11);
  }
  if (RunLoopSource) {
    CFRelease(RunLoopSource);
  }
}

void sub_100006418(void *key, uint64_t a2)
{
  if (qword_10000C5D8)
  {
    Value = (void **)CFDictionaryGetValue((CFDictionaryRef)qword_10000C5D8, key);
    if (Value)
    {
      unint64_t v5 = *Value;
      id v6 = Value[1];
      free(Value);
    }
    else
    {
      unint64_t v5 = 0;
      id v6 = 0;
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_10000C5D8, key);
    if (!CFDictionaryGetCount((CFDictionaryRef)qword_10000C5D8))
    {
      CFRelease((CFTypeRef)qword_10000C5D8);
      qword_10000C5D8 = 0;
    }
    if (v5 && v6) {
      [v5 performSelector:v6 withObject:key withObject:a2];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  if (key)
  {
    CFRelease(key);
  }
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return _CFRunLoopCopyCurrentMode(rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t CertUILoggingInitialize()
{
  return _CertUILoggingInitialize();
}

uint64_t SBSLaunchApplicationWithIdentifier()
{
  return _SBSLaunchApplicationWithIdentifier();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
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
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__actualCenter(void *a1, const char *a2, ...)
{
  return [a1 _actualCenter];
}

id objc_msgSend__copyCancelOnlyUserNotificationInfo(void *a1, const char *a2, ...)
{
  return [a1 _copyCancelOnlyUserNotificationInfo];
}

id objc_msgSend__copyUserNotificationInfo(void *a1, const char *a2, ...)
{
  return [a1 _copyUserNotificationInfo];
}

id objc_msgSend__hostname(void *a1, const char *a2, ...)
{
  return [a1 _hostname];
}

id objc_msgSend__launchSheetApp(void *a1, const char *a2, ...)
{
  return [a1 _launchSheetApp];
}

id objc_msgSend__localizedUntrustedCertAcceptNotAllowedMessage(void *a1, const char *a2, ...)
{
  return [a1 _localizedUntrustedCertAcceptNotAllowedMessage];
}

id objc_msgSend__localizedUntrustedCertAlertMessage(void *a1, const char *a2, ...)
{
  return [a1 _localizedUntrustedCertAlertMessage];
}

id objc_msgSend__localizedUntrustedCertAlertTitle(void *a1, const char *a2, ...)
{
  return [a1 _localizedUntrustedCertAlertTitle];
}

id objc_msgSend__registerNewRequest(void *a1, const char *a2, ...)
{
  return [a1 _registerNewRequest];
}

id objc_msgSend__registerReply(void *a1, const char *a2, ...)
{
  return [a1 _registerReply];
}

id objc_msgSend__relayCenter(void *a1, const char *a2, ...)
{
  return [a1 _relayCenter];
}

id objc_msgSend__showNextPrompt(void *a1, const char *a2, ...)
{
  return [a1 _showNextPrompt];
}

id objc_msgSend__shutdown(void *a1, const char *a2, ...)
{
  return [a1 _shutdown];
}

id objc_msgSend__uniqueDigest(void *a1, const char *a2, ...)
{
  return [a1 _uniqueDigest];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowCertificateTrust(void *a1, const char *a2, ...)
{
  return [a1 allowCertificateTrust];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delayReply(void *a1, const char *a2, ...)
{
  return [a1 delayReply];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCertificateTrustRestricted(void *a1, const char *a2, ...)
{
  return [a1 isCertificateTrustRestricted];
}

id objc_msgSend_localizedOriginatingAppName(void *a1, const char *a2, ...)
{
  return [a1 localizedOriginatingAppName];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_replyContext(void *a1, const char *a2, ...)
{
  return [a1 replyContext];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runServerOnCurrentThread(void *a1, const char *a2, ...)
{
  return [a1 runServerOnCurrentThread];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_showCertificateDetails(void *a1, const char *a2, ...)
{
  return [a1 showCertificateDetails];
}

id objc_msgSend_showContinue(void *a1, const char *a2, ...)
{
  return [a1 showContinue];
}

id objc_msgSend_stopServer(void *a1, const char *a2, ...)
{
  return [a1 stopServer];
}

id objc_msgSend_trustDigest(void *a1, const char *a2, ...)
{
  return [a1 trustDigest];
}