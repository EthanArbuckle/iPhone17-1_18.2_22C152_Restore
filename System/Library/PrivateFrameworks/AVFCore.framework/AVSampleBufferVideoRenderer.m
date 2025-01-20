@interface AVSampleBufferVideoRenderer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (void)initialize;
- ($8A865F3275AFFA793BA84D73056FEF19)_computeSampleBufferEnqueueingInfoForSampleBuffer:(SEL)a3;
- (AVQueuedSampleBufferRenderingStatus)status;
- (AVSampleBufferVideoRenderer)init;
- (BOOL)_createVideoQueueFailed;
- (BOOL)_disallowsVideoLayerDisplayCompositing;
- (BOOL)_hasEverEnqueued;
- (BOOL)_isCreateVideoQueueErrorRetryable:(int)a3;
- (BOOL)_setSynchronizerTimebase:(OpaqueCMTimebase *)a3 error:(id *)a4;
- (BOOL)_setUpcomingPresentationTimeExpectations:(int)a3 minimumPresentationTime:(id *)a4;
- (BOOL)attachedToExternalContentKeySession;
- (BOOL)hasSufficientMediaDataForReliablePlaybackStart;
- (BOOL)isReadyForDisplay;
- (BOOL)isReadyForMoreMediaData;
- (BOOL)outputObscuredDueToInsufficientExternalProtection;
- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback;
- (BOOL)preventsCapture;
- (BOOL)preventsDisplaySleepDuringVideoPlayback;
- (BOOL)requiresFlushToResumeDecoding;
- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4;
- (BOOL)shouldWaitForVideoTarget;
- (NSArray)outputs;
- (NSError)error;
- (NSString)_STSLabel;
- (NSString)description;
- (OpaqueCMTimebase)_readOnlyVideoQueueTimebase;
- (OpaqueCMTimebase)controlTimebase;
- (OpaqueCMTimebase)timebase;
- (OpaqueFigVideoQueue)_copyVideoQueue;
- (__CVBuffer)copyDisplayedPixelBuffer;
- (id)_STSLabelPublisher;
- (id)_displayLayer;
- (id)_statusString:(int64_t)a3;
- (id)contentKeySession;
- (id)videoPerformanceMetrics;
- (int)_createVideoQueue:(OpaqueFigVideoQueue *)a3 errorStep:(id *)a4;
- (int)_enqueueSingleSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferEnqueueingInfo:(id *)a4;
- (int)_initializeTimebases;
- (int)_setContentLayerOnFigVideoQueue:(OpaqueFigVideoQueue *)a3;
- (int)attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5;
- (int)createVideoQueue:(OpaqueFigVideoQueue *)a3;
- (void)_addFigVideoQueueListeners;
- (void)_callOldPrerollCompletionHandlerWithSuccess:(BOOL)a3 andSetNewPrerollCompletionHandler:(id)a4 forRequestID:(int)a5;
- (void)_completedDecodeForPrerollForRequestID:(int)a3;
- (void)_didFinishSuspension:(id)a3;
- (void)_fireDisplayLayerNotificationNowThenReleaseOnMainThread:(id)a3 userInfo:(id)a4;
- (void)_flushComplete;
- (void)_refreshAboveHighWaterLevel;
- (void)_removeFigVideoQueueListeners;
- (void)_resetStatusWithOSStatus:(int)a3;
- (void)_setCreateVideoQueueFailedWithOSStatus:(int)a3;
- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3;
- (void)_setOutputObscuredDueToInsufficientExternalProtection:(BOOL)a3;
- (void)_setRequiresFlushToResumeDecoding:(BOOL)a3;
- (void)_setStatus:(int64_t)a3 error:(id)a4;
- (void)_updateVideoOutputs;
- (void)_updateVideoTargetsOnVideoQueue;
- (void)addOutput:(id)a3;
- (void)addSampleBufferDisplayLayer:(id)a3;
- (void)addVideoTarget:(OpaqueFigVideoTarget *)a3;
- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3;
- (void)dealloc;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferEnqueueingInfo:(id *)a4;
- (void)expectMinimumUpcomingSampleBufferPresentationTime:(id *)a3;
- (void)expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes;
- (void)flush;
- (void)flushAndRemoveImage;
- (void)flushWithRemovalOfDisplayedImage:(BOOL)removeDisplayedImage completionHandler:(void *)handler;
- (void)loadVideoPerformanceMetricsWithCompletionHandler:(id)a3;
- (void)prerollDecodeWithCompletionHandler:(id)a3;
- (void)removeDisplayLayer;
- (void)removeOutput:(id)a3;
- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4;
- (void)resetUpcomingSampleBufferPresentationTimeExpectations;
- (void)setContentKeySession:(id)a3;
- (void)setControlTimebase:(OpaqueCMTimebase *)a3;
- (void)setDisplayLayerVisibility:(BOOL)a3;
- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)a3;
- (void)setPreventsCapture:(BOOL)a3;
- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3;
- (void)setReadyForDisplayWithoutKVO:(BOOL)a3;
- (void)setSTSLabel:(id)a3;
- (void)setShouldWaitForVideoTarget:(BOOL)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)stopRequestingMediaData;
@end

@implementation AVSampleBufferVideoRenderer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (void)_fireDisplayLayerNotificationNowThenReleaseOnMainThread:(id)a3 userInfo:(id)a4
{
  v7 = (void *)MEMORY[0x199715AE0](self, a2);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDisplayLayer);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", a3, WeakRetained, a4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__AVSampleBufferVideoRenderer__fireDisplayLayerNotificationNowThenReleaseOnMainThread_userInfo___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
  }
}

void __96__AVSampleBufferVideoRenderer__fireDisplayLayerNotificationNowThenReleaseOnMainThread_userInfo___block_invoke(uint64_t a1)
{
}

- (void)setControlTimebase:(OpaqueCMTimebase *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVSampleBufferVideoRenderer_setControlTimebase___block_invoke;
  block[3] = &unk_1E57B3A60;
  block[4] = self;
  void block[5] = &v15;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The control timebase can not be changed after the display layer or video renderer has been added to a synchronizer", v7, v8, v9, v10, v11, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (a3)
  {
    self->_controlTimebaseSetByUserIsInUse = 1;
    FigReadOnlyTimebaseSetTargetTimebase();
  }
  else
  {
    self->_controlTimebaseSetByUserIsInUse = 0;
    _targetReadOnlyTimebaseAtDummyTimebase();
  }
  _Block_object_dispose(&v15, 8);
}

void __50__AVSampleBufferVideoRenderer_setControlTimebase___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(unsigned char *)(v1 + 168))
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    v2 = *(const void **)(v1 + 176);
    v3 = (const void *)a1[6];
    *(void *)(v1 + 176) = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

