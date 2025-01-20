@interface AVSampleBufferAudioRenderer
+ (id)currentFigAudioRendererFactory;
+ (id)makeRendererLoggingIdentifier;
+ (id)sampleBufferAudioRenderer;
+ (void)setFigAudioRendererFactory:(id)a3 forQueue:(id)a4;
- (AVAudioSpatializationFormats)allowedAudioSpatializationFormats;
- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (AVQueuedSampleBufferRenderingStatus)status;
- (AVSampleBufferAudioRenderer)init;
- (BOOL)_attachedToExternalContentKeySession;
- (BOOL)hasSufficientMediaDataForReliablePlaybackStart;
- (BOOL)isDefunct;
- (BOOL)isMuted;
- (BOOL)isReadyForMoreMediaData;
- (BOOL)mayRequireContentKeysForMediaDataProcessing;
- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4;
- (BOOL)willTrimShortDurationSamples;
- (NSError)error;
- (NSString)audioOutputDeviceUniqueID;
- (OpaqueCMTimebase)timebase;
- (float)volume;
- (id)audioSession;
- (id)contentKeySession;
- (id)loggingIdentifier;
- (id)outputContext;
- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5;
- (int)_initializeTimebase;
- (int)_installNotificationHandlers;
- (opaqueMTAudioProcessingTap)audioTapProcessor;
- (void)_transitionToFailedStatusWithOSStatus:(int)a3;
- (void)_transitionToStatus:(int64_t)a3 error:(id)a4;
- (void)_triggerMediaRequestCallback;
- (void)_uninstallNotificationHandlers;
- (void)_wasFlushedAutomaticallyAtTime:(id *)a3;
- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3;
- (void)dealloc;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)flush;
- (void)flushFromSourceTime:(CMTime *)time completionHandler:(void *)completionHandler;
- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4;
- (void)setAllowedAudioSpatializationFormats:(AVAudioSpatializationFormats)allowedAudioSpatializationFormats;
- (void)setAudioOutputDeviceUniqueID:(NSString *)audioOutputDeviceUniqueID;
- (void)setAudioSession:(id)a3;
- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3;
- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (void)setLoggingIdentifier:(id)a3;
- (void)setMuted:(BOOL)muted;
- (void)setOutputContext:(id)a3;
- (void)setSTSLabel:(id)a3;
- (void)setVolume:(float)volume;
- (void)stopRequestingMediaData;
@end

@implementation AVSampleBufferAudioRenderer

- (int)_initializeTimebase
{
  CMTimebaseRef timebaseOut = 0;
  HostTimeClock = CMClockGetHostTimeClock();
  int OnlyTimebase = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
  if (!OnlyTimebase) {
    int OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
  }
  int v4 = OnlyTimebase;
  if (timebaseOut) {
    CFRelease(timebaseOut);
  }
  return v4;
}

- (void)_triggerMediaRequestCallback
{
  MEMORY[0x199715030](self->_audioRendererInternal->mediaDataRequester.mutex, a2);
  v3 = self->_audioRendererInternal->mediaDataRequester.requester;
  MEMORY[0x199715040](self->_audioRendererInternal->mediaDataRequester.mutex);
  [(AVMediaDataRequester *)v3 startRequestingMediaData];
}

- (void)_wasFlushedAutomaticallyAtTime:(id *)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  v6 = @"AVSampleBufferAudioRendererFlushTimeKey";
  v7[0] = [MEMORY[0x1E4F29238] valueWithCMTime:&v5];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification", self, v4);
}

