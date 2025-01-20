@interface ATRestoreAssetLink
- (ATAssetLinkDelegate)delegate;
- (ATRestoreAssetLink)init;
- (ATRestoreAssetLinkDelegate)restoreDelegate;
- (BOOL)canEnqueueAsset:(id)a3;
- (BOOL)hasProperNetworkConditions;
- (BOOL)isOpen;
- (BOOL)linkIsReady;
- (BOOL)open;
- (NSArray)allowedDataClasses;
- (id)_currentCellularPolicy;
- (id)enqueueAssets:(id)a3 force:(BOOL)a4;
- (unint64_t)maximumBatchSize;
- (unint64_t)priority;
- (void)_processQueuedAssets;
- (void)cancelAssets:(id)a3;
- (void)close;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)finishRestore;
- (void)manager:(id)a3 didFailRestoreWithError:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidCancelRestore:(id)a3;
- (void)managerDidFinishRestore:(id)a3;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)processRestoreFailureForAsset:(id)a3;
- (void)restoreSessionActiveWithCompletion:(id)a3;
- (void)setAllowedDataClasses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRestoreDelegate:(id)a3;
@end

@implementation ATRestoreAssetLink

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_restoreDelegate);
  objc_storeStrong((id *)&self->_allowedDataClasses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_activeAssets, 0);
  objc_storeStrong((id *)&self->_queuedAssets, 0);
  objc_storeStrong((id *)&self->_restoreCellularPolicy, 0);

  objc_storeStrong((id *)&self->_mbManager, 0);
}

- (void)setRestoreDelegate:(id)a3
{
}

- (ATRestoreAssetLinkDelegate)restoreDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_restoreDelegate);

  return (ATRestoreAssetLinkDelegate *)WeakRetained;
}

- (void)setAllowedDataClasses:(id)a3
{
}

- (NSArray)allowedDataClasses
{
  return self->_allowedDataClasses;
}

- (void)setDelegate:(id)a3
{
}

- (ATAssetLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATAssetLinkDelegate *)WeakRetained;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (id)_currentCellularPolicy
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  restoreCellularPolicy = self->_restoreCellularPolicy;
  if (!restoreCellularPolicy)
  {
    mbManager = self->_mbManager;
    id v11 = 0;
    v5 = [(MBManager *)mbManager backgroundRestoreCellularAccessWithError:&v11];
    id v6 = v11;
    v7 = _ATLogCategoryRestore();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch restore cellular policy. err=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v5;
        _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "Loaded mobile device cellular policy %{public}@", buf, 0xCu);
      }

      v9 = v5;
      v8 = self->_restoreCellularPolicy;
      self->_restoreCellularPolicy = v9;
    }

    restoreCellularPolicy = self->_restoreCellularPolicy;
  }

  return restoreCellularPolicy;
}