- (BOOL)_setSynchronizerTimebase:(OpaqueCMTimebase *)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__36;
  uint64_t v17 = __Block_byref_object_dispose__36;
  uint64_t v18 = 0;
  serialQueue = self->_serialQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__AVSampleBufferVideoRenderer__setSynchronizerTimebase_error___block_invoke;
  v12[3] = &unk_1E57B6E28;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(serialQueue, v12);
  uint64_t v8 = v20;
  int v9 = *((unsigned __int8 *)v20 + 24);
  if (*((unsigned char *)v20 + 24))
  {
    if (a3)
    {
      self->_addedToSynchronizer = 1;
      FigReadOnlyTimebaseSetTargetTimebase();
      FigReadOnlyTimebaseSetTargetTimebase();
    }
    else
    {
      self->_addedToSynchronizer = 0;
      _targetReadOnlyTimebaseAtDummyTimebase();
      _targetReadOnlyTimebaseAtDummyTimebase();
    }
    uint64_t v8 = v20;
    int v9 = 1;
    *((unsigned char *)v20 + 24) = 1;
  }
  if (a4)
  {
    *a4 = (id)v14[5];
    int v9 = *((unsigned __int8 *)v8 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __62__AVSampleBufferVideoRenderer__setSynchronizerTimebase_error___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 168) = *(void *)(result + 56) != 0;
  if (*(unsigned char *)(*(void *)(result + 32) + 169))
  {
    uint64_t v1 = result;
    result = AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"The display layer or video renderer cannot be added to a synchronizer if the control timebase has already been set." userInfo:0]);
    *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) = result;
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (OpaqueCMTimebase)_readOnlyVideoQueueTimebase
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVSampleBufferVideoRenderer__readOnlyVideoQueueTimebase__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (OpaqueCMTimebase *)(id)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __58__AVSampleBufferVideoRenderer__readOnlyVideoQueueTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 184);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_initializeTimebases
{
  CMTimebaseRef v11 = 0;
  CMTimebaseRef timebaseOut = 0;
  HostTimeClock = CMClockGetHostTimeClock();
  int OnlyTimebase = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
  if (!OnlyTimebase)
  {
    int OnlyTimebase = CMTimebaseSetRate(timebaseOut, 1.0);
    if (!OnlyTimebase)
    {
      v4 = timebaseOut;
      v5 = CMClockGetHostTimeClock();
      CMClockGetTime(&time, v5);
      int OnlyTimebase = CMTimebaseSetTime(v4, &time);
      if (!OnlyTimebase)
      {
        int OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
        if (!OnlyTimebase)
        {
          uint64_t v6 = CMClockGetHostTimeClock();
          int OnlyTimebase = CMTimebaseCreateWithSourceClock(0, v6, &v11);
          if (!OnlyTimebase) {
            int OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
          }
        }
      }
    }
  }
  int v7 = OnlyTimebase;
  if (timebaseOut) {
    CFRelease(timebaseOut);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v7;
}

- (int)_createVideoQueue:(OpaqueFigVideoQueue *)a3 errorStep:(id *)a4
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  videoQueueQueue = self->_videoQueueQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke;
  block[3] = &unk_1E57B6E50;
  block[4] = &v22;
  void block[5] = &v18;
  dispatch_sync(videoQueueQueue, block);
  if (*((_DWORD *)v23 + 6)) {
    goto LABEL_15;
  }
  int v8 = [(AVSampleBufferVideoRenderer *)self _setContentLayerOnFigVideoQueue:v19[3]];
  *((_DWORD *)v23 + 6) = v8;
  if (v8) {
    goto LABEL_15;
  }
  uint64_t v9 = self->_videoQueueQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_2;
  v16[3] = &unk_1E57B6E50;
  v16[4] = &v18;
  v16[5] = &v22;
  dispatch_sync(v9, v16);
  if (*((_DWORD *)v23 + 6)) {
    goto LABEL_15;
  }
  BOOL v10 = self->_videoQueueQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_3;
  v15[3] = &unk_1E57B3F70;
  v15[5] = &v22;
  v15[6] = &v18;
  v15[4] = self;
  dispatch_sync(v10, v15);
  if (*((_DWORD *)v23 + 6))
  {
LABEL_15:
    CMTimebaseRef v11 = (const void *)v19[3];
    if (v11)
    {
      CFRelease(v11);
      v19[3] = 0;
    }
  }
  if (a3) {
    *a3 = (OpaqueFigVideoQueue *)v19[3];
  }
  v12 = v23;
  int v13 = *((_DWORD *)v23 + 6);
  if (a4 && v13)
  {
    *a4 = 0;
    int v13 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke(uint64_t a1)
{
  uint64_t result = FigVideoQueueCreateRemote();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_2(uint64_t a1)
{
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(void (**)(uint64_t, void, void))(v4 + 56);
  if (v5) {
    v5(CMBaseObject, *MEMORY[0x1E4F34CB8], *MEMORY[0x1E4F1CFD0]);
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, void))(v8 + 8);
  if (v9) {
    uint64_t result = v9(v6, 0);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _readOnlyVideoQueueTimebase];
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34C88], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isCreateVideoQueueErrorRetryable:(int)a3
{
  return a3 == -12083 || a3 == -16155;
}

- (int)createVideoQueue:(OpaqueFigVideoQueue *)a3
{
  unsigned int v5 = 0;
  uint64_t v9 = 0;
  do
  {
    uint64_t v6 = [(AVSampleBufferVideoRenderer *)self _createVideoQueue:a3 errorStep:&v9];
    if ([(AVSampleBufferVideoRenderer *)self _isCreateVideoQueueErrorRetryable:v6])
    {
      BOOL v7 = v5 >= 4;
    }
    else
    {
      BOOL v7 = 1;
    }
    ++v5;
  }
  while (!v7);
  return v6;
}

- (OpaqueFigVideoQueue)_copyVideoQueue
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVSampleBufferVideoRenderer__copyVideoQueue__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  uint64_t v3 = (OpaqueFigVideoQueue *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __46__AVSampleBufferVideoRenderer__copyVideoQueue__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 8);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_hasEverEnqueued
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVSampleBufferVideoRenderer__hasEverEnqueued__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVSampleBufferVideoRenderer__hasEverEnqueued__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 109);
  return result;
}

- (void)_refreshAboveHighWaterLevel
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  CMTimebaseRef v11 = &v10;
  uint64_t v12 = 0x3052000000;
  int v13 = __Block_byref_object_copy__36;
  v14 = __Block_byref_object_dispose__36;
  uint64_t v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  char v3 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke;
    block[3] = &unk_1E57B4010;
    block[4] = v8;
    void block[5] = v3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v3);
  }
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke_2;
  v6[3] = &unk_1E57B3BE0;
  v6[4] = self;
  v6[5] = v8;
  v6[6] = &v16;
  v6[7] = &v10;
  dispatch_sync(serialQueue, v6);
  if (*((unsigned char *)v17 + 24))
  {
    [(id)v11[5] startRequestingMediaData];

    v11[5] = 0;
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v7 + 48);
  if (v8)
  {
    uint64_t result = v8(v2);
    BOOL v9 = result != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
  return result;
}

void *__58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke_2(void *result)
{
  uint64_t v1 = result[4];
  int v2 = *(unsigned __int8 *)(v1 + 121);
  *(unsigned char *)(v1 + 121) = *(unsigned char *)(*(void *)(result[5] + 8) + 24);
  if (v2)
  {
    char v3 = result;
    uint64_t v4 = result[4];
    if (!*(unsigned char *)(v4 + 121))
    {
      if (*(unsigned char *)(v4 + 110))
      {
        *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
        uint64_t result = *(id *)(result[4] + 112);
        *(void *)(*(void *)(v3[7] + 8) + 40) = result;
      }
    }
  }
  return result;
}

- (void)_setStatus:(int64_t)a3 error:(id)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (self->_status < a3)
  {
    [(AVSampleBufferVideoRenderer *)self willChangeValueForKey:@"status"];
    if (a4) {
      [(AVSampleBufferVideoRenderer *)self willChangeValueForKey:@"error"];
    }
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__AVSampleBufferVideoRenderer__setStatus_error___block_invoke;
    void v8[3] = &unk_1E57B6DD0;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = &v9;
    v8[7] = a3;
    dispatch_sync(serialQueue, v8);
    if (*((unsigned char *)v10 + 24)) {
      [(AVSampleBufferVideoRenderer *)self _setRequiresFlushToResumeDecoding:1];
    }
    [(AVSampleBufferVideoRenderer *)self didChangeValueForKey:@"status"];
    if (a4) {
      [(AVSampleBufferVideoRenderer *)self didChangeValueForKey:@"error"];
    }
  }
  _Block_object_dispose(&v9, 8);
}

void *__48__AVSampleBufferVideoRenderer__setStatus_error___block_invoke(void *result)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = result[7];
  uint64_t v2 = result[4];
  if (v1 > *(void *)(v2 + 24))
  {
    char v3 = result;
    if (dword_1E9356A30)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v1 = v3[7];
      uint64_t v2 = v3[4];
    }
    *(void *)(v2 + 24) = v1;
    uint64_t result = *(void **)(v3[4] + 32);
    if (result
      || (uint64_t result = (void *)v3[5]) != 0
      && (*(void *)(v3[4] + 32) = [result copy], (uint64_t result = *(void **)(v3[4] + 32)) != 0))
    {
      uint64_t result = objc_msgSend(result, "code", v5, v6);
      if (result == (void *)-11847
        || (uint64_t result = (void *)[*(id *)(v3[4] + 32) code], result == (void *)-11819))
      {
        *(unsigned char *)(*(void *)(v3[6] + 8) + 24) = 1;
      }
    }
  }
  return result;
}

- (void)_resetStatusWithOSStatus:(int)a3
{
  if (a3)
  {
    uint64_t v4 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
    [(AVSampleBufferVideoRenderer *)self _setStatus:2 error:v4];
  }
  else if (self->_status >= 1)
  {
    error = self->_error;
    [(AVSampleBufferVideoRenderer *)self willChangeValueForKey:@"status"];
    if (error) {
      [(AVSampleBufferVideoRenderer *)self willChangeValueForKey:@"error"];
    }
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AVSampleBufferVideoRenderer__resetStatusWithOSStatus___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    [(AVSampleBufferVideoRenderer *)self didChangeValueForKey:@"status"];
    if (error) {
      [(AVSampleBufferVideoRenderer *)self didChangeValueForKey:@"error"];
    }
  }
}

void __56__AVSampleBufferVideoRenderer__resetStatusWithOSStatus___block_invoke(uint64_t a1)
{
  if (dword_1E9356A30)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(void *)(*(void *)(a1 + 32) + 24) = 0;

  *(void *)(*(void *)(a1 + 32) + 32) = 0;
}

- (void)_setOutputObscuredDueToInsufficientExternalProtection:(BOOL)a3
{
  if ([(AVSampleBufferVideoRenderer *)self outputObscuredDueToInsufficientExternalProtection] != a3)
  {
    [(AVSampleBufferVideoRenderer *)self willChangeValueForKey:@"outputObscuredDueToInsufficientExternalProtection"];
    serialQueue = self->_serialQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __85__AVSampleBufferVideoRenderer__setOutputObscuredDueToInsufficientExternalProtection___block_invoke;
    v6[3] = &unk_1E57B20E8;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_sync(serialQueue, v6);
    [(AVSampleBufferVideoRenderer *)self didChangeValueForKey:@"outputObscuredDueToInsufficientExternalProtection"];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVSampleBufferVideoRendererOutputObscuredDueToInsufficientExternalProtectionDidChangeNotification", self);
    [(AVSampleBufferVideoRenderer *)self _fireDisplayLayerNotificationNowThenReleaseOnMainThread:@"AVSampleBufferDisplayLayerOutputObscuredDueToInsufficientExternalProtectionDidChangeNotification" userInfo:0];
  }
}

uint64_t __85__AVSampleBufferVideoRenderer__setOutputObscuredDueToInsufficientExternalProtection___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_addFigVideoQueueListeners
{
  uint64_t v2 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v2)
  {
    char v3 = v2;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners();
    CFRelease(v3);
  }
}

- (void)_removeFigVideoQueueListeners
{
  uint64_t v2 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v2)
  {
    char v3 = v2;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListeners();
    CFRelease(v3);
  }
}

