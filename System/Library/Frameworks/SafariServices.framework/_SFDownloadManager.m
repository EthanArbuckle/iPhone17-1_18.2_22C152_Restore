@interface _SFDownloadManager
+ (id)defaultDownloadsHistoryURL;
+ (id)downloadRepresentationsAtURL:(id)a3;
+ (id)sharedManager;
- (BOOL)_canExpireDownloadOnCompletion:(id)a3;
- (BOOL)downloadShouldImportPlaceholderToDownloadsFolder:(id)a3;
- (BOOL)hasUnviewedDownloads;
- (BOOL)shouldExcludeDownloadFromFileSystem:(id)a3;
- (BOOL)shouldExcludeDownloadFromList:(id)a3;
- (NSArray)downloads;
- (NSDate)_lastUnviewedDownloadDate;
- (NSURL)downloadsRootURL;
- (_SFDownloadDelegate)extraDownloadDelegate;
- (_SFDownloadIconCache)iconCache;
- (double)_calculateTotalProgress;
- (double)totalProgress;
- (id)_busyDownloads;
- (id)_containerDirectoryForDownload:(id)a3;
- (id)_dataForPersistingToHistory;
- (id)initAsReadonly:(BOOL)a3;
- (unint64_t)runningDownloadsCount;
- (void)_addDownload:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_loadDownloadHistory;
- (void)_loadDownloadHistoryAsynchronous:(BOOL)a3;
- (void)_noteDownloadsChanged;
- (void)_removeDeletedDownloads;
- (void)_removeOldDownloadsAndUpdateTimerIfNeeded;
- (void)_setHasUnviewedDownloadsIfNeeded;
- (void)_setLastUnviewedDownloadDate:(id)a3;
- (void)_startUpdateTotalProgressTimerIfNeeded;
- (void)_updateTotalProgress:(id)a3;
- (void)createDirectoryForDownload:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)deferAddingDownloadWhenStarted:(id)a3;
- (void)didBeginViewingDownloads;
- (void)didEndViewingDownloads;
- (void)downloadContentsDidChange:(id)a3;
- (void)downloadDidFail:(id)a3;
- (void)downloadDidFinish:(id)a3;
- (void)downloadDidImportFileToDownloadsFolder:(id)a3;
- (void)downloadDidReceiveResponse:(id)a3;
- (void)downloadDidStart:(id)a3;
- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4;
- (void)downloadWillBeDeleted:(id)a3;
- (void)getDownloadsWithCompletionHandler:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadDownloadsSynchronously;
- (void)removeDownloads:(id)a3;
- (void)removeDownloadsStartedAfterDate:(id)a3;
- (void)savePendingChangesBeforeTermination;
- (void)setExtraDownloadDelegate:(id)a3;
- (void)setHasUnviewedDownloads:(BOOL)a3;
@end

@implementation _SFDownloadManager

- (double)totalProgress
{
  return self->_totalProgress;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_58);
  }
  v2 = (void *)sharedManager_manager;

  return v2;
}

- (void)setExtraDownloadDelegate:(id)a3
{
}

- (BOOL)hasUnviewedDownloads
{
  v2 = [(_SFDownloadManager *)self _lastUnviewedDownloadDate];
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safari_timeIntervalUntilNow");
    BOOL v5 = v4 < 28800.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSDate)_lastUnviewedDownloadDate
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  v3 = objc_msgSend(v2, "safari_dateForKey:", *MEMORY[0x1E4F78948]);

  return (NSDate *)v3;
}

