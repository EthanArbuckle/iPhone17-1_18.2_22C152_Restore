@interface AVPlayerItemIntegratedTimeline
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getPendingSeekTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (AVPlayerItemIntegratedTimelineSnapshot)currentSnapshot;
- (NSDate)currentDate;
- (id)_currentItemForCurrentSegment;
- (id)_currentItemForSegmentType:(int64_t)a3;
- (id)_initInternal;
- (id)_interstitialPlayer;
- (id)_primaryItem;
- (id)addBoundaryTimeObserverForSegment:(id)a3 offsetsIntoSegment:(id)a4 queue:(id)a5 usingBlock:(id)a6;
- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5;
- (int)_createSeekID;
- (int)_getPendingSeekID;
- (int64_t)_currentSegmentTypeOfCurrentSnapshot;
- (void)_addInterstitialPlayerListeners;
- (void)_addListener;
- (void)_attachCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_attachInterstitialPlayer:(id)a3;
- (void)_attachToItem:(id)a3;
- (void)_cancelPendingSeekAndRegisterSeekID:(int)a3 seekTime:(id *)a4 withCompletionHandler:(id)a5;
- (void)_cancelPendingSeeks;
- (void)_clearCachedSeek;
- (void)_ensureObserversAreScheduledForItem:(id)a3;
- (void)_ensureObserversHandleSnapshotSegmentsChanged;
- (void)_issueCachedSeekIfNecessary;
- (void)_removeInterstitialPlayerListeners;
- (void)_removeListeners;
- (void)_resetPlaybackCoordinatorTimelineExpectations:(__CFDictionary *)a3;
- (void)_seekToDate:(id)a3 options:(__CFDictionary *)a4 completionHandler:(id)a5;
- (void)_seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 options:(__CFDictionary *)a6 completionHandler:(id)a7;
- (void)_setInitialSeekState:(int)a3 time:(id *)a4 date:(id)a5 toleranceBefore:(id *)a6 toleranceAfter:(id *)a7 options:(__CFDictionary *)a8;
- (void)_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:(int)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)removeTimeObserver:(id)a3;
- (void)seekToDate:(id)a3 completionHandler:(id)a4;
- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6;
@end

@implementation AVPlayerItemIntegratedTimeline

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (id)_initInternal
{
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemIntegratedTimeline;
  v2 = [(AVPlayerItemIntegratedTimeline *)&v5 init];
  v2->_weakReference = [[AVWeakReference alloc] initWithReferencedObject:v2];
  v2->_seekIDMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  v2->_nextSeekIDToGenerate = FPSupport_InitialSeekIDForSource();
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.integratedtimelinestatequeue", v3);
  v2->_observers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return v2;
}

- (void)dealloc
{
  [(AVPlayerItemIntegratedTimeline *)self _removeListeners];
  [(AVPlayerItemIntegratedTimeline *)self _cancelPendingSeeks];
  [(AVPlayerItemIntegratedTimeline *)self _removeInterstitialPlayerListeners];
  FigSimpleMutexDestroy();
  figTimeline = self->_figTimeline;
  if (figTimeline) {
    CFRelease(figTimeline);
  }
  initialOptions = self->_initialOptions;
  if (initialOptions) {
    CFRelease(initialOptions);
  }

  dispatch_release((dispatch_object_t)self->_stateQueue);
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemIntegratedTimeline;
  [(AVPlayerItemIntegratedTimeline *)&v5 dealloc];
}

- (void)_attachToItem:(id)a3
{
  uint64_t v5 = [a3 _copyFigPlaybackItem];
  v6 = (const void *)v5;
  if (self->_figTimeline) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    if (!v5) {
      return;
    }
  }
  else
  {
    FigItemIntegratedTimelineCreate();
    [(AVPlayerItemIntegratedTimeline *)self _addListener];
    self->_weakReferenceToPrimaryItem = [[AVWeakReference alloc] initWithReferencedObject:a3];
  }
  CFRelease(v6);
}

- (void)_attachCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  figTimeline = self->_figTimeline;
  if (figTimeline)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    BOOL v7 = *(void (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, OpaqueFigPlayerInterstitialCoordinator *))(v6 + 56);
    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F32F40];
      v7(figTimeline, v8, a3);
    }
  }
}