- (void)_setRequiresFlushToResumeDecoding:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [(AVSampleBufferVideoRenderer *)self setReadyForDisplayWithoutKVO:0];
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AVSampleBufferVideoRenderer__setRequiresFlushToResumeDecoding___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v9 = a3;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    uint64_t v6 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVSampleBufferVideoRendererRequiresFlushToResumeDecodingDidChangeNotification" object:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v6);
    [(AVSampleBufferVideoRenderer *)self _fireDisplayLayerNotificationNowThenReleaseOnMainThread:@"AVSampleBufferDisplayLayerRequiresFlushToResumeDecodingDidChangeNotification" userInfo:0];
    if (dword_1E9356A30)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __65__AVSampleBufferVideoRenderer__setRequiresFlushToResumeDecoding___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 106) != v2)
  {
    *(unsigned char *)(v1 + 106) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_setCreateVideoQueueFailedWithOSStatus:(int)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AVSampleBufferVideoRenderer__setCreateVideoQueueFailedWithOSStatus___block_invoke;
  v4[3] = &unk_1E57B39C8;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __70__AVSampleBufferVideoRenderer__setCreateVideoQueueFailedWithOSStatus___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 122) = *(_DWORD *)(result + 40) != 0;
  if (dword_1E9356A30)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (BOOL)_createVideoQueueFailed
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVSampleBufferVideoRenderer__createVideoQueueFailed__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVSampleBufferVideoRenderer__createVideoQueueFailed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 122);
  return result;
}

- (AVSampleBufferVideoRenderer)init
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)AVSampleBufferVideoRenderer;
  int v2 = [(AVSampleBufferVideoRenderer *)&v26 init];
  if (v2)
  {
    v2->_figVideoTargets = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    char v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer serial", v3);
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_videoQueueQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer videoQueue", v4);
    int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_layerQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer layerQueue", v5);
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_videoPerformanceMetricsQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer videoPerformanceMetricsQueue", v6);
    BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_flushCallbackListQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererCallbackListQueue", v7);
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_flushCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererFlushCallbackQueue", v8);
    v2->_flushCallbacks = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    char v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_queueForProtectingPrerollCompleteCallback = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererQueueForProtectingPrerollCompleteCallback", v9);
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_queueForCallingPrerollCompleteCallback = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererQueueForCallingPrerollCompleteCallback", v10);
    v2->_applicationStateMonitor = (AVApplicationStateMonitor *)+[AVApplicationStateMonitor sharedApplicationStateMonitor];
    objc_initWeak(&location, v2);
    uint64_t v11 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __35__AVSampleBufferVideoRenderer_init__block_invoke;
    v23[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v24, &location);
    v2->_didFinishSuspensionNotificationToken = (id)[v11 addObserverForName:@"_UIApplicationDidFinishSuspensionSnapshotNotification" object:0 queue:0 usingBlock:v23];
    *(_WORD *)&v2->_preventsDisplaySleepDuringVideoPlayback = 257;
    v2->_videoOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(AVSampleBufferVideoRenderer *)v2 _initializeTimebases])
    {
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }
    v2->_status = 0;
    v2->_error = 0;
    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v2->_previousSourceRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->_previousSourceRect.size = v12;
    v2->_createVideoQueueFailed = 0;
    *(void *)uint64_t v22 = 0;
    uint64_t v13 = objc_msgSend(-[AVSampleBufferVideoRenderer currentFigVideoQueueFactory](v2, "currentFigVideoQueueFactory"), "createVideoQueue:", v22);
    if (v13)
    {
      if (dyld_program_sdk_at_least())
      {
        if (dword_1E9356A30)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[AVSampleBufferVideoRenderer _setCreateVideoQueueFailedWithOSStatus:](v2, "_setCreateVideoQueueFailedWithOSStatus:", v13, v20, v21);
        [(AVSampleBufferVideoRenderer *)v2 _resetStatusWithOSStatus:v13];
        [(AVSampleBufferVideoRenderer *)v2 _setRequiresFlushToResumeDecoding:1];
        v2->_videoQueue = 0;
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
        goto LABEL_11;
      }
      v2->_videoQueue = 0;
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
LABEL_9:

      return 0;
    }
    v2->_videoQueue = *(OpaqueFigVideoQueue **)v22;
    [(AVSampleBufferVideoRenderer *)v2 _addFigVideoQueueListeners];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
LABEL_11:
  if (dword_1E9356A30 >= 3)
  {
    LODWORD(location) = 0;
    v22[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v16 = location;
    if (os_log_type_enabled(v15, v22[0])) {
      unsigned int v17 = v16;
    }
    else {
      unsigned int v17 = v16 & 0xFFFFFFFE;
    }
    if (v17)
    {
      videoQueue = v2->_videoQueue;
      int v27 = 136315650;
      v28 = "-[AVSampleBufferVideoRenderer init]";
      __int16 v29 = 2048;
      v30 = v2;
      __int16 v31 = 2048;
      v32 = videoQueue;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t __35__AVSampleBufferVideoRenderer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _didFinishSuspension:a2];
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A30 >= 3)
  {
    int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_isRequestingMediaData) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"An object conforming to AVQueuedSampleBufferRendering, configured to request more media data via requestMediaDataWhenReadyOnQueue:usingBlock:, was released without first having been messaged stopRequestingMediaData:.", 0 reason userInfo]);
  }
  [(AVSampleBufferVideoRenderer *)self _callOldPrerollCompletionHandlerWithSuccess:0 andSetNewPrerollCompletionHandler:0 forRequestID:0];
  [(AVSampleBufferVideoRenderer *)self _removeFigVideoQueueListeners];
  error = self->_error;
  if (error) {
    CFRelease(error);
  }
  videoQueue = self->_videoQueue;
  if (videoQueue)
  {
    CFRelease(videoQueue);
    self->_videoQueue = 0;
  }
  mediaDataRequester = self->_mediaDataRequester;
  if (mediaDataRequester) {
    CFRelease(mediaDataRequester);
  }
  serialQueue = self->_serialQueue;
  if (serialQueue) {
    CFRelease(serialQueue);
  }
  videoQueueQueue = self->_videoQueueQueue;
  if (videoQueueQueue) {
    CFRelease(videoQueueQueue);
  }
  layerQueue = self->_layerQueue;
  if (layerQueue) {
    CFRelease(layerQueue);
  }
  videoPerformanceMetricsQueue = self->_videoPerformanceMetricsQueue;
  if (videoPerformanceMetricsQueue) {
    CFRelease(videoPerformanceMetricsQueue);
  }

  flushCallbackListQueue = self->_flushCallbackListQueue;
  if (flushCallbackListQueue)
  {
    dispatch_release(flushCallbackListQueue);
    self->_flushCallbackListQueue = 0;
  }
  flushCallbackQueue = self->_flushCallbackQueue;
  if (flushCallbackQueue)
  {
    dispatch_release(flushCallbackQueue);
    self->_flushCallbackQueue = 0;
  }
  queueForProtectingPrerollCompleteCallback = self->_queueForProtectingPrerollCompleteCallback;
  if (queueForProtectingPrerollCompleteCallback)
  {
    dispatch_release(queueForProtectingPrerollCompleteCallback);
    self->_queueForProtectingPrerollCompleteCallback = 0;
  }
  queueForCallingPrerollCompleteCallback = self->_queueForCallingPrerollCompleteCallback;
  if (queueForCallingPrerollCompleteCallback)
  {
    dispatch_release(queueForCallingPrerollCompleteCallback);
    self->_queueForCallingPrerollCompleteCallback = 0;
  }
  controlTimebaseSetByUser = self->_controlTimebaseSetByUser;
  if (controlTimebaseSetByUser) {
    CFRelease(controlTimebaseSetByUser);
  }
  readOnlyVideoQueueTimebase = self->_readOnlyVideoQueueTimebase;
  if (readOnlyVideoQueueTimebase) {
    CFRelease(readOnlyVideoQueueTimebase);
  }
  readOnlyRenderingTimebase = self->_readOnlyRenderingTimebase;
  if (readOnlyRenderingTimebase) {
    CFRelease(readOnlyRenderingTimebase);
  }
  lastFormatDescription = self->_lastFormatDescription;
  if (lastFormatDescription) {
    CFRelease(lastFormatDescription);
  }
  lastCryptor = self->_lastCryptor;
  if (lastCryptor) {
    CFRelease(lastCryptor);
  }

  if (self->_didFinishSuspensionNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_didFinishSuspensionNotificationToken);
  }
  figVideoTargets = self->_figVideoTargets;
  if (figVideoTargets) {
    CFRelease(figVideoTargets);
  }
  v21.receiver = self;
  v21.super_class = (Class)AVSampleBufferVideoRenderer;
  [(AVSampleBufferVideoRenderer *)&v21 dealloc];
}

- (OpaqueCMTimebase)controlTimebase
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVSampleBufferVideoRenderer_controlTimebase__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = (OpaqueCMTimebase *)(id)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __46__AVSampleBufferVideoRenderer_controlTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 176);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDisplayLayerVisibility:(BOOL)a3
{
  layerQueue = self->_layerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(layerQueue, v4);
}

void __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyVideoQueue];
  if (v2)
  {
    char v3 = (const void *)v2;
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    int v8 = 0;
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke_2;
    block[3] = &unk_1E57B6E78;
    block[4] = v7;
    void block[5] = v3;
    char v6 = *(unsigned char *)(a1 + 40);
    dispatch_sync(v4, block);
    CFRelease(v3);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVSampleBufferVideoRendererVisibilityDidChangeNotification", *(void *)(a1 + 32));
    [*(id *)(a1 + 32) _fireDisplayLayerNotificationNowThenReleaseOnMainThread:@"AVSampleBufferDisplayLayerVisibilityDidChangeNotification" userInfo:0];
    _Block_object_dispose(v7, 8);
  }
}

