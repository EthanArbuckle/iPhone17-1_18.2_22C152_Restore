void sub_23D4D4CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_23D4D51AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D4D547C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23D4D5530(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

void sub_23D4D9544(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_23D4DB11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D4E0D70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_23D4E0EC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_23D4E1270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void _HandleClearScreen(uint64_t a1, void *a2, const void *a3)
{
  v4 = a2;
  if (v4 && CFEqual(a3, (CFTypeRef)*MEMORY[0x263F24820]))
  {
    if (gLogCategory_AirPlayReceiverKit <= 40
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = v4[17];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___HandleClearScreen_block_invoke;
    block[3] = &unk_264EA1AE8;
    v7 = v4;
    dispatch_sync(v5, block);
  }
}

void sub_23D4E3E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_23D4E4144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_23D4E51F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D4E54E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t FigVideoQueueSetProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (!v8) {
    return 4294954514;
  }
  return v8(CMBaseObject, a2, a3);
}

uint64_t FigVideoQueueStart(uint64_t a1)
{
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = *(uint64_t (**)(uint64_t, void))(v3 + 8);
  if (!v4) {
    return 4294954514;
  }
  return v4(a1, 0);
}

void ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:kReachabilityChangedNotification object:v4];
}

void sub_23D4E8660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_23D4EBDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23D4ECB14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_23D4ED858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBufConsumerCreate(uint64_t a1)
{
  if (a1)
  {
    FigValeriaGetClassID();
    if (!CMDerivedObjectCreate())
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(void *)uint64_t DerivedStorage = dispatch_queue_create("com.apple.AirPlayReceiver.sbufconsumer", 0);
      *(_WORD *)(DerivedStorage + 8) = 0;
      *(unsigned char *)(DerivedStorage + 10) = 0;
      if (gLogCategory_AirPlayReceiverKit > 30
        || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
      {
        return 0;
      }
LABEL_5:
      LogPrintF();
      return 0;
    }
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_5;
  }
  return 0;
}

void *SBufConsumerRegisterVideoSampleBufferCallbackForRendering(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v4 = *(const void **)(DerivedStorage + 24);
  if (v4) {
    _Block_release(v4);
  }
  result = _Block_copy(a2);
  *(void *)(DerivedStorage + 24) = result;
  return result;
}

void *SBufConsumerRegisterAudioSampleBufferCallbackForRendering(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v4 = *(const void **)(DerivedStorage + 16);
  if (v4) {
    _Block_release(v4);
  }
  result = _Block_copy(a2);
  *(void *)(DerivedStorage + 16) = result;
  return result;
}

void *SBufConsumerRegisterCallbackForDisconnect(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v4 = *(const void **)(DerivedStorage + 32);
  if (v4) {
    _Block_release(v4);
  }
  result = _Block_copy(a2);
  *(void *)(DerivedStorage + 32) = result;
  return result;
}

void *SBufConsumerRegisterCallbackForCopyProperty(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v4 = *(const void **)(DerivedStorage + 40);
  if (v4) {
    _Block_release(v4);
  }
  result = _Block_copy(a2);
  *(void *)(DerivedStorage + 40) = result;
  return result;
}

void sbufConsumer_finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(void *)DerivedStorage)
  {
    dispatch_release(*(dispatch_object_t *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0;
  }
  uint64_t v1 = *(const void **)(DerivedStorage + 24);
  if (v1) {
    _Block_release(v1);
  }
  uint64_t v2 = *(const void **)(DerivedStorage + 16);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(const void **)(DerivedStorage + 32);
  if (v3) {
    _Block_release(v3);
  }
  id v4 = *(const void **)(DerivedStorage + 40);
  if (v4)
  {
    _Block_release(v4);
  }
}

CFStringRef sbufConsumer_copyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"<SBufConsumer %p>", a1);
}

uint64_t sbufConsumer_copyProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = -12787;
  uint64_t DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  uint64_t v7 = *DerivedStorage;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __sbufConsumer_copyProperty_block_invoke;
  v10[3] = &unk_264EA21A8;
  v10[4] = &v11;
  v10[5] = DerivedStorage;
  v10[6] = a2;
  v10[7] = a4;
  dispatch_sync(v7, v10);
  uint64_t v8 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_23D4EF030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __sbufConsumer_copyProperty_block_invoke(void *a1)
{
  uint64_t result = *(void *)(a1[5] + 40);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], a1[7]);
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  }
  return result;
}

uint64_t sbufConsumer_getDispatchQueue()
{
  return 0;
}

uint64_t sbufConsumer_connect()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  uint64_t DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v1 = *DerivedStorage;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_connect_block_invoke;
  block[3] = &unk_264EA21D0;
  void block[4] = &v5;
  block[5] = DerivedStorage;
  dispatch_sync(v1, block);
  if (*((_DWORD *)v6 + 6))
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_8;
  }
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_23D4EF264(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sbufConsumer_disconnect()
{
  uint64_t DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v1 = *DerivedStorage;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_disconnect_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

uint64_t sbufConsumer_enqueueVideoFrame(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  uint64_t DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  id v4 = *DerivedStorage;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_enqueueVideoFrame_block_invoke;
  block[3] = &unk_264EA21F8;
  void block[4] = &v8;
  void block[5] = DerivedStorage;
  void block[6] = a2;
  dispatch_sync(v4, block);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_23D4EF464(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sbufConsumer_enqueueAudioSample(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  uint64_t DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  id v4 = *DerivedStorage;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_enqueueAudioSample_block_invoke;
  block[3] = &unk_264EA21F8;
  void block[4] = &v8;
  void block[5] = DerivedStorage;
  void block[6] = a2;
  dispatch_sync(v4, block);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_23D4EF534(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __sbufConsumer_connect_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(unsigned char *)(v1 + 8))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  else
  {
    *(_WORD *)(v1 + 8) = 257;
  }
  return result;
}

uint64_t __sbufConsumer_disconnect_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(_WORD *)(v1 + 8) = 0;
    *(unsigned char *)(v1 + 10) = 0;
    uint64_t result = *(void *)(v1 + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void *__sbufConsumer_enqueueVideoFrame_block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (*(unsigned char *)(v1 + 8))
  {
    if (!*(unsigned char *)(v1 + 10)) {
      *(_WORD *)(v1 + 9) = 256;
    }
    uint64_t v2 = *(void *)(v1 + 24);
    if (v2) {
      return (void *)(*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, result[6]);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(result[4] + 8) + 24) = -6709;
    return (void *)APSLogErrorAt();
  }
  return result;
}

void *__sbufConsumer_enqueueAudioSample_block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2) {
      return (void *)(*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, result[6]);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(result[4] + 8) + 24) = -6709;
    return (void *)APSLogErrorAt();
  }
  return result;
}

uint64_t UIControllerCreate()
{
  APReceiverUIControllerGetClassID();
  if (!CMDerivedObjectCreate())
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    *(void *)(DerivedStorage + 8) = 0;
    *(_WORD *)(DerivedStorage + 16) = 0;
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_4:
    LogPrintF();
    return 0;
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_4;
  }
  return 0;
}

