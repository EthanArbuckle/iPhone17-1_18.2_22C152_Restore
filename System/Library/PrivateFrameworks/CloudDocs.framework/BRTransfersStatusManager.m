@interface BRTransfersStatusManager
+ (id)defaultManager;
+ (void)initialize;
- (BRTransfersStatusManager)initWithPersonaIdentifier:(id)a3;
- (NSArray)transfers;
- (id)startObservingItemDownloadProgressAtURL:(id)a3;
- (void)_progressSubscription;
- (void)_setGlobalProgress:(id)a3 forIvar:(id *)a4;
- (void)_setupTimerToDisplayGlobalProgress;
- (void)addTransfer:(id)a3;
- (void)dealloc;
- (void)downloadAndObserveItemAtURL:(id)a3 handler:(id)a4;
- (void)insertTransfer:(id)a3 atIndex:(unint64_t)a4;
- (void)removeTransfer:(id)a3;
- (void)showGlobalProgressIfNeeded;
- (void)stopObservingItemDownloadProgress:(id)a3;
@end

@implementation BRTransfersStatusManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    g_transferManagerForPersona = [(id)objc_opt_new() initWithKeyOptions:0 valueOptions:5 capacity:2];
    MEMORY[0x1F41817F8]();
  }
}

- (BRTransfersStatusManager)initWithPersonaIdentifier:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRTransfersStatusManager;
  v6 = [(BRTransfersStatusManager *)&v16 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transfers = v6->_transfers;
    v6->_transfers = v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v9;

    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("status-manager", v12);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v6->_personaIdentifier, a3);
    [(BRTransfersStatusManager *)v6 _progressSubscription];
  }

  return v6;
}

- (void)dealloc
{
  id v3 = (id)g_transferManagerForPersona;
  objc_sync_enter(v3);
  [(id)g_transferManagerForPersona removeObjectForKey:self->_personaIdentifier];
  objc_sync_exit(v3);

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_globalProgressSubscriber)
  {
    objc_msgSend(MEMORY[0x1E4F28F90], "_removeSubscriber:");
    id globalProgressSubscriber = v4->_globalProgressSubscriber;
    v4->_id globalProgressSubscriber = 0;
  }
  objc_sync_exit(v4);

  v6.receiver = v4;
  v6.super_class = (Class)BRTransfersStatusManager;
  [(BRTransfersStatusManager *)&v6 dealloc];
}

+ (id)defaultManager
{
  v2 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  id v3 = (id)g_transferManagerForPersona;
  objc_sync_enter(v3);
  v4 = [(id)g_transferManagerForPersona objectForKey:v2];
  if (!v4)
  {
    v4 = [[BRTransfersStatusManager alloc] initWithPersonaIdentifier:v2];
    [(id)g_transferManagerForPersona setObject:v4 forKey:v2];
  }
  objc_sync_exit(v3);

  return v4;
}

- (NSArray)transfers
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableArray *)v2->_transfers copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)downloadAndObserveItemAtURL:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BRFileProvidingOperation alloc] initWithURL:v7 readingOptions:131073];
  v9 = [(BRTransfersStatusManager *)self startObservingItemDownloadProgressAtURL:v7];

  [v9 setCancellable:1];
  v10 = [v9 cancellationHandler];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke;
  v18[3] = &unk_1E59ADD08;
  v19 = v8;
  id v20 = v10;
  v11 = v8;
  id v12 = v10;
  [v9 setCancellationHandler:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke_2;
  v15[3] = &unk_1E59AE948;
  id v16 = v9;
  id v17 = v6;
  v15[4] = self;
  id v13 = v9;
  id v14 = v6;
  [(BRFileProvidingOperation *)v11 setFileProvidingCompletion:v15];
  [(NSOperationQueue *)self->_operationQueue addOperation:v11];
}

uint64_t __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 cancel];
}

uint64_t __64__BRTransfersStatusManager_downloadAndObserveItemAtURL_handler___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 stopObservingItemDownloadProgress:v3];
}

- (id)startObservingItemDownloadProgressAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [[BRDownloadProgressProxy alloc] initWithURL:v4];
  [(BRDownloadProgressProxy *)v5 start];
  id v6 = self;
  objc_sync_enter(v6);
  unint64_t shouldHideGlobalDownloadProgressCount = v6->_shouldHideGlobalDownloadProgressCount;
  if (!shouldHideGlobalDownloadProgressCount)
  {
    if (v6->_globalDownloadProgress)
    {
      -[BRTransfersStatusManager removeTransfer:](v6, "removeTransfer:");
      unint64_t shouldHideGlobalDownloadProgressCount = v6->_shouldHideGlobalDownloadProgressCount;
    }
    else
    {
      unint64_t shouldHideGlobalDownloadProgressCount = 0;
    }
  }
  v6->_unint64_t shouldHideGlobalDownloadProgressCount = shouldHideGlobalDownloadProgressCount + 1;
  [(BRTransfersStatusManager *)v6 addTransfer:v5];
  objc_sync_exit(v6);

  return v5;
}

- (void)stopObservingItemDownloadProgress:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  --v5->_shouldHideGlobalDownloadProgressCount;
  [(BRTransfersStatusManager *)v5 removeTransfer:v4];
  queue = v5->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__BRTransfersStatusManager_stopObservingItemDownloadProgress___block_invoke;
  block[3] = &unk_1E59AD3B0;
  block[4] = v5;
  dispatch_async(queue, block);
  objc_sync_exit(v5);

  [v4 stop];
}

uint64_t __62__BRTransfersStatusManager_stopObservingItemDownloadProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupTimerToDisplayGlobalProgress];
}

