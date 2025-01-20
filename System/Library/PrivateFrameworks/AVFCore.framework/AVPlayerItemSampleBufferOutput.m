@interface AVPlayerItemSampleBufferOutput
+ (void)initialize;
- (AVPlayerItemSampleBufferOutput)init;
- (AVPlayerItemSampleBufferOutput)initWithConfiguration:(id)a3;
- (AVPlayerItemSampleBufferOutputDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (OpaqueFigPlaybackItem)_figPlaybackItem;
- (double)_advanceInterval;
- (id)_weakReference;
- (id)_weakReferenceToPlayerItemTrack;
- (int)_extractionID;
- (int)_trackID;
- (opaqueCMSampleBuffer)copyNextSampleBufferForTrackID:(int)a3 flags:(unsigned int *)a4;
- (void)_addFigPlaybackItemListeners;
- (void)_attachToPlayerItemTrack:(id)a3 figPlaybackItem:(OpaqueFigPlaybackItem *)a4;
- (void)_detachFromPlayerItemTrack;
- (void)_figPlaybackItemTrackOutputSequenceWasFlushedForTrackID:(int)a3 extractionID:(int)a4;
- (void)_figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID:(int)a3 extractionID:(int)a4;
- (void)_removeFigPlaybackItemListeners;
- (void)_setExtractionID:(int)a3;
- (void)_setFigPlaybackItem:(OpaqueFigPlaybackItem *)a3;
- (void)_setTrackID:(int)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3 queue:(id)a4;
@end

@implementation AVPlayerItemSampleBufferOutput

+ (void)initialize
{
}

- (AVPlayerItemSampleBufferOutput)init
{
  return [(AVPlayerItemSampleBufferOutput *)self initWithConfiguration:0];
}

- (AVPlayerItemSampleBufferOutput)initWithConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerItemSampleBufferOutput;
  v4 = [(AVPlayerItemOutput *)&v7 init];
  if (v4)
  {
    v4->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerItemSampleBufferOutput state", 0);
    v4->_weakReference = [[AVWeakReference alloc] initWithReferencedObject:v4];
    v4->_delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
    [a3 advanceIntervalForDataAvailability];
    v4->_advanceInterval = v5;
  }
  return v4;
}

- (void)dealloc
{
  if (self->_figPlaybackItem)
  {
    [(AVPlayerItemSampleBufferOutput *)self _removeFigPlaybackItemListeners];
    CFRelease(self->_figPlaybackItem);
  }

  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemSampleBufferOutput;
  [(AVPlayerItemOutput *)&v4 dealloc];
}

- (void)_addFigPlaybackItemListeners
{
  if (self->_figPlaybackItem)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVPlayerItemSampleBufferOutput *)self _weakReference];
    CFRetain(v4);
    [v3 addListenerWithWeakReference:v4 callback:figPlaybackItemTrackSampleBufferDidBecomeAvailable name:*MEMORY[0x1E4F33670] object:self->_figPlaybackItem flags:0];
    uint64_t v5 = *MEMORY[0x1E4F33668];
    figPlaybackItem = self->_figPlaybackItem;
    [v3 addListenerWithWeakReference:v4 callback:figPlaybackItemTrackResetSampleBufferExtraction name:v5 object:figPlaybackItem flags:0];
  }
}

- (void)_removeFigPlaybackItemListeners
{
  if (self->_figPlaybackItem)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVPlayerItemSampleBufferOutput *)self _weakReference];
    [v3 removeListenerWithWeakReference:v4 callback:figPlaybackItemTrackSampleBufferDidBecomeAvailable name:*MEMORY[0x1E4F33670] object:self->_figPlaybackItem];
    [v3 removeListenerWithWeakReference:v4 callback:figPlaybackItemTrackResetSampleBufferExtraction name:*MEMORY[0x1E4F33668] object:self->_figPlaybackItem];
    weakReference = self->_weakReference;
    CFRelease(weakReference);
  }
}

- (id)_weakReference
{
  return self->_weakReference;
}

- (OpaqueFigPlaybackItem)_figPlaybackItem
{
  return self->_figPlaybackItem;
}

