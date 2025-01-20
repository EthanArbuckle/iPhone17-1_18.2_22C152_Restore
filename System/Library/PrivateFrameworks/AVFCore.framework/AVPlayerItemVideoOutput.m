@interface AVPlayerItemVideoOutput
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAvailablePixelBufferItemTime;
- (AVPlayerItemVideoOutput)init;
- (AVPlayerItemVideoOutput)initWithOutputSettings:(NSDictionary *)outputSettings;
- (AVPlayerItemVideoOutput)initWithPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes;
- (BOOL)_attachToPlayerItem:(id)a3;
- (BOOL)hasNewPixelBufferForItemTime:(CMTime *)itemTime;
- (BOOL)isDefunct;
- (BOOL)setUpWithOutputSettings:(id)a3 outputSettingsArePixelBufferAttributes:(BOOL)a4 withExceptionReason:(id *)a5;
- (BOOL)suppressesPlayerRendering;
- (CVPixelBufferRef)copyPixelBufferForItemTime:(CMTime *)itemTime itemTimeForDisplay:(CMTime *)outItemTimeForDisplay;
- (OpaqueFigVisualContext)_visualContext;
- (__CVBuffer)_copyPixelBufferForItemTimeWithOptions:(id *)a3 itemTimeForDisplay:(id *)a4 options:(unsigned int)a5;
- (__CVBuffer)copyPixelBufferForItemTime:(id *)a3 remove:(BOOL)a4 itemTimeForDisplay:(id *)a5;
- (dispatch_queue_t)delegateQueue;
- (id)_pixelBufferAttributes;
- (id)delegate;
- (int64_t)clientStateOnRequestedMediaDataChangeNotification;
- (void)_detachFromPlayerItem;
- (void)_dispatchOutputMediaDataWillChange;
- (void)_dispatchOutputSequenceWasFlushed;
- (void)_respondToPlayerItemFormatDescriptionsChange;
- (void)_setTagBuffersWithConversionInformation;
- (void)_setTimebase:(OpaqueCMTimebase *)a3;
- (void)_startObservingTimebaseNotificationsForTimebase:(OpaqueCMTimebase *)a3;
- (void)_stopObservingTimebaseNotificationsForTimebase:(OpaqueCMTimebase *)a3;
- (void)dealloc;
- (void)requestNotificationOfMediaDataChangeAsSoonAsPossible;
- (void)requestNotificationOfMediaDataChangeWithAdvanceInterval:(NSTimeInterval)interval;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue;
- (void)setSuppressesPlayerRendering:(BOOL)a3;
@end

@implementation AVPlayerItemVideoOutput

- (BOOL)suppressesPlayerRendering
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  videoOutputInternal = self->_videoOutputInternal;
  char v10 = 0;
  stateQueue = videoOutputInternal->stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__AVPlayerItemVideoOutput_suppressesPlayerRendering__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_setTimebase:(OpaqueCMTimebase *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerItemVideoOutput;
  -[AVPlayerItemOutput _setTimebase:](&v7, sel__setTimebase_);
  stateQueue = self->_videoOutputInternal->stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__AVPlayerItemVideoOutput__setTimebase___block_invoke;
  v6[3] = &unk_1E57B2228;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(stateQueue, v6);
}

- (id)_pixelBufferAttributes
{
  return (id)MEMORY[0x1F4103480](self->_videoOutputInternal->pixelBufferConformer, a2);
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  stateQueue = self->_videoOutputInternal->stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AVPlayerItemVideoOutput__attachToPlayerItem___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(stateQueue, v6);
  [(AVPlayerItemVideoOutput *)self _respondToPlayerItemFormatDescriptionsChange];
  return 1;
}

- (void)_respondToPlayerItemFormatDescriptionsChange
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__35;
  videoOutputInternal = self->_videoOutputInternal;
  v15 = __Block_byref_object_dispose__35;
  uint64_t v16 = 0;
  stateQueue = videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AVPlayerItemVideoOutput__respondToPlayerItemFormatDescriptionsChange__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(stateQueue, block);
  v5 = (void *)v12[5];
  if (v5)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v7 = 0;
    objc_msgSend(*(id *)&self->_videoOutputInternal->suppressesPlayerRendering, "colorPropertiesConsideringFormatDescriptions:colorPrimaries:transferFunction:ycbcrMatrix:", objc_msgSend((id)v12[5], "_enabledTrackFormatDescriptions"), &v9, &v8, &v7);
    if (v9) {
      [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F24A90]];
    }
    if (v8) {
      [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F24BC8]];
    }
    if (v7) {
      [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F24C18]];
    }
    VTPixelBufferConformerSetColorProperties();
    v5 = (void *)v12[5];
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchOutputMediaDataWillChange];
}

