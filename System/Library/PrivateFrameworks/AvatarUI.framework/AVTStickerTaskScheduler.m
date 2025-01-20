@interface AVTStickerTaskScheduler
+ (AVTStickerTaskScheduler)schedulerWithRecordDataSource:(id)a3;
- (AVTAvatarRecordDataSource)recordDataSource;
- (AVTStickerTaskScheduler)initWithEnvironment:(id)a3 recordDataSource:(id)a4;
- (AVTUILogger)logger;
- (NSArray)allAvatarRecordIdentifiers;
- (NSArray)sortedVisibleIndexPaths;
- (NSMutableDictionary)stickerPickerBacklogTasks;
- (NSMutableDictionary)stickerPickerTasks;
- (NSMutableDictionary)stickerSheetPlaceholderTasks;
- (NSMutableDictionary)stickerSheetsTasks;
- (NSString)selectedAvatarRecordIdentifier;
- (OS_dispatch_queue)stateLock;
- (id)nextPickerThumbnailFromTasksBacklogStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4;
- (id)nextPickerThumbnailFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4;
- (id)nextSelectedSheetStickerFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4;
- (id)nextSheetPlaceHolderFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4;
- (id)nextSheetStickerFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4;
- (id)nextTaskToRunFromStickerPickerTasks:(id)a3 stickerPickerBacklogStorage:(id)a4 stickerSheetPlaceholderTasks:(id)a5 stickerSheetsTasks:(id)a6;
- (id)nextVisibleSelectedSheetStickerFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4 visibleIndexPaths:(id)a5;
- (id)selectedPickerThumbnailFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4;
- (id)selectedSheetPlaceholderFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4;
- (void)cancelAllTasks;
- (void)cancelPickerTask:(id)a3 avatarRecordIdentifier:(id)a4;
- (void)cancelStickerSheetTasksForAvatarRecordIdentifier:(id)a3;
- (void)didCompleteTask:(id)a3;
- (void)lowerStickerPickerTaskPriority:(id)a3 avatarRecordIdentifier:(id)a4;
- (void)performStateWork:(id)a3;
- (void)reloadData;
- (void)scheduleStickerTask:(id)a3;
- (void)setAllAvatarRecordIdentifiers:(id)a3;
- (void)setSelectedAvatarRecordIdentifier:(id)a3;
- (void)setSortedVisibleIndexPaths:(id)a3;
- (void)setVisibleIndexPaths:(id)a3;
- (void)startTask:(id)a3;
@end

@implementation AVTStickerTaskScheduler

+ (AVTStickerTaskScheduler)schedulerWithRecordDataSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = +[AVTUIEnvironment defaultEnvironment];
  v6 = (void *)[v4 initWithEnvironment:v5 recordDataSource:v3];

  return (AVTStickerTaskScheduler *)v6;
}

- (AVTStickerTaskScheduler)initWithEnvironment:(id)a3 recordDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AVTStickerTaskScheduler;
  v8 = [(AVTStickerTaskScheduler *)&v23 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    stickerPickerTasks = v8->_stickerPickerTasks;
    v8->_stickerPickerTasks = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    stickerPickerBacklogTasks = v8->_stickerPickerBacklogTasks;
    v8->_stickerPickerBacklogTasks = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    stickerSheetPlaceholderTasks = v8->_stickerSheetPlaceholderTasks;
    v8->_stickerSheetPlaceholderTasks = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    stickerSheetsTasks = v8->_stickerSheetsTasks;
    v8->_stickerSheetsTasks = (NSMutableDictionary *)v15;

    v17 = [v6 lockProvider];
    uint64_t v18 = ((void (**)(void, const char *))v17)[2](v17, "com.apple.AvatarUI.AVTStickerScheduler.stateLock");
    stateLock = v8->_stateLock;
    v8->_stateLock = (OS_dispatch_queue *)v18;

    uint64_t v20 = [v6 logger];
    logger = v8->_logger;
    v8->_logger = (AVTUILogger *)v20;

    objc_storeStrong((id *)&v8->_recordDataSource, a4);
    [(AVTStickerTaskScheduler *)v8 reloadData];
  }

  return v8;
}

