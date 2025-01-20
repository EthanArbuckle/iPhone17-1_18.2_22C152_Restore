@interface CKPreviewDispatchCache
+ (id)detailsPreviewCache;
+ (id)genmojiPreviewCache;
+ (id)mapThumbnailQueue;
+ (id)previewPrewarmQueue;
+ (id)snapshotCache;
+ (id)stickerPreviewCache;
+ (id)transcriptPreviewCache;
+ (int64_t)_defaultPreviewPriority;
+ (void)_invalidateStickerPreviewCache;
- (BOOL)isGeneratingPreviewForKey:(id)a3;
- (BOOL)shouldReplaceCachedPreview:(id)a3 withPreview:(id)a4;
- (CKDispatchCache)dispatchCache;
- (CKMultiDict)pendingBlocks;
- (CKPreviewDispatchCache)init;
- (CKPreviewDispatchCache)initWithCacheLimit:(unint64_t)a3 dispatchPriority:(int64_t)a4 isConcurrent:(BOOL)a5;
- (id)cachedPreviewForKey:(id)a3;
- (id)mediaObjectManager;
- (id)notificationCenter;
- (void)beginGeneratingForKey:(id)a3;
- (void)clearQueueAndCachedPreviews;
- (void)dealloc;
- (void)endGeneratingForKey:(id)a3;
- (void)enqueueGenerationBlock:(id)a3 completion:(id)a4 withPriority:(int64_t)a5 forKey:(id)a6;
- (void)enqueueSaveBlock:(id)a3 forMediaObject:(id)a4 withPriority:(int64_t)a5;
- (void)enqueueSaveBlock:(id)a3 withPriority:(int64_t)a4;
- (void)flush;
- (void)resume;
- (void)setCachedPreview:(id)a3 key:(id)a4;
- (void)setDispatchCache:(id)a3;
- (void)setPendingBlocks:(id)a3;
- (void)suspend;
- (void)transferFinished:(id)a3;
- (void)transferRemoved:(id)a3;
@end

@implementation CKPreviewDispatchCache

void __45__CKPreviewDispatchCache_genmojiPreviewCache__block_invoke()
{
  v0 = [[CKPreviewDispatchCache alloc] initWithCacheLimit:0 dispatchPriority:2 isConcurrent:1];
  v1 = (void *)genmojiPreviewCache_sSnapshotDispatchCache;
  genmojiPreviewCache_sSnapshotDispatchCache = (uint64_t)v0;
}

void __48__CKPreviewDispatchCache_transcriptPreviewCache__block_invoke(uint64_t a1)
{
  v1 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, [*(id *)(a1 + 32) _defaultPreviewPriority], 0);
  v2 = (void *)transcriptPreviewCache_sPreviewDispatchCache;
  transcriptPreviewCache_sPreviewDispatchCache = (uint64_t)v1;
}

- (CKPreviewDispatchCache)initWithCacheLimit:(unint64_t)a3 dispatchPriority:(int64_t)a4 isConcurrent:(BOOL)a5
{
  BOOL v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKPreviewDispatchCache;
  v8 = [(CKPreviewDispatchCache *)&v14 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v9 addListener:v8];

    v10 = [(CKPreviewDispatchCache *)v8 notificationCenter];
    [v10 addObserver:v8 selector:sel_didReceiveMemoryWarning name:*MEMORY[0x1E4F43670] object:0];

    v11 = [[CKDispatchCache alloc] initWithCacheLimit:a3 dispatchPriority:a4 isConcurrent:v5];
    [(CKPreviewDispatchCache *)v8 setDispatchCache:v11];
    v12 = objc_alloc_init(CKMultiDict);
    [(CKPreviewDispatchCache *)v8 setPendingBlocks:v12];
  }
  return v8;
}

- (void)setPendingBlocks:(id)a3
{
}

- (void)setDispatchCache:(id)a3
{
}