- (id)initAsReadonly:(BOOL)a3
{
  v30.receiver = self;
  v30.super_class = (Class)_SFDownloadManager;
  double v4 = [(_SFDownloadManager *)&v30 init];
  if (v4)
  {
    BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    downloads = v4->_downloads;
    v4->_downloads = v5;

    v7 = objc_alloc_init(_SFDownloadIconCache);
    iconCache = v4->_iconCache;
    v4->_iconCache = v7;

    v4->_totalProgress = -2.0;
    v9 = _SFSafariContainerURL();
    uint64_t v10 = [v9 URLByAppendingPathComponent:@"Library/Safari/Downloads" isDirectory:1];
    downloadsRootURL = v4->_downloadsRootURL;
    v4->_downloadsRootURL = (NSURL *)v10;

    uint64_t v12 = [(NSURL *)v4->_downloadsRootURL URLByAppendingPathComponent:@"Downloads.plist" isDirectory:0];
    downloadHistoryURL = v4->_downloadHistoryURL;
    v4->_downloadHistoryURL = (NSURL *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    downloadsToDeferAdding = v4->_downloadsToDeferAdding;
    v4->_downloadsToDeferAdding = (NSMapTable *)v14;

    if (!a3)
    {
      objc_initWeak(&location, v4);
      id v16 = objc_alloc(MEMORY[0x1E4F98A48]);
      v17 = v4->_downloadHistoryURL;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __37___SFDownloadManager_initAsReadonly___block_invoke;
      v27 = &unk_1E5C78030;
      objc_copyWeak(&v28, &location);
      uint64_t v18 = [v16 initWithName:@"DownloadHistory" fileURL:v17 dataSourceBlock:&v24];
      historyWriter = v4->_historyWriter;
      v4->_historyWriter = (WBSCoalescedAsynchronousWriter *)v18;

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    v20 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults", v24, v25, v26, v27);
    [v20 addObserver:v4 forKeyPath:*MEMORY[0x1E4F78900] options:1 context:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v4 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:v4];

    [(_SFDownloadManager *)v4 _loadDownloadHistory];
    v22 = v4;
  }

  return v4;
}

- (void)_removeOldDownloadsAndUpdateTimerIfNeeded
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v3 doubleForKey:*MEMORY[0x1E4F78900]];
  double v5 = v4;

  [(NSTimer *)self->_removeDownloadsTimer invalidate];
  removeDownloadsTimer = self->_removeDownloadsTimer;
  self->_removeDownloadsTimer = 0;

  if (v5 >= 0.0)
  {
    v7 = [MEMORY[0x1E4F1C9C8] date];
    downloads = self->_downloads;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke;
    v35[3] = &unk_1E5C78138;
    id v9 = v7;
    id v36 = v9;
    double v37 = v5;
    uint64_t v10 = [(NSMutableArray *)downloads safari_filterObjectsUsingBlock:v35];
    if ([v10 count]) {
      [(_SFDownloadManager *)self removeDownloads:v10];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v11 = self->_downloads;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v12)
    {
      v13 = 0;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dateFinished];
          v17 = v16;
          if (v16 && (!v13 || [v16 compare:v13] == -1))
          {
            uint64_t v18 = v17;

            v13 = v18;
          }
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v12);

      if (!v13) {
        goto LABEL_19;
      }
      objc_initWeak(&location, self);
      [v9 timeIntervalSinceDate:v13];
      double v20 = v19;
      v21 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke_2;
      id v28 = &unk_1E5C733A8;
      objc_copyWeak(&v29, &location);
      uint64_t v22 = [v21 scheduledTimerWithTimeInterval:0 repeats:&v25 block:v5 - v20];
      uint64_t v24 = self->_removeDownloadsTimer;
      p_removeDownloadsTimer = (id *)&self->_removeDownloadsTimer;
      id *p_removeDownloadsTimer = (id)v22;

      objc_msgSend(*p_removeDownloadsTimer, "setTolerance:", v5 / 10.0, v25, v26, v27, v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      v13 = v11;
    }

LABEL_19:
  }
}

- (void)_loadDownloadHistory
{
}

