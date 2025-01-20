@interface CMContinuityCaptureVideoDevice
- (BOOL)isCenterStageForceEnableSupported;
- (BOOL)startAVConferenceStack:(unint64_t)a3;
- (BOOL)stopAVConferenceStack;
- (CMContinuityCaptureVideoDevice)companionDevice;
- (CMContinuityCaptureVideoDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4;
- (id)controls;
- (id)createAVCVideoStream;
- (id)debugInfo;
- (id)deviceID;
- (id)newVideoStreamCurrentConfiguration;
- (opaqueCMSampleBuffer)_createStillImageDataBufferFromRequest:(id)a3 timestamp:(id *)a4;
- (opaqueCMSampleBuffer)createBlackSampleBuffer;
- (opaqueCMSampleBuffer)createBlurredSampleBuffer;
- (void)_didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)completeImageCaptureRequest:(id)a3;
- (void)createAVCVideoStream;
- (void)createBlurredSampleBuffer;
- (void)dealloc;
- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)forceDeviceRemoval;
- (void)newVideoStreamCurrentConfiguration;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postAVCStreamInterruption;
- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5;
- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)resetTransportDevice:(id)a3;
- (void)restartSendingInvalidFramesIfApplicable;
- (void)scheduleDeviceBusyNotification:(BOOL)a3;
- (void)scheduleResumeUserNotification:(BOOL)a3;
- (void)setCompanionDevice:(id)a3;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)startSendingInvalidFrames;
- (void)stateMachineEnqueueReactionEffect;
- (void)stateMachineImageCapture;
- (void)stateMachineStartSendingBlurredFrames;
- (void)stateMachineStopSendingBlurredFrames;
- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4;
- (void)stopSendingInvalidFrames;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidRTPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
- (void)streamOutput:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)streamOutputDidBecomeInvalid:(id)a3;
- (void)streamOutputServerDidDie:(id)a3;
- (void)terminateComplete:(id)a3;
- (void)updateCameraHiddenControlIfApplicable;
@end

@implementation CMContinuityCaptureVideoDevice

- (CMContinuityCaptureVideoDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 client];
  v9 = [v8 device];
  v18.receiver = self;
  v18.super_class = (Class)CMContinuityCaptureVideoDevice;
  v10 = [(CMContinuityCaptureDeviceBase *)&v18 initWithCapabilities:v7 compositeDelegate:v6 transportDevice:v9 queue:0];

  if (!v10)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_4;
  }
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  centerStageStateRestorationDataArray = v10->_centerStageStateRestorationDataArray;
  v10->_centerStageStateRestorationDataArray = v11;

  v13 = [[CMContinuityCaptureCMIOVideoDevice alloc] initWithCaptureDevice:v10];
  cmioCaptureDevice = v10->_cmioCaptureDevice;
  v10->_cmioCaptureDevice = v13;

  if (!v10->_cmioCaptureDevice)
  {
    v17 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice initWithCapabilities:compositeDelegate:]();
    }

    goto LABEL_8;
  }
  v10->_manualFramingEnabled = _os_feature_enabled_impl();
  v15 = v10;
LABEL_4:

  return v15;
}

- (id)deviceID
{
  return [(CMContinuityCaptureCMIOVideoDevice *)self->_cmioCaptureDevice deviceID];
}

- (void)forceDeviceRemoval
{
}

- (void)dealloc
{
  lastDispatchedSampleBuffer = self->_lastDispatchedSampleBuffer;
  if (lastDispatchedSampleBuffer)
  {
    CFRelease(lastDispatchedSampleBuffer);
    self->_lastDispatchedSampleBuffer = 0;
  }
  blurredSampleBuffer = self->_blurredSampleBuffer;
  if (blurredSampleBuffer)
  {
    CFRelease(blurredSampleBuffer);
    self->_blurredSampleBuffer = 0;
  }
  blurredFrameDispatchTimer = self->_blurredFrameDispatchTimer;
  if (blurredFrameDispatchTimer)
  {
    dispatch_source_cancel(blurredFrameDispatchTimer);
    id v6 = self->_blurredFrameDispatchTimer;
    self->_blurredFrameDispatchTimer = 0;
  }
  blackFrameDispatchTimer = self->_blackFrameDispatchTimer;
  if (blackFrameDispatchTimer)
  {
    dispatch_source_cancel(blackFrameDispatchTimer);
    v8 = self->_blackFrameDispatchTimer;
    self->_blackFrameDispatchTimer = 0;
  }
  blackFrameSampleBuffer = self->_blackFrameSampleBuffer;
  if (blackFrameSampleBuffer)
  {
    CFRelease(blackFrameSampleBuffer);
    self->_blackFrameSampleBuffer = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CMContinuityCaptureVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v10 dealloc];
}

- (void)resetTransportDevice:(id)a3
{
  id v4 = a3;
  v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__CMContinuityCaptureVideoDevice_resetTransportDevice___block_invoke;
  v8[3] = &unk_264C99080;
  id v9 = v4;
  objc_super v10 = self;
  id v7 = v4;
  dispatch_async_and_wait(v6, v8);
}

void __55__CMContinuityCaptureVideoDevice_resetTransportDevice___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) transportDevice];
  LOBYTE(v2) = [v2 isEqual:v3];

  if ((v2 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 248) resetTransportDevice:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    v5.receiver = *(id *)(a1 + 40);
    v5.super_class = (Class)CMContinuityCaptureVideoDevice;
    objc_msgSendSuper2(&v5, sel_resetTransportDevice_, v4);
  }
}

- (BOOL)isCenterStageForceEnableSupported
{
  return 1;
}

- (void)updateCameraHiddenControlIfApplicable
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__CMContinuityCaptureVideoDevice_updateCameraHiddenControlIfApplicable__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureVideoDevice_updateCameraHiddenControlIfApplicable__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[31] _updateCameraHiddenControlIfApplicable];
    WeakRetained = v2;
  }
}

- (opaqueCMSampleBuffer)createBlackSampleBuffer
{
  v29[2] = *MEMORY[0x263EF8340];
  CMSampleBufferRef sampleBufferOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x263F01090];
  sampleTiming.duration.epoch = *(void *)(MEMORY[0x263F01090] + 16);
  sampleTiming.presentationTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  sampleTiming.decodeTimeStamp = sampleTiming.duration;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  uint64_t v4 = (void *)*MEMORY[0x263F04130];
  v28[0] = *MEMORY[0x263F03F30];
  v3 = (void *)v28[0];
  v28[1] = v4;
  v29[0] = &unk_26E96A300;
  v29[1] = MEMORY[0x263EFFA78];
  CFDictionaryRef v5 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  v8 = [v7 format];
  size_t v9 = [v8 width];
  objc_super v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  v11 = [v10 format];
  LODWORD(v9) = CVPixelBufferCreate(v6, v9, [v11 height], 0x42475241u, v5, &pixelBufferOut);

  if (!v9)
  {
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    size_t Width = CVPixelBufferGetWidth(pixelBufferOut);
    size_t Height = CVPixelBufferGetHeight(pixelBufferOut);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    if (Height * Width) {
      memset_pattern16(BaseAddress, &unk_236059470, 4 * Height * Width);
    }
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    CMVideoFormatDescriptionCreateForImageBuffer(v6, pixelBufferOut, &formatDescriptionOut);
    CMSampleBufferCreateReadyWithImageBuffer(v6, pixelBufferOut, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
    if (sampleBufferOut) {
      CMSetAttachment(sampleBufferOut, @"kCMContinuityCaptureAttachmentFrameType", &unk_26E96A318, 1u);
    }
  }
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  v15 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v23 = self;
    __int16 v24 = 2080;
    v25 = "-[CMContinuityCaptureVideoDevice createBlackSampleBuffer]";
    __int16 v26 = 2048;
    CMSampleBufferRef v27 = sampleBufferOut;
    _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %p", buf, 0x20u);
  }

  v16 = sampleBufferOut;
  return v16;
}

- (opaqueCMSampleBuffer)createBlurredSampleBuffer
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  lastDispatchedSampleBuffer = self->_lastDispatchedSampleBuffer;
  if (!lastDispatchedSampleBuffer)
  {
    lastDispatchedSampleBuffer = [(CMContinuityCaptureVideoDevice *)self createBlackSampleBuffer];
    self->_lastDispatchedSampleBuffer = lastDispatchedSampleBuffer;
  }
  sampleTiming.decodeTimeStamp.epoch = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTiming.presentationTimeStamp.timescale = v4;
  *(_OWORD *)&sampleTiming.decodeTimeStamp.value = v4;
  *(_OWORD *)&sampleTiming.duration.value = v4;
  *(_OWORD *)&sampleTiming.duration.epoch = v4;
  ImageBuffer = CMSampleBufferGetImageBuffer(lastDispatchedSampleBuffer);
  if (!ImageBuffer) {
    goto LABEL_25;
  }
  CFAllocatorRef v6 = ImageBuffer;
  CFDictionaryRef v7 = CVPixelBufferCopyCreationAttributes(ImageBuffer);
  if (!v7)
  {
    __int16 v24 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer]();
    }

LABEL_25:
    v13 = 0;
    v15 = 0;
    CFDictionaryRef v8 = 0;
    size_t v9 = 0;
    goto LABEL_15;
  }
  CFDictionaryRef v8 = v7;
  size_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7];
  objc_super v10 = (void *)*MEMORY[0x263F03F30];
  [v9 setObject:&unk_26E96A300 forKeyedSubscript:*MEMORY[0x263F03F30]];

  v11 = (void *)*MEMORY[0x263F04130];
  [v9 setObject:MEMORY[0x263EFFA78] forKeyedSubscript:*MEMORY[0x263F04130]];

  v12 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:v6];
  if (!v12)
  {
    v25 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer]();
    }

    v13 = 0;
    goto LABEL_32;
  }
  v13 = v12;
  uint64_t v14 = [v12 imageByApplyingGaussianBlurWithSigma:26.0];
  if (!v14)
  {
    __int16 v26 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer]();
    }

LABEL_32:
    v15 = 0;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  size_t Width = CVPixelBufferGetWidth(v6);
  size_t Height = CVPixelBufferGetHeight(v6);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v6);
  if (CVPixelBufferCreate(0, Width, Height, PixelFormatType, (CFDictionaryRef)v9, &pixelBufferOut) || !pixelBufferOut)
  {
    CMSampleBufferRef v27 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.4();
    }
    goto LABEL_37;
  }
  CVBufferPropagateAttachments(v6, pixelBufferOut);
  v19 = [MEMORY[0x263F00628] context];
  [v19 render:v15 toCVPixelBuffer:pixelBufferOut];

  if (!pixelBufferOut)
  {
    CMSampleBufferRef v27 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.5();
    }
LABEL_37:

    goto LABEL_15;
  }
  if (CMVideoFormatDescriptionCreateForImageBuffer(0, pixelBufferOut, &formatDescriptionOut) || !formatDescriptionOut)
  {
    v28 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.6();
    }
  }
  else
  {
    sampleTiming.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
    int64_t HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
    CMTimeMake(&sampleTiming.presentationTimeStamp, HostTimeInNanoSec, 1000000000);
    v21 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    CMTimeMake(&v29, 1, [v21 maxFrameRate]);
    sampleTiming.duration = v29;

    if (!CMSampleBufferCreateReadyWithImageBuffer(0, pixelBufferOut, formatDescriptionOut, &sampleTiming, &sampleBufferOut)&& sampleBufferOut)
    {
      CMSetAttachment(sampleBufferOut, @"kCMContinuityCaptureAttachmentFrameType", &unk_26E96A330, 1u);
      goto LABEL_15;
    }
    v28 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.7();
    }
  }