- (void)performStateWork:(id)a3
{
  id v4 = a3;
  v5 = [(AVTStickerTaskScheduler *)self stateLock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__AVTStickerTaskScheduler_performStateWork___block_invoke;
  v7[3] = &unk_263FF02C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __44__AVTStickerTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) stickerPickerTasks];
  id v3 = [*(id *)(a1 + 32) stickerPickerBacklogTasks];
  id v4 = [*(id *)(a1 + 32) stickerSheetPlaceholderTasks];
  v5 = [*(id *)(a1 + 32) stickerSheetsTasks];
  (*(void (**)(uint64_t, id, void *, void *, void *))(v2 + 16))(v2, v6, v3, v4, v5);
}

- (void)scheduleStickerTask:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke;
  v8[3] = &unk_263FF2470;
  id v5 = v4;
  v10 = self;
  uint64_t v11 = &v12;
  id v9 = v5;
  [(AVTStickerTaskScheduler *)self performStateWork:v8];
  if (*((unsigned char *)v13 + 24))
  {
    id v6 = [(AVTStickerTaskScheduler *)self logger];
    id v7 = [v5 description];
    [v6 logStickerSchedulerStartedTask:v7 forSchedulerRule:@"first task to run"];

    [(AVTStickerTaskScheduler *)self startTask:v5];
  }

  _Block_object_dispose(&v12, 8);
}

void __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [*(id *)(a1 + 32) avatarRecordIdentifier];
  uint64_t v14 = [*(id *)(a1 + 32) stickerType];
  switch(v14)
  {
    case 2:
      v17 = [v12 objectForKeyedSubscript:v13];
      if (!v17)
      {
        v17 = [MEMORY[0x263EFF980] array];
        [v12 setObject:v17 forKeyedSubscript:v13];
      }
      [v17 addObject:*(void *)(a1 + 32)];

      break;
    case 1:
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = v11;
      goto LABEL_9;
    case 0:
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = v9;
LABEL_9:
      [v16 setObject:v15 forKeyedSubscript:v13];
      break;
  }
  uint64_t v22 = 0;
  objc_super v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = [v9 count];
  uint64_t v25 = [v11 count] + v18;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke_2;
  v21[3] = &unk_263FF2448;
  v21[4] = &v22;
  [v12 enumerateKeysAndObjectsUsingBlock:v21];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23[3] == 1;
  v19 = [*(id *)(a1 + 40) logger];
  uint64_t v20 = [*(id *)(a1 + 32) description];
  [v19 logStickerSchedulerAddedTask:v20 taskCount:v23[3]];

  _Block_object_dispose(&v22, 8);
}

uint64_t __47__AVTStickerTaskScheduler_scheduleStickerTask___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result + v4;
  return result;
}

- (void)lowerStickerPickerTaskPriority:(id)a3 avatarRecordIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__AVTStickerTaskScheduler_lowerStickerPickerTaskPriority_avatarRecordIdentifier___block_invoke;
  v10[3] = &unk_263FF2498;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AVTStickerTaskScheduler *)self performStateWork:v10];
}

void __81__AVTStickerTaskScheduler_lowerStickerPickerTaskPriority_avatarRecordIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v9 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v7 = [v6 task];
  id v8 = *(void **)(a1 + 40);

  if (v7 == v8)
  {
    [v9 removeObjectForKey:*(void *)(a1 + 32)];
    [v5 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (void)startTask:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 task];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__AVTStickerTaskScheduler_startTask___block_invoke;
  v7[3] = &unk_263FF03B0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  ((void (**)(void, void *))v5)[2](v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__AVTStickerTaskScheduler_startTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didCompleteTask:*(void *)(a1 + 32)];
}

- (void)didCompleteTask:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__15;
  uint64_t v14 = __Block_byref_object_dispose__15;
  id v15 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke;
  v6[3] = &unk_263FF2470;
  id v5 = v4;
  id v8 = self;
  id v9 = &v10;
  id v7 = v5;
  [(AVTStickerTaskScheduler *)self performStateWork:v6];
  if (v11[5]) {
    -[AVTStickerTaskScheduler startTask:](self, "startTask:");
  }

  _Block_object_dispose(&v10, 8);
}

