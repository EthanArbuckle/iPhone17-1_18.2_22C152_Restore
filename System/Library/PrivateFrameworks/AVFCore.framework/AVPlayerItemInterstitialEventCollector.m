@interface AVPlayerItemInterstitialEventCollector
- (AVPlayerItemInterstitialEventCollector)initWithCoordinatorGenerator:(id)a3;
- (BOOL)_attachToPlayerItem:(id)a3;
- (void)_detatchFromPlayerItem;
- (void)_updateTaggedRangeMetadataArray:(id)a3;
- (void)dealloc;
@end

@implementation AVPlayerItemInterstitialEventCollector

- (BOOL)_attachToPlayerItem:(id)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (!a3)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"playerItem != nil"), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  block[6] = &v13;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  BOOL v9 = *((unsigned char *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (void)_updateTaggedRangeMetadataArray:(id)a3
{
  if ([a3 count])
  {
    objc_loadWeak((id *)&self->_weakReferenceToPlayerItem);
    FigPlayerInterstitialEventsCreateFromTaggedRangeMetadata();
  }
}

- (AVPlayerItemInterstitialEventCollector)initWithCoordinatorGenerator:(id)a3
{
  if (!a3)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"obtainCoordinator != nil"), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVPlayerItemInterstitialEventCollector;
  BOOL v9 = [(AVPlayerItemMediaDataCollector *)&v12 init];
  if (v9)
  {
    v9->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeriteminterstitialeventcollector.ivars");
    v9->_obtainCoordinator = _Block_copy(a3);
  }
  return v9;
}

id __103__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___attachToPlayerItem___block_invoke(void *a1)
{
  id result = objc_loadWeak((id *)(a1[4] + 32));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = (void *)a1[5];
    uint64_t v4 = (id *)(a1[4] + 32);
    return objc_storeWeak(v4, v3);
  }
  return result;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_weakReferenceToPlayerItem, 0);
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  _Block_release(self->_obtainCoordinator);
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemInterstitialEventCollector;
  [(AVPlayerItemMediaDataCollector *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

- (void)_detatchFromPlayerItem
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

id __105__AVPlayerItemInterstitialEventCollector_AVPlayerItemMediaDataCollector_Internal___detatchFromPlayerItem__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), 0);
}

@end