- (void)_attachInterstitialPlayer:(id)a3
{
  if (a3 && !self->_weakReferenceToInterstitialPlayer)
  {
    self->_weakReferenceToInterstitialPlayer = [[AVWeakReference alloc] initWithReferencedObject:a3];
    [(AVPlayerItemIntegratedTimeline *)self _addInterstitialPlayerListeners];
  }
}

- (id)_primaryItem
{
  return [(AVWeakReference *)self->_weakReferenceToPrimaryItem referencedObject];
}

- (id)_interstitialPlayer
{
  return [(AVWeakReference *)self->_weakReferenceToInterstitialPlayer referencedObject];
}

- (AVPlayerItemIntegratedTimelineSnapshot)currentSnapshot
{
  CFTypeRef v18 = 0;
  CFTypeRef v19 = 0;
  CFTypeRef v17 = 0;
  long long v15 = *MEMORY[0x1E4F1F9F8];
  uint64_t v16 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v13 = v15;
  uint64_t v14 = v16;
  figTimeline = self->_figTimeline;
  if (figTimeline)
  {
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v4 = v3 ? v3 : 0;
    uint64_t v5 = *(void (**)(OpaqueFigItemIntegratedTimeline *, CFTypeRef *, long long *, long long *, CFTypeRef *, CFTypeRef *))(v4 + 8);
    if (v5) {
      v5(figTimeline, &v17, &v15, &v13, &v19, &v18);
    }
  }
  uint64_t v6 = [AVPlayerItemIntegratedTimelineSnapshot alloc];
  long long v11 = v15;
  uint64_t v12 = v16;
  long long v9 = v13;
  uint64_t v10 = v14;
  BOOL v7 = [(AVPlayerItemIntegratedTimelineSnapshot *)v6 initWithSegments:v17 duration:&v11 currentTime:&v9 currentDate:v19 currentSegment:v18];
  if (v17) {
    CFRelease(v17);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v18) {
    CFRelease(v18);
  }
  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)&self->var1;
  if (v4)
  {
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v7 = *(void *)(VTable + 16);
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(VTable + 16);
    uint64_t v6 = v7;
    uint64_t v8 = v7 ? v6 : 0;
    long long v9 = *(uint64_t (**)(uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v8 + 16);
    if (v9)
    {
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v9(v4, retstr);
    }
  }
  return self;
}

- (NSDate)currentDate
{
  uint64_t v8 = 0;
  figTimeline = self->_figTimeline;
  if (figTimeline
    && ((uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0 ? (v4 = 0) : (v4 = v3),
        (uint64_t v5 = *(void (**)(OpaqueFigItemIntegratedTimeline *, void **))(v4 + 24)) != 0))
  {
    v5(figTimeline, &v8);
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSDate *)v6;
}

- (int64_t)_currentSegmentTypeOfCurrentSnapshot
{
  v2 = [(AVPlayerItemIntegratedTimelineSnapshot *)[(AVPlayerItemIntegratedTimeline *)self currentSnapshot] currentSegment];
  return [(AVPlayerItemSegment *)v2 segmentType];
}

- (int)_createSeekID
{
  MEMORY[0x199715030](self->_seekIDMutex, a2);
  int nextSeekIDToGenerate = self->_nextSeekIDToGenerate;
  self->_int nextSeekIDToGenerate = FPSupport_IncrementSeekID();
  MEMORY[0x199715040](self->_seekIDMutex);
  return nextSeekIDToGenerate;
}

- (void)_cancelPendingSeekAndRegisterSeekID:(int)a3 seekTime:(id *)a4 withCompletionHandler:(id)a5
{
  MEMORY[0x199715030](self->_seekIDMutex, a2);
  int pendingSeekID = self->_pendingSeekID;
  seekCompletionHandler = (void (**)(id, void))self->_seekCompletionHandler;
  self->_int pendingSeekID = a3;
  int64_t var3 = a4->var3;
  *(_OWORD *)&self->_pendingSeekTime.value = *(_OWORD *)&a4->var0;
  self->_pendingSeekTime.epoch = var3;
  if (a5) {
    uint64_t v12 = (void *)[a5 copy];
  }
  else {
    uint64_t v12 = 0;
  }
  self->_seekCompletionHandler = v12;
  MEMORY[0x199715040](self->_seekIDMutex);
  if (pendingSeekID && seekCompletionHandler)
  {
    if (dword_1E9356B30)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    seekCompletionHandler[2](seekCompletionHandler, 0);
  }
}

- (void)_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:(int)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  MEMORY[0x199715030](self->_seekIDMutex, a2);
  int pendingSeekID = self->_pendingSeekID;
  if (pendingSeekID) {
    BOOL v8 = pendingSeekID == a3;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    JUMPOUT(0x199715040);
  }
  seekCompletionHandler = (void (**)(id, BOOL))self->_seekCompletionHandler;
  self->_int pendingSeekID = 0;
  uint64_t v10 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_pendingSeekTime.value = *MEMORY[0x1E4F1F9F8];
  self->_pendingSeekTime.epoch = *(void *)(v10 + 16);
  self->_seekCompletionHandler = 0;
  MEMORY[0x199715040](self->_seekIDMutex);
  if (seekCompletionHandler)
  {
    if (dword_1E9356B30)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    seekCompletionHandler[2](seekCompletionHandler, v4);
  }
}

