@interface FigCaptureSessionObservatory
+ (id)sharedObservatory;
+ (void)initialize;
- (FigCaptureSessionObservatory)init;
- (dispatch_queue_t)_postMovieRecordingUpdateNotification:(const void *)a3 forCaptureSession:;
- (id)osStatePropertyList;
- (uint64_t)_registerObserver:(uint64_t)result;
- (unint64_t)_isSessionRecordingMovie:(unint64_t)result;
- (void)_captureSessionDidReconfigureWhileRunning:(char)a3 containsVideoSource:(char)a4 containsStillImageSink:(char)a5 containsMovieFileSink:;
- (void)_resetFigAssetWriterRecordingsCountForCaptureSession:(uint64_t)a1;
- (void)_setFigAssetWriterRecording:(CFTypeRef)cf forCaptureSession:;
- (void)_setMovieFileOutputRecording:(uint64_t)a3 sectionID:(CFTypeRef)cf forCaptureSession:;
- (void)_setStatus:(long long *)a3 clientAuditToken:(char)a4 containsVideoSource:(char)a5 containsStillImageSink:(char)a6 containsMovieFileSink:(CFTypeRef)cf forCaptureSession:;
- (void)captureSessionWasCreated:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation FigCaptureSessionObservatory

void __57__FigCaptureSessionObservatory_captureSessionWasCreated___block_invoke(uint64_t a1)
{
  v2 = malloc_type_calloc(1uLL, 0x48uLL, 0x108004056F175C6uLL);
  NSMapInsert(*(NSMapTable **)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40), v2);
  v3 = *(const void **)(a1 + 40);
  CFRelease(v3);
}

uint64_t __49__FigCaptureSessionObservatory_registerObserver___block_invoke(uint64_t a1)
{
  return -[FigCaptureSessionObservatory _registerObserver:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_registerObserver:(uint64_t)result
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      uint64_t v25 = v2;
      LODWORD(v24) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(*(id *)(v4 + 16), "addObject:", a2, v24, v25);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v5 = *(void **)(v4 + 8);
    result = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v29;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(const void **)(*((void *)&v28 + 1) + 8 * v8);
          v10 = NSMapGet(*(NSMapTable **)(v4 + 8), v9);
          if (*(_DWORD *)v10 == 2)
          {
            v18 = [FigCaptureSessionProxy alloc];
            uint64_t v19 = v10[1];
            uint64_t v20 = *((unsigned __int8 *)v10 + 48);
            uint64_t v21 = *((unsigned __int8 *)v10 + 49);
            uint64_t v22 = *((unsigned __int8 *)v10 + 50);
            long long v23 = *((_OWORD *)v10 + 2);
            long long v26 = *((_OWORD *)v10 + 1);
            long long v27 = v23;
            v17 = [(FigCaptureSessionProxy *)v18 initWithFigCaptureSession:v9 identifier:v19 clientAuditToken:&v26 containsVideoSource:v20 containsStillImageSink:v21 containsMovieFileSink:v22];
            [a2 captureSessionDidStart:v17];
          }
          else
          {
            if (*(_DWORD *)v10 != 1) {
              goto LABEL_14;
            }
            v11 = [FigCaptureSessionProxy alloc];
            uint64_t v12 = v10[1];
            uint64_t v13 = *((unsigned __int8 *)v10 + 48);
            uint64_t v14 = *((unsigned __int8 *)v10 + 49);
            uint64_t v15 = *((unsigned __int8 *)v10 + 50);
            long long v16 = *((_OWORD *)v10 + 2);
            long long v26 = *((_OWORD *)v10 + 1);
            long long v27 = v16;
            v17 = [(FigCaptureSessionProxy *)v11 initWithFigCaptureSession:v9 identifier:v12 clientAuditToken:&v26 containsVideoSource:v13 containsStillImageSink:v14 containsMovieFileSink:v15];
            [a2 captureSessionWillStart:v17];
          }

LABEL_14:
          if (-[FigCaptureSessionObservatory _isSessionRecordingMovie:](v4, v9)) {
            -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:]((dispatch_queue_t *)v4, 1, v9);
          }
          ++v8;
        }
        while (v6 != v8);
        result = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (unint64_t)_isSessionRecordingMovie:(unint64_t)result
{
  if (result)
  {
    unint64_t v3 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 24));
    result = (unint64_t)NSMapGet(*(NSMapTable **)(v3 + 8), a2);
    if (result)
    {
      unint64_t v4 = result;
      return [*(id *)(result + 56) count] || *(void *)(v4 + 64) > 0;
    }
  }
  return result;
}