uint64_t __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  char v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CA8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  p_weakReferenceToSynchronizer = &self->_weakReferenceToSynchronizer;
  if (a3)
  {
    if (objc_loadWeak((id *)&self->_weakReferenceToSynchronizer))
    {
      uint64_t v8 = AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"The DisplayLayer cannot be added to a Synchronizer when it has already been added to a Synchronizer." userInfo:0]);
      LOBYTE(v9) = 0;
      uint64_t v11 = (void *)v8;
    }
    else
    {
      BOOL v9 = -[AVSampleBufferVideoRenderer _setSynchronizerTimebase:error:](self, "_setSynchronizerTimebase:error:", [a3 timebase], &v11);
      if (v9)
      {
        objc_storeWeak((id *)p_weakReferenceToSynchronizer, a3);
        LOBYTE(v9) = 1;
      }
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_weakReferenceToSynchronizer, 0);
    LOBYTE(v9) = [(AVSampleBufferVideoRenderer *)self _setSynchronizerTimebase:0 error:&v11];
  }
  if (a4) {
    *a4 = v11;
  }
  return v9;
}

- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3
{
  if (a3) {
    *a3 = 0;
  }
}

- (void)setSTSLabel:(id)a3
{
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AVSampleBufferVideoRenderer_setSTSLabel___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = a3;
  void v6[5] = self;
  dispatch_sync(serialQueue, v6);
  uint64_t v5 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVSampleBufferSTSLabelDidChangeNotification" object:self];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
}

void __43__AVSampleBufferVideoRenderer_setSTSLabel___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(a1 + 40) + 320) = *(void *)(a1 + 32);
}

- (NSString)_STSLabel
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  BOOL v9 = __Block_byref_object_copy__36;
  uint64_t v10 = __Block_byref_object_dispose__36;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVSampleBufferVideoRenderer__STSLabel__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __40__AVSampleBufferVideoRenderer__STSLabel__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 320);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_STSLabelPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:self key:@"STSLabel" notificationName:@"AVSampleBufferSTSLabelDidChangeNotification"];
}

- (id)_displayLayer
{
  return objc_loadWeak((id *)&self->_weakDisplayLayer);
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  uint64_t v5 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v5)
  {
    uint64_t v6 = v5;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__AVSampleBufferVideoRenderer_setToneMapToStandardDynamicRange___block_invoke;
    block[3] = &unk_1E57B6E78;
    block[4] = v10;
    void block[5] = v6;
    BOOL v9 = a3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v6);
    _Block_object_dispose(v10, 8);
  }
}

uint64_t __64__AVSampleBufferVideoRenderer_setToneMapToStandardDynamicRange___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    id v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CE8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setReadyForDisplayWithoutKVO:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AVSampleBufferVideoRenderer_setReadyForDisplayWithoutKVO___block_invoke;
  block[3] = &unk_1E57B6EA0;
  block[4] = self;
  void block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v9 + 24)) {
    [(AVSampleBufferVideoRenderer *)self _fireDisplayLayerNotificationNowThenReleaseOnMainThread:@"AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification" userInfo:0];
  }
  if (dword_1E9356A30)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __60__AVSampleBufferVideoRenderer_setReadyForDisplayWithoutKVO___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 120) != *(unsigned __int8 *)(result + 48);
  *(unsigned char *)(*(void *)(result + 32) + 120) = *(unsigned char *)(result + 48);
  return result;
}

- (BOOL)isReadyForDisplay
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVSampleBufferVideoRenderer_isReadyForDisplay__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVSampleBufferVideoRenderer_isReadyForDisplay__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 120);
  return result;
}

- (void)setContentKeySession:(id)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__AVSampleBufferVideoRenderer_setContentKeySession___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

id __52__AVSampleBufferVideoRenderer_setContentKeySession___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 296), *(id *)(a1 + 40));
}

- (int)attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__AVSampleBufferVideoRenderer_attachToContentKeySession_contentKeyBoss_failedSinceAlreadyAttachedToAnotherSession___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v9;
  dispatch_sync(serialQueue, block);
  if (a5) {
    *a5 = *((unsigned char *)v10 + 24);
  }
  _Block_object_dispose(&v9, 8);
  return 0;
}

id __115__AVSampleBufferVideoRenderer_attachToContentKeySession_contentKeyBoss_failedSinceAlreadyAttachedToAnotherSession___block_invoke(uint64_t a1)
{
  id result = objc_loadWeak((id *)(*(void *)(a1 + 32) + 296));
  if (result)
  {
    char v3 = 1;
  }
  else
  {
    id result = objc_storeWeak((id *)(*(void *)(a1 + 32) + 296), *(id *)(a1 + 40));
    char v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (BOOL)attachedToExternalContentKeySession
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AVSampleBufferVideoRenderer_attachedToExternalContentKeySession__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __66__AVSampleBufferVideoRenderer_attachedToExternalContentKeySession__block_invoke(uint64_t a1)
{
  id result = objc_loadWeak((id *)(*(void *)(a1 + 32) + 296));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)removeDisplayLayer
{
  BOOL v3 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v3)
  {
    uint64_t v4 = v3;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AVSampleBufferVideoRenderer_removeDisplayLayer__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v4;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v4);
  }
}

uint64_t __49__AVSampleBufferVideoRenderer_removeDisplayLayer__block_invoke()
{
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v4 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v3 = v4;
  if (v4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, void))(v5 + 56);
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F34CA0];
    return v6(CMBaseObject, v7, 0);
  }
  return result;
}

- (id)contentKeySession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__36;
  uint64_t v10 = __Block_byref_object_dispose__36;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVSampleBufferVideoRenderer_contentKeySession__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __48__AVSampleBufferVideoRenderer_contentKeySession__block_invoke(uint64_t a1)
{
  id result = objc_loadWeak((id *)(*(void *)(a1 + 32) + 296));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isReadyForMoreMediaData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVSampleBufferVideoRenderer_isReadyForMoreMediaData__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFArrayRef __54__AVSampleBufferVideoRenderer_isReadyForMoreMediaData__block_invoke(const __CFArray *result)
{
  *(unsigned char *)(*(void *)(*((void *)result + 5) + 8) + 24) = *(unsigned char *)(*((void *)result + 4) + 121) ^ 1;
  uint64_t v1 = *((void *)result + 4);
  if (!*(unsigned char *)(v1 + 48))
  {
    CFArrayRef v2 = result;
    id result = *(const __CFArray **)(v1 + 56);
    if (!result || (id result = (const __CFArray *)CFArrayGetCount(result)) == 0) {
      *(unsigned char *)(*(void *)(*((void *)v2 + 5) + 8) + 24) = 0;
    }
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if ([a3 isEqualToString:@"outputObscuredDueToInsufficientExternalProtection"]) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVSampleBufferVideoRenderer;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)_statusString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Invalid";
  }
  else {
    return off_1E57B70A0[a3];
  }
}

- (AVQueuedSampleBufferRenderingStatus)status
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVSampleBufferVideoRenderer_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  AVQueuedSampleBufferRenderingStatus v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__AVSampleBufferVideoRenderer_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__36;
  uint64_t v10 = __Block_byref_object_dispose__36;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVSampleBufferVideoRenderer_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  AVQueuedSampleBufferRenderingStatus v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVSampleBufferVideoRenderer_error__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (OpaqueCMTimebase)timebase
{
  CFArrayRef v2 = self->_readOnlyVideoQueueTimebase;
  return v2;
}

- (int)_enqueueSingleSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferEnqueueingInfo:(id *)a4
{
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x3810000000;
  long long v30 = *MEMORY[0x1E4F1F9F8];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  __int16 v29 = &unk_194C75EBF;
  uint64_t v31 = v7;
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke;
  block[3] = &unk_1E57B3888;
  block[4] = self;
  void block[5] = &v26;
  void block[6] = &v22;
  dispatch_sync(serialQueue, block);
  if (*((_DWORD *)v23 + 6) >= 2u)
  {
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetOutputPresentationTimeStamp(&v15, a3);
    CMTime time1 = v15;
    CMTime time2 = *(CMTime *)(v27 + 4);
    CMTimeCompare(&time1, &time2);
    if (*((_DWORD *)v23 + 6) == 2)
    {
      uint64_t v9 = self->_serialQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_2;
      v17[3] = &unk_1E57B3FC0;
      CMTime v18 = v15;
      v17[4] = self;
      dispatch_sync(v9, v17);
    }
  }
  v15.value = 0;
  *(void *)&v15.timescale = &v15;
  v15.epoch = 0x2020000000;
  int v16 = 0;
  uint64_t v10 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v10)
  {
    videoQueueQueue = self->_videoQueueQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_3;
    v14[3] = &unk_1E57B6EC8;
    v14[4] = &v15;
    v14[5] = v10;
    v14[6] = a3;
    v14[7] = a4;
    dispatch_sync(videoQueueQueue, v14);
    CFRelease(v10);
  }
  int v12 = *(_DWORD *)(*(void *)&v15.timescale + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v12;
}

__n128 __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke(void *a1)
{
  uint64_t v1 = *(__n128 **)(a1[5] + 8);
  __n128 result = *(__n128 *)(a1[4] + 268);
  v1[3].n128_u64[0] = *(void *)(a1[4] + 284);
  v1[2] = result;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(a1[4] + 264);
  return result;
}

__n128 __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (__n128 *)(*(void *)(a1 + 32) + 268);
  __n128 result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(void *)(a1 + 56);
  *uint64_t v1 = result;
  return result;
}