uint64_t UIControllerPostVideoV1Event(uint64_t a1, const char *a2, const __CFDictionary *a3)
{
  CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    if (strcmp_prefix()) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = strcmp(a2, "userStop") != 0;
    }
    if (!strcmp(a2, "stopAudio") || v6)
    {
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (a3) {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
      }
      else {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      }
      CFDictionaryRef v8 = MutableCopy;
      if (!MutableCopy)
      {
        APSLogErrorAt();
        return 4294960568;
      }
      CFDictionarySetNumber();
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!strcmp(a2, "ended")
        || !strcmp(a2, "loading")
        || !strcmp(a2, "paused")
        || !strcmp(a2, "playing")
        || !strcmp(a2, "stopped"))
      {
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
        if (*(void *)(DerivedStorage + 56))
        {
          uint64_t v10 = DerivedStorage;
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          CFDictionarySetValue(Mutable, @"category", @"video");
          if (!strcmp(a2, "ended"))
          {
            CFDictionarySetValue(Mutable, @"state", @"stopped");
            CFDictionarySetValue(Mutable, @"reason", @"ended");
          }
          else
          {
            CFDictionarySetCString();
          }
          uiController_relayCommonParams(v8, Mutable);
          CFDictionaryRemoveValue(v8, @"sessionID");
          if (CFDictionaryGetCount(v8) >= 1) {
            CFDictionarySetValue(Mutable, @"params", v8);
          }
          (*(void (**)(void, __CFDictionary *))(v10 + 56))(*(void *)(v10 + 64), Mutable);
          if (Mutable) {
            CFRelease(Mutable);
          }
        }
        else
        {
          APSLogErrorAt();
        }
      }
      else if (!strcmp(a2, "error"))
      {
        uiController_handleErrorEventV1(a1, v8);
      }
      else if (!strcmp(a2, "failedURLRequest"))
      {
        uiController_handleFailedURLRequestV1(a1, v8);
      }
      else if (!strcmp(a2, "metaDataChanged"))
      {
        uiController_handleMetaDataEventV1(a1, v8);
      }
      else if (!strcmp(a2, "currentItemChanged") || !strcmp(a2, "itemPlayedToEnd") || !strcmp(a2, "itemRemoved"))
      {
        uiController_handlePlaylistEventV1(a1, (uint64_t)a2, v8);
      }
      else if (!strcmp(a2, "dateRange"))
      {
        uiController_handleDateRangeEventV1(a1, v8);
      }
      else if (!strcmp(a2, "fpsSecureStopGenerated") || !strcmp(a2, "userStop"))
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
      }
      else
      {
        uiController_handleOtherEventV1(a1, (uint64_t)a2, v8);
      }
      CFRelease(v8);
    }
    return 0;
  }
  else
  {
    uint64_t v12 = 4294960591;
    APSLogErrorAt();
  }
  return v12;
}