LABEL_15:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  v22 = sampleBufferOut;

  return v22;
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  CFDictionaryRef v5 = a3;
  uint64_t v57 = *MEMORY[0x263EF8340];
  CFRetain(a3);
  uint64_t v7 = MEMORY[0x263F01090];
  memset(&v52, 170, sizeof(v52));
  CMSampleBufferGetPresentationTimeStamp(&v52, v5);
  CFDictionaryRef v8 = CMGetAttachment(v5, (CFStringRef)*MEMORY[0x263F2C5D8], 0);
  size_t v9 = [v8 objectForKeyedSubscript:@"NetworkTime"];
  objc_super v10 = [v8 objectForKeyedSubscript:@"NetworkTimeClockIdentity"];
  lastDispatchedSampleBuffer = self->_lastDispatchedSampleBuffer;
  if (lastDispatchedSampleBuffer) {
    CFRelease(lastDispatchedSampleBuffer);
  }
  CMTimeValue value = *(void *)v7;
  CMTimeFlags flags = *(_DWORD *)(v7 + 12);
  CMTimeScale timescale = *(_DWORD *)(v7 + 8);
  CMTimeEpoch epoch = *(void *)(v7 + 16);
  self->_lastDispatchedSampleBuffer = v5;
  CFRetain(v5);
  blurredSampleBuffer = self->_blurredSampleBuffer;
  if (blurredSampleBuffer)
  {
    CFRelease(blurredSampleBuffer);
    self->_blurredSampleBuffer = 0;
  }
  uint64_t v14 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  v15 = [v14 client];
  v16 = [v15 timeSyncClock];

  unint64_t v17 = 0x26884F000;
  if (v16 && v9)
  {
    objc_super v18 = v8;
    v19 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    v20 = [v19 client];
    [v20 timeSyncClock];
    v22 = v21 = v10;
    uint64_t hostTime = objc_msgSend(v22, "machAbsoluteTimeForDomainTime:", objc_msgSend(v9, "unsignedLongLongValue"));

    if (v21)
    {
      v23 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
      __int16 v24 = [v23 client];
      [v24 timeSyncClock];
      __int16 v26 = v25 = v9;
      uint64_t v27 = [v26 grandMasterIdentifier];

      size_t v9 = v25;
      v28 = v21;
      BOOL v29 = [v21 unsignedLongLongValue] == v27;
    }
    else
    {
      v28 = 0;
      BOOL v29 = 1;
    }
    CFDictionaryRef v8 = v18;
    if (CMContinityCaptureDebugLogEnabled())
    {
      v30 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[CMContinuityCaptureVideoDevice dispatchFrame:entity:completion:]();
      }
    }
    if (hostTime != *MEMORY[0x263F7F270] && v29)
    {
      CMClockMakeHostTimeFromSystemUnits(&time, hostTime);
      CMTimeConvertScale(&v49.duration, &time, 100000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      CMTimeValue value = v49.duration.value;
      CMTimeFlags flags = v49.duration.flags;
      CMTimeScale timescale = v49.duration.timescale;
      CMTimeEpoch epoch = v49.duration.epoch;
    }
    if (self->_lastBufferNetworkTimeClockSynchronized != v29 && self->_numberOfFramesDispatched) {
      CMSetAttachment(v5, @"ContinuityCaptureTimeDiscontinuity", MEMORY[0x263EFFA88], 1u);
    }
    self->_lastBufferNetworkTimeClockSynchronized = v29;
    objc_super v10 = v28;
    unint64_t v17 = 0x26884F000uLL;
  }
  int v31 = flags & 1;
  if ((flags & 1) == 0 && v52.timescale > 100000)
  {
    CMTime duration = v52;
    CMTimeConvertScale(&v49.duration, &duration, 100000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTimeValue value = v49.duration.value;
    CMTimeFlags flags = v49.duration.flags;
    CMTimeScale timescale = v49.duration.timescale;
    CMTimeEpoch epoch = v49.duration.epoch;
    int v31 = v49.duration.flags & 1;
  }
  if (v31)
  {
    v49.decodeTimeStamp.CMTimeEpoch epoch = 0xAAAAAAAAAAAAAAAALL;
    CMSampleBufferRef sampleBufferOut = 0;
    *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v49.presentationTimeStamp.CMTimeScale timescale = v32;
    *(_OWORD *)&v49.decodeTimeStamp.CMTimeValue value = v32;
    *(_OWORD *)&v49.duration.CMTimeValue value = v32;
    *(_OWORD *)&v49.duration.CMTimeEpoch epoch = v32;
    CMSampleBufferGetSampleTimingInfo(v5, 0, &v49);
    v49.presentationTimeStamp.CMTimeValue value = value;
    v49.presentationTimeStamp.CMTimeScale timescale = timescale;
    v49.presentationTimeStamp.CMTimeFlags flags = flags;
    v49.presentationTimeStamp.CMTimeEpoch epoch = epoch;
    CFAllocatorRef v33 = CFGetAllocator(v5);
    OSStatus v34 = CMSampleBufferCreateCopyWithNewTiming(v33, v5, 1, &v49, &sampleBufferOut);
    if (v34 || !sampleBufferOut)
    {
      v37 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        duration.CMTimeValue value = value;
        duration.CMTimeScale timescale = timescale;
        duration.CMTimeFlags flags = flags;
        duration.CMTimeEpoch epoch = epoch;
        Float64 Seconds = CMTimeGetSeconds(&duration);
        CMTime duration = v52;
        Float64 v43 = CMTimeGetSeconds(&duration);
        LODWORD(duration.value) = 138544130;
        *(CMTimeValue *)((char *)&duration.value + 4) = (CMTimeValue)self;
        LOWORD(duration.flags) = 2048;
        *(Float64 *)((char *)&duration.flags + 2) = Seconds;
        HIWORD(duration.epoch) = 2048;
        Float64 v54 = v43;
        __int16 v55 = 1024;
        OSStatus v56 = v34;
        _os_log_error_impl(&dword_235FC2000, v37, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create retimed video frame with PTS %.4f, falling back to unsynced PTS %.4f. err: %d", (uint8_t *)&duration, 0x26u);
      }
    }
    else
    {
      CFRelease(v5);
      CFDictionaryRef v5 = sampleBufferOut;
      CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CMTime duration = v52;
      CFDictionaryRef v36 = CMTimeCopyAsDictionary(&duration, v35);
      CMSetAttachment(v5, (CFStringRef)*MEMORY[0x263F2C560], v36, 1u);
      CFRelease(v36);
    }
  }
  memset(&v49, 170, 24);
  CMSampleBufferGetPresentationTimeStamp(&v49.duration, v5);
  v38 = [v8 objectForKeyedSubscript:@"CaptureSessionRestarted"];
  int v39 = [v38 BOOLValue];

  if (v39)
  {
    CMSetAttachment(v5, @"ContinuityCaptureTimeDiscontinuity", MEMORY[0x263EFFA88], 1u);
    v40 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      CMTime duration = v49.duration;
      Float64 v41 = CMTimeGetSeconds(&duration);
      LODWORD(duration.value) = 138543618;
      *(CMTimeValue *)((char *)&duration.value + 4) = (CMTimeValue)self;
      LOWORD(duration.flags) = 2048;
      *(Float64 *)((char *)&duration.flags + 2) = v41;
      _os_log_impl(&dword_235FC2000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ marking time discontinuity on buffer %.4f because capture session just restarted on remote device", (uint8_t *)&duration, 0x16u);
    }
  }
  if ([(CMContinuityCaptureDeviceBase *)self hasStreamIntent]) {
    [(CMContinuityCaptureCMIOVideoDevice *)self->_cmioCaptureDevice dispatchFrame:v5 entity:[(CMContinuityCaptureDeviceBase *)self entity] completion:&__block_literal_global_173];
  }
  ++*(Class *)((char *)&self->super.super.isa + *(int *)(v17 + 2628));
  v48.receiver = self;
  v48.super_class = (Class)CMContinuityCaptureVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v48 dispatchFrame:v5 entity:[(CMContinuityCaptureDeviceBase *)self entity] completion:&__block_literal_global_175];
  CFRelease(v5);
}

- (void)streamOutput:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFAllocatorRef v6 = (AVCStreamOutput *)a3;
  uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  avcStreamOutput = self->_avcStreamOutput;
  if (avcStreamOutput) {
    BOOL v9 = avcStreamOutput == v6;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if ([(CMContinuityCaptureDeviceBase *)self streaming])
    {
      [(CMContinuityCaptureDeviceBase *)self scheduleSendingInvalidFramesAfterTimeout:0];
      [(CMContinuityCaptureVideoDevice *)self stateMachineStopSendingBlurredFrames];
      [(CMContinuityCaptureVideoDevice *)self dispatchFrame:a4 entity:[(CMContinuityCaptureDeviceBase *)self entity] completion:&__block_literal_global_178];
      self->_failedBufferCountDueToMismatchState = 0;
      self->_canIssueStateMismatchEvent = 0;
      goto LABEL_8;
    }
    objc_super v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v20 = 138543362;
      v21 = self;
      v13 = "%{public}@ dropping since we are not in streaming state";
      uint64_t v14 = v10;
      uint32_t v15 = 12;
      goto LABEL_13;
    }
  }
  else
  {
    objc_super v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = self->_avcStreamOutput;
      int v20 = 138543874;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v6;
      __int16 v24 = 2112;
      v25 = v12;
      v13 = "%{public}@ discarding sample buffer from streamOutput %@ current _avcStreamOutput %@";
      uint64_t v14 = v10;
      uint32_t v15 = 32;
LABEL_13:
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v20, v15);
    }
  }

  if (self->_canIssueStateMismatchEvent)
  {
    uint64_t v16 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    if (v16)
    {
      unint64_t v17 = (void *)v16;
      unsigned int v18 = self->_failedBufferCountDueToMismatchState + 1;
      self->_failedBufferCountDueToMismatchState = v18;
      if (v18 >= 0x3C)
      {
        v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1012 userInfo:0];
        [v17 connectionInterrupted:v19 forDevice:0];

        self->_canIssueStateMismatchEvent = 0;
        self->_failedBufferCountDueToMismatchState = 0;
      }
    }
  }
LABEL_8:
}

- (void)streamOutputServerDidDie:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFDictionaryRef v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v10 = 2080;
    v11 = "-[CMContinuityCaptureVideoDevice streamOutputServerDidDie:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  CFAllocatorRef v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureVideoDevice_streamOutputServerDidDie___block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __59__CMContinuityCaptureVideoDevice_streamOutputServerDidDie___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained stopCaptureStack:0 completion:&__block_literal_global_184];
    id WeakRetained = v2;
  }
}

- (void)streamOutputDidBecomeInvalid:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    CFAllocatorRef v6 = self;
    __int16 v7 = 2080;
    id v8 = "-[CMContinuityCaptureVideoDevice streamOutputDidBecomeInvalid:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
  }
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  __int16 v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138544130;
    uint64_t v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    __int16 v12 = 2080;
    v13 = "-[CMContinuityCaptureVideoDevice stream:didStart:error:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCOutput setup complete %s %@", (uint8_t *)&v8, 0x2Au);
  }

  self->_avcStreamOutputActive = 1;
}

- (void)streamDidStop:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CMContinuityCaptureVideoDevice_streamDidStop___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__CMContinuityCaptureVideoDevice_streamDidStop___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 138543874;
      id v11 = v5;
      __int16 v12 = 2080;
      v13 = "-[CMContinuityCaptureVideoDevice streamDidStop:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v7 = WeakRetained[35];
    if (v7)
    {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
      id v8 = (void *)WeakRetained[35];
      WeakRetained[35] = 0;
    }
    id v9 = (void *)WeakRetained[34];
    WeakRetained[34] = 0;

    *((unsigned char *)WeakRetained + 376) = 0;
  }
}

- (void)streamDidRTPTimeOut:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureVideoDevice_streamDidRTPTimeOut___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__CMContinuityCaptureVideoDevice_streamDidRTPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2080;
    int v10 = "-[CMContinuityCaptureVideoDevice streamDidRTPTimeOut:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v7, 0x20u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  if (v5) {
    [v5 postAVCStreamInterruption];
  }
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CMContinuityCaptureVideoDevice_streamDidRTCPTimeOut___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__CMContinuityCaptureVideoDevice_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2080;
    int v10 = "-[CMContinuityCaptureVideoDevice streamDidRTCPTimeOut:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v7, 0x20u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  if (v5) {
    [v5 postAVCStreamInterruption];
  }
}

- (void)streamDidServerDie:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CMContinuityCaptureVideoDevice_streamDidServerDie___block_invoke;
  v6[3] = &unk_264C990F8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __53__CMContinuityCaptureVideoDevice_streamDidServerDie___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = 138543618;
    id v9 = WeakRetained;
    __int16 v10 = 2080;
    __int16 v11 = "-[CMContinuityCaptureVideoDevice streamDidServerDie:]_block_invoke";
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4[35];
    if (v6)
    {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
      id v7 = (void *)v5[35];
      v5[35] = 0;
    }
    [v5 postAVCStreamInterruption];
  }
}

- (void)postAVCStreamInterruption
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v8 = 2080;
    id v9 = "-[CMContinuityCaptureVideoDevice postAVCStreamInterruption]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v4 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureVideoDevice_postAVCStreamInterruption__block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __59__CMContinuityCaptureVideoDevice_postAVCStreamInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained compositeDelegate];
    if (v2)
    {
      v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1007 userInfo:0];
      [v2 connectionInterrupted:v3 forDevice:0];
    }
    id WeakRetained = v4;
  }
}