- (int)_installNotificationHandlers
{
  self->_audioRendererInternal->weakReferenceToSelf = [[AVWeakReference alloc] initWithReferencedObject:self];
  if (!self->_audioRendererInternal->weakReferenceToSelf) {
    return -12786;
  }
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v3 addListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererNowBelowLowWaterLevelNotificationHandler name:*MEMORY[0x1E4F345A0] object:self->_audioRendererInternal->figAudioRenderer flags:0];
  [v3 addListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererWasFlushedAutomaticallyNotificationHandler name:*MEMORY[0x1E4F345C8] object:self->_audioRendererInternal->figAudioRenderer flags:0];
  [v3 addListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererRebuildCouldBenefitFidelityNotificationHandler name:*MEMORY[0x1E4F345A8] object:self->_audioRendererInternal->figAudioRenderer flags:0];
  [v3 addListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererServerDied name:*MEMORY[0x1E4F21770] object:self->_audioRendererInternal->figAudioRenderer flags:0];
  [v3 addListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererServerDied name:*MEMORY[0x1E4F345B0] object:self->_audioRendererInternal->figAudioRenderer flags:0];
  return 0;
}

- (void)_uninstallNotificationHandlers
{
  if (self->_audioRendererInternal->weakReferenceToSelf)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v3 removeListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererNowBelowLowWaterLevelNotificationHandler name:*MEMORY[0x1E4F345A0] object:self->_audioRendererInternal->figAudioRenderer];
    [v3 removeListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererWasFlushedAutomaticallyNotificationHandler name:*MEMORY[0x1E4F345C8] object:self->_audioRendererInternal->figAudioRenderer];
    [v3 removeListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererRebuildCouldBenefitFidelityNotificationHandler name:*MEMORY[0x1E4F345A8] object:self->_audioRendererInternal->figAudioRenderer];
    [v3 removeListenerWithWeakReference:self->_audioRendererInternal->weakReferenceToSelf callback:avqsbar_figRendererServerDied name:*MEMORY[0x1E4F21770] object:self->_audioRendererInternal->figAudioRenderer];
    audioRendererInternal = self->_audioRendererInternal;
    weakReferenceToSelf = audioRendererInternal->weakReferenceToSelf;
    uint64_t v6 = *MEMORY[0x1E4F345B0];
    figAudioRenderer = audioRendererInternal->figAudioRenderer;
    [v3 removeListenerWithWeakReference:weakReferenceToSelf callback:avqsbar_figRendererServerDied name:v6 object:figAudioRenderer];
  }
}

- (id)outputContext
{
  CFTypeRef cf = 0;
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(figAudioRenderer, *MEMORY[0x1E4F34630], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v7 = cf;
  if (v6)
  {
    id v8 = 0;
    if (!cf) {
      return v8;
    }
    goto LABEL_7;
  }
  id v8 = +[AVOutputContext outputContextForID:cf];
  CFTypeRef v7 = cf;
  if (cf) {
LABEL_7:
  }
    CFRelease(v7);
  return v8;
}

- (void)setOutputContext:(id)a3
{
  if (!a3)
  {
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"outputContext != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (self->_audioRendererInternal->outputContext != a3)
  {
    uint64_t v10 = [a3 contextID];
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    v14 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, void, uint64_t))(v13 + 56);
    if (v14)
    {
      if (!v14(figAudioRenderer, *MEMORY[0x1E4F34630], v10))
      {

        self->_audioRendererInternal->outputContext = (AVOutputContext *)a3;
      }
    }
  }
}