uint64_t __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = (double *)a1[7];
  double v5 = *v4;
  double v6 = v4[1];
  double v7 = v4[2];
  double v8 = v4[3];
  double v9 = v4[4];
  double v10 = v4[5];
  double v12 = v4[6];
  double v11 = v4[7];
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  CMTime v15 = *(uint64_t (**)(uint64_t, uint64_t, void, double, double, double, double, double, double, double, double))(v14 + 16);
  if (v15) {
    uint64_t result = v15(v2, v3, 0, v5, v6, v7, v8, v9, v10, v12, v11);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

- ($8A865F3275AFFA793BA84D73056FEF19)_computeSampleBufferEnqueueingInfoForSampleBuffer:(SEL)a3
{
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  retstr->var0.CGPoint origin = 0u;
  retstr->var0.CGSize size = 0u;
  retstr->var1.CGPoint origin = 0u;
  retstr->var1.CGSize size = 0u;
  retstr->var0.CGSize size = CMVideoFormatDescriptionGetPresentationDimensions(FormatDescription, 1u, 1u);
  +[AVSampleBufferDisplayLayer _destRectForAspectRatio:](AVSampleBufferDisplayLayer, "_destRectForAspectRatio:");
  retstr->var1.origin.x = v7;
  retstr->var1.origin.y = v8;
  retstr->var1.size.width = v9;
  retstr->var1.size.height = v10;
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke;
  block[3] = &unk_1E57B6EF0;
  CGPoint origin = retstr->var0.origin;
  CGSize size = retstr->var0.size;
  CGSize v14 = retstr->var1.size;
  CGPoint v26 = retstr->var1.origin;
  CGSize v27 = v14;
  CGPoint v24 = origin;
  CGSize v25 = size;
  block[4] = self;
  void block[5] = &v28;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v29 + 24))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    CGSize v15 = retstr->var0.size;
    CGPoint v19 = retstr->var0.origin;
    CGSize v20 = v15;
    CGSize v16 = retstr->var1.size;
    CGPoint v21 = retstr->var1.origin;
    CGSize v22 = v16;
    v18[2] = __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke_2;
    v18[3] = &unk_1E57B6F18;
    v18[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v18);
  }
  _Block_object_dispose(&v28, 8);
  return result;
}

__n128 __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  if (!CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 64), *(CGRect *)(a1 + 48)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
    __n128 result = *(__n128 *)v2;
    long long v5 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v4 + 64) = *(_OWORD *)v2;
    *(_OWORD *)(v4 + 80) = v5;
  }
  return result;
}

void __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 32) + 40)), "_updatePresentationSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVSampleBufferVideoRenderer_enqueueSampleBuffer___block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v17 + 24))
  {
    if (CMSampleBufferGetFormatDescription(a3))
    {
      -[AVSampleBufferVideoRenderer _computeSampleBufferEnqueueingInfoForSampleBuffer:](self, "_computeSampleBufferEnqueueingInfoForSampleBuffer:", a3, 0, 0, 0, 0, 0, 0, 0, 0);
      [(AVSampleBufferVideoRenderer *)self enqueueSampleBuffer:a3 bufferEnqueueingInfo:v14];
    }
  }
  else
  {
    figVideoTargets = self->_figVideoTargets;
    if ((!figVideoTargets || CFArrayGetCount(figVideoTargets) <= 0) && !self->_shouldWaitForVideoTarget)
    {
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"An AVSampleBufferDisplayLayer or video target must be added to the AVSampleBufferVideoRenderer prior to enqueueing sample buffers.", v7, v8, v9, v10, v11, *(uint64_t *)&v14[0]), 0 reason userInfo];
      objc_exception_throw(v13);
    }
    memset(v14, 0, sizeof(v14));
    [(AVSampleBufferVideoRenderer *)self enqueueSampleBuffer:a3 bufferEnqueueingInfo:v14];
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __51__AVSampleBufferVideoRenderer_enqueueSampleBuffer___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferEnqueueingInfo:(id *)a4
{
  uint64_t v15 = 0;
  CFTypeRef cf = 0;
  if ([(AVSampleBufferVideoRenderer *)self status] == AVQueuedSampleBufferRenderingStatusFailed) {
    return;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (objc_loadWeak((id *)&self->_weakContentKeySession))
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    if (self->_lastCryptor && FigCFEqual())
    {
      FigSampleBufferSetDecryptor();
    }
    else
    {
      lastFormatDescription = self->_lastFormatDescription;
      self->_lastFormatDescription = FormatDescription;
      if (FormatDescription) {
        CFRetain(FormatDescription);
      }
      if (lastFormatDescription) {
        CFRelease(lastFormatDescription);
      }
      if (![objc_loadWeak((id *)&self->_weakContentKeySession) copyCryptorForFormatDescription:FormatDescription cryptorOut:&cf errorOut:&v15])goto LABEL_20; {
      lastCryptor = self->_lastCryptor;
      }
      CFTypeRef v10 = cf;
      self->_lastCryptor = (OpaqueFigCPECryptor *)cf;
      if (v10) {
        CFRetain(v10);
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
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVSampleBufferVideoRenderer_enqueueSampleBuffer_bufferEnqueueingInfo___block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  [(AVSampleBufferVideoRenderer *)self _setStatus:1 error:0];
  refcon[0] = self;
  refcon[1] = a4;
  CMSampleBufferCallForEachSample(a3, (OSStatus (__cdecl *)(CMSampleBufferRef, CMItemCount, void *))_enqueueSingleSampleBufferStatic, refcon);
  [(AVSampleBufferVideoRenderer *)self _refreshAboveHighWaterLevel];
LABEL_20:
  if (cf) {
    CFRelease(cf);
  }
  if (v15) {
    -[AVSampleBufferVideoRenderer _setStatus:error:](self, "_setStatus:error:", 2);
  }
}

uint64_t __72__AVSampleBufferVideoRenderer_enqueueSampleBuffer_bufferEnqueueingInfo___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 109) = 1;
  return result;
}

- (void)flush
{
}

- (void)flushAndRemoveImage
{
}

- (void)flushWithRemovalOfDisplayedImage:(BOOL)removeDisplayedImage completionHandler:(void *)handler
{
  BOOL v5 = removeDisplayedImage;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  [(AVSampleBufferVideoRenderer *)self setReadyForDisplayWithoutKVO:0];
  [(AVSampleBufferVideoRenderer *)self _callOldPrerollCompletionHandlerWithSuccess:0 andSetNewPrerollCompletionHandler:0 forRequestID:0];
  if (handler)
  {
    flushCallbackListQueue = self->_flushCallbackListQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_2;
    v27[3] = &unk_1E57B4540;
    v27[4] = self;
    v27[5] = handler;
    dispatch_sync(flushCallbackListQueue, v27);
    int v9 = 2;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v9 = 0;
  if (v5)
  {
LABEL_3:
    v9 |= 1u;
    CFTypeRef v10 = self->_serialQueue;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_3;
    v26[3] = &unk_1E57B1E80;
    v26[4] = self;
    dispatch_sync(v10, v26);
  }
LABEL_4:
  uint64_t v11 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v11)
  {
    videoQueueQueue = self->_videoQueueQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_4;
    v24[3] = &unk_1E57B6F40;
    v24[4] = &v29;
    v24[5] = v11;
    int v25 = v9;
    dispatch_sync(videoQueueQueue, v24);
    CFRelease(v11);
  }
  if (![(AVSampleBufferVideoRenderer *)self _createVideoQueueFailed])
  {
    int v13 = *((_DWORD *)v30 + 6);
    if (v13 != -12083 && v13 != -12785) {
      goto LABEL_24;
    }
  }
  [(AVSampleBufferVideoRenderer *)self _removeFigVideoQueueListeners];
  CFTypeRef cf = 0;
  int v14 = objc_msgSend(-[AVSampleBufferVideoRenderer currentFigVideoQueueFactory](self, "currentFigVideoQueueFactory"), "createVideoQueue:", &cf);
  *((_DWORD *)v30 + 6) = v14;
  if (!v14)
  {
    uint64_t v15 = self->_serialQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_5;
    v22[3] = &unk_1E57B2228;
    v22[4] = self;
    v22[5] = cf;
    dispatch_sync(v15, v22);
  }
  [(AVSampleBufferVideoRenderer *)self _addFigVideoQueueListeners];
  [(AVSampleBufferVideoRenderer *)self _resetStatusWithOSStatus:*((unsigned int *)v30 + 6)];
  [(AVSampleBufferVideoRenderer *)self _setCreateVideoQueueFailedWithOSStatus:*((unsigned int *)v30 + 6)];
  if (cf)
  {
    uint64_t v16 = self->_videoQueueQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_6;
    v20[3] = &unk_1E57B6F40;
    v20[4] = &v29;
    v20[5] = cf;
    int v21 = v9;
    dispatch_sync(v16, v20);
    CFTypeRef v17 = cf;
    if (!handler) {
      goto LABEL_22;
    }
    uint64_t v18 = v30;
    if (cf)
    {
      int v19 = *((_DWORD *)v30 + 6);
      if (!v19) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
  else
  {
    if (!handler) {
      goto LABEL_24;
    }
    uint64_t v18 = v30;
  }
  int v19 = *((_DWORD *)v18 + 6);
LABEL_21:
  [(AVSampleBufferVideoRenderer *)self _setStatus:2 error:AVLocalizedError(@"AVFoundationErrorDomain", v19, 0)];
  [(AVSampleBufferVideoRenderer *)self _flushComplete];
  CFTypeRef v17 = cf;
LABEL_22:
  if (v17) {
LABEL_23:
  }
    CFRelease(v17);
LABEL_24:
  [(AVSampleBufferVideoRenderer *)self _setRequiresFlushToResumeDecoding:0];
  [(AVSampleBufferVideoRenderer *)self _refreshAboveHighWaterLevel];
  [(AVSampleBufferVideoRenderer *)self resetUpcomingSampleBufferPresentationTimeExpectations];
  _Block_object_dispose(&v29, 8);
}

__n128 __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB28];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)(v1 + 64) = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)(v1 + 80) = v3;
  return result;
}

