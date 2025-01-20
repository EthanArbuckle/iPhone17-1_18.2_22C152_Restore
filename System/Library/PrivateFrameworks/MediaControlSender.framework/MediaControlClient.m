@interface MediaControlClient
- (MediaControlClient)init;
- (void)dealloc;
- (void)ensureConnected;
- (void)ensureDisconnected;
- (void)getProperty:(id)a3 qualifier:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (void)getSlideshowFeaturesWithOptions:(unsigned int)a3 completionQueue:(id)a4 completionBlock:(id)a5;
- (void)getSlideshowInfoWithOptions:(unsigned int)a3 completionQueue:(id)a4 completionBlock:(id)a5;
- (void)invalidate;
- (void)performRemoteAction:(id)a3 withParams:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (void)sendPhotoData:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5;
- (void)sendPhotoData:(id)a3 options:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (void)setEventHandlerQueue:(id)a3 eventHandlerBlock:(id)a4;
- (void)setHost:(id)a3;
- (void)setPassword:(id)a3;
- (void)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 completionQueue:(id)a6 completionBlock:(id)a7;
- (void)setSlideshowInfo:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5;
- (void)startPresentation:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5;
@end

@implementation MediaControlClient

- (void)setSlideshowInfo:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke;
  v10[3] = &unk_2647086B8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  dispatch_async(queue, v10);
}