- (AVSampleBufferAudioRenderer)init
{
  uint64_t v3 = (void *)[(id)objc_opt_class() currentFigAudioRendererFactory];
  uint64_t v12 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    uint64_t v5 = Mutable;
    v11.receiver = self;
    v11.super_class = (Class)AVSampleBufferAudioRenderer;
    self = [(AVSampleBufferAudioRenderer *)&v11 init];
    if (!self) {
      goto LABEL_11;
    }
    uint64_t v6 = objc_alloc_init(AVSampleBufferAudioRendererInternal);
    self->_audioRendererInternal = v6;
    if (!v6) {
      goto LABEL_11;
    }
    CFRetain(v6);
    self->_audioRendererInternal->mediaDataRequester.mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (!self->_audioRendererInternal->mediaDataRequester.mutex) {
      goto LABEL_11;
    }
    if ([(AVSampleBufferAudioRenderer *)self _initializeTimebase]) {
      goto LABEL_11;
    }
    self->_audioRendererInternal->rate = 0.0;
    self->_audioRendererInternal->volume = 1.0;
    self->_audioRendererInternal->muted = 0;
    self->_audioRendererInternal->audioOutputDeviceUniqueID = 0;
    self->_audioRendererInternal->outputContext = 0;
    self->_audioRendererInternal->loggingIdentifier = (AVLoggingIdentifier *)+[AVSampleBufferAudioRenderer makeRendererLoggingIdentifier];
    CFDictionarySetValue(v5, (const void *)*MEMORY[0x1E4F34578], (const void *)[(AVLoggingIdentifier *)self->_audioRendererInternal->loggingIdentifier name]);
    self->_audioRendererInternal->figAudioRenderer = (OpaqueFigSampleBufferAudioRenderer *)[v3 createAudioRendererWithAllocator:0 options:v5 error:&v12];
    if (!self->_audioRendererInternal->figAudioRenderer) {
      goto LABEL_11;
    }
    int v7 = dyld_program_sdk_at_least();
    id v8 = &AVAudioTimePitchAlgorithmTimeDomain;
    if (!v7) {
      id v8 = &AVAudioTimePitchAlgorithmLowQualityZeroLatency;
    }
    [(AVSampleBufferAudioRenderer *)self setAudioTimePitchAlgorithm:*v8];
    self->_audioRendererInternal->allowedAudioSpatializationFormats = 4;
    if (![(AVSampleBufferAudioRenderer *)self _installNotificationHandlers]) {
      v9 = self;
    }
    else {
LABEL_11:
    }
      v9 = 0;
    CFRelease(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)sampleBufferAudioRenderer
{
  v2 = objc_alloc_init(AVSampleBufferAudioRenderer);
  return v2;
}

- (void)dealloc
{
  audioRendererInternal = self->_audioRendererInternal;
  if (audioRendererInternal)
  {

    uint64_t v4 = self->_audioRendererInternal;
    if (v4->mediaDataRequester.mutex)
    {
      FigSimpleMutexDestroy();
      self->_audioRendererInternal->mediaDataRequester.mutex = 0;
      uint64_t v4 = self->_audioRendererInternal;
    }
    [(AVMediaDataRequester *)v4->mediaDataRequester.requester invalidate];

    [(AVSampleBufferAudioRenderer *)self _uninstallNotificationHandlers];
    uint64_t v5 = self->_audioRendererInternal;
    figAudioRenderer = v5->figAudioRenderer;
    if (figAudioRenderer)
    {
      CFRelease(figAudioRenderer);
      self->_audioRendererInternal->figAudioRenderer = 0;
      uint64_t v5 = self->_audioRendererInternal;
    }
    audioProcessingTap = v5->audioProcessingTap;
    if (audioProcessingTap)
    {
      CFRelease(audioProcessingTap);
      self->_audioRendererInternal->audioProcessingTap = 0;
      uint64_t v5 = self->_audioRendererInternal;
    }

    id v8 = self->_audioRendererInternal;
    readOnlyControlTimebase = v8->readOnlyControlTimebase;
    if (readOnlyControlTimebase)
    {
      CFRelease(readOnlyControlTimebase);
      self->_audioRendererInternal->readOnlyControlTimebase = 0;
      id v8 = self->_audioRendererInternal;
    }
    lastCryptor = v8->lastCryptor;
    if (lastCryptor)
    {
      CFRelease(lastCryptor);
      id v8 = self->_audioRendererInternal;
    }
    lastFormatDescription = v8->lastFormatDescription;
    if (lastFormatDescription)
    {
      CFRelease(lastFormatDescription);
      id v8 = self->_audioRendererInternal;
    }

    CFRelease(self->_audioRendererInternal);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVSampleBufferAudioRenderer;
  [(AVSampleBufferAudioRenderer *)&v12 dealloc];
}

- (void)setAudioSession:(id)a3
{
  if (!a3)
  {
    v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"audioSession != nil"), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  [a3 opaqueSessionID];
  uint64_t SInt32 = FigCFNumberCreateSInt32();
  if (SInt32)
  {
    objc_super v11 = (const void *)SInt32;
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    v15 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, void, const void *))(v14 + 56);
    if (v15 && !v15(figAudioRenderer, *MEMORY[0x1E4F345E8], v11))
    {
      id v16 = a3;

      self->_audioRendererInternal->audioSession = (AVAudioSession *)a3;
    }
    CFRelease(v11);
  }
}