- (id)createAVCVideoStream
{
  v29[2] = *MEMORY[0x263EF8340];
  v29[0] = 0xAAAAAAAAAAAAAAAALL;
  v29[1] = 0xAAAAAAAAAAAAAAAALL;
  v3 = [(CMContinuityCaptureDeviceBase *)self transportStream];
  id v4 = v3;
  if (!v3)
  {
    id v16 = 0;
    uint64_t v15 = 0;
    id v5 = 0;
LABEL_21:
    id v9 = 0;
    id v13 = 0;
    goto LABEL_16;
  }
  id v5 = [v3 streamUUID];
  if (!v5)
  {
    id v16 = 0;
    uint64_t v15 = 0;
    goto LABEL_21;
  }
  id v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v24 = self;
    __int16 v25 = 2048;
    unint64_t v26 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    __int16 v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream for StreamUUID %@", buf, 0x20u);
  }

  [v5 getUUIDBytes:v29];
  id v7 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];

  if (!v7)
  {
    id v10 = 0;
    goto LABEL_9;
  }
  __int16 v8 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];
  id v22 = 0;
  id v9 = [v8 generateMediaStreamInitOptionsWithError:&v22];
  id v10 = v22;

  __int16 v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F21048]];
  avcStreamCallID = self->_avcStreamCallID;
  self->_avcStreamCallID = v11;

  if (!v9)
  {
LABEL_9:
    __int16 v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v24 = self;
      __int16 v25 = 2112;
      unint64_t v26 = (unint64_t)v10;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid avcStreamInitOptions, error %@", buf, 0x16u);
    }

    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v9 = 0;
    id v10 = 0;
    goto LABEL_12;
  }
  id v13 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v9];
LABEL_12:
  [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F21060]];
  id v21 = v10;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F20FE8]) initWithNWConnectionClientID:v29 options:v13 error:&v21];
  id v16 = v21;

  if (v15)
  {
    [v15 setDelegate:self];
    unint64_t v17 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
      *(_DWORD *)buf = 138543874;
      __int16 v24 = self;
      __int16 v25 = 2048;
      unint64_t v26 = v18;
      __int16 v27 = 2048;
      v28 = v15;
      _os_log_impl(&dword_235FC2000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream %p Success", buf, 0x20u);
    }
  }
  else
  {
    unint64_t v17 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice createAVCVideoStream]();
    }
    uint64_t v15 = 0;
  }

LABEL_16:
  id v19 = v15;

  return v19;
}

- (id)newVideoStreamCurrentConfiguration
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v3 = [(CMContinuityCaptureDeviceBase *)self transportStream];
  if (v3)
  {
    id v4 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    id v5 = [v4 sessionID];
    id v6 = [v3 cipherKeyforSessionID:v5];

    if (v6)
    {
      id v7 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];
      id v44 = 0;
      __int16 v8 = [v7 generateMediaStreamConfigurationWithError:&v44];
      id v9 = v44;

      if (v8)
      {
        [v8 setRtcpSendInterval:1.0];
        [v8 setRtcpTimeOutEnabled:1];
        id v10 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
        int v11 = [v10 wired];
        double v12 = 12.0;
        if (v11) {
          double v12 = 8.0;
        }
        [v8 setRtcpTimeOutInterval:v12];

        [v8 setSRTPCipherSuite:5];
        [v8 setSRTCPCipherSuite:5];
        [v8 setSendMediaKey:v6];
        [v8 setReceiveMediaKey:v6];
        id v13 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        __int16 v14 = [v13 format];
        uint64_t AVCVideoResolutionForFormat = CMContinuityCaptureGetAVCVideoResolutionForFormat(v14);
        id v16 = [v8 video];
        [v16 setVideoResolution:AVCVideoResolutionForFormat];

        unint64_t v17 = [v8 video];
        uint64_t v18 = [v17 videoResolution];

        if (v18 == 12)
        {
          id v19 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          int v20 = [v19 format];
          uint64_t v21 = [v20 width];
          id v22 = [v8 video];
          [v22 setCustomWidth:v21];

          v23 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          __int16 v24 = [v23 format];
          uint64_t v25 = [v24 height];
          unint64_t v26 = [v8 video];
          [v26 setCustomHeight:v25];
        }
        __int16 v27 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        uint64_t v28 = [v27 maxFrameRate];
        BOOL v29 = [v8 video];
        [v29 setFramerate:v28];

        v30 = [v8 video];
        [v30 setLatencySensitiveModeEnabled:1];

        int v31 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v42 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
          Float64 v43 = [v8 video];
          int v32 = [v43 videoResolution];
          CFAllocatorRef v33 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          id v34 = v9;
          int v35 = [v33 maxFrameRate];
          CFDictionaryRef v36 = v6;
          v37 = v3;
          int v38 = [v8 localSSRC];
          int v39 = [v8 remoteSSRC];
          *(_DWORD *)buf = 138413570;
          v46 = self;
          __int16 v47 = 2048;
          unint64_t v48 = v42;
          __int16 v49 = 1024;
          int v50 = v32;
          __int16 v51 = 1024;
          int v52 = v35;
          id v9 = v34;
          __int16 v53 = 1024;
          int v54 = v38;
          v3 = v37;
          id v6 = v36;
          __int16 v55 = 1024;
          int v56 = v39;
          _os_log_impl(&dword_235FC2000, v31, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] Stream Resolution %u at frameRate %u localSSRC %x remoteSSRC %x", buf, 0x2Eu);
        }
      }
      else
      {
        int v31 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureVideoDevice newVideoStreamCurrentConfiguration]();
        }
        __int16 v8 = 0;
      }
    }
    else
    {
      int v31 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        [(CMContinuityCaptureVideoDevice *)self newVideoStreamCurrentConfiguration];
      }
      __int16 v8 = 0;
      id v9 = 0;
      id v6 = 0;
    }
  }
  else
  {
    __int16 v8 = 0;
    id v9 = 0;
    id v6 = 0;
  }
  id v40 = v8;

  return v40;
}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v34 = self;
    __int16 v35 = 2080;
    CFDictionaryRef v36 = "-[CMContinuityCaptureVideoDevice startAVConferenceStack:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  p_avcVideoStream = (id *)&self->_avcVideoStream;
  if (!self->_avcVideoStream)
  {
    uint64_t v7 = [(CMContinuityCaptureVideoDevice *)self createAVCVideoStream];
    id v8 = *p_avcVideoStream;
    id *p_avcVideoStream = (id)v7;

    if (!*p_avcVideoStream) {
      goto LABEL_17;
    }
  }
  id v9 = [(CMContinuityCaptureVideoDevice *)self newVideoStreamCurrentConfiguration];
  if (!v9)
  {
    __int16 v27 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice startAVConferenceStack:]();
    }

LABEL_17:
    BOOL v25 = 0;
    id v13 = 0;
    id v10 = 0;
    goto LABEL_13;
  }
  id v10 = v9;
  id v11 = *p_avcVideoStream;
  id v32 = 0;
  char v12 = [v11 configure:v10 error:&v32];
  id v13 = v32;
  __int16 v14 = CMContinuityCaptureLog(2);
  uint64_t v15 = v14;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v29 = (const char *)*p_avcVideoStream;
      *(_DWORD *)buf = 138543874;
      id v34 = self;
      __int16 v35 = 2048;
      CFDictionaryRef v36 = v29;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_error_impl(&dword_235FC2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ AVCVideoStream %p configure error %@", buf, 0x20u);
    }

    goto LABEL_21;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v16 = [(CMContinuityCaptureDeviceBase *)self currentSessionID];
    id v17 = *p_avcVideoStream;
    uint64_t v18 = [*p_avcVideoStream streamToken];
    *(_DWORD *)buf = 138544130;
    id v34 = self;
    __int16 v35 = 2048;
    CFDictionaryRef v36 = (const char *)v16;
    __int16 v37 = 2048;
    id v38 = v17;
    __int16 v39 = 2048;
    uint64_t v40 = v18;
    _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCVideoStream %p StreamToken %lu", buf, 0x2Au);
  }

  if (![*p_avcVideoStream streamToken])
  {
LABEL_21:
    BOOL v25 = 0;
    goto LABEL_13;
  }
  id v19 = objc_alloc(MEMORY[0x263F20FE0]);
  uint64_t v20 = [*p_avcVideoStream streamToken];
  uint64_t v21 = [(CMContinuityCaptureDeviceBase *)self queue];
  id v31 = v13;
  id v22 = (AVCStreamOutput *)[v19 initWithStreamToken:v20 delegate:self queue:v21 error:&v31];
  id v23 = v31;

  avcStreamOutput = self->_avcStreamOutput;
  self->_avcStreamOutput = v22;

  if (self->_avcStreamOutput)
  {
    [*p_avcVideoStream start];
    BOOL v25 = 1;
  }
  else
  {
    uint64_t v28 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice startAVConferenceStack:]();
    }

    BOOL v25 = 0;
  }
  id v13 = v23;
LABEL_13:
  v30.receiver = self;
  v30.super_class = (Class)CMContinuityCaptureVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v30 startAVConferenceStack:a3];

  return v25;
}

- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  if (self->_stopCompletionBlock)
  {
    id v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      __int16 v28 = 2080;
      BOOL v29 = "-[CMContinuityCaptureVideoDevice stopCaptureStack:completion:]";
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s already in progress", buf, 0x16u);
    }

    if ((a3 & 4) != 0)
    {
      avcVideoStream = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      avcStreamCallID = self->_avcStreamCallID;
      self->_avcStreamCallID = 0;

      id v11 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }
    }
    char v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:3 userInfo:0];
    v6[2](v6, v12);
  }
  else
  {
    if (self->_avcStreamOutputActive)
    {
      id v13 = (void *)MEMORY[0x237DFB780](v6);
      id stopCompletionBlock = self->_stopCompletionBlock;
      self->_id stopCompletionBlock = v13;

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v15 = dispatch_time(0, 5000000000);
      unint64_t v16 = [(CMContinuityCaptureDeviceBase *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__CMContinuityCaptureVideoDevice_stopCaptureStack_completion___block_invoke;
      block[3] = &unk_264C990F8;
      objc_copyWeak(&v26, (id *)buf);
      dispatch_after(v15, v16, block);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    BOOL v17 = [(CMContinuityCaptureVideoDevice *)self stopAVConferenceStack];
    if ((a3 & 4) != 0)
    {
      uint64_t v18 = self->_avcVideoStream;
      if (v18) {
        [(AVCVideoStream *)v18 stop];
      }
      avcStreamOutput = self->_avcStreamOutput;
      self->_avcStreamOutput = 0;

      uint64_t v20 = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      uint64_t v21 = self->_avcStreamCallID;
      self->_avcStreamCallID = 0;

      self->_avcStreamOutputActive = 0;
      id v22 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_235FC2000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }
    }
    v24.receiver = self;
    v24.super_class = (Class)CMContinuityCaptureVideoDevice;
    [(CMContinuityCaptureDeviceBase *)&v24 stopCaptureStack:a3 completion:&__block_literal_global_191];
    if (!v17 || !self->_avcStreamOutputActive)
    {
      id v23 = self->_stopCompletionBlock;
      self->_id stopCompletionBlock = 0;

      v6[2](v6, 0);
    }
  }
}

uint64_t __62__CMContinuityCaptureVideoDevice_stopCaptureStack_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[35];
    if (v3)
    {
      id v6 = v2;
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      id v4 = (void *)v6[35];
      v6[35] = 0;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (BOOL)stopAVConferenceStack
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2080;
    id v11 = "-[CMContinuityCaptureVideoDevice stopAVConferenceStack]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
  }

  if (self->_avcStreamOutput && (avcVideoStream = self->_avcVideoStream) != 0)
  {
    [(AVCVideoStream *)avcVideoStream stop];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (!self->_avcStreamOutputActive)
  {
    avcStreamOutput = self->_avcStreamOutput;
    self->_avcStreamOutput = 0;
  }
  return v5;
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  __int16 v10 = [(CMContinuityCaptureDeviceBase *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__CMContinuityCaptureVideoDevice_postEvent_entity_data___block_invoke;
  v13[3] = &unk_264C99238;
  objc_copyWeak(v17, &location);
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = self;
  v17[1] = (id)a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __56__CMContinuityCaptureVideoDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained compositeDelegate];
    if (v4)
    {
      if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventImageCapture"])
      {
        id v5 = v3[41];
        if (!v5)
        {
          uint64_t v6 = [MEMORY[0x263EFF980] array];
          id v7 = v3[41];
          v3[41] = (id)v6;

          id v5 = v3[41];
        }
        id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ImageRequest"];
        [v5 addObject:v8];

        id v9 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 48);
          id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ImageRequest"];
          uint64_t v12 = [v3[41] count];
          *(_DWORD *)buf = 138543874;
          uint64_t v49 = v10;
          __int16 v50 = 2112;
          __int16 v51 = v11;
          __int16 v52 = 2048;
          uint64_t v53 = v12;
          _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Added request %@ to stillImageRequestsQueue. Current queue count: %lu", buf, 0x20u);
        }
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 64);
        uint64_t v15 = *(void *)(a1 + 32);
        v47.receiver = *(id *)(a1 + 48);
        v47.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v47, sel_postEvent_entity_data_, v15, v14, v13, v43.receiver, v43.super_class);
      }
      else if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventEnqueueReactionEffect"])
      {
        id v16 = v3[42];
        if (!v16)
        {
          uint64_t v17 = [MEMORY[0x263EFF980] array];
          id v18 = v3[42];
          v3[42] = (id)v17;

          id v16 = v3[42];
        }
        id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ReactionType"];
        [v16 addObject:v19];

        uint64_t v20 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 48);
          id v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ReactionType"];
          uint64_t v23 = [v3[42] count];
          *(_DWORD *)buf = 138543874;
          uint64_t v49 = v21;
          __int16 v50 = 2112;
          __int16 v51 = v22;
          __int16 v52 = 2048;
          uint64_t v53 = v23;
          _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Added request %@ to reactionRequestsQueue. Current queue count: %lu", buf, 0x20u);
        }
        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v25 = *(void *)(a1 + 64);
        uint64_t v26 = *(void *)(a1 + 32);
        v46.receiver = *(id *)(a1 + 48);
        v46.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v46, sel_postEvent_entity_data_, v26, v25, v24, v43.receiver, v43.super_class);
      }
      else if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventStopStream"])
      {
        [v3 scheduleSendingInvalidFramesAfterTimeout:0];
        __int16 v27 = +[CMContinuityCaptureSessionStateManager sharedInstance];
        __int16 v28 = [v27 activeSession];

        if (v28)
        {
          BOOL v29 = +[CMContinuityCaptureSessionStateManager sharedInstance];
          uint64_t v30 = [v29 activeSession];
          id v31 = [*(id *)(a1 + 48) activeConfiguration];
          [v30 logPowerLoggingEvent:0 configuration:v31];
        }
        uint64_t v32 = *(void *)(a1 + 40);
        uint64_t v33 = *(void *)(a1 + 64);
        uint64_t v34 = *(void *)(a1 + 32);
        v45.receiver = *(id *)(a1 + 48);
        v45.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v45, sel_postEvent_entity_data_, v34, v33, v32, v43.receiver, v43.super_class);
      }
      else if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventStartStream"])
      {
        [v3 scheduleSendingInvalidFramesAfterTimeout:1];
        uint64_t v35 = *(void *)(a1 + 40);
        uint64_t v36 = *(void *)(a1 + 64);
        uint64_t v37 = *(void *)(a1 + 32);
        v44.receiver = *(id *)(a1 + 48);
        v44.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v44, sel_postEvent_entity_data_, v37, v36, v35);
        id v38 = +[CMContinuityCaptureSessionStateManager sharedInstance];
        __int16 v39 = [v38 activeSession];

        if (v39)
        {
          uint64_t v40 = +[CMContinuityCaptureSessionStateManager sharedInstance];
          uint64_t v41 = [v40 activeSession];
          unint64_t v42 = [*(id *)(a1 + 48) activeConfiguration];
          [v41 logPowerLoggingEvent:1 configuration:v42];
        }
      }
      else
      {
        objc_msgSendSuper2(&v43, sel_postEvent_entity_data_, *(void *)(a1 + 32), *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48), CMContinuityCaptureVideoDevice);
      }
    }
  }
}

