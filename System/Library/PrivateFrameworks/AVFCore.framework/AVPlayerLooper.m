@interface AVPlayerLooper
+ (AVPlayerLooper)playerLooperWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop;
+ (AVPlayerLooper)playerLooperWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange;
+ (void)initialize;
- (AVPlayerLooper)init;
- (AVPlayerLooper)initWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange;
- (AVPlayerLooper)initWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange existingItemsOrdering:(AVPlayerLooperItemOrdering)itemOrdering;
- (AVPlayerLooperStatus)status;
- (BOOL)_isWaitingForLastCopyToFinishSet;
- (BOOL)_setupLoopingReturningError:(id *)a3;
- (NSArray)loopingPlayerItems;
- (NSError)error;
- (NSInteger)loopCount;
- (int)_calculateNumberOfCopiesNeeded;
- (void)_changeStatusToFailedWithError:(id)a3;
- (void)_cleanupAfterPlayingLastLoopingCopy;
- (void)_configureLoopingItem:(id)a3;
- (void)_turnOffLooping;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AVPlayerLooper

- (BOOL)_setupLoopingReturningError:(id *)a3
{
  v75[1] = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerLooper *)self status]) {
    goto LABEL_2;
  }
  looper = self->_looper;
  if ((looper->loopRange.start.flags & 1) != 0
    && (looper->loopRange.duration.flags & 1) != 0
    && !looper->loopRange.duration.epoch
    && (looper->loopRange.duration.value & 0x8000000000000000) == 0)
  {
    loopingItem = looper->loopingItem;
    if (loopingItem)
    {
      [(AVPlayerItem *)loopingItem duration];
      if ((BYTE4(v66) & 0x1D) == 1)
      {
        v43 = self->_looper;
        p_loopRange = &v43->loopRange;
        v45 = v43->loopingItem;
        if (v45) {
          [(AVPlayerItem *)v45 duration];
        }
        else {
          memset(&time2, 0, sizeof(time2));
        }
        *(_OWORD *)&time1.start.value = *(_OWORD *)&p_loopRange->start.value;
        time1.start.epoch = p_loopRange->start.epoch;
        if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        {
          if (a3)
          {
            uint64_t v74 = *MEMORY[0x1E4F1D138];
            v75[0] = @"Loop range must start within [0, item duration]";
            v38 = (void *)MEMORY[0x1E4F1C9E8];
            v39 = (__CFString **)v75;
            v40 = &v74;
            goto LABEL_45;
          }
          goto LABEL_62;
        }
        v46 = self->_looper;
        long long v47 = *(_OWORD *)&v46->loopRange.start.epoch;
        *(_OWORD *)&time1.start.value = *(_OWORD *)&v46->loopRange.start.value;
        *(_OWORD *)&time1.start.epoch = v47;
        *(_OWORD *)&time1.duration.timescale = *(_OWORD *)&v46->loopRange.duration.timescale;
        CMTimeRangeGetEnd(&v63, &time1);
        v48 = self->_looper->loopingItem;
        if (v48) {
          [(AVPlayerItem *)v48 duration];
        }
        else {
          memset(&v61, 0, sizeof(v61));
        }
        if (CMTimeCompare(&v63, &v61) >= 1)
        {
          if (a3)
          {
            uint64_t v72 = *MEMORY[0x1E4F1D138];
            v73 = @"Loop range must be within [0, item duration]";
            v38 = (void *)MEMORY[0x1E4F1C9E8];
            v39 = &v73;
            v40 = &v72;
            goto LABEL_45;
          }
          goto LABEL_62;
        }
      }
    }
    else
    {
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
    }
  }
  int v7 = [(AVPlayerLooper *)self _calculateNumberOfCopiesNeeded];
  if (!v7)
  {
    if (a3)
    {
      uint64_t v70 = *MEMORY[0x1E4F1D138];
      v71 = @"Template AVPlayerItem's duration must not be 0";
      v38 = (void *)MEMORY[0x1E4F1C9E8];
      v39 = &v71;
      v40 = &v70;
LABEL_45:
      v41 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11838, (void *)[v38 dictionaryWithObjects:v39 forKeys:v40 count:1]);
      LOBYTE(v5) = 0;
      *a3 = v41;
      return (char)v5;
    }