- (id)audioSession
{
  id result = self->_audioRendererInternal->audioSession;
  if (!result)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F153E0];
    return (id)[v3 sharedInstance];
  }
  return result;
}

- (void)_transitionToStatus:(int64_t)a3 error:(id)a4
{
  if (self->_audioRendererInternal->status < a3)
  {
    [(AVSampleBufferAudioRenderer *)self willChangeValueForKey:@"status"];
    if (a4)
    {
      uint64_t v7 = @"error";
      [(AVSampleBufferAudioRenderer *)self willChangeValueForKey:@"error"];
      self->_audioRendererInternal->status = a3;
      self->_audioRendererInternal->error = (NSError *)a4;
      [(AVSampleBufferAudioRenderer *)self didChangeValueForKey:@"status"];
    }
    else
    {
      self->_audioRendererInternal->status = a3;
      self->_audioRendererInternal->error = 0;
      uint64_t v7 = @"status";
    }
    [(AVSampleBufferAudioRenderer *)self didChangeValueForKey:v7];
  }
}

- (void)_transitionToFailedStatusWithOSStatus:(int)a3
{
  uint64_t v4 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  [(AVSampleBufferAudioRenderer *)self _transitionToStatus:2 error:v4];
}

- (AVQueuedSampleBufferRenderingStatus)status
{
  return self->_audioRendererInternal->status;
}

- (NSError)error
{
  v2 = self->_audioRendererInternal->error;
  return v2;
}

- (void)setAudioOutputDeviceUniqueID:(NSString *)audioOutputDeviceUniqueID
{
  if (!audioOutputDeviceUniqueID)
  {
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"audioOutputDeviceUniqueID != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (!-[NSString isEqualToString:](self->_audioRendererInternal->audioOutputDeviceUniqueID, "isEqualToString:"))
  {
    uint64_t FigBaseObject = FigSampleBufferAudioRendererGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(unsigned int (**)(uint64_t, void, NSString *))(v12 + 56);
    if (v13)
    {
      if (!v13(FigBaseObject, *MEMORY[0x1E4F345D0], audioOutputDeviceUniqueID))
      {
        uint64_t v14 = (NSString *)[(NSString *)audioOutputDeviceUniqueID copy];

        self->_audioRendererInternal->audioOutputDeviceUniqueID = v14;
      }
    }
  }
}

- (NSString)audioOutputDeviceUniqueID
{
  return self->_audioRendererInternal->audioOutputDeviceUniqueID;
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  if (!audioTimePitchAlgorithm)
  {
    id v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"newAudioTimePitchAlgorithm != nil"), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if (!-[NSString isEqualToString:](self->_audioRendererInternal->audioTimePitchAlgorithm, "isEqualToString:"))
  {
    if ([(NSString *)audioTimePitchAlgorithm isEqualToString:@"LowQualityZeroLatency"]) {
      AVAudioTimePitchAlgorithm v10 = (AVAudioTimePitchAlgorithm)*MEMORY[0x1E4F34660];
    }
    else {
      AVAudioTimePitchAlgorithm v10 = audioTimePitchAlgorithm;
    }
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, void, AVAudioTimePitchAlgorithm))(v13 + 56);
    if (v14)
    {
      if (!v14(figAudioRenderer, *MEMORY[0x1E4F345F0], v10))
      {
        v15 = (NSString *)[(NSString *)audioTimePitchAlgorithm copy];

        self->_audioRendererInternal->audioTimePitchAlgorithm = v15;
      }
    }
  }
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  v2 = self->_audioRendererInternal->audioTimePitchAlgorithm;
  return v2;
}