- (void)scheduleResumeUserNotification:(BOOL)a3
{
  v23[6] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    id v5 = [v4 deviceModel];
    BOOL v6 = continuityCaptureNotificationCenter_isiPhone(v5);

    id v7 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    id v8 = @"RESUME_NOTIFICATION_TITLE_IPAD";
    if (v6) {
      id v8 = @"RESUME_NOTIFICATION_TITLE_IPHONE";
    }
    v22[0] = @"kContinuityCaptureNotificationKeyTitle";
    v22[1] = @"kContinuityCaptureNotificationKeyBody";
    id v9 = @"RESUME_NOTIFICATION_BODY_IPAD";
    if (v6) {
      id v9 = @"RESUME_NOTIFICATION_BODY_IPHONE";
    }
    v23[0] = v8;
    v23[1] = v9;
    v22[2] = @"kContinuityCaptureNotificationKeyIdentifier";
    uint64_t v10 = NSString;
    id v20 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    id v11 = [v20 deviceIdentifier];
    uint64_t v12 = [v11 UUIDString];
    uint64_t v13 = [v10 stringWithFormat:@"%@%@", @"CMContinuityCaptureResumeNotification", v12];
    v23[2] = v13;
    v23[3] = MEMORY[0x263EFFA88];
    v22[3] = @"kContinuityCaptureNotificationKeyOneTime";
    v22[4] = @"kContinuityCaptureNotificationKeyDeviceModel";
    uint64_t v14 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    uint64_t v15 = [v14 deviceModel];
    v23[4] = v15;
    v22[5] = @"kContinuityCaptureNotificationKeyDeviceIdentifier";
    id v16 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    uint64_t v17 = [v16 deviceIdentifier];
    id v18 = [v17 UUIDString];
    v23[5] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];
    [v7 scheduleNotification:3 data:v19];
  }
  else
  {
    id v21 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v21 unscheduleNotification:3];
  }
}

- (void)scheduleDeviceBusyNotification:(BOOL)a3
{
  v26[7] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    id v5 = [v4 deviceModel];
    BOOL v6 = continuityCaptureNotificationCenter_isiPhone(v5);

    id v7 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    v25[0] = @"kContinuityCaptureNotificationKeyTitle";
    v25[1] = @"kContinuityCaptureNotificationKeyBody";
    id v8 = @"DEVICE_BUSY_UNABLE_TO_CONNECT_IPAD";
    if (v6) {
      id v8 = @"DEVICE_BUSY_UNABLE_TO_CONNECT_IPHONE";
    }
    v26[0] = @"DEVICE_BUSY_UNABLE_TO_CONNECT";
    v26[1] = v8;
    v25[2] = @"kContinuityCaptureNotificationKeyBodyArgs";
    id v22 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    id v21 = [v22 deviceName];
    uint64_t v24 = v21;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v26[2] = v20;
    v25[3] = @"kContinuityCaptureNotificationKeyIdentifier";
    id v9 = NSString;
    id v19 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    uint64_t v10 = [v19 deviceIdentifier];
    id v11 = [v10 UUIDString];
    uint64_t v12 = [v9 stringWithFormat:@"%@%@", @"CMContinuityCaptureSessionBusyNotification", v11];
    v26[3] = v12;
    v26[4] = MEMORY[0x263EFFA80];
    v25[4] = @"kContinuityCaptureNotificationKeyOneTime";
    v25[5] = @"kContinuityCaptureNotificationKeyDeviceModel";
    uint64_t v13 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    uint64_t v14 = [v13 deviceModel];
    v26[5] = v14;
    v25[6] = @"kContinuityCaptureNotificationKeyDeviceIdentifier";
    uint64_t v15 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    id v16 = [v15 deviceIdentifier];
    uint64_t v17 = [v16 UUIDString];
    v26[6] = v17;
    id v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];
    [v7 scheduleNotification:11 data:v18];
  }
  else
  {
    id v23 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v23 unscheduleNotification:11];
  }
}

- (void)startSendingInvalidFrames
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (!self->_blackFrameDispatchTimer)
  {
    uint64_t v3 = [(CMContinuityCaptureDeviceBase *)self queue];
    id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
    blackFrameDispatchTimer = self->_blackFrameDispatchTimer;
    self->_blackFrameDispatchTimer = v4;

    BOOL v6 = self->_blackFrameDispatchTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke;
    handler[3] = &unk_264C990F8;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_blackFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume((dispatch_object_t)self->_blackFrameDispatchTimer);
    objc_destroyWeak(&v13);
  }
  id v7 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v8 = [v7 maxFrameRate];

  if (v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)CMContinuityCaptureVideoDevice;
    [(CMContinuityCaptureDeviceBase *)&v11 startSendingInvalidFrames];
    id v9 = self->_blackFrameDispatchTimer;
    uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    dispatch_source_set_timer(v9, 0, 1000 * (0xF4240 / [v10 maxFrameRate]), 0);
  }
  objc_destroyWeak(&location);
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke(uint64_t a1)
{
  sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = v1;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = v1;
  *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = v1;
  *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = v1;
  CMSampleBufferRef sampleBufferOut = 0;
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (id *)WeakRetained;
  if (WeakRetained)
  {
    id v5 = (CFTypeRef *)(WeakRetained + 38);
    if (WeakRetained[38] || (uint64_t v6 = [WeakRetained createBlackSampleBuffer], (*v5 = (CFTypeRef)v6) != 0))
    {
      if (CMContinityCaptureDebugLogEnabled())
      {
        id v7 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_3(v2);
        }
      }
      sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      int64_t HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
      CMTimeMake(&sampleTimingArray.presentationTimeStamp, HostTimeInNanoSec, 1000000000);
      id v9 = [v4 activeConfiguration];
      CMTimeMake(&v12, 1, [v9 maxFrameRate]);
      sampleTimingArray.CMTime duration = v12;

      CFAllocatorRef v10 = CFGetAllocator(*v5);
      CMSampleBufferCreateCopyWithNewTiming(v10, (CMSampleBufferRef)*v5, 1, &sampleTimingArray, &sampleBufferOut);
      if (sampleBufferOut)
      {
        objc_msgSend(v4[31], "dispatchFrame:entity:completion:", sampleBufferOut, objc_msgSend(v4, "entity"), &__block_literal_global_231);
        CFRelease(sampleBufferOut);
        goto LABEL_13;
      }
      objc_super v11 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_2(v2);
      }
    }
    else
    {
      if (!CMContinityCaptureDebugLogEnabled()) {
        goto LABEL_13;
      }
      objc_super v11 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_1(v2);
      }
    }
  }
LABEL_13:
}

- (void)stopSendingInvalidFrames
{
  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v4 stopSendingInvalidFrames];
  blackFrameDispatchTimer = self->_blackFrameDispatchTimer;
  if (blackFrameDispatchTimer) {
    dispatch_source_set_timer(blackFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  }
}

- (void)restartSendingInvalidFramesIfApplicable
{
  blackFrameSampleBuffer = self->_blackFrameSampleBuffer;
  if (blackFrameSampleBuffer)
  {
    CFRelease(blackFrameSampleBuffer);
    self->_blackFrameSampleBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v4 restartSendingInvalidFramesIfApplicable];
}

- (void)stateMachineStartSendingBlurredFrames
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!self->_blurredFrameTimerActive)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = self;
      __int16 v20 = 2080;
      id v21 = "-[CMContinuityCaptureVideoDevice stateMachineStartSendingBlurredFrames]";
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

    if (!self->_blurredFrameDispatchTimer)
    {
      objc_super v4 = [(CMContinuityCaptureDeviceBase *)self queue];
      id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);
      blurredFrameDispatchTimer = self->_blurredFrameDispatchTimer;
      self->_blurredFrameDispatchTimer = v5;

      id v7 = self->_blurredFrameDispatchTimer;
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke;
      uint64_t v15 = &unk_264C990F8;
      objc_copyWeak(&v16, &location);
      dispatch_source_set_event_handler(v7, &v12);
      dispatch_source_set_timer((dispatch_source_t)self->_blurredFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      dispatch_resume((dispatch_object_t)self->_blurredFrameDispatchTimer);
      objc_destroyWeak(&v16);
    }
    int v8 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
    BOOL v9 = [v8 maxFrameRate] == 0;

    if (!v9)
    {
      CFAllocatorRef v10 = self->_blurredFrameDispatchTimer;
      objc_super v11 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      dispatch_source_set_timer(v10, 0, 1000 * (0xF4240 / [v11 maxFrameRate]), 0);
    }
    self->_blurredFrameTimerActive = 1;
    objc_destroyWeak(&location);
  }
}

void __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke(uint64_t a1)
{
  sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = v1;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = v1;
  *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = v1;
  *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = v1;
  CMSampleBufferRef sampleBufferOut = 0;
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = (id *)WeakRetained;
  if (WeakRetained)
  {
    id v5 = (CFTypeRef *)(WeakRetained + 37);
    if (WeakRetained[37]
      || (uint64_t v6 = [WeakRetained createBlurredSampleBuffer], (*v5 = (CFTypeRef)v6) != 0)
      || (uint64_t v7 = [v4 createBlackSampleBuffer], (*v5 = (CFTypeRef)v7) != 0))
    {
      if (CMContinityCaptureDebugLogEnabled())
      {
        int v8 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_3(v2);
        }
      }
      sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      int64_t HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
      CMTimeMake(&sampleTimingArray.presentationTimeStamp, HostTimeInNanoSec, 1000000000);
      CFAllocatorRef v10 = [v4 activeConfiguration];
      CMTimeMake(&v13, 1, [v10 maxFrameRate]);
      sampleTimingArray.CMTime duration = v13;

      CFAllocatorRef v11 = CFGetAllocator(*v5);
      CMSampleBufferCreateCopyWithNewTiming(v11, (CMSampleBufferRef)*v5, 1, &sampleTimingArray, &sampleBufferOut);
      if (sampleBufferOut)
      {
        objc_msgSend(v4[31], "dispatchFrame:entity:completion:", sampleBufferOut, objc_msgSend(v4, "entity"), &__block_literal_global_240);
        CFRelease(sampleBufferOut);
        goto LABEL_14;
      }
      uint64_t v12 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_2(v2);
      }
    }
    else
    {
      if (!CMContinityCaptureDebugLogEnabled()) {
        goto LABEL_14;
      }
      uint64_t v12 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_1(v2);
      }
    }
  }