- (void)_processQueuedAssets
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(ATRestoreAssetLink *)self hasProperNetworkConditions];
  v5 = _ATLogCategoryRestore();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      BOOL batchingIsSupported = self->_batchingIsSupported;
      BOOL singleAssetMode = self->_singleAssetMode;
      unint64_t batchSize = self->_batchSize;
      int v10 = [(NSMutableArray *)self->_queuedAssets count];
      int v11 = [(NSMutableArray *)self->_activeAssets count];
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v95 = batchingIsSupported;
      *(_WORD *)&v95[4] = 1024;
      *(_DWORD *)&v95[6] = singleAssetMode;
      LOWORD(v96) = 1024;
      *(_DWORD *)((char *)&v96 + 2) = batchSize;
      HIWORD(v96) = 1024;
      int v97 = v10;
      __int16 v98 = 1024;
      int v99 = v11;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "processing pending assets. _batchingIsSupported=%{BOOL}u, _singleAssetMode=%{BOOL}u, batch size=%d, _queuedAssets.count=%d, _activeAssets.count=%d", buf, 0x20u);
    }

    unint64_t v12 = [(NSMutableArray *)self->_activeAssets count];
    if (v12 > [(NSMutableArray *)self->_queuedAssets count])
    {
      v70 = [MEMORY[0x1E4F28B00] currentHandler];
      [v70 handleFailureInMethod:a2, self, @"ATRestoreAssetLink.m", 385, @"too many active assets. _activeAssets=%@", self->_activeAssets object file lineNumber description];
    }
    if (![(NSMutableArray *)self->_queuedAssets count])
    {
      self->_BOOL singleAssetMode = 0;
      return;
    }
    if (![(NSMutableArray *)self->_activeAssets count])
    {
      v71 = objc_opt_new();
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v13 = self->_queuedAssets;
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v87 objects:v93 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v88;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v88 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            v19 = [v18 dataclass];
            if ([v19 isEqualToString:@"Application"])
            {

LABEL_25:
              if (![(NSMutableArray *)self->_activeAssets count])
              {
                [(NSMutableArray *)self->_activeAssets addObject:v18];
                v23 = [v18 dataclass];
                int v24 = [v23 isEqualToString:@"Application"];

                if (v24) {
                  [v18 identifier];
                }
                else {
                v25 = [v18 path];
                }
                [v71 addObject:v25];
              }
              goto LABEL_30;
            }
            v20 = [v18 dataclass];
            int v21 = [v20 isEqualToString:@"Book"];

            if (v21) {
              goto LABEL_25;
            }
            [(NSMutableArray *)self->_activeAssets addObject:v18];
            v22 = [v18 path];
            [v71 addObject:v22];

            if (!self->_batchingIsSupported || self->_singleAssetMode) {
              goto LABEL_30;
            }
          }
          uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v87 objects:v93 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_30:

      v26 = _ATLogCategoryRestore();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(NSMutableArray *)self->_activeAssets count];
        *(_DWORD *)buf = 134217984;
        *(void *)v95 = v27;
        _os_log_impl(&dword_1D9A2D000, v26, OS_LOG_TYPE_DEFAULT, "starting restore of %lu assets:", buf, 0xCu);
      }

      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v28 = self->_activeAssets;
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v83 objects:v92 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v84;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v84 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v83 + 1) + 8 * j);
            v34 = _ATLogCategoryRestore();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)v95 = v33;
              _os_log_impl(&dword_1D9A2D000, v34, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
            }
          }
          uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v83 objects:v92 count:16];
        }
        while (v30);
      }

      v35 = [(NSMutableArray *)self->_activeAssets firstObject];
      v36 = [v35 dataclass];
      int v37 = [v36 isEqualToString:@"Application"];

      if (v37)
      {
        mbManager = self->_mbManager;
        v39 = [v71 firstObject];
        v82 = 0;
        char v40 = [(MBManager *)mbManager restoreApplicationWithBundleID:v39 failed:0 context:0 error:&v82];
        v41 = v82;
      }
      else
      {
        if (self->_batchingIsSupported)
        {
          v42 = [(NSMutableArray *)self->_activeAssets firstObject];
          v43 = [v42 dataclass];
          int v44 = [v43 isEqualToString:@"Book"];

          if (v44)
          {
            v45 = self->_mbManager;
            v46 = [v71 firstObject];
            id v81 = 0;
            char v47 = [(MBManager *)v45 restoreBookWithPath:v46 error:&v81];
            id v48 = v81;

            v49 = _ATLogCategoryRestore();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = [v71 firstObject];
              *(_DWORD *)buf = 138412546;
              *(void *)v95 = v50;
              *(_WORD *)&v95[8] = 2114;
              id v96 = v48;
              _os_log_impl(&dword_1D9A2D000, v49, OS_LOG_TYPE_DEFAULT, "restoreBookWithPath. path='%@' err=%{public}@", buf, 0x16u);
            }
            if (v47) {
              goto LABEL_69;
            }
            goto LABEL_59;
          }
          if (self->_batchingIsSupported)
          {
            v51 = self->_mbManager;
            id v80 = 0;
            char v52 = [(MBManager *)v51 restoreFilesWithPaths:v71 error:&v80];
            id v53 = v80;
            id v48 = v53;
            if ((v52 & 1) == 0)
            {
              v54 = [v53 domain];
              if ([v54 isEqualToString:@"MBErrorDomain"])
              {
                uint64_t v55 = [v48 code];

                if (v55 == 216)
                {
                  v56 = _ATLogCategoryRestore();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(void *)v95 = v48;
                    _os_log_impl(&dword_1D9A2D000, v56, OS_LOG_TYPE_DEFAULT, "restoreFilesWithPaths not supported - disabling batching. err=%{public}@", buf, 0xCu);
                  }

                  self->_BOOL batchingIsSupported = 0;
                  v57 = [(NSMutableArray *)self->_activeAssets firstObject];
                  [(NSMutableArray *)self->_activeAssets removeAllObjects];
                  [(NSMutableArray *)self->_activeAssets addObject:v57];
                  v58 = self->_mbManager;
                  v59 = [v57 path];
                  id v79 = v48;
                  LOBYTE(v58) = [(MBManager *)v58 restoreFileWithPath:v59 error:&v79];
                  id v60 = v79;

                  id v48 = v60;
                  if (v58) {
                    goto LABEL_69;
                  }
                }
              }
              else
              {
              }
              goto LABEL_59;
            }
LABEL_69:

            return;
          }
        }
        v61 = self->_mbManager;
        v39 = [v71 firstObject];
        v78 = 0;
        char v40 = [(MBManager *)v61 restoreFileWithPath:v39 error:&v78];
        v41 = v78;
      }
      id v48 = v41;

      if ((v40 & 1) == 0)
      {
LABEL_59:
        v62 = _ATLogCategoryRestore();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v95 = v48;
          _os_log_impl(&dword_1D9A2D000, v62, OS_LOG_TYPE_ERROR, "Failed to dispatch restore request. err=%{public}@", buf, 0xCu);
        }

        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v63 = self->_queuedAssets;
        uint64_t v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v74 objects:v91 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v75;
          do
          {
            for (uint64_t k = 0; k != v65; ++k)
            {
              if (*(void *)v75 != v66) {
                objc_enumerationMutation(v63);
              }
              uint64_t v68 = *(void *)(*((void *)&v74 + 1) + 8 * k);
              callbackQueue = self->_callbackQueue;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __42__ATRestoreAssetLink__processQueuedAssets__block_invoke;
              block[3] = &unk_1E6B88BB8;
              block[4] = self;
              block[5] = v68;
              id v73 = v48;
              dispatch_async(callbackQueue, block);
            }
            uint64_t v65 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v74 objects:v91 count:16];
          }
          while (v65);
        }

        [(NSMutableArray *)self->_activeAssets removeAllObjects];
        [(NSMutableArray *)self->_queuedAssets removeAllObjects];
        goto LABEL_69;
      }
      goto LABEL_69;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "not processing queued assets because restores are not allowed with current network conditions", buf, 2u);
    }
  }
}