- (BOOL)willTrimShortDurationSamples
{
  CFBooleanRef BOOLean = 0;
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, void, void, CFBooleanRef *))(v4 + 48);
  if (!v5) {
    return 1;
  }
  int v6 = v5(figAudioRenderer, *MEMORY[0x1E4F34658], *MEMORY[0x1E4F1CF80], &BOOLean);
  CFBooleanRef v7 = BOOLean;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = BOOLean == 0;
  }
  if (v8)
  {
    BOOL v9 = 1;
    if (!BOOLean) {
      return v9;
    }
    goto LABEL_14;
  }
  BOOL v9 = CFBooleanGetValue(BOOLean) != 0;
  CFBooleanRef v7 = BOOLean;
  if (BOOLean) {
LABEL_14:
  }
    CFRelease(v7);
  return v9;
}

- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3
{
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, void, opaqueMTAudioProcessingTap *))(v7 + 56);
  if (v8 && !v8(figAudioRenderer, *MEMORY[0x1E4F345D8], a3))
  {
    audioRendererInternal = self->_audioRendererInternal;
    audioProcessingTap = audioRendererInternal->audioProcessingTap;
    audioRendererInternal->audioProcessingTap = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (audioProcessingTap)
    {
      CFRelease(audioProcessingTap);
    }
  }
}

- (opaqueMTAudioProcessingTap)audioTapProcessor
{
  return self->_audioRendererInternal->audioProcessingTap;
}

- (void)setAllowedAudioSpatializationFormats:(AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  audioRendererInternal = self->_audioRendererInternal;
  unint64_t v4 = audioRendererInternal->allowedAudioSpatializationFormats;
  if (v4 != allowedAudioSpatializationFormats)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CFD0];
    if ((v4 & 4) != 0)
    {
      figAudioRenderer = audioRendererInternal->figAudioRenderer;
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, void, void))(v11 + 56);
      if (v12) {
        int v8 = v12(figAudioRenderer, *MEMORY[0x1E4F34620], *v7);
      }
      else {
        int v8 = -12782;
      }
    }
    else
    {
      int v8 = 0;
    }
    uint64_t v13 = self->_audioRendererInternal;
    if ((v13->allowedAudioSpatializationFormats & 3) == 0) {
      goto LABEL_16;
    }
    uint64_t v14 = v13->figAudioRenderer;
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    v17 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, void, void))(v16 + 56);
    if (v17)
    {
      int v8 = v17(v14, *MEMORY[0x1E4F34640], *v7);
LABEL_16:
      if (!v8) {
        self->_audioRendererInternal->allowedAudioSpatializationFormats = allowedAudioSpatializationFormats;
      }
    }
  }
}

- (AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  return self->_audioRendererInternal->allowedAudioSpatializationFormats;
}

- (void)setVolume:(float)volume
{
  float valuePtr = volume;
  if (self->_audioRendererInternal->volume != volume)
  {
    CFNumberRef v4 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
    uint64_t FigBaseObject = FigSampleBufferAudioRendererGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    int v8 = *(unsigned int (**)(uint64_t, void, CFNumberRef))(v7 + 56);
    if (v8 && !v8(FigBaseObject, *MEMORY[0x1E4F34648], v4)) {
      self->_audioRendererInternal->volume = valuePtr;
    }
    if (v4) {
      CFRelease(v4);
    }
  }
}

- (float)volume
{
  return self->_audioRendererInternal->volume;
}