- (id)notificationCenter
{
  return (id)[MEMORY[0x1E4F28EB8] defaultCenter];
}

+ (int64_t)_defaultPreviewPriority
{
  if (IMIsRunningInMessagesUIProcess()) {
    return 0;
  }
  else {
    return -32768;
  }
}

- (void)resume
{
  id v2 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v2 resume];
}

- (CKDispatchCache)dispatchCache
{
  return self->_dispatchCache;
}

+ (id)transcriptPreviewCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CKPreviewDispatchCache_transcriptPreviewCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transcriptPreviewCache_once != -1) {
    dispatch_once(&transcriptPreviewCache_once, block);
  }
  id v2 = (void *)transcriptPreviewCache_sPreviewDispatchCache;

  return v2;
}

+ (id)genmojiPreviewCache
{
  if (genmojiPreviewCache_once != -1) {
    dispatch_once(&genmojiPreviewCache_once, &__block_literal_global_266);
  }
  id v2 = (void *)genmojiPreviewCache_sSnapshotDispatchCache;

  return v2;
}

+ (id)detailsPreviewCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CKPreviewDispatchCache_detailsPreviewCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (detailsPreviewCache_once != -1) {
    dispatch_once(&detailsPreviewCache_once, block);
  }
  id v2 = (void *)detailsPreviewCache_sDetailsDispatchCache;

  return v2;
}

void __45__CKPreviewDispatchCache_detailsPreviewCache__block_invoke(uint64_t a1)
{
  v1 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 250, [*(id *)(a1 + 32) _defaultPreviewPriority], 0);
  id v2 = (void *)detailsPreviewCache_sDetailsDispatchCache;
  detailsPreviewCache_sDetailsDispatchCache = (uint64_t)v1;
}

+ (id)snapshotCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CKPreviewDispatchCache_snapshotCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (snapshotCache_once != -1) {
    dispatch_once(&snapshotCache_once, block);
  }
  id v2 = (void *)snapshotCache_sSnapshotDispatchCache;

  return v2;
}

void __39__CKPreviewDispatchCache_snapshotCache__block_invoke(uint64_t a1)
{
  v1 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, [*(id *)(a1 + 32) _defaultPreviewPriority], 0);
  id v2 = (void *)snapshotCache_sSnapshotDispatchCache;
  snapshotCache_sSnapshotDispatchCache = (uint64_t)v1;
}

+ (id)stickerPreviewCache
{
  v3 = (void *)sStickerPreviewCache;
  if (!sStickerPreviewCache)
  {
    v4 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, [a1 _defaultPreviewPriority], 0);
    BOOL v5 = (void *)sStickerPreviewCache;
    sStickerPreviewCache = (uint64_t)v4;

    [(id)sStickerPreviewCache resume];
    v3 = (void *)sStickerPreviewCache;
  }

  return v3;
}

+ (void)_invalidateStickerPreviewCache
{
  id v2 = (void *)sStickerPreviewCache;
  sStickerPreviewCache = 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 removeListener:self];

  v4 = [(CKPreviewDispatchCache *)self notificationCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CKPreviewDispatchCache;
  [(CKPreviewDispatchCache *)&v5 dealloc];
}

- (CKPreviewDispatchCache)init
{
  uint64_t v3 = CKDefaultCacheLimit();
  uint64_t v4 = [(id)objc_opt_class() _defaultPreviewPriority];

  return [(CKPreviewDispatchCache *)self initWithCacheLimit:v3 dispatchPriority:v4 isConcurrent:0];
}

- (void)enqueueSaveBlock:(id)a3 withPriority:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v7 enqueueBlock:v6 withPriority:a4];
}

- (void)enqueueGenerationBlock:(id)a3 completion:(id)a4 withPriority:(int64_t)a5 forKey:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v13 enqueueGenerationBlock:v12 completion:v11 withPriority:a5 forKey:v10];
}