- (void)_loadDownloadHistoryAsynchronous:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = self->_downloadHistoryURL;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__12;
  v24[4] = __Block_byref_object_dispose__12;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__12;
  v22[4] = __Block_byref_object_dispose__12;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke;
  v19[3] = &unk_1E5C78098;
  v19[4] = self;
  v19[5] = v22;
  v19[6] = v20;
  v6 = (void *)MEMORY[0x1AD0C36A0](v19);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_2;
  v12[3] = &unk_1E5C780E8;
  v15 = v24;
  v12[4] = self;
  v7 = v5;
  v13 = v7;
  id v16 = v22;
  v17 = v20;
  BOOL v18 = v3;
  id v8 = v6;
  id v14 = v8;
  uint64_t v9 = MEMORY[0x1AD0C36A0](v12);
  uint64_t v10 = (void *)v9;
  if (v3)
  {
    v11 = dispatch_get_global_queue(25, 0);
    dispatch_async(v11, v10);
  }
  else
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

- (NSArray)downloads
{
  v2 = (void *)[(NSMutableArray *)self->_downloads copy];

  return (NSArray *)v2;
}

+ (id)downloadRepresentationsAtURL:(id)a3
{
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3];
  double v4 = objc_msgSend(v3, "safari_arrayForKey:", @"DownloadHistory");
  double v5 = v4;
  if (!v4) {
    double v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

- (void)_removeDeletedDownloads
{
  id v3 = [(NSMutableArray *)self->_downloads safari_filterObjectsUsingBlock:&__block_literal_global_50];
  if ([v3 count]) {
    [(_SFDownloadManager *)self removeDownloads:v3];
  }
}

- (void)getDownloadsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_loadedDownloadHistory)
  {
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
  else if (self->_blockToExecuteWhenDownloadHistoryIsLoaded)
  {
    double v5 = (void *)MEMORY[0x1AD0C36A0]();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56___SFDownloadManager_getDownloadsWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5C73668;
    id v12 = v5;
    id v13 = v4;
    id v6 = v5;
    v7 = (void *)MEMORY[0x1AD0C36A0](v11);
    id blockToExecuteWhenDownloadHistoryIsLoaded = self->_blockToExecuteWhenDownloadHistoryIsLoaded;
    self->_id blockToExecuteWhenDownloadHistoryIsLoaded = v7;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1AD0C36A0](v4);
    id v10 = self->_blockToExecuteWhenDownloadHistoryIsLoaded;
    self->_id blockToExecuteWhenDownloadHistoryIsLoaded = v9;
  }
}

+ (id)defaultDownloadsHistoryURL
{
  v2 = _SFSafariContainerURL();
  id v3 = [v2 URLByAppendingPathComponent:@"/Library/Safari/Downloads/Downloads.plist" isDirectory:0];

  return v3;
}

- (void)dealloc
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v3 removeObserver:self forKeyPath:*MEMORY[0x1E4F78900]];

  v4.receiver = self;
  v4.super_class = (Class)_SFDownloadManager;
  [(_SFDownloadManager *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:*MEMORY[0x1E4F78900]])
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5C725B8;
    objc_copyWeak(&v15, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFDownloadManager;
    [(_SFDownloadManager *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v3 = [(_SFDownloadManager *)self _busyDownloads];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F98948] sharedLogger];
    [v5 didMoveToBackgroundWithNumberOfOnGoingDownloads:v4];
  }
}

- (id)_dataForPersistingToHistory
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NSMutableArray *)self->_downloads safari_mapObjectsUsingBlock:&__block_literal_global_40_0];
  id v6 = @"DownloadHistory";
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:0];

  return v4;
}

- (unint64_t)runningDownloadsCount
{
  v2 = [(NSMutableArray *)self->_downloads safari_filterObjectsUsingBlock:&__block_literal_global_44];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)reloadDownloadsSynchronously
{
}

- (void)savePendingChangesBeforeTermination
{
  if (self->_loadedDownloadHistory) {
    [(WBSCoalescedAsynchronousWriter *)self->_historyWriter completePendingWriteSynchronously];
  }
}