- (void)captureSessionWasCreated:(OpaqueFigCaptureSession *)a3
{
  if (a3)
  {
    CFRetain(a3);
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__FigCaptureSessionObservatory_captureSessionWasCreated___block_invoke;
    v6[3] = &unk_1E5C24F10;
    v6[4] = self;
    v6[5] = a3;
    fig_dispatch_async_autoreleasepool(queue, v6);
  }
}

+ (id)sharedObservatory
{
  if (sharedObservatory_once != -1) {
    dispatch_once(&sharedObservatory_once, &__block_literal_global_60);
  }
  return (id)sharedObservatory_sharedObservatory;
}

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__FigCaptureSessionObservatory_registerObserver___block_invoke;
    v4[3] = &unk_1E5C24458;
    v4[4] = self;
    v4[5] = a3;
    fig_dispatch_async_autoreleasepool(queue, v4);
  }
}

+ (void)initialize
{
}

FigCaptureSessionObservatory *__49__FigCaptureSessionObservatory_sharedObservatory__block_invoke()
{
  result = objc_alloc_init(FigCaptureSessionObservatory);
  sharedObservatory_sharedObservatory = (uint64_t)result;
  return result;
}

- (FigCaptureSessionObservatory)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionObservatory;
  uint64_t v2 = [(FigCaptureSessionObservatory *)&v4 init];
  if (v2)
  {
    v2->_captureSessionsStorage = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:259 capacity:1];
    v2->_registeredObservers = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.capturesessionobserver", 0);
    v2->_osStateHandle = [[FigCaptureOSStateHandle alloc] initWithTitle:@"FigCaptureSessionObservatory" queue:v2->_queue dataProvider:v2];
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
  }
  return v2;
}

- (void)dealloc
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionObservatory;
  [(FigCaptureSessionObservatory *)&v3 dealloc];
}

- (void)unregisterObserver:(id)a3
{
  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__FigCaptureSessionObservatory_unregisterObserver___block_invoke;
    v4[3] = &unk_1E5C24458;
    v4[4] = self;
    v4[5] = a3;
    fig_dispatch_async_autoreleasepool(queue, v4);
  }
}