LABEL_14:
}

- (void)stateMachineStopSendingBlurredFrames
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_blurredFrameTimerActive)
  {
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543618;
      uint64_t v6 = self;
      __int16 v7 = 2080;
      int v8 = "-[CMContinuityCaptureVideoDevice stateMachineStopSendingBlurredFrames]";
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
    }

    blurredFrameDispatchTimer = self->_blurredFrameDispatchTimer;
    if (blurredFrameDispatchTimer) {
      dispatch_source_set_timer(blurredFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    }
    self->_blurredFrameTimerActive = 0;
  }
}

- (void)completeImageCaptureRequest:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  if (v5)
  {
    uint64_t v6 = [(CMContinuityCaptureDeviceBase *)self queue];
    dispatch_assert_queue_V2(v6);

    if (![(NSMutableArray *)self->_stillImageRequestsQueue count])
    {
      __int16 v7 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureVideoDevice completeImageCaptureRequest:]();
      }
      goto LABEL_28;
    }
    __int16 v7 = [(NSMutableArray *)self->_stillImageRequestsQueue firstObject];
    [(NSMutableArray *)self->_stillImageRequestsQueue removeObjectAtIndex:0];
    int v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138412802;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2112;
      *(void *)((char *)&buf.flags + 2) = v4;
      HIWORD(buf.epoch) = 2112;
      uint64_t v33 = (uint64_t)v7;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ completeImageCaptureRequest with error %@. Removed %@ from queue", (uint8_t *)&buf, 0x20u);
    }

    if (v4)
    {
      uint64_t v9 = [v7 error];

      if (!v9) {
        [v7 setError:v4];
      }
    }
    CFAllocatorRef v10 = [v7 completionHandler];

    if (!v10)
    {
LABEL_24:
      uint64_t v26 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = [v7 completionHandler];
        __int16 v28 = (void *)MEMORY[0x237DFB780]();
        uint64_t v29 = [v7 uniqueID];
        uint64_t v30 = [v7 error];
        LODWORD(buf.value) = 138413314;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
        LOWORD(buf.flags) = 2048;
        *(void *)((char *)&buf.flags + 2) = v28;
        HIWORD(buf.epoch) = 2048;
        uint64_t v33 = v29;
        __int16 v34 = 2048;
        uint64_t v35 = v10;
        __int16 v36 = 2112;
        uint64_t v37 = v30;
        _os_log_impl(&dword_235FC2000, v26, OS_LOG_TYPE_DEFAULT, "%@ Called %p for completed image capture request ID:%lld. sbuf:%p error:%@", (uint8_t *)&buf, 0x34u);
      }
      if (v10) {
        CFRelease(v10);
      }
LABEL_28:

      goto LABEL_29;
    }
    CFAllocatorRef v11 = [v7 error];
    if (v11)
    {

      CFAllocatorRef v10 = 0;
LABEL_23:
      uint64_t v24 = [v7 completionHandler];
      uint64_t v25 = [v7 error];
      ((void (**)(void, opaqueCMSampleBuffer *, uint64_t))v24)[2](v24, v10, [v25 code]);

      goto LABEL_24;
    }
    CFAllocatorRef v10 = [v7 imageFileData];

    if (!v10) {
      goto LABEL_23;
    }
    CMTimeValue value = *MEMORY[0x263F01090];
    uint64_t v31 = *(void *)(MEMORY[0x263F01090] + 8);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x263F01090] + 16);
    uint64_t v14 = [v5 client];
    uint64_t v15 = [v14 timeSyncClock];
    if (v15)
    {
      id v16 = (void *)v15;
      uint64_t v17 = [v7 networkTimestamp];

      if (v17)
      {
        id v18 = [v5 client];
        id v19 = [v18 timeSyncClock];
        __int16 v20 = [v7 networkTimestamp];
        uint64_t v21 = objc_msgSend(v19, "machAbsoluteTimeForDomainTime:", objc_msgSend(v20, "unsignedLongLongValue"));

        uint64_t v22 = v31;
        if (v21 != *MEMORY[0x263F7F270])
        {
          CMClockMakeHostTimeFromSystemUnits(&buf, v21);
          CMTimeValue value = buf.value;
          CMTimeEpoch epoch = buf.epoch;
          uint64_t v22 = *(void *)&buf.timescale;
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v22 = v31;
LABEL_20:
    if ((v22 & 0x100000000) == 0)
    {
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&buf, HostTimeClock);
      CMTimeValue value = buf.value;
      CMTimeEpoch epoch = buf.epoch;
      uint64_t v22 = *(void *)&buf.timescale;
    }
    buf.CMTimeValue value = value;
    *(void *)&buf.CMTimeScale timescale = v22;
    buf.CMTimeEpoch epoch = epoch;
    CFAllocatorRef v10 = [(CMContinuityCaptureVideoDevice *)self _createStillImageDataBufferFromRequest:v7 timestamp:&buf];
    goto LABEL_23;
  }
LABEL_29:
}

- (opaqueCMSampleBuffer)_createStillImageDataBufferFromRequest:(id)a3 timestamp:(id *)a4
{
  id v5 = a3;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef v19 = 0;
  dataPointerOut = (char *)0xAAAAAAAAAAAAAAAALL;
  CMBlockBufferRef blockBufferOut = 0;
  sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.CMTimeScale timescale = v6;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.CMTimeValue value = v6;
  *(_OWORD *)&sampleTimingArray.duration.CMTimeValue value = v6;
  *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = v6;
  __int16 v7 = [v5 imageFileData];
  if ([v7 length])
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (CMBlockBufferCreateWithMemoryBlock(v8, 0, [v7 length], v8, 0, 0, objc_msgSend(v7, "length"), 1u, &blockBufferOut))
    {
      CMTime v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.5();
      }
    }
    else if (CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut))
    {
      CMTime v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.4();
      }
    }
    else
    {
      uint64_t v9 = dataPointerOut;
      id v10 = v7;
      memcpy(v9, (const void *)[v10 bytes], objc_msgSend(v10, "length"));
      sampleTimingArray.presentationTimeStamp = (CMTime)*a4;
      sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      size_t sampleSizeArray = CMBlockBufferGetDataLength(blockBufferOut);
      if (CMVideoFormatDescriptionCreate(v8, [v5 imageCodecType], objc_msgSend(v5, "imageWidth"), objc_msgSend(v5, "imageHeight"), 0, &formatDescriptionOut))
      {
        CMTime v13 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:]();
        }
      }
      else
      {
        if (!CMSampleBufferCreate(v8, blockBufferOut, 1u, 0, 0, formatDescriptionOut, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v19))goto LABEL_6; {
        CMTime v13 = CMContinuityCaptureLog(2);
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:]();
        }
      }
    }
  }
  else
  {
    CMTime v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:]();
    }
  }

LABEL_6:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  CFAllocatorRef v11 = v19;

  return v11;
}

- (void)stateMachineImageCapture
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%@ Got action from state machine to capture still image but couldn't find enqueued request", v2, v3, v4, v5, v6);
}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_cold_1(v1);
    }

    uint64_t v4 = (void *)WeakRetained[43];
    WeakRetained[43] = 0;

    [WeakRetained postActionOfType:12 forEvent:0 option:0];
  }
}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_241(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint8_t v6 = WeakRetained;
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
    uint64_t v3 = (void *)v6[43];
    v6[43] = 0;

    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v4 && [v4 code]) {
      uint64_t v5 = 12;
    }
    else {
      uint64_t v5 = 13;
    }
    [v6 postActionOfType:v5 forEvent:0 option:0];
    id WeakRetained = v6;
  }
}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    dispatch_group_leave(v5[43]);
    id WeakRetained = v5;
  }
}

- (void)stateMachineEnqueueReactionEffect
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%@ Got action from state machine to perform reaction effect but couldn't find enqueued request", v2, v3, v4, v5, v6);
}

void __67__CMContinuityCaptureVideoDevice_stateMachineEnqueueReactionEffect__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained postActionOfType:13 forEvent:0 option:0];
}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = v8;
  switch(a3)
  {
    case 1uLL:
      uint64_t v10 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
      if (v10)
      {
        CFAllocatorRef v11 = (void *)v10;
        [(CMContinuityCaptureVideoDevice *)self stateMachineStopSendingBlurredFrames];
        self->_canIssueStateMismatchEvent = 1;
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&v49, HostTimeClock);
        self->_streamStartsTime = ($95D729B680665BEAEFA1D6FCA8238556)v49;

        goto LABEL_42;
      }
      goto LABEL_43;
    case 2uLL:
      self->_numberOfFramesDispatched = 0;
      CMTime v13 = (_OWORD *)MEMORY[0x263F01090];
      self->_streamStartsTime.CMTimeEpoch epoch = *(void *)(MEMORY[0x263F01090] + 16);
      *(_OWORD *)&self->_streamStartsTime.CMTimeValue value = *v13;
      [(CMContinuityCaptureDeviceBase *)self scheduleSendingInvalidFramesAfterTimeout:0];
      if ([(CMContinuityCaptureDeviceBase *)self entity] == 1)
      {
        uint64_t v14 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        uint64_t v15 = [v14 forcefulCenterStageEnablementType];

        if (v15 == 1) {
          [(CMContinuityCaptureVideoDevice *)self restoreAffectedClientsCenterStageState];
        }
      }
      if (a5 == 1) {
        goto LABEL_42;
      }
      id v16 = [(CMContinuityCaptureDeviceBase *)self capabilities];
      uint64_t v17 = [v16 controls];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
      id obj = v18;
      if (!v19) {
        goto LABEL_40;
      }
      uint64_t v20 = v19;
      unint64_t v42 = a5;
      uint64_t v21 = *(void *)v46;
      break;
    case 4uLL:
      [(CMContinuityCaptureVideoDevice *)self stateMachineImageCapture];
      goto LABEL_42;
    case 5uLL:
      [(CMContinuityCaptureVideoDevice *)self stateMachineEnqueueReactionEffect];
      goto LABEL_42;
    case 6uLL:
      uint64_t v26 = [v8 data];
      if (v26)
      {
        __int16 v27 = (void *)v26;
        __int16 v28 = [v9 data];
        uint64_t v29 = [v28 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];

        if (v29)
        {
          uint64_t v30 = [v9 data];
          uint64_t v31 = [v30 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyOption"];
          a5 |= [v31 integerValue];
        }
      }
      if ((a5 & 2) != 0)
      {
        [(CMContinuityCaptureDeviceBase *)self scheduleSendingInvalidFramesAfterTimeout:0];
        [(CMContinuityCaptureVideoDevice *)self stateMachineStartSendingBlurredFrames];
      }
      if ((a5 & 4) != 0)
      {
        uint64_t v32 = [v9 data];
        if (!v32) {
          goto LABEL_37;
        }
        uint64_t v33 = (void *)v32;
        __int16 v34 = [v9 data];
        uint64_t v35 = [v34 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyPostTime"];

        if (v35)
        {
          __int16 v36 = [v9 data];
          uint64_t v37 = [v36 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyPostTime"];
          unint64_t v38 = [v37 unsignedLongLongValue];

          if (v38 > [(CMContinuityCaptureDeviceBase *)self cameraCaptureStackStartTime]
            || v38 > [(CMContinuityCaptureDeviceBase *)self avCaptureStackStartTime])
          {
            [(CMContinuityCaptureVideoDevice *)self stopCaptureStack:4 completion:&__block_literal_global_243];
          }
        }
        else
        {
LABEL_37:
          [(CMContinuityCaptureDeviceBase *)self cameraCaptureStackStartTime];
          [(CMContinuityCaptureDeviceBase *)self avCaptureStackStartTime];
        }
      }
      goto LABEL_42;
    case 7uLL:
      if ((a5 & 0x40) == 0) {
        goto LABEL_42;
      }
      goto LABEL_36;
    case 8uLL:
      __int16 v39 = [v8 name];
      int v40 = [v39 isEqualToString:@"kCMContinuityCaptureEventUserPause"];

      if (v40) {
        [(CMContinuityCaptureVideoDevice *)self scheduleResumeUserNotification:1];
      }
      [(CMContinuityCaptureVideoDevice *)self stateMachineStartSendingBlurredFrames];
      goto LABEL_42;
    case 9uLL:
      [(CMContinuityCaptureVideoDevice *)self scheduleResumeUserNotification:0];
LABEL_36:
      [(CMContinuityCaptureVideoDevice *)self stateMachineStopSendingBlurredFrames];
      goto LABEL_42;
    default:
LABEL_42:
      v44.receiver = self;
      v44.super_class = (Class)CMContinuityCaptureVideoDevice;
      [(CMContinuityCaptureDeviceBase *)&v44 postActionOfType:a3 forEvent:v9 option:a5];
LABEL_43:

      return;
  }
  while (1)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v46 != v21) {
        objc_enumerationMutation(v18);
      }
      id v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      uint64_t v24 = objc_msgSend(v23, "name", v42);
      char v25 = [v24 isEqualToString:@"4cc_cfri_glob_0000"];

      if (v25)
      {
        id v18 = v23;

        a5 = v42;
        if (v18)
        {
          uint64_t v41 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          [v41 setCenterStageRectOfInterest:0x26E96A868];

          [v18 setValue:0x26E96A868];
          [(CMContinuityCaptureCMIOVideoDevice *)self->_cmioCaptureDevice setValueForControl:v18 completion:0];
LABEL_40:
        }
        goto LABEL_42;
      }
    }
    uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (!v20)
    {
      a5 = v42;
      goto LABEL_40;
    }
  }
}

- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"kCMContinuityCaptureEventImageCapture"])
  {
    [(CMContinuityCaptureVideoDevice *)self completeImageCaptureRequest:v10];
  }
  else if ([v8 isEqualToString:@"kCMContinuityCaptureEventStopStream"])
  {
    self->_canIssueStateMismatchEvent = 0;
    self->_failedBufferCountDueToMismatchState = 0;
    CFAllocatorRef v11 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    objc_msgSend(v11, "stopStream:option:completion:", -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0, &__block_literal_global_247);
  }
  v12.receiver = self;
  v12.super_class = (Class)CMContinuityCaptureVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v12 postActionCompletionForEventName:v8 eventData:v9 error:v10];
}

- (id)controls
{
  return [(CMContinuityCaptureCMIOVideoDevice *)self->_cmioCaptureDevice controls];
}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  __int16 v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__CMContinuityCaptureVideoDevice_didCaptureStillImage_entity___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a4;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureVideoDevice_didCaptureStillImage_entity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _didCaptureStillImage:*(void *)(a1 + 32) entity:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)_didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v6);

  __int16 v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got back still image %@", (uint8_t *)&v15, 0x16u);
  }

  id v8 = [(NSMutableArray *)self->_stillImageRequestsQueue firstObject];
  uint64_t v9 = [v8 uniqueID];
  if (v9 == [v5 uniqueID])
  {
    objc_msgSend(v8, "setCaptureComplete:", objc_msgSend(v5, "captureComplete"));
    id v10 = [v5 error];
    [v8 setError:v10];

    CFAllocatorRef v11 = [v5 networkTimestamp];
    [v8 setNetworkTimestamp:v11];

    objc_super v12 = [v5 imageFileData];
    [v8 setImageFileData:v12];

    objc_msgSend(v8, "setImageCodecType:", objc_msgSend(v5, "imageCodecType"));
    objc_msgSend(v8, "setImageWidth:", objc_msgSend(v5, "imageWidth"));
    objc_msgSend(v8, "setImageHeight:", objc_msgSend(v5, "imageHeight"));
    stillImageCaptureGroup = self->_stillImageCaptureGroup;
    if (stillImageCaptureGroup) {
      dispatch_group_leave(stillImageCaptureGroup);
    }
  }
  else
  {
    uint64_t v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543874;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_235FC2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Got back still image for an unknown request. inflight:%@ received:%@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMTime v13 = [(CMContinuityCaptureDeviceBase *)self queue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  id v17[2] = __81__CMContinuityCaptureVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_264C99238;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21[1] = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _observeValueForKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) change:*(void *)(a1 + 48) context:*(void *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (CMContinityCaptureDebugLogEnabled())
  {
    id v12 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138413058;
      __int16 v27 = self;
      __int16 v28 = 2080;
      uint64_t v29 = "-[CMContinuityCaptureVideoDevice _observeValueForKeyPath:ofObject:change:context:]";
      __int16 v30 = 2112;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_debug_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEBUG, "%@ %s forKeyPath: %@ ofObject: %@", (uint8_t *)&v26, 0x2Au);
    }
  }
  if ([v9 isEqualToString:@"active"])
  {
    uint64_t v13 = *MEMORY[0x263F081B8];
    id v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if ([v14 BOOLValue])
    {
    }
    else
    {
      uint64_t v21 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      int v22 = [v21 BOOLValue];

      if (v22)
      {
        id v23 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138543362;
          __int16 v27 = self;
          _os_log_impl(&dword_235FC2000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ active 1 -> 0", (uint8_t *)&v26, 0xCu);
        }

        [(CMContinuityCaptureVideoDevice *)self stopCaptureStack:4 completion:&__block_literal_global_251];
        goto LABEL_23;
      }
    }
    id v15 = [v11 objectForKeyedSubscript:v13];
    if (([v15 BOOLValue] & 1) == 0)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v24 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    char v25 = [v24 BOOLValue];

    if ((v25 & 1) == 0)
    {
      id v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543362;
        __int16 v27 = self;
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ active 0 -> 1", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_22;
    }
  }
  else if ([v9 isEqualToString:@"currentState"])
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v16 = (void *)MEMORY[0x263F016E0];
    __int16 v17 = [(CMContinuityCaptureDeviceBase *)self stateMachineCurrentState];
    id v18 = [v17 name];
    id v19 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
    id v20 = [v16 propertyStateWithValue:v18 attributes:v19];

    if (v20) {
      [v15 setObject:v20 forKeyedSubscript:@"CMIOExtensionPropertyContinuityCaptureDeviceState"];
    }
    if ([v15 count]) {
      [(CMIOExtensionDevice *)self->_cmioCaptureDevice notifyPropertiesChanged:v15];
    }

    goto LABEL_22;
  }
LABEL_23:
}