- (OpaqueFigVisualContext)_visualContext
{
  return self->_videoOutputInternal->vc;
}

uint64_t __52__AVPlayerItemVideoOutput_suppressesPlayerRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16)
                                                                            + 120);
  return result;
}

id __47__AVPlayerItemVideoOutput__attachToPlayerItem___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 40) _weakReference];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 32) = result;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 112) = 1;
  return result;
}

id __71__AVPlayerItemVideoOutput__respondToPlayerItemFormatDescriptionsChange__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 32) referencedObject];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __40__AVPlayerItemVideoOutput__setTimebase___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopObservingTimebaseNotificationsForTimebase:*(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 8)];
  v2 = *(const void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  char v4 = *(const void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
  if (v2) {
    CFRetain(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(v5[2] + 8);
  return [v5 _startObservingTimebaseNotificationsForTimebase:v6];
}

- (void)_stopObservingTimebaseNotificationsForTimebase:(OpaqueCMTimebase *)a3
{
  if (a3)
  {
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVPlayerItemOutput *)self _weakReference];
    uint64_t v7 = *MEMORY[0x1E4F1FA58];
    [v5 removeListenerWithWeakReference:v6 callback:AVPlayerItemVideoOutput_timebaseNotificationCallback name:v7 object:a3];
  }
}

void __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  Float64 v2 = *(double *)(v1 + 72);
  int v3 = *(unsigned __int8 *)(v1 + 80);
  double v4 = *(double *)(v1 + 16);
  uint64_t v5 = *(void *)(a1 + 56);
  *(_OWORD *)(v1 + 84) = *(_OWORD *)(a1 + 40);
  *(void *)(v1 + 100) = v5;
  if (v3 && v4 != 0.0)
  {
    uint64_t v7 = (CMTime *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    CMTime v13 = *v7;
    dispatch_time_t v9 = AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(v8, &v13, v2);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 64);
    uint64_t v12 = (unint64_t)(*(double *)(v10 + 16) / 10.0);
    dispatch_source_set_timer(v11, v9, 0xFFFFFFFFFFFFFFFFLL, v12);
  }
}

- (void)_dispatchOutputMediaDataWillChange
{
  videoOutputInternal = self->_videoOutputInternal;
  if (BYTE4(videoOutputInternal->wakeUpImageTime.epoch) || videoOutputInternal->advanceWakeUpIntervalIsValid)
  {
    delegateStorage = videoOutputInternal->delegateStorage;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__AVPlayerItemVideoOutput__dispatchOutputMediaDataWillChange__block_invoke;
    v5[3] = &unk_1E57B4B88;
    v5[4] = self;
    [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v5];
    videoOutputInternal = self->_videoOutputInternal;
  }
  videoOutputInternal->advanceWakeUpInterval = 0.0;
  self->_videoOutputInternal->advanceWakeUpIntervalIsValid = 0;
  BYTE4(self->_videoOutputInternal->wakeUpImageTime.epoch) = 0;
}

uint64_t __61__AVPlayerItemVideoOutput__dispatchOutputMediaDataWillChange__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    id result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      return [a2 outputMediaDataWillChange:v4];
    }
  }
  return result;
}

- (void)requestNotificationOfMediaDataChangeAsSoonAsPossible
{
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeAsSoonAsPossible__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (AVPlayerItemVideoOutput)initWithPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes
{
  v16.receiver = self;
  v16.super_class = (Class)AVPlayerItemVideoOutput;
  uint64_t v5 = [(AVPlayerItemOutput *)&v16 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v15 = 0;
    if (![(AVPlayerItemVideoOutput *)v5 setUpWithOutputSettings:pixelBufferAttributes outputSettingsArePixelBufferAttributes:1 withExceptionReason:&v15])
    {

      if (v15)
      {
        CMTime v13 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, v15, v7, v8, v9, v10, v11, v14), 0);
        objc_exception_throw(v13);
      }
      return 0;
    }
  }
  return v6;
}