uint64_t __51__FigCaptureSessionObservatory_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (dispatch_queue_t)_postMovieRecordingUpdateNotification:(const void *)a3 forCaptureSession:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v5 = result;
    dispatch_assert_queue_V2(result[3]);
    result = (dispatch_queue_t *)NSMapGet((NSMapTable *)v5[1], a3);
    if (result)
    {
      uint64_t v6 = result;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      dispatch_queue_t v7 = v5[2];
      result = (dispatch_queue_t *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (result)
      {
        uint64_t v8 = result;
        uint64_t v9 = *(void *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
            dispatch_queue_t v12 = v6[1];
            if (a2) {
              [v11 captureSessionDidStartMovieRecording:v12];
            }
            else {
              [v11 captureSessionDidFinishMovieRecording:v12];
            }
            v10 = (dispatch_queue_t *)((char *)v10 + 1);
          }
          while (v8 != v10);
          result = (dispatch_queue_t *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          uint64_t v8 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)_setStatus:(long long *)a3 clientAuditToken:(char)a4 containsVideoSource:(char)a5 containsStillImageSink:(char)a6 containsMovieFileSink:(CFTypeRef)cf forCaptureSession:
{
  if (a1)
  {
    CFRetain(cf);
    long long v14 = *(NSObject **)(a1 + 24);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    long long v15 = a3[1];
    long long v18 = *a3;
    v16[2] = __143__FigCaptureSessionObservatory__setStatus_clientAuditToken_containsVideoSource_containsStillImageSink_containsMovieFileSink_forCaptureSession___block_invoke;
    v16[3] = &unk_1E5C280C8;
    v16[4] = a1;
    v16[5] = cf;
    int v17 = a2;
    long long v19 = v15;
    char v20 = a4;
    char v21 = a5;
    char v22 = a6;
    fig_dispatch_async_autoreleasepool(v14, v16);
  }
}

void __143__FigCaptureSessionObservatory__setStatus_clientAuditToken_containsVideoSource_containsStillImageSink_containsMovieFileSink_forCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSMapGet(*(NSMapTable **)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  if (v2)
  {
    objc_super v3 = v2;
    if (*(_DWORD *)v2 != *(_DWORD *)(a1 + 48)
      || (long long v4 = v2[2],
          long long v57 = v2[1],
          long long v58 = v4,
          long long v5 = *(_OWORD *)(a1 + 68),
          v56[0] = *(_OWORD *)(a1 + 52),
          v56[1] = v5,
          !FigCaptureAuditTokenProcessesAreEqual(&v57, v56))
      || *((unsigned __int8 *)v3 + 48) != *(unsigned __int8 *)(a1 + 84)
      || *((unsigned __int8 *)v3 + 49) != *(unsigned __int8 *)(a1 + 85)
      || *((unsigned __int8 *)v3 + 50) != *(unsigned __int8 *)(a1 + 86))
    {
      *(_DWORD *)objc_super v3 = *(_DWORD *)(a1 + 48);
      long long v6 = *(_OWORD *)(a1 + 68);
      v3[1] = *(_OWORD *)(a1 + 52);
      v3[2] = v6;
      *((unsigned char *)v3 + 48) = *(unsigned char *)(a1 + 84);
      *((unsigned char *)v3 + 49) = *(unsigned char *)(a1 + 85);
      *((unsigned char *)v3 + 50) = *(unsigned char *)(a1 + 86);
      int v7 = *(_DWORD *)(a1 + 48);
      if (v7)
      {
        uint64_t v8 = v3 + 1;
        if (v7 == 2)
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v30 = *(void **)(*(void *)(a1 + 32) + 16);
          uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v60 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v49 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                v36 = [FigCaptureSessionProxy alloc];
                uint64_t v37 = *(void *)(a1 + 40);
                uint64_t v38 = *((void *)v3 + 1);
                uint64_t v39 = *((unsigned __int8 *)v3 + 48);
                uint64_t v40 = *((unsigned __int8 *)v3 + 49);
                uint64_t v41 = *((unsigned __int8 *)v3 + 50);
                long long v42 = v3[2];
                long long v57 = *v8;
                long long v58 = v42;
                v43 = [(FigCaptureSessionProxy *)v36 initWithFigCaptureSession:v37 identifier:v38 clientAuditToken:&v57 containsVideoSource:v39 containsStillImageSink:v40 containsMovieFileSink:v41];
                [v35 captureSessionDidStart:v43];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v48 objects:v60 count:16];
            }
            while (v32);
          }
        }
        else if (v7 == 1)
        {
          uint64_t v9 = *(void *)(a1 + 32);
          uint64_t v10 = *(void *)(v9 + 32) + 1;
          *(void *)(v9 + 32) = v10;
          *((void *)v3 + 1) = v10;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v11 = *(void **)(*(void *)(a1 + 32) + 16);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v53 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                int v17 = [FigCaptureSessionProxy alloc];
                uint64_t v18 = *(void *)(a1 + 40);
                uint64_t v19 = *((void *)v3 + 1);
                uint64_t v20 = *((unsigned __int8 *)v3 + 48);
                uint64_t v21 = *((unsigned __int8 *)v3 + 49);
                uint64_t v22 = *((unsigned __int8 *)v3 + 50);
                long long v23 = v3[2];
                long long v57 = *v8;
                long long v58 = v23;
                uint64_t v24 = [(FigCaptureSessionProxy *)v17 initWithFigCaptureSession:v18 identifier:v19 clientAuditToken:&v57 containsVideoSource:v20 containsStillImageSink:v21 containsMovieFileSink:v22];
                [v16 captureSessionWillStart:v24];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v61 count:16];
            }
            while (v13);
          }
        }
      }
      else
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v25 = *(void **)(*(void *)(a1 + 32) + 16);
        uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v59 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v45;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v45 != v28) {
                objc_enumerationMutation(v25);
              }
              [*(id *)(*((void *)&v44 + 1) + 8 * k) captureSessionDidStop:*((void *)v3 + 1)];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v59 count:16];
          }
          while (v27);
        }
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_captureSessionDidReconfigureWhileRunning:(char)a3 containsVideoSource:(char)a4 containsStillImageSink:(char)a5 containsMovieFileSink:
{
  if (a1)
  {
    CFRetain(cf);
    uint64_t v10 = *(NSObject **)(a1 + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __139__FigCaptureSessionObservatory__captureSessionDidReconfigureWhileRunning_containsVideoSource_containsStillImageSink_containsMovieFileSink___block_invoke;
    v11[3] = &unk_1E5C283F0;
    v11[4] = a1;
    v11[5] = cf;
    char v12 = a3;
    char v13 = a4;
    char v14 = a5;
    fig_dispatch_async_autoreleasepool(v10, v11);
  }
}

void __139__FigCaptureSessionObservatory__captureSessionDidReconfigureWhileRunning_containsVideoSource_containsStillImageSink_containsMovieFileSink___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSMapGet(*(NSMapTable **)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  if (v2)
  {
    objc_super v3 = v2;
    if (*(_DWORD *)v2 == 2)
    {
      int v4 = *(unsigned __int8 *)(a1 + 48);
      if (v2[48] != v4 || v2[49] != *(unsigned char *)(a1 + 49) || v2[50] != *(unsigned char *)(a1 + 50))
      {
        v2[48] = v4;
        v2[49] = *(unsigned char *)(a1 + 49);
        v2[50] = *(unsigned char *)(a1 + 50);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v5 = *(void **)(*(void *)(a1 + 32) + 16);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v21 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              v11 = [FigCaptureSessionProxy alloc];
              uint64_t v12 = *(void *)(a1 + 40);
              uint64_t v13 = *((void *)v3 + 1);
              uint64_t v14 = v3[48];
              uint64_t v15 = v3[49];
              uint64_t v16 = v3[50];
              long long v17 = *((_OWORD *)v3 + 2);
              v19[0] = *((_OWORD *)v3 + 1);
              v19[1] = v17;
              uint64_t v18 = [(FigCaptureSessionProxy *)v11 initWithFigCaptureSession:v12 identifier:v13 clientAuditToken:v19 containsVideoSource:v14 containsStillImageSink:v15 containsMovieFileSink:v16];
              [v10 captureSessionDidReconfigureWhileRunning:v18];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v7);
        }
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_setMovieFileOutputRecording:(uint64_t)a3 sectionID:(CFTypeRef)cf forCaptureSession:
{
  if (a1)
  {
    CFRetain(cf);
    uint64_t v8 = *(NSObject **)(a1 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__FigCaptureSessionObservatory__setMovieFileOutputRecording_sectionID_forCaptureSession___block_invoke;
    v9[3] = &unk_1E5C28418;
    v9[5] = a3;
    v9[6] = cf;
    char v10 = a2;
    v9[4] = a1;
    fig_dispatch_async_autoreleasepool(v8, v9);
  }
}

void __89__FigCaptureSessionObservatory__setMovieFileOutputRecording_sectionID_forCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSMapGet(*(NSMapTable **)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 48));
  if (v2)
  {
    objc_super v3 = v2;
    int v4 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(void *)(a1 + 32), *(const void **)(a1 + 48));
    id v5 = (id)*((void *)v3 + 7);
    if (*(unsigned char *)(a1 + 56))
    {
      if (!v5)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        *((void *)v3 + 7) = v5;
      }
      [v5 addObject:*(void *)(a1 + 40)];
    }
    else
    {
      [v5 removeObject:*(void *)(a1 + 40)];
      if (![*((id *)v3 + 7) count])
      {

        *((void *)v3 + 7) = 0;
      }
    }
    int v6 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(void *)(a1 + 32), *(const void **)(a1 + 48));
    if (v4 != v6) {
      -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:](*(dispatch_queue_t **)(a1 + 32), v6, *(const void **)(a1 + 48));
    }
  }
  uint64_t v7 = *(const void **)(a1 + 48);
  CFRelease(v7);
}