- (void)_setFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  figPlaybackItem = self->_figPlaybackItem;
  if (figPlaybackItem != a3)
  {
    if (figPlaybackItem)
    {
      [(AVPlayerItemSampleBufferOutput *)self _removeFigPlaybackItemListeners];
      CFRelease(self->_figPlaybackItem);
    }
    if (a3) {
      v6 = (OpaqueFigPlaybackItem *)CFRetain(a3);
    }
    else {
      v6 = 0;
    }
    self->_figPlaybackItem = v6;
    [(AVPlayerItemSampleBufferOutput *)self _addFigPlaybackItemListeners];
  }
}

- (id)_weakReferenceToPlayerItemTrack
{
  return self->_weakReferenceToPlayerItemTrack;
}

- (opaqueCMSampleBuffer)copyNextSampleBufferForTrackID:(int)a3 flags:(unsigned int *)a4
{
  if (self->_trackID != a3) {
    return 0;
  }
  v13 = 0;
  v6 = [(AVPlayerItemSampleBufferOutput *)self _figPlaybackItem];
  uint64_t v7 = [(AVPlayerItemSampleBufferOutput *)self _trackID];
  uint64_t v8 = [(AVPlayerItemSampleBufferOutput *)self _extractionID];
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v12 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, opaqueCMSampleBuffer **))(v10 + 168);
  if (v12) {
    v12(v6, v7, v8, &v13);
  }
  if (a4) {
    *a4 = 0;
  }
  return v13;
}

- (void)_figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID:(int)a3 extractionID:(int)a4
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0](self, a2);
  if (*(void *)&self->_trackID == __PAIR64__(a4, a3))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_sync(stateQueue, block);
  }
}

uint64_t __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke_2;
  v4[3] = &unk_1E57B4B88;
  v4[4] = v1;
  return [v2 invokeDelegateCallbackWithBlock:v4];
}

uint64_t __109__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID_extractionID___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      return objc_msgSend(a2, "outputMediaDataAvailable:trackID:");
    }
  }
  return result;
}

- (void)_figPlaybackItemTrackOutputSequenceWasFlushedForTrackID:(int)a3 extractionID:(int)a4
{
  if (self->_trackID == a3 && self->_extractionID == a4)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_sync(stateQueue, block);
  }
}

uint64_t __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke_2;
  v4[3] = &unk_1E57B4B88;
  v4[4] = v1;
  return [v2 invokeDelegateCallbackWithBlock:v4];
}

uint64_t __103__AVPlayerItemSampleBufferOutput__figPlaybackItemTrackOutputSequenceWasFlushedForTrackID_extractionID___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      return objc_msgSend(a2, "outputSequenceWasFlushed:trackID:");
    }
  }
  return result;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  if (a4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a3 == 0;
  }
  if (!v8) {
    a4 = (id)MEMORY[0x1E4F14428];
  }
  if (a3)
  {
    if (!a4)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      v11 = "newDelegateQueue != NULL";
      goto LABEL_14;
    }
  }
  else if (a4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = "newDelegateQueue == NULL";
LABEL_14:
    v13 = (void *)[v9 exceptionWithName:v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v11), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  delegateStorage = self->_delegateStorage;
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
}

- (AVPlayerItemSampleBufferOutputDelegate)delegate
{
  return (AVPlayerItemSampleBufferOutputDelegate *)[(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegate];
}

- (OS_dispatch_queue)delegateQueue
{
  return [(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegateQueue];
}

- (void)_attachToPlayerItemTrack:(id)a3 figPlaybackItem:(OpaqueFigPlaybackItem *)a4
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___attachToPlayerItemTrack_figPlaybackItem___block_invoke;
  block[3] = &unk_1E57B2270;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(stateQueue, block);
}

uint64_t __116__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___attachToPlayerItemTrack_figPlaybackItem___block_invoke(void *a1)
{
  *(void *)(a1[4] + 32) = [[AVWeakReference alloc] initWithReferencedObject:a1[5]];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  return [v2 _setFigPlaybackItem:v3];
}

- (void)_detachFromPlayerItemTrack
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___detachFromPlayerItemTrack__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __101__AVPlayerItemSampleBufferOutput_AVPlayerItemSampleBufferOutput_Internal___detachFromPlayerItemTrack__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  v2 = *(void **)(a1 + 32);
  return [v2 _setFigPlaybackItem:0];
}

- (int)_trackID
{
  return self->_trackID;
}

- (void)_setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (int)_extractionID
{
  return self->_extractionID;
}

- (void)_setExtractionID:(int)a3
{
  self->_extractionID = a3;
}

- (double)_advanceInterval
{
  return self->_advanceInterval;
}

@end