void __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [*(id *)(*(void *)(a1 + 32) + 224) addObject:v2];
}

uint64_t __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 200);
  uint64_t result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) _resetLastImageTime];
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  long long v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  if (v6) {
    uint64_t result = v6(v2, v3);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(const void **)(a1 + 40);
  uint64_t v3 = *(const void **)(v2 + 8);
  *(void *)(v2 + 8) = v1;
  if (v1) {
    CFRetain(v1);
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  long long v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  if (v6) {
    uint64_t result = v6(v2, v3);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_flushComplete
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__91;
  CFTypeRef v10 = __Block_byref_object_dispose__92;
  uint64_t v11 = 0;
  flushCallbackListQueue = self->_flushCallbackListQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVSampleBufferVideoRenderer__flushComplete__block_invoke;
  v5[3] = &unk_1E57B2160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(flushCallbackListQueue, v5);
  uint64_t v4 = (void *)v7[5];
  if (v4)
  {
    dispatch_async((dispatch_queue_t)self->_flushCallbackQueue, v4);
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __45__AVSampleBufferVideoRenderer__flushComplete__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 224) count];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 224) objectAtIndex:0];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 224);
      return [v5 removeObjectAtIndex:0];
    }
  }
  return result;
}

- (void)_callOldPrerollCompletionHandlerWithSuccess:(BOOL)a3 andSetNewPrerollCompletionHandler:(id)a4 forRequestID:(int)a5
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__91;
  CFTypeRef v17 = __Block_byref_object_dispose__92;
  uint64_t v18 = 0;
  queueForProtectingPrerollCompleteCallback = self->_queueForProtectingPrerollCompleteCallback;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke;
  block[3] = &unk_1E57B6F68;
  void block[5] = a4;
  void block[6] = &v13;
  block[4] = self;
  int v12 = a5;
  dispatch_sync(queueForProtectingPrerollCompleteCallback, block);
  if (v14[5])
  {
    queueForCallingPrerollCompleteCallback = self->_queueForCallingPrerollCompleteCallback;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke_2;
    v9[3] = &unk_1E57B6F90;
    v9[4] = &v13;
    BOOL v10 = a3;
    dispatch_async(queueForCallingPrerollCompleteCallback, v9);
  }
  _Block_object_dispose(&v13, 8);
}

void *__122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v2;
    *(void *)(*(void *)(a1 + 32) + 240) = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 248) = 0;
  }
  uint64_t result = *(void **)(a1 + 40);
  if (result)
  {
    uint64_t result = _Block_copy(result);
    *(void *)(*(void *)(a1 + 32) + 240) = result;
    *(_DWORD *)(*(void *)(a1 + 32) + 248) = *(_DWORD *)(a1 + 56);
  }
  return result;
}

void __122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  _Block_release(v2);
}

- (void)_completedDecodeForPrerollForRequestID:(int)a3
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3052000000;
  int v12 = __Block_byref_object_copy__91;
  uint64_t v13 = __Block_byref_object_dispose__92;
  uint64_t v14 = 0;
  queueForProtectingPrerollCompleteCallback = self->_queueForProtectingPrerollCompleteCallback;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke;
  block[3] = &unk_1E57B4150;
  int v8 = a3;
  block[4] = self;
  void block[5] = &v9;
  dispatch_sync(queueForProtectingPrerollCompleteCallback, block);
  if (v10[5])
  {
    queueForCallingPrerollCompleteCallback = self->_queueForCallingPrerollCompleteCallback;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke_2;
    v6[3] = &unk_1E57B3D90;
    v6[4] = &v9;
    dispatch_async(queueForCallingPrerollCompleteCallback, v6);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 240);
  if (v2)
  {
    if (*(_DWORD *)(result + 48) == *(_DWORD *)(v1 + 248))
    {
      *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = v2;
      *(void *)(*(void *)(result + 32) + 240) = 0;
    }
  }
  return result;
}

void __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  _Block_release(v2);
}

- (void)prerollDecodeWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  CFTypeRef v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v5 = FigAtomicIncrement32();
  [(AVSampleBufferVideoRenderer *)self _callOldPrerollCompletionHandlerWithSuccess:0 andSetNewPrerollCompletionHandler:a3 forRequestID:v5];
  uint64_t v6 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (!v6) {
    goto LABEL_5;
  }
  if (dword_1E9356A30)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  videoQueueQueue = self->_videoQueueQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVSampleBufferVideoRenderer_prerollDecodeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E57B6F40;
  block[4] = &v16;
  void block[5] = v6;
  int v13 = v5;
  dispatch_sync(videoQueueQueue, block);
  int v9 = *((_DWORD *)v17 + 6);
  CFRelease(v6);
  if (v9) {
LABEL_5:
  }
    -[AVSampleBufferVideoRenderer _callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:](self, "_callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:", 0, 0, 0, v10, v11);
  _Block_object_dispose(&v16, 8);
}

uint64_t __66__AVSampleBufferVideoRenderer_prerollDecodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 64);
  if (v6) {
    uint64_t result = v6(v2, v3);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  if (!a3)
  {
    int v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    int v15 = "queue != NULL";
    goto LABEL_6;
  }
  if (!a4)
  {
    int v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    int v15 = "block != nil";
LABEL_6:
    uint64_t v16 = (void *)[v13 exceptionWithName:v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v15), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  [(AVSampleBufferVideoRenderer *)self stopRequestingMediaData];
  uint64_t v11 = [[AVMediaDataRequester alloc] initWithMediaDataConsumer:self requestQueue:a3 requestBlock:a4];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AVSampleBufferVideoRenderer_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = self;
  void block[5] = v11;
  dispatch_sync(serialQueue, block);
  [(AVMediaDataRequester *)v11 startRequestingMediaData];
}

id __75__AVSampleBufferVideoRenderer_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 110) = 1;
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 112) = result;
  return result;
}

- (void)stopRequestingMediaData
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__36;
  int v8 = __Block_byref_object_dispose__36;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__AVSampleBufferVideoRenderer_stopRequestingMediaData__block_invoke;
  v3[3] = &unk_1E57B2160;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(serialQueue, v3);
  [(id)v5[5] invalidate];

  _Block_object_dispose(&v4, 8);
}

uint64_t __54__AVSampleBufferVideoRenderer_stopRequestingMediaData__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 110))
  {
    *(unsigned char *)(v1 + 110) = 0;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 112);
    *(void *)(*(void *)(result + 32) + 112) = 0;
  }
  return result;
}

- (BOOL)hasSufficientMediaDataForReliablePlaybackStart
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v9 = ![(AVSampleBufferVideoRenderer *)self isReadyForMoreMediaData];
  serialQueue = v2->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__AVSampleBufferVideoRenderer_hasSufficientMediaDataForReliablePlaybackStart__block_invoke;
  v5[3] = &unk_1E57B2160;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

CFArrayRef __77__AVSampleBufferVideoRenderer_hasSufficientMediaDataForReliablePlaybackStart__block_invoke(const __CFArray *result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(unsigned char *)(v1 + 48))
  {
    CFArrayRef v2 = result;
    id result = *(const __CFArray **)(v1 + 56);
    if (!result || (id result = (const __CFArray *)CFArrayGetCount(result)) == 0) {
      *(unsigned char *)(*(void *)(*((void *)v2 + 5) + 8) + 24) = 0;
    }
  }
  return result;
}

- (BOOL)requiresFlushToResumeDecoding
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AVSampleBufferVideoRenderer_requiresFlushToResumeDecoding__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__AVSampleBufferVideoRenderer_requiresFlushToResumeDecoding__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 106);
  return result;
}

- (void)addSampleBufferDisplayLayer:(id)a3
{
  if ([(AVSampleBufferVideoRenderer *)self _hasEverEnqueued]
    && ![(AVSampleBufferVideoRenderer *)self shouldWaitForVideoTarget])
  {
    int v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot add AVSampleBufferDisplayLayer while enqueueing sample buffers.", v6, v7, v8, v9, v10, v20), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferVideoRenderer_addSampleBufferDisplayLayer___block_invoke;
  block[3] = &unk_1E57B6FB8;
  void block[5] = a3;
  void block[6] = &v22;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v23 + 24))
  {
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"An AVSampleBufferDisplayLayer is already attached to the AVSampleBufferVideoRenderer.  Only 1 is allowed at a time.", v12, v13, v14, v15, v16, v20), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  CFTypeRef v17 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v17)
  {
    [(AVSampleBufferVideoRenderer *)self _setContentLayerOnFigVideoQueue:v17];
    CFRelease(v17);
  }
  _Block_object_dispose(&v22, 8);
}

id *__59__AVSampleBufferVideoRenderer_addSampleBufferDisplayLayer___block_invoke(id *result)
{
  uint64_t v1 = result;
  CFArrayRef v2 = (id *)result[4];
  if (*((unsigned char *)v2 + 48))
  {
    *(unsigned char *)(*((void *)result[6] + 1) + 24) = 1;
  }
  else
  {
    id result = (id *)objc_storeWeak(v2 + 5, result[5]);
    *((unsigned char *)v1[4] + 48) = 1;
  }
  return result;
}

- (BOOL)shouldWaitForVideoTarget
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVSampleBufferVideoRenderer_shouldWaitForVideoTarget__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__AVSampleBufferVideoRenderer_shouldWaitForVideoTarget__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 108);
  return result;
}