- (id)cachedPreviewForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKPreviewDispatchCache *)self dispatchCache];
  id v6 = [v5 cachedObjectForKey:v4];

  return v6;
}

- (void)setCachedPreview:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(CKPreviewDispatchCache *)self cachedPreviewForKey:v6];
  if ([(CKPreviewDispatchCache *)self shouldReplaceCachedPreview:v7 withPreview:v9])
  {
    v8 = [(CKPreviewDispatchCache *)self dispatchCache];
    [v8 setCachedObject:v9 forKey:v6];
  }
}

- (BOOL)isGeneratingPreviewForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKPreviewDispatchCache *)self dispatchCache];
  char v6 = [v5 isGeneratingForKey:v4];

  return v6;
}

- (void)beginGeneratingForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v5 beginGeneratingForKey:v4];
}

- (void)endGeneratingForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v5 endGeneratingForKey:v4];
}

- (void)suspend
{
  id v2 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v2 suspend];
}

- (id)mediaObjectManager
{
  return +[CKMediaObjectManager sharedInstance];
}

- (void)flush
{
  uint64_t v3 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v3 clearQueue];

  id v4 = [(CKPreviewDispatchCache *)self pendingBlocks];
  [v4 removeAllObjects];

  id v5 = [(CKPreviewDispatchCache *)self notificationCenter];
  [v5 removeObserver:self name:@"CKFileTransferFinishedNotification" object:0];
  [v5 removeObserver:self name:@"CKFileTransferRemovedNotification" object:0];
}

- (void)transferFinished:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_DEBUG, "Transfer %@ finished. Execute its pending operations.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      id v13 = v5;
      _CKLog();
    }
    id v7 = objc_msgSend(v5, "guid", v13);
    v8 = [(CKPreviewDispatchCache *)self pendingBlocks];
    id v9 = [v8 popObjectForKey:v7];

    if (v9)
    {
      do
      {
        v9[2](v9);
        id v10 = [(CKPreviewDispatchCache *)self pendingBlocks];
        uint64_t v11 = [v10 popObjectForKey:v7];

        id v9 = (void (**)(void))v11;
      }
      while (v11);
    }
    id v12 = [(CKPreviewDispatchCache *)self notificationCenter];
    [v12 removeObserver:self name:@"CKFileTransferFinishedNotification" object:0];
    [v12 removeObserver:self name:@"CKFileTransferRemovedNotification" object:0];
  }
}

- (void)transferRemoved:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_DEBUG, "Transfer %@ removed. Dump its pending operations.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      id v10 = v5;
      _CKLog();
    }
    id v7 = objc_msgSend(v5, "guid", v10);
    v8 = [(CKPreviewDispatchCache *)self pendingBlocks];
    [v8 removeObjectsForKey:v7];

    id v9 = [(CKPreviewDispatchCache *)self notificationCenter];
    [v9 removeObserver:self name:@"CKFileTransferFinishedNotification" object:0];
    [v9 removeObserver:self name:@"CKFileTransferRemovedNotification" object:0];
  }
}

- (BOOL)shouldReplaceCachedPreview:(id)a3 withPreview:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

- (void)clearQueueAndCachedPreviews
{
  [(CKPreviewDispatchCache *)self flush];
  id v3 = [(CKPreviewDispatchCache *)self dispatchCache];
  [v3 emptyCache];
}

- (CKMultiDict)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);

  objc_storeStrong((id *)&self->_dispatchCache, 0);
}