LABEL_62:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  int v8 = v7;
  v9 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  if (v8 < 1)
  {
LABEL_12:
    [(AVPlayerLooper *)self willChangeValueForKey:@"loopingPlayerItems"];
    ivarAccessQueue = self->_looper->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AVPlayerLooper__setupLoopingReturningError___block_invoke;
    block[3] = &unk_1E57B2098;
    block[4] = self;
    block[5] = v9;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    [(AVPlayerLooper *)self didChangeValueForKey:@"loopingPlayerItems"];
    [(AVPlayer *)self->_looper->loopingPlayer rate];
    float v14 = v13;
    if (v13 != 0.0) {
      [(AVPlayer *)self->_looper->loopingPlayer setRate:0.0];
    }
    v15 = self->_looper;
    if ((v15->loopRange.start.flags & 1) != 0
      && (v15->loopRange.duration.flags & 1) != 0
      && !v15->loopRange.duration.epoch
      && (v15->loopRange.duration.value & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&v15->forwardPlaybackStartTime.value = *(_OWORD *)&v15->loopRange.start.value;
      v15->forwardPlaybackStartTime.epoch = v15->loopRange.start.epoch;
      v15 = self->_looper;
    }
    v16 = [(AVPlayer *)v15->loopingPlayer currentItem];
    v17 = v16;
    if (v16) {
      v18 = v16;
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    loopingItemCopies = self->_looper->loopingItemCopies;
    uint64_t v20 = [(NSMutableArray *)loopingItemCopies countByEnumeratingWithState:&v56 objects:v69 count:16];
    v21 = v17;
    if (v20)
    {
      uint64_t v22 = v20;
      uint64_t v23 = *(void *)v57;
      v21 = v17;
      do
      {
        uint64_t v24 = 0;
        v25 = v21;
        do
        {
          if (*(void *)v57 != v23) {
            objc_enumerationMutation(loopingItemCopies);
          }
          v21 = *(AVPlayerItem **)(*((void *)&v56 + 1) + 8 * v24);
          [(AVPlayerLooper *)self _configureLoopingItem:v21];
          [(AVQueuePlayer *)self->_looper->loopingPlayer insertItem:v21 afterItem:v25];
          ++v24;
          v25 = v21;
        }
        while (v22 != v24);
        uint64_t v22 = [(NSMutableArray *)loopingItemCopies countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v22);
    }
    if (v17)
    {
      v26 = self->_looper;
      if (v26->existingItemsPrecede)
      {
        [(AVQueuePlayer *)v26->loopingPlayer removeItem:v17];
        [(AVQueuePlayer *)self->_looper->loopingPlayer insertItem:v17 afterItem:v21];
      }
    }
    self->_looper->lastEnqueuedLoopingItem = v21;
    self->_looper->playerOriginalActionAtItemEnd = [(AVPlayer *)self->_looper->loopingPlayer actionAtItemEnd];
    v27 = self->_looper;
    if (v27->playerOriginalActionAtItemEnd) {
      [(AVQueuePlayer *)v27->loopingPlayer setActionAtItemEnd:0];
    }
    [(AVPlayerLooper *)self willChangeValueForKey:@"status"];
    v28 = self->_looper->ivarAccessQueue;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __46__AVPlayerLooper__setupLoopingReturningError___block_invoke_2;
    v55[3] = &unk_1E57B1E80;
    v55[4] = self;
    av_readwrite_dispatch_queue_write(v28, v55);
    [(AVPlayerLooper *)self didChangeValueForKey:@"status"];
    id v29 = +[AVKVODispatcher sharedKVODispatcher];
    self->_looper->playerCurrentItemKVOInvoker = (AVCallbackCancellation *)[v29 startObservingObject:self->_looper->loopingPlayer weakObserver:self forKeyPath:@"currentItem" options:3 context:@"AVPlayerLooperObservationCurrentItemContext"];
    v30 = self->_looper->playerCurrentItemKVOInvoker;
    self->_looper->loopingItemStatusKVOInvokers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v31 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obj = self->_looper->loopingItemCopies;
    uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v32)
    {
      uint64_t v34 = v32;
      uint64_t v35 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          -[NSMutableArray addObject:](self->_looper->loopingItemStatusKVOInvokers, "addObject:", [v29 startObservingObject:v37 weakObserver:self forKeyPath:@"status" options:3 context:@"AVPlayerLooperObservationItemStatusContext"]);
          [v31 addListenerWithWeakReference:self->_looper->weakReference callback:_avplLoopingItemFailedToPlayToEndTimeNotificationHandler name:@"AVPlayerItemFailedToPlayToEndTimeNotification" object:v37 flags:0];
        }
        uint64_t v34 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v68 count:16];
      }
      while (v34);
    }
    LOBYTE(v5) = 1;
    self->_looper->listeningForItemFailedToPlayToEndTime = 1;
    if (v14 != 0.0)
    {
      *(float *)&double v33 = v14;
      [(AVPlayer *)self->_looper->loopingPlayer setRate:v33];
LABEL_2:
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    int v10 = v8 + 1;
    while (1)
    {
      id v5 = [(AVPlayerItem *)self->_looper->loopingItem copyWithZone:[(AVPlayerLooper *)self zone]];
      if (!v5) {
        break;
      }
      v11 = v5;
      [v9 addObject:v5];

      if (--v10 <= 1) {
        goto LABEL_12;
      }
    }
  }
  return (char)v5;
}