- (void)_setFigAssetWriterRecording:(CFTypeRef)cf forCaptureSession:
{
  if (a1)
  {
    CFRetain(cf);
    int v6 = *(NSObject **)(a1 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__FigCaptureSessionObservatory__setFigAssetWriterRecording_forCaptureSession___block_invoke;
    v7[3] = &unk_1E5C25F60;
    v7[4] = a1;
    v7[5] = cf;
    char v8 = a2;
    fig_dispatch_async_autoreleasepool(v6, v7);
  }
}

void __78__FigCaptureSessionObservatory__setFigAssetWriterRecording_forCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSMapGet(*(NSMapTable **)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  if (!v2) {
    goto LABEL_8;
  }
  objc_super v3 = v2;
  int v4 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(void *)(a1 + 32), *(const void **)(a1 + 40));
  uint64_t v5 = v3[8];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = v5 + 1;
LABEL_4:
    v3[8] = v6;
    goto LABEL_6;
  }
  v3[8] = v5 - 1;
  if (v5 <= 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v6 = 0;
    goto LABEL_4;
  }
LABEL_6:
  int v7 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(void *)(a1 + 32), *(const void **)(a1 + 40));
  if (v4 != v7) {
    -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:](*(dispatch_queue_t **)(a1 + 32), v7, *(const void **)(a1 + 40));
  }