void __42__ATRestoreAssetLink__processQueuedAssets__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28C58], "at_ATErrorFromError:", *(void *)(a1 + 48));
  [v5 assetLink:v2 didFinishAsset:v3 error:v4 retryable:1];
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_activeAssets count])
  {
    BOOL v4 = _ATLogCategoryRestore();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "Lost connection to backupd while restoring assets:", buf, 2u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_activeAssets;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          int v11 = _ATLogCategoryRestore();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v17 = v10;
            _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_activeAssets removeAllObjects];
    [(ATRestoreAssetLink *)self _processQueuedAssets];
  }
}

- (void)managerDidCancelRestore:(id)a3
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ATRestoreAssetLink_managerDidCancelRestore___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __46__ATRestoreAssetLink_managerDidCancelRestore___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) restoreDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 restoreAssetLinkDidCancelRestore:*(void *)(a1 + 32)];
  }
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _ATLogCategoryRestore();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(NSMutableArray *)self->_activeAssets count];
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = v7;
    __int16 v30 = 2114;
    id v31 = v5;
    _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "failed to restore %lu assets. err=%{public}@:", buf, 0x16u);
  }
  uint64_t v19 = v5;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_activeAssets;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v14 = _ATLogCategoryRestore();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v29 = v13;
          _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  if ([(ATRestoreAssetLink *)self hasProperNetworkConditions])
  {
    long long v15 = v19;
    if ([(NSMutableArray *)self->_activeAssets count] != 1)
    {
      self->_BOOL singleAssetMode = 1;
      goto LABEL_19;
    }
    uint64_t v16 = [(NSMutableArray *)self->_activeAssets firstObject];
    [(NSMutableArray *)self->_queuedAssets removeObject:v16];
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ATRestoreAssetLink_manager_didFailRestoreWithError___block_invoke;
    block[3] = &unk_1E6B88BB8;
    block[4] = self;
    id v21 = v16;
    id v22 = v19;
    v18 = v16;
    dispatch_async(callbackQueue, block);
  }
  else
  {
    v18 = _ATLogCategoryRestore();
    long long v15 = v19;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_DEFAULT, "no connectivity - waiting for wifi to retry", buf, 2u);
    }
  }

LABEL_19:
  [(NSMutableArray *)self->_activeAssets removeAllObjects];
  [(ATRestoreAssetLink *)self _processQueuedAssets];
}

