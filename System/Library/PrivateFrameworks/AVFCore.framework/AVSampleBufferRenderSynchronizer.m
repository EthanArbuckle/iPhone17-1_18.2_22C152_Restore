@interface AVSampleBufferRenderSynchronizer
+ (id)_makeSTSLabel;
+ (id)_videoRendererForRenderer:(id)a3;
+ (id)currentFigRenderSynchronizerFactory;
+ (void)enableSTSLabels;
+ (void)setFigRenderSynchronizerFactory:(id)a3 forQueue:(id)a4;
- (AVSampleBufferRenderSynchronizer)init;
- (BOOL)_addRenderer:(id)a3 error:(id *)a4;
- (BOOL)_canAddRendererInternal:(id)a3 error:(id *)a4;
- (BOOL)_multipleAudioRenderersDisallowed;
- (BOOL)_rendererConfigurationIsValid:(id *)a3;
- (BOOL)_scheduleTimedRendererRemovalAtTime:(id)a3 atTime:(id *)a4 withClientCompletionHandler:(id)a5;
- (BOOL)delaysRateChangeUntilHasSufficientMediaData;
- (BOOL)isDefunct;
- (BOOL)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5 error:(id *)a6;
- (CMTime)currentTime;
- (CMTimebaseRef)timebase;
- (NSArray)renderers;
- (float)rate;
- (id)_createOnceTimebaseObserverForRemovalOfRenderer:(id)a3 atTime:(id *)a4;
- (id)_getClientCompletionHandlerForRenderer:(id)a3;
- (id)_getTimebaseObserverForRenderer:(id)a3;
- (id)addBoundaryTimeObserverForTimes:(NSArray *)times queue:(dispatch_queue_t)queue usingBlock:(void *)block;
- (id)addPeriodicTimeObserverForInterval:(CMTime *)interval queue:(dispatch_queue_t)queue usingBlock:(void *)block;
- (int)_initializeTimebase;
- (int)_setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5;
- (int64_t)_addedAudioRendererCount;
- (int64_t)_addedAudioRendererCountInternal;
- (void)_performRendererRemoval:(id)a3;
- (void)_removeTimebaseObserverForRenderer:(id)a3;
- (void)_storeObserver:(id)a3 clientCompletionHandler:(id)a4 forRenderer:(id)a5;
- (void)_updateRateFromTimebase;
- (void)addRenderer:(id)renderer;
- (void)dealloc;
- (void)removeRenderer:(id)a3 atTime:(id *)a4 withCompletionHandler:(id)a5;
- (void)removeRenderer:(id)renderer atTime:(CMTime *)time completionHandler:(void *)completionHandler;
- (void)removeTimeObserver:(id)observer;
- (void)setDelaysRateChangeUntilHasSufficientMediaData:(BOOL)delaysRateChangeUntilHasSufficientMediaData;
- (void)setRate:(float)rate;
- (void)setRate:(float)rate time:(CMTime *)time;
- (void)setRate:(float)rate time:(CMTime *)time atHostTime:(CMTime *)hostTime;
@end

@implementation AVSampleBufferRenderSynchronizer