void __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  v3 = (void **)(v2 + 279600);
  if (!*(void *)(v2 + 844680) || !*(void *)(v2 + 844688))
  {
    APSLogErrorAt();
    CFDataRef v18 = 0;
    int v10 = 0;
    CFDataRef Data = 0;
    int v14 = -6745;
    goto LABEL_16;
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 40);
  int v5 = MediaControlClient_EnsureConnected(*(void *)(*(void *)(a1 + 32) + 16));
  if (v5)
  {
    int v14 = v5;
LABEL_39:
    APSLogErrorAt();
    CFDataRef v18 = 0;
    int v10 = 0;
    goto LABEL_15;
  }
  int v6 = _MediaControlClient_EnsureReverseConnected(v2, (unsigned char *)(v2 + 563288));
  if (v6)
  {
    int v14 = v6;
    goto LABEL_39;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, @"state");
  if (Value
    && (CFStringRef v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID())
    && CFEqual(v8, @"playing"))
  {
    if (*(double *)(v2 + 844720) == 0.0)
    {
      *(CFAbsoluteTime *)(v2 + 844720) = CFAbsoluteTimeGetCurrent();
      UUIDGet();
      *(void *)(v2 + 844740) = 0;
      *(void *)(v2 + 844732) = 0;
      *(_DWORD *)(v2 + 844748) = 0;
      if (gLogCategory_MediaControlClientCore <= 50
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    _MediaControlClient_EnsureMirroringSuspended(v2);
    int v10 = 1;
  }
  else
  {
    _MediaControlClient_LogSlideshowEnded(v2);
    _MediaControlClient_EnsureMirroringResumed(v2);
    int v10 = 0;
  }
  CFDataRef Data = CFPropertyListCreateData(0, v4, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    HTTPHeader_InitRequest();
    HTTPHeader_SetField();
    BytePtr = (const char *)CFDataGetBytePtr(Data);
    CFIndex Length = CFDataGetLength(Data);
    int v14 = _MediaControlClient_DoTransaction(0x32u, (void *)v2, v2 + 416, BytePtr, Length);
    CFRelease(Data);
    if (v14)
    {
      CFDataRef v18 = 0;
      goto LABEL_15;
    }
    CFDataRef v15 = CFDataCreate(0, *(const UInt8 **)(v2 + 279608), *(void *)(v2 + 279616));
    if (v15)
    {
      CFDataRef v16 = v15;
      CFDataRef Data = (const __CFData *)CFPropertyListCreateWithData(0, v15, 0, 0, 0);
      CFRelease(v16);
      if (Data)
      {
        CFTypeID v17 = CFGetTypeID(Data);
        if (v17 == CFDictionaryGetTypeID())
        {
          int v14 = 0;
          CFDataRef v18 = Data;
LABEL_15:
          CFDataRef Data = 0;
          goto LABEL_16;
        }
        APSLogErrorAt();
        CFDataRef v18 = 0;
        int v14 = -6756;
      }
      else
      {
        APSLogErrorAt();
        CFDataRef v18 = 0;
        int v14 = -6717;
      }
    }
    else
    {
      APSLogErrorAt();
      CFDataRef v18 = 0;
      CFDataRef Data = 0;
      int v14 = -6728;
    }
  }
  else
  {
    APSLogErrorAt();
    CFDataRef v18 = 0;
    int v14 = -6700;
  }
LABEL_16:
  if (*v3)
  {
    free(*v3);
    *v3 = 0;
  }
  if (Data) {
    CFRelease(Data);
  }
  if (v14)
  {
    if (v10) {
      _MediaControlClient_EnsureMirroringResumed(v2);
    }
    if (gLogCategory_MediaControlClientCore <= 60
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v19 = *(NSObject **)(a1 + 48);
  if (v19)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_264708690;
    int v22 = v14;
    uint64_t v20 = *(void *)(a1 + 56);
    block[4] = v18;
    block[5] = v20;
    dispatch_async(v19, block);

    dispatch_release(*(dispatch_object_t *)(a1 + 48));
  }
}

void __71__MediaControlClient_setSlideshowInfo_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v3 = [v2 initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 48) userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSlideshowInfoWithOptions:(unsigned int)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_264708668;
  block[4] = self;
  block[5] = a4;
  void block[6] = a5;
  dispatch_async(queue, block);
}

void __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = (void **)(v2 + 279600);
  int v4 = MediaControlClient_EnsureConnected(v2);
  if (v4)
  {
    int v10 = v4;
    APSLogErrorAt();
LABEL_22:
    v11 = 0;
    goto LABEL_7;
  }
  HTTPHeader_InitRequest();
  int v5 = _MediaControlClient_DoTransaction(0x32u, (void *)v2, v2 + 416, 0, 0);
  if (v5)
  {
    int v10 = v5;
    goto LABEL_22;
  }
  CFDataRef v6 = CFDataCreate(0, *(const UInt8 **)(v2 + 279608), *(void *)(v2 + 279616));
  if (v6)
  {
    CFDataRef v7 = v6;
    CFPropertyListRef v8 = CFPropertyListCreateWithData(0, v6, 0, 0, 0);
    CFRelease(v7);
    if (v8)
    {
      CFTypeID v9 = CFGetTypeID(v8);
      if (v9 == CFDictionaryGetTypeID())
      {
        int v10 = 0;
        v11 = (void *)v8;
LABEL_7:
        CFPropertyListRef v8 = 0;
        goto LABEL_8;
      }
      APSLogErrorAt();
      v11 = 0;
      int v10 = -6756;
    }
    else
    {
      APSLogErrorAt();
      v11 = 0;
      int v10 = -6717;
    }
  }
  else
  {
    APSLogErrorAt();
    v11 = 0;
    CFPropertyListRef v8 = 0;
    int v10 = -6728;
  }
LABEL_8:
  if (*v3)
  {
    free(*v3);
    *uint64_t v3 = 0;
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v10
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = *(NSObject **)(a1 + 40);
  if (v12)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_264708690;
    int v15 = v10;
    uint64_t v13 = *(void *)(a1 + 48);
    block[4] = v11;
    block[5] = v13;
    dispatch_async(v12, block);

    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

void __82__MediaControlClient_getSlideshowInfoWithOptions_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v3 = [v2 initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 48) userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSlideshowFeaturesWithOptions:(unsigned int)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke;
  v10[3] = &unk_264708758;
  unsigned int v11 = a3;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a5;
  dispatch_async(queue, v10);
}

void __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 56) & 1) != 0
    || (id v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "preferredLocalizations"),
        ![v2 count]))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = (unsigned char *)objc_msgSend((id)objc_msgSend(v2, "objectAtIndex:", 0), "UTF8String");
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  int v5 = (void **)(v4 + 279600);
  int v6 = MediaControlClient_EnsureConnected(v4);
  if (v6)
  {
    int v12 = v6;
    APSLogErrorAt();
LABEL_29:
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  HTTPHeader_InitRequest();
  if (v3 && *v3) {
    HTTPHeader_SetField();
  }
  int v7 = _MediaControlClient_DoTransaction(0x32u, (void *)v4, v4 + 416, 0, 0);
  if (v7)
  {
    int v12 = v7;
    goto LABEL_29;
  }
  CFDataRef v8 = CFDataCreate(0, *(const UInt8 **)(v4 + 279608), *(void *)(v4 + 279616));
  if (v8)
  {
    CFDataRef v9 = v8;
    CFPropertyListRef v10 = CFPropertyListCreateWithData(0, v8, 0, 0, 0);
    CFRelease(v9);
    if (v10)
    {
      CFTypeID v11 = CFGetTypeID(v10);
      if (v11 == CFDictionaryGetTypeID())
      {
        int v12 = 0;
        uint64_t v13 = (void *)v10;
LABEL_14:
        CFPropertyListRef v10 = 0;
        goto LABEL_15;
      }
      APSLogErrorAt();
      uint64_t v13 = 0;
      int v12 = -6756;
    }
    else
    {
      APSLogErrorAt();
      uint64_t v13 = 0;
      int v12 = -6717;
    }
  }
  else
  {
    APSLogErrorAt();
    uint64_t v13 = 0;
    CFPropertyListRef v10 = 0;
    int v12 = -6728;
  }
LABEL_15:
  if (*v5)
  {
    free(*v5);
    *int v5 = 0;
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v12
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v14 = *(NSObject **)(a1 + 40);
  if (v14)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_264708690;
    int v17 = v12;
    uint64_t v15 = *(void *)(a1 + 48);
    block[4] = v13;
    block[5] = v15;
    dispatch_async(v14, block);

    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

void __86__MediaControlClient_getSlideshowFeaturesWithOptions_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v3 = [v2 initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 48) userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 completionQueue:(id)a6 completionBlock:(id)a7
{
  if (a6) {
    dispatch_retain((dispatch_object_t)a6);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke;
  v14[3] = &unk_264708730;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[8] = a6;
  v14[9] = a7;
  dispatch_async(queue, v14);
}

void __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  int v2 = MediaControlClient_SetProperty(*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(NSObject **)(a1 + 64);
  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke_2;
    v4[3] = &unk_2647086E0;
    int v5 = v2;
    v4[4] = *(void *)(a1 + 72);
    dispatch_async(v3, v4);
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }
}

void __82__MediaControlClient_setProperty_qualifier_value_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v3 = [v2 initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 40) userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getProperty:(id)a3 qualifier:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  dispatch_retain((dispatch_object_t)a5);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_264708640;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

void __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  int v6 = 0;
  uint64_t v2 = MediaControlClient_CopyProperty(*(void *)(*(void *)(a1 + 32) + 16), *(const void **)(a1 + 40), *(void *)(a1 + 48), &v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke_2;
  block[3] = &unk_264708708;
  int v5 = v6;
  uint64_t v3 = *(NSObject **)(a1 + 56);
  block[4] = *(void *)(a1 + 64);
  block[5] = v2;
  dispatch_async(v3, block);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

void __76__MediaControlClient_getProperty_qualifier_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v3 = (void *)[v2 initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 48) userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  id v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)sendPhotoData:(id)a3 options:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  if (a5) {
    dispatch_retain((dispatch_object_t)a5);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_264708640;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

void __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = (void **)(v2 + 279600);
  id v4 = (const char *)[*(id *)(a1 + 40) bytes];
  unint64_t v5 = [*(id *)(v1 + 40) length];
  CFDictionaryRef v6 = *(const __CFDictionary **)(v1 + 48);
  int v7 = MediaControlClient_EnsureConnected(v2);
  CFDataRef v8 = &unk_2680B7000;
  if (*(double *)(v2 + 563256) == 0.0)
  {
    *(CFAbsoluteTime *)(v2 + 563256) = CFAbsoluteTimeGetCurrent();
    UUIDGet();
    *(void *)(v2 + 563276) = 0;
    *(void *)(v2 + 563268) = 0;
    *(_DWORD *)(v2 + 563284) = 0;
    if (gLogCategory_MediaControlClientCore <= 50
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!v7)
  {
    _MediaControlClient_EnsureMirroringSuspended(v2);
    HTTPHeader_InitRequest();
    uint64_t v26 = v1;
    if (!v6)
    {
      BOOL v12 = 1;
      goto LABEL_21;
    }
    CFStringRef Value = CFDictionaryGetValue(v6, @"assetAction");
    if (!Value)
    {
      BOOL v12 = 1;
LABEL_13:
      uint64_t v13 = CFDictionaryGetValue(v6, @"assetKey");
      if (v13)
      {
        int v14 = v3;
        CFTypeID v15 = CFGetTypeID(v13);
        if (v15 != CFStringGetTypeID())
        {
          APSLogErrorAt();
          if (gLogCategory_MediaControlClientCore <= 90
            && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          int v7 = -6705;
          uint64_t v3 = v14;
          CFDataRef v8 = (_DWORD *)&unk_2680B7000;
          goto LABEL_35;
        }
        HTTPHeader_SetField();
        uint64_t v3 = v14;
        CFDataRef v8 = &unk_2680B7000;
      }
      if (*(unsigned char *)(v2 + 281780)) {
        HTTPHeader_SetField();
      }
      CFDataRef v16 = CFDictionaryGetValue(v6, @"Transition");
      if (v16)
      {
        CFTypeID v17 = CFGetTypeID(v16);
        if (v17 != CFStringGetTypeID())
        {
          APSLogErrorAt();
          if (gLogCategory_MediaControlClientCore <= 90
            && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          int v7 = -6705;
          goto LABEL_35;
        }
        HTTPHeader_SetField();
      }
LABEL_21:
      double Current = CFAbsoluteTimeGetCurrent();
      int v19 = _MediaControlClient_DoTransaction(0x32u, (void *)v2, v2 + 416, v4, v5);
      if (v19)
      {
        int v7 = v19;
      }
      else
      {
        double v20 = CFAbsoluteTimeGetCurrent();
        if (v12)
        {
          if (v5 && (double v21 = v20 - Current, v21 > 0.0))
          {
            unsigned int v22 = vcvtd_n_u64_f64((double)v5 / v21, 3uLL);
            int v23 = *(_DWORD *)(v2 + 563268);
            if (v23)
            {
              uint64_t v1 = v26;
              if (v5 < *(unsigned int *)(v2 + 563272)) {
                *(_DWORD *)(v2 + 563272) = v5;
              }
              if (v5 > *(unsigned int *)(v2 + 563276)) {
                *(_DWORD *)(v2 + 563276) = v5;
              }
              if (*(_DWORD *)(v2 + 563280) > v22) {
                *(_DWORD *)(v2 + 563280) = v22;
              }
              if (*(_DWORD *)(v2 + 563284) < v22) {
                *(_DWORD *)(v2 + 563284) = v22;
              }
              goto LABEL_39;
            }
            *(_DWORD *)(v2 + 563272) = v5;
            *(_DWORD *)(v2 + 563276) = v5;
            *(_DWORD *)(v2 + 563280) = v22;
            *(_DWORD *)(v2 + 563284) = v22;
          }
          else
          {
            int v23 = *(_DWORD *)(v2 + 563268);
          }
          uint64_t v1 = v26;
LABEL_39:
          int v7 = 0;
          *(_DWORD *)(v2 + 563268) = v23 + 1;
          goto LABEL_40;
        }
        int v7 = 0;
      }
LABEL_35:
      uint64_t v1 = v26;
      goto LABEL_40;
    }
    CFPropertyListRef v10 = Value;
    CFTypeID v11 = CFGetTypeID(Value);
    if (v11 == CFStringGetTypeID())
    {
      BOOL v12 = CFEqual(v10, @"displayCached") == 0;
      HTTPHeader_SetField();
      uint64_t v3 = (void **)(v2 + 279600);
      goto LABEL_13;
    }
    APSLogErrorAt();
    if (gLogCategory_MediaControlClientCore <= 90
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = -6705;
    uint64_t v3 = (void **)(v2 + 279600);
  }
LABEL_40:
  if (*v3)
  {
    free(*v3);
    *uint64_t v3 = 0;
  }
  if (v7)
  {
    int v24 = v8[834];
    if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  v25 = *(NSObject **)(v1 + 56);
  if (v25)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_2647086E0;
    int v28 = v7;
    block[4] = *(void *)(v1 + 64);
    dispatch_async(v25, block);
    dispatch_release(*(dispatch_object_t *)(v1 + 56));
  }
}

void __76__MediaControlClient_sendPhotoData_options_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v3 = [v2 initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 40) userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendPhotoData:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
}

- (void)startPresentation:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke;
  v10[3] = &unk_2647086B8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  void v10[7] = a5;
  dispatch_async(queue, v10);
}

void __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke(void *a1)
{
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)a1[5];
  uint64_t v3 = *(void *)(a1[4] + 16);
  id v4 = (void **)(v3 + 279600);
  int v5 = MediaControlClient_EnsureConnected(v3);
  if (v5)
  {
    int v9 = v5;
    APSLogErrorAt();
    CFMutableDictionaryRef Mutable = 0;
    CFMutableDictionaryRef v6 = 0;
    goto LABEL_12;
  }
  if (Mutable)
  {
    CFMutableDictionaryRef v6 = 0;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFMutableDictionaryRef v6 = Mutable;
    if (!Mutable)
    {
      APSLogErrorAt();
      goto LABEL_35;
    }
  }
  CFMutableDictionaryRef Mutable = CFPropertyListCreateData(0, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Mutable)
  {
    APSLogErrorAt();
    BOOL v12 = 0;
    int v9 = -6700;
    goto LABEL_13;
  }
  HTTPHeader_InitRequest();
  HTTPHeader_SetField();
  BytePtr = (const char *)CFDataGetBytePtr(Mutable);
  CFIndex Length = CFDataGetLength(Mutable);
  int v9 = _MediaControlClient_DoTransaction(0x32u, (void *)v3, v3 + 416, BytePtr, Length);
  CFRelease(Mutable);
  if (v9)
  {
    CFMutableDictionaryRef Mutable = 0;
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  CFDataRef v10 = CFDataCreate(0, *(const UInt8 **)(v3 + 279608), *(void *)(v3 + 279616));
  if (!v10)
  {
    APSLogErrorAt();
    CFMutableDictionaryRef Mutable = 0;
LABEL_35:
    BOOL v12 = 0;
    int v9 = -6728;
    goto LABEL_13;
  }
  CFDataRef v11 = v10;
  BOOL v12 = (void *)CFPropertyListCreateWithData(0, v10, 0, 0, 0);
  CFRelease(v11);
  if (v12)
  {
    CFTypeID v13 = CFGetTypeID(v12);
    if (v13 == CFDictionaryGetTypeID())
    {
      int v9 = 0;
      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)v12;
      goto LABEL_12;
    }
    APSLogErrorAt();
    CFMutableDictionaryRef Mutable = 0;
    int v9 = -6756;
  }
  else
  {
    APSLogErrorAt();
    CFMutableDictionaryRef Mutable = 0;
    int v9 = -6717;
  }
LABEL_13:
  if (*v4)
  {
    free(*v4);
    *id v4 = 0;
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v9
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v14 = a1[6];
  if (v14)
  {
    uint64_t v15 = a1[7];
    if (!v15) {
      goto LABEL_27;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_264708690;
    int v17 = v9;
    block[4] = Mutable;
    void block[5] = v15;
    dispatch_async(v14, block);
    int v14 = a1[6];
    if (v14) {
LABEL_27:
    }
      dispatch_release(v14);
  }
}

void __72__MediaControlClient_startPresentation_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    id v2 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v3 = [v2 initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 48) userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setEventHandlerQueue:(id)a3 eventHandlerBlock:(id)a4
{
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__MediaControlClient_setEventHandlerQueue_eventHandlerBlock___block_invoke;
  block[3] = &unk_264708668;
  block[4] = a3;
  void block[5] = self;
  void block[6] = a4;
  dispatch_async(queue, block);
}

void __61__MediaControlClient_setEventHandlerQueue_eventHandlerBlock___block_invoke(void *a1)
{
  id v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = *(NSObject **)(v3 + 24);
  if (v2 != v4)
  {
    if (v2)
    {
      dispatch_retain(v2);
      uint64_t v3 = a1[5];
      id v4 = *(NSObject **)(v3 + 24);
    }
    if (v4)
    {
      dispatch_release(v4);
      uint64_t v3 = a1[5];
    }
    *(void *)(v3 + 24) = a1[4];
    id v2 = a1[4];
  }
  if (v2) {
    dispatch_release(v2);
  }
  int v5 = (void *)a1[6];
  if (v5 != *(void **)(a1[5] + 32))
  {
    id v6 = v5;

    *(void *)(a1[5] + 32) = a1[6];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    int v9 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 16) + 563216);
    BOOL v10 = v8 == 0;
    if (v8) {
      CFDataRef v11 = __eventHandler;
    }
    else {
      CFDataRef v11 = 0;
    }
    if (v10) {
      uint64_t v7 = 0;
    }
    *int v9 = v11;
    v9[1] = (void (*)(uint64_t, uint64_t, uint64_t))v7;
  }
}

- (void)performRemoteAction:(id)a3 withParams:(id)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  if (a5) {
    dispatch_retain((dispatch_object_t)a5);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke;
  block[3] = &unk_264708640;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async(queue, block);
}

void __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  int v9 = 0;
  uint64_t v8 = 0;
  int v2 = MediaControlClient_DoAction(*(void **)(*(void *)(a1 + 32) + 16), *(const void **)(a1 + 40), *(const void **)(a1 + 48), &v9, &v8);
  uint64_t v3 = *(NSObject **)(a1 + 56);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (!v4) {
      goto LABEL_4;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke_2;
    block[3] = &unk_264708618;
    int v6 = v2;
    int v7 = v9;
    block[4] = v4;
    void block[5] = v8;
    dispatch_async(v3, block);
    uint64_t v3 = *(NSObject **)(a1 + 56);
    if (v3) {
LABEL_4:
    }
      dispatch_release(v3);
  }
}

void __85__MediaControlClient_performRemoteAction_withParams_completionQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x263F08410];
  if (*(_DWORD *)(a1 + 48)) {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:*MEMORY[0x263F08410] code:*(int *)(a1 + 48) userInfo:0];
  }
  else {
    uint64_t v3 = 0;
  }
  if (*(_DWORD *)(a1 + 52)) {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:*v2 code:*(int *)(a1 + 52) userInfo:0];
  }
  else {
    uint64_t v4 = 0;
  }
  id v6 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v5 = *(const void **)(a1 + 40);
  if (v5) {
    CFRelease(v5);
  }
}