void __54__ATRestoreAssetLink_manager_didFailRestoreWithError___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28C58], "at_ATErrorFromError:", *(void *)(a1 + 48));
  [v5 assetLink:v2 didFinishAsset:v3 error:v4 retryable:1];
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_activeAssets;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        callbackQueue = self->_callbackQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__ATRestoreAssetLink_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke;
        block[3] = &unk_1E6B88A50;
        block[4] = v12;
        void block[5] = self;
        float v15 = a4;
        dispatch_async(callbackQueue, block);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void __71__ATRestoreAssetLink_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) assetState] != 1)
  {
    [*(id *)(a1 + 32) setAssetState:1];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 96));
    uint64_t v3 = *(void *)(a1 + 40);
    v6[0] = *(void *)(a1 + 32);
    BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [WeakRetained assetLink:v3 didTransitionAssetStates:v4];
  }
  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 assetLink:*(void *)(a1 + 40) didUpdateAsset:*(void *)(a1 + 32) progress:*(float *)(a1 + 48)];
}

- (void)managerDidFinishRestore:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v4 = _ATLogCategoryRestore();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NSMutableArray *)self->_activeAssets count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v5;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "successfully restored %lu assets:", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_activeAssets;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = _ATLogCategoryRestore();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v11;
          _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_activeAssets;
  uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        long long v18 = [v17 dataclass];
        int v19 = [v18 isEqualToString:@"Application"];

        if (v19) {
          [v17 setCompletedAssetParts:2];
        }
        callbackQueue = self->_callbackQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __46__ATRestoreAssetLink_managerDidFinishRestore___block_invoke;
        block[3] = &unk_1E6B88B68;
        block[4] = self;
        void block[5] = v17;
        dispatch_async(callbackQueue, block);
      }
      uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  [(NSMutableArray *)self->_queuedAssets removeObjectsInArray:self->_activeAssets];
  [(NSMutableArray *)self->_activeAssets removeAllObjects];
  [(ATRestoreAssetLink *)self _processQueuedAssets];
}

void __46__ATRestoreAssetLink_managerDidFinishRestore___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLink:*(void *)(a1 + 32) didFinishAsset:*(void *)(a1 + 40) error:0 retryable:1];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ATRestoreAssetLink_environmentMonitorDidChangeNetworkReachability___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __69__ATRestoreAssetLink_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _processQueuedAssets];
  }
  return result;
}

- (unint64_t)priority
{
  return 50;
}

- (BOOL)linkIsReady
{
  return 1;
}

- (unint64_t)maximumBatchSize
{
  if (self->_batchingIsSupported) {
    return self->_batchSize;
  }
  else {
    return 1;
  }
}

- (void)cancelAssets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ATRestoreAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __35__ATRestoreAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([*(id *)(*(void *)(a1 + 40) + 32) containsObject:v7])
        {
          if ([*(id *)(*(void *)(a1 + 40) + 40) containsObject:v7])
          {
            id v8 = [v7 dataclass];
            int v9 = [v8 isEqualToString:@"Application"];

            uint64_t v10 = *(void *)(a1 + 40);
            uint64_t v11 = *(void **)(v10 + 8);
            if (v9)
            {
              uint64_t v12 = [v7 identifier];
              [v11 cancelApplicationRestoreWithBundleID:v12 error:0];
            }
            else
            {
              [*(id *)(v10 + 8) cancel];
            }
            [*(id *)(*(void *)(a1 + 40) + 40) removeObject:v7];
            [*(id *)(*(void *)(a1 + 40) + 32) removeObject:v7];
          }
          uint64_t v13 = *(void *)(a1 + 40);
          uint64_t v14 = *(NSObject **)(v13 + 72);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __35__ATRestoreAssetLink_cancelAssets___block_invoke_2;
          v16[3] = &unk_1E6B88B68;
          v16[4] = v13;
          v16[5] = v7;
          dispatch_async(v14, v16);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _processQueuedAssets];
}