- (void)_noteDownloadsChanged
{
  [(WBSCoalescedAsynchronousWriter *)self->_historyWriter scheduleWrite];
  if (self->_loadedDownloadHistory)
  {
    [(_SFDownloadManager *)self _startUpdateTotalProgressTimerIfNeeded];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"_SFDownloadsDidChangeNotification" object:self];
  }
}

- (void)removeDownloads:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_downloads];
    [v5 intersectSet:v6];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend(v12, "cancel", (void)v13);
          [v12 removeDataAndPlaceholderFromDisk];
          [(NSMutableArray *)self->_downloads removeObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [(_SFDownloadManager *)self _noteDownloadsChanged];
  }
}

- (void)removeDownloadsStartedAfterDate:(id)a3
{
  id v4 = a3;
  downloads = self->_downloads;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54___SFDownloadManager_removeDownloadsStartedAfterDate___block_invoke;
  v8[3] = &unk_1E5C78110;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(NSMutableArray *)downloads safari_filterObjectsUsingBlock:v8];
  [(_SFDownloadManager *)self removeDownloads:v7];
}

- (void)_addDownload:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(_SFDownloadManager *)self shouldExcludeDownloadFromList:v5];
  if ((v4 & 1) == 0)
  {
    if (([(NSMutableArray *)self->_downloads containsObject:v5] & 1) == 0) {
      [(NSMutableArray *)self->_downloads insertObject:v5 atIndex:0];
    }
    [(_SFDownloadManager *)self _noteDownloadsChanged];
    uint64_t v4 = [(_SFDownloadManager *)self _removeOldDownloadsAndUpdateTimerIfNeeded];
  }

  MEMORY[0x1F4181820](v4);
}

- (void)deferAddingDownloadWhenStarted:(id)a3
{
}

- (BOOL)shouldExcludeDownloadFromFileSystem:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(_SFDownloadManager *)self shouldExcludeDownloadFromList:v4])
  {
    if ([v4 dataOwner] != 2)
    {
      BOOL v5 = 0;
      goto LABEL_15;
    }
    id v6 = [MEMORY[0x1E4F74230] sharedConnection];
    if ([v6 mayOpenFromManagedToUnmanaged])
    {
      if ([v6 mayOpenFromUnmanagedToManaged])
      {
        BOOL v5 = 0;
LABEL_14:

        goto LABEL_15;
      }
      id v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v4;
        uint64_t v8 = "Excluding %{public}@ from Files because Managed Configuration prohibits moving unmanaged content to managed destinations";
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v4;
        uint64_t v8 = "Excluding %{public}@ from Files because Managed Configuration prohibits moving managed content to unmanaged destinations";
LABEL_12:
        _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
      }
    }
    BOOL v5 = 1;
    goto LABEL_14;
  }
  BOOL v5 = 1;
LABEL_15:

  return v5;
}

- (BOOL)shouldExcludeDownloadFromList:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fileType];
  if ((unint64_t)(v4 - 3) < 5 || v4 == 1) {
    int v7 = [v3 explicitlySaved] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_busyDownloads
{
  return (id)[(NSMutableArray *)self->_downloads safari_filterObjectsUsingBlock:&__block_literal_global_56];
}

- (void)_startUpdateTotalProgressTimerIfNeeded
{
  if (![(NSTimer *)self->_updateTotalProgressTimer isValid])
  {
    id v3 = [(_SFDownloadManager *)self _busyDownloads];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      BOOL v5 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__updateTotalProgress_ selector:0 userInfo:1 repeats:0.2];
      updateTotalProgressTimer = self->_updateTotalProgressTimer;
      self->_updateTotalProgressTimer = v5;

      [(NSTimer *)self->_updateTotalProgressTimer setTolerance:1.0];
      int v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v7 addTimer:self->_updateTotalProgressTimer forMode:*MEMORY[0x1E4F1C4B0]];

      uint64_t v8 = self->_updateTotalProgressTimer;
      [(NSTimer *)v8 fire];
    }
  }
}