- (BOOL)setUpWithOutputSettings:(id)a3 outputSettingsArePixelBufferAttributes:(BOOL)a4 withExceptionReason:(id *)a5
{
  uint64_t v10 = objc_alloc_init(AVPlayerItemVideoOutputInternal);
  self->_videoOutputInternal = v10;
  if (v10)
  {
    CFRetain(v10);
    if (!a4)
    {
      *(void *)&self->_videoOutputInternal->suppressesPlayerRendering = +[AVVideoOutputSettings _videoOutputSettingsWithVideoSettingsDictionary:a3 exceptionReason:a5];
      uint64_t v10 = *(AVPlayerItemVideoOutputInternal **)&self->_videoOutputInternal->suppressesPlayerRendering;
      if (!v10) {
        return (char)v10;
      }
      if ([(AVPlayerItemVideoOutputInternal *)v10 willYieldCompressedSamples])
      {
        if (a5)
        {
          objc_super v16 = (void *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"AVPlayerItemVideoOutput does not support compressed output", v11, v12, v13, v14, v15, v25);
          LOBYTE(v10) = 0;
          *a5 = v16;
          return (char)v10;
        }
LABEL_9:
        LOBYTE(v10) = 0;
        return (char)v10;
      }
      [*(id *)&self->_videoOutputInternal->suppressesPlayerRendering pixelBufferAttributes];
    }
    if (!VTPixelBufferConformerCreateWithAttributes())
    {
      if (self->_videoOutputInternal->pixelBufferConformer)
      {
        uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.015];
        objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v17, *MEMORY[0x1E4F35018], 0);
        id v18 = [(AVPlayerItemOutput *)self _weakReference];
        if (!FigVisualContextCreateRemote())
        {
          vc = self->_videoOutputInternal->vc;
          if (vc)
          {
            uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
            uint64_t v21 = v20 ? v20 : 0;
            v22 = *(unsigned int (**)(OpaqueFigVisualContext *, void (*)(uint64_t, long long *, char, void *), id))(v21 + 16);
            if (v22)
            {
              if (!v22(vc, AVPlayerItemVideoOutput_figVCSequentialAvailableCallback, v18))
              {
                self->_videoOutputInternal->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerItemOutput queue", 0);
                self->_videoOutputInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
                self->_videoOutputInternal->delegateWakeupSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_videoOutputInternal->stateQueue);
                self->_videoOutputInternal->advanceWakeUpInterval = 0.0;
                self->_videoOutputInternal->advanceWakeUpIntervalIsValid = 0;
                BYTE4(self->_videoOutputInternal->wakeUpImageTime.epoch) = 0;
                *(void *)&self->_videoOutputInternal->immediateWakeUp = 0;
                delegateWakeupSource = self->_videoOutputInternal->delegateWakeupSource;
                handler[0] = MEMORY[0x1E4F143A8];
                handler[1] = 3221225472;
                handler[2] = __110__AVPlayerItemVideoOutput_setUpWithOutputSettings_outputSettingsArePixelBufferAttributes_withExceptionReason___block_invoke;
                handler[3] = &unk_1E57B2098;
                handler[4] = delegateWakeupSource;
                handler[5] = v18;
                dispatch_source_set_event_handler(delegateWakeupSource, handler);
                dispatch_resume((dispatch_object_t)self->_videoOutputInternal->delegateWakeupSource);
                LOBYTE(v10) = 1;
                return (char)v10;
              }
            }
          }
        }
      }
    }
    goto LABEL_9;
  }
  return (char)v10;
}

- (void)_startObservingTimebaseNotificationsForTimebase:(OpaqueCMTimebase *)a3
{
  if (a3)
  {
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVPlayerItemOutput *)self _weakReference];
    uint64_t v7 = *MEMORY[0x1E4F1FA58];
    [v5 addListenerWithWeakReference:v6 callback:AVPlayerItemVideoOutput_timebaseNotificationCallback name:v7 object:a3 flags:0];
  }
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  if (delegateQueue) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = delegate == 0;
  }
  if (!v8) {
    delegateQueue = (dispatch_queue_t)MEMORY[0x1E4F14428];
  }
  if (delegate)
  {
    if (!delegateQueue)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      uint64_t v11 = "newDelegateQueue != NULL";
      goto LABEL_14;
    }
  }
  else if (delegateQueue)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = "newDelegateQueue == NULL";
LABEL_14:
    uint64_t v13 = (void *)[v9 exceptionWithName:v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)delegateQueue, v4, v5, v6, v7, (uint64_t)v11), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  delegateStorage = self->_videoOutputInternal->delegateStorage;
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
}