- (AVPlayerLooperStatus)status
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayerLooper_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerLooperStatus v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_configureLoopingItem:(id)a3
{
  looper = self->_looper;
  if ((looper->loopRange.start.flags & 1) != 0
    && (looper->loopRange.duration.flags & 1) != 0
    && !looper->loopRange.duration.epoch
    && (looper->loopRange.duration.value & 0x8000000000000000) == 0)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&looper->loopRange.start.value;
    range.start.epoch = looper->loopRange.start.epoch;
    [a3 setReversePlaybackEndTime:&range];
    uint64_t v6 = self->_looper;
    long long v7 = *(_OWORD *)&v6->loopRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&v6->loopRange.start.value;
    *(_OWORD *)&range.start.epoch = v7;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&v6->loopRange.duration.timescale;
    CMTimeRangeGetEnd(&v13, &range);
    [a3 setForwardPlaybackEndTime:&v13];
    looper = self->_looper;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&looper->forwardPlaybackStartTime.value;
  range.start.epoch = looper->forwardPlaybackStartTime.epoch;
  long long v10 = *MEMORY[0x1E4F1FA48];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v8 = v10;
  uint64_t v9 = v11;
  [a3 seekToTime:&range toleranceBefore:&v10 toleranceAfter:&v8 completionHandler:0];
}

- (int)_calculateNumberOfCopiesNeeded
{
  looper = self->_looper;
  double v4 = 10.0;
  if ((looper->loopRange.start.flags & 1) != 0
    && (looper->loopRange.duration.flags & 1) != 0
    && !looper->loopRange.duration.epoch
    && (looper->loopRange.duration.value & 0x8000000000000000) == 0)
  {
    CMTime time = (CMTime)looper->loopRange.duration;
    double v4 = fmin(CMTimeGetSeconds(&time), 10.0);
    looper = self->_looper;
  }
  loopingItem = looper->loopingItem;
  if (loopingItem)
  {
    [(AVPlayerItem *)loopingItem duration];
    if ((v10 & 0x1D) == 1)
    {
      uint64_t v6 = self->_looper->loopingItem;
      if (v6) {
        [(AVPlayerItem *)v6 duration];
      }
      else {
        memset(&v9, 0, sizeof(v9));
      }
      double Seconds = CMTimeGetSeconds(&v9);
      if (Seconds < v4) {
        double v4 = Seconds;
      }
    }
  }
  if (v4 * 3.0 >= 10.0) {
    return 3;
  }
  if (v4 <= 0.0) {
    return 0;
  }
  if (v4 > 0.1)
  {
    int result = vcvtpd_s64_f64(10.0 / v4);
    if (result > 2) {
      return result;
    }
    return 0;
  }
  return 100;
}

uint64_t __24__AVPlayerLooper_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 144);
  return result;
}

uint64_t __46__AVPlayerLooper__setupLoopingReturningError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) addObjectsFromArray:*(void *)(a1 + 40)];
}