void uiController_handleErrorEventV1(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (uint64_t v4 = DerivedStorage, *(void *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(Mutable, @"category", @"video");
    CFDictionarySetValue(Mutable, @"error", a2);
    uiController_relayCommonParams((const __CFDictionary *)a2, Mutable);
    (*(void (**)(void, __CFDictionary *))(v4 + 56))(*(void *)(v4 + 64), Mutable);
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleFailedURLRequestV1(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (uint64_t v4 = DerivedStorage, *(void *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(Mutable, @"type", @"unhandledURLRequest");
    CFDictionarySetValue(Mutable, @"request", a2);
    uiController_relayCommonParams((const __CFDictionary *)a2, Mutable);
    (*(void (**)(void, __CFDictionary *))(v4 + 56))(*(void *)(v4 + 64), Mutable);
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleMetaDataEventV1(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (uint64_t v4 = DerivedStorage, *(void *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(Mutable, @"category", @"video");
    CFDictionarySetValue(Mutable, @"type", @"timedMetadata");
    uiController_relayCommonParams(a2, Mutable);
    (*(void (**)(void, __CFDictionary *))(v4 + 56))(*(void *)(v4 + 64), Mutable);
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handlePlaylistEventV1(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a3 && (uint64_t v5 = DerivedStorage, *(void *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(Mutable, @"category", @"video");
    CFDictionarySetCString();
    Value = CFDictionaryGetValue(a3, @"item");
    if (Value) {
      CFDictionarySetValue(Mutable, @"item", Value);
    }
    uiController_relayCommonParams(a3, Mutable);
    CFDictionaryRef v8 = CFDictionaryGetValue(a3, @"uuid");
    if (v8) {
      CFDictionarySetValue(Mutable, @"uuid", v8);
    }
    (*(void (**)(void, __CFDictionary *))(v5 + 56))(*(void *)(v5 + 64), Mutable);
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleDateRangeEventV1(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (uint64_t v4 = DerivedStorage, *(void *)(DerivedStorage + 56)))
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(Mutable, @"category", @"video");
    CFDictionarySetValue(Mutable, @"type", @"dateRange");
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"dateRangeArray");
    if (Value)
    {
      CFArrayRef v8 = Value;
      CFMutableArrayRef v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
      CFArrayGetCount(v8);
      CFArrayApplyBlock();
      if (v9) {
        CFDictionarySetValue(Mutable, @"dateRangeArray", v9);
      }
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFMutableArrayRef v9 = 0;
    }
    uint64_t v10 = CFDictionaryGetValue(a2, @"uuid");
    if (v10) {
      CFDictionarySetValue(Mutable, @"uuid", v10);
    }
    uiController_relayCommonParams(a2, Mutable);
    (*(void (**)(void, __CFDictionary *))(v4 + 56))(*(void *)(v4 + 64), Mutable);
    if (v9) {
      CFRelease(v9);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleOtherEventV1(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a3 && (uint64_t v5 = DerivedStorage, *(void *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetCString();
    uiController_relayCommonParams(a3, Mutable);
    CFDictionaryRemoveValue(a3, @"sessionID");
    if (CFDictionaryGetCount(a3) >= 1) {
      CFDictionarySetValue(Mutable, @"params", a3);
    }
    (*(void (**)(void, __CFDictionary *))(v5 + 56))(*(void *)(v5 + 64), Mutable);
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

void UIControllerSetVideoV1Delegate(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v7 = *(void **)(DerivedStorage + 104);
  *(void *)(DerivedStorage + 104) = v4;
  id v9 = v4;

  CFArrayRef v8 = *(void **)(DerivedStorage + 112);
  *(void *)(DerivedStorage + 112) = v5;
}

uint64_t UIControllerPostNotificationForRendererStoppedEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForStartRecordingEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForStopRecordingEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForKeyFrameRequest()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForFPSSecureStopGeneratedEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForUpdateDisplayInfo()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

void UIControllerSendUpstreamMessage(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage || (uint64_t v4 = DerivedStorage, (v5 = *(void **)(DerivedStorage + 48)) == 0))
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_15;
  }
  id v6 = v5;
  objc_sync_enter(v6);
  uint64_t v7 = *(void (**)(const void *, const void *, id))(v4 + 24);
  objc_sync_exit(v6);

  if (!v7)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_15;
  }
  if (!a2)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_15:
    goto LABEL_17;
  }
  if (!*(void *)v4 || (uint64_t v8 = FigCFWeakReferenceHolderCopyReferencedObject()) == 0)
  {
    if (gLogCategory_AirPlayReceiverKit > 60
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_17:
    LogPrintF();
    return;
  }
  id v9 = (const void *)v8;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v14 = 0;
  int v11 = [MEMORY[0x263F08AC0] dataWithPropertyList:a2 format:200 options:0 error:&v14];
  id v12 = v14;
  if (v11) {
    [v10 setObject:v11 forKey:*MEMORY[0x263F24860]];
  }
  if (v12)
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    [*(id *)(v4 + 48) currentVideoSessionID];
    Int64 = (const void *)CFNumberCreateInt64();
    v7(v9, Int64, v10);
    if (Int64) {
      CFRelease(Int64);
    }
  }
  CFRelease(v9);
}

uint64_t UIControllerCopyTLSInfo()
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v4 = 0;
  if (*DerivedStorage)
  {
    uint64_t v1 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
    if (!v1)
    {
      if (gLogCategory_AirPlayReceiverKit <= 60
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return 0;
    }
  }
  else
  {
    uint64_t v1 = 0;
  }
  uint64_t v2 = (void (*)(const void *, void, uint64_t *))DerivedStorage[4];
  if (v2) {
    v2(v1, 0, &v4);
  }
  if (v1) {
    CFRelease(v1);
  }
  return v4;
}

void uiController_finalize()
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v1 = *(id *)(DerivedStorage + 48);
  objc_sync_enter(v1);
  *(void *)(DerivedStorage + 24) = 0;
  *(void *)(DerivedStorage + 32) = 0;
  objc_sync_exit(v1);

  uint64_t v2 = *(void **)(DerivedStorage + 48);
  if (v2)
  {
    *(void *)(DerivedStorage + 48) = 0;
  }
  if (*(void *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0;
  }
  uint64_t v3 = *(const void **)(DerivedStorage + 40);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(DerivedStorage + 40) = 0;
  }
  uint64_t v4 = *(const void **)(DerivedStorage + 88);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(DerivedStorage + 88) = 0;
  }
  id v5 = *(const void **)(DerivedStorage + 8);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(DerivedStorage + 8) = 0;
  }
}

CFStringRef uiController_copyDebugDescription(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<UIController %p>", a1);
}

uint64_t uiController_copyProperty(uint64_t a1, const void *a2, uint64_t a3, CFTypeRef *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248D0]))
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    uint64_t v8 = SBufConsumerCreate((uint64_t)Mutable);
    if (!v8)
    {
      uint64_t v10 = 4294960534;
      APSLogErrorAt();
      return v10;
    }
    id v9 = (const void *)v8;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __uiController_copyProperty_block_invoke;
    v18[3] = &__block_descriptor_40_e31_v16__0__opaqueCMSampleBuffer__8l;
    v18[4] = DerivedStorage;
    SBufConsumerRegisterVideoSampleBufferCallbackForRendering(v8, v18);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __uiController_copyProperty_block_invoke_2;
    v17[3] = &__block_descriptor_40_e31_v16__0__opaqueCMSampleBuffer__8l;
    v17[4] = DerivedStorage;
    SBufConsumerRegisterAudioSampleBufferCallbackForRendering((uint64_t)v9, v17);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __uiController_copyProperty_block_invoke_3;
    v16[3] = &__block_descriptor_40_e5_v8__0l;
    v16[4] = DerivedStorage;
    SBufConsumerRegisterCallbackForDisconnect((uint64_t)v9, v16);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __uiController_copyProperty_block_invoke_4;
    v15[3] = &__block_descriptor_40_e25_i24__0____CFString__8_v16l;
    v15[4] = DerivedStorage;
    SBufConsumerRegisterCallbackForCopyProperty((uint64_t)v9, v15);
    *a4 = CFRetain(v9);
    CFRelease(v9);
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F24898]))
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248A8]))
    {
      id v12 = (const void **)MEMORY[0x263EFFB40];
      if (!*(unsigned char *)(DerivedStorage + 16)) {
        id v12 = (const void **)MEMORY[0x263EFFB38];
      }
    }
    else
    {
      if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248B8])) {
        return 4294954509;
      }
      int v13 = [*(id *)(DerivedStorage + 48) isActive];
      id v12 = (const void **)MEMORY[0x263EFFB40];
      if (!v13) {
        id v12 = (const void **)MEMORY[0x263EFFB38];
      }
    }
    int v11 = *v12;
    goto LABEL_17;
  }
  int v11 = *(const void **)(DerivedStorage + 8);
  if (v11)
  {
LABEL_17:
    uint64_t v10 = 0;
    *a4 = CFRetain(v11);
    return v10;
  }
  return 0;
}

uint64_t uiController_setProperty(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248D0])) {
    goto LABEL_2;
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F24898]))
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248A8]))
    {
      *(unsigned char *)(DerivedStorage + 16) = *MEMORY[0x263EFFB40] == (void)a3;
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248C8]))
    {
      *(unsigned char *)(DerivedStorage + 17) = *MEMORY[0x263EFFB40] == (void)a3;
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248C0]))
    {
      *(unsigned char *)(DerivedStorage + 18) = *MEMORY[0x263EFFB40] == (void)a3;
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F24888]))
    {
      if (!*(_DWORD *)(DerivedStorage + 80) || !*(void *)(DerivedStorage + 72)) {
        goto LABEL_2;
      }
      if (!*(void *)(DerivedStorage + 104))
      {
        *((_DWORD *)v26 + 6) = -6762;
        APSLogErrorAt();
        goto LABEL_2;
      }
      id v9 = *(NSObject **)(DerivedStorage + 112);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __uiController_setProperty_block_invoke;
      v24[3] = &unk_264EA21F8;
      v24[4] = &v25;
      v24[5] = DerivedStorage;
      v24[6] = a3;
      uint64_t v10 = v24;
LABEL_22:
      dispatch_sync(v9, v10);
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F24890]))
    {
      CFDictionaryGetDouble();
      uint64_t v12 = v11;
      CFDictionaryGetDouble();
      if (!*(void *)(DerivedStorage + 104)) {
        goto LABEL_2;
      }
      id v9 = *(NSObject **)(DerivedStorage + 112);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __uiController_setProperty_block_invoke_2;
      block[3] = &unk_264EA21A8;
      void block[4] = &v25;
      void block[5] = DerivedStorage;
      void block[6] = v12;
      void block[7] = v13;
      uint64_t v10 = block;
      goto LABEL_22;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248E0]))
    {
      if (!a3)
      {
        uint64_t v8 = *(const void **)(DerivedStorage + 40);
        *(void *)(DerivedStorage + 40) = 0;
LABEL_33:
        if (!v8) {
          goto LABEL_2;
        }
        goto LABEL_7;
      }
      CFTypeID v14 = CFGetTypeID(a3);
      if (v14 == APReceiverStatsCollectorGetTypeID())
      {
        uint64_t v8 = *(const void **)(DerivedStorage + 40);
        *(void *)(DerivedStorage + 40) = a3;
        CFRetain(a3);
        goto LABEL_33;
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248E8]))
    {
      if (a3)
      {
        CFTypeID v15 = CFGetTypeID(a3);
        if (v15 == CFNumberGetTypeID())
        {
          if (*(void *)(DerivedStorage + 48))
          {
            int valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a3, kCFNumberFloat32Type, &valuePtr);
            LODWORD(v16) = valuePtr;
            [*(id *)(DerivedStorage + 48) setMirroringVolume:v16];
          }
          goto LABEL_2;
        }
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248D8]))
    {
      if (a3)
      {
        uint64_t v17 = *(void **)(DerivedStorage + 48);
        if (v17) {
          [v17 setSessionReceiverAddress:a3];
        }
        goto LABEL_2;
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248B0]))
    {
      if (a3)
      {
        CFTypeID v18 = CFGetTypeID(a3);
        if (v18 == CFDataGetTypeID())
        {
          [*(id *)(DerivedStorage + 48) setEnsembleInfo:a3];
          goto LABEL_2;
        }
      }
    }
    else
    {
      if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F248A0]))
      {
        v20 = v26;
        int v21 = -12787;
LABEL_48:
        *((_DWORD *)v20 + 6) = v21;
        goto LABEL_2;
      }
      if (a3)
      {
        CFTypeID v19 = CFGetTypeID(a3);
        if (v19 == CFDictionaryGetTypeID())
        {
          [*(id *)(DerivedStorage + 48) setDemoDeviceInfo:a3];
          goto LABEL_2;
        }
      }
    }
    APSLogErrorAt();
    v20 = v26;
    int v21 = -12780;
    goto LABEL_48;
  }
  uint64_t v8 = *(const void **)(DerivedStorage + 8);
  *(void *)(DerivedStorage + 8) = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (v8) {
LABEL_7:
  }
    CFRelease(v8);