- (void)setMuted:(BOOL)muted
{
  if (self->_audioRendererInternal->muted != muted)
  {
    BOOL v3 = muted;
    uint64_t FigBaseObject = FigSampleBufferAudioRendererGetFigBaseObject();
    if (v3) {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CFD0];
    }
    else {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    BOOL v9 = *(unsigned int (**)(uint64_t, void, void))(v8 + 56);
    if (v9)
    {
      if (!v9(FigBaseObject, *MEMORY[0x1E4F34628], *v6)) {
        self->_audioRendererInternal->muted = v3;
      }
    }
  }
}

- (BOOL)isMuted
{
  return self->_audioRendererInternal->muted;
}

- (OpaqueCMTimebase)timebase
{
  readOnlyControlTimebase = self->_audioRendererInternal->readOnlyControlTimebase;
  if (readOnlyControlTimebase) {
    readOnlyControlTimebase = (void *)CFRetain(readOnlyControlTimebase);
  }
  return (OpaqueCMTimebase *)readOnlyControlTimebase;
}

- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3
{
  if (a3)
  {
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    if (figAudioRenderer) {
      figAudioRenderer = (OpaqueFigSampleBufferAudioRenderer *)CFRetain(figAudioRenderer);
    }
    *a3 = figAudioRenderer;
  }
}

- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4
{
  CMTimebaseRef timebaseOut = 0;
  weakReferenceToSynchronizer = self->_audioRendererInternal->weakReferenceToSynchronizer;
  if (!a3)
  {

    self->_audioRendererInternal->weakReferenceToSynchronizer = 0;
    HostTimeClock = CMClockGetHostTimeClock();
    uint64_t v10 = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
    if (!v10)
    {
      uint64_t OnlyTimebaseSetTargetTimebase = FigReadOnlyTimebaseSetTargetTimebase();
      if (!OnlyTimebaseSetTargetTimebase) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
LABEL_14:
    uint64_t OnlyTimebaseSetTargetTimebase = v10;
LABEL_7:
    [(AVSampleBufferAudioRenderer *)self _transitionToFailedStatusWithOSStatus:OnlyTimebaseSetTargetTimebase];
    goto LABEL_9;
  }
  if (![(AVWeakReference *)weakReferenceToSynchronizer referencedObject])
  {

    self->_audioRendererInternal->weakReferenceToSynchronizer = [[AVWeakReference alloc] initWithReferencedObject:a3];
    [a3 timebase];
    uint64_t v10 = FigReadOnlyTimebaseSetTargetTimebase();
    if (!v10)
    {
LABEL_9:
      uint64_t v8 = 0;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  uint64_t v8 = (void *)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"The AudioRenderer cannot be added to a Synchronizer when it has already been added to a Synchronizer." userInfo:0]);
  if (a4) {
LABEL_10:
  }
    *a4 = v8;
LABEL_11:
  if (timebaseOut) {
    CFRelease(timebaseOut);
  }
  return v8 == 0;
}

- (void)setSTSLabel:(id)a3
{
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(OpaqueFigSampleBufferAudioRenderer *, uint64_t, id))(v6 + 56);
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F34638];
    v7(figAudioRenderer, v8, a3);
  }
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CFTypeRef cf = 0;
  v37 = 0;
  if (!a3)
  {
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"sampleBuffer != NULL");
    goto LABEL_39;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  uint64_t v12 = FormatDescription;
  if (FormatDescription)
  {
    CMMediaType MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
    if (MediaType != 1936684398)
    {
      v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3C8];
      uint64_t v30 = AVStringForOSType(MediaType);
      AVStringForOSType(0x736F756Eu);
      uint64_t v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Sample buffer has media type '%@' instead of '%@'", v31, v32, v33, v34, v35, v30);
LABEL_39:
      objc_exception_throw((id)[v27 exceptionWithName:v28 reason:v29 userInfo:0]);
    }
  }
  if (objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession))
  {
    audioRendererInternal = self->_audioRendererInternal;
    if (audioRendererInternal->lastCryptor
      && (int v15 = FigCFEqual(), audioRendererInternal = self->_audioRendererInternal, v15))
    {
      FigSampleBufferSetDecryptor();
    }
    else
    {
      lastFormatDescription = audioRendererInternal->lastFormatDescription;
      audioRendererInternal->lastFormatDescription = v12;
      if (v12) {
        CFRetain(v12);
      }
      if (lastFormatDescription) {
        CFRelease(lastFormatDescription);
      }
      if (![objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession) copyCryptorForFormatDescription:v12 cryptorOut:&cf errorOut:&v37])goto LABEL_26; {
      v17 = self->_audioRendererInternal;
      }
      lastCryptor = v17->lastCryptor;
      CFTypeRef v19 = cf;
      v17->lastCryptor = (OpaqueFigCPECryptor *)cf;
      if (v19) {
        CFRetain(v19);
      }
      if (lastCryptor) {
        CFRelease(lastCryptor);
      }
      FigSampleBufferSetDecryptor();
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
  }
  v20 = self->_audioRendererInternal;
  int64_t status = v20->status;
  if (status == 2)
  {
LABEL_26:
    signed int v25 = 0;
    goto LABEL_31;
  }
  if (!status)
  {
    [(AVSampleBufferAudioRenderer *)self _transitionToStatus:1 error:0];
    v20 = self->_audioRendererInternal;
  }
  figAudioRenderer = v20->figAudioRenderer;
  uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  v26 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, opaqueCMSampleBuffer *))(v24 + 16);
  if (v26) {
    signed int v25 = v26(figAudioRenderer, a3);
  }
  else {
    signed int v25 = -12782;
  }