- (void)terminateComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)CMContinuityCaptureVideoDevice;
  [(CMContinuityCaptureDeviceBase *)&v6 terminateComplete:&__block_literal_global_253];
  [(CMContinuityCaptureCMIOVideoDevice *)self->_cmioCaptureDevice terminateComplete:v4];
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = [(CMContinuityCaptureDeviceBase *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke;
  v10[3] = &unk_264C99198;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke(id *a1)
{
  uint64_t v310 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained) {
    goto LABEL_4;
  }
  id v3 = a1 + 4;
  if ([a1[4] entity] == 4) {
    goto LABEL_3;
  }
  id v4 = [*v3 name];
  int v5 = [v4 isEqualToString:@"4cc_cfen_glob_0000"];

  if (v5)
  {
    id v6 = a1[5];
    id v7 = [a1[4] value];
    objc_msgSend(v6, "updateForcefulCenterStageEnablementStateIfNeededWithCenterStageEnabled:", objc_msgSend(v7, "BOOLValue"));

    id v8 = [WeakRetained activeConfiguration];
    LODWORD(v7) = [v8 centerStageEnabled];
    id v9 = [a1[4] value];
    int v10 = [v9 BOOLValue];

    if (v7 != v10)
    {
      id v11 = [*v3 value];
      uint64_t v12 = [v11 BOOLValue];
      id v13 = [WeakRetained activeConfiguration];
      [v13 setCenterStageEnabled:v12];

      id v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [WeakRetained activeConfiguration];
        int v16 = [v15 centerStageEnabled];
        *(double *)&__int16 v17 = COERCE_DOUBLE("Off");
        if (v16) {
          *(double *)&__int16 v17 = COERCE_DOUBLE("On");
        }
        *(_DWORD *)CMTime buf = 138543618;
        v303 = WeakRetained;
        __int16 v304 = 2080;
        double v305 = *(double *)&v17;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageEnabled %s", buf, 0x16u);
      }
      id v18 = [WeakRetained transportDevice];
      [v18 setValueForControl:*v3 completion:0];

      id v19 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      id v20 = [v19 activeSession];

      if (v20)
      {
        uint64_t v21 = +[CMContinuityCaptureSessionStateManager sharedInstance];
        int v22 = [v21 activeSession];
        uint64_t v23 = [a1[5] streaming];
        uint64_t v24 = [a1[5] activeConfiguration];
        [v22 logPowerLoggingEvent:v23 configuration:v24];
      }
    }
    goto LABEL_3;
  }
  char v25 = [*v3 name];
  int v26 = [v25 isEqualToString:@"4cc_cfac_glob_0000"];

  if (v26) {
    goto LABEL_3;
  }
  __int16 v27 = [*v3 name];
  if ([v27 isEqualToString:@"4cc_cfri_glob_0000"]
    && ([*v3 value], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v29 = (void *)v28;
    __int16 v30 = [*v3 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v32 = [*v3 value];
      id v33 = [WeakRetained activeConfiguration];
      [v33 setCenterStageRectOfInterest:v32];

      uint64_t v34 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = [WeakRetained activeConfiguration];
        double v36 = [v35 centerStageRectOfInterest];
        *(_DWORD *)CMTime buf = 138543618;
        v303 = WeakRetained;
        __int16 v304 = 2112;
        double v305 = v36;
        _os_log_impl(&dword_235FC2000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageRectOfInterest %@", buf, 0x16u);

LABEL_25:
      }
LABEL_26:

      [WeakRetained[31] setValueForControl:*v3 completion:0];
LABEL_27:
      long long v46 = [WeakRetained transportDevice];
      [v46 setValueForControl:*v3 completion:0];
LABEL_28:

      goto LABEL_4;
    }
  }
  else
  {
  }
  uint64_t v37 = [*v3 name];
  int v38 = [v37 isEqualToString:@"4cc_cffm_glob_0000"];

  id v39 = *v3;
  if (v38)
  {
    int v40 = [v39 value];
    uint64_t v41 = (int)[v40 intValue];
    unint64_t v42 = [WeakRetained activeConfiguration];
    [v42 setCenterStageFramingMode:v41];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2048;
    double v305 = COERCE_DOUBLE([v35 centerStageFramingMode]);
    objc_super v43 = "%{public}@ CenterStageControlMode %ld";
    goto LABEL_23;
  }
  long long v47 = [v39 name];
  int v48 = [v47 isEqualToString:@"FaceDetectionEnabled"];

  if (v48)
  {
    CMTime v49 = [WeakRetained activeConfiguration];
    int v50 = [v49 faceDetectionEnabled];
    uint64_t v51 = [*v3 value];
    int v52 = [v51 BOOLValue];

    if (v50 == v52) {
      goto LABEL_4;
    }
    uint64_t v53 = [*v3 value];
    uint64_t v54 = [v53 BOOLValue];
    __int16 v55 = [WeakRetained activeConfiguration];
    [v55 setFaceDetectionEnabled:v54];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v56 = [v35 faceDetectionEnabled];
    *(double *)&uint64_t v57 = COERCE_DOUBLE("Off");
    if (v56) {
      *(double *)&uint64_t v57 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v57;
    objc_super v43 = "%{public}@ FaceDetectionEnabled %s";
    goto LABEL_23;
  }
  v58 = [*v3 name];
  int v59 = [v58 isEqualToString:@"HumanBodyDetectionEnabled"];

  if (v59)
  {
    v60 = [WeakRetained activeConfiguration];
    int v61 = [v60 humanBodyDetectionEnabled];
    v62 = [*v3 value];
    int v63 = [v62 BOOLValue];

    if (v61 == v63) {
      goto LABEL_4;
    }
    v64 = [*v3 value];
    uint64_t v65 = [v64 BOOLValue];
    v66 = [WeakRetained activeConfiguration];
    [v66 setHumanBodyDetectionEnabled:v65];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v67 = [v35 humanBodyDetectionEnabled];
    *(double *)&v68 = COERCE_DOUBLE("Off");
    if (v67) {
      *(double *)&v68 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v68;
    objc_super v43 = "%{public}@ HumanBodyDetectionEnabled %s";
    goto LABEL_23;
  }
  v69 = [*v3 name];
  int v70 = [v69 isEqualToString:@"HumanFullBodyDetectionEnabled"];

  if (v70)
  {
    v71 = [WeakRetained activeConfiguration];
    int v72 = [v71 humanFullBodyDetectionEnabled];
    v73 = [*v3 value];
    int v74 = [v73 BOOLValue];

    if (v72 == v74) {
      goto LABEL_4;
    }
    v75 = [*v3 value];
    uint64_t v76 = [v75 BOOLValue];
    v77 = [WeakRetained activeConfiguration];
    [v77 setHumanFullBodyDetectionEnabled:v76];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v78 = [v35 humanFullBodyDetectionEnabled];
    *(double *)&v79 = COERCE_DOUBLE("Off");
    if (v78) {
      *(double *)&v79 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v79;
    objc_super v43 = "%{public}@ HumanFullBodyDetectionEnabled %s";
    goto LABEL_23;
  }
  v80 = [*v3 name];
  int v81 = [v80 isEqualToString:@"AsyncStillCaptureEnabled"];

  if (v81)
  {
    v82 = [WeakRetained activeConfiguration];
    int v83 = [v82 asyncStillCaptureEnabled];
    v84 = [*v3 value];
    int v85 = [v84 BOOLValue];

    if (v83 == v85) {
      goto LABEL_4;
    }
    v86 = [*v3 value];
    uint64_t v87 = [v86 BOOLValue];
    v88 = [WeakRetained activeConfiguration];
    [v88 setAsyncStillCaptureEnabled:v87];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v89 = [v35 asyncStillCaptureEnabled];
    *(double *)&v90 = COERCE_DOUBLE("Off");
    if (v89) {
      *(double *)&v90 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v90;
    objc_super v43 = "%{public}@ AsyncStillCaptureEnabled %s";
    goto LABEL_23;
  }
  v91 = [*v3 name];
  int v92 = [v91 isEqualToString:@"SuppressVideoEffects"];

  if (v92)
  {
    v93 = [WeakRetained activeConfiguration];
    int v94 = [v93 suppressVideoEffects];
    v95 = [*v3 value];
    int v96 = [v95 BOOLValue];

    if (v94 == v96) {
      goto LABEL_4;
    }
    v97 = [*v3 value];
    uint64_t v98 = [v97 BOOLValue];
    v99 = [WeakRetained activeConfiguration];
    [v99 setSuppressVideoEffects:v98];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v100 = [v35 suppressVideoEffects];
    *(double *)&v101 = COERCE_DOUBLE("Off");
    if (v100) {
      *(double *)&v101 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v101;
    objc_super v43 = "%{public}@ SuppressVideoEffects %s";
    goto LABEL_23;
  }
  v102 = [*v3 name];
  int v103 = [v102 isEqualToString:@"PortraitEffectEnabled"];

  if (v103)
  {
    v104 = [WeakRetained activeConfiguration];
    int v105 = [v104 portraitEffectEnabled];
    v106 = [*v3 value];
    int v107 = [v106 BOOLValue];

    if (v105 == v107) {
      goto LABEL_4;
    }
    v108 = [*v3 value];
    uint64_t v109 = [v108 BOOLValue];
    v110 = [WeakRetained activeConfiguration];
    [v110 setPortraitEffectEnabled:v109];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v111 = [v35 portraitEffectEnabled];
    *(double *)&v112 = COERCE_DOUBLE("Off");
    if (v111) {
      *(double *)&v112 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v112;
    objc_super v43 = "%{public}@ PortraitEffectEnabled %s";
    goto LABEL_23;
  }
  v113 = [*v3 name];
  int v114 = [v113 isEqualToString:@"VideoZoomFactor"];

  id v115 = *v3;
  if (v114)
  {
    v116 = [v115 value];
    [v116 doubleValue];
    double v118 = v117;

    v119 = [WeakRetained activeConfiguration];
    [v119 videoZoomFactor];
    double v121 = v120;

    if (v121 == v118) {
      goto LABEL_4;
    }
    v122 = [WeakRetained activeConfiguration];
    [v122 setVideoZoomFactor:v118];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    [v35 videoZoomFactor];
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2048;
    double v305 = v123;
    objc_super v43 = "%{public}@ VideoZoomFactor %.2f";
    goto LABEL_23;
  }
  v124 = [v115 name];
  int v125 = [v124 isEqualToString:@"StudioLightingEnabled"];

  if (v125)
  {
    v126 = [WeakRetained activeConfiguration];
    int v127 = [v126 studioLightingEnabled];
    v128 = [*v3 value];
    int v129 = [v128 BOOLValue];

    if (v127 == v129) {
      goto LABEL_4;
    }
    v130 = [*v3 value];
    uint64_t v131 = [v130 BOOLValue];
    v132 = [WeakRetained activeConfiguration];
    [v132 setStudioLightingEnabled:v131];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v133 = [v35 studioLightingEnabled];
    *(double *)&v134 = COERCE_DOUBLE("Off");
    if (v133) {
      *(double *)&v134 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v134;
    objc_super v43 = "%{public}@ StudioLightingEnabled %s";
    goto LABEL_23;
  }
  v135 = [*v3 name];
  int v136 = [v135 isEqualToString:@"ReactionEffectsEnabled"];

  if (v136)
  {
    v137 = [WeakRetained activeConfiguration];
    int v138 = [v137 reactionEffectsEnabled];
    v139 = [*v3 value];
    int v140 = [v139 BOOLValue];

    if (v138 == v140) {
      goto LABEL_4;
    }
    v141 = [*v3 value];
    uint64_t v142 = [v141 BOOLValue];
    v143 = [WeakRetained activeConfiguration];
    [v143 setReactionEffectsEnabled:v142];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v144 = [v35 reactionEffectsEnabled];
    *(double *)&v145 = COERCE_DOUBLE("Off");
    if (v144) {
      *(double *)&v145 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v145;
    objc_super v43 = "%{public}@ ReactionEffectsEnabled %s";
    goto LABEL_23;
  }
  v146 = [*v3 name];
  int v147 = [v146 isEqualToString:@"BackgroundReplacementEnabled"];

  if (v147)
  {
    v148 = [WeakRetained activeConfiguration];
    int v149 = [v148 backgroundReplacementEnabled];
    v150 = [*v3 value];
    int v151 = [v150 BOOLValue];

    if (v149 == v151) {
      goto LABEL_4;
    }
    v152 = [*v3 value];
    uint64_t v153 = [v152 BOOLValue];
    v154 = [WeakRetained activeConfiguration];
    [v154 setBackgroundReplacementEnabled:v153];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    int v155 = [v35 backgroundReplacementEnabled];
    *(double *)&v156 = COERCE_DOUBLE("Off");
    if (v155) {
      *(double *)&v156 = COERCE_DOUBLE("On");
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = *(double *)&v156;
    objc_super v43 = "%{public}@ BackgroundReplacementEnabled %s";
    goto LABEL_23;
  }
  v157 = [*v3 name];
  int v158 = [v157 isEqualToString:@"AsyncStillCaptureConfigurations"];

  id v159 = *v3;
  if (v158)
  {
    v160 = [v159 value];
    v161 = [WeakRetained activeConfiguration];
    [v161 setAsyncStillCaptureConfigs:v160];

    v162 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      v163 = [WeakRetained activeConfiguration];
      double v164 = [v163 asyncStillCaptureConfigs];
      *(_DWORD *)CMTime buf = 138543618;
      v303 = WeakRetained;
      __int16 v304 = 2112;
      double v305 = v164;
      _os_log_impl(&dword_235FC2000, v162, OS_LOG_TYPE_DEFAULT, "%{public}@ AsyncStillCaptureConfigs %@", buf, 0x16u);
    }
    goto LABEL_103;
  }
  v165 = [v159 name];
  int v166 = [v165 isEqualToString:@"OverheadCameraMode"];

  if (v166)
  {
    v167 = [WeakRetained activeConfiguration];
    uint64_t v168 = [v167 deskViewCameraMode];
    v169 = [*v3 value];
    int v170 = [v169 unsignedIntValue];

    if (v168 == v170) {
      goto LABEL_4;
    }
    v171 = [*v3 value];
    uint64_t v172 = [v171 unsignedIntValue];
    v173 = [WeakRetained activeConfiguration];
    [v173 setDeskViewCameraMode:v172];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 1024;
    LODWORD(v305) = [v35 deskViewCameraMode];
    objc_super v43 = "%{public}@ DeskViewCameraMode %u";
    goto LABEL_94;
  }
  v174 = [*v3 name];
  int v175 = [v174 isEqualToString:@"StartPanningAtPoint"];

  if (v175)
  {
    v301.CGFloat x = NAN;
    v301.CGFloat y = NAN;
    CFDictionaryRef v176 = [*v3 value];
    CGPointMakeWithDictionaryRepresentation(v176, &v301);

    v162 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138544130;
      v303 = WeakRetained;
      __int16 v304 = 2080;
      double v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
      __int16 v306 = 2048;
      CGFloat x = v301.x;
      __int16 v308 = 2048;
      CGFloat y = v301.y;
      v177 = "%{public}@ (%s) StartPanningAtPoint {%.3f, %.3f}";
LABEL_101:
      v181 = v162;
      uint32_t v182 = 42;
LABEL_102:
      _os_log_impl(&dword_235FC2000, v181, OS_LOG_TYPE_DEFAULT, v177, buf, v182);
      goto LABEL_103;
    }
    goto LABEL_103;
  }
  v178 = [*v3 name];
  int v179 = [v178 isEqualToString:@"PanWithTranslation"];

  if (v179)
  {
    v301.CGFloat x = NAN;
    v301.CGFloat y = NAN;
    CFDictionaryRef v180 = [*v3 value];
    CGPointMakeWithDictionaryRepresentation(v180, &v301);

    v162 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138544130;
      v303 = WeakRetained;
      __int16 v304 = 2080;
      double v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
      __int16 v306 = 2048;
      CGFloat x = v301.x;
      __int16 v308 = 2048;
      CGFloat y = v301.y;
      v177 = "%{public}@ (%s) PanWithTransaltion {%.3f, %.3f}";
      goto LABEL_101;
    }
LABEL_103:

    goto LABEL_27;
  }
  v183 = [*v3 name];
  int v184 = [v183 isEqualToString:@"PerformOneShotFraming"];

  if (v184)
  {
    v162 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_103;
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
    v177 = "%{public}@ (%s) PerformOneShotFraming";
    goto LABEL_110;
  }
  v185 = [*v3 name];
  int v186 = [v185 isEqualToString:@"ResetFraming"];

  if (v186)
  {
    v162 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_103;
    }
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
    v177 = "%{public}@ (%s) ResetFraming";
LABEL_110:
    v181 = v162;
    uint32_t v182 = 22;
    goto LABEL_102;
  }
  v187 = [*v3 name];
  int v188 = [v187 isEqualToString:@"CenterStageFieldOfViewRestrictedToWide"];

  id v189 = *v3;
  if (v188)
  {
    v190 = [v189 value];
    uint64_t v191 = [v190 BOOLValue];

    v192 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138543874;
      v303 = WeakRetained;
      __int16 v304 = 2080;
      double v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
      __int16 v306 = 1024;
      LODWORD(x) = v191;
      _os_log_impl(&dword_235FC2000, v192, OS_LOG_TYPE_DEFAULT, "%{public}@ (%s) CenterStageFieldOfViewRestrictedToWide %d", buf, 0x1Cu);
    }

    v193 = [WeakRetained transportDevice];
    [v193 setValueForControl:*v3 completion:0];

    v194 = [WeakRetained activeConfiguration];
    [v194 setCenterStageFieldOfViewRestrictedToWide:v191];

    [WeakRetained updateForcefulCenterStageEnablementStateIfNeededWithCenterStageRestrictedToWide:v191];
    goto LABEL_4;
  }
  v195 = [v189 name];
  int v196 = [v195 isEqualToString:@"ManualFramingDeviceType"];

  id v197 = *v3;
  if (v196)
  {
    v198 = [v197 value];
    uint64_t v199 = [v198 integerValue];

    v200 = [WeakRetained activeConfiguration];
    uint64_t v201 = [v200 manualFramingDeviceType];

    if (v201 == v199) {
      goto LABEL_4;
    }
    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = +[CMContinuityCaptureConfiguration stringForManualFramingDeviceType:v199];
    *(_DWORD *)CMTime buf = 138543874;
    v303 = WeakRetained;
    __int16 v304 = 2080;
    double v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
    __int16 v306 = 2112;
    CGFloat x = *(double *)&v35;
    objc_super v43 = "%{public}@ (%s) ManualFramingDeviceType %@";
    objc_super v44 = v34;
    uint32_t v45 = 32;
    goto LABEL_24;
  }
  v202 = [v197 name];
  int v203 = [v202 isEqualToString:@"CMIOExtensionPropertyStreamFrameDuration"];

  if (v203)
  {
    v204 = [WeakRetained activeConfiguration];
    int v205 = [v204 maxFrameRate];
    v206 = [*v3 value];
    int v207 = [v206 unsignedIntValue];

    if (v205 != v207)
    {
      v208 = [*v3 value];
      uint64_t v209 = [v208 unsignedIntValue];
      v210 = [WeakRetained activeConfiguration];
      [v210 setMaxFrameRate:v209];

      v211 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
      {
        v212 = [WeakRetained activeConfiguration];
        *(_DWORD *)CMTime buf = 138543618;
        v303 = WeakRetained;
        __int16 v304 = 1024;
        LODWORD(v305) = [v212 maxFrameRate];
        _os_log_impl(&dword_235FC2000, v211, OS_LOG_TYPE_DEFAULT, "%{public}@ MaxFrameRate %u", buf, 0x12u);
      }
      [WeakRetained[31] setValueForControl:*v3 completion:0];
      v213 = [WeakRetained transportDevice];
      [v213 setValueForControl:*v3 completion:0];

LABEL_124:
      [WeakRetained restartSendingInvalidFramesIfApplicable];
      goto LABEL_4;
    }
LABEL_3:
    [WeakRetained[31] setValueForControl:*v3 completion:0];
    goto LABEL_4;
  }
  v214 = [*v3 name];
  int v215 = [v214 isEqualToString:@"CMIOExtensionPropertyStreamMaxFrameDuration"];

  if (v215)
  {
    v216 = [WeakRetained activeConfiguration];
    int v217 = [v216 minFrameRate];
    v218 = [*v3 value];
    int v219 = [v218 unsignedIntValue];

    if (v217 != v219)
    {
      v220 = [*v3 value];
      uint64_t v221 = [v220 unsignedIntValue];
      v222 = [WeakRetained activeConfiguration];
      [v222 setMinFrameRate:v221];

      uint64_t v34 = CMContinuityCaptureLog(2);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      uint64_t v35 = [WeakRetained activeConfiguration];
      *(_DWORD *)CMTime buf = 138543618;
      v303 = WeakRetained;
      __int16 v304 = 1024;
      LODWORD(v305) = [v35 minFrameRate];
      objc_super v43 = "%{public}@ MinFrameRate %u";
      goto LABEL_94;
    }
    goto LABEL_3;
  }
  v223 = [*v3 name];
  int v224 = [v223 isEqualToString:@"ActiveFormat"];

  if (!v224)
  {
    v235 = [*v3 name];
    int v236 = [v235 isEqualToString:@"PortraitEffectAperture"];

    if (v236)
    {
      v237 = [WeakRetained activeConfiguration];
      [v237 portraitEffectAperture];
      float v239 = v238;
      v240 = [*v3 value];
      [v240 floatValue];
      float v242 = v241;

      if (v239 == v242) {
        goto LABEL_4;
      }
      v243 = [*v3 value];
      [v243 floatValue];
      int v245 = v244;
      v246 = [WeakRetained activeConfiguration];
      LODWORD(v247) = v245;
      [v246 setPortraitEffectAperture:v247];

      uint64_t v34 = CMContinuityCaptureLog(2);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      uint64_t v35 = [WeakRetained activeConfiguration];
      [v35 portraitEffectAperture];
      *(_DWORD *)CMTime buf = 138543618;
      v303 = WeakRetained;
      __int16 v304 = 2048;
      double v305 = v248;
      objc_super v43 = "%{public}@ PortraitEffectAperture %f";
      goto LABEL_23;
    }
    v249 = [*v3 name];
    int v250 = [v249 isEqualToString:@"StudioLightingIntensity"];

    if (v250)
    {
      v251 = [WeakRetained activeConfiguration];
      [v251 studioLightingIntensity];
      float v253 = v252;
      v254 = [*v3 value];
      [v254 floatValue];
      float v256 = v255;

      if (v253 == v256) {
        goto LABEL_4;
      }
      v257 = [*v3 value];
      [v257 floatValue];
      int v259 = v258;
      v260 = [WeakRetained activeConfiguration];
      LODWORD(v261) = v259;
      [v260 setStudioLightingIntensity:v261];

      uint64_t v34 = CMContinuityCaptureLog(2);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      uint64_t v35 = [WeakRetained activeConfiguration];
      [v35 studioLightingIntensity];
      *(_DWORD *)CMTime buf = 138543618;
      v303 = WeakRetained;
      __int16 v304 = 2048;
      double v305 = v262;
      objc_super v43 = "%{public}@ StudioLightingIntensity %f";
      goto LABEL_23;
    }
    v281 = [*v3 name];
    int v282 = [v281 isEqualToString:@"GesturesEnabled"];

    if (!v282)
    {
      v290 = [*v3 name];
      int v291 = [v290 isEqualToString:@"ReactionsInProgress"];

      if (v291)
      {
        v292 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
        {
          double v293 = [*v3 value];
          *(_DWORD *)CMTime buf = 138543618;
          v303 = WeakRetained;
          __int16 v304 = 2112;
          double v305 = v293;
          _os_log_impl(&dword_235FC2000, v292, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionsInProgress %@", buf, 0x16u);
        }
        goto LABEL_3;
      }
      v294 = [*v3 name];
      int v295 = [v294 isEqualToString:@"BackgroundReplacementPixelBuffer"];

      if (!v295)
      {
        long long v46 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke_cold_1();
        }
        goto LABEL_28;
      }
      v296 = [WeakRetained activeConfiguration];
      uint64_t v297 = [v296 backgroundReplacementPixelBuffer];
      v298 = [*v3 value];

      if ((void *)v297 == v298) {
        goto LABEL_4;
      }
      v299 = [*v3 value];
      v300 = [WeakRetained activeConfiguration];
      [v300 setBackgroundReplacementPixelBuffer:v299];

      uint64_t v34 = CMContinuityCaptureLog(2);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      uint64_t v35 = [WeakRetained activeConfiguration];
      *(_DWORD *)CMTime buf = 138543618;
      v303 = WeakRetained;
      __int16 v304 = 2112;
      double v305 = COERCE_DOUBLE([v35 backgroundReplacementPixelBuffer]);
      objc_super v43 = "%{public}@ BackgroundReplacementPixelBuffer %@";
LABEL_23:
      objc_super v44 = v34;
      uint32_t v45 = 22;
LABEL_24:
      _os_log_impl(&dword_235FC2000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
      goto LABEL_25;
    }
    v283 = [WeakRetained activeConfiguration];
    int v284 = [v283 reactionEffectGesturesEnabled];
    v285 = [*v3 value];
    int v286 = [v285 BOOLValue];

    if (v284 == v286) {
      goto LABEL_4;
    }
    v287 = [*v3 value];
    uint64_t v288 = [v287 BOOLValue];
    v289 = [WeakRetained activeConfiguration];
    [v289 setReactionEffectGesturesEnabled:v288];

    uint64_t v34 = CMContinuityCaptureLog(2);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v35 = [WeakRetained activeConfiguration];
    *(_DWORD *)CMTime buf = 138543618;
    v303 = WeakRetained;
    __int16 v304 = 1024;
    LODWORD(v305) = [v35 reactionEffectGesturesEnabled];
    objc_super v43 = "%{public}@ ReactionEffectGesturesEnabled %d";
LABEL_94:
    objc_super v44 = v34;
    uint32_t v45 = 18;
    goto LABEL_24;
  }
  v225 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
  {
    v226 = [WeakRetained activeConfiguration];
    double v227 = [v226 format];
    v228 = [*v3 value];
    *(_DWORD *)CMTime buf = 138543874;
    v303 = WeakRetained;
    __int16 v304 = 2114;
    double v305 = v227;
    __int16 v306 = 2114;
    CGFloat x = *(double *)&v228;
    _os_log_impl(&dword_235FC2000, v225, OS_LOG_TYPE_DEFAULT, "%{public}@ format change %{public}@ to %{public}@", buf, 0x20u);
  }
  v229 = [WeakRetained activeConfiguration];
  v230 = [v229 format];
  if (v230)
  {
    v231 = [WeakRetained activeConfiguration];
    v232 = [v231 format];
    v233 = [*v3 value];
    int v234 = [v232 isEqual:v233] ^ 1;
  }
  else
  {
    int v234 = 0;
  }

  v263 = [*v3 value];
  v264 = [WeakRetained activeConfiguration];
  [v264 setFormat:v263];

  v265 = [WeakRetained activeConfiguration];
  v266 = [v265 format];
  uint64_t v267 = [v266 maxFrameRate];
  v268 = [WeakRetained activeConfiguration];
  [v268 setMaxFrameRate:v267];

  v269 = [WeakRetained activeConfiguration];
  v270 = [v269 format];
  uint64_t v271 = [v270 maxFrameRate];
  v272 = [WeakRetained activeConfiguration];
  [v272 setMinFrameRate:v271];

  if (v234 && [WeakRetained streaming])
  {
    v273 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      v274 = [WeakRetained activeConfiguration];
      double v275 = [v274 format];
      *(_DWORD *)CMTime buf = 138543618;
      v303 = WeakRetained;
      __int16 v304 = 2114;
      double v305 = v275;
      _os_log_impl(&dword_235FC2000, v273, OS_LOG_TYPE_DEFAULT, "%{public}@ format changed to %{public}@", buf, 0x16u);
    }
    v276 = [WeakRetained compositeDelegate];
    objc_msgSend(v276, "postEvent:entity:data:", @"kCMContinuityCaptureEventForceRestartStream", objc_msgSend(WeakRetained, "entity"), 0);

    goto LABEL_124;
  }
  v277 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v277, OS_LOG_TYPE_DEFAULT))
  {
    v278 = [WeakRetained activeConfiguration];
    double v279 = [v278 format];
    int v280 = [WeakRetained streaming];
    *(_DWORD *)CMTime buf = 138543874;
    v303 = WeakRetained;
    __int16 v304 = 2114;
    double v305 = v279;
    __int16 v306 = 1024;
    LODWORD(x) = v280;
    _os_log_impl(&dword_235FC2000, v277, OS_LOG_TYPE_DEFAULT, "%{public}@ format unchanged %{public}@ or invalid stream state %d", buf, 0x1Cu);
  }
LABEL_4:
}

- (id)debugInfo
{
  return 0;
}

- (CMContinuityCaptureVideoDevice)companionDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_companionDevice);
  return (CMContinuityCaptureVideoDevice *)WeakRetained;
}

- (void)setCompanionDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_companionDevice);
  objc_storeStrong((id *)&self->_stillImageCaptureGroup, 0);
  objc_storeStrong((id *)&self->_pendingReactionRequests, 0);
  objc_storeStrong((id *)&self->_stillImageRequestsQueue, 0);
  objc_storeStrong((id *)&self->_blackFrameDispatchTimer, 0);
  objc_storeStrong((id *)&self->_blurredFrameDispatchTimer, 0);
  objc_storeStrong(&self->_stopCompletionBlock, 0);
  objc_storeStrong((id *)&self->_avcStreamOutput, 0);
  objc_storeStrong((id *)&self->_avcVideoStream, 0);
  objc_storeStrong((id *)&self->_cmioCaptureDevice, 0);
  objc_storeStrong((id *)&self->_centerStageStateRestorationDataArray, 0);
  objc_storeStrong((id *)&self->_avcStreamCallID, 0);
}