- (AVSampleBufferRenderSynchronizer)init
{
  AVTelemetryGenerateID();
  v3 = (void *)[(id)objc_opt_class() currentFigRenderSynchronizerFactory];
  uint64_t v15 = 0;
  id v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v14.receiver = self;
  v14.super_class = (Class)AVSampleBufferRenderSynchronizer;
  v5 = [(AVSampleBufferRenderSynchronizer *)&v14 init];
  if (v5)
  {
    v6 = objc_alloc_init(AVSampleBufferRenderSynchronizerInternal);
    v5->_synchronizerInternal = v6;
    if (!v6) {
      goto LABEL_10;
    }
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_synchronizerInternal->rateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebufferrendersynchronizer.ratequeue", v7);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_synchronizerInternal->figSynchronizerAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebufferrendersynchronizer.synchronizeraccessqueue", v8);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_synchronizerInternal->rendererListQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebufferrendersynchronizer.rendererlistqueue", v9);
    v5->_synchronizerInternal->renderers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_synchronizerInternal->timedRenderRemovals = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    synchronizerInternal = v5->_synchronizerInternal;
    if (!synchronizerInternal->rateQueue) {
      goto LABEL_10;
    }
    if (synchronizerInternal->rendererListQueue
      && synchronizerInternal->figSynchronizerAccessQueue
      && synchronizerInternal->renderers
      && synchronizerInternal->timedRenderRemovals
      && (synchronizerInternal->rate = 0.0,
          (v5->_synchronizerInternal->figSynchronizer = (OpaqueFigSampleBufferRenderSynchronizer *)[v3 createRenderSynchronizerWithAllocator:0 options:0 error:&v15]) != 0)&& !-[AVSampleBufferRenderSynchronizer _initializeTimebase](v5, "_initializeTimebase"))
    {
      v12 = v5->_synchronizerInternal;
      CMTimebaseGetTime(&v13, [(AVSampleBufferRenderSynchronizer *)v5 timebase]);
      *(CMTime *)(&v12->rate + 1) = v13;
      v5->_synchronizerInternal->STSLabelSinks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v5->_synchronizerInternal->weakObserver = [[AVWeakReference alloc] initWithReferencedObject:v5];
      [v4 addListenerWithWeakReference:v5->_synchronizerInternal->weakObserver callback:avrendersynchronizer_timebaseRateChanged name:*MEMORY[0x1E4F1FA58] object:v5->_synchronizerInternal->readOnlyTimebase flags:0];
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v5;
}

- (int)_initializeTimebase
{
  CFTypeRef cf = 0;
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(OpaqueFigSampleBufferRenderSynchronizer *, CFTypeRef *))(v5 + 32);
  if (!v6) {
    return -12782;
  }
  int v7 = v6(figSynchronizer, &cf);
  if (v7)
  {
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    self->_synchronizerInternal->readOnlyTimebase = (OpaqueCMTimebase *)cf;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  synchronizerInternal = self->_synchronizerInternal;
  if (synchronizerInternal)
  {
    if (synchronizerInternal->weakObserver)
    {
      objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_synchronizerInternal->weakObserver, avrendersynchronizer_timebaseRateChanged, *MEMORY[0x1E4F1FA58], self->_synchronizerInternal->readOnlyTimebase);
      synchronizerInternal = self->_synchronizerInternal;
    }
    uint64_t v4 = (void *)[(NSMutableArray *)synchronizerInternal->renderers copy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          avrendersynchronize_performRendererRemoval((uint64_t)synchronizerInternal, *(void **)(*((void *)&v16 + 1) + 8 * i));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    v9 = self->_synchronizerInternal;
    readOnlyTimebase = v9->readOnlyTimebase;
    if (readOnlyTimebase)
    {
      CFRelease(readOnlyTimebase);
      self->_synchronizerInternal->readOnlyTimebase = 0;
      v9 = self->_synchronizerInternal;
    }
    figSynchronizer = v9->figSynchronizer;
    if (figSynchronizer)
    {
      CFRelease(figSynchronizer);
      self->_synchronizerInternal->figSynchronizer = 0;
      v9 = self->_synchronizerInternal;
    }
    rateQueue = v9->rateQueue;
    if (rateQueue)
    {
      dispatch_release(rateQueue);
      v9 = self->_synchronizerInternal;
    }
    figSynchronizerAccessQueue = v9->figSynchronizerAccessQueue;
    if (figSynchronizerAccessQueue)
    {
      dispatch_release(figSynchronizerAccessQueue);
      v9 = self->_synchronizerInternal;
    }
    rendererListQueue = v9->rendererListQueue;
    if (rendererListQueue)
    {
      dispatch_release(rendererListQueue);
      v9 = self->_synchronizerInternal;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)AVSampleBufferRenderSynchronizer;
  [(AVSampleBufferRenderSynchronizer *)&v15 dealloc];
}

+ (void)enableSTSLabels
{
  sParticipatesInSTS = 1;
}

+ (id)_makeSTSLabel
{
  if (_makeSTSLabel_onceToken != -1) {
    dispatch_once(&_makeSTSLabel_onceToken, &__block_literal_global_35);
  }
  if (!sParticipatesInSTS) {
    return 0;
  }
  uint64_t v2 = getpid();
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.avfoundation.STS.%d-%d", v2, FigAtomicIncrement32());
}

void __49__AVSampleBufferRenderSynchronizer__makeSTSLabel__block_invoke()
{
  if (!sParticipatesInSTS) {
    sParticipatesInSTS = FigGetCFPreferenceNumberWithDefault();
  }
}

- (CMTimebaseRef)timebase
{
  readOnlyTimebase = self->_synchronizerInternal->readOnlyTimebase;
  if (readOnlyTimebase) {
    readOnlyTimebase = (void *)CFRetain(readOnlyTimebase);
  }
  return (CMTimebaseRef)readOnlyTimebase;
}

- (CMTime)currentTime
{
  memset(&v16, 0, sizeof(v16));
  CMTimebaseGetTime(&v16, [(AVSampleBufferRenderSynchronizer *)self timebase]);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3810000000;
  CMTime v13 = &unk_194C75EBF;
  long long v14 = *MEMORY[0x1E4F1F9F8];
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  rateQueue = self->_synchronizerInternal->rateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVSampleBufferRenderSynchronizer_currentTime__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(rateQueue, block);
  CMTime time1 = v16;
  CMTime v7 = *(CMTime *)(v11 + 4);
  CMTimeMaximum(retstr, &time1, &v7);
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __47__AVSampleBufferRenderSynchronizer_currentTime__block_invoke(uint64_t a1)
{
  v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(v2 + 36);
  v1[3].n128_u64[0] = *(void *)(v2 + 52);
  v1[2] = result;
  return result;
}

- (float)rate
{
  uint64_t v6 = 0;
  CMTime v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  rateQueue = self->_synchronizerInternal->rateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVSampleBufferRenderSynchronizer_rate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rateQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __40__AVSampleBufferRenderSynchronizer_rate__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setRate:(float)rate
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  long long v5 = *MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(AVSampleBufferRenderSynchronizer *)self setRate:&v5 time:COERCE_DOUBLE(__PAIR64__(DWORD1(v5), LODWORD(rate)))];
}

- (void)setRate:(float)rate time:(CMTime *)time
{
  CMTime v6 = *time;
  long long v4 = *MEMORY[0x1E4F1F9F8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  -[AVSampleBufferRenderSynchronizer setRate:time:atHostTime:](self, "setRate:time:atHostTime:", &v6, &v4);
}

- (void)setRate:(float)rate time:(CMTime *)time atHostTime:(CMTime *)hostTime
{
  CMTime v6 = *time;
  CMTime v5 = *hostTime;
  -[AVSampleBufferRenderSynchronizer _setRate:time:atHostTime:](self, "_setRate:time:atHostTime:", &v6, &v5);
}

- (BOOL)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5 error:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a5;
  signed int v7 = -[AVSampleBufferRenderSynchronizer _setRate:time:atHostTime:](self, "_setRate:time:atHostTime:", &v12, &v11);
  signed int v8 = v7;
  if (v7)
  {
    uint64_t v10 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
    if (a6) {
      *a6 = v10;
    }
  }
  return v8 == 0;
}

- (int)_setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5
{
  if (a3 < 0.0)
  {
    uint64_t v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a5, v5, v6, v7, v8, (uint64_t)"newRate >= 0.0"), 0 reason userInfo];
    objc_exception_throw(v21);
  }
  float v12 = a3;
  uint64_t v34 = 0;
  uint64_t v30 = 0;
  v31 = (float *)&v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  if (![(AVSampleBufferRenderSynchronizer *)self _rendererConfigurationIsValid:&v34])
  {
    double v13 = v12;
    float v12 = 0.0;
    NSLog(&cfstr_InvalidRendere.isa, *(void *)&v13);
  }
  rateQueue = self->_synchronizerInternal->rateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AVSampleBufferRenderSynchronizer__setRate_time_atHostTime___block_invoke;
  block[3] = &unk_1E57B71D8;
  block[4] = self;
  block[5] = &v30;
  float v27 = v12;
  long long v28 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  dispatch_sync(rateQueue, block);
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  long long v24 = *(_OWORD *)&a4->var0;
  int64_t v25 = a4->var3;
  long long v22 = *(_OWORD *)&a5->var0;
  int64_t v23 = a5->var3;
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  long long v18 = *(uint64_t (**)(OpaqueFigSampleBufferRenderSynchronizer *, long long *, long long *, float))(v17 + 56);
  if (!v18)
  {
    int v19 = -12782;
    goto LABEL_11;
  }
  long long v37 = v24;
  int64_t v38 = v25;
  long long v35 = v22;
  int64_t v36 = v23;
  int v19 = v18(figSynchronizer, &v37, &v35, v12);
  if (v19) {
LABEL_11:
  }
    [(AVSampleBufferRenderSynchronizer *)self _updateRateFromTimebase];
  if (v12 != v31[6]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVSampleBufferRenderSynchronizerRateDidChangeNotification", self);
  }
  _Block_object_dispose(&v30, 8);
  return v19;
}