uint64_t __36__AVPlayerLooper_loopingPlayerItems__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([(AVPlayerLooper *)self status] == AVPlayerLooperStatusReady
    || [(AVPlayerLooper *)self _isWaitingForLastCopyToFinishSet])
  {
    if (a6 == @"AVPlayerLooperObservationCurrentItemContext")
    {
      int v10 = (AVPlayerItem *)[a5 objectForKey:*MEMORY[0x1E4F284E0]];
      if ([(AVPlayerLooper *)self status] == AVPlayerLooperStatusReady)
      {
        if (v10 != (AVPlayerItem *)[MEMORY[0x1E4F1CA98] null]
          && [(NSMutableArray *)self->_looper->loopingItemCopies indexOfObjectIdenticalTo:v10] != 0x7FFFFFFFFFFFFFFFLL&& self->_looper->lastEnqueuedLoopingItem)
        {
          [(AVPlayerLooper *)self _configureLoopingItem:v10];
          [(AVQueuePlayer *)self->_looper->loopingPlayer insertItem:v10 afterItem:self->_looper->lastEnqueuedLoopingItem];
          self->_looper->lastEnqueuedLoopingItem = v10;
          [(AVPlayerLooper *)self willChangeValueForKey:@"loopCount"];
          ivarAccessQueue = self->_looper->ivarAccessQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_1E57B1E80;
          block[4] = self;
          av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
          [(AVPlayerLooper *)self didChangeValueForKey:@"loopCount"];
        }
      }
      else if ([(AVPlayerLooper *)self _isWaitingForLastCopyToFinishSet] {
             && v10 != (AVPlayerItem *)[MEMORY[0x1E4F1CA98] null]
      }
             && [(NSMutableArray *)self->_looper->loopingItemCopies indexOfObjectIdenticalTo:v10] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(AVPlayerLooper *)self willChangeValueForKey:@"loopCount"];
        v12 = self->_looper->ivarAccessQueue;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v13[3] = &unk_1E57B1E80;
        v13[4] = self;
        av_readwrite_dispatch_queue_write(v12, v13);
        [(AVPlayerLooper *)self didChangeValueForKey:@"loopCount"];
        [(AVPlayerLooper *)self _cleanupAfterPlayingLastLoopingCopy];
      }
    }
    else if (a4 {
           && a6 == @"AVPlayerLooperObservationItemStatusContext"
    }
           && -[NSMutableArray indexOfObjectIdenticalTo:](self->_looper->loopingItemCopies, "indexOfObjectIdenticalTo:", a4) != 0x7FFFFFFFFFFFFFFFLL&& [a4 status] == 2)
    {
      -[AVPlayerLooper _changeStatusToFailedWithError:](self, "_changeStatusToFailedWithError:", [a4 error]);
      [(AVPlayerLooper *)self _turnOffLooping];
    }
  }
}

uint64_t __78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = 0;
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 16), "asset"), "statusOfValueForKey:error:", @"duration", &v6) == 2)
  {
    uint64_t v5 = 0;
    uint64_t result = [*(id *)(a1 + 32) _setupLoopingReturningError:&v5];
    if (result) {
      return result;
    }
    AVPlayerLooperStatus v3 = *(void **)(a1 + 32);
    uint64_t v4 = v5;
  }
  else
  {
    AVPlayerLooperStatus v3 = *(void **)(a1 + 32);
    uint64_t v4 = v6;
  }
  return [v3 _changeStatusToFailedWithError:v4];
}

void __78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) dispatchQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke_2;
  v3[3] = &unk_1E57B1E80;
  v3[4] = *(void *)(a1 + 32);
  AVSerializeOnQueueAsyncIfNecessary(v2, v3);
}

- (NSArray)loopingPlayerItems
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  CMTime v9 = __Block_byref_object_copy__0;
  int v10 = __Block_byref_object_dispose__0;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerLooper_loopingPlayerItems__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerLooperStatus v3 = (NSArray *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)initialize
{
}

+ (AVPlayerLooper)playerLooperWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop
{
  id v6 = objc_alloc((Class)a1);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v9[0] = *MEMORY[0x1E4F1FA20];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  return (AVPlayerLooper *)(id)[v6 initWithPlayer:player templateItem:itemToLoop timeRange:v9];
}

- (AVPlayerLooper)initWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange
{
  long long v5 = *(_OWORD *)&loopRange->start.epoch;
  v7[0] = *(_OWORD *)&loopRange->start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&loopRange->duration.timescale;
  return [(AVPlayerLooper *)self initWithPlayer:player templateItem:itemToLoop timeRange:v7 existingItemsOrdering:0];
}

