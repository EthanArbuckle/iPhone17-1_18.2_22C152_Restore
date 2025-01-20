@interface MPLibraryKeepLocalStatusObserver
- (BOOL)_updateActiveDownloadsAllowingDownloadRemoval:(BOOL)a3;
- (MPLibraryActiveKeepLocalStatus)_calculateCurrentStatus;
- (MPLibraryActiveKeepLocalStatus)currentStatus;
- (MPLibraryKeepLocalStatusObserver)init;
- (MPLibraryKeepLocalStatusObserverConfiguration)configuration;
- (NSString)description;
- (id)_descriptionForStatusType:(int64_t)a3;
- (id)statusBlock;
- (unint64_t)downloadPausedReason;
- (void)_handleDownloadStateChanged:(id)a3;
- (void)_transientStateDidChangeNotification:(id)a3;
- (void)_updateCurrentStatus;
- (void)dealloc;
- (void)downloadManager:(id)a3 didChangeDownloadPausedReasonForAssets:(id)a4;
- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5;
- (void)downloadManager:(id)a3 didUpdateDownloadProgress:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setStatusBlock:(id)a3;
@end

@implementation MPLibraryKeepLocalStatusObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pausedDownloads, 0);

  objc_storeStrong((id *)&self->_activeDownloads, 0);
}

- (void)setStatusBlock:(id)a3
{
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (unint64_t)downloadPausedReason
{
  return self->_downloadPausedReason;
}

- (MPLibraryActiveKeepLocalStatus)currentStatus
{
  double downloadProgress = self->_currentStatus.downloadProgress;
  int64_t statusType = self->_currentStatus.statusType;
  result.double downloadProgress = downloadProgress;
  result.int64_t statusType = statusType;
  return result;
}

- (MPLibraryKeepLocalStatusObserverConfiguration)configuration
{
  return self->_configuration;
}

- (id)_descriptionForStatusType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return *(&off_1E57F09B8 + a3 - 1);
  }
}

- (void)_updateCurrentStatus
{
  int64_t v3 = [(MPLibraryKeepLocalStatusObserver *)self _calculateCurrentStatus];
  if (self->_currentStatus.statusType != v3 || vabdd_f64(self->_currentStatus.downloadProgress, v4) > 0.00000011920929)
  {
    self->_currentStatus.int64_t statusType = v3;
    self->_currentStatus.double downloadProgress = v4;
    id statusBlock = self->_statusBlock;
    if (statusBlock)
    {
      v6 = (void (*)(void))*((void *)statusBlock + 2);
      v6();
    }
  }
}