- (void)_clearCachedSeek
{
  MEMORY[0x199715030](self->_seekIDMutex, a2);
  self->_initialSeekID = 0;
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  long long v4 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(&self->_initialSeekID + 1) = *MEMORY[0x1E4F1F9F8];
  int64_t v5 = *(void *)(v3 + 16);
  *(void *)&self->_initialTime.flags = v5;
  *(_OWORD *)&self->_initialToleranceAfter.value = v4;
  self->_initialToleranceAfter.epoch = v5;
  *(_OWORD *)&self->_initialToleranceBefore.value = v4;
  self->_initialToleranceBefore.epoch = v5;

  self->_initialDate = 0;
  JUMPOUT(0x199715040);
}

- (void)_issueCachedSeekIfNecessary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  MEMORY[0x199715030](self->_seekIDMutex, a2);
  uint64_t initialSeekID = self->_initialSeekID;
  uint64_t v24 = *(void *)(&self->_initialSeekID + 1);
  int timescale = self->_initialTime.timescale;
  int value_high = HIDWORD(self->_initialTime.value);
  uint64_t v5 = *(void *)&self->_initialTime.flags;
  initialDate = self->_initialDate;
  $95D729B680665BEAEFA1D6FCA8238556 initialToleranceBefore = self->_initialToleranceBefore;
  initialOptions = self->_initialOptions;
  $95D729B680665BEAEFA1D6FCA8238556 initialToleranceAfter = self->_initialToleranceAfter;
  MEMORY[0x199715040](self->_seekIDMutex);
  if (initialSeekID)
  {
    if ((timescale & 1) == 0 || initialDate)
    {
      if (!initialDate) {
        goto LABEL_18;
      }
      [(AVPlayerItemIntegratedTimeline *)self _resetPlaybackCoordinatorTimelineExpectations:initialOptions];
      figTimeline = self->_figTimeline;
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v13 = v12 ? v12 : 0;
      long long v15 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, NSDate *, __CFDictionary *))(v13 + 40);
      if (v15)
      {
        if (!v15(figTimeline, initialSeekID, initialDate, initialOptions)) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      [(AVPlayerItemIntegratedTimeline *)self _resetPlaybackCoordinatorTimelineExpectations:initialOptions];
      BOOL v8 = self->_figTimeline;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v14 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, uint64_t *, $95D729B680665BEAEFA1D6FCA8238556 *, $95D729B680665BEAEFA1D6FCA8238556 *, __CFDictionary *))(v10 + 32);
      if (v14)
      {
        uint64_t v20 = v24;
        int v21 = value_high;
        int v22 = timescale;
        uint64_t v23 = v5;
        $95D729B680665BEAEFA1D6FCA8238556 v19 = initialToleranceBefore;
        $95D729B680665BEAEFA1D6FCA8238556 v18 = initialToleranceAfter;
        if (!v14(v8, initialSeekID, &v20, &v19, &v18, initialOptions)) {
          goto LABEL_18;
        }
      }
    }
    [(AVPlayerItemIntegratedTimeline *)self _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:initialSeekID finished:0];
LABEL_18:
    [(AVPlayerItemIntegratedTimeline *)self _clearCachedSeek];
  }
}

