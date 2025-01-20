void sub_2D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_2D74(uint64_t a1)
{
  return [*(id *)(a1 + 32) createNewDevice];
}

void sub_2D7C(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v2 = Weak;
    if (Weak[4])
    {
      v3 = Weak;
      v4 = v2[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_2E10;
      block[3] = &unk_8388;
      block[4] = v2;
      dispatch_async(v4, block);
    }
  }
}

void sub_2E10(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    if (objc_msgSend(objc_msgSend(+[AVOutputContext sharedSystemRemoteDisplayContext](AVOutputContext, "sharedSystemRemoteDisplayContext"), "outputDevice"), "deviceType") == (char *)&dword_0 + 2)
    {
      if (dword_CC98 <= 50 && (dword_CC98 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [*(id *)(a1 + 32) createNewDevice];
    }
    else
    {
      if (dword_CC98 <= 50 && (dword_CC98 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if ([*(id *)(*(void *)(a1 + 32) + 24) count])
      {
        id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:0];
        if (v2)
        {
          id v3 = v2;
          [v2 stopRecordingWithOptionalForcedError:1919115630];
          [*(id *)(a1 + 32) destroyDevice:v3];
        }
      }
    }
  }
  v4 = *(void **)(a1 + 32);
}

id sub_2F60(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleNotification:fromObject:");
}

id sub_2F68(uint64_t a1)
{
  return [*(id *)(a1 + 32) createNewDevice];
}

void sub_3070(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v1)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v1);
          }

          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    *(void *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

void sub_34D0(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), kFigEndpointNotification_EndpointActivated))
    {
      [*(id *)(a1 + 32) createNewDevice];
      goto LABEL_12;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 40), kFigEndpointNotification_EndpointDeactivated))
    {
      if (*(void *)(a1 + 48) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v2 = *(id *)(a1 + 48);
      }
      else
      {
        if (![*(id *)(*(void *)(a1 + 32) + 24) count]) {
          goto LABEL_12;
        }
        id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:0];
      }
      if (v2)
      {
        [v2 stopRecordingWithOptionalForcedError:1919115630];
        [*(id *)(a1 + 32) destroyDevice:v2];
      }
    }
  }
LABEL_12:
  id v3 = *(void **)(a1 + 32);
}