- (void)setShouldWaitForVideoTarget:(BOOL)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v13 = a3;
  block[4] = self;
  void block[5] = &v14;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v15 + 24))
  {
    uint64_t v6 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    if (v6)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke_2;
      void v8[3] = &unk_1E57B6E78;
      v8[4] = v10;
      v8[5] = v6;
      BOOL v9 = a3;
      dispatch_sync(videoQueueQueue, v8);
      CFRelease(v6);
    }
    _Block_object_dispose(v10, 8);
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 108) != v2)
  {
    *(unsigned char *)(v1 + 108) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    int v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    int v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CE0], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_updateVideoTargetsOnVideoQueue
{
  char v3 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke;
    block[3] = &unk_1E57B2110;
    block[4] = self;
    void block[5] = &v11;
    dispatch_sync(serialQueue, block);
    if (v12[3])
    {
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x2020000000;
      int v9 = 0;
      videoQueueQueue = self->_videoQueueQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke_2;
      void v7[3] = &unk_1E57B40A0;
      v7[5] = &v11;
      v7[6] = v4;
      v7[4] = v8;
      dispatch_sync(videoQueueQueue, v7);
      CFRelease((CFTypeRef)v12[3]);
      _Block_object_dispose(v8, 8);
    }
    CFRelease(v4);
    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke(uint64_t a1)
{
  uint64_t result = FigCFArrayCreateMutableCopy();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CF8], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)addVideoTarget:(OpaqueFigVideoTarget *)a3
{
  if ([(AVSampleBufferVideoRenderer *)self _hasEverEnqueued]
    && ![(AVSampleBufferVideoRenderer *)self shouldWaitForVideoTarget])
  {
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot add video target while enqueueing sample buffers.", v6, v7, v8, v9, v10, v19), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AVSampleBufferVideoRenderer_addVideoTarget___block_invoke;
    block[3] = &unk_1E57B3A60;
    void block[5] = &v21;
    void block[6] = a3;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    if (*((unsigned char *)v22 + 24))
    {
      char v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The FigVideoTarget is already attached to the AVSampleBufferVideoRenderer.", v12, v13, v14, v15, v16, v19), 0 reason userInfo];
      objc_exception_throw(v17);
    }
    [(AVSampleBufferVideoRenderer *)self _updateVideoTargetsOnVideoQueue];
  }
  _Block_object_dispose(&v21, 8);
}

void __46__AVSampleBufferVideoRenderer_addVideoTarget___block_invoke(void *a1)
{
  CFIndex v2 = 0;
  while (1)
  {
    CFArrayRef Count = *(const __CFArray **)(a1[4] + 56);
    if (Count) {
      CFArrayRef Count = (const __CFArray *)CFArrayGetCount(Count);
    }
    if (v2 >= (uint64_t)Count) {
      break;
    }
    uint64_t v4 = (const void *)a1[6];
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[4] + 56), v2++);
    if (v4 == ValueAtIndex)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      break;
    }
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v6 = *(__CFArray **)(a1[4] + 56);
    uint64_t v7 = (const void *)a1[6];
    CFArrayAppendValue(v6, v7);
  }
}

- (int)_setContentLayerOnFigVideoQueue:(OpaqueFigVideoQueue *)a3
{
  char v3 = a3;
  if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x199715AE0](self, a2);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDisplayLayer);
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      uint64_t v8 = [WeakRetained _contentLayer];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        int v16 = 0;
        CFRetain(v3);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke;
        v12[3] = &unk_1E57B6FE0;
        v12[6] = &v13;
        v12[7] = v3;
        v12[4] = self;
        v12[5] = v9;
        AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v12);
        if ([MEMORY[0x1E4F29060] isMainThread]) {
          LODWORD(v3) = *((_DWORD *)v14 + 6);
        }
        else {
          LODWORD(v3) = 0;
        }
        _Block_object_dispose(&v13, 8);
      }
      else
      {
        LODWORD(v3) = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_3;
      block[3] = &unk_1E57B1E80;
      block[4] = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return (int)v3;
}

void __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_2;
  block[3] = &unk_1E57B3B20;
  uint64_t v4 = *(void *)(a1 + 56);
  long long v3 = *(_OWORD *)(a1 + 40);
  dispatch_sync(v1, block);
}

void __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    int v7 = v6(CMBaseObject, *MEMORY[0x1E4F34CA0], v2);
  }
  else {
    int v7 = -12782;
  }
  uint64_t v8 = (const void *)a1[6];
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v7;
  CFRelease(v8);
}

void __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_3(uint64_t a1)
{
}

- (void)_didFinishSuspension:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A30)
  {
    int v12 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v5)
  {
    uint64_t v6 = v5;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__AVSampleBufferVideoRenderer__didFinishSuspension___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = v6;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v6);
  }
  [(AVSampleBufferVideoRenderer *)self _setRequiresFlushToResumeDecoding:1];
  [(AVSampleBufferVideoRenderer *)self _setStatus:2 error:AVLocalizedError(@"AVFoundationErrorDomain", -11847, 0)];
}

uint64_t __52__AVSampleBufferVideoRenderer__didFinishSuspension___block_invoke()
{
  uint64_t result = FigVideoQueueGetCMBaseObject();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v4 = *(void *)(VTable + 8);
    uint64_t result = VTable + 8;
    uint64_t v3 = v4;
    uint64_t v5 = v4 ? v3 : 0;
    uint64_t v6 = *(uint64_t (**)(uint64_t))(v5 + 24);
    if (v6)
    {
      return v6(v1);
    }
  }
  return result;
}

- (NSString)description
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVSampleBufferVideoRenderer_description__block_invoke;
  block[3] = &unk_1E57B3888;
  void block[4] = self;
  void block[5] = &v14;
  void block[6] = &v10;
  dispatch_sync(serialQueue, block);
  uint64_t v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = (NSString *)[v4 stringWithFormat:@"<%@: %p, AVSBDLs = %d, FVTs = %d>", v6, self, *((unsigned int *)v15 + 6), *((unsigned int *)v11 + 6)];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

CFArrayRef __42__AVSampleBufferVideoRenderer_description__block_invoke(void *a1)
{
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = *(unsigned __int8 *)(a1[4] + 48);
  CFArrayRef result = *(const __CFArray **)(a1[4] + 56);
  if (result) {
    CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
  }
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakContentKeySession);
  objc_destroyWeak((id *)&self->_weakReferenceToSynchronizer);
  objc_destroyWeak((id *)&self->_weakDisplayLayer);
}

- (id)videoPerformanceMetrics
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  char v25 = __Block_byref_object_copy__36;
  CGPoint v26 = __Block_byref_object_dispose__36;
  uint64_t v27 = 0;
  uint64_t v3 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__AVSampleBufferVideoRenderer_VideoPerformanceMetricsPrivate__videoPerformanceMetrics__block_invoke;
    block[3] = &unk_1E57B4010;
    void block[4] = &v22;
    void block[5] = v3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v3);
  }
  uint64_t v5 = (void *)[(id)v23[5] objectForKey:*MEMORY[0x1E4F34BE0]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x1E4F34BE8];
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      uint64_t v11 = (void *)[v10 objectForKey:v8];
      if (v11)
      {
        if (![v11 intValue]) {
          break;
        }
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v28 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    uint64_t v10 = 0;
  }
  id v12 = (id)[(id)v23[5] mutableCopy];
  id v13 = v12;
  if (v10) {
    [v12 addEntriesFromDictionary:v10];
  }
  uint64_t v14 = [[AVVideoPerformanceMetrics alloc] initWithDictionary:v13];

  uint64_t v15 = v14;
  _Block_object_dispose(&v22, 8);
  return v15;
}

uint64_t __86__AVSampleBufferVideoRenderer_VideoPerformanceMetricsPrivate__videoPerformanceMetrics__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F34CC0];
    uint64_t v10 = *MEMORY[0x1E4F1CF80];
    return v8(CMBaseObject, v9, v10, v1 + 40);
  }
  return result;
}

- (void)loadVideoPerformanceMetricsWithCompletionHandler:(id)a3
{
  videoPerformanceMetricsQueue = self->_videoPerformanceMetricsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __132__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoPerformanceMetrics__loadVideoPerformanceMetricsWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E57B4540;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(videoPerformanceMetricsQueue, v4);
}

uint64_t __132__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoPerformanceMetrics__loadVideoPerformanceMetricsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) videoPerformanceMetrics];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __125__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererProtectedContent__outputObscuredDueToInsufficientExternalProtection__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __125__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererProtectedContent__outputObscuredDueToInsufficientExternalProtection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)setPreventsCapture:(BOOL)a3
{
  uint64_t v5 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  if (v5)
  {
    uint64_t v6 = v5;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__setPreventsCapture___block_invoke;
    block[3] = &unk_1E57B6E78;
    void block[4] = v10;
    void block[5] = v6;
    BOOL v9 = a3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v6);
  }
  _Block_object_dispose(v10, 8);
}

uint64_t __94__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__setPreventsCapture___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CD8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)preventsCapture
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  char v3 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__preventsCapture__block_invoke;
    block[3] = &unk_1E57B40A0;
    void block[4] = v13;
    void block[5] = &v9;
    void block[6] = v3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v3);
  }
  uint64_t v5 = v10[3];
  if (v5) {
    CFRelease((CFTypeRef)v10[3]);
  }
  BOOL v6 = *MEMORY[0x1E4F1CFD0] == v5;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
  return v6;
}