void __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [*(id *)(a1 + 32) avatarRecordIdentifier];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke_2;
  uint64_t v25 = &unk_263FF24C0;
  id v14 = v13;
  id v26 = v14;
  id v27 = *(id *)(a1 + 32);
  id v15 = (void (**)(void, void))MEMORY[0x210530210](&v22);
  uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "stickerType", v22, v23, v24, v25);
  switch(v16)
  {
    case 2:
      v17 = [v12 objectForKeyedSubscript:v14];
      uint64_t v18 = [v17 indexOfObject:*(void *)(a1 + 32)];
      if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
        [v17 removeObjectAtIndex:v18];
      }

      break;
    case 1:
      ((void (**)(void, id))v15)[2](v15, v11);
      break;
    case 0:
      ((void (**)(void, id))v15)[2](v15, v9);
      ((void (**)(void, id))v15)[2](v15, v10);
      break;
  }
  uint64_t v19 = [*(id *)(a1 + 40) nextTaskToRunFromStickerPickerTasks:v9 stickerPickerBacklogStorage:v10 stickerSheetPlaceholderTasks:v11 stickerSheetsTasks:v12];
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void __43__AVTStickerTaskScheduler_didCompleteTask___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v3 == *(void **)(a1 + 40)) {
    [v4 removeObjectForKey:*(void *)(a1 + 32)];
  }
}

- (void)cancelPickerTask:(id)a3 avatarRecordIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__AVTStickerTaskScheduler_cancelPickerTask_avatarRecordIdentifier___block_invoke;
  v10[3] = &unk_263FF24E8;
  id v12 = self;
  id v13 = v6;
  id v11 = v7;
  id v8 = v6;
  id v9 = v7;
  [(AVTStickerTaskScheduler *)self performStateWork:v10];
}

void __67__AVTStickerTaskScheduler_cancelPickerTask_avatarRecordIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = [v17 count];
  if (v6 + [v5 count])
  {
    id v7 = [v17 objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (v7)
    {
      id v8 = v7;
      id v9 = [v7 task];
      id v10 = *(void **)(a1 + 48);

      if (v9 == v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = v17;
LABEL_7:
        [v12 removeObjectForKey:v11];
        id v15 = [*(id *)(a1 + 40) logger];
        uint64_t v16 = [v8 description];
        [v15 logStickerSchedulerCancelledTask:v16];
      }
    }
    else
    {
      id v8 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
      id v13 = [v8 task];
      id v14 = *(void **)(a1 + 48);

      if (v13 == v14)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = v5;
        goto LABEL_7;
      }
    }
  }
}

- (void)cancelStickerSheetTasksForAvatarRecordIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__AVTStickerTaskScheduler_cancelStickerSheetTasksForAvatarRecordIdentifier___block_invoke;
  v6[3] = &unk_263FF2510;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(AVTStickerTaskScheduler *)self performStateWork:v6];
}

void __76__AVTStickerTaskScheduler_cancelStickerSheetTasksForAvatarRecordIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v6 removeObjectForKey:*(void *)(a1 + 32)];
  id v8 = [*(id *)(a1 + 40) logger];
  [v8 logStickerSchedulerCancelledStickerSheetTasksForIdentifier:*(void *)(a1 + 32)];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = objc_msgSend(*(id *)(a1 + 40), "logger", (void)v17);
        uint64_t v16 = [v14 description];
        [v15 logStickerSchedulerCancelledTask:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)cancelAllTasks
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__AVTStickerTaskScheduler_cancelAllTasks__block_invoke;
  v2[3] = &unk_263FF2538;
  v2[4] = self;
  [(AVTStickerTaskScheduler *)self performStateWork:v2];
}

void __41__AVTStickerTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [a2 removeAllObjects];
  [v11 removeAllObjects];

  [v10 removeAllObjects];
  [v9 removeAllObjects];

  id v12 = [*(id *)(a1 + 32) logger];
  [v12 logStickerSchedulerCancelledAllTasks];
}