- (void)enqueueSaveBlock:(id)a3 forMediaObject:(id)a4 withPriority:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (CKIsRunningInFullCKClient() || CKIsRunningUnitTests())
  {
    id v10 = [(CKPreviewDispatchCache *)self dispatchCache];
    uint64_t v11 = [v9 transfer];
    int v12 = [v11 isFileURLFinalized];

    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        CKLogCStringForType(2);
        objc_super v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v9;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_DEBUG, "%@ save preview.", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke;
      v22[3] = &unk_1E5623828;
      id v24 = v8;
      id v23 = v9;
      [v10 enqueueBlock:v22 withPriority:a5];

      v15 = &v24;
    }
    else
    {
      if (v13)
      {
        CKLogCStringForType(2);
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v9;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_DEBUG, "%@ transfer fileURL isn't finalized so defer saving preview.", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_191;
      block[3] = &unk_1E562B698;
      v18[0] = v9;
      v18[1] = self;
      id v19 = v10;
      id v20 = v8;
      int64_t v21 = a5;
      dispatch_async(MEMORY[0x1E4F14428], block);

      v15 = (id *)v18;
    }
  }
}

uint64_t __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_191(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transferGUID];
  id v3 = [*(id *)(a1 + 32) transfer];
  id v4 = [v3 IMMessage];

  id v5 = [*(id *)(a1 + 32) messageContext];
  id v6 = [v5 chatContext];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_2;
  v18[3] = &unk_1E562C640;
  id v7 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  id v19 = v2;
  id v20 = v4;
  id v21 = v6;
  id v22 = v7;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v23 = v8;
  uint64_t v24 = v9;
  id v10 = v6;
  id v11 = v4;
  id v12 = v2;
  int v13 = (void *)[v18 copy];
  objc_super v14 = [*(id *)(a1 + 40) pendingBlocks];
  v15 = _Block_copy(v13);
  [v14 pushObject:v15 forKey:v12];

  uint64_t v16 = [*(id *)(a1 + 32) transfer];
  v17 = [*(id *)(a1 + 40) notificationCenter];
  [v17 addObserver:*(void *)(a1 + 40) selector:sel_transferFinished_ name:@"CKFileTransferFinishedNotification" object:v16];
  [v17 addObserver:*(void *)(a1 + 40) selector:sel_transferRemoved_ name:@"CKFileTransferRemovedNotification" object:v16];
}

void __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mediaObjectManager];
  id v3 = [v2 mediaObjectWithTransferGUID:*(void *)(a1 + 40) imMessage:*(void *)(a1 + 48) chatContext:*(void *)(a1 + 56)];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_3;
  v8[3] = &unk_1E5623828;
  id v4 = *(void **)(a1 + 64);
  id v5 = *(id *)(a1 + 72);
  id v9 = v3;
  id v10 = v5;
  uint64_t v6 = *(void *)(a1 + 80);
  id v7 = v3;
  [v4 enqueueBlock:v8 withPriority:v6];
}

uint64_t __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)previewPrewarmQueue
{
  if (previewPrewarmQueue_once != -1) {
    dispatch_once(&previewPrewarmQueue_once, &__block_literal_global_195_1);
  }
  id v2 = (void *)previewPrewarmQueue_sPreviewPrewarmQueue;

  return v2;
}

void __68__CKPreviewDispatchCache_CKMediaObject_Display__previewPrewarmQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Messages.CKPreviewDispatchCachePreviewPrewarmQueue", v2);
  v1 = (void *)previewPrewarmQueue_sPreviewPrewarmQueue;
  previewPrewarmQueue_sPreviewPrewarmQueue = (uint64_t)v0;
}

+ (id)mapThumbnailQueue
{
  if (mapThumbnailQueue_once != -1) {
    dispatch_once(&mapThumbnailQueue_once, &__block_literal_global_202_0);
  }
  id v2 = (void *)mapThumbnailQueue_sMapThumbnailQueue;

  return v2;
}

void __61__CKPreviewDispatchCache_MKMapSnapshotter__mapThumbnailQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Messages.CKPreviewDispatchCacheMapThumbnailQueue", v2);
  v1 = (void *)mapThumbnailQueue_sMapThumbnailQueue;
  mapThumbnailQueue_sMapThumbnailQueue = (uint64_t)v0;
}

@end