- (AVPlayerLooper)initWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange existingItemsOrdering:(AVPlayerLooperItemOrdering)itemOrdering
{
  v44.receiver = self;
  v44.super_class = (Class)AVPlayerLooper;
  uint64_t v11 = [(AVPlayerLooper *)&v44 init];
  v12 = v11;
  if (!v11) {
    return v12;
  }
  if (!player)
  {
    v26 = v11;
    uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    uint64_t v34 = "player != nil";
    goto LABEL_23;
  }
  if (!itemToLoop)
  {
    uint64_t v35 = v11;
    uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    uint64_t v34 = "itemToLoop != nil";
    goto LABEL_23;
  }
  if ((loopRange->start.flags & 1) != 0 && (loopRange->duration.flags & 1) != 0 && !loopRange->duration.epoch)
  {
    p_duration = &loopRange->duration;
    if ((loopRange->duration.value & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&time1.value = *(_OWORD *)&p_duration->value;
      time1.epoch = loopRange->duration.epoch;
      long long v40 = *MEMORY[0x1E4F1FA48];
      *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA48];
      CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      time2.epoch = v14;
      if (CMTimeCompare(&time1, &time2))
      {
        CMTimeFlags flags = loopRange->start.flags;
        if ((flags & 1) != 0
          && (CMTimeFlags v16 = loopRange->duration.flags, (v16 & 1) != 0)
          && !loopRange->duration.epoch
          && (p_duration->value & 0x8000000000000000) == 0
          && ((v16 | flags) & 0x10) != 0)
        {
          v39 = v12;
          uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v33 = *MEMORY[0x1E4F1C3C8];
          uint64_t v34 = "! CMTIMERANGE_IS_INDEFINITE(loopRange)";
        }
        else
        {
          CMTime time1 = loopRange->start;
          *(_OWORD *)&time2.value = v40;
          time2.epoch = v14;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
            goto LABEL_15;
          }
          v38 = v12;
          uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v33 = *MEMORY[0x1E4F1C3C8];
          uint64_t v34 = "CMTIME_COMPARE_INLINE(loopRange.start, >=, kCMTimeZero)";
        }
      }
      else
      {
        uint64_t v37 = v12;
        uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v33 = *MEMORY[0x1E4F1C3C8];
        uint64_t v34 = "! CMTIMERANGE_IS_EMPTY(loopRange)";
      }
LABEL_23:
      v36 = (void *)[v32 exceptionWithName:v33, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v12, a2, @"invalid parameter not satisfying: %s", v27, v28, v29, v30, v31, (uint64_t)v34), 0 reason userInfo];
      objc_exception_throw(v36);
    }
  }
LABEL_15:
  v17 = objc_alloc_init(AVPlayerLooperInternal);
  v12->_looper = v17;
  if (v17
    && (v12->_looper->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerlooper.ivars")) != 0
    && (v12->_looper->loopingItemCopies = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0], v18 = v12->_looper, v18->loopingItemCopies))
  {
    v18->status = 0;
    v12->_looper->loopCount = 0;
    looper = v12->_looper;
    uint64_t v20 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&looper->forwardPlaybackStartTime.value = *MEMORY[0x1E4F1FA48];
    looper->forwardPlaybackStartTime.epoch = *(void *)(v20 + 16);
    v12->_looper->loopingPlayer = player;
    v12->_looper->loopingItem = itemToLoop;
    v21 = v12->_looper;
    long long v23 = *(_OWORD *)&loopRange->start.epoch;
    long long v22 = *(_OWORD *)&loopRange->duration.timescale;
    *(_OWORD *)&v21->loopRange.start.value = *(_OWORD *)&loopRange->start.value;
    *(_OWORD *)&v21->loopRange.start.epoch = v23;
    *(_OWORD *)&v21->loopRange.duration.timescale = v22;
    v12->_looper->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v12];
    v12->_looper->existingItemsPrecede = itemOrdering == AVPlayerLooperItemOrderingLoopingItemsPrecedeExistingItems;
    uint64_t v24 = [(AVPlayerItem *)v12->_looper->loopingItem asset];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __78__AVPlayerLooper_initWithPlayer_templateItem_timeRange_existingItemsOrdering___block_invoke;
    v41[3] = &unk_1E57B1E80;
    v41[4] = v12;
    [(AVAsset *)v24 loadValuesAsynchronouslyForKeys:&unk_1EE5E19B0 completionHandler:v41];
  }
  else
  {

    return 0;
  }
  return v12;
}