- (void)_updateTotalProgress:(id)a3
{
  [(_SFDownloadManager *)self _calculateTotalProgress];
  self->_totalProgress = v4;
  if (v4 == -2.0)
  {
    [(NSTimer *)self->_updateTotalProgressTimer invalidate];
    updateTotalProgressTimer = self->_updateTotalProgressTimer;
    self->_updateTotalProgressTimer = 0;
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"_SFDownloadManagerTotalProgressDidChangeNotification" object:self];
}

- (double)_calculateTotalProgress
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(_SFDownloadManager *)self _busyDownloads];
  if ([v2 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v17;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v3);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "bytesExpected", (void)v16);
          if (v12 != -1)
          {
            uint64_t v13 = v12;
            char v9 = 0;
            v6 += [v11 bytesLoaded];
            v7 += v13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);

      double v14 = -1.0;
      if ((v9 & 1) == 0)
      {
        if (v7) {
          double v14 = (double)v6 / (double)v7;
        }
        else {
          double v14 = 1.0;
        }
      }
    }
    else
    {

      double v14 = -1.0;
    }
  }
  else
  {
    double v14 = -2.0;
  }

  return v14;
}

- (BOOL)_canExpireDownloadOnCompletion:(id)a3
{
  return [a3 canReveal];
}

- (void)_setLastUnviewedDownloadDate:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  objc_msgSend(v3, "safari_browserDefaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v4 forKey:*MEMORY[0x1E4F78948]];
}

- (void)setHasUnviewedDownloads:(BOOL)a3
{
  int v3 = a3;
  int v5 = [(_SFDownloadManager *)self hasUnviewedDownloads];
  if (v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    [(_SFDownloadManager *)self _setLastUnviewedDownloadDate:v6];
  }
  else
  {
    [(_SFDownloadManager *)self _setLastUnviewedDownloadDate:0];
  }
  if (v5 != v3)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"_SFDownloadManagerHasUnviewedDownloadsDidChangeNotification" object:self];
  }
}

- (void)_setHasUnviewedDownloadsIfNeeded
{
  if (!self->_viewingDownloadsCount) {
    [(_SFDownloadManager *)self setHasUnviewedDownloads:1];
  }
}

- (void)didBeginViewingDownloads
{
}

- (void)didEndViewingDownloads
{
}

- (void)downloadDidFinish:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  [WeakRetained downloadDidFinish:v4];

  [(WBSCoalescedAsynchronousWriter *)self->_historyWriter scheduleWrite];
  [(_SFDownloadManager *)self _removeOldDownloadsAndUpdateTimerIfNeeded];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v6 doubleForKey:*MEMORY[0x1E4F78900]];
  double v8 = v7;

  if (v8 == -2.0 && [(_SFDownloadManager *)self _canExpireDownloadOnCompletion:v4])
  {
    v13[0] = v4;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(_SFDownloadManager *)self removeDownloads:v9];
  }
  else
  {
    [(_SFDownloadIconCache *)self->_iconCache regenerateIconForSource:v4];
  }
  int v10 = [(_SFDownloadManager *)self _busyDownloads];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"_SFDownloadManagerDidFinishLastDownloadNotification" object:self];
  }
  if ([(NSMutableArray *)self->_downloads containsObject:v4]) {
    [(_SFDownloadManager *)self _setHasUnviewedDownloadsIfNeeded];
  }
}

- (void)downloadDidFail:(id)a3
{
  p_extraDownloadDelegate = &self->_extraDownloadDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_extraDownloadDelegate);
  [WeakRetained downloadDidFail:v5];

  [(WBSCoalescedAsynchronousWriter *)self->_historyWriter scheduleWrite];

  [(_SFDownloadManager *)self _removeOldDownloadsAndUpdateTimerIfNeeded];
}