LABEL_2:
  uint64_t v6 = *((unsigned int *)v26 + 6);
  _Block_object_dispose(&v25, 8);
  return v6;
}

void sub_23D4F145C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __uiController_copyProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) processVideoSampleBuffer:a2];
}

uint64_t __uiController_copyProperty_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) processAudioSampleBuffer:a2];
}

void *__uiController_copyProperty_block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (void *)[result stop];
  }
  return result;
}

uint64_t __uiController_copyProperty_block_invoke_4(uint64_t a1, CFTypeRef cf1, void *a3)
{
  if (CFEqual(cf1, @"FigVideoQueueStats"))
  {
    uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
    if (result)
    {
      uint64_t v7 = [(id)result videoQueuePerformanceDictionary];
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t result = 0;
      *a3 = v7;
    }
  }
  else if (CFEqual(cf1, @"DoNotUseForAudioRendering"))
  {
    uint64_t v8 = +[APRKStreamRenderingManager sharedInstance];
    int v9 = [v8 optimizeAudioRenderingLatency];
    uint64_t v10 = (CFTypeRef *)MEMORY[0x263EFFB40];
    if (!v9) {
      uint64_t v10 = (CFTypeRef *)MEMORY[0x263EFFB38];
    }
    *a3 = CFRetain(*v10);

    return 0;
  }
  else
  {
    return 4294954509;
  }
  return result;
}

uint64_t __uiController_setProperty_block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[5] + 104) airplayUIUpdateAudioMetaData:a1[6]];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __uiController_setProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 104) airplayUIUpdateAudioProgress:*(double *)(a1 + 48) duration:*(double *)(a1 + 56)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t uiController_showPIN(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = a1;
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", a2, v11);
  uint64_t v8 = [NSString stringWithUTF8String:a4];
  int v9 = +[APRKStreamRenderingManager sharedInstance];
  [v9 processShowGlobalPasscodePromptRequest:v7 withClientName:v8];

  return 0;
}

uint64_t uiController_hidePIN(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = a1;
    LogPrintF();
  }
  CFAllocatorRef v2 = +[APRKStreamRenderingManager sharedInstance];
  [v2 processHideGlobalPasscodePromptRequest];

  return 0;
}

uint64_t uiController_showMessage()
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

uint64_t uiController_startScreenPresentation(uint64_t a1, uint64_t a2, __CFDictionary **a3)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v5 = CFDictionaryGetInt64() != 0;
  uint64_t v6 = +[APRKStreamRenderingManager sharedInstance];
  [v6 setShouldForwardLayers:v5];

  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v10 = +[APRKStreamRenderingManager sharedInstance];
  if (([v10 shouldForwardLayers] & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v11 = +[APRKStreamRenderingManager sharedInstance];
  if (([v11 useCALayerForMirroring] & 1) == 0)
  {

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v12 = [*(id *)(DerivedStorage + 48) mirroringLayer];

  if (v12)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      CFTypeID v19 = [*(id *)(DerivedStorage + 48) mirroringLayer];
      uint64_t v20 = *(void *)(DerivedStorage + 48);
      uint64_t v18 = a1;
      LogPrintF();
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24880], (const void *)objc_msgSend(*(id *)(DerivedStorage + 48), "mirroringLayer", v18, v19, v20));
  }
LABEL_13:
  uint64_t v13 = CFDictionaryCreateMutable(v8, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeID v14 = (const void *)*MEMORY[0x263F24818];
  CFTypeID v15 = [*(id *)(DerivedStorage + 48) HUDLayer];
  CFDictionarySetValue(v13, v14, v15);

  APReceiverStatsCollectorSetHUDOptions();
  CFRelease(v13);
  uint64_t v16 = ++uiController_startScreenPresentation_uniqueScreenSessionID;
  CFDictionarySetInt64();
  if (a3) {
    *a3 = Mutable;
  }
  else {
    CFRelease(Mutable);
  }
  [*(id *)(DerivedStorage + 48) processStartScreenPresentationWithSessionID:v16];
  return 0;
}

uint64_t uiController_stopScreenPresentation()
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  APReceiverStatsCollectorSetHUDOptions();
  [*(id *)(DerivedStorage + 48) processStopScreenPresentationWithSessionID:CFDictionaryGetInt64()];
  return 0;
}

uint64_t uiController_startVideoPlayback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0;
  }
  if (a4 && (v10 = FigCFWeakReferenceHolderCreateWithReferencedObject(), (*(void *)uint64_t DerivedStorage = v10) == 0))
  {
    APSLogErrorAt();
    return 4294960568;
  }
  else
  {
    id v11 = *(id *)(DerivedStorage + 48);
    objc_sync_enter(v11);
    *(void *)(DerivedStorage + 24) = a2;
    *(void *)(DerivedStorage + 32) = a3;
    objc_sync_exit(v11);

    uint64_t Int64 = CFDictionaryGetInt64();
    CFArrayRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x263F24870]);
    if (Value) {
      [*(id *)(DerivedStorage + 48) setReceiverNetworkClock:Value];
    }
    [*(id *)(DerivedStorage + 48) processStartVideoPlaybackRequestWithWithSessionID:Int64 version:2];
    return 0;
  }
}

uint64_t uiController_stopVideoPlayback()
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if ([*(id *)(DerivedStorage + 48) processStopVideoPlaybackRequestWithSessionID:CFDictionaryGetInt64()])
  {
    id v1 = *(id *)(DerivedStorage + 48);
    objc_sync_enter(v1);
    *(void *)(DerivedStorage + 24) = 0;
    *(void *)(DerivedStorage + 32) = 0;
    objc_sync_exit(v1);
  }
  return 0;
}