+ (AVPlayerLooper)playerLooperWithPlayer:(AVQueuePlayer *)player templateItem:(AVPlayerItem *)itemToLoop timeRange:(CMTimeRange *)loopRange
{
  id v8 = objc_alloc((Class)a1);
  long long v9 = *(_OWORD *)&loopRange->start.epoch;
  v11[0] = *(_OWORD *)&loopRange->start.value;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&loopRange->duration.timescale;
  return (AVPlayerLooper *)(id)[v8 initWithPlayer:player templateItem:itemToLoop timeRange:v11];
}

- (AVPlayerLooper)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v4[0] = *MEMORY[0x1E4F1FA20];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  return [(AVPlayerLooper *)self initWithPlayer:0 templateItem:0 timeRange:v4];
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  looper = self->_looper;
  if (looper)
  {

    uint64_t v4 = self->_looper;
    if (v4->listeningForItemFailedToPlayToEndTime)
    {
      id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      loopingItemCopies = self->_looper->loopingItemCopies;
      uint64_t v7 = [(NSMutableArray *)loopingItemCopies countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(loopingItemCopies);
            }
            [v5 removeListenerWithWeakReference:self->_looper->weakReference callback:_avplLoopingItemFailedToPlayToEndTimeNotificationHandler name:@"AVPlayerItemFailedToPlayToEndTimeNotification" object:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          }
          uint64_t v8 = [(NSMutableArray *)loopingItemCopies countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }
      self->_looper->listeningForItemFailedToPlayToEndTime = 0;
      uint64_t v4 = self->_looper;
    }
    loopingPlayer = v4->loopingPlayer;
    if (loopingPlayer)
    {
      v12 = v4->loopingItemCopies;
      int64_t playerOriginalActionAtItemEnd = v4->playerOriginalActionAtItemEnd;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __25__AVPlayerLooper_dealloc__block_invoke;
      block[3] = &unk_1E57B2270;
      block[4] = v12;
      void block[5] = loopingPlayer;
      void block[6] = playerOriginalActionAtItemEnd;
      if ((dyld_program_sdk_at_least() & 1) != 0
        || (dyld_program_sdk_at_least() & 1) != 0
        || (dyld_program_sdk_at_least() & 1) != 0
        || (dyld_program_sdk_at_least() & 1) != 0)
      {
        dispatch_async((dispatch_queue_t)[(AVPlayer *)loopingPlayer dispatchQueue], block);
      }
      else
      {
        AVSerializeOnQueueAsyncIfNecessary([(AVPlayer *)loopingPlayer dispatchQueue], block);
      }
    }

    CMTimeEpoch v14 = self->_looper;
    ivarAccessQueue = v14->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      self->_looper->ivarAccessQueue = 0;
      CMTimeEpoch v14 = self->_looper;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AVPlayerLooper;
  [(AVPlayerLooper *)&v16 dealloc];
}

uint64_t __25__AVPlayerLooper_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) removeItem:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  if (*(void *)(a1 + 48)) {
    return objc_msgSend(*(id *)(a1 + 40), "setActionAtItemEnd:");
  }
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__0;
  long long v10 = __Block_byref_object_dispose__0;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayerLooper_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerLooperStatus v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __23__AVPlayerLooper_error__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 152);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_changeStatusToFailedWithError:(id)a3
{
  [(AVPlayerLooper *)self willChangeValueForKey:@"error"];
  [(AVPlayerLooper *)self willChangeValueForKey:@"status"];
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AVPlayerLooper__changeStatusToFailedWithError___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
  [(AVPlayerLooper *)self didChangeValueForKey:@"error"];
  [(AVPlayerLooper *)self didChangeValueForKey:@"status"];
}

uint64_t __49__AVPlayerLooper__changeStatusToFailedWithError___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 144) != 2)
  {
    uint64_t v1 = result;
    id result = [*(id *)(result + 40) copy];
    *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + 152) = result;
    *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + 144) = 2;
  }
  return result;
}