LABEL_8:
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_resetFigAssetWriterRecordingsCountForCaptureSession:(uint64_t)a1
{
  if (a1)
  {
    CFRetain(cf);
    int v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __85__FigCaptureSessionObservatory__resetFigAssetWriterRecordingsCountForCaptureSession___block_invoke;
    v5[3] = &unk_1E5C24F10;
    v5[4] = a1;
    v5[5] = cf;
    fig_dispatch_async_autoreleasepool(v4, v5);
  }
}

void __85__FigCaptureSessionObservatory__resetFigAssetWriterRecordingsCountForCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSMapGet(*(NSMapTable **)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  if (v2)
  {
    objc_super v3 = v2;
    int v4 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(void *)(a1 + 32), *(const void **)(a1 + 40));
    v3[8] = 0;
    int v5 = -[FigCaptureSessionObservatory _isSessionRecordingMovie:](*(void *)(a1 + 32), *(const void **)(a1 + 40));
    if (v4 != v5) {
      -[FigCaptureSessionObservatory _postMovieRecordingUpdateNotification:forCaptureSession:](*(dispatch_queue_t **)(a1 + 32), v5, *(const void **)(a1 + 40));
    }
  }
  uint64_t v6 = *(const void **)(a1 + 40);
  CFRelease(v6);
}

- (id)osStatePropertyList
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  captureSessionsStorage = self->_captureSessionsStorage;
  uint64_t v5 = [(NSMapTable *)captureSessionsStorage countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(captureSessionsStorage);
        }
        [v3 setObject:FigCaptureSessionGetOSStateData(*(void *)(*((void *)&v10 + 1) + 8 * v8), 0), objc_msgSend(NSString, "stringWithFormat:", @"FigCaptureSession-%p", *(void *)(*((void *)&v10 + 1) + 8 * v8)) forKeyedSubscript];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMapTable *)captureSessionsStorage countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

@end