uint64_t sub_36E8(const void *a1)
{
  if (dword_CC98 <= 30 && (dword_CC98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return avvcDevice_clientDeadConnection(a1);
}

void sub_3780()
{
  if (dword_CC98 <= 50 && (dword_CC98 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

id sub_3C14(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 handleNotification:a3 fromCenter:a1 fromObject:a4 withUserInfo:a5];
}

void sub_41F4(uint64_t a1)
{
  CFTypeRef v31 = 0;
  CFTypeRef v32 = 0;
  CFTypeRef cf = 0;
  [*(id *)(*(void *)(a1 + 32) + 176) streamDescription];
  if (dword_CDC8 <= 50 && (dword_CDC8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 184);
    LogPrintF();
  }
  *(void *)(*(void *)(a1 + 32) + 160) = _Block_copy(*(const void **)(a1 + 48));
  *(void *)(*(void *)(a1 + 32) + 144) = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
  if (!*(void *)(*(void *)(a1 + 32) + 144))
  {
    APSLogErrorAt();
    uint64_t v11 = 4294960568;
    goto LABEL_39;
  }
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5)
  {
    uint64_t v11 = 4294954514;
LABEL_38:
    APSLogErrorAt();
    goto LABEL_39;
  }
  uint64_t v6 = v5(CMBaseObject, kAPEndpointStreamCarPlayAudioProperty_CarPlayAudioFormats, 0, &v32);
  if (v6)
  {
    uint64_t v11 = v6;
    goto LABEL_38;
  }
  uint64_t v7 = APCarPlayAudioFormatsCopyFormatInfoForStreamDescription();
  if (v7)
  {
    uint64_t v11 = v7;
    goto LABEL_38;
  }
  uint64_t v8 = FigEndpointStreamGetCMBaseObject();
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v12 = *(uint64_t (**)(uint64_t, void, CFTypeRef))(v10 + 56);
  if (!v12)
  {
    uint64_t v11 = 4294954514;
    goto LABEL_38;
  }
  uint64_t v13 = v12(v8, kAPEndpointStreamCarPlayAudioProperty_AudioFormatInfo, v31);
  if (v13)
  {
    uint64_t v11 = v13;
    goto LABEL_38;
  }
  [*(id *)(*(void *)(a1 + 32) + 176) streamDescription];
  uint64_t v14 = APAudioSinkSharedMemRemoteCreate();
  if (v14)
  {
    uint64_t v11 = v14;
    goto LABEL_38;
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v16 = FigEndpointStreamGetCMBaseObject();
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  v19 = *(uint64_t (**)(uint64_t, void, uint64_t))(v18 + 56);
  if (!v19)
  {
    uint64_t v11 = 4294954514;
    goto LABEL_38;
  }
  uint64_t v20 = v19(v16, kFigEndpointStreamProperty_AudioSink, v15);
  if (v20)
  {
    uint64_t v11 = v20;
    goto LABEL_38;
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 32);
  v22 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v22) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  if (*v23 < 2uLL)
  {
    uint64_t v11 = 4294954515;
    goto LABEL_38;
  }
  v24 = (uint64_t (*)(uint64_t))v23[3];
  if (!v24)
  {
    uint64_t v11 = 4294954514;
    goto LABEL_38;
  }
  uint64_t v25 = v24(v21);
  if (v25)
  {
    uint64_t v11 = v25;
    goto LABEL_38;
  }
  [*(id *)(a1 + 32) insertStreamStartTimestamp:*(void *)(a1 + 40) returnOptions:&cf];
  uint64_t v26 = FigEndpointStreamResumeSync();
  if (v26)
  {
    uint64_t v11 = v26;
    goto LABEL_38;
  }
  uint64_t v27 = *(void *)(a1 + 32);
  *(_OWORD *)(v27 + 120) = 0u;
  *(_OWORD *)(v27 + 104) = 0u;
  *(_OWORD *)(v27 + 88) = 0u;
  *(_OWORD *)(v27 + 72) = 0u;
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(*(void *)(a1 + 32) + 64);
  *(_DWORD *)(*(void *)(a1 + 32) + 128) = 3;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  APSPowerAssertionRaise();
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56), 0, 0x4C4B40uLL, 0xFAuLL);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_3C14, kAPCarPlayAVVCNotification_StateIncompatibleWithAuxIn, 0, (CFNotificationSuspensionBehavior)0);
  if (dword_CDC8 <= 30 && (dword_CDC8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v29 = 0;
    LogPrintF();
  }
  uint64_t v11 = 0;
LABEL_39:
  objc_msgSend(*(id *)(a1 + 32), "actionCompleted:WithResult:", @"Start recording", v11, v29);
  if (v31) {
    CFRelease(v31);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_489C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 48))
  {
LABEL_28:
    if (dword_CDC8 <= 30 && (dword_CDC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    LODWORD(v13) = 0;
    goto LABEL_33;
  }
  if (dword_CDC8 <= 50)
  {
    if (dword_CDC8 != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v3))
    {
      uint64_t v21 = *(unsigned int *)(v2 + 156);
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v2 + 48) = 0;
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56));
  uint64_t v4 = FigEndpointStreamSuspendSync();
  if (v4)
  {
    uint64_t v13 = v4;
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    if (*v7 < 2uLL)
    {
      uint64_t v13 = 4294954515;
    }
    else
    {
      uint64_t v8 = (uint64_t (*)(uint64_t))v7[4];
      if (v8)
      {
        uint64_t v9 = v8(v5);
        if (!v9)
        {
          uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
          uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v11) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0;
          }
          uint64_t v14 = *(void (**)(uint64_t, void, void))(v12 + 56);
          if (v14) {
            v14(CMBaseObject, kFigEndpointStreamProperty_AudioSink, 0);
          }
          uint64_t v15 = *(void *)(a1 + 32);
          uint64_t v16 = *(const void **)(v15 + 32);
          if (v16)
          {
            CFRelease(v16);
            *(void *)(*(void *)(a1 + 32) + 32) = 0;
            uint64_t v15 = *(void *)(a1 + 32);
          }

          *(void *)(*(void *)(a1 + 32) + 144) = 0;
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), kAPCarPlayAVVCNotification_StateIncompatibleWithAuxIn, *(const void **)(*(void *)(a1 + 32) + 16));
          APSPowerAssertionRelease();
          goto LABEL_28;
        }
        uint64_t v13 = v9;
      }
      else
      {
        uint64_t v13 = 4294954514;
      }
    }
  }
  APSLogErrorAt();
  if (dword_CDC8 <= 90 && (dword_CDC8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v21 = v13;
    LogPrintF();
  }
LABEL_33:
  unsigned int v18 = *(_DWORD *)(a1 + 40);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v13;
  }
  objc_msgSend(*(id *)(a1 + 32), "actionCompleted:WithResult:", @"Stop recording", v19, v21);
  uint64_t v20 = *(const void **)(*(void *)(a1 + 32) + 160);
  if (v20)
  {
    _Block_release(v20);
    *(void *)(*(void *)(a1 + 32) + 160) = 0;
  }
}

void *sub_4CA0(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(a1 + 32) + 160);
  if (v2)
  {
    _Block_release(v2);
    *(void *)(*(void *)(a1 + 32) + 160) = 0;
  }
  result = _Block_copy(*(const void **)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 160) = result;
  return result;
}

