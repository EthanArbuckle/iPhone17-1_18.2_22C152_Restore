@interface BrowserNIDelegate
- (BrowserNIDelegate)initWithBrowser:(OpaqueAPBrowser *)a3;
- (void)dealloc;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
@end

@implementation BrowserNIDelegate

- (BrowserNIDelegate)initWithBrowser:(OpaqueAPBrowser *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BrowserNIDelegate;
  v3 = [(BrowserNIDelegate *)&v6 init];
  if (v3)
  {
    uint64_t v4 = FigCFWeakReferenceHolderCreateWithReferencedObject();
    v3->_browserWeak = (OpaqueFigCFWeakReferenceHolder *)v4;
    if (!v4)
    {
      APSLogErrorAt();

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  browserWeak = self->_browserWeak;
  if (browserWeak)
  {
    CFRelease(browserWeak);
    self->_browserWeak = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BrowserNIDelegate;
  [(BrowserNIDelegate *)&v4 dealloc];
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    int v6 = **(_DWORD **)CMBaseObjectGetDerivedStorage();
    if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = [a4 count];
      LogPrintF();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16, v22);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(a4);
          }
          v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
          uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
          key = 0;
          int v13 = **(_DWORD **)DerivedStorage;
          if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v23 = objc_msgSend(v11, "discoveryToken", v23, v24);
            v24 = v11;
            LogPrintF();
          }
          if (APSRotatingKeyMapperIsInitialized())
          {
            [v11 distance];
            float v15 = v14;
            getNINearbyObjectDistanceNotAvailable();
            if (v15 != v16)
            {
              if ([v11 deviceIdentifier])
              {
                if (APSRotatingKeyMapperSetDataForKey()) {
                  goto LABEL_30;
                }
                if (!key) {
                  goto LABEL_28;
                }
                CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 200), key);
                if (!Value)
                {
LABEL_30:
                  APSLogErrorAt();
                }
                else
                {
                  CFDictionaryRef v18 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"LastEventInfo");
                  if (v18)
                  {
                    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v18);
                    if (MutableCopy)
                    {
                      v20 = MutableCopy;
                      CFDictionarySetValue(MutableCopy, @"proximityData", v11);
                      if (browser_setEventInfoForDevice(v5, key, v20)) {
                        APSLogErrorAt();
                      }
                      CFRelease(v20);
                    }
                  }
                }
              }
            }
          }
          if (key) {
            CFRelease(key);
          }
LABEL_28:
          ++v10;
        }
        while (v8 != v10);
        uint64_t v21 = [a4 countByEnumeratingWithState:&v26 objects:v31 count:16];
        uint64_t v8 = v21;
      }
      while (v21);
    }
    CFRelease(v5);
  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v7)
  {
    uint64_t v8 = (const void *)v7;
    uint64_t DerivedStorage = (int **)CMBaseObjectGetDerivedStorage();
    int v10 = **DerivedStorage;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v18 = [a4 count];
      int64_t v20 = a5;
      LogPrintF();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18, v20);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(a4);
          }
          int v15 = **DerivedStorage;
          if (v15 <= 30)
          {
            float v16 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
            if (v15 != -1 || _LogCategory_Initialize())
            {
              uint64_t v19 = objc_msgSend(v16, "discoveryToken", v19, v21);
              uint64_t v21 = v16;
              LogPrintF();
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v17 = [a4 countByEnumeratingWithState:&v22 objects:v26 count:16];
        uint64_t v12 = v17;
      }
      while (v17);
    }
    CFRelease(v8);
  }
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    uint64_t DerivedStorage = (int **)CMBaseObjectGetDerivedStorage();
    NSErrorToOSStatus();
    int v7 = **DerivedStorage;
    if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFRelease(v5);
  }
}

@end