uint64_t uiController_controlVideoPlayback(int a1, CFDictionaryRef theDict, void *a3)
{
  id Value = (id)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F24860]);
  uint64_t v6 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F24878]);
  if (Value)
  {
    uint64_t v7 = v6;
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (*(void *)(DerivedStorage + 48))
    {
      uint64_t v9 = DerivedStorage;
      id v17 = 0;
      uint64_t v10 = [MEMORY[0x263F08AC0] propertyListWithData:Value options:0 format:0 error:&v17];
      id Value = v17;
      if (Value || !v10)
      {
        if (gLogCategory_AirPlayReceiverKit > 90
          || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_21;
        }
      }
      else
      {
        if (FigCFDictionaryGetInt32IfPresent())
        {
          id v11 = (const void *)*MEMORY[0x263EFFB40];
          uint64_t v12 = [*(id *)(v9 + 48) backingMediaPlayer];
          uint64_t v13 = v12;
          if (v11 == v7)
          {
            CFTypeID v14 = [v12 processMessageWithIDAndDictionarySync:v10 messageSessionID:0];

            if (a3) {
              *a3 = v14;
            }
          }
          else
          {
            [v12 processMessageWithIDAndDictionaryAsync:v10 messageSessionID:0];
          }
          goto LABEL_21;
        }
        if (gLogCategory_AirPlayReceiverKit > 90
          || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      LogPrintF();
      goto LABEL_21;
    }
    id Value = 0;
  }
LABEL_22:
  uint64_t v15 = [Value code];

  return v15;
}

uint64_t uiController_startSession(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(DerivedStorage + 48)) {
    return 0;
  }
  uint64_t v3 = DerivedStorage;
  uint64_t v4 = +[APRKStreamRenderingManager sharedInstance];
  BOOL v5 = [MEMORY[0x263F08C38] UUID];
  uint64_t v6 = [v4 createStreamRendererWithUniqueID:v5 clientName:*(void *)(v3 + 8) UIController:a1];
  uint64_t v7 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v6;

  CFAllocatorRef v8 = *(void **)(v3 + 48);
  if (v8)
  {
    [v8 setIsWiredLink:*(unsigned __int8 *)(v3 + 17)];
    [*(id *)(v3 + 48) setIsP2PWiFi:*(unsigned __int8 *)(v3 + 18)];
    return 0;
  }
  APSLogErrorAt();
  return 4294960534;
}

uint64_t uiController_stopSession()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(DerivedStorage + 48))
  {
    uint64_t v1 = DerivedStorage;
    CFAllocatorRef v2 = +[APRKStreamRenderingManager sharedInstance];
    uint64_t v3 = [*(id *)(v1 + 48) uniqueID];
    [v2 removeRendererWithUniqueID:v3];
  }
  return 0;
}

uint64_t uiController_startVideoPlaybackV1(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, CFMutableDictionaryRef *a5)
{
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  int v62 = 0;
  unsigned int v58 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a4)
  {
    APSLogErrorAt();
    CFMutableDictionaryRef Mutable = 0;
    int v37 = -6705;
    goto LABEL_108;
  }
  uint64_t v7 = DerivedStorage;
  if (*(void *)(DerivedStorage + 72) || *(_DWORD *)(DerivedStorage + 80))
  {
    if (!*(void *)(DerivedStorage + 104))
    {
      *((_DWORD *)v60 + 6) = -6762;
      APSLogErrorAt();
      CFMutableDictionaryRef Mutable = 0;
      goto LABEL_90;
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetInt64();
    CFDictionarySetInt64();
    uint64_t v9 = *(NSObject **)(v7 + 112);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __uiController_startVideoPlaybackV1_block_invoke;
    block[3] = &unk_264EA21F8;
    void block[4] = &v59;
    void block[5] = v7;
    void block[6] = Mutable;
    dispatch_sync(v9, block);
    if (*((_DWORD *)v60 + 6)) {
      goto LABEL_109;
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v43 = *(unsigned int *)(v7 + 80);
      uint64_t v45 = *(void *)(v7 + 72);
      LogPrintF();
    }
    objc_msgSend(*(id *)(v7 + 48), "processStopVideoPlaybackRequestWithSessionID:", *(unsigned int *)(v7 + 80), v43, v45);
    *(void *)(v7 + 72) = 0;
    *(_DWORD *)(v7 + 80) = 0;
    *(unsigned char *)(v7 + 84) = 0;
  }
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a4);
  CFMutableDictionaryRef Mutable = MutableCopy;
  if (!MutableCopy)
  {
    APSLogErrorAt();
    CFMutableDictionaryRef Mutable = 0;
    int v37 = -6728;
    goto LABEL_108;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(MutableCopy, @"Content-Location");
  CFStringRef v12 = Value;
  if (!Value || (CFTypeID v13 = CFGetTypeID(Value), v13 != CFStringGetTypeID()))
  {
    APSLogErrorAt();
    int v37 = -6756;
    goto LABEL_108;
  }
  CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue(Mutable, @"cookies");
  CFArrayRef v15 = v14;
  if (!v14) {
    goto LABEL_35;
  }
  CFTypeID v16 = CFGetTypeID(v14);
  if (v16 != CFArrayGetTypeID()) {
    goto LABEL_35;
  }
  if (!_CFHTTPCookieStorageGetDefault())
  {
    int v42 = -6700;
    goto LABEL_101;
  }
  CFURLRef v17 = CFURLCreateWithString(0, v12, 0);
  if (!v17)
  {
    int v42 = -6700;
    goto LABEL_101;
  }
  CFArrayRef v18 = (const __CFArray *)CFHTTPCookieStorageCopyCookiesForURL();
  CFRelease(v17);
  if (v18)
  {
    CFIndex Count = CFArrayGetCount(v18);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFArrayGetValueAtIndex(v18, i);
        CFHTTPCookieStorageDeleteCookie();
      }
    }
    CFRelease(v18);
  }
  CFIndex v21 = CFArrayGetCount(v15);
  if (v21 >= 1)
  {
    CFIndex v22 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v15, v22);
      if (!ValueAtIndex || (CFTypeID v24 = CFGetTypeID(ValueAtIndex), v24 != CFDictionaryGetTypeID()))
      {
        int v42 = -6756;
        goto LABEL_101;
      }
      uint64_t v25 = (const void *)CFHTTPCookieCreateWithProperties();
      if (!v25) {
        break;
      }
      CFHTTPCookieStorageSetCookie();
      CFRelease(v25);
      if (v21 == ++v22) {
        goto LABEL_31;
      }
    }
    int v42 = -6700;
LABEL_101:
    APSLogErrorAt();
    *((_DWORD *)v60 + 6) = v42;
    if (gLogCategory_AirPlayReceiverKit <= 60
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_33;
    }
    goto LABEL_35;
  }
LABEL_31:
  *((_DWORD *)v60 + 6) = 0;
  if (gLogCategory_AirPlayReceiverKit <= 20
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
LABEL_33:
    LogPrintF();
  }