uint64_t __90__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__preventsCapture__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v5 + 48);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CD8], *MEMORY[0x1E4F1CF80], v2 + 24);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v14 = a3;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v16 + 24))
  {
    BOOL v6 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    if (v6)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2;
      void v8[3] = &unk_1E57B7008;
      v8[4] = v11;
      v8[5] = v6;
      BOOL v9 = a3;
      char v10 = 0;
      dispatch_sync(videoQueueQueue, v8);
      CFRelease(v6);
    }
    _Block_object_dispose(v11, 8);
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 104) != v2)
  {
    *(unsigned char *)(v1 + 104) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F1CFD0];
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v4 = *MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t))(v7 + 56);
  if (v8) {
    uint64_t result = v8(CMBaseObject, *MEMORY[0x1E4F34CD0], v4);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(unsigned char *)(a1 + 49))
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v10 = v2;
    }
    else {
      uint64_t v10 = v3;
    }
    uint64_t v11 = FigVideoQueueGetCMBaseObject();
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    BOOL v14 = *(uint64_t (**)(uint64_t, void, uint64_t))(v13 + 56);
    if (v14) {
      uint64_t result = v14(v11, *MEMORY[0x1E4F34CC8], v10);
    }
    else {
      uint64_t result = 4294954514;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __126__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __126__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 104);
  return result;
}

- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v13 = a3;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v15 + 24))
  {
    uint64_t v6 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    if (v6)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2;
      void v8[3] = &unk_1E57B6E78;
      v8[4] = v10;
      v8[5] = v6;
      BOOL v9 = a3;
      dispatch_sync(videoQueueQueue, v8);
      CFRelease(v6);
    }
    _Block_object_dispose(v10, 8);
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 105) != v2)
  {
    *(unsigned char *)(v1 + 105) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    int v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    int v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CC8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __138__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __138__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 105);
  return result;
}

- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v13 = a3;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v15 + 24))
  {
    uint64_t v6 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    if (v6)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke_2;
      void v8[3] = &unk_1E57B6E78;
      v8[4] = v10;
      v8[5] = v6;
      BOOL v9 = a3;
      dispatch_sync(videoQueueQueue, v8);
      CFRelease(v6);
    }
    _Block_object_dispose(v10, 8);
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 107) != v2)
  {
    *(unsigned char *)(v1 + 107) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    int v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    int v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34C98], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)_disallowsVideoLayerDisplayCompositing
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __116__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___disallowsVideoLayerDisplayCompositing__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __116__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___disallowsVideoLayerDisplayCompositing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 107);
  return result;
}

- (BOOL)_setUpcomingPresentationTimeExpectations:(int)a3 minimumPresentationTime:(id *)a4
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__AVSampleBufferVideoRenderer_PowerOptimization___setUpcomingPresentationTimeExpectations_minimumPresentationTime___block_invoke;
  void v7[3] = &unk_1E57B7030;
  int v8 = a3;
  v7[4] = self;
  v7[5] = &v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  dispatch_sync(serialQueue, v7);
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

__n128 __115__AVSampleBufferVideoRenderer_PowerOptimization___setUpcomingPresentationTimeExpectations_minimumPresentationTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 48);
  if (*(_DWORD *)(v1 + 264) != v2)
  {
    *(_DWORD *)(v1 + 264) = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if ((*(_DWORD *)(a1 + 64) & 0x1D) == 1)
  {
    char v3 = (__n128 *)(*(void *)(a1 + 32) + 268);
    __n128 result = *(__n128 *)(a1 + 52);
    v3[1].n128_u64[0] = *(void *)(a1 + 68);
    __n128 *v3 = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)expectMinimumUpcomingSampleBufferPresentationTime:(id *)a3
{
  if ((a3->var2 & 0x1D) == 1)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
    if ([(AVSampleBufferVideoRenderer *)self _setUpcomingPresentationTimeExpectations:3 minimumPresentationTime:&v9])
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F34D10], (const void *)*MEMORY[0x1E4F1CFD0]);
      $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
      FigCFDictionarySetCMTime();
      v9.var0 = 0;
      *(void *)&v9.var1 = &v9;
      v9.var3 = 0x2020000000;
      int v10 = 0;
      uint64_t v6 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
      if (v6)
      {
        videoQueueQueue = self->_videoQueueQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __100__AVSampleBufferVideoRenderer_PowerOptimization__expectMinimumUpcomingSampleBufferPresentationTime___block_invoke;
        block[3] = &unk_1E57B7058;
        void block[4] = &v9;
        void block[5] = v6;
        void block[6] = Mutable;
        dispatch_sync(videoQueueQueue, block);
        CFRelease(v6);
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      _Block_object_dispose(&v9, 8);
    }
  }
}

uint64_t __100__AVSampleBufferVideoRenderer_PowerOptimization__expectMinimumUpcomingSampleBufferPresentationTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CF0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes
{
  long long v7 = *MEMORY[0x1E4F1F9F8];
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  if ([(AVSampleBufferVideoRenderer *)self _setUpcomingPresentationTimeExpectations:2 minimumPresentationTime:&v7])
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F34D10], (const void *)*MEMORY[0x1E4F1CFC8]);
    *(void *)&long long v7 = 0;
    *((void *)&v7 + 1) = &v7;
    uint64_t v8 = 0x2020000000;
    int v9 = 0;
    uint64_t v4 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
    if (v4)
    {
      videoQueueQueue = self->_videoQueueQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __116__AVSampleBufferVideoRenderer_PowerOptimization__expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes__block_invoke;
      block[3] = &unk_1E57B7058;
      void block[4] = &v7;
      void block[5] = v4;
      void block[6] = Mutable;
      dispatch_sync(videoQueueQueue, block);
      CFRelease(v4);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    _Block_object_dispose(&v7, 8);
  }
}

uint64_t __116__AVSampleBufferVideoRenderer_PowerOptimization__expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CF0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)resetUpcomingSampleBufferPresentationTimeExpectations
{
  long long v7 = *MEMORY[0x1E4F1FA08];
  long long v9 = *MEMORY[0x1E4F1FA08];
  uint64_t v3 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
  uint64_t v10 = v3;
  if ([(AVSampleBufferVideoRenderer *)self _setUpcomingPresentationTimeExpectations:1 minimumPresentationTime:&v9])
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F34D10], (const void *)*MEMORY[0x1E4F1CFD0]);
    long long v9 = v7;
    uint64_t v10 = v3;
    FigCFDictionarySetCMTime();
    *(void *)&long long v9 = 0;
    *((void *)&v9 + 1) = &v9;
    uint64_t v10 = 0x2020000000;
    int v11 = 0;
    uint64_t v5 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
    if (v5)
    {
      videoQueueQueue = self->_videoQueueQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __103__AVSampleBufferVideoRenderer_PowerOptimization__resetUpcomingSampleBufferPresentationTimeExpectations__block_invoke;
      block[3] = &unk_1E57B7058;
      void block[4] = &v9;
      void block[5] = v5;
      void block[6] = Mutable;
      dispatch_sync(videoQueueQueue, block);
      CFRelease(v5);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __103__AVSampleBufferVideoRenderer_PowerOptimization__resetUpcomingSampleBufferPresentationTimeExpectations__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34CF0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_updateVideoOutputs
{
  uint64_t v3 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v3)
  {
    uint64_t v4 = v3;
    serialQueue = self->_serialQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    void v6[5] = v4;
    dispatch_sync(serialQueue, v6);
    CFRelease(v4);
  }
}

void __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 200);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _visualContext];
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = 0;
  long long v9 = *(NSObject **)(*(void *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke_2;
  block[3] = &unk_1E57B3B20;
  uint64_t v10 = *(void *)(a1 + 40);
  void block[5] = v12;
  void block[6] = v10;
  void block[4] = v2;
  dispatch_sync(v9, block);
  _Block_object_dispose(v12, 8);
}

uint64_t __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34D00], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)addOutput:(id)a3
{
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__addOutput___block_invoke;
    block[3] = &unk_1E57B3270;
    void block[5] = a3;
    void block[6] = &v14;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
    if (*((unsigned char *)v15 + 24))
    {
      int v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The AVSampleBufferVideoOutput has already been added to the AVSampleBufferVideoRenderer.", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
      objc_exception_throw(v11);
    }
    [(AVSampleBufferVideoRenderer *)self _updateVideoOutputs];
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __77__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__addOutput___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 200) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void **)(a1[4] + 200);
    return [v4 addObject:v3];
  }
  return result;
}

- (void)removeOutput:(id)a3
{
  if (a3)
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__removeOutput___block_invoke;
    block[3] = &unk_1E57B3270;
    void block[5] = a3;
    void block[6] = &v14;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
    if (!*((unsigned char *)v15 + 24))
    {
      int v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The video target was removed, but not already attached to AVSampleBufferVideoRenderer.", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
      objc_exception_throw(v11);
    }
    [(AVSampleBufferVideoRenderer *)self _updateVideoOutputs];
    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __80__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__removeOutput___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 200) indexOfObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0x7FFFFFFFFFFFFFFFLL;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void **)(a1[4] + 200);
    return [v4 removeObject:v3];
  }
  return result;
}

- (NSArray)outputs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__36;
  uint64_t v10 = __Block_byref_object_dispose__36;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__outputs__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  uint64_t v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __74__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__outputs__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 200);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (__CVBuffer)copyDisplayedPixelBuffer
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(AVSampleBufferVideoRenderer *)self _copyVideoQueue];
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__copyDisplayedPixelBuffer__block_invoke;
    void v7[3] = &unk_1E57B7080;
    void v7[6] = &v10;
    void v7[7] = v3;
    v7[4] = self;
    v7[5] = v8;
    dispatch_sync(videoQueueQueue, v7);
    CFRelease(v3);
  }
  uint64_t v5 = (__CVBuffer *)v11[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __91__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__copyDisplayedPixelBuffer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v5 + 48);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F34C90], *MEMORY[0x1E4F1CF80], v2 + 24);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v8 = dword_1E9356A30 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end