__n128 __61__AVSampleBufferRenderSynchronizer__setRate_time_atHostTime___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 32);
  result.n128_u32[0] = *(_DWORD *)(a1 + 48);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result.n128_u32[0];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    __n128 result = *(__n128 *)(a1 + 52);
    *(void *)(v2 + 52) = *(void *)(a1 + 68);
    *(__n128 *)(v2 + 36) = result;
  }
  return result;
}

- (BOOL)delaysRateChangeUntilHasSufficientMediaData
{
  CFBooleanRef BOOLean = 0;
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(OpaqueFigSampleBufferRenderSynchronizer *, void, void, CFBooleanRef *))(v4 + 48);
  if (!v5) {
    return 1;
  }
  v5(figSynchronizer, *MEMORY[0x1E4F346B0], *MEMORY[0x1E4F1CF80], &BOOLean);
  if (!BOOLean) {
    return 1;
  }
  BOOL v6 = CFBooleanGetValue(BOOLean) == 0;
  if (BOOLean) {
    CFRelease(BOOLean);
  }
  return v6;
}

- (void)setDelaysRateChangeUntilHasSufficientMediaData:(BOOL)delaysRateChangeUntilHasSufficientMediaData
{
  if (delaysRateChangeUntilHasSufficientMediaData) {
    uint64_t v3 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  else {
    uint64_t v3 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(OpaqueFigSampleBufferRenderSynchronizer *, uint64_t, uint64_t))(v6 + 56);
  if (v7)
  {
    uint64_t v8 = *v3;
    uint64_t v9 = *MEMORY[0x1E4F346B0];
    v7(figSynchronizer, v9, v8);
  }
}

- (void)_updateRateFromTimebase
{
  figSynchronizerAccessQueue = self->_synchronizerInternal->figSynchronizerAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(figSynchronizerAccessQueue, block);
}

void __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke(uint64_t a1)
{
  float Rate = CMTimebaseGetRate(*(CMTimebaseRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 16));
  uint64_t v7 = 0;
  uint64_t v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(v3 + 8) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke_2;
  block[3] = &unk_1E57B7200;
  block[4] = v3;
  void block[5] = &v7;
  float v6 = Rate;
  dispatch_sync(v4, block);
  if (v8[6] != Rate) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVSampleBufferRenderSynchronizerRateDidChangeNotification", *(void *)(a1 + 32));
  }
  _Block_object_dispose(&v7, 8);
}