- (void)downloadDidStart:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  [WeakRetained downloadDidStart:v6];

  id v5 = [(NSMapTable *)self->_downloadsToDeferAdding objectForKey:v6];

  if (!v5) {
    [(_SFDownloadManager *)self _addDownload:v6];
  }
}

- (BOOL)downloadShouldImportPlaceholderToDownloadsFolder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v6 = [v5 BOOLForKey:*MEMORY[0x1E4F78908]];

  if (v6)
  {
    BOOL v7 = ![(_SFDownloadManager *)self shouldExcludeDownloadFromFileSystem:v4];
  }
  else
  {
    double v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    LOBYTE(v7) = 0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_DEFAULT, "Not importing to the Downloads folder because the internal setting is disabled", v10, 2u);
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)downloadDidImportFileToDownloadsFolder:(id)a3
{
  int v3 = [(_SFDownloadManager *)self _containerDirectoryForDownload:a3];
  id v4 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke;
  block[3] = &unk_1E5C724D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)downloadDidReceiveResponse:(id)a3
{
  id v5 = a3;
  -[_SFDownloadIconCache regenerateIconForSource:](self->_iconCache, "regenerateIconForSource:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained downloadDidReceiveResponse:v5];
  }
  [(WBSCoalescedAsynchronousWriter *)self->_historyWriter scheduleWrite];
}

- (id)_containerDirectoryForDownload:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 UUIDString];

  char v6 = [(NSURL *)self->_downloadsRootURL URLByAppendingPathComponent:v5 isDirectory:1];

  return v6;
}

- (void)createDirectoryForDownload:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(_SFDownloadManager *)self shouldExcludeDownloadFromList:v6])
  {
    v7[2](v7, 0);
  }
  else
  {
    double v8 = [(_SFDownloadManager *)self _containerDirectoryForDownload:v6];
    char v9 = dispatch_get_global_queue(25, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67___SFDownloadManager_createDirectoryForDownload_completionHandler___block_invoke;
    v11[3] = &unk_1E5C73380;
    id v12 = v8;
    uint64_t v13 = v7;
    id v10 = v8;
    dispatch_async(v9, v11);
  }
}

- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NSMapTable *)self->_downloadsToDeferAdding objectForKey:v6];

  if (v8)
  {
    [(NSMapTable *)self->_downloadsToDeferAdding removeObjectForKey:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83___SFDownloadManager_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke;
    v11[3] = &unk_1E5C74700;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    char v9 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v11);
  }
  else
  {
    char v9 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained downloadShouldContinueAfterReceivingResponse:v6 decisionHandler:v9];
  }
  else {
    v9[2](v9, 1);
  }
}

- (void)downloadContentsDidChange:(id)a3
{
}

- (void)downloadWillBeDeleted:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[_SFDownloadManager removeDownloads:](self, "removeDownloads:", v6, v7, v8);
}

- (NSURL)downloadsRootURL
{
  return self->_downloadsRootURL;
}

- (_SFDownloadDelegate)extraDownloadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extraDownloadDelegate);

  return (_SFDownloadDelegate *)WeakRetained;
}

- (_SFDownloadIconCache)iconCache
{
  return self->_iconCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_destroyWeak((id *)&self->_extraDownloadDelegate);
  objc_storeStrong((id *)&self->_downloadsRootURL, 0);
  objc_storeStrong((id *)&self->_updateTotalProgressTimer, 0);
  objc_storeStrong((id *)&self->_removeDownloadsTimer, 0);
  objc_storeStrong((id *)&self->_downloadsToDeferAdding, 0);
  objc_storeStrong(&self->_blockToExecuteWhenDownloadHistoryIsLoaded, 0);
  objc_storeStrong((id *)&self->_historyWriter, 0);
  objc_storeStrong((id *)&self->_downloadHistoryURL, 0);

  objc_storeStrong((id *)&self->_downloads, 0);
}

@end