@interface QLLoopingMediaItemViewController
- (BOOL)pause;
- (BOOL)play;
- (id)player;
- (void)dealloc;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)previewDidAppear:(BOOL)a3;
- (void)setupPlayerWithMediaAsset:(id)a3;
- (void)startObservingItem;
- (void)stopObservingItem;
@end

@implementation QLLoopingMediaItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__QLLoopingMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v11[3] = &unk_2642F5E58;
  v11[4] = self;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)QLLoopingMediaItemViewController;
  id v9 = v8;
  [(QLMediaItemBaseViewController *)&v10 loadPreviewControllerWithContents:a3 context:a4 completionHandler:v11];
}

void __96__QLLoopingMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) setShouldFit:1];
  [*(id *)(a1 + 32) imageSize];
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)previewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLLoopingMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v5 previewDidAppear:a3];
  [(QLLoopingMediaItemViewController *)self startObservingItem];
  v4.receiver = self;
  v4.super_class = (Class)QLLoopingMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v4 play];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (a6 == &AVLoopPlayerCurrentItemObservationContext)
  {
    id v14 = v11;
    v15 = [v14 items];
    uint64_t v16 = [v15 count];

    if (!v16)
    {
      v24 = (NSObject **)MEMORY[0x263F62940];
      v25 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F61000, v25, OS_LOG_TYPE_DEBUG, "Play queue emptied out due to bad player item. End looping. #Media", buf, 2u);
      }
      [(QLLoopingMediaItemViewController *)self pause];
      goto LABEL_20;
    }
    id v17 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(_OWORD *)buf = *MEMORY[0x263F010E0];
      uint64_t v28 = *(void *)(MEMORY[0x263F010E0] + 16);
      [v17 seekToTime:buf completionHandler:0];
      [(QLLoopingMediaItemViewController *)self stopObservingItem];
      [v14 insertItem:v17 afterItem:0];
      [(QLLoopingMediaItemViewController *)self startObservingItem];
    }
    goto LABEL_14;
  }
  if (a6 == &AVLoopPlayerCurrentItemStatusObservationContext)
  {
    id v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    id v18 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v18 || [v14 unsignedIntegerValue] != 2) {
      goto LABEL_20;
    }
    id v17 = v11;
    v19 = (NSObject **)MEMORY[0x263F62940];
    v20 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      v22 = [v17 currentItem];
      v23 = [v22 error];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v23;
      _os_log_impl(&dword_217F61000, v21, OS_LOG_TYPE_ERROR, "End looping since player item has failed with error %@ #Media", buf, 0xCu);
    }
    [(QLLoopingMediaItemViewController *)self pause];
LABEL_14:

LABEL_20:
    goto LABEL_21;
  }
  v26.receiver = self;
  v26.super_class = (Class)QLLoopingMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v26 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_21:
}

- (void)dealloc
{
  [(QLLoopingMediaItemViewController *)self stopObservingItem];
  v3.receiver = self;
  v3.super_class = (Class)QLLoopingMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v3 dealloc];
}

- (BOOL)play
{
  [(QLLoopingMediaItemViewController *)self startObservingItem];
  v6.receiver = self;
  v6.super_class = (Class)QLLoopingMediaItemViewController;
  BOOL v3 = [(QLMediaItemBaseViewController *)&v6 play];
  if (v3)
  {
    objc_super v4 = [(QLItemViewController *)self delegate];
    [v4 previewItemViewController:self wantsFullScreen:1];
  }
  return v3;
}

- (BOOL)pause
{
  v5.receiver = self;
  v5.super_class = (Class)QLLoopingMediaItemViewController;
  BOOL v3 = [(QLMediaItemBaseViewController *)&v5 pause];
  [(QLLoopingMediaItemViewController *)self stopObservingItem];
  return v3;
}

- (void)setupPlayerWithMediaAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = v4;
  memset(&v15[1], 0, sizeof(CMTime));
  if (v4) {
    [v4 duration];
  }
  CMTimeMake(v15, 1, 100);
  CMTime time1 = v15[1];
  if (CMTimeCompare(&time1, v15) < 0 || ![(QLMediaItemBaseViewController *)self playable])
  {
    id v9 = (NSObject **)MEMORY[0x263F62940];
    id v10 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CMTime time1 = v15[1];
      id v11 = v10;
      Float64 Seconds = CMTimeGetSeconds(&time1);
      BOOL v13 = [(QLMediaItemBaseViewController *)self playable];
      id v14 = "NO";
      if (v13) {
        id v14 = "YES";
      }
      LODWORD(time1.value) = 134218242;
      *(Float64 *)((char *)&time1.value + 4) = Seconds;
      LOWORD(time1.flags) = 2080;
      *(void *)((char *)&time1.flags + 2) = v14;
      _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_ERROR, "Can't loop. Asset duration too short (%1.3f sec) or not playable(isPlayable: %s) #Media", (uint8_t *)&time1, 0x16u);
    }
  }
  else
  {
    CMTime time1 = v15[1];
    for (unint64_t i = (unint64_t)(1.0 / CMTimeGetSeconds(&time1) + 2.0); i; --i)
    {
      v7 = [MEMORY[0x263EFA800] playerItemWithAsset:v5];
      if (v7)
      {
        id v8 = [(QLLoopingMediaItemViewController *)self player];
        [v8 insertItem:v7 afterItem:0];
      }
    }
    [(QLLoopingMediaItemViewController *)self startObservingItem];
  }
}

- (void)startObservingItem
{
  if (!self->_addedObservers)
  {
    [(AVQueuePlayer *)self->_queuePlayer addObserver:self forKeyPath:@"currentItem" options:2 context:&AVLoopPlayerCurrentItemObservationContext];
    [(AVQueuePlayer *)self->_queuePlayer addObserver:self forKeyPath:@"currentItem.status" options:1 context:&AVLoopPlayerCurrentItemStatusObservationContext];
    self->_addedObservers = 1;
  }
}

- (void)stopObservingItem
{
  if (self->_addedObservers)
  {
    [(AVQueuePlayer *)self->_queuePlayer removeObserver:self forKeyPath:@"currentItem" context:&AVLoopPlayerCurrentItemObservationContext];
    [(AVQueuePlayer *)self->_queuePlayer removeObserver:self forKeyPath:@"currentItem.status" context:&AVLoopPlayerCurrentItemStatusObservationContext];
    self->_addedObservers = 0;
  }
}

- (id)player
{
  queuePlayer = self->_queuePlayer;
  if (!queuePlayer)
  {
    id v4 = (AVQueuePlayer *)objc_opt_new();
    objc_super v5 = self->_queuePlayer;
    self->_queuePlayer = v4;

    queuePlayer = self->_queuePlayer;
  }

  return queuePlayer;
}

- (void).cxx_destruct
{
}

@end