- (void)ensureDisconnected
{
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__MediaControlClient_ensureDisconnected__block_invoke;
    block[3] = &unk_2647085C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __40__MediaControlClient_ensureDisconnected__block_invoke(uint64_t a1)
{
  return MediaControlClient_EnsureDisconnected(*(void *)(*(void *)(a1 + 32) + 16));
}

- (void)ensureConnected
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__MediaControlClient_ensureConnected__block_invoke;
  block[3] = &unk_2647085C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__MediaControlClient_ensureConnected__block_invoke(uint64_t a1)
{
  return MediaControlClient_EnsureConnected(*(void *)(*(void *)(a1 + 32) + 16));
}

- (void)setPassword:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__MediaControlClient_setPassword___block_invoke;
  v4[3] = &unk_2647085F0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __34__MediaControlClient_setPassword___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) UTF8String];
  return ReplaceDifferentString();
}

- (void)setHost:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__MediaControlClient_setHost___block_invoke;
  v4[3] = &unk_2647085F0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __30__MediaControlClient_setHost___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) UTF8String];
  return ReplaceDifferentString();
}

- (void)invalidate
{
  client = self->_client;
  if (client)
  {
    MediaControlClient_Cancel((uint64_t)client);
    [(MediaControlClient *)self ensureDisconnected];
  }
  queue = self->_queue;
  if (queue)
  {
    if (self->_client)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __32__MediaControlClient_invalidate__block_invoke;
      block[3] = &unk_2647085C8;
      block[4] = self;
      dispatch_async(queue, block);
    }
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    if (v5)
    {
      id v6 = v5;
      dispatch_set_context((dispatch_object_t)self->_queue, v5);
      dispatch_set_finalizer_f((dispatch_object_t)self->_queue, (dispatch_function_t)__invalidateDone);
      dispatch_release((dispatch_object_t)self->_queue);
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v6);
      self->_queue = 0;
    }
  }
}

