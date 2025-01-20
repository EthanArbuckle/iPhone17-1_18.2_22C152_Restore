@interface Invalidate
@end

@implementation Invalidate

void __captureSession_Invalidate_block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 360));
  uint64_t v2 = *(void *)(a1 + 32);
  *(unsigned char *)(v2 + 364) = 0;
  *(_WORD *)(v2 + 372) = 0;

  uint64_t v3 = *(void *)(a1 + 32);
  *(void *)(v3 + 392) = 0;
  if (*(unsigned char *)(v3 + 375))
  {
    [*(id *)(v3 + 432) setClientApplicationID:*(void *)(v3 + 88)];
    [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:*(void *)(*(void *)(a1 + 32) + 432)];
    uint64_t v3 = *(void *)(a1 + 32);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  *(void *)(v4 + 432) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 360));
  if (*(unsigned char *)(*(void *)(a1 + 32) + 112))
  {
    objc_msgSend(+[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor"), "removeLayoutObserver:", *(void *)(*(void *)(a1 + 32) + 712));
    uint64_t v5 = *(void *)(a1 + 32);
    *(unsigned char *)(v5 + 112) = 0;
    uint64_t v6 = *(void *)(v5 + 88);
    if (v6)
    {
      os_unfair_lock_lock(&sFigCaptureSessionPrewarming);
      v7 = (void *)[(id)qword_1EB4C59A0 objectForKeyedSubscript:v6];
      if (v7)
      {
        uint64_t v8 = [v7 referencedObject];
        if (!v8 || v8 == *(void *)(a1 + 40)) {
          [(id)qword_1EB4C59A0 setObject:0 forKeyedSubscript:v6];
        }
      }
      os_unfair_lock_unlock(&sFigCaptureSessionPrewarming);
    }
  }
  captureSession_stopRunningInternal(*(const void **)(a1 + 40), 1, 0);
  captureSession_teardownGraph(*(const void **)(a1 + 40), 0, 0, 0, 0, 0);
  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "unregisterClient:", *(unsigned int *)(*(void *)(a1 + 32) + 768));

  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(v9 + 776) = 0;
  [*(id *)(v9 + 120) invalidate];

  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(v10 + 120) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 772));
  v11 = *(os_unfair_lock_s **)(a1 + 32);
  v11[192]._os_unfair_lock_opaque = 0;
  os_unfair_lock_unlock(v11 + 193);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 360));

  uint64_t v12 = *(void *)(a1 + 32);
  *(void *)(v12 + 504) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(v13 + 504) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  *(void *)(v14 + 520) = 0;

  uint64_t v15 = *(void *)(a1 + 32);
  *(void *)(v15 + 528) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  *(void *)(v16 + 440) = 0;

  uint64_t v17 = *(void *)(a1 + 32);
  *(void *)(v17 + 448) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  *(void *)(v18 + 456) = 0;

  uint64_t v19 = *(void *)(a1 + 32);
  *(void *)(v19 + 464) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  *(void *)(v20 + 480) = 0;

  uint64_t v21 = *(void *)(a1 + 32);
  *(void *)(v21 + 488) = 0;

  uint64_t v22 = *(void *)(a1 + 32);
  *(void *)(v22 + 496) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 360));

  uint64_t v23 = *(void *)(a1 + 32);
  *(void *)(v23 + 712) = 0;

  uint64_t v24 = *(void *)(a1 + 32);
  *(void *)(v24 + 720) = 0;

  uint64_t v25 = *(void *)(a1 + 32);
  *(void *)(v25 + 752) = 0;

  uint64_t v26 = *(void *)(a1 + 32);
  *(void *)(v26 + 760) = 0;
  v27 = *(NSObject **)(v26 + 304);
  if (v27)
  {
    dispatch_source_cancel(v27);

    *(void *)(*(void *)(a1 + 32) + 304) = 0;
  }
  v28 = (void *)[MEMORY[0x1E4F4E9F0] sharedInstance];
  [v28 removeObserverForType:1 observer:*(void *)(*(void *)(a1 + 32) + 280) name:*MEMORY[0x1E4F4E890]];
  v29 = (void *)[MEMORY[0x1E4F4E9F0] sharedInstance];
  [v29 removeObserverForType:1 observer:*(void *)(*(void *)(a1 + 32) + 288) name:*MEMORY[0x1E4F4E8A0]];

  uint64_t v30 = *(void *)(a1 + 32);
  *(void *)(v30 + 280) = 0;

  uint64_t v31 = *(void *)(a1 + 32);
  *(void *)(v31 + 288) = 0;

  uint64_t v32 = *(void *)(a1 + 32);
  *(void *)(v32 + 256) = 0;
  cs_clearPocketDetectionNeeded(0, *(void *)(v32 + 88));
  v33 = *(const void **)(*(void *)(a1 + 32) + 264);
  if (v33)
  {
    CFRelease(v33);
    *(void *)(*(void *)(a1 + 32) + 264) = 0;
  }
  captureSession_stopObservingInvalidAudioRecordingState();
  v34 = *(const void **)(*(void *)(a1 + 32) + 344);
  if (v34)
  {
    CFRelease(v34);
    *(void *)(*(void *)(a1 + 32) + 344) = 0;
  }
  captureSession_cancelPrewarmingTimeoutTimer();

  uint64_t v35 = *(void *)(a1 + 32);
  *(void *)(v35 + 808) = 0;

  v36 = *(void **)(a1 + 32);
  v36[100] = 0;
  v37 = (const void *)v36[99];
  if (v37)
  {
    CFRelease(v37);
    *(void *)(*(void *)(a1 + 32) + 792) = 0;
    v36 = *(void **)(a1 + 32);
  }
  v38 = v36[18];
  dispatch_sync(v38, &__block_literal_global_971);
}

void __captureDeferredPhotoProcessor_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  captureDeferredPhotoProcessor_cleanupForCurrentProcessingRequest(v2);
  [+[BWDeferredTransactionBroker sharedInstance] closeTransaction:1];

  uint64_t v3 = *(void *)(a1 + 32);
  *(void *)(v3 + 40) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  v4[12] = 0;
  uint64_t v5 = (void *)v4[10];
  if (v5)
  {
    v4[10] = 0;
    xpc_release(v5);
    uint64_t v4 = *(void **)(a1 + 32);
  }
  v4[11] = 0;
}

@end