- (void)reloadData
{
  id v12 = [MEMORY[0x263EFF980] array];
  id v3 = [(AVTStickerTaskScheduler *)self recordDataSource];
  objc_sync_enter(v3);
  id v4 = [(AVTStickerTaskScheduler *)self recordDataSource];
  uint64_t v5 = [v4 numberOfRecords];

  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(AVTStickerTaskScheduler *)self recordDataSource];
      id v8 = [v7 recordAtIndex:i];

      id v9 = [v8 identifier];
      [v12 addObject:v9];
    }
  }
  objc_sync_exit(v3);

  id v10 = [(AVTStickerTaskScheduler *)self allAvatarRecordIdentifiers];
  objc_sync_enter(v10);
  id v11 = (void *)[v12 copy];
  [(AVTStickerTaskScheduler *)self setAllAvatarRecordIdentifiers:v11];

  objc_sync_exit(v10);
}

- (void)setVisibleIndexPaths:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_22];
  [(AVTStickerTaskScheduler *)self setSortedVisibleIndexPaths:v4];
}

uint64_t __48__AVTStickerTaskScheduler_setVisibleIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)nextTaskToRunFromStickerPickerTasks:(id)a3 stickerPickerBacklogStorage:(id)a4 stickerSheetPlaceholderTasks:(id)a5 stickerSheetsTasks:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(AVTStickerTaskScheduler *)self selectedAvatarRecordIdentifier];
  id v15 = (void *)[v14 copy];

  uint64_t v16 = [(AVTStickerTaskScheduler *)self allAvatarRecordIdentifiers];
  long long v17 = (void *)[v16 copy];

  long long v18 = [(AVTStickerTaskScheduler *)self sortedVisibleIndexPaths];
  long long v19 = (void *)[v18 copy];

  long long v20 = [(AVTStickerTaskScheduler *)self selectedPickerThumbnailFromTasksStorage:v10 selectedAvatarRecordIdentifier:v15];
  if (!v20)
  {
    long long v20 = [(AVTStickerTaskScheduler *)self selectedSheetPlaceholderFromTasksStorage:v12 selectedAvatarRecordIdentifier:v15];
    if (!v20)
    {
      long long v20 = [(AVTStickerTaskScheduler *)self nextVisibleSelectedSheetStickerFromTasksStorage:v13 selectedAvatarRecordIdentifier:v15 visibleIndexPaths:v19];
      if (!v20)
      {
        long long v20 = [(AVTStickerTaskScheduler *)self nextPickerThumbnailFromTasksStorage:v10 allAvatarRecordIdentifiers:v17];
        if (!v20)
        {
          long long v20 = [(AVTStickerTaskScheduler *)self nextSelectedSheetStickerFromTasksStorage:v13 selectedAvatarRecordIdentifier:v15];
          if (!v20)
          {
            long long v20 = [(AVTStickerTaskScheduler *)self nextPickerThumbnailFromTasksBacklogStorage:v11 allAvatarRecordIdentifiers:v17];
            if (!v20)
            {
              long long v20 = [(AVTStickerTaskScheduler *)self nextSheetPlaceHolderFromTasksStorage:v12 allAvatarRecordIdentifiers:v17];
              if (!v20)
              {
                long long v20 = [(AVTStickerTaskScheduler *)self nextSheetStickerFromTasksStorage:v13 allAvatarRecordIdentifiers:v17];
              }
            }
          }
        }
      }
    }
  }
  id v21 = v20;

  return v21;
}