float __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 32);
  float result = *(float *)(a1 + 48);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result;
  return result;
}

+ (id)_videoRendererForRenderer:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (id)[a3 _sampleBufferVideoRenderer];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return a3;
    }
    else {
      return 0;
    }
  }
}

- (NSArray)renderers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__39;
  int v10 = __Block_byref_object_dispose__39;
  uint64_t v11 = 0;
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__renderers__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererListQueue, v5);
  uint64_t v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __97__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__renderers__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 72) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_addRenderer:(id)a3 error:(id *)a4
{
  int v19 = 0;
  uint64_t v20 = 0;
  int v7 = [(AVSampleBufferRenderSynchronizer *)self _canAddRendererInternal:a3 error:&v19];
  if (v7)
  {
    int v7 = [a3 setRenderSynchronizer:self error:&v19];
    if (v7)
    {
      [(NSMutableArray *)self->_synchronizerInternal->renderers addObject:a3];
      id v8 = +[AVSampleBufferRenderSynchronizer _videoRendererForRenderer:a3];
      if (v8)
      {
        uint64_t v9 = v8;
        objc_initWeak(&location, self);
        uint64_t v10 = [v9 _STSLabelPublisher];
        uint64_t v11 = [AVSinkSubscriber alloc];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke;
        v16[3] = &unk_1E57B7228;
        objc_copyWeak(&v17, &location);
        float v12 = [(AVSinkSubscriber *)v11 initWithPublisher:v10 requestingInitialValue:0 sink:v16];
        -[NSMutableDictionary setObject:forKey:](self->_synchronizerInternal->STSLabelSinks, "setObject:forKey:", v12, [MEMORY[0x1E4F29238] valueWithPointer:v9]);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers((uint64_t)self->_synchronizerInternal);
      [a3 copyFigSampleBufferAudioRenderer:&v20];
      if (v20)
      {
        figSynchronizerAccessQueue = self->_synchronizerInternal->figSynchronizerAccessQueue;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_3;
        v15[3] = &unk_1E57B2228;
        v15[4] = self;
        v15[5] = v20;
        dispatch_async(figSynchronizerAccessQueue, v15);
      }
      LOBYTE(v7) = 1;
    }
  }
  if (a4) {
    *a4 = v19;
  }
  return v7;
}

void __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v2 = Weak;
    dispatch_queue_t current_queue = dispatch_get_current_queue();
    uint64_t v4 = *(NSObject **)(v2[1] + 64);
    if (current_queue == v4)
    {
      uint64_t v5 = v2[1];
      avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(v5);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_2;
      block[3] = &unk_1E57B1E80;
      block[4] = v2;
      dispatch_sync(v4, block);
    }
  }
}