- (NSInteger)loopCount
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayerLooper_loopCount__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  NSInteger v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__AVPlayerLooper_loopCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 80);
  return result;
}

uint64_t __46__AVPlayerLooper__setupLoopingReturningError___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(void *)(v1 + 144)) {
    *(void *)(v1 + 144) = 1;
  }
  return result;
}

- (void)_turnOffLooping
{
  [(AVPlayerLooper *)self willChangeValueForKey:@"status"];
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AVPlayerLooper__turnOffLooping__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayerLooper *)self didChangeValueForKey:@"status"];
  uint64_t v4 = [(AVPlayer *)self->_looper->loopingPlayer dispatchQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerLooper__turnOffLooping__block_invoke_2;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(v4, v5);
}

uint64_t __33__AVPlayerLooper__turnOffLooping__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v1 + 144) != 2) {
    *(void *)(v1 + 144) = 3;
  }
  return result;
}

void __33__AVPlayerLooper__turnOffLooping__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 128) = 0;
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) currentItem];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  NSInteger v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*((void *)&v12 + 1) + 8 * i) == v2) {
          char v6 = 1;
        }
        else {
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 8), "removeItem:");
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
    if (v6)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      long long v10 = *(NSObject **)(*(void *)(v9 + 8) + 88);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__AVPlayerLooper__turnOffLooping__block_invoke_3;
      block[3] = &unk_1E57B1E80;
      block[4] = v9;
      av_readwrite_dispatch_queue_write(v10, block);
    }
  }
}

uint64_t __33__AVPlayerLooper__turnOffLooping__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 136) = 1;
  return result;
}

- (BOOL)_isWaitingForLastCopyToFinishSet
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_looper->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVPlayerLooper__isWaitingForLastCopyToFinishSet__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AVPlayerLooper__isWaitingForLastCopyToFinishSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 136);
  return result;
}

- (void)_cleanupAfterPlayingLastLoopingCopy
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerLooper *)self _isWaitingForLastCopyToFinishSet])
  {
    ivarAccessQueue = self->_looper->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__AVPlayerLooper__cleanupAfterPlayingLastLoopingCopy__block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    looper = self->_looper;
    if (looper->playerOriginalActionAtItemEnd)
    {
      -[AVQueuePlayer setActionAtItemEnd:](looper->loopingPlayer, "setActionAtItemEnd:");
      looper = self->_looper;
    }
    if (looper->listeningForItemFailedToPlayToEndTime)
    {
      id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      loopingItemCopies = self->_looper->loopingItemCopies;
      uint64_t v7 = [(NSMutableArray *)loopingItemCopies countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(loopingItemCopies);
            }
            [v5 removeListenerWithWeakReference:self->_looper->weakReference callback:_avplLoopingItemFailedToPlayToEndTimeNotificationHandler name:@"AVPlayerItemFailedToPlayToEndTimeNotification" object:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          }
          uint64_t v8 = [(NSMutableArray *)loopingItemCopies countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v8);
      }
      self->_looper->listeningForItemFailedToPlayToEndTime = 0;
      looper = self->_looper;
    }
    loopingItemStatusKVOInvokers = looper->loopingItemStatusKVOInvokers;
    if (loopingItemStatusKVOInvokers)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v12 = [(NSMutableArray *)loopingItemStatusKVOInvokers countByEnumeratingWithState:&v17 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(loopingItemStatusKVOInvokers);
            }
            [*(id *)(*((void *)&v17 + 1) + 8 * j) cancelCallbacks];
          }
          uint64_t v13 = [(NSMutableArray *)loopingItemStatusKVOInvokers countByEnumeratingWithState:&v17 objects:v26 count:16];
        }
        while (v13);
      }

      self->_looper->loopingItemStatusKVOInvokers = 0;
      looper = self->_looper;
    }
    playerCurrentItemKVOInvoker = looper->playerCurrentItemKVOInvoker;
    if (playerCurrentItemKVOInvoker)
    {
      [(AVCallbackCancellation *)playerCurrentItemKVOInvoker cancelCallbacks];

      self->_looper->playerCurrentItemKVOInvoker = 0;
    }
  }
}

uint64_t __53__AVPlayerLooper__cleanupAfterPlayingLastLoopingCopy__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 136) = 0;
  return result;
}

uint64_t __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __65__AVPlayerLooper_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result)
{
  return result;
}

@end