- (id)nextPickerThumbnailFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          if (v13)
          {
            id v14 = (void *)v13;
            id v15 = [(AVTStickerTaskScheduler *)self logger];
            uint64_t v16 = [v14 description];
            [v15 logStickerSchedulerStartedTask:v16 forSchedulerRule:@"next picker thumbnail"];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_12:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)nextPickerThumbnailFromTasksBacklogStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          if (v13)
          {
            id v14 = (void *)v13;
            id v15 = [(AVTStickerTaskScheduler *)self logger];
            uint64_t v16 = [v14 description];
            [v15 logStickerSchedulerStartedTask:v16 forSchedulerRule:@"next picker thumbnail"];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_12:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)selectedPickerThumbnailFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 objectForKeyedSubscript:v7];
    if (v8)
    {
      uint64_t v9 = [(AVTStickerTaskScheduler *)self logger];
      uint64_t v10 = [v8 description];
      [v9 logStickerSchedulerStartedTask:v10 forSchedulerRule:@"selected picker thumbnail"];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)selectedSheetPlaceholderFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 objectForKeyedSubscript:v7];
    if (v8)
    {
      uint64_t v9 = [(AVTStickerTaskScheduler *)self logger];
      uint64_t v10 = [v8 description];
      [v9 logStickerSchedulerStartedTask:v10 forSchedulerRule:@"selected sheet placeholder"];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)nextVisibleSelectedSheetStickerFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4 visibleIndexPaths:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] && objc_msgSend(v10, "count"))
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v9];
    if ([v11 count])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v12 = v10;
      uint64_t v30 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v30)
      {
        v29 = self;
        uint64_t v13 = *(void *)v40;
        v33 = v11;
        id v34 = v9;
        v32 = v12;
        uint64_t v28 = *(void *)v40;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v40 != v13) {
              objc_enumerationMutation(v12);
            }
            uint64_t v31 = v14;
            uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * v14);
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v16 = v11;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v36;
              while (2)
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v36 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  long long v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                  uint64_t v22 = [v21 indexPath];
                  char v23 = [v22 isEqual:v15];

                  if (v23)
                  {
                    uint64_t v25 = [(AVTStickerTaskScheduler *)v29 logger];
                    id v26 = [v21 description];
                    [v25 logStickerSchedulerStartedTask:v26 forSchedulerRule:@"next visible selected sheet sticker"];

                    id v24 = v21;
                    uint64_t v11 = v33;
                    id v9 = v34;
                    id v12 = v32;
                    goto LABEL_24;
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }

            uint64_t v14 = v31 + 1;
            uint64_t v11 = v33;
            id v9 = v34;
            id v12 = v32;
            uint64_t v13 = v28;
          }
          while (v31 + 1 != v30);
          id v24 = 0;
          uint64_t v30 = [v32 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v30);
      }
      else
      {
        id v24 = 0;
      }
LABEL_24:
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)nextSelectedSheetStickerFromTasksStorage:(id)a3 selectedAvatarRecordIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 objectForKeyedSubscript:v7];
    if ([v8 count])
    {
      id v9 = [v8 firstObject];
      if (v9)
      {
        id v10 = [(AVTStickerTaskScheduler *)self logger];
        uint64_t v11 = [v9 description];
        [v10 logStickerSchedulerStartedTask:v11 forSchedulerRule:@"next selected sheet sticker"];
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)nextSheetPlaceHolderFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            uint64_t v15 = [(AVTStickerTaskScheduler *)self logger];
            id v16 = [v14 description];
            [v15 logStickerSchedulerStartedTask:v16 forSchedulerRule:@"next sheet placeholder"];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)nextSheetStickerFromTasksStorage:(id)a3 allAvatarRecordIdentifiers:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
          if ([v13 count])
          {
            uint64_t v14 = [v13 firstObject];
            if (v14)
            {
              uint64_t v15 = (void *)v14;
              id v16 = [(AVTStickerTaskScheduler *)self logger];
              uint64_t v17 = [v15 description];
              [v16 logStickerSchedulerStartedTask:v17 forSchedulerRule:@"next sheet sticker"];

              goto LABEL_14;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v15 = 0;
LABEL_14:
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (NSMutableDictionary)stickerPickerTasks
{
  return self->_stickerPickerTasks;
}

- (NSMutableDictionary)stickerPickerBacklogTasks
{
  return self->_stickerPickerBacklogTasks;
}

- (NSMutableDictionary)stickerSheetPlaceholderTasks
{
  return self->_stickerSheetPlaceholderTasks;
}

- (NSMutableDictionary)stickerSheetsTasks
{
  return self->_stickerSheetsTasks;
}

- (AVTAvatarRecordDataSource)recordDataSource
{
  return self->_recordDataSource;
}

- (NSArray)allAvatarRecordIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAllAvatarRecordIdentifiers:(id)a3
{
}

- (NSString)selectedAvatarRecordIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelectedAvatarRecordIdentifier:(id)a3
{
}

- (NSArray)sortedVisibleIndexPaths
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSortedVisibleIndexPaths:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_sortedVisibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_selectedAvatarRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_allAvatarRecordIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordDataSource, 0);
  objc_storeStrong((id *)&self->_stickerSheetsTasks, 0);
  objc_storeStrong((id *)&self->_stickerSheetPlaceholderTasks, 0);
  objc_storeStrong((id *)&self->_stickerPickerBacklogTasks, 0);
  objc_storeStrong((id *)&self->_stickerPickerTasks, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end