void __35__ATRestoreAssetLink_cancelAssets___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
  [v5 assetLink:v3 didFinishAsset:v2 error:v4 retryable:1];
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v5 = a3;
  id v6 = [(ATRestoreAssetLink *)self allowedDataClasses];
  uint64_t v7 = [v5 dataclass];
  if ([v6 containsObject:v7]
    && [v5 isDownload]
    && [v5 isRestore])
  {
    id v8 = [v5 dataclass];
    char v9 = [v8 isEqualToString:@"Application"];
    if ((v9 & 1) != 0 || ([v5 path], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v10 = [v5 dataclass];
      if ([v10 isEqualToString:@"Application"]
        && [v5 assetParts] != 2)
      {
LABEL_15:

        BOOL v12 = 0;
        if (v9) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      uint64_t v11 = [v5 dataclass];
      if ([v11 isEqualToString:@"Application"])
      {

        BOOL v12 = 1;
        if (v9) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      uint64_t v14 = [v5 storeInfo];
      if (v14)
      {

        goto LABEL_15;
      }
      uint64_t v15 = [v5 storePlist];
      BOOL v12 = v15 == 0;

      if (v9)
      {
LABEL_20:

        goto LABEL_12;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ATRestoreAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E6B88BB8;
  block[4] = self;
  id v14 = v5;
  id v8 = v6;
  id v15 = v8;
  id v9 = v5;
  dispatch_sync(queue, block);
  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

uint64_t __42__ATRestoreAssetLink_enqueueAssets_force___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![*((id *)a1[4] + 4) count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = a1[5];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        objc_msgSend(*((id *)a1[4] + 4), "addObject:", v7, (void)v10);
        [a1[6] addObject:v7];
        unint64_t v8 = [*((id *)a1[4] + 4) count];
        if (v8 >= [a1[4] maximumBatchSize]) {
          break;
        }
        if (v4 == ++v6)
        {
          uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v4) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  return objc_msgSend(a1[4], "_processQueuedAssets", (void)v10);
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ATRestoreAssetLink_close__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __27__ATRestoreAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 88))
  {
    *(unsigned char *)(v1 + 88) = 0;
    [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:0];
    uint64_t v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v3 unregisterObserver:*(void *)(a1 + 32)];

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__ATRestoreAssetLink_close__block_invoke_2;
    block[3] = &unk_1E6B88B40;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __27__ATRestoreAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 assetLink:*(void *)(a1 + 32) didCloseWithOutstandingAssets:0];
  }
}

- (BOOL)open
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__ATRestoreAssetLink_open__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

void __26__ATRestoreAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 88))
  {
    id v2 = _ATLogCategoryRestore();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = *(unsigned __int8 *)(v3 + 49);
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v3;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ open. _batchingIsSupported=%{BOOL}u", buf, 0x12u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    uint64_t v5 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v5 registerObserver:*(void *)(a1 + 32)];

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__ATRestoreAssetLink_open__block_invoke_38;
    block[3] = &unk_1E6B88B40;
    block[4] = v6;
    dispatch_async(v7, block);
  }
}

void __26__ATRestoreAssetLink_open__block_invoke_38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 assetLink:*(void *)(a1 + 32) didOpenWithPendingAssets:0];
  }
}

- (BOOL)hasProperNetworkConditions
{
  uint64_t v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
  if ([v3 isRemoteServerLikelyReachable])
  {
    int v4 = [(ATRestoreAssetLink *)self _currentCellularPolicy];
    [v3 networkType];
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (v4) {
      char v6 = !IsCellular
    }
        || (![v3 isCurrentNetworkLinkExpensive]
         || [v4 allowsExpensiveNetworkAccess])
        && (![v3 isNetworkConstrained]
         || [v4 allowsConstrainedNetworkAccess]);
    else {
      char v6 = IsCellular ^ 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)processRestoreFailureForAsset:(id)a3
{
  id v13 = a3;
  if (([v13 isRestore] & 1) == 0)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ATRestoreAssetLink.m", 129, @"processRestoreFailureForAsset called with asset that is not a restore: %@", v13 object file lineNumber description];
  }
  id v5 = objc_alloc(MEMORY[0x1E4F78018]);
  char v6 = [v13 identifier];
  uint64_t v7 = [v13 dataclass];
  unint64_t v8 = [v13 assetType];
  id v9 = [v13 prettyName];
  uint64_t v10 = [v13 error];
  __int16 v11 = (void *)[v5 initWithIdentifier:v6 dataclass:v7 assetType:v8 displayName:v9 error:v10];

  [(MBManager *)self->_mbManager recordRestoreFailure:v11 error:0];
}

- (void)finishRestore
{
}

- (void)restoreSessionActiveWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke;
  v7[3] = &unk_1E6B88088;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryRestore();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(v3 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v3;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ currentRestoreState %d", buf, 0x12u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 48))
  {
    id v6 = *(void **)(v5 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_25;
    v12[3] = &unk_1E6B87930;
    v12[4] = v5;
    id v13 = *(id *)(a1 + 40);
    [v6 fetchiCloudRestoreIsCompleteWithCompletion:v12];
    uint64_t v7 = v13;
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    if (!v8) {
      return;
    }
    id v9 = *(NSObject **)(v5 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2_28;
    block[3] = &unk_1E6B885F0;
    id v11 = v8;
    dispatch_async(v9, block);
    uint64_t v7 = v11;
  }
}

void __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 80);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6B87908;
  id v10 = v5;
  uint64_t v11 = v6;
  char v13 = a2;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, v9);
}