uint64_t __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_2(uint64_t a1)
{
  return avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(*(void *)(*(void *)(a1 + 32) + 8));
}

void __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 96);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  if (v6) {
    v6(v3, v2);
  }
  int v7 = *(const void **)(a1 + 40);
  if (v7)
  {
    CFRelease(v7);
  }
}

- (void)addRenderer:(id)renderer
{
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3052000000;
  long long v28 = __Block_byref_object_copy__39;
  v29 = __Block_byref_object_dispose__39;
  uint64_t v30 = 0;
  if (([(id)objc_opt_class() conformsToProtocol:&unk_1EE602698] & 1) == 0)
  {
    float v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid renderer", v6, v7, v8, v9, v10, v23), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__addRenderer___block_invoke;
  block[3] = &unk_1E57B6680;
  block[4] = self;
  void block[5] = renderer;
  void block[6] = &v31;
  block[7] = &v25;
  dispatch_sync(rendererListQueue, block);
  if (!*((unsigned char *)v32 + 24) && [(id)v26[5] code] == -11999)
  {
    double v13 = objc_msgSend((id)objc_msgSend((id)v26[5], "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
    uint64_t v14 = [v13 reason];
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = [v13 name];
    if (v14) {
      [NSString stringWithFormat:@": %@", v14];
    }
    long long v22 = (void *)[v15 exceptionWithName:v21, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot add renderer %p %@", v16, v17, v18, v19, v20, (uint64_t)renderer), 0 reason userInfo];
    objc_exception_throw(v22);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

uint64_t __100__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__addRenderer___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _addRenderer:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_getTimebaseObserverForRenderer:(id)a3
{
  return avrendersynchronize_getTimebaseObserverForRenderer((uint64_t)a3, self->_synchronizerInternal->timedRenderRemovals);
}

- (id)_getClientCompletionHandlerForRenderer:(id)a3
{
  return avrendersynchronize_getClientCompletionHandlerForRenderer((uint64_t)a3, self->_synchronizerInternal->timedRenderRemovals);
}

- (void)_removeTimebaseObserverForRenderer:(id)a3
{
}

- (void)_storeObserver:(id)a3 clientCompletionHandler:(id)a4 forRenderer:(id)a5
{
  uint64_t v8 = (void *)[a4 copy];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a5, @"renderer", a3, @"onceTimebaseObserver", v8, @"clientCompletionHandler", 0);

  timedRenderRemovals = self->_synchronizerInternal->timedRenderRemovals;
  [(NSMutableArray *)timedRenderRemovals addObject:v9];
}

- (id)_createOnceTimebaseObserverForRemovalOfRenderer:(id)a3 atTime:(id *)a4
{
  uint64_t v7 = [[AVWeakReference alloc] initWithReferencedObject:self];
  uint64_t v8 = [[AVWeakReference alloc] initWithReferencedObject:a3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke;
  v16[3] = &unk_1E57B2098;
  void v16[4] = v7;
  v16[5] = v8;
  uint64_t v9 = [AVOnceTimebaseObserver alloc];
  synchronizerInternal = self->_synchronizerInternal;
  readOnlyTimebase = synchronizerInternal->readOnlyTimebase;
  rendererListQueue = synchronizerInternal->rendererListQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
  double v13 = [(AVOnceTimebaseObserver *)v9 initWithTimebase:readOnlyTimebase fireTime:&v15 queue:rendererListQueue block:v16];

  return v13;
}

void __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) referencedObject];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  uint64_t v4 = (void *)[*(id *)(a1 + 40) referencedObject];
  if (v2 && *(void *)(a1 + 40)) {
    [v2 _performRendererRemoval:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke_2;
      block[3] = &unk_1E57B1E80;
      block[4] = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
  }
}

void __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke_2(uint64_t a1)
{
}

- (BOOL)_scheduleTimedRendererRemovalAtTime:(id)a3 atTime:(id *)a4 withClientCompletionHandler:(id)a5
{
  int v9 = -[NSMutableArray containsObject:](self->_synchronizerInternal->renderers, "containsObject:");
  if (v9)
  {
    id v10 = [(AVSampleBufferRenderSynchronizer *)self _getTimebaseObserverForRenderer:a3];
    if (v10)
    {
      uint64_t v11 = v10;
      if ([v10 didFire])
      {
        LOBYTE(v9) = 0;
        return v9;
      }
      id v12 = [(AVSampleBufferRenderSynchronizer *)self _getClientCompletionHandlerForRenderer:a3];
      [(AVSampleBufferRenderSynchronizer *)self _removeTimebaseObserverForRenderer:a3];
      if (v12)
      {
        figSynchronizerAccessQueue = self->_synchronizerInternal->figSynchronizerAccessQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __159__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___scheduleTimedRendererRemovalAtTime_atTime_withClientCompletionHandler___block_invoke;
        block[3] = &unk_1E57B45B8;
        block[4] = v12;
        dispatch_async(figSynchronizerAccessQueue, block);
      }
      [v11 invalidate];
    }
    long long v15 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(AVSampleBufferRenderSynchronizer *)self _storeObserver:[(AVSampleBufferRenderSynchronizer *)self _createOnceTimebaseObserverForRemovalOfRenderer:a3 atTime:&v15] clientCompletionHandler:a5 forRenderer:a3];
    LOBYTE(v9) = 1;
  }
  return v9;
}

void __159__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___scheduleTimedRendererRemovalAtTime_atTime_withClientCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x199715AE0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeRenderer:(id)a3 atTime:(id *)a4 withCompletionHandler:(id)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  [(AVSampleBufferRenderSynchronizer *)self removeRenderer:a3 atTime:&v5 completionHandler:a5];
}

- (void)removeRenderer:(id)renderer atTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  if (([(id)objc_opt_class() conformsToProtocol:&unk_1EE602698] & 1) == 0)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid renderer", v10, v11, v12, v13, v14, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__removeRenderer_atTime_completionHandler___block_invoke;
  block[3] = &unk_1E57B7250;
  block[4] = self;
  void block[5] = renderer;
  CMTimeEpoch epoch = time->epoch;
  long long v19 = *(_OWORD *)&time->value;
  void block[6] = completionHandler;
  block[7] = &v21;
  dispatch_sync(rendererListQueue, block);
  if (completionHandler && !*((unsigned char *)v22 + 24)) {
    (*((void (**)(void *, void))completionHandler + 2))(completionHandler, 0);
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __128__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__removeRenderer_atTime_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t result = [v2 _scheduleTimedRendererRemovalAtTime:v3 atTime:&v6 withClientCompletionHandler:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)_performRendererRemoval:(id)a3
{
}

- (BOOL)_canAddRendererInternal:(id)a3 error:(id *)a4
{
  if (-[NSMutableArray containsObject:](self->_synchronizerInternal->renderers, "containsObject:"))
  {
    uint64_t v7 = @"The SampleBufferRenderer cannot be added to a Synchronizer more than once.";
  }
  else
  {
    if (![(AVSampleBufferRenderSynchronizer *)self _multipleAudioRenderersDisallowed]|| !avsbrs_rendererIsAudioRenderer(a3)|| [(AVSampleBufferRenderSynchronizer *)self _addedAudioRendererCountInternal] < 1)
    {
      uint64_t v8 = 0;
      BOOL v9 = 1;
      if (!a4) {
        return v9;
      }
      goto LABEL_4;
    }
    uint64_t v7 = @"Multiple AudioRenderers not allowed when using Long Form Routing Policy.";
  }
  uint64_t v8 = (void *)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v7 userInfo:0]);
  BOOL v9 = 0;
  if (a4) {
LABEL_4:
  }
    *a4 = v8;
  return v9;
}

- (BOOL)_rendererConfigurationIsValid:(id *)a3
{
  if ([(AVSampleBufferRenderSynchronizer *)self _multipleAudioRenderersDisallowed]
    && [(AVSampleBufferRenderSynchronizer *)self _addedAudioRendererCount] >= 2)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = (void *)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Multiple AudioRenderers not allowed when using Long Form Routing Policy." userInfo:0]);
    BOOL v6 = 0;
    if (!a3) {
      return v6;
    }
    goto LABEL_6;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = 0;
  BOOL v6 = 1;
  if (a3) {
LABEL_6:
  }
    *a3 = v5;
  return v6;
}

- (BOOL)_multipleAudioRenderersDisallowed
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F153E0], "sharedInstance"), "routeSharingPolicy") == 1;
}