- (BOOL)_updateActiveDownloadsAllowingDownloadRemoval:(BOOL)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  double v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = [MEMORY[0x1E4F1CA80] set];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(MPLibraryKeepLocalStatusObserverConfiguration *)self->_configuration pendingItemIdentifiers];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = self->_configuration;
      if (([(MPLibraryKeepLocalStatusObserverConfiguration *)v7 isCollectionType] & 1) != 0
        || ([(MPLibraryKeepLocalStatusObserverConfiguration *)v7 identifyingModelObject],
            v8 = objc_claimAutoreleasedReturnValue(),
            [v8 identifiers],
            v9 = objc_claimAutoreleasedReturnValue(),
            v8,
            !v9))
      {
        v6 = 0;
      }
      else
      {
        v35[0] = v9;
        v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      }
    }
    else
    {
      v6 = 0;
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        unint64_t v29 = 0;
        v16 = +[MPMediaDownloadManager sharedManager];
        v17 = [v16 downloadForIdentifierSet:v15 downloadState:&v29];
        v18 = v17;
        if (v17)
        {
          if (v29 > 1)
          {
            if (v29 == 2)
            {
              [(NSSet *)v5 addObject:v17];
              self->_downloadPausedReason = [v18 downloadPausedReason];
            }
          }
          else if ((unint64_t)([v17 downloadReason] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            [(NSSet *)v4 addObject:v18];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }

  if (!a3)
  {
    uint64_t v19 = [(NSSet *)v4 count];
    activeDownloads = self->_activeDownloads;
    if (v19)
    {
      if ([(NSSet *)activeDownloads count]) {
        [(NSSet *)v4 unionSet:self->_activeDownloads];
      }
    }
    else
    {
      uint64_t v21 = [(NSSet *)activeDownloads mutableCopy];

      double v4 = (NSSet *)v21;
    }
  }
  v22 = self->_activeDownloads;
  if (v22 == v4 || [(NSSet *)v22 isEqualToSet:v4])
  {
    BOOL v23 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_activeDownloads, v4);
    BOOL v23 = 1;
  }
  pausedDownloads = self->_pausedDownloads;
  p_pausedDownloads = &self->_pausedDownloads;
  v24 = pausedDownloads;
  if (pausedDownloads != v5 && ![(NSSet *)v24 isEqualToSet:v5])
  {
    objc_storeStrong((id *)p_pausedDownloads, v5);
    BOOL v23 = 1;
  }

  return v23;
}

- (MPLibraryActiveKeepLocalStatus)_calculateCurrentStatus
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int64_t v3 = self->_activeDownloads;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "downloadProgress", (void)v28);
        double v7 = v7 + v9;
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  id v10 = [(MPLibraryKeepLocalStatusObserverConfiguration *)self->_configuration identifyingModelObject];
  if (v10)
  {
    uint64_t v11 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
    uint64_t v12 = [v11 transientKeepLocalStateForModelObject:v10];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    *(_DWORD *)buf = 138543874;
    long long v33 = self;
    __int16 v34 = 2048;
    uint64_t v35 = v12;
    __int16 v36 = 2114;
    v37 = configuration;
    _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Calculating current state with transient state %ld and configuration: %{public}@", buf, 0x20u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v19 = 0;
      goto LABEL_48;
    }
    uint64_t v15 = self->_configuration;
    if ([(MPLibraryKeepLocalStatusObserverConfiguration *)v15 hasNonPurgeableAsset])goto LABEL_22; {
    if ([(MPLibraryKeepLocalStatusObserverConfiguration *)v15 isCollectionType])
    }
    {
      uint64_t v20 = [(MPLibraryKeepLocalStatusObserverConfiguration *)v15 managedStatus];
      if (v20)
      {
        if (v20 != 1)
        {
          if (v20 != 2) {
            goto LABEL_40;
          }
LABEL_22:
          self->_double downloadProgress = 1.0;
          uint64_t v19 = 4;
          goto LABEL_47;
        }
LABEL_39:
        uint64_t v19 = 3;
        goto LABEL_47;
      }
    }
    else
    {
      if ([(NSSet *)self->_activeDownloads count])
      {
        self->_double downloadProgress = v7;
        goto LABEL_39;
      }
      if ([(NSSet *)self->_pausedDownloads count])
      {
        self->_double downloadProgress = 0.0;
        uint64_t v19 = 6;
        goto LABEL_47;
      }
      unint64_t v22 = [(MPLibraryKeepLocalStatusObserverConfiguration *)v15 managedStatus];
      if (v22 <= 5 && ((1 << v22) & 0x32) != 0)
      {
        uint64_t v19 = 2;
        goto LABEL_47;
      }
    }
    uint64_t v19 = [(MPLibraryKeepLocalStatusObserverConfiguration *)v15 isStoreRedownloadable];
    goto LABEL_47;
  }
  uint64_t v15 = self->_configuration;
  uint64_t v16 = [(MPLibraryKeepLocalStatusObserverConfiguration *)v15 redownloadableItemCount];
  uint64_t v17 = [(MPLibraryKeepLocalStatusObserverConfiguration *)v15 nonPurgeableItemCount];
  uint64_t v18 = [(MPLibraryKeepLocalStatusObserverConfiguration *)v15 downloadEnabledItemCount];
  if (!v16)
  {
    uint64_t v19 = 0;
    self->_double downloadProgress = 0.0;
    goto LABEL_47;
  }
  if (v17 >= v16) {
    goto LABEL_22;
  }
  if (v16 <= v18)
  {
    if (v18 >= 1)
    {
      double v21 = (v7 + (double)v17) / (double)v18;
      if (v21 > 1.0) {
        double v21 = 1.0;
      }
      self->_double downloadProgress = fmax(v21, 0.0);
      if (![(NSSet *)self->_activeDownloads count])
      {
        if (self->_downloadProgress <= 0.00000011920929) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 3;
        }
        goto LABEL_47;
      }
      goto LABEL_39;
    }
LABEL_40:
    uint64_t v19 = 0;
    goto LABEL_47;
  }
  uint64_t v19 = 1;
LABEL_47:

LABEL_48:
  if (v12 == 3)
  {
    if (v19 == 2) {
      uint64_t v19 = 1;
    }
  }
  else if (v12 == 1 && v19 == 1)
  {
    uint64_t v19 = 2;
  }
  BOOL v23 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [(MPLibraryKeepLocalStatusObserver *)self _descriptionForStatusType:v19];
    *(_DWORD *)buf = 138543874;
    long long v33 = self;
    __int16 v34 = 2048;
    uint64_t v35 = v19;
    __int16 v36 = 2114;
    v37 = v24;
    _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Returning keep-local status %ld (%{public}@)", buf, 0x20u);
  }
  double downloadProgress = self->_downloadProgress;

  int64_t v26 = v19;
  double v27 = downloadProgress;
  result.double downloadProgress = v27;
  result.int64_t statusType = v26;
  return result;
}