- (void)_setInitialSeekState:(int)a3 time:(id *)a4 date:(id)a5 toleranceBefore:(id *)a6 toleranceAfter:(id *)a7 options:(__CFDictionary *)a8
{
  MEMORY[0x199715030](self->_seekIDMutex, a2);
  self->_uint64_t initialSeekID = a3;
  int64_t var3 = a4->var3;
  *(_OWORD *)(&self->_initialSeekID + 1) = *(_OWORD *)&a4->var0;
  *(void *)&self->_initialTime.flags = var3;
  long long v16 = *(_OWORD *)&a7->var0;
  self->_initialToleranceAfter.epoch = a7->var3;
  *(_OWORD *)&self->_initialToleranceAfter.value = v16;
  long long v17 = *(_OWORD *)&a6->var0;
  self->_initialToleranceBefore.epoch = a6->var3;
  *(_OWORD *)&self->_initialToleranceBefore.value = v17;
  self->_initialDate = (NSDate *)a5;
  if (a8) {
    $95D729B680665BEAEFA1D6FCA8238556 v18 = (__CFDictionary *)CFRetain(a8);
  }
  else {
    $95D729B680665BEAEFA1D6FCA8238556 v18 = 0;
  }
  self->_initialOptions = v18;
  JUMPOUT(0x199715040);
}

- (int)_getPendingSeekID
{
  return self->_pendingSeekID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getPendingSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)_cancelPendingSeeks
{
  MEMORY[0x199715030](self->_seekIDMutex, a2);
  uint64_t pendingSeekID = self->_pendingSeekID;
  MEMORY[0x199715040](self->_seekIDMutex);
  [(AVPlayerItemIntegratedTimeline *)self _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:pendingSeekID finished:0];
}

- (void)_seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 options:(__CFDictionary *)a6 completionHandler:(id)a7
{
  uint64_t v13 = [(AVPlayerItemIntegratedTimeline *)self _createSeekID];
  NSUInteger v14 = [(NSArray *)[(AVPlayerItemIntegratedTimelineSnapshot *)[(AVPlayerItemIntegratedTimeline *)self currentSnapshot] segments] count];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v28 = *a3;
  [(AVPlayerItemIntegratedTimeline *)self _cancelPendingSeekAndRegisterSeekID:v13 seekTime:&v28 withCompletionHandler:a7];
  if (self->_figTimeline && v14)
  {
    [(AVPlayerItemIntegratedTimeline *)self _resetPlaybackCoordinatorTimelineExpectations:a6];
    figTimeline = self->_figTimeline;
    *(_OWORD *)&v23.var0 = *(_OWORD *)&a3->var0;
    v23.int64_t var3 = a3->var3;
    long long v21 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v19 = *(_OWORD *)&a5->var0;
    int64_t v20 = a5->var3;
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    $95D729B680665BEAEFA1D6FCA8238556 v18 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, long long *, long long *, __CFDictionary *))(v17 + 32);
    if (!v18 || (v28 = v23, v26 = v21, v27 = var3, long long v24 = v19, v25 = v20, v18(figTimeline, v13, &v28, &v26, &v24, a6))) {
      -[AVPlayerItemIntegratedTimeline _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", v13, 0, v19, v20);
    }
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v28 = *a3;
    long long v26 = *(_OWORD *)&a4->var0;
    int64_t v27 = a4->var3;
    long long v24 = *(_OWORD *)&a5->var0;
    int64_t v25 = a5->var3;
    [(AVPlayerItemIntegratedTimeline *)self _setInitialSeekState:v13 time:&v28 date:0 toleranceBefore:&v26 toleranceAfter:&v24 options:a6];
  }
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F33D10];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", 0, a4);
  v15[1] = *MEMORY[0x1E4F33D08];
  v16[0] = v10;
  v16[1] = &unk_1EE5E18D8;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  [(AVPlayerItemIntegratedTimeline *)self _seekToTime:&v14 toleranceBefore:&v13 toleranceAfter:&v12 options:v11 completionHandler:a6];
}