LABEL_35:
  uint64_t Int64 = CFDictionaryGetInt64();
  CFStringGetTypeID();
  TypedCFStringRef Value = (__CFString *)CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  int v28 = (__CFString *)CFDictionaryGetTypedValue();
  if (CFDictionaryGetInt64() || v28 == @"music")
  {
    BOOL v29 = 1;
  }
  else if (v28)
  {
    BOOL v29 = CFEqual(v28, @"music") != 0;
  }
  else
  {
    BOOL v29 = 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!TypedValue || !CFEqual(@"default", TypedValue) && !CFEqual(@"moviePlayback", TypedValue))
  {
    if (!v29
      && (!v28
       || v28 == @"movie"
       || CFEqual(v28, @"movie")
       || v28 == @"tvshow"
       || CFEqual(v28, @"tvshow")))
    {
      TypedCFStringRef Value = @"moviePlayback";
    }
    else
    {
      TypedCFStringRef Value = @"default";
    }
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    CFDictionaryRef v47 = a4;
    LogPrintF();
  }
  *(void *)(v7 + 56) = a2;
  *(void *)(v7 + 64) = a3;
  *(void *)(v7 + 72) = Int64;
  do
    unsigned int add = atomic_fetch_add(&uiController_newVideoV1SessionID_sessionID, 1u);
  while (!add);
  unsigned int v58 = add;
  *(_DWORD *)(v7 + 80) = add;
  *(unsigned char *)(v7 + 84) = v29;
  v31 = *(const void **)(v7 + 88);
  CFRetain(TypedValue);
  *(void *)(v7 + 88) = TypedValue;
  if (v31) {
    CFRelease(v31);
  }
  CFDictionarySetNumber();
  CFTypeRef cf = 0;
  v44 = @"audioMode";
  uint64_t v46 = *(void *)(v7 + 88);
  int Formatted = CFPropertyListCreateFormatted();
  *((_DWORD *)v60 + 6) = Formatted;
  if (Formatted)
  {
LABEL_109:
    APSLogErrorAt();
    goto LABEL_90;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  if (cf) {
    CFRelease(cf);
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v44 = (__CFString *)Mutable;
    LogPrintF();
  }
  if (!*(void *)(v7 + 104))
  {
    *((_DWORD *)v60 + 6) = -6762;
    APSLogErrorAt();
    goto LABEL_90;
  }
  v33 = *(NSObject **)(v7 + 112);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __uiController_startVideoPlaybackV1_block_invoke_2;
  v51[3] = &unk_264EA2260;
  v51[6] = v7;
  v51[7] = Mutable;
  v51[4] = &v59;
  v51[5] = &v54;
  dispatch_sync(v33, v51);
  if (!*((_DWORD *)v60 + 6))
  {
    CFDictionaryRef v34 = (const __CFDictionary *)v55[3];
    if (v34)
    {
      CFMutableDictionaryRef v35 = CFDictionaryCreateMutableCopy(0, 0, v34);
      CFRelease((CFTypeRef)v55[3]);
      if (v35) {
        goto LABEL_74;
      }
    }
    else
    {
      CFMutableDictionaryRef v35 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v35)
      {
LABEL_74:
        CFDictionarySetNumber();
        if (a5)
        {
          *a5 = v35;
          int v36 = gLogCategory_AirPlayReceiverKit;
          if (gLogCategory_AirPlayReceiverKit > 30) {
            goto LABEL_83;
          }
          if (gLogCategory_AirPlayReceiverKit == -1)
          {
            if (!_LogCategory_Initialize()) {
              goto LABEL_82;
            }
            CFMutableDictionaryRef v35 = *a5;
          }
          v44 = (__CFString *)v35;
          LogPrintF();
        }
        else
        {
          CFRelease(v35);
        }
LABEL_82:
        int v36 = gLogCategory_AirPlayReceiverKit;
LABEL_83:
        if (v36 <= 50 && (v36 != -1 || _LogCategory_Initialize()))
        {
          v44 = (__CFString *)v58;
          uint64_t v46 = Int64;
          LogPrintF();
        }
        uint64_t v38 = CFDictionaryGetInt64();
        int v39 = v38 != 0;
        if (*(unsigned __int8 *)(v7 + 96) != v39)
        {
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterPostNotification();
          *(unsigned char *)(v7 + 96) = v39;
        }
        objc_msgSend(*(id *)(v7 + 48), "processStartVideoPlaybackRequestWithWithSessionID:version:", *(unsigned int *)(v7 + 80), 1, v44, v46, v47);
        goto LABEL_90;
      }
    }
    APSLogErrorAt();
    int v37 = -6700;
LABEL_108:
    *((_DWORD *)v60 + 6) = v37;
  }
LABEL_90:
  if (*((_DWORD *)v60 + 6)
    && gLogCategory_AirPlayReceiverKit <= 60
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v40 = *((unsigned int *)v60 + 6);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v59, 8);
  return v40;
}

void sub_23D4F2CD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_stopVideoPlaybackV1(uint64_t a1, __CFString *a2)
{
  uint64_t v13 = 0;
  CFArrayRef v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = "\n";
    if (!a2) {
      uint64_t v4 = " ";
    }
    BOOL v5 = @"<<no params>>";
    if (a2) {
      BOOL v5 = a2;
    }
    uint64_t v10 = (uint64_t)v4;
    id v11 = v5;
    LogPrintF();
  }
  if (a2)
  {
    CFDictionaryGetInt64();
    uint64_t Int64 = CFDictionaryGetInt64();
  }
  else
  {
    uint64_t Int64 = 0;
  }
  if (Int64 == *(_DWORD *)(DerivedStorage + 80))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterPostNotification();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = (uint64_t)a2;
      LogPrintF();
    }
    if (*(void *)(DerivedStorage + 104))
    {
      uint64_t v7 = *(NSObject **)(DerivedStorage + 112);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __uiController_stopVideoPlaybackV1_block_invoke;
      block[3] = &unk_264EA21F8;
      void block[4] = &v13;
      void block[5] = DerivedStorage;
      void block[6] = a2;
      dispatch_sync(v7, block);
      if (*((_DWORD *)v14 + 6))
      {
        APSLogErrorAt();
      }
      else
      {
        if (*(unsigned char *)(DerivedStorage + 96))
        {
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterPostNotification();
          *(unsigned char *)(DerivedStorage + 96) = 0;
        }
        if (gLogCategory_AirPlayReceiverKit <= 50
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          uint64_t v10 = Int64;
          id v11 = *(__CFString **)(DerivedStorage + 72);
          LogPrintF();
        }
        objc_msgSend(*(id *)(DerivedStorage + 48), "processStopVideoPlaybackRequestWithSessionID:", *(unsigned int *)(DerivedStorage + 80), v10, v11);
        *(void *)(DerivedStorage + 72) = 0;
        *(_DWORD *)(DerivedStorage + 80) = 0;
        *(unsigned char *)(DerivedStorage + 84) = 0;
      }
    }
    else
    {
      *((_DWORD *)v14 + 6) = -6762;
      APSLogErrorAt();
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *((_DWORD *)v14 + 6) = 0;
  }
  uint64_t v8 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

