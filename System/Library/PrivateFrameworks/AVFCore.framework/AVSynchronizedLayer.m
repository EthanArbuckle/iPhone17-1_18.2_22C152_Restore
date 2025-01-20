@interface AVSynchronizedLayer
+ (AVSynchronizedLayer)synchronizedLayerWithPlayerItem:(AVPlayerItem *)playerItem;
+ (void)initialize;
- (AVPlayerItem)playerItem;
- (AVSynchronizedLayer)init;
- (BOOL)_isVisible;
- (id)_popAllOldPlayerItems;
- (void)_removeSelfFromPlayerItem:(id)a3;
- (void)_updatePlayerItemState;
- (void)dealloc;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)setPlayerItem:(AVPlayerItem *)playerItem;
@end

@implementation AVSynchronizedLayer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (AVSynchronizedLayer)synchronizedLayerWithPlayerItem:(AVPlayerItem *)playerItem
{
  v4 = objc_alloc_init(AVSynchronizedLayer);
  [(AVSynchronizedLayer *)v4 setPlayerItem:playerItem];
  return v4;
}

- (AVSynchronizedLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVSynchronizedLayer;
  v2 = [(AVSynchronizedLayer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVSynchronizedLayerInternal);
    v2->_syncLayer = v3;
    if (v3)
    {
      CFRetain(v3);
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_syncLayer->serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSynchronizedLayerQueue", v4);
      v2->_syncLayer->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avsynchronizedlayer.ivars");
      v2->_syncLayer->oldPlayerItems = (NSMutableSet *)(id)[MEMORY[0x1E4F1CA80] set];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVPlayerItem)playerItem
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__14;
  syncLayer = self->_syncLayer;
  v11 = __Block_byref_object_dispose__14;
  uint64_t v12 = 0;
  ivarAccessQueue = syncLayer->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__AVSynchronizedLayer_playerItem__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  v4 = (AVPlayerItem *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __33__AVSynchronizedLayer_playerItem__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_isVisible
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  syncLayer = self->_syncLayer;
  char v10 = 0;
  ivarAccessQueue = syncLayer->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__AVSynchronizedLayer__isVisible__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__AVSynchronizedLayer__isVisible__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32)
                                                                            + 40);
  return result;
}

- (id)_popAllOldPlayerItems
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy__14;
  syncLayer = self->_syncLayer;
  v11 = __Block_byref_object_dispose__14;
  uint64_t v12 = 0;
  ivarAccessQueue = syncLayer->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVSynchronizedLayer__popAllOldPlayerItems__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __44__AVSynchronizedLayer__popAllOldPlayerItems__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 32) copy];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 32);
  return [v2 removeAllObjects];
}

- (void)_removeSelfFromPlayerItem:(id)a3
{
  if (a3)
  {
    [a3 _removeSyncLayer:self];
    [(AVSynchronizedLayer *)self setInheritsTiming:1];
  }
}

- (void)_updatePlayerItemState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__AVSynchronizedLayer__updatePlayerItemState__block_invoke;
  v2[3] = &unk_1E57B1E80;
  v2[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v2);
}

uint64_t __45__AVSynchronizedLayer__updatePlayerItemState__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(a1 + 32) playerItem];
  v3 = (void *)[*(id *)(a1 + 32) _popAllOldPlayerItems];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void **)(*((void *)&v9 + 1) + 8 * i) != v2) {
          objc_msgSend(*(id *)(a1 + 32), "_removeSelfFromPlayerItem:");
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  if ([*(id *)(a1 + 32) _isVisible]) {
    return [v2 _addSyncLayer:*(void *)(a1 + 32)];
  }
  else {
    return [*(id *)(a1 + 32) _removeSelfFromPlayerItem:v2];
  }
}

- (void)setPlayerItem:(AVPlayerItem *)playerItem
{
  ivarAccessQueue = self->_syncLayer->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVSynchronizedLayer_setPlayerItem___block_invoke;
  v5[3] = &unk_1E57B2098;
  v5[4] = self;
  v5[5] = playerItem;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVSynchronizedLayer *)self _updatePlayerItemState];
}

void *__37__AVSynchronizedLayer_setPlayerItem___block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2 != result[5])
  {
    v3 = result;
    if (v2)
    {
      objc_msgSend(*(id *)(v1 + 32), "addObject:");
      uint64_t v4 = *(void **)(*(void *)(v3[4] + 32) + 24);
    }
    else
    {
      uint64_t v4 = 0;
    }

    id result = (id)v3[5];
    *(void *)(*(void *)(v3[4] + 32) + 24) = result;
  }
  return result;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  ivarAccessQueue = self->_syncLayer->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v7 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke_2;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32) + 40) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __45__AVSynchronizedLayer_layerDidBecomeVisible___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlayerItemState];
}

- (void)dealloc
{
  syncLayer = self->_syncLayer;
  if (syncLayer)
  {
    serialQueue = syncLayer->serialQueue;
    if (serialQueue)
    {
      playerItem = syncLayer->playerItem;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__AVSynchronizedLayer_dealloc__block_invoke;
      block[3] = &unk_1E57B1E80;
      block[4] = playerItem;
      dispatch_async(serialQueue, block);
      dispatch_release((dispatch_object_t)self->_syncLayer->serialQueue);
      syncLayer = self->_syncLayer;
    }

    uint64_t v6 = self->_syncLayer;
    ivarAccessQueue = v6->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      uint64_t v6 = self->_syncLayer;
    }

    CFRelease(self->_syncLayer);
  }
  v8.receiver = self;
  v8.super_class = (Class)AVSynchronizedLayer;
  [(AVSynchronizedLayer *)&v8 dealloc];
}

void __30__AVSynchronizedLayer_dealloc__block_invoke(uint64_t a1)
{
}

@end