LABEL_31:
  if (cf) {
    CFRelease(cf);
  }
  if (v25 || v37) {
    [(AVSampleBufferAudioRenderer *)self _transitionToStatus:2 error:AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v25, 0, v37, 1)];
  }
}

- (void)flush
{
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *))(v5 + 24);
  if (v6)
  {
    uint64_t v7 = v6(figAudioRenderer);
    if (!v7) {
      return;
    }
  }
  else
  {
    uint64_t v7 = 4294954514;
  }
  [(AVSampleBufferAudioRenderer *)self _transitionToFailedStatusWithOSStatus:v7];
}

- (void)flushFromSourceTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  if (!completionHandler)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", 0, v4, v5, v6, v7, (uint64_t)"completionHandler != nil"), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  uint64_t v10 = (void (**)(void, void))[completionHandler copy];
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  CMTime v17 = *time;
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, CMTime *, void (*)(int, void (**)(void, void)), void (**)(void, void)))(v13 + 56);
  if (!v14)
  {
    v10[2](v10, 0);

    uint64_t v15 = 4294954514;
    goto LABEL_9;
  }
  CMTime v18 = v17;
  uint64_t v15 = v14(figAudioRenderer, &v18, AVSampleBufferAudioRendererFlushFromMediaTimeCallback, v10);
  if (v15) {
LABEL_9:
  }
    [(AVSampleBufferAudioRenderer *)self _transitionToFailedStatusWithOSStatus:v15];
}

- (BOOL)isReadyForMoreMediaData
{
  audioRendererInternal = self->_audioRendererInternal;
  BOOL result = audioRendererInternal->status != 2
        && ((figAudioRenderer = audioRendererInternal->figAudioRenderer,
             (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
          ? (uint64_t v5 = 0)
          : (uint64_t v5 = v4),
            (uint64_t v6 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *))(v5 + 8)) != 0)
        && v6(figAudioRenderer) == 0;
  return result;
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  if (!a3)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "queue != NULL";
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "block != nil";
LABEL_8:
    uint64_t v16 = (void *)[v13 exceptionWithName:v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v15), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  MEMORY[0x199715030](self->_audioRendererInternal->mediaDataRequester.mutex, a2);
  audioRendererInternal = self->_audioRendererInternal;
  requester = audioRendererInternal->mediaDataRequester.requester;
  audioRendererInternal->mediaDataRequester.requester = 0;
  CMTime v17 = [[AVMediaDataRequester alloc] initWithMediaDataConsumer:self requestQueue:a3 requestBlock:a4];
  self->_audioRendererInternal->mediaDataRequester.requester = v17;
  MEMORY[0x199715040](self->_audioRendererInternal->mediaDataRequester.mutex);
  [(AVMediaDataRequester *)requester invalidate];

  [(AVMediaDataRequester *)v17 startRequestingMediaData];
}