- (void)_seekToDate:(id)a3 options:(__CFDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9 = [(AVPlayerItemIntegratedTimeline *)self _createSeekID];
  NSUInteger v10 = [(NSArray *)[(AVPlayerItemIntegratedTimelineSnapshot *)[(AVPlayerItemIntegratedTimeline *)self currentSnapshot] segments] count];
  long long v16 = *MEMORY[0x1E4F1F9F8];
  long long v21 = *MEMORY[0x1E4F1F9F8];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v22 = v11;
  [(AVPlayerItemIntegratedTimeline *)self _cancelPendingSeekAndRegisterSeekID:v9 seekTime:&v21 withCompletionHandler:a5];
  if (self->_figTimeline && v10)
  {
    [(AVPlayerItemIntegratedTimeline *)self _resetPlaybackCoordinatorTimelineExpectations:a4];
    figTimeline = self->_figTimeline;
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    long long v15 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, id, __CFDictionary *))(v14 + 40);
    if (!v15 || v15(figTimeline, v9, a3, a4)) {
      [(AVPlayerItemIntegratedTimeline *)self _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:v9 finished:0];
    }
  }
  else
  {
    long long v21 = v16;
    uint64_t v22 = v11;
    long long v19 = v16;
    uint64_t v20 = v11;
    long long v17 = v16;
    uint64_t v18 = v11;
    [(AVPlayerItemIntegratedTimeline *)self _setInitialSeekState:v9 time:&v21 date:a3 toleranceBefore:&v19 toleranceAfter:&v17 options:a4];
  }
}

- (void)seekToDate:(id)a3 completionHandler:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F33D10];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:0];
  v8[1] = *MEMORY[0x1E4F33D08];
  v9[0] = v7;
  v9[1] = &unk_1EE5E18D8;
  -[AVPlayerItemIntegratedTimeline _seekToDate:options:completionHandler:](self, "_seekToDate:options:completionHandler:", a3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2], a4);
}

- (void)_resetPlaybackCoordinatorTimelineExpectations:(__CFDictionary *)a3
{
  uint64_t v3 = objc_msgSend(-[AVWeakReference referencedObject](self->_weakReferenceToPrimaryItem, "referencedObject"), "_copyPlayer");
  [v3 _playbackCoordinatorWithoutTriggeringFullSetup];
  FigCFDictionaryGetInt32IfPresent();
}

- (void)_addListener
{
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v3 addListenerWithWeakReference:self->_weakReference callback:avitemintegratedtimeline_fpNotificationCallback name:*MEMORY[0x1E4F32F70] object:self->_figTimeline flags:0];
  [v3 addListenerWithWeakReference:self->_weakReference callback:avitemintegratedtimeline_fpNotificationCallback name:*MEMORY[0x1E4F32F60] object:self->_figTimeline flags:0];
  uint64_t v4 = *MEMORY[0x1E4F32F68];
  figTimeline = self->_figTimeline;
  weakReference = self->_weakReference;
  [v3 addListenerWithWeakReference:weakReference callback:avitemintegratedtimeline_fpNotificationCallback name:v4 object:figTimeline flags:0];
}

- (void)_addInterstitialPlayerListeners
{
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_weakReference;
  id v5 = [(AVWeakReference *)self->_weakReferenceToInterstitialPlayer referencedObject];
  [v3 addListenerWithWeakReference:weakReference callback:avitemintegratedtimeline_interstitialPlayer_fpNotificationCallback name:@"AVPlayerCurrentItemDidChangeNotification" object:v5 flags:0];
}

- (void)_removeInterstitialPlayerListeners
{
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_weakReference;
  id v5 = [(AVWeakReference *)self->_weakReferenceToInterstitialPlayer referencedObject];
  [v3 removeListenerWithWeakReference:weakReference callback:avitemintegratedtimeline_interstitialPlayer_fpNotificationCallback name:@"AVPlayerCurrentItemDidChangeNotification" object:v5];
}

- (void)_removeListeners
{
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  if (self->_figTimeline)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avitemintegratedtimeline_fpNotificationCallback, *MEMORY[0x1E4F32F70]);
    [v4 removeListenerWithWeakReference:self->_weakReference callback:avitemintegratedtimeline_fpNotificationCallback name:*MEMORY[0x1E4F32F60] object:self->_figTimeline];
    uint64_t v5 = *MEMORY[0x1E4F32F68];
    figTimeline = self->_figTimeline;
    weakReference = self->_weakReference;
    [v4 removeListenerWithWeakReference:weakReference callback:avitemintegratedtimeline_fpNotificationCallback name:v5 object:figTimeline];
  }
}

- (id)_currentItemForSegmentType:(int64_t)a3
{
  if (a3)
  {
    id v4 = [(AVPlayerItemIntegratedTimeline *)self _interstitialPlayer];
    return (id)[v4 currentItem];
  }
  else
  {
    return [(AVPlayerItemIntegratedTimeline *)self _primaryItem];
  }
}