- (BOOL)hasNewPixelBufferForItemTime:(CMTime *)itemTime
{
  BOOL result = 0;
  if ((itemTime->flags & 0x1D) == 1)
  {
    vc = self->_videoOutputInternal->vc;
    CMTime v8 = *itemTime;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v5 = v4 ? v4 : 0;
    uint64_t v6 = *(unsigned int (**)(OpaqueFigVisualContext *, CMTime *))(v5 + 40);
    if (v6)
    {
      CMTime v9 = v8;
      if (v6(vc, &v9)) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t __79__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeAsSoonAsPossible__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16) + 108) = 1;
  *(void *)(*(void *)(*(void *)(result + 32) + 16) + 112) = 3;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 16);
  if (*(unsigned char *)(v1 + 80)) {
    *(unsigned char *)(v1 + 80) = 0;
  }
  return result;
}

- (CVPixelBufferRef)copyPixelBufferForItemTime:(CMTime *)itemTime itemTimeForDisplay:(CMTime *)outItemTimeForDisplay
{
  CMTime v5 = *itemTime;
  return [(AVPlayerItemVideoOutput *)self _copyPixelBufferForItemTimeWithOptions:&v5 itemTimeForDisplay:outItemTimeForDisplay options:1];
}

- (__CVBuffer)_copyPixelBufferForItemTimeWithOptions:(id *)a3 itemTimeForDisplay:(id *)a4 options:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v18 = 0;
  CFTypeRef cf = 0;
  long long v7 = *MEMORY[0x1E4F1F9F8];
  int64_t v17 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  videoOutputInternal = self->_videoOutputInternal;
  long long v16 = v7;
  vc = videoOutputInternal->vc;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(unsigned int (**)(OpaqueFigVisualContext *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, uint64_t, CFTypeRef *, void, long long *))(v11 + 48);
  if (v12)
  {
    uint64_t v13 = *MEMORY[0x1E4F1CF80];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = v15;
    if (!v12(vc, v13, &v20, v5, &cf, 0, &v16))
    {
      if (a4)
      {
        if ((BYTE12(v16) & 0x1D) != 1) {
          goto LABEL_11;
        }
        *(_OWORD *)&a4->var0 = v16;
        a4->var3 = v17;
      }
      if (VTPixelBufferConformerCopyConformedPixelBuffer()) {
        id v18 = 0;
      }
    }
  }
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  return v18;
}

void __AVPlayerItemVideoOutput_timebaseNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  Float64 v3 = *(double *)(v2 + 72);
  CMTime v9 = *(CMTime *)(v2 + 84);
  double Rate = CMTimebaseGetRate(*(CMTimebaseRef *)(v2 + 8));
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 80))
  {
    if (!*(unsigned char *)(v5 + 108) || *(double *)(v5 + 16) != 0.0 || Rate == 0.0) {
      goto LABEL_12;
    }
LABEL_11:
    [*(id *)(a1 + 40) _dispatchOutputMediaDataWillChange];
    goto LABEL_12;
  }
  double v6 = *(double *)(v5 + 16);
  if (v6 == Rate) {
    goto LABEL_12;
  }
  if (v6 == 0.0 && Rate != 0.0) {
    goto LABEL_11;
  }
  if (v6 == 0.0 || Rate != 0.0)
  {
    CMTime v8 = v9;
    dispatch_time_t v7 = AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(v5, &v8, v3);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 64), v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(Rate / 10.0));
  }
LABEL_12:
  *(double *)(*(void *)(a1 + 32) + 16) = Rate;
}

uint64_t __110__AVPlayerItemVideoOutput_setUpWithOutputSettings_outputSettingsArePixelBufferAttributes_withExceptionReason___block_invoke(uint64_t a1)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  uint64_t v2 = (void *)[*(id *)(a1 + 40) referencedObject];
  return [v2 _dispatchOutputMediaDataWillChange];
}

- (AVPlayerItemVideoOutput)init
{
  return [(AVPlayerItemVideoOutput *)self initWithPixelBufferAttributes:0];
}