uint64_t avvcDevice_clientDeadConnection(const void *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == FigEndpointStreamGetTypeID())
  {
    return _APEndpointStreamCarPlayAudioRemote_ServerDied(a1);
  }
  else
  {
    CFTypeID v3 = CFGetTypeID(a1);
    if (v3 == FigEndpointAudioSinkGetTypeID())
    {
      return _APAudioSinkSharedMemRemote_ServerDied(a1);
    }
    else
    {
      CFTypeID v4 = CFGetTypeID(a1);
      uint64_t result = FigEndpointGetTypeID();
      if (v4 == result)
      {
        return _APEndpointCarPlayRemote_ServerDied(a1);
      }
    }
  }
  return result;
}

uint64_t APAudioSinkSharedMemRemoteCreate()
{
  return _APAudioSinkSharedMemRemoteCreate();
}

uint64_t APCarPlayAudioFormatInfoGetDescription()
{
  return _APCarPlayAudioFormatInfoGetDescription();
}

uint64_t APCarPlayAudioFormatsCopyAudioFormatInfosForStreamAndType()
{
  return _APCarPlayAudioFormatsCopyAudioFormatInfosForStreamAndType();
}

uint64_t APCarPlayAudioFormatsCopyFormatInfoForStreamDescription()
{
  return _APCarPlayAudioFormatsCopyFormatInfoForStreamDescription();
}

uint64_t APEndpointCarPlayRemoteCreate()
{
  return _APEndpointCarPlayRemoteCreate();
}

uint64_t APEndpointStreamCarPlayAudioRemoteCreate()
{
  return _APEndpointStreamCarPlayAudioRemoteCreate();
}

uint64_t APSGetFBOPropertyInt64()
{
  return _APSGetFBOPropertyInt64();
}

uint64_t APSLogErrorAt()
{
  return _APSLogErrorAt();
}

uint64_t APSPowerAssertionCreate()
{
  return _APSPowerAssertionCreate();
}

uint64_t APSPowerAssertionRaise()
{
  return _APSPowerAssertionRaise();
}

uint64_t APSPowerAssertionRelease()
{
  return _APSPowerAssertionRelease();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
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

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetInt64()
{
  return _CFDictionaryGetInt64();
}

uint64_t CFDictionarySetInt64()
{
  return _CFDictionarySetInt64();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return _FigDispatchQueueCreateWithPriority();
}

uint64_t FigEndpointAudioSinkGetTypeID()
{
  return _FigEndpointAudioSinkGetTypeID();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return _FigEndpointGetCMBaseObject();
}

uint64_t FigEndpointGetTypeID()
{
  return _FigEndpointGetTypeID();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return _FigEndpointStreamGetCMBaseObject();
}

uint64_t FigEndpointStreamGetTypeID()
{
  return _FigEndpointStreamGetTypeID();
}

uint64_t FigEndpointStreamResumeSync()
{
  return _FigEndpointStreamResumeSync();
}

uint64_t FigEndpointStreamSuspendSync()
{
  return _FigEndpointStreamSuspendSync();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigXPCRemoteClientCreate()
{
  return _FigXPCRemoteClientCreate();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t MillisecondsToUpTicks()
{
  return _MillisecondsToUpTicks();
}

uint64_t SecondsToUpTicksF()
{
  return _SecondsToUpTicksF();
}

uint64_t UpTicksToMilliseconds()
{
  return _UpTicksToMilliseconds();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

uint64_t dispatch_source_cancel_and_wait()
{
  return _dispatch_source_cancel_and_wait();
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_msgSend_audioBufferList(void *a1, const char *a2, ...)
{
  return [a1 audioBufferList];
}

id objc_msgSend_clientInit(void *a1, const char *a2, ...)
{
  return [a1 clientInit];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createNewDevice(void *a1, const char *a2, ...)
{
  return [a1 createNewDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_frameCapacity(void *a1, const char *a2, ...)
{
  return [a1 frameCapacity];
}

id objc_msgSend_outputDevice(void *a1, const char *a2, ...)
{
  return [a1 outputDevice];
}

id objc_msgSend_packetDescriptions(void *a1, const char *a2, ...)
{
  return [a1 packetDescriptions];
}

id objc_msgSend_pickDefaultFormat(void *a1, const char *a2, ...)
{
  return [a1 pickDefaultFormat];
}

id objc_msgSend_readAndSendPacketToAVVC(void *a1, const char *a2, ...)
{
  return [a1 readAndSendPacketToAVVC];
}

id objc_msgSend_readSupportedFormats(void *a1, const char *a2, ...)
{
  return [a1 readSupportedFormats];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_sendAllAvailableAudioDataToAVVC(void *a1, const char *a2, ...)
{
  return [a1 sendAllAvailableAudioDataToAVVC];
}

id objc_msgSend_sharedSystemRemoteDisplayContext(void *a1, const char *a2, ...)
{
  return [a1 sharedSystemRemoteDisplayContext];
}

id objc_msgSend_streamDescription(void *a1, const char *a2, ...)
{
  return [a1 streamDescription];
}