- (id)_currentItemForCurrentSegment
{
  int64_t v3 = [(AVPlayerItemIntegratedTimeline *)self _currentSegmentTypeOfCurrentSnapshot];
  return [(AVPlayerItemIntegratedTimeline *)self _currentItemForSegmentType:v3];
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v9 = [AVPlayerItemIntegratedTimelinePeriodicObserver alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
  NSUInteger v10 = [(AVPlayerItemIntegratedTimelinePeriodicObserver *)v9 initWithInterval:&v14 queue:a4 block:a5];
  [(AVPlayerItemIntegratedTimelinePeriodicObserver *)v10 rescheduleObserverWithSnapshot:[(AVPlayerItemIntegratedTimeline *)self currentSnapshot] itemToSchedule:[(AVPlayerItemIntegratedTimeline *)self _currentItemForCurrentSegment]];
  stateQueue = self->_stateQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __126__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke;
  v13[3] = &unk_1E57B2098;
  v13[4] = self;
  v13[5] = v10;
  dispatch_sync(stateQueue, v13);
  return v10;
}

uint64_t __126__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) addObject:*(void *)(a1 + 40)];
}

- (id)addBoundaryTimeObserverForSegment:(id)a3 offsetsIntoSegment:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  BOOL v8 = [[AVPlayerItemIntegratedTimelineBoundaryObserver alloc] initWithSegment:a3 offsetTimes:a4 queue:a5 block:a6];
  -[AVPlayerItemIntegratedTimelineBoundaryObserver rescheduleObserverWithSnapshot:itemToSchedule:](v8, "rescheduleObserverWithSnapshot:itemToSchedule:", -[AVPlayerItemIntegratedTimeline currentSnapshot](self, "currentSnapshot"), -[AVPlayerItemIntegratedTimeline _currentItemForSegmentType:](self, "_currentItemForSegmentType:", [a3 segmentType]));
  stateQueue = self->_stateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __144__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addBoundaryTimeObserverForSegment_offsetsIntoSegment_queue_usingBlock___block_invoke;
  v11[3] = &unk_1E57B2098;
  v11[4] = self;
  v11[5] = v8;
  dispatch_sync(stateQueue, v11);
  return v8;
}

uint64_t __144__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addBoundaryTimeObserverForSegment_offsetsIntoSegment_queue_usingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) addObject:*(void *)(a1 + 40)];
}

- (void)removeTimeObserver:(id)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__removeTimeObserver___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __93__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__removeTimeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) removeObject:*(void *)(a1 + 40)];
}

- (void)_ensureObserversAreScheduledForItem:(id)a3
{
  if (a3)
  {
    stateQueue = self->_stateQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __110__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversAreScheduledForItem___block_invoke;
    v4[3] = &unk_1E57B2098;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(stateQueue, v4);
  }
}

uint64_t __110__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversAreScheduledForItem___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 192) count];
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 32) currentSnapshot];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = *(void **)(*(void *)(a1 + 32) + 192);
    uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) rescheduleObserverWithSnapshot:v3 itemToSchedule:*(void *)(a1 + 40)];
        }
        while (v5 != v7);
        uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_ensureObserversHandleSnapshotSegmentsChanged
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversHandleSnapshotSegmentsChanged__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __119__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversHandleSnapshotSegmentsChanged__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 192) count];
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 32) currentSnapshot];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = *(void **)(*(void *)(a1 + 32) + 192);
    uint64_t result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v8 ensureBoundaryObserverSegmentStillExistsWithNewSnapshot:v3];
            long long v9 = (void *)[v8 scheduledSegment];
            if ([v8 hasObserverBeenScheduledYet]) {
              goto LABEL_13;
            }
            uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_currentItemForSegmentType:", objc_msgSend(v9, "segmentType"));
          }
          else
          {
            if ([v8 hasObserverBeenScheduledYet]) {
              goto LABEL_13;
            }
            uint64_t v10 = [*(id *)(a1 + 32) _currentItemForCurrentSegment];
          }
          [v8 rescheduleObserverWithSnapshot:v3 itemToSchedule:v10];
LABEL_13:
          ++v7;
        }
        while (v5 != v7);
        uint64_t result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  return result;
}

@end