- (AVPlayerItemVideoOutput)initWithOutputSettings:(NSDictionary *)outputSettings
{
  v17.receiver = self;
  v17.super_class = (Class)AVPlayerItemVideoOutput;
  uint64_t v5 = [(AVPlayerItemOutput *)&v17 init];
  double v6 = v5;
  if (v5)
  {
    uint64_t v16 = 0;
    if (![(AVPlayerItemVideoOutput *)v5 setUpWithOutputSettings:outputSettings outputSettingsArePixelBufferAttributes:0 withExceptionReason:&v16])
    {
      dispatch_time_t v7 = v6;
      if (v16)
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, v16, v8, v9, v10, v11, v12, v15), 0);
        objc_exception_throw(v14);
      }
      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  videoOutputInternal = self->_videoOutputInternal;
  delegateWakeupSource = videoOutputInternal->delegateWakeupSource;
  if (delegateWakeupSource)
  {
    dispatch_source_cancel(delegateWakeupSource);
    videoOutputInternal = self->_videoOutputInternal;
  }
  pixelBufferConformer = videoOutputInternal->pixelBufferConformer;
  if (pixelBufferConformer)
  {
    CFRelease(pixelBufferConformer);
    videoOutputInternal = self->_videoOutputInternal;
  }

  vc = self->_videoOutputInternal->vc;
  if (vc)
  {
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(OpaqueFigVisualContext *, void, void))(v8 + 16);
    if (v9) {
      v9(vc, 0, 0);
    }
    uint64_t v10 = self->_videoOutputInternal->vc;
    if (v10)
    {
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(void (**)(OpaqueFigVisualContext *))(v12 + 24);
      if (v13) {
        v13(v10);
      }
    }
  }
  uint64_t v14 = self->_videoOutputInternal;
  uint64_t v15 = v14->vc;
  if (v15)
  {
    CFRelease(v15);
    uint64_t v14 = self->_videoOutputInternal;
  }

  uint64_t v16 = self->_videoOutputInternal;
  objc_super v17 = v16->delegateWakeupSource;
  if (v17)
  {
    dispatch_release(v17);
    uint64_t v16 = self->_videoOutputInternal;
  }
  stateQueue = v16->stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    uint64_t v16 = self->_videoOutputInternal;
  }

  CFRelease(self->_videoOutputInternal);
  v19.receiver = self;
  v19.super_class = (Class)AVPlayerItemVideoOutput;
  [(AVPlayerItemOutput *)&v19 dealloc];
}

- (int64_t)clientStateOnRequestedMediaDataChangeNotification
{
  return *(void *)&self->_videoOutputInternal->immediateWakeUp;
}

- (void)_detachFromPlayerItem
{
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVPlayerItemVideoOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void *__48__AVPlayerItemVideoOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 32) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 112) = 0;
  BOOL result = *(void **)(a1 + 32);
  uint64_t v3 = result[2];
  if (*(unsigned char *)(v3 + 80)
    && (dispatch_source_set_timer(*(dispatch_source_t *)(v3 + 64), 0xFFFFFFFFFFFFFFFFLL, 0, 0),
        BOOL result = *(void **)(a1 + 32),
        uint64_t v3 = result[2],
        *(unsigned char *)(v3 + 80))
    || *(unsigned char *)(v3 + 108))
  {
    return (void *)[result _dispatchOutputMediaDataWillChange];
  }
  return result;
}

- (id)delegate
{
  return [(AVWeakReferencingDelegateStorage *)self->_videoOutputInternal->delegateStorage delegate];
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)[(AVWeakReferencingDelegateStorage *)self->_videoOutputInternal->delegateStorage delegateQueue];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAvailablePixelBufferItemTime
{
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  long long v14 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
  int64_t v6 = *(void *)(v5 + 16);
  retstr->int64_t var3 = v6;
  BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigVisualContextGetEarliestSequentialImageTime();
  if ((retstr->var2 & 0x1D) == 1)
  {
    vc = self->_videoOutputInternal->vc;
    long long v15 = *(_OWORD *)&retstr->var0;
    int64_t var3 = retstr->var3;
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v11 = *(void *)(VTable + 16);
    BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(VTable + 16);
    uint64_t v10 = v11;
    if (v11) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(uint64_t (**)(OpaqueFigVisualContext *, long long *))(v12 + 40);
    if (!v13 || (v17 = v15, v18 = var3, BOOL result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v13(vc, &v17), !result))
    {
      *(_OWORD *)&retstr->var0 = v14;
      retstr->int64_t var3 = v6;
    }
  }
  return result;
}

- (void)requestNotificationOfMediaDataChangeWithAdvanceInterval:(NSTimeInterval)interval
{
  stateQueue = self->_videoOutputInternal->stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeWithAdvanceInterval___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  *(NSTimeInterval *)&v4[5] = interval;
  dispatch_sync(stateQueue, v4);
}