uint64_t __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _ATLogCategoryRestore();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v6;
      __int16 v19 = 1024;
      int v20 = v5;
      __int16 v21 = 2114;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ mbManager reported restoreIsComplete:%d error=%{public}@", buf, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v9;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ mbManager reported restoreIsComplete:%d", buf, 0x12u);
  }

  if (!*(void *)(a1 + 32)) {
    *(unsigned char *)(*(void *)(a1 + 40) + 48) = *(unsigned char *)(a1 + 56) ^ 1;
  }
  id v10 = *(void **)(a1 + 48);
  if (v10)
  {
    uint64_t v11 = *(NSObject **)(*(void *)(a1 + 40) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_26;
    block[3] = &unk_1E6B88AC8;
    id v16 = v10;
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v12 = (id)v13.i64[0];
    int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
    dispatch_async(v11, block);
  }
}

uint64_t __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_26(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], *(unsigned __int8 *)(a1[4] + 48), a1[5]);
}

- (ATRestoreAssetLink)init
{
  v23.receiver = self;
  v23.super_class = (Class)ATRestoreAssetLink;
  uint64_t v2 = [(ATRestoreAssetLink *)&v23 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.atc.restorelink.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.atc.restorelink.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Photo", @"MessagePart", @"Book", @"VoiceMemo", @"File", 0);
    allowedDataClasses = v2->_allowedDataClasses;
    v2->_allowedDataClasses = (NSArray *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F78010]) initWithDelegate:v2 eventQueue:v2->_queue];
    mbManager = v2->_mbManager;
    v2->_mbManager = (MBManager *)v9;

    v2->_restoreState = 2;
    v2->_isRestoring = 1;
    uint64_t v11 = objc_opt_new();
    queuedAssets = v2->_queuedAssets;
    v2->_queuedAssets = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    activeAssets = v2->_activeAssets;
    v2->_activeAssets = (NSMutableArray *)v13;

    int8x16_t v15 = +[ATDeviceSettings sharedInstance];
    v2->_BOOL batchingIsSupported = [v15 restoreBatchingEnabled];

    id v16 = +[ATDeviceSettings sharedInstance];
    v2->_unint64_t batchSize = [v16 restoreBatchSize];

    v2->_BOOL singleAssetMode = 0;
    objc_initWeak(&location, v2);
    int v17 = (const char *)[(id)*MEMORY[0x1E4F78028] UTF8String];
    uint64_t v18 = v2->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __26__ATRestoreAssetLink_init__block_invoke;
    handler[3] = &unk_1E6B878E0;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v17, &v2->_mbCellularAccessChangedNotificationToken, v18, handler);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__ATRestoreAssetLink_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = _ATLogCategoryRestore();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_ERROR, "Restore cellular policy has changed - loading the new settings", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_queue_t v5 = (void *)WeakRetained[1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __26__ATRestoreAssetLink_init__block_invoke_18;
    v6[3] = &unk_1E6B878B8;
    uint64_t v7 = WeakRetained;
    [v5 fetchBackgroundRestoreCellularAccessWithCompletion:v6];
  }
}

void __26__ATRestoreAssetLink_init__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ATLogCategoryRestore();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch updated restore cellular policy. err=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded updated restore cellular policy %{public}@", buf, 0x16u);
    }

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[10];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __26__ATRestoreAssetLink_init__block_invoke_19;
    v12[3] = &unk_1E6B88B68;
    uint64_t v13 = v10;
    id v14 = v5;
    dispatch_async(v11, v12);

    uint64_t v8 = v13;
  }
}

void __26__ATRestoreAssetLink_init__block_invoke_19(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _processQueuedAssets];
  uint64_t v2 = *(void **)(a1 + 32);
  dispatch_queue_t v3 = v2[9];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__ATRestoreAssetLink_init__block_invoke_2;
  block[3] = &unk_1E6B88B40;
  id v5 = v2;
  dispatch_async(v3, block);
}

void __26__ATRestoreAssetLink_init__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) restoreDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 restoreAssetLinkNetworkPolicyDidChange:*(void *)(a1 + 32)];
  }
}

@end