- (void)stopRequestingMediaData
{
  MEMORY[0x199715030](self->_audioRendererInternal->mediaDataRequester.mutex, a2);
  audioRendererInternal = self->_audioRendererInternal;
  requester = audioRendererInternal->mediaDataRequester.requester;
  audioRendererInternal->mediaDataRequester.requester = 0;
  MEMORY[0x199715040](self->_audioRendererInternal->mediaDataRequester.mutex);
  [(AVMediaDataRequester *)requester invalidate];
}

- (BOOL)hasSufficientMediaDataForReliablePlaybackStart
{
  CFBooleanRef BOOLean = 0;
  audioRendererInternal = self->_audioRendererInternal;
  if (audioRendererInternal->status == 2) {
    return 0;
  }
  figAudioRenderer = audioRendererInternal->figAudioRenderer;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, void, void, CFBooleanRef *))(v5 + 48);
  if (!v6) {
    return 0;
  }
  int v7 = v6(figAudioRenderer, *MEMORY[0x1E4F34618], *MEMORY[0x1E4F1CF80], &BOOLean);
  CFBooleanRef v8 = BOOLean;
  if (v7)
  {
    BOOL v9 = 0;
    if (!BOOLean) {
      return v9;
    }
    goto LABEL_12;
  }
  BOOL v9 = CFBooleanGetValue(BOOLean) == 0;
  CFBooleanRef v8 = BOOLean;
  if (BOOLean) {
LABEL_12:
  }
    CFRelease(v8);
  return v9;
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(OpaqueFigSampleBufferAudioRenderer *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(figAudioRenderer, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  id Weak = objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession);
  if (!Weak)
  {
    objc_storeWeak((id *)&self->_audioRendererInternal->weakContentKeySession, a3);
    if (!a5) {
      return 0;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    *a5 = Weak != 0;
  return 0;
}

- (BOOL)_attachedToExternalContentKeySession
{
  return objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession) != 0;
}

- (id)contentKeySession
{
  return objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession);
}

+ (id)makeRendererLoggingIdentifier
{
  v2 = objc_alloc_init(AVSampleBufferAudioRendererLoggingIdentifier);
  return v2;
}

- (id)loggingIdentifier
{
  v2 = self->_audioRendererInternal->loggingIdentifier;
  return v2;
}

- (void)setLoggingIdentifier:(id)a3
{
  loggingIdentifier = self->_audioRendererInternal->loggingIdentifier;
  if (loggingIdentifier != a3)
  {

    self->_audioRendererInternal->loggingIdentifier = (AVLoggingIdentifier *)a3;
  }
}

+ (id)currentFigAudioRendererFactory
{
  v2 = objc_alloc_init(AVFigSampleBufferAudioRendererFactory);
  id result = dispatch_get_specific(@"AVSampleBufferAudioRendererFigFactoryKey");
  if (!result) {
    return v2;
  }
  return result;
}

+ (void)setFigAudioRendererFactory:(id)a3 forQueue:(id)a4
{
  id v5 = a3;
  dispatch_queue_set_specific((dispatch_queue_t)a4, @"AVSampleBufferAudioRendererFigFactoryKey", v5, AVSampleBufferAudioRendererReleaseObject);
}

@end