void __83__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeWithAdvanceInterval___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 72) = *(void *)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 16) + 80) = 1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 112) = 2;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  if (*(unsigned char *)(v2 + 108))
  {
    *(unsigned char *)(v2 + 108) = 0;
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  }
  if (*(double *)(v2 + 16) != 0.0)
  {
    memset(&v21, 0, sizeof(v21));
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v21, HostTimeClock);
    memset(&v20, 0, sizeof(v20));
    CMTimeMakeWithSeconds(&rhs, *(Float64 *)(a1 + 40), v21.timescale);
    CMTime lhs = v21;
    CMTimeAdd(&v20, &lhs, &rhs);
    memset(&v18, 0, sizeof(v18));
    CMClockRef v4 = CMClockGetHostTimeClock();
    uint64_t v5 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 16) + 8);
    CMTime lhs = v20;
    CMSyncConvertTime(&v18, &lhs, v4, v5);
    int64_t v6 = *(void **)(a1 + 32);
    CMTime lhs = v18;
    if ([v6 hasNewPixelBufferForItemTime:&lhs])
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 64), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      [*(id *)(a1 + 32) _dispatchOutputMediaDataWillChange];
    }
    else
    {
      CMTime v16 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
      char v17 = 0;
      uint64_t v8 = *(void *)(v7 + 24);
      CMTime v15 = v18;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = *(void (**)(uint64_t, void, CMTime *, CMTime *, char *))(v10 + 64);
      if (!v11 || (CMTime lhs = v15, v11(v8, 0, &lhs, &v16, &v17), !v17))
      {
        if ((v16.flags & 0x1D) == 1)
        {
          uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
          Float64 v13 = *(double *)(a1 + 40);
          CMTime lhs = v16;
          dispatch_time_t v14 = AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(v12, &lhs, v13);
          dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 64), v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(void *)(*(void *)(a1 + 32) + 16) + 16) / 10.0));
        }
      }
    }
  }
}

- (__CVBuffer)copyPixelBufferForItemTime:(id *)a3 remove:(BOOL)a4 itemTimeForDisplay:(id *)a5
{
  if (a4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 1;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  return [(AVPlayerItemVideoOutput *)self _copyPixelBufferForItemTimeWithOptions:&v8 itemTimeForDisplay:a5 options:v6];
}

- (void)setSuppressesPlayerRendering:(BOOL)a3
{
  uint64_t v7 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__35;
  uint64_t v11 = __Block_byref_object_dispose__35;
  uint64_t v12 = 0;
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerItemVideoOutput_setSuppressesPlayerRendering___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v6 = a3;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(stateQueue, block);
  objc_msgSend((id)objc_msgSend((id)v8[5], "referencedObject"), "_renderingSuppressionDidChangeForOutput:", self);

  _Block_object_dispose(&v7, 8);
}

id __56__AVPlayerItemVideoOutput_setSuppressesPlayerRendering___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 16) + 120) = *(unsigned char *)(a1 + 48);
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 32);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setTagBuffersWithConversionInformation
{
  BYTE1(self->_videoOutputInternal->clientStateOnRequestedMediaDataChangeNotification) = 1;
}

- (void)_dispatchOutputSequenceWasFlushed
{
  delegateStorage = self->_videoOutputInternal->delegateStorage;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__AVPlayerItemVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke;
  v3[3] = &unk_1E57B4B88;
  v3[4] = self;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
}

uint64_t __60__AVPlayerItemVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    id result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      return [a2 outputSequenceWasFlushed:v4];
    }
  }
  return result;
}

- (BOOL)isDefunct
{
  uint64_t v7 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = &v7;
  uint64_t v9 = 0x2020000000;
  videoOutputInternal = self->_videoOutputInternal;
  char v10 = 0;
  stateQueue = videoOutputInternal->stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__AVPlayerItemVideoOutput_isDefunct__block_invoke;
  v6[3] = &unk_1E57B2160;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  BOOL v4 = *((unsigned char *)v8 + 24) == 1;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __36__AVPlayerItemVideoOutput_isDefunct__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 24);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void **)(VTable + 8);
  uint64_t result = VTable + 8;
  BOOL v6 = v7;
  if (v7) {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = v6;
  }
  else {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = 0;
  }
  if (*v8 >= 5uLL && (uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))v8[11]) != 0)
  {
    uint64_t result = v9(v2, v3 + 24);
    BOOL v10 = result == 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v11 + 24) && !v10) {
    *(unsigned char *)(v11 + 24) = 1;
  }
  return result;
}

uint64_t __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 64), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    [*(id *)(a1 + 40) _dispatchOutputMediaDataWillChange];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 _dispatchOutputSequenceWasFlushed];
}

@end