- (void)initWithCapabilities:compositeDelegate:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ Invalid CMIO capture device ", v2, v3, v4, v5, v6);
}

- (void)createBlurredSampleBuffer
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_235FC2000, v0, v1, "%@ Failed to create sample buffer %u");
}

- (void)dispatchFrame:entity:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_235FC2000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ networkTimeClockIdentity identity %llx", v2, 0x16u);
}

- (void)createAVCVideoStream
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCVideoStream create error %@");
}

- (void)newVideoStreamCurrentConfiguration
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCMediaStreamConfig error %@");
}

- (void)startAVConferenceStack:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCVideoStream %p Invalid configuration");
}

- (void)startAVConferenceStack:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCStreamOutput create error %@");
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_235FC2000, v2, v3, "%@ Failed to get Black Sample buffer", v4, v5, v6, v7, v8);
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_235FC2000, v2, v3, "%@ Invalid sample buffer to send", v4, v5, v6, v7, v8);
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  CMContinuityCaptureGetHostTimeInNanoSec();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_235FC2000, v2, v3, "%@ DispatchBlackFrame %llu %p", v4, v5, v6, v7, v8);
}

void __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_235FC2000, v2, v3, "%@ Failed to get Blurred Sample buffer", v4, v5, v6, v7, v8);
}

void __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  CMContinuityCaptureGetHostTimeInNanoSec();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_235FC2000, v2, v3, "%@ DispatchFakeFrame %llu %p", v4, v5, v6, v7, v8);
}

- (void)completeImageCaptureRequest:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%@ completeImageCaptureRequest got called with error %@, but still image requests queue is empty");
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "Called with nil imageFileData %@", v2, v3, v4, v5, v6);
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_235FC2000, v0, v1, "CMSampleBufferCreate(stillImageData) failed (%d)", v2, v3, v4, v5, v6);
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_235FC2000, v0, v1, "CMVideoFormatDescriptionCreate(stillImageData) failed (%d)", v2, v3, v4, v5, v6);
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_235FC2000, v0, v1, "CMBlockBufferGetDataPointer failed (%d)", v2, v3, v4, v5, v6);
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.5()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_235FC2000, v0, v1, "CMBlockBufferCreateWithMemoryBlock failed (%d)", v2, v3, v4, v5, v6);
}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_235FC2000, v2, v3, "%@ still image capture hit timeout. Notifying state machine that the action is complete.", v4, v5, v6, v7, v8);
}

void __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ unhandled control %{public}@");
}

@end