void __32__MediaControlClient_invalidate__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  CFRelease(self->_client);
  self->_client = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  eventHandlerQueue = self->_eventHandlerQueue;
  if (eventHandlerQueue)
  {
    dispatch_release(eventHandlerQueue);
    self->_eventHandlerQueue = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)MediaControlClient;
  [(MediaControlClient *)&v5 dealloc];
}

- (MediaControlClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlClient;
  id v2 = [(MediaControlClient *)&v6 init];
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create("MediaControlClient", 0), (*((void *)v2 + 1) = v3) != 0)
    && (CFAllocatorRef Default = CFAllocatorGetDefault(),
        !MediaControlClient_Create((uint64_t)Default, 0, (uint64_t *)v2 + 2)))
  {
    MediaControlClient_SetDispatchQueue(*((void *)v2 + 2), *((NSObject **)v2 + 1));
  }
  else
  {
    APSLogErrorAt();

    return 0;
  }
  return (MediaControlClient *)v2;
}

uint64_t ___MediaControlClient_PlaybackPaused_block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(*(void *)(a1 + 32) + 845068);
  if (result)
  {
    uint64_t result = IOPMAssertionRelease(result);
    *(_DWORD *)(*(void *)(a1 + 32) + 845068) = 0;
    if (gLogCategory_MediaControlClientCore <= 40)
    {
      if (gLogCategory_MediaControlClientCore != -1 || (uint64_t result = _LogCategory_Initialize(), result))
      {
        return LogPrintF();
      }
    }
  }
  return result;
}

@end