void sub_23D4F3080(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_controlVideoPlaybackV1(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = 0;
  CFURLRef v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(void *)(DerivedStorage + 104))
  {
    uint64_t v8 = *(NSObject **)(DerivedStorage + 112);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __uiController_controlVideoPlaybackV1_block_invoke;
    block[3] = &unk_264EA2288;
    void block[6] = DerivedStorage;
    void block[7] = a2;
    void block[8] = a3;
    void block[4] = &v16;
    void block[5] = &v12;
    dispatch_sync(v8, block);
    if (!*((_DWORD *)v17 + 6))
    {
      *a4 = v13[3];
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  else
  {
    *((_DWORD *)v17 + 6) = -6762;
    APSLogErrorAt();
  }
  uint64_t v9 = *((unsigned int *)v17 + 6);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void sub_23D4F3298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_copyPropertyForQualifier(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = 0;
  CFURLRef v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(DerivedStorage + 104))
  {
    uint64_t v8 = *(NSObject **)(DerivedStorage + 112);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __uiController_copyPropertyForQualifier_block_invoke;
    block[3] = &unk_264EA2288;
    void block[6] = DerivedStorage;
    void block[7] = a2;
    void block[8] = a3;
    void block[4] = &v16;
    void block[5] = &v12;
    dispatch_sync(v8, block);
    uint64_t v9 = *((unsigned int *)v17 + 6);
    if (!v9) {
      *a4 = v13[3];
    }
  }
  else
  {
    *((_DWORD *)v17 + 6) = -6762;
    APSLogErrorAt();
    uint64_t v9 = *((unsigned int *)v17 + 6);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void sub_23D4F33F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_setPropertyWithQualifier(uint64_t a1, const __CFString *a2, uint64_t a3, const void *a4)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, @"rate"))
  {
    CFGetDouble();
    *(float *)&double v9 = v9;
    if (*(float *)&v9 == 1.0 && *(void *)(DerivedStorage + 88))
    {
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFTypeRef cf = 0;
      int Formatted = CFPropertyListCreateFormatted();
      *((_DWORD *)v18 + 6) = Formatted;
      if (Formatted) {
        goto LABEL_29;
      }
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
      if (cf) {
        CFRelease(cf);
      }
    }
LABEL_21:
    if (*(void *)(DerivedStorage + 104))
    {
      uint64_t v11 = *(NSObject **)(DerivedStorage + 112);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __uiController_setPropertyWithQualifier_block_invoke;
      block[3] = &unk_264EA22B0;
      void block[4] = &v17;
      void block[5] = DerivedStorage;
      void block[6] = a2;
      void block[7] = a3;
      void block[8] = a4;
      dispatch_sync(v11, block);
    }
    else
    {
      *((_DWORD *)v18 + 6) = -6762;
      APSLogErrorAt();
    }
    goto LABEL_23;
  }
  if (CFStringCompare(a2, @"audioMode", 0)) {
    goto LABEL_21;
  }
  if (*(_DWORD *)(DerivedStorage + 80))
  {
    uint64_t v8 = *(const void **)(DerivedStorage + 88);
    if (a4) {
      CFRetain(a4);
    }
    *(void *)(DerivedStorage + 88) = a4;
    if (v8)
    {
      CFRelease(v8);
      a4 = *(const void **)(DerivedStorage + 88);
    }
    if (a4)
    {
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFTypeRef cf = 0;
      int v14 = CFPropertyListCreateFormatted();
      *((_DWORD *)v18 + 6) = v14;
      if (!v14)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
        if (cf) {
          CFRelease(cf);
        }
        goto LABEL_23;
      }
LABEL_29:
      APSLogErrorAt();
    }
  }
LABEL_23:
  uint64_t v12 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v12;
}

void sub_23D4F3760(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_startAudioSession()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t Int64 = CFDictionaryGetInt64();
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(DerivedStorage + 48) processStartAudioSessionRequestWithSessionID:CFDictionaryGetInt64() isScreenAudio:Int64 != 0];
  return 0;
}

uint64_t uiController_stopAudioSession()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(DerivedStorage + 48) processStopAudioSessionRequestWithSessionID:CFDictionaryGetInt64()];
  return 0;
}

uint64_t uiController_isAllowedToProceed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = a1;
    LogPrintF();
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", a2, v10);
  uint64_t v7 = +[APRKStreamRenderingManager sharedInstance];
  uint64_t v8 = [v7 isAllowedToProceedForClientWithName:v6 clientID:a3];

  return v8;
}

uint64_t uiController_handleSenderUIEventsChannelIncomingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(DerivedStorage + 48) processSenderUIEvent:a2];
  return 0;
}

uint64_t __uiController_startVideoPlaybackV1_block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[5] + 104) airplayUIStopVideo:a1[6]];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void __uiController_startVideoPlaybackV1_block_invoke_2(void *a1)
{
  uint64_t v2 = a1[7];
  uint64_t v3 = *(void **)(a1[6] + 104);
  id v7 = 0;
  int v4 = [v3 airplayUIStartVideo:v2 outputParams:&v7];
  id v5 = v7;
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v4;
  *(void *)(*(void *)(a1[5] + 8) + 24) = v5;
  uint64_t v6 = *(const void **)(*(void *)(a1[5] + 8) + 24);
  if (v6) {
    CFRetain(v6);
  }
}

uint64_t __uiController_stopVideoPlaybackV1_block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[5] + 104) airplayUIStopVideo:a1[6]];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void __uiController_controlVideoPlaybackV1_block_invoke(void *a1)
{
  uint64_t v2 = a1[7];
  uint64_t v3 = *(void **)(a1[6] + 104);
  uint64_t v4 = a1[8];
  id v8 = 0;
  int v5 = [v3 airplayUIPerform:v2 inputParams:v4 outputParams:&v8];
  id v6 = v8;
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v5;
  *(void *)(*(void *)(a1[5] + 8) + 24) = v6;
  id v7 = *(const void **)(*(void *)(a1[5] + 8) + 24);
  if (v7) {
    CFRetain(v7);
  }
}

uint64_t __uiController_copyPropertyForQualifier_block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[6] + 104) airplayUIGetProperty:a1[7] qualifier:a1[8] error:*(void *)(a1[4] + 8) + 24];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v2;
  CFTypeRef v3 = *(CFTypeRef *)(*(void *)(a1[5] + 8) + 24);
  if (v3)
  {
    uint64_t v5 = v2;
    CFTypeRef v3 = CFRetain(v3);
    uint64_t v2 = v5;
  }
  return MEMORY[0x270F9A758](v3, v2);
}

uint64_t __uiController_setPropertyWithQualifier_block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[5] + 104) airplayUISetProperty:a1[6] qualifier:a1[7] value:a1[8]];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void uiController_relayCommonParams(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFStringRef Value = CFDictionaryGetValue(a1, @"sessionID");
  if (Value) {
    CFDictionarySetValue(a2, @"sessionID", Value);
  }
  uint64_t v5 = (const void *)*MEMORY[0x263F01258];
  id v6 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F01258]);
  if (v6)
  {
    CFDictionarySetValue(a2, v5, v6);
  }
}