- (int64_t)_addedAudioRendererCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererRestrictions___addedAudioRendererCount__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererListQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __114__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererRestrictions___addedAudioRendererCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _addedAudioRendererCountInternal];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_addedAudioRendererCountInternal
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  renderers = self->_synchronizerInternal->renderers;
  uint64_t v3 = [(NSMutableArray *)renderers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  int64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(renderers);
      }
      v5 += avsbrs_rendererIsAudioRenderer(*(void **)(*((void *)&v9 + 1) + 8 * i));
    }
    uint64_t v4 = [(NSMutableArray *)renderers countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (id)addPeriodicTimeObserverForInterval:(CMTime *)interval queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  readOnlyTimebase = self->_synchronizerInternal->readOnlyTimebase;
  long long v9 = [AVPeriodicTimebaseObserver alloc];
  CMTime v11 = *interval;
  return [(AVPeriodicTimebaseObserver *)v9 initWithTimebase:readOnlyTimebase interval:&v11 queue:queue block:block];
}

- (id)addBoundaryTimeObserverForTimes:(NSArray *)times queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  int64_t v5 = [[AVOccasionalTimebaseObserver alloc] initWithTimebase:self->_synchronizerInternal->readOnlyTimebase times:times queue:queue block:block];
  return v5;
}