- (void)showGlobalProgressIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_shouldHideGlobalDownloadProgressCount && self->_globalDownloadProgress)
  {
    -[BRTransfersStatusManager insertTransfer:atIndex:](self, "insertTransfer:atIndex:");
  }
}

- (void)_setupTimerToDisplayGlobalProgress
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timerToDisplayGlobalProgress = self->_timerToDisplayGlobalProgress;
  if (timerToDisplayGlobalProgress) {
    dispatch_source_cancel(timerToDisplayGlobalProgress);
  }
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  id v5 = self->_timerToDisplayGlobalProgress;
  self->_timerToDisplayGlobalProgress = v4;

  id v6 = self->_timerToDisplayGlobalProgress;
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x2CB41780uLL);
  objc_initWeak(&location, self);
  v8 = self->_timerToDisplayGlobalProgress;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__BRTransfersStatusManager__setupTimerToDisplayGlobalProgress__block_invoke;
  v16[3] = &unk_1E59AE2E8;
  objc_copyWeak(&v17, &location);
  v9 = v8;
  v10 = v16;
  v11 = v9;
  id v12 = v10;
  id v13 = v12;
  id v14 = v12;
  if (brc_block_remember_persona)
  {
    id v14 = brc_block_remember_persona(v12);
  }
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
  dispatch_source_set_event_handler(v11, v15);

  dispatch_resume((dispatch_object_t)self->_timerToDisplayGlobalProgress);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __62__BRTransfersStatusManager__setupTimerToDisplayGlobalProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showGlobalProgressIfNeeded];
}

- (void)removeTransfer:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)v4->_transfers indexOfObject:v7];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5];
    [(BRTransfersStatusManager *)v4 willChange:3 valuesAtIndexes:v6 forKey:@"transfers"];
    [(NSMutableArray *)v4->_transfers removeObject:v7];
    [(BRTransfersStatusManager *)v4 didChange:3 valuesAtIndexes:v6 forKey:@"transfers"];
  }
  objc_sync_exit(v4);
}

- (void)addTransfer:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)v4->_transfers count];
  id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5];
  [(BRTransfersStatusManager *)v4 willChange:2 valuesAtIndexes:v6 forKey:@"transfers"];
  [(NSMutableArray *)v4->_transfers addObject:v7];
  [(BRTransfersStatusManager *)v4 didChange:2 valuesAtIndexes:v6 forKey:@"transfers"];

  objc_sync_exit(v4);
}

- (void)insertTransfer:(id)a3 atIndex:(unint64_t)a4
{
  id v8 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
  [(BRTransfersStatusManager *)v6 willChange:2 valuesAtIndexes:v7 forKey:@"transfers"];
  [(NSMutableArray *)v6->_transfers insertObject:v8 atIndex:0];
  [(BRTransfersStatusManager *)v6 didChange:2 valuesAtIndexes:v7 forKey:@"transfers"];

  objc_sync_exit(v6);
}

- (void)_setGlobalProgress:(id)a3 forIvar:(id *)a4
{
  id v8 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  if (*a4) {
    -[BRTransfersStatusManager removeTransfer:](v7, "removeTransfer:");
  }
  objc_storeStrong(a4, a3);
  if (v8 && (!v7->_shouldHideGlobalDownloadProgressCount || &v7->_globalDownloadProgress != (NSProgress **)a4)) {
    [(BRTransfersStatusManager *)v7 insertTransfer:v8 atIndex:0];
  }
  objc_sync_exit(v7);
}

- (void)_progressSubscription
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__BRTransfersStatusManager__progressSubscription__block_invoke;
  v9[3] = &unk_1E59AE970;
  v9[4] = self;
  uint64_t v3 = (void *)MEMORY[0x19F3C48D0](v9, a2);
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = (void *)MEMORY[0x1E4F28F90];
  id v6 = +[BRDaemonConnection mobileDocumentsURL];
  uint64_t v7 = [v5 _addSubscriberForFileURL:v6 withPublishingHandler:v3];
  id globalProgressSubscriber = v4->_globalProgressSubscriber;
  v4->_id globalProgressSubscriber = (id)v7;

  objc_sync_exit(v4);
}

id __49__BRTransfersStatusManager__progressSubscription__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28868]];

  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if ([v5 isEqualToString:*MEMORY[0x1E4F28858]])
  {
    uint64_t v7 = *(char **)(a1 + 32);
    id v8 = v7 + 32;
LABEL_5:
    [v7 _setGlobalProgress:v3 forIvar:v8];
    objc_sync_exit(v6);

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__BRTransfersStatusManager__progressSubscription__block_invoke_2;
    v17[3] = &unk_1E59AD648;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v18 = v9;
    uint64_t v19 = v10;
    v11 = (void *)[v17 copy];
    dispatch_block_t v15 = (void *)MEMORY[0x19F3C48D0](v11, v12, v13, v14);

    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F28880]])
  {
    uint64_t v7 = *(char **)(a1 + 32);
    id v8 = v7 + 24;
    goto LABEL_5;
  }
  objc_sync_exit(v6);

  dispatch_block_t v15 = 0;
LABEL_7:

  return v15;
}

uint64_t __49__BRTransfersStatusManager__progressSubscription__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F28858]])
  {
    uint64_t v2 = *(char **)(a1 + 40);
    id v3 = v2 + 32;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F28880]];
    if (!result) {
      return result;
    }
    uint64_t v2 = *(char **)(a1 + 40);
    id v3 = v2 + 24;
  }

  return [v2 _setGlobalProgress:0 forIvar:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerToDisplayGlobalProgress, 0);
  objc_storeStrong(&self->_globalProgressSubscriber, 0);
  objc_storeStrong((id *)&self->_globalDownloadProgress, 0);
  objc_storeStrong((id *)&self->_globalUploadProgress, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_transfers, 0);
}

@end