void __uiController_handleDateRangeEventV1_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  CFTypeRef v3 = (const void *)[v4 propertyList];
  if (v3)
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 90 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t APReceiverFairPlayHelperCopyAuthorizeItemResponseIntoDictionary()
{
  return MEMORY[0x270F0BA50]();
}

uint64_t APReceiverFairPlayHelperCreate()
{
  return MEMORY[0x270F0BA58]();
}

uint64_t APReceiverFairPlayHelperProcessFPInfo()
{
  return MEMORY[0x270F0BA60]();
}

uint64_t APReceiverFairPlayHelperRemoveAllFPSessions()
{
  return MEMORY[0x270F0BA68]();
}

uint64_t APReceiverStatsCollectorGetTypeID()
{
  return MEMORY[0x270F0BA70]();
}

uint64_t APReceiverStatsCollectorSetHUDOptions()
{
  return MEMORY[0x270F0BA78]();
}

uint64_t APReceiverUIControllerGetClassID()
{
  return MEMORY[0x270F0BA80]();
}

uint64_t APSFeaturesCreateMutable()
{
  return MEMORY[0x270F0BCA8]();
}

uint64_t APSFeaturesSetFeature()
{
  return MEMORY[0x270F0BCD0]();
}

uint64_t APSGetAccessControlConfig()
{
  return MEMORY[0x270F0BCE0]();
}

uint64_t APSGetMaxSizePreservingAspectRatio()
{
  return MEMORY[0x270F0BD10]();
}

uint64_t APSGetP2PAllow()
{
  return MEMORY[0x270F0BD18]();
}

uint64_t APSIsVirtualMachine()
{
  return MEMORY[0x270F0BDC0]();
}

uint64_t APSLogErrorAt()
{
  return MEMORY[0x270F0BDC8]();
}

uint64_t APSNetworkAddressGetSocketAddr()
{
  return MEMORY[0x270F0BE08]();
}

uint64_t APSNetworkTimeMakeFromDictionary()
{
  return MEMORY[0x270F0BE68]();
}

uint64_t APSSettingsCopyValueEx()
{
  return MEMORY[0x270F0BF88]();
}

uint64_t APSSettingsGetInt64()
{
  return MEMORY[0x270F0BFA0]();
}

uint64_t APSSettingsGetIntWithDefault()
{
  return MEMORY[0x270F0BFB0]();
}

uint64_t APSSettingsRemoveValue()
{
  return MEMORY[0x270F0BFD0]();
}

uint64_t APSSettingsSetInt64()
{
  return MEMORY[0x270F0BFE0]();
}

uint64_t APSSettingsSetValue()
{
  return MEMORY[0x270F0BFE8]();
}

uint64_t APSSettingsSynchronize()
{
  return MEMORY[0x270F0BFF0]();
}

uint64_t APSSystemSupportsWiFiUDM()
{
  return MEMORY[0x270F0C038]();
}

uint64_t APSVersionUtilsGetShortVersionLength()
{
  return MEMORY[0x270F0C040]();
}

uint64_t AirPlayReceiverServerCopyProperty()
{
  return MEMORY[0x270F0BA90]();
}

uint64_t AirPlayReceiverServerCreate()
{
  return MEMORY[0x270F0BA98]();
}

uint64_t AirPlayReceiverServerGetDispatchQueue()
{
  return MEMORY[0x270F0BAA0]();
}

uint64_t AirPlayReceiverServerSetProperty()
{
  return MEMORY[0x270F0BAA8]();
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x270F23CA8]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x270F23CC0]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x270F23CC8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

uint64_t CFArrayApplyBlock()
{
  return MEMORY[0x270F23D08]();
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x270F23D58]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

uint64_t CFDictionarySetCString()
{
  return MEMORY[0x270F23D90]();
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x270F23DA8]();
}

uint64_t CFDictionarySetNumber()
{
  return MEMORY[0x270F23DB0]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

uint64_t CFGetDouble()
{
  return MEMORY[0x270F23DC0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

uint64_t CFHTTPCookieCreateWithProperties()
{
  return MEMORY[0x270EE2830]();
}

uint64_t CFHTTPCookieStorageCopyCookiesForURL()
{
  return MEMORY[0x270EE2838]();
}

uint64_t CFHTTPCookieStorageDeleteCookie()
{
  return MEMORY[0x270EE2840]();
}

uint64_t CFHTTPCookieStorageSetCookie()
{
  return MEMORY[0x270EE2848]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

uint64_t CFNumberCreateInt64()
{
  return MEMORY[0x270F23DE0]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

uint64_t CFObjectControlAsync()
{
  return MEMORY[0x270F23DF0]();
}

uint64_t CFObjectControlSync()
{
  return MEMORY[0x270F23E00]();
}

uint64_t CFObjectGetPropertyInt64Sync()
{
  return MEMORY[0x270F23E38]();
}

uint64_t CFObjectSetProperty()
{
  return MEMORY[0x270F23E40]();
}

uint64_t CFPropertyListCreateFormatted()
{
  return MEMORY[0x270F23EB8]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x270EE7340]((__n128)size, *(__n128 *)&size.height);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x270EE79D0]();
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x270EE7AA8](retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x270EE7AB8](retstr, hostTime);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x270EE7B80]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x270EE7B88]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x270EE7B90]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x270EE7BA0]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C68](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C88](sbuf, createIfNecessary);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

uint64_t CMTimebaseCreateReadOnlyTimebase()
{
  return MEMORY[0x270EE7F28]();
}

OSStatus CMTimebaseCreateWithSourceClock(CFAllocatorRef allocator, CMClockRef sourceClock, CMTimebaseRef *timebaseOut)
{
  return MEMORY[0x270EE7F30](allocator, sourceClock, timebaseOut);
}

OSStatus CMTimebaseSetRate(CMTimebaseRef timebase, Float64 rate)
{
  return MEMORY[0x270EE7F70](timebase, rate);
}

OSStatus CMTimebaseSetTime(CMTimebaseRef timebase, CMTime *time)
{
  return MEMORY[0x270EE7F90](timebase, time);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x270F23F40]();
}

uint64_t FigAssetWriterCreateWithURL()
{
  return MEMORY[0x270EF5CA0]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x270EE8030]();
}

uint64_t FigCFDictionaryGetCMTimeIfPresent()
{
  return MEMORY[0x270EE8048]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x270EE8068]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x270EE8118]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x270EE8120]();
}

uint64_t FigValeriaGetClassID()
{
  return MEMORY[0x270EF5D90]();
}

uint64_t FigVideoQueueCreate()
{
  return MEMORY[0x270EF5DA0]();
}

uint64_t FigVideoQueueGetCMBaseObject()
{
  return MEMORY[0x270EF5DA8]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t LogControl()
{
  return MEMORY[0x270F243E0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x270F244B0]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F05600](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05628](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x270F05630](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05640](target, runLoop, runLoopMode);
}

uint64_t SockAddrToString()
{
  return MEMORY[0x270F246E8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x270F24740]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFHTTPCookieStorageGetDefault()
{
  return MEMORY[0x270EE29C0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t strcmp_prefix()
{
  return MEMORY[0x270F248D8]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}