- (void)removeTimeObserver:(id)observer
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = @"You did not supply a reference to an object returned by either -addPeriodicTimeObserverForInterval:queue:usingBlock: or -addBoundaryTimeObserverForTimes:queue:usingBlock:";
    goto LABEL_8;
  }
  readOnlyTimebase = self->_synchronizerInternal->readOnlyTimebase;
  if (readOnlyTimebase != (OpaqueCMTimebase *)[observer timebase])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = @"An instance of AVSampleBufferRenderSynchronizer cannot remove a time observer that was added by a different instance of AVSampleBufferRenderSynchronizer.";
LABEL_8:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  }
  [observer invalidate];
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
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
    int64_t v5 = (unsigned int (*)(OpaqueFigSampleBufferRenderSynchronizer *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(figSynchronizer, &v9) == 0;
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

+ (id)currentFigRenderSynchronizerFactory
{
  uint64_t v2 = objc_alloc_init(AVRemoteFigSampleBufferRenderSynchronizerFactory);
  id result = dispatch_get_specific(@"AVSampleBufferRenderSynchronizerFigFactoryKey");
  if (!result) {
    return v2;
  }
  return result;
}

+ (void)setFigRenderSynchronizerFactory:(id)a3 forQueue:(id)a4
{
  id v5 = a3;
  dispatch_queue_set_specific((dispatch_queue_t)a4, @"AVSampleBufferRenderSynchronizerFigFactoryKey", v5, AVSampleBufferRenderSynchronizerReleaseObject);
}

@end