- (void)_handleDownloadStateChanged:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __64__MPLibraryKeepLocalStatusObserver__handleDownloadStateChanged___block_invoke;
    double v9 = &unk_1E57F9F98;
    id v10 = self;
    id v11 = v4;
    uint64_t v5 = (void (**)(void))MEMORY[0x19971E0F0](&v6);
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v6, v7, v8, v9, v10)) {
      v5[2](v5);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v5);
    }
  }
}

void __64__MPLibraryKeepLocalStatusObserver__handleDownloadStateChanged___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _updateActiveDownloadsAllowingDownloadRemoval:0] & 1) != 0
    || (v2 = *(void **)(*(void *)(a1 + 32) + 8),
        [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)],
        int64_t v3 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v2) = [v2 intersectsSet:v3],
        v3,
        v2))
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _updateCurrentStatus];
  }
}

- (void)_transientStateDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MPLibraryKeepLocalStatusObserver__transientStateDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__MPLibraryKeepLocalStatusObserver__transientStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStatus];
}

- (void)setConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (MPLibraryKeepLocalStatusObserverConfiguration *)a3;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating configuration: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  p_configuration = &self->_configuration;
  configuration = self->_configuration;
  if (configuration != v5 && ![(MPLibraryKeepLocalStatusObserverConfiguration *)configuration isEqual:v5])
  {
    double v9 = *p_configuration;
    objc_storeStrong((id *)&self->_configuration, a3);
    if (!*p_configuration || v9)
    {
      if (*p_configuration || !v9) {
        goto LABEL_12;
      }
      id v10 = +[MPMediaDownloadManager sharedManager];
      [v10 unregisterObserver:self];
    }
    else
    {
      id v10 = +[MPMediaDownloadManager sharedManager];
      [v10 registerObserver:self];
    }

LABEL_12:
    [(MPLibraryKeepLocalStatusObserver *)self _updateActiveDownloadsAllowingDownloadRemoval:1];
    [(MPLibraryKeepLocalStatusObserver *)self _updateCurrentStatus];
  }
}

- (void)downloadManager:(id)a3 didChangeDownloadPausedReasonForAssets:(id)a4
{
}

- (void)downloadManager:(id)a3 didUpdateDownloadProgress:(id)a4
{
}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__MPLibraryKeepLocalStatusObserver_downloadManager_didEnqueueAssetDownloads_didRemoveAssetDownloads___block_invoke;
  v6[3] = &unk_1E57F9EA8;
  v6[4] = self;
  uint64_t v5 = (void (**)(void))MEMORY[0x19971E0F0](v6, a2, a3, a4, a5);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v5[2](v5);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __101__MPLibraryKeepLocalStatusObserver_downloadManager_didEnqueueAssetDownloads_didRemoveAssetDownloads___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateActiveDownloadsAllowingDownloadRemoval:0];
  if (result)
  {
    int64_t v3 = *(void **)(a1 + 32);
    return [v3 _updateCurrentStatus];
  }
  return result;
}

- (NSString)description
{
  int64_t v3 = [(MPLibraryKeepLocalStatusObserverConfiguration *)self->_configuration identifyingModelObject];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v3 identifiers];
  v8 = [v7 library];
  double v9 = [v4 stringWithFormat:@"<%@ %p: [%@ %lld]>", v5, self, v6, objc_msgSend(v8, "persistentID")];

  return (NSString *)v9;
}

- (void)dealloc
{
  if (self->_configuration)
  {
    int64_t v3 = +[MPMediaDownloadManager sharedManager];
    [v3 unregisterObserver:self];
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
  [v4 removeObserver:self name:@"MPModelLibraryTransientStateControllerDidChangeNotification" object:v5];

  v6.receiver = self;
  v6.super_class = (Class)MPLibraryKeepLocalStatusObserver;
  [(MPLibraryKeepLocalStatusObserver *)&v6 dealloc];
}

- (MPLibraryKeepLocalStatusObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPLibraryKeepLocalStatusObserver;
  v2 = [(MPLibraryKeepLocalStatusObserver *)&v6 init];
  if (v2)
  {
    int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v4 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
    [v3 addObserver:v2 selector:sel__transientStateDidChangeNotification_ name:@"MPModelLibraryTransientStateControllerDidChangeNotification" object:v4];
  }
  return v2;
}

@end